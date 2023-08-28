package com.tlabs.posweb.beans;
/*
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
*/
/*@Entity
@Table(name = "order_item_taxes")
*/public class OrderItemTaxes {
	


//		@Id
//		@Column(name = "s_no")
//		@GeneratedValue(strategy=GenerationType.AUTO)
		private String sno;

//		@Column(name = "order_id")
		private String orderId;

//		@Column(name = "sku_id")
		private String sku_id;

//		@Column(name = "plu_code")
		private String plu_code;

//		@Column(name = "tax_category")
		private String tax_category;

//		@Column(name = "tax_code")
		private String tax_code;

//		@Column(name = "tax_type")
		private String tax_type;

//		@Column(name = "tax_rate")
		private Float tax_rate = 0.0f;

//		@Column(name = "tax_value")
		private Float tax_value = 0.0f;

		public String getSno() {
			return sno;
		}

		public void setSno(String sno) {
			this.sno = sno;
		}

		public String getOrderId() {
			return orderId;
		}

		public void setOrderId(String orderId) {
			this.orderId = orderId;
		}

		public String getSku_id() {
			return sku_id;
		}

		public void setSku_id(String sku_id) {
			this.sku_id = sku_id;
		}

		public String getPlu_code() {
			return plu_code;
		}

		public void setPlu_code(String plu_code) {
			this.plu_code = plu_code;
		}

		public String getTax_category() {
			return tax_category;
		}

		public void setTax_category(String tax_category) {
			this.tax_category = tax_category;
		}

		public String getTax_code() {
			return tax_code;
		}

		public void setTax_code(String tax_code) {
			this.tax_code = tax_code;
		}

		public String getTax_type() {
			return tax_type;
		}

		public void setTax_type(String tax_type) {
			this.tax_type = tax_type;
		}

		public Float getTax_rate() {
			return tax_rate;
		}

		public void setTax_rate(Float tax_rate) {
			this.tax_rate = tax_rate;
		}

		public Float getTax_value() {
			return tax_value;
		}

		public void setTax_value(Float tax_value) {
			this.tax_value = tax_value;
		}
		
		
		
		

}
