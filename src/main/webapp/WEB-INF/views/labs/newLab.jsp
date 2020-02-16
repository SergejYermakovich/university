<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>new Lab</title>
</head>
<body>
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
                <form:input path="description"/>
            </td>
        </tr>
        <tr>
            <td>
                <input type="file" name="file">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="<spring:message text="Add new lab"/>"/>
            </td>
        </tr>
    </table>
</form:form>

<h1>Issued lab list:</h1>
<table>
    <thead>
    <tr>
        <th>id</th>
        <th>description</th>
        <th>course name</th>
    </tr>
    </thead>
    <c:forEach var="lab" items="${labs}">
        <tr>
            <td>${lab.id}</td>
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
