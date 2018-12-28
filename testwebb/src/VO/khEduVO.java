package VO;

import java.util.Date;

public class khEduVO {
	//최종학력 
	private int edu_no;					//식별자
	private int edu_re_no;				//이력서번호(참조용)
	private String edu_school_type;		//학교구분(4년제/전문대/고졸 등)
	private String edu_school;			//학교명
	private String edu_major;			//전공
	private int grade;					//학점
	private Date edu_enter_date;		//입학일
	private Date edu_graduate_date;		//졸업일
	private String edu_graduate_status;//졸업상태(졸업/유예 등)

	public int getEdu_no() {
		return edu_no;
	}

	public void setEdu_no(int edu_no) {
		this.edu_no = edu_no;
	}

	public int getEdu_re_no() {
		return edu_re_no;
	}

	public void setEdu_re_no(int edu_re_no) {
		this.edu_re_no = edu_re_no;
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

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public Date getEdu_enter_date() {
		return edu_enter_date;
	}

	public void setEdu_enter_date(Date edu_enter_date) {
		this.edu_enter_date = edu_enter_date;
	}

	public Date getEdu_graduate_date() {
		return edu_graduate_date;
	}

	public void setEdu_graduate_date(Date edu_graduate_date) {
		this.edu_graduate_date = edu_graduate_date;
	}

	public String getEdu_graduate_status() {
		return edu_graduate_status;
	}

	public void setEdu_graduate_status(String edu_graduate_status) {
		this.edu_graduate_status = edu_graduate_status;
	}

}
