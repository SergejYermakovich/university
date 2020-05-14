<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/search.css">
<form>
    <input type="button" value="Go back" onclick="history.back()" class="go-back">
</form>
<form:form method="post">
    <label>
        <input type="text" name="search" class="search"/>
        <input type="submit" value="search" class="search-button"/>
    </label>
</form:form>

<c:choose>
    <c:when test="${users.size() ge 1}">

        <table>
            <tbody>
            <c:forEach var="user" items="${users}">
                <tr>
                    <td class="id">${user.id}</td>
                    <td class="name">${user.name}</td>
                    <td class="name">${user.surname}</td>
                    <td>
                        <form:form action="/admin/search/getInfo/${user.id}" method="get">
                            <input type="submit" value="get Info" class="get-info"/>
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

