package com.tlabs.posweb.beans;

import java.util.List;

/**
 * @author mythri
 *
 */
public class BillSummaryReport {
	
	private String store_location;
	private String startDate;
	private String endDate;
	private String billStatus;
	private ResponseHeader responseHeader;
	private RequestHeader requestHeader;
	private String giftVouchers;
	private String totalAmmountCollected;
	private String returnTotal;
	private String coupons;
	private String sales;
	private String itemDiscount;
	private String netSalesInclusiveTax;
	private String tax;
	private String exchangeTotal;
	private String cancelledReceipts;
	private String overalDiscount;
	private String netSalesExclusiveTax;
	private String totalSalesCollection;
	private String refundExchange;
	private String noOfItemsSold;
	private String cardTotal;
	private String cashTotal;
	private String foodCouponsTotal;
	private String loyaltyPointsTotal;
	private String cardTransactions;
	private String cashtransactions;
	private String foodCouponsTransactions;
	private String loyaltyPointsTransactions;
	private String noOfVoidItems;
//	private String voidItems;
//	private String hourReports;
	private String voidItemsTotal;
	private String refundTotal;
	private String openBalance;
	private String discountTotal;
	private String sodexoTransactions;
	private String ticketTransactions;
	private String sodexoTotal;
	private String ticketTotal;
	
	private String noOfExchanges;
	private String noOfReturns;
	
	private String totalGiftVouchers;
	private String totalCoupons;
	private String salesReports;
	
	
	// keshav
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
	
	private List<String> billedLocations;
	
