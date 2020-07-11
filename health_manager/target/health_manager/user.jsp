<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 吴珍缘
  Date: 2020/4/20
  Time: 18:46
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
    <meta charset="utf-8">
    <title>健康管理系统</title>
    <%@ include file="/common.jsp" %>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${url}/lib/layui-v2.5.6/css/layui.css" media="all">
    <style type="text/css">
        .user{
            width: 100%;
            height: 800px;
        }
        .layui-nav .layui-nav-item{
            width: 13%;
        }
        .layui-nav .layui-layout-right{
            width: 8%;
        }
    </style>
</head>

<body class="body">
<ul class="layui-nav layui-bg-green" lay-filter="demo">
    <li class="layui-nav-item" style="margin-left: 150px"><a href="exam.jsp"><strong style="font-size: 20px">体检记录</strong></a></li>

    <li class="layui-nav-item"><a href="sick.jsp"><strong style="font-size: 20px">疾病评估</strong></a></li>

    <li class="layui-nav-item"><a href="food.jsp"><strong style="font-size: 20px">饮食推荐</strong></a></li>

    <li class="layui-nav-item"><a href="javascript:;"><strong style="font-size: 20px">健康日志</strong></a>
        <dl class="layui-nav-child">
            <dd><a href="logsearch.jsp"><strong>查询健康日志</strong></a></dd>
            <dd><a href="log.jsp"><strong>添加健康日志</strong></a></dd>
        </dl>
    </li>
    <li class="layui-nav-item layui-layout-right">
        <a href="javascript:;">个人中心</a>
        <dl class="layui-nav-child ">
            <dd><a href="alterInfo.jsp">修改资料</a></dd>
            <dd><a href="alterpwd.jsp">修改密码</a></dd>
            <dd><a id="logout" href="javascript:void(0)">退出登录</a></dd>
        </dl>
    </li>
</ul>
<div class="user">
    <iframe id="iframeMain" frameborder="0" src="exam.jsp" style="width: 100%" height="100%";>
    </iframe>
</div>
<script src="${url}/lib/layui-v2.5.6/layui.js" charset="utf-8"></script>
<script src="${url}/lib/jquery-3.4.1/jquery-3.4.1.min.js" charset="utf-8"></script>
<script>
    $(document).ready(function(){
        layui.use('element', function(){
            $("dd>a").click(function (e) {
                e.preventDefault();
                $("#iframeMain").attr("src",$(this).attr("href"));
            });
            $("li>a").click(function (e) {
                e.preventDefault();
                $("#iframeMain").attr("src",$(this).attr("href"));
            });
            $('#logout').on('click', function() {
                $.ajax({
                    url:"<%=basePath%>/user/clear",
                    type:'POST',
                    success:function (){
                        window.location="login.jsp";
                    }
                })
            });
            var element = layui.element;
            layer = layui.layer;
            //监听导航点击
            element.render('nav(demo)', function(elem){
            });
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




