package com.tlabs.posweb.services;

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
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.itextpdf.text.log.SysoCounter;
import com.sun.org.apache.bcel.internal.generic.NEW;
import com.technolabssoftware.www.OutletConfigurationsProxy;
import com.technolabssoftware.www.UtilityMasterServiceProxy;
import com.technolabssoftware.www.WHInvoicesProxy;
import com.technolabssoftware.www.WarehouseConfigurationsProxy;
import com.tlabs.posweb.beans.BillOfMaterial;
import com.tlabs.posweb.beans.BillOfMaterialResponse;
import com.tlabs.posweb.beans.EventMaster;
import com.tlabs.posweb.beans.GetStockVerificationDetailsResponse;
import com.tlabs.posweb.beans.InvoiceBean;
import com.tlabs.posweb.beans.InvoiceResponse;
import com.tlabs.posweb.beans.LocationBean;
import com.tlabs.posweb.beans.Menu;
import com.tlabs.posweb.beans.Outlet;
import com.tlabs.posweb.beans.OutletStorageSystem;
import com.tlabs.posweb.beans.OutletStorageSystemDetails;
import com.tlabs.posweb.beans.ProcessingAndPackaging;
import com.tlabs.posweb.beans.RequestBean;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.beans.Verification;
import com.tlabs.posweb.beans.WHInvoice;
import com.tlabs.posweb.beans.WHStockVerificationPosting;
import com.tlabs.posweb.beans.WareHouseGatepassResponse;
import com.tlabs.posweb.beans.WareHouseStockVerification;
import com.tlabs.posweb.beans.WareHouseStockVerificationBean;
import com.tlabs.posweb.beans.Warehouse;
import com.tlabs.posweb.beans.WarehouseBean;
import com.tlabs.posweb.beans.WarehouseBomRequest;
import com.tlabs.posweb.beans.WarehouseGatepass;
import com.tlabs.posweb.beans.WarehouseGatepassItems;
import com.tlabs.posweb.beans.WarehousePOS;
import com.tlabs.posweb.beans.WarehousePicklistMaster;
import com.tlabs.posweb.beans.WarehouseProductBom;
import com.tlabs.posweb.beans.WarehouseResponse;
import com.tlabs.posweb.beans.WarehouseStorageSystems;
import com.tlabs.posweb.util.Constants;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
import com.tlabs.posweb.util.RestfulServiceConnection;
//import com.tlabs.posweb.util.Utilities;

public class WarehouseService {
	@Autowired
	private Gson gson;
	@Autowired
	SessionScope sessionScope;
	