	public List<String> getBilledLocations() {
		return billedLocations;
	}
	public void setBilledLocations(List<String> billedLocations) {
		this.billedLocations = billedLocations;
	}
	public float getTotalDueAmt() {
		return totalDueAmt;
	}
	public void setTotalDueAmt(float totalDueAmt) {
		this.totalDueAmt = totalDueAmt;
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
	public String getStore_location() {
		return store_location;
	}
	public void setStore_location(String store_location) {
		this.store_location = store_location;
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
	public String getBillStatus() {
		return billStatus;
	}
	public void setBillStatus(String billStatus) {
		this.billStatus = billStatus;
	}
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	public String getGiftVouchers() {
		return giftVouchers;
	}
	public void setGiftVouchers(String giftVouchers) {
		this.giftVouchers = giftVouchers;
	}
	public String getTotalAmmountCollected() {
		return totalAmmountCollected;
	}
	public void setTotalAmmountCollected(String totalAmmountCollected) {
		this.totalAmmountCollected = totalAmmountCollected;
	}
	public String getReturnTotal() {
		return returnTotal;
	}
	public void setReturnTotal(String returnTotal) {
		this.returnTotal = returnTotal;
	}
	public String getCoupons() {
		return coupons;
	}
	public void setCoupons(String coupons) {
		this.coupons = coupons;
	}
	public String getSales() {
		return sales;
	}
	public void setSales(String sales) {
		this.sales = sales;
	}
	public String getItemDiscount() {
		return itemDiscount;
	}
	public void setItemDiscount(String itemDiscount) {
		this.itemDiscount = itemDiscount;
	}
	public String getNetSalesInclusiveTax() {
		return netSalesInclusiveTax;
	}
	public void setNetSalesInclusiveTax(String netSalesInclusiveTax) {
		this.netSalesInclusiveTax = netSalesInclusiveTax;
	}
	public String getTax() {
		return tax;
	}
	public void setTax(String tax) {
		this.tax = tax;
	}
	public String getExchangeTotal() {
		return exchangeTotal;
	}
	public void setExchangeTotal(String exchangeTotal) {
		this.exchangeTotal = exchangeTotal;
	}
	public String getCancelledReceipts() {
		return cancelledReceipts;
	}
	public void setCancelledReceipts(String cancelledReceipts) {
		this.cancelledReceipts = cancelledReceipts;
	}
	public String getOveralDiscount() {
		return overalDiscount;
	}
	public void setOveralDiscount(String overalDiscount) {
		this.overalDiscount = overalDiscount;
	}
	public String getNetSalesExclusiveTax() {
		return netSalesExclusiveTax;
	}
	public void setNetSalesExclusiveTax(String netSalesExclusiveTax) {
		this.netSalesExclusiveTax = netSalesExclusiveTax;
	}
	public String getTotalSalesCollection() {
		return totalSalesCollection;
	}
	public void setTotalSalesCollection(String totalSalesCollection) {
		this.totalSalesCollection = totalSalesCollection;
	}
	public String getRefundExchange() {
		return refundExchange;
	}
	public void setRefundExchange(String refundExchange) {
		this.refundExchange = refundExchange;
	}
	public String getNoOfItemsSold() {
		return noOfItemsSold;
	}
	public void setNoOfItemsSold(String noOfItemsSold) {
		this.noOfItemsSold = noOfItemsSold;
	}
	public String getCardTotal() {
		return cardTotal;
	}
	public void setCardTotal(String cardTotal) {
		this.cardTotal = cardTotal;
	}
	public String getCashTotal() {
		return cashTotal;
	}
	public void setCashTotal(String cashTotal) {
		this.cashTotal = cashTotal;
	}
	public String getFoodCouponsTotal() {
		return foodCouponsTotal;
	}
	public void setFoodCouponsTotal(String foodCouponsTotal) {
		this.foodCouponsTotal = foodCouponsTotal;
	}
	public String getLoyaltyPointsTotal() {
		return loyaltyPointsTotal;
	}
	public void setLoyaltyPointsTotal(String loyaltyPointsTotal) {
		this.loyaltyPointsTotal = loyaltyPointsTotal;
	}
	public String getCardTransactions() {
		return cardTransactions;
	}
	public void setCardTransactions(String cardTransactions) {
		this.cardTransactions = cardTransactions;
	}
	public String getCashtransactions() {
		return cashtransactions;
	}
	public void setCashtransactions(String cashtransactions) {
		this.cashtransactions = cashtransactions;
	}
	public String getFoodCouponsTransactions() {
		return foodCouponsTransactions;
	}
	public void setFoodCouponsTransactions(String foodCouponsTransactions) {
		this.foodCouponsTransactions = foodCouponsTransactions;
	}
	public String getLoyaltyPointsTransactions() {
		return loyaltyPointsTransactions;
	}
	public void setLoyaltyPointsTransactions(String loyaltyPointsTransactions) {
		this.loyaltyPointsTransactions = loyaltyPointsTransactions;
	}
	public String getNoOfVoidItems() {
		return noOfVoidItems;
	}
	public void setNoOfVoidItems(String noOfVoidItems) {
		this.noOfVoidItems = noOfVoidItems;
	}
	/*public String getVoidItems() {
		return voidItems;
	}
	public void setVoidItems(String voidItems) {
		this.voidItems = voidItems;
	}
	public String getHourReports() {
		return hourReports;
	}
	public void setHourReports(String hourReports) {
		this.hourReports = hourReports;
	}*/
	public String getVoidItemsTotal() {
		return voidItemsTotal;
	}
	public void setVoidItemsTotal(String voidItemsTotal) {
		this.voidItemsTotal = voidItemsTotal;
	}
	public String getRefundTotal() {
		return refundTotal;
	}
	public void setRefundTotal(String refundTotal) {
		this.refundTotal = refundTotal;
	}
	public String getOpenBalance() {
		return openBalance;
	}
	public void setOpenBalance(String openBalance) {
		this.openBalance = openBalance;
	}
	public String getDiscountTotal() {
		return discountTotal;
	}
	public void setDiscountTotal(String discountTotal) {
		this.discountTotal = discountTotal;
	}
	public String getSodexoTransactions() {
		return sodexoTransactions;
	}
	public void setSodexoTransactions(String sodexoTransactions) {
		this.sodexoTransactions = sodexoTransactions;
	}
	public String getTicketTransactions() {
		return ticketTransactions;
	}
	public void setTicketTransactions(String ticketTransactions) {
		this.ticketTransactions = ticketTransactions;
	}
	public String getSodexoTotal() {
		return sodexoTotal;
	}
	public void setSodexoTotal(String sodexoTotal) {
		this.sodexoTotal = sodexoTotal;
	}
	public String getTicketTotal() {
		return ticketTotal;
	}
	public void setTicketTotal(String ticketTotal) {
		this.ticketTotal = ticketTotal;
	}
	public String getNoOfExchanges() {
		return noOfExchanges;
	}
	public void setNoOfExchanges(String noOfExchanges) {
		this.noOfExchanges = noOfExchanges;
	}
	public String getNoOfReturns() {
		return noOfReturns;
	}
	public void setNoOfReturns(String noOfReturns) {
		this.noOfReturns = noOfReturns;
	}
	public String getTotalGiftVouchers() {
		return totalGiftVouchers;
	}
	public void setTotalGiftVouchers(String totalGiftVouchers) {
		this.totalGiftVouchers = totalGiftVouchers;
	}
	public String getTotalCoupons() {
		return totalCoupons;
	}
	public void setTotalCoupons(String totalCoupons) {
		this.totalCoupons = totalCoupons;
	}
	public String getSalesReports() {
		return salesReports;
	}
	public void setSalesReports(String salesReports) {
		this.salesReports = salesReports;
	}
	
}
