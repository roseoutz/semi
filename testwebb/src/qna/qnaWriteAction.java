package qna;

import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.util.Calendar;

import org.apache.commons.io.FileUtils;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class qnaWriteAction extends ActionSupport{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private qnaVO paramClass;
	private qnaVO resultClass;
	
	private int no;
	private String noticeType;
	private String noticeContent;
	private String noticeEmail;
	private String file_orgName;
	private String file_savName;
	Calendar today = Calendar.getInstance();
	
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private String fileUploadPath = "/Users/donggyukim/Desktop/file/";
	
	public qnaWriteAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	public String form() throws Exception {
		return SUCCESS;
	}
	
	public String execute() throws Exception {
		paramClass = new qnaVO();
		resultClass = new qnaVO();
		
		paramClass.setNoticeContent(getNoticeContent());
		paramClass.setNoticeEmail(getNoticeEmail());
		paramClass.setNoticeType(getNoticeType());
		paramClass.setNoticeWriteDate(today.getTime());
		if(getUpload()!=null) {
			resultClass = (qnaVO)sqlMapper.queryForObject("");
			String file_name = "file_"+resultClass.getNoticeOrgFileName();
			String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf(".")+1, getUploadFileName().length());
			File destFile = new File(fileUploadPath+file_name+"."+file_ext);
			FileUtils.copyFile(getUpload(), destFile);
			
			paramClass.setNoticeOrgFileName(getUploadFileName());
			paramClass.setNoticeSavFileName(file_name+"."+file_ext);
			sqlMapper.update("updateFile", paramClass);
		}
		return SUCCESS;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		qnaWriteAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		qnaWriteAction.sqlMapper = sqlMapper;
	}

	public qnaVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(qnaVO paramClass) {
		this.paramClass = paramClass;
	}

	public qnaVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(qnaVO resultClass) {
		this.resultClass = resultClass;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getNoticeType() {
		return noticeType;
	}

	public void setNoticeType(String noticeType) {
		this.noticeType = noticeType;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getFile_orgName() {
		return file_orgName;
	}

	public void setFile_orgName(String file_orgName) {
		this.file_orgName = file_orgName;
	}

	public String getFile_savName() {
		return file_savName;
	}

	public void setFile_savName(String file_savName) {
		this.file_savName = file_savName;
	}

	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getFileUploadPath() {
		return fileUploadPath;
	}

	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}
	public String getNoticeEmail() {
		return noticeEmail;
	}
	public void setNoticeEmail(String noticeEmail) {
		this.noticeEmail = noticeEmail;
	}
	
	
}
