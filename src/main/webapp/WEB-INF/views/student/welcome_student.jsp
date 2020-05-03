<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/student/welcome-student.css">
<div id="templatemo_main">
    <div id="content">
        <div id="home" class="section">

            <div id="home_about" class="box">
                <br>
                <h2>Welcome, student</h2>
                <p>System is made by <a href="http://www.vk.com/sergu98">Siarhei Yermakovich</a> for everyone on
                    <a href="http://www.spring.com">Spring Framework</a> and it can be used for educational purpose.
                    <br>
                    The <strong>News</strong> section is intended to display all current news of the course.
                    <br>
                    <strong>Messages</strong> section is necessary to send messages to absolutely all users of this service.
                    You can contact your teacher or service administrator and solve any of your questions.
                    <br>
                    In the <strong>Courses</strong> section you will find out all the information about your courses,
                    you will be able to complete assignments for these courses, find out the information you need and much more.
                    <br>
                    In the <strong>Notifications</strong> section, you can follow all the system notifications that are addressed to you.
                    <br>
                    You will need <strong>Settings</strong> in order to configure the operation of this service individually for you.
                    <br>
                    The <strong>Entertainment</strong> section is intended for a fun time student.
                    Here you can find a music player, read news, play a game and much more.
                    <br>
                    The <strong>Instruments</strong> section includes all the necessary utilities that a student may need to study.
                    You will find here: various compilers, a translator for different languages ​​of the world, and much more.
                    <br>
                    <br>
                    Thank you for using particularly this service!!!
                    </p>
            </div>


            <div class="box home_box1 color1">
                <a href="${pageContext.request.contextPath}/student/news"><img src="${pageContext.request.contextPath}/resources/pictures/icons/news.png" alt="News"/></a>
            </div>

            <div class="box home_box2 color2">
                <a href="${pageContext.request.contextPath}/message/createMessageDialog"><img src="${pageContext.request.contextPath}/resources/pictures/icons/messages.png" alt="Messages"/></a>
                <div class="messageCounter"><strong>+${messageCounter}</strong></div>
            </div>

            <div class="box home_box3 color3">
                <a href="${pageContext.request.contextPath}/student/courses"><img src="${pageContext.request.contextPath}/resources/pictures/icons/courses.png" alt="All courses"/></a>
            </div>

            <div class="box home_box4 color4">
                <a href="${pageContext.request.contextPath}/notifications"><img src="${pageContext.request.contextPath}/resources/pictures/icons/notifications.png" alt="Notifications"/></a>
            </div>

            <div class="box home_box5 color5">
                <a href="${pageContext.request.contextPath}/settings"><img src="${pageContext.request.contextPath}/resources/pictures/icons/settings.png" alt="Settings"/></a>
            </div>

            <div class="box home_box6 color6">
                <a href="${pageContext.request.contextPath}/entertainment"><img src="${pageContext.request.contextPath}/resources/pictures/icons/entertainment.png" alt="entertainment"/></a>
            </div>

            <div class="box home_box7 color7">
                <a href="${pageContext.request.contextPath}/instruments"><img src="${pageContext.request.contextPath}/resources/pictures/icons/instruments.png" alt="instruments"/></a>
            </div>
        </div>

    </div>
</div>

<%--<button><a href="${pageContext.request.contextPath}/message/createMessageDialog">Message menu</a> ${messageCounter}</button>--%>
<%--<button><a href="${pageContext.request.contextPath}/student/news">News</a></button>--%>
<%--<button><a href="${pageContext.request.contextPath}/student/courses">All courses</a></button>--%>
<%--<button><a href="${pageContext.request.contextPath}/instruments">Instruments</a></button>--%>
<%--<button><a href="${pageContext.request.contextPath}/entertainment">Entertainment</a></button>--%>
<%--<button><a href="${pageContext.request.contextPath}/notifications">Notifications</a> ${notificationCounter}</button>--%>

