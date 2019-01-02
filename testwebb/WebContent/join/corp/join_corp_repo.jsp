<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="SHORTCUT ICON" href="https://www.jobkorea.co.kr/favicon.ico">

    <link rel="stylesheet" type="text/css" href="https://i.jobkorea.kr/content/css/ver_1/mbr/mbr_tpl.css?v=201807251600">
    <link rel="stylesheet" type="text/css" href="https://i.jobkorea.kr/content/css/ver_1/join/common.css?v=201807251600">
    <link rel="stylesheet" type="text/css" href="https://i.jobkorea.kr/content/css/ver_1/join/join.css?v=201807251600">

    <script src="join/corp/scripts/jquery.js?v=FVs3ACwOLIVInrAl5sdzR2jrCDmVOWFbZMY6g6Q0ulE1"></script>

    <script type="text/javascript" src="join/corp/scripts/underScore.js" charset="utf-8"></script>

    <script src="join/corp/scripts/join.certify.js?ver=v009"></script>

    <script src="join/corp/scripts/join_common.js?ver=v009"></script>

    <script src="join/corp/scripts/join_account.js?ver=v009"></script>

    <script src="join/corp/scripts/join_corp.js?ver=v009"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            if(join){
                join.common.init('gi')
                join.account.init('gi')
                join.corp.init('gi')
            }
        })

    </script>
    <script type = "text/javascript">
    	function checkForm(){
    		var chk1 = document.corpForm.lb_chk_service.checked;
            var chk2 = document.corpForm.lb_chk_privacy.checked;
    		var frm = document.corpForm;
    		if(!form.cmember_type.value){
    			alert("기업형태를 선택해주세요.");
    			form.cmember_type.focus();
    			return false;
    		}
    		if(!form.cmember_cno.value){
    			alert("사업자등록번호를 입력해주세요.");
    			form.cmember_cno.focus();
    			return false;
    		}
    		if(!form.cmember_cname.value){
    			alert("회사명을 입력해주세요.");
    			form.cmember_cname.focus();
    			return false;
    		}
    		if(!form.cmember_ceo.value){
    			alert("대표자명을 입력해주세요.");
    			form.cmember_ceo.focus();
    			return false;
    		}
    		if(!form.cmember_addr.value){
    			alert("회사주소를 입력해주세요.");
    			form.cmember_addr.focus();
    			return false;
    		}
    		if(!form.cmember_name.value){
    			alert("가입자명을 입력해주세요.");
    			form.cmember_name.focus();
    			return false;
    		}
    		if(!form.cmember_id.value){
    			alert("id를 입력해주세요.");
    			form.cmember_id.focus();
    			return false;
    		}
    		if(!form.cmember_pass.value){
    			alert("비밀번호를 입력해주세요.");
    			form.cmember_pass.focus();
    			return false;
    		}
    		if(!form.cmember_phone.value){
    			alert("전화번호를 입력해주세요.");
    			form.cmember_phone.focus();
    			return false;
    		}
    		if(!form.cmember_email.value){
    			alert("이메일을 입력해주세요.");
    			form.cmember_email.focus();
    			return false;
    		}
    		 if(!chk1){ // 약관확인
           	  alert("필수약관에 동의해주세요.");
           	  form.Service_Agree.focus();
           	  return false;
             }
             if(!chk2){ // 약관확인
           	  alert("필수약관에 동의해주세요.");
           	  form.Privacy_Agree.focus();
           	  return false;
             }
    	}
    
    </script>