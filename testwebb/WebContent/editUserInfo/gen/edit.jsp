<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>

<body id="secMbr" class="mbrSubMng mbrSubMngGG mbrSubMngInfo">

<div id="skipNavigation">
	<p><a href="#container">메뉴 건너뛰기</a></p>
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


<hr>

<div class="devGuideBox ly_popup_info" style="top: 22px; left: 912px; display: none;"></div>
<div id="wrap">
	<!--// Contents Area -->
	<div id="container">
		<div id="content">
			<h1 class="skip">회원정보 수정</h1>
			<form name="form" method="post" action="/Text_User/User_Info_Mng_Ok.asp">
				<input type="hidden" name="M_Hand_Phone" id="M_Hand_Phone" value="">
				<input type="hidden" name="M_Home_Phone" id="M_Home_Phone" value="">
				<input type="hidden" name="R_No" id="R_No" value="">
				<input type="hidden" name="Alimy_Chk" id="Alimy_Chk" value="0">
				<input type="hidden" name="GoodJob_Mailing_Stat" id="GoodJob_Mailing_Stat" value="">
				<input type="hidden" name="OEM_No" id="OEM_No" value="">
				<input type="hidden" name="re_url" id="re_url" value="">
				<fieldset>
				<legend>회원정보 수정 입력폼</legend>
				<div class="mbrSec mbrMngInfo">
					<h2 class="mbrHeading2"><img src="/img/member/title/mbr_h_mng_gg.gif" alt="회원정보 수정"></h2>
					<div class="mbrTplDesc">
						<p>회원님의 정보를 수정·확인하실 수 있습니다.</p>
					</div>

					<div class="mbrTplData2">
						<table summary="이 표는 회원정보 수정 입력폼으로 아이디, 비밀번호, 비밀번호확인, 이름, 생년월일/성별, 연락처, 이메일을 나타내고 있습니다.">
							<caption><span class="skip">회원정보 수정 입력폼</span></caption>
							<colgroup>
								<col width="110px">
								<col width="87px">
								<col width="*">
							</colgroup>
							<tbody><tr>
								<th scope="row" colspan="2"><label for="lb_id"><span class="blank"></span> 아이디</label></th>
								<td>
									<div class="social_row"><strong>session_id</strong>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row" colspan="2"><span class="blank"></span> 이름 <img alt="필수입력사항" src="../common/image/icon_b.gif"></th>
								<td colspan="3"><input type="hidden" class="txtForm" id="M_Name" name="M_Name" size="12" maxlength="15" value="전용식">전용식
								</td>
							</tr>
							<tr>
								<th scope="row" colspan="2"><span class="blank"></span> 생년월일/성별 <img alt="필수입력사항" src="./common/image/icon_b.gif"></th>
								<td>1992년 07월 30일생  (남)</td>
								<input type="hidden" name="M_Born" id="M_Born" value="1992-07-30">
								<input type="hidden" name="M_Gender" id="M_Gender" value="0">
							</tr>
						
							<tr>
								<th class="contectInfo" rowspan="2" style="border-right:1px solid #e5e5e5;">
									<span class="blank"></span> 연락처 <img alt="필수입력사항" src="./common/image/icon_b.gif">
									</th>
								<th scope="row">휴대폰</th>
								<td>
									<div class="mbrHelpWrap">
										<div class="mobile">
											<label for="M_Hand_Phone1" class="blind">휴대폰</label>
											<select title="휴대폰 국번" name="M_Hand_Phone1" id="M_Hand_Phone1" style="width:110px; float:left;" class="ipSelect">
												<option value="010" selected="">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
												<option value="019">019</option>
											</select>
											<span class="delimiter" style="padding: 6px 3px; float:left;">-</span>
											<input type="text" name="M_Hand_Phone2" id="M_Hand_Phone2" maxlength="4" title="휴대폰 앞자리" class="ipText ipTel ipNum devNoPh moveNext" onkeydown="handlerNum(this);" value="9286" style="ime-mode:disabled; float:left;"> <span class="delimiter" style="padding: 6px 3px; float:left;">-</span> <input type="text" name="M_Hand_Phone3" id="M_Hand_Phone3" maxlength="4" title="휴대폰 뒷자리" class="ipText ipTel ipNum devNoPh moveNext" onkeydown="handlerNum(this);" value="8892" style="ime-mode:disabled; float:left;" nextid="M_Home_Phone1">
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
								<th scope="row"><label for="Email_ID">이메일</label></th>
								<td>
									<div class="mbrHelpWrap">
										<input type="hidden" name="M_Email" id="M_Email" value="">
										<input type="text" name="Email_ID" id="Email_ID" maxlength="30" style="width:150px;" class="ipText" value="iyh99185">
										<span class="delimiter">@</span>
										<input type="text" name="Email_Addr_Text" id="Email_Addr_Text" title="이메일 서비스 입력" maxlength="25" class="ipText" style="width:150px" onkeyup="Email_Addr_Text_Move(); Gmail_Check();" value="naver.com">
										
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
								<th scope="row" colspan="2"><span class="blank"></span> 개인 홈페이지</th>
								<td colspan="3">
									<div class="mbrHelpWrap">
										<input type="text" id="M_Homepage" name="M_Homepage" maxlength="70" style="width:300px;" class="ipText" value="">
										<span class="assist">(블로그, SNS, 미니홈피도 등록 가능합니다.)</span>
										<div style="left:515px;display:none;" class="mbrTplLayer mbrTplLayer_1 mbrLayerHelp" id="CautionResult3" name="CautionResult">
											<div class="desc">
												<p>홈페이지 주소를 입력해 주세요.</p>
											</div>
											<span class="arrow"></span>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row" colspan="2"><span class="blank"></span> <label for="postcheck">우편번호</label></th>
								<td colspan="3">
									<div class="mbrHelpWrap" style="z-index:1000;">
										<input type="hidden" id="M_ZipCode" name="M_ZipCode" value="17158">
										<input type="hidden" id="M_AddAddr" name="M_AddAddr" value="경기 용인시 처인구 양지면 양지리">
                                        <input type="hidden" id="M_AddrType" name="M_AddrType" value="R">
                                        <input type="text" id="postcheck" name="postcheck" style="width:300px;" class="ipText" maxlength="8" value="17158" readonly="true" onfocus="$(this).unbind('focus');" onclick="$('#btnSearchAddr').click();">
										<span>

											<button id="btnSearchAddr" type="button" onclick="post_check({'zipcode' : $('#M_ZipCode,#postcheck'),'addrtext' : $('#M_Addr_Text'),'addaddr' : $('#M_AddAddr'),'addrtype' : $('#M_AddrType'),'addrtext1' : $('#M_Addr_Text1')});"><img src="/img/common/btn_jk_add_search.gif" alt="주소 검색"></button>
										</span>
										<div style="left:389px;display:none;" class="mbrTplLayer mbrTplLayer_1 mbrLayerHelp" id="CautionResult4" name="CautionResult">
											<div class="desc">
												<p>주소 검색을 위해 버튼을 클릭해 주세요.</p>
											</div>
											<span class="arrow"></span>
										</div>
										<div id="ZipSearch_Div" style="position:absolute; left:0; top:31px; z-index:99; display:none">
											<iframe id="ZipSearch_Ifrm" name="ZipSearch_Ifrm" width="440" height="182" marginwidth="0" marginheight="0" frameborder="no" scrolling="no" title="우편번호 검색" background="white"></iframe>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row" colspan="2"><span class="blank"></span> <label for="M_Addr_Text">주소</label></th>
								<td colspan="3">
									<div class="mbrHelpWrap">
										<input type="text" id="M_Addr_Text" name="M_Addr_Text" style="width:300px;" class="ipText" maxlength="100" readonly="" value="경기 용인시 처인구 양지면 양지로133번길 9-6 (양지리, 별빛마을)" onfocus="$(this).unbind('focus');" onclick="$('#btnSearchAddr').click();"> <input type="text" id="M_Addr_Text1" name="M_Addr_Text1" style="width:300px;" class="ipText" maxlength="35" onfocus="$(this).unbind('focus');if (this.value=='상세주소를 입력해 주세요.') this.value='';" value="나동 202호">
										<div style="left:623px;display:none;" class="mbrTplLayer mbrTplLayer_1 mbrLayerHelp" id="CautionResult5" name="CautionResult">
											<div class="desc">
												<p>주소를 입력해 주세요.</p>
											</div>
											<span class="arrow"></span>
										</div>
									</div>
								</td>
							</tr>
							
						</tbody></table>
					</div>
					
					
					
					
				</div>
				<hr>
				<p class="mbrBtnFunc">
					<span class="mbrBtn mbrBtnModify_1"><a onclick="send();" style="cursor:pointer;"><span>수정하기</span></a></span>
					<span class="mbrBtn mbrBtnCancel_1"><button type="button" onclick="location.href='http://www.jobkorea.co.kr/Text_User/GG_Home.asp'"><span>취소</span></button></span>
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
			if (document.getElementById("devFamilysiteBtn") != null)
			{
				document.getElementById("devFamilysiteBtn").onclick = function()
				{
					familysiteLayer.style.display = "block";
				}
				document.getElementById("devListLinkFamilyClose").onclick = function()
				{
					familysiteLayer.style.display = "none";
					devFamilysiteBtn.focus();
				}
			}
		</script>
	<div style="position:absolute; left:-5000px; overflow:hidden;">
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
<script type="text/javascript" src="/include/js/popup-manager.js"></script>
<script type="text/javascript">	
if (typeof window.dsHelper !== 'undefined') {

}

var DS_UID_Value = "fandori89";
var DSID_Value = "1da5ef329eb5f5a1e6c07c59204e9792";

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