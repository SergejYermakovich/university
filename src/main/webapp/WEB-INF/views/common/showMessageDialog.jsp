<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/showMessageDialog.css">
<form>
    <input type="button" value="Go back" onclick="history.back()" class="go-back">
</form>

<div id="msg-window" style="display: block;">
    <div class="msg-head">
        <div class="back" onclick="history.back()">
            <i class="fas fa-chevron-left"></i>
        </div>
        <div class="msg-profile">
            <form>
                <input type="button" value="Go back" onclick="history.back()" class="go-back">
            </form>
            <img id="msg-img" alt="user" src="${pageContext.request.contextPath}/resources/pictures/user.png">
            <div id="msg-name-head">
                <h2 id="msg-name">${toUser}</h2>
                <div id="time">online</div>
            </div>
        </div>
        <div class="setting">
            <i class="fas fa-cog"></i>
        </div>
    </div>
    <!-- head_section completed -->
    <div id="chat-screen">
        <c:forEach var="message" items="${messageList}">
            <c:choose>
                <c:when test="${message.to.login eq toUserLogin}">
                    <div class="sendicon">
                        <div class="msg"><p>${message.text}</p> ${message.date}</div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="recicon">
                        <img src="${pageContext.request.contextPath}/resources/pictures/user.png"/>
                        <div class="msg"><p>${message.text}</p>  ${message.date}</div>
                    </div>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </div>
    <!-- chat_screen completed -->
    <div id="msg-box">
        <div id="msg-cam">
            <img src="https://image.flaticon.com/icons/svg/482/482887.svg">
        </div>
        <div class="msg-bar">
            <form:form commandName="newMessage">
                <form:input path="text" cssClass="new-message-input"/>
                <input type="submit" value="<spring:message text="send"/>" class="new-message-btn"/>

                <%--                <input type="text" id="msg" placeholder="Message">--%>
                <%--                <div class="msg-btn">--%>
                <%--                    <img src="https://image.flaticon.com/icons/svg/714/714680.svg" onclick="send()">--%>
                <%--                </div>--%>
            </form:form>
            <div class="msg-btn">
                <img src="https://image.flaticon.com/icons/svg/709/709682.svg" class="land">
            </div>


        </div>
    </div>
</div>

