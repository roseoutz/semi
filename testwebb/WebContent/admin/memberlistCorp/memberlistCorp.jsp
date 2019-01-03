<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="container">
	<div id="content">
				
					<div class="topHdWrap">
					<br>
						<h2 class="top_hd_2">기업회원 리스트(총 회원 수 : <s:property value = "list.size()"/> )</h2>
					</div>
					<table border = "1" cellpadding = "0" cellspacing = "0">
						<tr height = "30" align = "center">
							<th width = "150"><strong>아이디</strong></th>
							<th width = "150">비밀번호</th>
							<th width = "70">이름</th>
							<th width = "120">전화번호</th>
							<th width = "200">이메일</th>
							<th width = "100">가입날짜</th>
							<th width = "100">관리</th>
						</tr>
						<s:iterator value = "list" status="stat">
							<tr height = "30" align = "center">
								<td><s:property value = "member_id"/></td>
								<td><s:property value = "member_pass"/></td>
								<td><s:property value = "member_name"/></td>
								<td><s:property value = "member_phone"/></td>
								<td><s:property value = "member_email"/></td>
								<td><s:property value = "member_date"/></td>
								<td><input type = "button" value = "탈  퇴" onclick = "return open_win('admin/memberlist/deleteMember.jsp?id=<s:property value = "member_id"/>', '회원탈퇴');"/></td>
							</tr>
						</s:iterator>
						<s:if test = "list.size() <= 0">
							<tr height = "30" align = "center">
								<th colspan = "5">등록된 회원이 없습니다.</th>
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