package edit;

import java.io.Reader;
import java.util.Date;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import VO.khCMemberDetailVO;
import VO.khCMemberVO;

public class corpInfoEditAction extends ActionSupport implements SessionAware {
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private khCMemberVO paramClass;
	private khCMemberDetailVO dParamClass;

	private Map session;
	private String session_id;

	private String cmember_phone;
	private String cmember_email;
	private String cmember_type;
	private String cmember_cname;
	private String cmember_addr;
	private String cmember_ceo;
	private String cmember_pdate;
	
	private String detail_em_num;
	private String detail_capital;
	private String detail_sales;
	private String detail_pay;
	private String detail_logo;
	private String detail_url;
	private String detail_dept;

	public corpInfoEditAction() throws Exception {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception {
		paramClass = new khCMemberVO();
		dParamClass = new khCMemberDetailVO();
		
		session_id = (String) session.get("session_id");
		
		paramClass.setCmember_id(session_id);
		paramClass.setCmember_email(getCmember_email());
		paramClass.setCmember_phone(getCmember_phone());
		paramClass.setCmember_type(getCmember_type());
		paramClass.setCmember_addr(getCmember_addr());
		paramClass.setCmember_ceo(getCmember_ceo());
		paramClass.setCmember_cname(getCmember_cname());
		paramClass.setCmember_pdate(getCmember_pdate());
		
		dParamClass.setDetail_cmember_id(session_id);
		dParamClass.setDetail_em_num(getDetail_em_num());
		dParamClass.setDetail_pay(getDetail_pay());
		dParamClass.setDetail_sales(getDetail_sales());
		dParamClass.setDetail_url(getDetail_url());
		dParamClass.setDetail_capital(getDetail_capital());
		dParamClass.setDetail_logo(getDetail_logo());
		dParamClass.setDetail_dept(getDetail_dept());
		
		sqlMapper.update("updateCorpInfo",paramClass);
		sqlMapper.update("updateCorpDetailInfo",dParamClass);
		return SUCCESS;
	}

	public khCMemberVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(khCMemberVO paramClass) {
		this.paramClass = paramClass;
	}

	public khCMemberDetailVO getdParamClass() {
		return dParamClass;
	}

	public void setdParamClass(khCMemberDetailVO dParamClass) {
		this.dParamClass = dParamClass;
	}

	public void setSession(Map session) {
		this.session = session;
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

	public String getDetail_logo() {
		return detail_logo;
	}

	public void setDetail_logo(String detail_logo) {
		this.detail_logo = detail_logo;
	}

	public String getDetail_url() {
		return detail_url;
	}

	public void setDetail_url(String detail_url) {
		this.detail_url = detail_url;
	}

	public String getDetail_dept() {
		return detail_dept;
	}

	public void setDetail_dept(String detail_dept) {
		this.detail_dept = detail_dept;
	}

	public String getCmember_pdate() {
		return cmember_pdate;
	}

	public void setCmember_pdate(String cmember_pdate) {
		this.cmember_pdate = cmember_pdate;
	}

}
