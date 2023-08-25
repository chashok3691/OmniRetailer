package com.tlabs.posweb.beans;

import java.util.Date;
import java.util.List;

/**
* @author 		: kesav A
* @Created_on   : 10-02-2016
* @verified_By  :
* @modified_By  : 
* @modified_On  :  
* @modified_Ref :  
* @description  : This class is used to interact with the  hot_deals table in database . 
* */
public class HotDeals {

	private String hotDealRef;
	private String dealDescription;
	private Date createDate;
	private int status;
	private int dealPriority;
	private String dealImagePath;
	private String dealsDisplayTitle;
	private String dealsDisplayTitleFont;
	private String dealsDisplayTitleFontSize;
	private String dealsDisplayTitleFontColor;
	private String dealsDisplayText;
	private int dealImageBold;
	private int dealImageItalic;
	private int dealImageStrike;
	private Date effectiveFromDate;
	private String dealThumbnail;
	private String remarks;
	
	// following fields are newly added
	private String salePriceText;
	private int salePriceTextBold;
	private int salePriceTextItalic;
	private int salePriceTextStrike;
	private String salePriceTextFont;
	private String salePriceTextFontSize;
	private String salePriceTextFontColor;
	private String preparedBy;
	private Date updatedDate;
	private Date endDate;
	private List<HotDealsList> hotDealsList; 
	private RequestHeader requestHeader;
	private String searchCriteria;
	private String startIndex;
	private String maxRecords;
	private String dealImageRefId;
	private String dealThumbnailRefId;
	private String dealImageItalicStr;
	private String dealImageStrikeStr;
	private String dealImageBoldStr;
	private String dealPriorityStr;	
	private String statusStr;
	private String effectiveFromDateStr;
	private String createdDateStr;
	private ResponseHeader responseHeader;
	private String salePriceTextBoldStr;
	private String salePriceTextItalicStr;
	private String salePriceTextStrikeStr;
	private String updateDateStr;
	private String endDateStr;
	private String totalRecords;
	private int slNo;
	private String offerDisplayPage;
	
	
	
	public String getOfferDisplayPage() {
		return offerDisplayPage;
	}
	public void setOfferDisplayPage(String offerDisplayPage) {
		this.offerDisplayPage = offerDisplayPage;
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
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getEndDateStr() {
		return endDateStr;
	}
	public void setEndDateStr(String endDateStr) {
		this.endDateStr = endDateStr;
	}
	private String[] hotDealRefIds;
	
	public String getHotDealRef() {
		return hotDealRef;
	}
	public void setHotDealRef(String hotDealRef) {
		this.hotDealRef = hotDealRef;
	}
 
	public String getDealDescription() {
		return dealDescription;
	}
	public String getDealsDisplayTitleFontColor() {
		return dealsDisplayTitleFontColor;
	}
	public void setDealsDisplayTitleFontColor(String dealsDisplayTitleFontColor) {
		this.dealsDisplayTitleFontColor = dealsDisplayTitleFontColor;
	}
	public void setDealDescription(String dealDescription) {
		this.dealDescription = dealDescription;
	}
	public String getSalePriceText() {
		return salePriceText;
	}
	public void setSalePriceText(String salePriceText) {
		this.salePriceText = salePriceText;
	}
	public int getSalePriceTextBold() {
		return salePriceTextBold;
	}
	public void setSalePriceTextBold(int salePriceTextBold) {
		this.salePriceTextBold = salePriceTextBold;
	}
	public int getSalePriceTextItalic() {
		return salePriceTextItalic;
	}
	public void setSalePriceTextItalic(int salePriceTextItalic) {
		this.salePriceTextItalic = salePriceTextItalic;
	}
	public String getDealImagePath() {
		return dealImagePath;
	}
	public void setDealImagePath(String dealImagePath) {
		this.dealImagePath = dealImagePath;
	}
	public String getDealThumbnail() {
		return dealThumbnail;
	}
	public void setDealThumbnail(String dealThumbnail) {
		this.dealThumbnail = dealThumbnail;
	}
	public String getPreparedBy() {
		return preparedBy;
	}
	public void setPreparedBy(String preparedBy) {
		this.preparedBy = preparedBy;
	}
	public Date getUpdatedDate() {
		return updatedDate;
	}
	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}
	public List<HotDealsList> getHotDealsList() {
		return hotDealsList;
	}
	public void setHotDealsList(List<HotDealsList> hotDealsList) {
		this.hotDealsList = hotDealsList;
	}
	public int getSalePriceTextStrike() {
		return salePriceTextStrike;
	}
	public String getUpdateDateStr() {
		return updateDateStr;
	}
	public void setUpdateDateStr(String updateDateStr) {
		this.updateDateStr = updateDateStr;
	}
	public void setSalePriceTextStrike(int salePriceTextStrike) {
		this.salePriceTextStrike = salePriceTextStrike;
	}
	public String getSalePriceTextFont() {
		return salePriceTextFont;
	}
	public void setSalePriceTextFont(String salePriceTextFont) {
		this.salePriceTextFont = salePriceTextFont;
	}
	public String getSalePriceTextFontSize() {
		return salePriceTextFontSize;
	}
	public void setSalePriceTextFontSize(String salePriceTextFontSize) {
		this.salePriceTextFontSize = salePriceTextFontSize;
	}
	public String getSalePriceTextFontColor() {
		return salePriceTextFontColor;
	}
	public void setSalePriceTextFontColor(String salePriceTextFontColor) {
		this.salePriceTextFontColor = salePriceTextFontColor;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getSalePriceTextBoldStr() {
		return salePriceTextBoldStr;
	}
	public void setSalePriceTextBoldStr(String salePriceTextBoldStr) {
		this.salePriceTextBoldStr = salePriceTextBoldStr;
	}
	public String getSalePriceTextItalicStr() {
		return salePriceTextItalicStr;
	}
	public void setSalePriceTextItalicStr(String salePriceTextItalicStr) {
		this.salePriceTextItalicStr = salePriceTextItalicStr;
	}
	public String getSalePriceTextStrikeStr() {
		return salePriceTextStrikeStr;
	}
	public void setSalePriceTextStrikeStr(String salePriceTextStrikeStr) {
		this.salePriceTextStrikeStr = salePriceTextStrikeStr;
	}
 
	public String getSearchCriteria() {
		return searchCriteria;
	}
	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}
 
