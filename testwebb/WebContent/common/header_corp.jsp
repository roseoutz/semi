<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<body class="byWd byNm" style="">
	<a name="top"></a>
	<p id="accessibility">
		<a href="#point">메뉴 건너뛰기</a>
	</p>
	<div id="headerWrap" class="gnbTheme1080 devGnbContainer">
		<div id="header" class="">
			<!--신입공채 메뉴일경우 클래스 start-sub 추가 -->
			<!-- // headInner -->
			<div class="headInner">
				<h1 class="404Logo">
					<a href="http://127.0.0.1:8080/testwebb/main.tiles"><img src="./image/404JOB.png" height="39" width="160" style="float: left;">
					</a>
				</h1>
				<!-- // search -->
				<div class="search">
					<h2 class="skip">검색</h2>
					<form name="global_seek" id="AKCFrm" autocomplete="off"
						action="/Search/" onsubmit="return GoMainTotalSearch();"
						target="_self">
						<fieldset>
							<legend>Smart Match 통합검색</legend>
							<div class="smKey">
								<input type="text" id="stext" title="검색어 입력" name="stext"
									maxlength="50" style="background: none;"> <input
									type="submit" value="검색" class="submit spGnb"
									id="common_search_btn">
							</div>
						</fieldset>
					</form>
				</div>
			</div>
			<!-- headInner // -->

			<div id="headNavBar" class="headNavBar">
				<div class="navInner">

					<!-- 전체보기 버튼 클릭시 active 클래스 추가 -->
					<div class="jkNavArea">
						<h2 class="skip">주요서비스</h2>
						<nav>
						<ul>
							<!-- 채용정보 -->
							<li><a href="corppost.tiles" style="font:bold 20px Dotum;">공고 등록</a></li>
							<li><a href="corphr.tiles" style="font:bold 20px Dotum;">공고 인재 관리</a></li>
							<li><a href="corpsimpleqna.tiles" style="font:bold 20px Dotum;">고객센터</a></li>
							<li><a href="corppostlist.tiles" style="font:bold 20px Dotum;">마이페이지</a></li>
						</ul>
						<!-- my 홈일경우 클래스 myPage -->
						</nav>
					</div>

				</div>
			</div>
		</div>
	</div>

	<div class="jkNavDimm"></div>
	<!-- GNB 개편 끝 //-->

	<script
		src="/sciprts/jquery?v=FVs3ACwOLIVInrAl5sdzR2jrCDmVOWFbZMY6g6Q0ulE1"></script>
