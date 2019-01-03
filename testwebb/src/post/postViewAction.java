package post;

import java.io.Reader;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import VO.khPostVO;
import VO.khReviewVO;

public class postViewAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private khPostVO paramClass;
	private khPostVO resultClass;
	private List<khReviewVO> reviewList = new ArrayList<khReviewVO>();
	
	private khReviewVO reParamClass;
	private khReviewVO reResultClass;
	
	private int currentPage;

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
	
	
	public postViewAction() throws Exception {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception{
		paramClass.setPost_no(getPost_no());

		resultClass = (khPostVO)sqlMapper.queryForObject("selectPostOne",getPost_no());
		reviewList = sqlMapper.queryForList("selectReview",getPost_no());
		
		return SUCCESS;
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

	public List<khReviewVO> getReviewList() {
		return reviewList;
	}

	public void setReviewList(List<khReviewVO> reviewList) {
		this.reviewList = reviewList;
	}

	public khReviewVO getReParamClass() {
		return reParamClass;
	}

	public void setReParamClass(khReviewVO reParamClass) {
		this.reParamClass = reParamClass;
	}

	public khReviewVO getReResultClass() {
		return reResultClass;
	}

	public void setReResultClass(khReviewVO reResultClass) {
		this.reResultClass = reResultClass;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	
}
