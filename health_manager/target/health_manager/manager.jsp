<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 吴珍缘
  Date: 2020/4/22
  Time: 21:20
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
    <title>后台管理</title>
    <%@ include file="/common.jsp" %>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${url}/lib/layui-v2.5.6/css/layui.css" media="all">
</head>
<body class="layui-layout-body">
<c:if test="${empty sessionScope.managersession}">
    <script>
        alert("请先登录！");
        window.location = "login.jsp";
    </script>
</c:if>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">后台管理</div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    您好，
                    ${sessionScope.managersession.getManagerName()}
                </a>
            </li>
            <li class="layui-nav-item"><a id="logout" href="javascript:void(0);">退出登录</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="demo">
                <li class="layui-nav-item layui-nav-itemed" lay-shrink="all" lay-unselect>
                    <a href="javascript:;">系统管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="back_manager.jsp">管理员列表</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"  lay-shrink="all" lay-unselect>
                    <a href="javascript:;">用户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="back_user.jsp">用户管理</a></dd>
                        <dd><a href="back_exam.jsp">体检管理</a></dd>
                        <dd><a href="back_food.jsp">食物管理</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 0px;"><iframe frameborder="0" id="iframeMain" src="back_manager.jsp"  style="width: 100%"; height="100%";></iframe></div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
         用❤为用户的健康保驾护航
    </div>
</div>
<script src="${url}/lib/layui-v2.5.6/layui.js" charset="utf-8"></script>
<script src="${url}/lib/layui-v2.5.6/layui.all.js" charset="utf-8"></script>
<script src="${url}/lib/jquery-3.4.1/jquery-3.4.1.min.js" charset="utf-8"></script>


<script>

    $(document).ready(function(){
        layui.use('element', function(){
            var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
            layer = layui.layer;
            $('#logout').on('click', function() {
                $.ajax({
                    url:"<%=basePath%>/user/clear",
                    type:'POST',
                    success:function (){
                        window.location="login.jsp";
                    }
                })
            });
            $("dd>a").click(function (e) {
                e.preventDefault();
                $("#iframeMain").attr("src",$(this).attr("href"));
            });
            $("li>a").click(function (e) {
                e.preventDefault();
                $("#iframeMain").attr("src",$(this).attr("href"));
            });
            //监听导航点击
            element.on('nav(demo)', function(elem){
            });
        });
    });

</script>

</body>
</html>