	private static Logger log = Logger.getLogger(WarehouseService.class);
	public Warehouse createWarehouse(Warehouse obj_warehouse) {
		/* Developed By : Sambaiah Y
		 * Created On   : 23-06-2015
		 * This method is used to save the warehouse details and 
		 * warehouse storage system details in database
		 *  
		 * */
		// log.info("WarehouseService - createWarehouse()");
		String str_response = null;
		String url="";
		try{
			//WarehouseConfigurationsProxy warehouseProxy = new WarehouseConfigurationsProxy();
			obj_warehouse.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			/*// log.info("Request String :::"+gson.toJson(obj_warehouse));
			String response = warehouseProxy.createWarehouse(gson.toJson(obj_warehouse));
			// log.info("Response String :::"+response);*/
			
			/*		added by - vasudev   purpose - using rest service call instead of soap call*/	
			
			
	    if(obj_warehouse.getRemoteMonitoringStr().equals("true")){
				
				obj_warehouse.setRemoteMonitoring(true);
			}
			
             if(obj_warehouse.getIsItDistributionCenterStr().equals("true")){
				
				obj_warehouse.setItDistributionCenter(true);
			} 
             if(obj_warehouse.getIsItFranchiseStr().equals("true")){
				
				obj_warehouse.setItFranchise(true);
			}
             if(obj_warehouse.getTestWarehouseStr().equals("true")){
				
				obj_warehouse.setTestWarehouse(true);
			}
             if(obj_warehouse.getPosEnabledStr().equals("true")){
				
				obj_warehouse.setPosEnabled(true);
			}
             if(obj_warehouse.getAuthorizedPicklistStr().equals("true")){
				
				obj_warehouse.setAuthorizedPicklist(true);
			}
             if(obj_warehouse.getSecuredStr().equals("true")){
				
				obj_warehouse.setSecured(true);
			}
             if(obj_warehouse.getStorageSystemEnabledStr().equals("true")){
 				
 				obj_warehouse.setStorageSystemEnabled(true);
 			}
            obj_warehouse.setWarehouse(true);
            
               if(obj_warehouse.getWarehouse_statusStr().equals("Enable")){
 				
 				obj_warehouse.setWarehouseStatusStr("Enable");
 			}else{
 				obj_warehouse.setWarehouseStatusStr("Disable");
 			}
			
              ////////System.out.println(gson.toJson(obj_warehouse));
             
             String operatons = obj_warehouse.getOperation();
			
             if(obj_warehouse.getOperation().equals("edit")){
 				
 				url = AppProperties.getRESTFulCloudServiceURL("update_warehouse");
 			}else{
 			
 			   url = AppProperties.getRESTFulCloudServiceURL("create_warehouse");
 			}
			String warehouseList=gson.toJson(obj_warehouse);
			
			////////System.out.println(warehouseList);
			RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
			String response=restFulServiceConnectionObj.getResponseFromPost(url, warehouseList );
			
			obj_warehouse = gson.fromJson(response,Warehouse.class);
			
			String responseCode = Response.getResponseCode(response);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				
				
				if(operatons.equals("edit"))
					obj_warehouse.getResponseHeader().setResponseMessage(AppProperties.getAppMessageByProperty("WAREHOUSE_UPDATE_SUCCESS").trim());	
				else
					obj_warehouse.getResponseHeader().setResponseMessage(AppProperties.getAppMessageByProperty("WAREHOUSE_CREATED_SUCCESS").trim());
				
				
			}
			else{
				//result = "Couldn't create, please try after some time";
				str_response = Response.getResponseMessage(response);
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
		return obj_warehouse;
	}
	public List<Warehouse> getWarehouses(Warehouse warehouse) {
		
		/* Developed By : Sambaiah Y
		 * Created On   : 23-06-2015
		 * This method is used get the all warehouse from database based on the pagination
		 *  
		 * */
		String str_response = null;
		List<Warehouse> warehouses = null;
		Warehouse obj_warehouse = null;
		try {
			warehouses = new ArrayList<Warehouse>();
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			
			
		    warehouse.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		    
		     ////////System.out.println("Request STring ::::"+gson.toJson(warehouse));
			str_response = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_warehoses"), gson.toJson(warehouse),"GET");
			 ////////System.out.println("response string warehouse list::::"+str_response);
			/* convert response string to list */
			String responseCode = Response.getResponseCode(str_response);
			
			
			
			
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				String responseList = Response.getResponseList(str_response, "warehouses");
				JSONArray jsonResponseArray = new JSONArray(responseList);
				for (int i=0; i<jsonResponseArray.length(); i++) {
					obj_warehouse = gson.fromJson(jsonResponseArray.getString(i), Warehouse.class);
					warehouses.add(obj_warehouse);
				}
				if(warehouses != null && warehouses.size() > 0)
					warehouses.get(0).setTotalRecords(Response.getResponseTotalRecords(str_response));
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
		return warehouses;
	}
	public WarehouseResponse getWarehouseDetails(Warehouse warehouse) {
		/* Developed By : Sambaiah Y
		 * Created On   : 24-06-2015
		 * This method is used get the selected warehouse details and storage systems for the warehouse
		 *  
		 * */
		// log.info("WarehouseService - getWarehouses()");
		String str_response = null;
		WarehouseResponse response = null;
		try {
			response = new WarehouseResponse();
			warehouse.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			/*WarehouseConfigurationsProxy warehouseProxy = new WarehouseConfigurationsProxy();			
			str_response = warehouseProxy.getWarehouseDetails(gson.toJson(warehouse));*/
			////////System.out.println(gson.toJson(warehouse));
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			str_response = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_warehouseDetails"), gson.toJson(warehouse),"GET");
			/* convert response string to list */
			 ////////System.out.println(str_response);
			String responseCode = Response.getResponseCode(str_response);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				response = gson.fromJson(str_response,WarehouseResponse.class); 
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
		return response;
	}
	
	public WarehousePOS getWarehouseposDetails(Warehouse warehouse) {
		/* Developed By : Sambaiah Y
		 * Created On   : 24-06-2015
		 * This method is used get the selected warehouse details and storage systems for the warehouse
		 *  
		 * */
		// log.info("WarehouseService - getWarehouses()");
		String str_response = null;
		WarehousePOS response = null;
		try {
			response = new WarehousePOS();
			warehouse.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			/*WarehouseConfigurationsProxy warehouseProxy = new WarehouseConfigurationsProxy();			
			str_response = warehouseProxy.getWarehouseDetails(gson.toJson(warehouse));*/
			
			// System.out.println("Request string getWarehouseposDetails::"+gson.toJson(warehouse));
			
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			str_response = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_warehouse_pos"), gson.toJson(warehouse),"GET");
			/* convert response string to list */
		  // System.out.println("Response string ::"+str_response);
			String responseCode = Response.getResponseCode(str_response);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				response = gson.fromJson(str_response,WarehousePOS.class); 
			}else {
				response = gson.fromJson(str_response,WarehousePOS.class); 
			}
			 // System.out.println(new Gson().toJson(response));
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
		return response;
	}
	
	
	public String updateWarehouseDetails(Warehouse warehouse) {
		/* Developed By : Sambaiah Y
		 * Created On   : 23-06-2015
		 * This method is used to update  the warehouse details and 
		 * in database
		 *  
		 * */
		// log.info("WarehouseService - updateWarehouseDetails()");
		String str_response = null;
		try{
			//WarehouseConfigurationsProxy warehouseProxy = new WarehouseConfigurationsProxy();
			warehouse.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			/*// log.info("Request String :::"+gson.toJson(warehouse));
			String response = warehouseProxy.updateWarehouse(gson.toJson(warehouse));
			// log.info("Response String :::"+response);*/
			
			/*	added by - vasudev   purpose - using rest service call instead of soap call*/	
			String warehouseList=gson.toJson(warehouse);
			String url = AppProperties.getRESTFulCloudServiceURL("update_warehouse");
			RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
			String response=restFulServiceConnectionObj.getResponseFromPost(url, warehouseList );
			
			String responseCode = Response.getResponseCode(response);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				str_response = AppProperties.getAppMessageByProperty("WAREHOUSE_UPDATE_SUCCESS").trim();
				
			}
			else{
				str_response = Response.getResponseMessage(response);
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
	public String updateWarehouseStorageSystems(Warehouse warehouse) {
		/* Developed By : Sambaiah Y
		 * Created On   : 23-06-2015
		 * 
		 * This method is to update storage systems for selected warehouse
		 *  
		 * */
		//// log.info("WarehouseService - updateWarehouseStorageSystems()");
		String str_response = null;
		try{
			//WarehouseConfigurationsProxy warehouseProxy = new WarehouseConfigurationsProxy();
			warehouse.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			/*// log.info("Request String :::"+gson.toJson(warehouse));
			String response = warehouseProxy.updateWarehouseStorageSystems(gson.toJson(warehouse));
			// log.info("Response String :::"+response);*/
			
			/**		added by - vasudev   purpose - using rest service call instead of soap call*/	
			RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
			String response=restFulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_warehouse_storagesystem"), gson.toJson(warehouse));

			String responseCode = Response.getResponseCode(response);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				str_response = AppProperties.getAppMessageByProperty("WAREHOUSE_UPDATE_SUCCESS").trim();
				
			}
			else{
				str_response = Response.getResponseMessage(response);
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
	@SuppressWarnings({ "rawtypes", "unused", "unchecked" })
	public String deleteWarehouses(String customerId, String emailId, String ids) {
		/* Developed By : Sambaiah Y
		 * Created On   : 23-06-2015
		 * This method is used to save the warehouse details and 
		 * warehouse storage system details in database
		 *  
		 * */
		//// log.info("WarehouseService - deleteWarehouses()");
		String str_response = null;
		List lst_warehouse = null;
		Warehouse warehouse = null;
		try{
			lst_warehouse = new ArrayList();
			warehouse = new Warehouse();
			List<String> warehouses = new ArrayList<String>();
			warehouse.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			String[] warehouseIds = ids.split(",");
			for(int i=0;i<warehouseIds.length;i++){
				lst_warehouse.add(warehouseIds[i]);
			}
			warehouse.setWarehouseIds(lst_warehouse);
			/*WarehouseConfigurationsProxy warehouseProxy = new WarehouseConfigurationsProxy();
			// log.info("Request String :::"+gson.toJson(warehouse));
			String response = warehouseProxy.deleteWarehouses(gson.toJson(warehouse));
			// log.info("Response String :::"+response);*/
			/**     added by - vasudev   purpose - using rest service call instead of soap call*/	
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			String response=restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("delete_warehouse"), gson.toJson(warehouse));

			
			String responseCode = Response.getResponseCode(response);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				str_response = Response.getResponseMessage(response);
			}
			else{
				//result = "Couldn't create, please try after some time";
				str_response = Response.getResponseMessage(response);
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
	public String saveStorageSystems(Outlet outlet) {
		//// log.info("OutletConfigurationService - saveStorageSystems()");
		String response = null;
		String str_response = null;
		try{
			/*OutletConfigurationsProxy proxy = new OutletConfigurationsProxy();
			// log.info("Request String ::: "+ gson.toJson(outlet));*/
			outlet.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			/*response = proxy.createOutletStorageSystems(gson.toJson(outlet));
			// log.info("Response ::: "+ response);*/
			
			/*     added by - vasudev   purpose - using rest service call instead of soap call*/
			RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
			response=restFulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_outlet_storage_system"), gson.toJson(outlet));

			String responseCode = Response.getResponseCode(response);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				str_response = AppProperties.getAppMessageByProperty("OUTLET_CREATED_SUCCESS").trim();
				
			}
			else{
				//result = "Couldn't create, please try after some time";
				str_response = Response.getResponseMessage(response);
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
	 * @author Sambaiah.Y
	 * @createdon  20-07-2015
	 * 
	 * @param userIdStr
	 * @param emailIdStr
	 * @param storageSystems
	 * @return
	 * 			This method is used to get the all storage system details based on the outlet
	 */
	public List<OutletStorageSystem> getOutletStorageSystems(OutletStorageSystem storageSystems) {
		//// log.info("OutletConfigurationService - saveStorageSystems()");
		List<OutletStorageSystem> lst_systems = null;
		String response = null;
		WarehouseResponse outletStorageSystems = null;
		try{
			//OutletConfigurationsProxy proxy = new OutletConfigurationsProxy();
			lst_systems = new ArrayList<OutletStorageSystem>();
			storageSystems.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//System.out.print("Request String ::: "+ gson.toJson(storageSystems));
			//response = proxy.getOutletStorageSystems(gson.toJson(storageSystems));
			// log.info("Response String ::: "+ response);*/
			
			/**     added by - vasudev   purpose - using rest service call instead of soap call*/
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			response=restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_outlet_storage_system"),gson.toJson(storageSystems) , "GET");
//System.out.println(response);
			
			String responseCode = Response.getResponseCode(response);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				outletStorageSystems = gson.fromJson(response,WarehouseResponse.class);
			}
			/*for(OutletStorageSystem storages :outletStorageSystems.getOutletStorageSystems()){
				lst_systems.add(storages);
			}*/
			for(OutletStorageSystem storages :outletStorageSystems.getOutletLayouotDetails()){
				lst_systems.add(storages);
			}
			// log.info(gson.toJson(lst_systems));
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return lst_systems;
	}
	public String updateOutletStorageSystems(Outlet outlet) {
		//// log.info("WarehouseService - updateOutletStorageSystems()");
		String response = null;
		String str_response = null;
		try{
			//OutletConfigurationsProxy proxy = new OutletConfigurationsProxy();
			outlet.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			/*// log.info("Request String ::: "+ gson.toJson(outlet));
			response = proxy.updateOutletStorageSystems(gson.toJson(outlet));
			// log.info("Response ::: "+ response);*/
			//System.out.println("Request String ::: "+ gson.toJson(outlet));
			/*     added by - vasudev   purpose - using rest service call instead of soap call*/
			RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
			response=restFulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("update_outlet_storage_system"), gson.toJson(outlet),"POST");
          //  System.out.println("Response String ::: "+response);
			
			String responseCode = Response.getResponseCode(response);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				str_response = AppProperties.getAppMessageByProperty("OUTLET_UPDATED_SUCCESS").trim();
				
			}
			else{
				str_response = Response.getResponseMessage(response);
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
		return response;
}
	 /**@author Sambaiah.Y
     * @createdon 05-10-2015
     * @param storeCode
     * @param storeLocation
     * @param request
     * @return
     * This method is used to get the selected storage system details from database
     */
	public List<OutletStorageSystemDetails> getStorageSystemDetails(OutletStorageSystem system) {
		//// log.info("OutletConfigurationService - getStorageSystemDetails()");

		List<OutletStorageSystemDetails> details  = null;
		String response = null;
		//OutletConfigurationsProxy proxy = null;
		/*OutletStorageSystemDetails objDetails = null;*/
		OutletStorageSystem objDetails = null;
		try{
			objDetails = new OutletStorageSystem();
			//proxy = new OutletConfigurationsProxy();
			details = new ArrayList<OutletStorageSystemDetails>();
			system.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			/*// log.info("Request String ::: "+ gson.toJson(system));
			response = proxy.getOutletStorageSystemDetails(gson.toJson(system));
			// log.info("Response String :::"+ response);*/
		//	System.out.println("getStorageSystemDetails::::::::::"+gson.toJson(system));
			/**     added by - vasudev   purpose - using rest service call instead of soap call*/
			RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
			response = restFulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_outlet_storage_system"), gson.toJson(system),"GET");

	//		response="{\"storageSystemId\":\"editOutletStorageSystem1id\",\"storageSystemName\":\"shelf\",\"storageSystemType\":\"Shelf\",\"storageLocation\":\" 33# 26#visible\",\"rows\":5,\"columns\":5,\"length\":0,\"width\":0,\"editSystemId\":\"\",\"outletStorageSystemsDetails\":[{\"storageSystemId\":\"S0\",\"level\":\"L1\",\"column\":\"C1\",\"product\":\"\",\"quantity\":\"6190.5\",\"description\":\"EVEREST HING PWD 50G\",\"category\":\"\",\"skuId\":\"000357\",\"notation\":\"S0L1C1\"},{\"storageSystemId\":\"S0\",\"level\":\"L1\",\"column\":\"C2\",\"product\":\"\",\"quantity\":\"\",\"description\":\"\",\"category\":\"\",\"skuId\":\"123\",\"notation\":\"S0L1C2\"},{\"storageSystemId\":\"S0\",\"level\":\"L1\",\"column\":\"C3\",\"product\":\"\",\"quantity\":\"\",\"description\":\"\",\"category\":\"\",\"skuId\":\"\",\"notation\":\"S0L1C3\"},{\"storageSystemId\":\"S0\",\"level\":\"L1\",\"column\":\"C4\",\"product\":\"\",\"quantity\":\"\",\"description\":\"\",\"category\":\"\",\"skuId\":\"\",\"notation\":\"S0L1C4\"},{\"storageSystemId\":\"S0\",\"level\":\"L1\",\"column\":\"C5\",\"product\":\"\",\"quantity\":\"\",\"description\":\"\",\"category\":\"\",\"skuId\":\"\",\"notation\":\"S0L1C5\"},{\"storageSystemId\":\"S0\",\"level\":\"L2\",\"column\":\"C1\",\"product\":\"\",\"quantity\":\"\",\"description\":\"\",\"category\":\"\",\"skuId\":\"\",\"notation\":\"S0L2C1\"},{\"storageSystemId\":\"S0\",\"level\":\"L2\",\"column\":\"C2\",\"product\":\"\",\"quantity\":\"\",\"description\":\"\",\"category\":\"\",\"skuId\":\"\",\"notation\":\"S0L2C2\"},{\"storageSystemId\":\"S0\",\"level\":\"L5\",\"column\":\"C3\",\"product\":\"\",\"quantity\":\"\",\"description\":\"\",\"category\":\"\",\"skuId\":\"\",\"notation\":\"S0L5C3\"},{\"storageSystemId\":\"S0\",\"level\":\"L5\",\"column\":\"C4\",\"product\":\"\",\"quantity\":\"\",\"description\":\"\",\"category\":\"\",\"skuId\":\"\",\"notation\":\"S0L5C4\"},{\"storageSystemId\":\"S0\",\"level\":\"L5\",\"column\":\"C5\",\"product\":\"\",\"quantity\":\"\",\"description\":\"\",\"category\":\"\",\"skuId\":\"\",\"notation\":\"S0L5C5\"}],\"serialNumber\":\"0\"}";
			String responseCode = Response.getResponseCode(response);
			//String responseCode="0";
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				objDetails = gson.fromJson(response,OutletStorageSystem.class);
			}
			
			
			
			
			for(OutletStorageSystemDetails storages :objDetails.getOutletLayouotDetails().get(0).getStoragesInformation()){
				details.add(storages);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return details;
	}
	 /**@author Sambaiah.Y
     * @createdon 05-10-2015
     * @param storeCode
     * @param storeLocation
     * @param request
     * @return
     * This method is used to update the selected storage systemdetails on database
     */
	public String updateStorageSystemDetails(OutletStorageSystem storageSystemDetails) {
		//// log.info("OutletConfigurationService - updateStorageSystemDetails()");
		String response = null;
		String str_response = null;
		try{
			//OutletConfigurationsProxy proxy = new OutletConfigurationsProxy();
			storageSystemDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			/*// log.info("Request String ::: "+ gson.toJson(storageSystemDetails));
			response = proxy.updateStorageSystemDetails(gson.toJson(storageSystemDetails));
			// log.info("Response ::: "+ response);*/
			/**     added by - vasudev   purpose - using rest service call instead of soap call*/
			RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
			response=restFulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("update_outlet_storagesystem_details"), gson.toJson(storageSystemDetails),"POST");

			String responseCode = Response.getResponseCode(response);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				str_response = AppProperties.getAppMessageByProperty("STORAGE_SYSTEM_UPDATED_SUCCESS").trim();
			}
			else{
				//result = "Couldn't create, please try after some time";
				str_response = Response.getResponseMessage(response);
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
	
	
public String createShipmentGatePass(WarehouseGatepass warehouseGatepassobj,String customerId, String emailId) {
		
		/* Developed By : Vamsi V
		 * Created On   : 06-02-2017
		 * This method is used create shipment gatepass.
		 *  
		 * */
		// log.info("WarehouseService - createShipmentGatePass()");
		String result = null;
		
		try {
			gson=new Gson();
			
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
		    warehouseGatepassobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerId,emailId));
			//////////// ////////System.out.println("servicesss"+warehouseGatepassobj.getStartDateStr());
			// log.info("Request String :::"+ gson.toJson(warehouseGatepassobj));
			if(warehouseGatepassobj.getGatePassRef() == "" || warehouseGatepassobj.getGatePassRef() == null)
			{
				result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_WarehouseGatepass"), gson.toJson(warehouseGatepassobj));
			} else
			{
			result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_WarehouseGatepass"), gson.toJson(warehouseGatepassobj));
			}
			// log.info("Response String:::::::::::"+result);
			/* convert response string to list */
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("ShipmentGatePass_CREATE_SUCCESS").trim();
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
public List<WarehouseGatepass> getShipmentGatepass(String index,String maxRecords,String customerId, String emailId) {
	// log.info("WarehouseService - getShipmentGatepass()");
	String result= null;
	List<WarehouseGatepass> warehousegatepass = new ArrayList<WarehouseGatepass>();
//	RequestBean requestBeanObj = null;
	//Warehouse obj_warehouse = null;
	try {
		gson=new Gson();
		WarehouseGatepass warehouseGatepassobj =new WarehouseGatepass();
		RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
		warehouseGatepassobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerId,emailId));
		warehouseGatepassobj.setStartIndex(index);
		warehouseGatepassobj.setMaxRecords(maxRecords);
		////////// ////////System.out.println("servicesss"+warehouseGatepassobj.getStartDateStr());
		// log.info("Request String :::"+ gson.toJson(warehouseGatepassobj));
		result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_WarehouseGatepass"), gson.toJson(warehouseGatepassobj), "GET");
		// log.info("Response String:::::::::::"+result);
		/* convert response string to list */
		WareHouseGatepassResponse wareHouseGatepassResponseobj = gson.fromJson(result,WareHouseGatepassResponse.class);
		if (wareHouseGatepassResponseobj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)) {
			for(WarehouseGatepass warehouseGatepass :wareHouseGatepassResponseobj.getGatePass()){
				warehousegatepass.add(warehouseGatepass);
			}
				
			}
		
		/*String responseCode = Response.getResponseCode(result);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
			result = AppProperties.getAppMessageByProperty("ShipmentGatePass_CREATE_SUCCESS").trim();
		else
			result = Response.getResponseMessage(result);*/
	
	}catch (NoSuchElementException nse) {
		nse.printStackTrace();
		result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	} catch(Exception e){
		e.printStackTrace();
	}
	return warehousegatepass;
}
public  WarehouseGatepass viewEditGatepass(String gatePassRef,String customerId, String emailId) {
	// log.info("WarehouseService - viewEditGatepass()");
	String result= null;
	WarehouseGatepass warehouseGatepassobj=null;
	//Warehouse obj_warehouse = null;
	try {
		gson=new Gson();
		warehouseGatepassobj=new WarehouseGatepass();
		RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
		warehouseGatepassobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerId,emailId));
		warehouseGatepassobj.setGatePassRef(gatePassRef);
		warehouseGatepassobj.setStartIndex("1");
		//////////// ////////System.out.println("servicesss"+warehouseGatepassobj.getGatePassRef());
		// log.info("Request String :::"+ gson.toJson(warehouseGatepassobj));
		result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_WarehouseGatepass"), gson.toJson(warehouseGatepassobj), "GET");
		// log.info("Response String:::::::::::"+result);
		/* convert response string to list */
		WareHouseGatepassResponse wareHouseGatepassResponseobj = gson.fromJson(result,WareHouseGatepassResponse.class);
		if (wareHouseGatepassResponseobj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)) {
			warehouseGatepassobj=wareHouseGatepassResponseobj.getGatePassObj();
				
			}
		
		/*String responseCode = Response.getResponseCode(result);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
			result = AppProperties.getAppMessageByProperty("ShipmentGatePass_CREATE_SUCCESS").trim();
		else
			result = Response.getResponseMessage(result);*/
	
	}catch (NoSuchElementException nse) {
		nse.printStackTrace();
		result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	} catch(Exception e){
		e.printStackTrace();
	}
	return warehouseGatepassobj;
}
public List<WarehouseGatepassItems> searchShipmentGatepass(String customerId, String emailId,String searchNameStr,String storeLocation) {
	// log.info("WarehouseService - searchShipmentGatepass()");
	String result= null;
	List<WarehouseGatepassItems> warehousegatepass = new ArrayList<WarehouseGatepassItems>();
	RequestBean requestBeanObj = null;
	//Warehouse obj_warehouse = null;
	try {
		gson=new Gson();
		WarehouseGatepass warehouseGatepassobj =new WarehouseGatepass();
		RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
		//////////// ////////System.out.println("search name is"+searchNameStr);
		requestBeanObj = new RequestBean();
		requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerId,emailId));
		requestBeanObj.setSearchCriteria(searchNameStr);
		requestBeanObj.setStartIndex("0");
		requestBeanObj.setStoreLocation(storeLocation);
		//requestBeanObj.setMaxRecords(maxRecords);
		warehouseGatepassobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerId,emailId));
		//////////// ////////System.out.println("servicesss"+warehouseGatepassobj.getStartDateStr());
		// log.info("Request String :::"+ gson.toJson(warehouseGatepassobj));
		result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_WarehouseGatepass"), gson.toJson(requestBeanObj), "GET");
		// log.info("Response String:::::::::::"+result);
		/* convert response string to list */
		WareHouseGatepassResponse wareHouseGatepassResponseobj = gson.fromJson(result,WareHouseGatepassResponse.class);
		if (wareHouseGatepassResponseobj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)) {
			for(WarehouseGatepass warehouseGatepassobjs :wareHouseGatepassResponseobj.getGatePass()){
				warehousegatepass.addAll(warehouseGatepassobjs.getGatePassItems());
			}
				
			}
		
		/*String responseCode = Response.getResponseCode(result);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
			result = AppProperties.getAppMessageByProperty("ShipmentGatePass_CREATE_SUCCESS").trim();
		else
			result = Response.getResponseMessage(result);*/
	
	}catch (NoSuchElementException nse) {
		nse.printStackTrace();
		result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	} catch(Exception e){
		e.printStackTrace();
	}
	return warehousegatepass;
}
public ArrayList<LocationBean> getLocationDetails(String locationId,String customerId,String emailId,String index,String businessActivity,boolean search,boolean allLocations,boolean status){
	ArrayList<LocationBean> locationDetails = null;
	String result = null;
	try{
		LocationBean locationBean = new LocationBean();
		locationBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerId,emailId));
		if(search)
			locationBean.setSearchCriteria(locationId);
		else
		   locationBean.setLocationId(locationId);
		locationBean.setStartIndex(index);
		locationBean.setBusinessActivity(businessActivity);
		locationBean.setAllLocations(allLocations);
		locationBean.setStatus(status);
		
		/*UtilityMasterServiceProxy utitlitymaster = new UtilityMasterServiceProxy();
		// log.info("Request String::::::"+gson.toJson(locationBean));
		result = utitlitymaster.getLocation(gson.toJson(locationBean));
		// log.info("Response String::::::"+result);*/
		
		/**		added by - vasudev   purpose - using rest service call instead of soap call*/
		result = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("get_locations"), gson.toJson(locationBean),"POST");

