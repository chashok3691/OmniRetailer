package com.tlabs.posweb.services;

//import java.io.FileNotFoundException;
//import java.io.IOException;
import java.rmi.ConnectException;
import java.rmi.RemoteException;
import java.rmi.UnknownHostException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.NoSuchElementException;

import com.tlabs.posweb.init.AppProperties;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.technolabssoftware.www.ShiftsProxy;
import com.tlabs.posweb.beans.RequestBean;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.beans.ShiftAllocationBean;
import com.tlabs.posweb.beans.ShiftMaster;
import com.tlabs.posweb.beans.ShiftResponse;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
import com.tlabs.posweb.util.RestfulServiceConnection;
//import com.tlabs.posweb.util.Utilities;

public class ShiftService {

	@Autowired
	private Gson gson;
	@Autowired
	SessionScope sessionScope;
	//private static Logger log = Logger.getLogger(ShiftService.class);
	
	/**
	 * @author Sahitya
	 * 
	 * This method is used to save shift related services in DB
	 * 
	 */
	public String createShift(ShiftMaster shiftMasterDetails,String customerIdStr,String emailIdStr){
	    String result = null;
	    try{
	    	//ShiftsProxy	shiftMasterProxyObj = new ShiftsProxy();
	    	shiftMasterDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			/*// log.info("Request String::::::::::::"+gson.toJson(shiftMasterDetails));
			result = shiftMasterProxyObj.createShift(gson.toJson(shiftMasterDetails));
			// log.info("Response String:::::::::::"+result);*/
			
			/**	added by - vasudev   purpose - using rest service call instead of soap call*/		
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			result = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_shift"), gson.toJson(shiftMasterDetails));

			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("SHIFT_CREATE_SUCCESS").trim();
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
			result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		}
	    return result;
	}
	
	/**
	 * @author Sahitya
	 * 
	 * This method is used to save shift related services in DB
	 * 
	 */
	public ShiftResponse getShifts(String searchNameStr,String startIndex,String customerIdStr,String emailIdStr,String storeLocation,boolean search,String locationListAll){
	    String resultStr = null;
	    ShiftResponse shiftResponseObj = new ShiftResponse();
	    try{
	    	//ShiftsProxy	shiftMasterProxyObj = new ShiftsProxy();
	    	RequestBean requestBeanObj = new RequestBean();
	    	requestBeanObj.setSearchCriteria(searchNameStr);
	    	requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
            if(storeLocation.equals("all")|| storeLocation.equals("")){
            List<String> myList = new ArrayList<String>(Arrays.asList(locationListAll.split(",")));
	    	requestBeanObj.setLocationsList(myList);
            }
            else
            requestBeanObj.setStoreLocation(storeLocation);
	    	requestBeanObj.setStartIndex(startIndex);
			/*// log.info("Request String::::::::::::"+gson.toJson(requestBeanObj));
			resultStr = shiftMasterProxyObj.getShifts(gson.toJson(requestBeanObj));
			// log.info("Response String:::::::::::"+resultStr);*/
	    	
	    	/*	added by - vasudev   purpose - using rest service call instead of soap call*/
			RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
			resultStr = restFulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_shifts"),gson.toJson(requestBeanObj), "GET");

	    	
			String responseCode = Response.getResponseCode(resultStr);
			// log.info(responseCode);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				shiftResponseObj = gson.fromJson(resultStr,ShiftResponse.class);
				int slNo = Integer.parseInt(startIndex);
				if(shiftResponseObj.getShifts() != null && shiftResponseObj.getShifts().size() > 0)
				for(ShiftMaster shiftMaster: shiftResponseObj.getShifts())
					shiftMaster.setSlNo(++slNo);
				
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
		}
	    catch(Exception e){
			e.printStackTrace();
		}
	    return shiftResponseObj;
	}
	
