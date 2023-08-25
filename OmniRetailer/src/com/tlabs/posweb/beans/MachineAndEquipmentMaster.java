package com.tlabs.posweb.beans;
import java.util.Date;
import java.util.List;


public class MachineAndEquipmentMaster {

	private String machineEquipmentId;
	
	private String machineEquipmentType;

	private String machineEquipmentName;
	
	private Date yearOfPurchase;
	
	private String description;
	
	private Double purchaseCost;
	
	private Double rateOfDepreciation;

	private String status;
	
	private Date createdDate=new Date();
	
	private Date updatedDate = new Date();
	
	private String userName;
	
	private String roleName;
	
	private RequestHeader requestHeader;
	
	private ResponseHeader responsHeader;
	
	private String startDateStr;
	
	private String endDateStr;
	
	private String storeLocation;
	
	
	
	
	public String getStoreLocation() {
		return storeLocation;
	}

	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}

	public String getStartDateStr() {
		return startDateStr;
	}

	public void setStartDateStr(String startDateStr) {
		this.startDateStr = startDateStr;
	}

	public String getEndDateStr() {
		return endDateStr;
	}

	public void setEndDateStr(String endDateStr) {
		this.endDateStr = endDateStr;
	}

	private List<MachineAndEquipmentMaster> listOfMachineAndEquipments;
	
	

	public List<MachineAndEquipmentMaster> getListOfMachineAndEquipments() {
		return listOfMachineAndEquipments;
	}

	public void setListOfMachineAndEquipments(List<MachineAndEquipmentMaster> listOfMachineAndEquipments) {
		this.listOfMachineAndEquipments = listOfMachineAndEquipments;
	}

	public String getMachineEquipmentId() {
		return machineEquipmentId;
	}

	public void setMachineEquipmentId(String machineEquipmentId) {
		this.machineEquipmentId = machineEquipmentId;
	}

	public String getMachineEquipmentType() {
		return machineEquipmentType;
	}

	public void setMachineEquipmentType(String machineEquipmentType) {
		this.machineEquipmentType = machineEquipmentType;
	}

	public String getMachineEquipmentName() {
		return machineEquipmentName;
	}

	public void setMachineEquipmentName(String machineEquipmentName) {
		this.machineEquipmentName = machineEquipmentName;
	}

	public Date getYearOfPurchase() {
		return yearOfPurchase;
	}

	public void setYearOfPurchase(Date yearOfPurchase) {
		this.yearOfPurchase = yearOfPurchase;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Double getPurchaseCost() {
		return purchaseCost;
	}

	public void setPurchaseCost(Double purchaseCost) {
		this.purchaseCost = purchaseCost;
	}

	public Double getRateOfDepreciation() {
		return rateOfDepreciation;
	}

	public void setRateOfDepreciation(Double rateOfDepreciation) {
		this.rateOfDepreciation = rateOfDepreciation;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public ResponseHeader getResponsHeader() {
		return responsHeader;
	}

	public void setResponsHeader(ResponseHeader responsHeader) {
		this.responsHeader = responsHeader;
	}
	
	
	
}

