package simpleqna;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import VO.khMtmVO;

public class qaList extends ActionSupport {

	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private List<khMtmVO> list = new ArrayList<khMtmVO>();
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	//priavte String pagingHtml;
	//private qaListPaging page;
	
	public qaList() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception{
		list = sqlMapper.queryForList("selectAllmtm");
		totalCount = list.size();
		
		
		
	}
}
