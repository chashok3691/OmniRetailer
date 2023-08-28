package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.Date;

public class EventInventoryReturnDetails {
	
		private int sNo;
		
		private String eventReference;
		
		private String eventLocation;
		
		private String skuId;
		
		private String pluCode;
		
		private String uom;
		
		private String item_description;
		
         private String skuDescription;
         
         private Float tax_value;
  		private BigDecimal cgst;
  		private BigDecimal sgst;
  		private String taxCode;
  		private Float price;
  		
  		
  		
  		
  		
         
         
         
         
		
		
		
		public Float getTax_value() {
			return tax_value;
		}

		public void setTax_value(Float tax_value) {
			this.tax_value = tax_value;
		}

		public BigDecimal getCgst() {
			return cgst;
		}

		public void setCgst(BigDecimal cgst) {
			this.cgst = cgst;
		}

		public BigDecimal getSgst() {
			return sgst;
		}

		public void setSgst(BigDecimal sgst) {
			this.sgst = sgst;
		}

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

		public String getSkuDescription() {
			return skuDescription;
		}

		public void setSkuDescription(String skuDescription) {
			this.skuDescription = skuDescription;
		}

		public String getItem_description() {
			return item_description;
		}

		public void setItem_description(String item_description) {
			this.item_description = item_description;
		}

		private String size;
		
		private Double issueQuantity=0.0;
		
		private Double consQuantity=0.0;

		private Double wastageQuantity=0.0;
    
		private Double returnQuantity=0.0;
    
		private String userName;   
		    
		private String roleName;     
		 
		private Date createdDate=new Date(); 
	
		private Date updatedDate=new Date(); 
		
		private int submissionCount=1;
		
		private String createdDateStr;
		
		private String updatedDateStr;

		

		public int getSubmissionCount() {
			return submissionCount;
		}

		public void setSubmissionCount(int submissionCount) {
			this.submissionCount = submissionCount;
		}

		public int getsNo() {
			return sNo;
		}

		public void setsNo(int sNo) {
			this.sNo = sNo;
		}

		public String getEventReference() {
			return eventReference;
		}

		public void setEventReference(String eventReference) {
			this.eventReference = eventReference;
		}

		public String getEventLocation() {
			return eventLocation;
		}

		public void setEventLocation(String eventLocation) {
			this.eventLocation = eventLocation;
		}

		public String getSkuId() {
			return skuId;
		}

		public void setSkuId(String skuId) {
			this.skuId = skuId;
		}

		public String getPluCode() {
			return pluCode;
		}

		public void setPluCode(String pluCode) {
			this.pluCode = pluCode;
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

		public Double getIssueQuantity() {
			return issueQuantity;
		}

		public void setIssueQuantity(Double issueQuantity) {
			this.issueQuantity = issueQuantity;
		}

		public Double getConsQuantity() {
			return consQuantity;
		}

		public void setConsQuantity(Double consQuantity) {
			this.consQuantity = consQuantity;
		}

		public Double getWastageQuantity() {
			return wastageQuantity;
		}

		public void setWastageQuantity(Double wastageQuantity) {
			this.wastageQuantity = wastageQuantity;
		}

		public Double getReturnQuantity() {
			return returnQuantity;
		}

		public void setReturnQuantity(Double returnQuantity) {
			this.returnQuantity = returnQuantity;
		}

		public String getUserName() {
			return userName;
		}

		public void setUserName(String userName) {
			this.userName = userName;
		}

		public String getRoleName() {
			return roleName;
		}

		public void setRoleName(String roleName) {
			this.roleName = roleName;
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

		public String getCreatedDateStr() {
			return createdDateStr;
		}

		public void setCreatedDateStr(String createdDateStr) {
			this.createdDateStr = createdDateStr;
		}

		public String getUpdatedDateStr() {
			return updatedDateStr;
		}

		public void setUpdatedDateStr(String updatedDateStr) {
			this.updatedDateStr = updatedDateStr;
		}
		
		
		



}
