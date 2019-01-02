var JKLoginLayer = (function ($) {
    var JKLoginLayer = {
        open: function (reUrl) {
            var stat = false;
            url = window.location.protocol + '//' + window.location.host + "/Login/M_Frame_LoginLayer";
            data = { "re_url": reUrl };
            $.ajax({
                url: url,
                data: data,
                cache: false
            }).done(function (res) {
                if ($.trim(res) != "") {
                    JKLoginLayer.close();
                    $("body").append(res).find("#lyOnLogin").css("left", "-9999px");
                    JKLoginLayer.resize();
                } else {
                    stat = true;
                }
            });
            return stat;
        },
        close: function () {
            $("#lyOnLogin").remove();
        },
        resize: function (_height) {
            var jQuerydiv = $("body").find("#lyOnLogin");
            var jQueryobj = $("#onPassApply_Frame");

            jQueryobj.css("height", _height);

            var isIE = navigator.userAgent.toLowerCase().indexOf("msie") !== -1;

            if (isIE) {
                var $width = window.innerWidth ? window.innerWidth : $(window).width();
                var $height = window.innerHeight ? window.innerHeight : $(window).height();

                var jQueryleft = $(window).scrollLeft() + ($width - jQueryobj.width()) / 2;
                var jQuerytop = $(window).scrollTop() + ($height - jQuerydiv.height()) / 2;
            } else { // 모바일 사파리에서 window 사이즈 틀리게 나와서 window.top으로 수정
                var topWindow = window.top;
                var $width = topWindow.innerWidth ? topWindow.innerWidth : $(topWindow).width();
                var $height = topWindow.innerHeight ? topWindow.innerHeight : $(topWindow).height();

                var scrollTop = $(window).scrollTop();
                var scrollLeft = $(window).scrollLeft();

                if (scrollTop === 0) {
                    scrollTop = $(topWindow).scrollTop();
                }
                if (scrollLeft === 0) {
                    scrollLeft = $(topWindow).scrollLeft();
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
    }

    return JKLoginLayer;
})(jQuery);

