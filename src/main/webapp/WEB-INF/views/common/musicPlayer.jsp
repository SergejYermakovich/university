<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>

<html lang="en" >
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="UTF-8">
    <title>Music Player | Abdul Moqueet</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link href="https://fonts.googleapis.com/css?family=Changa+One|Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/musicPlayer.css">
    <script src="${pageContext.request.contextPath}/resources/js/musicPlayer.js"></script>
</head>
<body>

<div id="loading">

    <p class="loading-text">Loading . . .</p>
    <p class="by">Music Player by:<br>Abdul Moqueet</p>

</div>

<div class="main-container">

    <div class="left-pannel">

        <div class="left-pannel__your-play-list">Your Play List <i class="material-icons">  library_music</i></div>

        <div>
            <div class="left-pannel__recent">_Recent</div>
            <div class="left-pannel__like">Like</div>
        </div>

    </div>

    <div class="top">
        <div class="top__cards-holder" id="cards-holder">
        </div>
    </div>

    <div class="middle" id="songs-list">

    </div>

    <div class="bottom">

        <div class="bottom__warpper">
            <i class="material-icons bottom__up-arrow" onclick="showToast();">
                keyboard_arrow_up
            </i>


            <div class="bottom__song-info">
                <div class="bottom__song-info__name" id="bottom-song-name">Sing Me To Sleep</div>
                <div class="bottom__song-info__singer-name" id="bottom-singer-name">Alan Walker</div>
            </div>
        </div>

        <div class="bottom__progress-warpper">

            <div class="bottom__progress-warpper__time_duration" id="time-duration">00:00 / 00:00</div>

            <div class="bottom__progress" id="progress">
                <div class="bottom__progress__bar" id="bar"></div>
            </div>

            <div class="bottom__progress__status" id="bufferingStatus">Buffering...</div>

        </div>

        <i class="material-icons bottom__play-button" id="play-btn">
            play_arrow
        </i>

    </div>
</div>

<audio id="media-player" preload="auto">
    <source id="audio-source" src="songs/Sing_Me_To_Sleep.mp3" type="audio/mpeg">
</audio>

<div id="toast"><p>Coming in next verison</p></div>

<div class="not-supported"><p>Sorry Minimum 350px Screen Height Required.</p></div>

</body>
</html>