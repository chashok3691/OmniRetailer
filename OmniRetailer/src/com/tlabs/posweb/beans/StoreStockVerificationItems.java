package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.Comparator;
import java.util.Date;

/*import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;*/



//@Entity
//@Table(name = "store_stock_verification_items")
public class StoreStockVerificationItems {

	//@Id
	//@Column(name = "s_no")
	//@GeneratedValue(strategy = GenerationType.AUTO)
	private int s_no;

	//@Column(name = "verification_code")
	private String verification_code;

	//@Column(name = "product_id")
	private String product_id;

	//@Column(name = "sku_id")
	private String sku_id;

	//@Column(name = "product_book_stock")
	private Float product_book_stock;

	//@Column(name = "product_physical_stock")
	private Float product_physical_stock;

	//@Column(name = "stock_loss")
	private Float stock_loss;

	//@Column(name = "loss_type")
	private String loss_type;

	//@Column(name = "remarks")
	private String remarks;

	//@Column(name = "sku_book_stock")
	private Float sku_book_stock;

	//@Column(name = "sku_physical_stock")
	private Float sku_physical_stock;

	//@Column(name = "sku_allocated")
	private Float sku_allocated;

	//@Column(name = "sku_reordered_qty")
	private Float sku_reordered_qty;

	//@Column(name = "sku_reordered_date")
	private Date sku_reordered_date;

	//@Column(name = "sku_replenishment_date")
	private Date sku_replenishment_date;

	//@Column(name = "storage_unit")
	private String storage_unit;

	/* Added by Chandrasekhar */
	//@Column(name = "plu_code")
	private String pluCode;

	//@Column(name = "sku_sale_price")
	private Float skuSalePrice;

	//@Column(name = "cost_price_value")
	private Float costPriceValue;

	//@Column(name = "mrp_value")
	private Float mrpValue;

	//@Column(name = "sale_price_value")
	private Float salePriceValue;

	//@Column(name = "cost_price_variance")
	private Float costPriceVariance;

	//@Column(name = "mrp_variance")
	private Float mrpVariance;

	//@Column(name = "sale_price_variance")
	private Float salePriceVariance;

	//@Column(name = "sku_cost_price")
	private Float skuCostPrice;

	//@Column(name = "sku_mrp")
	private Float skuMrp;
	
	private Float closedStockCost;
	
	public Float getClosedStockCost() {
		return closedStockCost;
	}
	public void setClosedStockCost(Float closedStockCost) {
		this.closedStockCost = closedStockCost;
	}
	
//	private BigDecimal sku_physical_stock=new BigDecimal("0.0");
	
	private BigDecimal stock_in_qty = new BigDecimal("0");

	public BigDecimal getStock_in_qty() {
		return stock_in_qty;
	}

	public void setStock_in_qty(BigDecimal stock_in_qty) {
		this.stock_in_qty = stock_in_qty;
	}

	//@Column(name = "product_category")
	private String productCategory;

	//@Column(name = "sku_description")
	private String skuDescription;

	//@Column(name = "modal")
	private String modal;

	//@Column(name = "brand")
	private String brand;

	//@Column(name = "sub_category")
	private String subCategory;

	//@Column(name = "uom")
	private String uom;

	//@Column(name = "open_stock")
	private Float openStock;

	//@Column(name = "sale_quantity")
	private Float saleQty;

	//@Column(name = "dump_cost")
	private Float dumpCost;

	//@Column(name = "dump")
	private Float dumpQty;

	//@Column(name = "color")
	private String color;

	//@Column(name = "size")
	private String size;

	//@Column(name = "measure_range")
	private String measureRange;

	//@Column(name = "product_range")
	private String productRange;

	//@Column(name = "stock_loss_qty")
	private Float stockLossQty;

	//@Column(name = "declared_qty")
	private BigDecimal declaredQty;

	//@Column(name = "closed_stock")
	private BigDecimal closedStock;

	//@Transient
	private String sku_expected_date;

	//@Transient
	private String sku_reOrderDate;

	//@Column(name = "created_date")
	private Date createdDate;

	//@Transient
	private String createdDateStr;
	
	//@Column(name = "utility")
	private String utility;

	//@Column(name = "ean")
	private String ean;
	
	//@Transient
	private Double stockCost;

	//@Transient
	private String dumpPer;

	//@Transient
	private String lossPer;
	
	//@Transient
	private String dumpPerforProc;

	//@Transient
	private String productName;
	

	//@Transient
	private Double prevProcQty;
	
	//@Transient
	private String updatedOnStr;
	
	
	public static Comparator<StoreStockVerificationItems> unitPriceDesc = new Comparator<StoreStockVerificationItems>() {

		@Override
		public int compare(StoreStockVerificationItems lhs, StoreStockVerificationItems rhs) {
			float value1 = lhs.getDumpCost();
			float value2 = rhs.getDumpCost();
			return (int) (value2 - value1); // desc order
		}
	};

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getCreatedDateStr() {
		return createdDateStr;
	}

