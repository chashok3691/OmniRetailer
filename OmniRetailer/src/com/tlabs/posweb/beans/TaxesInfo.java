package com.tlabs.posweb.beans;

import java.util.List;

public class TaxesInfo
{
    private String todayTotal;

    private String order;

    private String gto;

    private String date;

    private List<ReportsInfo> reportsInfo;

    private String strDate;

    private String summery;

    public String getTodayTotal ()
    {
        return todayTotal;
    }

    public void setTodayTotal (String todayTotal)
    {
        this.todayTotal = todayTotal;
    }

    public String getGto ()
    {
        return gto;
    }

    public void setGto (String gto)
    {
        this.gto = gto;
    }

    public String getDate ()
    {
        return date;
    }

    public void setDate (String date)
    {
        this.date = date;
    }

    public List<ReportsInfo> getReportsInfo() {
		return reportsInfo;
	}

	public void setReportsInfo(List<ReportsInfo> reportsInfo) {
		this.reportsInfo = reportsInfo;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getStrDate() {
		return strDate;
	}

	public void setStrDate(String strDate) {
		this.strDate = strDate;
	}

	public String getSummery() {
		return summery;
	}

	public void setSummery(String summery) {
		this.summery = summery;
	}

	@Override
    public String toString()
    {
        return "ClassPojo [todayTotal = "+todayTotal+", order = "+order+", gto = "+gto+", date = "+date+", reportsInfo = "+reportsInfo+", strDate = "+strDate+", summery = "+summery+"]";
    }
}
			
			