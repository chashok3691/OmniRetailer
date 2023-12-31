package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.List;
import java.util.Set;



// Generated Oct 6, 2014 11:10:28 AM by Hibernate Tools 3.1.0.beta4

/**
 * Billing generated by hbm2java
 */

@SuppressWarnings("serial")
public class Billing implements java.io.Serializable {
	private boolean saveReportFlag;
	private String searchBillsFilePath;
	private String searchBillsReportResponse;
	private String billId;
	private String dateAndTime;
	private String cashierId;
	private String counterId;
	
	private String totalDiscount;
	private String discountType;
	private String discountTypeId;
	private String serialBillId;
	private String serailBillIdYearly;
	
	public String getSerailBillIdYearly() {
		return serailBillIdYearly;
	}

	public void setSerailBillIdYearly(String serailBillIdYearly) {
		this.serailBillIdYearly = serailBillIdYearly;
	}

	private String transactionMode;
	private String tax;
	private String totalTaxValue;
	private String returnorExchangeAmt;
	private String htmlContent;
	
	//Newly Added
	private String counter;
	private String dateStr;
	private String orderLocation;
	private String orderedDateStr;
	private String mobile;
	private String orderId;
	private String noOfOrderItems;
	private String noOfBillingItems;
	private float orderAmount;
	private float totalBillAmount;
	private String billid;
	private String salesChannel;
	private int noOfItems;
	private Double grandTotalValue;
	private BigDecimal grandTotalBillsValue;
	
	private String customerId;
	private int  walkInCount;
	private int  onlineCount;
	private Float  avgBillAmt;
	private String convertionRatio;
	private int  customerCategory;
	
	private boolean jsonFileRequired;
	
	//for Integration Monitor
			private Long totalBills;
			private Long uploadedBills;
			private Long pendingBills;
			private String sapStatus;
			private Set<String> locationsList;
			private String endDate;
			private String business_date_str;
			
			
			
			private String recentVisitDate;
			
			private boolean billSyncStatus=false;
			
			private String customerGstin;
			
			
			
	
	public String getCustomerGstin() {
				return customerGstin;
			}

			public void setCustomerGstin(String customerGstin) {
				this.customerGstin = customerGstin;
			}

	public boolean isBillSyncStatus() {
				return billSyncStatus;
			}

			public void setBillSyncStatus(boolean billSyncStatus) {
				this.billSyncStatus = billSyncStatus;
			}

	public String getRecentVisitDate() {
				return recentVisitDate;
			}

			public void setRecentVisitDate(String recentVisitDate) {
				this.recentVisitDate = recentVisitDate;
			}

	public Long getTotalBills() {
				return totalBills;
			}

			public void setTotalBills(Long totalBills) {
				this.totalBills = totalBills;
			}

			public Long getUploadedBills() {
				return uploadedBills;
			}

			public void setUploadedBills(Long uploadedBills) {
				this.uploadedBills = uploadedBills;
			}

			public Long getPendingBills() {
				return pendingBills;
			}

			public void setPendingBills(Long pendingBills) {
				this.pendingBills = pendingBills;
			}

			public String getSapStatus() {
				return sapStatus;
			}

			public void setSapStatus(String sapStatus) {
				this.sapStatus = sapStatus;
			}

			public Set<String> getLocationsList() {
				return locationsList;
			}

			public void setLocationsList(Set<String> locationsList) {
				this.locationsList = locationsList;
			}

			public String getEndDate() {
				return endDate;
			}

			public void setEndDate(String endDate) {
				this.endDate = endDate;
			}

			public String getBusiness_date_str() {
				return business_date_str;
			}

			public void setBusiness_date_str(String business_date_str) {
				this.business_date_str = business_date_str;
			}

	public boolean isJsonFileRequired() {
		return jsonFileRequired;
	}

