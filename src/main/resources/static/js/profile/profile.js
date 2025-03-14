window.onload = () => {
    const toggleBtn = document.getElementById("toggle-btn");
    const userText = document.getElementById("user-text");

    let mode = localStorage.getItem("mode"); // 저장된 모드 확인
    console.log(mode);

    // mode가 없으면 기본값을 "user"(왼쪽)로 설정
    if (mode === null) {
        localStorage.setItem("mode", "user");
        mode = localStorage.getItem("mode");
    }

    // 저장된 모드에 따라 토글 상태 설정
    if (mode === "user") {
        userText.innerHTML = `${username} 고객님`;
    } else {
        userText.innerHTML = `${username} 프로님`;
    }

    setTimeout(() => {
    }, 50); // 애니메이션 지연 시간 (0.05초 후)
};

function toggleMode() {
    const toggleBtn = document.getElementById("toggle-btn");
    const userText = document.getElementById("user-text");

    // 토글이 활성화되었을 때 (프로 모드로 변경)
    if (toggleBtn.checked) {
        userText.innerHTML = `${username} 프로님`;
        localStorage.setItem("mode", "pro");

        // 애니메이션 후 페이지 이동 (300ms)
        setTimeout(() => {
            changeToPro();
        }, 200); // 애니메이션 시간 후 페이지 이동
    } else {
        // 토글이 비활성화되었을 때 (고객 모드로 변경)
        userText.innerHTML = `${username} 고객님`;
        localStorage.setItem("mode", "user");

        // 애니메이션 후 페이지 이동 (300ms)
        setTimeout(() => {
            changeToUser();
        }, 200); // 애니메이션 시간 후 페이지 이동
    }
}

function changeToPro() {
    // 페이지 이동
    window.location.href = "/pro/main";
}

function changeToUser() {
    // 페이지 이동
    window.location.href = "/usermode";
}

function logout() {
    let confirmLogout = confirm("ログアウトしますか?");
    if (confirmLogout) {
        localStorage.removeItem("mode");
        location.href = "/logout";
    }
}

function checkPro(user_pk){
  fetch('/haspro', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({ user_pk: user_pk })
  })
      .then(response => response.json())
      .then(data => {
          console.log(data);
        // 서버로부터 받은 응답 처리
        if (data === 0){
          if (confirm('프로 계정이 없습니다. 가입하시겠습니까?')){
            location.href='proAccount.jsp';
          }
        }
      })
      .catch(error => {
        console.error('Error:', error);
      });
}
