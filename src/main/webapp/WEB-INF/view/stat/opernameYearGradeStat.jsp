<%--
  Created by IntelliJ IDEA.
  User: YQF
  Date: 2019/10/22
  Time: 18:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>业务员年度业务统计</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="${yeqifu}/static/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="${yeqifu}/static/css/public.css" media="all"/>
</head>


<body style="height: 100%; margin: 0">
<!-- 搜索条件开始 -->
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>查询条件</legend>
</fieldset>

<form class="layui-form" method="post" id="searchFrm">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">选择年份:</label>
            <div class="layui-input-inline" style="padding: 5px">
                <input type="text" class="layui-input" id="year" readonly="readonly" placeholder="yyyy" style="height: 30px;border-radius: 10px">
            </div>
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
<div id="container" style="height: 75%;width: 90%"></div>
<script type="text/javascript" src="${yeqifu}/static/echarts/js/echarts.min.js"></script>
<script type="text/javascript" src="${yeqifu}/static/echarts/js/jquery-3.1.1.min.js"></script>
<script src="${yeqifu}/static/layui/layui.js"></script>
<script type="text/javascript">

    layui.use(['jquery', 'layer', 'form', 'table', 'laydate'], function () {
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var table = layui.table;
        var dtree = layui.dtree;
        var laydate = layui.laydate;

        laydate.render({
            elem: '#year',
            type: 'year',
            value:new Date()
        });

        $("#doSearch").click(function () {
            getData();
        });

        function getData() {
            var year = $("#year").val();
            if (year===""){
                year=new Date().getFullYear();
            }
            $.get("${yeqifu}/stat/loadOpernameYearGradeStatJson.action",{year:year},function (data) {
                var dom = document.getElementById("container");
                var myChart = echarts.init(dom);
                var app = {};
                option = null;
                app.title = '坐标轴刻度与标签对齐';

                option = {
                    title:{
                        text:'年度业务员销售额统计',
                        x:'center'
                    },
                    color: ['#3398DB'],
                    tooltip : {
                        trigger: 'axis',
                        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                        }
                    },
                    grid: {
                        top:'20%',
                        left: '3%',
                        right: '4%',
                        bottom: '1%',
                        containLabel: true
                    },
                    xAxis : [
                        {
                            type : 'category',
                            data : data.name,
                            axisTick: {
                                alignWithLabel: true
                            }
                        }
                    ],
                    yAxis : [
                        {
                            type : 'value'
                        }
                    ],
                    series : [
                        {
                            name:'销售额',
                            type:'bar',
                            barWidth: '30%',
                            data:data.value
                        }
                    ]
                };
                ;
                if (option && typeof option === "object") {
                    myChart.setOption(option, true);
                }
            });
        }
        getData();
    });

</script>
</body>
</html>
