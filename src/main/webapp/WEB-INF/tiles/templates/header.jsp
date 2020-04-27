<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<link href="<c:url value="/resources/css/templates.css" />" rel="stylesheet">
<div class="header">

    <div class="inlineHead"><h3>A dream becomes a goal when action is taken to its achievement!</h3></div>
    <div class="inlineHead"><h3>Today <%= new java.util.Date() %>
    </h3></div>
    <div class="inlineHead">
        <form:form action="/logout" method="post">
            <input type="submit" value="Log out" class="logout-button">
        </form:form>
    </div>
</div>
`