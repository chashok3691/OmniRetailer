package com.tlabs.posweb.beans;

import java.util.List;


public class Offer {
	private boolean isCustomerSpecific;
	private boolean customerspecificflag;
	private String offerID;
	private String offerName;
	private String offerCategory;
	private String offerPriority; 
	private String productCategory; 
	private String offerImage;
	private String offerStartDate; 
	private String offerEndDate; 
	private String rewardType; 
	private String sellProducts; 
	private String sellSkuids; 
	//private String offerProducts;
	private String offerSkus; 
	private String offerStatus; 
	private String claimCoupons; 
	private String claimLoyaltypoints;
	private String claimgiftvouchers; 
	private String offerDescription; 
	private String offerRanges;
	private List<OfferRanges> offerRangesList;
	private String priority;
	private String storeLocation;
	private String startIndex;
	private String bannerImage;
	private List<?> offerIdList;
	private boolean imageRequired;
	private String totalRecords;
	private CustomerFilter customerFilter;
	private String offerImageText;
	private String offerImageTextFont;
	private String offerImageSize;
	private String offerImageColor;
	private int offerImageBold;
	private int offerImageItalic;
	private int offerImageStrike;
	private String salePriceText;
	private String salePriceFont;
	private String salePriceSize;
	private String salePriceColor;
	private int salePriceBold;
	private int salePriceItalic;
	private int salePriceStrike;
	private String offerPriceText;
	private String offerPriceFont;
	private String offerPriceSize;
	private String offerPriceColor;
	private int offerPriceBold;
	private int offerPriceItalic;
	private int offerPriceStrike;
	private String authorisedBy;
	private String closedBy;
	private String closedOn;
	private String closedReason;
	private String zoneId;
	private List<String> allLocationsList;
	
	private boolean itemSpecificTurnover;
	
	private boolean saveReport;
	
	private String filePath;
	private int numberBillsPerDay=0;
	
	private String offerPicture;
	
	private float maxPrice;
	private float minPrice;
	
	private String couponProgramId;
	
	
	
	
	
	public String getCouponProgramId() {
		return couponProgramId;
	}
	public void setCouponProgramId(String couponProgramId) {
		this.couponProgramId = couponProgramId;
	}
	public float getMaxPrice() {
		return maxPrice;
	}
	public void setMaxPrice(float maxPrice) {
		this.maxPrice = maxPrice;
	}
	public float getMinPrice() {
		return minPrice;
	}
	public void setMinPrice(float minPrice) {
		this.minPrice = minPrice;
	}
	public String getOfferPicture() {
		return offerPicture;
	}
	public void setOfferPicture(String offerPicture) {
		this.offerPicture = offerPicture;
	}
	public int getNumberBillsPerDay() {
		return numberBillsPerDay;
	}
	public void setNumberBillsPerDay(int numberBillsPerDay) {
		this.numberBillsPerDay = numberBillsPerDay;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public boolean isSaveReport() {
		return saveReport;
	}
	public void setSaveReport(boolean saveReport) {
		this.saveReport = saveReport;
	}
	public boolean isItemSpecificTurnover() {
		return itemSpecificTurnover;
	}
	public void setItemSpecificTurnover(boolean itemSpecificTurnover) {
		this.itemSpecificTurnover = itemSpecificTurnover;
	}
	public String getZoneId() {
		return zoneId;
	}
	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}
	private float rewardQty;
	
	private String fromDateStr;
	
	public String getFromDateStr() {
		return fromDateStr;
	}
	public void setFromDateStr(String fromDateStr) {
		this.fromDateStr = fromDateStr;
	}
	public float getRewardQty() {
		return rewardQty;
	}
	public void setRewardQty(float rewardQty) {
		this.rewardQty = rewardQty;
	}
	private boolean allowMultipleDiscounts;
	
	private String offerStartTime;
	private String offerEndTime;
	private boolean day1;
	private boolean day2;
	private boolean day3;
	private boolean day4;
	private boolean day5;
	private boolean day6;
	private boolean day7;
	private boolean repeat;
	private String sellGroupId;
	private List<OfferProducts> offerProducts;
	private String closedOnStr;
	private String offerStartTimeStr;
	private String offerEndTimeStr;
	private boolean isBanner;
	private boolean bannerImg;
	private String productSubCategory;
	private String sellPluCode;
	
