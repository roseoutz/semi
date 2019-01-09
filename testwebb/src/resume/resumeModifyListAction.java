package resume;
import java.io.IOException;

import java.io.Reader;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import VO.khApplyVO;
public class resumeModifyListAction extends ActionSupport implements SessionAware{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private khApplyVO apply;
	private int resume_no;
	private Map session;
	private String session_id;
	
	public resumeModifyListAction() throws IOException{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception{
		session_id = (String)session.get("session_id");
		
		apply = new khApplyVO();
		resume_no = (int)sqlMapper.queryForObject("selectResume_no", session_id);
		
		apply = (khApplyVO)sqlMapper.queryForObject("selectApply", resume_no);
	
		return SUCCESS;
		
	}
	
	public int getResume_no() {
		return resume_no;
	}

	public void setResume_no(int resume_no) {
		this.resume_no = resume_no;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public String getSession_id() {
		return session_id;
	}

	public void setSession_id(String session_id) {
		this.session_id = session_id;
	}

	public khApplyVO getApply() {
		return apply;
	}

	public void setApply(khApplyVO apply) {
		this.apply = apply;
	}

	
	
	
	
	
	

}
