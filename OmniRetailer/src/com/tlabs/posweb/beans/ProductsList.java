package com.tlabs.posweb.beans;

import java.util.List;
import java.util.Set;

public class ProductsList {
	private String category;

	private Float mbq;
	private Float mrp;
	private Float buy_price;
	private float reorderPoint;
	private float quantity;
	private float minSaleQty;
	private double quantityInHand;
	private String utility;
	private String skuID;

	private String subCategory;
	private String productcategory;
	private String description;
	private String department;
	
	private String supplierName;
	private String productId;
	private String ean;
	private String skuItemStatus;

	private String noData;
	private String uom;
	private String productName;
	private String sell_UOM;

	private String price;
	
	private String pluCode;
	
	private String make;
	
	private String model;
	
	private String status;
	
	private String skuId;
	
	private String totalRecords;
	
	private String categoryDescription;
	private int slNo;
	private Set<SkuPriceList> skuPriceLists;
	private String brandCode;
	
	
	private String measurementRange;
	private String skuDescription;
	
	private String cost;
	private String hsnCode;
	
	
	
	private String measureRange;
	private Boolean itemStatus;
	private List<ProductsList> temporaryGroupList;
	private String maxRecords;
	private String pattern;
	private ResponseHeader responseHeader;
	private RequestHeader requestHeader;
	private String userId;
	private String startIndex;
	private String SNo;
	private String productRange;
	private String productDescription;
	private String color;
	private String size;
	private float stock;
	private Boolean isPacked;
	private Boolean manufacturedItem;
	private String uomLabel;
	private String location;
	
	private float salePrice;
	
	private float netStock;
	private float orderQty;
	private float stockQty;
	private  String fileUrl;
	
	private List<SkuTax> tax;
	
	private String url;
	private Float costPrice;
	
	 private float profitability;
	 
	  private Double mrpProfitability;
	  
	  private Sku skuInfo;
	  
	  private String noSkusMessage;
	  private String logURL;
	  
	
	  
	  
	public String getLogURL() {
		return logURL;
	}

	public void setLogURL(String logURL) {
		this.logURL = logURL;
	}

	public String getNoSkusMessage() {
		return noSkusMessage;
	}

	public void setNoSkusMessage(String noSkusMessage) {
		this.noSkusMessage = noSkusMessage;
	}

	public Sku getSkuInfo() {
		return skuInfo;
	}

