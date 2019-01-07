<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "s" uri = "/struts-tags" %>
<!DOCTYPE html>
<head>
<title>404JOB | 이력서 등록</title>
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
				<a href="../main.action" class="logo"><img src="./images/404job.png" alt="404JOB"></a>
				<div class="links">
					<a href="../main.action"
						class="link linkHome">개인회원 홈</a> <a
						href="#"
						class="link linkManage">이력서 관리</a>
				</div>
			</div>
		</div>
		<form action="resumeWrite.action" method="post" id="frm1" enctype = "multipart/form-data">
			<input type="text" id="HistoryBackCheck" value="0"
				style="display: none;">
			<div class="resumeWrapper">
				<div class="resumeContainer">
					<div class="resumeTitle">
						<input id="UserResume_M_Resume_Title" maxlength="100"
							name="resume_subject" 
							placeholder="기업에게 나에 대해 알려줍시다. 강점, 목표, 관심분야도 좋아요." type="text"
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
								<div class="input is-label input-profile-hp is-value">
									<label for="UserInfo_M_Hand_Phone">생년월일</label> 
									<input
										type="text" name="resume_birth"
										id="UserInfo_M_Hand_Phone" placeholder="010-0000-1234"
										maxlength="30">
									<div class="validation hidden" aria-hidden="true"></div>
								</div>
								<div class="input is-label input-profile-hp is-value" style="width:100px">
										<label for="UnivSchool_Entc_YM_c536">성별</label> 
										<select name="resume_sex">
											<option value = "남자">남자</option>
											<option value = "여자">여자</option>
										</select>
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
								<div class="input is-label input-profile-hp is-value"
									style="width: 250px">
									<label for="UserInfo_M_Hand_Phone">주소</label> 
									<input type="text" name="resume_addr" id="sample4_roadAddress" value="" maxlength="30"> 
									<input type="hidden" id="sample4_postcode" placeholder="우편번호">
									<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소"> 
									<input type="hidden" id="sample4_detailAddress" placeholder="상세주소">
									<input type="hidden" id="sample4_extraAddress" placeholder="참고항목">
									<span id="guide" style="color: #999; display: none"></span> 
								</div>
								<div class="input input-education-startdate is-label"
									style="width: 100px">
									<input type="button" onclick="sample4_execDaumPostcode()"
										value="우편번호">
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
										<div class="input is-label input-profile-hp is-value" style="width:100px">
										<label for="UnivSchool_Entc_YM_c536">구분(대학)</label> 
										<select name="edu_school_type">
											<option value = "고등학교">고등학교</option>
											<option value = "전문대">전문대</option>
											<option value = "대학교">대학교</option>
											<option value = "대학원">대학원</option>
										</select>
										</div>
										<div class="input is-label input-profile-hp is-value" style="width:200px">
										<label for="UnivSchool_Entc_YM_c536">학교명(OO대학교)</label> 
										 <input type="text" name="edu_school" id="UnivSchool_Schl_Name_c536" placeholder="OO대학교" maxlength="50">
										</div>

										<div class="input is-label input-profile-hp is-value" style="width:200px">
											<label for="UnivSchool_Entc_YM_c536">입학년월(2018.01)</label> 
											<input
												type="text" name="edu_enter_date"
												id="UnivSchool_Entc_YM_c536" placeholder="입학년월">
										</div>
										<div class="input is-label input-profile-hp is-value" style="width:200px">
											<label for="UnivSchool_Grad_YM_c536">졸업년월(2018.01)</label> <input
												type="text" name="edu_graduate_date"
												id="UnivSchool_Grad_YM_c536" placeholder="졸업년월">
										</div>
									</div>
									<div class="row">
										<span class="devMainMajorTemplateArea">

										<div class="input is-label input-profile-hp is-value" style="width:400px">
												<label for="univmajor_0_0">전공명</label> <input type="text"
													id="univmajor_0_0" name="edu_major"
													maxlength="50">
											</div>

										</span>
										<div class="input is-label input-profile-hp is-value" style="width:100px">
											<label for="UnivSchool_Grade_c536">학점(0.0/0.0)</label> <input
												type="text" name="edu_grade"
												id="UnivSchool_Grade_c536" value="" maxlength="7"
												data-format-type="score">
										</div>

										
										<div class="input is-label input-profile-hp is-value" style="width:100px">
										<label for="UnivSchool_Entc_YM_c536">졸업상태</label> 
										<select name="edu_graduate_status">
											<option style="text-align: center" value = "재학">재학</option>
											<option value = "졸업">졸업</option>
										</select>
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
										<div class="input is-label input-profile-hp is-value" style="width:200px">
											<label for="Career_C_Name_c6">회사명</label> <input type="text" name="career_cname"
												id="Career_C_Name_c6" maxlength="50">
										</div>
										<div class="input is-label input-profile-hp is-value" style="width:200px">
											> <label for="Career_C_Part_c6">부서명</label>
											<div class="validation hidden" aria-hidden="true"></div>
											<input type="text" name="career_dept"
												id="Career_C_Part_c6" value="" maxlength="25">
										</div>
										<div class="input is-label input-profile-hp is-value" style="width:200px">
											<label for="Career_CSYM_c6">입사년월</label> <input type="text"
												name="career_enter_date" id="Career_CSYM_c6" value=""
												data-format-type="month" placeholder="2016.03">
										</div>
										<div class="input is-label input-profile-hp is-value" style="width:200px">
											<label for="Career_CEYM_c6">퇴사년월</label> <input type="text"
												name="career_leave_date" id="Career_CEYM_c6" value=""
												data-format-type="month" class="devCareerCEYM">
										</div>
										<div class="input is-label input-profile-hp is-value" style="width:200px">
											<label for="Career_CEYM_c6">직급/직책</label> <input type="text"
												name="career_position" id="Career_CEYM_c6" value=""
												data-format-type="month" class="devCareerCEYM">
										</div>
										<div class="input is-label input-profile-hp is-value" style="width:200px">
											<label for="Career_CEYM_c6">직무</label> <input type="text"
												name="career_job" id="Career_CEYM_c6" value=""
												data-format-type="month" class="devCareerCEYM">
										</div>
										<div class="input is-label input-profile-hp is-value" style="width:200px">
											<label for="Career_CEYM_c6">연봉</label> <input type="text"
												name="career_pay" id="Career_CEYM_c6" value=""
												data-format-type="month" class="devCareerCEYM">
										</div>
										<div class="input is-label input-profile-hp is-value" style="width:200px">
											<label for="Career_CEYM_c6">담당업무</label> <input type="text"
												name="career_explain" id="Career_CEYM_c6" value=""
												data-format-type="month" class="devCareerCEYM">
										</div>
									</div>
								</div>
							</div>

							<div class="careerDescription" id="careerDescriptionWrite"
								style="">
								<div class="textarea is-label">
									<label for="UserResume_M_Career_Text"
										class="lblCareerDescription">경력기술서 </label>
									<textarea cols="30" id="UserResume_M_Career_Text"
										name="carrer_content" rows="10"></textarea>
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
										<div class="input is-label input-profile-hp is-value" style="width:400px">
											<label for="License_Search_c12">수상 / 자격증명</label> <input
												type="text" id="License_Search_c12" maxlength="50" name="award_name">
										</div>
										<div class="input is-label input-profile-hp is-value" style="width:200px">
											<label for="License_Lc_Pub_c12">발행처</label> <input
												type="text" name="award_publisher"
												id="License_Lc_Pub_c12" value=""
												maxlength="50">
											<div class="validation hidden" aria-hidden="true"></div>
										</div>
										<div class="input is-label input-profile-hp is-value" style="width:100px">
											<label for="License_Lc_YYMM_c12">취득월</label> <input
												type="text" name="award_date"
												id="License_Lc_YYMM_c12" value="" data-format-type="month"
												>
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
								<input type="text" name="port_url" style="height:30px; width:300px;">
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
												<textarea name="intro_content"
													id="ResumeProfile_Contents_c535" cols="30" rows="10"
													placeholder="해당내용을 입력하세요." class="spellcheck"></textarea>
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
							<button type="submit" class="button buttonComplete">
								<span>작성완료</span>
							</button>
							<div class="notifacation">저장 되었습니다.</div>
						</div>
					</div>
				</div>
		</form>
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