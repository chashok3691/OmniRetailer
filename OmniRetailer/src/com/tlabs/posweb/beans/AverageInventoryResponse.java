package com.tlabs.posweb.beans;

import java.math.BigDecimal;

import java.util.List;



public class AverageInventoryResponse {

	private ResponseHeader responseHeader;
	private List<AverageInventoryResponse> averageInventory;
	private int totalRecords;
	private AverageSummary averageSummery;
	private List reportsList;
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
	private Float diffStock;
	private Float grnStock;
	private Float lossStock;
	private String walkInConversion;
	
	public AverageSummary getAverageSummery() {
		return averageSummery;
	}

	public void setAverageSummery(AverageSummary averageSummery) {
		this.averageSummery = averageSummery;
	}

	

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public List getReportsList() {
		return reportsList;
	}

	public void setReportsList(List reportsList) {
		this.reportsList = reportsList;
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

	public String getCounterId() {
		return counterId;
	}

	public void setCounterId(String counterId) {
		this.counterId = counterId;
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

	public String getRequiredRecords() {
		return requiredRecords;
	}

	public void setRequiredRecords(String requiredRecords) {
		this.requiredRecords = requiredRecords;
	}

	public String getPluCode() {
		return pluCode;
	}

	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
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

	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
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

	public String getCustomer() {
		return customer;
	}

	public void setCustomer(String customer) {
		this.customer = customer;
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

	public String getBillStatus() {
		return billStatus;
	}

	public void setBillStatus(String billStatus) {
		this.billStatus = billStatus;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
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

	public String getTaxId() {
		return taxId;
	}

	public void setTaxId(String taxId) {
		this.taxId = taxId;
	}

	public boolean isSaveReport() {
		return isSaveReport;
	}

	public void setSaveReport(boolean isSaveReport) {
		this.isSaveReport = isSaveReport;
	}

	public boolean isCustomerBillFormat() {
		return customerBillFormat;
	}

	public void setCustomerBillFormat(boolean customerBillFormat) {
		this.customerBillFormat = customerBillFormat;
	}

	public String getCashierId() {
		return cashierId;
	}

	public void setCashierId(String cashierId) {
		this.cashierId = cashierId;
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

	public String getPeriodicType() {
		return periodicType;
	}

	public void setPeriodicType(String periodicType) {
		this.periodicType = periodicType;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getSubDepartment() {
		return subDepartment;
	}

	public void setSubDepartment(String subDepartment) {
		this.subDepartment = subDepartment;
	}

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
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

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getSearchCriteriaStr() {
		return searchCriteriaStr;
	}

	public void setSearchCriteriaStr(String searchCriteriaStr) {
		this.searchCriteriaStr = searchCriteriaStr;
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

	public String getItemDesc() {
		return itemDesc;
	}

	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
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

	public Double getCatContVal() {
		return catContVal;
	}

	public void setCatContVal(Double catContVal) {
		this.catContVal = catContVal;
	}

	public boolean isStorewise() {
		return storewise;
	}

	public void setStorewise(boolean storewise) {
		this.storewise = storewise;
	}

	public Double getStoreContVal() {
		return storeContVal;
	}

	public void setStoreContVal(Double storeContVal) {
		this.storeContVal = storeContVal;
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

	public int getNumberOfWalkins() {
		return numberOfWalkins;
	}

	public void setNumberOfWalkins(int numberOfWalkins) {
		this.numberOfWalkins = numberOfWalkins;
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

	public Float getGrnStock() {
		return grnStock;
	}

	public void setGrnStock(Float grnStock) {
		this.grnStock = grnStock;
	}

	public Float getLossStock() {
		return lossStock;
	}

	public void setLossStock(Float lossStock) {
		this.lossStock = lossStock;
	}

	public String getWalkInConversion() {
		return walkInConversion;
	}

	public void setWalkInConversion(String walkInConversion) {
		this.walkInConversion = walkInConversion;
	}
	
	
	
}
