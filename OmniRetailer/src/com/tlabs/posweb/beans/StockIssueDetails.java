package com.tlabs.posweb.beans;

public class StockIssueDetails {

	private int S_No;
	private String issue_id;
	private String item;
	private String description;
	private Float quantity;
	private Float price;
	private float salePrice;
	private float avlQty;
	private Float cost;
	private int issued;
	private int recieved;
	private int rejected;
	private int max_quantity;
	private String skuId;
    private String uOM;
    private String uom;
    private String pluCode;
    private String stockRequestId;
    private String fromLocation;
    private String deliveryDateStr;
    private String deliveredBy;
    private String inspectedBy;
    private String receivedBy;
    private String indentedBy;
    private Float requestedQty;
    private Float issuedQty;
    private Float indentQty;
    private Float actualQty;
    private String productRange;
    private String measurementRange;
    private String category;
    private String brand;
    private String color;
    private String size;
    private String ean;
    private String utility;
    private boolean trackingRequired;
    private float taxRate;
    private float cgstValue;
    private float sgstValue;
    private float igstValue;
    private String hsnCode;
    private String packageReference;
    
    private boolean manufactured;
    
    private String batchNumber;
    
    
    
    
    

	public String getBatchNumber() {
		return batchNumber;
	}

	public void setBatchNumber(String batchNumber) {
		this.batchNumber = batchNumber;
	}

	public boolean isManufactured() {
		return manufactured;
	}

	public void setManufactured(boolean manufactured) {
		this.manufactured = manufactured;
	}

	public String getPackageReference() {
		return packageReference;
	}

	public void setPackageReference(String packageReference) {
		this.packageReference = packageReference;
	}

	public float getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(float salePrice) {
		this.salePrice = salePrice;
	}

	public float getTaxRate() {
		return taxRate;
	}

	public void setTaxRate(float taxRate) {
		this.taxRate = taxRate;
	}

	public float getCgstValue() {
		return cgstValue;
	}

	public void setCgstValue(float cgstValue) {
		this.cgstValue = cgstValue;
	}

	public float getSgstValue() {
		return sgstValue;
	}

	public void setSgstValue(float sgstValue) {
		this.sgstValue = sgstValue;
	}

	public float getIgstValue() {
		return igstValue;
	}

	public void setIgstValue(float igstValue) {
		this.igstValue = igstValue;
	}

	public String getHsnCode() {
		return hsnCode;
	}

	public void setHsnCode(String hsnCode) {
		this.hsnCode = hsnCode;
	}

	public boolean isTrackingRequired() {
		return trackingRequired;
	}

	public void setTrackingRequired(boolean trackingRequired) {
		this.trackingRequired = trackingRequired;
	}

	private String itemScanCode;
    
	public String getItemScanCode() {
		return itemScanCode;
	}

	public void setItemScanCode(String itemScanCode) {
		this.itemScanCode = itemScanCode;
	}

	public String getDeliveryDateStr() {
		return deliveryDateStr;
	}

	public void setDeliveryDateStr(String deliveryDateStr) {
		this.deliveryDateStr = deliveryDateStr;
	}

	public String getDeliveredBy() {
		return deliveredBy;
	}

	public void setDeliveredBy(String deliveredBy) {
		this.deliveredBy = deliveredBy;
	}

	public String getInspectedBy() {
		return inspectedBy;
	}

	public void setInspectedBy(String inspectedBy) {
		this.inspectedBy = inspectedBy;
	}

	public String getReceivedBy() {
		return receivedBy;
	}

	public void setReceivedBy(String receivedBy) {
		this.receivedBy = receivedBy;
	}

	public String getFromLocation() {
		return fromLocation;
	}

	public void setFromLocation(String fromLocation) {
		this.fromLocation = fromLocation;
	}

	public String getStockRequestId() {
		return stockRequestId;
	}

	public void setStockRequestId(String stockRequestId) {
		this.stockRequestId = stockRequestId;
	}

	public String getPluCode() {
		return pluCode;
	}

	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}

	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}

	public String getuOM() {
		return uOM;
	}

	public void setuOM(String uOM) {
		this.uOM = uOM;
	}
	
	
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
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



	

	public String getIndentedBy() {
		return indentedBy;
	}

	public void setIndentedBy(String indentedBy) {
		this.indentedBy = indentedBy;
	}

	public Float getRequestedQty() {
		return requestedQty;
	}

	public void setRequestedQty(Float requestedQty) {
		this.requestedQty = requestedQty;
	}



	public Float getIssuedQty() {
		return issuedQty;
	}

	public void setIssuedQty(Float issuedQty) {
		this.issuedQty = issuedQty;
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

	public Float getActualQty() {
		return actualQty;
	}

	public void setActualQty(Float actualQty) {
		this.actualQty = actualQty;
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

	public String getUom() {
		return uom;
	}

	public void setUom(String uom) {
		this.uom = uom;
	}

	

	public float getAvlQty() {
		return avlQty;
	}

	public void setAvlQty(float avlQty) {
		this.avlQty = avlQty;
	}

	public String getEan() {
		return ean;
	}

	public void setEan(String ean) {
		this.ean = ean;
	}

	public String getUtility() {
		return utility;
	}

	public void setUtility(String utility) {
		this.utility = utility;
	}
}
