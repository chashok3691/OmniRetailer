package com.tlabs.posweb.beans;


import java.math.BigDecimal;
import java.util.List;

/**
 * 
 * @author karthik.k
 *
 */
public class OutletReportBean {
	private String skuID;
	private String itemDescription;
	private String uom;
	private String plucode;
	private BigDecimal procQty;
	private BigDecimal procCost;
	private BigDecimal conQty;
	private BigDecimal conCost;
	private String location;
	private String category;
	private String subCategory;
	private String department;
	private String subDepartment;
	private String model;
	private String brand;
	private String supplierId;
	private String supplierName;
	private String startDateStr;
	private String endDateStr;
	private String searchCriteria;
	private String dateStr;
	private String startIndex;
	private String maxRecords;
	private int totalRecords;
	private RequestHeader requestHeader;
	private ResponseHeader responseHeader;
	private List<OutletReportBean> outletReportList;
	private BigDecimal procPrice;
	private BigDecimal pricDiff;
	private BigDecimal pricVariance;
	private BigDecimal taxValue;

	private String grnNo;
	private String invoiceRefNo;
	private String grnDate;
	private BigDecimal shipmentCharges; 
	
	
	public String getGrnNo() {
		return grnNo;
	}

	public void setGrnNo(String grnNo) {
		this.grnNo = grnNo;
	}

	public String getInvoiceRefNo() {
		return invoiceRefNo;
	}

	public void setInvoiceRefNo(String invoiceRefNo) {
		this.invoiceRefNo = invoiceRefNo;
	}

	public String getGrnDate() {
		return grnDate;
	}

	public void setGrnDate(String grnDate) {
		this.grnDate = grnDate;
	}

	public BigDecimal getShipmentCharges() {
		return shipmentCharges;
	}

	public void setShipmentCharges(BigDecimal shipmentCharges) {
		this.shipmentCharges = shipmentCharges;
	}

	private List<String> locationsList;
	public List<String> getLocationsList() {
		return locationsList;
	}

	public void setLocationsList(List<String> locationsList) {
		this.locationsList = locationsList;
	}

	public BigDecimal getTaxValue() {
		return taxValue;
	}

	public void setTaxValue(BigDecimal taxValue) {
		this.taxValue = taxValue;
	}

	private String ean;
	
	public String getEan() {
		return ean;
	}

	public void setEan(String ean) {
		this.ean = ean;
	}

	private boolean isSaveReport;

	private String salesReportFilePath;

	private String zoneID;

	public String getZoneID() {
		return zoneID;
	}

	public void setZoneID(String zoneID) {
		this.zoneID = zoneID;
	}

	public boolean isSaveReport() {
		return isSaveReport;
	}

	public void setSaveReport(boolean isSaveReport) {
		this.isSaveReport = isSaveReport;
	}

	public String getSkuID() {
		return skuID;
	}

	public void setSkuID(String skuID) {
		this.skuID = skuID;
	}

	public String getItemDescription() {
		return itemDescription;
	}

	public void setItemDescription(String itemDescription) {
		this.itemDescription = itemDescription;
	}

	public String getUom() {
		return uom;
	}

	public void setUom(String uom) {
		this.uom = uom;
	}

	public String getPlucode() {
		return plucode;
	}

	public void setPlucode(String plucode) {
		this.plucode = plucode;
	}

	public BigDecimal getProcQty() {
		return procQty;
	}

	public void setProcQty(BigDecimal procQty) {
		this.procQty = procQty;
	}

	public BigDecimal getProcCost() {
		return procCost;
	}

	public void setProcCost(BigDecimal procCost) {
		this.procCost = procCost;
	}

	public BigDecimal getConQty() {
		return conQty;
	}

	public void setConQty(BigDecimal conQty) {
		this.conQty = conQty;
	}

	public BigDecimal getConCost() {
		return conCost;
	}

	public void setConCost(BigDecimal conCost) {
		this.conCost = conCost;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

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

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getSubDepartment() {
		return subDepartment;
	}

	public void setSubDepartment(String subDepartment) {
		this.subDepartment = subDepartment;
	}

	public String getSalesReportFilePath() {
		return salesReportFilePath;
	}

	public void setSalesReportFilePath(String salesReportFilePath) {
		this.salesReportFilePath = salesReportFilePath;
	}

	public String getModel() {
		System.out.println("model " + model);
		return model;
	}

	public void setModel(String model) {
		System.out.println("model " + model);
		this.model = model;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
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

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	public String getDateStr() {
		return dateStr;
	}

	public void setDateStr(String dateStr) {
		this.dateStr = dateStr;
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

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
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

	public List<OutletReportBean> getOutletReportList() {
		return outletReportList;
	}

	public void setOutletReportList(List<OutletReportBean> outletReportList) {
		this.outletReportList = outletReportList;
	}

	public BigDecimal getProcPrice() {
		return procPrice;
	}

	public void setProcPrice(BigDecimal procPrice) {
		this.procPrice = procPrice;
	}

	public BigDecimal getPricDiff() {
		return pricDiff;
	}

	public void setPricDiff(BigDecimal pricDiff) {
		this.pricDiff = pricDiff;
	}

	public BigDecimal getPricVariance() {
		return pricVariance;
	}

	public void setPricVariance(BigDecimal pricVariance) {
		this.pricVariance = pricVariance;
	}

}
