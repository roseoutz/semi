package admin;
import com.opensymphony.xwork2.*;
import com.ibatis.common.resources.*;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import java.io.*;
import VO.khAdminVO;
import org.apache.struts2.interceptor.SessionAware;
import java.util.*;

public class loginAction extends ActionSupport implements SessionAware{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private khAdminVO paramClass;
	private khAdminVO resultClass;
	
	private String admin_id;
	private String admin_pass;
	private Map session;
	
	public loginAction() throws IOException{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception{
		paramClass = new khAdminVO();
		resultClass = new khAdminVO();
		
		paramClass.setAdmin_id(getAdmin_id());
		paramClass.setAdmin_pass(getAdmin_pass());
		
		resultClass = (khAdminVO)sqlMapper.queryForObject("adminLoginCheck", paramClass);
		if(resultClass == null) {
			return ERROR;
		}else {
			session.put("session_id", resultClass.getAdmin_id());
			session.put("session_type", "°ü¸®ÀÚ");
			return SUCCESS;
		}
	}

	public khAdminVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(khAdminVO paramClass) {
		this.paramClass = paramClass;
	}

	public khAdminVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(khAdminVO resultClass) {
		this.resultClass = resultClass;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getAdmin_pass() {
		return admin_pass;
	}

	public void setAdmin_pass(String admin_pass) {
		this.admin_pass = admin_pass;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

}
