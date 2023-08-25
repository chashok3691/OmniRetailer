package com.tlabs.posweb.beans;

import java.util.List;

public class WarehouseResponse {

	private ResponseHeader responseHeader;
	private List<Warehouse> warehouses;
	private String warehouseId;
	private WarehouseBean warehouse;
	private int totalRecords;
	private List<OutletStorageSystem> outletStorageSystems;
	private List<WarehouseStorageSystems> storageSystems;
	private List<WarehousePOS> warehousePOSList;
	private List<OutletStorageSystem> outletLayouotDetails;
	
	
	
	
	
	public List<OutletStorageSystem> getOutletLayouotDetails() {
		return outletLayouotDetails;
	}
	public void setOutletLayouotDetails(List<OutletStorageSystem> outletLayouotDetails) {
		this.outletLayouotDetails = outletLayouotDetails;
	}
	public List<WarehousePOS> getWarehousePOSList() {
		return warehousePOSList;
	}
	public void setWarehousePOSList(List<WarehousePOS> warehousePOSList) {
		this.warehousePOSList = warehousePOSList;
	}
	public List<OutletStorageSystem> getOutletStorageSystems() {
		return outletStorageSystems;
	}
	public void setOutletStorageSystems(
			List<OutletStorageSystem> outletStorageSystems) {
		this.outletStorageSystems = outletStorageSystems;
	}
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	public List<Warehouse> getWarehouses() {
		return warehouses;
	}
	public void setWarehouses(List<Warehouse> warehouses) {
		this.warehouses = warehouses;
	}
	public String getWarehouseId() {
		return warehouseId;
	}
	public void setWarehouseId(String warehouseId) {
		this.warehouseId = warehouseId;
	}
	/*public Warehouse getWarehouse() {
		return warehouse;
	}
	public void setWarehouse(Warehouse warehouse) {
		this.warehouse = warehouse;
	}*/
	
	
	public int getTotalRecords() {
		return totalRecords;
	}
	public WarehouseBean getWarehouse() {
		return warehouse;
	}
	public void setWarehouse(WarehouseBean warehouse) {
		this.warehouse = warehouse;
	}
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
	public List<WarehouseStorageSystems> getStorageSystems() {
		return storageSystems;
	}
	public void setStorageSystems(List<WarehouseStorageSystems> storageSystems) {
		this.storageSystems = storageSystems;
	}
	
	
}
