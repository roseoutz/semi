<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0054)https://www.jobkorea.co.kr/Text_User/User_Info_Mng.asp -->
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>회원정보 수정 ㅣ 잡코리아 - 좋은 일이 생긴다(www1)</title>

<link rel="SHORTCUT ICON" href="http://www.jobkorea.co.kr/favicon.ico"> 
<style>
.customBtn {
  color: #ffffff;
  font-size: 20px;
  background: #72bff2;
  padding: 10px 20px 10px 20px;
  text-decoration: none;
}

.customBtn:hover {
  background: #3cb0fd;
  background-image: -webkit-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -moz-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -ms-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -o-linear-gradient(top, #3cb0fd, #3498db);
  background-image: linear-gradient(to bottom, #3cb0fd, #3498db);
  text-decoration: none;
}

.customBtn2 {
  color: #ffffff;
  font-size: 20px;
  background: #72bff2;
  padding: 10px 20px 10px 20px;
  text-decoration: none;
}

.customBtn2:hover {
  background: #3cb0fd;
  background-image: -webkit-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -moz-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -ms-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -o-linear-gradient(top, #3cb0fd, #3498db);
  background-image: linear-gradient(to bottom, #3cb0fd, #3498db);
  text-decoration: none;
}
</style>
<!-- 키워드 스크립트 시작 -->
<script src="./resources/1166416616740867" ></script>
<script src="./resources/fbevents.js"></script>
<script src="./resources/analytics.js"></script>
<script src="./resources/cb=gapi.loaded_0" ></script>
<script type="text/javascript">
var EchoID = "jobkorea";
var EchoGoodNm = "";
var EchoAmount = "";
var EchoUIP = "";
var EchoTarget = "";
var EchoLogSend = "Y";
var EchoCV = "";
var EchoPN = "";
</script> 
<script type="text/javascript" src="./resources/EchoScriptV2.js"></script>
<!-- 키워드 스크립트 끝 -->

<!-- DataStory Javascript Tracking  -->
<script type="text/javascript" src="./resources/dslog.js" id="dslog_tag"></script>
<script type="text/javascript">
    //<!--
    window.dsValDic = {};
    window.dsTypeDic = {};
    window.dsHelper = {
        registVal: function (key, value) {
            window.dsValDic[key] = value;
        },
        getVal: function (key) {
            return window.dsValDic[key];
        },
        removeVal: function (key) {
            delete (window.dsValDic[key]);
        },
        clearVal: function () {
            window.dsValDic = {}
        },
        registType: function (type) {
            window.dsTypeDic[type] = type;
        },
        removeType: function (type) {
            delete (window.dsTypeDic[type]);
        },
        clearType: function (type) {
            window.disTypeDic = {};
        }
    };
    //-->
</script>
<link rel="stylesheet" type="text/css" href="./resources/common.css">
<link rel="stylesheet" type="text/css" href="./resources/footer_sub.css">
<link rel="stylesheet" type="text/css" href="./resources/gnb.css">
<link rel="stylesheet" type="text/css" href="./resources/gnb_sub.css">
<link rel="stylesheet" type="text/css" href="./resources/mbr_common.css">
<link rel="stylesheet" type="text/css" href="./resources/mbr_tpl.css">
<link rel="stylesheet" type="text/css" href="./resources/mbr_style.css">
	
<script type="text/javascript" src="./resources/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="./resources/Common_Regist.js"></script>
<script type="text/javascript" src="./resources/Resume_Open_Check.js"></script>
<script type="text/javascript" src="./resources/underscore.js"></script>
<script type="text/javascript" src="./resources/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script src="./resources/client_platform.js" gapi_processed="true"></script>
<script type="text/javascript" src="./resources/kakao.min.js"></script>
<script type="text/javascript" src="./resources/SNS.js"></script>
<script type="text/javascript">
<!--

	function jsSelectClear(argObj) {
		  for (i=argObj.length-1; i>=0; i--) {
			  argObj.options[i] = null;
		  }
	}

	//좋은 일 알리미 수신 체크
	function GoodJobChk(ChkNum)
	{
		if (ChkNum == 0)
		{	//수신안함
			document.getElementsByName("alimy")[0].disabled = true;
			document.getElementsByName("alimy")[1].disabled = true;
		}
		else
		{	//수신함
			document.getElementsByName("alimy")[0].disabled =false;
			document.getElementsByName("alimy")[1].disabled = false;
		}
	}


	// 공백체크
	function send() {
		var form = document.form;

		

		// 휴대폰 번호 체크
		if ($.trim($("#M_Hand_Phone2").val()) != "" || $.trim($("#M_Hand_Phone3").val()) != "") {

			if ($.trim($("#M_Hand_Phone2").val()) == "") {
				CautionResultView(1, "휴대폰 번호를 입력해 주세요.");
				$("#M_Hand_Phone2").focus();
				return false;
			}
			if ($("#M_Hand_Phone2").val().length < 3 || check_num($("#M_Hand_Phone2").val()) == false) {
				CautionResultView(1, "휴대폰 번호를 정확히 입력해 주세요.");
				$("#M_Hand_Phone2").focus();
				return false;
			}

			if ($.trim($("#M_Hand_Phone3").val()) == "") {
				CautionResultView(1, "휴대폰 번호를 입력해 주세요.");
				$("#M_Hand_Phone3").focus();
				return false;
			}
			if ($("#M_Hand_Phone3").val().length < 4 || check_num($("#M_Hand_Phone3").val()) == false) {
				CautionResultView(1, "휴대폰 번호를 정확히 입력해 주세요.");
				$("#M_Hand_Phone3").focus();
				return false;
			}

			$("#M_Hand_Phone").val($("#M_Hand_Phone1").val() + "-" + $("#M_Hand_Phone2").val() + "-" + $("#M_Hand_Phone3").val());
		}

		// 전화번호 체크
		if ($("#M_Home_Phone1").val() == "etc") {
			if ($.trim($("#M_Home_Phone_Etc").val()) == "") {
				CautionResultView(10, "전화번호를 입력해 주세요.");
				$("#M_Home_Phone_Etc").focus();
				return false;
			}

			$("#M_Home_Phone").val($("#M_Home_Phone_Etc").val());

		} else {
			if ($("#M_Home_Phone1").val() != "" || $.trim($("#M_Home_Phone2").val()) != "" || $.trim($("#M_Home_Phone3").val()) != "") {

				if ($("#M_Home_Phone1").val() == "") {
					CautionResultView(10, "전화번호를 입력해 주세요.");
					$("#M_Home_Phone1").focus();
					return false;
				}

				if ($.trim($("#M_Home_Phone2").val()) == "") {
					CautionResultView(10, "전화번호를 입력해 주세요.");
					$("#M_Home_Phone2").focus();
					return false;
				}
				if ($("#M_Home_Phone2").val().length < 3 || check_num($("#M_Home_Phone2").val()) == false) {
					CautionResultView(10, "전화번호를 정확히 입력해 주세요.");
					$("#M_Home_Phone2").focus();
					return false;
				}

				if ($.trim($("#M_Home_Phone3").val()) == "") {
					CautionResultView(10, "전화번호를 입력해 주세요.");
					$("#M_Home_Phone3").focus();
					return false;
				}
				if ($("#M_Home_Phone3").val().length < 3 || check_num($("#M_Home_Phone3").val()) == false) {
					CautionResultView(10, "전화번호를 정확히 입력해 주세요.");
					$("#M_Home_Phone3").focus();
					return false;
				}

				$("#M_Home_Phone").val($("#M_Home_Phone1").val() + "-" + $("#M_Home_Phone2").val() + "-" + $("#M_Home_Phone3").val());
			}
		}

		// 이메일 체크
		if ($.trim($("#Email_ID").val()) != "" || $.trim($("#Email_Addr_Text").val()) != "") {
			var Email_ID = $.trim($("#Email_ID").val());
			var Email_Addr_Text = $.trim($("#Email_Addr_Text").val());
			var Email_Addr = form.Email_Addr.options[form.Email_Addr.selectedIndex].value;
			if (Email_ID == "")
			{
				CautionResultView(2, "이메일을 입력해 주세요.");
				$("#Email_ID").focus();
				return false;
			}

			if (Email_Addr_Text == "")
			{
				CautionResultView(2, "이메일을 사업자를 선택해 주세요.");
				$("#Email_Addr").focus();
				return false;
			}

			if (! email_check_1(Email_ID) )
			{
				CautionResultView(2, "이메일 주소 형식을 다시 확인해 주세요.");
				$("#Email_ID").focus();
				return false;
			}

			var Email_Addr_Text = $("#Email_Addr_Text").val();
			if (! email_check_1(Email_Addr_Text) )
			{
				CautionResultView(2, "이메일 주소 형식을 다시 확인해 주세요.");
				$("#Email_Addr_Text").focus();
				return false;
			}

			var Email = Email_ID + "@" + Email_Addr_Text
			if (email_check_2(Email) == false)
			{
				CautionResultView(2, "이메일 주소 형식을 다시 확인해 주세요.");
				$("#Email_Addr_Text").focus();
				return false;
			}

			$("#M_Email").val(Email);
		}

		if ($("#M_Home_Phone").val() == "" && $("#M_Hand_Phone").val() == "" && $("#M_Email").val() == "") {
			CautionResultView(1, "전화번호, 휴대폰 번호, 이메일 중 1가지 정보를 입력해 주세요.");
			$("#M_Hand_Phone2").focus();
			return false;
		}

		//입사지원 내역이 있는 경우 연락처 삭제 시 체크 (연락처 중 집전화 또는 휴대폰 또는 이메일만 공개하고 입사지원 한 경우)
		

		// 주소 체크
		/*   // 주소 필수값 제거함.
		if ($("#M_ZipCode").val() != "" || $.trim($("#M_Addr_Text").val()) != "" || ($.trim($("#M_Addr_Text1").val()) != "" && $("#M_Addr_Text1").val() != "상세주소를 입력해 주세요.")) {
			if ($("#M_ZipCode").val() == "") {
				CautionResultView(4, "주소 검색을 위해 버튼을 클릭해 주세요.");
				$("#M_ZipCode").focus();
				return false;
			}

			if ($("#M_Addr_Text").val() == "") {
				CautionResultView(5, "주소 검색을 위해 버튼을 클릭해 주세요.");
				$("#M_Addr_Text").focus();
				return false;
			}

			if ($.trim($("#M_Addr_Text1").val()) == "" || $("#M_Addr_Text1").val() == "상세주소를 입력해 주세요.") {
				CautionResultView(5, "상세주소를 입력해 주세요.");
				$("#M_Addr_Text1").focus();
				return false;
			}
		} */

		//인재정보 노출 확인 체크하기.

		var param = "M_Home_Phone=" + $("#M_Home_Phone").val();
		param += "&M_Hand_Phone=" + $("#M_Hand_Phone").val();
		param += "&M_Email=" + $("#M_Email").val();		
		param += "&1=1";	//혹시 모르는 정보 때문에 넣어둠.

		$.ajax({
			type: "GET",
			url: "/Include/Text_User/Resume_Open_Check_Ajax.asp",	//점프업 노출하기.
			data: param,
			async: false,
			success: function(html) {
				if(html.length > 100) {
					$(".ly_popup_info").show().html(html);
				} else {
					form.submit();
				}
			}
		});
		return false;
	}

	function ReNameWinOpen(){
			var url = '/Text/ReNameCertPop.asp?Mem_Type=GG&OEM_No=&ReNameCert=1';
			var popupWindow = window.open( url, "ReNameWinOpen", "top=100, left=100, status=0, width=430, height=400" );
			popupWindow.focus();
			return;
	}

//-->
</script>
</head>

<body id="secMbr" class="mbrSubMng mbrSubMngGG mbrSubMngInfo">

<div id="skipNavigation">
	<p><a href="https://www.jobkorea.co.kr/Text_User/User_Info_Mng.asp#container">메뉴 건너뛰기</a></p>
</div>
<hr>

<!--// Header Area -->

<script type="text/javascript">
<!--
	function go_Main(){
		
		top.location.href = "http://www.jobkorea.co.kr";
		
	}
//-->
</script>


<hr>

<div class="devGuideBox ly_popup_info" style="top: 22px; left: 912px; display: none;"></div>
<div id="wrap">
	<!--// Contents Area -->
	<div id="container">
		<div id="content">
			<h1 class="skip">회원정보 수정</h1>
			<form name="form" method="post" action="https://www.jobkorea.co.kr/Text_User/User_Info_Mng_Ok.asp">
				<input type="hidden" name="M_Hand_Phone" id="M_Hand_Phone" value="">
				<input type="hidden" name="M_Home_Phone" id="M_Home_Phone" value="">
				<input type="hidden" name="R_No" id="R_No" value="">
				<input type="hidden" name="Alimy_Chk" id="Alimy_Chk" value="0">
				<input type="hidden" name="GoodJob_Mailing_Stat" id="GoodJob_Mailing_Stat" value="">
				<input type="hidden" name="OEM_No" id="OEM_No" value="">
				<input type="hidden" name="re_url" id="re_url" value="">
				<fieldset>
				<legend>회원정보 수정 입력폼</legend>
				<div class="mbrSec mbrMngInfo">
					<h2 class="mbrHeading2">
						<img src="./resources/mbr_h_mng_gg.gif" alt="회원정보 수정">
					</h2>
					<div class="mbrTplDesc">
						<p>회원님의 정보를 수정·확인하실 수 있습니다.</p>
					</div>
					<div class="mbrTplData2">
						<table summary="이 표는 회원정보 수정 입력폼으로 아이디, 비밀번호, 비밀번호확인, 이름, 생년월일/성별, 연락처, 이메일을 나타내고 있습니다.">
							<caption><span class="skip">회원정보 수정 입력폼</span></caption>
							<colgroup>
								<col width="110px">
								<col width="87px">
								<col width="*">
							</colgroup>
							<tbody><tr>
								<th scope="row" colspan="2"><label for="lb_id"><span class="blank"></span> 아이디</label></th>
								<td>
									<div class="social_row"><strong>session_id</strong>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row" colspan="2"><span class="blank"></span> 이름 <img alt="필수입력사항" src="./resources/icon_b.gif"></th>
								<td colspan="3"><input type="hidden" class="txtForm" id="M_Name" name="M_Name" size="12" maxlength="15" value="">select member_name from kh_member where member_id = session_id;
								</td>
							</tr>
						
							<tr>
								<th class="contectInfo" rowspan="2" style="border-right:1px solid #e5e5e5;"><span class="blank"></span> 연락처 <img alt="필수입력사항" src="./resources/icon_b.gif"></th>
								<th scope="row">휴대폰</th>
								<td>
									<div class="mbrHelpWrap">
										<div class="mobile">
											<label for="M_Hand_Phone1" class="blind">휴대폰</label>
											<input type="text" name="M_Hand_Phone2" id="M_Hand_Phone2" maxlength="13" title="휴대폰번호" class="ipText ipTel ipNum devNoPh moveNext" onkeydown="handlerNum(this);" value="select member_phone from kh_member where member_id = session_id" style="ime-mode:disabled; float:left; width:400px;">
											<div style="left:403px; top:0px;display:none;" class="mbrTplLayer mbrTplLayer_1 mbrLayerHelp" id="CautionResult1" name="CautionResult">
												<div class="desc">
													<p>휴대폰 번호를 입력해 주세요</p>
												</div>
												<span class="arrow"></span>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="Email_ID">이메일</label></th>
								<td>
									<div class="mbrHelpWrap">
										<input type="hidden" name="M_Email" id="M_Email" value="">
										<input type="text" name="Email_ID" id="Email_ID" maxlength="30" style="width:400px;" class="ipText" value="select member_email from kh_member where member_id = session_id">
										<div style="left:455px; display:none;" class="mbrTplLayer mbrTplLayer_1 mbrLayerHelp" id="CautionResult2" name="CautionResult">
											<div class="desc">
												<p>이메일을 입력해 주세요</p>
											</div>
											<span class="arrow"></span>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row" colspan="2"><span class="blank"></span> 개인 홈페이지</th>
								<td colspan="3">
									<div class="mbrHelpWrap">
										<input type="text" id="M_Homepage" name="M_Homepage" maxlength="70" style="width:300px;" class="ipText" value="">
										<span class="assist">(블로그, SNS, 미니홈피도 등록 가능합니다.)</span>
										<div style="left:515px;display:none;" class="mbrTplLayer mbrTplLayer_1 mbrLayerHelp" id="CautionResult3" name="CautionResult">
											<div class="desc">
												<p>홈페이지 주소를 입력해 주세요.</p>
											</div>
											<span class="arrow"></span>
										</div>
									</div>
								</td>
							</tr>
						</tbody></table>
					</div>
				</div>
				<hr>
				<p class="mbrBtnFunc">
					<span class="customBtn">
						<a onclick="send();" style="cursor:pointer;">
							<span>수정하기</span>
						</a>
					</span>
					<span class="customBtn2">
						<button type="button" onclick="location.href=&#39;http://www.jobkorea.co.kr/Text_User/GG_Home.asp&#39;">
							<span>취소</span>
						</button>
					</span>
				</p>
			</fieldset>
		</form>
		</div>
		<hr>
	</div>
</div>
