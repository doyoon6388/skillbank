window.onload = () => {
    console.log("✅ 마이페이지 스크립트 로드 완료");

    /** ✅ 모달 오버레이 **/
    const modalOverlay = document.createElement("div");
    modalOverlay.classList.add("mypage-modal-overlay");
    document.body.appendChild(modalOverlay);
    modalOverlay.style.display = "none";

    function openModal(modal) {
        modal.style.display = "flex";
        modalOverlay.style.display = "block";
    }

    function closeModal(modal) {
        modal.style.display = "none";
        modalOverlay.style.display = "none";
    }

    /** ✅ 프로필 이미지 변경 모달 **/
    const profileModal = document.querySelector('.mypage-profile-change-modal');
    const profileImgBtn = document.querySelector('#mypage-profile-img-change-btn');
    const closeProfileModalBtn = document.querySelector(".mypage-profile-change-modal-close");
    const fileInput = document.getElementById('fileInput');
    const changeButton = document.getElementById('changeButton');
    const submitButton = document.getElementById('submitButton');

    if (profileModal) {
        profileModal.style.display = "none";

        profileImgBtn.addEventListener('click', () => {
            console.log("🖼️ 프로필 변경 모달 열림");
            openModal(profileModal);
        });

        closeProfileModalBtn.addEventListener('click', () => {
            closeModal(profileModal);
        });

        changeButton.addEventListener('click', () => {
            fileInput.click();
        });

        fileInput.addEventListener('change', (event) => {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    document.getElementById('profilePreview').src = e.target.result;
                    submitButton.style.display = 'inline-block';
                    changeButton.style.display = 'none';
                }
                reader.readAsDataURL(file);
            }
        });
    }

    /** ✅ 회원 정보 수정 모달 **/
    const infoModal = document.querySelector('.mypage-info-modal');
    const infoCloseBtn = document.querySelector('.mypage-info-modal-close');
    const saveInfoBtn = document.querySelector('#saveInfoButton');
    const modalTitle = document.querySelector('#modalTitle');
    const modalInput = document.querySelector('#modalInput');

    if (infoModal) {
        infoModal.style.display = "none";

        document.querySelectorAll('.mypage-info-item.editable').forEach(item => {
            item.addEventListener('click', function () {
                let field = this.dataset.field;
                let currentValue = this.querySelector('.mypage-info-value').innerText.trim();

                console.log(`📌 ${field} 수정 모달 열기`);
                modalTitle.innerText = this.querySelector('.mypage-info-tag').innerText;

                if (field === "user_birth") {
                    modalInput.innerHTML = `<input type="text" id="modalInputField" style="padding: 10px; text-align: center;">`;
                    setTimeout(() => {
                        flatpickr("#modalInputField", {
                            dateFormat: "Y-m-d",
                            maxDate: "today",
                            defaultDate: currentValue && currentValue !== "null" ? currentValue : "2000-01-01"
                        });
                    }, 100);
                } else if (field === "user_gender") {
                    openModal(document.querySelector('.mypage-gender-modal'));
                    return;
                } else {
                    modalInput.innerHTML = `<input type="text" id="modalInputField" value="${currentValue}" style="padding: 10px; text-align: center;">`;
                }

                openModal(infoModal);

                saveInfoBtn.onclick = function () {
                    let newValue = document.getElementById("modalInputField").value.trim();
                    if (field === "user_birth") {
                        newValue = newValue ? new Date(newValue).toISOString().split("T")[0] : "";
                    }

                    fetch("/mypage/update-info", {
                        method: "POST",
                        headers: {"Content-Type": "application/json"},
                        body: JSON.stringify({field: field, value: newValue})
                    })
                        .then(response => response.json())
                        .then(data => {
                            if (data.success) {
                                alert("修正に成功しました");
                                item.querySelector('.mypage-info-value').innerText = newValue;
                            } else {
                                alert("수정 실패: " + data.message);
                            }
                        })
                        .catch(error => {
                            console.error("Error:", error);
                            alert("서버 오류 발생!");
                        });

                    closeModal(infoModal);
                };
            });
        });

        infoCloseBtn.addEventListener('click', () => {
            closeModal(infoModal);
        });
    }

    /** ✅ 성별 변경 모달 **/
    const genderModal = document.querySelector('.mypage-gender-modal');
    if (genderModal) {
        genderModal.style.display = "none";

        const genderCloseBtn = document.querySelector('.mypage-gender-modal-close');
        const saveGenderBtn = document.getElementById('saveGenderButton');
        const genderButtons = document.querySelectorAll('.gender-option');
        let selectedGender = "";

        genderButtons.forEach(button => {
            button.addEventListener('click', function () {
                genderButtons.forEach(btn => btn.classList.remove("selected"));
                this.classList.add("selected");
                selectedGender = this.dataset.value;
            });
        });

        saveGenderBtn.addEventListener('click', function () {
            if (selectedGender === "") {
                alert("성별을 선택해주세요.");
                return;
            }

            fetch("/mypage/update-info", {
                method: "POST",
                headers: {"Content-Type": "application/json"},
                body: JSON.stringify({field: "user_gender", value: selectedGender})
            })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        alert("성별이 업데이트되었습니다.");
                        document.querySelector('.mypage-info-item[data-field="user_gender"] .mypage-info-value').innerText = selectedGender;
                        closeModal(genderModal);
                    } else {
                        alert("업데이트 실패: " + data.message);
                    }
                })
                .catch(error => {
                    console.error("Error:", error);
                    alert("서버 오류 발생!");
                });
        });

        genderCloseBtn.addEventListener('click', () => {
            closeModal(genderModal);
        });
    }

    /** ✅ 오버레이 클릭 시 모달 닫기 **/
    modalOverlay.addEventListener('click', () => {
        document.querySelectorAll('.mypage-modal-content').forEach(modal => {
            modal.parentElement.style.display = "none";
        });
        modalOverlay.style.display = "none";
    });
};