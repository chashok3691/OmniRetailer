package com.tlabs.posweb.beans;

import java.util.List;


/**
 * @author Mythri.S
 *
 */
public class ShiftAllocationBean {
	
	private Integer shiftId;
	
	private String shiftLocation;
	
	private String shiftDepartment;
	
	private List<String> shiftIds;
	private String shiftType;
	
	private List<ShiftAllocation> shiftAllocationList;
	
	private List<ShiftAllocationBean> shiftAllocationBeanList;
	
	private ShiftAllocation shiftAllocationDetails;
	
	private ResponseHeader responseHeader;
	
	private String startIndex;
	
	private int totalRecords;
	
	private RequestHeader requestHeader;
	
	private String searchCriteria;
	
	private int slNo;
	private List<String> locationsList;
	
	
	private String flowUnder;
	
	public String getFlowUnder() {
		return flowUnder;
	}

	public void setFlowUnder(String flowUnder) {
		this.flowUnder = flowUnder;
	}

	public List<String> getLocationsList() {
		return locationsList;
	}

	public void setLocationsList(List<String> locationsList) {
		this.locationsList = locationsList;
	}

	public int getSlNo() {
		return slNo;
	}

	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public List<String> getShiftIds() {
		return shiftIds;
	}

	public void setShiftIds(List<String> shiftIds) {
		this.shiftIds = shiftIds;
	}

	public List<ShiftAllocationBean> getShiftAllocationBeanList() {
		return shiftAllocationBeanList;
	}

	public void setShiftAllocationBeanList(List<ShiftAllocationBean> shiftAllocationBeanList) {
		this.shiftAllocationBeanList = shiftAllocationBeanList;
	}

	public String getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public ShiftAllocation getShiftAllocationDetails() {
		return shiftAllocationDetails;
	}

	public void setShiftAllocationDetails(ShiftAllocation shiftAllocationDetails) {
		this.shiftAllocationDetails = shiftAllocationDetails;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public Integer getShiftId() {
		return shiftId;
	}

	public void setShiftId(Integer shiftId) {
		this.shiftId = shiftId;
	}

	public String getShiftLocation() {
		return shiftLocation;
	}

	public void setShiftLocation(String shiftLocation) {
		this.shiftLocation = shiftLocation;
	}

	public String getShiftDepartment() {
		return shiftDepartment;
	}

	public void setShiftDepartment(String shiftDepartment) {
		this.shiftDepartment = shiftDepartment;
	}

	public List<ShiftAllocation> getShiftAllocationList() {
		return shiftAllocationList;
	}

	public void setShiftAllocationList(List<ShiftAllocation> shiftAllocationList) {
		this.shiftAllocationList = shiftAllocationList;
	}

	public String getShiftType() {
		return shiftType;
	}

	public void setShiftType(String shiftType) {
		this.shiftType = shiftType;
	}
	
	
	
	
}
