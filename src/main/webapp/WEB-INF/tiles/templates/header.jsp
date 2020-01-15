<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link href="<c:url value="/resources/css/templates.css" />" rel="stylesheet">
</head>
<body>
<div class="header">
    A dream becomes a goal when action is taken to its achievement!!!
    <p>Today <%= new java.util.Date() %></p>
    <form:form action="logout" method="post">
        <input type="submit" value="log out">
    </form:form>
</div>
</body>
</html>