<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <title>채팅방</title>
    <link rel="stylesheet" href="/resources/js/room.css" />
  </head>
  <body>
    <h1>채팅방: ${chatRoom.chat_room_no}</h1>
    <p>Client : ${chatRoom.chat_user_name}</p>
    <p>Pro : ${chatRoom.chat_pro_name}</p>
    <input id="hiddenFrom" value="${chatRoom.chat_user_id}" hidden />
    <input id="hiddenTo" value="${chatRoom.chat_pro_id}" hidden />
    <input id="from" value="${sessionScope.user.user_nickname}" hidden />
    <input id="to" value="${chatRoom.chat_pro_name}" hidden />
    <div class="chat-response-container"></div>
    <div class="chat-wrapper">
      <div id="chatContainer">
        <c:forEach items="${chatLog}" var="chat">
          <c:choose>
            <c:when test="${sessionScope.user.user_nickname eq chat.sender}">
              <div class="message sent">
                <p>${chat.message} / ${chat.sender}</p>
              </div>
            </c:when>
            <c:otherwise>
              <div class="message received">
                <p>${chat.message} / ${chat.sender}</p>
              </div>
            </c:otherwise>
          </c:choose>
        </c:forEach>
      </div>
      <div id="chat-information-container">
        <div id="chat-information-content"></div>
      </div>
      <div class="deal-button-container">
        <div>
          <button id="deal-complete-btn">거래 성사</button>
        </div>
        <div>
          <button id="deal-cancel-btn">거래 취소</button>
        </div>
      </div>
    </div>

    <!-- 메시지 입력창 -->
    <input type="text" id="message" placeholder="메시지를 입력하세요" />
    <button id="sendButton">보내기</button>
    <!-- 채팅 메시지 표시 -->
    <div id="chat-box"></div>
    <script>
      let isPro = ${isPro};
    </script>
    <script src="/resources/js/chatRoom.js"></script>
  </body>
</html>
