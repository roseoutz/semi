<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>


<body class="jkJoin">
    <div id="wrap">

<div id="header">
    <h1><a href="http://www.jobkorea.co.kr"><img src="https://i.jobkorea.kr/content/images/member/gnb/h_logo_jobkorea.png" alt="JOBKOREA x albamon"></a></h1>

    <h3 class="skip">글로벌 메뉴</h3>
    <ul class="gnb f_clear">
        <li><a href="main.action">홈</a></li>
        <li><a href="/help/">1:1문의</a></li>
    </ul>

    <h3 class="skip">회원 형태별 가입</h3>
    <ul class="snb f_clear">
        <li class="person on"><a href="joingen.action">개인회원</a></li>
        <li class="corp "><a href="joincorp.action">기업회원</a></li>
    </ul>
</div>



<input type="hidden" id="hdnEduId" value="" />
<div id="container" class="mbrRegist">
    <h3 class="skip">개인회원 가입 정보</h3>
    <fieldset>
        <legend>개인회원 가입</legend>
<form action="inputGen.action" id="frm" method="post" name="genForm" onsubmit="return checkForm2();">            <!-- 약관 동의 -->
<input data-val="true" data-val-required="&lt;p class=&quot;failure&quot;>필수 정보입니다.&lt;/p>" id="M_Id" name="M_Id" type="hidden" value="" /><input id="OEM_No" name="OEM_No" type="hidden" value="1" /><input id="DI_Code" name="DI_Code" type="hidden" value="" /><input id="getCertifynum" name="getCertifynum" type="hidden" value="" /><input id="CertifyReCall" name="CertifyReCall" type="hidden" value="" /><input id="ReSubmit" name="ReSubmit" type="hidden" value="" /><input id="CertifyCode" name="CertifyCode" type="hidden" value="" /><input id="Aptitute_Stat" name="Aptitute_Stat" type="hidden" value="" />            <!-- 소셜 로그인 -->

            <div class="row_group mbr_info">
                <h4>회원가입하고 다양한 혜택을 누리세요!</h4>
                <p class="subTx"><strong>*</strong> 필수 입력 정보입니다.</p>
                <div class="row mbr_name">
                    <div class="col_1">
                      <label for="M_Name" class="mbr_name">이름(실명)<i class="icon required" aria-hidden="hidden">*</i></label>
                    </div>

                    <div class="col_2">
                        <input type="text" id="M_Name" name="member_name" class="mbr_name devReadOnly dev-name" maxlength="12">
                        <div class="notice_msg" id="notice_msg_name"></div>
                    </div>
                </div>
                <div class="row mbr_id">
                    <div class="col_1">
                        <label for="idcheck">아이디(404Job, 404몬 통합 ID)<i class="icon required" aria-hidden="hidde">*</i></label>
                    </div>

                    <div class="col_2">
                        <input type="text" id="idcheck" name="member_id" maxlength="16" class="dev-id" value="" style="ime-mode:disabled;">
                        <div class="notice_msg" id="notice_msg_id"></div>
                    </div>
                </div>
                <div class="row mbr_passwd">
                    <div class="col_1">
                        <label for="M_Pwd">비밀번호(6~16자의 영문, 숫자, 특수기호)<i class="icon required" aria-hidden="hidde">*</i></label>
                    </div>

                    <div class="col_2">
                        <input type="password" id="M_Pwd" name="member_pass" class="dev-password" maxlength="16" style="ime-mode:disabled;">
                        <button type="button" class="btnHelp" title="안전한 비밀번호 작성법">?</button>
                        <div class="lyHelp">
                            <dl>
                                <dt>안전한 비밀번호 작성법</dt>
                                <dd>
                                    <ol>
                                        <li>6~16자의 영문 대소문, 숫자, 특수기호만 사용가능 (공백입력 불가)</li>
                                        <li>3자 이상 연속 영문/숫자 조합은 사용불가 (AAA. 111)</li>
                                        <li>아이디, 반복되는 영문/숫자 조합은 사용불가 (1234, ABCD)</li>
                                        <li>키보드의 연속 패턴은 사용하지 마세요. (ASDF) </li>
                                        <li>비밀번호는 주기적으로 변경하여 안전하게 관리하기</li>
                                    </ol>
                                </dd>
                            </dl>
                        </div>
                        <div class="notice_msg" id="notice_msg_pwd"></div>
                    </div>
                    <div class="col_3">
                       <button type="button" class="mbrBtnAuth dev-password-dp"><span>표시</span></button>
                   </div>
                </div>
                <div class="row mbr_email">
                    <!-- <p class="emailTxt">개인 맞춤 채용정보/정기 뉴스레터/이벤트 메일이 발송됩니다.</p>  -->
                    <div class="col_1">
                        <label for="M_Email" class="mbr_email_id">이메일<i class="icon required" aria-hidden="hidde">*</i></label>
                    </div>

                    <div class="col_2">
                        <input type="text" id="M_Email" name="member_email" class="mbr_email_id dev-mail" size="8" maxlength="30" >
                        <div class="notice_msg" id="notice_msg_mail"></div>
                        <input type="hidden" id="Email_ID" name="Email_ID" />
                        <input type="hidden" id="Email_Addr" name="Email_Addr" />
                    </div>

                </div>
                <div class="row mbr_phone">
                    <div class="col_1">
                        <label for="M_Phone">휴대폰번호<i class="icon required" aria-hidden="hidde">*</i></label>
                    </div>

                    <div class="col_2">
                        <input type="text" id="M_Phone" name="member_phone" size="4" maxlength="13" class="dev-phone">
                    </div>
                </div>

            </div>
            <h4 class="skip">약관 동의</h4>
            <div class="row_group line_all policy">
                <div class="row policy_check_all">
                    <input type="checkbox" id="lb_chk_all" class="mbrCheckOff">
                    <label for="lb_chk_all" class="chk_all">전체 동의</label>
                </div>

                <div class="row policy_check_service">
                    <input type="checkbox" id="lb_chk_service" name="Service_Agree" class="mbrCheckOn" value="1">
                    <label for="lb_chk_service" class="chk_service"><strong>*<span class="skip">필수</span></strong> 이용약관 동의 <a href="#DevPolicyService" class="mbrBtnPolicy">약관보기</a></label>
                    <div id="DevPolicyService" class="policyTplBox"><div class="pvsSec pvsCntTp">
    <ol>
        <li>
            <dl>
                <dt><a name="gg01" id="gg01"></a><strong>제 1 조 (목적) </strong></dt>
                <dd>본 약관은 잡코리아 유한회사 (이하 "회사")가 운영하는 "서비스"를 이용함에 있어 "회사"와 회원간의 이용 조건 및 제반 절차, 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 한다.</dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg02" id="gg02"></a><strong>제 2 조 (용어의 정의) </strong></dt>
                <dd>
                    <p>이 약관에서 사용하는 용어의 정의는 아래와 같다.</p>
                    <ol>
                        <li>
                            ① "사이트"라 함은 회사가 서비스를 "회원"에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 설정한 가상의 영업장 또는 회사가 운영하는 웹사이트, 모바일웹, 앱 등의 서비스를 제공하는 모든 매체를 통칭하며, 통합된 하나의 회원 계정(아이디 및 비밀번호)을 이용하여 서비스를 제공받을 수 있는 아래의 사이트를 말한다.
                            <ul>
                                <li>- www.jobkorea.co.kr</li>
                                <li>- www.albamon.com</li>
                                <li>- www.campusmon.com</li>
                                <li>- m.jobkorea.co.kr</li>
                                <li>- m.albamon.com</li>
                            </ul>
                        </li>
                        <li>② "서비스"라 함은 회사가 운영하는 사이트를 통해 개인이 구직, 교육 등의 목적으로 등록하는 자료를 DB화하여 각각의 목적에 맞게 분류 가공, 집계하여 정보를 제공하는 서비스와 사이트에서 제공하는 모든 부대 서비스를 말한다.</li>
                        <li>③ "회원"이라 함은 "회사"가 제공하는 서비스를 이용하거나 이용하려는 자로, 페이스북 등 외부 서비스 연동을 통해 "회사"와 이용계약을 체결한자 또는 체결하려는 자를 포함하며, 아이디와 비밀번호의 설정 등 회원가입 절차를 거쳐 회원가입확인 이메일 등을 통해 회사로부터 회원으로 인정받은 "개인회원"을 말한다.</li>
                        <li>④ "아이디"라 함은 회원가입 시 회원의 식별과 회원의 서비스 이용을 위하여 "회원"이 선정하고 "회사"가 부여하는 문자와 숫자의 조합을 말한다.</li>
                        <li>⑤ "비밀번호"라 함은 위 제4항에 따라 회원이 회원가입시 아이디를 설정하면서 아이디를 부여받은 자와 동일인임을 확인하고 "회원"의 권익을 보호하기 위하여 "회원"이 선정한 문자와 숫자의 조합을 말한다.</li>
                        <li>⑥ "비회원"이라 함은 회원가입 절차를 거치지 않고 "회사"가 제공하는 서비스를 이용하거나 하려는 자를 말한다.</li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg03" id="gg03"></a><strong>제 3 조 (약관의 명시와 개정) </strong></dt>
                <dd>
                    <ol>
                        <li>① "회사"는 이 약관의 내용과 상호, 영업소 소재지, 대표자의 성명, 사업자등록번호, 연락처 등을 "회원"이 알 수 있도록 초기 화면에 게시하거나 기타의 방법으로 "회원"에게 공지해야 한다.</li>
                        <li>② "회사"는 약관의 규제에 관한 법률, 전기통신기본법, 전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있다.</li>
                        <li>③ "회사"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 그 개정약관의 적용일자 7일 전부터 적용일자 전일까지 공지한다. 단 "회원"의 권리, 의무에 중대한 영향을 주는 변경의 경우에는 적용일자 30일 전부터 공지하도록 한다.</li>
                        <li>④ "회원"은 변경된 약관에 대해 거부할 권리가 있다. "회원"은 변경된 약관이 공지된 지 15일 이내에 거부의사를 표명할 수 있다. "회원"이 거부하는 경우 본 서비스 제공자인 "회사"는 15일의 기간을 정하여 "회원"에게 사전 통지 후 당해 "회원"과의 계약을 해지할 수 있다. 만약, "회원"이 거부의사를 표시하지 않거나, 전항에 따라 시행일 이후에 "서비스"를 이용하는 경우에는 동의한 것으로 간주한다.</li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg04" id="gg04"></a><strong>제 4 조 (약관의 해석) </strong></dt>
                <dd>
                    <ol>
                        <li>① 이 약관에서 규정하지 않은 사항에 관해서는 약관의 규제에 관한 법률, 전기통신기본법, 전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등의 관계법령에 따른다.</li>
                        <li>② 각 사이트 및 서비스 이용약관이 있는 경우에는 서비스 이용약관이 우선한다.</li>
                        <li>③ "회원"이 "회사"와 개별 계약을 체결하여 서비스를 이용하는 경우에는 개별 계약이 우선한다.</li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg05" id="gg05"></a><strong>제 5 조 (이용계약의 성립) </strong></dt>
                <dd>
                    <ol>
                        <li>① "회사"의 서비스 이용계약(이하 "이용계약")은 서비스를 이용하고자 하는 자가 본 약관과 개인정보처리방침을 읽고 "동의" 또는 "확인" 버튼을 누른 경우 본 약관에 동의한 것으로 간주한다.</li>
                        <li>② 제1항 신청에 있어 "회사"는 "회원"의 종류에 따라 전문기관을 통한 실명확인 및 본인인증을 요청할 수 있으며, "회원"은 본인인증에 필요한 이름, 생년월일, 연락처 등을 제공하여야 한다.</li>
                        <li>③ "회원"이 이용신청(회원가입 신청) 작성 후에 "회사"가 웹상의 안내 및 전자메일로 "회원"에게 통지함으로써 이용계약이 성립된다.</li>
                        <li>④ 페이스북 등 외부 서비스와의 연동을 통해 이용계약을 신청할 경우, 본 약관과 개인정보처리방침, 서비스 제공을 위해 "회사"가 "회원"의 외부 서비스 계정 정보 접근 및 활용에 "동의" 또는 "확인" 버튼을 누르면 "회사"가 웹상의 안내 및 전자메일로 "회원"에게 통지함으로써 이용계약이 성립된다.</li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg06" id="gg06"></a><strong>제 6 조 (이용신청의 승낙과 제한) </strong></dt>
                <dd>
                    <ol>
                        <li>① "회사"는 전조의 규정에 의한 이용신청 고객에 대하여 업무수행상 또는 기술상 지장이 없는 경우에는 원칙적으로 접수순서에 따라 서비스 이용을 승낙한다.</li>
                        <li>
                            ② "회사"는 아래사항에 해당하는 경우에 대해서는 서비스 이용신청을 승낙하지 아니한다.
                            <ol>
                                <li>1. 실명이 아니거나 타인의 명의를 이용하여 신청한 경우 </li>
                                <li>2. 이용계약 신청서의 내용을 허위로 기재하거나 "회사"가 제시하는 내용을 기재하지 않은 경우</li>
                                <li>3. 만 15세 미만의 아동이 신청한 경우. 다만, 만 13세 이상 만 15세 미만의 아동으로서 노동부장관 발행의 취업인허증이 있는 경우에는 그러하지 아니한다.</li>
                                <li>4. 이용자의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우</li>
                            </ol>
                        </li>
                        <li>
                            ③ "회사"는 아래사항에 해당하는 경우에는 그 신청에 대하여 승낙제한 사유가 해소될 때까지 승낙을 유보할 수 있다.
                            <ol>
                                <li>1. "회사"가 설비의 여유가 없는 경우</li>
                                <li>2. "회사"의 기술상 지장이 있는 경우</li>
                                <li>3. 기타 "회사"의 귀책사유로 이용승낙이 곤란한 경우</li>
                            </ol>
                        </li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg07" id="gg07"></a><strong>제 7 조 (서비스의 내용) </strong></dt>
                <dd>
                    <ol>
                        <li>
                            ① "회사"는 제2조 2항의 서비스를 제공할 수 있으며 그 내용은 다음 각 호와 같다.
                            <ol>
                                <li>1. 이력서 등록 및 인재정보 게재 서비스</li>
                                <li>2. 온라인 입사지원 서비스</li>
                                <li>3. 헤드헌팅/아웃소싱 서비스</li>
                                <li>4. 구인/구직과 관련된 제반 서비스</li>
                                <li>5. 교육과 관련된 제반 서비스</li>
                                <li>6. 이용자간의 교류와 소통에 관련한 서비스</li>
                                <li>7. 자료거래에 관련한 서비스</li>
                                <li>8. 기타"회사"가 추가 개발, 편집, 재구성하거나 제휴계약 등을 통해 “회원”에게 제공하는 일체의 서비스</li>
                            </ol>
                        </li>
                        <li>② "회사"는 필요한 경우 서비스의 내용을 추가 또는 변경할 수 있다. 단, 이 경우 "회사"는 추가 또는 변경내용을 "회원"에게 공지해야 한다.</li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg08" id="gg08"></a><strong>제 8 조 (회원, 이력서 정보) </strong></dt>
                <dd>
                    <ol>
                        <li>① "회원"의 이력서는 개인이 회원가입 또는 이력서 작성 및 수정시 희망한 형태로 등록 및 제공된다.</li>
                        <li>② "회사"는 "회원"이 이력서의 인재정보 등록/미등록 지정, 이력서상의 연락처 제공 여부를 자유롭게 선택할 수 있도록 하여야 한다.</li>
                        <li>③ "회사"는 "회원"이 이력서의 인재정보 등록 및 제공을 희망했을 경우, 기업회원, 서치펌회원 및 파견대행회원의 이력서 열람에 동의한 것으로 간주하며 "회사"는 이들 회원에게 유료로 이력서 열람 서비스를 제공할 수 있다. 다만, 연락처 각 항목이 비공개로 지정된 경우 해당 항목별 연락처를 노출할 수 없다.</li>
                        <li>④ "회사"는 "회원"이 교육에 대한 상담을 원할 경우 "회사"의 교육기관회원에게 "회원"의 전자우편 주소를 노출할 수 있으며  교육기관회원으로부터 정보의 수신을 원할 경우  교육기관회원에게 연락처를 공개할 수 있다.</li>
                        <li>⑤ "회사"는 안정적인 서비스를 제공하기 위해 테스트 및 모니터링 용도로 "사이트" 운영자가 이력서 정보를 열람하도록 할 수 있다.</li>
                        <li>⑥ "회사"는 "회원"의 선택에 의하여 등록 및 제공되는 이력서의 정보를 기준으로 구직활동에 보다 유익한 서비스를 제공하기 위하여 이를 개발, 편집, 재구성한 통계 자료로 활용 할 수 있다.</li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg9" id="gg9"></a><strong>제 9 조 (제휴를 통한 서비스) </strong></dt>
                <dd>
                    <ol>
                        <li>① "회사"는 제휴 관계를 체결한 여타 인터넷 웹 사이트 및 채용박람회 또는 신문, 잡지 등의 오프라인 매체를 통해 사이트에 등록한 "회원"의 이력서 정보가 열람될 수 있도록 서비스를 제공할 수 있다. 단, 제휴 서비스를 통해 노출되는 이력서의 연락처 정보는 제8조의 각 항에 따른다. </li>
                        <li>② "회사"는 제휴를 통해 타 사이트 및 매체에 등록될 수 있음을 고지해야 하며, 제휴 사이트 목록을 사이트내에서 상시 열람할 수 있도록 해야 한다. 단, 등록의 형태가 "회사"가 직접 구축하지 않고, 제휴사가 xml 또는 api 형태로 "회사"로부터 제공 받아 구축한 매체 목록은 본 약관외 별도의 제휴리스트에서 열람할 수 있도록 한다.</li>
                        <li>③ "회사"는 사이트와 제휴를 통해 "회원"이 공개를 요청한 이력서에 한해 이력서 정보를 제공한다.(단, 본 약관 시행일 현재에는 제휴를 통한 타 사이트 및 매체는 없다.) </li>
                        <li>④ "제9조 ③호" 제휴를 통한 사이트의 변동사항 발생 시 공지사항을 통해 고지 후 진행 한다.	</li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg10" id="gg10"></a><strong>제 10 조 (서비스의 요금) </strong></dt>
                <dd>
                    <ol>
                        <li>① "회원" 가입과 이력서 등록은 무료이다. 다만 기업회원 또는 사이트에 방문한 기업체에게 자신의 이력서 정보를 보다 효과적으로 노출시키기 위한 유료서비스 및 인성, 적성 검사 등 회원 가입 목적 외 기타 서비스를 이용하기 위한 별도의 서비스는 유료로 제공될 수 있다. </li>
                        <li>② "회사"는 유료서비스를 제공할 경우 사이트에 요금에 대해서 공지를 하여야 한다. </li>
                        <li>③ "회사"는 유료서비스 이용금액을 서비스의 종류 및 기간에 따라 "회사"가 예고 없이 변경할 수 있다. 다만, 변경 이전에 적용 또는 계약한 금액은 소급하여 적용하지 아니한다.</li>
                        <li>④ 유료 서비스 신청 후 "회원" 사정에 의해 서비스가 취소될 경우, 정부가 고시하는 '디지털콘텐츠 이용자보호지침'에 따라 "회사"는 본 지침이 제시하는 범위 내에서 환불 수수료를 부과할 수 있다.	</li>
                    </ol>
                </dd>
            </dl>

        </li>
        <li>

            <dl>
                <dt><a name="gg11" id="gg11"></a><strong>제 11 조 (e-머니 규정) </strong></dt>
                <dd>
                    <ol>
                        <li>① e-머니는 유료상품 구매 시의 사은, 이벤트, 고객보상 등의 사유로 적립된다. '적립된 e-머니'는 유료상품 결제시 사용할 수 있으며, 현금으로 출금되지 않는다.</li>
                        <li>② 위의 적립사유가 해제되었을 경우, ‘적립된 e-머니’를 회원보유분에서 회수하며, 결제시 사용한 서비스를 취소할 경우, 사용분에 해당하는 e-머니를 제외하고 사용이전의 상태로 재적립 받을 수 있다.</li>
                        <li>③ 서비스 운영 정책에 따라 e-머니의 상품별 적립기준, 적립비율, 사용조건 및 제한 등은 달라질 수 있으며, 이에 대한 사항은 서비스 화면에 게시하거나 통지한다.  e-머니 적립 시 별도의 유효기간을 정한 바가 없으면 적립일로부터 12개월의 유효기간을 보장한다. </li>
                        <li>④ e-머니의 적립시점과 무관하게 유효기간이 지나거나, "회원"이 12개월 동안 사이트에 로그인 하지 않을 경우, "회원"이 가입해지한 경우, 제19조 ②항에 의해 가입해지하거나 서비스가 중지된 경우 e-머니는 전액 자동소멸되어 복구되지 않는다. </li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg12" id="gg12"></a><strong>제 12 조 (서비스 이용시간) </strong></dt>
                <dd>
                    <ol>
                        <li>① "회사"는 특별한 사유가 없는 한 연중무휴, 1일 24시간 서비스를 제공한다. 다만, "회사"는 서비스의 종류나 성질에 따라 제공하는 서비스 중 일부에 대해서는 별도로 이용시간을 정할 수 있으며, 이 경우 "회사"는 그 이용시간을 사전에 "회원"에게 공지 또는 통지하여야 한다. </li>
                        <li>② "회사"는 자료의 가공과 갱신을 위한 시스템 작업시간, 장애해결을 위한 보수작업 시간, 정기 PM작업, 시스템 교체작업, 회선 장애 등이 발생한 경우 일시적으로 서비스를 중단할 수 있으며 계획된 작업의 경우 공지란에 서비스 중단 시간과 작업 내용을 알려야 한다. 다만, "회사"가 사전에 통지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수 있다.</li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg13" id="gg13"></a><strong>제 13 조 (서비스 제공의 중지) </strong></dt>
                <dd>
                    <ol>
                        <li>
                            ① "회사"는 다음 각 호에 해당하는 경우 서비스의 제공을 중지할 수 있다.
                            <ol>
                                <li>1. 설비의 보수 등 "회사"의 필요에 의해 사전에 "회원"들에게 통지한 경우 </li>
                                <li>2. 기간통신사업자가 전기통신서비스 제공을 중지하는 경우 </li>
                                <li>3. 기타 불가항력적인 사유에 의해 서비스 제공이 객관적으로 불가능한 경우</li>
                            </ol>
                        </li>
                        <li>② 전항의 경우, "회사"는 기간의 정함이 있는 유료서비스 이용자들에게는 그 이용기간을 연장하거나 환불 등의 방법으로 손실을 보상하여야 한다. </li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg14" id="gg14"></a><strong>제 14 조 (정보의 제공 및 광고의 게재) </strong></dt>
                <dd>
                    <ol>
                        <li>① "회사"는 "회원"에게 서비스 이용에 필요가 있다고 인정되거나 서비스 개선 및 회원대상의 서비스 소개 등의 목적으로 하는 각종 정보에 대해서 전자우편이나 서신우편을 이용한 방법으로 제공할 수 있다. </li>
                        <li>② "회사"는 제공하는 서비스와 관련되는 정보 또는 광고를 서비스 화면, 홈페이지, 전자우편 등에 게재할 수 있으며, 광고가 게재된 전자우편을 수신한 "회원"은 수신거절을 "회사"에게 할 수 있다.</li>
                        <li>③ "회사"는 서비스상에 게재되어 있거나 본 서비스를 통한 광고주의 판촉활동에 "회원"이 참여하거나 교신 또는 거래를 함으로써 발생하는 모든 손실과 손해에 대해 책임을 지지 않는다.</li>
                        <li>④ 본 서비스의 "회원"은 서비스 이용 시 노출되는 광고게재에 대해 동의 하는 것으로 간주한다. </li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg15" id="gg15"></a><strong>제 15 조 (자료내용의 책임과 "회사"의 정보 수정 권한) </strong></dt>
                <dd>
                    <ol>
                        <li>① 자료내용은 "회원"이 등록한 개인정보 및 이력서와 사이트에 게시한 게시물을 말한다.</li>
                        <li>② "회원"은 자료 내용 및 게시물을 사실에 근거하여 성실하게 작성해야 하며, 만일 자료의 내용이 사실이 아니거나 부정확하게 작성되어 발생하는 모든 책임은 "회원"에게 있다. </li>
                        <li>③ 모든 자료내용의 관리와 작성은 "회원" 본인이 하는 것이 원칙이나 사정상 위탁 또는 대행관리를 하더라도 자료내용의 책임은 "회원"에게 있으며 "회원"은 주기적으로 자신의 자료를 확인하여 항상 정확하게 관리가 되도록 노력해야 한다. </li>
                        <li>④ "회사"는 "회원"이 등록한 자료 내용에 오자, 탈자 또는 사회적 통념에 어긋나는 문구와 내용이 있을 경우 이를 언제든지 수정할 수 있다. </li>
                        <li>⑤ "회원"이 등록한 자료으로 인해 타인(또는 타법인)으로부터 허위사실 및 명예훼손 등으로 삭제 요청이 접수된 경우 "회사"는 "회원"에게 사전 통지 없이 본 자료를 삭제할 수 있으며 삭제 후 메일 등의 방법으로 통지할 수 있다.</li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg16" id="gg16"></a><strong>제 16 조 (자료 내용의 활용 및 취급) </strong></dt>
                <dd>
                    <ol>
                        <li>① "회원"이 선택하거나 입력한 정보는 취업 및 관련 동향의 통계 자료로 구성, 활용될 수 있으며 그 자료는 매체를 통한 언론 배포 또는 제휴사에게 제공될 수 있다. 단, 개인을 식별할 수 있는 형태가 아니어야 한다.</li>
                        <li>② 제8조 제3항에 따라 "사이트"에서 정당한 절차를 거쳐 기업회원, 서치펌회원 및 파견대행회원 등이 열람한 "회원"의 이력서 정보는 해당 기업의 인사자료이며 이에 대한 관리 권한은 해당 기업의 정책에 의한다.</li>
                        <li>③ "회사"는 "사이트"의 온라인 입사지원 시스템을 통해 지원한 "회원"의 이력서 열람 여부 및 기업회원이 제공한 채용정보에 입사지원한 구직자들의 각종 통계데이터를 "회원"에게 제공할 수 있다.</li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg17" id="gg17"></a><strong>제 17 조 ("회사"의 의무) </strong></dt>
                <dd>
                    <ol>
                        <li>① "회사"는 본 약관에서 정한 바에 따라 계속적, 안정적으로 서비스를 제공할 수 있도록 최선의 노력을 다해야 한다. </li>
                        <li>② "회사"는 서비스와 관련한 "회원"의 불만사항이 접수되는 경우 이를 즉시 처리하여야 하며, 즉시 처리가 곤란한 경우에는 그 사유와 처리일정을 서비스 화면 또는 기타 방법을 통해 동 "회원"에게 통지하여야 한다. </li>
                        <li>③ "회사"는 유료 결제와 관련한 결제 사항 정보를 1년 이상 보존한다. 다만 회원 자격이 없는 회원은 예외로 한다. </li>
                        <li>④ 천재지변 등 예측하지 못한 일이 발생하거나 시스템의 장애가 발생하여 서비스가 중단될 경우 이에 대한 손해에 대해서는 "회사"가 책임을 지지 않는다. 다만 자료의 복구나 정상적인 서비스 지원이 되도록 최선을 다할 의무를 진다. </li>
                        <li>⑤ "회원"의 자료를 본 서비스 이외의 목적으로 제3자에게 제공하거나 열람시킬 경우 반드시 "회원"의 동의를 얻어야 한다.</li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg18" id="gg18"></a><strong>제 18 조 ("회원"의 의무) </strong></dt>
                <dd>
                    <ol>
                        <li>① "회원"은 관계법령과 본 약관의 규정 및 기타 "회사"가 통지하는 사항을 준수하여야 하며, 기타 "회사"의 업무에 방해되는 행위를 해서는 안 된다. </li>
                        <li>② "회원"이 신청한 유료서비스는 등록 또는 신청과 동시에 "회사"와 채권, 채무 관계가 발생하며, "회원"은 이에 대한 요금을 지정한 기일 내에 납부하여야 한다. </li>
                        <li>③ "회원"이 결제 수단으로 신용카드를 사용할 경우 비밀번호 등 정보 유실 방지는 "회원" 스스로 관리해야 한다. 단, "사이트"의 결함에 따른 정보유실의 발생에 대한 책임은 "회원"의 의무에 해당하지 아니한다. </li>
                        <li>④ "회원"은 서비스를 이용하여 얻은 정보를 "회사"의 사전동의 없이 복사, 복제, 번역, 출판, 방송 기타의 방법으로 사용하거나 이를 타인에게 제공할 수 없다. </li>
                        <li>
                            ⑤ "회원"은 본 서비스를 건전한 취업 및 경력관리 이외의 목적으로 사용해서는 안되며 이용 중 다음 각 호의 행위를 해서는 안 된다.
                            <ol>
                                <li>1. 다른 회원의 아이디를 부정 사용하는 행위</li>
                                <li>2. 범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위</li>
                                <li>3. 타인의 명예를 훼손하거나 모욕하는 행위</li>
                                <li>4. 타인의 지적재산권 등의 권리를 침해하는 행위</li>
                                <li>5. 해킹행위 또는 바이러스의 유포 행위</li>
                                <li>6. 타인의 의사에 반하여 광고성 정보 등 일정한 내용을 계속적으로 전송하는 행위</li>
                                <li>7. 서비스의 안정적인 운영에 지장을 주거나 줄 우려가 있다고 판단되는 행위</li>
                                <li>8. 사이트의 정보 및 서비스를 이용한 영리 행위</li>
                                <li>9. 그밖에 선량한 풍속, 기타 사회질서를 해하거나 관계법령에 위반하는 행위</li>
                            </ol>
                        </li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li>
            <dl>
                <dt><a name="gg19" id="gg19"></a><strong>제 19 조 ("회원"의 가입해지/서비스중지/자료삭제) </strong></dt>
                <dd>
                    <ol>
                        <li>① "회원"은 언제든지 회원탈퇴 또는 이력서 등록을 해지하기 위해 고객센터 또는 회원탈퇴 메뉴 등을 통하여 이용계약 해지 신청을 할 수 있으며, "회사"는 관련법 등이 정하는 바에 따라 이를 처리한다.</li>
                        <li>
                            ② 다음의 사항에 해당하는 경우 "회사"는 사전 동의없이 가입해지나 서비스 중지, 이력서 삭제 조치를 취할 수 있다.
                            <ol>
                                <li>1. 회원의 의무를 성실하게 이행하지 않았을 때 </li>
                                <li>2. 규정한 유료서비스 이용 요금을 납부하지 않았을 때</li>
                                <li>3. 본 서비스 목적에 맞지 않는 분야에 정보를 활용하여 사회적 물의가 발생한 때</li>
                                <li>4. 회원이 등록한 정보의 내용이 사실과 다르거나 조작되었을 때</li>
                                <li>5. 본 서비스와 관련하여 회사 또는 제3자의 명예를 훼손하였을 때</li>
                                <li>6. 기타 위 각호에 준하는 사유가 발생하였을 때</li>
                            </ol>
                        </li>
                        <li>③ "회원"이 유료서비스를 이용하는 중 "회사"의 책임에 의해 정상적인 서비스가 제공되지 않을 경우 "회원"은 본 서비스의 해지를 요청할 수 있으며 "회사"는 기간의 정함이 있는 유료서비스의 경우에는 해지일까지 이용일수를 1일 기준금액으로 계산하여 이용금액을 공제 후 환급하고, 이용건수의 정함이 있는 유료서비스의 경우에는 기 사용분을 1건 기준금액으로 계산하여 이용금액을 공제후 환급한다. </li>
                        <li>④ "회사"는 회원 가입이 해지된 경우에는 개인정보처리방침 중, 04.개인정보의 보유 및 이용기간 규정에 따른다.</li>
                        <li>⑤ 개인정보보호를 위하여 "회원"이 선택한 개인정보 보유기간(1년, 3년, 회원탈퇴시) 동안 "사이트"를 이용하지 않은 경우, "아이디"를 "휴면계정"으로 분리하여 해당 계정의 이용을 중지할 수 있다. </li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg20" id="gg20"></a><strong>제 20 조 (손해배상) </strong></dt>
                <dd>
                    <ol>
                        <li>① "회사"가 이 약관의 제7조, 제17조, 제19조 등의 규정에 위반한 행위로 "회원"에게 손해를 입히거나 기타 "회사"가 제공하는 모든 서비스와 관련하여 "회사"의 책임 있는 사유로 인해 이용자에게 손해가 발생한 경우 "회사"는 그 손해를 배상하여야 한다. </li>
                        <li>② "회사"는 책임 있는 사유로 제공한 정보가 사실과 달라 "회원"이 손해를 입었을 경우에 "회사"는 그 손해를 배상하여야 한다. </li>
                        <li>③ "회원"이 이 약관의 제5조, 제18조, 제19조 등의 규정에 위반한 행위로 "회사" 및 제3자에게 손해를 입히거나 "회원"의 책임 있는 사유에 의해 "회사" 및 제3자에게 손해를 입힌 경우에는 "회원"은 그 손해를 배상하여야 한다.</li>
                        <li>④ 타 회원(개인회원, 기업회원, 서치펌회원, 파견·대행회원, 교육기관회원 모두 포함)의 귀책사유로 "회원"의 손해가 발생한 경우 "회사"는 이에 대한 배상 책임이 없다.</li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg21" id="gg21"></a><strong>제 21 조 (이용요금 오류의 조정) </strong></dt>
                <dd>
                    <p>"회사"는 이용요금과 관련하여 오류가 있는 경우에 "회원"의 요청, 또는 "회사"의 사전 통지에 의하여 다음에 해당하는 조치를 취한다. </p>
                    <ol>
                        <li>1. 과다납입한 요금에 대하여는 그 금액을 반환한다. 다만, "회원"이 동의할 경우 다음 달에 청구할 요금에서 해당 금액만큼을 감하여 청구한다. </li>
                        <li>2. 요금을 반환받아야 할 "회원"이 요금체납이 있는 경우에는 반환해야 할 요금에서 이를 우선 공제하고 반환한다. </li>
                        <li>3. "회사"는 과소청구액에 대해서는 익월에 합산청구한다.</li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg22" id="gg22"></a><strong>제 22 조 ("회원"의 개인정보보호) </strong></dt>
                <dd>"회사"는 "회원"의 개인정보보호를 위하여 노력해야 한다. "회원"의 개인정보보호에 관해서는 정보통신망이용촉진 및 정보보호 등에 관한 법률, 개인정보보호법에 따르고, "사이트"에 "개인정보처리방침"을 고지한다.</dd>
            </dl>
        </li>
        <li>
            <dl>
                <dt><a name="gg23" id="gg23"></a><strong>제 23 조 (신용정보의 제공 활용 동의) </strong></dt>
                <dd>
                    <ol>
                        <li>① "회사"가 회원가입과 관련하여 취득한 "회원"의 개인신용정보를 타인에게 제공하거나 활용하고자 할 때에는 신용정보의 이용 및 보호에 관한 법률 제23조의 규정에 따라 사전에 그 사유 및 해당기관 또는 업체명 등을 밝히고 해당 "회원"의 동의를 얻어야 한다. </li>
                        <li>② 본 서비스와 관련하여 "회사"가 "회원"으로부터 신용정보의 이용 및 보호에 관한 법률에 따라 타인에게 제공 활용에 동의를 얻은 경우 "회원"은 "회사"가 신용정보 사업자 또는 신용정보 집중기관에 정보를 제공하여 "회원"의 신용을 판단하기 위한 자료로 활용하거나, 공공기관에서 정책자료로 활용되도록 정보를 제공하는 데 동의한 것으로 간주한다. </li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li>
            <dl class="nobg">
                <dt><a name="gg24" id="gg24"></a><strong>제 24 조 (분쟁의 해결) </strong></dt>
                <dd>
                    <ol>
                        <li>① "회사"와 "회원"은 서비스와 관련하여 발생한 분쟁을 원만하게 해결하기 위하여 필요한 모든 노력을 하여야 한다. </li>
                        <li>② 전항의 노력에도 불구하고, 동 분쟁에 관한 소송은 "회사"의 주소지 관할법원으로 한다.  </li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li class="etc">
            <dl class="nobg">
                <dt><strong>부칙</strong></dt>
                <dd>
                    <ul>
                        <li>- 이 약관은 2017년 9월 25일부터 시행한다.</li>
                    </ul>
                </dd>
            </dl>
        </li>
    </ol>
