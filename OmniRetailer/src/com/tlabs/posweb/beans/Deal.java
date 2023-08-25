package com.tlabs.posweb.beans;

import java.util.List;

public class Deal {
	private boolean imageDeleted;
	private String dealID;
	private String dealName;
	private String dealDescription;
	private String dealCategory ;
	private String storeLocation ;
	private String priority; 	
	private String dealStatus; 
	private String claimCoupons;
	private String claimLoyaltypoints;
	private String claimgiftvouchers; 
	private String sellProducts; 
	private String sellSkuids = null; 
	private String dealProducts; 
	private String dealSkus = null; 
	private String dealRanges; 
	private String dealStartDate; 
	private String dealEndDate;
	private String deal_image;
	private List<DealRanges> rangeBeanList;
	private List<DealRanges> rangeList;
	private String bannerImage;
	private RequestHeader requestHeader;
	private String startIndex;
	private String startDate;
	private String endDate;
	private String[] storeLocations;
	
	private List<DealLocations>  dealLocationsList;
	public List<DealProducts> dealProductList;
	
	private String productDepartment;
	
	private String Section;

	private String brand;
	private boolean allowExchanges;

	private boolean allowReturns;
	private String zoneId;
	private String rewardType;
	
	private boolean saveReport;
	
	private String filePath;
	private boolean salePriceBased;
	
	

	
	
	

	
	public boolean isSalePriceBased() {
		return salePriceBased;
	}
	public void setSalePriceBased(boolean salePriceBased) {
		this.salePriceBased = salePriceBased;
	}
	public boolean isSaveReport() {
		return saveReport;
	}
	public void setSaveReport(boolean saveReport) {
		this.saveReport = saveReport;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getRewardType() {
		return rewardType;
	}
	public void setRewardType(String rewardType) {
		this.rewardType = rewardType;
	}
	public String getZoneId() {
		return zoneId;
	}
	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}
	public boolean isAllowExchanges() {
		return allowExchanges;
	}
	public void setAllowExchanges(boolean allowExchanges) {
		this.allowExchanges = allowExchanges;
	}
	public boolean isAllowReturns() {
		return allowReturns;
	}
	public void setAllowReturns(boolean allowReturns) {
		this.allowReturns = allowReturns;
	}
	public String getProductDepartment() {
		return productDepartment;
	}
	public void setProductDepartment(String productDepartment) {
		this.productDepartment = productDepartment;
	}
	public String getSection() {
		return Section;
	}
	public void setSection(String section) {
		Section = section;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public List<DealProducts> getDealProductList() {
		return dealProductList;
	}
	public void setDealProductList(List<DealProducts> dealProductList) {
		this.dealProductList = dealProductList;
	}
	private String updated_date;
	
	public String getUpdated_date() {
		return updated_date;
	}
	public void setUpdated_date(String updated_date) {
		this.updated_date = updated_date;
	}
	public List<DealLocations> getDealLocationsList() {
		return dealLocationsList;
	}
	public void setDealLocationsList(List<DealLocations> dealLocationsList) {
		this.dealLocationsList = dealLocationsList;
	}
	private List<?> sell_products;
	private List<?> sell_skus;
	private List<?> deal_products;
	private List<?> deal_skus;
	List<String> dealIDList;
	private String category;
	private String totalRecords;
	private boolean imageRequired;
	private String imageRefId;
	private CustomerFilter customerFilter;
	private String dealImageText;
	private String dealImageTextFont;
	private String dealImageSize;
	private String dealImageColor;
	private int dealImageBold;
	private int dealImageItalic;
	private int dealImageStrike;
	private String salePriceText;
	private String salePriceFont;
	private String salePriceSize;
	private String salePriceColor;
	private int salePriceBold;
	private int salePriceItalic;
	private int salePriceStrike;
	private String dealPriceText;
	private String dealPriceFont;
	private String dealPriceSize;
	private String dealPriceColor;
	private int dealPriceBold;
	private int dealPriceItalic;
	private int dealPriceStrike;
	
	private String authorisedBy;
	private String closedBy;
	private String closedOn;
	private String closedReason;

	private boolean allowMultipleDiscounts;
	private String dealGroupId;
	private String dealStartTime;
	private String dealEndTime;
	private boolean day1;
	private boolean day2;
	private boolean day3;
	private boolean day4;
	private boolean day5;
	private boolean day6;
	private boolean day7;
	private boolean repeat;
	private boolean isBanner;
	private String sellGroupId;
	private boolean bannerImg;
	private String createdOnStr;
	
	private String dealPicture;
	
	
	
	public String getDealPicture() {
		return dealPicture;
	}
	public void setDealPicture(String dealPicture) {
		this.dealPicture = dealPicture;
	}
	public String getCreatedOnStr() {
		return createdOnStr;
	}
	public void setCreatedOnStr(String createdOnStr) {
		this.createdOnStr = createdOnStr;
	}
	List<String> dealSkuList;
	private String closedOnStr;
	private String dealStartTimeStr;
	private String dealEndTimeStr;
	
	private String saleProductCategory;
	private String saleProductSubCategory;
	private String dealProductCategory;
	private String dealProductSubCategory;
	private String dealPluCode;
	private String sellPluCode;
	
	private String searchKey;
	private String searchCriteria;
	private String maxRecords;
	private String searchText;
	private boolean imageFlag;
	private boolean isCustomerSpecific;
	
	private String userName;
	private String roleName;
	
	
	private String searchStartDate;
	private String searchEndDate;
	
	public String getSearchStartDate() {
		return searchStartDate;
	}
	public void setSearchStartDate(String searchStartDate) {
		this.searchStartDate = searchStartDate;
	}
	public String getSearchEndDate() {
		return searchEndDate;
	}
	public void setSearchEndDate(String searchEndDate) {
		this.searchEndDate = searchEndDate;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public boolean isImageFlag() {
		return imageFlag;
	}
	public void setImageFlag(boolean imageFlag) {
		this.imageFlag = imageFlag;
	}
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public String getMaxRecords() {
		return maxRecords;
	}
	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}
	private boolean combo;
	private boolean lowestPriceItem;
	
	public boolean isLowestPriceItem() {
		return lowestPriceItem;
	}
	public void setLowestPriceItem(boolean lowestPriceItem) {
		this.lowestPriceItem = lowestPriceItem;
	}
	public boolean isCombo() {
		return combo;
	}
	public void setCombo(boolean combo) {
		this.combo = combo;
	}
	public String getSearchKey() {
		return searchKey;
	}
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	public String getSearchCriteria() {
		return searchCriteria;
	}
	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}
	public String getSaleProductCategory() {
		return saleProductCategory;
	}
	public void setSaleProductCategory(String saleProductCategory) {
		this.saleProductCategory = saleProductCategory;
	}
	public String getSaleProductSubCategory() {
		return saleProductSubCategory;
	}
	public void setSaleProductSubCategory(String saleProductSubCategory) {
		this.saleProductSubCategory = saleProductSubCategory;
	}
	public String getDealProductCategory() {
		return dealProductCategory;
	}
	public void setDealProductCategory(String dealProductCategory) {
		this.dealProductCategory = dealProductCategory;
	}
	public String getDealProductSubCategory() {
		return dealProductSubCategory;
	}
	public void setDealProductSubCategory(String dealProductSubCategory) {
		this.dealProductSubCategory = dealProductSubCategory;
	}
	public String getDealPluCode() {
		return dealPluCode;
	}
	public void setDealPluCode(String dealPluCode) {
		this.dealPluCode = dealPluCode;
	}
	public String getSellPluCode() {
		return sellPluCode;
	}
	public void setSellPluCode(String sellPluCode) {
		this.sellPluCode = sellPluCode;
	}
	public boolean isBannerImg() {
		return bannerImg;
	}
	public void setBannerImg(boolean bannerImg) {
		this.bannerImg = bannerImg;
	}
	public boolean isBanner() {
		return isBanner;
	}
	public void setBanner(boolean isBanner) {
		this.isBanner = isBanner;
	}
	public boolean isRepeat() {
		return repeat;
	}
	public void setRepeat(boolean repeat) {
		this.repeat = repeat;
	}
	public String getDealStartTimeStr() {
		return dealStartTimeStr;
	}
	public void setDealStartTimeStr(String dealStartTimeStr) {
		this.dealStartTimeStr = dealStartTimeStr;
	}
	public String getDealEndTimeStr() {
		return dealEndTimeStr;
	}
	public void setDealEndTimeStr(String dealEndTimeStr) {
		this.dealEndTimeStr = dealEndTimeStr;
	}
	public String getClosedOnStr() {
		return closedOnStr;
	}
	public void setClosedOnStr(String closedOnStr) {
		this.closedOnStr = closedOnStr;
	}
	public String getAuthorisedBy() {
		return authorisedBy;
	}
	public void setAuthorisedBy(String authorisedBy) {
		this.authorisedBy = authorisedBy;
	}
	public String getClosedBy() {
		return closedBy;
	}
	public void setClosedBy(String closedBy) {
		this.closedBy = closedBy;
	}
	
