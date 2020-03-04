<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>teacher student group</title>
</head>
<body>
<h1>teacher student group:</h1>
<h2>IN_PROGRESS</h2>
<table>
    <tbody>
    <c:forEach var="lab" items="${labsInProgress}">
        <tr>
            <td>${lab.description}</td>
            <td>${lab.status}</td>
            <td>${lab.student.studentGroup.name}</td>
            <td>${lab.student.user.name}</td>
            <td>${lab.student.user.surname}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<h2>IN_REVIEW</h2>
<table>
    <tbody>
    <c:forEach var="lab" items="${labsInReview}">
        <tr>
            <td>${lab.description}</td>
            <td>${lab.status}</td>
            <td>${lab.student.studentGroup.name}</td>
            <td>${lab.student.user.name}</td>
            <td>${lab.student.user.surname}</td>
            <td>
                <form:form method="GET" action="/teacher/courses/${lab.course.id}/studentGroup/${lab.student.studentGroup.id}/openReport/${lab.report.fileName}">
                    <button type="submit">Open report</button>
                </form:form>
            </td>
            <td>
                <form:form method="GET" action="/teacher/courses/${lab.course.id}/studentGroup/${lab.student.studentGroup.id}/approveReport/${lab.report.fileName}">
                    <button type="submit">Approve</button>
                </form:form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<h2>DONE</h2>
<table>
    <tbody>
    <c:forEach var="lab" items="${labsDone}">
        <tr>
            <td>${lab.description}</td>
            <td>${lab.status}</td>
            <td>${lab.student.studentGroup.name}</td>
            <td>${lab.student.user.name}</td>
            <td>${lab.student.user.surname}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>