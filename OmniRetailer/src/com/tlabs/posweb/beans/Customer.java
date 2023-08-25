/**
 * 
 */
/**
 * @author Sambaiah.Y
 * @date 06-08-2015
 * 
 * Customers
 */

package com.tlabs.posweb.beans;
import java.util.Date;
import java.util.List;


/**
 * @author Sambaiah.Y
 *
 */
public class Customer {
	private String phone;
	private String name;
	private String lastName;
	private String email;
	private boolean status;
	private String street;
	private String locality;
	private String city;
	private String pin_no;
	private String gender;
	private int age;
	private boolean notifications;
	private float rating;
	private String cust_feedback;
	private int shopping_count;
	private float shopping_amount;
	private String country;
	private String category;
	private RequestHeader requestHeader;
	private ResponseHeader responseHeader;
	private String mobileNumber;
	
	/* Added for falcons nest integration */
	private String customerId;
	private String customerType;
	private String nationality;
	private String designation;
	private String alternatePhoneNum;
	private Date dob;
	
	private String customerGstin;
	private String otpCode;
	private String cardCode;
	
	public String getCardCode() {
		return cardCode;
	}

	public void setCardCode(String cardCode) {
		this.cardCode = cardCode;
	}
	// changed data type from blob to byte[] by kesav 
	
	public String getCustomerGstin() {
		return customerGstin;
	}

	public void setCustomerGstin(String customerGstin) {
		this.customerGstin = customerGstin;
	}
	private byte[] photo;
	private byte[] addressProof;
	private byte[] customerIdProof;
	private String landMark;
	private String companyName;
	private Date dateTime;
	private String state;
	private String houseNo;
	private String relationShipStatus;
	private String familySize;
	private String hobbies;
	private String qualification;
	 private boolean updateRequired;
	 private String  uploadedfilePath;
	 
	 
	 
	 
	 
	 
	
	public String getOtpCode() {
		return otpCode;
	}

	public void setOtpCode(String otpCode) {
		this.otpCode = otpCode;
	}

	public String getUploadedfilePath() {
		return uploadedfilePath;
	}

	public void setUploadedfilePath(String uploadedfilePath) {
		this.uploadedfilePath = uploadedfilePath;
	}

	public boolean isUpdateRequired() {
		return updateRequired;
	}

	public void setUpdateRequired(boolean updateRequired) {
		this.updateRequired = updateRequired;
	}
	private float creditBillLimit;
	
	
	
	public float getCreditBillLimit() {
		return creditBillLimit;
	}

	public void setCreditBillLimit(float creditBillLimit) {
		this.creditBillLimit = creditBillLimit;
	}
	// following fields added by kesav
	private String dobStr;
	private String ratingStr;
	private String shoppingAmountStr;
	private String customerIdProofStr;
	private String addressProofStr;
	private String photoStr;
	private List<CustomerComplaints> complaintsList;
	private String familySizeStr;
	private String monthlyIncome;
	private String title;
    private String siteUrl;
    private String altPhNo;  
    private String response;
    private String totalRecords;
    private String primaryContactNumber;
    private String password;
    private List<CustomerAddress> addressList;
    private String phoneNumber;
    private String marriageDateStr;
    private Float availableCreditLimit;
    private boolean allowCreditBill;
    
     
	/*private Customer customerObj;
	
	public Customer getCustomerObj() {
		return customerObj;
	}

	public void setCustomerObj(Customer customerObj) {
		this.customerObj = customerObj;
	}*/
    

	public boolean isAllowCreditBill() {
		return allowCreditBill;
	}

	public void setAllowCreditBill(boolean allowCreditBill) {
		this.allowCreditBill = allowCreditBill;
	}

	public Float getAvailableCreditLimit() {
		return availableCreditLimit;
	}

	public void setAvailableCreditLimit(Float availableCreditLimit) {
		this.availableCreditLimit = availableCreditLimit;
	}

	public String getMarriageDateStr() {
		return marriageDateStr;
	}

