package com.tlabs.posweb.services;

import java.rmi.ConnectException;
import java.rmi.RemoteException;
import java.rmi.UnknownHostException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
//import java.util.HashSet;
import java.util.List;
import java.util.NoSuchElementException;
//import java.util.Set;
import java.util.Set;

import com.tlabs.posweb.init.AppProperties;
import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.technolabssoftware.www.AppSettingsProxy;
import com.technolabssoftware.www.CountersProxy;
import com.technolabssoftware.www.MemberServiceProxy;
import com.technolabssoftware.www.StoreTaxationServiceProxy;
import com.technolabssoftware.www.UtilityMasterServiceProxy;
import com.tlabs.posweb.beans.BrandMaster;
import com.tlabs.posweb.beans.Counter;
import com.tlabs.posweb.beans.CurrencyBean;
import com.tlabs.posweb.beans.CustomerDevices;
import com.tlabs.posweb.beans.LanguageBean;
import com.tlabs.posweb.beans.LocationBean;
import com.tlabs.posweb.beans.OutletSettings;
import com.tlabs.posweb.beans.RequestBean;
import com.tlabs.posweb.beans.RequestHeader;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.beans.SpecialisationMaster;
import com.tlabs.posweb.beans.StoreTaxation;
import com.tlabs.posweb.beans.Tax;
import com.tlabs.posweb.beans.TaxBean;
import com.tlabs.posweb.beans.UserDetails;
import com.tlabs.posweb.beans.WarehouseCounterResponse;
import com.tlabs.posweb.beans.WarehouseCounters;
import com.tlabs.posweb.beans.WarehouseTaxation;
import com.tlabs.posweb.beans.ZoneMaster;
import com.tlabs.posweb.util.Constants;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
import com.tlabs.posweb.util.RestfulServiceConnection;
//import com.tlabs.posweb.util.Utilities;


public class AdminService {
	
	@Autowired
	private Gson gson;
	//private static Logger log = Logger.getLogger(AdminService.class);
    @Autowired
    SessionScope sessionScope;
    @Autowired
    private GenericMasterService genericMasterServiceObj;
    
