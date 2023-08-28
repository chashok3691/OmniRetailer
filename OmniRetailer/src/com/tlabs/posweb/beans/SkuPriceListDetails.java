package com.tlabs.posweb.beans;

import java.util.Date;
import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class SkuPriceListDetails {

	private int autoNum;
	private String skuId;
	private String description;
	private Float quantity;
	private Float costPrice;
	private Float price;
	private Float salePrice;
	private Date expiryDate;
	private String ean;
	private String acp;
	private Date updatedDate;
	private Date createdDate;
	private Float wsPrice;
	private String color;
	private String colorShade;
	private String size;
	private int mbq;
	private Float extraPrice;
	private String uom;
	private String pluCode;
	private List<SkuTax> tax;
	private String taxCode;
	private String startIndex;
	private String totalRecords;
	private String updated_date = null;
	private String make;
	private String model;
	private boolean editable;
	private String materialType;
	private List<String> multipleEAN;
	
	
	
	
	
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
	private List<String> priceLocationList;
	
	public List<String> getPriceLocationList() {
		return priceLocationList;
	}
	public void setPriceLocationList(List<String> priceLocationList) {
		this.priceLocationList = priceLocationList;
	}
	private double newCostPrice;
	public double getNewCostPrice() {
		return newCostPrice;
	}
	public void setNewCostPrice(double newCostPrice) {
		this.newCostPrice = newCostPrice;
	}
	private RequestHeader requestHeader;
	
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	private Float taxValue;
	private String skuImage;
	
	private String productRange;
	private String measureRange;
	private String uomLabel;
	private String productSubClass;
	private String productClass;
	private String productDescription;
	private String brandCode;
	
	private String storeLocation;
	private String styleRange;

	private String alternatePluCode;

	private String confirmPromptPrice;

	private Date effectiveFromDate;

	private String manufactureId;

	private String packageId;

	private String rfidTag;

	//private Date warrantyPeriod;

	private String productBatchNo;

	private String productSerNo;

	private Date manufacturedDate;

	private String setCode;
	private boolean manufacturedItem;
	private boolean packed;
	private String category;
	private String subCategory;
	private boolean zeroStock;
	private boolean itemTaxExclusive;
	private Double availableQty;
	private float itemWiseDiscountAmt;
	private String section;
	private String primaryDepartment;
	private String secondaryDepartment;
	private float prvIndentQty;
	
	private String hsnCode;
	private String utility;
	
	private float soldQty;
	private String businessCategory;

	private String businessSubCategory;
	private Float newSalePrice;
	private Float newMRPPrice;
	
	public Float getNewMRPPrice() {
		return newMRPPrice;
	}
	public void setNewMRPPrice(Float newMRPPrice) {
		this.newMRPPrice = newMRPPrice;
	}
	public boolean isPacked() {
		return packed;
	}
	public void setPacked(boolean packed) {
		this.packed = packed;
	}
	public String getProductDescription() {
		return productDescription;
	}
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
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
	public String getUomLabel() {
		return uomLabel;
	}
	public void setUomLabel(String uomLabel) {
		this.uomLabel = uomLabel;
	}
	public String getSkuImage() {
		return skuImage;
	}
	public void setSkuImage(String skuImage) {
		this.skuImage = skuImage;
	}
	public Float getTaxValue() {
		return taxValue;
	}
	public void setTaxValue(Float taxValue) {
		this.taxValue = taxValue;
	}
	public boolean isEditable() {
		return editable;
	}
	public void setEditable(boolean editable) {
		this.editable = editable;
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
	public String getUpdated_date() {
		return updated_date;
	}
	public void setUpdated_date(String updated_date) {
		this.updated_date = updated_date;
	}
	public String getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}
	public float getSoldQty() {
		return soldQty;
	}
	public void setSoldQty(float soldQty) {
		this.soldQty = soldQty;
	}
	public String getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}
	public String getPluCode() {
		return pluCode;
	}
	public String getHsnCode() {
		return hsnCode;
	}
	public String getUtility() {
		return utility;
	}
	public void setUtility(String utility) {
		this.utility = utility;
	}
	public void setHsnCode(String hsnCode) {
		this.hsnCode = hsnCode;
	}
	public float getPrvIndentQty() {
		return prvIndentQty;
	}
	public void setPrvIndentQty(float prvIndentQty) {
		this.prvIndentQty = prvIndentQty;
	}
	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
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
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public String getTaxCode() {
		return taxCode;
	}
 
	public float getItemWiseDiscountAmt() {
		return itemWiseDiscountAmt;
	}
	public void setItemWiseDiscountAmt(float itemWiseDiscountAmt) {
		this.itemWiseDiscountAmt = itemWiseDiscountAmt;
	}
	public boolean isItemTaxExclusive() {
		return itemTaxExclusive;
	}
	public void setItemTaxExclusive(boolean itemTaxExclusive) {
		this.itemTaxExclusive = itemTaxExclusive;
	}
	public boolean isZeroStock() {
		return zeroStock;
	}
	public void setZeroStock(boolean zeroStock) {
		this.zeroStock = zeroStock;
	}
	public void setTaxCode(String taxCode) {
		this.taxCode = taxCode;
	}
	
	public String getBrandCode() {
		return brandCode;
	}
	public boolean isManufacturedItem() {
		return manufacturedItem;
	}
	public void setManufacturedItem(boolean manufacturedItem) {
		this.manufacturedItem = manufacturedItem;
	}
	public String getStyleRange() {
		return styleRange;
	}
	public void setStyleRange(String styleRange) {
		this.styleRange = styleRange;
	}
	public String getAlternatePluCode() {
		return alternatePluCode;
	}
	public void setAlternatePluCode(String alternatePluCode) {
		this.alternatePluCode = alternatePluCode;
	}
	public String getConfirmPromptPrice() {
		return confirmPromptPrice;
	}
	public void setConfirmPromptPrice(String confirmPromptPrice) {
		this.confirmPromptPrice = confirmPromptPrice;
	}
	public Date getEffectiveFromDate() {
		return effectiveFromDate;
	}
	public void setEffectiveFromDate(Date effectiveFromDate) {
		this.effectiveFromDate = effectiveFromDate;
	}
	public String getManufactureId() {
		return manufactureId;
	}
	public void setManufactureId(String manufactureId) {
		this.manufactureId = manufactureId;
	}
	public String getPackageId() {
		return packageId;
	}
	public void setPackageId(String packageId) {
		this.packageId = packageId;
	}
	public String getRfidTag() {
		return rfidTag;
	}
	public void setRfidTag(String rfidTag) {
		this.rfidTag = rfidTag;
	}
	/*public Date getWarrantyPeriod() {
		return warrantyPeriod;
	}
	public void setWarrantyPeriod(Date warrantyPeriod) {
		this.warrantyPeriod = warrantyPeriod;
	}*/
	public String getProductBatchNo() {
		return productBatchNo;
	}
	public void setProductBatchNo(String productBatchNo) {
		this.productBatchNo = productBatchNo;
	}
	public String getProductSerNo() {
		return productSerNo;
	}
	public void setProductSerNo(String productSerNo) {
		this.productSerNo = productSerNo;
	}
	public Date getManufacturedDate() {
		return manufacturedDate;
	}
	public Double getAvailableQty() {
		return availableQty;
	}
	public void setAvailableQty(Double availableQty) {
		this.availableQty = availableQty;
	}
	public void setManufacturedDate(Date manufacturedDate) {
		this.manufacturedDate = manufacturedDate;
	}
	public String getSetCode() {
		return setCode;
	}
	public void setSetCode(String setCode) {
		this.setCode = setCode;
	}
	public void setBrandCode(String brandCode) {
		this.brandCode = brandCode;
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
	public List<SkuTax> getTax() {
		return tax;
	}
	public void setTax(List<SkuTax> tax) {
		this.tax = tax;
	}
	public String getUom() {
		return uom;
	}
	public void setUom(String uom) {
		this.uom = uom;
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
	
	
	public Float getQuantity() {
		return quantity;
	}
	public void setQuantity(Float quantity) {
		this.quantity = quantity;
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
	public Date getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}
	public String getEan() {
		return ean;
	}
	public void setEan(String ean) {
		this.ean = ean;
	}
	public String getAcp() {
		return acp;
	}
	public void setAcp(String acp) {
		this.acp = acp;
	}
	public Date getUpdatedDate() {
		return updatedDate;
	}
	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public Float getWsPrice() {
		return wsPrice;
	}
	public void setWsPrice(Float wsPrice) {
		this.wsPrice = wsPrice;
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
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public int getMbq() {
		return mbq;
	}
	public void setMbq(int mbq) {
		this.mbq = mbq;
	}
	public Float getExtraPrice() {
		return extraPrice;
	}
	public void setExtraPrice(Float extraPrice) {
		this.extraPrice = extraPrice;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getProductSubClass() {
		return productSubClass;
	}
	public void setProductSubClass(String productSubClass) {
		this.productSubClass = productSubClass;
	}
	public String getProductClass() {
		return productClass;
	}
	public void setProductClass(String productClass) {
		this.productClass = productClass;
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
	public Float getNewSalePrice() {
		return newSalePrice;
	}
	public void setNewSalePrice(Float newSalePrice) {
		this.newSalePrice = newSalePrice;
	}
	public String getStoreLocation() {
		return storeLocation;
	}
	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}
	
	
}
