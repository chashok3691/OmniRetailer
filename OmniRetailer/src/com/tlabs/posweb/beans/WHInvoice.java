package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


import com.tlabs.posweb.beans.RequestHeader;
import com.tlabs.posweb.beans.ResponseHeader;

//@Entity
//@Table(name = "warehouse_invoice")
public class WHInvoice {

	//@Id
	//@Column(name = "invoice_id")
	private String invoiceId;

	//@Column(name = "goods_receipt_note_ref")
	private String goodsReceiptNoteRef;

	//@Column(name = "supplier_name")
	private String supplierName;

	//@Column(name = "supplier_id")
	private String supplierId;

	//@Column(name = "contact_person")
	private String contactPerson;

	//@Column(name = "contact_number")
	private String contactNumber;

	//@Column(name = "to_location")
	private String toLocation;

	//@Column(name = "shipment_mode")
	private String shipmentMode;

	//@Column(name = "shipment_received_by")
	private String shipmentReceivedBy;

	//@Column(name = "shipped_to_building_no")
	private String shippedToBuildingNO;

	//@Column(name = "shipped_to_city")
	private String shippedToCity;

	//@Column(name = "shipped_to_country")
	private String shippedToCountry;

	//@Column(name = "shipped_to_customer_name")
	private String shippedToCustomerName;

	//@Column(name = "insurance_cost")
	private Float insuranceCost;

	//@Column(name = "no_of_packages")
	private int noOfPackages;

	//@Column(name = "order_id")
	private String orderId;

	//@Column(name = "payment_terms")
	private String paymentTerms;

	//@Column(name = "remarks")
	private String remarks;

	//@Column(name = "invoice_status")
	private String invoiceStatus;

	//@Column(name = "shipment_agency")
	private String shipmentAgency;

	//@Column(name = "shipment_cost")
	private Float shipmentCost;

	//@Column(name = "shipment_id")
	private String shipmentId;

	//@Column(name = "shipment_note_id")
	private String shipmentNoteId;

	//@Column(name = "shipped_to_street_name")
	private String shippedToStreetName;

	//@Column(name = "tax")
	private Float tax;

	//@Column(name = "total_item_cost")
	private Float totalItemCost;

	//@Column(name = "shipped_to_zip_code")
	private String shippedToZipCode;

	//@Column(name = "invoice_date")
	private Date invoiceDate;

	//@Column(name = "created_on")
	private Date createdOn;

	//@Column(name = "shipment_date")
	private Date shipmentDate;

	//@Column(name = "warehouse_location")
	private String warehouseLocation;
	
	//@Column(name = "cgst_tax_amt")
	private BigDecimal cgstAmt;
	
	
	//@Column(name = "sgst_tax_amt")
	private BigDecimal sgstAmt;
	
	//@Column(name = "igst_tax_amt")
	private BigDecimal igstAmt;
	
	//@Column(name = "other_tax_amt")
	private BigDecimal otherTaxAmt;
	
	//@Column(name = "total_discounts")
	private BigDecimal totalDiscounts;
	
	//@Column(name = "shippment_ref_num")
	private String shippmentRefNum;
	
	
	//@Column(name = "email")
	private String email;
	
	
	//@Column(name = "gstn")
	private String gstn;


//	@Column(name = "total_cost")
	private BigDecimal totalCost;
	
//	@Column(name = "state")
	private String state;
	
//	@Column(name = "counter_id")
	private String counterId;
	
    private String supplier_Id;
    
    private String supplier_state;
    private Date dueDate;
    private Date deliveredOn;
    private Integer vendorRating;
    private String userName;
    private String docLink;
    private String supplierInvoiceRefNum;
    private List<String> nextWorkFlows;
	private String workflowStatus;
	private BigDecimal subTotal;
	private BigDecimal shipmentCharges = new BigDecimal("0");
	
	
	
	public List<String> getNextWorkFlows() {
		return nextWorkFlows;
	}

	public void setNextWorkFlows(List<String> nextWorkFlows) {
		this.nextWorkFlows = nextWorkFlows;
	}

	public String getWorkflowStatus() {
		return workflowStatus;
	}

	public void setWorkflowStatus(String workflowStatus) {
		this.workflowStatus = workflowStatus;
	}

	public BigDecimal getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(BigDecimal subTotal) {
		this.subTotal = subTotal;
	}

	public BigDecimal getShipmentCharges() {
		return shipmentCharges;
	}

	public void setShipmentCharges(BigDecimal shipmentCharges) {
		this.shipmentCharges = shipmentCharges;
	}

	public String getSupplier_Id() {
		return supplier_Id;
	}