		String responseCode = Response.getResponseCode(result);
		JSONObject jsonResult = new JSONObject(result);
		String totalRecords = jsonResult.getString("totalRecords");
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			String responseList = Response.getResponseList(result, "locationDetails");
			JSONArray jsonResponseArray = new JSONArray(responseList);
			locationDetails = new ArrayList<LocationBean>();
			int slNo = Integer.parseInt(index);
			for (int i=0; i<jsonResponseArray.length(); i++) {
				locationBean = gson.fromJson(jsonResponseArray.getString(i), LocationBean.class);
				locationBean.setTotalRecords(totalRecords);
				locationBean.setStartValue(index);
				locationBean.setSlNo(++slNo);
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
	return locationDetails;
}
public WareHouseGatepassResponse searchGatepass(String startDate,String endDate,String index,String maxRecords,String customerId, String emailId,String searchNameStr,String storeLocation) {
	// log.info("WarehouseService - searchGatepass()");
	String result= null;
//	List<WarehouseGatepass> warehousegatepass = new ArrayList<WarehouseGatepass>();
//	RequestBean requestBeanObj = null;
	WareHouseGatepassResponse wareHouseGatepassResponseobj= null;
	//Warehouse obj_warehouse = null;
	try {
		gson=new Gson();
		WarehouseGatepass warehouseGatepassobj =new WarehouseGatepass();
		RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
		warehouseGatepassobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerId,emailId));
		warehouseGatepassobj.setStartDateStr(startDate);
		warehouseGatepassobj.setEndDateStr(endDate);
		warehouseGatepassobj.setSearchCriteria(searchNameStr);
		warehouseGatepassobj.setStartIndex(index);
		warehouseGatepassobj.setLocationId(storeLocation);
		warehouseGatepassobj.setMaxRecords(maxRecords);
		//////////// ////////System.out.println("servicesss"+warehouseGatepassobj.getStartDateStr());
		// log.info("Request String :::"+ gson.toJson(warehouseGatepassobj));
		result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_WarehouseGatepass"), gson.toJson(warehouseGatepassobj), "GET");
		// log.info("Response String:::::::::::"+result);
		/* convert response string to list */
		wareHouseGatepassResponseobj=new WareHouseGatepassResponse();
		String responseCode = Response.getResponseCode(result);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			wareHouseGatepassResponseobj = gson.fromJson(result,WareHouseGatepassResponse.class); 
		}
		
	
	}catch (NoSuchElementException nse) {
		nse.printStackTrace();
		result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	} catch(Exception e){
		e.printStackTrace();
	}
	return wareHouseGatepassResponseobj;
}


