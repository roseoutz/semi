$(document).ready(function(){

	$("input.ipText").each(function(seq){
		$(this).bind("focus", function(){		
			$(this).addClass("ipStyleOn");				
			if ($(this).val() == ""){ // || seq != 1){
				$(this).parent().find(".mbrTplLayer.mbrTplLayer_1.mbrLayerHelp").show();
			}
		});	
		$(this).bind("blur", function(){		
			$(this).removeClass("ipStyleOn");	
			$(this).parent().find(".mbrTplLayer.mbrTplLayer_1.mbrLayerHelp").hide();	
		});			
	});

	$("select.ipSelect").each(function(){
		$(this).bind("focus", function(){		
			//$(this).addClass("ipStyleOn"); //--css에서 처리
			$(this).parent().find(".mbrTplLayer.mbrTplLayer_1.mbrLayerHelp").show();
		});	
		$(this).bind("blur", function(){		
			//$(this).removeClass("ipStyleOn");	//--css에서 처리
			$(this).parent().find(".mbrTplLayer.mbrTplLayer_1.mbrLayerHelp").hide();	
		});			
	});

	$("textarea.ipTextarea").each(function(){
		$(this).bind("focus", function(){		
			$(this).addClass("ipStyleOn");		
			$(this).parent().find(".mbrTplLayer.mbrTplLayer_1.mbrLayerHelp").show();
		});	
		$(this).bind("blur", function(){		
			$(this).removeClass("ipStyleOn");	
			$(this).parent().find(".mbrTplLayer.mbrTplLayer_1.mbrLayerHelp").hide();	
		});			
	});

	$("input.checkPwd").bind("keyup", function(){		
		if ($(this).val().length == 0) {
			$(this).parent().find(".mbrTplLayer.mbrTplLayer_1.mbrLayerHelp").show();				
		} else {
			$(this).parent().find(".mbrTplLayer.mbrTplLayer_1.mbrLayerHelp").hide();				
		}
	});

	$("input.moveNext").bind("keyup", function(){		
		var $maxlen = $(this).attr("maxlength");				
		var $curlen = $(this).val().length;
		
		if ($curlen >= $maxlen){
			var $nextid = $(this).attr("nextId");
			if(typeof($nextid) == "undefined") {
				$(this).next().next().focus();	
			} else {
				$("#"+$nextid).focus();
			}
		}
	});
});

//아이디 중복 체크
function id_unique_check(id_obj) {
	var chk_obj = $("#idcheck");
	if (chk_obj.val().split(" ").join("")=="" || chk_obj.val().length < 6 || chk_obj.val().length > 16 || !id_check(chk_obj.val())){
		alert_layer(chk_obj, "6~16자의 영문 소문자, 숫자만 사용할 수 있습니다.");
		return;
	}
		
	$.getJSON("/Text/ID_Unique_Check.asp?id="+chk_obj.val(), {},function(data){				
		if (parseInt(data.ReturnInt) > 0) {	
			$("#IdUniqueCheckResult").text('사용할 수 없는 아이디 입니다.');
			id_set("", "", id_obj);
			chk_obj.focus();
		} else {
			$("#IdUniqueCheckResult").text('사용 가능한 아이디입니다.');
			id_set(chk_obj.val(), chk_obj.val(), id_obj);
		}			
	});
}

//아이디 중복 체크
function id_unique_check2(id_obj) {
	var chk_obj = $("#idcheck");
	if (chk_obj.val().split(" ").join("")=="" || chk_obj.val().length < 6 || chk_obj.val().length > 16 || !id_check2(chk_obj.val())){
		alert_layer(chk_obj, "6~16자의 영문 소문자, 숫자만 사용할 수 있습니다.");
		return;
	}
		
	$.getJSON("/Text/ID_Unique_Check.asp?id="+chk_obj.val(), {},function(data){				
		if (parseInt(data.ReturnInt) > 0) {	
			$("#IdUniqueCheckResult").text('사용할 수 없는 아이디 입니다.');
			id_set("", "", id_obj);
			chk_obj.focus();
		} else {
			$("#IdUniqueCheckResult").text('사용 가능한 아이디입니다.');
			id_set(chk_obj.val(), chk_obj.val(), id_obj);
		}			
	});
}

