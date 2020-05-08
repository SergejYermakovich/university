<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Translator</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/translator.css">
    <script src="${pageContext.request.contextPath}/resources/js/translator.js"></script>
</head>
<body>
<form>
    <input type="button" value="Go back" onclick="history.back()" class="back">
</form>


<div class="display">

    <div class="from">
        <div class="lang-selc">
            <select class="select" id="fromLang">
                <option value="ar">Arabic</option>
                <option value="bn">Bengali</option>
                <option value="zh">Chinese</option>
                <option value="gu">Gujrati</option>
                <option value="it">Italian</option>
                <option value="es">Spanish</option>
                <option value="en" selected>English</option>
                <option value="hi">Hindi</option>
                <option value="ru">Russian</option>
            </select>
        </div>
        <div class="text-inp">
            <textarea placeholder="Enter text" class="input textarea-section" id="ttext"></textarea>
        </div>
    </div>
    <div class="to">
        <div class="lang-selc">
            <select class="select" id="toLang">
                <option value="ar">Arabic</option>
                <option value="bn">Bengali</option>
                <option value="zh">Chinese</option>
                <option value="gu" >Gujrati</option>
                <option value="it">Italian</option>
                <option value="es">Spanish</option>
                <option value="en">English</option>
                <option value="hi">Hindi</option>
                <option value="ru" selected>Russian</option>
                <option value="ja">Japanese</option>
                <option value="am">Amharic</option>
                <option value="he">Hebrew</option>
                <option value="ro">Rotokas</option>
                <option value="mi">Michif</option>
                <option value="ay">Ayapaneco</option>
                <option value="se">Sentinelese</option>
                <option value="xh">Xhosa</option>
                <option value="pi">Pidgin</option>
                <option value="vi">Vietnamese</option>
                <option value="ar">Archi</option>
                <option value="ri">Riau</option>
                <option value="ge">German</option>
            </select>
        </div>
        <div id="output" >
            <textarea id="output-text-area" class="textarea-section"></textarea>
        </div>
    </div>

</div>
</body>
</html>
