package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Set;



public class WHStockReciept
{

	private String goods_receipt_ref_num;

	private String shipped_from;

	private String delivered_by;

	private Date Delivery_date;

	private String goods_Request_Ref;

	private BigDecimal receipt_total;

	private BigDecimal receipt_total_qty;

	private String received_by;

	private String issuedBy;


	private String inspectedBy;



	private String status;

	private String receipt_location;

	private String remarks;

	private Date receiptCreatedOn;

	private String issueRefNo;

	private String returnReferenceNo;

	private String deliveryDate;
	private RequestHeader requestHeader;
	private Date createdDate;



	private Set<WHStockRecieptDetails> reciptDetails;
	private String orderDate;
	private String startIndex;
	private String maxRecords;
	private String startDateStr;
	private String endDateStr;
	private String searchCriteria;
	private String createdDateStr;
	
	
	

	public String getIssuedBy() {
		return issuedBy;
	}

	public void setIssuedBy(String issuedBy) {
		this.issuedBy = issuedBy;
	}

	public Date getReceiptCreatedOn()
	{
		return receiptCreatedOn;
	}

	public void setReceiptCreatedOn(Date receiptCreatedOn)
	{
		this.receiptCreatedOn = receiptCreatedOn;
	}

	public String getIssueRefNo()
	{
		return issueRefNo;
	}

	public void setIssueRefNo(String issueRefNo)
	{
		this.issueRefNo = issueRefNo;
	}



	public String getGoods_receipt_ref_num()
	{
		return goods_receipt_ref_num;
	}

	public void setGoods_receipt_ref_num(String goods_receipt_ref_num)
	{
		this.goods_receipt_ref_num = goods_receipt_ref_num;
	}

	public String getShipped_from()
	{
		return shipped_from;
	}

	public void setShipped_from(String shipped_from)
	{
		this.shipped_from = shipped_from;
	}

	public String getDelivered_by()
	{
		return delivered_by;
	}

	public void setDelivered_by(String delivered_by)
	{
		this.delivered_by = delivered_by;
	}

	public Date getDelivery_date()
	{
		return Delivery_date;
	}

	public void setDelivery_date(Date delivery_date)
	{
		Delivery_date = delivery_date;
	}



	public String getStatus()
	{
		return status;
	}

	public void setStatus(String status)
	{
		this.status = status;
	}

	public String getReceipt_location()
	{
		return receipt_location;
	}

	public void setReceipt_location(String receipt_location)
	{
		this.receipt_location = receipt_location;
	}

	public String getRemarks()
	{
		return remarks;
	}

	public void setRemarks(String remarks)
	{
		this.remarks = remarks;
	}

	public String getDeliveryDate()
	{
		return deliveryDate;
	}

	public void setDeliveryDate(String deliveryDate)
	{
		this.deliveryDate = deliveryDate;
	}

	public RequestHeader getRequestHeader()
	{
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader)
	{
		this.requestHeader = requestHeader;
	}

	public Set<WHStockRecieptDetails> getReciptDetails()
	{
		return reciptDetails;
	}

	public void setReciptDetails(Set<WHStockRecieptDetails> reciptDetails)
	{
		this.reciptDetails = reciptDetails;
	}

	public String getOrderDate()
	{
		return orderDate;
	}

	public void setOrderDate(String orderDate)
	{
		this.orderDate = orderDate;
	}

	public String getStartIndex()
	{
		return startIndex;
	}

	public void setStartIndex(String startIndex)
	{
		this.startIndex = startIndex;
	}

	public Date getCreatedDate()
	{
		return createdDate;
	}

	public void setCreatedDate(Date createdDate)
	{
		this.createdDate = createdDate;
	}

	public String getGoods_Request_Ref()
	{
		return goods_Request_Ref;
	}

	public void setGoods_Request_Ref(String goods_Request_Ref)
	{
		this.goods_Request_Ref = goods_Request_Ref;
	}

	public String getReceived_by()
	{
		return received_by;
	}

	public void setReceived_by(String received_by)
	{
		this.received_by = received_by;
	}

	public String getInspectedBy()
	{
		return inspectedBy;
	}

	public void setInspectedBy(String inspectedBy)
	{
		this.inspectedBy = inspectedBy;
	}

	public String getMaxRecords()
	{
		return maxRecords;
	}

	public void setMaxRecords(String maxRecords)
	{
		this.maxRecords = maxRecords;
	}

	public String getStartDateStr()
	{
		return startDateStr;
	}

	public void setStartDateStr(String startDateStr)
	{
		this.startDateStr = startDateStr;
	}

	public String getEndDateStr()
	{
		return endDateStr;
	}

	public void setEndDateStr(String endDateStr)
	{
		this.endDateStr = endDateStr;
	}

	public String getSearchCriteria()
	{
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria)
	{
		this.searchCriteria = searchCriteria;
	}

	public String getCreatedDateStr()
	{
		return createdDateStr;
	}

	public void setCreatedDateStr(String createdDateStr)
	{
		this.createdDateStr = createdDateStr;
	}
	public BigDecimal getReceipt_total() {
		return receipt_total;
	}

	public void setReceipt_total(BigDecimal receipt_total) {
		this.receipt_total = receipt_total;
	}

	public BigDecimal getReceipt_total_qty() {
		return receipt_total_qty;
	}

	public void setReceipt_total_qty(BigDecimal receipt_total_qty) {
		this.receipt_total_qty = receipt_total_qty;
	}

	public String getReturnReferenceNo() {
		return returnReferenceNo;
	}

	public void setReturnReferenceNo(String returnReferenceNo) {
		this.returnReferenceNo = returnReferenceNo;
	}

}
