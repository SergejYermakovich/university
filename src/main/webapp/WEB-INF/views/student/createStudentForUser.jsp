<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Student For User</title>
</head>
<body>
<form>
    <input type="button" value="Go back!" onclick="history.back()">
</form>
<div class="common_container">
    <h2>Enter some new info: </h2>
    <form:form method="post" modelAttribute="studentInDto" action="createStudentForUser">
        <label for="studentGroup">Student group: </label>
        <form:select path="studentGroup">
            <form:options items="${groups}"/>
        </form:select>
        <form:errors path="studentGroup"/>
        <label for="address">Address: </label>
        <form:input path="address" id="address" placeholder="address"/>
        <form:errors path="address"/>
        <label for="nationality">nationality: </label>
        <form:input path="nationality" id="nationality" placeholder="nationality"/>
        <form:errors path="nationality"/>
        <input type="submit" value="Submit"/>
    </form:form>
</div>
</body>
</html>
