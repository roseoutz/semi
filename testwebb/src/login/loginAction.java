package login;
import com.opensymphony.xwork2.*;
import com.ibatis.common.resources.*;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import java.io.*;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

import VO.khCMemberVO;
import VO.khMemberVO;

public class loginAction extends ActionSupport implements SessionAware{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	private String id;
	private String pwd;
	private khMemberVO paramClass;
	private khCMemberVO CparamClass;
	private khMemberVO resultClass;
	private khCMemberVO CresultClass;
	private int checkCount;
	private String headerType;
	private Map session;
	private String session2;
	
	public loginAction() throws IOException{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String index() throws Exception {
		if(session.get("session_id") == null) {
			return LOGIN;
		}else {
			return SUCCESS;
		}
	}
	
	public String execute() throws Exception{
		paramClass = new khMemberVO();
		CparamClass = new khCMemberVO();
		resultClass = new khMemberVO();
		CresultClass = new khCMemberVO();
		paramClass.setMember_id(getId());
		paramClass.setMember_pass(getPwd());
		CparamClass.setCmember_id(getId());
		CparamClass.setCmember_pass(getPwd());
		
		resultClass = (khMemberVO)sqlMapper.queryForObject("loginCheckGen", paramClass);
		if(resultClass == null) {
			CresultClass = (khCMemberVO)sqlMapper.queryForObject("loginCheckCorp", CparamClass);
			if(CresultClass == null) {
			return ERROR;
			}else {
				session.put("session_id", CresultClass.getCmember_id());
				session.put("session_type", "기업");
				session.put("session_name", CresultClass.getCmember_name());
				setHeaderType("corpmain");
				return SUCCESS;
			}
			
		}else {
			session.put("session_id", resultClass.getMember_id());
			session.put("session_type", "일반");
			session.put("session_name", resultClass.getMember_name());
			session.put("session_email", resultClass.getMember_email());
			session.put("session_phone", resultClass.getMember_phone());
			setHeaderType("main");
			return SUCCESS;
		}
		
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public khMemberVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(khMemberVO paramClass) {
		this.paramClass = paramClass;
	}

	public khMemberVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(khMemberVO resultClass) {
		this.resultClass = resultClass;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		loginAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		loginAction.sqlMapper = sqlMapper;
	}

	public khCMemberVO getCparamClass() {
		return CparamClass;
	}

	public void setCparamClass(khCMemberVO cparamClass) {
		CparamClass = cparamClass;
	}

	public int getCheckCount() {
		return checkCount;
	}

	public void setCheckCount(int checkCount) {
		this.checkCount = checkCount;
	}

	public String getHeaderType() {
		return headerType;
	}

	public void setHeaderType(String headerType) {
		this.headerType = headerType;
	}

	public khCMemberVO getCresultClass() {
		return CresultClass;
	}

	public void setCresultClass(khCMemberVO cresultClass) {
		CresultClass = cresultClass;
	}

}