package admin;
import com.ibatis.common.resources.*;
import com.opensymphony.xwork2.*;
import com.ibatis.sqlmap.client.*;
import java.io.*;
import VO.khMtmVO;

public class viewqnaAction extends ActionSupport {
	private String no;
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private khMtmVO paramClass;
	private khMtmVO resultClass;
	
	
	public viewqnaAction() throws IOException{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception{
		paramClass = new khMtmVO();
		resultClass = new khMtmVO();
		resultClass = (khMtmVO)sqlMapper.queryForObject("selectQnaOne", getNo());
		
		return SUCCESS;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
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
	
}
