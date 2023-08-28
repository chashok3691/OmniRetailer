package com.tlabs.posweb.beans;

import java.util.List;

import com.tlabs.posweb.beans.WareHouseSku;
import com.tlabs.posweb.beans.WarehouseSkuPriceList;

public class WareHouseSkuResponse {
	
	private ResponseHeader responseHeader;
	
	private List<WareHouseSku> 	warehouseSku;
	private WareHouseSku warehouseskumaster;
	
	private List<WarehouseSkuPriceList> warehouseSkuPriceLists;
	
	private List<SkuPriceListDetails> skuLists;
	
	public List<SkuPriceListDetails> getSkuLists() {
		return skuLists;
	}

	public void setSkuLists(List<SkuPriceListDetails> skuLists) {
		this.skuLists = skuLists;
	}

	
	


	public WareHouseSku getWarehouseskumaster() {
		return warehouseskumaster;
	}

	public void setWarehouseskumaster(WareHouseSku warehouseskumaster) {
		this.warehouseskumaster = warehouseskumaster;
	}

	private int totalRecords;

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public List<WareHouseSku> getWarehouseSku() {
		return warehouseSku;
	}

	public void setWarehouseSku(List<WareHouseSku> warehouseSku) {
		this.warehouseSku = warehouseSku;
	}

	public List<WarehouseSkuPriceList> getWarehouseSkuPriceLists() {
		return warehouseSkuPriceLists;
	}

	public void setWarehouseSkuPriceLists(List<WarehouseSkuPriceList> warehouseSkuPriceLists) {
		this.warehouseSkuPriceLists = warehouseSkuPriceLists;
	}
	
	

}
