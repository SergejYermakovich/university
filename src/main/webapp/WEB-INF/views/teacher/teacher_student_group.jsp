<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/teacher/course-labs.css">
<html>
<head>
    <title>Teacher student group</title>
</head>
<body>
<form>
    <input type="button" value="Go back!" onclick="history.back()" class="go-back-button">
</form>
<h1>Teacher student group:</h1>
<h2>IN PROGRESS</h2>
<c:if test="${labsInProgress.size() eq 0}">
    <div class="no-labs">
        No labs In Progress
    </div>
</c:if>
<div class="progress">
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
</div>

<h2>IN REVIEW</h2>
<c:if test="${labsInReview.size() eq 0}">
    <div class="no-labs">
        No labs In Review
    </div>
</c:if>
<div class="review">
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
                    <form:form method="GET"
                               action="/teacher/courses/${lab.course.id}/studentGroup/${lab.student.studentGroup.id}/openReport/${lab.report.fileName}">
                        <button type="submit" class="get-button colorOne">Open report</button>
                    </form:form>
                </td>
                <td>
                    <form:form method="GET"
                               action="/teacher/courses/${lab.course.id}/studentGroup/${lab.student.studentGroup.id}/approveReport/${lab.report.fileName}">
                        <button type="submit" class="get-button colorOne">Approve</button>
                    </form:form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<h2>DONE</h2>
<c:if test="${labsDone.size() eq 0}">
    <div class="no-labs">
        No Done labs
    </div>
</c:if>
<div class="done">
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
</div>
</body>
</html>