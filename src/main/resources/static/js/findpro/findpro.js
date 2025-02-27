window.onload = () => {
    console.log("웹사이트 로딩 완료");


    const categoryDefaultEl = document.querySelector("#service-MainCategory");
    const categoryExpressEl = document.querySelector("#service-express-SubCategory");
    const categoryCleanEl = document.querySelector("#service-clean-SubCategory");
    console.log(categoryExpressEl);

    function firstCategorySelecting() {
        const firstCategoryValue = categoryDefaultEl.value;


        // 숨겼다가
        categoryExpressEl.classList.remove("active");
        categoryCleanEl.classList.remove("active");
        // 보이기
        if (firstCategoryValue === "category_express") {
            categoryExpressEl.classList.add("active");
        } else if (firstCategoryValue === "category_clean") {
            categoryCleanEl.classList.add("active");
        }
    }


    // 첨에 카테고리밸류 선택시 메소드로 변경
    categoryDefaultEl.addEventListener("change", firstCategorySelecting);
};