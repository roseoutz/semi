package VO;

import java.util.Date;

public class khApplyVO {
	//인적
	private int resume_no; 
	private String resume_m_id; 
	private String resume_addr; 
	private String resume_subject; 
	private Date resume_date; 
	private String resume_sex;
	private String resume_birth;
	//학력
	private int edu_no;					
	private int edu_resume_no;				
	private String edu_school_type;		
	private String edu_school;			
	private String edu_major;			
	private String edu_grade;					
	private String edu_enter_date;		
	private String edu_graduate_date;		
	private String edu_graduate_status;
	//경력
	private int career_no;			
	private int career_re_no;		
	private String career_cname;	
	private String career_dept;		
	private String career_enter_date;	
	private String career_leave_date;
	private String career_position;	
	private String career_job;	
	private String career_pay;		
	private String career_content;
	private String career_explain;
	//수상
	private int award_no; 			
	private int award_re_no;			
	private String award_name; 		
	private String award_publisher;	
	private String award_date; 	
	//포트
	private int port_no; 			
	private int port_re_no; 		
	private String port_url; 		
	private String port_orgname; 	
	private String port_savname; 	
	//자소서
	private int intro_no;		
	private int intro_re_no;		
	private String intro_content;
	public int getResume_no() {
		return resume_no;
	}
	public void setResume_no(int resume_no) {
		this.resume_no = resume_no;
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
	public String getResume_subject() {
		return resume_subject;
	}
	public void setResume_subject(String resume_subject) {
		this.resume_subject = resume_subject;
	}
	public Date getResume_date() {
		return resume_date;
	}
	public void setResume_date(Date resume_date) {
		this.resume_date = resume_date;
	}
	public String getResume_sex() {
		return resume_sex;
	}
	public void setResume_sex(String resume_sex) {
		this.resume_sex = resume_sex;
	}
	public String getResume_birth() {
		return resume_birth;
	}
	public void setResume_birth(String resume_birth) {
		this.resume_birth = resume_birth;
	}
	public int getEdu_no() {
		return edu_no;
	}
	public void setEdu_no(int edu_no) {
		this.edu_no = edu_no;
	}
	public int getEdu_resume_no() {
		return edu_resume_no;
	}
	public void setEdu_resume_no(int edu_resume_no) {
		this.edu_resume_no = edu_resume_no;
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
	public String getEdu_graduate_status() {
		return edu_graduate_status;
	}
	public void setEdu_graduate_status(String edu_graduate_status) {
		this.edu_graduate_status = edu_graduate_status;
	}
	public int getCareer_no() {
		return career_no;
	}
	public void setCareer_no(int career_no) {
		this.career_no = career_no;
	}
	public int getCareer_re_no() {
		return career_re_no;
	}
	public void setCareer_re_no(int career_re_no) {
		this.career_re_no = career_re_no;
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
	public String getCareer_content() {
		return career_content;
	}
	public void setCareer_content(String career_content) {
		this.career_content = career_content;
	}
	public String getCareer_explain() {
		return career_explain;
	}
	public void setCareer_explain(String career_explain) {
		this.career_explain = career_explain;
	}
	public int getAward_no() {
		return award_no;
	}
	public void setAward_no(int award_no) {
		this.award_no = award_no;
	}
	public int getAward_re_no() {
		return award_re_no;
	}
	public void setAward_re_no(int award_re_no) {
		this.award_re_no = award_re_no;
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
	public int getPort_no() {
		return port_no;
	}
	public void setPort_no(int port_no) {
		this.port_no = port_no;
	}
	public int getPort_re_no() {
		return port_re_no;
	}
	public void setPort_re_no(int port_re_no) {
		this.port_re_no = port_re_no;
	}
	public String getPort_url() {
		return port_url;
	}
	public void setPort_url(String port_url) {
		this.port_url = port_url;
	}
	public String getPort_orgname() {
		return port_orgname;
	}
	public void setPort_orgname(String port_orgname) {
		this.port_orgname = port_orgname;
	}
	public String getPort_savname() {
		return port_savname;
	}
	public void setPort_savname(String port_savname) {
		this.port_savname = port_savname;
	}
	public int getIntro_no() {
		return intro_no;
	}
	public void setIntro_no(int intro_no) {
		this.intro_no = intro_no;
	}
	public int getIntro_re_no() {
		return intro_re_no;
	}
	public void setIntro_re_no(int intro_re_no) {
		this.intro_re_no = intro_re_no;
	}
	public String getIntro_content() {
		return intro_content;
	}
	public void setIntro_content(String intro_content) {
		this.intro_content = intro_content;
	}	
}
