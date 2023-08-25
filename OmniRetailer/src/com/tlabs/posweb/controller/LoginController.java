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

package com.tlabs.posweb.controller;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpCookie;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
//import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.google.gson.Gson;
//import com.google.gson.Gson;
//import com.technolabssoftware.www.GenericService;
import com.tlabs.posweb.beans.AccessControl;
import com.tlabs.posweb.beans.ChangePasswordForm;
import com.tlabs.posweb.beans.Department;
import com.tlabs.posweb.beans.EmployeeBean;
import com.tlabs.posweb.beans.EventMaster;
import com.tlabs.posweb.beans.LocationBean;
import com.tlabs.posweb.beans.LoginForm;
import com.tlabs.posweb.beans.OrdersDashboardBean;
import com.tlabs.posweb.beans.ProductCategoryBean;
import com.tlabs.posweb.beans.ProductSubCategoryBean;
import com.tlabs.posweb.beans.ReportsBean;
//import com.tlabs.posweb.beans.Role;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.beans.Suppliers;
import com.tlabs.posweb.beans.UserDetails;
import com.tlabs.posweb.beans.WastageDashboardBean;
import com.tlabs.posweb.beans.ZoneMaster;
import com.tlabs.posweb.services.AdminService;
import com.tlabs.posweb.services.DashboardService;
import com.tlabs.posweb.services.DepartmentService;
import com.tlabs.posweb.services.GenericMasterService;
import com.tlabs.posweb.services.LoginService;
import com.tlabs.posweb.services.OutletMasterService;
//import com.tlabs.posweb.services.RoleService;
import com.tlabs.posweb.services.SettingsService;
import com.tlabs.posweb.services.UserService;
import com.tlabs.posweb.util.AjaxFormResponse;
import com.tlabs.posweb.util.Constants;
import com.tlabs.posweb.util.EncryptAndDecrypt;
import com.tlabs.posweb.util.ServerSideValidations;

import captchas.CaptchasDotNet;



@Controller
@RequestMapping(value = "/login")
public class LoginController {
	
	@Autowired
	private AdminService adminServiceObj;
	@Autowired
	private LoginService loginServiceObj;
	private ModelAndView modelAndViewObj;
	//private static Logger log = Logger.getLogger(LoginController.class);
	