	public String getClosedOn() {
		return closedOn;
	}
	public void setClosedOn(String closedOn) {
		this.closedOn = closedOn;
	}
	public String getClosedReason() {
		return closedReason;
	}
	public void setClosedReason(String closedReason) {
		this.closedReason = closedReason;
	}
	public boolean isAllowMultipleDiscounts() {
		return allowMultipleDiscounts;
	}
	public void setAllowMultipleDiscounts(boolean allowMultipleDiscounts) {
		this.allowMultipleDiscounts = allowMultipleDiscounts;
	}
	public String getDealGroupId() {
		return dealGroupId;
	}
	public void setDealGroupId(String dealGroupId) {
		this.dealGroupId = dealGroupId;
	}
	
	public String getDealStartTime() {
		return dealStartTime;
	}
	public void setDealStartTime(String dealStartTime) {
		this.dealStartTime = dealStartTime;
	}
	public String getDealEndTime() {
		return dealEndTime;
	}
	public void setDealEndTime(String dealEndTime) {
		this.dealEndTime = dealEndTime;
	}
	public boolean isDay1() {
		return day1;
	}
	public void setDay1(boolean day1) {
		this.day1 = day1;
	}
	public boolean isDay2() {
		return day2;
	}
	public void setDay2(boolean day2) {
		this.day2 = day2;
	}
	public boolean isDay3() {
		return day3;
	}
	public void setDay3(boolean day3) {
		this.day3 = day3;
	}
	public boolean isDay4() {
		return day4;
	}
	public void setDay4(boolean day4) {
		this.day4 = day4;
	}
	public boolean isDay5() {
		return day5;
	}
	public void setDay5(boolean day5) {
		this.day5 = day5;
	}
	public boolean isDay6() {
		return day6;
	}
	public void setDay6(boolean day6) {
		this.day6 = day6;
	}
	public boolean isDay7() {
		return day7;
	}
	public void setDay7(boolean day7) {
		this.day7 = day7;
	}
	public String getSellGroupId() {
		return sellGroupId;
	}
	public void setSellGroupId(String sellGroupId) {
		this.sellGroupId = sellGroupId;
	}
	public List<String> getDealSkuList() {
		return dealSkuList;
	}
	public void setDealSkuList(List<String> dealSkuList) {
		this.dealSkuList = dealSkuList;
	}
	public int getDealImageBold() {
		return dealImageBold;
	}
	public void setDealImageBold(int dealImageBold) {
		this.dealImageBold = dealImageBold;
	}
	public int getDealImageItalic() {
		return dealImageItalic;
	}
	public void setDealImageItalic(int dealImageItalic) {
		this.dealImageItalic = dealImageItalic;
	}
	public int getDealImageStrike() {
		return dealImageStrike;
	}
	public void setDealImageStrike(int dealImageStrike) {
		this.dealImageStrike = dealImageStrike;
	}
	public int getSalePriceBold() {
		return salePriceBold;
	}
	public void setSalePriceBold(int salePriceBold) {
		this.salePriceBold = salePriceBold;
	}
	public int getSalePriceItalic() {
		return salePriceItalic;
	}
	public void setSalePriceItalic(int salePriceItalic) {
		this.salePriceItalic = salePriceItalic;
	}
	public int getSalePriceStrike() {
		return salePriceStrike;
	}
	public void setSalePriceStrike(int salePriceStrike) {
		this.salePriceStrike = salePriceStrike;
	}
	public int getDealPriceBold() {
		return dealPriceBold;
	}
	public void setDealPriceBold(int dealPriceBold) {
		this.dealPriceBold = dealPriceBold;
	}
	public int getDealPriceItalic() {
		return dealPriceItalic;
	}
	public void setDealPriceItalic(int dealPriceItalic) {
		this.dealPriceItalic = dealPriceItalic;
	}
	public int getDealPriceStrike() {
		return dealPriceStrike;
	}
	public void setDealPriceStrike(int dealPriceStrike) {
		this.dealPriceStrike = dealPriceStrike;
	}
	public String getDealImageText() {
		return dealImageText;
	}
	public void setDealImageText(String dealImageText) {
		this.dealImageText = dealImageText;
	}
	public String getDealImageTextFont() {
		return dealImageTextFont;
	}
	public void setDealImageTextFont(String dealImageTextFont) {
		this.dealImageTextFont = dealImageTextFont;
	}
	public String getDealImageSize() {
		return dealImageSize;
	}
	public void setDealImageSize(String dealImageSize) {
		this.dealImageSize = dealImageSize;
	}
	public String getDealImageColor() {
		return dealImageColor;
	}
	public void setDealImageColor(String dealImageColor) {
		this.dealImageColor = dealImageColor;
	}
	
