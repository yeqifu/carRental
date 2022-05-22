<%--
  Created by IntelliJ IDEA.
  User: YQF
  Date: 2019/9/30
  Time: 22:57
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>留言管理</title>
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
            <label class="layui-form-label">留言标题:</label>
            <div class="layui-input-inline" style="padding: 5px">
                <input type="text" name="title" autocomplete="off" class="layui-input layui-input-inline"
                       placeholder="请输入留言标题" style="height: 30px;border-radius: 10px">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">留言内容:</label>
            <div class="layui-input-inline" style="padding: 5px">
                <input type="text" name="content" autocomplete="off" class="layui-input layui-input-inline"
                       placeholder="请输入留言内容" style="height: 30px;border-radius: 10px">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">开始时间:</label>
            <div class="layui-input-inline" style="padding: 5px">
                <input type="text" name="startTime" id="startTime" readonly="readonly"
                       class="layui-input layui-input-inline"
                       placeholder="yyyy-MM-dd" style="height: 30px;border-radius: 10px">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">操作人:</label>
            <div class="layui-input-inline" style="padding: 5px">
                <input type="text" name="opername" id="opername" class="layui-input layui-input-inline"
                       style="height: 30px;border-radius: 10px">
            </div>
        </div>

        <div class="layui-inline" style="margin-left: 50px">
            <button type="button"
                    class="layui-btn layui-btn-normal layui-icon layui-icon-search layui-btn-radius layui-btn-sm"
                    id="doSearch">查询
            </button>
            <button type="reset"
                    class="layui-btn layui-btn-warm layui-icon layui-icon-refresh layui-btn-radius layui-btn-sm">重置
            </button>
        </div>
    </div>
</form>

<!-- 数据表格开始 -->
<table class="layui-hide" id="messageTable" lay-filter="messageTable"></table>
<div style="display: none;" id="messageToolBar">
    <button type="button" class="layui-btn layui-btn-sm layui-btn-radius" lay-event="add">增加</button>
    <button type="button" class="layui-btn layui-btn-danger layui-btn-sm layui-btn-radius" lay-event="deleteBatch">
        批量删除
    </button>
</div>
<div id="messageBar" style="display: none;">
    <a class="layui-btn layui-btn-xs layui-btn-radius" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-warm layui-btn-xs layui-btn-radius" lay-event="viewMessage">查看</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs layui-btn-radius" lay-event="del">删除</a>
</div>

<!-- 添加和修改的弹出层-->
<div style="display: none;padding: 20px" id="saveOrUpdateDiv">
    <form class="layui-form" lay-filter="dataFrm" id="dataFrm" style="margin-right: 20px">
        <div class="layui-form-item">
            <label class="layui-form-label">留言标题:</label>
            <div class="layui-input-block">
                <input type="hidden" name="id">
                <input type="text" name="title" placeholder="请输入留言标题" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">留言内容:</label>
            <div class="layui-input-block">
                <textarea class="ea llayui-textarayui-hide" name="content" lay-verify="content" id="content"></textarea>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block" style="text-align: center;padding-right: 120px">
                <button type="button"
                        class="layui-btn layui-btn-normal layui-btn-md layui-icon layui-icon-release layui-btn-radius"
                        lay-filter="doSubmit" lay-submit="">提交
                </button>
                <button type="reset" id="dataFrmResetBtn"
                        class="layui-btn layui-btn-warm layui-btn-md layui-icon layui-icon-refresh layui-btn-radius">重置
                </button>
            </div>
        </div>
    </form>
</div>

<%--查看留言的div--%>
<div id="viewMessageDiv" style="padding: 10px;display: none">
    <h2 id="view_title" align="center"></h2>
    <hr>
    <div style="text-align: right">
        发布人:<span id="view_opername"></span>
        <span style="display: inline-block;width: 20px"></span>
        发布时间:<span id="view_createtime"></span>
    </div>
    <hr>
    <div id="view_content"></div>
</div>

