
/*******************************************************************************
 * Copyright  2015 Omni Retailer Customer Console, All rights reserved.
 * Author : Sahitya P
 * Created On : 2-3-2015
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

import java.io.IOException;
import java.rmi.ConnectException;
import java.rmi.RemoteException;
import java.rmi.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;

import com.tlabs.posweb.init.AppProperties;
import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.technolabssoftware.www.StoreServiceProxy;
import com.tlabs.posweb.beans.DineTable;
import com.tlabs.posweb.beans.Layout;
import com.tlabs.posweb.beans.OutletInfo;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.beans.WarehouseBean;
import com.tlabs.posweb.beans.WarehousePOS;
import com.tlabs.posweb.util.Constants;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
//import com.tlabs.posweb.util.Utilities;
import com.tlabs.posweb.util.RestfulServiceConnection;

/**
 * @author Sahitya
 * Verified By : 
 * 
 * This class is used for calling all methods of Store web service
 */

public class StoreService {
	
	@Autowired
	private Gson gson;
	@Autowired
	SessionScope sessionScope;
	private static Logger log = Logger.getLogger(StoreService.class);
	
	 /**
	  * @author Sahitya
	  * Verified By : 
	  * 
	  * @param customerId,emailId,taxes List,outlet Details List
	  * 
      * This method is used to receive outlet related details from controller then send to webservices for creating outlet
      * 
      * @return Generic Map object with status & required values
      */
	public Map<String,Object> createOutlet(String userIdStr,String emailIdStr,String roleStr,OutletInfo outletInfoObj){
		  String storeResultStr = null,resultStr=null;
		  //StoreServiceProxy storeServiceProxyObj = null;
		  Map<String,Object> responseMap = new HashMap<String, Object>();
		  try{
			/*// log.info("Service calling for create store");
			storeServiceProxyObj = new StoreServiceProxy();*/
			outletInfoObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			outletInfoObj.setUserName(emailIdStr);
			outletInfoObj.setRoleName(roleStr);
			if(outletInfoObj.getStoreStatus()==1)
				outletInfoObj.setOutletStatus(true);
			else
				outletInfoObj.setOutletStatus(false);
			
			/*// log.info("Request String:::"+gson.toJson(outletInfoObj));		
			storeResultStr = storeServiceProxyObj.createStore(gson.toJson(outletInfoObj));
		    // log.info("Response String::::"+storeResultStr);*/
			//System.out.println("requesting"+gson.toJson(outletInfoObj));
			/**	added by - vasudev   purpose - using rest service call instead of soap call*/
			RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
			storeResultStr=restFulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_store"), gson.toJson(outletInfoObj));
             //System.out.println("response"+storeResultStr);
		    
		    outletInfoObj = gson.fromJson(storeResultStr,OutletInfo.class);
			if(outletInfoObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				resultStr = Constants.SUCCESS;
				responseMap.put("result",resultStr);
				responseMap.put("storeCode",outletInfoObj.getStoreCode());
				responseMap.put("selectedLocation",outletInfoObj.getLocationId());
			}else{
				resultStr = outletInfoObj.getResponseHeader().getResponseMessage();
				responseMap.put("result",resultStr);
			}
		}catch(ConnectException ce) {
			ce.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
			responseMap.put("result",resultStr);
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("INVALID_REQUEST");
			responseMap.put("result",resultStr);
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("UNKNOWN_HOST");
			responseMap.put("result",resultStr);
		} catch (IOException ex) {
			ex.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
			responseMap.put("result",resultStr);
		}catch (Exception ex) {
			ex.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
			responseMap.put("result",resultStr);
		}
     return responseMap;
		
	}
	
	
	
