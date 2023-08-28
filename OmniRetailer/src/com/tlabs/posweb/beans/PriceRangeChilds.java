package com.tlabs.posweb.beans;

/**
 * @author Karthik k
 *
 */

public class PriceRangeChilds {

	private Integer sno;
	
	
	private String productCategory;
	
	
	private String productBrand;
	
	
	private String productModal;
	

	private String skuId;
	
	
	private Float startPrice;
	
	
	private Float endPrice;
	

	private String priceRangeRef;
	
	
	
	public String getPriceRangeRef() {
		return priceRangeRef;
	}
	public void setPriceRangeRef(String priceRangeRef) {
		this.priceRangeRef = priceRangeRef;
	}
	public Integer getSno() {
		return sno;
	}
	public void setSno(Integer sno) {
		this.sno = sno;
	}
	public String getProductCategory() {
		return productCategory;
	}
	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}
	public String getProductBrand() {
		return productBrand;
	}
	public void setProductBrand(String productBrand) {
		this.productBrand = productBrand;
	}
	public String getProductModal() {
		return productModal;
	}
	public void setProductModal(String productModal) {
		this.productModal = productModal;
	}
	public String getSkuId() {
		return skuId;
	}
	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}
	public Float getStartPrice() {
		return startPrice;
	}
	public void setStartPrice(Float startPrice) {
		this.startPrice = startPrice;
	}
	public Float getEndPrice() {
		return endPrice;
	}
	public void setEndPrice(Float endPrice) {
		this.endPrice = endPrice;
	}
}
