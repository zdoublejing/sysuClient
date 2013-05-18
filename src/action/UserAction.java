package action;

import service.UserService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.IOException;
import java.util.Map;
import java.util.Set;

import org.yawlfoundation.yawl.engine.interfce.WorkItemRecord;
import org.yawlfoundation.yawl.resourcing.rsInterface.ResourceGatewayException;

public class UserAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	
	private String userid;
	private String passwd;
	private Set<WorkItemRecord> items;
	private UserService userService = new UserService();
	
	Map<String, Object> session = ActionContext.getContext().getSession();
	
	public String signin() throws IOException, ResourceGatewayException{		
		if( userid.trim().equals("admin") && passwd.equals("YAWL")) return "admin";
		else if( userService.login(userid.trim(), passwd))	return "user";		
		else return "error"; 

	}
	
	public String offered() throws IOException, ResourceGatewayException {		
		items = userService.getWorkQueue((String) session.get("userid"), "offered");
		return "success";
		
	}
	
	public String allocated() throws IOException, ResourceGatewayException {		
		items = userService.getWorkQueue((String) session.get("userid"), "allocated");
		return "success";
		
	}
	
	public String started() throws IOException, ResourceGatewayException {		
		items = userService.getWorkQueue((String) session.get("userid"), "started");
		return "success";
		
	}
	
	public String suspended() throws IOException, ResourceGatewayException {		
		items = userService.getWorkQueue((String) session.get("userid"), "suspended");
		return "success";
		
	}
	
	/*************************************************/

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public Set<WorkItemRecord> getItems() {
		return items;
	}

	public void setItems(Set<WorkItemRecord> items) {
		this.items = items;
	}

}
