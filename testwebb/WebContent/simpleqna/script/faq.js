
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
	}
});

