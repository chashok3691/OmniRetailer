
/*******************************************************************************
 * Copyright  2015 Omni Retailer Customer Console, All rights reserved.
 * Author : Sahitya P
 * Created On : 9-4-2015
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

import java.rmi.ConnectException;
import java.rmi.RemoteException;
import java.rmi.UnknownHostException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.NoSuchElementException;

import com.tlabs.posweb.init.AppProperties;
import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.technolabssoftware.www.WHStockIssuesProxy;
import com.tlabs.posweb.beans.GetStockIssueResponse;
import com.tlabs.posweb.beans.RequestBean;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.beans.StockIssue;
import com.tlabs.posweb.beans.StockIssueBean;
import com.tlabs.posweb.beans.StockIssueDetails;
import com.tlabs.posweb.beans.StockIssues;
import com.tlabs.posweb.beans.StockRequestSummaryResponse;
import com.tlabs.posweb.beans.StockReturn;
import com.tlabs.posweb.util.Constants;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
import com.tlabs.posweb.util.RestfulServiceConnection;
//import com.tlabs.posweb.util.Utilities;

/**
 * @author Sahitya
 * Verified By : 
 * 
 * This class is used for calling all methods of Stock Issue web Service
 */
public class StockIssueService {
	
	
	@Autowired
	private Gson gson;
	@Autowired
	SessionScope sessionScope;
	private static Logger log = Logger.getLogger(StockIssueService.class);
	
