<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>show Message Dialog</title>
</head>
<body>

<table>
    <tbody>
    <c:forEach var="message" items="${messageList}">
        <tr>
            <td>${message.from.login}</td>
            <td>${message.text}</td>
            <td>${message.date}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<form:form commandName="newMessage">
    <table>
        <tr>
            <td>
                <form:label path="text">
                    <spring:message text="text:"/>
                </form:label>
            </td>
            <td>
                <form:input path="text"/>
            </td>

        </tr>
        <tr>
            <td colspan="2">
                <input type="submit"
                       value="<spring:message text="send"/>"/>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>
