package com.tlabs.posweb.beans;


/**
* @author 		: kesav A
* @Created_on   : 28-03-2016
* @verified_By  :
* @modified_By  : 
* @modified_On  :  
* @modified_Ref :  
* @description  : This class is used to interact with the  shipment_rate_master table in database . 
* */
public class ShipmentRateMaster {
	private int sno;
	private String locationId;
	private String shipmentMode;
	private String shipmentType;
	private String packageType;
	private float orderStartPrice;
	private float orderEndPrice;
	private float orderQuantityStartValue;
	private float orderQuantityEndValue ;
	private float distanceStartRangeValue;
	private float distanceEndRangeValue;
	private float weightStartRangeValue;
	private float weightEndRangeValue;
	private String shipmentCountry;
	private float shipmentCost;
	private String remarks;
	private RequestHeader requestHeader;
	private ResponseHeader responseHeader;
    private String shipmentCostStr;
    private String orderStartPriceStr;
    private String orderEndPriceStr;
    private String orderQuantityStartValueStr;
    private String orderQuantityEndValueStr;
    private String weightStartRangeValueStr;
    private String weightEndRangeValueStr;
    private String distanceStartRangeValueStr;
    private String distanceEndRangeValueStr;
	private String searchCriteria;
	private String startIndex;
	private String maxRecords;
	private String snoStr;
	private String orderQuantityRange;
	private String orderPriceRange;
	private String distanceRange;
	private String[] serialNums;
	private String totalRecords;
	private int slNo;
	private ShipmentRateMaster shipmentRateObj;
	/*private String shipmentLatitude;
	private String shipmentLongitude;*/
//	private String orderValue;
	private String toLocationCountry;
	private String toLocationState;
	private String storeLocation;
	private Float orderQtyValue;
	
	
private float orderValue;
private float shipmentLatitude;
private float shipmentLongitude;


	public Float getOrderQtyValue() {
		return orderQtyValue;
	}

	public void setOrderQtyValue(Float orderQtyValue) {
		this.orderQtyValue = orderQtyValue;
	}

	/*public String getShipmentLatitude() {
		return shipmentLatitude;
	}

	public void setShipmentLatitude(String shipmentLatitude) {
		this.shipmentLatitude = shipmentLatitude;
	}

	public String getShipmentLongitude() {
		return shipmentLongitude;
	}

	public void setShipmentLongitude(String shipmentLongitude) {
		this.shipmentLongitude = shipmentLongitude;
	}
*/
/*	public String getOrderValue() {
		return orderValue;
	}

	public void setOrderValue(String orderValue) {
		this.orderValue = orderValue;
	}*/

	public String getToLocationCountry() {
		return toLocationCountry;
	}

	public float getShipmentLatitude() {
		return shipmentLatitude;
	}

	public void setShipmentLatitude(float shipmentLatitude) {
		this.shipmentLatitude = shipmentLatitude;
	}

	public float getShipmentLongitude() {
		return shipmentLongitude;
	}

	public void setShipmentLongitude(float shipmentLongitude) {
		this.shipmentLongitude = shipmentLongitude;
	}

	public float getOrderValue() {
		return orderValue;
	}

	public void setOrderValue(float orderValue) {
		this.orderValue = orderValue;
	}

	public void setToLocationCountry(String toLocationCountry) {
		this.toLocationCountry = toLocationCountry;
	}

	public String getToLocationState() {
		return toLocationState;
	}

	public void setToLocationState(String toLocationState) {
		this.toLocationState = toLocationState;
	}

