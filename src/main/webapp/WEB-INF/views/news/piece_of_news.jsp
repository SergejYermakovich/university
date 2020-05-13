<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/news/piece.css">
<form>
    <input type="button" value="Go back!" onclick="history.back()" class="go-back">
</form>
<div class="form">
    <h1>Create news:</h1>
    <form:form commandName="news">
        <div class="input-form">
            <form:label path="name" cssClass="label-for-form">
                <spring:message text="name:"/>
            </form:label>
            <form:input path="name"/>
        </div>
        <div class="input-form">
            <form:label path="description"  cssClass="label-for-form">
                <spring:message text="description:"/>
            </form:label>
            <form:input path="description"/>
        </div>
        <div class="input-form">
            <input type="submit" value="Add"/>
        </div>
    </form:form>
</div>