package com.tlabs.posweb.beans;

//import java.util.Date;
import java.util.List;
import java.util.Map;



public class WarehousePurchaseOrderShipmentLocations {


	
	private int sno;
	
	private String purchaseOrderId;
	
	Map<String, List<WarehousePurchaseOrderShipmentLocations>> storeLocationsList ;
	private String skuId;
	

	private String skuName;
	

	private String pluCode;
	

	private Float skuPrice;
	

	private String storeLocation;
	

	private float quantity;
	

	private String remarks;
	

	/*private Date date;*/

	private String dateStr;
	

	private String quantityStr;
	

	private String skuPriceStr;
	

	private RequestHeader requestHeader;

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public String getPurchaseOrderId() {
		return purchaseOrderId;
	}

	public void setPurchaseOrderId(String purchaseOrderId) {
		this.purchaseOrderId = purchaseOrderId;
	}

	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}

	public String getSkuName() {
		return skuName;
	}

	public void setSkuName(String skuName) {
		this.skuName = skuName;
	}

	public String getPluCode() {
		return pluCode;
	}

	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}

	 
	public String getStoreLocation() {
		return storeLocation;
	}

	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}

	public float getQuantity() {
		return quantity;
	}

	public void setQuantity(float quantity) {
		this.quantity = quantity;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}



	public String getDateStr() {
		return dateStr;
	}

	public void setDateStr(String dateStr) {
		this.dateStr = dateStr;
	}

	public String getQuantityStr() {
		return quantityStr;
	}

	public void setQuantityStr(String quantityStr) {
		this.quantityStr = quantityStr;
	}

	public String getSkuPriceStr() {
		return skuPriceStr;
	}

	public void setSkuPriceStr(String skuPriceStr) {
		this.skuPriceStr = skuPriceStr;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public Float getSkuPrice() {
		return skuPrice;
	}

	public void setSkuPrice(Float skuPrice) {
		this.skuPrice = skuPrice;
	}


}
