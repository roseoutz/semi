package edit;

import java.io.Reader;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import VO.khCMemberDetailVO;
import VO.khCMemberVO;

public class corpInfoViewAction extends ActionSupport implements SessionAware {
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private khCMemberVO paramClass;
	private khCMemberVO resultClass;
	
	private khCMemberDetailVO dParamClass;
	private khCMemberDetailVO dResultClass;
	
	private String cmember_id;
	private String cmember_name;
	private String cmember_phone;
	private String cmember_email;
	private String cmember_type;
	private String cmember_cname;
	private String cmember_addr;
	private String cmember_ceo;
	
	private String detail_em_num;
	private String detail_capital;
	private String detail_sales;
	private String detail_pay;
	private String detail_url;
	
	private String session_id;
	private Map session;
	
	public corpInfoViewAction() throws Exception{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception{
		paramClass = new khCMemberVO();
		resultClass = new khCMemberVO();
		
		dParamClass = new khCMemberDetailVO();
		dResultClass = new khCMemberDetailVO();
		
		paramClass.setCmember_name(getCmember_name());
		paramClass.setCmember_phone(getCmember_phone());
		paramClass.setCmember_email(getCmember_email());
		paramClass.setCmember_type(getCmember_type());
		paramClass.setCmember_cname(getCmember_cname());
		paramClass.setCmember_addr(getCmember_addr());
		paramClass.setCmember_ceo(getCmember_ceo());
		
		dParamClass.setDetail_em_num(getDetail_em_num());
		dParamClass.setDetail_capital(getDetail_capital());
		dParamClass.setDetail_pay(getDetail_pay());
		dParamClass.setDetail_sales(getDetail_sales());
		dParamClass.setDetail_url(getDetail_url());
		
		resultClass = (khCMemberVO) sqlMapper.queryForObject("selectCorpAll",session_id);
		
		dResultClass = (khCMemberDetailVO) sqlMapper.queryForObject("selectCorpDetailAll",session_id);
		
		return SUCCESS;
	}

	
	
	public khCMemberDetailVO getdParamClass() {
		return dParamClass;
	}

	public void setdParamClass(khCMemberDetailVO dParamClass) {
		this.dParamClass = dParamClass;
	}

	public khCMemberDetailVO getdResultClass() {
		return dResultClass;
	}

	public void setdResultClass(khCMemberDetailVO dResultClass) {
		this.dResultClass = dResultClass;
	}

	public khCMemberVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(khCMemberVO paramClass) {
		this.paramClass = paramClass;
	}

	public khCMemberVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(khCMemberVO resultClass) {
		this.resultClass = resultClass;
	}

	public String getCmember_id() {
		return cmember_id;
	}

	public void setCmember_id(String cmember_id) {
		this.cmember_id = cmember_id;
	}

	public String getCmember_name() {
		return cmember_name;
	}

	public void setCmember_name(String cmember_name) {
		this.cmember_name = cmember_name;
	}

	public String getCmember_phone() {
		return cmember_phone;
	}

	public void setCmember_phone(String cmember_phone) {
		this.cmember_phone = cmember_phone;
	}

	public String getCmember_email() {
		return cmember_email;
	}

	public void setCmember_email(String cmember_email) {
		this.cmember_email = cmember_email;
	}

	public String getCmember_type() {
		return cmember_type;
	}

	public void setCmember_type(String cmember_type) {
		this.cmember_type = cmember_type;
	}

	public String getCmember_cname() {
		return cmember_cname;
	}

	public void setCmember_cname(String cmember_cname) {
		this.cmember_cname = cmember_cname;
	}

	public String getCmember_addr() {
		return cmember_addr;
	}

	public void setCmember_addr(String cmember_addr) {
		this.cmember_addr = cmember_addr;
	}

	public String getCmember_ceo() {
		return cmember_ceo;
	}

	public void setCmember_ceo(String cmember_ceo) {
		this.cmember_ceo = cmember_ceo;
	}

	public String getDetail_em_num() {
		return detail_em_num;
	}

	public void setDetail_em_num(String detail_em_num) {
		this.detail_em_num = detail_em_num;
	}

	public String getDetail_capital() {
		return detail_capital;
	}

	public void setDetail_capital(String detail_capital) {
		this.detail_capital = detail_capital;
	}

	public String getDetail_sales() {
		return detail_sales;
	}

	public void setDetail_sales(String detail_sales) {
		this.detail_sales = detail_sales;
	}

	public String getDetail_pay() {
		return detail_pay;
	}

	public void setDetail_pay(String detail_pay) {
		this.detail_pay = detail_pay;
	}

	public String getDetail_url() {
		return detail_url;
	}

	public void setDetail_url(String detail_url) {
		this.detail_url = detail_url;
	}

	@Override
	public void setSession(Map session) {
		// TODO Auto-generated method stub
		session_id = (String)session.get("session_id");
		this.session = session;
	}
	
	
}
