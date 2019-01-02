package findUserInfo;
import com.opensymphony.xwork2.*;
import com.ibatis.common.resources.*;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import java.io.*;
import VO.*;


public class findPwdAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	// 일반회원 입력폼 받아오기
	private String m_id;
	private String m_email;
	private String m_name;
	// 기업회원 입력폼 받아오기
	private String cm_id;
	private String cm_name;
	private String cm_cno;
	
	private khMemberVO paramClass;
	private khCMemberVO CparamClass;
	private String findPwd;
	
	public findPwdAction() throws IOException{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception{
		paramClass = new khMemberVO();
		CparamClass = new khCMemberVO();
		if(!getM_id().equals("") && !getM_email().equals("") && !getM_name().equals("")){ // 일반회원 입력폼이 전체입력되었을때
			paramClass.setMember_id(getM_id());
			paramClass.setMember_name(getM_name());
			paramClass.setMember_email(getM_email());
			findPwd = (String)sqlMapper.queryForObject("findPwdGen", paramClass);
			if(findPwd == null) {
				return ERROR;
			}
			else {
				return SUCCESS;
			}
		}else { // 기업회원 입력폼이 입력되었을때
			CparamClass.setCmember_id(getCm_id());
			CparamClass.setCmember_name(getCm_name());
			CparamClass.setCmember_cno(getCm_cno());
			findPwd = (String)sqlMapper.queryForObject("findPwdCorp", CparamClass);
			if(findPwd == null) {
				return ERROR;
			}else {
				return SUCCESS;
			}
		}
	}
	
	
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getCm_id() {
		return cm_id;
	}
	public void setCm_id(String cm_id) {
		this.cm_id = cm_id;
	}
	public String getCm_name() {
		return cm_name;
	}
	public void setCm_name(String cm_name) {
		this.cm_name = cm_name;
	}
	public String getCm_cno() {
		return cm_cno;
	}
	public void setCm_cno(String cm_cno) {
		this.cm_cno = cm_cno;
	}

	public khMemberVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(khMemberVO paramClass) {
		this.paramClass = paramClass;
	}

	public khCMemberVO getCparamClass() {
		return CparamClass;
	}

	public void setCparamClass(khCMemberVO cparamClass) {
		CparamClass = cparamClass;
	}

	public String getFindPwd() {
		return findPwd;
	}

	public void setFindPwd(String findPwd) {
		this.findPwd = findPwd;
	}

	
	
}
