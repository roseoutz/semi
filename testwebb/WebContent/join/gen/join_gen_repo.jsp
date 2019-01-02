<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<script type='text/javascript' src='join/gen/scripts/dslog.js' id='dslog_tag'></script>
    <link rel="SHORTCUT ICON" href="https://www.jobkorea.co.kr/favicon.ico">
    <link rel="stylesheet" type="text/css" href="https://i.jobkorea.kr/content/css/ver_1/mbr/mbr_tpl.css?v=201807251600">
    <link rel="stylesheet" type="text/css" href="https://i.jobkorea.kr/content/css/ver_1/join/common.css?v=201807251600">
    <link rel="stylesheet" type="text/css" href="https://i.jobkorea.kr/content/css/ver_1/join/join.css?v=201807251600">
    <script src="join/gen/scripts/btnQuery.js"></script>
    <script type="text/javascript" src="join/gen/scripts/underScore.js" charset="utf-8"></script>
    <script src="join/gen/scripts/btnHelp.js"></script>
    <script src="join/gen/scripts/join.js"></script>
        <script type="text/javascript" src="/testwebb/join/gen/scripts/echoscript.js"></script>
    
        <script>
        function checkForm2(){
          var chk1 = document.genForm.lb_chk_service.checked;
          var chk2 = document.genForm.lb_chk_privacy.checked;
          var frm = document.genForm;
          if(!frm.member_name.value){
              alert("이름을 입력해주세요.");
              frm.member_name.focus();
              return false;
          }
          if(!frm.member_id.value){
              alert("아이디를 입력해주세요.");
              frm.member_id.focus();	
              return false;
          }
          if(!frm.member_pass.value){
              alert("비밀번호를 입력해주세요.");
              frm.member_pass.focus();
              return false;
          }
          if(!frm.member_email.value){
              alert("이메일을 입력해주세요.");
              frm.member_email.focus();
              return false;
          }
          if(!frm.member_phone.value){
              alert("휴대폰번호를 입력해주세요.");
              frm.member_phone.focus();
              return false;
          }
          if(!chk1){ // 약관확인
        	  alert("필수약관에 동의해주세요.");
        	  frm.Service_Agree.focus();
        	  return false;
          }
          if(!chk2){ // 약관확인
        	  alert("필수약관에 동의해주세요.");
        	  frm.Privacy_Agree.focus();
        	  return false;
          }
        }
    </script>
    