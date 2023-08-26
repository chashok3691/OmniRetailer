/*******************************************************************************
 * Copyright  2015 Omni Retailer Customer Console, All rights reserved.
 * Author : Sahitya
 * Created On : 6-4-2015
 * Edited by : vasudeva reddy
 * Edited on : 24/09/2019
 * Edit : corrected the datatypes of some keys.
 * Licensed under the Technolabs Software License, Version 1.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *   http://www.technolabssoftware.com/pages/privacy-policy/
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 ******************************************************************************/

package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class StockReciept {
/*	private int id_goods_receipt;*/
	private String goods_receipt_ref_num;
	private String shipped_from;
	private String delivered_by;
	private Date Delivery_date;
	private String goods_Request_Ref;
	private BigDecimal receipt_total;
	private BigDecimal receipt_total_qty;
	private String received_by;
	private String inspectedBy;
	private BigDecimal sub_total;
	private BigDecimal grand_total;
	private String status;
	private String receipt_location;
	private String remarks;
	private Date createdDate;
	private Date updated_date;
	private String issueReferenceNo;
	private String deliveryDate;
	private RequestHeader requestHeader;
	private List<StockRecieptDetails> reciptDetails;
	
	private String orderDate;
	private String startIndex;
	/* for search method implementation */
	private String searchText;
	private String searchCriteria;
	private String startDate = null;
	private String endDate = null;
	private String fromValue = null;
	private String toValue = null;

	//following fields are added by kesav
	private String maxRecords;
	private String createdDateStr;
	private boolean outletAll;
	private boolean warehouseAll;

	List<String> nextActivities;
	private String shipmentRefNo;
	private String shipmentMode;
	private String issuedBy;
	private Date issuedDate;
	private String issuedDateStr;
	private List<String> previousWorkFlowList;
	private List<String> nextWorkFlowStates;
	private List<String> workFlowActivities;
	private List<String> previousStates;
	private BigDecimal quantity;
	private BigDecimal max_quantity;
	private double supplied;
	private double recieved;
	private BigDecimal rejected;

	private String category;

	private String zoneId;
	private String location;
	private boolean saveStockReport;
	private String logo;
	private List<StockRecieptDetails> itemsList;
	
	
	 private Integer noOfItems;
	 
	 private String subCategory;
		private String model;
		private String size;
		private String color;
		private String brand;
//		private String skuId;
		private String section;
		private String department;
		private String subDepartment;
		
		private double acceptedQty;
		private List<String> recpLocationList;
		
		private List<String> shippedFromList;
		private String updatedDateStr;
		private String flowUnder;
		private ResponseHeader responseHeader;
		private List<String> receiptIds;
		private List<String> indentIdsList;
		private int id_goods_receipt;
		private int slNo;
		private Boolean trackingRequired;
		
		public Boolean getTrackingRequired() {
			return trackingRequired;
		}

		public void setTrackingRequired(Boolean trackingRequired) {
			this.trackingRequired = trackingRequired;
		}

		public int getSlNo() {
			return slNo;
		}

		public void setSlNo(int slNo) {
			this.slNo = slNo;
		}

		public int getId_goods_receipt() {
			return id_goods_receipt;
		}

		public void setId_goods_receipt(int id_goods_receipt) {
			this.id_goods_receipt = id_goods_receipt;
		}

		public List<String> getIndentIdsList() {
			return indentIdsList;
		}

		public void setIndentIdsList(List<String> indentIdsList) {
			this.indentIdsList = indentIdsList;
		}

		public List<String> getReceiptIds() {
			return receiptIds;
		}

		public void setReceiptIds(List<String> receiptIds) {
			this.receiptIds = receiptIds;
		}

		public ResponseHeader getResponseHeader() {
			return responseHeader;
		}

		public void setResponseHeader(ResponseHeader responseHeader) {
			this.responseHeader = responseHeader;
		}

		public String getFlowUnder() {
			return flowUnder;
		}

		public void setFlowUnder(String flowUnder) {
			this.flowUnder = flowUnder;
		}

		public String getTotalRecords() {
			return totalRecords;
		}

		public void setTotalRecords(String totalRecords) {
			this.totalRecords = totalRecords;
		}

		public String getRequestId() {
			return requestId;
		}

		public void setRequestId(String requestId) {
			this.requestId = requestId;
		}

		private String totalRecords;
		private String requestId;
		 
	

	public String getUpdatedDateStr() {
			return updatedDateStr;
		}

		public void setUpdatedDateStr(String updatedDateStr) {
			this.updatedDateStr = updatedDateStr;
		}

	public List<String> getPreviousWorkFlowList() {
		return previousWorkFlowList;
	}

	public void setPreviousWorkFlowList(List<String> previousWorkFlowList) {
		this.previousWorkFlowList = previousWorkFlowList;
	}

	public List<String> getNextWorkFlowStates() {
		return nextWorkFlowStates;
	}

	public void setNextWorkFlowStates(List<String> nextWorkFlowStates) {
		this.nextWorkFlowStates = nextWorkFlowStates;
	}

	public List<String> getWorkFlowActivities() {
		return workFlowActivities;
	}

	public void setWorkFlowActivities(List<String> workFlowActivities) {
		this.workFlowActivities = workFlowActivities;
	}

	public List<String> getPreviousStates() {
		return previousStates;
	}

	public void setPreviousStates(List<String> previousStates) {
		this.previousStates = previousStates;
	}

	public List<String> getNextActivities() {
		return nextActivities;
	}

	public void setNextActivities(List<String> nextActivities) {
		this.nextActivities = nextActivities;
	}

	public boolean isOutletAll() {
		return outletAll;
	}

	public void setOutletAll(boolean outletAll) {
		this.outletAll = outletAll;
	}

	public boolean isWarehouseAll() {
		return warehouseAll;
	}

	public void setWarehouseAll(boolean warehouseAll) {
		this.warehouseAll = warehouseAll;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}



	public String getGoods_receipt_ref_num() {
		return goods_receipt_ref_num;
	}

	public void setGoods_receipt_ref_num(String goods_receipt_ref_num) {
		this.goods_receipt_ref_num = goods_receipt_ref_num;
	}

	public String getShipped_from() {
		return shipped_from;
	}

	public void setShipped_from(String shipped_from) {
		this.shipped_from = shipped_from;
	}

	public List<StockRecieptDetails> getItemsList() {
		return itemsList;
	}

	public void setItemsList(List<StockRecieptDetails> itemsList) {
		this.itemsList = itemsList;
	}

	public String getSubCategory() {
		return subCategory;
	}

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}

 

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

