package qna;

import java.util.Date;

public class qnaVO {

	private String noticeType;
	private String noticeContent;
	private String noticeOrgFileName;
	private String noticeSavFileName;
	private String noticeEmail;
	private Date noticeWriteDate;
	public String getNoticeType() {
		return noticeType;
	}
	public void setNoticeType(String noticeType) {
		this.noticeType = noticeType;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public String getNoticeOrgFileName() {
		return noticeOrgFileName;
	}
	public void setNoticeOrgFileName(String noticeOrgFileName) {
		this.noticeOrgFileName = noticeOrgFileName;
	}
	public String getNoticeSavFileName() {
		return noticeSavFileName;
	}
	public void setNoticeSavFileName(String noticeSavFileName) {
		this.noticeSavFileName = noticeSavFileName;
	}
	public String getNoticeEmail() {
		return noticeEmail;
	}
	public void setNoticeEmail(String noticeEmail) {
		this.noticeEmail = noticeEmail;
	}
	public Date getNoticeWriteDate() {
		return noticeWriteDate;
	}
	public void setNoticeWriteDate(Date noticeWriteDate) {
		this.noticeWriteDate = noticeWriteDate;
	}
	
}
