<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8"/>
    <title>SkillBank</title>
<<<<<<< HEAD
    <link rel="stylesheet" href="/resources/css/main/main.css" />
    <style>
      .mainRequestWrapper {
        display: flex; /* 가로 정렬 */
        gap: 30px; /* 요소 간 간격 */
        justify-content: center; /* 가운데 정렬 */
        align-items: center; /* 세로 정렬 */
      }

      .mainRequestWrapper div {
        text-align: center; /* 텍스트 중앙 정렬 */
        cursor: pointer; /* 클릭 가능하도록 설정 */
      }

      .mainRequestWrapper img {
        width: 200px; /* 정사각형 크기 */
        height: 200px;
        object-fit: cover; /* 품질 유지 및 크롭 */
        border-radius: 10px; /* 모서리를 둥글게 */
      }

      .mainRequestWrapper spna {
        display: block; /* 아래로 정렬 */
        margin-top: 10px; /* 이미지와 텍스트 간격 */
        font-size: 16px;
        font-weight: bold;
      }
    </style>
  </head>
  <body>
    <main>
      <div class="main-container">
        <!-- 슬로건 -->
        <div class="main-title">探す時代から、選ぶ時代へ。</div>

        <div class="mainRequestWrapper">
          <div onclick="location.href='/move'">
            <img
              src="https://static.cdn.soomgo.com/upload/service/11bd8485-cc6a-416e-b186-692a39b4e9a1.png?h=302&w=452&webp=1"
            />
            <spna>ワンルーム/ 小型引っ越し</spna>
          </div>
          <div onclick="location.href='/clean'">
            <img
              src="https://clokabe-88.jp/wp-content/uploads/AdobeStock_84702018.jpg"
            />
            <spna>エアコンクリーニング</spna>
          </div>
          <div onclick="location.href='/waste'">
            <img
              src="https://static.cdn.soomgo.com/upload/service/9248d94a-60a6-4935-9322-750841c988df.png?h=302&w=452&webp=1"
            />
            <spna>粗大ごみ回収</spna>
          </div>
=======
    <link rel="stylesheet" href="/resources/css/main/main.css"/>
</head>
<body>
<main>
    <div class="main-container">
        <div class="main-title-img">
            <img class="main-title-1" src="/resources/images/main/title.png" alt=""/>
            <%--            <img class="main-title-2" src="/resources/images/login/loginlogo.png" alt=""/>--%>
>>>>>>> a0246d4f2d8e6106538eb271d3a58de533cfcb4f
        </div>
        <div class="mainRequestWrapper">
            <div class="main-request" onclick="location.href='/move'">
                <img class="main-request-img"
                     src="/resources/images/main/deli.png"
                     alt=""/>
                <span>ワンルーム/ 小型引っ越し</span>
            </div>
            <div class="main-request" onclick="location.href='/clean'">
                <img class="main-request-img"
                     src="/resources/images/main/aircon.png"
                     alt=""/>
                <span>エアコンクリーニング</span>
            </div>
            <div class="main-request">
                <img class="main-request-img"
                     src="/resources/images/main/trash.png"
                     alt=""/>
                <span>粗大ごみ回収</span>
            </div>
        </div>

        <section>
            <div class="moving-text">
                <span>SKILL·BANK</span>
                <span>SKILL·BANK</span>
                <span>SKILL·BANK</span>
                <span>SKILL·BANK</span>
                <span>SKILL·BANK</span>
            </div>
        </section>

        <div class="main-ppt">
            <div>
                <div class="ppt-title">STEP. 1</div>
                <div class="ppt-subtitle">リクエストを送る</div>
                <img class="main-img"
                     src="/resources/images/main/ppt1.png"
                     alt=""
                     style="width: 220px"/>
            </div>
            <div>
                <div class="ppt-title">STEP. 2</div>
                <div class="ppt-subtitle">見積書を送る</div>
                <img class="main-img"
                     src="/resources/images/main/ppt2.png"
                     alt=""
                     style="width: 220px"/>
            </div>
            <div>
                <div class="ppt-title">STEP. 3</div>
                <div class="ppt-subtitle">チャットして選ぶ</div>
                <img class="main-img"
                     src="/resources/images/main/ppt3.png"
                     alt=""
                     style="width: 220px"/>
            </div>
        </div>
    </div>
</main>

<script src="/resources/js/main/main.js"></script>

</body>
</html>