	/**
	 * @author Sahitya
	 * Verified By : 
	 * 
	 * @param customerId,emailId,location,layoutName,layoutDesc,tables List 
	 * 
     * This method is used to create specific layout with the given layout related details passed from controller then send to webservices
     * 
     * @return Status
     */
	public String createLayout(String userIdStr,String emailIdStr,String locationStr,String layoutNameStr,String layoutDescStr,String tablesListStr){
		String resultStr = null;
		StoreServiceProxy storeServiceProxy = null;
		Layout layoutObj = null;
		JSONObject tablesObj = null;
		JSONArray tablesArrayObj = null;
		DineTable taxObj = null;
		List<DineTable> dineTablesList = null;
		try{
			// log.info("create Layout in store service");
			layoutObj = new Layout();
			layoutObj.setLocation(locationStr);
			layoutObj.setLayoutName(layoutNameStr);
			layoutObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			layoutObj.setLayoutDescription(layoutDescStr);
			tablesObj = new JSONObject(tablesListStr);
			tablesArrayObj = new JSONArray(tablesObj.getString("tablesList"));
			dineTablesList = new ArrayList<DineTable>(tablesArrayObj.length());			
			for(int i=0;i<tablesArrayObj.length();i++){
				taxObj = gson.fromJson(tablesArrayObj.getString(i), DineTable.class);
				dineTablesList.add(taxObj);
			}
			layoutObj.setTablesList(dineTablesList);
			storeServiceProxy = new StoreServiceProxy();
			layoutObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			// log.info("Request String::::"+gson.toJson(layoutObj));
			
			resultStr = storeServiceProxy.createLayout(gson.toJson(layoutObj));
			
			// log.info("Response String::::"+resultStr);
			
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(Constants.RESPONSE_SUCCESS_CODE)){
				resultStr = Constants.SUCCESS;
			}else{
				resultStr = AppProperties.getAppMessageByProperty("CONTACT_ADMIN");
			}
		}catch(JSONException e){
			e.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("INVALID_REQUEST");
		}catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("INVALID_REQUEST");
		} catch (Exception ex) {
			ex.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
		}
		return resultStr;
	}
	/**
	 * @author Sahitya
	 * Verified By : 
	 * 
	 * @param customerId,emailId,location
	
     * @return Generic Map object with the status and all outlet details
     * added required records by manasa to display selected maxrecords 
     */
	public Map<String,Object> getStoresList(String userIdStr,String emailIdStr,String locationStr,String index,String maxRecords){
		//StoreServiceProxy storeProxyObj = null;
		OutletInfo outletInfoObj = null;
		List<OutletInfo> storesList = null;
		Map<String,Object> responseMapObj = null;
		RestfulServiceConnection restFulServiceConnectionObj = null;
		String resultStr="";
		try{
			//// log.info("Service calling for getting all store details");
			responseMapObj = new HashMap<String,Object>();
			//storeProxyObj = new StoreServiceProxy();
			outletInfoObj = new OutletInfo();
			outletInfoObj.setLocation(locationStr);
			outletInfoObj.setLocationId(locationStr);
			outletInfoObj.setStartIndex(index);
			outletInfoObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			outletInfoObj.setRequiredRecords(maxRecords);//added by manasa
			
			/*// log.info("Request String:::"+new Gson().toJson(outletInfoObj));
			resultStr = storeProxyObj.getStores(new Gson().toJson(outletInfoObj));
			// log.info("Response String:::"+resultStr);*/
			
	///	System.out.println("Request String:::"+new Gson().toJson(outletInfoObj));
			/**	added by - vasudev   purpose - using rest service call instead of soap call*/
			restFulServiceConnectionObj = new RestfulServiceConnection();
			resultStr = restFulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_store"),new Gson().toJson(outletInfoObj),"GET");
			
	///	System.out.println("Response String get_store:::"+resultStr);
			
			outletInfoObj = gson.fromJson(resultStr,OutletInfo.class);
			if(outletInfoObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				storesList = outletInfoObj.getOutlets();
				if(storesList != null && storesList.size() > 0){
					storesList.get(0).setTotalRecords(outletInfoObj.getTotalRecords());
					int slNo = Integer.parseInt(index);
					for(OutletInfo outletInfo: storesList)
						outletInfo.setSlNo(++slNo);
				}
				responseMapObj.put("storeDetailsList", storesList);
				resultStr = Constants.SUCCESS;
				responseMapObj.put("result",resultStr);
				
			}else{
				resultStr = outletInfoObj.getResponseHeader().getResponseMessage();
				responseMapObj.put("result",resultStr);
			}
			
			}catch(ConnectException ce) {
				ce.printStackTrace();
				resultStr = (String) AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
				responseMapObj.put("result",resultStr);
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				resultStr = (String) AppProperties.getAppMessageByProperty("INVALID_REQUEST");
				responseMapObj.put("result",resultStr);
			} catch (UnknownHostException uhe) {
				uhe.printStackTrace();
				resultStr = (String) AppProperties.getAppMessageByProperty("UNKNOWN_HOST");
				responseMapObj.put("result",resultStr);
			} catch(RemoteException rme){
				rme.printStackTrace();
				resultStr = (String) AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
				responseMapObj.put("result",resultStr);
			}catch(Exception e){
			    e.printStackTrace();
			    resultStr = (String) AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
			    responseMapObj.put("result",resultStr);
		    }
		return responseMapObj;
	}
	
	
	public Map<String,Object> getStoresListforOrders(String userIdStr,String emailIdStr,String locationStr,String index,String maxRecords, String businessActivity){
		OutletInfo outletInfoObj = null;
		List<OutletInfo> storesList = null;
		Map<String,Object> responseMapObj = null;
		RestfulServiceConnection restFulServiceConnectionObj = null;
		String resultStr="";
		try{
			responseMapObj = new HashMap<String,Object>();
			outletInfoObj = new OutletInfo();
			outletInfoObj.setLocation(locationStr.trim());
			outletInfoObj.setLocationId(locationStr.trim());
			outletInfoObj.setStartIndex(index);
			outletInfoObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			outletInfoObj.setRequiredRecords(maxRecords);//added by manasa
			
			//System.out.println("Request String StoreDetailsbyLocation:::"+new Gson().toJson(outletInfoObj));
			restFulServiceConnectionObj = new RestfulServiceConnection();
			
			resultStr = restFulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_store"),new Gson().toJson(outletInfoObj),"GET");
			//System.out.println("Response String :::"+resultStr);
			
			outletInfoObj = gson.fromJson(resultStr,OutletInfo.class);
			if(outletInfoObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				storesList = outletInfoObj.getOutlets();
				if(storesList != null && storesList.size() > 0){
					storesList.get(0).setTotalRecords(outletInfoObj.getTotalRecords());
					int slNo = Integer.parseInt(index);
					for(OutletInfo outletInfo: storesList)
						outletInfo.setSlNo(++slNo);
				}
				
				if(!businessActivity.equalsIgnoreCase("")){
					storesList.get(0).setBusinessActivity(businessActivity);
				}
				responseMapObj.put("storeDetailsList", storesList);
				resultStr = Constants.SUCCESS;
				responseMapObj.put("result",resultStr);
				
			}else{
				resultStr = outletInfoObj.getResponseHeader().getResponseMessage();
				responseMapObj.put("result",resultStr);
			}
			
			}catch(ConnectException ce) {
				ce.printStackTrace();
				resultStr = (String) AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
				responseMapObj.put("result",resultStr);
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				resultStr = (String) AppProperties.getAppMessageByProperty("INVALID_REQUEST");
				responseMapObj.put("result",resultStr);
			} catch (UnknownHostException uhe) {
				uhe.printStackTrace();
				resultStr = (String) AppProperties.getAppMessageByProperty("UNKNOWN_HOST");
				responseMapObj.put("result",resultStr);
			} catch(RemoteException rme){
				rme.printStackTrace();
				resultStr = (String) AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
				responseMapObj.put("result",resultStr);
			}catch(Exception e){
			    e.printStackTrace();
			    resultStr = (String) AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
			    responseMapObj.put("result",resultStr);
		    }
		return responseMapObj;
	}
	
	
	public Map<String,Object> getWarehouseStoresListforOrders(String userIdStr,String emailIdStr,String locationStr,String index,String maxRecords, String businessActivity){
		OutletInfo outletInfoObj = null;
		List<OutletInfo> storesList = null;
		Map<String,Object> responseMapObj = null;
		RestfulServiceConnection restFulServiceConnectionObj = null;
		String resultStr="";
		try{
			responseMapObj = new HashMap<String,Object>();
			outletInfoObj = new OutletInfo();
			outletInfoObj.setLocation(locationStr.trim());
			outletInfoObj.setLocationId(locationStr.trim());
			outletInfoObj.setStartIndex(index);
			outletInfoObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			outletInfoObj.setRequiredRecords(maxRecords);//added by manasa
			
	/////		System.out.println("Request String StoreDetailsbyLocation:::"+new Gson().toJson(outletInfoObj));
			restFulServiceConnectionObj = new RestfulServiceConnection();
			if(businessActivity.equals("Warehouse"))
			resultStr = restFulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_warehouse_pos"),new Gson().toJson(outletInfoObj),"GET");
	/////		System.out.println("Response String :::"+resultStr);
			
			outletInfoObj = gson.fromJson(resultStr,OutletInfo.class);
			if(outletInfoObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				storesList = outletInfoObj.getOutlets();
				if(storesList != null && storesList.size() > 0){
					storesList.get(0).setTotalRecords(outletInfoObj.getTotalRecords());
					int slNo = Integer.parseInt(index);
					for(OutletInfo outletInfo: storesList)
						outletInfo.setSlNo(++slNo);
				}
				
				if(!businessActivity.equalsIgnoreCase("")){
					storesList.get(0).setBusinessActivity(businessActivity);
				}
				responseMapObj.put("storeDetailsList", storesList);
				resultStr = Constants.SUCCESS;
				responseMapObj.put("result",resultStr);
				
			}else{
				resultStr = outletInfoObj.getResponseHeader().getResponseMessage();
				responseMapObj.put("result",resultStr);
			}
			
			}catch(ConnectException ce) {
				ce.printStackTrace();
				resultStr = (String) AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
				responseMapObj.put("result",resultStr);
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				resultStr = (String) AppProperties.getAppMessageByProperty("INVALID_REQUEST");
				responseMapObj.put("result",resultStr);
			} catch (UnknownHostException uhe) {
				uhe.printStackTrace();
				resultStr = (String) AppProperties.getAppMessageByProperty("UNKNOWN_HOST");
				responseMapObj.put("result",resultStr);
			} catch(RemoteException rme){
				rme.printStackTrace();
				resultStr = (String) AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
				responseMapObj.put("result",resultStr);
			}catch(Exception e){
			    e.printStackTrace();
			    resultStr = (String) AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
			    responseMapObj.put("result",resultStr);
		    }
		return responseMapObj;
	}
	
	/**
	 * @author Sahitya
	 * Verified By : 
	 * 
	 * @param customerId,emailId,location,layoutName,layoutDesc,tables List 
	 * 
     * This method is used to send specific layout related details from controller then send to webservices
     * 
     * @return status
     */
	public String updateLayout(String userIdStr,String emailIdStr,String outletIdStr,String layoutNameStr,String layoutDescStr, String tablesListStr){
		String resultStr = "",responseCodeStr="";
		//StoreServiceProxy storeServiceProxyObj = null;
		Layout layoutObj = null;
		JSONObject tablesObj = null;
		JSONArray tablesArrayObj = null;
		DineTable taxObj = null;
		List<DineTable> dineTablesList = null;
		try{
			/*// log.info("update Layout in store service");
			storeServiceProxyObj = new StoreServiceProxy();*/
			layoutObj = new Layout();
			layoutObj.setOutletId(outletIdStr);
			layoutObj.setLayoutName(layoutNameStr);
			layoutObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			layoutObj.setLayoutDescription(layoutDescStr);
			tablesObj = new JSONObject(tablesListStr);
			tablesArrayObj = new JSONArray(tablesObj.getString("tablesList"));
			dineTablesList = new ArrayList<DineTable>(tablesArrayObj.length());			
			for(int i=0;i<tablesArrayObj.length();i++){
				taxObj = gson.fromJson(tablesArrayObj.getString(i), DineTable.class);
				dineTablesList.add(taxObj);
			}
			layoutObj.setTablesList(dineTablesList);
			layoutObj.setStartIndex("-1");
			layoutObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			/*// log.info("Request String:::"+gson.toJson(layoutObj));
			resultStr = storeServiceProxyObj.editLayout(gson.toJson(layoutObj));
			// log.info("Repsonse String:::"+resultStr);*/
			
			/**	added by - vasudev   purpose - using rest service call instead of soap call*/
			resultStr = new RestfulServiceConnection().getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("edit_layout"),gson.toJson(layoutObj));

			
			responseCodeStr = Response.getResponseCode(resultStr);
			if(responseCodeStr.equals(Constants.RESPONSE_SUCCESS_CODE)){
				resultStr = Constants.SUCCESS;
			}else{
				resultStr = AppProperties.getAppMessageByProperty("CONTACT_ADMIN");
			}
		}catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("INVALID_REQUEST");
		} catch (Exception ex) {
			ex.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
		}
		return resultStr;
	}
	
	
	
	 /**
	  * @author Sahitya
	  * Verified By : 
	  * 
	  * @param customerId,emailId,taxes List and outlet Details List
	  * 
      * This method is used to receive outlet updated details from controller then send to webservices
      * 
      * @return status
      */
	public String updateOutlet(String userIdStr,String emailIdStr,String roleStr,OutletInfo outletInfoObj){
		
		String resultStr="";
		try{
			//// log.info("Service calling for update store");
			outletInfoObj.setUserName(emailIdStr);
			outletInfoObj.setRoleName(roleStr);
			if(outletInfoObj.getStoreStatus()==1)
				outletInfoObj.setOutletStatus(true);
			else
			outletInfoObj.setOutletStatus(false);
			outletInfoObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//// log.info("Request String::::"+gson.toJson(outletInfoObj));
			//System.out.println("Request String---update_store::::"+gson.toJson(outletInfoObj));
			
			/*StoreServiceProxy storeServiceProxy = new StoreServiceProxy();
			// log.info("Request::::"+gson.toJson(outletInfoObj));
			resultStr = storeServiceProxy.updateStore(gson.toJson(outletInfoObj));
			// log.info("Response:::"+resultStr);*/
			

			/**	added by - vasudev   purpose - using rest service call instead of soap call*/
			RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
			resultStr=restFulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_store"), gson.toJson(outletInfoObj));

			
			////////System.out.println("Response String---::::"+resultStr);
			
			outletInfoObj = gson.fromJson(resultStr, OutletInfo.class);
			if(outletInfoObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				resultStr = Constants.SUCCESS;
			}else{
				resultStr = outletInfoObj.getResponseHeader().getResponseMessage();
			}
		} catch(ConnectException ce) {
			ce.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("INVALID_REQUEST");
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("UNKNOWN_HOST");
		} catch (IOException ex) {
			ex.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
		}catch (Exception ex) {
			ex.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
		}
		return resultStr;
	}
	
	
	 /**
	  * @author Sahitya
	  * Verified By :
	  *  
	  * @param customerId,emailId,outletCode,level
	  * 
      * This method is used to get layout details from webservices then send to controller
      * 
      * @return Generic Map object with status and list of layout information along with Dine Tables List
      */
	public Map<String,Object> getLayout(String userIdStr,String emailIdStr,String storeCode,String level){
		String resultStr,layoutDetailsResponseList=null,responseCodeStr = null;
		Map<String,Object> responseMapObj = null;
		Layout layoutObj = null,layoutBeanObj=null;
		//StoreServiceProxy storeServiceProxyObj =null;
		try{
			/*// log.info("Service calling for getting specific layout");
			storeServiceProxyObj = new StoreServiceProxy();*/
			responseMapObj = new HashMap<String, Object>();
			layoutObj = new Layout();
			layoutObj.setOutletId(storeCode);
			layoutObj.setLevel(level);
			layoutObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			layoutObj.setStartIndex("-1");
			
			/*// log.info("Request String::::"+gson.toJson(layoutObj));
			resultStr = storeServiceProxyObj.getLayout(gson.toJson(layoutObj));
			// log.info("Response String::::"+gson.toJson(resultStr));*/
			
			/**	added by - vasudev   purpose - using rest service call instead of soap call*/
			resultStr = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("get_layout"),gson.toJson(layoutObj), "GET");

			
			responseCodeStr = Response.getResponseCode(resultStr);
			if(responseCodeStr.equals(Constants.RESPONSE_SUCCESS_CODE)){
				layoutDetailsResponseList = Response.getResponseList(resultStr,"layoutDetails");
				layoutBeanObj = gson.fromJson(layoutDetailsResponseList, Layout.class);
				layoutDetailsResponseList = Response.getResponseList(layoutDetailsResponseList,"tablesList");
				resultStr = Constants.SUCCESS;
				responseMapObj.put("tablesList",layoutDetailsResponseList);
				responseMapObj.put("layoutDetails",layoutBeanObj);
				responseMapObj.put("result",resultStr);
			}else{
				responseMapObj.put("tablesList","");
				responseMapObj.put("layoutDetails",new Layout());
				responseMapObj.put("result",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			}
		}catch(ConnectException ce) {
			ce.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
			responseMapObj.put("result",resultStr);
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("INVALID_REQUEST");
			responseMapObj.put("result",resultStr);
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("UNKNOWN_HOST");
			responseMapObj.put("result",resultStr);
		} catch (IOException ex) {
			ex.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
			responseMapObj.put("result",resultStr);
		}catch (Exception ex) {
			ex.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
			responseMapObj.put("result",resultStr);
		}
		return responseMapObj;
	}
	
	