/*public InvoiceBean getWarehouseInvoice(String index,String maxRecords,String invoiceId,String customerIdStr,String emailIdStr) {
	
	// log.info("WarehouseService - getInvoices()");
	String str_response = null;
	RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
	
	InvoiceBean invoice=new InvoiceBean();
	
	
	try {
		
		invoice.setMaxRecords(maxRecords);
		invoice.setStartIndex(index);
		invoice.setInvoiceId(invoiceId);
		invoice.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr,emailIdStr));
		
		// log.info("Request String :::"+gson.toJson(invoice));
		////////// ////////System.out.println(gson.toJson(invoice));

		str_response = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("wh_invoices_getInvoices"), gson.toJson(invoice), "GET");

		////////// ////////System.out.println(str_response);

		String responseCode = Response.getResponseCode(str_response);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			invoice = gson.fromJson(str_response,InvoiceBean.class); 
			invoice.setTotalRecords(invoice.getTotalRecords());
		}
	
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		str_response = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	}
	 catch(Exception e){
		e.printStackTrace();
	}
	return invoice;
}
*/

public WHInvoice getWarehouseInvoice(String index,String maxRecords,String invoiceId,String customerIdStr,String emailIdStr) {
	
	// log.info("WarehouseService - getInvoices()");
	String str_response = null;
	RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
	WHInvoice invoice=new WHInvoice();
		try {
		
		invoice.setMaxRecords(maxRecords);
		invoice.setStartIndex(index);
		invoice.setInvoiceId(invoiceId);
		invoice.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr,emailIdStr));
		
		// log.info("Request String :::"+gson.toJson(invoice));
		//////////// ////////System.out.println(gson.toJson(invoice));

		str_response = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("wh_invoices_getInvoices"), gson.toJson(invoice), "GET");

		//////System.out.println(str_response);

		
		String responseCode = Response.getResponseCode(str_response);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			invoice = gson.fromJson(str_response,WHInvoice.class); 
		}
	
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		str_response = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	}
	 catch(Exception e){
		e.printStackTrace();
	}
	return invoice;
}



