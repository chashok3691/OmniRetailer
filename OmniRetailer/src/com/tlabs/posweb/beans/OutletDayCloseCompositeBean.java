package com.tlabs.posweb.beans;

import java.io.Serializable;
/*
import javax.persistence.Column;
import javax.persistence.Embeddable;*/

@SuppressWarnings("serial")
//@Embeddable
public class OutletDayCloseCompositeBean implements Serializable {
	

	//@Column(name = "outlet_location")
	private String outletLocation;
	
	//@Column(name = "business_counter")
	private String businessCounter;

	

	public String getOutletLocation() {
		return outletLocation;
	}

	public void setOutletLocation(String outletLocation) {
		this.outletLocation = outletLocation;
	}

	public String getBusinessCounter() {
		return businessCounter;
	}

	public void setBusinessCounter(String businessCounter) {
		this.businessCounter = businessCounter;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((outletLocation == null) ? 0 : outletLocation.hashCode());
		result = prime * result + ((businessCounter == null) ? 0 : businessCounter.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OutletDayCloseCompositeBean other = (OutletDayCloseCompositeBean) obj;
		if (outletLocation == null) {
			if (other.outletLocation != null)
				return false;
		} else if (!outletLocation.equals(other.outletLocation))
			return false;
		if (businessCounter == null) {
			if (other.businessCounter != null)
				return false;
		} else if (!businessCounter.equals(other.businessCounter))
			return false;
		return true;
	}


}
