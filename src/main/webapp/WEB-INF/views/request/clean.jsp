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
        .air img{
            width: 200px;
            height: 200px;
            object-fit: cover; /* 비율을 유지하면서 200x200에 맞게 자름 */
            border-radius: 10px; /* 모서리를 둥글게 (선택 사항) */
        }

    </style>
    <script>
        window.onload = function () {
            loadStep(1); // 첫 번째 단계 자동 로드


        };
        let dateval;

        function loadStep(a) {
            if (a == 1) {
                document.querySelector("#content-1").innerHTML = `<h2>どのタイプのエアコンをクリーニングしたいですか？</h2>
            <div class="items">
           <div class="air">
<div><img src="https://mstatic1.e-himart.co.kr/contents/goods/00/21/40/21/92/0021402192__EARB-0101FAWSD__M_640_640.jpg">
<input type="checkbox" name="request1" value="壁掛け"/>壁掛け<br></div>

<div> <img src="https://db.kookje.co.kr/news2000/photo/2021/0804/L20210804.99099001109i1.jpg">
<input type="checkbox" name="request1" value="窓用"/>窓用<br></div>

<div> <img src="https://www.jeet.co.kr/goods_img/110/Limg/20180808_154354.jpg">
<input type="checkbox" name="request1" value="天井埋込型"/>天井埋込型<br></div>

<div> <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYdBTDKvjbTLf7xUPbugA0Xh1s3sZLvLHjQA&s">
<input type="checkbox" name="request1" value="天井吊り型"/>天井吊り型<br></div>

<div> <img src="https://m.leesoo.co.kr/web/product/big/202211/43b6d9609baf1f702eb7f86c281059d7.jpg">
<input type="checkbox" name="request1" value="床置き"/>床置き<br></div>
</div>

               <button onClick = "validateStep1(event)">다음</button>
            </div>`
            }

            if (a == 2) {
                let selectMoves = document.querySelectorAll("input[name='request1']:checked");
                let bb = Array.from(selectMoves).map(el => el.value);
                if (selectMoves) {
                    document.getElementById("request1").value = bb;
                }
                document.querySelector("#content-1").innerHTML =
                    `<h2>エアコンの種類</h2>` + bb;
                document.querySelector("#content-2").innerHTML = `<h2>エアコンの数量を選択してください</h2>
         <div class="items">
         <input type="radio" name="request2" value="1台"> 1台<br>
         <input type="radio" name="request2" value="2台"> 2台<br>
         <input type="radio" name="request2" value="3台"> 3台<br>
         <input type="radio" name="request2" value="4台"> 4台<br>
         <input type="radio" name="request2" value="5台以上"> 5台以上<br>
         <button onclick="validateStep2(event)">다음</button>
</div>`

            }
            if (a == 3) {
                let selectMove = document.querySelector("input[name='request2']:checked");
                let bb = selectMove.value;
                if (selectMove) {
                    document.getElementById("request2").value = bb;
                }
                document.querySelector("#content-2").innerHTML =
                    `<h2>エアコンの個数</h2>` + bb;
                document.querySelector("#content-3").innerHTML = `<h2>エアコンは何年前に製造されたものですか？</h2>
大体の範囲で構いません<br>
<div class="items">
<input type="radio" name="request3" value="5年以下"> 5年以下<br>
    <input type="radio" name="request3" value="6-10年"> 6-10年<br>
    <input type="radio" name="request3" value="11-15年"> 11-15年<br>
    <input type="radio" name="request3" value="16年以上"> 16年以上<br>
    <input type="radio" name="request3" value="分からない"> 分からない<br>


    <button onclick="loadStep(4)">다음</button>
</div>`


            }
            if (a == 4) {
                let selectMove = document.querySelector("input[name='request3']:checked");
                let bb = selectMove.value;
                if (selectMove) {
                    document.getElementById("request3").value = bb;
                }
                document.querySelector("#content-3").innerHTML =
                    `<h2>エアコン製造年度</h2>` + bb;
                document.querySelector("#content-4").innerHTML = `<h2>エアコンのオプション業務も依頼しますか？</h2>
抗菌加工・抗菌コート：防カビ対策するならマスト！✨<br>
室外機の洗浄：エアコンの効きがよくなって、電気代の節約にも💰<br>
ドレンホースの洗浄：水漏れ・悪臭の原因になる詰まりを解消！🌤️<br>
防虫キャップの取付：ゴキブリなどの害虫の侵入を遮断🚧<br>
          <div class="items">
           <div class="air">
           <div> <input type="checkbox" name="request5" value="抗菌加工・抗菌コート"> 抗菌加工・抗菌コート<br>
<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0fRT3qLzRoh0mQcp_WMj1pmyLEI-pmET2Xw&s">
</div>
           <div> <input type="checkbox" name="request5" value="室外機の洗浄"> 室外機の洗浄<br>
<img src="https://d2tzd06cwmvahj.cloudfront.net/wp-content/uploads/2023/03/15142635/shitsugaiki-00-min.jpg">
</div>
           <div> <input type="checkbox" name="request5" value="ドレンホースの洗浄"> ドレンホースの洗浄<br>
<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5k3I2Q5N9oLTby_ytIdYSEM-GlTg9wCCBlA&s">
</div>
   <div> <input type="checkbox" name="request5" value="防虫キャップの取り付け"> 防虫キャップの取り付け<br>
<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8zUjOab8ePMmEhgWeA5CIngT_S5qQ9ZKjVA&s">
</div>

    </div>
    <button onclick="loadStep(5)">다음</button>
</div>`

            }
            if (a == 5) {
                let selectMoves = document.querySelectorAll("input[name='request5']:checked");
                let bb = Array.from(selectMoves).map(el => el.value);
                if (selectMoves) {
                    document.getElementById("request5").value = bb;
                }
                document.querySelector("#content-4").innerHTML =
                    `<h2>エアコンのオプション業務</h2>` + bb;
                document.querySelector("#content-5").innerHTML = `ご希望の日付を入力してください</h2>
     <input type="date" name="date-input">

    <button onclick="loadStep(6)">다음</button></div>`;
                document.querySelector('input[name="date-input"]').addEventListener("change", (e) => {

                    dateval = e.target.value;
                });

            }
            if (a == 6) {
                if (dateval) {
                    document.getElementById("request4").value = dateval;
                }

                document.querySelector("#content-5").innerHTML =
                    `<h2>選択した日付</h2>` + dateval;
                document.querySelector("#content-6").innerHTML =` <h1>지금 무료 견적 받아보세요.</h1>
                <div>
                    <button>견적 요청하기</button>
                </div>
`
            }

        }

    </script>


</head>
<body>
<form action="/my-request" method="post">
    <input name="r_user_id" value="${sessionScope.user.user_pk}" hidden="hidden">
    <input name="request_type" value="청소" hidden="hidden">


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


</form>
</body>
</html>
