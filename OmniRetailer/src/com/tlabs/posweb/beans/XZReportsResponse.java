package com.tlabs.posweb.beans;

import java.util.List;

public class XZReportsResponse {

	private ResponseHeader responseHeader;
	private Float sales;
	private float totalCreditsAmt;
	private Float itemDiscount;
	private Float overalDiscount;
	private Float netSalesInclusiveTax;
	private Float netSalesExclusiveTax;
	private Float cess;
	private Float serviceCharge;
	private Float otherCharge;
	private float pendingBillsAmt;
    private int pendingBills;
	private Float tax;
	private Float taxExempted;
	private Float totalSalesCollection;
	private Float depositCollected;
	private Float depositRefunded;
	private Float depositesUtilized;
	private Float depositForefeited;
	private Float totalAmmountCollected;
	private Float itemWiseDiscount;
	private int salesReports=0;
	private int trainingReceipts=0;
	private int manualReceipts=0;
	private int depositeReceipts=0;
	private int noOfCreditBills;
	private float totalCreditBillsAmt;
	private float totalDayTurnOverAmt;

	private Float refundExchange;
	private Float cancellation;
	
	private int noOfItemsSold=0;
	private int noOfVoidItems=0;
	private int noOfNoSaleDone=0;
	private int noOfPriceOverrides=0;
	private int noOfLineDiscounts=0;
	private int noOfCustomers=0;
	private int noOfDepositCollected=0;
	private int noOfDepositRefunded=0;
	private int noOfDepositesUtilized=0;
	
	private Float cardTotal;
	private Float cashTotal;
	private Float foodCouponsTotal;
	private Float loyaltyPointsTotal;
	
	private int cardTransactions=0;
	private int cashtransactions=0;
	private int foodCouponsTransactions=0;
	private int loyaltyPointsTransactions=0;
	
	private int taxCode =0;
	private Float percentage;
	private Float amount;
	
