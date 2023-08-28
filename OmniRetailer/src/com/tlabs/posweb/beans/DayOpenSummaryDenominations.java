package com.tlabs.posweb.beans;

import java.math.BigDecimal;


public class DayOpenSummaryDenominations {
	
	
	private int sno;
	
	//@Column(name="day_open_id")
	private String dayOpenId;
	
	
	//@Column(name="denomination_type")
	private String denomination_type;
	
	//@Column(name="denomination_value")
	private BigDecimal denomination_value;
	
	//@Column(name="denomination_count")
	private BigDecimal denomination_count;
	
	
	//@Column(name="total_value")
	private BigDecimal total_value;


	public int getSno() {
		return sno;
	}


	public void setSno(int sno) {
		this.sno = sno;
	}


	public String getDayOpenId() {
		return dayOpenId;
	}


	public void setDayOpenId(String dayOpenId) {
		this.dayOpenId = dayOpenId;
	}


	public String getDenomination_type() {
		return denomination_type;
	}


	public void setDenomination_type(String denomination_type) {
		this.denomination_type = denomination_type;
	}


	public BigDecimal getDenomination_value() {
		return denomination_value;
	}


	public void setDenomination_value(BigDecimal denomination_value) {
		this.denomination_value = denomination_value;
	}


	public BigDecimal getDenomination_count() {
		return denomination_count;
	}


	public void setDenomination_count(BigDecimal denomination_count) {
		this.denomination_count = denomination_count;
	}


	public BigDecimal getTotal_value() {
		return total_value;
	}


	public void setTotal_value(BigDecimal total_value) {
		this.total_value = total_value;
	}
	
	

}