public WHInvoice getWarehouseInvoices(String index,String maxRecords,String customerIdStr,String emailIdStr,String category,String subCategory,String brand,String locationStr,String department,String subDepartment,String startdateStr,String enddateStr,String searchName,String section) {
	
	// log.info("WarehouseService - getInvoices()");
	String str_response = null;
	RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
	RequestBean requestBeanObj = null;
	WHInvoice invoice=new WHInvoice();
	
	try {
		invoice.setStartIndex(index);
		requestBeanObj=new RequestBean();
		requestBeanObj.setMaxRecords(maxRecords);
		requestBeanObj.setCategory(category);
		requestBeanObj.setSubCategory(subCategory);
		requestBeanObj.setBrand(brand);
		requestBeanObj.setWarehouseLocation(locationStr);
		requestBeanObj.setStartDateStr(startdateStr);
		requestBeanObj.setEndDateStr(enddateStr);
		requestBeanObj.setCreatedOnStr(startdateStr);
		requestBeanObj.setSupplierName(section);
		requestBeanObj.setSupplierId(section);
		requestBeanObj.setDepartment(department);
		requestBeanObj.setSubDepartment(subDepartment);
		requestBeanObj.setStartIndex(index);
		requestBeanObj.setSearchCriteria(searchName);
		requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr,emailIdStr));
		
		// log.info("Request String :::"+gson.toJson(requestBeanObj));
		
		//////////// ////////System.out.println("Request String :::"+gson.toJson(requestBeanObj));

		str_response = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("wh_invoices_getInvoices"), gson.toJson(requestBeanObj), "GET");

		//////////// ////////System.out.println(str_response);

		
		String responseCode = Response.getResponseCode(str_response);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			invoice = gson.fromJson(str_response,WHInvoice.class); 
		}
	
	
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		str_response = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	}
	 catch(Exception e){
		e.printStackTrace();
	}
	return invoice;
}

/*
public WHInvoice getWarehouseInvoices(String index,String maxRecords,String customerIdStr,String emailIdStr,String category,String subCategory,String brand,String locationStr,String department,String subDepartment,String startdateStr,String enddateStr,String searchName) {
	
	// log.info("WarehouseService - getInvoices()");
	String str_response = null;
	RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
	RequestBean requestBeanObj = null;
	WHInvoice invoice=new WHInvoice();
	
	
	try {
		invoice.setStartIndex(index);
		requestBeanObj=new RequestBean();
		requestBeanObj.setMaxRecords(maxRecords);
		requestBeanObj.setCategory(category);
		requestBeanObj.setSubCategory(subCategory);
		requestBeanObj.setBrand(brand);
		requestBeanObj.setWarehouseLocation(locationStr);
		requestBeanObj.setStartDateStr(startdateStr);
		requestBeanObj.setEndDateStr(enddateStr);
		requestBeanObj.setStartIndex(index);
		requestBeanObj.setSearchCriteria(searchName);
		requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr,emailIdStr));
		
		// log.info("Request String :::"+gson.toJson(requestBeanObj));
		////////// ////////System.out.println(gson.toJson(requestBeanObj));

		str_response = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("wh_invoices_getInvoices"), gson.toJson(requestBeanObj), "GET");

		////////// ////////System.out.println(str_response);

		
		String responseCode = Response.getResponseCode(str_response);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			invoice = gson.fromJson(str_response,WHInvoice.class); 
		}
	
	
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		str_response = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	}
	 catch(Exception e){
		e.printStackTrace();
	}
	return invoice;
}*/




/*
public List<InvoiceBean> getWarehouseInvoices(String index,String maxRecords,String customerIdStr,String emailIdStr,String category,String subCategory,String brand,String locationStr,String department,String subDepartment,String startdateStr,String enddateStr,String searchName) {
	
	// log.info("WarehouseService - getInvoices()");
	String str_response = null;
	RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
	RequestBean requestBeanObj = null;
	InvoiceBean invoice=new InvoiceBean();
	
	
	try {
		//invoices=new InvoiceResponse();
		
		
		invoice.setStartIndex(index);
		//invoice.setWarehouse_location("Jubilee Hills - Hyderabad");
		requestBeanObj=new RequestBean();
		requestBeanObj.setMaxRecords(maxRecords);
		requestBeanObj.setCategory(category);
		requestBeanObj.setSubCategory(subCategory);
		requestBeanObj.setBrand(brand);
	//	requestBeanObj.setSupplierName(supplierName);
		requestBeanObj.setWarehouseLocation(locationStr);
		requestBeanObj.setStartDateStr(startdateStr);
		requestBeanObj.setEndDateStr(enddateStr);
		requestBeanObj.setStartIndex("-1");
		requestBeanObj.setSearchCriteria(searchName);
		
		requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr,emailIdStr));
		
		// log.info("Request String :::"+gson.toJson(requestBeanObj));
		////////// ////////System.out.println("Request String :::"+gson.toJson(requestBeanObj));

		str_response = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("wh_invoices_getInvoices"), gson.toJson(requestBeanObj), "GET");

		////////// ////////System.out.println(str_response);

		
		String responseCode = Response.getResponseCode(str_response);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			invoice = gson.fromJson(str_response,InvoiceBean.class); 
		//	invoice.getWhInvoiceList().get(0).getTotalRecords(invoice.getTotalRecords());
		}
	
	
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		str_response = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	}
	 catch(Exception e){
		e.printStackTrace();
	}
	return invoice.getWhInvoiceList();
}*/