	@Autowired
	private DashboardService dashboardServiceObj;
	@Autowired
	private OutletMasterService outletMasterServiceObj;
    @Autowired
    private SessionScope sessionScope;
    @Autowired
	private UserService userServiceObj;
    @Autowired
    private GenericMasterService genericMasterServiceObj;
    @Autowired
    private DepartmentService departmentServiceObj;
    @Autowired
    private SettingsService  settingsServiceObj;
//
//	@Autowired 
//	private Gson gson;
//	
//	 @Autowired
//	 private RoleService roleServiceObj;
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display the Home Page
	 *
	 **/		
	@RequestMapping("/home")
	public ModelAndView home(HttpServletRequest request,HttpServletResponse response){
		try{
			modelAndViewObj = new ModelAndView();
			// log.info("Logincontroller - login home");
			String role = (String)request.getSession(true).getAttribute("role");
			String CustomerId = (String)request.getSession(true).getAttribute("customerId");

			if(role != null){
				getDashboardDetails(modelAndViewObj,request);
				
                   if(CustomerId.equals("CID8995427")){
					
					String customerIdStr=null,emailIdStr=null;
					List<String> locationsList = null;
					String locationListAll="";
					List<EmployeeBean> employeeList = new ArrayList<EmployeeBean>();
					List<EventMaster> eventMasters = new ArrayList<EventMaster>();
					try{
						int start = 1,end = Integer.parseInt("10");
						modelAndViewObj = new ModelAndView();
						customerIdStr = (String)request.getSession().getAttribute("customerId");
						emailIdStr = (String)request.getSession().getAttribute("emailId");
						locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
						
						if(locationsList != null){
							
						for (String string : locationsList) {
							
							locationListAll = locationListAll+string+","; 
						}
						}
						
						
						

						
						employeeList = genericMasterServiceObj.getEmployees("",customerIdStr, emailIdStr,"0","","100",false,locationListAll);

						eventMasters = outletMasterServiceObj.getEventManagementDetails(customerIdStr, emailIdStr,"0","10","",true,"","","","","","","","",false);
						

						if(eventMasters == null || eventMasters.size() == 0){
							modelAndViewObj.addObject("totalRecords","0");
							modelAndViewObj.addObject("index", "0");
							modelAndViewObj.addObject("totalValue", "0");
						}else{
							if(eventMasters.size()<Integer.parseInt("10")){
								end = (eventMasters.size())+(Integer.parseInt("0"));
							}else{
								end = (Integer.parseInt("0")+end);
							}
							modelAndViewObj.addObject("totalRecords", (eventMasters.get(0).getTotalRecords()));
							modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
							modelAndViewObj.addObject("totalValue", end);
						}
						modelAndViewObj.addObject("maxRecords", "10");
						modelAndViewObj.addObject("eventMastersList", eventMasters);
						modelAndViewObj.addObject("employeeList", employeeList);
						modelAndViewObj.addObject("locationsList", locationsList);
						
						
					}catch(Exception e){
						e.printStackTrace();
					}
				
					}
				
				modelAndViewObj.setViewName("/home");
			}
			else{
				LocaleResolver localeResolver = RequestContextUtils.getLocaleResolver(request);
				localeResolver.setLocale(request, response, Locale.ENGLISH);
				modelAndViewObj.setViewName("login");
			}
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}

	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to verify the authentication details and return as per results
	 *
	 **/
	@RequestMapping("/authenticateUser")
	public ModelAndView login(LoginForm loginForm, HttpServletRequest request,HttpServletResponse response) {
		
		try{
//			///////System.out.println("dd");
			// log.info("authenticateUser");
			modelAndViewObj = new ModelAndView();
			String role = (String)request.getSession(true).getAttribute("role");
			String CustomerId = (String)request.getSession(true).getAttribute("customerId");
//			String password="";
//			if(sessionScope.getUserName() == null ){ 
//				///////System.out.println(sessionScope.getUserName());
//				///////System.out.println("inner"+request.getSession().getAttribute("WINDOW_NAME"));
			/*String command = "wmic path win32_computersystemproduct get uuid.";
			String uuidval = "";
			    try {

			Process uuid = Runtime.getRuntime().exec(command);
		
			BufferedReader stdInput = new BufferedReader(new 
				     InputStreamReader(uuid.getInputStream()));
			String s = null;
		
			   while ((s = stdInput.readLine()) != null) {
				   uuidval +=s.trim();
			   }

			    } catch (Exception e) {

			    	e.printStackTrace();

			    }
			   loginForm.setUuid(uuidval);*/
			
			
			if(role != null){
				// log.info(role);
//				request.getSession().setAttribute("WINDOW_NAME", "firstTimeLogin");
				getDashboardDetails(modelAndViewObj,request);
				
				if(CustomerId.equals("CID8995427")){
					
					String customerIdStr=null,emailIdStr=null;
					List<String> locationsList = null;
					String locationListAll="";
					List<EmployeeBean> employeeList = new ArrayList<EmployeeBean>();
					List<EventMaster> eventMasters = new ArrayList<EventMaster>();
					try{
						int start = 1,end = Integer.parseInt("10");
						modelAndViewObj = new ModelAndView();
						customerIdStr = (String)request.getSession().getAttribute("customerId");
						emailIdStr = (String)request.getSession().getAttribute("emailId");
						locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
						
						if(locationsList != null){
							
						for (String string : locationsList) {
							
							locationListAll = locationListAll+string+","; 
						}
						}
						
						
						

						
						employeeList = genericMasterServiceObj.getEmployees("",customerIdStr, emailIdStr,"0","","100",false,locationListAll);

						eventMasters = outletMasterServiceObj.getEventManagementDetails(customerIdStr, emailIdStr,"0","10","",true,"","","","","","","","",false);
						

						if(eventMasters == null || eventMasters.size() == 0){
							modelAndViewObj.addObject("totalRecords","0");
							modelAndViewObj.addObject("index", "0");
							modelAndViewObj.addObject("totalValue", "0");
						}else{
							if(eventMasters.size()<Integer.parseInt("10")){
								end = (eventMasters.size())+(Integer.parseInt("0"));
							}else{
								end = (Integer.parseInt("0")+end);
							}
							modelAndViewObj.addObject("totalRecords", (eventMasters.get(0).getTotalRecords()));
							modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
							modelAndViewObj.addObject("totalValue", end);
						}
						modelAndViewObj.addObject("maxRecords", "10");
						modelAndViewObj.addObject("eventMastersList", eventMasters);
						modelAndViewObj.addObject("employeeList", employeeList);
						modelAndViewObj.addObject("locationsList", locationsList);
						
					}catch(Exception e){
						e.printStackTrace();
					}
				
					}
				
				modelAndViewObj.setViewName("/home");
			}
			else if(loginForm.getEmailId() == null){
				modelAndViewObj.setViewName("login");
			}
			else{
				
				CaptchasDotNet captchas = new captchas.CaptchasDotNet(
						  request.getSession(true),     // Ensure session
						  "chaithu322",                       // client
						  "mkE1Jg7gwl2xyoaX9AW2zF4H9znzppZbCbjEdmzI"                  // secret
				  );
				
				String password = loginForm.getCaptchaPassword();
				
				AjaxFormResponse ajaxformresponse=new AjaxFormResponse();
				switch (captchas.check(password)) {
				  case 's':{
					  ajaxformresponse.setMessage("Session seems to be timed out or broken.");
					  ajaxformresponse.setStatus(false);
					  ajaxformresponse.setCode("-1");
				    break;
				  }
				  case 'm':{
					  ajaxformresponse.setMessage("Every CAPTCHA can only be used once. The current CAPTCHA has already been used.");
					  ajaxformresponse.setStatus(false);
					  ajaxformresponse.setCode("-1");
				    break;
				  }
				  case 'w':{
					  ajaxformresponse.setMessage("Invalid captcha");
					  ajaxformresponse.setStatus(false);
					  ajaxformresponse.setCode("-1");
				    break;
				  }
				  default:{
					ajaxformresponse.setMessage("Your message was verified to be entered by a human and is ");
					ajaxformresponse.setStatus(true);
//					ajaxformresponse.setCode("-1");
				    break;
				  }

				}
				
				/*Added by manideep
				Reason : To bipass captcha when net is not working .(Note:-Only for development purpose.)
						comment one line below which is ajaxformresponse.setCode(null); for captcha to work again.
				*/
				//ajaxformresponse.setCode(null);
				/*end captcha bipass code*/
				
				ajaxformresponse.setCode(null);
				if(ajaxformresponse.getCode()!=null){
				if(ajaxformresponse.getCode().trim().equals("-1")){
				modelAndViewObj.addObject("captcherr",ajaxformresponse.getMessage());
				modelAndViewObj.addObject("customerId",loginForm.getCustomerId());
				modelAndViewObj.addObject("emailId",loginForm.getEmailId());
				modelAndViewObj.addObject("password",loginForm.getPassword());
				modelAndViewObj.setViewName("login");
				}
				}
				else{
				String status = new ServerSideValidations().loginForm(loginForm);
				
				if(status.equalsIgnoreCase(Constants.SUCCESS)){//server-side validations success
					LoginForm loginFormObj = loginServiceObj.isUserAuthenticated(request,response,loginForm);
//					logServiceObj.logCreation(request, response,new LogBean(),loginForm.getCustomerId());
					if(loginFormObj.getStatus().equals(Constants.SUCCESS)){
						
						sessionScope.setUserName( loginFormObj.getFirstName());
						sessionScope.setLoginId(loginForm.getEmailId());
						sessionScope.setCustomerId(loginForm.getCustomerId());
						String contextPath = request.getContextPath();
						contextPath = contextPath.substring(1,contextPath.length());
						sessionScope.setApplicationName("console");
						sessionScope.setLocation(loginForm.getGeoLocation());
						sessionScope.setRole(loginFormObj.getRole());
						
						sessionScope.setWarehouseLicense(loginFormObj.isWarehouseLicense());
						sessionScope.setRestaruntLicense(loginFormObj.isRestaruntLicense());
						
//						request.getSession().setAttribute("WINDOW_NAME", "firstTimeLogin");
//						List<String> warehouseLocationsList = adminServiceObj.getWarehouseLocationsList("1", loginForm.getEmailId(),false);
//						List<String> outletLocationsList = adminServiceObj.getOutletLocationsList("1", emailIdStr,false);
//					
						String ipAddress = request.getHeader("X-FORWARDED-FOR");  
						if (ipAddress == null) {  
						   ipAddress = request.getRemoteAddr();  
						}
						sessionScope.setIpAddress(ipAddress);
						
						request.getSession().setAttribute("role", loginFormObj.getRole());
						request.getSession().setAttribute("firstName", loginFormObj.getFirstName());
						request.getSession().setAttribute("userName", loginFormObj.getFirstName());
						request.getSession().setAttribute("customerId",loginForm.getCustomerId());
						request.getSession().setAttribute("emailId",loginForm.getEmailId());
						request.getSession().setAttribute("logo",loginFormObj.getLogo());
						request.getSession().setAttribute("businessName",loginFormObj.getBusinessName());
						request.getSession().setAttribute("geoLocation",loginForm.getGeoLocation());
						try {
							if(settingsServiceObj.getRegionalSettings(loginForm.getCustomerId(), loginForm.getEmailId())!=null){
								if(settingsServiceObj.getRegionalSettings(loginForm.getCustomerId(), loginForm.getEmailId()).getCountryCode()!=null && !(settingsServiceObj.getRegionalSettings(loginForm.getCustomerId(), loginForm.getEmailId()).getCountryCode()).trim().equals(""))
							request.getSession().setAttribute("countryCode", settingsServiceObj.getRegionalSettings(loginForm.getCustomerId(), loginForm.getEmailId()).getCountryCode());
								else
									request.getSession().setAttribute("countryCode", "IN");
							}
								else 
								request.getSession().setAttribute("countryCode", "IN");
							
							if(!loginFormObj.getRole().equals("super admin")){
								setAccessControlListToSession(request, loginFormObj);
								setActivityAccessControlListToSession(request, loginFormObj);
								sessionScope.setRoleLocationsList(loginFormObj.getRoleLocationsList());
								
							}
							request.getSession().setAttribute("warehouseLicense", loginFormObj.isWarehouseLicense());
							request.getSession().setAttribute("restaruntLicense", loginFormObj.isRestaruntLicense());
							
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						/*if(loginFormObj.getAccessControlList().isEmpty()){
							modelAndViewObj.addObject("err",loginFormObj.getStatus());
							modelAndViewObj.setViewName("login");
						}
						else{*/
							getDashboardDetails(modelAndViewObj,request);
							
							
							
							if(loginForm.getCustomerId().equals("CID8995427")){
							
							String customerIdStr=null,emailIdStr=null;
							List<String> locationsList = null;
							String locationListAll="";
							List<EmployeeBean> employeeList = new ArrayList<EmployeeBean>();
							List<EventMaster> eventMasters = new ArrayList<EventMaster>();
							try{
								int start = 1,end = Integer.parseInt("10");
								modelAndViewObj = new ModelAndView();
								customerIdStr = (String)request.getSession().getAttribute("customerId");
								emailIdStr = (String)request.getSession().getAttribute("emailId");
								locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
								
								if(locationsList != null){
									
								for (String string : locationsList) {
									
									locationListAll = locationListAll+string+","; 
								}
								}
								
								
								

								
								employeeList = genericMasterServiceObj.getEmployees("",customerIdStr, emailIdStr,"0","","100",false,locationListAll);

								eventMasters = outletMasterServiceObj.getEventManagementDetails(customerIdStr, emailIdStr,"0","10","",true,"","","","","","","","",false);
								

								if(eventMasters == null || eventMasters.size() == 0){
									modelAndViewObj.addObject("totalRecords","0");
									modelAndViewObj.addObject("index", "0");
									modelAndViewObj.addObject("totalValue", "0");
								}else{
									if(eventMasters.size()<Integer.parseInt("10")){
										end = (eventMasters.size())+(Integer.parseInt("0"));
									}else{
										end = (Integer.parseInt("0")+end);
									}
									modelAndViewObj.addObject("totalRecords", (eventMasters.get(0).getTotalRecords()));
									modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
									modelAndViewObj.addObject("totalValue", end);
								}
								modelAndViewObj.addObject("maxRecords", "10");
								modelAndViewObj.addObject("eventMastersList", eventMasters);
								modelAndViewObj.addObject("employeeList", employeeList);
								modelAndViewObj.addObject("locationsList", locationsList);
							
								
							}catch(Exception e){
								e.printStackTrace();
							}
						
							}
						
							modelAndViewObj.setViewName("/home");
						//}
					}
					else{
						modelAndViewObj.addObject("err",loginFormObj.getStatus());
						modelAndViewObj.addObject("customerId",loginForm.getCustomerId());
						modelAndViewObj.addObject("emailId",loginForm.getEmailId());
						modelAndViewObj.addObject("password",loginForm.getPassword());
						modelAndViewObj.setViewName("login");
					}
				}
				else{
					modelAndViewObj.addObject("err",status);
					modelAndViewObj.addObject("customerId",loginForm.getCustomerId());
					modelAndViewObj.addObject("emailId",loginForm.getEmailId());
					modelAndViewObj.addObject("password",loginForm.getPassword());
//					request.getSession().setAttribute("WINDOW_NAME", "firstTimeLogin");
					modelAndViewObj.setViewName("login");
				}
			}
			}
		/*	}
			else{
				modelAndViewObj.setViewName("login");
			}*/
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err", Constants.LOGIN_ERROR);
			modelAndViewObj.addObject("customerId",loginForm.getCustomerId());
			modelAndViewObj.addObject("emailId",loginForm.getEmailId());
			modelAndViewObj.addObject("password",loginForm.getPassword());
			modelAndViewObj.setViewName("login");
		}
		//modelAndViewObj.addObject("uuid",loginForm.getUuid());
	  return modelAndViewObj;

	}
		 
		
	public void setAccessControlListToSession(HttpServletRequest request, LoginForm loginFormObj){
		try{
			/////////System.out.println("login form json"+ gson.toJson(loginFormObj));
			request.getSession().setAttribute("dashboard",loginFormObj.getAccessControlList().get("dashboard"));
			request.getSession().setAttribute("userAccessControl",loginFormObj.getAccessControlList().get("userAccessControlList"));
			
			request.getSession().setAttribute("dataManagement",loginFormObj.getAccessControlList().get("dataManagementList"));
			request.getSession().setAttribute("genericBusinessSettings",loginFormObj.getAccessControlList().get("genericMasterList"));
			request.getSession().setAttribute("outletMasterSettings",loginFormObj.getAccessControlList().get("outletMasterList"));
			request.getSession().setAttribute("warehouseMasterSettings",loginFormObj.getAccessControlList().get("warehouseMasterList"));
			request.getSession().setAttribute("systemLog",loginFormObj.getAccessControlList().get("systemLogList"));
			request.getSession().setAttribute("settings",loginFormObj.getAccessControlList().get("settingsList"));
			request.getSession().setAttribute("outletSalesReports",loginFormObj.getAccessControlList().get("outletSalesReportsList"));
			request.getSession().setAttribute("outletOtherReports",loginFormObj.getAccessControlList().get("outletOtherReportsList"));
			request.getSession().setAttribute("warehouseReports",loginFormObj.getAccessControlList().get("warehouseReportsList"));
			
			request.getSession().setAttribute("priceManagement",loginFormObj.getAccessControlList().get("priceManagementList"));
			
			request.getSession().setAttribute("outletManagement",loginFormObj.getAccessControlList().get("outletManagementList"));
			request.getSession().setAttribute("shiftManagement",loginFormObj.getAccessControlList().get("shiftManagementList"));
			//added by manasa
			request.getSession().setAttribute("restaurantManagement",loginFormObj.getAccessControlList().get("restaurantManagementList"));
			request.getSession().setAttribute("outletMonitoring",loginFormObj.getAccessControlList().get("outletMonitoringList"));
			request.getSession().setAttribute("outletGRNReports",loginFormObj.getAccessControlList().get("outletGRNReportsList"));
			request.getSession().setAttribute("warehouseshiftManagement",loginFormObj.getAccessControlList().get("warehouseshiftManagementList"));
//			///////System.out.println("ghg"+loginFormObj.getAccessControlList().get("warehouseshiftManagementList"));
			request.getSession().setAttribute("outletCustomerOrder",loginFormObj.getAccessControlList().get("outletCustomerOrderList"));
			request.getSession().setAttribute("outletShipment",loginFormObj.getAccessControlList().get("outletShipmentList"));
			request.getSession().setAttribute("outletStocks",loginFormObj.getAccessControlList().get("outletStocksList"));
			request.getSession().setAttribute("outletGoodsTransfer",loginFormObj.getAccessControlList().get("outletGoodsTransferList"));
			
			
			request.getSession().setAttribute("outletStockVerification",loginFormObj.getAccessControlList().get("outletStockVerificationList"));
			//added by manasa
			request.getSession().setAttribute("storeStockVerification",loginFormObj.getAccessControlList().get("outletStockVerificationReportList"));
			request.getSession().setAttribute("outletMaterialConsumption",loginFormObj.getAccessControlList().get("outletMaterialConsumptionList"));
			request.getSession().setAttribute("outletHealth",loginFormObj.getAccessControlList().get("outletHealthList"));
			request.getSession().setAttribute("outletStockMovement",loginFormObj.getAccessControlList().get("outletStockMovementList"));
			request.getSession().setAttribute("outletSuppliersMovements",loginFormObj.getAccessControlList().get("outletSuppliersMovementsList"));
			request.getSession().setAttribute("outletKeyValueProducts",loginFormObj.getAccessControlList().get("outletKeyValueProductsList"));

			request.getSession().setAttribute("warehouseManagement",loginFormObj.getAccessControlList().get("warehouseManagementList"));
			request.getSession().setAttribute("warehouseStockmanagement",loginFormObj.getAccessControlList().get("warehouseStockmanagementList"));
			request.getSession().setAttribute("warehouseStockIssue",loginFormObj.getAccessControlList().get("warehouseStockIssueList"));

			request.getSession().setAttribute("warehouseProcurement",loginFormObj.getAccessControlList().get("warehouseProcurementList"));
			request.getSession().setAttribute("warehouseGoodsTransfer",loginFormObj.getAccessControlList().get("warehouseStockTransferList"));
			request.getSession().setAttribute("warehouseSalesOrder",loginFormObj.getAccessControlList().get("warehouseSalesOrderList"));
			request.getSession().setAttribute("warehouseProcurementShipments",loginFormObj.getAccessControlList().get("warehouseProcurementShipmentList"));
			request.getSession().setAttribute("procurement",loginFormObj.getAccessControlList().get("procurementList"));
			request.getSession().setAttribute("orderManagementSalesOrderVsStock",loginFormObj.getAccessControlList().get("orderManagemetSalesOrderVsStockList"));
			request.getSession().setAttribute("orderManagemetSalesOrder",loginFormObj.getAccessControlList().get("orderManagemetSalesOrderList"));
			request.getSession().setAttribute("orderManagemetSalesOrderFulfilment",loginFormObj.getAccessControlList().get("orderManagemetSalesOrderFulfilmentList"));
			request.getSession().setAttribute("orderManagemetSalesOrderPayments",loginFormObj.getAccessControlList().get("orderManagemetSalesOrderPaymentsList"));
			request.getSession().setAttribute("CustomerLoyality",loginFormObj.getAccessControlList().get("customerLoyalityList"));
			request.getSession().setAttribute("dealsAndOffers",loginFormObj.getAccessControlList().get("dealsAndOffersList"));
			request.getSession().setAttribute("campaignPromotions",loginFormObj.getAccessControlList().get("campaignPromotionsList"));
//			///////System.out.println(loginFormObj.getAccessControlList().get("campaignPromotionsList"));
			/*request.getSession().setAttribute("loyaltyProgram",loginFormObj.getAccessControlList().get("loyaltyProgramList"));*/
			request.getSession().setAttribute("crm",loginFormObj.getAccessControlList().get("crmList"));
			request.getSession().setAttribute("b2cManagement",loginFormObj.getAccessControlList().get("b2cManagementList"));
			
			//added by manideep
			request.getSession().setAttribute("Finantial",loginFormObj.getAccessControlList().get("FinantialList"));
			request.getSession().setAttribute("Reports",loginFormObj.getAccessControlList().get("ReportsList"));
			request.getSession().setAttribute("CampaignReports",loginFormObj.getAccessControlList().get("CampaignReportsList"));
		}catch(Exception exception){
			exception.printStackTrace();
		}
	}
	
	
	
	
	
	public void setActivityAccessControlListToSession(HttpServletRequest request, LoginForm loginFormObj){
		try{
	//		request.getSession().setAttribute("dashboard",loginFormObj.getActivityAccessControlList().get("dashboard"));
	//		request.getSession().setAttribute("userAccessControl",loginFormObj.getActivityAccessControlList().get("userAccessControlList"));
	//		request.getSession().setAttribute("dataManagement",loginFormObj.getActivityAccessControlList().get("dataManagementList"));
	//		request.getSession().setAttribute("genericBusinessSettings",loginFormObj.getActivityAccessControlList().get("genericMasterList"));
	//		request.getSession().setAttribute("outletMasterSettings",loginFormObj.getActivityAccessControlList().get("outletMasterList"));
	//		request.getSession().setAttribute("systemLog",loginFormObj.getActivityAccessControlList().get("systemLogList"));
	//		request.getSession().setAttribute("settings",loginFormObj.getActivityAccessControlList().get("settingsList"));
	//		request.getSession().setAttribute("outletSalesReports",loginFormObj.getActivityAccessControlList().get("outletSalesReportsList"));
	//		request.getSession().setAttribute("outletOtherReports",loginFormObj.getActivityAccessControlList().get("outletOtherReportsList"));
	//		request.getSession().setAttribute("warehouseReports",loginFormObj.getActivityAccessControlList().get("warehouseReportsList"));
			
	//		request.getSession().setAttribute("outletManagement",loginFormObj.getActivityAccessControlList().get("outletManagementList"));
	//		request.getSession().setAttribute("shiftManagement",loginFormObj.getActivityAccessControlList().get("shiftManagementList"));
			request.getSession().setAttribute("outletCustomerOrderActivity",loginFormObj.getActivityAccessControlList().get("outletCustomerOrderList"));
			request.getSession().setAttribute("outletShipmentActivity",loginFormObj.getActivityAccessControlList().get("outletShipmentList"));
	//		request.getSession().setAttribute("outletStocks",loginFormObj.getActivityAccessControlList().get("outletStocksList"));
			request.getSession().setAttribute("outletGoodsTransferActivity",loginFormObj.getActivityAccessControlList().get("outletGoodsTransferList"));
	//		request.getSession().setAttribute("outletStockVerification",loginFormObj.getActivityAccessControlList().get("outletStockVerificationList"));
	//		request.getSession().setAttribute("outletHealth",loginFormObj.getActivityAccessControlList().get("outletHealthList"));
			
	//		request.getSession().setAttribute("warehouseManagement",loginFormObj.getActivityAccessControlList().get("warehouseManagementList"));
	//		request.getSession().setAttribute("warehouseStockmanagement",loginFormObj.getActivityAccessControlList().get("warehouseStockmanagementList"));
			request.getSession().setAttribute("warehouseProcurementActivity",loginFormObj.getActivityAccessControlList().get("warehouseProcurementList"));
			request.getSession().setAttribute("warehouseGoodsTransferActivity",loginFormObj.getActivityAccessControlList().get("warehouseStockTransferList"));
			request.getSession().setAttribute("warehouseSalesOrderActivity",loginFormObj.getActivityAccessControlList().get("warehouseSalesOrderList"));
			request.getSession().setAttribute("warehouseStockIssueFeilds",loginFormObj.getActivityAccessControlList().get("warehouseStockIssueList"));

			//Gson gson = new Gson();
			/////System.out.println(gson.toJson(request.getSession().getAttribute("warehouseStockIssueFeilds")));
			request.getSession().setAttribute("procurementActivity",loginFormObj.getActivityAccessControlList().get("procurementList"));
			request.getSession().setAttribute("orderManagementSalesOrderVsStock",loginFormObj.getAccessControlList().get("orderManagemetSalesOrderVsStockList"));
			request.getSession().setAttribute("orderManagemetSalesOrderActivity",loginFormObj.getActivityAccessControlList().get("orderManagemetSalesOrderList"));
			request.getSession().setAttribute("orderManagemetSalesOrderFulfilmentActivity",loginFormObj.getActivityAccessControlList().get("orderManagemetSalesOrderFulfilmentList"));
			request.getSession().setAttribute("eventmanagementActivity",loginFormObj.getActivityAccessControlList().get("eventManagementList"));

	//		request.getSession().setAttribute("orderManagemetSalesOrderPayments",loginFormObj.getActivityAccessControlList().get("orderManagemetSalesOrderPaymentsList"));
			
	//		request.getSession().setAttribute("dealsAndOffers",loginFormObj.getActivityAccessControlList().get("dealsAndOffersList"));
//			request.getSession().setAttribute("loyaltyProgramActivity",loginFormObj.getActivityAccessControlList().get("loyaltyProgramList"));
//			request.getSession().setAttribute("crmActivity",loginFormObj.getActivityAccessControlList().get("crmList"));
			request.getSession().setAttribute("customerComplaintsActivity",loginFormObj.getActivityAccessControlList().get("customerComplaintsList"));
			request.getSession().setAttribute("businessEnquiryActivity",loginFormObj.getActivityAccessControlList().get("businessEnquiryList"));
	//		request.getSession().setAttribute("b2cManagement",loginFormObj.getActivityAccessControlList().get("b2cManagementList"));
		}catch(Exception exception){
			exception.printStackTrace();
		}
	}
	
	
	
	/*@SuppressWarnings("unchecked")
	public void getDashboardDetails(ModelAndView modelAndView,HttpServletRequest request){
		try{
			List<AccessControl> dashboardList = (List<AccessControl>) request.getSession().getAttribute("dashboard");
			if(request.getSession().getAttribute("role").equals("super admin") || (dashboardList != null && dashboardList.size() > 0)){
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
//				List<String> categoriesList = adminServiceObj.getCategories(customerIdStr,emailIdStr);
				
				List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
				if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
					 zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"0");
					request.getSession().setAttribute("zoneList", zoneList);
				}
				List<Department> departmentList =(List<Department>)request.getSession().getAttribute("departmentList");
				if(departmentList==null || departmentList.size()==0 || departmentList.isEmpty()){
					departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerIdStr, emailIdStr,"-1",false);
					request.getSession().setAttribute("departmentList", departmentList);
				}
				List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
				if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
					categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
					request.getSession().setAttribute("categoryList", categoryList);
				}
				List<ProductSubCategoryBean> subCategoryDetailsList =(List<ProductSubCategoryBean>)request.getSession().getAttribute("subCategoryDetailsList");
				if(subCategoryDetailsList==null || subCategoryDetailsList.size()==0 || subCategoryDetailsList.isEmpty()){
					subCategoryDetailsList = outletMasterServiceObj.getSubCategoryDetails("",customerIdStr, emailIdStr,"-1",false);
					request.getSession().setAttribute("subCategoryDetailsList", subCategoryDetailsList);
				}
				List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
				List<ZoneMaster> zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"0");
				List<Department> departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerIdStr, emailIdStr,"0",false);
				List<String> brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
				List<ProductSubCategoryBean> subCategoryDetailsList = outletMasterServiceObj.getSubCategoryDetails("",customerIdStr, emailIdStr,"-1",false);
				List<String> brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
				OrdersDashboardBean ordersObj = new OrdersDashboardBean();
				ReportsBean responseObj = new ReportsBean();
				List<Float> salesObj = new ArrayList<Float>();
				List<Float> stocksObj = new ArrayList<Float>();
				String turnOverObj = new String();
				WastageDashboardBean wastageDashboardBeanObj = new WastageDashboardBean();
				String selectedDate = "";
				DateFormat dateFormatObj = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
				Date today = Calendar.getInstance().getTime();        
				selectedDate = dateFormatObj.format(today);
				selectedDate = selectedDate.substring(0,10);
				if(workLocationsList != null && workLocationsList.size()>0){
					String location = workLocationsList.get(0);
					//String selectedDate = DateUtil.getLastMonthLastDate();
					if(categoriesList != null && categoriesList.size()>0){
						String categoryStr = categoriesList.get(0);
						salesObj=dashboardServiceObj.getSales(customerIdStr, emailIdStr, location, "month", categoryStr,selectedDate);
						String stockCategoryStr = categoriesList.get(0);
						stocksObj=dashboardServiceObj.getStocks(customerIdStr, emailIdStr, location, "month", stockCategoryStr,selectedDate);
						modelAndView.addObject("selectedCategory",categoryStr);
						modelAndView.addObject("selectedstockCategory",stockCategoryStr);
					}
					ordersObj = dashboardServiceObj.getOrders(customerIdStr,emailIdStr,location,"month",selectedDate);
					turnOverObj = dashboardServiceObj.getTurnOvers(customerIdStr,emailIdStr,location,"month",selectedDate);
					responseObj = dashboardServiceObj.getWastageStockInfo(customerIdStr,emailIdStr,location,"month",selectedDate);
					request.getSession().setAttribute("selectedLocation", location);
					salesObj=dashboardServiceObj.getSales(customerIdStr, emailIdStr, "all", "month", "all",selectedDate,"","","","","");
					stocksObj=dashboardServiceObj.getStocks(customerIdStr, emailIdStr, "all", "month", "all",selectedDate,"","","","","");
					ordersObj = dashboardServiceObj.getOrders(customerIdStr,emailIdStr,"all","month",selectedDate,"","","","","","");
					turnOverObj = dashboardServiceObj.getTurnOvers(customerIdStr,emailIdStr,"all","month",selectedDate,"","","","","","");
					wastageDashboardBeanObj = dashboardServiceObj.getWastageStockInfo(customerIdStr,emailIdStr,"all","month",selectedDate,"","","","","","");
					responseObj = dashboardServiceObj.getdasboardinfo(customerIdStr,emailIdStr,"","month",selectedDate,"","","","","","");
					modelAndView.addObject("workLocationsList",workLocationsList);
//					modelAndView.addObject("categoriesList", categoriesList);
					modelAndView.addObject("categoriesList", categoryList);
					modelAndView.addObject("ordersObj",ordersObj);
					modelAndView.addObject("wastageDashboardBeanObj",wastageDashboardBeanObj);
					modelAndView.addObject("turnOverObj",turnOverObj);
					modelAndView.addObject("salesObj",salesObj);
					modelAndView.addObject("stocksObj",stocksObj);
//					modelAndView.addObject("selectedLocation",location);
					modelAndView.addObject("selectedLocation","");
					modelAndViewObj.addObject("zoneList", zoneList);
					modelAndViewObj.addObject("departmentList", departmentList);
					modelAndViewObj.addObject("categoryList", categoryList);
					modelAndViewObj.addObject("subCategoryDetailsList", subCategoryDetailsList);
					modelAndViewObj.addObject("brandsList", brandsList);
					modelAndViewObj.addObject("dashboardinfo", responseObj);
					modelAndView.addObject("selectedCriteria","month");
					String segments []={"#2484c1", "#65a620", "#7b6888", "#a05d56", "#961a1a", "#d8d23a", "#e98125", "#d0743c", "#635222", "#6ada6a",
							"#0c6197", "#7d9058", "#207f33", "#44b9b0", "#bca44a", "#e4a14b", "#a3acb2", "#8cc3e9", "#69a6f9", "#5b388f",
							"#546e91", "#8bde95", "#d2ab58", "#273c71", "#98bf6e", "#4daa4b", "#98abc5", "#cc1010", "#31383b", "#006391",
							"#c2643f", "#b0a474", "#a5a39c", "#a9c2bc", "#22af8c", "#7fcecf", "#987ac6", "#3d3b87", "#b77b1c", "#c9c2b6",
							"#807ece", "#8db27c", "#be66a2", "#9ed3c6", "#00644b", "#005064", "#77979f", "#77e079", "#9c73ab", "#1f79a7"
							
					};
								
					modelAndViewObj.addObject("segments",segments);	
					modelAndView.addObject("selectedDate",selectedDate);
				}
//			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}*/
	
	
	
	
	/*@SuppressWarnings("unchecked")
	public void getDashboardDetails(ModelAndView modelAndView,HttpServletRequest request){
		try{
			List<AccessControl> dashboardList = (List<AccessControl>) request.getSession().getAttribute("dashboard");
			if(request.getSession().getAttribute("role").equals("super admin") || (dashboardList != null && dashboardList.size() > 0)){
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
//				List<String> categoriesList = adminServiceObj.getCategories(customerIdStr,emailIdStr);
				String locationStr=null; 
				List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
				if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
					 zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"0");
					request.getSession().setAttribute("zoneList", zoneList);
				}
				List<Department> departmentList =(List<Department>)request.getSession().getAttribute("departmentList");
				if(departmentList==null || departmentList.size()==0 || departmentList.isEmpty()){
					departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerIdStr, emailIdStr,"-1",false);
					request.getSession().setAttribute("departmentList", departmentList);
				}
				List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
				if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
					categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
					request.getSession().setAttribute("categoryList", categoryList);
				}
				List<ProductSubCategoryBean> subCategoryDetailsList =(List<ProductSubCategoryBean>)request.getSession().getAttribute("subCategoryDetailsList");
				if(subCategoryDetailsList==null || subCategoryDetailsList.size()==0 || subCategoryDetailsList.isEmpty()){
					subCategoryDetailsList = outletMasterServiceObj.getSubCategoryDetails("",customerIdStr, emailIdStr,"-1",false);
					request.getSession().setAttribute("subCategoryDetailsList", subCategoryDetailsList);
				}
				List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
				List<ZoneMaster> zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"0");
				List<Department> departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerIdStr, emailIdStr,"0",false);
				List<String> brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
				List<ProductSubCategoryBean> subCategoryDetailsList = outletMasterServiceObj.getSubCategoryDetails("",customerIdStr, emailIdStr,"-1",false);
				

				if(workLocationsList != null && workLocationsList.size()>0)
					locationStr = workLocationsList.get(0);
				
				List<String> brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
				OrdersDashboardBean ordersObj = new OrdersDashboardBean();
				ReportsBean responseObj = new ReportsBean();
				List<Float> salesObj = new ArrayList<Float>();
				List<Float> stocksObj = new ArrayList<Float>();
				String turnOverObj = null;
				WastageDashboardBean wastageDashboardBeanObj = new WastageDashboardBean();
				String selectedDate = "";
				DateFormat dateFormatObj = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
				Date today = Calendar.getInstance().getTime();        
				selectedDate = dateFormatObj.format(today);
				selectedDate = selectedDate.substring(0,10);
		
					salesObj=dashboardServiceObj.getSales(customerIdStr, emailIdStr, "all", "month", "all",selectedDate,"","","","","");
					stocksObj=dashboardServiceObj.getStocks(customerIdStr, emailIdStr, "all", "month", "all",selectedDate,"","","","","");
					ordersObj = dashboardServiceObj.getOrders(customerIdStr,emailIdStr,"all","month",selectedDate,"","","","","","","","");
					turnOverObj = dashboardServiceObj.getTurnOvers(customerIdStr,emailIdStr,"all","month",selectedDate,"","","","","","","","");
					wastageDashboardBeanObj = dashboardServiceObj.getWastageStockInfo(customerIdStr,emailIdStr,"all","month",selectedDate,"","","","","","","","");
					responseObj = dashboardServiceObj.getdasboardinfo(customerIdStr,emailIdStr,locationStr,"month",selectedDate,"","","","","","","","");
					modelAndView.addObject("workLocationsList",workLocationsList);
//					modelAndView.addObject("categoriesList", categoriesList);
					modelAndView.addObject("categoriesList", categoryList);
					modelAndView.addObject("ordersObj",ordersObj);
					modelAndView.addObject("wastageDashboardBeanObj",wastageDashboardBeanObj);
					modelAndView.addObject("turnOverObj",turnOverObj);
					modelAndView.addObject("salesObj",salesObj);
					modelAndView.addObject("stocksObj",stocksObj);
//					modelAndView.addObject("selectedLocation",location);
					modelAndView.addObject("selectedLocation",locationStr);
					modelAndViewObj.addObject("zoneList", zoneList);
					modelAndViewObj.addObject("departmentList", departmentList);
					modelAndViewObj.addObject("categoryList", categoryList);
					modelAndViewObj.addObject("subCategoryDetailsList", subCategoryDetailsList);
					modelAndViewObj.addObject("brandsList", brandsList);
					modelAndViewObj.addObject("dashboardinfo", responseObj);
					modelAndView.addObject("selectedCriteria","month");
					String segments []={"#2484c1", "#65a620", "#7b6888", "#a05d56", "#961a1a", "#d8d23a", "#e98125", "#d0743c", "#635222", "#6ada6a",
							"#0c6197", "#7d9058", "#207f33", "#44b9b0", "#bca44a", "#e4a14b", "#a3acb2", "#8cc3e9", "#69a6f9", "#5b388f",
							"#546e91", "#8bde95", "#d2ab58", "#273c71", "#98bf6e", "#4daa4b", "#98abc5", "#cc1010", "#31383b", "#006391",
							"#c2643f", "#b0a474", "#a5a39c", "#a9c2bc", "#22af8c", "#7fcecf", "#987ac6", "#3d3b87", "#b77b1c", "#c9c2b6",
							"#807ece", "#8db27c", "#be66a2", "#9ed3c6", "#00644b", "#005064", "#77979f", "#77e079", "#9c73ab", "#1f79a7"
							
					};
								
					modelAndViewObj.addObject("segments",segments);	
					modelAndView.addObject("selectedDate",selectedDate);
				}
//			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}*/
	
	@SuppressWarnings("unchecked")
	public void getDashboardDetails(ModelAndView modelAndView,HttpServletRequest request){
		ArrayList<LocationBean> workLocationsList = null;
		try{
			List<AccessControl> dashboardList = (List<AccessControl>) request.getSession().getAttribute("dashboard");
			if(request.getSession().getAttribute("role").equals("super admin") || (dashboardList != null && dashboardList.size() > 0)){
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
//				List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
//				List<String> categoriesList = adminServiceObj.getCategories(customerIdStr,emailIdStr);
				workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",emailIdStr, false,true,false);
				
				String locationStr=""; 
				List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
				if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
					 zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"-1","","");
					request.getSession().setAttribute("zoneList", zoneList);
				}
				List<Department> departmentList =(List<Department>)request.getSession().getAttribute("departmentList");
				if(departmentList==null || departmentList.size()==0 || departmentList.isEmpty()){
					departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerIdStr, emailIdStr,"-1",false);
					request.getSession().setAttribute("departmentList", departmentList);
				}
				List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
				if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
					categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
					request.getSession().setAttribute("categoryList", categoryList);
				}
				List<ProductSubCategoryBean> subCategoryDetailsList =(List<ProductSubCategoryBean>)request.getSession().getAttribute("subCategoryDetailsList");
				if(subCategoryDetailsList==null || subCategoryDetailsList.size()==0 || subCategoryDetailsList.isEmpty()){
					subCategoryDetailsList = outletMasterServiceObj.getSubCategoryDetails("",customerIdStr, emailIdStr,"-1",false);
					request.getSession().setAttribute("subCategoryDetailsList", subCategoryDetailsList);
				}
				
			/*	List<Role> roleList = (List<Role>)request.getSession().getAttribute("roleList");
				
				if(roleList==null || roleList.size()==0 || roleList.isEmpty()){
					roleList = roleServiceObj.getRoleDetails(null,customerIdStr,emailIdStr,"-1","10","");
					request.getSession().setAttribute("roleList", roleList);
				}
				*/
				/*List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
				List<ZoneMaster> zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"0");
				List<Department> departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerIdStr, emailIdStr,"0",false);
				List<String> brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
				List<ProductSubCategoryBean> subCategoryDetailsList = outletMasterServiceObj.getSubCategoryDetails("",customerIdStr, emailIdStr,"-1",false);
			*/	

				/*if(workLocationsList != null && workLocationsList.size()>0)
					locationStr = workLocationsList.get(0);*/
				
				List<String> brandsList = (List<String>)request.getSession().getAttribute("brandsList");
				if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
				 brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
					request.getSession().setAttribute("brandsList", brandsList);
				}

