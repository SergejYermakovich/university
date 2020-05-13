<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/teacher/open-report.css">
<form>
    <input type="button" value="Go back" onclick="history.back()" class="go-back">
</form>
<label for="textarea"></label>
<textarea id="textarea" rows="30" cols="265" value="" disabled="true">
    ${document}
</textarea>

<div class="add-comment">
    <h1>Add comment:</h1>
    <form:form commandName="labComment">
        <form:label path="description" cssClass="label-description">
            <spring:message text="description:"/>
        </form:label>
        <form:input path="description" cssClass="input-comment"/>
        <input type="submit" value="add" class="add-comment-button"/>
    </form:form>
</div>

