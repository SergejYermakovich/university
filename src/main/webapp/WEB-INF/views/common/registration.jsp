<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>Registration</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/registration.css">
</head>
<body>

<div class="input-form">
        <input type="button" value="Go back!" onclick="history.back()">
</div>

<div class="form">
    <form:form method="post" modelAttribute="user" action="registration">
        <h1>Student registration:</h1>
        <div class="input-form">
<%--            <label for="login">Login: </label>--%>
            <form:input path="login" id="login" placeholder="Login"/>
            <form:errors path="login"/>
        </div>

        <div class="input-form">
<%--            <label for="password">Password: </label>--%>
            <form:input path="password" id="password" placeholder="Password"/>
            <form:errors path="password"/>
        </div>

        <div class="input-form">
<%--            <label for="name">Name: </label>--%>
            <form:input path="name" id="name" placeholder="Name"/>
            <form:errors path="name"/>
        </div>

        <div class="input-form">
<%--            <label for="surname">Surname: </label>--%>
            <form:input path="surname" id="surname" placeholder="Surname"/>
            <form:errors path="surname"/>
        </div>

        <div class="input-form">
            <input type="submit" value="Submit"/>
        </div>

        <div class="error">
            <c:if test="${userExists!=null}">
                ${userExists}
            </c:if>
        </div>
    </form:form>
</div>
</body>
</html>