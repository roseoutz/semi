package VO;

public class khMtmVO {
	// 1:1문의사항
	private int mtm_no;				// 1:1문의사항 번호
	private String mtm_writer;		// 일반회원 작성자
	private String mtm_writer_c;	// 기업회원 작성자	
	private String mtm_email;		// 답변받을 이메일
	private String mtm_content;		// 문의내용

	public int getMtm_no() {
		return mtm_no;
	}

	public void setMtm_no(int mtm_no) {
		this.mtm_no = mtm_no;
	}

	public String getMtm_writer() {
		return mtm_writer;
	}

	public void setMtm_writer(String mtm_writer) {
		this.mtm_writer = mtm_writer;
	}

	public String getMtm_writer_c() {
		return mtm_writer_c;
	}

	public void setMtm_writer_c(String mtm_writer_c) {
		this.mtm_writer_c = mtm_writer_c;
	}

	public String getMtm_email() {
		return mtm_email;
	}

	public void setMtm_email(String mtm_email) {
		this.mtm_email = mtm_email;
	}

	public String getMtm_content() {
		return mtm_content;
	}

	public void setMtm_content(String mtm_content) {
		this.mtm_content = mtm_content;
	}

}
