<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="/resources/css/findpro.css">
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="/resources/js/findpro/findpro.js"></script>
</head>
<body>

<div id="search-container">
    <div class="findpro-header"> プロを探す </div>


    <form action="/findpro-result" method="get">
        <div class="filter-wrapper">
            <div class="filter-left">
                <label for="service-MainCategory">サービス</label>
                <select id="service-MainCategory">
                    <option value="category_service" disabled selected hidden>サービス</option>
                    <option value="category_all">すべてのサービス</option>
                    <option value="category_express">引っ越し全般</option>
                    <option value="category_clean">クリーニング全般</option>
                </select>

                <div id="subCategoryContainer">
                    <!-- 이사 세부 카테고리 -->
                    <div id="service-express-SubCategory" class="sub-category">
                        <label for="express-SubCategory"></label>
                        <select id="express-SubCategory">
                            <option value="express_sv_all">引っ越し全般</option>
                            <option value="express_sv_home">家庭の引っ越し</option>
                            <option value="express_sv_office">オフィスの引っ越し</option>
                            <option value="express_sv_oneroom">ワンルームの引っ越し</option>
                            <option value="express_sv_van">軽トラック・運送</option>
                        </select>
                    </div>

                    <!-- 청소 세부 카테고리 -->
                    <div id="service-clean-SubCategory" class="sub-category">
                        <label for="clean-SubCategory"></label>
                        <select id="clean-SubCategory">
                            <option value="clean_sv_all">クリーニング全般</option>
                            <option value="clean_sv_home">入居・家のクリーニング</option>
                            <option value="clean_sv_office">オフィス・店舗クリーニング</option>
                            <option value="clean_sv_furniture">家電・家具のクリーニング</option>
                            <option value="clean_sv_trash">解体・廃棄</option>
                        </select>
                    </div>
                    </div>
                    </div>


                <!-- ✅ 오른쪽: 필터, 검색창, 지도 버튼, 고수 리스트를 함께 정렬 -->
            <div class="filter-right">
                <div class="filter-options">
                    <label for="service-filtering">서비스 필터링:</label>
                    <select id="service-filtering">
                        <option value="reviewfilter" selected> 口コミが多い順
                      </option>
                        <option value="ratingfilter">評価が高い順</option>
                        <option value="usagefilter">依頼数が多い順</option>
                    </select>
                    <div class="findpro-search-tab" style="display: flex">
                    <input type="search" style="width: 300px" id="findpro_search" placeholder="ご希望のサービスは何ですか？">
                       <button> 検索 </button>
                        <div>
                            <button onclick="location.href='/findprotomap'" type="button" id="findpro_map">またはマップ! </button>
                        </div>
                </div>

                </div>
            </div>

                </div>




                <!-- ✅ 수평선 추가 -->
                <hr class="separator">

                <!-- ✅ 고수 리스트 (오른쪽 정렬) -->
                <div id="service-provider-list">
                    <div class="service-provider">
                        <div class="service-provider-info">
                            <div class="name">한울 이사</div>
                            <div class="details">★ 4.7 (22) · 26回の依頼
                               · 경력 30년</div>
                            <div class="description">이사 전문 브랜드 한울 이사</div>
                        </div>
                        </div>
                        <div> <img src="images/moving1.jpg" alt="한울 이사"> </div>
                </div>
                </div>
            </div> <!-- ✅ filter-right 끝 -->
        </div> <!-- ✅ filter-wrapper 끝 -->
    </form>
</div> <!-- ✅ search-container 끝 -->
</body>
</html>