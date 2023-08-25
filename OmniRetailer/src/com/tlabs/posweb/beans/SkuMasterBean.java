package com.tlabs.posweb.beans;

import java.io.Serializable;

/**
 * @author Mythri.S
 * 
 */

public class SkuMasterBean implements Serializable,Cloneable {
	 /* creational pattern prototype is used for this object
 	 * should implement the clone method
 	 * */
 	public SkuMasterBean clone(){
 		SkuMasterBean sku=null;
 	   try {
 		  sku=(SkuMasterBean)super.clone();
 	    }
 	   catch(Exception e)
 	   {e.printStackTrace(); }
 	      return sku;
 	   }
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String skuID;
	private String description;
	private String productId;
	private String manufacturerCode;
	private String make;
	private String color;
	private Float price;
	private String weight;
	private String size;
	private Float quantity;
	private String dateTime;
	private String modelNumber;
	private String batchNumber;
	private String warrantyDetails;
	private Float reorderPoint;
	private String status;
	private String upc;
	private String ean;
	private String date_Time;
	private byte[] picture1;
	private byte[] picture2;
	private byte[] picture3;
	private String strPicture1;
	private String strPicture2;
	private String strPicture3;
	private RequestHeader requestHeader;
	private String totalRecords;
	private String startIndex;
	
	
	
	

	public String getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}
	public String getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}
	public String getMake() {
		return make;
	}
	public void setMake(String make) {
		this.make = make;
	}
	public Float getQuantity() {
		return quantity;
	}
	public void setQuantity(Float quantity) {
		this.quantity = quantity;
	}
	public String getModelNumber() {
		return modelNumber;
	}
	public void setModelNumber(String modelNumber) {
		this.modelNumber = modelNumber;
	}
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	public String getSkuID() {
		return skuID;
	}
	public void setSkuID(String skuID) {
		this.skuID = skuID;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	
	public String getManufacturerCode() {
		return manufacturerCode;
	}
	public void setManufacturerCode(String manufacturerCode) {
		this.manufacturerCode = manufacturerCode;
	}
	
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}

	public String getDateTime() {
		return dateTime;
	}
	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
	
	public String getBatchNumber() {
		return batchNumber;
	}
	public void setBatchNumber(String batchNumber) {
		this.batchNumber = batchNumber;
	}
	public String getWarrantyDetails() {
		return warrantyDetails;
	}
	public void setWarrantyDetails(String warrantyDetails) {
		this.warrantyDetails = warrantyDetails;
	}
	public Float getReorderPoint() {
		return reorderPoint;
	}
	public void setReorderPoint(Float reorderPoint) {
		this.reorderPoint = reorderPoint;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getUpc() {
		return upc;
	}
	public void setUpc(String upc) {
		this.upc = upc;
	}
	public String getEan() {
		return ean;
	}
	public void setEan(String ean) {
		this.ean = ean;
	}
	public String getDate_Time() {
		return date_Time;
	}
	public void setDate_Time(String date_Time) {
		this.date_Time = date_Time;
	}
	public byte[] getPicture1() {
		return picture1;
	}
	public void setPicture1(byte[] picture1) {
		this.picture1 = picture1;
	}
	public byte[] getPicture2() {
		return picture2;
	}
	public void setPicture2(byte[] picture2) {
		this.picture2 = picture2;
	}
	public byte[] getPicture3() {
		return picture3;
	}
	public void setPicture3(byte[] picture3) {
		this.picture3 = picture3;
	}
	public String getStrPicture1() {
		return strPicture1;
	}
	public void setStrPicture1(String strPicture1) {
		this.strPicture1 = strPicture1;
	}
	public String getStrPicture2() {
		return strPicture2;
	}
	public void setStrPicture2(String strPicture2) {
		this.strPicture2 = strPicture2;
	}
	public String getStrPicture3() {
		return strPicture3;
	}
	public void setStrPicture3(String strPicture3) {
		this.strPicture3 = strPicture3;
	}
	
	
	
	/*private float quantity;
	private String modelNumber;
	private String type;
	private String make;
	private String category;
	private String subCategory;
	private Boolean skuItemStatus;
	
	private Product product;
	private String offerID;
	private DiscountAndOffer discountAndOffer;
	private VoucherAndCoupon voucherAndCoupon;
	private DealDiscount DealDiscount;
	
	private StoreInventory storeInventory;
	private OrderedItems orderedItems;*/
	
	
	
}
