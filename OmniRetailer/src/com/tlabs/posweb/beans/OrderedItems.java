/**
 * 
 */
package com.tlabs.posweb.beans;

import java.math.BigDecimal;
/*
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;*/

/**
 * @author Sambaiah Y
 *
 */
//@Entity
//@Table(name = "orders_items")
public class OrderedItems {

//	@Id
//	@Column(name = "order_item_id")
//	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer order_item_id;


	/*@Column(name = "item_price")
	@Range(min=0,message="ITEM_PRICE_RANGE")
*/	private Float item_price;

	/*@Column(name = "ordered_quantity")
	@Range(min=0,message="ORDERED_QTY_RANGE")*/
	private Float ordered_quantity;
	private float confirmQuantity;
	
	public float getConfirmQuantity() {
		return confirmQuantity;
	}

	public void setConfirmQuantity(float confirmQuantity) {
		this.confirmQuantity = confirmQuantity;
	}

	/*@Column(name = "item_name")
	@Length(min = 0, max=50 ,message = "ITEM_NAME_LENGTH")*/
	private String item_name;

	/*@Column(name = "size")
	@Length(min = 0, max=30 ,message = "SIZE_LENGTH")*/
	private String size;

	/*@Column(name = "colour")
	@Length(min = 0, max=30 ,message = "COLOR_LENGTH")*/
	private String colour;

/*	@Column(name = "model")
	@Length(min = 0, max=30 ,message = "MODEL_LENGTH")
*/	private String model;


private Float minSaleQty; 

	public Float getMinSaleQty() {
	return minSaleQty;
}

public void setMinSaleQty(Float minSaleQty) {
	this.minSaleQty = minSaleQty;
}

	/*@Column(name = "total_cost")
	@Range(min=0,message="TOTAL_COST_RANGE")*/
	private Float total_cost;

	/*@Column(name = "order_id")
	@Length(min = 0, max=25 ,message = "ORDER_REF_LENGTH")*/
	private String order_ref;

	/*@Column(name = "sku_id")
	@Length(min = 0, max=25 ,message = "SKU_ID_LENGTH")*/
	private String skuId;

	/*@Column(name = "unit_of_measurement")
	@Length(min = 0, max=20 ,message = "UOM_LENGTH")*/
	private String uOM;

	/*@Column(name = "plu_code")
	@Length(min = 0, max=30 ,message = "PLU_CODE_LENGTH")*/
	private String pluCode;

	/*@Column(name = "status")
	@Length(min = 0, max=15 ,message = "STATUS_LENGTH")*/
	private String status;

	/*@Column(name = "category")
	@Length(min = 0, max=60 ,message = "CATEGORY_LENGTH")*/
	private String category;

	/*@Column(name = "brand")
	@Length(min = 0, max=30 ,message = "BRAND_LENGTH")*/
	private String brand;

//	@Transient
	private float maxquantity;

	
	//added by M.Srivani  on 5/1/2018
//	@Column(name = "mrp")
//	@Range(min=0,message="MRP_RANGE")
	private BigDecimal mrp = new BigDecimal("0");;

	

	/*@Column(name = "sale_price")
	@Range(min=0,message="SALE_PRICE_RANGE")*/
	private BigDecimal salePrice = new BigDecimal("0");

	/*@Column(name = "discount")
	@Range(min=0,message="DISCOUNT_RANGE")*/
	private BigDecimal discount = new BigDecimal("0");

	/*@Column(name = "manual_discount")
	@Range(min=0,message="MANUAL_DISCOUNT_RANGE")*/
	private BigDecimal manualDiscount = new BigDecimal("0");

	/*@Column(name = "tax_rate")
	@Range(min=0,message="TAX_RATE_RANGE")*/
	private BigDecimal taxRate = new BigDecimal("0");

	/*@Column(name = "tax_value")
	@Range(min=0,message="TAX_VALUE_RANGE")*/
	private BigDecimal taxValue = new BigDecimal("0");

	/*@Column(name = "offer_id")
	@Length(min = 0, max=25 ,message = "OFFER_ID_LENGTH")*/
	private String offerId;
	
	//Added by M.Srivani on 13/2/2018
	/*@Column(name = "tax_code")
	@Length(min = 0, max=50 ,message = "TAX_CODE_LENGTH")*/
	private String taxCode;
	
	/*@Column(name = "sub_category")
	@Length(min = 0, max=60 ,message = "SUB_CATEGORY_LENGTH")*/
	private String subCategory;

	/*@Column(name = "class")
	@Length(min = 0, max=60 ,message = "PRODUCT_CLASS_LENGTH")*/
	private String productClass;

	/*@Column(name = "sub_class")
	@Length(min = 0, max=60 ,message = "SUB_CLASS_LENGTH")*/
	private String subClass;

