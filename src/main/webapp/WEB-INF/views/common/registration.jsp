<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>Registration</title>
</head>
<body>
<form>
    <input type="button" value="Go back!" onclick="history.back()">
</form>
<div class="common_container">
    <form:form method="post" modelAttribute="user" action="registration">
        <label for="login">Login: </label>
        <form:input path="login" id="login" placeholder="login"/>
        <form:errors path="login"/>
        <label for="password">Password: </label>
        <form:input path="password" id="password" placeholder="password"/>
        <form:errors path="password"/>
        <label for="name">Name: </label>
        <form:input path="name" id="name" placeholder="name"/>
        <form:errors path="name"/>
        <label for="surname">Surname: </label>
        <form:input path="surname" id="surname" placeholder="surname"/>
        <form:errors path="surname"/>
        <input type="submit" value="Submit" class="register_button"/>
        <c:if test="${userExists!=null}">
            ${userExists}
        </c:if>
    </form:form>
</div>
</body>
</html>