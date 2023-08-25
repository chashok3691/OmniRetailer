package com.tlabs.posweb.beans;

import java.util.List;

public class CustomerDetails
{
    private String lastName;

    private String phone;

    private String shopping_count;

    private String recentPurchaseAmount;
    private String filePath;
    private String status;

    private String street;

    private String cust_feedback;

    private String country;

    private String city;

    private String totalPurchasesAmount;

    private String category;

    private String pin_no;

    private String notifications;

    private String email;

    private String age;

    private String name;

    private String gender;

    private String locality;

    private String shopping_amount;

    private String rating;
    
    private String response;
    private String primaryContactNumber;
    
    private String date_and_time;
    
    private String firstVisitDate;
    private String otpCode;
    private String b2breferralId;
    
    
    
    public String getB2breferralId() {
		return b2breferralId;
	}

	public void setB2breferralId(String b2breferralId) {
		this.b2breferralId = b2breferralId;
	}

	public String getOtpCode() {
		return otpCode;
	}

	public void setOtpCode(String otpCode) {
		this.otpCode = otpCode;
	}

	public String getFirstVisitDate() {
		return firstVisitDate;
	}

	public void setFirstVisitDate(String firstVisitDate) {
		this.firstVisitDate = firstVisitDate;
	}

	
    
    
	private String location;
    private String registered_on;
    
    
    
    public String getRegistered_on() {
		return registered_on;
	}

	public void setRegistered_on(String registered_on) {
		this.registered_on = registered_on;
	}

	public String getDate_and_time() {
		return date_and_time;
	}

	public void setDate_and_time(String date_and_time) {
		this.date_and_time = date_and_time;
	}

	private List<CustomerDetails> customers;
    private String totalRecords;
    private int slNo;
    
    private String storeLocation;
    private String zoneID;
    
    
    
    public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getStoreLocation() {
		return storeLocation;
	}

	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}

	public String getZoneID() {
		return zoneID;
	}

	public void setZoneID(String zoneID) {
		this.zoneID = zoneID;
	}

	public String getPrimaryContactNumber() {
		return primaryContactNumber;
	}

	public void setPrimaryContactNumber(String primaryContactNumber) {
		this.primaryContactNumber = primaryContactNumber;
	}

	public int getSlNo() {
		return slNo;
	}

	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}

	public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

	public String getResponse() {
		return response;
	}

	public void setResponse(String response) {
		this.response = response;
	}

	public List<CustomerDetails> getCustomers() {
		return customers;
	}

	public void setCustomers(List<CustomerDetails> customers) {
		this.customers = customers;
	}

	public String getLastName ()
    {
        return lastName;
    }

    public void setLastName (String lastName)
    {
        this.lastName = lastName;
    }

    public String getPhone ()
    {
        return phone;
    }

    public void setPhone (String phone)
    {
        this.phone = phone;
    }

    public String getShopping_count ()
    {
        return shopping_count;
    }

    public void setShopping_count (String shopping_count)
    {
        this.shopping_count = shopping_count;
    }

    public String getRecentPurchaseAmount ()
    {
        return recentPurchaseAmount;
    }

    public void setRecentPurchaseAmount (String recentPurchaseAmount)
    {
        this.recentPurchaseAmount = recentPurchaseAmount;
    }

    public String getStatus ()
    {
        return status;
    }

    public void setStatus (String status)
    {
        this.status = status;
    }

    public String getStreet ()
    {
        return street;
    }

    public void setStreet (String street)
    {
        this.street = street;
    }

    public String getCust_feedback ()
    {
        return cust_feedback;
    }

    public void setCust_feedback (String cust_feedback)
    {
        this.cust_feedback = cust_feedback;
    }

    public String getCountry ()
    {
        return country;
    }

    public void setCountry (String country)
    {
        this.country = country;
    }

    public String getCity ()
    {
        return city;
    }

    public void setCity (String city)
    {
        this.city = city;
    }

    public String getTotalPurchasesAmount ()
    {
        return totalPurchasesAmount;
    }

    public void setTotalPurchasesAmount (String totalPurchasesAmount)
    {
        this.totalPurchasesAmount = totalPurchasesAmount;
    }

    public String getCategory ()
    {
        return category;
    }

    public void setCategory (String category)
    {
        this.category = category;
    }

    public String getPin_no ()
    {
        return pin_no;
    }

    public void setPin_no (String pin_no)
    {
        this.pin_no = pin_no;
    }

    public String getNotifications ()
    {
        return notifications;
    }

    public void setNotifications (String notifications)
    {
        this.notifications = notifications;
    }

    public String getEmail ()
    {
        return email;
    }

    public void setEmail (String email)
    {
        this.email = email;
    }

    public String getAge ()
    {
        return age;
    }

    public void setAge (String age)
    {
        this.age = age;
    }

    public String getName ()
    {
        return name;
    }

    public void setName (String name)
    {
        this.name = name;
    }

    public String getGender ()
    {
        return gender;
    }

    public void setGender (String gender)
    {
        this.gender = gender;
    }

    public String getLocality ()
    {
        return locality;
    }

    public void setLocality (String locality)
    {
        this.locality = locality;
    }

    public String getShopping_amount ()
    {
        return shopping_amount;
    }

    public void setShopping_amount (String shopping_amount)
    {
        this.shopping_amount = shopping_amount;
    }

    public String getRating ()
    {
        return rating;
    }

    public void setRating (String rating)
    {
        this.rating = rating;
    }

    @Override
    public String toString()
    {
        return "ClassPojo [lastName = "+lastName+", phone = "+phone+", shopping_count = "+shopping_count+", recentPurchaseAmount = "+recentPurchaseAmount+", status = "+status+", street = "+street+", cust_feedback = "+cust_feedback+", country = "+country+", city = "+city+", totalPurchasesAmount = "+totalPurchasesAmount+", category = "+category+", pin_no = "+pin_no+", notifications = "+notifications+", email = "+email+", age = "+age+", name = "+name+", gender = "+gender+", locality = "+locality+", shopping_amount = "+shopping_amount+", rating = "+rating+"]";
    }

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
}