// 온라인 퀵 입사지원 공고리스트용
var lay_Booking_Open2 = function (gno, oem_no, path_code) {
    //모의입사지원체크 150603
    if (typeof Cntst_Stat != "undefined") {
        if (Cntst_Stat == "1") {
            if (typeof getCookie("Cntst" + gno) == "undefined") {
                var CntstMsg = "본 공고는 \n\n<" + cname.replace(" 취창업지원센터", "") + " 모의입사지원 경진대회> 참가자만 지원가능합니다.\n\n" +
                cname.replace(" 취창업지원센터", "") + "학생은 <경진대회 사이트>에 접속하여 지원하시기 바랍니다.\n\n(취창업지원센터 홈페이지 참조)";
                alert(CntstMsg);
                return;
            }
        }
    }

    jQuery.ajax({
        type: "GET",
        url: "/List_GI/OnPass_Booking_Check.asp",
        data: "Gno=" + gno,
        dataType: "html",
        success: function (data) {
            if (data == "0" || data == "6") {
                var _data = {                   
                    Gno: gno,
                    Oem_No: oem_no,
                    Path_Code : path_code
                }

                jQuery.ajax({
                    type: "post",
                    url: "/List_GI/OnPass_Booking_Frame.asp",
                    data: _data,
                    success: function (data2) {
                        lay_Booking_Cls();

                        // 레이어 위치 조절 전 hide 대신 좌측으로 넘겼다가 가져옴.
                        // hide 실행시 해당 div의 height 조절 못함
                        jQuery("body").append(data2).find("div.layerReservation").css("left", "-9999px");

                        lay_Booking_Frm_Size();
                    },
                    error: function (xhr) {
                        alert(xhr.message);
                    }
                });
            } else {
                pass_alert(data);
            }
        }
    });
}

function pass_alert(num) {
    switch (num) {
        case '1': alert('공고가 마감되어 지원이 불가능합니다.'); break;
        case '2': alert('공고가 삭제되어 지원이 불가능합니다.'); break;
        case '3': alert('이미 입사지원한 채용공고입니다.'); break;
        case '4': alert('기업회원이 회원님의 이력서를 열람하고 스크랩하여 검토중입니다.'); break;
        case '5': alert('이력서가 완성되지 않았습니다.'); break;
        case '6': alert('열람기업 제한 서비스에 등록된 기업이므로  입사지원을 할 수 없습니다.'); break;
        case '7': alert('이미 입사지원을 3회 하신 채용공고 이므로\n\n더 이상 입사지원이 불가합니다.\n\n동일 공고에 입사지원은 최대 3회까지 가능합니다.'); break;
        case '8': alert("본 공고는 <모의입사지원 경진대회> 참가자만 지원가능합니다.\n\n해당 학생은 <경진대회 사이트>에 접속하여 지원하시기 바랍니다.\n\n(취창업지원센터 홈페이지 참조)"); break;
        case '9': alert('입사지원방법은 상세요강을 참고해주시기 바랍니다.'); break;
    }    
}
// 레이어 닫기
var lay_Booking_Cls = function () {
    jQuery("div.layerReservation").remove();
}

// 레이어 닫기 유형 2(alert)
var lay_Booking_Cls2 = function (_str) {
    alert(_str);
    jQuery("div.layerReservation", parent).remove();
}

// 레이어 도움말 쿠키 지정
var lay_Booking_Help_Set_Ck = function () {

    var nowDate = new Date();

    nowDate.setDate(nowDate.getDate() + 3);
    document.cookie = "GI_OnPass_Quick=" + escape("yes") + "; path=/; expires=" + nowDate.toGMTString() + ";domain=jobkorea.co.kr";

    jQuery("dd.quickExplan").hide();
}

// 레이어 로그인 IP 보안
var lay_Booking_Ip_Chk_Set = function () {
    var jQueryobj = jQuery("button.btnSecurity");

    var today = new Date();
    var expire = new Date(today.getTime() + 60 * 60 * 24 * 30 * 1000);

    var IPSecCookie = "Secure_IPonOFF="

    if (jQueryobj.hasClass("setOn")) {
        jQueryobj.toggleClass("setOn setOff").text("OFF");
        jQueryobj.next().removeClass("devHide");
        IPSecCookie += escape("N");
    } else {
        jQueryobj.toggleClass("setOff setOn").text("ON");
        jQueryobj.next().addClass("devHide");
        IPSecCookie += escape("Y");
    }

    IPSecCookie += "; expires=" + expire.toGMTString() + "; path=/; domain=jobkorea.co.kr;";
    document.cookie = IPSecCookie;
}

// 퀵 온라인 입사지원 프레임 사이즈 - Ajax 호출시
var lay_Booking_Frm_Size = function () {
    var jQueryheight = 0;
    var jQueryobj = jQuery("#Booking_Frame");

    if (jQueryobj.attr("src").toLowerCase().indexOf("onpass_booking_login.asp") > -1
        || jQueryobj.attr("src").toLowerCase().indexOf("m_login_layer") > -1
        || jQueryobj.attr("src").toLowerCase().indexOf("onpass_booking_apply.asp") > -1
        ) {
        jQueryheight = jQueryobj.height();
        lay_Booking_Size_Chg(jQueryheight);
    }
}

