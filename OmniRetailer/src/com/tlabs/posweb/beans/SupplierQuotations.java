package com.tlabs.posweb.beans;

//import java.util.Date;
import java.util.List;



import com.tlabs.posweb.beans.RequestHeader;

/*
 * Author:Karthik K
 * createdOn:27-12-2016
*/
//@Entity
//@Table(name = "supplier_quotations")
public class SupplierQuotations {

	//@Column(name="repeat_period")
		//@Transient
		private String repeatPeriod;
     
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

		public Boolean getTaxInclusive() {
			return taxInclusive;
		}

		public void setTaxInclusive(Boolean taxInclusive) {
			this.taxInclusive = taxInclusive;
		}

		public String getShipment() {
			return shipment;
		}

		public void setShipment(String shipment) {
			this.shipment = shipment;
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

		public String getSpecialInstructions() {
			return specialInstructions;
		}

		public void setSpecialInstructions(String specialInstructions) {
			this.specialInstructions = specialInstructions;
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

		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}

		public String getPreparedBy() {
			return preparedBy;
		}

		public void setPreparedBy(String preparedBy) {
			this.preparedBy = preparedBy;
		}

		public String getFromLocation() {
			return fromLocation;
		}

		public void setFromLocation(String fromLocation) {
			this.fromLocation = fromLocation;
		}

		public String getRemarks() {
			return remarks;
		}

		public void setRemarks(String remarks) {
			this.remarks = remarks;
		}

		/*public Date getCreatedDate() {
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

		public Date getLastDateForQuote() {
			return lastDateForQuote;
		}

		public void setLastDateForQuote(Date lastDateForQuote) {
			this.lastDateForQuote = lastDateForQuote;
		}
*/
		public String getSupplierStreetName() {
			return supplierStreetName;
		}

		public void setSupplierStreetName(String supplierStreetName) {
			this.supplierStreetName = supplierStreetName;
		}

		public String getSupplierLocality() {
			return supplierLocality;
		}

		public void setSupplierLocality(String supplierLocality) {
			this.supplierLocality = supplierLocality;
		}

		public String getSupplierCity() {
			return supplierCity;
		}

		public void setSupplierCity(String supplierCity) {
			this.supplierCity = supplierCity;
		}

		public String getSupplierState() {
			return supplierState;
		}

		public void setSupplierState(String supplierState) {
			this.supplierState = supplierState;
		}

		//@Column(name="shipment_mode")
		//@Transient
		private String shipmentMode;

		//@Column(name="tax_inclusive")
		//@Transient
		private Boolean taxInclusive;

		//@Column(name="shipment")
		//@Transient
		private String shipment;

		//@Column(name="shipment_terms")
		//@Transient
		private String shipmentTerms;

		//@Column(name="purchase_terms")
		//@Transient
		private String purchaseTerms;

		//@Column(name="special_Instructions")
		//@Transient
		private String specialInstructions;

		//@Column(name = "user_name")
		//@Transient
		private String userName;

		//@Column(name = "role_name")
		//@Transient
		private String roleName;

		//@Column(name = "status")
		//@Transient
		private String status;

		//@Column(name="prepared_by")
		//@Transient
		private String preparedBy;

		//@Column(name="from_location")
		//@Transient
		private String fromLocation;

		//@Column(name="remarks")
		//@Transient
		private String remarks;

		//@Column(name="created_date")
		//@Transient
		//private Date createdDate;

		//@Column(name = "updated_date")
		//@Transient
		//private Date updatedDate;

		//@Column(name="last_date_for_quote")
		//@Transient
		//private Date lastDateForQuote;

		//@Transient
		private String supplierStreetName;

		//@Transient
		private String supplierLocality;

		//@Transient
		private String supplierCity;

		//@Transient
		private String supplierState;
		
	
		private String shipmentCost;
		public String getShipmentCost() {
			return shipmentCost;
		}

		public void setShipmentCost(String shipmentCost) {
			this.shipmentCost = shipmentCost;
		}

		public String getShipmentTime() {
			return shipmentTime;
		}

		public void setShipmentTime(String shipmentTime) {
			this.shipmentTime = shipmentTime;
		}

		public String getPaymentInstructions() {
			return paymentInstructions;
		}

		public void setPaymentInstructions(String paymentInstructions) {
			this.paymentInstructions = paymentInstructions;
		}

		private String shipmentTime;
		private String paymentInstructions;
		private String startDateForQuoteStr;
		private String validDateForQuoteStr;

		private String startDate;
		 private List<String> nextActivities;
		 public List<String> getNextActivities() {
			return nextActivities;
		}

		public void setNextActivities(List<String> nextActivities) {
			this.nextActivities = nextActivities;
		}

		public List<String> getWorkFlowActivities() {
			return workFlowActivities;
		}

		public void setWorkFlowActivities(List<String> workFlowActivities) {
			this.workFlowActivities = workFlowActivities;
		}

		public List<String> getPreviousStates() {
			return previousStates;
		}

		public void setPreviousStates(List<String> previousStates) {
			this.previousStates = previousStates;
		}

		public List<String> getNextWorkFlowStates() {
			return nextWorkFlowStates;
		}

		public void setNextWorkFlowStates(List<String> nextWorkFlowStates) {
			this.nextWorkFlowStates = nextWorkFlowStates;
		}

		private List<String> workFlowActivities;
		 private List<String> previousStates;
		 private List<String> nextWorkFlowStates;
		
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

		private String endDate;

	public String getValidDateForQuoteStr() {
			return validDateForQuoteStr;
		}

		public void setValidDateForQuoteStr(String validDateForQuoteStr) {
			this.validDateForQuoteStr = validDateForQuoteStr;
		}

	public String getStartDateForQuoteStr() {
			return startDateForQuoteStr;
		}

		public void setStartDateForQuoteStr(String startDateForQuoteStr) {
			this.startDateForQuoteStr = startDateForQuoteStr;
		}

	//@Id
	//@Column(name = "quote_ref")
	private String quoteRef;
List<SupplierQuotations> supplierQuotesList;
private List<QuoteSuppliers> suppliersList;
private String type;

	public String getType() {
	return type;
}

public void setType(String type) {
	this.type = type;
}

	public List<QuoteSuppliers> getSuppliersList() {
	return suppliersList;
}

public void setSuppliersList(List<QuoteSuppliers> suppliersList) {
	this.suppliersList = suppliersList;
}

	public List<SupplierQuotations> getSupplierQuotesList() {
	return supplierQuotesList;
}

public void setSupplierQuotesList(List<SupplierQuotations> supplierQuotesList) {
	this.supplierQuotesList = supplierQuotesList;
}

	//@Column(name = "supplier_id")
         private String supplierId;
 

	//@Column(name = "supplier_name")
	private String supplierName;

	//@Column(name = "supplier_address")
	private String supplierAddress;

	//@Column(name = "supplier_contact")
	private String supplierContact;

	//@Column(name = "supplier_phone")
	private String supplierPhone;

	//@Column(name = "supplier_email")
	private String supplierEmail;

	//@Column(name = "req_quote_ref")
	private String reqQuoteRef;
	private String fromZipCode;
	public String getFromZipCode() {
		return fromZipCode;
	}

	public void setFromZipCode(String fromZipCode) {
		this.fromZipCode = fromZipCode;
	}

	public String getFromCountry() {
		return fromCountry;
	}

	public void setFromCountry(String fromCountry) {
		this.fromCountry = fromCountry;
	}

	private String fromCountry;
	/*@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "quote_ref")*/
	private List<SupplierQuoteItems> supplierQuoteItems;
	private List<SupplierShipmentLocation> suplierShipmentLocation;
	public List<SupplierShipmentLocation> getSuplierShipmentLocation() {
		return suplierShipmentLocation;
	}

	public void setSuplierShipmentLocation(List<SupplierShipmentLocation> suplierShipmentLocation) {
		this.suplierShipmentLocation = suplierShipmentLocation;
	}

	
	private List<LocationBean> selectedLocationList;
	private List<SupplierBean> supplierbeen;
	public List<SupplierBean> getSupplierbeen() {
		return supplierbeen;
	}

	public void setSupplierbeen(List<SupplierBean> supplierbeen) {
		this.supplierbeen = supplierbeen;
	}

	public List<LocationBean> getSelectedLocationList() {
		return selectedLocationList;
	}

	public void setSelectedLocationList(List<LocationBean> selectedLocationList) {
		this.selectedLocationList = selectedLocationList;
	}

	
	private String createdDateStr;
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

	private String lastDateForQuoteStr;
	

	//@Transient
	private RequestHeader requestHeader;

	//@Transient
	private String[] quotesRefs;

	//@Transient
	private String searchCriteria;

	//@Transient
	private String startIndex;

	//@Transient
	private String maxRecords;
private String totalRecords;
private int sno;
//private Date updatedDate;
private SupplierBean supplierMaster;
	public SupplierBean getSupplierMaster() {
	return supplierMaster;
}

public void setSupplierMaster(SupplierBean supplierMaster) {
	this.supplierMaster = supplierMaster;
}

	public int getSno() {
	return sno;
}

public void setSno(int sno) {
	this.sno = sno;
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

	public String getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public String getSupplierAddress() {
		return supplierAddress;
	}

	public void setSupplierAddress(String supplierAddress) {
		this.supplierAddress = supplierAddress;
	}

	public String getSupplierContact() {
		return supplierContact;
	}

	public void setSupplierContact(String supplierContact) {
		this.supplierContact = supplierContact;
	}

	public String getSupplierPhone() {
		return supplierPhone;
	}

	public void setSupplierPhone(String supplierPhone) {
		this.supplierPhone = supplierPhone;
	}

	public String getSupplierEmail() {
		return supplierEmail;
	}

	public void setSupplierEmail(String supplierEmail) {
		this.supplierEmail = supplierEmail;
	}

	public String getReqQuoteRef() {
		return reqQuoteRef;
	}

	public void setReqQuoteRef(String reqQuoteRef) {
		this.reqQuoteRef = reqQuoteRef;
	}

	public List<SupplierQuoteItems> getSupplierQuoteItems() {
		return supplierQuoteItems;
	}

	public void setSupplierQuoteItems(List<SupplierQuoteItems> supplierQuoteItems) {
		this.supplierQuoteItems = supplierQuoteItems;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public String[] getQuotesRefs() {
		return quotesRefs;
	}

	public void setQuotesRefs(String[] quotesRefs) {
		this.quotesRefs = quotesRefs;
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

}
