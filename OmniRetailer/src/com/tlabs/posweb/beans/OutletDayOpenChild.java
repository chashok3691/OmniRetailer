package com.tlabs.posweb.beans;

import java.io.Serializable;



//@Entity
//@Table(name = "outlet_day_open_master_childs")
public class OutletDayOpenChild implements Serializable{

	private static final long serialVersionUID = -4325677579069535570L;

	/*@Id
	@Column(name = "sno")
	@GeneratedValue(strategy=GenerationType.AUTO)*/
	private int sNo;
	
	//@Column(name = "business_task")
	private String businessTask;
	
	//@Column(name = "sequence_order")
	private int sequenceOrder;
	
	//@Column(name = "description")
	private String description;
	
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
	private String outletLocation;
	public String getOutletLocation() {
		return outletLocation;
	}

	public void setOutletLocation(String outletLocation) {
		this.outletLocation = outletLocation;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
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

	public boolean isPrintCopy() {
		return printCopy;
	}

	public void setPrintCopy(boolean printCopy) {
		this.printCopy = printCopy;
	}

	public String getOutletId() {
		return outletId;
	}

	public void setOutletId(String outletId) {
		this.outletId = outletId;
	}

	public String getBusinessCounter() {
		return businessCounter;
	}

	public void setBusinessCounter(String businessCounter) {
		this.businessCounter = businessCounter;
	}

	

	//@Column(name = "print_copy")
	private boolean printCopy;
	
	//@Column(name = "outlet_id")
	private String outletId;
	
	//@Column(name = "business_counter")
	private String businessCounter;
	
	private boolean skipBusinessTask;

	public boolean isSkipBusinessTask() {
		return skipBusinessTask;
	}

	public void setSkipBusinessTask(boolean skipBusinessTask) {
		this.skipBusinessTask = skipBusinessTask;
	}
	
}