	public void setJsonFileRequired(boolean jsonFileRequired) {
		this.jsonFileRequired = jsonFileRequired;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	

	

	public int getWalkInCount() {
		return walkInCount;
	}

	public void setWalkInCount(int walkInCount) {
		this.walkInCount = walkInCount;
	}

	public int getOnlineCount() {
		return onlineCount;
	}

	public void setOnlineCount(int onlineCount) {
		this.onlineCount = onlineCount;
	}

	public Float getAvgBillAmt() {
		return avgBillAmt;
	}

	public void setAvgBillAmt(Float avgBillAmt) {
		this.avgBillAmt = avgBillAmt;
	}

	public int getCustomerCategory() {
		return customerCategory;
	}

	public void setCustomerCategory(int customerCategory) {
		this.customerCategory = customerCategory;
	}

	public String getConvertionRatio() {
		return convertionRatio;
	}

	public void setConvertionRatio(String convertionRatio) {
		this.convertionRatio = convertionRatio;
	}

	public BigDecimal getGrandTotalBillsValue() {
		return grandTotalBillsValue;
	}

	public void setGrandTotalBillsValue(BigDecimal grandTotalBillsValue) {
		this.grandTotalBillsValue = grandTotalBillsValue;
	}

	public Double getGrandTotalValue() {
		return grandTotalValue;
	}

	public void setGrandTotalValue(Double grandTotalValue) {
		this.grandTotalValue = grandTotalValue;
	}

	public int getNoOfItems() {
		return noOfItems;
	}

	public void setNoOfItems(int noOfItems) {
		this.noOfItems = noOfItems;
	}

	public String getSalesChannel() {
		return salesChannel;
	}

	public void setSalesChannel(String salesChannel) {
		this.salesChannel = salesChannel;
	}

	public String getCounter() {
		return counter;
	}

	public void setCounter(String counter) {
		this.counter = counter;
	}

	
	public String getDateStr() {
		return dateStr;
	}

	public void setDateStr(String dateStr) {
		this.dateStr = dateStr;
	}

	public String getOrderLocation() {
		return orderLocation;
	}

	public void setOrderLocation(String orderLocation) {
		this.orderLocation = orderLocation;
	}

	public String getOrderedDateStr() {
		return orderedDateStr;
	}

	public void setOrderedDateStr(String orderedDateStr) {
		this.orderedDateStr = orderedDateStr;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getNoOfOrderItems() {
		return noOfOrderItems;
	}

	public void setNoOfOrderItems(String noOfOrderItems) {
		this.noOfOrderItems = noOfOrderItems;
	}

	public String getNoOfBillingItems() {
		return noOfBillingItems;
	}

	public void setNoOfBillingItems(String noOfBillingItems) {
		this.noOfBillingItems = noOfBillingItems;
	}

	public float getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(float orderAmount) {
		this.orderAmount = orderAmount;
	}

	public float getTotalBillAmount() {
		return totalBillAmount;
	}

	public void setTotalBillAmount(float totalBillAmount) {
		this.totalBillAmount = totalBillAmount;
	}

	public String getBillid() {
		return billid;
	}

	public void setBillid(String billid) {
		this.billid = billid;
	}

	public String getHtmlContent() {
		return htmlContent;
	}

	public void setHtmlContent(String htmlContent) {
		this.htmlContent = htmlContent;
	}

	private Boolean offlineBill;
	/*private List<?> qtyArrList;
	private List<?> totalPriceArrList;*/
	
	private List<String> billedLocations; 
	public List<String> getBilledLocations() {
		return billedLocations;
	}

	public void setBilledLocations(List<String> billedLocations) {
		this.billedLocations = billedLocations;
	}

	private String response;
	
	public String getResponse() {
		return response;
	}

	public void setResponse(String response) {
		this.response = response;
	}

	private List<ExchangedItems> exchangeItemsList;
	public List<ExchangedItems> getExchangeItemsList() {
		return exchangeItemsList;
	}

	public void setExchangeItemsList(List<ExchangedItems> exchangeItemsList) {
		this.exchangeItemsList = exchangeItemsList;
	}

	//private String returnorExchangeAmt;
	private String billAmount;
	public String getBillAmount() {
		return billAmount;
	}

	public void setBillAmount(String billAmount) {
		this.billAmount = billAmount;
	}

	public String getTotalBillGross() {
		return totalBillGross;
	}

	public void setTotalBillGross(String totalBillGross) {
		this.totalBillGross = totalBillGross;
	}

	public String getPromoDiscount() {
		return promoDiscount;
	}

	public void setPromoDiscount(String promoDiscount) {
		this.promoDiscount = promoDiscount;
	}

	private String totalBillGross;
	private String promoDiscount;
	
	
	public String getReturnorExchangeAmt() {
		return returnorExchangeAmt;
	}

	public void setReturnorExchangeAmt(String returnorExchangeAmt) {
		this.returnorExchangeAmt = returnorExchangeAmt;
	}

	public String getTotalTaxValue() {
		return totalTaxValue;
	}

	public void setTotalTaxValue(String totalTaxValue) {
		this.totalTaxValue = totalTaxValue;
	}

	private String totalPrice;
	private boolean printResponseRequired;

	private PrintResponse printResponse;
	private String dueAmount;
	private String emailId;
	private String phoneNumber;
	private String status;
	private String store_location;
	private String totalRecords;
	private RequestHeader requestHeader;
	private String startIndex;
	private String deliveryType;
	private String billDate;
	private int shiftId;
	private int printCount;
	private Float otherDiscount;
	private String businessDate;
    private List<BillItems> billItems;
    private Set<ReturnedItems> billReturnItems;
    private Set<ExchangedItems> billExchangedItems;
    private Set<BillingTransactions> billingTransactions;
    private Set<CashDenominations> denominations;
    private Set<BillingDiscounts> billDiscounts;
	private ResponseHeader responseHeader;
	private String reportType;
	private String reportDate;
	private String bill_date = null;
	private String customerName;
	private boolean isPrinting;
	private String otherDisc = null;
	private String voucherDiscounts = null;
	private Float declareAmtCard = 0f;
	private Float declareAmtCash =0f;
	private Float declareAmtSodex = 0f;
	private Float declareAmtTicket = 0f;
	private Float subTotal;
	/* for storing the billing discount details */
	private List<Deal> dealsInfo;
	private List<Offer> offersInfo;
	private String business_date;
	private String maxRecords;
	private String order;
	private String orderBy;
	private String searchCriteria;
	private String reportEndDate;
	private int slNo;
	private String category;
	private String brand;
	private String zoneId;
	private String subCategory;
	private String billingChannel;
	private String startDate;
	private String salesReportFilePath;
	
	private String itemName;
	private String billDateStr;
	
	private String filePath;
	
	
	private String flow;
	private String criteria;
	private String type;
	private String typePay;
	private String dateAndTimeStr;
	
	

	
	
	
	
	
	public String getFlow() {
		return flow;
	}

	public void setFlow(String flow) {
		this.flow = flow;
	}

	public String getCriteria() {
		return criteria;
	}

	public void setCriteria(String criteria) {
		this.criteria = criteria;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTypePay() {
		return typePay;
	}

	public void setTypePay(String typePay) {
		this.typePay = typePay;
	}

	public String getDateAndTimeStr() {
		return dateAndTimeStr;
	}

	public void setDateAndTimeStr(String dateAndTimeStr) {
		this.dateAndTimeStr = dateAndTimeStr;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	private String noOfCustomerVisits;
//	private Billing billingList;
	
	public String getNoOfCustomerVisits() {
		return noOfCustomerVisits;
	}

	public void setNoOfCustomerVisits(String noOfCustomerVisits) {
		this.noOfCustomerVisits = noOfCustomerVisits;
	}

	public String getBillDateStr() {
		return billDateStr;
	}

	public void setBillDateStr(String billDateStr) {
		this.billDateStr = billDateStr;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	private List<Billing> billingList;
	private List<Billing> billing;
	
	public List<Billing> getBilling() {
		return billing;
	}

	public void setBilling(List<Billing> billing) {
		this.billing = billing;
	}

	public List<Billing> getBillingList() {
		return billingList;
	}

	public void setBillingList(List<Billing> billingList) {
		this.billingList = billingList;
	}

	private String storeLocation;
	
	private String comments;
	private BigDecimal totalTurnOver;
	
	

	public BigDecimal getTotalTurnOver() {
		return totalTurnOver;
	}

	public void setTotalTurnOver(BigDecimal totalTurnOver) {
		this.totalTurnOver = totalTurnOver;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public int getSlNo() {
		return slNo;
	}

	public String getStoreLocation() {
		return storeLocation;
	}

	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}

	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	public String getReportEndDate() {
		return reportEndDate;
	}

	public void setReportEndDate(String reportEndDate) {
		this.reportEndDate = reportEndDate;
	}

	public String getVoucherDiscounts() {
		return voucherDiscounts;
	}

	public void setVoucherDiscounts(String voucherDiscounts) {
		this.voucherDiscounts = voucherDiscounts;
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

	public String getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}

	public Float getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(Float subTotal) {
		this.subTotal = subTotal;
	}

	public String getBillDate() {
		return billDate;
	}

	public void setBillDate(String billDate) {
		this.billDate = billDate;
	}

	public int getShiftId() {
		return shiftId;
	}

	public void setShiftId(int shiftId) {
		this.shiftId = shiftId;
	}

	public int getPrintCount() {
		return printCount;
	}

	public void setPrintCount(int printCount) {
		this.printCount = printCount;
	}

	public Float getOtherDiscount() {
		return otherDiscount;
	}

	public void setOtherDiscount(Float otherDiscount) {
		this.otherDiscount = otherDiscount;
	}

	public String getBusinessDate() {
		return businessDate;
	}

	public void setBusinessDate(String businessDate) {
		this.businessDate = businessDate;
	}

	public List<BillItems> getBillItems() {
		return billItems;
	}

	public void setBillItems(List<BillItems> billItems) {
		this.billItems = billItems;
	}

	public Set<ReturnedItems> getBillReturnItems() {
		return billReturnItems;
	}

	public void setBillReturnItems(Set<ReturnedItems> billReturnItems) {
		this.billReturnItems = billReturnItems;
	}

	public Set<ExchangedItems> getBillExchangedItems() {
		return billExchangedItems;
	}

	public void setBillExchangedItems(Set<ExchangedItems> billExchangedItems) {
		this.billExchangedItems = billExchangedItems;
	}

	public Set<BillingTransactions> getBillingTransactions() {
		return billingTransactions;
	}

	public void setBillingTransactions(Set<BillingTransactions> billingTransactions) {
		this.billingTransactions = billingTransactions;
	}

	public Set<CashDenominations> getDenominations() {
		return denominations;
	}

	public void setDenominations(Set<CashDenominations> denominations) {
		this.denominations = denominations;
	}

	public Set<BillingDiscounts> getBillDiscounts() {
		return billDiscounts;
	}

	public void setBillDiscounts(Set<BillingDiscounts> billDiscounts) {
		this.billDiscounts = billDiscounts;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public String getReportType() {
		return reportType;
	}

	public void setReportType(String reportType) {
		this.reportType = reportType;
	}

	public String getReportDate() {
		return reportDate;
	}

	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}

	public String getBill_date() {
		return bill_date;
	}

	public void setBill_date(String bill_date) {
		this.bill_date = bill_date;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public boolean isPrinting() {
		return isPrinting;
	}

	public void setPrinting(boolean isPrinting) {
		this.isPrinting = isPrinting;
	}

	public String getOtherDisc() {
		return otherDisc;
	}

	public void setOtherDisc(String otherDisc) {
		this.otherDisc = otherDisc;
	}

	public Float getDeclareAmtCard() {
		return declareAmtCard;
	}

	public void setDeclareAmtCard(Float declareAmtCard) {
		this.declareAmtCard = declareAmtCard;
	}

	public Float getDeclareAmtCash() {
		return declareAmtCash;
	}

	public void setDeclareAmtCash(Float declareAmtCash) {
		this.declareAmtCash = declareAmtCash;
	}

	public Float getDeclareAmtSodex() {
		return declareAmtSodex;
	}

	public void setDeclareAmtSodex(Float declareAmtSodex) {
		this.declareAmtSodex = declareAmtSodex;
	}

	public Float getDeclareAmtTicket() {
		return declareAmtTicket;
	}

	public void setDeclareAmtTicket(Float declareAmtTicket) {
		this.declareAmtTicket = declareAmtTicket;
	}

	public List<Deal> getDealsInfo() {
		return dealsInfo;
	}

	public void setDealsInfo(List<Deal> dealsInfo) {
		this.dealsInfo = dealsInfo;
	}

	public List<Offer> getOffersInfo() {
		return offersInfo;
	}

	public void setOffersInfo(List<Offer> offersInfo) {
		this.offersInfo = offersInfo;
	}

	public String getBusiness_date() {
		return business_date;
	}

	public void setBusiness_date(String business_date) {
		this.business_date = business_date;
	}

	public String getDeliveryType() {
		return deliveryType;
	}

	public void setDeliveryType(String deliveryType) {
		this.deliveryType = deliveryType;
	}

	public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

	public String getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}

	public String getBillId() {
		return this.billId;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setBillId(String billId) {
		this.billId = billId;
	}

	public String getDateAndTime() {
		return this.dateAndTime;
	}

	public void setDateAndTime(String dateAndTime) {
		this.dateAndTime = dateAndTime;
	}

	public String getCashierId() {
		return this.cashierId;
	}

	public void setCashierId(String cashierId) {
		this.cashierId = cashierId;
	}

	public String getCounterId() {
		return this.counterId;
	}

	public void setCounterId(String counterId) {
		this.counterId = counterId;
	}

	public String getTotalDiscount() {
		return this.totalDiscount;
	}

	public void setTotalDiscount(String totalDiscount) {
		this.totalDiscount = totalDiscount;
	}

	public String getDiscountType() {
		return this.discountType;
	}

	public void setDiscountType(String discountType) {
		this.discountType = discountType;
	}

	public String getDiscountTypeId() {
		return this.discountTypeId;
	}

	public void setDiscountTypeId(String discountTypeId) {
		this.discountTypeId = discountTypeId;
	}

	public String getTax() {
		return this.tax;
	}

	public void setTax(String tax) {
		this.tax = tax;
	}

	public String getTotalPrice() {
		return this.totalPrice;
	}

	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getDueAmount() {
		return this.dueAmount;
	}

	public void setDueAmount(String dueAmount) {
		this.dueAmount = dueAmount;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getStore_location() {
		return store_location;
	}

	public void setStore_location(String store_location) {
		this.store_location = store_location;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getZoneId() {
		return zoneId;
	}

	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	public String getBillingChannel() {
		return billingChannel;
	}

	public void setBillingChannel(String billingChannel) {
		this.billingChannel = billingChannel;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public boolean isSaveReportFlag() {
		return saveReportFlag;
	}

	public void setSaveReportFlag(boolean saveReportFlag) {
		this.saveReportFlag = saveReportFlag;
	}

	public String getSearchBillsFilePath() {
		return searchBillsFilePath;
	}

	public void setSearchBillsFilePath(String searchBillsFilePath) {
		this.searchBillsFilePath = searchBillsFilePath;
	}

	public String getSearchBillsReportResponse() {
		return searchBillsReportResponse;
	}

	public void setSearchBillsReportResponse(String searchBillsReportResponse) {
		this.searchBillsReportResponse = searchBillsReportResponse;
	}

	public String getSalesReportFilePath() {
		return salesReportFilePath;
	}

	public void setSalesReportFilePath(String salesReportFilePath) {
		this.salesReportFilePath = salesReportFilePath;
	}

	public String getSerialBillId() {
		return serialBillId;
	}

	public void setSerialBillId(String serialBillId) {
		this.serialBillId = serialBillId;
	}

	public String getTransactionMode() {
		return transactionMode;
	}

	public void setTransactionMode(String transactionMode) {
		this.transactionMode = transactionMode;
	}

	public boolean isPrintResponseRequired() {
		return printResponseRequired;
	}

	public void setPrintResponseRequired(boolean printResponseRequired) {
		this.printResponseRequired = printResponseRequired;
	}

	public PrintResponse getPrintResponse() {
		return printResponse;
	}

	public void setPrintResponse(PrintResponse printResponse) {
		this.printResponse = printResponse;
	}

	public Boolean getOfflineBill() {
		return offlineBill;
	}

	public void setOfflineBill(Boolean offlineBill) {
		this.offlineBill = offlineBill;
	}

}
