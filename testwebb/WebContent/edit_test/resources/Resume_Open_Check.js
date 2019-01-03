<!--
$(document).ready(function() {
	
	//닫기
	$(".ly_popup_info").on("click", ".close button,#dev_ly_cancel", function() {
		$(".ly_popup_info").hide();
	});
	
	//체크사항 처리
	$(".ly_popup_info").on("click", "#P_Hidden_Stat1,#P_Hidden_Stat2,#P_Hidden_Stat3,#P_AnyTime", function() {
		var $this = $(this);
		switch($this.attr("id")) {
			case "P_Hidden_Stat1":	//전화번호
				P_Home_Phone_Check();
				AnyTime_disabled();
				break;
			case "P_Hidden_Stat2":	//휴대폰
				P_Hand_Phone_Check();
				AnyTime_disabled();
				break;
			case "P_Hidden_Stat3":	//이메일
				P_Email_Check();
				break;
			case "P_AnyTime":	//연락 가능한 시간
				P_AnyTime_Check();
				break;
			default:
				break;
		}
	});

	//통화 가능한 시간 체크
	$(".ly_popup_info").on("blur", ".dev_phone", function() {
		var $this = $(this);
		AnyTime_disabled();
	});
	
	//숫자만 체크함.
	$(".ly_popup_info").on("keyup", "#P_Hand_Phone2,#P_Hand_Phone3,#P_Home_Phone2,#P_Home_Phone3", function() {
		if(!digitCheck($(this).val())) {
			alert("연락처는 숫자만 입력해 주십시오.");			
			$(this).val("").focus();
			return false;
		}
	});

	//전화번호 국번 변경시
	$(".ly_popup_info").on("change", "#P_Home_Phone1", function() {
		var $this = $(this);
		P_Home_Phone_Change();
	});

	//이메일 변경시
	$(".ly_popup_info").on("change", "#P_Email_Addr", function() {
		var $this = $(this);
		P_Email_Change();
	});

	//등록하기
	$(".ly_popup_info").on("click", "#dev_ly_confirm", function() {
		var $this = $(this);
		
		if($("#P_Hand_Phone2").val() != "" || $("#P_Hand_Phone3").val() != "") {
			if($("#P_Hand_Phone2").val() == "" || $("#P_Hand_Phone2").val().length < 3) {
				alert("휴대폰 번호를 정확히 입력해 주십시오.");			
				$("#P_Hand_Phone2").focus();
				return false;
			}	
			if(!digitCheck($("#P_Hand_Phone2").val())) {
				alert("휴대폰 번호는 숫자만 입력해 주십시오.");			
				$("#P_Hand_Phone2").val("").focus();
				return false;
			}
			if($("#P_Hand_Phone3").val() == "" || $("#P_Hand_Phone3").val().length < 4) {
				alert("휴대폰 번호를 정확히 입력해 주십시오.");			
				$("#P_Hand_Phone2").focus();
				return false;
			}	
			if(!digitCheck($("#P_Hand_Phone3").val())) {
				alert("휴대폰 번호는 숫자만 입력해 주십시오.");			
				$("#P_Hand_Phone3").val("").focus();
				return false;
			}
			$("#P_Hand_Phone").val($("#P_Hand_Phone1 option:selected").val() + "-" + $("#P_Hand_Phone2").val() + "-" + $("#P_Hand_Phone3").val());					
		} else {
			$("#P_Hand_Phone").val("");
		}
		if($("#P_Hidden_Stat2").is(":checked") && $("#P_Hand_Phone2").val() == "") {
			alert("인사담당자에게 연락 받을 수 있도록 휴대폰 번호를 입력해 주세요.");
			$("#P_Hand_Phone2").focus();
			return false;
		}	

		if($("#P_Home_Phone1 option:selected").val() == "etc") {
			if($("#P_Home_Phone_Etc").val() == "" || $("#P_Home_Phone_Etc").val().length < 4) {
				alert("전화번호를 정확히 입력해 주십시오.");			
				$("#P_Home_Phone_Etc").focus();
				return false;
			}	
			$("#P_Home_Phone").val($("#P_Home_Phone_Etc").val());
		} else {
			if($("#P_Home_Phone1 option:selected").val() != "" || $("#P_Home_Phone2").val() != "" || $("#P_Home_Phone3").val() != "") {
				if($("#P_Home_Phone1 option:selected").val() == "") {
					alert("전화번호 국번을 선택해 주십시오.");			
					$("#P_Home_Phone1").focus();
					return false;
				}		
				if($("#P_Home_Phone2").val() == "" || $("#P_Home_Phone2").val().length < 3) {
					alert("전화번호를 정확히 입력해 주십시오.");			
					$("#P_Home_Phone2").focus();
					return false;
				}	
				if(!digitCheck($("#P_Home_Phone2").val())) {
					alert("전화번호는 숫자만 입력해 주십시오.");			
					$("#P_Home_Phone2").val("").focus();
					return false;
				}
				if($("#P_Home_Phone3").val() == "" || $("#P_Home_Phone3").val().length < 4) {
					alert("전화번호를 정확히 입력해 주십시오.");			
					$("#P_Home_Phone2").focus();
					return false;
				}	
				if(!digitCheck($("#P_Home_Phone3").val())) {
					alert("전화번호는 숫자만 입력해 주십시오.");			
					$("#P_Home_Phone3").val("").focus();
					return false;
				}
				$("#P_Home_Phone").val($("#P_Home_Phone1 option:selected").val() + "-" + $("#P_Home_Phone2").val() + "-" + $("#P_Home_Phone3").val());
			} else {
				$("#P_Home_Phone").val("");
			}
		}
		if($("#P_Hidden_Stat1").is(":checked") && $("#P_Home_Phone1 option:selected").val() == "") {
			alert("인사담당자에게 연락 받을 수 있도록 전화번호를 입력해 주세요.");
			$("#P_Home_Phone1").focus();
			return false;
		}	


		if ($("#P_Email_ID").val() != "" || $("#P_Email_Addr_Text").val() != "") {
			if($("#P_Email_ID").val() == "" || $("#P_Email_ID").val().length < 2) {
				alert("이메일 ID를 입력해 주십시오.");			
				$("#P_Email_ID").focus();
				return false;
			}		
			if(!emailidCheck($("#P_Email_ID").val())) {
				alert("이메일 ID에는 영문 소문자, 숫자, 특수문자(._-)만 사용 가능합니다.");
				$("#P_Email_ID").focus();
				return false;
			}
			if($("#P_Email_Addr option:selected").val() == "") {
				alert("이메일을 선택해 주십시오.");			
				$("#P_Email_Addr").focus();
				return false;
			}	
			if($("#P_Email_Addr_Text").val() == "" || $("#P_Email_Addr_Text").val().length < 4) {
				alert("이메일 정보를 입력해 주십시오.");			
				$("#P_Email_Addr_Text").focus();
				return false;
			}		
			$("#P_Email").val($("#P_Email_ID").val() + "@" + $("#P_Email_Addr_Text").val());
			if(!emailChk($("#P_Email").val())) { 
				alert("이메일 정보가 정확하지 않습니다.");
				$("#P_Email_ID").focus();;
				return false;
			}
		} else {
			$("#P_Email").val("");
		}
		if($("#P_Hidden_Stat3").is(":checked") && $("#P_Email_ID").val() == "") {
			alert("인사담당자에게 연락 받을 수 있도록 이메일을 입력해 주세요.");
			$("#P_Email_ID").focus();
			return false;
		}	
		
		var Open_Cnt = 0;	//공개 카운트
		if($("#P_Home_Phone").val().length > 4 && $("#P_Hidden_Stat1").is(":checked")) {
			Open_Cnt++;
		}
		if($("#P_Hand_Phone").val().length > 4 && $("#P_Hidden_Stat2").is(":checked")) {
			Open_Cnt++;
		}
		if($("#P_Email").val().length > 4 && $("#P_Hidden_Stat3").is(":checked")) {
			Open_Cnt++;
		}
		if(Open_Cnt <= 0) {
			alert("회원님의 이력서가 인재정보에 등록되어 있습니다.\n인사담당자에게 연락 받을 수 있도록 최소 1개의 연락처를 선택해 주세요.");
			$("#P_Hidden_Stat2").focus();
			return false;
		}

		var hidden_Phone = $("#hidden_Phone").val();
		var hidden_Mobile = $("#hidden_Mobile").val();
		var hidden_Email = $("#hidden_Email").val();

		if(hidden_Phone == "1" && $("#P_Home_Phone").val() == "") {
			alert("전화번호만 공개하고 입사지원한 내역이 있습니다.\n\n전화번호를 삭제할 경우, 인사담당자의 연락을 받을 수\n없으므로 삭제가 불가합니다.");
			$("#P_Home_Phone1").focus();
			return false;
		}
		if(hidden_Mobile == "1" && $("#P_Hand_Phone").val() == "") {
			alert("휴대폰만 공개하고 입사지원한 내역이 있습니다.\n\n휴대폰 번호를 삭제할 경우 인사담당자의 연락을 받을 수\n없으므로 삭제가 불가합니다.");
			$("#P_Hand_Phone2").focus();
			return false;
		}
		if(hidden_Email == "1" && $("#P_Email").val() == "") {
			alert("이메일만 공개하고 입사지원한 내역이 있습니다.\n\n이메일을 삭제할 경우 인사담당자의 연락을 받을 수\n없으므로 삭제가 불가합니다.");
			$("#P_Email_ID").focus();
			return false;
		}

		if(!$("#P_AnyTime").is(":disabled") && ($("#P_AnyTime").is(":checked") || $("#P_Call_Psbl_Start_Hour").val() != "" || $("#P_Call_Psbl_End_Hour").val() != "")) {
			if (!$("#P_Hidden_Stat1").is(":checked") && !$("#P_Hidden_Stat2").is(":checked")) {
				alert("휴대폰 또는 전화번호를 공개 후 시간을 선택 해 주세요.");
				return false;
			}
			if(!$("#P_AnyTime").is(":checked")) {
				if($("#P_Call_Psbl_Start_Hour").val() == "") {
					alert("통화 가능한 시간을 선택해 주세요.");
					$("#P_Call_Psbl_Start_Hour").focus();
					return false;
				}
				if($("#P_Call_Psbl_End_Hour").val() == "") {
					alert("통화 가능한 시간을 선택해 주세요.");
					$("#P_Call_Psbl_End_Hour").focus();
					return false;
				}
			}
		}
		
		var param = $("#InForm").serialize();
		param += "&1=1";	//혹시 모르는 정보 때문에 넣어둠.

		$.ajax({
			type: "POST",
			url: "/Include/Text_User/Resume_Open_Check_Ok_JSON.asp",	//현재 로그인 정보를 확인함.
			dataType: 'json',
			data: param,
			success: function(rst) {   
				if(rst.rc == "1") {
					go_trans_data();
					send();	//원래 로직으로 이동함.
				} else {
					alert(rst.msg);
				}
			}
		}); 

		return false;
	});

	//텍스트 박스 길이제한
	$(".ly_popup_info").on("blur", ":text,input[type=search],input[type=tel]", function() {
		var $this = $(this);
		if(!chklen2($this,parseInt($this.attr("maxlength"),10))) {
			alert(chklen2_showtext($this.attr("maxlength")));
			$this.focus();
			return false;
		}
	});

});
// 현재 데이터를 변경시킴.
var go_trans_data = function() {
	
	$("#M_Hand_Phone").val($("#P_Hand_Phone").val());
	$("#M_Hand_Phone1").val($("#P_Hand_Phone1").val());
	$("#M_Hand_Phone2").val($("#P_Hand_Phone2").val());
	$("#M_Hand_Phone3").val($("#P_Hand_Phone3").val());

	$("#M_Home_Phone").val($("#P_Home_Phone").val());
	$("#M_Home_Phone1").val($("#P_Home_Phone1").val());
	$("#M_Home_Phone2").val($("#P_Home_Phone2").val());
	$("#M_Home_Phone3").val($("#P_Home_Phone3").val());
	$("#M_Home_Phone_Etc").val($("#P_Home_Phone_Etc").val());

	$("#M_Email").val($("#P_Email").val());
	$("#Email_ID").val($("#P_Email_ID").val());
	$("#Email_Addr_Text").val($("#P_Email_Addr_Text").val());
	$("#Email_Addr").val($("#P_Email_Addr").val());

}

