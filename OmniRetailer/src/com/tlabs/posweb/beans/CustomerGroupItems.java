package com.tlabs.posweb.beans;



public class CustomerGroupItems 
{
	//@Id
	//@GeneratedValue(strategy = GenerationType.AUTO)
	//@Column(name = "s_no")
	private int sNo;
	//@Column(name = "group_id",length=20)
	private String group_id;
	//@Column(name = "first_name",length=50)
	private String first_name;
	//@Column(name = "last_name",length=50)
	private String status;
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		
		this.status = status;
	}
	private String last_name;
	//@Column(name = "mobile_no",length=14)
	private String mobile_no;
	//@Column(name = "email_id",length=50)
	private String email_id;
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	//@Column(name = "area",length=100)
	private String area;
	
	//@Column(name = "customer_category",length=50)
	private String customer_category;

	public int getsNo() {
		return sNo;
	}
	public void setsNo(int sNo) {
		this.sNo = sNo;  
	}
	public String getGroup_id() {
		return group_id;
	}
	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}
	
	public String getMobile_no() {
		return mobile_no;
	}
	public void setMobile_no(String mobile_no) {
		this.mobile_no = mobile_no;
	}
	public String getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}
	public String getCustomer_category() {
		return customer_category;
	}
	public void setCustomer_category(String customer_category) {
		this.customer_category = customer_category;
	}
	
	
}
