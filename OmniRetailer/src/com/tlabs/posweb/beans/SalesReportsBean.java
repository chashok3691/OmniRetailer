package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;

/**
 * 
 * @author Sambaiah.Y
 *
 *	for storing the sales reports filtering and header information
 */
public class SalesReportsBean {

	private String startIndex;
	private String startDate = null;
	private String endDate = null;
	private String waiterName;
	private String paymentType;
	private String counterId = null;
	private String searchCriteria;
	private String searchName = null;
	private String store_location;
	private String requiredRecords;
	private String pluCode;
	private String date;
	private String startTime;
	private String endTime;
	private String shiftId;
	private String paymentMode;
	private RequestHeader requestHeader;
	private String order;
	private String orderBy;
	private String customer;
	private BigDecimal avgQuantity;
	private BigDecimal avgValue;
	private String billStatus;
	private String phoneNum;
	private String zoneId;
	private String categoryName;
	private String taxId;
	private boolean isSaveReport;
	private boolean customerBillFormat;
	private String cashierId;
	private String subCategory;

	private String department;
	private String periodicType;
	
	private String brand;
	private String subDepartment;
	private String section;
	private int noofBills;
	private int hour;
	private String supplierName;
	private String model;
	private String searchCriteriaStr;
	private String billRef;
	private String creditNoteRef;
	private String customerMobileNo;
	private String customerName;
	private String cashierName;
	private String creditNoteReason;
	private Double billAmount;
	private String statusFlag;
	private String itemDesc;
	private String skuId;
	private String hsnCode;
	private BigDecimal quantity;
	private BigDecimal totalCost;
	private BigDecimal tax;
	private String taxCode;
	private String taxRate;
	private BigDecimal taxValue;
	private BigDecimal returnQty;
	private BigDecimal exchangeQty;
	private float cardTotal;
	private float cashTotal;
	private float vouchersTotal;
	private float couponsTotal;
	private float creditsAmt;
	private float sodexTotal;
	private float ticketTotal;
	private float creditTotal;
	private String cgstTaxRate ;
	private float cgstTaxValue ;
	private String sgstTaxRate ;
	private float sgstTaxValue ;
	private String igstTaxRate ;
	private float igstTaxValue ;
	private float dueAmount;
	private float receivedAmt;
	private String otherTaxRate ;
	private float otherTaxValue ;
	private Double catContVal;
	private boolean storewise;
	private Double storeContVal;
	private int payinNum;
	private int payoutNum;
	private int numberOfWalkins;
	private Float openStock;
	private Float closedStock;
	private Float openStockQty;
	private Float closedStockQty;
	private Float diffStock;
	private Float grnStock;
	private Float lossStock;
	private String walkInConversion;
	private Float itemDiscount;
	private Float manualDiscount;
	private Double stockLossQty;
	private String color;
	private String size;
	private String measureRange;
	private String productRange;
	private String ean;
	private Float skuReceiptQty;
	private Float skuTrnsQty;
	private Float skuReturnQty;
	private Integer maxRecords;
	/*below codes for gst taxation*/
	private float cgst2_5;
	private float sgst2_5;
	private float cgst6;
	private float sgst6;
	private float cgst9;
	private float sgst9;
	private float cgst14;
	private float sgst14;
	private String uom;
	
	private String deliveryPersonId;
	private String deliveryPersonName;
	
	private String salesChannel;

	private List<Billing> billsList;
	
	private int totalRecords;

	private String salesReportFilePath;
	private boolean saveStockAgingFlag;
	private String expiryDate;
	private Double quantityInHand;
	private String batchNo;
	private float marginvalue;
	private Float soldQty;
	private String noOfDays;
	private String filePath;
	
	private String originalBillId;
	private String tenderName;
	private boolean saveReport=false;
	private float othersAmt;
	private float upiTotal;
	private float returnedAmt;
	private float exchangedAmt;
	private float loyaltyTotal;
	private float dayTurnOverAmt;
	private float taxAmt;
	private float grossAmount;
	private float totalSales;
	private float cgst;
	private float sgst;
	private int totalBills;
	private float creditBillsAmt;
	private String billId;
	private Float finalTotal;
	private Float finalSoldQty;
	private String eventId;
	private String eventName;
	private String criteriaStr;
	private String searchBar;
	private String netSales;
	private String paymentRefNumber;
	private String storeLocation;
	
	private String eventStartDate;
	private String eventEndDate;
	private String serailBillIdYearly;
	
