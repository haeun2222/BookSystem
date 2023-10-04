function changePassword() {
    var currentPassword = document.getElementById("currentPassword").value;
    var newPassword = document.getElementById("newPassword").value;
    var confirmPassword = document.getElementById("confirmPassword").value;

    // 현재 비밀번호와 새로운 비밀번호가 같은지 확인
    if (newPassword === currentPassword) {
        alert("현재 비밀번호와 새로운 비밀번호는 같을 수 없습니다.");
        return;
    }

    // 새로운 비밀번호와 확인 비밀번호가 같은지 확인
    if (newPassword !== confirmPassword) {
       alert("새로운 비밀번호와 확인 비밀번호가 일치하지 않습니다.");
        return;
    }
    
    $("#modifyButton").submit();
}