public String updateWareHousePOS(String userIdStr,String emailIdStr,String roleStr,WarehouseBean outletInfoObj){
		
		String resultStr="";
		try{
			//// log.info("Service calling for update store");
			outletInfoObj.setUserName(emailIdStr);
			outletInfoObj.setRoleName(roleStr);
			//outletInfoObj.setWarehouse(true);
			outletInfoObj.setWarehouseId(outletInfoObj.getWarehouseId());
			outletInfoObj.setLocation(outletInfoObj.getLocation());
			
			
				//outletInfoObj.setOutletStatus(true);
			
			
			outletInfoObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//// log.info("Request String::::"+gson.toJson(outletInfoObj));
			//////////System.out.println("Request String---update_store::::"+gson.toJson(outletInfoObj));
			
			/*StoreServiceProxy storeServiceProxy = new StoreServiceProxy();
			// log.info("Request::::"+gson.toJson(outletInfoObj));
			resultStr = storeServiceProxy.updateStore(gson.toJson(outletInfoObj));
			// log.info("Response:::"+resultStr);*/
			
			//////////System.out.println(gson.toJson(outletInfoObj));
			/**	added by - vasudev   purpose - using rest service call instead of soap call*/
			RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
			resultStr=restFulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_warehouse_pos"), gson.toJson(outletInfoObj));

			
			//////////System.out.println("Response String---::::"+resultStr);
			
			outletInfoObj = gson.fromJson(resultStr, WarehouseBean.class);
			if(outletInfoObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				resultStr = Constants.SUCCESS;
			}else{
				resultStr = outletInfoObj.getResponseHeader().getResponseMessage();
			}
		} catch(ConnectException ce) {
			ce.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("INVALID_REQUEST");
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("UNKNOWN_HOST");
		} catch (IOException ex) {
			ex.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
		}catch (Exception ex) {
			
			ex.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
		}
		return resultStr;
	}
	
	

