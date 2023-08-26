/*******************************************************************************
 * Copyright  2015 Omni Retailer Customer Console, All rights reserved.
 * Author : Sahitya
 * Created On : 6-3-2015
 * 
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

import java.util.List;

/**
 * @author Sahitya
 * Verified By :
 * 
 * This class is used to receive stock issue response
 */
public class StockIssueBean {

	private String indentedBy;
	private String deliveryDate;
	private String delivered_by;
	private String status;

	private String goods_issue_ref_num;

	private String delivery_date;

	private String remarks;

	private String shipped_from;

	private String issue_to;
	

	private int id_goods_issue;
	
	private float issue_total_qty;

	private float sub_total;

	private float grand_total;
	
	private float issue_total;
	private String createdDateStr;
	private List<StockIssueDetails> itemDetails;
	private List<StockIssueDetails> reciptDetails;
//	private String goods_Request_Ref;
	private List<String> nextActivities;
	private List<String> previousWorkFlowList;
	private List<String> nextWorkFlowStates;
	private List<String> previousStates;
/*	private String Goods_Request_Ref;*/
	private String requestId;
	private String inspected_by;
	private String receivedBy;
	private String shipmentRefNo;
	private String requestedBy;
	private String goods_Request_Ref;
	private String received_by;
	private String inspectedBy;
	private String shipmentMode;
	private String finalStatus;
	
	
	
	
	public String getFinalStatus() {
		return finalStatus;
	}

	public void setFinalStatus(String finalStatus) {
		this.finalStatus = finalStatus;
	}

	private String requestedDate;
	private String transporter;
	
	
	
	
	
	public String getTransporter() {
		return transporter;
	}

	public void setTransporter(String transporter) {
		this.transporter = transporter;
	}

	

	public String getRequestedDate() {
		return requestedDate;
	}

	public void setRequestedDate(String requestedDate) {
		this.requestedDate = requestedDate;
	}

	public String getInspected_by() {
		return inspected_by;

		
		
		
	}

	public void setInspected_by(String inspected_by) {
		this.inspected_by = inspected_by;
	}

	public String getReceivedBy() {
		return receivedBy;
	}

	public void setReceivedBy(String receivedBy) {
		this.receivedBy = receivedBy;
	}

	public String getRequestId() {
		return requestId;
	}

	public void setRequestId(String requestId) {
		this.requestId = requestId;
	}

	public List<String> getNextActivities() {
		return nextActivities;
	}

	public void setNextActivities(List<String> nextActivities) {
		this.nextActivities = nextActivities;
	}

	
	public String getCreatedDateStr() {
		return createdDateStr;
	}

	public void setCreatedDateStr(String createdDateStr) {
		this.createdDateStr = createdDateStr;
	}

	public String getDeliveryDate() {
		return deliveryDate;
	}

	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}

	public List<StockIssueDetails> getItemDetails() {
		return itemDetails;
	}

	public void setItemDetails(List<StockIssueDetails> itemDetails) {
		this.itemDetails = itemDetails;
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

	private String id_goods_receipt;

	/*public String getInspectedBy() {
		return inspectedBy;
	}

	public void setInspectedBy(String inspectedBy) {
		this.inspectedBy = inspectedBy;
	}
*/
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



	public String getGoods_issue_ref_num() {
		return goods_issue_ref_num;
	}

	public void setGoods_issue_ref_num(String goods_issue_ref_num) {
		this.goods_issue_ref_num = goods_issue_ref_num;
	}

	public String getDelivery_date() {
		return delivery_date;
	}

	public void setDelivery_date(String delivery_date) {
		this.delivery_date = delivery_date;
	}

	/*public String getReceived_by() {
		return received_by;
	}

	public void setReceived_by(String received_by) {
		this.received_by = received_by;
	}*/

	public String getShipped_from() {
		return shipped_from;
	}

	public void setShipped_from(String shipped_from) {
		this.shipped_from = shipped_from;
	}

	

	public String getId_goods_receipt() {
		return id_goods_receipt;
	}

	public void setId_goods_receipt(String id_goods_receipt) {
		this.id_goods_receipt = id_goods_receipt;
	}

	public String getIssue_to() {
		return issue_to;
	}

	public void setIssue_to(String issue_to) {
		this.issue_to = issue_to;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
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

	public List<String> getNextWorkFlowStates() {
		return nextWorkFlowStates;
	}

	public void setNextWorkFlowStates(List<String> nextWorkFlowStates) {
		this.nextWorkFlowStates = nextWorkFlowStates;
	}

	public String getShipmentMode() {
		return shipmentMode;
	}

	public void setShipmentMode(String shipmentMode) {
		this.shipmentMode = shipmentMode;
	}

	public List<String> getPreviousWorkFlowList() {
		return previousWorkFlowList;
	}

	public void setPreviousWorkFlowList(List<String> previousWorkFlowList) {
		this.previousWorkFlowList = previousWorkFlowList;
	}

	public List<StockIssueDetails> getReciptDetails() {
		return reciptDetails;
	}

	public void setReciptDetails(List<StockIssueDetails> reciptDetails) {
		this.reciptDetails = reciptDetails;
	}

	public String getIndentedBy() {
		return indentedBy;
	}

	public void setIndentedBy(String indentedBy) {
		this.indentedBy = indentedBy;
	}

	public String getReceived_by() {
		return received_by;
	}

	public void setReceived_by(String received_by) {
		this.received_by = received_by;
	}

	public String getGoods_Request_Ref() {
		return goods_Request_Ref;
	}

	public void setGoods_Request_Ref(String goods_Request_Ref) {
		this.goods_Request_Ref = goods_Request_Ref;
	}

	public String getInspectedBy() {
		return inspectedBy;
	}

	public void setInspectedBy(String inspectedBy) {
		this.inspectedBy = inspectedBy;
	}

	public List<String> getPreviousStates() {
		return previousStates;
	}

	public void setPreviousStates(List<String> previousStates) {
		this.previousStates = previousStates;
	}

	

}