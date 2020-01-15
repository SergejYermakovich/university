<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>student_news</title>
</head>
<body>
<h1>News :</h1>
<table>
    <tbody>
    <c:forEach var="event" items="${news}">
        <tr>
            <td>${event.name}</td>
            <td>${event.description}</td>
            <td>${event.date}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