	public String getStoreLocation() {
		return storeLocation;
	}

	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}

	public ShipmentRateMaster getShipmentRateObj() {
		return shipmentRateObj;
	}

	public void setShipmentRateObj(ShipmentRateMaster shipmentRateObj) {
		this.shipmentRateObj = shipmentRateObj;
	}

	public int getSlNo() {
		return slNo;
	}

	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}

	public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public String getLocationId() {
		return locationId;
	}

	public void setLocationId(String locationId) {
		this.locationId = locationId;
	}

	public String getShipmentMode() {
		return shipmentMode;
	}

	public void setShipmentMode(String shipmentMode) {
		this.shipmentMode = shipmentMode;
	}

	public String getShipmentType() {
		return shipmentType;
	}

	public void setShipmentType(String shipmentType) {
		this.shipmentType = shipmentType;
	}

	public String getPackageType() {
		return packageType;
	}

	public void setPackageType(String packageType) {
		this.packageType = packageType;
	}

	public float getOrderStartPrice() {
		return orderStartPrice;
	}

	public void setOrderStartPrice(float orderStartPrice) {
		this.orderStartPrice = orderStartPrice;
	}

	public float getOrderEndPrice() {
		return orderEndPrice;
	}

	public void setOrderEndPrice(float orderEndPrice) {
		this.orderEndPrice = orderEndPrice;
	}

	public float getOrderQuantityStartValue() {
		return orderQuantityStartValue;
	}

	public void setOrderQuantityStartValue(float orderQuantityStartValue) {
		this.orderQuantityStartValue = orderQuantityStartValue;
	}

	public float getOrderQuantityEndValue() {
		return orderQuantityEndValue;
	}

	public void setOrderQuantityEndValue(float orderQuantityEndValue) {
		this.orderQuantityEndValue = orderQuantityEndValue;
	}

	public float getWeightStartRangeValue() {
		return weightStartRangeValue;
	}

	public void setWeightStartRangeValue(float weightStartRangeValue) {
		this.weightStartRangeValue = weightStartRangeValue;
	}

	public float getWeightEndRangeValue() {
		return weightEndRangeValue;
	}

	public void setWeightEndRangeValue(float weightEndRangeValue) {
		this.weightEndRangeValue = weightEndRangeValue;
	}

	public float getDistanceStartRangeValue() {
		return distanceStartRangeValue;
	}

	public void setDistanceStartRangeValue(float distanceStartRangeValue) {
		this.distanceStartRangeValue = distanceStartRangeValue;
	}

	public float getDistanceEndRangeValue() {
		return distanceEndRangeValue;
	}

	public void setDistanceEndRangeValue(float distanceEndRangeValue) {
		this.distanceEndRangeValue = distanceEndRangeValue;
	}

	public String getShipmentCountry() {
		return shipmentCountry;
	}

	public void setShipmentCountry(String shipmentCountry) {
		this.shipmentCountry = shipmentCountry;
	}

 
	public String getShipmentCostStr() {
		return shipmentCostStr;
	}

	public String getOrderQuantityRange() {
		return orderQuantityRange;
	}

	public String[] getSerialNums() {
		return serialNums;
	}

	public void setSerialNums(String[] serialNums) {
		this.serialNums = serialNums;
	}

	public void setOrderQuantityRange(String orderQuantityRange) {
		this.orderQuantityRange = orderQuantityRange;
	}

	public String getOrderPriceRange() {
		return orderPriceRange;
	}

	public void setOrderPriceRange(String orderPriceRange) {
		this.orderPriceRange = orderPriceRange;
	}

	public String getDistanceRange() {
		return distanceRange;
	}

	public void setDistanceRange(String distanceRange) {
		this.distanceRange = distanceRange;
	}

	public String getSnoStr() {
		return snoStr;
	}

	public void setSnoStr(String snoStr) {
		this.snoStr = snoStr;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	public String getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}

	public String getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}

	public void setShipmentCostStr(String shipmentCostStr) {
		this.shipmentCostStr = shipmentCostStr;
	}

	public String getOrderStartPriceStr() {
		return orderStartPriceStr;
	}

	public void setOrderStartPriceStr(String orderStartPriceStr) {
		this.orderStartPriceStr = orderStartPriceStr;
	}

	public String getOrderEndPriceStr() {
		return orderEndPriceStr;
	}

	public void setOrderEndPriceStr(String orderEndPriceStr) {
		this.orderEndPriceStr = orderEndPriceStr;
	}

	public String getOrderQuantityStartValueStr() {
		return orderQuantityStartValueStr;
	}

	public void setOrderQuantityStartValueStr(String orderQuantityStartValueStr) {
		this.orderQuantityStartValueStr = orderQuantityStartValueStr;
	}

	public String getOrderQuantityEndValueStr() {
		return orderQuantityEndValueStr;
	}

	public void setOrderQuantityEndValueStr(String orderQuantityEndValueStr) {
		this.orderQuantityEndValueStr = orderQuantityEndValueStr;
	}

	public String getWeightStartRangeValueStr() {
		return weightStartRangeValueStr;
	}

	public void setWeightStartRangeValueStr(String weightStartRangeValueStr) {
		this.weightStartRangeValueStr = weightStartRangeValueStr;
	}

	public String getWeightEndRangeValueStr() {
		return weightEndRangeValueStr;
	}

	public void setWeightEndRangeValueStr(String weightEndRangeValueStr) {
		this.weightEndRangeValueStr = weightEndRangeValueStr;
	}

	public String getDistanceStartRangeValueStr() {
		return distanceStartRangeValueStr;
	}

	public void setDistanceStartRangeValueStr(String distanceStartRangeValueStr) {
		this.distanceStartRangeValueStr = distanceStartRangeValueStr;
	}

	public String getDistanceEndRangeValueStr() {
		return distanceEndRangeValueStr;
	}

	public void setDistanceEndRangeValueStr(String distanceEndRangeValueStr) {
		this.distanceEndRangeValueStr = distanceEndRangeValueStr;
	}

 
	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public float getShipmentCost() {
		return shipmentCost;
	}

	public void setShipmentCost(float shipmentCost) {
		this.shipmentCost = shipmentCost;
	}
	
}
