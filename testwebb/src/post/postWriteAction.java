package post;

import java.io.Reader;
import java.util.Calendar;
import java.util.Date;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import VO.khPostVO;

public class postWriteAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	public khPostVO paramClass;
	public khPostVO resultClass;
	
	private int post_no;
	private String post_subject;
	private String post_writer;
	private String post_content;
	private String post_career;
	private String post_edu;
	private String post_em_type;
	private String post_pay;
	private String post_loc;
	private String post_prefer;
	private String post_time;
	Calendar post_date = Calendar.getInstance();
	
	public postWriteAction() throws Exception {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception {
			
		paramClass = new khPostVO();
		resultClass = new khPostVO();
		
		paramClass.setPost_subject(getPost_subject());
		paramClass.setPost_writer(getPost_writer());
		paramClass.setPost_content(getPost_content());
		paramClass.setPost_date(post_date.getTime());
		paramClass.setPost_career(getPost_career());
		paramClass.setPost_edu(getPost_edu());
		paramClass.setPost_em_type(getPost_em_type());
		paramClass.setPost_pay(getPost_pay());
		paramClass.setPost_loc(getPost_loc());
		paramClass.setPost_prefer(getPost_prefer());
		paramClass.setPost_time(getPost_time());
		sqlMapper.insert("insertPost",paramClass);
		return SUCCESS;
	}
	
	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}
	public static void setSqlMapper(SqlMapClient sqlMapper) {
		postWriteAction.sqlMapper = sqlMapper;
	}
	
	public khPostVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(khPostVO paramClass) {
		this.paramClass = paramClass;
	}

	public khPostVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(khPostVO resultClass) {
		this.resultClass = resultClass;
	}

	public int getPost_no() {
		return post_no;
	}
	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}
	public String getPost_subject() {
		return post_subject;
	}
	public void setPost_subject(String post_subject) {
		this.post_subject = post_subject;
	}
	public String getPost_writer() {
		return post_writer;
	}
	public void setPost_writer(String post_writer) {
		this.post_writer = post_writer;
	}
	public String getPost_content() {
		return post_content;
	}
	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		postWriteAction.reader = reader;
	}

	public String getPost_career() {
		return post_career;
	}

	public void setPost_career(String post_career) {
		this.post_career = post_career;
	}

	public String getPost_edu() {
		return post_edu;
	}
	public void setPost_edu(String post_edu) {
		this.post_edu = post_edu;
	}
	public String getPost_em_type() {
		return post_em_type;
	}
	public void setPost_em_type(String post_em_type) {
		this.post_em_type = post_em_type;
	}
	public String getPost_pay() {
		return post_pay;
	}
	public void setPost_pay(String post_pay) {
		this.post_pay = post_pay;
	}
	public String getPost_loc() {
		return post_loc;
	}
	public void setPost_loc(String post_loc) {
		this.post_loc = post_loc;
	}
	public String getPost_prefer() {
		return post_prefer;
	}
	public void setPost_prefer(String post_prefer) {
		this.post_prefer = post_prefer;
	}
	public String getPost_time() {
		return post_time;
	}
	public void setPost_time(String post_time) {
		this.post_time = post_time;
	}
	public Calendar getPost_date() {
		return post_date;
	}
	public void setPost_date(Calendar post_date) {
		this.post_date = post_date;
	} 

}
