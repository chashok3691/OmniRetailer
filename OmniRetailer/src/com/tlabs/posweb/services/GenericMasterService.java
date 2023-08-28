package com.tlabs.posweb.services;

import java.math.BigDecimal;
//import java.net.SocketTimeoutException;
import java.rmi.ConnectException;
import java.rmi.RemoteException;
import java.rmi.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
//import java.util.Enumeration;
import java.util.HashSet;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Set;

//import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//import javax.servlet.http.HttpSessionContext;

import com.tlabs.posweb.init.AppProperties;
//import com.tlabs.posweb.services.DataManagementService.importValue;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.technolabssoftware.www.AssetMasterServiceProxy;
import com.technolabssoftware.www.BrandMasterServiceProxy;
//import com.technolabssoftware.www.EmployeesProxy;
import com.technolabssoftware.www.UtilityMasterServiceProxy;
import com.technolabssoftware.www.ZoneMasterServiceProxy;
import com.tlabs.posweb.beans.AccountTypeMaster;
import com.tlabs.posweb.beans.AdvanceAndPayments;
import com.tlabs.posweb.beans.Assement;
import com.tlabs.posweb.beans.AssetAccounts;
import com.tlabs.posweb.beans.AssetMaster;
import com.tlabs.posweb.beans.B2BPartner;
import com.tlabs.posweb.beans.BalanceSheetBean;
import com.tlabs.posweb.beans.BrandMaster;
import com.tlabs.posweb.beans.CreditNoteMaster;
import com.tlabs.posweb.beans.CurrencyBean;
import com.tlabs.posweb.beans.CurrentAssetBean;
import com.tlabs.posweb.beans.DebitNoteMaster;
import com.tlabs.posweb.beans.DenominationMaster;
import com.tlabs.posweb.beans.DenominationMasterResponse;
import com.tlabs.posweb.beans.EmployeeBean;
import com.tlabs.posweb.beans.ExpensesAccounts;
import com.tlabs.posweb.beans.FleetMaster;
import com.tlabs.posweb.beans.Group;
import com.tlabs.posweb.beans.HSNMaster;
import com.tlabs.posweb.beans.HomePageGroup;
import com.tlabs.posweb.beans.IncomeAccounts;
import com.tlabs.posweb.beans.JournalAccount;
import com.tlabs.posweb.beans.LiabilityAccounts;
import com.tlabs.posweb.beans.LocationBean;
import com.tlabs.posweb.beans.LoyaltyCardMaster;
import com.tlabs.posweb.beans.MasterDataImportsAndExportsBean;
import com.tlabs.posweb.beans.OrganizationLocations;
import com.tlabs.posweb.beans.OrganizationMaster;
import com.tlabs.posweb.beans.PettyCashBook;
import com.tlabs.posweb.beans.PurchasePaymentMaster;
import com.tlabs.posweb.beans.ReconciliationMaster;
//import com.tlabs.posweb.beans.ProductCategoryBean;
import com.tlabs.posweb.beans.RequestBean;
import com.tlabs.posweb.beans.RequestHeader;
import com.tlabs.posweb.beans.RetailServiceArea;
import com.tlabs.posweb.beans.RouteMaster;
import com.tlabs.posweb.beans.SalesAndPaymentsMaster;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.beans.SpecialisationMaster;
import com.tlabs.posweb.beans.States;
import com.tlabs.posweb.beans.StockIssues;
import com.tlabs.posweb.beans.StoreTaxation;
import com.tlabs.posweb.beans.SubAccountTypeMaster;
import com.tlabs.posweb.beans.TaxBean;
import com.tlabs.posweb.beans.TenderMaster;
import com.tlabs.posweb.beans.WarehouseTaxation;
import com.tlabs.posweb.beans.ZoneDetails;
import com.tlabs.posweb.beans.ZoneMaster;
import com.tlabs.posweb.util.DateUtil;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
import com.tlabs.posweb.util.RestfulServiceConnection;
//import com.tlabs.posweb.util.Utilities;

public class GenericMasterService {
	
	@Autowired
	private Gson gson;
	@Autowired
	SessionScope sessionScope;
	@Autowired
	private SkuService skuServiceObj;
//	private static Logger log = Logger.getLogger(GenericMasterService.class);

