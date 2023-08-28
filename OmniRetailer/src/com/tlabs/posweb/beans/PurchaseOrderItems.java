package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.List;

public class PurchaseOrderItems {

	private String poItemId;
	private String poRef;
	private String itemId;
	private String itemDesc;
	private float itemPrice;
	private String quantity;
	private String color;
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
	private String supplierId;
	private String supplierName;
	private String location;
	private float availableQty;
	private float mrp;
	private String productRange;
	private String measurementRange;
	private String category;
	private String brand;
	private String ean;
	private String utility;
	
	 private String itemScanCode;
	
	 private BigDecimal avlQty;
	 private float salePrice;
		private float mbq;
		private Double profitability;
		private Double mrpProfitability;
		private Double avgsaleQty;
		private Boolean is_cost_price_editable;
		
		private List<WHStorageSystemDetails> storageRefList;
		
		
		private String GSTIN;
		private String  taxdetailsStr;
		
		private String supplierstate;
		
		private List<SkuTax> taxList;
		
		
		private String bactchNum;
	    private String expiryDateStr;
	    
	    
		
		
		
		
		
		public String getBactchNum() {
			return bactchNum;
		}

		public void setBactchNum(String bactchNum) {
			this.bactchNum = bactchNum;
		}

		public String getExpiryDateStr() {
			return expiryDateStr;
		}

		public void setExpiryDateStr(String expiryDateStr) {
			this.expiryDateStr = expiryDateStr;
		}

		public List<SkuTax> getTaxList() {
			return taxList;
		}

		public void setTaxList(List<SkuTax> taxList) {
			this.taxList = taxList;
		}

		public String getSupplierstate() {
			return supplierstate;
		}

		public void setSupplierstate(String supplierstate) {
			this.supplierstate = supplierstate;
		}

		public String getTaxdetailsStr() {
			return taxdetailsStr;
		}

		public void setTaxdetailsStr(String taxdetailsStr) {
			this.taxdetailsStr = taxdetailsStr;
		}

		public String getGSTIN() {
			return GSTIN;
		}

		public void setGSTIN(String gSTIN) {
			GSTIN = gSTIN;
		}
		
		
	
	
	public List<WHStorageSystemDetails> getStorageRefList() {
			return storageRefList;
		}
		public void setStorageRefList(List<WHStorageSystemDetails> storageRefList) {
			this.storageRefList = storageRefList;
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
	public Double getMrpProfitability() {
			return mrpProfitability;
		}
		public void setMrpProfitability(Double mrpProfitability) {
			this.mrpProfitability = mrpProfitability;
		}
	public Double getProfitability() {
			return profitability;
		}
		public void setProfitability(Double profitability) {
			this.profitability = profitability;
		}
	public float getSalePrice() {
			return salePrice;
		}
		public void setSalePrice(float salePrice) {
			this.salePrice = salePrice;
		}
		public float getMbq() {
			return mbq;
		}
		public void setMbq(float mbq) {
			this.mbq = mbq;
		}
	public BigDecimal getAvlQty() {
		return avlQty;
	}
	public void setAvlQty(BigDecimal avlQty) {
		this.avlQty = avlQty;
	}
	public float getMrp() {
		return mrp;
	}
	public void setMrp(float mrp) {
		this.mrp = mrp;
	}
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
		
		//@Column(name = "cess_amt")
		private BigDecimal cessAmt;
		
		//@Column(name = "total_tax_amt")
		private BigDecimal totalTaxAmt;
		
		//@Column(name = "hsncode")
		private String hsnCode;

		
		
		
	
	
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
		
		private float tax=0.0f;
		
		private List<SkuTax> taxdetails;
		
		
		
	public List<SkuTax> getTaxdetails() {
			return taxdetails;
		}

		public void setTaxdetails(List<SkuTax> taxdetails) {
			this.taxdetails = taxdetails;
		}

	public float getTax() {
			return tax;
		}
		public void setTax(float tax) {
			this.tax = tax;
		}
	/*private BigDecimal tax = new BigDecimal("0");*/
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
	public float getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(float itemPrice) {
		this.itemPrice = itemPrice;
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
	public String getPoItemId() {
		return poItemId;
	}
	public String getPluCode() {
		return pluCode;
	}
	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
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

	/*public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}*/
	public String getSkuId() {
		return skuId;
	}
	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}
/*	public float getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(float itemPrice) {
		this.itemPrice = itemPrice;
	}
	public float getTotalCost() {
		return totalCost;
	}
	public void setTotalCost(float totalCost) {
		this.totalCost = totalCost;
	}
*/
	public Float getRequestedQty() {
		return requestedQty;
	}
	public void setRequestedQty(Float requestedQty) {
		this.requestedQty = requestedQty;
	}
	public String getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
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
	/*public BigDecimal getTax() {
		return tax;
	}
	public void setTax(BigDecimal tax) {
		this.tax = tax;
	}*/
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