	public void setCreatedDateStr(String createdDateStr) {
		this.createdDateStr = createdDateStr;
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

	public Float getProduct_book_stock() {
		return product_book_stock;
	}

	public void setProduct_book_stock(Float product_book_stock) {
		this.product_book_stock = product_book_stock;
	}

	public Float getProduct_physical_stock() {
		return product_physical_stock;
	}

	public void setProduct_physical_stock(Float product_physical_stock) {
		this.product_physical_stock = product_physical_stock;
	}

	public Float getStock_loss() {
		return stock_loss;
	}

	public void setStock_loss(Float stock_loss) {
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

	public String getMeasureRange() {
		return measureRange;
	}

	public void setMeasureRange(String measureRange) {
		this.measureRange = measureRange;
	}

	public Float getStockLossQty() {
		return stockLossQty;
	}

	public BigDecimal getDeclaredQty() {
		return declaredQty;
	}

	public BigDecimal getClosedStock() {
		return closedStock;
	}

	public void setClosedStock(BigDecimal closedStock) {
		this.closedStock = closedStock;
	}

	public void setDeclaredQty(BigDecimal declaredQty) {
		this.declaredQty = declaredQty;
	}

	public void setStockLossQty(Float stockLossQty) {
		this.stockLossQty = stockLossQty;
	}

	public String getProductRange() {
		return productRange;
	}

	public void setProductRange(String productRange) {
		this.productRange = productRange;
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

	public Float getSku_book_stock() {
		return sku_book_stock;
	}

	public void setSku_book_stock(Float sku_book_stock) {
		this.sku_book_stock = sku_book_stock;
	}

	public Float getSku_physical_stock() {
		return sku_physical_stock;
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

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	public String getUom() {
		return uom;
	}

	public void setUom(String uom) {
		this.uom = uom;
	}

	public void setSku_physical_stock(Float sku_physical_stock) {
		this.sku_physical_stock = sku_physical_stock;
	}

	public Float getSku_allocated() {
		return sku_allocated;
	}

	public void setSku_allocated(Float sku_allocated) {
		this.sku_allocated = sku_allocated;
	}

	public Float getSku_reordered_qty() {
		return sku_reordered_qty;
	}

	public void setSku_reordered_qty(Float sku_reordered_qty) {
		this.sku_reordered_qty = sku_reordered_qty;
	}

	public Date getSku_reordered_date() {
		return sku_reordered_date;
	}

	public void setSku_reordered_date(Date sku_reordered_date) {
		this.sku_reordered_date = sku_reordered_date;
	}

	public Date getSku_replenishment_date() {
		return sku_replenishment_date;
	}

	public void setSku_replenishment_date(Date sku_replenishment_date) {
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

	public Float getSkuSalePrice() {
		return skuSalePrice;
	}

	public void setSkuSalePrice(Float skuSalePrice) {
		this.skuSalePrice = skuSalePrice;
	}

	public Float getCostPriceValue() {
		return costPriceValue;
	}

	public void setCostPriceValue(Float costPriceValue) {
		this.costPriceValue = costPriceValue;
	}

	public Float getMrpValue() {
		return mrpValue;
	}

	public void setMrpValue(Float mrpValue) {
		this.mrpValue = mrpValue;
	}

	public Float getSalePriceValue() {
		return salePriceValue;
	}

	public void setSalePriceValue(Float salePriceValue) {
		this.salePriceValue = salePriceValue;
	}

	public Float getCostPriceVariance() {
		return costPriceVariance;
	}

	public void setCostPriceVariance(Float costPriceVariance) {
		this.costPriceVariance = costPriceVariance;
	}

	public Float getMrpVariance() {
		return mrpVariance;
	}

	public void setMrpVariance(Float mrpVariance) {
		this.mrpVariance = mrpVariance;
	}

	public Float getSalePriceVariance() {
		return salePriceVariance;
	}

	public void setSalePriceVariance(Float salePriceVariance) {
		this.salePriceVariance = salePriceVariance;
	}

	public Float getSkuCostPrice() {
		return skuCostPrice;
	}

	public void setSkuCostPrice(Float skuCostPrice) {
		this.skuCostPrice = skuCostPrice;
	}

	public Float getSkuMrp() {
		return skuMrp;
	}

	public void setSkuMrp(Float skuMrp) {
		this.skuMrp = skuMrp;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	public String getSkuDescription() {
		return skuDescription;
	}

	public void setSkuDescription(String skuDescription) {
		this.skuDescription = skuDescription;
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

	public Double getStockCost() {
		return stockCost;
	}

	public void setStockCost(Double stockCost) {
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

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getUpdatedOnStr() {
		return updatedOnStr;
	}

	public void setUpdatedOnStr(String updatedOnStr) {
		this.updatedOnStr = updatedOnStr;
	}

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

}
