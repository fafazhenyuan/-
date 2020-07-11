<%--
  Created by IntelliJ IDEA.
  User: 吴珍缘
  Date: 2020/4/18
  Time: 17:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
<c:set var="url">${pageContext.request.contextPath}</c:set>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" type="date" pattern="yyyy-M-d" var="date" />

