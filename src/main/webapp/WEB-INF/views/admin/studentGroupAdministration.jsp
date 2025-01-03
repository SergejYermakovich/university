<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/studentGroupAdministration.css">
<form>
    <input type="button" value="Go back!" onclick="history.back()" class="go-back">
</form>

<div>
    <table border="2">
        <tr class="table-header">
            <td class="id">№</td>
            <td>Name</td>
            <td>Delete</td>
        </tr>
        <c:forEach var="group" items="${groups}">
            <tr>
                <td class="id">${group.id}</td>
                <td>${group.name}</td>
                <td>
                    <input type="button" value="Delete"
                           onclick="location.href='<c:url value="/admin/deleteGroup/${group.id}"/>'"
                           class="get-button colorTwo">
                        <%--                    <a href="<c:url value='/admin/deleteGroup/${group.id}'/>">Delete</a>--%>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<br>
<br>

<div class="form">
    <form:form method="post" modelAttribute="group" action="/admin/addGroup">
        <div class="input-form">
            <label for="name">Name: </label>
            <form:input path="name" id="name" placeholder="name"/>
            <form:errors path="name"/>
        </div>
        <div class="input-form">
            <input type="submit" value="Add Group"/>
        </div>
    </form:form>
</div>


