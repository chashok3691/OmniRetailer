/*******************************************************************************
 * Copyright  2015 Omni Retailer Customer Console, All rights reserved.
 * Author : Sahitya
 * Created On : 21-8-2015
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

import java.io.IOException;
import java.net.SocketTimeoutException;
import java.rmi.ConnectException;
import java.rmi.RemoteException;
import java.rmi.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.NoSuchElementException;

import com.tlabs.posweb.init.AppProperties;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.technolabssoftware.www.CountersProxy;
import com.technolabssoftware.www.SalesProxy;
//import com.tlabs.posweb.beans.BackupAndRecovery;
//import com.tlabs.posweb.beans.BackupAndRecoveryResponse;
import com.tlabs.posweb.beans.BillSummary;
import com.tlabs.posweb.beans.Billing;
import com.tlabs.posweb.beans.BillingTransactions;
import com.tlabs.posweb.beans.BillsList;
import com.tlabs.posweb.beans.Cart;
import com.tlabs.posweb.beans.CartResponse;
import com.tlabs.posweb.beans.CashierShortageReportBean;
import com.tlabs.posweb.beans.Counter;
import com.tlabs.posweb.beans.EventInventoryTransferReport;
import com.tlabs.posweb.beans.GetProductsResponse;
import com.tlabs.posweb.beans.Offer;
import com.tlabs.posweb.beans.OutletReportBean;
import com.tlabs.posweb.beans.PriceChangeReportBean;
import com.tlabs.posweb.beans.ProcurementReceipt;
import com.tlabs.posweb.beans.ProductsList;
import com.tlabs.posweb.beans.PromotionSalesReport;
import com.tlabs.posweb.beans.PurchaseReportsBean;
import com.tlabs.posweb.beans.ReportSummary;
import com.tlabs.posweb.beans.Reports;
import com.tlabs.posweb.beans.ReportsBean;
import com.tlabs.posweb.beans.ReportsRequestBean;
import com.tlabs.posweb.beans.ReportsResponse;
import com.tlabs.posweb.beans.SalesReport;
import com.tlabs.posweb.beans.SalesReportsBean;
import com.tlabs.posweb.beans.SearchProductResponse;
import com.tlabs.posweb.beans.SearchProducts;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.beans.ShiftMaster;
import com.tlabs.posweb.beans.ShiftResponse;
import com.tlabs.posweb.beans.StockLedger;
import com.tlabs.posweb.beans.Transactions;
import com.tlabs.posweb.beans.Verification;
import com.tlabs.posweb.beans.VerificationDetails;
import com.tlabs.posweb.beans.WHStockIssueReportBean;
import com.tlabs.posweb.beans.WareHouseStockVerification;
import com.tlabs.posweb.beans.WareHouseStockVerificationItems;
import com.tlabs.posweb.beans.WarehouseReport;
import com.tlabs.posweb.beans.XZReading;
import com.tlabs.posweb.beans.XZReportBean;
import com.tlabs.posweb.beans.XZReportsResponse;
import com.tlabs.posweb.util.Constants;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
import com.tlabs.posweb.util.RestfulServiceConnection;
//import com.tlabs.posweb.util.Utilities;

public class ReportsService {

	@Autowired
	private ShiftService shiftServiceObj;
	@Autowired
	private Gson gson;
	@Autowired
	SessionScope sessionScope;
	private static Logger log = Logger.getLogger(ReportsService.class);
	
	/**
	 * @author Sahitya
	 * 
	 * This method is used to get 'X' Report based on location
	 * 
	 */
	public ReportsResponse getOutletXReport(boolean saveReportFlag,String customerIdStr,String emailIdStr,String storeLocationStr,String counterIdStr,boolean saveFlag,String shiftIdStr,String dateStr){
		String resultStr = null;
		ReportsRequestBean requestbeanObj = null;
		//SalesProxy salesProxyObj = null;
		ReportsResponse xReportReponseObj = null;
		try{
			// log.info("getOutletXReport");
			requestbeanObj = new ReportsRequestBean();
			//salesProxyObj = new SalesProxy();
			requestbeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestbeanObj.setCounterId(counterIdStr);
			requestbeanObj.setShiftId(shiftIdStr);
			requestbeanObj.setStore_location(storeLocationStr);
			requestbeanObj.setStartIndex(Constants.PAGINATION_START_INDEX);
			requestbeanObj.setReportType("X");
			requestbeanObj.setSaveReportFlag(saveFlag);
			// log.info(new Date());
			requestbeanObj.setReportDate(dateStr);
			
           /* // log.info("Request String::::::::::::"+gson.toJson(requestbeanObj));
	    //	//////////////System.out.println("Request String::::::::::::"+gson.toJson(requestbeanObj));
			resultStr = salesProxyObj.getXZreports(gson.toJson(requestbeanObj));
			// log.info("Response String:::::::::::"+resultStr);*/
			
			resultStr = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("get_xzreport"), gson.toJson(requestbeanObj),"GET");
			////////////System.out.println("response  String::get_xzreport::::::::::"+resultStr);
			
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				xReportReponseObj = gson.fromJson(resultStr,ReportsResponse.class); 
			}/*else{
				xReportReponseObj = new XZReportsResponse();
			}*/
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
		} catch(Exception e){
			e.printStackTrace();
		}
		return xReportReponseObj;
		
	}
	
	/**
	 * @author Sahitya
	 * 
	 * This method is used to get counters based on location
	 * 
	 */
	
    public List<String> getCounters(String locationStr,String customerIdStr,String emailIdStr,String startIndex){
    	String resultStr = null;
    	Counter counterObj = null;
    	//CountersProxy counterProxyObj = null;
    	List<String> counterIdsList = null;
    	List<Counter> counterDetailsList = null;
    	try{
    		//counterProxyObj = new CountersProxy();
    		counterObj = new Counter();
    		counterDetailsList = new ArrayList<Counter>();
    		counterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
    		counterObj.setStoreLocation(locationStr);
    		counterObj.setStartIndex(Constants.PAGINATION_START_INDEX);
			
			/*// log.info("Request String::::::::::::"+gson.toJson(counterObj));
		  //  //////////////System.out.println("Request String::::::::::::"+gson.toJson(counterObj));
			resultStr = counterProxyObj.getCounters(gson.toJson(counterObj));
			// log.info("Response String:::::::::::"+resultStr);*/
			
    		resultStr = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("get_counters"),gson.toJson(counterObj), "GET");

    		
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				counterObj = gson.fromJson(resultStr,Counter.class); 
				counterDetailsList = counterObj.getCounters();
				if(counterDetailsList.size()>0){
					counterIdsList = new ArrayList<String>(counterDetailsList.size());
					for(Counter counter:counterDetailsList){
						counterIdsList.add(counter.getCounterName());
					}
				}else{
					counterIdsList = new ArrayList<String>();
				}
			}else{
				counterIdsList = new ArrayList<String>();
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
			} catch(Exception e){
    		e.printStackTrace();
    	}
	return counterIdsList;
		
	}
    
    
    
    /**
	 * @author vijay
	 * Created On: 20-SEPT-2017
	 * This method is used to call the Customer Conversion Report method of web service and return the response in the form of class obj.
	 * Reviewed by: siva
	 * Reviewed Date:
	 */
	public WarehouseReport getCustomerConversionReport(String index,String maxRecords,String zone,String location,String startdate,String enddate){
		String resultStr = null;
		WarehouseReport response = null;
		try {
			WarehouseReport report = new WarehouseReport();
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			report.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			report.setStartIndex(index);
			report.setRequiredRecords(maxRecords);
			report.setZone(zone);
			report.setStore_location(location);
			report.setStartDate(startdate);
			report.setEndDate(enddate);
	  		////////////////System.out.println("Request String:::::::"+gson.toJson(report));
			resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_customer_conversion_report"), gson.toJson(report),"GET");
           
			response = gson.fromJson(resultStr,WarehouseReport.class); 
            
			if(response.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE))
			{
				return response;
			}
				
		} 
		
		catch (NoSuchElementException nse) 
		{
		nse.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} 
		catch(Exception e){
			e.printStackTrace();
		}
		return response;
	}
    
    
    
    /**
	 * @author Sahitya
	 * 
	 * This method is used to get shift names based on location
	 * 
	 */
	public List<Integer> getShiftsIdsList(String startIndex,String customerIdStr,String emailIdStr,String storeLocation){
		ShiftResponse shiftResponseObj = null;
		List<Integer> shiftsIdsList = null;
		List<ShiftMaster> shiftsList = null;
		try{
			// log.info("Get List of Shift Names");
			shiftResponseObj = shiftServiceObj.getShifts("",startIndex, customerIdStr, emailIdStr, storeLocation,false,"");
			if(shiftResponseObj.getTotalRecords()!=null||shiftResponseObj.getShifts()!=null||shiftResponseObj.getTotalRecords()!="0"){
				shiftsList = shiftResponseObj.getShifts();
				if(shiftsList != null){
					shiftsIdsList = new ArrayList<Integer>(shiftsList.size());
					for(ShiftMaster shift:shiftsList){
						shiftsIdsList.add(shift.getShiftId());
					}
				}
			}else{
				shiftsIdsList = new ArrayList<Integer>();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return shiftsIdsList;
		
	}
	
	
	/**
	 * @author Sahitya
	 * 
	 * This method is used to get 'Z' Report based on location
	 * 
	 */
	public XZReportsResponse getOutletZReport(String customerIdStr,String emailIdStr,String storeLocationStr,String counterIdStr,String dateStr,String endDate,boolean saveFlag){
		String resultStr = null;
		ReportsRequestBean requestbeanObj = null;
		//SalesProxy salesProxyObj = null;
		XZReportsResponse xReportReponseObj = null;
		try{
			//// log.info("getOutletXReport");
			requestbeanObj = new ReportsRequestBean();
			//salesProxyObj = new SalesProxy();
			requestbeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestbeanObj.setCounterId(counterIdStr);
			requestbeanObj.setStore_location(storeLocationStr);
			requestbeanObj.setStartIndex(Constants.PAGINATION_START_INDEX);
			requestbeanObj.setSaveReportFlag(saveFlag);
			//// log.info(new Date());
			requestbeanObj.setReportDate(dateStr);
			if(endDate != null && !endDate.equals("")){
				endDate = endDate + " 00:00:00";
				requestbeanObj.setReportEndDate(endDate);
				requestbeanObj.setReportType("z-multipel");
				//requestbeanObj.setReportType("Z");
			}else
				requestbeanObj.setReportType("Z");
				
            /*// log.info("Request String::::::::::::"+gson.toJson(requestbeanObj));
			resultStr = salesProxyObj.getXZreports(gson.toJson(requestbeanObj));*/
			//////////System.out.println("Response String:::get_zreport::::::::"+gson.toJson(requestbeanObj));
			resultStr = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("get_xzreport"), gson.toJson(requestbeanObj),"GET");
			//////////System.out.println("get_zreport :::::::::::::: " +resultStr);
			
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				xReportReponseObj = gson.fromJson(resultStr,XZReportsResponse.class); 
			}/*else{
				xReportReponseObj = new XZReportsResponse();
			}*/
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
		} catch(Exception e){
			e.printStackTrace();
		}
		return xReportReponseObj;
		
	}
	/**
	 * @author Sahitya
	 * 
	 * This method is used to get 'XZ' Report based on location
	 * 
	 */
	public XZReportsResponse getOutletXZReport(String customerIdStr,String emailIdStr,String storeLocationStr,String dateStr){
		String resultStr = null;
		ReportsRequestBean requestbeanObj = null;
		//SalesProxy salesProxyObj = null;
		XZReportsResponse xzReportReponseObj = null;
		try{
			//// log.info("getOutletXReport");
			requestbeanObj = new ReportsRequestBean();
			//salesProxyObj = new SalesProxy();
			requestbeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestbeanObj.setStore_location(storeLocationStr);
			requestbeanObj.setStartIndex(Constants.PAGINATION_START_INDEX);
			requestbeanObj.setReportType("XZ");
			// log.info(new Date());
			requestbeanObj.setReportDate(dateStr);
			
            /*// log.info("Request String::::::::::::"+gson.toJson(requestbeanObj));
			resultStr = salesProxyObj.getXZreports(gson.toJson(requestbeanObj));
			// log.info("Response String:::::::::::"+resultStr);*/
			resultStr = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("get_xzreport"), gson.toJson(requestbeanObj),"GET");

			
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				xzReportReponseObj = gson.fromJson(resultStr,XZReportsResponse.class); 
			}/*else{
				xReportReponseObj = new XZReportsResponse();
			}*/
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
		} catch(Exception e){
			e.printStackTrace();
		}
		return xzReportReponseObj;
	}
	
	
	
	public WarehouseReport getSaleCreditNoteReportByBillId(String creditNoteRef,String index,String maxRecords,String location){
		String resultStr = null;
		
		////////////////System.out.println("StartDate: " + startdate+"Enddate:"+enddate);
		
		WarehouseReport response = null;
		try {
			 
			// log.info("getSaleVoidItemsReport");
			WarehouseReport report = new WarehouseReport();
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			report.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			report.setStartIndex(index);
			report.setMaxRecords(maxRecords);
			report.setSearchCriteria(creditNoteRef);
			// log.info("Request String::::::::::::"+gson.toJson(report));
//System.out.println("Request String::::::::::::"+gson.toJson(report));
			 String requestString=gson.toJson(report);
            resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_sales_credit_note_report"), gson.toJson(report),"GET");
//System.out.println("response String"+resultStr);
            response = gson.fromJson(resultStr,WarehouseReport.class);
			if(response.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				response = gson.fromJson(resultStr,WarehouseReport.class); 
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}  catch(Exception e){
			e.printStackTrace();
		}
		return response;
	}
	
	
	public WarehouseReport getSaleCreditNoteReport(String index,String maxRecords,String brand,String zone,String category,String subCategory,String Department, String SubDepartment, String section,String location,String startdate,String enddate,String searchCriteria,String saveflag){
		String resultStr = null;
		
		////////////////System.out.println("StartDate: " + startdate+"Enddate:"+enddate);
		
		WarehouseReport response = null;
		try {
			 
			// log.info("getSaleVoidItemsReport");
			WarehouseReport report = new WarehouseReport();
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			report.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			report.setStartIndex(index);
			report.setMaxRecords(maxRecords);
			if(location.equals("All")||(location.equals("all")))
			location="";
			report.setStore_location(location);
			//report.setLocation(location);
			report.setCategory(category);
			report.setCategoryName(category);
			report.setSubCategory(subCategory);
			report.setStartDate(startdate);
			report.setEndDate(enddate);
			report.setSearchCriteria(searchCriteria);
			report.setZone(zone);
			report.setRequiredRecords(maxRecords);
			report.setDepartment(Department);
			report.setSubDepartment(SubDepartment);
			
			if(saveflag.equals("true")){
			report.setSaveReport(true);
			}
			 // log.info("Request String:::::::dfdfd:::::"+gson.toJson(report));
			////////////System.out.println("Request String:::::::dfdfd:::::"+gson.toJson(report));

//			 //////////////System.out.println("Request String::::::::::::"+gson.toJson(report));
			 String requestString=gson.toJson(report);
            resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_sales_credit_note_report"), gson.toJson(report),"GET");
             ////////////System.out.println("response String"+resultStr);
            response = gson.fromJson(resultStr,WarehouseReport.class);
			if(response.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				response = gson.fromJson(resultStr,WarehouseReport.class); 
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}  catch(Exception e){
			e.printStackTrace();
		}
		return response;
	}
	
	
	
	public WarehouseReport getSaleCreditNoteReportCancel(String index,String maxRecords,String brand,String zone,String counterId,boolean saveFlag,String Department, String SubDepartment, String mcnStatus,String location,String startdate,String enddate,String searchCriteria){
		String resultStr = null;
		
		////////////////System.out.println("StartDate: " + startdate+"Enddate:"+enddate);
		
		WarehouseReport response = null;
		try {
			 
			// log.info("getSaleVoidItemsReport");
			WarehouseReport report = new WarehouseReport();
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			report.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			report.setStartIndex(index);
			report.setMaxRecords(maxRecords);
			if(location.equals("All")||(location.equals("all")))
			location="";
			report.setStore_location(location);
			//report.setLocation(location);
			report.setStartDate(startdate);
			report.setEndDate(enddate);
			report.setSearchCriteria(searchCriteria);
			report.setZone(zone);
			report.setCounterId(counterId);
			report.setRequiredRecords(maxRecords);
			report.setStatusFlag(mcnStatus);
			report.setSaveReport(saveFlag);
			 // log.info("Request String::::::::::::"+gson.toJson(report));
//			 //////////////System.out.println("Request String::::::::::::"+gson.toJson(report));
			 String requestString=gson.toJson(report);
            resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_sales_credit_note_report"), gson.toJson(report),"GET");
//            //////////////System.out.println("response String"+resultStr);
            response = gson.fromJson(resultStr,WarehouseReport.class);
			if(response.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				response = gson.fromJson(resultStr,WarehouseReport.class); 
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}  catch(Exception e){
			e.printStackTrace();
		}
		return response;
	}
	
	
	public WarehouseReport getItemTaxesReport(String index,String maxRecords,String brand,String zone,String category,String subCategory,String Department, String SubDepartment, String section,String location,String startdate,String enddate,String searchCriteria,boolean saveFlag,boolean isHourWiseReport){
		String resultStr = null;
		WarehouseReport response = null;
		try {
			// log.info("getItemTaxesReport");
			WarehouseReport report = new WarehouseReport();
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			report.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			report.setStartIndex(index);
			report.setMaxRecords(maxRecords);
			if(location.equals("All")||(location.equals("all")))
			location="";
			report.setStore_location(location);
			//report.setLocation(location);
			report.setCategory(category);
			report.setCategoryName(category);
			report.setSubCategory(subCategory);
			report.setStartDate(startdate);
			report.setEndDate(enddate);
			report.setSearchCriteria(searchCriteria);
			report.setZone(zone);
			report.setRequiredRecords(maxRecords);
			report.setDepartment(Department);
			report.setSubDepartment(SubDepartment);
			report.setSaveReport(saveFlag);
			//if(isHourWiseReport.equals("true"))
			report.setHourWiseReport(isHourWiseReport);
			//else
			//	report.setHourWiseReport(false);
			// log.info("Request String::::::::::::"+gson.toJson(report));
			//System.out.println("REQ getItemTaxesReport::"+gson.toJson(report));
            resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_item_wise_tax_report"), gson.toJson(report),"GET");
            response = gson.fromJson(resultStr,WarehouseReport.class);
            //System.out.println("Resposce String::::::::::::"+resultStr);
			if(response.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				response = gson.fromJson(resultStr,WarehouseReport.class); 
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}  catch(Exception e){
			e.printStackTrace();
		}
		return response;
	}
	
	
	/*public WarehouseReport getItemTaxesReport(String index,String maxRecords,String brand,String zone,String category,String subCategory,String Department, String SubDepartment, String section,String location,String startdate,String enddate,String searchCriteria,boolean saveFlag){
		String resultStr = null;
		WarehouseReport response = null;
		try {
			// log.info("getItemTaxesReport");
			WarehouseReport report = new WarehouseReport();
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			report.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			report.setStartIndex(index);
			report.setMaxRecords(maxRecords);
			if(location.equals("All")||(location.equals("all")))
			location="";
			report.setStore_location(location);
			//report.setLocation(location);
			report.setCategory(category);
			report.setCategoryName(category);
			report.setSubCategory(subCategory);
			report.setStartDate(startdate);
			report.setEndDate(enddate);
			report.setSearchCriteria(searchCriteria);
			report.setZone(zone);
			report.setRequiredRecords(maxRecords);
			report.setDepartment(Department);
			report.setSubDepartment(SubDepartment);
			report.setSaveReport(saveFlag);
			// log.info("Request String::::::::::::"+gson.toJson(report));
			//////System.out.println("REQ ::"+gson.toJson(report));
            resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_item_wise_tax_report"), gson.toJson(report),"GET");
            response = gson.fromJson(resultStr,WarehouseReport.class);
            ////////////System.out.println("responce String::::::::::::"+resultStr);
			if(response.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				response = gson.fromJson(resultStr,WarehouseReport.class); 
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}  catch(Exception e){
			e.printStackTrace();
		}
		return response;
	}*/
	
	
	//manasa
	public WarehouseReport getItemTaxesGSTReport(String index,String maxRecords,String brand,String zone,String category,String subCategory,String Department, String SubDepartment, String section,String location,String startdate,String enddate,String searchCriteria,boolean saveFlag,String locationListAll){
		String resultStr = null;
		WarehouseReport response = null;
		try {
			// log.info("getItemTaxesReport");
			WarehouseReport report = new WarehouseReport();
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			report.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			report.setStartIndex(index);
			report.setMaxRecords(maxRecords);
		
			if(location.equals("all") || location.equals("")){
				
				List<String> myList = new ArrayList<String>(Arrays.asList(locationListAll.split(",")));
				report.setLocationsList(myList);
				}
				else
			report.setStore_location(location);
			//report.setLocation(location);
			report.setCategory(category);
			report.setCategoryName(category);
			report.setSubCategory(subCategory);
			report.setStartDate(startdate);
			report.setEndDate(enddate);
			report.setSearchCriteria(searchCriteria);
			report.setZone(zone);
			report.setRequiredRecords(maxRecords);
			report.setDepartment(Department);
			report.setSubDepartment(SubDepartment);
			report.setSaveReport(true);
			////////////System.out.println("Request get_Item_TaxReport String::::::::::::"+gson.toJson(report));
            resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Item_TaxReport"), gson.toJson(report),"GET");
            ////////////System.out.println("Response get_Item_TaxReport String:::::::::::"+resultStr);
            response = gson.fromJson(resultStr,WarehouseReport.class);
			if(response.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				response = gson.fromJson(resultStr,WarehouseReport.class); 
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}  catch(Exception e){
			e.printStackTrace();
		}
		return response;
	}
	
	

	//Added Surya.k on 21/06/2019
	public WarehouseReport gstTaxReturn(String index,String maxRecords,String brand,String zone,String category,String subCategory,String Department, String SubDepartment, String section,String location,String startdate,String enddate,String searchCriteria,boolean saveFlag,String locationListAll){
		String resultStr = null;
		WarehouseReport response = null;
		try {
			WarehouseReport report = new WarehouseReport();
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			report.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			report.setStartIndex(index);
			report.setMaxRecords(maxRecords);
		
			/*if(location.equals("all") || location.equals("")){
				
				List<String> myList = new ArrayList<String>(Arrays.asList(locationListAll.split(",")));
				report.setLocationsList(myList);
				}
				else*/
			report.setStore_location(location);
			//report.setLocation(location);
			report.setCategory(category);
			report.setCategoryName(category);
			report.setSubCategory(subCategory);
			report.setStartDate(startdate);
			report.setEndDate(enddate);
			report.setSearchCriteria(searchCriteria);
			report.setZone(zone);
			report.setRequiredRecords(maxRecords);
			report.setDepartment(Department);
			report.setSubDepartment(SubDepartment);
			report.setSaveReport(true);
			////////////System.out.println("Request get_TaxReturnReport String::::::::::::"+gson.toJson(report));
            resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_TaxReturnReport"), gson.toJson(report),"GET");
            ////////////System.out.println("Response  get_TaxReturnReport String:::::::::::"+resultStr);
            response = gson.fromJson(resultStr,WarehouseReport.class);
			if(response.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				response = gson.fromJson(resultStr,WarehouseReport.class); 
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}  catch(Exception e){
			e.printStackTrace();
		}
		return response;
	}
	

	//Added Surya.k on 21/06/2019
	public WarehouseReport getInputTaxationReport(String index,String maxRecords,String brand,String zone,String category,String subCategory,String Department, String SubDepartment, String section,String location,String startdate,String enddate,String searchCriteria,boolean saveFlag,String locationListAll){
		String resultStr = null;
		WarehouseReport response = null;
		try {
			WarehouseReport report = new WarehouseReport();
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			report.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			report.setStartIndex(index);
			report.setMaxRecords(maxRecords);
		
			/*if(location.equals("all") || location.equals("")){
				
				List<String> myList = new ArrayList<String>(Arrays.asList(locationListAll.split(",")));
				report.setLocationsList(myList);
				}
				else*/
			report.setStore_location(location);
			//report.setLocation(location);
			report.setCategory(category);
			report.setCategoryName(category);
			report.setSubCategory(subCategory);
			report.setStartDate(startdate);
			report.setEndDate(enddate);
			report.setSearchCriteria(searchCriteria);
			report.setZone(zone);
			report.setRequiredRecords(maxRecords);
			report.setDepartment(Department);
			report.setSubDepartment(SubDepartment);
			//report.setSaveReport(saveFlag);
			report.setSaveReport(true);
			////////////System.out.println("Request get_InputTaxationReport String::::::::::::"+gson.toJson(report));
            resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_InputTaxationReport"), gson.toJson(report),"GET");
            ////////////System.out.println("Response  get_InputTaxationReport String:::::::::::"+resultStr);
            response = gson.fromJson(resultStr,WarehouseReport.class);
			if(response.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				response = gson.fromJson(resultStr,WarehouseReport.class); 
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}  catch(Exception e){
			e.printStackTrace();
		}
		return response;
	}
	
	

	//Added by VIjay
	public WarehouseReport getTenderWiseReports(String maxRecords, String Index, String location,String zone,String startDate,String endDate) {
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			ReportsRequestBean requestObj = new ReportsRequestBean();
			WarehouseReport tenderWise = null;
			String resultStr = null;
			try{
				// log.info("Tender Wise report - getTenderWiseReport");
				//tenderWise = new ArrayList<SalesReport>();
				requestObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				requestObj.setStartIndex(Index);
				requestObj.setRequiredRecords(maxRecords);
				requestObj.setStore_location(location);
				requestObj.setZoneId(zone);
				requestObj.setStartDate(startDate); 
				requestObj.setEndDate(endDate);
				// log.info("Request String::::"+gson.toJson(requestObj));
//				//////////////System.out.println(gson.toJson(requestObj)+new Date().toString());
	            resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_tenderWise_report"), gson.toJson(requestObj),"GET");
	            tenderWise = gson.fromJson(resultStr,WarehouseReport.class); 
				if(tenderWise.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE))
				{
					return tenderWise;
				}
			
	         
			}
			
			catch (NoSuchElementException nse) {
				nse.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			}
			catch (Exception nse) {
				nse.printStackTrace();
//				resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			}
		
			return tenderWise;
		}
	/**
	 * @author Sahitya
	 * 
	 * This method is used to get 'X' Report based on location
	 * 
	 */
	public List<SalesReport> generateSalesReportCriteriaWise(String customerIdStr,String emailIdStr,String locationStr,
			String startDateStr,String endDateStr,String maxRecordsStr,String criteriaStr,String indexStr,String order,
			String orderBy,boolean saveFlag,String counterId,String categoryStr,String zone,String subactegory,String department,String brand,String section,String searchNameStr,String cashierId,String locationListAll,String salesChannel,String isHourWiseReport
){
		String resultStr = null;
		SalesReport taxreport =new SalesReport();
		List<SalesReport> taxlabels = new ArrayList<SalesReport>();
		ReportsRequestBean requestbeanObj = null;
		//SalesProxy salesProxyObj = null;
		SalesReport salesReportObj = new SalesReport();
		try{
			// log.info("generateSalesReportCriteriaWise");
			requestbeanObj = new ReportsRequestBean();
			//salesProxyObj = new SalesProxy();
			requestbeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestbeanObj.setStartIndex(indexStr);
			/*if(locationStr=="")
				requestbeanObj.setStore_location("all");
			else*/
		if(criteriaStr.equals("date") || criteriaStr.equals("counter") || criteriaStr.equals("skuSales") || criteriaStr.equals("Department"))	{
			if(locationStr.equals("all") || locationStr.equals("")){
				List<String> myList = new ArrayList<String>(Arrays.asList(locationListAll.split(",")));
				requestbeanObj.setLocationsList(myList);
				}
			else
			requestbeanObj.setStore_location(locationStr);
		}
		else {
			if(criteriaStr.equals("hour"))
			{
				requestbeanObj.setLocation(locationStr);
				requestbeanObj.setMaxRecords(maxRecordsStr);
			}
			locationStr="";
		}
			requestbeanObj.setStore_location(locationStr);
			
			requestbeanObj.setCashierId(cashierId);
			if(criteriaStr.equals("hour"))
			{
				requestbeanObj.setLocation(locationStr);
				requestbeanObj.setMaxRecords(maxRecordsStr);
			}
			requestbeanObj.setBrand(brand);
			requestbeanObj.setStartDate(startDateStr);
			requestbeanObj.setEndDate(endDateStr);
			requestbeanObj.setSearchCriteria(criteriaStr);
			requestbeanObj.setRequiredRecords(maxRecordsStr);
			requestbeanObj.setOrder(order);
			requestbeanObj.setOrderBy(orderBy);
			requestbeanObj.setCounterId(counterId);
			requestbeanObj.setSearchName(categoryStr);
			requestbeanObj.setCategoryName(categoryStr);
			requestbeanObj.setSaveReport(saveFlag);
			requestbeanObj.setZoneId(zone);
			requestbeanObj.setDepartment(department);
			requestbeanObj.setSubCategory(subactegory);
			requestbeanObj.setSection(section);
			requestbeanObj.setSalesChannel(salesChannel);

			if(criteriaStr.equalsIgnoreCase("supplier"))
			requestbeanObj.setSupplierName(searchNameStr);
			
			if(criteriaStr.equalsIgnoreCase("counter"))
				requestbeanObj.setSearchCriteria("date");
			
			if(criteriaStr.equalsIgnoreCase("date"))
				requestbeanObj.setSearchCriteria("date");
			
			if(criteriaStr.equalsIgnoreCase("hour"))
				requestbeanObj.setSearchCriteria("hour");
			
			
			if(criteriaStr.equalsIgnoreCase("counter"))
			{
				requestbeanObj.setCounterWiseFlag(false);
			}
			else
			{
				requestbeanObj.setCounterWiseFlag(false);
			}
				
			
			if(criteriaStr.equalsIgnoreCase("hour"))
			{
				
				if(isHourWiseReport.equals("true")){
					
					requestbeanObj.setHourWiseReport(true);
				}
				
			}
			
			
			requestbeanObj.setSearchCriteriaStr(searchNameStr);
            // log.info("Request String::::::::::::"+gson.toJson(requestbeanObj));
			//System.out.println("Request String::::::::::::hour wise report.........."+gson.toJson(requestbeanObj));
	    	if(criteriaStr.equals("hour"))
	    	{
	    		resultStr = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("get_hour_wise_report"), gson.toJson(requestbeanObj),"GET");
	    		//resultStr = salesProxyObj.getHourWiseReport(gson.toJson(requestbeanObj));
	    	}	
	    	else
	    	{
	    		resultStr = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("get_sales_reports"), gson.toJson(requestbeanObj),"GET"); 
	    		//resultStr = salesProxyObj.getSalesReports(gson.toJson(requestbeanObj));
	    	}
	    		
			//// log.info("Response String:::::::::::"+resultStr);
	    	//System.out.println("Reports Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				salesReportObj = gson.fromJson(resultStr,SalesReport.class); 
				if(salesReportObj.getReportsList() != null && salesReportObj.getReportsList().size() > 0){
					salesReportObj.getReportsList().get(0).setTotalRecords(salesReportObj.getTotalRecords());
					salesReportObj.getReportsList().get(0).setReportSummery(salesReportObj.getReportSummery());
					salesReportObj.getReportsList().get(0).setCategorySummery(salesReportObj.getCategorySummery());
					salesReportObj.getReportsList().get(0).setSalesReportFilePath(salesReportObj.getSalesReportFilePath());
				}
				if(salesReportObj.getItemReportList()!= null && salesReportObj.getItemReportList().size() > 0){
					//salesReportObj.getReportsList().get(0).setTotalRecords(salesReportObj.getTotalRecords());
						
					salesReportObj.setReportsList(salesReportObj.getItemReportList());
					if(salesReportObj.getTotalRecords()!= null)
					salesReportObj.getReportsList().get(0).setTotalRecords(salesReportObj.getTotalRecords().toString());
					if(salesReportObj.getSalesReportFilePath()!= null)	
						salesReportObj.getReportsList().get(0).setSalesReportFilePath(salesReportObj.getSalesReportFilePath());
					salesReportObj.getReportsList().get(0).setTotalSoldQty(salesReportObj.getTotalSoldQty());
					salesReportObj.getReportsList().get(0).setTotalSoldValue(salesReportObj.getTotalSoldValue());
				}
				if(salesReportObj.getHoursReportList()!= null && salesReportObj.getHoursReportList().size() > 0){
					//salesReportObj.getReportsList().get(0).setTotalRecords(salesReportObj.getTotalRecords());
					ReportSummary reportsummary = new ReportSummary();
					reportsummary.setFinalCard(salesReportObj.getTotCardAmt().floatValue());
					reportsummary.setFinalCash(salesReportObj.getTotCashAmt().floatValue());
					reportsummary.setFinalReturnedAmt(salesReportObj.getTotReturnAmt().floatValue());
					reportsummary.setFinalExchangedAmt(salesReportObj.getTotExchAmt().floatValue());
					reportsummary.setFinalSodexo(salesReportObj.getTotSedexoAmt().floatValue());
					reportsummary.setFinalCouponsAmt(salesReportObj.getTotGiftCoupAmt().floatValue());
					reportsummary.setFinalCreditAmt(salesReportObj.getTotCreditsAmt().floatValue());
					reportsummary.setFinalCreditNoteAmt(salesReportObj.getTotCreditNoteAmt().floatValue());
					reportsummary.setFinalTotal(salesReportObj.getTotOverallAmt().floatValue());
					reportsummary.setFinalLoyalty(salesReportObj.getTotLoyalAmt().floatValue());
					reportsummary.setFinalTicket(salesReportObj.getTotTickAmt().floatValue());
					reportsummary.setFinalVouchersAmt(salesReportObj.getTotGiftVocAmt().floatValue());
				    reportsummary.setTotalOthersAmt(salesReportObj.getTotalOtherAmt());
				    reportsummary.setTotAvgQty(salesReportObj.getTotAvgQty());
				    reportsummary.setTotAvgAmt(salesReportObj.getTotAvgAmt());
				    
				    reportsummary.setTotalOtherReturnAmt(salesReportObj.getTotalOtherReturnAmt());
				    reportsummary.setTotalSaleQty(salesReportObj.getTotalSaleQty());
				    reportsummary.setTotalReturnQty(salesReportObj.getTotalReturnQty());
				    reportsummary.setTotalreturnbills(salesReportObj.getTotalreturnbills());
				    reportsummary.setTotalsalesbills(salesReportObj.getTotalsalesbills());
				    
					salesReportObj.setReportsList(salesReportObj.getHoursReportList());
					salesReportObj.getReportsList().get(0).setReportSummery(reportsummary);
					if(salesReportObj.getTotalRecords()!= null)
					salesReportObj.getReportsList().get(0).setTotalRecords(salesReportObj.getTotalRecords().toString());
					if(salesReportObj.getSalesReportFilePath()!= null)	
						salesReportObj.getReportsList().get(0).setSalesReportFilePath(salesReportObj.getSalesReportFilePath());
				}
				if(criteriaStr.equals("tax")){
					
					if(salesReportObj.getTaxLablesList()!=null)
						 taxreport.setTaxLablesList(salesReportObj.getTaxLablesList());;
						 if(salesReportObj.getTaxWiseReport()!=null)
							 taxreport.setTaxWiseReport(salesReportObj.getTaxWiseReport()); 
						 taxlabels.add(taxreport);
					salesReportObj.setReportsList(taxlabels);
					salesReportObj.getReportsList().get(0).setTotalRecords(salesReportObj.getTotalRecords().toString());
					if(salesReportObj.getSalesReportFilePath()!= null)	
					salesReportObj.getReportsList().get(0).setSalesReportFilePath(salesReportObj.getSalesReportFilePath());
				/*	if(salesReportObj.getTaxesInfo() != null && salesReportObj.getTaxesInfo().size() > 0){
						List<SalesReport> reportsList = new ArrayList<SalesReport>();  
						for(TaxesInfo taxesInfo : salesReportObj.getTaxesInfo()){
							SalesReport salesReport = new SalesReport();
							salesReport.setTodayTotal(taxesInfo.getTodayTotal());
							salesReport.setGto(taxesInfo.getGto());
							salesReport.setDate(taxesInfo.getDate());
							for(ReportsInfo reportsInfo : taxesInfo.getReportsInfo()){
								if(reportsInfo.getTaxCode().equals("1")){
									salesReport.setSales5(reportsInfo.getTotalSale());
									salesReport.setSalesTax5(reportsInfo.getTaxAmount());
								}
								if(reportsInfo.getTaxCode().equals("2")){
									salesReport.setSales145(reportsInfo.getTotalSale());
									salesReport.setSalesTax145(reportsInfo.getTaxAmount());
								}
								if(reportsInfo.getTaxCode().equals("4")){
									salesReport.setExempted(reportsInfo.getTotalSale());
								}
							}
							reportsList.add(salesReport);
						}
						salesReportObj.setReportsList(reportsList);
						salesReportObj.getReportsList().get(0).setTotalRecords(salesReportObj.getTotalRecords());
					}
					if(salesReportObj.getSummery() != null && salesReportObj.getSummery().size() > 0){
						for(Summary summary : salesReportObj.getSummery()){
							if(summary.getTaxCode().equals("1")){
								salesReportObj.getReportsList().get(0).setGrossSales5(summary.getSaleAmmount());
								salesReportObj.getReportsList().get(0).setGrossSalesTax5(summary.getTaxAmmount());
							}
							if(summary.getTaxCode().equals("2")){
								salesReportObj.getReportsList().get(0).setGrossSales145(summary.getSaleAmmount());
								salesReportObj.getReportsList().get(0).setGrossSalesTax145(summary.getTaxAmmount());
							}
							if(summary	.getTaxCode().equals("4")){
								salesReportObj.getReportsList().get(0).setGrossExempted(summary.getSaleAmmount());
							}
						}
					}
					salesReportObj.getReportsList().get(0).setGrossGto(salesReportObj.getGto());
					salesReportObj.getReportsList().get(0).setGrossTodayTotal(salesReportObj.getFloatTotalPrice());*/
				}
			}else{
				if(criteriaStr.equalsIgnoreCase("skuSales") || criteriaStr.equalsIgnoreCase("date")){
				List<SalesReport> dummyReportList = new ArrayList<SalesReport>();
				salesReportObj = gson.fromJson(resultStr,SalesReport.class); 
				SalesReport salesReportObj2 = new SalesReport();
				salesReportObj2.setResponseHeader(salesReportObj.getResponseHeader());
				dummyReportList.add(salesReportObj2);
				salesReportObj.setReportsList(dummyReportList);
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
		} catch(Exception e){
			e.printStackTrace();
		}
		return salesReportObj.getReportsList();
	}
	/**
	 * @author chaithanya
	 * 
	 * This method is used to call the Supplies Report method of web service and return the response.
	 * It accepts a file consisting of data to be uploaded to sku master table.
	 * 
	 */
	public OutletReportBean getShipmentReceipt(String index,String maxRecords,String zone,String location,String category,String subcategory,String brand,String startdate,String enddate,String searchCriteria,Boolean saveFlag,String supplierName,String locationListAll){
		String resultStr = null;
		//SalesProxy salesProxyObj = null;
		OutletReportBean report = null;
		try {
			//salesProxyObj = new SalesProxy();
			report = new OutletReportBean();
			//RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			report.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			report.setStartIndex(index);
			report.setSearchCriteria(searchCriteria);
			
			if(location.equals("all") || location.equals("")){
				
				List<String> myList = new ArrayList<String>(Arrays.asList(locationListAll.split(",")));
				report.setLocationsList(myList);
				}
				else
			report.setLocation(location);
			report.setBrand(brand);
			report.setSubCategory(subcategory);
			report.setCategory(category);
			report.setMaxRecords(maxRecords);
			//report.setModel(model);
			report.setZoneID(zone);
			report.setStartDateStr(startdate);
			report.setEndDateStr(enddate);
			//report.isSaveReport(saveFlag);
			report.setSaveReport(saveFlag);
			report.setSupplierName(supplierName);
//			//////////////System.out.println("request String:::::::::::"+gson.toJson(report));
			//resultStr = salesProxyObj.getProcurementReport(gson.toJson(report));
			resultStr = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("get_procurement_report"), gson.toJson(report),"GET");		

			report = gson.fromJson(resultStr,OutletReportBean.class);
//			//////////////System.out.println("Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
//        	//////////////System.out.println("response String:::::::::::"+gson.toJson(report));
        	if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			//if(report.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){	
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}  catch(Exception e){
			e.printStackTrace();
		}
		return report;
	}

	
	
	
	public List<ProcurementReceipt> getOMShipmentReceipt(boolean saveFlag,String customerIdStr,String emailIdStr,String locationStr,String indexStr,String maxRecords,String searchNameStr,String startDateStr,String endDateStr,boolean search,String locationsListValue,String locationList,String supplier){
		String result = null;
		ProcurementReceipt procurementReceiptObj = new ProcurementReceipt();
		RestfulServiceConnection restfulServiceConnection = null;
		try {
			restfulServiceConnection = new RestfulServiceConnection();
//			procurementReceiptObj.setStart(indexStr);
			procurementReceiptObj.setSupplierName(supplier);
			procurementReceiptObj.setStartIndex(indexStr);
			procurementReceiptObj.setItemsRequired(true);
			procurementReceiptObj.setStartDate(startDateStr);
			procurementReceiptObj.setEndDate(endDateStr);
			
			if(locationStr.equals("all") || locationStr.equals("")){

				List<String> myList = new ArrayList<String>(Arrays.asList(locationsListValue.split(",")));
				procurementReceiptObj.setLocationsList(myList);
			}
				else
			procurementReceiptObj.setLocation(locationStr);
			procurementReceiptObj.setSaveGRNFlag(saveFlag);
//			procurementReceiptObj.setSaveReport(saveFlag);
			/*if(storeLocation.equals("all")||storeLocation.equals("")){
		 	List<String> myList = new ArrayList<String>(Arrays.asList(locationsListValue.split(",")));
			procurementReceiptObj.setLocationList(locationList);
		}
		else
			procurementReceiptObj.setLocation(storeLocation);*/
			
			procurementReceiptObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			procurementReceiptObj.setMaxRecords(maxRecords);
			procurementReceiptObj.setSearchCriteria(searchNameStr);
		
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_GoodsReceipt_Notes"), gson.toJson(procurementReceiptObj), "GET");
			
			// log.info("Request String:::::::::::"+gson.toJson(procurementReceiptObj));
			//////////////System.out.println("Request String:::::::::::"+gson.toJson(procurementReceiptObj));
			// log.info("Response String:::::::::::"+result);
			//////////////System.out.println("Response String:::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				procurementReceiptObj = gson.fromJson(result, ProcurementReceipt.class);
				
					procurementReceiptObj.setReceiptDetails(procurementReceiptObj.getGrnList());	
				
					if(procurementReceiptObj.getReceiptDetails() != null && procurementReceiptObj.getReceiptDetails().size() > 0)
						procurementReceiptObj.getReceiptDetails().get(0).setTotalRecords(procurementReceiptObj.getTotalRecords());
					procurementReceiptObj.getReceiptDetails().get(0).setFilePath(procurementReceiptObj.getFilePath());
				
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return procurementReceiptObj.getReceiptDetails();
	}
	
	public List<BillingTransactions> generateDueCollections(String customerIdStr,String emailIdStr,String locationStr,String customerStr,
			String startDateStr,String endDateStr,String maxRecordsStr,String criteriaStr,String indexStr,boolean saveFlag,String order,
			String orderBy){
		String resultStr = null;
		ReportsRequestBean requestbeanObj = null;
		//SalesProxy salesProxyObj = null;
		List<BillingTransactions> billingTransactions = new ArrayList<BillingTransactions>();
		try{
			SalesReport salesReportObj = new SalesReport();
			// log.info("generateDueCollections");
			requestbeanObj = new ReportsRequestBean();
			//salesProxyObj = new SalesProxy();
			requestbeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestbeanObj.setStartIndex(indexStr);
			requestbeanObj.setStore_location(locationStr);
			requestbeanObj.setStartDate(startDateStr);
			requestbeanObj.setEndDate(endDateStr);
			requestbeanObj.setSearchCriteria(criteriaStr);
			requestbeanObj.setRequiredRecords(maxRecordsStr);
			requestbeanObj.setOrder(order);
			requestbeanObj.setOrderBy(orderBy);
			requestbeanObj.setCustomer(customerStr);
			requestbeanObj.setSaveReport(saveFlag);
			
           /* // log.info("Request String::::::::::::"+gson.toJson(requestbeanObj));
			resultStr = salesProxyObj.getSalesReports(gson.toJson(requestbeanObj));
			// log.info("Response String:::::::::::"+resultStr);*/
			resultStr = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("get_sales_reports"), gson.toJson(requestbeanObj),"GET");

			
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				salesReportObj = gson.fromJson(resultStr,SalesReport.class); 
				billingTransactions = salesReportObj.getTransactions();
				if(billingTransactions != null && billingTransactions.size() > 0){
					billingTransactions.get(0).setTotalRecords(salesReportObj.getTotalRecords());
					billingTransactions.get(0).setSalesReportFilePath(salesReportObj.getSalesReportFilePath());
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
		} catch(Exception e){
			e.printStackTrace();
		}
		return billingTransactions;
		
	}
	
	public List<Billing> generateCreditSales(String customerIdStr,String emailIdStr,String locationStr,String customerStr,
			String startDateStr,String endDateStr,String maxRecordsStr,String criteriaStr,String indexStr,boolean saveFlag,String order,
			String orderBy){
		String resultStr = null;
		ReportsRequestBean requestbeanObj = null;
		//SalesProxy salesProxyObj = null;
		List<Billing> billsList = new ArrayList<Billing>();
		try{
			SalesReport salesReportObj = new SalesReport();
			//// log.info("generateCreditSales");
			requestbeanObj = new ReportsRequestBean();
			//salesProxyObj = new SalesProxy();
			requestbeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestbeanObj.setStartIndex(indexStr);
			requestbeanObj.setStore_location(locationStr);
			requestbeanObj.setStartDate(startDateStr);
			requestbeanObj.setEndDate(endDateStr);
			requestbeanObj.setSearchCriteria(criteriaStr);
			requestbeanObj.setRequiredRecords(maxRecordsStr);
			requestbeanObj.setOrder(order);
			requestbeanObj.setOrderBy(orderBy);
			requestbeanObj.setCustomer(customerStr);
			requestbeanObj.setSaveReport(saveFlag);
			
           /* // log.info("Request String::::::::::::"+gson.toJson(requestbeanObj));
			resultStr = salesProxyObj.getSalesReports(gson.toJson(requestbeanObj));
			// log.info("Response String:::::::::::"+resultStr);*/
			
			resultStr = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("get_sales_reports"), gson.toJson(requestbeanObj),"GET");

			
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				salesReportObj = gson.fromJson(resultStr,SalesReport.class); 
				billsList = salesReportObj.getBills();
				if(billsList != null && billsList.size() > 0){
					billsList.get(0).setTotalRecords(salesReportObj.getTotalRecords());
					billsList.get(0).setSalesReportFilePath(salesReportObj.getSalesReportFilePath());
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
		} catch(Exception e){
			e.printStackTrace();
		}
		return billsList;
	}
	
	
	/**
	 * @author Sahitya
	 * 
	 * This method is used to get 'X' Report based on location
	 * 
	 */
	public List<BillsList> getBillsForDate(String customerIdStr,String emailIdStr,String locationStr,
			String dateStr,String maxRecordsStr,String indexStr,String counterid,Boolean flag){
		String resultStr = null;
		ReportsRequestBean requestbeanObj = null;
		//SalesProxy salesProxyObj = null;
		SalesReport salesReportObj = null;
		List<BillsList> billsList = null;
		try{
			//// log.info("getBillsForDate");
			requestbeanObj = new ReportsRequestBean();
			//salesProxyObj = new SalesProxy();
			requestbeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestbeanObj.setStartIndex(indexStr);
			requestbeanObj.setStore_location(locationStr);
			requestbeanObj.setCounterId(counterid);
			requestbeanObj.setSearchCriteria("billSummery");
			dateStr = dateStr+" 00:00:00";
			requestbeanObj.setDate(dateStr);
			requestbeanObj.setRequiredRecords(maxRecordsStr);
			//requestbeanObj.setSaveReportFlag(flag);
			requestbeanObj.setSaveReport(flag);
			
			
			
           /* // log.info("Request String::::::::::::"+gson.toJson(requestbeanObj));
	    	////////////////System.out.println("Request String::::::::::::"+gson.toJson(requestbeanObj));
			resultStr = salesProxyObj.getSalesReports(gson.toJson(requestbeanObj));
			////////////////System.out.println("Response String:::::::::::"+resultStr);
			// log.info("Response String:::::::::::"+resultStr);*/
			////////////System.out.println("Request String::::::::::::"+gson.toJson(requestbeanObj));
			resultStr = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("get_sales_reports"), gson.toJson(requestbeanObj),"GET");
			////////////System.out.println("Response String:::::get_sales_reports bills::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				salesReportObj = gson.fromJson(resultStr,SalesReport.class); 
				if(salesReportObj.getBillsSummeryList() != null && salesReportObj.getBillsSummeryList().size() > 0){
//					salesReportObj.getReportsList().get(0).setTotalRecords(salesReportObj.getTotalRecords());
					billsList = new ArrayList<BillsList>();
					for(BillSummary billSummary : salesReportObj.getBillsSummeryList()){
						BillsList bills = new BillsList();
						bills.setBillId(billSummary.getBillId());
						bills.setAmount(billSummary.getAmount());
						bills.setCashierId(billSummary.getCashierId());
						bills.setSerialBillId(billSummary.getSerialBillId());
						float cashAmount = 0.0f;
	                    float cardAmount = 0.0f;
	                    float sodexoAmount = 0.0f;
	                    float returnAmount = 0.0f;
	                    float ticketAmount = 0.0f;
	                    float giftvouchers = 0.0f;
	                    float creditNote = 0.0f;
	                    float credits = 0.0f;
	                    float exchangeAmount = 0.0f;
						for(Transactions transactions : billSummary.getTransactions()){
							if(transactions.getPaymentMode().equalsIgnoreCase("Cash"))
								cashAmount += transactions.getAmount();
							else if(transactions.getPaymentMode().equalsIgnoreCase("Card"))
								cardAmount += transactions.getAmount();
							else if(transactions.getPaymentMode().equalsIgnoreCase("Sodexo"))
								sodexoAmount += transactions.getAmount();
							else if(transactions.getPaymentMode().equalsIgnoreCase("Ticket"))
								ticketAmount += transactions.getAmount();
							else if(transactions.getPaymentMode().equalsIgnoreCase("giftvoucher"))
								giftvouchers += transactions.getAmount();
							else if(transactions.getPaymentMode().equalsIgnoreCase("Credit Note"))
								creditNote += transactions.getAmount();
							else if(transactions.getPaymentMode().equalsIgnoreCase("Credits"))
								credits += transactions.getAmount();
						
						}
						if(billSummary.getReturnedAmt()!=null)
							returnAmount += billSummary.getReturnedAmt();
						if(billSummary.getExchangedAmt()!=null)
							exchangeAmount += billSummary.getExchangedAmt();
						bills.setBillDate(dateStr);
						bills.setCardAmount(cardAmount);
						bills.setCashAmount(cashAmount);
						bills.setReturnAmount(returnAmount);
						bills.setSodexoAmount(sodexoAmount);
						bills.setTicketAmount(ticketAmount);
						bills.setGiftvouchers(giftvouchers);
						bills.setCreditNote(creditNote);
						bills.setCredits(credits);
						bills.setExchangeAmount(exchangeAmount);
						
						if(flag){
							if(salesReportObj.getSalesReportFilePath()!=null )
								bills.setSalesReportFilePath(salesReportObj.getSalesReportFilePath());
						}
						billsList.add(bills);
					}
					
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
		} catch(Exception e){
			e.printStackTrace();
		}
		return billsList;
		
	}
	
	
	/**
	 * @author chaithanya
	 * 
	 * This method is used to call the Procurementvsconsumption method of web service and return the response.
	 * It accepts a file consisting of data to be uploaded to sku master table.
	 * 
	 */
	public WarehouseReport getprocurementconsumption(String index,String maxRecords,String zone,String location,String category,String subcategory,String brand,String startdate,String enddate,String searchCriteria,boolean flag){
		String resultStr = null;
		WarehouseReport response = null;
		try {
			WarehouseReport report = new WarehouseReport();
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			report.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			report.setStartIndex(index);
			report.setMaxRecords(maxRecords);
			report.setLocation(location);
			report.setCategory(category);
			report.setSubCategory(subcategory);
			report.setBrand(brand);
			report.setStartDateStr(startdate);
			report.setEndDateStr(enddate);
			report.setSaveReport(flag);
			report.setSearchCriteria(searchCriteria);
            resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("procurement_vs_consumption"), gson.toJson(report),"GET");
            response = gson.fromJson(resultStr,WarehouseReport.class); 
			if(response.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}  catch(Exception e){
			e.printStackTrace();
		}
		return response;
	}
	
	
	public List<SalesReport> getSalesReportHourWiseBill(String index,String maxRecords,String zone,String location,String startdate,String enddate,String startTime,String endTime,String searchCriteria,boolean saveFlag){
		String resultStr = null;
		ReportsRequestBean requestbeanObj = null;
		SalesReport salesReportObj = new SalesReport();
		try{
			// log.info("generateSalesReportCriteriaWise");
			////////////////System.out.println("generateSalesReportCriteriaWise");
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			requestbeanObj = new ReportsRequestBean();
			requestbeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestbeanObj.setStartIndex(index);
			requestbeanObj.setStore_location(location);
			if(startTime == "")
				startTime ="00:00:00";
			if(endTime == "")
				endTime ="22:00:00";
			requestbeanObj.setStartDate(startdate+" "+startTime);
			requestbeanObj.setEndDate(enddate+" "+endTime);
			//requestbeanObj.setSearchCriteria(searchCriteria);
			requestbeanObj.setRequiredRecords(maxRecords);
			requestbeanObj.setMaxRecords(maxRecords);
			requestbeanObj.setSaveReport(saveFlag);
			requestbeanObj.setZoneId(zone);
			requestbeanObj.setSearchCriteria(searchCriteria);
			requestbeanObj.setSearchCriteriaStr(searchCriteria);
            // log.info("Request String::::::::::::"+gson.toJson(requestbeanObj));
//            //////////////System.out.println("Request String::::::::::::"+gson.toJson(requestbeanObj));
            resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_HourWise_Sales"), gson.toJson(requestbeanObj),"GET");
//        	//////////////System.out.println("Response String:::::::::::"+resultStr);
            String responseCode = Response.getResponseCode(resultStr);
        	if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
        		  salesReportObj = gson.fromJson(resultStr,SalesReport.class); 
        		  if(salesReportObj.getItemReportList()!= null && salesReportObj.getItemReportList().size() > 0){
  					//salesReportObj.getReportsList().get(0).setTotalRecords(salesReportObj.getTotalRecords());
  					salesReportObj.setReportsList(salesReportObj.getItemReportList());
  					if(salesReportObj.getTotalRecords()!= null)
  					salesReportObj.getReportsList().get(0).setTotalRecords(salesReportObj.getTotalRecords().toString());
  					if(salesReportObj.getSalesReportFilePath()!= null)	
						salesReportObj.getReportsList().get(0).setSalesReportFilePath(salesReportObj.getSalesReportFilePath());
  				}
        	
        	}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}  catch(Exception e){
			e.printStackTrace();
		}
		return salesReportObj.getItemReportList();
	}
	
	
	
	public List<SalesReport> getSalesPriceVariationReport(String index,String maxRecords,String zone,String location,String category,String subcategory,String brand,String startdate,String enddate,String searchCriteria,String supplierId,String department,boolean saveFlag){
		String resultStr = null;
		ReportsRequestBean requestbeanObj = null;
		SalesReport salesReportObj = new SalesReport();
		try{
			// log.info("generateSalesReportCriteriaWise");
			////////////////System.out.println("generateSalesReportCriteriaWise");
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			requestbeanObj = new ReportsRequestBean();
			requestbeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestbeanObj.setStartIndex(index);
			requestbeanObj.setStore_location(location);
			requestbeanObj.setBrand(brand);
			requestbeanObj.setStartDate(startdate);
			requestbeanObj.setEndDate(enddate);
			//requestbeanObj.setSearchCriteria(searchCriteria);
			requestbeanObj.setRequiredRecords(maxRecords);
			requestbeanObj.setCategoryName(category);
			requestbeanObj.setRequiredRecords(maxRecords);
			requestbeanObj.setSaveReport(saveFlag);
			requestbeanObj.setZoneId(zone);
			requestbeanObj.setSubCategory(subcategory);
			requestbeanObj.setSupplierName("");
			requestbeanObj.setDepartment(department);
			requestbeanObj.setSearchCriteriaStr(searchCriteria);
			
			
            // log.info("Request String::::::::::::"+gson.toJson(requestbeanObj));
			//System.out.println("Request String::::::aaa::::::"+gson.toJson(requestbeanObj));
            resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_sales_price_variation"), gson.toJson(requestbeanObj),"GET");
        	//System.out.println("Response String::::aa:::::::"+resultStr);
            String responseCode = Response.getResponseCode(resultStr);
        	if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
        		  salesReportObj = gson.fromJson(resultStr,SalesReport.class); 
		
        		  if(salesReportObj.getItemReportList()!= null && salesReportObj.getItemReportList().size() > 0){
  					//salesReportObj.getReportsList().get(0).setTotalRecords(salesReportObj.getTotalRecords());
  					salesReportObj.setReportsList(salesReportObj.getItemReportList());
  					if(salesReportObj.getTotalRecords()!= null)
  					salesReportObj.getReportsList().get(0).setTotalRecords(salesReportObj.getTotalRecords().toString());
  					
  					if(salesReportObj.getSalesReportFilePath()!= null)	
						salesReportObj.getReportsList().get(0).setSalesReportFilePath(salesReportObj.getSalesReportFilePath());
  				
  					if(salesReportObj.getFileUrl()!= null)	
						salesReportObj.getItemReportList().get(0).setFileUrl(salesReportObj.getFileUrl());
  				
        		  }
        	
        	}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}  catch(Exception e){
			e.printStackTrace();
		}
		return salesReportObj.getItemReportList();
	}
	
	
	/**
	 * @author chaithanya
	 * 
	 * This method is used to call the Supplies Report method of web service and return the response.
	 * It accepts a file consisting of data to be uploaded to sku master table.
	 * 
	 */
	public WarehouseReport getSupplierReport(String index,String maxRecords,String zone,String location,String category,String subcategory,String brand,String startdate,String enddate,String searchCriteria,String supplierId){
		String resultStr = null;
		WarehouseReport response = null;
		try {
			WarehouseReport report = new WarehouseReport();
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			report.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			report.setStartIndex(index);
			report.setMaxRecords(maxRecords);
			report.setLocation(location);
			report.setCategory(category);
			report.setSubCategory(subcategory);
			report.setBrand(brand);
			report.setStartDateStr(startdate);
			report.setEndDateStr(enddate);
			report.setSearchCriteria(searchCriteria);
			report.setSupplierId(supplierId);
			// //////////////System.out.println("Request String::::::::::::"+gson.toJson(report));
            resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("supplies_report"), gson.toJson(report),"GET");
            response = gson.fromJson(resultStr,WarehouseReport.class); 
			if(response.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}  catch(Exception e){
			e.printStackTrace();
		}
		return response;
	}
	
	/**
	 * @author chaithanya
	 * 
	 * This method is used to call the Supplies Report method of web service and return the response.
	 * It accepts a file consisting of data to be uploaded to sku master table.
	 * 
	 */
	public WarehouseReport getOutletSupplierReport(String index,String maxRecords,String zone,String location,String category,String subcategory,String brand,String startdate,String enddate,String searchCriteria,String supplierId,boolean saveFlag){
		String resultStr = null;
		WarehouseReport response = null;
		try {
			WarehouseReport report = new WarehouseReport();
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			report.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			report.setStartIndex(index);
			report.setMaxRecords(maxRecords);
			report.setStore_location(location);
			report.setCategoryName(category);
			report.setSubCategory(subcategory);
			report.setBrand(brand);
			report.setStartDate(startdate);
			report.setEndDate(enddate);
			report.setSearchCriteria(searchCriteria);
			report.setSupplierName(supplierId);
			report.setRequiredRecords(maxRecords);
			//report.setSaveReportFlag(saveFlag);
		      report.setSaveReport(saveFlag);
			 ////////////////System.out.println("Request String::::::::::::"+gson.toJson(report));
            resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_sales_vs_shipments"), gson.toJson(report),"GET");
            response = gson.fromJson(resultStr,WarehouseReport.class);
           // //////////////System.out.println(resultStr);
			if(response.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				if(response.getSalesReportFilePath()!= null)	
					response.setSalesReportFilePath(response.getSalesReportFilePath());
				
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}  catch(Exception e){
			e.printStackTrace();
		}
		return response;
	}
	
	
	public WarehouseReport getSaleVoidItemsReport(String index,String maxRecords,String BusinessArea,String zone,String category,String subCategory,String Department, String SubDepartment, String section,String location,String startdate,String enddate,String searchCriteria,String searchVoidItems) throws SocketTimeoutException{
		String resultStr = null;
		
		////////////////System.out.println("StartDate: " + startdate+"Enddate:"+enddate);
		
		WarehouseReport response = null;
		try {
			 
			// log.info("getSaleVoidItemsReport");
			WarehouseReport report = new WarehouseReport();
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			report.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			report.setStartIndex(index);
			report.setMaxRecords(maxRecords);
			if(location.equals("All")||(location.equals("all")))
			location="";
			report.setStore_location(location);
			//report.setLocation(location);
			report.setCategory(category);
			report.setCategoryName(category);
			report.setSubCategory(subCategory);
			report.setStartDate(startdate);
			report.setEndDate(enddate);
			report.setSearchCriteria(searchVoidItems);
			report.setZoneId(zone);
			report.setRequiredRecords(maxRecords);
			report.setDepartment(Department);
			report.setSubDepartment(SubDepartment);
			
			
			 // log.info("Request String::::::::::::"+gson.toJson(report));
			 String requestString=gson.toJson(report);
			// //////////////System.out.println("request string:::::::::::::::::::::");
			// //////////////System.out.println(requestString);
			
		//	report.setSearchName(searchVoidItems);
            resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_sales_void_items_report"), gson.toJson(report),"GET");
            
            
            response = gson.fromJson(resultStr,WarehouseReport.class);
            
           // //////////////System.out.println(resultStr);
            
			if(response.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				response = gson.fromJson(resultStr,WarehouseReport.class); 
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return response;
	}
	
	
	/**
	 * @author manasa
	 * 
	 * This method is used to call the getsalesmancommission method of web service and return the response.
	 * 
	 * 
	 */
	
 public List<SalesReport> getSalesmanCommission(String index,String maxRecords,String zone,String location,String category,String subcategory,String brand,String startdate,String enddate,String searchCriteria,String department,boolean saveFlag){
		String resultStr = null;
		ReportsRequestBean requestbeanObj = null;
		SalesReport salesReportObj = new SalesReport();
		try{
			// log.info("generateSalesReportCriteriaWise");
			////////////////System.out.println("sales commission");
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			requestbeanObj = new ReportsRequestBean();
			requestbeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestbeanObj.setStartIndex(index);
			requestbeanObj.setStore_location(location);
			requestbeanObj.setBrand(brand);
			requestbeanObj.setStartDate(startdate);
			requestbeanObj.setEndDate(enddate);
			//requestbeanObj.setSearchCriteria(searchCriteria);
			requestbeanObj.setRequiredRecords(maxRecords);
			requestbeanObj.setCategoryName(category);
			requestbeanObj.setRequiredRecords(maxRecords);
			requestbeanObj.setSaveReport(saveFlag);
			requestbeanObj.setZoneId(zone);
			requestbeanObj.setSubCategory(subcategory);
			requestbeanObj.setDepartment(department);
			requestbeanObj.setSearchCriteriaStr(searchCriteria);
            // log.info("Request String::::::::::::"+gson.toJson(requestbeanObj));
         ///   System.out.println("Request String::::::::::::"+gson.toJson(requestbeanObj));
            resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_sales_man_commission_report"), gson.toJson(requestbeanObj),"GET");
     	   /// System.out.println("Commission Response String:::::::::::"+resultStr);
            String responseCode = Response.getResponseCode(resultStr);
        	if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
        		  salesReportObj = gson.fromJson(resultStr,SalesReport.class); 
        		  if(salesReportObj.getReportsList()!= null && salesReportObj.getReportsList().size() > 0){
    					if(salesReportObj.getTotalRecords()!= null)
    					salesReportObj.getReportsList().get(0).setTotalRecords(salesReportObj.getTotalRecords().toString());
    					
    					if(salesReportObj.getSalesReportFilePath()!= null)	
  						salesReportObj.getReportsList().get(0).setSalesReportFilePath(salesReportObj.getSalesReportFilePath());
    				}
        		 
        	}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return salesReportObj.getReportsList();
	}
	

	/**
	 * @author manasa
	 * 
	 * This method is used to call the getsalesmancommission method of web service and return the response.
	 * 
	 * 
	 */
	
	public List<SalesReport> getSalesmenSalesCommission(String index,String maxRecords,String zone,String location,String category,String subcategory,String brand,String startdate,String enddate,String searchCriteria,String department,boolean saveFlag){
		String resultStr = null;
		ReportsRequestBean requestbeanObj = null;
		SalesReport salesReportObj = new SalesReport();
		try{
			// log.info("generateSalesReportCriteriaWise");
			////////////////System.out.println("sales commission");
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			requestbeanObj = new ReportsRequestBean();
			requestbeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestbeanObj.setStartIndex(index);
			requestbeanObj.setStore_location(location);
			requestbeanObj.setBrand(brand);
			requestbeanObj.setStartDate(startdate);
			requestbeanObj.setEndDate(enddate);
			//requestbeanObj.setSearchCriteria(searchCriteria);
			requestbeanObj.setRequiredRecords(maxRecords);
			requestbeanObj.setCategoryName(category);
			requestbeanObj.setRequiredRecords(maxRecords);
			requestbeanObj.setSaveReport(saveFlag);
			requestbeanObj.setZoneId(zone);
			requestbeanObj.setSubCategory(subcategory);
			requestbeanObj.setDepartment(department);
			requestbeanObj.setSearchCriteriaStr(searchCriteria);
            // log.info("Request String::::::::::::"+gson.toJson(requestbeanObj));
         //  //////////////System.out.println("Request String::::::::::::"+gson.toJson(requestbeanObj));
            resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Salesmen_SalesReport"), gson.toJson(requestbeanObj),"GET");
        	////////////////System.out.println("sales men Response String:::::::::::"+resultStr);
          // System.out.println("sales men Response String:::::::::::"+resultStr);
            String responseCode = Response.getResponseCode(resultStr);
        	if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
        		  salesReportObj = gson.fromJson(resultStr,SalesReport.class); 
        		  if(salesReportObj.getReportsList()!= null && salesReportObj.getReportsList().size() > 0){
    					if(salesReportObj.getTotalRecords()!= null)
    					salesReportObj.getReportsList().get(0).setTotalRecords(salesReportObj.getTotalRecords().toString());
    					
    					if(salesReportObj.getSalesReportFilePath()!= null)	
  						salesReportObj.getReportsList().get(0).setSalesReportFilePath(salesReportObj.getSalesReportFilePath());
    				}
        		 
        	
        	}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return salesReportObj.getReportsList();
	}
	
	
	public List<SalesReport> generateReportCriteriaWise(String customerIdStr,String emailIdStr,String locationStr,
			String startDateStr,String endDateStr,String maxRecordsStr,String criteriaStr,String indexStr,String order,
			String orderBy,boolean saveFlag,String counterId,String categoryStr,String zone,String subactegory,String department,String brand,String section,String supplier){
		String resultStr = null;
		ReportsRequestBean requestbeanObj = null;
//		SalesProxy salesProxyObj = null;
		RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
		SalesReport salesReportObj = new SalesReport();
		try{
			// log.info("generateSalesReportCriteriaWise");
			requestbeanObj = new ReportsRequestBean();
//			salesProxyObj = new SalesProxy();
			requestbeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestbeanObj.setStartIndex(indexStr);
			requestbeanObj.setStore_location(locationStr);
			if(criteriaStr.equals("hour"))
			{
				requestbeanObj.setLocation(locationStr);
				requestbeanObj.setMaxRecords(maxRecordsStr);
			}
			requestbeanObj.setBrand(brand);
			
			requestbeanObj.setStartDate(startDateStr);
			requestbeanObj.setEndDate(endDateStr);
			requestbeanObj.setSearchCriteria(criteriaStr);
			requestbeanObj.setRequiredRecords(maxRecordsStr);
			requestbeanObj.setOrder(order);
			requestbeanObj.setOrderBy(orderBy);
			requestbeanObj.setCounterId(counterId);
			requestbeanObj.setSearchName(categoryStr);
			requestbeanObj.setCategoryName(categoryStr);
			requestbeanObj.setSaveReport(saveFlag);
			requestbeanObj.setZoneId(zone);
			requestbeanObj.setDepartment(department);
			requestbeanObj.setSubCategory(subactegory);
			requestbeanObj.setSection(section);
			requestbeanObj.setSupplierName(supplier);
					// log.info("Request String::::::::::::"+gson.toJson(requestbeanObj));
            ////////////////System.out.println("Request String::::::::::::"+gson.toJson(requestbeanObj));
	    	if(criteriaStr.equals("category"))
	    		resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_category_summary"), gson.toJson(requestbeanObj), "GET");
	    	else if(criteriaStr.equals("brand"))
	    		resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_brand_summary"), gson.toJson(requestbeanObj), "GET");
	    	else if(criteriaStr.equals("section"))
	    		resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_section_summary"), gson.toJson(requestbeanObj), "GET");
	    	else if(criteriaStr.equals("supplier"))
	    		resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_supplier_summary"), gson.toJson(requestbeanObj), "GET");
			
			
			// log.info("Response String:::::::::::"+resultStr);
			
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				salesReportObj = gson.fromJson(resultStr,SalesReport.class); 
			}
		}catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}catch(Exception e){
			e.printStackTrace();
		}
		return salesReportObj.getReportsList();
		
	}

	
	
	
	
	
	
	/**
	 * @author chaithanya
	 * 
	 * This method is used to call the Supplies Report method of web service and return the response.
	 * It accepts a file consisting of data to be uploaded to sku master table.
	 * 
	 */
	public WarehouseReport getPriceVariatonReport(String index,String maxRecords,String zone,String location,String category,String subcategory,String brand,String startdate,String enddate,String searchCriteria){
		String resultStr = null;
		WarehouseReport response = null;
		try {
			WarehouseReport report = new WarehouseReport();
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			report.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			report.setStartIndex(index);
			report.setMaxRecords(maxRecords);
			report.setLocation(location);
			report.setCategory(category);
			report.setSubCategory(subcategory);
			report.setBrand(brand);
			report.setStartDateStr(startdate);
			report.setEndDateStr(enddate);
			report.setSearchCriteria(searchCriteria);
            resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("price_variation"), gson.toJson(report),"GET");
            response = gson.fromJson(resultStr,WarehouseReport.class); 
			if(response.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}  catch(Exception e){
			e.printStackTrace();
		}
		return response;
	}
	
	
	
	
	
	
	/**
	 * @author Manasa
	 * 
	 * This method is used to call the priceoverride Report method of web service and return the response.
	
	 * 
	 */
	public WarehouseReport getPriceOverrideReport(String index,String maxRecords,String zone,String location,String category,String subcategory,String brand,String startdate,String enddate,String searchCriteria,boolean saveFlag,String department){
		String resultStr = null;
		WarehouseReport response = null;
		try {
			WarehouseReport report = new WarehouseReport();
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			report.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			report.setStartIndex(index);
			//report.setMaxRecords(maxRecords);
			//report.setLocation(location);
			report.setRequiredRecords(maxRecords);
			report.setStore_location(location);
			report.setCategoryName(category);
			//report.setCategory(category);
			report.setSubCategory(subcategory);
			report.setBrand(brand);
			//report.setStartDateStr(startdate);
			report.setStartDate(startdate);
			report.setEndDate(enddate);
			//report.setEndDateStr(enddate);
			report.setSearchCriteria(searchCriteria);
			report.setMaxRecords(maxRecords);
			report.setSaveReport(saveFlag);
			report.setZoneId(zone);
			
			report.setDepartment(department);
			////////////////System.out.println("Request String::::::::::::"+gson.toJson(report));
            resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_sales_price_override"), gson.toJson(report),"GET");
           ////////////System.out.println("Response get_sales_price_override String "+ resultStr);
            response = gson.fromJson(resultStr,WarehouseReport.class); 
			if(response.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				if(response.getSalesReportFilePath()!= null)	
					response.setSalesReportFilePath(response.getSalesReportFilePath());
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}  catch(Exception e){
			e.printStackTrace();
		}
		return response;
	}
	
	
	/**
	 * @author Surya.k
	 * 
	 * This method is used to call the price change Report method of web service and return the response.
	
	 * 
	 */
	public PriceChangeReportBean getPriceChangeReport(String index,String maxRecords,String zone,String location,String category,String subcategory,String brand,String startdate,String enddate,String searchCriteria,boolean saveFlag,String department){
		String resultStr = null;
		PriceChangeReportBean response = null;
		try {
			PriceChangeReportBean report = new PriceChangeReportBean();
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			report.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			report.setStartIndex(index);
			report.setRequiredRecords("10");
			report.setStore_location(location);
			report.setCategoryName(category);
			report.setSubCategory(subcategory);
			//report.setBrand(brand);
			report.setStartDate(startdate);
			report.setEndDate(enddate);
			report.setSearchCriteria(searchCriteria);
			//report.setMaxRecords(maxRecords);
			report.setSaveReport(saveFlag);
			//report.setZoneId(zone);
			report.setDepartment(department);
			
			////////////System.out.println("Request String::::::::::::"+gson.toJson(report));
            resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_PriceChangeReport"), gson.toJson(report),"GET");
           ////////////System.out.println("Response String "+ resultStr);
            response = gson.fromJson(resultStr,PriceChangeReportBean.class); 
			if(response.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				if(response.getSalesReportFilePath()!= null)	
					response.setSalesReportFilePath(response.getSalesReportFilePath());
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}  catch(Exception e){
			e.printStackTrace();
		}
		return response;
	}
	
	
	
	/**
	 * @author Surya.k
	 * 
	 * This method is used to call the cashier shortage Report method of web service and return the response.
	
	 * 
	 */
	public CashierShortageReportBean getCashierShortageReport(String index,String maxRecords,String zone,String location,String counter,String cashier,String startdate,String enddate,boolean saveFlag){
		String resultStr = null;
		CashierShortageReportBean response = null;
		try {
			CashierShortageReportBean report = new CashierShortageReportBean();
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			report.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			report.setStartIndex(index);
			report.setRequiredRecords("10");
			report.setStore_location(location);
			report.setStartDate(startdate);
			report.setEndDate(enddate);
			report.setSaveReport(saveFlag);
			report.setCashierId(cashier);
			report.setCounterId(counter);
			
			////////////System.out.println("Request String::get_CashierShortageReport::::::::::"+gson.toJson(report));
            resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_CashierShortageReport"), gson.toJson(report),"GET");
           ////////////System.out.println("Response String "+ resultStr);
            response = gson.fromJson(resultStr,CashierShortageReportBean.class); 
			if(response.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				if(response.getSalesReportFilePath()!= null)	
					response.setSalesReportFilePath(response.getSalesReportFilePath());
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}  catch(Exception e){
			e.printStackTrace();
		}
		return response;
	}
	
	
	
	/**
	 * @author Mythri.S	
	 * Created On: 6-oct-2015
	 * 
	 * This method is used to call the getSkuLedger method of web service and return the transaction List.
	 * 
	 */
	public List<VerificationDetails> getStockVerification(String customerIdStr,String emailIdStr,String index,String storeLocation){
		String resultStr = null;
		StockLedger stockLedgerObj = new StockLedger();
		try {
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			stockLedgerObj.setStartIndex(index);
			stockLedgerObj.setStoreLocation(storeLocation);
			stockLedgerObj.setRequiredRecords(AppProperties.getAppMessageByProperty("REQUIRED_RECORDS").trim());
			stockLedgerObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String:::::::"+gson.toJson(stockLedgerObj));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Sku_Service_get_stock_verification"), gson.toJson(stockLedgerObj), "POST");
			// log.info("Response String:::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				stockLedgerObj = gson.fromJson(resultStr, StockLedger.class);
				if(stockLedgerObj.getVerificationDetails() != null && stockLedgerObj.getVerificationDetails().size() != 0)
					stockLedgerObj.getVerificationDetails().get(0).setTotalRecords(stockLedgerObj.getTotalRecords());
				
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return stockLedgerObj.getVerificationDetails();
	}
	
	
	
	
	/**
	 * @author RaviTeja.N
	 * 
	 * This method is used to get all'X-Reports' 
	 * 
	 */
	public Reports getOutletXZReports(Reports reportsObj,String customerIdStr,String emailIdStr){
		String resultStr = null;
		//SalesProxy salesProxyObj = null;
		Reports xReportReponseObj = null;
		try{
			/*// log.info("getOutletXZReport");
			salesProxyObj = new SalesProxy();*/
			reportsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			if(reportsObj.getStartIndex().equals("0"))
				reportsObj.setStartIndex("0");
			else 
				reportsObj.setStartIndex(reportsObj.getStartIndex());
            /*// log.info("Request String::::::::::::"+gson.toJson(reportsObj));
//            //////////////System.out.println("Request String::::::::::::"+gson.toJson(reportsObj));
			resultStr = salesProxyObj.getXZreportDetails(gson.toJson(reportsObj));
			////////////System.out.println("Response String:::::::::::XZ reports "+resultStr);*/
			
			//System.out.println("Request String::::::::::::"+gson.toJson(reportsObj));
			resultStr = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("get_xzreport_details"), gson.toJson(reportsObj),"GET");

			
			String responseCode = Response.getResponseCode(resultStr);
			//////System.out.println(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				xReportReponseObj = gson.fromJson(resultStr,Reports.class); 
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
		} catch(Exception e){
			e.printStackTrace();
		}
		return xReportReponseObj;
		
	}
	
	/**
	 * @author chaithanya
	 * 
	 * This method is used to call the Profitability Report method of web service and return the response.
	 * It accepts a file consisting of data to be uploaded to sku master table.
	 * 
	 */
	public WarehouseReport getProfitabilityReport(String index,String maxRecords,String zone,String location,String category,String subcategory,String brand,String startdate,String enddate,String searchCriteria,String supplierId,boolean flag,String section){
		String resultStr = null;
		WarehouseReport response = null;
		try {
			WarehouseReport report = new WarehouseReport();
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			report.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			report.setStartIndex(index);
			report.setRequiredRecords(maxRecords);
			report.setStore_location(location);
			report.setCategoryName(category);
			report.setSubCategory(subcategory);
			report.setBrand(brand);
			report.setStartDate(startdate);
			report.setEndDate(enddate);
			report.setSearchCriteriaStr(searchCriteria);
			report.setSupplierName(supplierId);
			report.setSaveReport(flag);
			report.setSection(section);
            resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_profitability_report"), gson.toJson(report),"GET");
            response = gson.fromJson(resultStr,WarehouseReport.class); 
            ////////////System.out.println("get_profitability_report................"+gson.toJson(response));
			if(response.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}  catch(Exception e){
			e.printStackTrace();
		}
		return response;
	}
	
	/**
	 * @author chaithanya
	 * 
	 * This method is used to call the Profitability Report method of web service and return the response.
	 * It accepts a file consisting of data to be uploaded to sku master table.
	 * 
	 */
	public WarehouseReport getDsrReport(String index,String maxRecords,String zone,String location,String category,String subcategory,String brand,String startdate,String enddate,String searchCriteria,String supplierId,boolean flag,String section,String type){
		String resultStr = null;
		WarehouseReport response = null;
		try {
			WarehouseReport report = new WarehouseReport();
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			report.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			report.setStartIndex(index);
			report.setRequiredRecords(maxRecords);
			report.setStore_location(location);
			report.setCategoryName(category);
			report.setSubCategory(subcategory);
			report.setBrand(brand);
			report.setStartDate(startdate);
			report.setEndDate(enddate);
			report.setSearchCriteriaStr(searchCriteria);
			report.setSearchCriteria(searchCriteria);
			report.setSupplierName(supplierId);
			report.setSaveReport(flag);
			report.setSection(section);
			report.setPeriodicType(type);
			//resultStr = "{\"serialNumber\":0,\"cardTotal\":0.0,\"cashTotal\":0.0,\"totalRecords\":2357,\"reportsList\":[{\"store_location\":\"Kharghar Store\",\"categoryName\":\"Fruits And Vegetables\",\"isSaveReport\":false,\"customerBillFormat\":false,\"subCategory\":\"Fruits And Vegetables\",\"department\":\"CONSUMER RETAIL\",\"section\":\"Whole Vegetable\",\"itemDesc\":\"Sweet Corn\",\"skuId\":\"0001\",\"cardTotal\":0.0,\"cashTotal\":0.0,\"vouchersTotal\":0.0,\"couponsTotal\":0.0,\"creditsAmt\":0.0,\"sodexTotal\":0.0,\"ticketTotal\":0.0,\"creditTotal\":0.0,\"cgstTaxValue\":0.0,\"sgstTaxValue\":0.0,\"igstTaxValue\":0.0,\"dueAmount\":0.0,\"receivedAmt\":0.0,\"otherTaxValue\":0.0,\"pluCode\":\"000102\",\"mapDet\":{\"WK2\":{\"price\":27.6,\"quantity\":0.69,\"isSaveReport\":false,\"catContVal\":56246.84,\"storeContVal\":49053.47,\"categoryComparable\":{}}}},{\"store_location\":\"Kharghar Store\",\"categoryName\":\"Fruits And Vegetables\",\"isSaveReport\":false,\"customerBillFormat\":false,\"subCategory\":\"Fruits And Vegetables\",\"department\":\"CONSUMER RETAIL\",\"section\":\"Whole Vegetable\",\"itemDesc\":\"Sweet Corn\",\"skuId\":\"0001\",\"cardTotal\":0.0,\"cashTotal\":0.0,\"vouchersTotal\":0.0,\"couponsTotal\":0.0,\"creditsAmt\":0.0,\"sodexTotal\":0.0,\"ticketTotal\":0.0,\"creditTotal\":0.0,\"cgstTaxValue\":0.0,\"sgstTaxValue\":0.0,\"igstTaxValue\":0.0,\"dueAmount\":0.0,\"receivedAmt\":0.0,\"otherTaxValue\":0.0,\"pluCode\":\"00012\",\"mapDet\":{\"WK3\":{\"price\":25.0,\"quantity\":1.0,\"isSaveReport\":false,\"catContVal\":62096.51,\"storeContVal\":54155.03,\"categoryComparable\":{}}}},{\"store_location\":\"Kharghar Store\",\"categoryName\":\"Fruits And Vegetables\",\"isSaveReport\":false,\"customerBillFormat\":false,\"subCategory\":\"Fruits And Vegetables\",\"department\":\"CONSUMER RETAIL\",\"section\":\"Whole Vegetable\",\"itemDesc\":\"Green Peas Loose\",\"skuId\":\"0002\",\"cardTotal\":0.0,\"cashTotal\":0.0,\"vouchersTotal\":0.0,\"couponsTotal\":0.0,\"creditsAmt\":0.0,\"sodexTotal\":0.0,\"ticketTotal\":0.0,\"creditTotal\":0.0,\"cgstTaxValue\":0.0,\"sgstTaxValue\":0.0,\"igstTaxValue\":0.0,\"dueAmount\":0.0,\"receivedAmt\":0.0,\"otherTaxValue\":0.0,\"pluCode\":\"000202\",\"mapDet\":{\"WK1\":{\"price\":109.2,\"quantity\":0.84,\"isSaveReport\":false,\"catContVal\":14216.23,\"storeContVal\":12398.13,\"categoryComparable\":{}},\"WK3\":{\"price\":9.0,\"quantity\":0.1,\"isSaveReport\":false,\"catContVal\":172490.3,\"storeContVal\":150430.65,\"categoryComparable\":{}}}},{\"store_location\":\"Kharghar Store\",\"categoryName\":\"Fruits And Vegetables\",\"isSaveReport\":false,\"customerBillFormat\":false,\"subCategory\":\"Fruits And Vegetables\",\"department\":\"CONSUMER RETAIL\",\"section\":\"Leafy\",\"itemDesc\":\"Curry Leaves\",\"skuId\":\"0003\",\"cardTotal\":0.0,\"cashTotal\":0.0,\"vouchersTotal\":0.0,\"couponsTotal\":0.0,\"creditsAmt\":0.0,\"sodexTotal\":0.0,\"ticketTotal\":0.0,\"creditTotal\":0.0,\"cgstTaxValue\":0.0,\"sgstTaxValue\":0.0,\"igstTaxValue\":0.0,\"dueAmount\":0.0,\"receivedAmt\":0.0,\"otherTaxValue\":0.0,\"pluCode\":\"000301\",\"mapDet\":{\"WK2\":{\"price\":30.0,\"quantity\":3.0,\"isSaveReport\":false,\"catContVal\":51747.09,\"storeContVal\":45129.19,\"categoryComparable\":{}}}},{\"store_location\":\"Kharghar Store\",\"categoryName\":\"Fruits And Vegetables\",\"isSaveReport\":false,\"customerBillFormat\":false,\"subCategory\":\"Fruits And Vegetables\",\"department\":\"CONSUMER RETAIL\",\"section\":\"Whole Vegetable\",\"itemDesc\":\"Lemon\",\"skuId\":\"0008\",\"cardTotal\":0.0,\"cashTotal\":0.0,\"vouchersTotal\":0.0,\"couponsTotal\":0.0,\"creditsAmt\":0.0,\"sodexTotal\":0.0,\"ticketTotal\":0.0,\"creditTotal\":0.0,\"cgstTaxValue\":0.0,\"sgstTaxValue\":0.0,\"igstTaxValue\":0.0,\"dueAmount\":0.0,\"receivedAmt\":0.0,\"otherTaxValue\":0.0,\"pluCode\":\"000801\",\"mapDet\":{\"WK3\":{\"price\":4.0,\"quantity\":1.0,\"isSaveReport\":false,\"catContVal\":388103.17,\"storeContVal\":338468.95,\"categoryComparable\":{}},\"WK2\":{\"price\":32.0,\"quantity\":5.0,\"isSaveReport\":false,\"catContVal\":48512.9,\"storeContVal\":42308.62,\"categoryComparable\":{}}}},{\"store_location\":\"FnV Nashik Outlet\",\"categoryName\":\"Fruits And Vegetables\",\"isSaveReport\":false,\"customerBillFormat\":false,\"subCategory\":\"Vegetables\",\"department\":\"CONSUMER RETAIL\",\"section\":\"Whole Vegetable\",\"itemDesc\":\"Lemon 4 PC\",\"skuId\":\"0008\",\"cardTotal\":0.0,\"cashTotal\":0.0,\"vouchersTotal\":0.0,\"couponsTotal\":0.0,\"creditsAmt\":0.0,\"sodexTotal\":0.0,\"ticketTotal\":0.0,\"creditTotal\":0.0,\"cgstTaxValue\":0.0,\"sgstTaxValue\":0.0,\"igstTaxValue\":0.0,\"dueAmount\":0.0,\"receivedAmt\":0.0,\"otherTaxValue\":0.0,\"pluCode\":\"000802\",\"mapDet\":{\"WK1\":{\"price\":63.0,\"quantity\":7.0,\"isSaveReport\":false,\"catContVal\":24641.47,\"storeContVal\":3535.39,\"categoryComparable\":{}},\"WK3\":{\"price\":46.0,\"quantity\":4.0,\"isSaveReport\":false,\"catContVal\":33748.1,\"storeContVal\":4841.95,\"categoryComparable\":{}}}},{\"store_location\":\"Kharghar Store\",\"categoryName\":\"Fruits And Vegetables\",\"isSaveReport\":false,\"customerBillFormat\":false,\"subCategory\":\"Fruits And Vegetables\",\"department\":\"CONSUMER RETAIL\",\"section\":\"Whole Vegetable\",\"itemDesc\":\"LEMON\",\"skuId\":\"0008a\",\"cardTotal\":0.0,\"cashTotal\":0.0,\"vouchersTotal\":0.0,\"couponsTotal\":0.0,\"creditsAmt\":0.0,\"sodexTotal\":0.0,\"ticketTotal\":0.0,\"creditTotal\":0.0,\"cgstTaxValue\":0.0,\"sgstTaxValue\":0.0,\"igstTaxValue\":0.0,\"dueAmount\":0.0,\"receivedAmt\":0.0,\"otherTaxValue\":0.0,\"pluCode\":\"0008a01\",\"mapDet\":{\"WK1\":{\"price\":40.0,\"quantity\":10.0,\"isSaveReport\":false,\"catContVal\":38810.32,\"storeContVal\":33846.9,\"categoryComparable\":{}}}},{\"store_location\":\"FnV Nashik Outlet\",\"categoryName\":\"Frozen\",\"isSaveReport\":false,\"customerBillFormat\":false,\"subCategory\":\"Pulp\",\"department\":\"CONSUMER RETAIL\",\"section\":\"Pulp Product\",\"itemDesc\":\"Guava Pulp-Sweetened 1 kg\",\"skuId\":\"000C\",\"cardTotal\":0.0,\"cashTotal\":0.0,\"vouchersTotal\":0.0,\"couponsTotal\":0.0,\"creditsAmt\":0.0,\"sodexTotal\":0.0,\"ticketTotal\":0.0,\"creditTotal\":0.0,\"cgstTaxValue\":0.0,\"sgstTaxValue\":0.0,\"igstTaxValue\":0.0,\"dueAmount\":0.0,\"receivedAmt\":0.0,\"otherTaxValue\":0.0,\"pluCode\":\"000C01\",\"mapDet\":{\"WK4\":{\"price\":1140.0,\"quantity\":19.0,\"isSaveReport\":false,\"catContVal\":95.83,\"storeContVal\":195.38,\"categoryComparable\":{}},\"WK1\":{\"price\":1560.0,\"quantity\":26.0,\"isSaveReport\":false,\"catContVal\":70.03,\"storeContVal\":142.78,\"categoryComparable\":{}},\"WK3\":{\"price\":1320.0,\"quantity\":22.0,\"isSaveReport\":false,\"catContVal\":82.76,\"storeContVal\":168.73,\"categoryComparable\":{}},\"WK2\":{\"price\":240.0,\"quantity\":4.0,\"isSaveReport\":false,\"catContVal\":455.17,\"storeContVal\":928.04,\"categoryComparable\":{}}}},{\"store_location\":\"Kharghar Store\",\"categoryName\":\"Fruits And Vegetables\",\"isSaveReport\":false,\"customerBillFormat\":false,\"subCategory\":\"Fruits And Vegetables\",\"department\":\"CONSUMER RETAIL\",\"section\":\"Gourd\",\"itemDesc\":\"Ash Kola\",\"skuId\":\"000G\",\"cardTotal\":0.0,\"cashTotal\":0.0,\"vouchersTotal\":0.0,\"couponsTotal\":0.0,\"creditsAmt\":0.0,\"sodexTotal\":0.0,\"ticketTotal\":0.0,\"creditTotal\":0.0,\"cgstTaxValue\":0.0,\"sgstTaxValue\":0.0,\"igstTaxValue\":0.0,\"dueAmount\":0.0,\"receivedAmt\":0.0,\"otherTaxValue\":0.0,\"pluCode\":\"000G01\",\"mapDet\":{\"WK1\":{\"price\":28.2,\"quantity\":0.47,\"isSaveReport\":false,\"catContVal\":55050.09,\"storeContVal\":48009.78,\"categoryComparable\":{}}}},{\"store_location\":\"FnV Nashik Outlet\",\"categoryName\":\"FMCG\",\"isSaveReport\":false,\"customerBillFormat\":false,\"subCategory\":\"Processed Food\",\"department\":\"CONSUMER RETAIL\",\"section\":\"Pick-N-Eat\",\"itemDesc\":\"Mix Fruit Jam 350 Gm\",\"skuId\":\"000H\",\"cardTotal\":0.0,\"cashTotal\":0.0,\"vouchersTotal\":0.0,\"couponsTotal\":0.0,\"creditsAmt\":0.0,\"sodexTotal\":0.0,\"ticketTotal\":0.0,\"creditTotal\":0.0,\"cgstTaxValue\":0.0,\"sgstTaxValue\":0.0,\"igstTaxValue\":0.0,\"dueAmount\":0.0,\"receivedAmt\":0.0,\"otherTaxValue\":0.0,\"pluCode\":\"000H1\",\"mapDet\":{\"WK4\":{\"price\":1980.0,\"quantity\":33.0,\"isSaveReport\":false,\"catContVal\":137.47,\"storeContVal\":112.49,\"categoryComparable\":{}},\"WK1\":{\"price\":3720.0,\"quantity\":62.0,\"isSaveReport\":false,\"catContVal\":73.17,\"storeContVal\":59.87,\"categoryComparable\":{}},\"WK3\":{\"price\":6660.0,\"quantity\":111.0,\"isSaveReport\":false,\"catContVal\":40.87,\"storeContVal\":33.44,\"categoryComparable\":{}},\"WK2\":{\"price\":5340.0,\"quantity\":89.0,\"isSaveReport\":false,\"catContVal\":50.97,\"storeContVal\":41.71,\"categoryComparable\":{}}}}],\"responseHeader\":{\"responseCode\":\"0\",\"responseMessage\":\"Success\"},\"totalBills\":0,\"sodexTotal\":0.0,\"ticketTotal\":0.0,\"creditTotal\":0.0,\"loyaltyTotal\":0.0,\"floatTotalPrice\":0.0,\"fltDiscount\":0.0,\"vouchersTotal\":0.0,\"couponsTotal\":0.0,\"creditsAmt\":0.0,\"exchangedAmt\":0.0,\"returnedAmt\":0.0,\"noOfCreditBills\":0,\"creditBillsAmt\":0.0,\"dayTurnOverAmt\":0.0,\"totalSoldQty\":0,\"totalSoldValue\":0,\"soldQty\":0.0}";
            resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_dsr_report"), gson.toJson(report),"GET");
            response = gson.fromJson(resultStr,WarehouseReport.class); 
			if(response.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}  catch(Exception e){
			e.printStackTrace();
		}
		return response;
	}
	
	
	
	
	public List<WareHouseStockVerificationItems> getDumpReport(String index,String maxRecords,String brand,String zone,String category,String subCategory,String department, String subDepartment, String section,String location,String startdate,String enddate,String searchName,boolean saveFlag,String locationListAll){
		RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
		List <WareHouseStockVerificationItems> warehouseVerificationDetailsList = null;
		String resultStr = null;
		try{
			// log.info("Get Product Stock Verification from webservice");
			warehouseVerificationDetailsList = new ArrayList<WareHouseStockVerificationItems>();
			WareHouseStockVerification WHS = new WareHouseStockVerification();
			Verification verificationObj = new Verification();
			
			verificationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
//		
if(location.equals("all") || location.equals("")){
				
				List<String> myList = new ArrayList<String>(Arrays.asList(locationListAll.split(",")));
				verificationObj.setLocationsList(myList);
				}
				else
//			report.setLocation(location);
				verificationObj.setStore_location(location);
				verificationObj.setStartIndex(index);
				verificationObj.setRequiredRecords(maxRecords);
				verificationObj.setStartDate(startdate);
				verificationObj.setEndDate(enddate);
				verificationObj.setSearchCriteria(searchName);
				verificationObj.setSubCategory(subCategory);
				verificationObj.setCategoryName(category);
				verificationObj.setSaveReport(saveFlag);
				verificationObj.setZone(zone);
				verificationObj.setDepartment(department);
				verificationObj.setSubDepartment(subDepartment);
				verificationObj.setSection(section);
				verificationObj.setBrand(brand);
						
			////////////System.out.println("Request String:get_dump_report:::"+gson.toJson(verificationObj));
            resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_dump_report"), gson.toJson(verificationObj),"GET");
			////////////System.out.println("Response String::get_dump_report::"+resultStr);
			verificationObj = gson.fromJson(resultStr,Verification.class);
			if(verificationObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				WHS = verificationObj.getStockVerificationObj();
				warehouseVerificationDetailsList = verificationObj.getVerfItemsList();
				if(warehouseVerificationDetailsList != null && warehouseVerificationDetailsList.size() > 0){
					warehouseVerificationDetailsList.get(0).setTotalRecords(verificationObj.getTotalRecords());
					if(saveFlag)
						warehouseVerificationDetailsList.get(0).setSalesReportFilePath(verificationObj.getSalesReportFilePath());
						
				}
			}
			
		}
		catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = (String) AppProperties.getAppMessageByProperty("INVALID_REQUEST");
		}
		catch(Exception e){
		    e.printStackTrace();
		    resultStr = (String) AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
		}
		return warehouseVerificationDetailsList;
	}
	
	/**
	 * @author chaithanya
	 * 
	 * This method is used to call the Profitability Report method of web service and return the response.
	 * It accepts a file consisting of data to be uploaded to sku master table.
	 * 
	 */
	public WarehouseReport getNewProfitabilityReport(String index,String maxRecords,String zone,String location,String category,String subcategory,String brand,String startdate,String enddate,String searchCriteria,String supplierId,String section,boolean flag){
		String resultStr = null;
		WarehouseReport response = null;
		try {
			WarehouseReport report = new WarehouseReport();
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			report.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			report.setStartIndex(index);
			report.setRequiredRecords(maxRecords);
			report.setStore_location(location);
			report.setCategoryName(category);
			report.setSubCategory(subcategory);
			report.setBrand(brand);
			report.setStartDate(startdate);
			report.setEndDate(enddate);
			report.setSearchCriteriaStr(searchCriteria);
			report.setSupplierName(supplierId);
			report.setSection(section);
			report.setSaveReport(flag);
            resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_breakeven_report"), gson.toJson(report),"GET");
            response = gson.fromJson(resultStr,WarehouseReport.class); 
			if(response.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}  catch(Exception e){
			e.printStackTrace();
		}
		return response;
	}
	
	
	//////
	
	public List<SalesReport> getSalesCouponReport(String index,String maxRecords,String zone,String location,String startdate,String enddate, String searchCriteria, Boolean saveFlag){
		String resultStr = null;
		ReportsRequestBean requestbeanObj = null;
		SalesReport salesReportObj = new SalesReport();
		try{
			// log.info("generateSalesReportCriteriaWise");
			////////////////System.out.println("generateSalesReportCriteriaWise");
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			requestbeanObj = new ReportsRequestBean();
			requestbeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestbeanObj.setStartIndex(index);
			requestbeanObj.setStore_location(location);
			/*if(startTime == "")
				startTime ="00:00:00";
			if(endTime == "")
				endTime ="22:00:00";*/
			/*requestbeanObj.setStartDate(startdate+" "+startTime);
			requestbeanObj.setEndDate(enddate+" "+endTime);*/
			requestbeanObj.setStartDate(startdate);
			requestbeanObj.setEndDate(enddate);
			requestbeanObj.setSearchCriteria(searchCriteria);
			requestbeanObj.setRequiredRecords(maxRecords);
			requestbeanObj.setMaxRecords(maxRecords);
			requestbeanObj.setSaveReport(saveFlag);
			requestbeanObj.setZoneId(zone);
			//requestbeanObj.setSearchCriteria(searchCriteria);
			//requestbeanObj.setSearchCriteriaStr(searchCriteria);
            // log.info("Request String::::::::::::"+gson.toJson(requestbeanObj));
            //////////////System.out.println("Request String:::::::::::: for coupon report"+gson.toJson(requestbeanObj));
            resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_coupon_report"), gson.toJson(requestbeanObj),"GET");
        	////////////System.out.println("Response String:::::::::::.............. for Coupon report Res"+resultStr);
            String responseCode = Response.getResponseCode(resultStr);
        	if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
        		  salesReportObj = gson.fromJson(resultStr,SalesReport.class); 
  					
  					
  					if(salesReportObj.getTotalRecords()!= null)
  					salesReportObj.getReportsList().get(0).setTotalRecords(salesReportObj.getTotalRecords().toString());
  					if(salesReportObj.getSalesReportFilePath()!= null)	
						salesReportObj.getReportsList().get(0).setSalesReportFilePath(salesReportObj.getSalesReportFilePath());
  				
        	
        	}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}  catch(Exception e){
			e.printStackTrace();
		}
		//////////////System.out.println("report list .........."+gson.toJson(salesReportObj.getReportsList()));
		return salesReportObj.getReportsList();
	}
	
	/**
	 * 
	 *@author Surya.k
	 *written on 30/03/2019 
	 *This method is used to display viewItemWisePromotionSales.
	 *
	 *
	 **/
	
	public List<PromotionSalesReport> getItemWisePromotionSalesReport(String index,String maxRecords,String zone,String location,String startdate,String enddate, String searchCriteria,String promotionName, Boolean saveFlag){
		String resultStr = null;
		PromotionSalesReport requestbeanObj = null;
		PromotionSalesReport salesReportObj = new PromotionSalesReport();
		try{
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			requestbeanObj = new PromotionSalesReport();
			requestbeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestbeanObj.setStartIndex(index);
			requestbeanObj.setStoreLocation(location);
			requestbeanObj.setStartDate(startdate);
			requestbeanObj.setEndDate(enddate);
			requestbeanObj.setMaxRecords(Integer.parseInt(maxRecords));
			requestbeanObj.setSaveGNRFlag(saveFlag);
			requestbeanObj.setPromotionName(promotionName);
		//	requestbeanObj.setZone(zone);
			
            ////////////System.out.println("Request String:::::::::::: for get_itemWisePromotion_report report"+gson.toJson(requestbeanObj));
            resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_itemWisePromotion_report"), gson.toJson(requestbeanObj),"GET");
        	////////////System.out.println("Response String::::::::::: for get_itemWisePromotion_report report Res"+resultStr);
            String responseCode = Response.getResponseCode(resultStr);
        	if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
        		  salesReportObj = gson.fromJson(resultStr,PromotionSalesReport.class); 
  					
  					
  					if(salesReportObj.getTotalRecords()!= null)
  					salesReportObj.getItemWisePromotions().get(0).setTotalRecords(salesReportObj.getTotalRecords().toString());
  					if(salesReportObj.getFilePath()!= null)	
						salesReportObj.getItemWisePromotions().get(0).setFilePath(salesReportObj.getFilePath());
  				
        	
        	}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}  catch(Exception e){
			e.printStackTrace();
		}
		return salesReportObj.getItemWisePromotions();
	}
	
	/**
	 * 
	 *@author Surya.k
	 *written on 13/06/2019 
	 *This method is used to display viewItemWisePromotionSales.
	 *
	 *
	 **/
public List<Cart> getpendingCartReport(String index,String maxRecords,String startdate,String enddate, String searchCriteria, Boolean saveFlag,String status,String cartId){
		String resultStr = null;
		Cart requestbeanObj = null;
		CartResponse cartReportObj = new CartResponse();
		try{
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			requestbeanObj = new Cart();
			requestbeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestbeanObj.setStartIndex(Integer.parseInt(index));
			requestbeanObj.setStartDate(startdate);
			requestbeanObj.setEndDate(enddate);
			requestbeanObj.setMaxRecords(Integer.parseInt(maxRecords));
			requestbeanObj.setStatus(status);
			requestbeanObj.setCartId(cartId);
			requestbeanObj.setSaveReport(true);
			requestbeanObj.setSearchCriteria(searchCriteria);
          // //////System.out.println("Request String:::::::::::: for get_CartReport report"+gson.toJson(requestbeanObj));
            resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_CartReport"), gson.toJson(requestbeanObj),"GET");
        	// //////System.out.println("Response String::::::::::: for get_CartReport report Res"+resultStr);
            String responseCode = Response.getResponseCode(resultStr);
        	if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
        		cartReportObj = gson.fromJson(resultStr,CartResponse.class); 
  					
  					
  					if(cartReportObj.getTotalRecords()!= null)
  						cartReportObj.getCartList().get(0).setTotalRecords(cartReportObj.getTotalRecords().toString());
  					if(cartReportObj.getFilePath()!= null)	
  						cartReportObj.getCartList().get(0).setFilePath(cartReportObj.getFilePath());
  				
        	
        	}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}  catch(Exception e){
			e.printStackTrace();
		}
		 ////////////System.out.println("Cart List:::::::::"+gson.toJson(cartReportObj.getCartList()));
		return cartReportObj.getCartList();
		
	}

public List<Cart> getpendingCartReportView(String index,String maxRecords,String startdate,String enddate, String searchCriteria, Boolean saveFlag,String status,String cartId){
	String resultStr = null;
	Cart requestbeanObj = null;
	CartResponse cartReportObj = new CartResponse();
	try{
		RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
		requestbeanObj = new Cart();
		requestbeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		//requestbeanObj.setStartIndex(Integer.parseInt(index));
		requestbeanObj.setStartDate(startdate);
		requestbeanObj.setEndDate(enddate);
		//requestbeanObj.setMaxRecords(Integer.parseInt(maxRecords));
		requestbeanObj.setStatus(status);
		requestbeanObj.setCartId(cartId);
		requestbeanObj.setSaveReport(true);
        ////////System.out.println("Request String:::::::::::: for get_CartReport report"+gson.toJson(requestbeanObj));
        resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_CartReport"), gson.toJson(requestbeanObj),"GET");
    	////////System.out.println("Response String::::::::::: for get_CartReport report Res"+resultStr);
        String responseCode = Response.getResponseCode(resultStr);
    	if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
    		cartReportObj = gson.fromJson(resultStr,CartResponse.class); 
					
					
					if(cartReportObj.getTotalRecords()!= null)
						cartReportObj.getCartList().get(0).setTotalRecords(cartReportObj.getTotalRecords().toString());
					if(cartReportObj.getFilePath()!= null)	
						cartReportObj.getCartList().get(0).setFilePath(cartReportObj.getFilePath());
				
    	
    	}
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	}  catch(Exception e){
		e.printStackTrace();
	}
	 ////////////System.out.println("Cart List:::::::::"+gson.toJson(cartReportObj.getCartList()));
	return cartReportObj.getCartList();
	
}


/**
 * 
 *@author Surya.k
 *written on 13/06/2019 
 *This method is used to display viewItemWisePromotionSales.
 *
 *
 **/
public List<Billing> getBilledOrderReport(String index,String maxRecords,String zoneId,String location,String counterId,String salesChannel,String startdate,String enddate, String searchCriteria, Boolean saveFlag,String billRef){
	String resultStr = null;
	SalesReportsBean requestbeanObj = null;
	SalesReportsBean responceReportObj = new SalesReportsBean();
	try{
		RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
		requestbeanObj = new SalesReportsBean();
		requestbeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		requestbeanObj.setStartIndex((index));
		requestbeanObj.setMaxRecords(Integer.parseInt(maxRecords));
		requestbeanObj.setStartDate(startdate);
		requestbeanObj.setEndDate(enddate);		
		requestbeanObj.setStore_location(location);
		requestbeanObj.setZoneId(zoneId);
		requestbeanObj.setSalesChannel(salesChannel);
		requestbeanObj.setCounterId(counterId);
		requestbeanObj.setSearchCriteria(searchCriteria);
		requestbeanObj.setBillRef(billRef);
		requestbeanObj.setSaveReport(true);
		
        //////System.out.println("Request String:::::::::::: for get_OrdertoBillReport report"+gson.toJson(requestbeanObj));
        resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_OrdertoBillReport"), gson.toJson(requestbeanObj),"GET");
    	////////////System.out.println("Response String::::::::::: for get_OrdertoBillReport report Res"+resultStr);
        String responseCode = Response.getResponseCode(resultStr);
    	if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
    		responceReportObj = gson.fromJson(resultStr,SalesReportsBean.class); 
					
					
					
    		responceReportObj.getBillsList().get(0).setTotalRecords(String.valueOf(responceReportObj.getTotalRecords()));
					if(responceReportObj.getSalesReportFilePath()!= null)	
						responceReportObj.getBillsList().get(0).setFilePath(responceReportObj.getSalesReportFilePath());
				
    	
    	}
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	}  catch(Exception e){
		e.printStackTrace();
	}
	return responceReportObj.getBillsList();
	
}


public WarehouseReport getSaleCreditNoteRedeemReport(String index,String maxRecords,String brand,String zone,String category,String subCategory,String Department, String SubDepartment, String section,String location,String startdate,String enddate,String searchCriteria,String saveFlag){
	String resultStr = null;
	
	////////////////System.out.println("StartDate: " + startdate+"Enddate:"+enddate);
	
	WarehouseReport response = null;
	try {
		 
		// log.info("getSaleVoidItemsReport");
		WarehouseReport report = new WarehouseReport();
		RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
		report.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		report.setStartIndex(index);
		report.setMaxRecords(maxRecords);
		if(location.equals("All")||(location.equals("all")))
		location="";
		report.setStore_location(location);
		//report.setLocation(location);
		report.setCategory(category);
		report.setCategoryName(category);
		report.setSubCategory(subCategory);
		report.setStartDate(startdate);
		report.setEndDate(enddate);
		report.setSearchCriteria(searchCriteria);
		report.setZone(zone);
		report.setRequiredRecords(maxRecords);
		report.setDepartment(Department);
		report.setSubDepartment(SubDepartment);
		
		if(saveFlag.equals("true") || saveFlag=="true")
		{
			report.setSaveReport(true);
		}
		else
		{
			report.setSaveReport(false);
		}
		
		 // log.info("Request String::::::::::::"+gson.toJson(report));
		 ////////////System.out.println("Request String::::::::::::"+gson.toJson(report));
		 String requestString=gson.toJson(report);
        resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_sales_credit_note_redeem_report"), gson.toJson(report),"GET");
        ////////////System.out.println("response String get_sales_credit_note_redeem_report::"+resultStr);
        response = gson.fromJson(resultStr,WarehouseReport.class);
		if(response.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
			response = gson.fromJson(resultStr,WarehouseReport.class); 
		}
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	}  catch(Exception e){
		e.printStackTrace();
	}
	return response;
}

public SalesReport getSaleCashierEfficiencyReport(String index,String maxRecords,String brand,String zone,String category,String subCategory,String Department, String SubDepartment, String section,String location,String startdate,String enddate,String searchCriteria,String saveFlag){
	String resultStr = null;
	SalesReport response = null;
	try {
		ReportsRequestBean report = new ReportsRequestBean();
		RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
		report.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		report.setStartIndex(index);
		report.setMaxRecords(maxRecords);
		if(location.equals("All")||(location.equals("all")))
		location="";
		report.setStore_location(location);
		report.setLocation(location);
		report.setCategoryName(category);
		report.setCategoryName(category);
		report.setSubCategory(subCategory);
		report.setStartDate(startdate);
		report.setEndDate(enddate);
		report.setSearchCriteria(searchCriteria);
		report.setZoneId(zone);
		report.setRequiredRecords(maxRecords);
		report.setDepartment(Department);
		//report.setsu(SubDepartment);
		
		if(saveFlag.equals("true") || saveFlag=="true")
		{
			report.setSaveReport(true);
		}
		else
		{
			report.setSaveReport(false);
		}
		
		 
		////////////System.out.println("Request String:::::get_sales_cashier_efficiency_report:::::::"+gson.toJson(report));
		String requestString=gson.toJson(report);
        resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_sales_cashier_efficiency_report"), gson.toJson(report),"GET");
        //////////System.out.println("response String get_sales_cashier_efficiency_report::"+resultStr);
        response = gson.fromJson(resultStr,SalesReport.class);
		if(response.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
			response = gson.fromJson(resultStr,SalesReport.class); 
			////////////System.out.println("after:::::get_sales_cashier_efficiency_report:::::::"+gson.toJson(response));
		}
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	}  catch(Exception e){
		e.printStackTrace();
	}
	return response;
}

public String updateCashDenomination(String customer,String email,String roleIdStr,ReportsRequestBean ReportsRequestBean){
	String str_response = null;
	try {
		RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
		
		ReportsRequestBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
	
		
	////////////System.out.println("Request String update_cash_handover_denomination: : : : " + gson.toJson(ReportsRequestBean));
	str_response = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_cash_handover_denomination"), gson.toJson(ReportsRequestBean));
	////////////System.out.println("Response String update_cash_handover_denomination.... : : : : " + str_response);
	String responseCode = Response.getResponseCode(str_response);
	if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
		str_response = AppProperties.getAppMessageByProperty("Offer_Created_Successfully").trim();
		
	}
	else{
		str_response = Response.getResponseMessage(str_response);
	}
	}catch(ConnectException ce) {
		ce.printStackTrace();
		str_response = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		str_response = AppProperties.getAppMessageByProperty("INVALID_REQUEST");
	} catch (UnknownHostException uhe) {
		uhe.printStackTrace();
		str_response = AppProperties.getAppMessageByProperty("UNKNOWN_HOST");
	} catch (IOException ex) {
		ex.printStackTrace();
		str_response = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
	}catch(Exception e){
		e.printStackTrace();
		str_response = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
	}
	return str_response;
}

public List<SalesReport> getStandardSalesReport(String index,String maxRecords,String zone,String location,String salesChannel,String tender,String startdate,String enddate,boolean saveFlag){
	String resultStr = null;
	SalesReport response = null;
	try {
		ReportsRequestBean report = new ReportsRequestBean();
		RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
		report.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		report.setStartIndex(index);
		report.setRequiredRecords("10");
		report.setStore_location(location);
		report.setStartDate(startdate);
		report.setEndDate(enddate);
		report.setSaveReport(saveFlag);
		report.setCashierId("");
		report.setCounterId("");
		report.setSearchCriteria("");
		report.setSalesChannel(salesChannel);
		report.setTenderName(tender);
		
		//////////System.out.println("Request String::standard_sales_report::::::::::"+gson.toJson(report));
        resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("standard_sales_report"), gson.toJson(report),"GET");
       //////////System.out.println("Response String standard_sales_report:::"+ resultStr);
        response = gson.fromJson(resultStr,SalesReport.class); 
		if(response.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
			
			if(response.getReportList() != null && response.getReportList().size() > 0){
				response.getReportList().get(0).setTotalRecords(response.getTotalRecords());
				//response.getReportList().get(0).setReportSummery(response.getReportSummery());
				//response.getReportList().get(0).setCategorySummery(response.getCategorySummery());
				response.getReportList().get(0).setSalesReportFilePath(response.getSalesReportFilePath());
			}
			
			/*if(response.getSalesReportFilePath()!= null)	
				response.setSalesReportFilePath(response.getSalesReportFilePath());*/
		}
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	}  catch(Exception e){
		e.printStackTrace();
	}
	return response.getReportList();
}

public List<SalesReport> getStandardSalesDetailedReport(String index,String maxRecords,String zone,String location,String salesChannel,String tender,String startdate,String enddate,boolean saveFlag){
	String resultStr = null;
	SalesReport response = null;
	try {
		ReportsRequestBean report = new ReportsRequestBean();
		RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
		report.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		report.setStartIndex(index);
		report.setRequiredRecords("10");
		report.setStore_location(location);
		report.setStartDate(startdate);
		report.setEndDate(enddate);
		report.setSaveReport(saveFlag);
		report.setCashierId("");
		report.setCounterId("");
		report.setSearchCriteria("");
		report.setSalesChannel(salesChannel);
		report.setTenderName(tender);
		
		//////////System.out.println("Request String::standard_sales_detailed_report::::::::::"+gson.toJson(report));
        resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("standard_sales_detailed_report"), gson.toJson(report),"GET");
       //////////System.out.println("Response String standard_sales_detailed_report:::"+ resultStr);
        response = gson.fromJson(resultStr,SalesReport.class); 
		if(response.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
			
			if(response.getReportList() != null && response.getReportList().size() > 0){
				response.getReportList().get(0).setTotalRecords(response.getTotalRecords());
				response.getReportList().get(0).setSalesReportFilePath(response.getSalesReportFilePath());
			}
		}
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	}  catch(Exception e){
		e.printStackTrace();
	}
	return response.getReportList();
}