// 통화 가능 시간 disabled 여부
var AnyTime_disabled = function() {

	if($("input:checkbox[id='P_Hidden_Stat1']").is(":checked") || $("input:checkbox[id='P_Hidden_Stat2']").is(":checked")) {
		$("input:checkbox[id='P_AnyTime']").attr("disabled",false);
		P_AnyTime_Check();
	} else {
		$("input:checkbox[id='P_AnyTime']").attr("disabled",true);
		$("#P_Call_Psbl_Start_Hour").find("option:eq(0)").attr("selected", "selected");
		$("#P_Call_Psbl_End_Hour").find("option:eq(0)").attr("selected", "selected");
		$("#P_Call_Psbl_Start_Hour").attr("disabled",true);
		$("#P_Call_Psbl_End_Hour").attr("disabled",true);
		$("#P_Call_Psbl_Start_Hour").addClass("nonSel");
		$("#P_Call_Psbl_End_Hour").addClass("nonSel");	
	}
}

//전화번호 체크
var P_Home_Phone_Check = function() {
	var isBool = true;
	/*
	if($("input:checkbox[id='P_Hidden_Stat1']").is(":checked")) {
		isBool = false;
	}
	$("#P_Home_Phone1").attr("disabled",isBool);
	if($("#P_Home_Phone2").is(":visible")) {
		$("#P_Home_Phone2").attr("disabled",isBool);
		$("#P_Home_Phone3").attr("disabled",isBool);
	} else {
		$("#P_Home_Phone_Etc").attr("disabled",isBool);
	}*/
}

