<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/profile.css" />
    <script src="/resources/js/profile/profile.js"></script>
  </head>
  <body>
    <div class="profile-container">
      <div class="profile-wrap">
        <div class="profile&toggle">
          <div class="toggle-container">
            <label class="toggle-switch">
              <input
                type="checkbox"
                ${checked}
                id="toggle-btn"
                onclick="toggleMode()"
              />
              <span class="slider"></span>
            </label>
          </div>
          <div id="user-text">${sessionScope.user.user_name} 고객님</div>
        </div>
        <img
          class="mypage-btn"
          src="/resources/icons/profile/mypage.png"
          alt="마이페이지"
          onclick="location.href='/mypage'"
        />
        <img
          class="logout-btn"
          src="/resources/icons/profile/logout.png"
          alt="로그아웃"
          onclick="logout()"/>
      </div>
      <img class="chat-btn" src="/resources/icons/profile/chat.png" alt="채팅" onclick="location.href='/chat'"/>
    </div>
    <script>
      const username = "${sessionScope.user.user_name}";
    </script>
  </body>
</html>
