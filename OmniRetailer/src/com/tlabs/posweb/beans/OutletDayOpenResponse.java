package com.tlabs.posweb.beans;

import java.util.List;




public class OutletDayOpenResponse {

	private ResponseHeader responseHeader;
	private OutletDayOpen outletDayOpenObj;
	private List<OutletDayOpen> outletDayOpen;
	private int totalRecords;
	
	private OutletDayOpenCompositBean dayopens;
	
	public OutletDayOpenCompositBean getDayopens() {
		return dayopens;
	}
	public void setDayopens(OutletDayOpenCompositBean dayopens) {
		this.dayopens = dayopens;
	}
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	public OutletDayOpen getOutletDayOpenObj() {
		return outletDayOpenObj;
	}
	public void setOutletDayOpenObj(OutletDayOpen outletDayOpenObj) {
		this.outletDayOpenObj = outletDayOpenObj;
	}
	public List<OutletDayOpen> getOutletDayOpen() {
		return outletDayOpen;
	}
	public void setOutletDayOpen(List<OutletDayOpen> outletDayOpen) {
		this.outletDayOpen = outletDayOpen;
	}
	public int getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
	
}
