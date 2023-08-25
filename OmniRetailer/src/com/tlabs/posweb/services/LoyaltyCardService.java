package com.tlabs.posweb.services;

import java.rmi.ConnectException;
import java.rmi.RemoteException;
import java.rmi.UnknownHostException;
//import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
//import java.util.Calendar;
//import java.util.Date;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Set;

import com.tlabs.posweb.init.AppProperties;
import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.technolabssoftware.www.GiftCouponsProxy;
import com.technolabssoftware.www.GiftVouchersProxy;
import com.tlabs.posweb.beans.CustomerSubscription;
//import com.technolabssoftware.www.LoyaltycardProxy;
import com.tlabs.posweb.beans.GiftCoupons;
import com.tlabs.posweb.beans.GiftCouponsMaster;
import com.tlabs.posweb.beans.GiftCouponsResponse;
import com.tlabs.posweb.beans.GiftVoucherMaster;
import com.tlabs.posweb.beans.LoyaltyCardMaster;
import com.tlabs.posweb.beans.MembershipMaster;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
import com.tlabs.posweb.util.RestfulServiceConnection;
//import com.tlabs.posweb.util.Utilities;

public class LoyaltyCardService {
	@Autowired
	private Gson gson;
	@Autowired
	SessionScope sessionScope;
//	private static Logger log = Logger.getLogger(LoyaltyCardService.class);
	
	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to call createLoyaltyCards method of web service and return the response
	 *
	 **//*
	public String createLayoutCards(LoyaltyCardMaster loyaltyCardMaster,String customerId,String emailId){
		String result = null;
		try {
			LoyaltycardProxy loyaltycardProxy = new LoyaltycardProxy();
			loyaltyCardMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			// log.info("Request String::::::::::::"+gson.toJson(loyaltyCardMaster));
			//////////////////System.out.println("Request String::::::::::::"+gson.toJson(loyaltyCardMaster));
			result = loyaltycardProxy.createLoyaltyCards(gson.toJson(loyaltyCardMaster));
			
			// log.info("Response String:::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("LOYALTY_CREATE_SUCCESS").trim();
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
	*/
	
	
	public GiftVoucherMaster getGiftVouchersForSearchCriteria(String voucherProgramCode,String customerId,String emailId,String index,String searchCriteria,String maxRecords,boolean save)
	{
		String result = null;
		//Set<GiftVouchers> vouchersList = null;
		GiftVoucherMaster objResponse=null;
		RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
		try {
			GiftVoucherMaster obj_loyaltyCardsMaster = new GiftVoucherMaster();
			objResponse = new GiftVoucherMaster();
			//vouchersList = new HashSet<GiftVouchers>();
			obj_loyaltyCardsMaster.setStartIndex(index);
			obj_loyaltyCardsMaster.setMaxRecords(maxRecords);
			obj_loyaltyCardsMaster.setSearchCriteria(searchCriteria);
			obj_loyaltyCardsMaster.setVoucherProgramCode(voucherProgramCode);
			obj_loyaltyCardsMaster.setSaveGiftVoucherFlag(save);
			obj_loyaltyCardsMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String:::::::"+gson.toJson(obj_loyaltyCardsMaster));
			//////////////System.out.println(gson.toJson(obj_loyaltyCardsMaster));
			result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_vouchersBySearchCriteria"), gson.toJson(obj_loyaltyCardsMaster),"GET");
			////////////////System.out.println(result);

			// log.info("Response String:::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				objResponse = gson.fromJson(result, GiftVoucherMaster.class);
				//vouchersList  = objResponse.getGiftVouchers();
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
		return objResponse;
	}
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to call createLoyaltyCards method of web service and return the response
	 * 
	 * @modifications Vijay
	 * @desc modified soap call to restful service call
	 * @date 31/02/18
	 */
	public String createLayoutCards(LoyaltyCardMaster loyaltyCardMaster,String customerId,String emailId){
		String result = null;
		try {
//			LoyaltycardProxy loyaltycardProxy = new LoyaltycardProxy();
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			restfulConnectionObj = new RestfulServiceConnection();
		//	////////////////System.out.println(loyaltyCardMaster.getRequiredOTP());
			
			if(loyaltyCardMaster.getRequiredOTP().equals("0"))
			{
				loyaltyCardMaster.setOTPRequirement(true);
				
			}
			loyaltyCardMaster.setRequiredOTP(null);
			
			if(loyaltyCardMaster.getAutoIssueFlag().equals("0"))
				loyaltyCardMaster.setAutoIssue(true);
		if(loyaltyCardMaster.getAutoIssueFlag().equals("0"))
			loyaltyCardMaster.setAutoIssue(true);
	
		loyaltyCardMaster.setAutoIssueFlag(null);
		
			loyaltyCardMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			// log.info("Request String::::::::::::"+gson.toJson(loyaltyCardMaster));
			//System.out.println("loyalty Create Request String:::::"+gson.toJson(loyaltyCardMaster));
			//result = loyaltycardProxy.createLoyaltyCards(loyaltyCardMaster);
			
			result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_Loyalty_Card"), gson.toJson(loyaltyCardMaster));
			
			// log.info("Response String:::::::::::"+result);
			////////System.out.println("Response String::::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("LOYALTY_CREATE_SUCCESS").trim();
			}
			else{
				//result = "Couldn't create, please try after some time";
				result = Response.getResponseMessage(result); 
			}
		}
		catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} 
		catch (Exception ex) {
			ex.printStackTrace();
			result = AppProperties.getAppMessageByProperty("LOYALTY_CREATE_FAILURE").trim();
		} 
		
		return result;
	}
	
	
	/**
	 * 
	 * @author: VIJAY
	 * 
	 * @desc: This method is used to call updateLoyaltyCards method of (RestFul)LoyaltyCard web service and return the response as String
	 * @Writtendate: 05/03/18
	 */
	public  String updateLayoutCards(LoyaltyCardMaster loyaltyCardMaster,String customerId,String emailId){
        String result = null;
        try {

                RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
                restfulConnectionObj = new RestfulServiceConnection();
                if(!loyaltyCardMaster.getRequiredOTP().equals(null)&& loyaltyCardMaster.getRequiredOTP().equals("0"))
                        loyaltyCardMaster.setOTPRequirement(true);
                if(loyaltyCardMaster.getAutoIssueFlag().equals("0"))
                        loyaltyCardMaster.setAutoIssue(true);
                loyaltyCardMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
                // log.info("Request String::::::::::::"+gson.toJson(loyaltyCardMaster));
                //////////System.out.println("update req : "+ gson.toJson(loyaltyCardMaster));
                result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_Loyalty_Card"), gson.toJson(loyaltyCardMaster));
                // log.info("Response String:::::::::::"+result);

             //////////System.out.println(result);
                String responseCode = Response.getResponseCode(result);
                if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
                        result = AppProperties.getAppMessageByProperty("LOYALTY_UPDATE_SUCCESS").trim();
                }
                else{
                        //result = "Couldn't create, please try after some time";
                        result = Response.getResponseMessage(result);
                        //////////////////System.out.println("result: "+ result);
                }
        }
        catch (NoSuchElementException nse) {
                nse.printStackTrace();
                result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
        } 
        catch (Exception ex) {
                ex.printStackTrace();
                result = AppProperties.getAppMessageByProperty("LOYALTY_UPDATE_FAILURE").trim();
        } 
        
        return result;
}