</div>
</div>
                </div>

                <div class="row policy_check_privacy">
                    <input type="checkbox" id="lb_chk_privacy" name="Priacy_Agree" class="mbrCheckOn" value="1">
                    <label for="lb_chk_privacy" class="chk_privacy"><strong>*<span class="skip">필수</span></strong> 개인정보 수집 및 이용 동의 <a href="#DevPolicyPrivacy" class="mbrBtnPolicy">약관보기</a></label>
                    <div id="DevPolicyPrivacy" class="policyTplBox"><div class="pvsSec pvsTpList">
    <h2 class="pvsHeading2"><strong>1. 개인정보의 수집 및 이용목적</strong></h2>
    <p class="depth_01">회원의 취업과 인재채용 활동을 매개하는 온라인 리크루팅 사이트인 잡코리아, 알바몬, 캠퍼스몬(이하 "사이트")은 효과적인 취업지원 · 인재채용 · 경력개발에 적합한 서비스를 제공하기 위하여 개인정보를 수집하고 있으며 수집된 정보를 아래와 같이 이용하고 있습니다. 이용자가 제공한 모든 정보는 하기 목적에 필요한 용도 이외로는 사용되지 않으며 이용 목적이 변경될 시에는 사전 동의를 구할 것입니다.</p>
    <ol class="depth_01">
        <li>
            1) 회원관리
            <p class="depth_02">
                회원제 서비스 이용에 따른 본인확인, 본인의 의사확인, 고객문의에 대한 응답, 새로운 정보의 소개 및 고지사항 전달
            </p>
        </li>
        <li>
            2) 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
            <p class="depth_02">
                본인인증, 채용정보 매칭 및 컨텐츠 제공을 위한 개인식별, 회원간의 상호 연락, 구매 및 요금 결제, 물품 및 증빙발송, 부정 이용방지와 비인가 사용방지
            </p>
        </li>
        <li>
            3) 서비스 개발 및 마케팅ㆍ광고에의 활용
            <p class="depth_02">
                맞춤 서비스 제공, 서비스 안내 및 이용권유, 서비스 개선 및 신규 서비스 개발을 위한 통계 및 접속빈도 파악, 통계학적 특성에 따른 광고 게재, 이벤트 정보 및 참여기회 제공
            </p>
        </li>
        <li>
            4) 고용 및 취업동향 파악을 위한 통계학적 분석
        </li>
    </ol>

    <h2 class="pvsHeading2"><strong>2. 수집하는 개인정보 항목 및 수집방법</strong></h2>
    <p class="depth_01">"사이트"에서는 별도의 회원가입 절차 없이 특정 유료 서비스를 제외한 대부분의 컨텐츠에 자유롭게 접근할 수 있으며, 회원제 서비스를 이용하시려면 필수항목을 입력하여야 하며 선택항목을 입력하지 않더라도 서비스 이용에 제한을 두지 않습니다.</p>
    <ol class="depth_01">
        <li>
            가. 수집하는 개인정보의 항목
            <ol class="depth_02">
                <li>
                    1) 회원가입 시 수집하는 항목
                    <ul class="depth_03">
                        <li class="icon">필수항목: 이름, 아이디, 비밀번호, 휴대폰번호, e-메일, 생년월일(알바몬), 성별(알바몬), 주소(알바몬)</li>
                        <li class="icon">선택항목: 이메일 수신 설정, SMS/MMS 수신 설정, 가입경로(알바몬)</li>
                        <li class="icon">페이스북 등 외부 서비스와의 연동을 통해 이용자가 설정한 계정 정보</li>
                    </ul>
                <li>
                    2) 이력서 등록 시 수집하는 항목
                    <ul class="depth_03">
                        <li>
                            ① 잡코리아
                            <ul>
                                <li class="icon">필수 항목: 이름, 연락처(전화번호/휴대폰/e-메일 중 1개 필수), 학력사항(신입), 경력사항(경력직), 생년월일, 성별</li>
                                <li class="icon">선택 항목: 사진, 홈페이지, 우편번호, 주소, 고용형태, 희망연봉, 희망근무지, 희망지원분야(직무·산업, 키워드), 자기소개서, 희망급여, 학력사항(경력직), 취업우대사항(보훈대상, 취업보호대상, 장애여부, 병역사항, 고용지원금대상), 인턴·대외활동, 교육, 자격증, 수상, 해외경험, 어학시험, 회화능력, 각오한마디, 포트폴리오</li>
                            </ul>
                        </li>
                        <li>
                            ② 알바몬
                            <ul>
                                <li class="icon">필수 항목: 이름, 연락처(전화번호/휴대폰/e-메일), 근무형태, 희망근무지, 업직종, 희망근무일시, 최종학력, 자기소개서, 생년월일, 성별</li>
                                <li class="icon">선택 항목: 사진, 홈페이지, 주소, 희망급여, 근무가능일, 경력사항, 취업우대사항(보훈대상, 장애여부, 병역사항, 고용지원금대상), 수상·수료·활동내역, 자격증, 컴퓨터활용능력(OA능력, IT/디자인 능력), 외국어구사능력, 어학연수, 공인시험, 포트폴리오, 사진첩, 장점/강점, 하고 싶은 말</li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li>
                    3) 유료 정보 이용 시 수집하는 항목<br />유료 서비스 이용 과정에서 아래와 같은 결제 정보들이 수집될 수 있습니다.
                     <ul class="depth_03">
                        <li class="icon">신용카드 결제: 카드사명, 카드번호 등</li>
                        <li class="icon">은행계좌 이체: 은행명, 계좌번호 등</li>
                        <li class="icon">휴대전화 결제: 가입자명, 이동전화번호, 결제승인번호 등</li>
                    </ul>
                </li>
                <li>
                    4) 모바일 서비스 이용 시 수집되는 항목
                    <ul class="depth_03">
                        <li class="icon">기업전화알리미, 취업사기 실시간 감시 서비스 이용 시 : 발신자 전화번호, 문자메시지</li>
                        <li class="icon">모바일 서비스의 특성상 단말기 모델 정보가 수집될 수 있으나,이는 개인을 식별할 수 없는 형태입니다.</li>
                    </ul>
                </li>
                <li>
                    5) 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다. <br>
                    - IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록, 광고 ID
                </li>
            </ol>
        </li>
        <li>
            나. 개인정보 수집방법<br>
            -홈페이지, 서비스 이용, 이벤트 응모, 팩스, 우편, 전화, 고객센터 문의하기
        </li>
    </ol>

    <h2 class="pvsHeading2"><strong>3. 개인정보의 보유 및 이용기간</strong></h2>
    <p class="depth_01">
        "사이트"는 회원가입일로부터 서비스를 제공하는 기간 동안에 한하여 이용자의 개인정보를 보유 및 이용하게 됩니다. 회원탈퇴를 요청하거나 개인정보의 수집 및 이용에 대한 동의를 철회하는 경우, 수집 및 이용목적이 달성되거나 이용기간이 종료한 경우 개인정보를 지체 없이 파기합니다.<br>
        단, 다음의 경우에 대해서는 각각 명시한 이유와 기간 동안 보존합니다.
    </p>
    <ol class="depth_01">
        <li>
            1) 상법 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 법령에서 규정한 보존기간 동안 거래내역과 최소한의 기본정보를 보유합니다.<br>
            이 경우 회사는 보관하는 정보를 그 보관의 목적으로만 이용합니다.
        </li>
        <ol class="depth_02">
            <li>① 계약 또는 청약철회 등에 관한 기록: 5년</li>
            <li>② 대금결제 및 재화 등의 공급에 관한 기록: 5년</li>
            <li>③ 소비자의 불만 또는 분쟁처리에 관한 기록: 3년</li>
            <li>④ 부정이용 등에 관한 기록: 5년</li>
            <li>⑤ 웹사이트 방문기록(로그인 기록, 접속기록): 3개월</li>
        </ol>
        <li>2) 보유기간을 미리 공지하고 그 보유기간이 경과하지 아니한 경우와 개별적으로 동의를 받은 경우에는 약정한 기간 동안 보유합니다.</li>
        <li>3) 개인정보보호를 위하여 이용자가 선택한 개인정보 보유기간(1년, 3년, 회원탈퇴시) 동안 "사이트"를 이용하지 않은 경우, "아이디"를 "휴면계정"로 분리하여 해당 계정의 이용을 중지할 수 있습니다.</li>
    </ol>
