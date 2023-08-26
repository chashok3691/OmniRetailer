package com.tlabs.posweb.beans;

import java.util.List;


public class SkuPriceList {
	private int autoNum;
	private String skuId;
	private Float costPrice;
	private Float price;
	private Float mrp;
	private Float salePrice;
	private Float wholesalePrice;
	private Float extraPrice;
	private String pluCode;
	private String productBatchNo;
	private String styleRange;
	/*private Date createdDate;
	private Date updatedDate;
	private Date expiryDate;*/
	private String createdDate;
	private String updatedDate;
	private String expiryDate;
	private String size;
	private String color;
	private String colorShade;
	private String mbq;
	private Float quantityInHand;
	private String acp;
	private String description;
	private String ean;
	private String eanduplicate;
	private List<SkuTax> tax;
	private String taxCode;
	private String startIndex;
	private String totalRecords;
	private String created_date;
	private String updated_date;
	private String expiry_date;
	private String make;
	private String model;
	private String storeLocation;
	private String productRange;
	private String measureRange;
	private String storeLocationId;
	private String discountType;
	private Float discount;
	private String utility;
	private String packagingDate;
	private boolean skuStatus;
	private int packSize;
	private Float min_sale_qty;
	private String productClass;
	private String productSubClass;
	//Added newly
	private Float reqQuantity;
	private Float actuvalQuantity;
	
	private Float blockedQuantity;
	private Float scrapedQuantity;
	
	  private Float max_sale_qty;

	  private Double stockFactor;
	  private float profitability;
	  private float averageSaleQty;
	  private Double mrpProfitability;
	  private String offerType;
		private String offerValue;
		
		private  boolean zeroStockBilling;
		private  boolean mrpWiseStock;
		
		 private List<WHStorageSystemDetails> storageRefList;
		 
		 private String materialType;
		 
		 private List<String> multipleEAN;
		 
		 private String responnseMessage;
		 
		 private String expiryDateStr;
		 
		 // for Import Deals keys
		 private Float saleQty;
		 private String dealSkuId;
		 private String dealPluCode;
		 private Float dealQty;
		 
		 private boolean stockStatus;
		 private Float salePrice1;
		 
		 
		 
		 
	
	public Float getSalePrice1() {
			return salePrice1;
		}
		public void setSalePrice1(Float salePrice1) {
			this.salePrice1 = salePrice1;
		}
	public boolean isStockStatus() {
			return stockStatus;
		}
		public void setStockStatus(boolean stockStatus) {
			this.stockStatus = stockStatus;
		}
	public Float getSaleQty() {
			return saleQty;
		}
		public void setSaleQty(Float saleQty) {
			this.saleQty = saleQty;
		}
		public String getDealSkuId() {
			return dealSkuId;
		}
		public void setDealSkuId(String dealSkuId) {
			this.dealSkuId = dealSkuId;
		}
		public String getDealPluCode() {
			return dealPluCode;
		}
		public void setDealPluCode(String dealPluCode) {
			this.dealPluCode = dealPluCode;
		}
		public Float getDealQty() {
			return dealQty;
		}
		public void setDealQty(Float dealQty) {
			this.dealQty = dealQty;
		}
	public String getExpiryDateStr() {
			return expiryDateStr;
		}
		public void setExpiryDateStr(String expiryDateStr) {
			this.expiryDateStr = expiryDateStr;
		}
	public String getResponnseMessage() {
			return responnseMessage;
		}
		public void setResponnseMessage(String responnseMessage) {
			this.responnseMessage = responnseMessage;
		}
	public String getEanduplicate() {
			return eanduplicate;
		}
		public void setEanduplicate(String eanduplicate) {
			this.eanduplicate = eanduplicate;
		}
	public List<String> getMultipleEAN() {
			return multipleEAN;
		}
		public void setMultipleEAN(List<String> multipleEAN) {
			this.multipleEAN = multipleEAN;
		}
	public String getMaterialType() {
			return materialType;
		}
		public void setMaterialType(String materialType) {
			this.materialType = materialType;
		}
	public List<WHStorageSystemDetails> getStorageRefList() {
			return storageRefList;
		}
		public void setStorageRefList(List<WHStorageSystemDetails> storageRefList) {
			this.storageRefList = storageRefList;
		}
	public boolean isZeroStockBilling() {
			return zeroStockBilling;
		}
		public void setZeroStockBilling(boolean zeroStockBilling) {
			this.zeroStockBilling = zeroStockBilling;
		}
		public boolean isMrpWiseStock() {
			return mrpWiseStock;
		}
		public void setMrpWiseStock(boolean mrpWiseStock) {
			this.mrpWiseStock = mrpWiseStock;
		}
	public String getOfferType() {
			return offerType;
		}
		public void setOfferType(String offerType) {
			this.offerType = offerType;
		}
		public String getOfferValue() {
			return offerValue;
		}
		public void setOfferValue(String offerValue) {
			this.offerValue = offerValue;
		}
	public Double getMrpProfitability() {
		return mrpProfitability;
	}
	public void setMrpProfitability(Double mrpProfitability) {
		this.mrpProfitability = mrpProfitability;
	}
	public float getAverageSaleQty() {
		return averageSaleQty;
	}
	public void setAverageSaleQty(float averageSaleQty) {
		this.averageSaleQty = averageSaleQty;
	}
	public float getProfitability() {
		return profitability;
	}
	public void setProfitability(float profitability) {
		this.profitability = profitability;
	}
	public Float getMax_sale_qty() {
		return max_sale_qty;
	}
	public void setMax_sale_qty(Float max_sale_qty) {
		this.max_sale_qty = max_sale_qty;
	}
	public Double getStockFactor() {
		return stockFactor;
	}
	public void setStockFactor(Double stockFactor) {
		this.stockFactor = stockFactor;
	}
	public Float getMrp() {
		return mrp;
	}
	public void setMrp(Float mrp) {
		this.mrp = mrp;
	}
	public Float getBlockedQuantity() {
		return blockedQuantity;
	}
	public void setBlockedQuantity(Float blockedQuantity) {
		this.blockedQuantity = blockedQuantity;
	}
	public Float getScrapedQuantity() {
		return scrapedQuantity;
	}
	public void setScrapedQuantity(Float scrapedQuantity) {
		this.scrapedQuantity = scrapedQuantity;
	}
	public Float getReqQuantity() {
		return reqQuantity;
	}
	public void setReqQuantity(Float reqQuantity) {
		this.reqQuantity = reqQuantity;
	}
	public Float getActuvalQuantity() {
		return actuvalQuantity;
	}
	public void setActuvalQuantity(Float actuvalQuantity) {
		this.actuvalQuantity = actuvalQuantity;
	}
	public String getProductClass() {
		return productClass;
	}
	public void setProductClass(String productClass) {
		this.productClass = productClass;
	}
	public String getProductSubClass() {
		return productSubClass;
	}
	public void setProductSubClass(String productSubClass) {
		this.productSubClass = productSubClass;
	}
	private int pack_size;
	
