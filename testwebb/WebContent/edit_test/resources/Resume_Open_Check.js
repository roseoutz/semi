<!--
$(document).ready(function() {
	
	//�ݱ�
	$(".ly_popup_info").on("click", ".close button,#dev_ly_cancel", function() {
		$(".ly_popup_info").hide();
	});
	
	//üũ���� ó��
	$(".ly_popup_info").on("click", "#P_Hidden_Stat1,#P_Hidden_Stat2,#P_Hidden_Stat3,#P_AnyTime", function() {
		var $this = $(this);
		switch($this.attr("id")) {
			case "P_Hidden_Stat1":	//��ȭ��ȣ
				P_Home_Phone_Check();
				AnyTime_disabled();
				break;
			case "P_Hidden_Stat2":	//�޴���
				P_Hand_Phone_Check();
				AnyTime_disabled();
				break;
			case "P_Hidden_Stat3":	//�̸���
				P_Email_Check();
				break;
			case "P_AnyTime":	//���� ������ �ð�
				P_AnyTime_Check();
				break;
			default:
				break;
		}
	});

	//��ȭ ������ �ð� üũ
	$(".ly_popup_info").on("blur", ".dev_phone", function() {
		var $this = $(this);
		AnyTime_disabled();
	});
	
	//���ڸ� üũ��.
	$(".ly_popup_info").on("keyup", "#P_Hand_Phone2,#P_Hand_Phone3,#P_Home_Phone2,#P_Home_Phone3", function() {
		if(!digitCheck($(this).val())) {
			alert("����ó�� ���ڸ� �Է��� �ֽʽÿ�.");			
			$(this).val("").focus();
			return false;
		}
	});

	//��ȭ��ȣ ���� �����
	$(".ly_popup_info").on("change", "#P_Home_Phone1", function() {
		var $this = $(this);
		P_Home_Phone_Change();
	});

	//�̸��� �����
	$(".ly_popup_info").on("change", "#P_Email_Addr", function() {
		var $this = $(this);
		P_Email_Change();
	});

	//����ϱ�
	$(".ly_popup_info").on("click", "#dev_ly_confirm", function() {
		var $this = $(this);
		
		if($("#P_Hand_Phone2").val() != "" || $("#P_Hand_Phone3").val() != "") {
			if($("#P_Hand_Phone2").val() == "" || $("#P_Hand_Phone2").val().length < 3) {
				alert("�޴��� ��ȣ�� ��Ȯ�� �Է��� �ֽʽÿ�.");			
				$("#P_Hand_Phone2").focus();
				return false;
			}	
			if(!digitCheck($("#P_Hand_Phone2").val())) {
				alert("�޴��� ��ȣ�� ���ڸ� �Է��� �ֽʽÿ�.");			
				$("#P_Hand_Phone2").val("").focus();
				return false;
			}
			if($("#P_Hand_Phone3").val() == "" || $("#P_Hand_Phone3").val().length < 4) {
				alert("�޴��� ��ȣ�� ��Ȯ�� �Է��� �ֽʽÿ�.");			
				$("#P_Hand_Phone2").focus();
				return false;
			}	
			if(!digitCheck($("#P_Hand_Phone3").val())) {
				alert("�޴��� ��ȣ�� ���ڸ� �Է��� �ֽʽÿ�.");			
				$("#P_Hand_Phone3").val("").focus();
				return false;
			}
			$("#P_Hand_Phone").val($("#P_Hand_Phone1 option:selected").val() + "-" + $("#P_Hand_Phone2").val() + "-" + $("#P_Hand_Phone3").val());					
		} else {
			$("#P_Hand_Phone").val("");
		}
		if($("#P_Hidden_Stat2").is(":checked") && $("#P_Hand_Phone2").val() == "") {
			alert("�λ����ڿ��� ���� ���� �� �ֵ��� �޴��� ��ȣ�� �Է��� �ּ���.");
			$("#P_Hand_Phone2").focus();
			return false;
		}	

		if($("#P_Home_Phone1 option:selected").val() == "etc") {
			if($("#P_Home_Phone_Etc").val() == "" || $("#P_Home_Phone_Etc").val().length < 4) {
				alert("��ȭ��ȣ�� ��Ȯ�� �Է��� �ֽʽÿ�.");			
				$("#P_Home_Phone_Etc").focus();
				return false;
			}	
			$("#P_Home_Phone").val($("#P_Home_Phone_Etc").val());
		} else {
			if($("#P_Home_Phone1 option:selected").val() != "" || $("#P_Home_Phone2").val() != "" || $("#P_Home_Phone3").val() != "") {
				if($("#P_Home_Phone1 option:selected").val() == "") {
					alert("��ȭ��ȣ ������ ������ �ֽʽÿ�.");			
					$("#P_Home_Phone1").focus();
					return false;
				}		
				if($("#P_Home_Phone2").val() == "" || $("#P_Home_Phone2").val().length < 3) {
					alert("��ȭ��ȣ�� ��Ȯ�� �Է��� �ֽʽÿ�.");			
					$("#P_Home_Phone2").focus();
					return false;
				}	
				if(!digitCheck($("#P_Home_Phone2").val())) {
					alert("��ȭ��ȣ�� ���ڸ� �Է��� �ֽʽÿ�.");			
					$("#P_Home_Phone2").val("").focus();
					return false;
				}
				if($("#P_Home_Phone3").val() == "" || $("#P_Home_Phone3").val().length < 4) {
					alert("��ȭ��ȣ�� ��Ȯ�� �Է��� �ֽʽÿ�.");			
					$("#P_Home_Phone2").focus();
					return false;
				}	
				if(!digitCheck($("#P_Home_Phone3").val())) {
					alert("��ȭ��ȣ�� ���ڸ� �Է��� �ֽʽÿ�.");			
					$("#P_Home_Phone3").val("").focus();
					return false;
				}
				$("#P_Home_Phone").val($("#P_Home_Phone1 option:selected").val() + "-" + $("#P_Home_Phone2").val() + "-" + $("#P_Home_Phone3").val());
			} else {
				$("#P_Home_Phone").val("");
			}
		}
		if($("#P_Hidden_Stat1").is(":checked") && $("#P_Home_Phone1 option:selected").val() == "") {
			alert("�λ����ڿ��� ���� ���� �� �ֵ��� ��ȭ��ȣ�� �Է��� �ּ���.");
			$("#P_Home_Phone1").focus();
			return false;
		}	


		if ($("#P_Email_ID").val() != "" || $("#P_Email_Addr_Text").val() != "") {
			if($("#P_Email_ID").val() == "" || $("#P_Email_ID").val().length < 2) {
				alert("�̸��� ID�� �Է��� �ֽʽÿ�.");			
				$("#P_Email_ID").focus();
				return false;
			}		
			if(!emailidCheck($("#P_Email_ID").val())) {
				alert("�̸��� ID���� ���� �ҹ���, ����, Ư������(._-)�� ��� �����մϴ�.");
				$("#P_Email_ID").focus();
				return false;
			}
			if($("#P_Email_Addr option:selected").val() == "") {
				alert("�̸����� ������ �ֽʽÿ�.");			
				$("#P_Email_Addr").focus();
				return false;
			}	
			if($("#P_Email_Addr_Text").val() == "" || $("#P_Email_Addr_Text").val().length < 4) {
				alert("�̸��� ������ �Է��� �ֽʽÿ�.");			
				$("#P_Email_Addr_Text").focus();
				return false;
			}		
			$("#P_Email").val($("#P_Email_ID").val() + "@" + $("#P_Email_Addr_Text").val());
			if(!emailChk($("#P_Email").val())) { 
				alert("�̸��� ������ ��Ȯ���� �ʽ��ϴ�.");
				$("#P_Email_ID").focus();;
				return false;
			}
		} else {
			$("#P_Email").val("");
		}
		if($("#P_Hidden_Stat3").is(":checked") && $("#P_Email_ID").val() == "") {
			alert("�λ����ڿ��� ���� ���� �� �ֵ��� �̸����� �Է��� �ּ���.");
			$("#P_Email_ID").focus();
			return false;
		}	
		
		var Open_Cnt = 0;	//���� ī��Ʈ
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
			alert("ȸ������ �̷¼��� ���������� ��ϵǾ� �ֽ��ϴ�.\n�λ����ڿ��� ���� ���� �� �ֵ��� �ּ� 1���� ����ó�� ������ �ּ���.");
			$("#P_Hidden_Stat2").focus();
			return false;
		}

		var hidden_Phone = $("#hidden_Phone").val();
		var hidden_Mobile = $("#hidden_Mobile").val();
		var hidden_Email = $("#hidden_Email").val();

		if(hidden_Phone == "1" && $("#P_Home_Phone").val() == "") {
			alert("��ȭ��ȣ�� �����ϰ� �Ի������� ������ �ֽ��ϴ�.\n\n��ȭ��ȣ�� ������ ���, �λ������� ������ ���� ��\n�����Ƿ� ������ �Ұ��մϴ�.");
			$("#P_Home_Phone1").focus();
			return false;
		}
		if(hidden_Mobile == "1" && $("#P_Hand_Phone").val() == "") {
			alert("�޴����� �����ϰ� �Ի������� ������ �ֽ��ϴ�.\n\n�޴��� ��ȣ�� ������ ��� �λ������� ������ ���� ��\n�����Ƿ� ������ �Ұ��մϴ�.");
			$("#P_Hand_Phone2").focus();
			return false;
		}
		if(hidden_Email == "1" && $("#P_Email").val() == "") {
			alert("�̸��ϸ� �����ϰ� �Ի������� ������ �ֽ��ϴ�.\n\n�̸����� ������ ��� �λ������� ������ ���� ��\n�����Ƿ� ������ �Ұ��մϴ�.");
			$("#P_Email_ID").focus();
			return false;
		}

		if(!$("#P_AnyTime").is(":disabled") && ($("#P_AnyTime").is(":checked") || $("#P_Call_Psbl_Start_Hour").val() != "" || $("#P_Call_Psbl_End_Hour").val() != "")) {
			if (!$("#P_Hidden_Stat1").is(":checked") && !$("#P_Hidden_Stat2").is(":checked")) {
				alert("�޴��� �Ǵ� ��ȭ��ȣ�� ���� �� �ð��� ���� �� �ּ���.");
				return false;
			}
			if(!$("#P_AnyTime").is(":checked")) {
				if($("#P_Call_Psbl_Start_Hour").val() == "") {
					alert("��ȭ ������ �ð��� ������ �ּ���.");
					$("#P_Call_Psbl_Start_Hour").focus();
					return false;
				}
				if($("#P_Call_Psbl_End_Hour").val() == "") {
					alert("��ȭ ������ �ð��� ������ �ּ���.");
					$("#P_Call_Psbl_End_Hour").focus();
					return false;
				}
			}
		}
		
		var param = $("#InForm").serialize();
		param += "&1=1";	//Ȥ�� �𸣴� ���� ������ �־��.

		$.ajax({
			type: "POST",
			url: "/Include/Text_User/Resume_Open_Check_Ok_JSON.asp",	//���� �α��� ������ Ȯ����.
			dataType: 'json',
			data: param,
			success: function(rst) {   
				if(rst.rc == "1") {
					go_trans_data();
					send();	//���� �������� �̵���.
				} else {
					alert(rst.msg);
				}
			}
		}); 

		return false;
	});

	//�ؽ�Ʈ �ڽ� ��������
	$(".ly_popup_info").on("blur", ":text,input[type=search],input[type=tel]", function() {
		var $this = $(this);
		if(!chklen2($this,parseInt($this.attr("maxlength"),10))) {
			alert(chklen2_showtext($this.attr("maxlength")));
			$this.focus();
			return false;
		}
	});

});
// ���� �����͸� �����Ŵ.
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

