

$(document).ready(function () {
    // 다른접수방법, 다른이력서 양식 보기 플러그인
    ;(function ($) {
        $.fn.extend({
            giReadLayer: function (options) {
                
                this.defaults = {
                    selector: 'button', //button
                    lyWRap: '.lyCtArea' //layer wrap
                };
                var settings = $.extend({}, this.defaults, options);
                return this.has(settings.selector).each(function () {
                    var $this = $(this),
                        $viewBtn = $this.find(settings.selector),
                        $lyWRap = settings.lyWRap,
                        $lyTarget = $viewBtn.attr('data-target'),
                        $btnLyClose = $('.' + $lyTarget).find('.etcAppLyClose');
    
                    $viewBtn.on('click', function (event) {
                        event.preventDefault();
                        $($lyWRap).hide();
                        $('.' + $lyTarget).parent($lyWRap).show();
                    });
    
                    $btnLyClose.on('click', function (event) {
                        event.preventDefault();
                        $('.' + $lyTarget).parent($lyWRap).hide();
                    });
                });                
            }
        });

    })(jQuery);
    
    (function () {
        if (typeof ($('.tplTxa').byteCheck) == "function") {
            // byte 체크
            $('.tplTxa').byteCheck({ max: 500 });
        }
        if (typeof (makeSameHeight) == "function") {
            // 접수기간/방법 height 100%
            makeSameHeight($('.devMakeSameHeight'));
        }
        if ($("#popupPref").hasClass("tplHide")) {
            $("#popupPref").removeClass("tplHide");
        }
        $("#dlPref dd:last").append($("#popupPref").first());

        $("#btnCalendar").on("click", function () {
            if ($("#applyCalendar").is(':visible')) {
                $("#btnCalendar").find("span").text("달력보기");
            } else {
                $("#btnCalendar").find("span").text("달력닫기");
            }
        });
        //연락처 확인
        $("button.devOpenCharge").on("click", function () {
            $("div.manager").find(".tplHide").removeClass("tplHide");
            $(this).hide();
        });

        var $container = $("#menuContainer");
        var $topMenu = $("#topMenu");
        //$container.height($topMenu.height());
        var $topMenuLi = $topMenu.find("ul li");
        var $rightMenu = $("#rightMenu");
        var left = $rightMenu.length > 0 ? $rightMenu.offset().left : 0;
        $(window).on("scroll resize", function () {
            var topArea = $("#detailArea").length == 0 ? 0 : $("#detailArea").offset().top;
            var scrollTop = $(document).scrollTop();

            if (scrollTop > topArea) {
                $topMenu.addClass('fixed');
                $rightMenu.addClass('fixed');

            } else if (scrollTop < topArea) {
                $topMenu.removeClass('fixed');
                $rightMenu.removeClass('fixed');
            }


            // 스크롤시 컨텐츠 내용의 영역이면 메뉴의 활성화 변경
            var num = $topMenuLi.length;
            for (i = 0; i < num; i++) {
                var idx = $topMenuLi.eq(i).index();
                var idx = idx + 1;
                var windowPos = $(window).scrollTop() + $("#menuContainer").height() + 20;
                var tabObject = $("#tab0" + idx);
                var top = tabObject.length > 0 ? tabObject.offset().top : 0;
                if (i == 0) {
                    top = 0;
                }
                var bottom = $("#tab0" + (idx + 1)).length > 0 ? $("#tab0" + (idx + 1)).offset().top : $(document).height();
                if (windowPos >= top - 1 && windowPos < bottom - 80) {
                    if ($("html, body").is(":animated")) {
                        return false;
                    } else {
                        $topMenuLi.removeClass("on");
                        $topMenuLi.eq(idx - 1).addClass("on");
                    }
                }
            }
        });

        // 메뉴 클릭시 앵커값으로 부드럽게 이동 및 메뉴 활성화
        $topMenu.find('button').click(function (event) {
            var id = $(this).parent("li").data("target");
            if ($("html, body").is(":animated")) {
                event.preventDefault();
                return false;
            } else {
                var $target = $("#" + id);
                var scrollTop = $target.offset().top + Number($target.css("padding-top").replace("px", "")) - (id != "tab01" ? 70: 40);
                
                $topMenuLi.removeClass("on");
                $(this).parent("li").addClass("on");
                $("html, body").stop().animate({ scrollTop: scrollTop }, 500);

                event.preventDefault();
            }
        });

        //이미지 가운데 정렬
        if ($('.artReadJobSum .sumTit .hd_3').height() > 70) {
            $('.artReadJobSum .tbLogo').addClass('devCase');
            $('.artReadJobSum .tbLogo .lazy').attr("src", $('.artReadJobSum .tbLogo .lazy').data("original"));
        }

        var isIE = function () {
            var agent = navigator.userAgent.toLowerCase();

            if (agent.indexOf("chrome") != -1) {
                return false;
            }
            if (agent.indexOf("safari") != -1) {
                return false;
            }
            if (agent.indexOf("firefox") != -1) {
                return false;
            }
            if (agent.indexOf("msie") != -1 || agent.indexOf("trident")) {
                return true;
            }
            return false;
        }

        $(".devPrint").on("click", function () {
            if (isIE()) {
                $(".artReadDetail").append("<div id=\"printIframe\"></div>");
                var target = document.getElementById('gib_frame');

                $("#printIframe").html($(target.contentWindow.document).find("head").html() + $(target.contentWindow.document).find("body").html());

                $(target).hide();

                window.print();

                $("#printIframe").remove();
                $(target).show();
            } else {
                window.print();
            }
        });

        if (typeof isMobile !== 'undefined' && isMobile) {
            //모바일에서 들어왔을데 사이드 숨기기
            $("#adTopWrap").hide();
            $("#rightMenu").hide();
        }
        //다른 접수방법
        $('.etcAppBtn_1').giReadLayer();
        //다른 이력서 양식
        $('.etcResBtn_1').giReadLayer();

        // 티커 처리
        // 티커시작
        //var $ticker = $("#devGiTicker");
        //var giNo = parseInt($ticker.attr("data-gi-no"));

        //if (isNaN(giNo)) {
        //    return;
        //}

        //var location = window.location.href.toLowerCase();

        //if ($ticker.length && location.indexOf("pass_stat=1") === -1) {
        //    var $tickerScroll = $ticker.find(".devTickerScroll");
        //    var tickerTimer = null;
        //    var pauseDuration = 3000;
        //    var animateDuration = 600;
        //    var $tickerContents;
        //    var tickerContentHeight;
        //    var isPause = false;

        //    var animateTicker = function () {
        //        $tickerScroll.stop().animate({
        //            top: -tickerContentHeight
        //        }, {
        //            duration: animateDuration,
        //            complete: function () {
        //                $tickerContents = $ticker.find(".tx");
        //                $tickerContents.first().before($tickerContents.last());
        //                $tickerScroll.css("top", 0);

        //                if (isPause) {
        //                    $tickerScroll.stop();
        //                    window.clearInterval(tickerTimer);
        //                }
        //            }
        //        });
        //    };
            
        //    var startTicker = function () {
        //        isPause = false;
        //        animateTicker();
        //        window.clearInterval(tickerTimer);
        //        tickerTimer = window.setInterval(function () {
        //            animateTicker();
        //        }, pauseDuration);
        //    };

        //    var removeTicker = function () {
        //        window.clearInterval(tickerTimer);
        //        $ticker.hide();
        //    };
            
        //    $.ajax({
        //        url: "/Recruit/GI_Read_Current_View_Data",
        //        dataType: "json",
        //        data: {
        //            gi_no: giNo,
        //            page_code: pagegbn
        //        },
        //        cache: false,
        //        success: function (tickerData) {
        //            if (tickerData) {
        //                var tickerList = [];

        //                if (tickerData.msg1) {
        //                    tickerList.push(tickerData.msg1);
        //                }
        //                if (tickerData.msg2) {
        //                    tickerList.push(tickerData.msg2);
        //                }

        //                var $applyBtn = $("#devApplyBtn");
                      
        //                for (var i = 0; i < tickerList.length; i++) {
        //                    var tickerText = tickerList[i];

        //                    if (tickerText.indexOf("공채 핵심 자료") === -1) {
        //                        tickerText = tickerText.replace(/([0-9]+)/g, '<strong class="point">$1</strong>');
        //                    }
        //                    tickerText = tickerText.replace(/(오늘|내일)/g, '<strong>$1</strong>');
                            
        //                    var $tickerItem = $('<p class="tx">' + tickerText + '</p>');
                            
        //                    if (Page_Code.toLowerCase() != "st") {
        //                        if ($applyBtn.length) {
        //                            var $button = $('<button type="button" class="lkApply">지원하기</button>');
        //                            $button.click(function () {
        //                                $applyBtn.focus().click();
        //                            });

        //                            $tickerItem.append($button);
        //                        }
        //                    }
        //                    $tickerScroll.append($tickerItem);
        //                }

        //                $tickerContents = $tickerScroll.find(".tx");
        //                $ticker.css("opacity", 0).show();
        //                tickerContentHeight = $tickerContents.eq(0).height();
        //                $ticker.css("opacity", 1).hide();

        //                if ($tickerContents.length > 0) { // 노출할 Ticker 있음
        //                    $ticker.fadeIn(1300);

        //                    $ticker.find(".btnClose").click(function () {
        //                        removeTicker();
        //                    });

        //                    if ($tickerContents.length > 1) { // 2개 이상이면 롤링
        //                        window.setTimeout(function () {
        //                            startTicker();
        //                        }, 2000);

        //                        $ticker.hover(function () {
        //                            isPause = true;
        //                        }, function () {
        //                            if (isPause) {
        //                                startTicker();
        //                            }
        //                        });
        //                    }
        //                } else {
        //                    $ticker.hide();
        //                }
        //            }
        //        }
        //    });

        //}
        //티커 끝
        $(".girBtnCls_2").on("click", function () {
            $(this).closest("p").hide();
        });
        

        var $rightTicker = $("#devGiRightTicker");
        //var giNo = parseInt($rightTicker.attr("data-gi-no"));
        var giNo = gino;
        if (isNaN(giNo)) {
            return;
        }
        if (memtype != "C") {
            return;
        }
        
        $.ajax({
            url: "/Recruit/GI_Read_Current_View_Right_Data",
            dataType: "json",
            data: {
                gi_no: giNo,
                page_code: pagegbn
            },
            cache: false,
            success: function (tickerData) {
                if (tickerData) {
                    var tickerList = [];

                    if (tickerData.msg1) {
                        tickerList.push(tickerData.msg1);
                    }
                    if (tickerData.msg2) {
                        tickerList.push(tickerData.msg2);
                    }
                    if (tickerData.msg3) {
                        tickerList.push(tickerData.msg3);
                    }
                    if (tickerData.msg4) {
                        tickerList.push(tickerData.msg4);
                    }
                    if (tickerData.msg5) {
                        tickerList.push(tickerData.msg5);
                    }

                    //for (var i = 0; i < tickerList.length; i++) {
                    //    if (i == 0)
                    //    {
                    //        $("#devGiRightTicker").show();
                    //        window.setTimeout(function () {
                    //            $("#sTicker1").html(tickerList[0]);
                    //            $("#pTicker1").fadeIn();
                    //        }, 2000);
                    //        window.setTimeout(function () {
                    //            $("#pTicker1").fadeOut();
                    //        }, 5500);
                    //        //}, 8000);
                    //    }
                    //    if (i == 1) {
                    //        window.setTimeout(function () {
                    //        $("#sTicker2").html(tickerList[1]);
                    //        $("#pTicker2").fadeIn();
                    //        }, 6500);
                    //        //}, 6000);
                    //        window.setTimeout(function () {
                    //            $("#pTicker2").fadeOut();
                    //        }, 10000);
                    //        //}, 12000);
                    //    }
                    //    if (i == 2) {
                    //        window.setTimeout(function () {
                    //            $("#sTicker3").html(tickerList[2]);
                    //            $("#pTicker3").fadeIn();
                    //        }, 11000);
                    //        //}, 10000);
                    //        window.setTimeout(function () {
                    //            $("#pTicker3").fadeOut();
                    //        }, 14500);
                    //        //}, 16000);
                    //    }
                    //    if (i == 3) {
                    //        window.setTimeout(function () {
                    //            $("#sTicker4").html(tickerList[3]);
                    //            $("#pTicker4").fadeIn();
                    //        }, 15500);
                    //        //}, 14000);
                    //        window.setTimeout(function () {
                    //            $("#pTicker4").fadeOut();
                    //        //}, 20000);
                    //        }, 19000);
                    //    }
                    //}
                    
                    //티커 토스트
                    if (tickerList.length > 0) {
                        $("#devGiRightTicker").show();

                        var toast = new Toast('.lgiTickerWrap', {
                            interval: 5000, // 1초 = 1000, default = 3000
                            text: [
                                    tickerList
                            ]
                        });
                    }
                    

                }
                else {
                    $rightTicker.hide();
                }
            }
        });

        //타임가이드라인 시작
        var $timeGuide = $("#devTimeGuide");
        $timeGuide.html("");
        $.ajax({
            url: "/Recruit/GI_Read_Current_View_Time_Data",
            dataType: "json",
            data: {
                gi_no: giNo,
                page_code: pagegbn
            },
            cache: false,
            success: function (timeData) {
                if (timeData) {
                    if (timeData.msg1) {
                        $timeGuide.html(timeData.msg1);
                    }
                }
            }
        });

        //타임가이드라인 끝

    })();

    // 인사담당자에게 질문하기
    $("#INDAMTalk").on("click", "#toggleIndamQstnLayer", function (e) {
        //$("#INDAMTalk .lyQuestion").toggle();
    });
    // 인담톡 모두 보기
    $("#INDAMTalk").on("click", "#indam_showAll", function (e) {
        $("#INDAMTalk .tbRow").show().find(".talk").show();
        $("#indam_showAll").hide().data("showall", "1");
        $("#indam_closeAll").show();
    });

    // 인담톡 모두 보기 접기
    $("#INDAMTalk").on("click", "#indam_closeAll", function (e) {
        $("#INDAMTalk .talk:gt(5)").hide();
        $("#INDAMTalk .talk.first:hidden").closest(".tbRow").hide();
        $("#indam_showAll").show().data("showall", "0");;
        $("#indam_closeAll").hide();
        var offset_top = $(".secReadHrTalk").offset().top - $("#topMenu").height() - 10;
        $('html,body').scrollTop(offset_top);
    });

    // 인담톡 답변펼쳐보기 토글
    $("#indam_expandAll").click(function (e) {
        var $target = $(this)
        var expand = $target.data("expand");
        if (expand == "0") {
            $target.data("expand", "1");
            $target.find("span").text("답변 펼침닫기")
            $("#indam_showAll").trigger("click");
            $("#INDAMTalk .tbRow .talk .answer").show();
            $("#INDAMTalk .devIndamAnswerToggle").removeClass("girBtnOp").addClass("girBtnCls");
            $("#INDAMTalk .devIndamQstnTitle").removeClass("case");
        } else {
            $target.data("expand", "0");
            $target.find("span").text("답변 펼쳐보기")
            $("#INDAMTalk .tbRow .talk .answer").hide();
            $("#indam_showAll").hide();
            $("#indam_closeAll").show();
            $("#INDAMTalk .devIndamAnswerToggle").removeClass("girBtnCls").addClass("girBtnOp");
            $("#INDAMTalk .devIndamQstnTitle").addClass("case");
        }
    });

    // 인담톡 답변 토글
    $("#INDAMTalk").on("click", ".devIndamQstnTitle,.devIndamAnswerToggle", function (e) {
        var $parent = $(this).closest(".question ")
        var $target = $parent.find(".devIndamAnswerToggle");
        $parent.find(".devIndamQstnTitle").toggleClass("case");
        $target.closest(".talk").find(".answer").toggle();
        $target.toggleClass("girBtnOp girBtnCls");
    });

    // 인담톡 리스트 구분 선택
    $("#INDAMTalk").on("click", ".devIndamSearchType", function (e) {
        var $target = $(this);
        var searchType = $target.data("searchtype");
        var showAll = $("#indam_showAll").data("showall") || 0;
        var expandAll = $("#indam_expandAll").data("expand") || 0;
        GIReadIndamTalkList("/Recruit/GI_Read_CommonIndamtalk_List?Mem_ID=" + cid + "&Gno=" + gno + "&Mem_Type_Code=" + memtype + "&searchType= " + searchType + "&showAll= " + showAll + "&expandAll= " + expandAll);
    });

    // 인사담당자 질문하기 클릭
    $("#toggleIndamQstnLayer").off("click").on("click", function (e) {
        if (mid == "") {
            alert("개인회원으로 로그인 후 사용 가능합니다");
            return;
        }

        $("#div_indamQstnLayer").toggle();
    });

    // 질문하기 레이어 닫기
    $("#btn_closeIndamQstn").on("click", function (e) {
        if ($("#Qstn_Cntnt").val() != "") {
            if (!confirm("입력하신 내용을 취소하시겠습니까?")) {
                return;
            }
            $("#Qstn_Cntnt").val("").trigger("keyup");
        }
        $(this).closest(".devLyType").hide();
    });

    // 인사담당자 질문 대분류 선택
    $("#Qstn_Big_Ctgr_Code").change(function () {
        $("#Qstn_Big_Ctgr_Code option:selected").each(function () {
            var sel = $("#Qstn_Big_Ctgr_Code option:selected").val();

            //소분류 초기화
            $("#Qstn_Ctgr_Code option").remove();

            //대분류 선택시 소분류 나열
            jQuery.ajax({
                type: "GET",
                url: "/Recruit/GI_Read_CommonIndamtalk_Qstn_Ctgr_Code",
                data: "_Qstn_Big_Ctgr_Code=" + sel,
                cache: false,
                success: function (result) {
                    if (result != "") {
                        var row = result.split("|");
                        for (var i = 0; i < row.length - 1; i++) {
                            if (row[i] != "") {
                                var rrow = row[i].split(",");
                                if (rrow[0] != "") {
                                    var value = rrow[0];
                                }
                                if (rrow[1] != "") {
                                    var text = rrow[1];
                                }

                                var myOptions = {
                                    val: text
                                };
                                var _select = $('<select>');
                                $.each(myOptions, function (val, text) {
                                    _select.append(
                                            $('<option></option>').val(value).html(text)
                                        );
                                });
                                $('#Qstn_Ctgr_Code').append(_select.html());

                                var sel_Text = $("#Qstn_Big_Ctgr_Code option:selected").text();
                                if (sel_Text == "근무환경") {
                                    $("#Qstn_Ctgr_Code >option[value='DZ001']").attr("selected", "selected");
                                }

                                if ($("#Qstn_Big_Ctgr_Code").val() != "" && sel == "1") {
                                    $("#div_qstn_ctgr_code").show();
                                }
                                else {
                                    $("#div_qstn_ctgr_code").hide();
                                }
                            }
                        }
                    }
                }
            });
        });
    });

    // 질문 등록
    $("#btn_indam_q_reg").on("click", function (e) {
        if ($("#Qstn_Big_Ctgr_Code").val() == "") {
            alert("채용일반을 선택해주세요.");
            $("#Qstn_Big_Ctgr_Code").focus();
            return false;
        }

        if ($("#Qstn_Cntnt").val() == "") {
            alert("질문을 등록해주세요.");
            $("#Qstn_Cntnt").focus();
            return false;
        }

        $.ajax({
            type: "POST",
            url: "/Recruit/GI_Read_CommonIndamtalk_Q_Ok",
            data: "Mem_Id=" + cid + "&Gno=" + gno + "&Mem_Type_Code=" + memtype + "&Qstn_Big_Ctgr_Code=" + $("#Qstn_Big_Ctgr_Code").val() + "&Qstn_Ctgr_Code=" + $("#Qstn_Ctgr_Code").val() + "&Qstn_Cntnt=" + escape($("#Qstn_Cntnt").val()) + "&Reg_M_Id=" + mid,
            cache: false,
            success: function (result) {
                $("#div_indamQstnLayer").hide().find("#Qstn_Cntnt").val("").trigger("keyup");
                var searchType = $("#INDAMTalk .talkList").data("searchtype");
                var showAll = $("#indam_showAll").data("showall") || 0;
                var expandAll = $("#indam_expandAll").data("expand") || 0;
                GIReadIndamTalkList("/Recruit/GI_Read_CommonIndamtalk_List?Mem_ID=" + cid + "&Gno=" + gno + "&Mem_Type_Code=" + memtype + "&searchType= " + searchType + "&showAll= " + showAll + "&expandAll= " + expandAll);
            }
        });
    });

    // 답글 토글
    $("#INDAMTalk").on("click", ".girBtnReply", function (e) {
        var $parent = $(this).closest(".question");        
        var $target = $parent.find("#div_indamAnswerLayer");
        if ($target.length > 0) {
            $target.toggle();
        } else {
            var qno = $parent.data("qno");
            $target = $("#div_indamAnswerLayer");
            $target.find("input[name='Q_No']").val(qno);
            $target.find("textarea[name='Answer_Cntnt']").val("").trigger("blur");
            $parent.append($target.show());
        }

        if ($target.is(":visible")) {
            $parent.find(".devIndamQstnTitle").removeClass("case");
        } else {
            $parent.find(".devIndamQstnTitle").addClass("case");
        }
    });

    // 답글 등록
    $("#INDAMTalk").on("click", ".devAnswerReg", function (e) {
        $target = $("#div_indamAnswerLayer");
        if ($("#Answer_Cntnt").val() == "") {
            alert("답변을 등록해주세요.");
            $("#Answer_Cntnt").focus();
            return false;
        }
        var Q_No = $target.find("input[name='Q_No']").val();
        var Answer_Cntnt = $("#Answer_Cntnt").val();

        jQuery.ajax({
            type: "POST",
            url: "/Recruit/GI_Read_CommonIndamtalk_A_Ok",
            data: "Q_No=" + Q_No + "&Qstn_Cntnt=" + escape(Answer_Cntnt),
            cache: false,
            success: function (result) {
                var searchType = $("#INDAMTalk .talkList").data("searchtype");
                var showAll = $("#indam_showAll").data("showall") || 0;
                var expandAll = $("#indam_expandAll").data("expand") || 0;
                GIReadIndamTalkList("/Recruit/GI_Read_CommonIndamtalk_List?Mem_ID=" + cid + "&Gno=" + gno + "&Mem_Type_Code=" + memtype + "&searchType= " + searchType + "&showAll= " + showAll + "&expandAll= " + expandAll);
            }
        });
    });

    // 답글 등록 취소
    $("#INDAMTalk").on("click", ".devAnswerCancel", function (e) {
        if ($("#Answer_Cntnt").val() != "") {
            if (!confirm("입력하신 내용을 취소하시겠습니까?")) {
                return;
            }
            $("#Answer_Cntnt").val("").trigger("keyup");
        }
        $("#div_indamAnswerLayer").hide();
    });

    // 질문 삭제
    $("#INDAMTalk").on("click", ".devDelMyQstn", function (e) {
        if (confirm("해당 글을 삭제하시겠습니까?")) {
            var $parent = $(this).closest(".question");
            var IndamTalkType = $parent.data("indamtalktype");
            var Q_No = $parent.data("qno")

            jQuery.ajax({
                type: "GET",
                url: "/Recruit/GI_Read_CommonIndamtalk_Q_Del",
                data: "IndamTalkType=" + IndamTalkType + "&Q_No=" + Q_No + "&Gno=" + gno + "&Mem_Type_Code=M&Mem_ID=" + mid,
                cache: false,
                success: function (result) {
                    var searchType = $("#INDAMTalk .talkList").data("searchtype");
                    var showAll = $("#indam_showAll").data("showall") || 0;
                    var expandAll = $("#indam_expandAll").data("expand") || 0;
                    GIReadIndamTalkList("/Recruit/GI_Read_CommonIndamtalk_List?Mem_ID=" + cid + "&Gno=" + gno + "&Mem_Type_Code=" + memtype + "&searchType= " + searchType + "&showAll= " + showAll + "&expandAll= " + expandAll);
                }
            });
        }
    });

    // 답글 삭제
    $("#INDAMTalk").on("click", ".devDelAnswer", function (e) {
        if (confirm("해당 글을 삭제하시겠습니까?")) {
            var $question = $(this).closest(".talk").find(".question");
            var $answer = $(this).closest(".answer");
            var IndamTalkType = $question.data("indamtalktype");
            var Q_No = $question.data("qno")
            var Answer_No = $answer.data("answerno");
            jQuery.ajax({
                type: "GET",
                url: "/Recruit/GI_Read_CommonIndamtalk_A_Del",
                data: "IndamTalkType=" + IndamTalkType + "&Q_No=" + Q_No + "&Answer_No=" + Answer_No + "&Gno=" + gno + "&Mem_Type_Code=" + memtype + "&Mem_ID=" + cid,
                cache: false,
                success: function (result) {
                    var searchType = $("#INDAMTalk .talkList").data("searchtype");
                    var showAll = $("#indam_showAll").data("showall") || 0;
                    var expandAll = $("#indam_expandAll").data("expand") || 0;
                    GIReadIndamTalkList("/Recruit/GI_Read_CommonIndamtalk_List?Mem_ID=" + cid + "&Gno=" + gno + "&Mem_Type_Code=" + memtype + "&searchType= " + searchType + "&showAll= " + showAll + "&expandAll= " + expandAll);
                }
            });
        }
    });
});

