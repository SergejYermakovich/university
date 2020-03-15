<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>admin_search</title>
</head>
<body>
<h2>Введите имя,фамилию или логин пользователя:</h2>
<form:form method="post">
    <input type="text" name="search"/>
    <input type="submit" value="search"/>
</form:form>

<c:choose>
    <c:when test="${users.size() ge 1}">
        <h2>Users:</h2>
        <table>
            <tbody>
            <c:forEach var="user" items="${users}">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.name}</td>
                    <td>${user.surname}</td>
                    <td>
                        <form:form action="/admin/search/getInfo/${user.id}" method="get">
                            <input type="submit" value="get Info"/>
                        </form:form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:when>
    <c:otherwise>
        <h1>No users for this condition</h1>
    </c:otherwise>
</c:choose>
</body>
</html>
