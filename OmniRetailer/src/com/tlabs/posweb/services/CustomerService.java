package com.tlabs.posweb.services;

import java.rmi.ConnectException;
import java.rmi.RemoteException;
import java.rmi.UnknownHostException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.NoSuchElementException;

import com.tlabs.posweb.init.AppProperties;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.technolabssoftware.www.CustomerProxy;
//import com.technolabssoftware.www.UtilityMasterServiceProxy;
import com.tlabs.posweb.beans.Billing;
import com.tlabs.posweb.beans.BusinessEnquiry;
import com.tlabs.posweb.beans.BusinessEnquiryResponse;
import com.tlabs.posweb.beans.Customer;
import com.tlabs.posweb.beans.CustomerAddress;
import com.tlabs.posweb.beans.CustomerDetails;
import com.tlabs.posweb.beans.CustomerGroupMaster;
import com.tlabs.posweb.beans.CustomerLedger;
import com.tlabs.posweb.beans.CustomerNotification;
import com.tlabs.posweb.beans.CustomerPurchases;
import com.tlabs.posweb.beans.CustomerReferralMaster;
//import com.tlabs.posweb.beans.CustomerSignUp;
import com.tlabs.posweb.beans.CustomerSignUpMaster;
import com.tlabs.posweb.beans.CustomerWalletMaster;
import com.tlabs.posweb.beans.CustomerWallets;
import com.tlabs.posweb.beans.FilterInput;
import com.tlabs.posweb.beans.RequestBean;
//import com.tlabs.posweb.beans.ProductCategoryBean;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
import com.tlabs.posweb.util.RestfulServiceConnection;
//import com.tlabs.posweb.util.Utilities;

public class CustomerService {
	@Autowired
	private Gson gson;
	@Autowired
	SessionScope sessionScope;
	//private static Logger log = Logger.getLogger(CustomerService.class);
	
