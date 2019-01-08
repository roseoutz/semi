<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404JOB | 관리자 - 일반회원 관리</title>
</head>
<body>
	<div id="container">
	<div id="content">
				
					<div class="topHdWrap">
					<br>
						<h2 class="top_hd_2">일반회원 리스트</h2>
					</div>
					<b><font size = "2pt" color = "blue">< 회원 수 : <s:property value = "totalCount"/> ></font></b>
					<table border = "1" cellpadding = "0" cellspacing = "0">
						<tr height = "40" align = "center">
							<th width = "150" style = "border : 3px solid; font-size : 10pt"><strong>아이디</strong></th>
							<th width = "150" style = "border : 3px solid; font-size : 10pt">비밀번호</th>
							<th width = "70" style = "border : 3px solid; font-size : 10pt">이름</th>
							<th width = "120" style = "border : 3px solid; font-size : 10pt">전화번호</th>
							<th width = "200" style = "border : 3px solid; font-size : 10pt">이메일</th>
							<th width = "100" style = "border : 3px solid; font-size : 10pt">가입날짜</th>
							<th width = "100" style = "border : 3px solid; font-size : 10pt">관리</th>
						</tr>
						<s:iterator value = "list" status="stat">
							<tr height = "30" align = "center">
								<td style = "border : 2px solid;"><s:property value = "member_id"/></td>
								<td style = "border : 2px solid;"><s:property value = "member_pass"/></td>
								<td style = "border : 2px solid;"><s:property value = "member_name"/></td>
								<td style = "border : 2px solid;"><s:property value = "member_phone"/></td>
								<td style = "border : 2px solid;"><s:property value = "member_email"/></td>
								<td style = "border : 2px solid;"><s:property value = "member_date"/></td>
								<td style = "border : 2px solid;"><input type = "button" value = "탈  퇴" onclick = "return open_win('deleteMember.action?id=<s:property value = "member_id"/>');"/></td>
							</tr>
						</s:iterator>
						<s:if test = "totalCount == 0">
							<tr height = "30" align = "center">
								<th colspan = "7"  style = "border : 2px solid;">등록된 회원이 없습니다.</th>
							</tr>
						</s:if>
					</table>
					<br>
					<div style = "text-align:center;">
						<s:property value = "pagingHtml" escape = "false"/>
					</div>
					<!-- 검색기능 -->
					<div style = "text-align:center;">
						<br>
						<form>
							<select name = "category">
								<option value = "id">아이디</option>
								<option value = "name">회원이름</option>
							</select>
							<input type = "text" name = "search"/>
							<input type = "submit" value = "회원찾기"/>
						</form>
					</div>
			</div>
		</div>
</body>
</html>