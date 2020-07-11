<%--
  Created by IntelliJ IDEA.
  User: 吴珍缘
  Date: 2020/4/17
  Time: 14:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common.jsp" %>
<html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户注册</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="${url}/lib/layui-v2.5.6/css/layui.css" media="all">
    <link rel="stylesheet" href="//at.alicdn.com/t/font_1783733_qmyseb3ydrh.css">
    <link rel="stylesheet" href="//at.alicdn.com/t/font_1783741_drqlcdtkm9d.css">
    <link rel="stylesheet" href="//at.alicdn.com/t/font_1783764_x9l4072jy6e.css">
    <style>
        body {
            background-color: #009688;
        }
        .layui-register {
            width: 500px;
            height: auto;
            margin: 100px auto;
            border-radius: 4px;
            padding: 40px 50px;
            -moz-box-shadow: 1px 1px 6px #D6D6D6;
            -webkit-box-shadow: 1px 1px 6px #D6D6D6;
            box-shadow: 1px 1px 6px #D6D6D6;
            background-color: #FFFFFF;
        }
        .layui-top-title {
            padding: 20px 0;
            text-align: center;
        }
        .layui-top-title>h3 {
            margin-bottom: 10px;
            font-weight: 300;
            font-size: 30px;
            color: #000;
        }
        .layui-register-form {
            margin-top: 15px;
        }

        .layui-register-form .layui-form-item {
            position: relative;
            margin-bottom: 20px;
        }

        .layui-register-form .layui-form-label {
            display: inline-block;
            text-align: left;
            width: auto;
            padding: 0;
            z-index: 1;
            position: absolute;
            line-height: 30px;
            /* top: 5px; */
            /* 	top: 50%;
            transform: translateY(-50%); */
        }

        .layui-register-form .layui-form-label i {
            font-size: 20px;
        }

        .layui-register-form .layui-input-block {
            margin-left: 0;
            width: 100%;
            display: inline-block;
        }

        .layui-register-form .layui-form-code {
            position: absolute;
            top: 0;
            line-height: 38px;
            padding: 0 10px;
            right: 0;
        }

        .layui-register-form .layui-input-block>input,
        .layui-register-form .layui-input-block .layui-select-title {
            padding: 0 40px;
            border: none;
            font-size: 13px;
            border-bottom: 2px solid #009688;
        }

        .layui-register-form .layui-input-block .layui-unselect {
            border: none;
            margin-bottom: 2px;
            padding-left: 0;
        }

        .layui-register-form .layui-input-block .layui-input,
        .layui-select,
        .layui-textarea {
            height: 38px;

        }

        .layui-register-form .layui-input-block>input::-webkit-input-placeholder {
            font-size: 13px;
        }

        .layui-register-form .layui-input-block>input::-moz-placeholder {
            font-size: 13px;
        }

        .layui-register-form .layui-input-block .layui-input:focus,
        .layui-textarea:focus {
            border-color: #009688 !important;
        }

        .layui-register-form .layui-input-block .layui-input:hover {
            border-color: #009688 !important;
        }
        .layui-form-password {
            float: right;
            height: 30px;
            line-height: 30px;
            margin-top: 10px;
        }

        .layui-form-password a {
            display: block;
            height: auto;
            color: #009688;
            min-width: 18px;
            min-height: 18px;
            font-size: 14px;
        }
        .layui-form-checkbox {
            float: left;
            margin-right: 0;
            padding-right: 0;
        }
        @media screen and (max-width:768px) {
            .layui-register {
                width: auto;
                padding: 40px 30px;
            }
        }
        @media screen and (min-width:1024px) and (max-width:1366px) {
            .layui-register {
                width: auto;
            }
        }
    </style>