/* Developed By : vijay
 * Created On   : 
 * This method is used to save the invoice details and 
 * warehouse storage system details in database
 *  
 * */

public String createWarehouseShipmentInvoice(WHInvoice invoicebeanobj,String customerIdStr,String emailIdStr) {
	
	// log.info("WarehouseService - createInvoice()");
	String str_response = null;
//	String response=null;
	RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
	try{
		gson=new Gson();
//		WHInvoicesProxy whproxy=new WHInvoicesProxy();
		invoicebeanobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr,emailIdStr));
		// log.info("Request String :::"+gson.toJson(invoicebeanobj));
		
	       //////System.out.println(" Request String :::"+gson.toJson(invoicebeanobj));
		
			str_response = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("wh_invoices_createInvoices"), gson.toJson(invoicebeanobj));
		
	
		//////System.out.println("Response String :::"+str_response);
		
		String responseCode = Response.getResponseCode(str_response);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
			
		str_response = AppProperties.getAppMessageByProperty("INVOICE_CREATED_SUCCESS").trim();
		
		else{
		//result = "Couldn't create, please try after some time";
		str_response = Response.getResponseMessage(str_response);
		}
	}catch (NoSuchElementException nse) {
			nse.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}  catch(Exception e){
			e.printStackTrace();
		}
	return str_response;
}




public String updateWarehouseShipmentInvoice(WHInvoice invoicebeanobj,String customerIdStr,String emailIdStr) {
	
	// log.info("WarehouseService - createInvoice()");
	String str_response = null;
//	String response=null;
	RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
	try{
		gson=new Gson();
//		WHInvoicesProxy whproxy=new WHInvoicesProxy();
		invoicebeanobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr,emailIdStr));
		// log.info("Request String :::"+gson.toJson(invoicebeanobj));
	   //////System.out.println(" Request String :::"+gson.toJson(invoicebeanobj));
		
			str_response = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_Invoice"), gson.toJson(invoicebeanobj));
		
	
		// log.info("Response String :::"+str_response);
		
		String responseCode = Response.getResponseCode(str_response);
	if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
			{
		str_response = AppProperties.getAppMessageByProperty("INVOICE_UPDATED_SUCCESS").trim();
			}	
	else{
		
		str_response = Response.getResponseMessage(str_response);
	}
	}catch (NoSuchElementException nse) {
			nse.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}  catch(Exception e){
			e.printStackTrace();
		}
	return str_response;
}



/*  invoice---*/
public String createInvoice(InvoiceBean invoicebeanobj,String customerIdStr,String emailIdStr) {
		/* Developed By : vamsi v
		 * Created On   : 1-03-2017
		 * This method is used to save the invoice details and 
		 * warehouse storage system details in database
		 *  
		 * */
		// log.info("WarehouseService - createInvoice()");
		String str_response = null;
		String response=null;
		try{
			gson=new Gson();
			//WHInvoicesProxy whproxy=new WHInvoicesProxy();
			//invoicebeanobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr,emailIdStr));
			// log.info("Request String :::"+gson.toJson(invoicebeanobj));
			if(invoicebeanobj.getInvoiceId()== "" || invoicebeanobj.getInvoiceId() == null)
			{
			//response =whproxy.createInvoice(gson.toJson(invoicebeanobj));
			response = new RestfulServiceConnection().getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("wh_invoices_createInvoices"), gson.toJson(invoicebeanobj));

			}
			else {
				response = new RestfulServiceConnection().getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_Invoice"), gson.toJson(invoicebeanobj));

				//response =whproxy.updateInvoice(gson.toJson(invoicebeanobj));
			}
			// log.info("Response String :::"+response);
			
			String responseCode = Response.getResponseCode(response);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				if(invoicebeanobj.getInvoiceId()== "" || invoicebeanobj.getInvoiceId() == null)
				{
				str_response = AppProperties.getAppMessageByProperty("INVOICE_CREATED_SUCCESS").trim();
				}
				else {
					str_response = AppProperties.getAppMessageByProperty("INVOICE_UPDATED_SUCCESS").trim();
				}
				
			}
			else{
				//result = "Couldn't create, please try after some time";
				str_response = Response.getResponseMessage(response);
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
public List<WHInvoice> getInvoices(String index,String maxRecords,String customerIdStr,String emailIdStr) {
		
		// log.info("WarehouseService - getInvoices()");
		String str_response = null;
		//InvoiceResponse invoices = null;
		WHInvoice invoiceobj = null;
		RequestBean requestBeanObj = null;
		List<WHInvoice> invoices=null;
		
		try {
			//invoices=new InvoiceResponse();
			invoices=new ArrayList<WHInvoice>();
			InvoiceBean invoice=new InvoiceBean();
			invoice.setStartIndex(index);
			invoice.setWarehouse_location("Jubilee Hills - Hyderabad");
			requestBeanObj=new RequestBean();
			requestBeanObj.setMaxRecords(maxRecords);
			requestBeanObj.setStartIndex(index);
			//requestBeanObj.setLocation("Jubilee Hills - Hyderabad");
			///invoices = new ArrayList<InvoiceResponse>();
		//	WHInvoicesProxy proxy=new WHInvoicesProxy();
			invoice.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr,emailIdStr));
			
			/*// log.info("Request String :::"+gson.toJson(invoice));
			str_response =proxy.getInvoices(gson.toJson(invoice));
			// log.info("Response String :::"+str_response);
			 convert response string to list */
			str_response =new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("wh_invoices_getInvoices"), gson.toJson(invoice), "GET");

			String responseCode = Response.getResponseCode(str_response);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				String responseList = Response.getResponseList(str_response, "invoices");
				JSONArray jsonResponseArray = new JSONArray(responseList);
				for (int i=0; i<jsonResponseArray.length(); i++) {
					invoiceobj = gson.fromJson(jsonResponseArray.getString(i), WHInvoice.class);
					invoices.add(invoiceobj);
				}
				/*if(invoices != null && invoices.size() > 0)
					invoices.get(0).setTotalRecords(Response.getResponseTotalRecords(str_response));*/
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
		// log.info(gson.toJson(invoices));
		return invoices;
	}
public List<WHInvoice> searchInvoices(String startDate,String endDate,String index,String maxRecords,String customerId, String emailId,String searchNameStr,String storeLocation) {

	// log.info("WarehouseService - searchInvoices()");
	String str_response = null;
	WHInvoice invoiceobj = null;
	RequestBean requestBeanObj = null;
	List<WHInvoice> invoices=null;
	
	try {
		//invoices=new InvoiceResponse();
		invoices=new ArrayList<WHInvoice>();
		InvoiceBean invoice=new InvoiceBean();
		invoice.setStartIndex(index);
		//invoice.setWarehouse_location("Jubilee Hills - Hyderabad");
		requestBeanObj=new RequestBean();
		requestBeanObj.setStartDate(startDate);
		requestBeanObj.setEndDate(endDate);
		requestBeanObj.setSearchCriteria(searchNameStr);
		requestBeanObj.setMaxRecords(maxRecords);
		requestBeanObj.setStartIndex(index);
		requestBeanObj.setLocation(storeLocation);
		///invoices = new ArrayList<InvoiceResponse>();
		//WHInvoicesProxy proxy=new WHInvoicesProxy();
		invoice.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerId,emailId));
		
		/*// log.info("Request String :::"+gson.toJson(invoice));
		str_response =proxy.getInvoices(gson.toJson(invoice));
		// log.info("Response String :::"+str_response);
		 convert response string to list */
		str_response =new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("wh_invoices_getInvoices"), gson.toJson(invoice), "GET");

		
		String responseCode = Response.getResponseCode(str_response);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			String responseList = Response.getResponseList(str_response, "invoices");
			JSONArray jsonResponseArray = new JSONArray(responseList);
			for (int i=0; i<jsonResponseArray.length(); i++) {
				invoiceobj = gson.fromJson(jsonResponseArray.getString(i), WHInvoice.class);
				invoices.add(invoiceobj);
			}
			/*if(invoices != null && invoices.size() > 0)
				invoices.get(0).setTotalRecords(Response.getResponseTotalRecords(str_response));*/
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
	// log.info(gson.toJson(invoices));
	return invoices;
}
public InvoiceResponse getinvoiceDetails(String invoiceid,String customerIdStr,String emailIdStr) {
	
	// log.info("WarehouseService - getinvoiceDetails()");
	String str_response = null;
	InvoiceResponse response = null;
	InvoiceBean invoiceobj=null;
	try {
		invoiceobj=new InvoiceBean();
		response = new InvoiceResponse();
		invoiceobj.setInvoiceId(invoiceid);
		WHInvoicesProxy proxy=new WHInvoicesProxy();
		invoiceobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr,emailIdStr));
		// log.info("Request String :::"+gson.toJson(invoiceobj));
		str_response = proxy.getInvoiceDetails(gson.toJson(invoiceobj));
		// log.info("Response String :::"+str_response);
		/* convert response string to list */
		String responseCode = Response.getResponseCode(str_response);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			response = gson.fromJson(str_response,InvoiceResponse.class); 
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
	// log.info(gson.toJson(response));
	return response;
}



