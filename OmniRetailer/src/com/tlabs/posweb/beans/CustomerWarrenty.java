package com.tlabs.posweb.beans;




public class CustomerWarrenty {
	
	private String warrentyId;
	private String pluCode;
	private String skuId;
	private String productRange;
	private String measureRange;
	private String productDescription;
	private String productCategory;
	private String productSubCategory;
	private String customerName;
	private String customerPhoneNum;
	private String barcode;
	private String department;
	private String dateOfPurchaseStr;
	private String mfgDateStr;
	private String customerAddress;
	private String warrentyDetails;
	private String status;
	private String warrentyHistory;
	private String country;
	private String city;
	private String state;
	private String userName;
	private String userRole; 
	private float itemPrice;
	private float quantity;
	private float discountPrice;
	private float tax;
	private float totalPrice;
	private RequestHeader requestHeader;
	private ResponseHeader responseHeader;
	private String warrentyExpireDateStr;
	private String searchCriteria;
	private String startIndex;
	private String maxRecords;
	private int slNo;
	private String totalRecords;
	private String startDate;
	private String endDate;
	private String storeLocation;
	
	public String getCustomerName() {
		return customerName;
	}

	public String getDateOfPurchaseStr() {
		return dateOfPurchaseStr;
	}

	public void setDateOfPurchaseStr(String dateOfPurchaseStr) {
		this.dateOfPurchaseStr = dateOfPurchaseStr;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerPhoneNum() {
		return customerPhoneNum;
	}

	public void setCustomerPhoneNum(String customerPhoneNum) {
		this.customerPhoneNum = customerPhoneNum;
	}

	public String getDepartment() {
		return department;
	}

	public String getMfgDateStr() {
		return mfgDateStr;
	}

	public void setMfgDateStr(String mfgDateStr) {
		this.mfgDateStr = mfgDateStr;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

 

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	public String getCustomerAddress() {
		return customerAddress;
	}

	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}

	public String getWarrentyDetails() {
		return warrentyDetails;
	}

	public String getProductSubCategory() {
		return productSubCategory;
	}

	public void setProductSubCategory(String productSubCategory) {
		this.productSubCategory = productSubCategory;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public void setWarrentyDetails(String warrentyDetails) {
		this.warrentyDetails = warrentyDetails;
	}

	public String getStatus() {
		return status;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getStoreLocation() {
		return storeLocation;
	}

	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}

	public String getWarrentyId() {
		return warrentyId;
	}

	public void setWarrentyId(String warrentyId) {
		this.warrentyId = warrentyId;
	}

	public int getSlNo() {
		return slNo;
	}

	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}

	public String getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

 
 

	public void setStatus(String status) {
		this.status = status;
	}

	public String getWarrentyHistory() {
		return warrentyHistory;
	}

	public void setWarrentyHistory(String warrentyHistory) {
		this.warrentyHistory = warrentyHistory;
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

	public String getWarrentyExpireDateStr() {
		return warrentyExpireDateStr;
	}

	public void setWarrentyExpireDateStr(String warrentyExpireDateStr) {
		this.warrentyExpireDateStr = warrentyExpireDateStr;
	}

	public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

	public String getPluCode() {
		return pluCode;
	}

	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}

	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}

	public String getProductRange() {
		return productRange;
	}

	public void setProductRange(String productRange) {
		this.productRange = productRange;
	}

	public String getMeasureRange() {
		return measureRange;
	}

	public void setMeasureRange(String measureRange) {
		this.measureRange = measureRange;
	}

	public String getBarcode() {
		return barcode;
	}

	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	public float getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(float itemPrice) {
		this.itemPrice = itemPrice;
	}

	public float getQuantity() {
		return quantity;
	}

	public void setQuantity(float quantity) {
		this.quantity = quantity;
	}

	public float getDiscountPrice() {
		return discountPrice;
	}

	public void setDiscountPrice(float discountPrice) {
		this.discountPrice = discountPrice;
	}

	public float getTax() {
		return tax;
	}

	public void setTax(float tax) {
		this.tax = tax;
	}

	public float getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(float totalPrice) {
		this.totalPrice = totalPrice;
	}
	
 
}
