window.onload = () => {
    // ✅ 프로필 이미지 변경 모달
    const profileModal = document.querySelector('.mypage-profile-change-modal');
    const profileImgBtn = document.querySelector('#mypage-profile-img-change-btn');
    const closeProfileModalBtn = document.querySelector(".mypage-profile-change-modal-close");
    const fileInput = document.getElementById('fileInput');
    const changeButton = document.getElementById('changeButton');
    const submitButton = document.getElementById('submitButton');

    // ✅ 모달 기본 숨김 (이 코드 추가)
    profileModal.style.display = "none";

    // ✅ 프로필 클릭 시 모달 열기
    profileImgBtn.addEventListener('click', () => {
        profileModal.style.display = "flex"; // 중앙 정렬을 위해 flex 적용
    });

    // ✅ 닫기 버튼 클릭 시 모달 닫기
    closeProfileModalBtn.addEventListener('click', () => {
        profileModal.style.display = "none";
    });

    // ✅ 파일 선택 버튼 클릭 시 파일 입력 창 열기
    changeButton.addEventListener('click', () => {
        fileInput.click();
    });

    // ✅ 파일 선택 시 미리보기 & 제출 버튼 활성화
    fileInput.addEventListener('change', (event) => {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                document.getElementById('profilePreview').src = e.target.result;
                submitButton.style.display = 'inline-block'; // 제출 버튼 표시
                changeButton.style.display = 'none'; // 변경하기 버튼 숨김
            }
            reader.readAsDataURL(file);
        }
    });

    // ✅ 회원 정보 수정 모달
    const infoModal = document.querySelector('.mypage-info-modal');
    const infoCloseBtn = document.querySelector('.mypage-info-modal-close');
    const saveInfoBtn = document.querySelector('#saveInfoButton');
    const modalTitle = document.querySelector('#modalTitle');
    const modalInput = document.querySelector('#modalInput');

    // ✅ 회원 정보 수정 모달 기본 숨김 (이 코드 추가)
    infoModal.style.display = "none";

    // ✅ 회원 정보 수정 가능 div 클릭 시 모달 열기
    document.querySelectorAll('.mypage-info-item.editable').forEach(item => {
        item.addEventListener('click', function () {
            let field = this.dataset.field;
            let currentValue = this.querySelector('.mypage-info-value').innerText.trim();

            // ✅ 모달에 데이터 반영
            modalTitle.innerText = this.querySelector('.mypage-info-tag').innerText + " 수정";

            // ✅ 생년월일 입력 시 Flatpickr 적용
            if (field === "user_birth") {
                modalInput.innerHTML = `<input type="text" id="modalInputField" style="width: 100%; padding: 10px;">`;

                // ✅ Flatpickr 적용 (입력 필드가 DOM에 추가된 후 실행)
                setTimeout(() => {
                    flatpickr("#modalInputField", {
                        dateFormat: "Y-m-d",
                        maxDate: "today", // 미래 날짜 선택 방지
                        defaultDate: currentValue && currentValue !== "null" ? currentValue : "2000-01-01" // 기본값 설정
                    });
                }, 100);
            } else {
                // ✅ 일반 텍스트 입력 필드
                modalInput.innerHTML = `<input type="text" id="modalInputField" value="${currentValue}" style="width: 100%; padding: 10px;">`;
            }

            infoModal.style.display = "flex";

            // ✅ 저장 버튼 클릭 시 AJAX 요청
            saveInfoBtn.onclick = function () {
                let newValue = document.getElementById("modalInputField").value.trim();

                // ✅ 생년월일은 날짜 형식으로 변환
                if (field === "user_birth") {
                    newValue = newValue ? new Date(newValue).toISOString().split("T")[0] : "";
                }

                // ✅ AJAX 요청 (비동기 처리)
                fetch("/mypage/update-info", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json"
                    },
                    body: JSON.stringify({
                        field: field,
                        value: newValue
                    })
                })
                    .then(response => response.json())
                    .then(data => {
                        if (data.success) {
                            alert("정보가 성공적으로 수정되었습니다.");
                            item.querySelector('.mypage-info-value').innerText = newValue;
                        } else {
                            alert("수정 실패: " + data.message);
                        }
                    })
                    .catch(error => {
                        console.error("Error:", error);
                        alert("서버 오류 발생!");
                    });

                // ✅ 모달 닫기
                infoModal.style.display = "none";
            };
        });
    });

    // ✅ 닫기 버튼 클릭 시 모달 닫기
    infoCloseBtn.addEventListener('click', () => {
        infoModal.style.display = "none";
    });
};