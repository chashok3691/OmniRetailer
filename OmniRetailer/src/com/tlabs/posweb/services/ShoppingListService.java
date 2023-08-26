package com.tlabs.posweb.services;

import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;

import com.tlabs.posweb.init.AppProperties;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.tlabs.posweb.beans.CustomerShoppingList;
import com.tlabs.posweb.beans.OnlinePayments;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.beans.ShoppingItemsListResponse;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
import com.tlabs.posweb.util.RestfulServiceConnection;
//import com.tlabs.posweb.util.Utilities;

public class ShoppingListService {
	@Autowired
	private Gson gson;
	@Autowired
	SessionScope sessionScope;
	
	private static Logger log = Logger.getLogger(ShoppingListService.class);
	public ShoppingItemsListResponse getShoppingLists(String searchCriteria,String maxRecords,String index){
		String resultStr = null;
		ShoppingItemsListResponse shoppinglistresponse = new ShoppingItemsListResponse();
		try {
			OnlinePayments onlinepayments = new OnlinePayments();
			onlinepayments.setMaxRecords(maxRecords);
			//////////////System.out.println(index);
			onlinepayments.setStartIndex(index);
			onlinepayments.setSearchCriteria(searchCriteria);
			onlinepayments.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			// log.info("request String:::::::::::"+gson.toJson(onlinepayments));
			resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_shoppinglist"), gson.toJson(onlinepayments),"GET");
			// log.info("Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				shoppinglistresponse =gson.fromJson(resultStr,ShoppingItemsListResponse.class );
			}
			
		
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return shoppinglistresponse;
	}
	
	
	public String deleteShoppinglists(String ids) {
		String resultStr = null;
		try {
			CustomerShoppingList customershoppinglist = new CustomerShoppingList();
			customershoppinglist.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			String[] idsArray = ids.split(",");
			List<String> listids = new ArrayList<String>();
			for (int i = 0; i < idsArray.length; i++) {
				listids.add(idsArray[i]);
			}
			customershoppinglist.setListIds(listids);
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("delete_shoppinglist"), gson.toJson(customershoppinglist));
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
	
	


public String createCustomerShoppingList(CustomerShoppingList customershoppinglistobj){
String resultStr = null;
try {
	customershoppinglistobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
	// log.info("Request String::::::::::::"+gson.toJson(customershoppinglistobj));
	customershoppinglistobj.setCustomerPhNum(RequestHeaderUtil.getRequestHeader(sessionScope).getAccessKey());
	RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
	resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_shopping_list"), gson.toJson(customershoppinglistobj));
	// log.info("Response String:::::::::::"+resultStr);
	String responseCode = Response.getResponseCode(resultStr);
	if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
		resultStr = AppProperties.getAppMessageByProperty("SHOPPING_LIST_CREATION_SUCCESS").trim();
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





public String updateNewShoppingList(CustomerShoppingList customershoppinglistobj,String customerIdStr,String emailIdStr){
	String resultStr = null;
	try {
		customershoppinglistobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		// log.info("Request String::::::::::::"+gson.toJson(customershoppinglistobj));
		customershoppinglistobj.setCustomerPhNum(RequestHeaderUtil.getRequestHeader(sessionScope).getAccessKey());
		
		RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
		resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_shopping_list"), gson.toJson(customershoppinglistobj));
		// log.info("Response String:::::::::::"+resultStr);
		String responseCode = Response.getResponseCode(resultStr);
		
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			resultStr = AppProperties.getAppMessageByProperty("shoppinglist_update_success").trim();
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




public ShoppingItemsListResponse viewShoppingListDetails(String customerIdStr,String emailIdStr,String listId,String startIndex,String operation){
	
	// log.info("ShoppingListtService - viewShoppingList");
	//////////////System.out.println("shopping");
	String resultStr = null;
	ShoppingItemsListResponse shoppinglistresponse = new ShoppingItemsListResponse();
	//ShoppingItemsListResponse beanobj= null;
	CustomerShoppingList shoppinglistobj=null;
//	List<CustomerShoppingList> lists = null,itemslist = null;
	RestfulServiceConnection restfulConnectionObj = null;
	try{	
		gson = new Gson();
		restfulConnectionObj = new RestfulServiceConnection();
		shoppinglistobj = new CustomerShoppingList();
		shoppinglistobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
	    shoppinglistobj.setListId(listId);
	    shoppinglistobj.setStartIndex("0");
	    //shoppinglistobj.setCategoryId(categoryId);
		// log.info("Request String:::"+gson.toJson(shoppinglistobj));
		shoppinglistobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		// log.info("Request String : : : : "+ gson.toJson(shoppinglistobj));
		resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_shoppinglist"), gson.toJson(shoppinglistobj), "GET");
		// log.info("Response String : : : : "+ resultStr);
		String responseCode = Response.getResponseCode(resultStr);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			
			shoppinglistresponse =gson.fromJson(resultStr,ShoppingItemsListResponse.class );
			
			}
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	} catch(Exception e){
		e.printStackTrace();
	}
	return shoppinglistresponse;
}
}










