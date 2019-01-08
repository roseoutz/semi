package VO;

public class khApplyHrVO {
	private int apply_no; 				// 식별자
	private String apply_c_id; 	// 지원받은 회사
	private String apply_m_id; 		// 지원한 회원 id

	public int getApply_no() {
		return apply_no;
	}

	public void setApply_no(int apply_no) {
		this.apply_no = apply_no;
	}

	public String getApply_m_id() {
		return apply_m_id;
	}

	public void setApply_m_id(String apply_m_id) {
		this.apply_m_id = apply_m_id;
	}

	public String getApply_c_id() {
		return apply_c_id;
	}

	public void setApply_c_id(String apply_c_id) {
		this.apply_c_id = apply_c_id;
	}


}
