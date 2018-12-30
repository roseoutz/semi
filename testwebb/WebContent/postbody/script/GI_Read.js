var IndamTalkDiv_H;
var IndamTalkTb_H;

(function ($) {
    $("document").ready(function () {
        //진행중채용공고 회사명
        $("#devIngMemName").html(cname);

        //인담톡
        IndamTalkDiv_H = $("#devIndamTalkDiv").height();
        IndamTalkTb_H = $("#devIndamTalkTB").outerHeight();

        if (IndamTalkDiv_H >= IndamTalkTb_H) {
            $(".indamBtn").hide(); //더보기 버튼 삭제
        }

        if (IndamTalkTb_H < 375) {
            $("#devIndamTalkDiv").height(IndamTalkTb_H);
        }

        if ($("#INDAMTalk").length > 0) {
            //인담톡+까톡+인사담당자에게한마디 통합
            GIReadIndamTalkList("/Recruit/GI_Read_CommonIndamtalk_List?Mem_ID=" + cid + "&Gno=" + gno + "&Mem_Type_Code=" + memtype);
        }

        // 공유하기
        $(".lgiBtnSns_2 button, #devSns p > button").click(function () {
            $('#devSns').toggle();
        });

        // 문자보내기
        $("#lb_mobile_1").focus(function () {
            $("#lb_mobile_1").removeClass("tx");
        });

        $("#lb_mobile_1").blur(function () {
            if ($("#lb_mobile_1").val() == "") {
                $("#lb_mobile_1").addClass("tx");
            }
        });

        // 공유하기
        $('.lgiGiReadBtn .btnShare').click(function () {
            $(this).next().toggle();
        });
        $('.lgiGiReadBtn .btnLyClose').click(function () {
            $(this).parents('.lyShare').hide();
        });

        // Layer Case 1
        $('.lyTpWrap').bind('mouseenter focusin', function () {
            $(this).removeClass('hide');
        }).bind('mouseleave focusout', function () {
            $(this).addClass('hide');
        }).find('.btnLyClose').click(function () {
            $(this).closest('.lyTpWrap').find('.btnLyAdd').focus();
            $(this).closest('.lyTpWrap').addClass('hide');
        });

        $("#devBtnContact").click(function () {            
            var $ContactBox = $(this).next("div");
            var $Contact = $ContactBox.find("ul");

            if (Mem_Chk == 0) {
                if (confirm("담당자 연락처는 로그인 후 확인 가능합니다.\n\n지금 로그인 하시겠습니까?")) {
                    top.location.href = "/Login/Login_Tot.asp?rDBName=GG&re_url=" + escape(re_url);
                }
            } else {
                $ContactBox.show();
            }
        });

        $('.btnLyClose').click(function () {
            $(this).parents('.lyShare').hide();
        });

        // 이메일 클릭
        $(".devChargeEmail").click(function () {
            GI_Effect_Log(4);
        });

        remainTimer();        

        $('#Mobile').on("focusin", function (event) {            
            $(".devAgreeWrap").show();
        });

        $("#devSmsSend").find("p.close").on("click", function (e) {
            $(".devAgreeWrap").hide();
        });

        $("#devSmsSend").find(".devAgreeDiv").on("click", function (e) {            
            var $ele = $(".devAgreeInfo");
                
            if ($ele.is(":hidden")) {
                $(this).html("<span>내용닫기</span>");                
                $ele.show();
            } else {
                $(this).html("<span>내용보기</span>");                    
                $ele.hide();
            }                            
        });       
    });

})(jQuery);

//사이즈조정 ------------------------------------------------------------------------
//로고 리사이즈 (img onload event에서 call)
function go_logo_size(ele, width, height) {
    var myImage = ele;
    var myWidth, myHeight;
    var newWidth, newHeight;

    myWidth = myImage.width;
    myHeight = myImage.height;

    if (myWidth > myHeight) {
        newWidth = (myWidth > width) ? width : myWidth;
        newHeight = parseInt((myHeight * newWidth) / myWidth)
        if (newHeight > height) {
            newHeight = height;
            newWidth = parseInt((myWidth * newHeight) / myHeight)
        }
    } else {
        newHeight = (myHeight > height) ? height : myHeight;
        newWidth = parseInt((myWidth * newHeight) / myHeight)
        if (newWidth > width) {
            newWidth = width;
            newHeight = parseInt((myHeight * newWidth) / myWidth)
        }
    }

    myImage.width = newWidth;
    myImage.height = newHeight;
}

//상세요강 Iframe Resize
var autoResize = function (obj) {
    var iframeHeight = obj.contentWindow.document.body.scrollHeight;
    obj.height = (iframeHeight + 20) + 'px';
}

var ifrmNavi = function (arg) {
    if (navigator.userAgent.indexOf('Mac') != -1) {
        setTimeout(function () { autoResize(arg); }, 3000);

    } else {
        if (navigator.appName == "Opera") {
            setTimeout(function () { autoResize(arg); }, 3000);
        } else {
            autoResize(arg);
        }
    }
}

//팝업레이어 아이프레임 크기 조절하는 스크립트
var F_Resize = function (tmp) {
    var name;
    name = eval(tmp + '.document.body');
    document.getElementById(tmp).height = name.scrollHeight;
}

// 공고/기업 관련 링크 --------------------------------------------------------------------
var go_GiInfoRead = function (Mem_ID, Mem_Type_Code) {	//기업정보보기
    top.location.href = "/Recruit/Co_read/" + Mem_Type_Code + "/" + Mem_ID + "?Oem_Code=" + Site_Oem_Code;
}

var go_Area_List = function (AreaNo, AllStat) {
    top.location.href = window.domain + "/List_GI/GI_Area_List.asp?AreaNo=" + AreaNo + (AllStat == 1 ? "&AllStat=1" : "");
}

var go_Area_List_SF = function (AreaNo) {
    top.location.href = window.hrpDomain + "/List_HH/HH_Area_List.asp?Adiv=" + AreaNo;
}

var go_BDInfo = function (BDCode) {
    top.location.href = "/List_GI/GI_Building_Info.asp?BDCode=" + BDCode;
}

var go_Part_List = function (Part_No, Mem_Type) {
    if (Mem_Type == "C") {
        top.location.href = window.domain + "/List_GI/GI_Part_List.asp?Part_No=" + Part_No;
    } else if (Mem_Type == "H") {
        top.location.href = window.domain + "/List_HR/HR_Part_List.asp?HR_Part_No=" + Part_No;
    } else if (Mem_Type == "S") {
        top.location.href = window.hrpDomain + "/List_HH/HH_Part_List.asp?HH_Part_NO=" + Part_No;
    }
    return;
}
//담당자정보 홈페이지
var goHomePage = function (home) {
    window.open("/List_GI/Co_HomePage_Open.asp?home=" + home, 'win_home');
}

var go_HomePage = function (home) {
    GI_Effect_Log(3);
    window.open("/List_GI/Co_HomePage_Open.asp?home=" + escape(home), 'win_home');
}

var go_HomePageTrace = function (home, gino) {
    GI_Effect_Log(3);
    window.open("/List_GI/Co_HomePage_Open.asp?home=" + escape(home) + "&GI_No=" + gino + "&AppHomeUrlStat=1", 'win_home');
}

var go_HomePageSF = function (obj) {
    GI_Effect_Log(3);
    window.open($(obj).attr("href"), 'win_home');
}

var ImageView = function (cid, img_no) {
    var viewpage = "/Recruit/Co_PhotoView_Ifrm?C_ID=" + cid + "&img_no=" + img_no + "&Re_Host=" + window.jkDomain;
    document.getElementById("GIphotoIfrm").src = viewpage;
    document.getElementById("GIphoto_process").style.display = "block";
}

//빌딩 이미지 보기
var ImageViewBD = function (bdcode) {
    var viewpage = "http://file2.jobkorea.co.kr/Company/Guin_BD/Image_Thumb_View.asp?BDCode=" + bdcode;
    window.open(viewpage, 'ImageView', 'toolbar=no,location=yes,directories=no,status=no,scrollbars=no,menubar=no,width=520,height=740');
}