	private String searchKey;
	private String searchCriteria;
	private boolean combo;
	private boolean lowestPriceItem;
	private boolean offerImageFlag;
	private String offerImageRef;
	private String maxRecords;
	private String createdOnStr;
	private boolean productSpecificFlag;
	
	private String userName;
	private String roleName;
	
	
	//added by manasa 
	
	private String startDateStr;
	private String endDateStr;
	private String offerLocation;
	
	private String updated_date;
	
	public String getUpdated_date() {
		return updated_date;
	}
	public void setUpdated_date(String updated_date) {
		this.updated_date = updated_date;
	}
	public String getOfferLocation() {
		return offerLocation;
	}
	public void setOfferLocation(String offerLocation) {
		this.offerLocation = offerLocation;
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
	private List<OfferLocations> offerLocationsList;
	private List<String> offerLocations;
	
	public List<String> getOfferLocations() {
		return offerLocations;
	}
	public void setOfferLocations(List<String> offerLocations) {
		this.offerLocations = offerLocations;
	}
	public List<OfferLocations> getOfferLocationsList() {
		return offerLocationsList;
	}
	public void setOfferLocationsList(List<OfferLocations> offerLocationsList) {
		this.offerLocationsList = offerLocationsList;
	}
	private boolean allowReturns;
	private boolean salePriceBased;
	private boolean allowExchanges;
	private boolean priceBasedConfigurationFlag;
	private boolean applyForAllItems;
	
	//private String brand;
	//@Column(name = "product_department")
	private String productDepartment;
	
	
	
	
	
	
	public boolean isSalePriceBased() {
		return salePriceBased;
	}
	public void setSalePriceBased(boolean salePriceBased) {
		this.salePriceBased = salePriceBased;
	}
	public String getProductDepartment() {
		return productDepartment;
	}
	public void setProductDepartment(String productDepartment) {
		this.productDepartment = productDepartment;
	}
	public String getProductSection() {
		return productSection;
	}
	public void setProductSection(String productSection) {
		this.productSection = productSection;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	//@Column(name = "section")
	private String productSection;
	
	//@Column(name = "brand")
	private String brand;
	
	
	public boolean isAllowReturns() {
		return allowReturns;
	}
	public void setAllowReturns(boolean allowReturns) {
		this.allowReturns = allowReturns;
	}
	public boolean isAllowExchanges() {
		return allowExchanges;
	}
	public void setAllowExchanges(boolean allowExchanges) {
		this.allowExchanges = allowExchanges;
	}
	public boolean isPriceBasedConfigurationFlag() {
		return priceBasedConfigurationFlag;
	}
	public void setPriceBasedConfigurationFlag(boolean priceBasedConfigurationFlag) {
		this.priceBasedConfigurationFlag = priceBasedConfigurationFlag;
	}
	public boolean isApplyForAllItems() {
		return applyForAllItems;
	}
	public void setApplyForAllItems(boolean applyForAllItems) {
		this.applyForAllItems = applyForAllItems;
	}
	public String getMaxRecords() {
		return maxRecords;
	}
	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}
	public boolean isOfferImageFlag() {
		return offerImageFlag;
	}
	public void setOfferImageFlag(boolean offerImageFlag) {
		this.offerImageFlag = offerImageFlag;
	}
	public String getOfferImageRef() {
		return offerImageRef;
	}
	public void setOfferImageRef(String offerImageRef) {
		this.offerImageRef = offerImageRef;
	}
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
	public String getSellPluCode() {
		return sellPluCode;
	}
	public void setSellPluCode(String sellPluCode) {
		this.sellPluCode = sellPluCode;
	}
	public String getProductSubCategory() {
		return productSubCategory;
	}
	public void setProductSubCategory(String productSubCategory) {
		this.productSubCategory = productSubCategory;
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
	public String getOfferStartTime() {
		return offerStartTime;
	}
	public void setOfferStartTime(String offerStartTime) {
		this.offerStartTime = offerStartTime;
	}
	public String getOfferEndTime() {
		return offerEndTime;
	}
	public void setOfferEndTime(String offerEndTime) {
		this.offerEndTime = offerEndTime;
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
	public String getClosedOnStr() {
		return closedOnStr;
	}
	public void setClosedOnStr(String closedOnStr) {
		this.closedOnStr = closedOnStr;
	}
	public String getOfferStartTimeStr() {
		return offerStartTimeStr;
	}
	public void setOfferStartTimeStr(String offerStartTimeStr) {
		this.offerStartTimeStr = offerStartTimeStr;
	}
	public String getOfferEndTimeStr() {
		return offerEndTimeStr;
	}
	public void setOfferEndTimeStr(String offerEndTimeStr) {
		this.offerEndTimeStr = offerEndTimeStr;
	}
	public String getOfferImageText() {
		return offerImageText;
	}
	public void setOfferImageText(String offerImageText) {
		this.offerImageText = offerImageText;
	}
	public String getOfferImageTextFont() {
		return offerImageTextFont;
	}
	public void setOfferImageTextFont(String offerImageTextFont) {
		this.offerImageTextFont = offerImageTextFont;
	}
	public String getOfferImageSize() {
		return offerImageSize;
	}
	public void setOfferImageSize(String offerImageSize) {
		this.offerImageSize = offerImageSize;
	}
	public String getOfferImageColor() {
		return offerImageColor;
	}
	public void setOfferImageColor(String offerImageColor) {
		this.offerImageColor = offerImageColor;
	}
	public int getOfferImageBold() {
		return offerImageBold;
	}
	public void setOfferImageBold(int offerImageBold) {
		this.offerImageBold = offerImageBold;
	}
	public int getOfferImageItalic() {
		return offerImageItalic;
	}
	public void setOfferImageItalic(int offerImageItalic) {
		this.offerImageItalic = offerImageItalic;
	}
	public int getOfferImageStrike() {
		return offerImageStrike;
	}
	public void setOfferImageStrike(int offerImageStrike) {
		this.offerImageStrike = offerImageStrike;
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
	public String getOfferPriceText() {
		return offerPriceText;
	}
	public void setOfferPriceText(String offerPriceText) {
		this.offerPriceText = offerPriceText;
	}
	public String getOfferPriceFont() {
		return offerPriceFont;
	}
	public void setOfferPriceFont(String offerPriceFont) {
		this.offerPriceFont = offerPriceFont;
	}
	public String getOfferPriceSize() {
		return offerPriceSize;
	}
	public void setOfferPriceSize(String offerPriceSize) {
		this.offerPriceSize = offerPriceSize;
	}
	public String getOfferPriceColor() {
		return offerPriceColor;
	}
	public void setOfferPriceColor(String offerPriceColor) {
		this.offerPriceColor = offerPriceColor;
	}
	public int getOfferPriceBold() {
		return offerPriceBold;
	}
	public void setOfferPriceBold(int offerPriceBold) {
		this.offerPriceBold = offerPriceBold;
	}
	public int getOfferPriceItalic() {
		return offerPriceItalic;
	}
	public void setOfferPriceItalic(int offerPriceItalic) {
		this.offerPriceItalic = offerPriceItalic;
	}
	public int getOfferPriceStrike() {
		return offerPriceStrike;
	}
	public void setOfferPriceStrike(int offerPriceStrike) {
		this.offerPriceStrike = offerPriceStrike;
	}
	public CustomerFilter getCustomerFilter() {
		return customerFilter;
	}
	public void setCustomerFilter(CustomerFilter customerFilter) {
		this.customerFilter = customerFilter;
	}
	
	
	public String getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}
	public boolean isImageRequired() {
		return imageRequired;
	}
	public void setImageRequired(boolean imageRequired) {
		this.imageRequired = imageRequired;
	}
	public List<?> getOfferIdList() {
		return offerIdList;
	}
	public void setOfferIdList(List<?> offerIdList) {
		this.offerIdList = offerIdList;
	}
	public String getBannerImage() {
		return bannerImage;
	}
	public void setBannerImage(String bannerImage) {
		this.bannerImage = bannerImage;
	}
	public String getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}
	public String getStoreLocation() {
		return storeLocation;
	}
	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}
	public String getOfferImage() {
		return offerImage;
	}
	public void setOfferImage(String offerImage) {
		this.offerImage = offerImage;
	}
	public String getPriority() {
		return priority;
	}
	public void setPriority(String priority) {
		this.priority = priority;
	}
	private String[] storeLocations;
	private List<?> sell_products;
	private List<?> sell_skus;
	private List<?> offer_products;
	private List<?> offer_skus;
	private RequestHeader requestHeader;
	
	
	
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	public String[] getStoreLocations() {
		return storeLocations;
	}
	public void setStoreLocations(String[] storeLocations) {
		this.storeLocations = storeLocations;
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
	
	public String getSellSkuids() {
		return sellSkuids;
	}
	public void setSellSkuids(String sellSkuids) {
		this.sellSkuids = sellSkuids;
	}
	public List<?> getOffer_products() {
		return offer_products;
	}
	public void setOffer_products(List<?> offer_products) {
		this.offer_products = offer_products;
	}
	public List<?> getOffer_skus() {
		return offer_skus;
	}
	public void setOffer_skus(List<?> offer_skus) {
		this.offer_skus = offer_skus;
	}
	
	public String getOfferID() {
		return offerID;
	}
	public void setOfferID(String offerID) {
		this.offerID = offerID;
	}
	public String getOfferName() {
		return offerName;
	}
	public void setOfferName(String offerName) {
		this.offerName = offerName;
	}
	public String getOfferCategory() {
		return offerCategory;
	}
	public void setOfferCategory(String offerCategory) {
		this.offerCategory = offerCategory;
	}
	public String getOfferPriority() {
		return offerPriority;
	}
	public void setOfferPriority(String offerPriority) {
		this.offerPriority = offerPriority;
	}
	
	
	public String getProductCategory() {
		return productCategory;
	}
	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}
	public String getOfferStartDate() {
		return offerStartDate;
	}
	public void setOfferStartDate(String offerStartDate) {
		this.offerStartDate = offerStartDate;
	}
	public String getOfferEndDate() {
		return offerEndDate;
	}
	public void setOfferEndDate(String offerEndDate) {
		this.offerEndDate = offerEndDate;
	}
	
	public String getRewardType() {
		return rewardType;
	}
	public void setRewardType(String rewardType) {
		this.rewardType = rewardType;
	}
	
	public String getSellProducts() {
		return sellProducts;
	}
	public void setSellProducts(String sellProducts) {
		this.sellProducts = sellProducts;
	}
	
	
	public String getOfferSkus() {
		return offerSkus;
	}
	public void setOfferSkus(String offerSkus) {
		this.offerSkus = offerSkus;
	}
	
	public String getOfferStatus() {
		return offerStatus;
	}
	public void setOfferStatus(String offerStatus) {
		this.offerStatus = offerStatus;
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
	
	public String getOfferDescription() {
		return offerDescription;
	}
	public void setOfferDescription(String offerDescription) {
		this.offerDescription = offerDescription;
	}
	public String getOfferRanges() {
		return offerRanges;
	}
	public void setOfferRanges(String offerRanges) {
		this.offerRanges = offerRanges;
	}
	public List<OfferRanges> getOfferRangesList() {
		return offerRangesList;
	}
	public void setOfferRangesList(List<OfferRanges> offerRangesList) {
		this.offerRangesList = offerRangesList;
	}
	public String getCreatedOnStr() {
		return createdOnStr;
	}
	public void setCreatedOnStr(String createdOnStr) {
		this.createdOnStr = createdOnStr;
	}
	public boolean isCustomerSpecific() {
		return isCustomerSpecific;
	}
	public void setCustomerSpecific(boolean isCustomerSpecific) {
		this.isCustomerSpecific = isCustomerSpecific;
	}
	
	public boolean isCustomerspecificflag() {
		return customerspecificflag;
	}
	public void setCustomerspecificflag(boolean customerspecificflag) {
		this.customerspecificflag = customerspecificflag;
	}
	public boolean isProductSpecificFlag() {
		return productSpecificFlag;
	}
	public void setProductSpecificFlag(boolean productSpecificFlag) {
		this.productSpecificFlag = productSpecificFlag;
	}
	public List<OfferProducts> getOfferProducts() {
		return offerProducts;
	}
	public void setOfferProducts(List<OfferProducts> offerProducts) {
		this.offerProducts = offerProducts;
	}
	public String getStartDateStr() {
		return startDateStr;
	}
	public void setStartDateStr(String startDateStr) {
		this.startDateStr = startDateStr;
	}
	public String getEndDateStr() {
		return endDateStr;
	}
	public void setEndDateStr(String endDateStr) {
		this.endDateStr = endDateStr;
	}
	public List<String> getAllLocationsList() {
		return allLocationsList;
	}
	public void setAllLocationsList(List<String> allLocationsList) {
		this.allLocationsList = allLocationsList;
	}

	
	
	
}
