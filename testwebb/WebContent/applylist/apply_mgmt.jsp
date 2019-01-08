<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix = "s" uri = "/struts-tags" %>
<%
	String session_id = (String)session.getAttribute("session_id");
%>
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
								href="corppostlist.action">공고 관리</a></li>
							<li class="on"><a
								href="applyList.action">지원자 관리</a></li>
						</ul>
					</div>

					<div class="tableList  ">
						<div class="">
							<div class="listSortArea">
								<div class="col col01">이력서 제목</div>
								<div class="col col02">지원자 ID</div>
							</div>
							<div class="mtuList">
								<s:iterator value="applyList" status="stat">
									<ul>
										<li class="ing">
											<div class="col col01">
												<div class="tit">
													<em class="badge">NEW</em>
													<a href="" target="_blank">
														<input type="hidden" name="resume_subject" value="<s:property value="resume_subject"/>"/>
														<s:property value="resume_subject"/>
													</a>
												</div>
											</div>
											<div class="col col02">
												<div class="btnCell">
													<s:property value="resume_m_id"/>
												</div>
												<div class="btnCell">
													<button class="btn" type="button" onclick="">
														삭제
													</button>
												</div>
											</div>
										</li>
									</ul>
								</s:iterator>
								<!--  
								<ul>
									<li class="ing">
										<div class="col col01">
											<div class="tit">
												<em class="badge">2018.12.19</em>
												<a href="#" target="_blank">
													apply_subject
												</a>
											</div>
											<div class="date"></div>
										</div>
										<div class="col col02">
											<div class="btnCell">
												<a class="btn" href="#" target="_blank">apply_m_id</a>
											</div>
											<div class="btnCell">
												<button class="btn" type="button" onclick="javascript:location.href='applyListDelete.action?apply_no=<s:property value="apply_no"/>'">
													<span>삭제</span>
												</button>
											</div>
										</div>
									</li>
								</ul>
								-->
							</div>
						</div>

						<div class="linkMng"></div>
						<!-- TIP -->
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
							<h2 class="lnbTit">공고 및 지원자 관리</h2>
							<ul>
								<li><a href="corppost.action"
									target="_blank">공고 등록</a></li>
								<li><a href="corppostlist.action">등록 공고
										관리</a></li>
								<li><a href="corpresumelist.action">지원자
										관리</a></li>
							</ul>
						</div>
						<hr/>
						<div class="lnbGroup">
							<h2 class="lnbTit">인재관리</h2>
							<ul>
								<li><a href="corphrsearch.action"
									target="_blank">인재 검색</a></li>
							</ul>
						</div>
						<hr/>
						<div class="lnbGroup">
							<h2 class="lnbTit">회원정보 관리</h2>
							<ul>
								<li><a href="corpinfo.action">기업정보 수정</a></li>
								<li><a href="#">회원정보 수정</a></li>
								<li><a href="#">회원탈퇴</a></li>
							</ul>
						</div>
					</section>
		</section>
	</div>