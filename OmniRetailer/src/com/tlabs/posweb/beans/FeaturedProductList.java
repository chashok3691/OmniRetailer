package com.tlabs.posweb.beans;

public class FeaturedProductList {

	private Integer sno;
	private String featuredGrpId;
	private String skuImage;
	private String productDescription;
	private String skuId;
	private String featuredText;
	private String skuImageRefId;
	private boolean skuImageFlag;

	public String getFeaturedGrpId() {
		return featuredGrpId;
	}
	public void setFeaturedGrpId(String featuredGrpId) {
		this.featuredGrpId = featuredGrpId;
	}
	public String getSkuImage() {
		return skuImage;
	}
	public void setSkuImage(String skuImage) {
		this.skuImage = skuImage;
	}
	public String getProductDescription() {
		return productDescription;
	}
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}
	public String getSkuId() {
		return skuId;
	}
	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}
	public String getSkuImageRefId() {
		return skuImageRefId;
	}
	public void setSkuImageRefId(String skuImageRefId) {
		this.skuImageRefId = skuImageRefId;
	}
	public boolean isSkuImageFlag() {
		return skuImageFlag;
	}
	public void setSkuImageFlag(boolean skuImageFlag) {
		this.skuImageFlag = skuImageFlag;
	}
	public String getFeaturedText() {
		return featuredText;
	}
	public void setFeaturedText(String featuredText) {
		this.featuredText = featuredText;
	}
	public Integer getSno() {
		return sno;
	}
	public void setSno(Integer sno) {
		this.sno = sno;
	}
	
}