public List<ProductsList> generateOrderVsSaleReport(String customerIdStr,String emailIdStr,String locationStr,
		String startDateStr,String endDateStr,String maxRecordsStr,String criteriaStr,String indexStr,boolean saveFlag,String categoryStr,String zone,String subactegory,String department,String section,String locationListAll
){
	String resultStr = null;
	SearchProducts requestbeanObj = null;
	
	GetProductsResponse getProductsResponseObj = new GetProductsResponse();
	try{
		requestbeanObj = new SearchProducts();
		requestbeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		requestbeanObj.setStartIndex(indexStr);
		if(locationStr.equals("all") || locationStr.equals("")){
			List<String> myList = new ArrayList<String>(Arrays.asList(locationListAll.split(",")));
			requestbeanObj.setLocationsList(myList);
			}
		else
		requestbeanObj.setStoreLocation(locationStr);
	
		
		requestbeanObj.setMaxRecords(maxRecordsStr);
		
		
		SimpleDateFormat format1 = new SimpleDateFormat("dd/mm/yyyy");
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
		Date date = format1.parse(startDateStr);
		Date date1 = format1.parse(endDateStr);
		startDateStr =  format2.format(date).toString();
		endDateStr  =  format2.format(date1).toString();
		requestbeanObj.setSaveReport(saveFlag);
		requestbeanObj.setStartDateStr(startDateStr);
		requestbeanObj.setEndDateStr(endDateStr);
		requestbeanObj.setSearchCriteria(criteriaStr);
		requestbeanObj.setMaxRecords(maxRecordsStr);
		requestbeanObj.setProductCategory(categoryStr);
		
		requestbeanObj.setDepartment(department);
		requestbeanObj.setProductSubCategory(subactegory);
		requestbeanObj.setSection(section);
	
		
		
    ////////System.out.println("request string "+gson.toJson(requestbeanObj));
    		resultStr = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("order_vs_stock"), gson.toJson(requestbeanObj),"GET"); 
    	
    	
    		
		
		////////System.out.println("Reports Response String:::::::::::"+resultStr);
		String responseCode = Response.getResponseCode(resultStr);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			getProductsResponseObj = gson.fromJson(resultStr,GetProductsResponse.class); 
			
for(int i=0;i<getProductsResponseObj.getProductsList().size();i++){
				
	getProductsResponseObj.getProductsList().get(0).setTotalRecords(String.valueOf(getProductsResponseObj.getTotalRecords()));
	getProductsResponseObj.getProductsList().get(0).setFileUrl(getProductsResponseObj.getFileUrl());
	
				
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
	} catch(Exception e){
		e.printStackTrace();
	}
	return getProductsResponseObj.getProductsList();
}






