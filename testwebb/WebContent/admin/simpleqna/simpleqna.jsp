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
						<h2 class="top_hd_2">Q&A 관리</h2>
					</div>
					<section class="content helpSecCont">
					<div class="mtcTplTab">
						<ul class="tabItems">
							<li class="on"><a href="#">Q&A 등록</a></li>
						</ul>
					</div>
					<div class="inquiryForm">
			<form id="form" action="writeSimpleQna.action" method="post">
				<fieldset>
					<legend>문의하기 입력</legend>
					<div class="tbInquiryBx">
						<div class="tbRow tbMail">
							<div class="tbCell tbTh">
								<label for="lb_inq_4">질문 <em>(필수)</em></label>
							</div>
							<div class="tbCell">
								<input type="text" style="width:70%;" id="lb_inq_4" name="qa_subject" class="mtcIpt" title="이메일 주소 앞부분"  value="">
								<input type = "hidden" name="mtm_writer" value=""/>
								<input type="hidden" name = "mtm_session_type" value = ""/>
								<p>${type}</p>
							</div>
						</div>
						<div class="tbRow">
							<div class="tbCell tbTh">
								<label for="lb_inq_2">답변 <em>(필수)</em></label>
							</div>
						<div class="tbCell">
							<textarea name="qa_content" id="lb_inq_2" title="내용을 입력하세요." class="txArea"></textarea>
						</div>
						</div>
						
					</div>
				
					<div class="inquiryBtn">
						<button type="submit" class="btnInq">
							<span>등록하기</span>
						</button>
						<button type="reset" class="btnInq btnCancel">
							<span>다시작성</span>
						</button>
					</div>
			</fieldset>
		</form>
	</div>
	</section>
			</div>
		</div>
</body>
</html>