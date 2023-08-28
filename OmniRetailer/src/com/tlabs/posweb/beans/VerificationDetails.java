package com.tlabs.posweb.beans;

public class VerificationDetails
{
    private String stockLoss;

    private String category;

    private String verifiedDate;

    private String lossType;

    private String productLine;

    private String bookQuantity;

    private String description;

    private String skuId;

    private String serialNumber;

    private String storeLocation;

    private String verifiedQuantity;

    private String comments;

    private String totalRecords;
    
    public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

	public String getStockLoss ()
    {
        return stockLoss;
    }

    public void setStockLoss (String stockLoss)
    {
        this.stockLoss = stockLoss;
    }

    public String getCategory ()
    {
        return category;
    }

    public void setCategory (String category)
    {
        this.category = category;
    }

    public String getVerifiedDate ()
    {
        return verifiedDate;
    }

    public void setVerifiedDate (String verifiedDate)
    {
        this.verifiedDate = verifiedDate;
    }

    public String getLossType ()
    {
        return lossType;
    }

    public void setLossType (String lossType)
    {
        this.lossType = lossType;
    }

    public String getProductLine ()
    {
        return productLine;
    }

    public void setProductLine (String productLine)
    {
        this.productLine = productLine;
    }

    public String getBookQuantity ()
    {
        return bookQuantity;
    }

    public void setBookQuantity (String bookQuantity)
    {
        this.bookQuantity = bookQuantity;
    }

    public String getDescription ()
    {
        return description;
    }

    public void setDescription (String description)
    {
        this.description = description;
    }

    public String getSkuId ()
    {
        return skuId;
    }

    public void setSkuId (String skuId)
    {
        this.skuId = skuId;
    }

    public String getSerialNumber ()
    {
        return serialNumber;
    }

    public void setSerialNumber (String serialNumber)
    {
        this.serialNumber = serialNumber;
    }

    public String getStoreLocation ()
    {
        return storeLocation;
    }

    public void setStoreLocation (String storeLocation)
    {
        this.storeLocation = storeLocation;
    }

    public String getVerifiedQuantity ()
    {
        return verifiedQuantity;
    }

    public void setVerifiedQuantity (String verifiedQuantity)
    {
        this.verifiedQuantity = verifiedQuantity;
    }

    public String getComments ()
    {
        return comments;
    }

    public void setComments (String comments)
    {
        this.comments = comments;
    }

    @Override
    public String toString()
    {
        return "ClassPojo [stockLoss = "+stockLoss+", category = "+category+", verifiedDate = "+verifiedDate+", lossType = "+lossType+", productLine = "+productLine+", bookQuantity = "+bookQuantity+", description = "+description+", skuId = "+skuId+", serialNumber = "+serialNumber+", storeLocation = "+storeLocation+", verifiedQuantity = "+verifiedQuantity+", comments = "+comments+"]";
    }
}