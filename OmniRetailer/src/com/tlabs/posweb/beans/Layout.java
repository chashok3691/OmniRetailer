/*******************************************************************************
 * Copyright  2015 Omni Retailer Customer Console, All rights reserved.
 * Author : Sahitya
 * Created On : 17-3-2015
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
 * This class is used to send layout configuration details to webservices
 */
public class Layout {

	private String layoutID;
	
	private String layoutName;
	
	private String layoutDescription;
	
	private String outletId;
	
	private String level;
	
	
	private String location;
	
	private String startIndex;
	
	private RequestHeader requestHeader;
	
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}

	private List<DineTable> tablesList;

	public String getLayoutID() {
		return layoutID;
	}

	public void setLayoutID(String layoutID) {
		this.layoutID = layoutID;
	}

	public String getLayoutName() {
		return layoutName;
	}

	public void setLayoutName(String layoutName) {
		this.layoutName = layoutName;
	}

	public String getLayoutDescription() {
		return layoutDescription;
	}

	public void setLayoutDescription(String layoutDescription) {
		this.layoutDescription = layoutDescription;
	}

	public String getOutletId() {
		return outletId;
	}

	public void setOutletId(String outletId) {
		this.outletId = outletId;
	}

	public List<DineTable> getTablesList() {
		return tablesList;
	}

	public void setTablesList(List<DineTable> tablesList) {
		this.tablesList = tablesList;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	
	
	
}
