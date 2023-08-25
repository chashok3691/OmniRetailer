/*******************************************************************************
 * Copyright  2015 Omni Retailer Customer Console, All rights reserved.
 * Author : Sahitya
 * Created On : 31-8-2015
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

import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.tlabs.posweb.beans.OrdersDashboardBean;
import com.tlabs.posweb.beans.ReportsBean;
import com.tlabs.posweb.beans.RequestBean;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.beans.StockDashboardBean;
import com.tlabs.posweb.beans.TurnOverDashBoardBean;
import com.tlabs.posweb.beans.WastageDashboardBean;
import com.tlabs.posweb.init.AppProperties;
import com.tlabs.posweb.util.Constants;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
import com.tlabs.posweb.util.RestfulServiceConnection;

public class DashboardService {

	@Autowired
	private Gson gson;
	@Autowired
	SessionScope sessionScope;
//	private static Logger log = Logger.getLogger(DashboardService.class);
	
	public static String getResponseCode(String constantName,String propertyFile) {
		Properties properties = null;
		String constant = null;
		InputStream inputStream = null;
		try {
			properties = new Properties();
			inputStream = ShiftService.class.getClassLoader().getResourceAsStream(propertyFile+".properties");
			properties.load(inputStream);
			constant = (String) properties.get(constantName);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try{
				properties.clear();
				inputStream.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return constant.trim();
	}
	
	
	/**
	 * @author Sahitya
	 * 
	 * This method is used to get monthly (or) weekly orders
	 * @modifiedBy: Vijay
	 *@modificationDate: 02-Nov-17
	 *@modificationDescription: added parameters like sub department,startdate,enddate to implement search functionality
	 *
	 */
	public OrdersDashboardBean getOrders(String customerIdStr,String emailIdStr,String locationStr,String searchCriteriaStr,String selectedDate,String categoryStr,String zone,String subcategory,String brand,String startdate,String enddate,String department,String subDepartment){
	    String result = null;
	    RequestBean reqBeanObj = null;
	    OrdersDashboardBean orderBeanObj = null;
	    RestfulServiceConnection restfulConnectionObj = null;
	    try{
	    	reqBeanObj = new RequestBean();
	    	restfulConnectionObj = new RestfulServiceConnection();
	    	//reqBeanObj.setStoreName(locationStr);
	    	reqBeanObj.setStoreLocation(locationStr);
	    	reqBeanObj.setCategory(categoryStr);
	    	reqBeanObj.setBrand(brand);
	    	reqBeanObj.setZoneID(zone);
	    	reqBeanObj.setSubCategory(subcategory);
	    	reqBeanObj.setStartDate(startdate);
	    	reqBeanObj.setStartIndex(Constants.PAGINATION_START_INDEX);
	    	reqBeanObj.setSearchCriteria(searchCriteriaStr);
	    	reqBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
	    	reqBeanObj.setStartDateStr(selectedDate);
	    	reqBeanObj.setEndDate(enddate);
	    	reqBeanObj.setSubDepartment(subDepartment);
	    	reqBeanObj.setDepartment(department);
	    	String requestString = gson.toJson(reqBeanObj);
    	    result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("OUTLET_DASHBOARD_ORDERS"), requestString, "GET");
            String responseCode = Response.getResponseCode(result);
//			// log.info(responseCode);
            //////////System.out.println("Responce ......OUTLET_DASHBOARD_ORDERS"+result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				orderBeanObj = gson.fromJson(result,OrdersDashboardBean.class);
			}else{
				orderBeanObj = null;
			}
		 }catch(Exception e){
			e.printStackTrace();
			result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		}
	    return orderBeanObj;
	}
	
	
	
	/**
     * @author Sahitya
	 * @Desc This method is used to get monthly (or) weekly orders
	 * @modifiedBy: Vijay
	 * @modificationDate: 02-Nov-17
	 * @modificationDescription: added parameters like location,category,subcategory,zone,brand,model,department,sub department,startdate,enddate to implement search functionality
	*/
	public ReportsBean getdasboardinfo(String customerIdStr,String emailIdStr,String locationStr,String searchCriteriaStr,String selectedDate,String categoryStr,String zone,String subcategory,String brand,String startDate,String endDate, String department,String subDepartment){
	    String result = null;
	    RequestBean reqBeanObj = null;
	    ReportsBean responseObj = new ReportsBean();
//	    OrdersDashboardBean orderBeanObj = null;
	    RestfulServiceConnection restfulConnectionObj = null;
	   
	 	    
	    try{
	    	reqBeanObj = new RequestBean();
	    	restfulConnectionObj = new RestfulServiceConnection();
	    	//reqBeanObj.setStoreName(locationStr);
	    	/*if(locationStr.equals("all")||locationStr.equals("All"))
	    	reqBeanObj.setStoreLocation("");
	    	else*/
	    	reqBeanObj.setStoreLocation(locationStr);
	    	reqBeanObj.setCategory(categoryStr);
	    	reqBeanObj.setBrand(brand);
	    	reqBeanObj.setZoneID(zone);
	    	reqBeanObj.setSubCategory(subcategory);
	    	reqBeanObj.setStartDate(startDate);
	    	reqBeanObj.setStartIndex(Constants.PAGINATION_START_INDEX);
	    	reqBeanObj.setSearchCriteria(searchCriteriaStr);
	    	reqBeanObj.setDepartment(department);
	    	reqBeanObj.setSubDepartment(subDepartment);
	    	
	    	reqBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
	    	
//	    	reqBeanObj.setStartDate(selectedDate);
	    	reqBeanObj.setEndDate(endDate);
	    	String requestString = gson.toJson(reqBeanObj);
	    	
	    //	////////////System.out.println(requestString);
    	    result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("OUTLET_DASHBOARD_INFO"), requestString, "GET");
//////////System.out.println("Respoonse from Dashboard Service:::"+result);
            String responseCode = Response.getResponseCode(result);
//			// log.info(responseCode);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				responseObj = gson.fromJson(result,ReportsBean.class);
			}else{
				responseObj = null;
			}
		 }catch(Exception e){
			e.printStackTrace();
			result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		}
	    return responseObj;
	}
	

	/**
	 * @author Sahitya
	 * 
	 * This method is used to get monthly (or) weekly sales
	 *  
	 */
	public List<Float> getSales(String customerIdStr,String emailIdStr,String locationStr,String searchCriteriaStr,String categoryStr,String selectedDate,String zone,String subcategory,String brand,String startdate,String enddate){
	    String result = null;
	    RequestBean reqBeanObj = null;
	    List<Float> salesList = new ArrayList<Float>();
	    RestfulServiceConnection restfulConnectionObj = null;
	    List<StockDashboardBean> stockDashboardBeanList = null;
	    try{
	    	reqBeanObj = new RequestBean();
	    	restfulConnectionObj = new RestfulServiceConnection();
	    	Map<Object,Float> salesMap = new HashMap<Object,Float>();
	    	reqBeanObj.setStoreLocation(locationStr);
	    	reqBeanObj.setCategory(categoryStr);
	    	reqBeanObj.setCategory(categoryStr);
	    	reqBeanObj.setBrand(brand);
	    	reqBeanObj.setZoneID(zone);
	    	reqBeanObj.setSubCategory(subcategory);
	    	reqBeanObj.setStartDate(startdate);
	    	//reqBeanObj.setStoreLocation(locationStr);
	    	reqBeanObj.setStartIndex(Constants.PAGINATION_START_INDEX);
	    	reqBeanObj.setSearchCriteria(searchCriteriaStr);
	    	reqBeanObj.setStartDateStr(selectedDate);
	    	reqBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
	    	String requestString = gson.toJson(reqBeanObj);
	    	//if(categoryStr==""||categoryStr==null){
	    		result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("OUTLET_DASHBOARD_SALES"), requestString, "GET");
	    	/*}if(categoryStr!=""||categoryStr!=null){
	    		result = restfulConnectionObj.getResponse(getResponseCode("OUTLET_DASHBOARD_SALES_CATEGORY","Url"), requestString, "GET");
	    	}*/
    	    
            // log.info("Respoonse from Dashboard Service:::"+result);
           
            String responseCode = Response.getResponseCode(result);
			// log.info(responseCode);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				reqBeanObj = gson.fromJson(result,RequestBean.class);
				stockDashboardBeanList = reqBeanObj.getStocksInfoByCategory();
				if(searchCriteriaStr.equals("week")){
					for(int i=0;i<stockDashboardBeanList.size();i++){
						salesMap.put(stockDashboardBeanList.get(i).getDayName(), stockDashboardBeanList.get(i).getTotalCategoryAmount());
					}
					salesList.add(salesMap.get("Sun"));
					salesList.add(salesMap.get("Mon"));
					salesList.add(salesMap.get("Tue"));
					salesList.add(salesMap.get("Wed"));
					salesList.add(salesMap.get("Thu"));
					salesList.add(salesMap.get("Fri"));
					salesList.add(salesMap.get("Sat"));
				}
				else{
					for(int i=0;i<stockDashboardBeanList.size();i++){
						salesMap.put("day"+stockDashboardBeanList.get(i).getDayNumber(), stockDashboardBeanList.get(i).getTotalCategoryAmount());
					}
					for(int i= 1;i<=30;i++){
						salesList.add(salesMap.get("day"+i));
					}
				}
				
			}else{
				reqBeanObj = null;
			}
		 }catch(Exception e){
			e.printStackTrace();
			result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		}
	    return salesList;
	}
	
	
	/**
	 * @author Sahitya
	 * 
	 * This method is used to get monthly (or) weekly orders
	 *  
	 */
	public  List<Float>getStocks(String customerIdStr,String emailIdStr,String locationStr,String searchCriteriaStr,String categoryStr,String selectedDate,String zone,String subcategory,String brand,String startdate,String enddate){
	    String result = null;
	    RequestBean reqBeanObj = null;
	    List<Float> stocksList = new ArrayList<Float>();
	    RestfulServiceConnection restfulConnectionObj = null;
	    List<StockDashboardBean> stockDashboardBeanList = null;
	    try{
	    	reqBeanObj = new RequestBean();
	    	restfulConnectionObj = new RestfulServiceConnection();
	    	Map<Object,Float> stocksMap = new HashMap<Object,Float>();
	    	reqBeanObj.setStoreLocation(locationStr);
	    	reqBeanObj.setCategory(categoryStr);
	    	reqBeanObj.setBrand(brand);
	    	reqBeanObj.setZoneID(zone);
	    	reqBeanObj.setSubCategory(subcategory);
	    	reqBeanObj.setStartDate(startdate);
	    	reqBeanObj.setEndDate(enddate);
	    	reqBeanObj.setStartIndex(Constants.PAGINATION_START_INDEX);
	    	reqBeanObj.setSearchCriteria(searchCriteriaStr);
	    	reqBeanObj.setStartDateStr(selectedDate);
	    	reqBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
	    	String requestString = gson.toJson(reqBeanObj);
    	    result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("OUTLET_DASHBOARD_STOCKS_CATEGORY"), requestString, "GET");
            // log.info("Respoonse from Dashboard Service:::"+result);
            String responseCode = Response.getResponseCode(result);
//			// log.info(responseCode);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				reqBeanObj = gson.fromJson(result,RequestBean.class);
				stockDashboardBeanList = reqBeanObj.getStocksInfoByCategory();
				if(searchCriteriaStr.equals("week")){
					for(int i=0;i<stockDashboardBeanList.size();i++){
						stocksMap.put(stockDashboardBeanList.get(i).getDayName(), stockDashboardBeanList.get(i).getTotalCategoryAmount());
					}
					stocksList.add(stocksMap.get("Sun"));
					stocksList.add(stocksMap.get("Mon"));
					stocksList.add(stocksMap.get("Tue"));
					stocksList.add(stocksMap.get("Wed"));
					stocksList.add(stocksMap.get("Thu"));
					stocksList.add(stocksMap.get("Fri"));
					stocksList.add(stocksMap.get("Sat"));
				}
				else{
					for(int i=0;i<stockDashboardBeanList.size();i++){
						stocksMap.put("day"+stockDashboardBeanList.get(i).getDayNumber(), stockDashboardBeanList.get(i).getTotalCategoryAmount());
					}
					for(int i= 1;i<=30;i++){
						stocksList.add(stocksMap.get("day"+i));
					}
				}
			}
		 }catch(Exception e){
			e.printStackTrace();
			result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		}
	    return stocksList;
	}
	
	/*@modifiedBy: Vijay
	 *@modificationDate: 02-Nov-17
	 *@modificationDescription: added parameters like sub department,startdate,enddate to implement search functionality
	 */
	public String getTurnOvers(String customerIdStr,String emailIdStr,String locationStr,String searchCriteriaStr,String selectedDate,String categoryStr,String zone,String subcategory,String brand,String startdate,String enddate,String department,String subDepartment){
	    String result = null;
	    RequestBean reqBeanObj = null;
	    TurnOverDashBoardBean responseBeanObj = null; 
//	    List<TurnOverDashBoardBean> turnOverList = null; 
	    RestfulServiceConnection restfulConnectionObj = null;
	    try{
	    	reqBeanObj = new RequestBean();
	    	restfulConnectionObj = new RestfulServiceConnection();
	    	reqBeanObj.setStoreLocation(locationStr);
	    	reqBeanObj.setStartIndex(Constants.PAGINATION_START_INDEX);
	    	reqBeanObj.setSearchCriteria(searchCriteriaStr);
	    	reqBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
	    	reqBeanObj.setStartDateStr(selectedDate);
	    	reqBeanObj.setCategory(categoryStr);
	    	reqBeanObj.setBrand(brand);
	    	reqBeanObj.setZoneID(zone);
	    	reqBeanObj.setSubCategory(subcategory);
	    	reqBeanObj.setStartDate(startdate);
	    	reqBeanObj.setDepartment(department);
	    	reqBeanObj.setSubDepartment(subDepartment);
	    	String requestString = gson.toJson(reqBeanObj);
    	    result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("OUTLET_DASHBOARD_TURNOVERS"), requestString, "GET");
            // log.info("Respoonse from Dashboard Service:::"+result);
          
                    responseBeanObj= gson.fromJson(result, TurnOverDashBoardBean.class);
//            turnOverList = responseBeanObj.getTurnOvers();
           
            
            
            
//			if(reqBeanObj != null)
//			{
//				for(int i=0;i<reqBeanObj;i++)
//				{
//					responseBeanObj.add(reqBeanObj.get(i).getLocationId());
//				}
//			}
            
          
            String responseCode = Response.getResponseCode(result);
			if(!responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE"))){
				result = null;
			}
		 }catch(Exception e){
			e.printStackTrace();
			result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		}
	    return result;
	}
	
	/*@modifiedBy: Vijay
	 *@modificationDate: 03-Nov-17
	 *@modificationDescription: added parameters like sub department,startdate,enddate to implement search functionality
	 */
	public WastageDashboardBean getWastageStockInfo(String customerIdStr,String emailIdStr,String locationStr,String searchCriteriaStr,String selectedDate,String categoryStr,String zone,String subcategory,String brand,String startdate,String enddate,String department,String subDepartment){
	    String result = null;
	    RequestBean reqBeanObj = null;
	    WastageDashboardBean wastageDashboardBeanObj = null;
	    RestfulServiceConnection restfulConnectionObj = null;
	    try{
	    	reqBeanObj = new RequestBean();
	    	restfulConnectionObj = new RestfulServiceConnection();
	    	//reqBeanObj.setStoreName(locationStr);
	    	reqBeanObj.setStoreLocation(locationStr);
	    	reqBeanObj.setStartIndex(Constants.PAGINATION_START_INDEX);
	    	reqBeanObj.setSearchCriteria(searchCriteriaStr);
	    	reqBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
	    	reqBeanObj.setStartDateStr(selectedDate);
	    	reqBeanObj.setCategory(categoryStr);
	    	reqBeanObj.setBrand(brand);
	    	reqBeanObj.setZoneID(zone);
	    	reqBeanObj.setSubCategory(subcategory);
	    	reqBeanObj.setStartDate(startdate);
	    	reqBeanObj.setDepartment(department);
	    	reqBeanObj.setSubDepartment(subDepartment);
	    	String requestString = gson.toJson(reqBeanObj);
    	    result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("OUTLET_DASHBOARD_WASTAGES"), requestString, "GET");
            // log.info("Respoonse from Dashboard Service:::"+result);
      
            String responseCode = Response.getResponseCode(result);
//			// log.info(responseCode);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				wastageDashboardBeanObj = gson.fromJson(result,WastageDashboardBean.class);
			}else{
				wastageDashboardBeanObj = null;
			}
		 }catch(Exception e){
			e.printStackTrace();
			result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		}
	    return wastageDashboardBeanObj;
	}
}
