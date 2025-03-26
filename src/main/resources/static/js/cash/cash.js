document.addEventListener("DOMContentLoaded", function () {
    const cashItems = document.querySelectorAll(".cash-item");

    // ✅ 초기에 checked된 요소가 있으면 selected 클래스 추가
    cashItems.forEach(item => {
        const radio = item.querySelector("input[type='radio']");
        if (radio.checked) {
            item.classList.add("selected");
        }
    });

    cashItems.forEach(item => {
        const radio = item.querySelector("input[type='radio']");

        radio.addEventListener("change", function () {
            // 모든 cash-item에서 selected 클래스 제거
            cashItems.forEach(i => i.classList.remove("selected"));

            // 선택된 radio의 부모 요소에 selected 클래스 추가
            if (this.checked) {
                this.closest(".cash-item").classList.add("selected");
            }
        });
    });
});