	public String createCustomer(Customer customerObj){
		String resultStr = null;
		try {
			//CustomerProxy customerProxtObj = new CustomerProxy();
		   customerObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			if(customerObj.getAddressList() != null)
				for(CustomerAddress customerAddressObj : customerObj.getAddressList())
					if(customerAddressObj.isEmpty())
						customerObj.getAddressList().remove(customerAddressObj);
			
			
/*			// log.info("Request String:::::::"+gson.toJson(customerObj));
//			//////////////System.out.println("Request String:::::::"+gson.toJson(customerObj));
			resultStr = customerProxtObj.createCustomer(gson.toJson(customerObj));
			// log.info("Response String:::::::"+resultStr);
//			//////////////System.out.println("Response String:::::::"+resultStr);
*/			
			
			
			////////System.out.println("Request String:::::::"+gson.toJson(customerObj));
			
			/**	added by - vasudev   purpose - using rest service call instead of soap call*/
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("create_customer"), gson.toJson(customerObj),"POST");

			////////System.out.println(resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("CUSTOMER_CREATE_SUCCESS").trim();
			}
			else{
				resultStr = Response.getResponseMessage(resultStr);
			}
		}catch(ConnectException ce) {
			ce.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("CONNECTION_TIMEOUT").trim();
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
		} catch(RemoteException rme){
			rme.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		}
		return resultStr;
	}
	
	
	
	
	
	public String createCustomerReferral(CustomerReferralMaster customerReferralMaster,String customerId,String emailId){
		String result = null;
		try {
			
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			customerReferralMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
//			customerReferralMaster.setStartIndex("-1");
			
			List<String> zones = new ArrayList<String>(Arrays.asList(customerReferralMaster.getStates().split(",")));
			
			List<String> zonelocations = new ArrayList<String>(Arrays.asList(customerReferralMaster.getLocations().split(",")));
			customerReferralMaster.setZoneLocations(zonelocations);
			customerReferralMaster.setZones(zones);
			customerReferralMaster.setStates("");
			customerReferralMaster.setLocations("");
			
			////////System.out.println("create_Customer_Referral request::::::::::::"+gson.toJson(customerReferralMaster));
//			result = utitlitymaster.createProductCategory(gson.toJson(customerReferralMaster));
			result = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("create_Customer_Referral"), gson.toJson(customerReferralMaster),"POST");
			
			////////System.out.println("Response String:::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("REFERRAL_CREATED_SUCCESS").trim();
			}
			else{
				//result = "Couldn't create, please try after some time";
				result = Response.getResponseMessage(result);
			}
		}catch(ConnectException ce) {
			ce.printStackTrace();
			result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			result = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
		} catch(RemoteException rme){
			rme.printStackTrace();
			result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	


	//added by koti bommineni
		
		public String createWallet(CustomerLedger customerWalletMaster,String customerId,String emailId){
			String result = null;
			try {
				
				RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
				customerWalletMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				
				// log.info("Request String::::::::::::"+gson.toJson(customerWalletMaster));
				////////////System.out.println("Request String::::::::::::"+gson.toJson(customerWalletMaster));
				RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();

				result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_wallet"), gson.toJson(customerWalletMaster));

				// log.info("Response String:::::::::::"+result);
			///    System.out.println("Response String:::::::::::"+result);
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					result = AppProperties.getAppMessageByProperty("WALLET_CREATED_SUCCESS").trim();
				}
				else{
					//result = "Couldn't create, please try after some time";
					result = Response.getResponseMessage(result);
				}
			}catch(ConnectException ce) {
				ce.printStackTrace();
				result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch (UnknownHostException uhe) {
				uhe.printStackTrace();
				result = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
			} catch(RemoteException rme){
				rme.printStackTrace();
				result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return result;
		}
		
	
	

	
	public List<CustomerSignUpMaster> getCustomersignup(CustomerSignUpMaster filterInputObj){
		List<CustomerSignUpMaster> customersList = new ArrayList<CustomerSignUpMaster>();
		try {
			filterInputObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String:::::::"+gson.toJson(filterInputObj));
//			//////////////System.out.println("Request String:::::::"+gson.toJson(filterInputObj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			String resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Customer_SignUp"), gson.toJson(filterInputObj),"GET");
			// log.info("Response String:::::::"+resultStr);
//			//////////////System.out.println("Response String:::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				CustomerSignUpMaster	customerReferralsList = gson.fromJson(resultStr, CustomerSignUpMaster.class); 
				if(customerReferralsList.getCustomerSignUpList()!=null){
				customersList=customerReferralsList.getCustomerSignUpList();
			customersList.get(0).setTotalRecords(customerReferralsList.getTotalRecords());
			if(customerReferralsList.getFilePath()!=null)
				customersList.get(0).setFilePath(customerReferralsList.getFilePath());
			
				}
				}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			
		} catch(Exception e){
			e.printStackTrace();
			
		}
		return customersList;
	}
	
	
	
	
	public String createCustomerSignup(CustomerSignUpMaster customerReferralMaster,String customerId,String emailId){
		String result = null;
		try {
			
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			customerReferralMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
//			customerReferralMaster.setStartIndex("-1");
			// log.info("Request String::::::::::::"+gson.toJson(customerReferralMaster));
			//////System.out.println("Request String::::::::::::"+gson.toJson(customerReferralMaster));
//			result = utitlitymaster.createProductCategory(gson.toJson(customerReferralMaster));
			result = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("create_Customer_SignUp"), gson.toJson(customerReferralMaster),"POST");
			// log.info("Response String:::::::::::"+result);
//			//////////////System.out.println("Response String:::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("SIGNUP_CREATED_SUCCESS").trim();
			}
			else{
				//result = "Couldn't create, please try after some time";
				result = Response.getResponseMessage(result);
			}
		}catch(ConnectException ce) {
			ce.printStackTrace();
			result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			result = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
		} catch(RemoteException rme){
			rme.printStackTrace();
			result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	public String updateCustomerSignUp(CustomerSignUpMaster customerReferralMaster,String customerId,String emailId){
		String result = null;
		try {
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			customerReferralMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
//			customerReferralMaster.setStartIndex("-1");
			// log.info("Request String::::::::::::"+gson.toJson(customerReferralMaster));
        //////System.out.println("Request String::::::::::::"+gson.toJson(customerReferralMaster));
//			result = utitlitymaster.createProductCategory(gson.toJson(customerReferralMaster));
			result = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("update_Customer_SignUp"), gson.toJson(customerReferralMaster),"POST");
			// log.info("Response String:::::::::::"+result);
//			//////////////System.out.println("Response String:::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("SIGNUP_UPDATE_SUCCESS").trim();
			}
			else{
				//result = "Couldn't create, please try after some time";
				result = Response.getResponseMessage(result);
			}
		}catch(ConnectException ce) {
			ce.printStackTrace();
			result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			result = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
		} catch(RemoteException rme){
			rme.printStackTrace();
			result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	
	public String updateCustomerReferral(CustomerReferralMaster customerReferralMaster,String customerId,String emailId){
		String result = null;
		try {
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			customerReferralMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
//			customerReferralMaster.setStartIndex("-1");
			// log.info("Request String::::::::::::"+gson.toJson(customerReferralMaster));
            //////System.out.println("Request String::::::::::::"+gson.toJson(customerReferralMaster));
//			result = utitlitymaster.createProductCategory(gson.toJson(customerReferralMaster));
			result = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("update_Customer_Referral"), gson.toJson(customerReferralMaster),"POST");
			// log.info("Response String:::::::::::"+result);
//			//////////////System.out.println("Response String:::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("REFERRAL_UPDATE_SUCCESS").trim();
			}
			else{
				//result = "Couldn't create, please try after some time";
				result = Response.getResponseMessage(result);
			}
		}catch(ConnectException ce) {
			ce.printStackTrace();
			result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			result = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
		} catch(RemoteException rme){
			rme.printStackTrace();
			result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	
	/**
	 * @author Mythri.S	
	 * created On: 1-oct-2015
	 * 
	 * This method is used to call the getCustomerList method of web service and return the customers List
	 * 
	 */
	public List<CustomerDetails> getCustomerList(FilterInput filterInputObj,String customerId,String emailId){
		String resultStr = null;
		
		List<CustomerDetails> customerDetailsList = new ArrayList<CustomerDetails>();
		try {
//			CustomerProxy customerProxyObj = new CustomerProxy();
			filterInputObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			filterInputObj.setStoreLocation(filterInputObj.getStoreLocation());
			filterInputObj.setZoneID(filterInputObj.getZoneID());
			if(filterInputObj.getAge() != null && !filterInputObj.getAge().equals("")){
				String[] ageArray = filterInputObj.getAge().split("-");
				filterInputObj.setFromAge(Integer.parseInt(ageArray[0]));
				filterInputObj.setToAge(Integer.parseInt(ageArray[1]));
				filterInputObj.setAge(null);
			}
			if(filterInputObj.getStartDateStr() != null && filterInputObj.getStartDateStr().equals(""))
				filterInputObj.setStartDateStr(null);
			if(filterInputObj.getEndDateStr() != null && filterInputObj.getEndDateStr().equals(""))
				filterInputObj.setEndDateStr(null);
			if(filterInputObj.getCountry() != null && filterInputObj.getCountry().equals(""))
				filterInputObj.setCountry(null);
			if(filterInputObj.getProductName() != null && filterInputObj.getProductName().equals(""))
				filterInputObj.setProductName(null);
			if(filterInputObj.getState() != null && filterInputObj.getState().equals(""))
				filterInputObj.setState(null);
			
			
	////////System.out.println("Request String:::::::"+gson.toJson(filterInputObj));
			
			resultStr = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("get_customer_list"), gson.toJson(filterInputObj),"POST");
			
//			resultStr = customerProxyObj.getCustomerList(gson.toJson(filterInputObj));
			//// log.info("Response String:::::::"+resultStr);
			//System.out.println(" Customer Response String:::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				CustomerDetails customerDetailsObj = gson.fromJson(resultStr, CustomerDetails.class); 
				customerDetailsList = customerDetailsObj.getCustomers();
			
				if(customerDetailsList != null && customerDetailsList.size() > 0){
					if(customerDetailsObj.getFilePath()!=null)
						customerDetailsList.get(0).setFilePath(customerDetailsObj.getFilePath());
					customerDetailsList.get(0).setTotalRecords(customerDetailsObj.getTotalRecords());
					if(filterInputObj.getStartIndex().equals(""))
						filterInputObj.setStartIndex("0");
					int slNo = Integer.parseInt(filterInputObj.getStartIndex());
					for(CustomerDetails customerDetails : customerDetailsList)
						customerDetails.setSlNo(++slNo);
				}
			}
		}catch(ConnectException ce) {
			ce.printStackTrace();
			if(customerDetailsList != null && customerDetailsList.size() > 0)
				customerDetailsList.get(0).setResponse(AppProperties.getAppMessageByProperty("CONNECTION_TIMEOUT").trim());
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			if(customerDetailsList != null && customerDetailsList.size() > 0)
				customerDetailsList.get(0).setResponse(AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim());
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			if(customerDetailsList != null && customerDetailsList.size() > 0)
				customerDetailsList.get(0).setResponse(AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim());
		} catch(RemoteException rme){
			rme.printStackTrace();
			if(customerDetailsList != null && customerDetailsList.size() > 0)
				customerDetailsList.get(0).setResponse(AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim());
		} catch(Exception e){
			e.printStackTrace();
			if(customerDetailsList != null && customerDetailsList.size() > 0)
				customerDetailsList.get(0).setResponse(AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim());
		}
		return customerDetailsList;
	}
	
	public Customer getCustomerDetails(String phone){
		String resultStr = null;
		Customer customerObj = new Customer();
		try {
			//CustomerProxy customerProxtObj = new CustomerProxy();
			customerObj.setPhone(phone);
			customerObj.setMobileNumber(phone);
			customerObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			
			/*// log.info("Request String:::::::"+gson.toJson(customerObj));
			resultStr = customerProxtObj.getCustomerDetails(gson.toJson(customerObj));
			// log.info("Response String:::::::"+resultStr);
//			//
*/			
			
			/**	added by - vasudev   purpose - using rest service call instead of soap call*/
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Customer_Service_customer_details"),gson.toJson(customerObj), "POST");

		////	System.out.println("Response String:::::::Customer_Service_customer_details:"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				customerObj = gson.fromJson(resultStr, Customer.class);
				customerObj.setAlternatePhoneNum(customerObj.getAltPhNo());
				resultStr = AppProperties.getAppMessageByProperty("CUSTOMER_CREATE_SUCCESS").trim();
			}
			else{
				resultStr = Response.getResponseMessage(resultStr);
			}
		}catch(ConnectException ce) {
			ce.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("CONNECTION_TIMEOUT").trim();
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
		} catch(RemoteException rme){
			rme.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		}
		return customerObj;
	}
	
	public String updateCustomer(Customer customerObj){
		String resultStr = null;
		try {
			//CustomerProxy customerProxtObj = new CustomerProxy();
			customerObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			customerObj.setUpdateRequired(true);
			if(customerObj.getAddressList() != null)
				for(CustomerAddress customerAddressObj : customerObj.getAddressList())
					if(customerAddressObj.isEmpty())
						customerObj.getAddressList().remove(customerAddressObj);
			
			
		/*	// log.info("Request String:::::::"+gson.toJson(customerObj));
//			//////////////System.out.println("Request String:::::::"+gson.toJson(customerObj));
			resultStr = customerProxtObj.updateCustomer(gson.toJson(customerObj));
			// log.info("Response String:::::::"+resultStr);
//			//////////////System.out.println("Response String:::::::"+resultStr);
*/			
			
			/**	added by - vasudev   purpose - using rest service call instead of soap call*/
			////////////System.out.println("Request String:::update_customer::::"+gson.toJson(customerObj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr= restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("update_customer"), gson.toJson(customerObj),"POST");
			////////////System.out.println("Response String::update_customer:::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("CUSTOMER_UPDATE_SUCCESS").trim();
			}
			else{
				resultStr = Response.getResponseMessage(resultStr);
			}
		}catch(ConnectException ce) {
			ce.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("CONNECTION_TIMEOUT").trim();
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
		} catch(RemoteException rme){
			rme.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		}
		return resultStr;
	}
	
	
	/**
	 * @author Mythri.S	
	 * created On: 1-oct-2015
	 * 
	 * This method is used to call the notifyCustomers method of web service.
	 * As the method of sending mail and sms may take long time, 
	 * 
	 */
	public String sendNotification(FilterInput filterInputObj,String customerId,String emailId){
		String resultStr = null;
		try {
			//CustomerProxy customerProxtObj = new CustomerProxy();
			filterInputObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			if(filterInputObj.getAge() != null && !filterInputObj.getAge().equals("")){
				String[] ageArray = filterInputObj.getAge().split("-");
				filterInputObj.setFromAge(Integer.parseInt(ageArray[0]));
				filterInputObj.setToAge(Integer.parseInt(ageArray[1]));
				filterInputObj.setAge(null);
			}
			/*if(filterInputObj.getPriceRange() != null && !filterInputObj.getPriceRange().equals("")){
				String[] rangeArray = filterInputObj.getPriceRange().split("-");
				filterInputObj.setPriceRangeStartAmount(Integer.parseInt(rangeArray[0]));
				filterInputObj.setPriceRangeEndAmount(Integer.parseInt(rangeArray[1]));
				filterInputObj.setPriceRange(null);
			}*/
			if(filterInputObj.getStartDateStr() != null && filterInputObj.getStartDateStr().equals(""))
				filterInputObj.setStartDateStr(null);
			if(filterInputObj.getEndDateStr() != null && filterInputObj.getEndDateStr().equals(""))
				filterInputObj.setEndDateStr(null);
			if(filterInputObj.getCountry() != null && filterInputObj.getCountry().equals(""))
				filterInputObj.setCountry(null);
			if(filterInputObj.getProductName() != null && filterInputObj.getProductName().equals(""))
				filterInputObj.setProductName(null);
			if(filterInputObj.getState() != null && filterInputObj.getState().equals(""))
				filterInputObj.setState(null);
			//filterInputObj.setGroup_id("CUSGRP10001");

			//////////////System.out.println(gson.toJson(filterInputObj));
			if(filterInputObj.getNotification_channel().equals("customerApp"))
			{
				RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
				resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_customer_notification"), gson.toJson(filterInputObj));
		
			}
			else
			{
				if(filterInputObj.getSubject() != null && !filterInputObj.getSubject().equals(""))
					filterInputObj.setNotificationType(AppProperties.getAppMessageByProperty("MAIL"));
				else
					filterInputObj.setNotificationType(AppProperties.getAppMessageByProperty("SMS"));

				/*// log.info("Request String:::::::"+gson.toJson(filterInputObj));
				resultStr = customerProxtObj.notifyCustomers(gson.toJson(filterInputObj));
				// log.info("Response String:::::::"+resultStr);*/
				
				resultStr = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("notify_customer"), gson.toJson(filterInputObj),"POST");

				String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					resultStr = AppProperties.getAppMessageByProperty("CUSTOMER_UPDATE_SUCCESS").trim();
				}
				else{
					resultStr = Response.getResponseMessage(resultStr);
				}
				
				
			}
		}catch(ConnectException ce) {
			ce.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("CONNECTION_TIMEOUT").trim();
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
		} catch(RemoteException rme){
			rme.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		}
		return resultStr;
	}

	
	/**
	 * @author Mythri.S	
	 * created On: 8-oct-2015
	 * 
	 * This method is used to call the createBatch method of web service.
	 * This method accepts all the filter parameters and batch info.
	 * It returns message of successful creation or not 
	 * 
	 */
	public String createNotificationPackage(FilterInput filterInputObj,String customerId,String emailId){
		String resultStr = null;
		try {
			//CustomerProxy customerProxtObj = new CustomerProxy();
			filterInputObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			if(filterInputObj.getAge() != null && !filterInputObj.getAge().equals("")){
				String[] ageArray = filterInputObj.getAge().split("-");
				filterInputObj.setFromAge(Integer.parseInt(ageArray[0]));
				filterInputObj.setToAge(Integer.parseInt(ageArray[1]));
				filterInputObj.setAge(null);
			}
			if(filterInputObj.getPriceRange() != null && !filterInputObj.getPriceRange().equals("")){
				String[] rangeArray = filterInputObj.getPriceRange().split("-");
				filterInputObj.setPriceRangeStartAmount(Integer.parseInt(rangeArray[0]));
				filterInputObj.setPriceRangeEndAmount(Integer.parseInt(rangeArray[1]));
				filterInputObj.setPriceRange(null);
			}
			if(filterInputObj.getStartDateStr() != null && filterInputObj.getStartDateStr().equals(""))
				filterInputObj.setStartDateStr(null);
			if(filterInputObj.getEndDateStr() != null && filterInputObj.getEndDateStr().equals(""))
				filterInputObj.setEndDateStr(null);
			if(filterInputObj.getCountry() != null && filterInputObj.getCountry().equals(""))
				filterInputObj.setCountry(null);
			if(filterInputObj.getProductName() != null && filterInputObj.getProductName().equals(""))
				filterInputObj.setProductName(null);
			if(filterInputObj.getState() != null && filterInputObj.getState().equals(""))
				filterInputObj.setState(null);
			//// log.info("Request String:::::::"+gson.toJson(filterInputObj));
			if(filterInputObj != null && filterInputObj.getNotify().equals("false"))
			{
				resultStr = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("create_batch"),gson.toJson(filterInputObj), "POST");
				//resultStr = customerProxtObj.createBatch(gson.toJson(filterInputObj));
			}
				
			if(filterInputObj != null && filterInputObj.getNotify().equals("true"))
			{
				resultStr = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("customer_notifications"),gson.toJson(filterInputObj),"POST");
				//resultStr = customerProxtObj.customerNotifications(gson.toJson(filterInputObj));
			}
				
			//// log.info("Response String:::::::"+resultStr);
			
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				if(filterInputObj != null && filterInputObj.getNotify().equals("false"))
					resultStr = AppProperties.getAppMessageByProperty("PACKAGE_CREATE_SUCCESS").trim();
				if(filterInputObj != null && filterInputObj.getNotify().equals("true"))
					resultStr = AppProperties.getAppMessageByProperty("NOTIFICATIONS_SENT").trim();
			}
			else{
				resultStr = Response.getResponseMessage(resultStr);
			}
		}catch(ConnectException ce) {
			ce.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("CONNECTION_TIMEOUT").trim();
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
		} catch(RemoteException rme){
			rme.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		}
		return resultStr;
	}
	
	/**
	 * @author Mythri.S	
	 * Created On: 10-oct-2015
	 * 
	 * This method is used to call the getBatchNamesByNotificationCategory method of web service 
	 * and return the Products List
	 * 
	 */
	public List<CustomerNotification> getBatchNamesByEventType(String customerId,String emailId,String eventType){
		String resultStr = null;
		CustomerNotification customerNotificationObj = new CustomerNotification();
		
		try {
			//CustomerProxy customerProxtObj = new CustomerProxy();
			customerNotificationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			customerNotificationObj.setNotificationCategory(eventType);
			
			/*// log.info("Request String:::::::::"+gson.toJson(customerNotificationObj));
			resultStr = customerProxtObj.getBatchNamesByNotificationCategory(gson.toJson(customerNotificationObj));
			// log.info("Response String:::::::::"+resultStr);*/
			
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_batchnames_by_notificationcatagory"), gson.toJson(customerNotificationObj),"POST");

			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				customerNotificationObj = gson.fromJson(resultStr, CustomerNotification.class);
			}
		}catch(ConnectException ce) {
			ce.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("CONNECTION_TIMEOUT").trim();
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
		} catch(RemoteException rme){
			rme.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		}
		return customerNotificationObj.getNotificationMessages();
	}
	
	/**
	 * @author Mythri.S	
	 * Created On: 11-oct-2015
	 * 
	 * This method is used to call the getBatchInfo method of web service and return the FilterInput List
	 * 
	 */
	public List<FilterInput> getBatchInfo(String batchName,String category,String customerId,String emailId){
		String resultStr = null;
		FilterInput filterInputObj = new FilterInput();
		try {
			//CustomerProxy customerProxtObj = new CustomerProxy();
			filterInputObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			filterInputObj.setBatchName(batchName);
			filterInputObj.setNotificationCategory(category);
			
			/*// log.info("Request String:::::::::"+gson.toJson(filterInputObj));
			resultStr = customerProxtObj.getBatchInfo(gson.toJson(filterInputObj));
			// log.info("Response String:::::::::"+resultStr);*/
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_batch_info"), gson.toJson(filterInputObj),"POST");

			
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				filterInputObj = gson.fromJson(resultStr, FilterInput.class);
			}
		}catch(ConnectException ce) {
			ce.printStackTrace();
			filterInputObj.setResponse(AppProperties.getAppMessageByProperty("CONNECTION_TIMEOUT").trim());
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			filterInputObj.setResponse(AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim());
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			filterInputObj.setResponse(AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim());
		} catch(RemoteException rme){
			rme.printStackTrace();
			filterInputObj.setResponse(AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim());
		} catch(Exception e){
			e.printStackTrace();
			filterInputObj.setResponse(AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim());
		}
		return filterInputObj.getNotificationMessages();
	}
	
	/**
	 * @author Mythri.S	
	 * Created On: 15-oct-2015
	 * 
	 * This method is used to call the enableOrDisableBatches method of web service 
	 * This will enable or disable the batch based on the value of enable variable.
	 * 
	 */
	public void enableOrDisableBatches(String batchName,String category,boolean enable,String subCategory,String customerId,String emailId){
		String resultStr = null;
		FilterInput filterInputObj = new FilterInput();
		try {
			//CustomerProxy customerProxtObj = new CustomerProxy();
			filterInputObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			filterInputObj.setBatchName(batchName);
			filterInputObj.setNotificationCategory(category);
			filterInputObj.setEnable(enable);
			if(!subCategory.equals(""))
				filterInputObj.setNotificationSubCategory(subCategory);
			
			/*// log.info("Request String:::::::::"+gson.toJson(filterInputObj));
			resultStr = customerProxtObj.enableOrDisableBatches(gson.toJson(filterInputObj));
			// log.info("Response String:::::::::"+resultStr);*/
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("enable_disable_batches"),gson.toJson(filterInputObj),"POST");

			
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				filterInputObj = gson.fromJson(resultStr, FilterInput.class);
			}
		}catch(ConnectException ce) {
			ce.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("CONNECTION_TIMEOUT").trim();
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
		} catch(RemoteException rme){
			rme.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		}
	}
	
	/**
	 * @author Mythri.S	
	 * created On: 1-oct-2015
	 * 
	 * This method is used to call the getCustomerList method of web service and return the customers List
	 * 
	 */
	public List<BusinessEnquiry> getBusinessEnquiryList(String index,String maxRecords,String searchNameStr,String startDate,String endDate,boolean search,String location){
		String resultStr = null;
		
		List<BusinessEnquiry> businessEnquiryList = new ArrayList<BusinessEnquiry>();
		try {
			BusinessEnquiry businessEnquiryObj = new BusinessEnquiry();
			if(search)
				businessEnquiryObj.setSearchCriteria(searchNameStr);
			else
				businessEnquiryObj.setEnquiryId(searchNameStr);
			businessEnquiryObj.setStoreLocation(location);
			businessEnquiryObj.setStartDate(startDate);
			businessEnquiryObj.setEndDate(endDate);
			businessEnquiryObj.setStartIndex(index);
			businessEnquiryObj.setMaxRecords(maxRecords);
			businessEnquiryObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String:::::::"+gson.toJson(businessEnquiryObj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_businessEnquiry"), gson.toJson(businessEnquiryObj),"GET");
			// log.info("Response String:::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				BusinessEnquiryResponse businessEnquiryResponseObj = gson.fromJson(resultStr, BusinessEnquiryResponse.class); 
				businessEnquiryList = businessEnquiryResponseObj.getEnquiryList();
				if(businessEnquiryList != null && businessEnquiryList.size() > 0){
					businessEnquiryList.get(0).setTotalRecords(businessEnquiryResponseObj.getTotalRecords()+"");
					if(businessEnquiryObj.getStartIndex().equals(""))
						businessEnquiryObj.setStartIndex("0");
					int slNo = Integer.parseInt(businessEnquiryObj.getStartIndex());
					for(BusinessEnquiry businessEnquiry : businessEnquiryList)
						businessEnquiry.setSlNo(++slNo);
				}
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			if(businessEnquiryList != null && businessEnquiryList.size() > 0)
				businessEnquiryList.get(0).setResponse(AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim());
		} catch(Exception e){
			e.printStackTrace();
			if(businessEnquiryList != null && businessEnquiryList.size() > 0)
				businessEnquiryList.get(0).setResponse(AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim());
		}
		return businessEnquiryList;
	}
	
	
	public String createBusinessEnquiry(BusinessEnquiry businessEnquiryObj){
		String resultStr = null;
		try {
			businessEnquiryObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String:::::::"+gson.toJson(businessEnquiryObj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_businessEnquiry"), gson.toJson(businessEnquiryObj));
			// log.info("Response String:::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				resultStr = AppProperties.getAppMessageByProperty("BUSINESS_ENQUIRY_CREATE_SUCCESS").trim();
			else
				resultStr = Response.getResponseMessage(resultStr);
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		}
		return resultStr;
	}
	
	public BusinessEnquiry getBusinessEnquiryDetails(String enquiryId){
		BusinessEnquiry businessEnquiryObj = new BusinessEnquiry();
		try {
			businessEnquiryObj.setEnquiryId(enquiryId);
			businessEnquiryObj.setStartIndex("0");
			businessEnquiryObj.setMaxRecords("1");
			businessEnquiryObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String:::::::"+gson.toJson(businessEnquiryObj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			String resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_businessEnquiry"), gson.toJson(businessEnquiryObj),"GET");
			// log.info("Response String:::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				BusinessEnquiryResponse businessEnquiryResponseObj = gson.fromJson(resultStr, BusinessEnquiryResponse.class); 
				businessEnquiryObj = businessEnquiryResponseObj.getEnquiryObj();
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			businessEnquiryObj.setResponse(AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim());
		} catch(Exception e){
			e.printStackTrace();
			businessEnquiryObj.setResponse(AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim());
		}
		return businessEnquiryObj;
	}
	
	public String updateBusinessEnquiry(BusinessEnquiry businessEnquiryObj){
		String resultStr = null;
		try {
			businessEnquiryObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String:::::::"+gson.toJson(businessEnquiryObj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_businessEnquiry"), gson.toJson(businessEnquiryObj));
			// log.info("Response String:::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				resultStr = AppProperties.getAppMessageByProperty("BUSINESS_ENQUIRY_UPDATE_SUCCESS").trim();
			else
				resultStr = Response.getResponseMessage(resultStr);
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		}
		return resultStr;
	}
	
	
	public List<CustomerReferralMaster> getCustomerReferral(CustomerReferralMaster filterInputObj){
		List<CustomerReferralMaster> customersList = new ArrayList<CustomerReferralMaster>();
		try {
			filterInputObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			filterInputObj.setCustomerDataRequired(true);
			filterInputObj.setReferralCodesRequired(true);
			filterInputObj.setLocationDataRequired(true);
			
			////////System.out.println("Request String:::::::"+gson.toJson(filterInputObj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			String resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Customer_Referral"), gson.toJson(filterInputObj),"GET");
			
			////////System.out.println("get_Customer_Referral Response String:::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				CustomerReferralMaster	customerReferralsList = gson.fromJson(resultStr, CustomerReferralMaster.class); 
			if(customerReferralsList.getCustomerReferralsList()!=null){
			customersList=customerReferralsList.getCustomerReferralsList();
			customersList.get(0).setTotalRecords(customerReferralsList.getTotalRecords());
			if(customerReferralsList.getFilePath()!=null)
				customersList.get(0).setFilePath(customerReferralsList.getFilePath());
				}
				}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
		} catch(Exception e){
			e.printStackTrace();
		}
		return customersList;
	}
	
	
	
	
	public List<CustomerDetails> getCustomerPurchaseList(FilterInput filterInputObj){
		List<CustomerDetails> customersList = new ArrayList<CustomerDetails>();
		try {
			filterInputObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String:::::::"+gson.toJson(filterInputObj));
	//		////System.out.println("Requestget_Customer_purchase String:::::::"+gson.toJson(filterInputObj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			String resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Customer_purchase"), gson.toJson(filterInputObj),"GET");
			// log.info("Response String:::::::"+resultStr);
			//System.out.println("get_Customer_purchase String:::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				if(filterInputObj.getStartIndex().equals(""))
					filterInputObj.setStartIndex("0");
				int slNo = Integer.parseInt(filterInputObj.getStartIndex());
				CustomerDetails customerDetailsObj = gson.fromJson(resultStr, CustomerDetails.class); 
				customersList = customerDetailsObj.getCustomers();
				
				if(customersList != null && customersList.size() > 0){
					if(customerDetailsObj.getFilePath()!=null)
						customersList.get(0).setFilePath(customerDetailsObj.getFilePath());
					customersList.get(0).setTotalRecords(customerDetailsObj.getTotalRecords());
					for(CustomerDetails customer : customersList){
						customer.setSlNo(++slNo);
					}
				}
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			if(customersList != null && customersList.size() > 0)
				customersList.get(0).setResponse(AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim());
		} catch(Exception e){
			e.printStackTrace();
			if(customersList != null && customersList.size() > 0)
				customersList.get(0).setResponse(AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim());
		}
		return customersList;
	}
	
	
	/**
	 * @author Manasa.P	
	 * created On: 29-05-2018
	 * 
	 * This method is used to call the getCustomerVisits method of web service and return the customers visits List
	 * 
	 */
	public List<Billing> getCustomerVisitList(FilterInput filterInputObj){
		List<Billing> billingObj = new ArrayList<Billing>();
		try {
			
			filterInputObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		//	// log.info("Request String:::::::"+gson.toJson(filterInputObj));
		/////////System.out.println("Request String:::::::get_Customer_Visits"+gson.toJson(filterInputObj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			String resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Customer_Visits"), gson.toJson(filterInputObj),"GET");
		//	// log.info("Response String:::::::"+resultStr);
			//////System.out.println("Response String:::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				Billing	billing = gson.fromJson(resultStr, Billing.class); 
				billingObj = billing.getBilling();
				int slNo = Integer.parseInt(filterInputObj.getStartIndex());
				

				
				if(billingObj!=null && billingObj.size()>0)
				{
					
					billingObj.get(0).setTotalRecords(billing.getTotalRecords());
					billingObj.get(0).setTotalTurnOver(billing.getTotalTurnOver());
					billingObj.get(0).setNoOfCustomerVisits(billing.getNoOfCustomerVisits());
					
					for(Billing customer : billingObj){
						customer.setSlNo(++slNo);
					}
					
				}
				
				if(billing.getFilePath()!=null)
					billingObj.add(billing);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			
		} catch(Exception e){
			e.printStackTrace();
			
		}
		return billingObj;
	}
	
	public List<CustomerPurchases> getCustomerPurchaseDetailsList(String phoneNumber,String index,String maxRecords,String startDate,String endDate,String searchName){
		List<CustomerPurchases> customerPurchasesList = new ArrayList<CustomerPurchases>();
		try {
			CustomerPurchases customerPurchasesObj = new CustomerPurchases();
			customerPurchasesObj.setPhoneNumber(phoneNumber);
			customerPurchasesObj.setStartIndexForBilling(index);
			customerPurchasesObj.setRequiredBillingDetails(true);
//			customerPurchasesObj.setStartDate(startDate);
//			customerPurchasesObj.setEndDate(endDate);
			customerPurchasesObj.setMaxRecordsForBilling(maxRecords);
			customerPurchasesObj.setSearchCriteriaForBills(searchName);
			customerPurchasesObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String:::::::"+gson.toJson(customerPurchasesObj));
//			//////////////System.out.println("Request String:::::::"+gson.toJson(customerPurchasesObj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			String resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Customer_purchase"), gson.toJson(customerPurchasesObj),"GET");
			// log.info("Response String:::::::"+resultStr);
//			//////////////System.out.println("Response String:::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				if(customerPurchasesObj.getStartIndexForBilling().equals(""))
					customerPurchasesObj.setStartIndexForBilling("0");
				int slNo = Integer.parseInt(customerPurchasesObj.getStartIndexForBilling());
				customerPurchasesObj = gson.fromJson(resultStr, CustomerPurchases.class); 
				customerPurchasesList = customerPurchasesObj.getItemsList();
				if(customerPurchasesList != null && customerPurchasesList.size() > 0){
					customerPurchasesList.get(0).setTotalRecords(customerPurchasesObj.getTotalRecords());
					for(CustomerPurchases customerPurchase : customerPurchasesList){
						customerPurchase.setSlNo(++slNo);
					}
				}
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
		} catch(Exception e){
			e.printStackTrace();
		}
		return customerPurchasesList;
	}
	
	/**
	 * @writtenBy: Akhil M
	 * @date: 4th nov,2018
	 * @verified By: 
         * @description: This method is used to get the details of the customer group
         * 
         * 
         */
	
	
	public List<CustomerGroupMaster> getCustomerGroupDetails(String groupNameStr, String customerIdStr,
			String emailIdStr, String index, String maxRecords, boolean search, boolean saveCustomerGroup,String outletZone,String outletLocation,String from,String to) {
		String resultStr = null;
		CustomerGroupMaster masterObj = new CustomerGroupMaster();
		try {

			masterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			if (search)
				masterObj.setSearchCriteria(groupNameStr);
			else
		    masterObj.setGroup_id(groupNameStr);
			masterObj.setStartIndex(index);
			masterObj.setMaxRecords(maxRecords);
			masterObj.setSaveCustomerGroup(saveCustomerGroup);
			masterObj.setStartDate(from);
			masterObj.setEndDate(to);
			masterObj.setLocation(outletLocation);
			masterObj.setZone(outletZone);
			// log.info("Request::" + gson.toJson(masterObj));

//			////////////System.out.println(gson.toJson(masterObj));
			
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponse(
					AppProperties.getRESTFulCloudServiceURL("get_customer_group"), gson.toJson(masterObj), "GET");
			
			// log.info("Response::" + resultStr);
//////System.out.println("Response::" + resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			int slNo = Integer.parseInt(index);
			if (responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())) {
				masterObj = gson.fromJson(resultStr, CustomerGroupMaster.class);
				if (masterObj.getCustomerGroupList() != null && masterObj.getCustomerGroupList().size() > 0) {
					masterObj.getCustomerGroupList().get(0).setTotalRecords(Response.getResponseTotalRecords(resultStr));
					masterObj.getCustomerGroupList().get(0).setFilePath(masterObj.getFilePath());
					for (CustomerGroupMaster group : masterObj.getCustomerGroupList())
						group.setSlNo(++slNo);
				}
			}
			
		} catch (ConnectException ce) {
			ce.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
		} catch (RemoteException rme) {
			rme.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return masterObj.getCustomerGroupList();
	}


