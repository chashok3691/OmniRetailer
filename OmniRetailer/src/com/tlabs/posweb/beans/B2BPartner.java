package com.tlabs.posweb.beans;

import java.util.List;

//@Table(name = "b2b_partners")
/**
 * @author Manojj
 *
 */
/**
 * @author Mandeep
 *
 */
public class B2BPartner {
	
		private String partnerId;	
		private String partnerName;
		private String businessType;
		private String bankName;
	    private String bankAccountNumber;
		private String plotNo;
		private String street;
		private String state;
		private String gstNumber;
		private String email;
		private String phone;
		private String city;
	    private String address;
	    private String userName;
	    private String role;
	    private String pan;
		private RequestHeader requestHeader;
		private ResponseHeader responseHeader;
		private String createdDateStr;
		private String updatedDateStr;
		private int totalRecords;
		private List<B2BPartner> b2bPartners;
		private String maxRecords;
		private String startIndex;
		private String searchCriteria;
		private String operation;
		private List<String> partnerIds;
		private String registerUrl;
		private String b2bPdfUrl;
		private String qrCodePdfUrl;
		private String personName;
		private String ifscCode;
		
		
		
		public String getIfscCode() {
			return ifscCode;
		}

		public void setIfscCode(String ifscCode) {
			this.ifscCode = ifscCode;
		}

		public String getPersonName() {
			return personName;
		}

		public void setPersonName(String personName) {
			this.personName = personName;
		}

		public String getQrCodePdfUrl() {
			return qrCodePdfUrl;
		}

		public void setQrCodePdfUrl(String qrCodePdfUrl) {
			this.qrCodePdfUrl = qrCodePdfUrl;
		}

		public String getB2bPdfUrl() {
			return b2bPdfUrl;
		}

		public void setB2bPdfUrl(String b2bPdfUrl) {
			this.b2bPdfUrl = b2bPdfUrl;
		}

		public String getRegisterUrl() {
			return registerUrl;
		}

		public void setRegisterUrl(String registerUrl) {
			this.registerUrl = registerUrl;
		}

		public List<String> getPartnerIds() {
			return partnerIds;
		}

		public void setPartnerIds(List<String> partnerIds) {
			this.partnerIds = partnerIds;
		}

		public String getOperation() {
			return operation;
		}

		public void setOperation(String operation) {
			this.operation = operation;
		}

		public String getMaxRecords() {
			return maxRecords;
		}

		public void setMaxRecords(String maxRecords) {
			this.maxRecords = maxRecords;
		}

		public String getStartIndex() {
			return startIndex;
		}

		public void setStartIndex(String startIndex) {
			this.startIndex = startIndex;
		}

		public String getSearchCriteria() {
			return searchCriteria;
		}

		public void setSearchCriteria(String searchCriteria) {
			this.searchCriteria = searchCriteria;
		}

		public String getPan() {
			return pan;
		}

		public void setPan(String pan) {
			this.pan = pan;
		}
		public String getPartnerId() {
			return partnerId;
		}

		public void setPartnerId(String partnerId) {
			this.partnerId = partnerId;
		}

		public String getBusinessType() {
			return businessType;
		}

		public void setBusinessType(String businessType) {
			this.businessType = businessType;
		}

		public String getBankName() {
			return bankName;
		}

		public void setBankName(String bankName) {
			this.bankName = bankName;
		}

		public String getBankAccountNumber() {
			return bankAccountNumber;
		}

		public void setBankAccountNumber(String bankAccountNumber) {
			this.bankAccountNumber = bankAccountNumber;
		}

		public String getPlotNo() {
			return plotNo;
		}

		public void setPlotNo(String plotNo) {
			this.plotNo = plotNo;
		}

		public String getStreet() {
			return street;
		}

		public void setStreet(String street) {
			this.street = street;
		}

		public String getState() {
			return state;
		}

		public void setState(String state) {
			this.state = state;
		}

		public String getGstNumber() {
			return gstNumber;
		}

		public void setGstNumber(String gstNumber) {
			this.gstNumber = gstNumber;
		}

		public List<B2BPartner> getB2bPartners() {
			return b2bPartners;
		}

		public void setB2bPartners(List<B2BPartner> b2bPartners) {
			this.b2bPartners = b2bPartners;
		}

		public String getPartnerName() {
			return partnerName;
		}

		public void setPartnerName(String partnerName) {
			this.partnerName = partnerName;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getPhone() {
			return phone;
		}

		public void setPhone(String phone) {
			this.phone = phone;
		}

		public String getCity() {
			return city;
		}

		public void setCity(String city) {
			this.city = city;
		}

		
		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		public String getUserName() {
			return userName;
		}

		public void setUserName(String userName) {
			this.userName = userName;
		}

		public String getRole() {
			return role;
		}

		public void setRole(String role) {
			this.role = role;
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

		public String getCreatedDateStr() {
			return createdDateStr;
		}

		public void setCreatedDateStr(String createdDateStr) {
			this.createdDateStr = createdDateStr;
		}

		public String getUpdatedDateStr() {
			return updatedDateStr;
		}

		public void setUpdatedDateStr(String updatedDateStr) {
			this.updatedDateStr = updatedDateStr;
		}
		
		public int getTotalRecords() {
			return totalRecords;
		}

		public void setTotalRecords(int totalRecords) {
			this.totalRecords = totalRecords;
		}

}