	public int getDealPriority() {
		return dealPriority;
	}
	public void setDealPriority(int dealPriority) {
		this.dealPriority = dealPriority;
	}
 
	public String getDealsDisplayTitle() {
		return dealsDisplayTitle;
	}
	public void setDealsDisplayTitle(String dealsDisplayTitle) {
		this.dealsDisplayTitle = dealsDisplayTitle;
	}
	public String getDealsDisplayTitleFont() {
		return dealsDisplayTitleFont;
	}
	public void setDealsDisplayTitleFont(String dealsDisplayTitleFont) {
		this.dealsDisplayTitleFont = dealsDisplayTitleFont;
	}
	public String[] getHotDealRefIds() {
		return hotDealRefIds;
	}
	public void setHotDealRefIds(String[] hotDealRefIds) {
		this.hotDealRefIds = hotDealRefIds;
	}
	public String getDealsDisplayTitleFontSize() {
		return dealsDisplayTitleFontSize;
	}
	public void setDealsDisplayTitleFontSize(String dealsDisplayTitleFontSize) {
		this.dealsDisplayTitleFontSize = dealsDisplayTitleFontSize;
	}
	public String getDealsDisplayText() {
		return dealsDisplayText;
	}
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	public void setDealsDisplayText(String dealsDisplayText) {
		this.dealsDisplayText = dealsDisplayText;
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
	public Date getEffectiveFromDate() {
		return effectiveFromDate;
	}
	public void setEffectiveFromDate(Date effectiveFromDate) {
		this.effectiveFromDate = effectiveFromDate;
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
	public String getDealImageRefId() {
		return dealImageRefId;
	}
	public void setDealImageRefId(String dealImageRefId) {
		this.dealImageRefId = dealImageRefId;
	}
	public String getDealThumbnailRefId() {
		return dealThumbnailRefId;
	}
	public void setDealThumbnailRefId(String dealThumbnailRefId) {
		this.dealThumbnailRefId = dealThumbnailRefId;
	}
	public String getDealImageItalicStr() {
		return dealImageItalicStr;
	}
	public void setDealImageItalicStr(String dealImageItalicStr) {
		this.dealImageItalicStr = dealImageItalicStr;
	}
	public String getDealImageStrikeStr() {
		return dealImageStrikeStr;
	}
	public void setDealImageStrikeStr(String dealImageStrikeStr) {
		this.dealImageStrikeStr = dealImageStrikeStr;
	}
	public String getDealImageBoldStr() {
		return dealImageBoldStr;
	}
	public void setDealImageBoldStr(String dealImageBoldStr) {
		this.dealImageBoldStr = dealImageBoldStr;
	}
	public String getDealPriorityStr() {
		return dealPriorityStr;
	}
	public void setDealPriorityStr(String dealPriorityStr) {
		this.dealPriorityStr = dealPriorityStr;
	}
	public String getStatusStr() {
		return statusStr;
	}
	public void setStatusStr(String statusStr) {
		this.statusStr = statusStr;
	}
	public String getEffectiveFromDateStr() {
		return effectiveFromDateStr;
	}
	public void setEffectiveFromDateStr(String effectiveFromDateStr) {
		this.effectiveFromDateStr = effectiveFromDateStr;
	}
	public String getCreatedDateStr() {
		return createdDateStr;
	}
	public void setCreatedDateStr(String createdDateStr) {
		this.createdDateStr = createdDateStr;
	}
}
