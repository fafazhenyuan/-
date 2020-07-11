<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>

<html>
<head>
    <meta charset="utf-8">
    <title>登陆界面</title>
<%--    <style>--%>
<%--        html {--%>
<%--            background-image: url(<%=basePath%>/images/demo-1-bg.jpg);--%>
<%--        }--%>
<%--        .wrapper {--%>
<%--            margin: 140px 0 140px auto;--%>
<%--            width: 884px;--%>
<%--        }--%>
<%--        .loginBox {--%>
<%--            background-color: #F0F4F6;--%>
<%--            border: 1px solid #BfD6E1;--%>
<%--            border-radius: 5px;--%>
<%--            color: #444;--%>
<%--            font: 14px 'Microsoft YaHei', '微软雅黑';--%>
<%--            margin: 0 auto;--%>
<%--            width: 388px--%>
<%--        }--%>
<%--        .loginBox .loginBoxCenter {--%>
<%--            border-bottom: 1px solid #DDE0E8;--%>
<%--            padding: 24px;--%>
<%--        }--%>

<%--        .loginBox .loginBoxCenter p {--%>
<%--            margin-bottom: 10px--%>
<%--        }--%>
<%--        .loginBox .loginBoxButtons {--%>
<%--            border-top: 0px solid #FFF;--%>
<%--            border-bottom-left-radius: 5px;--%>
<%--            border-bottom-right-radius: 5px;--%>
<%--            line-height: 28px;--%>
<%--            overflow: hidden;--%>
<%--            padding: 20px 24px;--%>
<%--            vertical-align: center;--%>
<%--            filter: alpha(Opacity=80);--%>
<%--            -moz-opacity: 0.5;--%>
<%--            opacity: 0.5;--%>
<%--        }--%>
<%--        .loginBox .loginInput {--%>
<%--            border: 1px solid #D2D9dC;--%>
<%--            border-radius: 2px;--%>
<%--            color: #444;--%>
<%--            font: 12px 'Microsoft YaHei', '微软雅黑';--%>
<%--            padding: 8px 14px;--%>
<%--            margin-bottom: 8px;--%>
<%--            width: 310px;--%>
<%--        }--%>
<%--        .loginBox .loginInput:FOCUS {--%>
<%--            border: 1px solid #B7D4EA;--%>
<%--            box-shadow: 0 0 8px #B7D4EA;--%>
<%--        }--%>
<%--        .loginBox .loginBtn {--%>
<%--            background-image: -moz-linear-gradient(to bottom, blue, #85CFEE);--%>
<%--            border: 1px solid #98CCE7;--%>
<%--            border-radius: 20px;--%>
<%--            box-shadow: inset rgba(255, 255, 255, 0.6) 0 1px 1px, rgba(0, 0, 0, 0.1) 0 1px 1px;--%>
<%--            color: #444;--%>
<%--            cursor: pointer;--%>
<%--            float: right;--%>
<%--            font: bold 13px Arial;--%>
<%--            padding: 10px 50px;--%>
<%--        }--%>
<%--        .loginBox .loginBtn:HOVER {--%>
<%--            background-image: -moz-linear-gradient(to top, blue, #85CFEE);--%>
<%--        }--%>
<%--        .loginBox a.forgetLink {--%>
<%--            color: #ABABAB;--%>
<%--            cursor: pointer;--%>
<%--            float: right;--%>
<%--            font: 11px/20px Arial;--%>
<%--            text-decoration: none;--%>
<%--            vertical-align: middle;--%>

<%--        }--%>
<%--        .loginBox a.forgetLink:HOVER {--%>
<%--            color: #000000;--%>
<%--            text-decoration: none;--%>

<%--        }--%>
<%--        .loginBox input#remember {--%>
<%--            vertical-align: middle;--%>
<%--        }--%>
<%--        .loginBox label[for="remember"] {--%>
<%--            font: 11px Arial;--%>
<%--        }--%>
<%--    </style>--%>
<%--    <script src="https://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>--%>
<%--    <link href="../jquery.fancyspinbox.css" rel="stylesheet" type="text/css">--%>
<%--    <script src="${url}/js/common.js" type="text/javascript"></script>--%>
</head>
<%--<body style="adding: 20px; background-image: url(images/demo-1-bg.jpg)">--%>
<body style="padding: 20px;">
<%  response.sendRedirect("login.jsp"); %>
<%--<div class="login-main">--%>
<%--    <header class="layui-elip">登录</header>--%>
<%--    <form class="layui-form">--%>
<%--        <div class="layui-input-inline">--%>
<%--            <input type="text" name="account" required lay-verify="required" placeholder="用户名" autocomplete="off"--%>
<%--                   class="layui-input">--%>
<%--        </div>--%>
<%--        <div class="layui-input-inline">--%>
<%--            <input type="password" name="password" required lay-verify="required" placeholder="密码" autocomplete="off"--%>
<%--                   class="layui-input">--%>
<%--        </div>--%>
<%--        <div class="layui-input-inline login-btn">--%>
<%--            <button lay-submit lay-filter="login" class="layui-btn">登录</button>--%>
<%--        </div>--%>
<%--        <hr/>--%>
<%--        <!--<div class="layui-input-inline">--%>
<%--            <button type="button" class="layui-btn layui-btn-primary">QQ登录</button>--%>
<%--        </div>--%>
<%--        <div class="layui-input-inline">--%>
<%--            <button type="button" class="layui-btn layui-btn-normal">微信登录</button>--%>
<%--        </div>-->--%>
<%--        <p><a href="register.html" class="fl">立即注册</a><a href="javascript:;" class="fr">忘记密码？</a></p>--%>
<%--    </form>--%>
<%--</div>--%>
<%--<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">--%>
<%--    <legend>登录</legend>--%>
<%--</fieldset>--%>
<%--<div class="wrapper">--%>
<%--    <form class="layui-form layui-form-pane" method="post" id = "downloadDocId">--%>
<%--        <div class="layui-form-item">--%>
<%--            <label class="layui-form-label">用户账号</label>--%>
<%--            <div class="layui-input-inline">--%>
<%--                <input type="username" name="uaername" required  lay-verify="username" placeholder="请输入用户" autocomplete="off" class="layui-input">--%>
<%--            </div>--%>
<%--            <i class="layui-icon" style="font-size: 30px; color: #1E9FFF;"></i>--%>
<%--        </div>--%>
<%--        <div class="layui-form-item">--%>
<%--            <label class="layui-form-label">用户密码</label>--%>
<%--            <div class="layui-input-inline">--%>
<%--                <input type="password" name="password" required lay-verify="password" placeholder="请输入密码" autocomplete="off" class="layui-input">--%>
<%--            </div>--%>
<%--            <i class="layui-icon layui-icon-password" style="font-size: 30px; color: #1E9FFF;"></i>--%>
<%--        </div>--%>
<%--        <div class="layui-form-item">--%>
<%--            <div class="layui-input-block">--%>
<%--                <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>--%>
<%--                <button type="reset" class="layui-btn layui-btn-primary">重置</button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <table>--%>
<%--            <div class="loginBox">--%>
<%--                <div class="loginBoxCenter">--%>
<%--                    <p><label for="username">用户名：</label></p>--%>
<%--                    <p><input type="text" id="username" name="username" class="loginInput" autofocus="autofocus" required="required" autocomplete="off" placeholder="请输入账号" value="" /></p>--%>
<%--                    <p id="msage" hidden color="red">用户名不存在</p>--%>
<%--                    <!-- required 规定必需在提交之前填写输入字段-->--%>
<%--                    <p><label for="password">密码：</label></p>--%>
<%--                    <p><input type="password" id="password" name="password" class="loginInput" required="required" placeholder="请输入密码" value="" /></p>--%>

<%--                    <label class="item item-radio">--%>
<%--                        <input type="radio" name="group" value="admin" checked="checked">--%>
<%--                        管理员--%>
<%--                    </label>--%>
<%--                    <label class="item item-radio">--%>
<%--                        <input type="radio" name="group" value="user" >--%>
<%--                        用户--%>
<%--                    </label>--%>


<%--                </div>--%>
<%--                <div class="loginBoxButtons">--%>
<%--                    <button class="loginBtn" onclick="login()" >登录</button>--%>
<%--                    <button class="registerBtn" onclick="register()" >注册</button>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </table>--%>
<%--    </form>--%>
<%--</div>--%>
</body>

<%--<script>--%>
<%--    function login() {--%>
<%--        var r = document.getElementsByName('group');--%>
<%--        var password = document.getElementById("password").value;--%>
<%--        var username = document.getElementById("username").value;--%>
<%--        if(password == ""||username == "") {--%>
<%--            alert("请输入用户名或密码");--%>
<%--        }--%>
<%--        else {--%>
<%--            if (r[0].checked) {--%>
<%--                document.getElementById("downloadDocId").action = "<%=basePath%>/manager/login";--%>
<%--                document.getElementById("downloadDocId").submit();--%>
<%--            }--%>
<%--            else if (r[1].checked) {--%>
<%--                document.getElementById("downloadDocId").action = "<%=basePath%>/user/login";--%>
<%--                document.getElementById("downloadDocId").submit();--%>
<%--            }--%>

<%--        }--%>
<%--    }--%>
<%--    function register() {--%>
<%--        window.location.href='register.jsp';--%>
<%--    }--%>
<%--</script>--%>
<%--<script src="<%=basePath%>/js/index/TweenLite.min.js"></script>--%>
<%--<script src="<%=basePath%>/js/index/EasePack.min.js"></script>--%>
<%--<script src="<%=basePath%>/js/index/rAF.js"></script>--%>
<%--<script src="<%=basePath%>/js/index/demo-1.js"></script>--%>
<%--<script>--%>
<%--    $(function(){--%>
<%--            $("#username").keyup(function()--%>
<%--            {--%>
<%--                var username=$(this).val();--%>
<%--                $.ajax({--%>
<%--                    url: "<%=basePath%>/user/validate",--%>
<%--                    type: "POST",--%>
<%--                    data: {"name": username},--%>
<%--                    success: function (result) {--%>
<%--                        if (result) {--%>

<%--                            $("#msage").hide();--%>
<%--                        } else {--%>
<%--                            $("#msage").show();--%>
<%--                        }--%>
<%--                    }--%>
<%--                })--%>
<%--            })--%>
<%--        })--%>
<%--    layui.use('form', function(){--%>
<%--        var  form=layui.form;--%>
<%--        //监听提交--%>
<%--        form.on('submit(formDemo)', function(data){--%>
<%--            layer.msg(JSON.stringify(data.field));--%>
<%--            return false;--%>
<%--        });--%>
<%--        //自定义验证规则--%>
<%--        form.verify({--%>
<%--            username: [--%>
<%--                /^[\S]{6,12}$/--%>
<%--                ,'用户名必须6到12位，且不能出现空格'--%>
<%--            ],--%>
<%--            password: [--%>
<%--                /^[\S]{6,12}$/--%>
<%--                ,'密码必须6到12位，且不能出现空格'--%>
<%--            ]--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>
</html>
