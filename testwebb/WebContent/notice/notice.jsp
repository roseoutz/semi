<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<body id="secHelp" class="helpMain">
<div id="wrap">
	<div id="container">
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
								<li><a href="http://127.0.0.1:8080/testwebb/qna.tiles" class="">1:1 문의하기</a></li>
								<li><a href="http://127.0.0.1:8080/testwebb/simpleqna.tiles" class="">자주 묻는 질문</a></li>
							</ul></li>
					</ul>
				</div>
				<div class="lnbGroup">
					<ul>
						<li><a href="#" class="">공지사항</a></li>
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
									<th scope="col">
										<div class="lyTplArea schItems">
											<span class="tHd"><button type="button"
													class="btnListSort mtcBtnA">전체</button></span>
											<ul class="lyItems">
												<li><a href="#">전체</a></li>
											</ul>
										</div>
									</th>
									<th scope="col">제목</th>
									<th scope="col">날짜</th>
								</tr>
							</thead>
							<tbody>
							<!-- 공지사항  -->
								<tr>
									<td class="sort">공지</td>
									<td class="alLeft"><span class="tit"><a href="#">잡코리아2018 웹·스마트앱어워드 3관왕 달성</a></span></td>
									<td class="date">2018.12.06</td>
								</tr>
							</tbody>
						</table>
	
						<div class="listBtmArea">
							<div class="tplPagination">
	
	
								<ul>
	
									<li><span class="now">#List#</span></li>
								</ul>
	
								<p>
									<a href="http://www.jobkorea.co.kr/help/notice?tab=1&amp;Page=11" class="tplBtn btnPgnNext"><span>다음페이지</span></a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>