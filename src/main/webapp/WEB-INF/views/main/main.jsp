<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8"/>
    <title>SkillBank</title>

    <link rel="stylesheet" href="/resources/css/main/main.css"/>
</head>
<body>
<main>
    <div class="main-container">
        <div class="main-title-img">
            <img class="main-title-1" src="/resources/images/main/title.png" alt=""/>

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
            <div class="main-request" onclick="location.href='/waste'">
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
