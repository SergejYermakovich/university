<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/student/report.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <title>Student report</title>
</head>
<body>
<div>
    <form>
        <input type="button" value="Go back" onclick="history.back()" class="go-back">
    </form>

    <label>
        <select class="select-lang">
            <option value="ar">Arial Black</option>
            <option value="bn">Bookman Old Style</option>
            <option value="zh">Brush Script mt</option>
            <option value="gu">Calibri</option>
            <option value="it">Courier New</option>
            <option value="es">Lucida Sans Console</option>
            <option value="en" selected>Times New Roman</option>
            <option value="hi">Verdana</option>
            <option value="ru">Westminster</option>
        </select>
        <select class="select-lang">
            <option value="gu">6</option>
            <option value="it">8</option>
            <option value="es">10</option>
            <option value="en" selected>12</option>
            <option value="hi">14</option>
            <option value="ru">16</option>
            <option value="ru">18</option>
            <option value="hi">36</option>
            <option value="ru">72</option>
        </select>
        <button id="export_pdf">Export in pdf</button>
        <button id="import_file">Import file</button>
        <button id="save_report">Save</button>
    </label>
</div>
<label for="textarea"></label>
<textarea id="textarea" rows="30" cols="265" value="">${document}</textarea>


<c:if test="${labComments.size() > 0}">
    <div class="last-comment">
        <h1>Last comment:</h1>
        <h5>${lastComment.description}</h5>
        <h5> by ${lastComment.teacher.user.name} ${lastComment.teacher.user.surname}</h5>
        <h5> (date: ${lastComment.date})</h5>
    </div>
    <script>

    </script>
    <button id="get-all-comments" onclick="
            var allComments = 'All comments:\n';
    <c:forEach var="labComment" items="${labComments}">
            allComments+='${labComment.description}  by ${lastComment.teacher.user.name} ${lastComment.teacher.user.surname} (date: ${lastComment.date}) \n';
    </c:forEach>
            alert(allComments)">Get All Previous Comments
    </button>
</c:if>

<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
</body>
<script src="${pageContext.request.contextPath}/resources/js/edit_student_report.js"></script>
</html>
