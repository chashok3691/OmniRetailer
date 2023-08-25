package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.Date;


/**
* @modified_By  : Satya Narayan Shukla
* @modified_On  : 30-08-2018
* */

public class WarehouseProductBomChild {

	private Integer sNo;
	
	private String bomRef;

	private String itemId;

	
	private String itemDescription;

	
	private String uom;

	
	private BigDecimal quantity;

	private boolean optionalFlag;

	private BigDecimal variance;

	private Date leadTime;

	private Date processTime;

	private BigDecimal itemPrice;


	private String pluCode;

	
	private Integer itemSeqNumber;

	private String processTimeStr;

	private String leadTimeStr;
	private SkuPriceList skuPriceList;
	
	private BigDecimal openStock;
	
	private BigDecimal closedStock;

	private BigDecimal usedStock;
	
	private BigDecimal cost;
	
	
	
	public SkuPriceList getSkuPriceList() {
		return skuPriceList;
	}

	public void setSkuPriceList(SkuPriceList skuPriceList) {
		this.skuPriceList = skuPriceList;
	}
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

	public boolean isOptionalFlag() {
		return optionalFlag;
	}

	public void setOptionalFlag(boolean optionalFlag) {
		this.optionalFlag = optionalFlag;
	}

	public BigDecimal getVariance() {
		return variance;
	}

	public void setVariance(BigDecimal variance) {
		this.variance = variance;
	}

	public Date getLeadTime() {
		return leadTime;
	}

	public void setLeadTime(Date leadTime) {
		this.leadTime = leadTime;
	}

	public Date getProcessTime() {
		return processTime;
	}

	public void setProcessTime(Date processTime) {
		this.processTime = processTime;
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

	public String getProcessTimeStr() {
		return processTimeStr;
	}

	public void setProcessTimeStr(String processTimeStr) {
		this.processTimeStr = processTimeStr;
	}

	public String getLeadTimeStr() {
		return leadTimeStr;
	}

	public void setLeadTimeStr(String leadTimeStr) {
		this.leadTimeStr = leadTimeStr;
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
