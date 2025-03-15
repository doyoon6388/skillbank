<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="/resources/css/request/request.css">
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<div id="request-container">

    <input type="text" id="mode" value="${ifYouPro}" hidden>
    <h1> 견적요청</h1>

    <div onclick="location.href='/move'"> 이사</div>
    <div onclick="location.href='/clean'">청소</div>
    <div>폐기물 청소</div>

</div>

<script>
    window.onload = () => {
        if (document.querySelector("#mode").value == 1) {
            if (prompt("고객으로 전환 후 이용 가능합니다. 전환하시겠습니까?")) {
                location.href = "/asdasd"; // 고객으로 전환하는 기능을 넣기
            }
        }
    }
</script>
</body>
</html>