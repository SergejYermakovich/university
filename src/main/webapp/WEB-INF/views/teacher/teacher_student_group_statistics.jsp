<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>teacher_student_group_statistics</title>
</head>
<body>

<h2>teacher_student_group_statistics: </h2>
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
            <td>${stat.student.id}</td>
            <td>${stat.student.user.name}</td>
            <td>${stat.student.user.surname}</td>
            <td>${stat.inProgress}</td>
            <td>${stat.onReview}</td>
            <td>${stat.done}</td>
            <td>${stat.done/allLabsQuantity*100} %</td>
        </tr>
    </c:forEach>
</table>
<%--<fmt:formatNumber value="${allLabsQuantity*100}" type = "percent"/>--%>
</body>
</html>
