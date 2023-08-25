package com.tlabs.posweb.beans;

import java.math.BigDecimal;
//import java.util.Date;


public class BillOfMaterialChild {

	private Integer sNo;

	private String bomRef;

	private String itemId;

	private String itemDescription;

	private String uom;

	private BigDecimal quantity = new BigDecimal("0"); 

	private int optional;
	private Boolean optionalFlag;
	private BigDecimal variance = new BigDecimal("0");
	private String leadTimeStr;
	private String processTimeStr;
	private String leadTime;
	private String processTime;
	private SkuPriceList skuPriceList;
/*	private Date leadTime;
	private SkuPriceList skuPriceList;
	private Date processTime;*/
	
	private BigDecimal openStock;
	
	
	private BigDecimal closedStock;

	
	private BigDecimal usedStock;
	
	
	private BigDecimal cost  = new BigDecimal("0"); 
	private BigDecimal itemPrice = new BigDecimal("0"); 

	private String pluCode;
	
private float avlQty;
	
	private float inwardQty;
	
	

	public float getAvlQty() {
		return avlQty;
	}

	public void setAvlQty(float avlQty) {
		this.avlQty = avlQty;
	}

	public float getInwardQty() {
		return inwardQty;
	}

	public void setInwardQty(float inwardQty) {
		this.inwardQty = inwardQty;
	}

	private Integer itemSeqNumber =0;

	public Integer getsNo() {
		return sNo;
	}

	public void setsNo(Integer sNo) {
		this.sNo = sNo;
	}

	public String getBomRef() {
		return bomRef;
	}

	public void setBomRef(String bomRef) {
		this.bomRef = bomRef;
	}

	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
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

	public BigDecimal getQuantity() {
		return quantity;
	}

	public void setQuantity(BigDecimal quantity) {
		this.quantity = quantity;
	}

	public int getOptional() {
		return optional;
	}

	public void setOptional(int optional) {
		this.optional = optional;
	}

	public BigDecimal getVariance() {
		return variance;
	}

	public void setVariance(BigDecimal variance) {
		this.variance = variance;
	}


	public BigDecimal getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(BigDecimal itemPrice) {
		this.itemPrice = itemPrice;
	}

	public String getPluCode() {
		return pluCode;
	}

	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}

	public Integer getItemSeqNumber() {
		return itemSeqNumber;
	}

	public void setItemSeqNumber(Integer itemSeqNumber) {
		this.itemSeqNumber = itemSeqNumber;
	}

	public Boolean getOptionalFlag() {
		return optionalFlag;
	}

	public void setOptionalFlag(Boolean optionalFlag) {
		this.optionalFlag = optionalFlag;
	}

	public String getLeadTimeStr() {
		return leadTimeStr;
	}

	public void setLeadTimeStr(String leadTimeStr) {
		this.leadTimeStr = leadTimeStr;
	}

	public String getProcessTimeStr() {
		return processTimeStr;
	}

	public void setProcessTimeStr(String processTimeStr) {
		this.processTimeStr = processTimeStr;
	}

	public String getProcessTime() {
		return processTime;
	}

	public void setProcessTime(String processTime) {
		this.processTime = processTime;
	}

	public String getLeadTime() {
		return leadTime;
	}

	public void setLeadTime(String leadTime) {
		this.leadTime = leadTime;
	}

	public SkuPriceList getSkuPriceList() {
		return skuPriceList;
	}

	public void setSkuPriceList(SkuPriceList skuPriceList) {
		this.skuPriceList = skuPriceList;
	}

	public BigDecimal getOpenStock() {
		return openStock;
	}

	public void setOpenStock(BigDecimal openStock) {
		this.openStock = openStock;
	}

	public BigDecimal getClosedStock() {
		return closedStock;
	}

	public void setClosedStock(BigDecimal closedStock) {
		this.closedStock = closedStock;
	}

	public BigDecimal getUsedStock() {
		return usedStock;
	}

	public void setUsedStock(BigDecimal usedStock) {
		this.usedStock = usedStock;
	}

	public BigDecimal getCost() {
		return cost;
	}

	public void setCost(BigDecimal cost) {
		this.cost = cost;
	}

}
