package com.tlabs.posweb.beans;

import java.util.List;
/*This bean useful to carry the sectionMsater and sectionTables infotmation.
 * @author: Prasad Y Dec 28 2015*/
public class SectionDetails {
 private RequestHeader requestHeader;
 private ResponseHeader responseHeader;
 
 //i.section_master fields
 private String sectionId;
 private String sectionName;
 private String levelId;
 private String mealType;
 private String courseType;
 private String createdDateStr;
 private String sectionDescription;
 private String status;

 //ii.section_tables fields
 private int sNo;
 private String tableId;
 private String tableName;

 //iii.additional fields
 private long totalRecords;
 private List<SectionDetails> tablesInfo;
 private List<SectionDetails> sectionsInfo;
 private String startIndex;
 private String searchCriteria;
 private String maxRecords;
private List<String> sectionIds;
private String userName;
private String roleName;
private int slNo;

public int getSlNo() {
	return slNo;
}

public void setSlNo(int slNo) {
	this.slNo = slNo;
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

public List<String> getSectionIds() {
	return sectionIds;
}

public void setSectionIds(List<String> sectionIds) {
	this.sectionIds = sectionIds;
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

public ResponseHeader getResponseHeader() {
	return responseHeader;
}

public void setResponseHeader(ResponseHeader responseHeader) {
	this.responseHeader = responseHeader;
}

public long getTotalRecords() {
	return totalRecords;
}

public void setTotalRecords(long totalRecords) {
	this.totalRecords = totalRecords;
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

public String getLevelId() {
	return levelId;
}

public void setLevelId(String levelId) {
	this.levelId = levelId;
}

public String getMealType() {
	return mealType;
}

public void setMealType(String mealType) {
	this.mealType = mealType;
}

public String getCourseType() {
	return courseType;
}

public void setCourseType(String courseType) {
	this.courseType = courseType;
}

public String getCreatedDateStr() {
	return createdDateStr;
}

public void setCreatedDateStr(String createdDateStr) {
	this.createdDateStr = createdDateStr;
}

public String getSectionDescription() {
	return sectionDescription;
}

public void setSectionDescription(String sectionDescription) {
	this.sectionDescription = sectionDescription;
}

public String getStatus() {
	return status;
}

public void setStatus(String status) {
	this.status = status;
}

public List<SectionDetails> getTablesInfo() {
	return tablesInfo;
}

public void setTablesInfo(List<SectionDetails> tablesInfo) {
	this.tablesInfo = tablesInfo;
}

public int getsNo() {
	return sNo;
}

public void setsNo(int sNo) {
	this.sNo = sNo;
}

public String getTableId() {
	return tableId;
}

public void setTableId(String tableId) {
	this.tableId = tableId;
}

public String getTableName() {
	return tableName;
}

public void setTableName(String tableName) {
	this.tableName = tableName;
}

public List<SectionDetails> getSectionsInfo() {
	return sectionsInfo;
}

public void setSectionsInfo(List<SectionDetails> sectionsInfo) {
	this.sectionsInfo = sectionsInfo;
}
 
 

}
