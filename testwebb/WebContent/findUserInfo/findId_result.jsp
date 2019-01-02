<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix = "s" uri = "/struts-tags" %>
﻿
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
<head>


<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>아이디 찾기 결과 ㅣ job404</title>


<meta name="title" content="채용, 공채, 취업, 공고, 구인, 구직 정보는 잡코리아">
<meta name="description" content="신입공채, 경력채용, 채용정보, 공채정보, 정규직채용, 인턴 등의 구인공고와 채용정보가 제일 먼저 올라오는 곳, 잡코리아에 오세요. 입사 지원은 무료이며 지원팁, 합격자소서, 면접후기 등의 지원자를 위한 지원정보, 합격 꿀팁도 얻을 수 있습니다.">
<meta name="keywords" content="채용정보, 채용, 공채, 신입공채, 경력공채. 취업공고, 구인공고, 기업, 연봉, 보너스, 복지, 복리후생, 기업문화, 자격증, 국가유공자, 우대, 잡코리아">


<meta name="verify-v1" content="wfOOCE9Vtx+Z5etOXJnS9LU03yGpBxkK74T/yU63Xqs=">
<meta name="Robots" content="noindex,nofollow">

<link rel="SHORTCUT ICON" href="http://www.jobkorea.co.kr/favicon.ico">

					<link rel="stylesheet" type="text/css" href="css/common.css?201705291000"/>

			<link rel="stylesheet" type="text/css" href="css/footer_sub.css">

	<link rel="stylesheet" type="text/css" href="css/gnb.css?20170124001"/>
	<link rel="stylesheet" type="text/css" href="css/gnb_sub.css?20170317002"/>


	<link rel="stylesheet" type="text/css" href="css/mbr_common.css?date=201611151500"/>
	<link rel="stylesheet" type="text/css" href="css/mbr_tpl.css?date=201603212000"/>

	<link rel="stylesheet" type="text/css" href="css/mbr_style.css?date=201612201113"/>


</head>

<body id="secMbr" class="mbrSubCC mbrSubSchIDResult">

<div id="wrap">

	<!--// Contents Area -->
	<div id="container">
		<div id="content">
			<h1 class="skip">아이디 찾기</h1>
			<div class="mbrSec mbrSchIDResult">
        	<h1><a class="logo" href="../main.action"><img alt="잡코리아" src="image/h_logo.gif"></a>
          
        <br><br>
				<h2 class="mbrHeading2"><img src="image/h_cc_schid.gif" alt="아이디조회"></h2>
				<div class="mbrTplDesc">
					<p>※ 개인정보보호를 위해 일부분은 *로 표시됩니다.</p>
					<p>동명이인이 있는 경우, 본인 외의 ID가 노출될 수 있습니다.</p>
				</div>

				<div class="mbrTplBox">
					<h3 class="skip">보유 아이디 목록</h3>
					<p class="info"><strong>입력된 정보로 등록된 아이디는 총<em>${searchCount }개</em> 있습니다.</strong></p>
					<div class="mbrTplBoxList">
						<ul>
						<s:if test = "category == '기업'">
							<s:iterator value = "findId" status = "stat">
								<li><s:property value = "cmember_id"/> 가입날짜 : (<s:property value = "cmember_date"/>)</li>
							</s:iterator>
						</s:if>
						<s:else>
						 	<s:iterator value = "findId" status = "stat">
								<li><s:property value = "member_id"/> 가입날짜 : (<s:property value = "member_date"/>)</li>
							</s:iterator>
						</s:else>
						</ul>
					</div>
				</div>
        <br>
        <br>
        <div style = "text-align:center;"><input type = "button" onclick = "javascript:location.href='../main.action'" value = "홈으로" style = "width:117px; height:49px"/></div>
			<!-- 홈으로버튼 -->
			</div>
		</div>
		<hr>
	</div>
</div>

</body>
</html>