	/**
	 * @author Mythri.S	
	 * 
	 * This method is used to call the getLoyaltyCards method of web service and return the Loyalty Cards List
	 * 
	 *//*
	public List<LoyaltyCardMaster> getLoyaltyCards(String loyaltyProgramNumber,String customerId,String emailId,String index){
		String result = null;
		List<LoyaltyCardMaster> list_loyaltyCardMaster = null;
		try {
			LoyaltycardProxy loyaltycardProxy = new LoyaltycardProxy();
			LoyaltyCardMaster obj_loyaltyCardMaster = new LoyaltyCardMaster();
			if(!loyaltyProgramNumber.equals(""))
				obj_loyaltyCardMaster.setLoyaltyProgramNumber(loyaltyProgramNumber);
			obj_loyaltyCardMaster.setStartIndex(index);
			obj_loyaltyCardMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String:::::::"+gson.toJson(obj_loyaltyCardMaster));
			result = loyaltycardProxy.getLoyaltyCards(gson.toJson(obj_loyaltyCardMaster));
			// log.info("Response String:::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				String responseList = Response.getResponseList(result, "loyaltyCardsList");
				JSONArray jsonResponseArray = new JSONArray(responseList);
				list_loyaltyCardMaster = new ArrayList<LoyaltyCardMaster>();
				for (int i=0; i<jsonResponseArray.length(); i++) {
					obj_loyaltyCardMaster = gson.fromJson(jsonResponseArray.getString(i), LoyaltyCardMaster.class);
					Date date = null;
					Calendar c = Calendar.getInstance();
					SimpleDateFormat  formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					date = formatter.parse(obj_loyaltyCardMaster.getValidFrom());
					c.setTime(date);
					int mon = c.get(Calendar.MONTH) +1;
					String validFrom = c.get(Calendar.DATE) +"/"+ mon +"/"+ c.get(Calendar.YEAR);
					date = formatter.parse(obj_loyaltyCardMaster.getValidTo());
					c.setTime(date);
					mon = c.get(Calendar.MONTH) +1;
					String validTo = c.get(Calendar.DATE) +"/"+ mon +"/"+ c.get(Calendar.YEAR);
					obj_loyaltyCardMaster.setValidFrom(validFrom);
					obj_loyaltyCardMaster.setValidTo(validTo);
					obj_loyaltyCardMaster.setQuantity(obj_loyaltyCardMaster.getLoyaltyCards().size());
					list_loyaltyCardMaster.add(obj_loyaltyCardMaster);
				}
				list_loyaltyCardMaster.get(0).setTotalRecords(Response.getResponseTotalRecords(result));
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
		return list_loyaltyCardMaster;
	}*/
	/**
	 * @author Mythri.S	
	 * 
	 * This method is used to call the getLoyaltyCards method of web service and return the Loyalty Cards List
	 * 
	 * @modifications Vijay
	 * @desc modified soap call to restful
	 * @date 31/02/18
	 */
	public List<LoyaltyCardMaster> getLoyaltyCards(String loyaltyProgramNumber,String customerId,String emailId,String index,String maxRecords){
		String result = null;
		List<LoyaltyCardMaster> list_loyaltyCardMaster = null;
		RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
		try 
		{
			LoyaltyCardMaster obj_loyaltyCardMaster = new LoyaltyCardMaster();
			
			if(!loyaltyProgramNumber.equals(""))
				obj_loyaltyCardMaster.setLoyaltyProgramNumber(loyaltyProgramNumber);
			
			obj_loyaltyCardMaster.setStartIndex(index);
			obj_loyaltyCardMaster.setMaxRecords(maxRecords);
			obj_loyaltyCardMaster.setCustomerLoyaltyCardFlag(true);
			
			obj_loyaltyCardMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//System.out.println("edit get Request String:::::::"+gson.toJson(obj_loyaltyCardMaster));
			
	///		System.out.println("Request String:::::::"+gson.toJson(obj_loyaltyCardMaster));
			result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Loyalty_Card"), gson.toJson(obj_loyaltyCardMaster), "GET");
			
	///		System.out.println(result);
			
			// log.info("Response String:::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
			{
			//	String responseList = Response.getResponseList(result, "loyaltyCardsList");
				//JSONArray jsonResponseArray = new JSONArray(responseList);
				obj_loyaltyCardMaster = gson.fromJson(result,LoyaltyCardMaster.class);
				
				list_loyaltyCardMaster = obj_loyaltyCardMaster.getLoyaltyCardsList();
				
			/*	for (int i=0; i<jsonResponseArray.length(); i++) {
					obj_loyaltyCardMaster = gson.fromJson(jsonResponseArray.getString(i), LoyaltyCardMaster.class);
					Date date = null;
					Calendar c = Calendar.getInstance();
					SimpleDateFormat  formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
					date = formatter.parse(obj_loyaltyCardMaster.getValidFrom());
					c.setTime(date);
					int mon = c.get(Calendar.MONTH) +1;
					String validFrom = c.get(Calendar.DATE) +"/"+ mon +"/"+ c.get(Calendar.YEAR);
					date = formatter.parse(obj_loyaltyCardMaster.getValidTo());
					c.setTime(date);
					mon = c.get(Calendar.MONTH) +1;
					String validTo = c.get(Calendar.DATE) +"/"+ mon +"/"+ c.get(Calendar.YEAR);
					obj_loyaltyCardMaster.setValidFrom(validFrom);
					obj_loyaltyCardMaster.setValidTo(validTo);
					obj_loyaltyCardMaster.setQuantity(obj_loyaltyCardMaster.getLoyaltyCards().size());
					list_loyaltyCardMaster.add(obj_loyaltyCardMaster);
				}*/
				list_loyaltyCardMaster.get(0).setTotalRecords(Response.getResponseTotalRecords(result));
				list_loyaltyCardMaster.get(0).setTotalLoyaltyCards(list_loyaltyCardMaster.get(0).getTotalLoyaltyCards());
			}
			else
			{
//				String responseMessage = Response.getResponseMessage(result);
//				obj_loyaltyCardMaster.setResponseMessage(responseMessage);
//				obj_loyaltyCardMaster.setResponseCode("-1");
			//	list_loyaltyCardMaster.set(0, obj_loyaltyCardMaster);
			}
		}catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return list_loyaltyCardMaster;
	}
	

