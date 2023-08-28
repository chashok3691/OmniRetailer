/*
 * 
 */
package com.tlabs.posweb.beans;

import java.util.List;



// TODO: Auto-generated Javadoc
/**
 * The Class GetBillsResponse.
 */
public class GetStockVerificationDetailsResponse {

	/** The response header. */
	private ResponseHeader responseHeader;

	/** The bills list. */
	private List<StoreStockVerificationItems> verificationItemsList;

	private WareHouseStockVerification warehouseStockVerification;
	
	private List<WareHouseStockVerification> whVerificationList;
	
	private String totalRecords;
	
	public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

	private float totalItemsSalePriceVarienceValue;
	private float totalItemCostPriceVarienceValue;
	private float totalItemsMrpPriceVarienceValue;
	private float totalItemsVarienceQty;
	private float totalItemsSalePriceValue;
	private float totalItemCostPriceValue;
	private float totalItemsMrpPriceValue;
	private List<StoreStockVerificationPosting> stockPostingDetails;
	
	public List<StoreStockVerificationPosting> getStockPostingDetails() {
		return stockPostingDetails;
	}

	public void setStockPostingDetails(List<StoreStockVerificationPosting> stockPostingDetails) {
		this.stockPostingDetails = stockPostingDetails;
	}

	private List<StoreStockVerificationItems> verificationItemDetails;
	private List<WareHouseStockVerificationItems> wareHouseStockVerificationItems;
	private List<WHStockVerificationPosting> whStockVerificationPostingDetails;
	
	public List<WHStockVerificationPosting> getWhStockVerificationPostingDetails() {
		return whStockVerificationPostingDetails;
	}

	public void setWhStockVerificationPostingDetails(List<WHStockVerificationPosting> whStockVerificationPostingDetails) {
		this.whStockVerificationPostingDetails = whStockVerificationPostingDetails;
	}

	public List<WareHouseStockVerificationItems> getWareHouseStockVerificationItems() {
		return wareHouseStockVerificationItems;
	}

	public void setWareHouseStockVerificationItems(List<WareHouseStockVerificationItems> wareHouseStockVerificationItems) {
		this.wareHouseStockVerificationItems = wareHouseStockVerificationItems;
	}

	private List<StoreStockVerification> verificationList;
	private StoreStockVerification stockVerificationObj;

	private List<WareHouseStockVerificationItems> itemsList;
	public WareHouseStockVerification getWarehouseStockVerification() {
		return warehouseStockVerification;
	}

	public void setWarehouseStockVerification(WareHouseStockVerification warehouseStockVerification) {
		this.warehouseStockVerification = warehouseStockVerification;
	}

	
	
	/*public List<StoreStockVerificationPosting> getStockPostingDetails() {
		return stockPostingDetails;
	}

	public void setStockPostingDetails(List<StoreStockVerificationPosting> stockPostingDetails) {
		this.stockPostingDetails = stockPostingDetails;
	}
*/
	
	public List<StoreStockVerificationItems> getVerificationItemDetails() {
		return verificationItemDetails;
	}

	public void setVerificationItemDetails(List<StoreStockVerificationItems> verificationItemDetails) {
		this.verificationItemDetails = verificationItemDetails;
	}

	/**
	 * Gets the response header.
	 *
	 * @return the response header
	 */
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	/**
	 * Sets the response header.
	 *
	 * @param responseHeader
	 *            the new response header
	 */
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public List<WareHouseStockVerification> getWhVerificationList() {
		return whVerificationList;
	}

	public void setWhVerificationList(List<WareHouseStockVerification> whVerificationList) {
		this.whVerificationList = whVerificationList;
	}


	public float getTotalItemsSalePriceVarienceValue() {
		return totalItemsSalePriceVarienceValue;
	}

	public void setTotalItemsSalePriceVarienceValue(float totalItemsSalePriceVarienceValue) {
		this.totalItemsSalePriceVarienceValue = totalItemsSalePriceVarienceValue;
	}

	public float getTotalItemCostPriceVarienceValue() {
		return totalItemCostPriceVarienceValue;
	}

	public void setTotalItemCostPriceVarienceValue(float totalItemCostPriceVarienceValue) {
		this.totalItemCostPriceVarienceValue = totalItemCostPriceVarienceValue;
	}

	public float getTotalItemsMrpPriceVarienceValue() {
		return totalItemsMrpPriceVarienceValue;
	}

	public void setTotalItemsMrpPriceVarienceValue(float totalItemsMrpPriceVarienceValue) {
		this.totalItemsMrpPriceVarienceValue = totalItemsMrpPriceVarienceValue;
	}

	public float getTotalItemsVarienceQty() {
		return totalItemsVarienceQty;
	}

	public List<StoreStockVerificationItems> getVerificationItemsList() {
		return verificationItemsList;
	}

	public void setVerificationItemsList(List<StoreStockVerificationItems> verificationItemsList) {
		this.verificationItemsList = verificationItemsList;
	}

	public void setTotalItemsVarienceQty(float totalItemsVarienceQty) {
		this.totalItemsVarienceQty = totalItemsVarienceQty;
	}

	public float getTotalItemsSalePriceValue() {
		return totalItemsSalePriceValue;
	}

	public void setTotalItemsSalePriceValue(float totalItemsSalePriceValue) {
		this.totalItemsSalePriceValue = totalItemsSalePriceValue;
	}

	public float getTotalItemCostPriceValue() {
		return totalItemCostPriceValue;
	}

	public void setTotalItemCostPriceValue(float totalItemCostPriceValue) {
		this.totalItemCostPriceValue = totalItemCostPriceValue;
	}

	public float getTotalItemsMrpPriceValue() {
		return totalItemsMrpPriceValue;
	}

	public void setTotalItemsMrpPriceValue(float totalItemsMrpPriceValue) {
		this.totalItemsMrpPriceValue = totalItemsMrpPriceValue;
	}

	public List<StoreStockVerification> getVerificationList() {
		return verificationList;
	}

	public void setVerificationList(List<StoreStockVerification> verificationList) {
		this.verificationList = verificationList;
	}

	public StoreStockVerification getStockVerificationObj() {
		return stockVerificationObj;
	}

	public List<WareHouseStockVerificationItems> getItemsList() {
		return itemsList;
	}

	public void setItemsList(List<WareHouseStockVerificationItems> itemsList) {
		this.itemsList = itemsList;
	}

	public void setStockVerificationObj(StoreStockVerification stockVerificationObj) {
		this.stockVerificationObj = stockVerificationObj;
	}

 

}