// Alter -> Layer 경고메세지로 변경_1
function alert_layer(obj, msg) {
	var nowPage = location.href.toUpperCase();
	if (nowPage.indexOf("EDU")>0||nowPage.indexOf("SF")>0||nowPage.indexOf("HH")>0){  //교육,파견,서치펌 회원정보 수정페이지에서만 alert처리, 기업은 별로 js있음
		alert(msg);
	}else{
		$(obj).parent().find("div.mbrTplLayer.mbrTplLayer_1.mbrLayerHelp > div > p").text(msg);
		$(obj).parent().find("div.mbrTplLayer.mbrTplLayer_1.mbrLayerHelp").show();
	}

	obj.focus();
}	

// Alter -> Layer 경고메세지로 변경_2
function CautionResultView(N, Message)
{
	$("#CautionResult"+(N)).html('<div class="desc"><p>' + Message + '</p></div><span class="arrow"></span>');
	$("#CautionResult"+(N)).show();
}

// Text Onfocus 시 레이어 Hide
function CautionResultHide()
{
	var oCautionResult = $("div[name=CautionResult]");
	oCautionResult.hide();
}

function id_set(val, val2, id_obj) {
	$(id_obj).val(val);
	$("#idcheck").val(val2);

	if (val == val2) {
		$("#IdUniqueCheckResult").show();
	} else {
		$("#IdUniqueCheckResult").hide();
		//alert_layer($("#idcheck"), "아이디를 입력하시고 중복체크를 하세요.");
	}
}

//아이디 문자열 형식 체크
function id_check(input) {
		var err_cnt=0
		for (var i = 0; i < input.length; i++) 
		{
			var val = input.charAt(i);
			if (!((val >= "0" && val <= "9") || (val >= "a" && val <= "z"))) // || (val >= "A" && val <= "Z")))
			err_cnt ++
		}
		if (err_cnt == 0 ) return true;
			else 	return false;
}

//아이디 문자열 형식 체크 '-' 추가
function id_check2(input) {
		var err_cnt=0
		for (var i = 0; i < input.length; i++) 
		{
			var val = input.charAt(i);
			if (!((val >= "0" && val <= "9") || (val >= "a" && val <= "z") || (val == "-"))) // || (val >= "A" && val <= "Z")))
			err_cnt ++
		}
		if (err_cnt == 0 ) return true;
			else 	return false;
}

//이메일 사용가능 문자 검사
function email_check_1(input) 
{
	var err_cnt=0
	for (var i = 0; i < input.length; i++) 
	{
		var val = input.charAt(i);
		if (!((val >= "0" && val <= "9") || (val >= "a" && val <= "z") || (val >= "A" && val <= "Z") || (val == "_") || (val == "-")  || (val == ".")))
		err_cnt ++
	}
	
	if (err_cnt == 0 ) return true;
		else 	return false;
}

//이메일 올바른 형식 검사
function email_check_2(t)
{
	var t = escape(t);
	//sung2li@naver.com 일때와 sung2li@buil.company일때와 sook.young.kim@buil.company 일때와 hyun-4260@hanmail.net 일때의 형식 체크
	//var regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,9})(\]?)$/;
	var regExp=/^[a-z A-Z 0-9\w-\.]+@[a-z A-Z 0-9\-]+(\.[a-z A-Z 0-9 \-]+)+$/;
	if(t.match(regExp) == null)
	{
		return false;
	}
	else
	{
		return true;
	}
}

// 입력한 메일연결
function mail_sum() 
{
	var form = document.form;
	var str_addr = $("#Email_Addr").val();

	if ( str_addr == "etc" )
	{
		//form.Email_Addr_Text.disabled = false;
		form.Email_Addr_Text.value = "";
		form.Email_Addr_Text.focus();
	}
	else
	{
		//form.Email_Addr_Text.disabled = true;
		form.Email_Addr_Text.value = str_addr;
	}
}

//이메일 직접 입력시 자동으로 직접 입력 선택
function Email_Addr_Text_Move()
{
	$("#Email_Addr > option[value=etc]").attr("selected", "true"); 
}

