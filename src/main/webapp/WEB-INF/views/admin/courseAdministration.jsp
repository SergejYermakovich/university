<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/courseAdministration.css">
<form>
    <input type="button" value="Go back!" onclick="history.back()" class="go-back">
</form>

<div>
    <table border="2">
        <tr class="table-header">
            <td class="id">№</td>
            <td>Name</td>
            <td>Description</td>
            <td>Teacher</td>
            <td>Delete</td>
        </tr>
        <c:forEach var="course" items="${courses}">
            <tr>
                <td class="id">${course.id}</td>
                <td>${course.name}</td>
                <td>${course.description}</td>
                <td>${course.teacher.user.surname}</td>
                <td>
                    <input type="button" value="Delete"
                           onclick="location.href='<c:url value="/admin/deleteCourse/${course.id}" />'"
                           class="get-button colorTwo">
<%--                    <a href="<c:url value='/admin/deleteCourse/${course.id}'/>">Delete</a>--%>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<br>
<br>

<div class="form">
    <form:form method="post" modelAttribute="courseInDto" action="/admin/addCourse">
        <div class="input-form">
        <label for="name">Name: </label>
        <form:input path="name" id="name" placeholder="name"/>
        <form:errors path="name"/>
        </div>
        <div class="input-form">
        <label for="description">Description: </label>
        <form:input path="description" id="description" placeholder="description"/>
        <form:errors path="description"/>
        </div>
        <div class="input-form">
        <label for="teacher">Teacher:</label>
        <form:select path="teacher">
            <form:options items="${teachers}"/>
        </form:select>
        <form:errors path="teacher"/>
        </div>
        <div class="input-form">
        <label for="studentGroup">StudentGroup:</label>
        <form:select path="studentGroup">
            <form:options items="${studentGroups}"/>
        </form:select>
        <form:errors path="studentGroup"/>
        </div>
        <div class="input-form">
        <input type="submit" value="Add Course"/>
        </div>
    </form:form>
</div>

