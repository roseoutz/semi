<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<body id="" class="top100Main"><!--// top100Main 추가 -->
	<!--// top100Main 추가 -->
	<div id="wrap">
		<a name="top"></a>
		<div id="container">



			<div id="content">


				<form id="form1" method="get" action="/Top100/"
					accept-charset="utf-8">
					<!--// TOP 100 -->
					<div class="topHdWrap">
						<h2 class="top_hd_2">일간 채용 TOP100</h2>
						<!--// 안내 레이어 -->
						<div class="tplLyWrap devTplLyClick">
							<button type="button" class="topBtn topBtnHelp devTplLyBtn">
								<span class="blind">TOP100 안내</span>
							</button>
							<div class="tplLyType devLyType">
								<p class="lyCnt">
									일간 서비스 이용량 중<br />조회 수+관심도(스크랩)를 반영한 랭킹입니다.
								</p>
								<p class="lyBtn">
									<button type="button"
										class="tplBtnTy tplLyBtnClose devLyBtnClose">
										<span class="blind">TOP100 안내 닫기</span>
									</button>
								</p>
								<span class="tplIcnTy tplLyIcnArrTop"></span>
							</div>
						</div>

					</div>


					<div class="topContent" id="divTop100">

						<!--// 직무별 탭 메뉴 -->
						<!--상단 TAP 구성 시작-->
						<ul class="topTypeTab topTypeTab_1">
							<li class="devMenu active" data-searchtype="1"><button
									type="button">
									<span>직무별</span>
								</button></li>

						</ul>
						<!--상단 TAP 구성 끝-->

						<div id="devTypeTab_1" class="topListWrap" style="display: block;">

							<!--필터-->






							<!--// 직무 분류 탭 메뉴 -->
							<div class="topTabArea">
								<ul class="topTypeTab topTypeTab_2">
									<li class="devJobtypeli active">
										<button type="button"
											class="topBtnB topBtnSel devJobtypeBctgr" data-bctgrcode="0">
											<span>전체</span>
										</button>
									</li>
									<li class="devJobtypeli ">
										<button type="button"
											class="topBtnB topBtnSel devJobtypeBctgr"
											data-bctgrcode="10012">
											<span>경영·사무</span>
										</button>
									</li>
									<li class="devJobtypeli ">
										<button type="button"
											class="topBtnB topBtnSel devJobtypeBctgr"
											data-bctgrcode="10013">
											<span>마케팅·광고·홍보</span>
										</button>
									</li>
									<li class="devJobtypeli ">
										<button type="button"
											class="topBtnB topBtnSel devJobtypeBctgr"
											data-bctgrcode="10016">
											<span>IT·인터넷</span>
										</button>
									</li>
									<li class="devJobtypeli ">
										<button type="button"
											class="topBtnB topBtnSel devJobtypeBctgr"
											data-bctgrcode="10019">
											<span>디자인</span>
										</button>
									</li>
									<li class="devJobtypeli ">
										<button type="button"
											class="topBtnB topBtnSel devJobtypeBctgr"
											data-bctgrcode="10014">
											<span>무역·유통</span>
										</button>
									</li>
									<li class="devJobtypeli ">
										<button type="button"
											class="topBtnB topBtnSel devJobtypeBctgr"
											data-bctgrcode="10015">
											<span>영업·고객상담</span>
										</button>
									</li>
									<li class="devJobtypeli ">
										<button type="button"
											class="topBtnB topBtnSel devJobtypeBctgr"
											data-bctgrcode="10018">
											<span>연구개발·설계</span>
										</button>
									</li>
									<li class="devJobtypeli ">
										<button type="button"
											class="topBtnB topBtnSel devJobtypeBctgr"
											data-bctgrcode="10022">
											<span>서비스</span>
										</button>
									</li>
									<li class="devJobtypeli ">
										<button type="button"
											class="topBtnB topBtnSel devJobtypeBctgr"
											data-bctgrcode="10017">
											<span>생산·제조</span>
										</button>
									</li>
									<li class="devJobtypeli ">
										<button type="button"
											class="topBtnB topBtnSel devJobtypeBctgr"
											data-bctgrcode="10023">
											<span>교육</span>
										</button>
									</li>
									<li class="devJobtypeli ">
										<button type="button"
											class="topBtnB topBtnSel devJobtypeBctgr"
											data-bctgrcode="10021">
											<span>건설</span>
										</button>
									</li>
									<li class="devJobtypeli ">
										<button type="button"
											class="topBtnB topBtnSel devJobtypeBctgr"
											data-bctgrcode="10024">
											<span>의료</span>
										</button>
									</li>
									<li class="devJobtypeli ">
										<button type="button"
											class="topBtnB topBtnSel devJobtypeBctgr"
											data-bctgrcode="10020">
											<span>미디어</span>
										</button>
									</li>
									<li class="devJobtypeli ">
										<button type="button"
											class="topBtnB topBtnSel devJobtypeBctgr"
											data-bctgrcode="10025">
											<span>전문·특수직</span>
										</button>
									</li>
									<li></li>
									<li></li>
									<li></li>
									<li></li>
									<li></li>
									<li></li>
								</ul>
								<!--// 디자인용 -->
								<span class="bd bd_lt"></span> <span class="bd bd_tp"></span> <span
									class="bd bd_rt"></span> <span class="bd bd_bt"></span>
							</div>


							<div class="rankListWrap">

								<!--DataList 신입리스트-->
								<div class="rankListArea devSarterTab" style="display: block">

									<h4 class="blind">신입 TOP 리스트</h4>



									<ol class="rankList">

										<li
											data-source='{"memberId":"","gno":27123252,"giNo":31289704,"companyMemberType":"C"}'>
											<div class="rank">
												<span class="num">1</span> <em class="icnNew"><span
													class="blind">NEW</span>NEW</em>
											</div>
											<div class="co">
												<div class="coTit">
													<!--기업명-->
													<a class="coLink" href="/Company/1624710" target="_blank"
														title="기업정보 이동"><b>㈜지에스아이티엠(GSITM)</b></a>

													<!-- 관심기업 : 클릭했을경우 tplBtnFavOff 클래스 삭제. tplBtnFavOn 추가 -->
													<button type="button" title="관심기업"
														class="tplBtnTy tplBtnFavOff devFavor"
														data-memberid="itmexsyi">
														<span class="blind">관심기업</span>
													</button>
												</div>

												<div class="coDesc">
													<div class="coLyArea">

														<!--우수기업 강소기업,우수중소,히든챔피언, 고용창출100대우수기업-->
													</div>
												</div>
											</div>

											<div class="info">
												<div class="tit">
													<div class="titPoint">
														<!-- 클릭했을경우 .on 추가 -->
														<button type="button" title="스크랩"
															class="topBtn topBtnScr devScrap " data-gino="31289704"
															data-gno="27123252" data-m_id="" data-membertype="C">
															<span class="blind">스크랩</span>
														</button>
													</div>
													<!--신입공채 페이지 호출방식변경-->
													<a href="/Recruit/GI_Read/27123252?PageGbn=ST&amp;TpGb=TP"
														class="link" target="_blank"
														title="㈜GS ITM 2019년 인턴사원 공개채용"><span>㈜GS ITM
															2019년 인턴사원 공개채용</span></a>
												</div>
												<div class="sTit">
													<span>QA&#183;테스터&#183;검증</span> <span>네트워크&#183;서버&#183;보안</span>
													<span>웹기획&#183;PM</span> <span>웹마케팅 외</span>
												</div>
												<div class="sDsc">

													<span>인턴&#183;신입</span> <span>대졸↑</span> <span>서울</span> <span>인턴</span>
												</div>
											</div>

											<div class="side">
												<span class="btn app"><button type="button"
														class="tplBtn tplBtn_1 tplBtnBlue devApplyHomepage"
														data-gino="31289704" data-pagecode="ST"
														data-gno="27123252" data-ctgrcode="C01"
														data-career="인턴&#183;신입">
														<span>홈페이지 지원</span>
													</button></span>
												<!--마감일-->
												<span class="day ">~01/07(월)</span>
											</div>
										</li>


									</ol>
									<div class="btnFuncArea"></div>

								</div>


								<!--DataList 경력리스트-->
								<div class="rankListArea devCareerTab" style="display: none">
									<h4 class="blind">경력 TOP 리스트</h4>



									<ol class="rankList">

										<li
											data-source='{"memberId":"","gno":27146175,"giNo":31310176,"companyMemberType":"C"}'>
											<div class="rank">
												<span class="num">1</span> <em class="topIcnB topIcnBUp"><span
													class="blind">상승</span>1</em>
											</div>
											<div class="co">
												<div class="coTit">
													<!--기업명-->
													<a class="coLink" href="/Company/1648371" target="_blank"
														title="기업정보 이동"><b>LS엠트론㈜</b></a>

													<!-- 관심기업 : 클릭했을경우 tplBtnFavOff 클래스 삭제. tplBtnFavOn 추가 -->
													<button type="button" title="관심기업"
														class="tplBtnTy tplBtnFavOff devFavor"
														data-memberid="lsmtron09">
														<span class="blind">관심기업</span>
													</button>
												</div>

												<div class="coDesc">
													<!--그룹명-->
													<div class="coGroup">
														<strong>LS그룹</strong>
													</div>
													<div class="coLyArea">

														<div class="btnItem">
															<button type="button" class="devType1000">
																<span>1000대기업</span>
															</button>
															<!-- // 1000대기업 레이어 영역 -->
															<div class="tplLyType case" style="display: none">
																<div class="lyCnt">
																	<p class="lyDsc">278 위</p>
																</div>
																<p class="lyBtn">
																	<button type="button"
																		class="tplBtnTy tplLyBtnClose devLyBtnClose">
																		<span class="blind">1000대기업 순위 닫기</span>
																	</button>
																</p>
															</div>
															<!-- 1000대기업 레이어 영역 // -->
														</div>
														<!--우수기업 강소기업,우수중소,히든챔피언, 고용창출100대우수기업-->
													</div>
												</div>
											</div>

											<div class="info">
												<div class="tit">
													<div class="titPoint">
														<!-- 클릭했을경우 .on 추가 -->
														<button type="button" title="스크랩"
															class="topBtn topBtnScr devScrap " data-gino="31310176"
															data-gno="27146175" data-m_id="" data-membertype="C">
															<span class="blind">스크랩</span>
														</button>
													</div>
													<!--신입공채 페이지 호출방식변경-->
													<a href="/Recruit/GI_Read/27146175?TpGb=TP" class="link"
														target="_blank" title="2019년 LS엠트론 신입/경력사원 수시 채용"><span>2019년
															LS엠트론 신입/경력사원 수시 채용</span></a>
												</div>
												<div class="sTit">
													<span>기획&#183;전략&#183;경영</span> <span>사무&#183;총무&#183;법무</span>
													<span>경리&#183;회계&#183;결산</span> <span>재무&#183;세무&#183;IR
														외</span>
												</div>

												<div class="sDsc">
													<span>신입&#183;경력</span> <span>대졸↑</span> <span>경기,
														전북</span> <span>정규직</span>
												</div>
											</div>

											<div class="side">
												<span class="btn app"><button type="button"
														class="tplBtn tplBtn_1 tplBtnBlue devApplyHomepage"
														data-gino="31310176" data-pagecode="" data-gno="27146175"
														data-ctgrcode="C01" data-career="신입&#183;경력">
														<span>홈페이지 지원</span>
													</button></span>
												<!--마감일-->
												<span class="day ">~12/26(수)</span>
											</div>
										</li>

									</ol>
									<div class="btnFuncArea"></div>
								</div>

							</div>
						</div>

					</div>


					<!--sideContent 시작-->



					<div class="sideContent">

						<!--// 연봉 검색 순위 -->
						<div class="column">
							<h3 class="top_hd_3">
								<span>연봉 검색 순위</span>
							</h3>
							<ol class="topList">
								<li class="rank_1"><a href="/Salary/55541"
									class="devClick devHref" target="_blank"> <span class="num">1</span>
										<span class="titBx">카카오</span> <span class="txBx">7,427</span>
								</a></li>
								<li class="rank_2"><a href="/Salary/757"
									class="devClick devHref" target="_blank"> <span class="num">2</span>
										<span class="titBx">유코카캐리어스</span> <span class="txBx">14,395</span>
								</a></li>
								<li class="rank_3"><a href="/Salary/672744"
									class="devClick devHref" target="_blank"> <span class="num">3</span>
										<span class="titBx">JYP Ent.</span> <span class="txBx">3,477</span>
								</a></li>
								<li class="rank_4"><a href="/Salary/77454"
									class="devClick devHref" target="_blank"> <span class="num">4</span>
										<span class="titBx">삼성전자</span> <span class="txBx">10,987</span>
								</a></li>
								<li class="rank_5"><a href="/Salary/2137"
									class="devClick devHref" target="_blank"> <span class="num">5</span>
										<span class="titBx">지에스아이티엠</span> <span class="txBx">4,587</span>
								</a></li>
								<li class="rank_6"><a href="/Salary/67812"
									class="devClick devHref" target="_blank"> <span class="num">6</span>
										<span class="titBx">한국전력공사</span> <span class="txBx">8,497</span>
								</a></li>
								<li class="rank_7"><a href="/Salary/112411"
									class="devClick devHref" target="_blank"> <span class="num">7</span>
										<span class="titBx">네이버아이앤에스</span> <span class="txBx">4,949</span>
								</a></li>
								<li class="rank_8"><a href="/Salary/323014"
									class="devClick devHref" target="_blank"> <span class="num">8</span>
										<span class="titBx">이스타항공</span> <span class="txBx">3,208</span>
								</a></li>
								<li class="rank_9"><a href="/Salary/4292"
									class="devClick devHref" target="_blank"> <span class="num">9</span>
										<span class="titBx">한국생산성본부</span> <span class="txBx">6,138</span>
								</a></li>
								<li class="rank_10"><a href="/Salary/47774"
									class="devClick devHref" target="_blank"> <span class="num">10</span>
										<span class="titBx">현대산업개발</span> <span class="txBx">6,938</span>
								</a></li>
							</ol>
						</div>

						<!--// 인기 검색어 -->


						<!--// 바로가기 링크 -->
						<div class="quickLinkWrap">
							<div class="column quickLink">
								<h3 class="top_hd_3 blind">바로가기 메뉴</h3>

								<p class="link_2">
									<a href="/recruit/joblist?menucode=search" class="topIcnB"><strong>채용공고</strong>
										<span class="topBtnA topBtnArr">상세검색</span></a>
								</p>
							</div>

							<div class="btnSideTop">
								<button type="button" class="tplBtn tplBtnTop"
									title="페이지 상단으로 이동">
									<span>TOP</span>
								</button>
							</div>
						</div>

					</div>
					<!--sideContent 끝-->
					<!-- TOP 100 //-->
				</form>
			</div>




		</div>
	</div>


	<!--// 사이드 메뉴 UI 확인용 -->
	<script>
		$(document).ready(
				function() {
					var b = $(".quickLinkWrap").offset().top;
					var c = $(".topContent").offset().top
							+ $(".topContent").outerHeight();
					var d = c - $(".quickLinkWrap").outerHeight();

					function scrollAside() {
						var a = $(window).scrollTop();
						var $this = $(".quickLinkWrap");

						if (a <= b) {
							$this.removeClass("fixed");
						} else if (a >= d) {
							$this.addClass("fixed");
							$this.addClass("end");
						} else {
							$this.addClass("fixed");
							$this.removeClass("end");
						}
					}

					$(window).on("scroll load reload resize", function() {
						scrollAside();
					});
				});

		$('.btnSideTop .tplBtnTop').click(function() {
			$('body,html').animate({
				scrollTop : 0
			}, 500);
		});
	</script>
	<!-- UI 확인용 //-->