public XZReportBean getOutletXZReportDiff(Reports reportsObj,String customerIdStr,String emailIdStr){
	String resultStr = null;
	
	XZReportBean xReportReponseObj = null;
	try{
		
		reportsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		
		if(reportsObj.getStartIndex().equals("0"))
			reportsObj.setStartIndex("0");
		else 
			reportsObj.setStartIndex(reportsObj.getStartIndex());
		
		if(reportsObj.getStore_location()==""){
			reportsObj.setStore_location("ALL");	
		}
       
		//////System.out.println("Request String::::::::::::"+gson.toJson(reportsObj));
		resultStr = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("get_xzreport"), gson.toJson(reportsObj),"GET");

		//////System.out.println("response String::::::::::::"+(resultStr));
		String responseCode = Response.getResponseCode(resultStr);
		System.err.println(responseCode);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			xReportReponseObj = gson.fromJson(resultStr,XZReportBean.class); 
		}else{
			xReportReponseObj = gson.fromJson(resultStr,XZReportBean.class); 
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
	} catch(Exception e){
		e.printStackTrace();
	}
	return xReportReponseObj;
	
}

public List<WHStockIssueReportBean> getOutletStockIssueReport(String index, String flow, String zone, String category,
		String brand, String startDate, String location, String subCategory, String supplier, String endDate,
		String search, String maxRecords) {

	String resultStr = null;
	
	WHStockIssueReportBean whStockIssueReportBean = null;
	WHStockIssueReportBean whStockIssueReportBeanObj = new WHStockIssueReportBean();

	try{
		
		whStockIssueReportBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		whStockIssueReportBeanObj.setStartIndex(index);
		whStockIssueReportBeanObj.setMaxRecords(maxRecords);
		whStockIssueReportBeanObj.setZone(zone);
		whStockIssueReportBeanObj.setCategory(category);
		whStockIssueReportBeanObj.setSubCategory(subCategory);
		whStockIssueReportBeanObj.setBrand(brand);
		whStockIssueReportBeanObj.setStartDate(startDate);
		whStockIssueReportBeanObj.setLocation(location);
		whStockIssueReportBeanObj.setSupplier(supplier);
		whStockIssueReportBeanObj.setEndDate(endDate);
		whStockIssueReportBeanObj.setSearchCriteria(search);
		//whStockIssueReportBeanObj.setmax
		
		//whStockIssueReportBeanObj.
       
		////////System.out.println("Request String::::::::::::"+gson.toJson(whStockIssueReportBeanObj));
		resultStr = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("get_stockissue_details"), gson.toJson(whStockIssueReportBeanObj),"GET");

		////////System.out.println("response String::::::::::::"+(resultStr));
		String responseCode = Response.getResponseCode(resultStr);
		System.err.println(responseCode);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			whStockIssueReportBean = gson.fromJson(resultStr,WHStockIssueReportBean.class); 
			whStockIssueReportBean.getStockIssueReportDetails().get(0).setTotalRecords(whStockIssueReportBean.getTotalRecords());
		}else{
			whStockIssueReportBean = gson.fromJson(resultStr,WHStockIssueReportBean.class); 
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
	} catch(Exception e){
		e.printStackTrace();
	}
	return whStockIssueReportBean.getStockIssueReportDetails();
	

}



