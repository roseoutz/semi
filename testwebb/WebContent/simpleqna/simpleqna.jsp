<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<body id="secHelp" class="helpMain" style="">
<div id="wrap">
	<div id="container" class="sideTure">
		<div id="content" style="width:960px; margin:auto;">
		<h1 class="skip">고객센터 메뉴</h1>
		<section class="secLnb">
			<h1>
				<span class="skip">고객센터 메뉴 - </span><a class="lnbTit" href="/help/">고객센터</a>
			</h1>
			<div class="lnbGroup">
				<ul>
						<li><a href="#">FAQ</a>
							<ul class="lnbTwoDep">
								<li><a href="qna.action" class="">1:1 문의하기</a></li>
								<li><a href="simpleqna.action" class="">자주 묻는 질문</a></li>
							</ul></li>
					</ul>
				</div>
				<div class="lnbGroup">
					<ul>
						<li><a href="notice.action" class="">공지사항</a></li>
					</ul>
				</div>
			<div class="lnbGroup">
				<ul>
					<li><a href="#" target="_blank">아이디∙비밀번호 찾기<span
							class="lnbFile"></span></a></li>
					<li><a href="#" class="">회원탈퇴</a></li>
				</ul>
			</div>
		</section>
		<iframe name="frameUpload" width="0" height="0" title="빈 프레임"></iframe>
	<div class="loungeContent faqContent">
		<div class="topHdWrap clear">
			<h2 class="lug_hd_2">FAQ</h2>
			<form action="http://www.jobkorea.co.kr/help/faq/user#">
				<fieldset>
					<legend>키워드 검색</legend>
					<div class="searchBarItem mtcPlaceholder">
						<!-- input 포커스시 .phTx hide -->
						<span class="phTx">키워드 검색</span> <input type="text" id="lb_sch"
							class="mtcSchInp" title="검색어 입력">
						<button type="button" class="mtcBtnB mtcSchBtn">
							<span class="skip">검색</span>
						</button>
					</div>
				</fieldset>
			</form>
		</div>
		<div class="faqWrap">

			<div class="mtcTplTab">
				<ul class="tabItems">
					<li class="on"><a
						href="#">자주 묻는 질문</a></li>
				</ul>
			</div>

			<div class="tabSearchList">
				<ul>
					<li data-no="101" class="">
						<button type="button"
							class="lugBtnA lugBtnMore tabSearchListTitle devFaqItem tplBtnMore">
							<span class="tabSearchListTitleWrap"><span
								class="cl3399ff">[category]</span>subject</span>
						</button>
						<!--[개발] tplBtn tplBtnMore => lugBtnA lugBtnMore 클래스명 수정, 클릭 시 tplBtnCls_3 => on 클래스명 수정 -->
						<div class="searchListData" style="display: none;">
							test
						</div>
					</li>
				</ul>
			</div>
			<input type="hidden" id="SelectedFAQNo" name="SelectedFAQNo"
				value="0">
			<div class="listBtmArea">
				<div class="tplPagination">
					<div class="tplPagination">
						<ul>
							<li><span class="now">1</span></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="questBtnArea">
				<p class="txtQuest">원하시는 답변을 찾지 못하셨다면, 고객센터에 문의해주세요.</p>
				<a class="btnQuest" href="qna.action"
					target="_self">문의하기</a>
			</div>
		</div>
	</div>
		</div>
	
	</div>
	</div>
