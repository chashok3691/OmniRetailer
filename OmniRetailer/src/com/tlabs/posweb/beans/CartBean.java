package com.tlabs.posweb.beans;


/**
*Creation date:	12/01/2016
*Created by: Satheesh
*Last updated on:
*Updated by:
*Verified by:
*Purpose: This class contain the information about the cart.
*/
public class CartBean {
	private String productId;
	private String  productPrice;
	private String  productName;
	private String  category;
	private String  stock;
	private String  quantity;
	private String  taxCode;
	private String  taxValue;
	private String  pluCode;//important
	private String  skuID;
	private String  totalPrice;
	private String  totalTax;
	private String  requiredQuantity;
	private String  productDescription;//important
	private String  sell_UOM;
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getStock() {
		return stock;
	}
	public void setStock(String stock) {
		this.stock = stock;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getTaxCode() {
		return taxCode;
	}
	public void setTaxCode(String taxCode) {
		this.taxCode = taxCode;
	}
	public String getPluCode() {
		return pluCode;
	}
	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}
	public String getSkuID() {
		return skuID;
	}
	public void setSkuID(String skuID) {
		this.skuID = skuID;
	}
	public String getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getRequiredQuantity() {
		return requiredQuantity;
	}
	public void setRequiredQuantity(String requiredQuantity) {
		this.requiredQuantity = requiredQuantity;
	}
	public String getProductDescription() {
		return productDescription;
	}
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}
	public String getTaxValue() {
		return taxValue;
	}
	public void setTaxValue(String taxValue) {
		this.taxValue = taxValue;
	}
	public String getTotalTax() {
		return totalTax;
	}
	public void setTotalTax(String totalTax) {
		this.totalTax = totalTax;
	}
	public String getSell_UOM() {
		return sell_UOM;
	}
	public void setSell_UOM(String sell_UOM) {
		this.sell_UOM = sell_UOM;
	}
	
	
}