public List<PurchaseReportsBean> getPurchaseReport(String index, String flow, String zone, String category,
		String supplierSearch, String startDate, String location, String items, String supplierID, String endDate,
		String search, String maxRecords, String save) {

	String resultStr = null;
	
	PurchaseReportsBean purchaseReportsBean = null;
	PurchaseReportsBean PurchaseReportsBeanObj = new PurchaseReportsBean();

	try{
		
		PurchaseReportsBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		PurchaseReportsBeanObj.setStartIndex(index);
		PurchaseReportsBeanObj.setMaxrecords(maxRecords);
		PurchaseReportsBeanObj.setZone(zone);
		PurchaseReportsBeanObj.setCategory(category);
		PurchaseReportsBeanObj.setItemWise(items);
		PurchaseReportsBeanObj.setSupplierId(supplierID);
		PurchaseReportsBeanObj.setStartDateStr(startDate);
		PurchaseReportsBeanObj.setStoreLocation(location);
		PurchaseReportsBeanObj.setSupplierName(supplierSearch);
		PurchaseReportsBeanObj.setEndDateStr(endDate);
		PurchaseReportsBeanObj.setSearchCriteria(search);
		if(save == "true" || save.equals("true")){
			PurchaseReportsBeanObj.setFileRequired(true);
		}
		
       
		//////System.out.println("Request String::::::::::::"+gson.toJson(PurchaseReportsBeanObj));
		resultStr = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("get_purchasereport_details"), gson.toJson(PurchaseReportsBeanObj),"GET");

		//////System.out.println("response String::::::::::::"+(resultStr));
		String responseCode = Response.getResponseCode(resultStr);
		System.err.println(responseCode);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			purchaseReportsBean = gson.fromJson(resultStr,PurchaseReportsBean.class); 
			purchaseReportsBean.getReportDetails().get(0).setTotalRecords(purchaseReportsBean.getTotalRecords());
			purchaseReportsBean.getReportDetails().get(0).setFileUrl(purchaseReportsBean.getFileUrl());
			
			
		}else{
			purchaseReportsBean = gson.fromJson(resultStr,PurchaseReportsBean.class); 
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
	} catch(Exception e){
		e.printStackTrace();
	}
	return purchaseReportsBean.getReportDetails();
	

}

