<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/snakeGame.css">
    <script src="${pageContext.request.contextPath}/resources/js/snakeGame.js"></script>
    <title>Snake</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width = device-width, initial-scale = 1.0">
</head>
<body>
<canvas id = "Canvas"></canvas>
<div id = 'Controller'>
    <button class = 'up'></button>
    <button class = 'right'></button><br>
    <button class = 'left'></button>
    <button class = 'down'></button>
</div>
<select id = 'level'>
    <option value = '32'>Easy</option>
    <option value = '16'>Medium</option>
    <option value = '10'>Hard</option>
    <option value = '5'>Very Hard</option>
</select>
<select id = 'color'>
    <option value = 'crimson'>Crimson</option>
    <option value = 'dodgerblue'>DodgerBlue</option>
    <option value = 'lightgreen'>LightGreen</option>
    <option value = 'white'>White</option>
</select>
<button id = 'submit'>submit</button>
<div id = 'begin'>Game Begins!</div>
<div id = 'over'>
    <div id = 'main'>Game Over!</div>
    <div id = 'sub'>Click anywhere to play again</div>
</div>
</body>
</html>
