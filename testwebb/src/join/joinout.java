package join;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import VO.khCMemberVO;
import VO.khMemberVO;

public class joinout extends ActionSupport{

	public Reader reader;
	public SqlMapClient sqlMapper;
	
	private khCMemberVO CparamClass;
	private khCMemberVO CresultClass;
	
	private khMemberVO paramClass;
	private khMemberVO resultClass;
	
	private String member_id;
	private String member_pass;
	private String cmember_id;
	private String cmember_pass;
	private String member_type;
	
	public joinout() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception {
		CparamClass = new khCMemberVO();
		paramClass = new khMemberVO();
		
		if(member_type=="기업") {
			CparamClass.setCmember_id(getCmember_id());
			CparamClass.setCmember_pass(getCmember_pass());
			sqlMapper.delete("deleteCMember", CparamClass);
		} else {
			paramClass.setMember_id(getMember_id());
			paramClass.setMember_pass(getMember_pass());
			sqlMapper.delete("deleteMember", paramClass);
		}
		
		return SUCCESS;
		
	}
	
	public String checkForm() throws Exception {
		return SUCCESS;
	}
	
	public String checkAction() throws Exception {
	int x;
	CparamClass = new khCMemberVO();
	paramClass = new khMemberVO();
	
	System.out.println(member_type);
	if(member_type.equals("corp")) {
		CparamClass.setCmember_id(getCmember_id());
		System.out.println(CparamClass.getCmember_id());
		System.out.println(CparamClass.getCmember_pass());
		CparamClass.setCmember_pass(getCmember_pass());
		x = (int)sqlMapper.queryForObject("loginCheckCorp", CparamClass);
	} else {
		paramClass.setMember_id(getMember_id());
		paramClass.setMember_pass(getMember_pass());
		System.out.println(paramClass.getMember_id());
		System.out.println(paramClass.getMember_pass());
		x = (int)sqlMapper.queryForObject("loginCheckGen", paramClass);
	}
	if(x!=1) {
		return ERROR;
	}
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

	public khCMemberVO getCparamClass() {
		return CparamClass;
	}

	public void setCparamClass(khCMemberVO cparamClass) {
		CparamClass = cparamClass;
	}

	public khCMemberVO getCresultClass() {
		return CresultClass;
	}

	public void setCresultClass(khCMemberVO cresultClass) {
		CresultClass = cresultClass;
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

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pass() {
		return member_pass;
	}

	public void setMember_pass(String member_pass) {
		this.member_pass = member_pass;
	}

	public String getCmember_id() {
		return cmember_id;
	}

	public void setCmember_id(String cmember_id) {
		this.cmember_id = cmember_id;
	}

	public String getCmember_pass() {
		return cmember_pass;
	}

	public void setCmember_pass(String cmember_pass) {
		this.cmember_pass = cmember_pass;
	}

	public String getMember_type() {
		return member_type;
	}

	public void setMember_type(String member_type) {
		this.member_type = member_type;
	}
	
	
}