public String PrintSalesPriceVariationReport(String index, String maxRecords, String zone, String location,
		String productCategory, String subcategory, String brand, String startdate, String enddate,
		String searchNameStr, String supplierId, String department, boolean saveFlag, boolean printFlag) {
	
	
	String resultStr = null;
	ReportsRequestBean requestbeanObj = null;
	SalesReport salesReportObj = new SalesReport();
	try{
		
		RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
		requestbeanObj = new ReportsRequestBean();
		requestbeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		requestbeanObj.setStartIndex(index);
		requestbeanObj.setStore_location(location);
		requestbeanObj.setBrand(brand);
		requestbeanObj.setStartDate(startdate);
		requestbeanObj.setEndDate(enddate);
		//requestbeanObj.setSearchCriteria(searchCriteria);
		requestbeanObj.setRequiredRecords(maxRecords);
		requestbeanObj.setCategoryName("");
		requestbeanObj.setRequiredRecords(maxRecords);
		requestbeanObj.setSaveReport(saveFlag);
		requestbeanObj.setZoneId(zone);
		requestbeanObj.setSubCategory(subcategory);
		requestbeanObj.setSupplierName("");
		requestbeanObj.setDepartment(department);
		requestbeanObj.setSearchCriteriaStr("");
		requestbeanObj.setFileRequired(true);
		
		
        // log.info("Request String::::::::::::"+gson.toJson(requestbeanObj));
        //////System.out.println("Request String::::::::::::"+gson.toJson(requestbeanObj));
        resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_sales_price_variation"), gson.toJson(requestbeanObj),"GET");
    	//////System.out.println("Response String:::::::::::"+resultStr);
        String responseCode = Response.getResponseCode(resultStr);
    	if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
    		  salesReportObj = gson.fromJson(resultStr,SalesReport.class); 
	
    		 
					if(salesReportObj.getFileUrl()!= null)	
						resultStr= salesReportObj.getFileUrl();
    	}
    	
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	}  catch(Exception e){
		e.printStackTrace();
	}
	return resultStr;
	
}



