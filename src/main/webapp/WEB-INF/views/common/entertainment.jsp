<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/entertainment.css">
<form>
    <input type="button" value="Go back!" onclick="history.back()" class="go-back-enter">
</form>
<%--<ul>--%>
<%--<li><a href="${pageContext.request.contextPath}/musicPlayer">Music player</a></li>--%>
<%--<li><a href="${pageContext.request.contextPath}/worldMap">Interactive world weather map</a></li>--%>
<%--<li><a href="${pageContext.request.contextPath}/snakeGame">Snake Game</a></li>--%>
<%--<li><a href="${pageContext.request.contextPath}/worldNews">World News</a></li>--%>
<%--</ul>--%>

    <div id="content-e">
        <div class="box home_box1 color1">
            <a href="${pageContext.request.contextPath}/musicPlayer" class="link">Music player</a>
        </div>

        <div class="box home_box1 color2">
            <a href="${pageContext.request.contextPath}/worldMap" class="link2">Interactive world weather map</a>
        </div>

        <div class="box home_box1 color3">
            <a href="${pageContext.request.contextPath}/snakeGame" class="link">Snake Game</a>
        </div>

        <div class="box home_box1 color4">
            <a href="${pageContext.request.contextPath}/worldNews" class="link">World News</a>
        </div>

    </div>