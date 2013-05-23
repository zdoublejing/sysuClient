package service;

import java.io.IOException;
import java.util.Map;
import java.util.Set;

import org.yawlfoundation.yawl.engine.interfce.WorkItemRecord;
import org.yawlfoundation.yawl.resourcing.resource.Participant;
import org.yawlfoundation.yawl.resourcing.rsInterface.ResourceGatewayException;
import org.yawlfoundation.yawl.resourcing.rsInterface.WorkQueueGatewayClientAdapter;
import com.opensymphony.xwork2.ActionContext;

public class WorkQueueService{
	String _handle;
	String _userName = "sysu";
	String _password = "YAWL";
	String _defURI = "http://localhost:8080/resourceService/workqueuegateway";
	
	WorkQueueGatewayClientAdapter wqAdapter = new WorkQueueGatewayClientAdapter(_defURI);
	Map<String, Object> session = ActionContext.getContext().getSession();

    private boolean connected() {
        if (!wqAdapter.checkConnection(_handle)) {
            _handle = wqAdapter.connect(_userName, _password) ;
            return wqAdapter.successful(_handle) ;
        }
        else return true ;
    }
    
	public Participant getParticipantFromUserid(String userid) throws IOException, ResourceGatewayException {
		if(this.connected()) {
			return wqAdapter.getParticipantFromUserID(userid, _handle);
		}
		return null;
	}

	public boolean isAdmin(String userid) throws IOException, ResourceGatewayException {
		Participant pa = wqAdapter.getParticipantFromUserID(userid, _handle);
		
		if(pa.isAdministrator()) return true;
		else return false;
		
	}
	
	public boolean login(String userid, String password) throws IOException, ResourceGatewayException {
		String userhandle = wqAdapter.userlogin(userid, password);
		
		if(this.connected() && wqAdapter.isValidUserSession(userhandle)) {
			session.put("userhandle", userhandle);
			session.put("userid", userid);

			return true;
		}
		return false;

	}

	public void logout() {
		String userhandle = (String) session.get("userhandle");
		
		wqAdapter.userlogout(userhandle);
		
		session.remove("userhandle");
		session.remove("userid");
	}
	
	public Set<WorkItemRecord> getWorkQueue(String userid, String queueType) throws IOException, ResourceGatewayException {
		
		if(this.connected()) {
			Participant pa = this.getParticipantFromUserid(userid);
			
			if(queueType.equals("offered"))
				return wqAdapter.getQueuedWorkItems(pa.getID(), 0, _handle);
			else if(queueType.equals("allocated"))
				return wqAdapter.getQueuedWorkItems(pa.getID(), 1, _handle);
			else if(queueType.equals("started"))
				return wqAdapter.getQueuedWorkItems(pa.getID(), 2, _handle);
			else if(queueType.equals("suspended"))
				return wqAdapter.getQueuedWorkItems(pa.getID(), 3, _handle);
			else if(queueType.equals("unoffered") && this.isAdmin(userid))
				return wqAdapter.getQueuedWorkItems(pa.getID(), 4, _handle);
			else if(queueType.equals("worklisted") && this.isAdmin(userid))
				return wqAdapter.getQueuedWorkItems(pa.getID(), 5, _handle);
			
			else return null;
			/*
			 *UNDEFINED = -1 ;
			 *OFFERED = 0 ;
			 *ALLOCATED = 1 ;
			 *STARTED = 2 ;
			 *SUSPENDED = 3 ;
			 *UNOFFERED = 4 ;                  // administrator only
			 *WORKLISTED = 5 ;                 // administrator only
			 */
		}
		
		return null;
	}
	
	public void acceptoffer(String userid, String selectedItem) throws IOException, ResourceGatewayException {
		if(this.connected()) {
			
			Participant pa = this.getParticipantFromUserid(userid);
			
			System.out.println("selectedItem:"+selectedItem);
			
			wqAdapter.acceptOffer(pa.getID(), selectedItem, _handle);
		}
		
	}

	public void start(String userid, String selectedItem) throws IOException, ResourceGatewayException {
		if(this.connected()) {
			
			Participant pa = this.getParticipantFromUserid(userid);
			
			System.out.println("selectedItem:"+selectedItem);
			
			wqAdapter.startItem(pa.getID(), selectedItem, _handle);
		}
		
	}

}