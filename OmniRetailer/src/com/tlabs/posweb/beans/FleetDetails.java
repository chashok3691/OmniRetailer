package com.tlabs.posweb.beans;


import java.util.Date;
import java.util.List;


//written by "Kesa Sai" on "04/02/2022" 


/*@Entity
@Table(name="fleet_details")*/
public class FleetDetails {

	/*@Id
	@Column(name = "s_no")*/
	private int sNo;
	
	/*@Column(name = "tansporter_id")*/
	private String tansporterId;
	
/*	@Column(name = "vehicle_no")*/
	private String vehicleNo;
	
	/*@Column(name = "vehicle_type")*/
	private String vehicleType;
	
	/*@Column(name = "vehicle_capacity")*/
	private int vehicleCapacity;
	
	/*@Column(name = "price_rate")*/
	private float priceRate;
	
	/*@Column(name = "driver_name")*/
	private String driverName;
	private String EmailId;
	
	private String mfgDateStr;
	
	
	
	public String getMfgDateStr() {
		return mfgDateStr;
	}

	public void setMfgDateStr(String mfgDateStr) {
		this.mfgDateStr = mfgDateStr;
	}

	public String getEmailId() {
		return EmailId;
	}

	public void setEmailId(String emailId) {
		EmailId = emailId;
	}


	private String vehicledescription;
	public String getVehicledescription() {
		return vehicledescription;
	}

	public void setVehicledescription(String vehicledescription) {
		this.vehicledescription = vehicledescription;
	}

	
	/*@Column(name = "mfg_date")*/
	private String mfgDate;
	
	/*@Column(name = "vehicle_status")*/
	private boolean vehicleStatus;

	public int getsNo() {
		return sNo;
	}

	public String getTansporterId() {
		return tansporterId;
	}

	public String getVehicleNo() {
		return vehicleNo;
	}

	public String getVehicleType() {
		return vehicleType;
	}

	public int getVehicleCapacity() {
		return vehicleCapacity;
	}

	public float getPriceRate() {
		return priceRate;
	}

	public String getDriverName() {
		return driverName;
	}

	public String getMfgDate() {
		return mfgDate;
	}

	public boolean isVehicleStatus() {
		return vehicleStatus;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public void setTansporterId(String tansporterId) {
		this.tansporterId = tansporterId;
	}

	public void setVehicleNo(String vehicleNo) {
		this.vehicleNo = vehicleNo;
	}

	public void setVehicleType(String vehicleType) {
		this.vehicleType = vehicleType;
	}

	public void setVehicleCapacity(int vehicleCapacity) {
		this.vehicleCapacity = vehicleCapacity;
	}

	public void setPriceRate(float priceRate) {
		this.priceRate = priceRate;
	}

	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}

	public void setMfgDate(String mfgDate) {
		this.mfgDate = mfgDate;
	}

	public void setVehicleStatus(boolean vehicleStatus) {
		this.vehicleStatus = vehicleStatus;
	}
	
}
	