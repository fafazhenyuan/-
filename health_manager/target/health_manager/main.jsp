<%--
  Created by IntelliJ IDEA.
  User: 吴珍缘
  Date: 2020/4/17
  Time: 13:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common.jsp" %>
<html>
<head>
    <title>主界面</title>
</head>
<body>

<div id="btm">
    <div id="main">
        <div id="header">
            <div id="top"></div>
            <div>
                <h1></h1>
            </div>
            <div id="mainnav">
                <span>
                    <form method="post" id="loginform">
                        <table width="100%">
                            <tr>
                            <c:choose>
                                <c:when test="${empty sessionScope.user}">
                                    <td align="right">
                                        <font size=2px; color=#A4A4A4>用户名</font>
                                        <input id="username" type="text" name="user.name" style="width: 80px"/>
                                    </td>
                                    <td>
                                        <font size=2px; color=#A4A4A4>密码</font>
                                        <input id="password" type="password" name="user.password" style="width: 80px"/>
                                    </td>
                                    <td><a style="cursor: pointer;">
                                        <img src="${url}/images/login.gif" border="0"
                                             id="login"/> </a>
                                    </td>
                                    <td>
                                        <a href="${url}/register.jsp">
                                            <img src="${url}/images/reg_v2.gif" border="0"
                                                 id="register"/> </a>
                                    </td>
                                    <td>
                                        <a href="${url}/register.jsp"><font size=2px; color=#990000>如何注册</font>
                                        </a> ｜
                                        <a href="${url}/back_login.jsp"> <font size=2px;
                                                                               color=#990000>后台管理</font> </a>
                                    </td>
                                </c:when>
                                <c:otherwise>
                                <td align="right">
                                    <font size=2px; color=#A4A4A4>您好，</font>
                                </td>
                                    <td>
                                <font size=2px; color=#A4A4A4>
                                 ${sessionScope.teacher.realname}&nbsp; 欢迎您。
                                 </font>
                                </td>
                                    <td>
                                    <a href="${url}/teacher/logout!logout">
                                        <img src="${url}/images/logout.jpg" border="0"
                                             id="logout"/> </a>
                                </td>
                                </c:otherwise>
                            </c:choose>
                            </tr>
                        </table>
                    </form>
                </span>
            </div>
        </div>


        <%--        <div id="content">--%>
        <%--            <div id="left">--%>

        <%--                <div id="tabs0">--%>

        <%--                    <div class="main0" id="main0">--%>
        <%--                        <div class="block">--%>
        <%--                            <img src="${url}/${noticeList[0].imagepath}" />--%>

        <%--                            <p>--%>
        <%--                                <font size=2px; color=#2E2E2E>--%>
        <%--                                    ${noticeList[0].content}--%>
        <%--                                </font>--%>
        <%--                            </p>--%>

        <%--                        </div>--%>


        <%--                    </div>--%>
        <%--                    <div class="clear"></div>--%>
        <%--                </div>--%>


        <%--            </div>--%>

        <%--            <div id="right">--%>
        <%--                <table width="325">--%>
        <%--                    <tr>--%>
        <%--                        <td align="left">--%>
        <%--                            <font size=4px; color=#A4A4A4> </font>--%>
        <%--                        </td>--%>
        <%--                    </tr>--%>

        <%--                </table>--%>

        <%--            </div>--%>

        <%--            <div class="clear"></div>--%>

        <%--        </div>--%>


    </div>
</div>

<script>
    $(document).ready(function(){
        $('#login').click(function(){
            if ($("#username").val() == "" || $("#pasword").val() == "") {
                alert("用户名或密码不能为空！");
            }else {
                $.ajax({
                    url:"${url}/user/login",//所要提交数据的服务器地址
                    data:JSON.stringify({
                        userName: $("#username").val(),
                        userPasswd: $("#password").val()
                    }),
                    type:"POST",
                    dataType:"json",
                    contentType:'application/json;charset=UTF-8',
                    success:function(data){
                        console.log(data);
                        if(!data && typeof(data)!="undefined" && data!=0){
                           alert("您输入的用户名或密码有误！");
                           console.log(data);
                        }else{
                            window.location.href="user.jsp";
                        }
                    }
            })
            }
        })
    });
</script>
</body>
</html>