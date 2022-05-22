<%--
  Created by IntelliJ IDEA.
  User: YQF
  Date: 2019/9/28
  Time: 17:32
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>首页-汽车租赁系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="icon" href="${yeqifu}/static/favicon.ico">
    <link rel="stylesheet" href="${yeqifu}/static/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="${yeqifu}/static/css/index.css" media="all"/>
    <style>
        @font-face {
            font-family: "seraph";
            src: url('//at.alicdn.com/t/font_400842_q6tk84n9ywvu0udi.eot?t=1515415808033'); /* IE9*/
            src: url('//at.alicdn.com/t/font_400842_q6tk84n9ywvu0udi.eot?t=1515415808033#iefix') format('embedded-opentype'), /* IE6-IE8 */ url('data:application/x-font-woff;charset=utf-8;base64,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') format('woff'),
            url('//at.alicdn.com/t/font_400842_q6tk84n9ywvu0udi.ttf?t=1515415808033') format('truetype'), /* chrome, firefox, opera, Safari, Android, iOS 4.2+*/ url('//at.alicdn.com/t/font_400842_q6tk84n9ywvu0udi.svg?t=1515415808033#seraph') format('svg'); /* iOS 4.1- */
        }
        .seraph {
            font-family: "seraph" !important;
            font-size: 16px;
            font-style: normal;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }
        .icon-caidan:before {
            content: "\e606";
        }
    </style>
</head>
<body class="main_body">
<div class="layui-layout layui-layout-admin">
    <!-- 顶部 -->
    <div class="layui-header header">
        <div class="layui-main mag0">
            <a href="#" class="logo">汽车租赁</a>
            <!-- 显示/隐藏菜单 icon-caidan -->
            <a href="javascript:;" class="seraph hideMenu icon-caidan"></a>
            <!-- 顶部右侧菜单 -->
            <ul class="layui-nav top_menu">
<%--                <li class="layui-nav-item" pc>--%>
<%--                    <a href="javascript:;" class="clearCache">--%>
<%--                        <i class="layui-icon" data-icon="&#xe640;">&#xe640;</i><cite>清除缓存</cite>--%>
<%--                        <span class="layui-badge-dot"></span></a>--%>
<%--                </li>--%>
<%--                <li class="layui-nav-item lockcms" pc>--%>
<%--                    <a href="javascript:;"><i class="seraph icon-lock"></i><cite>锁屏</cite></a>--%>
<%--                </li>--%>
                <li class="layui-nav-item" id="userInfo">
<%--                    <a href="javascript:;"><img src="${yeqifu}/static/images/userface2.jpg" class="layui-nav-img userAvatar"--%>
<%--                                                width="35" height="35">--%>
                        <cite class="adminName" style="margin-right: 30px">${user.realname}</cite></a>
                    <dl class="layui-nav-child">
<%--                        <dd><a href="javascript:;" data-url="${yeqifu}/static/page/user/userInfo.html"><i--%>
<%--                                class="seraph icon-ziliao" data-icon="icon-ziliao"></i><cite>个人资料</cite></a></dd>--%>

                        <%--<dd><a href="${yeqifu}/sys/toChangePassword.action"><i class="seraph icon-xiugai" data-icon="icon-xiugai"></i><cite>修改密码<iframe src="/sys/toChangePassword.action"></iframe></cite></a></dd>--%>
                        <%--<dd><a href="../sys/toChangePassword.action"><i class="seraph icon-xiugai" data-icon="icon-xiugai"></i><cite>修改密码</cite></a></dd>--%>
                        <%--<dd><a href="javascript:;" data-url="${yeqifu}/static/page/user/changePwd.html"><i class="seraph icon-xiugai" data-icon="icon-xiugai"></i><cite>修改密码</cite></a></dd>--%>
                        <dd><a href="javascript:;" data-url="${yeqifu}/sys/toChangePassword.action"><i class="seraph icon-xiugai" data-icon="icon-xiugai"></i><cite>修改密码</cite></a></dd>

