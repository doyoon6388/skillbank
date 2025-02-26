window.onload = () => {
    // 기존 모드 확인 후 토글 버튼 상태 유지
    const toggleBtn = document.getElementById("toggle-btn");
    const userText = document.getElementById("user-text");

    const mode = localStorage.getItem("mode"); // 저장된 모드 확인
    if (mode === "user") {
        toggleBtn.checked = true;
        userText.innerHTML = "고객님 반갑습니다.";
    } else {
        toggleBtn.checked = false;
        userText.innerHTML = "${user.username} 프로님 반갑습니다.";
    }
};

function toggleMode() {
    const toggleBtn = document.getElementById("toggle-btn");
    const userText = document.getElementById("user-text");

    if (toggleBtn.checked) {
        userText.innerHTML = "고객님 반갑습니다.";
        localStorage.setItem("mode", "user"); // 고객 모드 저장
        changeToUser();  // 고객 모드로 전환
    } else {
        userText.innerHTML = "${user.username} 프로님 반갑습니다.";
        localStorage.setItem("mode", "pro"); // 프로 모드 저장
        changeToPro();  // 프로 모드로 전환
    }
}

function changeToPro() {
    alert("고수 화면으로 전환합니다");
    location.href = "/pro/main";
}

function changeToUser() {
    alert("고객 화면으로 전환합니다");
    location.href = "/usermode";
}