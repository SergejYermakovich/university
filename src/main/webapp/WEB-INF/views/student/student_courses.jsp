<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/student/courses.css">
<form>
    <input type="button" value="Go back!" onclick="history.back()" class="go-back">
</form>

<h1>My Courses:</h1>
<table>
    <tbody>
    <c:forEach var="course" items="${courses}">
        <tr>
            <td>${course.name}</td>
            <td>${course.description}</td>
            <td>
                <form>
                    <input type="button" value="News of this course" onclick="location.href='${pageContext.request.contextPath}/student/courses/${course.id}/news'" class="get-button colorOne">
                </form>
            </td>
            <td>
                <form>
                    <input type="button" value="Your labs of this course" onclick="location.href='${pageContext.request.contextPath}/student/courses/${course.id}/labs'" class="get-button colorTwo">
                </form>
            </td>
<%--            <td><a href="${pageContext.request.contextPath}/student/courses/${course.id}/news">News of this course</a> </td>--%>
<%--            <td><a href="${pageContext.request.contextPath}/student/courses/${course.id}/labs">Your labs of this course</a> </td>--%>
        </tr>
    </c:forEach>
    </tbody>
</table>
