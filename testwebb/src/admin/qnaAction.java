package admin;
import com.opensymphony.xwork2.*;
import com.ibatis.common.resources.*;
import java.io.*;
import com.ibatis.sqlmap.client.*;
import java.util.*;
import VO.khMtmVO;

public class qnaAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private List<khMtmVO> list = new ArrayList<khMtmVO>();
	
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private pagingAction3 page;
	
	private String search;
	private String category;
	
	public qnaAction() throws IOException{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception{
		if(getCategory() == null) {
			list = sqlMapper.queryForList("selectQnaAll");
		}else if(getCategory().equals("id")) {
			list = sqlMapper.queryForList("selectQnaId", getSearch());
		}else if(getCategory().equals("type")) {
			list = sqlMapper.queryForList("selectQnaType", getSearch());
		}
		totalCount = list.size();
		
		page = new pagingAction3(currentPage, totalCount, blockCount, blockPage, getCategory(), getSearch());
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount) {
			lastCount = page.getEndCount() + 1;
		}
		
		list = list.subList(page.getStartCount(), lastCount);
		
		return SUCCESS;
	}

	public List<khMtmVO> getList() {
		return list;
	}

	public void setList(List<khMtmVO> list) {
		this.list = list;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getBlockCount() {
		return blockCount;
	}

	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
	}

	public int getBlockPage() {
		return blockPage;
	}

	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}

	public String getPagingHtml() {
		return pagingHtml;
	}

	public void setPagingHtml(String pagingHtml) {
		this.pagingHtml = pagingHtml;
	}

	public pagingAction3 getPage() {
		return page;
	}

	public void setPage(pagingAction3 page) {
		this.page = page;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

}
