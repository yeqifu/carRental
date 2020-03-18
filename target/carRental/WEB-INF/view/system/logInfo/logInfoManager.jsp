<%--
  Created by IntelliJ IDEA.
  User: YQF
  Date: 2019/9/30
  Time: 22:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>日志管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <%--<link rel="icon" href="favicon.ico">--%>
    <link rel="stylesheet" href="${yeqifu}/static/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="${yeqifu}/static/css/public.css" media="all"/>
    <link rel="stylesheet" href="${yeqifu}/static/layui_ext/dtree/font/dtreefont.css">
</head>
<body class="childrenBody">

<!-- 搜索条件开始 -->
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>查询条件</legend>
</fieldset>
<form class="layui-form" method="post" id="searchFrm">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">登陆名称:</label>
            <div class="layui-input-inline" style="padding: 5px">
                <input type="text" name="loginname" autocomplete="off" class="layui-input layui-input-inline"
                       placeholder="请输入登陆名称" style="height: 30px;border-radius: 10px">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">登陆IP:</label>
            <div class="layui-input-inline" style="padding: 5px">
                <input type="text" name="loginip" autocomplete="off" class="layui-input layui-input-inline"
                       placeholder="请输入登陆IP" style="height: 30px;border-radius: 10px">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">开始时间:</label>
            <div class="layui-input-inline" style="padding: 5px">
                <input type="text" name="startTime" id="startTime" readonly="readonly" class="layui-input layui-input-inline"
                       placeholder="yyyy-MM-dd" style="height: 30px;border-radius: 10px">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">结束时间:</label>
            <div class="layui-input-inline" style="padding: 5px">
                <input type="text" name="endTime" id="endTime" readonly="readonly" class="layui-input layui-input-inline"
                       placeholder="yyyy-MM-dd" style="height: 30px;border-radius: 10px">
            </div>
        </div>

        <div class="layui-inline" style="margin-left: 50px">
            <button type="button" class="layui-btn layui-btn-normal layui-icon layui-icon-search layui-btn-radius layui-btn-sm" id="doSearch">查询</button>
            <button type="reset" class="layui-btn layui-btn-warm layui-icon layui-icon-refresh layui-btn-radius layui-btn-sm">重置</button>
        </div>
    </div>
</form>

<!-- 数据表格开始 -->
<table class="layui-hide" id="logInfoTable" lay-filter="logInfoTable"></table>
<div style="display: none;" id="logInfoToolBar">
    <button type="button" class="layui-btn layui-btn-danger layui-btn-sm layui-btn-radius" lay-event="deleteBatch">批量删除</button>
</div>
<div id="logInfoBar" style="display: none;">
    <a class="layui-btn layui-btn-danger layui-btn-xs layui-btn-radius" lay-event="del">删除</a>
</div>


<script src="${yeqifu}/static/layui/layui.js"></script>
<script type="text/javascript">
    var tableIns;
    layui.use(['jquery', 'layer', 'form', 'table','laydate'], function () {
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var table = layui.table;
        var laydate = layui.laydate;

        //渲染时间
        laydate.render({
            elem:'#startTime',
            type:'datetime'
        });
        laydate.render({
            elem:'#endTime',
            type:'datetime'
        });

        //渲染数据表格
        tableIns = table.render({
            elem: '#logInfoTable'   //渲染的目标对象
            , url: '${yeqifu}/logInfo/loadAllLogInfo.action' //数据接口
            , title: '用户数据表'//数据导出来的标题
            , toolbar: "#logInfoToolBar"   //表格的工具条
            , height: 'full-190'
            , cellMinWidth: 100 //设置列的最小默认宽度
            , page: true  //是否启用分页
            , cols: [[   //列表数据
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', title: 'ID', align: 'center'}
                , {field: 'loginname', title: '登陆名称', align: 'center'}
                , {field: 'loginip', title: '登陆IP', align: 'center'}
                , {field: 'logintime', title: '登陆时间', align: 'center'}
                , {fixed: 'right', title: '操作', toolbar: '#logInfoBar', align: 'center'}
            ]],
            done:function (data, curr, count) {
                //不是第一页时，如果当前返回的数据为0那么就返回上一页
                if(data.data.length==0&&curr!=1){
                    tableIns.reload({
                        page:{
                            curr:curr-1
                        }
                    })
                }
            }
        })

        //模糊查询
        $("#doSearch").click(function () {
            var params = $("#searchFrm").serialize();
            //alert(params);
            tableIns.reload({
                url: "${yeqifu}/logInfo/loadAllLogInfo.action?" + params,
                page:{curr:1}
            })
        });

        //监听头部工具栏事件
        table.on("toolbar(logInfoTable)", function (obj) {
            switch (obj.event) {
                case 'deleteBatch':
                    deleteBatch();
                    break;
            }
        });

        //监听行工具事件
        table.on('tool(logInfoTable)', function (obj) {
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if (layEvent === 'del') { //删除
                layer.confirm('真的删除【' + data.loginname + '】这个日志么？', function (index) {
                    //向服务端发送删除指令
                    $.post("${yeqifu}/logInfo/deleteLogInfo.action", {id: data.id}, function (res) {
                        layer.msg(res.msg);
                        //刷新数据表格
                        tableIns.reload();
                    })
                });
            }
        });

        //批量删除
        function deleteBatch() {
            //得到选中的数据行
            var checkStatus = table.checkStatus('logInfoTable');
            var data = checkStatus.data;
            var params="";
            $.each(data,function(i,item){
                if (i==0){
                    params+="ids="+item.id;
                }else{
                    params+="&ids="+item.id;
                }
            });
            layer.confirm('真的要删除这些日志么？', function (index) {
                //向服务端发送删除指令
                $.post("${yeqifu}/logInfo/deleteBatchLogInfo.action",params, function (res) {
                    layer.msg(res.msg);
                    //刷新数据表格
                    tableIns.reload();
                })
            });
        }

    });

</script>
</body>
</html>
