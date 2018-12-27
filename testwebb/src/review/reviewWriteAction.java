package review;

import java.io.IOException;
import java.io.Reader;
import java.util.Calendar;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import VO.khReviewVO;

public class reviewWriteAction extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private khReviewVO paramClass;
	private khReviewVO resultClass;
	
	private int no;
	private String writer;
	private String content;
	private int post_no;
	
	Calendar today = Calendar.getInstance();
	
	public reviewWriteAction() throws IOException{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception{
		paramClass = new khReviewVO();
		resultClass = new khReviewVO();
		
		paramClass.setReview_post_no(getPost_no());
		paramClass.setReview_content(getContent());
		paramClass.setReview_writer(getWriter());
		paramClass.setReview_date(today.getTime());
		
		sqlMapper.insert("insertReview",paramClass);
		
		return SUCCESS;
	}

	public khReviewVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(khReviewVO paramClass) {
		this.paramClass = paramClass;
	}

	public khReviewVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(khReviewVO resultClass) {
		this.resultClass = resultClass;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getPost_no() {
		return post_no;
	}

	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}

	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
	}
	
}
