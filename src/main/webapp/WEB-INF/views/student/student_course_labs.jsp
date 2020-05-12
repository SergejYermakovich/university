<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>student_course_labs</title>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/student/course-labs.css">
</head>
<body>
<form>
    <input type="button" value="Go back!" onclick="history.back()" class="go-back-button">
</form>
<h1>Student course labs:</h1>
<h2>IN PROGRESS:</h2>
<c:if test="${labsInProgress.size() eq 0}">
    <div class="no-labs">
        You do not have any labs In Progress
    </div>
</c:if>
<div class="progress">
    <table>
        <tbody>
        <c:forEach var="lab" items="${labsInProgress}">
            <tr>
                <td>${lab.description}</td>
                    <%--            <td>${lab.status}</td>--%>
                <td>IN PROGRESS</td>
                <td>
                    <form:form method="GET" action="report/${lab.report.fileName}">
                        <button type="submit" class="get-button colorOne">report</button>
                    </form:form>
                </td>
                <td>
                    <form:form method="GET" action="sendReportToReview/${lab.report.fileName}">
                        <button type="submit" class="get-button colorTwo">send to review</button>
                    </form:form>
                </td>
                <td>
                    <form:form method="GET" action="openManual/${lab.doc.fileName}">
                        <button type="submit" class="get-button colorOne">Open manual</button>
                    </form:form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<h2>IN REVIEW:</h2>
<c:if test="${labsInReview.size() eq 0}">
    <div class="no-labs">
        You do not have any labs In Review
    </div>
</c:if>
<div class="review">
    <table>
        <tbody>
        <c:forEach var="lab" items="${labsInReview}">
            <tr>
                <td>${lab.description}</td>
                <td>${lab.status}</td>
                <td>
                    <form:form method="GET" action="backReportToInProgress/${lab.report.fileName}">
                        <button type="submit" class="get-button colorOne">back to IN PROGRESS</button>
                    </form:form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<h2>DONE:</h2>
<c:if test="${labsDone.size() eq 0}">
    <div class="no-labs">
        You do not have any Done labs
    </div>
</c:if>
<div class="done">
    <table>
        <tbody>
        <c:forEach var="lab" items="${labsDone}">
            <tr>
                <td>${lab.description}</td>
                <td>${lab.status}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
