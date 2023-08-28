package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.List;
import java.util.Set;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import com.tlabs.posweb.util.*;



@XmlRootElement
public class Response
{
  private ResponseHeader responseHeader;
  private List receiptIds;
  private String receiptid;
  private List<Billing> billsList;
  private List<String> billIds;
  private int totalRecords;
  private List<String> eatingHabits;
	
	private RequestHeader requestHeader;
  /*private List<StockLedgerResponse> ledgerDetails;
  private List<StockVerification> verificationDetails;*/
  private String bName;
  private List<BrandMaster> brandDetails;
  private List<ZoneDetails> zoneDetails;
  private List<ZoneMaster> zoneMasterList;
  private List<TenderMaster> tenderList;
  private String zoneID;
  private List<String> deletedItems;
  private List<String> nonDeletedItems;
  private String bookingId;
  private String bookingStatus;
  private List<ProcessingAndPackaging> packagingList;
  private List<FleetMaster> fleetMasterDetails;
  
 private List<String> successList;
 private List<String> failedList;
  
   /* private Status status;
	private Customers customers;
	private Validation_code validation_code;
	*/private Response response;
	private String mobileNum;
	private String otp;
	private float points;
	private Double grandTotalValue;
	private BigDecimal grandTotalBillsValue;
	  private String url;
	  
	  
	  
	

	public List<FleetMaster> getFleetMasterDetails() {
		return fleetMasterDetails;
	}