</div></div>
                </div>
                <div class="row check_email">
                    <input type="checkbox" id="lb_chk_email" name="Event_Agree_Stat" class="mbrCheckOn" value="1">
                    <label for="lb_chk_email" class="chk_privacy">마케팅 정보 이메일 수신 동의</label>
                </div>
                <div class="row check_sms">
                    <input type="checkbox" id="lb_chk_sms" name="SMS_Agree_Stat" class="mbrCheckOn" value="1">
                    <label for="lb_chk_sms" class="chk_privacy">마케팅 정보 SMS 수신 동의</label>
                </div>

                <div class="notice_msg" id="notice_msg_agree"></div>
            </div>
            <!-- 개인정보 유효기간 선택 -->
<div class="row_group mbr_validity">
    <div class="header">
        <h4 class="header">개인정보 유효기간 선택</h4>
        <button type="button" class="button buttonHelp" aria-haspopup="true">도움말</button>
        <div class="popup hidden" aria-hidden="true">
            <div class="popupHeader">개인정보 유효기간</div>
            <div class="popupBody">가입하신 ID로 선택하신 기간 동안 사이트에 로그인 등<br>활동을 하지 않을 경우, 해당 개인정보를 별도 분리 저장하게 됩니다.</div>
        </div>
    </div>
    <div class="list">
        <div class="item">
            <input type="radio" name="Validity" id="validity_year1" class="skip" value="1" checked="checked" />
            <label for="validity_year1">1년</label>
        </div>
        <div class="item">
            <input type="radio" name="Validity" id="validity_year3" class="skip" value="3" />
            <label for="validity_year3">3년</label>
        </div>
        <div class="item">
            <input type="radio" name="Validity" id="validity_leave" class="skip" value="0" />
            <label for="validity_leave">회원탈퇴시</label>
        </div>
    </div>
</div>            <!-- 회원 가입 버튼 -->
            <div class="row_group line_none regist_complete" style="position:relative;">
                <div class="row">
                    <button type="submit" class="mbrBtnRegist"><span>가입하기</span></button>
                </div>
            </div>
</form>   
</fieldset>
    <!-- familysite -->

</div>
<script type="text/javascript">
    !(function ($) {
        if (join) {
            join.common.init();
            join.account.init();
            join.account.only_gg();
        }
    }(jQuery));
</script>



<div style="position:absolute; left:-5000px; overflow:hidden; display:none;">

    <!-- End Adobe Marketing Cloud Tag Management code -->
</div>
<div style="position:absolute; left:-5000px; overflow:hidden; display:none;">

</div>
    </div>
</body>
