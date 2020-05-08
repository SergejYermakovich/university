<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>student course news</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/student/coursenews.css">
</head>
<body>
<form>
    <input type="button" value="Go back!" onclick="history.back()" class="go-back-button-news-st">
</form>
<h1>Student course news:</h1>
<table>
    <tbody>
    <c:forEach var="news" items="${newsList}">
        <tr>
            <td>${news.name}</td>
            <td>${news.description}</td>
            <td>${news.date}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
