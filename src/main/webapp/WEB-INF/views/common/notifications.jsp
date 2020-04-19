<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Notifications</title>
</head>
<body>
<form>
    <input type="button" value="Go back!" onclick="history.back()">
</form>
<c:if test="${notificationList.size() eq 0}">
    You do not have any notifications
</c:if>
<table>
    <tbody>
    <c:forEach var="notification" items="${notificationList}">
        <tr>
            <td>${notification.name}</td>
            <td>${notification.description}</td>
            <td>${notification.name}</td>
            <td>${notification.description}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
