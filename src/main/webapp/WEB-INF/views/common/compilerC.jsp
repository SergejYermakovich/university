<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Compiler</title>
    <script src="<c:url value="/resources/js/ace.js"/>"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <style type="text/css" media="screen">
        #code {
            width: 100%;
            float: left;
            min-height: 100px;
            overflow: hidden;
        }
    </style>
</head>
<body>
<form>
    <input type="button" value="Go back!" onclick="history.back()">
</form>
<div id="code">
</div>
<button id="run" onclick='run();'>Run</button>
<p>Output:</p>
<pre id="output">Waiting...</pre>

<script>
    var code;
    code = ace.edit("code");                      // создаем редактор из элемента с id="code"
    code.setTheme("ace/theme/textmate");          // выбираем тему оформления для подсветки синтаксиса
    code.getSession().setMode("ace/mode/c_cpp");  // говорим что код надо подсвечивать как C++ код
    code.setShowPrintMargin(false);               // опционально: убираем вертикальную границу в 80 сиволов
    code.setOptions({
        maxLines: Infinity,                       // опционально: масштабировать редактор вертикально по размеру кода
        fontSize: "12pt",                         // опционально: размер шрифта ставим побольше
    });
    code.$blockScrolling = Infinity;              // отключаем устаревшие, не поддерживаемые фишки редактора

    function run() {
        // var cmd = "g++ -Wall main.cpp -o main_prog && echo 'Compilation: SUCCESS."
        //     + " Program output is:\n' && ./main_prog && echo \"\nExit code: $?\"";

        var cmd = "g++ -Wall main.cpp -o main_prog && echo  && ./main_prog";
        var output = $("#output");
        output.text('');
        var to_compile = {
            "src": code.getValue(),
            "cmd": cmd,
        };
        output.text("Executing... Please wait.");

        $.ajax({
            url: "http://coliru.stacked-crooked.com/compile",
            type: "POST",
            data: JSON.stringify(to_compile),
            contentType: "text/plain; charset=utf-8",
            dataType: "text"
        }).done(function (data) {
            output.text(data);
        }).fail(function (data) {
            output.text("Server error: " + data);
        });
    }
</script>
</body>
</html>
