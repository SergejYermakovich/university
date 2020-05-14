<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/teacher/student-stats.css">
<form>
    <input type="button" value="Go back!" onclick="history.back()" class="go-back">
</form>
<h1>Student group statistics: </h1>
<table border="2">
    <tr class="table-header">
        <td>id</td>
        <td>name</td>
        <td>surname</td>
        <td>in progress</td>
        <td>on review</td>
        <td>done</td>
        <td>percent of completed labs</td>
    </tr>
    <c:forEach var="stat" items="${studentLabStatistics}">
        <tr>
            <td class="id">${stat.student.id}</td>
            <td>${stat.student.user.name}</td>
            <td>${stat.student.user.surname}</td>
            <td>${stat.inProgress}</td>
            <td>${stat.onReview}</td>
            <td>${stat.done}</td>
            <td>${stat.done/allLabsQuantity*100} %</td>
        </tr>
    </c:forEach>
</table>

<form:form method="GET" action="/teacher/courses/${course.id}/studentGroup/${lab.student.studentGroup.id}/getMessageToBadStudents">
    <button type="submit" class="get-button colorOne">Send message to lagging students</button>
</form:form>
<%--<fmt:formatNumber value="${allLabsQuantity*100}" type = "percent"/>--%>

