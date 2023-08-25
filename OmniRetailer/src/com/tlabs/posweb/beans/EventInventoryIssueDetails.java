package com.tlabs.posweb.beans;

import java.util.Date;

public class EventInventoryIssueDetails {

	
	private String sNo;

	private String eventReference;

	private String itemCode;
	
	private Date createdDate;
	
	private Date updatedDate=new Date();
	

	private String item_description;

	private String uom;

	private String size;

	private Double quantity=0.0;

	private String location;

	private String user_name;

	private String role_name;
	
	private String createdDateStr;
	
	 private int submissionCount=1;
	 

		private String taxCode;
		private Float price;
		private Float tax_value;
		private Float cgst;
		private Float sgst;
		
		
		
	 
	 

		
		public String getTaxCode() {
			return taxCode;
		}

		public void setTaxCode(String taxCode) {
			this.taxCode = taxCode;
		}

		public Float getPrice() {
			return price;
		}

		public void setPrice(Float price) {
			this.price = price;
		}

		public Float getTax_value() {
			return tax_value;
		}

		public void setTax_value(Float tax_value) {
			this.tax_value = tax_value;
		}

		public Float getCgst() {
			return cgst;
		}

		public void setCgst(Float cgst) {
			this.cgst = cgst;
		}

		
		public Float getSgst() {
			return sgst;
		}

		public void setSgst(Float sgst) {
			this.sgst = sgst;
		}

		public int getSubmissionCount() {
			return submissionCount;
		}

		public void setSubmissionCount(int submissionCount) {
			this.submissionCount = submissionCount;
		}

	public String getCreatedDateStr() {
		return createdDateStr;
	}

	public void setCreatedDateStr(String createdDateStr) {
		this.createdDateStr = createdDateStr;
	}

	public String getsNo() {
		return sNo;
	}

	public void setsNo(String sNo) {
		this.sNo = sNo;
	}

	public String getEventReference() {
		return eventReference;
	}

	public void setEventReference(String eventReference) {
		this.eventReference = eventReference;
	}

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public String getItem_description() {
		return item_description;
	}

	public void setItem_description(String item_description) {
		this.item_description = item_description;
	}

	public String getUom() {
		return uom;
	}

	public void setUom(String uom) {
		this.uom = uom;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public Double getQuantity() {
		return quantity;
	}

	public void setQuantity(Double quantity) {
		this.quantity = quantity;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getRole_name() {
		return role_name;
	}

	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	
	 

}
