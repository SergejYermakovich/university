<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>createMessageDialog</title>
</head>
<body>
<form>
    <input type="button" value="Go back!" onclick="history.back()">
</form>
<div>
    <form:form method="post">
        <input type="text" name="search"/>
        <input type="submit" value="search"/>
    </form:form>
</div>
<c:choose>
    <c:when test="${userList.size() ge 1}">
<div class="responsive-table">
    <table>
        <thead>
        <tr>
            <th>User</th>
            <th>Send a message</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${userIntegerMap}" var="entry">
            <tr>
                <td>${entry.key.login}</td>
                <td><a href="<c:url value='/message/dialog/${entry.key.id}'/>">Open dialog</a></td>

                <c:if test="${entry.value eq 0}">
                    <td>                              </td>
                </c:if>
                <c:if test="${entry.value > 0}">
                    <td>Unread messages: ${entry.value}</td>
                </c:if>

            </tr>
        </c:forEach>


<%--        <c:forEach var="user" items="${userList}">--%>
<%--            <tr>--%>
<%--                <td>${user.login}</td>--%>
<%--                <td><a href="<c:url value='/message/dialog/${user.id}'/>">Open dialog</a></td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
        </tbody>
    </table>
</div>
</c:when>
<c:otherwise>
    <h1>No users for this condition</h1>
</c:otherwise>
</c:choose>
</body>
</html>
