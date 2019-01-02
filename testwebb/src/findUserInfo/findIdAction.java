package findUserInfo;
import java.io.IOException;
import java.util.*;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import VO.khCMemberVO;
import VO.khMemberVO;


public class findIdAction extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private String m_name;
	private String m_email;
	private String cm_name;
	private String cm_cno;
	
	private khCMemberVO CparamClass;
	private khMemberVO paramClass;
	private List findId;
	private String r_findId;
	private int searchCount;
	
	
	
	public findIdAction() throws IOException{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception{
		paramClass = new khMemberVO();
		CparamClass = new khCMemberVO();
		
		if(!getM_name().equals("") && !getM_email().equals("")) { 
			paramClass.setMember_name(getM_name());
			paramClass.setMember_email(getM_email());
			findId = sqlMapper.queryForList("findIdGen", paramClass);
			searchCount = (int)sqlMapper.queryForObject("findIdGenCount", paramClass);
			
			if(findId.isEmpty()) {
				return ERROR;
			}else {
				return SUCCESS;
			}
		}else{
			CparamClass.setCmember_name(getCm_name());
			CparamClass.setCmember_cno(getCm_cno());
			findId = sqlMapper.queryForList("findIdCorp", CparamClass);
			searchCount = (int)sqlMapper.queryForObject("findIdCorpCount", CparamClass);
			if(findId.isEmpty()) {
				return ERROR;
			}else {
				return SUCCESS;
			}
		}
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
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

	public khCMemberVO getCparamClass() {
		return CparamClass;
	}

	public void setCparamClass(khCMemberVO cparamClass) {
		CparamClass = cparamClass;
	}

	public khMemberVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(khMemberVO paramClass) {
		this.paramClass = paramClass;
	}

	public List getFindId() {
		return findId;
	}

	public void setFindId(List findId) {
		this.findId = findId;
	}

	public String getR_findId() {
		return r_findId;
	}

	public void setR_findId(String r_findId) {
		this.r_findId = r_findId;
	}

	public void setSearchCount(int searchCount) {
		this.searchCount = searchCount;
	}

	public int getSearchCount() {
		return searchCount;
	}
}
