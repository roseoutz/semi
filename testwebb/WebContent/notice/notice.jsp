<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<body id="secHelp" class="helpMain">
<div id="wrap">
	<div id="container">
		<div id="content" style="width:960px; margin:auto;">
		<h1 class="skip">고객센터 메뉴</h1>
			<section class="secLnb">
				<h1>
					<span class="skip">고객센터 메뉴 - </span><a class="lnbTit">고객센터</a>
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
			<div class="loungeContent noticeListContent">
				<div class="topHdWrap clear">
					<h2 class="lug_hd_2">공지사항</h2>
					<form action="#">
						<fieldset>
							<legend>공지사항 검색</legend>
							<div class="searchBarItem mtcPlaceholder">
								<span class="phTx">키워드 검색</span> <input type="text" id="lb_sch" class="mtcSchInp" title="검색어 입력">
								<button type="button" class="mtcBtnB mtcSchBtn">
									<span class="skip">검색</span>
								</button>
							</div>
						</fieldset>
					</form>
				</div>
				<div class="schListWrap">
					<div class="mtcSchListTb">
						<table summary="">
							<caption>공지사항</caption>
							<colgroup>
								<col class="col_1">
								<col class="col_2">
								<col class="col_3">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">글번호</th>
									<th scope="col">제목</th>
									<th scope="col">날짜</th>
								</tr>
							</thead>
							<tbody>
							<!-- 공지사항  -->
							<s:iterator value="list" status="stat">
								<s:url id="viewURL" action="noticeView"> <!-- id는 생성된 URL을 사용하기 위한 이름, action의 viewAction은 클릭시 발생할 이벤트 -->
									<s:param name="no">
										<s:property value="notice_no"/>
									</s:param>
								</s:url>
								<tr>
									<td class="sort" style="text-align:center;"><s:property value="notice_no"/></td>
									<td class="alLeft" style="text-align:center;"><span class="tit"><s:a href="%{viewURL}"><s:property value="notice_subject"/></s:a></span></td>
									<td class="date"><s:property value="notice_regdate"/></td>
								</tr>
							</s:iterator>
							<s:if test="list.size()==0">
								<tr>
									<td class="sort"></td>
									<td class="alLeft"><span class="tit"><a href="#">게시글이 존재하지 않습니다.</a></span></td>
									<td class="date"></td>
								</tr>
							</s:if>
							</tbody>
						</table>
	
						<div class="listBtmArea">
							<div class="tplPagination">
	
	
								<ul>
	
									<s:property value="pagingHtml" escape="false"/>
								</ul>
								</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>