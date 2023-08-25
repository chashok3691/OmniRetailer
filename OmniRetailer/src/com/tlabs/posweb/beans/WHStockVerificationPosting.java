package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.Date;



public class WHStockVerificationPosting {

	private int s_no;

	private String verification_code;
	
	
	private String verification_reference;

	private String masterVerificationCode;
	
	private String verifiedby;

	private Date verifiedOn;

	
	private String sku_id;

	
	private float sku_physical_stock;

	private String pluCode;

	
	private float skuCostPrice;

	
	private String productCategory;

	private String skuDescription;

	private String model;                       

	
	private String color;

	private String size;

	private String ean;
		
	private String productBatchNo;
	
	private String location;

	private Date updatedOn;

	private String status;
	
	private float bookedQty;
	
	private float dumpQty;
	
	private String verifiedOnStr;
	
	private String updateOnStr;
	
	private BigDecimal openQuantity;
	
	private BigDecimal soldQuantity;
	
	private BigDecimal stockInQuantity;
	
	private String totalRecords;
	
	private boolean verification;
	
	private RequestHeader requestHeader;
	
	private ResponseHeader responseHeader;
	
	
	
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

	public boolean isVerification() {
		return verification;
	}

	public void setVerification(boolean verification) {
		this.verification = verification;
	}

	public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

	public BigDecimal getOpenQuantity() {
		return openQuantity;
	}

	public void setOpenQuantity(BigDecimal openQuantity) {
		this.openQuantity = openQuantity;
	}

	public BigDecimal getSoldQuantity() {
		return soldQuantity;
	}

	public void setSoldQuantity(BigDecimal soldQuantity) {
		this.soldQuantity = soldQuantity;
	}

	public BigDecimal getStockInQuantity() {
		return stockInQuantity;
	}

	public void setStockInQuantity(BigDecimal stockInQuantity) {
		this.stockInQuantity = stockInQuantity;
	}

	public float getBookedQty() {
		return bookedQty;
	}

	public void setBookedQty(float bookedQty) {
		this.bookedQty = bookedQty;
	}

	public float getDumpQty() {
		return dumpQty;
	}

	public void setDumpQty(float dumpQty) {
		this.dumpQty = dumpQty;
	}

	public String getUpdateOnStr() {
		return updateOnStr;
	}

	public void setUpdateOnStr(String updateOnStr) {
		this.updateOnStr = updateOnStr;
	}

	public String getVerifiedOnStr() {
		return verifiedOnStr;
	}

	public void setVerifiedOnStr(String verifiedOnStr) {
		this.verifiedOnStr = verifiedOnStr;
	}

	public String getMasterVerificationCode() {
		return masterVerificationCode;
	}

	public void setMasterVerificationCode(String masterVerificationCode) {
		this.masterVerificationCode = masterVerificationCode;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getUpdatedOn() {
		return updatedOn;
	}

	public void setUpdatedOn(Date updatedOn) {
		this.updatedOn = updatedOn;
	}

	public Date getVerifiedOn() {
		return verifiedOn;
	}

	public void setVerifiedOn(Date verifiedOn) {
		this.verifiedOn = verifiedOn;
	}

	public String getVerifiedby() {
		return verifiedby;
	}

	public void setVerifiedby(String verifiedby) {
		this.verifiedby = verifiedby;
	}

	public int getS_no() {
		return s_no;
	}

	public void setS_no(int s_no) {
		this.s_no = s_no;
	}

	public String getVerification_code() {
		return verification_code;
	}

	public void setVerification_code(String verification_code) {
		this.verification_code = verification_code;
	}

	public String getSku_id() {
		return sku_id;
	}

	public void setSku_id(String sku_id) {
		this.sku_id = sku_id;
	}

	public Float getSku_physical_stock() {
		return sku_physical_stock;
	}

	public void setSku_physical_stock(Float sku_physical_stock) {
		this.sku_physical_stock = sku_physical_stock;
	}

	public String getPluCode() {
		return pluCode;
	}

	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}

	public Float getSkuCostPrice() {
		return skuCostPrice;
	}

	public void setSkuCostPrice(Float skuCostPrice) {
		this.skuCostPrice = skuCostPrice;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	public String getSkuDescription() {
		return skuDescription;
	}

	public void setSkuDescription(String skuDescription) {
		this.skuDescription = skuDescription;
	}

	
	

	public String getVerification_reference() {
		return verification_reference;
	}

	public void setVerification_reference(String verification_reference) {
		this.verification_reference = verification_reference;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getEan() {
		return ean;
	}

	public void setEan(String ean) {
		this.ean = ean;
	}

	

	public String getProductBatchNo() {
		return productBatchNo;
	}

	public void setProductBatchNo(String productBatchNo) {
		this.productBatchNo = productBatchNo;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
	
	
	
}
