package com.tlabs.posweb.beans;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Set;



public class SalesReport implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -5696380544884749845L;
	private String skuId;
	private String itemDescription;
	private double soldQty;
	private double totalCost;
	private float itemUnitPrice;
	private float costPrice;
	private Float returnedQty;
	private Float exchangedQty;
	private String lineNumber;
	private float creditTotal;
	private String salesReportFilePath;
	private Set<String> taxLablesList;
	private Map<String,List<String>> taxWiseReport;
	private Float finalReturnedAmt;
	private Float finalExchangedAmt;
	private String department;
	 private String color;
     private String size;
     private String model;
     private String productRange;
     private String subCategory;
     private String brand;
     	private float totalSoldQty;
     	private float totalSoldValue;
     	private String ean;
     	private float unitPrice;
    	private String description;
    	private float manualdiscount;
    	private float tax;
    	private double weighedSaleQty;
    	private double catContr;
    	private String cashierName;
    	private int noofBills;
    	private float noOfBills;
    	private int noOfCreditBills;
    	private String deliveryPersonName;
    	private String deliveryPersonId;
    	private int noOfToBeDeliveredBills;
    	private int noOfDeliveredBills;
    	private int noOfPendingBills;
    	private String objDate;
    	private float procQty;
    	private float procCost;
    	private float dumpQty;
    	private float dumpCost;
    	private float marginValue;
    	private float marginPer;
    	private String time;
    	private int noOfDeliveries;
    	
    	private BigDecimal declareCash;
    	private BigDecimal openCash;
    	private boolean isHourWiseReport=false;
    	
    	private String avgBillTime;
    	
    	private String noOfDaysPresent;
    	private float  noOfVoidBills;
    	private float  noOfCancelledBills;
    	
    	private String loginId;
    	private int noOfItems;
    	private double totalQuantity;
    	private String hsnCode;
    	private String taxRate;
    	private String taxValue;
    	private String storeDescription;
    	private String orderId;
    	private String orderRef;
    	private String eventId;
        private String eventName;
        private String zoneId;
    	private boolean fileRequired;
    	private String fileUrl;	
    	private BigDecimal returnQuantity;
    	private String status;
    	private float avgSupplyPrice;
    	private float supplyQty;

    	
    	
		public float getAvgSupplyPrice() {
			return avgSupplyPrice;
		}
		public void setAvgSupplyPrice(float avgSupplyPrice) {
			this.avgSupplyPrice = avgSupplyPrice;
		}
		public float getSupplyQty() {
			return supplyQty;
		}
		public void setSupplyQty(float supplyQty) {
			this.supplyQty = supplyQty;
		}
		public BigDecimal getReturnQuantity() {
			return returnQuantity;
		}
		public void setReturnQuantity(BigDecimal returnQuantity) {
			this.returnQuantity = returnQuantity;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
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
		public String getZoneId() {
			return zoneId;
		}
		public void setZoneId(String zoneId) {
			this.zoneId = zoneId;
		}
		public boolean isFileRequired() {
			return fileRequired;
		}
		public void setFileRequired(boolean fileRequired) {
			this.fileRequired = fileRequired;
		}
		public String getFileUrl() {
			return fileUrl;
		}
		public void setFileUrl(String fileUrl) {
			this.fileUrl = fileUrl;
		}
		public String getOrderRef() {
			return orderRef;
		}
		public void setOrderRef(String orderRef) {
			this.orderRef = orderRef;
		}
		public String getOrderId() {
			return orderId;
		}
		public void setOrderId(String orderId) {
			this.orderId = orderId;
		}
		public String getStoreDescription() {
			return storeDescription;
		}
		public void setStoreDescription(String storeDescription) {
			this.storeDescription = storeDescription;
		}
		public String getTaxRate() {
			return taxRate;
		}
		public void setTaxRate(String taxRate) {
			this.taxRate = taxRate;
		}
		public String getTaxValue() {
			return taxValue;
		}
		public void setTaxValue(String taxValue) {
			this.taxValue = taxValue;
		}
		public String getHsnCode() {
			return hsnCode;
		}
		public void setHsnCode(String hsnCode) {
			this.hsnCode = hsnCode;
		}
		public int getNoOfItems() {
			return noOfItems;
		}
		public void setNoOfItems(int noOfItems) {
			this.noOfItems = noOfItems;
		}
		public double getTotalQuantity() {
			return totalQuantity;
		}
		public void setTotalQuantity(double totalQuantity) {
			this.totalQuantity = totalQuantity;
		}
		public String getLoginId() {
			return loginId;
		}
		public void setLoginId(String loginId) {
			this.loginId = loginId;
		}
		public String getNoOfDaysPresent() {
			return noOfDaysPresent;
		}
		public void setNoOfDaysPresent(String noOfDaysPresent) {
			this.noOfDaysPresent = noOfDaysPresent;
		}
		public float getNoOfVoidBills() {
			return noOfVoidBills;
		}
		public void setNoOfVoidBills(float noOfVoidBills) {
			this.noOfVoidBills = noOfVoidBills;
		}
		public float getNoOfCancelledBills() {
			return noOfCancelledBills;
		}
		public void setNoOfCancelledBills(float noOfCancelledBills) {
			this.noOfCancelledBills = noOfCancelledBills;
		}
		public float getNoOfBills() {
			return noOfBills;
		}
		public void setNoOfBills(float noOfBills) {
			this.noOfBills = noOfBills;
		}
		public String getAvgBillTime() {
			return avgBillTime;
		}
		public void setAvgBillTime(String avgBillTime) {
			this.avgBillTime = avgBillTime;
		}
		public boolean isHourWiseReport() {
			return isHourWiseReport;
		}
		public void setHourWiseReport(boolean isHourWiseReport) {
			this.isHourWiseReport = isHourWiseReport;
		}
		public BigDecimal getDeclareCash() {
			return declareCash;
		}
		public void setDeclareCash(BigDecimal declareCash) {
			this.declareCash = declareCash;
		}
		public BigDecimal getOpenCash() {
			return openCash;
		}
		public void setOpenCash(BigDecimal openCash) {
			this.openCash = openCash;
		}
		public float getCostPrice() {
			return costPrice;
		}
		public void setCostPrice(float costPrice) {
			this.costPrice = costPrice;
		}
		public int getNoOfDeliveries() {
			return noOfDeliveries;
		}
		public void setNoOfDeliveries(int noOfDeliveries) {
			this.noOfDeliveries = noOfDeliveries;
		}
		public String getTime() {
			return time;
		}
		public void setTime(String time) {
			this.time = time;
		}
		public float getMarginPer() {
			return marginPer;
		}
		public void setMarginPer(float marginPer) {
			this.marginPer = marginPer;
		}
		public float getMarginValue() {
			return marginValue;
		}
		public void setMarginValue(float marginValue) {
			this.marginValue = marginValue;
		}
		public float getDumpCost() {
			return dumpCost;
		}
		public void setDumpCost(float dumpCost) {
			this.dumpCost = dumpCost;
		}
		public float getDumpQty() {
			return dumpQty;
		}
		public void setDumpQty(float dumpQty) {
			this.dumpQty = dumpQty;
		}
		public float getProcCost() {
			return procCost;
		}
		public void setProcCost(float procCost) {
			this.procCost = procCost;
		}
		public float getProcQty() {
			return procQty;
		}
		public void setProcQty(float procQty) {
			this.procQty = procQty;
		}
		public int getNoOfCreditBills() {
			return noOfCreditBills;
		}
		public void setNoOfCreditBills(int noOfCreditBills) {
			this.noOfCreditBills = noOfCreditBills;
		}
		
    	public String getObjDate() {
			return objDate;
		}
		public void setObjDate(String objDate) {
			this.objDate = objDate;
		}
		public int getNoOfPendingBills() {
			return noOfPendingBills;
		}
		public void setNoOfPendingBills(int noOfPendingBills) {
			this.noOfPendingBills = noOfPendingBills;
		}
		public int getNoOfToBeDeliveredBills() {
			return noOfToBeDeliveredBills;
		}
		public void setNoOfToBeDeliveredBills(int noOfToBeDeliveredBills) {
			this.noOfToBeDeliveredBills = noOfToBeDeliveredBills;
		}
		public int getNoOfDeliveredBills() {
			return noOfDeliveredBills;
		}
		public void setNoOfDeliveredBills(int noOfDeliveredBills) {
			this.noOfDeliveredBills = noOfDeliveredBills;
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
		public String getCouponNumber() {
			return couponNumber;
		}
		public void setCouponNumber(String couponNumber) {
			this.couponNumber = couponNumber;
		}
		public String getTransactionDateStr() {
			return transactionDateStr;
		}
		public void setTransactionDateStr(String transactionDateStr) {
			this.transactionDateStr = transactionDateStr;
		}
		public String getPaidAmount() {
			return paidAmount;
		}
		public void setPaidAmount(String paidAmount) {
			this.paidAmount = paidAmount;
		}
		public String getPaymentMode() {
			return paymentMode;
		}
		public void setPaymentMode(String paymentMode) {
			this.paymentMode = paymentMode;
		}
		private BigDecimal avgQuantity;
    	private String couponNumber;
    	private String transactionDateStr;
    	private String paidAmount;
    	private String paymentMode;
    	
    	
    	private String billId;
    	private String serialBillId;
    	
    	public String getBillId() {
			return billId;
		}
		public void setBillId(String billId) {
			this.billId = billId;
		}
		public String getSerialBillId() {
			return serialBillId;
		}
		public void setSerialBillId(String serialBillId) {
			this.serialBillId = serialBillId;
		}
		private String storeLocation;
    	public String getStoreLocation() {
			return storeLocation;
		}
		public void setStoreLocation(String storeLocation) {
			this.storeLocation = storeLocation;
		}
		//private Double totalCost;
    	private String locationlist;
    	
    	public String getLocationlist() {
			return locationlist;
		}
		public void setLocationlist(String locationlist) {
			this.locationlist = locationlist;
		}
		private List<String> eansList;
    	public List<String> getEansList() {
			return eansList;
		}
		public void setEansList(List<String> eansList) {
			this.eansList = eansList;
		}
		private String store_location;
    	private String billRef;
    	public String getBillRef() {
			return billRef;
		}
		public void setBillRef(String billRef) {
			this.billRef = billRef;
		}
		public String getStore_location() {
			return store_location;
		}
		public void setStore_location(String store_location) {
			this.store_location = store_location;
		}
		private BigDecimal saleQty;
    public BigDecimal getSaleQty() {
			return saleQty;
		}
		public void setSaleQty(BigDecimal saleQty) {
			this.saleQty = saleQty;
		}
		public int getTotalsalesbills() {
			return totalsalesbills;
		}
		public void setTotalsalesbills(int totalsalesbills) {
			this.totalsalesbills = totalsalesbills;
		}
		
	
		public int getTotalreturnbills() {
			return totalreturnbills;
		}
		public void setTotalreturnbills(int totalreturnbills) {
			this.totalreturnbills = totalreturnbills;
		}
		public int getReturnbills() {
			return returnbills;
		}
		public void setReturnbills(int returnbills) {
			this.returnbills = returnbills;
		}
		public BigDecimal getOtherReturnAmt() {
			return otherReturnAmt;
		}
		public void setOtherReturnAmt(BigDecimal otherReturnAmt) {
			this.otherReturnAmt = otherReturnAmt;
		}
		public BigDecimal getTotalSaleQty() {
			return totalSaleQty;
		}
		public void setTotalSaleQty(BigDecimal totalSaleQty) {
			this.totalSaleQty = totalSaleQty;
		}
		public BigDecimal getTotalReturnQty() {
			return totalReturnQty;
		}
		public void setTotalReturnQty(BigDecimal totalReturnQty) {
			this.totalReturnQty = totalReturnQty;
		}
		public BigDecimal getTotalOtherReturnAmt() {
			return totalOtherReturnAmt;
		}
		public void setTotalOtherReturnAmt(BigDecimal totalOtherReturnAmt) {
			this.totalOtherReturnAmt = totalOtherReturnAmt;
		}
		//	private BigDecimal returnQty;
    	private int totalsalesbills;
    	private int totalreturnbills;
    	private int returnbills;
    	private BigDecimal otherReturnAmt;
    	private BigDecimal totalSaleQty;
    	private BigDecimal totalReturnQty;
    	private BigDecimal totalOtherReturnAmt;

    	
    	private List<String> locationsList;
    	
    	public List<String> getLocationsList() {
			return locationsList;
		}
		public void setLocationsList(List<String> locationsList) {
			this.locationsList = locationsList;
		}
		public BigDecimal getTotAvgAmt() {
			return totAvgAmt;
		}
		public void setTotAvgAmt(BigDecimal totAvgAmt) {
			this.totAvgAmt = totAvgAmt;
		}
		public BigDecimal getTotAvgQty() {
			return totAvgQty;
		}
		public void setTotAvgQty(BigDecimal totAvgQty) {
			this.totAvgQty = totAvgQty;
		}
		private String cashierId;
    	private BigDecimal avgValue;
    	private String itemDesc;
    	
    	private BigDecimal totAvgAmt;
    	private BigDecimal totAvgQty;
    	
    //	private float othersAmt;
    	
    	private float totalOtherAmt;
    	
    	private BigDecimal avgBilValue;
    	private BigDecimal avgBilQty;
    	
    	private BigDecimal othersAmt;
    	
    	private float returnQty;
    	private float returnAmt;
    	
    	public float getReturnQty() {
			return returnQty;
		}
		public void setReturnQty(float returnQty) {
			this.returnQty = returnQty;
		}
		public float getReturnAmt() {
			return returnAmt;
		}
		public void setReturnAmt(float returnAmt) {
			this.returnAmt = returnAmt;
		}
		public BigDecimal getOthersAmt() {
			return othersAmt;
		}
		public void setOthersAmt(BigDecimal othersAmt) {
			this.othersAmt = othersAmt;
		}
		public BigDecimal getAvgBilValue() {
			return avgBilValue;
		}
		public void setAvgBilValue(BigDecimal avgBilValue) {
			this.avgBilValue = avgBilValue;
		}
		public BigDecimal getAvgBilQty() {
			return avgBilQty;
		}
		public void setAvgBilQty(BigDecimal avgBilQty) {
			this.avgBilQty = avgBilQty;
		}
	//private String cashierId;
	public String getEan() {
			return ean;
		}
		public void setEan(String ean) {
			this.ean = ean;
		}
	public String getSkuId() {
		return skuId;
	}
	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}
	public String getItemDescription() {
		return itemDescription;
	}
	public void setItemDescription(String itemDescription) {
		this.itemDescription = itemDescription;
	}
	public double getSoldQty() {
		return soldQty;
	}
	public void setSoldQty(double soldQty) {
		this.soldQty = soldQty;
	}
	public double getTotalCost() {
		return totalCost;
	}
	public void setTotalCost(double totalCost) {
		this.totalCost = totalCost;
	}
	public float getItemUnitPrice() {
		return itemUnitPrice;
	}
	public void setItemUnitPrice(float itemUnitPrice) {
		this.itemUnitPrice = itemUnitPrice;
	}
	private float vouchersTotal;
	private float couponsTotal;
	private String cardTotal;
	private String reports;
	private String cashTotal;
	private String serialNumber;
	private String totalRecords;
	private String date;
	private String totalBills;
	private String discount;
	private String response;
	private String counterId;
	private ResponseHeader responseHeader;
	private String sodexTotal;
	private String ticketTotal;
	private String loyaltyTotal;
	private String totalPrice;
	private float  exchangedAmt;
	private float returnedAmt;
	private String location;
	private float totalPaidamount;
	private float fltDiscount;
	
	public float getFltDiscount() {
		return fltDiscount;
	}
	public void setFltDiscount(float fltDiscount) {
		this.fltDiscount = fltDiscount;
	}
	public float getTotalPaidamount() {
		return totalPaidamount;
	}
	public void setTotalPaidamount(float totalPaidamount) {
		this.totalPaidamount = totalPaidamount;
	}
	private int hour;
	
	private String dateStr;
	private String eanCode;
	private String employeeSaleId;
	
	public String getEmployeeSaleId() {
		return employeeSaleId;
	}
	public void setEmployeeSaleId(String employeeSaleId) {
		this.employeeSaleId = employeeSaleId;
	}
	public String getEanCode() {
		return eanCode;
	}
	public void setEanCode(String eanCode) {
		this.eanCode = eanCode;
	}
	private BigDecimal sodexoTotal=BigDecimal.ZERO;;
	
	
	private BigDecimal loyalityTotal=BigDecimal.ZERO;;
	
	private BigDecimal creditNoteTotal=BigDecimal.ZERO;;
	
	private BigDecimal giftVoucherTotal=BigDecimal.ZERO;;
	
	
	private BigDecimal creditsAmount=BigDecimal.ZERO;;
	
	private BigDecimal overallCashTotal=BigDecimal.ZERO;
	
	private BigDecimal returnAmount=BigDecimal.ZERO;
	
	private BigDecimal exchangeAmount=BigDecimal.ZERO;
	private int billCount;
	
	private BigDecimal totCardAmt=BigDecimal.ZERO;
	private BigDecimal totCashAmt=BigDecimal.ZERO;
	private BigDecimal totGiftCoupAmt=BigDecimal.ZERO;
	private BigDecimal totLoyalAmt=BigDecimal.ZERO;
	private BigDecimal totSedexoAmt=BigDecimal.ZERO;
	private BigDecimal totTickAmt=BigDecimal.ZERO;
	private BigDecimal totCreditNoteAmt=BigDecimal.ZERO;
	private BigDecimal totGiftVocAmt=BigDecimal.ZERO;
	private BigDecimal totCreditsAmt=BigDecimal.ZERO;
	private BigDecimal totReturnAmt=BigDecimal.ZERO;
	private BigDecimal totExchAmt=BigDecimal.ZERO;
	private BigDecimal totOverallAmt=BigDecimal.ZERO;
	private BigDecimal creditBillsAmt=BigDecimal.ZERO;
	private float taxAmt;
	private float dayTurnOverAmt;
	
	
	public float getDayTurnOverAmt() {
		return dayTurnOverAmt;
	}
	public void setDayTurnOverAmt(float dayTurnOverAmt) {
		this.dayTurnOverAmt = dayTurnOverAmt;
	}
	private String startIndex;
	
	private String maxRecords;
	
	
	private String startDate;
	
	private String endDate;
	private String brandName;
	private String section;
	private List<SalesReport> reportsList;
	private List<BillSummary> billsSummeryList;
	private List<SalesReport> itemReportList;
	private List<ItemWiseReport> itemDetails;
	private List<SalesReport> hoursReportList;
	private List<BillsList> billsList;
	private List<SalesReport> reportList;
	
	
	
	public int getSaleBills() {
		return saleBills;
	}
	public void setSaleBills(int saleBills) {
		this.saleBills = saleBills;
	}
	public int getReturnBills() {
		return returnBills;
	}
	public void setReturnBills(int returnBills) {
		this.returnBills = returnBills;
	}
	public BigDecimal getSaleQuantity() {
		return saleQuantity;
	}
	public void setSaleQuantity(BigDecimal saleQuantity) {
		this.saleQuantity = saleQuantity;
	}
	public BigDecimal getSaleAmount() {
		return saleAmount;
	}
	public void setSaleAmount(BigDecimal saleAmount) {
		this.saleAmount = saleAmount;
	}
	private int saleBills;
	private int returnBills;
    private BigDecimal saleQuantity;
	private BigDecimal saleAmount;
	
	public List<SalesReport> getReportList() {
		return reportList;
	}
	public void setReportList(List<SalesReport> reportList) {
		this.reportList = reportList;
	}
	public Float getReturnedQty() {
		return returnedQty;
	}
	public void setReturnedQty(Float returnedQty) {
		this.returnedQty = returnedQty;
	}
	public Float getExchangedQty() {
		return exchangedQty;
	}
	public void setExchangedQty(Float exchangedQty) {
		this.exchangedQty = exchangedQty;
	}

	private int noOfCreditNotes;
	private float totalCreditNoteAmt;
	private ReportSummary reportSummery;
	private String categoryName;
	private String category;
	private String price;
	private String quantity;
	private CategorySummary categorySummery;
	private String strDate;
	private String supplierName;
	private String supplierId;
	
	private List<TaxesInfo> taxesInfo;
	private float totalCreditBillsAmt;
	private String gto = "0";
	private String todayTotal = "0";
	private String sales5 = "0";
	private String salesTax5 = "0";
	private String sales145 = "0";
	private String salesTax145 = "0";
	private String exempted = "0";
	private List<Summary> summery;
	private String grossGto = "0";
	private String grossTodayTotal = "0";
	private String grossSales5 = "0";
	private String grossSalesTax5 = "0";
	private String grossSales145 = "0";
	private String grossSalesTax145 = "0";
	private String grossExempted = "0";
	private String floatTotalPrice;
	private float mrp;
	private List<BillingTransactions> transactions;
	private List<Billing> bills;
	private float creditsAmt;
	private String style;
	
	
	private String originalBillId;
	private String tenderName;
	private String shipmentStoreState;
	private String customerDeliveryState;
	private String storeState;
	private String billingDateStr;
	private String billAmount;
	private String billType;
	private String serailBillIdYearly;
	
	
	
	
	public String getSerailBillIdYearly() {
		return serailBillIdYearly;
	}
	public void setSerailBillIdYearly(String serailBillIdYearly) {
		this.serailBillIdYearly = serailBillIdYearly;
	}
	
	
	
	
	
	
	public String getCustomerDeliveryState() {
		return customerDeliveryState;
	}
	public void setCustomerDeliveryState(String customerDeliveryState) {
		this.customerDeliveryState = customerDeliveryState;
	}
	public String getBillType() {
		return billType;
	}
	public void setBillType(String billType) {
		this.billType = billType;
	}
	public String getShipmentStoreState() {
		return shipmentStoreState;
	}
	public void setShipmentStoreState(String shipmentStoreState) {
		this.shipmentStoreState = shipmentStoreState;
	}
	public String getStoreState() {
		return storeState;
	}
	public void setStoreState(String storeState) {
		this.storeState = storeState;
	}
	public String getBillingDateStr() {
		return billingDateStr;
	}
	public void setBillingDateStr(String billingDateStr) {
		this.billingDateStr = billingDateStr;
	}
	public String getBillAmount() {
		return billAmount;
	}
	public void setBillAmount(String billAmount) {
		this.billAmount = billAmount;
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
	public String getStyle() {
		return style;
	}
	public void setStyle(String style) {
		this.style = style;
	}
	public List<Billing> getBills() {
		return bills;
	}
	public void setBills(List<Billing> bills) {
		this.bills = bills;
	}
	public List<BillingTransactions> getTransactions() {
		return transactions;
	}
	public void setTransactions(List<BillingTransactions> transactions) {
		this.transactions = transactions;
	}
	public String getFloatTotalPrice() {
		return floatTotalPrice;
	}
	public void setFloatTotalPrice(String floatTotalPrice) {
		this.floatTotalPrice = floatTotalPrice;
	}
	public List<Summary> getSummery() {
		return summery;
	}
	public void setSummery(List<Summary> summery) {
		this.summery = summery;
	}
	public String getGrossGto() {
		return grossGto;
	}
	public void setGrossGto(String grossGto) {
		this.grossGto = grossGto;
	}
	public String getGrossTodayTotal() {
		return grossTodayTotal;
	}
	public void setGrossTodayTotal(String grossTodayTotal) {
		this.grossTodayTotal = grossTodayTotal;
	}
	public String getGrossSales5() {
		return grossSales5;
	}
	public void setGrossSales5(String grossSales5) {
		this.grossSales5 = grossSales5;
	}
	public String getGrossSalesTax5() {
		return grossSalesTax5;
	}
	public void setGrossSalesTax5(String grossSalesTax5) {
		this.grossSalesTax5 = grossSalesTax5;
	}
	public String getGrossSales145() {
		return grossSales145;
	}
	public void setGrossSales145(String grossSales145) {
		this.grossSales145 = grossSales145;
	}
	public String getGrossSalesTax145() {
		return grossSalesTax145;
	}
	public void setGrossSalesTax145(String grossSalesTax145) {
		this.grossSalesTax145 = grossSalesTax145;
	}
	public String getGrossExempted() {
		return grossExempted;
	}
	public void setGrossExempted(String grossExempted) {
		this.grossExempted = grossExempted;
	}
	public String getTodayTotal() {
		return todayTotal;
	}
	public void setTodayTotal(String todayTotal) {
		this.todayTotal = todayTotal;
	}
	public String getSales5() {
		return sales5;
	}
	public void setSales5(String sales5) {
		this.sales5 = sales5;
	}
	public String getSalesTax5() {
		return salesTax5;
	}
	public void setSalesTax5(String salesTax5) {
		this.salesTax5 = salesTax5;
	}
	public String getSales145() {
		return sales145;
	}
	public void setSales145(String sales145) {
		this.sales145 = sales145;
	}
	public String getSalesTax145() {
		return salesTax145;
	}
	public void setSalesTax145(String salesTax145) {
		this.salesTax145 = salesTax145;
	}
	public String getExempted() {
		return exempted;
	}
	public void setExempted(String exempted) {
		this.exempted = exempted;
	}
	public String getGto() {
		return gto;
	}
	public void setGto(String gto) {
		this.gto = gto;
	}
	public List<TaxesInfo> getTaxesInfo() {
		return taxesInfo;
	}
	public void setTaxesInfo(List<TaxesInfo> taxesInfo) {
		this.taxesInfo = taxesInfo;
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
	public CategorySummary getCategorySummery() {
		return categorySummery;
	}
	public void setCategorySummery(CategorySummary categorySummery) {
		this.categorySummery = categorySummery;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public ReportSummary getReportSummery() {
		return reportSummery;
	}
	public void setReportSummery(ReportSummary reportSummery) {
		this.reportSummery = reportSummery;
	}
	public String getSodexTotal() {
		return sodexTotal;
	}
	public void setSodexTotal(String sodexTotal) {
		this.sodexTotal = sodexTotal;
	}
	public String getTicketTotal() {
		return ticketTotal;
	}
	public void setTicketTotal(String ticketTotal) {
		this.ticketTotal = ticketTotal;
	}
	public String getLoyaltyTotal() {
		return loyaltyTotal;
	}
	public void setLoyaltyTotal(String loyaltyTotal) {
		this.loyaltyTotal = loyaltyTotal;
	}
	public List<BillsList> getBillsList() {
		return billsList;
	}
	public void setBillsList(List<BillsList> billsList) {
		this.billsList = billsList;
	}
	public List<BillSummary> getBillsSummeryList() {
		return billsSummeryList;
	}
	public void setBillsSummeryList(List<BillSummary> billsSummeryList) {
		this.billsSummeryList = billsSummeryList;
	}
	public List<SalesReport> getReportsList() {
		return reportsList;
	}
	public void setReportsList(List<SalesReport> reportsList) {
		this.reportsList = reportsList;
	}
	public String getCardTotal() {
		return cardTotal;
	}
	public void setCardTotal(String cardTotal) {
		this.cardTotal = cardTotal;
	}
	public String getReports() {
		return reports;
	}
	public void setReports(String reports) {
		this.reports = reports;
	}
	public String getCashTotal() {
		return cashTotal;
	}
	public void setCashTotal(String cashTotal) {
		this.cashTotal = cashTotal;
	}
	public String getSerialNumber() {
		return serialNumber;
	}
	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}
	public String getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTotalBills() {
		return totalBills;
	}
	public void setTotalBills(String totalBills) {
		this.totalBills = totalBills;
	}
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	public String getResponse() {
		return response;
	}
	public void setResponse(String response) {
		this.response = response;
	}
	public String getCounterId() {
		return counterId;
	}
	public void setCounterId(String counterId) {
		this.counterId = counterId;
	}
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	public String getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getStrDate() {
		return strDate;
	}
	public void setStrDate(String strDate) {
		this.strDate = strDate;
	}
	public List<SalesReport> getItemReportList() {
		return itemReportList;
	}
	public void setItemReportList(List<SalesReport> itemReportList) {
		this.itemReportList = itemReportList;
	}
	public int getNoOfCreditNotes() {
		return noOfCreditNotes;
	}
	public void setNoOfCreditNotes(int noOfCreditNotes) {
		this.noOfCreditNotes = noOfCreditNotes;
	}
	public float getTotalCreditNoteAmt() {
		return totalCreditNoteAmt;
	}
	public void setTotalCreditNoteAmt(float totalCreditNoteAmt) {
		this.totalCreditNoteAmt = totalCreditNoteAmt;
	}
	public float getCreditTotal() {
		return creditTotal;
	}
	public void setCreditTotal(float creditTotal) {
		this.creditTotal = creditTotal;
	}
	public float getCouponsTotal() {
		return couponsTotal;
	}
	public void setCouponsTotal(float couponsTotal) {
		this.couponsTotal = couponsTotal;
	}
	public float getVouchersTotal() {
		return vouchersTotal;
	}
	public void setVouchersTotal(float vouchersTotal) {
		this.vouchersTotal = vouchersTotal;
	}
	public float getCreditsAmt() {
		return creditsAmt;
	}
	public void setCreditsAmt(float creditsAmt) {
		this.creditsAmt = creditsAmt;
	}
	public String getSalesReportFilePath() {
		return salesReportFilePath;
	}
	public void setSalesReportFilePath(String salesReportFilePath) {
		this.salesReportFilePath = salesReportFilePath;
	}
	public Set<String> getTaxLablesList() {
		return taxLablesList;
	}
	public void setTaxLablesList(Set<String> taxLablesList) {
		this.taxLablesList = taxLablesList;
	}
	public Map<String,List<String>> getTaxWiseReport() {
		return taxWiseReport;
	}
	public void setTaxWiseReport(Map<String,List<String>> taxWiseReport) {
		this.taxWiseReport = taxWiseReport;
	}
	public Float getFinalReturnedAmt() {
		return finalReturnedAmt;
	}
	public void setFinalReturnedAmt(Float finalReturnedAmt) {
		this.finalReturnedAmt = finalReturnedAmt;
	}
	public Float getFinalExchangedAmt() {
		return finalExchangedAmt;
	}
	public void setFinalExchangedAmt(Float finalExchangedAmt) {
		this.finalExchangedAmt = finalExchangedAmt;
	}
	public float getExchangedAmt() {
		return exchangedAmt;
	}
	public void setExchangedAmt(float exchangedAmt) {
		this.exchangedAmt = exchangedAmt;
	}
	public float getReturnedAmt() {
		return returnedAmt;
	}
	public void setReturnedAmt(float returnedAmt) {
		this.returnedAmt = returnedAmt;
	}
	public float getTotalCreditBillsAmt() {
		return totalCreditBillsAmt;
	}
	public void setTotalCreditBillsAmt(float totalCreditBillsAmt) {
		this.totalCreditBillsAmt = totalCreditBillsAmt;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getHour() {
		return hour;
	}
	public void setHour(int hour) {
		this.hour = hour;
	}
	public String getDateStr() {
		return dateStr;
	}
	public void setDateStr(String dateStr) {
		this.dateStr = dateStr;
	}
	public BigDecimal getSodexoTotal() {
		return sodexoTotal;
	}
	public void setSodexoTotal(BigDecimal sodexoTotal) {
		this.sodexoTotal = sodexoTotal;
	}
	public BigDecimal getLoyalityTotal() {
		return loyalityTotal;
	}
	public void setLoyalityTotal(BigDecimal loyalityTotal) {
		this.loyalityTotal = loyalityTotal;
	}
	public BigDecimal getCreditNoteTotal() {
		return creditNoteTotal;
	}
	public void setCreditNoteTotal(BigDecimal creditNoteTotal) {
		this.creditNoteTotal = creditNoteTotal;
	}
	public BigDecimal getGiftVoucherTotal() {
		return giftVoucherTotal;
	}
	public void setGiftVoucherTotal(BigDecimal giftVoucherTotal) {
		this.giftVoucherTotal = giftVoucherTotal;
	}
	public BigDecimal getCreditsAmount() {
		return creditsAmount;
	}
	public void setCreditsAmount(BigDecimal creditsAmount) {
		this.creditsAmount = creditsAmount;
	}
	public BigDecimal getOverallCashTotal() {
		return overallCashTotal;
	}
	public void setOverallCashTotal(BigDecimal overallCashTotal) {
		this.overallCashTotal = overallCashTotal;
	}
	public BigDecimal getReturnAmount() {
		return returnAmount;
	}
	public void setReturnAmount(BigDecimal returnAmount) {
		this.returnAmount = returnAmount;
	}
	public BigDecimal getExchangeAmount() {
		return exchangeAmount;
	}
	public void setExchangeAmount(BigDecimal exchangeAmount) {
		this.exchangeAmount = exchangeAmount;
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
	public List<SalesReport> getHoursReportList() {
		return hoursReportList;
	}
	public void setHoursReportList(List<SalesReport> hoursReportList) {
		this.hoursReportList = hoursReportList;
	}
	public int getBillCount() {
		return billCount;
	}
	public void setBillCount(int billCount) {
		this.billCount = billCount;
	}
	public BigDecimal getTotCardAmt() {
		return totCardAmt;
	}
	public void setTotCardAmt(BigDecimal totCardAmt) {
		this.totCardAmt = totCardAmt;
	}
	public BigDecimal getTotCashAmt() {
		return totCashAmt;
	}
	public void setTotCashAmt(BigDecimal totCashAmt) {
		this.totCashAmt = totCashAmt;
	}
	public BigDecimal getTotGiftCoupAmt() {
		return totGiftCoupAmt;
	}
	public void setTotGiftCoupAmt(BigDecimal totGiftCoupAmt) {
		this.totGiftCoupAmt = totGiftCoupAmt;
	}
	public BigDecimal getTotLoyalAmt() {
		return totLoyalAmt;
	}
	public void setTotLoyalAmt(BigDecimal totLoyalAmt) {
		this.totLoyalAmt = totLoyalAmt;
	}
	public BigDecimal getTotSedexoAmt() {
		return totSedexoAmt;
	}
	public void setTotSedexoAmt(BigDecimal totSedexoAmt) {
		this.totSedexoAmt = totSedexoAmt;
	}
	public BigDecimal getTotTickAmt() {
		return totTickAmt;
	}
	public void setTotTickAmt(BigDecimal totTickAmt) {
		this.totTickAmt = totTickAmt;
	}
	public BigDecimal getTotCreditNoteAmt() {
		return totCreditNoteAmt;
	}
	public void setTotCreditNoteAmt(BigDecimal totCreditNoteAmt) {
		this.totCreditNoteAmt = totCreditNoteAmt;
	}
	public BigDecimal getTotGiftVocAmt() {
		return totGiftVocAmt;
	}
	public void setTotGiftVocAmt(BigDecimal totGiftVocAmt) {
		this.totGiftVocAmt = totGiftVocAmt;
	}
	public BigDecimal getTotCreditsAmt() {
		return totCreditsAmt;
	}
	public void setTotCreditsAmt(BigDecimal totCreditsAmt) {
		this.totCreditsAmt = totCreditsAmt;
	}
	public BigDecimal getTotReturnAmt() {
		return totReturnAmt;
	}
	public void setTotReturnAmt(BigDecimal totReturnAmt) {
		this.totReturnAmt = totReturnAmt;
	}
	public BigDecimal getTotExchAmt() {
		return totExchAmt;
	}
	public void setTotExchAmt(BigDecimal totExchAmt) {
		this.totExchAmt = totExchAmt;
	}
	public BigDecimal getTotOverallAmt() {
		return totOverallAmt;
	}
	public void setTotOverallAmt(BigDecimal totOverallAmt) {
		this.totOverallAmt = totOverallAmt;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
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
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getProductRange() {
		return productRange;
	}
	public void setProductRange(String productRange) {
		this.productRange = productRange;
	}
	public String getSubCategory() {
		return subCategory;
	}
	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public BigDecimal getCreditBillsAmt() {
		return creditBillsAmt;
	}
	public void setCreditBillsAmt(BigDecimal creditBillsAmt) {
		this.creditBillsAmt = creditBillsAmt;
	}
	public float getTotalSoldQty() {
		return totalSoldQty;
	}
	public void setTotalSoldQty(float totalSoldQty) {
		this.totalSoldQty = totalSoldQty;
	}
	public float getTotalSoldValue() {
		return totalSoldValue;
	}
	public void setTotalSoldValue(float totalSoldValue) {
		this.totalSoldValue = totalSoldValue;
	}
	public List<ItemWiseReport> getItemDetails() {
		return itemDetails;
	}
	public void setItemDetails(List<ItemWiseReport> itemDetails) {
		this.itemDetails = itemDetails;
	}
	public float getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(float unitPrice) {
		this.unitPrice = unitPrice;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public float getManualdiscount() {
		return manualdiscount;
	}
	public void setManualdiscount(float manualdiscount) {
		this.manualdiscount = manualdiscount;
	}
	public float getTax() {
		return tax;
	}
	public void setTax(float tax) {
		this.tax = tax;
	}
	public float getTaxAmt() {
		return taxAmt;
	}
	public void setTaxAmt(float taxAmt) {
		this.taxAmt = taxAmt;
	}
	public float getMrp() {
		return mrp;
	}
	public void setMrp(float mrp) {
		this.mrp = mrp;
	}
	public double getWeighedSaleQty() {
		return weighedSaleQty;
	}
	public void setWeighedSaleQty(double weighedSaleQty) {
		this.weighedSaleQty = weighedSaleQty;
	}
	public double getCatContr() {
		return catContr;
	}
	public void setCatContr(double catContr) {
		this.catContr = catContr;
	}
	public String getCashierName() {
		return cashierName;
	}
	public void setCashierName(String cashierName) {
		this.cashierName = cashierName;
	}
	public int getNoofBills() {
		return noofBills;
	}
	public void setNoofBills(int noofBills) {
		this.noofBills = noofBills;
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
	public String getCashierId() {
		return cashierId;
	}
	public void setCashierId(String cashierId) {
		this.cashierId = cashierId;
	}
	public String getItemDesc() {
		return itemDesc;
	}
	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}
	public float getTotalOtherAmt() {
		return totalOtherAmt;
	}
	public void setTotalOtherAmt(float totalOtherAmt) {
		this.totalOtherAmt = totalOtherAmt;
	}
	public String getLineNumber() {
		return lineNumber;
	}
	public void setLineNumber(String lineNumber) {
		this.lineNumber = lineNumber;
	}


	
}
