<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://i.jobkorea.kr/content/css/ver_2/event/banner.promotion.css?201812101600">
<link rel="stylesheet" type="text/css" href="http://i.jobkorea.kr/content/css/ver_2/common.css?201812101600" />
<link rel="stylesheet" type="text/css" href="http://i.jobkorea.kr/content/css/ver_2/gnb/gnb.css?201812101600" />
<link rel="stylesheet" type="text/css" href="http://i.jobkorea.kr/content/css/ver_2/mtc/mtc_lounge.css?201812101600">
<link rel="stylesheet" type="text/css" href="http://i.jobkorea.kr/content/css/ver_2/help/help.css?201811131600" />
<script src="simpleqna/script/jquery"></script>

</head>
<body>
<div id="wrap">
	<div id="container" class="sideTrue">
			<div id="content">
				<h1 class="skip">고객센터 메뉴</h1>


<section class="secLnb">
    <h1><span class="skip">고객센터 메뉴 - </span><a class="lnbTit" href="/help/">고객센터</a></h1>
    <div class="lnbGroup">
        <ul>
            <li>
                <a href="/help/faq/user">FAQ</a>
                <ul class="lnbTwoDep">
                    <li><a href="/help/faq/user" class="">개인회원</a></li>
                    <li><a href="/help/faq/corporation" class="">기업회원</a></li>
                    <li><a href="/help/faq/searchfirm" class="">서치펌회원</a></li>
                    <li><a href="/help/faq/outsourcing" class="">파견∙대행회원 </a></li>
                    <li><a href="/help/faq/edu" class="">교육기관회원</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <div class="lnbGroup">
        <ul>
            <li><a href="/help/inquiry" class="on">문의∙신고</a></li>
            <li><a href="https://talk.naver.com/ct/wcb8L5" target="_blank">톡톡상담<span class="lnbFile"></span></a></li>
        </ul>
    </div>
    <div class="lnbGroup">
        <ul>
            <li><a href="/help/notice" class="">공지사항</a></li>
            <li><a href="/help/event" class="">이벤트∙설문</a></li>
        </ul>
    </div>

    <div class="lnbGroup">
        <ul>
            <li><a href="/Login/Search/Search_ID.asp" target="_blank">아이디∙비밀번호 찾기<span class="lnbFile"></span></a></li>
            <li><a href="/help/leave" class="">회원탈퇴</a></li>
        </ul>
    </div>
</section>				<section class="content helpSecCont">
					<div class="loungeContent inquiryContent">
						<div class="topHdWrap">
							<h2 class="lug_hd_2">문의&#183;신고</h2>
						</div>

						<!--// 문의하기 -->
						<div class="inquiryFormWrap">




<!--// tap menu -->
<div class="mtcTplTab">
	<ul class="tabItems">
		<li class="on"><a href="/help/inquiry">문의·신고</a></li>
		<li class=""><a href="/help/inquiry/list">문의·신고 내역</a></li>
	</ul>
