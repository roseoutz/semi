package admin;
import com.opensymphony.xwork2.*;
import com.ibatis.sqlmap.client.*;
import com.ibatis.common.resources.*;
import java.io.*;
import java.util.Calendar;

import VO.khNoticeVO;

public class writeNoticeAction extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private khNoticeVO paramClass;
	
	private String notice_subject;
	private String notice_content;
	private Calendar today = Calendar.getInstance();
	
	public writeNoticeAction() throws IOException{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception{
		paramClass = new khNoticeVO();
		paramClass.setNotice_subject(getNotice_subject());
		paramClass.setNotice_content(getNotice_content());
		paramClass.setNotice_date(today.getTime());
		
		sqlMapper.insert("insertNotice", paramClass);
		
		return SUCCESS;
	}

	public khNoticeVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(khNoticeVO paramClass) {
		this.paramClass = paramClass;
	}

	public String getNotice_subject() {
		return notice_subject;
	}

	public void setNotice_subject(String notice_subject) {
		this.notice_subject = notice_subject;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
	}
	
	

}
