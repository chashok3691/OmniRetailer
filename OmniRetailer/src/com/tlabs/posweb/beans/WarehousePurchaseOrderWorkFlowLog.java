package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.Date;

public class WarehousePurchaseOrderWorkFlowLog {

	private Integer sno;
	private String PO_Ref;
	private String supplier_Id;
	private String supplier_name;
	private String supplier_contact_name;
	private Date order_date;
	private String order_submitted_by;
	private String order_approved_by;
	private String shipping_address_street;
	private String shipping_address_location;
	private String shipping_address_city;
	private String shipping_mode ;
	private BigDecimal shipping_cost;
	private String shipping_terms;
	private Date delivery_due_date;
	private String credit_terms;
	private String payment_terms;
	private BigDecimal  products_cost;
	private BigDecimal total_tax;
	private BigDecimal  total_po_value;
	private String remarks;
	private String status;
	private String warehouse_location;
	private Date orderPlacedDate;
	private String shipping_address_doorNo;
	private Date requestedDate;
	private String requestedBy;
	private Date updatedDate;
	private String zoneId;
	private String userName;
	private String role;
	private String quoteRef;
	
	private String orderDatestr;
	
	
	
	public String getOrderDatestr() {
		return orderDatestr;
	}

	public void setOrderDatestr(String orderDatestr) {
		this.orderDatestr = orderDatestr;
	}

	public Integer getSno() {
		return sno;
	}

	public void setSno(Integer sno) {
		this.sno = sno;
	}

	public String getPO_Ref() {
		return PO_Ref;
	}

	public void setPO_Ref(String pO_Ref) {
		PO_Ref = pO_Ref;
	}

	public String getSupplier_Id() {
		return supplier_Id;
	}

	public void setSupplier_Id(String supplier_Id) {
		this.supplier_Id = supplier_Id;
	}

	public String getSupplier_name() {
		return supplier_name;
	}

	public void setSupplier_name(String supplier_name) {
		this.supplier_name = supplier_name;
	}

	public String getSupplier_contact_name() {
		return supplier_contact_name;
	}

	public void setSupplier_contact_name(String supplier_contact_name) {
		this.supplier_contact_name = supplier_contact_name;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public String getOrder_submitted_by() {
		return order_submitted_by;
	}

	public void setOrder_submitted_by(String order_submitted_by) {
		this.order_submitted_by = order_submitted_by;
	}

	public String getOrder_approved_by() {
		return order_approved_by;
	}

	public void setOrder_approved_by(String order_approved_by) {
		this.order_approved_by = order_approved_by;
	}

	public String getShipping_address_street() {
		return shipping_address_street;
	}

	public void setShipping_address_street(String shipping_address_street) {
		this.shipping_address_street = shipping_address_street;
	}

	public String getShipping_address_location() {
		return shipping_address_location;
	}

	public void setShipping_address_location(String shipping_address_location) {
		this.shipping_address_location = shipping_address_location;
	}

	public String getShipping_address_city() {
		return shipping_address_city;
	}

	public void setShipping_address_city(String shipping_address_city) {
		this.shipping_address_city = shipping_address_city;
	}

	public String getShipping_mode() {
		return shipping_mode;
	}

	public void setShipping_mode(String shipping_mode) {
		this.shipping_mode = shipping_mode;
	}

	 

	public String getShipping_terms() {
		return shipping_terms;
	}

	public void setShipping_terms(String shipping_terms) {
		this.shipping_terms = shipping_terms;
	}

	public Date getDelivery_due_date() {
		return delivery_due_date;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getQuoteRef() {
		return quoteRef;
	}

	public void setQuoteRef(String quoteRef) {
		this.quoteRef = quoteRef;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public void setDelivery_due_date(Date delivery_due_date) {
		this.delivery_due_date = delivery_due_date;
	}

	public String getCredit_terms() {
		return credit_terms;
	}

	public void setCredit_terms(String credit_terms) {
		this.credit_terms = credit_terms;
	}

	public String getPayment_terms() {
		return payment_terms;
	}

	public void setPayment_terms(String payment_terms) {
		this.payment_terms = payment_terms;
	}

 

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getWarehouse_location() {
		return warehouse_location;
	}

	public void setWarehouse_location(String warehouse_location) {
		this.warehouse_location = warehouse_location;
	}

	public Date getOrderPlacedDate() {
		return orderPlacedDate;
	}

	public void setOrderPlacedDate(Date orderPlacedDate) {
		this.orderPlacedDate = orderPlacedDate;
	}

	public String getShipping_address_doorNo() {
		return shipping_address_doorNo;
	}

	public void setShipping_address_doorNo(String shipping_address_doorNo) {
		this.shipping_address_doorNo = shipping_address_doorNo;
	}

	public Date getRequestedDate() {
		return requestedDate;
	}

	public void setRequestedDate(Date requestedDate) {
		this.requestedDate = requestedDate;
	}

	public String getRequestedBy() {
		return requestedBy;
	}

	public void setRequestedBy(String requestedBy) {
		this.requestedBy = requestedBy;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public String getZoneId() {
		return zoneId;
	}

	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}

	public BigDecimal getProducts_cost() {
		return products_cost;
	}

	public void setProducts_cost(BigDecimal products_cost) {
		this.products_cost = products_cost;
	}

	public BigDecimal getTotal_tax() {
		return total_tax;
	}

	public void setTotal_tax(BigDecimal total_tax) {
		this.total_tax = total_tax;
	}

	public BigDecimal getTotal_po_value() {
		return total_po_value;
	}

	public void setTotal_po_value(BigDecimal total_po_value) {
		this.total_po_value = total_po_value;
	}

	public BigDecimal getShipping_cost() {
		return shipping_cost;
	}

	public void setShipping_cost(BigDecimal shipping_cost) {
		this.shipping_cost = shipping_cost;
	}

}
