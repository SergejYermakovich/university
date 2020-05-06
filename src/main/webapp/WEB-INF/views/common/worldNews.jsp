<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>World News</title>
    <link href='https://fonts.googleapis.com/css?family=Aguafina Script|Akronim|Aldrich|Alegreya|Alex Brush|Allerta Stencil|Allura|Almendra
    SC|Amethysta|Annie Use Your Telescope|Arbutus|Arizonia|Asset|Astloch|Bad Script|Barrio|Bellefair|Berkshire Swash|Bilbo|BioRhyme
    Expanded|Bonbon|Butcherman|Butterfly Kids|Caveat|Charmonman|Cinzel Decorative|Codystar|Crafty Girls|Dawning of a New Day|Faster
    One|Frijole|Geostar|Give You Glory|Hi Melody|Italianno|Jacques Francois Shadow|KhandMajor Mono Display|Meddon|Miltonian|Monofett|Monoton|Mystery
    Quest|Nosifer|Orbitron|Petit Formal Script|Sacramento|Shadows Into Light Two|Snowburst One|Dancing Script|Vibur|Raleway'
          rel='stylesheet'>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/worldNews.css">
    <script src="${pageContext.request.contextPath}/resources/js/worldNews.js"></script>
</head>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<div id="tit" align="center">
    <button onclick="helo('Business')">Business</button>
    <button onclick="helo('Entertainment')">Entertainment</button>
    <button onclick="helo('General')">General</button>
    <button onclick="helo('Health')">Health</button>
    <button onclick="helo('Science')">Science</button>
    <button onclick="helo('Sports')">Sports</button>
    <button onclick="helo('Technology')">Technology</button>
</div>

<div id="con" align="center">
    <div id="news1" align="center" class="n">
        <h4 id="pb1"></h4>
        <p id="li1"></p>
        <h3 id="tit1"></h3>
        <p id="des1"></p>
    </div>
    <div id="news2" align="center" class="n">
        <h4 id="pb2"></h4>
        <p id="li2"></p>
        <h3 id="tit2"></h3>
        <p id="des2"></p>
    </div>
    <div id="news3" align="center" class="n">
        <h4 id="pb3"></h4>
        <p id="li3"></p>
        <h3 id="tit3"></h3>
        <p id="des3"></p>
    </div>
    <div id="news4" align="center" class="n">
        <h4 id="pb4"></h4>
        <p id="li4"></p>
        <h3 id="tit4"></h3>
        <p id="des4"></p>
    </div>
    <div id="news5" align="center" class="n">
        <h4 id="pb5"></h4>
        <p id="li5"></p>
        <h3 id="tit5"></h3>
        <p id="des5"></p>
    </div>
</div>
</body>
</html>