<%--                        <dd><a href="javascript:;" class="showNotice"><i--%>
<%--                                class="layui-icon">&#xe645;</i><cite>系统公告</cite><span--%>
<%--                                class="layui-badge-dot"></span></a></dd>--%>
<%--                        <dd pc><a href="javascript:;" class="functionSetting"><i class="layui-icon">&#xe620;</i><cite>功能设定</cite><span--%>
<%--                                class="layui-badge-dot"></span></a></dd>--%>
<%--                        <dd pc><a href="javascript:;" class="changeSkin"><i--%>
<%--                                class="layui-icon">&#xe61b;</i><cite>更换皮肤</cite></a></dd>--%>
                        <dd><a href="${yeqifu}" class="signOut"><i
                                class="seraph icon-tuichu"></i><cite>退出</cite></a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>
    <!-- 左侧导航 -->
    <div class="layui-side layui-bg-black">
<%--        <div class="user-photo">--%>
<%--            <a class="img" title="我的头像"><img src="${yeqifu}/static/images/userface2.jpg" class="userAvatar"></a>--%>
<%--            <p>你好！<span class="userName">${user.realname}</span>, 欢迎登录</p>--%>
<%--        </div>--%>
        <!-- 搜索 -->
<%--        <div class="layui-form component">--%>
<%--            <select name="search" id="search" lay-search lay-filter="searchPage">--%>
<%--                <option value="">搜索页面或功能</option>--%>
<%--                <option value="1">layer</option>--%>
<%--                <option value="2">form</option>--%>
<%--            </select>--%>
<%--            <i class="layui-icon">&#xe615;</i>--%>
<%--        </div>--%>
        <div class="navBar layui-side-scroll" id="navBar">
            <ul class="layui-nav layui-nav-tree">
                <li class="layui-nav-item layui-this">
                    <a href="javascript:;" data-url="${yeqifu}/static/page/main.html">
                        <i class="layui-icon" data-icon=""></i><cite>后台首页</cite></a>
                </li>
            </ul>
        </div>
    </div>
    <!-- 右侧内容 -->
    <div class="layui-body layui-form">
        <div class="layui-tab mag0" lay-filter="bodyTab" id="top_tabs_box">
            <ul class="layui-tab-title top_tab" id="top_tabs">
                <li class="layui-this" lay-id=""><i class="layui-icon">&#xe68e;</i> <cite>后台首页</cite></li>
            </ul>
            <ul class="layui-nav closeBox">
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="layui-icon caozuo">&#xe643;</i>页面操作</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" class="refresh refreshThis"><i class="layui-icon">&#xe669;</i>刷新当前</a></dd>
                        <dd><a href="javascript:;" class="closePageOther"><i class="seraph icon-prohibit"></i> 关闭其他</a></dd>
                        <dd><a href="javascript:;" class="closePageAll"><i class="seraph icon-guanbi"></i> 关闭全部</a></dd>
                    </dl>
                </li>
            </ul>
            <div class="layui-tab-content clildFrame">
                <div class="layui-tab-item layui-show">
                    <iframe src="${yeqifu}/desk/toDeskManager.action"></iframe>
                </div>
            </div>
        </div>
    </div>
    <!-- 底部 -->
    <div class="layui-footer footer">
        <p><span>copyright @2019 Luoyi</span></p>
    </div>
</div>

<!-- 移动导航 -->
<div class="site-tree-mobile"><i class="layui-icon">&#xe602;</i></div>
<div class="site-mobile-shade"></div>

