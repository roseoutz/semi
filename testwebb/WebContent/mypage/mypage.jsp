<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<body id="secMtu" class="mtuHome">
	<div id="wrap">
		<section id="container">
			<h1 class="skip">개인회원 서비스</h1>
			<section class="content">
				<div class="contWrap">
					<div class="mtuTab devFixedTab">
						<ul>
							<li class="on"><a href="#">이력서 리스트</a></li>
						</ul>
					</div>

					<!-- 스마트매치 -->
					<h2 class="skip">이력서 리스트</h2>

					<div class="mtuList boothList smartMatchList" id="smartMatch">
						<ul>
							<li>
							<s:if test = "resultClass != null">
								<div class="col infoCol">
									<div class="company">
										<a href="resumeView.action" ><s:property value = "resultClass.resume_subject"/></a>
									</div>
									<div class="desc">
										<a href="#" target="_blank" class="giread"></dd>
											<dl>
												<dt>최종 수정일 :</dt>

												<dd><s:property value = "resultClass.resume_date"/></dd>
											</dl> </a>
									</div>
								</div>
								<div class="col btnCol">


									<button type="button" onclick = "javascript:location.href='resumeModifyList.action'"
										class="tplBtn tplBtn_1 tplBtnOrg mtuBtn_2 mtuBtnOrg devBtnPassDirect gireadNoMove">
										<span>수정하기</span>
									</button>
								</div>
							</s:if>
							<s:else>
								<div class="col infoCol">
									<div class="company">
										<b>등록된 이력서가 없습니다.</b>
									</div>
									
								</div>
								
							</s:else>
							</li>

						</ul>
					</div>
					<div class="active">
						<div class="mtuTab devFixedTab">
							<ul>
								<li class="on"><a href="#">이력서 지원 현황</a></li>
							</ul>
						</div>
						<h2 class="skip">주요활동내역</h2>
						<div class="mtuList boothList smartMatchList" id="smartMatch">
							<ul>
								<li
									data-source="{&quot;memberId&quot;:&quot;rocketdivez&quot;,&quot;gno&quot;:27096719,&quot;giNo&quot;:31265930,&quot;companyMemberType&quot;:&quot;C&quot;,&quot;headhunterId&quot;:null,&quot;oemCode&quot;:&quot;C1&quot;, &quot;sc&quot;:&quot;10&quot;}">
									<div class="col infoCol">
										<div class="company">
											<a href="#" target="_blank">㈜가연아이앤씨</a>
										</div>
										<div class="desc">
											<a href="#" target="_blank" class="giread">
												<dl>
													<dt>모집정보 :</dt>
													<dd>초대졸↑</dd>
													<dd>신입·경력</dd>
													<dd>서울 &gt; 서울전지역</dd>
												</dl>
												<dl>
													<dt>직무분야 :</dt>

													<dd>시스템프로그래머,네트워크·서버·보안,ERP·시스템분석·설계,응용프로그래머,DBA·데이터베이스,컨텐츠·사이트운영</dd>
												</dl>
											</a>
										</div>
									</div>
									<div class="col btnCol">
										<em class="deadline date"><span class="tahoma">~12.28</span>(금)</em>
									</div>
								</li>
								<li
									data-source="{&quot;memberId&quot;:&quot;rocketdivez&quot;,&quot;gno&quot;:27096719,&quot;giNo&quot;:31265930,&quot;companyMemberType&quot;:&quot;C&quot;,&quot;headhunterId&quot;:null,&quot;oemCode&quot;:&quot;C1&quot;, &quot;sc&quot;:&quot;10&quot;}">
									<div class="col infoCol">
										<div class="company">
											<a href="#" target="_blank">㈜가연아이앤씨</a>
										</div>
										<div class="desc">
											<a href="#" target="_blank" class="giread">
												<dl>
													<dt>모집정보 :</dt>
													<dd>초대졸↑</dd>
													<dd>신입·경력</dd>
													<dd>서울 &gt; 서울전지역</dd>
												</dl>
												<dl>
													<dt>직무분야 :</dt>

													<dd>시스템프로그래머,네트워크·서버·보안,ERP·시스템분석·설계,응용프로그래머,DBA·데이터베이스,컨텐츠·사이트운영</dd>
												</dl>
											</a>
										</div>
									</div>
									<div class="col btnCol">
										<em class="deadline date"><span class="tahoma">~12.28</span>(금)</em>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</section>
			<!--// Lnb Area -->
			<!-- [개발] 메뉴 선택시 a.on 추가 -->
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
			<hr>
		</section>
	</div>

</body>