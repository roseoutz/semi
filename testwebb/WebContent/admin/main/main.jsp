<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
﻿
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>잡코리아·알바몬 통합 로그인 ㅣ 잡코리아 - 좋은 일이 생긴다(www1)</title>

</head>

<body id="login" class="login ">
<div id="wrap">

	<div id="container">
		<div class="logo">
			<img src="./image/404JOB.png" height="39" width="160" style="float: left;">
		</div>
		

		<div class="secLogin">
			<div class="logWrap" id="loginFormWrite">
				<h2 class="blind">로그인</h2>

				<form name="form" id="form" method="post" action="admin_login.action" onsubmit = "return checkForm();">
				<fieldset class="login_form"><legend class="blind">로그인 입력폼</legend>

					<!-- 회원선택-->
					<div class="select_row">
						<ul id="devMemTab">
							<li class="on"><a href="#" data-m-type="M">관리자 로그인</a></li>
						</ul>
					</div>
					<div class="select_row devHide" id="devCoTab">
						<p class="sort">
							<input type="radio" id="lb_memberGi" name="Co_DB_Name" value="GI"  checked data-href="https://www.jobkorea.co.kr/Join/GI_Regist"> <label for="lb_memberGi"  class="radioOn">기업회원</label>
							<input type="radio" id="lb_memberSf" name="Co_DB_Name" value="SF"  data-href="https://www.jobkorea.co.kr/Join/HR_Regist"> <label for="lb_memberSf" >서치펌회원</label>
							<input type="radio" id="lb_memberHh" name="Co_DB_Name" value="HH"  data-href="https://www.jobkorea.co.kr/Join/HH_Regist"> <label for="lb_memberHh" >파견·대행회원</label>
							<input type="radio" id="lb_memberEdu" name="Co_DB_Name" value="Edu"  data-href="https://www.jobkorea.co.kr/Join/Edu_Regist"> <label for="lb_memberEdu" >교육기관회원</label>
						</p>
					</div>

					<div class="input_row">
						
						<input type="text" class="inpTxt inpID off" name="admin_id" id="M_ID" size="16" maxlength="20"  style="ime-mode:inactive;" value="">
						<input type="password" class="inpTxt inpPW off" name="admin_pass" id="M_PWD" size="16" >
						<button type="submit" class="btLoin">로그인</button>
					</div>
				</fieldset>
				</form>
			</div>
			<div class="adBan">
				<h2 class="skip">광고</h2>
				<iframe width="325" height="310" noresize="" scrolling="no" frameborder="0" marginheight="0" marginwidth="0" src="https://ads.jobkorea.co.kr/RealMedia/ads/adstream_sx.ads/jobkorea/login@x01" title="광고"></iframe>
			</div>
			
		</div><!-- // content -->
	</div><!-- container //-->
</div>
</body>
</html>
