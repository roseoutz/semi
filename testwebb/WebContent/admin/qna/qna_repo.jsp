<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "s" uri = "/struts-tags" %>
<!DOCTYPE html>

    <link rel="stylesheet" type="text/css" href="http://i.jobkorea.kr/content/css/ver_2/common.css?201812101600" />
    <link rel="stylesheet" type="text/css" href="http://i.jobkorea.kr/content/css/ver_2/top100/top_style.css?201812101600" />
<s:if test="#session.session_id==null">
<script>
alert("로그인이 필요한 서비스입니다.");
location.replace("admin_main.action");
</script>
</s:if>

<script type="text/javascript">
function delete_event(num){
	var num1 = num;
	if (confirm("정말 삭제하시겠습니까?") == true){    //확인
  	  location.href='deleteqna.action?no='+num1;
	}else{   //취소
 	   return;
	}
}
</script>
