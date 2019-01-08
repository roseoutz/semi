<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "s" uri = "/struts-tags" %>
<!DOCTYPE html>
<head>
<title>404JOB | 이력서 보기</title>
<s:if test="#session.session_id==null">
<script>
alert("로그인이 필요한 서비스입니다.");
location.replace("main.action");
</script>
</s:if>
<link rel="stylesheet" type="text/css"
	href="https://i.jobkorea.kr/content/css/ver_2/text_user/resume/header.css" />
<link rel="stylesheet" type="text/css"
	href="https://i.jobkorea.kr/content/css/ver_2/text_user/resume/layout.css" />
<link rel="stylesheet" type="text/css" href="./css/css.css" />
<link rel="stylesheet"
	href="https://i.jobkorea.kr/content/css/ver_2/text_user/resume/write.css?201812181400" />
<style>
.autocomplete .list .hover {
	background-color: #f5f5f5;
}

.popupSearchDuty .list .hover {
	background-color: #f5f5f5;
}
</style>
<script src="/testwebb/resumewrite/script/jquery"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode;
						document.getElementById("sample4_roadAddress").value = roadAddr;
						document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("sample4_extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("sample4_extraAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();
	}
</script>
</head>
<body class="resume resume-write" style="">
	<div class="resumePage">
		<div class="resumeHeader">
			<div class="container">
				<a href="main.action" class="logo"><img src="resumewrite/images/404job.png" alt="404JOB"></a>
				<div class="links">
					<a href="../main.action"
						class="link linkHome">개인회원 홈</a> <a
						href="#"
						class="link linkManage">이력서 관리</a>
				</div>
			</div>
		</div>
			<input type="text" id="HistoryBackCheck" value="0"
				style="display: none;">
			<div class="resumeWrapper">
				<div class="resumeContainer">
					<div class="resumeTitle is-readonly">
						<input id="UserResume_M_Resume_Title" maxlength="100"
							name="resume_subject" readonly="readonly" value="<s:property value = "apply.resume_subject"/>"
							type="text"
							>
					</div>

					<div class="formWrap formWrapProfile">
						<h2 class="header">인적사항</h2>
						<div class="form formProfile">
							<div class="row">
								<div
									class="input is-label input-profile-name is-value is-readonly">
									<div class="label">이름</div>
									<div class="value"><s:property value = "%{#session['session_name']}"/></div>
									<input type = "hidden" name = "resume_name" value = "<s:property value = "%{#session['session_name']}"/>">
								</div>
								<div class="input is-label input-profile-hp is-value is-readonly">
									<label for="UserInfo_M_Hand_Phone">생년월일</label> 
									<div class = "value"><s:property value = "apply.resume_birth"/></div>
									<div class="validation hidden" aria-hidden="true"></div>
								</div>
								<div class="input is-label input-profile-hp is-value is-readonly" style="width:100px">
										<label for="UnivSchool_Entc_YM_c536">성별</label> 
										<div class = "value"><s:property value = "apply.resume_sex"/></div>
								</div>
								<div class="input is-label input-profile-hp is-value is-readonly" style="width:235px;">
									<label for="UserInfo_M_Email">이메일</label> 
									<div class = "value"><s:property value = "%{#session['session_email']}"/></div>
									<input type = "hidden" name = "resume_name" value = "<s:property value = "%{#session['session_email']}"/>">
									
									
								</div>
							</div>
							<div class="row">
								<div class="input is-label input-profile-hp is-value is-readonly">
									<label for="UserInfo_M_Hand_Phone">휴대폰번호</label> 
									<div class = "value"><s:property value = "%{#session['session_phone']}"/></div>
									<input type = "hidden" name = "resume_phone" value = "<s:property value = "%{#session['session_phone']}"/>">
									<div class="validation hidden" aria-hidden="true"></div>
								</div>
								<div class="input is-label input-profile-hp is-value is-readonly"
									style="width: 250px">
									<label for="UserInfo_M_Hand_Phone">주소</label> 
									<div class="value"><s:property value = "apply.resume_addr"/></div>
								</div>
								
							</div>

							
						</div>
					</div>
					<div class="formWrap formWrapEducation" id="formEducation" style="">
						<h2 class="header">학력</h2>
						<div class="form formEducation">
							<div id="school_containers">
								<div class="container container1" data-cid="c536">
									<div class="row">
										<div class="input is-label input-profile-hp is-value is-readonly" style="width:100px">
										<label for="UnivSchool_Entc_YM_c536">구분(대학)</label> 
											<div class = "value"><s:property value = "apply.edu_school_type"/></div>
										</div>
										<div class="input is-label input-profile-hp is-value is-readonly" style="width:200px">
										<label for="UnivSchool_Entc_YM_c536">학교명(OO대학교)</label> 
											<div class = "value"><s:property value = "apply.edu_school"/></div>
										</div>

										<div class="input is-label input-profile-hp is-value is-readonly" style="width:200px">
											<label for="UnivSchool_Entc_YM_c536">입학년월(2018.01)</label> 
											<div class="value"><s:property value = "apply.edu_enter_date"/></div>
										</div>
										<div class="input is-label input-profile-hp is-value is-readonly" style="width:200px">
											<label for="UnivSchool_Grad_YM_c536">졸업년월(2018.01)</label>
												
											<div class="value"><s:property value = "apply.edu_graduate_date"/></div>
										</div>
									</div>
									<div class="row">
										<span class="devMainMajorTemplateArea">

										<div class="input is-label input-profile-hp is-value is-readonly" style="width:400px">
												<label for="univmajor_0_0">전공명</label> 
												<div class="value"><s:property value = "apply.edu_major"/></div>
											</div>

										</span>
										<div class="input is-label input-profile-hp is-value is-readonly" style="width:100px">
											<label for="UnivSchool_Grade_c536">학점(0.0/0.0)</label> 
											<div class="value"><s:property value = "apply.edu_grade"/></div>
										</div>

										
										<div class="input is-label input-profile-hp is-value is-readonly" style="width:100px">
										<label for="UnivSchool_Entc_YM_c536">졸업상태</label> 
										<div class = "value"><s:property value = "apply.edu_graduate_status"/></div>
										</div>
									</div>
									<span class="devOtherUnivMajorTemplateArea"></span>

									<div class="row devGradPaperRow" style="display: none;"></div>
								</div>
							</div>
						</div>
					</div>

					<div class="formWrap formWrapCareer" id="formCareer" style="">
						<div class="header">
							<h2 class="header">경력</h2>
						</div>
						<div class="form formCareer">
							<div id="career_containers">
								<div class="container container1">
									<div class="row">
										<div class="input is-label input-profile-hp is-value is-readonly" style="width:200px">
											<label for="Career_C_Name_c6">회사명</label>
											<div class = "value"><s:property value = "apply.career_cname"/></div>
										</div>
										<div class="input is-label input-profile-hp is-value is-readonly" style="width:200px">
											> <label for="Career_C_Part_c6">부서명</label>
											<div class="validation hidden" aria-hidden="true"></div>
											<div class = "value"><s:property value = "apply.career_dept"/></div>
										</div>
										<div class="input is-label input-profile-hp is-value is-readonly" style="width:200px">
											<label for="Career_CSYM_c6">입사년월</label> 
											<div class = "value"><s:property value = "apply.career_enter_date"/></div>	
										</div>
										<div class="input is-label input-profile-hp is-value is-readonly" style="width:200px">
											<label for="Career_CEYM_c6">퇴사년월</label> 
											<div class = "value"><s:property value = "apply.career_leave_date"/></div>
										</div>
										<div class="input is-label input-profile-hp is-value is-readonly" style="width:200px">
											<label for="Career_CEYM_c6">직급/직책</label> 
											<div class = "value"><s:property value = "apply.career_position"/></div>
										</div>
										<div class="input is-label input-profile-hp is-value is-readonly" style="width:200px">
											<label for="Career_CEYM_c6">직무</label>
											<div class = "value"><s:property value = "apply.career_job"/></div>
										</div>
										<div class="input is-label input-profile-hp is-value is-readonly" style="width:200px">
											<label for="Career_CEYM_c6">연봉</label> 
											<div class = "value"><s:property value = "apply.career_pay"/></div>
										</div>
										<div class="input is-label input-profile-hp is-value is-readonly" style="width:200px">
											<label for="Career_CEYM_c6">담당업무</label> 
											<div class = "value"><s:property value = "apply.career_explain"/></div>
										</div>
									</div>
								</div>
							</div>

							<div class="careerDescription" id="careerDescriptionWrite"
								style="">
								<div class="textarea is-label is-readonly">
									<label for="UserResume_M_Career_Text"
										class="lblCareerDescription">경력기술서 </label>
									<textarea cols="30" id="UserResume_M_Career_Text" readonly="readonly"
										name="career_content" rows="10"><s:property value = "apply.career_content"/></textarea>
								</div>
								<div class="buttons alignRight"></div>
							</div>
						</div>
					</div>

					<div class="formWrap formWrapCertificate" id="formLicense" style="">
						<h2 class="header">수상 및 자격증</h2>
						<div class="form formCertificate">
							<div id="license_containers">
								<div class="container container1" data-cid="c12">

									<div class="row">
										<div class="input is-label input-profile-hp is-value is-readonly" style="width:400px">
											<label for="License_Search_c12">수상 / 자격증명</label> 
											<div class = "value"><s:property value = "apply.award_name"/></div>
										</div>
										<div class="input is-label input-profile-hp is-value is-readonly" style="width:200px">
											<label for="License_Lc_Pub_c12">발행처</label> 
											<div class = "value"><s:property value = "apply.award_publisher"/></div>
											<div class="validation hidden" aria-hidden="true"></div>
										</div>
										<div class="input is-label input-profile-hp is-value is-readonly" style="width:100px">
											<label for="License_Lc_YYMM_c12">취득월</label> 
											<div class = "value"><s:property value = "apply.award_date"/></div>
											<div class="validation hidden" aria-hidden="true"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>


					<div class="formWrap formWrapPortfolio" id="formPortfolio" style="">
						<h2 class="header">포트폴리오</h2>
						<div class="form formPortfolio">
							<div class="fileBox">
								<font size="3"><b>파일 첨부</b></font>
								<input type="text" class="fileName" readonly="readonly">
								<label for="uploadBtn" class="btn_file">찾아보기</label>
								<input type="file" id="uploadBtn" class="uploadBtn" name="upload">
								&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
								<font size="3"><b>URL 첨부</b></font>
								<input type="text" value = "<s:property value = "apply.port_url"/>" readonly = "readonly" name="port_url" style="height:30px; width:300px;">
							</div>
							<script>
							var uploadFile = $('.fileBox .uploadBtn');
							uploadFile.on('change', function(){
								if(window.FileReader){
									var filename = $(this)[0].files[0].name;
								} else {
									var filename = $(this).val().split('/').pop().split('\\').pop();
								}
								$(this).siblings('.fileName').val(filename);
							});
							</script>
						</div>
					</div>
						<div class="formWrap formWrapIntroduction" id="formIntroduction"
							style="">
							<div class="header">
								<h2 class="header">자기소개서</h2>
								<!-- <div class="checkSpellingResult">맞춤법에 어긋난 단어가 <strong>2개</strong> 있습니다.</div> -->
							</div>
							<div class="form formIntroduction">
								<div id="introduceContainers">
									<div class="row">
										<div class="container">
											<label for="" class="skip">내용</label>
											<div class="textarea textarea-introduction is-value">
												<div class="backdrop">
													<div class="highlights"></div>
												</div>
												<div class="clickable"></div>
												<textarea name="intro_content" readonly = "readonly"
													id="ResumeProfile_Contents_c535" cols="30" rows="10"
													placeholder="해당내용을 입력하세요." class="spellcheck"><s:property value = "apply.intro_content"/></textarea>
												<div class="validation validation-content hidden">자기소개서
													내용을 입력해주세요</div>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
						<div class="fixedMenu media-size-small" id="FixedMenuView">
							<div class="container">
								<h2 class="header">이력서 항목</h2>
								<ul class="list fixedMenuButtons">
									<li><a href="#formEducation" class="button buttonEducation selected"> <span>학력</span></a></li>
									<li><a href="#formCareer" class="button buttonCareer selected"> <span>경력</span></a></li>
									<li><a href="#formLicense"class="button buttonCertificate selected"> <span>자격증</span></a></li>
									<li><a href="#formAward"class="button buttonAward selected"> <span>수상</span></a></li>
									<li><a href="#formPortfolio"class="button buttonPortfolio selected"> <span>포트폴리오</span></a></li>
									<li><a href="#formIntoduction"class="button buttonIntroduction selected"> <span>자기소개서</span></a></li>
								</ul>
							</div>

						</div>
					</div>
				</div>
	</div>
	<script>
		window.ResumeForm = {};

		//fixedMenu
		$(function() {
			var $menu = $('.fixedMenu');
			var $window = $(window);
			var $offsetY = $menu.offset().top;
			var $scrolled = 0;

			$window.on('scroll', function() {
				$scrolled = $(this).scrollTop();
				if ($scrolled >= $offsetY) {
					$menu.addClass('fixed');
				} else {
					$menu.removeClass('fixed');
				}
			});
		});
		;
	</script>