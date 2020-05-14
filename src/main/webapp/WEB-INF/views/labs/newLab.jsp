<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/labs/new-lab.css">
<html>
<head>
    <title>new Lab</title>
</head>
<body>
<form>
    <input type="button" value="Go back!" onclick="history.back()" class="go-back">
</form>
<h1>New lab adding:</h1>
<form:form commandName="lab" enctype="multipart/form-data" action="/labs/add/${course.id}?_csrf=${_csrf.token}">
    <table>
        <tr>
            <td>
                <form:label path="description">
                    <spring:message text="description:"/>
                </form:label>
            </td>
            <td>
                <form:input path="description" cssClass="input-description"/>
            </td>
        </tr>
        <tr>
            <td>
                choose a method file:
            </td>
            <td>
                <input id="input__file" type="file" name="file"   class="get-button colorTwo" title="choose a file" placeholder="choose a file">

            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="<spring:message text="Add new lab"/>" class="get-button colorTwo"/>
            </td>
        </tr>
    </table>
</form:form>

<h1>Issued lab list:</h1>
<table>
    <thead>
    <tr>
        <th>№</th>
        <th>description</th>
        <th>course name</th>
        <th>name</th>
        <th>surname</th>
        <th>group</th>
    </tr>
    </thead>
    <c:forEach var="lab" items="${labs}">
        <tr>
            <td class="id">${lab.id}</td>
            <td>${lab.description}</td>
            <td>${lab.course.name}</td>
            <td>${lab.student.user.name}</td>
            <td>${lab.student.user.surname}</td>
            <td>${lab.student.studentGroup.name}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
