package com.tlabs.posweb.beans;

import java.util.List;

public class TrackerItemDetails {

	
	private List<String> saleItemsList;
	
	private List<String> availItemsList;
	
	private List<String> procuredItemsList;
	
	private List<String> receievedItemsList;
	
	private List<String> issuedItemsList;
	
	private List<String> damagedItemsList;
	
	private List<String> allItemsList;
	
	
	
	public List<String> getEansList() {
		return eansList;
	}

	public void setEansList(List<String> eansList) {
		this.eansList = eansList;
	}

	private List<String> eansList;

	private String totalRecords;
	//private TrackerItemDetails itemdetails;
	
	public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

	public TrackerItemDetails getItemdetails() {
		return itemdetails;
	}

	public void setItemdetails(TrackerItemDetails itemdetails) {
		this.itemdetails = itemdetails;
	}

	private TrackerItemDetails itemdetails;
	/*private List<TrackerItemDetails> itemdetails;*/
	
	/*public TrackerItemDetails getItemdetails() {
		return itemdetails;
	}

	public void setItemdetails(TrackerItemDetails itemdetails) {
		this.itemdetails = itemdetails;
	}*/

/*	public List<TrackerItemDetails> getItemdetails() {
		return itemdetails;
	}

	public void setItemdetails(List<TrackerItemDetails> itemdetails) {
		this.itemdetails = itemdetails;
	}*/

	public List<String> getSaleItemsList() {
		return saleItemsList;
	}

	public void setSaleItemsList(List<String> saleItemsList) {
		this.saleItemsList = saleItemsList;
	}

	public List<String> getAvailItemsList() {
		return availItemsList;
	}

	public void setAvailItemsList(List<String> availItemsList) {
		this.availItemsList = availItemsList;
	}

	public List<String> getProcuredItemsList() {
		return procuredItemsList;
	}

	public void setProcuredItemsList(List<String> procuredItemsList) {
		this.procuredItemsList = procuredItemsList;
	}

	public List<String> getReceievedItemsList() {
		return receievedItemsList;
	}

	public void setReceievedItemsList(List<String> receievedItemsList) {
		this.receievedItemsList = receievedItemsList;
	}

	public List<String> getIssuedItemsList() {
		return issuedItemsList;
	}

	public void setIssuedItemsList(List<String> issuedItemsList) {
		this.issuedItemsList = issuedItemsList;
	}

	public List<String> getDamagedItemsList() {
		return damagedItemsList;
	}

	public void setDamagedItemsList(List<String> damagedItemsList) {
		this.damagedItemsList = damagedItemsList;
	}

	public List<String> getAllItemsList() {
		return allItemsList;
	}

	public void setAllItemsList(List<String> allItemsList) {
		this.allItemsList = allItemsList;
	}
	
	
}
