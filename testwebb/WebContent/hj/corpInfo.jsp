<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix = "s" uri = "/struts-tags" %>

<!DOCTYPE html>
<body id="secMtu">
	<div id="wrap">
		<section id="container">
			<h1 class="skip">기업회원 서비스</h1>
			<section class="content">
				<div class="modal modal-spinner" role="dialog" aria-hidden="true"
					style="display: none;"></div>
				<div class="contWrap ResumeMngCont">
					<div class="innerHd">
						<ul>
							<li class="hdTab">공고 입력하기</li>
							
						</ul>
					</div>
					<form method="post" action="postWriteAction.action">
					<h2 class="skip">공고입력</h2>
					<div class="hopeWorking">
						<h3 class="header">공고 제목</h3>
						<div class="summary">
							<input type="text" name="post_subject" placeholder="공고 제목을 입력하세요." id="lb_inq2" class="mtcIpt3" style="height:25px;"></div>
						</div>
					</div>
					<div class="tableList  ">
						<div class="">
							<div class="listSortArea">
								<div class="col col01"><h3>공고 내용</h3></div>
								
							</div>
							<div class="mtuList">
								<ul>
									<!-- [개발] 이력서 작성중 yet 클래스 추가 -->
									<li class="ing">
										<div class="col col01">
												<div class="tbRow">
												<div class="tbCell tbTh">
													<label for="lb_inq_2">경력 <em>(필수)</em></label>
												</div>
											</div>
										</div>
										<div class="col col02">
										<div class="tbCell">
													<div class="mtcSltBx listLenSel">
														 <select
															name="post_career" id="lb_view_1" title="문의 종류 선택" style="width:100px;">
															<option value="-1">경력 선택</option>
															<option value="0">무관</option>
															<option value="1">신입</option>
															<option value="3">1~3년</option>
															<option value="6">4~6년</option>
															<option value="9">7~9년</option>
															<option value="15">10~15년</option>
															<option value="16">16년 이상</option>
														</select>
													</div>
												</div>
											<!-- checkbox -->
										</div>
										<div class="col col03">
												<div class="tbRow">
												<div class="tbCell tbTh">
													<label for="lb_inq_2">학력 <em>(필수)</em></label>
												</div>
											</div>
										</div>
										<div class="col col04">
												<div class="tbCell">
													<div class="mtcSltBx listLenSel">
														<select name="post_edu" id="lb_view_1" title="문의 종류 선택" style="width:100px;">
															<option value="-1" selected="selected">학력 선택</option>
															<option value="무관">무관</option>
															<option value="고졸">고졸</option>
															<option value="초대졸">초대졸</option>
															<option value="대졸">대졸</option>
															<option value="석사">석사</option>
															<option value="박사">박사</option>
														</select>
													</div>
												</div>
											<!-- checkbox -->
										</div>
										
									</li>
									<li class="ing">
										<div class="col col01">
												<div class="tbRow">
												<div class="tbCell tbTh">
													<label for="lb_inq_2">우대조건</label>
												</div>
											</div>
										</div>
										<div class="col col02">
												<div class="tbCell">
													<input type="text" name="post_prefer" id="lb_inq_2" class="mtcIpt4" />
												</div>
											<!-- checkbox -->
										</div>
										<div class="col col03">
												<div class="tbRow">
												<div class="tbCell tbTh">
													<label for="lb_inq_2">고용형태 <em>(필수)</em></label>
												</div>
											</div>
										</div>
										<div class="col col04">
												<div class="tbCell">
													<div class="mtcSltBx listLenSel">
														<select name="post_em_type" id="lb_view_1" title="문의 종류 선택" style="width:100px;">
															<option value="-1">고용형태</option>
															<option value="정규직">정규직</option>
															<option value="계약직">계약직</option>
															<option value="인턴">인턴</option>
															<option value="파견직">파견직</option>
															<option value="프리랜서">프리랜서</option>
														</select>
													</div>
												</div>
											<!-- checkbox -->
										</div>
										
									</li>
									<li class="ing">
										
										<div class="col col1">
											<div class="tbCell tbTh">
												<label for="lb_inq_4">지역 <em>(필수)</em></label>
											</div>
										</div>
										<div class="col col2">
											<div class="mtcSltBx listLenSel">
													<select name="post_loc"id="lb_view_2" title="지역 시/도 선택" style="width:100px;">
														<option value="-1">시/도</option>
														<option value="서울">서울</option>
														<option value="경기">경기</option>
														<option value="인천">인천</option>
														<option value="대전">대전</option>
														<option value="세종">세종</option>
														<option value="충남">충남</option>
														<option value="충북">충북</option>
														<option value="광주">광주</option>
														<option value="전남">전남</option>
														<option value="전북">전북</option>
														<option value="대구">대구</option>
														<option value="경북">경북</option>
														<option value="경남">경남</option>
														<option value="부산">부산</option>
														<option value="울산">울산</option>
														<option value="제주">제주</option>
														<option value="전국">전국</option>
													</select>
											</div>
										
										</div>
									</li>
									<li class="ing">
										<div class="col col01">
											<div class="tbCell tbTh">
												<label for="lb_inq_2">급여 <em>(필수)</em></label>
											</div>
										</div>
										<div class="col col02">
											<div class="tbCell">
												<input type="text" name="post_pay" id="lb_inq_2" class="mtcIpt3" />
											</div>	
										</div>
										<div class="col col3">
											<div class="tbCell tbTh">
												<label for="lb_inq_2">근무 시간</label>
											</div>
										</div>
										<div class="col col4">
											<div class="tbCell">
												<input type="text" name="post_time" id="lb_inq_2" class="mtcIpt3" />
											</div>
										</div>
									</li>
									<li class="ing">
										<div class="col col01">
											<div class="tbCell tbTh">
												<label for="lb_inq_2">상세 내용 <em>(필수)</em></label>
											</div>
										</div>
									</li>
									<li class="ing">
										<div class="col col01">
											<div class="tbCell">
												<textarea name="post_content" id="lb_inq_2" placeholder="내용을 입력하세요." class="txArea"
												style="width:800px; height:50px;"
												></textarea>
											</div>
										</div>
									</li>
									<li class="ing">
										<div class="col col01">
											<div class="button">
												<button type="submit" class="btn" style="border:1px solid #000;">공고 작성</button>
												&nbsp;&nbsp;&nbsp;&nbsp;
												<button type="button" class="btn" style="border:1px solid #000;">다음에 작성</button>											
											</div>
										</div>
									</li>
								</ul>
								</form>
							</div>
						</div>

						<div class="linkMng"></div>
						<!-- TIP -->
						
						
						
					</div>



			</section>
			<hr />
			<section class="secLnb">
						<h1 class="skip">개인회원 서비스 메뉴</h1>
						<div class="lnbGroup">
							<h2 class="lnbTit">공고 및 지원자 관리</h2>
							<ul>
								<li><a href="corppost.action"
									target="_blank">공고 등록</a></li>
								<li><a href="corppostlist.action">등록 공고
										관리</a></li>
								<li><a href="corpresumelist.action">지원자
										관리</a></li>
							</ul>
						</div>
						<hr/>
						<div class="lnbGroup">
							<h2 class="lnbTit">인재관리</h2>
							<ul>
								<li><a href="corphrsearch.action"
									target="_blank">인재 검색</a></li>
							</ul>
						</div>
						<hr/>
						<div class="lnbGroup">
							<h2 class="lnbTit">회원정보 관리</h2>
							<ul>
								<li><a href="corpinfo.action">기업정보 수정</a></li>
								<li><a href="#">회원정보 수정</a></li>
								<li><a href="#">회원탈퇴</a></li>
							</ul>
						</div>
					</section>
		</section>
	</div>
</body>