package applyManage;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import VO.khApplyHrVO;
import VO.khApplyViewVO;

public class applyManageDeleteAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private khApplyHrVO paramClass;

	private int apply_no;
	private String apply_m_id;
	private String apply_c_id;

	public applyManageDeleteAction() throws Exception {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception {
		paramClass = new khApplyHrVO();

		paramClass.setApply_no(getApply_no());
		paramClass.setApply_c_id(getApply_c_id());
		paramClass.setApply_m_id(getApply_m_id());
		
		sqlMapper.delete("deleteApply",getApply_no());
		return SUCCESS;
	}

	public khApplyHrVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(khApplyHrVO paramClass) {
		this.paramClass = paramClass;
	}

	public int getApply_no() {
		return apply_no;
	}

	public void setApply_no(int apply_no) {
		this.apply_no = apply_no;
	}

	public String getApply_m_id() {
		return apply_m_id;
	}

	public void setApply_m_id(String apply_m_id) {
		this.apply_m_id = apply_m_id;
	}

	public String getApply_c_id() {
		return apply_c_id;
	}

	public void setApply_c_id(String apply_c_id) {
		this.apply_c_id = apply_c_id;
	}

}
