(function($) {
	$(document).ready(function(){		
			//ȸ�� ���� �� Ŭ������ ���� ó��
			var $content =  $("#memberCategory span");
			$(".inpRadio").each(function(i){  							
					$(this).click(function(){
						$(".group").removeClass("on");
						$content.eq(i).addClass("on");	
						
						switch(i)
						{
							case 0 : $("#temp_dbname").val("M"); break;
							case 1 : $("#temp_dbname").val("C");break;
							case 2 : $("#temp_dbname").val("S"); break;
							case 3 : $("#temp_dbname").val("H"); break;
							case 4 : $("#temp_dbname").val("E"); break;	 					
						}						
					});			
			});

			//�α��� box ��Ÿ�� ����ó��
			$("#loginFormWrite .inpTxt").each(function(i){
					$(this).attr("autocomplete","off");
					if($(this).val() !=""){ $(this).removeClass("off").addClass("end");}
					$(this).live({
							focus : function(){ 									
								$(this).removeClass("off").addClass("end");	
							},
							blur : function(){													
								if ( $(this).val() !== "") 
								{
									$(this).removeClass("off").addClass("end");		
								}
								else
								{
									$(this).removeClass("end").addClass("off");		
								}
							}
					});
			});
			

			//�׸����� ���� ���̽� ���� �߰��ϱ�
			if($("#Login_Stat").val() >= "3" && $("#Login_Stat").val() <= "7")
			{
				$("#loginFormWrite").addClass("loginCaptcha"); 
				$(".loginImgTxt").removeClass("devHide");
			}	
		
			
			//�α��� ȸ�� ���а� �ڵ� ���� Ŭ������ ���� ó��
			if($("#m_type").val() !="")
			{
				switch($("#m_type").val()){
					case "M" :  break;  //�⺻�� �̹Ƿ� �н�
					case "C"  :  $("#temp_dbname").val("C"); $(".group").removeClass("on").eq(1).addClass("on");    $(".inpRadio").eq(1).attr("checked","true");  break;			
					case "CHS" : $("#temp_dbname").val("CHS"); $(".group").removeClass("on").eq(1).addClass("on");    $(".inpRadio").eq(1).attr("checked","true");  break;			
					case "S"  : $("#temp_dbname").val("S"); $(".group").removeClass("on").eq(2).addClass("on");    $(".inpRadio").eq(2).attr("checked","true");  break;		
					case "H"  : $("#temp_dbname").val("S");  $(".group").removeClass("on").eq(3).addClass("on");   $(".inpRadio").eq(3).attr("checked","true"); break;		
					case "E"  : $("#temp_dbname").val("E"); $(".group").removeClass("on").eq(4).addClass("on");   $(".inpRadio").eq(4).attr("checked","true"); break;	
				}
			}
			
			var $tab = $("#devMemTab");
			if ($tab.length > 0) {
				$tab.find("a").click(function () {
					$tab.find("li").removeClass("on");
					$(this).parent().addClass("on");
					if ($(this).attr("data-m-type") == "Co") {
						$("#DB_Name").val("");
						$("#devCoTab").show();
						$("#btnFbLogin").hide();
						$("#btnNvLogin").hide();
						$("#btnGlLogin").hide();
						$("#btnKaLogin").hide();
						$("#M_Alert").hide();
						$("#Co_Alert").show();
					} else {
						$("#DB_Name").val("GG");
						$("#devCoTab").hide();						
						$("#btnFbLogin").show();
						$("#btnNvLogin").show();
						$("#btnGlLogin").show();
						$("#btnKaLogin").show();
						$("#M_Alert").show();
						$("#Co_Alert").hide();
					}
					return false;
				});
			}

			var $coR = $('[name=Co_DB_Name]');
			if ($coR.length > 0) {
				$coR.click(function (e) {
					$(this).closest("#devCoTab").find("label").removeClass("radioOn");
					$(this).next().addClass("radioOn");
				});
			}
	});
})(jQuery);

//<![CDATA[



//ȸ�� ���� �񱳰� ġȯ
function trans_memType(a){
var rtn_val = "";
	switch(a){
		case "GG" : rtn_val = "M"; break;
		case "GI" : rtn_val = "C"; break;
		case "SF" : rtn_val = "S"; break;
		case "HH" : rtn_val = "H"; break;
		case "Edu" : rtn_val = "E"; break;
		default : break;
	}
	return rtn_val;
}



	//�α��� �Լ�
	function	login_send(){
			var form = document.form;		
			var now_mtype= trans_memType($("#DB_Name").val());
				
			if (now_mtype != "M") {
				if($('[name=Co_DB_Name]:checked').length == 0) { 
					alert("Login ����(���ȸ��, ��ġ��ȸ��, �İߡ�����ȸ��, �������ȸ��)�� �����ϼ���."); 
					$("#lb_memberGg").focus(); 
					return false;									
				} else {
					$("#DB_Name").val($('[name=Co_DB_Name]:checked').val());
				}
			}
			if($("#M_ID").val() == "" ){ alert("���̵� �Է��ϼ���."); $("#M_ID").focus(); return false; }
			if($("#M_PWD").val() == "" ){ alert("��й�ȣ�� �Է��ϼ���."); $("#M_PWD").focus(); return false; }			
			if($("#Login_Stat").val() > "2" && $("#gtxt").val() ==""){alert("�׸� ���ڸ� �Է��ϼ���."); $("#gtxt").focus(); return  false;	}			
			if(form.re_url.value != "" && form.re_url.value.substring(0,7) != "http://" && form.re_url.value.substring(0,8) != "https://"){ 
				form.re_url.value = $("#returnHost").val() + form.re_url.value; 
			} 
											
			// �α��� ȸ�� ���а��� �ְ�, ȸ�� ������ ��ġ ���������� �ش�ȸ�� Ȩ���� �������� ó��
			if(   $("#m_type").val() != ""  &&  $("#m_type").val() != now_mtype     )
			{
				form.re_url.value = "";	
			}

			//ȸ�� ���а��� CHS �̸� ���⼭ ��
			if(   $("#m_type").val() == "CHS"  &&  !(now_mtype  == "C" ||  now_mtype  == "H"  || now_mtype  == "S")  )
			{
				form.re_url.value = "";									
			}
						
			form.target="_top";	
			form.action =  $("#jkwww_host").val() + "/Login/Login.asp";	
			if(('http'+'s') == form.action.substring(0,5)) {
				return true;
			} else {
						//alert("��Ʈ��ũ�� �Ͻ����� ��ְ� �߻��߽��ϴ�. ��� �� �ٽ� �õ��� �ּ���.");
				return false; 
			}
	}

	//�׸����ڸ� ���� �Լ�
	function RefreshImage(valImageId) {
		var objImage = document.images[valImageId];
		if (objImage == undefined) {
			return;
		}
		var now = new Date();
		objImage.src = objImage.src.split('?')[0] + '?x=' + now.toUTCString();
	}
	
//]]>