package com.tlabs.posweb.beans;

import java.util.Date;
import java.util.List;
/**
 * @author chennakesav.a
 * createdOn   : 15-03-2016
 * Description : This model class is used to hold the values and interact with quotation table in database.
 * */
public class Quotation {
	private String quoteRef;
	private String fromName;
	private String fromContactNum;
	private String fromEmail;
	private String fromCompany;
	private String fromAddress;
	private String fromState;
	private String fromZipCode;
	private String toName;
	private String toContactNum;
	private String toEmail;
	private String toCompany;
	private String toAddress;
	private String toState;
	private String toZipCode;
	private Date dateTime;
	private Date lastDateForQuote;
	private String specialInstructions;
	private String remarks;
	private List<QuoteItems> itemsList;
	private List<QuoteShipmentLocation> shipmentLocationsList;
	private List<LocationBean> selectedLocationList;
	private List<QuoteSuppliers> suppliersList;
	private RequestHeader requestHeader;
	private ResponseHeader responseHeader;
	private String createdDateStr;
	private String lastDateForQuoteStr;
	private String searchCriteria;
	private String startIndex;
	private String maxRecords;
	private String totalRecords;
	private Date location;
	private String streetName;
	private String city;
	private String preparedBy;
	private String shipmentTerms;
	private String purchaseTerms;
	private List<Quotation> quotesList;
	private String fromLocation;
	private String[] quotesRefs;
	
	private String userName;
	private String roleName;
	private String fromAddressStreet;
	private String fromAddressLocality;
	private String toAddressStreet;
	private String toAddressLocality;
	private String toCity;
	private Date createdDate;
	private Date updatedDate;
	private String status;
	private String startDate;
	private String endDate;
	
	private String fromCountry;
	private String fromCity;
	private List<String> nextActivities;
	private int slNo;
	private String paymentInstructions;
	
	
	private List<String> previousStates;
	private List<String> nextWorkFlowStates;
	public List<String> getNextWorkFlowStates() {
		return nextWorkFlowStates;
	}

	public void setNextWorkFlowStates(List<String> nextWorkFlowStates) {
		this.nextWorkFlowStates = nextWorkFlowStates;
	}

	public List<String> getPreviousStates() {
		return previousStates;
	}

	public void setPreviousStates(List<String> previousStates) {
		this.previousStates = previousStates;
	}

	//These fields are added by Ravi Teja
	private Boolean repeatSupply;
	private String repeatPeriod;
	private String shipmentMode;
	private String shipment;
	private Boolean taxInclusive;
	
