<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student courses</title>
</head>
<body>
<form>
    <input type="button" value="Go back!" onclick="history.back()">
</form>
<table>
    <tbody>
    <c:forEach var="course" items="${courses}">
        <tr>
            <td>${course.name}</td>
            <td>${course.description}</td>
            <td><a href="${pageContext.request.contextPath}/student/courses/${course.id}/news">News of this course</a> </td>
            <td><a href="${pageContext.request.contextPath}/student/courses/${course.id}/labs">Your labs of this course</a> </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
