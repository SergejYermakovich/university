<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/userInfo.css">
<form>
    <input type="button" value="Go back!" onclick="history.back()" class="go-back">
</form>

<h1>User Info: </h1>
<table>
    <tbody>
        <tr>
            <td>user.id:</td>
            <td>${user.id}</td>
        </tr>

        <tr>
            <td>user.name:</td>
            <td>${user.name}</td>
        </tr>

        <tr>
            <td>user.surname:</td>
            <td>${user.surname}</td>
        </tr>

        <tr>
            <td>user.active:</td>
            <td>${user.active}</td>
        </tr>

        <tr>
            <td>user.role:</td>
            <td>${userRole}</td>
        </tr>
    </tbody>
</table>


