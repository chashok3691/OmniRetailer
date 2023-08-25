package com.tlabs.posweb.services;


import java.io.IOException;
import java.rmi.ConnectException;
import java.rmi.RemoteException;
import java.rmi.UnknownHostException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.NoSuchElementException;

import com.tlabs.posweb.init.AppProperties;
import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
//import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import com.technolabssoftware.www.CustomerComplaintServiceProxy;
import com.technolabssoftware.www.CustomerProxy;
import com.technolabssoftware.www.GenericSettingServiceProxy;
//import com.technolabssoftware.www.OutletConfigurationsProxy;
import com.technolabssoftware.www.ProductMasterProxy;

import com.tlabs.posweb.beans.AverageInventoryBean;
import com.tlabs.posweb.beans.AverageInventoryResponse;
import com.tlabs.posweb.beans.Customer;
import com.tlabs.posweb.beans.CustomerComplaintResponse;
import com.tlabs.posweb.beans.CustomerComplaints;
import com.tlabs.posweb.beans.FilterInput;
import com.tlabs.posweb.beans.GenericCustomer;
import com.tlabs.posweb.beans.ProductMaster;
import com.tlabs.posweb.beans.RequestHeader;
//import com.tlabs.posweb.beans.Restaurant;
import com.tlabs.posweb.beans.RoomBooking;
import com.tlabs.posweb.beans.SectionDetails;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.beans.TableBookings;
import com.tlabs.posweb.beans.ZoneMaster;
import com.tlabs.posweb.util.Constants;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
import com.tlabs.posweb.util.RestfulServiceConnection;
//import com.tlabs.posweb.util.Utilities;


public class MasterService {
	
	@Autowired
	private Gson gson;
	@Autowired
	SessionScope sessionScope;
	@Autowired
    private GenericMasterService genericMasterServiceObj;
	private static Logger log = Logger.getLogger(MasterService.class);
	 
		
		
