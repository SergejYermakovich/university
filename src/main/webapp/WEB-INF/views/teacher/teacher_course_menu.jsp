<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Course menu</title>
</head>
<body>
<h1>Teacher course menu : </h1>
<ul>
    <li><a href="${pageContext.request.contextPath}/news/add/${course.id}">News adding</a></li>
    <li><a href="${pageContext.request.contextPath}/labs/add/${course.id}">Labs adding</a></li>
</ul>

<table>
    <tbody>
    <c:forEach var="studentGroup" items="${studentGroups}">
        <tr>
            <td>${studentGroup.id}</td>
            <td>${studentGroup.name}</td>
            <td><a href="${pageContext.request.contextPath}/teacher/courses/${course.id}/studentGroup/${studentGroup.id}">goto</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
