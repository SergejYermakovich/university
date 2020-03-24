<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>student_labs</title>
</head>
<body>
<form>
    <input type="button" value="Go back!" onclick="history.back()">
</form>
<h1>Student labs:</h1>
<table>
    <c:forEach var="lab" items="${labs}">
        <tr>
            <td>${lab.id}</td>
            <td>${lab.description}</td>
            <td>${lab.status}</td>
            <td>${lab.order}</td>
            <td>${lab.student.user.name}</td>
            <td>${lab.course.name}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
