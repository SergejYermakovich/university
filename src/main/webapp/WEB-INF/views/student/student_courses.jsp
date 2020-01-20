<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student courses</title>
</head>
<body>
<table>
    <tbody>
    <c:forEach var="course" items="${courses}">
        <tr>
            <td>${course.name}</td>
            <td>${course.description}</td>
            <td><a href="${pageContext.request.contextPath}/student/courses/${course.id}">Course menu</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
