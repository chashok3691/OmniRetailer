package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.List;



public class BillOfMaterialResponse {
	private ResponseHeader responseHeader;
	private int totalRecords;
	private BillOfMaterial bomObj;
	private List<BillOfMaterial> bomList;
	private List<BillOfMaterialChild> bomChildsList;
	
	
	private List<BOMSummary> bomSummaryList;
	private List<BillOfMaterialResponse> suppliesReportBeanList;
	private List<BillOfMaterialResponse> stockMovementList;
	private String itemDescription;
	private BigDecimal openQty = BigDecimal.ZERO.setScale(2, BigDecimal.ROUND_UP);
	private String skuId;
	private BigDecimal closeQty = BigDecimal.ZERO.setScale(2, BigDecimal.ROUND_UP);
	private BigDecimal inwardQty = BigDecimal.ZERO.setScale(2, BigDecimal.ROUND_UP);
	private BigDecimal saleQty = BigDecimal.ZERO.setScale(2, BigDecimal.ROUND_UP);
	private BigDecimal saleValue = BigDecimal.ZERO.setScale(2, BigDecimal.ROUND_UP);
	private BigDecimal writeOffQty = BigDecimal.ZERO.setScale(2, BigDecimal.ROUND_UP);

	private BigDecimal receivedQty = BigDecimal.ZERO.setScale(2, BigDecimal.ROUND_UP);

	private BigDecimal rejectedQty = BigDecimal.ZERO.setScale(2, BigDecimal.ROUND_UP);

	private BigDecimal price;

	private BigDecimal cost;

	private String category;

	private String location;


	private String receiptCreatedStr;

	private String deliveryDateStr;

	private BigDecimal suppliedQty = BigDecimal.ZERO.setScale(2, BigDecimal.ROUND_UP);

	private String toLocation;
	
	private String description;
	
    private String subCategory;
    private String department;
    private String subDepartment;
    private String section;
    private String modal;
    private String url;
    
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getModal() {
		return modal;
	}

	public void setModal(String modal) {
		this.modal = modal;
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

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public BillOfMaterial getBomObj() {
		return bomObj;
	}

	public void setBomObj(BillOfMaterial bomObj) {
		this.bomObj = bomObj;
	}

	public List<BillOfMaterial> getBomList() {
		return bomList;
	}

	public void setBomList(List<BillOfMaterial> bomList) {
		this.bomList = bomList;
	}

	public List<BillOfMaterialChild> getBomChildsList() {
		return bomChildsList;
	}

	public void setBomChildsList(List<BillOfMaterialChild> bomChildsList) {
		this.bomChildsList = bomChildsList;
	}

	public List<BOMSummary> getBomSummaryList() {
		return bomSummaryList;
	}

	public void setBomSummaryList(List<BOMSummary> bomSummaryList) {
		this.bomSummaryList = bomSummaryList;
	}

	public List<BillOfMaterialResponse> getSuppliesReportBeanList() {
		return suppliesReportBeanList;
	}

	public void setSuppliesReportBeanList(List<BillOfMaterialResponse> suppliesReportBeanList) {
		this.suppliesReportBeanList = suppliesReportBeanList;
	}


	public BigDecimal getReceivedQty() {
		return receivedQty;
	}

	public void setReceivedQty(BigDecimal receivedQty) {
		this.receivedQty = receivedQty;
	}

	public BigDecimal getRejectedQty() {
		return rejectedQty;
	}

	public void setRejectedQty(BigDecimal rejectedQty) {
		this.rejectedQty = rejectedQty;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public BigDecimal getCost() {
		return cost;
	}

	public void setCost(BigDecimal cost) {
		this.cost = cost;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getReceiptCreatedStr() {
		return receiptCreatedStr;
	}

	public void setReceiptCreatedStr(String receiptCreatedStr) {
		this.receiptCreatedStr = receiptCreatedStr;
	}

	public String getDeliveryDateStr() {
		return deliveryDateStr;
	}

	public void setDeliveryDateStr(String deliveryDateStr) {
		this.deliveryDateStr = deliveryDateStr;
	}

	public BigDecimal getSuppliedQty() {
		return suppliedQty;
	}

	public void setSuppliedQty(BigDecimal suppliedQty) {
		this.suppliedQty = suppliedQty;
	}

	public String getToLocation() {
		return toLocation;
	}

	public void setToLocation(String toLocation) {
		this.toLocation = toLocation;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<BillOfMaterialResponse> getStockMovementList() {
		return stockMovementList;
	}

	public void setStockMovementList(List<BillOfMaterialResponse> stockMovementList) {
		this.stockMovementList = stockMovementList;
	}

	public String getItemDescription() {
		return itemDescription;
	}

	public void setItemDescription(String itemDescription) {
		this.itemDescription = itemDescription;
	}

	public BigDecimal getOpenQty() {
		return openQty;
	}

	public void setOpenQty(BigDecimal openQty) {
		this.openQty = openQty;
	}

	public BigDecimal getCloseQty() {
		return closeQty;
	}

	public void setCloseQty(BigDecimal closeQty) {
		this.closeQty = closeQty;
	}

	public BigDecimal getInwardQty() {
		return inwardQty;
	}

	public void setInwardQty(BigDecimal inwardQty) {
		this.inwardQty = inwardQty;
	}

	public BigDecimal getSaleQty() {
		return saleQty;
	}

	public void setSaleQty(BigDecimal saleQty) {
		this.saleQty = saleQty;
	}

	public BigDecimal getSaleValue() {
		return saleValue;
	}

	public void setSaleValue(BigDecimal saleValue) {
		this.saleValue = saleValue;
	}

	public BigDecimal getWriteOffQty() {
		return writeOffQty;
	}

	public void setWriteOffQty(BigDecimal writeOffQty) {
		this.writeOffQty = writeOffQty;
	}

	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}

}
