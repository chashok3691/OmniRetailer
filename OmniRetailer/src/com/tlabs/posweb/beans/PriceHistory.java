package com.tlabs.posweb.beans;



import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
//import java.util.Set;

/**
 * Created by vijay on 14th june,18
 */


public class PriceHistory {


	private String price_history_ref;

	private String sku_id;

 


	private String pluCode;

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


	private String store_location;


	private Date effective_from_date;

	//    @Column(name="effective_to_date")
	//    private Date effective_to_date;


	private BigDecimal cost_price;

	private BigDecimal sale_price;

	private String color;

	private String size;

	private String measure_range;

	private String product_range;

	private String product_batch_num;

	private String utility;

	private String ean;

	private String description;


	private Date createdDate;

	private Date updatedDate;

	private String category;
	private String subCategory;
	private String brand;

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}


	private String section;


	private String userName;


	private BigDecimal mrp;



	private RequestHeader requestHeader;

	private ResponseHeader responseHeader;

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}


	private String maxRecords;


	private int totalRecords;


	private String startIndex;







	private String comments;


	private String zoneId;

	private String startDate;

	private String endDate;

	private String effectiveDateStr;

	private String createdDateStr;


	private List<String> locationsList;



	public String getCreatedDateStr() {
		return createdDateStr;
	}

	public void setCreatedDateStr(String createdDateStr) {
		this.createdDateStr = createdDateStr;
	}


	public String getEffectiveDateStr() {
		return effectiveDateStr;
	}

	public void setEffectiveDateStr(String effectiveDateStr) {
		this.effectiveDateStr = effectiveDateStr;
	}


	private String searchCriteria;

	private List<PriceHistory> priceHistory;




	private Long noOfSkus;


	public String getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public String getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	public Date getCreatedDate() {
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
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPrice_history_ref() {
		return price_history_ref;
	}

	public void setPrice_history_ref(String price_history_ref) {
		this.price_history_ref = price_history_ref;
	}

	public String getSku_id() {
		return sku_id;
	}

	public void setSku_id(String sku_id) {
		this.sku_id = sku_id;
	}

	public String getPluCode() {
		return pluCode;
	}

	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}

	public String getStore_location() {
		return store_location;
	}

	public void setStore_location(String store_location) {
		this.store_location = store_location;
	}

	public Date getEffective_from_date() {
		return effective_from_date;
	}

	public void setEffective_from_date(Date effective_from_date) {
		this.effective_from_date = effective_from_date;
	}

	//    public Date getEffective_to_date() {
	//        return effective_to_date;
	//    }
	//
	//    public void setEffective_to_date(Date effective_to_date) {
	//        this.effective_to_date = effective_to_date;
	//    }



	public String getColor() {
		return color;
	}

	public BigDecimal getCost_price() {
		return cost_price;
	}

	public void setCost_price(BigDecimal cost_price) {
		this.cost_price = cost_price;
	}

	public BigDecimal getSale_price() {
		return sale_price;
	}

	public void setSale_price(BigDecimal sale_price) {
		this.sale_price = sale_price;
	}

	public BigDecimal getMrp() {
		return mrp;
	}

	public void setMrp(BigDecimal mrp) {
		this.mrp = mrp;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getMeasure_range() {
		return measure_range;
	}

	public void setMeasure_range(String measure_range) {
		this.measure_range = measure_range;
	}

	public String getProduct_range() {
		return product_range;
	}

	public void setProduct_range(String product_range) {
		this.product_range = product_range;
	}

	public String getProduct_batch_num() {
		return product_batch_num;
	}

	public void setProduct_batch_num(String product_batch_num) {
		this.product_batch_num = product_batch_num;
	}

	public String getUtility() {
		return utility;
	}

	public void setUtility(String utility) {
		this.utility = utility;
	}

	public String getEan() {
		return ean;
	}

	public void setEan(String ean) {
		this.ean = ean;
	}

	public List<PriceHistory> getPriceHistory() {
		return priceHistory;
	}

	public void setPriceHistory(List<PriceHistory> priceHistory) {
		this.priceHistory = priceHistory;
	}

	public Long getNoOfSkus() {
		return noOfSkus;
	}

	public void setNoOfSkus(Long noOfSkus) {
		this.noOfSkus = noOfSkus;
	}

	public String getZoneId() {
		return zoneId;
	}

	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
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

	public List<String> getLocationsList() {
		return locationsList;
	}

	public void setLocationsList(List<String> locationsList) {
		this.locationsList = locationsList;
	}
}
