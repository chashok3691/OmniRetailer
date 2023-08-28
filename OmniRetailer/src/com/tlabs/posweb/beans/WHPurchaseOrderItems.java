package com.tlabs.posweb.beans;

import java.math.BigDecimal;

public class WHPurchaseOrderItems {

	private float availableQty;
	private String poItemId;
	private String ean;
	private String utility;
	private String poRef;
	   private BigDecimal tax;
	private String itemId;
	
	private String itemDesc;

	private double itemPrice;
	
	private String quantity;
	
	private String color;
	private String productRange;
	private String measurementRange;
	private String category;
	private String brand;

	private String make;
	
	private String model;
	
	private String size;
	
	private String totalCost;
	
	private String skuId;
	private String pluCode;
	private Float requestedQty;
	private String shipmentNoteRef;
	private String uom;
	private String remarks;

	 private BigDecimal avlQty;
	 private float mrp;
	 private float mbq;
	 private float saleprice;
	 private float profitability;
	 private Double mrpProfitability;
	 private Double avgsaleQty;
	 private Boolean is_cost_price_editable;
	 
	 private String  status;
	 
	 private String taxdetailsStr;
	 
	 
	 

	 
	 
	


	public String getTaxdetailsStr() {
		return taxdetailsStr;
	}


	public void setTaxdetailsStr(String taxdetailsStr) {
		this.taxdetailsStr = taxdetailsStr;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public Boolean getIs_cost_price_editable() {
		return is_cost_price_editable;
	}


	public void setIs_cost_price_editable(Boolean is_cost_price_editable) {
		this.is_cost_price_editable = is_cost_price_editable;
	}


	public Double getAvgsaleQty() {
		return avgsaleQty;
	}


	public void setAvgsaleQty(Double avgsaleQty) {
		this.avgsaleQty = avgsaleQty;
	}


	public float getProfitability() {
		return profitability;
	}


	public void setProfitability(float profitability) {
		this.profitability = profitability;
	}


	public Double getMrpProfitability() {
		return mrpProfitability;
	}


	public void setMrpProfitability(Double mrpProfitability) {
		this.mrpProfitability = mrpProfitability;
	}


	

	public float getMrp() {
		return mrp;
	}


	public void setMrp(float mrp) {
		this.mrp = mrp;
	}


	public float getMbq() {
		return mbq;
	}


	public void setMbq(float mbq) {
		this.mbq = mbq;
	}


	public float getSaleprice() {
		return saleprice;
	}


	public void setSaleprice(float saleprice) {
		this.saleprice = saleprice;
	}


	public BigDecimal getAvlQty() {
		return avlQty;
	}


	public void setAvlQty(BigDecimal avlQty) {
		this.avlQty = avlQty;
	}


	/*{"itemId":"5445","itemPrice":"45454","quantity":"5","item_name":"jsdkljas","size":"35","color":"jkf","model":"iasdf","make":"kjdshkjsdf","totalCost":"6544","itemDesc":"ksdfsakjdfh","poRef":"1000","poItemId":"13213"}*/
	 private String itemScanCode;
	public String getItemScanCode() {
		return itemScanCode;
	}


	public void setItemScanCode(String itemScanCode) {
		this.itemScanCode = itemScanCode;
	}


	private boolean trackingRequired;
	
	public boolean isTrackingRequired() {
		return trackingRequired;
	}


	public void setTrackingRequired(boolean trackingRequired) {
		this.trackingRequired = trackingRequired;
	}


	//@Column(name = "cgst_rate")
	private BigDecimal cgstRate;
	
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


	//@Column(name = "cgst_value")
	private BigDecimal cgstValue;
	
	
	//@Column(name = "sgst_rate")
	private BigDecimal sgstRate;
	
	//@Column(name = "sgst_value")
	private BigDecimal sgstValue;
	//@Column(name = "igst_rate")
	private BigDecimal igstRate;
	
	
	private BigDecimal igstValue;

	
	
	
	public BigDecimal getIgstValue() {
		return igstValue;
	}


	public void setIgstValue(BigDecimal igstValue) {
		this.igstValue = igstValue;
	}


	//@Column(name = "cess_rate")
	private BigDecimal cessRate;
	
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


	public BigDecimal getTotalTaxAmt() {
		return totalTaxAmt;
	}


	public void setTotalTaxAmt(BigDecimal totalTaxAmt) {
		this.totalTaxAmt = totalTaxAmt;
	}


	public String getHsnCode() {
		return hsnCode;
	}


	public void setHsnCode(String hsnCode) {
		this.hsnCode = hsnCode;
	}


	//@Column(name = "cess_amt")
	private BigDecimal cessAmt;
	
	//@Column(name = "total_tax_amt")
	private BigDecimal totalTaxAmt;
	
	//@Column(name = "hsncode")
	private String hsnCode;
	
	
	public String getPluCode() {
		return pluCode;
	}


	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}


	public String getPoItemId() {
		return poItemId;
	}


	public double getItemPrice() {
		return itemPrice;
	}


	public void setItemPrice(double itemPrice) {
		this.itemPrice = itemPrice;
	}


	public void setPoItemId(String poItemId) {
		this.poItemId = poItemId;
	}

	public String getPoRef() {
		return poRef;
	}

	public void setPoRef(String poRef) {
		this.poRef = poRef;
	}

	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	public String getItemDesc() {
		return itemDesc;
	}

	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}

	

	public String getSkuId() {
		return skuId;
	}


	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}


	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
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


	public String getQuantity() {
		return quantity;
	}


	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}


	public String getTotalCost() {
		return totalCost;
	}


	public void setTotalCost(String totalCost) {
		this.totalCost = totalCost;
	}


	public Float getRequestedQty() {
		return requestedQty;
	}


	public void setRequestedQty(Float requestedQty) {
		this.requestedQty = requestedQty;
	}


	public String getShipmentNoteRef() {
		return shipmentNoteRef;
	}


	public void setShipmentNoteRef(String shipmentNoteRef) {
		this.shipmentNoteRef = shipmentNoteRef;
	}


	public String getUom() {
		return uom;
	}


	public void setUom(String uom) {
		this.uom = uom;
	}


	public String getRemarks() {
		return remarks;
	}


	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}


	public float getAvailableQty() {
		return availableQty;
	}


	public void setAvailableQty(float availableQty) {
		this.availableQty = availableQty;
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


	public BigDecimal getTax() {
		return tax;
	}


	public void setTax(BigDecimal tax) {
		this.tax = tax;
	}


	public String getEan() {
		return ean;
	}


	public void setEan(String ean) {
		this.ean = ean;
	}


	public String getUtility() {
		return utility;
	}


	public void setUtility(String utility) {
		this.utility = utility;
	}

	
}