				List<Suppliers> supplierList =(List<Suppliers>)request.getSession().getAttribute("supplierList");
				if(supplierList==null || supplierList.size()==0 || supplierList.isEmpty()){
					 supplierList = outletMasterServiceObj.getSuppliers(customerIdStr, emailIdStr,"-1","","");
					request.getSession().setAttribute("supplierList", supplierList);
				}
				
				OrdersDashboardBean ordersObj = new OrdersDashboardBean();
				ReportsBean responseObj = new ReportsBean();
				List<Float> salesObj = new ArrayList<Float>();
				List<Float> stocksObj = new ArrayList<Float>();
				String turnOverObj = null;
				WastageDashboardBean wastageDashboardBeanObj = new WastageDashboardBean();
				String selectedDate = "";
				DateFormat dateFormatObj = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
				/*Date today = Calendar.getInstance().getTime();        
				selectedDate = dateFormatObj.format(today);
				selectedDate = selectedDate.substring(0,10);*/
		
				 Calendar cal = Calendar.getInstance();
			     cal.add(Calendar.DATE, -1); 
			     selectedDate= dateFormatObj.format(cal.getTime());
			    // ///////System.out.println(selectedDate);
			     selectedDate = selectedDate.substring(0,10);
					salesObj=dashboardServiceObj.getSales(customerIdStr, emailIdStr, "all", "month", "all",selectedDate,"","","",selectedDate,"");
					stocksObj=dashboardServiceObj.getStocks(customerIdStr, emailIdStr, "all", "month", "all",selectedDate,"","","",selectedDate,"");
					ordersObj = dashboardServiceObj.getOrders(customerIdStr,emailIdStr,"all","month",selectedDate,"","","","",selectedDate,"","","");
					turnOverObj = dashboardServiceObj.getTurnOvers(customerIdStr,emailIdStr,"all","month",selectedDate,"","","","",selectedDate,"","","");
					wastageDashboardBeanObj = dashboardServiceObj.getWastageStockInfo(customerIdStr,emailIdStr,"all","month",selectedDate,"","","","",selectedDate,"","","");
					responseObj = dashboardServiceObj.getdasboardinfo(customerIdStr,emailIdStr,locationStr,"month",selectedDate,"","","","",selectedDate,"","","");
					modelAndView.addObject("workLocationsList",workLocationsList);
//					modelAndView.addObject("categoriesList", categoriesList);
					modelAndView.addObject("categoriesList", categoryList);
					modelAndView.addObject("ordersObj",ordersObj);
					modelAndView.addObject("wastageDashboardBeanObj",wastageDashboardBeanObj);
					modelAndView.addObject("turnOverObj",turnOverObj);
					modelAndView.addObject("salesObj",salesObj);
					modelAndView.addObject("stocksObj",stocksObj);
//					modelAndView.addObject("selectedLocation",location);
					modelAndView.addObject("selectedLocation",locationStr);
					modelAndView.addObject("startDate",selectedDate);
					modelAndViewObj.addObject("zoneList", zoneList);
					modelAndViewObj.addObject("departmentList", departmentList);
					modelAndViewObj.addObject("categoryList", categoryList);
					modelAndViewObj.addObject("subCategoryDetailsList", subCategoryDetailsList);
					modelAndViewObj.addObject("brandsList", brandsList);
					modelAndViewObj.addObject("dashboardinfo", responseObj);
					modelAndView.addObject("selectedCriteria","month");
					String segments []={"#2484c1", "#65a620", "#7b6888", "#a05d56", "#961a1a", "#d8d23a", "#e98125", "#d0743c", "#635222", "#6ada6a",
							"#0c6197", "#7d9058", "#207f33", "#44b9b0", "#bca44a", "#e4a14b", "#a3acb2", "#8cc3e9", "#69a6f9", "#5b388f",
							"#546e91", "#8bde95", "#d2ab58", "#273c71", "#98bf6e", "#4daa4b", "#98abc5", "#cc1010", "#31383b", "#006391",
							"#c2643f", "#b0a474", "#a5a39c", "#a9c2bc", "#22af8c", "#7fcecf", "#987ac6", "#3d3b87", "#b77b1c", "#c9c2b6",
							"#807ece", "#8db27c", "#be66a2", "#9ed3c6", "#00644b", "#005064", "#77979f", "#77e079", "#9c73ab", "#1f79a7"
							
					};
								
