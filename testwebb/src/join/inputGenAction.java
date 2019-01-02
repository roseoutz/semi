package join;
import java.io.IOException;
import java.io.Reader;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import VO.khMemberVO;
public class inputGenAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private khMemberVO paramClass;
	private khMemberVO resultClass;
	
	private String member_id;
	private String member_name;
	private String member_email;
	private String member_pass;
	private String member_phone;
	private Calendar today = Calendar.getInstance();
	
	public inputGenAction() throws IOException{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception{
		paramClass = new khMemberVO();
		
		paramClass.setMember_id(getMember_id());
		paramClass.setMember_name(getMember_name());
		paramClass.setMember_pass(getMember_pass());
		paramClass.setMember_email(getMember_email());
		paramClass.setMember_phone(getMember_phone());
		paramClass.setMember_date(today.getTime());
		
		sqlMapper.insert("insertGenMember", paramClass);
		
		return SUCCESS;
		
	}

	

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_pass() {
		return member_pass;
	}

	public void setMember_pass(String member_pass) {
		this.member_pass = member_pass;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
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
	
}