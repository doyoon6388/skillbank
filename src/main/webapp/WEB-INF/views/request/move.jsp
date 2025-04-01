<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이사 단계 진행</title>
    <link rel="stylesheet" href="resources/css/request/request.css">
    <script src="resources/js/request/request.js"></script>
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
        function updateProgressBar(step) {
    let totalSteps = 12; // 전체 스텝 개수
    let progressPercentage = (step / totalSteps) * 100;
    document.getElementById("progress-bar").style.width = progressPercentage + "%";
    }

        window.onload = function () {
            loadStep(1); // 첫 번째 단계 자동 로드


        };
        let dateval;

        function loadStep(a) {
            updateProgressBar(a);
            if (a == 1) {
                document.querySelector("#content-1").innerHTML = `<h2>이사 종류를 선택해주세요.</h2>
            <div class="items">
            <input type="radio" name="request1" value="일반이사"/>일반이사<br>
            <input type ="radio" name = "request1" value = "반포장이사"/> 반포장이사 <br/>
                <input type = "radio" name="request1" value="포장이사"/> 포장이사 <br/>
               <button onClick = "validateStep1(event)">次へ</button>
            </div>`
            }

            if (a == 2) {
                let selectMove = document.querySelector("input[name='request1']:checked");
                let bb = selectMove.value;
                if (selectMove) {
                    document.getElementById("request1").value = bb;
                }
                document.querySelector("#content-1").innerHTML =
                    `<h2>이사 종류</h2>` + bb;
                document.querySelector("#content-2").innerHTML = `<h2>고수님과 함께 짐을 옮길 수 있나요?</h2>
         <div class="items">
         <input type="radio" name="request2" value="가능"> 네.<br>
         <input type="radio" name="request2" value="불가능"> 아니요.<br>
         <button onclick="validateStep2(event)">次へ</button>
</div>`

            }
            if (a == 3) {
                let selectMove = document.querySelector("input[name='request2']:checked");
                let bb = selectMove.value;
                if (selectMove) {
                    document.getElementById("request2").value = bb;
                }
                document.querySelector("#content-2").innerHTML =
                    `<h2>같이 짐 운반여부</h2>` + bb;
                document.querySelector("#content-3").innerHTML = `<h2>이사 규모를 선택해주세요.</h2>
<div class="items">
<input type="radio" name="request3" value="원룸"> 원룸 이사<br>
    <input type="radio" name="request3" value="투룸"> 투룸 이사<br>
    <input type="radio" id="etcCheck"> 기타<br>
<div id="etcInputContainer" style="display: none; margin-top: 10px;">
            <textarea id="etcInput" placeholder="직접 입력" name="request3"></textarea>

        </div>
    <button onclick="loadStep(4)">次へ</button>
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
                let selectMove = document.querySelector("input[name='request3']:checked");
                let etcCheck = document.getElementById("etcCheck");
                let etcInput = document.getElementById("etcInput");
                let bb = "";
                // 기타 선택 시 textarea 값 저장
                event.preventDefault();
                if (etcCheck.checked) {
                if (etcInput.value.trim() === "") {
                    alert("기타 항목을 입력해주세요.");
                    return;
                }
                bb = etcInput.value.trim();
            } else if (selectMove) {
                // 원룸 or 투룸 선택 시 해당 값 저장
                bb = selectMove.value;
            } else {
                alert("이사 규모를 선택해주세요.");
                return;
            }
                    document.getElementById("request3").value = bb;

                document.querySelector("#content-3").innerHTML =
                    `<h2>이사 규모</h2>` + bb;
                document.querySelector("#content-4").innerHTML = `<h2>이사 예정일을 선택해주세요.</h2>

        <input type="date" name="date-input">
    <button onclick="loadStep(5)">次へ</button> `

                document.querySelector('input[name="date-input"]').addEventListener("change", (e) => {

                    dateval = e.target.value;
                });

            }
            if (a == 5) {
                if (dateval) {
                    document.getElementById("request4").value = dateval;
                }
                document.querySelector("#content-4").innerHTML =
                    `<h2>선택한 날짜</h2>` + dateval;
                document.querySelector("#content-5").innerHTML = `<h2>이사를 원하는 시간대를 선택 해주세요.</h2>
    <div class="items">
    <input type="radio" name="request5" value="오전 9시이전">오전 9시 이전 <br>
    <input type="radio" name="request5" value="오전 9시~12시">오전 9시~12시 <br>
    <input type="radio" name="request5" value="오후 12시~3시">오후 12시~3시 <br>
    <input type="radio" name="request5" value="오후 3시~6시">오후 3시~6시 <br>
    <input type="radio" name="request5" value="오후 9시 이후">오후 3시~6시 <br>
    <button onclick="validateStep4(event)">次へ</button></div>`;
            }
            if (a == 6) {
                let selectMove = document.querySelector("input[name='request5']:checked");
                let bb = selectMove.value;
                if (selectMove) {
                    document.getElementById("request5").value = bb; // 숨겨진 input에 값 저장
                }
                document.querySelector("#content-5").innerHTML =
                    `<h2>선택한 시간</h2>` + bb;
                document.querySelector("#content-6").innerHTML = `<h2>옮길 대형 가전을 선택해주세요.</h2>
    <div class="items">
    <input type="checkbox" name="request6" value="없음">없음 <br>
    <input type="checkbox" name="request6" value="TV/모니터">TV/모니터 <br>
    <input type="checkbox" name="request6" value="냉장고">냉장고 <br>
    <input type="checkbox" name="request6" value="세탁기">세탁기 <br>
    <input type="checkbox" name="request6" value="건조기">건조기 <br>
    <input type="checkbox" name="request6" value="에어컨">에어컨 <br>
    <input type="checkbox" name="request6" value="의류관리기">의류관리기 <br>
 <input type="checkbox" id="etcCheck" >기타 <br>
<div id="etcInputContainer" style="display: none; margin-top: 10px;">
            <textarea id="etcInput" placeholder="직접 입력" name="request6"></textarea>

        </div>
    <button onclick="loadStep(7)">次へ</button> </div>`


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
                let selectMoves = document.querySelectorAll("input[name='request6']:checked");
                let etcCheck = document.getElementById("etcCheck"); // 기타 체크박스
                let etcInput = document.getElementById("etcInput"); // 기타 입력란
                let bb = Array.from(selectMoves).map(el => el.value);
                event.preventDefault();

                if (etcCheck.checked) {
                    if (etcInput.value.trim() === "") {
                        alert("기타 항목을 입력해주세요.");
                        return;
                    }
                    bb.push(etcInput.value.trim()); // 기타 입력값 추가
                }

                if (bb.length === 0) {
                    alert("최소 한 개 이상의 항목을 선택해주세요.");
                    return;
                }
                document.getElementById("request6").value = bb.join(", "); // 값 저장 (쉼표로 구분)
                document.querySelector("#content-6").innerHTML =
                    `<h2>대형가전</h2>` + bb;
                document.querySelector("#content-7").innerHTML = `<h2>옮길 소형 가전을 선택해주세요.</h2>
<div class="items">
<input type="checkbox" name="request7" value="없음">없음 <br>
    <input type="checkbox" name="request7" value="전자레인지">전자레인지 <br>
    <input type="checkbox" name="request7" value="가스레인지/인덕션">가스레인지/인덕션 <br>
    <input type="checkbox" name="request7" value="공기청정기">공기청정기 <br>
    <input type="checkbox" name="request7" value="청소기">청소기 <br>
    <input type="checkbox" id="etcCheck" >기타 <br>
<div id="etcInputContainer" style="display: none; margin-top: 10px;">
            <textarea id="etcInput" placeholder="직접 입력" name="request7"></textarea>

        </div>
    <button type="button" onclick="loadStep(8)">次へ</button> </div>`


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
                let selectMoves = document.querySelectorAll("input[name='request7']:checked");
                let etcCheck = document.getElementById("etcCheck"); // 기타 체크박스
                let etcInput = document.getElementById("etcInput"); // 기타 입력란
                let bb = Array.from(selectMoves).map(el => el.value);
                event.preventDefault();

                if (etcCheck.checked) {
                    if (etcInput.value.trim() === "") {
                        alert("기타 항목을 입력해주세요.");
                        return;
                    }
                    bb.push(etcInput.value.trim()); // 기타 입력값 추가
                }

                if (bb.length === 0) {
                    alert("최소 한 개 이상의 항목을 선택해주세요.");
                    return;
                }
                document.getElementById("request7").value = bb.join(", "); // 값 저장 (쉼표로 구분)
                document.querySelector("#content-7").innerHTML =
                    `<h2>소형가전</h2>` + bb;
                document.querySelector("#content-8").innerHTML =
                    `<h2>옮길 가구를 선택해주세요.</h2>
<div class="items">
<input type="checkbox" name="request8" value="없음">없음 <br>
    <input type="checkbox" name="request8" value="침대 매트리스">침대 매트리스 <br>
    <input type="checkbox" name="request8" value="침대 프레임">가스레인지/인덕션 <br>
    <input type="checkbox" name="request8" value="책상/테이블">책상/테이블 <br>
    <input type="checkbox" name="request8" value="의자">의자 <br>
    <input type="checkbox" name="request8" value="수납장">수납장 ex)신발장,진열장,TV장 등<br>
    <input type="checkbox" name="request8" value="서랍장">서랍장 <br>
    <input type="checkbox" name="request8" value="책장">책장 <br>
    <input type="checkbox" name="request8" value="옷장">옷장 <br>
    <input type="checkbox" name="request8" value="행거">행거 <br>
    <input type="checkbox" name="request8" value="화장대">화장대 <br>
 <input type="checkbox" id="etcCheck">기타 <br>
<div id="etcInputContainer" style="display: none; margin-top: 10px;">
            <textarea id="etcInput" placeholder="직접 입력" name="request8"></textarea>

        </div>
    <button type="button" onclick="loadStep(9)">次へ</button> </div>`
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
            if (a == 9) {
                let selectMoves = document.querySelectorAll("input[name='request8']:checked");
                let etcCheck = document.getElementById("etcCheck"); // 기타 체크박스
                let etcInput = document.getElementById("etcInput"); // 기타 입력란
                let bb = Array.from(selectMoves).map(el => el.value);
                event.preventDefault();

                if (etcCheck.checked) {
                    if (etcInput.value.trim() === "") {
                        alert("기타 항목을 입력해주세요.");
                        return;
                    }
                    bb.push(etcInput.value.trim()); // 기타 입력값 추가
                }

                if (bb.length === 0) {
                    alert("최소 한 개 이상의 항목을 선택해주세요.");
                    return;
                }
                document.getElementById("request8").value = bb.join(", "); // 값 저장 (쉼표로 구분)
                document.querySelector("#content-8").innerHTML =
                    `<h2>가구</h2>` + bb;
                document.querySelector("#content-9").innerHTML =
                    `<h2>잔 짐의 양을 선택해주세요.(의류,식기,책 등의 생활짐)</h2>
<div class="items">
<input type="radio" name="request9" value="없음">없음 <br>
    <input type="radio" name="request9" value="박스 1~5개">박스 1~5개 <br>
    <input type="radio" name="request9" value="박스 6~10개">박스 6~10개 <br>
    <input type="radio" name="request9" value="박스 11~15개">박스 11~15개 <br>
    <input type="radio" name="request9" value="박스 16~20개">박스 16~20개 <br>

 <input type="checkbox" id="etcCheck" name="request9" >직접 입력 <br>
<div id="etcInputContainer" style="display: none; margin-top: 10px;">
            <textarea id="etcInput" placeholder="세부항목 입력"></textarea>

        </div>
    <button type="button" onclick="loadStep(10)">次へ</button> </div>`
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
            if (a == 10) {
                let selectMove = document.querySelector("input[name='request9']:checked");
                let etcCheck = document.getElementById("etcCheck"); // 기타 선택 여부
                let etcInput = document.getElementById("etcInput"); // 기타 입력란
                event.preventDefault(); // 🚨 폼 자동 제출 방지
                let bb = "";

                if (etcCheck.checked) {
                    // 기타 선택 시 textarea 값 저장
                    if (etcInput.value.trim() === "") {
                        alert("기타 항목을 입력해주세요.");
                        return;
                    }
                    bb = etcInput.value.trim();
                } else if (selectMove) {
                    // 원룸 or 투룸 선택 시 해당 값 저장
                    bb = selectMove.value;
                } else {
                    alert("잔짐의 양을 선택해주세요.");
                    return;
                }
                document.getElementById("request9").value = bb; // 숨겨진 input에 값 저장
                document.querySelector("#content-9").innerHTML =
                    `<h2>잔짐의 양</h2>` + bb;
                document.querySelector("#content-10").innerHTML =
                    `<h2>옮길 가구를 선택해주세요.</h2>
<div class="items">
    <input type="radio" name="request10" value="인천">인천 <br>
    <input type="radio" name="request10" value="서울">서울 <br>
    <input type="radio" name="request10" value="경기권">경기권 <br>
    <input type="radio" name="request10" value="충청도">충청도 <br>
    <input type="radio" name="request10" value="전라도">전라도<br>
    <input type="radio" name="request10" value="경상도">경상도 <br>



        </div>
    <button type="button" onclick="validateStep9(event)">次へ</button> </div>`


            }

            if (a == 11) {
                let selectMove = document.querySelector("input[name='request10']:checked");
                let bb = selectMove.value;
                if (selectMove) {
                    document.getElementById("request10").value = bb; // 숨겨진 input에 값 저장
                }
                document.querySelector("#content-10").innerHTML =
                    `<h2>지역</h2>` + bb;
                document.querySelector("#content-11").innerHTML =
                    `<h2>층수를 선택해주세요.</h2>
<div class="items">
<input type="radio" name="request11" value="1층">1층 <br>
    <input type="radio" name="request11" value="2층">2층 <br>
    <input type="radio" name="request11" value="3층">3층 <br>
    <input type="radio" name="request11" value="4층">4층 <br>
    <input type="radio" name="request11" value="5층">5층 <br>
   <input type="checkbox" id="etcCheck" >직접 입력 <br>
<div id="etcInputContainer" style="display: none; margin-top: 10px;">
            <textarea id="etcInput" placeholder="세부항목 입력" name="request11"></textarea>



        </div>
    <button type="button" onclick="loadStep(12)">次へ</button> </div>`

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
            if (a == 12) {
                let selectMove = document.querySelector("input[name='request11']:checked");
                let etcCheck = document.getElementById("etcCheck"); // 기타 선택 여부
                let etcInput = document.getElementById("etcInput"); // 기타 입력란
                event.preventDefault(); // 🚨 폼 자동 제출 방지
                let bb = "";

                if (etcCheck.checked) {
                    // 기타 선택 시 textarea 값 저장
                    if (etcInput.value.trim() === "") {
                        alert("기타 항목을 입력해주세요.");
                        return;
                    }
                    bb = etcInput.value.trim();
                } else if (selectMove) {
                    // 원룸 or 투룸 선택 시 해당 값 저장
                    bb = selectMove.value;
                } else {
                    alert("층수를 선택해주세요.");
                    return;
                }

                document.getElementById("request11").value = bb; // 숨겨진 input에 값 저장
                document.querySelector("#content-11").innerHTML =
                    `<h2>도착지 층수</h2>` + bb;
                document.querySelector("#content-12").innerHTML =
                    `<h2>도착지를 선택해주세요.</h2>
<div class="items">
    <input type="radio" name="request12" value="인천">인천 <br>
    <input type="radio" name="request12" value="서울">서울 <br>
    <input type="radio" name="request12" value="경기권">경기권 <br>
    <input type="radio" name="request12" value="충청도">충청도 <br>
    <input type="radio" name="request12" value="전라도">전라도<br>
    <input type="radio" name="request12" value="서랍장">경상도 <br>



        </div>
    <button type="button" onclick="validateStep11(event)">次へ</button> </div>`


            }
            if (a == 13) {
                let selectMove = document.querySelector("input[name='request12']:checked");
                let bb = selectMove.value;
                if (selectMove) {
                    document.getElementById("request12").value = bb; // 숨겨진 input에 값 저장
                }
                document.querySelector("#content-12").innerHTML =
                    `<h2>도착지</h2>` + bb;
                document.querySelector("#content-13").innerHTML =
                    `<h2>층수를 선택해주세요.</h2>
<div class="items">
<input type="radio" name="request13" value="1층">1층 <br>
    <input type="radio" name="request13" value="2층">2층 <br>
    <input type="radio" name="request13" value="3층">3층 <br>
    <input type="radio" name="request13" value="4층">4층 <br>
    <input type="radio" name="request13" value="5층">5층 <br>
   <input type="checkbox" id="etcCheck" >직접 입력 <br>
<div id="etcInputContainer" style="display: none; margin-top: 10px;">
            <textarea id="etcInput" placeholder="세부항목 입력"  name="request13"></textarea>



        </div>
    <button type="button" onclick="loadStep(14)">次へ</button> </div>`

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

            if (a == 14) {
                let selectMove = document.querySelector("input[name='request13']:checked");
                let etcCheck = document.getElementById("etcCheck"); // 기타 선택 여부
                let etcInput = document.getElementById("etcInput"); // 기타 입력란
                event.preventDefault(); // 🚨 폼 자동 제출 방지
                let bb = "";

                if (etcCheck.checked) {
                    // 기타 선택 시 textarea 값 저장
                    if (etcInput.value.trim() === "") {
                        alert("기타 항목을 입력해주세요.");
                        return;
                    }
                    bb = etcInput.value.trim();
                } else if (selectMove) {
                    // 원룸 or 투룸 선택 시 해당 값 저장
                    bb = selectMove.value;
                } else {
                    alert("이사 규모를 선택해주세요.");
                    return;
                }

                document.getElementById("request13").value = bb; // 숨겨진 input에 값 저장
                document.querySelector("#content-13").innerHTML =
                    `<h2>도착지 층수</h2>` + bb;
                document.querySelector("#content-14").innerHTML =

                    `<h1>해당사항을 선택 해주세요 </h1>
<div className="items">
                        <input type="checkbox" name="request14" value="해당사항 없음"/>해당사항 없음 <br/>
                        <input type="checkbox" name="request14" value="출발지에 엘리베이터가 있어요"/>출발지에 엘레베이터가 있어요 <br/>
                        <input type="checkbox" name="request14" value="도착지에 엘리베이터가 있어요"/>도착지에 엘레베이터가 있어요 <br/>
                        <input type="checkbox" name="request14" value="강아지를 키워요"/>강아지를 키워요 <br/>
                        <input type="checkbox" name="request14" value="고양이를 키워요"/>고양이를 키워요 <br/>

                        <input type="checkbox" id="etcCheck"/>직접 입력 <br/>
                        <div id="etcInputContainer" style="display: none; margin-top: 10px;">
                            <textarea id="etcInput" placeholder="세부항목 입력"  name="request14"></textarea>
 </div>
    <button type="button" onclick="loadStep(15)">次へ</button> </div>
`

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
            if (a == 15) {
                let selectMoves = document.querySelectorAll("input[name='request14']:checked");
                let bb = Array.from(selectMoves).map(el => el.value);
                let etcCheck = document.getElementById("etcCheck"); // 기타 체크박스
                let etcInput = document.getElementById("etcInput"); // 기타 입력란

                event.preventDefault(); // 🚨 폼 자동 제출 방지
                if (etcCheck.checked) {
                    if (etcInput.value.trim() === "") {
                        alert("기타 항목을 입력해주세요.");
                        return;
                    }
                    bb.push(etcInput.value.trim()); // 기타 입력값 추가
                }

                if (bb.length === 0) {
                    alert("최소 한 개 이상의 항목을 선택해주세요.");
                    return;
                }

                document.getElementById("request14").value = bb.join(", "); // 값 저장 (쉼표로 구분)
                document.querySelector("#content-14").innerHTML =
                    `<h2>선택사항</h2>` + bb;
                document.querySelector("#content-15").innerHTML =

                    `<h1>今すぐ無料見積もりを受けてみてください。</h1>
                         <div>
                              <button>見積もりを依頼する</button>
                         </div>
                    `
            }
        }

    </script>


</head>
<body>
<form action="/my-request" method="post">
    <input name="r_user_id" value="${sessionScope.user.user_pk}" hidden="hidden">
    <input name="request_type" value="引っ越し" hidden="hidden">

    <input type="hidden" id="request1" name="request1">
    <input type="hidden" id="request2" name="request2">
    <input type="hidden" id="request3" name="request3">
    <input type="hidden" id="request4" name="request4">
    <input type="hidden" id="request5" name="request5">
    <input type="hidden" id="request6" name="request6">
    <input type="hidden" id="request7" name="request7">
    <input type="hidden" id="request8" name="request8">
    <input type="hidden" id="request9" name="request9">
    <input type="hidden" id="request10" name="request10">
    <input type="hidden" id="request11" name="request11">
    <input type="hidden" id="request12" name="request12">
    <input type="hidden" id="request13" name="request13">
    <input type="hidden" id="request14" name="request14">

    <div id="progress-container">
        <div id="progress-bar"></div>
    </div>


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
    <div id="content-10">
    </div>
    <div id="content-11">
    </div>
    <div id="content-12">
    </div>
    <div id="content-13">
    </div>
    <div id="content-14">
    </div>
    <div id="content-15">
    </div>

</form>
</body>
</html>