public String saveStorageSystemsWarehouse(WarehouseBean warehouseBean) {
	//// log.info("OutletConfigurationService - saveStorageSystems()");
	String response = null;
	String str_response = null;
	try{
		/*OutletConfigurationsProxy proxy = new OutletConfigurationsProxy();
		// log.info("Request String ::: "+ gson.toJson(outlet));*/
		warehouseBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		/*response = proxy.createOutletStorageSystems(gson.toJson(outlet));
		// log.info("Response ::: "+ response);*/
		// ////////System.out.println(gson.toJson("create_warehouse::"+warehouseBean));
		/*     added by - vasudev   purpose - using rest service call instead of soap call*/
		RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
		response=restFulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_warehouse"), gson.toJson(warehouseBean));

		String responseCode = Response.getResponseCode(response);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			str_response = "Warehouse Created Successfully";
			
		}
		else{
			//result = "Couldn't create, please try after some time";
			str_response = Response.getResponseMessage(response);
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

public List<WarehousePOS> getWarehousespos(WarehousePOS warehouse) {
	
	/* Developed By : Sambaiah Y
	 * Created On   : 23-06-2015
	 * This method is used get the all warehouse from database based on the pagination
	 *  
	 * */
	String str_response = null;
	List<WarehousePOS> warehouses = null;
	WarehousePOS obj_warehouse = null;
	WarehousePOS obj_warehouse2 = null;
	
	try {
		warehouses = new ArrayList<WarehousePOS>();
		RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
		
	    warehouse.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
	    warehouse.setMaxRecords("10");
	    
	   //////////////System.out.println("Request STring ::::"+gson.toJson(warehouse));
		str_response = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_warehouse_pos"), gson.toJson(warehouse),"GET");
		
		////// ////////System.out.println("response string warehouse list::::"+str_response);
		/* convert response string to list */
		String responseCode = Response.getResponseCode(str_response);
		
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			obj_warehouse2 = gson.fromJson(str_response,WarehousePOS.class);
			String responseList = Response.getResponseList(str_response, "posList");
			JSONArray jsonResponseArray = new JSONArray(responseList);
			for (int i=0; i<jsonResponseArray.length(); i++) {
				obj_warehouse = gson.fromJson(jsonResponseArray.getString(i), WarehousePOS.class);
				
				warehouses.add(obj_warehouse);
			}
		if(warehouses != null && warehouses.size() > 0)
				warehouses.get(0).setTotalRecords(obj_warehouse2.getTotalRecords());
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
	return warehouses;
}


public String addpackage(ProcessingAndPackaging processingAndPackaging,String customerIdStr,String emailIdStr) {
	
	String resultStr = "";
	RestfulServiceConnection restfulConnectionObj =null;
	try{
		/*stockRequestsProxyOnj = new StockRequestsProxy();*/
		restfulConnectionObj = new RestfulServiceConnection();
		processingAndPackaging.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		
		/*if(processingAndPackaging.getOperation() == "submit" || processingAndPackaging.getOperation().equalsIgnoreCase("submit") ){
			processingAndPackaging.setStatus("confirmed");
			
		}else if (processingAndPackaging.getOperation() == "draft" || processingAndPackaging.getOperation().equalsIgnoreCase("draft") || processingAndPackaging.getOperation() == "updraft" || processingAndPackaging.getOperation().equalsIgnoreCase("updraft") ){
			processingAndPackaging.setStatus("draft");
		}else{
			processingAndPackaging.setStatus("confirmed");
		}*/
		
		
		if(processingAndPackaging.getOperation() == "submit" || processingAndPackaging.getOperation().equalsIgnoreCase("submit") ){
			processingAndPackaging.setStatus("Submitted");
			
		}else if (processingAndPackaging.getOperation() == "draft" || processingAndPackaging.getOperation().equalsIgnoreCase("draft") || processingAndPackaging.getOperation() == "updraft" || processingAndPackaging.getOperation().equalsIgnoreCase("updraft") ){
			processingAndPackaging.setStatus("draft");
		}
		
		// ////////System.out.println("Request String:::"+gson.toJson(processingAndPackaging));
		
		if(processingAndPackaging.getOperation() == "submit" || processingAndPackaging.getOperation().equalsIgnoreCase("submit") ||processingAndPackaging.getOperation() == "draft" || processingAndPackaging.getOperation().equalsIgnoreCase("draft") ){
		
		resultStr = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("add_package"), gson.toJson(processingAndPackaging));
		}else{
		resultStr = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_package"), gson.toJson(processingAndPackaging));

		}
		//// ////////System.out.println(resultStr);
		String responseCode = Response.getResponseCode(resultStr);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			
			if(processingAndPackaging.getOperation() == "submit" || processingAndPackaging.getOperation().equalsIgnoreCase("submit")){
			resultStr = AppProperties.getAppMessageByProperty("PACKAGING_CREATED_SUCCESFULLY").trim();
			}else{
				resultStr = AppProperties.getAppMessageByProperty("PACKAGING_UPDATED_SUCCESFULLY").trim();
			}
		}
		else{
			resultStr = Response.getResponseMessage(resultStr);
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
	return resultStr;
}


public String addwarehousestoragemaster(WarehouseStorageSystems warehouseStorageSystems,String customerIdStr,String emailIdStr,String operation) {
	
	String resultStr = "";
	RestfulServiceConnection restfulConnectionObj =null;
	try{
		/*stockRequestsProxyOnj = new StockRequestsProxy();*/
		restfulConnectionObj = new RestfulServiceConnection();
		warehouseStorageSystems.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		
		// ////////System.out.println("Request String:::"+gson.toJson(warehouseStorageSystems));
		
		if(operation == "new" || operation.equals("new"))
		{		resultStr = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_WHStoraheMaster"), gson.toJson(warehouseStorageSystems));
		}else{
			resultStr = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_WHStorageMaster"), gson.toJson(warehouseStorageSystems));
		}
			
		// ////////System.out.println(resultStr);
		String responseCode = Response.getResponseCode(resultStr);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			if(operation == "new" || operation.equals("new")){
			resultStr = AppProperties.getAppMessageByProperty("WAREHOUSE_STORAGE_MASTER_CREATED_SUCCESFULLY").trim();
			}else{
				resultStr = AppProperties.getAppMessageByProperty("WAREHOUSE_STORAGE_MASTER_UPDATED_SUCCESFULLY").trim();
	
			}
			
		}
		else{
			resultStr = Response.getResponseMessage(resultStr);
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
	return resultStr;
}
public String getStorageMaster(String customerIdStr, String emailIdStr, String maxRecords,String StorageID,String index) {
	WarehouseStorageSystems warehouseStorageSystems = null;
	String resultStr = "";
	//List<SkuDetails> skuDetailsList = null;
	RestfulServiceConnection restfulConnectionObj = null;
	//ArrayList<LocationBean> locationBeansList = null;
	try{
		restfulConnectionObj = new RestfulServiceConnection();
		warehouseStorageSystems  = new WarehouseStorageSystems();
		warehouseStorageSystems.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		warehouseStorageSystems.setMaxRecords(maxRecords);
		warehouseStorageSystems.setStorageSystemId(StorageID);
		warehouseStorageSystems.setStartIndex(index);
		
		
		
	 //// ////////System.out.println("packaging Request String:::"+(gson.toJson(warehouseStorageSystems)) );
		
       resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_WHStorageMaster"), gson.toJson(warehouseStorageSystems), "GET");
     // // ////////System.out.println("packaging Response String:::"+resultStr);
       

		
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	} catch(Exception e){
		e.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
	}
	return resultStr;
	
}


public List<WHStockVerificationPosting> getStocksPosting(String customerIdStr,String emailIdStr,String outletLocationStr,String zone,
		String searchNameStr,String index,String startDateStr,String endDateStr,String maxRecords,String flowUnder,String mastercode,String skuID,String ref){
	
	RestfulServiceConnection restfullconnection  = new RestfulServiceConnection();
	GetStockVerificationDetailsResponse warehouseVerificationDetailsList = null;
	String resultStr = null;
	try{
		warehouseVerificationDetailsList = new GetStockVerificationDetailsResponse();
		WareHouseStockVerificationBean verificationObj = new WareHouseStockVerificationBean();
		verificationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		
			verificationObj.setLocation(outletLocationStr);
			verificationObj.setZoneId(zone);
			verificationObj.setStartIndex(index);
			verificationObj.setMaxRecords(maxRecords);
			verificationObj.setStartDate(startDateStr);
			verificationObj.setEndDate(endDateStr);
			verificationObj.setSearchCriteria(searchNameStr);
			if(skuID != ""  ){
				verificationObj.setVerification(false);
				verificationObj.setVerification_reference(ref);
			}else{
				verificationObj.setVerification(true);
				
			}
			verificationObj.setMasterVerificationCode(mastercode);
			verificationObj.setItemLevel(true);
			verificationObj.setSkuId(skuID);
		
	  // // ////////System.out.println("Request String::::"+gson.toJson(verificationObj));
		resultStr = restfullconnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_stockPosting"), gson.toJson(verificationObj), "GET");
	   //// ////////System.out.println("Response String::::"+resultStr);
		
		warehouseVerificationDetailsList = gson.fromJson(resultStr,GetStockVerificationDetailsResponse.class);
		if(warehouseVerificationDetailsList.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
			warehouseVerificationDetailsList.getWhStockVerificationPostingDetails().get(0).setTotalRecords(String.valueOf(warehouseVerificationDetailsList.getTotalRecords()));
		}
		
	}catch(ConnectException ce) {
		ce.printStackTrace();
		resultStr = (String) AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = (String) AppProperties.getAppMessageByProperty("INVALID_REQUEST");
	} catch (UnknownHostException uhe) {
		uhe.printStackTrace();
		resultStr = (String) AppProperties.getAppMessageByProperty("UNKNOWN_HOST");
	} catch(RemoteException rme){
		rme.printStackTrace();
		resultStr = (String) AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
	}catch(Exception e){
	    e.printStackTrace();
	    resultStr = (String) AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
	}
	return warehouseVerificationDetailsList.getWhStockVerificationPostingDetails();
}

public BillOfMaterialResponse getWHBoms(String searchNameStr,String customerIdStr,String emailIdStr,String index,String bomref,String maxRecords,String location){
	String resultStr = null;
	WarehouseProductBom shipmentRateMasterObj = new WarehouseProductBom();
	BillOfMaterialResponse priceRangeMasterResponeObj = new BillOfMaterialResponse(); 
	try{
		
		shipmentRateMasterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		shipmentRateMasterObj.setSearchCriteria(searchNameStr);
		shipmentRateMasterObj.setStartIndex(index);
		shipmentRateMasterObj.setBomRef(bomref);
		shipmentRateMasterObj.setMaxRecords(maxRecords);
		shipmentRateMasterObj.setStoreLocation(location);
		RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
		//// ////////System.out.println("Request String::::::::::::"+gson.toJson(shipmentRateMasterObj));
		resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_wh_bom_master"), gson.toJson(shipmentRateMasterObj),"GET");
		// log.info("Response String:::::::::::"+resultStr);
		//// ////////System.out.println(resultStr);
		String responseCode = Response.getResponseCode(resultStr);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			priceRangeMasterResponeObj = gson.fromJson(resultStr, BillOfMaterialResponse.class);
		
		}
	
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	
	} catch(Exception e){
		e.printStackTrace();
	}
	return priceRangeMasterResponeObj;
}


public String createBom(WarehouseProductBom featureobj,String customerIdStr,String emailIdStr){
	String resultStr = null;
	try {
		featureobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		 ////////System.out.println("Request String::::::::::::"+gson.toJson(featureobj));
		RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
		if(featureobj.getBomRef().isEmpty()){
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_wh_bom"), gson.toJson(featureobj));
			//// ////////System.out.println("Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("BOM_GROUP_CREATE_SUCCESS").trim();
			}
			else{
				resultStr = Response.getResponseMessage(resultStr);
			}
		}
		
		else
		{
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("edit_wh_bom_master"), gson.toJson(featureobj));
			// log.info("Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("BOM_GROUP_UPDATE_SUCCESS").trim();
			}
			else{
				resultStr = Response.getResponseMessage(resultStr);
			}
		}
			
		
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	} catch(Exception e){
		e.printStackTrace();
	}
	return resultStr;
}		

