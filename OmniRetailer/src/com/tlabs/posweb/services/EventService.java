package com.tlabs.posweb.services;

import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;

import com.tlabs.posweb.init.AppProperties;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.tlabs.posweb.beans.BusinessEvent;
import com.tlabs.posweb.beans.BusinessEventResponse;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
import com.tlabs.posweb.util.RestfulServiceConnection;
//import com.tlabs.posweb.util.Utilities;

public class EventService {
	@Autowired
	private Gson gson;
	
	@Autowired
	SessionScope sessionScope;
	
//	private static Logger log = Logger.getLogger(EventService.class);
	
	
	public List<BusinessEvent> getEvents(String eventId,String index,boolean search,boolean specific,String startDate,String endDate,String maxRecords){
		List<BusinessEvent> businessEventList = null;
		String resultStr = null;
		try{
			BusinessEvent businessEventObj = new BusinessEvent();
			
			businessEventObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			if(search)
				businessEventObj.setSearchCriteria(eventId);
			else
				businessEventObj.setEventId(eventId);
			businessEventObj.setEventStartDateStr(startDate);
			businessEventObj.setEventEndDateStr(endDate);
			businessEventObj.setMaxRecords(maxRecords);
			businessEventObj.setStartIndex(index);
			// log.info("Request::"+gson.toJson(businessEventObj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_events"), gson.toJson(businessEventObj),"GET");
			// log.info("Response::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				BusinessEventResponse businessEventResponseObj = gson.fromJson(resultStr, BusinessEventResponse.class);
				if(specific){
					businessEventObj = businessEventResponseObj.getEventObj();
					if(businessEventObj != null){
						businessEventList = new ArrayList<BusinessEvent>();
						businessEventList.add(businessEventObj);
					}
				}else{
					if(businessEventResponseObj.getEventList() != null && businessEventResponseObj.getEventList().size() > 0){
						businessEventList = businessEventResponseObj.getEventList();
						businessEventList.get(0).setTotalRecords(businessEventResponseObj.getTotalRecords()+"");
						int slNo = Integer.parseInt(index);
						for(BusinessEvent businessEvent : businessEventList){
							businessEvent.setSlNo(++slNo);
						}
					}
				}
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return businessEventList;
	}
	
	public String createEvent(BusinessEvent businessEventObj){
		String resultStr = null;
		try {
			businessEventObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			businessEventObj.setUserName(sessionScope.getLoginId());
			businessEventObj.setUserRole(sessionScope.getRole());
			// log.info("Request:::"+gson.toJson(businessEventObj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_event"), gson.toJson(businessEventObj));
			// log.info("Result:::"+resultStr);
			 String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
						resultStr = AppProperties.getAppMessageByProperty("EVENT_CREATE_SUCCESS").trim();
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
	
	public String updateEvent(BusinessEvent businessEventObj){
		String resultStr = null;
		try {
			businessEventObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			businessEventObj.setUserName(sessionScope.getLoginId());
			businessEventObj.setUserRole(sessionScope.getRole());
			// log.info("Request:::"+gson.toJson(businessEventObj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_event"), gson.toJson(businessEventObj));
			// log.info("Result:::"+resultStr);
			 String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
						resultStr = AppProperties.getAppMessageByProperty("EVENT_UPDATE_SUCCESS").trim();
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
	
	
	public String deleteEvents(String ids) {
		String resultStr = null;
		try {
			BusinessEvent businessEventObj = new BusinessEvent();
			businessEventObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			String[] idsArray = ids.split(",");
			businessEventObj.setEventIds(idsArray);
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("delete_events"), gson.toJson(businessEventObj));
			// log.info(resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("EVENT_DELETE_SUCCESS").trim();
			}
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
}
