$(function () {
    // 인증 - 선택
    $(".devCertifySelBtn").click(function () {
        var $parent = $(this).parent();

        if ($parent.hasClass("on") ) {
            return;
        }

        $(".devCertifySelBtn").parent()
            .removeClass("on")
            .find(".row").hide();

        $parent.addClass("on");
        $(this).next().show();

        $(".devPopAuthMobileCloseBtn").click();
    });

    // 인증 - 하기
    $(".devCertifyBtn").click(function (e) {
        var type = $(this).data("certify-type");
        $("#CertifyType").val(type);

        if (type === "nophone") {
            join.certify[type]["send"]();
        } else {
            join.certify[type]();
        }        
    });

    // 인증 - 본인명의 아닐경우 - 확인
    $(".devCertifyCompleteBtn").click(function () {
        join.certify.nophone.confirm();
    });

    // 인증 - 본인명의 아닐경우 Open
    $(".devNoPhoneSelBtn").click(function () {
        $(".devPopAuthMobile").toggle();
    });

    // 인증 - 본인명의 아닐경우 - 휴대폰 번호 입력    
    $(document).on({
        keydown: function (e) {
            join.common.onlyRegEx($(this), e);
        },
        keyup: function (e) {
            join.common.onlyRegEx($(this), e);
        },
        focusin: function (e) {
            $(this).css("imeMode", "disabled");
        },
        "input paste": function (e) {
            $(this).keydown();
        }
    }, "#lb_pop_phone2, #lb_pop_phone3, #lb_pop_certify");

    // 인증 - 본인명의 아닐경우- 창닫기
    $(".devPopAuthMobileCloseBtn").click(function () {
        $(".devPopAuthMobile").hide();
    });
});

var join = join || {};