	private List<ReportTaxes> taxesInfo;
	private List<ReportsDenomination> denominations;
	private List<ReportsVoidItems> voidItems;
	private List<ReportsHour> hourReports;
	private int noOfDiscountedItems;
	private float taxTotal;
	private float denominationsTotal;
	private float systemSales;
	private float totalInwords;
	private float totalOutwords;
	private float openBalance;
	//private
	private float totalCreditNoteAmt;
	private float giftVouchers;
	private float sodexoTotal;
	private float ticketTotal;
	private float coupons;
	private String reportFilePath;
	private float returnTotal ;
	private float exchangeTotal ;
	private float creditExchangeAmt;
	private int creditExchangeTrans;
	private float payTmAmt ;
	private int payTmTrans;
	private float walletAmount;
	private int walletTransactions;
	private float totalAdvancePayment;
	private float phonePayAmount;
	
	
	public float getPhonePayAmount() {
		return phonePayAmount;
	}
	public void setPhonePayAmount(float phonePayAmount) {
		this.phonePayAmount = phonePayAmount;
	}
	public float getWalletAmount() {
		return walletAmount;
	}
	public void setWalletAmount(float walletAmount) {
		this.walletAmount = walletAmount;
	}
	public int getWalletTransactions() {
		return walletTransactions;
	}
	public void setWalletTransactions(int walletTransactions) {
		this.walletTransactions = walletTransactions;
	}
	public Float getTotalAdvancePayment() {
		return totalAdvancePayment;
	}
	public void setTotalAdvancePayment(Float totalAdvancePayment) {
		this.totalAdvancePayment = totalAdvancePayment;
	}
	public Float getReturnTotal() {
		return returnTotal;
	}
	public void setReturnTotal(Float returnTotal) {
		this.returnTotal = returnTotal;
	}
	public Float getExchangeTotal() {
		return exchangeTotal;
	}
	public void setExchangeTotal(Float exchangeTotal) {
		this.exchangeTotal = exchangeTotal;
	}
	public float getCreditExchangeAmt() {
		return creditExchangeAmt;
	}
	public void setCreditExchangeAmt(float creditExchangeAmt) {
		this.creditExchangeAmt = creditExchangeAmt;
	}
	public int getCreditExchangeTrans() {
		return creditExchangeTrans;
	}
	public void setCreditExchangeTrans(int creditExchangeTrans) {
		this.creditExchangeTrans = creditExchangeTrans;
	}
	public float getPayTmAmt() {
		return payTmAmt;
	}
	public void setPayTmAmt(float payTmAmt) {
		this.payTmAmt = payTmAmt;
	}
	public int getPayTmTrans() {
		return payTmTrans;
	}
	public void setPayTmTrans(int payTmTrans) {
		this.payTmTrans = payTmTrans;
	}
	public int getCardTransactions() {
		return cardTransactions;
	}
	public Float getOpenBalance() {
		return openBalance;
	}
	public void setOpenBalance(Float openBalance) {
		this.openBalance = openBalance;
	}
	public Float getTotalInwords() {
		return totalInwords;
	}
	public void setTotalInwords(Float totalInwords) {
		this.totalInwords = totalInwords;
	}
	public Float getTotalOutwords() {
		return totalOutwords;
	}
	public void setTotalOutwords(Float totalOutwords) {
		this.totalOutwords = totalOutwords;
	}
	public Float getSystemSales() {
		return systemSales;
	}
	public void setSystemSales(Float systemSales) {
		this.systemSales = systemSales;
	}
	public Float getDenominationsTotal() {
		return denominationsTotal;
	}
	public void setDenominationsTotal(Float denominationsTotal) {
		this.denominationsTotal = denominationsTotal;
	}
	public Float getTaxTotal() {
		return taxTotal;
	}
	public void setTaxTotal(Float taxTotal) {
		this.taxTotal = taxTotal;
	}
	public List<ReportsHour> getHourReports() {
		return hourReports;
	}
	public void setHourReports(List<ReportsHour> hourReports) {
		this.hourReports = hourReports;
	}
	public List<ReportsVoidItems> getVoidItems() {
		return voidItems;
	}
	public void setVoidItems(List<ReportsVoidItems> voidItems) {
		this.voidItems = voidItems;
	}
	public List<ReportTaxes> getTaxesInfo() {
		return taxesInfo;
	}
	public void setTaxesInfo(List<ReportTaxes> taxesInfo) {
		this.taxesInfo = taxesInfo;
	}
	public List<ReportsDenomination> getDenominations() {
		return denominations;
	}
	public void setDenominations(List<ReportsDenomination> denominations) {
		this.denominations = denominations;
	}
	public List<ReportTaxes> taxesInfo() {
		return taxesInfo;
	}
	public void setTaxsInfo(List<ReportTaxes> taxesInfo) {
		this.taxesInfo = taxesInfo;
	}
	public Float getDepositForefeited() {
		return depositForefeited;
	}
	public void setDepositForefeited(Float depositForefeited) {
		this.depositForefeited = depositForefeited;
	}
	public int getTaxCode() {
		return taxCode;
	}
	public void setTaxCode(int taxCode) {
		this.taxCode = taxCode;
	}
	public Float getPercentage() {
		return percentage;
	}
	public void setPercentage(Float percentage) {
		this.percentage = percentage;
	}
	public Float getAmount() {
		return amount;
	}
	public void setAmount(Float amount) {
		this.amount = amount;
	}
	public void setCardTransactions(int cardTransactions) {
		this.cardTransactions = cardTransactions;
	}
	public int getCashtransactions() {
		return cashtransactions;
	}
	public void setCashtransactions(int cashtransactions) {
		this.cashtransactions = cashtransactions;
	}
	public int getFoodCouponsTransactions() {
		return foodCouponsTransactions;
	}
	public void setFoodCouponsTransactions(int foodCouponsTransactions) {
		this.foodCouponsTransactions = foodCouponsTransactions;
	}
	public int getLoyaltyPointsTransactions() {
		return loyaltyPointsTransactions;
	}
	public void setLoyaltyPointsTransactions(int loyaltyPointsTransactions) {
		this.loyaltyPointsTransactions = loyaltyPointsTransactions;
	}
	public Float getCardTotal() {
		return cardTotal;
	}
	public void setCardTotal(Float cardTotal) {
		this.cardTotal = cardTotal;
	}
	public Float getCashTotal() {
		return cashTotal;
	}
	public void setCashTotal(Float cashTotal) {
		this.cashTotal = cashTotal;
	}
	public Float getFoodCouponsTotal() {
		return foodCouponsTotal;
	}
	public void setFoodCouponsTotal(Float foodCouponsTotal) {
		this.foodCouponsTotal = foodCouponsTotal;
	}
	public Float getLoyaltyPointsTotal() {
		return loyaltyPointsTotal;
	}
	public void setLoyaltyPointsTotal(Float loyaltyPointsTotal) {
		this.loyaltyPointsTotal = loyaltyPointsTotal;
	}
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	public Float getSales() {
		return sales;
	}
	public void setSales(Float sales) {
		this.sales = sales;
	}
	public Float getItemDiscount() {
		return itemDiscount;
	}
	public void setItemDiscount(Float itemDiscount) {
		this.itemDiscount = itemDiscount;
	}
	public Float getOveralDiscount() {
		return overalDiscount;
	}
	public void setOveralDiscount(Float overalDiscount) {
		this.overalDiscount = overalDiscount;
	}
	public Float getNetSalesInclusiveTax() {
		return netSalesInclusiveTax;
	}
	public void setNetSalesInclusiveTax(Float netSalesInclusiveTax) {
		this.netSalesInclusiveTax = netSalesInclusiveTax;
	}
	public Float getNetSalesExclusiveTax() {
		return netSalesExclusiveTax;
	}
	public void setNetSalesExclusiveTax(Float netSalesExclusiveTax) {
		this.netSalesExclusiveTax = netSalesExclusiveTax;
	}
	public Float getCess() {
		return cess;
	}
	public void setCess(Float cess) {
		this.cess = cess;
	}
	public Float getServiceCharge() {
		return serviceCharge;
	}
	public void setServiceCharge(Float serviceCharge) {
		this.serviceCharge = serviceCharge;
	}
	public Float getOtherCharge() {
		return otherCharge;
	}
	public void setOtherCharge(Float otherCharge) {
		this.otherCharge = otherCharge;
	}
	public Float getTax() {
		return tax;
	}
	public void setTax(Float tax) {
		this.tax = tax;
	}
	public Float getTaxExempted() {
		return taxExempted;
	}
	public void setTaxExempted(Float taxExempted) {
		this.taxExempted = taxExempted;
	}
	public Float getTotalSalesCollection() {
		return totalSalesCollection;
	}
	public void setTotalSalesCollection(Float totalSalesCollection) {
		this.totalSalesCollection = totalSalesCollection;
	}
	public Float getDepositCollected() {
		return depositCollected;
	}
	public void setDepositCollected(Float depositCollected) {
		this.depositCollected = depositCollected;
	}
	public Float getDepositRefunded() {
		return depositRefunded;
	}
	public void setDepositRefunded(Float depositRefunded) {
		this.depositRefunded = depositRefunded;
	}
	public Float getDepositesUtilized() {
		return depositesUtilized;
	}
	public void setDepositesUtilized(Float depositesUtilized) {
		this.depositesUtilized = depositesUtilized;
	}
	public Float getTotalAmmountCollected() {
		return totalAmmountCollected;
	}
	public void setTotalAmmountCollected(Float totalAmmountCollected) {
		this.totalAmmountCollected = totalAmmountCollected;
	}
	public int getSalesReports() {
		return salesReports;
	}
	public void setSalesReports(int salesReports) {
		this.salesReports = salesReports;
	}
	public int getTrainingReceipts() {
		return trainingReceipts;
	}
	public void setTrainingReceipts(int trainingReceipts) {
		this.trainingReceipts = trainingReceipts;
	}
	public int getManualReceipts() {
		return manualReceipts;
	}
	public void setManualReceipts(int manualReceipts) {
		this.manualReceipts = manualReceipts;
	}
	public int getDepositeReceipts() {
		return depositeReceipts;
	}
	public void setDepositeReceipts(int depositeReceipts) {
		this.depositeReceipts = depositeReceipts;
	}
	public Float getRefundExchange() {
		return refundExchange;
	}
	public void setRefundExchange(Float refundExchange) {
		this.refundExchange = refundExchange;
	}
	public Float getCancellation() {
		return cancellation;
	}
	public void setCancellation(Float cancellation) {
		this.cancellation = cancellation;
	}
	public int getNoOfItemsSold() {
		return noOfItemsSold;
	}
	public void setNoOfItemsSold(int noOfItemsSold) {
		this.noOfItemsSold = noOfItemsSold;
	}
	public int getNoOfVoidItems() {
		return noOfVoidItems;
	}
	public void setNoOfVoidItems(int noOfVoidItems) {
		this.noOfVoidItems = noOfVoidItems;
	}
	public int getNoOfNoSaleDone() {
		return noOfNoSaleDone;
	}
	public void setNoOfNoSaleDone(int noOfNoSaleDone) {
		this.noOfNoSaleDone = noOfNoSaleDone;
	}
	public int getNoOfPriceOverrides() {
		return noOfPriceOverrides;
	}
	public void setNoOfPriceOverrides(int noOfPriceOverrides) {
		this.noOfPriceOverrides = noOfPriceOverrides;
	}
	public int getNoOfLineDiscounts() {
		return noOfLineDiscounts;
	}
	public void setNoOfLineDiscounts(int noOfLineDiscounts) {
		this.noOfLineDiscounts = noOfLineDiscounts;
	}
	public int getNoOfCustomers() {
		return noOfCustomers;
	}
	public void setNoOfCustomers(int noOfCustomers) {
		this.noOfCustomers = noOfCustomers;
	}
	public int getNoOfDepositCollected() {
		return noOfDepositCollected;
	}
	public void setNoOfDepositCollected(int noOfDepositCollected) {
		this.noOfDepositCollected = noOfDepositCollected;
	}
	public int getNoOfDepositRefunded() {
		return noOfDepositRefunded;
	}
	public void setNoOfDepositRefunded(int noOfDepositRefunded) {
		this.noOfDepositRefunded = noOfDepositRefunded;
	}
	public int getNoOfDepositesUtilized() {
		return noOfDepositesUtilized;
	}
	public void setNoOfDepositesUtilized(int noOfDepositesUtilized) {
		this.noOfDepositesUtilized = noOfDepositesUtilized;
	}
	public float getTotalCreditNoteAmt() {
		return totalCreditNoteAmt;
	}
	public void setTotalCreditNoteAmt(float totalCreditNoteAmt) {
		this.totalCreditNoteAmt = totalCreditNoteAmt;
	}
	public float getGiftVouchers() {
		return giftVouchers;
	}
	public void setGiftVouchers(float giftVouchers) {
		this.giftVouchers = giftVouchers;
	}
	public float getSodexoTotal() {
		return sodexoTotal;
	}
	public void setSodexoTotal(float sodexoTotal) {
		this.sodexoTotal = sodexoTotal;
	}
	public float getTicketTotal() {
		return ticketTotal;
	}
	public void setTicketTotal(float ticketTotal) {
		this.ticketTotal = ticketTotal;
	}
	public float getCoupons() {
		return coupons;
	}
	public void setCoupons(float coupons) {
		this.coupons = coupons;
	}
	public int getNoOfDiscountedItems() {
		return noOfDiscountedItems;
	}
	public void setNoOfDiscountedItems(int noOfDiscountedItems) {
		this.noOfDiscountedItems = noOfDiscountedItems;
	}
	public float getTotalCreditsAmt() {
		return totalCreditsAmt;
	}
	public void setTotalCreditsAmt(float totalCreditsAmt) {
		this.totalCreditsAmt = totalCreditsAmt;
	}
	public String getReportFilePath() {
		return reportFilePath;
	}
	public void setReportFilePath(String reportFilePath) {
		this.reportFilePath = reportFilePath;
	}
	public float getPendingBillsAmt() {
		return pendingBillsAmt;
	}
	public void setPendingBillsAmt(float pendingBillsAmt) {
		this.pendingBillsAmt = pendingBillsAmt;
	}
	public int getPendingBills() {
		return pendingBills;
	}
	public void setPendingBills(int pendingBills) {
		this.pendingBills = pendingBills;
	}
	public Float getItemWiseDiscount() {
		return itemWiseDiscount;
	}
	public void setItemWiseDiscount(Float itemWiseDiscount) {
		this.itemWiseDiscount = itemWiseDiscount;
	}
	public int getNoOfCreditBills() {
		return noOfCreditBills;
	}
	public void setNoOfCreditBills(int noOfCreditBills) {
		this.noOfCreditBills = noOfCreditBills;
	}
	public float getTotalCreditBillsAmt() {
		return totalCreditBillsAmt;
	}
	public void setTotalCreditBillsAmt(float totalCreditBillsAmt) {
		this.totalCreditBillsAmt = totalCreditBillsAmt;
	}
	public float getTotalDayTurnOverAmt() {
		return totalDayTurnOverAmt;
	}
	public void setTotalDayTurnOverAmt(float totalDayTurnOverAmt) {
		this.totalDayTurnOverAmt = totalDayTurnOverAmt;
	}

	
	
	
	
}