//전화번호 국번 변경시
var P_Home_Phone_Change = function() {
	P_Home_Phone_Check();
	if($("#P_Home_Phone1").is(":visible")) {
		if($("#P_Home_Phone1").val() == "etc") {
			$("#P_Home_Phone_Etc").show();
			//$("#P_Home_Phone_Etc").attr("disabled",false);
			
			$("#P_Home_Phone2").hide();
			$("#P_Home_Phone3").hide();
			$("#P_Home_Phone5").hide();
			//$("#P_Home_Phone2").attr("disabled",true);
			//$("#P_Home_Phone3").attr("disabled",true);
		} else {
			$("#P_Home_Phone_Etc").hide();
			//$("#P_Home_Phone_Etc").attr("disabled",true);
			
			$("#P_Home_Phone2").show();
			$("#P_Home_Phone3").show();
			$("#P_Home_Phone5").show();
			//$("#P_Home_Phone2").attr("disabled",false);
			//$("#P_Home_Phone3").attr("disabled",false);
		}
	}
}

//휴대폰 체크
var P_Hand_Phone_Check = function() {
	var isBool = true;
	/*
	if($("input:checkbox[id='P_Hidden_Stat2']").is(":checked")) {
		isBool = false;
	}
	$("#P_Hand_Phone1").attr("disabled",isBool);
	$("#P_Hand_Phone2").attr("disabled",isBool);
	$("#P_Hand_Phone3").attr("disabled",isBool);
	*/
}

