package com.tlabs.posweb.beans;

import java.util.List;

public class ReportsResponse {

	private ResponseHeader responseHeader;
	private Float sales;
	 private int noOfCreditSTrans;
     private float totalCreditsAmt;
	private Float itemDiscount;
	private Float overalDiscount;
	private Float netSalesInclusiveTax;
	private Float netSalesExclusiveTax;
	private Float cess;
	private Float serviceCharge;
	private Float otherCharge;
	private int noOfCreditNotes;
	private float totalCreditNoteAmt;
	private Float tax;
	private Float taxExempted;
	private Float totalSalesCollection;
	private Float depositCollected;
	private Float depositRefunded;
	private Float depositesUtilized;
	private Float depositForefeited;
	private Float totalAmmountCollected;
	private float itemWiseDiscount;
	private int noOfDiscountedItems;
	private int salesReports=0;
	private int trainingReceipts=0;
	private int manualReceipts=0;
	private int depositeReceipts=0;
	private int cancelledReceipts = 0;
	
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
	private Float totalInwords;
	private Float totalOutwords;
	private Float cardTotal;
	private Float cashTotal;
	private Float foodCouponsTotal;
	private Float loyaltyPointsTotal;
	private Float sodexoTotal;
	private Float ticketTotal;
	
	private int cardTransactions=0;
	private int cashtransactions=0;
	private int foodCouponsTransactions=0;
	private int loyaltyPointsTransactions=0;
	private int sodexoTransactions = 0;
	private int ticketTransactions = 0;
	
	private int taxCode =0;
	private Float percentage;
	private Float amount;
	
	private List<ReportTaxes> taxesInfo;
	private List<ReportsDenomination> denominations;
	//private List<ReportsVoidItems> voidItems;
	//private List<ReportsHour> hourReports;
	
	private Float taxTotal;
	private Float denominationsTotal;
	private Float systemSales;
	private Float totalInwards;
	private Float totalOutwards;
	private Float refundTotal;
	private Float voidItemsTotal;
	private Float openBalance;
	private Float discountTotal;
	
	/* for declare amount */
	private Float declareAmtCard = 0f;
	private Float declareAmtCash = 0f;
	private Float declareAmtSodex = 0f;
	private Float declareAmtTicket = 0f;
	private Float declareTotal;
	private Float declareSodexo = 0f;
	private Float declareTicket = 0f;
	
	private Float finalCard = 0f;
	private Float finalCash = 0f;
	private Float finalSodex = 0f;
	private Float finalTicket = 0f;
	
	private Float shortBy = 0f;
	private Float diffAmtTotal = 0f;
	
	private Float returnTotal = 0f;
	private Float exchangeTotal = 0f;
	private Float finalTotal = 0f;
	
	private int noOfExchanges;
	private int noOfReturns;
	
	private Float giftVouchers;
	private int totalGiftVouchers;
	private Float coupons;
	private int totalCoupons;
	// following fields added by kesav
	private int totalOnlineOrders;
	private float totalOnlineOrderAmt;
	private int totalPhoneOrders;
	private float totalPhoneOrderAmt;
	private int totalDirectOrders;
	private float totalDierctOrderAmt;
	private int totalSalesExecutiveOrders;
	private float totalSalesExecutiveOrderAmt;
	private int totalTelephonicOrders;
	private float totalTelephonicOrderAmt;
	private float totalDueAmt;
	private String reportFilePath;	 

	private List<CashHandOverDenominations> cashHandOverDenominations;
	
	
	
