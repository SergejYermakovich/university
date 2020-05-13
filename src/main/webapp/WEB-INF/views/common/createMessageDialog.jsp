<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/createMessageDialog.css">
<form>
    <input type="button" value="Go back" onclick="history.back()" class="back">
</form>

<div class="all-together">
    <div class="search-all">
        <label>
            <form:form method="post">
                <input type="text" name="search" class="search"/>
                <input type="submit" value="search" class="btn-search"/>
            </form:form>
        </label>
    </div>
    <c:choose>
        <c:when test="${userList.size() ge 1}">
            <div class="table">
                <table>
<%--                    <thead>--%>
<%--                    <tr>--%>
<%--                        <td>Name</td>--%>
<%--                        <td>Surname</td>--%>
<%--                        <td>Login</td>--%>
<%--                    </tr>--%>
<%--                    </thead>--%>
                    <tbody>
                    <c:forEach items="${userIntegerMap}" var="entry">
                        <tr>
                            <td class="name">${entry.key.name} </td>
                            <td class="name">${entry.key.surname}</td>
<%--                            <td class="name"> (${entry.key.login})</td>--%>
                            <td>
                                <form>
                                    <input type="button" value="Open dialog"
                                           onclick="location.href='/message/dialog/${entry.key.id}'"
                                           class="btn-open-dialog">
                                </form>
                            </td>
                            <c:if test="${entry.value eq 0}">
                                <td></td>
                            </c:if>
                            <c:if test="${entry.value > 0}">
                                <td>
                                    <form>
                                        <input type="button" value="Unread messages: ${entry.value}"
                                               class="unread-messages">
                                    </form>
                                </td>

<%--                                <td class="unread-messages">Unread messages: ${entry.value}</td>--%>
                            </c:if>

                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

        </c:when>
        <c:otherwise>
            <div class="no-users">
                No users for this condition
            </div>
        </c:otherwise>
    </c:choose>
</div>