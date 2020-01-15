<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Log in with your account</title>
</head>
<body>
<div class="common_container">
    <c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION.message}">
        <div class="error">
            <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
        </div>
    </c:if>
    <form:form method="POST" class="form-signin">
        <h2 class="form-heading">Log in</h2>
        <div class="form-group">
            <input name="username" type="text" class="form-control" placeholder="Username"
                   autofocus="true"/>
            <input name="password" type="password" class="form-control" placeholder="Password"/>
            <button class="login_button" type="submit">Log In</button>
            <h4 class="text-center"><a href="<c:url value="/registration"/>">Create an account</a></h4>
        </div>
    </form:form>
</div>
</body>
</html>