	public void setSkuInfo(Sku skuInfo) {
		this.skuInfo = skuInfo;
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

	private List<String> urlList;
	
	public List<String> getUrlList() {
		return urlList;
	}

	public void setUrlList(List<String> urlList) {
		this.urlList = urlList;
	}

	public Float getCostPrice() {
		return costPrice;
	}

	public void setCostPrice(Float costPrice) {
		this.costPrice = costPrice;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getSell_UOM() {
		return sell_UOM;
	}

	public void setSell_UOM(String sell_UOM) {
		this.sell_UOM = sell_UOM;
	}

	public String getHsnCode() {
		return hsnCode;
	}

	public void setHsnCode(String hsnCode) {
		this.hsnCode = hsnCode;
	}

	public List<SkuTax> getTax() {
		return tax;
	}

	public void setTax(List<SkuTax> tax) {
		this.tax = tax;
	}

	public String getCost() {
		return cost;
	}

	public void setCost(String cost) {
		this.cost = cost;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getUtility() {
		return utility;
	}

	public void setUtility(String utility) {
		this.utility = utility;
	}

	public String getFileUrl() {
		return fileUrl;
	}

	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}

	public float getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(float salePrice) {
		this.salePrice = salePrice;
	}

	public float getNetStock() {
		return netStock;
	}

	public void setNetStock(float netStock) {
		this.netStock = netStock;
	}

	public float getOrderQty() {
		return orderQty;
	}

	public void setOrderQty(float orderQty) {
		this.orderQty = orderQty;
	}

	public float getStockQty() {
		return stockQty;
	}

	public void setStockQty(float stockQty) {
		this.stockQty = stockQty;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getUomLabel() {
		return uomLabel;
	}

	public void setUomLabel(String uomLabel) {
		this.uomLabel = uomLabel;
	}

	public float getMinSaleQty() {
		return minSaleQty;
	}

	public void setMinSaleQty(float minSaleQty) {
		this.minSaleQty = minSaleQty;
	}

	public Boolean getManufacturedItem() {
		return manufacturedItem;
	}

	public void setManufacturedItem(Boolean manufacturedItem) {
		this.manufacturedItem = manufacturedItem;
	}

	public Boolean getIsPacked() {
		return isPacked;
	}

	public void setIsPacked(Boolean isPacked) {
		this.isPacked = isPacked;
	}

	public Float getBuy_price() {
		return buy_price;
	}

	public void setBuy_price(Float buy_price) {
		this.buy_price = buy_price;
	}

	public Float getMrp() {
		return mrp;
	}

	public void setMrp(Float mrp) {
		this.mrp = mrp;
	}

	public float getStock() {
		return stock;
	}

	public void setStock(float stock) {
		this.stock = stock;
	}

	public String getMeasureRange() {
		return measureRange;
	}

	public void setMeasureRange(String measureRange) {
		this.measureRange = measureRange;
	}

	public Boolean getItemStatus() {
		return itemStatus;
	}

	public void setItemStatus(Boolean itemStatus) {
		this.itemStatus = itemStatus;
	}

	public List<ProductsList> getTemporaryGroupList() {
		return temporaryGroupList;
	}

	public void setTemporaryGroupList(List<ProductsList> temporaryGroupList) {
		this.temporaryGroupList = temporaryGroupList;
	}

	public String getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}

	public String getPattern() {
		return pattern;
	}

	public void setPattern(String pattern) {
		this.pattern = pattern;
	}

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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}

	public String getSNo() {
		return SNo;
	}

	public void setSNo(String sNo) {
		SNo = sNo;
	}

	public String getProductRange() {
		return productRange;
	}

	public void setProductRange(String productRange) {
		this.productRange = productRange;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
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

	public String getBrandCode() {
		return brandCode;
	}

	public void setBrandCode(String brandCode) {
		this.brandCode = brandCode;
	}

	public int getSlNo() {
		return slNo;
	}

	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}

	public String getCategoryDescription() {
		return categoryDescription;
	}

	public void setCategoryDescription(String categoryDescription) {
		this.categoryDescription = categoryDescription;
	}

	public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPluCode() {
		return pluCode;
	}

	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getNoData() {
		return noData;
	}
	public Set<SkuPriceList> getSkuPriceLists() {
		return skuPriceLists;
	}

	public void setSkuPriceLists(Set<SkuPriceList> skuPriceLists) {
		this.skuPriceLists = skuPriceLists;
	}
	public void setNoData(String noData) {
		this.noData = noData;
	}
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	

	public String getSkuID() {
		return skuID;
	}

	public void setSkuID(String skuID) {
		this.skuID = skuID;
	}

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	

	public Float getMbq() {
		return mbq;
	}

	public void setMbq(Float mbq) {
		this.mbq = mbq;
	}

	public float getReorderPoint() {
		return reorderPoint;
	}

	public void setReorderPoint(float reorderPoint) {
		this.reorderPoint = reorderPoint;
	}

	public float getQuantity() {
		return quantity;
	}

	public void setQuantity(float quantity) {
		this.quantity = quantity;
	}

	public double getQuantityInHand() {
		return quantityInHand;
	}

	public void setQuantityInHand(double quantityInHand) {
		this.quantityInHand = quantityInHand;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getSkuItemStatus() {
		return skuItemStatus;
	}

	public void setSkuItemStatus(String skuItemStatus) {
		this.skuItemStatus = skuItemStatus;
	}
	public String getEan() {
		return ean;
	}

	public void setEan(String ean) {
		this.ean = ean;
	}
	@Override
	public String toString() {
		return "ClassPojo [category = " + category + ", reorderPoint = " + reorderPoint + ", skuID = " + skuID + ", subCategory = " + subCategory + ", description = " + description + ", quantity = " + quantity + ", productId = " + productId + ", skuItemStatus = " + skuItemStatus + "]";
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public String getUom() {
		return uom;
	}

	public void setUom(String uom) {
		this.uom = uom;
	}

	public String getProductcategory() {
		return productcategory;
	}

	public void setProductcategory(String productcategory) {
		this.productcategory = productcategory;
	}

	public String getMeasurementRange() {
		return measurementRange;
	}

	public void setMeasurementRange(String measurementRange) {
		this.measurementRange = measurementRange;
	}

	public String getSkuDescription() {
		return skuDescription;
	}

	public void setSkuDescription(String skuDescription) {
		this.skuDescription = skuDescription;
	}

	


}