	/**
	 * 
	 * @author Mythri.S
	 * 
	 * This method is used to call getCurrency method of web service and return all the Currency Details List
	 * 
	 * */
	public ArrayList<CurrencyBean> getCurrency(String countryName,String customerId,String emailId,String index){
		ArrayList<CurrencyBean> currencyDetails = null;
		String result = null;
		try{
			CurrencyBean currencyBean = new CurrencyBean();
			//UtilityMasterServiceProxy utitlitymaster = new UtilityMasterServiceProxy();
			currencyBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			currencyBean.setCountryName(countryName);
			currencyBean.setStartIndex(index);
			//result = utitlitymaster.getCurrency(gson.toJson(currencyBean));
			result = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("get_Currency"), gson.toJson(currencyBean),"GET");

			String totalRecords = Response.getResponseTotalRecords(result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				String responseList = Response.getResponseList(result, "currencyDetails");
				JSONArray jsonResponseArray = new JSONArray(responseList);
				currencyDetails = new ArrayList<CurrencyBean>();
				int slNo = Integer.parseInt(index);
				for (int i=0; i<jsonResponseArray.length(); i++) {
					currencyBean = gson.fromJson(jsonResponseArray.getString(i), CurrencyBean.class);
					currencyBean.setSlNo(++slNo);
					currencyDetails.add(currencyBean);
				}
				currencyDetails.get(0).setTotalRecords(totalRecords);
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
		return currencyDetails;
	}
	
	/**	manasa
	 * 
	 * @param zoneID
	 * @param customerIdStr
	 * @param emailIdStr
	 * @param index
	 * @param maxRecords
	 * @param searchCriteria
	 * @return
	 */
	public  List<ZoneMaster> getZonalLocationBasedonZone(String zoneID,String customerIdStr,String emailIdStr,String index,String maxRecords,String searchCriteria,String bussinessActivity){
		String result = null;
		List<ZoneMaster> zoneMasterList = new ArrayList<ZoneMaster>();
		List<String> locationsList = new ArrayList<String>();
		try {
			ZoneMaster zoneMasterObj = new ZoneMaster();
			zoneMasterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			zoneMasterObj.setStartIndex(index);
			if(zoneID != null && zoneID != ""){
				List<String> myList = new ArrayList<String>(Arrays.asList(zoneID.split(",")));
				zoneMasterObj.setZoneList(myList);
			}
			zoneMasterObj.setMaxRecords(maxRecords);
			zoneMasterObj.setSearchCriteria(searchCriteria);
			if(bussinessActivity.equalsIgnoreCase("warehouse"))
				zoneMasterObj.setLocationType("Warehouse");
			else
				zoneMasterObj.setLocationType("Retail Outlet");

			//// log.info("Request String::::::::::"+gson.toJson(zoneMasterObj));
			//////////////System.out.println("Request String::::::::::"+gson.toJson(zoneMasterObj));
			result = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("get_zones"), gson.toJson(zoneMasterObj),"GET");
			//////////////System.out.println("Response String Got:::::::::::"+result);

			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				zoneMasterObj = gson.fromJson(result, ZoneMaster.class);
				zoneMasterList = zoneMasterObj.getZoneMasterList();
				if(zoneMasterObj.getZoneMasterList() != null && zoneMasterObj.getZoneMasterList().size()>0){
					for(ZoneMaster zone :zoneMasterObj.getZoneMasterList()){
						if(zone.getZoneDetails()!=null && zone.getZoneDetails().size()>0){
							for(ZoneDetails details : zone.getZoneDetails()){
								ArrayList<LocationBean> locationDetails = skuServiceObj.getLocationDetails(details.getLocation(),customerIdStr, emailIdStr,"-1","",false,true,true);

								/*	
								if(locationDetails==null || locationDetails.size()==0 || locationDetails.isEmpty()){
									locationDetails = skuServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,true,true);
									request.getSession().setAttribute("locationDetails", locationDetails);
								}*/
								
								if(locationDetails!=null)
								{
								for(int i=0;i<locationDetails.size();i++){	
									if(details.getLocation().equals(locationDetails.get(i).getLocationId()))
										locationsList.add(details.getLocation()+"+"+locationDetails.get(i).getBusinessActivity()+"+"+locationDetails.get(i).getDescription());
								}
								}
							}
						}
					}
					zoneMasterList.get(0).setZones(locationsList);
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
		return zoneMasterList;
	}
	
	
	public ArrayList<CurrencyBean> getCurrency(String countryName,String customerId,String emailId,String index, String maxRecords){
		ArrayList<CurrencyBean> currencyDetails = null;
		String result = null;
		try{
			CurrencyBean currencyBean = new CurrencyBean();
			currencyBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			currencyBean.setCountryName(countryName);
			currencyBean.setStartIndex(index);
			currencyBean.setMaxRecords(maxRecords);
			//result = utitlitymaster.getCurrency(gson.toJson(currencyBean));
			result = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("get_Currency"), gson.toJson(currencyBean),"GET");

			String totalRecords = Response.getResponseTotalRecords(result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				String responseList = Response.getResponseList(result, "currencyDetails");
				JSONArray jsonResponseArray = new JSONArray(responseList);
				currencyDetails = new ArrayList<CurrencyBean>();
				int slNo = Integer.parseInt(index);
				for (int i=0; i<jsonResponseArray.length(); i++) {
					currencyBean = gson.fromJson(jsonResponseArray.getString(i), CurrencyBean.class);
					currencyBean.setSlNo(++slNo);
					currencyDetails.add(currencyBean);
				}
				currencyDetails.get(0).setTotalRecords(totalRecords);
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
		return currencyDetails;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to call createCurrency method of web service and return the response
	 *
	 **/
	public String createCurrency(String countryName,String currencyCode,String baseCurrency,String conversionRatio,String customerId,String emailId){
		String result = null;
		try {
			CurrencyBean currencyBean = new CurrencyBean();
			//UtilityMasterServiceProxy utitlitymaster = new UtilityMasterServiceProxy();
			currencyBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			currencyBean.setCountryName(countryName);
			currencyBean.setCurrencyCode(currencyCode);
			currencyBean.setBaseCurrency(baseCurrency);
			currencyBean.setConversionRatio(conversionRatio);
		//	//////////////System.out.println("req--"+gson.toJson(currencyBean));
		//	result = utitlitymaster.createCurrency(gson.toJson(currencyBean));
			////////////////System.out.println(result);
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_Currency"), gson.toJson(currencyBean));
			 String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					result = AppProperties.getAppMessageByProperty("CURRENCY_CREATE_SUCCESS").trim();
				}
				else{
//					result = "Couldn't create, please try after some time";
					result = Response.getResponseMessage(result);
				}
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
	 *This method is used to call updateCurrency method of web service and return the response
	 *
	 **/
	public String updateCurrency(String countryName,String currencyCode,String baseCurrency,String conversionRatio,String customerId,String emailId){
		String result = null;
		try {
			CurrencyBean currencyBean = new CurrencyBean();
			currencyBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			currencyBean.setCountryName(countryName);
			currencyBean.setCurrencyCode(currencyCode);
			currencyBean.setBaseCurrency(baseCurrency);
			currencyBean.setConversionRatio(conversionRatio);
			//result = utitlitymaster.updateCurrency(gson.toJson(currencyBean));
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_Currency"), gson.toJson(currencyBean));
			 String responseCode = Response.getResponseCode(result);
			 	if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			 		result = AppProperties.getAppMessageByProperty("CURRENCY_UPDATE_SUCCESS").trim();
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
		return result;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to call deleteCurrency method of web service and return the response
	 *
	 **/
	public String deleteCurrency(String customerId,String emailId,String ids) {
		String result = null;
		try {
			CurrencyBean currencyBean = new CurrencyBean();
			currencyBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			String[] idsArray = ids.split(",");
			List<String> countryList = new ArrayList<String>();
			for(int i=0;i<idsArray.length;i++)
				countryList.add(idsArray[i]);
			currencyBean.setCountryList(countryList);
			//result = utitlitymaster.deleteCurrency(gson.toJson(currencyBean));
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("delete_Currency"), gson.toJson(currencyBean));
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("CURRENCY_DELETE_SUCCESS").trim();
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
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to call createEmployee method of web service and return the response
	 *
	 **//*
	public String createEmployee(EmployeeBean employeeBean,String customerId,String emailId) {
		String result = null; 
		try {
			  EmployeesProxy employeeProxy = new EmployeesProxy();
			  employeeBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			  String employeeDetailsList = gson.toJson(employeeBean);
			  // log.info(employeeDetailsList);
			  result = employeeProxy.createEmployee(employeeDetailsList);
			  // log.info(result);
			  String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					result = AppProperties.getAppMessageByProperty("EMPLOYEE_CREATE_SUCCESS").trim();
				}
				else{
//					result = "Couldn't create, please try after some time";
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
	
	*//**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to call updateEmployee method of web service and return the response
	 *
	 **//*
	public String updateEmployee(EmployeeBean employeeBean,String customerId,String emailId) {
		String result = null;  
		try {
			  EmployeesProxy employeeProxy = new EmployeesProxy();
			  employeeBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			  String employeeDetailsList = gson.toJson(employeeBean);
			  // log.info("Request String:::"+employeeDetailsList);
			  result = employeeProxy.updateEmployee(employeeDetailsList);
			  // log.info("Response String::"+result);
			  String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					result = AppProperties.getAppMessageByProperty("EMPLOYEE_UPDATE_SUCCESS").trim();
				}
				else{
//					result = "Couldn't update, please try after some time";
					result = Response.getResponseMessage(result);
				}
			  // log.info(result);
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
	
	*//**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to call deleteEmployee method of web service and return the response
	 *
	 **//*
	public String deleteEmployees(String customerId,String emailId,String ids) {
		String result = null;
		try {
			EmployeeBean employeeBean = new EmployeeBean();
			employeeBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			EmployeesProxy employeeProxy = new EmployeesProxy();
			String[] idsArray = ids.split(",");
			List<String> employeeList = new ArrayList<String>();
			for(int i=0;i<idsArray.length;i++)
				employeeList.add(idsArray[i]);
			employeeBean.setEmployeeList(employeeList);
			result = employeeProxy.deleteEmployee(gson.toJson(employeeBean));
			// log.info(result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("EMPLOYEE_DELETE_SUCCESS").trim();
			else if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_FAILED_CODE").trim()))
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
	
	*//**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to call getEmployees method of web service and return the Employee List
	 *
	 **//*
	public ArrayList<EmployeeBean> getEmployees(String empName,String customerId,String emailId,String index,String location,boolean search){
		String result = null;
		ArrayList<EmployeeBean> employeeList = null;
		try{
		  EmployeesProxy employeeProxy = new EmployeesProxy();
		  EmployeeBean employeeBean = new EmployeeBean();
		  employeeBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		  employeeBean.setStartDate(null);
		  employeeBean.setEndDate(null);
		  if(search)
			  employeeBean.setSearchCriteria(empName);
		  else
			  employeeBean.setSearchCriteria(empName);
			  //employeeBean.setFirstName(empName);
		  employeeBean.setStartIndex(index);
		  employeeBean.setLocation(location);
		  // log.info("Request::::"+gson.toJson(employeeBean));
//		  String employeeDetailsList = gson.toJson(employeeBean);
		  result = employeeProxy.getEmployees(gson.toJson(employeeBean));
//		  result = new RestfulServiceConnection().soapCall();
		  String responseCode = Response.getResponseCode(result);
		  // log.info(result);
		  String totalRecords = Response.getResponseTotalRecords(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				String responseList = Response.getResponseList(result, "employeeDetailsList");
				JSONArray jsonResponseArray = new JSONArray(responseList);
				employeeList = new ArrayList<EmployeeBean>();
				EmployeeBean employee = new EmployeeBean();
				int slNo = Integer.parseInt(index);
				for (int i=0; i<jsonResponseArray.length(); i++) {
					employee = gson.fromJson(jsonResponseArray.getString(i), EmployeeBean.class);
					employee.setSlNo(++slNo);
					employeeList.add(employee);
				}
				employeeList.get(0).setTotalRecords(totalRecords);
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
		return employeeList;
	}
	
	*//**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to call getEmployee method of web service and return the Employee Details
	 *
	 **//*
	public EmployeeBean getEmployeeByCode(String empCode,String customerId,String emailId){
		String result = null;
		EmployeeBean employee = new EmployeeBean();
		try{
		  EmployeesProxy employeeProxy = new EmployeesProxy();
		  employee.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		  employee.setEmployeeCode(empCode);
		  String employeeDetailsList = gson.toJson(employee);
		  result = employeeProxy.getEmployee(employeeDetailsList);
		  String responseCode = Response.getResponseCode(result);
		  // log.info(result);
		  if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				String responseList = Response.getResponseList(result, "employeeDetails");
				employee = gson.fromJson(responseList, EmployeeBean.class);
				Date date = null;
				Calendar c = Calendar.getInstance();
				SimpleDateFormat  formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				date = formatter.parse(employee.getDateOfJoining());
				c.setTime(date);
				int mon = c.get(Calendar.MONTH) +1;
				String doj = c.get(Calendar.DATE) +"/"+ mon +"/"+ c.get(Calendar.YEAR);
				date = formatter.parse(employee.getDateOfBirth());
				c.setTime(date);
				mon = c.get(Calendar.MONTH) +1;
				String dob = c.get(Calendar.DATE) +"/"+ mon +"/"+ c.get(Calendar.YEAR);
				employee.setDateOfBirth(dob);
				employee.setDateOfJoining(doj);
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
		return employee;
	}*/
	
	
	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * @modified by vinay in dec/2017
	 * 		This method is used to call createEmployee method of
	 *      web service and return the response
	 *
	 **/
	public String createEmployee(EmployeeBean employeeBean, String customerId, String emailId) {

		String resultStr = null;
		try {
			employeeBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		 if(employeeBean.getDateOfBirth().equals(""))
			employeeBean.setDateOfBirth(null);
			String employeeDetailsList = gson.toJson(employeeBean);
//			//////////////System.out.println("Request String :::::::::::" + employeeDetailsList);
			// restful service connection
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			String url = AppProperties.getRESTFulCloudServiceURL("create_employee");
			resultStr = restfulServiceConnectionObj.getResponseFromPost(url, employeeDetailsList);
			// response from service
		//	//////////////System.out.println("Response String :::::::::::" + resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if (responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())) {

				resultStr = AppProperties.getAppMessageByProperty("EMPLOYEE_CREATE_SUCCESS").trim();
			} else {

				resultStr = Response.getResponseMessage(resultStr);
				// log.info(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch (Exception e) {
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return resultStr;
	}

	/**
	 * 
	 * @author Mythri.S
	 * @modified by vinay in dec/2017
	 * 
	 *  This method is used to call updateEmployee method of
	 *           web service and return the response
	 *
	 **/
	public String updateEmployee(EmployeeBean employeeBean, String customerId, String emailId) {
		String result = null;
		try {

			// restful service connection
			RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
			employeeBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			if(employeeBean.getDateOfBirth().equals(""))
				employeeBean.setDateOfBirth(null);
			String employeeDetailsList = gson.toJson(employeeBean);
//			//////////////System.out.println("request string SERVICE ::" + employeeDetailsList);
			String url = AppProperties.getRESTFulCloudServiceURL("update_employee");
			// service call
			result = restFulServiceConnectionObj.getResponseFromPost(url, employeeDetailsList);

			// response from service
			////////////////System.out.println("Response String::" + result);
			String responseCode = Response.getResponseCode(result);
			if (responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())) {
				result = AppProperties.getAppMessageByProperty("EMPLOYEE_UPDATE_SUCCESS").trim();
			} else {

				result = Response.getResponseMessage(result);
			}
			// log.info(result);
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch (Exception e) {
			e.printStackTrace();
			result = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return result;
	}

	/**
	 * 
	 * @author Mythri.S
	 * @modified by vinay in dec/2017
	 * This method is used to call deleteEmployee method of
	 *           web service and return the response
	 *
	 **/
	public String deleteEmployees(String customerId, String emailId, String ids) {
		String result = null;
		try {
			EmployeeBean employeeBean = new EmployeeBean();
			employeeBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// restful service connection
			RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
			String[] idsArray = ids.split(",");
			List<String> employeeList = new ArrayList<String>();
			for (int i = 0; i < idsArray.length; i++)
				employeeList.add(idsArray[i]);
			employeeBean.setEmployeeList(employeeList);
			String employeeDetailsList = gson.toJson(employeeBean);
			////////////System.out.println("REquest String::" + employeeDetailsList);
			String url = AppProperties.getRESTFulCloudServiceURL("delete_employee");
			result = restFulServiceConnectionObj.getResponseFromPost(url, employeeDetailsList);
			// response from service
			////////////System.out.println("Response String::" + result);
			String responseCode = Response.getResponseCode(result);
			if (responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("EMPLOYEE_DELETE_SUCCESS").trim();
		
			}
			else if (responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_FAILED_CODE").trim())){
				result = Response.getResponseMessage(result);
			////////////////System.out.println(result);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch (Exception e) {
			e.printStackTrace();
			result = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return result;
	}

	public ArrayList<EmployeeBean> getEmployees(String empName, String customerId, String emailId, String index,String location,String maxRecords, boolean search,String locationListAll) throws Exception {
		String result = null;
		ArrayList<EmployeeBean> employeeList = null;
		try {

			// restful service connection
			RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
			EmployeeBean employeeBean = new EmployeeBean();
			employeeBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			employeeBean.setStartDate(null);
			employeeBean.setEndDate(null);
			employeeBean.setSearchCriteria(empName);
			employeeBean.setStartIndex(index);
			
			
			if(location.equals("all") || location.equals("")){
				List<String> myList = new ArrayList<String>(Arrays.asList(locationListAll.split(",")));
				employeeBean.setLocationsList(myList);
				}
				else
			employeeBean.setLocation(location);
			employeeBean.setMaxRecords(maxRecords);
			String employeeDetailsList = gson.toJson(employeeBean);
			////////System.out.println(employeeDetailsList);
			String url = AppProperties.getRESTFulCloudServiceURL("get_employees");
		
			////////System.out.println("Request String::::" + employeeDetailsList);
			result = restFulServiceConnectionObj.getResponse(url, employeeDetailsList, "GET");

			
			////////System.out.println("employeeDetailsList response String::::" + result);
			// response from service
			////////System.out.println("Response String::" + result);
			String responseCode = Response.getResponseCode(result);
			String totalRecords = Response.getResponseTotalRecords(result);
			if (responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())) {
				String responseList = Response.getResponseList(result, "employeeDetailsList");
				JSONArray jsonResponseArray = new JSONArray(responseList);
				employeeList = new ArrayList<EmployeeBean>();
				EmployeeBean employee = new EmployeeBean();
				int slNo = Integer.parseInt(index);
				for (int i = 0; i < jsonResponseArray.length(); i++) {
					employee = gson.fromJson(jsonResponseArray.getString(i), EmployeeBean.class);
					employee.setSlNo(++slNo);
					employeeList.add(employee);
				}
				employeeList.get(0).setMaxRecords(totalRecords);
			}
		}
		/*catch (SocketTimeoutException stc) {
		//	stc.printStackTrace();
		throw new SocketTimeoutException(result);
		}
		catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}*/ catch (Exception e) {
		//	throw new Exception(result);
			e.printStackTrace();
			result = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return employeeList;
	}
	
	
	public ArrayList<EmployeeBean> getemployeesByRole(String empName, String customerId, String emailId, String index,String location,String maxRecords, boolean search) throws Exception {
		String result = null;
		ArrayList<EmployeeBean> employeeList = null;
		try {

			// restful service connection
			RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
			EmployeeBean employeeBean = new EmployeeBean();
			employeeBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			employeeBean.setDesignation(empName);
			employeeBean.setStartIndex(index);
			employeeBean.setLocation(location);
			employeeBean.setMaxRecords(maxRecords);
			String employeeDetailsList = gson.toJson(employeeBean);
			String url = AppProperties.getRESTFulCloudServiceURL("get_Employee_ByRole");
		
			////////////System.out.println("Request String::::" + employeeDetailsList);
			result = restFulServiceConnectionObj.getResponse(url, employeeDetailsList, "GET");

			// response from service
			////////////System.out.println("Response String::" + result);
			String responseCode = Response.getResponseCode(result);
			String totalRecords = Response.getResponseTotalRecords(result);
			if (responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())) {
				String responseList = Response.getResponseList(result, "employeeDetailsList");
				JSONArray jsonResponseArray = new JSONArray(responseList);
				employeeList = new ArrayList<EmployeeBean>();
				EmployeeBean employee = new EmployeeBean();
				int slNo = Integer.parseInt(index);
				for (int i = 0; i < jsonResponseArray.length(); i++) {
					employee = gson.fromJson(jsonResponseArray.getString(i), EmployeeBean.class);
					employee.setSlNo(++slNo);
					employeeList.add(employee);
				}
				employeeList.get(0).setMaxRecords(totalRecords);
			}
		}
		/*catch (SocketTimeoutException stc) {
		//	stc.printStackTrace();
		throw new SocketTimeoutException(result);
		}
		catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}*/ catch (Exception e) {
		//	throw new Exception(result);
			e.printStackTrace();
			result = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return employeeList;
	}
	
/*
	*//**
	 * 
	 * @author Mythri.S
	 * @modified by vinay  in dec/2017
	 * 
	 * @ This method is used to call getEmployee method of
	 *           web service and return the Employee Details
	 *
	 **//*
	public EmployeeBean getEmployeeByCode(String empCode, String customerId, String emailId) {
		String result = null;
		EmployeeBean employeeBean = new EmployeeBean();
		try {

			// restful Service Connection
			RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
			employeeBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			employeeBean.setEmployeeCode(empCode);
			String employeeDetailsList = gson.toJson(employeeBean);
			String url = AppProperties.getRESTFulCloudServiceURL("get_employee");
			result = restFulServiceConnectionObj.getResponse(url, employeeDetailsList, "GET");
			// log.info(result);

			// response from service
			//////////////System.out.println(result);
			String responseCode = Response.getResponseCode(result);
			if (responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())) {
				String responseList = Response.getResponseList(result, "employeeDetails");
				//////////////System.out.println("responselist" + responseList);

				employeeBean = gson.fromJson(responseList, EmployeeBean.class);
				Date date = null;

				Calendar c = Calendar.getInstance();
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

				date = formatter.parse(employeeBean.getDateOfJoin());
				//////////////System.out.println(date);
				c.setTime(date);
				int mon = c.get(Calendar.MONTH) + 1;
				String doj = c.get(Calendar.DATE) + "/" + mon + "/" + c.get(Calendar.YEAR);
				//////////////System.out.println(doj);

				date = formatter.parse(employeeBean.getDob());
				c.setTime(date);
				mon = c.get(Calendar.MONTH) + 1;
				String dob = c.get(Calendar.DATE) + "/" + mon + "/" + c.get(Calendar.YEAR);

				employeeBean.setDob(dob);
				
				employeeBean.setDateOfJoin(doj);

			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch (Exception e) {
			e.printStackTrace();
			result = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return employeeBean;
	}
	
	*/
	
	/**
	 * 
	 * @author Mythri.S
	 * @modified by vinay  in dec/2017
	 * 
	 * @ This method is used to call getEmployee method of
	 *           web service and return the Employee Details
	 *
	 **/
	public EmployeeBean getEmployeeByCode(String empCode, String customerId, String emailId) {
		String result = null;
		EmployeeBean employeeBean = new EmployeeBean();
		try {

			// restful Service Connection
			RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
			employeeBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			employeeBean.setEmployeeCode(empCode);
			String employeeDetailsList = gson.toJson(employeeBean);
			String url = AppProperties.getRESTFulCloudServiceURL("get_employee");
			result = restFulServiceConnectionObj.getResponse(url, employeeDetailsList, "GET");
			// log.info(result);

			// response from service
		   ////////System.out.println("employee details"+result);
			String responseCode = Response.getResponseCode(result);
			if (responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())) {
				String responseList = Response.getResponseList(result, "employeeDetails");
				////////////////System.out.println("responselist" + responseList);

				employeeBean = gson.fromJson(responseList, EmployeeBean.class);
				Date date = null;

				Calendar c = Calendar.getInstance();
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

				if(employeeBean.getDateOfJoin()!=null)
				date = formatter.parse(employeeBean.getDateOfJoin());
				////////////////System.out.println(date);
				c.setTime(date);
				int mon = c.get(Calendar.MONTH) + 1;
				String doj = c.get(Calendar.DATE) + "/" + mon + "/" + c.get(Calendar.YEAR);
				////////////////System.out.println(doj);

				if(employeeBean.getDob()!=null)
				date = formatter.parse(employeeBean.getDob());
				c.setTime(date);
				mon = c.get(Calendar.MONTH) + 1;
				String dob = c.get(Calendar.DATE) + "/" + mon + "/" + c.get(Calendar.YEAR);

				employeeBean.setDob(dob);
				employeeBean.setDateOfJoin(doj);

			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch (Exception e) {
			e.printStackTrace();
			result = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return employeeBean;
	}
	
	
/**
	 * 
	 * @author Vinay.M
	 * 
	 *         This method is used to call getSpecialisation method of web service
	 *         and return all the Specialisation Details List
	 * 
	 */
	public ArrayList<SpecialisationMaster> getSpecialisationDetailsList(String customerId, String emailId, String index){
		ArrayList<SpecialisationMaster> specialisationDetails = null;
		String result = null;
		try {
			SpecialisationMaster specialisationBean = new SpecialisationMaster();
			specialisationBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			specialisationBean.setStartIndex(index);
			// restful service connection
			RestfulServiceConnection restfulServiceConnectionObj=new RestfulServiceConnection();
			////////////////System.out.println("Request String specialization::::::" + gson.toJson(specialisationBean));
			
			String Url=AppProperties.getRESTFulCloudServiceURL("get_specialization");
			
			result = restfulServiceConnectionObj.getResponse(Url, gson.toJson(specialisationBean), "GET");
			// response from service
			////////////////System.out.println("Response String specialization::::::" + result);
			
			String responseCode = Response.getResponseCode(result);
	

			if (responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())) {
				String responseList = Response.getResponseList(result, "specialisationDetailsList");
				JSONArray jsonResponseArray = new JSONArray(responseList);
				specialisationDetails = new ArrayList<SpecialisationMaster>();
			
				for (int i = 0; i < jsonResponseArray.length(); i++) {
					specialisationBean = gson.fromJson(jsonResponseArray.getString(i), SpecialisationMaster.class);
			
					specialisationBean.setStartValue(index);
				
					specialisationDetails.add(specialisationBean);
				}
			}
		}  catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch (Exception e) {
			e.printStackTrace();
			result = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return specialisationDetails;
		
	}
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 * This method is used to call getLocations method of web service and return all the Location Details List
	 * 
	 * */
	public ArrayList<LocationBean> getLocationDetails(String locationId,String roleCode,String emailId,String index,String businessActivity,boolean search,boolean allLocations,boolean status){
		ArrayList<LocationBean> locationDetails = null;
		String result = null;
		List<String> roleLocations = null;
//		HttpServletRequest mock = null;
		try{
			LocationBean locationBean = new LocationBean();
			roleLocations =  new ArrayList<String>();
			locationBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			if(search)
				locationBean.setSearchCriteria(locationId);
			else
			locationBean.setLocationId(locationId);
			locationBean.setStartIndex(index);
			locationBean.setBusinessActivity(businessActivity);
			locationBean.setAllLocations(allLocations);
			locationBean.setStatus(status);
			locationBean.setZoneId("");
			locationBean.setGpsLatitude("");
			locationBean.setGpsLongitude("");
			locationBean.setDistance(0.0);
			locationBean.setGstnNo("");
			/*locationBean.setGeoCordinatesRequest(true);*/
			//System.out.println("Requesting"+gson.toJson(locationBean));
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_locations"), gson.toJson(locationBean),"POST");

			//UtilityMasterServiceProxy utitlitymaster = new UtilityMasterServiceProxy();
			//System.out.println("Request String::::::"+gson.toJson(locationBean));
			//result = utitlitymaster.getLocation(gson.toJson(locationBean));
			//System.out.println("Response String::::::getLocation response:;"+result);
			
			String responseCode = Response.getResponseCode(result);
			JSONObject jsonResult = new JSONObject(result);
			String totalRecords = jsonResult.getString("totalRecords");
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				String responseList = Response.getResponseList(result, "locationDetails");
				JSONArray jsonResponseArray = new JSONArray(responseList);
				locationDetails = new ArrayList<LocationBean>();
				 roleLocations =(List<String>)sessionScope.getRoleLocationsList();
				int slNo = Integer.parseInt(index);
				for (int i=0; i<jsonResponseArray.length(); i++) {
					locationBean = gson.fromJson(jsonResponseArray.getString(i), LocationBean.class);
					locationBean.setTotalRecords(totalRecords);
					locationBean.setStartValue(index);
					locationBean.setSlNo(++slNo);
					if(!roleCode.equalsIgnoreCase("1")){
						for(String loc : roleLocations){
							if(locationBean.getLocationId().equalsIgnoreCase(loc))
								locationDetails.add(locationBean);	
							}
					}
					else{
						locationDetails.add(locationBean);
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
		//////////////System.out.println("Response String::::::zone master response"+gson.toJson(locationDetails));
		return locationDetails;
	}
	
	
	
	public ArrayList<LocationBean> getLocationDetails(String locationId,String roleCode,String emailId,String index,String maxRecords,String businessActivity,boolean search,boolean allLocations,boolean status){
		ArrayList<LocationBean> locationDetails = null;
		String result = null;
		List<String> roleLocations = null;
//		HttpServletRequest mock = null;
		try{
			LocationBean locationBean = new LocationBean();
			roleLocations =  new ArrayList<String>();
			locationBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			if(search)
				locationBean.setSearchCriteria(locationId);
			else
			   locationBean.setLocationId(locationId);
			locationBean.setStartIndex(index);
			locationBean.setBusinessActivity(businessActivity);
			locationBean.setAllLocations(allLocations);
			locationBean.setStatus(status);
			locationBean.setMaxRecords(maxRecords);
			////////System.out.println("Request String::::::"+gson.toJson(locationBean));
			//result = utitlitymaster.getLocation(gson.toJson(locationBean));
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_locations"), gson.toJson(locationBean),"POST");
			////////System.out.println(result);
			String responseCode = Response.getResponseCode(result);
			JSONObject jsonResult = new JSONObject(result);
			String totalRecords = jsonResult.getString("totalRecords");
			////////////////System.out.println(totalRecords);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				String responseList = Response.getResponseList(result, "locationDetails");
				JSONArray jsonResponseArray = new JSONArray(responseList);
				locationDetails = new ArrayList<LocationBean>();
				 roleLocations =(List<String>)sessionScope.getRoleLocationsList();
				int slNo = Integer.parseInt(index);
				for (int i=0; i<jsonResponseArray.length(); i++) {
					locationBean = gson.fromJson(jsonResponseArray.getString(i), LocationBean.class);
					locationBean.setTotalRecords(totalRecords);
					locationBean.setStartValue(index);
					locationBean.setSlNo(++slNo);
					if(!roleCode.equalsIgnoreCase("1")){
						for(String loc : roleLocations){
							if(locationBean.getLocationId().equalsIgnoreCase(loc))
								locationDetails.add(locationBean);	
							}
					}
					else{
						locationDetails.add(locationBean);
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
		return locationDetails;
	}
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to call createLocation method of web service and return the response
	 *
	 *
	 **/
	public String createLocation(LocationBean locationBean,String customerId,String emailId){
		String result = null;
		try {
			locationBean.setLocationId(locationBean.getLocationId().trim());
			locationBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			if(locationBean.getMultipleUserDBStr().equalsIgnoreCase("false")){
				locationBean.setMultipleUsersAccessDB(false);
			}else{
				locationBean.setMultipleUsersAccessDB(true);
			}
			
			
			//result = utitlitymaster.createLocation(gson.toJson(locationBean));
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_Location"), gson.toJson(locationBean));
			String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					result = AppProperties.getAppMessageByProperty("LOCATION_CREATE_SUCCESS").trim();
				}
				else{
//					result = "Couldn't create, please try after some time";
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
	 *This method is used to call updateLocation method of web service and return the response
	 *
	 **/
	public String updateLocation(LocationBean locationBean,String customerId,String emailId){
		String result = null;
		try {
			locationBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		//	System.out.println("Requesting update::"+gson.toJson(locationBean));
			//result = utitlitymaster.updateLocation(gson.toJson(locationBean));
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_Location"), gson.toJson(locationBean));
			//System.out.println("Response update"+gson.toJson(locationBean));
			 String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					result = AppProperties.getAppMessageByProperty("LOCATION_UPDATE_SUCCESS").trim();
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
		return result;
	}
	
	public String deleteLocation(String customerId,String emailId,String ids) {
		String result = null;
		try {
			LocationBean locationBeanObj = new LocationBean();
			locationBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			String[] idsArray = ids.split(",");
			List<String> locationList = new ArrayList<String>();
			for(int i=0;i<idsArray.length;i++)
				locationList.add(idsArray[i]);
			locationBeanObj.setLocationList(locationList);
			//result = utitlitymaster.deleteLocation(gson.toJson(locationBeanObj));
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("delete_Location"), gson.toJson(locationBeanObj));
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("LOCATION_DELETE_SUCCESS").trim();
			else{
				locationBeanObj = gson.fromJson(result, LocationBean.class);
				result = locationBeanObj.getResponseHeader().getResponseMessage();
				/*for(String location : locationBeanObj.getNonDeletedItems())
					result = result  +" '" + location +"','";
				result = result.substring(0, result.length()-2);*/
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
	 *This method is used to call createTax method of web service and return the response
	 *
	 **/
	public String createTax(TaxBean taxBean,String customerId,String emailId){
		String result = null;
		try {
//			TaxBean taxBean = new TaxBean();
			
			taxBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			/*taxBean.setTaxName(taxName);
			taxBean.setTaxDescription(taxDescription);*/
			RestfulServiceConnection restful = new RestfulServiceConnection(); 
			result = restful.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_tax"), gson.toJson(taxBean));
			//utitlitymaster.createTax(gson.toJson(taxBean));
			////////////System.out.println(gson.fromJson(result,TaxBean.class));
			 String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					result = AppProperties.getAppMessageByProperty("TAX_CREATE_SUCCESS").trim();
				}
				else{
//					result = "Couldn't create, please try after some time";
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
	 * This method is used to call getTaxes method of web service and return all the Tax Details List
	 * 
	 * */
	public ArrayList<TaxBean> getTaxDetails(String taxName,String customerId,String emailId,String index,boolean search,String maxRecords){
		ArrayList<TaxBean> taxDetails = null;
		String result = null;
		try{
			TaxBean taxBean = new TaxBean();
			taxBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			if(search)
				taxBean.setSearchCriteria(taxName);
			else
				taxBean.setTaxName(taxName);
			taxBean.setSearchCriteria(taxName);
			taxBean.setStartIndex(index);
			taxBean.setMaxRecords(maxRecords);
			////////////System.out.println("Request::"+gson.toJson(taxBean));
			RestfulServiceConnection restful = new RestfulServiceConnection(); 
			result = restful.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Taxes"), gson.toJson(taxBean),"GET");
			//result = utitlitymaster.getTaxes(gson.toJson(taxBean));
			////////////System.out.println(result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				String responseList = Response.getResponseList(result, "taxDetails");
				JSONArray jsonResponseArray = new JSONArray(responseList);
				taxDetails = new ArrayList<TaxBean>();
				for (int i=0; i<jsonResponseArray.length(); i++) {
					taxBean = gson.fromJson(jsonResponseArray.getString(i), TaxBean.class);
					taxDetails.add(taxBean);
				}
				taxDetails.get(0).setTotalRecords(Response.getResponseTotalRecords(result));
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
		return taxDetails;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to call updateTaxDetails method of web service and return the response
	 *
	 **/
	public String updateTax(TaxBean taxBean,String customerId,String emailId){
		String result = null;
		try {
			taxBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
//			//////////////System.out.println(gson.toJson(taxBean));
			//result = utitlitymaster.updateTaxDetails(gson.toJson(taxBean));
			RestfulServiceConnection restful = new RestfulServiceConnection(); 
			result = restful.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_TaxDetails"), gson.toJson(taxBean));
			 String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					result = AppProperties.getAppMessageByProperty("TAX_UPDATE_SUCCESS").trim();
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
		return result;
	}
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to call deleteTaxDetails method of web service and return the response
	 *
	 **/
	public String deleteTax(String customerId,String emailId,String ids) {
		String result = null;
		try {
			TaxBean taxBean = new TaxBean();
			taxBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			String[] idsArray = ids.split(",");
			List<String> taxList = new ArrayList<String>();
			for(int i=0;i<idsArray.length;i++)
				taxList.add(idsArray[i]);
			taxBean.setTaxList(taxList);
			//result = utitlitymaster.deleteTaxDetails(gson.toJson(taxBean));
			RestfulServiceConnection restful = new RestfulServiceConnection(); 
			result = restful.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("delete_TaxDetails"), gson.toJson(taxBean));
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("TAX_DELETE_SUCCESS").trim();
			else{
				taxBean = gson.fromJson(result, TaxBean.class);
				result = AppProperties.getAppMessageByProperty("DELETE_LOCATION_FAILED").trim();
				for(String taxName : taxBean.getNonDeletedItems())
					result = result  +" '" + taxName +"','";
				result = result.substring(0, result.length()-2);
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
	 * Created On: 4-nov-2015
	 * 
	 * This method is used to call the getZones method of web service and return the ZonesMaster List
	 * 
	 */
	public List<ZoneMaster> getZones(String zoneID,String customerIdStr,String emailIdStr,String index,String maxRecords,String searchCriteria){
		String result = null;
		List<ZoneMaster> zoneMasterList = new ArrayList<ZoneMaster>();
		try {
			ZoneMaster zoneMasterObj = new ZoneMaster();
			zoneMasterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			zoneMasterObj.setStartIndex(index);
			if(zoneID != null && zoneID != "")
				zoneMasterObj.setZoneID(zoneID);
			zoneMasterObj.setMaxRecords(maxRecords);
			zoneMasterObj.setSearchCriteria(searchCriteria);
			// log.info("Request String::::::::::"+gson.toJson(zoneMasterObj));
			////////////////System.out.println("Request String::::::::::"+gson.toJson(zoneMasterObj));
//			modified by vijay
			result = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("get_zones"), gson.toJson(zoneMasterObj),"GET");

			// log.info("Response String Got:::::::::::"+result);
			
			////////////System.out.println("Response String Got:::::::::::"+result);
			
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				zoneMasterObj = gson.fromJson(result, ZoneMaster.class);
				if(zoneMasterObj.getZoneMasterList() != null){
					zoneMasterObj.getZoneMasterList().get(0).setTotalRecords(zoneMasterObj.getTotalRecords());
					zoneMasterList = zoneMasterObj.getZoneMasterList();
					if(zoneID != null && zoneID != ""){
						List<String> locationsList = new ArrayList<String>();
						List<String> roleLocations = (List<String>)sessionScope.getRoleLocationsList();
						for(int i=0;i<zoneMasterList.get(0).getZoneDetails().size();i++){
							for(String loc : roleLocations){
								if(zoneMasterList.get(0).getZoneDetails().get(i).getLocation().equalsIgnoreCase(loc))
									locationsList.add(zoneMasterList.get(0).getZoneDetails().get(i).getLocation()+"+"+zoneMasterList.get(0).getZoneDetails().get(i).getLocationType());
								}
							
						}
						zoneMasterList.get(0).setZones(locationsList);
					}else{
						int slNo = Integer.parseInt(index);
						for(ZoneMaster zoneMaster : zoneMasterList)
							zoneMaster.setSlNo(++slNo);
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
		return zoneMasterList;
	}
	
	
	
	
	public Set<String> getlocationsBasedOnZone(String zoneID,String customerIdStr,String emailIdStr,String index,String maxRecords,String searchCriteria){
		String result = null;
		List<ZoneMaster> zoneMasterList = new ArrayList<ZoneMaster>();
		Set<String> locationsList = new HashSet<String>();
		try {
			ZoneMaster zoneMasterObj = new ZoneMaster();
			zoneMasterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			zoneMasterObj.setStartIndex(index);
			if(zoneID != null && zoneID != ""){
			List<String> myList = new ArrayList<String>(Arrays.asList(zoneID.split(",")));
				zoneMasterObj.setZoneList(myList);
			}
			zoneMasterObj.setMaxRecords(maxRecords);
			zoneMasterObj.setSearchCriteria(searchCriteria);
			// log.info("Request String::::::::::"+gson.toJson(zoneMasterObj));
			//////////////System.out.println("ghjg Request String::::::::::"+gson.toJson(zoneMasterObj));
			//result = zoneMasterServiceProxyObj.getZones(gson.toJson(zoneMasterObj));
			result = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("get_zones"), gson.toJson(zoneMasterObj),"GET");

			// log.info("Response String Got:::::::::::"+result);
			
//			//////////////System.out.println("Response String Got:::::::::::"+result);
			
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				zoneMasterObj = gson.fromJson(result, ZoneMaster.class);
				zoneMasterList = zoneMasterObj.getZoneMasterList();
	
				if(zoneMasterObj.getZoneMasterList() != null && zoneMasterObj.getZoneMasterList().size()>0){
					for(ZoneMaster zone :zoneMasterObj.getZoneMasterList()){
						if(zone.getZoneDetails()!=null && zone.getZoneDetails().size()>0){
							for(ZoneDetails details : zone.getZoneDetails()){
//								if(details.getLocationType() == "Retail outlet")
								locationsList.add(details.getLocation());
							}
						}
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
		return locationsList;
	}
	
	public Set<String> getlocationsBasedOnZoneForAllLoc(String zoneID,String customerIdStr,String emailIdStr,String index,String maxRecords,String searchCriteria){
		String result = null;
		List<ZoneMaster> zoneMasterList = new ArrayList<ZoneMaster>();
		Set<String> locationsList = new HashSet<String>();
		try {
			ZoneMaster zoneMasterObj = new ZoneMaster();
			zoneMasterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			zoneMasterObj.setStartIndex(index);
			if(zoneID != null && zoneID != ""){
			List<String> myList = new ArrayList<String>(Arrays.asList(zoneID.split(",")));
				zoneMasterObj.setZoneList(myList);
			}
			zoneMasterObj.setMaxRecords(maxRecords);
			zoneMasterObj.setSearchCriteria(searchCriteria);
			// log.info("Request String::::::::::"+gson.toJson(zoneMasterObj));
//			//////////////System.out.println("Request String::::::::::"+gson.toJson(zoneMasterObj));
			//result = zoneMasterServiceProxyObj.getZones(gson.toJson(zoneMasterObj));
			result = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("get_zones"), gson.toJson(zoneMasterObj),"GET");

			// log.info("Response String Got:::::::::::"+result);
			
//			//////////////System.out.println("Response String Got:::::::::::"+result);
			
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				zoneMasterObj = gson.fromJson(result, ZoneMaster.class);
				zoneMasterList = zoneMasterObj.getZoneMasterList();
	
				if(zoneMasterObj.getZoneMasterList() != null && zoneMasterObj.getZoneMasterList().size()>0){
					for(ZoneMaster zone :zoneMasterObj.getZoneMasterList()){
						if(zone.getZoneDetails()!=null && zone.getZoneDetails().size()>0){
							for(ZoneDetails details : zone.getZoneDetails()){
								if(details.getLocationType() == "Retail outlet")
								locationsList.add(details.getLocation());
							}
						}
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
		return locationsList;
	}
	
	
	/**
	 * @author Mythri.S	
	 * 
	 * This method is used to call the createSupplier method of web service and return the response
	 * 
	 */
	public String createZone(ZoneMaster zoneMasterObj,String customerId,String emailId){
		String result = null;
		try {
			zoneMasterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			////////////System.out.println("Request String::::::::"+gson.toJson(zoneMasterObj));
			//result = zoneMasterServiceProxyObj.createZone(gson.toJson(zoneMasterObj));
			result = new RestfulServiceConnection().getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_Zone"), gson.toJson(zoneMasterObj));

			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("ZONE_CREATE_SUCCESS").trim();
			}
			else{
//				responseMessage = "Couldn't create, please try after some time";
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
	 * Created On: 17-aug-2015
	 *  
	 * This method accepts search string storeLocation and productCategory.
	 * It calls the searchProducts method of web service.
	 * It retrieves productList matching search string, productCategory and storeLocation.
	 * 
	 * 
	 */
	public List<ZoneMaster> searchZoneMaster(String customerIdStr,String emailIdStr,String searchNameStr,String index){
		String resultStr = null;
		RequestBean requestBeanObj = null;
		List<ZoneMaster> zoneList = null;
		try{
			requestBeanObj = new RequestBean();
			requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestBeanObj.setSearchCriteria(searchNameStr);
			requestBeanObj.setStartIndex(index);
			requestBeanObj.setMaxRecords("10");
			//resultStr = zoneMasterServiceProxyObj.getZones(gson.toJson(requestBeanObj));
			resultStr = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("get_zones"), gson.toJson(requestBeanObj),"GET");

			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				ZoneMaster zoneMasterObj = gson.fromJson(resultStr, ZoneMaster.class);
				if(zoneMasterObj.getZoneMasterList() != null){
					zoneMasterObj.getZoneMasterList().get(0).setTotalRecords(zoneMasterObj.getTotalRecords());
					zoneList = zoneMasterObj.getZoneMasterList();
					int slNo = Integer.parseInt(index);
					for(ZoneMaster zoneMaster : zoneList)
						zoneMaster.setSlNo(++slNo);
				}
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return zoneList;
		
	}
	
	/**
	 * @author Mythri.S	
	 * 
	 * This method is used to call the createSupplier method of web service and return the response
	 * 
	 */
	public String updateZone(ZoneMaster zoneMasterObj,String customerId,String emailId){
		String result = null;
		try {
			zoneMasterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		    ////////////////System.out.println("Request String::::::::"+gson.toJson(zoneMasterObj));
			//result = zoneMasterServiceProxyObj.updateZone(gson.toJson(zoneMasterObj));
			result = new RestfulServiceConnection().getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_Zone"), gson.toJson(zoneMasterObj));

			////////////////System.out.println("Response String:::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("ZONE_UPDATE_SUCCESS").trim();
			}
			else{
//				responseMessage = "Couldn't create, please try after some time";
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
	 * This method is used to call the deleteProductSubCategory method of web service and return the response
	 * 
	 */
	public String deleteZone(String customerIdStr,String emailIdStr,String ids){
		String result = null;
		try {
			ZoneMaster zoneMasterObj = new ZoneMaster();
			zoneMasterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			String[] idsArray = ids.split(",");
		/*	List<String> zones = new ArrayList<String>();
			for(int i=0;i<idsArray.length;i++)
				zones.add(idsArray[i]);
			zoneMasterObj.setZones(zones);*/
			zoneMasterObj.setZoneIDS(idsArray);
			////////////////System.out.println("Request String:::::::"+gson.toJson(zoneMasterObj));
			result = new RestfulServiceConnection().getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("delete_Zone"), gson.toJson(zoneMasterObj));
			zoneMasterObj = gson.fromJson(result, ZoneMaster.class);
		//	result = zoneMasterServiceProxyObj.deleteZone(gson.toJson(zoneMasterObj));
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("ZONE_DELETE_SUCCESS").trim();
			}else /*if(responseCode.equals(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_FAILED_CODE").trim())))*/{
				result = zoneMasterObj.getResponseHeader().getResponseMessage();
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
	 *This method is used to call createBrand method of web service and return the response
	 *
	 **/
	public String createNewBrand(BrandMaster brandMasterObj,String customerIdStr,String emailIdStr){
		String result = null;
		try {
			//BrandMasterServiceProxy masterServiceProxy = new BrandMasterServiceProxy();
			brandMasterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			////////System.out.println("create brand Request String::::::::::::"+gson.toJson(brandMasterObj));
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_Brand"), gson.toJson(brandMasterObj));
			//result = masterServiceProxy.createBrand(gson.toJson(brandMasterObj));
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("BRAND_CREATE_SUCCESS").trim();
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
	 *This method is used to get Brand Details
	 *
	 **/
	
	public List<BrandMaster> getBrandDetails(String bNameStr,String customerIdStr,String emailIdStr,String index,boolean search){
		String result = null;
		BrandMaster master=new BrandMaster();
		try{
			
			master.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			if(search)
				master.setSearchCriteria(bNameStr);
			else
				master.setbName(bNameStr);
			master.setStartIndex(index);
			////////System.out.println("get brands request string"+gson.toJson(master));
			
			/*BrandMasterServiceProxy brandMasterServiceProxyObj = new BrandMasterServiceProxy();
			// log.info("Request::"+gson.toJson(master));
			////////////////System.out.println("Request::"+gson.toJson(master));
			result = brandMasterServiceProxyObj.getBrand(gson.toJson(master));
			// log.info(result);*/
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Brands"), gson.toJson(master),"GET");

			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				master = gson.fromJson(result, BrandMaster.class);
				if(master.getBrandDetails() != null && master.getBrandDetails().size() > 0){
					master.getBrandDetails().get(0).setTotalRecords(Response.getResponseTotalRecords(result));
					int slNo = Integer.parseInt(index);
					for(BrandMaster brandMaster : master.getBrandDetails())
						brandMaster.setSlNo(++slNo);
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
		return master.getBrandDetails();
	}
	
	
	public List<BrandMaster> getBrandDetails(String bNameStr,String customerIdStr,String emailIdStr,String index,String maxRecords,boolean search){
		String result = null;
		BrandMaster master=new BrandMaster();
		try{
			master.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			if(search)
				master.setSearchCriteria(bNameStr);
			else
				master.setbName(bNameStr);
			master.setStartIndex(index);
			master.setMaxRecords(maxRecords);
			
			////////System.out.println("get brands request string"+gson.toJson(master));
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Brands"), gson.toJson(master),"GET");
			//////////////System.out.println("Brand master response::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				master = gson.fromJson(result, BrandMaster.class);
				if(master.getBrandDetails() != null && master.getBrandDetails().size() > 0){
					master.getBrandDetails().get(0).setTotalRecords(Response.getResponseTotalRecords(result));
					int slNo = Integer.parseInt(index);
					for(BrandMaster brandMaster : master.getBrandDetails())
						brandMaster.setSlNo(++slNo);
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
		return master.getBrandDetails();
	}
	
	
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to call deleteBrand method of web service and return the response
	 *
	 **/
	public String deleteBrand(String customerIdStr,String emailIdStr,String ids) {
		String result = null;
		try {
			BrandMaster master = new BrandMaster();
			//BrandMasterServiceProxy brandMasterServiceProxyObj = new BrandMasterServiceProxy();
			master.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			String[] bnames = ids.split(",");
			List<String> brandDetails = new ArrayList<String>();
			for(int i=0;i<bnames.length;i++)
				brandDetails.add(bnames[i]);
			master.setbNames(brandDetails);
			//result = brandMasterServiceProxyObj.deleteBrand(gson.toJson(master));
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("delete_Brand"), gson.toJson(master));
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("BRAND_DELETE_SUCCESS").trim();
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
	
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to call updateBrand method of web service and return the response
	 *
	 **/
	public String updateBrand(BrandMaster master,String customerId,String emailId){
		String result = null;
		try {
			//BrandMasterServiceProxy brandMasterServiceProxyObj = new BrandMasterServiceProxy();
			master.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			////////System.out.println("update Request string"+gson.toJson(master));
			//result = brandMasterServiceProxyObj.updateBrand(gson.toJson(master));
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_Brand"), gson.toJson(master));
			 String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					result = AppProperties.getAppMessageByProperty("BRAND_UPDATE_SUCCESS").trim();
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
		////////////////System.out.println(result);
		return result;
	}
	
	
	
	
	
	public String createRouteMaster(String customerIdStr, String emailIdStr,RouteMaster routeMaster) {
		String resultStr = null;
		try {
			
			routeMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			if(routeMaster.getRouteStatusStr().equals("1")){
				routeMaster.setRouteStatus(true);
			}else{
				routeMaster.setRouteStatus(false);
			}
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_RouteMaster"), gson.toJson(routeMaster));
			////////////System.out.println("Request String::::::::::::"+gson.toJson(routeMaster));
			////////////System.out.println("Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("ROUTE_MASTER_SUCCESSFULLY").trim();
			}
			else{
				//result = "Couldn't create, please try after some time";
				resultStr = Response.getResponseMessage(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
	}
	
	public List<RetailServiceArea> getServiceAreaDetails(String areaCode,String customerIdStr,String emailIdStr,int index,int maxRecords,String searchCriteria,String startDate,String endDate,boolean location){
		String result = null;
		List<RetailServiceArea> serviceAreaList = new ArrayList<RetailServiceArea>();
		RetailServiceArea serviceAreaObj =null;
		try {
			 serviceAreaObj = new RetailServiceArea();
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			serviceAreaObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			serviceAreaObj.setStartIndex(index);
			serviceAreaObj.setMaxRecords(maxRecords);
//			serviceAreaObj
			if(areaCode!="")
			serviceAreaObj.setArea_code(areaCode);
			else{
			serviceAreaObj.setStartDateStr(startDate);
			serviceAreaObj.setEndDateStr(endDate);
			serviceAreaObj.setStatus(location);
			serviceAreaObj.setSearchCritaria(searchCriteria);
			}
//			serviceAreaObj.setStatus(null);
			////////////System.out.println("Request String::::::::::"+gson.toJson(serviceAreaObj));
			result = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_ServiceArea"), gson.toJson(serviceAreaObj),"GET");
			
			////////////System.out.println("Response String Got:::::::::::service area"+result);
			
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			serviceAreaObj = gson.fromJson(result, RetailServiceArea.class);
			serviceAreaList = serviceAreaObj.getRetailServiceAreaDetails();
			if(serviceAreaObj.getRetailServiceAreaDetails() != null){
				serviceAreaObj.getRetailServiceAreaDetails().get(0).setTotalRecords(serviceAreaObj.getTotalRecords());
//			serviceAreaObj.getRetailServiceAreaDetails();
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
		return serviceAreaList;
	}
	
	
	
	public String createServiceAreaMaster(String customerIdStr, String emailIdStr,String roleStr,RetailServiceArea routeMaster) {
		String resultStr = null;
		try {
			
//			routeMaster.setRole_name(roleStr);
			routeMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			////////////System.out.println("Request String:::::::::::: service area"+gson.toJson(routeMaster));
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_RetailServiceArea"), gson.toJson(routeMaster));
			
//			//////////////System.out.println("Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("SERVICE_AREA_CREATED_SUCCESSFULLY").trim();
			}
			else{
				//result = "Couldn't create, please try after some time";
				resultStr = Response.getResponseMessage(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
	}
	
	
	
	public String updateServiceAreaMaster(String customerIdStr, String emailIdStr,RetailServiceArea routeMaster) {
		String resultStr = null;
		try {
			
			routeMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_RetailServiceArea"), gson.toJson(routeMaster));
			//System.out.println("updsate Request String::::::::::::"+gson.toJson(routeMaster));
			//System.out.println("Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("SERVICE_AREA_UPDATED_SUCCESSFULLY").trim();
			}
			else{
				//result = "Couldn't create, please try after some time";
				resultStr = Response.getResponseMessage(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
	}
	
	
	public String deleteServiceAreaMaster(String customerIdStr,String emailIdStr,String ids){
		String result = null;
		try {
			RetailServiceArea routeMaster = new RetailServiceArea();
			routeMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			String[] idsArray = ids.split(",");
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
//			List<String> routeIds = new ArrayList<String>();
			for(int i=0;i<idsArray.length;i++)
				routeMaster.setArea_codes(idsArray);
//				routeIds.add(idsArray[i]);
//			routeMaster.setRouteIds(routeIds);
			
//			//////////////System.out.println("Request String:::::::"+gson.toJson(routeMaster));
			result = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("delete_RetailServiceArea"), gson.toJson(routeMaster));
//			//////////////System.out.println("Response String:::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("SERVICE_AREA_DELETED_SUCCESSFULLY").trim();
			else if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_FAILED_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("DELETE_FAILED").trim();
		}catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		
		} catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	
	public String updateRouteMaster(String customerIdStr, String emailIdStr,RouteMaster routeMaster) {
		String resultStr = null;
		try {
			
			routeMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			if(routeMaster.getRouteStatusStr().equals("1")){
				routeMaster.setRouteStatus(true);
			}else{
				routeMaster.setRouteStatus(false);
			}
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_RouteMaster"), gson.toJson(routeMaster));
//			//////////////System.out.println("Request String::::::::::::"+gson.toJson(routeMaster));
//			//////////////System.out.println("Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("ROUTE_MASTER_UPDATED_SUCCESSFULLY").trim();
			}
			else{
				//result = "Couldn't create, please try after some time";
				resultStr = Response.getResponseMessage(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
	}
	
	
	public String deleteRouteMaster(String customerIdStr,String emailIdStr,String ids){
		String result = null;
		try {
			RouteMaster routeMaster = new RouteMaster();
			routeMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			String[] idsArray = ids.split(",");
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			List<String> routeIds = new ArrayList<String>();
			for(int i=0;i<idsArray.length;i++)
				routeIds.add(idsArray[i]);
			routeMaster.setRouteIds(routeIds);
			////////////////System.out.println("Request String:::::::"+gson.toJson(routeMaster));
			result = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("delete_RouteMaster"), gson.toJson(routeMaster));
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("ROUTE_MASTER_DELETED_SUCCESSFULLY").trim();
			else if(responseCode.equals(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_FAILED_CODE").trim())))
				result = AppProperties.getAppMessageByProperty("DELETE_FAILED").trim();
		}catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		
		} catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	
	public List<RouteMaster> getRouteMasters(String customerIdStr,String emailIdStr,int index,int maxRecords,String searchName,boolean search,String routeId,String location,String startDate,String endDate,String zone){
		String resultStr = null;
		RouteMaster routeMaster = new RouteMaster();
//		List<RouteMaster> routeMasterObj =new ArrayList<RouteMaster>();
		try{
			routeMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			routeMaster.setStartIndex(index);
			if(search)
				routeMaster.setRouteId(routeId);
			else{
			routeMaster.setStartDateStr(startDate);
			routeMaster.setEndDateStr(endDate);
			routeMaster.setZone(zone);
			routeMaster.setSearchCriteria(searchName);
			routeMaster.setPickupPoint(location);
			routeMaster.setMaxRecords(maxRecords);
			}
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
		    ////////////System.out.println("Request String::::::::::::"+gson.toJson(routeMaster));
			resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_RouteMasters"), gson.toJson(routeMaster),"GET");
			////////////System.out.println("Response routeList String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				routeMaster = gson.fromJson(resultStr, RouteMaster.class);
				if(routeMaster.getRouteMasterList().size()>0 && routeMaster.getRouteMasterList()!=null)
				routeMaster.getRouteMasterList().get(0).setTotalRecords(routeMaster.getTotalRecords());
				routeMaster.getRouteMasterList().get(0).getRouteList().clear();
				routeMaster.getRouteMasterList().get(0).getRouteList().addAll(routeMaster.getRouteList());
				// routeMasterObj.add(routeMaster.getRouteMasterList());
			}
		
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		
		} catch(Exception e){
			e.printStackTrace();
		}
		return routeMaster.getRouteMasterList();
	}
	
	
	
	
	
	
	
	
	public List<AssetMaster> getAssetDetails(String assetNameStr,String customerIdStr,String emailIdStr,String index,String maxRecords,boolean search){
		String resultStr = null;
		AssetMaster masterObj=new AssetMaster();
		Assement assementObj=new Assement();
		try{
			
			masterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			if(search)
				masterObj.setSearchCriteria(assetNameStr);
			else
				masterObj.setAssetName(assetNameStr);
			masterObj.setStartIndex(index);
			masterObj.setMaxRecords(maxRecords);
			
			/*AssetMasterServiceProxy assetMasterServiceProxyObj = new AssetMasterServiceProxy();
			// log.info("Request::"+gson.toJson(masterObj));
			////////////////System.out.println("Request::"+gson.toJson(masterObj));
			resultStr = assetMasterServiceProxyObj.getAssets(gson.toJson(masterObj));
			// log.info(resultStr);*/
			
			/**	added by - vasudev   purpose - using rest service call instead of soap call*/
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_asset"), gson.toJson(masterObj),"GET");

			
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				assementObj = gson.fromJson(resultStr, Assement.class);
				int slNo = Integer.parseInt(index);
				if(assementObj.getAssetMaster() != null && assementObj.getAssetMaster().size() > 0){
					assementObj.getAssetMaster().get(0).setTotalRecords(Response.getResponseTotalRecords(resultStr));
					for(AssetMaster assetMaster : assementObj.getAssetMaster())
						assetMaster.setSlNo(++slNo);
				}
					
			}
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
		
		return assementObj.getAssetMaster();
	}
	
	
/*	*//**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to get Asset Details
	 *
	 **//*
	
	public List<AssetMaster> getAssetDetails(String assetNameStr,String customerIdStr,String emailIdStr,String index,boolean search){
		String resultStr = null;
		AssetMaster masterObj=new AssetMaster();
		Assement assementObj=new Assement();
		try{
			
			masterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			if(search)
				masterObj.setSearchCriteria(assetNameStr);
			else
				masterObj.setAssetName(assetNameStr);
			masterObj.setStartIndex(index);
			AssetMasterServiceProxy assetMasterServiceProxyObj = new AssetMasterServiceProxy();
			// log.info("Request::"+gson.toJson(masterObj));
			resultStr = assetMasterServiceProxyObj.getAssets(gson.toJson(masterObj));
			// log.info(resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				assementObj = gson.fromJson(resultStr, Assement.class);
				int slNo = Integer.parseInt(index);
				if(assementObj.getAssetMaster() != null && assementObj.getAssetMaster().size() > 0){
					assementObj.getAssetMaster().get(0).setTotalRecords(Response.getResponseTotalRecords(resultStr));
					for(AssetMaster assetMaster : assementObj.getAssetMaster())
						assetMaster.setSlNo(++slNo);
				}
					
			}
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
		
		return assementObj.getAssetMaster();
	}*/
	
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to call createAsset method of web service and return the response
	 *
	 **/
	public String createNewAsset(AssetMaster assetMasterObj,String customerIdStr,String emailIdStr){
		String result = null;
		try {
			//AssetMasterServiceProxy masterServiceProxy = new AssetMasterServiceProxy();
			assetMasterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			/*// log.info("Request String::::::::::::"+gson.toJson(assetMasterObj));
			////////////////System.out.println("Request String::::::::::::"+gson.toJson(assetMasterObj));
			result = masterServiceProxy.createAsset(gson.toJson(assetMasterObj));
			// log.info("Response String:::::::::::"+result);*/
			
			/**	added by - vasudev   purpose - using rest service call instead of soap call*/		
			RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
			result =restFulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_asset"), gson.toJson(assetMasterObj));

			
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("ASSET_CREATE_SUCCESS").trim();
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
	 *This method is used to call updateAsset method of web service and return the response
	 *
	 **/
	public String updateAsset(AssetMaster masterObj,String customerId,String emailId){
		String result = null;
		try {
			 
			masterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//AssetMasterServiceProxy assetMasterServiceProxyObj = new AssetMasterServiceProxy();
			//master.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
		/*	// log.info(gson.toJson(masterObj));
			result = assetMasterServiceProxyObj.updateAsset(gson.toJson(masterObj));
			// log.info(result);*/
			
			/**	added by - vasudev   purpose - using rest service call instead of soap call*/
			RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
			result =restFulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_asset"), gson.toJson(masterObj));

			
			 String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					result = AppProperties.getAppMessageByProperty("ASSET_UPDATE_SUCCESS").trim();
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
		return result;
	}
	
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to call deleteAsset method of web service and return the response
	 *
	 **/
	public String deleteAsset(String customerIdStr,String emailIdStr,String idsStr) {
		String result = null;
		try {
			AssetMaster masterObj = new AssetMaster();
			//AssetMasterServiceProxy assetMasterServiceProxyObj = new AssetMasterServiceProxy();
			masterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			String[] assetNamesStr = idsStr.split(",");
			List<String> assetMasterList = new ArrayList<String>();
			for(int i=0;i<assetNamesStr.length;i++)
			assetMasterList.add(assetNamesStr[i]);
			masterObj.setAssetNames(assetMasterList);
			
			
			/*result = assetMasterServiceProxyObj.deleteAsset(gson.toJson(masterObj));
			// log.info(result);*/
			
			/**	added by - vasudev   purpose - using rest service call instead of soap call*/
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			result = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("delete_asset"), gson.toJson(masterObj),"POST");

			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("ASSET_DELETE_SUCCESS").trim();
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
	/**
	 * 
	 * @author RaviTeja.N
	 * 
	 *This method is used to call getDenominationMaster method of web service and return the response as total records
	 *
	 **/
	public DenominationMasterResponse getDenominationMaster(String searchNameStr,String customerIdStr,String emailIdStr,String index){
		String resultStr = null;
		DenominationMaster denominationMaster = new DenominationMaster();
		DenominationMasterResponse denominationMasterResponseObj = new DenominationMasterResponse(); 
		
		try{
			
			denominationMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			denominationMaster.setStartIndex(index);
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_denomination_master"), gson.toJson(denominationMaster),"GET");
//			//////////////System.out.println("Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				denominationMasterResponseObj = gson.fromJson(resultStr, DenominationMasterResponse.class);
			
			}
		
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		
		} catch(Exception e){
			e.printStackTrace();
		}
		return denominationMasterResponseObj;
	}
	
	/**
	 * 
	 * @author RaviTeja.N
	 * 
	 *This method is used to call createDenominationMaster method of web service and return the response
	 *
	 **/
	public String createDenominationMaster(String customerIdStr, String emailIdStr,String roleIdStr,DenominationMaster denominationMaster) {
		String resultStr = null;
		try {
			
			denominationMaster.setUserName(emailIdStr);
			denominationMaster.setRoleName(roleIdStr);
			denominationMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_denomination_master"), gson.toJson(denominationMaster));
			////////////////System.out.println("Request String::::::::::::"+gson.toJson(denominationMaster));
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("DENOMINATION_CREATE_SUCCESS").trim();
			}
			else{
				//result = "Couldn't create, please try after some time";
				resultStr = Response.getResponseMessage(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
	}
	
	/**
	 * 
	 * @author RaviTeja.N
	 * 
	 *This method is used to call deleteDenomination method of web service and return the response
	 *
	 **/
	public String deleteDenomination(String customerIdStr,String emailIdStr,String idsStr) {
		String result = null;
		try {
			DenominationMaster denominationMaster = new DenominationMaster();
			
			denominationMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			String[] denominationNamesStr = idsStr.split(",");
			List<String> denominationMasterList = new ArrayList<String>();
			for(int i=0;i<denominationNamesStr.length;i++)
				denominationMasterList.add((denominationNamesStr[i]));
			denominationMaster.setDenomNamesList(denominationMasterList);
			//////System.out.println(gson.toJson(denominationMaster));
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			result = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("delete_denomination_master"), gson.toJson(denominationMaster));
			String responseCode = Response.getResponseCode(result);
			
			
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("ASSET_DELETE_SUCCESS").trim();
			else if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_FAILED_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("DELETE_FAILED").trim();
		}
		 catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	


	
	/**
	 * 
	 * @author RaviTeja.N
	 * 
	 *This method is used to call deleteAsset method of web service and return the response
	 *
	 **/
	public DenominationMasterResponse viewEditDenomination(String customerIdStr,String emailIdStr,String denominationName,String index){
		String resultStr = null;
		DenominationMaster denominationMaster = new DenominationMaster();
		DenominationMasterResponse denominationMasterResponseObj = new DenominationMasterResponse(); 
		
		try{
			
			denominationMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			denominationMaster.setDenominationName(denominationName);
			denominationMaster.setStartIndex(index);
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			// log.info("Request String::::::::::::"+gson.toJson(denominationMaster));
			resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_denomination_master"), gson.toJson(denominationMaster),"GET");
			// log.info("Response String:::::::::::"+resultStr);
			
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				denominationMasterResponseObj = gson.fromJson(resultStr, DenominationMasterResponse.class);
			
			}
		
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		
		} catch(Exception e){
			e.printStackTrace();
		}
		return denominationMasterResponseObj;
	}
	/**
	 * 
	 * @author RaviTeja.N
	 * 
	 *This method is used to call deleteAsset method of web service and return the response
	 *
	 **/
	public DenominationMasterResponse viewEditDenomination(String customerIdStr,String emailIdStr,Float denominationValue,String index,String denominationType){
		String resultStr = null;
		DenominationMaster denominationMaster = new DenominationMaster();
		DenominationMaster denomination = new DenominationMaster();
		DenominationMasterResponse denominationMasterResponseObj = new DenominationMasterResponse(); 
		
		try{
			
			denominationMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			denomination.setDenominationType(denominationType);
			denomination.setDenominationValue(denominationValue);
			denominationMaster.setDenominations(denomination);
			denominationMaster.setStartIndex(index);
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			// log.info("Request String::::::::::::"+gson.toJson(denominationMaster));
			resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_denomination_master"), gson.toJson(denominationMaster),"GET");
			// log.info("Response String:::::::::::"+resultStr);
			
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				denominationMasterResponseObj = gson.fromJson(resultStr, DenominationMasterResponse.class);
			
			}
		
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		
		} catch(Exception e){
			e.printStackTrace();
		}
		return denominationMasterResponseObj;
	}



	/**
	 * 
	 * @author RaviTeja.N
	 * 
	 *This method is used to call editDenominationMaster method of web service and return the response
	 *
	 **/
	public String editDenominationMaster(String customerIdStr, String emailIdStr,String roleIdStr,DenominationMaster denominationMaster) {
		String resultStr = null;
		try {
			
			denominationMaster.setUserName(emailIdStr);
			denominationMaster.setRoleName(roleIdStr);
			denominationMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			////////////System.out.println("Request String::::::::::::"+gson.toJson(denominationMaster));
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("edit_denomination_master"), gson.toJson(denominationMaster));
		  ////////////System.out.println("Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("DENOMINATION_EDIT_SUCCESS").trim();
			}
			else{
				//result = "Couldn't create, please try after some time";
				resultStr = Response.getResponseMessage(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
	}
	
	/**
	 * 
	 * @author Vijay
	 * 
	 * This method is used to call getCurrency method of web service and return all the Currency Details List
	 * 
	 * */
	public ArrayList<String> getCurrencyCodes(){
		ArrayList<String> currencyDetails = null;
		String result = null;
		try{
			CurrencyBean currencyBean = new CurrencyBean();
			//UtilityMasterServiceProxy utitlitymaster = new UtilityMasterServiceProxy();
			currencyBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));

			currencyBean.setStartIndex("0");
			
			
			/*result = utitlitymaster.getCurrency(gson.toJson(currencyBean));
			// log.info(result);
			////////////////System.out.println(result);
*/			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			result = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Currency"), gson.toJson(currencyBean),"GET");

			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				String responseList = Response.getResponseList(result, "currencyDetails");
				JSONArray jsonResponseArray = new JSONArray(responseList);
				currencyDetails = new ArrayList<String>();
				for (int i=0; i<jsonResponseArray.length(); i++) {
					currencyBean = gson.fromJson(jsonResponseArray.getString(i), CurrencyBean.class);
					currencyDetails.add(currencyBean.getCurrencyCode());
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
		return currencyDetails;
	}
	

	public  ArrayList<LocationBean> getLocationsOnZoneAndBussinessActivity(String zone, String customerIdStr,String emailIdStr, String bussinessActivity)
	{
		ArrayList<LocationBean> locationDetails = new ArrayList<LocationBean>();
		if(zone == null || zone.equals(""))
			locationDetails = getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			else
			{
				List<ZoneMaster> zoneList = getZonalLocationBasedonZone(zone, customerIdStr, emailIdStr, "0","","","Retail Outlet");
				LocationBean saleLocation = null;
				/*if(zoneList != null && zoneList.get(0).getZoneDetails() != null && zoneList.get(0).getZoneDetails().size()>0)
					for(ZoneDetails zoneItems : zoneList.get(0).getZoneDetails() )
					{
						saleLocation = new LocationBean(); 
						saleLocation.setLocationId(zoneItems.getLocation());
						locationBeansList.add(saleLocation);
					}
				else*/
				for(String zoneItems : zoneList.get(0).getZones() )
				{
					String zoneArray[] = zoneItems.split("\\+");
					saleLocation = new LocationBean(); 
					if(zoneArray != null && zoneArray.length>0)
					{
						saleLocation.setLocationId(zoneArray[0]);
						if(zoneArray.length > 1)
						saleLocation.setBusinessActivity(zoneArray[1]);
						if(zoneArray.length > 2)
						saleLocation.setDescription(zoneArray[2]);
						locationDetails.add(saleLocation);
					} 
				}
			
			}
		return locationDetails;
	}
	

	public String createOrganizationMaster(String customerIdStr, String emailIdStr,List<String> location,String organization,
			String incorporationName,String discription,String gstin,String webSite,String phoneNumber,String email,
			String incorporationType,String address,String status,String panNo,String bankAccNo,String streetName,String city,
			String Area,String pinCode,String businessType) {
		String resultStr = null;
		try {
			List<OrganizationLocations> locations=new ArrayList<OrganizationLocations>();
			for(String loc : location)
			{
				OrganizationLocations loca=new OrganizationLocations();
				loca.setLocationId(loc);
				locations.add(loca);
			}
			OrganizationMaster OrgMasterMaster = new OrganizationMaster();
			OrgMasterMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			OrgMasterMaster.setAddress(address);
			OrgMasterMaster.setBuildingNo(address);
			OrgMasterMaster.setDescription(discription);
			OrgMasterMaster.setEmailId(email);
			OrgMasterMaster.setMobileNo(phoneNumber);
			OrgMasterMaster.setOrganizationId(organization);
			OrgMasterMaster.setGstn(gstin);
			OrgMasterMaster.setIncorporationName(incorporationName);
			OrgMasterMaster.setIncorporationType(incorporationType);
			OrgMasterMaster.setWebsite(webSite);
			OrgMasterMaster.setOrganizationStatus(status);
			OrgMasterMaster.setOrganizationLocations(locations);
			OrgMasterMaster.setPanNo(panNo);
			OrgMasterMaster.setDefaultBankAccount(bankAccNo);
			
			OrgMasterMaster.setArea(Area);
			OrgMasterMaster.setCity(city);
			OrgMasterMaster.setPincode(pinCode);
			OrgMasterMaster.setStreet(streetName);
			OrgMasterMaster.setBusinessType(businessType);
			
			
			
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			////System.out.println("Request String::::::::::::"+gson.toJson(OrgMasterMaster));
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_organization_master"), gson.toJson(OrgMasterMaster));
			////System.out.println("Response String:::::::::::"+resultStr);
			////////////System.out.println("Response String:::::::::::response create orgmaster"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("ORG_MASTER_SUCCESSFULLY").trim();
				// log.info(resultStr);
			}
			else{
				//result = "Couldn't create, please try after some time";
				resultStr = Response.getResponseMessage(resultStr);
				// log.info(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
	}
	
	
	
	public String createAssetMaster(String customerId,String emailId,String OrganizationId,String accountId,String accountName,String discription,String accountType,String Status) {
		String resultStr = null;
		try {
			
			AccountTypeMaster OrgMasterMaster = new AccountTypeMaster();
			OrgMasterMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			OrgMasterMaster.setAccountDescription(discription);
			OrgMasterMaster.setAccountId(accountId);
			OrgMasterMaster.setAccountName(accountName);
			OrgMasterMaster.setAccountType(accountType);
			//OrgMasterMaster.setStatus(Status);
			OrgMasterMaster.setAccountTypeStatus(Status);
			OrgMasterMaster.setOrganizationId(OrganizationId);
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			////////System.out.println("Request String::::::::::::"+gson.toJson(OrgMasterMaster));
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_account_master"), gson.toJson(OrgMasterMaster));
			////////System.out.println("Response String:::::::::::"+resultStr);
			////////////System.out.println("Response String:::::::::::response create Account"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("ACCOUNT_MASTER_SUCCESSFULLY").trim();
				// log.info(resultStr);
			}
			else{
				//result = "Couldn't create, please try after some time";
				resultStr = Response.getResponseMessage(resultStr);
				// log.info(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
	}
	
	
	
	public String editAssetMaster(String customerId,String emailId,String accountId,String accountName,String discription,String accountType,String Status,String OrganizationId) {
		String resultStr = null;
		try {
			
			AccountTypeMaster OrgMasterMaster = new AccountTypeMaster();
			OrgMasterMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			OrgMasterMaster.setAccountDescription(discription);
			OrgMasterMaster.setAccountId(accountId);
			OrgMasterMaster.setAccountName(accountName);
			OrgMasterMaster.setAccountType(accountType);
			OrgMasterMaster.setAccountTypeStatus(Status);
			OrgMasterMaster.setOrganizationId(OrganizationId);
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_account_master"), gson.toJson(OrgMasterMaster));
			// log.info("Response String:::::::::::"+resultStr);
			////////////System.out.println("Request String::::::::::::"+gson.toJson(OrgMasterMaster));
			////////////System.out.println("Response String:::::::::::response create Account"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("ACCOUNT_UPDATE_SUCCESSFULLY").trim();
				// log.info(resultStr);
			}
			else{
				//result = "Couldn't create, please try after some time";
				resultStr = Response.getResponseMessage(resultStr);
				// log.info(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
	}
	
	
	public String editOrganizationMaster(String customerIdStr, String emailIdStr,List<String> location,String organization,
			String incorporationName,String discription,String gstin,String webSite,String phoneNumber,String email,
			String incorporationType,String address,String status,String panNo,String bankAccNo,String streetName,String city,
			String Area,String pinCode,String businessType) {
		String resultStr = null;
		try {
			List<OrganizationLocations> locations=new ArrayList<OrganizationLocations>();
			for(String loc : location)
			{
				OrganizationLocations loca=new OrganizationLocations();
				loca.setLocationId(loc);
				locations.add(loca);
			}
			OrganizationMaster OrgMasterMaster = new OrganizationMaster();
			OrgMasterMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			OrgMasterMaster.setBuildingNo(address);
			OrgMasterMaster.setDescription(discription);
			OrgMasterMaster.setEmailId(email);
			OrgMasterMaster.setMobileNo(phoneNumber);
			OrgMasterMaster.setOrganizationId(organization);
			OrgMasterMaster.setGstn(gstin);
			OrgMasterMaster.setIncorporationName(incorporationName);
			OrgMasterMaster.setIncorporationType(incorporationType);
			OrgMasterMaster.setWebsite(webSite);
			OrgMasterMaster.setOrganizationLocations(locations);
			OrgMasterMaster.setOrganizationStatus(status);
			OrgMasterMaster.setPanNo(panNo);
			OrgMasterMaster.setDefaultBankAccount(bankAccNo);
			OrgMasterMaster.setArea(Area);
			OrgMasterMaster.setCity(city);
			OrgMasterMaster.setPincode(pinCode);
			OrgMasterMaster.setStreet(streetName);
			OrgMasterMaster.setBusinessType(businessType);
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("edit_organization_master"), gson.toJson(OrgMasterMaster));
			// log.info("Response String:::::::::::"+resultStr);
			////////////System.out.println("Request String::::::::::::"+gson.toJson(OrgMasterMaster));
			////////////System.out.println("Response String:::::::::::response create orgmaster"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("ORGUP_MASTER_SUCCESSFULLY").trim();
				// log.info(resultStr);
			}
			else{
				//result = "Couldn't create, please try after some time";
				resultStr = Response.getResponseMessage(resultStr);
				// log.info(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
	}
	
	
	public List<OrganizationMaster> getOrganizationMaster(String customerIdStr, String emailIdStr ,String OrganizationId) {
		String resultStr = null;
		OrganizationMaster OrgMasterMaster=null;
		try {

			OrgMasterMaster = new OrganizationMaster();
			OrgMasterMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			OrgMasterMaster.setMaxRecords(100);
			OrgMasterMaster.setStartIndex(-1);
			OrgMasterMaster.setOrganizationId(OrganizationId);
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("get_organization_master"), gson.toJson(OrgMasterMaster));
			// log.info("Response String:::::::::::"+resultStr);
			//System.out.println("Request String::::::organization master::::::"+gson.toJson(OrgMasterMaster));
			//System.out.println("Response String of organization master:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				//resultStr = AppProperties.getAppMessageByProperty("ROUTE_MASTER_SUCCESSFULLY").trim();
				
				OrgMasterMaster = gson.fromJson(resultStr, OrganizationMaster.class);
				// log.info(resultStr);
			}
			else{
				//result = "Couldn't create, please try after some time";
				resultStr = Response.getResponseMessage(resultStr);
				// log.info(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return OrgMasterMaster.getOrganizationMasters();
	}
	
	public List<OrganizationMaster> viewOrganizationMaster(String customerIdStr, String emailIdStr ,String OrganizationId, String zone,String location,String accountType,String status,String startDate,String endDate,String searchCriteria,String index) {
		String resultStr = null;
		OrganizationMaster OrgMasterMaster=null;
		try {

			OrgMasterMaster = new OrganizationMaster();
			OrgMasterMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			OrgMasterMaster.setMaxRecords(10);
			if(index.equals(""))
				OrgMasterMaster.setStartIndex(0);
			else
				OrgMasterMaster.setStartIndex(Integer.parseInt(index));

			OrgMasterMaster.setOrganizationId(OrganizationId);
			
			//OrgMasterMaster.setzone(zone);
			OrgMasterMaster.setLocation(location);
			OrgMasterMaster.setOrganizationStatus(status);
			OrgMasterMaster.setStartDate(startDate);
			OrgMasterMaster.setEndDate(endDate);
			OrgMasterMaster.setSearchCritaria(searchCriteria);
			OrgMasterMaster.setBusinessType(accountType);
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("get_organization_master"), gson.toJson(OrgMasterMaster));
			// log.info("Response String:::::::::::"+resultStr);
			////////////System.out.println("Request String::::::::::::"+gson.toJson(OrgMasterMaster));
			////////////System.out.println("Response String of organization master:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				//resultStr = AppProperties.getAppMessageByProperty("ROUTE_MASTER_SUCCESSFULLY").trim();
				
				OrgMasterMaster = gson.fromJson(resultStr, OrganizationMaster.class);
				// log.info(resultStr);
				OrgMasterMaster.getOrganizationMasters().get(0).setTotalRecords(OrgMasterMaster.getTotalRecords());		
			}
			else{
				//result = "Couldn't create, please try after some time";
				resultStr = Response.getResponseMessage(resultStr);
				// log.info(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return OrgMasterMaster.getOrganizationMasters();
	}
	public List<AccountTypeMaster> getAccountIds(String customerIdStr, String emailIdStr ,String OrganizationId,String AccountType) {
		String resultStr = null;
		AccountTypeMaster AssetAccounts=null;
		try {

			AssetAccounts = new AccountTypeMaster();
			AssetAccounts.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			AssetAccounts.setMaxRecords(10);
			AssetAccounts.setStartIndex(0);
			AssetAccounts.setStatus(true);
			AssetAccounts.setAccountType(AccountType);
			AssetAccounts.setAccountId(OrganizationId);
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("get_account_master"), gson.toJson(AssetAccounts));
			// log.info("Response String:::::::::::"+resultStr);
			//////////////System.out.println("Request String::::::::::::"+gson.toJson(OrgMasterMaster));
			////////////System.out.println("Response String of Asset Master:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				//resultStr = AppProperties.getAppMessageByProperty("ROUTE_MASTER_SUCCESSFULLY").trim();
				
				AssetAccounts = gson.fromJson(resultStr, AccountTypeMaster.class);
				// log.info(resultStr);
			}
			else{
				//result = "Couldn't create, please try after some time";
				resultStr = Response.getResponseMessage(resultStr);
				// log.info(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return AssetAccounts.getAccountTypeMasters();
	}
	
	public List<AccountTypeMaster> getAssetsMaster(String customerIdStr, String emailIdStr ,String OrganizationId,String AccountId,String zone,String location,String BusinessType,String status,String startDate,String endDate,String startIndex,String searchCritaria) {
		String resultStr = null;
		AccountTypeMaster AssetAccounts=null;
		
		try {

			AssetAccounts = new AccountTypeMaster();
			AssetAccounts.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			AssetAccounts.setMaxRecords(10);
			if(startIndex.equals(""))
				AssetAccounts.setStartIndex(0);
			else
				AssetAccounts.setStartIndex(Integer.parseInt(startIndex));
			//AssetAccounts.setStatus(true);
			AssetAccounts.setAccountTypeStatus(status);
			AssetAccounts.setAccountType("Assets");
			AssetAccounts.setOrganizationId(OrganizationId);
			AssetAccounts.setAccountId(AccountId);
			//AssetAccounts.setzone(0);
			AssetAccounts.setLocation(location);
			AssetAccounts.setSearchCritaria(searchCritaria);
			AssetAccounts.setStartDate(startDate);
			AssetAccounts.setEndDate(endDate);
			
			
			
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("get_account_master"), gson.toJson(AssetAccounts));
			// log.info("Response String:::::::::::"+resultStr);
			////////////System.out.println("Request String::::::::::::"+gson.toJson(AssetAccounts));
			////////////System.out.println("Response String of Asset Master:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				//resultStr = AppProperties.getAppMessageByProperty("ROUTE_MASTER_SUCCESSFULLY").trim();
				
				AssetAccounts = gson.fromJson(resultStr, AccountTypeMaster.class);
				
				AssetAccounts.getAccountTypeMasters().get(0).setTotalRecords(AssetAccounts.getTotalRecords());
				// log.info(resultStr);
			}
			else{
				//result = "Couldn't create, please try after some time";
				resultStr = Response.getResponseMessage(resultStr);
				// log.info(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return AssetAccounts.getAccountTypeMasters();
	}
	
	public List<AccountTypeMaster> getLiabilitiesMaster(String customerIdStr, String emailIdStr ,String OrganizationId,String AccountId,String zone,String location,String BusinessType,String status,String startDate,String endDate,String startIndex,String searchCretiria) {
		String resultStr = null;
		AccountTypeMaster AssetAccounts=null;
		try {

			AssetAccounts = new AccountTypeMaster();
			AssetAccounts.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			AssetAccounts.setMaxRecords(10);
			if(startIndex.equals(""))
				AssetAccounts.setStartIndex(0);
			else
				AssetAccounts.setStartIndex(Integer.parseInt(startIndex));

			//AssetAccounts.setStatus(true);
			AssetAccounts.setAccountTypeStatus(status);
			AssetAccounts.setAccountType("Liability");
			AssetAccounts.setAccountId(AccountId);
			AssetAccounts.setOrganizationId(OrganizationId);
			//AssetAccounts.setzone(0);
			AssetAccounts.setLocation(location);
			AssetAccounts.setSearchCritaria(searchCretiria);
			AssetAccounts.setStartDate(startDate);
			AssetAccounts.setEndDate(endDate);
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("get_account_master"), gson.toJson(AssetAccounts));
			// log.info("Response String:::::::::::"+resultStr);
			//////////////System.out.println("Request String::::::::::::"+gson.toJson(OrgMasterMaster));
			////////////System.out.println("Response String of Asset Master:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				//resultStr = AppProperties.getAppMessageByProperty("ROUTE_MASTER_SUCCESSFULLY").trim();
				
				AssetAccounts = gson.fromJson(resultStr, AccountTypeMaster.class);
				// log.info(resultStr);
				AssetAccounts.getAccountTypeMasters().get(0).setTotalRecords(AssetAccounts.getTotalRecords());	
			}
			else{
				//result = "Couldn't create, please try after some time";
				resultStr = Response.getResponseMessage(resultStr);
				// log.info(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return AssetAccounts.getAccountTypeMasters();
	}
	
	
	public List<AccountTypeMaster> getaIncomeMaster(String customerIdStr, String emailIdStr ,String OrganizationId,String AccountId,String zone,String location,String BusinessType,String status,String startDate,String endDate,String index,String searchCritiria) {
		String resultStr = null;
		AccountTypeMaster AssetAccounts=null;
		try {

			AssetAccounts = new AccountTypeMaster();
			AssetAccounts.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			AssetAccounts.setMaxRecords(10);
			if(index.equals(""))
				AssetAccounts.setStartIndex(0);
			else
				AssetAccounts.setStartIndex(Integer.parseInt(index));
			//AssetAccounts.setStatus(true);
			AssetAccounts.setAccountTypeStatus(status);
			AssetAccounts.setAccountType("Income");
			AssetAccounts.setOrganizationId(OrganizationId);
			AssetAccounts.setAccountId(AccountId);
			//AssetAccounts.setzone(0);
			AssetAccounts.setLocation(location);
			AssetAccounts.setSearchCritaria(searchCritiria);
			AssetAccounts.setStartDate(startDate);
			AssetAccounts.setEndDate(endDate);
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("get_account_master"), gson.toJson(AssetAccounts));
			// log.info("Response String:::::::::::"+resultStr);
			//////////////System.out.println("Request String::::::::::::"+gson.toJson(OrgMasterMaster));
			////////////System.out.println("Response String of Asset Master:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				//resultStr = AppProperties.getAppMessageByProperty("ROUTE_MASTER_SUCCESSFULLY").trim();
				
				AssetAccounts = gson.fromJson(resultStr, AccountTypeMaster.class);
				// log.info(resultStr);
				AssetAccounts.getAccountTypeMasters().get(0).setTotalRecords(AssetAccounts.getTotalRecords());	
			}
			else{
				//result = "Couldn't create, please try after some time";
				resultStr = Response.getResponseMessage(resultStr);
				// log.info(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return AssetAccounts.getAccountTypeMasters();
	}
	
	
	public List<AccountTypeMaster> getaExpencesMaster(String customerIdStr, String emailIdStr ,String OrganizationId,String AccountId,String zone,String location,String BusinessType,String status,String startDate,String endDate,String index,String searchCritiria) {

		String resultStr = null;
		AccountTypeMaster AssetAccounts=null;
		try {

			AssetAccounts = new AccountTypeMaster();
			AssetAccounts.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			AssetAccounts.setMaxRecords(10);
			if(index.equals(""))
				AssetAccounts.setStartIndex(0);
			else
				AssetAccounts.setStartIndex(Integer.parseInt(index));
			AssetAccounts.setAccountTypeStatus(status);
			AssetAccounts.setAccountType("Expenses");
			AssetAccounts.setOrganizationId(OrganizationId);
			AssetAccounts.setAccountId(AccountId);
			//AssetAccounts.setzone(0);
			AssetAccounts.setLocation(location);
			AssetAccounts.setSearchCritaria(searchCritiria);
			AssetAccounts.setStartDate(startDate);
			AssetAccounts.setEndDate(endDate);
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("get_account_master"), gson.toJson(AssetAccounts));
			// log.info("Response String:::::::::::"+resultStr);
			//////////////System.out.println("Request String::::::::::::"+gson.toJson(OrgMasterMaster));
			////////////System.out.println("Response String of Asset Master:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				//resultStr = AppProperties.getAppMessageByProperty("ROUTE_MASTER_SUCCESSFULLY").trim();
				
				AssetAccounts = gson.fromJson(resultStr, AccountTypeMaster.class);
				// log.info(resultStr);
				AssetAccounts.getAccountTypeMasters().get(0).setTotalRecords(AssetAccounts.getTotalRecords());
			}
			else{
				//result = "Couldn't create, please try after some time";
				resultStr = Response.getResponseMessage(resultStr);
				// log.info(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return AssetAccounts.getAccountTypeMasters();
	}
	
	
	public List<JournalAccount> getJournalMaster(String customerIdStr, String emailIdStr ,String OrganizationId,String accountType,String accountId,String zone,String location,String txnType,String startDate,String endDate) {

		String resultStr = null;
		JournalAccount AssetAccounts=null;
		try {

			AssetAccounts = new JournalAccount();
			AssetAccounts.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			AssetAccounts.setMaxRecords("10");
			AssetAccounts.setStartIndex("0");
			AssetAccounts.setStatus(true);
			AssetAccounts.setTransactionStatus("Active");
			AssetAccounts.setAccountType(accountType);
			AssetAccounts.setOrganizationId(OrganizationId);
			AssetAccounts.setAccountId(accountId);
			//AssetAccounts.setzone(true);
			AssetAccounts.setLocationId(location);
			AssetAccounts.setStartDate(startDate);
			AssetAccounts.setEndDate(endDate);
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("get_journal_master"), gson.toJson(AssetAccounts));
			// log.info("Response String:::::::::::"+resultStr);
			////////////System.out.println(" journal Request String::::::::::::"+gson.toJson(AssetAccounts));
			////////////System.out.println(" journal Response String of Asset Master:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				//resultStr = AppProperties.getAppMessageByProperty("ROUTE_MASTER_SUCCESSFULLY").trim();
				
				AssetAccounts = gson.fromJson(resultStr, JournalAccount.class);
				// log.info(resultStr);
				AssetAccounts.getJournalAccounts().get(0).setTotalRecords(AssetAccounts.getTotalRecords());
			}
			else{
				//result = "Couldn't create, please try after some time";
				resultStr = Response.getResponseMessage(resultStr);
				// log.info(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return AssetAccounts.getJournalAccounts();
	}
	
	
	public String createJournalMaster(String customerId,String emailId,String accountId,String accountName,String accountType,String TxnDiscription,String TxnDate,String TxnType,String TxnValue,String location) {
		String resultStr = null;
		try {
			
			JournalAccount assetAccounts = new JournalAccount();
			assetAccounts.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			assetAccounts.setRemarks(TxnDiscription);
			assetAccounts.setAccountId(accountId);
			assetAccounts.setAccountName(accountName);
			assetAccounts.setAccountType(accountType);
			assetAccounts.setLocationId(location);
			assetAccounts.setUserName(RequestHeaderUtil.getRequestHeader(sessionScope).getUserName());
			assetAccounts.setRoleName(RequestHeaderUtil.getRequestHeader(sessionScope).getRole());
			if(TxnType.equalsIgnoreCase("credit")){
				assetAccounts.setCreditAmount(new BigDecimal(TxnValue));
				assetAccounts.setDebitAmount(new BigDecimal(0));
			}else{
				assetAccounts.setCreditAmount(new BigDecimal(0));
				assetAccounts.setDebitAmount(new BigDecimal(TxnValue));
			}
			assetAccounts.setStatus(true);
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_journal_master"), gson.toJson(assetAccounts));
			// log.info("Response String:::::::::::"+resultStr);
			////////////System.out.println("Request String::::::::::::"+gson.toJson(assetAccounts));
			////////////System.out.println("Response String:::::::::::response create Account"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("ACCOUNT_MASTER_SUCCESSFULLY").trim();
				// log.info(resultStr);
			}
			else{
				//result = "Couldn't create, please try after some time";
				resultStr = Response.getResponseMessage(resultStr);
				// log.info(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
	}
	

	public String updateJournalMaster(String customerId,String emailId,String accountId,String accountName,String accountType,String TxnDiscription,String TxnDate,String TxnType,String TxnValue,String location,String sno) {
		String resultStr = null;
		try {
			
			JournalAccount assetAccounts = new JournalAccount();
			assetAccounts.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			assetAccounts.setRemarks(TxnDiscription);
			assetAccounts.setAccountId(accountId);
			assetAccounts.setAccountName(accountName);
			assetAccounts.setAccountType(accountType);
			assetAccounts.setLocationId(location);
			assetAccounts.setUserName(RequestHeaderUtil.getRequestHeader(sessionScope).getUserName());
			assetAccounts.setRoleName(RequestHeaderUtil.getRequestHeader(sessionScope).getRole());
			if(TxnType.equalsIgnoreCase("credit")){
				assetAccounts.setCreditAmount(new BigDecimal(TxnValue));
				assetAccounts.setDebitAmount(new BigDecimal(0));
			}else{
				assetAccounts.setCreditAmount(new BigDecimal(0));
				assetAccounts.setDebitAmount(new BigDecimal(TxnValue));
			}
			assetAccounts.setStatus(true);
			assetAccounts.setTransactionRef(sno);
			
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_journal_master"), gson.toJson(assetAccounts));
			////////////System.out.println("Request String::::::::::::"+gson.toJson(assetAccounts));
			////////////System.out.println("Response String:::::::::::response create Account"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("ACCOUNT_MASTER_SUCCESSFULLY").trim();
			}
			else{
				//result = "Couldn't create, please try after some time";
				resultStr = Response.getResponseMessage(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
	}
	

	public String deleteJournalMaster(String customerId,String emailId,String sno) {
		String resultStr = null;
		try {
			
			JournalAccount assetAccounts = new JournalAccount();
			assetAccounts.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			assetAccounts.setTransactionRef(sno);
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("delete_journal_master"), gson.toJson(assetAccounts));
			////////////System.out.println("Request String::::::::::::"+gson.toJson(assetAccounts));
			////////////System.out.println("Response String:::::::::::response create Account"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("ACCOUNT_MASTER_SUCCESSFULLY").trim();
			}
			else{
				resultStr = Response.getResponseMessage(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
	}
	
	
	//AssetAccountTransactions
	public List<AssetAccounts> deleteAccountTransactions(String sno, String accountType) {
		String resultStr = null;
		AssetAccounts AssetAccounts=null;
		try {

			AssetAccounts = new AssetAccounts();
			AssetAccounts.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			AssetAccounts.setSno(String.valueOf(sno));
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			if(accountType.equalsIgnoreCase("Assets")){
				resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("delete_assets_master"), gson.toJson(AssetAccounts));
			}else if(accountType.equalsIgnoreCase("Liability")){
				resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("delete_liability_master"), gson.toJson(AssetAccounts));
			}else if(accountType.equalsIgnoreCase("Income")){
				resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("delete_income_master"), gson.toJson(AssetAccounts));
			}else {
				resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("delete_expences_master"), gson.toJson(AssetAccounts));
			}
			
			////////////System.out.println("Request String::::::::::::"+gson.toJson(AssetAccounts));
			////////////System.out.println("Response String of Asset Master:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				
				AssetAccounts = gson.fromJson(resultStr, AssetAccounts.class);
			}
			else{
				resultStr = Response.getResponseMessage(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return AssetAccounts.getAssetAccounts();
	}
	
	public String updateAccountTransactions(String customerId,String emailId,String accountId,String accountName,String location,String discription,String txnType,String txnDate,String txnValue, String accountType,String sno) {
		String resultStr = null;
		AssetAccounts AssetAccounts=null;
		try {

			AssetAccounts = new AssetAccounts();
			AssetAccounts.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			AssetAccounts.setRemarks(discription);
			AssetAccounts.setAccountId(accountId);
			AssetAccounts.setAccountName(accountName);
			AssetAccounts.setLocationId(location);
			if(txnType.equalsIgnoreCase("credit")){
				AssetAccounts.setCreditAmount(new BigDecimal(txnValue));
				AssetAccounts.setDebitAmount(new BigDecimal(0));
			}else{
				AssetAccounts.setCreditAmount(new BigDecimal(0));
				AssetAccounts.setDebitAmount(new BigDecimal(txnValue));
			}
			AssetAccounts.setStatus(true);
			AssetAccounts.setSno(sno);
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			if(accountType.equalsIgnoreCase("Assets")){
				resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_assets_master"), gson.toJson(AssetAccounts));
			}else if(accountType.equalsIgnoreCase("Liability")){
				resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_liability_master"), gson.toJson(AssetAccounts));
			}else if(accountType.equalsIgnoreCase("Income")){
				resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_income_master"), gson.toJson(AssetAccounts));
			}else {
				resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_expences_master"), gson.toJson(AssetAccounts));
			}
			
			////////////System.out.println("Request String::::::::::::"+gson.toJson(AssetAccounts));
			////////////System.out.println("Response String of Asset Master:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				
				AssetAccounts = gson.fromJson(resultStr, AssetAccounts.class);
			}
			else{
				resultStr = Response.getResponseMessage(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
	}
	
	//AssetAccountTransactions
	public List<AssetAccounts> getAssetAccountTransactions(String customerIdStr, String emailIdStr ,String AccountId,String OrganizationId,String zone,String location,String txnType,String start_date,String end_date,String startIndex) {
		String resultStr = null;
		AssetAccounts AssetAccounts=null;
		try {

			AssetAccounts = new AssetAccounts();
			AssetAccounts.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			AssetAccounts.setMaxRecords("10");
			if(startIndex.equals(""))
				AssetAccounts.setStartIndex(0);
			else
				AssetAccounts.setStartIndex(Integer.parseInt(startIndex));
			AssetAccounts.setStatus(true);
			AssetAccounts.setTransactionStatus("Active");
			AssetAccounts.setAccountId(AccountId);
			AssetAccounts.setOrganizationId(OrganizationId);
			//AssetAccounts.setzone(OrganizationId);
			AssetAccounts.setTxnType(txnType);
			AssetAccounts.setLocationId(location);
			AssetAccounts.setStartDate(start_date);
			AssetAccounts.setEndDate(end_date);
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("get_assets_master"), gson.toJson(AssetAccounts));
			// log.info("Response String:::::::::::"+resultStr);
			////////////System.out.println("Request String::::::::::::"+gson.toJson(AssetAccounts));
			////////////System.out.println("Response String of Asset Master:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				//resultStr = AppProperties.getAppMessageByProperty("ROUTE_MASTER_SUCCESSFULLY").trim();
				
				AssetAccounts = gson.fromJson(resultStr, AssetAccounts.class);
				// log.info(resultStr);
				AssetAccounts.getAssetAccounts().get(0).setTotalRecords(AssetAccounts.getTotalRecords());	
			}
			else{
				//result = "Couldn't create, please try after some time";
				resultStr = Response.getResponseMessage(resultStr);
				// log.info(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return AssetAccounts.getAssetAccounts();
	}
	
	
	public String createAssetAccountTransactions(String customerId,String emailId,String accountId,String accountName,String location,String discription,String txnType,String txnDate,String txnValue) {
		String resultStr = null;
		try {
			
			AssetAccounts OrgMasterMaster = new AssetAccounts();
			OrgMasterMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			OrgMasterMaster.setRemarks(discription);
			OrgMasterMaster.setAccountId(accountId);
			OrgMasterMaster.setAccountName(accountName);
			OrgMasterMaster.setLocationId(location);
			if(txnType.equalsIgnoreCase("credit")){
				OrgMasterMaster.setCreditAmount(new BigDecimal(txnValue));
				OrgMasterMaster.setDebitAmount(new BigDecimal(0));
			}else{
				OrgMasterMaster.setCreditAmount(new BigDecimal(0));
				OrgMasterMaster.setDebitAmount(new BigDecimal(txnValue));
			}
			OrgMasterMaster.setStatus(true);
			
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_assets_master"), gson.toJson(OrgMasterMaster));
			// log.info("Response String:::::::::::"+resultStr);
			////////////System.out.println("Request String::::::::::::"+gson.toJson(OrgMasterMaster));
			////////////System.out.println("Response String:::::::::::response create Account"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("ACCOUNT_MASTER_SUCCESSFULLY").trim();
				// log.info(resultStr);
			}
			else{
				//result = "Couldn't create, please try after some time";
				resultStr = Response.getResponseMessage(resultStr);
				// log.info(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
	}

	// LiabilitiesTransactions
	
	public List<LiabilityAccounts> getLiabilitiesTransactions(String customerIdStr, String emailIdStr ,String AccountId,String OrganizationId,String zone,String location,String txnType,String start_date,String end_date,String startIndex) {
		String resultStr = null;
		LiabilityAccounts AssetAccounts=null;
		try {

			AssetAccounts = new LiabilityAccounts();
			AssetAccounts.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			AssetAccounts.setMaxRecords("10");
			if(startIndex.equals(""))
				AssetAccounts.setStartIndex(0);
			else
				AssetAccounts.setStartIndex(Integer.parseInt(startIndex));
			AssetAccounts.setStatus(true);
			AssetAccounts.setTransactionStatus("Active");
			AssetAccounts.setAccountId(AccountId);
			AssetAccounts.setOrganizationId(OrganizationId);
			AssetAccounts.setTxnType(txnType);
			//AssetAccounts.setzone(OrganizationId);
			//AssetAccounts.setzone(OrganizationId);
			AssetAccounts.setLocationId(location);
			AssetAccounts.setStartDate(start_date);
			AssetAccounts.setEndDate(end_date);
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("get_liability_master"), gson.toJson(AssetAccounts));
			// log.info("Response String:::::::::::"+resultStr);
			////////////System.out.println("Request String::::::::::::"+gson.toJson(AssetAccounts));
			////////////System.out.println("Response String of get_liability_master:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				//resultStr = AppProperties.getAppMessageByProperty("ROUTE_MASTER_SUCCESSFULLY").trim();
				
				AssetAccounts = gson.fromJson(resultStr, LiabilityAccounts.class);
				// log.info(resultStr);
				AssetAccounts.getLiabilityAccounts().get(0).setTotalRecords(AssetAccounts.getTotalRecords());	
			}
			else{
				//result = "Couldn't create, please try after some time";
				resultStr = Response.getResponseMessage(resultStr);
				// log.info(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return AssetAccounts.getLiabilityAccounts();
	}
	
	
	public String createLiabilitiesTransactions(String customerId,String emailId,String accountId,String accountName,String location,String discription,String txnType,String txnDate,String txnValue) {
		String resultStr = null;
		try {
			
			LiabilityAccounts OrgMasterMaster = new LiabilityAccounts();
			OrgMasterMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			OrgMasterMaster.setRemarks(discription);
			OrgMasterMaster.setAccountId(accountId);
			OrgMasterMaster.setAccountName(accountName);
			if(txnType.equalsIgnoreCase("credit")){
				OrgMasterMaster.setCreditAmount(new BigDecimal(txnValue));
				OrgMasterMaster.setDebitAmount(new BigDecimal(0));
			}else{
				OrgMasterMaster.setCreditAmount(new BigDecimal(0));
				OrgMasterMaster.setDebitAmount(new BigDecimal(txnValue));
			}
			OrgMasterMaster.setStatus(true);
			OrgMasterMaster.setLocationId(location);
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_liability_master"), gson.toJson(OrgMasterMaster));
			// log.info("Response String:::::::::::"+resultStr);
			////////////System.out.println("Request String::::::::::::"+gson.toJson(OrgMasterMaster));
			////////////System.out.println("Response String:::::::::::response create Account"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("ACCOUNT_MASTER_SUCCESSFULLY").trim();
				// log.info(resultStr);
			}
			else{
				//result = "Couldn't create, please try after some time";
				resultStr = Response.getResponseMessage(resultStr);
				// log.info(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
	}
	
	
	//IncomeTransactions
	public List<IncomeAccounts> getIncomeAccountTransactions(String customerIdStr, String emailIdStr ,String AccountId,String OrganizationId,String zone,String location,String txnType,String start_date,String end_date,String index) {
		String resultStr = null;
		IncomeAccounts AssetAccounts=null;
		try {

			AssetAccounts = new IncomeAccounts();
			AssetAccounts.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			AssetAccounts.setMaxRecords("10");
			if(index.equals(""))
				AssetAccounts.setStartIndex(0);
			else
				AssetAccounts.setStartIndex(Integer.parseInt(index));
			AssetAccounts.setStatus(true);
			AssetAccounts.setTransactionStatus("Active");
			AssetAccounts.setAccountId(AccountId);
			AssetAccounts.setOrganizationId(OrganizationId);
			AssetAccounts.setTxnType(txnType);
			//AssetAccounts.setzone(OrganizationId);
			//AssetAccounts.setzone(OrganizationId);
			AssetAccounts.setLocationId(location);
			AssetAccounts.setStartDate(start_date);
			AssetAccounts.setEndDate(end_date);
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("get_income_master"), gson.toJson(AssetAccounts));
			// log.info("Response String:::::::::::"+resultStr);
			//////////////System.out.println("Request String::::::::::::"+gson.toJson(OrgMasterMaster));
			////////////System.out.println("Response String of Asset Master:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				//resultStr = AppProperties.getAppMessageByProperty("ROUTE_MASTER_SUCCESSFULLY").trim();
				
				AssetAccounts = gson.fromJson(resultStr, IncomeAccounts.class);
				// log.info(resultStr);

				AssetAccounts.getIncomeAccounts().get(0).setTotalRecords(AssetAccounts.getTotalRecords());
			}
			else{
				//result = "Couldn't create, please try after some time";
				resultStr = Response.getResponseMessage(resultStr);
				// log.info(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return AssetAccounts.getIncomeAccounts();
	}
	
	
	public String createIncomeAccountTransaction(String customerId,String emailId,String accountId,String accountName,String discription,String txnType,String txnDate,String txnValue,String location) {
		String resultStr = null;
		try {
			
			IncomeAccounts OrgMasterMaster = new IncomeAccounts();
			OrgMasterMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			OrgMasterMaster.setRemarks(discription);
			OrgMasterMaster.setAccountId(accountId);
			OrgMasterMaster.setAccountName(accountName);
			if(txnType.equalsIgnoreCase("credit")){
				OrgMasterMaster.setCreditAmount(new BigDecimal(txnValue));
				OrgMasterMaster.setDebitAmount(new BigDecimal(0));
			}else{
				OrgMasterMaster.setCreditAmount(new BigDecimal(0));
				OrgMasterMaster.setDebitAmount(new BigDecimal(txnValue));
			}
			OrgMasterMaster.setStatus(true);
			OrgMasterMaster.setLocationId(location);
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_income_master"), gson.toJson(OrgMasterMaster));
			// log.info("Response String:::::::::::"+resultStr);
			////////////System.out.println("Request String::::::::::::"+gson.toJson(OrgMasterMaster));
			////////////System.out.println("Response String:::::::::::response create Account"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("ACCOUNT_MASTER_SUCCESSFULLY").trim();
				// log.info(resultStr);
			}
			else{
				//result = "Couldn't create, please try after some time";
				resultStr = Response.getResponseMessage(resultStr);
				// log.info(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
	}

	// ExpensesTransactions
	
	public List<ExpensesAccounts> getExpensesAccountTransaction(String customerIdStr, String emailIdStr ,String AccountId,String OrganizationId,String zone,String location,String txnType,String start_date,String end_date,String index) {
		String resultStr = null;
		ExpensesAccounts AssetAccounts=null;
		
		try {

			AssetAccounts = new ExpensesAccounts();
			AssetAccounts.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			AssetAccounts.setMaxRecords("10");
			if(index.equals(""))
				AssetAccounts.setStartIndex(0);
			else
				AssetAccounts.setStartIndex(Integer.parseInt(index));
			AssetAccounts.setStatus(true);
			AssetAccounts.setTransactionStatus("Active");
			AssetAccounts.setAccountId(AccountId);
			AssetAccounts.setOrganizationId(OrganizationId);
			AssetAccounts.setTxnType(txnType);
			//AssetAccounts.setzone(OrganizationId);
			//AssetAccounts.setzone(OrganizationId);
			AssetAccounts.setLocationId(location);
			AssetAccounts.setStartDate(start_date);
			AssetAccounts.setEndDate(end_date);
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("get_expences_master"), gson.toJson(AssetAccounts));
			// log.info("Response String:::::::::::"+resultStr);
			//////////////System.out.println("Request String::::::::::::"+gson.toJson(OrgMasterMaster));
			////////////System.out.println("Response String of getExpensesAccountTransaction:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				//resultStr = AppProperties.getAppMessageByProperty("ROUTE_MASTER_SUCCESSFULLY").trim();
				
				AssetAccounts = gson.fromJson(resultStr, ExpensesAccounts.class);
				// log.info(resultStr);
				AssetAccounts.getExpensesAccounts().get(0).setTotalRecords(AssetAccounts.getTotalRecords());

			}
			else{
				//result = "Couldn't create, please try after some time";
				resultStr = Response.getResponseMessage(resultStr);
				// log.info(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return AssetAccounts.getExpensesAccounts();
	}
	
	
	public String createExpensesAccountTransaction(String customerId,String emailId,String accountId,String accountName,String discription,String txnType,String txnDate,String txnValue,String location) {
		String resultStr = null;
		try {
			
			ExpensesAccounts OrgMasterMaster = new ExpensesAccounts();
			OrgMasterMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			OrgMasterMaster.setRemarks(discription);
			OrgMasterMaster.setAccountId(accountId);
			OrgMasterMaster.setAccountName(accountName);
			if(txnType.equalsIgnoreCase("credit")){
				OrgMasterMaster.setCreditAmount(new BigDecimal(txnValue));
				OrgMasterMaster.setDebitAmount(new BigDecimal(0));
			}else{
				OrgMasterMaster.setCreditAmount(new BigDecimal(0));
				OrgMasterMaster.setDebitAmount(new BigDecimal(txnValue));
			}
			OrgMasterMaster.setStatus(true);
			OrgMasterMaster.setLocationId(location);
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_expences_master"), gson.toJson(OrgMasterMaster));
			// log.info("Response String:::::::::::"+resultStr);
			////////////System.out.println("Request String::::::::::::"+gson.toJson(OrgMasterMaster));
			////////////System.out.println("Response String:::::::::::response create Account"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("ACCOUNT_MASTER_SUCCESSFULLY").trim();
				// log.info(resultStr);
			}
			else{
				//result = "Couldn't create, please try after some time";
				resultStr = Response.getResponseMessage(resultStr);
				// log.info(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
	}
	public List<SubAccountTypeMaster> getSubAccountTypes(String customerIdStr, String emailIdStr ,String AccountId,String location) {
		String resultStr = null;
		SubAccountTypeMaster AssetAccounts=null;
		try {

			AssetAccounts = new SubAccountTypeMaster();
			AssetAccounts.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			AssetAccounts.setMaxRecords(10);
			AssetAccounts.setStartIndex(0);
			AssetAccounts.setStatus(true);
			AssetAccounts.setAccountId(AccountId);
			//AssetAccounts.setLocationId(location);
			
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("get_sub_account_types"), gson.toJson(AssetAccounts));
			// log.info("Response String:::::::::::"+resultStr);
			//////////////System.out.println("Request String::::::::::::"+gson.toJson(OrgMasterMaster));
			////////////System.out.println("Response String of Asset Master:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				//resultStr = AppProperties.getAppMessageByProperty("ROUTE_MASTER_SUCCESSFULLY").trim();
				
				AssetAccounts = gson.fromJson(resultStr, SubAccountTypeMaster.class);
				// log.info(resultStr);
			}
			else{
				//result = "Couldn't create, please try after some time";
				resultStr = Response.getResponseMessage(resultStr);
				// log.info(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return AssetAccounts.getAccountTypeMasters();
	}
	
	//Added by Surya.k on 20/03/2019
	// getting the BalanceSheet data.
	
	public BalanceSheetBean getBalanceSheet(String customerIdStr, String emailIdStr ) {
		String resultStr = null;
		BalanceSheetBean balanceSheetBean=null;
		try {

			balanceSheetBean = new BalanceSheetBean();
			balanceSheetBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			balanceSheetBean.setMaxRecords(10);
			balanceSheetBean.setStartIndex(0);
			
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("get_balance_sheet"), gson.toJson(balanceSheetBean));
			// log.info("Response String:::::::::::"+resultStr);
			////////////System.out.println("Request get_balance_sheet String::::::::::::"+gson.toJson(balanceSheetBean));
			////////////System.out.println("Response String of get_balance_sheet:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				//resultStr = AppProperties.getAppMessageByProperty("ROUTE_MASTER_SUCCESSFULLY").trim();
				
				balanceSheetBean = gson.fromJson(resultStr, BalanceSheetBean.class);
				// log.info(resultStr);
				////////////System.out.println("R String::::::::::::"+(balanceSheetBean));
			}
			else{
				//result = "Couldn't create, please try after some time";
				resultStr = Response.getResponseMessage(resultStr);
				// log.info(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return  balanceSheetBean;
	}
	//Added by Surya.k on 20/03/2019
		// getting the TrailBalance data.
	
	public BalanceSheetBean getTrailBalanceSheet(String customerIdStr, String emailIdStr,String organization,String startDate,String endDate) {
		String resultStr = null;
		BalanceSheetBean balanceSheetBean=null;
		try {

			balanceSheetBean = new BalanceSheetBean();
			balanceSheetBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			balanceSheetBean.setMaxRecords(10);
			balanceSheetBean.setStartIndex(0);
			balanceSheetBean.setOrganizationId(organization);
			balanceSheetBean.setStartDate(startDate);
			balanceSheetBean.setEndDate(endDate);
			
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("get_trialbalance_sheet"), gson.toJson(balanceSheetBean));
			// log.info("Response String:::::::::::"+resultStr);
			////////////System.out.println("Request trail String::::::::::::"+gson.toJson(balanceSheetBean));
			////////////System.out.println("Response String of trail :::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				//resultStr = AppProperties.getAppMessageByProperty("ROUTE_MASTER_SUCCESSFULLY").trim();
				
				balanceSheetBean = gson.fromJson(resultStr, BalanceSheetBean.class);
				// log.info(resultStr);
				////////////System.out.println("R String::::::::::::"+(balanceSheetBean));
			}
			else{
				//result = "Couldn't create, please try after some time";
				resultStr = Response.getResponseMessage(resultStr);
				// log.info(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return  balanceSheetBean;
	}
	
	
	//Added by Surya.k on 09/04/2019
			// getting the ProfitAndLoss data.
		
		public BalanceSheetBean getProfitAndLoss(String customerIdStr, String emailIdStr,String organization,String startDate,String endDate,String Strategy) {
			String resultStr = null;
			BalanceSheetBean balanceSheetBean=null;
			try {

				balanceSheetBean = new BalanceSheetBean();
				balanceSheetBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				balanceSheetBean.setMaxRecords(10);
				balanceSheetBean.setStartIndex(0);
				balanceSheetBean.setOrganizationId(organization);
				balanceSheetBean.setStartDate(startDate);
				balanceSheetBean.setEndDate(endDate);
				balanceSheetBean.setBussinessCycle(Strategy);
				
				RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
				resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("get_profit_loss"), gson.toJson(balanceSheetBean));
				// log.info("Response String:::::::::::"+resultStr);
				//System.out.println("Request PL String::::::::::::"+gson.toJson(balanceSheetBean));
				//System.out.println("Response String of PL :::::::::::"+resultStr);
				String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					//resultStr = AppProperties.getAppMessageByProperty("ROUTE_MASTER_SUCCESSFULLY").trim();
					
					balanceSheetBean = gson.fromJson(resultStr, BalanceSheetBean.class);
					// log.info(resultStr);
					////////////System.out.println("R String::::::::::::"+(balanceSheetBean));
				}
				else{
					//result = "Couldn't create, please try after some time";
					balanceSheetBean = gson.fromJson(resultStr, BalanceSheetBean.class);
					resultStr = Response.getResponseMessage(resultStr);
					// log.info(resultStr);
				}
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return  balanceSheetBean;
		}
		
	
	public List<OrganizationLocations> getOrganizationLocationDetails(String organizationId,String customerId,String emailId){
		String result = null;
		String resultStr = null;
		OrganizationLocations locationBean =null;
		try{
			 locationBean = new OrganizationLocations();
			locationBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			locationBean.setStartIndex("-1");
			locationBean.setMaxRecords("100");
			locationBean.setOrganizationId(organizationId);
			
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("get_Organization_Locations"), gson.toJson(locationBean));
			////////////System.out.println("request ................"+locationBean);
			////////////System.out.println("responce ................"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				
				locationBean = gson.fromJson(resultStr, OrganizationLocations.class);
			}
			else{
				resultStr = Response.getResponseMessage(resultStr);
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
		return locationBean.getOrganizationLocations();
	}
	

	public ArrayList<LocationBean> getBusinessLocations(String businessType){
		ArrayList<LocationBean> locationDetails = null;
		String result = null;
		try{
			LocationBean locationBean = new LocationBean();
			locationBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			locationBean.setSearchCriteria("");
			locationBean.setStartIndex("0");
			locationBean.setBusinessType(businessType);
			locationBean.setAllLocations(true);
			locationBean.setStatus(true);
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_locations"), gson.toJson(locationBean),"POST");

			////////////System.out.println("Request String::::::"+gson.toJson(locationBean));
			////////////System.out.println("Response String::::::getLocation response"+result);
			
			String responseCode = Response.getResponseCode(result);
			JSONObject jsonResult = new JSONObject(result);
			String totalRecords = jsonResult.getString("totalRecords");
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				String responseList = Response.getResponseList(result, "locationDetails");
				JSONArray jsonResponseArray = new JSONArray(responseList);
				locationDetails = new ArrayList<LocationBean>();
				
				for (int i=0; i<jsonResponseArray.length(); i++) {
					locationBean = gson.fromJson(jsonResponseArray.getString(i), LocationBean.class);
					locationBean.setTotalRecords(totalRecords);
					
					
					
					locationDetails.add(locationBean);	
							
					
					
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
		//////////////System.out.println("Response String::::::zone master response"+gson.toJson(locationDetails));
		return locationDetails;
	}
	
	public List<AccountTypeMaster> getAccountList(String accountType,String customerId,String emailId){
		String result = null;
		String resultStr = null;
		AccountTypeMaster accountTypeMaster =null;
		try{
			accountTypeMaster = new AccountTypeMaster();
			accountTypeMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			accountTypeMaster.setStartIndex(-1);
			accountTypeMaster.setMaxRecords(100);
			accountTypeMaster.setAccountType(accountType);
			
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("get_account_master"), gson.toJson(accountTypeMaster));
			////////////System.out.println("request ................"+gson.toJson(accountTypeMaster));
			////////////System.out.println("responce ................"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				
				accountTypeMaster = gson.fromJson(resultStr, AccountTypeMaster.class);
			}
			else{
				resultStr = Response.getResponseMessage(resultStr);
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
		return accountTypeMaster.getAccountTypeMasters();
	}
	
	public List<ReconciliationMaster> getReconcilition(String customerIdStr, String emailIdStr ,String OrganizationId,String location, String startDate ,String endDate,String searchCritaria, String maxRecords ,String index,String reconciliationId){
		String resultStr = null;
		ReconciliationMaster requestObj=null;
		try {

			requestObj = new ReconciliationMaster();
			requestObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestObj.setMaxRecords(maxRecords);
			requestObj.setStartIndex(index);
			requestObj.setSearchCritaria(searchCritaria);
			requestObj.setStartDate(startDate);
			requestObj.setEndDate(endDate);
			requestObj.setSearchCritaria(searchCritaria);
			requestObj.setReconciliationId(reconciliationId);
			//requestObj.setOrganizationId(OrganizationId);
			
			
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_reconciliation"), gson.toJson(requestObj),"GET");
			////////////System.out.println("Request String Reconcilition:::::::::::"+gson.toJson(requestObj));
			////////////System.out.println("Response String of Reconcilition:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				
				requestObj = gson.fromJson(resultStr, ReconciliationMaster.class);
				requestObj.getReconciliationMasters().get(0).setTotalRecords(requestObj.getTotalRecords());

			}
			else{
				resultStr = Response.getResponseMessage(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return requestObj.getReconciliationMasters();
	}
	public String syncOrganizationMaster(String customerIdStr, String emailIdStr ,String OrganizationId,String flowname,String subAccountName){
		String resultStr = null;
		String result = null;
		BalanceSheetBean OrgMasterMaster=null;
		try {

			OrgMasterMaster = new BalanceSheetBean();
			OrgMasterMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			OrgMasterMaster.setMaxRecords(10);
			OrgMasterMaster.setStartIndex(0);
			OrgMasterMaster.setOrganizationId(OrganizationId);
			OrgMasterMaster.setFlowName(flowname);
			OrgMasterMaster.setSubAccountName(subAccountName);
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("sync_account_transaction"), gson.toJson(OrgMasterMaster));
			////////////System.out.println("Request String sync_account_transaction:::::::::::"+gson.toJson(OrgMasterMaster));
			////////////System.out.println("Response String of sync_account_transaction:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				
				OrgMasterMaster = gson.fromJson(resultStr, BalanceSheetBean.class);
				result= Response.getResponseMessage(resultStr);
			}
			else{
				resultStr = Response.getResponseMessage(resultStr);
				result= Response.getResponseMessage(resultStr);
				// log.info(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	//Added by Surya.k
	public List<PurchasePaymentMaster> getPurchasePayments(String transactionId,String organization, String zone ,String location,String category,String supplier,String status,String startDate,String endDate,String startIndex,String searchCriteria){
		String resultStr = null;
		String result = null;
		PurchasePaymentMaster purchasePaymentMaster=null;
		try {

			purchasePaymentMaster = new PurchasePaymentMaster();
			purchasePaymentMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			purchasePaymentMaster.setMaxRecords("10");
			if(startIndex.equals(""))
				purchasePaymentMaster.setStartIndex("0");
			else
				purchasePaymentMaster.setStartIndex(startIndex);
			purchasePaymentMaster.setOrganizationId(organization);
			purchasePaymentMaster.setZoneId(zone);
			purchasePaymentMaster.setLocation(location);
			purchasePaymentMaster.setSearchCritaria(searchCriteria);
			purchasePaymentMaster.setSupplierName(supplier);
			purchasePaymentMaster.setStatus(status);
			purchasePaymentMaster.setStartDate(startDate);
			purchasePaymentMaster.setEndDate(endDate);
			purchasePaymentMaster.setTransactionId(transactionId);
			purchasePaymentMaster.setSaveReport(true);
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			////////System.out.println("Request String get_Purchase_Payments:::::::::::"+gson.toJson(purchasePaymentMaster));
            resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Purchase_Payments"), gson.toJson(purchasePaymentMaster),"GET");

			////////System.out.println("Response String of get_Purchase_Payments:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				
				purchasePaymentMaster = gson.fromJson(resultStr, PurchasePaymentMaster.class);
				result= Response.getResponseMessage(resultStr);
				purchasePaymentMaster.getPurchasePaymentMasters().get(0).setTotalRecords(purchasePaymentMaster.getTotalRecords());
				purchasePaymentMaster.getPurchasePaymentMasters().get(0).setTotalInvoiceAmount(purchasePaymentMaster.getTotalInvoiceAmount());
				purchasePaymentMaster.getPurchasePaymentMasters().get(0).setTotalNetCost(purchasePaymentMaster.getTotalNetCost());
				purchasePaymentMaster.getPurchasePaymentMasters().get(0).setTotalDiscount(purchasePaymentMaster.getTotalDiscount());
				purchasePaymentMaster.getPurchasePaymentMasters().get(0).setFilePath(purchasePaymentMaster.getFilePath());
			}
			else{
				resultStr = Response.getResponseMessage(resultStr);
				result= Response.getResponseMessage(resultStr);
				// log.info(resultStr);
				purchasePaymentMaster.getPurchasePaymentMasters().get(0).setTotalInvoiceAmount(0);
				purchasePaymentMaster.getPurchasePaymentMasters().get(0).setFilePath("");
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		////////////System.out.println("Request String get_Purchase_Payments:::::::::::"+gson.toJson(purchasePaymentMaster.getPurchasePaymentMasters()));
		return purchasePaymentMaster.getPurchasePaymentMasters();
	}
	
	//Added by Surya.k
	public String createPurchasesAndPayments(PurchasePaymentMaster purchasesobj){
		String resultStr = null;
		try {

			purchasesobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
            resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_Purchase_Payments"), gson.toJson(purchasesobj));

			////////////System.out.println("Request String create_Purchase_Payments:::::::::::"+gson.toJson(purchasesobj));
			////////////System.out.println("Response String of create_Purchase_Payments:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("PAYMENTS_CREATED_SUCCESSFULLY").trim();
			}
			else{
				resultStr = Response.getResponseMessage(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
	}
	
	//Added by Surya.k
	public String updatePurchasesAndPayments(PurchasePaymentMaster purchasesobj){
		String resultStr = null;
		try {

			purchasesobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
            resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_Purchase_Payments"), gson.toJson(purchasesobj));

			////////////System.out.println("Request String update_Purchase_Payments:::::::::::"+gson.toJson(purchasesobj));
			////////////System.out.println("Response String of update_Purchase_Payments:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("PAYMENTS_UPDATED_SUCCESSFULLY").trim();
			}
			else{
				resultStr = Response.getResponseMessage(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
	}
	
	//Added by Surya.k
		public List<SalesAndPaymentsMaster> getSalesPayments(String transactionId,String organization, String zone ,String location,String category,String supplier,String status,String startDate,String endDate,String startIndex,String searchCriteria,String customerID){
			String resultStr = null;
			String result = null;
			SalesAndPaymentsMaster salesPaymentMaster=null;
			try {

				salesPaymentMaster = new SalesAndPaymentsMaster();
				salesPaymentMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				salesPaymentMaster.setMaxRecords("10");
				if(startIndex.equals(""))
					salesPaymentMaster.setStartIndex("0");
				else
					salesPaymentMaster.setStartIndex(startIndex);
				salesPaymentMaster.setOrganizationId(organization);
				salesPaymentMaster.setZoneId(zone);
				salesPaymentMaster.setLocation(location);
				salesPaymentMaster.setSearchCritaria(searchCriteria);
				//salesPaymentMaster.setSupplierName(supplier);
				salesPaymentMaster.setStatus(status);
				salesPaymentMaster.setStartDate(startDate);
				salesPaymentMaster.setEndDate(endDate);
				salesPaymentMaster.setTransactionId(transactionId);
				salesPaymentMaster.setSaveReport(true);
				salesPaymentMaster.setCustomerId(customerID);
				RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
	            resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Sales_Payments"), gson.toJson(salesPaymentMaster),"GET");

				////////////System.out.println("Request String get_Sales_Payments:::::::::::"+gson.toJson(salesPaymentMaster));
				////////////System.out.println("Response String of get_Sales_Payments:::::::::::"+resultStr);
				String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					
					salesPaymentMaster = gson.fromJson(resultStr, SalesAndPaymentsMaster.class);
					result= Response.getResponseMessage(resultStr);
					salesPaymentMaster.getSalesAndPaymentsMasters().get(0).setTotalRecords(salesPaymentMaster.getTotalRecords());
					salesPaymentMaster.getSalesAndPaymentsMasters().get(0).setTotalInvoiceAmount(salesPaymentMaster.getTotalInvoiceAmount());
					salesPaymentMaster.getSalesAndPaymentsMasters().get(0).setTotalNetCost(salesPaymentMaster.getTotalNetCost());
					salesPaymentMaster.getSalesAndPaymentsMasters().get(0).setTotalDiscount(salesPaymentMaster.getTotalDiscount());
					salesPaymentMaster.getSalesAndPaymentsMasters().get(0).setFilePath(salesPaymentMaster.getFilePath());
				}
				else{
					resultStr = Response.getResponseMessage(resultStr);
					result= Response.getResponseMessage(resultStr);
					// log.info(resultStr);
					salesPaymentMaster.getSalesAndPaymentsMasters().get(0).setTotalInvoiceAmount(0);
					salesPaymentMaster.getSalesAndPaymentsMasters().get(0).setFilePath("");
				}
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			////////////System.out.println("Request String get_Purchase_Payments:::::::::::"+gson.toJson(salesPaymentMaster.getSalesAndPaymentsMasters()));
			return salesPaymentMaster.getSalesAndPaymentsMasters();
		}
		
		//Added by Surya.k
		public String createSalesAndPayments(SalesAndPaymentsMaster paymentsobj){
			String resultStr = null;
			try {

				paymentsobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				
				
				RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
	            resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_Sales_Payments"), gson.toJson(paymentsobj));

				////////////System.out.println("Request String create_Sales_Payments:::::::::::"+gson.toJson(paymentsobj));
				////////////System.out.println("Response String of create_Sales_Payments:::::::::::"+resultStr);
				String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					resultStr = AppProperties.getAppMessageByProperty("PAYMENTS_CREATED_SUCCESSFULLY").trim();
				}
				else{
					resultStr = Response.getResponseMessage(resultStr);
				}
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return resultStr;
		}
		
		//Added by Surya.k
		public String updateSalesAndPayments(SalesAndPaymentsMaster paymentsobj){
			String resultStr = null;
			try {

				paymentsobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				
				
				RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
	            resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_Sales_Payments"), gson.toJson(paymentsobj));

				////////////System.out.println("Request String update_Sales_Payments:::::::::::"+gson.toJson(paymentsobj));
				////////////System.out.println("Response String of update_Sales_Payments:::::::::::"+resultStr);
				String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					resultStr = AppProperties.getAppMessageByProperty("PAYMENTS_UPDATED_SUCCESSFULLY").trim();
				}
				else{
					resultStr = Response.getResponseMessage(resultStr);
				}
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return resultStr;
		}
		
	

		//Added by Surya.k
			public List<AdvanceAndPayments> getAdvancesAndPayments(String transactionId,String organization, String zone ,String location,String advanceType,String advanceGiven,String status,String startDate,String endDate,String startIndex,String searchCriteria,String bankName){
				String resultStr = null;
				String result = null;
				AdvanceAndPayments salesPaymentMaster=null;
				try {

					salesPaymentMaster = new AdvanceAndPayments();
					salesPaymentMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
					salesPaymentMaster.setMaxRecords("10");
					if(startIndex.equals(""))
						salesPaymentMaster.setStartIndex("0");
					else
						salesPaymentMaster.setStartIndex(startIndex);
					salesPaymentMaster.setOrganizationId(organization);
					salesPaymentMaster.setZoneId(zone);
					salesPaymentMaster.setLocation(location);
					salesPaymentMaster.setSearchCritaria(searchCriteria);
					salesPaymentMaster.setAdvanceGivenTo(advanceGiven);
					salesPaymentMaster.setAdvanceType(advanceType);
					salesPaymentMaster.setStatus(status);
					salesPaymentMaster.setStartDate(startDate);
					salesPaymentMaster.setEndDate(endDate);
					salesPaymentMaster.setTransactionId(transactionId);
					salesPaymentMaster.setSaveReport(true);
					salesPaymentMaster.setBankAccount(bankName);
					RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
		            resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_AdvanceAndPaymentDetails"), gson.toJson(salesPaymentMaster),"GET");

					////////////System.out.println("Request String get_AdvanceAndPaymentDetails:::::::::::"+gson.toJson(salesPaymentMaster));
					////////////System.out.println("Response String of get_AdvanceAndPaymentDetails:::::::::::"+resultStr);
					String responseCode = Response.getResponseCode(resultStr);
					if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
						
						salesPaymentMaster = gson.fromJson(resultStr, AdvanceAndPayments.class);
						result= Response.getResponseMessage(resultStr);
						salesPaymentMaster.getAdvanceAndPayments().get(0).setTotalRecords(salesPaymentMaster.getTotalRecords());
						
					}
					else{
						resultStr = Response.getResponseMessage(resultStr);
						result= Response.getResponseMessage(resultStr);
					
					}
				} catch (NoSuchElementException nse) {
					nse.printStackTrace();
					resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
				} catch(Exception e){
					e.printStackTrace();
				}
				////////////System.out.println("Request String get_Purchase_Payments:::::::::::"+gson.toJson(salesPaymentMaster.getAdvanceAndPayments()));
				return salesPaymentMaster.getAdvanceAndPayments();
			}
			
			//Added by Surya.k
			public String createAdvancesAndPayments(AdvanceAndPayments paymentsobj){
				String resultStr = null;
				try {

					paymentsobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
					
					
					RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
		            resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_AdvanceAndPayments"), gson.toJson(paymentsobj));

					////////////System.out.println("Request String create_AdvanceAndPayments:::::::::::"+gson.toJson(paymentsobj));
					////////////System.out.println("Response String of create_AdvanceAndPayments:::::::::::"+resultStr);
					String responseCode = Response.getResponseCode(resultStr);
					if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
						resultStr = AppProperties.getAppMessageByProperty("PAYMENTS_CREATED_SUCCESSFULLY").trim();
					}
					else{
						resultStr = Response.getResponseMessage(resultStr);
					}
				} catch (NoSuchElementException nse) {
					nse.printStackTrace();
					resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
				} catch(Exception e){
					e.printStackTrace();
				}
				return resultStr;
			}
			
			//Added by Surya.k
			public String updateAdvancesAndPayments(AdvanceAndPayments paymentsobj){
				String resultStr = null;
				try {

					paymentsobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
					
					
					RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
		            resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_AdvanceAndPayments"), gson.toJson(paymentsobj));

					////////////System.out.println("Request String update_AdvanceAndPayments:::::::::::"+gson.toJson(paymentsobj));
					////////////System.out.println("Response String of update_AdvanceAndPayments:::::::::::"+resultStr);
					String responseCode = Response.getResponseCode(resultStr);
					if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
						resultStr = AppProperties.getAppMessageByProperty("PAYMENTS_UPDATED_SUCCESSFULLY").trim();
					}
					else{
						resultStr = Response.getResponseMessage(resultStr);
					}
				} catch (NoSuchElementException nse) {
					nse.printStackTrace();
					resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
				} catch(Exception e){
					e.printStackTrace();
				}
				return resultStr;
			}
			
	
	//Added by Surya.k on 27/04/2019 Accounting Assets SubLedger flows
	
	public List<SubAccountTypeMaster> getSubLedger(String accountId,String subAccountId,String accountType,String status,String startDate,String endDate,String startIndex){
		String resultStr = null;
		String result = null;
		SubAccountTypeMaster subAccountTypeMaster =null;
		try {

			subAccountTypeMaster = new SubAccountTypeMaster();
			subAccountTypeMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			subAccountTypeMaster.setMaxRecords(10);
			if(startIndex.equals(""))
				subAccountTypeMaster.setStartIndex(0);
			else
				subAccountTypeMaster.setStartIndex(Integer.parseInt(startIndex));
			subAccountTypeMaster.setAccountId(accountId);
			subAccountTypeMaster.setSubAccountTypeId(subAccountId);
			subAccountTypeMaster.setAccountType(accountType);
			subAccountTypeMaster.setSubAccountTypeStatus(status);
			subAccountTypeMaster.setStartDate(startDate);
			subAccountTypeMaster.setEndDate(endDate);
		
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			////////System.out.println("Request String get_sub_account_types:::::::::::"+gson.toJson(subAccountTypeMaster));
            resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("get_sub_account_types"), gson.toJson(subAccountTypeMaster));

			////////System.out.println("Response String of get_sub_account_types:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				
				subAccountTypeMaster = gson.fromJson(resultStr, SubAccountTypeMaster.class);
				result= Response.getResponseMessage(resultStr);
				subAccountTypeMaster.getAccountTypeMasters().get(0).setTotalRecords(subAccountTypeMaster.getTotalRecords());
			}
			else{
				resultStr = Response.getResponseMessage(resultStr);
				result= Response.getResponseMessage(resultStr);
				// log.info(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return subAccountTypeMaster.getAccountTypeMasters();
	}
	public String createSubLedgerMaster(String customerId,String emailId,String accountId,String subaccountId,String subaccountName,String subdiscription,String accountType,String Status) {
		String resultStr = null;
		String resultStr1 = null;
		try {
			
			SubAccountTypeMaster OrgMasterMaster = new SubAccountTypeMaster();
			OrgMasterMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			OrgMasterMaster.setAccountId(accountId);
			OrgMasterMaster.setSubAccountTypeId(subaccountId);
			OrgMasterMaster.setAccountName(subaccountName);
			OrgMasterMaster.setAccountDescription(subdiscription);
			OrgMasterMaster.setAccountType(accountType);
			OrgMasterMaster.setSubAccountTypeStatus(Status);
			OrgMasterMaster.setStatus(true);
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			
			resultStr1 = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_sub_account_types"), gson.toJson(OrgMasterMaster));
		
			String responseCode = Response.getResponseCode(resultStr1);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("ACCOUNT_MASTER_SUCCESSFULLY").trim();
			}
			else{
				resultStr = Response.getResponseMessage(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
	}
	public String editSubLedgerMaster(String customerId,String emailId,String accountId,String subaccountId,String subaccountName,String subdiscription,String accountType,String Status) {
		String resultStr = null;
		String resultStr1 = null;
		try {
			
			SubAccountTypeMaster OrgMasterMaster = new SubAccountTypeMaster();
			OrgMasterMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			OrgMasterMaster.setAccountId(accountId);
			OrgMasterMaster.setSubAccountTypeId(subaccountId);
			OrgMasterMaster.setAccountName(subaccountName);
			OrgMasterMaster.setAccountDescription(subdiscription);
			OrgMasterMaster.setAccountType(accountType);
			OrgMasterMaster.setSubAccountTypeStatus(Status);
			OrgMasterMaster.setStatus(true);
			
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			
			resultStr1 = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_sub_account_types"), gson.toJson(OrgMasterMaster));
		
			String responseCode = Response.getResponseCode(resultStr1);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("ACCOUNT_UPDATE_SUCCESSFULLY").trim();
			}
			else{
				resultStr = Response.getResponseMessage(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
	}
	
		//Added by Surya.k on 15/05/2019
		public List<DebitNoteMaster> getDebitNote()
		{
			String resultStr = null;
			String result = null;
			List<String> s=null;
			DebitNoteMaster debitNoteMaster = null;
			try {

				debitNoteMaster = new DebitNoteMaster();
				debitNoteMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				debitNoteMaster.setMaxRecords("10");
				debitNoteMaster.setStartIndex("0");
				
				//debitNoteMaster.setOrganizationId(organization);
				//debitNoteMaster.setZoneId(zone);
				//debitNoteMaster.setLocation(location);
				//purchasePaymentMaster.setcate(orgination);
				//debitNoteMaster.setSupplierName(supplier);
				//debitNoteMaster.setStatus(status);
				//debitNoteMaster.setStartDate(startDate);
				//debitNoteMaster.setEndDate(endDate);
				//debitNoteMaster.setTransactionId(transactionId);
				//debitNoteMaster.setSaveReport(true);
				RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
	            resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("create_debit_Note"), gson.toJson(debitNoteMaster),"GET");

				////////////System.out.println("Request String get_debit_Note:::::::::::"+gson.toJson(debitNoteMaster));
				////////////System.out.println("Response String of get_debit_Note:::::::::::"+resultStr);
				String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					
					debitNoteMaster = gson.fromJson(resultStr, DebitNoteMaster.class);
					result= Response.getResponseMessage(resultStr);
					//debitNoteMaster.getDebitNoteMasters().get(0).setTotalRecords(debitNoteMaster.getTotalRecords());
					/*debitNoteMaster.getDebitNoteMasters().get(0).setTotalInvoiceAmount(purchasePaymentMaster.getTotalInvoiceAmount());
					debitNoteMaster.getDebitNoteMasters().get(0).setTotalNetCost(purchasePaymentMaster.getTotalNetCost());
					debitNoteMaster.getDebitNoteMasters().get(0).setTotalDiscount(purchasePaymentMaster.getTotalDiscount());
					debitNoteMaster.getDebitNoteMasters().get(0).setFilePath(purchasePaymentMaster.getFilePath());*/
					debitNoteMaster.getDebitNoteMasters().get(0).setTotalRecords(debitNoteMaster.getTotalRecords());		
				}
				else{
					resultStr = Response.getResponseMessage(resultStr);
					result= Response.getResponseMessage(resultStr);
					// log.info(resultStr);
					//debitNoteMaster.getDebitNoteMasters().get(0).setTotalInvoiceAmount(0);
					//debitNoteMaster.getDebitNoteMasters().get(0).setFilePath("");
				}
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
					
			return debitNoteMaster.getDebitNoteMasters();
		}
		public List<DebitNoteMaster> getDebitNoteSummary(String zone,String location,String startDate,String endDate,String searchCreteria,String maxrecords,String index,String refNum)
		{
			String resultStr = null;
			String result = null;
			DebitNoteMaster debitNoteMaster = null;
			try {

				debitNoteMaster = new DebitNoteMaster();
				debitNoteMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				debitNoteMaster.setMaxRecords("10");
				if(index.equals(""))
					debitNoteMaster.setStartIndex("0");
				else
					debitNoteMaster.setStartIndex(index);
				
				//debitNoteMaster.setZoneId(zone);
				debitNoteMaster.setLocation(location);
				debitNoteMaster.setStartDate(startDate);
				debitNoteMaster.setEndDate(endDate);
				debitNoteMaster.setSearchCritaria(searchCreteria);
				debitNoteMaster.setDebitNoteRef(refNum);
				
				RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
	            resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_debit_Note"), gson.toJson(debitNoteMaster),"GET");

				////////////System.out.println("Request String get_debit_Note:::::::::::"+gson.toJson(debitNoteMaster));
				////////////System.out.println("Response String of get_debit_Note:::::::::::"+resultStr);
				String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					
					debitNoteMaster = gson.fromJson(resultStr, DebitNoteMaster.class);
					result= Response.getResponseMessage(resultStr);
					
					debitNoteMaster.getDebitNoteMasters().get(0).setTotalRecords(debitNoteMaster.getTotalRecords());		
				}
				else{
					resultStr = Response.getResponseMessage(resultStr);
					result= Response.getResponseMessage(resultStr);
					// log.info(resultStr);
				}
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
					
			return debitNoteMaster.getDebitNoteMasters();
		}
		
		
		public String createDebitMaster(DebitNoteMaster debitNoteMasterobj){
			String resultStr = null;
			try {

				debitNoteMasterobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				
				
				RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
				//////System.out.println("Request String create_debit_Note:::::::::::"+gson.toJson(debitNoteMasterobj));
	            resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_debit_Note"), gson.toJson(debitNoteMasterobj));

				//////System.out.println("Response String of create_debit_Note:::::::::::"+resultStr);
				String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					resultStr = AppProperties.getAppMessageByProperty("DEBITNOTE_CREATED_SUCCESSFULLY").trim();
				}
				else{
					resultStr = Response.getResponseMessage(resultStr);
				}
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return resultStr;
		}
		


		//Added by Surya.k on 15/05/2019
		public List<CreditNoteMaster> getCreditNoteDetails()
		{
			String resultStr = null;
			String result = null;
			List<String> s=null;
			CreditNoteMaster creditNoteMaster = null;
			try {

				creditNoteMaster = new CreditNoteMaster();
				creditNoteMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				creditNoteMaster.setMaxRecords("10");
				creditNoteMaster.setStartIndex("0");
				
			
				RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
	            resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_credit_Note"), gson.toJson(creditNoteMaster),"GET");

				////////////System.out.println("Request String get_debit_Note:::::::::::"+gson.toJson(creditNoteMaster));
				////////////System.out.println("Response String of get_debit_Note:::::::::::"+resultStr);
				String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					
					creditNoteMaster = gson.fromJson(resultStr, CreditNoteMaster.class);
					result= Response.getResponseMessage(resultStr);
				
					creditNoteMaster.getCreditNoteMasters().get(0).setTotalRecords(creditNoteMaster.getTotalRecords());		
				}
				else{
					resultStr = Response.getResponseMessage(resultStr);
					result= Response.getResponseMessage(resultStr);
				}
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
					
			return creditNoteMaster.getCreditNoteMasters();
		}
		public List<CreditNoteMaster> getCreditNoteSummary(String zone,String location,String startDate,String endDate,String searchCreteria,String maxrecords,String index,String refNum)
		{
			String resultStr = null;
			String result = null;
			CreditNoteMaster creditNoteMaster = null;
			try {

				creditNoteMaster = new CreditNoteMaster();
				creditNoteMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				creditNoteMaster.setMaxRecords("10");
				if(index.equals(""))
					creditNoteMaster.setStartIndex("0");
				else
					creditNoteMaster.setStartIndex(index);
				
				creditNoteMaster.setLocation(location);
				creditNoteMaster.setStartDate(startDate);
				creditNoteMaster.setEndDate(endDate);
				creditNoteMaster.setSearchCritaria(searchCreteria);
				creditNoteMaster.setCreditNoteRef(refNum);
				
				//////System.out.println("Request String get_debit_Note:::::::::::"+gson.toJson(creditNoteMaster));
				RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
	            resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_credit_Note"), gson.toJson(creditNoteMaster),"GET");

				//////System.out.println("Response String of get_debit_Note:::::::::::"+resultStr);
				String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					
					creditNoteMaster = gson.fromJson(resultStr, CreditNoteMaster.class);
					result= Response.getResponseMessage(resultStr);
					
					creditNoteMaster.getCreditNoteMasters().get(0).setTotalRecords(creditNoteMaster.getTotalRecords());		
				}
				else{
					resultStr = Response.getResponseMessage(resultStr);
					result= Response.getResponseMessage(resultStr);
				}
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
					
			return creditNoteMaster.getCreditNoteMasters();
		}
		
		
		public String createCreditNote(CreditNoteMaster creditNoteMasterobj){
			String resultStr = null;
			try {

				creditNoteMasterobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				
				
				RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
				//////System.out.println("Request String create_debit_Note:::::::::::"+gson.toJson(creditNoteMasterobj));
	            resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_credit_Note"), gson.toJson(creditNoteMasterobj));

				//////System.out.println("Response String of create_debit_Note:::::::::::"+resultStr);
				String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					resultStr = AppProperties.getAppMessageByProperty("CREDITNOTE_CREATED_SUCCESSFULLY").trim();
				}
				else{
					resultStr = Response.getResponseMessage(resultStr);
				}
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return resultStr;
		}
		
		
		
		public MasterDataImportsAndExportsBean uploadBankStatement(String filePath,String customerId,String emailId){
			String result = null;
			MasterDataImportsAndExportsBean masterDataImportsAndExportsBean=new MasterDataImportsAndExportsBean();
			try {
				RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
				masterDataImportsAndExportsBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				masterDataImportsAndExportsBean.setUploadedfilePath(filePath);
				masterDataImportsAndExportsBean.setUploadedFilePath(filePath);
				masterDataImportsAndExportsBean.setStartDate(DateUtil.getDateFromYYYYMMDDHHMMSS(new Date()));
				result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("upload_bank_statement"),gson.toJson(masterDataImportsAndExportsBean));
	           // resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_debit_Note"), gson.toJson(debitNoteMasterobj));

				////////////System.out.println("Request String upload_bank_statement:::::::::::"+gson.toJson(masterDataImportsAndExportsBean));
				////////////System.out.println("Response String of upload_bank_statement:::::::::::"+result);
				masterDataImportsAndExportsBean = new Gson().fromJson(result, MasterDataImportsAndExportsBean.class);
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
			return masterDataImportsAndExportsBean;
		}
		

		public List<AccountTypeMaster> getBankBook() {
			String resultStr = null;
			AccountTypeMaster AssetAccounts=null;
			
			try {

				AssetAccounts = new AccountTypeMaster();
				AssetAccounts.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				AssetAccounts.setBankBookStatus("yes");
				AssetAccounts.setMaxRecords(10);
				AssetAccounts.setStartIndex(0);
				
				RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
				resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("get_account_master"), gson.toJson(AssetAccounts));
				////////////System.out.println("Request String::::::::::::"+gson.toJson(AssetAccounts));
				////////////System.out.println("Response String of Asset Master:::::::::::"+resultStr);
				String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					
					AssetAccounts = gson.fromJson(resultStr, AccountTypeMaster.class);
					
					AssetAccounts.getAccountTypeMasters().get(0).setTotalRecords(AssetAccounts.getTotalRecords());
				}
				else{
					resultStr = Response.getResponseMessage(resultStr);
				}
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return AssetAccounts.getAccountTypeMasters();
		}
		
		
		public ReconciliationMaster startReconciliation(String AccountId,String AccountName,String startDate,String endDate){
			String resultStr = null;
			ReconciliationMaster responceObj =new ReconciliationMaster();
			try {
				ReconciliationMaster requestObj =new ReconciliationMaster();
				
				requestObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				requestObj.setAccountId(AccountId);
				requestObj.setAccountName(AccountName);
				requestObj.setStartDate(startDate);
				requestObj.setEndDate(endDate);
				
				
				RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
	            resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("start_reconciliation"), gson.toJson(requestObj));

				////////////System.out.println("Request String start_reconciliation:::::::::::"+gson.toJson(requestObj));
				////////////System.out.println("Response String of start_reconciliation:::::::::::"+resultStr);
				String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					//resultStr = AppProperties.getAppMessageByProperty("DEBITNOTE_CREATED_SUCCESSFULLY").trim();
					responceObj = gson.fromJson(resultStr, ReconciliationMaster.class);
				}
				else{
					resultStr = Response.getResponseMessage(resultStr);
				}
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return responceObj;
		}
		
		public String saveReconciliation(ReconciliationMaster ReconciliationMasterobj){
			String resultStr = null;
			try {

				ReconciliationMasterobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				for(int i=0;i<ReconciliationMasterobj.getReconciliationDetails().size();i++){
					if(ReconciliationMasterobj.getReconciliationDetails().get(i).getBankTransactionStr().equals("0")){
						ReconciliationMasterobj.getReconciliationDetails().get(i).setBankTransaction(false);
					}else{
						ReconciliationMasterobj.getReconciliationDetails().get(i).setBankTransaction(true);
					}
				}
				
				
				RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
	            resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_reconciliation"), gson.toJson(ReconciliationMasterobj));

				////////////System.out.println("Request String create_reconciliation:::::::::::"+gson.toJson(ReconciliationMasterobj));
				////////////System.out.println("Response String of create_reconciliation:::::::::::"+resultStr);
				String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					resultStr = AppProperties.getAppMessageByProperty("RECONCILIATION_SAVED_SUCCESSFULLY").trim();
				}
				else{
					resultStr = Response.getResponseMessage(resultStr);
				}
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return resultStr;
		}

		//SubAccountTransactions
		public String createSubAccountTransactions(String customerId,String emailId,String accountId,String accountName,String location,String discription,String txnType,String txnDate,String txnValue,String accountType) {
			String resultStr = null;
			try {
				
				AssetAccounts OrgMasterMaster = new AssetAccounts();
				OrgMasterMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				
				OrgMasterMaster.setRemarks(discription);
				OrgMasterMaster.setAccountId(accountId);
				OrgMasterMaster.setAccountName(accountName);
				OrgMasterMaster.setLocationId(location);
				if(txnType.equalsIgnoreCase("credit")){
					OrgMasterMaster.setCreditAmount(new BigDecimal(txnValue));
					OrgMasterMaster.setDebitAmount(new BigDecimal(0));
				}else{
					OrgMasterMaster.setCreditAmount(new BigDecimal(0));
					OrgMasterMaster.setDebitAmount(new BigDecimal(txnValue));
				}
				OrgMasterMaster.setStatus(true);
				
				
				RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
				if(accountType.equalsIgnoreCase("Assets")){
					resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_subassets_master"), gson.toJson(OrgMasterMaster));

				}else if(accountType.equalsIgnoreCase("Liability")){
					resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_subliability_master"), gson.toJson(OrgMasterMaster));

				}else if(accountType.equalsIgnoreCase("Income")){
					resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_subincome_master"), gson.toJson(OrgMasterMaster));

				}else{
					resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_subexpences_master"), gson.toJson(OrgMasterMaster));

				}
				////////////System.out.println("Request String::::::::::::"+gson.toJson(OrgMasterMaster));
				////////////System.out.println("Response String:::::::::::response create Account"+resultStr);
				String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					resultStr = AppProperties.getAppMessageByProperty("ACCOUNT_MASTER_SUCCESSFULLY").trim();
				}
				else{
					resultStr = Response.getResponseMessage(resultStr);
				}
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return resultStr;
		}

		
		public List<AssetAccounts> getSubAccountTransactions(String customerIdStr, String emailIdStr ,String AccountId,String OrganizationId,String zone,String location,String txnType,String start_date,String end_date,String startIndex,String accountType) {
			
			String resultStr = null;
			AssetAccounts AssetAccounts=null;
			
			try {
				AssetAccounts = new AssetAccounts();
				AssetAccounts.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				AssetAccounts.setMaxRecords("10");
				if(startIndex.equals(""))
					AssetAccounts.setStartIndex(0);
				else
					AssetAccounts.setStartIndex(Integer.parseInt(startIndex));
				AssetAccounts.setStatus(true);
				AssetAccounts.setTransactionStatus("Active");
				AssetAccounts.setAccountId(AccountId);
				AssetAccounts.setOrganizationId(OrganizationId);
				//AssetAccounts.setzone(OrganizationId);
				AssetAccounts.setTxnType(txnType);
				AssetAccounts.setLocationId(location);
				AssetAccounts.setStartDate(start_date);
				AssetAccounts.setEndDate(end_date);
				
				RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
				if(accountType.equalsIgnoreCase("Assets")){
					resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("get_subassets_master"), gson.toJson(AssetAccounts));
					
					String responseCode = Response.getResponseCode(resultStr);
					if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
						
						AssetAccounts = gson.fromJson(resultStr, AssetAccounts.class);
						AssetAccounts.getAssetAccounts().get(0).setTotalRecords(AssetAccounts.getTotalRecords());	
					}
					else{
						resultStr = Response.getResponseMessage(resultStr);
					}
					return AssetAccounts.getAssetAccounts();
				}else if(accountType.equalsIgnoreCase("Liability")){
					resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("get_subliability_master"), gson.toJson(AssetAccounts));

					String responseCode = Response.getResponseCode(resultStr);
					if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
						
						AssetAccounts = gson.fromJson(resultStr, AssetAccounts.class);
						AssetAccounts.getLiabilityAccounts().get(0).setTotalRecords(AssetAccounts.getTotalRecords());	
					}
					else{
						resultStr = Response.getResponseMessage(resultStr);
					}
					return AssetAccounts.getLiabilityAccounts();
					
				}else if(accountType.equalsIgnoreCase("Income")){
					resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("get_subincome_master"), gson.toJson(AssetAccounts));
					String responseCode = Response.getResponseCode(resultStr);
					if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
						
						AssetAccounts = gson.fromJson(resultStr, AssetAccounts.class);
						AssetAccounts.getIncomeAccounts().get(0).setTotalRecords(AssetAccounts.getTotalRecords());	
					}
					else{
						resultStr = Response.getResponseMessage(resultStr);
					}
					return AssetAccounts.getIncomeAccounts();
				}else{
					resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("get_subexpences_master"), gson.toJson(AssetAccounts));
					String responseCode = Response.getResponseCode(resultStr);
					if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
						
						AssetAccounts = gson.fromJson(resultStr, AssetAccounts.class);
						AssetAccounts.getExpensesAccounts().get(0).setTotalRecords(AssetAccounts.getTotalRecords());	
					}
					else{
						resultStr = Response.getResponseMessage(resultStr);
					}
					return AssetAccounts.getExpensesAccounts();
				}
				
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return AssetAccounts.getAssetAccounts();
		}

		public String getPurcphasePaymentsPDF(String customerIdStr, String emailIdStr ,String refId,String flowname){
			String resultStr = null;
			String result = null;
			String pdfurl = "";
			PurchasePaymentMaster purchasePaymentMaster=null;
			try {

				purchasePaymentMaster = new PurchasePaymentMaster();
				purchasePaymentMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				purchasePaymentMaster.setMaxRecords("10");
				purchasePaymentMaster.setStartIndex("0");
				purchasePaymentMaster.setTransactionId(refId);
				
				RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
	            resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Purchases_PaymentsPdf"), gson.toJson(purchasePaymentMaster),"GET");

				////////////System.out.println("Request String sync_account_transaction:::::::::::"+gson.toJson(purchasePaymentMaster));
				////////////System.out.println("Response String of sync_account_transaction:::::::::::"+resultStr);
				String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					
					purchasePaymentMaster = gson.fromJson(resultStr, PurchasePaymentMaster.class);
					result= Response.getResponseMessage(resultStr);
					pdfurl =purchasePaymentMaster.getUrlOfPdf();
				}
				else{
					resultStr = Response.getResponseMessage(resultStr);
					result= Response.getResponseMessage(resultStr);
				}
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return pdfurl;
		}
		

		public String getSalesPaymentsPDF(String customerIdStr, String emailIdStr ,String refId,String flowname){
			String resultStr = null;
			String result = null;
			String pdfurl = "";
			SalesAndPaymentsMaster salesAndPaymentsMaster=null;
			try {

				salesAndPaymentsMaster = new SalesAndPaymentsMaster();
				salesAndPaymentsMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				salesAndPaymentsMaster.setMaxRecords("10");
				salesAndPaymentsMaster.setStartIndex("0");
				salesAndPaymentsMaster.setTransactionId(refId);
				
				RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
	            resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_SalesAndPaymentsPDF"), gson.toJson(salesAndPaymentsMaster),"GET");

				////////////System.out.println("Request String sync_account_transaction:::::::::::"+gson.toJson(salesAndPaymentsMaster));
				////////////System.out.println("Response String of sync_account_transaction:::::::::::"+resultStr);
				String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					
					salesAndPaymentsMaster = gson.fromJson(resultStr, SalesAndPaymentsMaster.class);
					result= Response.getResponseMessage(resultStr);
					pdfurl =salesAndPaymentsMaster.getUrlOfPdf();
				}
				else{
					resultStr = Response.getResponseMessage(resultStr);
					result= Response.getResponseMessage(resultStr);
				}
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return pdfurl;
		}
		

		
		public String getStockIssuePDF(String customerIdStr, String emailIdStr ,String refId,String flowname){
			String resultStr = null;
			String result = null;
			String pdfurl = "";
			StockIssues stockIssues=null;
			try {

				stockIssues = new StockIssues();
				stockIssues.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				//stockIssues.setMaxRecords("10");
				stockIssues.setStartIndex("0");
				stockIssues.setGoods_issue_ref_num(refId);
				
				RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
	            resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_WHStockIssuePDF"), gson.toJson(stockIssues),"GET");

				//////System.out.println("Request String get_WHStockIssuePDF:::::::::::"+gson.toJson(stockIssues));
				//////System.out.println("Response String of get_WHStockIssuePDF:::::::::::"+resultStr);
				String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					
					stockIssues = gson.fromJson(resultStr, StockIssues.class);
					result= Response.getResponseMessage(resultStr);
					pdfurl =stockIssues.getUrlOfPdf();
				}
				else{
					resultStr = Response.getResponseMessage(resultStr);
					result= Response.getResponseMessage(resultStr);
				}
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return pdfurl;
		}
		
		

		//Added by Surya.k
			public PettyCashBook getPettyCashBook(String transactionId,String organization, String zone ,String location,String category,String startDate,String endDate,String startIndex,String searchCriteria,String file){
				String resultStr = null;
				String result = null;
				PettyCashBook pettyCashBook=null;
				try {

					pettyCashBook = new PettyCashBook();
					pettyCashBook.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
					pettyCashBook.setMaxRecords("10");
					if(startIndex.equals(""))
						pettyCashBook.setStartIndex("0");
					else
						pettyCashBook.setStartIndex(startIndex);
					pettyCashBook.setOrganizationId(organization);
					//pettyCashBook.setZoneId(zone);
					pettyCashBook.setLocation(location);
					pettyCashBook.setSearchCritaria(searchCriteria);
					pettyCashBook.setStartDate(startDate);
					pettyCashBook.setEndDate(endDate);
					pettyCashBook.setTransactionId(transactionId);
					if(file.equalsIgnoreCase("true"))
						pettyCashBook.setSaveReport(true);
					
					RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
		            resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_PettyCashBookSummary"), gson.toJson(pettyCashBook),"GET");

					////////////System.out.println("Request String get_PettyCashBookSummary:::::::::::"+gson.toJson(pettyCashBook));
					////////////System.out.println("Response String of get_PettyCashBookSummary:::::::::::"+resultStr);
					String responseCode = Response.getResponseCode(resultStr);
					if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
						
						pettyCashBook = gson.fromJson(resultStr, PettyCashBook.class);
						result= Response.getResponseMessage(resultStr);
						if(pettyCashBook.getTotalCashPaymentRecords()<=pettyCashBook.getTotalCashReceiptRecords()){
							pettyCashBook.setTotalRecords((int)(pettyCashBook.getTotalCashReceiptRecords()));
						}else{
							pettyCashBook.setTotalRecords((int)(pettyCashBook.getTotalCashPaymentRecords()));
						}
						
						//pettyCashBook.getSalesAndPaymentsMasters().get(0).setFilePath(pettyCashBook.getFilePath());
					}
					else{
						resultStr = Response.getResponseMessage(resultStr);
						result= Response.getResponseMessage(resultStr);
					//	pettyCashBook.getSalesAndPaymentsMasters().get(0).setFilePath("");
					}
				} catch (NoSuchElementException nse) {
					nse.printStackTrace();
					resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
				} catch(Exception e){
					e.printStackTrace();
				}
				return pettyCashBook;
			}
		
			
			

			//Added by Surya.k
				public PettyCashBook getPettyCashBookDetails(String transactionId){
					String resultStr = null;
					String result = null;
					PettyCashBook pettyCashBook=null;
					try {

						pettyCashBook = new PettyCashBook();
						pettyCashBook.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
						pettyCashBook.setMaxRecords("10");
						
						pettyCashBook.setTransactionId(transactionId);
					
						RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			            resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_PettyCashBookDetails"), gson.toJson(pettyCashBook),"GET");

						////////////System.out.println("Request String get_PettyCashBookSummary:::::::::::"+gson.toJson(pettyCashBook));
						////////////System.out.println("Response String of get_PettyCashBookSummary:::::::::::"+resultStr);
						String responseCode = Response.getResponseCode(resultStr);
						if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
							
							pettyCashBook = gson.fromJson(resultStr, PettyCashBook.class);
							result= Response.getResponseMessage(resultStr);
							
							
							//pettyCashBook.getSalesAndPaymentsMasters().get(0).setFilePath(pettyCashBook.getFilePath());
						}
						else{
							resultStr = Response.getResponseMessage(resultStr);
							result= Response.getResponseMessage(resultStr);
						//	pettyCashBook.getSalesAndPaymentsMasters().get(0).setFilePath("");
						}
					} catch (NoSuchElementException nse) {
						nse.printStackTrace();
						resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
					} catch(Exception e){
						e.printStackTrace();
					}
					return pettyCashBook;
				}
			
			//Added by Surya.k
			public String createPettyCashPayments(PettyCashBook pettyCashBook){
				String resultStr = null;
				try {

					pettyCashBook.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
					
					
					RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
		            resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_PettyCashBook"), gson.toJson(pettyCashBook));

					////////////System.out.println("Request String create_Sales_Payments:::::::::::"+gson.toJson(pettyCashBook));
					////////////System.out.println("Response String of create_Sales_Payments:::::::::::"+resultStr);
					String responseCode = Response.getResponseCode(resultStr);
					if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
						resultStr = AppProperties.getAppMessageByProperty("PAYMENTS_CREATED_SUCCESSFULLY").trim();
					}
					else{
						resultStr = Response.getResponseMessage(resultStr);
					}
				} catch (NoSuchElementException nse) {
					nse.printStackTrace();
					resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
				} catch(Exception e){
					e.printStackTrace();
				}
				return resultStr;
			}


			//Added by Surya.k
			public String createPettyCashReceipt(PettyCashBook pettyCashBook){
				String resultStr = null;
				try {

					pettyCashBook.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
					
					
					RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
		            resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_PettyCashReceipt"), gson.toJson(pettyCashBook));

					////////////System.out.println("Request String create_PettyCashReceipt:::::::::::"+gson.toJson(pettyCashBook));
					////////////System.out.println("Response String of create_PettyCashReceipt:::::::::::"+resultStr);
					String responseCode = Response.getResponseCode(resultStr);
					if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
						resultStr = AppProperties.getAppMessageByProperty("PAYMENTS_CREATED_SUCCESSFULLY").trim();
					}
					else{
						resultStr = Response.getResponseMessage(resultStr);
					}
				} catch (NoSuchElementException nse) {
					nse.printStackTrace();
					resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
				} catch(Exception e){
					e.printStackTrace();
				}
				return resultStr;
			}

			//Added by Surya.k
			public String updatePettyCashBook(PettyCashBook pettyCashBook){
				String resultStr = null;
				try {

					pettyCashBook.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
					
					
					RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
		            resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_PettyCashBook"), gson.toJson(pettyCashBook));

					////////////System.out.println("Request String create_PettyCashReceipt:::::::::::"+gson.toJson(pettyCashBook));
					////////////System.out.println("Response String of create_PettyCashReceipt:::::::::::"+resultStr);
					String responseCode = Response.getResponseCode(resultStr);
					if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
						resultStr = AppProperties.getAppMessageByProperty("PAYMENTS_CREATED_SUCCESSFULLY").trim();
					}
					else{
						resultStr = Response.getResponseMessage(resultStr);
					}
				} catch (NoSuchElementException nse) {
					nse.printStackTrace();
					resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
				} catch(Exception e){
					e.printStackTrace();
				}
				return resultStr;
			}
			
		
			/**
			 * 
			 * @author koti b
			 * 
			 *This method is used to call createLocation method of web service and return the response
			 *
			 *
			 **/
			@SuppressWarnings("null")
			public States  getStates(){
				String result = null;
				States masterObj= new States();
				try {
					masterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
					masterObj.setSearchCriteria("");
					masterObj.setStateCode("");
					masterObj.setStateName("");
					
					////////////System.out.println("Request String states:::::::::::"+gson.toJson(masterObj));

					RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
					result = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("view_states"), gson.toJson(masterObj),"GET");
					String responseCode = Response.getResponseCode(result);
				
					////////////System.out.println("Response String states:::::::::::"+result);
	
						masterObj = gson.fromJson(result, States.class);
						
					
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
				return masterObj;
			}

			public ArrayList<TenderMaster> editViewTender(String tendercode,String customerId,String emailId){
				ArrayList<TenderMaster> tenderDetails = null;
				String result = null;
				try{
					TenderMaster tenderBean = new TenderMaster();
					tenderBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
					tenderBean.setTenderCode(tendercode);
					
					////////////System.out.println("Request String :::::::::::" + gson.toJson(tenderBean));
					
					result = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("get_tender_details"), gson.toJson(tenderBean),"GET");

					////////////System.out.println("Response String  :::::::::::::::::::"+result);
					String totalRecords = Response.getResponseTotalRecords(result);
					String responseCode = Response.getResponseCode(result);
					if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
						String responseList = Response.getResponseList(result, "tenderMasters");
						JSONArray jsonResponseArray = new JSONArray(responseList);
						tenderDetails = new ArrayList<TenderMaster>();
						for (int i=0; i<jsonResponseArray.length(); i++) {
							tenderBean = gson.fromJson(jsonResponseArray.getString(i), TenderMaster.class);
						//	tenderBean.setSlNo(++slNo);
							tenderDetails.add(tenderBean);
						}
						tenderDetails.get(0).setTotalRecords(Integer.parseInt(totalRecords));
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
				return tenderDetails;
			}
			
			


			public ArrayList<TenderMaster> getTender(String searchName,String customerId,String emailId,String index, int maxRecords){
				ArrayList<TenderMaster> tenderDetails = null;
				String result = null;
				try{
					TenderMaster tenderBean = new TenderMaster();
					tenderBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
					tenderBean.setSearchCritaria(searchName);
					tenderBean.setStartIndex(index);
					tenderBean.setMaxRecords(String.valueOf(maxRecords));
					//result = utitlitymaster.getCurrency(gson.toJson(currencyBean));
					////////////System.out.println("Request String ::::get_tender_details:::::::" + gson.toJson(tenderBean));
					
					result = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("get_tender_details"), gson.toJson(tenderBean),"GET");

					////////////System.out.println("Response String  ::::::get_tender_details:::::::::::::"+result);
					String totalRecords = Response.getResponseTotalRecords(result);
					String responseCode = Response.getResponseCode(result);
					if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
						String responseList = Response.getResponseList(result, "tenderMasters");
						JSONArray jsonResponseArray = new JSONArray(responseList);
						tenderDetails = new ArrayList<TenderMaster>();
						int slNo = Integer.parseInt(index);
						for (int i=0; i<jsonResponseArray.length(); i++) {
							tenderBean = gson.fromJson(jsonResponseArray.getString(i), TenderMaster.class);
						//	tenderBean.setSlNo(++slNo);
							tenderDetails.add(tenderBean);
						}
						tenderDetails.get(0).setTotalRecords(Integer.parseInt(totalRecords));
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
				return tenderDetails;
			}
			


			public String createTender(TenderMaster tenderMaster,String customerIdStr, String emailIdStr) {
				String resultStr = null;
				try {
					
					tenderMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
					if(tenderMaster.getReturnTenderStr().equals("1")){
						tenderMaster.setReturnTender(true);
					}
					if(tenderMaster.getAllowOtherReturnTenderStr().equals("1")){
						tenderMaster.setAllowOtherReturnTender(true);
					}
					//////////System.out.println("Request String::::::::::::"+gson.toJson(tenderMaster));
					
					RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
					if(tenderMaster.getOperation().equals("create")){
					resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_tender"), gson.toJson(tenderMaster));
					
					}else{
						resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_tender"), gson.toJson(tenderMaster));
			
					}
					//////////System.out.println("Response String:::::::::::"+resultStr);
					
					String responseCode = Response.getResponseCode(resultStr);
					if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
						if(tenderMaster.getOperation().equals("create")){
							resultStr = AppProperties.getAppMessageByProperty("TENDER_MASTER_CREATE_SUCCESSFULLY").trim();
						}
						else
						{
							resultStr = AppProperties.getAppMessageByProperty("TENDER_MASTER_UPDATE_SUCCESSFULLY").trim();
						}
						
					}
					else{
						//result = "Couldn't create, please try after some time";
						resultStr = Response.getResponseMessage(resultStr);
					}
				} catch (NoSuchElementException nse) {
					nse.printStackTrace();
					resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
				} catch(Exception e){
					e.printStackTrace();
				}
				return resultStr;
			}
			
			


			public String deleteTenderMaster(String customerIdStr,String emailIdStr,String ids){
				String result = null;
				try {
					TenderMaster tenderMaster = new TenderMaster();
					tenderMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
					String[] idsArray = ids.split(",");
					RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
//					
					
					List<String> myList1 = new ArrayList<String>(Arrays.asList(ids.split(",")));
					tenderMaster.setTenderNames(myList1);
					
					
			   ////////////System.out.println("Request String:::::::"+gson.toJson(tenderMaster));
					result = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("delete_tender"), gson.toJson(tenderMaster));
		   ////////////System.out.println("Response String:::::::"+result);
					String responseCode = Response.getResponseCode(result);
					if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
						result = AppProperties.getAppMessageByProperty("TENDER_MASTER_DELETE_SUCCESSFULLY").trim();
					else{
						result = AppProperties.getAppMessageByProperty("DELETE_FAILED").trim();
					}
				}catch (NoSuchElementException nse) {
					nse.printStackTrace();
					result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
				
				} catch(Exception e){
					e.printStackTrace();
				}
				return result;
			}
				
			public String deleteHomepageGroup(String customerId, String emailId, String ids) {
				String result = null;
				try {
					HomePageGroup employeeBean = new HomePageGroup();
					employeeBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
					// restful service connection
					RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
					String[] idsArray = ids.split(",");
					/*List<int> employeeList = new ArrayList<int>();*/
					List<Integer> employeeList=new ArrayList<Integer>();
					for (int i = 0; i < idsArray.length; i++)
						employeeList.add(Integer.parseInt(idsArray[i]));
					employeeBean.setsNos(employeeList);
					String employeeDetailsList = gson.toJson(employeeBean);
					////////System.out.println("REquest String::" + employeeDetailsList);
					String url = AppProperties.getRESTFulCloudServiceURL("delete_homepage_group");
					result = restFulServiceConnectionObj.getResponseFromPost(url, employeeDetailsList);
					// response from service
					////////System.out.println("Response String::" + result);
					String responseCode = Response.getResponseCode(result);
					if (responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
						result = "Homepage group deleted successfully";
				
					}
					else if (responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_FAILED_CODE").trim())){
						result = Response.getResponseMessage(result);
					////////////////System.out.println(result);
					}
				} catch (NoSuchElementException nse) {
					nse.printStackTrace();
					result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
				} catch (Exception e) {
					e.printStackTrace();
					result = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
				}
				return result;
			}
			
			
			public String createStateMaster(States States,String customerIdStr, String emailIdStr) {
				String resultStr = null;
				try {
					States.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			///		System.out.println("createStateMaster Request String::::::::::::"+gson.toJson(States));
					RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
					if(States.getOperation().equals("new")){
					resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("createAndUpdateStateMaster"), gson.toJson(States));
					}else{
						resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("createAndUpdateStateMaster"), gson.toJson(States));
					}
					//////////System.out.println("Response String:::::::::::"+resultStr);
					
					String responseCode = Response.getResponseCode(resultStr);
					if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
						if(States.getOperation().equals("new")){
							resultStr = "State Master Created Successfully";
						}
						else
						{
							resultStr = "State Master Updated Successfully";
						}
					   }
					else{
						//result = "Couldn't create, please try after some time";
						resultStr = Response.getResponseMessage(resultStr);
					}
				} catch (NoSuchElementException nse) {
					nse.printStackTrace();
					resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
				} catch(Exception e){
					e.printStackTrace();
				}
				return resultStr;
			}
		
			
			public String deleteStateMaster(String customerId, String emailId, String ids) {
				String result = null;
			
				try {
					States States = new States();
					States.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
					// restful service connection
					RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
					String[] idsArray = ids.split(",");
					List<String> stateList = new ArrayList<String>();
					for (int i = 0; i < idsArray.length; i++)
						stateList.add(idsArray[i]);
					States.setStateCodes(stateList);
					String stateBeanDetailsList = gson.toJson(States);
		////		System.out.println("REquest String::" + stateBeanDetailsList);
					String url = AppProperties.getRESTFulCloudServiceURL("deleteStateMaster");
					result = restFulServiceConnectionObj.getResponseFromPost(url, stateBeanDetailsList);
		////		System.out.println("Response String::" + result);
				
					String responseCode = Response.getResponseCode(result);
				
					if (responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
						result = "State deleted successfully";
					}
					else if (responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_FAILED_CODE").trim())){
						result = Response.getResponseMessage(result);
					////////////////System.out.println(result);
					}
				} catch (NoSuchElementException nse) {
					nse.printStackTrace();
					result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
				} catch (Exception e) {
					e.printStackTrace();
					result = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
				}
				return result;
			}

			
			
			
			
			
			public String createHsnMaster(HSNMaster hsnMaster,String customerIdStr, String emailIdStr) {
				String resultStr = null;
				try {
					
					hsnMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
					
					////////System.out.println("Request String::::::::::::"+gson.toJson(hsnMaster));
					
					RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
					if(hsnMaster.getOperation().equals("new")){
					resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_hsnmaster"), gson.toJson(hsnMaster));
					
					}else{
						resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_hsnmaster"), gson.toJson(hsnMaster));
			
					}
					//////////System.out.println("Response String:::::::::::"+resultStr);
					
					String responseCode = Response.getResponseCode(resultStr);
					if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
						if(hsnMaster.getOperation().equals("new")){
							resultStr = "HSN Master Created Successfully";
						}
						else
						{
							resultStr = "HSN Master Updated Successfully";
						}
						
					}
					else{
						//result = "Couldn't create, please try after some time";
						resultStr = Response.getResponseMessage(resultStr);
					}
				} catch (NoSuchElementException nse) {
					nse.printStackTrace();
					resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
				} catch(Exception e){
					e.printStackTrace();
				}
				return resultStr;
			}
			
			
			
			public String deleteHSN(String customerId, String emailId, String ids) {
				String result = null;
				try {
					HSNMaster hsnBean = new HSNMaster();
					hsnBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
					// restful service connection
					RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
					String[] idsArray = ids.split(",");
					List<String> hsnList = new ArrayList<String>();
					for (int i = 0; i < idsArray.length; i++)
						hsnList.add(idsArray[i]);
					hsnBean.setHsnCodes(hsnList);
					String hsnBeanDetailsList = gson.toJson(hsnBean);
					////////System.out.println("REquest String::" + hsnBeanDetailsList);
					String url = AppProperties.getRESTFulCloudServiceURL("delete_hsnmaster");
					result = restFulServiceConnectionObj.getResponseFromPost(url, hsnBeanDetailsList);
					// response from service
					////////System.out.println("Response String::" + result);
					String responseCode = Response.getResponseCode(result);
					if (responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
						result = "HSN code deleted successfully";
				
					}
					else if (responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_FAILED_CODE").trim())){
						result = Response.getResponseMessage(result);
					////////////////System.out.println(result);
					}
				} catch (NoSuchElementException nse) {
					nse.printStackTrace();
					result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
				} catch (Exception e) {
					e.printStackTrace();
					result = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
				}
				return result;
			}
		
			
			public String deleteStoreTaxation(String customerId, String emailId, String ids) {
				String result = null;
				try {
					StoreTaxation employeeBean = new StoreTaxation();
					employeeBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
					// restful service connection
					RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
					String[] idsArray = ids.split(",");
					
					List<String> employeeList=new ArrayList<String>();
					for (int i = 0; i < idsArray.length; i++)
						employeeList.add((idsArray[i]));
					employeeBean.setTaxCodes(employeeList);
					String employeeDetailsList = gson.toJson(employeeBean);
					//////System.out.println("REquest String::" + employeeDetailsList);
					String url = AppProperties.getRESTFulCloudServiceURL("delete_store_taxation");
					result = restFulServiceConnectionObj.getResponseFromPost(url, employeeDetailsList);
					// response from service
					//////System.out.println("Response String::" + result);
					String responseCode = Response.getResponseCode(result);
					if (responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
						result = "Store Taxation deleted successfully";
				
					}
					else if (responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_FAILED_CODE").trim())){
						result = Response.getResponseMessage(result);
					////////////////System.out.println(result);
					}
				} catch (NoSuchElementException nse) {
					nse.printStackTrace();
					result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
				} catch (Exception e) {
					e.printStackTrace();
					result = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
				}
				return result;
			}
		
			
			public String deleteWarehouseTaxation(String customerId, String emailId, String ids) {
				String result = null;
				try {
					WarehouseTaxation employeeBean = new WarehouseTaxation();
					employeeBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
					// restful service connection
					RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
					String[] idsArray = ids.split(",");
					/*List<int> employeeList = new ArrayList<int>();*/
					List<String> employeeList=new ArrayList<String>();
					for (int i = 0; i < idsArray.length; i++)
						employeeList.add((idsArray[i]));
					employeeBean.setTaxCodes(employeeList);
					String employeeDetailsList = gson.toJson(employeeBean);
					////////System.out.println("REquest String::" + employeeDetailsList);
					String url = AppProperties.getRESTFulCloudServiceURL("delete_warehouse_taxation");
					result = restFulServiceConnectionObj.getResponseFromPost(url, employeeDetailsList);
					// response from service
					////////System.out.println("Response String::" + result);
					String responseCode = Response.getResponseCode(result);
					if (responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
						result = "Warehouse Taxation deleted successfully";
				
					}
					else if (responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_FAILED_CODE").trim())){
						result = Response.getResponseMessage(result);
					////////////////System.out.println(result);
					}
				} catch (NoSuchElementException nse) {
					nse.printStackTrace();
					result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
				} catch (Exception e) {
					e.printStackTrace();
					result = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
				}
				return result;
			}

			public String getEmployeesByHRMS(String string, String customerId, String emailId, String location) {
				String resultStr="";
				try {
					EmployeeBean employeeBean = new EmployeeBean();
					employeeBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
					employeeBean.setLocation(location);
					//////System.out.println("request string"+gson.toJson(employeeBean));
					resultStr = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("get_HRMS_employee"), gson.toJson(employeeBean),"GET");

					//////System.out.println(resultStr);
					String responseCode = Response.getResponseCode(resultStr);
					if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
						resultStr = Response.getResponseMessage(resultStr);
					else if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_FAILED_CODE").trim()))
						resultStr = Response.getResponseMessage(resultStr);
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
		
			


			public com.tlabs.posweb.beans.Response getFleetMasterDetails(String customerId, String emailId, String index,String location,String maxRecords,String startDate,String endDate,boolean status,String searchCriteria,String fleetId) throws Exception {
				String resultStr = null;
				com.tlabs.posweb.beans.Response response = null;
				try {

					FleetMaster fleetDetailsObj = new FleetMaster();
					fleetDetailsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
					fleetDetailsObj.setStartDateStr(startDate);
					fleetDetailsObj.setEndDateStr(endDate);
					fleetDetailsObj.setSearchCriteria(searchCriteria);
					fleetDetailsObj.setStartIndex(index);
					if(location.equals("all") || location.equals("")){
						fleetDetailsObj.setLocation("");
						} else{
					fleetDetailsObj.setLocation(location);
						}
					
					fleetDetailsObj.setStatus(status);
					fleetDetailsObj.setMaxRecords(maxRecords);
					fleetDetailsObj.setTranporterId(fleetId);
					fleetDetailsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				
					////System.out.println("Request String::::" + gson.toJson(fleetDetailsObj));
					resultStr = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("get_fleet_Details"), gson.toJson(fleetDetailsObj),"GET");
					////System.out.println("Response String::" + resultStr);
					
					response = gson.fromJson(resultStr, com.tlabs.posweb.beans.Response.class);
					
				}
				catch(ConnectException ce) {
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
				
				return response;
			}
	


public String createfleetmaster(String customerIdStr, String emailIdStr,FleetMaster fleetmasterservice) {
    String resultStr = null;
    try {
            
            fleetmasterservice.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
            ////System.out.println(" fleet create Request String::::::::::::"+gson.toJson(fleetmasterservice));
            RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
            resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_fleetmasterserviceArea"), gson.toJson(fleetmasterservice));
            
            ////System.out.println("Response String:::::::::::"+resultStr);
            String responseCode = Response.getResponseCode(resultStr);
            if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
                    resultStr = AppProperties.getAppMessageByProperty("FLEET_MASTER_CREATE_SUCCESSFULLY").trim();
            }else{
                    resultStr = Response.getResponseMessage(resultStr);
            }
    } catch (NoSuchElementException nse) {
            nse.printStackTrace();
            resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
    } catch(Exception e){
            e.printStackTrace();
    }
    return resultStr;
}


public B2BPartner createB2BPartner(B2BPartner b2bPartnerObj, String customerId, String emailId) {
	String resultStr = null;
	B2BPartner responseObj = null;
	try {
		b2bPartnerObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		
		//System.out.println("Request String create_B2B_Partner ::" + gson.toJson(b2bPartnerObj));
		RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
        resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_B2B_Partner"), gson.toJson(b2bPartnerObj));
		//System.out.println("Response String ::" + resultStr);
		
		responseObj = gson.fromJson(resultStr, B2BPartner.class);
		String responseCode = Response.getResponseCode(resultStr);
		if (responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())) {
			resultStr = Response.getResponseMessage(resultStr);
			//responseObj.setB2bPdfUrl(responseObj.getB2bPdfUrl());
		} else {
			resultStr = Response.getResponseMessage(resultStr);
		}
		
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	} catch (Exception e) {
		e.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
	}
	
	return responseObj;
}


public B2BPartner getB2BPartners(String b2bPartners, String customerId, String emailId, String index,String maxRecords,String search) throws Exception {
	String result = null;
	B2BPartner b2BPartnerResponse = null;
	try {
		B2BPartner b2bPartnerObj = new B2BPartner();
		b2bPartnerObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		b2bPartnerObj.setPartnerId(b2bPartners);
		b2bPartnerObj.setStartIndex(index);
		b2bPartnerObj.setMaxRecords(maxRecords);
		b2bPartnerObj.setSearchCriteria(search);
		
		//System.out.println("Request String getB2BPartners ::" + gson.toJson(b2bPartnerObj));
		RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
		result = restFulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_B2B_Partner"), gson.toJson(b2bPartnerObj),"GET");
		//System.out.println("Response String::::" + result);
		
		b2BPartnerResponse = gson.fromJson(result, B2BPartner.class);
		
	}
	 catch (Exception e) {
		e.printStackTrace();
		result = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
	}
	return b2BPartnerResponse;
}


public String deleteB2BPartners(String customerIdStr,String emailIdStr,String ids) {
	String result = null;
	try {
		B2BPartner b2bPartnerObj = new B2BPartner();
		b2bPartnerObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		
		String[] b2bPartnerslist = ids.split(",");
		List<String> b2bPartnersDetails = new ArrayList<String>();
	
		for(int i=0;i<b2bPartnerslist.length;i++){
			b2bPartnersDetails.add(b2bPartnerslist[i]);
		}
		b2bPartnerObj.setPartnerIds(b2bPartnersDetails);
		
		//System.out.println("Request String:::deleteB2BPartners::::"+gson.toJson(b2bPartnerObj));
		RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
		result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("delete_B2B_Partner"), gson.toJson(b2bPartnerObj));
		//System.out.println("Response String::"+result);
		String responseCode = Response.getResponseCode(result);
		
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
			result = Response.getResponseMessage(result);
		else {
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




public String updateFleetMaster(FleetMaster fleetDetailsObj,String customerIdStr,String emailIdStr){
	String resultStr = null;
    try{
    	fleetDetailsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		
		////System.out.println("REQ UPDATE FLEET ::"+gson.toJson(fleetDetailsObj));
		RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
		resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_fleetMaster"), gson.toJson(fleetDetailsObj));
		////System.out.println("RESPONSE ::"+resultStr);
		
		String responseCode = Response.getResponseCode(resultStr);
        if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
                resultStr = AppProperties.getAppMessageByProperty("FLEET_MASTER_UPDATE_SUCCESSFULLY").trim();
        }else{
                resultStr = Response.getResponseMessage(resultStr);
        }
        
	}catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	} catch(Exception e){
		e.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
	}
    return resultStr;
}

}
