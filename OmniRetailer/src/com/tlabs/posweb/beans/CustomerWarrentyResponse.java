package com.tlabs.posweb.beans;

import java.util.List;

public class CustomerWarrentyResponse {

	private String productId;
	private List<CustomerWarrenty> cusWarrentyDetailsList;
	private ResponseHeader responseHeader;
	private int totalRecords;
	private CustomerWarrenty customerWarrentyobj;
	private String warrentyId=null;

 

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public List<CustomerWarrenty> getCusWarrentyDetailsList() {
		return cusWarrentyDetailsList;
	}

	public void setCusWarrentyDetailsList(List<CustomerWarrenty> cusWarrentyDetailsList) {
		this.cusWarrentyDetailsList = cusWarrentyDetailsList;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public String getWarrentyId() {
		return warrentyId;
	}

	public void setWarrentyId(String warrentyId) {
		this.warrentyId = warrentyId;
	}

	public CustomerWarrenty getCustomerWarrentyobj() {
		return customerWarrentyobj;
	}

	public void setCustomerWarrentyobj(CustomerWarrenty customerWarrentyobj) {
		this.customerWarrentyobj = customerWarrentyobj;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	 
}
