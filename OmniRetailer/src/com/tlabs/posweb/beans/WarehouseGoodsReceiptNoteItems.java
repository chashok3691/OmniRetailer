package com.tlabs.posweb.beans;


public class WarehouseGoodsReceiptNoteItems {

	
	private Integer sno;
	
	private String supplier_Id;

	private String receiptNoteRef;

	private String skuId;

	private String uom;

	private String itemDesc;

	private String itemName;
	
	private Float orderPrice;

	private Float orderQty;

	private String model;
 
	private String pluCode;

	private Float totalCost;

	private Float itemTax;

	private String productRange;

	private String measurementRange;

	private String category;

	private String brand;

	private String handledBy;
	
	private Float supplyPrice;

	private Float suppliedQty;
	
	
	private boolean  batchRequired;
	
	
	private float originalSupplierPrice;
	
	
	
	
	

	public float getOriginalSupplierPrice() {
		return originalSupplierPrice;
	}

	public void setOriginalSupplierPrice(float originalSupplierPrice) {
		this.originalSupplierPrice = originalSupplierPrice;
	}

	public boolean isBatchRequired() {
		return batchRequired;
	}

	public void setBatchRequired(boolean batchRequired) {
		this.batchRequired = batchRequired;
	}

	public Integer getSno() {
		return sno;
	}

	public void setSno(Integer sno) {
		this.sno = sno;
	}

	public String getReceiptNoteRef() {
		return receiptNoteRef;
	}

	public void setReceiptNoteRef(String receiptNoteRef) {
		this.receiptNoteRef = receiptNoteRef;
	}

	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}

 
	public String getUom() {
		return uom;
	}

	public void setUom(String uom) {
		this.uom = uom;
	}

	public String getItemDesc() {
		return itemDesc;
	}

	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public Float getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(Float orderPrice) {
		this.orderPrice = orderPrice;
	}

	public Float getOrderQty() {
		return orderQty;
	}

	public void setOrderQty(Float orderQty) {
		this.orderQty = orderQty;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getPluCode() {
		return pluCode;
	}

	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}

	public Float getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(Float totalCost) {
		this.totalCost = totalCost;
	}

	public Float getItemTax() {
		return itemTax;
	}

	public void setItemTax(Float itemTax) {
		this.itemTax = itemTax;
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

	public void setCategory(String category) {
		this.category = category;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getHandledBy() {
		return handledBy;
	}

	public void setHandledBy(String handledBy) {
		this.handledBy = handledBy;
	}

	public Float getSupplyPrice() {
		return supplyPrice;
	}

	public void setSupplyPrice(Float supplyPrice) {
		this.supplyPrice = supplyPrice;
	}

	public Float getSuppliedQty() {
		return suppliedQty;
	}

	public void setSuppliedQty(Float suppliedQty) {
		this.suppliedQty = suppliedQty;
	}

	public String getSupplier_Id() {
		return supplier_Id;
	}

	public void setSupplier_Id(String supplier_Id) {
		this.supplier_Id = supplier_Id;
	}
	
	
}
