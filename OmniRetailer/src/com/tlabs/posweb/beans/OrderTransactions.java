package com.tlabs.posweb.beans;

import java.math.BigDecimal;
//import java.util.Date;
import java.util.List;

/*import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.tlabs.omniretailerservices.beans.RequestHeader;*/
 
/*@Entity
@Table(name = "order_transactions")*/
public class OrderTransactions {

/*	@Id
	@Column(name = "transaction_Id")
	@GeneratedValue(strategy = GenerationType.AUTO)*/
	private Integer transactionId;

//	@Column(name = "order_id")
	private String orderId;

//	@Column(name = "mode_of_payment")
	private String modeOfPayment;

//	@Column(name = "card_type")
	private String cardType;

//	@Column(name = "coupon_number")
	private String couponNumber;

//	@Column(name = "paid_amount")
	private BigDecimal paidAmount = new BigDecimal("0");

//	@Column(name = "date_and_time")
//	private Date dateAndTime;

//	@Column(name = "bank_name")
	private String bankName;

//	@Column(name = "approval_code")
	private String approvalCode;

//	@Column(name = "received_mount")
	private BigDecimal receivedAmount = new BigDecimal("0");

//	@Column(name = "change_return")
	private BigDecimal changeReturn = new BigDecimal("0");

//	@Column(name = "card_info")
	private String cardInfo;
	
//	@Column(name = "payment_status")
	private String paymentStatus;


//	@Transient
	private RequestHeader requestHeader;

//	@Transient
	private String startIndex;

//	@Transient
	private String maxRecords;

//	@Transient
	private String searchCriteria;

//	@Transient
	private String dateTime;

//	@Transient
	private String startDateStr;
	
	private String paymentRef; 
	
	
	

	public String getPaymentRef() {
		return paymentRef;
	}

	public void setPaymentRef(String paymentRef) {
		this.paymentRef = paymentRef;
	}

	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}

//	@Transient
	private String endDateStr;

//	@Transient
	private List<String> transactionIds;

	public List<String> getTransactionIds() {
		return transactionIds;
	}

	
	public void setTransactionIds(List<String> transactionIds) {
		this.transactionIds = transactionIds;
	}

	
	public String getPaymentStatus()
	{
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus)
	{
		this.paymentStatus = paymentStatus;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public String getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}

	public String getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	public String getStartDateStr() {
		return startDateStr;
	}

	public void setStartDateStr(String startDateStr) {
		this.startDateStr = startDateStr;
	}

	public String getEndDateStr() {
		return endDateStr;
	}

	public void setEndDateStr(String endDateStr) {
		this.endDateStr = endDateStr;
	}

	

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getModeOfPayment() {
		return modeOfPayment;
	}

	public void setModeOfPayment(String modeOfPayment) {
		this.modeOfPayment = modeOfPayment;
	}

	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	public String getCouponNumber() {
		return couponNumber;
	}

	public void setCouponNumber(String couponNumber) {
		this.couponNumber = couponNumber;
	}

	public BigDecimal getPaidAmount() {
		return paidAmount;
	}

	public void setPaidAmount(BigDecimal paidAmount) {
		this.paidAmount = paidAmount;
	}

	/*public Date getDateAndTime() {
		return dateAndTime;
	}

	public void setDateAndTime(Date dateAndTime) {
		this.dateAndTime = dateAndTime;
	}
*/
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

	public BigDecimal getReceivedAmount() {
		return receivedAmount;
	}

	public void setReceivedAmount(BigDecimal receivedAmount) {
		this.receivedAmount = receivedAmount;
	}

	public BigDecimal getChangeReturn() {
		return changeReturn;
	}

	public void setChangeReturn(BigDecimal changeReturn) {
		this.changeReturn = changeReturn;
	}

	public String getCardInfo() {
		return cardInfo;
	}

	public void setCardInfo(String cardInfo) {
		this.cardInfo = cardInfo;
	}

	public Integer getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(Integer transactionId) {
		this.transactionId = transactionId;
	}

}