//  퀵 온라인 입사지원 프레임 사이즈 - (onload, onunload)
var lay_Booking_Frm_Size2 = function (_height) {;
    var jQueryheight = 0;
    var jQueryobj = jQuery("#Booking_Frame");

    if (_height == undefined) {
        jQueryheight = jQueryobj.contents().find("body").height();

    } else {
        jQueryheight = _height;//jQueryobj.attr("src").toLowerCase().indexOf("onpass_quick_login.asp")  > -1 ? _height :  jQueryobj.contents().find("div.iframeQuick").height();
    }

    lay_Booking_Size_Chg(jQueryheight);
}

//	퀵 온라인 입사지원 프레임 리사이즈
var lay_Booking_Size_Chg = function (_height) {

    var jQuerydiv = jQuery("body").find("div.layerReservation");
    var jQueryobj = jQuery("#Booking_Frame");

    if(_height > 240)
        jQueryobj.css("height", _height);

    // IE 구버전 처리
    var isIE = navigator.userAgent.toLowerCase().indexOf("msie") !== -1;

    if (isIE) {
        var $width = window.innerWidth ? window.innerWidth : $(window).width();
        var $height = window.innerHeight ? window.innerHeight : $(window).height();

        var jQueryleft = jQuery(window).scrollLeft() + ($width - jQuerydiv.width()) / 2;
        var jQuerytop = jQuery(window).scrollTop() + ($height - jQuerydiv.height()) / 2;
    } else { // 모바일 사파리에서 window 사이즈 틀리게 나와서 window.top으로 수정
        var topWindow = window.top;
        var $width = topWindow.innerWidth ? topWindow.innerWidth : jQuery(topWindow).width();
        var $height = topWindow.innerHeight ? topWindow.innerHeight : jQuery(topWindow).height();

        var scrollTop = jQuery(window).scrollTop();
        var scrollLeft = jQuery(window).scrollLeft();

        if (scrollTop === 0) {
            scrollTop = jQuery(topWindow).scrollTop();
        }
        if (scrollLeft === 0) {
            scrollLeft = jQuery(topWindow).scrollLeft();
        }

        var jQueryleft = scrollLeft + ($width - jQuerydiv.width()) / 2;
        var jQuerytop = scrollTop + ($height - jQuerydiv.height()) / 2;
    }

    jQuerydiv.css({
        //"position" : "absolute",
        //"z-index" : "999999",
        "display": "block",
        "left": jQueryleft,
        "top": jQuerytop
    });
}

// 도움말 레이어 오픈
var lay_Booking_Help_Open = function () {
    jQuery("div.quickTooltip").show();
}

// 도움말 레이어 닫기
var lay_Booking_Help_Cls = function () {
    jQuery("div.quickTooltip").hide();
}

// 로그인 레이어 focus 이벤트
var lay_Booking_Login_Fcs = function (_this) {
    var jQueryobj = jQuery("p.loginInput").find("input.inpTxt");
    var jQuerythis = jQuery(_this);

    jQuerythis.addClass("on");

    if (jQuerythis.hasClass("inpTxt inpID")) {
        jQueryobj.eq(1).removeClass("on").addClass("off");
    } else {
        jQueryobj.eq(0).removeClass("on").addClass("off");
    }

    jQuerythis.one("blur", function () {
        if (jQuery.trim(jQuerythis.val()) != "") {
            jQuerythis.removeClass("off").addClass("end");
        } else {
            jQuerythis.val("");
            jQuerythis.removeClass("end").addClass("off");
        }
    });
}

// 로그인 처리
var login_Send = function () {

    if (jQuery.trim(jQuery("#M_ID").val()) == "") {
        alert("아이디를 입력하세요.");
        jQuery("#M_ID").val("").focus();
        return false;
    }

    if (jQuery.trim(jQuery("#M_PWD").val()) == "") {
        alert("비밀번호를 입력하세요.");
        jQuery("#M_PWD").val("").focus();
        return false;
    }
}

// 입사지원 체크
var lay_Booking_Apply = function () {

    if (jQuery("#JobField").length > 0) {
        if (jQuery("#JobField").val() == 0) {
            alert('지원분야를 선택하세요.');
            return;
        }
    }

    /* 법률개정으로 이력서 사진이 없어도지원 가능하도록 변경되었기 때문에 주석처리
    if (jQuery("#Photo_Stat").val() == 0) {
        if (confirm("이력서 사진이 없는 경우 입사지원 예약을 할 수 없습니다. \n이력서의 첫인상인 사진을 먼저 등록해 주세요. \n사진 등록 페이지로 이동됩니다.")) {
            window.open("/Text_User/Photo_Edit/m_photo.asp", "MPhoto", "width=590,height=950,scrollbars=no");
            return;
        }
    }
    */

    var _M_Career_Val = jQuery("#M_Career_Level").val();

    _M_Career_Val = parseInt(_M_Career_Val);
    var _Career_Type_Code = parseInt(jQuery("input[name=Career_Type_Code]").val());

    if ((_Career_Type_Code == 1 && _M_Career_Val > 0) || (_Career_Type_Code == 2 && _M_Career_Val == 0)) {
        alert("현재 선택한 이력서의 경력 미달로 지원할 수 없습니다.");
        return;
    }

    if (confirm("해당 내용으로 최종 예약 하시겠습니까?")) {
        jQuery("form").submit();
    }
}

//완료단에서 버튼 바꾸기
var lay_Booking_Btn_Chg = function () {

    $("button.imgQ").removeAttr("onclick").click(function () {
        lay_Booking_Result_Cls();
    });
}

var go_apply_mng = function () {
    window.open("/Text_User/Apply/Mng.asp", "", "");
    return;
}
