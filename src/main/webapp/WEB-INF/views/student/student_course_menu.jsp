<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>student_course_menu</title>
</head>
<body>
<ul>
    <li><a href="${pageContext.request.contextPath}/student/courses/${courseId}/news">news of this course</a></li>
    <li><a href="${pageContext.request.contextPath}/student/courses/${courseId}/labs">your labs of this course</a></li>
</ul>
</body>
</html>
