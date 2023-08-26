package com.tlabs.posweb.beans;

import java.io.Serializable;
import java.util.List;

@SuppressWarnings("serial")
public class BillItems implements Serializable{
	private int bill_item_id;
	private String bill_id;
	private String sku_id;
	private String item_name;
	private String item_Name;
	private float quantity;
	private float item_total_price;
	private float price;
	private String billId;
	private Float taxRate;
	private String taxCode;
	private String status;
	private Float itemUnitPrice;
	private String pluCode;
	private String discountId;
	private String itemScanCode;
	private String employeeSaleId;
	
	
	
	public String getEmployeeSaleId() {
		return employeeSaleId;
	}
	public void setEmployeeSaleId(String employeeSaleId) {
		this.employeeSaleId = employeeSaleId;
	}
	public String getItemScanCode() {
		return itemScanCode;
	}
	public void setItemScanCode(String itemScanCode) {
		this.itemScanCode = itemScanCode;
	}
	public String getDiscountId() {
		return discountId;
	}
	public void setDiscountId(String discountId) {
		this.discountId = discountId;
	}
	private Float editedPrice;
	private List<BillItems> billItems;
	private Float availQty = 0f;
	private String edited_price;
	private Float mrp;
	private Float itemDiscount;
	private float taxCost;
	private Float originalMRP;
	private float itemCost;
	private float discountPrice =0f;
	
	
	public Float getOriginalMRP() {
		return originalMRP;
	}
	public void setOriginalMRP(Float originalMRP) {
		this.originalMRP = originalMRP;
	}
	public String getBillId() {
		return billId;
	}
	public void setBillId(String billId) {
		this.billId = billId;
	}
	public Float getTaxRate() {
		return taxRate;
	}
	public void setTaxRate(Float taxRate) {
		this.taxRate = taxRate;
	}
	public String getTaxCode() {
		return taxCode;
	}
	public void setTaxCode(String taxCode) {
		this.taxCode = taxCode;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Float getItemUnitPrice() {
		return itemUnitPrice;
	}
	public void setItemUnitPrice(Float itemUnitPrice) {
		this.itemUnitPrice = itemUnitPrice;
	}
	public String getPluCode() {
		return pluCode;
	}
	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}
	public Float getEditedPrice() {
		return editedPrice;
	}
	public void setEditedPrice(Float editedPrice) {
		this.editedPrice = editedPrice;
	}
	public List<BillItems> getBillItems() {
		return billItems;
	}
	public void setBillItems(List<BillItems> billItems) {
		this.billItems = billItems;
	}
	public Float getAvailQty() {
		return availQty;
	}
	public void setAvailQty(Float availQty) {
		this.availQty = availQty;
	}
	public String getEdited_price() {
		return edited_price;
	}
	public void setEdited_price(String edited_price) {
		this.edited_price = edited_price;
	}
	public String getItem_Name() {
		return item_Name;
	}
	public void setItem_Name(String item_Name) {
		this.item_Name = item_Name;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getBill_item_id(){
		return bill_item_id;
	}
	public void setBill_item_id(int bill_item_id){
		this.bill_item_id=bill_item_id;
	}
	public String getBill_id() {
		return bill_id;
	}
	public void setBill_id(String bill_id) {
		this.bill_id = bill_id;
	}
	public String getSku_id() {
		return sku_id;
	}
	public void setSku_id(String sku_id) {
		this.sku_id = sku_id;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	
	public float getItem_total_price(){
		return item_total_price;
	}
	public void setItem_total_price(float item_total_price){
		this.item_total_price=item_total_price;
	}
	public float getQuantity() {
		return quantity;
	}
	public void setQuantity(float quantity) {
		this.quantity = quantity;
	}
	public Float getMrp() {
		return mrp;
	}
	public void setMrp(Float mrp) {
		this.mrp = mrp;
	}
	public Float getItemDiscount() {
		return itemDiscount;
	}
	public void setItemDiscount(Float itemDiscount) {
		this.itemDiscount = itemDiscount;
	}
	public float getTaxCost() {
		return taxCost;
	}
	public void setTaxCost(float taxCost) {
		this.taxCost = taxCost;
	}
	public float getItemCost() {
		return itemCost;
	}
	public void setItemCost(float itemCost) {
		this.itemCost = itemCost;
	}
	public float getDiscountPrice() {
		return discountPrice;
	}
	public void setDiscountPrice(float discountPrice) {
		this.discountPrice = discountPrice;
	}
}
