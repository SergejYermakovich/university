<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/welcome-admin.css">
<div id="templatemo_main">
    <div id="content">
        <div id="home" class="section">
            <div id="home_about" class="box">
                <br>
                <h2>Welcome, admin</h2>
                <p>System is made by <a href="http://www.vk.com/sergu98">Siarhei Yermakovich</a> for everyone on
                    <a href="http://www.spring.com">Spring Framework</a> and it can be used for educational purpose.</p>
                <p><strong>Messages</strong> section is necessary to send messages to absolutely all users of this
                    service.
                    You can contact your teacher or service administrator and solve any of your questions.</p>
                <p>
                    In the <strong>Admin panel</strong> section you will manage the activities of users of the system,
                    courses, student groups and so on.
                </p>
                <p>The <strong>User searching</strong> section is intended to search all info about student.</p>
                <p> In the <strong>Notifications</strong> section, you can follow all the system notifications that are
                    addressed to you.</p>
                <p>You will need <strong>Settings</strong> in order to configure the operation of this service
                    individually for you.</p>
                <p> The <strong>Entertainment</strong> section is intended for a fun time student.
                    Here you can find a music player, read news, play a game and much more.</p>
                <br>
                <p> Thank you for using particularly this service!!!</p>
            </div>


            <div class="box home_box1 color1">
                <a href="${pageContext.request.contextPath}/admin/search"><img
                        src="${pageContext.request.contextPath}/resources/pictures/icons/user-search.png"
                        alt="User searching"/></a>
            </div>

            <div class="box home_box2 color2">
                <a href="${pageContext.request.contextPath}/message/createMessageDialog"><img
                        src="${pageContext.request.contextPath}/resources/pictures/icons/messages.png" alt="Messages"/></a>
                <div class="messageCounter"><strong>+${messageCounter}</strong></div>
            </div>

            <div class="box home_box3 color3">
                <a href="${pageContext.request.contextPath}/admin/panel"><img
                        src="${pageContext.request.contextPath}/resources/pictures/icons/computer.png"
                        alt="Admin panel"/></a>
            </div>

            <div class="box home_box4 color4">
                <a href="${pageContext.request.contextPath}/notifications"><img
                        src="${pageContext.request.contextPath}/resources/pictures/icons/notifications.png"
                        alt="Notifications"/></a>
            </div>


            <div class="box home_box6 color6">
                <a href="${pageContext.request.contextPath}/entertainment"><img
                        src="${pageContext.request.contextPath}/resources/pictures/icons/entertainment-admin.png"
                        alt="entertainment" class="center-img"/></a>
            </div>


            <div class="box home_box5 color5">
                <a href="${pageContext.request.contextPath}/settings"><img
                        src="${pageContext.request.contextPath}/resources/pictures/icons/settings-admin.png" alt="Settings" class="center-img"/></a>
            </div>

        </div>

    </div>
</div>

<%--    <li><a href="${pageContext.request.contextPath}/message/createMessageDialog">Message menu</a> ${messageCounter}</li>--%>

<%--    <li><a href="${pageContext.request.contextPath}/admin/panel">Admin panel</a></li>--%>
<%--    <li><a href="${pageContext.request.contextPath}/admin/search">User searching</a></li>--%>
<%--    <li><a href="${pageContext.request.contextPath}/admin/createTeacher">createTeacher</a></li>--%>

<%--    <li><a href="${pageContext.request.contextPath}/instruments">Instruments</a></li>--%>
<%--    <li><a href="${pageContext.request.contextPath}/entertainment">Entertainment</a></li>--%>
<%--    <li><a href="${pageContext.request.contextPath}/notifications">Notifications</a> ${notificationCounter}</li>--%>
