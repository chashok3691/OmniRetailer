package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.List;

/*import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;*/

//@Entity
//@Table(name = "warehouse_invoice_items")
public class WHInvoiceItems {

	//@Id
	//@Column(name = "invoice_item_id")
	//@GenericGenerator(name = "increment", strategy = "org.hibernate.id.IncrementGenerator")
	//@GeneratedValue(generator = "increment")
	private int invoiceItemId;

/*	@Column(name = "item_id")
	private String itemId;*/

	//@Column(name = "item_description")
	private String itemDescription;

	//@Column(name = "color")
	private String color;

	//@Column(name = "size")
	private String size;

	//@Column(name = "uom")
	private String unitOfMeasurement;

	//@Column(name = "invoice_id")
	private String invoiceId;

	//@Column(name = "price")
	private BigDecimal price;

	//@Column(name = "quantity")
	private BigDecimal quantity;

	//@Column(name = "total")
	private BigDecimal total;

	//@Column(name = "sku_id")
	private String skuId;

	//@Column(name = "category")
	private String category;

	//@Column(name = "sub_category")
	private String subCategory;

	//@Column(name = "model")
	private String model;

	//@Column(name = "brand")
	private String brand;

	//@Column(name = "department")
	private String department;

	//@Column(name = "sub_department")
	private String subDepartment;
	
	//@Column(name = "plu_code")
	private String pluCode;
	
	//@Column(name = "measure_range")
	private String measureRange;
	
	//@Column(name = "ean")
	private String ean;
	
	//@Column(name = "grade")
	private String grade;
	
	//@Column(name = "utility")
	private String utility;
	
	//@Column(name = "hsn_code")
	private String hsnCode;
	
	//@Column(name = "cgst_tax_rate")
	private BigDecimal cgstRate;
	
	//@Column(name = "cgst_tax_amt")
	private BigDecimal cgstAmt;
	
	//@Column(name = "sgst_tax_rate")
	private BigDecimal sgstRate;
	
	//@Column(name = "sgst_tax_amt")
	private BigDecimal sgstAmt;
	
	//@Column(name = "igst_tax_rate")
	private BigDecimal igstRate;
	
	//@Column(name = "igst_tax_amt")
	private BigDecimal igstAmt;
	
	//@Column(name = "tax_rate")
	private BigDecimal taxRate;
	
	//@Column(name = "total_tax_amt")
	private BigDecimal totaltaxAmt;
	
	
	private String handledBy;
    private String batchNum;
    private String expiryDate;
    private BigDecimal cessRate;
    private BigDecimal cessAmt;
    private Float discount;
    private Float discountAmt;
    private Float freeQty;
    private Boolean trackingRequired;
    private Boolean isPacked;
    private Float originalSupplyPrice;
    private BigDecimal totalCost;
    private String expiryDateStr;
    
    private List<SkuTax> taxList;
    
    
    private String taxdetailsStr;
    
    
	


	public String getTaxdetailsStr() {
		return taxdetailsStr;
	}

	public void setTaxdetailsStr(String taxdetailsStr) {
		this.taxdetailsStr = taxdetailsStr;
	}

	public List<SkuTax> getTaxList() {
		return taxList;
	}

	public void setTaxList(List<SkuTax> taxList) {
		this.taxList = taxList;
	}

	public String getExpiryDateStr() {
		return expiryDateStr;
	}

	public void setExpiryDateStr(String expiryDateStr) {
		this.expiryDateStr = expiryDateStr;
	}

	public String getHandledBy() {
		return handledBy;
	}

	public void setHandledBy(String handledBy) {
		this.handledBy = handledBy;
	}

	public String getBatchNum() {
		return batchNum;
	}

	public void setBatchNum(String batchNum) {
		this.batchNum = batchNum;
	}

