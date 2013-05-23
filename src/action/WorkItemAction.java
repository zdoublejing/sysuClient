package action;

import java.io.IOException;
import java.util.Map;
import java.util.Set;

import org.yawlfoundation.yawl.engine.interfce.WorkItemRecord;
import org.yawlfoundation.yawl.resourcing.rsInterface.ResourceGatewayException;

import service.WorkQueueService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class WorkItemAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Set<WorkItemRecord> items;
	private String selectedItem;
	private WorkQueueService workQueueService = new WorkQueueService();
	
	private Map<String, Object> session = ActionContext.getContext().getSession();	
	
	public String acceptoffer() throws IOException, ResourceGatewayException {
		workQueueService.acceptoffer((String) session.get("userid"), selectedItem);
		items = workQueueService.getWorkQueue((String) session.get("userid"), "offered");
		return "success";
	}
	
	public String start() throws IOException, ResourceGatewayException {
		workQueueService.start((String) session.get("userid"), selectedItem);
		items = workQueueService.getWorkQueue((String) session.get("userid"), "allocated");
		return "success";
	}

	/******************************************************/
	
	public String getSelectedItem() {
		return selectedItem;
	}

	public void setSelectedItem(String selectedItem) {
		this.selectedItem = selectedItem;
	}

	public Set<WorkItemRecord> getItems() {
		return items;
	}

	public void setItems(Set<WorkItemRecord> items) {
		this.items = items;
	}
	

}