	/**
	 * @author Mythri.S	
	 * 
	 * This method is used to call the getGiftVouchers method of web service and return the Gift Vouchers List
	 * 
	 */
	public List<GiftVoucherMaster> getGiftVouchers(String voucherProgramCode,String maxRecords, String customerId,String emailId,String index,String operation){
		String result = null;
		List<GiftVoucherMaster> list_giftVoucherMaster = null;
		try {
			//GiftVouchersProxy giftVouchersProxy = new GiftVouchersProxy();
			GiftVoucherMaster obj_GiftVoucherMaster = new GiftVoucherMaster();
			if(!voucherProgramCode.equals(""))
				obj_GiftVoucherMaster.setVoucherProgramCode(voucherProgramCode);
			obj_GiftVoucherMaster.setStartIndex(index);
			
			
				obj_GiftVoucherMaster.setVoucherUpdateFlag(true);
				obj_GiftVoucherMaster.setVoucherUpdate(true);
		
			
			if(maxRecords != null && !maxRecords.trim().equals(""))
				obj_GiftVoucherMaster.setMaxRecords(maxRecords);
			else
				obj_GiftVoucherMaster.setMaxRecords("0");
			obj_GiftVoucherMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String:::::::"+gson.toJson(obj_GiftVoucherMaster ));
			//////////////System.out.println("Request String:::::::"+gson.toJson(obj_GiftVoucherMaster ));
		//	result = giftVouchersProxy.getGiftVouchers(gson.toJson(obj_GiftVoucherMaster ));
			result = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("get_vouchers"), gson.toJson(obj_GiftVoucherMaster),"GET");
			//////////////System.out.println(result);
			// log.info("Response String:::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				String responseList = Response.getResponseList(result, "giftVouchersList");
				JSONArray jsonResponseArray = new JSONArray(responseList);
				list_giftVoucherMaster = new ArrayList<GiftVoucherMaster>();
				for (int i=0; i<jsonResponseArray.length(); i++) {
					obj_GiftVoucherMaster = gson.fromJson(jsonResponseArray.getString(i), GiftVoucherMaster.class);
					/*Date date = null;
					Calendar c = Calendar.getInstance();
					SimpleDateFormat  formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					date = formatter.parse(obj_GiftVoucherMaster.getCreatedOn());
					c.setTime(date);
					int mon = c.get(Calendar.MONTH) +1;
					String createdOn = c.get(Calendar.DATE) +"/"+ mon +"/"+ c.get(Calendar.YEAR);
					date = formatter.parse(obj_GiftVoucherMaster.getExpiryDate());
					c.setTime(date);
					mon = c.get(Calendar.MONTH) +1;
					String expiryDate = c.get(Calendar.DATE) +"/"+ mon +"/"+ c.get(Calendar.YEAR);
					obj_GiftVoucherMaster.setCreatedOn(createdOn);
					obj_GiftVoucherMaster.setExpiryDate(expiryDate);*/
//					obj_GiftVoucherMaster.setQuantity(obj_GiftVoucherMaster.getGiftVouchers().size());
					if(!voucherProgramCode.equals("")){
						String locations = "";
						if(obj_GiftVoucherMaster.getLocationsList() != null)
						for(String location : obj_GiftVoucherMaster.getLocationsList())
							locations = locations+location+",";
						if(!locations.equals("") && locations.substring(locations.length()-1, locations.length()).equals(","))
							locations = locations.substring(0, locations.length()-1);
						obj_GiftVoucherMaster.setLocations(locations);
					}
//						obj_GiftVoucherMaster.setVoucherProgramCode(voucherProgramCode);
					list_giftVoucherMaster.add(obj_GiftVoucherMaster);
				}
				list_giftVoucherMaster.get(0).setTotalRecords(Response.getResponseTotalRecords(result));
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
		return list_giftVoucherMaster;
	}
	/**
	 * @author Mythri.S	
	 * 
	 * This method is used to call the getGiftVouchers method of web service and return the Gift Vouchers List
	 * 
	 *//*
	public List<GiftVoucherMaster> getGiftVouchers(String voucherProgramCode,String customerId,String emailId,String index){
		String result = null;
		List<GiftVoucherMaster> list_giftVoucherMaster = null;
		try {
			GiftVouchersProxy giftVouchersProxy = new GiftVouchersProxy();
			GiftVoucherMaster obj_GiftVoucherMaster = new GiftVoucherMaster();
			if(!voucherProgramCode.equals(""))
				obj_GiftVoucherMaster.setVoucherProgramCode(voucherProgramCode);
			obj_GiftVoucherMaster.setStartIndex(index);
			obj_GiftVoucherMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String:::::::"+gson.toJson(obj_GiftVoucherMaster ));
			result = giftVouchersProxy.getGiftVouchers(gson.toJson(obj_GiftVoucherMaster ));
			// log.info("Response String:::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				String responseList = Response.getResponseList(result, "giftVouchersList");
				JSONArray jsonResponseArray = new JSONArray(responseList);
				list_giftVoucherMaster = new ArrayList<GiftVoucherMaster>();
				for (int i=0; i<jsonResponseArray.length(); i++) {
					obj_GiftVoucherMaster = gson.fromJson(jsonResponseArray.getString(i), GiftVoucherMaster.class);
					Date date = null;
					Calendar c = Calendar.getInstance();
					SimpleDateFormat  formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					date = formatter.parse(obj_GiftVoucherMaster.getCreatedOn());
					c.setTime(date);
					int mon = c.get(Calendar.MONTH) +1;
					String createdOn = c.get(Calendar.DATE) +"/"+ mon +"/"+ c.get(Calendar.YEAR);
					date = formatter.parse(obj_GiftVoucherMaster.getExpiryDate());
					c.setTime(date);
					mon = c.get(Calendar.MONTH) +1;
					String expiryDate = c.get(Calendar.DATE) +"/"+ mon +"/"+ c.get(Calendar.YEAR);
					obj_GiftVoucherMaster.setCreatedOn(createdOn);
					obj_GiftVoucherMaster.setExpiryDate(expiryDate);
//					obj_GiftVoucherMaster.setQuantity(obj_GiftVoucherMaster.getGiftVouchers().size());
					if(!voucherProgramCode.equals("")){
						String locations = "";
						if(obj_GiftVoucherMaster.getLocationsList() != null)
						for(String location : obj_GiftVoucherMaster.getLocationsList())
							locations = locations+location+",";
						if(!locations.equals("") && locations.substring(locations.length()-1, locations.length()).equals(","))
							locations = locations.substring(0, locations.length()-1);
						obj_GiftVoucherMaster.setLocations(locations);
					}
//						obj_GiftVoucherMaster.setVoucherProgramCode(voucherProgramCode);
					list_giftVoucherMaster.add(obj_GiftVoucherMaster);
				}
				list_giftVoucherMaster.get(0).setTotalRecords(Response.getResponseTotalRecords(result));
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
		return list_giftVoucherMaster;
	}*/
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to call createGiftVouchers method of web service and return the response
	 *
	 **//*
	public String createGiftVouchers(GiftVoucherMaster giftVoucherMaster,String customerId,String emailId){
		String result = null;
		try {
			GiftVouchersProxy giftVouchersProxy = new GiftVouchersProxy();
			giftVoucherMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			String[] locationsList = giftVoucherMaster.getLocations().split(",");
			giftVoucherMaster.setLocationsList(locationsList);
			// log.info("Request String::::::::::::"+gson.toJson(giftVoucherMaster));
			result = giftVouchersProxy.createGiftVouchers(gson.toJson(giftVoucherMaster));
			// log.info("Response String:::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("GIFTVOUCHERS_CREATE_SUCCESS").trim();
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
	*/
	

public String createGiftVouchers(GiftVoucherMaster giftVoucherMaster,String customerId,String emailId){
		String result = null;
		try {
//			GiftVouchersProxy giftVouchersProxy = new GiftVouchersProxy();
			giftVoucherMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			List<String> zones = new ArrayList<String>(Arrays.asList(giftVoucherMaster.getZone().split(",")));
			
			List<String> zonelocations = new ArrayList<String>(Arrays.asList(giftVoucherMaster.getLocations().split(",")));
			giftVoucherMaster.setZoneLocations(zonelocations);
			giftVoucherMaster.setZones(zones);
			if(giftVoucherMaster.getMultipleInt() != null && giftVoucherMaster.getMultipleInt() == 1)
				giftVoucherMaster.setMultiple(true);
			
			
			if(giftVoucherMaster.getAssignedStatusStr().equals("0"))
				giftVoucherMaster.setAssigned_voucher(true);
			else
				giftVoucherMaster.setAssigned_voucher(false);
			
			// log.info("Request String::::::::::::"+gson.toJson(giftVoucherMaster));
//			result = giftVouchersProxy.createGiftVouchers(gson.toJson(giftVoucherMaster));
	///		System.out.println("Request String::::::::::::Create giftVoucherMaster::"+gson.toJson(giftVoucherMaster));
			result = new RestfulServiceConnection().getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_gift_voucher"), gson.toJson(giftVoucherMaster));
			////////////////System.out.println(result);
			
			// log.info("Response String:::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("GIFTVOUCHERS_CREATE_SUCCESS").trim();
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
	
	


public String updateGiftVouchers(GiftVoucherMaster giftVoucherMaster,String customerId,String emailId){
    String result = null;
    try {
            //GiftVouchersProxy giftVouchersProxy = new GiftVouchersProxy();
            giftVoucherMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
            
            List<String> zones = new ArrayList<String>(Arrays.asList(giftVoucherMaster.getZone().split(",")));
            
            List<String> zonelocations = new ArrayList<String>(Arrays.asList(giftVoucherMaster.getLocations().split(",")));
            giftVoucherMaster.setZoneLocations(zonelocations);
            giftVoucherMaster.setZones(zones);
            
            if(giftVoucherMaster.getMultipleInt() != null && giftVoucherMaster.getMultipleInt() == 1)
                    giftVoucherMaster.setMultiple(true);
            
            
            if(giftVoucherMaster.getAssignedStatusStr().equals("0"))
                    giftVoucherMaster.setAssigned_voucher(true);
            else
                    giftVoucherMaster.setAssigned_voucher(false);
            
            
            giftVoucherMaster.setVoucherUpdate(true);
            giftVoucherMaster.setVoucherUpdateFlag(true);
            
            //// log.info("Request String::::::::::::"+gson.toJson(giftVoucherMaster));
//            result = giftVouchersProxy.createGiftVouchers(gson.toJson(giftVoucherMaster));
        ///    System.out.println("Request String::::::::::::giftVoucherMaster:"+gson.toJson(giftVoucherMaster));
            result = new RestfulServiceConnection().getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_gift_voucherLatest"), gson.toJson(giftVoucherMaster));
            ////////////////System.out.println(result);

            //// log.info("Response String:::::::::::"+result);
            String responseCode = Response.getResponseCode(result);
            if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
                    result = AppProperties.getAppMessageByProperty("GIFTVOUCHERS_UPDATE_SUCCESS").trim();
            }
            else{
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
 * 
 * This method is used to call the getGiftCoupons method of web service and return the Gift Coupons List
 * 
 */
public List<GiftCouponsMaster> getGiftCoupons(String couponsProgramCode,String customerId,String emailId,String index,String searchlocation,String zone,String startDate,String endDate,String searchName,String locationListAll,String maxRecords){
	String result = null;
	List<GiftCouponsMaster> list_giftCouponsMaster = null;
	RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
	try {
	//	GiftCouponsProxy obj_giftCouponsProxy = new GiftCouponsProxy();
		GiftCouponsMaster obj_GiftCouponsMaster = new GiftCouponsMaster();
		if(!couponsProgramCode.equals(""))
			obj_GiftCouponsMaster.setCouponProgramCode(couponsProgramCode);
		obj_GiftCouponsMaster.setStartIndex(index);
		obj_GiftCouponsMaster.setZoneId(zone);
		obj_GiftCouponsMaster.setMaxRecords(maxRecords);
		obj_GiftCouponsMaster.setStartDate(startDate);
		obj_GiftCouponsMaster.setEndDate(endDate);
		obj_GiftCouponsMaster.setSearchCriteria(searchName);
		
	if(couponsProgramCode.equals(""))	
       if(searchlocation.equals("all") || searchlocation.equals("")){
			List<String> myList = new ArrayList<String>(Arrays.asList(locationListAll.split(",")));
			obj_GiftCouponsMaster.setAllLocationsList(myList);
			}
			else
		   obj_GiftCouponsMaster.setLocations(searchlocation);
	
		
		obj_GiftCouponsMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		//// log.info("Request String:::::::"+gson.toJson(obj_GiftCouponsMaster));
		//System.out.println("Request String:::::::"+gson.toJson(obj_GiftCouponsMaster));
		result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Gift_Coupons_Master_New"), gson.toJson(obj_GiftCouponsMaster),"GET");
//		obj_giftCouponsProxy.getGiftCouponsMaster(gson.toJson(obj_GiftCouponsMaster));
		//// log.info("Response String:::::::"+result);
		//System.out.println("Response String:::::::"+result);
		String responseCode = Response.getResponseCode(result);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			String responseList = Response.getResponseList(result, "giftCouponsList");
			JSONArray jsonResponseArray = new JSONArray(responseList);
			list_giftCouponsMaster = new ArrayList<GiftCouponsMaster>();
			for (int i=0; i<jsonResponseArray.length(); i++) {
				obj_GiftCouponsMaster = gson.fromJson(jsonResponseArray.getString(i), GiftCouponsMaster.class);
				/*Date date = null;
				Calendar c = Calendar.getInstance();
				SimpleDateFormat  formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				date = formatter.parse(obj_GiftCouponsMaster.getCreatedOn());
				c.setTime(date);
				int mon = c.get(Calendar.MONTH) +1;
				String createdOn = c.get(Calendar.DATE) +"/"+ mon +"/"+ c.get(Calendar.YEAR);
				date = formatter.parse(obj_GiftCouponsMaster.getExpiryDate());
				c.setTime(date);
				mon = c.get(Calendar.MONTH) +1;
				String expiryDate = c.get(Calendar.DATE) +"/"+ mon +"/"+ c.get(Calendar.YEAR);
				obj_GiftCouponsMaster.setCreatedOn(createdOn);
				obj_GiftCouponsMaster.setExpiryDate(expiryDate);
				obj_GiftCouponsMaster.setQuantity(obj_GiftCouponsMaster.getGiftCoupons().size());*/
//				if(!couponsProgramCode.equals("")){
//					obj_GiftCouponsMaster.setCouponProgramCode(couponsProgramCode);
//					String locations = obj_GiftCouponsMaster.getl
					
//				}
				if(!couponsProgramCode.equals("")){
					String locations = "";
					if(obj_GiftCouponsMaster.getLocationsList() != null)
					for(String location : obj_GiftCouponsMaster.getLocationsList())
						locations = locations+location+",";
					if(!locations.equals("") && locations.substring(locations.length()-1, locations.length()).equals(","))
						locations = locations.substring(0, locations.length()-1);
					obj_GiftCouponsMaster.setLocations(locations);
				}
				list_giftCouponsMaster.add(obj_GiftCouponsMaster);
			}
			list_giftCouponsMaster.get(0).setTotalRecords(Response.getResponseTotalRecords(result));
			list_giftCouponsMaster.get(0).setTotolGiftCoupons(obj_GiftCouponsMaster.getTotolGiftCoupons());
			
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
	
	return list_giftCouponsMaster;
}

	
	
	/*
	
	public List<GiftCoupons> getGiftCouponsBySearchCreiteria(String couponsProgramCode,String customerId,String emailId,String index,String searchlocation,String zone,String startDate,String endDate,String searchName,boolean saveFlag,String maxRecords){
		String result = null;
		List<GiftCouponsMaster> list_giftCouponsMaster = null;
		List<GiftCoupons> giftCouponsList = null;
		GiftCoupons giftCoupons  =null;
		GiftCouponsResponse giftCouponsResponse=null;
		RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
		try {
			GiftCouponsMaster obj_GiftCouponsMaster = new GiftCouponsMaster();
			giftCouponsResponse = new GiftCouponsResponse();
			 giftCoupons = new GiftCoupons();
			 giftCouponsList = new ArrayList<GiftCoupons>();
			obj_GiftCouponsMaster.setStartIndex(index);
			obj_GiftCouponsMaster.setMaxRecords(maxRecords);
			obj_GiftCouponsMaster.setSearchCriteria(searchName);
			obj_GiftCouponsMaster.setSaveGRNFlag(saveFlag);
			obj_GiftCouponsMaster.setCouponProgramCode(couponsProgramCode);
			obj_GiftCouponsMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			
			if(saveFlag == true || searchName != ""){
			
			// log.info("Request String:::::::"+gson.toJson(obj_GiftCouponsMaster));
			//////////////System.out.println("get coupons by search Request String:::::::"+gson.toJson(obj_GiftCouponsMaster));
			result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_CouponsBySearchCriteria"), gson.toJson(obj_GiftCouponsMaster),"GET");
//			obj_giftCouponsProxy.getGiftCouponsMaster(gson.toJson(obj_GiftCouponsMaster));
			// log.info("Response String:::::::"+result);
			//////////////System.out.println("get coupons by search Response String:::::::"+result);
			
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				list_giftCouponsMaster = new ArrayList<GiftCouponsMaster>();
				giftCouponsResponse = gson.fromJson(result, GiftCouponsResponse.class);
				giftCouponsList  = giftCouponsResponse.getGiftCoupons();
//				if(giftCouponsResponse.getTotalRecords()
				giftCouponsList.get(0).setTotalRecords(giftCouponsResponse.getTotalRecords());
				giftCouponsList.get(0).setFilePath(giftCouponsResponse.getFilePath());
				
			}
			}
			else{
				
				   //////////////System.out.println("Request String:::::::"+gson.toJson(obj_GiftCouponsMaster));
					result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Gift_Coupons_Master"), gson.toJson(obj_GiftCouponsMaster),"GET");
//					obj_giftCouponsProxy.getGiftCouponsMaster(gson.toJson(obj_GiftCouponsMaster));
					//// log.info("Response String:::::::"+result);
					//////////////System.out.println("Response String:::::::"+result);
					String responseCode = Response.getResponseCode(result);
					if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
						String responseList = Response.getResponseList(result, "giftCouponsList");
						JSONArray jsonResponseArray = new JSONArray(responseList);
						list_giftCouponsMaster = new ArrayList<GiftCouponsMaster>();
						for (int i=0; i<jsonResponseArray.length(); i++) {
							obj_GiftCouponsMaster = gson.fromJson(jsonResponseArray.getString(i), GiftCouponsMaster.class);
							
								
//							}
							if(!couponsProgramCode.equals("")){
								String locations = "";
								if(obj_GiftCouponsMaster.getLocationsList() != null)
								for(String location : obj_GiftCouponsMaster.getLocationsList())
									locations = locations+location+",";
								if(!locations.equals("") && locations.substring(locations.length()-1, locations.length()).equals(","))
									locations = locations.substring(0, locations.length()-1);
								obj_GiftCouponsMaster.setLocations(locations);
							}
							list_giftCouponsMaster.add(obj_GiftCouponsMaster);
						}
						list_giftCouponsMaster.get(0).setTotalRecords(Response.getResponseTotalRecords(result));
						list_giftCouponsMaster.get(0).setTotolGiftCoupons(obj_GiftCouponsMaster.getTotolGiftCoupons());
				
				
				
			}
			}
		}
		catch(ConnectException ce) {
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
		return giftCouponsList;
	} 

	
*/	





public List<GiftCoupons> getGiftCouponsBySearchCreiteria(String couponsProgramCode,String customerId,String emailId,String index,String searchlocation,String zone,String startDate,String endDate,String searchName,boolean saveFlag,String maxRecords){
	String result = null;
	List<GiftCouponsMaster> list_giftCouponsMaster = null;
	List<GiftCoupons> giftCouponsList = null;
	GiftCoupons giftCoupons  =null;
	GiftCouponsResponse giftCouponsResponse=null;
	RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
	try {
		GiftCouponsMaster obj_GiftCouponsMaster = new GiftCouponsMaster();
		giftCouponsResponse = new GiftCouponsResponse();
		 giftCoupons = new GiftCoupons();
		 giftCouponsList = new ArrayList<GiftCoupons>();
		obj_GiftCouponsMaster.setStartIndex(index);
		obj_GiftCouponsMaster.setMaxRecords(maxRecords);
		obj_GiftCouponsMaster.setSearchCriteria(searchName);
		obj_GiftCouponsMaster.setSaveGRNFlag(saveFlag);
		obj_GiftCouponsMaster.setCouponProgramCode(couponsProgramCode);
		obj_GiftCouponsMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		
		
		//if(saveFlag == true || searchName != ""){
		
		// log.info("Request String:::::::"+gson.toJson(obj_GiftCouponsMaster));
    ///     System.out.println("get coupons by search Request String:::::::"+gson.toJson(obj_GiftCouponsMaster));
		result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_CouponsBySearchCriteria"), gson.toJson(obj_GiftCouponsMaster),"GET");
//		obj_giftCouponsProxy.getGiftCouponsMaster(gson.toJson(obj_GiftCouponsMaster));
		// log.info("Response String:::::::"+result);
   ///      System.out.println("get coupons by search Response String:::::::"+result);
		
		String responseCode = Response.getResponseCode(result);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			list_giftCouponsMaster = new ArrayList<GiftCouponsMaster>();
			giftCouponsResponse = gson.fromJson(result, GiftCouponsResponse.class);
			giftCouponsList  = giftCouponsResponse.getGiftCoupons();
//			if(giftCouponsResponse.getTotalRecords()
			giftCouponsList.get(0).setTotalRecords(giftCouponsResponse.getTotalRecords());
			giftCouponsList.get(0).setFilePath(giftCouponsResponse.getFilePath());
			
		}
	/*	}
		else{
			   //////////////System.out.println("Request String:::::::"+gson.toJson(obj_GiftCouponsMaster));
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Gift_Coupons_Master"), gson.toJson(obj_GiftCouponsMaster),"GET");
//				obj_giftCouponsProxy.getGiftCouponsMaster(gson.toJson(obj_GiftCouponsMaster));
				//// log.info("Response String:::::::"+result);
				//////////////System.out.println("Response String:::::::"+result);
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					String responseList = Response.getResponseList(result, "giftCouponsList");
					JSONArray jsonResponseArray = new JSONArray(responseList);
					list_giftCouponsMaster = new ArrayList<GiftCouponsMaster>();
					for (int i=0; i<jsonResponseArray.length(); i++) {
						obj_GiftCouponsMaster = gson.fromJson(jsonResponseArray.getString(i), GiftCouponsMaster.class);
						
							
//						}
						if(!couponsProgramCode.equals("")){
							String locations = "";
							if(obj_GiftCouponsMaster.getLocationsList() != null)
							for(String location : obj_GiftCouponsMaster.getLocationsList())
								locations = locations+location+",";
							if(!locations.equals("") && locations.substring(locations.length()-1, locations.length()).equals(","))
								locations = locations.substring(0, locations.length()-1);
							obj_GiftCouponsMaster.setLocations(locations);
						}
						list_giftCouponsMaster.add(obj_GiftCouponsMaster);
					}
					list_giftCouponsMaster.get(0).setTotalRecords(Response.getResponseTotalRecords(result));
					list_giftCouponsMaster.get(0).setTotolGiftCoupons(obj_GiftCouponsMaster.getTotolGiftCoupons());
			
		}
		}*/
	}
	catch(ConnectException ce) {
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
	return giftCouponsList;
} 














	public List<String> getGiftCouponsForSearch(String couponsProgramCode,String customerId,String emailId,String index){
		String result = null;
		List<GiftCouponsMaster> list_giftCouponsMaster = null;
		List<String> couponIDs = new ArrayList<String>();
		RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
		try {
			//GiftCouponsProxy obj_giftCouponsProxy = new GiftCouponsProxy();
			GiftCouponsMaster obj_GiftCouponsMaster = new GiftCouponsMaster();
			if(!couponsProgramCode.equals(""))
				obj_GiftCouponsMaster.setCouponProgramCode(couponsProgramCode);
			obj_GiftCouponsMaster.setStartIndex(index);
			obj_GiftCouponsMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String:::::::"+gson.toJson(obj_GiftCouponsMaster));
			result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Gift_Coupons_Master_New"), gson.toJson(obj_GiftCouponsMaster),"GET");
//			obj_giftCouponsProxy.getGiftCouponsMaster(gson.toJson(obj_GiftCouponsMaster));
			// log.info("Response String:::::::"+result);
//			////////////////System.out.println("Response String:::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				String responseList = Response.getResponseList(result, "giftCouponsList");
				JSONArray jsonResponseArray = new JSONArray(responseList);
				list_giftCouponsMaster = new ArrayList<GiftCouponsMaster>();
				for (int i=0; i<jsonResponseArray.length(); i++) {
					obj_GiftCouponsMaster = gson.fromJson(jsonResponseArray.getString(i), GiftCouponsMaster.class);
					couponIDs.add(obj_GiftCouponsMaster.getCouponProgramCode());
				}
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
		return couponIDs;
	}
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to call createGiftCoupons method of web service and return the response
	 *
	 **/
	public String createGiftCoupons(GiftCouponsMaster giftCouponsMaster,String customerId,String emailId){
		String result = null;
		try {
			//GiftCouponsProxy giftCouponsProxy = new GiftCouponsProxy();
			RestfulServiceConnection restfulServiceConnection =new RestfulServiceConnection();
			giftCouponsMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		/*	String[] locationsList = giftCouponsMaster.getLocations().split(",");
			giftCouponsMaster.setLocationsList(locationsList);*/
			
			List<String> myList = new ArrayList<String>(Arrays.asList(giftCouponsMaster.getSelectdZones().split(",")));
			giftCouponsMaster.setZones(myList);
			List<String> zonelocations = new ArrayList<String>(Arrays.asList(giftCouponsMaster.getLocations().split(",")));
			giftCouponsMaster.setZoneLocations(zonelocations);
			if(giftCouponsMaster.getRequiredOTP().equals("0"))
				giftCouponsMaster.setOtpRequirement(true);	
			else
				giftCouponsMaster.setOtpRequirement(false);
			
			
			if(giftCouponsMaster.getGenareteCoupons().equals("0")){
				giftCouponsMaster.setImportCoupons(true);	
				
			}else{
				giftCouponsMaster.setImportCoupons(false);
				giftCouponsMaster.setUploadedfilePath("");
			}
				
			
			if(giftCouponsMaster.getMultiplesStr().equals("0"))
				giftCouponsMaster.setMultiples(true);	
			else
				giftCouponsMaster.setMultiples(false);
			
			if(giftCouponsMaster.getAssignedStatusStr().equals("0"))
				giftCouponsMaster.setAssignedCoupon(true);	
			else
				giftCouponsMaster.setAssignedCoupon(false);
			
			if(giftCouponsMaster.getLimitedUseCouponStr().equals("0"))
				giftCouponsMaster.setLimitedUseCoupon(true);	
			else
				giftCouponsMaster.setLimitedUseCoupon(false);
			
			giftCouponsMaster.setMultiplesStr(null);
			giftCouponsMaster.setRequiredOTP(null);
			giftCouponsMaster.setLocations(null);
			giftCouponsMaster.setSelectdZones(null);
			// log.info("Request String::::::::::::"+gson.toJson(giftCouponsMaster));
			//System.out.println("create_Gift_Coupons Request String::::::::::::"+gson.toJson(giftCouponsMaster));
			result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("create_Gift_Coupons"), gson.toJson(giftCouponsMaster),"POST");
//			result=	giftCouponsProxy.createGiftCoupons(gson.toJson(giftCouponsMaster));
			// log.info("Response String:::::::::::"+result);
		   //System.out.println("Response String:::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("GIFTCOUPONS_CREATE_SUCCESS").trim();
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
	
	public LoyaltyCardMaster getLoyaltyCardsForSearchCriteria(String loyaltyProgramNumber,String customerId,String emailId,String index,String searchCriteria,String maxRecords,boolean save){
		String result = null;
		//List<LoyaltyCardMaster> list_giftCouponsMaster = null;
		//List<LoyaltyCards> cardsList = null;
		//LoyaltyCards giftCoupons  =null;
		LoyaltyCardMaster objResponse=null;
		RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
		try {
			LoyaltyCardMaster obj_loyaltyCardsMaster = new LoyaltyCardMaster();
			objResponse = new LoyaltyCardMaster();
			 obj_loyaltyCardsMaster.setStartIndex(index);
			 obj_loyaltyCardsMaster.setMaxRecords(maxRecords);
			 obj_loyaltyCardsMaster.setSearchCriteria(searchCriteria);
			 obj_loyaltyCardsMaster.setLoyaltyProgramNumber(loyaltyProgramNumber);
			 obj_loyaltyCardsMaster.setSaveLoyaltyCardFlag(save);
			 
			 obj_loyaltyCardsMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String:::::::"+gson.toJson(obj_loyaltyCardsMaster));
       //////System.out.println("Request String:::::::"+gson.toJson(obj_loyaltyCardsMaster));
			result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_loyaltyCardsBySearchCriteria"), gson.toJson(obj_loyaltyCardsMaster),"GET");
			// log.info("Response String:::::::"+result);
       //////System.out.println("Response String:::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				objResponse = gson.fromJson(result, LoyaltyCardMaster.class);
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
		return objResponse;
	}
	

	public String updateGiftCoupons(GiftCouponsMaster giftCouponsMaster,String customerId,String emailId){
		String result = null;
		try {
			RestfulServiceConnection restfulServiceConnection=new RestfulServiceConnection();
//			GiftCouponsProxy giftCouponsProxy = new GiftCouponsProxy();
			giftCouponsMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			List<String> myList = new ArrayList<String>(Arrays.asList(giftCouponsMaster.getSelectdZones().split(",")));
			giftCouponsMaster.setZones(myList);
			List<String> zonelocations = new ArrayList<String>(Arrays.asList(giftCouponsMaster.getLocations().split(",")));
			giftCouponsMaster.setZoneLocations(zonelocations);
			if(giftCouponsMaster.getRequiredOTP().equals("0"))
				giftCouponsMaster.setOtpRequirement(true);	
			else
				giftCouponsMaster.setOtpRequirement(false);
			
			if(giftCouponsMaster.getMultiplesStr().equals("0"))
				giftCouponsMaster.setMultiples(true);	
			else
				giftCouponsMaster.setMultiples(false);
			
			if(giftCouponsMaster.getAssignedStatusStr().equals("0"))
				giftCouponsMaster.setAssignedCoupon(true);
			else
				giftCouponsMaster.setAssignedCoupon(false);
			
			if(giftCouponsMaster.getLimitedUseCouponStr().equals("0"))
				giftCouponsMaster.setLimitedUseCoupon(true);	
			else
				giftCouponsMaster.setLimitedUseCoupon(false);
			
			giftCouponsMaster.setMultiplesStr(null);
			giftCouponsMaster.setRequiredOTP(null);
			giftCouponsMaster.setLocations(null);
			giftCouponsMaster.setSelectdZones(null);
			giftCouponsMaster.setRenewCoupon(null);
			giftCouponsMaster.setCouponUpdate(true);
		
			//// log.info("Request String::::::::::::"+gson.toJson(giftCouponsMaster));
		///	System.out.println("Request update_Gift_Coupons String:::::::::::: gift coupon"+gson.toJson(giftCouponsMaster));
//			result = giftCouponsProxy.createGiftCoupons(gson.toJson(giftCouponsMaster));
			result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_Gift_CouponsLatest"), gson.toJson(giftCouponsMaster));

			//result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("update_Gift_Coupons"), gson.toJson(giftCouponsMaster),"POST");
	///       System.out.println("Response String::::update_Gift_Coupons String:::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("COUPON_UPDATED_SUCCESS").trim();
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
	 * 
	 * @author Vasudeva Reddy.G
	 * @Created_On 18/09/2019
	 * @Reviewed_by 
	 *@description :all membership services.
	 **/
	
	public String createMembership(MembershipMaster membershipMaster,String customerId,String emailId){
		String result = null;
		try {
			RestfulServiceConnection restfulServiceConnection =new RestfulServiceConnection();
			membershipMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			List<String> myList = new ArrayList<String>(Arrays.asList(membershipMaster.getSelectedZones().split(",")));
			membershipMaster.setZones(myList);
			List<String> zonelocations = new ArrayList<String>(Arrays.asList(membershipMaster.getLocations().split(",")));
			membershipMaster.setZoneLocations(zonelocations);
			
			/*if(membershipMaster.getRequiredOTP().equals("0"))
				
				membershipMaster.setOtpRequirement(true);	
			else
				membershipMaster.setOtpRequirement(false);
			
						
			if(membershipMaster.getAssignedStatusStr().equals("0"))
				membershipMaster.setAssignedStatus(true);	
			else
				membershipMaster.setAssignedStatus(false);
		
			membershipMaster.setRequiredOTP(null);*/
			membershipMaster.setLocations(null);
			membershipMaster.setZoneId(null);
			membershipMaster.setSelectedZones(null);
			//membershipMaster.setQuantity(1);
			//////////////System.out.println("create membership Request String:::::::::::"+gson.toJson(membershipMaster));
			result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_membership"), gson.toJson(membershipMaster));
			//////////////System.out.println("create membership Response String:::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("MEMBERSHIP_CREATE_SUCCESS").trim();
			}
			else{
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
	
	public List<MembershipMaster> getMemberships(String membershipProgramCode,String customerId,String emailId,String index,String searchlocation,String zone,String startDate,String endDate,String searchName,String locationListAll,String maxRecords,String membershipType,String status,String pagination){
		String result = null;
		List<MembershipMaster> list_membershipMaster = null;
		RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
		try {
			MembershipMaster obj_MembershipMaster = new MembershipMaster();
			if(!membershipProgramCode.equals(""))
				obj_MembershipMaster.setMembershipProgramCode(membershipProgramCode);
			
			
			obj_MembershipMaster.setZoneId(zone);
			obj_MembershipMaster.setMaxRecords((Integer.parseInt(maxRecords)));
			obj_MembershipMaster.setStartDateStr(startDate);
			obj_MembershipMaster.setExpiryDateStr(endDate);
			obj_MembershipMaster.setLocationRequired(true);
			obj_MembershipMaster.setChildRequired(true);
			obj_MembershipMaster.setCustomerMembershipRequired(true);
			
			obj_MembershipMaster.setStatus(status);
           obj_MembershipMaster.setMembershipType(membershipType);
			
           if(searchName !="" || pagination.equals("true") )
           {
        	 obj_MembershipMaster.setStartIndex(0);
   			 obj_MembershipMaster.setChildStartIndex(Integer.parseInt(index));
   			 obj_MembershipMaster.setSearchCriteria(searchName);
           }
           else
           {
        	  obj_MembershipMaster.setStartIndex(Integer.parseInt(index));
   			  obj_MembershipMaster.setChildStartIndex(0);
   			  obj_MembershipMaster.setSearchCriteria(searchName);
           }
           
           
		if(membershipProgramCode.equals(""))	
           if(searchlocation.equals("all") || searchlocation.equals("")){
				Set<String> myList = new HashSet<String>(Arrays.asList(locationListAll.split(",")));
				obj_MembershipMaster.setAllLocationsList(myList);
				}
				else
				obj_MembershipMaster.setLocations(searchlocation);
			
			obj_MembershipMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//////////////System.out.println("Request String:::::::"+gson.toJson(obj_MembershipMaster));
			result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_membership_details"), gson.toJson(obj_MembershipMaster),"GET");
			//////////////System.out.println("Response String:::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				String responseList = Response.getResponseList(result, "membershipMasters");
				JSONArray jsonResponseArray = new JSONArray(responseList);
				list_membershipMaster = new ArrayList<MembershipMaster>();
				for (int i=0; i<jsonResponseArray.length(); i++) {
					obj_MembershipMaster = gson.fromJson(jsonResponseArray.getString(i), MembershipMaster.class);
					if(!membershipProgramCode.equals("")){
						String locations = "";
						if(obj_MembershipMaster.getAllLocationsList() != null)
						for(String location : obj_MembershipMaster.getAllLocationsList())
							locations = locations+location+",";
						if(!locations.equals("") && locations.substring(locations.length()-1, locations.length()).equals(","))
							locations = locations.substring(0, locations.length()-1);
						obj_MembershipMaster.setLocations(locations);
					}
					list_membershipMaster.add(obj_MembershipMaster);
				}
				list_membershipMaster.get(0).setTotalRecords(Integer.parseInt(Response.getResponseTotalRecords(result)));
			//	list_membershipMaster.get(0).setTotolGiftCoupons(obj_MembershipMaster.getto());
				
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
		return list_membershipMaster;
	}
	
	public String updateMembership(MembershipMaster membershipMaster,String customerId,String emailId){
		String result = null;
		try {
			RestfulServiceConnection restfulServiceConnection=new RestfulServiceConnection();
//			GiftCouponsProxy giftCouponsProxy = new GiftCouponsProxy();
			membershipMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			List<String> myList = new ArrayList<String>(Arrays.asList(membershipMaster.getSelectedZones().split(",")));
			membershipMaster.setZones(myList);
			List<String> zonelocations = new ArrayList<String>(Arrays.asList(membershipMaster.getLocations().split(",")));
			membershipMaster.setZoneLocations(zonelocations);
			List<String> membershipIDS = new ArrayList<String>(Arrays.asList(membershipMaster.getMembershipIdsStr().split(",")));
			membershipMaster.setMembershipIds(membershipIDS);
			
			List<String> customerMembershipIDS = new ArrayList<String>(Arrays.asList(membershipMaster.getCustomerMembershipIdsStr().split(",")));
			membershipMaster.setCustomerMembershipIds(customerMembershipIDS);
			membershipMaster.setMembershipIdsStr(null);
			membershipMaster.setLocations(null);
			membershipMaster.setSelectedZones(null);
			//membershipMaster.setQuantity(1);
//			result = giftCouponsProxy.createGiftCoupons(gson.toJson(giftCouponsMaster));
			////////////System.out.println("update request string::"+gson.toJson(membershipMaster));
			
			result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_membership"), gson.toJson(membershipMaster));
			////////////System.out.println("update response string::"+result);
			//////////////System.out.println("Response String:::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("MEMBERSHIP_UPDATE_SUCCESS").trim();
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
	
	
	
	public String createCustCoupons(GiftCouponsMaster giftCoupon,String customerId,String emailId){
		String result = null;
		try {
			RestfulServiceConnection restfulServiceConnection=new RestfulServiceConnection();
//			GiftCouponsProxy giftCouponsProxy = new GiftCouponsProxy();
			giftCoupon.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			List<String> myList = new ArrayList<String>(Arrays.asList(giftCoupon.getSelectdZones().split(",")));
			giftCoupon.setZones(myList);
			List<String> zonelocations = new ArrayList<String>(Arrays.asList(giftCoupon.getLocations().split(",")));
			giftCoupon.setZoneLocations(zonelocations);
			if(giftCoupon.getRequiredOTP().equals("0"))
				giftCoupon.setOtpRequirement(true);	
			else
				giftCoupon.setOtpRequirement(false);
			
			/*if(giftCoupon.getMultiplesStr().equals("0"))
				giftCoupon.setMultiples(true);	
			else
				giftCoupon.setMultiples(false);*/
			
			if(giftCoupon.getAssignedStatusStr().equals("0"))
				giftCoupon.setAssignedStatus(true);	
			else
				giftCoupon.setAssignedStatus(false);
			
			if(giftCoupon.getLimitedUseCouponStr().equals("0"))
				giftCoupon.setLimitedUseCoupon(true);	
			else
				giftCoupon.setLimitedUseCoupon(false);
			
			/*giftCoupon.setMultiplesStr(null);*/
			giftCoupon.setRequiredOTP(null);
			giftCoupon.setLocations(null);
			giftCoupon.setSelectdZones(null);
			
		
			// log.info("Request String::::::::::::"+gson.toJson(giftCoupon));
			//////////////System.out.println("create_Cust_Coupons Request String:::::::::::: gift coupon"+gson.toJson(giftCoupon));
//			result = giftCouponsProxy.createGiftCoupons(gson.toJson(giftCouponsMaster));
			/*result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("create_Cust_coupons"), gson.toJson(giftCouponsMaster),"POST");*/
			result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_Cust_coupons"), gson.toJson(giftCoupon));
			// log.info("Response String:::::::::::"+result);
			//////////////System.out.println("create_Cust_Coupons Response String:::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("COUPON_UPDATED_SUCCESS").trim();
				
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
	
	public List<MembershipMaster> saveMemberships(String membershipProgramCode,String customerId,String emailId,String index,String searchlocation,String zone,String startDate,String endDate,String searchName,String locationListAll,String maxRecords,String membershipType,String status,String saveflag){
		String result = null;
		String result2 = null;
		List<MembershipMaster> list_membershipMaster = null;
		RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
		try {
			MembershipMaster obj_MembershipMaster = new MembershipMaster();
			MembershipMaster saveMembership = new MembershipMaster();
			if(!membershipProgramCode.equals(""))
				obj_MembershipMaster.setMembershipProgramCode(membershipProgramCode);
			obj_MembershipMaster.setStartIndex(Integer.parseInt(index));
			obj_MembershipMaster.setZoneId(zone);
			obj_MembershipMaster.setMaxRecords((Integer.parseInt(maxRecords)));
			obj_MembershipMaster.setStartDateStr(startDate);
			obj_MembershipMaster.setExpiryDateStr(endDate);
			obj_MembershipMaster.setSearchCriteria(searchName);
			obj_MembershipMaster.setStatus(status);
           obj_MembershipMaster.setMembershipType(membershipType);
           obj_MembershipMaster.setSaveReport(true);
           obj_MembershipMaster.setChildRequired(true);
           obj_MembershipMaster.setCustomerMembershipRequired(true);
           obj_MembershipMaster.setLocationRequired(true);
			
		if(membershipProgramCode.equals(""))	
           if(searchlocation.equals("all") || searchlocation.equals("")){
				Set<String> myList = new HashSet<String>(Arrays.asList(locationListAll.split(",")));
				obj_MembershipMaster.setAllLocationsList(myList);
				}
				else
					obj_MembershipMaster.setLocations(searchlocation);
			
			obj_MembershipMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//////////////System.out.println("Request save_memberships:::::::"+gson.toJson(obj_MembershipMaster));
			result2 = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("save_memberships"), gson.toJson(obj_MembershipMaster),"GET");
			result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_membership_details"), gson.toJson(obj_MembershipMaster),"GET");
			
			//////////////System.out.println("Response save_memberships:::::::"+result2);
			//////////////System.out.println("Response save_memberships:::::::"+result);
			
			String responseCode ="";
			if(saveflag.equals("true") || saveflag == "true"){
				
				
			 responseCode = Response.getResponseCode(result);
			
				
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					saveMembership = gson.fromJson(result2, MembershipMaster.class);
					String responseList = Response.getResponseList(result, "membershipMasters");
					JSONArray jsonResponseArray = new JSONArray(responseList);
					list_membershipMaster = new ArrayList<MembershipMaster>();
					for (int i=0; i<jsonResponseArray.length(); i++) {
						obj_MembershipMaster = gson.fromJson(jsonResponseArray.getString(i), MembershipMaster.class);
						if(!membershipProgramCode.equals("")){
							String locations = "";
							if(obj_MembershipMaster.getAllLocationsList() != null)
							for(String location : obj_MembershipMaster.getAllLocationsList())
								locations = locations+location+",";
							if(!locations.equals("") && locations.substring(locations.length()-1, locations.length()).equals(","))
								locations = locations.substring(0, locations.length()-1);
							obj_MembershipMaster.setLocations(locations);
						}
						list_membershipMaster.add(obj_MembershipMaster);
					}
					list_membershipMaster.get(0).setTotalRecords(Integer.parseInt(Response.getResponseTotalRecords(result)));
					list_membershipMaster.get(0).setFilePath(saveMembership.getFilePath());
					//	list_membershipMaster.get(0).setTotolGiftCoupons(obj_MembershipMaster.getto());
					
				}
				
				
				
			}
			else{
				
				responseCode = Response.getResponseCode(result2);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					saveMembership = gson.fromJson(result, MembershipMaster.class);
					String responseList = Response.getResponseList(result2, "memberShipChild");
					JSONArray jsonResponseArray = new JSONArray(responseList);
					list_membershipMaster = new ArrayList<MembershipMaster>();
					for (int i=0; i<jsonResponseArray.length(); i++) {
						obj_MembershipMaster = gson.fromJson(jsonResponseArray.getString(i), MembershipMaster.class);
						if(!membershipProgramCode.equals("")){
							String locations = "";
							if(obj_MembershipMaster.getAllLocationsList() != null)
							for(String location : obj_MembershipMaster.getAllLocationsList())
								locations = locations+location+",";
							if(!locations.equals("") && locations.substring(locations.length()-1, locations.length()).equals(","))
								locations = locations.substring(0, locations.length()-1);
							obj_MembershipMaster.setLocations(locations);
						}
						list_membershipMaster.add(obj_MembershipMaster);
					}
					
					for(int i=0;i<list_membershipMaster.size();i++){
					
					list_membershipMaster.get(i).setStartDateStr(saveMembership.getMembershipMasters().get(0).getStartDateStr());
					list_membershipMaster.get(i).setExpiryDateStr(saveMembership.getMembershipMasters().get(0).getExpiryDateStr());
					
					}
				
				
				
			}
				
			
				
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
		return list_membershipMaster;
	}

	
	
	/* @author Surya.K        
     * 
     * This method is used to call the Loyalty to giftVocuher convertion method of web service and return the Loyalty Cards List
     * 
     * @modifications 
     * 
     */
    public String loyaltyCardsToGiftVoucher(String loyaltyProgramNumber,String  minClaimPoints,String  maxClaimPoints,String  basePoints,String  enroledate,String rewardConversionRatio,String customerId,String emailId,String index,String maxRecords){
            String result = null;
            RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
            try 
            {
                    LoyaltyCardMaster obj_loyaltyCardMaster = new LoyaltyCardMaster();
                    
                    
                    if(!loyaltyProgramNumber.equals(""))
                            obj_loyaltyCardMaster.setLoyaltyProgramNumber(loyaltyProgramNumber);
                    
                    obj_loyaltyCardMaster.setStartIndex(index);
                    obj_loyaltyCardMaster.setMaxRecords(maxRecords);
                    //obj_loyaltyCardMaster.setBasePoints(Float.parseFloat(basePoints));
                    obj_loyaltyCardMaster.setMinPoints(Double.parseDouble(minClaimPoints));
                    obj_loyaltyCardMaster.setMaxPoints(Double.parseDouble(maxClaimPoints));
                    obj_loyaltyCardMaster.setEnrolDate(enroledate);
                    obj_loyaltyCardMaster.setBasePointsConvertions(Double.parseDouble(basePoints));
                    obj_loyaltyCardMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
                    
                    
                    //////////////System.out.println("Request String:::::::"+gson.toJson(obj_loyaltyCardMaster));
                    result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("loyaltyCard_GiftVoucher"), gson.toJson(obj_loyaltyCardMaster));

//                    result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("loyaltyCard_GiftVoucher"), gson.toJson(obj_loyaltyCardMaster), "GET");

                    //////////////System.out.println(result);
                    
                    String responseCode = Response.getResponseCode(result);
                    
                    if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
                            result = AppProperties.getAppMessageByProperty("Gift_VOUCHER_SUCCESS").trim();
                    }
                    else{
                            result = Response.getResponseMessage(result);
                    }
                    
            }catch (NoSuchElementException nse) {
                    nse.printStackTrace();
                    result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
            } catch(Exception e){
                    e.printStackTrace();
            }
            return result;
    }





    /* @author koti bommineni     
     * 
     * This method is used to call the Loyalty to upgrade
     * 
     * @modifications 
     * 
     */
    public String upgradeLoyaltyCards(String loyaltyProgramNumber,String  minClaimPoints,String  maxClaimPoints,String  startdate,String  enddate,String rewardConversionRatio,String customerId,String emailId,String index,String maxRecords,String pricerange,String loyaltyCardType){
            String result = null;
            RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
            try 
            {
                    LoyaltyCardMaster obj_loyaltyCardMaster = new LoyaltyCardMaster();
                    
                    
                    if(!loyaltyProgramNumber.equals(""))
                            obj_loyaltyCardMaster.setLoyaltyProgramNumber(loyaltyProgramNumber);
                    
                    obj_loyaltyCardMaster.setStartIndex(index);
                    obj_loyaltyCardMaster.setMaxRecords(maxRecords);
                    obj_loyaltyCardMaster.setMinPoints(Double.parseDouble(minClaimPoints));
                    obj_loyaltyCardMaster.setMaxPoints(Double.parseDouble(maxClaimPoints));
                    obj_loyaltyCardMaster.setStartDateStr(startdate);
                    obj_loyaltyCardMaster.setEndDateStr(enddate);
                    obj_loyaltyCardMaster.setPurchasePoints(Double.parseDouble(pricerange));
                    obj_loyaltyCardMaster.setLoyaltyCardType(loyaltyCardType);
                    obj_loyaltyCardMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
                    
                    
                    //////////////System.out.println("Request String:::::::"+gson.toJson(obj_loyaltyCardMaster));
                    result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("upgrade_loyaltyCards"), gson.toJson(obj_loyaltyCardMaster));

//                    result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("loyaltyCard_GiftVoucher"), gson.toJson(obj_loyaltyCardMaster), "GET");

                    //////////////System.out.println(result);
                    
                    String responseCode = Response.getResponseCode(result);
                    
                    if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
                            result = AppProperties.getAppMessageByProperty("LOYALTY_UPGRADE_SUCCESS").trim();
                    }
                    else{
                            result = Response.getResponseMessage(result);
                    }
                    
            }catch (NoSuchElementException nse) {
                    nse.printStackTrace();
                    result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
            } catch(Exception e){
                    e.printStackTrace();
            }
            return result;
    }





	
	
	
	
 // GET SUBSCRIPTION
	
 	public List<CustomerSubscription> getSubscriptions(String subscriptionProgramCode,String customerId,String emailId,String index,String startDate,String endDate,String searchName,String subscriptionType,String maxRecords,String status,String pagination){
 		String result = null;
 		List<CustomerSubscription> list_CustomerSubscription = null;
 		RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
 		try {
 			CustomerSubscription obj_CustomerSubscription = new CustomerSubscription();
 			if(!subscriptionProgramCode.equals(""))
 				obj_CustomerSubscription.setSubscriptionProgramCode(subscriptionProgramCode);
 			
 			obj_CustomerSubscription.setStartDateStr(startDate);
 			obj_CustomerSubscription.setEndDateStr(endDate);
 			obj_CustomerSubscription.setStatus(status);
 			obj_CustomerSubscription.setPeriod(subscriptionType);
 			
            if(searchName !="" || pagination.equals("true"))
            {
         	   obj_CustomerSubscription.setStartIndex(0);
         	   obj_CustomerSubscription.setStartIndex(Integer.parseInt(index));
         	   obj_CustomerSubscription.setSearchCriteria(searchName);
            }
            else
            {
         	   obj_CustomerSubscription.setStartIndex(Integer.parseInt(index));
         	   obj_CustomerSubscription.setStartIndex(0);
         	   obj_CustomerSubscription.setSearchCriteria(searchName);
            }
            obj_CustomerSubscription.setSearchCriteria(searchName);
 			obj_CustomerSubscription.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
 			
 		   //System.out.println("Request String:: getSubscriptions :::::"+gson.toJson(obj_CustomerSubscription));
 			result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_subscription_details"), gson.toJson(obj_CustomerSubscription),"GET");
 			//System.out.println("Response String:::::::"+result);
 			String responseCode = Response.getResponseCode(result);
 			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
 				obj_CustomerSubscription = gson.fromJson(result,CustomerSubscription.class); 
 				list_CustomerSubscription = obj_CustomerSubscription.getCustomerSubscriptionDetails();
 				list_CustomerSubscription.get(0).setTotalRecords(Integer.parseInt(Response.getResponseTotalRecords(result)));
 				
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
 		return list_CustomerSubscription;
 	}
 	
 	
 	
 	
 	
 	public CustomerSubscription getSubscriptionsDetails(String subscriptionId,String subscriptionType){
 			
 		String result = null;
 		CustomerSubscription list_CustomerSubscriptionObj = new CustomerSubscription();
 		RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
 		try {
 			CustomerSubscription obj_CustomerSubscription = new CustomerSubscription();
 			if(!subscriptionId.equals(""))
 			obj_CustomerSubscription. setSubscriptionId(subscriptionId);
 			
 			obj_CustomerSubscription.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
 			obj_CustomerSubscription. setPeriod(subscriptionType);
 			
 		  /// System.out.println("Request String:: getSubscriptions :::::"+gson.toJson(obj_CustomerSubscription));
 			result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_subscription_details"), gson.toJson(obj_CustomerSubscription),"GET");
 			//System.out.println("Response String:::::::"+result);
 			String responseCode = Response.getResponseCode(result);
 			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
 				list_CustomerSubscriptionObj = gson.fromJson(result,CustomerSubscription.class); 
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
 		return list_CustomerSubscriptionObj;
 	}
 	
 	
 	
 	
 	public List<LoyaltyCardMaster> getLoyaltyCardsSummary(String loyaltyProgramNumber,String customerId,String emailId,String index,String maxRecords){
		String result = null;
		List<LoyaltyCardMaster> list_loyaltyCardMaster = null;
		RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
		try 
		{
			LoyaltyCardMaster obj_loyaltyCardMaster = new LoyaltyCardMaster();
			
			if(!loyaltyProgramNumber.equals(""))
				obj_loyaltyCardMaster.setLoyaltyProgramNumber(loyaltyProgramNumber);
			
			obj_loyaltyCardMaster.setStartIndex(index);
			obj_loyaltyCardMaster.setMaxRecords(maxRecords);
			obj_loyaltyCardMaster.setCustomerLoyaltyCardFlag(true);
			
			obj_loyaltyCardMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
	////	System.out.println("edit get Request String:::::::"+gson.toJson(obj_loyaltyCardMaster));
			
    ///      System.out.println("Request String:::summary::::"+gson.toJson(obj_loyaltyCardMaster));
			result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Loyalty_Summary"), gson.toJson(obj_loyaltyCardMaster), "GET");
			
   /////           System.out.println("Response String:::summary::::"+result);
			
			// log.info("Response String:::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
			{
			//	String responseList = Response.getResponseList(result, "loyaltyCardsList");
				//JSONArray jsonResponseArray = new JSONArray(responseList);
				obj_loyaltyCardMaster = gson.fromJson(result,LoyaltyCardMaster.class);
				
				list_loyaltyCardMaster = obj_loyaltyCardMaster.getLoyaltyCardsList();
				
		
				list_loyaltyCardMaster.get(0).setTotalRecords(Response.getResponseTotalRecords(result));
				list_loyaltyCardMaster.get(0).setTotalLoyaltyCards(list_loyaltyCardMaster.get(0).getTotalLoyaltyCards());
			}
			else
			{
//				String responseMessage = Response.getResponseMessage(result);
//				obj_loyaltyCardMaster.setResponseMessage(responseMessage);
//				obj_loyaltyCardMaster.setResponseCode("-1");
			//	list_loyaltyCardMaster.set(0, obj_loyaltyCardMaster);
			}
		}catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return list_loyaltyCardMaster;
	}
	
	
	
	
	
	public String deleteLoyaltyCards(String customerIdStr,String emailIdStr,String ids) {
		String result = null;
		try {
			LoyaltyCardMaster loyaltyCard = new LoyaltyCardMaster();
			loyaltyCard.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			String[] loyaltyProgramNumber = ids.split(",");
			List<String> loyaltyCardsDetails = new ArrayList<String>();
			
		
			for(int i=0;i<loyaltyProgramNumber.length;i++){
			loyaltyCardsDetails.add(loyaltyProgramNumber[i]);
			}
			loyaltyCard.setLoyaltyProgramNumbers(loyaltyCardsDetails);
			
			//result = brandMasterServiceProxyObj.deleteBrand(gson.toJson(master));
			
			
	///////	System.out.println("Request String:::delete::::"+gson.toJson(loyaltyCard ));
			
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("delete_Loyalty_Card"), gson.toJson(loyaltyCard));
			
/////		System.out.println("Response String:::delete::::"+result);
			String responseCode = Response.getResponseCode(result);
			
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
			//	result = AppProperties.getAppMessageByProperty("LOYALTY_DELETE_SUCCESS").trim();
				result = Response.getResponseMessage(result);
			
			else {
			//	result = AppProperties.getAppMessageByProperty("DELETE_FAILED").trim();
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
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	public String updateSubscription(CustomerSubscription customerSubscriptionObj,String customerId,String emailId){
 		String result = null;
 		try {
 			CustomerSubscription obj_CustomerSubscription = new CustomerSubscription();
 			
 			RestfulServiceConnection restfulServiceConnection=new RestfulServiceConnection();
 			
 			customerSubscriptionObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
 			
 			//System.out.println("Request String:::Update subscription:::::"+gson.toJson(customerSubscriptionObj));
 			 
 			result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_subscription"), gson.toJson(customerSubscriptionObj));
 			//System.out.println("update Subscription Response String:::::::::::"+result);
 			 
 		    String responseCode = Response.getResponseCode(result);
 			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
 				result = Response.getResponseMessage(result);
 			}
 			else{
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
	
	
 	
 	
 	
 	
 	
 	
 	
 	
 	
	
	
	
}