public List<EventInventoryTransferReport> getEventInventoryTransfer(String customerIdStr,String emailIdStr,String index,String maxRecords,String zone, String location, String category, String subcategory, String brand,String startDate,String endDate,String searchName,String salesChannel,String counterId,String billType,String locationListAll,boolean saveReport,String status){
	String resultStr = null;
	EventInventoryTransferReport inventoryTransferBean = null;
	EventInventoryTransferReport inventoryObj = new EventInventoryTransferReport();
	RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
	try{
		inventoryObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		inventoryObj.setStartIndex(index);
		inventoryObj.setMaxRecords(maxRecords);
		inventoryObj.setStartDate(startDate);
		inventoryObj.setEndDate(endDate);
		inventoryObj.setZoneId(zone);
		inventoryObj.setLocation(location);
		inventoryObj.setSearchCriteria(searchName);
		inventoryObj.setWorkflowStatus(status);
		
		inventoryObj.setStoreLocation(location);
		if(saveReport == true){
			inventoryObj.setSaveReport(true);
		}else {
			inventoryObj.setSaveReport(false);
		}
		
		//////System.out.println("Request String::::GET EVENTINV:: "+gson.toJson(inventoryObj));
		resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_eventInventorytransfer_report"), gson.toJson(inventoryObj), "GET");
		//////System.out.println("Response String::"+resultStr);
		String responseCode = Response.getResponseCode(resultStr);
		//System.err.println(responseCode);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			inventoryTransferBean = gson.fromJson(resultStr,EventInventoryTransferReport.class);
			inventoryTransferBean.getInventoryTransferList().get(0).setTotalRecords(inventoryTransferBean.getTotalRecords());
			
			if(saveReport == true){
				inventoryTransferBean.getInventoryTransferList().get(0).setURL(inventoryTransferBean.getURL());
					}
		}else {
			inventoryTransferBean = gson.fromJson(resultStr,EventInventoryTransferReport.class);
		}
		
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = (String) AppProperties.getAppMessageByProperty("INVALID_REQUEST");
	}  catch(Exception e){
	    e.printStackTrace();
	    resultStr = (String) AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
	}
	return inventoryTransferBean.getInventoryTransferList();
	
}





