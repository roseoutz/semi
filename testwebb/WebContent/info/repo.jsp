<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 키워드 스크립트 시작 -->
<script src="https://connect.facebook.net/signals/config/1166416616740867?v=2.8.35&amp;r=stable" async=""></script><script async="" src="https://connect.facebook.net/en_US/fbevents.js"></script><script async="" src="//www.google-analytics.com/analytics.js"></script><script src="https://apis.google.com/_/scs/apps-static/_/js/k=oz.gapi.ko.BvhmgmKSDj0.O/m=client/rt=j/sv=1/d=1/ed=1/am=QQ/rs=AGLTcCP9M6hiTbqZV_BmjexEkTZYvFrc7Q/cb=gapi.loaded_0" async=""></script><script src="./info/resources/1166416616740867" async=""></script><script async="" src="./info/resources/fbevents.js"></script><script async="" src="./info/resources/analytics.js"></script><script src="./info/resources/cb=gapi.loaded_0" async=""></script><script type="text/javascript">
var EchoID = "jobkorea";
var EchoGoodNm = "";
var EchoAmount = "";
var EchoUIP = "";
var EchoTarget = "";
var EchoLogSend = "Y";
var EchoCV = "";
var EchoPN = "";
</script> 
<script type="text/javascript" src="./info/resources/EchoScriptV2.js"></script>
<!-- 키워드 스크립트 끝 -->


<!-- DataStory Javascript Tracking  -->
<script type="text/javascript" src="./info/resources/dslog.js" id="dslog_tag"></script>

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
					<link rel="stylesheet" type="text/css" href="./info/resources/common.css">
				
			<link rel="stylesheet" type="text/css" href="./info/resources/footer_sub.css">
	
	<link rel="stylesheet" type="text/css" href="./info/resources/gnb.css">
	<link rel="stylesheet" type="text/css" href="./info/resources/gnb_sub.css">

	
	<link rel="stylesheet" type="text/css" href="./info/resources/mbr_common.css">
	<link rel="stylesheet" type="text/css" href="./info/resources/mbr_tpl.css">
	
	<link rel="stylesheet" type="text/css" href="./info/resources/mbr_style.css">
	
<script type="text/javascript" src="./info/resources/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="./info/resources/Common_Regist.js"></script>
<script type="text/javascript" src="./info/resources/Resume_Open_Check.js"></script>
<script type="text/javascript" src="./info/resources/underscore.js"></script>
<script type="text/javascript" src="./info/resources/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script src="./info/resources/client_platform.js" gapi_processed="true"></script>
<script type="text/javascript" src="./info/resources/kakao.min.js"></script>
<script type="text/javascript" src="./info/resources/SNS.js"></script>
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

//-->
</script>