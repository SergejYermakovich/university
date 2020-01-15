<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Course menu</title>
</head>
<body>
<ul>
    <li><a href="${pageContext.request.contextPath}/news/add/${course.id}">News adding</a></li>
    <li><a href="${pageContext.request.contextPath}/labs/add/${course.id}">Labs adding</a></li>
</ul>
</body>
</html>
