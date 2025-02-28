<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="/resources/css/findpro/findprotomap.css">
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>

<div id="search-container">
    <div class="findpro-header">
        <div class="header-title">近くのプロを探す</div>
        <div onclick="location.href='/findpro'" class="header-list"> ← リストで探す</div>
    </div>
    <div> 近くのプロを確実＆スピーディーに見つけよう！🙋‍♀️</div>


    <form action="/findprotomap" method="get">
        <div class="filter-wrapper">
            <!-- ✅ 왼쪽: 서비스 및 지역 필터링 -->
            <div class="filter-left">
                <label for="service-MainCategory">상세 서비스 선택:</label>
                <select id="service-MainCategory">
                    <option value="category_service" disabled selected hidden> サービス </option>
                    <option value="category_all">
                        すべてのサービス
                    </option>
                    <option value="category_express"> 引っ越し全般
                    </option>
                    <option value="category_clean">  クリーニング全般
                    </option>
                </select>

                <label for="service-express-SubCategory">이사 세부 카테고리 선택:</label>
                <select id="service-express-SubCategory">
                    <option value="express_category_all" disabled selected hidden> 引っ越し </option>
                    <option value="express_sv_all">引っ越し全般</option>
                    <option value="express_sv_home">家庭の引っ越し</option>
                    <option value="express_sv_office">オフィスの引っ越し</option>
                    <option value="express_sv_oneroom">ワンルームの引っ越し</option>
                    <option value="express_sv_van">軽トラック・運送</option>
                </select>

                <label for="service-clean-SubCategory">청소 세부 카테고리 선택:</label>
                <select id="service-clean-SubCategory">
                    <!-- disabled 선택 불가능 / selected 기본 선택된 상태 / hidden 보이지 않게 숨김-->
                    <option value="clean_category_all" disabled selected hidden>クリーニング</option>
                    <option value="clean_sv_all">クリーニング全般</option>
                    <option value="clean_sv_home">入居・家のクリーニング</option>
                    <option value="clean_sv_office">オフィス・店舗クリーニング</option>
                    <option value="clean_sv_furniture">家電・家具のクリーニング</option>
                    <option value="clean_sv_trash">解体・廃棄</option>
                </select>
            </div>
        </div>

        <!-- ✅ 구분선 추가 -->
        <hr class="separator">

        <!-- ✅ 중앙 지도 영역 -->
        <div class="findpro-map">지도 이미지</div>

    </form> <!-- ✅ form 닫힘 추가 -->

</div> <!-- ✅ search-container 끝 -->

</body>
</html>
