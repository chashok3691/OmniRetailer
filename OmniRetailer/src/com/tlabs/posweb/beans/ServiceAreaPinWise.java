package com.tlabs.posweb.beans;

import java.util.Date;


/**
 * Created by Ramu on 06/09/2022.
 */
///@Entity
///@Table(name="service_area_pin_wise")
public class ServiceAreaPinWise {
	 
	   
	    private int slNo;
	    
	    private String serviceAreaId;
	    
	    private String servicePin;
	    
	    private String description;
	    
	    private String pinAreaName;
	    
	    private String createdDateStr;

		public int getSlNo() {
			return slNo;
		}

		public void setSlNo(int slNo) {
			this.slNo = slNo;
		}

		public String getServiceAreaId() {
			return serviceAreaId;
		}

		public void setServiceAreaId(String serviceAreaId) {
			this.serviceAreaId = serviceAreaId;
		}

		public String getServicePin() {
			return servicePin;
		}

		public void setServicePin(String servicePin) {
			this.servicePin = servicePin;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public String getPinAreaName() {
			return pinAreaName;
		}

		public void setPinAreaName(String pinAreaName) {
			this.pinAreaName = pinAreaName;
		}

		public String getCreatedDateStr() {
			return createdDateStr;
		}

		public void setCreatedDateStr(String createdDateStr) {
			this.createdDateStr = createdDateStr;
		}

	    
	    
}