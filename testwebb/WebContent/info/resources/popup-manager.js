$(document).ready(function () {
    var ajaxOption = {
        url: '/User/Common/PMStat',
        method: 'get',
        cache: false
    };
    $.ajax(ajaxOption).done(function (res) {
        if (typeof res !== 'undefined' && res !== '' && res != '0') {
            setTimeout(res, 1);
        }
    });
});