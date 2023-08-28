/**
 * 
 */
package com.tlabs.posweb.beans;

import java.util.List;



/**
 * @author naveenjilla
 *
 */
public class WarehouseCounterResponse {

	private String counterId;
	private ResponseHeader responseHeader;
	private List<WarehouseCounters> warehouseCountersList;
	private WarehouseCounters warehouseCounters;
	private int totalRecords;
	private String maxRecords;
	
	public String getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}

	public String getCounterId() {
		return counterId;
	}

	public void setCounterId(String counterId) {
		this.counterId = counterId;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public List<WarehouseCounters> getWarehouseCountersList() {
		return warehouseCountersList;
	}

	public void setWarehouseCountersList(List<WarehouseCounters> warehouseCountersList) {
		this.warehouseCountersList = warehouseCountersList;
	}

	public WarehouseCounters getWarehouseCounters() {
		return warehouseCounters;
	}

	public void setWarehouseCounters(WarehouseCounters warehouseCounters) {
		this.warehouseCounters = warehouseCounters;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

}
