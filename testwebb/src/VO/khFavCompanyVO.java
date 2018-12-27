package VO;

public class khFavCompanyVO {
	private int fav_c_no;		//식별자
	private String fav_c_m_id;	//기업을 관심있어하는 일반회원의 id
	private String fav_c_c_id;	//관심받는 기업 id

	public int getFav_c_no() {
		return fav_c_no;
	}

	public void setFav_c_no(int fav_c_no) {
		this.fav_c_no = fav_c_no;
	}

	public String getFav_c_m_id() {
		return fav_c_m_id;
	}

	public void setFav_c_m_id(String fav_c_m_id) {
		this.fav_c_m_id = fav_c_m_id;
	}

	public String getFav_c_c_id() {
		return fav_c_c_id;
	}

	public void setFav_c_c_id(String fav_c_c_id) {
		this.fav_c_c_id = fav_c_c_id;
	}

}