	public void setMarriageDateStr(String marriageDateStr) {
		this.marriageDateStr = marriageDateStr;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public List<CustomerAddress> getAddressList() {
		return addressList;
	}

	public void setAddressList(List<CustomerAddress> addressList) {
		this.addressList = addressList;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPrimaryContactNumber() {
		return primaryContactNumber;
	}

	public void setPrimaryContactNumber(String primaryContactNumber) {
		this.primaryContactNumber = primaryContactNumber;
	}

	public String getResponse() {
		return response;
	}

	public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

	public void setResponse(String response) {
		this.response = response;
	}

	public String getMonthlyIncome() {
		return monthlyIncome;
	}

	public String getAltPhNo() {
		return altPhNo;
	}

	public void setAltPhNo(String altPhNo) {
		this.altPhNo = altPhNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSiteUrl() {
		return siteUrl;
	}

	public void setSiteUrl(String siteUrl) {
		this.siteUrl = siteUrl;
	}

	public void setMonthlyIncome(String monthlyIncome) {
		this.monthlyIncome = monthlyIncome;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getCustomerType() {
		return customerType;
	}

	public void setCustomerType(String customerType) {
		this.customerType = customerType;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getAlternatePhoneNum() {
		return alternatePhoneNum;
	}

	public void setAlternatePhoneNum(String alternatePhoneNum) {
		this.alternatePhoneNum = alternatePhoneNum;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getLandMark() {
		return landMark;
	}

	public void setLandMark(String landMark) {
		this.landMark = landMark;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public Date getDateTime() {
		return dateTime;
	}

	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getHouseNo() {
		return houseNo;
	}

	public void setHouseNo(String houseNo) {
		this.houseNo = houseNo;
	}

	public String getRelationShipStatus() {
		return relationShipStatus;
	}

	public void setRelationShipStatus(String relationShipStatus) {
		this.relationShipStatus = relationShipStatus;
	}

	public String getFamilySize() {
		return familySize;
	}

	public void setFamilySize(String familySize) {
		this.familySize = familySize;
	}

	public String getHobbies() {
		return hobbies;
	}

	public String getFamilySizeStr() {
		return familySizeStr;
	}

	public void setFamilySizeStr(String familySizeStr) {
		this.familySizeStr = familySizeStr;
	}

	public void setHobbies(String hobbies) {
		this.hobbies = hobbies;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public String getCustomerIdProofStr() {
		return customerIdProofStr;
	}

	public void setCustomerIdProofStr(String customerIdProofStr) {
		this.customerIdProofStr = customerIdProofStr;
	}

	public String getAddressProofStr() {
		return addressProofStr;
	}

	public void setAddressProofStr(String addressProofStr) {
		this.addressProofStr = addressProofStr;
	}

	public String getPhotoStr() {
		return photoStr;
	}

	public void setPhotoStr(String photoStr) {
		this.photoStr = photoStr;
	}

	public List<CustomerComplaints> getComplaintsList() {
		return complaintsList;
	}

	public void setComplaintsList(List<CustomerComplaints> complaintsList) {
		this.complaintsList = complaintsList;
	}

	public String getShoppingAmountStr() {
		return shoppingAmountStr;
	}

	public void setShoppingAmountStr(String shoppingAmountStr) {
		this.shoppingAmountStr = shoppingAmountStr;
	}

	public String getDobStr() {
		return dobStr;
	}

	public String getRatingStr() {
		return ratingStr;
	}

	public void setRatingStr(String ratingStr) {
		this.ratingStr = ratingStr;
	}

	public void setDobStr(String dobStr) {
		this.dobStr = dobStr;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public byte[] getPhoto() {
		return photo;
	}

	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}

	public byte[] getAddressProof() {
		return addressProof;
	}

	public void setAddressProof(byte[] addressProof) {
		this.addressProof = addressProof;
	}

	public byte[] getCustomerIdProof() {
		return customerIdProof;
	}

	public void setCustomerIdProof(byte[] customerIdProof) {
		this.customerIdProof = customerIdProof;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getLocality() {
		return locality;
	}

	public void setLocality(String locality) {
		this.locality = locality;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPin_no() {
		return pin_no;
	}

	public void setPin_no(String pin_no) {
		this.pin_no = pin_no;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public boolean isNotifications() {
		return notifications;
	}

	public void setNotifications(boolean notifications) {
		this.notifications = notifications;
	}

	public float getRating() {
		return rating;
	}

	public void setRating(float rating) {
		this.rating = rating;
	}

	public String getCust_feedback() {
		return cust_feedback;
	}

	public void setCust_feedback(String cust_feedback) {
		this.cust_feedback = cust_feedback;
	}

	public int getShopping_count() {
		return shopping_count;
	}

	public void setShopping_count(int shopping_count) {
		this.shopping_count = shopping_count;
	}

	public float getShopping_amount() {
		return shopping_amount;
	}

	public void setShopping_amount(float shopping_amount) {
		this.shopping_amount = shopping_amount;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}
}

/*
package com.tlabs.omniretailerservices.models;

import com.tlabs.omniretailerservices.beans.RequestHeader;

*//**
 * @author brinda
 *
 *//*
public class Customer {
	private	RequestHeader requestHeader;
	private String name;
	private String email;
	private String phone=null;
	private boolean status;
	private String street;
	private String locality;
	private String city;
	private String pin_no;
	
	
	public void setRequestHeader(RequestHeader requestHeader){
		this.requestHeader=requestHeader;
	}
	public RequestHeader getRequestHeader(){
		return requestHeader;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getLocality() {
		return locality;
	}
	public void setLocality(String locality) {
		this.locality = locality;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getPin_no() {
		return pin_no;
	}
	public void setPin_no(String pin_no) {
		this.pin_no = pin_no;
	}
	private String[] phoneIds;
	//private LoyaltyCustomer LoyaltyCustomer;
	


	
	*//**
	 * @return the phoneIds
	 *//*
	public String[] getPhoneIds() {
		return phoneIds;
	}
	*//**
	 * @param phoneIds the phoneIds to set
	 *//*
	public void setPhoneIds(String[] phoneIds) {
		this.phoneIds = phoneIds;
	}
	*//**
	 * @return the status
	 *//*
	public boolean isStatus() {
		return status;
	}
	*//**
	 * @param status the status to set
	 *//*
	public void setStatus(boolean status) {
		this.status = status;
	}
	*//**
	 * @return the name
	 *//*
	public String getName() {
		return name;
	}
	*//**
	 * @param name the name to set
	 *//*
	public void setName(String name) {
		this.name = name;
	}
	*//**
	 * @return the email
	 *//*
	public String getEmail() {
		return email;
	}
	*//**
	 * @param email the email to set
	 *//*
	public void setEmail(String email) {
		this.email = email;
	}
	*//**
	 * @return the phone
	 *//*
	public String getPhone() {
		return phone;
	}
	*//**
	 * @param phone the phone to set
	 *//*
	public void setPhone(String phone) {
		this.phone = phone;
	}
	*//**
	 * @return the loyaltyCustomer
	 *//*
	public LoyaltyCustomer getLoyaltyCustomer() {
		return LoyaltyCustomer;
	}
	*//**
	 * @param loyaltyCustomer the loyaltyCustomer to set
	 *//*
	public void setLoyaltyCustomer(LoyaltyCustomer loyaltyCustomer) {
		LoyaltyCustomer = loyaltyCustomer;
	}
	
}
*/