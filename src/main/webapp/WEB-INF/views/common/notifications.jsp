<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Notifications</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/notifications.css">
</head>
<body>
<form>
    <input type="button" value="Go back!" onclick="history.back()" class="go-back-button-nots">
</form>
<c:if test="${notificationList.size() eq 0}">
    <div class="no-notifications">
        You do not have any notifications
    </div>
</c:if>

<c:if test="${notificationList.size() > 0}">
<h1>Notifications:</h1>
<table>
    <c:forEach var="notification" items="${notificationList}">
        <tr>
            <td></td>
            <td class="not-message">${notification.notificationMessage}</td>
            <td class="not-date">${notification.date}</td>
        </tr>
    </c:forEach>
    </c:if>
</table>
</body>
</html>
