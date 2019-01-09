<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<body id="secMtu">
	<div id="wrap">
		<div id="container">
			<h1 class="skip">개인회원 서비스</h1>
			<section class="content">
				<div class="contWrap ResumeMngCont ResumeFileCont">
					<div class="innerHd">
						<ul>
							<li class="on"><a href="rslist.action">이력서 관리</a></li>
							<li class="hdTab"><a href="pflist.action">첨부파일 관리</a></li>
						</ul>
					</div>
					<h2 class="skip">첨부파일 관리</h2>
					<div class="btnBx"></div>
					<div class="tableList">

						<div class="listSortArea">
							<div class="col col01">구분</div>
							<div class="col col02">파일 제목</div>
							
							<!-- [개발] 리스트 레이블 : 삭제로 변경 -->
						</div>

						<div class="mtuList">
							<ul>
								<li>
									<s:if test = "portClass.port_orgname != null">
									<div class="col col01">포트폴리오</div>
									<div class="col col02">
										<a href = "fileDownload.action?fileDownloadName=<s:property value = "portClass.port_orgname"/>"><s:property value = "portClass.port_orgname"/></a>
									</div>
									
									</s:if>
									<s:else>
									<div class="col col01"><b>포트폴리오</b></div>
									<div class="col col02">
										저장된 포트폴리오가 없습니다.
									</div>
									
									</s:else>
								</li>
							</ul>
						</div>

						<div id="devAddFileView" name="devAddFileView"
							style="position: absolute; top: 70px; left: 220px; z-index: 5000; display: none;">
							<iframe id="devAddFileViewIfrm" name="devAddFileViewIfrm"
								width="470" height="511" marginwidth="0" marginheight="0"
								frameborder="no" scrolling="no" title="첨부파일 등록수정 레이어"></iframe>
						</div>

						
						<div class="tplPagination">


							<ul>

								<li><span class="now">1</span></li>

							</ul>

						</div>
					</div>

					<!-- TIP -->
					<div class="mtuTip">
						<strong class="skip">이용 TIP</strong>
						<ul class="tipList">
							<li><b><font color = "blue">포트폴리오 등록은 이력서 수정페이지에서 하실 수 있습니다.</font></b></li>
							<li>등록한 첨부파일은 온라인 입사지원 시 첨부하여 지원하실 수 있습니다.</li>
							<li>포트폴리오란? 이력서에 담기 힘든 나만의 재능을 모은 포트폴리오, 기획서 파일을 등록하여
								인사담당자에게 공개하거나 입사지원시 활용하실 수 있습니다.</li>
							<li>기타문서란? 경력기술서, 기획서, 증명서 등 별도첨부용 파일을 등록하여 입사지원 시 활용하실 수
								있습니다.</li>
							<li>첨부파일은 최대 <em>100MB</em>에서 자유롭게 등록 가능하나, <em>개인정보가
									유출될 수 있는 자료는 등록하지 않으실 것을 권장합니다.</em></li>
							<li>개인정보보호를 위해 개인정보 포함 이미지는 사전동의 없이 삭제 될 수 있습니다.</li>
							<li>위조된 문서를 등록하여 취업활동에 이용 시 법적 책임을 지게 될 수 있습니다.</li>
							<li>잡코리아(유)는 구직자가 등록 한 문서에 대해 보증하거나 별도의 책임을 지지 않으며 첨부된 문서를
								신뢰하여 발생한 법적 분쟁에 책임을 지지 않습니다.</li>
						</ul>
					</div>

				</div>

			</section>
			<section class="secLnb">
				<h1 class="skip">개인회원 서비스 메뉴</h1>
				<div class="lnbGroup">
					<h2 class="lnbTit">이력서 관리</h2>
					<ul>
						<li><a href="resumewrite/resumewrite.jsp" target="_blank">이력서 등록</a></li>
						<li><a href="rslist.action">이력서 관리</a></li>
					</ul>
				</div>
				<div class="lnbGroup">
					<h2 class="lnbTit">회원정보 관리</h2>
					<ul>
						<li><a href="#">회원정보 수정</a></li>
						<s:if test="#session.session_type=='기업'">
							<li><a
								href="javascript:open_win_noresizable('checkForm.action?cmember_id=<s:property value="#session.session_id"/>&member_type=corp')"
								class="">회원탈퇴</a></li>
						</s:if>
						<s:else>
							<li><a
								href="javascript:open_win_noresizable('checkForm.action?member_id=<s:property value="#session.session_id"/>&member_type=gen')"
								class="">회원탈퇴</a></li>
						</s:else>
					</ul>
				</div>
			</section>
		</div>

	</div>
</body>
