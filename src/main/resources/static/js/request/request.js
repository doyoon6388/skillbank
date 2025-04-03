function validateStep1(event) {
    event.preventDefault(); // 🚨 폼 제출 방지

    let selectedOption = document.querySelector("input[name='request1']:checked");
    if (!selectedOption) {
        alert("이사 종류를 선택해주세요.");
        return;
    }

    document.getElementById("request1").value = selectedOption.value; // 값 저장
    loadStep(2);
}

function validateStep2(event) {
    event.preventDefault(); // 🚨 폼 제출 방지

    let selectedOption = document.querySelector("input[name='request2']:checked");
    if (!selectedOption) {
        alert("짐 운반 가능 여부를 선택해주세요.");
        return;
    }

    document.getElementById("request2").value = selectedOption.value; // 값 저장
    loadStep(3);
}

/*function validateStep3(event) {
    event.preventDefault(); // 🚨 폼 제출 방지

    let selectedOption = document.querySelector("input[name='request3']:checked");
    if (!selectedOption) {
        alert("항목을 선택해 주세요.");
        return;
    }

    document.getElementById("request3").value = selectedOption.value; // 값 저장
    loadStep(4);
}*/

function validateStep4(event) {
    event.preventDefault(); // 🚨 폼 제출 방지

    let selectedOption = document.querySelector("input[name='request5']:checked");
    if (!selectedOption) {
        alert("항목을 선택해 주세요.");
        return;
    }

    document.getElementById("request5").value = selectedOption.value; // 값 저장
    loadStep(6);
}

function validateStep5(event) {
    event.preventDefault(); // 🚨 폼 제출 방지

    let selectedOption = document.querySelector("input[name='request6']:checked");
    if (!selectedOption) {
        alert("항목을 선택해 주세요.");
        return;
    }

    document.getElementById("request6").value = selectedOption.value; // 값 저장
    loadStep(7);
}

/*function validateStep6(event) {
    event.preventDefault(); // 🚨 폼 제출 방지

    let selectedOption = document.querySelector("input[name='request7']:checked");
    if (!selectedOption) {
        alert("항목을 선택해 주세요.");
        return;
    }*/

/*  document.getElementById("request7").value = selectedOption.value; // 값 저장
  loadStep(8);
}*/

function validateStep7(event) {
    event.preventDefault(); // 🚨 폼 제출 방지

    let selectedOption = document.querySelector("input[name='request8']:checked");
    if (!selectedOption) {
        alert("항목을 선택해 주세요.");
        return;
    }

    document.getElementById("request8").value = selectedOption.value; // 값 저장
    loadStep(9);
}

function validateStep8(event) {
    event.preventDefault(); // 🚨 폼 제출 방지

    let selectedOption = document.querySelector("input[name='request9']:checked");
    if (!selectedOption) {
        alert("항목을 선택해 주세요.");
        return;
    }

    document.getElementById("request9").value = selectedOption.value; // 값 저장
    loadStep(10);
}

function validateStep9(event) {
    event.preventDefault(); // 🚨 폼 제출 방지

    let selectedOption = document.querySelector("input[name='request10']:checked");
    if (!selectedOption) {
        alert("항목을 선택해 주세요.");
        return;
    }

    document.getElementById("request10").value = selectedOption.value; // 값 저장
    loadStep(11);
}

function validateStep10(event) {
    event.preventDefault(); // 🚨 폼 제출 방지

    let selectedOption = document.querySelector("input[name='request11']:checked");
    if (!selectedOption) {
        alert("항목을 선택해 주세요.");
        return;
    }

    document.getElementById("request11").value = selectedOption.value; // 값 저장
    loadStep(12);
}

function validateStep11(event) {
    event.preventDefault(); // 🚨 폼 제출 방지

    let selectedOption = document.querySelector("input[name='request12']:checked");
    if (!selectedOption) {
        alert("항목을 선택해 주세요.");
        return;
    }

    document.getElementById("request12").value = selectedOption.value; // 값 저장
    loadStep(13);
}

function validateStep12(event) {
    event.preventDefault(); // 🚨 폼 제출 방지

    let selectedOption = document.querySelector("input[name='request13']:checked");
    if (!selectedOption) {
        alert("항목을 선택해 주세요.");
        return;
    }

    document.getElementById("request13").value = selectedOption.value; // 값 저장
    loadStep(14);
}

function validateStep13(event) {
    event.preventDefault(); // 🚨 폼 제출 방지

    let selectedOption = document.querySelector("input[name='request14']:checked");
    if (!selectedOption) {
        alert("항목을 선택해 주세요.");
        return;
    }

    document.getElementById("request14").value = selectedOption.value; // 값 저장
    loadStep(15);
}