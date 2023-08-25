
/*******************************************************************************
 * Copyright  2015 Omni Retailer Customer Console, All rights reserved.
 * Author : Sahitya P
 * Created On : 1-4-2015
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
import com.technolabssoftware.www.WHStockReceiptsProxy;
import com.tlabs.posweb.beans.RequestBean;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.beans.StockReciept;
import com.tlabs.posweb.beans.StockRecieptDetails;
import com.tlabs.posweb.beans.StockRequestSummaryResponse;
import com.tlabs.posweb.beans.StockRequests;
import com.tlabs.posweb.util.Constants;
import com.tlabs.posweb.util.DateUtil;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
import com.tlabs.posweb.util.RestfulServiceConnection;
//import com.tlabs.posweb.util.Utilities;


/**
 * @author Sahitya
 * Verified By : 
 * 
 * This class is used for calling all methods of Stock Receipt web Service
 */
public class StockReceiptService {
	
	
	@Autowired
	private Gson gson;
	@Autowired
	SessionScope sessionScope;
	private static Logger log = Logger.getLogger(StockReceiptService.class);
	
	
	/**
	 * @author Sahitya
	 * Verified By : 
	 * 
	 * @param customerId,emailid,rceipt details along with their item details
	 * 
     * This method is used to create receipt related response data which contains receipt details along  
     *  item details from controller to webservice 
     * modified by chaithanya
     * @return status
     */
	public String createStockReciept(String customerIdStr,String emailIdStr,StockReciept stockReceiptObj){
		String resultStr=null;
		RestfulServiceConnection restfulServiceConnection = null;
		//WHStockReceiptsProxy whStockReceiptsProxyObj = new WHStockReceiptsProxy();
		try{
			restfulServiceConnection = new RestfulServiceConnection();
				stockReceiptObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				// log.info("Request String::::"+gson.toJson(stockReceiptObj));
				
				//System.out.println("Request String::::"+gson.toJson(stockReceiptObj));
				if(stockReceiptObj.getFlowUnder().equals("outlet"))
				resultStr = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_stock_receipt"), gson.toJson(stockReceiptObj));
				else
				resultStr = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_whstock_receipt"), gson.toJson(stockReceiptObj));

					/*resultStr = whStockReceiptsProxyObj.createStockReciept(gson.toJson(stockReceiptObj));
				// log.info("Response String::::"+resultStr);*/
				String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(Constants.RESPONSE_SUCCESS_CODE)){
					resultStr = AppProperties.getAppMessageByProperty("STOCK_RECEIPT_CREATE_SUCCESS").trim();
				}else{
					resultStr = Response.getResponseMessage(resultStr);
				}
				
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
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
	 * @param customerId,emailid,receiptLocation,receipt status
	 * 
     * This method is used to receive receipt related response data which contains stock receipt details along with item details 
     *    from webservice to controller
     * 
     * @return list of outlet-wise stock receipts based on provided status
     */
	public List<StockReciept> getStockReceiptsByLocation(String searchNameStr,String customerIdStr,String emailIdStr,String receiptLocation,String operationStr,String index,String startDateStr,String endDateStr,String maxRecords,String flowUnder,String locationListAll){
		String resultStr=null;
		RestfulServiceConnection restfulServiceConnection = null;
		List<StockReciept> stockReceiptDetailsList = null;
		
		RequestBean beanObj = null;
			
		try{
			//WHStockReceiptsProxy whstockReceipt = new WHStockReceiptsProxy();
			restfulServiceConnection = new RestfulServiceConnection();
			beanObj = new RequestBean();
			beanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			if(receiptLocation.equals("all") || receiptLocation.equals(""))
			{
			List<String> myList = new ArrayList<String>(Arrays.asList(locationListAll.split(",")));
			beanObj.setLocationsList(myList);	
			}
			else
			beanObj.setReceipt_location(receiptLocation);
			beanObj.setSearchCriteria(searchNameStr);
			beanObj.setStartDate(startDateStr);
			beanObj.setEndDate(endDateStr);
			beanObj.setStartDateStr(startDateStr);
			beanObj.setEndDateStr(endDateStr);
			
			beanObj.setMaxRecords(maxRecords);
			beanObj.setStartIndex(index);
			if(flowUnder.equals("outlet"))
				beanObj.setOutletAll(true);
			else{
				beanObj.setWarehouseAll(true);
				beanObj.setStart(index);
				beanObj.setLocation(receiptLocation);
			}
				
			if(!operationStr.equals("all"))
				beanObj.setStatus(operationStr);
			//// log.info("Request String:::"+gson.toJson(beanObj));
			
	     //////System.out.println("Request String:::"+gson.toJson(beanObj));
			if(flowUnder.equalsIgnoreCase("outlet"))
			resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_stock_receipts"), gson.toJson(beanObj), "GET");
			else
			resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_whstock_receipts"), gson.toJson(beanObj), "GET");
			
				
			//resultStr = whstockReceipt.getStockReceipts(gson.toJson(beanObj));
		
         ////System.out.println("Response String:::"+resultStr);
			//// log.info("Response String:::"+resultStr);
			
			beanObj = gson.fromJson(resultStr,RequestBean.class); 
			
			if(beanObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				stockReceiptDetailsList = beanObj.getReceipts();
				if(flowUnder.equalsIgnoreCase("outlet"))
				stockReceiptDetailsList.get(0).setTotalRecords(beanObj.getTotalReceipts());
				else
					stockReceiptDetailsList.get(0).setTotalRecords(beanObj.getTotalRecords());
				int slNo = Integer.parseInt(index);
				for(StockReciept stockReciept : stockReceiptDetailsList)
					stockReciept.setSlNo(++slNo);
		            	/*for(int i=0;i<stockReceiptDetailsList.size();i++){
					statusStr = stockReceiptDetailsList.get(i).getStatus();
					if(operationStr.equalsIgnoreCase("draft") && statusStr.equalsIgnoreCase("draft"))
						stockReceiptDraftsList.add(stockReceiptDetailsList.get(i));
					else if(!statusStr.equalsIgnoreCase("draft"))
						stockReceiptAllList.add(stockReceiptDetailsList.get(i));
				}*/
			}
			
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		}
		/*if(operationStr.equals("draft"))
			return stockReceiptDraftsList;
		else
			return stockReceiptAllList;*/
		return stockReceiptDetailsList;
	}

	
	/**
	 * @author Sahitya
	 * Verified By : 
	 * 
	 * @param customerId,emailid,goods_receipt_ref_num
	 * 
     * This method is used to receive receipt related response data which contains stock receipt details along with item details 
     *    from webservice to controller
     * 
     * @return  outlet-wise stock receipts based on provided goods_receipt_ref_num
     */
	public StockReciept getStockReceipt(String customerIdStr,String emailIdStr,String goods_receipt_ref_num,String flowUnder){
		String resultStr=null;
		StockReciept stockReceiptDetailsObj = null;
		RequestBean beanObj = null;
		//WHStockReceiptsProxy whstockReceipt = new WHStockReceiptsProxy();

			RestfulServiceConnection restfulServiceConnection = null;
		try{
			restfulServiceConnection = new RestfulServiceConnection();
			stockReceiptDetailsObj = new StockReciept();
			beanObj = new RequestBean();
			beanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			beanObj.setGoods_receipt_ref_num(goods_receipt_ref_num);
			
			//System.out.println("Request String:::"+gson.toJson(beanObj));
			
			/*resultStr = stockReceiptProxyObj.getStockReceipt(gson.toJson(beanObj));*/
			if(flowUnder.equalsIgnoreCase("outlet"))
				resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_stock_receipt"), gson.toJson(beanObj), "GET");
				else
					resultStr =  restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_whstock_receipt"), gson.toJson(beanObj), "GET");

					
					//resultStr = whstockReceipt.getStockReceipt(gson.toJson(beanObj));

			
			beanObj = gson.fromJson(resultStr,RequestBean.class); 
			//System.out.println("response String:::"+resultStr);
			if(beanObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				if(flowUnder.equalsIgnoreCase("outlet"))
					stockReceiptDetailsObj = beanObj.getReceipt();
					else
					{
						stockReceiptDetailsObj = beanObj.getWarehouse_receipt();
					String deliveryDate = stockReceiptDetailsObj.getCreatedDateStr();
					stockReceiptDetailsObj.setCreatedDateStr(deliveryDate);
					//stockReceip(beanObj.getTotalReceipts());
					//stockReceiptDetailsObj.setTotalReceipts(beanObj.getTotalReceipts());
					}
				 	stockReceiptDetailsObj.setInspectedBy(stockReceiptDetailsObj.getInspectedBy());
					stockReceiptDetailsObj.setReceived_by(stockReceiptDetailsObj.getReceived_by());
					stockReceiptDetailsObj.setReciptDetails(beanObj.getItemDetails());
					stockReceiptDetailsObj.setRequestId(stockReceiptDetailsObj.getGoods_Request_Ref());

			}
			
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		}
		return stockReceiptDetailsObj;
	}

	/**
	 * @author Sahitya
	 * Verified By : 
	 * 
	 * @param customerId,emailid,rceipt details along with their item details
	 * 
     * This method is used to update receipt related response data which contains receipt details along  
     *  item details from controller to webservice 
     * 
     * @return status
     */
	public String updateStockReciept(String customerIdStr,String emailIdStr,StockReciept stockReceiptObj){
		String resultStr=null;
		RestfulServiceConnection restfulServiceConnection = null;
		try{
			restfulServiceConnection = new RestfulServiceConnection();
			//WHStockReceiptsProxy whstockReceipt = new WHStockReceiptsProxy();
				stockReceiptObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				//////System.out.println("Request String::::"+gson.toJson(stockReceiptObj));
				/*resultStr = stockReceiptProxyObj.updateStockReciept(gson.toJson(stockReceiptObj));*/
				if(stockReceiptObj.getFlowUnder().equalsIgnoreCase("outlet"))
					resultStr = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_stock_receipt"), gson.toJson(stockReceiptObj));
					else
						resultStr = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_whstock_receipts"), gson.toJson(stockReceiptObj));

				
				//////System.out.println(resultStr);
					/*resultStr = whstockReceipt.updateStockReciept(gson.toJson(stockReceiptObj));
					// log.info("Response String::::"+resultStr);*/
				String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(Constants.RESPONSE_SUCCESS_CODE)){
					resultStr = AppProperties.getAppMessageByProperty("STOCK_RECEIPT_UPDATE_SUCCESS").trim();
				}else{
					resultStr = Response.getResponseMessage(resultStr);
				}
				
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
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
	 * @param customerId,emailid,receiptLocation,receipt status
	 * 
     * This method is used to receive receipt related response data which contains stock receipt details along with item details 
     *    from webservice to controller
     * 
     * @return list of outlet-wise stock receipts based on provided status
     */
	public List<StockReciept> getWarehouseStockReceiptsByLocation(String customerIdStr,String emailIdStr,String receiptLocation,String operationStr){
		String resultStr=null,statusStr=null;
		WHStockReceiptsProxy whStockReceiptsProxyObj = null;
		List<StockReciept> stockReceiptDetailsList = null,stockReceiptDraftsList=null,stockReceiptAllList=null;
		RequestBean beanObj = null;
			
		try{
			//whStockReceiptsProxyObj = new WHStockReceiptsProxy();
			stockReceiptDetailsList = new ArrayList<StockReciept>();
			stockReceiptDraftsList = new ArrayList<StockReciept>();
			stockReceiptAllList = new ArrayList<StockReciept>();
			beanObj = new RequestBean();
			beanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			beanObj.setReceipt_location(receiptLocation);
			beanObj.setStartIndex(Constants.PAGINATION_START_INDEX);
			
			/*// log.info("Request String:::"+gson.toJson(beanObj));		
			resultStr = whStockReceiptsProxyObj.getStockReceipts(gson.toJson(beanObj));
			// log.info("Response String:::"+resultStr);*/
			resultStr = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("get_whstock_receipts"), gson.toJson(beanObj),"GET");

			beanObj = gson.fromJson(resultStr,RequestBean.class); 
			
			if(beanObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				stockReceiptDetailsList = beanObj.getReceipts();
				for(int i=0;i<stockReceiptDetailsList.size();i++){
					statusStr = stockReceiptDetailsList.get(i).getStatus();
					if(operationStr.equalsIgnoreCase("draft") && statusStr.equalsIgnoreCase("draft"))
						stockReceiptDraftsList.add(stockReceiptDetailsList.get(i));
					else if(!statusStr.equalsIgnoreCase("draft"))
						stockReceiptAllList.add(stockReceiptDetailsList.get(i));
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
		if(operationStr.equals("Draft"))
			return stockReceiptDraftsList;
		else
			return stockReceiptAllList;
	}
	
	/**
	 * @author Sahitya
	 * Verified By : 
	 * 
	 * @param customerId,emailid,goods_receipt_ref_num
	 * 
     * This method is used to receive receipt related response data which contains stock receipt details along with item details 
     *    from webservice to controller
     * 
     * @return  outlet-wise stock receipts based on provided goods_receipt_ref_num
     */
	public StockReciept getWarehouseStockReceipt(String customerIdStr,String emailIdStr,String goods_receipt_ref_num){
		String resultStr=null;
		//WHStockReceiptsProxy whStockReceiptsProxyObj = null;
		StockReciept stockReceiptDetailsObj = null;
		RequestBean beanObj = null;
			
		try{
			//whStockReceiptsProxyObj = new WHStockReceiptsProxy();
			stockReceiptDetailsObj = new StockReciept();
			beanObj = new RequestBean();
			beanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			beanObj.setGoods_receipt_ref_num(goods_receipt_ref_num);
			
			/*// log.info("Request String:::"+gson.toJson(beanObj));	
			resultStr = whStockReceiptsProxyObj.getStockReceipt(gson.toJson(beanObj));
			// log.info("Response String:::"+resultStr);*/
			
			resultStr = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("get_whstock_receipt"), gson.toJson(beanObj), "GET");

			beanObj = gson.fromJson(resultStr,RequestBean.class); 
			
			if(beanObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				stockReceiptDetailsObj = beanObj.getWarehouse_receipt();
				stockReceiptDetailsObj.setDelivery_date(stockReceiptDetailsObj.getDelivery_date());
				stockReceiptDetailsObj.setInspectedBy(stockReceiptDetailsObj.getInspectedBy());
				stockReceiptDetailsObj.setReceived_by(stockReceiptDetailsObj.getReceived_by());
				stockReceiptDetailsObj.setReciptDetails(beanObj.getItemDetails());
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
		return stockReceiptDetailsObj;
	}
	
	/**
	 * @author Sahitya
	 * Verified By : 
	 * 
	 * @param customerId,emailid,rceipt details along with their item details
	 * 
     * This method is used to create receipt related response data which contains receipt details along  
     *  item details from controller to webservice 
     * 
     * @return status
     */
	public String createWarehouseStockReciept(String customerIdStr,String emailIdStr, String shippedFromStr, String shippedToStr,String dateStr,String deliveredByStr,
		   String inspectedByStr, String receivedByStr, String statusStr, String itemDetailsStr,String totalQtyStr,String totalCostStr,String remarksStr){
		
		String resultStr=null;
		//WHStockReceiptsProxy whStockReceiptsProxyObj = null;
		JSONArray receiptItemsArray = null;
		StockRecieptDetails stockReceiptDetailsObj = null;
		List<StockRecieptDetails> receiptItemDetailsList = null;
		StockReciept stockReceiptObj = null;
		try{
			//whStockReceiptsProxyObj = new WHStockReceiptsProxy();
			itemDetailsStr = Response.getResponseList(itemDetailsStr, "itemDetails");
			receiptItemsArray = new JSONArray(itemDetailsStr);
			receiptItemDetailsList = new ArrayList<StockRecieptDetails>(receiptItemsArray.length());			
				for(int i=0;i<receiptItemsArray.length();i++){
					stockReceiptDetailsObj = gson.fromJson(receiptItemsArray.getString(i), StockRecieptDetails.class);
					receiptItemDetailsList.add(stockReceiptDetailsObj);
				}
				stockReceiptObj = new StockReciept();
				stockReceiptObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				stockReceiptObj.setReciptDetails(receiptItemDetailsList);
				stockReceiptObj.setShipped_from(shippedFromStr);
				stockReceiptObj.setReceipt_location(shippedToStr);
			/*	stockReceiptObj.setGrand_total(totalCostStr);
				stockReceiptObj.setSub_total(totalCostStr);
				stockReceiptObj.setReceipt_total(totalCostStr);
				stockReceiptObj.setReceipt_total_qty(totalQtyStr);*/
				stockReceiptObj.setStatus(statusStr);
				stockReceiptObj.setDelivered_by(deliveredByStr);
				stockReceiptObj.setInspectedBy(inspectedByStr);
				stockReceiptObj.setReceived_by(receivedByStr);
				stockReceiptObj.setDeliveryDate(dateStr);
				stockReceiptObj.setRemarks(remarksStr);
				
				/*// log.info("Request String::::"+gson.toJson(stockReceiptObj));
				resultStr = whStockReceiptsProxyObj.createStockReciept(gson.toJson(stockReceiptObj));
				// log.info("Response String::::"+resultStr);*/
				
				resultStr = new RestfulServiceConnection().getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_whstock_receipt"), gson.toJson(stockReceiptObj));

				String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(Constants.RESPONSE_SUCCESS_CODE)){
					resultStr = AppProperties.getAppMessageByProperty("STOCK_RECEIPT_CREATE_SUCCESS").trim();
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
	 * @param customerId,emailid,rceipt details along with their item details
	 * 
     * This method is used to update receipt related response data which contains receipt details along  
     *  item details from controller to webservice 
     * 
     * @return status
     */
	public String updateWarehouseStockReciept(String customerIdStr,String emailIdStr, String shippedFromStr, String shippedToStr,String dateStr,String deliveredByStr,
		   String inspectedByStr, String receivedByStr, String statusStr, String itemDetailsStr,String totalQtyStr,String totalCostStr,String remarksStr,String receipt_ref_numStr,String id_goods_receiptStr){
		
		String resultStr=null;
		//WHStockReceiptsProxy whStockReceiptsProxyObj = null;
		JSONArray receiptItemsArray = null;
		StockRecieptDetails stockReceiptDetailsObj = null;
		List<StockRecieptDetails> receiptItemDetailsList = null;
		StockReciept stockReceiptObj = null;
		try{
			//whStockReceiptsProxyObj = new WHStockReceiptsProxy();
			itemDetailsStr = Response.getResponseList(itemDetailsStr, "itemDetails");
			receiptItemsArray = new JSONArray(itemDetailsStr);
			receiptItemDetailsList = new ArrayList<StockRecieptDetails>(receiptItemsArray.length());			
				for(int i=0;i<receiptItemsArray.length();i++){
					stockReceiptDetailsObj = gson.fromJson(receiptItemsArray.getString(i), StockRecieptDetails.class);
					receiptItemDetailsList.add(stockReceiptDetailsObj);
				}
				stockReceiptObj = new StockReciept();
				stockReceiptObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				stockReceiptObj.setReciptDetails(receiptItemDetailsList);
				stockReceiptObj.setShipped_from(shippedFromStr);
				stockReceiptObj.setReceipt_location(shippedToStr);
				/*stockReceiptObj.setGrand_total(totalCostStr);
				stockReceiptObj.setGoods_receipt_ref_num(receipt_ref_numStr);
				stockReceiptObj.setId_goods_receipt(id_goods_receiptStr);
				stockReceiptObj.setSub_total(totalCostStr);
				stockReceiptObj.setReceipt_total(totalCostStr);
				stockReceiptObj.setReceipt_total_qty(totalQtyStr);*/
				stockReceiptObj.setStatus(statusStr);
				stockReceiptObj.setDelivered_by(deliveredByStr);
				stockReceiptObj.setInspectedBy(inspectedByStr);
				stockReceiptObj.setReceived_by(receivedByStr);
				stockReceiptObj.setDeliveryDate(dateStr);
				stockReceiptObj.setRemarks(remarksStr);
				
				/*// log.info("Request String::::"+gson.toJson(stockReceiptObj));
				resultStr = whStockReceiptsProxyObj.updateStockReciept(gson.toJson(stockReceiptObj));
				// log.info("Response String::::"+resultStr);*/
				
				resultStr = new RestfulServiceConnection().getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_whstock_receipts "), gson.toJson(stockReceiptObj));

				
				String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(Constants.RESPONSE_SUCCESS_CODE)){
					resultStr = AppProperties.getAppMessageByProperty("STOCK_RECEIPT_UPDATE_SUCCESS").trim();
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
	 * @param customerId,emailid,goods_receipt_ref_num
	 * 
     * This method is used to receive receipt related response data which contains stock receipt details along with item details 
     *    from webservice to controller
     * 
     * @return  outlet-wise stock receipts based on provided goods_receipt_ref_num
     */
	public List<StockRequests> getStockRequests(String searchNameStr,String customerIdStr,String emailIdStr,String index,String stockRequestId,boolean search,String locationStr,String startDate,String endDate,String maxRecords,String flowUnder,String zone,String warehouse,String category,String subcategory,String brand,String locationListAll,String requestType){
		String resultStr=null;
		/*StockRequestsProxy stockRequestsProxyOnj = null;*/
		StockRequests stockRequestObj = null;
		List<StockRequests> stockRequestsList = null;
		RequestBean beanObj = null;
		RestfulServiceConnection restfulConnectionObj =null;
		try{
			/*stockRequestsProxyOnj = new StockRequestsProxy();*/
			restfulConnectionObj = new RestfulServiceConnection();
			stockRequestObj = new StockRequests();
			beanObj = new RequestBean();
			List<String> zonesList = new ArrayList<String>();
			if(search){
				beanObj.setSearchCriteria(searchNameStr);
				
				
			}else
				beanObj.setStockRequestId(stockRequestId);
			beanObj.setLocation(locationStr);
			beanObj.setStartDate(startDate);
			beanObj.setEndDate(endDate);
			beanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			beanObj.setStartIndex(index);
			beanObj.setMaxRecords(maxRecords);
			beanObj.setCategory(category);
			beanObj.setSubCategory(subcategory);
			beanObj.setBrand(brand);
			if(flowUnder.equals("outlet")){
				beanObj.setOutletAll(true);
				beanObj.setFromStoreCode(locationStr);
				if(zone!=null && zone!="")
					zonesList.add(zone);
					beanObj.setZonesList(zonesList);
				//beanObj.setFromStoreCode(locationStr);
				
				/*if(locationStr.equals("all") || locationStr.equals(""))
				{
				List<String> myList = new ArrayList<String>(Arrays.asList(locationListAll.split(",")));
				beanObj.setFormStoreCodeList(myList);
				}
				else*/
				if(requestType.equals("outletStockRequestIn")){
					beanObj.setFromStoreCode(locationStr);
					}else if(requestType.equals("outletStockRequestOut")){
					beanObj.setToWareHouseId(locationStr);
					}

				
				//beanObj.setFromStoreCode(locationStr);
				//beanObj.setToWareHouseId(warehouse);
			}
			else if(flowUnder.equals("warehouse")){
				if(zone!=null && zone!="")
					zonesList.add(zone);
					beanObj.setZonesList(zonesList);
					/*if(locationStr.equals("all") || locationStr.equals(""))
					{
					List<String> myList = new ArrayList<String>(Arrays.asList(locationListAll.split(",")));
					beanObj.setFormStoreCodeList(myList);
					}
					else*/
					//beanObj.setFromStoreCode(locationStr);
					
					if(requestType.equals("wstockRequestIn")){
						beanObj.setFromStoreCode(locationStr);
						}else if(requestType.equals("wstockRequestOut")){
						beanObj.setToWareHouseId(locationStr);
						}

					
//				beanObj.setFromStoreCode(locationStr);
				//beanObj.setToWareHouseId(warehouse);
				beanObj.setWarehouseAll(true);
			}
			// log.info("Request String:::"+gson.toJson(beanObj));
          //   ////System.out.println("Request String:::"+gson.toJson(beanObj));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_stock_request"), gson.toJson(beanObj), "GET");
       // 	////System.out.println(" get Response String:::"+resultStr);
			// log.info("Response String:::"+resultStr);
			stockRequestObj = gson.fromJson(resultStr,StockRequests.class); 
			if(stockRequestObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				stockRequestsList = stockRequestObj.getStockRequests();
				if(stockRequestsList != null && stockRequestsList.size()>0){
					int slNo = Integer.parseInt(index);
					for(int i=0;i<stockRequestsList.size();i++){
						stockRequestsList.get(i).setSlNo(++slNo);
						if(stockRequestsList.get(i).getDeliveryDateStr()!=null && stockRequestsList.get(i).getDeliveryDateStr().trim()!="")
						stockRequestsList.get(i).setDeliveryDateStr(stockRequestsList.get(i).getDeliveryDateStr().substring(0, 10));
						if(stockRequestsList.get(i).getRequestDateStr()!=null && stockRequestsList.get(i).getRequestDateStr().trim()!="")
						stockRequestsList.get(i).setRequestDateStr(stockRequestsList.get(i).getRequestDateStr().substring(0, 10));
						/*if(stockRequestsList.get(i).getToStoreCode()!=null && stockRequestsList.get(i).getToStoreCode().trim()!="")
							stockRequestsList.get(i).setToWareHouseId(stockRequestsList.get(i).getToStoreCode());*/
					}
					stockRequestsList.get(0).setTotalRecords(stockRequestObj.getTotalRecords());
					stockRequestsList.get(0).setTotalIndentQty(stockRequestObj.getTotalIndentQty());
					stockRequestsList.get(0).setTotalIndents(stockRequestObj.getTotalIndents());
					stockRequestsList.get(0).setTotalOutlets(stockRequestObj.getTotalOutlets());
					stockRequestsList.get(0).setIndentsOpened(stockRequestObj.getIndentsOpened());
					stockRequestsList.get(0).setStatusWiseQtyList(stockRequestObj.getStatusWiseQtyList());
				}
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		}
		return stockRequestsList;
	}


	
	public List<String> getStockReceiptIds(String customerIdStr,String emailIdStr,String fromLocation,String searchNameStr){
		String resultStr=null;
		List<String> receiptRefIds = new ArrayList<String>();
		RestfulServiceConnection restfulServiceConnection = null;
		RequestBean beanObj = null;
			
		try{
			restfulServiceConnection = new RestfulServiceConnection();
			beanObj = new RequestBean();
			beanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			beanObj.setReceipt_location(fromLocation);
			beanObj.setGoods_receipt_ref_num(searchNameStr);
			beanObj.setStartIndex("-1");
			// log.info("Request String:::"+gson.toJson(beanObj));
			
			/*resultStr = stockReceiptProxyObj.getStockReceiptIds(gson.toJson(beanObj));*/
			resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_stock_receipt_ids"), gson.toJson(beanObj), "GET");
			// log.info("Response String:::"+resultStr);
			
			StockReciept stockRecieptObj = gson.fromJson(resultStr,StockReciept.class); 
			
			if(stockRecieptObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				receiptRefIds = stockRecieptObj.getReceiptIds();
			}
			
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		}
		return receiptRefIds;
	}
	public List<String> getStockRequestIds(String customerIdStr,String emailIdStr,String fromLocation,String searchNameStr){
		String resultStr=null;
		List<String> receiptRefIds = new ArrayList<String>();
		RestfulServiceConnection restfulServiceConnection = null;
		RequestBean beanObj = null;
			
		try{
			restfulServiceConnection = new RestfulServiceConnection();
			beanObj = new RequestBean();
			beanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			beanObj.setReceipt_location(fromLocation);
			beanObj.setSearchCriteria(searchNameStr);
			beanObj.setStartIndex("-1");
			// log.info("Request String:::"+gson.toJson(beanObj));
//			////////////System.out.println("Request String:::"+gson.toJson(beanObj));
			/*resultStr = stockReceiptProxyObj.getStockReceiptIds(gson.toJson(beanObj));*/
			resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_stock_request_ids"), gson.toJson(beanObj), "GET");
			// log.info("Response String:::"+resultStr);
			
			StockReciept stockRecieptObj = gson.fromJson(resultStr,StockReciept.class); 
			
			if(stockRecieptObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				receiptRefIds = stockRecieptObj.getIndentIdsList();
			}
			
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		}
		return receiptRefIds;
	}
	/**
	 * @author Sahitya
	 * Verified By : 
	 * 
	 * @param customerId,emailid,goods_receipt_ref_num
	 * 
     * This method is used to receive receipt related response data which contains stock receipt details along with item details 
     *    from webservice to controller
     * 
     * @return  outlet-wise stock receipts based on provided goods_receipt_ref_num
     */
	public StockRequestSummaryResponse getstockRequestSummary(String flowUnder,String warehouse,String location,String zone,String startDate, String endDate,String locationListAll){
		String resultStr=null;
		StockRequestSummaryResponse stockRequestObj =null;
		RequestBean beanObj = null;
		RestfulServiceConnection restfulConnectionObj =null;
		try{
			/*stockRequestsProxyOnj = new StockRequestsProxy();*/
			restfulConnectionObj = new RestfulServiceConnection();
			 stockRequestObj = new StockRequestSummaryResponse();
			beanObj = new RequestBean();
			if(location.equals("all") || location.equals(""))
			{
			List<String> myList = new ArrayList<String>(Arrays.asList(locationListAll.split(",")));
			beanObj.setLocationsList(myList);	
			}
			else
			beanObj.setFromStoreCode(location);
			List<String> zonesList = new ArrayList<String>();
			if(zone!=null && zone!="")
				zonesList.add(zone);
				beanObj.setZonesList(zonesList);
			beanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			beanObj.setStartIndex("0");
			beanObj.setStartDate(startDate);
			beanObj.setEndDate(endDate);
			beanObj.setToWareHouseId(warehouse);
			//////////////System.out.println(gson.toJson(beanObj));
			// log.info("Request String:::"+gson.toJson(beanObj));
			/*resultStr = stockRequestsProxyOnj.getStockRequests(gson.toJson(beanObj));*/
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_stock_request_summary"), gson.toJson(beanObj), "GET");
			
			// log.info("Response String:::"+resultStr);
			//////////////System.out.println("Response String:::"+resultStr);
			if(Response.getResponseCode(resultStr).equals(Constants.RESPONSE_SUCCESS_CODE)){
				stockRequestObj = gson.fromJson(resultStr,StockRequestSummaryResponse.class); 
			
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
	
	/**
	 * @author Sahitya
	 * Verified By : 
	 * 
	 * @param customerId,emailid,goods_receipt_ref_num
	 * 
     * This method is used to receive receipt related response data which contains stock receipt details along with item details 
     *    from webservice to controller
     * 
     * @return  outlet-wise stock receipts based on provided goods_receipt_ref_num
     */
	public StockRequestSummaryResponse getstockIssueSummary(String flowUnder,String warehouse,String itemwise,String startDate,String endDate,String locationStr){
		String resultStr=null;
		StockRequestSummaryResponse stockRequestObj =null;
		RequestBean beanObj = null;
		RestfulServiceConnection restfulConnectionObj =null;
		try{
			/*stockRequestsProxyOnj = new StockRequestsProxy();*/
			restfulConnectionObj = new RestfulServiceConnection();
			 stockRequestObj = new StockRequestSummaryResponse();
			beanObj = new RequestBean();
			beanObj.setStartDate(startDate);
			beanObj.setEndDate(endDate);
			beanObj.setSkuId(itemwise);
			beanObj.setIssue_to(locationStr);
			beanObj.setFromWareHouseId(warehouse);
			beanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			beanObj.setStartIndex("0");
			
			// log.info("Request String:::"+gson.toJson(beanObj));
			/*resultStr = stockRequestsProxyOnj.getStockRequests(gson.toJson(beanObj));*/
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_stock_issue_summary"), gson.toJson(beanObj), "GET");
			// log.info("Response String:::"+resultStr);
			
			if(Response.getResponseCode(resultStr).equals(Constants.RESPONSE_SUCCESS_CODE)){
				stockRequestObj = gson.fromJson(resultStr,StockRequestSummaryResponse.class); 
			
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
	
	
	public String updateStockRequest(StockRequests stockRequestObj, String customerIdStr, String emailIdStr)
	{
		RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
	String resultStr = null;
	try {
		stockRequestObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		// log.info("Request String::::::::::::"+gson.toJson(stockRequestObj));
		resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_stock_request"), gson.toJson(stockRequestObj));
		// log.info("Response String:::::::::::"+resultStr);	
		//////////////System.out.println("stockreq Request String::::::::::::"+gson.toJson(stockRequestObj));
		
		String responseCode = Response.getResponseCode(resultStr);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			resultStr = AppProperties.getAppMessageByProperty("STOCK_REQUEST_UPDATE_SUCCESS").trim();
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
	
	
	
	public String createStockRequest(StockRequests stockRequestObj, String customerIdStr, String emailIdStr)
	{
		RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
	String resultStr = null;
	try {
		stockRequestObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		// log.info("Request String::::::::::::"+gson.toJson(stockRequestObj));
	//	////////////System.out.println("Request String::::::::::::"+gson.toJson(stockRequestObj));
		resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_stock_request"), gson.toJson(stockRequestObj));
		// log.info("Response String:::::::::::"+resultStr);	
		
		//////////////System.out.println("Response String:::::::::::"+resultStr);
		String responseCode = Response.getResponseCode(resultStr);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			resultStr = AppProperties.getAppMessageByProperty("STOCK_REQUEST_CREATE_SUCCESS").trim();
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
	
	public StockRequestSummaryResponse createprovisionalPo(String flowUnder,Boolean status,String ids){
		String resultStr=null;
		StockRequestSummaryResponse stockRequestObj =null;
		RequestBean beanObj = null;
		RestfulServiceConnection restfulConnectionObj =null;
		try{
			/*stockRequestsProxyOnj = new StockRequestsProxy();*/
			restfulConnectionObj = new RestfulServiceConnection();
			 stockRequestObj = new StockRequestSummaryResponse();
			beanObj = new RequestBean();
			String[] idsArray = ids.split(",");
			beanObj.setStartIndex("0");
			List<String> featureIds = new ArrayList<String>();
			for(int i=0;i<idsArray.length;i++)
				featureIds.add(idsArray[i]);
			beanObj.setRequestIds(featureIds);
			beanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			beanObj.setStartIndex("0");
			beanObj.setEnforceGeneratePO(status);
			beanObj.setWareHouseLocation(flowUnder);
			// log.info("Request String:::"+gson.toJson(beanObj));
			//resultStr = "{\"responseHeader\":{\"responseCode\":\"3\",\"responseMessage\":\"Please Configure Supplier Products\"},\"noSupplierSkuList\":[\"90013\",\"90055\",\"90056\",\"90057\",\"90069\",\"90070\",\"90071\",\"90073\",\"90075\",\"90083\",\"90120\",\"90129\",\"90144\",\"90147\",\"90158\",\"90170\"]}";
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("generate_purchase_order"), gson.toJson(beanObj), "GET");
			// log.info("Response String:::"+resultStr);
			stockRequestObj.setResponseMessage(Response.getResponseMessage(resultStr));	
			stockRequestObj.setResponseCode(Response.getResponseCode(resultStr));
			if(Response.getResponseCode(resultStr).equals(Constants.RESPONSE_SUCCESS_CODE)){
				stockRequestObj = gson.fromJson(resultStr,StockRequestSummaryResponse.class); 
				stockRequestObj.setResponseMessage(Response.getResponseMessage(resultStr));
			
			}
			else if(Response.getResponseCode(resultStr).equals(Constants.ALERT_SUCCESS_CODE)){
				stockRequestObj = gson.fromJson(resultStr,StockRequestSummaryResponse.class); 
				stockRequestObj.setResponseMessage(Response.getResponseMessage(resultStr));
				stockRequestObj.setResponseCode(Response.getResponseCode(resultStr));
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
	
	
	public StockRequestSummaryResponse generateIndents(String flowUnder,String ids,String indentCategory,String startDate,String endDate,String Tolocation,String select){
		String resultStr=null;
		StockRequestSummaryResponse stockRequestObj =null;
		RequestBean beanObj = null;
		RestfulServiceConnection restfulConnectionObj =null;
		try{
			/*stockRequestsProxyOnj = new StockRequestsProxy();*/
			restfulConnectionObj = new RestfulServiceConnection();
			 stockRequestObj = new StockRequestSummaryResponse();
				String[] idsArray = ids.split(",");
			beanObj = new RequestBean();
			List<String> featureIds = new ArrayList<String>();
			for(int i=0;i<idsArray.length;i++)
			featureIds.add(idsArray[i]);
			beanObj.setPoRefList(featureIds);
			beanObj.setOutletLocations(featureIds);
			beanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			beanObj.setStartIndex("0");
			beanObj.setIndentCategory(indentCategory);
			beanObj.setWareHouseLocation(flowUnder);
			beanObj.setWareHouseLocation(Tolocation);
			beanObj.setStartDate(startDate);
			beanObj.setEndDate(endDate);
			beanObj.setGenerateIndentType(select);
			////System.out.println("Request String:::"+gson.toJson(beanObj));
			/*resultStr = stockRequestsProxyOnj.getStockRequests(gson.toJson(beanObj));*/
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("generate_indents"), gson.toJson(beanObj), "GET");
		//	//////System.out.println("Response String:::"+resultStr);
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
	
	public StockRequestSummaryResponse openedIndents(String flowUnder){
		String resultStr=null;
		StockRequestSummaryResponse stockRequestObj =null;
		RequestBean beanObj = null;
		RestfulServiceConnection restfulConnectionObj =null;
		try{
			/*stockRequestsProxyOnj = new StockRequestsProxy();*/
			restfulConnectionObj = new RestfulServiceConnection();
			 stockRequestObj = new StockRequestSummaryResponse();
			beanObj = new RequestBean();
		
			beanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			beanObj.setStartIndex("0");
			beanObj.setWareHouseLocation(flowUnder);
			// log.info("Request String:::"+gson.toJson(beanObj));
			/*resultStr = stockRequestsProxyOnj.getStockRequests(gson.toJson(beanObj));*/
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_opened_indents"), gson.toJson(beanObj), "GET");
			// log.info("Response String:::"+resultStr);
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
	
}

