package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.List;

public class WareHouseStockVerificationItems {

	private int s_no;
	private String verification_code;
	private String product_id;
	private String sku_id;
	private float product_book_stock;
	private float product_physical_stock;
	private float stock_loss;
	private String loss_type;
	private String remarks;
	private float sku_book_stock;
	private float sku_physical_stock;
	private float sku_allocated;
	private float sku_reordered_qty;
	private String sku_reordered_date;
	private String sku_replenishment_date;
	private String storage_unit;
	private String pluCode;
	private float costPriceValue;
	private float mrpValue;
	private float salePriceValue;
	private float costPriceVariance;
	private float mrpVariance;
	private float salePriceVariance;
	private float skuCostPrice;
	private float skuMrp;
	private float skuSalePrice;
	private String sku_expected_date = null;
	private String sku_reOrderDate = null;
	private String description;
	private int slNo;
	private String totalRecords;
	private String location;
	private String status;
	private Float closedStockCost;
	
	public Float getClosedStockCost() {
		return closedStockCost;
	}
	public void setClosedStockCost(Float closedStockCost) {
		this.closedStockCost = closedStockCost;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	private String category;
	private String skuDescription;
private String createdDateStr;
	public String getCreatedDateStr() {
	return createdDateStr;
}
public void setCreatedDateStr(String createdDateStr) {
	this.createdDateStr = createdDateStr;
}
	private String productName;
	private String stockLossQty;
	private String stockCost;

	private String dumpPer;
	private String lossPer;
	
	private Float openStock;
    private Float saleQty;
    private Float dumpCost;
    private Float dumpQty;
    private String subCategory;
	private String createdDate;
	private String closedStock;
	private String declaredQty;
	private String ean;
	private String color;
	private String updatedOnStr;
	private String salesReportFilePath;
	
     private List<String> nextActivities;
     
     
 	

 

 	private String productCategory;

 	private String modal;

 	private String brand;

 	private String uom;

 	private String size;

 	private String measureRange;

 	private String productRange;

 	

 	private String utility;
 	
 	private BigDecimal stock_in_qty = new BigDecimal("0");
 	
 	
 	
 
	
	private String itemScanCode;
	
	private Boolean trackingRequired;
	
	private String batch_num;
	
	private String expiry_date;
	
	private boolean is_packed;
	
	
	
	private String itemStatus;

	
 	
 	
 	

 	
	
	
     
     
	public String getItemScanCode() {
		return itemScanCode;
	}
	public void setItemScanCode(String itemScanCode) {
		this.itemScanCode = itemScanCode;
	}
	public Boolean getTrackingRequired() {
		return trackingRequired;
	}
	public void setTrackingRequired(Boolean trackingRequired) {
		this.trackingRequired = trackingRequired;
	}
	public String getBatch_num() {
		return batch_num;
	}
	public void setBatch_num(String batch_num) {
		this.batch_num = batch_num;
	}
	public String getExpiry_date() {
		return expiry_date;
	}
	public void setExpiry_date(String expiry_date) {
		this.expiry_date = expiry_date;
	}
	public boolean isIs_packed() {
		return is_packed;
	}
	public void setIs_packed(boolean is_packed) {
		this.is_packed = is_packed;
	}
	public String getItemStatus() {
		return itemStatus;
	}
	public void setItemStatus(String itemStatus) {
		this.itemStatus = itemStatus;
	}
	public BigDecimal getStock_in_qty() {
		return stock_in_qty;
	}
	public void setStock_in_qty(BigDecimal stock_in_qty) {
		this.stock_in_qty = stock_in_qty;
	}
	public String getProductCategory() {
		return productCategory;
	}
	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}
	public String getModal() {
		return modal;
	}
	public void setModal(String modal) {
		this.modal = modal;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getUom() {
		return uom;
	}
	public void setUom(String uom) {
		this.uom = uom;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getMeasureRange() {
		return measureRange;
	}
	public void setMeasureRange(String measureRange) {
		this.measureRange = measureRange;
	}
	public String getProductRange() {
		return productRange;
	}
	public void setProductRange(String productRange) {
		this.productRange = productRange;
	}
	public String getUtility() {
		return utility;
	}
	public void setUtility(String utility) {
		this.utility = utility;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public List<String> getNextActivities() {
		return nextActivities;
	}
	public void setNextActivities(List<String> nextActivities) {
		this.nextActivities = nextActivities;
	}
	private List<WareHouseStockVerificationItems> verfItemDetails;
	
	public List<WareHouseStockVerificationItems> getVerfItemDetails() {
		return verfItemDetails;
	}
	public void setVerfItemDetails(List<WareHouseStockVerificationItems> verfItemDetails) {
		this.verfItemDetails = verfItemDetails;
	}
	private String dumpPerforProc; 
	private Double prevProcQty;
	
	public String getDumpPerforProc() {
		return dumpPerforProc;
	}
	public void setDumpPerforProc(String dumpPerforProc) {
		this.dumpPerforProc = dumpPerforProc;
	}
	public Double getPrevProcQty() {
		return prevProcQty;
	}
	public void setPrevProcQty(Double prevProcQty) {
		this.prevProcQty = prevProcQty;
	}
	public Float getOpenStock() {
		return openStock;
	}
	public void setOpenStock(Float openStock) {
		this.openStock = openStock;
	}
	public Float getSaleQty() {
		return saleQty;
	}
	public void setSaleQty(Float saleQty) {
		this.saleQty = saleQty;
	}
	public Float getDumpCost() {
		return dumpCost;
	}
	public void setDumpCost(Float dumpCost) {
		this.dumpCost = dumpCost;
	}
	public Float getDumpQty() {
		return dumpQty;
	}
	public void setDumpQty(Float dumpQty) {
		this.dumpQty = dumpQty;
	}
	public String getSkuDescription() {
		return skuDescription;
	}
	public void setSkuDescription(String skuDescription) {
		this.skuDescription = skuDescription;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public String getVerification_code() {
		return verification_code;
	}
	public void setVerification_code(String verification_code) {
		this.verification_code = verification_code;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getSku_id() {
		return sku_id;
	}
	public void setSku_id(String sku_id) {
		this.sku_id = sku_id;
	}
	public float getProduct_book_stock() {
		return product_book_stock;
	}
	public void setProduct_book_stock(float product_book_stock) {
		this.product_book_stock = product_book_stock;
	}
	public float getProduct_physical_stock() {
		return product_physical_stock;
	}
	public void setProduct_physical_stock(float product_physical_stock) {
		this.product_physical_stock = product_physical_stock;
	}
	public float getStock_loss() {
		return stock_loss;
	}
	public void setStock_loss(float stock_loss) {
		this.stock_loss = stock_loss;
	}
	public String getLoss_type() {
		return loss_type;
	}
	public void setLoss_type(String loss_type) {
		this.loss_type = loss_type;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public float getSku_book_stock() {
		return sku_book_stock;
	}
	public void setSku_book_stock(float sku_book_stock) {
		this.sku_book_stock = sku_book_stock;
	}
	public float getSku_physical_stock() {
		return sku_physical_stock;
	}
	public void setSku_physical_stock(float sku_physical_stock) {
		this.sku_physical_stock = sku_physical_stock;
	}
	public float getSku_allocated() {
		return sku_allocated;
	}
	public void setSku_allocated(float sku_allocated) {
		this.sku_allocated = sku_allocated;
	}
	public float getSku_reordered_qty() {
		return sku_reordered_qty;
	}
	public void setSku_reordered_qty(float sku_reordered_qty) {
		this.sku_reordered_qty = sku_reordered_qty;
	}
	public String getSku_reordered_date() {
		return sku_reordered_date;
	}
	public void setSku_reordered_date(String sku_reordered_date) {
		this.sku_reordered_date = sku_reordered_date;
	}
	public String getSku_replenishment_date() {
		return sku_replenishment_date;
	}
	public void setSku_replenishment_date(String sku_replenishment_date) {
		this.sku_replenishment_date = sku_replenishment_date;
	}
	public String getStorage_unit() {
		return storage_unit;
	}
	public void setStorage_unit(String storage_unit) {
		this.storage_unit = storage_unit;
	}
	public String getPluCode() {
		return pluCode;
	}
	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}
	public float getSkuSalePrice() {
		return skuSalePrice;
	}
	public void setSkuSalePrice(float skuSalePrice) {
		this.skuSalePrice = skuSalePrice;
	}
	public float getCostPriceValue() {
		return costPriceValue;
	}
	public void setCostPriceValue(float costPriceValue) {
		this.costPriceValue = costPriceValue;
	}
	public float getMrpValue() {
		return mrpValue;
	}
	public void setMrpValue(float mrpValue) {
		this.mrpValue = mrpValue;
	}
	public float getSalePriceValue() {
		return salePriceValue;
	}
	public void setSalePriceValue(float salePriceValue) {
		this.salePriceValue = salePriceValue;
	}
	public float getCostPriceVariance() {
		return costPriceVariance;
	}
	public void setCostPriceVariance(float costPriceVariance) {
		this.costPriceVariance = costPriceVariance;
	}
	public float getMrpVariance() {
		return mrpVariance;
	}
	public void setMrpVariance(float mrpVariance) {
		this.mrpVariance = mrpVariance;
	}
	public float getSalePriceVariance() {
		return salePriceVariance;
	}
	public void setSalePriceVariance(float salePriceVariance) {
		this.salePriceVariance = salePriceVariance;
	}
	public float getSkuCostPrice() {
		return skuCostPrice;
	}
	public void setSkuCostPrice(float skuCostPrice) {
		this.skuCostPrice = skuCostPrice;
	}
	public float getSkuMrp() {
		return skuMrp;
	}
	public void setSkuMrp(float skuMrp) {
		this.skuMrp = skuMrp;
	}
	public String getSku_expected_date() {
		return sku_expected_date;
	}
	public void setSku_expected_date(String sku_expected_date) {
		this.sku_expected_date = sku_expected_date;
	}
	public String getSku_reOrderDate() {
		return sku_reOrderDate;
	}
	public void setSku_reOrderDate(String sku_reOrderDate) {
		this.sku_reOrderDate = sku_reOrderDate;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getSubCategory() {
		return subCategory;
	}
	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public String getClosedStock() {
		return closedStock;
	}
	public void setClosedStock(String closedStock) {
		this.closedStock = closedStock;
	}
	public String getDeclaredQty() {
		return declaredQty;
	}
	public void setDeclaredQty(String declaredQty) {
		this.declaredQty = declaredQty;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getStockLossQty() {
		return stockLossQty;
	}
	public void setStockLossQty(String stockLossQty) {
		this.stockLossQty = stockLossQty;
	}
	public String getStockCost() {
		return stockCost;
	}
	public void setStockCost(String stockCost) {
		this.stockCost = stockCost;
	}
	public String getDumpPer() {
		return dumpPer;
	}
	public void setDumpPer(String dumpPer) {
		this.dumpPer = dumpPer;
	}
	public String getLossPer() {
		return lossPer;
	}
	public void setLossPer(String lossPer) {
		this.lossPer = lossPer;
	}
	public String getEan() {
		return ean;
	}
	public void setEan(String ean) {
		this.ean = ean;
	}
	public String getUpdatedOnStr() {
		return updatedOnStr;
	}
	public void setUpdatedOnStr(String updatedOnStr) {
		this.updatedOnStr = updatedOnStr;
	}
	public String getSalesReportFilePath() {
		return salesReportFilePath;
	}
	public void setSalesReportFilePath(String salesReportFilePath) {
		this.salesReportFilePath = salesReportFilePath;
	}
	
	 
}
