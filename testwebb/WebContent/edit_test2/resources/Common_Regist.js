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
			//$(this).addClass("ipStyleOn"); //--css���� ó��
			$(this).parent().find(".mbrTplLayer.mbrTplLayer_1.mbrLayerHelp").show();
		});	
		$(this).bind("blur", function(){		
			//$(this).removeClass("ipStyleOn");	//--css���� ó��
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

//���̵� �ߺ� üũ
function id_unique_check(id_obj) {
	var chk_obj = $("#idcheck");
	if (chk_obj.val().split(" ").join("")=="" || chk_obj.val().length < 6 || chk_obj.val().length > 16 || !id_check(chk_obj.val())){
		alert_layer(chk_obj, "6~16���� ���� �ҹ���, ���ڸ� ����� �� �ֽ��ϴ�.");
		return;
	}
		
	$.getJSON("/Text/ID_Unique_Check.asp?id="+chk_obj.val(), {},function(data){				
		if (parseInt(data.ReturnInt) > 0) {	
			$("#IdUniqueCheckResult").text('����� �� ���� ���̵� �Դϴ�.');
			id_set("", "", id_obj);
			chk_obj.focus();
		} else {
			$("#IdUniqueCheckResult").text('��� ������ ���̵��Դϴ�.');
			id_set(chk_obj.val(), chk_obj.val(), id_obj);
		}			
	});
}

//���̵� �ߺ� üũ
function id_unique_check2(id_obj) {
	var chk_obj = $("#idcheck");
	if (chk_obj.val().split(" ").join("")=="" || chk_obj.val().length < 6 || chk_obj.val().length > 16 || !id_check2(chk_obj.val())){
		alert_layer(chk_obj, "6~16���� ���� �ҹ���, ���ڸ� ����� �� �ֽ��ϴ�.");
		return;
	}
		
	$.getJSON("/Text/ID_Unique_Check.asp?id="+chk_obj.val(), {},function(data){				
		if (parseInt(data.ReturnInt) > 0) {	
			$("#IdUniqueCheckResult").text('����� �� ���� ���̵� �Դϴ�.');
			id_set("", "", id_obj);
			chk_obj.focus();
		} else {
			$("#IdUniqueCheckResult").text('��� ������ ���̵��Դϴ�.');
			id_set(chk_obj.val(), chk_obj.val(), id_obj);
		}			
	});
}

// Alter -> Layer ���޼����� ����_1
function alert_layer(obj, msg) {
	var nowPage = location.href.toUpperCase();
	if (nowPage.indexOf("EDU")>0||nowPage.indexOf("SF")>0||nowPage.indexOf("HH")>0){  //����,�İ�,��ġ�� ȸ������ ���������������� alertó��, ����� ���� js����
		alert(msg);
	}else{
		$(obj).parent().find("div.mbrTplLayer.mbrTplLayer_1.mbrLayerHelp > div > p").text(msg);
		$(obj).parent().find("div.mbrTplLayer.mbrTplLayer_1.mbrLayerHelp").show();
	}

	obj.focus();
}	

// Alter -> Layer ���޼����� ����_2
function CautionResultView(N, Message)
{
	$("#CautionResult"+(N)).html('<div class="desc"><p>' + Message + '</p></div><span class="arrow"></span>');
	$("#CautionResult"+(N)).show();
}

// Text Onfocus �� ���̾� Hide
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
		//alert_layer($("#idcheck"), "���̵� �Է��Ͻð� �ߺ�üũ�� �ϼ���.");
	}
}

//���̵� ���ڿ� ���� üũ
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

//���̵� ���ڿ� ���� üũ '-' �߰�
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

//�̸��� ��밡�� ���� �˻�
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