	/*@Column(name = "department")
	@Length(min = 0, max=60 ,message = "DEPARTMENT_LENGTH")*/
	private String department;

	/*@Column(name = "sub_department")
	@Length(min = 0, max=60 ,message = "SUB_DEPARTMENT_LENGTH")*/
	private String subDepartment;

//	@Column(name = "measure_range")
//	@Length(min = 0, max=30 ,message = "MEASURE_RANGE_LENGTH")
	private String measureRange;

/*	@Column(name = "product_range")
	@Length(min = 0, max=30 ,message = "PRODUCT_RANGE_LENGTH")
*/	private String productRange;
	

	/*@Column(name = "batch")
	@Length(min = 0, max=30 ,message = "BATCH_LENGTH")*/
	private String batch;

	/*@Column(name = "style")
	@Length(min = 0, max=30 ,message = "STYLE_LENGTH")*/
	private String style;

	/*@Column(name = "ean")
	@Length(min = 0, max=30 ,message = "EAN_LENGTH")*/
	private String ean;

	/*@Column(name = "utility")
	@Length(min = 0, max=30 ,message = "UTILITY_LENGTH")*/
	private String utility;

	/*@Column(name = "section")
	@Length(min = 0, max=60 ,message = "SECTION_LENGTH")*/
	private String section;

	/*@Column(name = "hsn_code")
	@Length(min = 0, max=30 ,message = "HSN_CODE_LENGTH")*/
	private String hsnCode;
	

	/*@Column(name = "item_scan_code")
	@Length(min = 0, max=50 ,message = "ITEM_SCAN_CODE_LENGTH")*/
	private String itemScanCode;

//	@Column(name = "is_manufactured")
	private boolean manufacturedItem;

//	@Column(name = "is_packed")
	private boolean packed;

	private boolean itemTaxExclusive;
//	@Column(name = "edit_price_flag")
	private boolean editPriceFlag;


//	@Column(name = "editable_flag")
	private boolean editableFlag;

//	@Column(name = "void_status_flag")
	private boolean voidStatusFlag;
		
//	@Column(name = "zero_stock_flag")
	private boolean zeroStockFlag;
	
//	@Column(name = "tracking_required")
	private boolean trackingRequired;


	public String getDiscountId() {
		return discountId;
	}

	public void setDiscountId(String discountId) {
		this.discountId = discountId;
	}

//	@Column(name = "discount_id")
	private String discountId;


//	@Column(name = "discount_type")
	private String discountType;

	public String getDiscountDesc() {
		return discountDesc;
	}

	public void setDiscountDesc(String discountDesc) {
		this.discountDesc = discountDesc;
	}

	public String getDiscountType() {
		return discountType;
	}

	public void setDiscountType(String discountType) {
		this.discountType = discountType;
	}

//	@Column(name = "discount_description")
	private String discountDesc;

	/* Added by: Prashant Punna
	 * Added on: 04-04-2016
	 * Added this field to update the status of the items which were removed from the order 
	 * during the update order as "void" 
	 * */

//	@Transient
	private Float previous_quantity;

	public BigDecimal getMrp() {
		return mrp;
	}

	public void setMrp(BigDecimal mrp) {
		this.mrp = mrp;
	}

	

	public BigDecimal getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(BigDecimal salePrice) {
		this.salePrice = salePrice;
	}

	public BigDecimal getDiscount() {
		return discount;
	}

	public void setDiscount(BigDecimal discount) {
		this.discount = discount;
	}

	public BigDecimal getManualDiscount() {
		return manualDiscount;
	}

	public void setManualDiscount(BigDecimal manualDiscount) {
		this.manualDiscount = manualDiscount;
	}

	public BigDecimal getTaxRate() {
		return taxRate;
	}

	public void setTaxRate(BigDecimal taxRate) {
		this.taxRate = taxRate;
	}

	
	
	

	public boolean isItemTaxExclusive() {
		return itemTaxExclusive;
	}

	public void setItemTaxExclusive(boolean itemTaxExclusive) {
		this.itemTaxExclusive = itemTaxExclusive;
	}

	public String getOfferId() {
		return offerId;
	}

	public void setOfferId(String offerId) {
		this.offerId = offerId;
	}

	

	public Float getPrevious_quantity() {
		return previous_quantity;
	}

	public void setPrevious_quantity(Float previous_quantity) {
		this.previous_quantity = previous_quantity;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPluCode() {
		return pluCode;
	}

	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}



	public Integer getOrder_item_id() {
		return order_item_id;
	}

	public void setOrder_item_id(Integer order_item_id) {
		this.order_item_id = order_item_id;
	}

	

