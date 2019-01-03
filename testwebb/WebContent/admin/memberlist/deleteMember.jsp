<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix = "s" uri = "/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script>
	function reload(){
		self.opener.location.reload();
	}
</script>
</head>
<body>
<br>
'<%= request.getParameter("id") %>' 회원을 정말 탈퇴시키겠습니까?
<br><br>
<form action = "deleteMember.action" method = "post">
<input type = "hidden" name = "id" value = "<%= request.getParameter("id") %>">
<div style = "text-align:center;">
	<button type = "submit" onclick = "return reload();">탈 퇴</button>
</div>
</form>
</body>
</html>