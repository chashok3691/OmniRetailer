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
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.technolabssoftware.www.MemberServiceProxy;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.beans.UserDetails;
import com.tlabs.posweb.util.Constants;
import com.tlabs.posweb.util.EncryptAndDecrypt;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
//import com.tlabs.posweb.util.Utilities;
import com.tlabs.posweb.util.RestfulServiceConnection;

public class UserService {
	
	@Autowired
	private Gson gson;
	private static Logger log = Logger.getLogger(UserService.class);
    @Autowired
    SessionScope sessionScope;
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 * This method is used to call createMember method of web service and return the response
	 * 
	 * */
	public String isUserCreated(UserDetails userDetails,String customerId,String emailId) {
	  String result = null;
	  try {
		  //MemberServiceProxy member = new MemberServiceProxy();
		 userDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		  String userDetailsList = gson.toJson(userDetails);
		  
		/*  // log.info(userDetailsList);
		 // ////////////System.out.println(userDetailsList);
		  result = member.createMember(userDetailsList);
		  // log.info(result);
		 // ////////////System.out.println(result);
*/		  
		  /**	added by - vasudev   purpose - using rest service call instead of soap call*/
		  RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
		  result=restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("create_member"), userDetailsList,"POST");

		  
		  String responseCode = Response.getResponseCode(result);
			if(responseCode.equals( AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("USER_CREATE_SUCCESS").trim();
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
	 * @author Mythri.S
	 * 
	 * This method is used to call getMembers method of web service and return all the User Details List
	 * 
	 * */
	public ArrayList<UserDetails> getUserDetails(String type,String customerId,String emailId,String index,String searchName,String maxRecords,String locationList,String userLocation,String roleName){
		ArrayList<UserDetails> userDetailsList = null;
		String result = null;
		try{
			//MemberServiceProxy member = new MemberServiceProxy();
			UserDetails userDetails = new UserDetails();
			userDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			if(type.equals("all"))
				userDetails.setAccountStatus("");
			else
				userDetails.setAccountStatus(type);
			userDetails.setStartIndex(index);
			userDetails.setSearchCriteria(searchName);
			userDetails.setMaxRecords(maxRecords);
			//userDetails.setSearchcriteria(searchName);
			
			if(userLocation.equals("all") || userLocation.equals("")){
				List<String> myList = new ArrayList<String>(Arrays.asList(locationList.split(",")));
				userDetails.setLocationsList(myList);
			}
			else
				userDetails.setWorkLocation(userLocation);
			
			userDetails.setRole(roleName);
			
			/*// log.info(gson.toJson(userDetails));
//			////////////System.out.println("members"+gson.toJson(userDetails));
			result = member.getMembers(gson.toJson(userDetails));
			// log.info(result);
			//////////////System.out.println("user details"+result);
*/			
			/**	added by - vasudev   purpose - using rest service call instead of soap call*/
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			result=restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_members"), gson.toJson(userDetails),"POST");

			
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				String responseList = Response.getResponseList(result, "members");
				JSONArray jsonResponseArray = new JSONArray(responseList);
				userDetailsList = new ArrayList<UserDetails>();
				for (int i=0; i<jsonResponseArray.length(); i++) {
					userDetails = gson.fromJson(jsonResponseArray.getString(i), UserDetails.class);
					userDetailsList.add(userDetails);
				}
				userDetailsList.get(0).setTotalRecords(Response.getResponseTotalRecords(result));
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
		return userDetailsList;
	}
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 * This method is used to call getMemberDetails method of web service and return the Specific User Details
	 * 
	 * */
	public UserDetails getUser(String email,String customerId,String emailId){
		UserDetails userDetails = new UserDetails();
		String result = null;
		try{
			//MemberServiceProxy member = new MemberServiceProxy();
			userDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			userDetails.setEmail(email);
			userDetails.setStartIndex(Constants.PAGINATION_START_INDEX);
			
		/*	// log.info(gson.toJson(userDetails));
//		    ////////////System.out.println(gson.toJson(userDetails));
			result = member.getMemberDetails(gson.toJson(userDetails));
			// log.info(result);
			//////////////System.out.println(result);
*/			
			/**	added by - vasudev   purpose - using rest service call instead of soap call*/
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			result=restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_member_details"),gson.toJson(userDetails),"POST");

			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				String responseList = Response.getResponseList(result, "memberDetails");
					userDetails = gson.fromJson(responseList, UserDetails.class);
					String pass = userDetails.getPassword();
					userDetails.setPassword(EncryptAndDecrypt.decrypt(pass));
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
		return userDetails;
	}
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 * This method is used to call updateMember method of web service and return the response
	 * 
	 * */
	public String updateUser(UserDetails userDetails,String customerId,String emailId) {
	  String result = null;
	  try {
		 // MemberServiceProxy member = new MemberServiceProxy();
		  userDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		  
		 /* // log.info("Request String::::::::::::::"+gson.toJson(userDetails));
		  result = member.updateMember(gson.toJson(userDetails));
		//  ////////////System.out.println("Request String::::::::::::::"+gson.toJson(userDetails));
		  // log.info("Response String:::::::::::::"+result);
		//  ////////////System.out.println("Response String:::::::::::::"+result);
*/		  
		  
		  /**	added by - vasudev   purpose - using rest service call instead of soap call*/
		  RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
		//  System.out.println(gson.toJson(userDetails));
		 result=restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_member"),gson.toJson(userDetails));

		  
		  String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result =  AppProperties.getAppMessageByProperty("USER_UPDATE_SUCCESS").trim();
			}
			else{
				//result = "Couldn't update, please try after some time";
				result = Response.getResponseMessage(result);
			}
		  // log.info(result);
		} catch(ConnectException ce) {
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
	 * @author Mythri.S
	 * 
	 *This method is used to call deleteMember method of web service and return the response
	 *
	 **/
	public String deleteUser(String customerId,String emailId,String ids) {
		String result = null;
		try {
			UserDetails userDetails = new UserDetails();
			//MemberServiceProxy member = new MemberServiceProxy();
			userDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			String[] idsArray = ids.split(",");
			List<String> userCodeList = new ArrayList<String>();
			for(int i=0;i<idsArray.length;i++)
				userCodeList.add(idsArray[i]);
			userDetails.setMembersList(userCodeList);
			
			/*// log.info(gson.toJson(userDetails));
			result = member.deleteMember(gson.toJson(userDetails));
			// log.info(result);*/
			
			/**	added by - vasudev   purpose - using rest service call instead of soap call*/
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			result=restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("delete_member"),gson.toJson(userDetails),"POST");

			
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("USER_DELETE_SUCCESS").trim();
			else if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_FAILED_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("DELETE_FAILED").trim();
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
