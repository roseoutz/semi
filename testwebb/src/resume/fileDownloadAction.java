package resume;
import com.opensymphony.xwork2.*;
import java.io.*;
public class fileDownloadAction extends ActionSupport {
	private InputStream is;
	private String ContentDisposition;
	private long ContentLength;
	
	private String fileDownloadPath="C:\\java\\upload\\";

	//¹Ì¿Ï
	public String execute() throws Exception{
		return SUCCESS;
	}
}
