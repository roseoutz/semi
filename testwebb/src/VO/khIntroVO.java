package VO;

public class khIntroVO {
	private int intro_no;			// 식별자
	private int intro_re_no;			// 이력서 번호(참조용)
	private String intro_content;	// 자소설 내용

	public int getIntro_no() {
		return intro_no;
	}

	public void setIntro_no(int intro_no) {
		this.intro_no = intro_no;
	}

	public int getIntro_re_no() {
		return intro_re_no;
	}

	public void setIntro_re_no(int intro_re_no) {
		this.intro_re_no = intro_re_no;
	}

	public String getIntro_content() {
		return intro_content;
	}

	public void setIntro_content(String intro_content) {
		this.intro_content = intro_content;
	}

}
