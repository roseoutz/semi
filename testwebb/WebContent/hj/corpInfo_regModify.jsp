<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<body id="secMtu">
	<div id="wrap">
		<section id="container">
			<h1 class="skip">기업회원 서비스</h1>
			<section class="myContent" style="float:left; widht:190px;">
				<div class="profile info">
					<div class="photo mtuSpImgAfter devPhotoBtns btns">
						<p class="img">
							<img src="./mypage_files/M_Photo_View.asp" alt="이력서 사진"
								style="width: 100%">
						</p>
						<button class="btn mtuSpImg btnModify" type="button">
							<span class="skip">사진편집</span>
						</button>
						<button class="btn btnPhotoDel mtuSpImg btnDelete" type="button">
							<span class="skip">사진삭제</span>
						</button>
					</div>
					<div class="name">
						<strong>김동규</strong>님
					</div>
				</div>
			</section>
			<section class="content">
				<div class="modal modal-spinner" role="dialog" aria-hidden="true"
					style="display: none;"></div>
				<div class="contWrap ResumeMngCont">
					<div class="innerHd">
						<ul>
							<li class="hdTab">기업 정보 수정하기</li>
							
						</ul>
					</div>
					<form method="post" action="" name="">
					<h2 class="skip">기업 정보</h2>
					<div class="hopeWorking">
						<h3 class="header">기업명</h3>
						<div class="summary">
							<input type="text" name="" placeholder="기업명을 입력하세요." id="lb_inq2" class="mtcIpt3" style="height:25px;"></div>
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
													<label for="lb_inq_2">사업자번호 <em>(필수)</em></label>
												</div>
											</div>
										</div>
										<div class="col col02">
										<div class="tbCell">
													<input type="text" name="title" id="lb_inq_2" class="mtcIpt4" />
												</div>
										</div>
										<div class="col col03">
												<div class="tbRow">
												<div class="tbCell tbTh">
													<label for="lb_inq_2">기업구분 <em>(필수)</em></label>
												</div>
											</div>
										</div>
										<div class="col col04">
												<div class="tbCell">
													<div class="mtcSltBx listLenSel">
														<select name="" id="lb_view_1" title="문의 종류 선택" style="width:100px;">
															<option value="-1">------</option>
															<option value="0">IT·인터넷</option>
															<option value="1">경영·사무</option>
															<option value="2">미디어</option>
															<option value="3">전문·특수직</option>
															<option value="4">영업·고객상담</option>
															<option value="5">연구개발·설계</option>
															<option value="6">건설</option>
															<option value="7">마케팅·광고·홍보</option>
															<option value="8">생산·제조</option>
															<option value="9">의료</option>
															<option value="10">무역·유통</option>
															<option value="11">디자인</option>
															<option value="12">교육</option>
															<option value="13">서비스</option>
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
													<label for="lb_inq_2">기업대표</label>
												</div>
											</div>
										</div>
										<div class="col col02">
												<div class="tbCell">
													<input type="text" name="title" id="lb_inq_2" class="mtcIpt4" />
												</div>
											<!-- checkbox -->
										</div>
										<div class="col col03">
												<div class="tbRow">
												<div class="tbCell tbTh">
													<label for="lb_inq_2">설립일 <em>(xxxx-xx-xx)</em></label>
												</div>
											</div>
										</div>
										<div class="col col04">
												<div class="tbCell">
													<input type="text" name="title" id="lb_inq_2" class="mtcIpt4" />
												</div>
											<!-- checkbox -->
										</div>
										
									</li>
									<li class="ing">
										
										<div class="col col1">
											<div class="tbCell tbTh">
												<label for="lb_inq_4">자본금 <em>(필수)</em></label>
											</div>
										</div>
										<div class="col col2">
											<input type="text" name="title" id="lb_inq_2" class="mtcIpt4" />
										</div>
										<div class="col col03">
											<div class="tbCell tbTh">
												<label for="lb_inq_4">사원수 <em>(필수)</em></label>
											</div>										</div>
										<div class="col col04">
											<input type="text" id="lb_inq_5" name="emailDomain" class="mtcIpt2" title="상세주소" size="40">
										</div>
									</li>
									<li class="ing">
										<div class="col col01">
											<div class="tbCell tbTh">
												<label for="lb_inq_2">주소 <em>(필수)</em></label>
											</div>
										</div>
										<div class="col col02">
											<div class="tbCell">
												<div class="mtcSltBx listLenSel">
													<select name=""id="lb_view_2" title="지역 시/도 선택" style="width:100px;">
														<option value="-1">시/도</option>
														<option value="0">서울</option>
														<option value="1">경기</option>
														<option value="2">인천</option>
														<option value="3">대전</option>
														<option value="4">세종</option>
														<option value="5">충남</option>
														<option value="6">충북</option>
														<option value="7">광주</option>
														<option value="8">전남</option>
														<option value="9">전북</option>
														<option value="10">대구</option>
														<option value="11">경북</option>
														<option value="12">경남</option>
														<option value="13">부산</option>
														<option value="14">울산</option>
														<option value="15">제주</option>
														<option value="5">전국</option>
													</select>
											</div>
											</div>	
										</div>
										<div class="col col3">
											<div class="tbCell tbTh">
												<label for="lb_inq_2">상세 주소</label>
											</div>
										</div>
										<div class="col col4">
											<div class="tbCell">
												<input type="text" name="title" id="lb_inq_2" class="mtcIpt3" />
											</div>
										</div>
									</li>
									
									<li class="ing">
										
										<div class="col col01">
											<div class="tbCell tbTh">
												<label for="lb_inq_2">홈페이지 <em>(필수)</em></label>
											</div>
										</div>
										<div class="col col02">
										<div class="tbCell">
												<input type="text" name="title" id="lb_inq_2" class="mtcIpt3" />
											</div>
										</div>
										<div class="col col03"></div>
										<div class="col col04"></div>
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
						
						
						<div id="devResumeEmail" name="devResumeEmail"
							style="position: absolute; top: 100px; left: 70px; z-index: 9999; display: none;">
							
					</div>



			</section>
			<hr />
			<section class="secLnb">
						<h1 class="skip">개인회원 서비스 메뉴</h1>
						<div class="lnbGroup">
							<h2 class="lnbTit">공고 및 지원자 관리</h2>
							<ul>
								<li><a href="corppost.tiles"
									target="_blank">공고 등록</a></li>
								<li><a href="corppostlist.tiles">등록 공고
										관리</a></li>
								<li><a href="corphr.tiles">지원자
										관리</a></li>
							</ul>
						</div>
						<hr/>
						<div class="lnbGroup">
							<h2 class="lnbTit">인재관리</h2>
							<ul>
								<li><a href="corphrsearch.tiles"
									target="_blank">인재 검색</a></li>
							</ul>
						</div>
						<hr/>
						<div class="lnbGroup">
							<h2 class="lnbTit">회원정보 관리</h2>
							<ul>
								<li><a href="corpinfo.tiles">기업정보 수정</a></li>
								<li><a href="#">회원정보 수정</a></li>
								<li><a href="#">회원탈퇴</a></li>
							</ul>
						</div>
					</section>
		</section>
	</div>
</body>