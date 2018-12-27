$(document).ready(function (e) {
	init();

    $(".btnQuest").click(function () {
    	var CurrentUrl = getUrl().toLowerCase();
    	if (CurrentUrl.indexOf("corp/lounge/faq") > 0)
    		location.href = '/corp/lounge/inquiry';
    	else
    	    location.href = '/help/inquiry';
    });

	// '취소' 버튼
    $('.btnCancel').click(function () {
    	var CurrentUrl = getUrl().toLowerCase();
    	if (CurrentUrl.indexOf("corp/lounge/inquiry") > 0)
    		location.href = '/corp/lounge/news';
    	else
    	    location.href = '/help/';
    });

	// 검색어 창에 안내문구 표시여부 판단
    $("#lb_sch").focus(function () {
    	$(".phTx").hide();
    });
    $("#lb_sch").blur(function () {
    	txShowHide();
    });

	// 검색어 엔터키 처리
    $("#lb_sch").keydown(function (event) {
    	if (event.keyCode == 13) {
    		event.preventDefault();
    		$(".mtcSchBtn").trigger("click");
    	}
    });

	// 검색 버튼
    $(".mtcSchBtn").click(function () {
    	var url = getUrl();

    	url += "?Page=1&tab=" + getParam("tab") + "&searchWord=" + encodeURIComponent($("#lb_sch").val());
    	location.href = url;
    });

    $(".searchListData img").each(function () {
    	if ($(this).attr("alt") === undefined)
    		$(this).attr("alt", "");
    }); 

}); //end.$(document).ready(function (e) {

function UpdateFaqRead(num) {
    // 입력 Ajax
    $.ajax({
        type: "get"
        , url: "/Help/faq/UpdateFaqRead/v?Faq_No" + num
        , success: function (data) { }
        , error: function (xhr) { alert("입력에 실패하였습니다. 잠시 후 다시 시도해주세요"); }
    });
}

var init = function () {
	txShowHide();

	if ($("#SelectedFAQNo").val() != "0")
		$("li[data-no=" + $("#SelectedFAQNo").val() + "]").find("button").trigger("click");
}

var txShowHide = function () {
	if ($("#lb_sch").val().length == 0)
		$(".phTx").show();
	else
		$(".phTx").hide();
}

var getUrl = function () {
	var href = location.href;

	var url = href;
	if (location.href.indexOf("?") > 0)
		url = href.substr(0, href.indexOf("?"));

	return url;
}

var getParam = function (pName) {
	var param = "";

	var href = location.href;
	if (href.indexOf("?") > 0) {
		var params = href.substr(href.indexOf("?") + 1, href.length).split("&");
		for (i = 0; i < params.length; i++) {
			if (params[i].split("=")[0].toUpperCase() == pName.toUpperCase()) {
				param = decodeURIComponent(params[i].split("=")[1]);
			}
		}
	}

	return param;
}

$('.devFaqItem').click(function () {
	var $li = $(this).parent();

	if ($li.is('.on')) {
		$li.removeClass('on');
		$li.find('button').removeClass('tplBtnCls_3').addClass('tplBtnMore');
		$li.find('.searchListData').hide();
	}
	else {
		var $ul = $(this).closest('ul');
		$ul.find('li').removeClass('on');
		$ul.find('button').removeClass('tplBtnCls_3').addClass('tplBtnMore');
		$ul.find('.searchListData').hide();

		$li.addClass('on');
		$li.find('button').removeClass('tplBtnMore').addClass('tplBtnCls_3');
		$li.find('.searchListData').show();

		$('html, body').animate({ scrollTop: $li.offset().top }, 200);

		// FAQ 읽음 처리
		$.ajax({
			type: 'post',
			data: { Faq_No: $li.data('no') },
			url: '/help/faq/UpdateFaqRead',
			success: function () {
			}
		});
	}
});
