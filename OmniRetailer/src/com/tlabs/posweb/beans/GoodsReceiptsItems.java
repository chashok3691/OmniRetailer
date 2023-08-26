package com.tlabs.posweb.beans;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

public class GoodsReceiptsItems implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4249112098460397568L;
	private String receipt_ref_num;
	private String item_code;
	private String item_description;
	private String make;
	private int pack;
	private int supplied;
	private int received;
	private int reject;
	private Float price;
	private Float cost;
	private Float total;
	private int id_goods_receipt_items;
	private String skuId;
	private String pluCode;
	private Integer sno;
    private String ean;
	private String supplier_Id;
	private String utility;
	private String receiptNoteRef;
	 private String itemScanCode;
	 private boolean trackingRequired;
	 private String storageRef;
	 private List<WHStorageSystemDetails> storageRefList;
	 private String taxdetailsStr;
	
	 
	 private boolean  itemTaxExclusive;
	 
	 
	 private float discount;
	 private float freeQty;
	 private float poPriceWithDiscount;
	 
	 private float discountAmt;
	 private float priceonnew;
	private float originalSupplierPrice;
	private List<SkuTax> taxList;
	
	
	
		
	 
	 
	
  
public List<SkuTax> getTaxList() {
		return taxList;
	}
	public void setTaxList(List<SkuTax> taxList) {
		this.taxList = taxList;
	}
public float getOriginalSupplierPrice() {
			return originalSupplierPrice;
		}
		public void setOriginalSupplierPrice(float originalSupplierPrice) {
			this.originalSupplierPrice = originalSupplierPrice;
		}
public float getPriceonnew() {
		return priceonnew;
	}
	public void setPriceonnew(float priceonnew) {
		this.priceonnew = priceonnew;
	}
public float getDiscountAmt() {
		return discountAmt;
	}
	public void setDiscountAmt(float discountAmt) {
		this.discountAmt = discountAmt;
	}
public float getPoPriceWithDiscount() {
		return poPriceWithDiscount;
	}
	public void setPoPriceWithDiscount(float poPriceWithDiscount) {
		this.poPriceWithDiscount = poPriceWithDiscount;
	}
public float getDiscount() {
		return discount;
	}
	public void setDiscount(float discount) {
		this.discount = discount;
	}
	public float getFreeQty() {
		return freeQty;
	}
	public void setFreeQty(float freeQty) {
		this.freeQty = freeQty;
	}
public String getTaxdetailsStr() {
		return taxdetailsStr;
	}
	public void setTaxdetailsStr(String taxdetailsStr) {
		this.taxdetailsStr = taxdetailsStr;
	}

public boolean isItemTaxExclusive() {
		return itemTaxExclusive;
	}
	public void setItemTaxExclusive(boolean itemTaxExclusive) {
		this.itemTaxExclusive = itemTaxExclusive;
	}
public List<WHStorageSystemDetails> getStorageRefList() {
		return storageRefList;
	}
	public void setStorageRefList(List<WHStorageSystemDetails> storageRefList) {
		this.storageRefList = storageRefList;
	}
public String getStorageRef() {
		return storageRef;
	}
	public void setStorageRef(String storageRef) {
		this.storageRef = storageRef;
	}
public BigDecimal getMrp() {
		return mrp;
	}
	public void setMrp(BigDecimal mrp) {
		this.mrp = mrp;
	}
