<%--
  Created by IntelliJ IDEA.
  Franchisee: YQF
  Date: 2019/10/14
  Time: 18:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>加盟商管理</title>
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
    <link rel="stylesheet" href="${yeqifu}/static/layui_ext/dtree/dtree.css">
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
            <label class="layui-form-label">加盟商姓名:</label>
            <div class="layui-input-inline" style="padding: 5px">
                <input type="text" name="name" autocomplete="off" class="layui-input layui-input-inline"
                       placeholder="请输入加盟商名称" style="height: 30px;border-radius: 10px">
            </div>
        </div>
        <div class="layui-inline">
            <button type="button"
                    class="layui-btn layui-btn-normal layui-icon layui-icon-search layui-btn-radius layui-btn-sm"
                    id="doSearch" style="margin-top: 4px">查询
            </button>
            <button type="reset"
                    class="layui-btn layui-btn-warm layui-icon layui-icon-refresh layui-btn-radius layui-btn-sm"
                    style="margin-top: 4px">重置
            </button>
        </div>
    </div>

</form>

<!-- 数据表格开始 -->
<table class="layui-hide" id="franchiseeTable" lay-filter="franchiseeTable"></table>
<div id="franchiseeToolBar" style="display: none;">
    <button type="button" class="layui-btn layui-btn-sm layui-btn-radius" lay-event="add">增加</button>
</div>
<div id="franchiseeBar" style="display: none;">
    <a class="layui-btn layui-btn-xs layui-btn-radius" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs layui-btn-radius" lay-event="del">删除</a>
</div>

<!-- 添加和修改的弹出层-->
<div style="display: none;padding: 20px" id="saveOrUpdateDiv">
    <form class="layui-form" lay-filter="dataFrm" id="dataFrm">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">加盟商姓名:</label>
                <div class="layui-input-inline">
                    <input type="hidden" name="id">
                    <input type="text" name="name" lay-verify="required" placeholder="请输入加盟商姓名" autocomplete="off"
                           class="layui-input">
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">加盟商电话:</label>
                    <div class="layui-input-inline">
                        <input type="text" name="phone" lay-verify="required|phone" placeholder="请输入加盟商电话" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block" style="text-align: center;padding-right: 120px">
                <button type="button"
                        class="layui-btn layui-btn-normal layui-btn-md layui-icon layui-icon-release layui-btn-radius"
                        lay-filter="doSubmit" lay-submit="">提交
                </button>
                <button type="reset"
                        class="layui-btn layui-btn-warm layui-btn-md layui-icon layui-icon-refresh layui-btn-radius">重置
                </button>
            </div>
        </div>
    </form>
</div>

<script src="${yeqifu}/static/layui/layui.js"></script>
<script type="text/javascript">
    var tableIns;
    layui.use(['jquery', 'layer', 'form', 'table'], function () {
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var table = layui.table;
        var dtree = layui.dtree;
        //渲染数据表格
        tableIns = table.render({
            elem: '#franchiseeTable'   //渲染的目标对象
            , url: '${yeqifu}/franchisee/loadAllFranchisee.action' //数据接口
            , title: '加盟商数据表'//数据导出来的标题
            , toolbar: "#franchiseeToolBar"   //表格的工具条
            , height: 'full-210'
            , cellMinWidth: 100 //设置列的最小默认宽度
            , page: true  //是否启用分页
            , cols: [[   //列表数据
                {type: 'checkbox', fixed: 'left'}
                , {field: 'name', title: '加盟商姓名', align: 'center', width: '300'}
                , {field: 'phone', title: '手机号码', align: 'center', width: '300'}
                , {fixed: 'right', title: '操作', toolbar: '#franchiseeBar', align: 'center', width: '200'}
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
        });

        //模糊查询
        $("#doSearch").click(function () {
            var params = $("#searchFrm").serialize();
            tableIns.reload({
                url: "${yeqifu}/franchisee/loadAllFranchisee.action?" + params,
                page: {curr: 1}
            })
        });

        //监听头部工具栏事件
        table.on("toolbar(franchiseeTable)", function (obj) {
            switch (obj.event) {
                case 'add':
                    openAddFranchisee();
                    break;
            }
        });

        //监听行工具事件
        table.on('tool(franchiseeTable)', function (obj) {
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if (layEvent === 'del') { //删除
                layer.confirm('真的删除【' + data.name + '】这个加盟商么？', function (index) {
                    //向服务端发送删除指令
                    $.post("${yeqifu}/franchisee/deleteFranchisee.action", {id: data.id}, function (res) {
                        layer.msg(res.msg);
                        //刷新数据表格
                        tableIns.reload();
                    })
                });
            } else if (layEvent === 'edit') { //编辑
                //编辑，打开修改界面
                openUpdateFranchisee(data);
            }
        });

        var url;
        var mainIndex;

        //打开添加页面
        function openAddFranchisee() {
            mainIndex = layer.open({
                type: 1,
                title: '添加加盟商',
                content: $("#saveOrUpdateDiv"),
                area: ['700px', '320px'],
                success: function (index) {
                    //清空表单数据
                    $("#dataFrm")[0].reset();
                    url = "${yeqifu}/franchisee/addFranchisee.action";
                }
            });
        }

        //打开修改页面
        function openUpdateFranchisee(data) {
            mainIndex = layer.open({
                type: 1,
                title: '修改加盟商',
                content: $("#saveOrUpdateDiv"),
                area: ['700px', '320px'],
                success: function (index) {
                    form.val("dataFrm", data);
                    url = "${yeqifu}/franchisee/updateFranchisee.action";
                }
            });
        }

        //保存
        form.on("submit(doSubmit)", function (obj) {
            //序列化表单数据
            var params = $("#dataFrm").serialize();
            $.post(url, params, function (obj) {
                layer.msg(obj.msg);
                //关闭弹出层
                layer.close(mainIndex)
                //刷新数据 表格
                tableIns.reload();
            })
        });

    });

</script>
</body>
</html>

