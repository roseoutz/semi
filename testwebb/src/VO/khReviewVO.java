package VO;

import java.util.Date;

public class khReviewVO {
	private int review_no;			// 식별자
	private String review_writer;	// 리뷰작성자
	private String review_content;	// 리뷰 내용
	private Date review_date;		// 작성 일자
	private int review_post_no;		// 채용공고 번호(참조)

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public String getReview_writer() {
		return review_writer;
	}

	public void setReview_writer(String review_writer) {
		this.review_writer = review_writer;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public Date getReview_date() {
		return review_date;
	}

	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}

	public int getReview_post_no() {
		return review_post_no;
	}

	public void setReview_post_no(int review_post_no) {
		this.review_post_no = review_post_no;
	}

}
