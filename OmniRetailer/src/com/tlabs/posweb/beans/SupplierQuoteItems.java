package com.tlabs.posweb.beans;


/*
 * Author:Karthik K
 * createdOn:27-12-2016
*/
/*@Entity
@Table(name="supplier_quote_items")*/
public class SupplierQuoteItems {
	//@Id
	//@GenericGenerator(name="increment",strategy="org.hibernate.id.IncrementGenerator")
	//@GeneratedValue(generator="increment")
	//@Column(name="")
	private Float leadTime;
	public Float getLeadTime() {
		return leadTime;
	}

	public void setLeadTime(Float leadTime) {
		this.leadTime = leadTime;
	}

	public Float getSupplyQty() {
		return supplyQty;
	}

	public void setSupplyQty(Float supplyQty) {
		this.supplyQty = supplyQty;
	}

	private Float supplyQty;

	private int sno;
	
//	@Column(name="item_id")
	private String itemId;
	
	//@Column(name="item_description")
	private String itemDescription;
	
	//@Column(name="color")
	private String color;
	
	//@Column(name="size")
	private String size;
	
	//@Column(name="unit_of_measurement")
	private String unitOfMeasurement;
	
	//@Column(name="quote_ref")
	private String quoteRef;
	
	//@Column(name="price")
	private Float price;
	
	//@Column(name="quantity")
	private Float quantity;
	
	//@Column(name="total")
	private Float total;
	
	//@Column(name="sku_id")
	private String skuId;
	
	//@Column(name="model")
	private String model;
	
	//@Column(name="make")
	private String make;
	
	//@Column(name="plu_code")
	private String pluCode;
	
	//@Column(name="remarks")
	private String remarks;
	
	//@Column(name="demand_fore_cast")
	private Float demandForeCast;
	
	//@Column(name="min_qty")
	private Float minQty;
	private String priceStr;
	public String getPriceStr() {
		return priceStr;
	}

	public void setPriceStr(String priceStr) {
		this.priceStr = priceStr;
	}

	public String getQuantityStr() {
		return quantityStr;
	}

	public void setQuantityStr(String quantityStr) {
		this.quantityStr = quantityStr;
	}

	public String getTotalStr() {
		return totalStr;
	}

	public void setTotalStr(String totalStr) {
		this.totalStr = totalStr;
	}

	private String quantityStr;
	private String totalStr;
	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	public String getItemDescription() {
		return itemDescription;
	}

	public void setItemDescription(String itemDescription) {
		this.itemDescription = itemDescription;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getUnitOfMeasurement() {
		return unitOfMeasurement;
	}

	public void setUnitOfMeasurement(String unitOfMeasurement) {
		this.unitOfMeasurement = unitOfMeasurement;
	}

	public String getQuoteRef() {
		return quoteRef;
	}

	public void setQuoteRef(String quoteRef) {
		this.quoteRef = quoteRef;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Float getQuantity() {
		return quantity;
	}

	public void setQuantity(Float quantity) {
		this.quantity = quantity;
	}

	public Float getTotal() {
		return total;
	}

	public void setTotal(Float total) {
		this.total = total;
	}

	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getMake() {
		return make;
	}

	public void setMake(String make) {
		this.make = make;
	}

	public String getPluCode() {
		return pluCode;
	}

	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Float getDemandForeCast() {
		return demandForeCast;
	}

	public void setDemandForeCast(Float demandForeCast) {
		this.demandForeCast = demandForeCast;
	}

	public Float getMinQty() {
		return minQty;
	}

	public void setMinQty(Float minQty) {
		this.minQty = minQty;
	}
	
	
	

}
