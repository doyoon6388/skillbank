<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이사 단계 진행</title>
    <link rel="stylesheet" href="resources/css/request/request.css">
    <style>
        #content {
            width: 50%;
            margin: auto;
            text-align: center;
            padding: 20px;
            border: 1px solid #ddd;
        }
    </style>


    <script>


        window.onload = function () {
            loadStep(1); // 첫 번째 단계 자동 로드
        };

        function loadStep(a) {
            if (a == 1) {
                document.querySelector("#content-1").innerHTML = `<h2>이사 종류를 선택해주세요.</h2>
           <div class="container">
            <input type="radio" name="moveType" value="일반이사"/>일반이사<br>
            <input type ="radio" name = "moveType" value = "반포장이사"/> 반포장이사 <br/>
                <input type = "radio" name="moveType" value="포장이사"/> 포장이사 <br/>
               <button onClick = "loadStep(2)">다음</button>
</div>`
            }
            if (a == 2) {
                let selectMove = document.querySelector("input[name='moveType']:checked");
                let bb = selectMove.value;

                document.querySelector("#content-1").innerHTML =
                    `<h2>이사 종류</h2>` + bb;
                document.querySelector("#content-2").innerHTML = `<h2>고수님과 함께 짐을 옮길 수 있나요?</h2>
         <div class="container">
         <input type="radio" name="helpMove" value="가능"> 네.<br>
         <input type="radio" name="helpMove" value="불가능"> 아니요.<br>
         <button onclick="loadStep(3)">다음</button>
</div>`


            }
            if (a == 3) {
                let selectMove = document.querySelector("input[name='helpMove']:checked");
                let bb = selectMove.value;
                document.querySelector("#content-2").innerHTML =
                    `<h2>같이 짐 운반여부</h2>` + bb;
                document.querySelector("#content-3").innerHTML = `<h2>이사 규모를 선택해주세요.</h2>
<div class="container">
<input type="radio" name="roomSize" value="원룸"> 원룸 이사<br>
    <input type="radio" name="roomSize" value="투룸"> 투룸 이사<br>
    <input type="radio" id="etcCheck" name="roomSize" value="기타"> 기타<br>
<div id="etcInputContainer" style="display: none; margin-top: 10px;">
            <textarea id="etcInput" placeholder="직접 입력"></textarea>

        </div>
    <button onclick="loadStep(4)">다음</button>
</div>`

                console.log(document.getElementById("etcCheck"));
                document.getElementById("etcCheck").addEventListener("change", function () {
                    let etcInputContainer = document.getElementById("etcInputContainer");
                    if (this.checked) {
                        etcInputContainer.style.display = "block";
                    } else {
                        etcInputContainer.style.display = "none";
                    }
                });

            }
            if (a == 4) {
                let selectMove = document.querySelector("input[name='roomSize']:checked");
                let bb = selectMove.value;
                document.querySelector("#content-3").innerHTML =
                    `<h2>이사 규모</h2>` + bb;
                document.querySelector("#content-4").innerHTML = `<h2>이사 예정일을 선택해주세요.</h2>

        <input type="date" name="moveDate">
    <button onclick="loadStep(5)">다음</button>`

            }
            if (a == 5) {
                let selectMove = document.querySelector("input[name='moveDate']").value;

                document.querySelector("#content-4").innerHTML =
                    `<h2>선택한 날짜</h2>` + selectMove;
                document.querySelector("#content-5").innerHTML = `<h2>이사를 원하는 시간대를 선택 해주세요.</h2>
    <div class="container">
    <input type="radio" name="selectTime" value="오전 9시이전">오전 9시 이전 <br>
    <input type="radio" name="selectTime" value="오전 9시~12시">오전 9시~12시 <br>
    <input type="radio" name="selectTime" value="오후 12시~3시">오후 12시~3시 <br>
    <input type="radio" name="selectTime" value="오후 3시~6시">오후 3시~6시 <br>
    <input type="radio" name="selectTime" value="오후 9시 이후">오후 3시~6시 <br>
    <button onclick="loadStep(6)">다음</button></div>`

            }
            if (a == 6) {
                let selectMove = document.querySelector("input[name='selectTime']:checked");
                let bb = selectMove.value;
                document.querySelector("#content-5").innerHTML =
                    `<h2>선택한 시간</h2>` + bb;
                document.querySelector("#content-6").innerHTML = `<h2>옮길 대형 가전을 선택해주세요.</h2>
    <div class="container">
    <input type="checkbox" name="selectLarge" value="없음">없음 <br>
    <input type="checkbox" name="selectLarge" value="TV/모니터">TV/모니터 <br>
    <input type="checkbox" name="selectLarge" value="냉장고">냉장고 <br>
    <input type="checkbox" name="selectLarge" value="세탁기">세탁기 <br>
    <input type="checkbox" name="selectLarge" value="건조기">건조기 <br>
    <input type="checkbox" name="selectLarge" value="에어컨">에어컨 <br>
    <input type="checkbox" name="selectLarge" value="의류관리기">의류관리기 <br>
 <input type="checkbox" id="etcCheck" name="selectSmall" value="기타">기타 <br>
<div id="etcInputContainer" style="display: none; margin-top: 10px;">
            <textarea id="etcInput" placeholder="직접 입력"></textarea>

        </div>
    <button onclick="loadStep(7)">다음</button> </div>`


                console.log(document.getElementById("etcCheck"));
                document.getElementById("etcCheck").addEventListener("change", function () {
                    let etcInputContainer = document.getElementById("etcInputContainer");
                    if (this.checked) {
                        etcInputContainer.style.display = "block";
                    } else {
                        etcInputContainer.style.display = "none";
                    }
                });

            }
            if (a == 7) {
                let selectMoves = document.querySelectorAll("input[name='selectLarge']:checked");
                let bb = Array.from(selectMoves).map(el => el.value);
                document.querySelector("#content-6").innerHTML =
                    `<h2>대형가전</h2>` + bb;
                document.querySelector("#content-7").innerHTML = `<h2>옮길 소형 가전을 선택해주세요.</h2>
<div class="container">
<input type="checkbox" name="selectSmall" value="없음">없음 <br>
    <input type="checkbox" name="selectSmall" value="전자레인지">전자레인지 <br>
    <input type="checkbox" name="selectSmall" value="가스레인지/인덕션">가스레인지/인덕션 <br>
    <input type="checkbox" name="selectSmall" value="공기청정기">공기청정기 <br>
    <input type="checkbox" name="selectSmall" value="청소기">청소기 <br>
    <input type="checkbox" id="etcCheck" name="selectSmall" value="기타">기타 <br>
<div id="etcInputContainer" style="display: none; margin-top: 10px;">
            <textarea id="etcInput" placeholder="직접 입력"></textarea>

        </div>
    <button onclick="loadStep(8)">다음</button> </div>`


                console.log(document.getElementById("etcCheck"));
                document.getElementById("etcCheck").addEventListener("change", function () {
                    let etcInputContainer = document.getElementById("etcInputContainer");
                    if (this.checked) {
                        etcInputContainer.style.display = "block";
                    } else {
                        etcInputContainer.style.display = "none";
                    }
                });

            }
            if (a == 8) {
                let selectMoves = document.querySelectorAll("input[name='selectSmall']:checked");
                let bb = Array.from(selectMoves).map(el => el.value);
                document.querySelector("#content-7").innerHTML =
                    `<h2>소형가전</h2>` + bb;
                document.querySelector("#content-8").innerHTML =
                   `지금 무료 견적 받아보세요.`
                <button onclick="location.href=''">견적 요청하기</button>

            }
        }


    </script>


</head>
<body>

<div id="content-1">
</div>
<div id="content-2">
</div>
<div id="content-3">
</div>
<div id="content-4">
</div>
<div id="content-5">
</div>
<div id="content-6">
</div>
<div id="content-7">
</div>
<div id="content-8">
</div>
<div id="content-9">
</div>

</body>
</html>