public ReportsBean getEventReportDetails(String customerIdStr,String emailIdStr,String index,String maxRecords,String zone, String location, String eventType, String salesPerson,String startDate,String endDate,String searchName,String status,String criteriaStr,boolean saveReport){
    String resultStr = null;
    SalesReportsBean salesReportsObj = new SalesReportsBean();
    ReportsBean  reportsObj = new ReportsBean();
    RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
    try{
            salesReportsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
            salesReportsObj.setStartIndex(index);
            salesReportsObj.setRequiredRecords(maxRecords);
            salesReportsObj.setStartDate(startDate);
            salesReportsObj.setEndDate(endDate);
            salesReportsObj.setZoneId(zone);
            salesReportsObj.setSearchBar(searchName);
            salesReportsObj.setSearchCriteria(criteriaStr);
            salesReportsObj.setStore_location(location);
            if(saveReport){
                    salesReportsObj.setSaveReport(true);
            }else {
                    salesReportsObj.setSaveReport(false);
            }
            
            //////System.out.println("Request String::::GET EVENT SummaryReport:: "+gson.toJson(salesReportsObj));
            resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_eventSales_report"), gson.toJson(salesReportsObj), "GET");
            //////System.out.println("Response String::"+resultStr);
            String responseCode = Response.getResponseCode(resultStr);
            //System.err.println(responseCode);
            if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
                    reportsObj = gson.fromJson(resultStr,ReportsBean.class);
                    reportsObj.setTotalRecords(reportsObj.getTotalRecords());
                    
                    if(saveReport){
                            reportsObj.setSalesReportFilePath(reportsObj.getSalesReportFilePath());
                                    }
            }else {
                    reportsObj = gson.fromJson(resultStr,ReportsBean.class);
            }
            
    } catch (NoSuchElementException nse) {
            nse.printStackTrace();
            resultStr = (String) AppProperties.getAppMessageByProperty("INVALID_REQUEST");
    }  catch(Exception e){
        e.printStackTrace();
        resultStr = (String) AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
    }
    return reportsObj;
    
}


