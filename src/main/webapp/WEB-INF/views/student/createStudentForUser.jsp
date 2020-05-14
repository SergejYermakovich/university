<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/registration.css">
<html>
<head>
    <title>Create Student For User</title>
    <style>

    </style>
</head>
<body>
<div class="input-form">
    <input type="button" value="Go back!" onclick="history.back()">
</div>

<div class="form">
    <h1>Enter some new info: </h1>
    <form:form method="post" modelAttribute="studentInDto" action="createStudentForUser">

        <div class="input-form">
                        <label for="studentGroup">Student group: </label>
            <form:select path="studentGroup">
                <form:options items="${groups}"/>
            </form:select>
            <form:errors path="studentGroup"/>
        </div>

        <div class="input-form">
                <%--        <label for="address">Address: </label>--%>
            <form:input path="address" id="address" placeholder="address"/>
            <form:errors path="address"/>
        </div>

        <div class="input-form">
                <%--        <label for="nationality">nationality: </label>--%>
            <form:input path="nationality" id="nationality" placeholder="nationality"/>
            <form:errors path="nationality"/>
        </div>

        <div class="input-form">
            <input type="submit" value="Submit"/>
        </div>
    </form:form>
</div>
</body>
</html>
