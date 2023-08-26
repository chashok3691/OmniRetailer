
/*******************************************************************************
 * Copyright  2015 Omni Retailer Customer Console, All rights reserved.
 * Author : Sahitya P
 * Created On : 20-4-2015
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

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.tlabs.posweb.beans.BillOfMaterialResponse;
import com.tlabs.posweb.beans.GetStockVerificationDetailsResponse;
import com.tlabs.posweb.beans.ProcurementReceipt;
import com.tlabs.posweb.beans.RequestBean;
import com.tlabs.posweb.beans.SalesReportsBean;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.beans.StoreStockVerification;
import com.tlabs.posweb.beans.StoreStockVerificationBean;
import com.tlabs.posweb.beans.StoreStockVerificationMaster;
import com.tlabs.posweb.beans.StoreStockVerificationPosting;
import com.tlabs.posweb.beans.Verification;
import com.tlabs.posweb.beans.WareHouseStockVerification;
import com.tlabs.posweb.beans.WareHouseStockVerificationItems;
import com.tlabs.posweb.init.AppProperties;
import com.tlabs.posweb.util.Constants;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
import com.tlabs.posweb.util.RestfulServiceConnection;
import com.tlabs.posweb.util.Utilities;


/**
 * @author Sahitya
 * Verified By : 
 * 
 * This class is used for calling all methods of Store Stock Verification web service
 */

public class StockVerificationService {
	
	
	@Autowired
	private Gson gson;
	private static Logger log = Logger.getLogger(StockVerificationService.class);
	//private static Properties properties;
	@Autowired
	SessionScope sessionScope;
	
	/**
	 * @author Sahitya
	 * Verified By : 
	 * 
	 * @param customerId,emailId,outletlocation
	 * 
     * This method is used to get product stock verification details based on provided outlet location from webservices then send to GUI via controller
     * 
     * @return List of Product stock verification details
     */															
	public List<WareHouseStockVerification> getProductVerification(String customerIdStr,String emailIdStr,String outletLocationStr,
			String searchNameStr,String index,String startDateStr,String endDateStr,String maxRecords,String flowUnder,String mastercode){
		//StoreStockVerificationProxy stockVerificationProxyObj = null;
//		StoreStockVerificationMaster stockVerificationMaster =new StoreStockVerificationMaster();
		RestfulServiceConnection restfullconnection  = new RestfulServiceConnection();
		List <WareHouseStockVerification> warehouseVerificationDetailsList = null;
		String resultStr = null;
		try{
			// log.info("Get Product Stock Verification from webservice");
			warehouseVerificationDetailsList = new ArrayList<WareHouseStockVerification>();
			Verification verificationObj = new Verification();
			verificationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			if(mastercode.trim().isEmpty())
			{
				verificationObj.setStartIndex(index);
				verificationObj.setMaxRecords(maxRecords);
				verificationObj.setSearchCriteria(searchNameStr);
			}
			else{
				verificationObj.setLocation(outletLocationStr);
				verificationObj.setStartIndex(index);
				verificationObj.setMaxRecords(maxRecords);
				verificationObj.setStartDate(startDateStr);
				verificationObj.setEndDate(endDateStr);
				verificationObj.setSearchCriteria(searchNameStr);
				verificationObj.setMasterVerificationCode(mastercode);
			}
			// log.info("Request String::::"+gson.toJson(verificationObj));
			////////////System.out.println("Request String::::"+gson.toJson(verificationObj));
			//stockVerificationProxyObj = new StoreStockVerificationProxy();
			if(mastercode.trim().isEmpty())
			resultStr = restfullconnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_stockverification_masters"), gson.toJson(verificationObj), "GET");
			else
				resultStr = restfullconnection.getResponse(AppProperties.getRESTFulCloudServiceURL("getProduct_Verification"), gson.toJson(verificationObj), "GET");
			/*resultStr = stockVerificationProxyObj.getProductVerification(gson.toJson(verificationObj));
			// log.info("Response String::::"+resultStr);*/
			////////////System.out.println("Response String::::"+resultStr);
			verificationObj = gson.fromJson(resultStr,Verification.class);
			if(verificationObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				if(mastercode.trim().isEmpty())
					warehouseVerificationDetailsList = verificationObj.getVerificationMasterList();
				else
				warehouseVerificationDetailsList = verificationObj.getVerificationList();
				if(warehouseVerificationDetailsList != null && warehouseVerificationDetailsList.size() > 0){
					warehouseVerificationDetailsList.get(0).setTotalRecords(verificationObj.getTotalRecords());
					int slNo = Integer.parseInt(index);
					for(WareHouseStockVerification warehouseStockVerification : warehouseVerificationDetailsList){
						warehouseStockVerification.setSlNo(++slNo);
					}
				}
			}
			
		}catch(ConnectException ce) {
			ce.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("INVALID_REQUEST");
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("UNKNOWN_HOST");
		} catch(RemoteException rme){
			rme.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
		}catch(Exception e){
		    e.printStackTrace();
		    resultStr = (String) AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
		}
		return warehouseVerificationDetailsList;
	}

	
	/**
	 * @author Sahitya
	 * Verified By : 
	 * 
	 * @param customerId,emailId,verification code
	 * 
     * This method is used to get specific product stock details based on provided verification code from webservices then send to GUI via controller
     * 
     * @return List of Product Stock Verification Details
     */			
	public Verification getProductVerificationDetails(String customerIdStr,String emailIdStr,String verificationCodeStr,String index,String maxRecords){
		//StoreStockVerificationProxy stockVerificationProxyObj = null;
		String resultStr = null;
		Verification verificationObj = new Verification();
		try{
			//// log.info("Get Product Stock Verification Item Details from webservice");
			RestfulServiceConnection restfullconnection  = new RestfulServiceConnection();
			verificationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			verificationObj.setVerification_code(verificationCodeStr);
			verificationObj.setStartIndex(index);
			verificationObj.setMaxRecords(maxRecords);
			
			/*// log.info("Request String::::"+gson.toJson(verificationObj));
			stockVerificationProxyObj = new StoreStockVerificationProxy();
			resultStr = stockVerificationProxyObj.getProductVerification(gson.toJson(verificationObj));*/
			////////System.out.println("Response String::::"+resultStr);
			resultStr = restfullconnection.getResponse(AppProperties.getRESTFulCloudServiceURL("getProduct_Verification"), gson.toJson(verificationObj), "GET");
			
			verificationObj = gson.fromJson(resultStr,Verification.class);
			if(verificationObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				if(verificationObj.getStockVerificationObj().getItemsList() != null && verificationObj.getStockVerificationObj().getItemsList().size() > 0){
					int slNo = Integer.parseInt("0");
					verificationObj.getStockVerificationObj().getItemsList().get(0).setTotalRecords(verificationObj.getTotalRecords());
					for(WareHouseStockVerificationItems wareHouseStockVerificationItems : verificationObj.getStockVerificationObj().getItemsList())
						wareHouseStockVerificationItems.setSlNo(++slNo);
				}
				verificationObj.setWarehouseStockVerification(verificationObj.getStockVerificationObj());
			}
		}catch(ConnectException ce) {
			ce.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("INVALID_REQUEST");
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("UNKNOWN_HOST");
		} catch(RemoteException rme){
			rme.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
		}catch(Exception e){
		    e.printStackTrace();
		    resultStr = (String) AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
		}
		return verificationObj;
		
	}
	