	public String getSalePriceText() {
		return salePriceText;
	}
	public void setSalePriceText(String salePriceText) {
		this.salePriceText = salePriceText;
	}
	public String getSalePriceFont() {
		return salePriceFont;
	}
	public void setSalePriceFont(String salePriceFont) {
		this.salePriceFont = salePriceFont;
	}
	public String getSalePriceSize() {
		return salePriceSize;
	}
	public void setSalePriceSize(String salePriceSize) {
		this.salePriceSize = salePriceSize;
	}
	public String getSalePriceColor() {
		return salePriceColor;
	}
	public void setSalePriceColor(String salePriceColor) {
		this.salePriceColor = salePriceColor;
	}
	public String getDealPriceText() {
		return dealPriceText;
	}
	public void setDealPriceText(String dealPriceText) {
		this.dealPriceText = dealPriceText;
	}
	public String getDealPriceFont() {
		return dealPriceFont;
	}
	public void setDealPriceFont(String dealPriceFont) {
		this.dealPriceFont = dealPriceFont;
	}
	public String getDealPriceSize() {
		return dealPriceSize;
	}
	public void setDealPriceSize(String dealPriceSize) {
		this.dealPriceSize = dealPriceSize;
	}
	public String getDealPriceColor() {
		return dealPriceColor;
	}
	public void setDealPriceColor(String dealPriceColor) {
		this.dealPriceColor = dealPriceColor;
	}
	public boolean isImageDeleted() {
		return imageDeleted;
	}
	public void setImageDeleted(boolean imageDeleted) {
		this.imageDeleted = imageDeleted;
	}
	public CustomerFilter getCustomerFilter() {
		return customerFilter;
	}
	public void setCustomerFilter(CustomerFilter customerFilter) {
		this.customerFilter = customerFilter;
	}
	public String getImageRefId() {
		return imageRefId;
	}
	public void setImageRefId(String imageRefId) {
		this.imageRefId = imageRefId;
	}
	public boolean isImageRequired() {
		return imageRequired;
	}
	public void setImageRequired(boolean imageRequired) {
		this.imageRequired = imageRequired;
	}
	public String getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public List<String> getDealIDList() {
		return dealIDList;
	}
	public void setDealIDList(List<String> dealIDList) {
		this.dealIDList = dealIDList;
	}
	public List<?> getSell_products() {
		return sell_products;
	}
	public void setSell_products(List<?> sell_products) {
		this.sell_products = sell_products;
	}
	public List<?> getSell_skus() {
		return sell_skus;
	}
	public void setSell_skus(List<?> sell_skus) {
		this.sell_skus = sell_skus;
	}
	public List<?> getDeal_products() {
		return deal_products;
	}
	public void setDeal_products(List<?> deal_products) {
		this.deal_products = deal_products;
	}
	public List<?> getDeal_skus() {
		return deal_skus;
	}
	public void setDeal_skus(List<?> deal_skus) {
		this.deal_skus = deal_skus;
	}
	public String[] getStoreLocations() {
		return storeLocations;
	}
	public void setStoreLocations(String[] storeLocations) {
		this.storeLocations = storeLocations;
	}
	public String getBannerImage() {
		return bannerImage;
	}
	public void setBannerImage(String bannerImage) {
		this.bannerImage = bannerImage;
	}
	public List<DealRanges> getRangeList() {
		return rangeList;
	}
	public void setRangeList(List<DealRanges> rangeList) {
		this.rangeList = rangeList;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getDealID() {
		return dealID;
	}
	public void setDealID(String dealID) {
		this.dealID = dealID;
	}
	public String getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}
	
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	
	public List<DealRanges> getRangeBeanList() {
		return rangeBeanList;
	}
	public void setRangeBeanList(List<DealRanges> rangeBeanList) {
		this.rangeBeanList = rangeBeanList;
	}
	
