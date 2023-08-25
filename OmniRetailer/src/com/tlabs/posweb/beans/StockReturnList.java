package com.tlabs.posweb.beans;


public class StockReturnList {

	private int slno;
	
	private String itemId;
	
	private String pluCode;
	
	private String description;
	
	private String reasonForReturn;
	
	private String uOM;

	private String quantity;
	
	private Float price;
	
	private String value;

	private String 	comments;
		
	private String 	returnNoteRef;
	
	private String priceStr;
	private String fromLocation;
	private String issueRef;
	private String returnBy;
	private String shippedBy;
	
	
	
	public String getFromLocation() {
		return fromLocation;
	}

	public void setFromLocation(String fromLocation) {
		this.fromLocation = fromLocation;
	}

	public String getIssueRef() {
		return issueRef;
	}

	public void setIssueRef(String issueRef) {
		this.issueRef = issueRef;
	}

	public String getReturnBy() {
		return returnBy;
	}

	public void setReturnBy(String returnBy) {
		this.returnBy = returnBy;
	}

	public String getShippedBy() {
		return shippedBy;
	}

	public void setShippedBy(String shippedBy) {
		this.shippedBy = shippedBy;
	}

	private RequestHeader requestHeader;
	
	private ResponseHeader responseHeader;
	
	public String getPluCode() {
		return pluCode;
	}

	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}

	public int getSlno() {
		return slno;
	}

	public void setSlno(int slno) {
		this.slno = slno;
	}

	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getReasonForReturn() {
		return reasonForReturn;
	}

	public void setReasonForReturn(String reasonForReturn) {
		this.reasonForReturn = reasonForReturn;
	}

	public String getuOM() {
		return uOM;
	}

	public void setuOM(String uOM) {
		this.uOM = uOM;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

 
	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getReturnNoteRef() {
		return returnNoteRef;
	}

	public void setReturnNoteRef(String returnNoteRef) {
		this.returnNoteRef = returnNoteRef;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public String getPriceStr() {
		return priceStr;
	}

	public void setPriceStr(String priceStr) {
		this.priceStr = priceStr;
	}
}
