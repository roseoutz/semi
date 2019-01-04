package qna;

import java.io.Reader;
import java.util.Calendar;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import VO.khMtmVO;

public class mtmWriteAction extends ActionSupport {

	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	public khMtmVO paramClass;
	public khMtmVO resultClass;
	
	private int mtm_no;
	private String mtm_writer;			
	private String email1;
	private String email2;
	private String mtm_email;
	private String mtm_content;	
	private String mtm_subject;
	private String mtm_session_type;
	
	private Calendar today = Calendar.getInstance();
	public mtmWriteAction() throws Exception {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception {
		paramClass = new khMtmVO();
		resultClass = new khMtmVO();
		
		paramClass.setMtm_writer(getMtm_writer());
		paramClass.setMtm_content(getMtm_content());
		paramClass.setMtm_subject(getMtm_subject());
		paramClass.setMtm_email(email1+"@"+email2);
		paramClass.setMtm_date(today.getTime());
		paramClass.setMtm_session_type(getMtm_session_type());
		sqlMapper.insert("insertmtm",paramClass);
		return SUCCESS;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		mtmWriteAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		mtmWriteAction.sqlMapper = sqlMapper;
	}

	public khMtmVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(khMtmVO paramClass) {
		this.paramClass = paramClass;
	}

	public khMtmVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(khMtmVO resultClass) {
		this.resultClass = resultClass;
	}

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

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}

	public String getMtm_subject() {
		return mtm_subject;
	}

	public void setMtm_subject(String mtm_subject) {
		this.mtm_subject = mtm_subject;
	}

	public String getMtm_session_type() {
		return mtm_session_type;
	}

	public void setMtm_session_type(String mtm_session_type) {
		this.mtm_session_type = mtm_session_type;
	}

	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
	}
	
	
}
