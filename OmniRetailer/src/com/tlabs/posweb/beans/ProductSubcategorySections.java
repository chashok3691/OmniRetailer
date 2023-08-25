package com.tlabs.posweb.beans;

import java.io.Serializable;
//import java.util.Date;

public class ProductSubcategorySections implements Serializable{

	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 38358743831757091L;


	private Integer sNo;


	private String subcategoryName;


	private String sectionName;


/*	private Date createdDate;*/


	public Integer getsNo() {
		return sNo;
	}


	public void setsNo(Integer sNo) {
		this.sNo = sNo;
	}


	public String getSubcategoryName() {
		return subcategoryName;
	}


	public void setSubcategoryName(String subcategoryName) {
		this.subcategoryName = subcategoryName;
	}


	public String getSectionName() {
		return sectionName;
	}


	public void setSectionName(String sectionName) {
		this.sectionName = sectionName;
	}


	/*public Date getCreatedDate() {
		return createdDate;
	}


	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}*/
}