	public Float getOrdered_quantity() {
		return ordered_quantity;
	}

	public void setOrdered_quantity(Float ordered_quantity) {
		this.ordered_quantity = ordered_quantity;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getColour() {
		return colour;
	}

	public void setColour(String colour) {
		this.colour = colour;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	

	public Float getItem_price() {
		return item_price;
	}

	public void setItem_price(Float item_price) {
		this.item_price = item_price;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public Float getTotal_cost() {
		return total_cost;
	}

	public void setTotal_cost(Float total_cost) {
		this.total_cost = total_cost;
	}

	public String getOrder_ref() {
		return order_ref;
	}

	public void setOrder_ref(String order_ref) {
		this.order_ref = order_ref;
	}

	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}

	public float getMaxquantity() {
		return maxquantity;
	}

	public void setMaxquantity(float maxquantity) {
		this.maxquantity = maxquantity;
	}

	public String getuOM() {
		return uOM;
	}

	public void setuOM(String uOM) {
		this.uOM = uOM;
	}

	public String getTaxCode()
	{
		return taxCode;
	}

	public void setTaxCode(String taxCode)
	{
		this.taxCode = taxCode;
	}

	public String getSubCategory()
	{
		return subCategory;
	}

	public void setSubCategory(String subCategory)
	{
		this.subCategory = subCategory;
	}

	public String getProductClass()
	{
		return productClass;
	}

	public void setProductClass(String productClass)
	{
		this.productClass = productClass;
	}

	public String getSubClass()
	{
		return subClass;
	}

	public void setSubClass(String subClass)
	{
		this.subClass = subClass;
	}

	public String getDepartment()
	{
		return department;
	}

	public void setDepartment(String department)
	{
		this.department = department;
	}

	public String getSubDepartment()
	{
		return subDepartment;
	}

	public void setSubDepartment(String subDepartment)
	{
		this.subDepartment = subDepartment;
	}

	public String getMeasureRange()
	{
		return measureRange;
	}

	public void setMeasureRange(String measureRange)
	{
		this.measureRange = measureRange;
	}

	public String getProductRange()
	{
		return productRange;
	}

	public void setProductRange(String productRange)
	{
		this.productRange = productRange;
	}

	public String getBatch()
	{
		return batch;
	}

	public void setBatch(String batch)
	{
		this.batch = batch;
	}

	public String getStyle()
	{
		return style;
	}

	public void setStyle(String style)
	{
		this.style = style;
	}

	public String getEan()
	{
		return ean;
	}

	public void setEan(String ean)
	{
		this.ean = ean;
	}

	public String getUtility()
	{
		return utility;
	}

	public void setUtility(String utility)
	{
		this.utility = utility;
	}

	public String getSection()
	{
		return section;
	}

	public void setSection(String section)
	{
		this.section = section;
	}

	public String getHsnCode()
	{
		return hsnCode;
	}

	public void setHsnCode(String hsnCode)
	{
		this.hsnCode = hsnCode;
	}

	public String getItemScanCode()
	{
		return itemScanCode;
	}

	public void setItemScanCode(String itemScanCode)
	{
		this.itemScanCode = itemScanCode;
	}

	public boolean isManufacturedItem()
	{
		return manufacturedItem;
	}

	public void setManufacturedItem(boolean manufacturedItem)
	{
		this.manufacturedItem = manufacturedItem;
	}

	public boolean isPacked()
	{
		return packed;
	}

	public void setPacked(boolean packed)
	{
		this.packed = packed;
	}

	public boolean isEditPriceFlag()
	{
		return editPriceFlag;
	}

	public void setEditPriceFlag(boolean editPriceFlag)
	{
		this.editPriceFlag = editPriceFlag;
	}

	public boolean isEditableFlag()
	{
		return editableFlag;
	}

	public void setEditableFlag(boolean editableFlag)
	{
		this.editableFlag = editableFlag;
	}

	public boolean isVoidStatusFlag()
	{
		return voidStatusFlag;
	}

	public void setVoidStatusFlag(boolean voidStatusFlag)
	{
		this.voidStatusFlag = voidStatusFlag;
	}

	public boolean isZeroStockFlag()
	{
		return zeroStockFlag;
	}

	public void setZeroStockFlag(boolean zeroStockFlag)
	{
		this.zeroStockFlag = zeroStockFlag;
	}

	public boolean isTrackingRequired()
	{
		return trackingRequired;
	}

	public void setTrackingRequired(boolean trackingRequired)
	{
		this.trackingRequired = trackingRequired;
	}

	public BigDecimal getTaxValue() {
		return taxValue;
	}

	public void setTaxValue(BigDecimal taxValue) {
		this.taxValue = taxValue;
	}

	
}
