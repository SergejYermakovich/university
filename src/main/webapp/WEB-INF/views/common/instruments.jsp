<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Instruments</title>
</head>
<body>
<form>
    <input type="button" value="Go back!" onclick="history.back()">
</form>
<h1>Instruments:</h1>
<ul>
    <li><a href="${pageContext.request.contextPath}/compilerC">C/C++ compiler</a></li>
    <li><a href="${pageContext.request.contextPath}/compilerJava">Java compiler</a></li>
    <li><a href="${pageContext.request.contextPath}/calculator">Calculator</a></li>
    <li><a href="${pageContext.request.contextPath}/translate">Translation</a></li>
</ul>
</body>
</html>
