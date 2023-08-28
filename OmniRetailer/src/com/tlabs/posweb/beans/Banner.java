package com.tlabs.posweb.beans;

import java.util.Date;
import java.util.List;

public class Banner {
	private String bannerId;
	private String bannerName;
	private String bannerDescription;
	private String productCategory;
	private String departmentCategory;
	private String brandCategory;
	private String bannerImage;
	private String bannerImageText;
	private String bannerImageTextFont;
	private String bannerImageFontSize;
	private String bannerImageColor;
	private int bannerImageBold;
	private int bannerImageItalic;
	private int bannerImageStrike;
	private String bannerThumbnail;
	private int status;
	private int bannerPriority;
	private int offerDisplay;
	private int dealsDisplay;
	private Date createdDate;
	private Date effectiveFrom;
	private String remarks;
	private Date endDate;
	private String offerId;
	private String dealId;
	 private String groupId;
	 private String targetURL;
	private String productDescription;
	private String totalRecords;
	
	private String[] bannerIdList;
	
	private RequestHeader requestHeader;
	
	private String bannerImageRefId;
	
	private String bannerThumbnailRefId;
	
	private String bannerImageBoldStr;
	
	private String bannerImageItalicStr;
	
	private String bannerImageStrikeStr;
	
	private String statusStr;
	
	private String offerDisplayStr;
	
	private String dealDisplayStr;
	
	private String effectiveFromStr;
	
	private String bannerPriorityStr;
	
	private String createdDateStr;
	
	private String startIndex;
	
	private String maxRecords;
	
	private ResponseHeader responseHeader;
	
	private String searchCriteria;
	
	private String endDateStr;
	
	private String[] bannerIds;
	private List<Banner> bannerList;
	private int slNo;
	private boolean isImageRequired;
	private Banner bannerObj;
	private String image_name;
	private String thumbnail_name;
	private String type;
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getImage_name() {
		return image_name;
	}

	public void setImage_name(String image_name) {
		this.image_name = image_name;
	}

	public String getThumbnail_name() {
		return thumbnail_name;
	}

	public void setThumbnail_name(String thumbnail_name) {
		this.thumbnail_name = thumbnail_name;
	}

	public Banner getBannerObj() {
		return bannerObj;
	}

	public void setBannerObj(Banner bannerObj) {
		this.bannerObj = bannerObj;
	}

	public boolean isImageRequired() {
		return isImageRequired;
	}

	public void setImageRequired(boolean isImageRequired) {
		this.isImageRequired = isImageRequired;
	}

