 <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome admin</title>
</head>
<body>
<h1>Welcome , admin!!!!</h1>
<ul>
    <li><a href="${pageContext.request.contextPath}/message/createMessageDialog">Message menu</a> ${messageCounter}</li>
    <li><a href="${pageContext.request.contextPath}/admin/panel">Admin panel</a></li>
    <li><a href="${pageContext.request.contextPath}/admin/search">User searching</a></li>
    <li><a href="${pageContext.request.contextPath}/admin/createTeacher">createTeacher</a></li>
    <li><a href="${pageContext.request.contextPath}/instruments">Instruments</a></li>
    <li><a href="${pageContext.request.contextPath}/entertainment">Entertainment</a></li>
    <li><a href="${pageContext.request.contextPath}/notifications">Notifications</a> ${notificationCounter}</li>
</ul>
</body>
</html>