	public void setFleetMasterDetails(List<FleetMaster> fleetMasterDetails) {
		this.fleetMasterDetails = fleetMasterDetails;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public BigDecimal getGrandTotalBillsValue() {
		return grandTotalBillsValue;
	}

	public List<ProcessingAndPackaging> getPackagingList() {
		return packagingList;
	}

	public void setPackagingList(List<ProcessingAndPackaging> packagingList) {
		this.packagingList = packagingList;
	}

	public void setGrandTotalBillsValue(BigDecimal grandTotalBillsValue) {
		this.grandTotalBillsValue = grandTotalBillsValue;
	}

	//private Responses responses;
	
	//private List<SuppliesReportBean> suppliesReportBeanList;
	
	private List<String> zoneIDs;
	
	private List<String> locationList;
	

	private Set<Sku> outletSkuLists;
	private Set<WareHouseSku> whSkukuLists;
	private List<WareHouseSku> whSkukuListsList;
	
	
	
	
	
	
	
	
	

	public List<WareHouseSku> getWhSkukuListsList() {
		return whSkukuListsList;
	}

	public void setWhSkukuListsList(List<WareHouseSku> whSkukuListsList) {
		this.whSkukuListsList = whSkukuListsList;
	}

	public Set<Sku> getOutletSkuLists() {
		return outletSkuLists;
	}

	public void setOutletSkuLists(Set<Sku> outletSkuLists) {
		this.outletSkuLists = outletSkuLists;
	}

	public Set<WareHouseSku> getWhSkukuLists() {
		return whSkukuLists;
	}

	public void setWhSkukuLists(Set<WareHouseSku> whSkukuLists) {
		this.whSkukuLists = whSkukuLists;
	}

	public Double getGrandTotalValue() {
		return grandTotalValue;
	}

	public void setGrandTotalValue(Double grandTotalValue) {
		this.grandTotalValue = grandTotalValue;
	}

	public List<String> getEatingHabits() {
		return eatingHabits;
	}

	public void setEatingHabits(List<String> eatingHabits) {
		this.eatingHabits = eatingHabits;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	
	public List<String> getZoneIDs() {
		return zoneIDs;
	}

	public void setZoneIDs(List<String> zoneIDs) {
		this.zoneIDs = zoneIDs;
	}

	private String searchBillsFilePath;
	private String searchBillsReportResponse;
  
public String getBookingId() {
	return bookingId;
}

public void setBookingId(String bookingId) {
	this.bookingId = bookingId;
}

public String getBookingStatus() {
	return bookingStatus;
}

public void setBookingStatus(String bookingStatus) {
	this.bookingStatus = bookingStatus;
}

public List<String> getDeletedItems() {
	return deletedItems;
}

public void setDeletedItems(List<String> deletedItems) {
	this.deletedItems = deletedItems;
}

public List<String> getNonDeletedItems() {
	return nonDeletedItems;
}

public void setNonDeletedItems(List<String> nonDeletedItems) {
	this.nonDeletedItems = nonDeletedItems;
}

public String getZoneID() {
	return zoneID;
}

public void setZoneID(String zoneID) {
	this.zoneID = zoneID;
}

public List<ZoneMaster> getZoneMasterList() {
	return zoneMasterList;
}

public void setZoneMasterList(List<ZoneMaster> zoneMasterList) {
	this.zoneMasterList = zoneMasterList;
}
public List<ZoneDetails> getZoneDetails() {
	return zoneDetails;
}

public void setZoneDetails(List<ZoneDetails> zoneDetails) {
	this.zoneDetails = zoneDetails;
}

  public String getbName() {
  	return bName;
  }

  public void setbName(String bName) {
  	this.bName = bName;
  }

  public List<BrandMaster> getBrandDetails() {
  	return brandDetails;
  }

  public void setBrandDetails(List<BrandMaster> brandDetails) {
  	this.brandDetails = brandDetails;
  }


  /*public List<StockVerification> getVerificationDetails() {
  	return verificationDetails;
  }

  public void setVerificationDetails(List<StockVerification> verificationDetails) {
  	this.verificationDetails = verificationDetails;
  }
  


public List<StockLedgerResponse> getLedgerDetails() {
	return ledgerDetails;
}

public void setLedgerDetails(List<StockLedgerResponse> ledgerDetails) {
	this.ledgerDetails = ledgerDetails;
}*/

public int getTotalRecords() {
	return totalRecords;
}

@XmlElement
public List<String> getSuccessList() {
	return successList;
}

/*@XmlElement
public Status getStatus() {
	return status;
}*/

public List<String> getLocationList() {
	return locationList;
}

public void setLocationList(List<String> locationList) {
	this.locationList = locationList;
}
/*
public void setStatus(Status status) {
	this.status = status;
}

@XmlElement
public Customers getCustomers() {
	return customers;
}

public void setCustomers(Customers customers) {
	this.customers = customers;
}

@XmlElement
public Validation_code getValidation_code() {
	return validation_code;
}

public List<SuppliesReportBean> getSuppliesReportBeanList() {
	return suppliesReportBeanList;
}

public void setSuppliesReportBeanList(List<SuppliesReportBean> suppliesReportBeanList) {
	this.suppliesReportBeanList = suppliesReportBeanList;
}

public void setValidation_code(Validation_code validation_code) {
	this.validation_code = validation_code;
}
@XmlElement*/
public Response getResponse() {
	return response;
}

public void setResponse(Response response) {
	this.response = response;
}

@XmlElement
public String getMobileNum() {
	return mobileNum;
}

public void setMobileNum(String mobileNum) {
	this.mobileNum = mobileNum;
}

@XmlElement
public String getOtp() {
	return otp;
}

public void setOtp(String otp) {
	this.otp = otp;
}

@XmlElement
public float getPoints() {
	return points;
}

public void setPoints(float points) {
	this.points = points;
}
/*
@XmlElement
public Responses getResponses() {
	return responses;
}

public void setResponses(Responses responses) {
	this.responses = responses;
}*/

@XmlElement
public void setSuccessList(List<String> successList) {
	this.successList = successList;
}

public List<String> getFailedList() {
	return failedList;
}

@XmlElement
public void setFailedList(List<String> failedList) {
	this.failedList = failedList;
}

public void setTotalRecords(int totalRecords) {
	this.totalRecords = totalRecords;
}

public List<String> getBillIds() {
	return billIds;
}

public void setBillIds(List<String> billIds) {
	this.billIds = billIds;
}

public List<Billing> getBillsList() {
	return billsList;
}

public void setBillsList(List<Billing> billsList) {
	this.billsList = billsList;
}

public String getReceiptid() {
	return receiptid;
}

public void setReceiptid(String receiptid) {
	this.receiptid = receiptid;
}

@SuppressWarnings("rawtypes")
public List getReceiptIds() {
	return receiptIds;
}

@SuppressWarnings("rawtypes")
public void setReceiptIds(List receiptIds) {
	this.receiptIds = receiptIds;
}

public ResponseHeader getResponseHeader() {
	return responseHeader;
}

public void setResponseHeader(ResponseHeader responseHeader) {
	this.responseHeader = responseHeader;
}

public String getSearchBillsFilePath() {
	return searchBillsFilePath;
}

public void setSearchBillsFilePath(String searchBillsFilePath) {
	this.searchBillsFilePath = searchBillsFilePath;
}

public String getSearchBillsReportResponse() {
	return searchBillsReportResponse;
}

public void setSearchBillsReportResponse(String searchBillsReportResponse) {
	this.searchBillsReportResponse = searchBillsReportResponse;
}

public List<TenderMaster> getTenderList() {
	return tenderList;
}

public void setTenderList(List<TenderMaster> tenderList) {
	this.tenderList = tenderList;
}



  
 
}