	public String getSerailBillIdYearly() {
		return serailBillIdYearly;
	}

	public void setSerailBillIdYearly(String serailBillIdYearly) {
		this.serailBillIdYearly = serailBillIdYearly;
	}
	
	
	
	
	
	
    public String getEventStartDate() {
		return eventStartDate;
	}

	public void setEventStartDate(String eventStartDate) {
		this.eventStartDate = eventStartDate;
	}

	public String getEventEndDate() {
		return eventEndDate;
	}

	public void setEventEndDate(String eventEndDate) {
		this.eventEndDate = eventEndDate;
	}

	
    
	
	
	public String getPaymentRefNumber() {
		return paymentRefNumber;
	}

	public void setPaymentRefNumber(String paymentRefNumber) {
		this.paymentRefNumber = paymentRefNumber;
	}

	public float getMarginvalue() {
		return marginvalue;
	}

	public void setMarginvalue(float marginvalue) {
		this.marginvalue = marginvalue;
	}

	public String getStoreLocation() {
		return storeLocation;
	}

	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}

	public Float getFinalTotal() {
		return finalTotal;
	}

	public void setFinalTotal(Float finalTotal) {
		this.finalTotal = finalTotal;
	}

	public Float getFinalSoldQty() {
		return finalSoldQty;
	}

	public void setFinalSoldQty(Float finalSoldQty) {
		this.finalSoldQty = finalSoldQty;
	}

	public String getEventId() {
		return eventId;
	}

	public void setEventId(String eventId) {
		this.eventId = eventId;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public String getCriteriaStr() {
		return criteriaStr;
	}

	public void setCriteriaStr(String criteriaStr) {
		this.criteriaStr = criteriaStr;
	}

	public String getSearchBar() {
		return searchBar;
	}

	public void setSearchBar(String searchBar) {
		this.searchBar = searchBar;
	}

	public String getNetSales() {
		return netSales;
	}

	public void setNetSales(String netSales) {
		this.netSales = netSales;
	}

	public float getOthersAmt() {
		return othersAmt;
	}

	public void setOthersAmt(float othersAmt) {
		this.othersAmt = othersAmt;
	}

	public float getUpiTotal() {
		return upiTotal;
	}

	public void setUpiTotal(float upiTotal) {
		this.upiTotal = upiTotal;
	}

	public float getReturnedAmt() {
		return returnedAmt;
	}

	public void setReturnedAmt(float returnedAmt) {
		this.returnedAmt = returnedAmt;
	}

	public float getExchangedAmt() {
		return exchangedAmt;
	}

	public void setExchangedAmt(float exchangedAmt) {
		this.exchangedAmt = exchangedAmt;
	}

	public float getLoyaltyTotal() {
		return loyaltyTotal;
	}

	public void setLoyaltyTotal(float loyaltyTotal) {
		this.loyaltyTotal = loyaltyTotal;
	}

	public float getDayTurnOverAmt() {
		return dayTurnOverAmt;
	}

	public void setDayTurnOverAmt(float dayTurnOverAmt) {
		this.dayTurnOverAmt = dayTurnOverAmt;
	}

	public float getTaxAmt() {
		return taxAmt;
	}

	public void setTaxAmt(float taxAmt) {
		this.taxAmt = taxAmt;
	}

	public float getGrossAmount() {
		return grossAmount;
	}

	public void setGrossAmount(float grossAmount) {
		this.grossAmount = grossAmount;
	}

	public float getTotalSales() {
		return totalSales;
	}

	public void setTotalSales(float totalSales) {
		this.totalSales = totalSales;
	}

	public float getCgst() {
		return cgst;
	}

	public void setCgst(float cgst) {
		this.cgst = cgst;
	}

	public float getSgst() {
		return sgst;
	}

	public void setSgst(float sgst) {
		this.sgst = sgst;
	}

	public int getTotalBills() {
		return totalBills;
	}

	public void setTotalBills(int totalBills) {
		this.totalBills = totalBills;
	}

	public float getCreditBillsAmt() {
		return creditBillsAmt;
	}

	public void setCreditBillsAmt(float creditBillsAmt) {
		this.creditBillsAmt = creditBillsAmt;
	}

	public String getBillId() {
		return billId;
	}

	public void setBillId(String billId) {
		this.billId = billId;
	}

	public String getOriginalBillId() {
		return originalBillId;
	}

	public void setOriginalBillId(String originalBillId) {
		this.originalBillId = originalBillId;
	}

	public String getTenderName() {
		return tenderName;
	}

	public void setTenderName(String tenderName) {
		this.tenderName = tenderName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getBatchNo() {
		return batchNo;
	}

	public void setBatchNo(String batchNo) {
		this.batchNo = batchNo;
	}

	public Float getSoldQty() {
		return soldQty;
	}

	public void setSoldQty(Float soldQty) {
		this.soldQty = soldQty;
	}

	public String getNoOfDays() {
		return noOfDays;
	}

	public void setNoOfDays(String noOfDays) {
		this.noOfDays = noOfDays;
	}

	public Double getQuantityInHand() {
		return quantityInHand;
	}

	public void setQuantityInHand(Double quantityInHand) {
		this.quantityInHand = quantityInHand;
	}

	public String getExpiryDate() {
		return expiryDate;
	}

	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}

	private List<SalesReportsBean> stockAgingList;
	private String unSoldQty;
	private String unSoldValue;
	private String soldValue;
	
	
	public String getUnSoldQty() {
		return unSoldQty;
	}

	public void setUnSoldQty(String unSoldQty) {
		this.unSoldQty = unSoldQty;
	}

	public String getUnSoldValue() {
		return unSoldValue;
	}

	public void setUnSoldValue(String unSoldValue) {
		this.unSoldValue = unSoldValue;
	}

	public String getSoldValue() {
		return soldValue;
	}

	public void setSoldValue(String soldValue) {
		this.soldValue = soldValue;
	}

	public List<SalesReportsBean> getStockAgingList() {
		return stockAgingList;
	}

	public void setStockAgingList(List<SalesReportsBean> stockAgingList) {
		this.stockAgingList = stockAgingList;
	}

	public boolean isSaveStockAgingFlag() {
		return saveStockAgingFlag;
	}

	public void setSaveStockAgingFlag(boolean saveStockAgingFlag) {
		this.saveStockAgingFlag = saveStockAgingFlag;
	}

	public String getSalesReportFilePath() {
		return salesReportFilePath;
	}

	public void setSalesReportFilePath(String salesReportFilePath) {
		this.salesReportFilePath = salesReportFilePath;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public List<Billing> getBillsList() {
		return billsList;
	}

	public void setBillsList(List<Billing> billsList) {
		this.billsList = billsList;
	}

	
public Integer getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(Integer maxRecords) {
		this.maxRecords = maxRecords;
	}

public String getSalesChannel() {
		return salesChannel;
	}

	public void setSalesChannel(String salesChannel) {
		this.salesChannel = salesChannel;
	}

public String getDeliveryPersonId() {
		return deliveryPersonId;
	}

	public void setDeliveryPersonId(String deliveryPersonId) {
		this.deliveryPersonId = deliveryPersonId;
	}

	public String getDeliveryPersonName() {
		return deliveryPersonName;
	}

	public void setDeliveryPersonName(String deliveryPersonName) {
		this.deliveryPersonName = deliveryPersonName;
	}

	//	Added by vijay
	private String redeemedBillRef;
	public String getRedeemedBillRef() {
		return redeemedBillRef;
	}

	public void setRedeemedBillRef(String redeemedBillRef) {
		this.redeemedBillRef = redeemedBillRef;
	}

	private Set<String> locationsList;

	public Set<String> getLocationsList() {
		return locationsList;
	}

	public void setLocationsList(Set<String> locationsList) {
		this.locationsList = locationsList;
	}

	public String getUom() {
		return uom;
	}

	public void setUom(String uom) {
		this.uom = uom;
	}

	public float getSgst14() {
		return sgst14;
	}

	public void setSgst14(float sgst14) {
		this.sgst14 = sgst14;
	}

	public float getSgst2_5() {
		return sgst2_5;
	}

	public void setSgst2_5(float sgst2_5) {
		this.sgst2_5 = sgst2_5;
	}

	public float getCgst6() {
		return cgst6;
	}

	public void setCgst6(float cgst6) {
		this.cgst6 = cgst6;
	}

	public Float getSgst6() {
		return sgst6;
	}

	public void setSgst6(float sgst6) {
		this.sgst6 = sgst6;
	}

	public float getCgst9() {
		return cgst9;
	}

	public void setCgst9(float cgst9) {
		this.cgst9 = cgst9;
	}

	public float getSgst9() {
		return sgst9;
	}

	public void setSgst9(float sgst9) {
		this.sgst9 = sgst9;
	}

	public float getCgst14() {
		return cgst14;
	}

	public void setCgst14(float cgst14) {
		this.cgst14 = cgst14;
	}

	public float getCgst2_5() {
		return cgst2_5;
	}

	public void setCgst2_5(float cgst2_5) {
		this.cgst2_5 = cgst2_5;
	}

	public Float getMrp() {
		return mrp;
	}

	public void setMrp(Float mrp) {
		this.mrp = mrp;
	}

	private Float mrp;

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	private String style;

	public float getDiscount() {
		return discount;
	}

	public void setDiscount(float discount) {
		this.discount = discount;
	}

	private float discount;
	
	
	

	public Double getCatContVal() {
		return catContVal;
	}

	public void setCatContVal(Double catContVal) {
		this.catContVal = catContVal;
	}

	public Double getStoreContVal() {
		return storeContVal;
	}

	public void setStoreContVal(Double storeContVal) {
		this.storeContVal = storeContVal;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getBillStatus() {
		return billStatus;
	}

	public void setBillStatus(String billStatus) {
		this.billStatus = billStatus;
	}

	public String getCustomer() {
		return customer;
	}

	public void setCustomer(String customer) {
		this.customer = customer;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}

	public String getRequiredRecords() {
		return requiredRecords;
	}

	public void setRequiredRecords(String requiredRecords) {
		this.requiredRecords = requiredRecords;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public Double getStockLossQty() {
		return stockLossQty;
	}

	public void setStockLossQty(Double stockLossQty) {
		this.stockLossQty = stockLossQty;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getShiftId() {
		return shiftId;
	}

	public void setShiftId(String shiftId) {
		this.shiftId = shiftId;
	}

	public String getPaymentMode() {
		return paymentMode;
	}

	public String getSearchCriteriaStr() {
		return searchCriteriaStr;
	}

	public void setSearchCriteriaStr(String searchCriteriaStr) {
		this.searchCriteriaStr = searchCriteriaStr;
	}

	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}

	private ResponseHeader responseHeader;

	public String getSubDepartment() {
		return subDepartment;
	}

	public void setSubDepartment(String subDepartment) {
		this.subDepartment = subDepartment;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public String getCounterId() {
		return counterId;
	}

	public void setCounterId(String counterId) {
		this.counterId = counterId;
	}

	public boolean isCustomerBillFormat() {
		return customerBillFormat;
	}

	public void setCustomerBillFormat(boolean customerBillFormat) {
		this.customerBillFormat = customerBillFormat;
	}

	public boolean isSaveReport() {
		return isSaveReport;
	}

	public void setSaveReport(boolean isSaveReport) {
		this.isSaveReport = isSaveReport;
	}

	public String getTaxId() {
		return taxId;
	}

	public void setTaxId(String taxId) {
		this.taxId = taxId;
	}

	public String getZoneId() {
		return zoneId;
	}

	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
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

	public String getWaiterName() {
		return waiterName;
	}

	public void setWaiterName(String waiterName) {
		this.waiterName = waiterName;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	public String getSearchName() {
		return searchName;
	}

	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}

	public String getStore_location() {
		return store_location;
	}

	public void setStore_location(String store_location) {
		this.store_location = store_location;
	}

	public String getBillRef() {
		return billRef;
	}

	public void setBillRef(String billRef) {
		this.billRef = billRef;
	}

	public String getCreditNoteRef() {
		return creditNoteRef;
	}

	public void setCreditNoteRef(String creditNoteRef) {
		this.creditNoteRef = creditNoteRef;
	}

	public String getCustomerMobileNo() {
		return customerMobileNo;
	}

	public void setCustomerMobileNo(String customerMobileNo) {
		this.customerMobileNo = customerMobileNo;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCashierName() {
		return cashierName;
	}

	public void setCashierName(String cashierName) {
		this.cashierName = cashierName;
	}

	public String getCreditNoteReason() {
		return creditNoteReason;
	}

	public void setCreditNoteReason(String creditNoteReason) {
		this.creditNoteReason = creditNoteReason;
	}

	public Double getBillAmount() {
		return billAmount;
	}

	public void setBillAmount(Double billAmount) {
		this.billAmount = billAmount;
	}

	public String getStatusFlag() {
		return statusFlag;
	}

	public void setStatusFlag(String statusFlag) {
		this.statusFlag = statusFlag;
	}

	

	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}

	public String getHsnCode() {
		return hsnCode;
	}

	public void setHsnCode(String hsnCode) {
		this.hsnCode = hsnCode;
	}

	public BigDecimal getQuantity() {
		return quantity;
	}

	public void setQuantity(BigDecimal quantity) {
		this.quantity = quantity;
	}

	public BigDecimal getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(BigDecimal totalCost) {
		this.totalCost = totalCost;
	}

	public BigDecimal getTax() {
		return tax;
	}

	public void setTax(BigDecimal tax) {
		this.tax = tax;
	}

	public String getTaxCode() {
		return taxCode;
	}

	public void setTaxCode(String taxCode) {
		this.taxCode = taxCode;
	}

	public String getTaxRate() {
		return taxRate;
	}

	public void setTaxRate(String taxRate) {
		this.taxRate = taxRate;
	}

	public BigDecimal getTaxValue() {
		return taxValue;
	}

	public void setTaxValue(BigDecimal taxValue) {
		this.taxValue = taxValue;
	}

	public float getCardTotal() {
		return cardTotal;
	}

	public void setCardTotal(float cardTotal) {
		this.cardTotal = cardTotal;
	}

	public float getCashTotal() {
		return cashTotal;
	}

	public void setCashTotal(float cashTotal) {
		this.cashTotal = cashTotal;
	}

	public float getVouchersTotal() {
		return vouchersTotal;
	}

	public void setVouchersTotal(float vouchersTotal) {
		this.vouchersTotal = vouchersTotal;
	}

	public float getCouponsTotal() {
		return couponsTotal;
	}

	public void setCouponsTotal(float couponsTotal) {
		this.couponsTotal = couponsTotal;
	}

	public float getCreditsAmt() {
		return creditsAmt;
	}

	public void setCreditsAmt(float creditsAmt) {
		this.creditsAmt = creditsAmt;
	}

	public float getSodexTotal() {
		return sodexTotal;
	}

	public void setSodexTotal(float sodexTotal) {
		this.sodexTotal = sodexTotal;
	}

	public float getTicketTotal() {
		return ticketTotal;
	}

	public void setTicketTotal(float ticketTotal) {
		this.ticketTotal = ticketTotal;
	}

	public float getCreditTotal() {
		return creditTotal;
	}

	public void setCreditTotal(float creditTotal) {
		this.creditTotal = creditTotal;
	}

	public String getItemDesc() {
		return itemDesc;
	}

	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}

	public String getCgstTaxRate() {
		return cgstTaxRate;
	}

	public void setCgstTaxRate(String cgstTaxRate) {
		this.cgstTaxRate = cgstTaxRate;
	}

	public float getCgstTaxValue() {
		return cgstTaxValue;
	}

	public void setCgstTaxValue(float cgstTaxValue) {
		this.cgstTaxValue = cgstTaxValue;
	}

	public String getSgstTaxRate() {
		return sgstTaxRate;
	}

	public void setSgstTaxRate(String sgstTaxRate) {
		this.sgstTaxRate = sgstTaxRate;
	}

	public float getSgstTaxValue() {
		return sgstTaxValue;
	}

	public void setSgstTaxValue(float sgstTaxValue) {
		this.sgstTaxValue = sgstTaxValue;
	}

	public String getIgstTaxRate() {
		return igstTaxRate;
	}

	public void setIgstTaxRate(String igstTaxRate) {
		this.igstTaxRate = igstTaxRate;
	}

	public float getIgstTaxValue() {
		return igstTaxValue;
	}

	public void setIgstTaxValue(float igstTaxValue) {
		this.igstTaxValue = igstTaxValue;
	}

	public float getDueAmount() {
		return dueAmount;
	}

	public void setDueAmount(float dueAmount) {
		this.dueAmount = dueAmount;
	}

	public float getReceivedAmt() {
		return receivedAmt;
	}

	public void setReceivedAmt(float receivedAmt) {
		this.receivedAmt = receivedAmt;
	}

	public String getOtherTaxRate() {
		return otherTaxRate;
	}

	public void setOtherTaxRate(String otherTaxRate) {
		this.otherTaxRate = otherTaxRate;
	}

	public float getOtherTaxValue() {
		return otherTaxValue;
	}

	public void setOtherTaxValue(float otherTaxValue) {
		this.otherTaxValue = otherTaxValue;
	}

	public String getPluCode() {
		return pluCode;
	}

	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}

	public BigDecimal getReturnQty() {
		return returnQty;
	}

	public void setReturnQty(BigDecimal returnQty) {
		this.returnQty = returnQty;
	}

	public BigDecimal getExchangeQty() {
		return exchangeQty;
	}

	public void setExchangeQty(BigDecimal exchangeQty) {
		this.exchangeQty = exchangeQty;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public int getNoofBills() {
		return noofBills;
	}

	public void setNoofBills(int noofBills) {
		this.noofBills = noofBills;
	}

	public int getHour() {
		return hour;
	}

	public void setHour(int hour) {
		this.hour = hour;
	}

	public BigDecimal getAvgQuantity() {
		return avgQuantity;
	}

	public void setAvgQuantity(BigDecimal avgQuantity) {
		this.avgQuantity = avgQuantity;
	}

	public BigDecimal getAvgValue() {
		return avgValue;
	}

	public void setAvgValue(BigDecimal avgValue) {
		this.avgValue = avgValue;
	}

	public String getPeriodicType() {
		return periodicType;
	}

	public void setPeriodicType(String periodicType) {
		this.periodicType = periodicType;
	}

	
	public int getPayinNum() {
		return payinNum;
	}

	public void setPayinNum(int payinNum) {
		this.payinNum = payinNum;
	}

	public int getPayoutNum() {
		return payoutNum;
	}

	public void setPayoutNum(int payoutNum) {
		this.payoutNum = payoutNum;
	}

	public String getCashierId() {
		return cashierId;
	}

	public void setCashierId(String cashierId) {
		this.cashierId = cashierId;
	}

	public int getNumberOfWalkins() {
		return numberOfWalkins;
	}

	public void setNumberOfWalkins(int numberOfWalkins) {
		this.numberOfWalkins = numberOfWalkins;
	}

	public String getWalkInConversion() {
		return walkInConversion;
	}

	public void setWalkInConversion(String walkInConversion) {
		this.walkInConversion = walkInConversion;
	}

	public boolean isStorewise() {
		return storewise;
	}

	public void setStorewise(boolean storewise) {
		this.storewise = storewise;
	}

	public Float getOpenStock() {
		return openStock;
	}

	public void setOpenStock(Float openStock) {
		this.openStock = openStock;
	}

	public Float getClosedStock() {
		return closedStock;
	}

	public void setClosedStock(Float closedStock) {
		this.closedStock = closedStock;
	}

	public Float getDiffStock() {
		return diffStock;
	}

	public void setDiffStock(Float diffStock) {
		this.diffStock = diffStock;
	}

	public Float getLossStock() {
		return lossStock;
	}

	public void setLossStock(Float lossStock) {
		this.lossStock = lossStock;
	}

	public Float getGrnStock() {
		return grnStock;
	}

	public void setGrnStock(Float grnStock) {
		this.grnStock = grnStock;
	}

	public Float getItemDiscount() {
		return itemDiscount;
	}

	public void setItemDiscount(Float itemDiscount) {
		this.itemDiscount = itemDiscount;
	}

	public Float getManualDiscount() {
		return manualDiscount;
	}

	public void setManualDiscount(Float manualDiscount) {
		this.manualDiscount = manualDiscount;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getMeasureRange() {
		return measureRange;
	}

	public void setMeasureRange(String measureRange) {
		this.measureRange = measureRange;
	}

	public String getProductRange() {
		return productRange;
	}

	public void setProductRange(String productRange) {
		this.productRange = productRange;
	}

	public String getEan() {
		return ean;
	}

	public void setEan(String ean) {
		this.ean = ean;
	}

	public Float getOpenStockQty() {
		return openStockQty;
	}

	public void setOpenStockQty(Float openStockQty) {
		this.openStockQty = openStockQty;
	}

	public Float getClosedStockQty() {
		return closedStockQty;
	}

	public void setClosedStockQty(Float closedStockQty) {
		this.closedStockQty = closedStockQty;
	}

	public Float getSkuReceiptQty() {
		return skuReceiptQty;
	}

	public void setSkuReceiptQty(Float skuReceiptQty) {
		this.skuReceiptQty = skuReceiptQty;
	}

	public Float getSkuTrnsQty() {
		return skuTrnsQty;
	}

	public void setSkuTrnsQty(Float skuTrnsQty) {
		this.skuTrnsQty = skuTrnsQty;
	}

	public Float getSkuReturnQty() {
		return skuReturnQty;
	}

	public void setSkuReturnQty(Float skuReturnQty) {
		this.skuReturnQty = skuReturnQty;
	}

}
