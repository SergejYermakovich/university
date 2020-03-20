<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>open_report_by_teacher</title>
</head>
<body>
<label for="textarea"></label>
<textarea id="textarea" rows="30" cols="265" value="" disabled="true">
    ${document}
</textarea>

<div>
    <h1>Add comment:</h1>

    <form:form commandName="labComment">
        <form:label path="description">
            <spring:message text="description:"/>
        </form:label>
        <form:input path="description"/>
        <input type="submit"
               value="<spring:message text="add"/>"/>
    </form:form>
</div>

</body>
</html>
