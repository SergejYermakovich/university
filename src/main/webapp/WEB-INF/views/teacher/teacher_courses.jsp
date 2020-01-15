<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>teacher_courses</title>
</head>
<body>
<table>
    <tbody>
    <c:forEach var="course" items="${courses}">
        <tr>
            <td>${course.name}</td>
            <td>${course.description}</td>
            <td><a href="${pageContext.request.contextPath}/teacher/courses/${course.id}">Course menu</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
