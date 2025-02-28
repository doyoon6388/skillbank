window.onload = () => {
    console.log("웹사이트 로딩 완료");

    //메인카테고리 선택값
    const categoryDefaultEl = document.querySelector("#service-MainCategory");
    //배달카테고리 선택값
    const categoryExpressEl = document.querySelector("#service-express-SubCategory");
    //청소카테고리 선택값
    const categoryCleanEl = document.querySelector("#service-clean-SubCategory");
    console.log(categoryExpressEl);
    const expressSubcategoryEl = document.querySelector("#express-SubCategory");
    const cleanSubcategoryEl = document.querySelector("#clean-SubCategory");
    const serviceProviders = document.querySelectorAll(".service-provider");



    // 첨에 카테고리밸류 선택
    categoryDefaultEl.addEventListener("change", () => {
        const firstCategoryValue = categoryDefaultEl.value;

        // 숨겼다가
        categoryExpressEl.classList.remove("active");
        categoryCleanEl.classList.remove("active");

        // 만약 fcv가 --먄 ?
        if (firstCategoryValue === "category_express") {
            categoryExpressEl.classList.add("active");
        } else if (firstCategoryValue === "category_clean") {
            categoryCleanEl.classList.add("active");
        }

        filterservices();

    });

        expressSubcategoryEl.addEventListener("change",filterservices);
        cleanSubcategoryEl.addEventListener("change",filterservices);

        function filterservices() {
            const selectMainCategory = categoryDefaultEl.value;
            const selectSubCategory = selectMainCategory === "category_express"
            ? expressSubcategoryEl.value : cleanSubcategoryEl.value;


            serviceProviders.forEach(service => {
                const serviceCategory = service.getAttribute("data-category");
                const serviceSubCategory = service.getAttribute("data-subcategory");

                // 메인 카테고리 일치하는지 확인
                const isMainCategoryMatch
                    = serviceCategory === selectMainCategory.replace("category_", "");

                // 서브 카테고리 일치하는지 확인
                const isSubCategoryMatch = serviceSubCategory === selectSubCategory.replace("express_sv_", "").replace("clean_sv_", "");

                if (isMainCategoryMatch && (selectSubCategory === "" || isSubCategoryMatch)) {
                    service.style.display = "block";
                } else {
                    service.style.display = "none";
                }
            });
        }
};