	/**
	 * @author Manasa
	 * 
	 *This method is used to call updateWareHouseStockVerificationMaster,createStockVerificationMaster methods of web service and return the response based on flowunder condition
	 *
	 **/
	
	
	public String updatestockverification(StoreStockVerificationMaster finalobj )
	{
		String resultStr=null;
		try{
		
//			StoreStockVerificationMaster storeStockverificationmaster=new StoreStockVerificationMaster();
			finalobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		
			finalobj.setStatus("In Progress");
			finalobj.setVerificationStartDateStr(finalobj.getStartDateStr());
			finalobj.setVerificationEndDateStr(finalobj.getEndDateStr());
			if(!finalobj.getVerification_code().trim().isEmpty())
				finalobj.setVerification_code(finalobj.getVerification_code());
			//storeStockverificationmaster.setDescription(description);
			//// log.info("Request String::::::::::::"+gson.toJson(finalobj));	
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			if(finalobj.getFlowUnder().equals("warehouse"))
			{
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getAppMessageByProperty("update_WareHouse_Stock_VerificationMaster"), gson.toJson(finalobj));
			}
			else
				resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("updare_stock_verification"), gson.toJson(finalobj));
			/*else
			{
				if(!finalobj.getVerification_code().trim().isEmpty())
					resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getAppMessageByProperty("updare_stock_verification"), gson.toJson(finalobj));
				else
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getAppMessageByProperty("create_stock_verification"), gson.toJson(finalobj));
			}*/
			//// log.info("Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				if(!finalobj.getVerification_code().trim().isEmpty())
					resultStr = AppProperties.getAppMessageByProperty("STOCK_VERIFICATION_UPDATE_SUCCESS").trim();
				else
				resultStr = AppProperties.getAppMessageByProperty("STOCK_VERIFICATION_CREATION_SUCCESS").trim();
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
	 * @author Manasa
	 * 
	 *This method is used to call updateStock methods of web service and return the response 
	 *
	 **/
	
	
	public String writeOffstockverification(StoreStockVerificationBean finalobj)
	{
		//StoreStockVerificationProxy stockVerificationProxyObj = null;
		String resultStr=null;
		try{
			finalobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//stockVerificationProxyObj=new StoreStockVerificationProxy();
			//// log.info("Request String::::::::::::"+gson.toJson(finalobj));	
		   //////////////////System.out.println("Request String::::::::::::"+gson.toJson(finalobj));
			/*resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("do_StockVerification_WriteOff"), gson.toJson(finalobj));*/
		  // resultStr = stockVerificationProxyObj.updateStock(gson.toJson(finalobj));
			////////System.out.println("Writeoff Response String:::::::::::"+gson.toJson(finalobj));
			//// log.info(" Response String:::::::::::"+resultStr);
			if(finalobj.getFlowUnder() == "outlet" || finalobj.getFlowUnder().equals("outlet"))
			resultStr =new  RestfulServiceConnection().getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_stock"),gson.toJson(finalobj));
			else
		    resultStr =new  RestfulServiceConnection().getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_warehouse_stockverf"),gson.toJson(finalobj));
	
			
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					resultStr = AppProperties.getAppMessageByProperty("VERIFICATION_UPDATED_SUCCESSFULLY").trim();
			}
			else{
				resultStr = Response.getResponseMessage(resultStr);
			}
		} 
		
