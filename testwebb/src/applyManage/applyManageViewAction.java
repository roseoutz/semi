package applyManage;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import VO.khApplyViewVO;

public class applyManageViewAction extends ActionSupport implements SessionAware {
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private Map session;
	private List<khApplyViewVO> applyList;
	private String cmember_id;
	
	
	public applyManageViewAction() throws Exception {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	public String execute() throws Exception{
		cmember_id = (String)session.get("session_id");
		applyList = sqlMapper.queryForList("selectApplyList",cmember_id);
		
		return SUCCESS;
	}

	@Override
	public void setSession(Map session) {
		// TODO Auto-generated method stub
		this.session = session;
	}

	public List<khApplyViewVO> getApplyList() {
		return applyList;
	}

	public void setApplyList(List<khApplyViewVO> applyList) {
		this.applyList = applyList;
	}

	public String getCmember_id() {
		return cmember_id;
	}

	public void setCmember_id(String cmember_id) {
		this.cmember_id = cmember_id;
	}
	
	
}
