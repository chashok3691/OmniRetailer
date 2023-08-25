package com.tlabs.posweb.services;

import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;

import com.tlabs.posweb.init.AppProperties;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.tlabs.posweb.beans.MessageBoard;
import com.tlabs.posweb.beans.MessageLocations;
import com.tlabs.posweb.beans.MessageRoles;
import com.tlabs.posweb.beans.OutletDayClose;
import com.tlabs.posweb.beans.OutletDayCloseCompositeBean;
import com.tlabs.posweb.beans.OutletDayCloseResponse;
import com.tlabs.posweb.beans.OutletDayOpen;
import com.tlabs.posweb.beans.OutletDayOpenCompositBean;
import com.tlabs.posweb.beans.OutletDayOpenResponse;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
import com.tlabs.posweb.util.RestfulServiceConnection;
//import com.tlabs.posweb.util.Utilities;

public class OutletNotificationService {
	
	@Autowired
	private Gson gson;
	@Autowired
	SessionScope sessionScope;
	private static Logger log = Logger.getLogger(OutletNotificationService.class);
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 12-nov-2015
	 * 
	 * This method is used to call createMessageBoard method of web service and return the response
	 * This method accepts all the details of the message need to be sent to the outlet.
	 * 
	 * 
	 *
	 **/
	public String createMessageBoard(MessageBoard messageBoardObj,String customerId,String emailId){
		String result = null;
		try {
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			messageBoardObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			// log.info("Request String::::::::::::"+gson.toJson(messageBoardObj));
			result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("messageboard_Service_create"), gson.toJson(messageBoardObj),"POST");
			// log.info("Response String:::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("MESSAGE_SENT_SUCCESS").trim();
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
	 * Created On: 12-nov-2015
	 * 
	 * This method is used to call the getMessageBoards method of web service and return the MessageBoard List.
	 * 
	 */
	public List<MessageBoard> getMessageBoards(String customerId,String emailId,String index){
		String result = null;
		List<MessageBoard> messageBoardList = null;
		try {
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			MessageBoard messageBoardObj = new MessageBoard();
			messageBoardObj.setStartIndex(index);
			messageBoardObj.setMaxRecords("10");
			messageBoardObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String:::::::"+gson.toJson(messageBoardObj));
			//////////////System.out.println("Request String:::::::"+gson.toJson(messageBoardObj));
			result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("messageboard_Service_get"), gson.toJson(messageBoardObj), "GET");
			// log.info("Response String:::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					messageBoardObj = gson.fromJson(result, MessageBoard.class);
					messageBoardList = messageBoardObj.getMessageBoards();
					if(messageBoardList != null)
						messageBoardList.get(0).setTotalRecords(messageBoardObj.getTotalRecords());
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return messageBoardList;
	}

	/**
	 * @author Mythri.S	
	 * Created On: 13-nov-2015
	 * 
	 * This method is used to call the getMessageBoard method of web service and return the Message Details for the given messageId.
	 * 
	 */
	public MessageBoard getMessageBoard(String messageId,String customerId,String emailId){
		String result = null;
		MessageBoard messageBoardObj = new MessageBoard();
		try {
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			if(messageId != null)
				messageBoardObj.setMessageId(messageId);
			messageBoardObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String:::::::"+gson.toJson(messageBoardObj));
			//////////////System.out.println("Request String:::::::"+gson.toJson(messageBoardObj));
			result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("messageboard_Service_getMessageBoard"), gson.toJson(messageBoardObj), "GET");
			// log.info("Response String:::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				messageBoardObj = gson.fromJson(result, MessageBoard.class);
				messageBoardObj = messageBoardObj.getMessageBoardDetails();
				if(messageBoardObj.getMessageLocations() != null){
					List<String> locations = new ArrayList<String>();
					for(MessageLocations messageLocations: messageBoardObj.getMessageLocations()){
						locations.add(messageLocations.getLocation());
					}
					messageBoardObj.setLocations(locations);
				}
				if(messageBoardObj.getMessageRoles() != null){
					List<String> roles = new ArrayList<String>();
					List<String> users = new ArrayList<String>();
					for(MessageRoles messageRoles: messageBoardObj.getMessageRoles()){
						if(messageRoles.getReceiverType().equals("role"))
							roles.add(messageRoles.getRole());
						if(messageRoles.getReceiverType().equals("user"))
							users.add(messageRoles.getRole());
					}
					messageBoardObj.setRoles(roles);
					messageBoardObj.setUsers(users);
				}
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return messageBoardObj;
	}
	
	
	
	public OutletDayOpenResponse getDayOpen(String customerIdStr,String emailIdStr,String index,String maxRecords,String searchCriteria){
		String resultStr = null;
		OutletDayOpenResponse outletDayOpenResponse = new OutletDayOpenResponse();
		try {
			OutletDayOpen outletDayOpen = new OutletDayOpen();
			outletDayOpen.setMaxRecords(maxRecords);
			//////////////System.out.println("-1");
			outletDayOpen.setStartIndex(index);
			outletDayOpen.setMaxRecords("10");
			outletDayOpen.setSearchCriteria(searchCriteria);
			outletDayOpen.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//////////////System.out.println(gson.toJson(outletDayOpen));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			// log.info("request String:::::::::::"+gson.toJson(outletDayOpen));
			resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_outlet_day_open"), gson.toJson(outletDayOpen),"GET");
			// log.info("Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				outletDayOpenResponse =gson.fromJson(resultStr,OutletDayOpenResponse.class );
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return outletDayOpenResponse;
	}
	
	
	
	
	public String deleteDayOpens(String businessCounter,String outletLocation) {
		String resultStr = null;
		try {
			OutletDayOpen outletDayOpen = new OutletDayOpen();
			outletDayOpen.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
//			OutletDayOpenCompositBean outletdayopenobj = new OutletDayOpenCompositBean();
			/*String[] idsArray = ids.split(",");
			List<String> counterIds = new ArrayList<String>();
			for (int i = 0; i < idsArray.length; i++) {
				counterIds.add(idsArray[i]);
			}*/
			//outletDayOpen.setCounterIds(counterIds);
			outletDayOpen.setBusinessCounter(businessCounter);
			outletDayOpen.setOutletLocation(outletLocation);
			outletDayOpen.setStartIndex("0");
			
			//outletdayopenobj.setBusinessCounter(businessCounter);
			//outletdayopenobj.setOutletLocation(outletLocation);
			//outletDayOpen.setDayopens(outletdayopenobj);
			//outletDayOpen.setStartIndex("-1");
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			//////////////System.out.println(gson.toJson(outletDayOpen));
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("delete_Outlet_DayOpen"), gson.toJson(outletDayOpen));
			// log.info(resultStr);
			
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("Day_Open_Deleted_Successfully").trim();
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
	
	
	
	
	
	
	
	
	public String createOutletDayopen(OutletDayOpen outletdayopenobj){
		String resultStr = null;
		try {
			outletdayopenobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String::::::::::::"+gson.toJson(outletdayopenobj));
			//outletdayopenobj.setCustomerPhNum(RequestHeaderUtil.getRequestHeader(sessionScope).getAccessKey());
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_Outlet_Day_Open"), gson.toJson(outletdayopenobj));
			// log.info("Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("Day_Open_Created_Successfully").trim();
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

	
	
	
	
	public String updateOutletDayOpen(OutletDayOpen outletDayOpen,String customerIdStr,String emailIdStr){
		String resultStr = null;
		try {
			outletDayOpen.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String::::::::::::"+gson.toJson(outletDayOpen));
			//customershoppinglistobj.setCustomerPhNum(RequestHeaderUtil.getRequestHeader(sessionScope).getAccessKey());
			//////////////System.out.println(gson.toJson(outletDayOpen));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_Outlet_DayOpen"), gson.toJson(outletDayOpen));
			// log.info("Response String:::::::::::"+resultStr);
			//////////////System.out.println(resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("Day_open_update_Success").trim();
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

	
	
	

public OutletDayOpenResponse viewOutletDayOenDetails(String customerIdStr,String emailIdStr,String businessCounter,String outletLocation,String startIndex,String operation){
	
	// log.info("ShoppingListtService - viewShoppingList");
	
	String resultStr = null;
	OutletDayOpenCompositBean dayopens=null;
	OutletDayOpenResponse outletDayOpenResponse = new OutletDayOpenResponse();
	//ShoppingItemsListResponse beanobj= null;
	OutletDayOpen outlettobj=new OutletDayOpen();
//	List<OutletDayOpen> lists = null,itemslist = null;
	RestfulServiceConnection restfulConnectionObj = null;
	try{	
		gson = new Gson();
		restfulConnectionObj = new RestfulServiceConnection();
		dayopens = new OutletDayOpenCompositBean();
		outlettobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		dayopens.setBusinessCounter(businessCounter);
		outlettobj.setStartIndex(startIndex);
		dayopens.setOutletLocation(outletLocation);
	    //shoppinglistobj.setCategoryId(categoryId);
		outlettobj.setDayopens(dayopens);
		// log.info("Request String:::"+gson.toJson(dayopens));
		//////////////System.out.println(gson.toJson(outlettobj));
		//outlettobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		// log.info("Request String : : : : "+ gson.toJson(outlettobj));
		resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_outlet_day_open"), gson.toJson(outlettobj), "GET");
		// log.info("Response String : : : : "+ resultStr);
		//////////////System.out.println(resultStr);
		String responseCode = Response.getResponseCode(resultStr);
	
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			outletDayOpenResponse =gson.fromJson(resultStr,OutletDayOpenResponse.class );
	}
		
		/*if(outletDayOpenResponse.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
			lists = new ArrayList<OutletDayOpen>();
			itemslist = outletDayOpenResponse.getOutletDayOpen();
			int slNo = Integer.parseInt(outlettobj.getStartIndex());
			if(itemslist != null)
				for(int i=0;i<itemslist.size();i++){
					//itemslist.get(i).setSlNo(++slNo);
					lists.add(itemslist.get(i));
				}if(lists.size() != 0)
				lists.get(0).setTotalRecords(Response.getResponseTotalRecords(resultStr));
		}*/
	
	}catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	} catch(Exception e){
		e.printStackTrace();
	}
	return outletDayOpenResponse;
}




public OutletDayCloseResponse getDayClose(String customerIdStr,String emailIdStr,String index,String maxRecords,String searchCriteria){
	String resultStr = null;
	
	OutletDayCloseResponse outletDayOpenResponse = new OutletDayCloseResponse();
	try {
		OutletDayClose outletDayOpen = new OutletDayClose();
		outletDayOpen.setStartIndex(index);
		outletDayOpen.setMaxRecords("10");
		outletDayOpen.setSearchCriteria(searchCriteria);
		outletDayOpen.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
		// log.info("request String:::::::::::"+gson.toJson(outletDayOpen));
		//////////////System.out.println("request String:::::::::::"+gson.toJson(outletDayOpen));
		resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_outlet_day_close"), gson.toJson(outletDayOpen),"GET");
		// log.info("Response String:::::::::::"+resultStr);
		//////////////System.out.println("Response String:::::::::::"+resultStr);
		String responseCode = Response.getResponseCode(resultStr);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			outletDayOpenResponse =gson.fromJson(resultStr,OutletDayCloseResponse.class );
		}
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	} catch(Exception e){
		e.printStackTrace();
	}
	return outletDayOpenResponse;
}



public String createOutletDayclose(OutletDayClose outletdayopenobj){
	String resultStr = null;
	try {
		outletdayopenobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		// log.info("Request String::::::::::::"+gson.toJson(outletdayopenobj));
		//outletdayopenobj.setCustomerPhNum(RequestHeaderUtil.getRequestHeader(sessionScope).getAccessKey());
		//////////////System.out.println("Request String::::::::::::"+gson.toJson(outletdayopenobj));
		RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
		resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_Outlet_Day_Close"), gson.toJson(outletdayopenobj));
		// log.info("Response String:::::::::::"+resultStr);
		//////////////System.out.println("Response String:::::::::::"+resultStr);
		String responseCode = Response.getResponseCode(resultStr);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			resultStr = AppProperties.getAppMessageByProperty("Day_Close_Created_Successfully").trim();
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



public OutletDayCloseResponse viewOutletDayCloseDetails(String customerIdStr,String emailIdStr,String businessCounter,String outletLocation,String startIndex,String operation){


String resultStr = null;
OutletDayCloseCompositeBean dayclose=null;
OutletDayCloseResponse outletDaycloseResponse = new OutletDayCloseResponse();
//ShoppingItemsListResponse beanobj= null;
OutletDayClose outlettobj=new OutletDayClose();
//List<OutletDayClose> lists = null,itemslist = null;
RestfulServiceConnection restfulConnectionObj = null;
try{	
	gson = new Gson();
	restfulConnectionObj = new RestfulServiceConnection();
	dayclose = new OutletDayCloseCompositeBean();
	outlettobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
	dayclose.setBusinessCounter(businessCounter);
	outlettobj.setStartIndex(startIndex);
	dayclose.setOutletLocation(outletLocation);
    //shoppinglistobj.setCategoryId(categoryId);
	outlettobj.setDayClose(dayclose);
	// log.info("Request String:::"+gson.toJson(dayclose));
	//////////////System.out.println(gson.toJson(outlettobj));
	//outlettobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
	// log.info("Request String : : : : "+ gson.toJson(outlettobj));
	resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_outlet_day_close"), gson.toJson(outlettobj), "GET");
	// log.info("Response String : : : : "+ resultStr);
	//////////////System.out.println(resultStr);
	String responseCode = Response.getResponseCode(resultStr);

	if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
		outletDaycloseResponse =gson.fromJson(resultStr,OutletDayCloseResponse.class );
}
	
	/*if(outletDayOpenResponse.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
		lists = new ArrayList<OutletDayOpen>();
		itemslist = outletDayOpenResponse.getOutletDayOpen();
		int slNo = Integer.parseInt(outlettobj.getStartIndex());
		if(itemslist != null)
			for(int i=0;i<itemslist.size();i++){
				//itemslist.get(i).setSlNo(++slNo);
				lists.add(itemslist.get(i));
			}if(lists.size() != 0)
			lists.get(0).setTotalRecords(Response.getResponseTotalRecords(resultStr));
	}*/

}catch (NoSuchElementException nse) {
	nse.printStackTrace();
	resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
} catch(Exception e){
	e.printStackTrace();
}
return outletDaycloseResponse;
}










public String updateOutletDayClose(OutletDayClose outletDayClose,String customerIdStr,String emailIdStr){
	String resultStr = null;
	try {
		outletDayClose.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		// log.info("Request String::::::::::::"+gson.toJson(outletDayClose));
		//customershoppinglistobj.setCustomerPhNum(RequestHeaderUtil.getRequestHeader(sessionScope).getAccessKey());
		//////////////System.out.println(gson.toJson(outletDayClose));
		RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
		resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_Outlet_DayClose"), gson.toJson(outletDayClose));
		// log.info("Response String:::::::::::"+resultStr);
		//////////////System.out.println(resultStr);
		String responseCode = Response.getResponseCode(resultStr);
		
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			resultStr = AppProperties.getAppMessageByProperty("Day_Close_update_Success").trim();
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












public String deleteDayClose(String businessCounter,String outletLocation) {
	String resultStr = null;
	try {
		OutletDayClose outletDayClose = new OutletDayClose();
		outletDayClose.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
//		OutletDayOpenCompositBean outletdayopenobj = new OutletDayOpenCompositBean();
		outletDayClose.setBusinessCounter(businessCounter);
		outletDayClose.setOutletLocation(outletLocation);
		outletDayClose.setStartIndex("0");
		RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
		//////////////System.out.println(gson.toJson(outletDayClose));
		resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("delete_Outlet_DayClose"), gson.toJson(outletDayClose));
		// log.info(resultStr);
		
		String responseCode = Response.getResponseCode(resultStr);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			resultStr = AppProperties.getAppMessageByProperty("Day_Close_Deleted_Successfully").trim();
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
