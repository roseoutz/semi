var join = join || {};
join.msg = {
    required: "필수 정보입니다.",
    agree: "잡코리아 회원약관과 개인정보 수집 및 이용에 대한 안내를 모두 동의해주세요.",

    id: {
        overlap: "이미 사용중인 아이디입니다.",
    //   incongruent: "6~16자의 영문 소문자, 숫자만 사용 가능합니다.",
        poor: "사용하실 수 없는 아이디입니다.",
        use: "사용 가능한 아이디입니다."
    },
    pwd: {
        unserviceability: "사용불가 (안전도 등급 매우 약함)",
        low: "사용가능 (안정도 등급 낮음)",
        optimal: "사용가능 (안전도 등급 적정)",
        high: "사용가능 (안전도 등급 높음)"
    },
    pwd2: {
        discord: "비밀번호가 일치하지 않습니다."
    },
    regno: {
        poor: "가입하실 수 없는 사업자등록번호입니다.",
        unserviceability: "올바르지 않은 사업자등록번호입니다.",
        close: "정상 운영되지 않는 사업자등록번호입니다.",
        certification: "인증이 필요합니다.",
        over: "로 등록된 ID는 #num#개입니다. 등록하실 수 없습니다.",
        under: "로 등록된 ID는 #num#개입니다. 등록 가능 합니다.",
        use: "등록 가능합니다."
    },
    c_name: {
        unserviceability: "회사명에 -+()[]%&,.㈜㈔'/ 이외의 특수문자는 입력하실 수 없습니다."
    },
    edu_name: {
        unserviceability: "교육기관명에 특수문자는 입력하실 수 없습니다."
    },

    email: {
        unselected: "이메일 정보를 다시 확인해주세요."
    }
}