	public List<CashHandOverDenominations> getCashHandOverDenominations() {
		return cashHandOverDenominations;
	}
	public void setCashHandOverDenominations(List<CashHandOverDenominations> cashHandOverDenominations) {
		this.cashHandOverDenominations = cashHandOverDenominations;
	}
	public Float getCoupons() {
		return coupons;
	}
	public void setCoupons(Float coupons) {
		this.coupons = coupons;
	}
	public int getTotalCoupons() {
		return totalCoupons;
	}
	public void setTotalCoupons(int totalCoupons) {
		this.totalCoupons = totalCoupons;
	}
	public Float getGiftVouchers() {
		return giftVouchers;
	}
	public void setGiftVouchers(Float giftVouchers) {
		this.giftVouchers = giftVouchers;
	}
	public int getTotalGiftVouchers() {
		return totalGiftVouchers;
	}
	public void setTotalGiftVouchers(int totalGiftVouchers) {
		this.totalGiftVouchers = totalGiftVouchers;
	}
	public int getNoOfExchanges() {
		return noOfExchanges;
	}
	public void setNoOfExchanges(int noOfExchanges) {
		this.noOfExchanges = noOfExchanges;
	}
	public int getNoOfReturns() {
		return noOfReturns;
	}
	public void setNoOfReturns(int noOfReturns) {
		this.noOfReturns = noOfReturns;
	}
	public Float getFinalTotal() {
		return finalTotal;
	}
	public void setFinalTotal(Float finalTotal) {
		this.finalTotal = finalTotal;
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
	public int getCancelledReceipts() {
		return cancelledReceipts;
	}
	public void setCancelledReceipts(int cancelledReceipts) {
		this.cancelledReceipts = cancelledReceipts;
	}
	public Float getDeclareSodexo() {
		return declareSodexo;
	}
	public void setDeclareSodexo(Float declareSodexo) {
		this.declareSodexo = declareSodexo;
	}
	public Float getDeclareTicket() {
		return declareTicket;
	}
	public void setDeclareTicket(Float declareTicket) {
		this.declareTicket = declareTicket;
	}
	public Float getSodexoTotal() {
		return sodexoTotal;
	}
	public void setSodexoTotal(Float sodexoTotal) {
		this.sodexoTotal = sodexoTotal;
	}
	public Float getTicketTotal() {
		return ticketTotal;
	}
	public void setTicketTotal(Float ticketTotal) {
		this.ticketTotal = ticketTotal;
	}
	public int getTotalOnlineOrders() {
		return totalOnlineOrders;
	}
	public void setTotalOnlineOrders(int totalOnlineOrders) {
		this.totalOnlineOrders = totalOnlineOrders;
	}
	public float getTotalOnlineOrderAmt() {
		return totalOnlineOrderAmt;
	}
	public void setTotalOnlineOrderAmt(float totalOnlineOrderAmt) {
		this.totalOnlineOrderAmt = totalOnlineOrderAmt;
	}
	public int getTotalPhoneOrders() {
		return totalPhoneOrders;
	}
	public void setTotalPhoneOrders(int totalPhoneOrders) {
		this.totalPhoneOrders = totalPhoneOrders;
	}
	public float getTotalPhoneOrderAmt() {
		return totalPhoneOrderAmt;
	}
	public void setTotalPhoneOrderAmt(float totalPhoneOrderAmt) {
		this.totalPhoneOrderAmt = totalPhoneOrderAmt;
	}
	public int getTotalDirectOrders() {
		return totalDirectOrders;
	}
	public void setTotalDirectOrders(int totalDirectOrders) {
		this.totalDirectOrders = totalDirectOrders;
	}
	public float getTotalDierctOrderAmt() {
		return totalDierctOrderAmt;
	}
	public void setTotalDierctOrderAmt(float totalDierctOrderAmt) {
		this.totalDierctOrderAmt = totalDierctOrderAmt;
	}
	public int getTotalSalesExecutiveOrders() {
		return totalSalesExecutiveOrders;
	}
	public void setTotalSalesExecutiveOrders(int totalSalesExecutiveOrders) {
		this.totalSalesExecutiveOrders = totalSalesExecutiveOrders;
	}
	public float getTotalSalesExecutiveOrderAmt() {
		return totalSalesExecutiveOrderAmt;
	}
	public void setTotalSalesExecutiveOrderAmt(float totalSalesExecutiveOrderAmt) {
		this.totalSalesExecutiveOrderAmt = totalSalesExecutiveOrderAmt;
	}
	public int getTotalTelephonicOrders() {
		return totalTelephonicOrders;
	}
	public void setTotalTelephonicOrders(int totalTelephonicOrders) {
		this.totalTelephonicOrders = totalTelephonicOrders;
	}
	public float getTotalTelephonicOrderAmt() {
		return totalTelephonicOrderAmt;
	}
	public void setTotalTelephonicOrderAmt(float totalTelephonicOrderAmt) {
		this.totalTelephonicOrderAmt = totalTelephonicOrderAmt;
	}
	public float getTotalDueAmt() {
		return totalDueAmt;
	}
	public void setTotalDueAmt(float totalDueAmt) {
		this.totalDueAmt = totalDueAmt;
	}
	public int getSodexoTransactions() {
		return sodexoTransactions;
	}
	public void setSodexoTransactions(int sodexoTransactions) {
		this.sodexoTransactions = sodexoTransactions;
	}
	public int getTicketTransactions() {
		return ticketTransactions;
	}
	public void setTicketTransactions(int ticketTransactions) {
		this.ticketTransactions = ticketTransactions;
	}
	public Float getShortBy() {
		return shortBy;
	}
	public void setShortBy(Float shortBy) {
		this.shortBy = shortBy;
	}
	public Float getDiffAmtTotal() {
		return diffAmtTotal;
	}
	public void setDiffAmtTotal(Float diffAmtTotal) {
		this.diffAmtTotal = diffAmtTotal;
	}
	
	public Float getDeclareTotal() {
		return declareTotal;
	}
	public void setDeclareTotal(Float declareTotal) {
		this.declareTotal = declareTotal;
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
	public Float getFinalCard() {
		return finalCard;
	}
	public void setFinalCard(Float finalCard) {
		this.finalCard = finalCard;
	}
	public Float getFinalCash() {
		return finalCash;
	}
	public void setFinalCash(Float finalCash) {
		this.finalCash = finalCash;
	}
	public Float getFinalSodex() {
		return finalSodex;
	}
	public void setFinalSodex(Float finalSodex) {
		this.finalSodex = finalSodex;
	}
	public Float getFinalTicket() {
		return finalTicket;
	}
	public void setFinalTicket(Float finalTicket) {
		this.finalTicket = finalTicket;
	}
	public Float getDiscountTotal() {
		return discountTotal;
	}
	public void setDiscountTotal(Float discountTotal) {
		this.discountTotal = discountTotal;
	}
	public int getCardTransactions() {
		return cardTransactions;
	}
	public Float getTotalInwards() {
		return totalInwards;
	}
	public void setTotalInwards(Float totalInwards) {
		this.totalInwards = totalInwards;
	}
	public Float getTotalOutwards() {
		return totalOutwards;
	}
	public void setTotalOutwards(Float totalOutwards) {
		this.totalOutwards = totalOutwards;
	}
	public Float getOpenBalance() {
		return openBalance;
	}
	public void setOpenBalance(Float openBalance) {
		this.openBalance = openBalance;
	}
	public Float getRefundTotal() {
		return refundTotal;
	}
	public void setRefundTotal(Float refundTotal) {
		this.refundTotal = refundTotal;
	}
	public Float getVoidItemsTotal() {
		return voidItemsTotal;
	}
	public void setVoidItemsTotal(Float voidItemsTotal) {
		this.voidItemsTotal = voidItemsTotal;
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
	public float getTotalCreditNoteAmt() {
		return totalCreditNoteAmt;
	}
	public void setTotalCreditNoteAmt(float totalCreditNoteAmt) {
		this.totalCreditNoteAmt = totalCreditNoteAmt;
	}
	public int getNoOfCreditNotes() {
		return noOfCreditNotes;
	}
	public void setNoOfCreditNotes(int noOfCreditNotes) {
		this.noOfCreditNotes = noOfCreditNotes;
	}
	public float getItemWiseDiscount() {
		return itemWiseDiscount;
	}
	public void setItemWiseDiscount(float itemWiseDiscount) {
		this.itemWiseDiscount = itemWiseDiscount;
	}
	public int getNoOfDiscountedItems() {
		return noOfDiscountedItems;
	}
	public void setNoOfDiscountedItems(int noOfDiscountedItems) {
		this.noOfDiscountedItems = noOfDiscountedItems;
	}
	public int getNoOfCreditSTrans() {
		return noOfCreditSTrans;
	}
	public void setNoOfCreditSTrans(int noOfCreditSTrans) {
		this.noOfCreditSTrans = noOfCreditSTrans;
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
	
	
	
	
}