//이메일 체크
var P_Email_Check = function() {
	var isBool = true;
	/*
	if($("input:checkbox[id='P_Hidden_Stat3']").is(":checked")) {
		isBool = false;
	}
	$("#P_Email_ID").attr("disabled",isBool);
	$("#P_Email_Addr_Text").attr("disabled",isBool);
	$("#P_Email_Addr").attr("disabled",isBool);
	*/
}

//이메일 변경시
var P_Email_Change = function() {
	P_Email_Check();
	if($("#P_Email_Addr").val() == "etc") {
		$("#P_Email_Addr_Text").attr("readonly",false);	
		$("#P_Email_Addr_Text").val("");
	} else {
		$("#P_Email_Addr_Text").attr("readonly",true);
		$("#P_Email_Addr_Text").val($("#P_Email_Addr").val());
	}
}

//연락 가능시간 체크
var P_AnyTime_Check = function() {
	var isBool = false;
	if($("input:checkbox[id='P_AnyTime']").is(":checked")) {
		isBool = true;
		$("#P_Call_Psbl_Start_Hour").find("option:eq(0)").attr("selected", "selected");
		$("#P_Call_Psbl_End_Hour").find("option:eq(0)").attr("selected", "selected");
	}
	$("#P_Call_Psbl_Start_Hour").attr("disabled",isBool);
	$("#P_Call_Psbl_End_Hour").attr("disabled",isBool);

	if(isBool) {
		$("#P_Call_Psbl_Start_Hour").addClass("nonSel");
		$("#P_Call_Psbl_End_Hour").addClass("nonSel");	
	} else {
		$("#P_Call_Psbl_Start_Hour").removeClass("nonSel");
		$("#P_Call_Psbl_End_Hour").removeClass("nonSel");
	}
}