	/**
	 * @author Sahitya
	 * Verified By : 
	 * 
	 * @param customerId,emailid,issue details along with their item details
	 * 
     * This method is used to create issue related response data which contains issue details along  
     *  item details from controller to webservice 
     * 
     * @return status
     */
	public String createStockIssue(String customerIdStr,String emailIdStr, StockIssues stockIssueObj){
		
		String resultStr=null;
		RestfulServiceConnection restfulServiceConnection = null;
		try{
			restfulServiceConnection = new RestfulServiceConnection();
			/*stockIssueObj.setGoods_Request_Ref(stockIssueObj.getRequest_Ref());*/
			/*stockIssueObj.setReceived_by(stockIssueObj.getReceived());
			stockIssueObj.setInspectedBy(stockIssueObj.getInspected());*/
			stockIssueObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
				// log.info("Request String::::"+gson.toJson(stockIssueObj));
				////System.out.println("Request String::::"+gson.toJson(stockIssueObj));
				
				if(stockIssueObj.getFlowUnder().equals("outlet"))
					resultStr = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_stock_issue"), gson.toJson(stockIssueObj));
					else{
						resultStr = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_whstock_issue"), gson.toJson(stockIssueObj));
					}
				
				//////////System.out.println("Request String::::"+gson.toJson(resultStr));
			//////System.out.println("Response String::::"+resultStr);
				
				String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(Constants.RESPONSE_SUCCESS_CODE)){
					resultStr =  AppProperties.getAppMessageByProperty("STOCK_ISSUE_CREATE_SUCCESS").trim();
				}else{
					resultStr = Response.getResponseMessage(resultStr);
				}
				
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		}
		return resultStr;
	}
	
	
	/**
	 * @author Sahitya
	 * Verified By : 
	 * 
	 * @param customerId,emailid,issueLocation,issue status
	 * 
     * This method is used to receive issue related response data which contains stock issue details along with item details 
     *    from webservice to controller
     * 
     * @return list of outlet-wise stock receipts based on provided status
     */
	public List<StockIssues> getStockIssuesByLocation(String searchNameStr,String customerIdStr,String emailIdStr,String fromlocation,String operationStr,String index,String startDateStr,String endDateStr,String maxRecords,String flowUnder,String zone,String skuId,String warehouse,String locationListAll){
		String resultStr=null;
		RestfulServiceConnection restfulServiceConnection = null;
		List<StockIssues> stockIssueDetailsList = null;
		RequestBean beanObj = null;
			
		try{
			restfulServiceConnection = new RestfulServiceConnection();
			beanObj = new RequestBean();
			beanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			beanObj.setStartIndex(index);
			beanObj.setEndDate(endDateStr);
			beanObj.setSearchCriteria(searchNameStr);
			beanObj.setStartDate(startDateStr);
			beanObj.setMaxRecords(maxRecords);
			beanObj.setZoneId(zone);
			beanObj.setSaveFlag(true);
			if(!operationStr.equals("all"))
				beanObj.setStatus(operationStr);
			if(flowUnder.equals("outlet")){
				
				if(fromlocation.equals("all") || fromlocation.equals(""))
				{
				List<String> myList = new ArrayList<String>(Arrays.asList(locationListAll.split(",")));
				beanObj.setLocationsList(myList);	
				}
				else
				beanObj.setShipped_from(fromlocation);
				beanObj.setOutletAll(true);
			}
			else{
				beanObj.setOutletLocation(fromlocation);
				beanObj.setShipped_from(warehouse);
				beanObj.setWarehouseAll(true);
				beanObj.setSkuId(skuId);
			}
				
			// log.info("Request String:::"+gson.toJson(beanObj));
		//System.out.println("Request String:::"+gson.toJson(beanObj));
			if(flowUnder.equals("outlet"))
			resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_stock_issues"), gson.toJson(beanObj), "GET");
			else{
				resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_whstock_issues"), gson.toJson(beanObj), "GET");
			}
			// log.info("Response String:::"+resultStr);
		//	System.out.println("Response String:::"+resultStr);
			beanObj = gson.fromJson(resultStr,RequestBean.class); 
			
			if(beanObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				stockIssueDetailsList = beanObj.getIssueIds();
				stockIssueDetailsList.get(0).setTotalRecords(beanObj.getTotalRecords());
				stockIssueDetailsList.get(0).setPickListURL(beanObj.getPickListURL());
				int slNo = Integer.parseInt(index);
				for(StockIssues stockIssueDetails : stockIssueDetailsList){
					stockIssueDetails.setSlNo(++slNo);
				}
				
			}
			
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		}
		/*if(operationStr.equals("draft"))
			return stockIssueDraftsList;
		else
			return stockIssueAllList;*/
		return stockIssueDetailsList;
	}

	
	/**
	 * @author Sahitya
	 * Verified By : 
	 * 
	 * @param customerId,emailid,goods_issue_ref_num
	 * 
     * This method is used to receive issue related response data which contains stock issue details along with item details 
     *    from webservice to controller
     * 
     * @return  outlet-wise stock issues based on provided goods_issue_ref_num
     */
	
	public StockIssueBean getStockIssue(String customerIdStr,String emailIdStr,String goods_issue_ref_num,String flowUnder){
		String resultStr=null;
		RestfulServiceConnection restfulServiceConnection = null;
		StockIssueBean stockIssueDetailsObj = null;
		RequestBean beanObj=null;
		GetStockIssueResponse stockIssueResponseObj = null;	
		try{
			restfulServiceConnection = new RestfulServiceConnection();
			stockIssueDetailsObj = new StockIssueBean();
			stockIssueResponseObj = new GetStockIssueResponse();
			beanObj = new RequestBean();
			beanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			beanObj.setGoods_issue_ref_num(goods_issue_ref_num);
			////////System.out.println(gson.toJson(beanObj));
			if(flowUnder.equals("outlet"))
				resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_stock_issue"), gson.toJson(beanObj), "GET");
				else{
					if(goods_issue_ref_num.contains("SSIID"))
						resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_stock_issue"), gson.toJson(beanObj), "GET");
					else
					resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_whstock_issue"), gson.toJson(beanObj), "GET");
				}
			
			
		//////System.out.println("Response  get_whstock_issue String:::"+resultStr);
		
			stockIssueResponseObj = gson.fromJson(resultStr,GetStockIssueResponse.class); 
			if(stockIssueResponseObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				stockIssueResponseObj = gson.fromJson(resultStr,GetStockIssueResponse.class); 
				if(flowUnder.equals("warehouse")){
					stockIssueDetailsObj = stockIssueResponseObj.getWarehouse_issueDetails();
					stockIssueDetailsObj.setItemDetails(stockIssueResponseObj.getItemDetails());
					stockIssueDetailsObj.setRequestId(stockIssueDetailsObj.getGoods_Request_Ref());
					stockIssueDetailsObj.setInspected_by(stockIssueDetailsObj.getInspectedBy());
					stockIssueDetailsObj.setReceivedBy(stockIssueDetailsObj.getReceived_by());
					stockIssueResponseObj.setIssueDetails(stockIssueResponseObj.getWarehouse_issueDetails());
				}
				else if(goods_issue_ref_num.contains("WHSIID")){
					stockIssueDetailsObj = stockIssueResponseObj.getWarehouse_issueDetails();
					stockIssueDetailsObj.setItemDetails(stockIssueResponseObj.getItemDetails());
					stockIssueDetailsObj.setRequestId(stockIssueDetailsObj.getGoods_Request_Ref());
					stockIssueDetailsObj.setInspected_by(stockIssueDetailsObj.getInspectedBy());
					stockIssueDetailsObj.setReceivedBy(stockIssueDetailsObj.getReceived_by());
					stockIssueResponseObj.setIssueDetails(stockIssueResponseObj.getWarehouse_issueDetails());
				}
				
				
				stockIssueDetailsObj = stockIssueResponseObj.getIssueDetails();
				stockIssueDetailsObj.setItemDetails(stockIssueResponseObj.getItemDetails());
				/*stockIssueDetailsObj = stockIssueResponseObj.getIssueDetails();
				stockIssueDetailsObj.setItemDetails(stockIssueResponseObj.getItemDetails());
				stockIssueDetailsObj.setRequestId(stockIssueDetailsObj.getGoods_Request_Ref());
				stockIssueDetailsObj.setInspected_by(stockIssueDetailsObj.getInspectedBy());
				stockIssueDetailsObj.setReceivedBy(stockIssueDetailsObj.getReceived_by());*/
			//	////////////System.out.println("Response String:::"+resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		}
		return stockIssueDetailsObj;
	}

	/**
	 * @author Sahitya
	 * Verified By : 
	 * 
	 * @param customerId,emailid,stock issue details along with their item details
	 * 
     * This method is used to create issue related response data which contains issue details along  
     *  item details from controller to webservice 
     * 
     * @return status
     */
	public String updateStockIssue(String customerIdStr,String emailIdStr,StockIssues stockissueobj){
		
		String resultStr=null;
		RestfulServiceConnection restfulServiceConnection = null;
		
		try{
			/*stockissueobj.setGoods_Request_Ref(stockissueobj.getIndentId());
			stockissueobj.setReceived_by(stockissueobj.getReceived());
			stockissueobj.setInspectedBy(stockissueobj.getInspected());*/
			restfulServiceConnection = new RestfulServiceConnection();
			/*itemDetailsStr = Response.getResponseList(itemDetailsStr, "itemDetails");
			receiptItemsArray = new JSONArray(itemDetailsStr);
			issueItemDetailsList = new ArrayList<StockIssueDetails>(receiptItemsArray.length());			
				for(int i=0;i<receiptItemsArray.length();i++){
					stockIssueDetailsObj = gson.fromJson(receiptItemsArray.getString(i), StockIssueDetails.class);
					issueItemDetailsList.add(stockIssueDetailsObj);
				}*/
				
				stockissueobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				// log.info("Request String::::"+gson.toJson(stockissueobj));
				////////System.out.println("Request String::::"+gson.toJson(stockissueobj));
				if(stockissueobj.getFlowUnder().equals("outlet"))
					resultStr = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_stock_issue"), gson.toJson(stockissueobj));
					else{
						resultStr = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_whstock_issue"), gson.toJson(stockissueobj));
					}
				
				
				//////////System.out.println("Request String::::"+resultStr);
				// log.info("Response String::::"+resultStr);
				
				String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(Constants.RESPONSE_SUCCESS_CODE)){
					resultStr = AppProperties.getAppMessageByProperty("STOCK_ISSUE_UPDATE_SUCCESS").trim();
				}else{
					resultStr = Response.getResponseMessage(resultStr);
				}
				
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		}
		return resultStr;
	}
	
	/**
	 * @author Sahitya
	 * Verified By : 
	 * 
	 * @param customerId,emailid,issueLocation,issue status
	 * 
     * This method is used to receive issue related response data which contains stock issue details along with item details 
     *    from webservice to controller
     * 
     * @return list of outlet-wise stock receipts based on provided status
     */
	public List<StockIssues> getWarehouseStockIssuesByLocation(String customerIdStr,String emailIdStr,String fromlocation,String operationStr){
		String resultStr=null,statusStr=null;
		WHStockIssuesProxy whStockIssuesProxyObj = null;
		List<StockIssues> stockIssueDetailsList = null,stockIssueDraftsList=null,stockIssueAllList=null;
		RequestBean beanObj = null;
			
		try{
			whStockIssuesProxyObj = new WHStockIssuesProxy();
			stockIssueDetailsList = new ArrayList<StockIssues>();
			stockIssueDraftsList = new ArrayList<StockIssues>();
			stockIssueAllList = new ArrayList<StockIssues>();
			beanObj = new RequestBean();
			beanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			beanObj.setShipped_from(fromlocation);
			beanObj.setStartIndex(Constants.PAGINATION_START_INDEX);
			
			// log.info("Request String:::"+gson.toJson(beanObj));
			
			resultStr = whStockIssuesProxyObj.getStockIssues(gson.toJson(beanObj));
			
			// log.info("Response String:::"+resultStr);
			
			beanObj = gson.fromJson(resultStr,RequestBean.class); 
			
			if(beanObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				stockIssueDetailsList = beanObj.getIssueIds();
				for(int i=0;i<stockIssueDetailsList.size();i++){
					statusStr = stockIssueDetailsList.get(i).getStatus();
					if(operationStr.equalsIgnoreCase("draft") && statusStr.equalsIgnoreCase("draft"))
						stockIssueDraftsList.add(stockIssueDetailsList.get(i));
					else if(!statusStr.equalsIgnoreCase("draft"))
						stockIssueAllList.add(stockIssueDetailsList.get(i));
				}
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
		}catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		}
		if(operationStr.equals("draft"))
			return stockIssueDraftsList;
		else
			return stockIssueAllList;
	}

	/**
	 * @author Sahitya
	 * Verified By : 
	 * 
	 * @param customerId,emailid,goods_issue_ref_num
	 * 
     * This method is used to receive issue related response data which contains stock issue details along with item details 
     *    from webservice to controller
     * 
     * @return  outlet-wise stock issues based on provided goods_issue_ref_num
     */
	public StockIssueBean getWarehouseStockIssue(String customerIdStr,String emailIdStr,String goods_issue_ref_num){
		String resultStr=null;
		WHStockIssuesProxy whStockIssuesProxyObj = null;
		StockIssueBean stockIssueDetailsObj = null;
		RequestBean beanObj=null;
		GetStockIssueResponse stockIssueResponseObj = null;	
		try{
			whStockIssuesProxyObj = new WHStockIssuesProxy();
			stockIssueDetailsObj = new StockIssueBean();
			stockIssueResponseObj = new GetStockIssueResponse();
			beanObj = new RequestBean();
			beanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			beanObj.setGoods_issue_ref_num(goods_issue_ref_num);
			
			// log.info("Request String:::"+gson.toJson(beanObj));
			
			resultStr = whStockIssuesProxyObj.getStockIssue(gson.toJson(beanObj));
			
			// log.info("Response String:::"+resultStr);
			
			stockIssueResponseObj = gson.fromJson(resultStr,GetStockIssueResponse.class); 
			
			if(stockIssueResponseObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				stockIssueDetailsObj = stockIssueResponseObj.getWarehouse_issueDetails();
				stockIssueDetailsObj.setItemDetails(stockIssueResponseObj.getItemDetails());
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
		}catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		}
		return stockIssueDetailsObj;
	}
	
	/**
	 * @author Sahitya
	 * Verified By : 
	 * 
	 * @param customerId,emailid,issue details along with their item details
	 * 
     * This method is used to create issue related response data which contains issue details along  
     *  item details from controller to webservice 
     * 
     * @return status
     */
	public String createWarehouseStockIssue(String customerIdStr,String emailIdStr, String shippedFromStr, String shippedToStr,String dateStr,String deliveredByStr,
		   String inspectedByStr, String receivedByStr, String statusStr, String itemDetailsStr,String totalQtyStr,String totalCostStr,String remarksStr){
		
		String resultStr=null;
		WHStockIssuesProxy whStockIssuesProxyObj = null;
		JSONArray receiptItemsArray = null;
		StockIssueDetails stockIssueDetailsObj = null;
		List<StockIssueDetails> issueItemDetailsList = null;
		StockIssue stockIssueObj = null;
		try{
			whStockIssuesProxyObj = new WHStockIssuesProxy();
			itemDetailsStr = Response.getResponseList(itemDetailsStr, "itemDetails");
			receiptItemsArray = new JSONArray(itemDetailsStr);
			issueItemDetailsList = new ArrayList<StockIssueDetails>(receiptItemsArray.length());			
				for(int i=0;i<receiptItemsArray.length();i++){
					stockIssueDetailsObj = gson.fromJson(receiptItemsArray.getString(i), StockIssueDetails.class);
					issueItemDetailsList.add(stockIssueDetailsObj);
				}
				stockIssueObj = new StockIssue();
				stockIssueObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				stockIssueObj.setReciptDetails(issueItemDetailsList);
				stockIssueObj.setShipped_from(shippedFromStr);
				stockIssueObj.setIssue_to(shippedToStr);
				stockIssueObj.setGrand_total(Float.parseFloat(totalCostStr));
				stockIssueObj.setSub_total(Float.parseFloat(totalCostStr));
				stockIssueObj.setIssue_total(Float.parseFloat(totalCostStr));
				stockIssueObj.setIssue_total_qty(Integer.parseInt(totalQtyStr));
				stockIssueObj.setStatus(statusStr);
				stockIssueObj.setDelivered_by(deliveredByStr);
				stockIssueObj.setInspectedBy(inspectedByStr);
				stockIssueObj.setReceived_by(receivedByStr);
				stockIssueObj.setDeliveryDate(dateStr);
				stockIssueObj.setRemarks(remarksStr);
				
				// log.info("Request String::::"+gson.toJson(stockIssueObj));
				
				resultStr = whStockIssuesProxyObj.createStockIssue(gson.toJson(stockIssueObj));
				
				// log.info("Response String::::"+resultStr);
				
				String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(Constants.RESPONSE_SUCCESS_CODE)){
					resultStr = AppProperties.getAppMessageByProperty("STOCK_ISSUE_CREATE_SUCCESS").trim();
				}else{
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
		}catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		}
		return resultStr;
	}
	
	/**
	 * @author Sahitya
	 * Verified By : 
	 * 
	 * @param customerId,emailid,stock issue details along with their item details
	 * 
     * This method is used to create issue related response data which contains issue details along  
     *  item details from controller to webservice 
     * 
     * @return status
     */
	public String updateWarehouseStockIssue(String customerIdStr,String emailIdStr, String shippedFromStr, String shippedToStr,String dateStr,String deliveredByStr,
		   String inspectedByStr, String receivedByStr, String statusStr, String itemDetailsStr,String totalQtyStr,String totalCostStr,String remarksStr,
		   String issue_ref_numStr,String id_goods_issueStr){
		
		String resultStr=null;
		WHStockIssuesProxy whStockIssuesProxyObj = null;
		JSONArray receiptItemsArray = null;
		StockIssueDetails stockIssueDetailsObj = null;
		List<StockIssueDetails> issueItemDetailsList = null;
		StockIssue stockIssueObj = null;
		try{
			whStockIssuesProxyObj = new WHStockIssuesProxy();
			itemDetailsStr = Response.getResponseList(itemDetailsStr, "itemDetails");
			receiptItemsArray = new JSONArray(itemDetailsStr);
			issueItemDetailsList = new ArrayList<StockIssueDetails>(receiptItemsArray.length());			
				for(int i=0;i<receiptItemsArray.length();i++){
					stockIssueDetailsObj = gson.fromJson(receiptItemsArray.getString(i), StockIssueDetails.class);
					issueItemDetailsList.add(stockIssueDetailsObj);
				}
				stockIssueObj = new StockIssue();
				stockIssueObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				stockIssueObj.setReciptDetails(issueItemDetailsList);
				stockIssueObj.setShipped_from(shippedFromStr);
				stockIssueObj.setIssue_to(shippedToStr);
				stockIssueObj.setGrand_total(Float.parseFloat(totalCostStr));
				stockIssueObj.setSub_total(Float.parseFloat(totalCostStr));
				stockIssueObj.setIssue_total(Float.parseFloat(totalCostStr));
				stockIssueObj.setIssue_total_qty(Integer.parseInt(totalQtyStr));
				stockIssueObj.setStatus(statusStr);
				stockIssueObj.setDelivered_by(deliveredByStr);
				stockIssueObj.setInspectedBy(inspectedByStr);
				stockIssueObj.setReceived_by(receivedByStr);
				stockIssueObj.setDeliveryDate(dateStr);
				stockIssueObj.setRemarks(remarksStr);
				stockIssueObj.setId_goods_issue(Integer.parseInt(id_goods_issueStr));
				stockIssueObj.setGoods_issue_ref_num(issue_ref_numStr);
				
				// log.info("Request String::::"+gson.toJson(stockIssueObj));
				
				resultStr = whStockIssuesProxyObj.updateStockIssue(gson.toJson(stockIssueObj));
				
				// log.info("Response String::::"+resultStr);
				
				String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(Constants.RESPONSE_SUCCESS_CODE)){
					resultStr = AppProperties.getAppMessageByProperty("STOCK_ISSUE_UPDATE_SUCCESS").trim();
				}else{
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
		}catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		}
		return resultStr;
	}

	public List<String> getStockIssueIds(String customerIdStr,String emailIdStr,String issueToLocation,String searchNameStr,String locationTye){
		String resultStr=null;
		List<String> issueIds = new ArrayList<String>();
		RequestBean beanObj = null;
		RestfulServiceConnection restfulServiceConnection = null;
		try{
			restfulServiceConnection = new RestfulServiceConnection();
			
			beanObj = new RequestBean();
			beanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			beanObj.setFromStoreCode(issueToLocation);
			beanObj.setSearchCriteria(searchNameStr);
			beanObj.setStartIndex("0");
			if(locationTye.equals("Retail Outlet"))
			beanObj.setGoods_issue_ref_num(searchNameStr);
			// log.info("Request String:::"+gson.toJson(beanObj));
			//////System.out.println("Request String:::"+gson.toJson(beanObj));
			if(locationTye.equals("Retail Outlet"))
			resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_stock_issue_ids"), gson.toJson(beanObj), "GET");
			else
				resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_whstock_issue_ids"), gson.toJson(beanObj), "GET");
			// log.info("Response String:::"+resultStr);
			
			StockIssues stockIssuesObj = gson.fromJson(resultStr,StockIssues.class); 
			
			if(stockIssuesObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				if(locationTye.equals("Retail Outlet"))
				issueIds = stockIssuesObj.getIssueIds();
				else
					issueIds = stockIssuesObj.getIssueRefList();	
			}
			
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		}
		/*if(operationStr.equals("draft"))
			return stockIssueDraftsList;
		else
			return stockIssueAllList;*/
		return issueIds;
	}
	
	
	public String createStockReturn(StockReturn stockReturnObj,String customerIdStr,String emailIdStr){
			String resultStr=null;
			RestfulServiceConnection restfulServiceConnection = null;
			try{	
					restfulServiceConnection = new RestfulServiceConnection();
					stockReturnObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
					// log.info("Request String::::"+gson.toJson(stockReturnObj));
					resultStr = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_stock_return"), gson.toJson(stockReturnObj));
					// log.info("Response String::::"+resultStr);
					
					String responseCode = Response.getResponseCode(resultStr);
					if(responseCode.equals(Constants.RESPONSE_SUCCESS_CODE)){
						resultStr =  AppProperties.getAppMessageByProperty("STOCK_RETURN_CREATE_SUCCESS").trim();
					}else{
						resultStr = Response.getResponseMessage(resultStr);
					}
					
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
			}
			return resultStr;
		}
	
	public List<StockReturn> getStockReturn(String customerIdStr,String emailIdStr,String fromLocation,String searchCriteria,String returnNoteRef ,String index,String startDate,String endDate,String maxRecords,String flowUnder){
		String resultStr=null;
		List<StockReturn> stockReturnList = null;
		RestfulServiceConnection restfulServiceConnection = null;
		try{
			restfulServiceConnection = new RestfulServiceConnection();
			StockReturn stockReturnObj = new StockReturn();
			stockReturnObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			stockReturnObj.setStartIndex(index);
			stockReturnObj.setSearchCriteria(searchCriteria);
			stockReturnObj.setReturnNoteRef(returnNoteRef );
			stockReturnObj.setStartDate(startDate);
			stockReturnObj.setEndDate(endDate);
			stockReturnObj.setMaxRecords(maxRecords);
			
			stockReturnObj.setFromLocation(fromLocation);
			stockReturnObj.setWarehouseAll(true);
			
			//////System.out.println("Request String:::"+gson.toJson(stockReturnObj));
			resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_stock_return"), gson.toJson(stockReturnObj), "GET");
			//////System.out.println("Response String:::"+resultStr);
			
			stockReturnObj = gson.fromJson(resultStr,StockReturn.class); 
			
			if(stockReturnObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				stockReturnList = stockReturnObj.getStockReturnsList();
				if(stockReturnList != null && stockReturnList.size() > 0){
					
					stockReturnList.get(0).setTotalRecords(stockReturnObj.getTotalRecords());
					int slNo = Integer.parseInt(index);
					for(StockReturn stockReturn : stockReturnList)
						stockReturn.setSlNo(++slNo);
				}
			}
			
		}catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		}
		return stockReturnList;
	}

	public String updateStockReturn(StockReturn stockReturnObj,String customerIdStr,String emailIdStr){
		String resultStr=null;
		RestfulServiceConnection restfulServiceConnection= null;
		try{
				restfulServiceConnection = new RestfulServiceConnection();
				stockReturnObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				// log.info("Request String::::"+gson.toJson(stockReturnObj));
				
				resultStr = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_stock_return"), gson.toJson(stockReturnObj));
				// log.info("Response String::::"+resultStr);
				
				String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(Constants.RESPONSE_SUCCESS_CODE)){
					resultStr =  AppProperties.getAppMessageByProperty("STOCK_RETURN_UPDATE_SUCCESS").trim();
				}else{
					resultStr = Response.getResponseMessage(resultStr);
				}
				
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		}
		return resultStr;
	}
	
	public StockRequestSummaryResponse issueToOutlets(String flowUnder,Boolean flag,String ids){
		String resultStr=null;
		StockRequestSummaryResponse stockRequestObj =null;
		RequestBean beanObj = null;
		RestfulServiceConnection restfulConnectionObj =null;
		try{
			/*stockRequestsProxyOnj = new StockRequestsProxy();*/
			String[] idsArray = ids.split(",");
			restfulConnectionObj = new RestfulServiceConnection();
			 stockRequestObj = new StockRequestSummaryResponse();
			beanObj = new RequestBean();
			beanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			beanObj.setStartIndex("0");
			List<String> featureIds = new ArrayList<String>();
			for(int i=0;i<idsArray.length;i++)
			{ if(idsArray[i].trim()!="")
				featureIds.add(idsArray[i]);
			}
				
			if(featureIds.size()>0)
			beanObj.setRequestIds(featureIds);
			beanObj.setIssueAndClose(flag);
			beanObj.setWareHouseLocation(flowUnder);
			beanObj.setLocation(flowUnder);
			// log.info("Request String:::"+gson.toJson(beanObj));
			/*resultStr = stockRequestsProxyOnj.getStockRequests(gson.toJson(beanObj));*/
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("issue_to_outlets"), gson.toJson(beanObj), "GET");
			// log.info("Response String:::"+resultStr);
			stockRequestObj = gson.fromJson(resultStr,StockRequestSummaryResponse.class); 
			stockRequestObj.setResponseMessage(Response.getResponseMessage(resultStr));	
		
			if(Response.getResponseCode(resultStr).equals(Constants.RESPONSE_SUCCESS_CODE)){
				stockRequestObj = gson.fromJson(resultStr,StockRequestSummaryResponse.class); 
				stockRequestObj.setResponseMessage(Response.getResponseMessage(resultStr));	
			}
			
			
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		}
		return stockRequestObj;
	}

	

	public List<String> getStockReturnIds(String customerIdStr,String emailIdStr,String issueToLocation,String searchNameStr,String locationTye){
		String resultStr=null;
		List<String> returnids = new ArrayList<String>();
		StockReturn beanObj = null;
		RestfulServiceConnection restfulServiceConnection = null;
		try{
			restfulServiceConnection = new RestfulServiceConnection();
			
			beanObj = new StockReturn();
			beanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			beanObj.setFromLocation(issueToLocation);
			beanObj.setSearchCriteria(searchNameStr);
			////////System.out.println(gson.toJson(beanObj));
				resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_stock_return_ids"), gson.toJson(beanObj), "GET");
			////////System.out.println(resultStr);
				StockReturn stockReturnObj = gson.fromJson(resultStr,StockReturn.class); 
			
			if(stockReturnObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				
				returnids = stockReturnObj.getReturnIdList();	
			}
			
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		}
		/*if(operationStr.equals("draft"))
			return stockIssueDraftsList;
		else
			return stockIssueAllList;*/
		return returnids;
	}
	

}
	