	public int getPack_size() {
		return pack_size;
	}
	public void setPack_size(int pack_size) {
		this.pack_size = pack_size;
	}
	public int getPackSize() {
		return packSize;
	}
	public Float getMin_sale_qty() {
		return min_sale_qty;
	}
	public void setMin_sale_qty(Float min_sale_qty) {
		this.min_sale_qty = min_sale_qty;
	}
	public void setPackSize(int packSize) {
		this.packSize = packSize;
	}
	private double newCostPrice;
	
	private String businessCategory;
	private String businessSubCategory;
	private String technical_specification;
	
public String getTechnical_specification() {
		return technical_specification;
	}
	public void setTechnical_specification(String technical_specification) {
		this.technical_specification = technical_specification;
	}
private String status;

	public String getBusinessCategory() {
	return businessCategory;
}
public void setBusinessCategory(String businessCategory) {
	this.businessCategory = businessCategory;
}
public String getBusinessSubCategory() {
	return businessSubCategory;
}
public void setBusinessSubCategory(String businessSubCategory) {
	this.businessSubCategory = businessSubCategory;
}
	public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
	public double getNewCostPrice() {
		return newCostPrice;
	}
	public void setNewCostPrice(double newCostPrice) {
		this.newCostPrice = newCostPrice;
	}
	private Float taxRate;
	private String category;
	private String subCategory;
	private String brand;
	private Float quantity;
	private String uom;
	private Float newSalePrice=0.0f;
	private Float newMRPPrice;

	public Float getNewMRPPrice() {
		return newMRPPrice;
	}
	public void setNewMRPPrice(Float newMRPPrice) {
		this.newMRPPrice = newMRPPrice;
	}
	public Float getNewSalePrice() {
		return newSalePrice;
	}
	public void setNewSalePrice(Float newSalePrice) {
		this.newSalePrice = newSalePrice;
	}
	private Float cgstRate;
	private Float sgstRate;
	private Float igstRate;
	
	private String hsnCode;
	
	
	
