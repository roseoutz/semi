<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "s" uri = "/struts-tags" %>
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
					<a href="main.action"><img src="./image/404JOB.png" height="39" width="160" style="float: left;">
					</a>
				</h1>
				<!-- // search -->
			
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
							<li><a href="corppost.action" style="font:bold 20px Dotum;">회원리스트 관리</a></li>
							<li><a href="corphr.action" style="font:bold 20px Dotum;">Q&A 관리</a></li>
							<li><a href="corpsimpleqna.action" style="font:bold 20px Dotum;">자주묻는질문 관리</a></li>
							<li><a href="corppostlist.action" style="font:bold 20px Dotum;">공지사항 관리</a></li>
							
							<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
							<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
							<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
							<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
							<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
							<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
							<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
							<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
							<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
							<s:if test = "#session.session_id == null">
							</s:if>
							<s:else>
							<li><a style="font:bold 15px Dotum;"><s:property value = "#session.session_id"/>님</a></li>
							<li><em><s:property value = "#session.session_type"/>회원</em></li>
							<li><button type="button" onclick="javascript:location.href='admin_logout.action'">로그아웃</button></li>
							</s:else>
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
