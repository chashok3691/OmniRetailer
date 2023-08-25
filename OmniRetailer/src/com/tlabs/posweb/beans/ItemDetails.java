package com.tlabs.posweb.beans;

public class ItemDetails {
	
	private int serialNo;
	private String orderReference;
	private String itemCode;
	private String itemDescription;
	private String quantity;
	private float price;
	private float total;
	/* {"orderReference":"ORID44654","itemCode":"12","itemDescription":"sweet","quantity":"2","price":"200","total":"500"} */
	//item info
	
	
	public int getSerialNo() {
		return serialNo;
	}
	public void setSerialNo(int serialNo) {
		this.serialNo = serialNo;
	}
	public void setItemCode(String itemCode){
			this.itemCode=itemCode;
		}
		public String getItemCode(){
			return itemCode;
		}
	public void setItemDescription(String itemDescription){
			this.itemDescription=itemDescription;
		}
		public String getItemDescription(){
			return itemDescription;
		}
	public void setQuantity(String quantity){
			this.quantity=quantity;
		}
		public String getQuantity(){
			return quantity;
		}
		public void setPrice(float price){
			this.price=price;
		}
		public float getPrice(){
			return price;
		}
	public void setTotal(float total){
			this.total=total;
		}
		public float getTotal(){
			return total;
		}
		public String getOrderReference() {
			return orderReference;
		}
		public void setOrderReference(String orderReference) {
			this.orderReference = orderReference;
		}
		

}