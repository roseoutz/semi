<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" type="text/css" href="http://i.jobkorea.kr/content/css/ver_2/common.css?201812101600" />
<link rel="stylesheet" type="text/css" href="http://i.jobkorea.kr/content/css/ver_2/gnb/gnb.css?201812101600" />
<link rel="stylesheet" type="text/css" href="http://i.jobkorea.kr/content/css/ver_2/mtu/mtu_common.css?201812101600" />
<link rel="stylesheet" type="text/css" href="http://i.jobkorea.kr/content/css/ver_2/mtu/mtu_tpl.css?201812101600" />
<link rel="stylesheet" type="text/css" href="http://i.jobkorea.kr/content/css/ver_2/mtu/mtu_style.css?201812101600" />
<link rel="stylesheet" type="text/css" href="http://i.jobkorea.kr/content/css/ver_2/event/banner.promotion.css?201812101600">
<link rel="SHORTCUT ICON" href="http://www.jobkorea.co.kr/favicon.ico">
<link rel="canonical" href="http://www.jobkorea.co.kr">

<!-- Css  -->
<style type="text/css">
.lyTplLogin .btnClose {
	position: absolute;
	right: 5px;
	top: 10px;
	width: 21px;
	height: 21px;
	background:
		url('http://i.jobkorea.kr/content/images/list_gi/all_q_apply.png')
		no-repeat 0 -100px;
	text-align: center;
}

.lyTplLogin .btnClose span {
	display: inline-block;
	text-indent: -9999px;
}

.lyTplLogin .btnClose_s1 {
	top: 3px;
}

.onairPopup {
	display: none;
	position: absolute;
	top: 62px;
	left: 50%;
	z-index: 999;
	width: 618px;
	margin-left: -309px;
}

.onairPopup .btnClose {
	display: block;
	position: absolute;
	top: 16px;
	right: 20px;
	font-size: 0;
	width: 27px;
	height: 27px;
	opacity: 0;
	background: #fff;
}
</style>

<style> 
input[type="text"] {
    border: 1px solid #ddd;
}
.mtcIpt4 {
    width: 350px;
    height: 20px;
/*     line-height: 36px; */
    padding: 0 5px;
    border: 1px solid #ddd;
     box-sizing: border-box;
}
.mtcIpt3 {
    width: 150px;
    height: 20px;
/*     line-height: 36px; */
    padding: 0 5px;
    border: 1px solid #ddd;
    box-sizing: border-box;
}

.mtcIpt2 {
	width: 350px;
	height: 36px;
	line-height: 36px;
	padding: 0 5px;
	border: 1px solid #ddd;
	box-sizing: border-box;
}
div.table-basic-infomation-primary .field-value .value {
    width: 100%;
    padding: 7px 18px 0;
    font-size: 14px;
    color: #333;
    letter-spacing: 0;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}

.value2 {
    width: 100%;
    padding: 7px 18px 0;
    font-size: 14px;
    color: #333;
    letter-spacing: 0;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.mtcSltBx label {
    position: absolute;
    color: #999;
    top: 0;
    left: 10px;
    height: 100%;
    /* line-height: 1.8; */
    z-index: -1;  
}
.cbb {
    height: 20px;
}

</style>	
<!DOCTYPE html>
<body id="secMtu">

	<div id="wrap">
		<section id="container">
			<section class="content">
				<div class="modal modal-spinner" role="dialog" aria-hidden="true"
					style="display: none;"></div>
				<div class="contWrap ResumeMngCont">
					<div class="innerHd">
						<ul>
							<li class="hdTap"><h2 class="header">인재 검색</h2></li>
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
									<li class="ing">
									<div class="tplPagination">
											<ul>
												<li><span class="now">1</span></li>
												<li><a
													href="/Starter?JoinPossible_Stat=0&amp;schOrderBy=0&amp;LinkGubun=0&amp;LinkNo=0&amp;schType=0&amp;schGid=0&amp;Page=2"
													data-page="2">2</a></li>
												<li><a
													href="/Starter?JoinPossible_Stat=0&amp;schOrderBy=0&amp;LinkGubun=0&amp;LinkNo=0&amp;schType=0&amp;schGid=0&amp;Page=3"
													data-page="3">3</a></li>
												<li><a
													href="/Starter?JoinPossible_Stat=0&amp;schOrderBy=0&amp;LinkGubun=0&amp;LinkNo=0&amp;schType=0&amp;schGid=0&amp;Page=4"
													data-page="4">4</a></li>
												<li><a
													href="/Starter?JoinPossible_Stat=0&amp;schOrderBy=0&amp;LinkGubun=0&amp;LinkNo=0&amp;schType=0&amp;schGid=0&amp;Page=5"
													data-page="5">5</a></li>
											</ul>

											<p>
												<a
													href="/Starter?JoinPossible_Stat=0&amp;schOrderBy=0&amp;LinkGubun=0&amp;LinkNo=0&amp;schType=0&amp;schGid=0&amp;Page=6"
													class="tplBtn btnPgnNext" data-page="6"><span>다음
														페이지</span></a>
											</p>
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
										<!--페이징-->
										