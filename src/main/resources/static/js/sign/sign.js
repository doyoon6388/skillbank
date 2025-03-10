document.addEventListener("DOMContentLoaded", function () {
    const nameInput = document.getElementById("user_name");
    const passwordInput = document.getElementById("user_pw");
    const passwordConfirmInput = document.getElementById("user_pw_confirm");
    const emailInput = document.getElementById("user_email");
    const nicknameInput = document.getElementById("user_nickname");

    // ✅ 메시지 알림 처리 (회원가입 성공/실패 시)
    const successMessageElem = document.getElementById("message-data");
    const errorMessageElem = document.getElementById("error-data");

    if (successMessageElem && successMessageElem.value.trim() !== "" && successMessageElem.value.trim() !== "null") {
        alert(successMessageElem.value);
        window.location.href = "/login";  // ✅ 성공 시 로그인 페이지 이동
    }
    if (errorMessageElem && errorMessageElem.value.trim() !== "" && errorMessageElem.value.trim() !== "null") {
        alert(errorMessageElem.value);
    }

    // ✅ 입력값 검증 함수 (클래스로 스타일 적용)
    function validateInput(input, condition) {
        if (condition) {
            input.classList.add("invalid");
            input.classList.remove("valid");
        } else {
            input.classList.add("valid");
            input.classList.remove("invalid");
        }
    }

    // ✅ 이름 검증 (특수문자 & 숫자 포함 여부 확인)
    function checkNameValidity() {
        const name = nameInput.value.trim();
        const hasSpecialCharOrNumber = /[\d!@#$%^&*()_+={}\[\]:;"'<>,.?/\\|-]/.test(name);
        validateInput(nameInput, hasSpecialCharOrNumber || name === "");
    }

    nameInput.addEventListener("input", checkNameValidity);
    nameInput.addEventListener("blur", checkNameValidity);

    // ✅ 1. 비밀번호 검증 (영문 + 숫자 포함, 5글자 이상, 특수기호 X)
    function checkPasswordValidity() {
        const password = passwordInput.value;
        const hasLetter = /[a-zA-Z]/.test(password);
        const hasNumber = /\d/.test(password);
        const hasSpecialChar = /[!@#$%^&*]/.test(password);
        const isValidPassword = password.length >= 5 && hasLetter && hasNumber && !hasSpecialChar;

        validateInput(passwordInput, !isValidPassword);

        // 🎯 비밀번호 자체가 틀리면 비밀번호 확인도 무조건 빨간색
        if (!isValidPassword) {
            validateInput(passwordConfirmInput, true);
        } else {
            checkPasswordMatch();
        }
    }

    // ✅ 2. 비밀번호 재확인 검증
    function checkPasswordMatch() {
        const password = passwordInput.value;
        validateInput(passwordConfirmInput, passwordConfirmInput.value !== password);
    }

    // 이벤트 리스너 추가
    passwordInput.addEventListener("blur", checkPasswordValidity);
    passwordInput.addEventListener("input", checkPasswordValidity);
    passwordConfirmInput.addEventListener("blur", checkPasswordMatch);
    passwordConfirmInput.addEventListener("input", checkPasswordMatch);

    // ✅ 3. 이메일 & 닉네임 입력 필드 기본 검증 (중복 확인용)
    function checkRequiredField(event) {
        validateInput(event.target, event.target.value.trim() === "");
    }

    emailInput.addEventListener("blur", checkRequiredField);
    nicknameInput.addEventListener("blur", checkRequiredField);

    // ✅ 이메일 중복 체크 (AJAX)
    function checkEmailAvailability() {
        const email = emailInput.value.trim();
        if (email === "") return;

        fetch("/check-email", {
            method: "POST",
            headers: {"Content-Type": "application/json"},
            body: email
        })
            .then(response => response.json())
            .then(data => {
                console.log("서버 응답: ", data);
                validateInput(emailInput, data.status !== 0);
            })
            .catch(() => alert("이메일 중복 확인 중 오류가 발생했습니다."));
    }

    emailInput.addEventListener("blur", checkEmailAvailability);

    // ✅ 닉네임 중복 체크 (AJAX)
    function checkNicknameAvailability() {
        const nickname = nicknameInput.value.trim();
        if (nickname === "") return;

        fetch("/check-nickname", {
            method: "POST",
            headers: {"Content-Type": "application/json"},
            body: nickname
        })
            .then(response => response.json())
            .then(data => {
                console.log("서버 응답: ", data);
                validateInput(nicknameInput, data.status !== 0);
            })
            .catch(() => alert("닉네임 중복 확인 중 오류가 발생했습니다."));
    }

    nicknameInput.addEventListener("blur", checkNicknameAvailability);


    // ✅ 6. 폼 제출 시 검증 (이메일, 닉네임 중복 확인 포함)
    document.getElementById("sign-form").addEventListener("submit", function (event) {
        if (!passwordConfirmInput.value) {
            alert("パスワード確認が入力されていません！");
            event.preventDefault();
            return false;
        }

        if (passwordInput.value !== passwordConfirmInput.value) {
            alert("パスワードが一致しません。");
            event.preventDefault();
            return false;
        }

        // ✅ 이메일, 닉네임 중복 체크 후 제출 막기 (올바른 데이터 검증)
        if (emailInput.getAttribute("data-valid") === "true") {
            alert("이미 사용 중인 이메일입니다.");
            event.preventDefault();
            return false;
        }

        if (nicknameInput.getAttribute("data-valid") === "true") {
            alert("이미 사용 중인 닉네임입니다.");
            event.preventDefault();
            return false;
        }

        return true;
    });
});

document.addEventListener("DOMContentLoaded", function () {
    const tooltipIcons = document.querySelectorAll(".tooltip-icon");

    tooltipIcons.forEach(icon => {
        icon.addEventListener("click", function () {
            const tooltip = this.getAttribute("data-tooltip");

            // 기존에 표시된 툴팁이 있으면 제거
            const existingTooltip = document.querySelector(".tooltip-box");
            if (existingTooltip) existingTooltip.remove();

            // 툴팁 생성
            const tooltipBox = document.createElement("div");
            tooltipBox.classList.add("tooltip-box");
            tooltipBox.textContent = tooltip;

            document.body.appendChild(tooltipBox);

            // 툴팁 위치 조정
            const rect = this.getBoundingClientRect();
            tooltipBox.style.left = `${rect.left + window.scrollX}px`;
            tooltipBox.style.top = `${rect.top + window.scrollY - 35}px`;

            // 일정 시간 후 자동 제거
            setTimeout(() => tooltipBox.remove(), 3000);
        });
    });
});