package VO;

import java.util.Date;

public class khAwardVO {
	private int award_no; 			// 식별자
	private int award_re_no;			// 이력서번호(참조용)
	private String award_name; 		// 수상/자격증 이름
	private String award_publisher;	// 수상/발행 기관
	private Date award_date; 		// 수상/취득 일

	public int getAward_no() {
		return award_no;
	}

	public void setAward_no(int award_no) {
		this.award_no = award_no;
	}

	public int getAward_re_no() {
		return award_re_no;
	}

	public void setAward_re_no(int award_re_no) {
		this.award_re_no = award_re_no;
	}

	public String getAward_name() {
		return award_name;
	}

	public void setAward_name(String award_name) {
		this.award_name = award_name;
	}

	public String getAward_publisher() {
		return award_publisher;
	}

	public void setAward_publisher(String award_publisher) {
		this.award_publisher = award_publisher;
	}

	public Date getAward_date() {
		return award_date;
	}

	public void setAward_date(Date award_date) {
		this.award_date = award_date;
	}

}
