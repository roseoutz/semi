package VO;

import java.util.Date;

public class khCareerVO {
	private int career_no;			//식별자
	private int career_re_no;		//이력서번호(참조용)
	private String career_cname;	//기업명
	private String career_dept;		//부서
	private Date career_enter_date;	//입사일
	private Date career_leave_date;	//퇴사일
	private String career_position;	//직책/직급
	private String career_job;		//직무
	private String career_pay;		//연봉
	private String career_content;	//경력기술서

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

	public Date getCareer_enter_date() {
		return career_enter_date;
	}

	public void setCareer_enter_date(Date career_enter_date) {
		this.career_enter_date = career_enter_date;
	}

	public Date getCareer_leave_date() {
		return career_leave_date;
	}

	public void setCareer_leave_date(Date career_leave_date) {
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

}
