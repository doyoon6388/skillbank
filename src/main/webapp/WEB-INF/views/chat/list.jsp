<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <title>チャット</title>
    <link rel="stylesheet" href="/resources/css/chat/list.css" />
  </head>
  <body>
    <div class="chat-wrapper">
      <h1>チャット</h1>
      <c:forEach var="chatRoom" items="${chatRooms}">
        <div
          class="chat-room"
          data-room-no="${chatRoom.chat_room_no}"
          style="
            cursor: pointer;
            border: 1px solid black;
            padding: 10px;
            margin: 5px;
          "
        >
          <div style="display: flex">
            <div>
              <div>채팅방 번호: ${chatRoom.chat_room_no}</div>
              <div>
                Pro : ${chatRoom.chat_pro_id} [${chatRoom.chat_pro_name}]
              </div>
              <div>
                Client: ${chatRoom.chat_user_id} [${chatRoom.chat_user_name}]
              </div>
            </div>
            <c:if test="${chatRoom.chat_complete == 1}">
              <div
                style="
                  width: 60px;
                  height: 30px;
                  background-color: red;
                  color: white;
                "
              >
                거래 완료
              </div>
            </c:if>
          </div>
        </div>
      </c:forEach>

      <c:choose>
        <c:when test="${empty chatRooms}">
          <div class="chat-empty">会話中のチャットが存在しません</div>
        </c:when>
        <c:otherwise>
          <div class="chat-list">
            <c:forEach var="chatRoom" items="${chatRooms}">
              <div class="chat-room" data-room-no="${chatRoom.chat_room_no}">
                <div class="chat-info">
                  <span class="chat-label">チャットNo. </span>
                  <span class="chat-value">#${chatRoom.chat_room_no}</span>
                </div>
                <div class="chat-info">
                  <span class="chat-label">プロ : </span>
                  <span class="chat-value"
                    >${chatRoom.chat_pro_name} (${chatRoom.chat_pro_id})</span
                  >
                </div>
                <div class="chat-info">
                  <span class="chat-label">クライアント : </span>
                  <span class="chat-value"
                    >${chatRoom.chat_user_name} (${chatRoom.chat_user_id})</span
                  >
                </div>
              </div>
            </c:forEach>
          </div>
        </c:otherwise>
      </c:choose>
    </div>

    <script>
      document.addEventListener("DOMContentLoaded", function () {
        document.querySelectorAll(".chat-room").forEach((room) => {
          room.addEventListener("click", function () {
            let chatRoomNo = this.dataset.roomNo;
            window.location.href = "/test/chat/room/" + chatRoomNo;
          });
        });
      });
    </script>
  </body>
</html>
