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
public class GetStockIssueResponse {

	private ResponseHeader responseHeader;

	private StockIssueBean issueDetails;

	private StockIssueBean warehouse_issueDetails;
	
	private List<StockIssueDetails> itemDetails;
	
	private String finalStatus;
	
	
	

	public String getFinalStatus() {
		return finalStatus;
	}

	public void setFinalStatus(String finalStatus) {
		this.finalStatus = finalStatus;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public StockIssueBean getIssueDetails() {
		return issueDetails;
	}

	public void setIssueDetails(StockIssueBean issueDetails) {
		this.issueDetails = issueDetails;
	}

	public List<StockIssueDetails> getItemDetails() {
		return itemDetails;
	}

	public void setItemDetails(List<StockIssueDetails> itemDetails) {
		this.itemDetails = itemDetails;
	}

	public StockIssueBean getWarehouse_issueDetails() {
		return warehouse_issueDetails;
	}

	public void setWarehouse_issueDetails(StockIssueBean warehouse_issueDetails) {
		this.warehouse_issueDetails = warehouse_issueDetails;
	}
	
	
	
	
}
