package com.tlabs.posweb.beans;

import java.util.Date;
import java.util.List;
import java.util.Set;






public class EventMaster {
	private String sNo;
	private String eventReference;

	private String eventName;
	private String eventDescription;

	
	private String eventType;

	
	private String menuId;


	private String event_status;

	
	private String outletStoreLocation;
	private String actualSales;
	
	private int noOfCounters = 0;
	private int submissionCount=1;
	private int pageno=1;
	private int equippageno=1;
	private int manPageno=1;
	
	private String zoneId;
	private boolean saveReport=false;
	private String url;
	
	private boolean printReturnDeliveryChallanRequired=false;
	private List<Integer> array;
	
	

	

	public List<Integer> getArray() {
		return array;
	}

	public void setArray(List<Integer> array) {
		this.array = array;
	}

	public String getActualSales() {
		return actualSales;
	}

	public void setActualSales(String actualSales) {
		this.actualSales = actualSales;
	}

	public String getZoneId() {
		return zoneId;
	}

	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}

	public boolean isSaveReport() {
		return saveReport;
	}

	public void setSaveReport(boolean saveReport) {
		this.saveReport = saveReport;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public boolean isPrintReturnDeliveryChallanRequired() {
		return printReturnDeliveryChallanRequired;
	}

	public void setPrintReturnDeliveryChallanRequired(boolean printReturnDeliveryChallanRequired) {
		this.printReturnDeliveryChallanRequired = printReturnDeliveryChallanRequired;
	}

	public int getEquippageno() {
		return equippageno;
	}

	public void setEquippageno(int equippageno) {
		this.equippageno = equippageno;
	}

	public int getManPageno() {
		return manPageno;
	}

	public void setManPageno(int manPageno) {
		this.manPageno = manPageno;
	}

	public int getPageno() {
		return pageno;
	}

	public void setPageno(int pageno) {
		this.pageno = pageno;
	}

	public int getSubmissionCount() {
		return submissionCount;
	}

	public void setSubmissionCount(int submissionCount) {
		this.submissionCount = submissionCount;
	}

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	
	private Date createdDate;

	
	private Date updatedDate;

	private Date startDate;

	private Date endDate;

	private String outDoorCateringLocation;

	private String odcPlotNumber;

	private String odcCity;

	private String odcPinCode;

	private String odcContactPersoneMobileNumber;

	private String odcContactPersoneEmail;

	private String customerName;

	private String customerEmail;

	private String customerMobileNumber;

	private String customerPanNumber;

	private String customerGstNumber;

	private String customerPlotNumber;

	private String customerLocation;

	private String customerPinCode;

	private boolean is_it_agreement_done = false;
	private String searchCriteria;
	
	private boolean eventStatus = false;
	
private List<EventInventoryReturnDetails> eventInventoryReturnDetails;
	
	private List<EventEquipmentReturnDetails> eventEquipmentReturnDetails;
	
	private boolean printRequired=true;
	
	private String workflowStatus;
	
	private boolean equipmentPrintRequired=false;
	
	
	private String dc_OrginalPrintURL;
    private String dc_DuplicatePrintURL;
    private String dc_TriplicatePrintURL;

	
    
    
	

	

	public String getDc_OrginalPrintURL() {
		return dc_OrginalPrintURL;
	}

	public void setDc_OrginalPrintURL(String dc_OrginalPrintURL) {
		this.dc_OrginalPrintURL = dc_OrginalPrintURL;
	}

	public String getDc_DuplicatePrintURL() {
		return dc_DuplicatePrintURL;
	}

	public void setDc_DuplicatePrintURL(String dc_DuplicatePrintURL) {
		this.dc_DuplicatePrintURL = dc_DuplicatePrintURL;
	}

	public String getDc_TriplicatePrintURL() {
		return dc_TriplicatePrintURL;
	}

	public void setDc_TriplicatePrintURL(String dc_TriplicatePrintURL) {
		this.dc_TriplicatePrintURL = dc_TriplicatePrintURL;
	}

	public boolean isEquipmentPrintRequired() {
		return equipmentPrintRequired;
	}

	public void setEquipmentPrintRequired(boolean equipmentPrintRequired) {
		this.equipmentPrintRequired = equipmentPrintRequired;
	}

	public String getWorkflowStatus() {
		return workflowStatus;
	}

	public void setWorkflowStatus(String workflowStatus) {
		this.workflowStatus = workflowStatus;
	}

	public boolean isPrintRequired() {
		return printRequired;
	}

	public void setPrintRequired(boolean printRequired) {
		this.printRequired = printRequired;
	}

	public List<EventInventoryReturnDetails> getEventInventoryReturnDetails() {
		return eventInventoryReturnDetails;
	}

	public void setEventInventoryReturnDetails(List<EventInventoryReturnDetails> eventInventoryReturnDetails) {
		this.eventInventoryReturnDetails = eventInventoryReturnDetails;
	}

	public List<EventEquipmentReturnDetails> getEventEquipmentReturnDetails() {
		return eventEquipmentReturnDetails;
	}

	public void setEventEquipmentReturnDetails(List<EventEquipmentReturnDetails> eventEquipmentReturnDetails) {
		this.eventEquipmentReturnDetails = eventEquipmentReturnDetails;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	public String getDiscountType() {
		return discountType;
	}

	public void setDiscountType(String discountType) {
		this.discountType = discountType;
	}

	public Double getDiscountAmount() {
		return discountAmount;
	}

	public void setDiscountAmount(Double discountAmount) {
		this.discountAmount = discountAmount;
	}

	private String agreementDoc;

	private String agreementDoc2;

	private String agreementDoc3;

	private String leadChannel;

	private String salePerson;

	private Double totalAmount = 0.0;

	private String discountType;

	private Double discountAmount = 0.0;

	private String paymentMode;
	private String cardType;

	private String paymentReference;

	private String customerType;
                                      
	private String customerLocationCity;

	private Double taxPercentage = 0.0;

	private String countersRequired;

	private String expectedSales;

	private String manPower;

	private String termsAndConditions;

	private String userName;

	private String roleName;

	private List<EventManPowerDetails> EventManPowerDetails;

	private List<Menu> menuDetails;

	
	private List<EventEquipmentDetails> eventEquipmentDetails;

	
	private List<EventInventoryIssueDetails> eventInventoryIssueDetails;

	private RequestHeader requestHeader;

	private String createdDateStr;

	private String updatedDateStr;

	private String startDateStr;

	private String endDateStr;
	
	
	
	private List<EventMaster> listOfEvents;

	
	private ResponseHeader ResponseHeader;


	private boolean summery;
	
   private String startIndex;
	
	private String maxRecords;
	
	private int totalRecords;
	
     private String doc1;
     
     private String doc2;
     
     private String doc3;
	
 	private String agreementDocId;

 	private String agreementDoc2Id;

 	private String agreementDoc3Id;
	
	private Double profit = 0.0;


	private String odcLocality;
	
	private String operation;
	
	private Set<EventPaymentTransactions> eventPaymentTransactions;
	
	private String saleType;
	
	private String printURL;
	
	private List<String> workFlowActivities;

	private List<String> nextWorkFlowStates;
	
	private List<String> workFlowList;
	
	private List<String> nextActivities;
	
	
	private String approvedBy;
	private String printDeliveryChallan;
	
	private boolean printDeliveryChallanRequired=false;
	
	private Date dueDate;
	private String dueDateStr="";
	
	
	private String bankName="";

	
	private List<String> userActivitiesForMenu;
	
	private List<String> userActivitiesForEquipment;
	
	private List<String> userActivitiesForManPower;

	private List<String> userActivitiesForInventory;
	
	private List<String> userActivitiesForConfigure;
	
	
	
	
	
	
	
	
	
	

	public List<String> getUserActivitiesForMenu() {
		return userActivitiesForMenu;
	}

	public void setUserActivitiesForMenu(List<String> userActivitiesForMenu) {
		this.userActivitiesForMenu = userActivitiesForMenu;
	}

	public List<String> getUserActivitiesForEquipment() {
		return userActivitiesForEquipment;
	}

	public void setUserActivitiesForEquipment(List<String> userActivitiesForEquipment) {
		this.userActivitiesForEquipment = userActivitiesForEquipment;
	}

	public List<String> getUserActivitiesForManPower() {
		return userActivitiesForManPower;
	}

	public void setUserActivitiesForManPower(List<String> userActivitiesForManPower) {
		this.userActivitiesForManPower = userActivitiesForManPower;
	}

	public List<String> getUserActivitiesForInventory() {
		return userActivitiesForInventory;
	}

	public void setUserActivitiesForInventory(List<String> userActivitiesForInventory) {
		this.userActivitiesForInventory = userActivitiesForInventory;
	}

	public List<String> getUserActivitiesForConfigure() {
		return userActivitiesForConfigure;
	}

	public void setUserActivitiesForConfigure(List<String> userActivitiesForConfigure) {
		this.userActivitiesForConfigure = userActivitiesForConfigure;
	}

	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	/**
	 * @return the bankName
	 */
	public String getBankName() {
		return bankName;
	}

	/**
	 * @param bankName the bankName to set
	 */
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public List<String> getNextActivities() {
		return nextActivities;
	}

	public void setNextActivities(List<String> nextActivities) {
		this.nextActivities = nextActivities;
	}

	public String getDueDateStr() {
		return dueDateStr;
	}

	public void setDueDateStr(String dueDateStr) {
		this.dueDateStr = dueDateStr;
	}

	public Date getDueDate() {
		return dueDate;
	}

	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}

	public boolean isPrintDeliveryChallanRequired() {
		return printDeliveryChallanRequired;
	}

	public void setPrintDeliveryChallanRequired(boolean printDeliveryChallanRequired) {
		this.printDeliveryChallanRequired = printDeliveryChallanRequired;
	}

	public String getApprovedBy() {
		return approvedBy;
	}

	public void setApprovedBy(String approvedBy) {
		this.approvedBy = approvedBy;
	}

	public String getPrintDeliveryChallan() {
		return printDeliveryChallan;
	}

	public void setPrintDeliveryChallan(String printDeliveryChallan) {
		this.printDeliveryChallan = printDeliveryChallan;
	}

	public List<String> getWorkFlowActivities() {
		return workFlowActivities;
	}

	public void setWorkFlowActivities(List<String> workFlowActivities) {
		this.workFlowActivities = workFlowActivities;
	}

	public List<String> getNextWorkFlowStates() {
		return nextWorkFlowStates;
	}

	public void setNextWorkFlowStates(List<String> nextWorkFlowStates) {
		this.nextWorkFlowStates = nextWorkFlowStates;
	}

	public List<String> getWorkFlowList() {
		return workFlowList;
	}

	public void setWorkFlowList(List<String> workFlowList) {
		this.workFlowList = workFlowList;
	}

	public String getPrintURL() {
		return printURL;
	}

	public void setPrintURL(String printURL) {
		this.printURL = printURL;
	}

	public String getSaleType() {
		return saleType;
	}

	public void setSaleType(String saleType) {
		this.saleType = saleType;
	}

	public Set<EventPaymentTransactions> getEventPaymentTransactions() {
		return eventPaymentTransactions;
	}

	public void setEventPaymentTransactions(Set<EventPaymentTransactions> eventPaymentTransactions) {
		this.eventPaymentTransactions = eventPaymentTransactions;
	}

	public String getOperation() {
		return operation;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	public Double getProfit() {
		return profit;
	}

	public void setProfit(Double profit) {
		this.profit = profit;
	}

	public String getOdcLocality() {
		return odcLocality;
	}

	public void setOdcLocality(String odcLocality) {
		this.odcLocality = odcLocality;
	}

	public String getAgreementDocId() {
		return agreementDocId;
	}

	public void setAgreementDocId(String agreementDocId) {
		this.agreementDocId = agreementDocId;
	}

	public String getAgreementDoc2Id() {
		return agreementDoc2Id;
	}

	public void setAgreementDoc2Id(String agreementDoc2Id) {
		this.agreementDoc2Id = agreementDoc2Id;
	}

	public String getAgreementDoc3Id() {
		return agreementDoc3Id;
	}

	public void setAgreementDoc3Id(String agreementDoc3Id) {
		this.agreementDoc3Id = agreementDoc3Id;
	}

	public String getDoc1() {
		return doc1;
	}

	public void setDoc1(String doc1) {
		this.doc1 = doc1;
	}

	public String getDoc2() {
		return doc2;
	}

	public void setDoc2(String doc2) {
		this.doc2 = doc2;
	}

	public String getDoc3() {
		return doc3;
	}

	public void setDoc3(String doc3) {
		this.doc3 = doc3;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public String getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}

	public String getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}

	

	public boolean isEventStatus() {
		return eventStatus;
	}

	public void setEventStatus(boolean eventStatus) {
		this.eventStatus = eventStatus;
	}

	public boolean isSummery() {
		return summery;
	}

	public void setSummery(boolean summery) {
		this.summery = summery;
	}

	

	public String getAgreementDoc2() {
		return agreementDoc2;
	}

	public void setAgreementDoc2(String agreementDoc2) {
		this.agreementDoc2 = agreementDoc2;
	}

	public String getAgreementDoc3() {
		return agreementDoc3;
	}

	public void setAgreementDoc3(String agreementDoc3) {
		this.agreementDoc3 = agreementDoc3;
	}

	public ResponseHeader getResponseHeader() {
		return ResponseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		ResponseHeader = responseHeader;
	}

	public List<EventMaster> getListOfEvents() {
		return listOfEvents;
	}

	public void setListOfEvents(List<EventMaster> listOfEvents) {
		this.listOfEvents = listOfEvents;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	

	public List<EventManPowerDetails> getEventManPowerDetails() {
		return EventManPowerDetails;
	}

	public void setEventManPowerDetails(List<EventManPowerDetails> eventManPowerDetails) {
		EventManPowerDetails = eventManPowerDetails;
	}

	public List<Menu> getMenuDetails() {
		return menuDetails;
	}

	public void setMenuDetails(List<Menu> menuDetails) {
		this.menuDetails = menuDetails;
	}

	public List<EventEquipmentDetails> getEventEquipmentDetails() {
		return eventEquipmentDetails;
	}

	public void setEventEquipmentDetails(List<EventEquipmentDetails> eventEquipmentDetails) {
		this.eventEquipmentDetails = eventEquipmentDetails;
	}

	public List<EventInventoryIssueDetails> getEventInventoryIssueDetails() {
		return eventInventoryIssueDetails;
	}

	public void setEventInventoryIssueDetails(List<EventInventoryIssueDetails> eventInventoryIssueDetails) {
		this.eventInventoryIssueDetails = eventInventoryIssueDetails;
	}

	public String getsNo() {
		return sNo;
	}

	public void setsNo(String sNo) {
		this.sNo = sNo;
	}

	public String getEventReference() {
		return eventReference;
	}

	public void setEventReference(String eventReference) {
		this.eventReference = eventReference;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public String getEventDescription() {
		return eventDescription;
	}

	public void setEventDescription(String eventDescription) {
		this.eventDescription = eventDescription;
	}

	public String getEventType() {
		return eventType;
	}

	public void setEventType(String eventType) {
		this.eventType = eventType;
	}

	public String getEvent_status() {
		return event_status;
	}

	public void setEvent_status(String event_status) {
		this.event_status = event_status;
	}

	public String getOutletStoreLocation() {
		return outletStoreLocation;
	}

	public void setOutletStoreLocation(String outletStoreLocation) {
		this.outletStoreLocation = outletStoreLocation;
	}

	public int getNoOfCounters() {
		return noOfCounters;
	}

	public void setNoOfCounters(int noOfCounters) {
		this.noOfCounters = noOfCounters;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getOutDoorCateringLocation() {
		return outDoorCateringLocation;
	}

	public void setOutDoorCateringLocation(String outDoorCateringLocation) {
		this.outDoorCateringLocation = outDoorCateringLocation;
	}

	public String getOdcPlotNumber() {
		return odcPlotNumber;
	}

	public void setOdcPlotNumber(String odcPlotNumber) {
		this.odcPlotNumber = odcPlotNumber;
	}

	public String getOdcCity() {
		return odcCity;
	}

	public void setOdcCity(String odcCity) {
		this.odcCity = odcCity;
	}

	public String getOdcPinCode() {
		return odcPinCode;
	}

	public void setOdcPinCode(String odcPinCode) {
		this.odcPinCode = odcPinCode;
	}

	public String getOdcContactPersoneMobileNumber() {
		return odcContactPersoneMobileNumber;
	}

	public void setOdcContactPersoneMobileNumber(String odcContactPersoneMobileNumber) {
		this.odcContactPersoneMobileNumber = odcContactPersoneMobileNumber;
	}

	public String getOdcContactPersoneEmail() {
		return odcContactPersoneEmail;
	}

	public void setOdcContactPersoneEmail(String odcContactPersoneEmail) {
		this.odcContactPersoneEmail = odcContactPersoneEmail;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerEmail() {
		return customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}

	public String getCustomerMobileNumber() {
		return customerMobileNumber;
	}

	public void setCustomerMobileNumber(String customerMobileNumber) {
		this.customerMobileNumber = customerMobileNumber;
	}

	public String getCustomerPanNumber() {
		return customerPanNumber;
	}

	public void setCustomerPanNumber(String customerPanNumber) {
		this.customerPanNumber = customerPanNumber;
	}

	public String getCustomerGstNumber() {
		return customerGstNumber;
	}

	public void setCustomerGstNumber(String customerGstNumber) {
		this.customerGstNumber = customerGstNumber;
	}

	public String getCustomerPlotNumber() {
		return customerPlotNumber;
	}

	public void setCustomerPlotNumber(String customerPlotNumber) {
		this.customerPlotNumber = customerPlotNumber;
	}

	public String getCustomerLocation() {
		return customerLocation;
	}

	public void setCustomerLocation(String customerLocation) {
		this.customerLocation = customerLocation;
	}

	public String getCustomerPinCode() {
		return customerPinCode;
	}

	public void setCustomerPinCode(String customerPinCode) {
		this.customerPinCode = customerPinCode;
	}

	public boolean isIs_it_agreement_done() {
		return is_it_agreement_done;
	}

	public void setIs_it_agreement_done(boolean is_it_agreement_done) {
		this.is_it_agreement_done = is_it_agreement_done;
	}

	public String getAgreementDoc() {
		return agreementDoc;
	}

	public void setAgreementDoc(String agreementDoc) {
		this.agreementDoc = agreementDoc;
	}

	public String getLeadChannel() {
		return leadChannel;
	}

	public void setLeadChannel(String leadChannel) {
		this.leadChannel = leadChannel;
	}

	public String getSalePerson() {
		return salePerson;
	}

	public void setSalePerson(String salePerson) {
		this.salePerson = salePerson;
	}

	public Double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(Double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getPaymentMode() {
		return paymentMode;
	}

	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}

	public String getCustomerType() {
		return customerType;
	}

	public void setCustomerType(String customerType) {
		this.customerType = customerType;
	}

	public String getCustomerLocationCity() {
		return customerLocationCity;
	}

	public void setCustomerLocationCity(String customerLocationCity) {
		this.customerLocationCity = customerLocationCity;
	}

	public Double getTaxPercentage() {
		return taxPercentage;
	}

	public void setTaxPercentage(Double taxPercentage) {
		this.taxPercentage = taxPercentage;
	}

	public String getCountersRequired() {
		return countersRequired;
	}

	public void setCountersRequired(String countersRequired) {
		this.countersRequired = countersRequired;
	}

	public String getExpectedSales() {
		return expectedSales;
	}

	public void setExpectedSales(String expectedSales) {
		this.expectedSales = expectedSales;
	}

	public String getManPower() {
		return manPower;
	}

	public void setManPower(String manPower) {
		this.manPower = manPower;
	}

	public String getTermsAndConditions() {
		return termsAndConditions;
	}

	public void setTermsAndConditions(String termsAndConditions) {
		this.termsAndConditions = termsAndConditions;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getUpdatedDateStr() {
		return updatedDateStr;
	}

	public void setUpdatedDateStr(String updatedDateStr) {
		this.updatedDateStr = updatedDateStr;
	}

	public String getPaymentReference() {
		return paymentReference;
	}

	public void setPaymentReference(String paymentReference) {
		this.paymentReference = paymentReference;
	}

	public String getCreatedDateStr() {
		return createdDateStr;
	}

	public void setCreatedDateStr(String createdDateStr) {
		this.createdDateStr = createdDateStr;
	}

	public String getStartDateStr() {
		return startDateStr;
	}

	public void setStartDateStr(String startDateStr) {
		this.startDateStr = startDateStr;
	}

	public String getEndDateStr() {
		return endDateStr;
	}

	public void setEndDateStr(String endDateStr) {
		this.endDateStr = endDateStr;
	}

}