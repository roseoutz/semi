package edit;

import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import VO.khMemberVO;

public class geInfoEditAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private khMemberVO paramClass;
	private khMemberVO resultClass;
	
	private String member_phone;
	private String member_email;


	
	public geInfoEditAction() throws Exception {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception{
		paramClass = new khMemberVO();
		resultClass = new khMemberVO();
		
		sqlMapper.update("updateGeInfo",paramClass);
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

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	
}
