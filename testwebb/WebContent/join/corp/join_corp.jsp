<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body class="jkJoin jkJoin_company">
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
        <li class="person "><a href="joingen.action">개인회원</a></li>
        <li class="corp on"><a href="joincorp.action">기업회원</a></li>
    </ul>
</div>


<div id="container" class="mbrRegist">
    <!-- 가입 혜택 -->

    <h3 class="skip">기업 회원가입 정보</h3>
    <fieldset>
        <legend>기업 회원가입</legend>
        <form action="inputCorp.action" method="POST" id="form" name="corpForm" onsubmit = "return checkForm();">
            <input type="hidden" id="Mem_Type" value="GI" />
<input data-val="true" data-val-required="CertifyType 필드가 필요합니다." id="CertifyType" name="CertifyType" type="hidden" value="phone" /><input id="CertifyCode" name="CertifyCode" type="hidden" value="" /><input id="CertifyReCall" name="CertifyReCall" type="hidden" value="" /><input id="DI_Code" name="DI_Code" type="hidden" value="" /><input id="getCertifynum" name="getCertifynum" type="hidden" value="" /><input id="ReSubmit" name="ReSubmit" type="hidden" value="" /><input id="Mobile_Encrypt" name="Mobile_Encrypt" type="hidden" value="" /><input data-val="true" data-val-number="OEM_No 필드는 숫자여야 합니다." data-val-required="OEM_No 필드가 필요합니다." id="OEM_No" name="OEM_No" type="hidden" value="1" /><input id="CorpAuthStat" name="CorpAuthStat" type="hidden" value="" /><input id="Mem_HPhone" name="Mem_HPhone" type="hidden" value="" /><input data-val="true" data-val-maxlength="필드 Mem_Ident은(는) 최대 길이가 &#39;8&#39;인 문자열 또는 배열 형식이어야 합니다." data-val-maxlength-max="8" id="Mem_Ident" name="Mem_Ident" type="hidden" value="" />            <!-- 기업 정보 -->
            <div class="row row_group">
                <h4>기업정보</h4>
                <div class="headingGuide"><i>*</i>필수정보</div>

                <!-- 기업회원 탭 메뉴 -->

                <div class="row mbr_name mbr_co_type">
                    <div class="col_1">
                        <label class="mbr_name" for="Corp_Type">기업형태<i class="icon required" aria-hidden="hidde">*</i></label>
                    </div>
                    <div class="col_2">
                        <div class="select_wrap dev-corp-type">
                            <select id="Corp_Type" name="cmember_type">
                                <option value=""></option>
                                <option value="대기업">대기업</option>
                                <option value="중소기업">중소기업(300명이하)</option>
                                <option value="중견기업">중견기업(300명이상)</option>
                            </select>
                        </div>
                        <div class="notice_msg" style="display:none;"></div>
                    </div>
                </div>
               

                <div class="row company_num">
                    <div class="col_1">
                        <label for="Corp_RegNum">사업자등록번호<i class="icon required" aria-hidden="hidde">*</i></label>
                    </div>
                    <button type="button" class="button btnHelp">사업자등록번호 입력가이드</button>
                    <div class="lyHelp">
                        사업자등록번호 도용 피해 방지를 위해 기업인증을 시행하고 있습니다.<br>
                        NICE평가정보㈜에 등록되어 있지 않은 기업은 사업자등록증 사본을<br>
                        고객센터(Fax.02-565-9351)나 헬프데스크(helpdesk@jobkorea.co.kr)로 보내주시기 바랍니다.
                    </div>
                    <div class="col_2">
                        <input type="text" name="cmember_cno" id="Corp_RegNum" class="mbr_name dev-corp-num" maxlength="13" value="" />
                        <div class="notice_msg" id="notice_msg_regnum"></div>
                    </div>
                </div>
                <div class="rows">
                    <div class="row company_name">
                        <div class="col_1">
                            <label class="mbr_name" for="Corp_Name">회사명<i class="icon required" aria-hidden="hidde">*</i></label>
                        </div>
                        <div class="col_2">
                            <input class="mbr_name dev-corp-name" data-val="true" data-val-maxlength="필드 Corp_Name은(는) 최대 길이가 &#39;50&#39;인 문자열 또는 배열 형식이어야 합니다." data-val-maxlength-max="50" data-val-required="Corp_Name 필드가 필요합니다." id="Corp_Name" maxlength="50" name="cmember_cname" type="text" value="" />
                            <div class="notice_msg" id="notice_msg_corp_name"></div>
                        </div>
                    </div>
                    <div class="row company_bossname">
                        <div class="col_1">
                            <label class="mbr_name" for="Boss_Name">대표자명<i class="icon required" aria-hidden="hidde">*</i></label>
                        </div>
                        <div class="col_2">
                            <input class="mbr_name dev-ceo-name" data-val="true" data-val-maxlength="필드 Boss_Name은(는) 최대 길이가 &#39;20&#39;인 문자열 또는 배열 형식이어야 합니다." data-val-maxlength-max="20" data-val-required="Boss_Name 필드가 필요합니다." id="Boss_Name" maxlength="20" name="cmember_ceo" type="text" value="" />
                            <div class="notice_msg" id="notice_msg_ceo_name"></div>
                        </div>
                    </div>
                </div>
                <div class="row mbr_zipcode">
                    <div class="col_1">
                        <label for="Corp_Addr">회사주소<i class="icon required" aria-hidden="hidde">*</i></label>
                    </div>
                    <div class="col_2">
                        <input id="Addr_Foreign" name="cmember_addr" type="text" value="" maxlength="150" />
                        <div class="notice_msg msg_addr"></div>
                    </div>
                </div>
            </div>
            <!-- 인사담당자 정보 -->
            <div class="row_group line_bottom mbr_info">
                <h4>인사담당자 정보</h4>
                <div class="headingButtons">
                    <a href="http://globalemployer.jobkorea.co.kr/" target="_blank" class="button">Overseas Corporate Help</a>
                </div>
                <!-- 인사담당자 정보 -->
                <!-- 인증 -->

                <!-- 기본정보 -->
<div class="row mbr_name">
    <div class="col_1">
        <label class="mbr_name" for="Mem_Name">가입자명<i class="icon required" aria-hidden="hidde">*</i></label>
    </div>
    <div class="col_2">
        <input class="mbr_name dev-name" id="Mem_Name" maxlength="12" name="cmember_name" type="text" value="">
        <div class="notice_msg" id="notice_msg_name"></div>
    </div>
</div>
<div class="rows">
    <div class="row mbr_id">
        <div class="col_1">
            <label for="U_ID">아이디<i class="icon required" aria-hidden="hidde">*</i></label>
        </div>
        <div class="col_2">
            <input data-val="true" id="U_ID" maxlength="16" name="cmember_id" class="dev-id" type="text" value="" />
            <div class="notice_msg" id="notice_msg_id"></div>
        </div>
    </div>
    <div class="row mbr_passwd">
        <div class="col_1">
            <label for="U_PWD">비밀번호<i class="icon required" aria-hidden="hidde">*</i></label>
        </div>
        <div class="col_2">
            <input id="U_PWD" class="dev-password" maxlength="16" name="cmember_pass" type="password" style="ime-mode:disabled;" value="" />
            <button type="button" class="btnHelp devPwdHelpBtn" title="안전한 비밀번호 작성법">?</button>
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
            <div class="notice_msg" id="notice_msg_pwd"><p class="failure"></p></div>
        </div>
        <div class="col_3">
            <button type="button" class="mbrBtnAuth dev-password-dp"><span>표시</span></button>
        </div>
    </div>
