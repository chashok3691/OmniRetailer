package com.tlabs.posweb.beans;
public class ReportsInfo
{
    private String taxAmount;

    private String taxRate;

    private String taxName;

    private String date;

    private String taxCode;

    private String totalSale;

    private String strDate;

    public String getTaxAmount ()
    {
        return taxAmount;
    }

    public void setTaxAmount (String taxAmount)
    {
        this.taxAmount = taxAmount;
    }

    public String getTaxRate ()
    {
        return taxRate;
    }

    public void setTaxRate (String taxRate)
    {
        this.taxRate = taxRate;
    }

    public String getTaxName ()
    {
        return taxName;
    }

    public void setTaxName (String taxName)
    {
        this.taxName = taxName;
    }

    public String getDate ()
    {
        return date;
    }

    public void setDate (String date)
    {
        this.date = date;
    }

    public String getTaxCode ()
    {
        return taxCode;
    }

    public void setTaxCode (String taxCode)
    {
        this.taxCode = taxCode;
    }

    public String getTotalSale ()
    {
        return totalSale;
    }

    public void setTotalSale (String totalSale)
    {
        this.totalSale = totalSale;
    }

    public String getStrDate ()
    {
        return strDate;
    }

    public void setStrDate (String strDate)
    {
        this.strDate = strDate;
    }

    @Override
    public String toString()
    {
        return "ClassPojo [taxAmount = "+taxAmount+", taxRate = "+taxRate+", taxName = "+taxName+", date = "+date+", taxCode = "+taxCode+", totalSale = "+totalSale+", strDate = "+strDate+"]";
    }
}