public String createWareHousePOS(String userIdStr,String emailIdStr,String roleStr,WarehouseBean outletInfoObj){
	  String storeResultStr = null,resultStr=null;
	  Map<String,Object> responseMap = new HashMap<String, Object>();
	  try{
		outletInfoObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		outletInfoObj.setUserName(emailIdStr);
		outletInfoObj.setRoleName(roleStr);
		outletInfoObj.setLocation(outletInfoObj.getLocation());
		
		
		
		
		////////System.out.println(gson.toJson(outletInfoObj));
		
		/**	added by - vasudev   purpose - using rest service call instead of soap call*/
		RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
		storeResultStr=restFulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_warehouse_pos"), gson.toJson(outletInfoObj));

	   // ////////System.out.println(storeResultStr);
	    outletInfoObj = gson.fromJson(storeResultStr,WarehouseBean.class);
		if(outletInfoObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
			
				resultStr = Constants.SUCCESS;
			}else{
				resultStr = outletInfoObj.getResponseHeader().getResponseMessage();
			}
		
	}catch(ConnectException ce) {
		ce.printStackTrace();
		resultStr = (String) AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
		responseMap.put("result",resultStr);
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = (String) AppProperties.getAppMessageByProperty("INVALID_REQUEST");
		responseMap.put("result",resultStr);
	} catch (UnknownHostException uhe) {
		uhe.printStackTrace();
		resultStr = (String) AppProperties.getAppMessageByProperty("UNKNOWN_HOST");
		responseMap.put("result",resultStr);
	} catch (IOException ex) {
		ex.printStackTrace();
		resultStr = (String) AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
		responseMap.put("result",resultStr);
	}catch (Exception ex) {
		ex.printStackTrace();
		resultStr = (String) AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
		responseMap.put("result",resultStr);
	}
return resultStr;
	
}

	
}
