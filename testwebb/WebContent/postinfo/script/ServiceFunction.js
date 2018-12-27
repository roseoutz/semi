var app = app || {};
app.svcFunc = JK5Cript.ServiceFunction = {};

app.svcFunc.sortDiv = 1;
app.svcFunc.fullURL = window.location.href;

//Shorten URL 포스팅수 누적
app.svcFunc.onSnsPosting = function (snsType, snsUrl, snsText) {
    var postingDiv = 1;

    if (snsType === "facebook") {
        app.svcFunc.onFacebook(snsUrl);
        postingDiv = 2;
    } else if (snsType === "twitter") {
        app.svcFunc.onTwitter(snsUrl, snsText);
        postingDiv = 1;
    }

    var options = {
        url: "/Recruit/Sns_Posting",
        data: "Short_Div=" + app.svcFunc.sortDiv + "&Posting_Div=" + postingDiv + "&Full_URL=" + escape(app.svcFunc.fullURL),
        method: "get",
        cache: false
    };

    JK5Cript.Loader.async(options, function (response) {
    });
}

//트위터 발송
app.svcFunc.onTwitter = function (url, text) {
    try {
        var LinkPage = "http://twitter.com/intent/tweet?status=" + encodeURIComponent(text);
        var ua = navigator.userAgent.toLowerCase();

        if (ua.indexOf("ipad") != -1) {
            location.href = LinkPage;
        } else {
            window.open(LinkPage, '', '');
        }
    }
    catch (e) {
        //alert(e.message);
    }
}

//페이스북 발송
app.svcFunc.onFacebook = function (url) {
    try {
        //페이스북으로 전송
        var LinkPage = "http://www.facebook.com/sharer.php?u=" + encodeURIComponent(url);
        var ua = navigator.userAgent.toLowerCase();

        if (ua.indexOf("ipad") != -1) {
            location.href = LinkPage;
        } else {
            window.open(LinkPage, 'facebookShare', 'width=740px,height=400px');
        }
    }
    catch (e) {
        //alert(e.message);
    }
}

