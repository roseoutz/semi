package notice;

import java.util.Calendar;

public class noticeVO {

	private int no;
	private String noticeType;
	private	String noticeSubject;
	private String noticeContent;
	private String noticeAttach;
	Calendar today = Calendar.getInstance();
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getNoticeType() {
		return noticeType;
	}
	public void setNoticeType(String noticeType) {
		this.noticeType = noticeType;
	}
	public String getNoticeSubject() {
		return noticeSubject;
	}
	public void setNoticeSubject(String noticeSubject) {
		this.noticeSubject = noticeSubject;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public String getNoticeAttach() {
		return noticeAttach;
	}
	public void setNoticeAttach(String noticeAttach) {
		this.noticeAttach = noticeAttach;
	}
	public Calendar getToday() {
		return today;
	}
	public void setToday(Calendar today) {
		this.today = today;
	}
	
	
	
}
