package com.tlabs.posweb.beans;

import java.util.Date;
import java.util.List;


/*
 * Created By: Prashant Punna
 * Created On: 24-April-2016
 * Modified By:
 * Modified On:
 * Description:
 */

public class SkuPriceListRawMaterial {

	private int autoNum;
	
	private String skuId;
	
	private Float costPrice;
	
	private Float price;
	
	private Float salePrice;
	
	private Float wholesalePrice;
	
	private Float extraPrice;
	
	private String pluCode;
	
	private Date createdDate;
	
	private Date updatedDate;
	
	private Date expiryDate;
	
	private Date bestBefore;
	
	
	private String size;
	
	
	
	private String color;
	
	private String colorShade;
	
	private String mbq;
	
	private Double quantityInHand;
	
	private String acp;
	
	private String description;
	
	private String ean;
	
	private String storeLocation;
	
	/* Added by Chandrasekhar for get products */
	private Float blockedQuantity;

	private Float scrapedQuantity;
	
	private List<SkuTax> tax;
	private String taxCode;
	private String startIndex;
	private String totalRecords;
	private String make;
	private String model;
	private String created_date;
	private String updated_date;
	private String expiry_date;
	private boolean editable;
	private String uom;
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
	public Date getBestBefore() {
		return bestBefore;
	}
	public void setBestBefore(Date bestBefore) {
		this.bestBefore = bestBefore;
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
	
}