//�̸��� �ùٸ� ���� �˻�
function email_check_2(t)
{
	var t = escape(t);
	//sung2li@naver.com �϶��� sung2li@buil.company�϶��� sook.young.kim@buil.company �϶��� hyun-4260@hanmail.net �϶��� ���� üũ
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

// �Է��� ���Ͽ���
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

//�̸��� ���� �Է½� �ڵ����� ���� �Է� ����
function Email_Addr_Text_Move()
{
	$("#Email_Addr > option[value=etc]").attr("selected", "true"); 
}

//gmail üũ
function Gmail_Check()
{
	if ($("#Email_Addr_Text").val().toLowerCase() == "gmail.com") {
		alert("gmail Ư���� �����ּҿ� ��(.)�� �Է��� ���\n��(.)�� ���� �����ּҷ� �߸� �߼۵Ǵ� ��찡 �ֽ��ϴ�.\n�����ּ� �Է� �� �����ϼ���.");
	}
}

// �Է±� ���� ����
function textlen(lenstr,fname,rdiv,CautionResultN) 
{
	var lenstr;  // ����
	var fname;		//�÷�
	var rdiv;		//����
	 ilenstr = parseInt(lenstr)
	df = eval("document.form."+fname);

	if (df.value.length>ilenstr)
	{
		CautionResultView(CautionResultN, lenstr +"�� ������ �Է� �� �� �ֽ��ϴ�");

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

//��й�ȣ ���� �ȳ� �˾�
function pwd_pop() 
{
	window.open("/Popup/pw_popup.htm","pwd","width=400,height=556,scrollbars=no,left=300,top=150");
}

// ������ üũ
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

// ��й�ȣ space key �Է¾ȵǰ� ó��
function blank_key_check()
{
	if(event.keyCode==32)
	{
		event.returnValue=false;
	} 
}

//���ڸ� �Է� �ްԲ� �ϴ� �Լ�
function handlerNum( obj ) 
{
	e = window.event; //�������� event�� ��°��Դϴ�.

	if (e.shiftKey && e.keyCode)
	{ // shiftŰ�� �̿���Ű ����
		e.returnValue=false; 
	}

	//�Է� ��� Ű
	if( ( e.keyCode >=  48 && e.keyCode <=  57 ) ||	//���ڿ� 0 ~ 9 : 48 ~ 57
      ( e.keyCode >=  96 && e.keyCode <= 105 ) ||	//Ű�е� 0 ~ 9 : 96 ~ 105
        e.keyCode ==   8 ||		//BackSpace
        e.keyCode ==  46 ||		//Delete
        e.keyCode == 110 ||		//�Ҽ���(.) : ����Ű�迭
        e.keyCode == 190 ||		//�Ҽ���(.) : Ű�е�
        e.keyCode ==  37 ||		//�� ȭ��ǥ
        e.keyCode ==  39 ||		//�� ȭ��ǥ
        e.keyCode ==  35 ||		//End Ű
        e.keyCode ==  36 ||		//Home Ű
        e.keyCode ==   9			//Tab Ű
    ) {
  
		if ( e.keyCode == 110 || e.keyCode == 190 ) 
		{	//�Ҽ����� ������ ���
			if ( obj.value == "" ) 
			{	//�ƹ��͵� ���� ���¿��� �Ҽ����� �Է�������� "0."���� ǥ��
				obj.value = "0";
				return;
			}
      
			if ( obj.value.indexOf(".") != -1 ) 
			{	//������ �Ҽ����� ����ִٸ�
				e.returnValue=false;	//�Է½�Ű�� �ʴ´�.
			}
		}
		else //0�� �ƴѼ���
		{
			return; //-->�Է½�Ų��.
		}
    }
    else //���ڰ� �ƴϸ� ������ ����.
	{
		e.returnValue=false;
	}
}
	
//����+(+-)�� �Է� �ްԲ� �ϴ� �Լ�.
function handlerNum_Special( obj ) {
	//���ڸ� �Է� �ްԲ� �ϴ� �Լ�.
	e = window.event; //�������� event�� ��°��Դϴ�.
  
	if (e.shiftKey && e.keyCode && e.keyCode !=  187)
	{ // shiftŰ�� �̿���Ű ����
		e.returnValue=false; 
	}

	//�Է� ��� Ű
	if( ( e.keyCode >=  48 && e.keyCode <=  57 ) ||   //���ڿ� 0 ~ 9 : 48 ~ 57
	  ( e.keyCode >=  96 && e.keyCode <= 105 ) ||   //Ű�е� 0 ~ 9 : 96 ~ 105
		e.keyCode ==   8 ||    //BackSpace
		e.keyCode ==  46 ||    //Delete
		e.keyCode == 110 ||    //�Ҽ���(.) : ����Ű�迭
		e.keyCode == 190 ||    //�Ҽ���(.) : Ű�е�
		e.keyCode ==  37 ||    //�� ȭ��ǥ
		e.keyCode ==  39 ||    //�� ȭ��ǥ
		e.keyCode ==  35 ||    //End Ű
		e.keyCode ==  36 ||    //Home Ű
		e.keyCode ==  189 ||    //- Ű
		(e.keyCode ==  187 && e.shiftKey && e.keyCode ) ||  //shift + (+) Ű
		e.keyCode ==   9       //Tab Ű
	) {	
	  
		if ( e.keyCode == 110 || e.keyCode == 190 ) 
		{ //�Ҽ����� ������ ���
			if ( obj.value == "" ) 
			{  //�ƹ��͵� ���� ���¿��� �Ҽ����� �Է�������� "0."���� ǥ��
				obj.value = "0";
				return;
			}
		  
			if ( obj.value.indexOf(".") != -1 ) 
			{  //������ �Ҽ����� ����ִٸ�
				e.returnValue=false;                 //�Է½�Ű�� �ʴ´�.
			}
		}
		else //0�� �ƴѼ���
		{
			return; //-->�Է½�Ų��.
		}
	}
	else //���ڰ� �ƴϸ� ������ ����.
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

//�����ȣ �˻�
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


//���ڿ��� ����(����, ������) ������ ���� �Լ�
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

// ����Ʈ üũ
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

// ���ڼ� ��� (btye�� ó������ ����)
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
			alert_layer(chk_obj, "�ֿ� ���������� 50�ڱ����� �Է��� �ּ���.");
		else
			alert_layer(chk_obj, "�ֿ� ��������� 50�ڱ����� �Է��� �ּ���.");

		//$(chk_obj).val($(chk_obj).val().substring(0,50));
		$("#devTextCount").html('50');
		return;
	}
	
	return memocount; 
}