	/*public List<com.tlabs.posweb.beans.Restaurant> viewRestaurantLayoutService(String userIdStr, String emailIdStr,String level, String location) {
		// log.info("View restaurant Layout servieces");
		
		RequestHeader reqHead = new RequestHeader();
		reqHead.setAccessKey(userIdStr);
		reqHead.setApplicationName(Constants.APPLICATION_NAME);
		reqHead.setDateTime(new Date().toString());
		reqHead.setUserName(emailIdStr);
		reqHead.setCustomerId(userIdStr);
		reqHead.setCorrelationId(Constants.CORRELATION_ID);
		OutletConfigurationsProxy ocp = new OutletConfigurationsProxy();
		List<com.tlabs.posweb.beans.Restaurant> roomList = null;
		try {
			// log.info("Request String:::::::::: LEVEL: "+level+"LOCATION : "+location);
			Restaurant re = ocp.getRestaurantLayoutByLevelAndLocation(reqHead,level,location);
			if (re.getResponseHeader().getResponseMessage().equalsIgnoreCase(Constants.SUCCESS)) {
				
				roomList = new ArrayList<Restaurant>();
				if (re.getTablesInfo() != null && re.getTablesInfo().size() > 0) {
					Restaurant rm = null;
					for (int i = 0; i < re.getTablesInfo().size() ; i++) {
						
						rm = new Restaurant(re.getTablesInfo().get(i).getCleanStatus(), re.getTablesInfo(i).getDateTimeStr(), re.getTablesInfo(i).getDisplay(), re.getTablesInfo(i).getLayoutCode(), re.getTablesInfo(i).getLevel(), re.getTablesInfo(i).getLocation(), re.getTablesInfo(i).getNoOfAvailableTables(), re.getTablesInfo(i).getNoOfRequiredTables(), "phoneNo", re.getTablesInfo(i).getPicture(), re.getTablesInfo(i).getTableDescription(), re.getTablesInfo(i).getTableLeft(), re.getTablesInfo(i).getTableNo(), re.getTablesInfo(i).getTableStatus(), re.getTablesInfo(i).getTableTop(),
								Base64.encode(re.getTablesInfo(i).getPicture()), re.getTablesInfo(i).isPictureRemoved(), re.getTablesInfo(i).getSequenceNumber(),re.getTablesInfo(i).getMinCapacity(),re.getTablesInfo(i).getSectionId(),re.getTablesInfo(i).getSectionName());
						roomList.add(rm);
					}
					return roomList;
				}else{
					System.err.println("No room available");
					return null;
				}
			}
		} catch (RemoteException e) {
			e.printStackTrace();
			return null;
		}
		return null;
	}
		*/
		
		
		
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * @author Mythri.S	
	 * 
	 * This method is used to call the deleteProduct method of web service and return the response
	 * 
	 */
	public String deleteProduct(String customerId,String emailId,String ids){
		String result = null;
		String responseCode = null;
		try {
			ProductMasterProxy productMasterProxy = new ProductMasterProxy();
			String[] idsArray = ids.split(",");
			ProductMaster productMaster = new ProductMaster();
			productMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			List<String> productIds = new ArrayList<String>();
			for(int i=0;i<idsArray.length;i++)
				productIds.add(idsArray[i]);
			productMaster.setProductIds(productIds);
			// log.info("Request String:::::::::"+gson.toJson(productMaster));
			result = productMasterProxy.deleteProducts(gson.toJson(productMaster));
			// log.info("Response String:::::::::"+result);
			responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("PRODUCT_DELETE_SUCCESS").trim();
			else if(responseCode.equals(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_FAILED_CODE").trim())))
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
	 * @author Mythri.S	
	 * 
	 * This method is used to call the getCategories method of web service and return the response
	 * 
	 */
	/*public String getCategories(String customerId,String emailId){
		String result = null;
		String responseMessage = null;
		try{
			UtilityMasterServiceProxy utilityMasterServiceProxy = new UtilityMasterServiceProxy();
			ProductCategoryBean productCategoryBean = new ProductCategoryBean();
			productCategoryBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String:::::::"+gson.toJson(productCategoryBean));
			result = utilityMasterServiceProxy.getCategories(gson.toJson(productCategoryBean));
			responseMessage = Response.getResponseMessage(result);
			// log.info("Resonse String Got::::::::");
//			// log.info(responseMessage);
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
		return responseMessage;
	}*/
	
	/**
	 * @author Mythri.S	
	 * 
	 * This method is used to return the Categories List
	 * 
	 */
	public ArrayList<String> getCategoriesList(String subCategories){
		ArrayList<String> categories = new ArrayList<String>();
		try {
			JSONObject json = new JSONObject(subCategories);
			Iterator<?> itr = json.keys();
			while(itr.hasNext()){
				categories.add((String)itr.next());
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return categories;
	}
	
	
	
	
	
	
	/**
	 * @author Mythri.S
	 * Created On:7-nov-2015
	 * 
	 * This method is used to return zones list  
	 * 
	 */
	public List<String> getZonesList(String customerIdStr,String emailIdStr){
		List<ZoneMaster> zoneMasterList = null;
	    List<String> zonesList = null;
		try{
			zonesList = new ArrayList<String>();
			zoneMasterList = genericMasterServiceObj.getZones(null,customerIdStr,emailIdStr,"-1","","");
			for(int i=0;i<zoneMasterList.size();i++){
				zonesList.add(zoneMasterList.get(i).getZoneID());
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return zonesList;
	}
	
	
	
	
	
	
	
	
	

	
		
		
		
		
		

		
		
		/**
		 * 
		 * @author Viswanath
		 * 
		 *This method is used to call createComplaint method of web service and return the response
		 *
		 **/
		public String createCustomerComplaints(CustomerComplaints customerComplaintsObj,String customerIdStr,String emailIdStr){
			String result = null;
			try {
				//CustomerComplaintServiceProxy customerComplaintServiceProxyObj = new CustomerComplaintServiceProxy();
				customerComplaintsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				
				/*// log.info("Request String::::::::::::"+gson.toJson(customerComplaintsObj));
				result = customerComplaintServiceProxyObj.createComplaint(gson.toJson(customerComplaintsObj));
				// log.info("Response String:::::::::::"+result);*/
				
				/**
				 * added by : vasudev
				 * purpose : changing soap calls to rest calls
				 */
				RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
				result = restFulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_customer_complaint"),gson.toJson(customerComplaintsObj));

				
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					result = AppProperties.getAppMessageByProperty("CUSTOMER_COMPLAINT_CREATE_SUCCESS").trim();
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
		 *This method is used to get Complaints List on phone no.
		 *
		 **/
		
		public List<CustomerComplaints> getComplaints(String complaintIdStr,String customerIdStr,String emailIdStr,String index,boolean search){
			String result = null;
			CustomerComplaints customerComplaintsObj = new CustomerComplaints();
			CustomerComplaintResponse customerComplaintResponseObj = new CustomerComplaintResponse();
			try{
				
				customerComplaintsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				if(search)
					customerComplaintsObj.setSearchCriteria(complaintIdStr);
				else
					customerComplaintsObj.setComplaintID(complaintIdStr);
				customerComplaintsObj.setStartIndex(index);
				
				
				/*CustomerComplaintServiceProxy customerComplaintServiceProxyObj = new CustomerComplaintServiceProxy();
				// log.info("Request::"+gson.toJson(customerComplaintsObj));
				result = customerComplaintServiceProxyObj.getComplaint(gson.toJson(customerComplaintsObj));
				// log.info(result);*/
				
				/**
				 * added by : vasudev
				 * purpose : changing soap calls to rest calls
				 */
				RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
				result = restFulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_customer_complaint"),gson.toJson(customerComplaintsObj),"GET");

				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					customerComplaintResponseObj = gson.fromJson(result, CustomerComplaintResponse.class);
					if(customerComplaintResponseObj.getComplaintsList() != null && customerComplaintResponseObj.getComplaintsList().size() > 0)
						customerComplaintResponseObj.getComplaintsList().get(0).setMaxRecords(Response.getResponseTotalRecords(result));
					
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
			return customerComplaintResponseObj.getComplaintsList();
		}
		
		
		/**
		 * 
		 * @author Viswanath
		 * 
		 *This method is used to get Customer Complaints
		 *
		 **/
		
		public List<CustomerComplaints> getCustomerComplaints(String complaintIdStr,String mobileNumStr,String index,boolean search,String location,String startDate,String endDate,String maxRecords){
			String result = null;
			CustomerComplaints customerComplaintsObj = new CustomerComplaints();
			CustomerComplaintResponse customerComplaintResponseObj = new CustomerComplaintResponse();
			try{
				
				customerComplaintsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				if(mobileNumStr != null){
					customerComplaintsObj.setMobileNum(mobileNumStr);
				}
				if(search)
					customerComplaintsObj.setSearchCriteria(complaintIdStr);
				else
					customerComplaintsObj.setComplaintID(complaintIdStr);
				customerComplaintsObj.setMaxRecords(maxRecords);
				customerComplaintsObj.setStartDate(startDate);
				customerComplaintsObj.setEndDate(endDate);
				customerComplaintsObj.setStoreLocation(location);
				customerComplaintsObj.setStartIndex(index);
				
				
				/*CustomerComplaintServiceProxy customerComplaintServiceProxyObj = new CustomerComplaintServiceProxy();
				// log.info("Request::"+gson.toJson(customerComplaintsObj));
				result = customerComplaintServiceProxyObj.getComplaint(gson.toJson(customerComplaintsObj));
				// log.info(result);*/
				
				/**
				 * added by : vasudev
				 * purpose : changing soap calls to rest calls
				 */
				RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
				result = restFulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_customer_complaint"),gson.toJson(customerComplaintsObj),"GET");

				
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					customerComplaintResponseObj = gson.fromJson(result, CustomerComplaintResponse.class);
					if(customerComplaintResponseObj.getComplaintsList() != null && customerComplaintResponseObj.getComplaintsList().size() > 0)
						customerComplaintResponseObj.getComplaintsList().get(0).setMaxRecords(Response.getResponseTotalRecords(result));
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
			return customerComplaintResponseObj.getComplaintsList();
		}
		
		/**
		 * 
		 * @author Viswanath
		 * 
		 *This method is used to call updateComplaint method of web service and return the response
		 *
		 **/
		public String updateCustomerComplaints(CustomerComplaints customerComplaintsObj){
			String result = null;
			try {
				//CustomerComplaintServiceProxy customerComplaintServiceProxyObj = new CustomerComplaintServiceProxy();
				customerComplaintsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				
				/*// log.info(gson.toJson(customerComplaintsObj));
				result = customerComplaintServiceProxyObj.updateComplaint(gson.toJson(customerComplaintsObj));
				// log.info(result);*/
				
				result = new RestfulServiceConnection().getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_customer_complaint"), gson.toJson(customerComplaintsObj));

				
				 String responseCode = Response.getResponseCode(result);
					if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
						result = AppProperties.getAppMessageByProperty("CUSTOMER_COMPLAINT_UPDATE_SUCCESS").trim();
					}
					else{
//						result = "Couldn't update, please try after some time";
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
		
		
		/**
		 * 
		 * @author Viswanath
		 * 
		 *This method is used to get Customer Details On Mobile Number
		 *
		 **/
		
		public Customer getCustomerDetails(String mobileNoStr,String index,boolean search){
			String result = null;
			Customer customerObj=new Customer();
			//CustomerDetails customerDetailsObj=new CustomerDetails();
			try{
				
				customerObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				/*if(search)
					master.setSearchCriteria(mobileNoStr);
				else*/
				customerObj.setMobileNumber(mobileNoStr);
				customerObj.setPhone(mobileNoStr);
				//master.setStartIndex(index);
				
			/*	CustomerProxy customerProxyObj = new CustomerProxy();
				// log.info("Request::"+gson.toJson(customerObj));
				result = customerProxyObj.getCustomerDetails(gson.toJson(customerObj));
				////////////System.out.println("responce::"+(result));
				// log.info(result);*/
				
				//added by vasudev
				result = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("Customer_Service_customer_details"),gson.toJson(customerObj), "POST");

				//////////System.out.println("Customer_Service_customer_details::"+result);
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					customerObj = gson.fromJson(result, Customer.class);
//					customerDetailsObj.getCustomers().get(0);
					//customerDetailsObj.getCustomers().get(0).setTotalRecords(Response.getResponseTotalRecords(result));
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
			return customerObj;
		}
		
		/**
		 * 
		 * @author Viswanath
		 * 
		 *This method is used to call updateCustomerSettings method of web service and return the response
		 *
		 **/
		public String updateCustomerSettings(GenericCustomer settingsObj,String customerIdStr,String emailIdStr){
			String result = null;
			try {
				//GenericSettingServiceProxy genericSettingServiceProxyObj = new GenericSettingServiceProxy();
				settingsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				//// log.info("JSON::"+gson.toJson(settingsObj));
				////////////////System.out.println("JSON::"+gson.toJson(settingsObj));
				//result = genericSettingServiceProxyObj.updateCustomerSettings(gson.toJson(settingsObj));
				
				RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
				result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_customer_settings"), gson.toJson(settingsObj));
							

				////////////System.out.println("update_customer_settings::::::::"+result);
				//// log.info(result);
				 String responseCode = Response.getResponseCode(result);
					if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
						result = AppProperties.getAppMessageByProperty("CUSTOMER_PROFILE_UPDATE_SUCCESS").trim();
					}
					else{
//						result = "Couldn't update, please try after some time";
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

		
		
		
		public AverageInventoryResponse getAverageStock(AverageInventoryBean averageInventoryBeanObj,String customerIdStr,String emailIdStr){
			String result = null;
			AverageInventoryResponse averageInventoryResponseObj = new AverageInventoryResponse();
			try {
//				InventoryServicesProxy inventoryServicesProxyObj = new InventoryServicesProxy();
				averageInventoryBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				////////System.out.println("Request String::::::::::"+gson.toJson(averageInventoryBeanObj));
				RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
				/*result = restfulConnectionObj.getResponseFromPost(AppProperties.getAppMessageByProperty("avg_inventory"), gson.toJson(averageInventoryBeanObj));*/
				result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_daily_stock_report"), gson.toJson(averageInventoryBeanObj),"GET");
//				result = inventoryServicesProxyObj.getAverageInventory(gson.toJson(averageInventoryBeanObj));
				// log.info("Response String Got:::::::::::"+result);
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					averageInventoryResponseObj = gson.fromJson(result, AverageInventoryResponse.class);
				}
			/*}catch(ConnectException ce) {
				ce.printStackTrace();
				result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();*/
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			/*} catch (UnknownHostException uhe) {
				uhe.printStackTrace();
				result = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
			} catch(RemoteException rme){
				rme.printStackTrace();
				result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();*/
			} catch(Exception e){
				e.printStackTrace();
			}
			return averageInventoryResponseObj;
		}
		
		
		/**
		   * Created by: kalyan
		   * Creation date: 
		   * Updated by: kalyan
		   * Last updated on: 13-11-2015
		   * Verified by:
		   * Purpose: this service method is used to view all bookings by filter .
		   *  If all parameters empty will get all bookings
		 * @param location
		 * @param checkinId
		 * @param bookingId
		 * @param roomNo
		 * @param checkinDate
		 * @param checkoutDate
		 * @param checkinStatus
		 * @param userIdStr
		 * @param emailIdStr
		 * @return
		 */
		public String viewRestaurantBookingsService(String location,String level, String startDate,String endDate,int index,String bookingId,String userIdStr,String emailIdStr,String slot,String orderTypeStr) {
			
			// log.info(">>>  "+location+" : "+index+" : "+level+" : "+slot+" : "+orderTypeStr);
			
			RequestHeader reqHead = new RequestHeader();
			reqHead.setAccessKey(userIdStr);
			reqHead.setApplicationName(Constants.APPLICATION_NAME);
			reqHead.setDateTime(new Date().toString());
			reqHead.setUserName(emailIdStr);
			reqHead.setCustomerId(userIdStr);
			reqHead.setCorrelationId(Constants.CORRELATION_ID);
			
			FilterInput fi = new FilterInput();
			fi.setRequestHeader(reqHead);
			
			fi.setLevel(level);
			fi.setStoreLocation(location);
			fi.setStartDateStr(startDate.equalsIgnoreCase("")?"":startDate+" 00:00:00");
			fi.setEndDateStr(endDate.equalsIgnoreCase("")?"":endDate+" 00:00:00");
			//fi.setBookingId(bookingId);
			fi.setOrderId(bookingId);
			fi.setSlot(slot);
			fi.setOrderType(orderTypeStr);
			fi.setStartIndex(index+"");
			fi.setMaxRecords("10");
			////////////////System.out.println("Request--:"+gson.toJson(fi));
			 Client client = Client.create();
		     WebResource webResource = client.resource(AppProperties.getCloudServiceUrlWithContext());
		     return webResource.path("FBBookingsServices/getOrdersByFilters").queryParam("filterInput", gson.toJson(fi)).get(String.class);
			
		}
		
		
		/**
		* 
		* Created by: kalyan
		* Creation date: 06-11-2015
		* Updated by: kalyan
		* Last updated on: 13-11-2015
		* Verified by:
		* Purpose:  for search booking ids
		* 
		 * 
		 * 
		 * @param customerIdStr
		 * @param emailIdStr
		 * @param searchNameStr
		 * @return
		 */
		public List<RoomBooking> searchBookingIds(String customerIdStr,String emailIdStr,String searchNameStr){
			
			List<RoomBooking> bookingIdList = new ArrayList<RoomBooking>();
			RoomBooking roomBooking = null;
			try{
				// log.info("Get Suppliers based on provided name");
				RequestHeader reqHead = new RequestHeader();
				reqHead.setAccessKey(customerIdStr);
				reqHead.setApplicationName(Constants.APPLICATION_NAME);
				reqHead.setDateTime(new Date().toString());
				reqHead.setUserName(emailIdStr);
				reqHead.setCustomerId(customerIdStr);
				reqHead.setCorrelationId(Constants.CORRELATION_ID);
				
				FilterInput fi = new FilterInput();
				fi.setRequestHeader(reqHead);;
				fi.setBookingId(searchNameStr);
				
				 Client client = Client.create();
		         WebResource webResource = client.resource(AppProperties.getCloudServiceUrlWithContext());

		         
		         String responseStr = webResource.path("RoomBookingServices/getBookingIds").queryParam("filterInput", gson.toJson(fi)).get(String.class);
		         JSONObject jsonResponseObject= new JSONObject(responseStr);
		         if (jsonResponseObject.getJSONObject("responseHeader").getString("responseCode").equalsIgnoreCase("-1")) {
					return bookingIdList;
				}
				 JSONArray jsonBookingInfoArray = jsonResponseObject.getJSONArray("bookingsInfo");
				 
				 for (int i=0; i<jsonBookingInfoArray.length(); i++) {
					 roomBooking = gson.fromJson(jsonBookingInfoArray.getString(i), RoomBooking.class);
					 bookingIdList.add(roomBooking);
				 }
				 
				
			} catch (NoSuchElementException nse) {
				System.err.println(AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim());
				nse.printStackTrace();
			} catch(Exception e){
				e.printStackTrace();
			}
			return bookingIdList;
		}
		

		
	
		

	public List<TableBookings> searchRestaurantBookingIds(String customerIdStr,String emailIdStr,String searchNameStr){
			
			List<TableBookings> bookingIdList = new ArrayList<TableBookings>();
			TableBookings tableBooking = null;
			try{
				// log.info("Get Suppliers based on provided name "+searchNameStr);
				
				RequestHeader reqHead = new RequestHeader();
				reqHead.setAccessKey(customerIdStr);
				reqHead.setApplicationName(Constants.APPLICATION_NAME);
				reqHead.setDateTime(new Date().toString());
				reqHead.setUserName(emailIdStr);
				reqHead.setCustomerId(customerIdStr);
				reqHead.setCorrelationId(Constants.CORRELATION_ID);
				
				FilterInput fi = new FilterInput();
				fi.setRequestHeader(reqHead);;
				fi.setOrderId(searchNameStr);
				//fi.setBookingId(searchNameStr);
				Client client = Client.create();
		         WebResource webResource = client.resource(AppProperties.getCloudServiceUrlWithContext());

		        // //////////////System.out.println("Order ID Request: "+ gson.toJson(fi));
//		         String responseStr = webResource.path("FBBookingsServices/getBookingIds").queryParam("filterInput", gson.toJson(fi)).get(String.class);
		         String responseStr = webResource.path("FBBookingsServices/getOrdersByOrderId").queryParam("filterInput", gson.toJson(fi)).get(String.class);
		      //   //////////////System.out.println("Order ID Response: "+responseStr);
		         JSONObject jsonResponseObject= new JSONObject(responseStr);
		         if (jsonResponseObject.getJSONObject("responseHeader").getString("responseCode").equalsIgnoreCase("-1")) {
					return bookingIdList;
				}
				 /*JSONArray jsonBookingInfoArray = jsonResponseObject.getJSONArray("tableBookings");
				 
				 
				 for (int i=0; i<jsonBookingInfoArray.length(); i++) {
					 tableBooking = gson.fromJson(jsonBookingInfoArray.getString(i), TableBookings.class);
					 bookingIdList.add(tableBooking);
				 }*/
		         String responseCode = Response.getResponseCode(responseStr);
					if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
						tableBooking = gson.fromJson(responseStr, TableBookings.class);
						//tBooking.getTableBookings().get(0);
						bookingIdList.add(tableBooking);
					}
				
			} catch (NoSuchElementException nse) {
				System.err.println( AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim());
				nse.printStackTrace();
			} catch(Exception e){
				e.printStackTrace();
			}
			return bookingIdList;
		}	
		
	//******** Section Master Starts **********//
	
	
	public String createSection(SectionDetails sectionDetailsObj,String customerIdStr,String emailIdStr,String roleStr){
		String result = null;
		try {
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			sectionDetailsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr, emailIdStr));
			sectionDetailsObj.setUserName(emailIdStr);
			sectionDetailsObj.setRoleName(roleStr);
			// log.info("Request String::::::::::::"+gson.toJson(sectionDetailsObj));
			
			result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Section_Service_create_Section_details"), gson.toJson(sectionDetailsObj),"POST");
			// log.info("Response String:::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("SECTION_CREATE_SUCCESS").trim();
			else
				result = Response.getResponseMessage(result);
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	public List<SectionDetails> getSection(String sectionIdStr,String customerIdStr,String emailIdStr,String indexStr,boolean search,String maxRecords){
		String result = null;
		List<SectionDetails> sectionDetailsList = null;
		try {
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			SectionDetails sectionDetailsObj = new SectionDetails();
			if(search)
				sectionDetailsObj.setSearchCriteria(sectionIdStr);
			else
				sectionDetailsObj.setSectionId(sectionIdStr);
			sectionDetailsObj.setSearchCriteria(sectionIdStr);
			sectionDetailsObj.setMaxRecords("10");
			sectionDetailsObj.setStartIndex(indexStr);
			sectionDetailsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr, emailIdStr));
			// log.info("Request String:::::::"+gson.toJson(sectionDetailsObj));
			result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Section_Service_get_Section_details"), gson.toJson(sectionDetailsObj), "POST");
			// log.info("Response String:::::::"+result);
			////////////////System.out.println("section Response String:::::::"+result);
			String responseCode = Response.getResponseCode(result);
			int slNo=Integer.parseInt(indexStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				sectionDetailsObj = gson.fromJson(result, SectionDetails.class);
				sectionDetailsList = sectionDetailsObj.getSectionsInfo();
				if(sectionDetailsList != null && sectionDetailsList.size() > 0){
					sectionDetailsList.get(0).setTotalRecords(sectionDetailsObj.getTotalRecords());
					for(SectionDetails sectionMaster : sectionDetailsList)
						sectionMaster.setSlNo(++slNo);
				}
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return sectionDetailsList;
	}
	
	public String updateSection(SectionDetails sectionDetailsObj,String customerIdStr,String emailIdStr,String roleStr){
		String result = null;
		try {
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			sectionDetailsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr, emailIdStr));
			sectionDetailsObj.setUserName(emailIdStr);
			sectionDetailsObj.setRoleName(roleStr);
			// log.info("Request String::::::::::::"+gson.toJson(sectionDetailsObj));
			
			result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Section_Service_update_Section_details"), gson.toJson(sectionDetailsObj),"POST");
			// log.info("Response String:::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("SECTION_UPDATE_SUCCESS").trim();
			else
				result = Response.getResponseMessage(result);
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * @author Mythri.S	
	 * Created On: 8-aug-2015
	 * 
	 * 
	 * This method is used to call the deleteSku method of web service and return the response.
	 * This method accepts a List of skuIds need to be deleted.
	 * 
	 * 
	 */
	public String deleteSection(String customerId,String emailId,String ids){
		String result = null;
		String responseCode = null;
		try {
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			String[] idsArray = ids.split(",");
			SectionDetails sectionDetailsObj = new SectionDetails();
			sectionDetailsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerId, emailId));
			List<String> sectionIds = new ArrayList<String>();
			for(int i=0;i<idsArray.length;i++)
				sectionIds.add(idsArray[i]);
			sectionDetailsObj.setSectionIds(sectionIds);
			// log.info("Request String:::::::::"+gson.toJson(sectionDetailsObj));
			result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Section_Service_delete_Section_details"), gson.toJson(sectionDetailsObj),"POST");
			// log.info("Response String:::::::::"+result);
			responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("SECTION_DELETE_SUCCESS").trim();
			else 
				result = AppProperties.getAppMessageByProperty("DELETE_FAILED").trim();
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	//******** Section Master Ends **********//
	
		
		
}
