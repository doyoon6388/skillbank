const stars = document.querySelectorAll('.star');
const ratingValue = document.getElementById('ratingValue');
let currentRating = 0;

function updateStarsDisplay(rating) {
    stars.forEach((star, index) => {
        const starFill = star.querySelector('.star-fill');
        const starNumber = index + 1;
        if (rating >= starNumber) {
            starFill.style.width = '100%';
        } else if (rating >= starNumber - 0.5) {
            starFill.style.width = '50%';
        } else {
            starFill.style.width = '0';
        }
    });
}

stars.forEach((star, index) => {
    // 마우스 이동 시 현재 별에서 왼쪽(0.5) 또는 오른쪽(1)의 선택 감지
    star.addEventListener('mousemove', (e) => {
        const rect = star.getBoundingClientRect();
        const offsetX = e.clientX - rect.left;
        const fillAmount = offsetX < rect.width / 2 ? 0.5 : 1;
        const previewRating = index + fillAmount;
        updateStarsDisplay(previewRating);
    });

    // 클릭 시 선택된 별점 저장
    star.addEventListener('click', (e) => {
        const rect = star.getBoundingClientRect();
        const offsetX = e.clientX - rect.left;
        const fillAmount = offsetX < rect.width / 2 ? 0.5 : 1;
        currentRating = index + fillAmount;
        ratingValue.value = currentRating;
        updateStarsDisplay(currentRating);
    });
});

// 마우스가 영역을 벗어나면 현재 선택된 별점으로 복원
document.getElementById('starRating').addEventListener('mouseleave', () => {
    updateStarsDisplay(currentRating);
});