		catch(ConnectException ce) {
			ce.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		} 
		catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} 
		 catch (UnknownHostException uhe) {
				uhe.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
			}
		catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
	}
	
	
	
	
	/**
	 * @author chaithanya
	 * 
     * This method is used to get specific product stock details based on provided verification code from webservices then send to GUI via controller
     * 
     * @return List of Product Stock Raw Materials Details
     */			
	public BillOfMaterialResponse getMaterialConsumption(String customerIdStr,String emailIdStr,String index,String maxRecords,String zone, String location, String category, String subcategory, String brand,String startdate,String enddate,String search,String locationListAll){
		String resultStr = null;
		RequestBean verificationObj = new RequestBean();
		BillOfMaterialResponse bomresponse = new BillOfMaterialResponse();
		RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
		try{
			// log.info("Get Product Stock Verification Item Details from webservice");
			verificationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			verificationObj.setStartIndex(index);
			verificationObj.setMaxRecords(maxRecords);
			verificationObj.setZoneId(zone);
			if(location.equals("all") || location.equals("")){
				List<String> myList = new ArrayList<String>(Arrays.asList(locationListAll.split(",")));
				verificationObj.setLocationsList(myList);
				}
			else
			verificationObj.setStoreLocation(location);
			verificationObj.setCategory(category);
			verificationObj.setSubCategory(subcategory);
			verificationObj.setBrand(brand);
			verificationObj.setStartDateStr(startdate);
			verificationObj.setEndDateStr(enddate);
			verificationObj.setSearchCriteria(search);
			//// log.info("Request String::::"+gson.toJson(verificationObj));
			//////////////////System.out.println("Request String::::"+gson.toJson(verificationObj));
			resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_bom_reports"), gson.toJson(verificationObj), "GET");
			//// log.info("Response String::::"+resultStr);
			verificationObj = gson.fromJson(resultStr,RequestBean.class);
			if(verificationObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				bomresponse = gson.fromJson(resultStr,BillOfMaterialResponse.class);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("INVALID_REQUEST");
		}  catch(Exception e){
		    e.printStackTrace();
		    resultStr = (String) AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
		}
		return bomresponse;
		
	}
	
	
	/**
	 * @author chaithanya
	 * 
     * This method is used to get specific product stock details based on provided verification code from webservices then send to GUI via controller
     * 
     * @return List of Product Stock Raw Materials Details
     */			
	public BillOfMaterialResponse getSuppliesReport(String customerIdStr,String emailIdStr,String index,String maxRecords,String zone, String location, String category, String subcategory, String brand,String department,String subdepartment,String startdate,String enddate,String search){
		String resultStr = null;
		RequestBean verificationObj = new RequestBean();
		BillOfMaterialResponse bomresponse = new BillOfMaterialResponse();
		RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
		try{
			// log.info("Get Product Stock Verification Item Details from webservice");
			verificationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			verificationObj.setStartIndex(index);
			verificationObj.setMaxRecords(maxRecords);
			verificationObj.setZoneId(zone);
			verificationObj.setStoreLocation(location);
			verificationObj.setLocation(location);
			verificationObj.setCategory(category);
			verificationObj.setDepartment(department);
			verificationObj.setSubDepartment(subdepartment);
			//verificationObj.setCategory(category);
			verificationObj.setSubCategory(subcategory);
			verificationObj.setBrand(brand);
			verificationObj.setStartDate(startdate);
			verificationObj.setEndDate(enddate);
			verificationObj.setSearchCriteria(search);
			// log.info("Request String::::"+gson.toJson(verificationObj));
			//////////////////System.out.println("Request String::::"+gson.toJson(verificationObj));
			resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_supplier_report"), gson.toJson(verificationObj), "GET");
			// log.info("Response String::::"+resultStr);
			//////////////////System.out.println("Response String::::"+resultStr);
			verificationObj = gson.fromJson(resultStr,RequestBean.class);
			if(verificationObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				bomresponse = gson.fromJson(resultStr,BillOfMaterialResponse.class);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("INVALID_REQUEST");
		}  catch(Exception e){
		    e.printStackTrace();
		    resultStr = (String) AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
		}
		return bomresponse;
		
	}
	
	/**
	 * @author chaithanya
	 * 
     * This method is used to get specific product stock details based on provided verification code from webservices then send to GUI via controller
     * 
     * @return List of Product Stock Raw Materials Details
     */			
	public BillOfMaterialResponse getStockMovement(String customerIdStr,String emailIdStr,String index,String maxRecords,String zone, String location, String category, String subcategory, String brand,String startdate,String enddate,String search,String locationListAll,String saveFlag){
		String resultStr = null;
		RequestBean verificationObj = new RequestBean();
		BillOfMaterialResponse bomresponse = new BillOfMaterialResponse();
		RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
		try{
			// log.info("Get Product Stock Verification Item Details from webservice");
			verificationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			verificationObj.setStartIndex(index);
			verificationObj.setMaxRecords(maxRecords);
			verificationObj.setZoneId(zone);
			if(location.equals("all") || location.equals("")){
			List<String> myList = new ArrayList<String>(Arrays.asList(locationListAll.split(",")));	
			verificationObj.setLocationsList(myList);
			}
			else
			verificationObj.setStoreLocation(location);
			verificationObj.setProductCategory(category);
			verificationObj.setSubCategory(subcategory);
			verificationObj.setBrand(brand);
			verificationObj.setStartDateStr(startdate);
			verificationObj.setEndDateStr(enddate);
			verificationObj.setSearchCriteria(search);
			if(saveFlag.equalsIgnoreCase("save")){
				verificationObj.setSaveStockMovementFlag(true);
			}
			
			//////////////System.out.println("Request String::::"+gson.toJson(verificationObj));
			resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_stock_movement"), gson.toJson(verificationObj), "GET");
			//////////////System.out.println("Responce String::::"+gson.toJson(resultStr));
			verificationObj = gson.fromJson(resultStr,RequestBean.class);
			if(verificationObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				bomresponse = gson.fromJson(resultStr,BillOfMaterialResponse.class);
				
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("INVALID_REQUEST");
		}  catch(Exception e){
		    e.printStackTrace();
		    resultStr = (String) AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
		}
		return bomresponse;
		
	}
	/**
	 * @author Sahitya
	 * Verified By : 
	 * 
	 * @param customerId,emailId,warehouseLocationStr
	 * 
     * This method is used to get product stock verification details based on provided warehouse location from webservices then send to GUI via controller
     * 
     * @return List of Product stock verification details
     */
	public List<WareHouseStockVerification> getWarehouseProductVerification(String customerIdStr,String emailIdStr,String warehouseLocationStr,
			String searchNameStr,String index,String startDateStr,String endDateStr,String maxRecords,String flowUnder){
		List<WareHouseStockVerification> warehouseVerificationDetailsList = null;
		String resultStr = null;
		//StoreStockVerificationMaster stockVerificationMaster=new StoreStockVerificationMaster();
		try{
			// log.info("Get Product Stock Verification from webservice");
			warehouseVerificationDetailsList = new ArrayList<WareHouseStockVerification>();
			Verification verificationObj = new Verification();
			verificationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			verificationObj.setWh_location(warehouseLocationStr);
			verificationObj.setStartIndex(index);
			verificationObj.setMaxRecords(maxRecords);
			verificationObj.setVerificationStartDateStr(startDateStr);
			verificationObj.setVerificationEndDateStr(endDateStr);
			//verificationObj.setStartDate(startDateStr);
			//verificationObj.setEndDate(endDateStr);
			verificationObj.setSearchCriteria(searchNameStr);
			// log.info("Request String::::"+gson.toJson(verificationObj));
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_WareHouseStock_Verification_Master"), gson.toJson(verificationObj), "GET");
			//resultStr = restfulConnectionObj.getResponse(AppProperties.getAppMessageByProperty("warehouse_stock_verification_getStockVerification"), gson.toJson(verificationObj), "GET");
			// log.info("Response String::::"+resultStr);
			verificationObj = gson.fromJson(resultStr,Verification.class);
			if(verificationObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				warehouseVerificationDetailsList = verificationObj.getVerificationMasterList();
				//warehouseVerificationDetailsList = verificationObj.getWhVerificationList();
				if(warehouseVerificationDetailsList != null && warehouseVerificationDetailsList.size() > 0){
					warehouseVerificationDetailsList.get(0).setTotalRecords(verificationObj.getTotalRecords());
					int slNo = Integer.parseInt(index);
					for(WareHouseStockVerification warehouseStockVerification : warehouseVerificationDetailsList){
						warehouseStockVerification.setSlNo(++slNo);
						warehouseStockVerification.setLocation(warehouseStockVerification.getLocation());
					}
				}
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("INVALID_REQUEST");
		}catch(Exception e){
		    e.printStackTrace();
		    resultStr = (String) AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
		}
		return warehouseVerificationDetailsList;
	}
	
	
	
	
	
	public List<WareHouseStockVerification> getWarehouseStockVerification(String customerIdStr,String emailIdStr,String warehouseLocationStr,
			String searchNameStr,String index,String startDateStr,String endDateStr,String maxRecords,String flowUnder,String verificationCode){
		List<WareHouseStockVerification> warehouseVerificationDetailsList = null;
		String resultStr = null;
		//StoreStockVerificationMaster stockVerificationMaster=new StoreStockVerificationMaster();
		try{
			// log.info("Get Product Stock Verification from webservice");
			/*warehouseVerificationDetailsList = new ArrayList<WareHouseStockVerification>();*/
			Verification verificationObj = new Verification();
			verificationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			verificationObj.setWh_location(warehouseLocationStr);
			verificationObj.setStartIndex(index);
			verificationObj.setMaxRecords(maxRecords);
			verificationObj.setStartDate(startDateStr);
			verificationObj.setEndDate(endDateStr);
			verificationObj.setSearchCriteria(searchNameStr);
			verificationObj.setVerification_code(verificationCode);
			verificationObj.setMasterVerificationCode(verificationCode);
			// log.info("Request String::::"+gson.toJson(verificationObj));
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			if(verificationCode.trim().isEmpty())
				resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_WareHouseStock_Verification_Master"), gson.toJson(verificationObj), "GET");
			else
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_warehouse_stock_verification"), gson.toJson(verificationObj), "GET");
			//resultStr = restfulConnectionObj.getResponse(AppProperties.getAppMessageByProperty("warehouse_stock_verification_getStockVerification"), gson.toJson(verificationObj), "GET");
			// log.info("Response String::::"+resultStr);
			verificationObj = gson.fromJson(resultStr,Verification.class);
			if(verificationObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				//warehouseVerificationDetailsList = verificationObj.getVerificationMasterList();
				warehouseVerificationDetailsList = verificationObj.getWhVerificationList();
				if(warehouseVerificationDetailsList != null && warehouseVerificationDetailsList.size() > 0){
					warehouseVerificationDetailsList.get(0).setTotalRecords(verificationObj.getTotalRecords());
					int slNo = Integer.parseInt(index);
					for(WareHouseStockVerification warehouseStockVerification : warehouseVerificationDetailsList){
						warehouseStockVerification.setSlNo(++slNo);
						warehouseStockVerification.setLocation(warehouseStockVerification.getWh_location());
					}
				}
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("INVALID_REQUEST");
		}catch(Exception e){
		    e.printStackTrace();
		    resultStr = (String) AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
		}
		return warehouseVerificationDetailsList;
	}
	
	
	
	
	
	
	
	/**
	 * @author Sahitya
	 * Verified By : 
	 * 
	 * @param customerId,emailId,verification code
	 * 
     * This method is used to get specific product stock details based on provided verification code from webservices then send to GUI via controller
     * 
     * @return List of Product Stock Verification Details
     */
	public Verification getWarehouseProductVerificationDetails(String customerIdStr,String emailIdStr,String verificationCodeStr,String index,String maxRecords){
		Verification verificationObj =null;
		String resultStr = null;
		try{
			// log.info("Get Product Stock Verification Item Details from webservice");
			verificationObj = new Verification();
			verificationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			verificationObj.setVerification_code(verificationCodeStr);
			verificationObj.setStartIndex(index);
			verificationObj.setMaxRecords(maxRecords);
			// log.info("Request String::::"+gson.toJson(verificationObj));
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_warehouse_stock_verification"), gson.toJson(verificationObj), "GET");
			// log.info("Response String::::"+resultStr);
			verificationObj = gson.fromJson(resultStr,Verification.class);
			if(verificationObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
//				warehouseVerificationItemsDetailsList = warehouseStockVerificationObj.getWarehouseStockVerification().getItemsList();
				if(verificationObj.getWarehouseStockVerification().getItemsList() != null && verificationObj.getWarehouseStockVerification().getItemsList().size() > 0){
					int slNo = Integer.parseInt("0");
					verificationObj.getWarehouseStockVerification().getItemsList().get(0).setTotalRecords(verificationObj.getTotalRecords());
					for(WareHouseStockVerificationItems wareHouseStockVerificationItems : verificationObj.getWarehouseStockVerification().getItemsList())
						wareHouseStockVerificationItems.setSlNo(++slNo);
				}
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("INVALID_REQUEST");
		}catch(Exception e){
		    e.printStackTrace();
		    resultStr = (String) AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
		}
		return verificationObj;
		
	}
	
	
	public List<WareHouseStockVerification> getStockVerification(String customerIdStr,String emailIdStr,String warehouseLocationStr,
			String searchNameStr,String index,String startDateStr,String endDateStr,String maxRecords,String flowUnder,String verificationCode){
		List<WareHouseStockVerification> warehouseVerificationDetailsList = null;
		String resultStr = null;
		//StoreStockVerificationMaster stockVerificationMaster=new StoreStockVerificationMaster();
		try{
			// log.info("Get Product Stock Verification from webservice");
			/*warehouseVerificationDetailsList = new ArrayList<WareHouseStockVerification>();*/
			Verification verificationObj = new Verification();
			verificationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			verificationObj.setWh_location(warehouseLocationStr);
			verificationObj.setStartIndex(index);
			verificationObj.setMaxRecords(maxRecords);
			verificationObj.setStartDate(startDateStr);
			verificationObj.setEndDate(endDateStr);
			verificationObj.setSearchCriteria(searchNameStr);
			//verificationObj.setVerification_code(verificationCode);
			verificationObj.setMasterVerificationCode(verificationCode);
			// log.info("Request String::::"+gson.toJson(verificationObj));
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
		
				resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_warehouse_stock_verification"), gson.toJson(verificationObj), "GET");
			/*else
			resultStr = restfulConnectionObj.getResponse(AppProperties.getAppMessageByProperty("get_warehouse_stock_verification"), gson.toJson(verificationObj), "GET");*/
			//resultStr = restfulConnectionObj.getResponse(AppProperties.getAppMessageByProperty("warehouse_stock_verification_getStockVerification"), gson.toJson(verificationObj), "GET");
			// log.info("Response String::::"+resultStr);
			verificationObj = gson.fromJson(resultStr,Verification.class);
			if(verificationObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				//warehouseVerificationDetailsList = verificationObj.getVerificationMasterList();
				warehouseVerificationDetailsList = verificationObj.getWhVerificationList();
				if(warehouseVerificationDetailsList != null && warehouseVerificationDetailsList.size() > 0){
					warehouseVerificationDetailsList.get(0).setTotalRecords(verificationObj.getTotalRecords());
					int slNo = Integer.parseInt(index);
					for(WareHouseStockVerification warehouseStockVerification : warehouseVerificationDetailsList){
						warehouseStockVerification.setSlNo(++slNo);
						warehouseStockVerification.setLocation(warehouseStockVerification.getWh_location());
					}
				}
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("INVALID_REQUEST");
		}catch(Exception e){
		    e.printStackTrace();
		    resultStr = (String) AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
		}
		return warehouseVerificationDetailsList;
	}
	
	
	
	/**
	 * @author Manasa
	 * Verified By : 
	 * Created On: 3-april-2017
	 * @param customerId,emailId,verification code,index
	 * 
     * This method is used to get specific stock verification details based on provided verification code from webservices then send to GUI via controller
     * 
     * @return  Stock Verification Master Details
     */
	
	public Verification getWarehouseStockVerificationMaster(String customerIdStr,String emailIdStr,String verificationCode,String index,String flowUnder){
		String result = null;
		Verification procurementReceiptObj = new Verification();
		RestfulServiceConnection restfulServiceConnection = null;
		
		try {
			restfulServiceConnection = new RestfulServiceConnection();
			procurementReceiptObj.setVerification_code(verificationCode);
			procurementReceiptObj.setStartIndex(index);
			//procurementReceiptObj.setLocation(verificationCode);
			procurementReceiptObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String:::::::::"+gson.toJson(procurementReceiptObj));
			if(flowUnder.equals("outlet"))
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_stockverification_masters"), gson.toJson(procurementReceiptObj), "GET");
			else
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_WareHouseStock_Verification_Master"), gson.toJson(procurementReceiptObj), "GET");
			
			// log.info("Response String:::::::::"+result);
			//System.out.println("Response String:::::::::"+result);
	
			procurementReceiptObj = gson.fromJson(result, Verification.class);
			
				
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}  catch(Exception e){
			e.printStackTrace();
		}
		return procurementReceiptObj;
	}
	
	
	
	
	
	/**
	 * @author Manasa
	 * 
	 *This method is used to call createWareHouseStockVerificationMaster,createStockVerificationMaster methods of web service and return the response based on flowunder condition
	 *
	 **/
	
	
	public String createStockVerification(StoreStockVerificationMaster finalobj )
	{
		String resultStr=null;
		try{
		
//			StoreStockVerificationMaster storeStockverificationmaster=new StoreStockVerificationMaster();
			finalobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		
			if(!finalobj.getVerification_code().trim().isEmpty()){
				
			}else {
			finalobj.setStatus("In Progress");
			}
			
			finalobj.setVerificationStartDateStr(finalobj.getStartDateStr());
			finalobj.setVerificationEndDateStr(finalobj.getEndDateStr());
			if(!finalobj.getVerification_code().trim().isEmpty())
				finalobj.setVerification_code(finalobj.getVerification_code());
			//storeStockverificationmaster.setDescription(description);
			//// log.info("Request String::::::::::::"+gson.toJson(finalobj));
			//System.out.println("Request String::::::::::::"+gson.toJson(finalobj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			if(finalobj.getFlowUnder().equals("warehouse"))
			{
				if(!finalobj.getVerification_code().trim().isEmpty())
					resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_WareHouseStock_Verification_Master"), gson.toJson(finalobj));

				else
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_WareHouseStock_Verification_Master"), gson.toJson(finalobj));
			}
			else
			{
				if(!finalobj.getVerification_code().trim().isEmpty())
					resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("updare_stock_verification"), gson.toJson(finalobj));
				else
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_stock_verification"), gson.toJson(finalobj));
			}
			//// log.info("Response String:::::::::::"+resultStr);
			//System.out.println(" UPDATE Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				if(!finalobj.getVerification_code().trim().isEmpty())
					resultStr = AppProperties.getAppMessageByProperty("STOCK_VERIFICATION_UPDATE_SUCCESS").trim();
				else
				resultStr = AppProperties.getAppMessageByProperty("STOCK_VERIFICATION_CREATION_SUCCESS").trim();
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
	

	public String createVerification(StoreStockVerification stverificationObj){
		String result = null;
		try {
			//StoreStockVerificationProxy stockVerificationProxyObj  = new StoreStockVerificationProxy();
			
			stverificationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			/*// log.info("Request String::::::::::::"+gson.toJson(stverificationObj));
			//////////////////System.out.println("Request String::::::::::::"+gson.toJson(stverificationObj));
			result = stockVerificationProxyObj.createStock(gson.toJson(stverificationObj));
		//	////////////////System.out.println("Request String::::::::::::"+gson.toJson(stverificationObj));
			// log.info("Response String:::::::::::"+result);
			//////////////////System.out.println(result);
*/			
			
			/**	added by - vasudev   purpose - using rest service call instead of soap call*/
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			result = restfulServiceConnectionObj.getResponseFromPost( AppProperties.getRESTFulCloudServiceURL("create_stock"),gson.toJson(stverificationObj));

			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				//////////////////System.out.println("dgsdfg");
				result = AppProperties.getAppMessageByProperty("STOCK_VERIFICATION_CREATION_SUCCESS").trim();
			else
				result = Response.getResponseMessage(result);
		}catch(ConnectException ce) {
			ce.printStackTrace();
			result = Utilities.getResponseCode("SERVER_NOT_RESPONDING").trim();
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = Utilities.getResponseCode("INVALID_REQUEST").trim();
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			result = Utilities.getResponseCode("UNKNOWN_HOST").trim();
		} catch(RemoteException rme){
			rme.printStackTrace();
			result = Utilities.getResponseCode("SERVER_NOT_RESPONDING").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	


	public String updateVerification(StoreStockVerification stverificationObj){
		String result = null;
		try {
			//StoreStockVerificationProxy stockVerificationProxyObj  = new StoreStockVerificationProxy();
			/*storeTaxationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			storeTaxationObj.setUserName(emailIdStr);
			storeTaxationObj.setRoleName(roleStr);*/
			//stverificationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			stverificationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			stverificationObj.setStartIndex("-1");
			stverificationObj.setMasterVerificationCode(stverificationObj.getMasterVerificationCode());
			
			
			/*// log.info("Request String::::::::::::"+gson.toJson(stverificationObj));
			//////////////////System.out.println("Request String::::::::::::"+gson.toJson(stverificationObj));
			result = stockVerificationProxyObj.updateStock(gson.toJson(stverificationObj));
			// log.info("Response String:::::::::::"+result);
			//////////////////System.out.println("Response String:::::::::::"+result);
*/			
			result =new  RestfulServiceConnection().getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_stock"),gson.toJson(stverificationObj));

			
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("STOCK_VERIFICATION_UPDATE_SUCCESS").trim();
			else
				result = Response.getResponseMessage(result);
		}catch(ConnectException ce) {
			ce.printStackTrace();
			result = Utilities.getResponseCode("SERVER_NOT_RESPONDING").trim();
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = Utilities.getResponseCode("INVALID_REQUEST").trim();
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			result = Utilities.getResponseCode("UNKNOWN_HOST").trim();
		} catch(RemoteException rme){
			rme.printStackTrace();
			result = Utilities.getResponseCode("SERVER_NOT_RESPONDING").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	public List<WareHouseStockVerification> getProductVerification(String customerIdStr,String emailIdStr,String outletLocationStr,
			String searchNameStr,String index,String startDateStr,String endDateStr,String maxRecords,String flowUnder,String mastercode,String category,String subCategory  ){
		//StoreStockVerificationProxy stockVerificationProxyObj = null;
//		StoreStockVerificationMaster stockVerificationMaster =new StoreStockVerificationMaster();
		RestfulServiceConnection restfullconnection  = new RestfulServiceConnection();
		List <WareHouseStockVerification> warehouseVerificationDetailsList = null;
//		WareHouseStockVerification wareHouseVerification=new WareHouseStockVerification();
//		List <WareHouseStockVerificationItems> ware = null;
		String resultStr = null;
		try{
			// log.info("Get Product Stock Verification from webservice");
			warehouseVerificationDetailsList = new ArrayList<WareHouseStockVerification>();
			Verification verificationObj = new Verification();
			verificationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			if(mastercode.trim().isEmpty())
			{
				verificationObj.setStartIndex(index);
				verificationObj.setSearchCriteria(searchNameStr);
			}
			else{
				//verificationObj.setLocation(outletLocationStr);
				verificationObj.setStartIndex(index);
				verificationObj.setMaxRecords(maxRecords);
				verificationObj.setStartDate(startDateStr);
				verificationObj.setEndDate(endDateStr);
				verificationObj.setSearchCriteria(searchNameStr);
				verificationObj.setMasterVerificationCode(mastercode);
				verificationObj.setProductCategory(category);
				verificationObj.setSubCategory(subCategory);
			
			}
			// log.info("Request String::::"+gson.toJson(verificationObj));
		//////////////////System.out.println("Request String::::"+gson.toJson(verificationObj));
			//stockVerificationProxyObj = new StoreStockVerificationProxy();
			if(mastercode.trim().isEmpty())
			resultStr = restfullconnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_stockverification_masters"), gson.toJson(verificationObj), "GET");
			else
			resultStr = restfullconnection.getResponse(AppProperties.getRESTFulCloudServiceURL("getProduct_Verification"), gson.toJson(verificationObj), "GET");
			
			//resultStr = stockVerificationProxyObj.getProductVerification(gson.toJson(verificationObj));
			//// log.info("Response String::::"+resultStr);
			//////////////////System.out.println("Response String::::"+resultStr);
			resultStr.toString();
			verificationObj = gson.fromJson(resultStr,Verification.class);
			if(verificationObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				if(mastercode.trim().isEmpty())
					warehouseVerificationDetailsList = verificationObj.getVerificationMasterList();
				else
					
				
				warehouseVerificationDetailsList = verificationObj.getVerificationList();
					/*for(int i=0;i<warehouseVerificationDetailsList.size();i++){
					ware = verificationObj.getVerificationList().get(i).getItemsList();
					}
					//wareHouseVerification.add(ware);
					wareHouseVerification.setItemsList(ware);
					warehouseVerificationDetailsList.add(wareHouseVerification);
					}*/
				if(warehouseVerificationDetailsList != null && warehouseVerificationDetailsList.size() > 0){
					warehouseVerificationDetailsList.get(0).setTotalRecords(verificationObj.getTotalRecords());
					int slNo = Integer.parseInt(index);
					for(WareHouseStockVerification warehouseStockVerification : warehouseVerificationDetailsList){
						warehouseStockVerification.setSlNo(++slNo);
					}
				}
			}
			
		}catch(ConnectException ce) {
			ce.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("INVALID_REQUEST");
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("UNKNOWN_HOST");
		} catch(RemoteException rme){
			rme.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
		}catch(Exception e){
		    e.printStackTrace();
		    resultStr = (String) AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
		}
		return warehouseVerificationDetailsList;
	}
	

	/**
	 * @author Manasa
	 * 
	 *This method is used to call getProductVerification methods of web service and return the response of Product Stock Verification details
	 *
	 **/
public StoreStockVerification getProductDetails(String customerIdStr,String emailIdStr,String verificationCodeStr,String index,String maxRecords){
		//StoreStockVerificationProxy stockVerificationProxyObj = null;
		String resultStr = null;
		StoreStockVerification verificationObj = new StoreStockVerification();
		try{
//			////////////////System.out.println("dfgvf");
			//// log.info("Get Product Stock Verification Item Details from webservice");
			RestfulServiceConnection restfullconnection  = new RestfulServiceConnection();
			verificationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			verificationObj.setVerification_code(verificationCodeStr);
			
				verificationObj.setStartIndex("-1");
				
				
			
			//// log.info("open Request String::::"+gson.toJson(verificationObj));
//			////////////////System.out.println(gson.toJson(verificationObj));
		/*	stockVerificationProxyObj = new StoreStockVerificationProxy();
			resultStr = stockVerificationProxyObj.getProductVerification(gson.toJson(verificationObj));
			// log.info("Response String::::"+resultStr);
			//////////////System.out.println("Response String::::"+resultStr);*/
			//////System.out.println("request String::::getProduct_Verification"+gson.toJson(verificationObj));
			resultStr = restfullconnection.getResponse(AppProperties.getRESTFulCloudServiceURL("getProduct_Verification"), gson.toJson(verificationObj), "GET");
			////////System.out.println("Response String::::getProduct_Verification"+resultStr);
			
			String responseCode = Response.getResponseCode(resultStr);
			
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				verificationObj = gson.fromJson(resultStr,StoreStockVerification.class);
				verificationObj.setTotalRecords(verificationObj.getTotalRecords());
			}
		}catch(ConnectException ce) {
			ce.printStackTrace();
			resultStr = (String) Utilities.getResponseCode("SERVER_NOT_RESPONDING");
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = (String) Utilities.getResponseCode("INVALID_REQUEST");
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			resultStr = (String) Utilities.getResponseCode("UNKNOWN_HOST");
		} catch(RemoteException rme){
			rme.printStackTrace();
			resultStr = (String) Utilities.getResponseCode("SERVER_NOT_RESPONDING");
		}catch(Exception e){
		    e.printStackTrace();
		    resultStr = (String) Utilities.getResponseCode("FAILED_TO_RECEIVE_RESPONSE");
		}
		return verificationObj;
		
	}
	
/**
 * @author vijay
 * @param subdepartment 
 * @param department 
 * @param subcategory 
 * @created on 22-08-2017 
 * This method is used to get stock verification masters report from webservices then send to GUI via controller
 * @return List of Product Stock Verification Details
 */			
public List<WareHouseStockVerification> getProductVerificationReport(String customerIdStr,String emailIdStr,String outletLocationStr,
		String searchNameStr,String index,String startDateStr,String endDateStr,String maxRecords,String flowUnder,String verificationcode,String category, String subcategory, String department, String subdepartment){
	//StoreStockVerificationProxy stockVerificationProxyObj = null;
	List <WareHouseStockVerification> warehouseVerificationDetailsList = null;
	String resultStr = null;
	RestfulServiceConnection restfulConnectionObj = null;
	try{
		//// log.info("Get Product Stock Verification from webservice");
		restfulConnectionObj = new RestfulServiceConnection();
		warehouseVerificationDetailsList = new ArrayList<WareHouseStockVerification>();
		Verification verificationObj = new Verification();
		verificationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
//		
		if(verificationcode != null & verificationcode != "" & !verificationcode.equals(""))
			verificationObj.setLocation("");
		else
			verificationObj.setLocation(outletLocationStr);
			verificationObj.setStartIndex(index);
			verificationObj.setMaxRecords(maxRecords);
			verificationObj.setStartDate(startDateStr);
			verificationObj.setEndDate(endDateStr);
			verificationObj.setSearchCriteria(searchNameStr);
			verificationObj.setVerification_code(verificationcode);
			verificationObj.setProductCategory(category);
			verificationObj.setSubCategory(subcategory);
			verificationObj.setDepartment(department);
			verificationObj.setSubDepartment(subdepartment);
						
		//// log.info("Request String::::"+gson.toJson(verificationObj));
		
		
////////System.out.println("Request String::::"+gson.toJson(verificationObj));
		//stockVerificationProxyObj = new StoreStockVerificationProxy();
			if(flowUnder.equals("outlet")){	
				resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("getProduct_Verification"), gson.toJson(verificationObj), "GET");
			}else{
				resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_warehouse_stockverf"), gson.toJson(verificationObj), "GET");

			}

		
		//		resultStr = stockVerificationProxyObj.getProductVerification(gson.toJson(verificationObj));
		
		// log.info("Response String::::"+resultStr);
		
		//////////System.out.println("Response String::::"+resultStr);
		verificationObj = gson.fromJson(resultStr,Verification.class);
		if(verificationObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
//		
			warehouseVerificationDetailsList = verificationObj.getVerificationList();
			
			if(warehouseVerificationDetailsList != null && warehouseVerificationDetailsList.size() > 0){
				warehouseVerificationDetailsList.get(0).setTotalRecords(verificationObj.getTotalRecords());
				int slNo = Integer.parseInt(index);
				for(WareHouseStockVerification warehouseStockVerification : warehouseVerificationDetailsList){
					warehouseStockVerification.setSlNo(++slNo);
				}
			}
		}
		
	}catch(ConnectException ce) {
		ce.printStackTrace();
		resultStr = (String) AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = (String) AppProperties.getAppMessageByProperty("INVALID_REQUEST");
	} catch (UnknownHostException uhe) {
		uhe.printStackTrace();
		resultStr = (String) AppProperties.getAppMessageByProperty("UNKNOWN_HOST");
	} catch(RemoteException rme){
		rme.printStackTrace();
		resultStr = (String) AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
	}catch(Exception e){
	    e.printStackTrace();
	    resultStr = (String) AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
	}
	return warehouseVerificationDetailsList;
}




/**
 * @author vijay
 * @created on 31-08-2017 
 * This method is used to get stock verification masters report from webservices then send to GUI via controller.
 * @return List of Product Stock Verification Details report based on verificationCode.
 */			
public List<WareHouseStockVerification> getProductVerificationReportWriteOff(String customerIdStr,String emailIdStr,String outletLocationStr,
	String searchNameStr,String index,String startDateStr,String endDateStr,String maxRecords,String flowUnder,String verificationcode){
	//StoreStockVerificationProxy stockVerificationProxyObj = null;
	List<WareHouseStockVerification> wareHouseStockVerification=null;
	
	
	String resultStr = null;
	try{
		// log.info("Get Product Stock Verification from webservice");
		wareHouseStockVerification = new ArrayList<WareHouseStockVerification>();
		Verification verificationObj = new Verification();
		verificationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
//		
		if(verificationcode != null & verificationcode != "" & !verificationcode.equals(""))
			verificationObj.setLocation("");
		else
			verificationObj.setLocation(outletLocationStr);
			verificationObj.setStartIndex("-1");
			verificationObj.setMaxRecords(maxRecords);
			verificationObj.setStartDate(startDateStr);
			verificationObj.setEndDate(endDateStr);
			verificationObj.setSearchCriteria(searchNameStr);
//			verificationObj.setMasterVerificationCode(mastercode);
			verificationObj.setVerification_code(verificationcode);
//		
		//// log.info("Request String::::"+gson.toJson(verificationObj));
		
		//stockVerificationProxyObj = new StoreStockVerificationProxy();

		//resultStr = stockVerificationProxyObj.getProductVerification(gson.toJson(verificationObj));
			resultStr = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("getProduct_Verification"), gson.toJson(verificationObj), "GET");

		//// log.info("Response String::::"+resultStr);
		//////////////////System.out.println("Response String::::"+resultStr);
		verificationObj = gson.fromJson(resultStr,Verification.class);
		if(verificationObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
        
			verificationObj.getStockVerificationObj();
		}
		
	}catch(ConnectException ce) {
		ce.printStackTrace();
		resultStr = (String) AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = (String) AppProperties.getAppMessageByProperty("INVALID_REQUEST");
	} catch (UnknownHostException uhe) {
		uhe.printStackTrace();
		resultStr = (String) AppProperties.getAppMessageByProperty("UNKNOWN_HOST");
	} catch(RemoteException rme){
		rme.printStackTrace();
		resultStr = (String) AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
	}catch(Exception e){
	    e.printStackTrace();
	    resultStr = (String) AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
	}
	return wareHouseStockVerification;
}
	



/**
 * @author vijay
 * @created on 31-08-2017 
 * This method is used to get stock verification masters report from webservices then send to GUI via controller.
 * @return List of Product Stock Verification Details report based on verificationCode.
 */			
public Verification getProductVerificationReportOpen(String customerIdStr,String emailIdStr,String outletLocationStr,
	String searchNameStr,String index,String startDateStr,String endDateStr,String maxRecords,String flowUnder,String verificationcode){
	//StoreStockVerificationProxy stockVerificationProxyObj = null;
//	WareHouseStockVerification wareHouseStockVerification;
	Verification verificationObj = new Verification();
	//List <WareHouseStockVerificationItems> warehouseVerificationDetailsList = null;
	List<WareHouseStockVerification> warehouseVerificationList=null;
	
	String resultStr = null;
	try{
		// log.info("Get Product Stock Verification from webservice");
		//warehouseVerificationDetailsList = new ArrayList<WareHouseStockVerificationItems>();
		warehouseVerificationList=new ArrayList<WareHouseStockVerification>();
	
		verificationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
//		
		if(verificationcode != null & verificationcode != "" & !verificationcode.equals(""))
			verificationObj.setLocation("");
		else
			verificationObj.setLocation(outletLocationStr);
			verificationObj.setStartIndex("-1");
			verificationObj.setMaxRecords(maxRecords);
			verificationObj.setStartDate(startDateStr);
			verificationObj.setEndDate(endDateStr);
			verificationObj.setSearchCriteria(searchNameStr);
//			verificationObj.setMasterVerificationCode(mastercode);
			verificationObj.setVerification_code(verificationcode);
//		
		/*// log.info("Request String::::"+gson.toJson(verificationObj));
		
		stockVerificationProxyObj = new StoreStockVerificationProxy();

		resultStr = stockVerificationProxyObj.getProductVerification(gson.toJson(verificationObj));
		
		// log.info("Response String::::"+resultStr);*/
			resultStr = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("getProduct_Verification "), gson.toJson(verificationObj), "GET");

			
		//////////////////System.out.println("Open Response String::::"+resultStr);
		verificationObj = gson.fromJson(resultStr,Verification.class);
		if(verificationObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
//		
			verificationObj.setWarehouseStockVerification(verificationObj.getStockVerificationObj());
		//	warehouseVerificationDetailsList = wareHouseStockVerification.getItemsList();
		
			
			/*if(warehouseVerificationDetailsList != null && warehouseVerificationDetailsList.size() > 0){
				warehouseVerificationDetailsList.get(0).setTotalRecords(verificationObj.getTotalRecords());
				
			}*/
		}
		
	}catch(ConnectException ce) {
		ce.printStackTrace();
		resultStr = (String) AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = (String) AppProperties.getAppMessageByProperty("INVALID_REQUEST");
	} catch (UnknownHostException uhe) {
		uhe.printStackTrace();
		resultStr = (String) AppProperties.getAppMessageByProperty("UNKNOWN_HOST");
	} catch(RemoteException rme){
		rme.printStackTrace();
		resultStr = (String) AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
	}catch(Exception e){
	    e.printStackTrace();
	    resultStr = (String) AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
	}
	return verificationObj;
}


public SalesReportsBean getStockAging(String customerIdStr,String emailIdStr,String index,String maxRecords,String zone, String location, String category, String subcategory, String brand,String startdate,String enddate,String search,String locationListAll,String saveFlag){
	String resultStr = null;
	RequestBean verificationObj = new RequestBean();
	SalesReportsBean rsbresponse = new SalesReportsBean();
	RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
	try{
		// log.info("Get Product Stock Verification Item Details from webservice");
		verificationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		verificationObj.setStartIndex(index);
		verificationObj.setMaxRecords(maxRecords);
		verificationObj.setRequiredRecords(maxRecords);
		verificationObj.setZoneId(zone);
		if(location.equals("all") || location.equals("")){
		List<String> myList = new ArrayList<String>(Arrays.asList(locationListAll.split(",")));	
		verificationObj.setLocationsList(myList);
		}
		else
		verificationObj.setStore_location(location);
		verificationObj.setProductCategory(category);
		verificationObj.setSubCategory(subcategory);
		verificationObj.setBrand(brand);
		verificationObj.setStartDate(startdate);
		verificationObj.setEndDate(enddate);
		verificationObj.setSearchCriteria(search);
		
		if(saveFlag.equalsIgnoreCase("save")){
			verificationObj.setSaveReport(true);
			verificationObj.setSaveStockReport(true);
			
		}
		
		//////////////System.out.println("Request String::::get_stockaging_details"+gson.toJson(verificationObj));
		resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_stockaging_details"), gson.toJson(verificationObj), "GET");
		//////////////System.out.println("Response String::::get_stockaging_details"+resultStr);
		verificationObj = gson.fromJson(resultStr,RequestBean.class);
		if(verificationObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
			rsbresponse = gson.fromJson(resultStr,SalesReportsBean.class);
			
		}
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = (String) AppProperties.getAppMessageByProperty("INVALID_REQUEST");
	}  catch(Exception e){
	    e.printStackTrace();
	    resultStr = (String) AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
	}
	return rsbresponse;
	
}
	

public SalesReportsBean getStockExpiry(String customerIdStr,String emailIdStr,String index,String maxRecords,String zone, String location, String category, String subcategory, String brand,String startdate,String search,String locationListAll,String saveFlag){
	String resultStr = null;
	RequestBean verificationObj = new RequestBean();
	SalesReportsBean rsbresponse = new SalesReportsBean();
	RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
	try{
		// log.info("Get Product Stock Verification Item Details from webservice");
		verificationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		verificationObj.setStartIndex(index);
		verificationObj.setMaxRecords(maxRecords);
		verificationObj.setRequiredRecords(maxRecords);
		verificationObj.setZoneId(zone);
		if(location.equals("all") || location.equals("")){
		List<String> myList = new ArrayList<String>(Arrays.asList(locationListAll.split(",")));	
		verificationObj.setLocationsList(myList);
		}
		else
		verificationObj.setStore_location(location);
		verificationObj.setProductCategory(category);
		verificationObj.setSubCategory(subcategory);
		verificationObj.setBrand(brand);
		verificationObj.setStartDate(startdate);
		verificationObj.setExpiryDate(startdate);
		//verificationObj.setEndDate(enddate);
		verificationObj.setSearchCriteria(search);
		
		if(saveFlag.equalsIgnoreCase("save")){
			verificationObj.setSaveReport(true);
			verificationObj.setSaveStockReport(true);
			
		}
		
		//////////////System.out.println("Request String::::get_stock_expiry_details"+gson.toJson(verificationObj));
		resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_stock_expiry_details"), gson.toJson(verificationObj), "GET");
		//////////////System.out.println("Response String::::get_stock_expiry_details"+resultStr);
		verificationObj = gson.fromJson(resultStr,RequestBean.class);
		if(verificationObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
			rsbresponse = gson.fromJson(resultStr,SalesReportsBean.class);
			
		}
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = (String) AppProperties.getAppMessageByProperty("INVALID_REQUEST");
	}  catch(Exception e){
	    e.printStackTrace();
	    resultStr = (String) AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
	}
	return rsbresponse;
	
}
	


public WareHouseStockVerification getProductDetailsWarehouse(String customerIdStr,String emailIdStr,String verificationCodeStr,String index,String maxRecords){
	//StoreStockVerificationProxy stockVerificationProxyObj = null;
	String resultStr = null;
	WareHouseStockVerification verificationObj = new WareHouseStockVerification();
	try{
//		////////////////System.out.println("dfgvf");
		//// log.info("Get Product Stock Verification Item Details from webservice");
		RestfulServiceConnection restfullconnection  = new RestfulServiceConnection();
		verificationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		verificationObj.setVerification_code(verificationCodeStr);
		verificationObj.setStartIndex(index);
		verificationObj.setMaxRecords(maxRecords);
		//// log.info("open Request String::::"+gson.toJson(verificationObj));
//		////////////////System.out.println(gson.toJson(verificationObj));
	/*	stockVerificationProxyObj = new StoreStockVerificationProxy();
		resultStr = stockVerificationProxyObj.getProductVerification(gson.toJson(verificationObj));
		// log.info("Response String::::"+resultStr);
		//////////////System.out.println("Response String::::"+resultStr);*/
		//////////System.out.println("request String::::getProduct_Verification"+gson.toJson(verificationObj));
		resultStr = restfullconnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_warehouse_stockverf"), gson.toJson(verificationObj), "GET");
		////////////System.out.println("Response String::::getProduct_Verification"+resultStr);
		
		String responseCode = Response.getResponseCode(resultStr);
		
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			verificationObj = gson.fromJson(resultStr,WareHouseStockVerification.class);
			verificationObj.setTotalRecords(verificationObj.getTotalRecords());
		}
	}catch(ConnectException ce) {
		ce.printStackTrace();
		resultStr = (String) Utilities.getResponseCode("SERVER_NOT_RESPONDING");
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = (String) Utilities.getResponseCode("INVALID_REQUEST");
	} catch (UnknownHostException uhe) {
		uhe.printStackTrace();
		resultStr = (String) Utilities.getResponseCode("UNKNOWN_HOST");
	} catch(RemoteException rme){
		rme.printStackTrace();
		resultStr = (String) Utilities.getResponseCode("SERVER_NOT_RESPONDING");
	}catch(Exception e){
	    e.printStackTrace();
	    resultStr = (String) Utilities.getResponseCode("FAILED_TO_RECEIVE_RESPONSE");
	}
	return verificationObj;
	
}






public String getProductVerificationLoad(String customerIdStr,String emailIdStr,String location){
String resultStr = null;
RestfulServiceConnection restfulConnectionObj = null;
try{
restfulConnectionObj = new RestfulServiceConnection();
Verification verificationObj = new Verification();
verificationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
verificationObj.setLocation(location);

////////System.out.println("Request String::::"+gson.toJson(verificationObj));


resultStr = restfulConnectionObj.getResponseFromPost( AppProperties.getRESTFulCloudServiceURL("loadStockVerifications"),gson.toJson(verificationObj));

////////System.out.println("Response String::::"+resultStr);
verificationObj = gson.fromJson(resultStr,Verification.class);

	resultStr = verificationObj.getResponseHeader().getResponseMessage();


}catch(ConnectException ce) {
ce.printStackTrace();
resultStr = (String) AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
} catch (NoSuchElementException nse) {
nse.printStackTrace();
resultStr = (String) AppProperties.getAppMessageByProperty("INVALID_REQUEST");
} catch (UnknownHostException uhe) {
uhe.printStackTrace();
resultStr = (String) AppProperties.getAppMessageByProperty("UNKNOWN_HOST");
} catch(RemoteException rme){
rme.printStackTrace();
resultStr = (String) AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
}catch(Exception e){
e.printStackTrace();
resultStr = (String) AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
}
return resultStr;
}


public String getProductVerificationLoadWarehouse(String customerIdStr,String emailIdStr,String location){
String resultStr = null;
RestfulServiceConnection restfulConnectionObj = null;
try{
restfulConnectionObj = new RestfulServiceConnection();
Verification verificationObj = new Verification();
verificationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
verificationObj.setLocation(location);

//System.out.println("Request String::::"+gson.toJson(verificationObj));


resultStr = restfulConnectionObj.getResponseFromPost( AppProperties.getRESTFulCloudServiceURL("loadStockVerificationsWarehouse"),gson.toJson(verificationObj));

//System.out.println("Response String::::"+resultStr);
verificationObj = gson.fromJson(resultStr,Verification.class);

	resultStr = verificationObj.getResponseHeader().getResponseMessage();


}catch(ConnectException ce) {
ce.printStackTrace();
resultStr = (String) AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
} catch (NoSuchElementException nse) {
nse.printStackTrace();
resultStr = (String) AppProperties.getAppMessageByProperty("INVALID_REQUEST");
} catch (UnknownHostException uhe) {
uhe.printStackTrace();
resultStr = (String) AppProperties.getAppMessageByProperty("UNKNOWN_HOST");
} catch(RemoteException rme){
rme.printStackTrace();
resultStr = (String) AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
}catch(Exception e){
e.printStackTrace();
resultStr = (String) AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
}
return resultStr;
}



public String getverifiedItems(String verno, String location, String customerIdStr, String emailIdStr) {
	String result = null;
Response response= null;
	ProcurementReceipt purchaseOrderObj = new ProcurementReceipt();
	RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
	try {
		purchaseOrderObj.setVerificationCode(verno);
		purchaseOrderObj.setStore_location(location);
		purchaseOrderObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		////////System.out.println("Request String:::::::::"+gson.toJson(purchaseOrderObj));
		result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_VerifiedItems"), gson.toJson(purchaseOrderObj), "GET");
		////////System.out.println(result);
		response = gson.fromJson(result,Response.class);
		
			}catch (NoSuchElementException nse) {
		nse.printStackTrace();
		result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	} catch(Exception e){
		e.printStackTrace();
	}
	return response.getURL();
}


public String getNonverifiedItems(String verno, String location, String customerIdStr, String emailIdStr) {
	String result = null;
	Response response= null;
	ProcurementReceipt purchaseOrderObj = new ProcurementReceipt();
	RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
	try {
		purchaseOrderObj.setVerificationCode(verno);
		purchaseOrderObj.setStore_location(location);
		purchaseOrderObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		// log.info("Request String:::::::::"+gson.toJson(purchaseOrderObj));
		////////System.out.println("Request String:non::::::::"+gson.toJson(purchaseOrderObj));

		result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_nonVerfieditems"), gson.toJson(purchaseOrderObj), "GET");
		////////System.out.println(result);
		response = gson.fromJson(result,Response.class);
		
			}catch (NoSuchElementException nse) {
		nse.printStackTrace();
		result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	} catch(Exception e){
		e.printStackTrace();
	}
	return response.getURL();
}


public List<StoreStockVerificationPosting> getOutletStockPosting(String customerIdStr,String emailIdStr,String location,String zone,
		String searchName,String index,String startDate,String endDate,String maxRecords,String department,String subdepartment,String category,String subcategory,String section,String flowUnder,String mastercode,String ref){
	
	RestfulServiceConnection restfullconnection  = new RestfulServiceConnection();
	GetStockVerificationDetailsResponse stockPostingDetails = null;
	String resultStr = null;
	try{
		stockPostingDetails = new GetStockVerificationDetailsResponse();
		StoreStockVerificationBean stockPostingObj = new StoreStockVerificationBean();
		stockPostingObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		
		stockPostingObj.setLocation(location);
		stockPostingObj.setFlowUnder(flowUnder);
		stockPostingObj.setZoneId(zone);
		stockPostingObj.setStartIndex(index);
		stockPostingObj.setMaxRecords(maxRecords);
		stockPostingObj.setStartDate(startDate);
		stockPostingObj.setEndDate(endDate);
		stockPostingObj.setSearchCriteria(searchName);
		stockPostingObj.setPostingLevel(true);
		stockPostingObj.setMasterVerificationCode(mastercode);
		stockPostingObj.setItemLevel(true);
		stockPostingObj.setVerification_code(ref);
			
		//////System.out.println("Request String GET StockPosting ::"+gson.toJson(stockPostingObj));
	 	resultStr = restfullconnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_storestockposting_details"), gson.toJson(stockPostingObj), "GET");
	 	//////System.out.println("Response :"+resultStr);
		
	 	stockPostingDetails = gson.fromJson(resultStr,GetStockVerificationDetailsResponse.class);
		if(stockPostingDetails.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
			resultStr = stockPostingDetails.getResponseHeader().getResponseMessage();
			stockPostingDetails.getStockPostingDetails().get(0).setTotalRecords(stockPostingDetails.getTotalRecords());
		}else{
			resultStr = stockPostingDetails.getResponseHeader().getResponseMessage();
		}
		
	}catch(ConnectException ce) {
		ce.printStackTrace();
		resultStr = (String) AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = (String) AppProperties.getAppMessageByProperty("INVALID_REQUEST");
	} catch (UnknownHostException uhe) {
		uhe.printStackTrace();
		resultStr = (String) AppProperties.getAppMessageByProperty("UNKNOWN_HOST");
	} catch(RemoteException rme){
		rme.printStackTrace();
		resultStr = (String) AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
	}catch(Exception e){
	    e.printStackTrace();
	    resultStr = (String) AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
	}
	return stockPostingDetails.getStockPostingDetails();
}





public String printStockPostingdetails(String verno, String customerIdStr, String emailIdStr) {
	String result = null;
	Response response= null;
	StoreStockVerificationBean stockPostingObj = new StoreStockVerificationBean();
	RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
	try {
		stockPostingObj.setVerification_code(verno);
		stockPostingObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		
		//////System.out.println("Request String:::PrintPosting::::::"+gson.toJson(stockPostingObj));
		result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_stockpostingdetails_print"), gson.toJson(stockPostingObj), "GET");
		//////System.out.println(result);
		response = gson.fromJson(result,Response.class);
		
			}catch (NoSuchElementException nse) {
		nse.printStackTrace();
		result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	} catch(Exception e){
		e.printStackTrace();
	}
	return response.getURL();
}








}
