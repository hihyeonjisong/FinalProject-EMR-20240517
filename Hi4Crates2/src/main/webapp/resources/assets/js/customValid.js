// 이름(한글만 허용)
function validateName(name) {
    var nameRegex = /^[가-힣]+$/;
    
    return nameRegex.test(name);
}

// 아이디(4~16자)
function validateUsername(username) {
    var usernameRegex = /^[a-zA-Z0-9_-]{4,16}$/;
    return usernameRegex.test(username);
}

// 비밀번호(영어, 숫자, 특수문자 포함한 4~10자리)
function validatePassword(password) {
    var passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{4,10}$/;
    return passwordRegex.test(password);
}

// 이메일
function validateEmail(email) {
    var emailRegex = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
    return emailRegex.test(email);
}

// 주민등록번호(111111-1111111 형식)
function validateResidentNumber(residentNumber) {
    var residentNumberRegex = /^\d{6}-\d{7}$/;
    return residentNumberRegex.test(residentNumber);
}

// 전화번호(010-0000-0000 형식)
function validatePhoneNumber(phoneNumber) {
    var phoneNumberRegex = /^010-\d{4}-\d{4}$/;
    return phoneNumberRegex.test(phoneNumber);
}

// 비밀번호 확인
function correctPassword(pw1, pw2){
    if(pw1 === pw2) return true;
    else return false;
}

