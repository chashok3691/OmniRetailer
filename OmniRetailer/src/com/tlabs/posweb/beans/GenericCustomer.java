package com.tlabs.posweb.beans;

public class GenericCustomer {
 
	private String name;
	private String businessDescription;
	private String corporateAddress;
	private String contactPerson;
	private String primaryContactNumber;
	private String alternateContactNum;
	private String siteURL;
	private String mailID;
	private String logoImageID;
	private String logoName;
	private String billingCycle;
	private String saasPlan;
	private String expiresOn;
	private String lastRenewedDate;
	private String billingAddress;
	private String proofDocumentID;
	private String proofDocName;
	private RequestHeader requestHeader;
	private ResponseHeader responseHeader;
    private byte[] logoImage;
    private byte[] proofDoc;
    private String corporateLocation;
    private String corporateCity;
    private String billingLocation;
    private String billingCity;
    private String monthlyLicensePrice;
    private String imageStr;
    private String defaultLocation;
    private String vat;
    private String serviceTax;
    private String corporateId;
	public String getDefaultLocation() {
		return defaultLocation;
	}
	public void setDefaultLocation(String defaultLocation) {
		this.defaultLocation = defaultLocation;
	}
	public String getImageStr() {
		return imageStr;
	}
	public void setImageStr(String imageStr) {
		this.imageStr = imageStr;
	}
	public String getMonthlyLicensePrice() {
		return monthlyLicensePrice;
	}
	public void setMonthlyLicensePrice(String monthlyLicensePrice) {
		this.monthlyLicensePrice = monthlyLicensePrice;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBusinessDescription() {
		return businessDescription;
	}
	public void setBusinessDescription(String businessDescription) {
		this.businessDescription = businessDescription;
	}
 
	public String getContactPerson() {
		return contactPerson;
	}
	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
	}
	public String getPrimaryContactNumber() {
		return primaryContactNumber;
	}
	public void setPrimaryContactNumber(String primaryContactNumber) {
		this.primaryContactNumber = primaryContactNumber;
	}
	public String getAlternateContactNum() {
		return alternateContactNum;
	}
	public void setAlternateContactNum(String alternateContactNum) {
		this.alternateContactNum = alternateContactNum;
	}
	public String getSiteURL() {
		return siteURL;
	}
	public void setSiteURL(String siteURL) {
		this.siteURL = siteURL;
	}
	public String getMailID() {
		return mailID;
	}
	public void setMailID(String mailID) {
		this.mailID = mailID;
	}
 
	public String getBillingCycle() {
		return billingCycle;
	}
	public void setBillingCycle(String billingCycle) {
		this.billingCycle = billingCycle;
	}
	public String getSaasPlan() {
		return saasPlan;
	}
	public void setSaasPlan(String saasPlan) {
		this.saasPlan = saasPlan;
	}
	public String getExpiresOn() {
		return expiresOn;
	}
	public void setExpiresOn(String expiresOn) {
		this.expiresOn = expiresOn;
	}
	public String getLastRenewedDate() {
		return lastRenewedDate;
	}
	public void setLastRenewedDate(String lastRenewedDate) {
		this.lastRenewedDate = lastRenewedDate;
	}
	public String getBillingAddress() {
		return billingAddress;
	}
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	public void setBillingAddress(String billingAddress) {
		this.billingAddress = billingAddress;
	}
 
	public byte[] getLogoImage() {
		return logoImage;
	}
	public void setLogoImage(byte[] logoImage) {
		this.logoImage = logoImage;
	}
	public byte[] getProofDoc() {
		return proofDoc;
	}
	public void setProofDoc(byte[] proofDoc) {
		this.proofDoc = proofDoc;
	}
	public String getLogoImageID() {
		return logoImageID;
	}
	public String getCorporateAddress() {
		return corporateAddress;
	}
	public void setCorporateAddress(String corporateAddress) {
		this.corporateAddress = corporateAddress;
	}
	public String getCorporateLocation() {
		return corporateLocation;
	}
	public void setCorporateLocation(String corporateLocation) {
		this.corporateLocation = corporateLocation;
	}
	public String getCorporateCity() {
		return corporateCity;
	}
	public void setCorporateCity(String corporateCity) {
		this.corporateCity = corporateCity;
	}
	public String getBillingLocation() {
		return billingLocation;
	}
	public void setBillingLocation(String billingLocation) {
		this.billingLocation = billingLocation;
	}
	public String getBillingCity() {
		return billingCity;
	}
	public void setBillingCity(String billingCity) {
		this.billingCity = billingCity;
	}
	public void setLogoImageID(String logoImageID) {
		this.logoImageID = logoImageID;
	}
	public String getLogoName() {
		return logoName;
	}
	public void setLogoName(String logoName) {
		this.logoName = logoName;
	}
	public String getProofDocumentID() {
		return proofDocumentID;
	}
	public void setProofDocumentID(String proofDocumentID) {
		this.proofDocumentID = proofDocumentID;
	}
	public String getProofDocName() {
		return proofDocName;
	}
	public void setProofDocName(String proofDocName) {
		this.proofDocName = proofDocName;
	}
	public String getVat() {
		return vat;
	}
	public void setVat(String vat) {
		this.vat = vat;
	}
	public String getServiceTax() {
		return serviceTax;
	}
	public void setServiceTax(String serviceTax) {
		this.serviceTax = serviceTax;
	}
	public String getCorporateId() {
		return corporateId;
	}
	public void setCorporateId(String corporateId) {
		this.corporateId = corporateId;
	}
 
}