</div>
<div class="row mbr_phone">
    <div class="col_1">
        <label class="mbr_phone" for="Corp_Phone">전화번호('-'도 포함해서입력해주세요.)<i class="icon required" aria-hidden="hidde">*</i></label>
    </div>
    <div class="col_2">
        <input class="mbr_email_id dev-mail" data-val="true" id="Corp_Phone" maxlength="13" name="cmember_phone" title="전화번호" type="text" value="" />
        <div class="notice_msg" id="notice_msg_phone"><p class="failure">필수 정보입니다.</p></div>
    </div>
</div>
<div class="row mbr_email">
    <div class="col_1">
        <label for="Email_ID" class="mbr_email_id">이메일<i class="icon required" aria-hidden="hidde">*</i></label>
    </div>
    <div class="col_2">
        <input type="text" id="email" name="cmember_email" class="mbr_email_id dev-mail" size="8" maxlength="100" value="" />
        <div class="notice_msg" id="notice_msg_mail"></div>
        <input type="hidden" id="Email_ID" name="Email_ID" />
        <input type="hidden" id="Email_Addr" name="Email_Addr" />
    </div>
</div>

            </div>
            <h4 class="skip">사이트 이용 정보</h4>
            <!-- 개인정보 유효기간 선택 -->

<h4 class="skip">약관 동의</h4>
<div class="row_group line_all policy">
    <div class="row policy_check_all">
        <input type="checkbox" id="lb_chk_all" class="mbrCheckOff">
        <label for="lb_chk_all" class="chk_all">전체 동의</label>
    </div>

    <div class="row policy_check_service">
        <input type="checkbox" id="lb_chk_service" name="Service_Agree" class="mbrCheckOn devAgreeCheck" value="1">
        <label for="lb_chk_service" class="chk_service"><strong>*<span class="skip">필수</span></strong> 이용약관 동의 <a href="#DevPolicyService" class="mbrBtnPolicy devPolicyService">약관보기</a></label>
        <div id="DevPolicyService" class="policyTplBox" style="display: none;">
            <div class="pvsSec pvsCntTp">
    <ol>
        <li>
            <dl>
                <dt><a name="gg01" id="gg01"></a><strong>제 1 조 (목적) </strong></dt>
                <dd>본 약관은 잡코리아 유한회사 (이하 &quot;회사&quot;)가 운영하는 &quot;서비스&quot;를 이용함에 있어 &quot;회사&quot;와 회원간의 이용 조건 및 제반 절차, 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 한다.</dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg02" id="gg02"></a><strong>제 2 조 (용어의 정의) </strong></dt>
                <dd>
                    <p>이 약관에서 사용하는 용어의 정의는 아래와 같다.</p>
                    <ol>
                        <li>
                            ① &quot;사이트&quot;라  함은 회사가 서비스를 &quot;회원&quot;에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 설정한 가상의 영업장 또는 회사가 운영하는 웹사이트, 모바일웹, 앱 등의 서비스를 제공하는 모든 매체를 통칭하며, 통합된 하나의 회원 계정(아이디 및 비밀번호)을 이용하여 서비스를 제공받을 수 있는 아래의 사이트를 말한다.
                            <ul>
                                <li>- www.jobkorea.co.kr </li>
                                <li>- www.albamon.com </li>
                                <li>- www.campusmon.com </li>
                                <li>- m.jobkorea.co.kr</li>
                                <li>- m.albamon.com</li>
                            </ul>
                        </li>
                        <li>
                            ② &quot;서비스&quot;라 함은 회사가 운영하는 사이트를 통해  기업(단체, 사업자, 교육기관)이 직원채용을 목적으로 등록하는 자료를 DB화하여 각각의 목적에 맞게 분류 가공, 집계하여 정보를 제공하는 서비스와 사이트에서 제공하는 모든 부대 서비스를 말한다.
                        </li>
                        <li>
                            ③ &quot;회원&quot;이라 함은 자사의 직접 고용의 목적으로 채용을 원하는 기업이  본 서비스를 이용하기 위하여 동 약관에 동의하고 &quot;회사&quot;와 서비스 이용계약을 체결하여 아이디를 부여받은 “기업회원”을 말하며 자사의 직접 고용을 목적으로 하지 않는 헤드헌팅, 아웃소싱(도급), 인재파견, 채용대행 등 인력 중개를 주 목적으로 사업을 수행하는  업체는 별도의 “서치펌회원” 또는 “파견대행회원”으로 가입하여야 한다.<br>
                            단, "회사"와 별도의 계약 또는 이에 준하는 채용서비스를 이용하는 아웃소싱(도급), 채용대행 기업에 한해 "기업회원" 가입이 가능하며, 알바몬(www.albamon.com)의 경우 직접 고용 여부와 상관없이 “기업회원”으로 이용할 수 있다.
                        </li>
                        <li>④ &quot;아이디&quot;라  함은 회원가입시 회원의 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 &quot;회사&quot;가 부여하는 문자와 숫자의 조합을 말한다. </li>
                        <li>⑤ &quot;비밀번호&quot;라 함은 위 제4항에 따라 회원이 회원가입시 아이디를 설정하면서 아이디를 부여받은 자와 동일인임을 확인하고 &quot;회원&quot;의 권익을 보호하기 위하여 &quot;회원&quot;이 선정한 문자와 숫자의 조합을 말한다.</li>
                        <li>⑥ "비회원"이라 함은 회원가입절차를 거치지 않고 "회사"가 제공하는 서비스를 이용하거나 하려는 자를 말한다.</li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg03" id="gg03"></a><strong>제 3 조 (약관의 명시와 개정) </strong></dt>
                <dd>
                    <ol>
                        <li>① &quot;회사&quot;는 이 약관의 내용과 상호, 영업소 소재지, 대표자의 성명, 사업자등록번호, 연락처 등을 이용자가 알 수 있도록 초기 화면에 게시하거나 기타의 방법으로 이용자에게 공지해야 한다. </li>
                        <li>② &quot;회사&quot;는 약관의 규제에 관한 법률, 전기통신기본법, 전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있다. </li>
                        <li>③ &quot;회사&quot;가 약관을 개정할 경우 적용일자 및 개정사유를  명시하여 현행약관과 함께 그 개정약관의 적용일자 7일 전부터 적용일자 전일까지 공지한다. 단 &quot;회원&quot;의 권리, 의무에 중대한 영향을 주는 변경의 경우에는 적용일자 30일 전부터  공지하도록 한다. </li>
                        <li>④ &quot;회원&quot;은  변경된 약관에 대해 거부할 권리가 있다. &quot;회원&quot;은 변경된 약관이 공지된 지 15일 이내에 거부의사를 표명할 수 있다. &quot;회원&quot;이  거부하는 경우 본 서비스 제공자인 &quot;회사&quot;는 15일의 기간을 정하여 &quot;회원&quot;에게 사전 통지 후 당해 &quot;회원&quot;과의  계약을 해지할 수 있다. 만약, &quot;회원&quot;이  거부의사를 표시하지 않거나, 전항에 따라 시행일 이후에 &quot;서비스&quot;를 이용하는 경우에는 동의한 것으로 간주한다. </li>
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
                        <li>② 각 사이트  및 서비스 이용약관이 있는 경우에는 서비스 이용약관이 우선한다.</li>
                        <li>③ &quot;회원&quot;이 &quot;회사&quot;와 개별 계약을 체결하여 서비스를 이용할 경우에는 개별 계약이 우선한다.</li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg05" id="gg05"></a><strong>제 5 조 (이용계약의 성립) </strong></dt>
                <dd>
                    <ol>
                        <li>① &quot;회사&quot;의 서비스 이용계약(이하 &quot;이용계약&quot;)은 서비스를 이용하고자 하는 자가 본 약관과 개인정보처리방침을 읽고 &quot;동의&quot; 또는 &quot;확인&quot; 버튼을 누른 경우 본 약관에 동의한 것으로 간주한다.</li>
                        <li>② 서비스 이용계약 체결에 필요한 경우 &quot;회사&quot;는 전문기관을 통한 실명확인 및 본인인증을 요청할 수 있다. &quot;회원&quot;은 본인인증에 필요한 이름, 생년월일, 연락처 등을 제공하여야 한다, 또한 서비스 이용을 위해 회사명과 사업자등록번호를 제공하여야 하며 &quot;회사&quot;는 기업인증을 위해 사업자정보를 확인할 수 있는 증명서(사업자등록증)를 별도로 요구할 수 있다. 회사명과 사업자등록번호를 허위로 등록한 경우, 휴·폐업 사업자등록번호로 등록한 경우에 "회원"은 일체의 권리를 주장할 수 없다.</li>
                        <li>③ 회사는 회원 약관에 동의한 &quot;회원&quot;에 웹상의 안내 및 전자메일로 통지함으로써 서비스 이용계약의 성립을 확인한다.</li>
                        <li>④ 사업자등록번호가 없는 기관이나 단체는 &quot;회사&quot;가 정한 별도의 절차에 따라 이용계약을 할 수 있다.</li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg06" id="gg06"></a><strong>제 6 조 (이용신청의 승낙과 제한) </strong></dt>
                <dd>
                    <ol>
                        <li>① &quot;회사&quot;는 전조의 규정에 의한 이용신청 고객에 대하여  업무수행상 또는 기술상 지장이 없는 경우에는 원칙적으로 접수순서에 따라 서비스 이용을 승낙한다. </li>
                        <li>
                            ② &quot;회사&quot;는 아래 사항에 해당하는 경우에 대해서는 서비스 이용신청을 승낙하지 아니한다.
                            <ol>
                                <li>1. 실제 회사명과 사업자등록번호가 아니거나 타사의 정보를 이용하여 신청한 경우 </li>
                                <li>2. 이용계약 신청서의 내용을 허위로 기재하거나 &quot;회사&quot;가 제시하는 내용을 기재하지 않은 경우</li>
                                <li>3. 이용자의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우</li>
                            </ol>
                        </li>
                        <li>
                            ③ &quot;회사&quot;는 아래 사항에 해당하는 경우에는 그 신청에  대하여 승낙제한 사유가 해소될 때까지 승낙을 유보할 수 있다.
                            <ol>
                                <li>1.  &quot;회사&quot;가  설비의 여유가 없는 경우 </li>
                                <li>2.  &quot;회사&quot;의  기술상 지장이 있는 경우 </li>
                                <li>3. 기타 &quot;회사&quot;의 귀책사유로 이용승낙이 곤란한 경우</li>
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
                            ① &quot;회사&quot;는 제2조  2항의 서비스를  제공할 수 있으며 그 내용은 다음 각 호와 같다.
                            <ol>
                                <li>1. 채용정보 등록서비스 </li>
                                <li>2. 온라인 채용관리 서비스 </li>
                                <li>3. 구인/구직과 관련된 제반 서비스 </li>
                                <li>4. 이력서 열람 서비스 </li>
                                <li>5. 이용자간의  교류와 소통과 관련된 서비스 </li>
                                <li>6. 자료 거래에  관련된 서비스 </li>
                                <li>7. 기타 &quot;회사&quot;가 추가 개발하거나 제휴계약 등을 통해 &quot;회원&quot;에게 제공하는 일체의 서비스 </li>
                            </ol>
                        <li>② &quot;회사&quot;는 필요한 경우 서비스의 내용을 추가 또는  변경할 수 있다. 단, 이 경우 &quot;회사&quot;는 추가 또는 변경내용을 &quot;회원&quot;에게 공지해야  한다.</li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg08" id="gg08"></a><strong>제 8 조 (&quot;회원&quot;정보, 채용공고 등록, 이력서검색) </strong></dt>
                <dd>
                    <ol>
                        <li>① &quot;회원&quot;은 구직을 원하는 개인회원이 채용공고를 열람한 후 해당 기업에 대한 판단을 돕기 위해 기업정보를 정확히 기재하여야 한다. </li>
                        <li>
                            ② &quot;회원&quot;은 직업안정법 제34조 및 동법 시행령 제 34조 거짓구인광고의 범위에 위배되지 않도록 채용공고를 작성하여 등록해야 하며 그 내용은 다음과 같다.
                            <ol>
                                <li>1. 구인을 가장하여 물품판매, 수강생 모집, 직업소개, 부업알선, 자금모집 등을 행하는 광고</li>
                                <li>2. 거짓 구인을 목적으로 구인자의 신원(업체명 또는 성명)을 표시하지 아니하는 광고</li>
                                <li>3. 구인자가 제시한 직종, 고용형태, 근로조건 등이 응모할 때의 그것과 현저히 다른 광고 </li>
                                <li>4. 기타 광고의 중요내용이 사실과 다른 광고 </li>
                            </ol>
                        <li>③ &quot;회원&quot;은 관련 법률에 의거하여 근로자의 모집 및 채용에 있어서 남녀, 연령을 차별하여서는 아니되며 15세 미만 채용 모집을 할 수 없다. </li>
                        <li>④ 제2항, 제3항을 위반한 경우  이에 대한 책임은 전적으로 &quot;회원&quot;에게 있다. </li>
                        <li>⑤ &quot;회사&quot;는 &quot;회원&quot;이 등록한 기업정보 및 채용공고를 &quot;회사&quot;가 정한 방법에 의해 노출할 수 있다. </li>
                        <li>⑥ &quot;회원&quot;은 직원 채용의 목적으로 유·무료로 개인회원이  등록한 이력서를 검색할 수 있으며 &quot;회원&quot;은 &quot;회사&quot;가 제시하는 별도의 커뮤니케이션을 통하여 개인회원에게 연락을 취할 수 있다. 단, 이력서 연락처의 열람 및 연락의 목적은 직원채용활동에 국한되어야 하며, 기업의 영업·마케팅·제3자 제공 시에는 개인정보보호법, 직업안정법, 정보통신망이용촉진 및 정보보호 등에 관한 법률에 의거하여 법적 책임을 질 수 있다.</li>
                        <li>⑦ &quot;회원&quot;이 제2조 제 3항에 따라 자사의  직접 고용을 목적으로 하지 않는 헤드헌팅, 아웃소싱(도급), 인재파견, 채용대행 등 인력 중개를 목적으로 하는 채용공고를 등록할 경우 &quot;회사&quot;는 해당 공고를 삭제할 수 있으며 &quot;기업회원&quot;의 자격을 &quot;서치펌회원 또는 파견·대행회원&quot;으로 전환시킬 수 있다. 단, 인력 중개를 목적으로 하는 채용공고의 경우에도 제2조 제3항의 예외 기준에 따라 가입된 "기업회원"에 한해서는 예외로 하며, 알바몬(www.albamon.com)의 경우 직접 고용 여부와 상관없이  “기업회원”으로 이용할 수 있다. </li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg9" id="gg9"></a><strong>제 9 조 (제휴를 통한 서비스) </strong></dt>
                <dd>
                    <ol>
                        <li>① &quot;회사&quot;는 제휴 관계를 체결한 여타  인터넷 웹사이트 및 채용박람회 또는 신문, 잡지 등의 오프라인 매체를 통해 사이트에 등록한 &quot;회원&quot;의 기업정보와 채용공고가 열람될 수 있도록  서비스를 제공할 수 있다. </li>
                        <li>② &quot;회사&quot;는 제휴를 통해 타 사이트 및 매체에 등록될  수 있음을 고지해야 하며, 제휴 사이트 목록을 사이트내에서 상시 열람할 수 있도록 해야 한다. 단, 등록의 형태가 &quot;회사&quot;가 직접 구축하지 않고, 제휴사가 xml 또는 api 형태로 &quot;회사&quot;로부터 제공 받아 구축한 매체 목록은 본 약관외 별도의 제휴리스트에서 열람할 수 있도록 한다.</li>
                        <li>
                            ③ &quot;회사&quot;는 다음 각 호의 사이트와 제휴를 통해 &quot;회원&quot;이 등록한 기업정보와 채용정보를 제공한다.
                            <ol>
                                <li>1. 워크넷 http://www.work.go.kr</li>
                            </ol>
                        </li>
                        <li>④ &quot;제9조 ③항&quot; 제휴를 통한 사이트의 변동사항 발생 시 공지사항을 통해 고지 후 진행 한다.</li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg10" id="gg10"></a><strong>제 10 조 (서비스의 요금) </strong></dt>
                <dd>
                    <ol>
                        <li>① &quot;회원&quot; 가입과 채용공고  등록비용은 무료이다. 다만 개인회원 또는 사이트에 방문한 회원에게 자신의 정보를 보다 효과적으로 노출시키기 위한 유료옵션과 즉시등록 서비스, 유료 이력서 검색 및 기타 서비스를 이용하기 위한 별도의 서비스는 유료로 제공될 수 있다. </li>
                        <li>② &quot;회사&quot;는 유료서비스를 제공할 경우 사이트에 요금에  대해서 공지를 하여야 한다. </li>
                        <li>③ &quot;회사&quot;는 유료서비스 이용금액을 서비스의 종류 및  기간에 따라 &quot;회사&quot;가 예고 없이 변경할  수 있다. 다만, 변경 이전에 적용 또는 계약한 금액은 소급하여 적용하지 아니한다.<br>④ 유료 서비스 신청 후 &quot;회원&quot; 사정에 의해 서비스가 취소될 경우, 정부가 고시하는 '콘텐츠 이용자 보호지침'에 따라 &quot;회사&quot;는 본 지침이 제시하는 범위 내에서 환불 수수료를 부과할 수 있다.</li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg11" id="gg11"></a><strong>제 11 조 (e-머니 및 충전금 규정) </strong></dt>
                <dd>
                    <ol>
                        <li>① e-머니는 유료상품 구매 시의 사은, 이벤트, 고객보상 등의 사유로 적립된다.'적립된 e-머니'는 유료상품 결제시 사용할 수 있으며, 현금으로 출금되지 않는다.</li>
                        <li>② 위의 적립사유가 해제되었을 경우, ‘적립된 e-머니’를 회원보유분에서 회수하며, 결제시 사용한 서비스를 취소할 경우, 사용분에 해당하는 e-머니를 제외하고 사용이전의 상태로 재적립 받을 수 있다.</li>
                        <li>③ 서비스 운영 정책에 따라 e-머니의 상품별 적립기준, 적립비율, 사용조건 및 제한 등은 달라질 수 있으며, 이에 대한 사항은 서비스 화면에 게시하거나 통지한다.  e-머니 적립 시 별도의 유효기간을 정한 바가 없으면 적립일로부터 12개월의 유효기간을 보장한다.  </li>
                        <li>④ e-머니의 적립시점과 무관하게 유효기간이 지나거나, &quot;회원&quot;이 12개월 동안 사이트에 로그인 하지 않을 경우, &quot;회원&quot;이 가입해지한 경우, 제19조 ②항에 의해 가입해지하거나 서비스가 중지된 경우 e-머니는 전액 자동소멸되어 복구되지 않는다. </li>
                        <li>⑤ &quot;회원&quot;인 개인사업자와 법인사업자의 휴·폐업 여부가 회사가 정한 별도의 절차에 따라 확인된 경우 적립된 e-머니는 전액 소멸된다.</li>
                        <li>⑥ 충전금은 &quot;회사&quot;가 정한 결제수단을 이용하여 미리 입금해 둔 금액으로, &quot;회사&quot;의 유료서비스 결제 시 사용할 수 있다.</li>
                        <li>⑦ 서비스 운영정책에 따라 충전금을 구매할 수 있는 수단, 충전금으로 결제할 수 있는 유료서비스 등은 달라질 수 있으며, 이에 대한 사항은 서비스 화면에 게시하거나 공지한다. </li>
                        <li>⑧ &quot;회원&quot;은 &quot;회사&quot;에 잔여 충전금의 환불을 요청할 수 있으며, &quot;회사&quot;는 &quot;회원&quot;에게 환불에 필요한 서류를 요청할 수 있다. 환불 시 환불수수료를 공제하고 환불할 수 있으며, 충전금 충전방법에 따라 금융비용이 환불수수료를 초과하여 발생할 경우 이는 &quot;회원&quot;의 부담으로 한다. </li>
                        <li>⑨ 잔여 충전금 중 충전일로부터 5년이 초과할 때까지 이용하지 않은 금액은 상사소멸시효에 따라 소멸된다. </li>
                        <li>⑩ 회원탈퇴 시 보유중인 충전금은 환불을 요청할 수 있으며, 이와 같은 절차없이 회원탈퇴한 경우 충전금은 전액 자동소멸되어 복구되지 않는다.</li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg12" id="gg12"></a><strong>제 12 조 (서비스 이용시간) </strong></dt>
                <dd>
                    <ol>
                        <li>① &quot;회사&quot;는 특별한 사유가 없는 한 연중무휴, 1일 24시간 서비스를 제공한다.  다만, &quot;회사&quot;는 서비스의  종류나 성질에 따라 제공하는 서비스 중 일부에 대해서는 별도로 이용시간을 정할 수 있으며, 이 경우 &quot;회사&quot;는 그 이용시간을 사전에 &quot;회원&quot;에게 공지 또는  통지하여야 한다. </li>
                        <li>② &quot;회사&quot;는 자료의 가공과 갱신을 위한 시스템 작업시간, 장애해결을 위한 보수작업 시간, 정기 PM작업, 시스템 교체작업, 회선  장애 등이 발생한 경우 일시적으로 서비스를 중단할 수 있으며 계획된 작업의 경우 공지란에 서비스 중단 시간과 작업 내용을 알려야 한다. 다만, &quot;회사&quot;가 사전에 통지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수 있다.</li>
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
                            ① &quot;회사&quot;는 다음 각 호에 해당하는 경우 서비스의  제공을 중지할 수 있다.
                            <ol>
                                <li>1. 설비의 보수 등 &quot;회사&quot;의 필요에 의해 사전에 &quot;회원&quot;들에게 통지한 경우 </li>
                                <li>2. 기간통신사업자가 전기통신서비스 제공을 중지하는 경우 </li>
                                <li>3. 기타 불가항력적인 사유에 의해 서비스 제공이 객관적으로 불가능한 경우 </li>
                            </ol>
                        </li>
                        <li>② 전항의 경우, &quot;회사&quot;는 기간의 정함이 있는 유료서비스 이용자들에게는  그 이용기간을 연장하는 등의 방법으로 손실을 보상하여야 한다.</li>
                        <li>③ &quot;회원&quot;인 개인사업자와 법인사업자의  휴·폐업 여부가 회사가 정한 별도의 절차에 따라 확인된 경우 유료 이력서 검색서비스(건수별 인재검색)의 경우 적립된 건수는 모두 소멸된다.</li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg14" id="gg14"></a><strong>제 14 조 (정보의 제공 및 광고의 게재) </strong></dt>
                <dd>
                    <ol>
                        <li>① &quot;회사&quot;는 &quot;회원&quot;에게 서비스 이용에 필요가 있다고  인정되거나 서비스 개선 및 회원대상의 서비스 소개 등의 목적으로 하는 각종 정보에 대해서 전자우편이나 서신우편을 이용한 방법으로 제공할 수 있다. </li>
                        <li>② &quot;회사&quot;는 제공하는 서비스와 관련되는 정보 또는 광고를 서비스 화면, 홈페이지, 전자우편 등에 게재할 수 있으며, 광고가 게재된 전자우편을 수신한 &quot;회원&quot;은 수신거절을 &quot;회사&quot;에게 할 수 있다.</li>
                        <li>③ &quot;회사&quot;는 서비스상에 게재되어 있거나 본 서비스를  통한 광고주의 판촉활동에 &quot;회원&quot;이 참여하거나 교신 또는 거래를 함으로써 발생하는 모든 손실과 손해에 대해 책임을 지지 않는다. </li>
                        <li>④ 본 서비스의 &quot;회원&quot;은 서비스  이용 시 노출되는 광고게재에 대해 동의 하는 것으로 간주한다.</li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg15" id="gg15"></a><strong>제 15 조 (자료내용의 책임과 &quot;회사&quot;의 정보 수정 권한) </strong></dt>
                <dd>
                    <ol>
                        <li>① 자료내용은 &quot;회원&quot;이 등록한  기업정보 및 채용공고와 사이트에 게시한 게시물을 말한다. </li>
                        <li>② &quot;회원&quot;은 자료 내용 및 게시물을  사실에 근거하여 성실하게 작성해야 하며, 만일 자료의 내용이 사실이 아니거나 부정확하게 작성되어 발생하는  모든 책임은 &quot;회원&quot;에게 있다. </li>
                        <li>③ 모든 자료내용의 관리와 작성은  &quot;회원&quot; 본인이 하는 것이 원칙이나 사정상 위탁 또는 대행관리를 하더라도 자료내용의 책임은 &quot;회원&quot;에게 있으며 &quot;회원&quot;은 주기적으로 자신의 자료를 확인하여  항상 정확하게 관리가 되도록 노력해야 한다. </li>
                        <li>④ &quot;회사&quot;는 &quot;회원&quot;이 등록한 자료 내용에 오자, 탈자 또는 사회적 통념에 어긋나는 문구와 내용이 있을 경우 이를 언제든지 수정할 수 있다.</li>
                        <li>⑤ &quot;회원&quot;이 등록한 자료로 인해 타인(또는 타법인)으로부터 허위사실 및 명예훼손 등으로 삭제 요청이 접수된 경우 &quot;회사&quot;는 &quot;회원&quot;에게 사전 통지 없이 본 자료를 삭제할 수 있으며 삭제 후 메일 등의 방법으로 통지할 수 있다.</li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg16" id="gg16"></a><strong>제 16 조 (자료 내용의 활용 및 취급) </strong></dt>
                <dd>
                    <ol>
                        <li>① &quot;회원&quot;이 입력한 정보는 취업 및 관련 동향의 통계 자료로 활용될 수 있으며 그 자료는 매체를 통한 언론 배포 또는 제휴사에게 제공될 수 있다.</li>
                        <li>② &quot;사이트&quot;에서 정당한 절차를 거쳐 열람한 개인회원의 이력서 정보는 해당 &quot;회원&quot;의 인사자료이며 이에 대한 관리 권한은 해당 &quot;회원&quot;의 정책에 의한다.</li>
                        <li>③ &quot;회사&quot;는 &quot;사이트&quot;의 온라인 입사지원 시스템을  통해 지원한 개인회원의 이력서 열람 여부 및 &quot;회원&quot;이 제공한 채용정보에 입사지원한 구직자들의 각종 통계데이터를 개인회원에게 제공할 수 있다 . </li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg17" id="gg17"></a><strong>제 17 조 (&quot;회사&quot;의 의무) </strong></dt>
                <dd>
                    <ol>
                        <li>① &quot;회사&quot;는 본 약관에서 정한 바에 따라 계속적, 안정적으로 서비스를 제공할 수 있도록 최선의 노력을 다해야 한다. </li>
                        <li>② &quot;회사&quot;는 서비스와 관련한 &quot;회원&quot;의 불만사항이 접수되는  경우 이를 즉시 처리하여야 하며, 즉시 처리가 곤란한 경우에는 그 사유와 처리일정을 서비스 화면 또는  기타 방법을 통해 동 &quot;회원&quot;에게 통지하여야 한다. </li>
                        <li>③ &quot;회사&quot;는 유료 결제와 관련한 결제 사항 정보를 1년 이상 보존한다. 다만 회원 자격이 없는 회원은 예외로 한다. </li>
                        <li>④ 천재지변 등 예측하지 못한  일이 발생하거나 시스템의 장애가 발생하여 서비스가 중단될 경우 이에 대한 손해에 대해서는 &quot;회사&quot;가 책임을 지지 않는다. 다만 자료의 복구나 정상적인 서비스  지원이 되도록 최선을 다할 의무를 진다. </li>
                        <li>⑤ &quot;회원&quot;의 자료를 본 서비스  이외의 목적으로 제3자에게 제공하거나 열람시킬 경우 반드시 &quot;회원&quot;의 동의를 얻어야 한다. </li>
                        <li>⑥ &quot;회원&quot;이 &quot;사이트&quot;에 등록한 기업정보, 채용공고 내용은 사이트를 방문하는 일반 대중에게 공개함을 원칙으로 한다.</li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg18" id="gg18"></a><strong>제 18 조 (&quot;회원&quot;의 의무) </strong></dt>
                <dd>
                    <ol>
                        <li>① &quot;회원&quot;은 관계법령과 본 약관의  규정 및 기타 &quot;회사&quot;가 통지하는 사항을  준수하여야 하며, 기타 &quot;회사&quot;의 업무에 방해되는 행위를 해서는 안 된다. </li>
                        <li>② &quot;회원&quot;이 신청한 유료서비스는  등록 또는 신청과 동시에 &quot;회사&quot;와 채권, 채무 관계가 발생하며, &quot;회원&quot;은 이에 대한 요금을 지정한 기일 내에  납부하여야 한다. </li>
                        <li>③ &quot;회원&quot;이 결제 수단으로 신용카드를  사용할 경우 비밀번호 등 정보 유실 방지는 &quot;회원&quot; 스스로 관리해야 한다. 단, &quot;사이트&quot;의 결함에 따른 정보유실의 발생에 대한 책임은 회원의 의무에 해당하지 아니한다.</li>
                        <li>④ &quot;회원&quot;은 서비스를 이용하여  얻은 정보를 &quot;회사&quot;의 사전동의 없이 복사, 복제, 번역, 출판, 방송 기타의 방법으로 사용하거나 이를 타인에게 제공할 수 없다. </li>
                        <li>
                            ⑤ &quot;회원&quot;은 본 서비스를 건전한 직원채용 이외의 목적으로  사용해서는 안되며 이용 중 다음 각 호의행위를 해서는 안 된다.
                            <ol>
                                <li>1. 다른 회원의 아이디를 부정 사용하는 행위 </li>
                                <li>2. 범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위 </li>
                                <li>3. 타인의 명예를 훼손하거나 모욕하는 행위 </li>
                                <li>4. 타인의 지적재산권 등의 권리를 침해하는 행위 </li>
                                <li>5. 해킹행위 또는 바이러스의 유포 행위 </li>
                                <li>6. 타인의 의사에 반하여 광고성 정보 등 일정한 내용을 계속적으로 전송하는 행위 </li>
                                <li>7. 서비스의 안정적인 운영에 지장을 주거나 줄 우려가 있다고 판단되는 행위 </li>
                                <li>8. 사이트의 정보 및 서비스를 이용한 영리 행위 </li>
                                <li>9. 그밖에 선량한 풍속, 기타 사회질서를 해하거나 관계법령에 위반하는 행위</li>
                            </ol>
                        </li>
                        <li>⑥ &quot;회원&quot;은 &quot;사이트&quot;를 통해 열람한 이력서 정보를 &quot;회사&quot; 및 당사자의 허락없이 재배포할 수 없으며 본 정보에 대한 출력 및 복사 등의 관리 책임은 전적으로 &quot;회원&quot;에게 있다. </li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg19" id="gg19"></a><strong>제 19 조 (&quot;회원&quot;의 가입해지/서비스중지/자료삭제) </strong></dt>
                <dd>
                    <ol>
                        <li>① &quot;회원&quot;은 언제든지 회원탈퇴 또는 채용공고 등록을 해지하기 위해 고객센터  또는 회원탈퇴 메뉴 등을 통하여 이용계약 해지 신청을 할 수 있으며, &quot;회사&quot;는 관련법 등이 정하는 바에 따라 이를 처리한다.</li>
                        <li>
                            ② 다음의 사항에 해당하는 경우 &quot;회사&quot;는 사전 동의없이 가입해지나 서비스 중지, 채용공고 삭제 조치를 취할 수 있다.
                            <ol>
                                <li>1. 회원의 의무를 성실하게 이행하지 않았을 때 </li>
                                <li>2. 규정한 유료서비스 이용 요금을 납부하지 않았을 때 </li>
                                <li>3. 불순한 의도로 유료서비스를 반복적으로 결제/취소할  때 </li>
                                <li>4. 본 서비스 목적에 맞지 않는 분야에 정보를 활용하여 사회적 물의가 발생한  때 </li>
                                <li>5. 회원이 등록한 정보의 내용이 사실과 다르거나 조작되었을 때 </li>
                                <li>6. 사업자등록증에 나타난 정보와 기업회원 가입시의 정보가 일치하지 않을 때 </li>
                                <li>7. 타 기업의  사업자등록번호나 상호를 도용하여 허위로 기업정보를 등록하거나 휴·폐업 사업자등록번호로 기업정보를 등록했을 때 </li>
                                <li>8. 지사, 지점, 영업소 등의 경우 구체적인 지사, 지점, 영업소 명칭을 사용하지 않고 기업명을 등록했거나 지사, 지점, 영업소의 사업자등록번호가 별도 있음에도 불구하고 본사의 사업자등록번호로 기업회원 가입을 했을 때 </li>
                                <li>9. 회사명, 담당자 성명, 사무실 연락처 등 구인업체의 중요 정보를 정확하게 기입하지 않았을 때 </li>
                                <li>10. 기업회원 가입 또는 채용공고 등록시 본 서비스에서 안내하는 방법으로 가입하지  않았거나 등록하지 않았을 때 </li>
                                <li>11. 동일 회원ID로 마감일이 지나지  않은 사실상의 동일 내용의 채용공고를 중복 등록했을 때 </li>
                                <li>12. 동일  사업자가 마감일이 지나지 않은 사실상의 동일내용의 채용공고를 다수 ID를 사용하여 중복등록 했을 때 </li>
                                <li>13. 허위 구인공고를 등록했을 때 </li>
                                <li>14. 작성자가 제시한 직종, 업무내용, 근로조건 등이 실제와 현저히 다를 때 </li>
                                <li>15. 채용공고의 모집요강만으로 업무에 대한 내용이 명확하지 않을 때 </li>
                                <li>
                                    16. 모집요강에 적합한 업직종 분류를 지정하지 않았을 때 <br>
                                    (특히, 교육기관이나 이벤트업체  또는 영업대행 기관의 경우 영업, 마케팅, 텔레마케팅, 상담 인력을 모집하고자 할 경우 반드시 텔레마케팅 또는 고객상담, 교육/강사/학원 등 반드시 직접 관련되는 해당 업종, 직종 분류만 지정해야 한다.)
                                </li>
                                <li>17. 제2조 제3항의 예외 기준에 따라 가입된 "기업회원"이 아닌 "회원"이 자사의  직접 고용을 목적으로 하지 않는 헤드헌팅, 아웃소싱(도급), 인재파견, 채용대행 등 인력 중개를 주 목적으로 사업을 수행하는 업체의 경우 </li>
                                <li>18. 다단계, 피라미드 식의 모집 내용을  등록했을 때 </li>
                                <li>19. 구인을 가장하여 유학알선, 물품판매, 자금  모금 등을 행하는 내용을 등록했을 때 </li>
                                <li>20. 회원모집 형태의 광고 또는 카드회원 모집(수당제  광고) 내용을 등록했을 때 </li>
                                <li>21. 추천인 모집 광고, 재택 쇼핑몰  분양 광고, 직업소개, 부업알선 광고를 등록했을 때 </li>
                                <li>22. 취업수수료 등 취업 관련 비용을 필요로 하는 채용공고를 등록했을 때 (운송, 물류, 지입, 인력용역 등) </li>
                                <li>23. 불건전한 내용의 유흥업소 채용공고를 등록했을 때 </li>
                                <li>24. 구직자의 피해사례 (채용공고를 통해 구직자가 입사 과정에서 피해가 발생한 경우 또는 재직중 "기업회원"이 관계법령을 위반하여 피해가 발생한 경우 등)가 접수된 채용공고 </li>
                                <li>25. 임금체불로 근로감독원에 진정서가 접수되거나, 관계 당국에 고소·고발되어 있는 기업 (단, 기업의 임금체불이 해소가 입증되면 확인 후에 서비스 이용 가능) </li>
                                <li>26. 본 서비스와 관련하여 회사 또는 제3자의 명예를 훼손하였을 때</li>
                                <li>27. 동업자 모집, 프랜차이즈 모집, 점포개설, 창업, 사이트 홍보 등 직원 채용이 아닌 공고를 등록했을 때</li>
                                <li>28. 기타 관계법규에 위배되는 내용이거나 사이트의 원활한 운영을 위하여 운영자가  필요하다고 판단한 경우 </li>
                            </ol>
                        </li>
                        <li>③ &quot;회원&quot;이 유료서비스를 이용하는  중 &quot;회사&quot;의 책임에 의해 정상적인 서비스가  제공되지 않을 경우 &quot;회원&quot;은 본 서비스의 해지를 요청할 수 있으며 &quot;회사&quot;는 기간의 정함이 있는 유료서비스의 경우에는 해지일까지 이용일수를 1일 기준금액으로 계산하여 이용금액을 공제후 환급하고, 이용건수의 정함이 있는 유료서비스의 경우에는 기 사용분을 1건 기준금액으로 계산하여 이용금액을 공제후 환급한다. 단, 허위·불량공고의 경우 게재시 지불된 광고료는 일체 반환되지 않는다. </li>
                        <li>④ &quot;회원&quot;인 개인사업자와 법인사업자의 휴·폐업 여부가 회사가 정한 별도의 절차에 따라 확인된 경우 유료 이력서 검색서비스(건수별 인재검색)의 경우 적립된 건수는 모두 소멸된다. </li>
                        <li>⑤ &quot;회사&quot;는 회원 가입이 해지된 경우 해당 회원 정보를 모두 삭제하여야 하며,  상법, 전자상거래등에서의 소비자보호에 관한 법률 등 관계법령의 규정에 의하여 보존할 필요가  있는 경우 관계법령에서 정한 일정한 기간 동안 회원정보를 보관한다.</li>
                        <li>
                            ⑥ 개인정보보호를 위하여 "회원"이 선택한 개인정보 보유기간(1년, 3년, 회원탈퇴시) 동안 "사이트"를 이용하지 않은 경우, "아이디"를 "휴면계정"으로 분리하여 해당 계정의 이용을 중지할 수 있다.
                        </li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg20" id="gg20"></a><strong>제 20 조 (허위 구인광고 경고) </strong></dt>
                <dd>
                    <p>허위 구인광고로 인해 발생된  문제에 따른 법적인 책임은 모두 작성자에게 있으며, 구인광고 게재시에 지불된 광고료는 일체 반환되지  않는다. 허위 구인광고 또는 허위 구인 조건을 제시한 자는 직업 안정법 제 47조에 의해 5년 이하의 징역 또는 2천만원 이하의 벌금형을 받게 된다.</p>
                </dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg21" id="gg21"></a><strong>제 21 조 (손해배상) </strong></dt>
                <dd>
                    <ol>
                        <li>① &quot;회사&quot;가 이 약관의 제7조, 제17조, 제19조 등의 규정에 위반한 행위로 &quot;회원&quot;에게 손해를 입히거나 기타 &quot;회사&quot;가 제공하는 모든 서비스와 관련하여 &quot;회사&quot;의 책임 있는 사유로 인해 &quot;회원&quot;에게 손해가 발생한 경우 &quot;회사&quot;는 그 손해를 배상하여야 한다. </li>
                        <li>② &quot;회사&quot;는 책임 있는 사유로 제공한 정보가 사실과  달라 &quot;회원&quot;이 손해를 입었을 경우에 &quot;회사&quot;는 그 손해를 배상하여야 한다. </li>
                        <li>③ &quot;회원&quot;이 이 약관의 제5조, 제18조, 제19조, 제20조 등의 규정에  위반한 행위로 &quot;회사&quot; 및 제3자에게 손해를 입히거나 &quot;회원&quot;의 책임 있는 사유에 의해 &quot;회사&quot; 및 제3자에게 손해를 입힌 경우에는 &quot;회원&quot;은 그 손해를 배상하여야  한다.</li>
                        <li>④ 타 회원(개인회원, 기업회원, 서치펌회원, 파견·대행회원, 교육기관회원 모두 포함)의 귀책사유로 &quot;회원&quot;의 손해가 발생한 경우 &quot;회사&quot;는 이에 대한 배상 책임이 없다.</li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg22" id="gg22"></a><strong>제 22 조 (이용요금 오류의 조정) </strong></dt>
                <dd>
                    <p>&quot;회사&quot;는 이용요금과 관련하여 오류가 있는 경우에 &quot;회원&quot;의 요청, 또는 &quot;회사&quot;의 사전 통지에 의하여 다음에 해당하는 조치를 취한다. </p>
                    <ol>
                        <li>1. 과다납입한 요금에 대하여는 그 금액을 반환한다. 다만, &quot;회원&quot;이 동의할 경우 다음 달에  청구할 요금에서 해당 금액만큼을 감하여 청구한다. </li>
                        <li>2. 요금을 반환받아야 할 &quot;회원&quot;이 요금체납이 있는 경우에는 반환해야 할 요금에서 이를 우선 공제하고 반환한다. </li>
                        <li>3. &quot;회사&quot;는 과소청구액에 대해서는 익월에 합산청구한다.
                    </ol>
                </dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg23" id="gg23"></a><strong>제 23 조 (&quot;회원&quot;의 개인정보보호) </strong></dt>
                <dd>&quot;회사&quot;는 &quot;회원&quot;의 개인정보보호를 위하여 노력해야 한다. &quot;회원&quot;의 개인정보보호에 관해서는 정보통신망이용촉진 및 정보보호 등에 관한 법률, 개인정보보호법에 따르고, &quot;사이트&quot;에 &quot;개인정보처리방침&quot;을 고지한다.</dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg24" id="gg24"></a><strong>제 24 조 (신용정보의 제공 활용 동의) </strong></dt>
                <dd>
                    <ol>
                        <li>① &quot;회사&quot;가 회원가입과 관련하여 취득한 &quot;회원&quot;의 신용정보를 타인에게 제공하거나 활용하고자 할 때에는 신용정보의 이용 및 보호에 관한 법률 제23조의 규정에 따라 사전에 그 사유 및 해당기관 또는 업체명 등을 밝히고 해당 &quot;회원&quot;의 동의를 얻어야 한다. </li>
                        <li>② 본 서비스와 관련하여 &quot;회사&quot;가 &quot;회원&quot;으로부터 신용정보의 이용 및 보호에 관한 법률에 따라 타인에게 제공 활용에 동의를 얻은 경우 &quot;회원&quot;은 &quot;회사&quot;가 신용정보 사업자 또는 신용정보 집중기관에 정보를 제공하여 &quot;회원&quot;의 신용을 판단하기 위한 자료로 활용하거나, 공공기관에서 정책자료로 활용되도록 정보를 제공하는 데 동의한 것으로 간주한다.</li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li>

            <dl>
                <dt><a name="gg25" id="gg25"></a><strong>제 25 조 (분쟁의 해결) </strong></dt>
                <dd>
                    <ol>
                        <li>① &quot;회사&quot;와 &quot;회원&quot;은 서비스와 관련하여 발생한 분쟁을  원만하게 해결하기 위하여 필요한 모든 노력을 하여야 한다. </li>
                        <li>② 전항의 노력에도 불구하고, 동 분쟁에 관한 소송은 &quot;회사&quot;의 주소지 관할법원으로 한다.</li>
                    </ol>
                </dd>
            </dl>
        </li>
        <li class="etc">
            <dl>
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
        <input type="checkbox" id="lb_chk_privacy" name="Priacy_Agree" class="mbrCheckOn devAgreeCheck" value="1">
        <label for="lb_chk_privacy" class="chk_privacy"><strong>*<span class="skip">필수</span></strong> 개인정보 수집 및 이용 동의 <a href="#DevPolicyPrivacy" class="mbrBtnPolicy devPolicyService">약관보기</a></label>
        <div id="DevPolicyPrivacy" class="policyTplBox" style="display: none;">
            <div class="pvsSec pvsTpList">
    <h2 class="pvsHeading2"><strong>1. 개인정보의 수집 및 이용목적</strong></h2>
    <p class="depth_01">회원의 취업과 인재채용 활동을 매개하는 온라인 리크루팅 사이트인 잡코리아, 알바몬, 캠퍼스몬(이하 "사이트")은 효과적인 취업지원 · 인재채용 · 경력개발에 적합한 서비스를 제공하기 위하여 개인정보를 수집하고 있으며 수집된 정보를 아래와 같이 이용하고 있습니다. 이용자가 제공한 모든 정보는 하기 목적에 필요한 용도 이외로는 사용되지 않으며 이용 목적이 변경될 시에는 사전 동의를 구할 것입니다.</p>
    <ol class="depth_01">
        <li>
            1) 회원관리
            <p class="depth_02">회원제 서비스 이용에 따른 본인확인, 본인의 의사확인, 고객문의에 대한 응답, 새로운 정보의 소개 및 고지사항 전달</p>
        </li>
        <li>
            2) 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
            <p class="depth_02">본인인증, 채용정보 매칭 및 컨텐츠 제공을 위한 개인식별, 회원간의 상호 연락, 구매 및 요금 결제, 물품 및 증빙발송, 부정 이용방지와 비인가 사용방지</p>
        </li>
        <li>
            3) 서비스 개발 및 마케팅·광고에의 활용
            <p class="depth_02">맞춤 서비스 제공, 서비스 안내 및 이용권유, 서비스 개선 및 신규 서비스 개발을 위한 통계 및 접속빈도 파악, 통계학적 특성에 따른 광고 게재, 이벤트 정보 및 참여기회 제공</p>
        </li>
        <li>4) 고용 및 취업동향 파악을 위한 통계학적 분석</li>
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
                        <li class="icon">필수항목: 가입자명, 본인인증정보 또는 중복가입확인정보(DI), 아이디, 비밀번호, 전화번호, e-메일, 기업형태, 사업자등록번호, 회사명, 회사주소</li>
                        <li class="icon">선택항목: 이메일 수신 설정, 가입경로, 팩스번호(알바몬), 홈페이지(알바몬)</li>
                    </ul>
                <li>
                    2) 채용정보 등록 시 수집하는 항목담당자의 정보는 채용 이외의 용도로 이용할 수 없으며, 신청하신 서비스의 원활한 이용과 정보도용 및 허위정보 게재로 인한 피해를 방지하기 위해 채용담당자의 개인정보를 확인하고 있습니다.
                    <ul class="depth_03">
                        <li class="icon">채용공고 등록 시: 담당자 이름, 연락처(전화번호/휴대폰번호) , e-메일</li>
                        <li class="icon">채용광고 신청 시: 회사명, 담당자 이름, 전화번호, e-메일</li>
												<li class="icon">인재서칭(이력서열람) 신청 시: 담당자 이름, 중복가입확인정보(DI), 소속부서, 연락처(전화번호/휴대폰번호), e-메일</li>
                    </ul>
                </li>
                <li>
                    3) 유료 정보 이용 시 수집하는 항목<br>유료 서비스 이용 과정에서 아래와 같은 결제 정보들이 수집될 수 있습니다.
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
                <li>5) 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.-IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록</li>
            </ol>
        </li>
        <li>
            나. 개인정보 수집방법<br>
            - 홈페이지, 서비스 이용, 이벤트 응모, 팩스, 우편, 전화, 고객센터 문의하기
        </li>
    </ol>

    <h2 class="pvsHeading2"><strong>3. 개인정보의 보유 및 이용기간</strong></h2>
    <p class="depth_01">
        "사이트"는 회원가입일로부터 서비스를 제공하는 기간 동안에 한하여 이용자의 개인정보를 보유 및 이용하게 됩니다. 회원탈퇴를 요청하거나 개인정보의 수집 및 이용에 대한 동의를 철회하는 경우, 수집 및 이용목적이 달성되거나 이용기간이 종료한 경우 개인정보를 지체 없이 파기합니다.<br>
        단, 다음의 경우에 대해서는 각각 명시한 이유와 기간 동안 보존합니다.
    </p>
    <ol class="depth_01">
        <li>1) 상법 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 법령에서 규정한 보존기간 동안 거래내역과 최소한의 기본정보를 보유합니다.<br>이 경우 회사는 보관하는 정보를 그 보관의 목적으로만 이용합니다.</li>
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
</div>
        </div>
    </div>

    <!--// 업무위탁동의 -->
    <div class="row policy_check_entrust">
        <input type="checkbox" id="lb_chk_entrust" name="Agree_Entrust" class="mbrCheckOn devAgreeCheck" value="29">
        <label for="lb_chk_entrust" class="chk_entrust">업무 위탁 동의 <a href="#DevPolicyEntrust" class="mbrBtnPolicy devPolicyService">약관보기</a></label>
        <div id="DevPolicyEntrust" class="policyTplBox">
            <p class="introTxt">잡코리아는 서비스 향상을 위해서 아래와 같이 개인정보를 위탁하고 있으며, 관계 법령에 따라 위탁계약 시 개인정보가 안전하게 관리될 수 있도록 필요한 사항을 규정하고 있습니다.</p>
