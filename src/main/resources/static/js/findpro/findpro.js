// 페이지 로드시 기본 필터값으로 목록 요청
document.addEventListener('DOMContentLoaded', async () => {
    await fetchProList("category_all", "review");
});

// 카테고리 select 요소의 변경 이벤트 등록
document.querySelector("#service-main-category").addEventListener("change", async (event) => {
    const selectedCategory = event.target.value;
    // 현재 정렬 옵션도 함께 가져옵니다.
    const sortOption = document.querySelector("#service-filtering").value;
    await fetchProList(selectedCategory, sortOption);
});

// 정렬 select 요소의 변경 이벤트 등록
document.querySelector("#service-filtering").addEventListener("change", async (event) => {
    const sortOption = event.target.value;
    // 현재 카테고리 옵션도 함께 가져옵니다.
    const categoryOption = document.querySelector("#service-main-category").value;
    await fetchProList(categoryOption, sortOption);
});

// fetch 요청 후 프로 목록 업데이트 함수
async function fetchProList(category, sort) {
    try {
        const response = await fetch("/findpro", {
            method: "POST",
            headers: {"Content-Type": "application/json"},
            body: JSON.stringify({category: category, sort: sort})
        });
        const pros = await response.json();
        updateProList(pros);
    } catch (error) {
        console.error("프로 목록 불러오기 에러:", error);
    }
}

function updateProList(pros) {
    const proListContainer = document.getElementById('pro-list-container');
    proListContainer.innerHTML = pros.map(pro => `
        <div class="findpro-item" onclick="location.href='/findpro/detail/${pro.pro_pk}'">
            <div class="findpro-image">
                <img src="/file/${pro.pro_profile_img}" alt="${pro.pro_name}" />
            </div>
            <div class="findpro-info">
                <p class="pro-category">${pro.pro_category}</p>
                <p class="pro-name">${pro.pro_name}</p>
                <div class="pro-badge">
                    <span>⭐ ${pro.pro_favorite}</span>
                    <span>📝 ${pro.pro_review}</span>
                </div>
            </div>
        </div>
    `).join('');
}