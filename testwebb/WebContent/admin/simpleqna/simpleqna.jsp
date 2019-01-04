<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						<h2 class="top_hd_2">Q&A등록</h2>
					</div>
					<form action = "writeSimpleQna.action" method = "post">
						<div class = "subject">
							<font size = "5">Q : </font><input type = "text" name = "qa_subject" maxlength = "50" size = "60" placeholder = "등록할 제목을 입력해주세요.">
						</div>
						<br><br><br>
						<div class = "content">
							<font size = "5">A : </font> <textarea rows ="5" cols="100" name = "qa_content" placeholder = "등록할 내용을 입력해주세요."></textarea>
						</div>
						<br>
						<div class = "submit">
							<button type = "submit">등  록</button>
						</div>
					</form>
			</div>
		</div>
</body>
</html>