	public void setSupplier_Id(String supplier_Id) {
		this.supplier_Id = supplier_Id;
	}

	public String getSupplier_state() {
		return supplier_state;
	}

	public void setSupplier_state(String supplier_state) {
		this.supplier_state = supplier_state;
	}

	public Date getDueDate() {
		return dueDate;
	}

	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}

	public Date getDeliveredOn() {
		return deliveredOn;
	}

	public void setDeliveredOn(Date deliveredOn) {
		this.deliveredOn = deliveredOn;
	}

	public Integer getVendorRating() {
		return vendorRating;
	}

	public void setVendorRating(Integer vendorRating) {
		this.vendorRating = vendorRating;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getDocLink() {
		return docLink;
	}

	public void setDocLink(String docLink) {
		this.docLink = docLink;
	}

	public String getSupplierInvoiceRefNum() {
		return supplierInvoiceRefNum;
	}

	public void setSupplierInvoiceRefNum(String supplierInvoiceRefNum) {
		this.supplierInvoiceRefNum = supplierInvoiceRefNum;
	}

	public BigDecimal getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(BigDecimal totalCost) {
		this.totalCost = totalCost;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCounterId() {
		return counterId;
	}

	public void setCounterId(String counterId) {
		this.counterId = counterId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGstn() {
		return gstn;
	}

	public void setGstn(String gstn) {
		this.gstn = gstn;
	}

	public BigDecimal getCgstAmt() {
		return cgstAmt;
	}

	public void setCgstAmt(BigDecimal cgstAmt) {
		this.cgstAmt = cgstAmt;
	}

	public BigDecimal getSgstAmt() {
		return sgstAmt;
	}

	public void setSgstAmt(BigDecimal sgstAmt) {
		this.sgstAmt = sgstAmt;
	}

	public BigDecimal getIgstAmt() {
		return igstAmt;
	}

	public void setIgstAmt(BigDecimal igstAmt) {
		this.igstAmt = igstAmt;
	}

	public BigDecimal getOtherTaxAmt() {
		return otherTaxAmt;
	}

	public void setOtherTaxAmt(BigDecimal otherTaxAmt) {
		this.otherTaxAmt = otherTaxAmt;
	}

	public BigDecimal getTotalDiscounts() {
		return totalDiscounts;
	}

	public void setTotalDiscounts(BigDecimal totalDiscounts) {
		this.totalDiscounts = totalDiscounts;
	}

	public String getShippmentRefNum() {
		return shippmentRefNum;
	}

	public void setShippmentRefNum(String shippmentRefNum) {
		this.shippmentRefNum = shippmentRefNum;
	}



	//@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	//@JoinColumn(name = "invoice_id")
	private List<WHInvoiceItems> whInvoiceItemsList;

	//@Transient
	private RequestHeader requestHeader;

	//@Transient
	private ResponseHeader responseHeader;

	//@Transient
	private String startIndex;

	//@Transient
	private String maxRecords;

	//@Transient
	private int totalRecords;

	//@Transient
	private String invoiceDateStr;
	//@Transient
	private String shipmentDateStr;

	//@Transient
	private String createdOnStr;

	//@Transient
	private String startDateStr;

	//@Transient
	private String endDateStr;

	//@Transient
	private String category;

	//@Transient
	private String subCategory;

	//@Transient
	private String model;

	//@Transient
	private String brand;

	//@Transient
	private String department;

	//@Transient
	private String subDepartment;

	//@Transient
	private String searchCriteria;

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getSubDepartment() {
		return subDepartment;
	}

	public void setSubDepartment(String subDepartment) {
		this.subDepartment = subDepartment;
	}

	public String getCreatedOnStr() {
		return createdOnStr;
	}

	public void setCreatedOnStr(String createdOnStr) {
		this.createdOnStr = createdOnStr;
	}

	//@Transient
	private List<WHInvoice> whInvoiceList;

	public Date getShipmentDate() {
		return shipmentDate;
	}

	public void setShipmentDate(Date shipmentDate) {
		this.shipmentDate = shipmentDate;
	}

	public String getShipmentDateStr() {
		return shipmentDateStr;
	}

	public void setShipmentDateStr(String shipmentDateStr) {
		this.shipmentDateStr = shipmentDateStr;
	}

	public String getInvoiceId() {
		return invoiceId;
	}

	public void setInvoiceId(String invoiceId) {
		this.invoiceId = invoiceId;
	}

	public String getGoodsReceiptNoteRef() {
		return goodsReceiptNoteRef;
	}

	public void setGoodsReceiptNoteRef(String goodsReceiptNoteRef) {
		this.goodsReceiptNoteRef = goodsReceiptNoteRef;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public String getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}

	public String getContactPerson() {
		return contactPerson;
	}

	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getToLocation() {
		return toLocation;
	}

	public void setToLocation(String toLocation) {
		this.toLocation = toLocation;
	}

	public String getShipmentMode() {
		return shipmentMode;
	}

	public void setShipmentMode(String shipmentMode) {
		this.shipmentMode = shipmentMode;
	}

	public String getShipmentReceivedBy() {
		return shipmentReceivedBy;
	}

	public void setShipmentReceivedBy(String shipmentReceivedBy) {
		this.shipmentReceivedBy = shipmentReceivedBy;
	}

	public String getShippedToBuildingNO() {
		return shippedToBuildingNO;
	}

	public void setShippedToBuildingNO(String shippedToBuildingNO) {
		this.shippedToBuildingNO = shippedToBuildingNO;
	}

	public String getShippedToCity() {
		return shippedToCity;
	}

	public void setShippedToCity(String shippedToCity) {
		this.shippedToCity = shippedToCity;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
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

	public String getShippedToCountry() {
		return shippedToCountry;
	}

	public void setShippedToCountry(String shippedToCountry) {
		this.shippedToCountry = shippedToCountry;
	}

	public String getShippedToCustomerName() {
		return shippedToCustomerName;
	}

	public void setShippedToCustomerName(String shippedToCustomerName) {
		this.shippedToCustomerName = shippedToCustomerName;
	}

	public Float getInsuranceCost() {
		return insuranceCost;
	}

	public void setInsuranceCost(Float insuranceCost) {
		this.insuranceCost = insuranceCost;
	}

	public int getNoOfPackages() {
		return noOfPackages;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public String getInvoiceDateStr() {
		return invoiceDateStr;
	}

	public void setInvoiceDateStr(String invoiceDateStr) {
		this.invoiceDateStr = invoiceDateStr;
	}

	public void setNoOfPackages(int noOfPackages) {
		this.noOfPackages = noOfPackages;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getPaymentTerms() {
		return paymentTerms;
	}

	public void setPaymentTerms(String paymentTerms) {
		this.paymentTerms = paymentTerms;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getInvoiceStatus() {
		return invoiceStatus;
	}

	public void setInvoiceStatus(String invoiceStatus) {
		this.invoiceStatus = invoiceStatus;
	}

	public String getShipmentAgency() {
		return shipmentAgency;
	}

	public void setShipmentAgency(String shipmentAgency) {
		this.shipmentAgency = shipmentAgency;
	}

	public Float getShipmentCost() {
		return shipmentCost;
	}

	public void setShipmentCost(Float shipmentCost) {
		this.shipmentCost = shipmentCost;
	}

	public String getShipmentId() {
		return shipmentId;
	}

	public void setShipmentId(String shipmentId) {
		this.shipmentId = shipmentId;
	}

	public String getShipmentNoteId() {
		return shipmentNoteId;
	}

	public void setShipmentNoteId(String shipmentNoteId) {
		this.shipmentNoteId = shipmentNoteId;
	}

	public String getShippedToStreetName() {
		return shippedToStreetName;
	}

	public void setShippedToStreetName(String shippedToStreetName) {
		this.shippedToStreetName = shippedToStreetName;
	}

	public Float getTax() {
		return tax;
	}

	public List<WHInvoice> getWhInvoiceList() {
		return whInvoiceList;
	}

	public void setWhInvoiceList(List<WHInvoice> whInvoiceList) {
		this.whInvoiceList = whInvoiceList;
	}

	public void setTax(Float tax) {
		this.tax = tax;
	}

	public Float getTotalItemCost() {
		return totalItemCost;
	}

	public void setTotalItemCost(Float totalItemCost) {
		this.totalItemCost = totalItemCost;
	}


	public String getShippedToZipCode() {
		return shippedToZipCode;
	}

	public void setShippedToZipCode(String shippedToZipCode) {
		this.shippedToZipCode = shippedToZipCode;
	}

	public Date getInvoiceDate() {
		return invoiceDate;
	}

	public void setInvoiceDate(Date invoiceDate) {
		this.invoiceDate = invoiceDate;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	public String getWarehouseLocation() {
		return warehouseLocation;
	}

	public void setWarehouseLocation(String warehouseLocation) {
		this.warehouseLocation = warehouseLocation;
	}

	public List<WHInvoiceItems> getWhInvoiceItemsList() {
		return whInvoiceItemsList;
	}

	public void setWhInvoiceItemsList(List<WHInvoiceItems> whInvoiceItemsList) {
		this.whInvoiceItemsList = whInvoiceItemsList;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
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
