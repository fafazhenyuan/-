<%--
  Created by IntelliJ IDEA.
  User: 吴珍缘
  Date: 2020/5/10
  Time: 23:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户注册</title>
    <%@ include file="/common.jsp" %>
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
            background-color: #FFFFFF;
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
            <h3>修改密码</h3>
        </div>
        <div class="layui-register-form">
            <form class="layui-form">


                <div class="layui-form-item">
                    <label class="layui-form-label"><i class="layui-icon layui-icon-password"></i></label>
                    <div class="layui-input-block">
                        <input type="password" id="password" name="password" required lay-verify="required|password" placeholder="密码" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"><i class="layui-icon layui-icon-password"></i></label>
                    <div class="layui-input-block">
                        <input type="password" id="newpassword" name="newpassword" required lay-verify="required|regpwd" placeholder="新密码" autocomplete="off" class="layui-input">
                    </div>
                </div>


                <div class="layui-form-item">
                    <label class="layui-form-label"><i class="layui-icon layui-icon-password"></i></label>
                    <div class="layui-input-block">
                        <input type="password" name="newpassword" required lay-verify="required|regpwd" placeholder="重复密码" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="alt">提交修改</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


<script src="${url}/lib/layui-v2.5.6/layui.js" charset="utf-8"></script>
<script src="${url}/lib/jquery-3.4.1/jquery-3.4.1.min.js" charset="utf-8"></script>




<script>
    layui.use(['form',"layer"], function () {
        var form = layui.form,
            layer = layui.layer;

        form.render();

        $(function () {
            $("#password").blur(function () {
                var password = $(this).val();
                if (password!=${sessionScope.usersession.getUserPasswd()}){
                <%--$.ajax({--%>
                <%--    url: "<%=basePath%>/user/validate",--%>
                <%--    type: "POST",--%>
                <%--    data: {"name": username},--%>
                <%--    success: function (result) {--%>
                <%--        if (result) {--%>
                            layer.msg('密码错误，请重新输入');
                }
                    // }
                // });
            });
        });

        form.verify({
            password: [
                /^[\S]{6,12}$/
                ,'密码必须6到12位，且不能出现空格'
            ],
            regpwd: function(value) {
                //获取密码
                var pwd = $("#newpassword").val();
                if(!new RegExp(pwd).test(value)) {
                    return '两次输入的密码不一致';
                }
            }
        });


        form.on('submit(alt)', function (data) {
            data = data.field;
            var test=${ sessionScope.usersession.getUserId()};
            $.ajax({
                url: "<%=basePath%>/user/altPwd",
                type: "POST",
                data:{
                    "userPasswd": data.newpassword,
                    "userId":test
                },
                success: function (data) {
                    if (data == "success"){
                        layer.msg('密码修改成功,请重新登录进行信息更新');
                        setTimeout(function(){
                            $.ajax({
                                url:"<%=basePath%>/user/clear",
                                type:'POST',
                                success:function (){
                                    window.location="login.jsp";
                                }
                            })
                            // window.open("login.jsp")
                        },2000);
                    }else{
                        layer.msg('密码修改失败，请重试');
                    }
                }
            });
            return false;
        });

    });
</script>



</body>





<c:if test="${empty sessionScope.usersession}">
    <script>
        alert("请先登录！");
        window.location = "login.jsp";
    </script>
</c:if>

</body>
</html>