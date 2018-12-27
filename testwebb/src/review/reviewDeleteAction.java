package review;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import VO.khReviewVO;

public class reviewDeleteAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private khReviewVO paramClass;
	private khReviewVO resultClass;
	private int no;
	
	public reviewDeleteAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception {
		paramClass = new khReviewVO();
		resultClass = new khReviewVO();

		paramClass.setReview_no(getNo());

		sqlMapper.update("deleteReview", paramClass);

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

}
