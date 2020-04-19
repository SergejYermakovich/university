<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student Group Administration</title>
</head>
<body>
<form>
    <input type="button" value="Go back!" onclick="history.back()">
</form>

<div>
    <table border="2">
        <tr class="table-header">
            <td>Id</td>
            <td>Name</td>
            <td>Delete</td>
        </tr>
        <c:forEach var="group" items="${groups}">
            <tr>
                <td>${group.id}</td>
                <td>${group.name}</td>
                <td>
                    <a href="<c:url value='/admin/deleteGroup/${group.id}'/>">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<br>
<br>

<div>

    <form:form method="post" modelAttribute="group" action="/admin/addGroup">
        <label for="name">Name: </label>
        <form:input path="name" id="name" placeholder="name"/>
        <form:errors path="name"/>
        <input type="submit" value="Add Group"/>
    </form:form>
</div>

</body>
</html>