// ��ȭ ���� �ð� disabled ����
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

//��ȭ��ȣ üũ
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

//��ȭ��ȣ ���� �����
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

//�޴��� üũ
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

//�̸��� üũ
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

//�̸��� �����
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

//���� ���ɽð� üũ
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

//����üũ
var digitCheck = function(str) {
	var regDigit = /[^0-9]/g;
	if (!regDigit.test(str)) {
		return true; //���� �ƴѰ��� ������� ���.	
	} else {
		return false;	//������ ��츸.
	}
}

//���� �����ϱ� ID�� ������ ��.
//	slen[0] : ���� �ѱ۱��� ������ �ѱ���
//	slen[0] : �ѱ��� �ѱ��ڷ� �� ���̿��� ¥�� ��ġ
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
		return false;	//���̰� Ʋ��.
	} else {
		return true;	//�������� ��
	}
}
//�������� ��������
var chklen2_showtext = function(len) {
	return "�ִ� �Է±��ڼ��� ���� " + len + " ����, �ѱ� " + Math.floor(len / 2)  + " �����Դϴ�.";
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

//�̸��Ͼ��̵�� ���ڿ� ���� �ҹ��� ._-�� ������.
var emailidCheck = function(str) {
	var regId = /[^0-9a-z\.\_\-]/g;
	if (!regId.test(str)) {
		return true; //���� ������ �ƴѰ��� ������� ���.	
	} else {
		return false;	//���� ������ ��츸.
	}
}
//�̸��� ��ȿ��üũ
var emailChk = function(email) {
	var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	if(regEmail.test(email)) {
		return true;
	} else 	{				
		return false;
	} 
}
-->