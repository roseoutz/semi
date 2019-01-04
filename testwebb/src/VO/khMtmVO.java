package VO;
import java.util.*;

public class khMtmVO {
	private int mtm_no;			
	private String mtm_writer;	
	private String mtm_session_type;	
	private String mtm_email;		
	private String mtm_content;	
	private String mtm_subject;
	private Date mtm_date;

	public int getMtm_no() {
		return mtm_no;
	}

	public void setMtm_no(int mtm_no) {
		this.mtm_no = mtm_no;
	}

	public String getMtm_writer() {
		return mtm_writer;
	}

	public void setMtm_writer(String mtm_writer) {
		this.mtm_writer = mtm_writer;
	}

	public String getMtm_email() {
		return mtm_email;
	}

	public void setMtm_email(String mtm_email) {
		this.mtm_email = mtm_email;
	}

	public String getMtm_content() {
		return mtm_content;
	}

	public void setMtm_content(String mtm_content) {
		this.mtm_content = mtm_content;
	}

	public String getMtm_session_type() {
		return mtm_session_type;
	}

	public void setMtm_session_type(String mtm_session_type) {
		this.mtm_session_type = mtm_session_type;
	}

	public String getMtm_subject() {
		return mtm_subject;
	}

	public void setMtm_subject(String mtm_subject) {
		this.mtm_subject = mtm_subject;
	}

	public Date getMtm_date() {
		return mtm_date;
	}

	public void setMtm_date(Date mtm_date) {
		this.mtm_date = mtm_date;
	}

}
