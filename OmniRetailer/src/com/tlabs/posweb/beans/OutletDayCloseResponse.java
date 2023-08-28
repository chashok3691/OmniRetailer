package com.tlabs.posweb.beans;

import java.util.List;


public class OutletDayCloseResponse {

	private ResponseHeader responseHeader;
	private OutletDayClose outletDayCloseObj;
	private List<OutletDayClose> outletDayClose;
	private int totalRecords;
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	public OutletDayClose getOutletDayCloseObj() {
		return outletDayCloseObj;
	}
	public void setOutletDayCloseObj(OutletDayClose outletDayCloseObj) {
		this.outletDayCloseObj = outletDayCloseObj;
	}
	public List<OutletDayClose> getOutletDayClose() {
		return outletDayClose;
	}
	public void setOutletDayClose(List<OutletDayClose> outletDayClose) {
		this.outletDayClose = outletDayClose;
	}
	public int getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
	
	
	
}
