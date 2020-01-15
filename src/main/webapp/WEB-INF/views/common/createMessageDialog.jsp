<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>createMessageDialog</title>
</head>
<body>

<div class="responsive-table">
    <table>
        <thead>
        <tr>
            <th>User</th>
            <th>Send a message</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${userList}">
            <tr>
                <td>${user.login}</td>
                <td><a href="<c:url value='/message/dialog/${user.id}'/>">Send</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
