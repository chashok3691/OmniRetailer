package com.tlabs.posweb.beans;

import java.util.List;
import java.util.Set;
/**
 * @author Mythri.S
 * 
 */

public class Sku implements Cloneable {
	public Set<String> getUtilityRangeList() {
		return utilityRangeList;
	}
	public void setUtilityRangeList(Set<String> utilityRangeList) {
		this.utilityRangeList = utilityRangeList;
	}
	public Set<String> getSizeRangeList() {
		return sizeRangeList;
	}
	public void setSizeRangeList(Set<String> sizeRangeList) {
		this.sizeRangeList = sizeRangeList;
	}
	public Set<String> getBatchRangeList() {
		return batchRangeList;
	}
	public void setBatchRangeList(Set<String> batchRangeList) {
		this.batchRangeList = batchRangeList;
	}
	public Set<String> getColourRangeList() {
		return colourRangeList;
	}
	public void setColourRangeList(Set<String> colourRangeList) {
		this.colourRangeList = colourRangeList;
	}
	private List<String> multipleEAN;
	private List<SkuEans> eans;
	private String hsnCode; 
	private String department;
	private String subCategory;
	private String searchCriteria;
	private String section;
	private String skuId;
	private String productId;
	private String productName;
	private String ean;
	private String supplierName;
	private String supplier;
	private String brandCode;
	private String status;
	private String manufacturerCode;
	private String make;
	private String uom;
	private Float quantity;
	private int packSize;
	private String color;
	private String patternCode;
	private Float reorderPoint;
	private Float orderQuantity;
	private int leadTimeDays;
	private Float maxStock;
	private Float stock;
	private String taxCode;
	private String frTaxCode;
	private String markUp;
	private String markDown;
	private String runningPluNumber;
	private String model;
	private String  zoneID;
	private String productUrl;
	private String strProductUrl;
	
	private Float costPrice;
	private Float price;
	private Float salePrice;
	private Float wholesalePrice;
	private String businessCategory;
	private String businessSubCategory;
	private String technical_specification;
	private boolean batchRequired ;
    private boolean taxonDiscountedPrice = false;
    private Float newMRPPrice;
    
    private String theme;
    private String subTheme;
    
    private Float freeQty;
	private Float discountPercentage;
	private Float discountAmt;
    
	private Boolean picklistItem;
	private String productBatchNo;
    private String  expiryDateStr;
    
    private ResponseHeader responseHeader;
    
    private String url;
    
