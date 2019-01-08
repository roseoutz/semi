package manageApply;

import java.io.Reader;
import java.util.HashMap;
import java.util.Map;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import VO.khMemberVO;
import VO.khResumeVO;

public class manageApplyViewAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private khResumeVO paramClass;
	private khResumeVO resultClass;
	
	private khMemberVO mParamClass;
	private khMemberVO mResultClass;
	
	private Map map;
	
	public manageApplyViewAction() throws Exception {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception{
		paramClass = new khResumeVO();
		resultClass = new khResumeVO();
		mParamClass = new khMemberVO();
		mResultClass = new khMemberVO();
		
		
		return SUCCESS;
	}
}