<script src="${yeqifu}/static/layui/layui.js"></script>
<script type="text/javascript">
    var tableIns;
    layui.use(['jquery', 'layer', 'form', 'table', 'laydate', 'layedit'], function () {
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var table = layui.table;
        var laydate = layui.laydate;
        var layedit = layui.layedit;

        //渲染时间
        laydate.render({
            elem: '#startTime',
            type: 'datetime'
        });
        laydate.render({
            elem: '#endTime',
            type: 'datetime'
        });

        layedit.set({
            uploadImage: {
                url: 'message/addMessage' //接口url
                ,type: 'post' //默认post
            }
        });

        editIndex = layedit.build(content,{
           tool:['strong' //加粗
               ,'italic' //斜体
               ,'underline' //下划线
               ,'del' //删除线
               ,'|' //分割线
               ,'left' //左对齐
               ,'center' //居中对齐
               ,'right' //右对齐
               ,'link' //超链接
               ,'unlink' //清除链接
               ,'face' //表情
               ,'image' //插入图片
               ,'help' //帮助
            ]
        });


        //初始化富文本编译器
        //var editIndex;

        //渲染数据表格
        tableIns = table.render({
            elem: '#messageTable'   //渲染的目标对象
            , url: '${yeqifu}/message/loadAllMessage.action' //数据接口
            , title: '留言数据表'//数据导出来的标题
            , toolbar: "#messageToolBar"   //表格的工具条
            , height: 'full-190'
            , cellMinWidth: 100 //设置列的最小默认宽度
            , page: true  //是否启用分页
            , cols: [[   //列表数据
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', title: 'ID', align: 'center'}
                , {field: 'title', title: '留言标题', align: 'center'}
                , {field: 'createtime', title: '发布时间', align: 'center'}
                , {field: 'opername', title: '发布人', align: 'center'}
                , {fixed: 'right', title: '操作', toolbar: '#messageBar', align: 'center'}
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
            //alert(params);
            tableIns.reload({
                url: "${yeqifu}/message/loadAllMessage.action?" + params,
                page: {curr: 1}
            })
        });

        //监听头部工具栏事件
        table.on("toolbar(messageTable)", function (obj) {
            switch (obj.event) {
                case 'add':
                    openAddMessage();
                    break;
                case 'deleteBatch':
                    deleteBatch();
                    break;
            }
        });

        //监听行工具事件
        table.on('tool(messageTable)', function (obj) {
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if (layEvent === 'del') { //删除
                layer.confirm('真的删除【' + data.title + '】这个留言么？', function (index) {
                    //向服务端发送删除指令
                    $.post("${yeqifu}/message/deleteMessage.action", {id: data.id}, function (res) {
                        layer.msg(res.msg);
                        //刷新数据表格
                        tableIns.reload();
                    })
                });
            } else if (layEvent === 'edit') { //编辑
                //编辑，打开修改界面
                openUpdateMessage(data);
            } else if (layEvent === 'viewMessage') {//查看
                viewMessage(data);
            }
        });

        var url;
        var mainIndex;

        //打开添加页面
        function openAddMessage() {
            mainIndex = layer.open({
                type: 1,
                title: '添加留言',
                content: $("#saveOrUpdateDiv"),
                area: ['700px', '540px'],
                success: function (index) {
                    //建立编译器
                    editIndex = layedit.build('content');
                    //清空表单数据
                    $("#dataFrm")[0].reset();
                    url = "${yeqifu}/message/addMessage.action";
                }
            });
        }

        $("#dataFrmResetBtn").click(function () {
            layedit.setContent(editIndex, "");
        });

        //打开修改页面
        function openUpdateMessage(data) {
            mainIndex = layer.open({
                type: 1,
                title: '修改留言',
                content: $("#saveOrUpdateDiv"),
                area: ['700px', '540px'],
                success: function (index) {
                    //建立编辑器
                    editIndex = layedit.build('content');
                    form.val("dataFrm", data);
                    url = "${yeqifu}/message/updateMessage.action";
                }
            });
        }

        //保存
        form.on("submit(doSubmit)", function (obj) {
            //把富文本里面的数据同步到自己写的textarea里面
            layedit.sync(editIndex);
            //序列化表单数据
            var params = $("#dataFrm").serialize();
            $.post(url, params, function (obj) {
                layer.msg(obj.msg);
                //关闭弹出层
                layer.close(mainIndex);
                //刷新数据 表格
                tableIns.reload();
            })
        });

        //查看
        function viewMessage(data) {
            mainIndex = layer.open({
                type: 1,
                title: '查看留言',
                content: $("#viewMessageDiv"),
                area: ['700px', '540px'],
                success: function (index) {
                    $("#view_title").html(data.title);
                    $("#view_opername").html(data.opername);
                    $("#view_createtime").html(data.createtime);
                    $("#view_content").html(data.content);
                }
            });
        }

        //批量删除
        function deleteBatch() {
            //得到选中的数据行
            var checkStatus = table.checkStatus('messageTable');
            var data = checkStatus.data;
            var params = "";
            $.each(data, function (i, item) {
                if (i == 0) {
                    params += "ids=" + item.id;
                } else {
                    params += "&ids=" + item.id;
                }
            });
            layer.confirm('真的要删除这些留言么？', function (index) {
                //向服务端发送删除指令
                $.post("${yeqifu}/message/deleteBatchMessage.action", params, function (res) {
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
