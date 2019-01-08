<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "s" uri = "/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404JOB | 관리자-Q&A</title>
</head>
<body>
<div id="container">
	<div id="content">
				
					<div class="topHdWrap">
					<br>
						<h2 class="top_hd_2">1:1 문의 </h2>
					</div>
					<b><font size = "2pt" color = "blue">< 문의 수 : <s:property value = "totalCount"/> ></font></b>
					<table border = "1" cellpadding = "0" cellspacing = "0">
						<tr height = "40" align = "center">
							<th width = "60" style = "border : 3px solid; font-size : 10pt">문의날짜</th>
							<th width = "300" style = "border : 3px solid; font-size : 10pt">제목</th>
							<th width = "100" style = "border : 3px solid; font-size : 10pt">작성자</th>
							<th width = "100" style = "border : 3px solid; font-size : 10pt">회원구분</th>
							<th width = "150" style = "border : 3px solid; font-size : 10pt">이메일</th>
							<th width = "80" style = "border : 3px solid; font-size : 10pt">관리</th>
						</tr>
						<s:iterator value = "list" status="stat">
							<tr height = "30" align = "center">
								<td style = "border : 2px solid;"><s:property value = "mtm_date"/></td>
								<td style = "border : 2px solid;"><a href = "viewqna.action?no=<s:property value = "mtm_no"/>"><s:property value = "mtm_subject"/></a></td>
								<td style = "border : 2px solid;"><s:property value = "mtm_writer"/></td>
								<td style = "border : 2px solid;"><s:property value = "mtm_session_type"/></td>
								<td style = "border : 2px solid;"><s:property value = "mtm_email"/></td>
								<td style = "border : 2px solid;"><input type = "button" value = "삭 제" onClick="delete_event(<s:property value = "mtm_no"/>);"></td>
							</tr>
						</s:iterator>
						<s:if test = "totalCount == 0">
							<tr height = "30" align = "center">
								<th colspan = "5" style = "border : 2px solid;">등록된 문의가 없습니다.</th>
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
								<option value = "type">회원구분</option>
							</select>
							<input type = "text" name = "search"/>
							<input type = "submit" value = "회원찾기"/>
						</form>
					</div>
					
			</div>
		</div>
</body>
</html>