//숫자체크
var digitCheck = function(str) {
	var regDigit = /[^0-9]/g;
	if (!regDigit.test(str)) {
		return true; //숫자 아닌값이 들어있을 경우.	
	} else {
		return false;	//숫자인 경우만.
	}
}

//길이 제한하기 ID를 가지고 함.
//	slen[0] : 현재 한글까지 포함한 총길이
//	slen[0] : 한글을 한글자로 본 길이에서 짜를 위치
var chklen2 = function(id,len) {
	var reData;
	var slen;
	id.val($.trim(id.val()));
	reData = TLen(id.val(),len);
	slen = reData.split("|");
	
	//alert(slen[0] + " : " + len);
	if(parseInt(slen[0],10) > parseInt(len,10)) {		
		id.val(id.val().substr(0,slen[1]));
		id.focus();
		return false;	//길이가 틀림.
	} else {
		return true;	//정상적인 값
	}
}
//길이제한 문구노출
var chklen2_showtext = function(len) {
	return "최대 입력글자수는 영문 " + len + " 글자, 한글 " + Math.floor(len / 2)  + " 글자입니다.";
}

function TLen (str, in_len) {
//	
	var lenCount = 0	
	var sourcelen = 0

	for (i = 0; i < str.length; i++) {
		var code = str.charCodeAt(i)
		var ch = str.substr(i,1).toUpperCase()

		code = parseInt(code)

		if ((ch < "0" || ch > "9") && (ch < "A" || ch > "Z") && ((code > 255) || (code < 0))) {
			lenCount = lenCount + 2;
		} else {
			lenCount = lenCount + 1; 	  
		}
		if (lenCount <= in_len) {                  
			sourcelen = sourcelen + 1
		}
	}
	return lenCount + "|" + sourcelen;
}

//이메일아이디는 숫자와 영문 소문자 ._-도 가능함.
var emailidCheck = function(str) {
	var regId = /[^0-9a-z\.\_\-]/g;
	if (!regId.test(str)) {
		return true; //숫자 영문이 아닌값이 들어있을 경우.	
	} else {
		return false;	//숫자 영문인 경우만.
	}
}
//이메일 유효성체크
var emailChk = function(email) {
	var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	if(regEmail.test(email)) {
		return true;
	} else 	{				
		return false;
	} 
}
-->