package com.tlabs.posweb.beans;

import java.util.Date;
import java.util.List;

public class StockIssue {
	
	private int id_goods_issue;
	private int issue_total_qty;

	private float sub_total;
	private float grand_total;
	private float issue_total;

	
	private String goods_issue_ref_num;
	private String shipped_from;
	private String delivered_by;
	private Date Delivery_date;
	private String Goods_Request_Ref;
	
	private String Received_by;
	private String InspectedBy;
	private String flowUnder;
	private String requestId;
	  private List<String> skuId;
	    private List<String> qty;
	    private List<String> issued;
	private String status;
	private String deliveryDate;
	private String issue_to;
	private String remarks;
	  private String indentedBy;
	    private Float requestedQty;
	    private Float issuedQty;
	    private Float indentQty;
	  
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

		public List<String> getIssued() {
			return issued;
		}

		public void setIssued(List<String> issued) {
			this.issued = issued;
		}

	private List<StockIssueDetails> reciptDetails;
	private RequestHeader requestHeader;
	private String requestRef;
	 private List<String> nextActivities;
	  
		private String shipmentRefNo;
		private String requestedBy;
		private String shipmentMode;
	
	public List<String> getNextActivities() {
		return nextActivities;
	}

	public void setNextActivities(List<String> nextActivities) {
		this.nextActivities = nextActivities;
	}

	public String getRequestRef() {
		return requestRef;
	}

	public void setRequestRef(String requestRef) {
		this.requestRef = requestRef;
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

	public Date getDelivery_date() {
		return Delivery_date;
	}

	public void setDelivery_date(Date delivery_date) {
		Delivery_date = delivery_date;
	}

	public String getGoods_Request_Ref() {
		return Goods_Request_Ref;
	}

	public void setGoods_Request_Ref(String goods_Request_Ref) {
		Goods_Request_Ref = goods_Request_Ref;
	}

	

	public String getReceived_by() {
		return Received_by;
	}

	public void setReceived_by(String received_by) {
		Received_by = received_by;
	}

	public String getInspectedBy() {
		return InspectedBy;
	}

	public void setInspectedBy(String inspectedBy) {
		InspectedBy = inspectedBy;
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

	public int getIssue_total_qty() {
		return issue_total_qty;
	}

	public void setIssue_total_qty(int issue_total_qty) {
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

	public String getShipmentRefNo() {
		return shipmentRefNo;
	}

	public void setShipmentRefNo(String shipmentRefNo) {
		this.shipmentRefNo = shipmentRefNo;
	}

	public String getRequestedBy() {
		return requestedBy;
	}

	public void setRequestedBy(String requestedBy) {
		this.requestedBy = requestedBy;
	}

	public String getShipmentMode() {
		return shipmentMode;
	}

	public void setShipmentMode(String shipmentMode) {
		this.shipmentMode = shipmentMode;
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


	
}
