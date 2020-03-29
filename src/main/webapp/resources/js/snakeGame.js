let score = 0, flag = false, vx = 1, vy = 0, inv, iter = 0;
let hgt = window.innerHeight;
let wdt = window.innerWidth;
let canvas, ctx, len;

let snake = {
    color : 'crimson',
    body  : []
}, food = {};

const getFood = () => {
    food.pX = Math.floor(Math.random()*(canvas.width/len));
    food.pY = Math.floor(Math.random()*(canvas.height/len));
    food.color = 'white';
    food.incr = 1;
    if(score >= 84) {
        food.color = 'darkred';
        food.incr = 8;
    }
    else if(score >= 55) {
        food.color = 'orangered';
        food.incr = 4;
    }
    else if(score >= 21) {
        food.color= 'yellow';
        food.incr = 2;
    }
};

const drawSnake = () => {
    ctx.save();
    ctx.beginPath();

    ctx.fillStyle = food.color;
    ctx.arc(food.pX*len+len/2, food.pY*len+len/2, len*3/8, 0, Math.PI*2, false);
    ctx.fill();
    ctx.fillStyle = snake.color;

    for(let i = 0;i !== snake.body.length; i++) {
        ctx.shadowBlur = 2;
        ctx.shadowColor = '#000';
        ctx.fillRect(snake.body[i].x*len, snake.body[i].y*len, len, len);
    }

    ctx.fillStyle = '#fff';
    ctx.font = '10pt consolas';
    ctx.fillText("Score : " + score,20,canvas.height-20);

    ctx.closePath();
    ctx.restore();
}

const gameOver = () => {
    cancelAnimationFrame(inv);
    document.querySelector('#over').style.visibility = 'visible';
    canvas.style.filter = 'blur(3px)';
    window.addEventListener('click', function Restart() {
        document.querySelector('#over').style.visibility = 'hidden';
        canvas.style.filter = 'none';
        vx = 1;
        vy = 0;
        window.removeEventListener('click', Restart);
        Start(document.querySelector('#level').value, document.querySelector('#color').value);
    });
}

const Start = (level = 32, chroma = 'crimson') => {
    snake.color = chroma;
    snake.body = [{
        x: 0,
        y: 0,
    }];
    score = 0;

    const movement = () => {
        inv = requestAnimationFrame(movement);
        iter = (iter+1)%level;

        ctx.clearRect(0 ,0, canvas.width, canvas.height);
        drawSnake();

        if(iter !== 1) {
            return;
        }

        let popX = snake.body[0].x, popY = snake.body[0].y;

        if(snake.body[0].x === food.pX && snake.body[0].y === food.pY) {
            score += food.incr;
            flag = false;
            getFood();
            flag = true;
            var tail = {x: popX,y: popY};
        }
        else {
            var tail = snake.body.pop();
            tail.x = popX, tail.y = popY;
        }
        snake.body.unshift(tail);
        for(let j = 2;j < snake.body.length; j++) {
            if(snake.body[0].x === snake.body[j].x && snake.body[0].y === snake.body[j].y) {
                clearInterval(inv);
                gameOver();
            }
        }
        snake.body[0].x += vx;
        snake.body[0].y += vy;

        if(snake.body[0].x < vx)
            snake.body[0].x = Math.floor(canvas.width/len);
        else if(snake.body[0].x > Math.floor(canvas.width/len))
            snake.body[0].x = 0;
        else if(snake.body[0].y < vy)
            snake.body[0].y = Math.floor(canvas.height/len)-1;
        else if(snake.body[0].y > Math.floor(canvas.height/len)-1)
            snake.body[0].y = 0;
    };

    document.querySelector('.up').onclick = () => { if(vy !== 1) vy = -1;vx = 0;};
    document.querySelector('.right').onclick = () => { if(vx !== -1) vx = 1;vy = 0;};
    document.querySelector('.left').onclick = () => { if(vx !== 1)vx = -1;vy = 0;};
    document.querySelector('.down').onclick = () => { if(vy !== -1)vy = 1;vx = 0;};

    document.querySelector('#submit').onclick = () => {
        cancelAnimationFrame(inv);
        Start(document.querySelector('#level').value, document.querySelector('#color').value);
    };

    window.onkeydown = (e) => {
        let key = e.which;
        if(key === 40 && vy !== -1) {vy = 1;vx = 0;}
        else if(key === 39 && vx !== -1) {vx = 1;vy = 0;}
        else if(key === 38 && vy !== 1) {vy = -1;vx = 0;}
        else if(key === 37 && vx !== 1) {vx = -1;vy = 0;}
    };

    getFood();
    movement();
};

window.onload = () => {
    canvas = document.querySelector('#Canvas');
    ctx = canvas.getContext('2d');

    let prcd = document.querySelector('#begin');
    prcd.innerHTML = 'Game Begins!';
    let newel = prcd.cloneNode(true);
    prcd.parentNode.replaceChild(newel,prcd);
    document.querySelector('#over').style.visibility = 'hidden';

    canvas.width = wdt;
    canvas.height = hgt;
    let btn = document.getElementsByTagName('button');
    for(let i = 0;i !== btn.length; i++) {
        btn[i].id = btn[i].innerHTML;
    }
    len = canvas.height*0.05;
    canvas.height = len*(Math.floor(canvas.height/len));
    canvas.width = len*(Math.floor(canvas.width/len));

    canvas.style.left = `${wdt/2-canvas.width/2}px`;
    Start();
};