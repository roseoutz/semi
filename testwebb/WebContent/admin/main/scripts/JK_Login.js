(function($) {
	$(document).ready(function(){		
			//회원 구분 값 클래스값 변경 처리
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

			//로그인 box 스타일 변경처리
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
			

			//그림문자 노출 케이스 노출 추가하기
			if($("#Login_Stat").val() >= "3" && $("#Login_Stat").val() <= "7")
			{
				$("#loginFormWrite").addClass("loginCaptcha"); 
				$(".loginImgTxt").removeClass("devHide");
			}	
		
			
			//로그인 회원 구분값 자동 세팅 클래스값 변경 처리
			if($("#m_type").val() !="")
			{
				switch($("#m_type").val()){
					case "M" :  break;  //기본값 이므로 패스
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



//회원 구분 비교값 치환
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



	//로그인 함수
	function	login_send(){
			var form = document.form;		
			var now_mtype= trans_memType($("#DB_Name").val());
				
			if (now_mtype != "M") {
				if($('[name=Co_DB_Name]:checked').length == 0) { 
					alert("Login 형태(기업회원, 서치펌회원, 파견·대행회원, 교육기관회원)를 선택하세요."); 
					$("#lb_memberGg").focus(); 
					return false;									
				} else {
					$("#DB_Name").val($('[name=Co_DB_Name]:checked').val());
				}
			}
			if($("#M_ID").val() == "" ){ alert("아이디를 입력하세요."); $("#M_ID").focus(); return false; }
			if($("#M_PWD").val() == "" ){ alert("비밀번호를 입력하세요."); $("#M_PWD").focus(); return false; }			
			if($("#Login_Stat").val() > "2" && $("#gtxt").val() ==""){alert("그림 문자를 입력하세요."); $("#gtxt").focus(); return  false;	}			
			if(form.re_url.value != "" && form.re_url.value.substring(0,7) != "http://" && form.re_url.value.substring(0,8) != "https://"){ 
				form.re_url.value = $("#returnHost").val() + form.re_url.value; 
			} 
											
			// 로그인 회원 구분값이 있고, 회원 구분이 일치 하지않으면 해당회원 홈으로 보내도록 처리
			if(   $("#m_type").val() != ""  &&  $("#m_type").val() != now_mtype     )
			{
				form.re_url.value = "";	
			}

			//회원 구분값이 CHS 이면 여기서 비교
			if(   $("#m_type").val() == "CHS"  &&  !(now_mtype  == "C" ||  now_mtype  == "H"  || now_mtype  == "S")  )
			{
				form.re_url.value = "";									
			}
						
			form.target="_top";	
			form.action =  $("#jkwww_host").val() + "/Login/Login.asp";	
			if(('http'+'s') == form.action.substring(0,5)) {
				return true;
			} else {
						//alert("네트워크에 일시적인 장애가 발생했습니다. 잠시 후 다시 시도해 주세요.");
				return false; 
			}
	}

	//그림문자를 위한 함수
	function RefreshImage(valImageId) {
		var objImage = document.images[valImageId];
		if (objImage == undefined) {
			return;
		}
		var now = new Date();
		objImage.src = objImage.src.split('?')[0] + '?x=' + now.toUTCString();
	}
	
//]]>