package com.tlabs.posweb.beans;



public class MaterialIssueItems {

	private Integer sno;

	private String issueRef;
	
	private String itemCode;
	
	private String itemDescription;
	
	private String itemUom;
 
	private float itemPrice;
	
	private float itemReqQty;
	
	private float issueQty;
	
	private float itemsCost;
	
	private String storageLocation;

	private String itemPluCode;
	
	private String measureRange; 
	

	public String getIssueRef() {
		return issueRef;
	}

	public void setIssueRef(String issueRef) {
		this.issueRef = issueRef;
	}

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public String getItemDescription() {
		return itemDescription;
	}

	public void setItemDescription(String itemDescription) {
		this.itemDescription = itemDescription;
	}

	public String getItemUom() {
		return itemUom;
	}

	public void setItemUom(String itemUom) {
		this.itemUom = itemUom;
	}

	public float getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(float itemPrice) {
		this.itemPrice = itemPrice;
	}

	public float getItemReqQty() {
		return itemReqQty;
	}

	public void setItemReqQty(float itemReqQty) {
		this.itemReqQty = itemReqQty;
	}

	public float getIssueQty() {
		return issueQty;
	}

	public void setIssueQty(float issueQty) {
		this.issueQty = issueQty;
	}

	public float getItemsCost() {
		return itemsCost;
	}

	public void setItemsCost(float itemsCost) {
		this.itemsCost = itemsCost;
	}

	public String getStorageLocation() {
		return storageLocation;
	}

	public void setStorageLocation(String storageLocation) {
		this.storageLocation = storageLocation;
	}

	public Integer getSno() {
		return sno;
	}

	public void setSno(Integer sno) {
		this.sno = sno;
	}

    public String getItemPluCode() {
		return itemPluCode;
	}

	public void setItemPluCode(String itemPluCode) {
		this.itemPluCode = itemPluCode;
	}

	public String getMeasureRange() {
		return measureRange;
	}

	public void setMeasureRange(String measureRange) {
		this.measureRange = measureRange;
	}  
	
}
