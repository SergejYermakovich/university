<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>student_course_labs</title>
</head>
<body>
<h1>Student course labs:</h1>
<table>
    <tbody>
    <c:forEach var="lab" items="${labs}">
        <tr>
            <td>${lab.description}</td>
            <td>${lab.status}</td>
            <td><a href="${path}/${lab.report.fileDirectory}/${lab.report.fileName}.doc"> file.ext </a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