//공고/기업관련 부가기능 --------------------------------------------------------------------------------
$.fn.digits = function () { //숫자 3자리마다 콤마 노출
    return this.each(function () {
        $(this).text($(this).text().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
    })
}

var do_RcmdCnt = function () { // 추천수
    $.ajax({
        type: "GET",
        url: "/Include/List_GI/Read_GI_RcmdCnt.asp?GI_No=" + gino,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        cache: false,
        success: function (result) {
            if (result.Req_Stat == 1) {
                $("#devDivRcmd strong").text(result.Rcmd_Cnt);
                $("#devDivRcmd").show();
            } else {
                $("#devDivRcmd").show();
                alert("이미 추천하셨습니다.");
            }
        }
    });
}

var do_ItvReqCnt = function () { // 인터뷰요청수
    $.ajax({
        type: "GET",
        url: "/Recruit/GI_Read_ItvReqCnt?Gno=" + gno,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        cache: false,
        success: function (result) {
            if (result.Req_Stat == 1) {
                $("#ItvReqCnt").text(result.Itv_Req_Cnt).digits();
                if ($("#indamTalk_count1").length) {
                    $("#indamTalk_count1").show().next().addClass("company_1");
                } else {
                    $("#indamTalk_count2").show();
                }
            } else {
                alert("이미 인터뷰 요청하셨습니다.");
            }
        }
    });
}

var show_idamtalk = function (ele) { //인담톡 더보기
    $btnCss = $(ele).parent("span");
    $btnChild = $(ele).children("img");
    if ($btnCss.hasClass("indamMore")) {
        $("#devIndamTalkDiv").height(IndamTalkTb_H);
        $btnCss.removeClass("indamMore").addClass("indamClose");
        $btnChild.attr("src", $btnChild.attr("src").replace("btn_more", "btn_close"));
    } else {

        $("#devIndamTalkDiv").height(IndamTalkDiv_H);
        $btnCss.removeClass("indamClose").addClass("indamMore");
        $btnChild.attr("src", $btnChild.attr("src").replace("btn_close", "btn_more"));
    }
}

// 이력서 등록하기
var fnGoResumeWrite = function (reUrl) {
    if (confirm("'이력서 등록'은 개인회원 로그인 후 사용 가능합니다.\n\n지금 로그인하시겠습니까?")) {
        document.location.href = "/Login/Logout.asp?re_url=" + reUrl;
    }
}

//-- NSM Conversion Check
function NsmConversionClick(Nsm_Code) {
    var nsmX = new Image();
    //alert(Nsm_Code);
    nsmX.src = "http://ntracker.nsm-corp.com/c/rcv.php?code=" + Nsm_Code;
}

// 크리테오, 타게팅게이츠
var Criteo = function (Gi_No) {
    jQuery.ajax({
        type: "POST",
        url: "/Include/Criteo/Criteo_Scrap_UTF.asp?Gi_No=" + Gi_No,
        dataType: "html",
        success: function (html) {
            var obj = $(html);
            $('#widerplanet_tagging').html(obj.html());
            obj.filter('script').each(function () {
                $.globalEval(this.text || this.textContent || this.innerHTML || '');
            });
        }
    });
}

var isIE = function(version, comparison) {
    var $div = $('<div style="display:none;"/>').appendTo($('body'));
    $div.html('<!--[if ' + (comparison || '') + ' IE ' + (version || '') + ']><a>&nbsp;</a><![endif]-->');
    var ieTest = $div.find('a').length;
    $div.remove();
    return ieTest;
}

// 스크랩(1개)
var go_scrap = function (GI_No, Gno, Mem_ID, Mem_type_Code) {
    var ScrapStat		= "0" // 0:제거, 1: 추가
    var $scrap			= $(".devScrap" + Gno);
    var $scrap1			= $(".devScrap1" + Gno);
    var $scrapCnt		= $(".devScrapCnt");
	var $scrapTop100	= $(".devScrapTop100" + Gno);

    switch (Mem_Chk) {
        case "0":
            if (confirm("'스크랩'은 개인회원 로그인 후 사용가능 합니다.\n\n지금 로그인 하시겠습니까?")) {
                top.location.href = "/Login/Login_Tot.asp?rDBName=GG&re_url=" + escape(re_url);
            }
            break;

        case "1":
                //채용공고 스크랩 수 체크 1일 : 100건 총 600건 이하로 제한                
            if ($scrap.hasClass("icScrap_1_on") || $scrap1.hasClass("girBtnScrOn") || $scrapTop100.hasClass("on")) { //스크랩 제거
                ScrapStat = "0";	
                $scrap.removeClass("icScrap_1_on").addClass("icScrap_1");
                $scrap1.removeClass("girBtnScrOn");
				$scrapTop100.removeClass("on");

                if (isIE(8)) {
                    $scrap1.blur();
                }

                if ($scrapCnt.length > 0 && !isNaN($scrapCnt.html())) {
                    $scrapCnt.html(parseInt($scrapCnt.html(), 10) - 1);
                }

                jQuery.ajax({
                    type: "GET",
                    url: "/Recruit/GI_Scrap_Ajax",
                    data: "GI_No=" + GI_No + "&Gno=" + Gno + "&rScrapStat=0&Mem_ID=" + Mem_ID + "&Mem_Type_Code=" + Mem_type_Code,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    cache: false,
                    success: function (result) {
                        NsmConversionClick('170'); //Nsm 스크립트 추가
                        if (result == "1") {
                            //alert("스크랩 되었습니다.");
                            Criteo(GI_No); //크리테오, 타게팅게이츠

                        }
                    }
                });

            } else { // 스크랩 추가                    
                jQuery.ajax({
                    type: "GET",
                    url: "/Recruit/GI_Scrap_Limit_Ajax",
                    data: "rScrapStat=1&Mem_ID=" + Mem_ID,
                    cache: false,
                    success: function (result) {
                    if (result == "2") {
                        alert("채용공고 스크랩은 1일 1,000건까지 가능합니다.");
                    }
                    else if (result == "3") {
                        alert("채용공고 스크랩은 최대 6,000건까지 가능합니다.");
                    }
                    else {                            
                        ScrapStat = "1";                            
                        $scrap.removeClass("icScrap_1").addClass("icScrap_1_on");
                        $scrap1.addClass("girBtnScrOn");
						$scrapTop100.removeClass("on").addClass("on");

                        if (isIE(8)) {
                            $scrap1.blur();
                        }
                        if ($scrapCnt.length > 0 && !isNaN($scrapCnt.html())) {
                            $scrapCnt.html(parseInt($scrapCnt.html(), 10) + 1);
                        }

                        jQuery.ajax({
                            type: "GET",
                            url: "/Recruit/GI_Scrap_Ajax",
                            data: "GI_No=" + GI_No + "&Gno=" + Gno + "&rScrapStat=" + ScrapStat + "&Mem_ID=" + Mem_ID + "&Mem_Type_Code=" + Mem_type_Code,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            cache: false,
                            success: function (result) {
                                NsmConversionClick('170'); //Nsm 스크립트 추가
                                if (result == "1") {
                                    //alert("스크랩 되었습니다.");

                                    Criteo(GI_No); //크리테오, 타게팅게이츠
                                }
                            }
                        });
                    }
                }
            });
        }
        break;

        default:
        if (confirm("'스크랩'은 개인회원 로그인 후 사용가능 합니다.\n\n지금 로그인 하시겠습니까?")) {
            top.location.href = "/Login/Login_Tot.asp?rDBName=GG&re_url=" + escape(re_url);
        }
        break;
    }
}


// 관심기업(1개)
var go_favor = function (Mem_ID) {
    var $favor1			= $(".devFavor" + Mem_ID);
    var $favor2			= $(".devFavor2" + Mem_ID);
    var $favor3			= $(".devFavor3" + Mem_ID);
    var $favor4			= $(".devFavor4" + Mem_ID);
    var $favor5			= $(".devFavor5" + Mem_ID);
	var $favorTop100	= $(".devFavorTop100" + Mem_ID);

    var FavorStat = "0";
    switch (Mem_Chk) {
        case "0":            
            top.location.href = "/Login/Login_Tot.asp?rDBName=GG&re_url=" + escape(re_url);            
            break;
        case "1":            
            if ($favor1.hasClass("lgiBtnFav_2_on") || $favor2.hasClass("lgiBtnFav_3_on") || $favor3.hasClass("icReg_1_on") || $favor4.hasClass("icReg_2_on") || $favor5.hasClass("girBtnFavOn") 
				|| $favorTop100.hasClass("tplBtnFavOn")
			) 
			{
                FavorStat = "0";                
                $favor1.removeClass("lgiBtnFav_2_on").addClass("lgiBtnFav_2");
                $favor2.removeClass("lgiBtnFav_3_on").addClass("lgiBtnFav_3");
                $favor3.removeClass("icReg_1_on").addClass("icReg_1");
                $favor4.removeClass("icReg_2_on").addClass("icReg_2");
                $favor5.removeClass("girBtnFavOn");
				$favorTop100.removeClass("tplBtnFavOn").addClass("tplBtnFavOff");

                if (isIE(8)) {
                    $favor5.blur();
                }
            } else {
                FavorStat = "1";
                $favor1.removeClass("lgiBtnFav_2").addClass("lgiBtnFav_2_on");
                $favor2.removeClass("lgiBtnFav_3").addClass("lgiBtnFav_3_on");
                $favor3.removeClass("icReg_1").addClass("icReg_1_on");
                $favor4.removeClass("icReg_2").addClass("icReg_2_on");
                $favor5.addClass("girBtnFavOn");
				$favorTop100.removeClass("tplBtnFavOff").addClass("tplBtnFavOn");

                if (isIE(8)) {
                    $favor5.blur();
                }
            }

            
            $.ajax({
                type: "GET",
                url: "/Recruit/FavorCo_ID",
                data: "rCID=" + Mem_ID + "&rFavorStat=" + FavorStat,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                cache: false,
                success: function (result) {
                    if (cid == Mem_ID) {
                        $(".devFavorCnt").text(result.Favor_Cnt); //관심기업 카운트 노출

                        if (result.Favor_Result == "4") {
                            alert("관심기업 등록 완료");
                        }

                        return;                        
                    }
                }
            });
            break;
        default:
            if (confirm("'관심기업등록'은 개인회원 로그인 후 사용가능 합니다.\n\n지금 로그인 하시겠습니까?")) {
                top.location.href = "/Login/Login_Tot.asp?rDBName=GG&re_url=" + escape(re_url);
            }
            break;
    }
}

; (function ($) {
    $(document).ready(function () {
            // 채용공고 SMS 전달
        $('.sendSMS').click(function (event) {
                event.preventDefault();

                $this = $(this);
                var posY = $this.offset().top + $this.outerHeight();
                var posX = $this.offset().left + $this.outerWidth() - 380;

                $('#MsgIfrm').attr('src', '/Recruit/GI_SMS/' + gno + "?GI_No=" + gino + "&Oem_Code=" + Site_Oem_Code + "&cname=" + escape(cname)).css({
                    'width': '380', 'height': '200'
            });
            $('#devMsg').toggle().css({
                'top': posY, 'left': posX
            });
        });

            // 채용공고 이메일 전달
        $('.sendEmail').click(function (event) {
                event.preventDefault();

                $this = $(this);
                var posY = $this.offset().top + $this.outerHeight();
                var posX = $this.offset().left + $this.outerWidth() - 437;

                $('#MsgIfrm').attr('src', '/Recruit/GI_Email/' + gno + "?GI_No=" + gino).css({
                    'width': '437', 'height': '375'
                });
                $('#devMsg').toggle().css({
                    'top': posY, 'left': posX
                });
        });

        // Gallery
        $('.galleryList > li').bind({
            focusin: function () {
                $(this).find('.ly').show();
            },
            mouseenter: function () {
                $(this).find('.ly').show();
            },
            focusout: function () {
                $(this).find('.ly').hide();
            },
            mouseleave: function () {
                $(this).find('.ly').hide();
            }
        });
        $('.galleryZoom').click(function () {
            $('.galleryZoomWrap').show();
        });
        $('.galleryZoomWrap .btnLyClose').click(function () {
            $(this).parents('.galleryZoomWrap').hide();
        });
    });
}(jQuery));

var go_delivery = function () {	// 채용공고 전달
    document.getElementById("MsgIfrm").src = "/Recruit/GI_Email/" + gno + "?GI_No=" + gino;
    document.getElementById("MsgIfrm").style.width = 437 + "px";
    document.getElementById("MsgIfrm").style.height = 400 + "px";
    document.getElementById("devMsg").style.display = "block";
}

var go_print = function (giDiv) {	// 채용공고 프린트
    var a = "/Recruit/GI_Preview/" + gno + "?Oem_Code=" + Site_Oem_Code;
    if (giDiv != "") a += "&GI_Div=" + giDiv;

    OpenWin = window.open(a, 'printwin', 'toolbar=no,location=yes,directories=no,status=no,scrollbars=yes,menubar=no,width=735,height=650');
}

//탭이동
var Move_Tap = function (ele) {
    var divId = ele.href.split("#")[1];
    var offset_top = $("#" + divId).offset().top;
    $('html,body').scrollTop(offset_top - 10);
}

var go_clipboard_copy = function () {	// URL 복사
    if (navigator.userAgent.indexOf("MSIE") > 0) {
        var data = window.clipboardData.getData("Text");
        if (data == '') {
            alert('주소복사를 하시려면 [클립보드 엑세스 허용]을 선택하셔야 합니다. \n\n새로고침(F5)을 하신후 [주소복사]를 다시 선택하시고 \n\n[클립보드 엑세스 허용] 버튼을 선택해 주세요.');
            return false;
        } else {
            window.clipboardData.setData('Text', 'http://' + self.location.host + '/Recruit/GI_Read/' + gno + "?Oem_Code=" + Site_Oem_Code);

            document.getElementById("MsgIfrm").style.width = 393 + "px";
            document.getElementById("MsgIfrm").style.height = 210 + "px";

            var PositionH = ($(window).scrollTop() + ($(window).height() - $("#MsgIfrm").height()) / 2)
            document.getElementById("MsgIfrm").src = "/Recruit/GI_Read_UrlCopy";
            document.getElementById("devMsg").style.top = PositionH + "px";
            document.getElementById("devMsg").style.display = "block";
        }
    } else if (window.netscape) {

        if (navigator.userAgent.indexOf('Firefox') > 0) {
            try {
                netscape.security.PrivilegeManager.enablePrivilege('UniversalXPConnect');
                var clip = Components.classes['@mozilla.org/widget/clipboard;1'].createInstance(Components.interfaces.nsIClipboard);
                if (!clip) return;
                var trans = Components.classes['@mozilla.org/widget/transferable;1'].createInstance(Components.interfaces.nsITransferable);
                if (!trans) return;
                trans.addDataFlavor('text/unicode');
                var str = new Object();
                var len = new Object();
                var str = Components.classes["@mozilla.org/supports-string;1"].createInstance(Components.interfaces.nsISupportsString);
                var copytext = 'http://' + self.location.host + '/Recruit/GI_Read/' + gno + "?Oem_Code=" + Site_Oem_Code;
                str.data = copytext;
                trans.setTransferData("text/unicode", str, copytext.length * 2);
                var clipid = Components.interfaces.nsIClipboard;
                if (!clip) return false;
                clip.setData(trans, null, clipid.kGlobalClipboard);

                document.getElementById("MsgIfrm").src = "/List_GI/GIB_Read_UrlCopy.asp";
                document.getElementById("MsgIfrm").style.width = 393 + "px";
                document.getElementById("MsgIfrm").style.height = 210 + "px";

                var PositionH = ($(window).scrollTop() + ($(window).height() - $("#MsgIfrm").height()) / 2)
                document.getElementById("devMsg").style.top = PositionH + "px";
                document.getElementById("devMsg").style.display = "block";
            } catch (e) {

                document.getElementById("MsgIfrm").src = "/Recruit/GI_Read_UrlCopy?Gno=" + gno + "&Oem_Code=" + Site_Oem_Code;
                document.getElementById("MsgIfrm").style.width = 500 + "px";
                document.getElementById("MsgIfrm").style.height = 210 + "px";

                var PositionH = ($(window).scrollTop() + ($(window).height() - $("#MsgIfrm").height()) / 2)
                document.getElementById("devMsg").style.left = "30%";
                document.getElementById("devMsg").style.top = PositionH + "px";
                document.getElementById("devMsg").style.display = "block";
            }
        }
    } else {

        var position = jQuery(window).scrollTop() + 200;
        document.getElementById("MsgIfrm").style.width = 500 + "px";
        document.getElementById("MsgIfrm").style.height = 210 + "px";

        var PositionH = ($(window).scrollTop() + ($(window).height() - $("#MsgIfrm").height()) / 2)
        document.getElementById("MsgIfrm").src = "/Recruit/GI_Read_UrlCopy?Gno=" + gno + "&Oem_Code=" + Site_Oem_Code;
        document.getElementById("devMsg").style.left = "30%";
        document.getElementById("devMsg").style.top = PositionH + "px";
        document.getElementById("devMsg").style.display = "block";
    }
}

    var Go_QR_Layer = function (no1, no2, no3) {	//QR코드 레이어 노출
        var dev_1 = document.getElementById('devQR');
        var dev_2 = document.getElementById('devQR_Ifrm');
        var a = "?Create_Tag=" + no1 + "&Div_Chk=" + no2 + "&GI_No=" + no3;

        dev_2.src = window.jkDomain + "/List_GI/QRcode_Popup_1.asp" + a;

        dev_1.style.display = 'block';
    }

    // 레이어 열기/닫기  -----------------------------------------------------------------------------------
    var go_div_show = function (arg) {
        $("#" + arg).show();
    }

    var go_div_hide = function (arg) {
        $("#" + arg).hide();
    }

    //입사지원 / 지원통계 ---------------------------------------------------------------------------------
    var ChartView = function (mid, gino) {
        if (mid == "") {
            var url = Site_Code == "DJ" ? "/Service_Jk/GG_Chart_Option.asp" : "/Service_JK/GG_Chart_Sample.asp";
            url += "?GI_No=" + gino;

            window.open(window.domain + url, "", "");
        }
        else {
            window.open(wind.domain + "/Text_User/Apply_Chart/Basic_Chart.asp?GI_No=" + gino, "", "");
        }
    }

var view_applicant_stat = function (s) {
    switch (s) {
        case 1: document.getElementById("ViewApplicantStat").style.display = "block"; break;
        case 2: document.getElementById("ViewApplicantStat").style.display = "none"; break;
        case 3: window.open(window.domain + "/Text_User/Apply_Chart/Basic_Chart.asp?GI_NO=" + gino, 'aviewstat', '');
        default: break;
    }
}

var go_alert_msg = function (arg) {
    alert(arg);
    return;
}

var go_apply = function (gbn, gipart, login_st, sc) {
    sc = typeof sc !== 'undefined' ? sc : 0;
    if($.type(gipart) === "undefined") gipart = "";

    if (!login_st) {
        login_st = lay_Apply_Open(gbn, gipart);
    }

    if (login_st) {

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

        hval = 690;
        wval = 770;

        ifrm_height = hval - 76;

        switch (brw) {
            case 'Internet Explorer':
                if (screen.availHeight < 670) {
                    hval = screen.availHeight;
                    ifrm_height = hval - 160;
                }
                break;
            case 'Safari':
                hval = 690; break;
            case 'Firefox':
                hval = 690; break;
            case 'Chrome':
                hval = 692;
                if (screen.availHeight < 670) {
                    hval = screen.availHeight - 64;
                    ifrm_height = hval - 76;
                }
                break;
            case 'Opera':
                hval = 690; break;
            default:

        }

        if (gbn == 'online') {			//온라인 입사지원
            var go_url = "/List_GI/GIB_Read_Frame.asp?GI_No=" + gino + "&Pass_Match=1&pass_chk=1&GiPart=" + escape(gipart) + "&ifrm_height=" + ifrm_height + "&sc=" + sc;
        } else {														//이메일 입사지원
            var go_url = "/List_GI/GIB_Read_Email_Frame.asp?GI_No=" + gino + "&Pass_Match=1&pass_chk=1&ifrm_height=" + ifrm_height + "&sc=" + sc;
        } 

        go_url += "&Oem_Code=" + Site_Oem_Code;

        window.open(go_url, 'PassWinView', 'width=' + wval + ',height=' + hval + ',toolbar=0,scrollbars=0,resizable=no,left=235,top=0');
    }

    return false;

}

var whichBrs = function () {
    var agt = navigator.userAgent.toLowerCase();

    if (agt.indexOf("msie") != -1) return 'Internet Explorer';
    if (agt.indexOf("opera") != -1) return 'Opera';
    if (agt.indexOf("chrome") != -1) return 'Chrome';
    if (agt.indexOf("netscape") != -1) return 'Netscape';
    if (agt.indexOf("safari") != -1) return 'Safari';
    if (agt.indexOf("mozilla/5.0") != -1) return 'Firefox';
}

// 포트폴리오
var go_prtfl = function () {
    if (mid == "") {
        if (confirm("포트폴리오 등록은 개인회원 로그인 후 사용가능 합니다.\n지금 로그인 하시겠습니까?")) {
            location.href = "/Login/Login_Tot.asp?rDBName=GG&re_url=" + escape("/Text_User/Resume_File.asp");
        }
    } else {
    location.href = "/Text_User/Resume_File.asp";
    }
}

// 인성역량검사
var go_jat = function () {
    var url = Site_Code == "HP" ? window.jkDomain : window.domain;
    url += "/service/user/jattest";

    if (mid == "") {
        if (confirm("인성역량 검사는 개인회원 로그인 후 사용가능 합니다.\n지금 로그인 하시겠습니까?")) {
            location.href = "/Login/Login_Tot.asp?rDBName=GG&re_url=" + escape(url);
        }
    } else {
        window.open(url, 'jat');
    }
}

    function GI_Click_Cnt(Page_Code, Ctgr_Code) { //클릭수
        jQuery.ajax({
            type: "GET",
            url: "/Recruit/GI_ClickIns",
            data: "Page_Code=" + Page_Code + "&Ctgr_Code=" + Ctgr_Code,
            success: function (data) {
            }
        });
    }

    //SMS 발송처리
    function SendSms() {

        var input_str = $("#Mobile").val();        
        var result = true;
        var char_cnt = 0;
        var $agreeWrap = $(".devAgreeWrap");

        if ((input_str == "") || (input_str == "휴대폰 번호를 입력하세요")) {
            alert("휴대폰 번호를 입력해주세요.");
            $("#Mobile").focus();
            return false;
        }

        for (var i = 0; i < input_str.length; i++) {
            if ((input_str.charAt(i) >= '0' && input_str.charAt(i) <= '9') || (input_str.charAt(i) == '-')) {
                char_cnt++;
            }
            else {
                alert("휴대폰 번호를 입력해주세요.");
                $("#Mobile").focus();
                    return false;
                    break;
            }
        }

        var $agree = $("#lb_agree");
        if (!$("#lb_agree").prop("checked")) {
            alert("개인정보이용에 동의해 주세요.");
            $agreeWrap.show();
            $agree.focus();
            return false;
        }

        jQuery.ajax({
            type: "GET",
            url: "/Recruit/SendSMS",
            data: "mobile=" + input_str + "&GI_No=" + gino + "&SVC_TITLE=" + escape($("#SVC_TITLE").val()) + "&SVC_URL=" + $("#SVC_URL").val() + "&Agree_Code=18",
            success: function (data) {
                if (data == 0) {
                alert("다운로드 URL을 전송하였습니다.");
                }
                else {
                    alert("1일 10번만 전송이 가능합니다.");
                }
                //$agreeWrap.hide();
                //$agree.prop("checked","");
            }
        });
        
        return false;
    }

    // 파견.서치펌 - 온라인
    function onlinePass() {        
        var form = document.form;
        if (mid == "") {
            if (confirm("'온라인 입사지원'은 로그인 후 지원이 가능합니다.\n\n개인회원으로 로그인 후 온라인 입사지원을 \n\n클릭하여 지원해주시기 바랍니다.")) {
                location.href = window.domain + "/Login/Login_Tot.asp?rDBName=GG&re_url=" + escape(window.jkDomain + re_url);
            }
        } else {
            var go_url = "";
            if (form.alert_text.value == "") {
                if (memtype == "H") {
                go_url = window.jkDomain + "/List_Head/HH_OnPass.asp?h_gi_no=" + gino;

                window.open(go_url, 'onlinepass', 'width=620,height=500, toolbar=0,scrollbars=1,resizable=no');
            } else {
                go_url = window.hrpDomain + "/List_HH/HH_OnPass.asp?HGI_NO=" + gino;
                    location.href = go_url;
            }
            } else {
                alert(form.alert_text.value);
            }
        }
    }

    // 파견.서치펌 - 이메일
    function mailpass(gimail) {
        if (mid == "") {
            if (confirm("'e-메일 입사지원'은 로그인 후 지원이 가능합니다.\n\n개인회원으로 로그인 후 e-메일 입사지원을 \n\n클릭하여 지원해주시기 바랍니다.")) {
                location.href = window.domain + "/Login/Login_Tot.asp?rDBName=GG&re_url=" + escape(window.jkDomain + re_url);
            }
        } else {
            if (form.alert_text.value == "") {
                var go_url = memtype == "H" ? window.jkDomain + "/List_Head/HH_Mail_Pass.asp?h_gi_no=" + gino + "&gi_mail=" + gimail + "&m_id=" + mid
                    : window.hrpDomain + "/List_HH/HH_Mail_Pass.asp?h_gi_no=" + gino + "&gi_mail=" + gimail;

                var winOpen;
                if (memtype === "H") {
                    winOpen = window.open(go_url, 'onlinepass', 'width=620,height=500, toolbar=0,scrollbars=1,resizable=no');
                } else {
                    winOpen = window.open(go_url, 'onlinepass', 'width=420,height=420, toolbar=0,scrollbars=1,resizable=no');
                }

                winOpen.focus();

            } else {
                alert(form.alert_text.value);
            }
        }
    }

// 채용효과 보고서
var GI_Effect_Log = function (Cnt_DIV) {
    // 홈페이지 클릭의 경우 중간페이지로 이동(해당 페이지에서 로그 저장)
    if (Cnt_DIV === 3) return;
    jQuery.ajax({
        type: "GET",
            url: "/Recruit/GI_EffectLog",
            data: "Gno=" + gno + "&Cnt_DIV=" + Cnt_DIV,
            success: function (data) {
            }
    });
}


// 서치펌 스크랩
    function Scrap(mid, cid, s_id, hgi_div) {

        if ((mid == "") && (cid == "")) {

            if (confirm("'스크랩'은 로그인 후 사용가능 합니다.\n지금 로그인 하시겠습니까?")) {
                var re_url1 = window.jkDomain + "/Recruit/GI_Read/" + gno + "?Hgi_Div=1&Oem_Code=S98";
                var re_url = escape(re_url1)
                location.href = window.hrpDomain + "/Login/Login_Gi_GG.asp?re_url=" + re_url
            }
        } else {
            var go_url = "/Recruit/SF_Scrap?S_ID=" + s_id;

            document.getElementById("Scrap_Ifrm").src = go_url;
            document.getElementById("Scrap_Div").style.display = "block";


        //window.open(go_url, 'scrap', 'width=300,height=200,toolbar=0,scrollbars=yes,resizable=no');
        }
    }

var giReadScrollTop = function () {
    $('html, body').animate({ scrollTop: 0 }, 0);
}

var remainSetTimeOut = function () {
    window.reaminTimeOut = window.setTimeout(
            function () {
                remainTimer();
            }, 1000);
    }

    var remainTimer = function () {

    var $obj = $(".devRemainCount");

    if ($obj.length === 0 || objTs_Second < 0) {
        window.clearTimeout(window.remainSetTimeOut);
    return;
    }

    if (objTs_Second < 60) {
        $obj.first().text("1분 내 마감됩니다!");
        $obj.last().text(function () {
            return $(this).parents("p").hasClass("day2") ? "1분 내 마감됩니다!" : "1분 내 마감!";
        });


        window.clearTimeout(window.remainSetTimeOut);
        return;
    }

    var remainDay = Math.floor(objTs_Second / (24 * 3600));
    var remainHour = Math.floor((objTs_Second / 3600) - (remainDay * 24));
    remainHour = remainHour < 10 ? "0" + remainHour : remainHour;
    var remainMin = Math.floor((objTs_Second / 60) - (remainDay * 24 * 60) - (remainHour * 60));
    remainMin = remainMin < 10 ? "0" + remainMin : remainMin;
    var remainSec = Math.floor(objTs_Second - (remainDay * 24 * 3600) - (remainHour * 3600) - (remainMin * 60));
    remainSec = remainSec < 10 ? "0" + remainSec : remainSec;

    var objVal = "";

    if (remainDay > 0) {
        objVal += ("<span class=\"tahoma\">" + remainDay + "</span>일 ");
    }

    objVal += ("<span class=\"tahoma\">" + remainHour + ":" + remainMin + ":" + remainSec + "</span>");
    $obj.html(objVal);
    objTs_Second--;

    window.clearTimeout(window.remainSetTimeOut);
    remainSetTimeOut();
}

    // 인담톡+까톡+인사담당자에게한마디 통합 > 리스트
var GIReadIndamTalkList = function (url) {
    jQuery.ajax({
            type: "get",
            url: url,
            data: "",
            contentType: "application/json; charset=utf-8",
            dataType: "html",
            cache: false,
            success: function (result) {
                var $result = $(result);
                $("#INDAMTalk").append($("#div_indamAnswerLayer").hide());
                $("em.devIndamTalkComCnt").text("(" + $result.data("cnt") + ")");
                $("#INDAMTalkList").empty().append($result);
            }
        });
    }

// 인담톡+까톡+인사담당자에게한마디 통합 > 리스트
var GIReadIndamTalk = function (url) {
    jQuery.ajax({
        type: "get",
        url: url,
        data: "",
        contentType: "application/json; charset=utf-8",
        dataType: "html",
        cache: false,
        success: function (result) {
            $("#INDAMTalk").html(result);
        }
    });
}

// 인담톡+까톡+인사담당자에게한마디 통합 > 도움돼요
function Go_Help_Point(IndamTalkType, Q_No, Gno, Q_Code) {
    jQuery.ajax({
        type: "GET",
        url: "/Recruit/IndamTalk_HelpPointU_Ajax",
        data: "IndamTalkType=" + IndamTalkType + "&Q_No=" + Q_No + "&Gno=" + Gno + "&Q_Code=" + Q_Code,
        cache: false,
        success: function (result) {
            alert("감사합니다. 취업에 성공하세요. ^^");
        }
    });
}

// 인담톡+까톡+인사담당자에게한마디 통합 > 질문삭제
function Go_Q_Del(IndamTalkType, Q_No, Gno, Mem_Type_Code, Mem_ID) {
    var ret = confirm("해당 글을 삭제하시겠습니까?");
    if (ret == true) {
        jQuery.ajax({
            type: "GET",
            url: "/Recruit/GI_Read_CommonIndamtalk_Q_Del",
            data: "IndamTalkType=" + IndamTalkType + "&Q_No=" + Q_No + "&Gno=" + Gno + "&Mem_Type_Code=" + Mem_Type_Code + "&Mem_ID=" + Mem_ID,
            cache: false,
            success: function (result) {
                GIReadIndamTalk("/Recruit/GI_Read_CommonIndamtalk?Mem_Id=" + Mem_ID + "&Gno=" + Gno + "&Mem_Type_Code=" + Mem_Type_Code + "&Co_Indam_Sort=0");
            }
        });
    }
}

// 인담톡+까톡+인사담당자에게한마디 통합 > 답변삭제
function Go_A_Del(IndamTalkType, Q_No, Answer_No, Gno, Mem_Type_Code, Mem_ID) {
    var ret = confirm("해당 글을 삭제하시겠습니까?");
    if (ret == true) {
        jQuery.ajax({
            type: "GET",
            url: "/Recruit/GI_Read_CommonIndamtalk_A_Del",
            data: "IndamTalkType=" + IndamTalkType + "&Q_No=" + Q_No + "&Answer_No=" + Answer_No + "&Gno=" + Gno + "&Mem_Type_Code=" + Mem_Type_Code + "&Mem_ID=" + Mem_ID,
            cache: false,
            success: function (result) {
                GIReadIndamTalk("/Recruit/GI_Read_CommonIndamtalk?Mem_Id=" + Mem_ID + "&Gno=" + Gno + "&Mem_Type_Code=" + Mem_Type_Code + "&Co_Indam_Sort=0");
            }
        });
    }
}

// 인담톡+까톡+인사담당자에게한마디 통합 > 정렬보기 수정
function Go_Co_Indam_Sort(Mem_Id, Gno, Mem_Type_Code, Answer_Stat_Code) {
    var Co_Indam_Sort = $("#Co_Indam_Sort").val();
    if (Co_Indam_Sort == "" || Co_Indam_Sort == undefined) {
        Co_Indam_Sort = 0;
    }
    GIReadIndamTalk("/Recruit/GI_Read_CommonIndamtalk?Mem_Id=" + Mem_Id + "&Gno=" + Gno + "&Mem_Type_Code=" + Mem_Type_Code + "&Co_Indam_Sort=" + Co_Indam_Sort + "&Answer_Stat_Code=" + Answer_Stat_Code);
}

// 인담톡+까톡+인사담당자에게한마디 통합 > 인사담당자에게 질문하기 > 폼 보여주기
function Go_IndamTalk_Q(Mem_Id, Gno, Mem_Type_Code) {
    if (mid == "") {
        
    }
    else {
        $("P_Hr_Talk_Q").show();
        jQuery.ajax({
            type: "GET",
            url: "/Recruit/GI_Read_CommonIndamtalk_Q",
            data: "Mem_Id=" + Mem_Id + "&Gno=" + Gno + "&Mem_Type_Code=" + Mem_Type_Code,
            cache: false,
            success: function (result) {
                $("#INDAMTalk_Hr_Talk_Q").html(result);
            }
        });
    }
}

// 인담톡+까톡+인사담당자에게한마디 통합 > 인사담당자에게 질문하기 > 입력 Action
function Go_IndamTalk_Q_Ok(Mem_Id, Gno, Mem_Type_Code) {
    if (mid == "") {
        alert("개인회원으로 로그인 후 사용 가능합니다");
        $("P_Hr_Talk_Q").hide();
    }
    else {
        $("P_Hr_Talk_Q").show();

        if ($("#Qstn_Big_Ctgr_Code").val() == "") {
            alert("채용일반을 선택해주세요.");
            $("#Qstn_Big_Ctgr_Code").focus();
            return false;
        }

        /*
        if ($("#Qstn_Ctgr_Code").val() == "") {
            alert("채용을 선택해주세요.");
            $("#Qstn_Ctgr_Code").focus();
            return false;
        }*/

        if ($("#Qstn_Cntnt").val() == "") {
            alert("질문을 등록해주세요.");
            $("#Qstn_Cntnt").focus();
            return false;
        }

        if ($.trim($('#Qstn_Cntnt').val()).indexOf('채용 관련하여 궁금한 사항이 있으면 질문해주세요') >= 0) {
            alert("질문을 등록해주세요.");
            $('#Qstn_Cntnt').val('');
            $("#Qstn_Cntnt").focus();
            return false;
        }

        jQuery.ajax({
            type: "POST",
            url: "/Recruit/GI_Read_CommonIndamtalk_Q_Ok",
            data: "Mem_Id=" + Mem_Id + "&Gno=" + Gno + "&Mem_Type_Code=" + Mem_Type_Code + "&Qstn_Big_Ctgr_Code=" + $("#Qstn_Big_Ctgr_Code").val() + "&Qstn_Ctgr_Code=" + $("#Qstn_Ctgr_Code").val() + "&Qstn_Cntnt=" + escape($("#Qstn_Cntnt").val()) + "&Reg_M_Id=" + mid,
            cache: false,
            success: function (result) {
                GIReadIndamTalk("/Recruit/GI_Read_CommonIndamtalk?Mem_Id=" + cid + "&Gno=" + gno + "&Mem_Type_Code=" + memtype + "&Co_Indam_Sort=0");
            }
        });
    }
}

// 인담톡+까톡+인사담당자에게한마디 통합 > 생생인담톡 인사담당자 답변 > 입력 Action
function Go_IndamTalk_A_Ok() {
    if (cid == "") {
        alert("기업회원으로 로그인 후 사용 가능합니다");
        return false;
    }
    else {
        if ($("#Qstn_Cntnt").val() == "") {
            alert("답변을 등록해주세요.");
            $("#Qstn_Cntnt").focus();
            return false;
        }

        if ($.trim($('#Qstn_Cntnt').val()).indexOf('구직자가 답글을 애타게 기다립니다.') >= 0) {
            alert("답변을 등록해주세요.");
            $('#Qstn_Cntnt').val('');
            $("#Qstn_Cntnt").focus();
            return false;
        }

        var Mem_Id = $('#Mem_Id').val();
        var Gno = $('#Gno').val();
        var Mem_Type_Code = $('#Mem_Type_Code').val();
        var Q_No = $('#Q_No').val();
        var IndamTalkType = $('#IndamTalkType').val();
        var Qstn_Cntnt = $('#Qstn_Cntnt').val();

        jQuery.ajax({
            type: "POST",
            url: "/Recruit/GI_Read_CommonIndamtalk_A_Ok",
            data: "Q_No=" + $('#Q_No').val() + "&Qstn_Cntnt=" + escape($('#Qstn_Cntnt').val()),
            cache: false,
            success: function (result) {
                parent.GIReadIndamTalk("/Recruit/GI_Read_CommonIndamtalk?Mem_Id=" + $('#Mem_Id').val() + "&Gno=" + $('#Gno').val() + "&Mem_Type_Code=" + $('#Mem_Type_Code').val() + "&Co_Indam_Sort=0");
            }
        });
    }
}

function Go_Answer_Stat_Code(Mem_Id, Gno, Mem_Type_Code, Answer_Stat_Code) {
    if (Answer_Stat_Code == "" || Answer_Stat_Code == undefined) {
        Answer_Stat_Code = 3;
    }

    parent.GIReadIndamTalk("/Recruit/GI_Read_CommonIndamtalk?Mem_Id=" + Mem_Id + "&Gno=" + Gno + "&Mem_Type_Code=" + Mem_Type_Code + "&Co_Indam_Sort=0&Answer_Stat_Code=" + Answer_Stat_Code);
}

function Go_IndamTalk_Q_Cancel() {
    var ret = confirm("입력하신 내용을 취소하시겠습니까?");
    if (ret == true) {
        $('#Qstn_Big_Ctgr_Code').select(0);
        $('#Qstn_Big_Ctgr_Code').change();
        $("#askToHr").hide();
    }
}

function Go_IndamTalk_A_Cancel() {
    var ret = confirm("입력하신 내용을 취소하시겠습니까?");
    if (ret == true) {
        parent.GIReadIndamTalk("/Recruit/GI_Read_CommonIndamtalk?Mem_Id=" + $('#Mem_Id').val() + "&Gno=" + $('#Gno').val() + "&Mem_Type_Code=" + $('#Mem_Type_Code').val() + "&Co_Indam_Sort=0");
    }
}

function Go_Read_GI_kkatalk_policy() {
    window.open("/List_GI/Read_GI_kkatalk_policy.asp", "Read_GI_kkatalk_policy", "left=0,top=0,width=770,height=750,scrollbars=yes");
}

var go_IngList = function (url) {
    jQuery.ajax({
        type: "get",
        url: url,
        data: "",
        contentType: "application/json; charset=utf-8",
        dataType: "html",
        cache: false,
        success: function (result) {
            $("#devIngList").html(result).find("#devIngMemName").html(cname);
        }
    });
}

//온라인입사지원 New -- main_common.js 동기화!
function onlinePassNew(gino) {

    //타 회원 로그인이 되어 있는 경우
    if (Mem_Chk != "0" && Mem_Chk != "1") {
        if (confirm("'온라인 입사지원'은 개인회원 로그인 후 가능합니다. 로그인 하시겠습니까?")) {

        } else {
            return;
        }
    }

    jQuery.ajax({
        type: "GET",
        url: "/List_GI/Online_Pass_Check.asp",
        data: "GI_No=" + gino + "&S_Type=OPC&Pass_Match=255",
        dataType: "html",
        success: function (data) {

            var brw = whichBrs();
            var scroll = 0;

            var hval = 610;
            var wval = 770;

            var ifrm_height = hval - 76;

            switch (brw) {
                case 'Internet Explorer':
                    if (screen.availHeight < 670) {
                        hval = screen.availHeight;
                        ifrm_height = hval - 160;
                    }
                    break;
                case 'Safari':
                    hval = 610; break;
                case 'Firefox':
                    hval = 610; break;
                case 'Chrome':
                    hval = 612;
                    if (screen.availHeight < 670) {
                        hval = screen.availHeight - 64;
                        ifrm_height = hval - 76;
                    }
                    break;
                case 'Opera':
                    hval = 610; break;
                default:

            }

            switch (data) {
                case '0':

                    var go_url = "/List_GI/GIB_Read_Frame.asp?GI_No=" + gino + "&Pass_Match=255&ifrm_height=" + ifrm_height + "&Oem_Code=" + Site_Oem_Code;
                    window.open(go_url, 'onlinePass', 'width=' + wval + ',height=' + hval + ',toolbar=0,scrollbars=0,resizable=no,left=235,top=0');

                    break;

                case "6":
                    if (confirm('회원님께서 열람제한 서비스에 등록한 기업입니다. 입사지원 하시겠습니까?')) { } else { return; }

                    var go_url = "/List_GI/GIB_Read_Frame.asp?GI_No=" + gino + "&Pass_Match=255&pass_chk=1&ifrm_height=" + ifrm_height + "&Oem_Code=" + Site_Oem_Code;;
                    window.open(go_url, 'onlinePass', 'width=' + wval + ',height=' + hval + ',toolbar=0,scrollbars=0,resizable=no,left=235,top=0');

                    break;


                default: pass_alert(data); break;
            }
        }
    });

}

// e-메일 입사지원 New -- main_common.js 동기화!
function onlinePassEmailNew(gino) {

    //타 회원 로그인이 되어 있는 경우
    if (Mem_Chk != "0" && Mem_Chk != "1") {
        if (confirm("'e-메일 입사지원'은 개인회원 로그인 후 가능합니다. 로그인 하시겠습니까?")) {

        } else {
            return;
        }
    }

    jQuery.ajax({
        type: "GET",
        url: "/List_GI/Online_Pass_Check.asp",
        data: "GI_No=" + gino + "&S_Type=EPC&Pass_Match=255",
        dataType: "html",
        success: function (data) {


            var brw = whichBrs();
            var scroll = 0;

            var hval = 690;
            var wval = 770;

            var ifrm_height = hval - 76;

            switch (brw) {
                case 'Internet Explorer':
                    if (screen.availHeight < 670) {
                        hval = screen.availHeight;
                        ifrm_height = hval - 160;
                    }
                    break;
                case 'Safari':
                    hval = 690; break;
                case 'Firefox':
                    hval = 690; break;
                case 'Chrome':
                    hval = 692;
                    if (screen.availHeight < 670) {
                        hval = screen.availHeight - 64;
                        ifrm_height = hval - 76;
                    }
                    break;
                case 'Opera':
                    hval = 690; break;
                default:

            }


            switch (data) {
                case '0':

                    var go_url = "/List_GI/GIB_Read_Email_Frame.asp?GI_No=" + gino + "&Pass_Match=255&ifrm_height=" + ifrm_height + "&Oem_Code=" + Site_Oem_Code;
                    window.open(go_url, 'onlinePass', 'width=' + wval + ',height=' + hval + ',toolbar=0,scrollbars=0,resizable=no,left=235,top=0');

                    break;

                case "6":
                    if (confirm('회원님께서 열람제한 서비스에 등록한 기업입니다. 입사지원 하시겠습니까?')) { } else { return; }

                    var go_url = "/List_GI/GIB_Read_Email_Frame.asp?GI_No=" + gino + "&Pass_Match=255&pass_chk=1&ifrm_height=" + ifrm_height + "&Oem_Code=" + Site_Oem_Code;
                    window.open(go_url, 'onlinePass', 'width=' + wval + ',height=' + hval + ',toolbar=0,scrollbars=0,resizable=no,left=235,top=0');

                    break;


                default: pass_alert(data); break;
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
    }
}

// 파견.서치펌 - 온라인
function onlinePass2(gino, mid, memtype) {
    var form = document.form;
    if (mid == "") {
        if (confirm("'온라인 입사지원'은 로그인 후 지원이 가능합니다.\n\n개인회원으로 로그인 후 온라인 입사지원을 \n\n클릭하여 지원해주시기 바랍니다.")) {
            location.href = "/Login/Login_GG.asp?re_url=" + escape(re_url);
        }
    }
    else {        
        if (memtype == "H") {
            go_url = window.jkDomain + "/List_Head/HH_OnPass.asp?h_gi_no=" + gino;

            window.open(go_url, 'onlinepass', 'width=620,height=500, toolbar=0,scrollbars=1,resizable=no');
        } else {
            go_url = window.hrpDomain + "/List_HH/HH_OnPass.asp?HGI_NO=" + gino;
            window.open(go_url);
        }
        
    }
}

// 파견.서치펌 - 이메일
function mailpass2(gino, mid, memtype) {
    if (mid == "") {
        if (confirm("'e-메일 입사지원'은 로그인 후 지원이 가능합니다.\n\n개인회원으로 로그인 후 e-메일 입사지원을 \n\n클릭하여 지원해주시기 바랍니다.")) {
            location.href = "/Login/Login_GG.asp?re_url=" + escape(re_url);
        }
    } else {        
        var go_url = memtype == "H" ? window.jkDomain + "/List_Head/HH_Mail_Pass.asp?h_gi_no=" + gino + "&m_id=" + mid
            : window.hrpDomain + "/List_HH/HH_Mail_Pass.asp?h_gi_no=" + gino;

        var winOpen;
        if (memtype === "H") {
            winOpen = window.open(go_url, 'onlinepass', 'width=620,height=500, toolbar=0,scrollbars=1,resizable=no');
        } else {
            winOpen = window.open(go_url, 'onlinepass', 'width=420,height=420, toolbar=0,scrollbars=1,resizable=no');
        }
        winOpen.focus();
    }
}


// 서치펌 스크랩
var go_ScrapSF = function (_mid, _cid, hgi_div) {
    if ((_mid == "") && (_cid == "")) {
        if (confirm("'스크랩'은 로그인 후 사용가능 합니다.\n지금 로그인 하시겠습니까?")) {
            var re_url1 = window.jkDomain + "/Recruit/GI_Read/" + gno + "?Hgi_Div=1&Oem_Code=S98";            
            var re_url = escape(re_url1)
            location.href = window.hrpDomain + "/Login/Login_Gi_GG.asp?re_url=" + re_url
        }
    } else {
        jQuery.ajax({
            type: "get",
            url: "/NET/CoRead/Scrap_SF",
            data: "S_ID=" + cid,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            cache: false,
            success: function (result) {
                NsmConversionClick('170'); //Nsm 스크립트 추가
                if (result.rtnVal) {
                    alert("스크랩 되었습니다.");
                    $(".devScrapSF").removeClass("icScrap_1").addClass("icScrap_1_on"); //스크랩 on 처리
                } else {
                    alert("이미 스크랩되어 있습니다.");
                }
            }
        });
    }
}

//특정공고 클릭수
function GI_Spcfc_Click_Cnt(Gno, ClickType, MenuStat) {
    jQuery.ajax({
        type: "GET",
        url: "/include/List_GI/Gi_Spcfc_Click_Insert.asp",
        data: "Gno=" + Gno + "&ClickType=" + ClickType + "&MenuStat=" + MenuStat,
        success: function (data) {
        }
    });
}

// 공고뷰 리스트 관련 함수 (현대화에 맞춰 수정)
// 스크랩 추가/삭제
function addScrap(ele, giNo, gno, memberId, memberType) {    
    var $self = $(ele);
    var state = $self.is('.tplBtnScrOff') ? 1 : 0; // 현재 상태
    var $scrapCnt = $(".devScrapCnt");

    if (Mem_Chk != "0" && Mem_Chk != "1") {
        if (!confirm("'스크랩'은 개인회원 로그인 후 사용가능 합니다.\n\n지금 로그인 하시겠습니까?"))
            return;

        location.href = window.jkDomain + '/Login/Login_Tot.asp?rDBName=GG&re_url=' + getReturnUrl();
    }
    else if (Mem_Chk == "1") {
        // 스크랩 해제
        if (state == 0) {
            var data = {
                GI_No: giNo,
                Gno: gno,
                rScrapStat: state,
                Mem_ID: memberId,
                Mem_Type_Code: memberType
            };

            $.ajax({
                type: 'get',
                url: '/Recruit/GI_Scrap_Ajax',
                data: data,
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                cache: false,
                success: function (result) {
                    if ($scrapCnt.length > 0 && !isNaN($scrapCnt.html())) {
                        $scrapCnt.html(parseInt($scrapCnt.html(), 10) - 1);
                    }

                    $self.removeClass('tplBtnScrOn').addClass('tplBtnScrOff');

                    NsmConversionClick('170'); //Nsm 스크립트 추가

                    if (result == '1') {
                        Criteo(giNo); //크리테오, 타게팅게이츠
                    }
                }
            });
        }
        else {
            var data = { rScrapStat: state, Mem_ID: memberId };

            $.ajax({   //채용공고 스크랩 수 체크 1일 : 100건 총 600건 이하로 제한
                type: 'get',
                url: '/Recruit/GI_Scrap_Limit_Ajax',
                data: data,
                cache: false,
                success: function (result) {
                    if (result == '2') {
                        alert('채용공고 스크랩은 1일 1,000건까지 가능합니다.');
                    }
                    else if (result == '3') {
                        alert('채용공고 스크랩은 최대 6,000건까지 가능합니다.');
                    }
                    else {
                        var data = {
                            GI_No: giNo,
                            Gno: gno,
                            rScrapStat: state,
                            Mem_ID: memberId,
                            Mem_Type_Code: memberType
                        };

                        $.ajax({
                            type: 'get',
                            url: '/Recruit/GI_Scrap_Ajax',
                            data: data,
                            contentType: 'application/json; charset=utf-8',
                            dataType: 'json',
                            cache: false,
                            success: function (result) {
                                if (state == 0) {
                                    $self.removeClass('tplBtnScrOn').addClass('tplBtnScrOff');
                                }
                                else {
                                    $self.removeClass('tplBtnScrOff').addClass('tplBtnScrOn');
                                    if ($scrapCnt.length > 0 && !isNaN($scrapCnt.html())) {
                                        $scrapCnt.html(parseInt($scrapCnt.html(), 10) + 1);
                                    }
                                }

                                NsmConversionClick('170'); //Nsm 스크립트 추가

                                if (result == '1') {
                                    Criteo(giNo); //크리테오, 타게팅게이츠
                                }
                            }
                        });
                    }
                }
            });
        }
    } else {
        alert("'스크랩'은 개인회원 로그인 후 사용가능 합니다.");
    }
}

// 관심기업 추가/삭제
function addFavorite(ele, targetId) {
    var $self = $(ele);
    var state = $self.is('.tplBtnFavOff') ? 1 : 0; // 현재 상태

    if (Mem_Chk != "0" && Mem_Chk != "1") {
        if (!confirm("'관심기업 설정'은 개인회원 로그인 후 사용가능 합니다.\n\n지금 로그인 하시겠습니까?"))
            return;

        location.href = window.jkDomain + '/Login/Login_Tot.asp?rDBName=GG&re_url=' + getReturnUrl();
    } else if (Mem_Chk == "1") {
        var data = { rCID: targetId, rFavorStat: state };

        $.ajax({
            type: 'get',
            url: '/Recruit/FavorCo_ID',
            data: data,
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            cache: false,
            success: function (result) {
                // result - ex) {Favor_Cnt: 663, Favor_Result: 4}

                // 버튼 스타일 업데이트
                var $buttons = $self.closest('tbody').find('tr[data-member-id="' + targetId + '"]').find('button.devTplBtnFav');

                if (state == 0) {
                    $buttons.removeClass('tplBtnFavOn').addClass('tplBtnFavOff');
                    $('#favorText' + targetId).html('관심기업');
                }
                else {
                    $buttons.removeClass('tplBtnFavOff').addClass('tplBtnFavOn');
                    $('#favorText' + targetId).html(result.Favor_Cnt);
                }

                if (result.Favor_Result == '0') {
                } else if (result.Favor_Result == '2') {
                    alert('이미 관심기업으로 등록된 기업입니다.');
                } else if (result.Favor_Result == '3') {
                    alert('관심기업이 이미 6,000개 등록되었습니다.');
                } else if (result.Favor_Result == '4') {
                    if (cid == targetId) {
                        $(".devFavorCnt").text(result.Favor_Cnt); //관심기업 카운트 노출                    

                        if (typeof register_in_pool_after_favor == 'function'
                            && typeof cid == 'string'
                            && typeof gno == 'string'
                            && result.Favor_Result == "4"
                            && confirm("관심기업 등록 완료! \n채용정보 등록 시 알림기능이 제공되는 [이 회사 인재풀 등록]에 이력서를 등록하시겠습니까?")) {
                            register_in_pool_after_favor(cid, gno, 12);
                        }
                    }
                }
            }
        });
    } else {
        alert("'관심기업 설정'은 개인회원 로그인 후 사용가능 합니다.");
    }
}

function getReturnUrl() {
    var returnUrl = location.protocol + '//' + location.host + location.pathname;
}

// 공고 클릭 카운트
function giClickCount(pageCode, ctgrCode) {
    var data = { Page_Code: pageCode, Ctgr_Code: ctgrCode };

    $.ajax({
        type: 'get',
        url: '/include/List_GI/Gi_Click_Insert.asp',
        data: data
    });
}

//채용 개편 프로젝트 - 클릭수 수집
function urlGiClickCount(url, pageCode, ctgrCode) {
    var data = { Page_Code: pageCode, Ctgr_Code: ctgrCode };

    $.ajax({
        type: 'get',
        url: '/include/List_GI/Gi_Click_Insert.asp',
        data: data,
        success: function (data) {
            location.href = url;
        }
    });
}

// 특정 공고 클릭 카운트
function giSpecificClickCount(giStat, gno, clickType, menuStat) {
    if (giStat != 1)
        return;

    var data = { Gno: gno, ClickType: clickType, MenuStat: menuStat };

    $.ajax({
        type: 'get',
        url: '/include/List_GI/Gi_Spcfc_Click_Insert.asp',
        data: data
    });
}