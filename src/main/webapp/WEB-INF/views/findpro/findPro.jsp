<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="/resources/css/findpro/findpro.css">
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
                <hr class="separator">
        <c:forEach items="${services}" var="s">
        <div id="service-provider-list">
            <div class="service-provider"
                 data-category="${s.service_category}"
                 data-subcategory="${s.service_subcategory}">
                <div class="service-provider-info">
                    <div class="name">${s.service_title}</div>
                    <div class="details">★ 4.7 (22) · 26回の依頼 · 경력 30년</div>
                    <div class="description">${s.service_content}</div>
                </div>
            </div>
            <div>
                <img src="/testimg/${s.image != null ? s.image : 'default.jpg'}" alt="default image display!">
            </div>
        </div>
        </c:forEach>

</div>
            </div>
        </div>
    </form>
</div>
</body>
</html>