<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Course Administration</title>
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
            <td>Description</td>
            <td>Teacher</td>
            <td>Delete</td>
        </tr>
        <c:forEach var="course" items="${courses}">
            <tr>
                <td>${course.id}</td>
                <td>${course.name}</td>
                <td>${course.description}</td>
                <td>${course.teacher.user.surname}</td>
                <td>
                    <a href="<c:url value='/admin/deleteCourse/${course.id}'/>">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<br>
<br>

<div>
    <form:form method="post" modelAttribute="courseInDto" action="/admin/addCourse">

        <label for="name">Name: </label>
        <form:input path="name" id="name" placeholder="name"/>
        <form:errors path="name"/>

        <label for="description">Description: </label>
        <form:input path="description" id="description" placeholder="description"/>
        <form:errors path="description"/>

        <label for="teacher">Teacher:</label>
        <form:select path="teacher">
            <form:options items="${teachers}"/>
        </form:select>
        <form:errors path="teacher"/>

        <label for="studentGroup">StudentGroup:</label>
        <form:select path="studentGroup">
            <form:options items="${studentGroups}"/>
        </form:select>
        <form:errors path="studentGroup"/>

        <input type="submit" value="Add Course"/>
    </form:form>
</div>

</body>
</html>
