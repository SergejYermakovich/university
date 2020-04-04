<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Entertainment</title>
</head>
<body>
<form>
    <input type="button" value="Go back!" onclick="history.back()">
</form>
<ul>
<li><a href="${pageContext.request.contextPath}/musicPlayer">Music player</a></li>
<li><a href="${pageContext.request.contextPath}/worldMap">Interactive world weather map</a></li>
<li><a href="${pageContext.request.contextPath}/snakeGame">Snake Game</a></li>
<li><a href="${pageContext.request.contextPath}/worldNews">World News</a></li>
</ul>
</body>
</html>
