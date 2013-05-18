package action;

import java.io.IOException;
import java.util.List;

import org.yawlfoundation.yawl.resourcing.resource.Participant;
import org.yawlfoundation.yawl.resourcing.rsInterface.ResourceGatewayException;

import service.ResourceService;

import com.opensymphony.xwork2.ActionSupport;

public class ParticipantAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	
	private String infoSelect;
	private List<Participant> allParticipants;
	private ResourceService resourceService = new ResourceService();
	
	public String all() throws IOException, ResourceGatewayException {
		allParticipants = resourceService.getParticipants();

		return SUCCESS;
	}
	
	public String create() {
		return SUCCESS;
	}
	
	public String info() {

		String select = this.getInfoSelect();  
		System.out.println("select: "+select);
		
		return SUCCESS;
	}
	
	/********************************************************/

	public String getInfoSelect() {
		return infoSelect;
	}

	public void setInfoSelect(String infoSelect) {
		this.infoSelect = infoSelect;
	}

	public List<Participant> getAllParticipants() {
		return allParticipants;
	}

	public void setAllParticipants(List<Participant> allParticipants) {
		this.allParticipants = allParticipants;
	}

}
