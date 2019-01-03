
// 온라인 입사지원
var lay_Apply_Open = function (gbn, gipart) {
    var stat = false;
    jQuery.ajax({
        type: "post",
        async: false,
        url: "/Recruit/OnPass_Apply?gbn=" + gbn + "&GiPart=" + gipart,
        success: function (data) {

            if (jQuery.trim(data) != "") {
                lay_Apply_Cls();

                // 레이어 위치 조절 전 hide 대신 좌측으로 넘겼다가 가져옴.
                // hide 실행시 해당 div의 height 조절 못함
            
                jQuery("body").append(data).find("div.lyOnPassApply").css("left", "-9999px");

                lay_Apply_Frm_Size();

            } else {
                stat = true;
            }
        }
    });

    return stat;
}

// 레이어 닫기
var lay_Apply_Cls = function () {
    jQuery("div.lyOnPassApply").remove();
}

// 프레임 사이즈 - Ajax 호출시
var lay_Apply_Frm_Size = function () {
    var jQueryheight = 0;
    var jQueryobj = jQuery("#onPassApply_Frame");
    
    if (jQueryobj.length) {
        if (jQueryobj.attr("src").toLowerCase().indexOf("m_login_layer") > -1) {
            jQueryheight = jQueryobj.height();
            lay_Apply_Size_Chg(jQueryheight);
        }
    }
}

// 프레임 리사이즈
var lay_Apply_Size_Chg = function (_height) {
    var jQuerydiv = jQuery("body").find("div.lyOnPassApply");
    var jQueryobj = jQuery("#onPassApply_Frame");
        
    jQueryobj.css("height", _height);

    var isIE = navigator.userAgent.toLowerCase().indexOf("msie") !== -1;

    if (isIE) {
        var $width = window.innerWidth ? window.innerWidth : $(window).width();
        var $height = window.innerHeight ? window.innerHeight : $(window).height();

        var jQueryleft = jQuery(window).scrollLeft() + ($width - jQueryobj.width()) / 2;
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

        var jQueryleft = scrollLeft + ($width - jQueryobj.width()) / 2;
        var jQuerytop = scrollTop + ($height - jQuerydiv.height()) / 2;
    }

    jQuerydiv.css({
        "position": "absolute",
        "z-index": "999999",
        "left": jQueryleft,
        "top": jQuerytop
    });
}

//신규입사지원 > 공고뷰
var go_OnPass = function (gipart, login_st, sc) {
    sc = typeof sc !== 'undefined' ? sc : 0;
    if ($.type(gipart) === "undefined") gipart = "";
    
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

    if (!login_st) {
        login_st = lay_Apply_Open(1, gipart);
    }        

    if(login_st)
    {
        //입사지원 처리    
        if (document.form.alert_text.value != "" && document.form.Limit_Chk_Stat.value == "0") {
            alert(document.form.alert_text.value.replace("\\n\\n", "\n\n").replace("\\n\\n", "\n\n"));
            return false;
        }

        if (document.form.alert_text.value != "" && document.form.Limit_Chk_Stat.value == "1") {
            if (!confirm(document.form.alert_text.value.replace("\\n\\n", "\n\n").replace("\\n\\n", "\n\n"))) {
                return false;
            }
        }

        var brw = whichBrs();
        var scroll = 0;

        wval = 550;
        hval = 690;

        switch (brw) {
            case 'Internet Explorer':
                if (screen.availHeight < 670) {
                    hval = screen.availHeight;
                }
                break;
            case 'Chrome':
                hval = 692;
                if (screen.availHeight < 670) {
                    hval = screen.availHeight - 64;
                    ifrm_height = hval - 76;
                }
                break;
            default:
        }

        
        var go_url = window.JkDomainHttps + "/Recruit/OnPass?gNo=" + window.gno + "&Pass_Match=1&pass_chk=1&JobField=" + escape(gipart) + "&sc=" + sc + "&Oem_Code=" + Site_Oem_Code;;

        var PassWinView = window.open(go_url, 'PassWinView', 'width=' + wval + ',height=' + hval + ',toolbar=0,scrollbars=0,resizable=no,left=235,top=0');

        PassWinView.focus();
    }
    return false;

}