//gmail 체크
function Gmail_Check()
{
	if ($("#Email_Addr_Text").val().toLowerCase() == "gmail.com") {
		alert("gmail 특성상 메일주소에 점(.)을 입력한 경우\n점(.)이 없는 메일주소로 잘못 발송되는 경우가 있습니다.\n메일주소 입력 시 주의하세요.");
	}
}

// 입력글 길이 제한
function textlen(lenstr,fname,rdiv,CautionResultN) 
{
	var lenstr;  // 길이
	var fname;		//컬럼
	var rdiv;		//리셋
	 ilenstr = parseInt(lenstr)
	df = eval("document.form."+fname);

	if (df.value.length>ilenstr)
	{
		CautionResultView(CautionResultN, lenstr +"자 까지만 입력 할 수 있습니다");

		if (rdiv=="n")
		{
			df.value = df.value.substring(0,10)
		}
		else
		{
			df.value = "";
			df.focus();
		}
	return;
	}
}

//비밀번호 변경 안내 팝업
function pwd_pop() 
{
	window.open("/Popup/pw_popup.htm","pwd","width=400,height=556,scrollbars=no,left=300,top=150");
}

// 숫자형 체크
function check_num(num) 
{
	var result = true;
	for(var i=0;i<num.length;i++)	
	{
		var codenum=num.charCodeAt(i);
		if(codenum > 58 || codenum < 47) 
		{
			result=false;
		}
	}
	return result;
}

// 비밀번호 space key 입력안되게 처리
function blank_key_check()
{
	if(event.keyCode==32)
	{
		event.returnValue=false;
	} 
}

//숫자만 입력 받게끔 하는 함수
function handlerNum( obj ) 
{
	e = window.event; //윈도우의 event를 잡는것입니다.

	if (e.shiftKey && e.keyCode)
	{ // shift키를 이용한키 방지
		e.returnValue=false; 
	}

	//입력 허용 키
	if( ( e.keyCode >=  48 && e.keyCode <=  57 ) ||	//숫자열 0 ~ 9 : 48 ~ 57
      ( e.keyCode >=  96 && e.keyCode <= 105 ) ||	//키패드 0 ~ 9 : 96 ~ 105
        e.keyCode ==   8 ||		//BackSpace
        e.keyCode ==  46 ||		//Delete
        e.keyCode == 110 ||		//소수점(.) : 문자키배열
        e.keyCode == 190 ||		//소수점(.) : 키패드
        e.keyCode ==  37 ||		//좌 화살표
        e.keyCode ==  39 ||		//우 화살표
        e.keyCode ==  35 ||		//End 키
        e.keyCode ==  36 ||		//Home 키
        e.keyCode ==   9			//Tab 키
    ) {
  
		if ( e.keyCode == 110 || e.keyCode == 190 ) 
		{	//소수점을 눌렀을 경우
			if ( obj.value == "" ) 
			{	//아무것도 없는 상태에서 소수점을 입력했을경우 "0."으로 표기
				obj.value = "0";
				return;
			}
      
			if ( obj.value.indexOf(".") != -1 ) 
			{	//기존에 소수점이 들어있다면
				e.returnValue=false;	//입력시키지 않는다.
			}
		}
		else //0이 아닌숫자
		{
			return; //-->입력시킨다.
		}
    }
    else //숫자가 아니면 넣을수 없다.
	{
		e.returnValue=false;
	}
}
	
