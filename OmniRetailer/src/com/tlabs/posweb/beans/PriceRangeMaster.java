package com.tlabs.posweb.beans;

//import java.util.Date;
import java.util.List;



/**
 * @author Karthik k
 *
 */

public class PriceRangeMaster {

	private String priceRangeId;


	private String priceRangeDescription;

	private String userName;

	private String roleName;

	/*private Date createdDate;
	
	private Date updatedDate;*/
    private List<String> startPrices;
   

	private List<String> endPrices;
    private List<String> skuListIds;
    private List<String> productCatagoryIds;

	private List<PriceRangeChilds> priceRangeChilds;


	private RequestHeader requestHeader;


	private String startIndex;


	private String maxRecords;

	
	private String searchCriteria;


	private String startDateStr;

	
	private String endDateStr;

	
	private List<String> priceRangeIds;

	
	private String createdDateStr;

	
	private String updatedDateStr;


	private String startPriceStr;


	private String endPriceStr;

	public String getStartPriceStr() {
		return startPriceStr;
	}

	public void setStartPriceStr(String startPriceStr) {
		this.startPriceStr = startPriceStr;
	}

	public String getEndPriceStr() {
		return endPriceStr;
	}

	public void setEndPriceStr(String endPriceStr) {
		this.endPriceStr = endPriceStr;
	}

	public String getCreatedDateStr() {
		return createdDateStr;
	}

	public void setCreatedDateStr(String createdDateStr) {
		this.createdDateStr = createdDateStr;
	}

	public String getUpdatedDateStr() {
		return updatedDateStr;
	}

	public void setUpdatedDateStr(String updatedDateStr) {
		this.updatedDateStr = updatedDateStr;
	}

	public String getPriceRangeId() {
		return priceRangeId;
	}

	public void setPriceRangeId(String priceRangeId) {
		this.priceRangeId = priceRangeId;
	}

	public String getPriceRangeDescription() {
		return priceRangeDescription;
	}

	public void setPriceRangeDescription(String priceRangeDescription) {
		this.priceRangeDescription = priceRangeDescription;
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

	/*public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}*/

	public List<PriceRangeChilds> getPriceRangeChilds() {
		return priceRangeChilds;
	}

	public void setPriceRangeChilds(List<PriceRangeChilds> priceRangeChilds) {
		this.priceRangeChilds = priceRangeChilds;
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

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
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

	public List<String> getPriceRangeIds() {
		return priceRangeIds;
	}

	public void setPriceRangeIds(List<String> priceRangeIds) {
		this.priceRangeIds = priceRangeIds;
	}
	 public List<String> getStartPrices() {
			return startPrices;
		}

		public void setStartPrices(List<String> startPrices) {
			this.startPrices = startPrices;
		}

		public List<String> getEndPrices() {
			return endPrices;
		}

		public void setEndPrices(List<String> endPrices) {
			this.endPrices = endPrices;
		}

		public List<String> getSkuListIds() {
			return skuListIds;
		}

		public void setSkuListIds(List<String> skuListIds) {
			this.skuListIds = skuListIds;
		}

		public List<String> getProductCatagoryIds() {
			return productCatagoryIds;
		}

		public void setProductCatagoryIds(List<String> productCatagoryIds) {
			this.productCatagoryIds = productCatagoryIds;
		}

}
