package com.tlabs.posweb.beans;

public class StockDashboardBean {
	
	private String categoryName;
	private Float totalCategoryAmount;
	private Float totalStockAmount;
	private String monthName;
	private String dayName;
	private String dayNumber;
	private Float totalAmount;
	
	public Float getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(Float totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getDayNumber() {
		return dayNumber;
	}
	public void setDayNumber(String dayNumber) {
		this.dayNumber = dayNumber;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	public Float getTotalCategoryAmount() {
		return totalCategoryAmount;
	}
	public void setTotalCategoryAmount(Float totalCategoryAmount) {
		this.totalCategoryAmount = totalCategoryAmount;
	}
	public Float getTotalStockAmount() {
		return totalStockAmount;
	}
	public void setTotalStockAmount(Float totalStockAmount) {
		this.totalStockAmount = totalStockAmount;
	}
	public String getMonthName() {
		return monthName;
	}
	public void setMonthName(String monthName) {
		this.monthName = monthName;
	}
	public String getDayName() {
		return dayName;
	}
	public void setDayName(String dayName) {
		this.dayName = dayName;
	}

}
