<%--
  Created by IntelliJ IDEA.
  User: 吴珍缘
  Date: 2020/4/26
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>健康管理系统登录</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="${url}/lib/layui-v2.5.6/css/layui.css" media="all">
    <style>
        html, body {
            width: 100%;
            height: 100%;
            overflow: hidden
        }
        body {
            background: #009688;
        }
        body:after {
            content: '';
            background-repeat: no-repeat;
            background-size: cover;
            -webkit-filter: blur(3px);
            -moz-filter: blur(3px);
            -o-filter: blur(3px);
            -ms-filter: blur(3px);
            filter: blur(3px);
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            z-index: -1;
        }
        .layui-container {
            width: 100%;
            height: 100%;
            overflow: hidden
        }
        .admin-login-background {
            width: 360px;
            height: 300px;
            position: absolute;
            left: 50%;
            top: 40%;
            margin-left: -180px;
            margin-top: -100px;
        }
        .logo-title {
            text-align: center;
            letter-spacing: 2px;
            padding: 14px 0;
        }
        .logo-title h1 {
            color: #009688;
            font-size: 25px;
            font-weight: bold;
        }
        .login-form {
            background-color: #fff;
            border: 1px solid #fff;
            border-radius: 3px;
            padding: 14px 20px;
            box-shadow: 0 0 8px #eeeeee;
        }
        .login-form .layui-form-item {
            position: relative;
        }
        .login-form .layui-form-item label {
            position: absolute;
            left: 1px;
            top: 1px;
            width: 38px;
            line-height: 36px;
            text-align: center;
            color: #d2d2d2;
        }
        .login-form .layui-form-item input {
            padding-left: 36px;
        }
    </style>
</head>
<body>
<div class="layui-container">
    <div class="admin-login-background">
        <div class="layui-form login-form">
            <form class="layui-form" action="">
                <div class="layui-form-item logo-title">
                    <h1>健康管理系统登录</h1>
                </div>
                <div class="layui-form-item">
                    <%--@declare id="username"--%><label class="layui-icon layui-icon-username" for="username"></label>
                    <input id="username" type="text" name="username" lay-verify="required|username" placeholder="用户名" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <%--@declare id="password"--%><label class="layui-icon layui-icon-password" for="password"></label>
                    <input type="password" name="password" lay-verify="required|password" placeholder="密码" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block" id = "roleradio">
                        <input type="radio" name="role" lay-filter="role" value="用户" title="用户" checked>
                        <input type="radio" name="role" lay-filter="role" value="管理员" title="管理员">
                    </div>
                </div>
                <div class="layui-form-item">
                    <button class="layui-btn layui-btn  layui-btn-fluid" lay-submit="" lay-filter="login">登 入</button>
                </div>
            </form>
            <hr style="width: 85%" />

            <p style="width: 85%"><a href="register.jsp" class="fl">没有账号？立即注册</a>
        </div>
    </div>
</div>
<script src="${url}/lib/jquery-3.4.1/jquery-3.4.1.min.js" charset="utf-8"></script>
<script src="${url}/lib/layui-v2.5.6/layui.js" charset="utf-8"></script>
<script src="${url}/lib/jq-module/jquery.particleground.min.js" charset="utf-8"></script>
<script>
    layui.use(['form'], function () {
        var form = layui.form,
            layer = layui.layer;

        // 登录过期的时候，跳出ifram框架
        if (top.location != self.location) top.location = self.location;

        // 粒子线条背景
        $(document).ready(function(){
            $('.layui-container').particleground({
                dotColor:'#7ec7fd',
                lineColor:'#7ec7fd'
            });
        });

        $(function(){
            $("#username").blur(function(){
                var username=$(this).val();
                if (role == '用户'){
                    $.ajax({
                        url: "<%=basePath%>/user/validate",
                        type: "POST",
                        data: {"name": username},
                        success: function (result) {
                            if (!result) {
                                layer.msg('用户名不存在');
                            }
                        }
                    });
                }else{
                    $.ajax({
                        url: "<%=basePath%>/manager/validate",
                        type: "POST",
                        data: {"username": username},
                        success: function (result) {
                            if (!result) {
                                layer.msg('用户名不存在');
                            }
                        }
                    });
                }

            })
        });



        var role = $('#roleradio input[name="role"]:checked ').val();
        form.on('radio(role)', function(data){
            // alert(data.elem); //得到radio原始DOM对象
            // alert(data.value); //被点击的radio的value值
            role = data.value;
        });

        // 进行登录操作
        form.on('submit(login)', function (data) {
            data = data.field;
            if (data.username == '') {
                layer.msg('用户名不能为空');
                return false;
            }
            if (data.password == '') {
                layer.msg('密码不能为空');
                return false;
            }

            if (role == '用户'){
                $.ajax({
                    url: "<%=basePath%>/user/login",
                    type: "POST",
                    data: {
                        "username": data.username,
                        "password": data.password
                    },
                    async : false,
                    success: function (data) {
                        if (data == "success"){
                            layer.msg('用户登录成功');
                            window.location="user.jsp";
                            // todo：页面跳转

                        }else{
                            layer.msg('用户名或密码错误');
                        }
                    }
                })
            }else if (role == '管理员'){
                $.ajax({
                    url: "<%=basePath%>/manager/login",
                    type: "POST",
                    data: {
                        "username": data.username,
                        "password": data.password
                    },
                    async : false,
                    success: function (data) {
                        if (data == "success"){
                            layer.msg('管理员登录成功');
                            window.location="manager.jsp";
                            // todo：页面跳转
                        }else{
                            layer.msg('用户名或密码错误');
                        }
                    }
                })
            }

            // layer.msg('登录成功', function () {
            //     window.location = '../index.html';
            // });
            return false;
        });

        form.verify({
            // username: [
            //     /^[\S]{6,12}$/
            //     ,'用户名必须6到12位，且不能出现空格'
            // ],
            password: [
                /^[\S]{6,12}$/
                ,'密码必须6到12位，且不能出现空格'
            ]
        });
    });
</script>
</body>
</html>
