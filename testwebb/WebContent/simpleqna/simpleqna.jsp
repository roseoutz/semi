<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%@ taglib prefix="s" uri="/struts-tags" %>
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
						<li><a>FAQ</a>
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
						<li><a href="#" target="_blank">아이디∙비밀번호 찾기<span class="lnbFile"></span></a></li>
						<s:if test="#session.session_type=='기업'">
						<li><a href="javascript:open_win_noresizable('checkForm.action?cmember_id=<s:property value="#session.session_id"/>&member_type=corp')" class="">회원탈퇴</a></li>
						</s:if>
						<s:else>
						<li><a href="javascript:open_win_noresizable('checkForm.action?member_id=<s:property value="#session.session_id"/>&member_type=gen')" class="">회원탈퇴</a></li>
						</s:else>
					</ul>
			</div>
		</section>
		<iframe name="frameUpload" width="0" height="0" title="빈 프레임"></iframe>
	<div class="loungeContent faqContent">
		<div class="topHdWrap clear">
			<h2 class="lug_hd_2">FAQ</h2>
			<form action="simpleqna.action">
				<fieldset>
					<legend>키워드 검색</legend>
					<div class="searchBarItem mtcPlaceholder">
						<!-- input 포커스시 .phTx hide -->
						<span class="phTx">키워드 검색</span> <input type="text" id="lb_sch"
							class="mtcSchInp" title="검색어 입력" name="keyword">
						<button type="submit" class="mtcBtnB mtcSchBtn">
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
					<s:iterator value="list" status="stat">
					<li class="">
						<button type="button" class="lugBtnA lugBtnMore tabSearchListTitle devFaqItem tplBtnMore" id="btn">
							<span
								class="cl3399ff"><s:property value="qa_subject"/></span>
						</button>
						<!--[개발] tplBtn tplBtnMore => lugBtnA lugBtnMore 클래스명 수정, 클릭 시 tplBtnCls_3 => on 클래스명 수정 -->
						<div class="searchListData" style="display: none;" id="sld">
							<s:property value="qa_content"/>
						</div>
					</li>
					</s:iterator>
					<s:if test="list.size()<=0">
					<li class="">
						<button type="button" class="lugBtnA lugBtnMore tabSearchListTitle devFaqItem tplBtnMore" id="btn">
							<span
								class="cl3399ff">등록된 게시물이 없습니다.</span>
						</button>
						<!--[개발] tplBtn tplBtnMore => lugBtnA lugBtnMore 클래스명 수정, 클릭 시 tplBtnCls_3 => on 클래스명 수정 -->
						<div class="searchListData" style="display: none;">
							test
						</div>
					</li>
					</s:if>
				</ul>
			</div>
			<div class="listBtmArea">
				<div class="tplPagination">
					<div class="tplPagination">
						<ul>
							<s:property value="pagingHtml" escape="false"/>
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