/**
	 * @writtenBy: Akhil M
	 * @date: 4th nov,2018
	 * @verified By: 
         * @description: This method is used to update the changes done in customer group
         * 
         * 
         */
	

	public String updateCustomerGroup(CustomerGroupMaster masterObj, String customerId, String emailId) {
		String resultStr = null;
		try {
			
			masterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info(gson.toJson(masterObj));
//			////////////System.out.println(gson.toJson(masterObj));
//			////////////System.out.println("check this out");
			
			
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponseFromPost(
					AppProperties.getRESTFulCloudServiceURL("update_customer_group"), gson.toJson(masterObj));
			//////////////System.out.println(resultStr);
			// log.info(resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if (responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())) {
				resultStr = AppProperties.getAppMessageByProperty("CUSTOMER_GROUP_UPDATE_SUCCESS").trim();
			} else {
				// result = "Couldn't update, please try after some time";
				resultStr = Response.getResponseMessage(resultStr);
			}
			
		} catch(ConnectException ce) {
			ce.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
		} catch(RemoteException rme){
			rme.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		// ////////////System.out.println(resultStr);
		return resultStr;
	}



public List<CustomerDetails> searchCustomers(String customerIdStr, String emailIdStr, String searchNameStr) {
		String resultStr = null;
		
		RequestBean requestBeanObj = null;
		List<CustomerDetails> customersLists = new ArrayList<CustomerDetails>();
		RestfulServiceConnection restfulConnectionObj = null;
		try {
			//// log.info("Get Customers based on provided name");
			restfulConnectionObj = new RestfulServiceConnection();
			
			requestBeanObj = new RequestBean();
			requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestBeanObj.setSearchCriteria(searchNameStr);
			requestBeanObj.setStartIndex("-1");
			
			//// log.info("Request String::::" + gson.toJson(requestBeanObj));
			//////////////System.out.println("search Request String::::" + gson.toJson(requestBeanObj));
			resultStr = restfulConnectionObj.getResponse(
					AppProperties.getRESTFulCloudServiceURL("Customer_Service_search_Customers"),
					gson.toJson(requestBeanObj), "POST");
			

			//// log.info("Response String::::" + resultStr);
			////////////System.out.println("search Response String::::" + resultStr);
			// CustomerList customerList = new CustomerList();

			CustomerDetails customerDetailsObj = gson.fromJson(resultStr, CustomerDetails.class);
			customersLists = customerDetailsObj.getCustomers();
			
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch (Exception e) {
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return customersLists;

	}






/**
	 * @writtenBy: Akhil M
	 * @date: 4th nov,2018
	 * @verified By: 
         * @description: This method is used to create new customer group
         * 
         * 
         */
	
	public String createNewCustomerGroup(CustomerGroupMaster groupObj, String customerIdStr, String emailIdStr) {
		String resultStr = null;
		try {
			groupObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String::::::::::::" + gson.toJson(groupObj));
			////////////System.out.println("request");
			////////////System.out.println(gson.toJson(groupObj));

			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			
			if(groupObj.getFilePath()==""){
			resultStr = restfulServiceConnectionObj.getResponseFromPost(
					AppProperties.getRESTFulCloudServiceURL("create_customer_group"), gson.toJson(groupObj));
			}else{
				groupObj.setCustomerGroupItems(null);
				resultStr = restfulServiceConnectionObj.getResponse(
						AppProperties.getRESTFulCloudServiceURL("upload_customer_group"), gson.toJson(groupObj),"POST");
			}
			
			////////////System.out.println("Response");
			////////////System.out.println(resultStr);
			// log.info("Response String:::::::::::" + resultStr);

			String responseCode = Response.getResponseCode(resultStr);
			if (responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())) {
				resultStr = AppProperties.getAppMessageByProperty("GROUP_CREATE_SUCCESS").trim();
			} else {

				if ((Response.getResponseMessage(resultStr)).trim()
						.equals(AppProperties.getAppMessageByProperty("CONTRAINT_KEY_VIOLATED")))
					resultStr = AppProperties.getAppMessageByProperty("GROUP_EXISTS");
				else
					resultStr = Response.getResponseMessage(resultStr);
			}

		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();

		} catch (Exception e) {
			e.printStackTrace();
		}
		////////////System.out.println(resultStr);
		
		return resultStr;

	}


/**
	 * @writtenBy: Akhil M
	 * @date: 4th nov,2018
	 * @verified By: 
         * @description: This method is used to delete the available customer group
         * 
         * 
         */
	
	public String deleteCustomerGroup(String customerIdStr,String emailIdStr,String ids) {
		String resultStr = null;
		try {
			CustomerGroupMaster masterObj=new CustomerGroupMaster();
			
			////////////System.out.println("Ids::"+ids);
//			ProductGroupMasterProxy masterServiceProxy = new ProductGroupMasterProxy();
			masterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			String[] groups = ids.split(",");
			List<String> groupDetails = new ArrayList<String>();
			for(int i=0;i<groups.length;i++)
				groupDetails.add(groups[i]);
			masterObj.setDeleteIdList(groupDetails);
			//////////////System.out.println("groupDetails::"+groupDetails);
			// log.info(gson.toJson(masterObj));
			////////////System.out.println(gson.toJson(masterObj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("delete_customer_group"), gson.toJson(masterObj),"GET");
//			result = masterServiceProxy.deleteProductGroup(gson.toJson(masterObj));
			// log.info("Result:"+resultStr);
			////////////System.out.println(resultStr);
			
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				resultStr = AppProperties.getAppMessageByProperty("CUSTOMER_GROUP_DELETE_SUCCESS").trim();
			else if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_FAILED_CODE").trim()))
				resultStr = AppProperties.getAppMessageByProperty("DELETE_FAILED").trim();
		}catch(ConnectException ce) {
			ce.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
		} catch(RemoteException rme){
			rme.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
	}

	public CustomerGroupMaster getCustomerGroupDetailsforGroupId(String groupNameStr, String customerIdStr,
			String emailIdStr, String index, boolean search, String searchcriteria) {
		String resultStr = null;
		CustomerGroupMaster masterObj = new CustomerGroupMaster();
		try {

			masterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));

			if (search)
				masterObj.setSearchCriteria(groupNameStr);
			else
				masterObj.setGroup_id(groupNameStr);
			masterObj.setStartIndex(index);
			masterObj.setSearchCriteria(searchcriteria);
			//masterObj.setMaxRecords(maxRecords);

			// log.info("Request::" + gson.toJson(masterObj));
			////////////System.out.println("request for get data");
		///    System.out.println("Request::"+gson.toJson(masterObj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponse(
					AppProperties.getRESTFulCloudServiceURL("get_customer_group"), gson.toJson(masterObj), "GET");
			
			// log.info("Response::" + resultStr);
			////System.out.println("Response::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			int slNo = Integer.parseInt(index);
			if (responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())) {
				masterObj = gson.fromJson(resultStr, CustomerGroupMaster.class);
				}

		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return masterObj;
	}



	public CustomerDetails getCustomerDetails(String customerIdStr, String emailIdStr, String phone) {
		String resultStr = null;
		
		RequestBean requestBeanObj = null;
		CustomerDetails customerDetailsObj = null;
		RestfulServiceConnection restfulConnectionObj = null;
		try {
			// log.info("Get Customer details based on provided phone number");
			restfulConnectionObj = new RestfulServiceConnection();
			
			requestBeanObj = new RequestBean();
			requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestBeanObj.setMobileNumber(phone);
			requestBeanObj.setStartIndex("-1");
			
			// log.info("Request String::::" + gson.toJson(requestBeanObj));
			////////////System.out.println("PhoneNumber Request String::::" + gson.toJson(requestBeanObj));
			resultStr = restfulConnectionObj.getResponse(
					AppProperties.getRESTFulCloudServiceURL("Customer_Service_customer_details"),
					gson.toJson(requestBeanObj), "POST");
			

			// log.info("Response String::::" + resultStr);
			////////////System.out.println("Phone Number Response String::::" + resultStr);
			

			 customerDetailsObj = gson.fromJson(resultStr, CustomerDetails.class);
			
			
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch (Exception e) {
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		
		
		return customerDetailsObj;
		

	}




	//added by koti bommineni
	
			public String createWallet(CustomerLedger customerWalletMaster,String customerId,String emailId,String type){
				String result = null;
				try {
					
					RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
					customerWalletMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));

				//	System.out.println("Request String::::::::::::"+gson.toJson(customerWalletMaster));
					RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();

					if(type.equals("edit")){
				    result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_wallet"), gson.toJson(customerWalletMaster));

					}else if(type.equals("new")){
					result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_wallet"), gson.toJson(customerWalletMaster));
					}
					// log.info("Response String:::::::::::"+result);
				   // System.out.println("Response String:::::::::::"+result);
					String responseCode = Response.getResponseCode(result);
					/*if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
						
						if(type.equals("new")){
						result = AppProperties.getAppMessageByProperty("WALLET_CREATED_SUCCESS").trim();
						}
						if(type.equals("edit")){
						result = AppProperties.getAppMessageByProperty("WALLET_UPDATED_SUCCESS").trim();
						}
						
					}
					else{
						//result = "Couldn't create, please try after some time";
						result = Response.getResponseMessage(result);
					}*/
				}catch(ConnectException ce) {
					ce.printStackTrace();
					result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
				} catch (NoSuchElementException nse) {
					nse.printStackTrace();
					result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
				} catch (UnknownHostException uhe) {
					uhe.printStackTrace();
					result = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
				} catch(RemoteException rme){
					rme.printStackTrace();
					result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
				} catch(Exception e){
					e.printStackTrace();
				}
				return result;
			}
			
		
			
			public List<CustomerWallets> getWalletBySearchCreiteria(String walletId,String customerIdStr,String emailIdStr,String searchName,String index,String walletMaxRecords){
				String result = null;
				List<CustomerWallets> list_customerLedger = null;
				RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
				try 
				{
					CustomerWallets obj_customerLedger = new CustomerWallets();
					
					//obj_customerLedger.setWalletProgramId(walletProgramId);
					
					    obj_customerLedger.setWalletSearchCriteria(searchName);
						obj_customerLedger.setStartIndex(index);
						obj_customerLedger.setMaxRecords(walletMaxRecords);
						obj_customerLedger.setWalletProgramId(walletId);
					
					obj_customerLedger.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
					// log.info("Request String:::::::"+gson.toJson(obj_customerLedger));
					
			////		System.out.println("Request String wallet:::pagination::::"+gson.toJson(obj_customerLedger));
																								
					 result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_wallet_Master"), gson.toJson(obj_customerLedger),"GET");

	//		System.out.println("Response String wallet:::pagination::::"+result);
					
					// log.info("Response String:::::::"+result);
					String responseCode = Response.getResponseCode(result);
					if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
					{
						obj_customerLedger = gson.fromJson(result,CustomerWallets.class);
						list_customerLedger = obj_customerLedger.getCustomerWallets();
							list_customerLedger.get(0).setTotalRecords((obj_customerLedger.getTotalRecords()));
					}
					
				}catch (NoSuchElementException nse) {
					nse.printStackTrace();
					result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
				} catch(Exception e){
					e.printStackTrace();
				}
				////////////System.out.println("after String:::::::"+gson.toJson(list_customerLedger));
				return list_customerLedger;
			}
			
			
			
		

			
			//added by koti
			
			
			
			public List<CustomerWalletMaster> getCustomerWalletDetails(String customerIdStr,String emailIdStr,String location,String zone,String startdate,String enddate ,String WalletStatusList,String searchName,String id,String index,String maxRecords,String childsearch){
				String result = null;
				List<CustomerWalletMaster> list_customerLedger = null;
				RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
				try 
				{
					CustomerLedger obj_customerLedger = new CustomerLedger();
					
					if(!obj_customerLedger.equals(""))
						obj_customerLedger.setLocation(location);
					
					obj_customerLedger.setZone(zone);
					obj_customerLedger.setStartdate(startdate);
					obj_customerLedger.setEnddate(enddate);
					
					if(searchName !="")
					{
						
						if(childsearch.equals("true")){
							obj_customerLedger.setSearchCriteria("");
						}else{
							obj_customerLedger.setSearchCriteria(searchName);

						}
						obj_customerLedger.setWalletMaxRecords(maxRecords);
						obj_customerLedger.setWalletStartIndex(index);
						obj_customerLedger.setStartIndex("0");
						obj_customerLedger.setMaxRecords("10");
					}
					else
					{
						obj_customerLedger.setSearchCriteria(searchName);
						obj_customerLedger.setWalletMaxRecords("10");
						obj_customerLedger.setWalletStartIndex("0");
						obj_customerLedger.setStartIndex(index);
						obj_customerLedger.setMaxRecords(maxRecords);
					}
					
					
					if(childsearch.equals("true")){
						obj_customerLedger.setWalletSearchCriteria(searchName);
					}
					
					obj_customerLedger.setWalletStatus(WalletStatusList);
					obj_customerLedger.setWalletProgramStatus(WalletStatusList);
					
					
					if(id != "" && id != null){
						
						obj_customerLedger.setWalletProgramId(id);
					}
					
					
					
					
					obj_customerLedger.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
					// log.info("Request String:::::::"+gson.toJson(obj_customerLedger));
					
				//	System.out.println("Request String:::::::"+gson.toJson(obj_customerLedger));
					
					 result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_wallets"), gson.toJson(obj_customerLedger),"GET");

				//	System.out.println("Response String:::::::"+result);
					
					// log.info("Response String:::::::"+result);
					String responseCode = Response.getResponseCode(result);
					if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
					{
					
						obj_customerLedger = gson.fromJson(result,CustomerLedger.class);
						
						list_customerLedger = obj_customerLedger.getCustomerWallets();
						
						
							list_customerLedger.get(0).setTotalWallets((list_customerLedger.get(0).getTotalWallets()));
						
							list_customerLedger.get(0).setTotalRecords((obj_customerLedger.getTotalRecords()));
						
						
					}
					
				}catch (NoSuchElementException nse) {
					nse.printStackTrace();
					result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
				} catch(Exception e){
					e.printStackTrace();
				}
				////////////System.out.println("after String:::::::"+gson.toJson(list_customerLedger));
				return list_customerLedger;
			}

			public String addWallet(String txnRef, String tender,  float amount,String walletId,String phone,String type,String customerId,String emailId){
				String result = null;
				try {
					CustomerLedger CustomerLedgerObj=new CustomerLedger();
					CustomerLedgerObj.setTxnRef(txnRef.trim());
					CustomerLedgerObj.setTenderKey(tender.trim());
				//CustomerLedgerObj.setDate(date);
				//	CustomerLedgerObj.setAmount(amount);
					
				//	CustomerLedgerObj.setAmountBalance(totalAmount);
					CustomerLedgerObj.setWalletId(walletId);
					if(type == "credit" || type.equals("credit"))
					   CustomerLedgerObj.setAmountCredited(amount);
					else
					   CustomerLedgerObj.setAmountDebited(amount);
					
					CustomerLedgerObj.setPhoneNumber(phone);
					
					if(type == "credit" || type.equals("credit"))
					    CustomerLedgerObj.setTxnType("Cash Deposit");
					else
						CustomerLedgerObj.setTxnType("Online Order");
					
					CustomerLedgerObj.setUserName(emailId);
					CustomerLedgerObj.setRoleName("Admin");
					CustomerLedgerObj.setTxnSource("Customer");
					
				CustomerLedgerObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
					
					// log.info("Request String::::::::::::"+gson.toJson(customerWalletMaster));
	         // System.out.println("Request String:::::Add:::::::"+gson.toJson(CustomerLedgerObj));
					RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();

					result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("add_wallet"), gson.toJson(CustomerLedgerObj));

					// log.info("Response String:::::::::::"+result);
		// System.out.println("Response String:::::Add::::::"+result);
					String responseCode = Response.getResponseCode(result);
					if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
						//result = AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim();
						result = Response.getResponseMessage(result);
					}
					
					else{
						//result = "Couldn't create, please try after some time";
						result = Response.getResponseMessage(result);
					}
				}catch(ConnectException ce) {
					ce.printStackTrace();
					result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
				} catch (NoSuchElementException nse) {
					nse.printStackTrace();
					result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
				} catch (UnknownHostException uhe) {
					uhe.printStackTrace();
					result = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
				} catch(RemoteException rme){
					rme.printStackTrace();
					result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
				} catch(Exception e){
					e.printStackTrace();
				}
				return result;
			}
			

			public CustomerLedger geteditCustomerWalletLedger(String customerIdStr,String emailIdStr,String phone,String walletName,boolean status){
				String resultStr = null;
				CustomerLedger	customerLedgerObj = new CustomerLedger();
				try {
					RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
					customerLedgerObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
					customerLedgerObj.setPhoneNumber(phone);
					customerLedgerObj.setWalletName(walletName);
					customerLedgerObj.setStatus(status);
					//customerLedgerObj.setSearchCreteria(searchCreteria);
					
			customerLedgerObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
					
		//	System.out.println("Request :::edit::::"+gson.toJson(customerLedgerObj));
					
             resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_ledger_balance"), gson.toJson(customerLedgerObj),"GET");

             String responseCode = Response.getResponseCode(resultStr);
             
	  //    System.out.println("Response edit_wallets_ledgers:::::::"+resultStr);
					
					if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
					{
						customerLedgerObj = gson.fromJson(resultStr,CustomerLedger.class);
					}
					else{
						customerLedgerObj = gson.fromJson(resultStr,CustomerLedger.class);
					}
					
				}catch (NoSuchElementException nse) {
					nse.printStackTrace();
					resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
				} catch(Exception e){
					e.printStackTrace();
				}
				////////////System.out.println("After get_wallets_ledgers:::::::"+gson.toJson(list_customerLedger));
				return customerLedgerObj;
			}

			
			
			
			

			public List<CustomerLedger> getCustomerWalletLedger(String customerIdStr,String emailIdStr,String location,String zone,String startdate,String enddate ,String WalletStatusList,String searchName,String id,String index,String maxRecords,String phone,boolean saveFlag,String walletId){
				String result = null;
				List<CustomerLedger> list_customerLedger = null;
				RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
				try 
				{
					CustomerLedger obj_customerLedger = new CustomerLedger();
					
					if(!obj_customerLedger.equals(""))
						obj_customerLedger.setLocation(location);
					
					obj_customerLedger.setZone(zone);
					obj_customerLedger.setStartdate(startdate);
					obj_customerLedger.setEnddate(enddate);
					obj_customerLedger.setSearchCriteria(searchName);
					obj_customerLedger.setWalletStatus(WalletStatusList);
					obj_customerLedger.setStartIndex(index);
					obj_customerLedger.setMaxRecords(maxRecords);
					obj_customerLedger.setPhoneNumber(phone);
					obj_customerLedger.setSaveFile(saveFlag);
					if(saveFlag == true)
					obj_customerLedger.setWalletId(walletId);
					if(id != "" && id != null){
						
						obj_customerLedger.setWalletProgramId(id);
					}
					obj_customerLedger.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
					
					
				//	System.out.println("Request get_wallets_ledgers:::::::"+gson.toJson(obj_customerLedger));
					
					 result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_wallets_ledgers"), gson.toJson(obj_customerLedger),"GET");

				//	System.out.println("Response get_wallets_ledgers:::::::"+result);
					
					
					String responseCode = Response.getResponseCode(result);
					if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
					{
						obj_customerLedger = gson.fromJson(result,CustomerLedger.class);
						list_customerLedger = obj_customerLedger.getCustomerLedgers();
						list_customerLedger.get(0).setTotalRecords((obj_customerLedger.getTotalRecords()));
						list_customerLedger.get(0).setFilePath(obj_customerLedger.getFilePath());
					}
					
				}catch (NoSuchElementException nse) {
					nse.printStackTrace();
					result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
				} catch(Exception e){
					e.printStackTrace();
				}
				////////////System.out.println("After get_wallets_ledgers:::::::"+gson.toJson(list_customerLedger));
				return list_customerLedger;
			}



			
			
			

	public String importService(String fileName, String customerId, String emailId) {
		String resultStr = null;

		try {
			Customer customerObj = new Customer();
			customerObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			customerObj.setUploadedfilePath(fileName);
	///		System.out.println("Request String:::::::" + gson.toJson(customerObj));

			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("upload_customer_group_new"), gson.toJson(customerObj),"POST");

		///	System.out.println(resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if (responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())) {
				resultStr = Response.getResponseMessage(resultStr);
			} else {
				resultStr = Response.getResponseMessage(resultStr);
			}
		} catch (ConnectException ce) {
			ce.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("CONNECTION_TIMEOUT").trim();
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
		} catch (RemoteException rme) {
			rme.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		} catch (Exception e) {
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		}
		return resultStr;
	}


			


	
	
	public List<CustomerWalletMaster> exportWallet(String customerIdStr,String emailIdStr,String location,String zone,String startdate,String enddate ,String WalletStatusList,String searchName,String id,String index,String maxRecords,String childsearch,boolean saveFlag){
		String result = null;
		List<CustomerWalletMaster> list_customerLedger = null;
		RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
		try 
		{
			CustomerLedger obj_customerLedger = new CustomerLedger();
			
			if(!obj_customerLedger.equals(""))
				obj_customerLedger.setLocation(location);
			
			obj_customerLedger.setZone(zone);
			obj_customerLedger.setStartdate(startdate);
			obj_customerLedger.setEnddate(enddate);
			
			if(searchName !="")
			{
				
				if(childsearch.equals("true")){
					obj_customerLedger.setSearchCriteria("");
				}else{
					obj_customerLedger.setSearchCriteria(searchName);

				}
				obj_customerLedger.setWalletMaxRecords(maxRecords);
				obj_customerLedger.setWalletStartIndex(index);
				obj_customerLedger.setStartIndex("0");
				obj_customerLedger.setMaxRecords("10");
			}
			else
			{
				obj_customerLedger.setSearchCriteria(searchName);
				obj_customerLedger.setWalletMaxRecords("10");
				obj_customerLedger.setWalletStartIndex("0");
				obj_customerLedger.setStartIndex(index);
				obj_customerLedger.setMaxRecords(maxRecords);
			}
			
			
			if(childsearch.equals("true")){
				obj_customerLedger.setWalletSearchCriteria(searchName);
			}
			
			obj_customerLedger.setWalletStatus(WalletStatusList);
			obj_customerLedger.setWalletProgramStatus(WalletStatusList);
			
			
			if(id != "" && id != null){
				
				obj_customerLedger.setWalletProgramId(id);
			}
			
			
			obj_customerLedger.setSaveFile(saveFlag);
			
			obj_customerLedger.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String:::::::"+gson.toJson(obj_customerLedger));
			
		//	System.out.println("Request String:::::::"+gson.toJson(obj_customerLedger));
			
			 result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_wallets"), gson.toJson(obj_customerLedger),"GET");
            
			// System.out.println("Response String:::::::"+result);
			
			// log.info("Response String:::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
			{
			
				obj_customerLedger = gson.fromJson(result,CustomerLedger.class);
				
				list_customerLedger = obj_customerLedger.getCustomerWallets();
				
				
					list_customerLedger.get(0).setTotalWallets((list_customerLedger.get(0).getTotalWallets()));
				
					list_customerLedger.get(0).setTotalRecords((obj_customerLedger.getTotalRecords()));
					list_customerLedger.get(0).setFilePath(obj_customerLedger.getFilePath());
				
				
			}
			
		}catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		////////////System.out.println("after String:::::::"+gson.toJson(list_customerLedger));
		return list_customerLedger;
	}






	
	
}
