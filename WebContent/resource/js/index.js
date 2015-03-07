$(document).ready(function () {
    var label_Email = $("<label>");
    var label_Pwd = $("<label>");
    var label_regName = $("<label>");
    var label_regEmail = $("<label>");
    var label_regPwd = $("<label>");
    var label_regPwdcon = $("<label>");

    var regex_Email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;  
    var regex_Pwd = /^[A-Za-z0-9]{6,12}$/;
    //var regex_Pwd = /^.*(?=^.{6,12}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
    redrawDotNav();

    $(window).scroll(function () {
        redrawDotNav();       
    });

    $("a.login").click(function () {
        $('html, body').animate({
            scrollTop: 0
        }, 1000);
        return false;
    });
    $('a.intro1').click(function () {
        $('html, body').animate({
            scrollTop: $('#area2').offset().top
        }, 1000);
        return false;
    });
    $('a.intro2').click(function () {
        $('html, body').animate({
            scrollTop: $('#area3').offset().top
        }, 1000);
        return false;
    });
    $('a.intro3').click(function () {
        $('html, body').animate({
            scrollTop: $('#area4').offset().top
        }, 1000);
        return false;
    });

    $('#btn-reg-field').click(function () {
        $('#reg-box').fadeIn(400);

        reset_loginForm();
    });

    $('#reg-close-box a').click(function () {
        $('#reg-box').fadeOut(300);
    });

    // 로그인 폼 유효성 검사
    $('#btn-login').click(function () {
        reset_loginForm();

        var uidVal = $("#uid").val();
        var pwdVal = $("#pwd").val();

        if (uidVal == "") {
            $('#login-email-wrapper p').append(label_Email);
            $('#login-email-wrapper label').text("이 필드는 필수 입력 항목입니다.");
            $('#uid').css('border-color', '#e4a197');
        } else if (uidVal.length < 6 || !regex_Email.test(uidVal)) {
            $('#login-email-wrapper p').append(label_Email);
            $('#login-email-wrapper label').text("이메일 형식이 올바르지 않습니다.");
            $('#uid').css('border-color', '#e4a197');
        }

        if (pwdVal == "") {
            $('#login-pwd-wrapper p').append(label_Pwd);
            $('#login-pwd-wrapper label').text("이 필드는 필수 입력 항목입니다.");
            $('#pwd').css('border-color', '#e4a197');
        }

    });

    // 회원가입 폼 유효성 검사
    $("#btn-reg").click(function () {
        var nameVal = $("#reg-name").val();
        var uidVal = $("#reg-uid").val();
        var pwdVal = $("#reg-pwd").val();
        var pwdconVal = $("#reg-pwd-con").val();        
        
        reset_regForm();

        // 이름
        if (nameVal == "") {
            $('#reg-name-wrapper p').append(label_regName);
            $('#reg-name-wrapper label').text("이 필드는 필수 입력 항목입니다.");
            $('#reg-name').css('border-color', '#e4a197');
        }

        // 아이디
        if (uidVal == "") {
            $('#reg-email-wrapper p').append(label_regEmail);
            $('#reg-email-wrapper label').text("이 필드는 필수 입력 항목입니다.");
            $('#reg-uid').css('border-color', '#e4a197');
        }
        else if (!regex_Email.test(uidVal)) {
            $('#reg-email-wrapper p').append(label_regEmail);
            $('#reg-email-wrapper label').text("이메일 형식이 올바르지 않습니다.");
            $('#reg-uid').css('border-color', '#e4a197');
        }

        // 비밀번호
        if (pwdVal == "") {
            $('#reg-pwd-wrapper p').append(label_regPwd);
            $('#reg-pwd-wrapper label').text("이 필드는 필수 입력 항목입니다.");
            $('#reg-pwd').css('border-color', '#e4a197');
        } else if (!regex_Pwd.test(pwdVal)) {
            $('#reg-pwd-wrapper p').append(label_regPwd);
            $('#reg-pwd-wrapper label').text("비밀번호 형식이 맞지 않습니다.(6~12자리)");
            $('#reg-pwd').css('border-color', '#e4a197');
        }
        
        // 비밀번호 확인
        if (pwdconVal == "") {
            $('#reg-pwdcon-wrapper p').append(label_regPwdcon);
            $('#reg-pwdcon-wrapper label').text("이 필드는 필수 입력 항목입니다.");
            $('#reg-pwd-con').css('border-color', '#e4a197');
        } else if (pwdVal != pwdconVal) {
            $('#reg-pwdcon-wrapper p').append(label_regPwdcon);
            $('#reg-pwdcon-wrapper label').text("비밀번호가 일치하지 않습니다.");
            $('#reg-pwd-con').css('border-color', '#e4a197');
        }
    });
});

function reset_loginForm() {
    $('#loginform label').remove();
    $('#loginform input').css('border-color', '#D8D8D8');
}

function reset_regForm() {
    $('#regform label').remove();
    $('#regform input').css('border-color', '#D8D8D8');
}

function redrawDotNav() {
    var section1Top = 0;
    var section2Top = $('#area2').offset().top;
    var section3Top = $('#area3').offset().top;
    var section4Top = $('#area4').offset().top - 284;
    $('nav#primary a').removeClass('active');

    if ($(document).scrollTop() >= section1Top && $(document).scrollTop() < section2Top) {
        $('nav#primary a.login').addClass('active');
    } else if ($(document).scrollTop() >= section2Top && $(document).scrollTop() < section3Top) {
        $('nav#primary a.intro1').addClass('active');
    } else if ($(document).scrollTop() >= section3Top && $(document).scrollTop() < section4Top) {
        $('nav#primary a.intro2').addClass('active');
    } else if ($(document).scrollTop() >= section4Top) {
        $('nav#primary a.intro3').addClass('active');
    }
}