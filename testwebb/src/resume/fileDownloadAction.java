package resume;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URLEncoder;

import com.opensymphony.xwork2.ActionSupport;
public class fileDownloadAction extends ActionSupport {
	private InputStream inputStream;
	private String ContentDisposition;
	private long ContentLength;
	
	private String fileDownloadPath="C:\\java\\upload\\";
	private String fileDownloadName;

	//¹Ì¿Ï
	public String execute() throws Exception{
		File fileinfo = new File(fileDownloadPath + getFileDownloadName());
		setContentLength(fileinfo.length());
		setContentDisposition("attachment;filename="+URLEncoder.encode(getFileDownloadName(), "UTF-8"));
		setInputStream(new FileInputStream(fileDownloadPath + getFileDownloadName()));
		return SUCCESS;
	}

	

	public String getContentDisposition() {
		return ContentDisposition;
	}

	public void setContentDisposition(String contentDisposition) {
		ContentDisposition = contentDisposition;
	}

	public long getContentLength() {
		return ContentLength;
	}

	public void setContentLength(long contentLength) {
		ContentLength = contentLength;
	}

	public String getFileDownloadPath() {
		return fileDownloadPath;
	}

	public void setFileDownloadPath(String fileDownloadPath) {
		this.fileDownloadPath = fileDownloadPath;
	}

	public String getFileDownloadName() {
		return fileDownloadName;
	}

	public void setFileDownloadName(String fileDownloadName) {
		this.fileDownloadName = fileDownloadName;
	}



	public InputStream getInputStream() {
		return inputStream;
	}



	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
}
