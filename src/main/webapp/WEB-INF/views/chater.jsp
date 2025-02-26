<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>채팅방</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    <!-- Bootstrap JS & jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>

<body>
<div>
    <div class="container">
        <div class="col-6">
            <label><b>채팅방</b></label>
        </div>
        <div>
            <div id="msgArea" class="col"></div>
            <div class="col-6">
                <div class="input-group mb-3">
                    <input type="text" id="msg" class="form-control" aria-label="Recipient's username"
                           aria-describedby="button-addon2">
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="button" id="button-send">전송</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<input id="userName" type="text" hidden value="${user.username}">
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const username = document.getElementById("userName").value || "guest";
        console.log("현재 사용자: " + username);

        const websocket = new WebSocket("ws://192.168.2.115/ws/chat");

        websocket.onmessage = onMessage;
        websocket.onopen = () => onOpen(username);
        websocket.onclose = () => onClose(username);

        document.getElementById("button-send").addEventListener("click", function () {
            send(username);
        });

        document.getElementById("msg").addEventListener("keydown", function (event) {
            if (event.key === "Enter") {
                event.preventDefault();
                send(username);
            }
        });

        function send(username) {
            let msg = document.getElementById("msg");
            if (msg.value.trim() === "") return; // 빈 메시지 전송 방지

            console.log(username + ":" + msg.value);
            websocket.send(username + ":" + msg.value);
            msg.value = '';
        }

        function onClose(username) {
            websocket.send(username + " 님이 방을 나가셨습니다.");
        }

        function onOpen(username) {
            websocket.send(username + " 님이 입장하셨습니다.");
        }

        function onMessage(msg) {
            var data = msg.data;
            var arr = data.split(":");

            var sessionId = arr[0];
            var message = arr[1];

            var str = "<div class='col-6'>";
            if (sessionId === username) {
                str += "<div class='alert alert-secondary'><b>" + sessionId + " : " + message + "</b></div>";
            } else {
                str += "<div class='alert alert-warning'><b>" + sessionId + " : " + message + "</b></div>";
            }
            str += "</div>";
            document.getElementById("msgArea").innerHTML += str;
        }
    });

</script>

</body>
</html>
