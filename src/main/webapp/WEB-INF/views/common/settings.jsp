<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/settings.css">
<div >
    <input type="button" value="Go back" onclick="history.back()" class="go-back-button">
</div>

<div class="form">
    <h1>Personal Info Settings:</h1>
    <form:form method="post" modelAttribute="user" action="updateUserInSettings">
        <div class="input-form">
            <h2>Login:</h2>
            <form:input path="login" id="login" placeholder="Login"/>
            <form:errors path="login"/>
        </div>

        <div class="input-form">
            <h2>Password:</h2>
            <form:input path="password" id="password" placeholder="Password"/>
            <form:errors path="password"/>
        </div>


        <div class="input-form">
            <input type="submit" value="Update user"/>
        </div>
    </form:form>

</div>
