<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body id="secStar" class="lgiSubRead" style="">
	<div id="wrap">
		<section id="container">
			<h1 class="tpl_hd_1" style="width: 960px; margin: auto;">
				<span class="blind">
					<s:property value=""/>
				</span> 채용정보
			</h1>
			<section class="secReadSummary" style="width: 960px; margin: auto;">
				<h2 class="hd_2 blind">요약정보</h2>
				<div class="readSumWrap clear">
					<article class="artReadJobSum">
						<div class="sumTit">
							<h3 class="hd_3">
								<span class="coName"> 기업명 </span>
								<s:property value=""/>
							</h3>
						</div>
						<div class="tbRow clear">
							<div class="tbCol ">
								<h4 class="hd_4">지원자격</h4>
								<dl class="tbList">
									<dt>경력</dt>
									<dd>
										<strong class="col_1">
											<s:property value=""/>
										</strong> 
									</dd>
									<dt>학력</dt>
									<dd>
										<strong class="col_1">
											<s:property value=""/>
										</strong> 
									</dd>
								</dl>
							</div>
							<div class="tbCol ">
								<h4 class="hd_4">근무조건</h4>
								<dl class="tbList">
									<dt>고용형태</dt>
									<dd>
										<ul class="addList">
											<li>
												<strong class="col_1">
													<s:property value=""/>
												</strong> 
											</li>
										</ul>
									</dd>
									<dt>급여</dt>
									<dd>
										<s:property value=""/>
									</dd>
									<dt>지역</dt>
									<dd>${resultClass.post_loc}</dd>
									<dt>시간</dt>
									<dd>
										<!-- 
										주<span class="tahoma">5</span>일 (월~금)
										 -->
										post_time
									</dd>
								</dl>
							</div>
						</div>
					</article>
				</div>
				<p class="sumBtn">
					<button type="button"
						class="tplBtn tplBtn_1 tplBtnBlue devHomePageApplyBtn"
						onclick="window.open('/List_GI/GIB_Read_homepage_Link.asp?GI_NO=31310176','win_home');GI_Click_Cnt('','E05');"
						title="홈페이지 지원(새창)" id="devApplyBtn">
						<span>홈페이지 지원</span>
					</button>
				</p>
			</section>
			<table align="center" width="960px" border="0" cellspacing="0" cellpadding="0">
				<tr height="20">
					<td bgcolor="#d2d2d2" align="center" colspan="3" align="left" height="30">
						<font size="3">기 업 리 뷰</font>
					</td>
				</tr>
				<s:iterator value="reviewList" status="stat">
					<tr>
						<s:hidden name="review_no" value="%{resultClass.review_no}" />
						<td height="30" width="100" align="center" bgcolor="#e9e9e9">
							<font size="2">
								<s:property value="review_writer" /> 
							</font>
						</td>
						<td height="30" width="634" align="left" bgcolor="#ffffff">
							<font size="2">
								&nbsp;&nbsp;<s:property value="review_content" />
							</font>
						</td>
						<td height="30" width="100" align="center" bgcolor="#ffffff">
							<font size="2">
								<s:property value="review_date" />
							</font>
						</td>
						<s:set name="review_writer" value='<s:property value="review_writer"/>' />
						<s:if test="#session.session_id == review_writer">
							<td>
								<!-- 코멘트 삭제 --> 
								<a href="javascript:open_win_noresizable('fcDeleteCheck.action?fc_no=<s:property value="fc_no" />&fc_orgno=<s:property value="fc_orgno"/>&currentPage=<s:property value="currentPage" />','fcDeleteCheck')">
									x
								</a>
							</td>
						</s:if>
					</tr>
					<tr bgcolor="#9aafc9">
						<td height="1" colspan="3"></td>
					</tr>
				</s:iterator>
				<s:if test="reviewList.size() <= 0">
					<tr>
						<td align="center" colspan="3" height="30">댓글 없음</td>
					</tr>
					<tr bgcolor="#9aafc9">
						<td height="1" colspan="3"></td>
					</tr>
				</s:if>
			</table>
			<br>
			<table align="center" width="834" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td colspan="2" height="10">
						<!-- 댓글 쓰기 -->
						<form action="reviewWrite.action?review_post_no=<s:property value="review_post_no" />&review_no=<s:property value="review_no" />&currentPage=<s:property value="currentPage" />" method="post" name="write" onsubmit="return validation();">
							<table>
								<tr>
									<td align="center" width="100">작성자<br>${session.session_id}</td>
									<s:hidden name="review_post_no" value="%{fresultClass.review_post_no}" />
									<s:hidden name="review_no" value="%{fcresultClass.review_no}" />
									<s:hidden name="currentPage" value="%{currentPage}" />
									<td align="center">
										<s:textarea wrap="hard" name="review_content" theme="simple" value="" cols="90" rows="5" />
									</td>
								</tr>
								<tr>
									<td colspan="2" align="right">
										<input name="submit" type="submit" value="리뷰 작성" class="inputb">
									</td>
								</tr>
							</table>
						</form>
					</td>
				</tr>
				<tr bgcolor="#9aafc9">
					<td height="1" colspan="2"></td>
				</tr>
				<tr>
					<td align="center" colspan="2" height="30"></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<s:if test="#session.session_id == resultClass.f_id">
							<input name="list" type="button" value="수정" class="inputb" onClick="javascript:location.href='fModifyForm.action?f_no=<s:property value="fresultClass.f_no" />&currentPage=<s:property value="currentPage" />'">
						</s:if> 
						<s:if test="#session.session_id == fresultClass.f_id || #session.session_admin == 2">
							<input name="list" type="button" value="삭제" class="inputb" onClick="javascript:deleteForm('fDeleteCheck.action?f_no=<s:property value="f_no" />&currentPage=<s:property value="currentPage" />')">
						</s:if> 
						<input name="list" type="button" value="목록" class="inputb" onClick="javascript:location.href='fList.action?currentPage=<s:property value="currentPage" />'">
					</td>
				</tr>
			</table>
		</section>
	</div>
</body>
