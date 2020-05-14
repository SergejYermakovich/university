<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/panel.css">

<form>
    <input type="button" value="Go back!" onclick="history.back()" class="go-back">
</form>

<h1>Admin panel: </h1>

<div class="importStudents">
    <form:form enctype="multipart/form-data" action="/admin/addStudents?_csrf=${_csrf.token}">
        <table>
            <tr>
                <td>
                    choose a file with students:
                </td>
                <td>
                    <input type="file" name="file"   class="get-button colorTwo" title="choose a file" placeholder="choose a file">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="<spring:message text="Add new students"/>" class="get-button colorTwo center"/>
                </td>
            </tr>
        </table>
    </form:form>
</div>

<div class="inlineButtons">
    <form:form method="get" action="/admin/createTeacher">
        <input type="submit" value="Create Teacher" class="get-button colorThree"/>
    </form:form>
</div>

<div class="inlineButtons">
    <form:form method="get" action="/admin/courseAdministration">
        <input type="submit" value="Course administration" class="get-button colorThree"/>
    </form:form>
</div>

<div class="inlineButtons">
    <form:form method="get" action="/admin/studentGroupAdministration">
        <input type="submit" value="Student group administration" class="get-button colorThree"/>
    </form:form>
</div>


<h2>Students: </h2>
<table border="2">
    <tr class="table-header">
        <td class="id">id</td>
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
                        <input type="button" value="Deactivate"
                               onclick="location.href='<c:url value="/admin/${student.id}/deactivate" />'"
                               class="get-button colorTwo">
<%--                        <a href="<c:url value="/admin/${student.id}/deactivate" />">Deactivate</a>--%>
                    </c:when>
                    <c:otherwise>
                        <input type="button" value="Activate"
                               onclick="location.href='<c:url value="/admin/${student.id}/activate" />'"
                               class="get-button colorTwo">
<%--                        <a href="<c:url value="/admin/${student.id}/activate" />">Activate</a>--%>
                    </c:otherwise>
                </c:choose>
            </td>
            <td>
                <input type="button" value="Edit"
                       onclick="location.href='<c:url value="/admin/editStudent/${student.id}" />'"
                       class="get-button colorTwo">
<%--                <a href="<c:url value='/admin/editStudent/${student.id}'/>">Edit</a>--%>
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
                <input type="button" value="Edit"
                       onclick="location.href='<c:url value="/admin/editTeacher/${teacher.id}" />'"
                       class="get-button colorTwo">

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
