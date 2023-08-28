package com.tlabs.posweb.beans;
public class Summary
{
    private String taxVal;

    private String taxName;

    private String taxAmmount;

    private String taxCode;

    private String saleAmmount;

    public String getTaxVal ()
    {
        return taxVal;
    }

    public void setTaxVal (String taxVal)
    {
        this.taxVal = taxVal;
    }

    public String getTaxName ()
    {
        return taxName;
    }

    public void setTaxName (String taxName)
    {
        this.taxName = taxName;
    }

    public String getTaxAmmount ()
    {
        return taxAmmount;
    }

    public void setTaxAmmount (String taxAmmount)
    {
        this.taxAmmount = taxAmmount;
    }

    public String getTaxCode ()
    {
        return taxCode;
    }

    public void setTaxCode (String taxCode)
    {
        this.taxCode = taxCode;
    }

    public String getSaleAmmount ()
    {
        return saleAmmount;
    }

    public void setSaleAmmount (String saleAmmount)
    {
        this.saleAmmount = saleAmmount;
    }

    @Override
    public String toString()
    {
        return "ClassPojo [taxVal = "+taxVal+", taxName = "+taxName+", taxAmmount = "+taxAmmount+", taxCode = "+taxCode+", saleAmmount = "+saleAmmount+"]";
    }
}
			
			