<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>edit_student_report</title>
    <style>
        label,
        textarea {
            font-size: .8rem;
            letter-spacing: 1px;
        }
        textarea {
            padding: 10px;
            line-height: 1.5;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-shadow: 1px 1px 1px #999;
        }

        label {
            display: block;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<div>
    <button id="text_size">Text size</button>
    <button id="text_style">Text style</button>
    <button id="export_pdf">Export in pdf</button>
</div>
<label for="textarea"></label>
<textarea id="textarea" rows="30" cols="265" value="${document}">${document}</textarea>
<!-- must be a form for saving -->
<div>
    <button id="save_report">Save</button>
</div>

</body>
<script src="${pageContext.request.contextPath}/resources/js/edit_student_report.js"></script>
</html>
