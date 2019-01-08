<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>

<body id="secMtu">

	<div id="wrap">
		<section id="container">
			<h1 class="skip">개인회원 서비스</h1>
			<section class="content">
				<div class="modal modal-spinner" role="dialog" aria-hidden="true"
					style="display: none;"></div>
				<div class="contWrap ResumeMngCont">
					<div class="innerHd">
						<ul>
							<li class="hdTab"><a
								href="rslist.action">이력서 관리</a></li>
							<li class="on"><a
								href="pflist.action">첨부파일 관리</a></li>
						</ul>
					</div>

					<h2 class="skip">이력서 관리</h2>
					<div class="btnBx">
						<a href="resumewrite/resumewrite.jsp"
							class="btn btnBl mtuSpImgBefore" target="_blank"><span>이력서
								등록</span></a>
					</div>

					
					<div class="tableList  ">
						<div class="">
							<div class="listSortArea">
								<div class="col col01">이력서 제목</div>
								<div class="col col02">이력서 관리</div>
							</div>
							<div class="mtuList">
								<ul>
									<!-- [개발] 이력서 작성중 yet 클래스 추가 -->
									<s:if test = "resultClass != null">
									<li class="ing">
										<div class="col col01">
											<div class="tit">
												<em class="badge"><s:property value = "resultClass.resume_date"/></em><a
													href="resumeView.action" target="_blank"><s:property value = "resultClass.resume_subject"/></a>
											</div>
											<div class="date"></div>
										</div>
										<div class="col col02">
											<!-- checkbox -->
											<div class="btnCell">
												<a class="btn" href="resumeModifyList.action" target="_blank">수정</a>
											</div>										
											<div class="btnCell">
												<button class="btn" type="button" onClick="delete_event();"><span>삭제</span></button>
											</div>
										</div>
									</li>
									</s:if>
									<s:else>
										<div class="col col01">
											<div class="tit" style = "text-align:center;">
												작성된 이력서가 없습니다.
											</div>
										</div>
									</s:else>
								</ul>
							</div>
						</div>

						<div class="linkMng"></div>
						<!-- TIP -->
						<div class="mtuTip">
							<strong class="skip">이용 TIP</strong>
							<ul class="tipList">
								<li>입사지원을 한 후 해당 이력서의 내용을 수정해도 <em>이전에 지원한 이력서의 내용은
										바뀌지 않으므로</em> 회사마다 이력서 내용을 다르게 지원할 수 있습니다.
								</li>
							</ul>
						</div>
						<div id="devResumeEmail" name="devResumeEmail"
							style="position: absolute; top: 100px; left: 70px; z-index: 9999; display: none;">
							<iframe id="devResumeEmailIfrm" name="devResumeEmailIfrm"
								width="593" height="450" marginwidth="0" marginheight="0"
								frameborder="no" scrolling="no" title="이력서 이메일전송 레이어"></iframe>
						</div>
					</div>



					<iframe id="frmFileDownload" style="display: none" title="빈 프레임"></iframe>
			</section>
			<hr />
			<section class="secLnb">
				<h1 class="skip">개인회원 서비스 메뉴</h1>
				<div class="lnbGroup">
					<h2 class="lnbTit">이력서 관리</h2>
					<ul>
						<li><a href="resumewrite/resumewrite.jsp"
							target="_blank">이력서 등록</a></li>
						<li><a href="rslist.action">이력서
								관리</a></li>
					</ul>
				</div>
				<div class="lnbGroup">
					<h2 class="lnbTit">회원정보 관리</h2>
					<ul>
						<li><a href="#">회원정보 수정</a></li>
						<s:if test="#session.session_type=='기업'">
						<li><a href="javascript:open_win_noresizable('checkForm.action?cmember_id=<s:property value="#session.session_id"/>&member_type=corp')" class="">회원탈퇴</a></li>
						</s:if>
						<s:else>
						<li><a href="javascript:open_win_noresizable('checkForm.action?member_id=<s:property value="#session.session_id"/>&member_type=gen')" class="">회원탈퇴</a></li>
						</s:else>
					</ul>
				</div>
			</section>
		</section>
	</div>