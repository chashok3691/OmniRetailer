package com.tlabs.posweb.beans;

import java.util.List;

public class StockIssues {
	
	private int id_goods_issue;
	private float issue_total_qty;

	private float sub_total;
	private float grand_total;
	private Float issue_total;
	private Float quantity;
	private Integer issued;
	
	private String goods_issue_ref_num;
	private String shipped_from;
	private String delivered_by;
	private String delivery_date;
	private String goods_Request_Ref;
	private String received_by;
	private String inspectedBy;
	private String urlOfPdf;
	private String shipmentMode;
	private String status;
	private String deliveryDate;
	private String issue_to;
	private String remarks;
	private String requestedBy;
	private String issuedBy;
	private Float actualQty;
	private String indentedBy;
	private Float requestedQty;
	private Float issuedQty;
	private List<StockIssueDetails> reciptDetails;
	private String totalRecords;
	private RequestHeader requestHeader;
	private List<String> issueIds;
	private List<String> issueRefList;
	private ResponseHeader responseHeader;
	private String createdDateStr;
	private String flowUnder;
	private String requestId;
	  private List<String> skuId;
	    private List<String> qty;
	    private List<String> issuedqty;
	    private List<String> nextActivities;
	    private List<String> nextWorkFlowStates;
	    private List<String> previousStates;
	    private String updatedDateStr;
	    private boolean saveStockReport;
		private String saveStockFilePath;
		private String urlOfSaveOrders;
		   private String pickListURL;
		   private String packageReference;
		   
		   
		   
		   
		    
		   
			public String getPackageReference() {
			return packageReference;
		}
		public void setPackageReference(String packageReference) {
			this.packageReference = packageReference;
		}
			public String getUrlOfPdf() {
			return urlOfPdf;
		}
		public void setUrlOfPdf(String urlOfPdf) {
			this.urlOfPdf = urlOfPdf;
		}
			public String getPickListURL() {
					return pickListURL;
				}
				public void setPickListURL(String pickListURL) {
					this.pickListURL = pickListURL;
				}
		public String getUrlOfSaveOrders() {
			return urlOfSaveOrders;
		}
		public void setUrlOfSaveOrders(String urlOfSaveOrders) {
			this.urlOfSaveOrders = urlOfSaveOrders;
		}
	public String getUpdatedDateStr() {
			return updatedDateStr;
		}
		public void setUpdatedDateStr(String updatedDateStr) {
			this.updatedDateStr = updatedDateStr;
		}

	private int slNo;
	
