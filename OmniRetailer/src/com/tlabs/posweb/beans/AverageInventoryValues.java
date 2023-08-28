package com.tlabs.posweb.beans;

public class AverageInventoryValues {

	private String serialNum;
	private String productCategory;
	private String productSubCategory;
	private String skuId;
	private String productDesc;
	private Float averageStock;
	private String startDate;
	private String endDate;
	
	private Float openingStock;
	private Float closingStock;
	
	private String strDate;
	private String date;
	
	private Float tax;
	
	private Float averageStockValue;
	//private Float 
	
	private String inventoryStartDate;
	private String inventoryEndDate;
	private String averageTax;
	
	public String getAverageTax() {
		return averageTax;
	}
	public void setAverageTax(String averageTax) {
		this.averageTax = averageTax;
	}
	public String getInventoryStartDate() {
		return inventoryStartDate;
	}
	public void setInventoryStartDate(String inventoryStartDate) {
		this.inventoryStartDate = inventoryStartDate;
	}
	public String getInventoryEndDate() {
		return inventoryEndDate;
	}
	public void setInventoryEndDate(String inventoryEndDate) {
		this.inventoryEndDate = inventoryEndDate;
	}
	public Float getTax() {
		return tax;
	}
	public Float getAverageStockValue() {
		return averageStockValue;
	}
	public void setAverageStockValue(Float averageStockValue) {
		this.averageStockValue = averageStockValue;
	}
	public void setTax(Float tax) {
		this.tax = tax;
	}
	public String getStrDate() {
		return strDate;
	}
	public void setStrDate(String strDate) {
		this.strDate = strDate;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public Float getOpeningStock() {
		return openingStock;
	}
	public void setOpeningStock(Float openingStock) {
		this.openingStock = openingStock;
	}
	public Float getClosingStock() {
		return closingStock;
	}
	public void setClosingStock(Float closingStock) {
		this.closingStock = closingStock;
	}
	public String getSerialNum() {
		return serialNum;
	}
	public void setSerialNum(String serialNum) {
		this.serialNum = serialNum;
	}
	public String getProductCategory() {
		return productCategory;
	}
	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}
	public String getProductSubCategory() {
		return productSubCategory;
	}
	public void setProductSubCategory(String productSubCategory) {
		this.productSubCategory = productSubCategory;
	}
	public String getSkuId() {
		return skuId;
	}
	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}
	public String getProductDesc() {
		return productDesc;
	}
	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}
	public Float getAverageStock() {
		return averageStock;
	}
	public void setAverageStock(Float averageStock) {
		this.averageStock = averageStock;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	
	/**
	 * @author sambaiah
	 * @Created_On 15-02-2016
	 * @param averageInventory
	 * @return true/false
	 * 
	 * This method is used to compare the two dates are wquals or not
	 */
	public boolean dateEquals(AverageInventoryValues averageInventory,AverageInventoryValues existingInventory) {
		boolean flag = false;
		
		if(averageInventory.getDate() == existingInventory.getDate() || averageInventory.getStrDate().equalsIgnoreCase(existingInventory.getStrDate()))
			flag = true;
		
		return flag;
	}
	
	/**
	 * @author sambaiah
	 * @Created_On 15-02-2016
	 * @param averageInventory
	 * @return true/false
	 * 
	 * This method is used to compare category on same date
	 */
	public boolean dateAndCategoryEquals(AverageInventoryValues averageInventory,AverageInventoryValues existingInventory) {
		boolean flag = false;
		try{
			flag = dateEquals(averageInventory,existingInventory);
			if(flag){
				if(averageInventory.getProductCategory().equalsIgnoreCase(existingInventory.getProductCategory()))
					flag = true;
				else
					flag = false;
			}
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return flag;
	}
	
	/**
	 * @author sambaiah
	 * @Created_On 15-02-2016
	 * @param averageInventory
	 * @return true/false
	 * 
	 * This method is used to compare skus on same date
	 */
	public boolean dateAndSkuIdEquals(AverageInventoryValues averageInventory,AverageInventoryValues existingInventory) {
		boolean flag = false;
		try{
			flag = dateEquals(averageInventory,existingInventory);
			if(flag){
				if(averageInventory.getSkuId().equalsIgnoreCase(existingInventory.getSkuId()))
					flag = true;
				else
					flag = false;
			}
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return flag;
	}
	
}
