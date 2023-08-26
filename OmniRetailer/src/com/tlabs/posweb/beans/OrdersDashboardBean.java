package com.tlabs.posweb.beans;

public class OrdersDashboardBean {

	private Integer onlineCount;
    
    private Integer phoneCount;
    
    private Integer salesExecutiveCount;
    
    private Integer directCount;
    
    private Integer totalOrders;
    
    private String category;
    private long completedbills;
    private long cancelledbills;
    private long returnedbills;
    private long exchangedbills;
    private long creditbills;
    private long voidBills;
    
	public long getVoidBills() {
		return voidBills;
	}

	public void setVoidBills(long voidBills) {
		this.voidBills = voidBills;
	}

	public Integer getOnlineCount() {
		return onlineCount;
	}

	public void setOnlineCount(Integer onlineCount) {
		this.onlineCount = onlineCount;
	}

	public Integer getPhoneCount() {
		return phoneCount;
	}

	public void setPhoneCount(Integer phoneCount) {
		this.phoneCount = phoneCount;
	}

	public Integer getSalesExecutiveCount() {
		return salesExecutiveCount;
	}

	public void setSalesExecutiveCount(Integer salesExecutiveCount) {
		this.salesExecutiveCount = salesExecutiveCount;
	}

	public Integer getDirectCount() {
		return directCount;
	}

	public void setDirectCount(Integer directCount) {
		this.directCount = directCount;
	}

	public Integer getTotalOrders() {
		return totalOrders;
	}

	public void setTotalOrders(Integer totalOrders) {
		this.totalOrders = totalOrders;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public long getCompletedbills() {
		return completedbills;
	}

	public void setCompletedbills(long completedbills) {
		this.completedbills = completedbills;
	}

	public long getCancelledbills() {
		return cancelledbills;
	}

	public void setCancelledbills(long cancelledbills) {
		this.cancelledbills = cancelledbills;
	}

	public long getReturnedbills() {
		return returnedbills;
	}

	public void setReturnedbills(long returnedbills) {
		this.returnedbills = returnedbills;
	}

	public long getExchangedbills() {
		return exchangedbills;
	}

	public void setExchangedbills(long exchangedbills) {
		this.exchangedbills = exchangedbills;
	}

	public long getCreditbills() {
		return creditbills;
	}

	public void setCreditbills(long creditbills) {
		this.creditbills = creditbills;
	}
    
}
