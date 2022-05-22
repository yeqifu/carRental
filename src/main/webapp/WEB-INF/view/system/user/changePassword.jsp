<%--
  Created by IntelliJ IDEA.
  User: yeqifu
  Date: 2021/5/11
  Time: 23:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>用户管理</title>
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
    <link rel="stylesheet" href="${yeqifu}/static/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="${yeqifu}/static/css/public.css" media="all"/>
</head>
<body  class="childrenBody">
<form class="layui-form layui-row changePwd">
    <div class="layui-col-xs12 layui-col-sm6 layui-col-md6">
        <div class="layui-form-item">
            <label class="layui-form-label">旧密码</label>
            <div class="layui-input-block">
                <input type="password" value="" id="oldPassword" name="oldPassword" placeholder="请输入旧密码" lay-verify="required|oldPwd" class="layui-input pwd">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">新密码</label>
            <div class="layui-input-block">
                <input type="password" value="" id="newPassword" name="newPassword" placeholder="请输入新密码" lay-verify="required|newPwd" id="oldPwd" class="layui-input pwd">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">确认密码</label>
            <div class="layui-input-block">
                <input type="password" value="" id="confirmPassword" name="confirmPassword" placeholder="请确认密码" lay-verify="required|confirmPwd" class="layui-input pwd">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="changePassword">立即修改</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </div>
</form>
<script src="${yeqifu}/static/layui/layui.js"></script>
<script type="text/javascript" src="../../user.js"></script>
<script type="text/javascript">
    layui.use(['jquery','form','layer'],function () {
        var $ = layui.jquery;
        var form = layui.form;
        var layer = layui.layer;

        form.on("submit(changePassword)",function () {
            var oldPassword = $("#oldPassword").val();
            var newPassword = $("#newPassword").val();
            var confirmPassword = $("#confirmPassword").val();
            if (newPassword!=confirmPassword){
                layer.alert("您输入的新密码和确认密码不一致！");
                return false;
            }
            layer.confirm('你确定要修改密吗？', {icon: 3, title: '提示'}, function (index) {
                $.post('${yeqifu}/user/changePassword.action',{oldPassword:oldPassword,newPassword:newPassword,confirmPassword:confirmPassword},function (res) {
                    layer.msg(res.msg);
                    if (res.code==200){
                        window.parent.location.reload();
                    }
                });
                layer.close(index);
            });
            return false;
        });

    });
</script>
</body>
</html>
