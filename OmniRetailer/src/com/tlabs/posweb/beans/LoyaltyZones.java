package com.tlabs.posweb.beans;




public class LoyaltyZones
{

	private int sno;
		
	private String loyaltyProgId;
	
	private String states;
	
	private String country;
	
	private String loyaltyZoneDescription;
	
	private String zone;

	public String getZone()
	{
		return zone;
	}

	public void setZone(String zone)
	{
		this.zone = zone;
	}

	public int getSno()
	{
		return sno;
	}

	public void setSno(int sno)
	{
		this.sno = sno;
	}

	public String getLoyaltyProgId()
	{
		return loyaltyProgId;
	}

	public String getStates()
	{
		return states;
	}

	public void setStates(String states)
	{
		this.states = states;
	}

	public void setLoyaltyProgId(String loyaltyProgId)
	{
		this.loyaltyProgId = loyaltyProgId;
	}
	public String getCountry()
	{
		return country;
	}

	public void setCountry(String country)
	{
		this.country = country;
	}

	public String getLoyaltyZoneDescription()
	{
		return loyaltyZoneDescription;
	}

	public void setLoyaltyZoneDescription(String loyaltyZoneDescription)
	{
		this.loyaltyZoneDescription = loyaltyZoneDescription;
	}
	
	

}
