<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>student_course_menu</title>
</head>
<body>
<form>
    <input type="button" value="Go back!" onclick="history.back()">
</form>
<ul>
    <li><a href="${pageContext.request.contextPath}/student/courses/${courseId}/news">News of this course</a></li>
    <li><a href="${pageContext.request.contextPath}/student/courses/${courseId}/labs">Your labs of this course</a></li>
</ul>
</body>
</html>
