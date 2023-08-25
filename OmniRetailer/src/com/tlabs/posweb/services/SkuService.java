
/*******************************************************************************
 * Copyright  2015 Omni Retailer Customer Console, All rights reserved.
 * Author : Sahitya P
 * Created On : 17-4-2015
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

import java.io.FileNotFoundException;
import java.io.IOException;
import java.rmi.ConnectException;
import java.rmi.RemoteException;
import java.rmi.UnknownHostException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.tlabs.posweb.beans.BarcodePrintRequestBean;
import com.tlabs.posweb.beans.DailyStockTracker;
import com.tlabs.posweb.beans.GetProductsResponse;
//import com.tlabs.posweb.beans.ItemWiseReport;
import com.tlabs.posweb.beans.LocationBean;
import com.tlabs.posweb.beans.MasterDataImportsAndExportsBean;
import com.tlabs.posweb.beans.PriceHistory;
import com.tlabs.posweb.beans.ProcessingAndPackaging;
import com.tlabs.posweb.beans.ProductStocks;
import com.tlabs.posweb.beans.Products;
import com.tlabs.posweb.beans.ProductsList;
import com.tlabs.posweb.beans.ReportsBean;
import com.tlabs.posweb.beans.ReportsRequestBean;
import com.tlabs.posweb.beans.RequestBean;
import com.tlabs.posweb.beans.RequestHeader;
//import com.tlabs.posweb.beans.SalesReport;
import com.tlabs.posweb.beans.SearchProductResponse;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.beans.Sku;
import com.tlabs.posweb.beans.SkuDetails;
import com.tlabs.posweb.beans.SkuId;
import com.tlabs.posweb.beans.SkuPriceList;
import com.tlabs.posweb.beans.SkuPriceListDetails;
import com.tlabs.posweb.beans.StockLedger;
import com.tlabs.posweb.beans.StockLedgerDetails;
import com.tlabs.posweb.beans.TrackerItemDetails;
import com.tlabs.posweb.beans.UpdateDto;
import com.tlabs.posweb.beans.WareHouseSku;
import com.tlabs.posweb.beans.WareHouseSkuResponse;
import com.tlabs.posweb.beans.WarehousePicklistMaster;
import com.tlabs.posweb.beans.WarehouseSkuPriceList;
import com.tlabs.posweb.init.AppProperties;
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
 * This class is used for calling all methods of Sku web service
 */

public class SkuService {

	
	@Autowired
	private Gson gson;
	@Autowired
	private OutletMasterService outletMasterServiceObj;
	@Autowired
    private GenericMasterService genericMasterServiceObj;
	@Autowired
	SessionScope sessionScope;
	private static Logger log = Logger.getLogger(SkuService.class);
	
	
	
	
	/*public List<SkuDetails> getProductStocks(String searchName,String searchType,String startDateStr,String endDateStr,String outletLocationStr,String stockTypeStr,String customerIdStr,String emailIdStr,String index,String flowUnder,String zone,String category,String subcategory,String brand,String department,Float startprice,Float endprice,Boolean stockdownload,String supplierName,String maxRecords){
		ProductStocks productStocksObj = null;
		String resultStr = null;
		List<SkuDetails> skuDetailsList = null;
		RestfulServiceConnection restfulConnectionObj = null;
		try{
			// log.info("Get Product Stocks by Outlet-wise");
			restfulConnectionObj = new RestfulServiceConnection();
			productStocksObj = new ProductStocks();
			productStocksObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			productStocksObj.setStoreLocation(outletLocationStr);
			productStocksObj.setStartIndex(Integer.parseInt(index));
			productStocksObj.setRequiredRecords(Integer.parseInt(maxRecords));
			productStocksObj.setSearchCriteria(searchName);
			//productStocksObj.setSearchType(searchType);
			productStocksObj.setStatus(searchType);
			if(flowUnder.equalsIgnoreCase("outlet"))
				productStocksObj.setBoneyardSummaryFlag(true);
			productStocksObj.setStartDate(startDateStr);
			productStocksObj.setEndDate(endDateStr);
			productStocksObj.setStockType(stockTypeStr);
			productStocksObj.setCategory(category);
			productStocksObj.setSubCategory(subcategory);
			productStocksObj.setBrand(brand);
			productStocksObj.setDepartment(department);
			productStocksObj.setEndPriceRange(endprice);
			productStocksObj.setZone(zone);
			productStocksObj.setStartPriceRange(startprice);
			productStocksObj.setSaveStockFlag(stockdownload);
			productStocksObj.setSupplierName(supplierName);
			// log.info("Request String:::"+gson.toJson(productStocksObj));
			if(flowUnder.equalsIgnoreCase("outlet"))
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Sku_Service_get_Product"), gson.toJson(productStocksObj), "GET");
			else
				resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Sku_Service_get_warehouse_Product"), gson.toJson(productStocksObj), "GET");
			// log.info("Response String:::"+resultStr);
			////////////////////////////////////////////System.out.println"Response String:::"+resultStr);
			productStocksObj = gson.fromJson(resultStr,ProductStocks.class);
			int slNo = Integer.parseInt(index);
			if(productStocksObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				
				if(productStocksObj.getSku()!=null)
					skuDetailsList = productStocksObj.getSku();
				else
					skuDetailsList = productStocksObj.getBoneyardStockSummaries();
				skuDetailsList.get(0).setTotalRecords(productStocksObj.getTotalRecords());
				skuDetailsList.get(0).setStockDownload(productStocksObj.getStocksFilePath());
				skuDetailsList.get(0).setTotalPrice(productStocksObj.getTotalPrice());
				skuDetailsList.get(0).setTotalQuantity(productStocksObj.getTotalQuantity());
				for(SkuDetails skuDetails : skuDetailsList)
					skuDetails.setSlNo(++slNo);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return skuDetailsList;
		
	}*/
	
	/**
	 * 
	 * @author Manasa.P
	 * This method accepts search string storeLocation and productCategory.
	 * It calls the getskupricelist method of web service.
	 * It retrieves skuPricelist Details.
	 * 
	 * 
	 */
	
	
	public ArrayList<LocationBean> getLocationDetails(String locationId,String roleCode,String emailId,String index,String businessActivity,boolean search,boolean allLocations,boolean status){
		ArrayList<LocationBean> locationDetails = null;
		String result = null;
		List<String> roleLocations = null;
		HttpServletRequest mock = null;
		try{
			LocationBean locationBean = new LocationBean();
			roleLocations =  new ArrayList<String>();
			locationBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			if(search)
				locationBean.setSearchCriteria(locationId);
			else
			   locationBean.setLocationId(locationId);
			locationBean.setStartIndex(index);
			locationBean.setBusinessActivity(businessActivity);
			locationBean.setAllLocations(allLocations);
			locationBean.setStatus(status);
			
			/*UtilityMasterServiceProxy utitlitymaster = new UtilityMasterServiceProxy();
			// log.info("Request String::::::"+gson.toJson(locationBean));
			//////////////////////////////////////////////System.out.println"Request String::::::"+gson.toJson(locationBean));
			result = utitlitymaster.getLocation(gson.toJson(locationBean));
			// log.info("Response String::::::"+result);
			//////////////////////////////////////////////System.out.println"loca Response String::::::"+result);
*/			
			/**	added by - vasudev   purpose - using rest service call instead of soap call*/
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_locations"), gson.toJson(locationBean),"POST");

			
			String responseCode = Response.getResponseCode(result);
			JSONObject jsonResult = new JSONObject(result);
			String totalRecords = jsonResult.getString("totalRecords");
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				String responseList = Response.getResponseList(result, "locationDetails");
				JSONArray jsonResponseArray = new JSONArray(responseList);
				locationDetails = new ArrayList<LocationBean>();
				 roleLocations =(List<String>)sessionScope.getRoleLocationsList();
				int slNo = Integer.parseInt(index);
				for (int i=0; i<jsonResponseArray.length(); i++) {
					locationBean = gson.fromJson(jsonResponseArray.getString(i), LocationBean.class);
					locationBean.setTotalRecords(totalRecords);
					locationBean.setStartValue(index);
					locationBean.setSlNo(++slNo);
					if(!roleCode.equalsIgnoreCase("1")){
						//if(roleLocations != null)
						for(String loc : roleLocations){
							if(locationBean.getLocationId().equalsIgnoreCase(loc))
								locationDetails.add(locationBean);	
							}
					}
					else{
						locationDetails.add(locationBean);
					}
					
				}
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
		}
		return locationDetails;
	}
	
