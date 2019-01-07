<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
<head>


<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>비밀번호 찾기 ㅣ Job404</title>


<meta name="title" content="채용, 공채, 취업, 공고, 구인, 구직 정보는 잡코리아">
<meta name="description" content="신입공채, 경력채용, 채용정보, 공채정보, 정규직채용, 인턴 등의 구인공고와 채용정보가 제일 먼저 올라오는 곳, 잡코리아에 오세요. 입사 지원은 무료이며 지원팁, 합격자소서, 면접후기 등의 지원자를 위한 지원정보, 합격 꿀팁도 얻을 수 있습니다.">
<meta name="keywords" content="채용정보, 채용, 공채, 신입공채, 경력공채. 취업공고, 구인공고, 기업, 연봉, 보너스, 복지, 복리후생, 기업문화, 자격증, 국가유공자, 우대, 잡코리아">


<meta name="verify-v1" content="wfOOCE9Vtx+Z5etOXJnS9LU03yGpBxkK74T/yU63Xqs=">
<meta name="Robots" content="noindex,nofollow">

<link rel="SHORTCUT ICON" href="http://www.jobkorea.co.kr/favicon.ico">


	<link rel="stylesheet" type="text/css" href="css/common.css?201705291000"/>

	<link rel="stylesheet" type="text/css" href="css/footer_sub.css">

	<link rel="stylesheet" type="text/css" href=css/gnb.css?20170124001"/>
	<link rel="stylesheet" type="text/css" href="css/gnb_sub.css?20170317002"/>


	<link rel="stylesheet" type="text/css" href="css/mbr_common.css?date=201611151500"/>
	<link rel="stylesheet" type="text/css" href="css/mbr_tpl.css"/>

	<link rel="stylesheet" type="text/css" href="css/mbr_style.css?date=201612201113"/>

