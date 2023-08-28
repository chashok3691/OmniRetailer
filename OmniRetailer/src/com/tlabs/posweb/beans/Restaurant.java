package com.tlabs.posweb.beans;

import java.util.List;
/*This bean useful to populate the restaurant information */
public class Restaurant {
	
	private RequestHeader requestHeader;
	private ResponseHeader responseHeader;
	
	private String layoutId;
	private String layoutName;
	private String layoutDescription;
	private String outletId;
	private String noOfChairs;
	private String status;
	private String tableNo;
	private String level;
	private byte[]picture;
	private String pictureString;
	private String tableStatus;
	private String cleanStatus;
	private String dateTimeStr;
	private String tableDescription;
	private String layoutCode;//can remove this field not useful
	private String location;
	private String tableLeft;
	private String tableTop;
	private String display;
	private String extNo;
	private String phoneNo;
	private String categoryName;
	private int sequenceNumber;
	private String sectionId;
	private String sectionName;
	//additional fields
	private long noOfAvailableTables;
	private int noOfRequiredTables;
	private List<Restaurant> tableNumbers;
	private boolean pictureRemoved;
	private List<SkuPriceList> skuPrices;
	private List<TaxDetails> taxes;
	private int minCapacity;
	private List<Restaurant> tablesInfo;
    //added for images
	private String pictureRef;
	private boolean pictureFlag;
	
    public String getPictureRef() {
		return pictureRef;
	}
	public void setPictureRef(String pictureRef) {
		this.pictureRef = pictureRef;
	}
	public boolean isPictureFlag() {
		return pictureFlag;
	}
	public void setPictureFlag(boolean pictureFlag) {
		this.pictureFlag = pictureFlag;
	}


	
	public String getTableNo() {
		return tableNo;
	}
	public void setTableNo(String tableNo) {
		this.tableNo = tableNo;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public byte[] getPicture() {
		return picture;
	}
	public void setPicture(byte[] picture) {
		this.picture = picture;
	}
	public String getPictureString() {
		return pictureString;
	}
	public void setPictureString(String pictureString) {
		this.pictureString = pictureString;
	}
	public String getTableStatus() {
		return tableStatus;
	}
	public void setTableStatus(String tableStatus) {
		this.tableStatus = tableStatus;
	}
	public String getCleanStatus() {
		return cleanStatus;
	}
	public void setCleanStatus(String cleanStatus) {
		this.cleanStatus = cleanStatus;
	}
	public String getDateTimeStr() {
		return dateTimeStr;
	}
	public void setDateTimeStr(String dateTimeStr) {
		this.dateTimeStr = dateTimeStr;
	}
	public String getTableDescription() {
		return tableDescription;
	}
	public void setTableDescription(String tableDescription) {
		this.tableDescription = tableDescription;
	}
	public String getLayoutCode() {
		return layoutCode;
	}
	public void setLayoutCode(String layoutCode) {
		this.layoutCode = layoutCode;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getTableLeft() {
		return tableLeft;
	}
	public void setTableLeft(String tableLeft) {
		this.tableLeft = tableLeft;
	}
	public String getTableTop() {
		return tableTop;
	}
	public void setTableTop(String tableTop) {
		this.tableTop = tableTop;
	}
	public String getDisplay() {
		return display;
	}
	public void setDisplay(String display) {
		this.display = display;
	}
	public int getSequenceNumber() {
		return sequenceNumber;
	}
	public void setSequenceNumber(int sequenceNumber) {
		this.sequenceNumber = sequenceNumber;
	}
	public long getNoOfAvailableTables() {
		return noOfAvailableTables;
	}
	public void setNoOfAvailableTables(long noOfAvailableTables) {
		this.noOfAvailableTables = noOfAvailableTables;
	}
	public int getNoOfRequiredTables() {
		return noOfRequiredTables;
	}
	public void setNoOfRequiredTables(int noOfRequiredTables) {
		this.noOfRequiredTables = noOfRequiredTables;
	}
	public List<Restaurant> getTableNumbers() {
		return tableNumbers;
	}
	public void setTableNumbers(List<Restaurant> tableNumbers) {
		this.tableNumbers = tableNumbers;
	}
	public boolean isPictureRemoved() {
		return pictureRemoved;
	}
	public void setPictureRemoved(boolean pictureRemoved) {
		this.pictureRemoved = pictureRemoved;
	}
	public List<SkuPriceList> getSkuPrices() {
		return skuPrices;
	}
	public void setSkuPrices(List<SkuPriceList> skuPrices) {
		this.skuPrices = skuPrices;
	}
	public List<TaxDetails> getTaxes() {
		return taxes;
	}
	public void setTaxes(List<TaxDetails> taxes) {
		this.taxes = taxes;
	}
	public int getMinCapacity() {
		return minCapacity;
	}
	public void setMinCapacity(int minCapacity) {
		this.minCapacity = minCapacity;
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
	public List<Restaurant> getTablesInfo() {
		return tablesInfo;
	}
	public void setTablesInfo(List<Restaurant> tablesInfo) {
		this.tablesInfo = tablesInfo;
	}
	public String getExtNo() {
		return extNo;
	}
	public void setExtNo(String extNo) {
		this.extNo = extNo;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getSectionId() {
		return sectionId;
	}
	public void setSectionId(String sectionId) {
		this.sectionId = sectionId;
	}
	public String getSectionName() {
		return sectionName;
	}
	public void setSectionName(String sectionName) {
		this.sectionName = sectionName;
	}
	public String getLayoutId() {
		return layoutId;
	}
	public void setLayoutId(String layoutId) {
		this.layoutId = layoutId;
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
	public String getNoOfChairs() {
		return noOfChairs;
	}
	public void setNoOfChairs(String noOfChairs) {
		this.noOfChairs = noOfChairs;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}


	public Restaurant( String cleanStatus,
			String dateTimeStr, String display,
			String layoutCode, String level, String location,
			long noOfAvailableRooms, int noOfRequiredRooms, String phoneNo,
			byte[] picture, String tableDescription, String tableLeft,
			String tableNo, String tableStatus, String tableTop,
			String pictureString,boolean pictureRemoved, Integer sequenceNumber,int minCapacity, String sectionId, String sectionName) {
		super();
		this.cleanStatus = cleanStatus;
		this.dateTimeStr = dateTimeStr;
		this.display = display;
		this.layoutCode = layoutCode;
		this.level = level;
		this.location = location;
		this.noOfAvailableTables = noOfAvailableRooms;
		this.noOfRequiredTables = noOfRequiredRooms;
//		this.phoneNo = phoneNo;
		this.picture = picture;
		this.tableDescription = tableDescription;
		this.tableLeft = tableLeft;
		this.tableNo = tableNo;
		this.tableStatus = tableStatus;
		this.tableTop = tableTop;
		this.pictureString = pictureString;
		this.pictureRemoved = pictureRemoved;
		this.sequenceNumber = sequenceNumber;
		this.minCapacity = minCapacity;
		this.sectionId = sectionId;
		this.sectionName = sectionName;
		this.layoutName = location;// need to change
		this.layoutDescription = location;// need to change
		this.noOfChairs = ""+minCapacity+"";
	}
	
	
}