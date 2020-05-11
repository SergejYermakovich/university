<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/instruments.css">
<form>
    <input type="button" value="Go back!" onclick="history.back()"  class="go-back-enter">
</form>

<%--<ul>--%>
<%--    <li><a href="${pageContext.request.contextPath}/compilerC">C/C++ compiler</a></li>--%>
<%--    <li><a href="${pageContext.request.contextPath}/compilerJava">Java compiler</a></li>--%>
<%--    <li><a href="${pageContext.request.contextPath}/calculator">Calculator</a></li>--%>
<%--    <li><a href="${pageContext.request.contextPath}/translate">Translation</a></li>--%>
<%--</ul>--%>

<div id="content-e">
    <div class="box home_box1 color1">
        <a href="${pageContext.request.contextPath}/compilerC" class="link">C/C++ compiler</a>
    </div>

    <div class="box home_box1 color2">
        <a href="${pageContext.request.contextPath}/compilerJava" class="link">Java compiler</a>
    </div>

    <div class="box home_box1 color3">
        <a href="${pageContext.request.contextPath}/calculator" class="link">Calculator</a>
    </div>

    <div class="box home_box1 color4">
        <a href="${pageContext.request.contextPath}/translate" class="link">Translation</a>
    </div>

</div>