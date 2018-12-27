<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<body id="secMtu">

	<div id="wrap">
		<section id="container">
			<h1 class="skip">개인회원 서비스</h1>
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
							<li class="hdTab"><a
								href="corppostlist.tiles">공고 관리</a></li>
							<li class="on"><a
								href="corphr.tiles">지원자 관리</a></li>
						</ul>
					</div>

					<div class="tableList  ">
						<div class="">
							<div class="listSortArea">
								<div class="col col01">공고 제목</div>
								<div class="col col02">공고 관리</div>
							</div>
							<div class="mtuList">
								<ul>
									<!-- [개발] 이력서 작성중 yet 클래스 추가 -->
									<li class="ing">
										<div class="col col01">
											<div class="tit">
												<em class="badge">2018.12.19</em><a
													href="/User/Resume/Write" target="_blank">공고 제목</a>
											</div>
											<div class="date"></div>
										</div>
										<div class="col col02">
											<!-- checkbox -->
											<div class="btnCell">
												<a class="btn" href="" target="_blank">수정</a>
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