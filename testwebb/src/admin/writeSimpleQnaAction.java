package admin;
import com.opensymphony.xwork2.*;
import com.ibatis.common.resources.*;
import com.ibatis.sqlmap.client.*;
import java.io.*;
import VO.khQAVO;


public class writeSimpleQnaAction extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private String qa_subject;
	private String qa_content;
	
	private khQAVO paramClass;
	
	
	public writeSimpleQnaAction() throws IOException{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception{
		paramClass = new khQAVO();
		paramClass.setQa_subject(getQa_subject());
		paramClass.setQa_content(getQa_content());
		sqlMapper.insert("insertSimpleQna", paramClass);
		
		return SUCCESS;

	}

	public String getQa_subject() {
		return qa_subject;
	}

	public void setQa_subject(String qa_subject) {
		this.qa_subject = qa_subject;
	}

	public String getQa_content() {
		return qa_content;
	}

	public void setQa_content(String qa_content) {
		this.qa_content = qa_content;
	}
	
}