<style type="text/css">
	.mbrTplData1 li {clear:both; padding:5px 0 5px 24px; overflow:inherit;}
	.mbrTplData1 li:after { content:''; display:block; clear: both; }
	.mbrTplData1 li .tipHover { display:inline-block; position:relative; margin-left:5px; margin-top:-2px; vertical-align: middle;}
	.mbrTplData1 li .tipHover button {}
	.mbrTplData1 li .tipHover .tip { display:none; position:absolute; top:15px; left:0; width:208px; padding:15px 20px; border:1px solid #565d79; box-sizing:border-box; color:#666; font-weight:normal; line-height:1.5; background:#fff url('/img/member/popLoginClose.gif') no-repeat 190px 8px; }
	.mbrTplData1 li .tipHover .tip .tipClose { overflow:hidden; position:absolute; top:5px; right:5px; width:10px; height:9px; text-indent:-999px; background:url('/img/member/popLoginClose.gif') no-repeat }
</style>

<style type = "text/css">
  .mbrTplBox {padding:19px 0 19px 0; margin-right:20px; border:1px solid #cccccc; border-top:2px solid #777a83; overflow:hidden;}
  .mbrTplBox .mbrTplBoxList {margin:0 29px 0 29px; height:128px; border:1px solid #ccc; overflow:auto}
  .mbrTplBox .mbrTplBoxList ul {margin:20px 20px 8px 12px;}
  .mbrTplBox .mbrTplBoxList ul li {padding:0 0 12px 8px; background:url(/img/member/sprites/mbr_tpl_icon_1.gif) no-repeat 0 -266px;}
  .mbrTplBox .info {padding:0 0 0 10px; margin:10px 29px 0 29px; background:url(/img/member/sprites/mbr_tpl_icon_1.gif) no-repeat 0 -296px; letter-spacing:-1px; color:#333;}
  .mbrTplBox .info em {font-weight:bold; color:#f60;}
  .mbrTplBox .info em.odd {color:#2e7de4;}
</style>
<style>
	.submit button{
		background-color: #008CBA; 
	    border: none;
	    color: white;
	    padding: 15px 28px;
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    font-size: 16px;
	    margin: 4px 2px;
	    cursor: pointer;
	}
</style>
<script type = "text/javascript">
	function checkForm(){
		var form = document.findPwdForm;
		if(!form.m_id.value && !form.cm_id.value){
			alert("아이디를 입력해주세요.");
			form.m_id.focus();
			return false;
		}
		if(form.cm_id.value && form.cm_name.value && form.cm_cno.value){
			if(form.m_id.value || form.m_name.value || form.m_email.value){
				alert("회원구분 중 하나만 입력해주세요.");
				return false;
			}
		}
		if(form.m_id.value){
			if(!form.m_name.value){
				alert("이름을 입력해주세요.");
				form.m_name.focus();
				return false;
			}
		}
		if(form.m_id.value && form.m_name.value){
			if(!form.m_email.value){
				alert("이메일을 입력해주세요.");
				form.m_email.focus();
				return false;
			}
		}
		if(form.m_id.value && form.m_name.value && form.m_email.value){
			if(form.cm_id.value || form.cm_name.value || form.cm_cno.value){
				alert("회원구분 중 하나만 입력해주세요.");
				return false;	
			}
		}
		if(form.cm_id.value){
			if(!form.cm_name.value){
				alert("이름을 입력해주세요.");
				form.cm_name.focus();
				return false;
			}
		}
		if(form.cm_id.value && form.cm_name.value){
			if(!form.cm_cno.value){
				alert("사업자등록번호를 입력해주세요.");
				form.cm_cno.focus();
				return false;
			}
		}
		
		if(form.m_id.value && form.m_name.value && form.m_email.value && form.cm_id.value && form.cm_name.value && form.cm_cno.value){
			alert("회원구분 중 하나만 입력해주세요.");
			form.reset();
			return false;
		}
	}


</script>

</head>

<body id="secMbr" class="mbrSubCC mbrSubSchID">

<div id="wrap">

	<!--// Contents Area -->
	<div id="container">
		<div id="content">
			<div class="mbrSec mbrSch mbrSchID">
        <h1><a class="logo" href="../main.action"><img src="../image/404JOB.png" height="27" width="160" style="float: left;"></a></h1>

        <span class="bar">
				<span class="title">
					&nbsp;&nbsp;<img src="image/h_cc_schpwd.gif" height = "25" alt="비밀번호 찾기">
				</span>
			  </span>
        <br><br>
        <br>
				<h2 class="mbrHeading2"><img src="image/mbr_h_reg_gg.gif" alt="회원정보 입력"></h2>
				<div class="mbrTplDesc">
					<strong>※ 회원구분별로 가입 시 입력한 본인정보를 입력해 주세요.</strong>
				</div>

				<form name="findPwdForm" method="post" action="findPwd.action" onsubmit="return checkForm();">
				<!--// 이메일 인증 -->
				<div class="mbrCertifyData mbrCertifyDataGG">
				<fieldset>
				<legend>개인회원-이메일인증 입력폼</legend>
					<div class="mbrTplBox">
            <br>
						<h3><img src="image/mbr_h_sub_gg.gif" alt="개인회원"></h3>
						<ul class="mbrTplData1">
						
							<li><label for="M_ID" class="title">아이디</label> <input type="text" name="m_id" id="M_ID" style="width:308px;ime-mode:inactive;" class="ipText" value=""></li>
							<li id="devName"><label for="lb_name" class="title">이름</label> <input type="text" name="m_name" id="lb_name"  maxlength="50" style="width:308px; ime-mode:active;" class="ipText"></li>
							<li id="devEmailForm">
								<label for="lb_email_head" class="title">이메일 주소</label>
								<input type="text" name="m_email" id="lb_email_head" maxlength="30" style="width:308px;" class="ipText">
								
					</div>
					</fieldset>
				</div>

				<div class="mbrCertifyData mbrCertifyDataGI">
					<fieldset>
					<legend>기업회원 인증 입력폼</legend>
					<div class="mbrTplBox">
            <br>
						<h3><img src="image/mbr_h_sub_gi.gif" alt="기업회원"></h3>
            <hr>
						<ul class="mbrTplData1">
						
							<li><label for="M_ID" class="title">아이디</label> <input type="text" name="cm_id" id="M_ID" style="width:308px;ime-mode:inactive;" class="ipText" value=""></li>
							<li>
								<label for="C_Register" class="title">
									가입자명
								</label>
								<input type="text" name="cm_name" id="C_Register" maxlength="50" style="width:308px;" class="ipText" >
							</li>
							<li>
								<label for="work_rr_no1" class="title">사업자등록번호</label>
								<input type="text" id="work_rr_no1" name="cm_cno" maxlength="12" placeholder="'-'를 포함해서 입력해주세요." style="width:308px;" class="ipText" onKeyUp="javascript:lengthCheck( this );" title="사업자등록번호 첫번째자리">
							</li>
						</ul>
					</div>
				</div>
				</fieldset>
			</div>
      <br>
      <br>
		  <div class = "submit" style = "text-align:center;"><button type = "submit">비밀번호 찾기</button></div>
			</form>

		</div>
	</div>
	<hr>
</div>

</body>
</html>