	public SearchProductResponse getPriceupdateDetails(String index,String customerIdStr,String emailIdStr,String locationstr){
		String resultStr = null;
		SearchProductResponse skuIdBean =new SearchProductResponse();
		RequestBean requestBeanObj = null;
		RestfulServiceConnection restfulConnectionObj = null;
		try{
			// log.info("Get Products based on provided name");
			//////////////////////////////////////////////System.out.println"Get Products based on provided name");
			restfulConnectionObj = new RestfulServiceConnection();
			requestBeanObj = new RequestBean();
			requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestBeanObj.setStartIndex("-1");
			requestBeanObj.setStoreLocation(locationstr);
			requestBeanObj.setMaxRecords("20");
			requestBeanObj.setCategory("APPAREL");
			// log.info("Request String::::"+gson.toJson(requestBeanObj));
			//////////////////////////////////////////////System.out.println"Request String::::"+gson.toJson(requestBeanObj));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Sku_PriceList"), gson.toJson(requestBeanObj), "GET");
			//// log.info("Response String::::"+resultStr);
			//////////////////////////////////////////////System.out.println"Price Response String::::"+resultStr);
			 skuIdBean = gson.fromJson(resultStr,SearchProductResponse.class);
			if (skuIdBean.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)) {
				skuIdBean= gson.fromJson(resultStr, SearchProductResponse.class);	
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return skuIdBean;
		
	}
	
	/**
	 * 
	 * @author Manasa.P
	 * This method accepts search string storeLocation and productCategory.
	 * It calls the getskupricelist method of web service.
	 * It retrieves skuPricelist Details.
	 * 
	 * 
	 */
	
	public List<Sku> getBulkPriceupdateDetails(String index,String customerIdStr,String emailIdStr,String locationstr,String maxRecords,String category,String zone,String subcategory,String locationList){
		String resultStr = null;
		List<Sku> skuIdBean =new ArrayList<Sku>();
		Sku skuObj = new Sku();
		RequestBean requestBeanObj = null;
		RestfulServiceConnection restfulConnectionObj = null;
		try{
			// log.info("Get Products based on provided name");
			//////////////////////////////////////////////System.out.println"Get Products based on provided name");
			restfulConnectionObj = new RestfulServiceConnection();
			requestBeanObj = new RequestBean();
			requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestBeanObj.setStartIndex("-1");
			requestBeanObj.setStoreLocation(locationstr);
			requestBeanObj.setMaxRecords(maxRecords);
			// log.info("Request String::::"+gson.toJson(requestBeanObj));
			//////////////////////////////////////////////System.out.println"Request String::::"+gson.toJson(requestBeanObj));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Sku_PriceList"), gson.toJson(requestBeanObj), "GET");
			//// log.info("Response String::::"+resultStr);
			//////////////////////////////////////////////System.out.println"Price Response String::::"+resultStr);
			if (resultStr.equals(Constants.RESPONSE_SUCCESS_CODE)) {
				skuObj= gson.fromJson(resultStr, Sku.class);	
				
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return skuIdBean;
		
	}
	
	/**
	 * 	@modifiedBy  vijay
	 *  @modificationDescription implemented DayWiseStock Report 
	 *  @modificationDate 22-11-2017
     *  @return ModelAndView 
     */
	public List<SkuDetails> getProductStocks(String searchName,String searchType,String startDateStr,String endDateStr,String outletLocationStr,String stockTypeStr,String customerIdStr,String emailIdStr,String index,String flowUnder,String zone,String category,String subcategory,String brand,String department,Float startprice,Float endprice,Boolean stockdownload,String supplierName,String maxRecords,String locationsListValue,String storgaeArea){
		ProductStocks productStocksObj = null;
		String resultStr = null;
		List<SkuDetails> skuDetailsList = null;
		RestfulServiceConnection restfulConnectionObj = null;
		ArrayList<LocationBean> locationBeansList = null;
		try{
			// log.info("Get Product Stocks by Outlet-wise");
			restfulConnectionObj = new RestfulServiceConnection();
			productStocksObj = new ProductStocks();
			productStocksObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
		//	////////////////////////////////////////////System.out.printlnlocationsListValue);
			
			if(outletLocationStr.equals("all") || outletLocationStr.equals("")){
			List<String> myList = new ArrayList<String>(Arrays.asList(locationsListValue.split(",")));
			productStocksObj.setLocationsList(myList);
			}
			else
			productStocksObj.setStoreLocation(outletLocationStr.trim());
			
			productStocksObj.setStartIndex(Integer.parseInt(index));
			productStocksObj.setRequiredRecords(Integer.parseInt(maxRecords));
			productStocksObj.setSearchCriteria(searchName.trim());
			//productStocksObj.setSearchType(searchType);
			productStocksObj.setStatus(searchType.trim());
			if(flowUnder.equalsIgnoreCase("outlet"))
				productStocksObj.setBoneyardSummaryFlag(true);
			productStocksObj.setStartDate(startDateStr.trim());
			productStocksObj.setEndDate(endDateStr.trim());
			productStocksObj.setStockType(stockTypeStr.trim());
			productStocksObj.setCategory(category.trim());
			productStocksObj.setSubCategory(subcategory.trim());
			productStocksObj.setBrand(brand.trim());
			productStocksObj.setDepartment(department.trim());
			productStocksObj.setEndPriceRange(endprice);
			productStocksObj.setZone(zone.trim());
			productStocksObj.setStartPriceRange(startprice);
			productStocksObj.setSaveStockFlag(stockdownload);
			productStocksObj.setSupplierName(supplierName.trim());
			productStocksObj.setStorageArea(storgaeArea);
			// log.info("Request String:::"+gson.toJson(productStocksObj));

	//////////System.out.println("Request String:::"+gson.toJson(productStocksObj));
			
			if(stockTypeStr.equalsIgnoreCase("DayWise") && flowUnder.equalsIgnoreCase("outlet"))
				
			{
				locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,true);	
				if((outletLocationStr.trim()).equals(null) || outletLocationStr.trim().isEmpty())
				{
					productStocksObj.setStore_location(locationBeansList.get(0).getLocationId());
					productStocksObj.setStockLocations(null);
				}else
				productStocksObj.setStore_location(outletLocationStr.trim());
				productStocksObj.setStoreLocation(null);
				productStocksObj.setCategory(null);
				productStocksObj.setCategoryName(category.trim());
				
				productStocksObj.setSaveReport(stockdownload);
				productStocksObj.setZoneId(zone.trim());
				//////////////////////////////////////////////System.out.printlngson.toJson(productStocksObj));
				resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_daily_stock_report"), gson.toJson(productStocksObj), "GET");
				////////////////////////////System.out.println"day wise Stocks Response String:::"+resultStr);
			}
			
			else if(flowUnder.equalsIgnoreCase("outlet"))
				resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Sku_Service_get_Product"), gson.toJson(productStocksObj), "GET");
			else
				resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Sku_Service_get_warehouse_Product"), gson.toJson(productStocksObj), "GET");
			// log.info("Response String:::"+resultStr);
		   ////////System.out.println("Stocks Response String:::"+resultStr);

			productStocksObj = gson.fromJson(resultStr,ProductStocks.class);
			int slNo = Integer.parseInt(index);
			if(productStocksObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				
				if(productStocksObj.getSku()!=null)
					skuDetailsList = productStocksObj.getSku();
				
				else if(productStocksObj.getReportsList()!=null)
					skuDetailsList = productStocksObj.getReportsList();
				else
					skuDetailsList = productStocksObj.getBoneyardStockSummaries();
				
				
			
				skuDetailsList.get(0).setTotalRecords(productStocksObj.getTotalRecords());
				skuDetailsList.get(0).setStockDownload(productStocksObj.getStocksFilePath());
				skuDetailsList.get(0).setTotalPrice(productStocksObj.getTotalPrice());
				skuDetailsList.get(0).setTotalQuantity(productStocksObj.getTotalQuantity());
				skuDetailsList.get(0).setStockDaywiseDownload(productStocksObj.getSalesReportFilePath());
				for(SkuDetails skuDetails : skuDetailsList)
					skuDetails.setSlNo(++slNo);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return skuDetailsList;
		
	}
	
	
	public List<SkuDetails> getProductStocksNew(String searchName,String searchType,String startDateStr,String endDateStr,String outletLocationStr,String stockTypeStr,String customerIdStr,String emailIdStr,String index,String flowUnder,String zone,String category,String subcategory,String brand,String department,Boolean stockdownload,String supplierName,String maxRecords,String locationsListValue,String storgaeArea){
		ProductStocks productStocksObj = null;
		String resultStr = null;
		List<SkuDetails> skuDetailsList = null;
		RestfulServiceConnection restfulConnectionObj = null;
		ArrayList<LocationBean> locationBeansList = null;
		try{
			// log.info("Get Product Stocks by Outlet-wise");
			restfulConnectionObj = new RestfulServiceConnection();
			productStocksObj = new ProductStocks();
			productStocksObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
		//	////////////////////////////////////////////System.out.printlnlocationsListValue);
			
			if(outletLocationStr.equals("all") || outletLocationStr.equals("")){
			List<String> myList = new ArrayList<String>(Arrays.asList(locationsListValue.split(",")));
			productStocksObj.setLocationsList(myList);
			}
			else
			productStocksObj.setStoreLocation(outletLocationStr.trim());
			
			productStocksObj.setStartIndex(Integer.parseInt(index));
			productStocksObj.setRequiredRecords(Integer.parseInt(maxRecords));
			productStocksObj.setSearchCriteria(searchName.trim());
			//productStocksObj.setSearchType(searchType);
			productStocksObj.setStatus(searchType.trim());
			if(flowUnder.equalsIgnoreCase("outlet"))
				productStocksObj.setBoneyardSummaryFlag(true);
			productStocksObj.setStartDate(startDateStr.trim());
			productStocksObj.setEndDate(endDateStr.trim());
			productStocksObj.setStockType(stockTypeStr.trim());
			productStocksObj.setCategory(category.trim());
			productStocksObj.setSubCategory(subcategory.trim());
			productStocksObj.setBrand(brand.trim());
			productStocksObj.setDepartment(department.trim());
			productStocksObj.setZone(zone.trim());
			productStocksObj.setSaveStockFlag(stockdownload);
			productStocksObj.setSupplierName(supplierName.trim());
			productStocksObj.setStorageArea(storgaeArea);
			// log.info("Request String:::"+gson.toJson(productStocksObj));

	//////////System.out.println("Request String:::"+gson.toJson(productStocksObj));
			
			if(stockTypeStr.equalsIgnoreCase("DayWiseHistory") && flowUnder.equalsIgnoreCase("outlet"))
				
			{
				locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,true);	
				if((outletLocationStr.trim()).equals(null) || outletLocationStr.trim().isEmpty())
				{
					productStocksObj.setStore_location(locationBeansList.get(0).getLocationId());
					productStocksObj.setStockLocations(null);
				}else
				productStocksObj.setStore_location(outletLocationStr.trim());
				productStocksObj.setStoreLocation(null);
				productStocksObj.setCategory(null);
				productStocksObj.setCategoryName(category.trim());
				
				productStocksObj.setSaveReport(stockdownload);
				productStocksObj.setZoneId(zone.trim());
				//////////////////////////////////////////////System.out.printlngson.toJson(productStocksObj));
				resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("getDailyStockReportNew"), gson.toJson(productStocksObj), "GET");
				//////////////////////////////System.out.println("day wise Stocks Response String:::"+resultStr);
			}
			
			/*else if(flowUnder.equalsIgnoreCase("outlet"))
				resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Sku_Service_get_Product"), gson.toJson(productStocksObj), "GET");
			else
				resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Sku_Service_get_warehouse_Product"), gson.toJson(productStocksObj), "GET");
			// log.info("Response String:::"+resultStr);
*/		  
			
			
			////////System.out.println("Stocks Response String:::"+resultStr);

			productStocksObj = gson.fromJson(resultStr,ProductStocks.class);
			int slNo = Integer.parseInt(index);
			if(productStocksObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				
				if(productStocksObj.getSku()!=null)
					skuDetailsList = productStocksObj.getSku();
				
				else if(productStocksObj.getReportsList()!=null)
					skuDetailsList = productStocksObj.getReportsList();
				else
					skuDetailsList = productStocksObj.getBoneyardStockSummaries();
				
				
			
				skuDetailsList.get(0).setTotalRecords(productStocksObj.getTotalRecords());
				skuDetailsList.get(0).setStockDownload(productStocksObj.getStocksFilePath());
				skuDetailsList.get(0).setTotalPrice(productStocksObj.getTotalPrice());
				skuDetailsList.get(0).setTotalQuantity(productStocksObj.getTotalQuantity());
				skuDetailsList.get(0).setStockDaywiseDownload(productStocksObj.getSalesReportFilePath());
				for(SkuDetails skuDetails : skuDetailsList)
					skuDetails.setSlNo(++slNo);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return skuDetailsList;
		
	}
	
	
	
	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 17-aug-2015
	 *  
	 * This method accepts search string storeLocation and productCategory.
	 * It calls the searchProducts method of web service.
	 * It retrieves productList matching search string, productCategory and storeLocation.
	 * @param b2crequired 
	 * 
	 * 
	 */
	public List<ProductsList> searchProducts(String customerIdStr,String emailIdStr,String searchNameStr,String storeLocation,String productCategoryStr,String supplier,boolean supplierFlag,String subCategory, String b2crequired,boolean bomsearchSkusFlag){
		String resultStr = null;
	//	SkuServiceProxy skuProxyObj = null;
		RequestBean requestBeanObj = null;
		List<ProductsList> productsLists = new ArrayList<ProductsList>();
		RestfulServiceConnection restfulConnectionObj = null;
		try{
			restfulConnectionObj = new RestfulServiceConnection();
//			skuProxyObj = new SkuServiceProxy();
			requestBeanObj = new RequestBean();
			requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestBeanObj.setSearchCriteria(searchNameStr);
			
		    if(b2crequired.equalsIgnoreCase("YES")) {
		    requestBeanObj.setStoreLocation("B2C");	
			requestBeanObj.setNearestStoreLocation(storeLocation);	
			requestBeanObj.setB2cRequest(true);
			requestBeanObj.setDetailsRequired(true);
			
		    }else {
			requestBeanObj.setStoreLocation(storeLocation);
		    }
			requestBeanObj.setProductCategory(productCategoryStr);
			requestBeanObj.setCategory(productCategoryStr);
			requestBeanObj.setSubCategory(subCategory);
			requestBeanObj.setSupplierId(supplier);
			requestBeanObj.setSupplierCode(supplier);
			requestBeanObj.setProductRestrictions(supplierFlag);
			requestBeanObj.setBomsearchSkusFlag(bomsearchSkusFlag);
			requestBeanObj.setStartIndex("0");
			requestBeanObj.setMaxRecords("10");
			
			//System.out.println("Request String searchProducts ::::"+gson.toJson(requestBeanObj));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Sku_Service_search_products"), gson.toJson(requestBeanObj), "GET");
			//resultStr = skuProxyObj.searchProducts(gson.toJson(requestBeanObj));
			////System.out.println("Response String::::"+resultStr); 
			ProductsList productsList = new ProductsList();
			
			SearchProductResponse searchProductResponse = gson.fromJson(resultStr,SearchProductResponse.class);
			if (searchProductResponse.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)) {
				for (int i = 0; i < searchProductResponse.getProductsList().length; i++) {
					productsList = searchProductResponse.getProductsList()[i];
					ProductsList productList = new ProductsList();
					if(productsList.getDescription() != null && productsList.getDescription().toLowerCase().contains(searchNameStr.toLowerCase())){
						productList.setDescription(productsList.getDescription());
						productList.setSkuID(productsList.getSkuID());
					}
					else if(productsList.getCategory() != null && productsList.getCategory().toLowerCase().contains(searchNameStr.toLowerCase())){
						productList.setDescription(productsList.getCategory());
						productList.setSkuID(productsList.getSkuID());
					}
					else if (productsList.getSkuID() != null && productsList.getSkuID().toLowerCase().contains(searchNameStr.toLowerCase())) {
						productList.setDescription(productsList.getSkuID());
						productList.setSkuID(productsList.getSkuID());
					}
					else {
						productList.setDescription(productsList.getProductId());
						productList.setSkuID(productsList.getSkuID());
					}
					productList.setPluCode(productsList.getPluCode());
					productList.setPrice(productsList.getPrice());
					productList.setBuy_price(productsList.getBuy_price());
					productList.setProductName(productsList.getProductName());
					productList.setColor(productsList.getColor());
					productList.setEan(productsList.getEan());
					productList.setSize(productsList.getSize());
					productList.setMeasureRange(productsList.getMeasurementRange());
					productList.setQuantity(productsList.getStock());
					productList.setMbq(productsList.getMbq());
					productList.setMrp(productsList.getMrp());
					
					 if(b2crequired.equalsIgnoreCase("YES") && productsList.getSkuInfo() != null && productsList.getSkuInfo().getSkuPriceLists().size()>0) {
						 List<SkuPriceList> b2csp = new ArrayList<SkuPriceList>();
						 b2csp.addAll(productsList.getSkuInfo().getSkuPriceLists());
						 if(b2csp.get(0).getQuantityInHand() != null ) {
						 productList.setQuantityInHand(b2csp.get(0).getQuantityInHand()); 
						 }else {
								productList.setQuantityInHand(productsList.getQuantityInHand());
						 }
						 
					 }else {
					productList.setQuantityInHand(productsList.getQuantityInHand());
					 }
					productList.setReorderPoint(productsList.getReorderPoint());
					productList.setIsPacked(productsList.getIsPacked());
					productList.setManufacturedItem(productsList.getManufacturedItem());
					productList.setUomLabel(productsList.getUomLabel());
					productList.setMinSaleQty(productsList.getMinSaleQty());
					productList.setStatus(productsList.getStatus());
					productList.setUtility(productsList.getUtility());
					productList.setMeasurementRange(productsList.getMeasurementRange());
					productList.setDepartment(productsList.getDepartment());
					productsLists.add(productList);
				}
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return productsLists;
		
	}
	
	
	public List<ProductsList> searchProductsforEvents(String customerIdStr,String emailIdStr,String searchNameStr,String storeLocation,String productCategoryStr,String supplier,boolean supplierFlag,String subCategory, String b2crequired,boolean bomsearchSkusFlag){
		String resultStr = null;
	//	SkuServiceProxy skuProxyObj = null;
		RequestBean requestBeanObj = null;
		List<ProductsList> productsLists = new ArrayList<ProductsList>();
		RestfulServiceConnection restfulConnectionObj = null;
		try{
			restfulConnectionObj = new RestfulServiceConnection();
//			skuProxyObj = new SkuServiceProxy();
			requestBeanObj = new RequestBean();
			requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestBeanObj.setSearchCriteria(searchNameStr);
			
		    if(b2crequired.equalsIgnoreCase("YES")) {
		    requestBeanObj.setStoreLocation("B2C");	
			requestBeanObj.setNearestStoreLocation(storeLocation);	
			requestBeanObj.setB2cRequest(true);
			requestBeanObj.setDetailsRequired(true);
			
		    }else {
			requestBeanObj.setStoreLocation(storeLocation);
		    }
			requestBeanObj.setProductCategory(productCategoryStr);
			requestBeanObj.setCategory(productCategoryStr);
			requestBeanObj.setSubCategory(subCategory);
			requestBeanObj.setSupplierId(supplier);
			requestBeanObj.setSupplierCode(supplier);
			requestBeanObj.setProductRestrictions(supplierFlag);
			requestBeanObj.setBomsearchSkusFlag(bomsearchSkusFlag);
			requestBeanObj.setStartIndex("0");
			requestBeanObj.setMaxRecords("50");
			
			//System.out.println("Request String searchProducts ::::"+gson.toJson(requestBeanObj));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Sku_Service_search_products"), gson.toJson(requestBeanObj), "GET");
			//resultStr = skuProxyObj.searchProducts(gson.toJson(requestBeanObj));
			////System.out.println("Response String::::"+resultStr); 
			ProductsList productsList = new ProductsList();
			
			SearchProductResponse searchProductResponse = gson.fromJson(resultStr,SearchProductResponse.class);
			if (searchProductResponse.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)) {
				for (int i = 0; i < searchProductResponse.getProductsList().length; i++) {
					productsList = searchProductResponse.getProductsList()[i];
					ProductsList productList = new ProductsList();
					if(productsList.getDescription() != null && productsList.getDescription().toLowerCase().contains(searchNameStr.toLowerCase())){
						productList.setDescription(productsList.getDescription());
						productList.setSkuID(productsList.getSkuID());
					}
					else if(productsList.getCategory() != null && productsList.getCategory().toLowerCase().contains(searchNameStr.toLowerCase())){
						productList.setDescription(productsList.getCategory());
						productList.setSkuID(productsList.getSkuID());
					}
					else if (productsList.getSkuID() != null && productsList.getSkuID().toLowerCase().contains(searchNameStr.toLowerCase())) {
						productList.setDescription(productsList.getSkuID());
						productList.setSkuID(productsList.getSkuID());
					}
					else {
						productList.setDescription(productsList.getProductId());
						productList.setSkuID(productsList.getSkuID());
					}
					productList.setPluCode(productsList.getPluCode());
					productList.setPrice(productsList.getPrice());
					productList.setBuy_price(productsList.getBuy_price());
					productList.setProductName(productsList.getProductName());
					productList.setColor(productsList.getColor());
					productList.setEan(productsList.getEan());
					productList.setSize(productsList.getSize());
					productList.setMeasureRange(productsList.getMeasurementRange());
					productList.setQuantity(productsList.getStock());
					productList.setMbq(productsList.getMbq());
					productList.setMrp(productsList.getMrp());
					
					 if(b2crequired.equalsIgnoreCase("YES") && productsList.getSkuInfo() != null && productsList.getSkuInfo().getSkuPriceLists().size()>0) {
						 List<SkuPriceList> b2csp = new ArrayList<SkuPriceList>();
						 b2csp.addAll(productsList.getSkuInfo().getSkuPriceLists());
						 if(b2csp.get(0).getQuantityInHand() != null ) {
						 productList.setQuantityInHand(b2csp.get(0).getQuantityInHand()); 
						 }else {
								productList.setQuantityInHand(productsList.getQuantityInHand());
						 }
						 
					 }else {
					productList.setQuantityInHand(productsList.getQuantityInHand());
					 }
					productList.setReorderPoint(productsList.getReorderPoint());
					productList.setIsPacked(productsList.getIsPacked());
					productList.setManufacturedItem(productsList.getManufacturedItem());
					productList.setUomLabel(productsList.getUomLabel());
					productList.setMinSaleQty(productsList.getMinSaleQty());
					productList.setStatus(productsList.getStatus());
					productList.setUtility(productsList.getUtility());
					productList.setMeasurementRange(productsList.getMeasurementRange());
					productList.setDepartment(productsList.getDepartment());
					productsLists.add(productList);
				}
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return productsLists;
		
	}
	
	public List<ProductsList> searchProductsWarehouse(String customerIdStr,String emailIdStr,String searchNameStr,String storeLocation,String productCategoryStr,String supplier,boolean supplierFlag){
		String resultStr = null;
	//	SkuServiceProxy skuProxyObj = null;
		RequestBean requestBeanObj = null;
		List<ProductsList> productsLists = new ArrayList<ProductsList>();
		RestfulServiceConnection restfulConnectionObj = null;
		try{
			restfulConnectionObj = new RestfulServiceConnection();
//			skuProxyObj = new SkuServiceProxy();
			requestBeanObj = new RequestBean();
			requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestBeanObj.setSearchCriteria(searchNameStr);
			requestBeanObj.setStartIndex("-1");
			requestBeanObj.setStoreLocation(storeLocation);
			requestBeanObj.setProductCategory(productCategoryStr);
			requestBeanObj.setSupplierId(supplier);
			requestBeanObj.setSupplierCode(supplier);
			requestBeanObj.setProductRestrictions(supplierFlag);
			//////////////////////////System.out.printlnAppProperties.getRESTFulCloudServiceURL("Sku_Service_search_warehouse_products")+"Request String::::"+gson.toJson(requestBeanObj));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Sku_Service_search_warehouse_products"), gson.toJson(requestBeanObj), "GET");
			//resultStr = skuProxyObj.searchProducts(gson.toJson(requestBeanObj));
					
			//////////////////////////System.out.println"Response String::::"+resultStr); 
			ProductsList productsList = new ProductsList();
			
			SearchProductResponse searchProductResponse = gson.fromJson(resultStr,SearchProductResponse.class);
			if (searchProductResponse.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)) {
				for (int i = 0; i < searchProductResponse.getProductsList().length; i++) {
					productsList = searchProductResponse.getProductsList()[i];
					ProductsList productList = new ProductsList();
					if(productsList.getDescription() != null && productsList.getDescription().toLowerCase().contains(searchNameStr.toLowerCase())){
						productList.setDescription(productsList.getDescription());
						productList.setSkuID(productsList.getSkuID());
					}
					else if(productsList.getCategory() != null && productsList.getCategory().toLowerCase().contains(searchNameStr.toLowerCase())){
						productList.setDescription(productsList.getCategory());
						productList.setSkuID(productsList.getSkuID());
					}
					else if (productsList.getSkuID() != null && productsList.getSkuID().toLowerCase().contains(searchNameStr.toLowerCase())) {
						productList.setDescription(productsList.getSkuID());
						productList.setSkuID(productsList.getSkuID());
					}
					else {
						productList.setDescription(productsList.getProductId());
						productList.setSkuID(productsList.getSkuID());
					}
					productList.setPluCode(productsList.getPluCode());
					productList.setPrice(productsList.getPrice());
					productList.setBuy_price(productsList.getBuy_price());
					productList.setProductName(productsList.getProductName());
					productList.setColor(productsList.getColor());
					productList.setEan(productsList.getEan());
					productList.setSize(productsList.getSize());
					productList.setMeasureRange(productsList.getMeasurementRange());
					productList.setQuantity(productsList.getStock());
					productList.setMbq(productsList.getMbq());
					productList.setMrp(productsList.getMrp());
					

					productList.setQuantityInHand(productsList.getQuantityInHand());
					productList.setReorderPoint(productsList.getReorderPoint());
					productList.setIsPacked(productsList.getIsPacked());
					productList.setManufacturedItem(productsList.getManufacturedItem());
					productList.setUomLabel(productsList.getUomLabel());
					productList.setMinSaleQty(productsList.getMinSaleQty());
					productList.setStatus(productsList.getStatus());
					productsLists.add(productList);
				}
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return productsLists;
		
	}
	
	
	public List<ProductsList> searchSupplierWiseProducts(String customerIdStr,String emailIdStr,String searchNameStr,String storeLocation,String productCategoryStr){
		String resultStr = null;
	//	SkuServiceProxy skuProxyObj = null;
		RequestBean requestBeanObj = null;
		List<ProductsList> productsLists = new ArrayList<ProductsList>();
		RestfulServiceConnection restfulConnectionObj = null;
		try{
			// log.info("Get Products based on provided name");
			restfulConnectionObj = new RestfulServiceConnection();
//			skuProxyObj = new SkuServiceProxy();
			requestBeanObj = new RequestBean();
			requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestBeanObj.setSearchCriteria(searchNameStr);
			requestBeanObj.setStartIndex("-1");
//			requestBeanObj.setStoreLocation(storeLocation);
			requestBeanObj.setSupplierCode(storeLocation);
			requestBeanObj.setProductCategory(productCategoryStr);
			// log.info("Request String::::"+gson.toJson(requestBeanObj));
//			////////////////////////////////////////////System.out.println"Request String::::"+gson.toJson(requestBeanObj));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Sku_Service_search_products"), gson.toJson(requestBeanObj), "GET");
			//resultStr = skuProxyObj.searchProducts(gson.toJson(requestBeanObj));
					
			// log.info("Response String::::"+resultStr);
//			////////////////////////////////////////////System.out.println"Response String::::"+resultStr);
			ProductsList productsList = new ProductsList();
			
			SearchProductResponse searchProductResponse = gson.fromJson(resultStr,SearchProductResponse.class);
			if (searchProductResponse.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)) {
				for (int i = 0; i < searchProductResponse.getProductsList().length; i++) {
					productsList = searchProductResponse.getProductsList()[i];
					ProductsList productList = new ProductsList();
					if(productsList.getDescription() != null && productsList.getDescription().toLowerCase().contains(searchNameStr.toLowerCase())){
						productList.setDescription(productsList.getDescription());
						productList.setSkuID(productsList.getSkuID());
					}
					else if(productsList.getCategory() != null && productsList.getCategory().toLowerCase().contains(searchNameStr.toLowerCase())){
						productList.setDescription(productsList.getCategory());
						productList.setSkuID(productsList.getSkuID());
					}
					else if (productsList.getSkuID() != null && productsList.getSkuID().toLowerCase().contains(searchNameStr.toLowerCase())) {
						productList.setDescription(productsList.getSkuID());
						productList.setSkuID(productsList.getSkuID());
					}
					else {
						productList.setDescription(productsList.getProductId());
						productList.setSkuID(productsList.getSkuID());
					}
					productList.setPluCode(productsList.getPluCode());
					productList.setPrice(productsList.getPrice());
					productList.setProductName(productsList.getProductName());
					productList.setColor(productsList.getColor());
					productList.setEan(productsList.getEan());
					productList.setSize(productsList.getSize());
					productList.setMeasureRange(productsList.getMeasurementRange());
					
					productsLists.add(productList);
				}
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return productsLists;
		
	}
	
	
	
	
	public List<ProductsList> searchProductsForAllLocations(String customerIdStr,String emailIdStr,String searchNameStr,String storeLocation,String productCategoryStr,String selectedLocationsList){
		String resultStr = null;
	//	SkuServiceProxy skuProxyObj = null;
		RequestBean requestBeanObj = null;
		List<ProductsList> productsLists = new ArrayList<ProductsList>();
		RestfulServiceConnection restfulConnectionObj = null;
		try{
			// log.info("Get Products based on provided name");
			restfulConnectionObj = new RestfulServiceConnection();
//			skuProxyObj = new SkuServiceProxy();
			requestBeanObj = new RequestBean();
			requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestBeanObj.setSearchCriteria(searchNameStr);
			requestBeanObj.setStartIndex("-1");
			List<String> myList = new ArrayList<String>(Arrays.asList(selectedLocationsList.split(",")));
			requestBeanObj.setLocationsList(myList);
 		//	requestBeanObj.setStoreLocation(storeLocation);
			requestBeanObj.setProductCategory(productCategoryStr);
			// log.info("Request String::::"+gson.toJson(requestBeanObj));
 ////        System.out.println("Request String::::"+gson.toJson(requestBeanObj));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Sku_Service_search_products"), gson.toJson(requestBeanObj), "GET");
			//resultStr = skuProxyObj.searchProducts(gson.toJson(requestBeanObj));
					
			// log.info("Response String::::"+resultStr);
 ////        System.out.println("Response String::::"+resultStr);
			ProductsList productsList = new ProductsList();
			
			SearchProductResponse searchProductResponse = gson.fromJson(resultStr,SearchProductResponse.class);
			if (searchProductResponse.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)) {
				for (int i = 0; i < searchProductResponse.getProductsList().length; i++) {
					productsList = searchProductResponse.getProductsList()[i];
					ProductsList productList = new ProductsList();
					if(productsList.getDescription() != null && productsList.getDescription().toLowerCase().contains(searchNameStr.toLowerCase())){
						productList.setDescription(productsList.getDescription());
						productList.setSkuID(productsList.getSkuID());
					}
					else if(productsList.getCategory() != null && productsList.getCategory().toLowerCase().contains(searchNameStr.toLowerCase())){
						productList.setDescription(productsList.getCategory());
						productList.setSkuID(productsList.getSkuID());
					}
					else if (productsList.getSkuID() != null && productsList.getSkuID().toLowerCase().contains(searchNameStr.toLowerCase())) {
						productList.setDescription(productsList.getSkuID());
						productList.setSkuID(productsList.getSkuID());
					}
					else {
						productList.setDescription(productsList.getProductId());
						productList.setSkuID(productsList.getSkuID());
					}
					productList.setPluCode(productsList.getPluCode());
					productList.setPrice(productsList.getPrice());
					productList.setProductName(productsList.getProductName());
					productList.setColor(productsList.getColor());
					productList.setEan(productsList.getEan());
					productList.setSize(productsList.getSize());
					productList.setMeasureRange(productsList.getMeasurementRange());
					
					productsLists.add(productList);
				}
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return productsLists;
		
	}
	
	
	
	
	
	
	public List<ProductsList> searchProductsForMenu(String customerIdStr,String emailIdStr,String searchNameStr,String storeLocation,String productCategoryStr,String selectedLocationsList){
		String resultStr = null;
	//	SkuServiceProxy skuProxyObj = null;
		RequestBean requestBeanObj = null;
		List<ProductsList> productsLists = new ArrayList<ProductsList>();
		RestfulServiceConnection restfulConnectionObj = null;
		try{
			// log.info("Get Products based on provided name");
			restfulConnectionObj = new RestfulServiceConnection();
//			skuProxyObj = new SkuServiceProxy();
			requestBeanObj = new RequestBean();
			requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestBeanObj.setSearchCriteria(searchNameStr);
			requestBeanObj.setStartIndex("-1");
			/*
			 * List<String> myList = new
			 * ArrayList<String>(Arrays.asList(selectedLocationsList.split(",")));
			 * requestBeanObj.setLocationsList(myList);
			 */
 			requestBeanObj.setStoreLocation(storeLocation);
			requestBeanObj.setProductCategory(productCategoryStr);
			// log.info("Request String::::"+gson.toJson(requestBeanObj));
         //System.out.println("Request String::::"+gson.toJson(requestBeanObj));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Sku_Service_search_warehouse_products"), gson.toJson(requestBeanObj), "GET");
			//resultStr = skuProxyObj.searchProducts(gson.toJson(requestBeanObj));
					
			// log.info("Response String::::"+resultStr);
        // System.out.println("Response String::::"+resultStr);
			ProductsList productsList = new ProductsList();
			
			SearchProductResponse searchProductResponse = gson.fromJson(resultStr,SearchProductResponse.class);
			if (searchProductResponse.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)) {
				for (int i = 0; i < searchProductResponse.getProductsList().length; i++) {
					productsList = searchProductResponse.getProductsList()[i];
					ProductsList productList = new ProductsList();
					if(productsList.getDescription() != null && productsList.getDescription().toLowerCase().contains(searchNameStr.toLowerCase())){
						productList.setDescription(productsList.getDescription());
						productList.setSkuID(productsList.getSkuID());
					}
					else if(productsList.getCategory() != null && productsList.getCategory().toLowerCase().contains(searchNameStr.toLowerCase())){
						productList.setDescription(productsList.getCategory());
						productList.setSkuID(productsList.getSkuID());
					}
					else if (productsList.getSkuID() != null && productsList.getSkuID().toLowerCase().contains(searchNameStr.toLowerCase())) {
						productList.setDescription(productsList.getSkuID());
						productList.setSkuID(productsList.getSkuID());
					}
					else {
						productList.setDescription(productsList.getProductId());
						productList.setSkuID(productsList.getSkuID());
					}
					productList.setPluCode(productsList.getPluCode());
					productList.setPrice(productsList.getPrice());
					productList.setProductName(productsList.getProductName());
					productList.setColor(productsList.getColor());
					productList.setEan(productsList.getEan());
					productList.setSize(productsList.getSize());
					productList.setMeasureRange(productsList.getMeasurementRange());
					
					productsLists.add(productList);
				}
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return productsLists;
		
	}
	
	
	
	
	public List<ProductsList> searchProductsGlobally(String customerIdStr,String emailIdStr,String searchNameStr,String storeLocation,String productCategoryStr){
		String resultStr = null;
	//	SkuServiceProxy skuProxyObj = null;
		RequestBean requestBeanObj = null;
		List<ProductsList> productsLists = new ArrayList<ProductsList>();
		RestfulServiceConnection restfulConnectionObj = null;
		try{
			// log.info("Get Products based on provided name");
			restfulConnectionObj = new RestfulServiceConnection();
//			skuProxyObj = new SkuServiceProxy();
			requestBeanObj = new RequestBean();
			requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestBeanObj.setSearchCriteria(searchNameStr);
			requestBeanObj.setStartIndex("-1");
			requestBeanObj.setStoreLocation(storeLocation);
			requestBeanObj.setProductCategory(productCategoryStr);
			// log.info("Request String::::"+gson.toJson(requestBeanObj));
//			////////////////////////////////////////////System.out.println"Request String::::"+gson.toJson(requestBeanObj));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("search_Product_Globally"), gson.toJson(requestBeanObj), "GET");
			//resultStr = skuProxyObj.searchProducts(gson.toJson(requestBeanObj));
					
			// log.info("Response String::::"+resultStr);
//			////////////////////////////////////////////System.out.println"Response String::::"+resultStr);
			ProductsList productsList = new ProductsList();
			
			SearchProductResponse searchProductResponse = gson.fromJson(resultStr,SearchProductResponse.class);
			if (searchProductResponse.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)) {
				for (int i = 0; i < searchProductResponse.getProductsList().length; i++) {
					productsList = searchProductResponse.getProductsList()[i];
					ProductsList productList = new ProductsList();
					if(productsList.getDescription() != null && productsList.getDescription().toLowerCase().contains(searchNameStr.toLowerCase())){
						productList.setDescription(productsList.getDescription());
						productList.setSkuID(productsList.getSkuID());
					}
					else if(productsList.getCategory() != null && productsList.getCategory().toLowerCase().contains(searchNameStr.toLowerCase())){
						productList.setDescription(productsList.getCategory());
						productList.setSkuID(productsList.getSkuID());
					}
					else if (productsList.getSkuID() != null && productsList.getSkuID().toLowerCase().contains(searchNameStr.toLowerCase())) {
						productList.setDescription(productsList.getSkuID());
						productList.setSkuID(productsList.getSkuID());
					}
					else {
						productList.setDescription(productsList.getProductId());
						productList.setSkuID(productsList.getSkuID());
					}
					productList.setPluCode(productsList.getPluCode());
					productList.setPrice(productsList.getPrice());
					productList.setProductName(productsList.getProductName());
					productList.setColor(productsList.getColor());
					productList.setEan(productsList.getEan());
					productList.setSize(productsList.getSize());
					productList.setMeasureRange(productsList.getMeasurementRange());
					
					productsLists.add(productList);
				}
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return productsLists;
		
	}

	/**
	 * 
	 * @author Chaithanya.V
	 * Created On: 09-aug-2016
	 *  
	 * This method accepts search string storeLocation and productCategory.
	 * It calls the searchProducts method of web service.
	 * It retrieves productList matching search string, productCategory and storeLocation.
	 * 
	 * 
	 */
	public SkuId getProductsByCriteria(String index,String category,String brand,String searchNameStr,String startPriceRange,String endPricRange,String maxRecords){
		String resultStr = null;
		SkuId skuIdBean =new SkuId();
		RequestBean requestBeanObj = null;
		RestfulServiceConnection restfulConnectionObj = null;
		try{
			// log.info("Get Products based on provided name");
			restfulConnectionObj = new RestfulServiceConnection();
			requestBeanObj = new RequestBean();
			requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestBeanObj.setInitialRecord("0");
			requestBeanObj.setBrandCode(brand);
			requestBeanObj.setCategoryId(category);
			requestBeanObj.setStartPriceRange(startPriceRange);
			requestBeanObj.setEndPricRange(endPricRange);
			requestBeanObj.setMaxRecords(maxRecords);
			// log.info("Request String::::"+gson.toJson(requestBeanObj));
			////////////////////////////////////////////System.out.println"Request String::::"+gson.toJson(requestBeanObj));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_products_criteria"), gson.toJson(requestBeanObj), "GET");
			// log.info("Response String::::"+resultStr);
			//////////////////////////////////////////System.out.println"Response String::::"+resultStr);
			 skuIdBean = gson.fromJson(resultStr,SkuId.class);
			if (skuIdBean.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)) {
				skuIdBean= gson.fromJson(resultStr, SkuId.class);	
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return skuIdBean;
		
	}
	
	
	
	
	/**
	 * 
	 * @author vijay
	 * Created On: 11-12-2017
	 *  
	 * This method accepts search string storeLocation and productCategory.
	 * It calls the searchProducts method of web service.
	 * It retrieves productList matching search string, productCategory and storeLocation.
	 * 
	 * 
	 */
	public SkuId getallStockRequestProductsByCriteria(String index,String storeLocation,String category, String subCategory,String Brand){
		String resultStr = null;
		SkuId skuIdBean =new SkuId();
		RequestBean requestBeanObj = null;
		RestfulServiceConnection restfulConnectionObj = null;
		try{
			// log.info("Get Products based on provided name");
			restfulConnectionObj = new RestfulServiceConnection();
			requestBeanObj = new RequestBean();
			requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestBeanObj.setStartIndex("0");
			requestBeanObj.setProductCategory(category);
			requestBeanObj.setMaxRecords("");
			requestBeanObj.setNotForDownload(true);
			requestBeanObj.setStoreLocation(storeLocation);
			requestBeanObj.setSubCategory(subCategory);
			requestBeanObj.setSupplierName("");
			requestBeanObj.setDepartment("");
			requestBeanObj.setBrandCode(Brand);
			requestBeanObj.setBrand(Brand);
			requestBeanObj.setStatus("");
			
			// log.info("Request String::::"+gson.toJson(requestBeanObj));
			//////////////////////////////////////////////System.out.printlngson.toJson(requestBeanObj));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Sku_Service_get_SKU_details"), gson.toJson(requestBeanObj), "GET");

			//////////////////////////////////////////////System.out.printlnresultStr);

			skuIdBean = gson.fromJson(resultStr,SkuId.class);
			if (skuIdBean.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)) {
				skuIdBean= gson.fromJson(resultStr, SkuId.class);	
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return skuIdBean;
		
	}
	
	/**
	 * 
	 * @author Chaithanya.V
	 * Created On: 09-aug-2016
	 *  
	 * This method accepts search string storeLocation and productCategory.
	 * It calls the searchProducts method of web service.
	 * It retrieves productList matching search string, productCategory and storeLocation.
	 * 
	 * 
	 */
	public SearchProductResponse getallProductsByCriteria(String index,String storeLocation,String category){
		String resultStr = null;
		SearchProductResponse skuIdBean =new SearchProductResponse();
		RequestBean requestBeanObj = null;
		RestfulServiceConnection restfulConnectionObj = null;
		try{
			// log.info("Get Products based on provided name");
			restfulConnectionObj = new RestfulServiceConnection();
			requestBeanObj = new RequestBean();
			requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestBeanObj.setStartIndex("-1");
			requestBeanObj.setProductCategory(category);
			//requestBeanObj.setMaxRecords("50");
			requestBeanObj.setCategory(category);
			requestBeanObj.setNotForDownload(true);
			requestBeanObj.setStoreLocation(storeLocation);
			// log.info("Request String::::"+gson.toJson(requestBeanObj));
			//////////////////////////////////////////////System.out.println"Request String::::"+gson.toJson(requestBeanObj));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Sku_PriceList"), gson.toJson(requestBeanObj), "GET");
			//// log.info("Response String::::"+resultStr);
			//////////////////////////////////////////////System.out.println"Response String::::"+resultStr);
			 skuIdBean = gson.fromJson(resultStr,SearchProductResponse.class);
			if (skuIdBean.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)) {
				skuIdBean= gson.fromJson(resultStr, SearchProductResponse.class);	
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return skuIdBean;
		
	}
	/**
	 * 
	 * @author Chaithanya.V
	 * Created On: 09-aug-2016
	 *  
	 * This method accepts search string storeLocation and productCategory.
	 * It calls the searchProducts method of web service.
	 * It retrieves productList matching search string, productCategory and storeLocation.
	 * 
	 * 
	 */
	public SearchProductResponse filterItemsByCriteria(String category,String subcategory,String brand,String section,String department,String subdepartment){
		String resultStr = null;
		SearchProductResponse skuIdBean =new SearchProductResponse();
		RequestBean requestBeanObj = null;
		RestfulServiceConnection restfulConnectionObj = null;
		try{
			restfulConnectionObj = new RestfulServiceConnection();
			requestBeanObj = new RequestBean();
			requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestBeanObj.setInitialRecord("0");
			requestBeanObj.setBrandCode(brand);
			requestBeanObj.setCategoryId(category);
			requestBeanObj.setMaxRecords("-1");
			requestBeanObj.setSubCategory(subcategory);
			// log.info("Request String::::"+gson.toJson(requestBeanObj));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_products_criteria"), gson.toJson(requestBeanObj), "GET");
			
			 skuIdBean = gson.fromJson(resultStr,SearchProductResponse.class);
			if (skuIdBean.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)) {
				skuIdBean= gson.fromJson(resultStr, SearchProductResponse.class);	
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return skuIdBean;
		
	}
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 17-aug-2015
	 *  
	 * This method accepts skuId and storeLocation.
	 * It calls the getSkuDetails method of web service.
	 * It retrieves sku details based on the given skuId and storeLocation.
	 * @param warehouseReturnflag 
	 * 
	 * 
	 */
	public String getSkuDetails(String customerIdStr,String emailIdStr,String skuIdStr,String storeLocationStr, String warehouseReturnflag,String b2crequired){
		String resultStr = null;
		RequestBean requestBeanObj = null;
		RestfulServiceConnection restfulConnectionObj = null;
		try{
			// log.info("Get Sku based on provided name");
			restfulConnectionObj = new RestfulServiceConnection();
			requestBeanObj = new RequestBean();
			requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestBeanObj.setSkuId(skuIdStr);
			
		    if(b2crequired.equalsIgnoreCase("YES")) {
		    requestBeanObj.setStoreLocation("B2C");	
		    requestBeanObj.setNearestStoreLocation(storeLocationStr);
		    }else {
		    	requestBeanObj.setStoreLocation(storeLocationStr);
		    }
			
			requestBeanObj.setStartIndex(Constants.PAGINATION_START_INDEX);
			requestBeanObj.setZeroStockCheckAtOutletLevel(true);
			if(!warehouseReturnflag.equalsIgnoreCase("")) {
				requestBeanObj.setWHShipmentSearch(true);
			}
			
			// log.info("Request String::::"+gson.toJson(requestBeanObj));
////		System.out.println("getsku Request String::::"+gson.toJson(requestBeanObj));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Sku_Service_get_sku_details"), gson.toJson(requestBeanObj), "GET");
			// log.info("Response String::::"+resultStr);
////		System.out.println("getSku Response String::::"+resultStr);
			requestBeanObj = gson.fromJson(resultStr,RequestBean.class);
			if(requestBeanObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
			   return resultStr;
			}else{
			   return "";
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			return resultStr;
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
			return resultStr;
		}
	}
	
	
	public String getSkuDetailsForOffeers(String customerIdStr,String emailIdStr,String skuIdStr,String storeLocationStr){
		String resultStr = null;
		RequestBean requestBeanObj = null;
		RestfulServiceConnection restfulConnectionObj = null;
		try{
			// log.info("Get Sku based on provided name");
			restfulConnectionObj = new RestfulServiceConnection();
			requestBeanObj = new RequestBean();
			requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestBeanObj.setSkuId(skuIdStr);
			List<String> myList = new ArrayList<String>(Arrays.asList(storeLocationStr.split(",")));
			requestBeanObj.setLocationsList(myList);
			if(storeLocationStr.equals(""))
				requestBeanObj.setLocationsList(null);
//			requestBeanObj.setStoreLocation(storeLocationStr);
			requestBeanObj.setStartIndex(Constants.PAGINATION_START_INDEX);
			requestBeanObj.setZeroStockCheckAtOutletLevel(true);
			// log.info("Request String::::"+gson.toJson(requestBeanObj));
			//////////////////////////////////////////////System.out.println"Request String::::"+gson.toJson(requestBeanObj));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Sku_Service_get_SKU_details"), gson.toJson(requestBeanObj), "GET");
			// log.info("Response String::::"+resultStr);
			//////////////////////////////////////////System.out.println"Sku Response String:::: offers"+resultStr);
			requestBeanObj = gson.fromJson(resultStr,RequestBean.class);
			if(requestBeanObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
			   return resultStr;
			}else{
			   return "";
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			return resultStr;
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
			return resultStr;
		}
	}
	
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 2-aug-2015
	 * 
	 * This method is used to call createSKU method of web service and return the response
	 * This method accepts all the details of the sku need to be saved into database.
	 * 
	 * 
	 *
	 **/
	public String createSku(Sku obj_SkuMasterBean,String customerId,String emailId){
		String result = null;
		try {
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			obj_SkuMasterBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String::::::::::::"+gson.toJson(obj_SkuMasterBean));
			/*List<SkuPriceList> mainList = new ArrayList<SkuPriceList>();
			mainList.addAll(obj_SkuMasterBean.getSkuPriceLists());
			
			
				String Str1=mainList.get(0).getEan();
				String last = Str1.substring(Str1.lastIndexOf(',') + 1);
				//////////////////////////////////////////System.out.printlnlast);
				
				List<String> myList1 = new ArrayList<String>(Arrays.asList(Str1.split(",")));
				obj_SkuMasterBean.setMultipleEAN(myList1);
				obj_SkuMasterBean.setEan(last);
				
				for(int i=0;i<mainList.size();i++){
					String Str2=mainList.get(i).getEan();
					String last2 = Str2.substring(Str2.lastIndexOf(',') + 1);
					mainList.get(i).setEan(last2);
				}
				
				
				
				
				//mainList.get(i).setMultipleEAN(myList1);
			
			obj_SkuMasterBean.getSkuPriceLists().clear();
			obj_SkuMasterBean.getSkuPriceLists().addAll(mainList);*/
			//System.out.println("Request String::::::::::::"+gson.toJson(obj_SkuMasterBean));
			result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("Sku_Service_create_SKU_details"), gson.toJson(obj_SkuMasterBean));
			//////////////////////System.out.println"response String"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("SKU_CREATE_SUCCESS").trim();
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
	
	

	public PriceHistory updateBulkPriceDetails(String filePath,String customerId,String emailId){
		String result = null;
		PriceHistory priceHistory = new PriceHistory();
		MasterDataImportsAndExportsBean masterDataImportsAndExportsBean=new MasterDataImportsAndExportsBean();
		try {
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			masterDataImportsAndExportsBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			masterDataImportsAndExportsBean.setUploadedfilePath(filePath);
			// log.info("Request String::::::::::::"+gson.toJson(masterDataImportsAndExportsBean));
//			////////////////////////////////////////////System.out.println"Request String::::::::::::"+gson.toJson(masterDataImportsAndExportsBean));
			masterDataImportsAndExportsBean.setStartDate(DateUtil.getDateFromYYYYMMDDHHMMSS(new Date()));
			result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("upload_Pricing"), gson.toJson(masterDataImportsAndExportsBean),"POST");
			// log.info("Response String:::::::::::"+result);
//			////////////////////////////////////////////System.out.println"Response String:::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			priceHistory = gson.fromJson(result,PriceHistory.class);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())  || responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_EXEL_IMPORT_PARTIAL_SUCCESS_CODE").trim()) )
			{
				masterDataImportsAndExportsBean.setEndDate(DateUtil.getDateFromYYYYMMDDHHMMSS(new Date()));
//				////////////////////////////////////////////System.out.println"Request String::::::::::::"+gson.toJson(masterDataImportsAndExportsBean));
				String getResult = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Sku_Service_Get_Price_History_Details"), gson.toJson(masterDataImportsAndExportsBean),"GET");
				priceHistory = gson.fromJson(getResult,PriceHistory.class);
				priceHistory.getResponseHeader().setResponseCode(responseCode);
				priceHistory.getResponseHeader().setResponseMessage( Response.getResponseMessage(result));
			}
			else{
			    priceHistory.getResponseHeader().setResponseCode(responseCode);
				priceHistory.getResponseHeader().setResponseMessage(Response.getResponseMessage(result));
			}
			
			
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();

		}
		return priceHistory;
	}
	
	
	
	/*
	public String updateBulkPriceDetails(String filePath,String customerId,String emailId){
		String result = null;
		PriceHistory priceHistory = new PriceHistory();
		MasterDataImportsAndExportsBean masterDataImportsAndExportsBean=new MasterDataImportsAndExportsBean();
		try {
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			masterDataImportsAndExportsBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			masterDataImportsAndExportsBean.setUploadedfilePath(filePath);
			// log.info("Request String::::::::::::"+gson.toJson(masterDataImportsAndExportsBean));
//			////////////////////////////////////////////System.out.println"Request String::::::::::::"+gson.toJson(masterDataImportsAndExportsBean));
			masterDataImportsAndExportsBean.setStartDate(DateUtil.getDateFromYYYYMMDDHHMMSS(new Date()));
			result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("upload_Pricing"), gson.toJson(masterDataImportsAndExportsBean),"POST");
			// log.info("Response String:::::::::::"+result);
			
			////////////////////////////////////////////System.out.println"Response String:::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()) )
			{
				result = AppProperties.getAppMessageByProperty("RM_SUCCESS").trim();
			}
			else if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_EXEL_IMPORT_PARTIAL_SUCCESS_CODE").trim()) )
			{
				result = Response.getResponseMessage(result);
			}
			else{
				result = Response.getResponseMessage(result);
			}
			
			
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();

		}
		return result;
	}

	*/
	
	public PriceHistory getBulkPriceDetails(String filePath,String customerId,String emailId){
		String result = null;
		PriceHistory priceHistory = new PriceHistory();
		String responseCode = null;
		MasterDataImportsAndExportsBean masterDataImportsAndExportsBean=new MasterDataImportsAndExportsBean();
		try {
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			masterDataImportsAndExportsBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			masterDataImportsAndExportsBean.setUploadedfilePath(filePath);
			// log.info("Request String::::::::::::"+gson.toJson(masterDataImportsAndExportsBean));
			masterDataImportsAndExportsBean.setStartDate(DateUtil.getDateFromYYYYMMDDHHMMSS(new Date()));
			masterDataImportsAndExportsBean.setEndDate(DateUtil.getDateFromYYYYMMDDHHMMSS(new Date()));
			////System.out.println("Request String::::::::::::"+gson.toJson(masterDataImportsAndExportsBean));
			result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Sku_Service_Get_Price_History_Details"), gson.toJson(masterDataImportsAndExportsBean),"GET");
			// log.info("Response String:::::::::::"+result);
//			////////////////////////////////////////////System.out.println"get Response String:::::::::::"+result);
				responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				{	
					priceHistory = gson.fromJson(result,PriceHistory.class);
				}
			
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();

		}
		return priceHistory;
	}
	
	/**
	 * @author Mythri.S	
	 * Created On: 5-aug-2015
	 * 
	 * This method is used to call the getSKUDetails method of web service and return the Sku List.
	 * The images if present with the given skuId, we get those a byte[].
	 * This method encodes the byte[] into base64 string, which is used to display the image in browser.
	 * 
	 */
	public List<Sku> getSKUDetails(String skuID,String cid,String emailId,String index,String maxRecords,String location,String productCategory,String subcategory,String brand,String department,String supplierid,String status,String searchNameStr,String zone){
		String result = null;
		RequestHeader requestHeaderObj = null;
		List<Sku> list_SkuMasterBean = null;
		try {
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			Sku obj_SkuMasterBean = new Sku();
			if(skuID != null)
				obj_SkuMasterBean.setSkuId(skuID);
			obj_SkuMasterBean.setMaxRecords(maxRecords);
			obj_SkuMasterBean.setStartIndex(index);
			obj_SkuMasterBean.setStoreLocation(location);
			obj_SkuMasterBean.setProductCategory(productCategory);
			obj_SkuMasterBean.setSubCategory(subcategory);
			obj_SkuMasterBean.setSupplierName(supplierid);
			obj_SkuMasterBean.setDepartment(department);
			obj_SkuMasterBean.setBrandCode(brand);
			obj_SkuMasterBean.setStatus(status);
			obj_SkuMasterBean.setZoneID(zone);
			
			if(!searchNameStr.equals(""));
			obj_SkuMasterBean.setSearchCriteria(searchNameStr);
			obj_SkuMasterBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String:::::::"+gson.toJson(obj_SkuMasterBean));
			
			
		//	System.out.println("Request String::::edit:::"+gson.toJson(obj_SkuMasterBean));
			
			result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Sku_Service_get_SKU_details"), gson.toJson(obj_SkuMasterBean), "GET");
			// log.info("Response String:::::::"+result);
			
       //    System.out.println("SKU Response String:::edit::::"+result);
            
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				if(skuID != null){
					String skuResponse = Response.getResponseList(result, "skuDetails");
					obj_SkuMasterBean = gson.fromJson(skuResponse, Sku.class);
					list_SkuMasterBean = new ArrayList<Sku>();
					if(skuID != null){
						Set<String> productRangeList = new HashSet<String>();
						Set<String> measurementRangeList = new HashSet<String>();
						Set<String> sizeRangeList = new HashSet<String>();
						Set<String> colourRangeList = new HashSet<String>();
						Set<String> utilityRangeList=new HashSet<String>();
						Set<String> batchRangeList=new HashSet<String>();
						Set<String> selectedLocationsList = new HashSet<String>();
						Set<String> styleRangeList = new HashSet<String>();
						if(obj_SkuMasterBean.getSkuPriceLists() != null)
							for(SkuPriceList skuPriceList : obj_SkuMasterBean.getSkuPriceLists()){
								if(skuPriceList.getProductRange() != null && !skuPriceList.getProductRange().equals(""))
									productRangeList.add(skuPriceList.getProductRange());
								if(skuPriceList.getMeasureRange() != null && !skuPriceList.getMeasureRange().equals(""))
									measurementRangeList.add(skuPriceList.getMeasureRange());
								if(skuPriceList.getSize() != null && !skuPriceList.getSize().equals(""))
									sizeRangeList.add(skuPriceList.getSize());
								if(skuPriceList.getColor() != null && !skuPriceList.getColor().equals(""))
									colourRangeList.add(skuPriceList.getColor());
								if(skuPriceList.getUtility() != null && !skuPriceList.getUtility().equals(""))
									utilityRangeList.add(skuPriceList.getUtility());
								if(skuPriceList.getProductBatchNo() != null && !skuPriceList.getProductBatchNo().equals(""))
									batchRangeList.add(skuPriceList.getProductBatchNo());
								if(skuPriceList.getStyleRange() != null && !skuPriceList.getStyleRange().equals(""))
									styleRangeList.add(skuPriceList.getStyleRange());
								selectedLocationsList.add(skuPriceList.getStoreLocation());
							skuPriceList.setStoreLocationId(skuPriceList.getStoreLocation().replaceAll(" ", "_"));
							/*if(skuPriceList.getNewSalePrice() != null && !skuPriceList.getNewSalePrice().equals(""))
								skuPriceList.setNewSalePrice(skuPriceList.getSalePrice());*/
							
						   /*  saleprice=skuPriceList.getSalePrice();
							 costPrice=skuPriceList.getCostPrice();
							 totalValue=saleprice-costPrice;
							skuPriceList.setProfitability(totalValue);*/
							}
						obj_SkuMasterBean.setProductRangeList(productRangeList);
						obj_SkuMasterBean.setMeasurementRangeList(measurementRangeList);
						obj_SkuMasterBean.setSizeRangeList(sizeRangeList);
						obj_SkuMasterBean.setColourRangeList(colourRangeList);
						obj_SkuMasterBean.setUtilityRangeList(utilityRangeList);
						obj_SkuMasterBean.setBatchRangeList(batchRangeList);
					obj_SkuMasterBean.setSelectedLocationsList(selectedLocationsList);
					obj_SkuMasterBean.setStyleRangeList(styleRangeList);
				
//						String encodedImage = "";
						/*if(obj_SkuMasterBean.getPicture1() != null && obj_SkuMasterBean.getPicture1().length != 0){
							encodedImage = Base64.encode(obj_SkuMasterBean.getPicture1());
						}
						obj_SkuMasterBean.setStrPicture1(encodedImage);
						encodedImage = "";
						if(obj_SkuMasterBean.getPicture2() != null && obj_SkuMasterBean.getPicture2().length != 0){
							encodedImage = Base64.encode(obj_SkuMasterBean.getPicture2());
						}
						obj_SkuMasterBean.setStrPicture2(encodedImage);
						encodedImage = "";
						if(obj_SkuMasterBean.getPicture3() != null && obj_SkuMasterBean.getPicture3().length != 0){
							encodedImage = Base64.encode(obj_SkuMasterBean.getPicture3());
						}*/
//						obj_SkuMasterBean.setStrPicture3(encodedImage);
				
						/*List<Products> productList = outletMasterServiceObj.getProducts("", emailId,obj_SkuMasterBean.getProductId(),"0","","","");
					
						if(productList != null && productList.size() > 0){
							obj_SkuMasterBean.setProductName(productList.get(0).getProductName());
							obj_SkuMasterBean.setCategoryName(productList.get(0).getCategoryDescription());
							obj_SkuMasterBean.setSubCategoryName(productList.get(0).getSubCategoryDescription());
							obj_SkuMasterBean.setCategoryId(productList.get(0).getCategory());
						}*/
					/*	List<Suppliers> supplierList =(List<Suppliers>)request.getSession().getAttribute("suppliers");
						if(supplierList==null || supplierList.size()==0 || supplierList.isEmpty()){
							 supplierList = outletMasterServiceObj.getSuppliers(customerId, emailId,"-1");
							request.getSession().setAttribute("supplierList", supplierList);
						}
						List<SupplierBean> suppliersList = outletMasterServiceObj.searchSuppliers(customerId, emailId,obj_SkuMasterBean.getSupplierName(),"0");
						if(suppliersList != null && suppliersList.size() > 0)
							obj_SkuMasterBean.setSupplier(suppliersList.get(0).getFirmName());*/
					}
					list_SkuMasterBean.add(obj_SkuMasterBean);
//					////////////////////////////////////////////System.out.println"dgsdgs");
				}
				else{
					String responseList = Response.getResponseList(result, "skuList");
					JSONArray jsonResponseArray = new JSONArray(responseList);
					list_SkuMasterBean = new ArrayList<Sku>();
					int slNo = Integer.parseInt(index);
					for (int i=0; i<jsonResponseArray.length(); i++) {
						obj_SkuMasterBean = gson.fromJson(jsonResponseArray.getString(i), Sku.class);
						obj_SkuMasterBean.setSlNo(++slNo);
						list_SkuMasterBean.add(obj_SkuMasterBean);
					}
					list_SkuMasterBean.get(0).setTotalRecords(Response.getResponseTotalRecords(result));
				}
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return list_SkuMasterBean;
	}
	
	
	
	
	public PriceHistory getForPriceSKUDetails(String index,String maxRecords,String location,String searchNameStr,String locationsListValue,String startDate, String endDate,String category,String subCategory, String brand,String zone){
		String result = null;
		PriceHistory obj_SkuMasterBean = new PriceHistory();
		try {
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();

			PriceHistory priceHistory = new PriceHistory();
			priceHistory.setMaxRecords(maxRecords);
			priceHistory.setStartIndex(index);
			
			priceHistory.setBrand(brand);
			priceHistory.setCategory(category);
			priceHistory.setSubCategory(subCategory);
			priceHistory.setStartDate(startDate);
			priceHistory.setEndDate(endDate);
			priceHistory.setZoneId(zone);
			if(location.equals("all") || location.equals("") && locationsListValue.trim() !=""){
				List<String> myList = new ArrayList<String>(Arrays.asList(locationsListValue.split(",")));
				priceHistory.setLocationsList(myList);
			}
			else
				priceHistory.setStore_location(location);

			if(!searchNameStr.equals(""))
				priceHistory.setSearchCriteria(searchNameStr);
			priceHistory.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			// log.info("Request String:::::::"+gson.toJson(priceHistory));
		   //System.out.println(gson.toJson(priceHistory));
			result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Sku_Service_Get_Price_History"), gson.toJson(priceHistory), "GET");
			// log.info("Response String:::::::"+result);
//			////////////////////////////////////////////System.out.println"SKU Response String:::::::"+result);

			obj_SkuMasterBean = gson.fromJson(result, PriceHistory.class);
			if(obj_SkuMasterBean.getResponseHeader().getResponseCode().equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
			{
				return obj_SkuMasterBean;

			}


		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return obj_SkuMasterBean;
	}

	
	/**
	 * 
	 * This method is used to call updateSKU method of web service and return the response.
	 * This method accepts all the sku details and sends it to web service for updating the skuId.
	 * It returns a string based on the successful update or not.
	 *
	 **/
	public String updateSku(Sku obj_SkuMasterBean,String customerId,String emailId){
		String result = null;
		try {
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			obj_SkuMasterBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			  Set<String> myList2 = null;
	///		System.out.println("Request String::::::::::::"+gson.toJson(obj_SkuMasterBean));
			List<SkuPriceList> mainList = new ArrayList<SkuPriceList>();
			mainList.addAll(obj_SkuMasterBean.getSkuPriceLists());
			obj_SkuMasterBean.getSkuPriceLists().clear();
	///		System.out.println(gson.toJson(obj_SkuMasterBean.getSkuPriceLists()));
			////////System.out.println(gson.toJson(mainList));
			
			for(int i=0;i<mainList.size();i++){
				String Str1=mainList.get(i).getEanduplicate();
				String loc =mainList.get(i).getStoreLocation();
				List<String> myList1 = new ArrayList<String>();
				
				if(Str1 != "" ){
				
				myList1.addAll(Arrays.asList(Str1.split(",")));
				}
				
				
				/*
				 * myList2 = new LinkedHashSet<String>(myList1); List<String> aList = new
				 * ArrayList<String>(myList2);
				 */
				
				 mainList.get(i).setMultipleEAN(myList1);
				
		//		String[] eanpl = Str1.split(","); 
				
				/*if(mainList.get(i).getEan().equals("") || mainList.get(i).getEan() == "") {*/
				if((mainList.get(i).getMultipleEAN() != null && mainList.get(i).getMultipleEAN().size()>0)){
				//mainList.get(i).setEan(mainList.get(i).getMultipleEAN().get(mainList.get(i).getMultipleEAN().size()-1));
					
			} /*
				 * else { mainList.get(i).setEan(obj_SkuMasterBean.getEan()); }
				 */
			/* } */
			}
			
			
			/*
			 * myList2 = new LinkedHashSet<String>(myList1); List<String> aList = new
			 * ArrayList<String>(myList2); obj_SkuMasterBean.setMultipleEAN(aList);
			 */
			
			//int last = aList.size()-1;
			//obj_SkuMasterBean.setEan(aList.get(last));
			
			obj_SkuMasterBean.getSkuPriceLists().addAll(mainList);
			
			/*
			List<SkuPriceList> mainList = new ArrayList<SkuPriceList>();
			mainList.addAll(obj_SkuMasterBean.getSkuPriceLists());
			
			
				String Str1=mainList.get(0).getEan();
				String last = Str1.substring(Str1.lastIndexOf(',') + 1);
				//////////////////////////////////////////System.out.printlnlast);
				
				List<String> myList1 = new ArrayList<String>(Arrays.asList(Str1.split(",")));
				obj_SkuMasterBean.setMultipleEAN(myList1);
				obj_SkuMasterBean.setEan(last);
				
				for(int i=0;i<mainList.size();i++){
					String Str2=mainList.get(i).getEan();
					String last2 = Str2.substring(Str2.lastIndexOf(',') + 1);
					mainList.get(i).setEan(last2);
				}
				
				//mainList.get(i).setMultipleEAN(myList1);
			
			obj_SkuMasterBean.getSkuPriceLists().clear();
			obj_SkuMasterBean.getSkuPriceLists().addAll(mainList);*/
			// log.info("Request String::::::::::::"+gson.toJson(obj_SkuMasterBean));
		   //System.out.println("Request String::::edit sku::::::::"+gson.toJson(obj_SkuMasterBean));
			result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("Sku_Service_update_SKU_details"), gson.toJson(obj_SkuMasterBean));
			// log.info("Response String:::::::::::"+result);
          //System.out.println("Response String::::edit sku:::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("SKU_UPDATE_SUCCESS").trim();
			}
			else{
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
	
	/**
	 * 
	 * This method is used to call updateQuickEditSKU method of web service and return the response.
	 * This method accepts all the sku details and sends it to web service for updating the skuId.
	 * It returns a string based on the successful update or not.
	 *
	 **/
	public String quickEditSku(Sku obj_SkuMasterBean,String customerId,String emailId){
		String result = null;
		try {
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			obj_SkuMasterBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			////////////System.out.println("Request String::::::::::::"+gson.toJson(obj_SkuMasterBean));
			result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("Sku_Service_quickEditSKU_details"), gson.toJson(obj_SkuMasterBean));
			//////////////////////////////////////////System.out.println"Response String:::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("SKU_UPDATE_SUCCESS").trim();
			}
			else{
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

	
	
	/**
	 * Manasa.P
	 * Creted_On: 5-12-17
	 * This method is used to call updateSKUPrice method of web service and return the response.
	 * This method accepts all the sku price details and sends it to web service for updating.
	 * It returns a string based on the successful update or not.
	 *
	 **/
	public String updateSkuPrice(Sku obj_SkuMasterBean,String customerId,String emailId){
		String result = null;
		try {
		
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			/*if(obj_SkuMasterBean.getStoreLocation().equals("all") || obj_SkuMasterBean.getStoreLocation().equals("")){
			List<String> myList = new ArrayList<String>(Arrays.asList(obj_SkuMasterBean.getLocationList().split(",")));
			for(int i=0;i<obj_SkuMasterBean.getPriceDetails().size();i++){
			obj_SkuMasterBean.getPriceDetails().get(i).setPriceLocationList(myList);
			obj_SkuMasterBean.getPriceDetails().get(i).setStoreLocation(null);
			}
			}	
			obj_SkuMasterBean.setLocationList(null);*/
			obj_SkuMasterBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String::::::::::::"+gson.toJson(obj_SkuMasterBean));
			////////////////////////////////////////System.out.println"price Request String::::::::::::"+gson.toJson(obj_SkuMasterBean));
			if(obj_SkuMasterBean.getFlow() == "warehouse" || obj_SkuMasterBean.getFlow().equalsIgnoreCase("warehouse")){

				result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_WHSKU_Price"), gson.toJson(obj_SkuMasterBean));
				
				
			}else{
				result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_Sku_Price"), gson.toJson(obj_SkuMasterBean));
			}// log.info("Response String:::::::::::"+result);
			////////////////////////////////////////System.out.println"Response String:::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("PRICE_UPDATE_SUCCESS").trim();
			}
			else{
				result = Response.getResponseMessage(result);
			}
		}catch(ConnectException ce) 
		{
			ce.printStackTrace();
			result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		} 
		catch (NoSuchElementException nse)
		{
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}
		 catch (UnknownHostException uhe) 
		{
		    uhe.printStackTrace();
			result = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
		} 
		catch(FileNotFoundException fnf)
		{
			fnf.printStackTrace();
			result = AppProperties.getAppMessageByProperty("FILE_NOT_FOUND").trim();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			result = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return result;
	}
	
	
	
	
	
	/**
	 * Manasa.P
	 * Creted_On: 28-09-17
	 * This method is used to call updateWarehouseQuantity method of web service and return the response.
	 * This method accepts all the sku price details and sends it to web service for updating.
	 * It returns a string based on the successful update or not.
	 *
	 **/
	public String updateStocks(WareHouseSku obj_SkuMasterBean,String customerId,String emailId){
		String result = null;
		try {
		
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			/*if(obj_SkuMasterBean.getStoreLocation().equals("all") || obj_SkuMasterBean.getStoreLocation().equals("")){
			List<String> myList = new ArrayList<String>(Arrays.asList(obj_SkuMasterBean.getLocationList().split(",")));
			for(int i=0;i<obj_SkuMasterBean.getPriceDetails().size();i++){
			obj_SkuMasterBean.getPriceDetails().get(i).setPriceLocationList(myList);
			obj_SkuMasterBean.getPriceDetails().get(i).setStoreLocation(null);
			}
			}	
			obj_SkuMasterBean.setLocationList(null);*/
			obj_SkuMasterBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String::::::::::::"+gson.toJson(obj_SkuMasterBean));
      ////////////////////////////////////////System.out.println"stock update Request String::::::::::::"+gson.toJson(obj_SkuMasterBean));
			result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_Warehouse_Quantity"), gson.toJson(obj_SkuMasterBean));
			// log.info("Response String:::::::::::"+result);
//			////////////////////////////////////////////System.out.println"Response String:::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("STOCK_UPDATED_SUCCESSFULLY").trim();
			}
			else{
				result = Response.getResponseMessage(result);
			}
		}catch(ConnectException ce) 
		{
			ce.printStackTrace();
			result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		} 
		catch (NoSuchElementException nse)
		{
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}
		 catch (UnknownHostException uhe) 
		{
		    uhe.printStackTrace();
			result = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
		} 
		catch(FileNotFoundException fnf)
		{
			fnf.printStackTrace();
			result = AppProperties.getAppMessageByProperty("FILE_NOT_FOUND").trim();
		}
		catch(IOException ie)
		{
			ie.printStackTrace();
			result = AppProperties.getAppMessageByProperty("IOE_NOT_FOUND").trim();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			result = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return result;
	}
	
	
	
	
	
	
	/**
	 * Manasa.P
	 * Creted_On: 28-09-17
	 * This method is used to call updateWarehouseQuantity method of web service and return the response.
	 * This method accepts all the sku price details and sends it to web service for updating.
	 * It returns a string based on the successful update or not.
	 *
	 **/
	public String updateOutletStock(Sku obj_SkuMasterBean,String customerId,String emailId){
		String result = null;
		try {
		
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			/*if(obj_SkuMasterBean.getStoreLocation().equals("all") || obj_SkuMasterBean.getStoreLocation().equals("")){
			List<String> myList = new ArrayList<String>(Arrays.asList(obj_SkuMasterBean.getLocationList().split(",")));
			for(int i=0;i<obj_SkuMasterBean.getPriceDetails().size();i++){
			obj_SkuMasterBean.getPriceDetails().get(i).setPriceLocationList(myList);
			obj_SkuMasterBean.getPriceDetails().get(i).setStoreLocation(null);
			}
			}	
			obj_SkuMasterBean.setLocationList(null);*/
//			////////////////////////////////////////////System.out.println"fdgvbdfx");
			obj_SkuMasterBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//////////////////////////////////////////System.out.println"stock update Request String::::::::::::"+gson.toJson(obj_SkuMasterBean));
			result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_Outlet_SKU_Quantity"), gson.toJson(obj_SkuMasterBean));
//			////////////////////////////////////////////System.out.println"Response String:::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("STOCK_UPDATED_SUCCESSFULLY").trim();
			}
			else{
				result = Response.getResponseMessage(result);
			}
		}catch(ConnectException ce) 
		{
			ce.printStackTrace();
			result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		} 
		catch (NoSuchElementException nse)
		{
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}
		 catch (UnknownHostException uhe) 
		{
		    uhe.printStackTrace();
			result = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
		} 
		catch(FileNotFoundException fnf)
		{
			fnf.printStackTrace();
			result = AppProperties.getAppMessageByProperty("FILE_NOT_FOUND").trim();
		}
		catch(IOException ie)
		{
			ie.printStackTrace();
			result = AppProperties.getAppMessageByProperty("IOE_NOT_FOUND").trim();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			result = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return result;
	}
	
	/**
	 * @author Mythri.S	
	 * Created On: 8-aug-2015
	 * 
	 * 
	 * This method is used to call the deleteSku method of web service and return the response.
	 * This method accepts a List of skuIds need to be deleted.
	 * 
	 * 
	 */
	public String deleteSku(String customerId,String emailId,String ids){
		String result = null;
		String responseCode = null;
		try {
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			String[] idsArray = ids.split(",");
			Sku skuMaster = new Sku();
			skuMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			List<String> skuIds = new ArrayList<String>();
			for(int i=0;i<idsArray.length;i++)
				skuIds.add(idsArray[i]);
			skuMaster.setSkuidsList(skuIds);
			// log.info("Request String:::::::::"+gson.toJson(skuMaster));
			result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Sku_Service_delete_SKU_details"), gson.toJson(skuMaster),"GET");
			// log.info("Response String:::::::::"+result);
			responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("SKU_DELETE_SUCCESS").trim();
			else 
				result = AppProperties.getAppMessageByProperty("DELETE_FAILED").trim();
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
	 * Created On: 6-oct-2015
	 * 
	 * This method is used to call the getSkuLedger method of web service and return the transaction List.
	 * 
	 */
	public List<StockLedgerDetails> getSkuLedger(String skuID,String customerIdStr,String emailIdStr,String index,String storeLocation,String flowUnder,String plucode){
		String resultStr = null;
		StockLedger stockLedgerObj = new StockLedger();
		try {
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			stockLedgerObj.setSkuId(skuID);
			stockLedgerObj.setPluCode(plucode);
			stockLedgerObj.setStartIndex(index);
			if(flowUnder.equals("warehouse"))
			stockLedgerObj.setWareHouseLocation(storeLocation);
			else
			stockLedgerObj.setStoreLocation(storeLocation);
			stockLedgerObj.setRequiredRecords(AppProperties.getAppMessageByProperty("REQUIRED_RECORDS").trim());
			stockLedgerObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String:::::::"+gson.toJson(stockLedgerObj));
		//	//////////////////////System.out.println"Request String:::::::"+gson.toJson(stockLedgerObj));
			if(flowUnder.equals("warehouse"))
				resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_warehouse_ledger"), gson.toJson(stockLedgerObj), "GET");	
			else
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Sku_Service_get_sku_ledger"), gson.toJson(stockLedgerObj), "POST");
			// log.info("Response String:::::::"+resultStr);
		////////////////////////System.out.println"Response String:::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				stockLedgerObj = gson.fromJson(resultStr, StockLedger.class);
				////////////////////////////System.out.println"Response String:::::::"+gson.toJson(stockLedgerObj));
				if(stockLedgerObj.getLedgerDetails() != null && stockLedgerObj.getLedgerDetails().size() != 0)
					stockLedgerObj.getLedgerDetails().get(0).setTotalRecords(stockLedgerObj.getTotalRecords());
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return stockLedgerObj.getLedgerDetails();
	}
	
	
	
	/**
	 * @author Mythri.S	
	 * Created On: 6-oct-2015
	 * 
	 * This method is used to call the getSkuLedger method of web service and return the transaction List.
	 * 
	 *//*
	public List<StockLedgerDetails> getSkuLedger(String skuID,String customerIdStr,String emailIdStr,String index,String storeLocation,String flowUnder,String plucode){
		String resultStr = null;
		StockLedger stockLedgerObj = new StockLedger();
		try {
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			stockLedgerObj.setSkuId(skuID);
			//stockLedgerObj.setPluCode(plucode);
			stockLedgerObj.setStartIndex(index);
			if(flowUnder.equals("warehouse"))
			stockLedgerObj.setWareHouseLocation(storeLocation);
			else
			stockLedgerObj.setStoreLocation(storeLocation);
			stockLedgerObj.setRequiredRecords(AppProperties.getAppMessageByProperty("REQUIRED_RECORDS").trim());
			stockLedgerObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String:::::::"+gson.toJson(stockLedgerObj));
			if(flowUnder.equals("warehouse"))
				resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_warehouse_ledger"), gson.toJson(stockLedgerObj), "GET");	
			else
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Sku_Service_get_sku_ledger"), gson.toJson(stockLedgerObj), "POST");
			// log.info("Response String:::::::"+resultStr);
			//////////////////////////////////////////////System.out.println"Response String:::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				stockLedgerObj = gson.fromJson(resultStr, StockLedger.class);
				if(stockLedgerObj.getLedgerDetails() != null && stockLedgerObj.getLedgerDetails().size() != 0)
					stockLedgerObj.getLedgerDetails().get(0).setTotalRecords(stockLedgerObj.getTotalRecords());
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return stockLedgerObj.getLedgerDetails();
	}
	
	*/

	
	
	
	/**
	 * @author Manasa.P	
	 * Created On: 1-jan-2017
	 * 
	 * This method is used to call the getTrackerItemDetails method of web service and return the tracker items.
	 * 
	 */
	public TrackerItemDetails  getStockItemTrackDetails(String skuID,String customerIdStr,String emailIdStr,String index,String storeLocation,String flowUnder,String plucode,String pluCode){
		String resultStr = null;
		//ItemWiseReport stockLedgerObj = new ItemWiseReport();
		ReportsBean stockLedgerObj = null;
		ReportsRequestBean requestbeanObj = null;
	TrackerItemDetails trackerItemDetails=null;
		try {
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
		    requestbeanObj = new ReportsRequestBean();
		    stockLedgerObj = new ReportsBean();
		    trackerItemDetails = new TrackerItemDetails();
		    requestbeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		    if(flowUnder.equals("outlet")){
			requestbeanObj.setPluCode(pluCode);
		//	requestbeanObj.setStartIndex(index);
			requestbeanObj.setStore_location(storeLocation);
			//requestbeanObj.setMaxRecords("20");
			//requestbeanObj.setStoreLocation(storeLocation);
			//requestbeanObj.setRequiredRecords(AppProperties.getAppMessageByProperty("REQUIRED_RECORDS").trim());
			
		    }
		    else{
		    	requestbeanObj.setLocation(storeLocation);
		    	requestbeanObj.setSkuID(skuID);
		    	requestbeanObj.setPlucode(pluCode);
//		    	requestbeanObj.setPluCode(pluCode);
//		    	requestbeanObj.setSkuId(skuID);
		    	requestbeanObj.setStartIndex(index);
		    }
			// log.info("Request String:::::::"+gson.toJson(requestbeanObj));
//			////////////////////////////////////////////System.out.println"Request String:::::::"+gson.toJson(requestbeanObj));
			if(flowUnder.equals("outlet"))
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Tracker_ItemsDetails"), gson.toJson(requestbeanObj),"GET");
			else
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_AvailableTracking_Nos"), gson.toJson(requestbeanObj),"GET");	
			/*resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Tracker_ItemsDetails"), gson.toJson(stockLedgerObj), "POST");*/
			// log.info("Response String:::::::"+resultStr);
//			////////////////////////////////////////////System.out.println"Response String:::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				trackerItemDetails = gson.fromJson(resultStr, TrackerItemDetails.class);
				//stockLedgerObj = gson.fromJson(resultStr, ReportsBean.class);
//				stockLedgerObj.getItemdetails().setEansList(stockLedgerObj.getEansList());
				
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return trackerItemDetails;
	}
	
	
	/**
	 * @author Manasa.P	
	 * Created On: 1-jan-2017
	 * 
	 * This method is used to call the getTrackerItemDetails method of web service and return the tracker items.
	 * 
	 *//*
	public TrackerItemDetails  getStockItemTrackDetails(String skuID,String customerIdStr,String emailIdStr,String index,String storeLocation,String flowUnder,String plucode,String pluCode){
		String resultStr = null;
		//ItemWiseReport stockLedgerObj = new ItemWiseReport();
		ReportsBean stockLedgerObj = null;
		ReportsRequestBean requestbeanObj = null;
		try {
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
		    requestbeanObj = new ReportsRequestBean();
			requestbeanObj.setPluCode(pluCode);
		//	requestbeanObj.setStartIndex(index);
			requestbeanObj.setStoreLocation(storeLocation);
			//requestbeanObj.setRequiredRecords(AppProperties.getAppMessageByProperty("REQUIRED_RECORDS").trim());
			requestbeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String:::::::"+gson.toJson(requestbeanObj));
			//////////////////////////////////////////////System.out.println"Request String:::::::"+gson.toJson(requestbeanObj));
			 resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Tracker_ItemsDetails"), gson.toJson(requestbeanObj),"GET");
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Tracker_ItemsDetails"), gson.toJson(stockLedgerObj), "POST");
			// log.info("Response String:::::::"+resultStr);
			////////////////////////////////////////////System.out.println"Response String:::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				stockLedgerObj = gson.fromJson(resultStr, ReportsBean.class);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return stockLedgerObj.getItemdetails();
	}
	*/
	
	
	
	

/**
	 * @author Manasa.P	
	 * Created On: 1-jan-2017
	 * 
	 * This method is used to call the getDailyStockReport method of web service and return the tracker items.
	 * 
	 */
	
	public List<SkuDetails> getdailyStockItem(String skuID,String customerIdStr,String emailIdStr,String index,String storeLocation,String flowUnder,String plucode,String pluCode){
		ProductStocks productStocksObj = null;
		ReportsRequestBean requestbeanObj = null;
		String resultStr = null;
		List<SkuDetails> skuDetailsList = null;
		RestfulServiceConnection restfulConnectionObj = null;
		try{
			// log.info("Get Product Stocks by Outlet-wise");
			//////////////////////////////////////////////System.out.println"daily");
			restfulConnectionObj = new RestfulServiceConnection();
			requestbeanObj = new ReportsRequestBean();
			requestbeanObj.setPluCode(pluCode);
			requestbeanObj.setStoreLocation(storeLocation);
			requestbeanObj.setStartIndex(index);
			requestbeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//////////////////////////////////////////////System.out.printlngson.toJson(requestbeanObj));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_daily_stock_report"), gson.toJson(requestbeanObj), "GET");
			// log.info("Response String:::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			//////////////////////////////////////////////System.out.println"Stocks Response String:::"+resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				productStocksObj = gson.fromJson(resultStr,ProductStocks.class);	
				skuDetailsList = productStocksObj.getReportsList();
				
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return skuDetailsList;
		
	}
	
	/**
	 * @author Manasa.P	
	 * Created On: 1-jan-2017
	 * 
	 * This method is used to call the getDailyStockReport method of web service and return the tracker items.
	 * 
	 *//*
	
	public List<SkuDetails> getdailyStockItem(String skuID,String customerIdStr,String emailIdStr,String index,String storeLocation,String flowUnder,String plucode,String pluCode){
		ProductStocks productStocksObj = null;
		ReportsRequestBean requestbeanObj = null;
		String resultStr = null;
		List<SkuDetails> skuDetailsList = null;
		RestfulServiceConnection restfulConnectionObj = null;
		try{
			// log.info("Get Product Stocks by Outlet-wise");
			////////////////////////////////////////////System.out.println"daily");
			restfulConnectionObj = new RestfulServiceConnection();
			requestbeanObj = new ReportsRequestBean();
			requestbeanObj.setPluCode(pluCode);
			requestbeanObj.setStoreLocation(storeLocation);
			requestbeanObj.setStartIndex(index);
			requestbeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//////////////////////////////////////////////System.out.printlngson.toJson(requestbeanObj));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_daily_stock_report"), gson.toJson(requestbeanObj), "GET");
			// log.info("Response String:::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			//////////////////////////////////////////////System.out.println"Stocks Response String:::"+resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				productStocksObj = gson.fromJson(resultStr,ProductStocks.class);	
				skuDetailsList = productStocksObj.getReportsList();
				
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return skuDetailsList;
		
	}*/
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 17-aug-2015
	 *  
	 * This method accepts search string storeLocation and productCategory.
	 * It calls the searchProducts method of web service.
	 * It retrieves productList matching search string, productCategory and storeLocation.
	 * 
	 * 
	 */
	public List<ProductsList> searchSkuMaster(String customerIdStr,String emailIdStr,String searchNameStr,String index){
		String resultStr = null;
		RequestBean requestBeanObj = null;
		List<ProductsList> skuList = null;
		RestfulServiceConnection restfulConnectionObj = null;
		try{
			restfulConnectionObj = new RestfulServiceConnection();
			requestBeanObj = new RequestBean();
			requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestBeanObj.setSearchCriteria(searchNameStr);
			requestBeanObj.setStartIndex(index);
			requestBeanObj.setStoreLocation("");
			requestBeanObj.setProductCategory("");
			requestBeanObj.setMaxRecords("10");
			requestBeanObj.setTotalCountRequired(true);
			// log.info("Request String::::"+gson.toJson(requestBeanObj));
			/*Sku_Service_search_products*/
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Sku_Service_get_SKU_details"), gson.toJson(requestBeanObj), "GET");
//			resultStr = restfulConnectionObj.getResponse(AppProperties.getAppMessageByProperty("Sku_Service_search_products"), gson.toJson(requestBeanObj), "GET");
					
			// log.info("Response String::::"+resultStr);
			
			String responseCode = Response.getResponseCode(resultStr);
			if (responseCode.equals(Constants.RESPONSE_SUCCESS_CODE)) {
				String responseList = Response.getResponseList(resultStr, "skuList");
//				String responseList = Response.getResponseList(resultStr, "productsList");
				JSONArray jsonResponseArray = new JSONArray(responseList);
				skuList = new ArrayList<ProductsList>();
				int slNo = Integer.parseInt(index);
				for (int i=0; i<jsonResponseArray.length(); i++) {
					ProductsList skuObj = gson.fromJson(jsonResponseArray.getString(i), ProductsList.class);
					skuObj.setSlNo(++slNo);
//					skuObj.setSkuId(skuObj.getSkuID());
					skuList.add(skuObj);
				}
				skuList.get(0).setTotalRecords(Response.getResponseTotalRecords(resultStr));
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return skuList;
		
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 17-aug-2015
	 *  
	 * This method accepts search string storeLocation and productCategory.
	 * It calls the searchProducts method of web service.
	 * It retrieves productList matching search string, productCategory and storeLocation.
	 * 
	 * 
	 */
	public List<ProductsList> searchWarehouseProducts(String customerIdStr,String emailIdStr,String searchNameStr,String storeLocation,String productCategoryStr,String supplier,boolean supplierFlag,String subcategory,boolean bomsearchSkusFlag){
		String resultStr = null;
		RequestBean requestBeanObj = null;
		List<ProductsList> productsLists = new ArrayList<ProductsList>();
		RestfulServiceConnection restfulConnectionObj = null;
		try{
			restfulConnectionObj = new RestfulServiceConnection();
			requestBeanObj = new RequestBean();
			requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestBeanObj.setSearchCriteria(searchNameStr);
			//requestBeanObj.setStartIndex("-1");
			requestBeanObj.setStoreLocation(storeLocation); 
			requestBeanObj.setTotalCountRequired(true);
			requestBeanObj.setProductCategory(productCategoryStr);
		    requestBeanObj.setProductSubCategory(subcategory);
			requestBeanObj.setSupplierId(supplier);
			requestBeanObj.setSupplierCode(supplier);
			requestBeanObj.setProductRestrictions(supplierFlag);
			requestBeanObj.setProductSearch(true);
			requestBeanObj.setBomsearchSkusFlag(bomsearchSkusFlag);
			requestBeanObj.setStartIndex("0");
			requestBeanObj.setMaxRecords("10");
			
	     	//System.out.println(" warehouse products Request String::::"+gson.toJson(requestBeanObj));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Sku_Service_search_warehouse_products"), gson.toJson(requestBeanObj), "GET");
	    	////////System.out.println(" warehouse products Response String::::"+resultStr);
			ProductsList productsList = new ProductsList();
			SearchProductResponse searchProductResponse = gson.fromJson(resultStr,SearchProductResponse.class);
			if (searchProductResponse.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)) {
				for (int i = 0; i < searchProductResponse.getProductsList().length; i++) {
					productsList = searchProductResponse.getProductsList()[i];
					ProductsList productList = new ProductsList();
					if(productsList.getDescription() != null && productsList.getDescription().toLowerCase().contains(searchNameStr.toLowerCase())){
						productList.setDescription(productsList.getDescription());
						productList.setSkuID(productsList.getSkuID());
						
					}
					else if(productsList.getCategory() != null && productsList.getCategory().toLowerCase().contains(searchNameStr.toLowerCase())){
						productList.setDescription(productsList.getCategory());
						productList.setSkuID(productsList.getSkuID());
						productList.setCategory(productsList.getCategory());
					}
					else if (productsList.getSkuID() != null && productsList.getSkuID().toLowerCase().contains(searchNameStr.toLowerCase())) {
						productList.setDescription(productsList.getSkuID());
						productList.setSkuID(productsList.getSkuID());
						
						
					}
					else {
						productList.setDescription(productsList.getDescription());
						productList.setSkuID(productsList.getSkuID());
					}
					productList.setPluCode(productsList.getPluCode());
					productList.setPrice(productsList.getPrice());
					productList.setBuy_price(productsList.getBuy_price());
					productList.setProductName(productsList.getProductName());
					productList.setQuantity(productsList.getStock());
					productList.setMbq(productsList.getMbq());
					productList.setMrp(productsList.getMrp());
					productList.setEan(productsList.getEan());

					productList.setQuantityInHand(productsList.getQuantityInHand());
					productList.setReorderPoint(productsList.getReorderPoint());
					productList.setStatus(productsList.getStatus());
					productsLists.add(productList);
				}
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return productsLists;
	}
	
	
	public String getWarehouseSkuDetails(String customerIdStr,String emailIdStr,String skuIdStr,String storeLocationStr, String warehouseReturnflag){
		String resultStr = null;
		RequestBean requestBeanObj = null;
		RestfulServiceConnection restfulConnectionObj = null;
		try{
			// log.info("Get Sku based on provided name");
			restfulConnectionObj = new RestfulServiceConnection();
			requestBeanObj = new RequestBean();
			requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestBeanObj.setSkuId(skuIdStr);
			requestBeanObj.setStoreLocation(storeLocationStr);
			requestBeanObj.setStartIndex(Constants.PAGINATION_START_INDEX);
			requestBeanObj.setStorageRefRequired(true);
			
			if(!warehouseReturnflag.equalsIgnoreCase("")) {
				requestBeanObj.setWHShipmentSearch(true);
			}
			
	///	System.out.println("GetWareHouseSku Request::::::: "+gson.toJson(requestBeanObj));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Sku_Service_get_warehouse_sku_details"), gson.toJson(requestBeanObj), "GET");
////	System.out.println(" get Response Sku_Service_get_warehouse_sku_details String::::"+resultStr);
			requestBeanObj = gson.fromJson(resultStr,RequestBean.class);
			if(requestBeanObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
			   return resultStr;
			}else{
			   return "";
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			return resultStr;
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
			return resultStr;
		}
	}
	
	

	public String getWarehouseSkuDetailsAutoAppend(String customerIdStr,String emailIdStr,String skuIdStr,String storeLocationStr, String supplier, boolean supplierFlag, String category, String subCategory,String supplierName){
		String resultStr = null;
		RequestBean requestBeanObj = null;
		RestfulServiceConnection restfulConnectionObj = null;
		try{
			// log.info("Get Sku based on provided name");
			restfulConnectionObj = new RestfulServiceConnection();
			requestBeanObj = new RequestBean();
			requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestBeanObj.setSkuId(skuIdStr);
			requestBeanObj.setStoreLocation(storeLocationStr);
			requestBeanObj.setStartIndex(Constants.PAGINATION_START_INDEX);
			requestBeanObj.setStorageRefRequired(true);
			requestBeanObj.setProductCategory(category);
			requestBeanObj.setProductSubCategory(subCategory);
			requestBeanObj.setSupplierCode(supplier);
			requestBeanObj.setSupplierName(supplierName);
			requestBeanObj.setProductRestrictions(supplierFlag);
			requestBeanObj.setProductSearch(true);
			////////////////////////System.out.println"GetWareHouseSku Request::::::: "+gson.toJson(requestBeanObj));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Sku_Service_get_warehouse_sku_details"), gson.toJson(requestBeanObj), "GET");
		    ////////////////////////System.out.println" get Response Sku_Service_get_warehouse_sku_details String::::"+resultStr);
			requestBeanObj = gson.fromJson(resultStr,RequestBean.class);
			if(requestBeanObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
			   return resultStr;
			}else{
			   return "";
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			return resultStr;
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
			return resultStr;
		}
	}
	
	
	
	public List<ProductsList> searchWarehouseProducts(String category,String skuIdStr,String productId,String customerIdStr,String emailIdStr,String searchNameStr,String storeLocation,String productCategoryStr,String status,String index,String subcategory,String brand,String department,String supplierid){
		String resultStr = null;
		RequestBean requestBeanObj = null;
		List<ProductsList> productsLists = new ArrayList<ProductsList>();
		RestfulServiceConnection restfulConnectionObj = null;
		try{
			// log.info("Get Products based on provided name");
			restfulConnectionObj = new RestfulServiceConnection();
			requestBeanObj = new RequestBean();
			//requestBeanObj.setSkuId(skuIdStr);
			requestBeanObj.setStatus(status);
			requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestBeanObj.setSearchCriteria(searchNameStr);
			requestBeanObj.setStartIndex(index);
			requestBeanObj.setCategory(category);
			requestBeanObj.setTotalCountRequired(true);
			requestBeanObj.setMaxRecords("10");
			requestBeanObj.setStoreLocation(storeLocation);
			requestBeanObj.setProductCategory(productCategoryStr);
			
			requestBeanObj.setCategory(productCategoryStr);
			requestBeanObj.setSubCategory(subcategory);
			requestBeanObj.setBrand(brand);
			requestBeanObj.setDepartment(department);
			requestBeanObj.setSupplierName(supplierid);
			//////System.out.println("Request String::::"+gson.toJson(requestBeanObj));
			////System.out.println("warehuse Request String::::"+gson.toJson(requestBeanObj));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Sku_Service_search_warehouse_products"), gson.toJson(requestBeanObj), "GET");
			// log.info("Response String::::"+resultStr);
			////////////////System.out.println("warehouse Response String::::"+resultStr);
			ProductsList productsList = new ProductsList();
			SearchProductResponse searchProductResponse = gson.fromJson(resultStr,SearchProductResponse.class);
			if (searchProductResponse.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)) {
				for (int i = 0; i < searchProductResponse.getProductsList().length; i++) {
					productsList = searchProductResponse.getProductsList()[i];
				/*	ProductsList productList = new ProductsList();
					if(productsList.getDescription() != null && productsList.getDescription().toLowerCase().contains(searchNameStr.toLowerCase())){
						productList.setDescription(productsList.getDescription());
						productList.setSkuID(productsList.getSkuID());
					}
					
					else if(productsList.getCategory() != null && productsList.getCategory().toLowerCase().contains(searchNameStr.toLowerCase())){
						productList.setDescription(productsList.getCategory());
						productList.setSkuID(productsList.getSkuID());
					}
					else if (productsList.getSkuID() != null && productsList.getSkuID().toLowerCase().contains(searchNameStr.toLowerCase())) {
						productList.setDescription(productsList.getSkuID());
						productList.setSkuID(productsList.getSkuID());
					}
					else {
						productList.setDescription(productsList.getProductId());
						productList.setSkuID(productsList.getSkuID());
					}
		
					productList.setCategory(productList.getCategory());
					productList.setStatus(productsList.getStatus());
					productList.setPluCode(productsList.getPluCode());
					productList.setPrice(productsList.getPrice());
					productList.setProductName(productsList.getProductName());*/
				
					productsLists.add(productsList);
					productsLists.get(0).setTotalRecords(Integer.toString(searchProductResponse.getTotalRecords()));
				}
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return productsLists;
	}
	
	









public WareHouseSkuResponse getWarehousemasterSKUDetails(String skuIdStr,String customerId,String emailId,String index){
		String result = null;
		WareHouseSku obj_SkuMasterBean = new WareHouseSku();
		WareHouseSkuResponse wareHouseSkuResponse=new WareHouseSkuResponse();
		List<SkuPriceListDetails> skupricelist=null,skuPriceListDetails=null;
		
		try {
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
	        obj_SkuMasterBean.setSkuId(skuIdStr);
			//obj_SkuMasterBean.setStartIndex(index);
			obj_SkuMasterBean.setMake(obj_SkuMasterBean.getMake());
			obj_SkuMasterBean.setStoreLocation(obj_SkuMasterBean.getStoreLocation());
			obj_SkuMasterBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		//	System.out.println("Request String:::::::"+gson.toJson(obj_SkuMasterBean));
			result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Warehouse_master_Sku_Service_get_warehouse_SKU_details"), gson.toJson(obj_SkuMasterBean), "GET");
			// log.info("Response String:::::::"+result);
        //   System.out.println("get sku details Response String:::::::"+result);
			String responseCode = Response.getResponseCode(result);
			Set<String> selectedLocationsList = new HashSet<String>();
			Set<String> productRangeList = new HashSet<String>();
			Set<String> measurementRangeList = new HashSet<String>();
			Set<String> batchRangeList = new HashSet<String>();
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				
				wareHouseSkuResponse = gson.fromJson(result, WareHouseSkuResponse.class);
				//System.out.println("Response String:::::::"+gson.toJson(wareHouseSkuResponse));
				if(skuIdStr!=null){
				if(wareHouseSkuResponse.getWarehouseskumaster().getWarehouseSkuPriceLists() != null)
                for(WarehouseSkuPriceList skuPriceList : wareHouseSkuResponse.getWarehouseskumaster().getWarehouseSkuPriceLists()){
					
						if(skuPriceList.getProductRange() != null && !skuPriceList.getProductRange().equals(""))
					    productRangeList.add(skuPriceList.getProductRange());
						if(skuPriceList.getMeasureRange() != null && !skuPriceList.getMeasureRange().equals(""))
						measurementRangeList.add(skuPriceList.getMeasureRange());
						if(skuPriceList.getProductBatchNo() != null && !skuPriceList.getProductBatchNo().equals(""))
							batchRangeList.add(skuPriceList.getProductBatchNo());
						selectedLocationsList.add(skuPriceList.getStoreLocation());
						skuPriceList.setStoreLocationId(skuPriceList.getStoreLocation().replaceAll(" ", "_"));

					}
				wareHouseSkuResponse.getWarehouseskumaster().setProductRangeList(productRangeList);
				wareHouseSkuResponse.getWarehouseskumaster().setMeasurementRangeList(measurementRangeList);
                wareHouseSkuResponse.getWarehouseskumaster().setSelectedLocationsList(selectedLocationsList);
                wareHouseSkuResponse.getWarehouseskumaster().setBatchRangeList(batchRangeList);
                wareHouseSkuResponse.getWarehouseskumaster().setProductName(wareHouseSkuResponse.getWarehouseskumaster().getDescription());
				List<Products> productList = outletMasterServiceObj.getProducts(customerId, emailId,wareHouseSkuResponse.getWarehouseskumaster().getProductId(),"0","","","");
				if(productList != null && productList.size() > 0){
					//wareHouseSkuResponse.getWarehouseskumaster().setProductName(productList.get(0).getProductName());
					wareHouseSkuResponse.getWarehouseskumaster().setCategory(productList.get(0).getCategoryDescription());
					wareHouseSkuResponse.getWarehouseskumaster().setSubCategoryName(productList.get(0).getSubCategoryDescription());
					wareHouseSkuResponse.getWarehouseskumaster().setCategoryId(productList.get(0).getCategory());
				}
				}
			}
		}catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return wareHouseSkuResponse;
	}







public List<WareHouseSku> getWarehouseSKUDetailsForStockUpdate(String searchName,String zone,String customerId,String emailId,int index,String brand,String maxRecords,String location,String category){
	                                                             
	
	String result = null;
		WareHouseSku obj_SkuMasterBean = new WareHouseSku();
		WareHouseSkuResponse wareHouseSkuResponse=new WareHouseSkuResponse();
		List<SkuPriceListDetails> skupricelist=null,skuPriceListDetails=null;
		List<WareHouseSku> list_SkuMasterBean=null;
		
		try {
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
//	        obj_SkuMasterBean.setSkuId(skuIdStr);
			obj_SkuMasterBean.setStartIndex(index);
//			obj_SkuMasterBean.setMake(obj_SkuMasterBean.getMake());
			obj_SkuMasterBean.setStoreLocation(location);
			obj_SkuMasterBean.setMaxRecords(maxRecords);
			obj_SkuMasterBean.setBrandName(brand);
			obj_SkuMasterBean.setCategory(category);
			obj_SkuMasterBean.setSearchCriteria(searchName);
			obj_SkuMasterBean.setZoneID(zone);
			
			obj_SkuMasterBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//// log.info("Request String:::::::"+gson.toJson(obj_SkuMasterBean));
			//System.out.println("Request String:::::::"+gson.toJson(obj_SkuMasterBean));
			result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_WH_SkuDetails"), gson.toJson(obj_SkuMasterBean), "GET");
			//// log.info("Response String:::::::"+result);
			//System.out.println("get sku details Response String:::::::"+result);
			String responseCode = Response.getResponseCode(result);
			
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			
				String responseList = Response.getResponseList(result, "warehouseskuList");
				JSONArray jsonResponseArray = new JSONArray(responseList);
				list_SkuMasterBean = new ArrayList<WareHouseSku>();
				int slNo = index;
				for (int i=0; i<jsonResponseArray.length(); i++) {
					obj_SkuMasterBean = gson.fromJson(jsonResponseArray.getString(i), WareHouseSku.class);
					obj_SkuMasterBean.setSlNo(++slNo);
					list_SkuMasterBean.add(obj_SkuMasterBean);
				}
				list_SkuMasterBean.get(0).setTotalRecords(Response.getResponseTotalRecords(result));
			}
		}catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return list_SkuMasterBean;
	}


public List<WareHouseSku> getWarehouseSKUDetailsForPriceUpdate(String searchName,String zone,String customerId,String emailId,int index,String brand,String maxRecords,String location,String category, String subcategory,String department){
	String result = null;
		WareHouseSku obj_SkuMasterBean = new WareHouseSku();
		WareHouseSkuResponse wareHouseSkuResponse=new WareHouseSkuResponse();
		List<SkuPriceListDetails> skupricelist=null,skuPriceListDetails=null;
		List<WareHouseSku> list_SkuMasterBean=null;
		
		try {
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
//	        obj_SkuMasterBean.setSkuId(skuIdStr);
			obj_SkuMasterBean.setStartIndex(index);
//			obj_SkuMasterBean.setMake(obj_SkuMasterBean.getMake());
			obj_SkuMasterBean.setStoreLocation(location);
			obj_SkuMasterBean.setMaxRecords(maxRecords);
			obj_SkuMasterBean.setBrandName(brand);
			obj_SkuMasterBean.setCategory(category);
			obj_SkuMasterBean.setSearchCriteria(searchName);
			
			obj_SkuMasterBean.setZoneID(zone);
			obj_SkuMasterBean.setSubCategory(subcategory);
			obj_SkuMasterBean.setDepartment(department);
			
			obj_SkuMasterBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//// log.info("Request String:::::::"+gson.toJson(obj_SkuMasterBean));
			//System.out.println("Request String:::::::"+gson.toJson(obj_SkuMasterBean));
			result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_WH_SkuDetails"), gson.toJson(obj_SkuMasterBean), "GET");
			//// log.info("Response String:::::::"+result);
			//System.out.println("get sku details Response String:::::::"+result);
			String responseCode = Response.getResponseCode(result);
			
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				String responseList = Response.getResponseList(result, "warehouseskuList");
				JSONArray jsonResponseArray = new JSONArray(responseList);
				list_SkuMasterBean = new ArrayList<WareHouseSku>();
				int slNo = index;
				for (int i=0; i<jsonResponseArray.length(); i++) {
					obj_SkuMasterBean = gson.fromJson(jsonResponseArray.getString(i), WareHouseSku.class);
					obj_SkuMasterBean.setSlNo(++slNo);
					list_SkuMasterBean.add(obj_SkuMasterBean);
				}
				list_SkuMasterBean.get(0).setTotalRecords(Response.getResponseTotalRecords(result));
			}
			
		}catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return list_SkuMasterBean;
	}





public String deleteWarehouseSku(String ids){
		String result = null;
		String responseCode = null;
		try {
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			String[] idsArray = ids.split(",");
			WareHouseSku warehouseskuMaster = new WareHouseSku();
			warehouseskuMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			List<String> SkuIds = new ArrayList<String>();
			for(int i=0;i<idsArray.length;i++)
				SkuIds.add(idsArray[i]);
			warehouseskuMaster.setWarehouseSkuIds(SkuIds);
			// log.info("Request String:::::::::"+gson.toJson(warehouseskuMaster));
			result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("warehouse_SKU_master_Service_delete_SKU_details"), gson.toJson(warehouseskuMaster));
			// log.info("Response String:::::::::"+result);
			responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("SKU_DELETE_SUCCESS").trim();
			else 
				result = AppProperties.getAppMessageByProperty("DELETE_FAILED").trim();
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	
	
public String createWarehouseSku(WareHouseSku obj_SkuMasterBean,String customerId,String emailId){
	String result = null;
	try {
		RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
		obj_SkuMasterBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		
		// log.info("Request String::::::::::::"+gson.toJson(obj_SkuMasterBean));
	/*	////System.out.println("create warehouse Request String::::::::::::"+gson.toJson(obj_SkuMasterBean));*/
		if(obj_SkuMasterBean.getCreationType()!=null && !obj_SkuMasterBean.getCreationType().isEmpty())
		{
		if(obj_SkuMasterBean.getCreationType().equalsIgnoreCase("Quick")) {
			for(int i = 0;i<obj_SkuMasterBean.getWarehouseSkuPriceLists().size();i++ ) {
				obj_SkuMasterBean.getWarehouseSkuPriceLists().get(i).setQuantityInHand(0.0);
			}
			}}
		result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("Warehouse_master_Sku_Service_create_SKU_details"), gson.toJson(obj_SkuMasterBean));
		//////System.out.println("Response String:::::::::::"+result);
		String responseCode = Response.getResponseCode(result);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
			result = AppProperties.getAppMessageByProperty("SKU_CREATE_SUCCESS").trim();
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




public String updateWarehouseSku(WareHouseSku wareHouseSkuobj,String customerId,String emailId){
		String result = null;
		try {
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			wareHouseSkuobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			// log.info("Request String::::::::::::"+gson.toJson(wareHouseSkuobj));
	    // System.out.println("update warehouse Request String::::::::::::"+gson.toJson(wareHouseSkuobj));
			
			if(wareHouseSkuobj.getCreationType() != null && !wareHouseSkuobj.getCreationType().isEmpty()){
			if(wareHouseSkuobj.getCreationType().equalsIgnoreCase("Quick")) {
				for(int i = 0;i<wareHouseSkuobj.getWarehouseSkuPriceLists().size();i++ ) {
					wareHouseSkuobj.getWarehouseSkuPriceLists().get(i).setQuantityInHand(null);
				}
				}
			}
			
			result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("Warehouse_SKU_master_Service_update_warehouse_SKU_details"), gson.toJson(wareHouseSkuobj));
			//////////////////////////////////////System.out.println"Response String:::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
		
			
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("SKU_UPDATE_SUCCESS").trim();
			}
			else{
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
	
	
public List<ProductsList> importSkuProducts(String customerIdStr,String emailIdStr,String SkuIds,String storeLocation,String productCategoryStr,String supplier,boolean supplierFlag){
	String resultStr = null;
//	SkuServiceProxy skuProxyObj = null;
	RequestBean requestBeanObj = null;
	RestfulServiceConnection restfulConnectionObj = null;
	ArrayList<ProductsList> productsList = new ArrayList<ProductsList>();
	try{
		restfulConnectionObj = new RestfulServiceConnection();
		String searchNameStr="";
//		skuProxyObj = new SkuServiceProxy();
		requestBeanObj = new RequestBean();
		requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		requestBeanObj.setSearchCriteria("");
		requestBeanObj.setStartIndex("-1");
		requestBeanObj.setStoreLocation(storeLocation);
		requestBeanObj.setProductCategory(productCategoryStr);
		requestBeanObj.setSupplierId(supplier);
		requestBeanObj.setSupplierCode(supplier);
		requestBeanObj.setProductRestrictions(supplierFlag);
		
		String[] skuList=SkuIds.split(",");
		
		requestBeanObj.setMaxRecords("200");
		
		List<String> skuListAll= new ArrayList<String>();
		for (int i = 0; i < skuList.length; i++) {
			skuListAll.add(skuList[i]);
		}
		requestBeanObj.setSkuIdList(skuListAll);
		//////System.out.println("Request String::get_Sku_PriceList_Details::"+gson.toJson(requestBeanObj));
		resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Sku_PriceList_Details"), gson.toJson(requestBeanObj), "GET");
		//resultStr = skuProxyObj.searchProducts(gson.toJson(requestBeanObj));
	    //System.out.println("Response String::get_Sku_PriceList_Details::"+resultStr);
		
		
		GetProductsResponse searchProductResponse = gson.fromJson(resultStr,GetProductsResponse.class);
		/*
		 * if
		 * (searchProductResponse.getResponseHeader().getResponseCode().equals(Constants
		 * .RESPONSE_SUCCESS_CODE)) {
		 * productsList.addAll(searchProductResponse.getProductsList()); }
		 */
		
		if (searchProductResponse.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)) {
			productsList.addAll(searchProductResponse.getProductsList());
			productsList.get(0).setResponseHeader(searchProductResponse.getResponseHeader());
			//productsList.get(0).setUrl(searchProductResponse.getUrl());
			
		} else {
			if(searchProductResponse.getProductsList() != null) {
				productsList.addAll(searchProductResponse.getProductsList());
				productsList.get(0).setResponseHeader(searchProductResponse.getResponseHeader());
				productsList.get(0).setUrl(searchProductResponse.getUrl());
			}
				
			}
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	} catch(Exception e){
		e.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
	}
	return productsList;
	
}

public List<ProductsList> importSkuProductsForOffersExcel(String customerIdStr,String emailIdStr,String SkuIds,String storeLocationStr){
	String resultStr = null;
	RequestBean requestBeanObj = null;
	RestfulServiceConnection restfulConnectionObj = null;
	ArrayList<ProductsList> productsList = new ArrayList<ProductsList>();
	try{
		restfulConnectionObj = new RestfulServiceConnection();
		requestBeanObj = new RequestBean();
		requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		requestBeanObj.setSearchCriteria("");
		requestBeanObj.setStartIndex("-1");
		
		List<String> myList = new ArrayList<String>(Arrays.asList(storeLocationStr.split(",")));
		requestBeanObj.setLocationsList(myList);
		if(storeLocationStr.equals(""))
			requestBeanObj.setLocationsList(null);
		
		requestBeanObj.setStoreLocation("");
		String[] skuList=SkuIds.split(",");
		List<String> skuListAll= new ArrayList<String>();
		for (int i = 0; i < skuList.length; i++) {
			skuListAll.add(skuList[i]);
		}
		requestBeanObj.setSkuIdList(skuListAll);
		
		requestBeanObj.setOutletFlag(true);
		
		//System.out.println("Request String: OfferImport:get_Sku_PriceList_Details::"+gson.toJson(requestBeanObj));
		//resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Sku_PriceList_Details_Body"), gson.toJson(requestBeanObj), "GET");
		resultStr = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("get_Sku_PriceList_Details_Body"), gson.toJson(requestBeanObj));
		//resultStr = skuProxyObj.searchProducts(gson.toJson(requestBeanObj));
				
		//System.out.println("Response String:OfferImport:get_Sku_PriceList_Details::"+resultStr);
		
		
		GetProductsResponse searchProductResponse = gson.fromJson(resultStr,GetProductsResponse.class);
		if (searchProductResponse.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)) {
			if(searchProductResponse.getUrl() != null && searchProductResponse.getUrl().length()>0){
			searchProductResponse.getProductsList().get(0).setLogURL(searchProductResponse.getUrl());
			searchProductResponse.getProductsList().get(0).setNoSkusMessage(searchProductResponse.getResponseHeader().getResponseMessage());
			}
			productsList.addAll(searchProductResponse.getProductsList());
			
		}
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	} catch(Exception e){
		e.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
	}
	return productsList;
	
}


@SuppressWarnings("unchecked")
public List<ProductsList> importSkuProductsForDealsExcel(String customerIdStr,String emailIdStr,String SkuIds,String storeLocationStr){
	String resultStr = null;
	RequestBean requestBeanObj = null;
	RestfulServiceConnection restfulConnectionObj = null;
	ArrayList<ProductsList> productsList = new ArrayList<ProductsList>();
	try{
		restfulConnectionObj = new RestfulServiceConnection();
		requestBeanObj = new RequestBean();
		requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		requestBeanObj.setSearchCriteria("");
		requestBeanObj.setStartIndex("-1");
		
		List<String> myList = new ArrayList<String>(Arrays.asList(storeLocationStr.split(",")));
		requestBeanObj.setLocationsList(myList);
		if(storeLocationStr.equals(""))
			requestBeanObj.setLocationsList(null);
		
		requestBeanObj.setStoreLocation("");
		String[] skuList=SkuIds.split(",");
		Set<String> skuListAll= new HashSet<String>();
		for (int i = 0; i < skuList.length; i++) {
			skuListAll.add(skuList[i]);
		}
		
		List<String> finalskuListAll = new ArrayList<>(skuListAll);
		
		requestBeanObj.setSkuIdList(finalskuListAll);
		requestBeanObj.setOutletFlag(true);
		
		//System.out.println("Request String: DealImport:get_Sku_PriceList_Details::"+gson.toJson(requestBeanObj));
		//resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Sku_PriceList_Details_Body"), gson.toJson(requestBeanObj), "GET");
		resultStr = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("get_Sku_PriceList_Details_Body"), gson.toJson(requestBeanObj));
		//resultStr = skuProxyObj.searchProducts(gson.toJson(requestBeanObj));
				
		//System.out.println("Response String: DealImport:get_Sku_PriceList_Details::"+resultStr);
		
		GetProductsResponse searchProductResponse = gson.fromJson(resultStr,GetProductsResponse.class);
		if (searchProductResponse.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)) {
			if(searchProductResponse.getUrl() != null && searchProductResponse.getUrl().length()>0){
			searchProductResponse.getProductsList().get(0).setLogURL(searchProductResponse.getUrl());
			searchProductResponse.getProductsList().get(0).setNoSkusMessage(searchProductResponse.getResponseHeader().getResponseMessage());
			}
			productsList.addAll(searchProductResponse.getProductsList());
		}
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	} catch(Exception e){
		e.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
	}
	return productsList;
	
}

public List<DailyStockTracker> getStockHistory(String searchName,String searchType,String startDateStr,String endDateStr,String outletLocationStr,String stockTypeStr,String customerIdStr,String emailIdStr,String index,String flowUnder,String zone,String category,String subcategory,String brand,String department,Float startprice,Float endprice,Boolean stockdownload,String supplierName,String maxRecords,String locationsListValue,String stockType){
	DailyStockTracker dailyStockTrackerObj = null;
	String resultStr = null;
	//List<SkuDetails> skuDetailsList = null;
	RestfulServiceConnection restfulConnectionObj = null;
	//ArrayList<LocationBean> locationBeansList = null;
	try{
		restfulConnectionObj = new RestfulServiceConnection();
		dailyStockTrackerObj = new DailyStockTracker();
		dailyStockTrackerObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		dailyStockTrackerObj.setMaxRecords(maxRecords);
		dailyStockTrackerObj.setStartIndex(index);
		dailyStockTrackerObj.setStartDate(startDateStr);
		dailyStockTrackerObj.setEndDate(endDateStr);
		dailyStockTrackerObj.setSearchCriteria(searchName);
		dailyStockTrackerObj.setProductCategory(category);
		dailyStockTrackerObj.setProductSubCategory(subcategory);
		dailyStockTrackerObj.setZoneId(zone);
		dailyStockTrackerObj.setLocationId(outletLocationStr);
		dailyStockTrackerObj.setBrand(brand);
		dailyStockTrackerObj.setSupplier(supplierName);
		dailyStockTrackerObj.setDepartment(department);
		dailyStockTrackerObj.setSubDepartment(department);
		if(startprice != null){
		dailyStockTrackerObj.setStartPrice(Float.toString(startprice)); 
		}
		if(  endprice != null){
			dailyStockTrackerObj.setEndPrice(Float.toString(endprice));
			
		}
		dailyStockTrackerObj.setLocationType(flowUnder);
		
		
		
	 //  //////////////////////////////////////System.out.println"Daily Stock History Request String:::"+(gson.toJson(dailyStockTrackerObj)) );
		
       resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("view_DailyStock_tracker"), gson.toJson(dailyStockTrackerObj), "GET");
      // ////////////////////////////System.out.println"Daily Stock History Response String:::"+resultStr);
       String responseCode = Response.getResponseCode(resultStr);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			dailyStockTrackerObj = gson.fromJson(resultStr, DailyStockTracker.class);
			
		}
		for(int i=0;i<dailyStockTrackerObj.getDailyStockTrackers().size();i++){
			dailyStockTrackerObj.getDailyStockTrackers().get(i).setTotalRecords(dailyStockTrackerObj.getTotalRecords());
		}

		
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	} catch(Exception e){
		e.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
	}
	return dailyStockTrackerObj.getDailyStockTrackers();
	
}




public String getpackage(String searchName,String searchType,String startDateStr,String endDateStr,String outletLocationStr,String stockTypeStr,String customerIdStr,String emailIdStr,String index,String flowUnder,String zone,String category,String subcategory,String brand,String department,Boolean stockdownload,String supplierName,String maxRecords,String locationsListValue,String packageID){
	ProcessingAndPackaging dailyStockTrackerObj = null;
	com.tlabs.posweb.beans.Response responseobj = null;
	String resultStr = null;
	//List<SkuDetails> skuDetailsList = null;
	RestfulServiceConnection restfulConnectionObj = null;
	//ArrayList<LocationBean> locationBeansList = null;
	try{
		restfulConnectionObj = new RestfulServiceConnection();
		dailyStockTrackerObj = new ProcessingAndPackaging();
		dailyStockTrackerObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		dailyStockTrackerObj.setMaxRecords(maxRecords);
		dailyStockTrackerObj.setStartIndex(index);
		dailyStockTrackerObj.setStartDateStr(startDateStr);
		dailyStockTrackerObj.setEndDateStr(endDateStr);
		//dailyStockTrackerObj.setSearchCriteria(searchName);
		dailyStockTrackerObj.setCategory(category);
		dailyStockTrackerObj.setSubCategory(subcategory);
		dailyStockTrackerObj.setZone(zone);
		dailyStockTrackerObj.setStoreLocation(outletLocationStr);
		dailyStockTrackerObj.setBrand(brand);
		dailyStockTrackerObj.setSupplierName(supplierName);
		dailyStockTrackerObj.setDepartment(department);
		dailyStockTrackerObj.setSubDepartment(department);
		dailyStockTrackerObj.setPackagingRefId(packageID);
		
		
		
		
	////////////////////////////////////System.out.println"packaging Request String:::"+(gson.toJson(dailyStockTrackerObj)) );
		
       resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_packages"), gson.toJson(dailyStockTrackerObj), "GET");
    ////////////////////////////////System.out.println"packaging Response String:::"+resultStr);
       

		
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	} catch(Exception e){
		e.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
	}
	return resultStr;
	
}

public List<SkuDetails> getStorageProductStocks(String searchName,String searchType,String startDateStr,String endDateStr,String outletLocationStr,String stockTypeStr,String customerIdStr,String emailIdStr,String index,String flowUnder,String zone,String category,String subcategory,String brand,String department,Float startprice,Float endprice,Boolean stockdownload,String supplierName,String maxRecords,String locationsListValue,String storgaeArea){
	ProductStocks productStocksObj = null;
	String resultStr = null;
	List<SkuDetails> skuDetailsList = null;
	RestfulServiceConnection restfulConnectionObj = null;
	ArrayList<LocationBean> locationBeansList = null;
	try{
		// log.info("Get Product Stocks by Outlet-wise");
		restfulConnectionObj = new RestfulServiceConnection();
		productStocksObj = new ProductStocks();
		productStocksObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
	//	////////////////////////////////////////////System.out.printlnlocationsListValue);
		if(outletLocationStr.equals("all") || outletLocationStr.equals("")){
		List<String> myList = new ArrayList<String>(Arrays.asList(locationsListValue.split(",")));
		productStocksObj.setLocationsList(myList);
		}
		else
		productStocksObj.setStoreLocation(outletLocationStr.trim());
		productStocksObj.setStartIndex(Integer.parseInt(index));
		productStocksObj.setRequiredRecords(Integer.parseInt(maxRecords));
		productStocksObj.setSearchCriteria(searchName.trim());
		//productStocksObj.setSearchType(searchType);
		productStocksObj.setStatus(searchType.trim());
		if(flowUnder.equalsIgnoreCase("outlet"))
			productStocksObj.setBoneyardSummaryFlag(true);
		productStocksObj.setStartDate(startDateStr.trim());
		productStocksObj.setEndDate(endDateStr.trim());
		productStocksObj.setStockType(stockTypeStr.trim());
		productStocksObj.setCategory(category.trim());
		productStocksObj.setSubCategory(subcategory.trim());
		productStocksObj.setBrand(brand.trim());
		productStocksObj.setDepartment(department.trim());
		productStocksObj.setEndPriceRange(endprice);
		productStocksObj.setZone(zone.trim());
		productStocksObj.setStartPriceRange(startprice);
		productStocksObj.setSaveStockFlag(stockdownload);
		productStocksObj.setSupplierName(supplierName.trim());
		productStocksObj.setStorageArea(storgaeArea);
		// log.info("Request String:::"+gson.toJson(productStocksObj));

 ///       System.out.println("Request String:::"+gson.toJson(productStocksObj));
		
		if(stockTypeStr.equalsIgnoreCase("DayWise") && flowUnder.equalsIgnoreCase("outlet"))
			
		{
			locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,true);	
			if((outletLocationStr.trim()).equals(null) || outletLocationStr.trim().isEmpty())
			{
				productStocksObj.setStore_location(locationBeansList.get(0).getLocationId());
				productStocksObj.setStockLocations(null);
			}else
			productStocksObj.setStore_location(outletLocationStr.trim());
			productStocksObj.setStoreLocation(null);
			productStocksObj.setCategory(null);
			productStocksObj.setCategoryName(category.trim());
			
			productStocksObj.setSaveReport(stockdownload);
			productStocksObj.setZoneId(zone.trim());
			//////////////////////////////////////////////System.out.printlngson.toJson(productStocksObj));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_daily_stock_report"), gson.toJson(productStocksObj), "GET");
			///System.out.println("day wise Stocks Response String:::"+resultStr);
		}
		
		else if(flowUnder.equalsIgnoreCase("outlet"))
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Sku_Service_get_Product"), gson.toJson(productStocksObj), "GET");
		else
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Sku_Service_get_storage_Product"), gson.toJson(productStocksObj), "GET");
		// log.info("Response String:::"+resultStr);
	///    System.out.println("Stocks Response String:::"+resultStr);

		productStocksObj = gson.fromJson(resultStr,ProductStocks.class);
		int slNo = Integer.parseInt(index);
		if(productStocksObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
			
			if(productStocksObj.getSku()!=null)
				skuDetailsList = productStocksObj.getSku();
			
			else if(productStocksObj.getReportsList()!=null)
				skuDetailsList = productStocksObj.getReportsList();
			else
				skuDetailsList = productStocksObj.getBoneyardStockSummaries();
			
			skuDetailsList.get(0).setTotalRecords(productStocksObj.getTotalRecords());
			skuDetailsList.get(0).setStockDownload(productStocksObj.getStocksFilePath());
			skuDetailsList.get(0).setTotalPrice(productStocksObj.getTotalPrice());
			skuDetailsList.get(0).setTotalQuantity(productStocksObj.getTotalQuantity());
			skuDetailsList.get(0).setStockDaywiseDownload(productStocksObj.getSalesReportFilePath());
			for(SkuDetails skuDetails : skuDetailsList)
				skuDetails.setSlNo(++slNo);
		}
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	} catch(Exception e){
		e.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
	}
	return skuDetailsList;
	
}



public List<ProductsList> searchProductsforInventory(String customerIdStr,String emailIdStr,String searchNameStr,String storeLocation,String productCategoryStr,String supplier,boolean supplierFlag){
	String resultStr = null;
//	SkuServiceProxy skuProxyObj = null;
	RequestBean requestBeanObj = null;
	List<ProductsList> productsLists = new ArrayList<ProductsList>();
	RestfulServiceConnection restfulConnectionObj = null;
	try{
		restfulConnectionObj = new RestfulServiceConnection();
//		skuProxyObj = new SkuServiceProxy();
		requestBeanObj = new RequestBean();
		requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		requestBeanObj.setSearchCriteria(searchNameStr);
		requestBeanObj.setStartIndex("-1");
		requestBeanObj.setStoreLocation(storeLocation);
		
		////////////System.out.println("Request String::::"+gson.toJson(requestBeanObj));
		resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("search_sku_for_inventory"), gson.toJson(requestBeanObj), "GET");
		//resultStr = skuProxyObj.searchProducts(gson.toJson(requestBeanObj));
				
		////////////System.out.println("Response String::::"+resultStr); 
		ProductsList productsList = new ProductsList();
		
		SearchProductResponse searchProductResponse = gson.fromJson(resultStr,SearchProductResponse.class);
		if (searchProductResponse.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)) {
			for (int i = 0; i < searchProductResponse.getProductsList().length; i++) {
				productsList = searchProductResponse.getProductsList()[i];
				ProductsList productList = new ProductsList();
				if(productsList.getDescription() != null && productsList.getDescription().toLowerCase().contains(searchNameStr.toLowerCase())){
					productList.setDescription(productsList.getDescription());
					productList.setSkuID(productsList.getSkuID());
				}
				else if(productsList.getCategory() != null && productsList.getCategory().toLowerCase().contains(searchNameStr.toLowerCase())){
					productList.setDescription(productsList.getCategory());
					productList.setSkuID(productsList.getSkuID());
				}
				else if (productsList.getSkuID() != null && productsList.getSkuID().toLowerCase().contains(searchNameStr.toLowerCase())) {
					productList.setDescription(productsList.getSkuID());
					productList.setSkuID(productsList.getSkuID());
				}
				else {
					productList.setDescription(productsList.getProductId());
					productList.setSkuID(productsList.getSkuID());
				}
				productList.setPluCode(productsList.getPluCode());
				productList.setPrice(productsList.getPrice());
				productList.setBuy_price(productsList.getBuy_price());
				productList.setProductName(productsList.getProductName());
				productList.setColor(productsList.getColor());
				productList.setEan(productsList.getEan());
				productList.setSize(productsList.getSize());
				productList.setMeasureRange(productsList.getMeasurementRange());
				productList.setQuantity(productsList.getStock());
				productList.setMbq(productsList.getMbq());
				productList.setMrp(productsList.getMrp());
				productList.setQuantityInHand(productsList.getQuantityInHand());
				productList.setReorderPoint(productsList.getReorderPoint());
				productList.setIsPacked(productsList.getIsPacked());
				productList.setManufacturedItem(productsList.getManufacturedItem());
				productList.setUomLabel(productsList.getUomLabel());
				productList.setMinSaleQty(productsList.getMinSaleQty());
				productList.setStatus(productsList.getStatus());
				productsLists.add(productList);
			}
		}
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	} catch(Exception e){
		e.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
	}
	return productsLists;
	
}

public String getSkuDetailsForInventory(String customerIdStr,String emailIdStr,String skuIdStr,String storeLocationStr, String mrp, String plucode){
	String resultStr = null;
	RequestBean requestBeanObj = null;
	RestfulServiceConnection restfulConnectionObj = null;
	try{
		// log.info("Get Sku based on provided name");
		restfulConnectionObj = new RestfulServiceConnection();
		requestBeanObj = new RequestBean();
		requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		requestBeanObj.setSkuId(skuIdStr);
		requestBeanObj.setStoreLocation(storeLocationStr);
		requestBeanObj.setStartIndex(Constants.PAGINATION_START_INDEX);
		requestBeanObj.setZeroStockCheckAtOutletLevel(true);
		
		
		// log.info("Request String::::"+gson.toJson(requestBeanObj));
		////////////System.out.println("Request String::::"+gson.toJson(requestBeanObj));
		resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_sku_for_inventory"), gson.toJson(requestBeanObj), "GET");
		// log.info("Response String::::"+resultStr);
		////////////System.out.println("Sku Response String::::"+resultStr);
		requestBeanObj = gson.fromJson(resultStr,RequestBean.class);
		if(requestBeanObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
		   return resultStr;
		}else{
		   return "";
		}
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		return resultStr;
	} catch(Exception e){
		e.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		return resultStr;
	}
}


public String getSkuDetailsForEvents(String customerIdStr,String emailIdStr,String skuIdStr,String storeLocationStr){
	String resultStr = null;
	RequestBean requestBeanObj = null;
	RestfulServiceConnection restfulConnectionObj = null;
	try{
		// log.info("Get Sku based on provided name");
		restfulConnectionObj = new RestfulServiceConnection();
		requestBeanObj = new RequestBean();
		requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		requestBeanObj.setSkuId(skuIdStr);
		requestBeanObj.setStoreLocation(storeLocationStr);
		requestBeanObj.setStartIndex(Constants.PAGINATION_START_INDEX);
		requestBeanObj.setZeroStockCheckAtOutletLevel(true);
		
		
		// log.info("Request String::::"+gson.toJson(requestBeanObj));
		////////////////////////System.out.println"Request String::::"+gson.toJson(requestBeanObj));
		resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Sku_Service_get_sku_details"), gson.toJson(requestBeanObj), "GET");
		// log.info("Response String::::"+resultStr);
		////////////////////////System.out.println"Sku Response String::::"+resultStr);
		requestBeanObj = gson.fromJson(resultStr,RequestBean.class);
		if(requestBeanObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
		   return resultStr;
		}else{
		   return "";
		}
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		return resultStr;
	} catch(Exception e){
		e.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		return resultStr;
	}
}



@SuppressWarnings("null")
public List<WarehousePicklistMaster> getStorageProductPicklist(String searchName,String searchType,String startDateStr,String endDateStr,String outletLocationStr,String stockTypeStr,String customerIdStr,String emailIdStr,String index,String flowUnder,String zone,String category,String subcategory,String brand,String department,Float startprice,Float endprice,Boolean stockdownload,String supplierName,String maxRecords,String locationsListValue,String storgaeArea){
	WarehousePicklistMaster warehousePicklistMaster = null;
	String resultStr = null;
	List<WarehousePicklistMaster> warehousePicklistMasters = null;
	RestfulServiceConnection restfulConnectionObj = null;
	ArrayList<LocationBean> locationBeansList = null;
	try{
		restfulConnectionObj = new RestfulServiceConnection();
		warehousePicklistMaster = new WarehousePicklistMaster();
		warehousePicklistMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		if(outletLocationStr.equals("all") || outletLocationStr.equals("")){
			 warehousePicklistMaster.setStoreLocation("");
		}
		else
	    warehousePicklistMaster.setStoreLocation(outletLocationStr.trim());
		
		warehousePicklistMaster.setStartIndex(index);
		warehousePicklistMaster.setMaxRecords(maxRecords);
		warehousePicklistMaster.setSearchCritaria(searchName.trim());
		warehousePicklistMaster.setStartDateStr(startDateStr.trim());
		warehousePicklistMaster.setEndDateStr(endDateStr.trim());
		
		warehousePicklistMaster.setStockType(stockTypeStr.trim());
		warehousePicklistMaster.setCategory(category.trim());
		warehousePicklistMaster.setSubCategory(subcategory.trim());
		warehousePicklistMaster.setBrand(brand.trim());
		warehousePicklistMaster.setDepartment(department.trim());
		
		warehousePicklistMaster.setZoneId(zone.trim());
		warehousePicklistMaster.setStartPriceRange(startprice);
		
		warehousePicklistMaster.setSupplierName(supplierName.trim());
		warehousePicklistMaster.setStorageArea(storgaeArea);
		
		
		
		
  ///      System.out.println("Request String:::"+gson.toJson(warehousePicklistMaster));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_picklist"), gson.toJson(warehousePicklistMaster), "GET");
///	    System.out.println("Stocks Response String:::"+resultStr);
		String totalRecords = Response.getResponseTotalRecords(resultStr);
	    String responseCode = Response.getResponseCode(resultStr);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			String responseList = Response.getResponseList(resultStr, "warehousePickListMaster");
			JSONArray jsonResponseArray = new JSONArray(responseList);
			warehousePicklistMasters = new ArrayList<WarehousePicklistMaster>();
			for (int i=0; i<jsonResponseArray.length(); i++) {
				warehousePicklistMaster = gson.fromJson(jsonResponseArray.getString(i), WarehousePicklistMaster.class);
				
				warehousePicklistMasters.add(warehousePicklistMaster);
			}
			warehousePicklistMasters.get(0).setTotalRecords(Integer.parseInt(totalRecords));
		}
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	} catch(Exception e){
		e.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
	}

    ////////////////////////System.out.println"Request String:::"+gson.toJson(warehousePicklistMasters));
	return warehousePicklistMasters;
	
}

@SuppressWarnings("null")
public List<WarehousePicklistMaster> getStorageProductPicklistEdit(String searchName,String searchType,String startDateStr,String endDateStr,String outletLocationStr,String stockTypeStr,String customerIdStr,String emailIdStr,String index,String flowUnder,String zone,String category,String subcategory,String brand,String department,Float startprice,Float endprice,Boolean stockdownload,String supplierName,String maxRecords,String locationsListValue,String storgaeArea,String pickListId){
	WarehousePicklistMaster warehousePicklistMaster = null;
	String resultStr = null;
	List<WarehousePicklistMaster> warehousePicklistMasters = null;
	RestfulServiceConnection restfulConnectionObj = null;
	ArrayList<LocationBean> locationBeansList = null;
	try{
		restfulConnectionObj = new RestfulServiceConnection();
		warehousePicklistMaster = new WarehousePicklistMaster();
		warehousePicklistMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		if(outletLocationStr.equals("all") || outletLocationStr.equals("")){
			 warehousePicklistMaster.setStoreLocation("");
		}
		else
	    warehousePicklistMaster.setStoreLocation(outletLocationStr.trim());
		
		warehousePicklistMaster.setStartIndex(index);
		warehousePicklistMaster.setMaxRecords(maxRecords);
		warehousePicklistMaster.setSearchCritaria(searchName.trim());
		warehousePicklistMaster.setStartDateStr(startDateStr.trim());
		warehousePicklistMaster.setEndDateStr(endDateStr.trim());
		
		warehousePicklistMaster.setStockType(stockTypeStr.trim());
		warehousePicklistMaster.setCategory(category.trim());
		warehousePicklistMaster.setSubCategory(subcategory.trim());
		warehousePicklistMaster.setBrand(brand.trim());
		warehousePicklistMaster.setDepartment(department.trim());
		
		warehousePicklistMaster.setZoneId(zone.trim());
		warehousePicklistMaster.setStartPriceRange(startprice);
		
		warehousePicklistMaster.setSupplierName(supplierName.trim());
		warehousePicklistMaster.setStorageArea(storgaeArea);
		warehousePicklistMaster.setPickListId(pickListId);
		
    ////    System.out.println("Request String:::"+gson.toJson(warehousePicklistMaster));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_picklist"), gson.toJson(warehousePicklistMaster), "GET");
	////    System.out.println("Stocks Response String:::"+resultStr);
		String totalRecords = Response.getResponseTotalRecords(resultStr);
	    String responseCode = Response.getResponseCode(resultStr);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			String responseList = Response.getResponseList(resultStr, "warehousePickListMaster");
			JSONArray jsonResponseArray = new JSONArray(responseList);
			warehousePicklistMasters = new ArrayList<WarehousePicklistMaster>();
			for (int i=0; i<jsonResponseArray.length(); i++) {
				warehousePicklistMaster = gson.fromJson(jsonResponseArray.getString(i), WarehousePicklistMaster.class);
				
				warehousePicklistMasters.add(warehousePicklistMaster);
			}
			warehousePicklistMasters.get(0).setTotalRecords(Integer.parseInt(totalRecords));
		}
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	} catch(Exception e){
		e.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
	}

    ////////////////////////System.out.println"Request String:::"+gson.toJson(warehousePicklistMasters));
	return warehousePicklistMasters;
	
}



public BarcodePrintRequestBean printBarcodesforSkuData(BarcodePrintRequestBean barcodeSkusObj,String customerId,String emailId){
	String result = null;
	try {
		RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
		barcodeSkusObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		
	//	System.out.println("Request String printBarcodesforSkuData:::"+gson.toJson(barcodeSkusObj));
		result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("print_barcodes_skuDetails"), gson.toJson(barcodeSkusObj), "GET");
	//	System.out.println("Response String:::::::::::"+result);
		barcodeSkusObj = gson.fromJson(result,BarcodePrintRequestBean.class);
			
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	} catch(Exception e){
		e.printStackTrace();
	}
	return barcodeSkusObj;
}







public List<UpdateDto> generatePicklistdetails(String customerIdStr, String emailIdStr, String startDate,String outletLocation, String stockReqType) {
	
	WarehousePicklistMaster warehousePicklistMaster = null;
	UpdateDto updateDto = null;
	String resultStr = null;
	List<UpdateDto> updateDtos = null;
	RestfulServiceConnection restfulConnectionObj = null;
	try{
		restfulConnectionObj = new RestfulServiceConnection();
		warehousePicklistMaster = new WarehousePicklistMaster();
		updateDto = new UpdateDto();
		warehousePicklistMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		if(outletLocation.equals("all") || outletLocation.equals("")){
			 warehousePicklistMaster.setStoreLocation("");
		}
		else
	    warehousePicklistMaster.setStoreLocation(outletLocation.trim());
		warehousePicklistMaster.setStartDateStr(startDate);
		warehousePicklistMaster.setPickListType(stockReqType);
		
    ///     System.out.println("Request String:::"+gson.toJson(warehousePicklistMaster));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("generate_picklist"), gson.toJson(warehousePicklistMaster), "GET");
////	     System.out.println("Stocks Response String:::"+resultStr);

	    String responseCode = Response.getResponseCode(resultStr);
	    String responseMsg = Response.getResponseMessage(resultStr);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			String responseList = Response.getResponseList(resultStr, "pickListDetails");
			JSONArray jsonResponseArray = new JSONArray(responseList);
			updateDtos = new ArrayList<UpdateDto>();
			for (int i=0; i<jsonResponseArray.length(); i++) {
				updateDto = gson.fromJson(jsonResponseArray.getString(i), UpdateDto.class);
				updateDto.setResponseMsg(responseMsg);
				updateDtos.add(updateDto);
			}
		}
		updateDtos.get(0).setResponseMsg(responseMsg);
		
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	} catch(Exception e){
		e.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
	}
	return updateDtos;
}




}

