package com.tlabs.posweb.beans;

public class GiftVouchers {
	
	private String voucherCode;
	private String voucherProgramCode;
	private Integer assignedStatus;
	private Integer voucherStatus;
	private String voucherId;
	
	public String getVoucherId() {
		return voucherId;
	}
	public void setVoucherId(String voucherId) {
		this.voucherId = voucherId;
	}
	public String getVoucherCode() {
		return voucherCode;
	}
	public void setVoucherCode(String voucherCode) {
		this.voucherCode = voucherCode;
	}
	public String getVoucherProgramCode() {
		return voucherProgramCode;
	}
	public void setVoucherProgramCode(String voucherProgramCode) {
		this.voucherProgramCode = voucherProgramCode;
	}
	public Integer getAssignedStatus() {
		return assignedStatus;
	}
	public void setAssignedStatus(Integer assignedStatus) {
		this.assignedStatus = assignedStatus;
	}
	public Integer getVoucherStatus() {
		return voucherStatus;
	}
	public void setVoucherStatus(Integer voucherStatus) {
		this.voucherStatus = voucherStatus;
	}
	
    
}