<script type="text/javascript" src="${yeqifu}/static/layui/layui.js"></script>
<script type="text/javascript" src="${yeqifu}/static/js/cache.js"></script>
<script type="text/javascript">
    var $, tab, dataStr, layer;
    layui.config({
        base: "${yeqifu}/static/js/"
    }).extend({
        "bodyTab": "bodyTab"
    })
    layui.use(['bodyTab', 'form', 'element', 'layer', 'jquery'], function () {
        var form = layui.form,
            element = layui.element;
        $ = layui.$;
        layer = parent.layer === undefined ? layui.layer : top.layer;
        tab = layui.bodyTab({
            openTabNum: "50",  //最大可打开窗口数量
            url: "${yeqifu}/menu/loadIndexleftMenuJson.action" //获取菜单json地址
        });

        //通过顶部菜单获取左侧二三级菜单   注：此处只做演示之用，实际开发中通过接口传参的方式获取导航数据
        function getData(json) {
            $.getJSON(tab.tabConfig.url, function (data) {
                dataStr = data;
                //重新渲染左侧菜单
                tab.render();
            })
        }

        //页面加载时判断左侧菜单是否显示
        //通过顶部菜单获取左侧菜单
        $(".topLevelMenus li,.mobileTopLevelMenus dd").click(function () {
            if ($(this).parents(".mobileTopLevelMenus").length != "0") {
                $(".topLevelMenus li").eq($(this).index()).addClass("layui-this").siblings().removeClass("layui-this");
            } else {
                $(".mobileTopLevelMenus dd").eq($(this).index()).addClass("layui-this").siblings().removeClass("layui-this");
            }
            $(".layui-layout-admin").removeClass("showMenu");
            $("body").addClass("site-mobile");
            getData($(this).data("menu"));
            //渲染顶部窗口
            tab.tabMove();
        })

        //隐藏左侧导航
        $(".hideMenu").click(function () {
            if ($(".topLevelMenus li.layui-this a").data("url")) {
                layer.msg("此栏目状态下左侧菜单不可展开");  //主要为了避免左侧显示的内容与顶部菜单不匹配
                return false;
            }
            $(".layui-layout-admin").toggleClass("showMenu");
            //渲染顶部窗口
            tab.tabMove();
        })

        //通过顶部菜单获取左侧二三级菜单   注：此处只做演示之用，实际开发中通过接口传参的方式获取导航数据
        getData("contentManagement");

        //手机设备的简单适配
        $('.site-tree-mobile').on('click', function () {
            $('body').addClass('site-mobile');
        });
        $('.site-mobile-shade').on('click', function () {
            $('body').removeClass('site-mobile');
        });

        // 添加新窗口
        $("body").on("click", ".layui-nav .layui-nav-item a:not('.mobileTopLevelMenus .layui-nav-item a')", function () {
            //如果不存在子级
            if ($(this).siblings().length == 0) {
                addTab($(this));
                $('body').removeClass('site-mobile');  //移动端点击菜单关闭菜单层
            }
            $(this).parent("li").siblings().removeClass("layui-nav-itemed");
        })

        //清除缓存
        $(".clearCache").click(function () {
            window.sessionStorage.clear();
            window.localStorage.clear();
            var index = layer.msg('清除缓存中，请稍候', {icon: 16, time: false, shade: 0.8});
            setTimeout(function () {
                layer.close(index);
                layer.msg("缓存清除成功！");
            }, 1000);
        })

        //刷新后还原打开的窗口
        if (cacheStr == "true") {
            if (window.sessionStorage.getItem("menu") != null) {
                menu = JSON.parse(window.sessionStorage.getItem("menu"));
                curmenu = window.sessionStorage.getItem("curmenu");
                var openTitle = '';
                for (var i = 0; i < menu.length; i++) {
                    openTitle = '';
                    if (menu[i].icon) {
                        if (menu[i].icon.split("-")[0] == 'icon') {
                            openTitle += '<i class="seraph ' + menu[i].icon + '"></i>';
                        } else {
                            openTitle += '<i class="layui-icon">' + menu[i].icon + '</i>';
                        }
                    }
                    openTitle += '<cite>' + menu[i].title + '</cite>';
                    openTitle += '<i class="layui-icon layui-unselect layui-tab-close" data-id="' + menu[i].layId + '">&#x1006;</i>';
                    element.tabAdd("bodyTab", {
                        title: openTitle,
                        content: "<iframe src='" + menu[i].href + "' data-id='" + menu[i].layId + "'></frame>",
                        id: menu[i].layId
                    })
                    //定位到刷新前的窗口
                    if (curmenu != "undefined") {
                        if (curmenu == '' || curmenu == "null") {  //定位到后台首页
                            element.tabChange("bodyTab", '');
                        } else if (JSON.parse(curmenu).title == menu[i].title) {  //定位到刷新前的页面
                            element.tabChange("bodyTab", menu[i].layId);
                        }
                    } else {
                        element.tabChange("bodyTab", menu[menu.length - 1].layId);
                    }
                }
                //渲染顶部窗口
                tab.tabMove();
            }
        } else {
            window.sessionStorage.removeItem("menu");
            window.sessionStorage.removeItem("curmenu");
        }
    });

    //打开新窗口
    function addTab(_this) {
        tab.tabAdd(_this);
    }
</script>
</body>
</html>