join.certify = {
    // 인증완료
    type : function () {
        if ($.trim($("#Mobile_Encrypt").val()) !== "") {
            return "phone";
        }else if ($.trim($("#CertifyCode").val()) !== "") {
            return "nophone";
        } else if($.trim($("#DI_Code").val()) !== "") {
            return "ipin"
        }

        return "";
    },
    // 휴대폰 - 본인인증
    phone: function () {
        var url = "/Certify/Mobile";

        var param = "?nHTTP_HOST=" + window.JkDomainHttps;
            param += "&nPath_Info=" + location.pathname;
            param += "&Mem_Type=" + Mem_Type;
            param += "&Oem_No=" + Oem_No;
            
        var win = window.open(url + param, "KMCISWindow", "top=100, left=200, status=0, width=425, height=550" );
        win.focus();
    },
    // 휴대폰 - 인증완료
    phoneComeplete: function (Phone_No, Mem_Name, Mem_Ident) {
        var _self = this;

        // 기업회원 1일 가입 제한
        $.ajax({
            url: "/Certify/RegDIChk?Mem_Type=" +  $("#Mem_Type").val(),
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            type: "POST",
            dataType: "json",
            cache: false,
            success: function (data) {
                if (data == 10) {
                    alert("회원가입은 1일 2회만 가능합니다. \n고객센터 문의 : 1588-9350");                                                
                } else {
                    $("#Mem_HPhone").val(Phone_No);
                    $("#Mem_Name").val(Mem_Name).attr("readonly", "readonly");
                    $("#Mem_Ident").val(Mem_Ident);

                    _self.complete(true);
                }
            }, error: function (e) {
                console.log(e);
            }
        });        
    },
    // 휴대폰 - 기기인증
    nophone: {        
        sendParam: "",
        valid: function () {
            var valid = [
                { field: "#lb_pop_name", msg: "가입자명을" },
                { field: "#lb_pop_phone2", msg: "휴대폰 번호를" },
                { field: "#lb_pop_phone3", msg: "휴대폰 번호를" }
            ];

            var isValid = true;
            var $this;
            var phone = $("#lb_pop_phone1").val();

            $.each(valid, function (i, v) {
                $this = $(v.field);

                if ($.trim($this.val()) === "") {
                    isValid = false;
                    alert(v.msg + " 입력해 주세요.");
                    $this.focus();
                    return false;
                } else {
                    if (i > 0) phone += "-".concat($this.val());
                };
            });
            
            if (isValid) {
                this.sendParam = "CertifyNum=" + $("#lb_pop_certify").val() + "&Mem_Type=" + Mem_Type + "&OEM_No=" + $("#OEM_No").val() + "&CertifytySvc=" + CertifytySvc + "&Certifytype=2&UserMobile=" + phone;                
            }
            return isValid;
        },
        // 인증번호 전송
        send: function () {
            if (this.valid()) {
                $("#CertifyCode").val("");

                if ($("#getCertifynum").val() != "1" || $("#ReSubmit").val() == "1") {
                    
                    $.ajax({
                        url: "/Certify/PhoneEmailCertifyNumCall",
                        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                        type: "POST",
                        dataType: "json",
                        data: this.sendParam,
                        cache: false,
                        success: function (data) {
                            if (data.ReturnCode == 2) {  //휴대폰

                                $(".devCertifyBtn[data-certify-type='nophone']")
                                    .addClass("btnAuth_1").children().text("인증번호 재전송");

                                if ($("#ReSubmit").val() == "1") {
                                    alert("인증번호가 재전송되었습니다.");
                                } else {
                                    alert("입력하신 휴대폰으로 인증번호가 발송되었습니다.\n\n인증번호 확인 후 입력해 주세요.");
                                }

                                $("#getCertifynum").val("1");
                                $("#ReSubmit").val("1");
                                $("#lb_pop_certify").removeAttr("disabled").val("").focus();
                            } else if (data.ReturnCode == 20) { //휴대폰 인증 1일 5회 이상인 경우
                                alert("휴대폰 인증은 1일 5회까지만 가능합니다.");
                                return false;
                            }
                        }
                    });
                }
            }
        },
        // 인증번호 확인 
        confirm: function () {

            var phone = $("[name^=lb_pop_phone]").map(function () {
                return $(this).val();
            }).get().join("-");
            
            this.sendParam = "CertifyNum=" + $("#lb_pop_certify").val() + "&Mem_Type=" + Mem_Type + "&OEM_No=" + $("#OEM_No").val() + "&CertifytySvc=" + CertifytySvc + "&Certifytype=2&UserMobile=" + phone;

            $("#CertifyCode").val("");

            if ($.trim($("#lb_pop_certify").val()) === "" || $("#lb_pop_certify").val().length < 6) {
                alert("인증번호 6자리를 입력해 주세요.");
                $("#lb_pop_certify").val("").focus();
            } else {
                
                $.ajax({
                    url: "/Certify/PhoneEmailCertifyResult",
                    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                    type: "POST",
                    dataType: "json",
                    data: this.sendParam,
                    cache: false,
                    success: function (data) {
                        if (data.ReturnCode == 1) {
                            alert("인증되었습니다.");
                            $("#CertifyCode").val(data.CertifyCode);
                            $(".devPopAuthMobileCloseBtn").click();

                            $("#Mem_Name").val($("#lb_pop_name").val());
                            join.certify.complete(true);
                        } else {
                           alert("인증번호가 맞지 않습니다. 다시 확인해 주세요.");
                           $("#lb_pop_certify").val("").focus();
                        }
                    }
                });
            }
        }
    },
    // 아이핀
    ipin: function () {
        var url = "/Certify/IPinPassPop?Mem_Type=" + Mem_Type;

        var win = window.open(url, 'popupCertKey', 'width=450, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
        win.focus();
    },
    complete: function (isMobile)
    {
        var $obj = isMobile ? $(".devCertifyPhone") : $(".devCertifyIpin");
        var message = isMobile ? '휴대폰' : '아이핀';
        message = message + '인증이<br>완료되었습니다.';

        $obj.parent().addClass('completed').find('.description').html(message);
        $obj.unbind('click');

        if ($.trim($("#Mem_Name").val()) !== "") {
            join.common.toggle_msg('#Mem_Name', '', false, 'success');
        }

        var $name = $("#Mem_Name");
        $name.closest('.col_2').toggleClass('focus', $name.val() !== '');
        $name.closest('.col_2').siblings('.col_1').toggleClass('focus', $name.val() !== '');
    }
};