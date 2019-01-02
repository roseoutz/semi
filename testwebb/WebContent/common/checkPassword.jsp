<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>비밀번호 확인</title>
<link rel="stylesheet" href="/StrutsBoard/board/common/css/css.css" type="text/css"/>
</head>
<body>

<h2>비밀번호 확인</h2>

<form action="checkAction.action" method="post" name="frm">
<s:if test="member_type =='corp'">
	<s:hidden name="member_type" value="corp"/>
	<s:hidden name="cmember_id" value="%{member_id }"/>
</s:if>
<s:else>
	<s:hidden name="member_type" value="gen"/>	
	<s:hidden name="member_id" value="%{member_id }"/>
</s:else>
	
	<table width="250" border="0" cellspacing="0" cellpadding="0">
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		<tr>
			<td width="100" bgcolor="#F4F4F4">비밀번호 입력<s:property value="member_type"/></td>
			<td width="150" bgcolor="#FFFFFF">
				<s:if test="member_type =='corp'">
				&nbsp;&nbsp;<input type="password" name="cmember_pass" class="inputb"/>
				</s:if>
				<s:else>
				&nbsp;&nbsp;<input type="password" name="member_pass" class="inputb"/>
				</s:else>
				&nbsp;&nbsp;<input type="submit" name="submit" value="확인" class="inputb" onclick="return validate();"/>
			</td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
	</table>
</form>
</body>
</html>