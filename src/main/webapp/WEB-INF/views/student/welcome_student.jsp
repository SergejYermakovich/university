<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome student</title>
</head>
<body>
<h1>Welcome , student!!!</h1>
<ul>
    <li><a href="${pageContext.request.contextPath}/message/createMessageDialog">Message menu</a> ${messageCounter}</li>
    <li><a href="${pageContext.request.contextPath}/student/news">News</a></li>
    <!-- <li><a href="${pageContext.request.contextPath}/student/labs">All labs</a></li> -->
    <li><a href="${pageContext.request.contextPath}/student/courses">All courses</a></li>
    <li><a href="${pageContext.request.contextPath}/instruments">Instruments</a></li>
    <li><a href="${pageContext.request.contextPath}/entertainment">Entertainment</a></li>
    <li><a href="${pageContext.request.contextPath}/notifications">Notifications</a> ${notificationCounter}</li>
</ul>
</body>
</html>
