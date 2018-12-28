package VO;

public class khResumeVO {	
	private int resume_no;			// 식별자
	private String resume_m_id;		// 일반회원id
	private String resume_addr;		// 주소
	private String resume_subject;	// 제목

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

}