// UI
join.common = {
    type: '',
    obj_time: null,
    selector_name: '',
    init: function (type) {
        this.type = type || 'gi';
        // 약관 체크박스 선택
        this.check_policy();
        // 약관 보기 닫기
        this.toggle_policy();
        // 안내 레이어
        this.help_layer();
        // 셀렉트박스 선택
        this.change_select();
        // ? 안내 레이어
        this.help_area();
        // 비밀번호 표시/비표시
        this.toggle_password();
        // Label Zoom 효과
        this.zoom_label();
        // input Zoom Init
        this.init_zoom();
        // extend jquery func
        this.func_jquery();
    },
    get_selector_name: function () {
        if (join.common.type === 'edu') {
            return '#Edu_Name'
        } else if (join.common.type === 'hr') {
            return '#S_Name'
        } else {
            return '#Corp_Name'
        }
    },
    //사업자 등록번호 체크
    /* [입력 값 경고 메세지 토글]
     p1 : {string} jquery selector or array(ex : [selector1, selector2....] (input)
     p2 : {bool  } true, false
     p4 : {bool  } value init
     rt : {void}  */
    toggle_disabled: function (selector, flag, init) {
        var arr = new Array();
        if (_.isArray(selector)) {
            arr = selector;
        } else {
            arr.push(selector);
        }

        for (var index in arr) {
            $(arr[index]).attr('disabled', flag ? 'disabled' : '');
            if (init) {
                $(arr[index]).val('');
            }
        }
    },
    check_toggle: function (obj) {
        var $ckb = $(obj);
        var isOn = $ckb.is(':checked');

        if ($ckb.siblings('label').length > 0) {
            $ckb.siblings('label').toggleClass('on', isOn);
        }
    },
    // 약관 체크박스 선택
    check_policy: function () {
        var that = this;
        $('div.line_all input[type=checkbox]').on('change', function (e) {
            var totalCkbCnt = $('div.policy').find('input[type=checkbox]').length - 1;
            if ($(this).attr('id') === 'lb_chk_all') { // 모두 동의
                var $checkbox = $('.policy input[type=checkbox]')

                var isChecked = $(this).is(':checked');
                $checkbox.prop('checked', isChecked).siblings('label').toggleClass('on', isChecked);
            } else { // 개별 선택
                that.check_toggle(this);
                $(this).siblings('label').toggleClass('on', $(this).is(':checked'));

                var isChecked = totalCkbCnt == $('div.policy').find('input[type=checkbox]:checked').not('#lb_chk_all').length;
                $("#lb_chk_all").prop('checked', isChecked);
                $(".chk_all").toggleClass('on', isChecked);
            }
            if (!$("input:checkbox[id='lb_chk_service']").is(':checked') || !$("input:checkbox[id='lb_chk_privacy']").is(':checked')) {
                that.toggle_msg('#notice_msg_agree', join.msg.agree);
                return false;
            }
            else {
                that.toggle_msg('#notice_msg_agree', '', false, 'success');
            }
        });
    },
    toggle_policy: function () {
        // 약관보기/닫기
        $('.mbrBtnPolicy').on('click', function (e) {
            join.common.stop_event(e);
            var isOn = !$(this).hasClass('on');
            var strText = isOn ? '약관닫기' : '약관보기';
            $(this).toggleClass('on', isOn).text(strText).closest('label').next().toggle(isOn);
        });
    },
    help_layer: function () {
        $('.btnHelp').on('click', function () {
            var $row = $(this).parents('.row');
            var $lyHelp = $(this).next('.lyHelp');
            var $historyZindex = $row.css('z-index');
            $lyHelp.toggle();
            if ($lyHelp.css('display') == 'block') {
                $row.attr('data-zindex', $historyZindex).css('z-index', '9100');
            } else {
                $historyZindex = $row.attr('data-zindex');
                $row.removeAttr('data-zindex').css('z-index', $historyZindex);
            }
        });
    },
    change_select: function () {
        $('select').on('change', function () {
            $(this).toggleClass('selected', $(this).val() == '');
        });
    },
    // 회원가입 중에 오류가 날 때 zoom 관련 css 초기화 되어 다시 설정
    init_zoom: function () {
        $('input[type=text], input[type=password]').each(function () {
            if ($(this).val() !== '') {
                // label focus
                $(this).closest('.col_2').addClass('focus').siblings('.col_1').addClass('focus');
            } else {
                $(this).closest('.col_2').removeClass('focus').siblings('.col_1').removeClass('focus');
            }
        });
    },
    help_area: function () {
        var $validity = $('.mbr_validity'),
        $buttonHelp = $validity.find('.buttonHelp'),
        $popup = $validity.find('.popup'),
        $pos = {
            x: $buttonHelp.position().left,
            y: $buttonHelp.position().top,
        };

        $popup.css({
            left: ($pos.x - 5) + 'px',
            top: ($pos.y + 31) + 'px'
        });

        $buttonHelp.on('click', function () {
            $popup.toggleClass('hidden').attr('aria-hidden', function (i, attr) {
                return attr == 'true' ? 'false' : 'true';
            });
        });
    },
    toggle_password: function () {
        $('.dev-password-dp').click(function () {
            var $pwd = $('.dev-password');
            if ($pwd.attr('type') === 'password') {
                $pwd.attr('type', 'text');
                if (this) {
                    $(this).addClass('selected').find('span').text('숨김');
                }
            }
            else {
                $pwd.attr('type', 'password');
                if (this) {
                    $(this).removeClass('selected').find('span').text('표시');
                }
            }
        })
    },
    // Label Zoom 효과
    zoom_label: function () {
        var $input = $('.row').find('input[type="text"], input[type="password"]');
        $input.on({
            'focus': function () {
                $(this).parent().addClass('focus').siblings('.col_1').addClass('focus');
            },
            'blur': function () {
                if ($(this).val() == '') {
                    $(this).parent().removeClass('focus').siblings('.col_1').removeClass('focus');
                } else {
                }
            }
        });
        var $select = $('.row').find('select');
        $select.on({
            'change': function () {
                $(this).parents().addClass('focus').siblings('.col_1').addClass('focus');
            }
        });
    },
    stop_event: function (e) {
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
    },
    // c# string.format > ex : "{0}년{1}월".format(2016, 1), result: "2016년1월"
    format: function (foramt) {
        var vString = foramt;
        for (var i = 0; i < arguments.length - 1; i++) {

            var regEx = new RegExp("\\{" + i + "\\}", "gm");
            vString = vString.replace(regEx, arguments[i + 1]);
        }
        return vString;
    },
    func_jquery: function () {
        $.fn.only_num = function () {
            return this.each(function () {
                $(this).keydown(function (e) {
                    var key = e.charCode || e.keyCode || 0;
                    // allow backspace, tab, delete, enter, arrows, numbers and keypad numbers ONLY
                    // home, end, period, and numpad decimal
                    return (
                        key == 8 ||
                        key == 9 ||
                        key == 13 ||
                        key == 46 ||
                        key == 110 ||
                        key == 190 ||
                        (key >= 35 && key <= 40) ||
                        (key >= 48 && key <= 57) ||
                        (key >= 96 && key <= 105));
                })
            })
        }
    },
    get_dev_mode: function () {
        // 개발모드
        var host = window.location.hostname;
        var urls = host.split(".");
        var domain = '', mode = '';
        if (urls.length > 0) {
            domain = urls[0];
        }

        if (domain === 'dev' || domain === 'devjts') {
            mode = 'dev';
        } else if (domain.indexOf('jts') > -1) {
            mode = 'jts';
        } else {
            mode = 'www';
        }
        return mode;
    }
}
