<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<link href="<c:url value="/resources/css/templates.css" />" rel="stylesheet">
<div class="header">

    <div class="inlineHead">
        <h3>A dream becomes a goal when action is taken to its achievement!</h3>
    </div>
    <div class="inlineHead">
        <h3>Today <%= new java.util.Date() %>
        </h3>
    </div>

    <div class="inlineHead logout-button">
        <form:form action="/logout" method="post">
            <input type="submit" value="X" class="logout-style">
        </form:form>
    </div>

    <div class="inlineHead info-button">
        <input type="submit" value="?" class="info-style" onclick="
            alert(
                'if you have a problem You can call on :\n' +
             '+375 33 334 33 33 (MTC)')">
    </div>
</div>