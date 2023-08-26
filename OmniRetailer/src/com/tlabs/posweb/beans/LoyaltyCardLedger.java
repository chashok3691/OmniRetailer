package com.tlabs.posweb.beans;

import java.util.Date;





public class LoyaltyCardLedger
{


	private int sno;

	private String loyaltyCardNumber;


	private Float pointsCredited=null;


	private Float pointsDebited=null;
	

	private Float pointsRemaining=null;;

	private Date createdDate;

	private Date updatedDate;

	

	public int getSno()
	{
		return sno;
	}

	public void setSno(int sno)
	{
		this.sno = sno;
	}

	public String getLoyaltyCardNumber()
	{
		return loyaltyCardNumber;
	}

	public void setLoyaltyCardNumber(String loyaltyCardNumber)
	{
		this.loyaltyCardNumber = loyaltyCardNumber;
	}



	public Date getCreatedDate()
	{
		return createdDate;
	}

	public void setCreatedDate(Date createdDate)
	{
		this.createdDate = createdDate;
	}

	public Date getUpdatedDate()
	{
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate)
	{
		this.updatedDate = updatedDate;
	}
	public String getCreatedDateStr()
	{
		return createdDateStr;
	}

	public void setCreatedDateStr(String createdDateStr)
	{
		this.createdDateStr = createdDateStr;
	}

	public String getUpdatedDateStr()
	{
		return updatedDateStr;
	}
	public RequestHeader getRequestHeader()
	{
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader)
	{
		this.requestHeader = requestHeader;
	}

	public Float getPointsCredited()
	{
		return pointsCredited;
	}

	public void setPointsCredited(Float pointsCredited)
	{
		this.pointsCredited = pointsCredited;
	}

	public Float getPointsDebited()
	{
		return pointsDebited;
	}

	public void setPointsDebited(Float pointsDebited)
	{
		this.pointsDebited = pointsDebited;
	}

	public Float getPointsRemaining()
	{
		return pointsRemaining;
	}

	public void setPointsRemaining(Float pointsRemaining)
	{
		this.pointsRemaining = pointsRemaining;
	}

	public void setUpdatedDateStr(String updatedDateStr)
	{
		this.updatedDateStr = updatedDateStr;
	}

	private String createdDateStr;
	private String updatedDateStr;
	private RequestHeader requestHeader;
}
