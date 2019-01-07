package edit;

import java.io.Reader;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import VO.khMemberVO;

public class geInfoViewAction extends ActionSupport implements SessionAware{
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private khMemberVO paramClass;
	private khMemberVO resultClass;

	private String member_id;
	private String member_name;
	private String member_phone;
	private String member_email;
	
	private Map session = null;
	private String session_id;
	
	//private HttpSession session = request.getSession();
	
	//constructor
	public geInfoViewAction() throws Exception{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	@Override
	public void setSession(Map session) {
		// TODO Auto-generated method stub
		this.session = session;
	}
	
	public String execute() throws Exception {
		paramClass = new khMemberVO();
		resultClass = new khMemberVO();
		//paramClass.setMember_id((String)session.getAttribute("session_id"));
		
		session_id = (String) session.get("session_id");
		
		paramClass.setMember_name(getMember_name());
		paramClass.setMember_email(getMember_email());
		paramClass.setMember_phone(getMember_phone());
		
		resultClass = (khMemberVO) sqlMapper.queryForObject("selectGeAll", session_id);
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
