<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>admin panel</title>
</head>
<body>
<h1>Admin panel: </h1>

<h2>Students: </h2>
<table border="2">
    <tr class="table-header">
        <td>id</td>
        <td>login</td>
        <td>Active</td>
        <td>Action</td>
        <td>Edit</td>
    </tr>
    <c:forEach var="student" items="${students}">
        <tr>
            <td>${student.id}</td>
            <td>${student.login}</td>
            <td>
                <c:choose>
                    <c:when test="${student.active}">
                        Yes
                    </c:when>
                    <c:otherwise>
                        No
                    </c:otherwise>
                </c:choose>
            </td>
            <td>
                <c:choose>
                    <c:when test="${student.active}">
                        <a href="<c:url value="/admin/${student.id}/deactivate" />">Deactivate</a>
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value="/admin/${student.id}/activate" />">Activate</a>
                    </c:otherwise>
                </c:choose>
            </td>
            <td>
                <a href="<c:url value='/admin/editStudent/${student.id}'/>">Edit</a>
            </td>
        </tr>
    </c:forEach>
</table>

<h2>Teachers: </h2>
<table border="2">
    <tr class="table-header">
        <td>id</td>
        <td>login</td>
        <td>Edit</td>
    </tr>
    <c:forEach var="teacher" items="${teachers}">
        <tr>
            <td>${teacher.id}</td>
            <td>${teacher.login}</td>
            <td>
                <a href="<c:url value='/admin/editTeacher/${teacher.id}'/>">Edit</a>
            </td>
        </tr>
    </c:forEach>
</table>


<h2>Admins: </h2>
<table border="2">
    <tr class="table-header">
        <td>id</td>
        <td>login</td>
    </tr>
    <c:forEach var="admin" items="${admins}">
        <tr>
            <td>${admin.id}</td>
            <td>${admin.login}</td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
