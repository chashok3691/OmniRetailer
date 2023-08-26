
/*******************************************************************************
 * Copyright  2015 Omni Retailer Customer Console, All rights reserved.
 * Author : Mythri.Sabath
 * Created On : 20-1-2015
 * 
 * Licensed under the Technolabs Software License, Version 1.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *   http://www.technolabssoftware.com/pages/privacy-policy/
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 ******************************************************************************/

package com.tlabs.posweb.services;

import java.rmi.ConnectException;
import java.rmi.RemoteException;
import java.rmi.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlabs.posweb.init.AppProperties;
import org.apache.commons.lang.LocaleUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.google.gson.Gson;
import com.technolabssoftware.www.MemberServiceProxy;
import com.tlabs.posweb.beans.AccessControl;
import com.tlabs.posweb.beans.ActivityAccessControl;
import com.tlabs.posweb.beans.ChangePasswordForm;
//import com.tlabs.posweb.beans.LicenseDetails;
import com.tlabs.posweb.beans.LoginForm;
import com.tlabs.posweb.beans.RequestBean;
import com.tlabs.posweb.beans.ResponseHeader;
import com.tlabs.posweb.beans.Role;
import com.tlabs.posweb.beans.RoleLocations;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.util.Constants;
import com.tlabs.posweb.util.EncryptAndDecrypt;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
//import com.tlabs.posweb.util.Utilities;
import com.tlabs.posweb.util.RestfulServiceConnection;

/**
 * @author Sahitya
 * Modified By : Sahitya
 * Verified By : 
 * 
 * This class is used for calling all methods of Raw Material web service
 */
public class LoginService {
	
	@Autowired
	private Gson gson;
	@Autowired
	SessionScope sessionScope;
	//private static Properties properties = null;
//	private static Logger log = Logger.getLogger(LoginService.class);
	
	/*static {
	    // Load the properties file
	    try {
	      properties = new Properties();
	      InputStream inputStream = LoginService.class.getClassLoader().getResourceAsStream("commonResources.properties");
	      properties.load(inputStream);
	    } catch (Exception e) {
		    	e.printStackTrace();
	    }
	 }*/
	
