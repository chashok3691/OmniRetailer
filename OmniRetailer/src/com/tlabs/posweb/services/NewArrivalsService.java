package com.tlabs.posweb.services;
import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;

import com.tlabs.posweb.init.AppProperties;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.tlabs.posweb.beans.NewArrivalProducts;
import com.tlabs.posweb.beans.NewArrivalResponse;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
import com.tlabs.posweb.util.RestfulServiceConnection;
//import com.tlabs.posweb.util.Utilities;



public class NewArrivalsService {
	
	@Autowired
	private Gson gson;
	@Autowired
	SessionScope sessionScope;
	
//	private static Logger log = Logger.getLogger(NewArrivalsService.class);
	
	/**
	 * @author chaithanya.v
	 * 
	 *This method is used to call getnewarrivals method of web service and return the response
	 *
	 **/
	public NewArrivalResponse getNewArrivals(String index,String newarrivaltype,String searchstr,String startdate,String enddate,String date,String maxRecords,String newarrivalId){
		String resultStr = null;
		NewArrivalResponse newarrivalresponse =new NewArrivalResponse();
		try {
			NewArrivalProducts skuObj = new NewArrivalProducts();
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			skuObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			skuObj.setMaxRecords(maxRecords);
			skuObj.setStartIndex(index);
			skuObj.setNewCategoryType(newarrivaltype);
			skuObj.setSearchCriteria(searchstr);
			skuObj.setStartDateStr(startdate);
			skuObj.setEndDateStr(enddate);
			skuObj.setNewRefId(newarrivalId);
			// log.info("Request String::::::::::::"+gson.toJson(skuObj));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_newarrivals"), gson.toJson(skuObj), "GET");
			// log.info("Response String:::::::::::"+resultStr);
		///	System.out.println("Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				newarrivalresponse= gson.fromJson(resultStr, NewArrivalResponse.class);	
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return newarrivalresponse;
	}
	
	
	/**
	 * @author chaithanya.v
	 * 
	 *This method is used to call createNewFeatureProductGroupMaster method of web service and return the response
	 *
	 **/
	public String createNewarrivalGroupMaster( NewArrivalProducts newarrivals ){
		String resultStr = null;
		try {
			newarrivals.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String::::::::::::"+gson.toJson(newarrivals));
		///	System.out.println("Request Arrivals String::::::::::"+gson.toJson(newarrivals));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_newarrivals"), gson.toJson(newarrivals));
			// log.info("Response String:::::::::::"+resultStr);
		///	System.out.println("Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("NEWARRIVAL_GROUP_CREATE_SUCCESS").trim();
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
	 * @author Viswanath
	 * 
	 *This method is used to call deleteProductGroup method of web service and return the response
	 *
	 **/
	public String deleteNewArrivals(String ids) {
		String resultStr = null;
		try {
			
			NewArrivalProducts masterObj=new NewArrivalProducts();
			//////////////System.out.println("Ids::"+ids);
			masterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			String[] groups = ids.split(",");
			List<String> featureIds = new ArrayList<String>();
			for(int i=0;i<groups.length;i++)
				featureIds.add(groups[i]);
			masterObj.setNewRefIds(featureIds);
			//////////////System.out.println("groupDetails::"+featureIds);
			// log.info(gson.toJson(masterObj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("delete_newarrivals"), gson.toJson(masterObj));
			// log.info("Result:"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				resultStr = AppProperties.getAppMessageByProperty("NEWARRIVAL_GROUP_DELETE_SUCCESS").trim();
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
	/**
	 * @author chaithanya.v
	 * 
	 *This method is used to call updateNewFeatureProductGroupMaster method of web service and return the response
	 *
	 **/
	public String updateNewarrivalGroupMaster(NewArrivalProducts newarrivals){
		String resultStr = null;
		try {
			newarrivals.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String::::::::::::"+gson.toJson(newarrivals));
	////		System.out.println("Request String::::::::::::"+gson.toJson(newarrivals));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_newarrivals"), gson.toJson(newarrivals));
			// log.info("Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("NEWARRIVAL_GROUP_UPDATE_SUCCESS").trim();
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
	
}

