package qna;

import java.io.Reader;

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
	private String mtm_writer;		// 일반회원 작성자
	private String mtm_writer_c;	// 기업회원 작성자	
	private String email1;
	private String email2;
	private String mtm_email;
	private String mtm_content;	
	
	public mtmWriteAction() throws Exception {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception {
		paramClass = new khMtmVO();
		resultClass = new khMtmVO();
		
		paramClass.setMtm_writer(getMtm_writer());
		paramClass.setMtm_writer_c(getMtm_writer_c());
		paramClass.setMtm_content(getMtm_content());
		paramClass.setMtm_email(email1+"@"+email2);
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

	public String getMtm_writer_c() {
		return mtm_writer_c;
	}

	public void setMtm_writer_c(String mtm_writer_c) {
		this.mtm_writer_c = mtm_writer_c;
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
	
	
}