	public int getSlNo() {
		return slNo;
	}

	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}

	public List<Banner> getBannerList() {
		return bannerList;
	}

	public void setBannerList(List<Banner> bannerList) {
		this.bannerList = bannerList;
	}

	public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}
	
	public String getEndDateStr() {
		return endDateStr;
	}

	public void setEndDateStr(String endDateStr) {
		this.endDateStr = endDateStr;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	
	public String getDepartmentCategory() {
		return departmentCategory;
	}

	public void setDepartmentCategory(String departmentCategory) {
		this.departmentCategory = departmentCategory;
	}

	public String getBrandCategory() {
		return brandCategory;
	}

	public void setBrandCategory(String brandCategory) {
		this.brandCategory = brandCategory;
	}

	public String getBannerImageFontSize() {
		return bannerImageFontSize;
	}

	public void setBannerImageFontSize(String bannerImageFontSize) {
		this.bannerImageFontSize = bannerImageFontSize;
	}

	public String getBannerId() {
		return bannerId;
	}

	public String getOfferId() {
		return offerId;
	}

	public void setOfferId(String offerId) {
		this.offerId = offerId;
	}

	public String getDealId() {
		return dealId;
	}

	public void setDealId(String dealId) {
		this.dealId = dealId;
	}

	public void setBannerId(String bannerId) {
		this.bannerId = bannerId;
	}

	public String getBannerName() {
		return bannerName;
	}

	public void setBannerName(String bannerName) {
		this.bannerName = bannerName;
	}

	public String getBannerDescription() {
		return bannerDescription;
	}

	public void setBannerDescription(String bannerDescription) {
		this.bannerDescription = bannerDescription;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	public String[] getBannerIdList() {
		return bannerIdList;
	}

	public void setBannerIdList(String[] bannerIdList) {
		this.bannerIdList = bannerIdList;
	}

	public String getBannerImageText() {
		return bannerImageText;
	}

	public void setBannerImageText(String bannerImageText) {
		this.bannerImageText = bannerImageText;
	}

	public String getBannerImageTextFont() {
		return bannerImageTextFont;
	}

	public String[] getBannerIds() {
		return bannerIds;
	}

	public void setBannerIds(String[] bannerIds) {
		this.bannerIds = bannerIds;
	}

	public void setBannerImageTextFont(String bannerImageTextFont) {
		this.bannerImageTextFont = bannerImageTextFont;
	}

 

	public String getBannerImageBoldStr() {
		return bannerImageBoldStr;
	}

	public void setBannerImageBoldStr(String bannerImageBoldStr) {
		this.bannerImageBoldStr = bannerImageBoldStr;
	}

	public String getBannerImageItalicStr() {
		return bannerImageItalicStr;
	}

	public void setBannerImageItalicStr(String bannerImageItalicStr) {
		this.bannerImageItalicStr = bannerImageItalicStr;
	}

	public String getBannerImageStrikeStr() {
		return bannerImageStrikeStr;
	}

	public void setBannerImageStrikeStr(String bannerImageStrikeStr) {
		this.bannerImageStrikeStr = bannerImageStrikeStr;
	}

	public String getStatusStr() {
		return statusStr;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	public void setStatusStr(String statusStr) {
		this.statusStr = statusStr;
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

	public String getOfferDisplayStr() {
		return offerDisplayStr;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public String getBannerPriorityStr() {
		return bannerPriorityStr;
	}

	public void setBannerPriorityStr(String bannerPriorityStr) {
		this.bannerPriorityStr = bannerPriorityStr;
	}

	public void setOfferDisplayStr(String offerDisplayStr) {
		this.offerDisplayStr = offerDisplayStr;
	}

	public String getDealDisplayStr() {
		return dealDisplayStr;
	}

	public void setDealDisplayStr(String dealDisplayStr) {
		this.dealDisplayStr = dealDisplayStr;
	}

	public String getEffectiveFromStr() {
		return effectiveFromStr;
	}

	public void setEffectiveFromStr(String effectiveFromStr) {
		this.effectiveFromStr = effectiveFromStr;
	}
 

	public String getBannerImageColor() {
		return bannerImageColor;
	}

	public void setBannerImageColor(String bannerImageColor) {
		this.bannerImageColor = bannerImageColor;
	}

	public int getBannerImageBold() {
		return bannerImageBold;
	}

	public void setBannerImageBold(int bannerImageBold) {
		this.bannerImageBold = bannerImageBold;
	}

	public int getBannerImageItalic() {
		return bannerImageItalic;
	}

	public void setBannerImageItalic(int bannerImageItalic) {
		this.bannerImageItalic = bannerImageItalic;
	}

	public int getBannerImageStrike() {
		return bannerImageStrike;
	}

	public void setBannerImageStrike(int bannerImageStrike) {
		this.bannerImageStrike = bannerImageStrike;
	}

	
	public String getBannerImage() {
		return bannerImage;
	}

	public void setBannerImage(String bannerImage) {
		this.bannerImage = bannerImage;
	}

	public String getBannerThumbnail() {
		return bannerThumbnail;
	}

	public void setBannerThumbnail(String bannerThumbnail) {
		this.bannerThumbnail = bannerThumbnail;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

 

	public int getOfferDisplay() {
		return offerDisplay;
	}

	public void setOfferDisplay(int offerDisplay) {
		this.offerDisplay = offerDisplay;
	}

	public int getDealsDisplay() {
		return dealsDisplay;
	}

	public void setDealsDisplay(int dealsDisplay) {
		this.dealsDisplay = dealsDisplay;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getEffectiveFrom() {
		return effectiveFrom;
	}

	public String getCreatedDateStr() {
		return createdDateStr;
	}

	public void setCreatedDateStr(String createdDateStr) {
		this.createdDateStr = createdDateStr;
	}

	public void setEffectiveFrom(Date effectiveFrom) {
		this.effectiveFrom = effectiveFrom;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public String getBannerImageRefId() {
		return bannerImageRefId;
	}

	public void setBannerImageRefId(String bannerImageRefId) {
		this.bannerImageRefId = bannerImageRefId;
	}

	public String getBannerThumbnailRefId() {
		return bannerThumbnailRefId;
	}

	public void setBannerThumbnailRefId(String bannerThumbnailRefId) {
		this.bannerThumbnailRefId = bannerThumbnailRefId;
	}

	public int getBannerPriority() {
		return bannerPriority;
	}

	public void setBannerPriority(int bannerPriority) {
		this.bannerPriority = bannerPriority;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getTargetURL() {
		return targetURL;
	}

	public void setTargetURL(String targetURL) {
		this.targetURL = targetURL;
	}
	
	
	

}
