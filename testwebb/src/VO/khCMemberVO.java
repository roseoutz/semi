package VO;

public class khCMemberVO {
	private int cmember_cno; // 사업자등록번호
	private String cmember_id; // 기업회원 id
	private String cmember_pass; // 기업회원 비밀번호
	private String cmember_name; // 기업회원 가입자 이름(인사담당자 이름)
	private String cmember_phone; // 기업회원 전화번호
	private String cmember_email; // 기업회원 이메일
	private String cmember_type; // 기업구분(중소/중견/대)
	private String cmember_cname; // 기업명
	private String cmember_addr; // 기업주소

	public int getCmember_cno() {
		return cmember_cno;
	}

	public void setCmember_cno(int cmember_cno) {
		this.cmember_cno = cmember_cno;
	}

	public String getCmember_id() {
		return cmember_id;
	}

	public void setCmember_id(String cmember_id) {
		this.cmember_id = cmember_id;
	}

	public String getCmember_pass() {
		return cmember_pass;
	}

	public void setCmember_pass(String cmember_pass) {
		this.cmember_pass = cmember_pass;
	}

	public String getCmember_name() {
		return cmember_name;
	}

	public void setCmember_name(String cmember_name) {
		this.cmember_name = cmember_name;
	}

	public String getCmember_phone() {
		return cmember_phone;
	}

	public void setCmember_phone(String cmember_phone) {
		this.cmember_phone = cmember_phone;
	}

	public String getCmember_email() {
		return cmember_email;
	}

	public void setCmember_email(String cmember_email) {
		this.cmember_email = cmember_email;
	}

	public String getCmember_type() {
		return cmember_type;
	}

	public void setCmember_type(String cmember_type) {
		this.cmember_type = cmember_type;
	}

	public String getCmember_cname() {
		return cmember_cname;
	}

	public void setCmember_cname(String cmember_cname) {
		this.cmember_cname = cmember_cname;
	}

	public String getCmember_addr() {
		return cmember_addr;
	}

	public void setCmember_addr(String cmember_addr) {
		this.cmember_addr = cmember_addr;
	}

}
