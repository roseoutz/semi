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
						<h2 class="top_hd_2">기업회원 리스트(총 회원 수 : <s:property value = "totalCount"/> )</h2>
					</div>
					<table border = "1" cellpadding = "0" cellspacing = "0">
						<tr height = "40" align = "center">
							<th width = "100">사업자등록번호</th>
							<th width = "100">아이디</th>
							<th width = "70">비밀번호</th>
							<th width = "120">회사명</th>
							<th width = "80">대표명</th>
							<th width = "190">주소</th>
							<th width = "150">이메일</th>
							<th width = "100">가입날짜</th>
							<th width = "100">관리</th>
						</tr>
						<s:iterator value = "list" status="stat">
							<tr height = "30" align = "center">
								<td><s:property value = "cmember_cno"/></td>
								<td><s:property value = "cmember_id"/></td>
								<td><s:property value = "cmember_pass"/></td>
								<td><s:property value = "cmember_cname"/></td>
								<td><s:property value = "cmember_ceo"/></td>
								<td><s:property value = "cmember_addr"/></td>
								<td><s:property value = "cmember_email"/></td>
								<td><s:property value = "cmember_date"/></td>
								<td><input type = "button" value = "탈  퇴" onclick = "return open_win('admin/memberlistCorp/deleteCorpMember.jsp?id=<s:property value = "cmember_id"/>', '회원탈퇴');"/></td>
							</tr>
						</s:iterator>
						<s:if test = "totalCount == 0">
							<tr height = "30" align = "center">
								<th colspan = "5">등록된 회원이 없습니다.</th>
							</tr>
						</s:if>
					</table>
					<br>
					<!-- 페이징 -->
					<div style = "text-align:center;">
						<s:property value = "pagingHtml" escape = "false"/>
					</div>
					<!-- 검색기능 -->
					<div style = "text-align:center;">
						<br>
						<form>
							<select name = "category">
								<option value = "cno">사업자번호</option>
								<option value = "id">아이디</option>
								<option value = "cname">회사명</option>
							</select>
							<input type = "text" name = "search"/>
							<input type = "submit" value = "회원찾기"/>
						</form>
					</div>
			</div>
		</div>
</body>
</html>