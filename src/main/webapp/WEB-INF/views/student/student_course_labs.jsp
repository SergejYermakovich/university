<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>student_course_labs</title>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
<h1>Student course labs:</h1>
<h2>IN_PROGRESS</h2>
<table>
    <tbody>
    <c:forEach var="lab" items="${labsInProgress}">
        <tr>
            <td>${lab.description}</td>
            <td>${lab.status}</td>
            <td>
            <form:form method="GET" action="report/${lab.report.fileName}">
                    <button type="submit">report</button>
            </form:form>
            </td>
            <td>
                <form:form method="GET" action="sendReportToReview/${lab.report.fileName}">
                    <button type="submit">send to review</button>
                </form:form>
            </td>
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
            <td>
                <form:form method="GET" action="backReportToInProgress/${lab.report.fileName}">
                    <button type="submit">back to IN_PROGRESS</button>
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
            <td><a href="${path}/${lab.report.fileDirectory}/${lab.report.fileName}.doc"> report </a></td>
            <td></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
