<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Translator</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/translator.css">
    <script src="${pageContext.request.contextPath}/resources/js/translator.js"></script>
</head>
<body>
<form>
    <input type="button" value="Go back!" onclick="history.back()">
</form>
<%-- <div>--%>
<%--&lt;%&ndash;     <iframe src="https://translate.google.by/#view=home&op=translate&sl=en&tl=ru"  width="100%" height="480">&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;         <iframe class="embed-responsive-item" src="https://translate.yandex.by/" allowfullscreen width="100%" height="480">&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;     </iframe>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <frame src="https://translate.google.by/#view=home&op=translate&sl=en&tl=ru"  width="100%" height="480" />&ndash;%&gt;--%>
<%--    <frame src="https://translate.google.by"/>--%>
<%-- </div>--%>



<%--<h1>My Web Page</h1>--%>
<%--<p>Hello everybody!</p>--%>
<%--<p>Translate this page:</p>--%>
<%--<div id="google_translate_element"></div>--%>
<%--<script type="text/javascript">--%>
<%--    function googleTranslateElementInit() {--%>
<%--        new google.translate.TranslateElement({pageLanguage: 'en'}, 'google_translate_element');--%>
<%--    }--%>
<%--</script>--%>
<%--<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>--%>
<%--<p>You can translate the content of this page by selecting a language in the select box.</p>--%>

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
            <textarea placeholder="Enter text" class="input" id="ttext"></textarea>
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
        <div id="output">
            <textarea id="output-text-area"></textarea>
        </div>
    </div>

</div>
</body>
</html>