<dl class="entrustCnt">
    <dt>1. 수탁업체</dt>
    <dd>잡코리아 유한회사 5개 영업대행사</dd>
    <dd>
        <ul>
            <li>- 경인지사 : (주)좋은일컴퍼니</li>
            <li>- 부산지사 : 좋은일컴퍼니 부산</li>
            <li>- 광주지사 : 광주전남 잡</li>
            <li>- 대전지사 : (주)데일리잡</li>
            <li>- 대구지사 : 대구경북울산잡</li>
        </ul>
    </dd>
    <dd style="margin-top:7px">알바몬 영업대행사</dd>
    <dd>
        <ul>
            <li>- (주)애드톡플러스</li>
            <li>- (주)트랜스코스모스코리아</li>
            <li>- (주)메타넷엠씨씨</li>
        </ul>
    </dd>
    <dt>2. 위탁 업무 내용</dt>
    <dd>
        <ul>
            <li>서비스 계약 안내</li>
            <li>서비스 이용 계약 체결</li>
            <li>고객센터 운영 및 상담</li>
            <li>컨텐츠 생성 및 제공</li>
        </ul>
    </dd>
    <dt>3. 개인정보 이용기간</dt>
    <dd>회원 탈퇴 시 혹은 위탁 계약 종료 시까지</dd>
</dl>
        </div>
    </div>
    <!-- 업무위탁동의 //-->


    <div class="notice_msg" id="notice_msg_agree" style="display:none;"><p class="failure">잡코리아 이용약관과 개인정보 수집 및 이용에 대한 안내를 모두 동의해주세요.</p></div>
</div>            <!-- 개인정보 유효기간 선택 -->
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
</div>            <div class="row_group line_none regist_complete" style="position:relative;">
                <div class="row">
                  <button type="submit" class="mbrBtnRegist dev-submit"><span>가입하기</span></button>
                </div>
            </div>

        </form>
    </fieldset>


</div>
    </div>

</body>
\