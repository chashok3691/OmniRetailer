/**
 * @author Soumya Vatte
 * @createdon : 12-07-2016 
 * @param feedbackId,location,status of order
 * 	
 * This method is used to get the FeedbackDetails from server
*/

package com.tlabs.posweb.services;

import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.tlabs.posweb.beans.Feedback;
import com.tlabs.posweb.beans.FeedbackDetailsResponse;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.init.AppProperties;
import com.tlabs.posweb.util.Constants;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
import com.tlabs.posweb.util.RestfulServiceConnection;
//import com.tlabs.posweb.util.Utilities;

public class FeedbackService {
	

	@Autowired
	private Gson gson;
	@Autowired
	SessionScope sessionScope;
//	private static Logger log = Logger.getLogger(FeedbackService.class);
	public List<Feedback> getFeedbackDetails(String feedback_id,String customerIdStr,String emailIdStr,String searchName,String startDateStr,String endDateStr,String LocationStr,boolean search,String index,String maxRecords,String feedbackCategory,String status,String channel,String zone)
	{
		// log.info("feedbackservice - getfeedbackdetails");
		String resultStr = null;
		FeedbackDetailsResponse feedbackresponseobj=null;
		Feedback feedbackObj = null;
		List<Feedback> feedback = null,feedbackList = null;
		RestfulServiceConnection restfulConnectionObj = null;
		try{
			gson = new Gson();
			restfulConnectionObj = new RestfulServiceConnection();
			feedbackObj = new Feedback();
			feedbackObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			feedbackObj.setStoreLocation(LocationStr);
			feedbackObj.setStartIndex(index);
			feedbackObj.setSearchCriteria(searchName);
			feedbackObj.setStartDate(startDateStr);
			feedbackObj.setEndDate(endDateStr);
			feedbackObj.setFeedbackCategory(feedbackCategory);
			feedbackObj.setFeedbackChannel(channel);
			feedbackObj.setZoneId(zone);
			/*feedbackObj.setStatus(status);*/
			feedbackObj.setMaxRecords(maxRecords);
			////////System.out.println("Request String:::"+gson.toJson(feedbackObj));
			feedbackObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("feedback_Service_get_feedback_details"), gson.toJson(feedbackObj), "GET");
		//////////System.out.println("Response String : : : : "+ resultStr);
		feedbackresponseobj = gson.fromJson(resultStr,FeedbackDetailsResponse.class); 
		if(feedbackresponseobj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
			feedbackList = new ArrayList<Feedback>();
			
			feedback = feedbackresponseobj.getFeedbackList();
			int slNo = Integer.parseInt(feedbackObj.getStartIndex());
			
			if(feedback != null)
				for(int i=0;i<feedback.size();i++){
					feedback.get(i).setSlNo(++slNo);
					feedbackList.add(feedback.get(i));
				}
			else{
				feedbackList.add(feedbackresponseobj.getFeedbackDetails());
			}
			if(feedbackList.size() != 0)
				
				feedbackList.get(0).setTotalRecords(Response.getResponseTotalRecords(resultStr));
		}
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	} catch(Exception e){
		e.printStackTrace();
	}
	return feedbackList;
	
}

	
	
	public Feedback getFeedbackDetailsbyId(String feedback_id,String customerIdStr,String emailIdStr,String searchName,String startDateStr,String endDateStr,String LocationStr,boolean search,String index,String maxRecords,String feedbackCategory,String status)
	{
		// log.info("feedbackservice - getfeedbackdetails");
		String resultStr = null;
		FeedbackDetailsResponse feedbackresponseobj=null;
		Feedback feedbackObj = null;
		Feedback feedbackdetails =null;
		List<Feedback> feedback = null,feedbackList = null;
		RestfulServiceConnection restfulConnectionObj = null;
		try{
			gson = new Gson();
			restfulConnectionObj = new RestfulServiceConnection();
			feedbackObj = new Feedback();
			feedbackObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			feedbackObj.setStoreLocation(LocationStr);
			feedbackObj.setStartIndex(index);
			feedbackObj.setFeedback_id(feedback_id);
			feedbackObj.setSearchCriteria(searchName);
			feedbackObj.setStartDate(startDateStr);
			feedbackObj.setEndDate(endDateStr);
			feedbackObj.setFeedbackCategory(feedbackCategory);
			feedbackObj.setStatus(status);
			feedbackObj.setMaxRecords(maxRecords);
			// log.info("Request String:::"+gson.toJson(feedbackObj));
			feedbackObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		// log.info("Request String : : : : "+ gson.toJson(feedbackObj));
		resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("feedback_Service_get_feedback_details"), gson.toJson(feedbackObj), "GET");
		// log.info("Response String : : : : "+ resultStr);
	    //////////System.out.println("Response String : : : :"+ resultStr);

		
		feedbackresponseobj = gson.fromJson(resultStr,FeedbackDetailsResponse.class); 
		if(feedbackresponseobj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
			//////////////System.out.println(feedbackresponseobj.getFeedbackDetails());
		 feedbackdetails = feedbackresponseobj.getFeedbackDetails();
		}
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	} catch(Exception e){
		e.printStackTrace();
	}
	return feedbackdetails;
	
}
/**
 * 
 * @author Soumya Vatte
 * 
 *This method is used to call createFeedback method of web service and return the response
 *
 **/
public String createCustomerFeedback(Feedback feedbackObj,String customerIdStr,String emailIdStr){
	
	String result = null;
	try {
		
		feedbackObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		// log.info("Request String::::::::::::"+gson.toJson(feedbackObj));
		RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
		
		result = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_feedback"), gson.toJson(feedbackObj));
		// log.info("Response String:::::::::::"+result);
		String responseCode = Response.getResponseCode(result);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			result = AppProperties.getAppMessageByProperty("CUSTOMER_FEEDBACK_CREATE_SUCCESS").trim();
		}
		else{
			//result = "Couldn't create, please try after some time";
			result = Response.getResponseMessage(result);
		}
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	} catch(Exception e){
		e.printStackTrace();
	} 
	return result;
}
public String updateFeedback(Feedback feedbackObj){

	
	String result = null;
	try {
		
		feedbackObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		// log.info("Request String::::::::::::"+gson.toJson(feedbackObj));
		//////////System.out.println("Request String::::::::::::"+gson.toJson(feedbackObj));
		RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
		
		result = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("feedback_service_update"), gson.toJson(feedbackObj));
		// log.info("Response String:::::::::::"+result);
		//////////System.out.println("Response String:::::::::::"+result);
		String responseCode = Response.getResponseCode(result);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			result = AppProperties.getAppMessageByProperty("CUSTOMER_FEEDBACK_UPDATE_SUCCESS").trim();
		}
		else{
			//result = "Couldn't create, please try after some time";
			result = Response.getResponseMessage(result);
		}
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	} catch(Exception e){
		e.printStackTrace();
	} 
	return result;

}
}