public String deleteBoms(String customerIdStr,String emailIdStr,String rates) {
	String resultStr = null;
	BillOfMaterial masterObj= new BillOfMaterial();
	try {
		masterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		String[] ratesAry =  rates.split(","); 
		List<String> PriceRangeCodes = new ArrayList<String>();
		for(int i=0;i<ratesAry.length;i++)
			PriceRangeCodes.add(ratesAry[i]);
		masterObj.setBoMaterialRefIds(PriceRangeCodes);
		RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
		// log.info("Request String::::::::::::"+gson.toJson(masterObj));
		resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("delete_wh_bom_master"), gson.toJson(masterObj));
		// log.info("Response String:::::::::::"+resultStr);
		String responseCode = Response.getResponseCode(resultStr);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
			resultStr = AppProperties.getAppMessageByProperty("RM_SUCCESS").trim();
		else if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_FAILED_CODE").trim()))
			resultStr = AppProperties.getAppMessageByProperty("DELETE_FAILED").trim();
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	} catch(Exception e){
		e.printStackTrace();
	}
	return resultStr;
}


public String updateStockPosting(WareHouseStockVerificationBean whStockVerificationPosting) {
	
	
	String str_response = null;
		RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
	try{
		
		gson=new Gson();
		whStockVerificationPosting.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		
		////// ////////System.out.println(" Request String :::"+gson.toJson(whStockVerificationPosting));
		
			str_response = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_stock_upload"), gson.toJson(whStockVerificationPosting));
		
	//// ////////System.out.println(str_response);
		
		String responseCode = Response.getResponseCode(str_response);
	if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
			{
		str_response = AppProperties.getAppMessageByProperty("STOCKPOSTING_UPDATE_SUCCESS").trim();
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
public String createPickList(WarehousePicklistMaster warehousePicklistMaster, String customerIdStr, String emailIdStr) {
		String result = null;
		try {
			
			warehousePicklistMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
		///	System.out.println("Request String::::Picklist Create::::::::"+gson.toJson(warehousePicklistMaster));
			result = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_pickist"), gson.toJson(warehousePicklistMaster));
	////	System.out.println(result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				
				result = "Picklist Created Succesfully";
				
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


public String updatePickList(WarehousePicklistMaster warehousePicklistMaster, String customerIdStr, String emailIdStr) {
	String result = null;
	try {
		
		warehousePicklistMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		
		RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
		////////// ////////System.out.println("Request String::::::::::::"+gson.toJson(menu));
		result = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_piucklist"), gson.toJson(warehousePicklistMaster));
		String responseCode = Response.getResponseCode(result);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
			
			result = "Success";
			
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



}
