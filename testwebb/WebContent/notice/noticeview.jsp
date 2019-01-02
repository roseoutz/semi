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
						<li><a href="#" target="_blank">아이디∙비밀번호 찾기<span
								class="lnbFile"></span></a></li>
						<li><a href="#" class="">회원탈퇴</a></li>
					</ul>
				</div>
			</section>
			<div class="loungeContent noticeListContent">
				<div class="topHdWrap clear">
					<h2 class="lug_hd_2">공지사항</h2>
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
								<tr>
									<td class="sort"><s:property value="resultClass.notice_no"/></td>
									<td class="alLeft" style="text-align:center;"><s:property value="resultClass.notice_subject"/></td>
									<td class="date"><s:property value="resultClass.notice_regdate"/></td>
								</tr>
								<tr>
								<td colspan="3" style="text-align:left;"><s:property value="resultClass.notice_content"/></td>
								</tr>
							</tbody>
						</table>
	
						<div class="listBtmArea">
							<div class="tplPagination">								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>