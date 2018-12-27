package VO;

public class khFavHrVO {
	private int fav_h_no;		//식별자
	private String fav_h_m_id;	//관심받는 일반회원 ID
	private String fav_h_c_id;	//인재를 관심있어하는 기업회원 ID

	public int getFav_h_no() {
		return fav_h_no;
	}

	public void setFav_h_no(int fav_h_no) {
		this.fav_h_no = fav_h_no;
	}

	public String getFav_h_m_id() {
		return fav_h_m_id;
	}

	public void setFav_h_m_id(String fav_h_m_id) {
		this.fav_h_m_id = fav_h_m_id;
	}

	public String getFav_h_c_id() {
		return fav_h_c_id;
	}

	public void setFav_h_c_id(String fav_h_c_id) {
		this.fav_h_c_id = fav_h_c_id;
	}

}
