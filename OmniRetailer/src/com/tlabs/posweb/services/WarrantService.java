package com.tlabs.posweb.services;

import java.util.List;
import java.util.NoSuchElementException;

import com.tlabs.posweb.init.AppProperties;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.tlabs.posweb.beans.CustomerWarrenty;
import com.tlabs.posweb.beans.CustomerWarrentyResponse;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
import com.tlabs.posweb.util.RestfulServiceConnection;
//import com.tlabs.posweb.util.Utilities;
 

public class WarrantService {
	
	@Autowired
	private Gson gson;
	
	@Autowired
	SessionScope sessionScope;
	
		private static Logger log = Logger.getLogger(WarrantService.class);
	
	
	public List<CustomerWarrenty> getCustomerWarranty(String warrentyId,String index,boolean search, String startDate,String endDate, String product,String warehouse_location,String dealStatus, String maxRecords){
		List<CustomerWarrenty> customerWarrentyList = null;
		String resultStr = null;
		try{
			CustomerWarrenty customerWarrentyObj = new CustomerWarrenty();
			
			customerWarrentyObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			if(search)
				customerWarrentyObj.setSearchCriteria(warrentyId);

			customerWarrentyObj.setStartIndex(index);
			customerWarrentyObj.setMaxRecords(maxRecords);
			customerWarrentyObj.setStartDate(startDate);
			customerWarrentyObj.setEndDate(endDate);
			customerWarrentyObj.setProductCategory(product);
			customerWarrentyObj.setStoreLocation(warehouse_location);
			customerWarrentyObj.setStatus(dealStatus);
			// log.info("Request::"+gson.toJson(customerWarrentyObj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Warrents"), gson.toJson(customerWarrentyObj),"GET");
			// log.info("Response::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				CustomerWarrentyResponse customerWarrentyResponseObj = gson.fromJson(resultStr, CustomerWarrentyResponse.class);
					if(customerWarrentyResponseObj.getCusWarrentyDetailsList() != null && customerWarrentyResponseObj.getCusWarrentyDetailsList().size() > 0){
						customerWarrentyList = customerWarrentyResponseObj.getCusWarrentyDetailsList();
						customerWarrentyList.get(0).setTotalRecords(customerWarrentyResponseObj.getTotalRecords()+"");
						int slNo = Integer.parseInt(index);
						for(CustomerWarrenty customerWarrenty : customerWarrentyList){
							customerWarrenty.setSlNo(++slNo);
						}
					}
			}
		} catch (NoSuchElementException nse) {                                      
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return customerWarrentyList;
	}


}
