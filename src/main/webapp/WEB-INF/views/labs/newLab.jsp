<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>new Lab</title>
</head>
<body>
<h1>New lab adding:</h1>
<form:form commandName="lab">
    <table>
        <tr>
            <td>
                <form:label path="description">
                    <spring:message text="description:"/>
                </form:label>
            </td>
            <td>
                <form:input path="description"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="<spring:message text="Add new lab"/>"/>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>
