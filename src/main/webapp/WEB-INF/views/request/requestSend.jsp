<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>견적보내기</title>

    <link rel="stylesheet" href="resources/css/request/requestSend.css">
</head>
<body>
<form action="/request-send" method="post">
<div class="requestSendWrapper">
<div class="requestContainer">
<h1>견적보내기</h1>
<div class="price-type">
<h1>금액 설정</h1>
    <div> <input type="radio" name="priceS">총 비용
    <input type="radio" name="priceS">시간 당</div>

</div>

<div class="price">
<h1> 금액 </h1>

    <input type="text" oninput="chkNum(event)" name="price"/>

</div>
<div>
    <h1>견적 설명</h1>
<div class="requestSend-txt">
    <textarea name="rquestTxt">

    </textarea>
</div>

<div>
    <h1>파일첨부</h1>
    <input type="file" name="file-upload">
    <br>
    <!-- 변경하기 버튼: 파일 선택 창 호출 -->
    <button type="button" >견적 제출하기</button>
</div>
</div>
</div>
</div>
</form>
<script>
    let prevValue = ""; // 숫자만 저장할 변수

    function chkNum(e) {
        const value = e.target.value;
        const lastChar = value[value.length - 1]; // 마지막 입력된 문자
        console.log(prevValue)
        if (isNaN(lastChar) || lastChar==" ") {
            e.target.value = prevValue; // 숫자가 아니면 이전 값 유지
        } else {
            prevValue = e.target.value; // 숫자면 정상적인 값으로 저장
        }
    }
</script>


</body>
</html>