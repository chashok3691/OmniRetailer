/**
 * 
 */
package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.List;


/**
 * @author naveenjilla
 *
 */
public class WarehouseBOMSummary {

	private String category;
	private String location;
	private String itemId;
	private String itemDescription;
	private String uom;
	private BigDecimal openStock;
	private BigDecimal closeStock;
	private BigDecimal stockCost;
    private List<WarehouseProductBomChild> bomChilds;
	private BigDecimal usedStock;
	private BigDecimal unitPrice;
	private BigDecimal totalCost;
	//private List<BillOfMaterialChild> bomChild;
	//private List<BillOfMaterialChild> bomChild;
	
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

	public BigDecimal getOpenStock() {
		return openStock;
	}

	public void setOpenStock(BigDecimal openStock) {
		this.openStock = openStock;
	}

	public BigDecimal getCloseStock() {
		return closeStock;
	}

	public void setCloseStock(BigDecimal closeStock) {
		this.closeStock = closeStock;
	}

	public BigDecimal getStockCost() {
		return stockCost;
	}

	public void setStockCost(BigDecimal stockCost) {
		this.stockCost = stockCost;
	}

	public List<WarehouseProductBomChild> getBomChilds() {
		return getBomChilds();
	}
	public void setBomChilds(List<WarehouseProductBomChild> bomChilds) {
		this.bomChilds = bomChilds;
	}

	public BigDecimal getUsedStock() {
		return usedStock;
	}

	public void setUsedStock(BigDecimal usedStock) {
		this.usedStock = usedStock;
	}

	

	public BigDecimal getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(BigDecimal unitPrice) {
		this.unitPrice = unitPrice;
	}

	public BigDecimal getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(BigDecimal totalCost) {
		this.totalCost = totalCost;
	}

	



	

	
}
