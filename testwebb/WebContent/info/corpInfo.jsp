<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String session_id = (String) session.getAttribute("session_id");
	String session_type = (String) session.getAttribute("session_type");
%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>회원정보 수정 ㅣ 잡코리아 - 좋은 일이 생긴다(www2)</title>


<link rel="SHORTCUT ICON" href="http://www.jobkorea.co.kr/favicon.ico"> 

<body id="secMbr" class="mbrSubMng mbrSubMngGG mbrSubMngInfo">

<div id="skipNavigation">
	<p><a href="https://www.jobkorea.co.kr/Text_User/User_Info_Mng.asp#container">메뉴 건너뛰기</a></p>
</div>
<hr>

<!--// Header Area -->
<script type="text/javascript">
<!--
	function go_Main(){
		top.location.href = "http://www.jobkorea.co.kr";
	}
//-->
</script>
<!--// Header area(회원정보관리) -->
<div id="header">
	<div class="gnbWrap gnbWrap_mMng">
		<div id="gnb">
			<!--// 개인회원 -->
			<h1><a class="logo" href="http://www.jobkorea.co.kr/"><img alt="잡코리아" src="./info/resources/h_logo.gif"></a>
			<span class="bar"><span class="title"><img src="./info/resources/h_mng_gg.gif" width="117" height="23" alt="회원정보 관리"></span></span>
			</h1>
			<h2 class="skip">주요링크</h2>
			<div class="secNav">
				<ol>
					<li class="mn1"><a href="localhost:8080/testwebb/editInfo.action"><span></span>개인정보 수정</a></li>
					<li class="mn2"><a href="#"><span></span>비밀번호변경</a></li>
					<li class="mn3 end"><a href="#" target="_blank"><span></span>회원탈퇴</a></li>
				</ol>
			</div>
		</div>
	</div>
