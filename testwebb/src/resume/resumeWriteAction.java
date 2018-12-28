package resume;

import java.io.Reader;
import java.util.Calendar;
import java.util.Date;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import VO.khResumeVO;

public class resumeWriteAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private khResumeVO paramClass;
	private khResumeVO resultClass;
	
	private int resume_no;
	private String resume_m_id;
	private String resume_addr;
	private String resume_subject;
	
	Calendar today = Calendar.getInstance();

	public resumeWriteAction() throws Exception{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception{
		paramClass = new khResumeVO();
		resultClass = new khResumeVO();
		
		paramClass.setResume_subject(getResume_subject());
		paramClass.setResume_addr(getResume_addr());
		paramClass.setResume_date(today.getTime());
		
		sqlMapper.insert("insertResume",paramClass);
		
		
		return SUCCESS;
	}
	
	
	
	public khResumeVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(khResumeVO paramClass) {
		this.paramClass = paramClass;
	}

	public khResumeVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(khResumeVO resultClass) {
		this.resultClass = resultClass;
	}

	public int getResume_no() {
		return resume_no;
	}

	public void setResume_no(int resume_no) {
		this.resume_no = resume_no;
	}

	public String getResume_m_id() {
		return resume_m_id;
	}

	public void setResume_m_id(String resume_m_id) {
		this.resume_m_id = resume_m_id;
	}

	public String getResume_addr() {
		return resume_addr;
	}

	public void setResume_addr(String resume_addr) {
		this.resume_addr = resume_addr;
	}

	public String getResume_subject() {
		return resume_subject;
	}

	public void setResume_subject(String resume_subject) {
		this.resume_subject = resume_subject;
	}

	public Date getResume_date() {
		return resume_date;
	}

	public void setResume_date(Date resume_date) {
		this.resume_date = resume_date;
	}

}