	public Float getCgstRate() {
		return cgstRate;
	}
	public void setCgstRate(Float cgstRate) {
		this.cgstRate = cgstRate;
	}
	public Float getSgstRate() {
		return sgstRate;
	}
	public void setSgstRate(Float sgstRate) {
		this.sgstRate = sgstRate;
	}
	public Float getIgstRate() {
		return igstRate;
	}
	public void setIgstRate(Float igstRate) {
		this.igstRate = igstRate;
	}
	public String getHsnCode() {
		return hsnCode;
	}
	public void setHsnCode(String hsnCode) {
		this.hsnCode = hsnCode;
	}
	public Float getTaxRate() {
		return taxRate;
	}
	public void setTaxRate(Float taxRate) {
		this.taxRate = taxRate;
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
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public Float getQuantity() {
		return quantity;
	}
	public void setQuantity(Float quantity) {
		this.quantity = quantity;
	}
	public String getUom() {
		return uom;
	}
	public void setUom(String uom) {
		this.uom = uom;
	}
	public boolean isSkuStatus() {
		return skuStatus;
	}
	public void setSkuStatus(boolean skuStatus) {
		this.skuStatus = skuStatus;
	}
	public String getStoreLocationId() {
		return storeLocationId;
	}
	public void setStoreLocationId(String storeLocationId) {
		this.storeLocationId = storeLocationId;
	}
	public String getProductRange() {
		return productRange;
	}
	public void setProductRange(String productRange) {
		this.productRange = productRange;
	}
	public String getMeasureRange() {
		return measureRange;
	}
	public void setMeasureRange(String measureRange) {
		this.measureRange = measureRange;
	}
	public String getStoreLocation() {
		return storeLocation;
	}
	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
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
	public String getExpiry_date() {
		return expiry_date;
	}
	public void setExpiry_date(String expiry_date) {
		this.expiry_date = expiry_date;
	}
	public String getEan() {
		return ean;
	}
	public void setEan(String ean) {
		this.ean = ean;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getAutoNum() {
		return autoNum;
	}
	public void setAutoNum(int autoNum) {
		this.autoNum = autoNum;
	}
	public String getSkuId() {
		return skuId;
	}
	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}
	public Float getCostPrice() {
		return costPrice;
	}
	public void setCostPrice(Float costPrice) {
		this.costPrice = costPrice;
	}
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	public Float getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(Float salePrice) {
		this.salePrice = salePrice;
	}
	public Float getWholesalePrice() {
		return wholesalePrice;
	}
	public void setWholesalePrice(Float wholesalePrice) {
		this.wholesalePrice = wholesalePrice;
	}
	public Float getExtraPrice() {
		return extraPrice;
	}
	public void setExtraPrice(Float extraPrice) {
		this.extraPrice = extraPrice;
	}
	public String getPluCode() {
		return pluCode;
	}
	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public String getUpdatedDate() {
		return updatedDate;
	}
	public void setUpdatedDate(String updatedDate) {
		this.updatedDate = updatedDate;
	}
	public String getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getColorShade() {
		return colorShade;
	}
	public void setColorShade(String colorShade) {
		this.colorShade = colorShade;
	}
	public String getMbq() {
		return mbq;
	}
	public void setMbq(String mbq) {
		this.mbq = mbq;
	}
	public Float getQuantityInHand() {
		return quantityInHand;
	}
	public void setQuantityInHand(Float quantityInHand) {
		this.quantityInHand = quantityInHand;
	}
	public String getAcp() {
		return acp;
	}
	public void setAcp(String acp) {
		this.acp = acp;
	}
	
	public List<SkuTax> getTax() {
		return tax;
	}
	public void setTax(List<SkuTax> tax) {
		this.tax = tax;
	}
	public String getTaxCode() {
		return taxCode;
	}
	public void setTaxCode(String taxCode) {
		this.taxCode = taxCode;
	}
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
	public String getCreated_date() {
		return created_date;
	}
	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}
	public String getUpdated_date() {
		return updated_date;
	}
	public void setUpdated_date(String updated_date) {
		this.updated_date = updated_date;
	}
	public String getProductBatchNo() {
		return productBatchNo;
	}
	public void setProductBatchNo(String productBatchNo) {
		this.productBatchNo = productBatchNo;
	}
	public String getDiscountType() {
		return discountType;
	}
	public void setDiscountType(String discountType) {
		this.discountType = discountType;
	}
	public Float getDiscount() {
		return discount;
	}
	public void setDiscount(Float discount) {
		this.discount = discount;
	}
	public String getUtility() {
		return utility;
	}
	public void setUtility(String utility) {
		this.utility = utility;
	}
	public String getStyleRange() {
		return styleRange;
	}
	public void setStyleRange(String styleRange) {
		this.styleRange = styleRange;
	}
	public String getPackagingDate() {
		return packagingDate;
	}
	public void setPackagingDate(String packagingDate) {
		this.packagingDate = packagingDate;
	}
	
	
	
	
	
	
	
	/*
	
	@Column(name = "sku_desc")
	private String description;
	
	@Column(name = "plu_qty")
	private Float quantity;
	
	@Column(name = "cost_price")
	private Float costPrice;
	
	@Column(name = "mrp")
	private Float price;
	
	@Column(name = "sale_price")
	private Float salePrice;
	
	@Column(name = "expiry_date")
	private Date expiryDate;
	
	@Column(name = "ean")
	private String ean;
	
	@Column(name = "acp")
	private String acp;
	
	@Column(name = "updated_date")
	private Date updatedDate;
	
	@Column(name = "created_date")
	private Date createdDate;
	
	@Column(name = "ws_price")
	private Float wsPrice;
	
	@Column(name = "color")
	private String color;
	
	@Column(name = "color_shade")
	private String colorShade;
	
	@Column(name = "size")
	private String size;
	
	@Column(name = "mbq")
	private int mbq;
	
	@Column(name = "extra_price")
	private Float extraPrice;
	
	@Column(name = "uom")
	private String uom;
	
	@Column(name = "plu_code")
	private String pluCode;
*/	
	
	
	
}