</div>
<hr>
<div class="devGuideBox ly_popup_info" style="top: 22px; left: 912px; display: none;"></div>
<div id="wrap">
	<!--// Contents Area -->
	<div id="container">
		<div id="content">
			<h1 class="skip">회원정보 수정</h1>
			<form name="form" method="post" action="https://www.jobkorea.co.kr/Text_User/User_Info_Mng_Ok.asp">
				<input type="hidden" name="M_Hand_Phone" id="M_Hand_Phone" value="">
				<input type="hidden" name="M_Home_Phone" id="M_Home_Phone" value="<s:property value='resultClass.member_phone'/>">
				<input type="hidden" name="R_No" id="R_No" value="">
				<input type="hidden" name="Alimy_Chk" id="Alimy_Chk" value="0">
				<input type="hidden" name="GoodJob_Mailing_Stat" id="GoodJob_Mailing_Stat" value="">
				<input type="hidden" name="OEM_No" id="OEM_No" value="">
				<input type="hidden" name="re_url" id="re_url" value="">
				<fieldset>
				<legend>회원정보 수정 입력폼</legend>
				<div class="mbrSec mbrMngInfo">
					<h2 class="mbrHeading2"><img src="./info/resources/mbr_h_mng_gg.gif" alt="회원정보 수정"></h2>
					<div class="mbrTplDesc">
						<p>회원님의 정보를 수정·확인하실 수 있습니다.</p>
					</div>
					<div class="mbrTplData2">
						<table summary="이 표는 회원정보 수정 입력폼으로 아이디, 비밀번호, 비밀번호확인, 이름, 생년월일/성별, 연락처, 이메일을 나타내고 있습니다.">
							<caption>
								<span class="skip">회원정보 수정 입력폼</span>
							</caption>
							<colgroup>
								<col width="110px">
								<col width="87px">
								<col width="*">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" colspan="2">
										<label for="lb_id">
											<span class="blank"></span> 
											아이디
										</label>
									</th>
									<td>
										<!-- session_id 값 가져오기 -->
										<div class="social_row">
											<strong>
												${session_id}
											</strong>
											<input type="hidden" name="session_id" value=""/> 
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row" colspan="2">
										<span class="blank"></span> 
										사업자등록번호
										<img alt="필수입력사항" src="./info/resources/icon_b.gif">
									</th>
									<td colspan="3">
										<input type="hidden" class="txtForm" id="M_Name" name="M_Name" size="12" maxlength="15" value="">
										<s:property value="resultClass.cmember_cno"/>
									</td>
								</tr>
								<tr>
									<th scope="row" colspan="2">
									<span class="blank"></span> 
									이름 
									<img alt="필수입력사항" src="./info/resources/icon_b.gif">
								</th>
								<td colspan="3">
									<input type="hidden" class="txtForm" id="M_Name" name="M_Name" size="12" maxlength="15" value="">
									<s:property value="resultClass.cmember_name"/>
								</td>
							</tr>
							<tr>
								<th class="contectInfo" rowspan="2" style="border-right:1px solid #e5e5e5;">
									<span class="blank"></span> 
									연락처 
									<img alt="필수입력사항" src="./info/resources/icon_b.gif">
								</th>
								<th scope="row">휴대폰</th>
								<td>
									<div class="mbrHelpWrap">
										<div class="mobile">
											<label for="M_Hand_Phone1" class="blind">
												휴대폰
											</label>
											<input type="text" name="member_phone" id="member_phone" maxlength="13" title="휴대폰번호" class="ipText ipTel ipNum devNoPh moveNext" onkeydown="handlerNum(this);" style="width:350px; ime-mode:disabled; float:left;"  value="<s:property value="resultClass.cmember_phone"/>">
											
											<div style="left:403px; top:0px;display:none;" class="mbrTplLayer mbrTplLayer_1 mbrLayerHelp" id="CautionResult1" name="CautionResult">
												<div class="desc">
													<p>휴대폰 번호를 입력해 주세요</p>
												</div>
												<span class="arrow"></span>
											</div>
										</div>
									</div>
								</td> 
							</tr>
							<tr>
								<th scope="row">
									<label for="Email_ID">
										이메일
									</label>
								</th>
								<td>
									<div class="mbrHelpWrap">
										<input type="hidden" name="M_Email" id="M_Email" value="">
										<input type="text" name="member_email" id="member_email" maxlength="50" style="width:350px;" class="ipText" value="<s:property value="resultClass.cmember_email"/>">
										
										<div style="left:455px; display:none;" class="mbrTplLayer mbrTplLayer_1 mbrLayerHelp" id="CautionResult2" name="CautionResult">
											<div class="desc">
												<p>이메일을 입력해 주세요</p>
											</div>
											<span class="arrow"></span>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th class="contectInfo" rowspan="5" style="border-right:1px solid #e5e5e5;">
									<span class="blank"></span>
										기업 정보
								</th>
								<th scope="row">
									기업구분
								</th>
								<td>
									<div class="mbrHelpWrap">
										<div class="mobile">
											<label for="M_Hand_Phone1" class="blind">휴대폰</label>
											<select>
												<option value="대기업">대기업</option>
												<option value="중견기업">중견기업</option>
												<option value="중소기업">중소기업</option>
											</select>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">
									기업명
								</th>
								<td>
									<div class="mbrHelpWrap">
										<div class="mobile">
											<label for="M_Hand_Phone1" class="blind">기업명</label>
											<input type="text" name="member_phone" id="member_phone" maxlength="13" title="휴대폰번호" class="ipText ipTel ipNum devNoPh moveNext" onkeydown="handlerNum(this);" style="width:350px; ime-mode:disabled; float:left;"  value="<s:property value='resultClass.cmember_cname'/>">
											<div style="left:403px; top:0px;display:none;" class="mbrTplLayer mbrTplLayer_1 mbrLayerHelp" id="CautionResult1" name="CautionResult">
												<div class="desc">
													<p>기업명을 입력해 주세요</p>
												</div>
												<span class="arrow"></span>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">
									주소
								</th>
								<td>
									<div class="mbrHelpWrap">
										<div class="mobile">
											<label for="M_Hand_Phone1" class="blind">주소</label>
											<input type="text" name="member_phone" id="member_phone" maxlength="13" title="휴대폰번호" class="ipText ipTel ipNum devNoPh moveNext" onkeydown="handlerNum(this);" style="width:350px; ime-mode:disabled; float:left;"  value="<s:property value='resultClass.cmember_addr'/>">
											<div style="left:403px; top:0px;display:none;" class="mbrTplLayer mbrTplLayer_1 mbrLayerHelp" id="CautionResult1" name="CautionResult">
												<div class="desc">
													<p>주소를 입력해 주세요</p>
												</div>
												<span class="arrow"></span>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">
									CEO
								</th>
								<td>
									<div class="mbrHelpWrap">
										<div class="mobile">
											<label for="M_Hand_Phone1" class="blind">CEO</label>
											<input type="text" name="member_phone" id="member_phone" maxlength="13" title="휴대폰번호" class="ipText ipTel ipNum devNoPh moveNext" onkeydown="handlerNum(this);" style="width:350px; ime-mode:disabled; float:left;"  value="<s:property value="resultClass.cmember_ceo"/> ">
											
											<div style="left:403px; top:0px;display:none;" class="mbrTplLayer mbrTplLayer_1 mbrLayerHelp" id="CautionResult1" name="CautionResult">
												<div class="desc">
													<p>기업 대표를 입력해 주세요</p>
												</div>
												<span class="arrow"></span>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">
									설립일
								</th>
								<td>
									<div class="mbrHelpWrap">
										<div class="mobile">
											<label for="M_Hand_Phone1" class="blind">설립일</label>
											<input type="text" name="member_phone" id="member_phone" maxlength="13" title="휴대폰번호" class="ipText ipTel ipNum devNoPh moveNext" onkeydown="handlerNum(this);" style="width:350px; ime-mode:disabled; float:left;"  value="<s:property value="resultClass.cmember_date"/>">
											 
											<div style="left:403px; top:0px;display:none;" class="mbrTplLayer mbrTplLayer_1 mbrLayerHelp" id="CautionResult1" name="CautionResult">
												<div class="desc">
													<p>설립일을 입력해 주세요</p>
												</div>
												<span class="arrow"></span>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td colspan=4>
							</tr>
							<tr>
								<th class="contectInfo" rowspan="5" style="border-right:1px solid #e5e5e5;">
									<span class="blank"></span>
										추가 정보
								</th>
								<th scope="row">
									사원 수
								</th>
								<td>
									<div class="mbrHelpWrap">
										<div class="mobile">
											<label for="M_Hand_Phone1" class="blind">휴대폰</label>
											<select>
												<option value="대기업">대기업</option>
												<option value="중견기업">중견기업</option>
												<option value="중소기업">중소기업</option>
											</select>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">
									자본
								</th>
								<td>
									<div class="mbrHelpWrap">
										<div class="mobile">
											<label for="M_Hand_Phone1" class="blind">기업명</label>
											<input type="text" name="member_phone" id="member_phone" maxlength="13" title="휴대폰번호" class="ipText ipTel ipNum devNoPh moveNext" onkeydown="handlerNum(this);" style="width:350px; ime-mode:disabled; float:left;"  value="<s:property value="dResultClass.detail_capital"/>">
											<div style="left:403px; top:0px;display:none;" class="mbrTplLayer mbrTplLayer_1 mbrLayerHelp" id="CautionResult1" name="CautionResult">
												<div class="desc">
													<p>자본을 입력해 주세요</p>
												</div>
												<span class="arrow"></span>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">
									매출
								</th>
								<td>
									<div class="mbrHelpWrap">
										<div class="mobile">
											<label for="M_Hand_Phone1" class="blind">매</label>
											<input type="text" name="member_phone" id="member_phone" maxlength="13" title="휴대폰번호" class="ipText ipTel ipNum devNoPh moveNext" onkeydown="handlerNum(this);" style="width:350px; ime-mode:disabled; float:left;"  value="<s:property value="dResultClass.detail_sales"/>">
											<div style="left:403px; top:0px;display:none;" class="mbrTplLayer mbrTplLayer_1 mbrLayerHelp" id="CautionResult1" name="CautionResult">
												<div class="desc">
													<p>매출을 입력해 주세요</p>
												</div>
												<span class="arrow"></span>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">
									평균 연봉
								</th>
								<td>
									<div class="mbrHelpWrap">
										<div class="mobile">
											<label for="M_Hand_Phone1" class="blind">평균연</label>
											<input type="text" name="membe출r_phone" id="member_phone" maxlength="13" title="휴대폰번호" class="ipText ipTel ipNum devNoPh moveNext" onkeydown="handlerNum(this);" style="width:350px; ime-mode:disabled; float:left;"  value="<s:property value="dResultClass.detail_pay"/>">
											<div style="left:403px; top:0px;display:none;" class="mbrTplLayer mbrTplLayer_1 mbrLayerHelp" id="CautionResult1" name="CautionResult">
												<div class="desc">
													<p>평균 연봉을 입력해 주세요</p>
												</div>
												<span class="arrow"></span>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">
									기업 홈페이지
								</th>
								<td>
									<div class="mbrHelpWrap">
										<div class="mobile">
											<label for="M_Hand_Phone1" class="blind">URL</label>
											<input type="text" name="member_phone" id="member_phone" maxlength="13" title="휴대폰번호" class="ipText ipTel ipNum devNoPh moveNext" onkeydown="handlerNum(this);" style="width:350px; ime-mode:disabled; float:left;"  value="<s:property value="dResultClass.detail_url"/>">
											 
											<div style="left:403px; top:0px;display:none;" class="mbrTplLayer mbrTplLayer_1 mbrLayerHelp" id="CautionResult1" name="CautionResult">
												<div class="desc">
													<p>기업 홈페이지 URL을 입력해 주세요</p>
												</div>
												<span class="arrow"></span>
											</div>
										</div>
									</div>
								</td>
							</tr>
							</tbody>
						</table>
					</div>
				</div>
				<hr>
				<p class="mbrBtnFunc">
					<span class="mbrBtn mbrBtnModify_1">
							<a onclick="send();" style="cursor:pointer;">
								<span>
									수정하기
								</span>
							</a>
						</span>
					<span class="mbrBtn mbrBtnCancel_1">
						<button type="button" onclick="location.href='http://www.jobkorea.co.kr/Text_User/GG_Home.asp'">
							<span>
								취소
							</span>
						</button>
					</span>
				</p>
			</fieldset>
		</form>
		</div>
		<hr>
		
		<script type="text/javascript">

		Social.config({ connect: true });
		Social.kakao(".btnKaConnect");
		Social.naver(".btnNvConnect", "/Naver/Callback?easyconn=true");
		Social.google(".btnGlConnect");
		Social.facebook(".btnFbConnect");

		Social.dissConnect(".btnKaDissConnect", ".connectKAText", "KA", function(obj) {
			if(typeof obj === 'object') {
				$(obj).addClass("btnKaConnect");
			}
		});
		Social.dissConnect(".btnNvDissConnect", ".connectNVText", "NV", function(obj) {
			if(typeof obj === 'object') {
				$(obj).addClass("btnNvConnect");
			}
		});
		Social.dissConnect(".btnGlDissConnect", ".connectGLText", "GL", function(obj) {
			if(typeof obj === 'object') {
				$(obj).addClass("btnGlConnect");
			}
		});
		Social.dissConnect(".btnFbDissConnect", ".connectFBText", "FB", function(obj) {
			if(typeof obj === 'object') {
				$(obj).addClass("btnFbConnect");
			}
		});

			// 전화번호 기타 선택시
			function PhoneEtc()
			{
				if(document.form.M_Home_Phone1.selectedIndex == 19)
				{
					$("#M_Home_Phone2").hide();
					$("#M_Home_Phone3").hide();
					$("#M_Home_Phone4").hide();
					$("#M_Home_Phone5").hide();

					$("#M_Home_Phone6").show();
					$("#M_Home_Phone_Etc").show();
				}
				else
				{
					$("#M_Home_Phone2").show();
					$("#M_Home_Phone3").show();
					$("#M_Home_Phone4").show();
					$("#M_Home_Phone5").show();

					$("#M_Home_Phone6").hide();
					$("#M_Home_Phone_Etc").hide();
				}
			}
			PhoneEtc();
			//-->


			;(function($){
				var $validity = $('.mbrMngInfo'),
			    $buttonHelp = $validity.find('.buttonHelp'),		
			    $popup = $validity.find('.popupValidity'),
				$buttonClose = $popup.find('.buttonClose');

				var $helpPosition = $buttonHelp.position();

			    $popup.css({
			        left : ($helpPosition.left - 12) + 'px',
			        top : ($helpPosition.top + 24) + 'px'
			    });

			    $buttonHelp.on('click', popupToggle);
				$buttonClose.on('click', popupToggle);
				
				function popupToggle() {
					$popup.toggleClass('hidden').attr('aria-hidden', function(i, attr) {
			            return attr == 'true' ? 'false' : 'true';
			        });
				}
			})(jQuery);
		</script>
	</div>
