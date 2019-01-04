package admin;
import com.opensymphony.xwork2.*;
import com.ibatis.common.resources.*;
import com.ibatis.sqlmap.client.*;
import java.io.*;

public class deleteqnaAction extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private String no;
	
	public deleteqnaAction() throws IOException{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception{
		sqlMapper.delete("deleteQna", getNo());
		return SUCCESS;
	}
	
	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

}
