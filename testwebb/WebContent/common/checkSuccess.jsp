<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>비밀번호 확인</title>
<link rel="stylesheet" href="/StrutsBoard/board/common/css/css.css" type="text/css"/>
<script type="text/javascript">
function clocationURL(){
	window.opener.parent.location.href='joinout.action?cmember_id=<s:property value="cmember_id"/>&cmember_pass=<s:property value="cmember_pass"/>';
	alert('삭제되었습니다.');
	window.close();
}
function locationURL(){
		window.opener.parent.location.href='joinout.action?member_id=<s:property value="member_id"/>&member_pass=<s:property value="member_pass"/>';
		alert('삭제되었습니다.');
		window.close();
}
</script>
</head>
<body>
<s:if test="member_type =='corp'">
<script>clocationURL()</script>
</s:if>
<s:else>
<script>locationURL()</script>
</s:else>
</body>
</html>