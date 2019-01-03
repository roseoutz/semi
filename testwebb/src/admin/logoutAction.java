package admin;


import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class logoutAction extends ActionSupport implements SessionAware{
	
	private Map session;

	public String execute() throws Exception{
		session.remove("session_id");
		session.remove("session_type");
		
		return SUCCESS;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}
	
}
