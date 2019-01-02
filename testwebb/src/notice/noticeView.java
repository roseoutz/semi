package notice;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import VO.khNoticeVO;

public class noticeView extends ActionSupport {

	public Reader reader;
	public SqlMapClient sqlMapper;
	
	private khNoticeVO paramClass;
	private khNoticeVO resultClass;
	private List<khNoticeVO> list = new ArrayList<khNoticeVO>();
	
	private int currentPage;
	private int no;
	
	public noticeView() throws Exception {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception {
		resultClass = (khNoticeVO)sqlMapper.queryForObject("selectOnenotice",getNo());
		return SUCCESS;
	}

	public Reader getReader() {
		return reader;
	}

	public void setReader(Reader reader) {
		this.reader = reader;
	}

	public SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public void setSqlMapper(SqlMapClient sqlMapper) {
		this.sqlMapper = sqlMapper;
	}

	public khNoticeVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(khNoticeVO paramClass) {
		this.paramClass = paramClass;
	}

	public khNoticeVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(khNoticeVO resultClass) {
		this.resultClass = resultClass;
	}

	public List<khNoticeVO> getList() {
		return list;
	}

	public void setList(List<khNoticeVO> list) {
		this.list = list;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}
	
	
}