   public RequestHeader getRequestHeader(){
	  RequestHeader requestHeader = RequestHeaderUtil.getRequestHeader(sessionScope);
	  return requestHeader;
	   
   }
	
	
	
  
	
	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 * This method is used to call getCategories method of web service and return the all the Categories and Sub Categories List
	 * 
	 * */
	/*public List<String> getCategories(String customerId,String emailId){
		String result = null;
		List<String> categoriesList = null;
		try{
			UtilityMasterServiceProxy utitlitymaster = new UtilityMasterServiceProxy();
			ProductCategoryBean productCategoryBean = new ProductCategoryBean();
			productCategoryBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			JSONArray jsonResponseArray = new JSONArray();
			result = utitlitymaster.getCategories(gson.toJson(productCategoryBean));
			// log.info(result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				String responseMessage = Response.getResponseMessage(result);
				JSONObject json = new JSONObject(responseMessage);
				jsonResponseArray = json.names();
				categoriesList = new ArrayList<String>();
				if(jsonResponseArray != null)
				for (int i=0; i<jsonResponseArray.length(); i++) {
					categoriesList.add( jsonResponseArray.getString(i) );
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
		return categoriesList;
	}*/
	
	
	
	
	
	
	
	
   public ArrayList<LocationBean> getLocationsListofAll(String customerIdStr,String emailIdStr,boolean status){
		ArrayList<LocationBean> locationBeanObj=null;
		try{
			
			locationBeanObj = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,true,status);
//			if(locationBeanObj != null)
//			{
//				for(int i=0;i<locationBeanObj.size();i++)
//				{
//						locationsList.add(locationBeanObj.get(i).getLocationId());
//				}
//			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return locationBeanObj;
	}
	

	
	/**
	 * @author Sahitya
	 * 
	 * This method is used to return locations list which are retrieved from admin service class 
	 * 
	 */
	public List<String> getLocationsListByStates(String states,String customerIdStr,String emailIdStr){
	    List<String> locationsList = new ArrayList<String>();
	    String result;
	    try{
			LocationBean locationBean = new LocationBean();
			locationBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			locationBean.setStartIndex("0");
			locationBean.setAllLocations(true);
			//UtilityMasterServiceProxy utitlitymaster = new UtilityMasterServiceProxy();
			String[] statesList = states.split(",");
			for(int i = 0; i<statesList.length ;i++){
				locationBean.setState(statesList[i]);
				
				RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
				/*// log.info("Request String::::::"+gson.toJson(locationBean));
				result = utitlitymaster.getLocation(gson.toJson(locationBean));
				// log.info("Response String::::::"+result);*/
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_locations"), gson.toJson(locationBean),"POST");

				
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					String responseList = Response.getResponseList(result, "locationDetails");
					JSONArray jsonResponseArray = new JSONArray(responseList);
					// log.info(jsonResponseArray.length());
					for (int j=0; j<jsonResponseArray.length(); j++) {
						LocationBean locationBeanObj = gson.fromJson(jsonResponseArray.getString(j), LocationBean.class);
						locationsList.add(locationBeanObj.getLocationId());
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
	    // log.info(locationsList.size());
		return locationsList;
	}
	
	/**
	 * @author Sahitya
	 * 
	 * This method is used to return locations list which are retrieved from admin service class 
	 * 
	 */
	public List<String> getLocationsList(String userIdStr,String emailIdStr,String businessActivity){
		ArrayList<LocationBean> locationBeanObj = null;
	    List<String> locationsList = null;
	    String locationStr = "";
		try{
			locationsList = new ArrayList<String>();
			locationBeanObj = genericMasterServiceObj.getLocationDetails(locationStr,userIdStr,emailIdStr,"-1",businessActivity,false,true,true);
			if(locationBeanObj != null){
				for(int i=0;i<locationBeanObj.size();i++){
//					if(businessActivity == null || businessActivity.equals(""))
						locationsList.add(locationBeanObj.get(i).getLocationId());
					/*else if(businessActivity.equalsIgnoreCase("Retail Outlet"))
						locationsList.add(locationBeanObj.get(i).getLocationId());
					else if(businessActivity.equalsIgnoreCase("Warehouse"))
						locationsList.add(locationBeanObj.get(i).getLocationId());*/
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return locationsList;
	}
	

	public List<String> getBrandNamesList(String customerIdStr,String emailIdStr){
	    List<String> brandNamesList = null;
		try{
			brandNamesList = new ArrayList<String>();
			List<BrandMaster> brandsList = genericMasterServiceObj.getBrandDetails("",customerIdStr, emailIdStr,"-1","",false);
			if(brandsList != null){
				for(int i=0;i<brandsList.size();i++){
					brandNamesList.add(brandsList.get(i).getbName());
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return brandNamesList;
	}
	
	
	/**
	 * 
	 * @author Vinay.M
	 * 
	 * This method is used to return Specialisation list which are retrieved from admin service class 
	 * 
	 */
	
	public List<String> getSpecialisationList(String userIdStr,String emailIdStr){
		ArrayList<SpecialisationMaster> specialisationbeanobj = null;
	    List<String> specialisationList = null;
		try{
			specialisationList = new ArrayList<String>();
			specialisationbeanobj = genericMasterServiceObj.getSpecialisationDetailsList(userIdStr,emailIdStr,"0");
			//////////////////System.out.println("admin service"+gson.toJson(specialisationbeanobj));
			if(specialisationbeanobj != null){
				for(int i=0;i<specialisationbeanobj.size();i++){
					specialisationList.add(specialisationbeanobj.get(i).getSpecialisationName());
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		//////////////////System.out.println(specialisationList);
		return specialisationList;
	}
	
	/**
	 * @author Sahitya
	 * 
	 * This method is used to return locations list which are retrieved from admin service class 
	 * 
	 */
	public List<String> getWarehouseLocationsList(String customerIdStr,String emailIdStr,boolean status){
	    List<String> locationsList = null;
		try{
			locationsList = new ArrayList<String>();
			ArrayList<LocationBean> locationBeanObj = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","Warehouse",false,false,status);
			if(locationBeanObj != null){
				for(int i=0;i<locationBeanObj.size();i++){
						locationsList.add(locationBeanObj.get(i).getLocationId());
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return locationsList;
	}
	
	
	
	public List<LocationBean> getWarehousList(String customerIdStr,String emailIdStr,boolean status){
		ArrayList<LocationBean> locationBeanObj = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","Warehouse",false,false,status);
			
		
		return locationBeanObj;
	}
	
	/**
	 * @author Sahitya
	 * 
	 * This method is used to return locations list which are retrieved from admin service class 
	 * 
	 */
	public List<String> getOutletLocationsList(String customerIdStr,String emailIdStr,boolean status){
	    List<String> locationsList = null;
		try{
			locationsList = new ArrayList<String>();
			ArrayList<LocationBean> locationBeanObj = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","Retail Outlet",false,false,status);
			if(locationBeanObj != null){
				for(int i=0;i<locationBeanObj.size();i++){
						locationsList.add(locationBeanObj.get(i).getLocationId());
						//locationsList.add(arg0)
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return locationsList;
	}
	
	
	public List<OutletSettings> getOutletSettingList(String customerIdStr,String emailIdStr,String location){
		OutletSettings outletSettings=null;
		String result = null;
		try{
			 outletSettings = new OutletSettings();
			outletSettings.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			outletSettings.setStartIndex("0");
			outletSettings.setLocation(location);
			
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_OutletLocations"), gson.toJson(outletSettings),"GET");

			//////////////System.out.println("Request String::::::"+gson.toJson(outletSettings));
			//////////////System.out.println("Response String::::::get_OutletLocations response"+result);
			
			String responseCode = Response.getResponseCode(result);
			
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				outletSettings = gson.fromJson(result, OutletSettings.class);
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
		return outletSettings.getOutletSettingsList();
	}
	
	
	/**
	 * @author Chaithanya
	 * 
	 * This method is used to return locations list which are retrieved from admin service class 
	 * 
	 */
	public List<String> getRestaruntLocationsList(String customerIdStr,String emailIdStr,boolean status){
	    List<String> locationsList = null;
		try{
			locationsList = new ArrayList<String>();
			ArrayList<LocationBean> locationBeanObj = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","Restaurant",false,false,status);
			if(locationBeanObj != null){
				for(int i=0;i<locationBeanObj.size();i++){
						locationsList.add(locationBeanObj.get(i).getLocationId());
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return locationsList;
	}
	
	public List<String> getOutletAndWarehouseLocationsList(String customerIdStr,String emailIdStr,boolean status){
		 List<String> locationsList = null;
		try{
			locationsList = new ArrayList<String>();
			ArrayList<LocationBean> locationBeanObj = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,status);
			if(locationBeanObj != null){
				for(int i=0;i<locationBeanObj.size();i++){
						locationsList.add(locationBeanObj.get(i).getLocationId());
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return locationsList;
	}
	
	
	public ArrayList<LocationBean> getOutletStates(String customerIdStr,String emailIdStr,boolean status){
		
		ArrayList<LocationBean> locationBeanObj = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,status);
		
		
		return locationBeanObj;
	}
	
	public List<String> getAllLocationsList(String customerIdStr,String emailIdStr,boolean status){
		 List<String> locationsList = null;
		try{
			locationsList = new ArrayList<String>();
			ArrayList<LocationBean> locationBeanObj = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,true,status);
			if(locationBeanObj != null){
				for(int i=0;i<locationBeanObj.size();i++){
						locationsList.add(locationBeanObj.get(i).getLocationId());
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return locationsList;
	}
	
	
	/**
	 * @author Sahitya
	 * 
	 * This method is used to return locations list which are retrieved from admin service class 
	 * 
	 */
	public List<String> getUsersList(String type,List<String> locations,String customerIdStr,String emailIdStr){
	    List<String> usersList = null;
	    String result = null;
		try{
			usersList = new ArrayList<String>();
			//MemberServiceProxy member = new MemberServiceProxy();
			UserDetails userDetails = new UserDetails();
			userDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			if(type.equals("all"))
				userDetails.setAccountStatus("");
			else
				userDetails.setAccountStatus(type);
			userDetails.setStartIndex("-1");
			userDetails.setLocations(locations);
			
			/*// log.info(gson.toJson(userDetails));
			result = member.getMembers(gson.toJson(userDetails));
			// log.info(result);*/
			/**	added by - vasudev   purpose - using rest service call instead of soap call*/
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
		   result=restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_members"), gson.toJson(userDetails),"POST");

			
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				String responseList = Response.getResponseList(result, "members");
				JSONArray jsonResponseArray = new JSONArray(responseList);
				for (int i=0; i<jsonResponseArray.length(); i++) {
					userDetails = gson.fromJson(jsonResponseArray.getString(i), UserDetails.class);
					usersList.add(userDetails.getEmail());
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
		return usersList;
	}
	
	/**
	 * @author Sahitya
	 * 
	 * This method is used to return currencies list which are retrieved from admin service class 
	 * 
	 */
	public List<String> getCurrenciesList(String userIdStr,String emailIdStr){
		ArrayList<CurrencyBean> locationBeanObj = null;
	    List<String> currenciesList = null;
	    String countryStr = "";
		try{
			currenciesList = new ArrayList<String>();
			locationBeanObj = genericMasterServiceObj.getCurrency(countryStr,userIdStr,emailIdStr,"-1","");
			for(int i=0;i<locationBeanObj.size();i++){
				currenciesList.add(locationBeanObj.get(i).getCurrencyCode());
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return currenciesList;
	}
	
	/**
	 * @author Sahitya
	 * 
	 * This method is used to return taxes list which are retrieved from admin service class 
	 * 
	 */
	public List<String> getTaxesList(String userIdStr,String emailIdStr){
		ArrayList<TaxBean> locationBeanObj = null;
	    List<String> taxesList = null;
	    String countryStr = "";
		try{
			taxesList = new ArrayList<String>();
			locationBeanObj = genericMasterServiceObj.getTaxDetails(countryStr,userIdStr,emailIdStr,"-1",false,"");
			for(int i=0;i<locationBeanObj.size();i++){
				taxesList.add(locationBeanObj.get(i).getTaxName());
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return taxesList;
	}
	
	/**
	 * @author Sahitya
	 * 
	 * This method is used to return locations list which are retrieved from admin service class 
	 * 
	 */
	public List<String> getLanguagesList(String userIdStr,String emailIdStr){
		List<LanguageBean> languageBeanObj = null;
	    List<String> languagesList = null;
	    try{
	    	languagesList = new ArrayList<String>();
			languageBeanObj = getLanguagesDetails(userIdStr,emailIdStr);
			for(int i=0;i<languageBeanObj.size();i++){
				languagesList.add(languageBeanObj.get(i).getLanguage_name());
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return languagesList;
	}
	
	/**
	 * 
	 * @author Sahitya
	 * 
	 * This method is used to call get languages method of web service and return all the languages Details List
	 * 
	 * */
	public List<LanguageBean> getLanguagesDetails(String customerId,String emailId){
		List<LanguageBean> languageDetails = null;
		String result = null;
		RequestBean beanObj = null;
		try{
			beanObj = new RequestBean();
			languageDetails = new ArrayList<LanguageBean>();
			beanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			beanObj.setStartIndex(Constants.PAGINATION_START_INDEX);
			
			/*UtilityMasterServiceProxy utitlitymaster = new UtilityMasterServiceProxy();
			// log.info("Request String::::::"+gson.toJson(beanObj));
			result = utitlitymaster.getLanguages(gson.toJson(beanObj));
			// log.info("Response String::::::"+result);*/
			
			/**	added by - vasudev   purpose - using rest service call instead of soap call*/
			RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
			result = restFulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_languages"), gson.toJson(beanObj), "GET");

			beanObj = gson.fromJson(result,RequestBean.class);
			if(beanObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				languageDetails = beanObj.getLanguages();
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
		return languageDetails;
	}
	
	/**
	 * 
	 * @author Sahitya
	 * 
	 * This method is used to call get languages method of web service and return all the languages Details List
	 * 
	 * */
	public List<Tax> getTaxForLocation(String customerId,String emailId,String location){
		List<Tax> taxDetails = null;
		String result = null;
		RequestBean beanObj = null;
		try{
			beanObj = new RequestBean();
			taxDetails = new ArrayList<Tax>();
			beanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			beanObj.setStartIndex(Constants.PAGINATION_START_INDEX);
			beanObj.setLocation(location);
			beanObj.setEmailId(emailId);
			
			
			/*AppSettingsProxy appSettingsProxy = new AppSettingsProxy();
			// log.info("Request String::::::"+gson.toJson(beanObj));
		//	////////////////System.out.println("Apsetting Request String::::::"+gson.toJson(beanObj));
			result = appSettingsProxy.getAppSettings(gson.toJson(beanObj));
			// log.info("Response String::::::"+result);
			//////////////////System.out.println("Response String::::::"+result);
*/			//////////////System.out.println("Apsetting Request String::::::"+gson.toJson(beanObj));
			/**	added by - vasudev   purpose - using rest service call instead of soap call*/
			RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
			result = restFulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_app_settings"), gson.toJson(beanObj), "GET");
			//////////////System.out.println("Response String::get_app_settings::::"+result);
			beanObj = gson.fromJson(result,RequestBean.class);
			if(beanObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				taxDetails = beanObj.getTaxDetails();
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
	
	public List<Counter> getCounters(String counterId,String location,String customerId, String emailId,String index,boolean search,String maxRecords,String locationListAll) {
		/**
		 * @author Sambaiah.Y  03-07-2015
		 * 
		 * This method is used to get the all counters from server 
		 * updated:added maxrecords as param
		 */
		//// log.info("AdminService - getCounters");
		String str_response = null;
		Counter counterObj = new Counter();
		String str_counters = "";
		try{
			//CountersProxy counterProxy = new CountersProxy();
		
			counterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			if(search){
				counterObj.setSearchCriteria(counterId);
			}else{
				if(str_counters.equals(counterId)){}
				else{counterObj.setCounterId(counterId);}
			}
			if(location.equals("all") || location.equals(""))
			{
			List<String> myList = new ArrayList<String>(Arrays.asList(locationListAll.split(",")));
			counterObj.setCounterLocations(null);
			}
			else
			counterObj.setStoreLocation(location);
			
			counterObj.setStartIndex(index);
			counterObj.setMaxRecords(maxRecords);
			
         //System.out.println("counters Request String ::: "+ gson.toJson(counterObj));
			
			/*// log.info("Request String ::: "+ gson.toJson(counterObj));
			str_response = counterProxy.getCounters(gson.toJson(counterObj));
			// log.info("Request String ::: "+ str_response);
			 * 
			 * 
//			//System.out.println("Response String ::: "+ str_response);
*/			
			/**	added by - vasudev   purpose - using rest service call instead of soap call*/
			RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
			str_response = restFulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_counters"),gson.toJson(counterObj), "GET");
			//System.out.println(" counter Response String ::: "+ str_response);
			
			String responseCode = Response.getResponseCode(str_response);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				counterObj = (Counter)gson.fromJson(str_response, Counter.class); 
				String totalRecords = counterObj.getTotalRecords();
				if(counterObj.getCounters() != null && counterObj.getCounters().size() > 0){
					counterObj.getCounters().get(0).setTotalRecords(totalRecords);
					int slNo = Integer.parseInt(index);
					for(Counter counter : counterObj.getCounters())
						counter.setSlNo(++slNo);
				}
			}
		}catch(ConnectException ce) {
			ce.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
		} catch(RemoteException rme){
			rme.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return counterObj.getCounters();
	}
	/**
	 * @author chaithanya.v  01-12-2016
	 * 
	 * This method is used to get the all counters from server 
	 */
	public WarehouseCounterResponse getWhCounters(String counterId,String location,String customerId, String emailId,String index,boolean search,String maxRecords) {
		
		// log.info("AdminService - getWhCounters");
		String str_response = null;
		WarehouseCounterResponse counterObj = new WarehouseCounterResponse();
		WarehouseCounters counter = new WarehouseCounters();
		String str_counters = "";
		try{
			RestfulServiceConnection restfulServiceConnection =  new RestfulServiceConnection();
			counter.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			if(search){
				counter.setSearchCriteria(counterId);
			}else{
				if(str_counters.equals(counterId)){}
				else{counter.setCounterId(counterId);}
			}
			counter.setWarehouseLocation(location);
			
			/*
			if(location.equals("all") || location.equals(""))
			{
			List<String> myList = new ArrayList<String>(Arrays.asList(locationListAll.split(",")));
			counter.setLocationsList(myList);
			}
			else
		    counter.setWarehouseLocation(location);*/
			
			
			counter.setStartIndex(index);
			counter.setMaxRecords(maxRecords);
			// log.info("Request String ::: "+ gson.toJson(counter));
			//////////////////System.out.println("Request String ::: "+ gson.toJson(counter));
			str_response = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_whcounters"), gson.toJson(counter), "GET");
			// log.info("Request String ::: "+ str_response);
			//////////////System.out.println("get_whcounters........"+str_response);
			String responseCode = Response.getResponseCode(str_response);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				counterObj = (WarehouseCounterResponse)gson.fromJson(str_response, WarehouseCounterResponse.class); 
				
				}
			
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}  catch(Exception e){
			e.printStackTrace();
		}
		return counterObj;
	}
	
	
	
	public List<String> getCustomerDevices(String customerId, String emailId) {
		/**
		 * @author Sambaiah.Y  03-07-2015
		 * 
		 * This method is used to get the all devices from server for a customer
		 */
		//// log.info("AdminService - getCounters");
		String str_response = null;
		List<String> lst_devices = null;
		try{
			CustomerDevices devices = new CustomerDevices();
			//UtilityMasterServiceProxy utilProxy = new UtilityMasterServiceProxy();
			
			devices.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			devices.setCustomerId(customerId);
			
			
			/*// log.info("Request String ::: "+ gson.toJson(devices));
			str_response = utilProxy.getCustomerDevices(gson.toJson(devices));
			// log.info("Response String ::: "+ str_response);
		//	////////////////System.out.println("Response String ::: "+ str_response);
*/			
			/**	added by - vasudev   purpose - using rest service call instead of soap call*/
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			str_response = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_customer_devices"),gson.toJson(devices), "GET");


			String responseCode = Response.getResponseCode(str_response);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				devices = (CustomerDevices)gson.fromJson(str_response, CustomerDevices.class); 
				lst_devices = devices.getDevices();
			}
			
		}catch(ConnectException ce) {
			ce.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
		} catch(RemoteException rme){
			rme.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return lst_devices;
	}

	public String createCounter(Counter counter, String customerId,
			String emailId) {
		/**
		 * @author Sambaiah.Y  03-07-2015
		 * 
		 * This method is used to get the all devices from server for a customer
		 */
		//// log.info("AdminService - getCounters");
		String str_response = null;
		try{
			//CountersProxy counterProxy= new CountersProxy();
			
			counter.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		//	counter.setQuickBill(true);
			
			/*// log.info("Request String ::: "+ gson.toJson(counter));
			str_response = counterProxy.createCounter(gson.toJson(counter));
			// log.info("Request String ::: "+ str_response);
//////System.out.println("Response String ::: "+ str_response);
*/			
			//System.out.println("Request String billcounter create ::: "+ gson.toJson(counter));
			
		//	System.out.println("create Request String billing ::: "+ gson.toJson(counter));
			/**	added by - vasudev   purpose - using rest service call instead of soap call*/
			RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
			str_response = restFulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_counter"), gson.toJson(counter));
			//System.out.println("create Response String billing ::: "+ str_response);
			
			String responseCode = Response.getResponseCode(str_response);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				if(counter.getCounterId() == null || counter.getCounterId().equals(""))
					str_response = AppProperties.getAppMessageByProperty("COUNTER_CREATE_SUCCESS").trim();
				else
					str_response = AppProperties.getAppMessageByProperty("COUNTER_UPDATE_SUCCESS").trim();
			}
			else{
				str_response = Response.getResponseMessage(str_response);
			}
			
		}catch(ConnectException ce) {
			ce.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
		} catch(RemoteException rme){
			rme.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return str_response;
	}
	
	/**
	 * @author Sambaiah.Y  03-07-2015
	 * 
	 * This method is used to get the all devices from server for a customer
	 */
	public String createWhCounter(Counter counter, String customerId,String emailId) {
	
		// log.info("AdminService - getCounters");
		String str_response = null;
		try{
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			counter.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			// log.info("Request String ::: "+ gson.toJson(counter));
			/*str_response = counterProxy.createCounter(gson.toJson(counter));*/
			if(counter.getCounterId() == null || counter.getCounterId().equals(""))
			str_response = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_whcounters"), gson.toJson(counter));
			else
				str_response = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_whcounters"), gson.toJson(counter));
			// log.info("Request String ::: "+ str_response);
			
			String responseCode = Response.getResponseCode(str_response);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				if(counter.getCounterId() == null || counter.getCounterId().equals(""))
					str_response = AppProperties.getAppMessageByProperty("COUNTER_CREATE_SUCCESS").trim();
				else
					str_response = AppProperties.getAppMessageByProperty("COUNTER_UPDATE_SUCCESS").trim();
			}
			else{
				str_response = Response.getResponseMessage(str_response);
			}
			
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}  catch(Exception e){
			e.printStackTrace();
		}
		return str_response;
	}
	/**
	 * @author Mythri.S	
	 * 
	 * This method is used to call the deleteProduct method of web service and return the response
	 * 
	 */
	public String deleteCounter(String customerId,String emailId,String ids){
		String result = null;
		String responseCode = null;
		try {
			String[] idsArray = ids.split(",");
			//CountersProxy counterProxy= new CountersProxy();
			Counter counter = new Counter();
			counter.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			List<String> counterIds = new ArrayList<String>();
			for(int i=0;i<idsArray.length;i++)
				counterIds.add(idsArray[i]);
			counter.setCounterIds(counterIds);
			
			
			/*// log.info("Request String ::: "+ gson.toJson(counter));
			result = counterProxy.deleteCounter(gson.toJson(counter));
			// log.info("Response String:::::::::"+result);*/
			
			/**	added by - vasudev   purpose - using rest service call instead of soap call*/
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			result = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("delete_counter"),gson.toJson(counter) );

			
			
			responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("COUNTER_DELETE_SUCCESS").trim();
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
	 * @author Chaithanya
	 * 
	 * This method is used to call the deleteProduct method of web service and return the response
	 * 
	 */
	public String deleteWhCounter(String customerId,String emailId,String ids){
		String result = null;
		String responseCode = null;
		RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
		
		try {
			String[] idsArray = ids.split(",");
			Counter counter = new Counter();
			counter.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			List<String> counterIds = new ArrayList<String>();
			for(int i=0;i<idsArray.length;i++)
				counterIds.add(idsArray[i]);
			counter.setCounterIds(counterIds);
			// log.info("Request String ::: "+ gson.toJson(counter));
			result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("delete_whcounters"), gson.toJson(counter));
			// log.info("Response String:::::::::"+result);
			responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("COUNTER_DELETE_SUCCESS").trim();
			else if(responseCode.equals(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_FAILED_CODE").trim())))
				result = AppProperties.getAppMessageByProperty("DELETE_FAILED").trim();
		}catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}  catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	
	public List<StoreTaxation> getStoreTaxation(String taxName,String customerId,String emailId,String index,String location,String taxCatedory,boolean search,String maxRecords,String locationListAll){
		String result = null;
		List<StoreTaxation> storeTaxationList = null;
		try {
			//StoreTaxationServiceProxy storeTaxationProxyObj = new StoreTaxationServiceProxy();
			StoreTaxation storeTaxationObj = new StoreTaxation();
			if(search)
				storeTaxationObj.setSearchCriteria(taxName);
			else
				storeTaxationObj.setTaxName(taxName);
			storeTaxationObj.setTaxCategoryName(taxCatedory);
			
			if(location.equals("all") || location.equals("")){
				List<String> myList = new ArrayList<String>(Arrays.asList(locationListAll.split(",")));
				storeTaxationObj.setLocationsList(myList);
			}
			else
			storeTaxationObj.setLocation(location);
			storeTaxationObj.setStartIndex(index);
			storeTaxationObj.setMaxRecords(maxRecords);
			storeTaxationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			
			/*// log.info("Request String:::::::"+gson.toJson(storeTaxationObj));
			//////////////System.out.println("Request String:::::::"+gson.toJson(storeTaxationObj));
			result = storeTaxationProxyObj.getStoreTaxation(gson.toJson(storeTaxationObj));
			// log.info("Response String:::::::"+result);
		//	////////////////System.out.println("Response String:::::::"+result);
*/			
			/**	added by - vasudev   purpose - using rest service call instead of soap call*/
			////////System.out.println("Request String:::::::"+gson.toJson(storeTaxationObj));
			RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
			result = restFulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_store_taxation"),gson.toJson(storeTaxationObj), "GET");
			////////System.out.println(result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				storeTaxationObj = gson.fromJson(result, StoreTaxation.class);
				storeTaxationList = storeTaxationObj.getStoreTaxationList();
				if(index.equals(""))
					index = "0";
				int slNo = Integer.parseInt(index);
				if(storeTaxationList != null && storeTaxationList.size() > 0){
					storeTaxationList.get(0).setTotalRecords(storeTaxationObj.getTotalRecords());
					for(StoreTaxation storeTaxation : storeTaxationList)
						storeTaxation.setSlNo(++slNo);
				}
			}
		} 
		catch (ConnectException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}
		catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return storeTaxationList;
	}
	
	public String createStoreTaxation(StoreTaxation storeTaxationObj,String customerIdStr,String emailIdStr,String roleStr){
		String result = null;
		try {
			//StoreTaxationServiceProxy storeTaxationProxyObj = new StoreTaxationServiceProxy();
			RestfulServiceConnection restfulServiceConnection =  new RestfulServiceConnection();
			storeTaxationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			storeTaxationObj.setUserName(emailIdStr);
			storeTaxationObj.setRoleName(roleStr);

			if(storeTaxationObj.getLocation() != null && (storeTaxationObj.getLocation().equalsIgnoreCase("all") || storeTaxationObj.getLocation().equals(""))){
				List<String> locList = Arrays.asList(storeTaxationObj.getAllLocationsStr().split(","));
				storeTaxationObj.setLocationsList(locList);
			}
    if(storeTaxationObj.getCategoryTypeStr() == "MRPbased" || storeTaxationObj.getCategoryTypeStr().equals("MRPbased")){
    	storeTaxationObj.setMrpBased(true);
    	storeTaxationObj.setQuantityBased(false);
    	
    }else{
    	storeTaxationObj.setMrpBased(false);
    	storeTaxationObj.setQuantityBased(true);
    	
    }
			
			
			////////System.out.println("Request String::::::::::::"+gson.toJson(storeTaxationObj));
			result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_store_taxation"), gson.toJson(storeTaxationObj));
			//// log.info("Response String:::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("STORE_TAXATION_CREATE_SUCCESS").trim();
			else
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
	
	
	public String createWarehouseTaxation(WarehouseTaxation storeTaxationObj,String customerIdStr,String emailIdStr,String roleStr){
		String result = null;
		try {
			//StoreTaxationServiceProxy storeTaxationProxyObj = new StoreTaxationServiceProxy();
			RestfulServiceConnection restfulServiceConnection =  new RestfulServiceConnection();
			storeTaxationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			storeTaxationObj.setUserName(emailIdStr);
			storeTaxationObj.setRoleName(roleStr);

			if(storeTaxationObj.getLocation() != null && (storeTaxationObj.getLocation().equalsIgnoreCase("all") || storeTaxationObj.getLocation().equals(""))){
				List<String> locList = Arrays.asList(storeTaxationObj.getAllLocationsStr().split(","));
				storeTaxationObj.setLocationsList(locList);
			}
    if(storeTaxationObj.getCategoryTypeStr() == "MRPbased" || storeTaxationObj.getCategoryTypeStr().equals("MRPbased")){
    	storeTaxationObj.setMrpBased(true);
    	storeTaxationObj.setQuantityBased(false);
    	
    }else{
    	storeTaxationObj.setMrpBased(false);
    	storeTaxationObj.setQuantityBased(true);
    	
    }
			
			
			////////System.out.println("Request String::::::::::::"+gson.toJson(storeTaxationObj));
			result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_warehouse_taxation"), gson.toJson(storeTaxationObj));
			//// log.info("Response String:::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("WH_TAXATION_CREATE_SUCCESS").trim();
			else
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
	
	public String updateStoreTaxation(StoreTaxation storeTaxationObj,String customerIdStr,String emailIdStr,String roleStr){
		String result = null;
		try {
			//StoreTaxationServiceProxy storeTaxationProxyObj = new StoreTaxationServiceProxy();
			storeTaxationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			storeTaxationObj.setUserName(emailIdStr);
			storeTaxationObj.setRoleName(roleStr);
			if(storeTaxationObj.getCategoryTypeStr() == "MRPbased" || storeTaxationObj.getCategoryTypeStr().equals("MRPbased")){
		    	storeTaxationObj.setMrpBased(true);
		    	storeTaxationObj.setQuantityBased(false);
		    	
		    }else{
		    	storeTaxationObj.setMrpBased(false);
		    	storeTaxationObj.setQuantityBased(true);
		    	
		    }
			
			
			/*// log.info("Request String::::::::::::"+gson.toJson(storeTaxationObj));
			result = storeTaxationProxyObj.updateStoreTaxation(gson.toJson(storeTaxationObj));
			// log.info("Response String:::::::::::"+result);*/
			
			/**	added by - vasudev   purpose - using rest service call instead of soap call*/
			RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
			result = restFulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_store_taxation"),gson.toJson(storeTaxationObj));

			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("STORE_TAXATION_UPDATE_SUCCESS").trim();
			else
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
	
	public String updateWarehouseTaxation(WarehouseTaxation storeTaxationObj,String customerIdStr,String emailIdStr,String roleStr){
		String result = null;
		try {
			//StoreTaxationServiceProxy storeTaxationProxyObj = new StoreTaxationServiceProxy();
			storeTaxationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			storeTaxationObj.setUserName(emailIdStr);
			storeTaxationObj.setRoleName(roleStr);
			if(storeTaxationObj.getCategoryTypeStr() == "MRPbased" || storeTaxationObj.getCategoryTypeStr().equals("MRPbased")){
		    	storeTaxationObj.setMrpBased(true);
		    	storeTaxationObj.setQuantityBased(false);
		    	
		    }else{
		    	storeTaxationObj.setMrpBased(false);
		    	storeTaxationObj.setQuantityBased(true);
		    	
		    }
			
			
			/*// log.info("Request String::::::::::::"+gson.toJson(storeTaxationObj));
			result = storeTaxationProxyObj.updateStoreTaxation(gson.toJson(storeTaxationObj));
			// log.info("Response String:::::::::::"+result);*/
			
			/**	added by - vasudev   purpose - using rest service call instead of soap call*/
			RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
			result = restFulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_warehouse_taxation"),gson.toJson(storeTaxationObj));

			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("WH_TAXATION_UPDATE_SUCCESS").trim();
			else
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
	
	
	
	public List<WarehouseTaxation> getWarehouseTaxation(String taxName,String customerId,String emailId,String index,String location,String taxCatedory,boolean search,String maxRecords,String locationListAll){
		String result = null;
		List<WarehouseTaxation> storeTaxationList = null;
		try {
			//StoreTaxationServiceProxy storeTaxationProxyObj = new StoreTaxationServiceProxy();
			WarehouseTaxation storeTaxationObj = new WarehouseTaxation();
			if(search)
				storeTaxationObj.setSearchCriteria(taxName);
			else
				storeTaxationObj.setTaxName(taxName);
			storeTaxationObj.setTaxCategoryName(taxCatedory);
			storeTaxationObj.setLocation(location);
			storeTaxationObj.setStartIndex(index);
			storeTaxationObj.setMaxRecords(maxRecords);
			storeTaxationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			
			//////System.out.println("Request String:::::::"+gson.toJson(storeTaxationObj));
			/*// log.info("Request String:::::::"+gson.toJson(storeTaxationObj));
			result = storeTaxationProxyObj.getStoreTaxation(gson.toJson(storeTaxationObj));
			// log.info("Response String:::::::"+result);
		//	////////////////System.out.println("Response String:::::::"+result);
*/			
			/**	added by - vasudev   purpose - using rest service call instead of soap call*/
			////////System.out.println("Request String:::::::"+gson.toJson(storeTaxationObj));
			RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
			result = restFulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_warehouse_taxation"),gson.toJson(storeTaxationObj), "GET");

			//////System.out.println(result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				storeTaxationObj = gson.fromJson(result, WarehouseTaxation.class);
				storeTaxationList = storeTaxationObj.getWarehouseTaxations();
				if(index.equals(""))
					index = "0";
				int slNo = Integer.parseInt(index);
				if(storeTaxationList != null && storeTaxationList.size() > 0){
					storeTaxationList.get(0).setTotalRecords(storeTaxationObj.getTotalRecords());
					for(WarehouseTaxation storeTaxation : storeTaxationList)
						storeTaxation.setSlNo(++slNo);
				}
			}
		} 
		catch (ConnectException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}
		catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return storeTaxationList;
	}
	
	
	public String getMirrorStoreTaxation(String customerId,String emailId,String location){
		String result = null;
		
		try {
			
			StoreTaxation storeTaxationObj = new StoreTaxation();
			storeTaxationObj.setLocation(location);
			storeTaxationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
		   // System.out.println("Request Misrror Store String:::::::"+gson.toJson(storeTaxationObj));

			RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
			result = restFulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("mirror_store_taxation"),gson.toJson(storeTaxationObj), "GET");
		  //  System.out.println("Response Misrror Store String:::::::"+result);
			String responseCode = Response.getResponseCode(result);
			
			//String response = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("MIRROR_STORE_TAXATION_SUCCESS").trim();
			else
				result = Response.getResponseMessage(result);
		} 
		catch (ConnectException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}
		catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

	
}

