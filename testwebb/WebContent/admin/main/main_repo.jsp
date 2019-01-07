<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="SHORTCUT ICON" href="http://www.jobkorea.co.kr/favicon.ico">

<link rel="stylesheet" type="text/css" href="https://i.jobkorea.kr/content/css/ver_1/login/login.css?201811151000">
<script type="text/javascript" src="admin/main/scripts/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="admin/main/scripts/JK_Login.js?v20190103"></script>

<style>
	.secLogin {
		position : absolute;
		top : 150px;
		left : 150px;
 		text-align: center;
	
	}
	.logWrap {
		 display: inline-block;
	}
	.logo {
		position : absolute;
		top : 80px;
		left : 150px;
	}
</style>
<script>
	function checkForm(){
		var frm = document.form;
		if(!frm.admin_id.value){
			alert("아이디를 입력해주세요.");
			frm.admin_id.focus();
			return false;
		}
		if(!frm.admin_pass.value){
			alert("비밀번호를 입력해주세요.");
			frm.admin_pass.focus();
			return false;
		}
	}
</script>