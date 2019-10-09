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
    <title>菜单树</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="icon" href="favicon.ico">
    <link rel="stylesheet" href="${yeqifu}/static/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="${yeqifu}/static/css/public.css" media="all"/>
    <link rel="stylesheet" href="${yeqifu}/static/layui_ext/dtree/dtree.css">
    <link rel="stylesheet" href="${yeqifu}/static/layui_ext/dtree/font/dtreefont.css">
</head>
<body class="main_body">

    <ul id="menuTree" class="dtree" data-id="0"></ul>

    <script type="text/javascript" src="${yeqifu}/static/layui/layui.js"></script>
    <script type="text/javascript">
        var menuTree;
        layui.extend({
            dtree: '${yeqifu}/static/layui_ext/dist/dtree'
        }).use(['jquery', 'layer', 'form', 'dtree'], function () {
            var $ = layui.jquery;
            var layer = layui.layer;
            var form = layui.form;
            var dtree = layui.dtree;

            // 初始化树
            menuTree = dtree.render({
                elem: "#menuTree",
                dataStyle: "layuiStyle",  //使用layui风格的数据格式
                response: {message: "msg", statusCode: 0},  //修改response中返回数据的定义
                dataFormat: "list",  //配置data的风格为list
                url: "${yeqifu}/menu/loadMenuManagerLeftTreeJson.action?spread=1" // 使用url加载（可与data加载同时存在）
            });

            //监听树的节点点击 事件
            dtree.on("node('menuTree')", function (obj) {
                var id = obj.param.nodeId;
                window.parent.right.reloadTable(id);
            });
        });
    </script>
</body>
</html>

