package com.tlabs.posweb.beans;


public class ReturnedItems {
	
	private int s_no;
	private String bill_id;
	private String sku_id;
	private String item_name;
	private Float quantity;
	private Float price;
	private Float cost;
	private String date_and_time;
	private String counter_id;
	private String reason;
	private String item_Name;
	private Float itemUnitPrice;
	
	
	public Float getItemUnitPrice() {
		return itemUnitPrice;
	}

	public void setItemUnitPrice(Float itemUnitPrice) {
		this.itemUnitPrice = itemUnitPrice;
	}

	public String getItem_Name() {
		return item_Name;
	}

	public void setItem_Name(String item_Name) {
		this.item_Name = item_Name;
	}

	public int getS_no() {
		return s_no;
	}

	public void setS_no(int s_no) {
		this.s_no = s_no;
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

	public Float getQuantity() {
		return quantity;
	}

	public void setQuantity(Float quantity) {
		this.quantity = quantity;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Float getCost() {
		return cost;
	}

	public void setCost(Float cost) {
		this.cost = cost;
	}

	public String getDate_and_time() {
		return date_and_time;
	}

	public void setDate_and_time(String date_and_time) {
		this.date_and_time = date_and_time;
	}

	public String getCounter_id() {
		return counter_id;
	}

	public void setCounter_id(String counter_id) {
		this.counter_id = counter_id;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

}