public ReportsBean getEventSalesReports(String customerIdStr,String emailIdStr,String index,String maxRecords,String zone, String location, String category, String subcategory,String startDate,String endDate,String searchName,String criteriaStr,boolean saveReport){
    String resultStr = null;
    SalesReportsBean salesReportsObj = new SalesReportsBean();
    ReportsBean  reportsObj = new ReportsBean();
    RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
    try{
            salesReportsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
            salesReportsObj.setStartIndex(index);
            salesReportsObj.setRequiredRecords(maxRecords);
            salesReportsObj.setStartDate(startDate);
            salesReportsObj.setEndDate(endDate);
            salesReportsObj.setZoneId(zone);
            salesReportsObj.setSearchBar(searchName);
            salesReportsObj.setSearchCriteria(criteriaStr);
            salesReportsObj.setStore_location(location);
            
            if(saveReport){
                    salesReportsObj.setSaveReport(true);
            }else {
                    salesReportsObj.setSaveReport(false);
            }
            
            //System.out.println("Request String::::GET BillReport:: "+gson.toJson(salesReportsObj));
            resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_eventSales_report"), gson.toJson(salesReportsObj), "GET");
            //System.out.println("Response String::"+resultStr);
            String responseCode = Response.getResponseCode(resultStr);
            //System.err.println(responseCode);
            if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
                    reportsObj = gson.fromJson(resultStr,ReportsBean.class);
                    reportsObj.setTotalRecords(reportsObj.getTotalRecords());
                    reportsObj.setReportSummery(reportsObj.getReportSummery());
                    if(saveReport){
                            reportsObj.setSalesReportFilePath(reportsObj.getSalesReportFilePath());
                                    }
            }else {
                    reportsObj = gson.fromJson(resultStr,ReportsBean.class);
            }
            
    } catch (NoSuchElementException nse) {
            nse.printStackTrace();
            resultStr = (String) AppProperties.getAppMessageByProperty("INVALID_REQUEST");
    }  catch(Exception e){
        e.printStackTrace();
        resultStr = (String) AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
    }
    return reportsObj;
    
}

public String updateMcnDetails(WarehouseReport warehouseReport, String customerIdStr, String emailIdStr) {

	String resultStr = null;
	try {
		warehouseReport.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		//System.out.println("Request Update Mcn String::::::::::::"+gson.toJson(warehouseReport));
		RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
		resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_sales_credit_note"), gson.toJson(warehouseReport));
		//System.out.println("Response Update Mcn String:::::::::::"+resultStr);
		String responseCode = Response.getResponseCode(resultStr);
		
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			resultStr = Response.getResponseMessage(resultStr);
		} else {
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

//end of service...
}
