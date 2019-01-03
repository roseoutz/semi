package edit;

import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import VO.khMemberVO;

public class geEditAction extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private khMemberVO paramClass;
	private khMemberVO resultClass;
	
	private String id;
	private String name;
	private String phone;
	private String email;
	private String pass;
	
	public geEditAction() throws Exception{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception {
		paramClass = new khMemberVO();
		resultClass = new khMemberVO();
		
		paramClass.setMember_id(getId());
		paramClass.setMember_name(getName());
		paramClass.setMember_pass(getPass());
		paramClass.setMember_phone(getPhone());
		paramClass.setMember_email(getEmail());
		
		sqlMapper.update("updateGeInfo",getId());
		return SUCCESS;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}
	
}
