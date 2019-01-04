<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix = "s" uri = "/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<div id="container">
		<div id="content">

			<div class="topHdWrap">
				<br>
				<h2 class="top_hd_2">상세보기</h2>
			</div>
			<table width="500" border="1" cellspacing="0" cellpadding="0" align="center">
					<tr height="30">
						<th align="center" width="125" style = "border : 3px solid; font-size : 10pt" >글 번호</th>
						<td align="center" width="125" align="center" style = "border : 2px solid;"><s:property value = "resultClass.mtm_no"/></td>
						<th align="center" width="125" style = "border : 3px solid; font-size : 10pt" >이메일</th>
						<td align="center" width="150" align="center" style = "border : 2px solid;"><s:property value = "resultClass.mtm_email"/></td>
					</tr>
					<tr height="30">
						<th align="center" width="125" style = "border : 3px solid; font-size : 10pt" >작성자</th>
						<td align="center" width="125" align="center" style = "border : 2px solid;"><s:property value = "resultClass.mtm_writer"/></td>
						<th align="center" width="125" style = "border : 3px solid; font-size : 10pt" >작성일</th>
						<td align="center" width="150" align="center" style = "border : 2px solid;"><s:property value = "resultClass.mtm_date"/></td>
					</tr>
					<tr height="30">
						<th align="center" width="125" style = "border : 3px solid; font-size : 10pt" >글제목</th>
						<td align="center" width="375" colspan="3" align="center" style = "border : 2px solid;"><s:property value = "resultClass.mtm_subject"/></td>
					</tr>
					<tr>
						<th align="center" width="125" style = "border : 3px solid; font-size : 10pt" >글내용</th>
						<td align="center" width="375" colspan="3" style = "border : 2px solid;"><s:property value = "resultClass.mtm_content"/></td>
					</tr>
				<tr height="30">
					<td colspan="4" align="center" style = "border : 2px solid;">
						&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="글삭제" onClick="delete_event();">
						&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="글목록"
						onclick="document.location.href='admin_qna.action'">
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>