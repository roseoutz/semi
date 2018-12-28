package post;

import java.io.Reader;
import java.util.Calendar;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;

import VO.khPostVO;

public class postViewAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	public khPostVO paramClass;
	public khPostVO resultClass;
	
	private int post_no;
	private String post_subject;
	private String post_writer;
	private String post_content;
	private String post_career;
	private String post_edu;
	private String post_em_type;
	private String post_pay;
	private String post_loc;
	private String post_prefer;
	private String post_time;
	Calendar post_date = Calendar.getInstance();
}