	public int getSlNo() {
		return slNo;
	}
	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}
	public String getCreatedDateStr() {
		return createdDateStr;
	}

	public void setCreatedDateStr(String createdDateStr) {
		this.createdDateStr = createdDateStr;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public List<String> getIssueIds() {
		return issueIds;
	}

	public void setIssueIds(List<String> issueIds) {
		this.issueIds = issueIds;
	}

	public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getIssue_to() {
		return issue_to;
	}

	public void setIssue_to(String issue_to) {
		this.issue_to = issue_to;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	private String orderDate;
	private String startIndex;

	
	public String getGoods_issue_ref_num() {
		return goods_issue_ref_num;
	}

	public void setGoods_issue_ref_num(String goods_issue_ref_num) {
		this.goods_issue_ref_num = goods_issue_ref_num;
	}

	public String getShipped_from() {
		return shipped_from;
	}

	public void setShipped_from(String shipped_from) {
		this.shipped_from = shipped_from;
	}

	public String getDelivered_by() {
		return delivered_by;
	}

	public void setDelivered_by(String delivered_by) {
		this.delivered_by = delivered_by;
	}

	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDeliveryDate() {
		return deliveryDate;
	}

	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}

	public List<StockIssueDetails> getReciptDetails() {
		return reciptDetails;
	}

	public void setReciptDetails(List<StockIssueDetails> reciptDetails) {
		this.reciptDetails = reciptDetails;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}

	public int getId_goods_issue() {
		return id_goods_issue;
	}

	public void setId_goods_issue(int id_goods_issue) {
		this.id_goods_issue = id_goods_issue;
	}

	public float getIssue_total_qty() {
		return issue_total_qty;
	}

	public void setIssue_total_qty(float issue_total_qty) {
		this.issue_total_qty = issue_total_qty;
	}

	public float getSub_total() {
		return sub_total;
	}

	public void setSub_total(float sub_total) {
		this.sub_total = sub_total;
	}

	public float getGrand_total() {
		return grand_total;
	}

	public void setGrand_total(float grand_total) {
		this.grand_total = grand_total;
	}

	public float getIssue_total() {
		return issue_total;
	}

	public void setIssue_total(float issue_total) {
		this.issue_total = issue_total;
	}

	public String getDelivery_date() {
		return delivery_date;
	}

	public void setDelivery_date(String delivery_date) {
		this.delivery_date = delivery_date;
	}

	public String getGoods_Request_Ref() {
		return goods_Request_Ref;
	}

	public void setGoods_Request_Ref(String goods_Request_Ref) {
		this.goods_Request_Ref = goods_Request_Ref;
	}

	public String getReceived_by() {
		return received_by;
	}

	public void setReceived_by(String received_by) {
		this.received_by = received_by;
	}

	public String getInspectedBy() {
		return inspectedBy;
	}

	public void setInspectedBy(String inspectedBy) {
		this.inspectedBy = inspectedBy;
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
	public String getRequestedBy() {
		return requestedBy;
	}
	public void setRequestedBy(String requestedBy) {
		this.requestedBy = requestedBy;
	}
	public Float getActualQty() {
		return actualQty;
	}
	public void setActualQty(Float actualQty) {
		this.actualQty = actualQty;
	}
	public String getFlowUnder() {
		return flowUnder;
	}
	public void setFlowUnder(String flowUnder) {
		this.flowUnder = flowUnder;
	}
	public String getRequestId() {
		return requestId;
	}
	public void setRequestId(String requestId) {
		this.requestId = requestId;
	}
	public List<String> getSkuId() {
		return skuId;
	}
	public void setSkuId(List<String> skuId) {
		this.skuId = skuId;
	}
	public List<String> getQty() {
		return qty;
	}
	public void setQty(List<String> qty) {
		this.qty = qty;
	}
	/*public List<String> getIssued() {
		return issued;
	}
	public void setIssued(List<String> issued) {
		this.issued = issued;
	}*/
	public String getShipmentMode() {
		return shipmentMode;
	}
	public void setShipmentMode(String shipmentMode) {
		this.shipmentMode = shipmentMode;
	}
	public String getIssuedBy() {
		return issuedBy;
	}
	public void setIssuedBy(String issuedBy) {
		this.issuedBy = issuedBy;
	}
	public List<String> getNextActivities() {
		return nextActivities;
	}
	public void setNextActivities(List<String> nextActivities) {
		this.nextActivities = nextActivities;
	}
	public Float getQuantity() {
		return quantity;
	}
	public void setQuantity(Float quantity) {
		this.quantity = quantity;
	}
	public Integer getIssued() {
		return issued;
	}
	public void setIssued(Integer issued) {
		this.issued = issued;
	}
	
	public List<String> getIssuedqty() {
		return issuedqty;
	}
	public void setIssuedqty(List<String> issuedqty) {
		this.issuedqty = issuedqty;
	}
	public List<String> getPreviousStates() {
		return previousStates;
	}
	public void setPreviousStates(List<String> previousStates) {
		this.previousStates = previousStates;
	}
	public List<String> getIssueRefList() {
		return issueRefList;
	}
	public void setIssueRefList(List<String> issueRefList) {
		this.issueRefList = issueRefList;
	}
	public List<String> getNextWorkFlowStates() {
		return nextWorkFlowStates;
	}
	public void setNextWorkFlowStates(List<String> nextWorkFlowStates) {
		this.nextWorkFlowStates = nextWorkFlowStates;
	}
	public String getSaveStockFilePath() {
		return saveStockFilePath;
	}
	public void setSaveStockFilePath(String saveStockFilePath) {
		this.saveStockFilePath = saveStockFilePath;
	}
	public boolean isSaveStockReport() {
		return saveStockReport;
	}
	public void setSaveStockReport(boolean saveStockReport) {
		this.saveStockReport = saveStockReport;
	}

	
	
}
