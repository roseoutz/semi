<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "s" uri = "/struts-tags" %>

<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="http://i.jobkorea.kr/content/css/ver_2/event/banner.promotion.css?201812101600">
<link rel="stylesheet" type="text/css" href="http://i.jobkorea.kr/content/css/ver_2/common.css?201812101600" />
<link rel="stylesheet" type="text/css" href="http://i.jobkorea.kr/content/css/ver_2/gnb/gnb.css?201812101600" />
<link rel="stylesheet" type="text/css" href="http://i.jobkorea.kr/content/css/ver_2/mtu/mtu_common.css?201812101600" />
<link rel="stylesheet" type="text/css" href="http://i.jobkorea.kr/content/css/ver_2/mtu/mtu_tpl.css?201812101600" />
<link rel="stylesheet" type="text/css" href="http://i.jobkorea.kr/content/css/ver_2/mtu/mtu_style.css?201812101600" />
<link rel="stylesheet" type="text/css" href="http://i.jobkorea.kr/content/css/ver_2/mtu/mtu_popup.css?201812101600" />
<s:if test="#session.session_id==null">
<script>
alert("로그인이 필요한 서비스입니다.");
location.replace("main.action");
</script>
</s:if>
<script>
function open_win_noresizable(url, name) {
	var oWin = window.open(url, name, "scrollbars=no,status=no, resizable=no, width=300, height=150");	
}
</script>

<script type="text/javascript">
function delete_event(){
	if (confirm("정말 삭제하시겠습니까?") == true){    //확인
  	  location.href='resumeDelete.action';
	}else{   //취소
 	   return;
	}
}
</script>

