package com.tlabs.posweb.beans;

import java.math.BigDecimal;

public class StoreShipmentReturnItems {

	private int serialNum;

	private String purchaseStockReturnRef;

	private String color;

	private String itemDesc;

	private String itemId;

	private float quantity;

	private String make;

	private String model;

	private String size;

	private float itemTotalValue;

	private String uom;

	private String pluCode;

	private String remarks;

	private String returnReason;

	private String comments;

	private float costPrice;

	private String productRange;
	private String measurementRange;
	private String category;
	private String subCategory;
	private String utility;
	private String ean;
	private String hsnCode;
	private Float taxValue;

	private float receivedQty;
	private String productBatchNo;
	
	private String itemScanCode;
	
	
	private Boolean trackingRequired;

	
	
	
	public Float getTaxValue() {
		return taxValue;
	}

	public void setTaxValue(Float taxValue) {
		this.taxValue = taxValue;
	}

	public String getHsnCode() {
		return hsnCode;
	}

	public void setHsnCode(String hsnCode) {
		this.hsnCode = hsnCode;
	}

	public String getProductBatchNo() {
		return productBatchNo;
	}

	public void setProductBatchNo(String productBatchNo) {
		this.productBatchNo = productBatchNo;
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

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	public String getUtility() {
		return utility;
	}

	public void setUtility(String utility) {
		this.utility = utility;
	}

	public String getEan() {
		return ean;
	}

	public void setEan(String ean) {
		this.ean = ean;
	}

	public int getSerialNum() {
		return serialNum;
	}

	public void setSerialNum(int serialNum) {
		this.serialNum = serialNum;
	}

	public String getPurchaseStockReturnRef() {
		return purchaseStockReturnRef;
	}

	public void setPurchaseStockReturnRef(String purchaseStockReturnRef) {
		this.purchaseStockReturnRef = purchaseStockReturnRef;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getItemDesc() {
		return itemDesc;
	}

	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}

	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	public float getQuantity() {
		return quantity;
	}

	public void setQuantity(float quantity) {
		this.quantity = quantity;
	}

	public String getMake() {
		return make;
	}

	public void setMake(String make) {
		this.make = make;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public float getItemTotalValue() {
		return itemTotalValue;
	}

	public void setItemTotalValue(float itemTotalValue) {
		this.itemTotalValue = itemTotalValue;
	}

	public String getUom() {
		return uom;
	}

	public void setUom(String uom) {
		this.uom = uom;
	}

	public String getPluCode() {
		return pluCode;
	}

	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getReturnReason() {
		return returnReason;
	}

	public void setReturnReason(String returnReason) {
		this.returnReason = returnReason;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public float getCostPrice() {
		return costPrice;
	}

	public void setCostPrice(float costPrice) {
		this.costPrice = costPrice;
	}

	public float getReceivedQty() {
		return receivedQty;
	}

	public void setReceivedQty(float receivedQty) {
		this.receivedQty = receivedQty;
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
	private BigDecimal cgstRate;
	private BigDecimal cgstValue;
	private BigDecimal sgstRate;
	private BigDecimal sgstValue;
	private BigDecimal igstRate;
	private BigDecimal igstValue;
	private BigDecimal cessRate;
	private BigDecimal cessAmt;
	private Integer pack_size;
	private BigDecimal flat_discount;
	private BigDecimal free_qty;
	private BigDecimal total_discount;
	private BigDecimal mrp;
	private boolean is_cost_price_editable;
	private BigDecimal itemDiscount;
			private Float orderPrice;
			private Float orderQty;
			private Float itemTax;
			private String brand;
			private Float supplyPrice=0.0f;
			private Float suppliedQty;
			private String bactchNum;
			private String taxdetailsStr;
			



			public String getTaxdetailsStr() {
				return taxdetailsStr;
			}

			public void setTaxdetailsStr(String taxdetailsStr) {
				this.taxdetailsStr = taxdetailsStr;
			}

			public BigDecimal getCgstRate() {
				return cgstRate;
			}

			public void setCgstRate(BigDecimal cgstRate) {
				this.cgstRate = cgstRate;
			}

			public BigDecimal getCgstValue() {
				return cgstValue;
			}

			public void setCgstValue(BigDecimal cgstValue) {
				this.cgstValue = cgstValue;
			}

			public BigDecimal getSgstRate() {
				return sgstRate;
			}

			public void setSgstRate(BigDecimal sgstRate) {
				this.sgstRate = sgstRate;
			}

			public BigDecimal getSgstValue() {
				return sgstValue;
			}

			public void setSgstValue(BigDecimal sgstValue) {
				this.sgstValue = sgstValue;
			}

			public BigDecimal getIgstRate() {
				return igstRate;
			}

			public void setIgstRate(BigDecimal igstRate) {
				this.igstRate = igstRate;
			}

			public BigDecimal getIgstValue() {
				return igstValue;
			}

			public void setIgstValue(BigDecimal igstValue) {
				this.igstValue = igstValue;
			}

			public BigDecimal getCessRate() {
				return cessRate;
			}

			public void setCessRate(BigDecimal cessRate) {
				this.cessRate = cessRate;
			}

			public BigDecimal getCessAmt() {
				return cessAmt;
			}

			public void setCessAmt(BigDecimal cessAmt) {
				this.cessAmt = cessAmt;
			}

			public Integer getPack_size() {
				return pack_size;
			}

			public void setPack_size(Integer pack_size) {
				this.pack_size = pack_size;
			}

			public BigDecimal getFlat_discount() {
				return flat_discount;
			}

			public void setFlat_discount(BigDecimal flat_discount) {
				this.flat_discount = flat_discount;
			}

			public BigDecimal getFree_qty() {
				return free_qty;
			}

			public void setFree_qty(BigDecimal free_qty) {
				this.free_qty = free_qty;
			}

			public BigDecimal getTotal_discount() {
				return total_discount;
			}

			public void setTotal_discount(BigDecimal total_discount) {
				this.total_discount = total_discount;
			}

			public BigDecimal getMrp() {
				return mrp;
			}

			public void setMrp(BigDecimal mrp) {
				this.mrp = mrp;
			}

			public boolean isIs_cost_price_editable() {
				return is_cost_price_editable;
			}

			public void setIs_cost_price_editable(boolean is_cost_price_editable) {
				this.is_cost_price_editable = is_cost_price_editable;
			}

			public BigDecimal getItemDiscount() {
				return itemDiscount;
			}

			public void setItemDiscount(BigDecimal itemDiscount) {
				this.itemDiscount = itemDiscount;
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

			public Float getItemTax() {
				return itemTax;
			}

			public void setItemTax(Float itemTax) {
				this.itemTax = itemTax;
			}

			public String getBrand() {
				return brand;
			}

			public void setBrand(String brand) {
				this.brand = brand;
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

			public String getBactchNum() {
				return bactchNum;
			}

			public void setBactchNum(String bactchNum) {
				this.bactchNum = bactchNum;
			}
			
			
			
			
			
			
			
			
	
}