					modelAndViewObj.addObject("segments",segments);	
					modelAndView.addObject("selectedDate",selectedDate);
				}
//			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	/*@SuppressWarnings("unchecked")
	public void getDashboardDetails(ModelAndView modelAndView,HttpServletRequest request){
		try{
			List<AccessControl> dashboardList = (List<AccessControl>) request.getSession().getAttribute("dashboard");
			if(request.getSession().getAttribute("role").equals("super admin") || (dashboardList != null && dashboardList.size() > 0)){
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
//				List<String> categoriesList = adminServiceObj.getCategories(customerIdStr,emailIdStr);
				
				List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
				if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
					 zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"0");
					request.getSession().setAttribute("zoneList", zoneList);
				}
				List<Department> departmentList =(List<Department>)request.getSession().getAttribute("departmentList");
				if(departmentList==null || departmentList.size()==0 || departmentList.isEmpty()){
					departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerIdStr, emailIdStr,"-1",false);
					request.getSession().setAttribute("departmentList", departmentList);
				}
				List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
				if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
					categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
					request.getSession().setAttribute("categoryList", categoryList);
				}
				List<ProductSubCategoryBean> subCategoryDetailsList =(List<ProductSubCategoryBean>)request.getSession().getAttribute("subCategoryDetailsList");
				if(subCategoryDetailsList==null || subCategoryDetailsList.size()==0 || subCategoryDetailsList.isEmpty()){
					subCategoryDetailsList = outletMasterServiceObj.getSubCategoryDetails("",customerIdStr, emailIdStr,"-1",false);
					request.getSession().setAttribute("subCategoryDetailsList", subCategoryDetailsList);
				}
				List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
				List<ZoneMaster> zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"0");
				List<Department> departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerIdStr, emailIdStr,"0",false);
				List<String> brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
				List<ProductSubCategoryBean> subCategoryDetailsList = outletMasterServiceObj.getSubCategoryDetails("",customerIdStr, emailIdStr,"-1",false);
				List<String> brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
				OrdersDashboardBean ordersObj = new OrdersDashboardBean();
				List<Float> salesObj = new ArrayList<Float>();
				List<Float> stocksObj = new ArrayList<Float>();
				String turnOverObj = new String();
				WastageDashboardBean wastageDashboardBeanObj = new WastageDashboardBean();
				String selectedDate = "";
				DateFormat dateFormatObj = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
				Date today = Calendar.getInstance().getTime();        
				selectedDate = dateFormatObj.format(today);
				selectedDate = selectedDate.substring(0,10);
				if(workLocationsList != null && workLocationsList.size()>0){
					String location = workLocationsList.get(0);
					//String selectedDate = DateUtil.getLastMonthLastDate();
					if(categoriesList != null && categoriesList.size()>0){
						String categoryStr = categoriesList.get(0);
						salesObj=dashboardServiceObj.getSales(customerIdStr, emailIdStr, location, "month", categoryStr,selectedDate);
						String stockCategoryStr = categoriesList.get(0);
						stocksObj=dashboardServiceObj.getStocks(customerIdStr, emailIdStr, location, "month", stockCategoryStr,selectedDate);
						modelAndView.addObject("selectedCategory",categoryStr);
						modelAndView.addObject("selectedstockCategory",stockCategoryStr);
					}
					ordersObj = dashboardServiceObj.getOrders(customerIdStr,emailIdStr,location,"month",selectedDate);
					turnOverObj = dashboardServiceObj.getTurnOvers(customerIdStr,emailIdStr,location,"month",selectedDate);
					wastageDashboardBeanObj = dashboardServiceObj.getWastageStockInfo(customerIdStr,emailIdStr,location,"month",selectedDate);
					request.getSession().setAttribute("selectedLocation", location);
					salesObj=dashboardServiceObj.getSales(customerIdStr, emailIdStr, "all", "month", "all",selectedDate,"","","","","");
					stocksObj=dashboardServiceObj.getStocks(customerIdStr, emailIdStr, "all", "month", "all",selectedDate,"","","","","");
					ordersObj = dashboardServiceObj.getOrders(customerIdStr,emailIdStr,"all","month",selectedDate,"","","","","","");
					turnOverObj = dashboardServiceObj.getTurnOvers(customerIdStr,emailIdStr,"all","month",selectedDate,"","","","","","");
					wastageDashboardBeanObj = dashboardServiceObj.getWastageStockInfo(customerIdStr,emailIdStr,"all","month",selectedDate,"","","","","","");
					modelAndView.addObject("workLocationsList",workLocationsList);
//					modelAndView.addObject("categoriesList", categoriesList);
					modelAndView.addObject("categoriesList", categoryList);
					modelAndView.addObject("ordersObj",ordersObj);
					modelAndView.addObject("wastageDashboardBeanObj",wastageDashboardBeanObj);
					modelAndView.addObject("turnOverObj",turnOverObj);
					modelAndView.addObject("salesObj",salesObj);
					modelAndView.addObject("stocksObj",stocksObj);
//					modelAndView.addObject("selectedLocation",location);
					modelAndView.addObject("selectedLocation","");
					modelAndViewObj.addObject("zoneList", zoneList);
					modelAndViewObj.addObject("departmentList", departmentList);
					modelAndViewObj.addObject("categoryList", categoryList);
					modelAndViewObj.addObject("subCategoryDetailsList", subCategoryDetailsList);
					modelAndViewObj.addObject("brandsList", brandsList);
					modelAndView.addObject("selectedCriteria","month");
					String segments []={"#2484c1", "#65a620", "#7b6888", "#a05d56", "#961a1a", "#d8d23a", "#e98125", "#d0743c", "#635222", "#6ada6a",
							"#0c6197", "#7d9058", "#207f33", "#44b9b0", "#bca44a", "#e4a14b", "#a3acb2", "#8cc3e9", "#69a6f9", "#5b388f",
							"#546e91", "#8bde95", "#d2ab58", "#273c71", "#98bf6e", "#4daa4b", "#98abc5", "#cc1010", "#31383b", "#006391",
							"#c2643f", "#b0a474", "#a5a39c", "#a9c2bc", "#22af8c", "#7fcecf", "#987ac6", "#3d3b87", "#b77b1c", "#c9c2b6",
							"#807ece", "#8db27c", "#be66a2", "#9ed3c6", "#00644b", "#005064", "#77979f", "#77e079", "#9c73ab", "#1f79a7"
							
					};
								
					modelAndViewObj.addObject("segments",segments);	
					modelAndView.addObject("selectedDate",selectedDate);
				}