	public int getSlNo() {
		return slNo;
	}

	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}

	public List<String> getNextActivities() {
		return nextActivities;
	}

	public void setNextActivities(List<String> nextActivities) {
		this.nextActivities = nextActivities;
	}

	public String getFromCity() {
		return fromCity;
	}

	public void setFromCity(String fromCity) {
		this.fromCity = fromCity;
	}

	public String getFromCountry() {
		return fromCountry;
	}

	public void setFromCountry(String fromCountry) {
		this.fromCountry = fromCountry;
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

	public String getFromAddressStreet() {
		return fromAddressStreet;
	}

	public void setFromAddressStreet(String fromAddressStreet) {
		this.fromAddressStreet = fromAddressStreet;
	}

	public String getFromAddressLocality() {
		return fromAddressLocality;
	}

	public void setFromAddressLocality(String fromAddressLocality) {
		this.fromAddressLocality = fromAddressLocality;
	}

	public String getToAddressStreet() {
		return toAddressStreet;
	}

	public void setToAddressStreet(String toAddressStreet) {
		this.toAddressStreet = toAddressStreet;
	}

	public String getToAddressLocality() {
		return toAddressLocality;
	}

	public void setToAddressLocality(String toAddressLocality) {
		this.toAddressLocality = toAddressLocality;
	}

	public String getToCity() {
		return toCity;
	}

	public void setToCity(String toCity) {
		this.toCity = toCity;
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

	public Boolean getRepeatSupply() {
		return repeatSupply;
	}

	public void setRepeatSupply(Boolean repeatSupply) {
		this.repeatSupply = repeatSupply;
	}

	public String getRepeatPeriod() {
		return repeatPeriod;
	}

	public void setRepeatPeriod(String repeatPeriod) {
		this.repeatPeriod = repeatPeriod;
	}

	public String getShipmentMode() {
		return shipmentMode;
	}

	public void setShipmentMode(String shipmentMode) {
		this.shipmentMode = shipmentMode;
	}



	

	

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String[] getQuotesRefs() {
		return quotesRefs;
	}

	public void setQuotesRefs(String[] quotesRefs) {
		this.quotesRefs = quotesRefs;
	}

	public String getFromLocation() {
		return fromLocation;
	}

	public void setFromLocation(String fromLocation) {
		this.fromLocation = fromLocation;
	}

	public List<LocationBean> getSelectedLocationList() {
		return selectedLocationList;
	}

	public void setSelectedLocationList(List<LocationBean> selectedLocationList) {
		this.selectedLocationList = selectedLocationList;
	}
	
	public List<Quotation> getQuotesList() {
		return quotesList;
	}

	public void setQuotesList(List<Quotation> quotesList) {
		this.quotesList = quotesList;
	}

	public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

	public String getQuoteRef() {
		return quoteRef;
	}

	public void setQuoteRef(String quoteRef) {
		this.quoteRef = quoteRef;
	}

	public String getFromName() {
		return fromName;
	}

	public void setFromName(String fromName) {
		this.fromName = fromName;
	}

	public String getFromContactNum() {
		return fromContactNum;
	}

	public void setFromContactNum(String fromContactNum) {
		this.fromContactNum = fromContactNum;
	}

	public String getFromEmail() {
		return fromEmail;
	}

	public void setFromEmail(String fromEmail) {
		this.fromEmail = fromEmail;
	}

	 

	public String getFromAddress() {
		return fromAddress;
	}

	public void setFromAddress(String fromAddress) {
		this.fromAddress = fromAddress;
	}

	public String getFromState() {
		return fromState;
	}

	public void setFromState(String fromState) {
		this.fromState = fromState;
	}

	public String getFromZipCode() {
		return fromZipCode;
	}

	public void setFromZipCode(String fromZipCode) {
		this.fromZipCode = fromZipCode;
	}

	public String getToName() {
		return toName;
	}

	public void setToName(String toName) {
		this.toName = toName;
	}

	public String getToContactNum() {
		return toContactNum;
	}

	public void setToContactNum(String toContactNum) {
		this.toContactNum = toContactNum;
	}

	public String getToEmail() {
		return toEmail;
	}

	public void setToEmail(String toEmail) {
		this.toEmail = toEmail;
	}

	public String getToCompany() {
		return toCompany;
	}

	public String getShipmentTerms() {
		return shipmentTerms;
	}

	public void setShipmentTerms(String shipmentTerms) {
		this.shipmentTerms = shipmentTerms;
	}

	public String getPurchaseTerms() {
		return purchaseTerms;
	}

	public void setPurchaseTerms(String purchaseTerms) {
		this.purchaseTerms = purchaseTerms;
	}

	public void setToCompany(String toCompany) {
		this.toCompany = toCompany;
	}

	public String getToAddress() {
		return toAddress;
	}

	public void setToAddress(String toAddress) {
		this.toAddress = toAddress;
	}

	public String getToState() {
		return toState;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
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

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public void setToState(String toState) {
		this.toState = toState;
	}

	public String getToZipCode() {
		return toZipCode;
	}

	public String getFromCompany() {
		return fromCompany;
	}

	public void setFromCompany(String fromCompany) {
		this.fromCompany = fromCompany;
	}

	public void setToZipCode(String toZipCode) {
		this.toZipCode = toZipCode;
	}

	public Date getDateTime() {
		return dateTime;
	}

	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}

	public Date getLastDateForQuote() {
		return lastDateForQuote;
	}

	public void setLastDateForQuote(Date lastDateForQuote) {
		this.lastDateForQuote = lastDateForQuote;
	}

	public String getSpecialInstructions() {
		return specialInstructions;
	}

	public void setSpecialInstructions(String specialInstructions) {
		this.specialInstructions = specialInstructions;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public List<QuoteItems> getItemsList() {
		return itemsList;
	}

	public void setItemsList(List<QuoteItems> itemsList) {
		this.itemsList = itemsList;
	}

	public List<QuoteShipmentLocation> getShipmentLocationsList() {
		return shipmentLocationsList;
	}

	public void setShipmentLocationsList(List<QuoteShipmentLocation> shipmentLocationsList) {
		this.shipmentLocationsList = shipmentLocationsList;
	}

	public List<QuoteSuppliers> getSuppliersList() {
		return suppliersList;
	}

	public void setSuppliersList(List<QuoteSuppliers> suppliersList) {
		this.suppliersList = suppliersList;
	}

	public String getCreatedDateStr() {
		return createdDateStr;
	}

	public void setCreatedDateStr(String createdDateStr) {
		this.createdDateStr = createdDateStr;
	}

	public String getLastDateForQuoteStr() {
		return lastDateForQuoteStr;
	}

	public void setLastDateForQuoteStr(String lastDateForQuoteStr) {
		this.lastDateForQuoteStr = lastDateForQuoteStr;
	}

	public Date getLocation() {
		return location;
	}

	public void setLocation(Date location) {
		this.location = location;
	}

	public String getStreetName() {
		return streetName;
	}

	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPreparedBy() {
		return preparedBy;
	}

	public void setPreparedBy(String preparedBy) {
		this.preparedBy = preparedBy;
	}

	public String getShipment() {
		return shipment;
	}

	public void setShipment(String shipment) {
		this.shipment = shipment;
	}

	public Boolean getTaxInclusive() {
		return taxInclusive;
	}

	public void setTaxInclusive(Boolean taxInclusive) {
		this.taxInclusive = taxInclusive;
	}

	public String getPaymentInstructions() {
		return paymentInstructions;
	}

	public void setPaymentInstructions(String paymentInstructions) {
		this.paymentInstructions = paymentInstructions;
	}
	
}
