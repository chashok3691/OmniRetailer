package com.tlabs.posweb.services;

import java.rmi.ConnectException;
import java.rmi.RemoteException;
import java.rmi.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;

import com.tlabs.posweb.init.AppProperties;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.technolabssoftware.www.GenericSettingServiceProxy;
import com.tlabs.posweb.beans.GenericCustomer;
import com.tlabs.posweb.beans.GenericRegionalSettings;
import com.tlabs.posweb.beans.GenericResponse;
import com.tlabs.posweb.beans.GenericSettings;
import com.tlabs.posweb.beans.IntegrationSettings;
import com.tlabs.posweb.beans.PrintSettings;
import com.tlabs.posweb.beans.SecuritySettings;
import com.tlabs.posweb.beans.SecuritySettingsResponse;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
//import com.tlabs.posweb.util.Utilities;
import com.tlabs.posweb.util.RestfulServiceConnection;

public class SettingsService {
	
	@Autowired
	private Gson gson;
	@Autowired
	SessionScope sessionScope;
	private static Logger log = Logger.getLogger(SettingsService.class);
	
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to get Customer settings
	 *
	 **/
	public List<GenericCustomer> getCustomerSettings(String customerIdStr,String emailIdStr){
		String result = null;
		GenericCustomer settingObj=new GenericCustomer();
		GenericResponse responseObj=new GenericResponse();
		List<GenericCustomer> mainResponseObj=new ArrayList<GenericCustomer>();
		try{
			settingObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//GenericSettingServiceProxy genericSettingServiceProxy = new GenericSettingServiceProxy();
			//// log.info("Request::"+gson.toJson(settingObj));
			//////////////System.out.println("Request::"+gson.toJson(settingObj));
			//result = genericSettingServiceProxy.getCustomerSettings(gson.toJson(settingObj));
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			result = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_customer_settings"), gson.toJson(settingObj),"GET");
			//////////System.out.println("get_customer_settings::::::::::"+result);
			
			//// log.info("Result"+result);
			if(result != null){
			String responseCode = Response.getResponseCode(result);
		
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				responseObj = gson.fromJson(result, GenericResponse.class);
				
				if(responseObj.getCustomerSettings() != null && responseObj.getCustomerSettings().size() > 0)
				mainResponseObj.add(responseObj.getCustomerSettings().get(0));
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
		return  mainResponseObj;
	}
	
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to call createCustomerSettings method of web service and return the response
	 *
	 **/
	public String createCustomerSettings(GenericCustomer genericCustomerObj,String customerIdStr,String emailIdStr){
		String result = null;
		try {
			//GenericSettingServiceProxy genericSettingServiceProxy = new GenericSettingServiceProxy();
			genericCustomerObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//// log.info("Request String::::::::::::"+gson.toJson(genericCustomerObj));
			//////////////System.out.println("Request String::::::::::::"+gson.toJson(genericCustomerObj));
			//result = genericSettingServiceProxy.createCustomerSettings(gson.toJson(genericCustomerObj));
			
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_customer_settings"), gson.toJson(genericCustomerObj));
			
			
			//// log.info("Response String:::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("CUSTOMER_PROFILE_CREATE_SUCCESS").trim();
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
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to get Mail Settings
	 *
	 **/
	public List<GenericResponse> getEmailSettings(String customerIdStr,String emailIdStr){
		String result = null;
		GenericSettings settingObj=new GenericSettings();
		GenericResponse responseObj=new GenericResponse();
		List<GenericResponse> mainResponseObj=new ArrayList<GenericResponse>();
		try{
			
			settingObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//GenericSettingServiceProxy genericSettingServiceProxy = new GenericSettingServiceProxy();
			//// log.info("Request::"+gson.toJson(settingObj));
			//result = genericSettingServiceProxy.getMailSettings(gson.toJson(settingObj));
			//// log.info("Result"+result);
//			////////////System.out.println(result);
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			result = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_mail_settings"), gson.toJson(settingObj),"GET");

		//	System.out.println(result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				responseObj = gson.fromJson(result, GenericResponse.class);
				responseObj.getMailSettings();
				responseObj.getMailTemplates();
			}
			mainResponseObj.add(responseObj);
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
		return  mainResponseObj;
	}
	

/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to call createMailSettings method of web service and return the response
	 *
	 **/
	public String createMailSettings(GenericSettings genericSettingsObj,String customerIdStr,String emailIdStr){
		String result = null;
		try {
			//GenericSettingServiceProxy genericSettingServiceProxy = new GenericSettingServiceProxy();
			genericSettingsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//System.out.println("Request String createmail::::::::::::"+gson.toJson(genericSettingsObj));
			//result = genericSettingServiceProxy.createMailSettings(gson.toJson(genericSettingsObj));
			//// log.info("Response String:::::::::::"+result);
			
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_mail_settings"), gson.toJson(genericSettingsObj));
			//////////System.out.println("create_mail_settings:::::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("MAIL_SETTING_CREATE_SUCCESS").trim();
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
	 * @author Viswanath
	 * 
	 *This method is used to call updateMailSettings method of web service and return the response
	 *
	 **/
	public String updateMailSettings(GenericSettings settingsObj,String customerIdStr,String emailIdStr){
		String result = null;
		try {
			//GenericSettingServiceProxy genericSettingServiceProxyObj = new GenericSettingServiceProxy();
			settingsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//// log.info("JSON::"+gson.toJson(settingsObj));
			//System.out.println("update mail requesting::"+gson.toJson(settingsObj));
			//result = genericSettingServiceProxyObj.updateMailSettings(gson.toJson(settingsObj));
			
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_mail_settings"), gson.toJson(settingsObj));
			//System.out.println("update_mail_settings:::::::::::::"+result);
			
			
			//// log.info(result);
			 String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					result = AppProperties.getAppMessageByProperty("MAIL_SETTING_UPDATE_SUCCESS").trim();
				}
				else{
//					result = "Couldn't update, please try after some time";
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
		//////////////System.out.println(result);
		return result;
	}
	
	
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to call createMessageSettings method of web service and return the response
	 *
	 **/
	public String createSMSSettings(GenericSettings genericSettingsObj,String customerIdStr,String emailIdStr){
		String result = null;
		try {
			//GenericSettingServiceProxy genericSettingServiceProxy = new GenericSettingServiceProxy();
			genericSettingsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//System.out.println("Request String::::::::::::"+gson.toJson(genericSettingsObj));
			//result = genericSettingServiceProxy.createMessageSettings(gson.toJson(genericSettingsObj));
			//// log.info("Response String:::::::::::"+result);
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_message_settings"), gson.toJson(genericSettingsObj));

			
			String responseCode = Response.getResponseCode(result); 
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("SMS_SETTING_CREATE_SUCCESS").trim();
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
	
	
	
	
	
	
	
	/*public String validatesmssettings(GenericSettings genericSettingsObj,String customerIdStr,String emailIdStr){
		String result = null;
		try {
			//GenericSettingServiceProxy genericSettingServiceProxy = new GenericSettingServiceProxy();
			genericSettingsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//System.out.println("Request String send sms::::::::::::"+gson.toJson(genericSettingsObj));
			//result = genericSettingServiceProxy.createMessageSettings(gson.toJson(genericSettingsObj));
			//System.out.println("Response String sms settings:::::::::::"+result);
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("validatesmssettings"), gson.toJson(genericSettingsObj));
			//System.out.println("Response String sms settings:::::::::::"+result);
			
			String responseCode = Response.getResponseCode(result); 
			if(responseCode.equals("0")){
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
	
	*/
	
	
	public String validatesmssettings(GenericSettings genericSettingsObj,String customerIdStr,String emailIdStr){
		String result = null;
		try {
			//GenericSettingServiceProxy genericSettingServiceProxy = new GenericSettingServiceProxy();
			genericSettingsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//System.out.println("Request String send sms::::::::::::"+gson.toJson(genericSettingsObj));
			//result = genericSettingServiceProxy.createMessageSettings(gson.toJson(genericSettingsObj));
			/*//System.out.println("Response String sms settings:::::::::::"+result);*/
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("validatesmssettings"), gson.toJson(genericSettingsObj));
			//System.out.println("Response String sms settings:::::::::::"+result);
			
			String responseCode = Response.getResponseCode(result); 
			if(responseCode.equals("0")){
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
	
	
	
	
	
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to call updateMessageSettings method of web service and return the response
	 *
	 **/
	public String updateSMSSettings(GenericSettings settingsObj,String customerIdStr,String emailIdStr){
		String result = null;
		try {
			//GenericSettingServiceProxy genericSettingServiceProxyObj = new GenericSettingServiceProxy();
			settingsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//// log.info("JSON::"+gson.toJson(settingsObj));
			//result = genericSettingServiceProxyObj.updateMessageSettings(gson.toJson(settingsObj));
			//// log.info(result);
			//System.out.println("updateSMSSettings ReQQ::"+gson.toJson(settingsObj));
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_message_settings"), gson.toJson(settingsObj));

			
			 String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					result = AppProperties.getAppMessageByProperty("SMS_SETTING_UPDATE_SUCCESS").trim();
				}
				else{
//					result = "Couldn't update, please try after some time";
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
		//////////////System.out.println(result);
		return result;
	}
	
	
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to get SMS settings
	 *
	 **/
	public List<GenericResponse> getSMSSettings(String customerIdStr,String emailIdStr){
		String result = null;
		GenericSettings settingObj=new GenericSettings();
		GenericResponse responseObj=new GenericResponse();
		List<GenericResponse> mainResponseObj=new ArrayList<GenericResponse>();
		try{
			
			settingObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//GenericSettingServiceProxy genericSettingServiceProxy = new GenericSettingServiceProxy();
			//// log.info("Request::"+gson.toJson(settingObj));
			//result = genericSettingServiceProxy.getMessageSettings(gson.toJson(settingObj));
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			result = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_message_settings"), gson.toJson(settingObj),"GET");

			//System.out.println("Ress::"+result);
			//// log.info("Result"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				responseObj = gson.fromJson(result, GenericResponse.class);
				responseObj.getMessageSettings();
				responseObj.getMessageTemplates();
			}
			mainResponseObj.add(responseObj);
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
		return  mainResponseObj;
	}

/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to get Regional Settings
	 *
	 **/
	public GenericRegionalSettings getRegionalSettings(String customerIdStr,String emailIdStr){
		String result = null;
		GenericRegionalSettings regionalObj = new GenericRegionalSettings();
		GenericResponse responseObj=new GenericResponse();
//		List<GenericResponse> mainResponseObj=new ArrayList<GenericResponse>();
		try{
			
			regionalObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//GenericSettingServiceProxy genericSettingServiceProxy = new GenericSettingServiceProxy();
			
			//result = genericSettingServiceProxy.getRegionalSettings(gson.toJson(regionalObj));
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			result = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_regional_settings"), gson.toJson(regionalObj),"GET");

			
			//////////////System.out.println(result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				responseObj = gson.fromJson(result, GenericResponse.class);
				if(responseObj.getRegionalSettings() != null && responseObj.getRegionalSettings().size() > 0)
					regionalObj = responseObj.getRegionalSettings().get(0);
				else
					regionalObj = null;
			}else
				regionalObj = null;
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
		return  regionalObj;
	}
	
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to call updateRegionalSettings method of web service and return the response
	 *
	 **/
	public String updateRegionalSettings(GenericRegionalSettings settingsObj,String customerIdStr,String emailIdStr){
		String result = null;
		try {
			//GenericSettingServiceProxy genericSettingServiceProxyObj = new GenericSettingServiceProxy();
			settingsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			//result = genericSettingServiceProxyObj.updateRegionalSettings(gson.toJson(settingsObj));
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_regional_settings"), gson.toJson(settingsObj));

			
			
			 String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					result = AppProperties.getAppMessageByProperty("REGIONAL_SETTING_UPDATE_SUCCESS").trim();
				}
				else{
//					result = "Couldn't update, please try after some time";
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
	//	////////////System.out.println(result);
		return result;
	}
	
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to call createRegionalSettings method of web service and return the response
	 *
	 **/
	public String createRegionalSettings(GenericRegionalSettings regionalSettingsObj,String customerIdStr,String emailIdStr){
		String result = null;
		try {
			//GenericSettingServiceProxy genericSettingServiceProxy = new GenericSettingServiceProxy();
			regionalSettingsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			//result = genericSettingServiceProxy.createRegionalSettings(gson.toJson(regionalSettingsObj));
			
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_regional_settings"), gson.toJson(regionalSettingsObj));

			
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("REGIONAL_SETTING_CREATE_SUCCESS").trim();
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
	 * @author Viswanath 
	 * 
	 *This method is used to call createPrintSettings method of web service and return the response
	 *
	 **/
	public String createPrintSettings(PrintSettings settingsObj,String customerIdStr,String emailIdStr){
		String result = null;
		try {
			//GenericSettingServiceProxy genericSettingServiceProxy = new GenericSettingServiceProxy();
			settingsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//////////////System.out.println("Request String::::::::::::"+gson.toJson(settingsObj));
			//result = genericSettingServiceProxy.createPrintSettings(gson.toJson(settingsObj));
			
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_print_settings"), gson.toJson(settingsObj));

			
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("PRINT_SETTING_CREATE_SUCCESS").trim();
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
	 * @author Viswanath 
	 * 
	 *This method is used to call getPrintSettings method of web service and return the response
	 *
	 **/
	public PrintSettings getPrintSettings(String customerIdStr,String emailIdStr){
		String result = null;
		PrintSettings printSettingsObj = new PrintSettings();
		SecuritySettingsResponse responseObj =new SecuritySettingsResponse();
		try{
			printSettingsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//GenericSettingServiceProxy genericSettingServiceProxy = new GenericSettingServiceProxy();
			//result = genericSettingServiceProxy.getPrintSettings(gson.toJson(printSettingsObj));
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			result = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_print_settings"), gson.toJson(printSettingsObj),"GET");

			
			//////////////System.out.println("Result"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				responseObj = gson.fromJson(result, SecuritySettingsResponse.class);
				printSettingsObj = responseObj.getPrintSettingsObj();
				printSettingsObj.setTemplatesList(responseObj.getPrintSettingsObj().getTemplatesList());
				
			}else
				printSettingsObj = null;
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
		return  printSettingsObj;
	}
	
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to call updatePrintSettings method of web service and return the response
	 *
	 **/
	public String updatePrintSettings(PrintSettings settingsObj,String customerIdStr,String emailIdStr){
		String result = null;
		try {
			//GenericSettingServiceProxy genericSettingServiceProxyObj = new GenericSettingServiceProxy();
			settingsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//////////////System.out.println("JSON::"+gson.toJson(settingsObj));
			//result = genericSettingServiceProxyObj.updatePrintSettings(gson.toJson(settingsObj));
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_print_settings"), gson.toJson(settingsObj));

			//////////////System.out.println("Print Response---"+result);
			 String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					result = AppProperties.getAppMessageByProperty("PRINT_SETTING_UPDATE_SUCCESS").trim();
				}
				else{
//					result = "Couldn't update, please try after some time";
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
		//////////////System.out.println(result);
		return result;
	}
	
	/**
	 * 
	 * @author Viswanath 
	 * 
	 *This method is used to call createUserSecuritySettings method of web service and return the response
	 *
	 **/
	public String createUserSecuritySettings(SecuritySettings settingsObj,String customerIdStr,String emailIdStr){
		String result = null;
		try {
			//GenericSettingServiceProxy genericSettingServiceProxy = new GenericSettingServiceProxy();
			settingsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			//result = genericSettingServiceProxy.createSecuritySettings(gson.toJson(settingsObj));
			
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_security_settings"), gson.toJson(settingsObj));

			
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("SECURITY_SETTING_CREATE_SUCCESS").trim();
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
	 * @author Viswanath 
	 * 
	 *This method is used to call getUserSecuritySettings method of web service and return the response
	 *
	 **/
	public SecuritySettings getUserSecuritySettings(String customerIdStr,String emailIdStr){
		String result = null;
		SecuritySettings securitySettingsObj = new SecuritySettings();
		SecuritySettingsResponse responseObj =new SecuritySettingsResponse();
		try{
			
			securitySettingsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//GenericSettingServiceProxy genericSettingServiceProxy = new GenericSettingServiceProxy();
			
			//result = genericSettingServiceProxy.getSecuritySettings(gson.toJson(securitySettingsObj));
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			result = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_security_settings"), gson.toJson(securitySettingsObj),"GET");

			
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				responseObj = gson.fromJson(result, SecuritySettingsResponse.class);
				securitySettingsObj = responseObj.getSecurityObj();
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
		return  securitySettingsObj;
	}
	
	/**
	 * 
	 * @author Viswanath 
	 * 
	 *This method is used to call updateUserSecuritySettings method of web service and return the response
	 *
	 **/
	public String updateUserSecuritySettings(SecuritySettings settingsObj,String customerIdStr,String emailIdStr){
		String result = null;
		try {
			//GenericSettingServiceProxy genericSettingServiceProxyObj = new GenericSettingServiceProxy();
			settingsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			//result = genericSettingServiceProxyObj.updateSecuritySettings(gson.toJson(settingsObj));
			
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_security_settings"), gson.toJson(settingsObj));

			
			 String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					result = AppProperties.getAppMessageByProperty("SECURITY_SETTING_UPDATE_SUCCESS").trim();
				}
				else{
//					result = "Couldn't update, please try after some time";
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
		//////////////System.out.println(result);
		return result;
	}
	/**
	 * 
	 * @author Manasa.P
	 * 
	 *This method is used to call createIntegrationSettings method of web service and return the response
	 *
	 **/
	public String createHardwareAndSoftwaresettings(IntegrationSettings settingsObj,String customerIdStr,String emailIdStr){
		String result = null;
		try {
			///GenericSettingServiceProxy genericSettingServiceProxy = new GenericSettingServiceProxy();
			settingsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
		////////////System.out.println("Request String::::::::::::"+gson.toJson(settingsObj));
			//result = genericSettingServiceProxy.createIntegrationSettings(gson.toJson(settingsObj));
		
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_integration_settings"), gson.toJson(settingsObj));

			
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("INTEGRATION_CREATE_SUCCESS").trim();
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






/*
public String createHardwareAndSoftwaresettings(String settingsObj,String customerIdStr,String emailIdStr){
		String result = null;
		try {
			GenericSettingServiceProxy genericSettingServiceProxy = new GenericSettingServiceProxy();
			
			IntegrationSettings insObj = new IntegrationSettings(); 
			insObj = gson.fromJson(settingsObj, IntegrationSettings.class);
			IntegrationSettings integrationObj = new IntegrationSettings(); 
			integrationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			integrationObj.setIntegrationSettings(insObj);
			// log.info("Request String::::::::::::"+gson.toJson(integrationObj));
//			////////////System.out.println("Request String::::::::::::"+gson.toJson(integrationObj));
			result = genericSettingServiceProxy.createIntegrationSettings(gson.toJson(integrationObj));
			// log.info("Response String:::::::::::"+result);
//			////////////System.out.println("Response String:::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("INTEGRATION_CREATE_SUCCESS").trim();
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
	}*/




/*
*/

/**
	 * 
	 * @author Manasa.P
	 * 
	 *This method is used to call updateIntegrationSettings method of web service and return the response
	 *
	 **/
	public String updateIntegrationSettings(String settingsObj,String customerIdStr,String emailIdStr){
		String result = null;
		try {
			IntegrationSettings insObj = new IntegrationSettings(); 
			insObj = gson.fromJson(settingsObj, IntegrationSettings.class);
			IntegrationSettings integrationSettingObj = new IntegrationSettings();
			integrationSettingObj.setIntegrationSettings(insObj);
			//GenericSettingServiceProxy genericSettingServiceProxyObj = new GenericSettingServiceProxy();
			integrationSettingObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
//			////////////System.out.println(" Request JSON String :"+gson.toJson(integrationSettingObj));
			//result = genericSettingServiceProxyObj.updateIntegrationSettings(gson.toJson(integrationSettingObj));
			
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_integration_settings"), gson.toJson(integrationSettingObj));

			
			//////////////System.out.println(result);
			 String responseCode = Response.getResponseCode(result);
			 if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					result = AppProperties.getAppMessageByProperty("INTEGRATION_UPDATE_SUCCESS").trim();
				}
				else{
//					result = "Couldn't update, please try after some time";
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
		//////////////System.out.println(result);
		return result;
	}
		










/*	*//**
	 * 
	 * @author Manasa.P
	 * 
	 *This method is used to get Mail Settings
	 *
	 **//*
	public IntegrationSettings getIntegartionSettings(String customerIdStr,String emailIdStr){
		String result = null;
		GenericSettings settingObj=new GenericSettings();
		GenericResponse responseObj=new GenericResponse();
		List<GenericResponse> integrationResponseObj=new ArrayList<GenericResponse>();
	  IntegrationSettings integrationResponseObj=new IntegrationSettings();
		try{
			integrationResponseObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			GenericSettingServiceProxy genericSettingServiceProxy = new GenericSettingServiceProxy();
			// log.info("Request::"+gson.toJson(integrationResponseObj));
			//////////////System.out.println("Request::"+gson.toJson(integrationResponseObj));
			result = genericSettingServiceProxy.getIntegrationSettings(gson.toJson(integrationResponseObj));
			// log.info("Result"+result);
			////////////System.out.println("Result"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				integrationResponseObj = gson.fromJson(result, IntegrationSettings.class);
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
		return  integrationResponseObj;
	}
	*/
	/**
	 * 
	 * @author Manasa.P
	 * 
	 *This method is used to call createIntegrationSettings method of web service and return the response
	 *
	 **/
	public String createHardwareAndSoftwaresettings(String settingsObj,String customerIdStr,String emailIdStr){
		String result = null;
		try {
			//GenericSettingServiceProxy genericSettingServiceProxy = new GenericSettingServiceProxy();
			
			IntegrationSettings insObj = new IntegrationSettings(); 
			 
			insObj = gson.fromJson(settingsObj, IntegrationSettings.class);
			IntegrationSettings integrationObj = new IntegrationSettings(); 
			integrationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));

			integrationObj.setIntegrationSettings(insObj);
			
			
			

			//////////System.out.println("Request String::::create_integration_settings::::::::"+gson.toJson(integrationObj));
			//result = genericSettingServiceProxy.createIntegrationSettings(gson.toJson(integrationObj));
			
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_integration_settings"), gson.toJson(integrationObj));

			
			//////////System.out.println("Response String:::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("INTEGRATION_CREATE_SUCCESS").trim();
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





	public IntegrationSettings getIntegartionSettings(String customerIdStr,String emailIdStr){
		String result = null;
	
	  IntegrationSettings integrationResponseObj=new IntegrationSettings();
		try{
			integrationResponseObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//GenericSettingServiceProxy genericSettingServiceProxy = new GenericSettingServiceProxy();
			
			//////////System.out.println("getINtegrations:   "+gson.toJson(integrationResponseObj));
			
			//result = genericSettingServiceProxy.getIntegrationSettings(gson.toJson(integrationResponseObj));
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			result = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_integration_settings"), gson.toJson(integrationResponseObj),"GET");

			
			
			//////////System.out.println("getINtegrations:   "+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				integrationResponseObj = gson.fromJson(result, IntegrationSettings.class);
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
		return  integrationResponseObj;
	}

	
	public String sendTestMsg(String testmsg ,String testmail,String customerIdStr,String emailIdStr, String smtp, String mailId, String password, String port, String protocol){
		String result = null;
		try {
			//GenericSettingServiceProxy genericSettingServiceProxy = new GenericSettingServiceProxy();
			
			IntegrationSettings insObj = new IntegrationSettings(); 
			 
			
			IntegrationSettings integrationObj = new IntegrationSettings(); 
			integrationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			integrationObj.setMessage(testmsg);
			integrationObj.setEmailId(testmail);
			integrationObj.setPassword(password);
			integrationObj.setPortNO(port);
			integrationObj.setEncryptionKey(protocol);
			integrationObj.setServer(smtp);
			integrationObj.setUserID(mailId);
			integrationObj.setUserPassword(password);
			
			
			
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("send_test_mail"), gson.toJson(integrationObj));
				result = Response.getResponseMessage(result);
			
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
	
	
	
	public String createWhatsAppSettings(GenericSettings genericSettingsObj,String customerIdStr,String emailIdStr){
		String result = null;
		try {
			genericSettingsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//System.out.println("Request String: createWhatsAppSettings:::::::::::"+gson.toJson(genericSettingsObj));
			
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_whatsapp_settings"), gson.toJson(genericSettingsObj));
			//System.out.println("Response String::::::::::::"+result);
			String responseCode = Response.getResponseCode(result); 
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("WHATSAPP_SETTING_CREATE_SUCCESS").trim();
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
	
	
	public String updateWhatsAppSettings(GenericSettings settingsObj,String customerIdStr,String emailIdStr){
		String result = null;
		try {
			settingsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//System.out.println("Req  updateWhatsAppSettings ::"+gson.toJson(settingsObj));
			
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_whatsapp_settings"), gson.toJson(settingsObj));
			
			 String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					result = AppProperties.getAppMessageByProperty("WHATSAPP_SETTING_UPDATE_SUCCESS").trim();
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
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to get SMS settings
	 *
	 **/
	public List<GenericResponse> getWhatsAppSettings(String customerIdStr,String emailIdStr){
		String result = null;
		GenericSettings settingObj=new GenericSettings();
		GenericResponse responseObj=new GenericResponse();
		List<GenericResponse> mainResponseObj=new ArrayList<GenericResponse>();
		try{
			
			settingObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//System.out.println("Request  getWhatsAppSettings::"+gson.toJson(settingObj));
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			result = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_whatsapp_settings"), gson.toJson(settingObj),"GET");
			//System.out.println("Response ::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				responseObj = gson.fromJson(result, GenericResponse.class);
				responseObj.getMessageSettings();
				responseObj.getMessageTemplates();
			}
			mainResponseObj.add(responseObj);
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
		return  mainResponseObj;
	}
	

	public String validateWhatsAppSettings(GenericSettings genericSettingsObj,String customerIdStr,String emailIdStr){
		String result = null;
		try {
			genericSettingsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//System.out.println("Request String send whatsApp::::::::::::"+gson.toJson(genericSettingsObj));
			
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("validateWhatsAppTestSettings"), gson.toJson(genericSettingsObj));
			//System.out.println("Response String sms settings:::::::::::"+result);
			
			String responseCode = Response.getResponseCode(result); 
			if(responseCode.equals("0")){
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
	
	
	public List<GenericResponse> getFTPSettings(String customerIdStr,String emailIdStr){
		String result = null;
		GenericSettings settingObj=new GenericSettings();
		GenericResponse responseObj=new GenericResponse();
		List<GenericResponse> mainResponseObj=new ArrayList<GenericResponse>();
		try{
			
			settingObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//System.out.println("Request getFTPSettings::"+gson.toJson(settingObj));
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			result = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_ftp_settings"), gson.toJson(settingObj),"GET");
			//System.out.println("Response ::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				responseObj = gson.fromJson(result, GenericResponse.class);
				responseObj.getMessageSettings();
				responseObj.getMessageTemplates();
			}
			mainResponseObj.add(responseObj);
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
		return  mainResponseObj;
	}
	
	
	public String validateFTPSettings(GenericSettings genericSettingsObj,String customerIdStr,String emailIdStr){
		String result = null;
		try {
			
			genericSettingsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			
			//System.out.println("Request String validateFTPSettings :::"+gson.toJson(genericSettingsObj));
			if(genericSettingsObj.getOperation().equalsIgnoreCase("new"))
				result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_ftp_settings"), gson.toJson(genericSettingsObj));
			else
				result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_ftp_settings"), gson.toJson(genericSettingsObj));
			
			//System.out.println("Response String ::"+result);
			
			String responseCode = Response.getResponseCode(result); 
			if(responseCode.equals("0")){
				result = Response.getResponseMessage(result);
			} else {
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
