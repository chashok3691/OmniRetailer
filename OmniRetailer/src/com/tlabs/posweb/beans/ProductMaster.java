package com.tlabs.posweb.beans;

import java.util.ArrayList;
import java.util.List;

public class ProductMaster {
	
	private RequestHeader requestHeader;
	private String productId = "";
	private String productName = "";
	private String product_description = "";
	private String category = "";
	private String sub_category = "";
	private String storage_location = "";
	private String abc_category = "";
	private String warehouse_stocking_unit = "";
	private String retail_stocking_unit = "";
	private Integer lead_time_days = 0;
	private String primary_supplier = "";
	private String buy_UOM = "";
	private Double buy_unit_price = 0.0;
	private String sell_UOM = "";
	private Double sell_unit_price = 0.0;
	private String stock_in_hand = "";
	private String warehouse = "";
	private Double min_stock = 0.0;
	private Double max_stock = 0.0;
	private String  re_order_point = "";
	private String taxable = null;
	private String  asset_category = "";
	private ArrayList<ProductSuppliers> productSuppliers;
	private ArrayList<ProductStores> productStores;
	private String pageNo ="";
	private List<String> productIds;
	private String searchCriteria;
	private String maxRecords;
	
	public String getSearchCriteria() {
		return searchCriteria;
	}
	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	public List<String> getProductIds() {
		return productIds;
	}
	public void setProductIds(List<String> productIds) {
		this.productIds = productIds;
	}
	public String getProduct_description() {
		return product_description;
	}
	public void setProduct_description(String product_description) {
		this.product_description = product_description;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSub_category() {
		return sub_category;
	}
	public void setSub_category(String sub_category) {
		this.sub_category = sub_category;
	}
	public String getStorage_location() {
		return storage_location;
	}
	public void setStorage_location(String storage_location) {
		this.storage_location = storage_location;
	}
	public String getAbc_category() {
		return abc_category;
	}
	public void setAbc_category(String abc_category) {
		this.abc_category = abc_category;
	}
	public String getWarehouse_stocking_unit() {
		return warehouse_stocking_unit;
	}
	public void setWarehouse_stocking_unit(String warehouse_stocking_unit) {
		this.warehouse_stocking_unit = warehouse_stocking_unit;
	}
	public String getRetail_stocking_unit() {
		return retail_stocking_unit;
	}
	public void setRetail_stocking_unit(String retail_stocking_unit) {
		this.retail_stocking_unit = retail_stocking_unit;
	}
	public Integer getLead_time_days() {
		return lead_time_days;
	}
	public void setLead_time_days(Integer lead_time_days) {
		this.lead_time_days = lead_time_days;
	}
	public String getPrimary_supplier() {
		return primary_supplier;
	}
	public void setPrimary_supplier(String primary_supplier) {
		this.primary_supplier = primary_supplier;
	}
	public String getBuy_UOM() {
		return buy_UOM;
	}
	public void setBuy_UOM(String buy_UOM) {
		this.buy_UOM = buy_UOM;
	}
	public Double getBuy_unit_price() {
		return buy_unit_price;
	}
	public void setBuy_unit_price(Double buy_unit_price) {
		this.buy_unit_price = buy_unit_price;
	}
	public String getSell_UOM() {
		return sell_UOM;
	}
	public void setSell_UOM(String sell_UOM) {
		this.sell_UOM = sell_UOM;
	}
	public Double getSell_unit_price() {
		return sell_unit_price;
	}
	public void setSell_unit_price(Double sell_unit_price) {
		this.sell_unit_price = sell_unit_price;
	}
	public String getStock_in_hand() {
		return stock_in_hand;
	}
	public void setStock_in_hand(String stock_in_hand) {
		this.stock_in_hand = stock_in_hand;
	}
	public String getWarehouse() {
		return warehouse;
	}
	public void setWarehouse(String warehouse) {
		this.warehouse = warehouse;
	}
	public Double getMin_stock() {
		return min_stock;
	}
	public void setMin_stock(Double min_stock) {
		this.min_stock = min_stock;
	}
	public Double getMax_stock() {
		return max_stock;
	}
	public void setMax_stock(Double max_stock) {
		this.max_stock = max_stock;
	}
	public String getRe_order_point() {
		return re_order_point;
	}
	public void setRe_order_point(String re_order_point) {
		this.re_order_point = re_order_point;
	}
	public String getTaxable() {
		return taxable;
	}
	public void setTaxable(String taxable) {
		this.taxable = taxable;
	}
	public String getAsset_category() {
		return asset_category;
	}
	public void setAsset_category(String asset_category) {
		this.asset_category = asset_category;
	}
	
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	
	public ArrayList<ProductSuppliers> getProductSuppliers() {
		return productSuppliers;
	}
	public void setProductSuppliers(ArrayList<ProductSuppliers> productSuppliers) {
		this.productSuppliers = productSuppliers;
	}
	public ArrayList<ProductStores> getProductStores() {
		return productStores;
	}
	public void setProductStores(ArrayList<ProductStores> productStores) {
		this.productStores = productStores;
	}
	public String getPageNo() {
		return pageNo;
	}
	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
	}
	public String getMaxRecords() {
		return maxRecords;
	}
	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}
	
	
    
	
}