</div>
	<script type="text/javascript">
		var familysiteLayer = document.getElementById("devListLinkFamily");
		if (document.getElementById("devFamilysiteBtn") != null) {
			document.getElementById("devFamilysiteBtn").onclick = function() {
				familysiteLayer.style.display = "block";
			}
			document.getElementById("devListLinkFamilyClose").onclick = function() {
				familysiteLayer.style.display = "none";
				devFamilysiteBtn.focus();
			}
		}
	</script>
	<div style="position: absolute; left: -5000px; overflow: hidden;">
		<script>
/* usage */
(function($) {
    $(window).load(function() {
		  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

		ga('create', 'UA-75522609-1', 'jobkorea.co.kr', {'allowLinker': true});
		ga('require', 'linker');
		ga('linker:autoLink', ['jobbusan.co.kr'] );
		ga('send', 'pageview');
    });
})(jQuery);
</script>
		<script type="text/javascript">
<!--
function loadScriptFn(url, callback) {
    var scriptEle=document.createElement('script');
    scriptEle.type='text/javascript';
    var loaded=false;
    scriptEle.onreadystatechange=function() {
        // 서버에서 읽어올 경우 loaded, 캐쉬에서 가져올 경우 complete 이기에 둘 모두 처리
        if (this.readyState == 'loaded' || this.readyState == 'complete') {
            if (loaded) return;
            loaded = true;
            callback();
        }
    }
    scriptEle.onload=function() {
        callback();
    };
    scriptEle.src=url;
    document.getElementsByTagName('head')[0].appendChild(scriptEle);
}
	
