var join = join || {};

join.corp = {
    type: '',
    test: join.common.get_dev_mode() === 'dev' ? true : false,
    init: function (type) {
        this.type = type || 'gi';
        var c = join.common, m = join.msg;

        // 사업자 번호
        $('.dev-corp-num').only_num()
            .keyup(this.keyup_corp_num)
            .blur(this.check_corp_num);


        // 회사명(서치펌명)
        $('.dev-corp-name').blur({ selector: '.dev-corp-name' }, c.check_empty);
        // 대표자명
        $('.dev-ceo-name').blur({ selector: '.dev-ceo-name' }, c.check_empty);
        // 기업회원 가입일 때 기업 형태 설정
        if (type === 'gi') {
            $('#Corp_Type').change(this.change_corp_type)
                .blur({ selector: '.dev-corp-type', target: '#Corp_Type' }, c.check_empty)
            $('#Contn_Code').change(this.change_nation).blur({ selector: '.dev-land', target: '#Contn_Code' }, c.check_empty)
            $('#Nation_Code').change(function (e) {
                var value = $(this).val();
                if (value === '') {
                    $('.mbr_foreign_type2').find('div.focus').removeClass('focus');
                }
                c.check_empty('.dev-nation', '#Nation_Code');
            }).blur({ selector: '.dev-nation', target: '#Nation_Code' }, c.check_empty)
        }
        else if (type === 'hr') {
            // 서치펌명 팝업
            this.pop_search_name();
        }
        // readonly 속성 가진 input은 포커스 아웃
        $('input').focus(function () {
            if ($(this).is('[readonly]')) {
                $(this).blur();
            }
        });
        // 서브밋
        $('.dev-submit').click(this.submit);
    },
    change_foreign: function (isForeign) {
        var c = join.common;
        $('.company_num').find('i').toggle(!isForeign);
        var $crNum = $('#Corp_RegNum');

        if (isForeign) {
            $('.mbr_zipcode').eq(1).show();
            $('.mbr_zipcode').eq(0).hide().find('input').val('');

            $crNum.val('999-99-99999');
            $crNum.closest('.col_2').addClass('focus').siblings('.col_1').addClass('focus');

            c.toggle_msg('.msg_addr', '', false, 'success');
            c.toggle_msg('#Corp_RegNum', '', false, 'success');
            $('.dev-corp-num').attr('readonly', 'readonly');
        } else {
            $crNum.val('').focus();
            $('.mbr_zipcode').eq(0).show();
            $('.mbr_zipcode').eq(1).hide().find('input').val('');
            $('.dev-corp-num').removeAttr('readonly');
        }
    },
    submit: function () {
        var c = join.common;

        c.check_empty('.dev-corp-type', '#Corp_Type');
        // 외국계이면
        if (join.corp.check_foreign()) {
            c.check_empty('.dev-land', '#Contn_Code');
            c.check_empty('.dev-nation', '#Nation_Code');
            if ($('#Corp_RegNum').val() === '999-99-99999') {
                c.toggle_msg('#Corp_RegNum', '', false, 'success');
            }
        }

        // 기업정보
        if (window.location.href.indexOf('test-reg') > -1 && join.corp.check_foreign()) {

        } else {
            join.corp.check_corp_num();
        }

        c.check_empty('.dev-ceo-name');
        c.check_empty('.dev-corp-name');

        if ((!join.corp.check_foreign() && $('.mbr_zipcode').find('.value').text() === '') || (join.corp.check_foreign() && $('input[name=Addr_Foreign]').val() === '')) {
            c.toggle_msg('.msg_addr', join.msg.required);
        } else {
            c.toggle_msg('.msg_addr', '', false, 'success');
        }
    },
    check_foreign: function () {
        var isForeign =
            $('#Corp_Type').filter(function () {
                return $.inArray(this.value, ['6', '8', '10']) > -1;
            }).length;

        return isForeign > 0;
    },
    // 기업형태 > 외국계 선택
    change_corp_type: function (e) {
        var selector = join.corp.get_selector(e, '#Corp_Type');
        var $type = $(selector);
        if ($type.val() === '') {
            $type.closest('.col_2').siblings('.col_1').removeClass('focus');
        } else {
            join.common.toggle_msg('.dev-corp-type', '', false, 'success');
        }
        var $nation = $('.devNationView');
        var isForeign = join.corp.check_foreign();

        if (isForeign) {
            $('#Nation_Code').val('').html('').attr('disabled', 'disabled');
            $('#Contn_Code').val('');
        } else {
            $('.devNationView .notice_msg').removeClass('failure');
        }
        join.corp.change_foreign(isForeign);
        $nation.toggle(isForeign);
        $nation.find('div.focus').removeClass('focus');
    },
    // 외국계 국가 선택
    change_nation: function (e) {
        var val = $.trim($(this).val());
        $('#Nation_Code')
            .attr('disabled', 'disabled')
            .find('option').not(':first').remove();

        if (val !== '') {
            $.getJSON('/Recruit/Code/Nation', { NationCode: val }, function (data) {
                var option = '<option value=""></option>';

                $.each(data, function (i, v) {
                    option += '<option value=' + v.N_Code + '>' + v.N_Name + '</option>';
                });

                $('#Nation_Code').removeAttr('disabled').append(option);
            });
        }
        join.common.check_empty('.dev-land', '#Contn_Code');
    },
    // 사업자 번호 형식 변경
    keyup_corp_num: function (e) {
        if ($(this).length > 0 && !(e.keyCode === 8 || e.keyCode === 46)) {
            var $corpNum = $(this);
            var corpNum = $corpNum.val();
            var origin = corpNum;
            var len = 0;
            corpNum = corpNum.replace(/-/gi, '');
            len = corpNum.length;
            if (len > 3) {
                corpNum = corpNum.substring(0, 3) + '-' + corpNum.substring(3, len);
                len++;
            }
            if (len > 6) {
                corpNum = corpNum.substring(0, 6) + '-' + corpNum.substring(6, len);
                len++;
            }
            if (len > 12) {
                corpNum = corpNum.substring(0, 12);
            }
            if (origin !== corpNum) $corpNum.val(corpNum);
        }

        $('.dev-corp-name, .dev-ceo-name').removeAttr('readonly');
        join.common.init_zoom();
    },
    check_corp_num: function (e) {
        var c = join.common;
        var m = join.msg;
        var selector = join.corp.get_selector(e, '#Corp_RegNum');
        var bizNo = $(selector).val();

        if (bizNo === '') {
            c.toggle_msg(selector, m.required);
            c.init_zoom();
            return false;
        }

        // 외국계기업 체크        
        if (join.corp.is_foreign() || bizNo === '999-99-99999') {
            c.toggle_msg(selector, '', false, 'success');
            $('#CorpAuthStat').val('Y');
            return false;
        }

        // 서치펌, 파견은 여기서만 확인
        if (!join.corp.check_biz(bizNo)) {
            $('#CorpAuthStat').val('N');
            c.toggle_msg(selector, m.regno.unserviceability)
            return false;
        }

        if (join.corp.type === 'gi') {
            $.ajax({
                url: '/Join/LimitCheck',
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                type: 'POST',
                dataType: 'json',
                data: { Reg_No: bizNo },
                async: false,
                success: function (data) {
                    if (data.arg1 == 1) {
                        c.toggle_msg(selector, m.regno.poor);
                    } else {
                        c.toggle_msg(selector, m.regno.use, true, 'success');

                        if (data.arg3.CorpName) {
                            $('.dev-corp-name').val(data.arg3.CorpName).attr('readonly', 'readonly');
                            c.toggle_msg('.dev-corp-name', '', false, 'success');
                        } else {
                            $('.dev-corp-name').removeAttr('readonly');
                            if ($('.dev-corp-name').val() !== '') {
                                c.toggle_msg('.dev-corp-name', '', false, 'success');
                            }
                        }
                        if (data.arg3.RepName) {
                            $('.dev-ceo-name').val(data.arg3.RepName).attr('readonly', 'readonly');
                            c.toggle_msg('.dev-ceo-name', '', false, 'success');
                        } else {
                            $('.dev-ceo-name').removeAttr('readonly');
                            if ($('.dev-ceo-name').val() !== '') {
                                c.toggle_msg('.dev-ceo-name', '', false, 'success');
                            }
                        }

                        // 정책이 확립되기 전가지 pass 시킴
                        //if (data.arg3.StatusCode === '1') {
                        if (true) {
                            $('#CorpAuthStat').val('Y');
                        }
                        else {
                            c.toggle_msg(selector, m.regno.close);
                            $('#CorpAuthStat').val('U');
                        }
                    }
                }
            });
        }
        else if (Mem_Type === 'EDU') {
            $.ajax({
                url: '/Join/RegNoLimitCheck',
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                type: 'POST',
                dataType: 'json',
                data: { Reg_No: bizNo },
                async: false,
                success: function (data) {
                    var msg = bizNo;
                    if (data.arg1 >= 5) {
                        msg += join.msg.regno.over.replace('#num#', data.arg1);
                        c.toggle_msg(selector, m.regno.close);
                    } else {
                        c.toggle_msg(selector, m.regno.use, true, 'success');
                        if (data.arg2.CorpName) {
                            $('.dev-corp-name').val(data.arg2.CorpName).attr('readonly', 'readonly');
                            c.toggle_msg('.dev-corp-name', '', false, 'success');
                        } else {
                            $('.dev-corp-name').removeAttr('readonly');
                            if ($('.dev-corp-name').val() !== '') {
                                c.toggle_msg('.dev-corp-name', '', false, 'success');
                            }
                        }
                        if (data.arg2.RepName) {
                            $('.dev-ceo-name').val(data.arg2.RepName).attr('readonly', 'readonly');;
                            c.toggle_msg('.dev-ceo-name', '', false, 'success');
                        } else {
                            $('.dev-ceo-name').removeAttr('readonly');
                            if ($('.dev-ceo-name').val() !== '') {
                                c.toggle_msg('.dev-ceo-name', '', false, 'success');
                            }
                        }

                        if (true) {
                            $('#CorpAuthStat').val('Y');
                        }
                        else {
                            c.toggle_msg(selector, m.regno.close);
                            $('#CorpAuthStat').val('U');
                        }
                    }
                }
            });
        } else {
            $('.dev-corp-name, .dev-ceo-name').removeAttr('readonly');
            c.toggle_msg(selector, join.msg.regno.use, true, 'success');
        }
        c.init_zoom();
    },
    // event 면 target 아니면 그대로	
    check_biz: function (e) {
        var c = join.common;
        var m = join.msg;
        var selector = join.corp.get_selector(e, '#Corp_RegNum');
        var bizNo = $(selector).val();
        biz_value = new Array(10);

        if (bizNo === '') {
            c.toggle_msg(selector, m.required);
            return false;
        }
        //추가 2007-09
        if (bizNo == '444-44-44444' || bizNo == '888-88-88888') {
            c.toggle_msg(selector, m.regno.unserviceability);
            return false;
        }

        var li_temp, li_lastid;

        if (bizNo.length == 12) {
            biz_value[0] = (parseFloat(bizNo.substring(0, 1)) * 1) % 10;
            biz_value[1] = (parseFloat(bizNo.substring(1, 2)) * 3) % 10;
            biz_value[2] = (parseFloat(bizNo.substring(2, 3)) * 7) % 10;
            biz_value[3] = (parseFloat(bizNo.substring(4, 5)) * 1) % 10;
            biz_value[4] = (parseFloat(bizNo.substring(5, 6)) * 3) % 10;
            biz_value[5] = (parseFloat(bizNo.substring(7, 8)) * 7) % 10;
            biz_value[6] = (parseFloat(bizNo.substring(8, 9)) * 1) % 10;
            biz_value[7] = (parseFloat(bizNo.substring(9, 10)) * 3) % 10;
            li_temp = parseFloat(bizNo.substring(10, 11)) * 5 + '0';
            biz_value[8] = parseFloat(li_temp.substring(0, 1)) + parseFloat(li_temp.substring(1, 2));
            biz_value[9] = parseFloat(bizNo.substring(11, 12));
            li_lastid = (10 - ((biz_value[0] + biz_value[1] + biz_value[2] + biz_value[3] + biz_value[4] + biz_value[5] + biz_value[6] + biz_value[7] + biz_value[8]) % 10)) % 10;
            if (biz_value[9] != li_lastid) {
                c.toggle_msg(selector, m.regno.unserviceability);
                return false;
            }
            else {
                c.toggle_msg(selector, m.regno.use, true, 'success', 2);
                return true;
            }
        }
        else {
            c.toggle_msg(selector, m.regno.unserviceability);
            return false;
        }
    },
    is_foreign: function () {
        var isForeign =
            $('#Corp_Type').filter(function () {
                return $.inArray(this.value, ['6', '8', '10']) > -1;
            }).length;
        return isForeign > 0;
    },

    cb_address: function (zipCode, baseAddress, addAddress, addressType, detailAddress) {
        var $addr = $('.input-profile-addr');
        var addr = join.common.format('({0}) {1} {2}', zipCode, baseAddress, detailAddress);
        if (!$addr.hasClass('.is-value')) {
            $addr.addClass('is-value');
        }

        $("#Zip_Code").val(zipCode);
        $("#Add_Addr").val(addAddress);
        $("#Addr_Type").val(addressType);
        $("#Addr_Text").val(baseAddress);
        $("#Addr_Text1").val(detailAddress);

        $addr.find('div.value').html(addr);

        join.common.toggle_msg('.msg_addr', '', false, 'success');
    },
    // 서치펌 선택 팝업
    pop_search_name: function () {
        $('.dev-pop-search,.dev-corp-name').click(function () {
            var win = window.open('SF_Search_Pop', 'SF_Search_Pop', 'width=552,height=425,scrollbars=yes,left=300,top=150');

            win.focus();
        })
    },
    set_search_name: function (sName, ceoName, idx) {
        var isEmptyCeoName = ceoName === '';
        var isEmptyCorpName = sName === '';
        if (!isEmptyCorpName) {
            var $corpName = $('.dev-corp-name');
            $corpName.val(sName);
            $corpName.closest('.col_2').toggleClass('focus', !isEmptyCorpName).siblings('.col_1').toggleClass('focus', !isEmptyCorpName);

            join.common.toggle_msg('.dev-corp-name', '', false, 'success');
        }
        if (!isEmptyCeoName) {
            var $ceoName = $('.dev-ceo-name');
            $ceoName.val(ceoName);
            $ceoName.closest('.col_2').toggleClass('focus', !isEmptyCeoName).siblings('.col_1').toggleClass('focus', !isEmptyCeoName);

            join.common.toggle_msg('.dev-ceo-name', '', false, 'success');
        }
        $('#S_IDX').val(idx);
    },
    check_search_name: function () {
        var isFocus = $(this).val() !== '';
        $(this).closest('.col_2').toggleClass('focus', isFocus);
        $(this).closest('.col_2').siblings('.col_1').toggleClass('focus', isFocus);
    }
}