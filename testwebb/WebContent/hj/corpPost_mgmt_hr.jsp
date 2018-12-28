<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix = "s" uri = "/struts-tags" %>

<!DOCTYPE html>

<body id="secMtu">

	<div id="wrap">
		<section id="container">
			<h1 class="skip">개인회원 서비스</h1>
			<section class="content">
				<div class="modal modal-spinner" role="dialog" aria-hidden="true"
					style="display: none;"></div>
				<div class="contWrap ResumeMngCont">
					<div class="innerHd">
						<ul>
							<li class="hdTab"><a
								href="corppostlist.action">공고 관리</a></li>
							<li class="on"><a
								href="corphr.action">지원자 관리</a></li>
						</ul>
					</div>
					<div class="tableList  ">
						<div class="">
							<div class="listSortArea">
								<div class="col col01" style="width:120px;">지원자명</div>
								<div class="col col02" style="width:120px;">개인정보</div>
								<div class="col col03" style="width:120px;">지원분야</div>
								<div class="col col04" style="width:200px;">이력서</div>
								<div class="col col05" style="width:120px;">학력</div>
								<div class="col col06" style="width:120px;">지역</div>
								<div class="col col07" style="width:120px;">간편처리</div>
							</div>
							<div class="mtuList">
								<ul>
									<!-- [개발] 이력서 작성중 yet 클래스 추가 -->
									<li class="ing">
										<div class="col col01" style="width:120px;">
											<div class="tit">
												<em class="badge">신입</em><a
													href="/User/Resume/Write" target="_blank">홍길동</a>
											</div>
											<div class="date"></div>
										</div>
										<div class="col col02" style="width:120px;">
											<div class="sTit">
												<span>1990년생</span> <span>남</span> 
											</div>
										</div>
										<div class="col col03" style="width:120px;">
											<div class="sTit">
												<span>IT&#183;인터넷</span>
											</div>
										</div>
										<div class="col col04" style="width:200px;">
											<div class="tit">
												<a href="" class="link" title="대신금융그룹 경력 및 신입사원 채용" data-pagecode="ST"
												data-ctgrcode="B02" target="_blank"> <span>이력서 제목</span>
												</a>	
											</div>
										</div>
										<div class="col col05" style="width:120px;">
											<div class="sDesc">
												<span>대졸</span>
											</div>
										</div>
										<div class="col col06" style="width:120px;">
											<div class="sDesc">
												<span>서울</span>
											</div>
										</div>
										<div class="col col07" style="width:120px;">
											<!-- checkbox -->
											<div class="btnCell">
												<a class="btn" href="" target="_blank">OK</a>
											</div>
											<div class="btnCell">
												<button class="btn" type="button" onclick="">
													<span>삭제</span>
												</button>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>

						<div class="linkMng"></div>
						<!-- TIP -->
						<div id="devResumeEmail" name="devResumeEmail"
							style="position: absolute; top: 100px; left: 70px; z-index: 9999; display: none;">
							<iframe id="devResumeEmailIfrm" name="devResumeEmailIfrm"
								width="593" height="450" marginwidth="0" marginheight="0"
								frameborder="no" scrolling="no" title="이력서 이메일전송 레이어"></iframe>
						</div>
					</div>



					<iframe id="frmFileDownload" style="display: none" title="빈 프레임"></iframe>
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