	/**
	 * @author Sahitya
	 * 
	 * This method is used to delete shift related info in DB via webservices
	 * 
	 */
	public String deleteShifts(String customerId,String emailId,String ids){
		String resultStr = null;
		try {
			ShiftMaster shiftMasterBean = new ShiftMaster();
			ShiftsProxy	shiftMasterProxyObj = new ShiftsProxy();
			String[] idsArray = ids.split(",");
			shiftMasterBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			List<String> shiftCodes = new ArrayList<String>();
			for(int i=0;i<idsArray.length;i++)
				shiftCodes.add(idsArray[i].replace("\\/", ""));
			shiftMasterBean.setShiftIds(shiftCodes);
			
			// log.info("Request String::::::"+gson.toJson(shiftMasterBean));
			//////////////System.out.println("Request String::::::"+gson.toJson(shiftMasterBean));
			
			resultStr = shiftMasterProxyObj.deleteShift(gson.toJson(shiftMasterBean));
			
			// log.info("Response String:::::"+resultStr);
			//////////////System.out.println("Response String:::::"+resultStr);
			
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				resultStr = AppProperties.getAppMessageByProperty("SHIFT_DELETE_SUCCESS").trim();
			else if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_FAILED_CODE").trim()))
				resultStr = AppProperties.getAppMessageByProperty("DELETE_FAILED").trim();
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
	
	
	/**
	 * @author Sahitya
	 * 
	 * This method is used to save shift related services in DB
	 * 
	 */
	public ShiftMaster viewSpecificShift(int shiftCode,String location,String customerIdStr,String emailIdStr){
	    String resultStr = null;
	    ShiftMaster shiftMasterBeanObj = null;
	    try{
	    	shiftMasterBeanObj = new ShiftMaster();
	    	//ShiftsProxy	shiftMasterProxyObj = new ShiftsProxy();
	    	RequestBean requestBeanObj = new RequestBean();
	    	requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
	    	requestBeanObj.setStoreLocation(location);
	    	requestBeanObj.setShiftId(shiftCode);
			
			/*// log.info("Request String::::::::::::"+gson.toJson(requestBeanObj));
		   ////////////System.out.println("Request String::::::::::::"+gson.toJson(requestBeanObj));
			resultStr = shiftMasterProxyObj.getShiftDetails(gson.toJson(requestBeanObj));		
			// log.info("Response String:::::::::::"+resultStr);*/
			
	    	/*	added by - vasudev   purpose - using rest service call instead of soap call*/
			RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
			resultStr = restFulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_shift_details"),gson.toJson(requestBeanObj), "POST");

			
			////////////////System.out.println("Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);

			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				String responseList = Response.getResponseList(resultStr, "shiftInfo");
				shiftMasterBeanObj = gson.fromJson(responseList,ShiftMaster.class);
				List<String> weekDays = new ArrayList<String>();
				for (int i = 0; i < shiftMasterBeanObj.getShiftTimings().size(); i++) {
					weekDays.add(shiftMasterBeanObj.getShiftTimings().get(i).getWeekDay());
				}
				shiftMasterBeanObj.setWeekDays(weekDays);
			}
			else{
				shiftMasterBeanObj = new ShiftMaster();
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
	    return shiftMasterBeanObj;
	}
	
	/**
	 * @author Sahitya
	 * 
	 * This method is used to update shift related services in DB
	 * 
	 */
	public String updateShift(ShiftMaster shiftMasterDetails,String customerIdStr,String emailIdStr){
	    String result = null;
	    try{
	    	//// log.info("updateShift");
	    	//ShiftsProxy	shiftMasterProxyObj = new ShiftsProxy();
	    	shiftMasterDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));

	    	/*// log.info("Request String::::::::::::"+gson.toJson(shiftMasterDetails));	
			result = shiftMasterProxyObj.updateShift(gson.toJson(shiftMasterDetails));
			// log.info("Response String:::::::::::"+result);*/
	    	
	    	/*	added by - vasudev   purpose - using rest service call instead of soap call*/
	    	RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
			result = restFulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_shift"), gson.toJson(shiftMasterDetails));
			
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("SHIFT_UPDATE_SUCCESS").trim();
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
			result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		}
	    return result;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to add employees to shifts
	 *
	 **/
	public String createShiftAllocation(ShiftAllocationBean shiftAllocationBeanObj,String customerId,String emailId){
		String result = null;
		try {
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			shiftAllocationBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			//// log.info("Request String::::::::::::"+gson.toJson(shiftAllocationBeanObj));
			//result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("shiftAllocation_Service_create"), gson.toJson(shiftAllocationBeanObj),"POST");
			result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("shiftAllocation_Service_create"), gson.toJson(shiftAllocationBeanObj));
			
			//// log.info("Response String:::::::::::"+result);
			if(result == null){
				result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
			}
			else{
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					result = AppProperties.getAppMessageByProperty("SHIFT_ALLOCATION_TO_EMPLOYEE_SUCCESS").trim();
				}
				else{
					result = Response.getResponseMessage(result);
				}
			}
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
	 * 
	 * This method is used to call the get the shifts to which employees are allocated
	 * 
	 */

public ShiftAllocationBean getShiftAllocations(String searchNameStr,Integer shiftId,String customerId,String emailId,String index,String location,String flowUnder){
		String result = null;
		ShiftAllocationBean shiftAllocationBeanObj = new ShiftAllocationBean();
		try {
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			if(shiftId != null)
				shiftAllocationBeanObj.setShiftId(shiftId);
			shiftAllocationBeanObj.setStartIndex(index);
			shiftAllocationBeanObj.setSearchCriteria(searchNameStr);
			shiftAllocationBeanObj.setShiftType(flowUnder);
			shiftAllocationBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
//			//////////////System.out.println(location);
//			if(location.equals("all") || location.equals("")){
//				List<String> myList = new ArrayList<String>(Arrays.asList(locationsListValue.split(",")));
//				shiftAllocationBeanObj.setLocationsList(myList);
//			}
//			else
			shiftAllocationBeanObj.setShiftLocation(location);
			 //log.info("shift Request String:::::::"+gson.toJson(shiftAllocationBeanObj));
		////////System.out.println("Request String:::::::"+gson.toJson(shiftAllocationBeanObj));
			result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("shiftAllocation_Service_get"), gson.toJson(shiftAllocationBeanObj), "GET");
			// log.info("Response String:::::::"+result);
		////////System.out.println("Response String:::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				shiftAllocationBeanObj = gson.fromJson(result, ShiftAllocationBean.class);
				int slNo = Integer.parseInt(index);
				if(shiftAllocationBeanObj.getShiftAllocationBeanList() != null && shiftAllocationBeanObj.getShiftAllocationBeanList().size() > 0)
				for(ShiftAllocationBean shiftAllocation : shiftAllocationBeanObj.getShiftAllocationBeanList())
					shiftAllocation.setSlNo(++slNo);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return shiftAllocationBeanObj;
	}
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to add more employees to the existing shift
	 *
	 **/
	public String updateShiftAllocation(ShiftAllocationBean shiftAllocationBeanObj,String customerId,String emailId){
		String result = null;
		try {
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			shiftAllocationBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			//// log.info("Request String::::::::::::"+gson.toJson(shiftAllocationBeanObj));
			//result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("shiftAllocation_Service_update"), gson.toJson(shiftAllocationBeanObj),"POST");
			result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("shiftAllocation_Service_update"), gson.toJson(shiftAllocationBeanObj));
			
			//// log.info("Response String:::::::::::"+result);
			if(result == null){
				result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
			}
			else{
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					result = AppProperties.getAppMessageByProperty("SHIFT_ALLOCATION_TO_EMPLOYEE_SUCCESS").trim();
				}
				else{
					result = Response.getResponseMessage(result);
				}
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to call delete the shifts
	 *
	 **/
	public String deleteShiftAllocation(String customerId,String emailId,String ids) {
		String result = null;
		try {
			ShiftAllocationBean shiftAllocationBeanObj = new ShiftAllocationBean();
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			shiftAllocationBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			String[] idsArray = ids.split(",");
			List<String> shiftAllocationList = new ArrayList<String>();
			for(int i=0;i<idsArray.length;i++)
				shiftAllocationList.add(idsArray[i]);
			shiftAllocationBeanObj.setShiftIds(shiftAllocationList);
			// log.info("Request:::"+ gson.toJson(shiftAllocationBeanObj));
			result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("shiftAllocation_Service_delete"), gson.toJson(shiftAllocationBeanObj),"GET");
			// log.info("Response:::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("SHIFTS_DELETE_SUCCESS").trim();
			else if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_FAILED_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("DELETE_FAILED").trim();
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
}