//숫자+(+-)만 입력 받게끔 하는 함수.
function handlerNum_Special( obj ) {
	//숫자만 입력 받게끔 하는 함수.
	e = window.event; //윈도우의 event를 잡는것입니다.
  
	if (e.shiftKey && e.keyCode && e.keyCode !=  187)
	{ // shift키를 이용한키 방지
		e.returnValue=false; 
	}

	//입력 허용 키
	if( ( e.keyCode >=  48 && e.keyCode <=  57 ) ||   //숫자열 0 ~ 9 : 48 ~ 57
	  ( e.keyCode >=  96 && e.keyCode <= 105 ) ||   //키패드 0 ~ 9 : 96 ~ 105
		e.keyCode ==   8 ||    //BackSpace
		e.keyCode ==  46 ||    //Delete
		e.keyCode == 110 ||    //소수점(.) : 문자키배열
		e.keyCode == 190 ||    //소수점(.) : 키패드
		e.keyCode ==  37 ||    //좌 화살표
		e.keyCode ==  39 ||    //우 화살표
		e.keyCode ==  35 ||    //End 키
		e.keyCode ==  36 ||    //Home 키
		e.keyCode ==  189 ||    //- 키
		(e.keyCode ==  187 && e.shiftKey && e.keyCode ) ||  //shift + (+) 키
		e.keyCode ==   9       //Tab 키
	) {	
	  
		if ( e.keyCode == 110 || e.keyCode == 190 ) 
		{ //소수점을 눌렀을 경우
			if ( obj.value == "" ) 
			{  //아무것도 없는 상태에서 소수점을 입력했을경우 "0."으로 표기
				obj.value = "0";
				return;
			}
		  
			if ( obj.value.indexOf(".") != -1 ) 
			{  //기존에 소수점이 들어있다면
				e.returnValue=false;                 //입력시키지 않는다.
			}
		}
		else //0이 아닌숫자
		{
			return; //-->입력시킨다.
		}
	}
	else //숫자가 아니면 넣을수 없다.
	{
		e.returnValue=false;
	}
}



var $post_Input = {"zipcode" :
    $("#postcheck,#M_ZipCode"),
    "addrtext" : $("#M_Addr_Text"),
    "addaddr" : $("#M_AddAddr"),
    "addrtype" : $("#M_AddrType"),
    "addrtext1" : $("#M_Addr_Text1")
};

//우편번호 검색
var post_check = function (callbackInput) {
    if (callbackInput != undefined) {
        $post_Input = callbackInput;
    }

    var chk_obj = $("#postcheck");
    var height = 300;
    var width = 550;
    var top = (screen.availHeight - height) / 2;
    var left = (screen.availWidth - width) / 2;

    var post_win = window.open("/Address/Index?callback=post_check_complete", "address_pop", "width=" + width + ",height=" + height + ",status=0,scrollbars=1,top=" + top + ",left=" + left);
    post_win.focus();

}

function post_check_complete(zipcode, baseAddress, addAddress, addressType, detailAddress, post_win) {
    $post_Input.zipcode.val(zipcode);
    $post_Input.addrtext.val(baseAddress);
    $post_Input.addaddr.val(addAddress);
    $post_Input.addrtype.val(addressType);
    $post_Input.addrtext1.val(detailAddress);

    return true;
}


//문자열의 양쪽(왼쪽, 오른쪽) 공백을 제거 함수
function both_trim(a) 
{    
	var search = 0
	while ( a.charAt(search) == " ") 
	{ 
		search = search + 1 
	}

	a = a.substring(search, (a.length))
	search = a.length - 1

	while (a.charAt(search) ==" ") 
	{
		search = search - 1
	}
	return a.substring(0, search + 1)
}

// 바이트 체크
function getByteLength(data) 
{
   var len = 0; 
   var str = data.substring(0); 
   if(str == null) return 0; 
   for(var i=0; i < str.length; i++) 
   {
	  var ch = escape(str.charAt(i));
	  if(ch.length == 1) len++; 
	  else if(ch.indexOf("%u") != -1 ) len +=2; 
	  else if(ch.indexOf("%")!= -1) len += ch.length/3; 
   }
   return len; 
}

// 글자수 계산 (btye로 처리하지 않음)
function go_check_len(item) {
	var memocount, chk_obj
	memocount = 0;
	chk_obj = $("#"+item);
	len = $(chk_obj).val().length;
	for(k=0;k<len;k++){
		memocount++;
	}
	
	$("#devTextCount").html(Math.floor(memocount));
				
	if (memocount>=50) {     
		if (item == "E_Course")
			alert_layer(chk_obj, "주요 교육과정은 50자까지만 입력해 주세요.");
		else
			alert_layer(chk_obj, "주요 사업내용은 50자까지만 입력해 주세요.");

		//$(chk_obj).val($(chk_obj).val().substring(0,50));
		$("#devTextCount").html('50');
		return;
	}
	
	return memocount; 
}