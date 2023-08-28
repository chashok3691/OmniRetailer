package com.tlabs.posweb.beans;

import java.io.Serializable;


//@Entity
//@Table(name = "outlet_day_close_master_childs")
public class OutletDayCloseChild implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	//@Id
	//@Column(name = "sno")
	//@GeneratedValue(strategy=GenerationType.AUTO)
	private int sNo;
	
	//@Column(name = "business_task")
	private String businessTask;
	
	public Boolean getSkipBusinessTask() {
		return skipBusinessTask;
	}

	public void setSkipBusinessTask(Boolean skipBusinessTask) {
		this.skipBusinessTask = skipBusinessTask;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	//@Column(name = "sequence_order")
	private int sequenceOrder;
	
	//@Column(name = "description")
	private String description;

	//@Column(name = "print_copy")
	private int printCopy;
	
	//@Column(name = "outlet_id")
	private String outletId;
	
	//@Column(name = "business_counter")
	private String businessCounter;

	//@Column(name ="skip_business_task")
	private Boolean skipBusinessTask;
		
	
	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public String getBusinessTask() {
		return businessTask;
	}

	public void setBusinessTask(String businessTask) {
		this.businessTask = businessTask;
	}

	public int getSequenceOrder() {
		return sequenceOrder;
	}

	public void setSequenceOrder(int sequenceOrder) {
		this.sequenceOrder = sequenceOrder;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}


	public String getOutletId() {
		return outletId;
	}

	public void setOutletId(String outletId) {
		this.outletId = outletId;
	}

	public int getPrintCopy() {
		return printCopy;
	}

	public void setPrintCopy(int printCopy) {
		this.printCopy = printCopy;
	}

	public String getBusinessCounter() {
		return businessCounter;
	}

	public void setBusinessCounter(String businessCounter) {
		this.businessCounter = businessCounter;
	}

	
	
	

}
