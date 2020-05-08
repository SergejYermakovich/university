<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>calculator</title>
    <style>
        body {
            background: url("/resources/pictures/background/books.jpg") fixed;
        }
        #calculator {
            width: 325px;
            height: auto;

            margin: 50px auto;
            padding: 20px 20px 9px;

            background: #9dd2ea;
            background: linear-gradient(#9dd2ea, #8bceec);
            box-shadow: 0px 4px #009de4, 0px 10px 15px rgba(0, 0, 0, 0.2);
            zoom: 2;
        }

        .top span.clear {
            float: left;
        }

        .top .screen {
            height: 40px;
            width: 212px;

            float: right;

            padding: 0 10px;

            background: rgba(0, 0, 0, 0.2);

            box-shadow: inset 0px 4px rgba(0, 0, 0, 0.2);

            font-size: 17px;
            line-height: 40px;
            color: white;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
            text-align: right;
            letter-spacing: 1px;
        }

        .keys, .top {overflow: hidden;}

        .keys span, .top span.clear {
            float: left;
            position: relative;
            top: 0;

            cursor: pointer;

            width: 66px;
            height: 36px;

            background: white;
            box-shadow: 0px 4px rgba(0, 0, 0, 0.2);

            margin: 0 7px 11px 0;

            color: #888;
            line-height: 36px;
            text-align: center;

            user-select: none;

            transition: all 0.2s ease;
        }

        .keys span.operator {
            background: #FFF0F5;
            margin-right: 0;
        }

        .keys span.eval {
            background: #f1ff92;
            box-shadow: 0px 4px #9da853;
            color: #888e5f;
        }

        .top span.clear {
            background: #ff9fa8;
            box-shadow: 0px 4px #ff7c87;
            color: white;
        }

        /* Some hover effects */
        .keys span:hover {
            background: #9c89f6;
            box-shadow: 0px 4px #6b54d3;
            color: white;
        }

        .keys span.eval:hover {
            background: #abb850;
            box-shadow: 0px 4px #717a33;
            color: #ffffff;
        }

        .top span.clear:hover {
            background: #f68991;
            box-shadow: 0px 4px #d3545d;
            color: white;
        }

        .keys span:active {
            box-shadow: 0px 0px #6b54d3;
            top: 4px;
        }

        .keys span.eval:active {
            box-shadow: 0px 0px #717a33;
            top: 4px;
        }

        .top span.clear:active {
            top: 4px;
            box-shadow: 0px 0px #d3545d;
        }
        .back {
            margin-top: 20px;
            color: #fff;
            font-weight: bold;
            text-transform: uppercase;
            padding: 10px;
            font-size: 20px;
            outline: none;
            border: 1px solid #fff;
            box-sizing: border-box;
            background: #0fc3f5;
            transition: .3s;
        }
    </style>
</head>
<body>
<form>
    <input type="button" value="Go back" onclick="history.back()" class="back">
</form>
<div id="calculator">
    <div class="top">
        <span class="clear">C</span>
        <div class="screen"></div>
    </div>

    <div class="keys">
        <span>7</span>
        <span>8</span>
        <span>9</span>
        <span class="operator">+</span>
        <span>4</span>
        <span>5</span>
        <span>6</span>
        <span class="operator">-</span>
        <span>1</span>
        <span>2</span>
        <span>3</span>
        <span class="operator">÷</span>
        <span>0</span>
        <span>.</span>
        <span class="eval">=</span>
        <span class="operator">x</span>
    </div>
</div>

<%--<!-- PrefixFree -->--%>
<%--<script src="http://thecodeplayer.com/uploads/js/prefixfree-1.0.7.js" type="text/javascript" type="text/javascript"></script>--%>
</body>
<!-- PrefixFree -->
<script src="http://thecodeplayer.com/uploads/js/prefixfree-1.0.7.js" type="text/javascript" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/calculator.js" type="text/javascript" type="text/javascript"></script>
</html>
