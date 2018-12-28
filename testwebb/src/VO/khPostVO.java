package VO;

import java.util.Date;

public class khPostVO {
	private int post_no;				// 식별자
	private String post_subject;	// 공고 제목
	private String post_writer;		// 공고 작성자
	private String post_content;	// 공고 내용
	private Date post_date;			// 등록 일자
	private String post_prefer; 	// 우대 사항
	private String post_loc;			// 근무 지역
	private String post_pay;			// 연봉
	private String post_em_type;	// 근무 형태
	private String post_edu;			// 지원 자격(학력)
	private String post_career;		// 지원 자격(경력)
	private String post_time;		// 근무 시간
	
	
	public String getPost_prefer() {
		return post_prefer;
	}

	public void setPost_prefer(String post_prefer) {
		this.post_prefer = post_prefer;
	}

	public String getPost_loc() {
		return post_loc;
	}

	public void setPost_loc(String post_loc) {
		this.post_loc = post_loc;
	}

	public String getPost_pay() {
		return post_pay;
	}

	public void setPost_pay(String post_pay) {
		this.post_pay = post_pay;
	}

	public String getPost_em_type() {
		return post_em_type;
	}

	public void setPost_em_type(String post_em_type) {
		this.post_em_type = post_em_type;
	}

	public String getPost_edu() {
		return post_edu;
	}

	public void setPost_edu(String post_edu) {
		this.post_edu = post_edu;
	}

	public String getPost_career() {
		return post_career;
	}

	public void setPost_career(String post_career) {
		this.post_career = post_career;
	}

	public String getPost_time() {
		return post_time;
	}

	public void setPost_time(String post_time) {
		this.post_time = post_time;
	}

	public int getPost_no() {
		return post_no;
	}

	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}

	public String getPost_subject() {
		return post_subject;
	}

	public void setPost_subject(String post_subject) {
		this.post_subject = post_subject;
	}

	public String getPost_writer() {
		return post_writer;
	}

	public void setPost_writer(String post_writer) {
		this.post_writer = post_writer;
	}

	public String getPost_content() {
		return post_content;
	}

	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}

	public Date getPost_date() {
		return post_date;
	}

	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}

}
