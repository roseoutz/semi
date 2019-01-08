<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404JOB | 관리자 - 기업회원 관리</title>
</head>
<body>
	<div id="container">
	<div id="content">
				
					<div class="topHdWrap">
					<br>
						<h2 class="top_hd_2">기업회원 리스트</h2>
					</div>
					<b><font size = "2pt" color = "blue">< 회원 수 : <s:property value = "totalCount"/> ></font></b>
					<table border = "1" cellpadding = "0" cellspacing = "0">
						<tr height = "40" align = "center">
							<th width = "110" style = "border : 3px solid; font-size : 10pt">사업자등록번호</th>
							<th width = "90" style = "border : 3px solid; font-size : 10pt">아이디</th>
							<th width = "70" style = "border : 3px solid; font-size : 10pt"><b>비밀번호</b></th>
							<th width = "120" style = "border : 3px solid; font-size : 10pt">회사명</th>
							<th width = "80" style = "border : 3px solid; font-size : 10pt">대표명</th>
							<th width = "190" style = "border : 3px solid; font-size : 10pt">주소</th>
							<th width = "150" style = "border : 3px solid; font-size : 10pt">이메일</th>
							<th width = "60" style = "border : 3px solid; font-size : 10pt">가입날짜</th>
							<th width = "70" style = "border : 3px solid; font-size : 10pt">관리</th>
						</tr>
						<s:iterator value = "list" status="stat">
							<tr height = "30" align = "center">
								<td style = "border : 2px solid;"><s:property value = "cmember_cno"/></td>
								<td style = "border : 2px solid;"><s:property value = "cmember_id"/></td>
								<td style = "border : 2px solid;"><s:property value = "cmember_pass"/></td>
								<td style = "border : 2px solid;"><s:property value = "cmember_cname"/></td>
								<td style = "border : 2px solid;"><s:property value = "cmember_ceo"/></td>
								<td style = "border : 2px solid;"><s:property value = "cmember_addr"/></td>
								<td style = "border : 2px solid;"><s:property value = "cmember_email"/></td>
								<td style = "border : 2px solid;"><s:property value = "cmember_date"/></td>
								<td style = "border : 2px solid;"><input type = "button" value = "삭 제" onclick = "return open_win('deleteCorpMember.action?id=<s:property value = "cmember_id"/>');"/></td>
							</tr>
						</s:iterator>
						<s:if test = "totalCount == 0">
							<tr height = "30" align = "center">
								<th colspan = "9" style = "border : 2px solid;">등록된 회원이 없습니다.</th>
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