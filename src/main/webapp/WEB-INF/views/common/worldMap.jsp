<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>World Weather Map</title>
    <style>
        body {
            background: url("/resources/pictures/background/books.jpg") fixed;
        }
        .go-back-button-weather{
            margin-top: 20px;
            margin-bottom: 20px;
            color: #fff;
            font-weight: bold;
            text-transform: uppercase;
            background: #0fc3f5;
            transition: .3s;
            padding: 10px;
            font-size: 20px;
            outline: none;
            border: 1px solid #fff;
            box-sizing: border-box;
        }
    </style>
</head>
<body>
<div >
    <input type="button" value="Go back" onclick="history.back()" class="go-back-button-weather">
</div>
<iframe scrolling="no" frameBorder="0" src="https://pogoda.turtella.ru/i/cuxzg/map/#weather,,25.433349609375,54.381388250198725,7" style="width:100%; height: 80%; border: none;"></iframe>
</body>
</html>
