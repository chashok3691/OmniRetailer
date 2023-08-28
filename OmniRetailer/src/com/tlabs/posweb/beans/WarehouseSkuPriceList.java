package com.tlabs.posweb.beans;

import java.util.Date;
import java.util.List;
/*
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
*/
import com.tlabs.posweb.beans.SkuTax;

//@Entity
//@Table(name = "warehouse_sku_price_list")
public class WarehouseSkuPriceList {

	//@Id
	//@Column(name = "auto_num")
	//@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer autoNum;
	private String productName;
	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	//@Column(name = "sku_id")
	private String skuId;

	//@Column(name = "cost_price")
	private Float costPrice;

	//@Column(name = "price")
	private Float price;

	//@Column(name = "sale_price")
	private Float salePrice;

	public Integer getAutoNum() {
		return autoNum;
	}

	//@Column(name = "wholesale_price")
	private Float wholesalePrice;

	//@Column(name = "extra_price")
	private Float extraPrice;

	//@Column(name = "plu_code")
	private String pluCode;
	private String materialType;
	private String expiryDateStr;
	

	//@Column(name = "created_date")
	//private Date createdDate;

	//@Column(name = "updated_date")
	//private Date updatedDate;

	//@Column(name = "expiry_date")
	//private Date expiryDate;

	//@Column(name = "best_before_date")
//	private Date bestBefore;
	
	private String business_category;
	private String section;
    private String business_sub_category;
	private String technical_specification;
	private String productClass;
	private String productSubClass;
	private Float stock;

	private boolean sku_status;
	
	
	
	
	public boolean isSku_status() {
		return sku_status;
	}

	public void setSku_status(boolean sku_status) {
		this.sku_status = sku_status;
	}

	public String getBusiness_category() {
		return business_category;
	}

	public void setBusiness_category(String business_category) {
		this.business_category = business_category;
	}

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}

	public String getBusiness_sub_category() {
		return business_sub_category;
	}

	public void setBusiness_sub_category(String business_sub_category) {
		this.business_sub_category = business_sub_category;
	}

	public String getTechnical_specification() {
		return technical_specification;
	}

	public void setTechnical_specification(String technical_specification) {
		this.technical_specification = technical_specification;
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

	public Float getStock() {
		return stock;
	}

	public void setStock(Float stock) {
		this.stock = stock;
	}

	public String getMaterialType() {
		return materialType;
	}

	public String getExpiryDateStr() {
		return expiryDateStr;
	}

	public void setExpiryDateStr(String expiryDateStr) {
		this.expiryDateStr = expiryDateStr;
	}

	public void setMaterialType(String materialType) {
		this.materialType = materialType;
	}

	//@Column(name = "size")
	private String size;

	//@Column(name = "color")
	private String color;

	//@Column(name = "color_shade")
	private String colorShade;

	//@Column(name = "mbq")
	private String mbq;

	//@Column(name = "quantity_in_hand")
	private Double quantityInHand;

	//@Column(name = "acp")
	private String acp;

	//@Column(name = "description")
	private String description;

	//@Column(name = "ean")
	private String ean;

	//@Column(name = "store_location")
	private String storeLocation;

	/* Added by Chandrasekhar for get products */
	//@Column(name = "blocked_quantity")
	private Float blockedQuantity;

	//@Column(name = "scraped_quantity")
	private Float scrapedQuantity;

	private String storeLocationId;
	/*Added by Karthik k  */

	private  boolean zeroStockBilling;
	
	
	
	public boolean isZeroStockBilling() {
		return zeroStockBilling;
	}

	public void setZeroStockBilling(boolean zeroStockBilling) {
		this.zeroStockBilling = zeroStockBilling;
	}

	public String getStoreLocationId() {
		return storeLocationId;
	}

	public void setStoreLocationId(String storeLocationId) {
		this.storeLocationId = storeLocationId;
	}

	//@Column(name = "style_range")
	private String styleRange;

	//@Column(name = "alternate_plucode")
	private String alternatePluCode;

	//@Column(name = "conf_price")
	private String confirmPromptPrice;

	//@Column(name = "effective_from_date")
  private Date effectiveFromDate;

	//@Column(name = "product_range")
	private String productRange;

	//@Column(name = "measure_range")
	private String measureRange;

	//@Column(name = "manufacture_id")
	private String manufactureId;

	//@Column(name = "package_id")
	private String packageId;

	//@Column(name = "rfid_tag")
	private String rfidTag;

	//@Column(name = "warranty_period")
	//private Date warrantyPeriod;

	//@Column(name = "product_batch_no")
	private String productBatchNo;

	//@Column(name = "product_ser_no")
	private String productSerNo;

	//@Column(name = "manufactured_date")
	private Date manufacturedDate;

	//@Column(name = "set_code")
	private String setCode;
	
	
	
	
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

/*	public Date getWarrantyPeriod() {
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

	public void setManufacturedDate(Date manufacturedDate) {
		this.manufacturedDate = manufacturedDate;
	}

	public String getSetCode() {
		return setCode;
	}

	public void setSetCode(String setCode) {
		this.setCode = setCode;
	}
	
	

	//@Transient
	private List<SkuTax> tax;
	//@Transient
	private String taxCode;
	//@Transient
	private String startIndex;
	//@Transient
	private String totalRecords;
	//@Transient
	private String make;
	//@Transient
	private String model;
	//@Transient
	private String created_date;
	//@Transient
	private String updated_date;
	//@Transient
	private String expiry_date;
	//@Transient
	private boolean editable;
	//@Transient
	private String uom;
	//@Transient
	private String skuImage;

	public String getSkuImage() {
		return skuImage;
	}

	public void setSkuImage(String skuImage) {
		this.skuImage = skuImage;
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

	public String getUom() {
		return uom;
	}

	public void setUom(String uom) {
		this.uom = uom;
	}

	public boolean isEditable() {
		return editable;
	}

	public void setEditable(boolean editable) {
		this.editable = editable;
	}

/*	public Date getBestBefore() {
		return bestBefore;
	}

	public void setBestBefore(Date bestBefore) {
		this.bestBefore = bestBefore;
	}*/

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

	public String getStoreLocation() {
		return storeLocation;
	}

	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
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

	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}

	public void setAutoNum(Integer autoNum) {
		this.autoNum = autoNum;
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
/*
	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public Date getExpiryDate() {
		return expiryDate;
	}

	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}*/

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

	public Double getQuantityInHand() {
		return quantityInHand;
	}

	public void setQuantityInHand(Double quantityInHand) {
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