/*	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}
*/
	public String getDelivered_by() {
		return delivered_by;
	}

	public void setDelivered_by(String delivered_by) {
		this.delivered_by = delivered_by;
	}

	public Date getDelivery_date() {
		return Delivery_date;
	}

	public Integer getNoOfItems() {
		return noOfItems;
	}

	public void setNoOfItems(Integer noOfItems) {
		this.noOfItems = noOfItems;
	}

	public void setDelivery_date(Date delivery_date) {
		Delivery_date = delivery_date;
	}

	public String getCategory() {
		return category;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getZoneId() {
		return zoneId;
	}

	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}

	public String getIssuedDateStr() {
		return issuedDateStr;
	}

	

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getSubDepartment() {
		return subDepartment;
	}

	public void setSubDepartment(String subDepartment) {
		this.subDepartment = subDepartment;
	}

	

	public double getSupplied() {
		return supplied;
	}

	public void setSupplied(double supplied) {
		this.supplied = supplied;
	}

	public double getRecieved() {
		return recieved;
	}

	public void setRecieved(double recieved) {
		this.recieved = recieved;
	}

	public double getAcceptedQty() {
		return acceptedQty;
	}

	public void setAcceptedQty(double acceptedQty) {
		this.acceptedQty = acceptedQty;
	}

	public BigDecimal getRejected() {
		return rejected;
	}

	public void setRejected(BigDecimal rejected) {
		this.rejected = rejected;
	}

	public void setIssuedDateStr(String issuedDateStr) {
		this.issuedDateStr = issuedDateStr;
	}

	public BigDecimal getQuantity() {
		return quantity;
	}

	public void setQuantity(BigDecimal quantity) {
		this.quantity = quantity;
	}

	public BigDecimal getMax_quantity() {
		return max_quantity;
	}

	public void setMax_quantity(BigDecimal max_quantity) {
		this.max_quantity = max_quantity;
	}

	public String getShipmentRefNo() {
		return shipmentRefNo;
	}

	public void setShipmentRefNo(String shipmentRefNo) {
		this.shipmentRefNo = shipmentRefNo;
	}

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

	public String getStatus() {
		return status;
	}

	public String getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}

	public String getCreatedDateStr() {
		return createdDateStr;
	}

	public void setCreatedDateStr(String createdDateStr) {
		this.createdDateStr = createdDateStr;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getReceipt_location() {
		return receipt_location;
	}

	public void setReceipt_location(String receipt_location) {
		this.receipt_location = receipt_location;
	}

	public String getDeliveryDate() {
		return deliveryDate;
	}

	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}

	public List<StockRecieptDetails> getReciptDetails() {
		return reciptDetails;
	}

	public void setReciptDetails(List<StockRecieptDetails> reciptDetails) {
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

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public Date getIssuedDate() {
		return issuedDate;
	}

	public void setIssuedDate(Date issuedDate) {
		this.issuedDate = issuedDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getFromValue() {
		return fromValue;
	}

	public void setFromValue(String fromValue) {
		this.fromValue = fromValue;
	}

	public String getToValue() {
		return toValue;
	}

	public void setToValue(String toValue) {
		this.toValue = toValue;
	}

	public String getIssueReferenceNo() {
		return issueReferenceNo;
	}

	public void setIssueReferenceNo(String issueReferenceNo) {
		this.issueReferenceNo = issueReferenceNo;
	}

	public String getGoods_Request_Ref() {
		return goods_Request_Ref;
	}

	public void setGoods_Request_Ref(String goods_Request_Ref) {
		this.goods_Request_Ref = goods_Request_Ref;
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

	public BigDecimal getSub_total() {
		return sub_total;
	}

	public void setSub_total(BigDecimal sub_total) {
		this.sub_total = sub_total;
	}

	public BigDecimal getGrand_total() {
		return grand_total;
	}

	public void setGrand_total(BigDecimal grand_total) {
		this.grand_total = grand_total;
	}

	public boolean isSaveStockReport() {
		return saveStockReport;
	}

	public void setSaveStockReport(boolean saveStockReport) {
		this.saveStockReport = saveStockReport;
	}

	public List<String> getRecpLocationList() {
		return recpLocationList;
	}

	public void setRecpLocationList(List<String> recpLocationList) {
		this.recpLocationList = recpLocationList;
	}

	public List<String> getShippedFromList() {
		return shippedFromList;
	}

	public void setShippedFromList(List<String> shippedFromList) {
		this.shippedFromList = shippedFromList;
	}

	public Date getUpdated_date() {
		return updated_date;
	}

	public void setUpdated_date(Date updated_date) {
		this.updated_date = updated_date;
	}

}
