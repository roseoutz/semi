package VO;

public class khApplyHrVO {
	private int apply_no; 				// 식별자
	private String apply_company_id; 	// 지원받은 회사
	private String apply_mem_id; 		// 지원한 회원 id

	public int getApply_no() {
		return apply_no;
	}

	public void setApply_no(int apply_no) {
		this.apply_no = apply_no;
	}

	public String getApply_company_id() {
		return apply_company_id;
	}

	public void setApply_company_id(String apply_company_id) {
		this.apply_company_id = apply_company_id;
	}

	public String getApply_mem_id() {
		return apply_mem_id;
	}

	public void setApply_mem_id(String apply_mem_id) {
		this.apply_mem_id = apply_mem_id;
	}

}
