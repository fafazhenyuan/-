<%--
  Created by IntelliJ IDEA.
  User: 吴珍缘
  Date: 2020/5/11
  Time: 1:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <%@ include file="/common.jsp" %>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${url}/lib/layui-v2.5.6/css/layui.css" media="all">
    <style type="text/css">
        .form{
            margin-top: 30px;
            margin-left: 20px;
            margin-right: 200px;
        }
        .layui-form .layui-form-label {
            width: 200px;
        }
    </style>
</head>
<body>

<form class="layui-form form layui-form-pane" lay-filter="logForm">

    <div class="layui-form-item">
        <label class="layui-form-label">选择要查询的日志日期</label>
        <div class="layui-input-inline" >
            <input type="text" class="layui-input" id="test1">
        </div>
    </div>


    <div class="layui-form-item">
        <button type="submit" class="layui-btn layui-btn-fluid" lay-submit lay-filter="demo1">立即查询</button>
    </div>
</form>

<div class="layui-collapse">
    <div class="layui-colla-item " lay-filter="text">
        <h2 class="layui-colla-title ">健康日志内容</h2>
        <div name="text" class="layui-colla-content layui-show" id="text"></div>
    </div>

    <div class="layui-colla-item">
        <h2 class="layui-colla-title">睡眠情况</h2>
        <div  class="layui-colla-content layui-show" id="sleep"></div>
    </div>

    <div class="layui-colla-item">
        <h2 class="layui-colla-title">心情</h2>
        <div class="layui-colla-content layui-show" id="mood"></div>
    </div>

    <div class="layui-colla-item">
        <h2 class="layui-colla-title">体重（公斤）</h2>
        <div class="layui-colla-content layui-show" id="weight"></div>
    </div>
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">吸烟数量</h2>
        <div class="layui-colla-content layui-show" id="cig"></div>
    </div>
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">压力情况</h2>
        <div class="layui-colla-content layui-show" id="pre"></div>
    </div>
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">高压（毫米汞柱）</h2>
        <div class="layui-colla-content layui-show" id="hig"></div>
    </div>
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">低压（毫米汞柱）</h2>
        <div class="layui-colla-content layui-show" id="low"></div>
    </div>
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">心率</h2>
        <div class="layui-colla-content layui-show" id="bs"></div>
    </div>
</div>



<script src="${url}/lib/layui-v2.5.6/layui.js" charset="utf-8"></script>
<script src="${url}/lib/jquery-3.4.1/jquery-3.4.1.min.js" charset="utf-8"></script>

<script>

    var text;
    var sleephour;
    var mood;
    var cigrette;
    var weight;
    var pressure;
    var bphigh;
    var bplow ;
    var bs ;
    layui.use(['element','laydate','form','layer'], function(){

        var layform = layui.form,
            element = layui.element;
        layer = layui.layer,
            laydate = layui.laydate,
            $=layui.jquery
        var da;



        //执行一个laydate实例
        laydate.render({
            elem: '#test1' //指定元素
            ,format: 'yyyy-MM-dd' //可任意组合
            // ,isInitValue: false //是否允许填充初始值，默认为 true
            ,max: 'new Date()'
            ,done: function(value, date, endDate){
                da = value;
            }
        });

        layform.on('submit(demo1)', function (data) {
            //表单数据formData
            var formData = data.field;
            var userId='${sessionScope.usersession.getUserId()}';

            $.ajax({
                url: "<%=basePath%>/log/selelog",
                type: "POST",
                data:{
                    "logData":da,
                    "userId":userId
                },
                success: function (resp) {


                    if($.isEmptyObject(resp)){

                        layer.msg('您所查询的日期无记录信息，请重新选择日期！', {
                            time: 20000, //20s后自动关闭
                            btn: ['明白了']

                            ,offset: [ //为了演示，随机坐标
                                ($(window).height()-650)
                                ,($(window).width()-1000)
                            ]
                        });

                    }


                    text = resp["text"];
                    sleephour = resp["sleephour"];
                    mood = resp["mood"];
                    cigrette = resp["cigrette"];
                    weight = resp["weight"];
                    pressure = resp["pressure"];
                    bphigh = resp["bphigh"];
                    bplow = resp["bplow"];
                    bs = resp["bs"];
                    document.getElementById("text").innerHTML = text;
                    document.getElementById("sleep").innerHTML = sleephour
                    document.getElementById("mood").innerHTML = mood;
                    document.getElementById("cig").innerHTML = cigrette;
                    document.getElementById("weight").innerHTML = weight;
                    document.getElementById("pre").innerHTML = pressure;
                    document.getElementById("hig").innerHTML = bphigh;
                    document.getElementById("low").innerHTML = bplow;
                    document.getElementById("bs").innerHTML = bs;

                }
            });
            return false;
        });


        //监听折叠
        element.on('collapse(test)', function(data){
            element.collapse(text,"888")
        });

    });


</script>







<c:if test="${empty sessionScope.usersession}">
    <script>
        alert("请先登录！");
        window.location = "login.jsp";
    </script>
</c:if>
</body>
</html>
