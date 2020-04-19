<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Log in with your account</title>
    <script src="${pageContext.request.contextPath}/resources/js/common/login/login.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/login.css">
</head>
<body>
<%--<div class="common_container">--%>
<%--    <c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION.message}">--%>
<%--        <div class="error">--%>
<%--            <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />--%>
<%--        </div>--%>
<%--    </c:if>--%>
<%--    <form:form method="POST" class="form-signin">--%>
<%--        <h2 class="form-heading">Log in</h2>--%>
<%--        <div class="form-group">--%>
<%--            <input name="username" type="text" class="form-control" placeholder="Username"--%>
<%--                   autofocus="true"/>--%>
<%--            <input name="password" type="password" class="form-control" placeholder="Password"/>--%>
<%--            <button class="login_button" type="submit">Log In</button>--%>
<%--            <h4 class="text-center"><a href="<c:url value="/registration"/>">Create an account</a></h4>--%>
<%--        </div>--%>
<%--    </form:form>--%>
<%--</div>--%>

<form:form method="POST">
<div class="form">
    <h1>Log in</h1>
    <c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION.message}">
        <div class="error">
            <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
        </div>
    </c:if>
    <div class="input-form">
        <input name="username" type="text" placeholder="Username" autofocus="true"/>
    </div>
    <div class="input-form">
        <input name="password" type="password" placeholder="Password"/>
    </div>
    <div class="input-form">
        <input type="submit" value="Log In">
    </div>
    <h4><a href="<c:url value="/registration"/>">Create an account</a></h4>
</div>
</form:form>

</body>
</html>