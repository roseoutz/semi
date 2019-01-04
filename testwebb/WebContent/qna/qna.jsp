<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "s" uri = "/struts-tags" %>
<% 
	String type = (String)session.getAttribute("session_type"); 
	String id = (String)session.getAttribute("session_id");
%>
<body id="secHelp" class="helpMain">
<div id="wrap">
	<div id="container" class="sideTure">
		<div id="content" style="width:960px; margin:auto;">
			<h1 class="skip">고객센터 메뉴</h1>
				<section class="secLnb">
					<h1><span class="skip">고객센터 메뉴 - </span><a class="lnbTit" href="/help/">고객센터</a></h1>
					<div class="lnbGroup">
						<ul>
						<li><a href="#">FAQ</a>
							<ul class="lnbTwoDep">
								<li><a href="qna.action" class="">1:1 문의하기</a></li>
								<li><a href="simpleqna.action" class="">자주 묻는 질문</a></li>
							</ul></li>
					</ul>
				</div>
				<div class="lnbGroup">
					<ul>
						<li><a href="notice.action" class="">공지사항</a></li>
					</ul>
				</div>
				<div class="lnbGroup">
					<ul>
						<li><a href="#" target="_blank">아이디∙비밀번호 찾기<span class="lnbFile"></span></a></li>
						<s:if test="#session.session_type=='기업'">
						<li><a href="javascript:open_win_noresizable('checkForm.action?cmember_id=<s:property value="#session.session_id"/>&member_type=corp')" class="">회원탈퇴</a></li>
						</s:if>
						<s:else>
						<li><a href="javascript:open_win_noresizable('checkForm.action?member_id=<s:property value="#session.session_id"/>&member_type=gen')" class="">회원탈퇴</a></li>
						</s:else>
					</ul>

				</div>
				</section>
	<!--// tap menu -->
	<section class="content helpSecCont">
		<div class="mtcTplTab">
			<ul class="tabItems">
				<li class="on"><a href="#">1:1 문의사항</a></li>
			</ul>
		</div>
	<!-- tap menu //-->
		<div class="inquiryForm">
			<form id="form" action="qnaWrite.action" method="post">
				<fieldset>
					<legend>문의하기 입력</legend>
					<div class="tbInquiryBx">
						<div class="tbRow tbMail">
							<div class="tbCell tbTh">
								<label for="lb_inq_4">제목 <em>(필수)</em></label>
							</div>
							<div class="tbCell">
								<input type="text" style="width:70%;" id="lb_inq_4" name="mtm_subject" class="mtcIpt" title="이메일 주소 앞부분"  value="">
								<input type = "hidden" name="mtm_writer" value="<%= id %>"/>
								<input type="hidden" name = "mtm_session_type" value = "<%= type %>"/>
								<p>${type}</p>
							</div>
						</div>
						<div class="tbRow">
							<div class="tbCell tbTh">
								<label for="lb_inq_2">내용<em>(필수)</em></label>
							</div>
						<div class="tbCell">
							<textarea name="mtm_content" id="lb_inq_2" title="내용을 입력하세요." class="txArea"></textarea>
						</div>
						</div>
						<div class="tbRow tbMail">
							<div class="tbCell tbTh">
								<label for="lb_inq_4">답변받을 e-메일 <em>(필수)</em></label>
							</div>
							<div class="tbCell">
								<input type="text" id="lb_inq_4" name="email1" class="mtcIpt" title="이메일 주소 앞부분" value="">
								 @ <input type="text" id="lb_inq_5" name="email2" class="mtcIpt" title="이메일 주소 뒷부분" value="">
								<div class="mtcSltBx listLenSel">
									<label id="" for="lb_view_2">직접입력</label> 
									<select name="email2" id="lb_view_2" title="이메일 사업자 입력">
										<option value="">직접입력</option>
										<option value="naver.com">naver.com</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="nate.com">nate.com</option>
										<option value="daum.net">daum.net</option>
										<option value="gmail.com">gmail.com</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div id="privacyBx1" class="privacyBx">
						<dl>
							<dt>개인정보 수집 및 이용 안내</dt>
								<dd>
								<strong>문의에 대한 처리 및 답변을 위해 아이디, e-메일 정보가 수집</strong>되며, 수집된 정보는 <strong>3년간
								보관</strong>합니다. <br>회원님은 동의를 거부할 수 있으며, 거부 시 응대지원이 원활하지 않을 수 있습니다.
								</dd>
						</dl>
					</div>
					<div id="privacyBx2" class="privacyBx" style="display: none;">
						<p>보내주신 의견은 면밀히 검토하여 더 나은 서비스로 보답하겠습니다. 별도로 답변을 드리지 않는 점 양해부탁드립니다.</p>
					</div>
					<div class="inquiryBtn">
						<button type="submit" class="btnInq">
							<span>문의하기</span>
						</button>
						<button type="button" class="btnInq btnCancel">
							<span>취소</span>
						</button>
					</div>
			</fieldset>
		</form>
	</div>
	</div>
	</section>
	</div>
</div>

</body>
	