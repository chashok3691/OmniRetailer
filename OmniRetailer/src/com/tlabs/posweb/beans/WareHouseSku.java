/**
 * 
 */
package com.tlabs.posweb.beans;
//
//import java.beans.Transient;
//import java.util.Date;
import java.util.List;
import java.util.Set;

/*import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;*/

import com.tlabs.posweb.beans.RequestHeader;

/**
 * @author Mythri.S
 * 
 */

/*@Entity
@Table(name = "warehouse_sku_master")*/
public class WareHouseSku implements Cloneable {
	/* creational pattern prototype is used for this object
	* should implement the clone method
	* */
	public WareHouseSku clone() {
		WareHouseSku sku = null;
		try {
			sku = (WareHouseSku) super.clone();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sku;
	}
	List<WareHouseSku> 	warehouseSku;
	public List<WareHouseSku> getWarehouseSku() {
		return warehouseSku;
	}

	public void setWarehouseSku(List<WareHouseSku> warehouseSku) {
		this.warehouseSku = warehouseSku;
	}
	//@Id
	//@Column(name = "sku_Id", unique = true, nullable = false)
	//@Column(name="sku_Id")
	private String skuId;

	//private List<WarehouseSkuPriceList> warehouseSkuPriceLists;
	
	
	//@Column(name = "product_Id")
	private String productId;
	private String productName;
	private String subCategoryName;
	private String createdDate;
	private int retailUnits;

	private Boolean picklistItem;
	
	private String theme;
	private String subTheme;

	private ResponseHeader responseHeader;
	private Float freeQty;
	private Float discountPercentage;
	private Float discountAmt;
	  
	private boolean is_combo;
	private String product_side_effect;
	private String product_precaution;
	private String product_consumption_interaction;
	private String product_usage;
	private String uom1;
	private String uom2;
	private String pictureIcon;
	private String strPictureIcon;
	private String pictureIconflag;
	private String fabric;
    private Set<SkuPriceList> skuPriceLists;
	private String productcategory;
	private List<String> skuidsList;
	private String categoryName;
	private String productClass;
	private String productSubClass;
	private String expandCount;
	private boolean packed;
	private Boolean itemTaxExclusive;
	private Float costPrice;
	private Float price;
	private Float salePrice;
	private String section;
	private String technical_specification;
	private String productUrl;
	private Integer autoNum;
	private String pluCode;
	private String colorShade;
	private String mbq;
	private Double quantityInHand;
	private  boolean zeroStockBilling;
	private String styleRange;
	private String measureRange;
	private String confirmPromptPrice;
	private String productBatchNo;
	private String picture_icon;
	private String productHandlng;
	private Float wholesalePrice;
	private String business_category;
    private String business_sub_category;
    
    private String url;
    private String bill_num;
    private boolean allMatchedflag;

    private String  expiryDateStr;
    private String  creationType;
    private String  zoneID;
    
    
	
	/*@Column(name="category")
	private String category;*/
	
	public String getZoneID() {
		return zoneID;
	}

	public void setZoneID(String zoneID) {
		this.zoneID = zoneID;
	}

	public String getCreationType() {
		return creationType;
	}

	public void setCreationType(String creationType) {
		this.creationType = creationType;
	}

	public String getExpiryDateStr() {
		return expiryDateStr;
	}

	public void setExpiryDateStr(String expiryDateStr) {
		this.expiryDateStr = expiryDateStr;
	}

	public boolean isAllMatchedflag() {
		return allMatchedflag;
	}

	public void setAllMatchedflag(boolean allMatchedflag) {
		this.allMatchedflag = allMatchedflag;
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

	public Float getFreeQty() {
		return freeQty;
	}

	public boolean isIs_combo() {
		return is_combo;
	}

	public void setIs_combo(boolean is_combo) {
		this.is_combo = is_combo;
	}

	public String getProduct_side_effect() {
		return product_side_effect;
	}

	public void setProduct_side_effect(String product_side_effect) {
		this.product_side_effect = product_side_effect;
	}

	public String getProduct_precaution() {
		return product_precaution;
	}

	public void setProduct_precaution(String product_precaution) {
		this.product_precaution = product_precaution;
	}

	public String getProduct_consumption_interaction() {
		return product_consumption_interaction;
	}

	public void setProduct_consumption_interaction(String product_consumption_interaction) {
		this.product_consumption_interaction = product_consumption_interaction;
	}

	public String getProduct_usage() {
		return product_usage;
	}

	public void setProduct_usage(String product_usage) {
		this.product_usage = product_usage;
	}

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

	public String getFabric() {
		return fabric;
	}

	public void setFabric(String fabric) {
		this.fabric = fabric;
	}

	public Set<SkuPriceList> getSkuPriceLists() {
		return skuPriceLists;
	}

	public void setSkuPriceLists(Set<SkuPriceList> skuPriceLists) {
		this.skuPriceLists = skuPriceLists;
	}

	public String getProductcategory() {
		return productcategory;
	}

	public void setProductcategory(String productcategory) {
		this.productcategory = productcategory;
	}

	public List<String> getSkuidsList() {
		return skuidsList;
	}

	public void setSkuidsList(List<String> skuidsList) {
		this.skuidsList = skuidsList;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
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

	public String getExpandCount() {
		return expandCount;
	}

	public void setExpandCount(String expandCount) {
		this.expandCount = expandCount;
	}

	public boolean isPacked() {
		return packed;
	}

	public void setPacked(boolean packed) {
		this.packed = packed;
	}

	public Boolean getItemTaxExclusive() {
		return itemTaxExclusive;
	}

	public void setItemTaxExclusive(Boolean itemTaxExclusive) {
		this.itemTaxExclusive = itemTaxExclusive;
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

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
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

	public Integer getAutoNum() {
		return autoNum;
	}

	public void setAutoNum(Integer autoNum) {
		this.autoNum = autoNum;
	}

	public String getPluCode() {
		return pluCode;
	}

	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
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

	public Double getQuantityInHand() {
		return quantityInHand;
	}

	public void setQuantityInHand(Double quantityInHand) {
		this.quantityInHand = quantityInHand;
	}

	public boolean isZeroStockBilling() {
		return zeroStockBilling;
	}

	public void setZeroStockBilling(boolean zeroStockBilling) {
		this.zeroStockBilling = zeroStockBilling;
	}

	public String getStyleRange() {
		return styleRange;
	}

	public void setStyleRange(String styleRange) {
		this.styleRange = styleRange;
	}

	public String getMeasureRange() {
		return measureRange;
	}

	public void setMeasureRange(String measureRange) {
		this.measureRange = measureRange;
	}

	public String getConfirmPromptPrice() {
		return confirmPromptPrice;
	}

	public void setConfirmPromptPrice(String confirmPromptPrice) {
		this.confirmPromptPrice = confirmPromptPrice;
	}

	public String getProductBatchNo() {
		return productBatchNo;
	}

	public void setProductBatchNo(String productBatchNo) {
		this.productBatchNo = productBatchNo;
	}

	public String getPicture_icon() {
		return picture_icon;
	}

	public void setPicture_icon(String picture_icon) {
		this.picture_icon = picture_icon;
	}

	public String getProductHandlng() {
		return productHandlng;
	}

	public void setProductHandlng(String productHandlng) {
		this.productHandlng = productHandlng;
	}

	public Float getWholesalePrice() {
		return wholesalePrice;
	}

	public void setWholesalePrice(Float wholesalePrice) {
		this.wholesalePrice = wholesalePrice;
	}

	public String getBusiness_category() {
		return business_category;
	}

	public void setBusiness_category(String business_category) {
		this.business_category = business_category;
	}

	public String getBusiness_sub_category() {
		return business_sub_category;
	}

	public void setBusiness_sub_category(String business_sub_category) {
		this.business_sub_category = business_sub_category;
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

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
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

	public Boolean getPicklistItem() {
		return picklistItem;
	}

	public void setPicklistItem(Boolean picklistItem) {
		this.picklistItem = picklistItem;
	}
	private Boolean trackingRequired = false;
	public Boolean getTrackingRequired() {
		return trackingRequired;
	}

	public void setTrackingRequired(Boolean trackingRequired) {
		this.trackingRequired = trackingRequired;
	}

	public String getSubCategoryName() {
		return subCategoryName;
	}

	public void setSubCategoryName(String subCategoryName) {
		this.subCategoryName = subCategoryName;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}
	//@Column(name = "ean")
	private String ean;

	//@Column(name = "supplier_name")
	private String supplierName;

	//@Column(name = "brand_code")
	private String brandCode;

	//@Column(name = "status")
	private String status;

	//@Column(name = "manufacturer_code")
	private String manufacturerCode;

	//@Column(name = "manufacturer_name")
	private String make;
	
	private String subCategory;
	
	
	
	
	
	
	

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}
	//@Column(name = "uom")
	private String uom;
	
	private String category;
	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	/* indicates size of the sku*/
	//@Column(name = "quantity")
	private Float quantity;

	//@Column(name = "pack_size")
	private int packSize;

	//@Column(name = "color")
	private String color;

	//@Column(name = "pattern_code")
	private String patternCode;

	//@Column(name = "re_order_point")
	private Float reorderPoint;

	//@Column(name = "order_quantity")
	private Float orderQuantity;

	//@Column(name = "lead_time_days")
	private int leadTimeDays;

	//@Column(name = "max_stock")
	private Float maxStock;

	//@Column(name = "stock")
	private Float stock;

	//@Column(name = "tax_code")
	private String taxCode;

	//@Column(name = "fr_tax_code")
	private int frTaxCode;

	//@Column(name = "mark_up")
	private String markUp;

	//@Column(name = "mark_down")
	private String markDown;

	//@Column(name = "running_plu_number")
	private String runningPluNumber;

	//@Column(name = "model")
	private String model;

	//@Column(name = "open_rate")
	private Float openRate;

	//@Column(name = "last_cost")
	private Float lastCost;

	//@Column(name = "average_cost")
	private Float avgCost;

	//@Column(name = "minimum_price")
	private Float minimumPrice;

	//@Column(name = "created_date")
//	private Date createdDate;

	//@Column(name = "updated_date")
	//private Date updatedDate;

	//@Column(name = "picture1")
	private String picture1;

	//@Column(name = "picture2")
	private String picture2;

	//@Column(name = "picture3")
	private String picture3;

	//@Column(name = "not_taxable")
	private boolean nonTaxable;

	//@Column(name = "discountable")
	private boolean discountable;

	//@Column(name = "allow_decimals")
	private boolean allowDecimals;

	//@Column(name = "store_location")
	private String storeLocation;

	//@Column(name = "short_description")
	private String description;

	//@Column(name = "waranty_details")
	private String warantyDetails;

	//@Column(name = "remarks")
	private String remarks;

	//@Column(name = "editable")
	private boolean editable;

	//@Column(name = "primary_department")
	private String primaryDepartment;

	//@Column(name = "secondary_department")
	private String secondaryDepartment;
	
	private int slNo;
	
	private String totalRecords;
	private String hsnCode;

	/*@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	@JoinColumn(name="sku_id")
	private Set<SkuPriceList> skuPriceLists;*/

	/*@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	@JoinColumn(name="sku_id")
	private Set<StoreInventory> skuStoreInventory;*/

	/*
	 * Adding new fields Karthik k
	 * 
	 */
	//Set<String> selectedLocationsIdList;
	
	
	public String getHsnCode() {
		return hsnCode;
	}

	public void setHsnCode(String hsnCode) {
		this.hsnCode = hsnCode;
	}

	public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

	public int getSlNo() {
		return slNo;
	}

	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}
	//private List<SkuPriceListDetails> skuLists;
	Set<String> selectedLocationsList;
	public Set<String> getSelectedLocationsList() {
		return selectedLocationsList;
	}

	public void setSelectedLocationsList(Set<String> selectedLocationsList) {
		this.selectedLocationsList = selectedLocationsList;
	}

	public Set<String> getSelectedLocationsIdList() {
		return selectedLocationsIdList;
	}

	public void setSelectedLocationsIdList(Set<String> selectedLocationsIdList) {
		this.selectedLocationsIdList = selectedLocationsIdList;
	}

	Set<String> selectedLocationsIdList;
	Set<String> measurementRangeList;
	Set<String> productRangeList;
	Set<String> batchRangeList;
	
	private boolean manufacturedItem;
	
	 private int dispatchExpiryTolerance;
	 private boolean batchRequired;
	 
	 
	 
	
	
	
	

	public int getDispatchExpiryTolerance() {
		return dispatchExpiryTolerance;
	}

	public void setDispatchExpiryTolerance(int dispatchExpiryTolerance) {
		this.dispatchExpiryTolerance = dispatchExpiryTolerance;
	}

	public boolean isBatchRequired() {
		return batchRequired;
	}

	public void setBatchRequired(boolean batchRequired) {
		this.batchRequired = batchRequired;
	}

	public boolean isManufacturedItem() {
		return manufacturedItem;
	}

	public void setManufacturedItem(boolean manufacturedItem) {
		this.manufacturedItem = manufacturedItem;
	}

	public Set<String> getBatchRangeList() {
		return batchRangeList;
	}

	public void setBatchRangeList(Set<String> batchRangeList) {
		this.batchRangeList = batchRangeList;
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

	
//	private List<WarehouseSkuPriceList> warehouseSkuPriceLists;
	
	private List<SkuPriceListDetails> skuLists;
	//private List<SkuPriceList> skuLists;
	//@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)

	public List<SkuPriceListDetails> getSkuLists() {
		return skuLists;
	}

	public void setSkuLists(List<SkuPriceListDetails> skuLists) {
		this.skuLists = skuLists;
	}

	
	private List<WarehouseSkuPriceList> warehouseSkuPriceLists;
	
	//@JoinColumn(name = "sku_id")
	//private Set<WarehouseSkuPriceList> warehouseSkuPriceLists;

	public List<WarehouseSkuPriceList> getWarehouseSkuPriceLists() {
		return warehouseSkuPriceLists;
	}

	public void setWarehouseSkuPriceLists(List<WarehouseSkuPriceList> warehouseSkuPriceLists) {
		this.warehouseSkuPriceLists = warehouseSkuPriceLists;
	}
	//@Column(name = "min_sale_qty")
	private Float minSaleQty;

	//@Column(name = "jit_stock")
	private Boolean jitStock;

	//@Column(name = "zero_stock")
	private Boolean zeroStock;

	//@Column(name = "uom_label")
	private String uomLabel;

	//@Column(name = "alternate_skuId")
	private String alternateSkuId;

	//@Column(name = "season_code")
	private String seasonCode;

	//@Column(name = "alias_name")
	private String aliasName;

	//@Column(name = "item_type")
	private String itemType;

	//@Column(name = "item_design")
	private String itemDesign;

	//@Transient
	private String categoryId;


	
	private WareHouseSku warehouseskumaster;
	
	public WareHouseSku getWarehouseskumaster() {
		return warehouseskumaster;
	}

	public void setWarehouseskumaster(WareHouseSku warehouseskumaster) {
		this.warehouseskumaster = warehouseskumaster;
	}

	public Float getMinSaleQty() {
		return minSaleQty;
	}

	public void setMinSaleQty(Float minSaleQty) {
		this.minSaleQty = minSaleQty;
	}

	public Boolean getJitStock() {
		return jitStock;
	}

	public void setJitStock(Boolean jitStock) {
		this.jitStock = jitStock;
	}

	public Boolean getZeroStock() {
		return zeroStock;
	}

	public void setZeroStock(Boolean zeroStock) {
		this.zeroStock = zeroStock;
	}

	public String getUomLabel() {
		return uomLabel;
	}

	public void setUomLabel(String uomLabel) {
		this.uomLabel = uomLabel;
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
private String updatedDate;
	//@Transient
	private String sell_UOM;
	//@Transient
	private Float tax;
	//@Transient
	private String created_date;
	//@Transient
	private String updated_date;
	//@Transient
	private int startIndex;
	//@Transient
	private String strPicture1;
	//@Transient
	private String strPicture2;
	//@Transient
	private String strPicture3;
	//@Transient
	private String picture1flag;
	//@Transient
	private String picture2flag;
	//@Transient
	private String picture3flag;
	//@Transient
	private String searchCriteria;
	//@Transient
	private String maxRecords;

	//@Transient
	private RequestHeader requestHeader;
	//@Transient
	private String initialRecord;
	//@Transient
	private String productCategory;
	//@Transient
	private String fromDate;
	//@Transient
	private String toDate;
	//@Transient
	private String brandName;
	//@Transient
	private String department;
	//@Transient
	private String[] priceRange;

	/*public Set<StoreInventory> getSkuStoreInventory() {
		return skuStoreInventory;
	}
	public void setSkuStoreInventory(Set<StoreInventory> skuStoreInventory) {
		this.skuStoreInventory = skuStoreInventory;
	}*/
	
	
	
	private List<String> warehouseSkuIds;
	


	
	
	public List<String> getWarehouseSkuIds() {
		return warehouseSkuIds;
	}

	public void setWarehouseSkuIds(List<String> warehouseSkuIds) {
		this.warehouseSkuIds = warehouseSkuIds;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public String getInitialRecord() {
		return initialRecord;
	}

	public void setInitialRecord(String initialRecord) {
		this.initialRecord = initialRecord;
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

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String[] getPriceRange() {
		return priceRange;
	}

	public void setPriceRange(String[] priceRange) {
		this.priceRange = priceRange;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	public String getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
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

	public boolean isEditable() {
		return editable;
	}

	public void setEditable(boolean editable) {
		this.editable = editable;
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

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public String getBrandCode() {
		return brandCode;
	}

	public void setBrandCode(String brandCode) {
		this.brandCode = brandCode;
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

	public int getFrTaxCode() {
		return frTaxCode;
	}

	public void setFrTaxCode(int frTaxCode) {
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


	

	public boolean isNonTaxable() {
		return nonTaxable;
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

	public String getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(String updatedDate) {
		this.updatedDate = updatedDate;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public int getRetailUnits() {
		return retailUnits;
	}

	public void setRetailUnits(int retailUnits) {
		this.retailUnits = retailUnits;
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
	//private byte[] picture1;
	//@Column(name="picture2")
	//private byte[] picture2;
	//@Column(name="picture3")
	//private byte[] picture3;
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