	public String getDeal_image() {
		return deal_image;
	}
	public void setDeal_image(String deal_image) {
		this.deal_image = deal_image;
	}
	public String getDealName() {
		return dealName;
	}
	public void setDealName(String dealName) {
		this.dealName = dealName;
	}
	public String getDealDescription() {
		return dealDescription;
	}
	public void setDealDescription(String dealDescription) {
		this.dealDescription = dealDescription;
	}
	public String getDealCategory() {
		return dealCategory;
	}
	public void setDealCategory(String dealCategory) {
		this.dealCategory = dealCategory;
	}
	public String getStoreLocation() {
		return storeLocation;
	}
	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}
	public String getPriority() {
		return priority;
	}
	public void setPriority(String priority) {
		this.priority = priority;
	}
	public String getDealStatus() {
		return dealStatus;
	}
	public void setDealStatus(String dealStatus) {
		this.dealStatus = dealStatus;
	}
	public String getClaimCoupons() {
		return claimCoupons;
	}
	public void setClaimCoupons(String claimCoupons) {
		this.claimCoupons = claimCoupons;
	}
	public String getClaimLoyaltypoints() {
		return claimLoyaltypoints;
	}
	public void setClaimLoyaltypoints(String claimLoyaltypoints) {
		this.claimLoyaltypoints = claimLoyaltypoints;
	}
	public String getClaimgiftvouchers() {
		return claimgiftvouchers;
	}
	public void setClaimgiftvouchers(String claimgiftvouchers) {
		this.claimgiftvouchers = claimgiftvouchers;
	}
	public String getSellProducts() {
		return sellProducts;
	}
	public void setSellProducts(String sellProducts) {
		this.sellProducts = sellProducts;
	}
	public String getSellSkuids() {
		return sellSkuids;
	}
	public void setSellSkuids(String sellSkuids) {
		this.sellSkuids = sellSkuids;
	}
	
	public String getDealProducts() {
		return dealProducts;
	}
	public void setDealProducts(String dealProducts) {
		this.dealProducts = dealProducts;
	}
	public String getDealSkus() {
		return dealSkus;
	}
	public void setDealSkus(String dealSkus) {
		this.dealSkus = dealSkus;
	}
	public String getDealRanges() {
		return dealRanges;
	}
	public void setDealRanges(String dealRanges) {
		this.dealRanges = dealRanges;
	}
	public String getDealStartDate() {
		return dealStartDate;
	}
	public void setDealStartDate(String dealStartDate) {
		this.dealStartDate = dealStartDate;
	}
	public String getDealEndDate() {
		return dealEndDate;
	}
	public void setDealEndDate(String dealEndDate) {
		this.dealEndDate = dealEndDate;
	}
	public boolean isCustomerSpecific() {
		return isCustomerSpecific;
	}
	public void setCustomerSpecific(boolean isCustomerSpecific) {
		this.isCustomerSpecific = isCustomerSpecific;
	}
	
	
	
}
