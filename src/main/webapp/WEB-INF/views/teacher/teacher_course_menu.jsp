<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/teacher/course-menu.css">
<html>
<head>
    <title>Course menu</title>
</head>
<body>
<form>
    <input type="button" value="Go back!" onclick="history.back()" class="go-back">
</form>
<h1>Teacher course menu : </h1>
<label class="label-2-buttons">

        <input type="button" value="News adding"
               onclick="location.href='${pageContext.request.contextPath}/news/add/${course.id}'"
               class="get-button colorTwo">



        <input type="button" value="Labs adding"
               onclick="location.href='${pageContext.request.contextPath}/labs/add/${course.id}'"
               class="get-button colorThree">

</label>
<%--<li><a href="${pageContext.request.contextPath}/news/add/${course.id}">News adding</a></li>--%>
<%--<li><a href="${pageContext.request.contextPath}/labs/add/${course.id}">Labs adding</a></li>--%>

<table>
    <tbody>
    <c:forEach var="studentGroup" items="${studentGroups}">
        <tr>
            <td>Student group of this course:</td>
            <td>${studentGroup.name}</td>
            <td>
                <form>
                    <input type="button" value="go to"
                           onclick="location.href='${pageContext.request.contextPath}/teacher/courses/${course.id}/studentGroup/${studentGroup.id}'"
                           class="get-button colorOne">
                </form>
            </td>
            <td>
                <form>
                    <input type="button" value="Student statistics"
                           onclick="location.href='${pageContext.request.contextPath}/teacher/courses/${course.id}/studentGroup/${studentGroup.id}/statistics'"
                           class="get-button colorOne">
                </form>
            </td>
                <%--            <td>--%>
                <%--                <a href="${pageContext.request.contextPath}/teacher/courses/${course.id}/studentGroup/${studentGroup.id}">goto</a>--%>
                <%--            </td>--%>
                <%--            <td>--%>
                <%--                <a href="${pageContext.request.contextPath}/teacher/courses/${course.id}/studentGroup/${studentGroup.id}/statistics">Student--%>
                <%--                    statistics</a></td>--%>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
