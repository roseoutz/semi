<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<body class="resume resume-write" style="">
	<div class="resumePage">
		<div class="resumeHeader">
			<div class="container">
				<a href="#" class="logo"><img src="./images/404job.png" alt="404JOB"></a>
				<div class="links">
					<a href="#"
						class="link linkHome">개인회원 홈</a> <a
						href="#"
						class="link linkManage">이력서 관리</a>
				</div>
			</div>
		</div>
		<form action="#"
			method="post" id="frm1">
			<input type="text" id="HistoryBackCheck" value="0"
				style="display: none;">
			<div class="resumeWrapper">
				<div class="resumeContainer">
					<div class="resumeTitle">
						<input id="UserResume_M_Resume_Title" maxlength="100"
							name="UserResume.M_Resume_Title" 
							placeholder="기업에게 나에 대해 알려줍시다. 강점, 목표, 관심분야도 좋아요." type="text"
							readonly>
					</div>

					<div class="formWrap formWrapProfile">
						<h2 class="header">인적사항</h2>
						<div class="form formProfile">
							<div class="row">
								<div
									class="input is-label input-profile-name is-value is-readonly">
									<div class="label">이름</div>
									<div class="value">apply_mem_id</div>
								</div>
								<div class="input is-label input-profile-birth is-value is-readonly">
									<div class="label">생년월일</div>
									<div class="value">apply_birth</div>
									<div class="validation hidden" aria-hidden="true">생년월일을
										입력해주세요</div>
								</div>
								<div
									class="input is-label dropdown-profile-sex is-value is-readonly">
									<div class="label">성별</div>
									<div class="value">남자</div>
								</div>
								<div class="input is-label input-profile-hp is-value" style="width:235px;">
									<label for="UserInfo_M_Email">이메일</label> 
									<input type="email" name="apply_email" id="UserInfo_M_Email" data-format-type="email" value="">
									<div class="autocomplete hidden" aria-hidden="true">
										<div class="list">
											<ul></ul>
										</div>
									</div>
									<div class="validation hidden" aria-hidden="true"></div>
									<div class="backdrop">
										<div class="highlights"></div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="input is-label input-profile-hp is-value">
									<label for="UserInfo_M_Hand_Phone">휴대폰번호</label> 
									<input
										type="text" name="apply_phone"
										id="UserInfo_M_Hand_Phone" placeholder="010-1234-1234"
										value="010-4122-0347" maxlength="30">
									<div class="validation hidden" aria-hidden="true"></div>
								</div>
								<div class="input is-label input-profile-hp is-value"
									style="width: 250px">
									<label for="UserInfo_M_Hand_Phone">주소</label> 
									<input type="text" name="apply_add" id="sample4_roadAddress" value="" maxlength="30"> 
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

							<div class="picture dropped" style="">

								<div class="guide"></div>
									<input type="file" accept="image/*" id="imgInput" name="apply_file"> 
									<img id="image_section" />
								<script>
									function readURL(input) {

										if (input.files && input.files[0]) {
											var reader = new FileReader();

											reader.onload = function(e) {
												$('#image_section').attr('src',
														e.target.result);
											}

											reader
													.readAsDataURL(input.files[0]);
										}
									}

									$("#imgInput").change(function() {
										readURL(this);
									});
								</script>
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
										<select name="education_school_type">
											<option>고등학교</option>
											<option>전문대</option>
											<option>대학교</option>
											<option>대학원</option>
										</select>
										</div>
										<div class="input is-label input-profile-hp is-value" style="width:200px">
										<label for="UnivSchool_Entc_YM_c536">학교명(OO대학교)</label> 
										 <input type="text" name="education_school_name" id="UnivSchool_Schl_Name_c536" placeholder="OO대학교" maxlength="50">
										</div>

										<div class="input is-label input-profile-hp is-value" style="width:200px">
											<label for="UnivSchool_Entc_YM_c536">입학년월(2018.01)</label> 
											<input
												type="text" name="education_enter_date"
												id="UnivSchool_Entc_YM_c536" placeholder="입학년월">
										</div>
										<div class="input is-label input-profile-hp is-value" style="width:200px">
											<label for="UnivSchool_Grad_YM_c536">졸업년월(2018.01)</label> <input
												type="text" name="education_graduate_date"
												id="UnivSchool_Grad_YM_c536" placeholder="졸업년월">
										</div>
									</div>
									<div class="row">
										<span class="devMainMajorTemplateArea">

										<div class="input is-label input-profile-hp is-value" style="width:400px">
												<label for="univmajor_0_0">전공명</label> <input type="text"
													id="univmajor_0_0" name="education_major_name"
													maxlength="50">
											</div>

										</span>
										<div class="input is-label input-profile-hp is-value" style="width:100px">
											<label for="UnivSchool_Grade_c536">학점</label> <input
												type="text" name="education_grade"
												id="UnivSchool_Grade_c536" value="" maxlength="4"
												data-format-type="score">
										</div>

										<div class="input is-label input-profile-hp is-value" style="width:100px">
											<label for="UnivSchool_Grade_c536">학점</label> <input
												type="text" name="education_maxgrade"
												id="UnivSchool_Grade_c536" value="" maxlength="4"
												data-format-type="score">
										</div>
										<div class="input is-label input-profile-hp is-value" style="width:100px">
										<label for="UnivSchool_Entc_YM_c536">졸업상태</label> 
										<select name="education_graduate_satus">
											<option style="text-align: center">재학</option>
											<option>졸업</option>
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
											<label for="Career_C_Name_c6">회사명</label> <input type="text" name="career_company"
												id="Career_C_Name_c6" maxlength="50">
										</div>
										<div class="input is-label input-profile-hp is-value" style="width:200px">
											> <label for="Career_C_Part_c6">부서명</label>
											<div class="validation hidden" aria-hidden="true"></div>
											<input type="text" name="career_department"
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
										name="carrer_description" rows="10"></textarea>
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
								<input type="file" id="uploadBtn" class="uploadBtn" name="portfolio_file">
								&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
								<font size="3"><b>URL 첨부</b></font>
								<input type="text" name="portfolio_url" style="height:30px; width:300px;">
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
												<textarea name="introduction_content"
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