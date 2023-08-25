package com.tlabs.posweb.beans;

import java.util.List;

public class TurnOverDashBoardBean {
	
	
	private String totalAmount;
	private String dayName;
	//private Long totalCategoryAmount;
	private String dayNumber;
	private String monthName;
	private String category;
	
	private float totalCategoryAmount;
	
	private List<TurnOverDashBoardBean> turnOvers;
	
	
	
	public String getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getDayName() {
		return dayName;
	}
	public void setDayName(String dayName) {
		this.dayName = dayName;
	}
	/*public Long getTotalCategoryAmount() {
		return totalCategoryAmount;
	}
	public void setTotalCategoryAmount(Long totalCategoryAmount) {
		this.totalCategoryAmount = totalCategoryAmount;
	}*/
	
	public float getTotalCategoryAmount() {
		return totalCategoryAmount;
	}
	public void setTotalCategoryAmount(Long totalCategoryAmount) {
		this.totalCategoryAmount = (float)totalCategoryAmount;
	}
	
	public String getDayNumber() {
		return dayNumber;
	}
	public void setDayNumber(String dayNumber) {
		this.dayNumber = dayNumber;
	}
	public String getMonthName() {
		return monthName;
	}
	public void setMonthName(String monthName) {
		this.monthName = monthName;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public List<TurnOverDashBoardBean> getTurnOvers() {
		return turnOvers;
	}
	public void setTurnOvers(List<TurnOverDashBoardBean> turnOvers) {
		this.turnOvers = turnOvers;
	}

}