</head>
<body>
<div class="layui-container">
    <div class="layui-register layui-anim layui-anim-scale">
        <div class="layui-top-title">
            <h3>快速注册</h3>
        </div>
        <div class="layui-register-form">
            <form class="layui-form">
                <div class="layui-form-item">
                    <label class="layui-form-label"><i class="layui-icon layui-icon-username"></i></label>
                    <div class="layui-input-block">
                        <input type="text" id="username" name="username" required lay-verify="required" placeholder="用户名/账号" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"><i class="layui-icon layui-icon-password"></i></label>
                    <div class="layui-input-block">
                        <input type="password" id="password" name="password" required lay-verify="required|password" placeholder="密码" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"><i class="layui-icon layui-icon-password"></i></label>
                    <div class="layui-input-block">
                        <input type="password" name="password" required lay-verify="required|regpwd" placeholder="重复密码" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"><i class="iconfont icon-zhenshixingming"></i></label>
                    <div class="layui-input-block">
                        <input type="text" name="realname" required lay-verify="required" placeholder="真实姓名" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"><i class="layui-icon layui-icon-cellphone"></i></label>
                    <div class="layui-input-block">
                        <input type="text" name="phone" required lay-verify="required|phone|number" placeholder="手机号码" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"><i class="layui-icon layui-icon-email"></i></label>
                    <div class="layui-input-block">
                        <input type="text" name="email" required lay-verify="required|email" placeholder="邮箱" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"><i class="iconfont icon-nianling1"></i></label>
                    <div class="layui-input-block">
                        <input type="text" name="age" required lay-verify="required|number" placeholder="年龄" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"><i class="iconfont icon-zhuzhi"></i></label>
                    <div class="layui-input-block">
                        <input type="text" name="adress" required lay-verify="required" placeholder="住址" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
<%--                    <label class="layui-form-label">性别</label>--%>
                    <div class="layui-input-block" id="sexradio">
                        <input type="radio" name="sex" value="男" title="男">
                        <input type="radio" name="sex" value="女" title="女" checked>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="register">立即注册</button>
                    </div>
                </div>
            </form>
            <hr style="width: 85%" />

            <p style="width: 85%"><a href="login.jsp" class="fl">已有账号？立即登录</a>
        </div>
    </div>
</div>

<script src="${url}/lib/jquery-3.4.1/jquery-3.4.1.min.js" charset="utf-8"></script>
<script src="${url}/lib/layui-v2.5.6/layui.js" charset="utf-8"></script>
<script src="${url}/lib/jq-module/jquery.particleground.min.js" charset="utf-8"></script>
<script>
    layui.use(['form',"layer"], function () {
        var form = layui.form,
            layer = layui.layer;
        form.render();

        $  (function () {
            $("#username").blur(function () {
                                var username = $(this).val();
                                $.ajax({
                                    url: "<%=basePath%>/user/validate",
                                    type: "POST",
                                    data: {"name": username},
                                    success: function (result) {
                                        if (result) {
                                            layer.msg('用户名已存在，请重新输入');
                                        }
                    }
                });
            });
        });
        form.on('submit(register)', function (data) {
            data = data.field;

            var sex = $('#sexradio input[name="sex"]:checked ').val();
            form.on('radio(sex)', function(data){
                sex = data.value;
            });
            if (sex == "男"){
                sex = 0;
            }else{
                sex = 1;
            }
            $.ajax({
                url: "<%=basePath%>/user/add",
                type: "POST",
                data:{
                        "userName": data.username,
                        "userPasswd": data.password,
                        "realName": data.realname,
                        "phone": data.phone,
                        "adress": data.adress,
                        "email": data.email,
                        "age": parseInt(data.age),
                        "gender": sex
                },
                success: function (data) {
                    if (data == "success"){
                        layer.msg('用户注册成功');
                        setTimeout(function(){
                            window.location="login.jsp";
                        },2000);

                    }else{
                        layer.msg('用户注册失败，请重试');
                    }
                }
            });
            return false;
        });

        form.verify({
            password: [
                /^[\S]{6,12}$/
                ,'密码必须6到12位，且不能出现空格'
            ],
            regpwd: function(value) {
                //获取密码
                var pwd = $("#password").val();
                if(!new RegExp(pwd).test(value)) {
                    return '两次输入的密码不一致';
                }
            }
        });
    });
</script>
</body>
</html>