//			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}*/
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display the profile form
	 *
	 **/
	@RequestMapping("/profile")
	public ModelAndView editProfile(HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("editProfile called");
			modelAndViewObj = new ModelAndView();
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			UserDetails userDetails = userServiceObj.getUser(emailId,customerId, emailId);
			modelAndViewObj.addObject("userDetails", userDetails);
			modelAndViewObj.setViewName("profile");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	/*@ExceptionHandler(SessionExpired.class)
	public ModelAndView handleCustomException(SessionExpired ex) {
		// log.info("Exception Handler");
		ModelAndView model = new ModelAndView("login");
		model.addObject("exception", ex);
		return model;

	}*/
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to save the details of the Existing User and return the response
	 *
	 **/
	@RequestMapping(value="/updateProfile",method=RequestMethod.POST)
	public ModelAndView updateProfile(@RequestBody UserDetails userDetails, HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("updateProfile ");
			// log.info(userDetails.getFirstName());
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			userDetails.setAccountStatus("active");
			String resultStr = userServiceObj.updateUser(userDetails,customerId,emailId);
			// log.info(resultStr);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("err", resultStr);
			modelAndViewObj.addObject("userDetails", userDetails);
			modelAndViewObj.setViewName("profile");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display the forgot password form
	 *
	 **/
	@RequestMapping("/forgotPasswordForm")
	public ModelAndView forgotPasswordForm(HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("forgot password form called");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.setViewName("forgotPassword");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * @author Sahitya
	 * 
	 * param customerId,emailId
	 *
	 * This method is used to send required details to webservices via login service for sending mail about forgot password
	 * 
	 * @return status
	 *
	 **/
	@RequestMapping(value="/forgotPassword",method=RequestMethod.POST)
	public void forgotPassword(@RequestBody ChangePasswordForm formObj,HttpServletRequest request,HttpServletResponse response) {
		String statusStr = "";
		try{
			// log.info("Controller : Forgot Password");
			String url = request.getRequestURL().toString();
			String contextPath = request.getContextPath();
			int index = url.lastIndexOf(contextPath);
			String ipAdd = url.substring(0, index);
			
			statusStr = loginServiceObj.forgotPassword(formObj.getUid(), formObj.getEid(),url);
			if(statusStr.equals(Constants.SUCCESS)){
				statusStr = "{\"msg\":\" Check your mail to reset your password \"}";
			}
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
	    	response.getWriter().write(statusStr);
			
		}catch(Exception exception){
			exception.printStackTrace();
		}finally {
	    	try {
				response.getWriter().close();
			} catch (IOException e) {
				e.printStackTrace();
			}
	    
	    }
	}
	
	/**
	 * 
	 * @author Sahitya
	 * 
	 *This method is used to display the reset password form when clicking the link sent to the users Mail Id
	 *
	 **/
	@RequestMapping("/resetPasswordFormLink")
	public ModelAndView resetPasswordFormLink(HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("resetPasswordForm called");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.setViewName("resetPasswordLink");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Sahitya
	 * 
	 *This method is used to reset the password of the user by clicking the link sent to his/her Mail Id
	 *
	 **/
	@RequestMapping(value="/resetPassword",method=RequestMethod.POST)
	public void resetPassword(@RequestBody ChangePasswordForm formObj,HttpServletRequest request,HttpServletResponse response) {
		String statusStr = null;
		try{
			// log.info("Reset Password called");
			statusStr = loginServiceObj.resetPassword(formObj);
			if(statusStr.equals(Constants.SUCCESS)){
				statusStr = "{\"msg\":\" Your Password is changed Successfully\"}";
			}
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
	    	response.getWriter().write(statusStr);
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to invalidate the session and logout of the application
	 *
	 **/
	@RequestMapping(value="/logout")
	public ModelAndView logout(HttpServletRequest request,HttpServletResponse response, HttpSession session){
		try{
			// log.info("logout ");
        	LocaleResolver localeResolver = RequestContextUtils.getLocaleResolver(request);
			localeResolver.setLocale(request, response, Locale.ENGLISH);
			
			request.getSession().invalidate();
//			request.getAttribute("WINDOW_NAME").i
//			session.invalidate();
//			request.getSession().setAttribute("WINDOW_NAME", null); 
//			request.getSession().setAttribute("WINDOW_NAME", null);
			/*response.setHeader("Cache-Control","no-cache");
			response.setHeader("Cache-Control","no-store");
			response.setHeader("Pragma","no-cache");
			response.setDateHeader ("Expires", 0);*/
//			sessionScope.Clear();
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.setViewName("login");
			
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display the change password form
	 *
	 **/
	@RequestMapping("/changePasswordForm")
	public ModelAndView changePasswordForm(HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("changePasswordForm called");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.setViewName("changePassword");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display the change password form when clicking the link sent to the users Mail Id
	 *
	 **/
	@RequestMapping("/changePasswordFormLink")
	public ModelAndView changePasswordFormLink(HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("changePasswordForm called");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.setViewName("changePasswordLink");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	
	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to change the password of the user by clicking the link sent to his Mail Id
	 *
	 **/
	@RequestMapping("/changePasswordLink")
	public ModelAndView changePassword(ChangePasswordForm changePasswordForm,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("changePassword called");
			String uid = changePasswordForm.getUid();
			String eid = changePasswordForm.getEid();
			modelAndViewObj = new ModelAndView();
			String status = new ServerSideValidations().changePasswordForm(changePasswordForm);
			if(status.equalsIgnoreCase(Constants.SUCCESS)){//server-side validations success
				changePasswordForm.setUid(EncryptAndDecrypt.decrypt(uid));
				changePasswordForm.setEid(EncryptAndDecrypt.decrypt(eid));
				String result = loginServiceObj.isPasswordChanged(changePasswordForm);
				// log.info(result);
				if(result.contains("0")){
					// log.info("login set");
					modelAndViewObj.setViewName("login");
				}
				else{
					// log.info("Incorrect Password");
					modelAndViewObj.addObject("uid", uid);
					modelAndViewObj.addObject("eid", eid);
					modelAndViewObj.addObject("err", "Incorrect Password");
					modelAndViewObj.setViewName("changePasswordLink");
				}
			}else{
				modelAndViewObj.addObject("uid", uid);
				modelAndViewObj.addObject("eid", eid);
				modelAndViewObj.addObject("err",status);
				modelAndViewObj.setViewName("changePasswordLink");
			}
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to change the password after login to the application
	 *
	 **/
	@RequestMapping("/changePassword")
	public void changePassword(@RequestParam("password") String password,@RequestParam("newPassword") String newPassword,
			@RequestParam("confirmPassword") String confirmPassword,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("changePassword called");
			modelAndViewObj = new ModelAndView();
			ChangePasswordForm changePasswordForm = new ChangePasswordForm();
			changePasswordForm.setPassword(password);
			changePasswordForm.setNewPassword(newPassword);
			changePasswordForm.setConfirmPassword(confirmPassword);
			changePasswordForm.setUid((String)request.getSession().getAttribute("customerId"));
			changePasswordForm.setEid((String)request.getSession().getAttribute("emailId"));
			String status = new ServerSideValidations().changePasswordForm(changePasswordForm);
			String jsonString = null;
			if(status.equalsIgnoreCase(Constants.SUCCESS)){//server-side validations success
				String result = loginServiceObj.isPasswordChanged(changePasswordForm);
				// log.info(result);
				if(result.contains("0"))
					jsonString = "{\"msg\":\" Your Password is changed\"}";
				else if(result.contains("-1"))
					jsonString = "{\"err\":\" Incorrect Password\"}";
			}else
				jsonString = "{\"err\":\""+status+" \"}";
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
	    	response.getWriter().write(jsonString);
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		finally {
	    	try {
				response.getWriter().close();
			} catch (IOException e) {
				e.printStackTrace();
			}
	    
	    }
	}
	
}