//이미지 리로드
app.onloadResize = function (ele, width, height) {
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

//통합검색 전용 로그인 URL
app.svcFunc.moveTotalSearchLoginUrl = function (returnUrl, memberType, comfirmMessage) {

    var dn = document.domain + JK5Cript.URL.getPathName();
    var params = JK5Cript.URL.getParams('object');

    var stext = "";
    var protocol = "http://";
    if (_.has(params, 'stext') && typeof params['stext'] !== 'undefined') {

        if (params['stext'].indexOf("%u") >= 0) {
            stext = params['stext'];
        }
        else {
            stext = escape(decodeURIComponent(params['stext']));
        }

        if ('http:' == document.location.protocol) {
            protocol = "http://";
        } else {
            protocol = "https://";
        }

        var params = JK5Cript.URL.getParams({ stext: stext }, 'string');
        returnUrl = protocol + dn + params;

        returnUrl = encodeURIComponent(returnUrl);
    }

    memberType = (memberType === undefined) ? "GG" : memberType;

    if (comfirmMessage != undefined && String(comfirmMessage).length > 0) {
        if (confirm(comfirmMessage)) {
            window.top.location.href = "/Login/Login_Tot.asp?rDBName=" + memberType + "&re_url=" + returnUrl;
        }
    } else {
        window.top.location.href = "/Login/Login_Tot.asp?rDBName=" + memberType + "&re_url=" + returnUrl;
    }
}

//스크랩 최대 치 체크 (1 : 스크랩 가능, 2 : 1일 최대건수 초과, 3 : 개인 최대건수 초과)
app.svcFunc.scrapLimitCheck = function (args) {
    var data = {
        rScrapStat: args.rScrapStat,
        Mem_ID: args.memId
    };

    return new Promise(function (resolve, reject) {

        var options = {
            url: "/Recruit/GI_Scrap_Limit_Ajax",
            data: data,
            method: "get",
            cache: false
        };

        JK5Cript.Loader.async(options, function (response) {
            var scrapStat = "1";
            if (!args.scrapType) {
                scrapStat = "0";
            }

            //객체 property 추가
            JK5Cript.Objects.add(args, {
                response: response,
                scrapStat: scrapStat
            });

            //객체 property 삭제
            //JK5Cript.Objects.del(args, ["response", "scrapStat"]);
            //JK5Cript.Objects.del(args, "response");

            if (response == 1) {
                resolve(args);
            } else {
                resolve(args);
            }
        });
    });
}

//스크랩 처리 (0 : 실패, 1 : 성공)
app.svcFunc.scrapReg = function (args) {
    var result = "0";

    data = {
        GI_No: args.giNo,
        Gno: args.gNo,
        rScrapStat: args.scrapStat,
        Mem_ID: args.memId,
        Mem_Type_Code: args.memTypeCode
    }

    return new Promise(function (resolve, reject) {
        //reject("error테스트");
        var options = {
            url: "/Recruit/GI_Scrap_Ajax",
            data: data,
            method: "get",
            cache: false
        };

        JK5Cript.Loader.async(options, function (response) {
            if (response == "0") {
                response = "4";
            }
            resolve(response);

            NsmConversionClick('170'); //Nsm 스크립트 추가
            if (response == "1" || response == "4") {
                //go_event_icon_view();	//채용정보 개편 이벤트 아이콘
                app.svcFunc.Criteo(args.giNo); //크리테오, 타게팅게이츠
            }
        });
    });
}

//단일 스크랩
app.svcFunc.scrapSingle = function (giNo, gNo, memId, memTypeCode, scrapType) {
    var data = {};
    var result = "";
    var args = {
        giNo: giNo,
        gNo: gNo,
        memId: memId,
        memTypeCode: memTypeCode,
        scrapType: scrapType,
        rScrapStat: 1
    };

    return new Promise(function (resolve, reject) {
        resolve(args);
    });
}

//복수 스크랩
app.svcFunc.scrapMulti = function () { }

//단일 관심기업
app.svcFunc.favorCoSingle = function (userId, memId, favorType) {
    var args = {
        memId: memId,
        favorType: favorType ? 1 : 0
    };

    return new Promise(function (resolve, reject) {
        resolve(args);
    });
}

app.svcFunc.Criteo = function (giNo) {
    jQuery.ajax({
        type: "POST",
        url: "/Include/Criteo/Criteo_Scrap_UTF.asp?Gi_No=" + giNo,
        dataType: "html",
        cache: false,
        success: function (html) {
            var obj = $(html);
            $('#widerplanet_tagging').html(obj.html());
            obj.filter('script').each(function () {
                $.globalEval(this.text || this.textContent || this.innerHTML || '');
            });
        }
    });
}

//단일 관심기업 처리
app.svcFunc.favorCoReg = function (args) {
    var data = {
        rCID: args.memId,
        rFavorStat: args.favorType
    };

    var options = {
        url: "/Recruit/FavorCo_ID",
        data: data,
        method: "get",
        dataType: "json",
        cache: false
    };

    return new Promise(function (resolve, reject) {
        JK5Cript.Loader.async(options, function (response) {
            var favorCoStat = 1;
            if (args.rFavorStat === 1) {
                favorCoStat = 0;
            }

            //객체 property 추가
            JK5Cript.Objects.add(args, {
                response: response,
                favorCoStat: favorCoStat
            });

            resolve(args);
        });
    });
}

//관심기업 후 인재풀 처리
app.svcFunc.favorCoPoolReg = function (args) {
    return new Promise(function (resolve, reject) {
        if (args.favorCoStat === 1) {
            switch (args.response.Favor_Result) {
                case 2:
                    alert("이미 관심기업으로 등록된 기업입니다.");
                    break;
                case 3:
                    alert("관심기업이 이미 6,000개 등록되었습니다.");
                    break;
                case 4:
                    var options = {
                        url: "/List_GI/OnPass_PoolRegister_Ok.asp",
                        data: {
                            C_Id: args.memId
                            , C_Name: ""
                            , C_MEM_TYPE_CODE: "C"
                            , gno: 0
                            , Reg_Path_Code: 12
                        },
                        method: "get",
                        dataType: "text",
                        cache: false
                    };

                    if (confirm("관심기업 등록 완료! \n채용정보 등록 시 알림기능이 제공되는 [이 회사 인재풀 등록]에 이력서를 등록하시겠습니까?")) {
                        JK5Cript.Loader.async(options, function (response) {
                            switch (response) {
                                case 1:
                                    //console.log("로그인 필요");
                                    break;
                                case 2:
                                    alert("잘못된 경로로 접속하셨습니다.");
                                    break;
                                case 3:
                                    alert("이력서를 수정하셔야 인재풀에 등록할 수 있습니다.");
                                    break;
                                case 4:
                                    alert("이력서가 아직 등록되지 않았습니다. 이력서 등록 완료 후 인재풀에 등록 해주시기 바랍니다.");
                                    break;
                                case 5:
                                    alert("이력서가 미완성 상태입니다. 이력서 등록 완료 후 인재풀에 등록 해주시기 바랍니다.");
                                    break;
                                case 6:
                                    alert("인재풀은 최대 3,000개까지 등록 가능합니다. 자세한 문의는 고객센터(1588-9350)로 연락주세요.");
                                    break;
                                default:
                                    alert("인재풀에 등록되었습니다. 추후 인사담당자가 직접 연락할 예정입니다.");
                                    break;
                            }
                        });
                    }
                    break;
                default:
                    break;

            }
        }

        resolve(args);
    });
}

app.svcFunc.layerApplyOpen = function (gno, gubun, giPart) {
    var stat = false;

    var data = {
        gno: gno,
        gbn: gubun,
        GiPart: giPart
    };

    var options = {
        url: "/Recruit/OnPass_Apply",
        data: data,
        method: "post",
        dataType: "html",
        cache: false
    }

    JK5Cript.Loader.async(options, function (response) {
        if (jQuery.trim(response) != "") {
            jQuery("div.lyOnPassApply").remove();

            // 레이어 위치 조절 전 hide 대신 좌측으로 넘겼다가 가져옴.
            // hide 실행시 해당 div의 height 조절 못함

            jQuery("body").append(response).find("div.lyOnPassApply").css("left", "-9999px");

            app.svcFunc.layerApplyFrameSize();

        } else {
            stat = true;
        }
    });

    return stat;
}

// 프레임 사이즈 - Ajax 호출시
app.svcFunc.layerApplyFrameSize = function () {
    var jQueryheight = 0;
    var jQueryobj = jQuery("#onPassApply_Frame");

    if (jQueryobj.length) {
        if (jQueryobj.attr("src").toLowerCase().indexOf("m_login_layer") > -1) {
            jQueryheight = jQueryobj.height();
            app.svcFunc.layerApplyFrameSizeChange(jQueryheight);
        }
    }
}

// 프레임 사이즈 변경
app.svcFunc.layerApplyFrameSizeChange = function (_height) {
    var jQuerydiv = jQuery("body").find("div.lyOnPassApply");
    var jQueryobj = jQuery("#onPassApply_Frame");

    jQueryobj.css("height", _height);

    if (JK5Cript.Agent.isIE) {
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

//상품 효과 측정 > 채용공고 클릭 이력
app.svcFunc.agiEffectClick = function (gNo, effectCode) {
    if ((!isNaN(gNo) && Number(gNo) > 0)) {
        
        var codeArr = [];

        if (_.isString(effectCode)) {
            codeArr = effectCode.split(',');
        }
        else {
            codeArr.push(effectCode);
        }

        $.each(codeArr, function (i, code) {
            code = parseInt(code);
            if (!isNaN(code)) {
                var data = {
                    Gno: gNo,
                    Space_Code: code
                };
                JK5Cript.Loader.sync("/Recruit/GI/SpaceClick", "get", data);
            }
        });
    }
}

//공고 클릭 수
app.svcFunc.clickCnt = function (pageCode, ctgrCode) {
    var ajaxOptions = {
        url: "/Recruit/GI_ClickIns",
        data: "Page_Code=" + pageCode + "&Ctgr_Code=" + ctgrCode,
        method: "get"
    };

    JK5Cript.Loader.async(ajaxOptions, function () {
    });
}

//특정 공고 클릭
app.svcFunc.spcfcAgiClick = function (gNo, clickType, menuStat) {
    var options = {
        url: "/logging/SpcfcClickLogger",
        data: { "gNo": gNo, "clickType": clickType, "MenuStat": menuStat },
        method: "get"
    };

    JK5Cript.Loader.async(options, function (response) {
        // href 실행
    });
}

//상품 측정
app.svcFunc.OptClick = function(giNo, pageCode, positionCode, memTypeCode)
{
    var options = {
        url: "/logging/OptClickLogger",
        data: { "giNo": giNo, "pageCode": pageCode, "positionCode": positionCode, "memTypeCode": memTypeCode },
        method: "get"
    };

    JK5Cript.Loader.async(options, function (response) {
        // href 실행
    });
}

app.svcFunc.specialCharacterCheck = function (str) {
    var err_cnt = 0;
    var nonchar = " :-()[]&,.㈜㈔'`·+#"; //허용된 특수문자( 허용되는 특수문자는 여기에 추가), 21(space), 39('), 47(/)

    for (var i = 0; i < str.length; i++) {
        var val = str.charAt(i);
        if (!((val >= "0" && val <= "9") || (val >= "a" && val <= "z") || (val >= "A" && val <= "Z") || (val >= "ㄱ" && val <= "힣"))) {
            if ((nonchar.indexOf(val) > 0) || (str.charCodeAt(i) == 32) || (str.charCodeAt(i) == 39) || (str.charCodeAt(i) == 47)) {
            } else {
                err_cnt++;
            }
        }

        // 허용문자 C#, C+, C++, M&A, R&D
        if (val == '#') {
            if (i == 0) {
                err_cnt++;
            } else if (str.charAt(i - 1).toLowerCase() != 'c') {
                err_cnt++;
            }
        }

        if (val == '+') {
            if (i == 0) {
                err_cnt++;
            } else if (str.charAt(i - 1).toLowerCase() != 'c') {
                if (str.charAt(i - 1) == '+') {
                    if (str.charAt(i - 2).toLowerCase() != 'c') {
                        err_cnt++;
                    }
                } else {
                    if (str.substring(0, 4).toLowerCase() != "line" && str.substring(0, 2).toLowerCase() != "라인") {
                        err_cnt++;
                    }
                }
            }
        }

        if (val == '&') {
            if (i == 0) {
                err_cnt++;
            } else {
                var beforeString = "";
                var nextString = "";

                if (str.charAt(i - 1).length != 0) {
                    beforeString = str.charAt(i - 1);

                    if (!((beforeString >= "0" && beforeString <= "9") || (beforeString >= "a" && beforeString <= "z") || (beforeString >= "A" && beforeString <= "Z") || (beforeString >= "ㄱ" && beforeString <= "힣"))) {
                        if ((beforeString.charCodeAt(i) == 32) || (beforeString.charCodeAt(i) == 39) || (beforeString.charCodeAt(i) == 47)) {

                        } else {
                            err_cnt++;
                        }
                    }
                }


                if (str.charAt(i + 1).length != 0) {
                    nextString = str.charAt(i + 1);

                    if (!((nextString >= "0" && nextString <= "9") || (nextString >= "a" && nextString <= "z") || (nextString >= "A" && nextString <= "Z") || (nextString >= "ㄱ" && nextString <= "힣"))) {
                        if ((nextString.charCodeAt(i) == 32) || (nextString.charCodeAt(i) == 39) || (nextString.charCodeAt(i) == 47)) {

                        } else {
                            err_cnt++;
                        }
                    }
                }
            }
        }
    }

    if (err_cnt == 0) {
        return true;
    } else {
        return false;
    }
}

app.svcFunc.loginCheck = function (context) {
    var result = {};
    var ajaxOptions = {
        url: "/login/LoginCheck",
        method: "get",
        dataType: "json",
        cache: false
    };
    JK5Cript.Loader.async(ajaxOptions, function (response) {
        context.call(null, response);
    });
}

//로그인 페이지 이동
app.svcFunc.moveLoginUrl = function (returnUrl, memberType, comfirmMessage) {
	var dn = document.domain + JK5Cript.URL.getPathName();
	var params = JK5Cript.URL.getParams('object');

	var selText = "";
	var protocol = "http://";
	if (_.has(params, 'selText') && typeof params['selText'] !== 'undefined') {

		if (params['selText'].indexOf("%u") >= 0) {
			selText = params['selText'];
		}
		else {
			selText = escape(decodeURIComponent(params['selText']));
		}

		if ('http:' == document.location.protocol) {
			protocol = "http://";
		} else {
			protocol = "https://";
		}

		var parameters = JK5Cript.URL.getParams({ selText: selText }, 'string');
		returnUrl = protocol + dn + parameters;
		returnUrl = encodeURIComponent(returnUrl);
	}

	memberType = (memberType === undefined) ? "GG" : memberType;

    if (comfirmMessage != undefined && String(comfirmMessage).length > 0) {
        if (confirm(comfirmMessage)) {
            window.top.location.href = "/Login/Login_Tot.asp?rDBName=" + memberType + "&re_url=" + returnUrl;
        }
    } else {
        window.top.location.href = "/Login/Login_Tot.asp?rDBName=" + memberType + "&re_url=" + returnUrl;
    }
}

app.svcFunc.commonScrap = function ($target, giNo, gNo, memId, memTypeCode, scrapType) {
    var that = this;

    app.svcFunc.loginCheck(function (response) {

        that.memCheck = Number(response.memCheck);

        if (Number(response.memCheck) === 1) {
            that.userId = response.memId;
        } else {
            that.userId = "";
        }

        if (that.userId !== "") {
            app.svcFunc.scrapSingle(giNo, gNo, memId, memTypeCode, scrapType)
                .then(app.svcFunc.scrapLimitCheck)
                .then(app.svcFunc.scrapReg)
                ['catch'](function (error) { alert(error); })
                .then(function (result) {
                    if (result === undefined) {
                    } else {
                        if (String(that.userId).length > 0) {
                            if (result == "2") {
                                alert("채용공고 스크랩은 1일 1,000건까지 가능합니다.");
                            } else if (result == "3") {
                                alert("채용공고 스크랩은 최대 6,000건까지 가능합니다.");
                            } else if (result == "0") {
                                app.svcFunc.moveTotalSearchLoginUrl(app.svcFunc.fullURL, "GG", "개인회원 로그인 후 이용해 주세요.\n로그인 페이지로 이동 하시겠습니까?");
                            } else {
                                if (scrapType) {
                                    $target.addClass("on");
                                } else {
                                    $target.removeClass("on");
                                }
                            }
                        } else {
                            app.svcFunc.moveTotalSearchLoginUrl(app.svcFunc.fullURL, "GG", "개인회원 로그인 후 이용해 주세요.\n로그인 페이지로 이동 하시겠습니까?");
                        }
                    }
                });
        } else {
            if (Number(that.memCheck) === 0) {
                app.svcFunc.moveTotalSearchLoginUrl(app.svcFunc.fullURL, "GG", "개인회원 로그인 후 이용해 주세요.\n로그인 페이지로 이동 하시겠습니까?");
            } else {
                alert("'스크랩'은 개인회원 로그인 후 사용가능 합니다.");
            }
        }
    });
}

app.svcFunc.preventDefault = function (e) {
    if (e.preventDefault) {
        e.preventDefault()
    } else {
        e.stop()
    };
    e.returnValue = false;
    e.stopPropagation();

    if (e.stopImmediatePropagation) {
        e.stopImmediatePropagation();
    } else {
        e.isImmediatePropagationEnabled = false;
    }
}