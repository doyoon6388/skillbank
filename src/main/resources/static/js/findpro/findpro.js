window.onload = () => {

    document.querySelector("#service-MainCategory").addEventListener("change", ()=> firstCategorySelecting());

}; // onload 함수 끝

function firstCategorySelecting() {
    const categoryDefaultEl = document.querySelector("#service-MainCategory");
    const categoryExpressEl = document.querySelector("#service-express-SubCategory");
    const categoryCleanEl = document.querySelector("#service-clean-SubCategory");
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