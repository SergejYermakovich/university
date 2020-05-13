<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/teacher/courses.css">
<form>
    <input type="button" value="Go back!" onclick="history.back()" class="go-back">
</form>
<h1>Courses:</h1>
<table>
    <tbody>
    <c:forEach var="course" items="${courses}">
        <tr>
            <td>${course.name}</td>
            <td>${course.description}</td>
            <td>
<%--                <a href="${pageContext.request.contextPath}/teacher/courses/${course.id}">Course menu</a>--%>
                <form>
                    <input type="button" value="Course menu" onclick="location.href='${pageContext.request.contextPath}/teacher/courses/${course.id}'" class="get-button colorOne">
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

