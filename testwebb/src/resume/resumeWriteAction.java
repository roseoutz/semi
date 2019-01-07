package resume;

import java.io.Reader;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import VO.khAwardVO;
import VO.khCareerVO;
import VO.khEduVO;
import VO.khIntroVO;
import VO.khPortVO;
import VO.khResumeVO;
import java.io.*;

public class resumeWriteAction extends ActionSupport implements SessionAware {
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private khResumeVO resumeClass; // 인적사항
	private khEduVO eduClass; // 학력
	private khAwardVO awardClass; // 수상 및 자격증
	private khCareerVO careerClass; // 경력
	private khPortVO portClass; // 포트폴리오
	private khIntroVO introClass; // 자기소개서
	
	private Map session;
	private String session_id;
	private int resume_no;
	
	// 인적사항
	private String resume_m_id;
	private String resume_addr;
	private String resume_subject;
	private String resume_date;
	private String resume_birth;
	private String resume_sex;
	
	//학력
	private String edu_school_type;
	private String edu_school;
	private String edu_enter_date;
	private String edu_graduate_date;
	private String edu_major;
	private String edu_grade;
	private String edu_graduate_status;
	
	//경력
	private String career_cname;
	private String career_dept;
	private String career_enter_date;
	private String career_leave_date;
	private String career_position;
	private String career_job;
	private String career_pay;
	private String career_explain;
	private String career_content;
	
	//수상
	private String award_name;
	private String award_publisher;
	private String award_date;
	
	//포트폴리오
	private File upload;
	private String contentType;
	private String uploadFileName;
	private String fileUploadPath="C:\\Java\\upload\\";
	
	private String port_url;
	
	//자기소개서
	private String intro_content;
	
	Calendar today = Calendar.getInstance();

