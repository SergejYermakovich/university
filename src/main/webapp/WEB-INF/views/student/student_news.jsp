<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student news</title>
    <link href="<c:url value="/resources/css/student/news.css" />" rel="stylesheet">
</head>
<body>
<form>
    <input type="button" value="Go back" onclick="history.back()" class="go-back-button-news">
</form>
<h1>News :</h1>
<table>
    <tr>
        <th>Title</th>
        <th>Description</th>
        <th>Date</th>
    </tr>
    <c:forEach var="event" items="${news}">
        <tr>
            <td>${event.name}</td>
            <td>${event.description}</td>
            <td>${event.date}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
