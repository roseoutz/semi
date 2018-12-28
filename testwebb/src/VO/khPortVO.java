package VO;

public class khPortVO {
	// 포트폴리오
	private int port_no; 			// 식별자
	private int port_re_no; 			// 이력서 번호(참조용)
	private String port_url; 		// URL
	private String port_orgname; 	// 첨부파일 원본 이름
	private String port_savname; 	// 첨부파일 저장될 이름.

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

}
