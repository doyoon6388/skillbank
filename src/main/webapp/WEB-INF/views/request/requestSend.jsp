<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"
           uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>견적보내기</title>
    <link rel="stylesheet" href="/resources/css/request/requestSend.css"/>
</head>
<body>
<div class="requestSendWrapper">
    <div class="responseContainer">
        <div>
            <div class="requestSendImg"><img src="/file/${proRequest.user_profile_img}" alt=""/></div>
            <div><span>${proRequest.user_nickname}</span></div>
            <div><span>${proRequest.request_type}</span></div>
            <div><span>${proRequest.request10}</span></div>
            <div><span>${proRequest.request4}</span></div>
            <div><span>${proRequest.request1}</span></div>
            <div><span>${proRequest.request2}</span></div>
            <div><span>${proRequest.request3}</span></div>
            <div><span>${proRequest.request5}</span></div>
            <div><span>${proRequest.request6}</span></div>
            <div><span>${proRequest.request7}</span></div>
            <div><span>${proRequest.request8}</span></div>
            <div><span>${proRequest.request9}</span></div>
            <div><span>${proRequest.request11}</span></div>
            <div><span>${proRequest.request12}</span></div>
            <div><span>${proRequest.request13}</span></div>
            <div><span>${proRequest.request14}</span></div>
        </div>
    </div>
    <div class="requestContainer">
        <h2>見積もりの送信</h2>
        <div class="mycoin">${sessionScope.proSession.pro_cash} コイン</div>
        <input id="r_request_no" name="r_request_no" value="${proRequest.request_no}" hidden="hidden"/>
        <input id="r_pro_pk" name="r_pro_pk" value="${sessionScope.proSession.pro_pk}" hidden="hidden"/>
        <div class="price-setting">
            <div class="price-type">
                <h3>金額入力</h3>
                <div>
                    <input type="radio" name="r_price_type" value="総費用"/>総費用
                    <input type="radio" name="r_price_type" value="時間当たり"/>時間当たり
                </div>
            </div>
            <div class="price">
                <input type="text" id="r_price" oninput="chkNum(event)" name="r_price"/>
            </div>
        </div>
        <div>
            <h3>見積説明</h3>
            <div class="requestSend-txt">
                <textarea id="r_comment" name="r_comment"></textarea>
            </div>
            <div>
                <br/>
                <!-- 변경하기 버튼: 파일 선택 창 호출 -->
                <button
                        id="sendR"
                        data-request-no="${proRequest.request_no}"
                        data-user="${proRequest.r_user_id}"
                        data-user-nickname="${proRequest.user_nickname}"
                        data-pro="${sessionScope.proSession.pro_pk}"
                        data-pro-name="${sessionScope.user.user_nickname}">
                    50コインで見積書を送信
                </button>
            </div>
        </div>
    </div>
</div>
<input type="hidden" id="proCash" value="${sessionScope.proSession.pro_cash}">
<script src="/resources/js/request/requestSend.js"></script>
<script>
    let prevValue = ""; // 숫자만 저장할 변수

    function chkNum(e) {
        const value = e.target.value;
        const lastChar = value[value.length - 1]; // 마지막 입력된 문자
        console.log(prevValue);
        if (isNaN(lastChar) || lastChar == " ") {
            e.target.value = prevValue; // 숫자가 아니면 이전 값 유지
        } else {
            prevValue = e.target.value; // 숫자면 정상적인 값으로 저장
        }
    }
</script>
</body>
</html>
