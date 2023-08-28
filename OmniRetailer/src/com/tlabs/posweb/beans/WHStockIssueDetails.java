package com.tlabs.posweb.beans;

public class WHStockIssueDetails {

	private int S_No;
	private String issue_id;
	private String item;
	private String description;
	private Float quantity;
	private Float price;
	private Float cost;
	private int issued;
	private int recieved;
	private int rejected;
	private int max_quantity;
	private String skuId;
	private String productRange;
	private String measurementRange;
	private String uom;
	private String category;
	private String brand;
	private String department;
	private Float indentQty; 
	private String pluCode;
	private Float actualQty;
	
	public int getS_No() {
		return S_No;
	}

	public void setS_No(int s_No) {
		S_No = s_No;
	}

	public int getMax_quantity() {
		return max_quantity;
	}

	public void setMax_quantity(int max_quantity) {
		this.max_quantity = max_quantity;
	}

	public int getIssued() {
		return issued;
	}

	public void setIssued(int issued) {
		this.issued = issued;
	}

	public int getRecieved() {
		return recieved;
	}

	public void setRecieved(int recieved) {
		this.recieved = recieved;
	}

	public int getRejected() {
		return rejected;
	}

	public void setRejected(int rejected) {
		this.rejected = rejected;
	}

	public String getIssue_id() {
		return issue_id;
	}

	public void setIssue_id(String issue_id) {
		this.issue_id = issue_id;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
 

	 

	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}

	public String getProductRange() {
		return productRange;
	}

	public void setProductRange(String productRange) {
		this.productRange = productRange;
	}

	public String getMeasurementRange() {
		return measurementRange;
	}

	public void setMeasurementRange(String measurementRange) {
		this.measurementRange = measurementRange;
	}

	public String getUom() {
		return uom;
	}

	public void setUom(String uom) {
		this.uom = uom;
	}

	public String getPluCode() {
		return pluCode;
	}

	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getBrand() {
		return brand;
	}

	public Float getActualQty() {
		return actualQty;
	}

	public void setActualQty(Float actualQty) {
		this.actualQty = actualQty;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public Float getIndentQty() {
		return indentQty;
	}

	public void setIndentQty(Float indentQty) {
		this.indentQty = indentQty;
	}

	public Float getQuantity() {
		return quantity;
	}

	public void setQuantity(Float quantity) {
		this.quantity = quantity;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Float getCost() {
		return cost;
	}

	public void setCost(Float cost) {
		this.cost = cost;
	}
}
