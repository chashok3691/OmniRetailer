package com.tlabs.posweb.beans;

//import java.util.Date;
/*
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;*/

/*@Entity
@Table(name = "order_discounts")*/
public class OrderDiscounts {

	

	/*	@Id
		@Column(name = "s_no")
		@GeneratedValue(strategy = GenerationType.AUTO)*/
		private Integer serialNum;
		
//		@Column(name = "order_id")
		private String orderId;
		
//		@Column(name = "discount_type")
		private String discountType;
		
//		@Column(name = "discount_id")
		private String discountId;
		
//		@Column(name = "item_name")
		private String itemName;
		
//		@Column(name = "sku_id")
		private String skuId;
		
//		@Column(name = "discount_value")
		private Float discountPrice = 0.0f;
		
//		@Column(name = "item_price")
		private Float itemPrice = 0.0f;
		
//		@Column(name = "date")
//		private Date date;
		
//		@Column(name = "remarks")
		private String remarks;
		
//		@Column(name = "plu_code")
		private String pluCode;
		
//		@Column(name = "employee_code")
		private String employeeCode;

		/*public int getSerialNum() {
			return serialNum;
		}

		public void setSerialNum(int serialNum) {
			this.serialNum = serialNum;
		}
*/
		public String getOrderId() {
			return orderId;
		}

		public Integer getSerialNum() {
			return serialNum;
		}

		public void setSerialNum(Integer serialNum) {
			this.serialNum = serialNum;
		}

		public void setOrderId(String orderId) {
			this.orderId = orderId;
		}

		public String getDiscountType() {
			return discountType;
		}

		public void setDiscountType(String discountType) {
			this.discountType = discountType;
		}

		public String getDiscountId() {
			return discountId;
		}

		public void setDiscountId(String discountId) {
			this.discountId = discountId;
		}

		public String getItemName() {
			return itemName;
		}

		public void setItemName(String itemName) {
			this.itemName = itemName;
		}

		public String getSkuId() {
			return skuId;
		}

		public void setSkuId(String skuId) {
			this.skuId = skuId;
		}

		public Float getDiscountPrice() {
			return discountPrice;
		}

		public void setDiscountPrice(Float discountPrice) {
			this.discountPrice = discountPrice;
		}

		public Float getItemPrice() {
			return itemPrice;
		}

		public void setItemPrice(Float itemPrice) {
			this.itemPrice = itemPrice;
		}

	/*	public Date getDate() {
			return date;
		}

		public void setDate(Date date) {
			this.date = date;
		}
*/
		public String getRemarks() {
			return remarks;
		}

		public void setRemarks(String remarks) {
			this.remarks = remarks;
		}

		public String getPluCode() {
			return pluCode;
		}

		public void setPluCode(String pluCode) {
			this.pluCode = pluCode;
		}

		public String getEmployeeCode() {
			return employeeCode;
		}

		public void setEmployeeCode(String employeeCode) {
			this.employeeCode = employeeCode;
		}
		
		
	
	
}
