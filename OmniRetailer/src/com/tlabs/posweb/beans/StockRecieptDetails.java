package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.List;

public class StockRecieptDetails {
	
	private int S_No;
	private String reciept_id;
	/*private String item;*/
	private String description;
	private BigDecimal quantity;
	private BigDecimal max_quantity;
	public BigDecimal getMax_quantity() {
		return max_quantity;
	}
	public void setMax_quantity(BigDecimal max_quantity) {
		this.max_quantity = max_quantity;
	}
	private BigDecimal price;
	private BigDecimal mrp;
	private BigDecimal cost;
	private BigDecimal supplied;
	private BigDecimal recieved;
	private BigDecimal rejected;
	private String skuId;
	private String uom;
	private String make;
	private String pluCode;
	private String ean;
	private BigDecimal costPrice;
	private String productRange;
	private String measurementRange;
	private String category;
	private String brand;
	List<String> nextActivities;
	private BigDecimal actualQty;
	private String color;
	private String size;
	private BigDecimal acceptedQty = new BigDecimal("0");
	private BigDecimal weighedQty = new BigDecimal("0");
	private String subCategory;
	private String department;
	private String subDepartment;
	private String section;
	private String modal;
	private String utility;
	private String productBatchNo;
	private String itemScanCode;
	private String item;
	private BigDecimal returnQty;
	private BigDecimal reqQty;
	private BigDecimal rejQty;
	private BigDecimal receivedQty;
	private String  createdDateStr;
	
	public BigDecimal getMrp() {
		return mrp;
	}
	public void setMrp(BigDecimal mrp) {
		this.mrp = mrp;
	}
	public String getCreatedDateStr() {
		return createdDateStr;
	}
	public void setCreatedDateStr(String createdDateStr) {
		this.createdDateStr = createdDateStr;
	}
	public BigDecimal getReturnQty() {
		return returnQty;
	}
	public void setReturnQty(BigDecimal returnQty) {
		this.returnQty = returnQty;
	}
	public BigDecimal getReqQty() {
		return reqQty;
	}
	public void setReqQty(BigDecimal reqQty) {
		this.reqQty = reqQty;
	}
	public BigDecimal getRejQty() {
		return rejQty;
	}
	public void setRejQty(BigDecimal rejQty) {
		this.rejQty = rejQty;
	}
	public BigDecimal getReceivedQty() {
		return receivedQty;
	}
	public void setReceivedQty(BigDecimal receivedQty) {
		this.receivedQty = receivedQty;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	private Boolean trackingRequired;
	
	private boolean is_packed;
	
	public String getProductBatchNo() {
		return productBatchNo;
	}
	public void setProductBatchNo(String productBatchNo) {
		this.productBatchNo = productBatchNo;
	}
	public List<String> getNextActivities() {
		return nextActivities;
	}
	public void setNextActivities(List<String> nextActivities) {
		this.nextActivities = nextActivities;
	}
	public String getPluCode() {
		return pluCode;
	}
	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}
	public String getEan() {
		return ean;
	}
	public void setEan(String ean) {
		this.ean = ean;
	}
 
	public int getS_No() {
		return S_No;
	}
	public void setS_No(int s_No) {
		S_No = s_No;
	}
 
 
	public String getReciept_id() {
		return reciept_id;
	}
	public void setReciept_id(String reciept_id) {
		this.reciept_id = reciept_id;
	}

	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public BigDecimal getQuantity() {
		return quantity;
	}
	public void setQuantity(BigDecimal quantity) {
		this.quantity = quantity;
	}

	public BigDecimal getCostPrice() {
		return costPrice;
	}
	public void setCostPrice(BigDecimal costPrice) {
		this.costPrice = costPrice;
	}
	public String getUom() {
		return uom;
	}
	public void setUom(String uom) {
		this.uom = uom;
	}
	public String getProductRange() {
		return productRange;
	}
	public void setProductRange(String productRange) {
		this.productRange = productRange;
	}
	public String getMeasurementRange() {
		return measurementRange;
	}
	public void setMeasurementRange(String measurementRange) {
		this.measurementRange = measurementRange;
	}
	public String getCategory() {
		return category;
	}
	public String getSubCategory() {
		return subCategory;
	}
	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getSubDepartment() {
		return subDepartment;
	}
	public void setSubDepartment(String subDepartment) {
		this.subDepartment = subDepartment;
	}
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public String getModal() {
		return modal;
	}
	public void setModal(String modal) {
		this.modal = modal;
	}
	public void setCategory(String category) {
		this.category = category;
	}
 
	public BigDecimal getWeighedQty() {
		return weighedQty;
	}
	public void setWeighedQty(BigDecimal weighedQty) {
		this.weighedQty = weighedQty;
	}
	public BigDecimal getAcceptedQty() {
		return acceptedQty;
	}
	public void setAcceptedQty(BigDecimal acceptedQty) {
		this.acceptedQty = acceptedQty;
	}
	public String getBrand() {
		return brand;
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
	public BigDecimal getActualQty() {
		return actualQty;
	}
	public void setActualQty(BigDecimal actualQty) {
		this.actualQty = actualQty;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getMake() {
		return make;
	}
	public void setMake(String make) {
		this.make = make;
	}
	 
	public String getSkuId() {
		return skuId;
	}
	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}
	public BigDecimal getSupplied() {
		return supplied;
	}
	public void setSupplied(BigDecimal supplied) {
		this.supplied = supplied;
	}
	public BigDecimal getRecieved() {
		return recieved;
	}
	public void setRecieved(BigDecimal recieved) {
		this.recieved = recieved;
	}
	public BigDecimal getRejected() {
		return rejected;
	}
	public void setRejected(BigDecimal rejected) {
		this.rejected = rejected;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public BigDecimal getCost() {
		return cost;
	}
	 
	public void setCost(BigDecimal cost) {
		this.cost = cost;
	}
	public String getUtility() {
		return utility;
	}
	public void setUtility(String utility) {
		this.utility = utility;
	}
	public String getItemScanCode() {
		return itemScanCode;
	}
	public void setItemScanCode(String itemScanCode) {
		this.itemScanCode = itemScanCode;
	}
	public Boolean getTrackingRequired() {
		return trackingRequired;
	}
	public void setTrackingRequired(Boolean trackingRequired) {
		this.trackingRequired = trackingRequired;
	}
	public boolean isIs_packed() {
		return is_packed;
	}
	public void setIs_packed(boolean is_packed) {
		this.is_packed = is_packed;
	}
	
	
}
