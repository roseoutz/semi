package notice;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

public class noticeListAction extends ActionSupport {

	private List<noticeVO> list = new ArrayList<noticeVO>();
	
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private pagingAction paging;
}
