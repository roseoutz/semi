<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--// Footer Area -->
		<div id="subFooter">
	<p id="copyright">
		<img src="https://i.jobkorea.kr/content/images/common/footer/copyright_1.png" alt="Copyright © JOBKOREA Corp. All Rights Reserved." usemap="#copyright">
	</p>
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
<script type="text/javascript" src="./resources/popup-manager.js"></script>
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
    <img height="1" width="1" style="display:none" src="https://www.facebook.com/tr?id=1166416616740867&ev=PageView&noscript=1" />
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


</body></html>