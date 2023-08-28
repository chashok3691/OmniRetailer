package com.tlabs.posweb.beans;

import java.util.List;

/**
 * @author Mythri
 *
 */
public class Products {
	private String productName = "";
	private String productId = "";
	private String category = "";
	private String primary_supplier = "";
	private Double buy_unit_price = 0.0;
	private Double sell_unit_price = 0.0;
	private String totalRecords;
	private String startValue;
	private List<ProductsList> skuList;
	private String product_description = "";
	private String categoryDescription = "";
	private String subCategoryDescription = "";
	private int slNo;
	
	public int getSlNo() {
		return slNo;
	}
	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}
	
	public String getSubCategoryDescription() {
		return subCategoryDescription;
	}
	public void setSubCategoryDescription(String subCategoryDescription) {
		this.subCategoryDescription = subCategoryDescription;
	}
	public String getCategoryDescription() {
		return categoryDescription;
	}
	public void setCategoryDescription(String categoryDescription) {
		this.categoryDescription = categoryDescription;
	}
	public String getProduct_description() {
		return product_description;
	}
	public void setProduct_description(String product_description) {
		this.product_description = product_description;
	}
	public List<ProductsList> getSkuList() {
		return skuList;
	}
	public void setSkuList(List<ProductsList> skuList) {
		this.skuList = skuList;
	}
	public String getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}
	public String getStartValue() {
		return startValue;
	}
	public void setStartValue(String startValue) {
		this.startValue = startValue;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPrimary_supplier() {
		return primary_supplier;
	}
	public void setPrimary_supplier(String primary_supplier) {
		this.primary_supplier = primary_supplier;
	}
	public Double getBuy_unit_price() {
		return buy_unit_price;
	}
	public void setBuy_unit_price(Double buy_unit_price) {
		this.buy_unit_price = buy_unit_price;
	}
	public Double getSell_unit_price() {
		return sell_unit_price;
	}
	public void setSell_unit_price(Double sell_unit_price) {
		this.sell_unit_price = sell_unit_price;
	}
	
}
