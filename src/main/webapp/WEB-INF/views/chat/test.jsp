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
  <form action="/test/chat/login2" method="post">
      <input type="text"name="user_email">
      <input type="text"name="user_pw">
      <button>auto login</button>
  </form>
  ${user}
  <div id="chat-list" data-pro-id="${sessionScope.user.user_pk}"  style="border-radius: 50%; background-color: black; color: white; width: 70px; height: 70px; line-height: 70px; position: fixed; right: 100px; bottom: 100px">채팅목록</div>
  <c:forEach var="r" items="${reqList}">
    <div style="border: 2px solid; width: 300px" class="req" >
        <div>request_no ] ${r.request_no}</div>
        <div>r_user_id  ] ${r.r_user_id}</div>
        <div>r_user_nickname  ] ${sessionScope.user.user_nickname}</div>
        <div>request_type  ] ${r.request_type}</div>
        <div>request1  ] ${r.request1}</div>
        <div>request5  ] ${r.request5}</div>
        <button data-request-no="${r.request_no}" data-user="${r.r_user_id}" data-user-nickname="${sessionScope.user.user_nickname}" data-pro="${sessionScope.user.user_pk}" data-pro-name="${sessionScope.user.user_nickname}">open chat(결제과정 생략)</button>
    </div>
  </c:forEach>
  </body>
  <script>
    // window.onload = () =>{
      // selectAllReq();
    // }
    // function selectAllReq() {
    //   fetch("/test/chat").then(response => response.json()).then(data => console.log(data))
    // }

  </script>
  <script src="/resources/js/testChat.js"></script>
</html>