</div>
<!-- tap menu //-->
							<div class="inquiryForm">
								<form id="form" action="/Help/Inquiry/Save" method="post">
									<input name="__RequestVerificationToken" type="hidden" value="dMENGPLWvoIGWOXgAgrQ4ZjGEM78IMiBqoOPade7S5JzWc-0kFcv_2OQjWFPCjumKKimkC3JoySTdzwdQ2gojw25n3ujteaGuwPkqo7ULfY1" />
									<input type="hidden" name="giNo" value="0" />
									<input type="hidden" name="coMemId" />
									<input type="hidden" name="coMemType" />
									<input type="hidden" name="Category" id="Category" value="-1" />
									<input type="hidden" name="IsAgree" id="IsAgree" value="false" />
									<fieldset>
										<legend>문의하기 입력</legend>
										<div class="tbInquiryBx">
											<div class="tbRow">
												<div class="tbCell tbTh">
													문의종류 <em>(필수)</em>
												</div>
												<div class="tbCell">
													<div class="mtcSltBx listLenSel">
														<label for="lb_view_1" id="lb_type">선택</label>
														<select name="" id="lb_view_1" title="문의 종류 선택">
															<option value="-1">선택</option>
															<option value="0">서비스 이용문의</option>
															<option value="699">불량정보·오류 신고</option>
															<option value="2">서비스 제안·칭찬</option>
														</select>
													</div>
												</div>
											</div>
											<div class="tbRow">
												<div class="tbCell tbTh">
													<label for="lb_inq_2">내용 <em>(필수)</em></label>
												</div>
												<div class="tbCell">
													<textarea name="Contents" id="lb_inq_2" title="내용을 입력하세요." class="txArea"></textarea>
												</div>
											</div>
											<div class="tbRow">
												<div class="tbCell tbTh">
													파일첨부
												</div>
												<div class="tbCell">
													<div class="tbFileBx">
															<span class="fileBx" style="display: none;">
                                                                <span class="file lugSpanFile">sample.jpg</span>
																<button type="button" class="lugBtn lugBtnDel"><span class="blind">첨부파일 삭제</span></button>
																<input type="hidden" id="lb_inq_3" name="attachFile1" class="devAttachFile" />
															</span>
															<span class="fileBx" style="display: none;">
                                                                <span class="file lugSpanFile">sample.jpg</span>
																<button type="button" class="lugBtn lugBtnDel"><span class="blind">첨부파일 삭제</span></button>
																<input type="hidden" id="lb_inq_3" name="attachFile2" class="devAttachFile" />
															</span>
															<span class="fileBx" style="display: none;">
                                                                <span class="file lugSpanFile">sample.jpg</span>
																<button type="button" class="lugBtn lugBtnDel"><span class="blind">첨부파일 삭제</span></button>
																<input type="hidden" id="lb_inq_3" name="attachFile3" class="devAttachFile" />
															</span>
                                                        <span class="btnFile">
                                                            <label for="fi_1"><button type="button" id="dev-file-add" class="lugBtnA lugBtnFile"><span>파일을 추가하세요</span></button></label>
                                                            <input type="hidden" id="fileCount" value="0" />
                                                        </span>
													</div>
													<p class="tbExpBx"><span class="tahoma">10MB</span>이내의 <span class="tahoma">MS Office</span> 파일, <span class="tahoma">hwp, jpg, gif, png, pdf, zip</span> 가능</p>
												</div>
											</div>

											<div class="tbRow tbMail">
												<div class="tbCell tbTh">
													<label for="lb_inq_4">답변받을 e-메일 <em>(필수)</em></label>
												</div>
												<div class="tbCell">
													<input type="text" id="lb_inq_4" name="emailName" class="mtcIpt" title="이메일 주소 앞부분"> @ <input type="text" id="lb_inq_5" name="emailDomain" class="mtcIpt" title="이메일 주소 뒷부분">
													<div class="mtcSltBx listLenSel">
														<label id="" for="lb_view_2">직접입력</label>
														<select name="" id="lb_view_2" title="이메일 사업자 입력">
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
												<dd><strong>문의에 대한 처리 및 답변을 위해 아이디, e-메일 정보가 수집</strong>되며, 수집된 정보는 <strong>3년간 보관</strong>합니다. <br>회원님은 동의를 거부할 수 있으며, 거부 시 응대지원이 원활하지 않을 수 있습니다. </dd>
											</dl>
											<div class="agree">
												<span class="mtcChkBx mtcChkBx_1"><input type="checkbox" id="lb_agree"><label for="lb_agree" class="bxIpt">동의합니다.</label></span>
											</div>
										</div>
										<div id="privacyBx2" class="privacyBx" style="display: none;">
											<p>보내주신 의견은 면밀히 검토하여 더 나은 서비스로 보답하겠습니다. 별도로 답변을 드리지 않는 점 양해 부탁드립니다.</p>
										</div>

										<div class="inquiryBtn">
											<button type="submit" class="btnInq"><span>문의하기</span></button>
											<button type="button" class="btnInq btnCancel"><span>취소</span></button>
										</div>
									</fieldset>
								</form>
							</div>

						</div>
						<!-- 문의하기 //-->
					</div>
				</section>
				<iframe name="frameUpload" width="0" height="0" title="빈 프레임"></iframe>
			</div>
				<div style="display:none; position: absolute; right: 0px; top: 0px; opacity: 0; filter: alpha(opacity=0);">
					<form class="devFileForm" method="post" action="https://file2.jobkorea.co.kr/User/File_Attach_Inquiry.asp" enctype="multipart/form-data" target="frameUpload" accept-charset="utf-8">
						<input type="hidden" name="url" value="http://www.jobkorea.co.kr/help/inquiry/upload" />
						<input type="hidden" name="isDelete" value="false" />
						<input type="hidden" name="delFileName" />
						<input type="file" name="file" id="fi_1" title="첨부파일" accept=".doc,.docx,.ppt,.pptx,.xls,.xlsx,.hwp,.jpg,.jpeg,.gif,.png,.pdf,.zip" disabled />
					</form>
				</div>
				<div style="display:none; position: absolute; right: 0px; top: 0px; opacity: 0; filter: alpha(opacity=0);">
					<form class="devFileForm" method="post" action="https://file2.jobkorea.co.kr/User/File_Attach_Inquiry.asp" enctype="multipart/form-data" target="frameUpload" accept-charset="utf-8">
						<input type="hidden" name="url" value="http://www.jobkorea.co.kr/help/inquiry/upload" />
						<input type="hidden" name="isDelete" value="false" />
						<input type="hidden" name="delFileName" />
						<input type="file" name="file" id="fi_2" title="첨부파일" accept=".doc,.docx,.ppt,.pptx,.xls,.xlsx,.hwp,.jpg,.jpeg,.gif,.png,.pdf,.zip" disabled />
					</form>
				</div>
				<div style="display:none; position: absolute; right: 0px; top: 0px; opacity: 0; filter: alpha(opacity=0);">
					<form class="devFileForm" method="post" action="https://file2.jobkorea.co.kr/User/File_Attach_Inquiry.asp" enctype="multipart/form-data" target="frameUpload" accept-charset="utf-8">
						<input type="hidden" name="url" value="http://www.jobkorea.co.kr/help/inquiry/upload" />
						<input type="hidden" name="isDelete" value="false" />
						<input type="hidden" name="delFileName" />
						<input type="file" name="file" id="fi_3" title="첨부파일" accept=".doc,.docx,.ppt,.pptx,.xls,.xlsx,.hwp,.jpg,.jpeg,.gif,.png,.pdf,.zip" disabled />
					</form>
				</div>
	</div>
</div>

</body>
</html>