	/*public static String AppProperties.getAppMessageByProperty(String constantName) {
		Properties properties = null;
		String constant = null;
		InputStream inputStream = null;
		try {
			properties = new Properties();
			inputStream = LoginService.class.getClassLoader().getResourceAsStream("commonResources.properties");
			properties.load(inputStream);
			constant = (String) properties.get(constantName);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try{
				properties.clear();
				inputStream.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return constant.trim();
	}*/
	
	
	public LoginForm isUserAuthenticated(HttpServletRequest request,HttpServletResponse response, LoginForm loginRequest) {
		String result = null;
		LoginForm loginFormObj = new LoginForm();
		ResponseHeader responseHeaderObj = null;
		LocaleResolver localeResolverObj = null;
		try {
			
			loginRequest.setRequestHeader(RequestHeaderUtil.getRequestHeader(loginRequest.getCustomerId(), loginRequest.getEmailId()));
			
			
			
			/*	added by - vasudev   purpose - using rest service call instead of soap call*/
			RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
			//////System.out.println(gson.toJson(loginRequest));
			result = restFulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("authenticate_user"), gson.toJson(loginRequest),"POST");
			
			// //////System.out.println("loginFormObj::::BEdfore ::"+result);
			loginFormObj = gson.fromJson(result,LoginForm.class);
			// //////System.out.println("loginFormObj::::"+gson.toJson(loginFormObj));
			responseHeaderObj = loginFormObj.getResponseHeader();
			if(responseHeaderObj.getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				localeResolverObj = RequestContextUtils.getLocaleResolver(request);
				Locale currentLocale = LocaleUtils.toLocale(AppProperties.getAppMessageByProperty(loginFormObj.getLanguage()));
				localeResolverObj.setLocale(request, response, LocaleUtils.toLocale(AppProperties.getAppMessageByProperty(loginFormObj.getLanguage())));
				request.getSession().setAttribute("currentLocale", currentLocale);
				//// log.info("roleName::::"+loginFormObj.getRole());
				if(loginFormObj.getGoogleApi()!=null)
				{
					if(loginFormObj.getGoogleApi().getPlacesApiAccess()!=null)
					{
						request.getSession().setAttribute("googleAccessKey", loginFormObj.getGoogleApi().getPlacesApiAccess().getAccessKey());
						request.getSession().setAttribute("googleAccessKeyURL", loginFormObj.getGoogleApi().getPlacesApiAccess().getUrl());
						

					}
					else
					{
						request.getSession().setAttribute("googleAccessKey", "");
						request.getSession().setAttribute("googleAccessKeyURL", "");
						
					}
				}
				else
				{
					request.getSession().setAttribute("googleAccessKey", "");
					request.getSession().setAttribute("googleAccessKeyURL", "");
					
					
				}
				
				//if(loginFormObj.isMultipleUserAccessDB()){
					
					request.getSession().setAttribute("multipleUserDB", loginFormObj.isMultipleUserAccessDB());

				/*}else{
					request.getSession().setAttribute("multipleUserDB", "No");
				}*/
				
				
				if(loginFormObj.getB2cSettings()!=null)
				{
					if(loginFormObj.getB2cSettings().getServiceAreaRequired()!=null)
					{
						
						request.getSession().setAttribute("serviceAreaRequired", loginFormObj.getB2cSettings().getServiceAreaRequired());

					}
					else
					{
						request.getSession().setAttribute("serviceAreaRequired", "No");
					}
					
					if(loginFormObj.getB2cSettings().getB2cRequired()!=null)
					{
						
						request.getSession().setAttribute("b2cRequired", loginFormObj.getB2cSettings().getB2cRequired());

					}
					else
					{
						request.getSession().setAttribute("b2cRequired", "No");
					}
			}
				else
				{
					request.getSession().setAttribute("serviceAreaRequired", "No");
					request.getSession().setAttribute("b2cRequired", "No");
					
				}
				
				
				boolean warehouseLicense = false;
				if(loginFormObj.getLicenseDetails() != null){
					for(int i=0;i<loginFormObj.getLicenseDetails().size();i++){
						if(loginFormObj.getLicenseDetails().get(i).getLicenseType().contains("Warehouse Management") )
							warehouseLicense = true;
					}
				}
				loginFormObj.setWarehouseLicense(warehouseLicense);
				boolean restaruntLicense = false;
				if(loginFormObj.getLicenseDetails() != null){
					for(int i=0;i<loginFormObj.getLicenseDetails().size();i++){
						if(loginFormObj.getLicenseDetails().get(i).getLicenseType().contains("Restaurant Management") )
							restaruntLicense = true;
					}
				}
				loginFormObj.setRestaruntLicense(restaruntLicense);
				
				
//				loginFormObj.setRole("super admin");
				if(loginFormObj.getRole().contains("super admin")){
					/*loginFormObj.setAccessControlList(getAccessControlList(loginFormObj.getRoles()));
					loginFormObj.setActivityAccessControlList(getActivityAccessControlList(loginFormObj.getRoles()));
					loginFormObj.setRoleLocationsList(getRoleLocationsList(loginFormObj.getRoles()));*/
				}
				else{
					loginFormObj.setAccessControlList(getAccessControlList(loginFormObj.getRoles()));
					////////System.out.println("LoginFormObjAccessController"+gson.toJson(loginFormObj.getRoles()));
					loginFormObj.setActivityAccessControlList(getActivityAccessControlList(loginFormObj.getRoles()));
					////////System.out.println("LoginFormObjAccessController"+gson.toJson(loginFormObj.getActivityAccessControlList()));
					loginFormObj.setRoleLocationsList(getRoleLocationsList(loginFormObj.getRoles()));
					
				}
				loginFormObj.setRoles(null);
				loginFormObj.setStatus(Constants.SUCCESS);
				/*if(loginFormObj.getLogo() != null && loginFormObj.getLogo().length != 0){
					String encodedImage = Base64.encode(loginFormObj.getLogo());
					if(obj_SkuMasterBean.getPicture1() != null && obj_SkuMasterBean.getPicture1().length != 0){
						encodedImage = Base64.encode(obj_SkuMasterBean.getPicture1());
					}
					obj_SkuMasterBean.setStrPicture1(encodedImage);
				}*/
				////////////System.out.println(loginFormObj.getGoogleApi().getPlacesApiAccess().getUrl()+"dddddddddddddddddddddddddd");
			}else{
				loginFormObj.setStatus(responseHeaderObj.getResponseMessage());
			}
		} catch(ConnectException ce) {
			ce.printStackTrace();
			result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
			loginFormObj.setStatus(result);
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST");
			loginFormObj.setStatus(result);
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			result = AppProperties.getAppMessageByProperty("UNKNOWN_HOST");
			loginFormObj.setStatus(result);
		} catch(RemoteException rme){
			rme.printStackTrace();
			result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
			loginFormObj.setStatus(result);
		} catch(Exception e){
			e.printStackTrace();
			loginFormObj.setStatus(Constants.LOGIN_FAILED);
		}
		return loginFormObj;
	}
	
	
	public List<String> getRoleLocationsList(List<Role> roles){
		Set<String> locationslist = new HashSet<String>();
		List<String> locList = new ArrayList<String>();
		try{
			for(Role role : roles){
				for(RoleLocations roleLoc : role.getRoleLocations()){
					locationslist.add(roleLoc.getLocation());
				}
			}
			
			for (String setlist : locationslist) {
				locList.add(setlist);
			}
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return locList;
	}
	
	/**
	 * @author Mythri.S
	 * @param changePasswordForm
	 * 
	 * This method is used to call the changePassword method of web service and return the response
	 */
	public String isPasswordChanged(ChangePasswordForm changePasswordForm){
		String result = null;
		try {
			// log.info("isPasswordChanged() called");
			//MemberServiceProxy member = new MemberServiceProxy();
			changePasswordForm.setRequestHeader(RequestHeaderUtil.getRequestHeader(changePasswordForm.getUid(), changePasswordForm.getEid()));
			String changePassword = gson.toJson(changePasswordForm);
			
			//result = member.changePassword(changePassword);
			/**	added by - vasudev   purpose - using rest service call instead of soap call*/
			RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
			result = restFulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("change_password"), changePassword);

			
			result = Response.getResponseCode(result);
			// log.info(result);
		}  catch(ConnectException ce) {
			ce.printStackTrace();
			result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST");
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			result = AppProperties.getAppMessageByProperty("UNKNOWN_HOST");
		} catch(RemoteException rme){
			rme.printStackTrace();
			result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
		} catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	 /**
	  * @author Sahitya
	  * Verified By : 
	  * 
	  * @param customerId,emailId
	  * 
      * This method is used to send customerid & emailid to web-services
      *  
      * @return status
      */
	public String forgotPassword(String customerIdStr,String emailIdStr,String url){
		MemberServiceProxy loginProxyObj = null;
		RequestBean beanObj = null;
		String serviceResultStr = null,statusStr=null;
		try{
			// log.info("Service : Forgot Password");
			//loginProxyObj = new MemberServiceProxy();
			beanObj = new RequestBean();
			beanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			beanObj.setUrl(url);
			beanObj.setUserName(emailIdStr);
			beanObj.setCustomerId(customerIdStr);
			
		/*	// log.info("Request String:::"+gson.toJson(beanObj));
			serviceResultStr = loginProxyObj.generateOTP(gson.toJson(beanObj));
			// log.info("Response String:::"+serviceResultStr);*/
			//////System.out.println(gson.toJson(beanObj));
			RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
			serviceResultStr = restFulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("generate_otp"),gson.toJson(beanObj),"POST");
//////System.out.println(serviceResultStr);
			
			beanObj = gson.fromJson(serviceResultStr,RequestBean.class);
			if(beanObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				statusStr = Constants.SUCCESS;
			}
		} catch(ConnectException ce) {
			ce.printStackTrace();
			statusStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			statusStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST");
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			statusStr = AppProperties.getAppMessageByProperty("UNKNOWN_HOST");
		} catch(RemoteException rme){
			rme.printStackTrace();
			statusStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
		} catch(Exception e){
			e.printStackTrace();
			statusStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
		}
		return statusStr;
	}
	
	
	

	 /**
	  * @author Sahitya
	  * Verified By : 
	  * 
	  * @param form object which consists of customerid, emailid, new password
	  * 
     * This method is used to send reset password details to web-services
     *  
     * @return status
     */
	public String resetPassword(ChangePasswordForm formObj){
		//MemberServiceProxy loginProxyObj = null;
		RequestBean beanObj = null;
		String serviceResultStr = null,statusStr=null;
		try{
			// log.info("Service : Reset Password");
			//loginProxyObj = new MemberServiceProxy();
			beanObj = new RequestBean();
			beanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(EncryptAndDecrypt.decrypt(formObj.getUid()),EncryptAndDecrypt.decrypt(formObj.getEid())));
			beanObj.setEmailId(EncryptAndDecrypt.decrypt(formObj.getEid()));
			beanObj.setPassword(formObj.getNewPassword());
			
			/*// log.info("Request String:::"+gson.toJson(beanObj));	
			serviceResultStr = loginProxyObj.resetPassword(gson.toJson(beanObj));
			// log.info("Response String:::"+serviceResultStr);*/
			
			RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
			serviceResultStr = restFulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("reset_password"),gson.toJson(beanObj));

			
			beanObj = gson.fromJson(serviceResultStr,RequestBean.class);
			if(beanObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				statusStr = Constants.SUCCESS;
			}
		} catch(ConnectException ce) {
			ce.printStackTrace();
			statusStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			statusStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST");
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			statusStr = AppProperties.getAppMessageByProperty("UNKNOWN_HOST");
		} catch(RemoteException rme){
			rme.printStackTrace();
			statusStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
		} catch(Exception e){
			e.printStackTrace();
			statusStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
		}
		
		return statusStr;
		
	}
	
	public Map<String,List<AccessControl>> getAccessControlList(List<Role> roles){
		Map<String,List<AccessControl>> accessControlMap = null;
		List<AccessControl> accessControlList = new ArrayList<AccessControl>();
		try{
			for(Role role : roles){
				for(AccessControl accessControl : role.getAccessControl()){
					for(AccessControl oldAccessControl : accessControlList){
						if(accessControl.equals(oldAccessControl)){
							if(accessControl.isRead() == true || oldAccessControl.isRead() == true)
								accessControl.setRead(true);
							if(accessControl.isWrite() == true || oldAccessControl.isWrite() == true)
								accessControl.setWrite(true);
							accessControlList.remove(oldAccessControl);
							break;
						}
					}
					accessControlList.add(accessControl);
				}
			}
			accessControlMap = getAccessControlBasedOnFlow(accessControlList);
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return accessControlMap;
	}
	
	public Map<String,List<ActivityAccessControl>> getActivityAccessControlList(List<Role> roles){
		Map<String,List<ActivityAccessControl>> activityAccessControlMap = null;
		List<ActivityAccessControl> activityAccessControlList = new ArrayList<ActivityAccessControl>();
		try{
		//	//////System.out.println("BEfore::"+gson.toJson(roles));
			for(Role role : roles){
				for(ActivityAccessControl activityAccessControl : role.getAccessControlActivity()){
					for(ActivityAccessControl oldActivityAccessControl : activityAccessControlList){
						
						if(activityAccessControl.equals(oldActivityAccessControl) && activityAccessControl.getAppDocumentActivity().equals(oldActivityAccessControl.getAppDocumentActivity())){
							if(activityAccessControl.isActivityRead() == true || oldActivityAccessControl.isActivityRead() == true)
								activityAccessControl.setActivityRead(true);
							if(activityAccessControl.isActivityWrite() == true || oldActivityAccessControl.isActivityWrite() == true)
								activityAccessControl.setActivityWrite(true);
							activityAccessControlList.remove(oldActivityAccessControl);
							break;
						}
					}
					activityAccessControlList.add(activityAccessControl);
				}
			}
			////////System.out.println(gson.toJson(activityAccessControlList));
			activityAccessControlMap = getActivityAccessControlBasedOnFlow(activityAccessControlList);
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return activityAccessControlMap;
	}
	
	
	/*public List<AccessControl> setAccessControlListForSuperAdmin(){
		// log.info("setAccessControlListForSuperAdmin");
		List<AccessControl> accessControlList = new ArrayList<AccessControl>();
		AccessControl accessControl = new AccessControl();
		//accessControl.setAppName("Console");
		accessControl.setAppFlow("UserAccessControl");
		accessControl.setAppSubflow("RolesManagement");
		accessControl.setAppDocument("RolesManagement");
		//accessControl.setRead(true);
		//accessControl.setWrite(true);
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("UserAccessControl");
		accessControl.setAppSubflow("UserManagement");
		accessControl.setAppDocument("UserManagement");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("GenericBusinessSettings");
		accessControl.setAppSubflow("TaxMaster");
		accessControl.setAppDocument("TaxMaster");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("OutletManagement");
		accessControl.setAppSubflow("CounterMaster");
		accessControl.setAppDocument("CounterMaster");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("GenericBusinessSettings");
		accessControl.setAppSubflow("CurrencyMaster");
		accessControl.setAppDocument("CurrencyMaster");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("GenericBusinessSettings");
		accessControl.setAppSubflow("EmployeeMaster");
		accessControl.setAppDocument("EmployeeMaster");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("GenericBusinessSettings");
		accessControl.setAppSubflow("LocationMaster");
		accessControl.setAppDocument("LocationMaster");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("DataManagement");
		accessControl.setAppSubflow("Import");
		accessControl.setAppDocument("Import");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("DataManagement");
		accessControl.setAppSubflow("Export");
		accessControl.setAppDocument("Export");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("DataManagement");
		accessControl.setAppSubflow("BackupOperations");
		accessControl.setAppDocument("BackupOperations");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("DataManagement");
		accessControl.setAppSubflow("RecoveryOperations");
		accessControl.setAppDocument("RecoveryOperations");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("EventLog");
		accessControl.setAppDocument("EventLog");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("OutletManagement");
		accessControl.setAppSubflow("Configuration");
		accessControl.setAppDocument("Configuration");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("OutletManagement");
		accessControl.setAppSubflow("BillingAndPayments");
		accessControl.setAppDocument("BillingAndPayments");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("OutletManagement");
		accessControl.setAppSubflow("CustomerOrders");
		accessControl.setAppDocument("CustomerOrders");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("OutletManagement");
		accessControl.setAppSubflow("Shipments");
		accessControl.setAppDocument("Shipments");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("OutletManagement");
		accessControl.setAppSubflow("InventoryManagement");
		accessControl.setAppDocument("OutletStocks");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("OutletManagement");
		accessControl.setAppSubflow("InventoryManagement");
		accessControl.setAppDocument("OutletGoodsReceipt");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("OutletManagement");
		accessControl.setAppSubflow("InventoryManagement");
		accessControl.setAppDocument("OutletGoodsIssue");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("OutletManagement");
		accessControl.setAppSubflow("InventoryManagement");
		accessControl.setAppDocument("OutletStockVerification");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("OutletManagement");
		accessControl.setAppSubflow("OutletReports");
		accessControl.setAppDocument("OutletReports");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("DealsAndOffers");
		accessControl.setAppSubflow("DealsAndOffersConfiguration");
		accessControl.setAppDocument("DealsAndOffersConfiguration");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("DealsAndOffers");
		accessControl.setAppSubflow("DealsAndOffersReports");
		accessControl.setAppDocument("DealsAndOffersReports");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("LoyaltyProgram");
		accessControl.setAppSubflow("GiftVoucher");
		accessControl.setAppDocument("GiftVoucher");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("LoyaltyProgram");
		accessControl.setAppSubflow("GiftCoupons");
		accessControl.setAppDocument("GiftCoupons");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("LoyaltyProgram");
		accessControl.setAppSubflow("Loyaltycards");
		accessControl.setAppDocument("Loyaltycards");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("LoyaltyProgram");
		accessControl.setAppSubflow("LoyaltyReports");
		accessControl.setAppDocument("LoyaltyReports");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("WarehouseManagement");
		accessControl.setAppSubflow("WarehouseConfigurations");
		accessControl.setAppDocument("WarehouseConfigurations");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("WarehouseManagement");
		accessControl.setAppSubflow("WarehouseStockmanagement");
		accessControl.setAppDocument("WarehouseStock");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("WarehouseManagement");
		accessControl.setAppSubflow("WarehouseStockmanagement");
		accessControl.setAppDocument("WarehouseStockVerification");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("WarehouseManagement");
		accessControl.setAppSubflow("WarehouseProcurement");
		accessControl.setAppDocument("WarehousePurchaseOrder");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("WarehouseManagement");
		accessControl.setAppSubflow("WarehouseProcurement");
		accessControl.setAppDocument("WarehouseShipmentNotes");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("WarehouseManagement");
		accessControl.setAppSubflow("WarehouseProcurement");
		accessControl.setAppDocument("WarehouseProcurementGoodsReceipt");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("WarehouseManagement");
		accessControl.setAppSubflow("WarehouseProcurement");
		accessControl.setAppDocument("WarehouseInspectionReceipt");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("WarehouseManagement");
		accessControl.setAppSubflow("WarehouseProcurement");
		accessControl.setAppDocument("WarehouseInvoicing");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("WarehouseManagement");
		accessControl.setAppSubflow("WarehouseProcurement");
		accessControl.setAppDocument("WarehousePayments");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("WarehouseManagement");
		accessControl.setAppSubflow("WarehouseGoodsTransfer");
		accessControl.setAppDocument("WarehouseGoodsReceipt");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("WarehouseManagement");
		accessControl.setAppSubflow("WarehouseGoodsTransfer");
		accessControl.setAppDocument("WarehouseGoodsIssue");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("WarehouseManagement");
		accessControl.setAppSubflow("WarehouseSales");
		accessControl.setAppDocument("WarehouseOrders");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("WarehouseManagement");
		accessControl.setAppSubflow("WarehouseSales");
		accessControl.setAppDocument("WarehouseShipments");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("WarehouseManagement");
		accessControl.setAppSubflow("WarehouseSales");
		accessControl.setAppDocument("WarehouseSalesInvoicing");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("MasterDataManagement");
		accessControl.setAppSubflow("ProductMaster");
		accessControl.setAppDocument("ProductMaster");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("MasterDataManagement");
		accessControl.setAppSubflow("SupplierMaster");
		accessControl.setAppDocument("SupplierMaster");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("MasterDataManagement");
		accessControl.setAppSubflow("SkuMaster");
		accessControl.setAppDocument("SkuMaster");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("MasterDataManagement");
		accessControl.setAppSubflow("CategoryMaster");
		accessControl.setAppDocument("CategoryMaster");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("MasterDataManagement");
		accessControl.setAppSubflow("SubcategoryMaster");
		accessControl.setAppDocument("SubcategoryMaster");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("OutletManagement");
		accessControl.setAppSubflow("ShiftManagement");
		accessControl.setAppDocument("ShiftMaster");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("OutletManagement");
		accessControl.setAppSubflow("ShiftManagement");
		accessControl.setAppDocument("ShiftConfiguration");
		accessControlList.add(accessControl);
		accessControl = new AccessControl();
		accessControl.setAppFlow("Dashboard");
		accessControl.setAppDocument("Dashboard");
		accessControlList.add(accessControl);
		for(int i =0; i<accessControlList.size();i++){
			accessControlList.get(i).setAppName("Console");
			accessControlList.get(i).setRead(true);
			accessControlList.get(i).setWrite(true);
		}
		// log.info(accessControlList.size());
		return accessControlList;
	}
*/
	
	
	public Map<String,List<AccessControl>> getAccessControlBasedOnFlow(List<AccessControl> accessControlList){
//		Map<String,Boolean> menuList = new HashMap<>();
		Map<String,List<AccessControl>> accessControlMap = new HashMap<String, List<AccessControl>>();
		List<AccessControl> dashboard = new ArrayList<AccessControl>();
		List<AccessControl> userAccessControlList = new ArrayList<AccessControl>();
		List<AccessControl> dataManagementList = new ArrayList<AccessControl>();
		List<AccessControl> genericMasterList = new ArrayList<AccessControl>();
		List<AccessControl> outletMasterList = new ArrayList<AccessControl>();
		List<AccessControl> warehouseMasterList = new ArrayList<AccessControl>();
		List<AccessControl> systemLogList = new ArrayList<AccessControl>();
		List<AccessControl> settingsList = new ArrayList<AccessControl>();
		List<AccessControl> outletSalesReportsList = new ArrayList<AccessControl>();
		List<AccessControl> outletOtherReportsList = new ArrayList<AccessControl>();
		List<AccessControl> warehouseReportsList = new ArrayList<AccessControl>();

		List<AccessControl> warehouseProcurementShipmentList = new ArrayList<AccessControl>();
		List<AccessControl> outletManagementList = new ArrayList<AccessControl>();
		List<AccessControl> shiftManagementList = new ArrayList<AccessControl>();
		
		
		List<AccessControl> outletCustomerOrderList = new ArrayList<AccessControl>();
		List<AccessControl> outletShipmentList = new ArrayList<AccessControl>();
		List<AccessControl> outletStocksList = new ArrayList<AccessControl>();
		
		List<AccessControl> priceManagementList = new ArrayList<AccessControl>();
		
		List<AccessControl> outletGoodsTransferList = new ArrayList<AccessControl>();
		List<AccessControl> outletStockVerificationList = new ArrayList<AccessControl>();
		//added by manasa
		
		List<AccessControl> warehouseshiftManagementList = new ArrayList<AccessControl>();
		List<AccessControl> outletStockVerificationReportList = new ArrayList<AccessControl>();
		List<AccessControl> outletMaterialConsumptionList = new ArrayList<AccessControl>();
		List<AccessControl> outletSuppliersMovementsList= new ArrayList<AccessControl>();
		List<AccessControl> outletKeyValueProductsList= new ArrayList<AccessControl>();
		List<AccessControl> outletStockMovementList= new ArrayList<AccessControl>();
		
		List<AccessControl> outletHealthList = new ArrayList<AccessControl>();
		
		
		
		
		List<AccessControl> warehouseManagementList = new ArrayList<AccessControl>();
		List<AccessControl> warehouseStockmanagementList = new ArrayList<AccessControl>();
		List<AccessControl> warehouseProcurementList = new ArrayList<AccessControl>();
		List<AccessControl> warehouseStockTransferList = new ArrayList<AccessControl>();
		List<AccessControl> warehouseSalesOrderList = new ArrayList<AccessControl>();
		
		List<AccessControl> procurementList = new ArrayList<AccessControl>();
		List<AccessControl> orderManagemetSalesOrderList = new ArrayList<AccessControl>();
		List<AccessControl> orderManagemetSalesOrderVsStockList = new ArrayList<AccessControl>();
		List<AccessControl> orderManagemetSalesOrderFulfilmentList = new ArrayList<AccessControl>();
		List<AccessControl> orderManagemetSalesOrderPaymentsList = new ArrayList<AccessControl>();
		List<AccessControl> dealsAndOffersList = new ArrayList<AccessControl>();
		
		List<AccessControl> campaignPromotionsList = new ArrayList<AccessControl>();
		
		List<AccessControl> customerLoyalityList = new ArrayList<AccessControl>();
		List<AccessControl> loyaltyProgramList = new ArrayList<AccessControl>();
		List<AccessControl> crmList = new ArrayList<AccessControl>();
		List<AccessControl> b2cManagementList = new ArrayList<AccessControl>();
		
		List<AccessControl> FinantialList = new ArrayList<AccessControl>();
		List<AccessControl> ReportsList = new ArrayList<AccessControl>();
		List<AccessControl> CampaignReportsList = new ArrayList<AccessControl>();
		
		//added by manasa
		List<AccessControl> restaurantManagementList = new ArrayList<AccessControl>();
		List<AccessControl> outletGRNReportsList = new ArrayList<AccessControl>();
		
		List<AccessControl> outletMonitoringList = new ArrayList<AccessControl>();
		
		
		
		for(AccessControl accessControl : accessControlList){
			if(accessControl.getAppFlow().equalsIgnoreCase("Dashboard"))
				dashboard.add(accessControl);
			else if(accessControl.getAppFlow().equalsIgnoreCase("UserAccessControl"))
				userAccessControlList.add(accessControl);
			else if(accessControl.getAppFlow().equalsIgnoreCase("DataManagement"))
				dataManagementList.add(accessControl);
			else if(accessControl.getAppFlow().equalsIgnoreCase("MasterDataManagement")){
				if(accessControl.getAppSubflow().equalsIgnoreCase("OutletMasterSettings"))
				{
					outletMasterList.add(accessControl);
					if((accessControl.getAppDocument().equalsIgnoreCase("PriceManagement")))
					{
						priceManagementList.add(accessControl);
					}
				}
				if(accessControl.getAppSubflow().equalsIgnoreCase("WarehouseMasterSettings"))
					warehouseMasterList.add(accessControl);
				if(accessControl.getAppSubflow().equalsIgnoreCase("GenericBusinessSettings"))
					genericMasterList.add(accessControl);
			}
			else if(accessControl.getAppFlow().equalsIgnoreCase("Settings"))
				settingsList.add(accessControl);
			else if(accessControl.getAppFlow().equalsIgnoreCase("EventLog"))
				systemLogList.add(accessControl);
			else if(accessControl.getAppFlow().equalsIgnoreCase("Reports")){
				  ReportsList.add(accessControl);
				if(accessControl.getAppDocument().equalsIgnoreCase("OutletSalesReports"))
					outletSalesReportsList.add(accessControl);
				else if(accessControl.getAppDocument().equalsIgnoreCase("OutletGRNReports"))
					outletGRNReportsList.add(accessControl);
				else if(accessControl.getAppSubflow().equalsIgnoreCase("OutletReports"))
					outletOtherReportsList.add(accessControl);
				else if(accessControl.getAppSubflow().equalsIgnoreCase("WarehouseReports"))
					warehouseReportsList.add(accessControl);
				else if(accessControl.getAppSubflow().equalsIgnoreCase("CampaignReports"))
					CampaignReportsList.add(accessControl);
				
				
			}
			else if(accessControl.getAppFlow().equalsIgnoreCase("OutletManagement")){
				if(accessControl.getAppSubflow().equalsIgnoreCase("ShiftManagement"))
					shiftManagementList.add(accessControl);
				
				else if(accessControl.getAppSubflow().equalsIgnoreCase("RestaurentManagement"))
					restaurantManagementList.add(accessControl);
				else if(accessControl.getAppSubflow().equalsIgnoreCase("OutletMonitoring"))
					outletMonitoringList.add(accessControl);
				else if(accessControl.getAppSubflow().equalsIgnoreCase("outletCustomerOrders"))
					outletCustomerOrderList.add(accessControl);
				else if(accessControl.getAppSubflow().equalsIgnoreCase("OutletShipments"))
					outletShipmentList.add(accessControl);
				else if(accessControl.getAppDocument().equalsIgnoreCase("OutletStocks"))
					outletStocksList.add(accessControl);
				else if(accessControl.getAppDocument().equalsIgnoreCase("OutletGoodsTransfer"))
					outletGoodsTransferList.add(accessControl);
				else if(accessControl.getAppDocument().equalsIgnoreCase("OutletStockVerifications"))
					outletStockVerificationList.add(accessControl);
				
				else if(accessControl.getAppDocument().equalsIgnoreCase("StoreStockVerification"))
					outletStockVerificationReportList.add(accessControl);
				else if(accessControl.getAppDocument().equalsIgnoreCase("OutletMaterialConsumption"))
					outletMaterialConsumptionList.add(accessControl);
				else if(accessControl.getAppDocument().equalsIgnoreCase("OutletStockMovement"))
					outletStockMovementList.add(accessControl);
				else if(accessControl.getAppDocument().equalsIgnoreCase("OutletSuppliersMovements"))
					outletSuppliersMovementsList.add(accessControl);
				else if(accessControl.getAppDocument().equalsIgnoreCase("OutletKeyValueProducts"))
					outletKeyValueProductsList.add(accessControl);
				else if(accessControl.getAppSubflow().equalsIgnoreCase("OutletHealth"))
					outletHealthList.add(accessControl);
				else
					outletManagementList.add(accessControl);
			}
			else if(accessControl.getAppFlow().equalsIgnoreCase("WarehouseManagement")){
				if(accessControl.getAppSubflow().equalsIgnoreCase("WarehouseStockmanagement"))
					warehouseStockmanagementList.add(accessControl);
				 if(accessControl.getAppSubflow().equalsIgnoreCase("WarehouseShiftManagement"))
					warehouseshiftManagementList.add(accessControl);
				
				else if(accessControl.getAppSubflow().equalsIgnoreCase("WarehouseProcurement"))
					warehouseProcurementList.add(accessControl);
				else if(accessControl.getAppDocument().equalsIgnoreCase("WarehouseGoodsTransfer"))
					warehouseStockTransferList.add(accessControl);
				else if(accessControl.getAppSubflow().equalsIgnoreCase("WarehouseSalesOrder"))
					warehouseSalesOrderList.add(accessControl);
				else if(accessControl.getAppDocument().equalsIgnoreCase("WarehouseProcurementShipment"))
					warehouseProcurementShipmentList.add(accessControl);
				else
					warehouseManagementList.add(accessControl);
			}
			else if(accessControl.getAppFlow().equalsIgnoreCase("Procurement"))
				procurementList.add(accessControl);
			else if(accessControl.getAppFlow().equalsIgnoreCase("OrderManagement")){
				if(accessControl.getAppSubflow().equalsIgnoreCase("OrderManagementSalesOrder"))
					orderManagemetSalesOrderList.add(accessControl); 
				else if(accessControl.getAppSubflow().equalsIgnoreCase("OrderManagementFulFillment"))
					orderManagemetSalesOrderFulfilmentList.add(accessControl);
				else if(accessControl.getAppSubflow().equalsIgnoreCase("OrderManagementSalesOrderVsStock"))
					orderManagemetSalesOrderVsStockList.add(accessControl);
				else if(accessControl.getAppSubflow().equalsIgnoreCase("OrderManagementPayments"))
					orderManagemetSalesOrderPaymentsList.add(accessControl);
			}
			else if(accessControl.getAppFlow().equalsIgnoreCase("DealsAndOffers"))
			{
				dealsAndOffersList.add(accessControl);
				if(accessControl.getAppSubflow().equalsIgnoreCase("CampaignPromotions"))
				campaignPromotionsList.add(accessControl);
//				else
					
			}
			
			else if(accessControl.getAppFlow().equalsIgnoreCase("CustomerLoyality"))
				customerLoyalityList.add(accessControl);
			else if(accessControl.getAppFlow().equalsIgnoreCase("crm")){
				if(accessControl.getAppSubflow().equalsIgnoreCase("LoyaltyProgram"))
					loyaltyProgramList.add(accessControl);
				else
					crmList.add(accessControl);
			}
			else if(accessControl.getAppFlow().equalsIgnoreCase("b2cManagement"))
			{
				b2cManagementList.add(accessControl);
			}
			else if(accessControl.getAppFlow().equalsIgnoreCase("Finantial"))
			{
				FinantialList.add(accessControl);
			}
			else if(accessControl.getAppFlow().equalsIgnoreCase("Reports"))
			{
				
			}
				
			
		}
		////////////System.out.println("Reports list::::::::::::::::::::::::::"+gson.toJson(ReportsList));
		////////////System.out.println("FinantialList list::::::::::::::::::::::::::"+gson.toJson(FinantialList));
		accessControlMap.put("dashboard", dashboard);
		accessControlMap.put("userAccessControlList", userAccessControlList);
		accessControlMap.put("dataManagementList", dataManagementList);
		accessControlMap.put("genericMasterList", genericMasterList);
		accessControlMap.put("outletMasterList", outletMasterList);
		accessControlMap.put("warehouseMasterList", warehouseMasterList);
		accessControlMap.put("systemLogList", systemLogList);
		accessControlMap.put("settingsList", settingsList);
		accessControlMap.put("outletSalesReportsList", outletSalesReportsList);
		accessControlMap.put("outletGRNReportsList", outletGRNReportsList);
		accessControlMap.put("outletOtherReportsList", outletOtherReportsList);
//		accessControlMap.put("outletGRNReportsList", outletGRNReportsList);
		accessControlMap.put("warehouseReportsList", warehouseReportsList);
		accessControlMap.put("CampaignReportsList", CampaignReportsList);
		
		accessControlMap.put("warehouseProcurementShipmentList", warehouseProcurementShipmentList);
		accessControlMap.put("outletManagementList", outletManagementList);
		accessControlMap.put("shiftManagementList", shiftManagementList);
		//added by manasa
		accessControlMap.put("warehouseshiftManagementList", warehouseshiftManagementList);
		accessControlMap.put("priceManagementList", priceManagementList);
		accessControlMap.put("restaurantManagementList", restaurantManagementList);
		accessControlMap.put("outletMonitoringList", outletMonitoringList);
		accessControlMap.put("outletCustomerOrderList", outletCustomerOrderList);
		accessControlMap.put("outletShipmentList", outletShipmentList);
		accessControlMap.put("outletStocksList", outletStocksList);
		accessControlMap.put("outletGoodsTransferList", outletGoodsTransferList);
		accessControlMap.put("outletMaterialConsumptionList", outletMaterialConsumptionList);
		accessControlMap.put("outletSuppliersMovementsList", outletSuppliersMovementsList);
		accessControlMap.put("outletKeyValueProductsList", outletKeyValueProductsList);
		accessControlMap.put("outletStockMovementList", outletStockMovementList);
		accessControlMap.put("outletStockVerificationList", outletStockVerificationList);
		
		accessControlMap.put("outletStockVerificationReportList", outletStockVerificationReportList);
		accessControlMap.put("outletHealthList", outletHealthList);
		
		accessControlMap.put("warehouseManagementList", warehouseManagementList);
		accessControlMap.put("warehouseStockmanagementList", warehouseStockmanagementList);
		
		
		accessControlMap.put("warehouseProcurementList", warehouseProcurementList);
		accessControlMap.put("warehouseStockTransferList", warehouseStockTransferList);
		accessControlMap.put("warehouseSalesOrderList", warehouseSalesOrderList);
		
		accessControlMap.put("procurementList", procurementList);
		accessControlMap.put("orderManagemetSalesOrderList", orderManagemetSalesOrderList);
		accessControlMap.put("orderManagemetSalesOrderFulfilmentList", orderManagemetSalesOrderFulfilmentList);
		
		accessControlMap.put("orderManagemetSalesOrderPaymentsList", orderManagemetSalesOrderPaymentsList);
		accessControlMap.put("orderManagemetSalesOrderVsStockList", orderManagemetSalesOrderVsStockList);
		
		accessControlMap.put("dealsAndOffersList", dealsAndOffersList);
		accessControlMap.put("campaignPromotionsList", campaignPromotionsList);
		accessControlMap.put("loyaltyProgramList", loyaltyProgramList);
		accessControlMap.put("crmList", crmList);
		accessControlMap.put("b2cManagementList", b2cManagementList);
		accessControlMap.put("FinantialList", FinantialList);
		accessControlMap.put("ReportsList", ReportsList);
		accessControlMap.put("customerLoyalityList", customerLoyalityList);
		
		return accessControlMap;
	}
	
	
	
	//koti
	
	public Map<String,List<ActivityAccessControl>> getActivityAccessControlBasedOnFlow(List<ActivityAccessControl> activityAccessControlList){
		Map<String,List<ActivityAccessControl>> activityAccessControlMap = new HashMap<String, List<ActivityAccessControl>>();
//		List<ActivityAccessControl> dashboard = new ArrayList<ActivityAccessControl>();
//		List<ActivityAccessControl> userAccessControlList = new ArrayList<ActivityAccessControl>();
//		List<ActivityAccessControl> dataManagementList = new ArrayList<ActivityAccessControl>();
//		List<ActivityAccessControl> genericMasterList = new ArrayList<ActivityAccessControl>();
//		List<ActivityAccessControl> outletMasterList = new ArrayList<ActivityAccessControl>();
//		List<ActivityAccessControl> systemLogList = new ArrayList<ActivityAccessControl>();
//		List<ActivityAccessControl> settingsList = new ArrayList<ActivityAccessControl>();
//		List<ActivityAccessControl> outletSalesReportsList = new ArrayList<ActivityAccessControl>();
//		List<ActivityAccessControl> outletOtherReportsList = new ArrayList<ActivityAccessControl>();
//		List<ActivityAccessControl> warehouseReportsList = new ArrayList<ActivityAccessControl>();
		
//		List<ActivityAccessControl> outletManagementList = new ArrayList<ActivityAccessControl>();
//		List<ActivityAccessControl> shiftManagementList = new ArrayList<ActivityAccessControl>();
		List<ActivityAccessControl> outletCustomerOrderList = new ArrayList<ActivityAccessControl>();
		List<ActivityAccessControl> outletShipmentList = new ArrayList<ActivityAccessControl>();
//		List<ActivityAccessControl> outletStocksList = new ArrayList<ActivityAccessControl>();
		List<ActivityAccessControl> outletGoodsTransferList = new ArrayList<ActivityAccessControl>();
//		List<ActivityAccessControl> outletStockVerificationList = new ArrayList<ActivityAccessControl>();
//		List<ActivityAccessControl> outletHealthList = new ArrayList<ActivityAccessControl>();
		
//		List<ActivityAccessControl> warehouseManagementList = new ArrayList<ActivityAccessControl>();
//		List<ActivityAccessControl> warehouseStockmanagementList = new ArrayList<ActivityAccessControl>();
		List<ActivityAccessControl> warehouseProcurementList = new ArrayList<ActivityAccessControl>();
		List<ActivityAccessControl> warehouseStockTransferList = new ArrayList<ActivityAccessControl>();
		List<ActivityAccessControl> warehouseSalesOrderList = new ArrayList<ActivityAccessControl>();
		
		List<ActivityAccessControl> procurementList = new ArrayList<ActivityAccessControl>();
		List<ActivityAccessControl> orderManagemetSalesOrderList = new ArrayList<ActivityAccessControl>();
		List<ActivityAccessControl> orderManagemetSalesOrderFulfilmentList = new ArrayList<ActivityAccessControl>();
//		List<ActivityAccessControl> orderManagemetSalesOrderPaymentsList = new ArrayList<ActivityAccessControl>();
//		List<ActivityAccessControl> dealsAndOffersList = new ArrayList<ActivityAccessControl>();
		List<ActivityAccessControl> loyaltyProgramList = new ArrayList<ActivityAccessControl>();
		List<ActivityAccessControl> crmList = new ArrayList<ActivityAccessControl>();
		List<ActivityAccessControl> customerComplaintsList = new ArrayList<ActivityAccessControl>();
		List<ActivityAccessControl> businessEnquiryList = new ArrayList<ActivityAccessControl>();
		List<ActivityAccessControl> WarehouseStockIssueList = new ArrayList<ActivityAccessControl>();
		List<ActivityAccessControl> EventManagementList = new ArrayList<ActivityAccessControl>();
		
//		List<ActivityAccessControl> b2cManagementList = new ArrayList<ActivityAccessControl>();
		////////System.out.println("activityAccessControl::"+gson.toJson(activityAccessControlList));
		for(ActivityAccessControl activityAccessControl : activityAccessControlList){
			////////System.out.println("activityAccessControl::"+ activityAccessControl.getAppDocument());
			/*if(activityAccessControl.getAppFlow().equalsIgnoreCase("Dashboard"))
				dashboard.add(activityAccessControl);
			else if(activityAccessControl.getAppFlow().equalsIgnoreCase("UserAccessControl"))
				userAccessControlList.add(activityAccessControl);
			else if(activityAccessControl.getAppFlow().equalsIgnoreCase("DataManagement"))
				dataManagementList.add(activityAccessControl);
			else if(activityAccessControl.getAppFlow().equalsIgnoreCase("MasterDataManagement")){
				if(activityAccessControl.getAppSubFlow().equalsIgnoreCase("OutletMasterSettings"))
					outletMasterList.add(activityAccessControl);
				if(activityAccessControl.getAppSubFlow().equalsIgnoreCase("GenericBusinessSettings"))
					genericMasterList.add(activityAccessControl);
			}
			else if(activityAccessControl.getAppFlow().equalsIgnoreCase("Settings"))
				settingsList.add(activityAccessControl);
			else if(activityAccessControl.getAppFlow().equalsIgnoreCase("EventLog"))
				systemLogList.add(activityAccessControl);
			else if(activityAccessControl.getAppFlow().equalsIgnoreCase("Reports")){
				if(activityAccessControl.getAppDocument().equalsIgnoreCase("OutletSalesReports"))
					outletSalesReportsList.add(activityAccessControl);
				else if(activityAccessControl.getAppSubFlow().equalsIgnoreCase("OutletReports"))
					outletOtherReportsList.add(activityAccessControl);
				else if(activityAccessControl.getAppSubFlow().equalsIgnoreCase("WarehouseReports"))
					warehouseReportsList.add(activityAccessControl);
			}
			else*/ if(activityAccessControl.getAppFlow().equalsIgnoreCase("OutletManagement")){
				/*if(activityAccessControl.getAppSubFlow().equalsIgnoreCase("ShiftManagement"))
					shiftManagementList.add(activityAccessControl);
				else*/ if(activityAccessControl.getAppSubFlow().equalsIgnoreCase("outletCustomerOrders"))
					outletCustomerOrderList.add(activityAccessControl);
				else if(activityAccessControl.getAppSubFlow().equalsIgnoreCase("OutletShipments"))
					outletShipmentList.add(activityAccessControl);
				/*else if(activityAccessControl.getAppDocument().equalsIgnoreCase("OutletStocks"))
					outletStocksList.add(activityAccessControl);*/
				else if(activityAccessControl.getAppDocument().equalsIgnoreCase("OutletGoodsTransfer"))
					outletGoodsTransferList.add(activityAccessControl);
				/*else if(activityAccessControl.getAppDocument().equalsIgnoreCase("OutletStockVerification"))
					outletStockVerificationList.add(activityAccessControl);
				else if(activityAccessControl.getAppSubFlow().equalsIgnoreCase("OutletHealth"))
					outletHealthList.add(activityAccessControl);
				else
					outletManagementList.add(activityAccessControl);*/
				else if(activityAccessControl.getAppDocument().equalsIgnoreCase("EventConfigure"))
					EventManagementList.add(activityAccessControl);
			}
			else if(activityAccessControl.getAppFlow().equalsIgnoreCase("WarehouseManagement")){
				/*if(activityAccessControl.getAppSubFlow().equalsIgnoreCase("WarehouseStockmanagement"))
					warehouseStockmanagementList.add(activityAccessControl);
				else*/ if(activityAccessControl.getAppSubFlow().equalsIgnoreCase("WarehouseProcurement"))
					warehouseProcurementList.add(activityAccessControl);
				else if(activityAccessControl.getAppSubFlow().equalsIgnoreCase("WarehouseGoodsTransfer"))
					warehouseStockTransferList.add(activityAccessControl);
				else if(activityAccessControl.getAppSubFlow().equalsIgnoreCase("WarehouseProcurementShipment"))
					warehouseStockTransferList.add(activityAccessControl);
				else if(activityAccessControl.getAppSubFlow().equalsIgnoreCase("WarehouseSalesOrder"))
					warehouseSalesOrderList.add(activityAccessControl);
				
				else if(activityAccessControl.getAppSubDocument().equalsIgnoreCase("WarehouseStockIssues"))
					WarehouseStockIssueList.add(activityAccessControl);
				
				
				
				/*else
					warehouseManagementList.add(activityAccessControl);*/
			}
			else if(activityAccessControl.getAppFlow().equalsIgnoreCase("Procurement"))
				procurementList.add(activityAccessControl);
			else if(activityAccessControl.getAppFlow().equalsIgnoreCase("OrderManagement")){
				if(activityAccessControl.getAppSubFlow().equalsIgnoreCase("OrderManagementSalesOrder"))
					orderManagemetSalesOrderList.add(activityAccessControl);
				else if(activityAccessControl.getAppSubFlow().equalsIgnoreCase("OrderManagementFulFillment"))
					orderManagemetSalesOrderFulfilmentList.add(activityAccessControl);
				/*else if(activityAccessControl.getAppSubFlow().equalsIgnoreCase("OrderManagementPayments"))
					orderManagemetSalesOrderPaymentsList.add(activityAccessControl);*/
			}
			/*else if(activityAccessControl.getAppFlow().equalsIgnoreCase("DealsAndOffers"))
				dealsAndOffersList.add(activityAccessControl);*/
			else if(activityAccessControl.getAppFlow().equalsIgnoreCase("crm")){
				if(activityAccessControl.getAppSubFlow().equalsIgnoreCase("LoyaltyProgram"))
					loyaltyProgramList.add(activityAccessControl);
				else if(activityAccessControl.getAppSubFlow().equalsIgnoreCase("CustomerComplaints"))
					customerComplaintsList.add(activityAccessControl);
				else if(activityAccessControl.getAppSubFlow().equalsIgnoreCase("BusinessEnquiry"))
					businessEnquiryList.add(activityAccessControl);
				else
					crmList.add(activityAccessControl);
			}
			/*else if(activityAccessControl.getAppFlow().equalsIgnoreCase("b2cManagement"))
				b2cManagementList.add(activityAccessControl);*/
		}
		
		/*activityAccessControlMap.put("dashboard", dashboard);
		activityAccessControlMap.put("userAccessControlList", userAccessControlList);
		activityAccessControlMap.put("dataManagementList", dataManagementList);
		activityAccessControlMap.put("genericMasterList", genericMasterList);
		activityAccessControlMap.put("outletMasterList", outletMasterList);
		activityAccessControlMap.put("systemLogList", systemLogList);
		activityAccessControlMap.put("settingsList", settingsList);
		activityAccessControlMap.put("outletSalesReportsList", outletSalesReportsList);
		activityAccessControlMap.put("outletOtherReportsList", outletOtherReportsList);
		activityAccessControlMap.put("warehouseReportsList", warehouseReportsList);
		
		activityAccessControlMap.put("outletManagementList", outletManagementList);
		activityAccessControlMap.put("shiftManagementList", shiftManagementList);*/
		activityAccessControlMap.put("outletCustomerOrderList", outletCustomerOrderList);
		activityAccessControlMap.put("outletShipmentList", outletShipmentList);
//		activityAccessControlMap.put("outletStocksList", outletStocksList);
		activityAccessControlMap.put("outletGoodsTransferList", outletGoodsTransferList);
		/*activityAccessControlMap.put("outletStockVerificationList", outletStockVerificationList);
		activityAccessControlMap.put("outletHealthList", outletHealthList);*/
		
		/*activityAccessControlMap.put("warehouseManagementList", warehouseManagementList);
		activityAccessControlMap.put("warehouseStockmanagementList", warehouseStockmanagementList);*/
		activityAccessControlMap.put("warehouseProcurementList", warehouseProcurementList);
		activityAccessControlMap.put("warehouseStockTransferList", warehouseStockTransferList);
		activityAccessControlMap.put("warehouseStockTransferList", warehouseStockTransferList);
		activityAccessControlMap.put("warehouseSalesOrderList", warehouseSalesOrderList);
		
		activityAccessControlMap.put("warehouseStockIssueList", WarehouseStockIssueList);
		activityAccessControlMap.put("eventManagementList", EventManagementList);
		////////System.out.println("WarehouseStockIssueList::"+gson.toJson(WarehouseStockIssueList));
		activityAccessControlMap.put("procurementList", procurementList);
		activityAccessControlMap.put("orderManagemetSalesOrderList", orderManagemetSalesOrderList);
		activityAccessControlMap.put("orderManagemetSalesOrderFulfilmentList", orderManagemetSalesOrderFulfilmentList);
//		activityAccessControlMap.put("orderManagemetSalesOrderPaymentsList", orderManagemetSalesOrderPaymentsList);
		
		/*activityAccessControlMap.put("dealsAndOffersList", dealsAndOffersList);
		activityAccessControlMap.put("loyaltyProgramList", loyaltyProgramList);
		activityAccessControlMap.put("crmList", crmList);*/
		activityAccessControlMap.put("customerComplaintsList", customerComplaintsList);
		activityAccessControlMap.put("businessEnquiryList", businessEnquiryList);
		/*	activityAccessControlMap.put("b2cManagementList", b2cManagementList);*/
		
		return activityAccessControlMap;
	}
	
	
}
