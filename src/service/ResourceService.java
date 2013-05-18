package service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.yawlfoundation.yawl.resourcing.resource.Participant;
import org.yawlfoundation.yawl.resourcing.rsInterface.ResourceGatewayClientAdapter;
import org.yawlfoundation.yawl.resourcing.rsInterface.ResourceGatewayException;

import com.opensymphony.xwork2.ActionContext;

public class ResourceService {
	String _handle;
	String _userName = "sysu";
	String _password = "YAWL";
	String _defURI = "http://localhost:8080/resourceService/gateway";
	
	ResourceGatewayClientAdapter resAdapter = new ResourceGatewayClientAdapter(_defURI);
	Map<String, Object> session = ActionContext.getContext().getSession();
	
    private boolean connected() {
        if (!resAdapter.checkConnection(_handle)) {
            _handle = resAdapter.connect(_userName, _password) ;
            return resAdapter.successful(_handle) ;
        }
        else return true ;
    }
    
	public List<Participant> getParticipants() throws IOException, ResourceGatewayException{
		
		if(this.connected()) {
			return resAdapter.getParticipants(_handle);
		}
		
		return null;
	}
	
}