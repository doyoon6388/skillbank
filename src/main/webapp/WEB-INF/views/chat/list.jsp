<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>견적서 리스트</title>
  </head>
  <body>

  <div id="chat-list" data-pro-id="${sessionScope.user.user_pk}" style="border-radius: 50%; background-color: black; color: white; width: 70px; height: 70px; line-height: 70px; position: fixed; right: 100px; bottom: 100px;">채팅목록</div>
  <c:forEach var="chatRoom" items="${chatRooms}">
  <div class="chat-room" data-room-no="${chatRoom.chat_room_no}" style="cursor: pointer; border: 1px solid black; padding: 10px; margin: 5px;">
      <div>채팅방 번호: ${chatRoom.chat_room_no}</div>
      <div>상대방: ${chatRoom.chat_user_id} [${chatRoom.chat_user_name}]</div>
  </div>
  </c:forEach>

  <script>
      document.addEventListener("DOMContentLoaded", function () {
          document.querySelectorAll(".chat-room").forEach(room => {
              room.addEventListener("click", function () {
                  let chatRoomNo = this.dataset.roomNo;
                  window.location.href = "/test/chat/room/" + chatRoomNo;
              });
          });
      });
  </script>
</html>
