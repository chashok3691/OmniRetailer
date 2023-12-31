package com.tlabs.posweb.beans;
// Generated Oct 6, 2014 11:10:28 AM by Hibernate Tools 3.1.0.beta4



/**
 * BillingTransactions generated by hbm2java
 */

public class BillingTransactions  implements java.io.Serializable {


    // Fields    

     /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String transactionId;
     private String billId;
     private String modeOfPayment;
     private String cardType;
     private String cardSubType;
     private String cardNumber;
     private String paidAmount;
     private String dateAndTime;

     private String couponNumber;
     private String bankName;
     private String approvalCode;
     private Float receivedAmountt;
     private Float changeReturns;
     private String cardInfo;
     private String receivedAmount;
     private String changeReturn;
     private String dateTime = null;
     private String cusomer;
     private String totalRecords;

  	private String salesReportFilePath;
  	
  	private String tenderMode;
  	private String dateAndTimeStr;
  	
  	
  	

   
    // Property accessors

    public String getTenderMode() {
		return tenderMode;
	}

	public void setTenderMode(String tenderMode) {
		this.tenderMode = tenderMode;
	}

	public String getDateAndTimeStr() {
		return dateAndTimeStr;
	}

	public void setDateAndTimeStr(String dateAndTimeStr) {
		this.dateAndTimeStr = dateAndTimeStr;
	}

	public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

	public String getCusomer() {
		return cusomer;
	}

	public void setCusomer(String cusomer) {
		this.cusomer = cusomer;
	}

	public String getCouponNumber() {
		return couponNumber;
	}

	public void setCouponNumber(String couponNumber) {
		this.couponNumber = couponNumber;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getApprovalCode() {
		return approvalCode;
	}

	public void setApprovalCode(String approvalCode) {
		this.approvalCode = approvalCode;
	}

	public Float getReceivedAmountt() {
		return receivedAmountt;
	}

	public void setReceivedAmountt(Float receivedAmountt) {
		this.receivedAmountt = receivedAmountt;
	}

	public Float getChangeReturns() {
		return changeReturns;
	}

	public void setChangeReturns(Float changeReturns) {
		this.changeReturns = changeReturns;
	}

	public String getCardInfo() {
		return cardInfo;
	}

	public void setCardInfo(String cardInfo) {
		this.cardInfo = cardInfo;
	}

	public String getReceivedAmount() {
		return receivedAmount;
	}

	public void setReceivedAmount(String receivedAmount) {
		this.receivedAmount = receivedAmount;
	}

	public String getChangeReturn() {
		return changeReturn;
	}

	public void setChangeReturn(String changeReturn) {
		this.changeReturn = changeReturn;
	}

	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getTransactionId() {
        return this.transactionId;
    }
    
    public void setTransactionId(String transactionId) {
        this.transactionId = transactionId;
    }

    public String getBillId() {
        return this.billId;
    }
    
    public void setBillId(String billId) {
        this.billId = billId;
    }

    public String getModeOfPayment() {
        return this.modeOfPayment;
    }
    
    public void setModeOfPayment(String modeOfPayment) {
        this.modeOfPayment = modeOfPayment;
    }

    public String getCardType() {
        return this.cardType;
    }
    
    public void setCardType(String cardType) {
        this.cardType = cardType;
    }

    public String getCardSubType() {
        return this.cardSubType;
    }
    
    public void setCardSubType(String cardSubType) {
        this.cardSubType = cardSubType;
    }

    public String getCardNumber() {
        return this.cardNumber;
    }
    
    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getPaidAmount() {
        return this.paidAmount;
    }
    
    public void setPaidAmount(String paidAmount) {
        this.paidAmount = paidAmount;
    }

    public String getDateAndTime() {
        return this.dateAndTime;
    }
    
    public void setDateAndTime(String dateAndTime) {
        this.dateAndTime = dateAndTime;
    }

	public String getSalesReportFilePath() {
		return salesReportFilePath;
	}

	public void setSalesReportFilePath(String salesReportFilePath) {
		this.salesReportFilePath = salesReportFilePath;
	}
   








}