	public resumeWriteAction() throws Exception{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception{
		// 인적사항 입력
		try {
			sqlMapper.startTransaction();
			
			resumeClass = new khResumeVO();
			session_id = (String)session.get("session_id");
			System.out.println(session_id);
			resumeClass.setResume_addr(getResume_addr());
			resumeClass.setResume_date(today.getTime());
			resumeClass.setResume_subject(getResume_subject());
			resumeClass.setResume_birth(getResume_birth());
			resumeClass.setResume_sex(getResume_sex());
			resumeClass.setResume_m_id(session_id);
			sqlMapper.insert("insertResume", resumeClass);
			resume_no = (int)sqlMapper.queryForObject("selectSeq", session_id); // 인적사항 테이블번호
			System.out.println(resume_no);
			
			//학력 입력
			eduClass = new khEduVO();
			eduClass.setEdu_school_type(getEdu_school_type());
			eduClass.setEdu_school(getEdu_school());
			eduClass.setEdu_enter_date(getEdu_enter_date());
			eduClass.setEdu_graduate_date(getEdu_graduate_date());
			eduClass.setEdu_major(getEdu_major());
			eduClass.setEdu_grade(getEdu_grade());
			eduClass.setEdu_graduate_status(getEdu_graduate_status());
			eduClass.setEdu_resume_no(resume_no);
			sqlMapper.insert("insertEdu", eduClass);
			
			//경력 입력
			careerClass = new khCareerVO();
			careerClass.setCareer_cname(getCareer_cname());
			careerClass.setCareer_dept(getCareer_dept());
			careerClass.setCareer_enter_date(getCareer_enter_date());
			careerClass.setCareer_leave_date(getCareer_leave_date());
			careerClass.setCareer_position(getCareer_position());
			careerClass.setCareer_job(getCareer_job());
			careerClass.setCareer_pay(getCareer_pay());
			careerClass.setCareer_explain(getCareer_explain());
			careerClass.setCareer_content(getCareer_content());
			careerClass.setCareer_re_no(resume_no);
			sqlMapper.insert("insertCareer", careerClass);
			
			//수상 및 자격증
			awardClass = new khAwardVO();
			awardClass.setAward_name(getAward_name());
			awardClass.setAward_publisher(getAward_publisher());
			awardClass.setAward_date(getAward_date());
			awardClass.setAward_re_no(resume_no);
			sqlMapper.insert("insertAward", awardClass);
			
			//포트폴리오(파일)
			portClass = new khPortVO();
			
			File destFile = new File(fileUploadPath + getUploadFileName()); // 새로운파일
			FileUtils.copyFile(getUpload(), destFile);
			portClass.setPort_savname(getUploadFileName());
			portClass.setPort_url(getPort_url());
			portClass.setPort_re_no(resume_no);
			sqlMapper.insert("insertPort", portClass);
			
			
			//자기소개서
			introClass = new khIntroVO();
			introClass.setIntro_content(getIntro_content());
			introClass.setIntro_re_no(resume_no);
			sqlMapper.insert("insertIntro", introClass);
			
			
			
			sqlMapper.commitTransaction();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			sqlMapper.endTransaction();
		}
		
		return SUCCESS;
	}

	public khResumeVO getResumeClass() {
		return resumeClass;
	}

	public void setResumeClass(khResumeVO resumeClass) {
		this.resumeClass = resumeClass;
	}

	public khEduVO getEduClass() {
		return eduClass;
	}

	public void setEduClass(khEduVO eduClass) {
		this.eduClass = eduClass;
	}

	public khAwardVO getAwardClass() {
		return awardClass;
	}

	public void setAwardClass(khAwardVO awardClass) {
		this.awardClass = awardClass;
	}

	public khCareerVO getCareerClass() {
		return careerClass;
	}

	public void setCareerClass(khCareerVO careerClass) {
		this.careerClass = careerClass;
	}

	public khPortVO getPortClass() {
		return portClass;
	}

	public void setPortClass(khPortVO portClass) {
		this.portClass = portClass;
	}

	public khIntroVO getIntroClass() {
		return introClass;
	}

	public void setIntroClass(khIntroVO introClass) {
		this.introClass = introClass;
	}

	public String getResume_m_id() {
		return resume_m_id;
	}

	public void setResume_m_id(String resume_m_id) {
		this.resume_m_id = resume_m_id;
	}

	public String getResume_addr() {
		return resume_addr;
	}

	public void setResume_addr(String resume_addr) {
		this.resume_addr = resume_addr;
	}


	public String getResume_date() {
		return resume_date;
	}

	public void setResume_date(String resume_date) {
		this.resume_date = resume_date;
	}

	public String getResume_birth() {
		return resume_birth;
	}

	public void setResume_birth(String resume_birth) {
		this.resume_birth = resume_birth;
	}

	public String getResume_sex() {
		return resume_sex;
	}

	public void setResume_sex(String resume_sex) {
		this.resume_sex = resume_sex;
	}

	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public String getSession_id() {
		return session_id;
	}

	public void setSession_id(String session_id) {
		this.session_id = session_id;
	}

	public String getResume_subject() {
		return resume_subject;
	}

	public void setResume_subject(String resume_subject) {
		this.resume_subject = resume_subject;
	}

	public String getEdu_school_type() {
		return edu_school_type;
	}

	public void setEdu_school_type(String edu_school_type) {
		this.edu_school_type = edu_school_type;
	}

	public String getEdu_school() {
		return edu_school;
	}

	public void setEdu_school(String edu_school) {
		this.edu_school = edu_school;
	}

	public String getEdu_enter_date() {
		return edu_enter_date;
	}

	public void setEdu_enter_date(String edu_enter_date) {
		this.edu_enter_date = edu_enter_date;
	}

	public String getEdu_graduate_date() {
		return edu_graduate_date;
	}

	public void setEdu_graduate_date(String edu_graduate_date) {
		this.edu_graduate_date = edu_graduate_date;
	}

	public String getEdu_major() {
		return edu_major;
	}

	public void setEdu_major(String edu_major) {
		this.edu_major = edu_major;
	}

	public String getEdu_grade() {
		return edu_grade;
	}

	public void setEdu_grade(String edu_grade) {
		this.edu_grade = edu_grade;
	}

	public String getEdu_graduate_status() {
		return edu_graduate_status;
	}

	public void setEdu_graduate_status(String edu_graduate_status) {
		this.edu_graduate_status = edu_graduate_status;
	}

	public String getCareer_cname() {
		return career_cname;
	}

	public void setCareer_cname(String career_cname) {
		this.career_cname = career_cname;
	}

	public String getCareer_dept() {
		return career_dept;
	}

	public void setCareer_dept(String career_dept) {
		this.career_dept = career_dept;
	}

	public String getCareer_enter_date() {
		return career_enter_date;
	}

	public void setCareer_enter_date(String career_enter_date) {
		this.career_enter_date = career_enter_date;
	}

	public String getCareer_leave_date() {
		return career_leave_date;
	}

	public void setCareer_leave_date(String career_leave_date) {
		this.career_leave_date = career_leave_date;
	}

	public String getCareer_position() {
		return career_position;
	}

	public void setCareer_position(String career_position) {
		this.career_position = career_position;
	}

	public String getCareer_job() {
		return career_job;
	}

	public void setCareer_job(String career_job) {
		this.career_job = career_job;
	}

	public String getCareer_pay() {
		return career_pay;
	}

	public void setCareer_pay(String career_pay) {
		this.career_pay = career_pay;
	}

	public String getCareer_explain() {
		return career_explain;
	}

	public void setCareer_explain(String career_explain) {
		this.career_explain = career_explain;
	}

	public int getResume_no() {
		return resume_no;
	}

	public void setResume_no(int resume_no) {
		this.resume_no = resume_no;
	}

	public String getCareer_content() {
		return career_content;
	}

	public void setCareer_content(String career_content) {
		this.career_content = career_content;
	}

	public String getAward_name() {
		return award_name;
	}

	public void setAward_name(String award_name) {
		this.award_name = award_name;
	}

	public String getAward_publisher() {
		return award_publisher;
	}

	public void setAward_publisher(String award_publisher) {
		this.award_publisher = award_publisher;
	}

	public String getAward_date() {
		return award_date;
	}

	public void setAward_date(String award_date) {
		this.award_date = award_date;
	}

	public String getIntro_content() {
		return intro_content;
	}

	public void setIntro_content(String intro_content) {
		this.intro_content = intro_content;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	
	public String getFileUploadPath() {
		return fileUploadPath;
	}

	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}



	public String getPort_url() {
		return port_url;
	}

	public void setPort_url(String port_url) {
		this.port_url = port_url;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
}
	
	