//-->
</script>
		<!-- End Adobe Marketing Cloud Tag Management code -->
	</div>
	<!-- 메인 최근 방문 페이지 쿠키 저장-->
<script type="text/javascript" src="./info/resources/popup-manager.js"></script>
<script type="text/javascript">	
if (typeof window.dsHelper !== 'undefined') {}

var DS_UID_Value = "fandori89";
var DSID_Value = "3d0c520a71da1e0747f0e51b273edcbb";

if (typeof window._dslog !== 'undefined') {
	if (DS_UID_Value!="" && DSID_Value!="") {
		window._dslog.setDSID(DSID_Value);
	} else {
		window._dslog.setUID(DS_UID_Value);
    }
	window._dslog.dispatch();
} else {
	var dslog_tag = document.getElementById("dslog_tag");
	if (dslog_tag != null && dslog_tag != undefined) {
		dslog_tag.onload = dslog_tag.onreadystatechange = function () {
			dslog_tag.onload = dslog_tag.onreadystatechange = null;
			window._dslog.setUIDCookie(DS_UID_Value);
			window._dslog.dispatch();
		}
	}
}
</script>

<!-- Facebook Pixel Code -->
<script>
        /* usage */
        (function($) {
            $(window).load(function() {
				!function (f, b, e, v, n, t, s) {
					if (f.fbq) return; n = f.fbq = function () {
						n.callMethod ?
						n.callMethod.apply(n, arguments) : n.queue.push(arguments)
					}; if (!f._fbq) f._fbq = n;
					n.push = n; n.loaded = !0; n.version = '2.0'; n.queue = []; t = b.createElement(e); t.async = !0;
					t.src = v; s = b.getElementsByTagName(e)[0]; s.parentNode.insertBefore(t, s)
				}(window, document, 'script', 'https://connect.facebook.net/en_US/fbevents.js');
				fbq('init', '1166416616740867'); // Insert your pixel ID here.
				fbq('track', 'PageView');

            });
        })(jQuery);
</script>
<noscript>
    <img height="1" width="1" style="display:none"
         src="https://www.facebook.com/tr?id=1166416616740867&ev=PageView&noscript=1" />
</noscript>
<!-- DO NOT MODIFY -->
<!-- End Facebook Pixel Code -->

<script type="text/javascript">	
	//-- NSM Conversion Check Start
	var Nsm_Code = "0";
	if (Nsm_Code != "0")
	{
		var nsmX = new Image();
		nsmX.src = "https://ntracker.nsm-corp.com/c/rcv.php?code="+Nsm_Code;		
	}
	function NsmConversionClick(Nsm_Code)
	{
		var nsmX = new Image();
		//alert(Nsm_Code);
		nsmX.src = "https://ntracker.nsm-corp.com/c/rcv.php?code="+Nsm_Code;
	}
	//-- NSM Conversion Check End
</script>
</body>
</html>