private BigDecimal mrp;
private BigDecimal salePrice;


	 
	public BigDecimal getSalePrice() {
	return salePrice;
}
public void setSalePrice(BigDecimal salePrice) {
	this.salePrice = salePrice;
}
	public boolean isTrackingRequired() {
		return trackingRequired;
	}
	public void setTrackingRequired(boolean trackingRequired) {
		this.trackingRequired = trackingRequired;
	}
	public String getItemScanCode() {
		return itemScanCode;
	}
	public void setItemScanCode(String itemScanCode) {
		this.itemScanCode = itemScanCode;
	}
	private String uom;

	private String itemDesc;

	private String itemName;
	
	private Float orderPrice;

	private Float orderQty;

	private String model;
 

	private Float totalCost;

	private Float itemTax;

	private String productRange;

	private String measurementRange;

	private String category;

	private String brand;
	private String color;
	private String size;
	private String handledBy;
	
	private Float supplyPrice=0.0f;

	private Float suppliedQty;
	private String bactchNum;
    private String expiryDateStr;
    private String manufacturedDateStr;

    private BigDecimal cessRate;
    private BigDecimal cessAmt;
    
    private String hsnCode;
    
    public String getHsnCode() {
		return hsnCode;
	}
	public void setHsnCode(String hsnCode) {
		this.hsnCode = hsnCode;
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
	private BigDecimal cgstRate=new BigDecimal("0");;
    
private BigDecimal cgstValue;
	
	
	//@Column(name = "sgst_rate")
	private BigDecimal sgstRate=new BigDecimal("0");;
	
	//@Column(name = "sgst_value")
	private BigDecimal sgstValue;
	//@Column(name = "igst_rate")
	private BigDecimal igstRate=new BigDecimal("0");;
	
	private BigDecimal igstValue;
	
	
	
    
	public BigDecimal getIgstValue() {
		return igstValue;
	}
	public void setIgstValue(BigDecimal igstValue) {
		this.igstValue = igstValue;
	}
	public BigDecimal getCgstRate() {
		return cgstRate;
	}
	public void setCgstRate(BigDecimal cgstRate) {
		this.cgstRate = cgstRate;
	}
	public BigDecimal getCgstValue() {
		return cgstValue;
	}
	public void setCgstValue(BigDecimal cgstValue) {
		this.cgstValue = cgstValue;
	}
	public BigDecimal getSgstRate() {
		return sgstRate;
	}
	public void setSgstRate(BigDecimal sgstRate) {
		this.sgstRate = sgstRate;
	}
	public BigDecimal getSgstValue() {
		return sgstValue;
	}
	public void setSgstValue(BigDecimal sgstValue) {
		this.sgstValue = sgstValue;
	}
	public BigDecimal getIgstRate() {
		return igstRate;
	}
	public void setIgstRate(BigDecimal igstRate) {
		this.igstRate = igstRate;
	}
	public String getBactchNum() {
		return bactchNum;
	}
	public void setBactchNum(String bactchNum) {
		this.bactchNum = bactchNum;
	}
	public String getExpiryDateStr() {
		return expiryDateStr;
	}
	public void setExpiryDateStr(String expiryDateStr) {
		this.expiryDateStr = expiryDateStr;
	}
	public String getManufacturedDateStr() {
		return manufacturedDateStr;
	}
	public void setManufacturedDateStr(String manufacturedDateStr) {
		this.manufacturedDateStr = manufacturedDateStr;
	}
	public String getPluCode() {
		return pluCode;
	}
	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}
	public String getReceipt_ref_num() {
		return receipt_ref_num;
	}
	public void setReceipt_ref_num(String receipt_ref_num) {
		this.receipt_ref_num = receipt_ref_num;
	}
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public String getItem_description() {
		return item_description;
	}
	public void setItem_description(String item_description) {
		this.item_description = item_description;
	}
	public String getMake() {
		return make;
	}
	public void setMake(String make) {
		this.make = make;
	}
	public int getPack() {
		return pack;
	}
	public void setPack(int pack) {
		this.pack = pack;
	}
	public int getSupplied() {
		return supplied;
	}
	public void setSupplied(int supplied) {
		this.supplied = supplied;
	}
	public int getReceived() {
		return received;
	}
	public void setReceived(int received) {
		this.received = received;
	}
	public int getReject() {
		return reject;
	}
	public void setReject(int reject) {
		this.reject = reject;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public float getCost() {
		return cost;
	}
	public void setCost(float cost) {
		this.cost = cost;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	public int getId_goods_receipt_items() {
		return id_goods_receipt_items;
	}
	public void setId_goods_receipt_items(int id_goods_receipt_items) {
		this.id_goods_receipt_items = id_goods_receipt_items;
	}
	public String getSkuId() {
		return skuId;
	}
	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}
	public Integer getSno() {
		return sno;
	}
	public void setSno(Integer sno) {
		this.sno = sno;
	}
	public String getSupplier_Id() {
		return supplier_Id;
	}
	public void setSupplier_Id(String supplier_Id) {
		this.supplier_Id = supplier_Id;
	}
	public String getReceiptNoteRef() {
		return receiptNoteRef;
	}
	public void setReceiptNoteRef(String receiptNoteRef) {
		this.receiptNoteRef = receiptNoteRef;
	}
	public String getUom() {
		return uom;
	}
	public void setUom(String uom) {
		this.uom = uom;
	}
	public String getItemDesc() {
		return itemDesc;
	}
	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public Float getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(Float orderPrice) {
		this.orderPrice = orderPrice;
	}
	public Float getOrderQty() {
		return orderQty;
	}
	public void setOrderQty(Float orderQty) {
		this.orderQty = orderQty;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public Float getTotalCost() {
		return totalCost;
	}
	public void setTotalCost(Float totalCost) {
		this.totalCost = totalCost;
	}
	public Float getItemTax() {
		return itemTax;
	}
	public void setItemTax(Float itemTax) {
		this.itemTax = itemTax;
	}
	public String getProductRange() {
		return productRange;
	}
	public void setProductRange(String productRange) {
		this.productRange = productRange;
	}
	public String getMeasurementRange() {
		return measurementRange;
	}
	public void setMeasurementRange(String measurementRange) {
		this.measurementRange = measurementRange;
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
	public String getHandledBy() {
		return handledBy;
	}
	public void setHandledBy(String handledBy) {
		this.handledBy = handledBy;
	}
	public Float getSupplyPrice() {
		return supplyPrice;
	}
	public void setSupplyPrice(Float supplyPrice) {
		this.supplyPrice = supplyPrice;
	}
	public Float getSuppliedQty() {
		return suppliedQty;
	}
	public void setSuppliedQty(Float suppliedQty) {
		this.suppliedQty = suppliedQty;
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
	public String getEan() {
		return ean;
	}
	public void setEan(String ean) {
		this.ean = ean;
	}
	public String getUtility() {
		return utility;
	}
	public void setUtility(String utility) {
		this.utility = utility;
	}

	
}