	public String getExpiryDate() {
		return expiryDate;
	}

	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}

	public BigDecimal getCessRate() {
		return cessRate;
	}

	public void setCessRate(BigDecimal cessRate) {
		this.cessRate = cessRate;
	}

	public BigDecimal getCessAmt() {
		return cessAmt;
	}

	public void setCessAmt(BigDecimal cessAmt) {
		this.cessAmt = cessAmt;
	}

	public Float getDiscount() {
		return discount;
	}

	public void setDiscount(Float discount) {
		this.discount = discount;
	}

	public Float getDiscountAmt() {
		return discountAmt;
	}

	public void setDiscountAmt(Float discountAmt) {
		this.discountAmt = discountAmt;
	}

	public Float getFreeQty() {
		return freeQty;
	}

	public void setFreeQty(Float freeQty) {
		this.freeQty = freeQty;
	}

	public Boolean getTrackingRequired() {
		return trackingRequired;
	}

	public void setTrackingRequired(Boolean trackingRequired) {
		this.trackingRequired = trackingRequired;
	}

	public Boolean getIsPacked() {
		return isPacked;
	}

	public void setIsPacked(Boolean isPacked) {
		this.isPacked = isPacked;
	}

	public Float getOriginalSupplyPrice() {
		return originalSupplyPrice;
	}

	public void setOriginalSupplyPrice(Float originalSupplyPrice) {
		this.originalSupplyPrice = originalSupplyPrice;
	}

	public BigDecimal getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(BigDecimal totalCost) {
		this.totalCost = totalCost;
	}

	public int getInvoiceItemId() {
		return invoiceItemId;
	}

	public void setInvoiceItemId(int invoiceItemId) {
		this.invoiceItemId = invoiceItemId;
	}



	public String getItemDescription() {
		return itemDescription;
	}

	public void setItemDescription(String itemDescription) {
		this.itemDescription = itemDescription;
	}

	public String getColor() {
		return color;
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

	public String getUnitOfMeasurement() {
		return unitOfMeasurement;
	}

	public void setUnitOfMeasurement(String unitOfMeasurement) {
		this.unitOfMeasurement = unitOfMeasurement;
	}

	public String getInvoiceId() {
		return invoiceId;
	}

	public void setInvoiceId(String invoiceId) {
		this.invoiceId = invoiceId;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public BigDecimal getQuantity() {
		return quantity;
	}

	public void setQuantity(BigDecimal quantity) {
		this.quantity = quantity;
	}

	public BigDecimal getTotal() {
		return total;
	}

	public void setTotal(BigDecimal total) {
		this.total = total;
	}

	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
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

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
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

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getPluCode() {
		return pluCode;
	}

	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}

	public String getMeasureRange() {
		return measureRange;
	}

	public void setMeasureRange(String measureRange) {
		this.measureRange = measureRange;
	}

	public String getEan() {
		return ean;
	}

	public void setEan(String ean) {
		this.ean = ean;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getUtility() {
		return utility;
	}

	public void setUtility(String utility) {
		this.utility = utility;
	}

	public String getHsnCode() {
		return hsnCode;
	}

	public void setHsnCode(String hsnCode) {
		this.hsnCode = hsnCode;
	}

	public BigDecimal getCgstRate() {
		return cgstRate;
	}

	public void setCgstRate(BigDecimal cgstRate) {
		this.cgstRate = cgstRate;
	}

	public BigDecimal getCgstAmt() {
		return cgstAmt;
	}

	public void setCgstAmt(BigDecimal cgstAmt) {
		this.cgstAmt = cgstAmt;
	}

	public BigDecimal getSgstRate() {
		return sgstRate;
	}

	public void setSgstRate(BigDecimal sgstRate) {
		this.sgstRate = sgstRate;
	}

	public BigDecimal getSgstAmt() {
		return sgstAmt;
	}

	public void setSgstAmt(BigDecimal sgstAmt) {
		this.sgstAmt = sgstAmt;
	}

	public BigDecimal getIgstRate() {
		return igstRate;
	}

	public void setIgstRate(BigDecimal igstRate) {
		this.igstRate = igstRate;
	}

	public BigDecimal getIgstAmt() {
		return igstAmt;
	}

	public void setIgstAmt(BigDecimal igstAmt) {
		this.igstAmt = igstAmt;
	}

	public BigDecimal getTaxRate() {
		return taxRate;
	}

	public void setTaxRate(BigDecimal taxRate) {
		this.taxRate = taxRate;
	}

	public BigDecimal getTotaltaxAmt() {
		return totaltaxAmt;
	}

	public void setTotaltaxAmt(BigDecimal totaltaxAmt) {
		this.totaltaxAmt = totaltaxAmt;
	}

}
