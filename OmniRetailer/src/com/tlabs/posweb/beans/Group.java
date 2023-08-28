package com.tlabs.posweb.beans;

import java.util.List;

public class Group {
	private String groupId;
	private Group groupObj;
	private String groupDescription;
	private int groupStatus;
	private String groupProductCategory;
	private String groupProductSubCategory;
	private String createdDate;
	private String updatedDate;
	private String groupComments;
	private String groupImage;
	
	private String maxRecords;
	
	
	public String getGroupImage() {
		return groupImage;
	}
	public void setGroupImage(String groupImage) {
		this.groupImage = groupImage;
	}
	public String getMaxRecords() {
		return maxRecords;
	}
	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}
	//added by vijay
	private String measureRange;
	private Boolean itemStatus;
		//private List<ProductsList> temporaryGroupList;
	private String pattern;
	//private List<GroupChild> groupChildLists;
	private String productClass;
	private String productSubClass;
	private String modal;
	private String storeLocation;
	private String supplier;
	private String responseMessage;
	private String userId;
	private String SNo;
	private String productRange;
	private boolean tempAvailable;

    public boolean isTempAvailable() {
		return tempAvailable;
	}
	public void setTempAvailable(boolean tempAvailable) {
		this.tempAvailable = tempAvailable;
	}
	public String getMeasureRange() {
		return measureRange;
	}
	public void setMeasureRange(String measureRange) {
		this.measureRange = measureRange;
	}
	public Boolean getItemStatus() {
		return itemStatus;
	}
	public void setItemStatus(Boolean itemStatus) {
		this.itemStatus = itemStatus;
	}
	public String getPattern() {
		return pattern;
	}
	public void setPattern(String pattern) {
		this.pattern = pattern;
	}
	public String getProductClass() {
		return productClass;
	}
	public void setProductClass(String productClass) {
		this.productClass = productClass;
	}
	public String getProductSubClass() {
		return productSubClass;
	}
	public void setProductSubClass(String productSubClass) {
		this.productSubClass = productSubClass;
	}
	public String getModal() {
		return modal;
	}
	public void setModal(String modal) {
		this.modal = modal;
	}
	public String getStoreLocation() {
		return storeLocation;
	}
	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}
	public String getSupplier() {
		return supplier;
	}
	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}
	public String getResponseMessage() {
		return responseMessage;
	}
	public void setResponseMessage(String responseMessage) {
		this.responseMessage = responseMessage;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSNo() {
		return SNo;
	}
	public void setSNo(String sNo) {
		SNo = sNo;
	}
	public String getProductRange() {
		return productRange;
	}
	public void setProductRange(String productRange) {
		this.productRange = productRange;
	}
	private List<GroupChild> groupChilds;	
    
    private List<GroupChild> groupChildLists;

    public List<GroupChild> getGroupChildLists() {
		return groupChildLists;
	}
	public void setGroupChildLists(List<GroupChild> groupChildLists) {
		this.groupChildLists = groupChildLists;
	}
	private List<ProductsList> temporaryGroupList;
  
	public List<ProductsList> getTemporaryGroupList() {
		return temporaryGroupList;
	}
	public void setTemporaryGroupList(List<ProductsList> temporaryGroupList) {
		this.temporaryGroupList = temporaryGroupList;
	}
	private RequestHeader requestHeader;
	private ResponseHeader responseHeader;
	private String startIndex;
	private String totalRecords;
	private List<Group> groupsList;
	private String searchCriteria;
	private List<String> deletedPlus;
	private List<String> groupIds;
	private int slNo;
	private boolean imageFlag;
	private String imageRef;
	private String image;
	private String productBrand;
	/*for batch process*/
	private boolean batchCreationRequired;
	private String productDepartment;
	
	private String productSubDepartment;
	private String section;
	
	
	public boolean isImageFlag() {
		return imageFlag;
	}
	public void setImageFlag(boolean imageFlag) {
		this.imageFlag = imageFlag;
	}
	public String getImageRef() {
		return imageRef;
	}
	public void setImageRef(String imageRef) {
		this.imageRef = imageRef;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getSlNo() {
		return slNo;
	}
	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}
	
	public List<String> getGroupIds() {
		return groupIds;
	}

	public void setGroupIds(List<String> groupIds) {
		this.groupIds = groupIds;
	}

	public List<String> getDeletedPlus() {
		return deletedPlus;
	}

	public void setDeletedPlus(List<String> deletedPlus) {
		this.deletedPlus = deletedPlus;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}


	public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

	public List<Group> getGroupsList() {
		return groupsList;
	}

	public void setGroupsList(List<Group> groupsList) {
		this.groupsList = groupsList;
	}

	public String getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}

	public List<GroupChild> getGroupChilds() {
		return groupChilds;
	}

	public void setGroupChilds(List<GroupChild> groupChilds) {
		this.groupChilds = groupChilds;
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

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getGroupDescription() {
		return groupDescription;
	}

	public void setGroupDescription(String groupDescription) {
		this.groupDescription = groupDescription;
	}

	public int getGroupStatus() {
		return groupStatus;
	}

	public void setGroupStatus(int groupStatus) {
		this.groupStatus = groupStatus;
	}

	public String getGroupProductCategory() {
		return groupProductCategory;
	}

	public void setGroupProductCategory(String groupProductCategory) {
		this.groupProductCategory = groupProductCategory;
	}

	public String getGroupProductSubCategory() {
		return groupProductSubCategory;
	}

	public void setGroupProductSubCategory(String groupProductSubCategory) {
		this.groupProductSubCategory = groupProductSubCategory;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public String getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(String updatedDate) {
		this.updatedDate = updatedDate;
	}

	public String getGroupComments() {
		return groupComments;
	}

	public void setGroupComments(String groupComments) {
		this.groupComments = groupComments;
	}
	public String getProductBrand() {
		return productBrand;
	}
	public void setProductBrand(String productBrand) {
		this.productBrand = productBrand;
	}
	public String getProductDepartment() {
		return productDepartment;
	}
	public void setProductDepartment(String productDepartment) {
		this.productDepartment = productDepartment;
	}
	public String getProductSubDepartment() {
		return productSubDepartment;
	}
	public void setProductSubDepartment(String productSubDepartment) {
		this.productSubDepartment = productSubDepartment;
	}
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public boolean isBatchCreationRequired() {
		return batchCreationRequired;
	}
	public void setBatchCreationRequired(boolean batchCreationRequired) {
		this.batchCreationRequired = batchCreationRequired;
	}
	public Group getGroupObj() {
		return groupObj;
	}
	public void setGroupObj(Group groupObj) {
		this.groupObj = groupObj;
	}

	

}