    private String bill_num;
    private String pluCode;
    private boolean stockStatus;
   
	
	public boolean isStockStatus() {
		return stockStatus;
	}
	public void setStockStatus(boolean stockStatus) {
		this.stockStatus = stockStatus;
	}
	public String getPluCode() {
		return pluCode;
	}
	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}
	public String getBill_num() {
		return bill_num;
	}
	public void setBill_num(String bill_num) {
		this.bill_num = bill_num;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	public String getProductBatchNo() {
		return productBatchNo;
	}
	public void setProductBatchNo(String productBatchNo) {
		this.productBatchNo = productBatchNo;
	}
	public String getExpiryDateStr() {
		return expiryDateStr;
	}
	public void setExpiryDateStr(String expiryDateStr) {
		this.expiryDateStr = expiryDateStr;
	}
	public Boolean getPicklistItem() {
		return picklistItem;
	}
	public void setPicklistItem(Boolean picklistItem) {
		this.picklistItem = picklistItem;
	}
	public Float getFreeQty() {
		return freeQty;
	}
	public void setFreeQty(Float freeQty) {
		this.freeQty = freeQty;
	}
	public Float getDiscountPercentage() {
		return discountPercentage;
	}
	public void setDiscountPercentage(Float discountPercentage) {
		this.discountPercentage = discountPercentage;
	}
	public Float getDiscountAmt() {
		return discountAmt;
	}
	public void setDiscountAmt(Float discountAmt) {
		this.discountAmt = discountAmt;
	}
	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}
	public String getSubTheme() {
		return subTheme;
	}
	public void setSubTheme(String subTheme) {
		this.subTheme = subTheme;
	}
	public List<SkuEans> getEans() {
		return eans;
	}
	public void setEans(List<SkuEans> eans) {
		this.eans = eans;
	}
	public List<String> getMultipleEAN() {
		return multipleEAN;
	}
	public void setMultipleEAN(List<String> multipleEAN) {
		this.multipleEAN = multipleEAN;
	}
	public Float getNewMRPPrice() {
		return newMRPPrice;
	}
	public void setNewMRPPrice(Float newMRPPrice) {
		this.newMRPPrice = newMRPPrice;
	}
	public boolean isBatchRequired() {
		return batchRequired;
	}
	public void setBatchRequired(boolean batchRequired) {
		this.batchRequired = batchRequired;
	}
	public boolean isTaxonDiscountedPrice() {
		return taxonDiscountedPrice;
	}
	public void setTaxonDiscountedPrice(boolean taxonDiscountedPrice) {
		this.taxonDiscountedPrice = taxonDiscountedPrice;
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
	public String getTechnical_specification() {
		return technical_specification;
	}
	public void setTechnical_specification(String technical_specification) {
		this.technical_specification = technical_specification;
	}
	public String getProductUrl() {
		return productUrl;
	}
	public void setProductUrl(String productUrl) {
		this.productUrl = productUrl;
	}
	public String getStrProductUrl() {
		return strProductUrl;
	}
	public void setStrProductUrl(String strProductUrl) {
		this.strProductUrl = strProductUrl;
	}
	public String getZoneID() {
		return zoneID;
	}
	public void setZoneID(String zoneID) {
		this.zoneID = zoneID;
	}
	private Float openRate;
	private Float lastCost;
	private Float avgCost;
	private Float minimumPrice;
	private double newCostPrice;
	
	private boolean is_combo;

	
	public boolean isIs_combo() {
		return is_combo;
	}
	public void setIs_combo(boolean is_combo) {
		this.is_combo = is_combo;
	}
	private String product_side_effects;
	public String getProduct_side_effects() {
		return product_side_effects;
	}
	public void setProduct_side_effects(String product_side_effects) {
		this.product_side_effects = product_side_effects;
	}
	private String product_precautions;
	
	private String product_handing;
	private String product_consumption_interaction;
	private String product_usage;
	private String uom1;
	private String uom2;
	/*private Float mrpPrice;
	private Float salePriceValue;*/
	
	public String getUom1() {
		return uom1;
	}
	public void setUom1(String uom1) {
		this.uom1 = uom1;
	}
	public String getUom2() {
		return uom2;
	}
	public void setUom2(String uom2) {
		this.uom2 = uom2;
	}
	public String getProduct_usage() {
		return product_usage;
	}
	public void setProduct_usage(String product_usage) {
		this.product_usage = product_usage;
	}
	public String getProduct_consumption_interaction() {
		return product_consumption_interaction;
	}
	public void setProduct_consumption_interaction(String product_consumption_interaction) {
		this.product_consumption_interaction = product_consumption_interaction;
	}
	public String getProduct_precautions() {
		return product_precautions;
	}
	public String getProduct_handing() {
		return product_handing;
	}
	public void setProduct_handing(String product_handing) {
		this.product_handing = product_handing;
	}
	public void setProduct_precautions(String product_precautions) {
		this.product_precautions = product_precautions;
	}
	/*public Float getMrpPrice() {
		return mrpPrice;
	}
	public void setMrpPrice(Float mrpPrice) {
		this.mrpPrice = mrpPrice;
	}
	public Float getSalePriceValue() {
		return salePriceValue;
	}
	public void setSalePriceValue(Float salePriceValue) {
		this.salePriceValue = salePriceValue;
	}*/
	private List<String> locationsList;
	
	public List<String> getLocationsList() {
		return locationsList;
	}
	public void setLocationsList(List<String> locationsList) {
		this.locationsList = locationsList;
	}
	public double getNewCostPrice() {
		return newCostPrice;
	}
	public void setNewCostPrice(double newCostPrice) {
		this.newCostPrice = newCostPrice;
	}
	/*private Date createdDate;
	private Date updatedDate;*/
	private String createdDate;
	private String updatedDate;
	private String picture1;
	private String picture2;
	private String picture3;
	private String pictureIcon;
	private String strPicture1;
	private String strPicture2;
	private String strPicture3;
	private String strPictureIcon;
	private String picture1flag;
	private String picture2flag;
	private String picture3flag;
	private String pictureIconflag;
	private boolean nonTaxable;
	private boolean discountable;
	private boolean allowDecimals;
	private String storeLocation;
	private String description;
	private String fabric;
	private String warantyDetails;
	private String remarks;
    private Set<SkuPriceList> skuPriceLists;
	private String sell_UOM;
	private Float tax;
	private String productcategory;
	private String created_date;
	private String updated_date;
	private RequestHeader requestHeader;
	private String startIndex;
	private String totalRecords;
	private List<String> skuidsList;
	private String categoryName;
	private String subCategoryName;
	private String category;
	private int slNo;
	private String categoryId;
	private boolean jitStock;
	private boolean zeroStock;
	private Float minSaleQty;
	private String uomLabel;
	Set<String> productRangeList;
	Set<String> measurementRangeList;
	Set<String> utilityRangeList;
	Set<String> sizeRangeList;
	Set<String> batchRangeList;
	Set<String> colourRangeList;
	Set<String> selectedLocationsList;
	Set<String> selectedLocationsIdList;
	Set<String> styleRangeList;
	/*below fields added by chaithanya.v for new arrivals*/
	private String maxRecords;
	private String initialRecord;
	private boolean newArrival;
	private String productCategory;
	private String fromDate;
	private String toDate;
	private String productClass;
	private String productSubClass;
	
	private String flow;
	
	
	
	
	 

	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getFlow() {
		return flow;
	}
	public void setFlow(String flow) {
		this.flow = flow;
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
	private boolean costPriceEditable;
	
	public boolean isCostPriceEditable() {
		return costPriceEditable;
	}
	public void setCostPriceEditable(boolean costPriceEditable) {
		this.costPriceEditable = costPriceEditable;
	}
	private Boolean trackingRequired = false;
	
	private String expandCount;
	
	
	public String getExpandCount() {
		return expandCount;
	}
	public void setExpandCount(String expandCount) {
		this.expandCount = expandCount;
	}
	public Boolean getTrackingRequired() {
		return trackingRequired;
	}
	public void setTrackingRequired(Boolean trackingRequired) {
		this.trackingRequired = trackingRequired;
	}
	private boolean skuStatus;
	
	
	private List<SkuPriceListDetails> priceDetails;
	
	private String locationList;
	
	public String getLocationList() {
		return locationList;
	}
	public void setLocationList(String locationList) {
		this.locationList = locationList;
	}
	public List<SkuPriceListDetails> getPriceDetails() {
		return priceDetails;
	}
	public void setPriceDetails(List<SkuPriceListDetails> priceDetails) {
		this.priceDetails = priceDetails;
	}
	public boolean isSkuStatus() {
		return skuStatus;
	}
	public void setSkuStatus(boolean skuStatus) {
		this.skuStatus = skuStatus;
	}
	/*below fields added by Raviteja.N for sku master*/
	private String alternateSkuId;
	private String seasonCode;
	private String  aliasName;
	private String	itemType;
	private String itemDesign;
	private boolean manufacturedItem;
	private boolean packed;
	private boolean editable;
	private String primaryDepartment;
	private String secondaryDepartment;
	private int retailUnits;
	private boolean itemTaxExclusive;
	
	
	//purpose:below fileds are used for just console purpose
	
	private String brandName;
	private String supplierIdName;
	
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public String getSupplierIdName() {
		return supplierIdName;
	}
	public void setSupplierIdName(String supplierIdName) {
		this.supplierIdName = supplierIdName;
	}
	public String getMaxRecords() {
		return maxRecords;
	}
	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}
	public String getInitialRecord() {
		return initialRecord;
	}
	public void setInitialRecord(String initialRecord) {
		this.initialRecord = initialRecord;
	}
	public boolean isNewArrival() {
		return newArrival;
	}
	public void setNewArrival(boolean newArrival) {
		this.newArrival = newArrival;
	}
	public String getProductCategory() {
		return productCategory;
	}
	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}
	public String getFromDate() {
		return fromDate;
	}
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	public String getToDate() {
		return toDate;
	}
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}
	public Set<String> getSelectedLocationsIdList() {
		return selectedLocationsIdList;
	}
	public void setSelectedLocationsIdList(Set<String> selectedLocationsIdList) {
		this.selectedLocationsIdList = selectedLocationsIdList;
	}
	public Set<String> getProductRangeList() {
		return productRangeList;
	}
	public void setProductRangeList(Set<String> productRangeList) {
		this.productRangeList = productRangeList;
	}
	public Set<String> getMeasurementRangeList() {
		return measurementRangeList;
	}
	public void setMeasurementRangeList(Set<String> measurementRangeList) {
		this.measurementRangeList = measurementRangeList;
	}
	public Set<String> getSelectedLocationsList() {
		return selectedLocationsList;
	}
	public void setSelectedLocationsList(Set<String> selectedLocationsList) {
		this.selectedLocationsList = selectedLocationsList;
	}
	public boolean isJitStock() {
		return jitStock;
	}
	public void setJitStock(boolean jitStock) {
		this.jitStock = jitStock;
	}
	public boolean isZeroStock() {
		return zeroStock;
	}
	public void setZeroStock(boolean zeroStock) {
		this.zeroStock = zeroStock;
	}
	public Float getMinSaleQty() {
		return minSaleQty;
	}
	public void setMinSaleQty(Float minSaleQty) {
		this.minSaleQty = minSaleQty;
	}
	public String getUomLabel() {
		return uomLabel;
	}
	public void setUomLabel(String uomLabel) {
		this.uomLabel = uomLabel;
	}
	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	public int getSlNo() {
		return slNo;
	}
	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}
	
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getSubCategoryName() {
		return subCategoryName;
	}
	public void setSubCategoryName(String subCategoryName) {
		this.subCategoryName = subCategoryName;
	}
	
	
	public String getPictureIcon() {
		return pictureIcon;
	}
	public void setPictureIcon(String pictureIcon) {
		this.pictureIcon = pictureIcon;
	}
	public String getStrPictureIcon() {
		return strPictureIcon;
	}
	public void setStrPictureIcon(String strPictureIcon) {
		this.strPictureIcon = strPictureIcon;
	}
	public String getPictureIconflag() {
		return pictureIconflag;
	}
	public void setPictureIconflag(String pictureIconflag) {
		this.pictureIconflag = pictureIconflag;
	}
	public String getPicture1flag() {
		return picture1flag;
	}
	public void setPicture1flag(String picture1flag) {
		this.picture1flag = picture1flag;
	}
	public String getPicture2flag() {
		return picture2flag;
	}
	public void setPicture2flag(String picture2flag) {
		this.picture2flag = picture2flag;
	}
	public String getPicture3flag() {
		return picture3flag;
	}
	public void setPicture3flag(String picture3flag) {
		this.picture3flag = picture3flag;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getSupplier() {
		return supplier;
	}
	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}
	public List<String> getSkuidsList() {
		return skuidsList;
	}
	public void setSkuidsList(List<String> skuidsList) {
		this.skuidsList = skuidsList;
	}
	public String getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
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
	public String getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	public String getBrandCode() {
		return brandCode;
	}
	public void setBrandCode(String brandCode) {
		this.brandCode = brandCode;
	}
	public Set<SkuPriceList> getSkuPriceLists() {
		return skuPriceLists;
	}
	public void setSkuPriceLists(Set<SkuPriceList> skuPriceLists) {
		this.skuPriceLists = skuPriceLists;
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
	
	public String getSkuId() {
		return skuId;
	}
	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	
	public String getEan() {
		return ean;
	}
	public void setEan(String ean) {
		this.ean = ean;
	}
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getManufacturerCode() {
		return manufacturerCode;
	}
	public void setManufacturerCode(String manufacturerCode) {
		this.manufacturerCode = manufacturerCode;
	}
	public String getMake() {
		return make;
	}
	public void setMake(String make) {
		this.make = make;
	}
	public String getUom() {
		return uom;
	}
	public void setUom(String uom) {
		this.uom = uom;
	}
	public Float getQuantity() {
		return quantity;
	}
	public void setQuantity(Float quantity) {
		this.quantity = quantity;
	}
	public int getPackSize() {
		return packSize;
	}
	public void setPackSize(int packSize) {
		this.packSize = packSize;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getPatternCode() {
		return patternCode;
	}
	public void setPatternCode(String patternCode) {
		this.patternCode = patternCode;
	}
	public Float getReorderPoint() {
		return reorderPoint;
	}
	public void setReorderPoint(Float reorderPoint) {
		this.reorderPoint = reorderPoint;
	}
	public Float getOrderQuantity() {
		return orderQuantity;
	}
	public void setOrderQuantity(Float orderQuantity) {
		this.orderQuantity = orderQuantity;
	}
	public int getLeadTimeDays() {
		return leadTimeDays;
	}
	public void setLeadTimeDays(int leadTimeDays) {
		this.leadTimeDays = leadTimeDays;
	}
	public Float getMaxStock() {
		return maxStock;
	}
	public void setMaxStock(Float maxStock) {
		this.maxStock = maxStock;
	}
	public Float getStock() {
		return stock;
	}
	public void setStock(Float stock) {
		this.stock = stock;
	}
	
	public String getTaxCode() {
		return taxCode;
	}
	public void setTaxCode(String taxCode) {
		this.taxCode = taxCode;
	}
	public String getFrTaxCode() {
		return frTaxCode;
	}
	public void setFrTaxCode(String frTaxCode) {
		this.frTaxCode = frTaxCode;
	}
	public String getMarkUp() {
		return markUp;
	}
	public void setMarkUp(String markUp) {
		this.markUp = markUp;
	}
	public String getMarkDown() {
		return markDown;
	}
	public void setMarkDown(String markDown) {
		this.markDown = markDown;
	}
	public String getRunningPluNumber() {
		return runningPluNumber;
	}
	public void setRunningPluNumber(String runningPluNumber) {
		this.runningPluNumber = runningPluNumber;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public Float getOpenRate() {
		return openRate;
	}
	public void setOpenRate(Float openRate) {
		this.openRate = openRate;
	}
	public Float getLastCost() {
		return lastCost;
	}
	public void setLastCost(Float lastCost) {
		this.lastCost = lastCost;
	}
	public Float getAvgCost() {
		return avgCost;
	}
	public void setAvgCost(Float avgCost) {
		this.avgCost = avgCost;
	}
	public Float getMinimumPrice() {
		return minimumPrice;
	}
	public void setMinimumPrice(Float minimumPrice) {
		this.minimumPrice = minimumPrice;
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
	public String getPicture1() {
		return picture1;
	}
	public void setPicture1(String picture1) {
		this.picture1 = picture1;
	}
	public String getPicture2() {
		return picture2;
	}
	public void setPicture2(String picture2) {
		this.picture2 = picture2;
	}
	public String getPicture3() {
		return picture3;
	}
	public void setPicture3(String picture3) {
		this.picture3 = picture3;
	}
	public boolean isNonTaxable() {
		return nonTaxable;
	}
	public void setNonTaxable(boolean nonTaxable) {
		this.nonTaxable = nonTaxable;
	}
	public boolean isDiscountable() {
		return discountable;
	}
	public void setDiscountable(boolean discountable) {
		this.discountable = discountable;
	}
	public boolean isAllowDecimals() {
		return allowDecimals;
	}
	public void setAllowDecimals(boolean allowDecimals) {
		this.allowDecimals = allowDecimals;
	}
	public String getStoreLocation() {
		return storeLocation;
	}
	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getWarantyDetails() {
		return warantyDetails;
	}
	public void setWarantyDetails(String warantyDetails) {
		this.warantyDetails = warantyDetails;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getSell_UOM() {
		return sell_UOM;
	}
	public void setSell_UOM(String sell_UOM) {
		this.sell_UOM = sell_UOM;
	}
	public Float getTax() {
		return tax;
	}
	public void setTax(Float tax) {
		this.tax = tax;
	}
	public String getAlternateSkuId() {
		return alternateSkuId;
	}
	public void setAlternateSkuId(String alternateSkuId) {
		this.alternateSkuId = alternateSkuId;
	}
	public String getSeasonCode() {
		return seasonCode;
	}
	public void setSeasonCode(String seasonCode) {
		this.seasonCode = seasonCode;
	}
	public String getAliasName() {
		return aliasName;
	}
	public void setAliasName(String aliasName) {
		this.aliasName = aliasName;
	}
	public String getItemType() {
		return itemType;
	}
	public void setItemType(String itemType) {
		this.itemType = itemType;
	}
	public String getItemDesign() {
		return itemDesign;
	}
	public void setItemDesign(String itemDesign) {
		this.itemDesign = itemDesign;
	}
	public boolean isManufacturedItem() {
		return manufacturedItem;
	}
	public void setManufacturedItem(boolean manufacturedItem) {
		this.manufacturedItem = manufacturedItem;
	}
	public boolean isPacked() {
		return packed;
	}
	public void setPacked(boolean packed) {
		this.packed = packed;
	}
	public boolean isEditable() {
		return editable;
	}
	public void setEditable(boolean editable) {
		this.editable = editable;
	}
	public String getPrimaryDepartment() {
		return primaryDepartment;
	}
	public void setPrimaryDepartment(String primaryDepartment) {
		this.primaryDepartment = primaryDepartment;
	}
	public String getSecondaryDepartment() {
		return secondaryDepartment;
	}
	public void setSecondaryDepartment(String secondaryDepartment) {
		this.secondaryDepartment = secondaryDepartment;
	}
	public String getProductcategory() {
		return productcategory;
	}
	public void setProductcategory(String productcategory) {
		this.productcategory = productcategory;
	}
	public int getRetailUnits() {
		return retailUnits;
	}
	public void setRetailUnits(int retailUnits) {
		this.retailUnits = retailUnits;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getSubCategory() {
		return subCategory;
	}
	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public String getSearchCriteria() {
		return searchCriteria;
	}
	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}
	public String getFabric() {
		return fabric;
	}
	public void setFabric(String fabric) {
		this.fabric = fabric;
	}
	public boolean isItemTaxExclusive() {
		return itemTaxExclusive;
	}
	public void setItemTaxExclusive(boolean itemTaxExclusive) {
		this.itemTaxExclusive = itemTaxExclusive;
	}
	public String getHsnCode() {
		return hsnCode;
	}
	public void setHsnCode(String hsnCode) {
		this.hsnCode = hsnCode;
	}
	public Set<String> getStyleRangeList() {
		return styleRangeList;
	}
	public void setStyleRangeList(Set<String> styleRangeList) {
		this.styleRangeList = styleRangeList;
	}
	
	
	
	
	
	
	
	//@Column(name="sub_category")
	//private String subCategory;
	//@Column(name="price")
	//private Float price;
	//@Column(name="weight")
	//private String weight;
	//@Column(name="size")
	//private String size;
	//@Column(name="quantity_in_hand")
	//private Float quantity;
	//@Column(name="date_time")
	//private Date date_Time;
	//@Transient
	//private String dateTime;
	//@Column(name="model_name")
	//private String modelNumber;
	//@Column(name="batch_number")
	//private String batchNumber;
	//@Column(name="warranty_details")
	//private String warrantyDetails;
	//@Column(name="reorder_point")
	//private Float reorderPoint;
	//@Column(name="upc")
	//private String upc;
	//@Column(name="picture1")
	//private String picture1;
	//@Column(name="picture2")
	//private String picture2;
	//@Column(name="picture3")
	//private String picture3;
	//@ManyToOne(fetch=FetchType.EAGER)
	//@JoinColumn(name="product_ID", insertable = false, updatable = false)
	//private Product product;
	//@Column(name = "open_rate")
	//private Float openRate;
	//@Column(name = "tax_code")
	//private int taxCode;
	
	//@Column(name = "discountable")
	//private boolean discountable;
	
	//@Column(name = "roi")
	//private String roi;
	
	//@Column(name = "roq")
	//private String roq;
	
	//@Column(name = "last_cost")
	//private Float lastCost;
	
	//@Column(name = "min_price")
	//private Float minPrice;
	
	
	
	//@Column(name = "effective_date")
	//private Date effectiveDate;
	
	
	
	//@Column(name = "avg_cost")
	//private float avgCost;
	
	//@Column(name = "mrp")
	//private String mrp;
	
	//@Column(name = "expiry_date")
	//private Date expiryDate;
	
	//@Column(name = "mark_up")
	//private String markUp;
	
	//@Column(name = "mark_down")
	//private String markDown;
	
	//@Column(name = "supplier_code")
	//private String supplierCode;
	
	//@Column(name = "short_desc")
	//private String shortDesc;
	
	//@Column(name = "boq")
	//private String boq;
	
	//@Column(name = "last_updated")
	//private Date lastUpdated;
	
	//@Column(name = "running_plu_no")
	//private int runningPluNumber;
	

	
	//@Column(name = "pack_size")
	//private int packSize;
	
	//@Column(name = "best_before")
	//private Date bestBefore;
	
	//@Column(name = "fr_tax_code")
	//private Float frTaxCode;
	
	//@Column(name = "created_date")
	//private Date createdDate;
	
	//@Column(name = "ws_price")
	//private Float wsPrice;
	
	//@Column(name = "max_bq")
	//private int maxBq;
	
	//@Column(name = "allow_decimals")
	//private boolean allowDecimals;
	
	//@Column(name = "patters_code")
	//private boolean patternCode;
	
	//@Column(name="description")
	//private String description;
	
	
	
	
}
