/*******************************************************************************
 * Copyright  2015 Omni Retailer Customer Console, All rights reserved.
 * Author : Sahitya
 * Created On : 20-8-2015
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

package com.tlabs.posweb.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.net.SocketTimeoutException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
//import java.util.Collection;
//import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
//import java.util.TreeMap;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.ws.rs.core.Request;

import com.tlabs.posweb.init.AppProperties;
import org.apache.log4j.Logger;
import org.json.JSONArray;
//import org.apache.poi.util.SystemOutLogger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.tlabs.posweb.beans.Billing;
import com.tlabs.posweb.beans.BillingTransactions;
import com.tlabs.posweb.beans.BillsList;
import com.tlabs.posweb.beans.Cart;
import com.tlabs.posweb.beans.CashierShortageReportBean;
import com.tlabs.posweb.beans.Department;
import com.tlabs.posweb.beans.EmployeeBean;
import com.tlabs.posweb.beans.EventInventoryTransferReport;
import com.tlabs.posweb.beans.EventMaster;
import com.tlabs.posweb.beans.LocationBean;
import com.tlabs.posweb.beans.Offer;
import com.tlabs.posweb.beans.OfferRanges;
import com.tlabs.posweb.beans.OutletReportBean;
import com.tlabs.posweb.beans.PriceChangeReportBean;
import com.tlabs.posweb.beans.ProcurementReceipt;
import com.tlabs.posweb.beans.ProductCategoryBean;
import com.tlabs.posweb.beans.ProductSubCategoryBean;
import com.tlabs.posweb.beans.PromotionSalesReport;
import com.tlabs.posweb.beans.PurchaseReportsBean;
import com.tlabs.posweb.beans.Reports;
import com.tlabs.posweb.beans.ReportsBean;
import com.tlabs.posweb.beans.ReportsRequestBean;
import com.tlabs.posweb.beans.ReportsResponse;
import com.tlabs.posweb.beans.SalesReport;
import com.tlabs.posweb.beans.SalesReportsBean;
//import com.tlabs.posweb.beans.SupplierBean;
import com.tlabs.posweb.beans.Suppliers;
import com.tlabs.posweb.beans.Tax;
import com.tlabs.posweb.beans.TenderMaster;
import com.tlabs.posweb.beans.VerificationDetails;
import com.tlabs.posweb.beans.WHStockIssueReportBean;
import com.tlabs.posweb.beans.WareHouseStockVerificationItems;
import com.tlabs.posweb.beans.WarehouseCounterResponse;
import com.tlabs.posweb.beans.WarehouseReport;
import com.tlabs.posweb.beans.XZReading;
import com.tlabs.posweb.beans.XZReportBean;
import com.tlabs.posweb.beans.XZReportsResponse;
import com.tlabs.posweb.beans.ZoneMaster;
import com.tlabs.posweb.services.AdminService;
import com.tlabs.posweb.services.DepartmentService;
import com.tlabs.posweb.services.GenericMasterService;
import com.tlabs.posweb.services.OfferService;
import com.tlabs.posweb.services.OutletMasterService;
import com.tlabs.posweb.services.ReportsService;
import com.tlabs.posweb.util.Constants;
import com.tlabs.posweb.util.DateUtil;
//import com.tlabs.posweb.util.Utilities;
//import com.tlabs.posweb.util.Utilities;
import com.tlabs.posweb.util.Response;


/**
 * @author Sahitya
 * Verified By : 
 * 
 * This controller is used to send/receive reports related data 
 */

@Controller
@RequestMapping(value = "/reports")
public class ReportsController {

	
	//private static Logger log = Logger.getLogger(ReportsController.class);
	
	private ModelAndView modelAndViewObj;
	@Autowired
	private OutletMasterService outletMasterServiceObj;
	@Autowired
	private AdminService adminServiceObj;
	@Autowired
	private ReportsService reportsServiceObj;
	@Autowired
	private GenericMasterService genericMasterServiceObj;
	@Autowired
	private DepartmentService departmentServiceObj;
	@Autowired
	private OfferService offerServiceObj;
	 @Autowired
	private Gson gson;
	/**
	 * 
	 * @author Sahitya
	 * 
	 *This method is used to display reports flows
	 *
	 **/
	@RequestMapping("/showReportsFlows")
	public ModelAndView showReportsFlows(HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("Show Reports Flows");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.setViewName("Reports/showReportsFlows");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
		}
	
	/**
	 * 
	 * @author Sahitya
	 * 
	 *This method is used to display outlet related reports flows
	 *
	 **/
	@RequestMapping("/showOutletReportsFlows")
	public ModelAndView showOutletReportsFlows(HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("Show Reports Flows");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.setViewName("Reports/OutletReports/showOutletReportsFlows");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
		}
	
	/**
	 * 
	 * @author Chaithanya.v
	 * 
	 *This method is used to display Warehouse related reports flows
	 *
	 **/
	@RequestMapping("/showWarehouseReportsFlows")
	public ModelAndView showWarehouseReportsFlows(HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("Show Reports Flows");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.setViewName("Reports/WarehouseReports/showWarehouseReportsFlows");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
		}
	/**
	 * 
	 * @author Surya.k
	 * 
	 *This method is used to display CampaignManagement related reports flows
	 *
	 **/
	
	@RequestMapping("/showCampaignManagementReportsFlows")
	public ModelAndView showCampaignManagementReportsFlows(HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("Show Reports Flows");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.setViewName("Reports/PromotionReport/showCampaignManagementReportsFlows");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
		}
	
	/**
	 * 
	 * @author vijay
	 * Created On: 20-SEPT-2017
	 * This method is used to display Customer Relationship related reports flows
	 * Reviewed by: Mr.siva
	 * Reviewed Date:
	 **/
	@RequestMapping("/showCustomerRelationshipFlows")
	public ModelAndView showCustomerRelationshipFlows(HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("Show Reports Flows - Customer RelationShip");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.setViewName("Reports/OutletReports/showCustomerRelationshipFlows");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
		}
	
	
	/**
	 * 
	 * @author vijay
	 * @CreatedOn: 20-SEPT-2017
	 * @Desc This method is used to display Customer conversion related report.
	 * @ReviewedBy: Mr.siva
	 * @ReviewedDate:
	 **/
	@RequestMapping("/viewCustomerConversionReport")
	public ModelAndView viewCustomerConversionReport(
			@RequestParam("flowUnder") String flowUnder, 
			@RequestParam("maxRecords") String maxRecords, 
			@RequestParam("index") String index,
			@RequestParam("location") String location,
			@RequestParam("zone") String zone,
			@RequestParam("startDate")String startDate,
			@RequestParam("endDate") String endDate,
			HttpServletRequest request,HttpServletResponse response)
	{
		WarehouseReport wareHouseReport = null;
		int start = 1,end = Integer.parseInt(maxRecords);
		String customerIdStr=null,emailIdStr=null;
		ArrayList<LocationBean> locationsList = null;
		// log.info("Show Reports - Customer Conversion Report");
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			if(zone == null || zone.trim().equals(""))
				locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			else
				locationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");
			//						List<String>  locationsList =(List<String>)request.getSession().getAttribute("locationsList");
			//						if(locationsList==null || locationsList.size()==0 || locationsList.isEmpty()){
			//							locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			//							request.getSession().setAttribute("locationsList", locationsList);
			//						}

			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,index,"","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			//	////////System.out.println(flowUnder);
			//web-Service call

			if(location.isEmpty() || location.trim().equals("") )
			{
				location = locationsList.get(0).getLocationId();
			}
			if(startDate == null || startDate.equals("") )
			{
				startDate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}

			wareHouseReport = reportsServiceObj.getCustomerConversionReport(index,maxRecords,zone,location,startDate,endDate);

			if(wareHouseReport == null || wareHouseReport.getReportsList() == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}

			else{
				if(wareHouseReport.getReportsList().size()<Integer.parseInt(maxRecords)){
					end = (wareHouseReport.getReportsList().size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", wareHouseReport.getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("maxRecords", maxRecords);
			modelAndViewObj.addObject("loc", location);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("startDate", startDate);
			modelAndViewObj.addObject("endDate", endDate);
			modelAndViewObj.addObject("wareHouseReport", wareHouseReport);
			modelAndViewObj.addObject("response",wareHouseReport.getResponseHeader());
			modelAndViewObj.setViewName("Reports/OutletReports/CustomerConversion");

		}
		catch(Exception exception){
			exception.printStackTrace();
			////////System.out.println(exception);
		}
		return modelAndViewObj;
	}
	
	
	
	
	/**
	 * 
	 * @author Chaithanya.v
	 * 
	 *This method is used to display Warehouse related reports flows
	 *
	 **/
	@RequestMapping("/showWastemanagmentFlows")
	public ModelAndView showWastemanagmentFlows(HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("Show Reports Flows");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.setViewName("Reports/OutletReports/showWastemanagmentFlows");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
		}
	
	
/*	Manasa.p*/
	@RequestMapping("/showShipmentsFlow")
	public ModelAndView showShipmentsFlow(HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("Show Reports Flows");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.setViewName("Reports/OutletReports/showShipmentsFlow");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
		}
	
	/**
	 * 
	 * @author Sahitya
	 * 
	 *This method is used to display sales reports flows in outlet
	 *
	 **/
	@RequestMapping("/showOutletSalesReportsFlows")
	public ModelAndView showOutletSalesReportsFlows(@RequestParam("flow") String flow,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("Show Reports Flows");
			modelAndViewObj = new ModelAndView();
			 modelAndViewObj.addObject("flowLocation",flow);
			 
			 if(flow =="warehouse" || flow.equalsIgnoreCase("warehouse")){
					modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/showwarehouseSalesReportsFlows");
 
			 }else{
			 
			modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/showOutletSalesReportsFlows");
		}
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
		}
	
	/**
	 * 
	 * @author Sahitya
	 * 
	 *This method is used to display outlet 'X' reading report GUI
	 *
	 **//*
	@RequestMapping("/viewOutletXReadingReport")
	public ModelAndView viewOutletXReadingReport(HttpServletRequest request,HttpServletResponse response){
		// log.info("View Outlet 'X' Reading Report Flows");
		List<String> workLocationsList = null,countersList = null;
		List<Integer> shiftsIdsList = null;
		String locationStr = null,customerIdStr=null,emailIdStr=null;
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			if(workLocationsList != null && workLocationsList.size()>0)
				locationStr = workLocationsList.get(0);
			countersList = reportsServiceObj.getCounters(locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
			shiftsIdsList = reportsServiceObj.getShiftsIdsList(Constants.PAGINATION_START_INDEX, customerIdStr, emailIdStr, locationStr);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("shiftsIdsList", shiftsIdsList);
			modelAndViewObj.addObject("countersList", countersList);
			modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/viewOutletXReadingReport");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
		}
	*/
	
	/**
	 * 
	 * @author Sahitya
	 * 
	 *This method is used to display counters in GUI based on provided location
	 *
	 **/
	@SuppressWarnings("null")
	@RequestMapping("/getCountersByLocation")
	public @ResponseBody List<String> getCountersByLocation(@RequestParam("location") String locationStr,@RequestParam("flow") String flow,HttpServletRequest request,HttpServletResponse response){
		List<String> countersList = null;
		String customerIdStr=null,emailIdStr=null;
		WarehouseCounterResponse counterDetails = null;
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			
			if(flow == "" || flow.equals("")){
				countersList = reportsServiceObj.getCounters(locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
				}else{
				counterDetails = adminServiceObj.getWhCounters("",locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX,false,"100");
				
				countersList= new ArrayList<String>();
				if(counterDetails.getWarehouseCountersList() != null){
					for(int i=0;i<counterDetails.getWarehouseCountersList().size();i++){
					
						countersList.add(counterDetails.getWarehouseCountersList().get(i).getCounterName());
							
					}
				}
				
				}
			
			
			
			//countersList = reportsServiceObj.getCounters(locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
		}catch(Exception e){
			e.printStackTrace();
			countersList= new ArrayList<String>();
		}
		return countersList;
	}
	
	
	
	
	@RequestMapping("/getemployeesByLocation")
	public @ResponseBody List<EmployeeBean> getemployeesByLocation(@RequestParam("location") String locationStr,HttpServletRequest request,HttpServletResponse response){
		List<String> countersList = null;
		String customerIdStr=null,emailIdStr=null;
		List<String> counterDetailslist =null;
		  ArrayList<EmployeeBean> employeeList=null;
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
            employeeList = genericMasterServiceObj.getEmployees("Cashier",customerIdStr, emailIdStr,"0",locationStr,"",false,"");
			/*String empListStr="";
			counterDetailslist = new ArrayList<String>();
			if(employeeList!=null)
				for(int i=0;i<employeeList.size();i++)
				{
					empListStr=employeeList.get(i).getFirstName(); 
				//	counterDetailslist.add(empListStr);
					//////////System.out.println(i);
				//	////////System.out.println(empList1);
				}*/
		}catch(Exception e){
			e.printStackTrace();
			countersList= new ArrayList<String>();
		}
		return employeeList;
	}
	
	
	
	@RequestMapping("/getemployeesByRole")
	public @ResponseBody List<EmployeeBean> getemployeesByRole(@RequestParam("location") String locationStr,HttpServletRequest request,HttpServletResponse response){
		List<String> countersList = null;
		String customerIdStr=null,emailIdStr=null;
		List<String> counterDetailslist =null;
		  ArrayList<EmployeeBean> employeeList=null;
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
            employeeList = genericMasterServiceObj.getemployeesByRole("Cashier",customerIdStr, emailIdStr,"0",locationStr,"",false);
			/*String empListStr="";
			counterDetailslist = new ArrayList<String>();
			if(employeeList!=null)
				for(int i=0;i<employeeList.size();i++)
				{
					empListStr=employeeList.get(i).getFirstName(); 
				//	counterDetailslist.add(empListStr);
					//////////System.out.println(i);
				//	////////System.out.println(empList1);
				}*/
		}catch(Exception e){
			e.printStackTrace();
			countersList= new ArrayList<String>();
		}
		return employeeList;
	}
	
	/**
	 * 
	 * @author Sahitya
	 * 
	 *This method is used to display shifts in GUI based on provided location
	 *
	 **/
	@RequestMapping("/getShiftsByLocation")
	public @ResponseBody List<Integer> getShiftsByLocation(@RequestParam("location") String locationStr,HttpServletRequest request,HttpServletResponse response){
		List<Integer> shiftsList = null;
		String customerIdStr=null,emailIdStr=null;
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			shiftsList = reportsServiceObj.getShiftsIdsList(Constants.PAGINATION_START_INDEX,customerIdStr,emailIdStr,locationStr);
		}catch(Exception e){
			e.printStackTrace();
			shiftsList= new ArrayList<Integer>();
		}
		return shiftsList;
	}
	
	/**
	 * 
	 * @author Sahitya
	 * 
	 *This method is used to generate report & send to GUI based on provided location,counter,shift & date
	 *
	 **/
	@RequestMapping("/generateOutletXReport")
	public ModelAndView generateOutletXReport(
			@RequestParam("location") String storeLocationStr,
			@RequestParam("counter") String counterIdStr,
			@RequestParam("shiftId") String shiftIdStr,
			@RequestParam("date") String date,
			@RequestParam("saveFlag") boolean saveFlag,
			@RequestParam("maxRecords") String maxRecords,
			@RequestParam("zone") String zone,
			@RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate,
			@RequestParam("outletLocation") String outletLocation,
			@RequestParam("flowLocation") String flowLocation,
			
			HttpServletRequest request,HttpServletResponse response){
		ReportsResponse xReportResponseObj = null;
		String customerIdStr=null,emailIdStr=null;
		boolean saveReportFlag=false;
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			if(request.getParameter("saveReportFlag")=="true")
				saveReportFlag=true;
			xReportResponseObj = reportsServiceObj.getOutletXReport(saveReportFlag,customerIdStr, emailIdStr, storeLocationStr,counterIdStr,saveFlag, shiftIdStr,date);
			modelAndViewObj = new ModelAndView();
			if(saveFlag){
				if(xReportResponseObj.getReportFilePath()!=null)
				modelAndViewObj.addObject("downloadurl",xReportResponseObj.getReportFilePath());
		   // log.info(xReportResponseObj.getReportFilePath());
			}
			modelAndViewObj.addObject("selectedlocation",storeLocationStr);
//			////////System.out.println("location"+storeLocationStr);
			modelAndViewObj.addObject("counter",counterIdStr);
			modelAndViewObj.addObject("shiftId",shiftIdStr);
			modelAndViewObj.addObject("date",date);
			modelAndViewObj.addObject("zone",zone);
			modelAndViewObj.addObject("maxRecords", maxRecords);
			modelAndViewObj.addObject("startdate", startDate);
			modelAndViewObj.addObject("endDate", endDate);
			modelAndViewObj.addObject("outletLocation", outletLocation);
			modelAndViewObj.addObject("xReportResponseObj",xReportResponseObj);
			modelAndViewObj.addObject("flowLocation",flowLocation);
			modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/viewOutletXReadingReport");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
		
	}
	
	/**
	 * 
	 * @author Sahitya
	 * 
	 *This method is used to display outlet 'Z' reading report GUI
	 *
	 **//*
	@RequestMapping("/viewOutletZReadingReport")
	public ModelAndView viewOutletZReadingReport(HttpServletRequest request,HttpServletResponse response){
		// log.info("View Outlet 'Z' Reading Report Flows");
		List<String> workLocationsList = null,countersList = null;
		String locationStr = null,customerIdStr=null,emailIdStr=null;
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			if(workLocationsList != null && workLocationsList.size()>0)
				locationStr = workLocationsList.get(0);
			countersList = reportsServiceObj.getCounters(locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("countersList", countersList);
			modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/viewOutletZReadingReport");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
		}
	*/
	/**
	 * 
	 * @author Sahitya
	 * 
	 *This method is used to display outlet 'Z' reading report GUI
	 *
	 **/
	@RequestMapping("/viewOutletXZReadingReport")
	public ModelAndView viewOutletXZReadingReport(HttpServletRequest request,HttpServletResponse response){
		// log.info("View Outlet 'XZ' Reading Report Flows");
		List<String> workLocationsList = null,countersList = null;
		String locationStr = null,customerIdStr=null,emailIdStr=null;
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			if(workLocationsList != null && workLocationsList.size()>0)
			locationStr = workLocationsList.get(0);
			countersList = reportsServiceObj.getCounters(locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("countersList", countersList);
			
			modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/viewOutletXZReadingReport");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
		}
	
	/**
	 * 
	 * @author Sahitya
	 * 
	 *This method is used to generate report & send to GUI based on provided location,counter,shift & date
	 *
	 **/
	@RequestMapping("/generateOutletZReport")
	public ModelAndView generateOutletZReport(
			@RequestParam("location") String storeLocationStr,
			@RequestParam("counter") String counterIdStr,
			@RequestParam("date") String date,
			@RequestParam("endDate") String endDate,
			@RequestParam("saveFlag") boolean saveFlag,
			@RequestParam("maxRecords") String maxRecords,
			@RequestParam("zone") String zone,
			@RequestParam("startDate") String startDate,
			@RequestParam("outletLocation") String outletLocation,
			@RequestParam("flowLocation") String flowLocation,
			HttpServletRequest request,HttpServletResponse response){
		XZReportsResponse zReportResponseObj = null;
		String customerIdStr=null,emailIdStr=null;
		Set<String> tenders = new LinkedHashSet<String>();
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			zReportResponseObj = reportsServiceObj.getOutletZReport(customerIdStr, emailIdStr, storeLocationStr, counterIdStr,date,endDate,saveFlag);
			
			ArrayList<TenderMaster> tenderDetails = genericMasterServiceObj.getTender("",customerIdStr,emailIdStr,"-1",100);
			
			for(int i=0;i<tenderDetails.size();i++)
			{
				tenders.add(tenderDetails.get(i).getModeOfPayment());
			}

			////System.out.println("get_tender_details:::::::" + gson.toJson(tenders));
			////System.out.println("get_tender_details2:::::::" + gson.toJson(tenderDetails));
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("zReportResponseObj",zReportResponseObj);
			modelAndViewObj.addObject("selectedlocation",storeLocationStr);
			modelAndViewObj.addObject("counter",counterIdStr);
			modelAndViewObj.addObject("date",date);
			
			modelAndViewObj.addObject("zone",zone);
			modelAndViewObj.addObject("maxRecords", maxRecords);
			modelAndViewObj.addObject("startdate", startDate);
			modelAndViewObj.addObject("endDate", endDate);
			modelAndViewObj.addObject("outletLocation", outletLocation);
			modelAndViewObj.addObject("tenderDetails",tenderDetails);
			modelAndViewObj.addObject("allTenders",tenderDetails);
			modelAndViewObj.addObject("flowLocation",flowLocation);
			
			modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/viewOutletZReadingReport");
			if(saveFlag){
				if(zReportResponseObj.getReportFilePath()!=null)
				modelAndViewObj.addObject("downloadurl",zReportResponseObj.getReportFilePath());
		   // log.info(zReportResponseObj.getReportFilePath());
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
		
	}
	
	/**
	 * 
	 * @author Sahitya
	 * 
	 *This method is used to generate report & send to GUI based on provided location,counter,shift & date
	 *
	 **/
	@RequestMapping("/generateOutletXZReport")
	public ModelAndView generateOutletXZReport(@RequestParam("location") String storeLocationStr,@RequestParam("date") String date,HttpServletRequest request,HttpServletResponse response){
		XZReportsResponse xzReportResponseObj = null;
		String customerIdStr=null,emailIdStr=null;
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			xzReportResponseObj = reportsServiceObj.getOutletXZReport(customerIdStr, emailIdStr, storeLocationStr,date);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("xzReportResponseObj",xzReportResponseObj);
			modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/showXZReport");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
		
	}
	
	

	@SuppressWarnings("unchecked")
	@RequestMapping("/viewOutletProfitabilityReport")
	public ModelAndView viewOutletProfitabilityReport(@RequestParam("flag") boolean flag,@RequestParam("section") String section,@RequestParam("supplierId") String supplierId,@RequestParam("subcategory") String subcategory,@RequestParam("brand") String brand,@RequestParam("startdate") String startdate,@RequestParam("enddate") String enddate,@RequestParam("zone") String zone,@RequestParam("productCategory") String productCategory,@RequestParam("location") String location,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,HttpServletRequest request,HttpServletResponse response){
//		ArrayList<LocationBean> locationsList = null;
		String customerIdStr = null,emailIdStr=null;
		try{
  			// log.info("viewOutletNotifications ");
  			customerIdStr = (String)request.getSession().getAttribute("customerId");
  			emailIdStr  = (String)request.getSession().getAttribute("emailId");
  			int start = 1,end = Integer.parseInt(maxRecords);
  			WarehouseReport  warehousereport = new WarehouseReport();
  			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, "", "",index,"","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
			if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
				categoryList = outletMasterServiceObj.getCategoryDetails("","", "","-1");
				request.getSession().setAttribute("categoryList", categoryList);
			}
			List<ProductSubCategoryBean> subCategoryDetailsList =(List<ProductSubCategoryBean>)request.getSession().getAttribute("subCategoryDetailsList");
			if(subCategoryDetailsList==null || subCategoryDetailsList.size()==0 || subCategoryDetailsList.isEmpty()){
				subCategoryDetailsList = outletMasterServiceObj.getSubCategoryDetails("","", "","-1","",false);
				request.getSession().setAttribute("subCategoryDetailsList", subCategoryDetailsList);
			}
			List<String> brandsList =(List<String>)request.getSession().getAttribute("brandsList");
			if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
				brandsList = adminServiceObj.getBrandNamesList("","");
				request.getSession().setAttribute("brandsList", brandsList);
			}
			List<Suppliers> supplierList =(List<Suppliers>)request.getSession().getAttribute("supplierList");
			if(supplierList==null || supplierList.size()==0 || supplierList.isEmpty()){
				 supplierList = outletMasterServiceObj.getSuppliers("", "","-1","","");
				request.getSession().setAttribute("supplierList", supplierList);
			}
			
//			workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
//			locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
//			ArrayList<LocationBean> locationsList =(ArrayList<LocationBean>)request.getSession().getAttribute("locationsList");
//			if(locationsList==null || locationsList.size()==0 || locationsList.isEmpty()){
			
			ArrayList<LocationBean>	locationsList = new ArrayList<LocationBean>();
			if(zone == null || zone.trim().equals(""))
				locationsList =genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			else
				locationsList =genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");
			/*request.getSession().setAttribute("locationsList", locationsList);
			}
			*/
			
			
//			Added by vijay, to make default loaction as location list first occurrence, if location is empty
//			if(locationsList != null || (location.trim()).equals("") || location.trim().isEmpty())
//			{
//				location = locationsList.get(0).getLocationId();
//			} 
//			
			if(startdate == null || startdate.equals("") )
			{
				startdate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy"); 
			}
			
  			warehousereport  = reportsServiceObj.getProfitabilityReport(index,maxRecords,zone,location,productCategory,subcategory,brand,startdate,enddate,searchNameStr,supplierId,flag,section);

  			modelAndViewObj = new ModelAndView();
  			if(warehousereport == null || warehousereport.getReportsList() == null){
  				modelAndViewObj.addObject("totalRecords","0");
  				modelAndViewObj.addObject("index", "0");
  				modelAndViewObj.addObject("totalValue", "0");
  			}else{
  				if(warehousereport.getReportsList().size()<Integer.parseInt(maxRecords)){
  					end = (warehousereport.getReportsList().size())+(Integer.parseInt(index));
  				}else{
  					end = (Integer.parseInt(index)+end);
  				}
  				modelAndViewObj.addObject("totalRecords", warehousereport.getTotalRecords());
  				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
  				modelAndViewObj.addObject("totalValue", end);
  			}
  			modelAndViewObj.addObject("startdate", startdate);
			modelAndViewObj.addObject("enddate", enddate);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("category", productCategory);
			modelAndViewObj.addObject("subcategory", subcategory);
			modelAndViewObj.addObject("brand", brand);
			modelAndViewObj.addObject("section", section);
			modelAndViewObj.addObject("maxRecords", maxRecords);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("supplierId", supplierId);
			if(flag)
			{
				if(warehousereport.getSalesReportFilePath()!=null)
				modelAndViewObj.addObject("downloadurl", warehousereport.getSalesReportFilePath());
			}
  			modelAndViewObj.addObject("warehousereport", warehousereport);
  			modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/profitabilityReport");
  		}
  		catch(Exception exception){
  			exception.printStackTrace();
  		}
  		return modelAndViewObj;
  	}
	
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/viewDsrReport")
	public ModelAndView viewDsrReport(@RequestParam("type") String type,@RequestParam("flag") boolean flag,@RequestParam("section") String section,@RequestParam("supplierId") String supplierId,@RequestParam("subcategory") String subcategory,@RequestParam("brand") String brand,@RequestParam("startdate") String startdate,@RequestParam("enddate") String enddate,@RequestParam("zone") String zone,@RequestParam("productCategory") String productCategory,@RequestParam("location") String location,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,HttpServletRequest request,HttpServletResponse response){
		String customerIdStr = null,emailIdStr=null;
     ArrayList<LocationBean> locationsList = null;
		try{
  			// log.info("viewOutletNotifications ");
  			customerIdStr = (String)request.getSession().getAttribute("customerId");
  			emailIdStr  = (String)request.getSession().getAttribute("emailId");
  			int start = 1,end = Integer.parseInt(maxRecords);
  			Map<String,WarehouseReport> mapDet;
				Set<String> labels = new LinkedHashSet<String>();
  			WarehouseReport  warehousereport = new WarehouseReport();
  			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, "", "",index,"","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
			if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
				categoryList = outletMasterServiceObj.getCategoryDetails("","", "","-1");
				request.getSession().setAttribute("categoryList", categoryList);
			}
			List<ProductSubCategoryBean> subCategoryDetailsList =(List<ProductSubCategoryBean>)request.getSession().getAttribute("subCategoryDetailsList");
			if(subCategoryDetailsList==null || subCategoryDetailsList.size()==0 || subCategoryDetailsList.isEmpty()){
				subCategoryDetailsList = outletMasterServiceObj.getSubCategoryDetails("","", "","-1","",false);
				request.getSession().setAttribute("subCategoryDetailsList", subCategoryDetailsList);
			}
			List<String> brandsList =(List<String>)request.getSession().getAttribute("brandsList");
			if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
				brandsList = adminServiceObj.getBrandNamesList("","");
				request.getSession().setAttribute("brandsList", brandsList);
			}
			List<Suppliers> supplierList =(List<Suppliers>)request.getSession().getAttribute("supplierList");
			if(supplierList==null || supplierList.size()==0 || supplierList.isEmpty()){
				 supplierList = outletMasterServiceObj.getSuppliers("", "","-1","","");
				request.getSession().setAttribute("supplierList", supplierList);
			}
			if(zone == null || zone.trim().equals(""))
				locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			else
				locationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");
//			List<String> locationsList =(List<String>)request.getSession().getAttribute("locationsList");
//			if(locationsList==null || locationsList.size()==0 || locationsList.isEmpty()){
//				 locationsList = adminServiceObj.getOutletLocationsList("","",true);
//				request.getSession().setAttribute("locationsList", locationsList);
//			}
			
//			Added by vijay, to make default location as location list first occurrence, if location is empty
			if((location.trim()).equals("") || location.trim().isEmpty())
			{
				if(!type.equalsIgnoreCase("DSR"))
				location = locationsList.get(0).getLocationId();
			}
			if(startdate == null || startdate.equals("") )
			{
				startdate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			
  			warehousereport  = reportsServiceObj.getDsrReport(index,maxRecords,zone,location,productCategory,subcategory,brand,startdate,enddate,searchNameStr,supplierId,flag,section,type);

  			modelAndViewObj = new ModelAndView();
  			if(warehousereport == null || warehousereport.getReportsList() == null){
  				modelAndViewObj.addObject("totalRecords","0");
  				modelAndViewObj.addObject("index", "0");
  				modelAndViewObj.addObject("totalValue", "0");
  			}else{
  				
  				for (WarehouseReport report : warehousereport.getReportsList()) {
  					
  					if(!type.equalsIgnoreCase("DSR")){
  					mapDet = report.getMapDet();
  					/*TreeMap<String,String>mapSorted = new TreeMap<>(mapSportsPersonality);*/
  					//Collections.sort((List<String>) mapDet);
  					labels.addAll(mapDet.keySet());
  					}
				}
  				
  				if(warehousereport.getReportsList().size()<Integer.parseInt(maxRecords)){
  					end = (warehousereport.getReportsList().size())+(Integer.parseInt(index));
  				}else{
  					end = (Integer.parseInt(index)+end);
  				}
  				modelAndViewObj.addObject("totalRecords", warehousereport.getTotalRecords());
  				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
  				modelAndViewObj.addObject("totalValue", end);
  			}
  			modelAndViewObj.addObject("startdate", startdate);
			modelAndViewObj.addObject("enddate", enddate);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("category", productCategory);
			modelAndViewObj.addObject("subcategory", subcategory);
			modelAndViewObj.addObject("brand", brand);
			modelAndViewObj.addObject("section", section);
			modelAndViewObj.addObject("maxRecords", maxRecords);
			modelAndViewObj.addObject("supplierId", supplierId);
			modelAndViewObj.addObject("labels", labels);
			modelAndViewObj.addObject("type", type);
			if(flag)
			{
				if(warehousereport.getSalesReportFilePath()!=null)
				modelAndViewObj.addObject("downloadurl", warehousereport.getSalesReportFilePath());
			}
  			modelAndViewObj.addObject("warehousereport", warehousereport);
  			modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/dsrReport");
  		}
  		catch(Exception exception){
  			exception.printStackTrace();
  		}
  		return modelAndViewObj;
  	}
	
	
	/**
	 * 
	 *@author vijay kumar
	 *written on 06/09/2017 11:55AM
	 *This method is used to display dump report.
	 *
	 *
	 **/
	@RequestMapping("/viewOutletDumpReport")
	public ModelAndView viewOutletDumpReport(
			@RequestParam("locationList") String locationList,
			@RequestParam("flowUnder") String flowUnder, 
			@RequestParam("maxRecords") String maxRecords, 
			@RequestParam("index") String index, 
			@RequestParam("saveFlag") boolean saveFlag,
			@RequestParam("brand") String brand,
			@RequestParam("section") String section,
			@RequestParam("subDepartment") String subDepartment, 
			@RequestParam("location") String location,
			@RequestParam("zone") String zone,
			@RequestParam("startDate")String startDate,
			@RequestParam("endDate") String endDate, 
			@RequestParam("category") String category, 
			@RequestParam("subCategory") String subCategory,			
			@RequestParam("department") String department, 
			@RequestParam("searchName") String searchName,
			HttpServletRequest request,HttpServletResponse response)
			{
		 List<WareHouseStockVerificationItems> stockVerificationDetailsList = null;
			
		String locationListAll ="";
			String customerIdStr=null,emailIdStr=null;
        ArrayList<LocationBean> locationsList = null;
        
			// log.info("Show Reports - Dump Report");
			try{
				customerIdStr = (String)request.getSession().getAttribute("customerId");
				emailIdStr = (String)request.getSession().getAttribute("emailId");
				modelAndViewObj = new ModelAndView();
				if(zone == null || zone.trim().equals(""))
					locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
				else
					locationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");
//				List<String>  locationsList =(List<String>)request.getSession().getAttribute("locationsList");
//				if(locationsList==null || locationsList.size()==0 || locationsList.isEmpty()){
//					locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
//					request.getSession().setAttribute("locationsList", locationsList);
//				}
				
				
				
				
				List<String> locationsListValue=new ArrayList<String>();
	  			
	  	  		
	  			if(location.equals("all")|| location.equals("")){
					if(locationsList != null){
						if(zone ==""){
							for(int i=0;i<locationsList.size();i++){
								locationsListValue.add(locationsList.get(i).getLocationId());
									
							}
							}
							else
							{
								locationsListValue.add(locationList);
							}
					/*	for(int i=0;i<workLocationsList.size();i++){
							locationsListValue.add(workLocationsList.get(i).getLocationId());
								
						}*/
						for (String string : locationsListValue) {
							
							locationListAll = locationListAll+string+",";
						}
					}
					
				}
				
				

				List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
				if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
					 zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,index,"","");
					request.getSession().setAttribute("zoneList", zoneList);
				}
				List<Department> departmentList =(List<Department>)request.getSession().getAttribute("departmentList");
				if(departmentList==null || departmentList.size()==0 || departmentList.isEmpty()){
					departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerIdStr, emailIdStr,index,false);
					request.getSession().setAttribute("departmentList", departmentList);
				}
				
				List<String> subdepartmentList =(List<String>)request.getSession().getAttribute("subdepartmentList");
				if(subdepartmentList==null || subdepartmentList.size()==0 || subdepartmentList.isEmpty()){
					subdepartmentList = departmentServiceObj.getSubDepartmentsList(null, customerIdStr, emailIdStr);
					request.getSession().setAttribute("subdepartmentList", subdepartmentList);
				}
				
				List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
				if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
					categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
					request.getSession().setAttribute("categoryList", categoryList);
				}
				List<ProductSubCategoryBean> subCategoryDetailsList =(List<ProductSubCategoryBean>)request.getSession().getAttribute("subCategoryDetailsList");
				if(subCategoryDetailsList==null || subCategoryDetailsList.size()==0 || subCategoryDetailsList.isEmpty()){
					subCategoryDetailsList = outletMasterServiceObj.getSubCategoryDetails("",customerIdStr, emailIdStr,"-1","",false);
					request.getSession().setAttribute("subCategoryDetailsList", subCategoryDetailsList);
				}
				
//				Added by vijay, to make default loaction as location list first occurrence, if location is empty
			/*	if((location.trim()).equals(null) || location.trim().isEmpty())
				{
					location = locationsList.get(0).getLocationId();
				}
			*/	
				if(startDate == null || startDate.equals("") )
				{
					startDate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
				}
				
				
					modelAndViewObj = new ModelAndView();
					stockVerificationDetailsList= reportsServiceObj.getDumpReport(index,maxRecords,brand,zone,category,subCategory,department,subDepartment,section,location,startDate,endDate,searchName,saveFlag,locationListAll);
					int start = 1,end = Integer.parseInt(maxRecords);
					if(stockVerificationDetailsList == null||stockVerificationDetailsList.size()==0)
					{
						modelAndViewObj.addObject("totalRecords","0");
						modelAndViewObj.addObject("index", "0");
						modelAndViewObj.addObject("totalValue", "0");
					}
					else
					{
						if(stockVerificationDetailsList.size()<Integer.parseInt(maxRecords)){
							end = (stockVerificationDetailsList.size())+(Integer.parseInt(index));
						}else{
							end = (Integer.parseInt(index)+end);
						}
						modelAndViewObj.addObject("totalRecords", stockVerificationDetailsList.get(0).getTotalRecords());
						modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
						modelAndViewObj.addObject("totalValue",end );
					}
					
					modelAndViewObj.addObject("WarehouseReportObj", stockVerificationDetailsList);
					modelAndViewObj.addObject("maxRecords", maxRecords);
					modelAndViewObj.addObject("brand", brand);
					modelAndViewObj.addObject("section", section);
					modelAndViewObj.addObject("loc", location);
					modelAndViewObj.addObject("locationsList", locationsList);
					modelAndViewObj.addObject("subDepartment", subDepartment);
					modelAndViewObj.addObject("zone", zone);
					modelAndViewObj.addObject("startDate", startDate);
					modelAndViewObj.addObject("endDate", endDate);	
					modelAndViewObj.addObject("category", category);
					modelAndViewObj.addObject("subCategory", subCategory);	
					modelAndViewObj.addObject("department", department);
					modelAndViewObj.addObject("searchName", searchName);
					if(saveFlag){
						if(stockVerificationDetailsList.get(0).getSalesReportFilePath() != null)
					modelAndViewObj.addObject("downloadurl",stockVerificationDetailsList.get(0).getSalesReportFilePath());
						// log.info(stockVerificationDetailsList.get(0).getSalesReportFilePath());
				}
					modelAndViewObj.setViewName("Reports/OutletReports/DumpReport");
				}
			
			catch(Exception exception){
				////////System.out.println(exception);
			}
		return modelAndViewObj;
	  	}
	
	/**
	 * 
	 *@author: vijay
	 *@written: on 05/01/2018
	 *@Description: This method is used to display viewTenderWiseReport.
	 *@ReviewedBy:
	 *@ReviewedDate:
	 *@PassingParameters : maxRecords, index, SearchCriteria
	 *
	 **/
	@RequestMapping("/viewTenderWise")
	public ModelAndView viewTenderWise(
			@RequestParam("maxRecords") String maxRecords,
			@RequestParam("index") String index,
			@RequestParam("searchCriteria") String searchCriteria,	
			@RequestParam("location") String location,	
			@RequestParam("zone") String zone,
			@RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate,@RequestParam("flow") String flow,
			
			HttpServletRequest request,HttpServletResponse response){
		modelAndViewObj = new ModelAndView();
		Map<String,Object> mapDet;
		
		int start = 1,end = Integer.parseInt(maxRecords),totalValue = 0;
		List<String> labels = new ArrayList<String>();
		WarehouseReport tenderReport = null;
		try
		{
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();

			ArrayList<LocationBean> worklocationsList = new ArrayList<LocationBean>(); //genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);

			if(zone == null || zone.trim().equals("")){
				if(flow == "" || flow.equals("")){
					worklocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
					}else{
						worklocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
					}
			}else{
				if(flow == "" || flow.equals("")){
					worklocationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");
				}else{
					worklocationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Warehouse");

				}
			}
		/*if(location.equals(""))
		{
			location = worklocationsList.get(0).getLocationId();
		}*/
		
		
		
		if(startDate == null || startDate.equals("") )
		{
			startDate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
		}
		if(endDate == null || endDate.equals("") ){
			endDate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
		}
		
			
		tenderReport  = reportsServiceObj.getTenderWiseReports(maxRecords,index,location,zone,startDate,endDate);
		if(tenderReport.getDayWiseReport() == null || tenderReport.getDayWiseReport().size() <= 0)
			{
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}
			else{
				mapDet = tenderReport.getDayWiseReport();
  				for (Map.Entry<String,Object> entry : mapDet.entrySet()) 
				 {
					 labels.add(entry.getKey());
				 }
				
//  				////////System.out.println(tenderReport.getDayWiseReport().size());
  				
  				start = Integer.parseInt(index)+start;
  				totalValue = Integer.parseInt(maxRecords) + Integer.parseInt(index);
  				if(tenderReport.getTotalRecords() < totalValue)
  					totalValue = tenderReport.getTotalRecords();
  				
  				//////////System.out.println(totalValue);
				modelAndViewObj.addObject("totalRecords", tenderReport.getTotalRecords());
				modelAndViewObj.addObject("index", start);
				modelAndViewObj.addObject("totalValue", totalValue);
				modelAndViewObj.addObject("maxRecords",maxRecords); 
			}
		modelAndViewObj.addObject("workLocationsList", worklocationsList);
		modelAndViewObj.addObject("labels", labels);
		modelAndViewObj.addObject("startDate", startDate);
		modelAndViewObj.addObject("endDate", endDate);
		modelAndViewObj.addObject("selectedLocation", location);
		modelAndViewObj.addObject("zone", zone);
		modelAndViewObj.addObject("flowLocation", flow);
		modelAndViewObj.addObject("tenderWiseReport", tenderReport.getDayWiseReport());
		modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/viewTenderWiseReports");
		}
  		catch(Exception exception){
  			exception.printStackTrace();
  		}
		return modelAndViewObj;
		
  	}
	
	@RequestMapping("/viewSalesReportsCriteriaWise")
	public ModelAndView viewSalesReportsCriteriaWise(@RequestParam("criteria")String criteria,@RequestParam("startDate") String startDateStr,SalesReport salesReport,@RequestParam("endDate") String endDateStr,@RequestParam("location") String locationStr,@RequestParam("counterName") String counterName,@RequestParam("zone") String zoneStr,@RequestParam("maxRecords") String maxRecords,@RequestParam("isHourWiseReport") String isHourWiseReport,@RequestParam("mytime") String mytime,@RequestParam("mytime1") String mytime1,@RequestParam("flow") String flow, HttpServletRequest request,HttpServletResponse response){
		// log.info("viewSalesReportsCriteriaWise");
		List<String> countersList = null;
		ArrayList<LocationBean> workLocationsList = null;
		String /*locationStr = null*/customerIdStr=null,emailIdStr=null;
		String locationListAll = "";
		WarehouseCounterResponse counterDetails = null;
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
//			workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			//////////System.out.println(locationStr);
			//locationStr = (String)request.getSession().getAttribute("selectedLocation");
			/*if(locationStr == null && workLocationsList != null && workLocationsList.size() > 0)
				locationStr = workLocationsList.get(0);*/
			
			//workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			

			if(zoneStr == null || zoneStr.trim().equals("")){
				if(flow == "" || flow.equals("")){
					workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
					}else{
						workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
					}
				
				//workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			}else{
				if(flow == "" || flow.equals("")){
					workLocationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zoneStr, customerIdStr, emailIdStr, "Retail Outlet");

				}else{
				workLocationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zoneStr, customerIdStr, emailIdStr, "Warehouse");
				}
				}
//			workLocationsList = Utilities.getLocationsOnZone(zoneStr, customerIdStr, emailIdStr, "Retail Outlet");
			
			List<String> locationsListValue=new ArrayList<String>();
			//added by manasa
			if(criteria.equals("date") || criteria.equals("counter") || criteria.equals("hour") || criteria.equals("skuSales") || criteria.equals("Department") || criteria.equals("Brand"))
			{
				endDateStr = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			else
			{
				endDateStr="";
			}
			
			if(criteria.equals("date") ||  criteria.equals("counter") || criteria.equals("skuSales") || criteria.equals("Department")){
			if(locationStr == "" || locationStr.equals("all")){
				if(workLocationsList != null){
					for(int i=0;i<workLocationsList.size();i++){
					
						locationsListValue.add(workLocationsList.get(i).getLocationId());
							
					}
				for (String string : locationsListValue) {
					
					locationListAll = locationListAll+string+",";
				}
				}
			}
			else
			{
				locationStr=salesReport.getLocation();
			}
			}
			else
			{
				
			if((locationStr==null  || locationStr=="" || locationStr.equals("all")) && workLocationsList.size()>0){
				//////////System.out.println("location");
//				locationStr = (String)request.getSession().getAttribute("selectedLocation");
				if(criteria.equals("supplier")){
					locationStr = "";
			} else {
			locationStr = workLocationsList.get(0).getLocationId();
			}
				}
			else{
				//if(criteria.equals("date"))
					locationStr=salesReport.getLocation();
				}
			}
			
			/*		else
			{
//				locationStr = (String)request.getSession().getAttribute("selectedLocation");
				if( workLocationsList.size()>0)
				locationStr = workLocationsList.get(0);
			}*/
			/*if(startDateStr.equals(null) || startDateStr.trim().equals("") )
			{*/
				startDateStr = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
//				////////System.out.println(startDateStr);

//			}
			
				if(flow == "" || flow.equals("")){
					countersList = reportsServiceObj.getCounters(locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
					}else{
					counterDetails = adminServiceObj.getWhCounters("",locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX,false,"100");
					}
				
			//countersList = reportsServiceObj.getCounters(locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
		
//			ArrayList<EmployeeBean> employeeList = genericMasterServiceObj.getEmployees(null,customerIdStr, emailIdStr,"0",locationStr,"",false);
			ArrayList<EmployeeBean>	 employeeList = genericMasterServiceObj.getemployeesByRole("Cashier",customerIdStr, emailIdStr,"0",locationStr,"",false);
			String empListStr="";
			List<String> counterDetailslist = new ArrayList<String>();
			if(employeeList!=null)
				for(int i=0;i<employeeList.size();i++)
				{
					empListStr=employeeList.get(i).getFirstName(); 
					counterDetailslist.add(empListStr);
					//////////System.out.println(i);
				    //////////System.out.println(empList1);
				}
			
			
			modelAndViewObj.addObject("employeeList", counterDetailslist);
			String counterId = null;
			/*if(countersList != null && countersList.size()>0 && criteria.equals("counter"))
				counterId = countersList.get(0);*/
			
			//modified by manasa
			if(countersList != null && countersList.size()>0 && criteria.equals("counter"))
				counterId=counterName;
			else
			counterId = "";
//			String subCategoriesStr = masterServiceObj.getCategories(customerIdStr,emailIdStr);
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, "", "","-1","","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
			if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
				categoryList = outletMasterServiceObj.getCategoryDetails("","", "","-1");
				request.getSession().setAttribute("categoryList", categoryList);
			}
			List<Department> departmentList =(List<Department>)request.getSession().getAttribute("departmentList");
			if(departmentList==null || departmentList.size()==0 || departmentList.isEmpty()){
				departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerIdStr, emailIdStr,"-1",false);
				request.getSession().setAttribute("departmentList", departmentList);
			}
			List<String> brandsList =(List<String>)request.getSession().getAttribute("brandsList");
			if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
				brandsList = adminServiceObj.getBrandNamesList("","");
				request.getSession().setAttribute("brandsList", brandsList);
			}
			//List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
			ArrayList<String> categoriesList = new ArrayList<String>();
			if(categoryList != null)
				for(ProductCategoryBean productCategoryBean : categoryList)
					categoriesList.add(productCategoryBean.getCategoryDescription());
//			ArrayList<String> categoriesList = masterServiceObj.getCategoriesList(subCategoriesStr);
			String categoryStr = "";
			/*if(categoryList != null && categoryList.size()>0 && criteria.equals("category"))
				categoryStr = categoryList.get(0).getCategoryName();*/
			
			
			if(criteria.equals("hour")){
				
				if(isHourWiseReport.equals("true")){	
					
					SimpleDateFormat fromUser = new SimpleDateFormat("dd/MM/yyyy");
					SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-MM-dd");

					    String reformattedStr = myFormat.format(fromUser.parse(startDateStr));
					    String reformattedStr1 = myFormat.format(fromUser.parse(endDateStr));
					
					    startDateStr=reformattedStr;
					    endDateStr= reformattedStr1;
					
				startDateStr=startDateStr+" "+mytime;
				endDateStr=endDateStr+" "+mytime1;
		}
		}
			
			
			
			List<SalesReport> salesReportList = reportsServiceObj.generateSalesReportCriteriaWise(customerIdStr, emailIdStr,locationStr,startDateStr, endDateStr,maxRecords,criteria,"0",null,null, false,counterId,categoryStr,zoneStr,"","","","","","",locationListAll,"",isHourWiseReport);
			
			if(criteria.equals("skuSales") || criteria.equals("date")){
			if(salesReportList != null && salesReportList.size()>0 && salesReportList.get(0).getResponseHeader() != null && !salesReportList.get(0).getResponseHeader().getResponseCode().equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				if(!salesReportList.get(0).getResponseHeader().getResponseMessage().trim().equalsIgnoreCase("No Records Found"))
				modelAndViewObj.addObject("errorMsg",salesReportList.get(0).getResponseHeader().getResponseMessage());
				salesReportList=null;
			}
			}
			
			int start = 1,end = Integer.parseInt(maxRecords);
			if(salesReportList == null || salesReportList.size() == 0)
			{
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}
			else
			{
				if(salesReportList.size()<end)
				{
					end = (salesReportList.size());
					if(criteria.equals("tax")){
						if(salesReportList.get(0).getTaxWiseReport().containsKey("Date")){
							List<String> dateValuesList=salesReportList.get(0).getTaxWiseReport().get("Date");
							end = dateValuesList.size();
					}
					}
				}
				modelAndViewObj.addObject("totalRecords", salesReportList.get(0).getTotalRecords());
				modelAndViewObj.addObject("index", start);
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("reportSummary", salesReportList.get(0).getReportSummery());
				 if(criteria.equals("skuSales"))
				 {
						modelAndViewObj.addObject("totalSoldQty", salesReportList.get(0).getTotalSoldQty());
						modelAndViewObj.addObject("totalSoldValue", salesReportList.get(0).getTotalSoldValue()); 
				 }
			
				modelAndViewObj.addObject("categorySummery", salesReportList.get(0).getCategorySummery());
				Map<String,List<String>> m=new LinkedHashMap<String, List<String>>();
				if(salesReportList.get(0).getTaxWiseReport()!=null)
				 for(Entry<String, List<String>> entry:salesReportList.get(0).getTaxWiseReport().entrySet())
				  {
					// ////////System.out.println("the keys are :"+entry.getKey());
					  if(entry.getKey().equals(""))
					  {
					  } else {
					  m.put(entry.getKey(),entry.getValue());
					  //List<String> l[i]=new ArrayList<String>();
					  }
				  }
				 salesReportList.get(0).setTaxWiseReport(m);		
				 if(salesReportList.get(0).getTaxLablesList()!=null)
						modelAndViewObj.addObject("salestaxLabels",salesReportList.get(0).getTaxLablesList());
				 
				 modelAndViewObj.addObject("salestax",salesReportList.get(0));
				 
				 if(criteria.equals("tax")){
						/*if(salesReportList != null)*/
						if(salesReportList.get(0).getTaxWiseReport()!=null){
						if(salesReportList.get(0).getTaxWiseReport().containsKey("Date"))
						{
						List<String> dateValuesList=salesReportList.get(0).getTaxWiseReport().get("Date");
						end = dateValuesList.size();
						//added by manasa to know the taxtable size to display the totals
						modelAndViewObj.addObject("salestaxLabelssize",salesReportList.get(0).getTaxLablesList().size());				
						}
					}
						//end = Integer.parseInt(salesReportList.get(0).getTaxWiseReport().get("Date"));
					}
			}

			startDateStr = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			endDateStr = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			//	////////System.out.println(maxRecords);
			String reportStr = new Gson().toJson(salesReportList);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
			modelAndViewObj.addObject("criteria", criteria);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("countersList", countersList);
			modelAndViewObj.addObject("counterDetails", counterDetails);
			 modelAndViewObj.addObject("flowLocation", flow);
			request.getSession().setAttribute("reportList", salesReportList);
			modelAndViewObj.addObject("category", categoryStr);
			modelAndViewObj.addObject("categories", categoriesList);
			modelAndViewObj.addObject("loc",locationStr);
			modelAndViewObj.addObject("reportStr",reportStr);
			modelAndViewObj.addObject("salesReportList",salesReportList);
			modelAndViewObj.addObject("categories", categoriesList);
			//added by manasa
			modelAndViewObj.addObject("startdate",startDateStr);
			modelAndViewObj.addObject("enddate",endDateStr);
			modelAndViewObj.addObject("zone",zoneStr);
			modelAndViewObj.addObject("counterName",counterId);
			if(criteria.equals("date"))
				modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/salesReportsDateWise");
			else if(criteria.equals("counter"))
			{
				modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/salesReportsCounterWise");
				//modelAndViewObj.addObject("criteria", "date");
			}else if(criteria.equals("category"))
				modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/salesReportsCategoryWise");
			else if(criteria.equals("Brand"))
				modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/salesReportsBrandWise");
			else if(criteria.equals("Section"))
				modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/salesReportsSectionWise");
			else if(criteria.equals("Department"))
				modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/salesReportsDepartmentWise");
			else if(criteria.equals("hour"))
				modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/salesReportsHourWise");
			else if(criteria.equals("tax")){
				List<Tax> taxDetails = adminServiceObj.getTaxForLocation(customerIdStr, emailIdStr, locationStr);
				modelAndViewObj.addObject("taxDetails", taxDetails);
				modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/salesReportsTaxWise");
			}
			else if(criteria.equals("supplier"))
				modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/salesReportsSupplierWise");
			else if(criteria.equals("skuSales"))
			
				modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/salesReportsSkuWise");
			
		}
		
		
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
		}
	
	/*@SuppressWarnings("unchecked")
	@RequestMapping("/generateSalesReportCriteriaWise")
	public ModelAndView generateSalesReportCriteriaWise(@RequestParam("locationList") String locationList,@RequestParam("brand") String brand,@RequestParam("section") String section,@RequestParam("department") String department,@RequestParam("zone") String zone,@RequestParam("subcategory") String subcategory,@RequestParam("location") String locationStr,@RequestParam("startDate") String startDateStr,@RequestParam("endDate") String endDateStr,
			@RequestParam("maxRecords") String maxRecordsStr,@RequestParam("criteria") String criteriaStr,@RequestParam("index") String indexStr,@RequestParam("order")String order,
			@RequestParam("orderBy")String orderBy,@RequestParam("saveFlag") boolean saveFlag,@RequestParam("counterId") String counterId,@RequestParam("cashierId") String cashierId,@RequestParam("category") String categoryStr,@RequestParam("searchName") String searchNameStr,HttpServletRequest request,HttpServletResponse response){
		List<SalesReport> salesReportList = null;
		String customerIdStr=null,emailIdStr=null;
		ArrayList<LocationBean> workLocationsList = null;
		String locationListAll = "";
		try{
			// log.info("generateSalesReportCriteriaWise");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, "", "","-1","","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
			if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
				categoryList = outletMasterServiceObj.getCategoryDetails("","", "","-1");
				request.getSession().setAttribute("categoryList", categoryList);
			}
			List<Department> departmentList =(List<Department>)request.getSession().getAttribute("departmentList");
			if(departmentList==null || departmentList.size()==0 || departmentList.isEmpty()){
				departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerIdStr, emailIdStr,"-1",false);
				request.getSession().setAttribute("departmentList", departmentList);
			}
			
			
//			if(zone != null && !zone.trim().equals(""))
//			{
//				workLocationsList = genericMasterServiceObj.getZonalLocationBasedonZone(zone, customerIdStr, emailIdStr, "0", "-1", "");
//			}
//				else
			workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			List<String> locationsListValue=new ArrayList<String>();
			//added by manasa
			if(criteriaStr.equals("date") ||  criteriaStr.equals("counter") || criteriaStr.equals("skuSales")){
			if(locationStr == "" || locationStr.equals("all")){
				if(workLocationsList != null){
					for(int i=0;i<workLocationsList.size();i++){
					
						locationsListValue.add(workLocationsList.get(i).getLocationId());
							
					}
				for (String string : locationsListValue) {
					
					locationListAll = locationListAll+string+",";
				}
				}
			}
			
			}
			else
			{
				
			if((locationStr==null  || locationStr=="" || locationStr.equals("all")) && workLocationsList.size()>0){
				//////////System.out.println("location");
//				locationStr = (String)request.getSession().getAttribute("selectedLocation");
				locationStr = workLocationsList.get(0).getLocationId();
				}
			
			}
			
			List<String> brandsList =(List<String>)request.getSession().getAttribute("brandsList");
			if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
				brandsList = adminServiceObj.getBrandNamesList("","");
				request.getSession().setAttribute("brandsList", brandsList);
			}
			if(startDateStr == null || startDateStr.equals("") )
			{
				startDateStr = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			
			salesReportList = reportsServiceObj.generateSalesReportCriteriaWise(customerIdStr, emailIdStr,locationStr, startDateStr, endDateStr,maxRecordsStr,criteriaStr,indexStr,order,orderBy,saveFlag,counterId,categoryStr,zone,subcategory,department,brand,section,searchNameStr,cashierId,locationList);
			int start = 1,end = Integer.parseInt(maxRecordsStr);
			if(salesReportList == null || salesReportList.size() == 0)
			{
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}
			else
			{
				if(salesReportList.size()<Integer.parseInt(maxRecordsStr))
				{
					end = (salesReportList.size())+(Integer.parseInt(indexStr));
				}else
				{
					end = (Integer.parseInt(indexStr)+end);
				}
				if(criteriaStr.equals("tax")){
					if(salesReportList.get(0).getTaxWiseReport().containsKey("Date")){
					List<String> dateValuesList=salesReportList.get(0).getTaxWiseReport().get("Date");
					end = dateValuesList.size();
					}
					//end = Integer.parseInt(salesReportList.get(0).getTaxWiseReport().get("Date"));
				}
				modelAndViewObj.addObject("totalRecords", salesReportList.get(0).getTotalRecords());
//				////////System.out.println(salesReportList.get(0).getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(indexStr)+start));
				modelAndViewObj.addObject("totalValue", end);
//				////////System.out.println("totalvalue"+end);
				modelAndViewObj.addObject("reportSummary", salesReportList.get(0).getReportSummery());
				modelAndViewObj.addObject("categorySummery", salesReportList.get(0).getCategorySummery());
				 if(criteriaStr.equals("skuSales"))
				 {
						modelAndViewObj.addObject("totalSoldQty", salesReportList.get(0).getTotalSoldQty());
						modelAndViewObj.addObject("totalSoldValue", salesReportList.get(0).getTotalSoldValue()); 
				 }
				Map<String,List<String>> m=new LinkedHashMap<String, List<String>>();
				if(salesReportList.get(0).getTaxWiseReport()!=null)
				 for(Entry<String, List<String>> entry:salesReportList.get(0).getTaxWiseReport().entrySet())
				  {
					// ////////System.out.println("the keys are :"+entry.getKey());
					  if(entry.getKey().equals(""))
					  {
					  } else {
					  m.put(entry.getKey(),entry.getValue());
					  //List<String> l[i]=new ArrayList<String>();
					  }
				  }
				 salesReportList.get(0).setTaxWiseReport(m);		
				 if(salesReportList.get(0).getTaxLablesList()!=null)
						modelAndViewObj.addObject("salestaxLabels",salesReportList.get(0).getTaxLablesList());
				 modelAndViewObj.addObject("salestax",salesReportList.get(0));
				 
				 if(criteriaStr.equals("tax")){
						if(salesReportList.get(0).getTaxWiseReport()!=null){
						if(salesReportList.get(0).getTaxWiseReport().containsKey("Date")){
						List<String> dateValuesList=salesReportList.get(0).getTaxWiseReport().get("Date");
						end = dateValuesList.size();
						//added by manasa to know the taxtable size to display the totals
						modelAndViewObj.addObject("salestaxLabelssize",salesReportList.get(0).getTaxLablesList().size());				
						}
						}
						
						//end = Integer.parseInt(salesReportList.get(0).getTaxWiseReport().get("Date"));
					}
			}
			
			String reportStr = new Gson().toJson(salesReportList);
			request.getSession().setAttribute("reportList", salesReportList);
			modelAndViewObj.addObject("reportStr",reportStr);
			modelAndViewObj.addObject("criteria", criteriaStr);
			modelAndViewObj.addObject("loc",locationStr);
			modelAndViewObj.addObject("category",categoryStr);
			modelAndViewObj.addObject("subcategory",subcategory);
			modelAndViewObj.addObject("zone",zone);
			modelAndViewObj.addObject("department",department);
			modelAndViewObj.addObject("startdate",startDateStr);
			modelAndViewObj.addObject("enddate",endDateStr);
			modelAndViewObj.addObject("brand",brand);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);

			modelAndViewObj.addObject("counterName",counterId);
			modelAndViewObj.addObject("searchName",searchNameStr);
			modelAndViewObj.addObject("section",section);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecordsStr));
//			////////System.out.println(Integer.parseInt(maxRecordsStr));
			modelAndViewObj.addObject("salesReportList",salesReportList);
			if(criteriaStr.equalsIgnoreCase("category"))
				modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/salesReportsCategoryWise");
			else if(criteriaStr.equalsIgnoreCase("Department"))
				modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/salesReportsDepartmentWise");
			else if(criteriaStr.equalsIgnoreCase("Brand"))
				modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/salesReportsBrandWise");
			else if(criteriaStr.equalsIgnoreCase("Section"))
				modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/salesReportsSectionWise");
			else if(criteriaStr.equalsIgnoreCase("supplier"))
				modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/salesReportsSupplierWise");
			else if(criteriaStr.equals("tax")){
				List<Tax> taxDetails = adminServiceObj.getTaxForLocation(customerIdStr, emailIdStr, locationStr);
				modelAndViewObj.addObject("taxDetails", taxDetails);
				modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/salesReportsTaxWise");
			}
			else if(criteriaStr.equals("skuSales"))
				modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/salesReportsSkuWise");
			else if(criteriaStr.equals("hour"))
				modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/salesReportsHourWise");
			else if(criteriaStr.equals("counter"))
				modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/salesReportsCounterWise");
			
			else if(criteriaStr.equalsIgnoreCase("date"))
				modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/salesReportsDateWise");
			else
				modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/viewSalesReport");
			if(saveFlag){
				modelAndViewObj.addObject("downloadurl",salesReportList.get(0).getSalesReportFilePath());
		   // log.info(salesReportList.get(0).getSalesReportFilePath());
			}
		}
		
		catch(Exception e){
			
			e.printStackTrace();
		}
		return modelAndViewObj;
	}*/
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/generateSalesReportCriteriaWise")
	public ModelAndView generateSalesReportCriteriaWise(@RequestParam("locationList") String locationList,@RequestParam("brand") String brand,@RequestParam("section") String section,@RequestParam("department") String department,@RequestParam("zone") String zone,@RequestParam("subcategory") String subcategory,@RequestParam("location") String locationStr,@RequestParam("startDate") String startDateStr,@RequestParam("endDate") String endDateStr,
			@RequestParam("maxRecords") String maxRecordsStr,@RequestParam("criteria") String criteriaStr,@RequestParam("index") String indexStr,@RequestParam("order")String order,
			@RequestParam("orderBy")String orderBy,@RequestParam("saveFlag") boolean saveFlag,@RequestParam("counterId") String counterId,@RequestParam("cashierId") String cashierId,@RequestParam("category") String categoryStr,@RequestParam("searchName") String searchNameStr,@RequestParam("salesChannel") String salesChannel,@RequestParam("isHourWiseReport") String isHourWiseReport,@RequestParam("mytime") String mytime,@RequestParam("mytime1") String mytime1,@RequestParam("flow") String flow,
HttpServletRequest request,HttpServletResponse response){
		List<SalesReport> salesReportList = null;
		String customerIdStr=null,emailIdStr=null;
		List<ZoneMaster> zoneList = null;
		try{
			// log.info("generateSalesReportCriteriaWise");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, "", "","-1","","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
			if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
				categoryList = outletMasterServiceObj.getCategoryDetails("","", "","-1");
				request.getSession().setAttribute("categoryList", categoryList);
			}
			List<Department> departmentList =(List<Department>)request.getSession().getAttribute("departmentList");
			if(departmentList==null || departmentList.size()==0 || departmentList.isEmpty()){
				departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerIdStr, emailIdStr,"-1",false);
				request.getSession().setAttribute("departmentList", departmentList);
			}
			List<String> brandsList =(List<String>)request.getSession().getAttribute("brandsList");
			if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
				brandsList = adminServiceObj.getBrandNamesList("","");
				request.getSession().setAttribute("brandsList", brandsList);
			}
			
			if(criteriaStr.equals("hour") || criteriaStr.equals("date") || criteriaStr.equals("counter") || criteriaStr.equals("skuSales") || criteriaStr.equals("Department") || criteriaStr.equals("Brand"))
			{
				if(endDateStr == null || endDateStr.equals("") ){
				endDateStr = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			}
			
			
		
			
			
			
			if(startDateStr == null || startDateStr.equals("") )
			{
				startDateStr = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}else{
				if(criteriaStr.equals("hour")){
					
					if(isHourWiseReport.equals("true")){	
						
						SimpleDateFormat fromUser = new SimpleDateFormat("dd/MM/yyyy");
						SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-MM-dd");

					

						    String reformattedStr = myFormat.format(fromUser.parse(startDateStr));
						    String reformattedStr1 = myFormat.format(fromUser.parse(endDateStr));
						
						    startDateStr=reformattedStr;
						    endDateStr= reformattedStr1;
						
					startDateStr=startDateStr+" "+mytime;
					endDateStr=endDateStr+" "+mytime1;
			}
			}
			}
			
			salesReportList = reportsServiceObj.generateSalesReportCriteriaWise(customerIdStr, emailIdStr,locationStr, startDateStr, endDateStr,maxRecordsStr,criteriaStr,indexStr,order,orderBy,saveFlag,counterId,categoryStr,zone,subcategory,department,brand,section,searchNameStr,cashierId,locationList,salesChannel,isHourWiseReport);
			
			if(criteriaStr.equals("skuSales") || criteriaStr.equals("date")){
			if(salesReportList != null && salesReportList.size()>0 && salesReportList.get(0).getResponseHeader() != null && !salesReportList.get(0).getResponseHeader().getResponseCode().equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				if(!salesReportList.get(0).getResponseHeader().getResponseMessage().trim().equalsIgnoreCase("No Records Found"))
				modelAndViewObj.addObject("errorMsg",salesReportList.get(0).getResponseHeader().getResponseMessage());
				salesReportList=null;
			}
			}
			
			int start = 1,end = Integer.parseInt(maxRecordsStr);
//			////////System.out.println("size"+salesReportList.size());
			if(salesReportList == null || salesReportList.size() == 0)
			{
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}
			else
			{
				if(salesReportList.size()<Integer.parseInt(maxRecordsStr))
				{
					end = (salesReportList.size())+(Integer.parseInt(indexStr));
				}else
				{
					end = (Integer.parseInt(indexStr)+end);
				}
				if(criteriaStr.equals("tax")){
					if(salesReportList.get(0).getTaxWiseReport().containsKey("Date")){
					List<String> dateValuesList=salesReportList.get(0).getTaxWiseReport().get("Date");
					end = dateValuesList.size();
					}
					//end = Integer.parseInt(salesReportList.get(0).getTaxWiseReport().get("Date"));
				}
				modelAndViewObj.addObject("totalRecords", salesReportList.get(0).getTotalRecords());
//				////////System.out.println(salesReportList.get(0).getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(indexStr)+start));
				modelAndViewObj.addObject("totalValue", end);
//				////////System.out.println("totalvalue"+end);
				modelAndViewObj.addObject("reportSummary", salesReportList.get(0).getReportSummery());
				modelAndViewObj.addObject("categorySummery", salesReportList.get(0).getCategorySummery());
				 if(criteriaStr.equals("skuSales"))
				 {
						modelAndViewObj.addObject("totalSoldQty", salesReportList.get(0).getTotalSoldQty());
						BigDecimal value = new BigDecimal(salesReportList.get(0).getTotalSoldValue());
						modelAndViewObj.addObject("totalSoldValue",value ); 
				 }
				Map<String,List<String>> m=new LinkedHashMap<String, List<String>>();
				if(salesReportList.get(0).getTaxWiseReport()!=null)
				 for(Entry<String, List<String>> entry:salesReportList.get(0).getTaxWiseReport().entrySet())
				  {
					// ////////System.out.println("the keys are :"+entry.getKey());
					  if(entry.getKey().equals(""))
					  {
					  } else {
					  m.put(entry.getKey(),entry.getValue());
					  //List<String> l[i]=new ArrayList<String>();
					  }
				  }
				 salesReportList.get(0).setTaxWiseReport(m);		
				 if(salesReportList.get(0).getTaxLablesList()!=null)
						modelAndViewObj.addObject("salestaxLabels",salesReportList.get(0).getTaxLablesList());
				 modelAndViewObj.addObject("salestax",salesReportList.get(0));
				 
				 if(criteriaStr.equals("tax")){
						if(salesReportList.get(0).getTaxWiseReport()!=null){
						if(salesReportList.get(0).getTaxWiseReport().containsKey("Date")){
						List<String> dateValuesList=salesReportList.get(0).getTaxWiseReport().get("Date");
						end = dateValuesList.size();
						//added by manasa to know the taxtable size to display the totals
						modelAndViewObj.addObject("salestaxLabelssize",salesReportList.get(0).getTaxLablesList().size());				
						}
						}
						
						//end = Integer.parseInt(salesReportList.get(0).getTaxWiseReport().get("Date"));
					}
			}
			startDateStr = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			endDateStr = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");

			String reportStr = new Gson().toJson(salesReportList);
			request.getSession().setAttribute("reportList", salesReportList);
			modelAndViewObj.addObject("reportStr",reportStr);
			modelAndViewObj.addObject("criteria", criteriaStr);
			modelAndViewObj.addObject("loc",locationStr);
			modelAndViewObj.addObject("category",categoryStr);
			modelAndViewObj.addObject("subcategory",subcategory);
			modelAndViewObj.addObject("zone",zone);
			modelAndViewObj.addObject("flowLocation", flow);
			modelAndViewObj.addObject("department",department);
			modelAndViewObj.addObject("startdate",startDateStr);
			modelAndViewObj.addObject("enddate",endDateStr);
			modelAndViewObj.addObject("brand",brand);
			modelAndViewObj.addObject("counterName",counterId);
			modelAndViewObj.addObject("searchName",searchNameStr);
			modelAndViewObj.addObject("section",section);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecordsStr));
//			////////System.out.println(Integer.parseInt(maxRecordsStr));
			modelAndViewObj.addObject("salesReportList",salesReportList);
			if(criteriaStr.equalsIgnoreCase("category"))
				modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/viewCategoriesReport");
			else if(criteriaStr.equalsIgnoreCase("Department"))
				modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/viewDepartmentReport");
			else if(criteriaStr.equalsIgnoreCase("Brand"))
				modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/viewBrandReport");
			else if(criteriaStr.equalsIgnoreCase("Section"))
				modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/viewSectionReport");
			else if(criteriaStr.equalsIgnoreCase("supplier"))
				modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/viewSuppliersReport");
			else if(criteriaStr.equals("tax")){
				List<Tax> taxDetails = adminServiceObj.getTaxForLocation(customerIdStr, emailIdStr, locationStr);
				modelAndViewObj.addObject("taxDetails", taxDetails);
				modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/viewTaxReport");
			}
			else if(criteriaStr.equals("skuSales")){
				modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/viewSkuReport");
			}
			else if(criteriaStr.equals("hour"))
				modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/viewHourSalesReport");
			else if(criteriaStr.equals("counter"))
				modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/viewCounterWiseReport");
			else
				modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/viewSalesReport");
			if(saveFlag){
				if(salesReportList.get(0).getSalesReportFilePath() != null)
				modelAndViewObj.addObject("downloadurl",salesReportList.get(0).getSalesReportFilePath());
		   // log.info(salesReportList.get(0).getSalesReportFilePath());
			}
		}
		
		catch(Exception e){
			
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/viewOutletShipmentreport")
	public ModelAndView viewOutletShipmentreport(@RequestParam("locationList") String locationList,@RequestParam("supplierName") String supplierName,@RequestParam("subcategory") String subcategory,@RequestParam("saveFlag") boolean saveFlag,@RequestParam("brand") String brand,@RequestParam("startdate") String startdate,@RequestParam("enddate") String enddate,@RequestParam("zone") String zone,@RequestParam("productCategory") String productCategory,@RequestParam("location") String location,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,HttpServletRequest request,HttpServletResponse response){
//		List<String> workLocationsList = null;
		String customerIdStr = null,emailIdStr=null;
       ArrayList<LocationBean> workLocationsList = null;
       String locationListAll="";
		try{
  			// log.info("shipmentreport ");
  			//////////System.out.println("shipmentreport ");
  			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
  			int start = 1,end = Integer.parseInt(maxRecords);
  			OutletReportBean  warehousereport = new OutletReportBean();
//  			workLocationsList = adminServiceObj.getOutletLocationsList("","",true);
  			if(zone == null || zone.trim().equals(""))
  			workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
  			else
  				workLocationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");
//			Added by vijay, to make default loaction as location list first occurrence, if location is empty
//			if(location.trim().isEmpty())
//			{
//				location = workLocationsList.get(0).getLocationId();
//			}
//			
  			
  		List<String> locationsListValue=new ArrayList<String>();
  			
  	  		
  			if(location.equals("all")|| location.equals("")){
				if(workLocationsList != null){
					if(zone ==""){
						for(int i=0;i<workLocationsList.size();i++){
							locationsListValue.add(workLocationsList.get(i).getLocationId());
								
						}
						}
						else
						{
							locationsListValue.add(locationList);
						}
				/*	for(int i=0;i<workLocationsList.size();i++){
						locationsListValue.add(workLocationsList.get(i).getLocationId());
							
					}*/
					for (String string : locationsListValue) {
						
						locationListAll = locationListAll+string+",";
					}
				}
				
			}
  			
  			
  			if(startdate == null || startdate.equals("") )
			{
				startdate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}


          if(enddate == null || enddate.equals("") ){
				enddate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}  
  			
  			
  			warehousereport  = reportsServiceObj.getShipmentReceipt(index,maxRecords,zone,location,productCategory,subcategory,brand,startdate,enddate,searchNameStr,saveFlag,supplierName,locationListAll);

//  			List<Suppliers> supplierList = outletMasterServiceObj.getSuppliers("", "","-1","","");
  			List<Suppliers> supplierList =(List<Suppliers>)request.getSession().getAttribute("supplierList");
			if(supplierList==null || supplierList.size()==0 || supplierList.isEmpty()){
				 supplierList = outletMasterServiceObj.getSuppliers(customerIdStr, emailIdStr,"-1","","");
				request.getSession().setAttribute("supplierList", supplierList);
			}
  			
  			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, "", "",index,"","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
			if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
				categoryList = outletMasterServiceObj.getCategoryDetails("","", "","-1");
				request.getSession().setAttribute("categoryList", categoryList);
			}
			List<String> brandsList =(List<String>)request.getSession().getAttribute("brandsList");
			if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
				brandsList = adminServiceObj.getBrandNamesList("","");
				request.getSession().setAttribute("brandsList", brandsList);
			}
  			modelAndViewObj = new ModelAndView();
  			if(warehousereport == null || warehousereport.getOutletReportList() == null){
  				modelAndViewObj.addObject("totalRecords","0");
  				modelAndViewObj.addObject("index", "1");
  				modelAndViewObj.addObject("totalValue", "0");
  			}else{
  				if(warehousereport.getOutletReportList().size()<Integer.parseInt(maxRecords)){
  					end = (warehousereport.getOutletReportList().size())+(Integer.parseInt(index));
  				}else{
  					end = (Integer.parseInt(index)+end);
  				}
  				modelAndViewObj.addObject("totalRecords", warehousereport.getTotalRecords());
  				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
  				modelAndViewObj.addObject("totalValue", end);
  			}
  			
  			modelAndViewObj.addObject("startdate", startdate);
			modelAndViewObj.addObject("enddate", enddate);
			modelAndViewObj.addObject("supplierid", supplierName);
			modelAndViewObj.addObject("maxRecords", maxRecords);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("locationsList", workLocationsList);
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("category", productCategory);
			modelAndViewObj.addObject("supplierList", supplierList);
			modelAndViewObj.addObject("subcategory", subcategory);
			modelAndViewObj.addObject("brand", brand);
			if(saveFlag)
			{
				if(warehousereport.getSalesReportFilePath()!=null)
				modelAndViewObj.addObject("downloadurl", warehousereport.getSalesReportFilePath());
			}
  			modelAndViewObj.addObject("warehousereport", warehousereport.getOutletReportList());
  			modelAndViewObj.setViewName("Reports/OutletReports/shipmentReceipt");
  		}
  		catch(Exception exception){
  			exception.printStackTrace();
  		}
  		return modelAndViewObj;
  	}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/viewOutletShipmentReceiptreport")
	public ModelAndView viewOutletShipmentReceiptreport(@RequestParam("locationList") String locationList,@RequestParam("supplierName") String supplierName,@RequestParam("subcategory") String subcategory,@RequestParam("saveFlag") boolean saveFlag,@RequestParam("brand") String brand,@RequestParam("startdate") String startdate,@RequestParam("enddate") String enddate,@RequestParam("zone") String zone,@RequestParam("productCategory") String productCategory,@RequestParam("location") String location,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,HttpServletRequest request,HttpServletResponse response){
//		List<String> workLocationsList = null;
		String customerIdStr = null,emailIdStr=null;
		List<String> locationsListValue = null;
       ArrayList<LocationBean> workLocationsList = null;
   	String locationListAll = "";
		try{
  			// log.info("shipmentreport ");
  			//////////System.out.println("shipmentreport ");
  			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
  			int start = 1,end = Integer.parseInt(maxRecords);
  			OutletReportBean  warehousereport = new OutletReportBean();
//  			workLocationsList = adminServiceObj.getOutletLocationsList("","",true);
  			if(zone == null || zone.trim().equals(""))
  				workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
  			else
  				workLocationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");
  			
//			Added by vijay, to make default loaction as location list first occurrence, if location is empty
//			if(location.trim().isEmpty())
//			{
//				location = workLocationsList.get(0).getLocationId();
//			}
//			
  			locationsListValue=new ArrayList<String>();
  			
  		
  			if(location.equals("all")|| location.equals("")){
  				
				if(workLocationsList != null){
					if(zone ==""){
					for(int i=0;i<workLocationsList.size();i++){
						locationsListValue.add(workLocationsList.get(i).getLocationId());
							
					}
					}
					else
					{
						locationsListValue.add(locationList);
					}
					for (String string : locationsListValue) {
						
						locationListAll = locationListAll+string+",";
					}
				}
				
			}
  					
  			if(startdate == null || startdate.equals("") )
			{
				startdate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			
  			
			List<ProcurementReceipt> procurementReceiptList  = reportsServiceObj.getOMShipmentReceipt(saveFlag,customerIdStr, emailIdStr,location,index,maxRecords,searchNameStr,startdate,enddate,false,locationListAll,locationList,supplierName);

			//locationStr = (String)request.getSession().getAttribute("selectedLocation");
//  			List<Suppliers> supplierList = outletMasterServiceObj.getSuppliers("", "","-1","","");
  		
			List<Suppliers> supplierList =(List<Suppliers>)request.getSession().getAttribute("supplierList");
			if(supplierList==null || supplierList.size()==0 || supplierList.isEmpty()){
				 supplierList = outletMasterServiceObj.getSuppliers(customerIdStr, emailIdStr,"-1","","");
				request.getSession().setAttribute("supplierList", supplierList);
			}
			
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, "", "",index,"","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
			if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
				categoryList = outletMasterServiceObj.getCategoryDetails("","", "","-1");
				request.getSession().setAttribute("categoryList", categoryList);
			}
			List<String> brandsList =(List<String>)request.getSession().getAttribute("brandsList");
			if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
				brandsList = adminServiceObj.getBrandNamesList("","");
				request.getSession().setAttribute("brandsList", brandsList);
			}
  			modelAndViewObj = new ModelAndView();
  			if(procurementReceiptList == null || procurementReceiptList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(procurementReceiptList.size()<10){
					end = (procurementReceiptList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(procurementReceiptList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
  			modelAndViewObj.addObject("procurementReceiptList", procurementReceiptList);
  			modelAndViewObj.addObject("startdate", startdate);
			modelAndViewObj.addObject("enddate", enddate);
			modelAndViewObj.addObject("supplierid", supplierName);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
//			////////System.out.println(Integer.parseInt(maxRecords));
			modelAndViewObj.addObject("zone", zone);
//	        ////////System.out.println(zone);
			modelAndViewObj.addObject("zoneList", zoneList);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("locationsList", workLocationsList);
			 modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("category", productCategory);
			modelAndViewObj.addObject("supplierList", supplierList);
			modelAndViewObj.addObject("subcategory", subcategory);
			modelAndViewObj.addObject("brand", brand);
			if(saveFlag)
			{
			if(procurementReceiptList!=null)	
				if(procurementReceiptList.get(0).getFilePath()!=null)
				modelAndViewObj.addObject("downloadurl", procurementReceiptList.get(0).getFilePath());
			}
//  			modelAndViewObj.addObject("warehousereport", warehousereport.getOutletReportList());
  			modelAndViewObj.setViewName("Reports/OutletReports/GRNReport");
  		}
  		catch(Exception exception){
  			exception.printStackTrace();
  		}
  		return modelAndViewObj;
  	}



	@RequestMapping("/viewBillSummary")
	public ModelAndView viewBillSummary(@RequestParam("flag") Boolean flag,@RequestParam("startDate") String startDateStr,@RequestParam("endDate") String endDateStr,@RequestParam("zone") String zone,@RequestParam("location") String locationStr,@RequestParam("date") String dateStr,
			@RequestParam("maxRecords") String maxRecordsStr,@RequestParam("index") String indexStr,
			@RequestParam("criteria") String criteria,@RequestParam("counterid") String counterid,@RequestParam("flowLocation") String flowLocation,HttpServletRequest request,HttpServletResponse response){
		List<BillsList> billsList = null;
		String customerIdStr=null,emailIdStr=null;
		try{
			// log.info("viewBillSummary");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			billsList = reportsServiceObj.getBillsForDate(customerIdStr, emailIdStr,locationStr,dateStr,maxRecordsStr,indexStr,counterid,flag);
			/*int start = 1,end = Integer.parseInt(maxRecordsStr);
			if(billSummaryList == null || billSummaryList.size() == 0)
			{
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}
			else
			{
				if(billSummaryList.size()<Integer.parseInt(maxRecordsStr))
				{
					end = (billSummaryList.size())+(Integer.parseInt(indexStr));
				}else
				{
					end = (Integer.parseInt(indexStr)+end);
				}
				modelAndViewObj.addObject("totalRecords", billSummaryList.get(0).getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(indexStr)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecordsStr));*/
			if(billsList.size()>0){
				if(flag){
					if(billsList.get(0).getSalesReportFilePath()!=null)
						modelAndViewObj.addObject("downloadurl",billsList.get(0).getSalesReportFilePath());	

				}
			}
			modelAndViewObj.addObject("criteria",criteria);
			/*if(criteria.equals("counter"))
			modelAndViewObj.addObject("criteria","date");*/
			
			modelAndViewObj.addObject("date",dateStr);
			modelAndViewObj.addObject("startDate",startDateStr);
			modelAndViewObj.addObject("endDate",endDateStr);
			modelAndViewObj.addObject("counterid",counterid);
			modelAndViewObj.addObject("zone",zone);
			modelAndViewObj.addObject("location",locationStr);
			modelAndViewObj.addObject("billsList",billsList);
			modelAndViewObj.addObject("maxRecords",maxRecordsStr);
			modelAndViewObj.addObject("flowLocation",flowLocation);
			
			modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/viewBillsSummary");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
		
	}
	
	/**
	 * 
	 *@author vijay kumar
	 *This method is used to display CreditNote report.
	 *
	 *
	 **/
	@RequestMapping("/viewOutletSalesCreditNoteReport")
	public ModelAndView viewOutletSalesCreditNoteReport(
			@RequestParam("flowUnder") String flowUnder, @RequestParam("maxRecords") String maxRecords, 
			@RequestParam("index") String index,@RequestParam("brand") String brand,
			@RequestParam("section") String section,@RequestParam("subDepartment") String subDepartment, 
			@RequestParam("location") String location,@RequestParam("zone") String zone,
			@RequestParam("startDate")String startDate,@RequestParam("endDate") String endDate, 
			@RequestParam("category") String category, @RequestParam("subCategory") String subCategory,			
			@RequestParam("department") String department, @RequestParam("searchCriteria") String searchCriteria, @RequestParam("saveflag") String saveflag, @RequestParam("flow") String flow,
			HttpServletRequest request,HttpServletResponse response)
	{
		WarehouseReport WarehouseReportObj = null;
		String locationStr = null,customerIdStr=null,emailIdStr=null;
		List<String> countersList = null;
		ArrayList<LocationBean> workLocationsList = new ArrayList<LocationBean>();
		WarehouseCounterResponse counterDetails = null;
		// log.info("Show Reports - Credit Note Reports Flow");
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			//			workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
//			workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			
			if(zone == null || zone.trim().equals("")){
				if(flow == "" || flow.equals("")){
					workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
					}else{
						workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
					}
			}else{
				if(flow == "" || flow.equals("")){
				workLocationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");
				}else{
					workLocationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Warehouse");

				}
			}

			

			locationStr = (String)request.getSession().getAttribute("selectedLocation");
			if(locationStr == null && workLocationsList != null && workLocationsList.size() > 0)
				locationStr = workLocationsList.get(0).getLocationId();
			if(flow == "" || flow.equals("")){
				countersList = reportsServiceObj.getCounters(locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
				}else{
				counterDetails = adminServiceObj.getWhCounters("",locationStr,customerIdStr,emailIdStr,index,false,"100");
				}
				
			
			//countersList = reportsServiceObj.getCounters(locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty())
			{
				zoneList = genericMasterServiceObj.getZones(null, "", "","-1","","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
			if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty())
			{
				categoryList = outletMasterServiceObj.getCategoryDetails("","", "","-1");
				request.getSession().setAttribute("categoryList", categoryList);
			}
			List<Department> departmentList =(List<Department>)request.getSession().getAttribute("departmentList");
			if(departmentList==null || departmentList.size()==0 || departmentList.isEmpty())
			{
				departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerIdStr, emailIdStr,"-1",false);
				request.getSession().setAttribute("departmentList", departmentList);
			}

			ArrayList<String> categoriesList = new ArrayList<String>();
			if(categoryList != null)
				for(ProductCategoryBean productCategoryBean : categoryList)
					categoriesList.add(productCategoryBean.getCategoryDescription());
			if(flow == "" || flow.equals("")){
				countersList = reportsServiceObj.getCounters(locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
				}else{
				counterDetails = adminServiceObj.getWhCounters("",locationStr,customerIdStr,emailIdStr,index,false,"100");
				}
				
			//			Added by vijay, to make default location as location list first occurrence, if location is empty
			if((location.trim()).equals("") || location.trim().isEmpty())
			{
				location = workLocationsList.get(0).getLocationId();
			}


			if(startDate == null || startDate.equals("") )
			{
				startDate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}


			modelAndViewObj = new ModelAndView();

			WarehouseReportObj = reportsServiceObj.getSaleCreditNoteReport(index,maxRecords,brand,zone,category,subCategory,department,subDepartment,section,location,startDate,endDate,searchCriteria,saveflag);

			
			int start = 1,end = Integer.parseInt(maxRecords);
			if(WarehouseReportObj == null || WarehouseReportObj.getReportsList() == null)
			{
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
				
			}
			else
			{
				if(WarehouseReportObj.getReportsList().size()<Integer.parseInt(maxRecords)){
					end = (WarehouseReportObj.getReportsList().size())+(Integer.parseInt(index));
				}
				else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", WarehouseReportObj.getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue",end );
			}
			modelAndViewObj.addObject("WarehouseReportObj", WarehouseReportObj);
			modelAndViewObj.addObject("countersList", countersList);
			modelAndViewObj.addObject("counterDetails", counterDetails);
			 modelAndViewObj.addObject("flowLocation", flow);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("category", category);
			modelAndViewObj.addObject("categories", categoriesList);
			modelAndViewObj.addObject("zoneList", zoneList);
			modelAndViewObj.addObject("loc",location);
			modelAndViewObj.addObject("startdate", startDate);
			modelAndViewObj.addObject("enddate", endDate);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
			modelAndViewObj.addObject("searchName",searchCriteria);
			modelAndViewObj.addObject("urldownload",WarehouseReportObj.getSalesReportFilePath());
			
			
			
			
			
			
			

			modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/viewCreditNoteReport");
		}

		catch(Exception exception){
			////////System.out.println(exception);
		}
		return modelAndViewObj;

	}
	
	/**
	 * 
	 *@author vijay kumar
	 *@desc This method is used to display MCNBills report.
	 *
	 *
	 **/
	
	@RequestMapping("/viewMCNBills")
	public ModelAndView viewMCNBills(@RequestParam("counterIdStr") String counterIdStr, @RequestParam("maxRecords") String maxRecords, 
			@RequestParam("index") String index,
			@RequestParam("mcnStatus") String mcnStatus, 
			@RequestParam("location") String location,@RequestParam("zone") String zone,
			@RequestParam("startDate")String startDate,@RequestParam("endDate") String endDate, 
			@RequestParam("category") String category, @RequestParam("saveFlag") boolean saveFlag,@RequestParam("flowLocation") String flowLocation,			
		    @RequestParam("searchCriteria") String searchCriteria,
			HttpServletRequest request,HttpServletResponse response)
	{
		WarehouseReport WarehouseReportObj = null;
		String locationStr = null,customerIdStr=null,emailIdStr=null;
		List<String> countersList = null;
		String locationListAll="";
		WarehouseCounterResponse counterDetails = null;
		ArrayList<LocationBean> workLocationsList = new  ArrayList<LocationBean>();
		// log.info("Show Reports - Credit Note Reports Flow");
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			//workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
		
			if(flowLocation.equals("warehouse") ||flowLocation ==  "warehouse" ){
				 counterDetails = adminServiceObj.getWhCounters("",location,customerIdStr,emailIdStr,index,false,"100");

				
			}else{
			countersList = reportsServiceObj.getCounters(location, customerIdStr, emailIdStr,Constants.PAGINATION_START_INDEX);
			}
			
			
			
			//countersList = reportsServiceObj.getCounters(locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty())
			{
				zoneList = genericMasterServiceObj.getZones(null, "", "","-1","","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			/*if(startDate.equals(null) || startDate.trim().equals("") )
			{
				startDate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");

			}*/

			if(zone == null || zone.trim().equals("")){
				
				if(flowLocation.equals("warehouse") ||flowLocation ==  "warehouse" ){
					workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
				}else{
					workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);

				}
				
			}
			else{
				if(flowLocation.equals("warehouse") ||flowLocation ==  "warehouse" ){
			
				workLocationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Warehouse");
				}else{
					workLocationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");

					}
				}



			modelAndViewObj = new ModelAndView();
			WarehouseReportObj = reportsServiceObj.getSaleCreditNoteReportCancel(index,maxRecords,"",zone,counterIdStr,saveFlag,"","",mcnStatus,location,startDate,endDate,searchCriteria);
			int start = 1,end = Integer.parseInt(maxRecords);
			if(WarehouseReportObj == null || WarehouseReportObj.getReportsList() == null)
			{
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}
			else
			{
				if(WarehouseReportObj.getReportsList().size()<Integer.parseInt(maxRecords)){
					end = (WarehouseReportObj.getReportsList().size())+(Integer.parseInt(index));
				}
				else{
					end = (Integer.parseInt(index)+end);

				}
				modelAndViewObj.addObject("totalRecords", WarehouseReportObj.getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue",end );

			}
			if(saveFlag)
			{
				if(WarehouseReportObj.getSalesReportFilePath()!=null)
					modelAndViewObj.addObject("downloadurl", WarehouseReportObj.getSalesReportFilePath());
			}
			modelAndViewObj.addObject("WarehouseReportObj", WarehouseReportObj);
			modelAndViewObj.addObject("countersList", countersList);
			modelAndViewObj.addObject("counterDetails", counterDetails);

			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("zoneList", zoneList);
			modelAndViewObj.addObject("startdate", startDate);
			modelAndViewObj.addObject("enddate", endDate);
			modelAndViewObj.addObject("mcnStatus", mcnStatus);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("counterId", counterIdStr);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
			modelAndViewObj.addObject("searchName",searchCriteria);
			modelAndViewObj.addObject("flowLocation", flowLocation);
			modelAndViewObj.setViewName("Inventory Manager/Billing/mcnDetails");
		}

		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;

	}
	
	
	@RequestMapping("/viewItemTaxesReport")
	public ModelAndView viewItemTaxesReport(@RequestParam("saveFlag") boolean saveFlag, @RequestParam("maxRecords") String maxRecords, 
			@RequestParam("index") String index,@RequestParam("brand") String brand,
			@RequestParam("section") String section,@RequestParam("subDepartment") String subDepartment, 
			@RequestParam("location") String location,@RequestParam("zone") String zone,
			@RequestParam("startDate")String startDate,@RequestParam("endDate") String endDate, 
			@RequestParam("category") String category, @RequestParam("subCategory") String subCategory,			
			@RequestParam("department") String department, @RequestParam("searchCriteria") String searchCriteria, 
			@RequestParam("flow") String flow,@RequestParam("isHourWiseReport") boolean isHourWiseReport,
			@RequestParam("mytime") String mytime,@RequestParam("mytime1") String mytime1,
			@RequestParam("hourselection") String hourselection,
			HttpServletRequest request,HttpServletResponse response)
			{
		WarehouseReport WarehouseReportObj = null;
		String locationStr = null,customerIdStr=null,emailIdStr=null;
		List<String> countersList = null;
		ArrayList<LocationBean> workLocationsList = new ArrayList<LocationBean>();
		WarehouseCounterResponse counterDetails = null;
		// log.info("Show Reports - Credit Note Reports Flow");
		try{
			String tempStartDate=startDate;
			String tempEndDate=endDate;
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			//workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			/*workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			locationStr = (String)request.getSession().getAttribute("selectedLocation");*/
			if(zone == null || zone.trim().equals("")){
				if(flow == "" || flow.equals("")){
					workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
					}else{
						workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
					}
			}else{
				if(flow == "" || flow.equals("")){
				workLocationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");
				}else{
					workLocationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Warehouse");

				}
			}
			
			if(locationStr == null && workLocationsList != null && workLocationsList.size() > 0)
				locationStr = workLocationsList.get(0).getLocationId();
			
			if(flow == "" || flow.equals("")){
				countersList = reportsServiceObj.getCounters(locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
				}else{
				counterDetails = adminServiceObj.getWhCounters("",locationStr,customerIdStr,emailIdStr,index,false,"100");
				}
				
			//countersList = reportsServiceObj.getCounters(locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty())
			{
				 zoneList = genericMasterServiceObj.getZones(null, "", "","-1","","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
			if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty())
			{
				categoryList = outletMasterServiceObj.getCategoryDetails("","", "","-1");
				request.getSession().setAttribute("categoryList", categoryList);
			}
			List<Department> departmentList =(List<Department>)request.getSession().getAttribute("departmentList");
			if(departmentList==null || departmentList.size()==0 || departmentList.isEmpty())
			{
				departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerIdStr, emailIdStr,"-1",false);
				request.getSession().setAttribute("departmentList", departmentList);
			}
			List<ProductSubCategoryBean> subCategoryDetailsList =(List<ProductSubCategoryBean>)request.getSession().getAttribute("subCategoryDetailsList");
			if(subCategoryDetailsList==null || subCategoryDetailsList.size()==0 || subCategoryDetailsList.isEmpty()){
				subCategoryDetailsList = outletMasterServiceObj.getSubCategoryDetails("","", "","-1","",false);
				request.getSession().setAttribute("subCategoryDetailsList", subCategoryDetailsList);
			}
			
			ArrayList<String> categoriesList = new ArrayList<String>();
			if(categoryList != null)
				for(ProductCategoryBean productCategoryBean : categoryList)
					categoriesList.add(productCategoryBean.getCategoryDescription());
			//countersList = reportsServiceObj.getCounters(locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
			
			
//			Added by vijay, to make default loaction as location list first occurrence, if location is empty
			if((location.trim()).equals("") || location.trim().isEmpty())
			{
				location = workLocationsList.get(0).getLocationId();
			}
			if(startDate == null || startDate.equals("") )
			{
				startDate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
				
				
			}
			else{
				
					
					if(isHourWiseReport==true ){	
						if(endDate.equals("")||endDate.equals(null))
							endDate=startDate;
						SimpleDateFormat fromUser = new SimpleDateFormat("dd/MM/yyyy");
						SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-MM-dd");

						    String reformattedStr = myFormat.format(fromUser.parse(startDate));
						    String reformattedStr1 = myFormat.format(fromUser.parse(endDate));
						
						    startDate=reformattedStr;
						    endDate= reformattedStr1;
						
						    startDate=startDate+" "+mytime;
					        endDate=endDate+" "+mytime1;
			
			}
			}
			
			
			modelAndViewObj = new ModelAndView();
			WarehouseReportObj = reportsServiceObj.getItemTaxesReport(index,maxRecords,brand,zone,category,subCategory,department,subDepartment,section,location,startDate,endDate,searchCriteria,saveFlag,isHourWiseReport);
				
				
				int start = 1,end = Integer.parseInt(maxRecords);
				if(WarehouseReportObj == null || WarehouseReportObj.getReportsList() == null)
				{
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}
				else
				{
					if(WarehouseReportObj.getReportsList().size()<Integer.parseInt(maxRecords)){
	  					end = (WarehouseReportObj.getReportsList().size())+(Integer.parseInt(index));
	  				}
					else{
	  					end = (Integer.parseInt(index)+end);
	  									
					}
					modelAndViewObj.addObject("totalRecords", WarehouseReportObj.getTotalRecords());
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue",end );
					
					
					
				}
				
				
				startDate=tempStartDate;
				endDate=tempEndDate;
				modelAndViewObj.addObject("WarehouseReportObj", WarehouseReportObj);
				modelAndViewObj.addObject("countersList", countersList);
				modelAndViewObj.addObject("counterDetails", counterDetails);
				modelAndViewObj.addObject("flowLocation", flow);
				modelAndViewObj.addObject("workLocationsList", workLocationsList);
				modelAndViewObj.addObject("category", category);
				modelAndViewObj.addObject("subcategory", subCategory);
				modelAndViewObj.addObject("subCategoryDetailsList", subCategoryDetailsList);
				modelAndViewObj.addObject("categories", categoriesList);
				modelAndViewObj.addObject("zoneList", zoneList);
				modelAndViewObj.addObject("loc",location);
	  			modelAndViewObj.addObject("startdate", startDate);
				modelAndViewObj.addObject("enddate", endDate);
				modelAndViewObj.addObject("zone", zone);
				modelAndViewObj.addObject("selectedLocation", location);
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.addObject("searchName",searchCriteria);
				modelAndViewObj.addObject("hourselection",hourselection);
				if(saveFlag)
				{
					if(WarehouseReportObj.getSalesReportFilePath()!=null)
					modelAndViewObj.addObject("downloadurl", WarehouseReportObj.getSalesReportFilePath());
				}
				modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/viewItemTaxReport");
			}
		
		catch(Exception exception){
			////////System.out.println(exception);
		}
	return modelAndViewObj;
	
		}
	
	
	/*@RequestMapping("/viewItemTaxesReport")
	public ModelAndView viewItemTaxesReport(@RequestParam("saveFlag") boolean saveFlag, @RequestParam("maxRecords") String maxRecords, 
			@RequestParam("index") String index,@RequestParam("brand") String brand,
			@RequestParam("section") String section,@RequestParam("subDepartment") String subDepartment, 
			@RequestParam("location") String location,@RequestParam("zone") String zone,
			@RequestParam("startDate")String startDate,@RequestParam("endDate") String endDate, 
			@RequestParam("category") String category, @RequestParam("subCategory") String subCategory,			
			@RequestParam("department") String department, @RequestParam("searchCriteria") String searchCriteria, @RequestParam("flow") String flow,
			HttpServletRequest request,HttpServletResponse response)
			{
		WarehouseReport WarehouseReportObj = null;
		String locationStr = null,customerIdStr=null,emailIdStr=null;
		List<String> countersList = null;
		ArrayList<LocationBean> workLocationsList = new ArrayList<LocationBean>();
		WarehouseCounterResponse counterDetails = null;
		// log.info("Show Reports - Credit Note Reports Flow");
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			//workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			locationStr = (String)request.getSession().getAttribute("selectedLocation");
			if(zone == null || zone.trim().equals("")){
				if(flow == "" || flow.equals("")){
					workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
					}else{
						workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
					}
			}else{
				if(flow == "" || flow.equals("")){
				workLocationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");
				}else{
					workLocationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Warehouse");

				}
			}
			
			if(locationStr == null && workLocationsList != null && workLocationsList.size() > 0)
				locationStr = workLocationsList.get(0).getLocationId();
			
			if(flow == "" || flow.equals("")){
				countersList = reportsServiceObj.getCounters(locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
				}else{
				counterDetails = adminServiceObj.getWhCounters("",locationStr,customerIdStr,emailIdStr,index,false,"100");
				}
				
			//countersList = reportsServiceObj.getCounters(locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty())
			{
				 zoneList = genericMasterServiceObj.getZones(null, "", "","-1","","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
			if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty())
			{
				categoryList = outletMasterServiceObj.getCategoryDetails("","", "","-1");
				request.getSession().setAttribute("categoryList", categoryList);
			}
			List<Department> departmentList =(List<Department>)request.getSession().getAttribute("departmentList");
			if(departmentList==null || departmentList.size()==0 || departmentList.isEmpty())
			{
				departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerIdStr, emailIdStr,"-1",false);
				request.getSession().setAttribute("departmentList", departmentList);
			}
			List<ProductSubCategoryBean> subCategoryDetailsList =(List<ProductSubCategoryBean>)request.getSession().getAttribute("subCategoryDetailsList");
			if(subCategoryDetailsList==null || subCategoryDetailsList.size()==0 || subCategoryDetailsList.isEmpty()){
				subCategoryDetailsList = outletMasterServiceObj.getSubCategoryDetails("","", "","-1","",false);
				request.getSession().setAttribute("subCategoryDetailsList", subCategoryDetailsList);
			}
			
			ArrayList<String> categoriesList = new ArrayList<String>();
			if(categoryList != null)
				for(ProductCategoryBean productCategoryBean : categoryList)
					categoriesList.add(productCategoryBean.getCategoryDescription());
			//countersList = reportsServiceObj.getCounters(locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
			
			
//			Added by vijay, to make default loaction as location list first occurrence, if location is empty
			if((location.trim()).equals("") || location.trim().isEmpty())
			{
				location = workLocationsList.get(0).getLocationId();
			}
			if(startDate == null || startDate.equals("") )
			{
				startDate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			
			
			
			modelAndViewObj = new ModelAndView();
			WarehouseReportObj = reportsServiceObj.getItemTaxesReport(index,maxRecords,brand,zone,category,subCategory,department,subDepartment,section,location,startDate,endDate,searchCriteria,saveFlag);
				
				
				int start = 1,end = Integer.parseInt(maxRecords);
				if(WarehouseReportObj == null || WarehouseReportObj.getReportsList() == null)
				{
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}
				else
				{
					if(WarehouseReportObj.getReportsList().size()<Integer.parseInt(maxRecords)){
	  					end = (WarehouseReportObj.getReportsList().size())+(Integer.parseInt(index));
	  				}
					else{
	  					end = (Integer.parseInt(index)+end);
	  									
					}
					modelAndViewObj.addObject("totalRecords", WarehouseReportObj.getTotalRecords());
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue",end );
					
					
					
				}
				modelAndViewObj.addObject("WarehouseReportObj", WarehouseReportObj);
				modelAndViewObj.addObject("countersList", countersList);
				modelAndViewObj.addObject("counterDetails", counterDetails);
				 modelAndViewObj.addObject("flowLocation", flow);
				modelAndViewObj.addObject("workLocationsList", workLocationsList);
				modelAndViewObj.addObject("category", category);
				modelAndViewObj.addObject("subcategory", subCategory);
				modelAndViewObj.addObject("subCategoryDetailsList", subCategoryDetailsList);
				modelAndViewObj.addObject("categories", categoriesList);
				modelAndViewObj.addObject("zoneList", zoneList);
				modelAndViewObj.addObject("loc",location);
	  			modelAndViewObj.addObject("startdate", startDate);
				modelAndViewObj.addObject("enddate", endDate);
				modelAndViewObj.addObject("zone", zone);
				modelAndViewObj.addObject("selectedLocation", location);
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.addObject("searchName",searchCriteria);
				if(saveFlag)
				{
					if(WarehouseReportObj.getSalesReportFilePath()!=null)
					modelAndViewObj.addObject("downloadurl", WarehouseReportObj.getSalesReportFilePath());
				}
				modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/viewItemTaxReport");
			}
		
		catch(Exception exception){
			////////System.out.println(exception);
		}
	return modelAndViewObj;
	
		}*/
	
	
	//written by:manasa
	@RequestMapping("/viewItemWiseTaxGSTReport")
	public ModelAndView viewItemWiseTaxGSTReport(@RequestParam("saveFlag") boolean saveFlag, @RequestParam("maxRecords") String maxRecords, 
			@RequestParam("locationList") String locationList,@RequestParam("index") String index,@RequestParam("brand") String brand,
			@RequestParam("section") String section,@RequestParam("subDepartment") String subDepartment, 
			@RequestParam("location") String location,@RequestParam("zone") String zone,
			@RequestParam("startDate")String startDate,@RequestParam("endDate") String endDate, 
			@RequestParam("category") String category, @RequestParam("subCategory") String subCategory,			
			@RequestParam("department") String department, @RequestParam("searchCriteria") String searchCriteria, @RequestParam("flow") String flow,
			HttpServletRequest request,HttpServletResponse response)
			{
		WarehouseReport WarehouseReportObj = null;
		String locationStr = null,customerIdStr=null,emailIdStr=null;
		List<String> countersList = null;
		String locationListAll="";
		ArrayList<LocationBean> workLocationsList = new ArrayList<LocationBean>();
		WarehouseCounterResponse counterDetails = null;
		// log.info("Show Reports - Credit Note Reports Flow");
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			//workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			if(zone == null || zone.trim().equals("")){
				if(flow == "" || flow.equals("")){
					workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
					}else{
						workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
					}
			}else{
				if(flow == "" || flow.equals("")){
				workLocationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");
				}else{
					workLocationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Warehouse");

				}
			}
			/*workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			locationStr = (String)request.getSession().getAttribute("selectedLocation");*/
			if(locationStr == null && workLocationsList != null && workLocationsList.size() > 0)
				locationStr = workLocationsList.get(0).getLocationId();
			
			if(flow == "" || flow.equals("")){
				countersList = reportsServiceObj.getCounters(locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
				}else{
				counterDetails = adminServiceObj.getWhCounters("",locationStr,customerIdStr,emailIdStr,index,false,"100");
				}
			
			//countersList = reportsServiceObj.getCounters(locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty())
			{
				 zoneList = genericMasterServiceObj.getZones(null, "", "","-1","","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
			if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty())
			{
				categoryList = outletMasterServiceObj.getCategoryDetails("","", "","-1");
				request.getSession().setAttribute("categoryList", categoryList);
			}
			List<Department> departmentList =(List<Department>)request.getSession().getAttribute("departmentList");
			if(departmentList==null || departmentList.size()==0 || departmentList.isEmpty())
			{
				departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerIdStr, emailIdStr,"-1",false);
				request.getSession().setAttribute("departmentList", departmentList);
			}
			List<ProductSubCategoryBean> subCategoryDetailsList =(List<ProductSubCategoryBean>)request.getSession().getAttribute("subCategoryDetailsList");
			if(subCategoryDetailsList==null || subCategoryDetailsList.size()==0 || subCategoryDetailsList.isEmpty()){
				subCategoryDetailsList = outletMasterServiceObj.getSubCategoryDetails("","", "","-1","",false);
				request.getSession().setAttribute("subCategoryDetailsList", subCategoryDetailsList);
			}
			
			ArrayList<String> categoriesList = new ArrayList<String>();
			if(categoryList != null)
				for(ProductCategoryBean productCategoryBean : categoryList)
					categoriesList.add(productCategoryBean.getCategoryDescription());
			//countersList = reportsServiceObj.getCounters(locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
			
			
//			Added by vijay, to make default loaction as location list first occurrence, if location is empty
			/*if((location.trim()).equals("") || location.trim().isEmpty())
			{
				location = workLocationsList.get(0).getLocationId();
			}*/
			
          List<String> locationsListValue=new ArrayList<String>();
  			
  	  		
  			if(location.equals("all")|| location.equals("")){
				if(workLocationsList != null){
					if(zone ==""){
						for(int i=0;i<workLocationsList.size();i++){
							locationsListValue.add(workLocationsList.get(i).getLocationId());
						}
						}
						else
						{
							locationsListValue.add(locationList);
						}
			
					for (String string : locationsListValue) {
						locationListAll = locationListAll+string+",";
					}
				}
				
			}
			
  			
  			if(startDate == null || startDate.equals("") )
			{
				startDate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			
  			
			
			modelAndViewObj = new ModelAndView();
					WarehouseReportObj = reportsServiceObj.getItemTaxesGSTReport(index,maxRecords,brand,zone,category,subCategory,department,subDepartment,section,location,startDate,endDate,searchCriteria,saveFlag,locationListAll);
				
				
				int start = 1,end = Integer.parseInt(maxRecords);
				if(WarehouseReportObj == null || WarehouseReportObj.getReportsList() == null)
				{
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}
				else
				{
					if(WarehouseReportObj.getReportsList().size()<Integer.parseInt(maxRecords)){
	  					end = (WarehouseReportObj.getReportsList().size())+(Integer.parseInt(index));
	  				}
					else{
	  					end = (Integer.parseInt(index)+end);
	  									
					}
					modelAndViewObj.addObject("totalRecords", WarehouseReportObj.getTotalRecords());
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue",end );
					
				}
				modelAndViewObj.addObject("WarehouseReportObj", WarehouseReportObj);
				modelAndViewObj.addObject("countersList", countersList);
				modelAndViewObj.addObject("counterDetails", counterDetails);
				 modelAndViewObj.addObject("flowLocation", flow);
				modelAndViewObj.addObject("workLocationsList", workLocationsList);
				modelAndViewObj.addObject("category", category);
				modelAndViewObj.addObject("subcategory", subCategory);
				modelAndViewObj.addObject("subCategoryDetailsList", subCategoryDetailsList);
				modelAndViewObj.addObject("categories", categoriesList);
				modelAndViewObj.addObject("zoneList", zoneList);
				modelAndViewObj.addObject("loc",location);
	  			modelAndViewObj.addObject("startdate", startDate);
				modelAndViewObj.addObject("enddate", endDate);
				modelAndViewObj.addObject("zone", zone);
				modelAndViewObj.addObject("selectedLocation", location);
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.addObject("searchName",searchCriteria);
				if(saveFlag)
				{
					if(WarehouseReportObj.getSalesReportFilePath()!=null)
					modelAndViewObj.addObject("downloadurl", WarehouseReportObj.getSalesReportFilePath());
				}
				modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/viewItemWiseGstReport");
			}
		
		catch(Exception exception){
			////////System.out.println(exception);
		}
	return modelAndViewObj;
	
		}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/viewOutletNewProfitabilityReport")
	public ModelAndView viewOutletNewProfitabilityReport(@RequestParam("flag") boolean flag,@RequestParam("supplierId") String supplierId,@RequestParam("section") String section,@RequestParam("subcategory") String subcategory,@RequestParam("brand") String brand,@RequestParam("startdate") String startdate,@RequestParam("enddate") String enddate,@RequestParam("zone") String zone,@RequestParam("productCategory") String productCategory,@RequestParam("location") String location,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,HttpServletRequest request,HttpServletResponse response){
		ArrayList<LocationBean> locationsList = new ArrayList<LocationBean>();;
		String customerIdStr = null,emailIdStr=null;
		try{
  			// log.info("viewOutletNotifications ");
  			int start = 1,end = Integer.parseInt(maxRecords);
  			customerIdStr = (String)request.getSession().getAttribute("customerId");
  			emailIdStr  = (String)request.getSession().getAttribute("emailId");
  			WarehouseReport  warehousereport = new WarehouseReport();
  			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, "", "",index,"","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
			if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
				categoryList = outletMasterServiceObj.getCategoryDetails("","", "","-1");
				request.getSession().setAttribute("categoryList", categoryList);
			}
			List<String> brandsList =(List<String>)request.getSession().getAttribute("brandsList");
			if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
				brandsList = adminServiceObj.getBrandNamesList("","");
				request.getSession().setAttribute("brandsList", brandsList);
			}
			List<ProductSubCategoryBean> subCategoryDetailsList =(List<ProductSubCategoryBean>)request.getSession().getAttribute("subCategoryDetailsList");
			if(subCategoryDetailsList==null || subCategoryDetailsList.size()==0 || subCategoryDetailsList.isEmpty()){
				subCategoryDetailsList = outletMasterServiceObj.getSubCategoryDetails("","", "","-1","",false);
				request.getSession().setAttribute("subCategoryDetailsList", subCategoryDetailsList);
			}
			List<Suppliers> supplierList =(List<Suppliers>)request.getSession().getAttribute("supplierList");
			if(supplierList==null || supplierList.size()==0 || supplierList.isEmpty()){
				 supplierList = outletMasterServiceObj.getSuppliers("", "","-1","","");
				request.getSession().setAttribute("supplierList", supplierList);
			}
			
			/*List<String> locationsList =(List<String>)request.getSession().getAttribute("locationsList");
			if(locationsList==null || locationsList.size()==0 || locationsList.isEmpty()){
				 locationsList = adminServiceObj.getOutletLocationsList("","",true);
				request.getSession().setAttribute("locationsList", locationsList);
			}*/
			
			//locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);

			if(zone == null || zone.trim().equals(""))
				locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			else
				locationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");
				
			
			
			//			Added by vijay, to make default loaction as location list first occurrence, if location is empty
			if((location.trim()).equals("") || location.trim().isEmpty())
			{
				location = locationsList.get(0).getLocationId();
			}
			
			if(startdate == null || startdate.equals("") )
			{
				startdate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			
			
			
  			warehousereport  = reportsServiceObj.getNewProfitabilityReport(index,maxRecords,zone,location,productCategory,subcategory,brand,startdate,enddate,searchNameStr,supplierId,section,flag);

  			modelAndViewObj = new ModelAndView();
  			if(warehousereport == null || warehousereport.getReportsList() == null){
  				modelAndViewObj.addObject("totalRecords","0");
  				modelAndViewObj.addObject("index", "0");
  				modelAndViewObj.addObject("totalValue", "0");
  			}else{
  				if(warehousereport.getReportsList().size()<Integer.parseInt(maxRecords)){
  					end = (warehousereport.getReportsList().size())+(Integer.parseInt(index));
  				}else{
  					end = (Integer.parseInt(index)+end);
  				}
  				modelAndViewObj.addObject("totalRecords", warehousereport.getTotalRecords());
  				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
  				modelAndViewObj.addObject("totalValue", end);
  			}
  			modelAndViewObj.addObject("startdate", startdate);
			modelAndViewObj.addObject("enddate", enddate);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("category", productCategory);
			modelAndViewObj.addObject("subcategory", subcategory);
			modelAndViewObj.addObject("brand", brand);
			modelAndViewObj.addObject("section", section);
			modelAndViewObj.addObject("maxRecords", maxRecords);
			modelAndViewObj.addObject("supplierId", supplierId);
  			modelAndViewObj.addObject("warehousereport", warehousereport);
  			if(flag)
			{
				if(warehousereport.getSalesReportFilePath()!=null)
				modelAndViewObj.addObject("downloadurl", warehousereport.getSalesReportFilePath());
			}
  			modelAndViewObj.setViewName("Reports/OutletReports/NewProfitabilityReport");
  		}
  		catch(Exception exception){
  			exception.printStackTrace();
  		}
  		return modelAndViewObj;
  	}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/viewWarehousesuppliereport")
	public ModelAndView viewWarehousesuppliereport(@RequestParam("supplierId") String supplierId,@RequestParam("subcategory") String subcategory,@RequestParam("brand") String brand,@RequestParam("startdate") String startdate,@RequestParam("enddate") String enddate,@RequestParam("zone") String zone,@RequestParam("productCategory") String productCategory,@RequestParam("location") String location,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,HttpServletRequest request,HttpServletResponse response){
  		try{
  			// log.info("viewOutletNotifications ");
  			int start = 1,end = Integer.parseInt(maxRecords);
  			WarehouseReport  warehousereport = new WarehouseReport();
  			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, "", "",index,"","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			List<String> locationsList =(List<String>)request.getSession().getAttribute("locationsList");
			if(locationsList==null || locationsList.size()==0 || locationsList.isEmpty()){
				locationsList = adminServiceObj.getWarehouseLocationsList("", "",true);
				request.getSession().setAttribute("locationsList", locationsList);
			}
			List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
			if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
				categoryList = outletMasterServiceObj.getCategoryDetails("","", "","-1");
				request.getSession().setAttribute("categoryList", categoryList);
			}
			List<String> brandsList =(List<String>)request.getSession().getAttribute("brandsList");
			if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
				brandsList = adminServiceObj.getBrandNamesList("","");
				request.getSession().setAttribute("brandsList", brandsList);
			}
			List<Suppliers> supplierList =(List<Suppliers>)request.getSession().getAttribute("supplierList");
			if(supplierList==null || supplierList.size()==0 || supplierList.isEmpty()){
				 supplierList = outletMasterServiceObj.getSuppliers("", "","-1","","");
				request.getSession().setAttribute("supplierList", supplierList);
			}

			
//			Added by vijay, to make default loaction as location list first occurrence, if location is empty
		
		if(locationsList!=null)
			if(location.trim().isEmpty()||(location.trim()).equals(""))
			{
				location = locationsList.get(0);
			}
			
		if(startdate == null || startdate.equals("") )
		{
			startdate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
		}
		
			
  			warehousereport  = reportsServiceObj.getSupplierReport(index,maxRecords,zone,location,productCategory,subcategory,brand,startdate,enddate,searchNameStr,supplierId);

			
  			modelAndViewObj = new ModelAndView();
  			if(warehousereport == null || warehousereport.getSuppliesReport() == null){
  				modelAndViewObj.addObject("totalRecords","0");
  				modelAndViewObj.addObject("index", "0");
  				modelAndViewObj.addObject("totalValue", "0");
  			}else{
  				if(warehousereport.getSuppliesReport().size()<Integer.parseInt(maxRecords)){
  					end = (warehousereport.getSuppliesReport().size())+(Integer.parseInt(index));
  				}else{
  					end = (Integer.parseInt(index)+end);
  				}
  				modelAndViewObj.addObject("totalRecords", warehousereport.getTotalRecords());
  				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
  				modelAndViewObj.addObject("totalValue", end);
  			}
  			modelAndViewObj.addObject("startdate", startdate);
			modelAndViewObj.addObject("enddate", enddate);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("category", productCategory);
			modelAndViewObj.addObject("subcategory", subcategory);
			modelAndViewObj.addObject("brand", brand);
			modelAndViewObj.addObject("supplierId", supplierId);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
  			modelAndViewObj.addObject("warehousereport", warehousereport);
  			modelAndViewObj.setViewName("Reports/WarehouseReports/suppliesReport");
  		}
  		catch(Exception exception){
  			exception.printStackTrace();
  		}
  		return modelAndViewObj;
  	}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/viewOutletsuppliereport")
	public ModelAndView viewOutletsuppliereport(@RequestParam("supplierId") String supplierId,@RequestParam("subcategory") String subcategory,@RequestParam("brand") String brand,@RequestParam("startdate") String startdate,@RequestParam("enddate") String enddate,@RequestParam("zone") String zone,@RequestParam("productCategory") String productCategory,@RequestParam("location") String location,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,@RequestParam("saveFlag") boolean saveFlag,@RequestParam("flow") String flow,HttpServletRequest request,HttpServletResponse response){
    ArrayList<LocationBean> locationsList = new ArrayList<LocationBean>();
    String customerIdStr = null,emailIdStr=null;
		try{
  			// log.info("viewOutletNotifications ");
  			//////////System.out.println("viewOutletNotifications");
  			customerIdStr = (String)request.getSession().getAttribute("customerId");
  			emailIdStr  = (String)request.getSession().getAttribute("emailId");
  			int start = 1,end = Integer.parseInt(maxRecords);
  			WarehouseReport  warehousereport = new WarehouseReport();
  			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, "", "",index,"","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
			if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
				categoryList = outletMasterServiceObj.getCategoryDetails("","", "","-1");
				request.getSession().setAttribute("categoryList", categoryList);
			}
			List<String> brandsList =(List<String>)request.getSession().getAttribute("brandsList");
			if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
				brandsList = adminServiceObj.getBrandNamesList("","");
				request.getSession().setAttribute("brandsList", brandsList);
			}
			List<Suppliers> supplierList =(List<Suppliers>)request.getSession().getAttribute("supplierList");
			if(supplierList==null || supplierList.size()==0 || supplierList.isEmpty()){
				 supplierList = outletMasterServiceObj.getSuppliers("", "","-1","","");
				request.getSession().setAttribute("supplierList", supplierList);
			}
			//locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			if(zone == null || zone.trim().equals("")){
				if(flow == "" || flow.equals("")){
					locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
					}else{
						locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
					}
			}else{
				
				if(flow == "" || flow.equals("")){
				locationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");
				}else{
					locationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Warehouse");
				}
			}
			
			//				List<String> locationsList = adminServiceObj.getOutletLocationsList("","",true);
//				request.getSession().setAttribute("locationsList", locationsList);
				
//				Added by vijay, to make default loaction as location list first occurrence, if location is empty
				if((location.trim()).equals("") || location.trim().isEmpty())
				{
					location = locationsList.get(0).getLocationId();
				}
				
				if(startdate == null || startdate.equals("") )
				{
					startdate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
				}
				
				
				warehousereport  = reportsServiceObj.getOutletSupplierReport(index,maxRecords,zone,location,productCategory,subcategory,brand,startdate,enddate,searchNameStr,supplierId,saveFlag);
	
  			modelAndViewObj = new ModelAndView();
  			if(warehousereport == null || warehousereport.getReportsList() == null){
  				modelAndViewObj.addObject("totalRecords","0");
  				modelAndViewObj.addObject("index", "0");
  				modelAndViewObj.addObject("totalValue", "0");
  			}else{
  				if(warehousereport.getReportsList().size()<Integer.parseInt(maxRecords)){
  					end = (warehousereport.getReportsList().size())+(Integer.parseInt(index));
  				}else{
  					end = (Integer.parseInt(index)+end);
  				}
  				modelAndViewObj.addObject("totalRecords", warehousereport.getTotalRecords());
  				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
  				modelAndViewObj.addObject("totalValue", end);
  			}
  			if(saveFlag){
				if(warehousereport.getSalesReportFilePath()!=null)
				modelAndViewObj.addObject("downloadurl",warehousereport.getSalesReportFilePath());
		//   ////////System.out.println((warehousereport.getSalesReportFilePath()));
				// log.info(warehousereport.getSalesReportFilePath());
			}
  			modelAndViewObj.addObject("startdate", startdate);
			modelAndViewObj.addObject("enddate", enddate);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("category", productCategory);
			modelAndViewObj.addObject("subcategory", subcategory);
			modelAndViewObj.addObject("brand", brand);
			modelAndViewObj.addObject("maxRecords", maxRecords);
			modelAndViewObj.addObject("supplierId", supplierId);
			modelAndViewObj.addObject("locationsList", locationsList);
  			modelAndViewObj.addObject("warehousereport", warehousereport);
  			 modelAndViewObj.addObject("flowLocation", flow);
  			modelAndViewObj.setViewName("Reports/OutletReports/ShipmentsvsSales");
  		}
  		catch(Exception exception){
  			exception.printStackTrace();
  		}
  		return modelAndViewObj;
  	}
	
	
	@RequestMapping("/viewOutletVoidReport")
	public ModelAndView viewOutletVoidReport(@RequestParam("flowUnder") String flowUnder, @RequestParam("maxRecords") String maxRecords, 
			@RequestParam("index") String index, @RequestParam("bussinessArea") String bussinessArea,
			@RequestParam("section") String section,@RequestParam("subDepartment") String subDepartment, 
			@RequestParam("location") String location,@RequestParam("zone") String zone,
			@RequestParam("startDate")String startDate,@RequestParam("endDate") String endDate, 
			@RequestParam("category") String category, @RequestParam("subCategory") String subCategory,			
			@RequestParam("department") String department, @RequestParam("searchCriteria") String searchCriteria,
			@RequestParam("searchVoidItems") String searchVoidItems,@RequestParam("flow") String flow,HttpServletRequest request,HttpServletResponse response)
			{
			WarehouseReport WarehouseReportObj = null;
			String locationStr = null,customerIdStr=null,emailIdStr=null;
			List<String> countersList = null;
			ArrayList<LocationBean> workLocationsList = new ArrayList<LocationBean>();
			WarehouseCounterResponse counterDetails = null;
			// log.info("Show Reports - Void Flow");
			try{
				customerIdStr = (String)request.getSession().getAttribute("customerId");
				emailIdStr = (String)request.getSession().getAttribute("emailId");
				modelAndViewObj = new ModelAndView();
//				workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			//	workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
				if(zone == null || zone.trim().equals("")){
					if(flow == "" || flow.equals("")){
						workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
						}else{
							workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
						}
				}else{
					if(flow == "" || flow.equals("")){
					workLocationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");
					}else{
						workLocationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Warehouse");
					}
				}
				locationStr = (String)request.getSession().getAttribute("selectedLocation");
				if(locationStr == null && workLocationsList != null && workLocationsList.size() > 0)
					locationStr = workLocationsList.get(0).getLocationId();
				
				if(flow == "" || flow.equals("")){
					countersList = reportsServiceObj.getCounters(locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
					}else{
					counterDetails = adminServiceObj.getWhCounters("",locationStr,customerIdStr,emailIdStr,index,false,"100");
					}
				
				//				String subCategoriesStr = masterServiceObj.getCategories(customerIdStr,emailIdStr);
				List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
				if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty())
				{
					 zoneList = genericMasterServiceObj.getZones(null, "", "","-1","","");
					request.getSession().setAttribute("zoneList", zoneList);
				}
				List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
				if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty())
				{
					categoryList = outletMasterServiceObj.getCategoryDetails("","", "","-1");
					request.getSession().setAttribute("categoryList", categoryList);
				}
				List<Department> departmentList =(List<Department>)request.getSession().getAttribute("departmentList");
				if(departmentList==null || departmentList.size()==0 || departmentList.isEmpty())
				{
					departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerIdStr, emailIdStr,"-1",false);
					request.getSession().setAttribute("departmentList", departmentList);
				}
				
				//List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
				ArrayList<String> categoriesList = new ArrayList<String>();
				if(categoryList != null)
					for(ProductCategoryBean productCategoryBean : categoryList)
						categoriesList.add(productCategoryBean.getCategoryDescription());
//				ArrayList<String> categoriesList = masterServiceObj.getCategoriesList(subCategoriesStr);
				//countersList = reportsServiceObj.getCounters(locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
				
				
//				Added by vijay, to make default loaction as location list first occurrence, if location is empty
				if((location.trim()).equals(null) || location.trim().isEmpty())
				{
					location = workLocationsList.get(0).getLocationId();
				}
				
					
				if(startDate == null || startDate.equals("") )
				{
					startDate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
				}
				
				if(endDate == null || endDate.equals("") ){
					endDate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
				}
				
					modelAndViewObj = new ModelAndView();
					
						WarehouseReportObj = reportsServiceObj.getSaleVoidItemsReport(index,maxRecords,bussinessArea,zone,category,subCategory,department,subDepartment,section,location,startDate,endDate,searchCriteria,searchVoidItems);
					
					
					int start = 1,end = Integer.parseInt(maxRecords);
					if(WarehouseReportObj == null || WarehouseReportObj.getReportsList() == null)
					{
						modelAndViewObj.addObject("totalRecords","0");
						modelAndViewObj.addObject("index", "0");
						modelAndViewObj.addObject("totalValue", "0");
					}
					else
					{
						if(WarehouseReportObj.getReportsList().size()<Integer.parseInt(maxRecords)){
		  					end = (WarehouseReportObj.getReportsList().size())+(Integer.parseInt(index));
		  				}
						else{
		  					end = (Integer.parseInt(index)+end);
		  									
						}
						modelAndViewObj.addObject("totalRecords", WarehouseReportObj.getTotalRecords());
						modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
						modelAndViewObj.addObject("totalValue",end );
						
						//////////System.out.println("totolrec:"+ WarehouseReportObj.getTotalRecords()+ " Index:"+(Integer.parseInt(index)+start)+" totol Value"+end+" max rec"+maxRecords);
						
						
					}
					//////////System.out.println("totolrec:"+ WarehouseReportObj.getTotalRecords()+ " Index:"+(Integer.parseInt(index)+start)+" totol Value"+end+" max rec"+maxRecords);

				
					
					modelAndViewObj.addObject("WarehouseReportObj", WarehouseReportObj);
					modelAndViewObj.addObject("countersList", countersList);
					modelAndViewObj.addObject("workLocationsList", workLocationsList);
					modelAndViewObj.addObject("category", category);
					modelAndViewObj.addObject("counterDetails", counterDetails);
					 modelAndViewObj.addObject("flowLocation", flow);
					
					modelAndViewObj.addObject("categories", categoriesList);
					modelAndViewObj.addObject("zoneList", zoneList);
					modelAndViewObj.addObject("loc",location);
		  			modelAndViewObj.addObject("startdate", startDate);
					modelAndViewObj.addObject("enddate", endDate);
					modelAndViewObj.addObject("zone", zone);
					modelAndViewObj.addObject("selectedLocation", location);
					modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
					modelAndViewObj.addObject("searchVoidItems",searchVoidItems);
					
					modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/VoidReports");
				}
			
			catch(SocketTimeoutException exception){
				modelAndViewObj.addObject("err", "timeout Exception");
				modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/VoidReports");
			}
			catch(Exception exception){
				////////System.out.println(exception);
			}
		return modelAndViewObj;
		
			}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/viewPriceVariationreport")
	public ModelAndView viewPriceVariationreport(@RequestParam("subcategory") String subcategory,@RequestParam("brand") String brand,@RequestParam("startdate") String startdate,@RequestParam("enddate") String enddate,@RequestParam("zone") String zone,@RequestParam("productCategory") String productCategory,@RequestParam("location") String location,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,HttpServletRequest request,HttpServletResponse response){
  		try{
  			// log.info("viewOutletNotifications ");
  			int start = 1,end = Integer.parseInt(maxRecords);
  			WarehouseReport  warehousereport = new WarehouseReport();
  			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, "", "",index,"","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
			if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
				categoryList = outletMasterServiceObj.getCategoryDetails("","", "","-1");
				request.getSession().setAttribute("categoryList", categoryList);
			}
			List<String> locationsList =(List<String>)request.getSession().getAttribute("locationsList");
			if(locationsList==null || locationsList.size()==0 || locationsList.isEmpty()){
				locationsList = adminServiceObj.getWarehouseLocationsList("", "",true);
				request.getSession().setAttribute("locationsList", locationsList);
			}
			List<String> brandsList =(List<String>)request.getSession().getAttribute("brandsList");
			if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
				brandsList = adminServiceObj.getBrandNamesList("","");
				request.getSession().setAttribute("brandsList", brandsList);
			}
			
			
//			Added by vijay, to make default loaction as location list first occurrence, if location is empty
			if((location.trim()).equals("") || location.trim().isEmpty())
			{
				location = locationsList.get(0);
			}
			if(startdate == null || startdate.equals("") )
			{
				startdate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			
			
  			warehousereport  = reportsServiceObj.getPriceVariatonReport(index,maxRecords,zone,location,productCategory,subcategory,brand,startdate,enddate,searchNameStr);

  			modelAndViewObj = new ModelAndView();
  			if(warehousereport == null || warehousereport.getWarehouseReportList() == null){
  				modelAndViewObj.addObject("totalRecords","0");
  				modelAndViewObj.addObject("index", "1");
  				modelAndViewObj.addObject("totalValue", "0");
  			}else{
  				if(warehousereport.getWarehouseReportList().size()<Integer.parseInt(maxRecords)){
  					end = (warehousereport.getWarehouseReportList().size())+(Integer.parseInt(index));
  				}else{
  					end = (Integer.parseInt(index)+end);
  				}
  				modelAndViewObj.addObject("totalRecords", warehousereport.getTotalRecords());
  				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
  				modelAndViewObj.addObject("totalValue", end);
  			}
  			modelAndViewObj.addObject("startdate", startdate);
			modelAndViewObj.addObject("enddate", enddate);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("category", productCategory);
			modelAndViewObj.addObject("subcategory", subcategory);
			modelAndViewObj.addObject("brand", brand);
  			modelAndViewObj.addObject("warehousereport", warehousereport);
  			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
  			modelAndViewObj.setViewName("Reports/WarehouseReports/pricevariation");
  		}
  		catch(Exception exception){
  			exception.printStackTrace();
  		}
  		return modelAndViewObj;
  	}
	
	
	
	
	
	
	
	/**
	 * 
	 * @author Manasa
	 * 
	 *This method is used to display outlet 'priceOverride'  report details.
	 *
	 **/
@RequestMapping("/viewOutletNewReport")
	public ModelAndView viewOutletNewReport(@RequestParam("department") String department,@RequestParam("subcategory") String subcategory,@RequestParam("brand") String brand,@RequestParam("startdate") String startdate,@RequestParam("enddate") String enddate,@RequestParam("zone") String zone,@RequestParam("productCategory") String productCategory,@RequestParam("location") String location,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,@RequestParam("saveFlag") boolean saveFlag,@RequestParam("flow") String flow,HttpServletRequest request,HttpServletResponse response){
	String customerIdStr = null,emailIdStr=null;
	ArrayList<LocationBean> locationsList = new ArrayList<LocationBean>();
	try{
			// log.info("Show Reports Flows");
			int start = 1,end = Integer.parseInt(maxRecords);
			modelAndViewObj = new ModelAndView();
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			WarehouseReport  warehousereport = new WarehouseReport();
  			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, "", "",index,"","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
			if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
				categoryList = outletMasterServiceObj.getCategoryDetails("","", "","-1");
				request.getSession().setAttribute("categoryList", categoryList);
			}
			
		// locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
//				 genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
		/*	List<String> locationsList =(List<String>)request.getSession().getAttribute("locationsList");
			if(locationsList==null || locationsList.size()==0 || locationsList.isEmpty()){
				locationsList = adminServiceObj.getOutletLocationsList("","",true);
				request.getSession().setAttribute("locationsList", locationsList);
			}*/
			
			if(zone == null || zone.trim().equals("")){
				if(flow == "" || flow.equals("")){
					locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
					}else{
						locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
					}
				
			}else{
				if(flow == "" || flow.equals("")){
				locationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");
				}else{
					locationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Warehouse");
				}
			}
			List<String> brandsList =(List<String>)request.getSession().getAttribute("brandsList");
			if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
				brandsList = adminServiceObj.getBrandNamesList("","");
				request.getSession().setAttribute("brandsList", brandsList);
			}
			
			
//			Added by vijay, to make default loaction as location list first occurrence, if location is empty
			if((location.trim()).equals("") || location.trim().isEmpty())
			{
				
			}
			if(startdate == null || startdate.equals("") )
			{
				startdate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			if(enddate == null || enddate.equals("") ){
				enddate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			
  			warehousereport  = reportsServiceObj.getPriceOverrideReport(index,maxRecords,zone,location,productCategory,subcategory,brand,startdate,enddate,searchNameStr,saveFlag,department);

			
  			modelAndViewObj = new ModelAndView();
  			if(warehousereport == null || warehousereport.getReportsList() == null){
  				modelAndViewObj.addObject("totalRecords","0");
  				modelAndViewObj.addObject("index", "1");
  				modelAndViewObj.addObject("totalValue", "0");
  			}else{
  				if(warehousereport.getReportsList().size()<Integer.parseInt(maxRecords)){
  					end = (warehousereport.getReportsList().size())+(Integer.parseInt(index));
  				}else{
  					end = (Integer.parseInt(index)+end);
  				}
  				modelAndViewObj.addObject("totalRecords", warehousereport.getTotalRecords());
  				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
  				modelAndViewObj.addObject("totalValue", end);
  			}
  			if(saveFlag){
				if(warehousereport.getSalesReportFilePath()!=null)
				modelAndViewObj.addObject("downloadurl",warehousereport.getSalesReportFilePath());
		  // ////////System.out.println((warehousereport.getSalesReportFilePath()));
				// log.info(warehousereport.getSalesReportFilePath());
			}
  			modelAndViewObj.addObject("startdate", startdate);
			modelAndViewObj.addObject("enddate", enddate);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("maxRecords", maxRecords);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("department", department);
			modelAndViewObj.addObject("category", productCategory);
			modelAndViewObj.addObject("subcategory", subcategory);
			modelAndViewObj.addObject("brand", brand);
  			modelAndViewObj.addObject("warehousereport", warehousereport);
  			 modelAndViewObj.addObject("flowLocation", flow);
			modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/NewReport");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
		}
	
	
	
	
	
  /*	author : chaithanya
  	date :25th April
  	Purpose :to compare the procurement and consumption of a warehouse products*/
	@SuppressWarnings("unchecked")
	@RequestMapping("/viewProcurementConsumptionreport")
  	public ModelAndView viewProcurementConsumptionreport(@RequestParam("flag") boolean flag,@RequestParam("subcategory") String subcategory,@RequestParam("brand") String brand,@RequestParam("startdate") String startdate,@RequestParam("enddate") String enddate,@RequestParam("zone") String zone,@RequestParam("productCategory") String productCategory,@RequestParam("location") String location,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,HttpServletRequest request,HttpServletResponse response){
  		try{
  			// log.info("viewOutletNotifications ");
  			int start = 1,end = Integer.parseInt(maxRecords);
  			WarehouseReport  warehousereport = new WarehouseReport();
  			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, "", "",index,"","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			
			List<String> locationsList =(List<String>)request.getSession().getAttribute("locationsList");
			if(locationsList==null || locationsList.size()==0 || locationsList.isEmpty()){
				locationsList = adminServiceObj.getWarehouseLocationsList("", "",true);
				request.getSession().setAttribute("locationsList", locationsList);
			}
			
			List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
			if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
				categoryList = outletMasterServiceObj.getCategoryDetails("","", "","-1");
				request.getSession().setAttribute("categoryList", categoryList);
			}
			List<String> brandsList =(List<String>)request.getSession().getAttribute("brandsList");
			if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
				brandsList = adminServiceObj.getBrandNamesList("","");
				request.getSession().setAttribute("brandsList", brandsList);
			}

			
			
//			Added by vijay, to make default loaction as location list first occurrence, if location is empty
			if((location.trim()).equals("") || location.trim().isEmpty())
			{
				location = locationsList.get(0);
			}
			
			if(startdate == null || startdate.equals("") )
			{
				startdate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			
			warehousereport  = reportsServiceObj.getprocurementconsumption(index,maxRecords,zone,location,productCategory,subcategory,brand,startdate,enddate,searchNameStr,flag);

			
  			modelAndViewObj = new ModelAndView();
  			if(warehousereport == null || warehousereport.getWarehouseReportList() == null){
  				modelAndViewObj.addObject("totalRecords","0");
  				modelAndViewObj.addObject("index", "0");
  				modelAndViewObj.addObject("totalValue", "0");
  			}else{
  				if(warehousereport.getWarehouseReportList().size()<Integer.parseInt(maxRecords)){
  					end = (warehousereport.getWarehouseReportList().size())+(Integer.parseInt(index));
  				}else{
  					end = (Integer.parseInt(index)+end);
  				}
  				modelAndViewObj.addObject("totalRecords", warehousereport.getTotalRecords());
  				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
  				modelAndViewObj.addObject("totalValue", end);
  			}
  			modelAndViewObj.addObject("startdate", startdate);
			modelAndViewObj.addObject("enddate", enddate);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("category", productCategory);
			modelAndViewObj.addObject("subcategory", subcategory);
			modelAndViewObj.addObject("brand", brand);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
  			modelAndViewObj.addObject("warehousereport", warehousereport);
  			if(flag)
			{
				if(warehousereport.getSalesReportFilePath()!=null)
				modelAndViewObj.addObject("downloadurl", warehousereport.getSalesReportFilePath());
			}
  			modelAndViewObj.setViewName("Reports/WarehouseReports/procurementConsumption");
  		}
  		catch(Exception exception){
  			exception.printStackTrace();
  		}
  		return modelAndViewObj;
  	}
  	
  	@RequestMapping("/viewWarehousesupplies")
  	public ModelAndView viewWarehousesupplies(HttpServletRequest request,HttpServletResponse response){
  		try{
  			// log.info("viewOutletNotifications ");
  			int start = 1,end = 10;
  			//List<MessageBoard> messageBoardList = outletNotificataionServiceObj.getMessageBoards(customerIdStr, emailIdStr,index);
  			modelAndViewObj = new ModelAndView();
  			/*if(messageBoardList == null){
  				modelAndViewObj.addObject("totalRecords","0");
  				modelAndViewObj.addObject("index", "0");
  				modelAndViewObj.addObject("totalValue", "0");
  			}else{
  				if(messageBoardList.size()<10){
  					end = (messageBoardList.size())+(Integer.parseInt(index));
  				}else{
  					end = (Integer.parseInt(index)+end);
  				}
  				modelAndViewObj.addObject("totalRecords", Integer.parseInt(messageBoardList.get(0).getTotalRecords()));
  				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
  				modelAndViewObj.addObject("totalValue", end);
  			}
  			modelAndViewObj.addObject("messageBoardList", messageBoardList);*/
  			modelAndViewObj.setViewName("Reports/WarehouseReports/supplies");
  		}
  		catch(Exception exception){
  			exception.printStackTrace();
  		}
  		return modelAndViewObj;
  	}
  	
	@RequestMapping("/viewDueCollectionReports")
	public ModelAndView viewDueCollectionReports(@RequestParam("criteria")String criteria,@RequestParam("maxRecords") String maxRecords, @RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,@RequestParam("flow") String flow,
			HttpServletRequest request,HttpServletResponse response){
		// log.info("viewDueCollectionReports");
//		List<String> workLocationsList = null;
		ArrayList<LocationBean> workLocationsList = null;
		String locationStr = null,customerIdStr=null,emailIdStr=null;
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			
			if(flow == "" || flow.equals("")){
				workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
				}else{
					workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
				}
			//workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
//			workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			locationStr = (String)request.getSession().getAttribute("selectedLocation");
//			if(locationStr == null && workLocationsList != null && workLocationsList.size() > 0)
//				locationStr = workLocationsList.get(0);
//			
			
//			Added by vijay, to make default loaction as location list first occurrence, if location is empty
			if(locationStr == null && workLocationsList != null && workLocationsList.size() > 0)
			//if(((locationStr).equals("") || locationStr.isEmpty()) && workLocationsList.size()>0)
			{
				locationStr = workLocationsList.get(0).getLocationId();
			}
			
			
			List<BillingTransactions> transactionsList = reportsServiceObj.generateDueCollections(customerIdStr, emailIdStr,locationStr, "","startDate", "endDate","10",criteria,"0",false,null,null);
			int start = 1,end = Integer.parseInt(maxRecords);
			if(transactionsList == null || transactionsList.size() == 0)
			{
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
				
				modelAndViewObj.addObject("startDate", startDate);
				modelAndViewObj.addObject("endDate", endDate);
				
				
			}
			else
			{
				if(transactionsList.size()<end)
					end = (transactionsList.size());
				
				modelAndViewObj.addObject("totalRecords", transactionsList.get(0).getTotalRecords());
				modelAndViewObj.addObject("index", start);
				modelAndViewObj.addObject("totalValue", end + start);
			}
			modelAndViewObj.addObject("maxRecords", maxRecords);
			modelAndViewObj.addObject("criteria", criteria);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("transactionsList",transactionsList);
			 modelAndViewObj.addObject("flowLocation", flow);
			modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/dueCollectionReport");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
		}
	
	
	@RequestMapping("/generateDueCollectionReport")
	public ModelAndView generateDueCollectionReport(@RequestParam("location") String locationStr,@RequestParam("startDate") String startDateStr,@RequestParam("endDate") String endDateStr,@RequestParam("customer") String customer,
			@RequestParam("maxRecords") String maxRecordsStr,@RequestParam("criteria") String criteriaStr,@RequestParam("index") String indexStr,@RequestParam("order")String order,
			@RequestParam("orderBy")String orderBy,@RequestParam("saveFlag") boolean saveFlag,@RequestParam("flow") String flow,HttpServletRequest request,HttpServletResponse response){
		String customerIdStr=null,emailIdStr=null;
		List<String> workLocationsList =null;
		try{
			// log.info("generateDueCollectionReport");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			if(startDateStr == null || startDateStr.equals("") )
			{
				startDateStr = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			
			List<BillingTransactions> transactionsList = reportsServiceObj.generateDueCollections(customerIdStr, emailIdStr,locationStr, customer,startDateStr, endDateStr,maxRecordsStr,criteriaStr,indexStr,saveFlag,order,orderBy);
			int start = 1,end = 10;
			if(transactionsList == null || transactionsList.size() == 0)
			{
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}
			else
			{
				if(transactionsList.size()<10)
					end = (transactionsList.size());
				modelAndViewObj.addObject("totalRecords", transactionsList.get(0).getTotalRecords());
				modelAndViewObj.addObject("index", start);
				modelAndViewObj.addObject("totalValue", end);
			}
			if(saveFlag){
				if(transactionsList.get(0).getSalesReportFilePath() != null)
				modelAndViewObj.addObject("downloadurl",transactionsList.get(0).getSalesReportFilePath());
		   // log.info(transactionsList.get(0).getSalesReportFilePath());
			}
			modelAndViewObj.addObject("maxRecords", 10);
			modelAndViewObj.addObject("criteria", criteriaStr);
			if(flow == "" || flow.equals("")){
				
				workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			}else{
				workLocationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr,emailIdStr,true);

			}
			
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("transactionsList",transactionsList);
			 modelAndViewObj.addObject("flowLocation", flow);
			modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/viewDueCollections");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	@RequestMapping("/viewCreditSalesReports")
	public ModelAndView viewCreditSalesReports(@RequestParam("criteria")String criteria,@RequestParam("maxRecords")String maxRecords,@RequestParam("flow") String flow, HttpServletRequest request,HttpServletResponse response){
		// log.info("viewCreditSalesReports");
//		List<String> workLocationsList = null;
		ArrayList<LocationBean> workLocationsList = null;
		String locationStr = null,customerIdStr=null,emailIdStr=null;
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
            
			if(flow == "" || flow.equals("")){
				workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
				}else{
					workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
				}
			
			//workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			/*workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);*/
			locationStr = (String)request.getSession().getAttribute("selectedLocation");
			if(locationStr == null && workLocationsList != null && workLocationsList.size() > 0)
				locationStr = workLocationsList.get(0).getLocationId();
			List<Billing> billsList = reportsServiceObj.generateCreditSales(customerIdStr, emailIdStr,locationStr, "","", "","10",criteria,"0",false,null,null);
			int start = 1,end = Integer.parseInt(maxRecords);
			if(billsList == null || billsList.size() == 0)
			{
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}
			else
			{
				
				if(billsList.size()<end){
					end = (billsList.size());
				}else{
					end = start+end;
				}
				
				
				modelAndViewObj.addObject("totalRecords", billsList.get(0).getTotalRecords());
				modelAndViewObj.addObject("index", start);
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("maxRecords", maxRecords);
			modelAndViewObj.addObject("criteria", criteria);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("billsList",billsList);
			 modelAndViewObj.addObject("flowLocation", flow);
			modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/creditSalesReport");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
		}
	
	@RequestMapping("/generateCreditSalesReport")
	public ModelAndView generateCreditSalesReport(@RequestParam("location") String locationStr,@RequestParam("startDate") String startDateStr,@RequestParam("endDate") String endDateStr,@RequestParam("customer") String customer,
			@RequestParam("maxRecords") String maxRecordsStr,@RequestParam("criteria") String criteriaStr,@RequestParam("index") String indexStr,@RequestParam("order")String order,
			@RequestParam("orderBy")String orderBy,@RequestParam("saveFlag") boolean saveFlag,@RequestParam("flow") String flow,HttpServletRequest request,HttpServletResponse response){
		String customerIdStr=null,emailIdStr=null;
		List<String> workLocationsList = null;
		try{
			// log.info("generateCreditSalesReport");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			
			if(startDateStr == null || startDateStr.equals("") )
			{
				startDateStr = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			
			
			
			List<Billing> billsList = reportsServiceObj.generateCreditSales(customerIdStr, emailIdStr,locationStr, customer,startDateStr, endDateStr,maxRecordsStr,criteriaStr,indexStr,saveFlag,order,orderBy);
			int start = 1,end = 10;
			if(billsList == null || billsList.size() == 0)
			{
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}
			else
			{
				if(billsList.size()<10)
					end = (billsList.size());
				modelAndViewObj.addObject("totalRecords", billsList.get(0).getTotalRecords());
				modelAndViewObj.addObject("index", start);
				modelAndViewObj.addObject("totalValue", end);
			}
			if(saveFlag){
				if(billsList.get(0).getSalesReportFilePath() != null)
				modelAndViewObj.addObject("downloadurl",billsList.get(0).getSalesReportFilePath());
		   // log.info(billsList.get(0).getSalesReportFilePath());
			}


			modelAndViewObj.addObject("maxRecords", 10);
			modelAndViewObj.addObject("criteria", criteriaStr);
            if(flow == "" || flow.equals("")){
				
				workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			}else{
				workLocationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr,emailIdStr,true);

			}
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("billsList",billsList);
			 modelAndViewObj.addObject("flowLocation", flow);
			
			modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/viewCreditSales");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 6-oct-2015
	 * 
	 * This method is used to display the stock verification report.
	 * It accepts location, and retrieves all stocks verified in that location.
	 * It returns the stockVerificationReport JSP.
	 *
	 **/
	@RequestMapping("/viewOutletStockVerificationReport")
	public ModelAndView viewOutletStockVerificationReport(@RequestParam("index")String index,@RequestParam("location")String locationStr,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
//		List<String> locationsList = null;
		List<VerificationDetails> verificationDetailsList = null;
		try{
			// log.info("viewOutletStockVerificationReport");
			int start = 1,end = 10;
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			ArrayList<LocationBean>	locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
//			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			modelAndViewObj = new ModelAndView();
			if(locationStr == "" || locationStr == null)
				locationStr = (String)request.getSession().getAttribute("selectedLocation");
			/*if((locationStr == null && locationsList==null) || locationsList.size()==0)
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			else{*/
				modelAndViewObj.addObject("locationsList", locationsList);
				if(locationStr == null && locationsList != null && locationsList.size()>0)
					locationStr = locationsList.get(0).getLocationId();
				
				verificationDetailsList = reportsServiceObj.getStockVerification(customerIdStr, emailIdStr, index, locationStr);
				modelAndViewObj.addObject("selectedLocation", locationStr);
				request.getSession().setAttribute("selectedLocation",locationStr);
				if(verificationDetailsList == null){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(verificationDetailsList.size()<10){
						end = (verificationDetailsList.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(verificationDetailsList.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
				}
				modelAndViewObj.addObject("verificationDetailsList",verificationDetailsList);
//			}
				modelAndViewObj.addObject("maxRecords",10);
			modelAndViewObj.setViewName("Reports/OutletReports/stockVerificationReport");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err", AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Reports/OutletReports/stockVerificationReport");
		}
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Sahitya
	 * 
	 *This method is used to display outlet 'X' reading report GUI
	 *
	 **/
	@RequestMapping(value="/viewOutletXReadingReport" ,method=RequestMethod.POST,consumes="application/json") 
	public ModelAndView viewOutletXReadingReport(@RequestBody Reports reportObj,HttpServletRequest request,HttpServletResponse response){
		// log.info("View Outlet 'X' Reading Report Flows");
		int start = 1,end = 10; String index=reportObj.getStartIndex();
		ArrayList<LocationBean> workLocationsList = new ArrayList<LocationBean>();
		List<String> countersList = null;
		String locationListAll="";
		List<Integer> shiftsIdsList = null;
		String locationStr = null,customerIdStr=null,emailIdStr=null;
		List<ZoneMaster> zonList = null;
		WarehouseCounterResponse counterDetails = null;
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");

			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"0","","");
				request.getSession().setAttribute("zoneList", zoneList);
			}

			//			workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			//			workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);

			if(reportObj.getZone() == null || reportObj.getZone().equals("")){
				if(reportObj.getFlow() == "" || reportObj.getFlow().equals("")){
				workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
				}else{
					workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
				}
				
				
				}else
			{
				if(reportObj.getFlow() == "" || reportObj.getFlow().equals("")){
				 zonList = genericMasterServiceObj.getZonalLocationBasedonZone(reportObj.getZone(), customerIdStr, emailIdStr, "0","","","Retail Outlet");
				}else{
			     zonList = genericMasterServiceObj.getZonalLocationBasedonZone(reportObj.getZone(), customerIdStr, emailIdStr, "0","","","Warehouse");

				}
				
				LocationBean saleLocation = null;
				/*if(zoneList != null && zoneList.get(0).getZoneDetails() != null && zoneList.get(0).getZoneDetails().size()>0)
						for(ZoneDetails zoneItems : zoneList.get(0).getZoneDetails() )
						{
							saleLocation = new LocationBean(); 
							saleLocation.setLocationId(zoneItems.getLocation());
							locationBeansList.add(saleLocation);
						}
					else*/
				for(String zoneItems : zonList.get(0).getZones() )
				{
					String zoneArray[] = zoneItems.split("\\+");
					saleLocation = new LocationBean(); 
					if(zoneArray != null && zoneArray.length>0)
					{
						saleLocation.setLocationId(zoneArray[0]);
						if(zoneArray.length > 1)
							saleLocation.setBusinessActivity(zoneArray[1]);
						if(zoneArray.length > 2)
							saleLocation.setDescription(zoneArray[2]);
						workLocationsList.add(saleLocation);
					} 
				}

			}




			locationStr = reportObj.getLocation();
			List<String> locationsListValue=new ArrayList<String>();
			if( locationStr.equals("all") || locationStr == "")
			{
				//				locationStr = workLocationsList.get(0);
				if(workLocationsList != null && !workLocationsList.isEmpty())
					if(reportObj.getZone() ==""){
						for(int i=0;i<workLocationsList.size();i++){
							locationsListValue.add(workLocationsList.get(i).getLocationId());
						}
					}
					else
					{
						locationsListValue.add(reportObj.getLocationList());
					}

				for (String string : locationsListValue) {

					locationListAll = locationListAll+string+",";
				}
				List<String> myList = new ArrayList<String>(Arrays.asList(locationListAll.split(",")));
				reportObj.setLocationsList(myList);
				reportObj.setLocationList(null);
			}
			else
			{
				reportObj.setLocation(reportObj.getLocation());
				reportObj.setLocationList(null);
			}



			//			if(workLocationsList != null && workLocationsList.size()>0)
			//				locationStr = workLocationsList.get(0);

			if(reportObj.getStartDateStr().equals(null) || reportObj.getStartDateStr().equals("") )
			{
				reportObj.setStartDateStr(DateUtil.getCurrentDateInFormat("dd/MM/yyyy"));
				//				////////System.out.println(reportObj.getStartDateStr());
			}



			Reports reports=	reportsServiceObj.getOutletXZReports(reportObj,customerIdStr,emailIdStr);



			if(reportObj.getFlow() == "" || reportObj.getFlow().equals("")){
			countersList = reportsServiceObj.getCounters(locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
			}else{
			counterDetails = adminServiceObj.getWhCounters("",locationStr,customerIdStr,emailIdStr,index,false,"100");
			}
			
			shiftsIdsList = reportsServiceObj.getShiftsIdsList(Constants.PAGINATION_START_INDEX, customerIdStr, emailIdStr, locationStr);
			modelAndViewObj = new ModelAndView();

			if(reports == null ){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(reports.getReportsList().size()<10){
					end = (reports.getReportsList().size())+(Integer.parseInt(index));
				}else{
					end = (reports.getReportsList().size())+(Integer.parseInt(index));
				}
				modelAndViewObj.addObject("totalRecords", reports.getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}

			//			if(reportObj.getZone() != null && !reportObj.getZone().trim().equals(""))

			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("shiftsIdsList", shiftsIdsList);
			modelAndViewObj.addObject("countersList", countersList);
			modelAndViewObj.addObject("counterDetails", counterDetails);
			 modelAndViewObj.addObject("flowLocation", reportObj.getFlow());
			modelAndViewObj.addObject("reports",reports);
			modelAndViewObj.addObject("selectedLocation",reportObj.getLocation());
			modelAndViewObj.addObject("zone",reportObj.getZone());
			modelAndViewObj.addObject("startdate",reportObj.getStartDateStr());
			modelAndViewObj.addObject("enddate",reportObj.getEndDateStr());
			modelAndViewObj.addObject("maxRecords",reportObj.getMaxRecords());

			modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/viewOutletXReport");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	
	/**
	 * 
	 * @author Sahitya
	 * 
	 *This method is used to display outlet 'Z' reading report GUI
	 *
	 **/
	@RequestMapping(value="/viewOutletZReadingReport",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView viewOutletZReadingReport(@RequestBody Reports reportObj,/*@RequestParam("index") String index,@RequestParam("reportType") String reportType,*/HttpServletRequest request,HttpServletResponse response){
		// log.info("View Outlet 'Z' Reading Report Flows");
		ArrayList<LocationBean> workLocationsList = new ArrayList<LocationBean> ();
		int start = 1,end = Integer.parseInt(reportObj.getMaxRecords());
		String index=reportObj.getStartIndex();
		String locationListAll="";
		List<String> countersList = null;
		List<ZoneMaster> zoneList = null;
		WarehouseCounterResponse counterDetails = null;
		
		String locationStr = null,customerIdStr=null,emailIdStr=null;
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
//			workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			//workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			
			if(reportObj.getZone() == null || reportObj.getZone().equals("")){
				if(reportObj.getFlow() == "" || reportObj.getFlow().equals("")){
					workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
					}else{
						workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
					}
				
			}else
				{

				if(reportObj.getFlow() == "" || reportObj.getFlow().equals("")){
					 zoneList = genericMasterServiceObj.getZonalLocationBasedonZone(reportObj.getZone(), customerIdStr, emailIdStr, "0","","","Retail Outlet");
					}else{
				     zoneList = genericMasterServiceObj.getZonalLocationBasedonZone(reportObj.getZone(), customerIdStr, emailIdStr, "0","","","Warehouse");

					}
				
				LocationBean saleLocation = null;
					/*if(zoneList != null && zoneList.get(0).getZoneDetails() != null && zoneList.get(0).getZoneDetails().size()>0)
						for(ZoneDetails zoneItems : zoneList.get(0).getZoneDetails() )
						{
							saleLocation = new LocationBean(); 
							saleLocation.setLocationId(zoneItems.getLocation());
							locationBeansList.add(saleLocation);
						}
					else*/
					for(String zoneItems : zoneList.get(0).getZones() )
					{
						String zoneArray[] = zoneItems.split("\\+");
						saleLocation = new LocationBean(); 
						if(zoneArray != null && zoneArray.length>0)
						{
							saleLocation.setLocationId(zoneArray[0]);
							if(zoneArray.length > 1)
							saleLocation.setBusinessActivity(zoneArray[1]);
							if(zoneArray.length > 2)
							saleLocation.setDescription(zoneArray[2]);
							workLocationsList.add(saleLocation);
						} 
					}
				
				}
			
			
			
			locationStr=reportObj.getLocation();
//			if(workLocationsList != null && workLocationsList.size()>0)
//				locationStr = workLocationsList.get(0).getLocationId();
			
			if(reportObj.getFlow() == "" || reportObj.getFlow().equals("")){
				countersList = reportsServiceObj.getCounters(locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
				}else{
				counterDetails = adminServiceObj.getWhCounters("",locationStr,customerIdStr,emailIdStr,index,false,"100");
				}
			zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
/*				 zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"0");*/
				request.getSession().setAttribute("zoneList", zoneList);
			}
			
//			locationStr = reportObj.getLocation();
//			Added by vijay, to make default location as location list first occurrence, if location is empty
//			if(locationStr.isEmpty()||locationStr.equals(""))
//			{
////				locationStr = workLocationsList.get(0);
//				reportObj.setLocation( workLocationsList.get(0));
//				
//			}
//			
			 List<String> locationsListValue=new ArrayList<String>();	
			if(locationStr == "" || locationStr.equals("all"))
			{
//				locationStr = workLocationsList.get(0);
				if(workLocationsList != null && !workLocationsList.isEmpty())
					if(reportObj.getZone() ==""){
						for(int i=0;i<workLocationsList.size();i++){
							locationsListValue.add(workLocationsList.get(i).getLocationId());
						}
						}
						else
						{
							locationsListValue.add(reportObj.getLocationList());
						}
                 for (String string : locationsListValue) {
					locationListAll = locationListAll+string+",";
				}
				List<String> myList = new ArrayList<String>(Arrays.asList(locationListAll.split(",")));
					reportObj.setLocationsList(myList);
					reportObj.setLocationList(null);
			}
			else
			{
				reportObj.setLocation(reportObj.getLocation());
				reportObj.setLocationList(null);
			}
			
			if(reportObj.getStartDateStr().equals(null) || reportObj.getStartDateStr().equals("") )
			{
				reportObj.setStartDateStr(DateUtil.getCurrentDateInFormat("dd/MM/yyyy"));
			}
			
			
			Reports reports=	reportsServiceObj.getOutletXZReports(reportObj,customerIdStr,emailIdStr);
			
			
			
			modelAndViewObj = new ModelAndView();
			
			if(reports == null ){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(reports.getReportsList().size()<end){
					end = (reports.getReportsList().size())+(Integer.parseInt(index));
				}else{
					end = (reports.getReportsList().size())+(Integer.parseInt(index));
				}
				modelAndViewObj.addObject("totalRecords", reports.getTotalRecords());
				
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			
			
			
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("countersList", countersList);
			modelAndViewObj.addObject("counterDetails", counterDetails);
			 modelAndViewObj.addObject("flowLocation", reportObj.getFlow());
			modelAndViewObj.addObject("reports", reports);
			modelAndViewObj.addObject("selectedLocation",reportObj.getLocation());
			modelAndViewObj.addObject("zone",reportObj.getZone());
			modelAndViewObj.addObject("startdate",reportObj.getStartDateStr());
			modelAndViewObj.addObject("enddate",reportObj.getEndDateStr());
			modelAndViewObj.addObject("maxRecords",reportObj.getMaxRecords());
			
			
			modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/viewOutletZReport");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
		}
	

	/**
	 * 
	 * @author Sahitya
	 * 
	 *This method is used to display outlet 'X' reading report GUI
	 *
	 **/
	@RequestMapping("/viewOutletXReport")
	public ModelAndView viewOutletXReport(@RequestParam("location") String storeLocationStr,@RequestParam("counter") String counterIdStr,
			@RequestParam("shiftId") String shiftIdStr,@RequestParam("date") String date,@RequestParam("saveFlag") boolean saveFlag,HttpServletRequest request,HttpServletResponse response){
		ReportsResponse xReportResponseObj = null;
		String customerIdStr=null,emailIdStr=null;
		boolean saveReportFlag=false;
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			if(request.getParameter("saveReportFlag")=="true")
				saveReportFlag=true;
			
				
			
			xReportResponseObj = reportsServiceObj.getOutletXReport(saveReportFlag,customerIdStr, emailIdStr, storeLocationStr,counterIdStr,saveFlag, shiftIdStr,date);
			modelAndViewObj = new ModelAndView();
			if(saveFlag){
				if(xReportResponseObj.getReportFilePath()!=null)
				modelAndViewObj.addObject("downloadurl",xReportResponseObj.getReportFilePath());
		   // log.info(xReportResponseObj.getReportFilePath());
			}

			modelAndViewObj.addObject("xReportResponseObj",xReportResponseObj);
		// log.info("View Outlet 'X' Reading Report Flows");
		List<String> workLocationsList = null,countersList = null;
		List<Integer> shiftsIdsList = null;
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			String locationStr = null;
			if(workLocationsList != null && workLocationsList.size()>0)
				locationStr = workLocationsList.get(0);
			countersList = reportsServiceObj.getCounters(locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
			shiftsIdsList = reportsServiceObj.getShiftsIdsList(Constants.PAGINATION_START_INDEX, customerIdStr, emailIdStr, locationStr);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("shiftsIdsList", shiftsIdsList);
			modelAndViewObj.addObject("countersList", countersList);
			modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/viewOutletXReadingReport");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
		}
	
	
	
	/**
	 * 
	 * @author Sahitya
	 * 
	 *This method is used to display outlet 'Z' reading report GUI
	 *
	 **/
	@RequestMapping("/viewOutletZReport")
	public ModelAndView viewOutletZReport(HttpServletRequest request,HttpServletResponse response){
		// log.info("View Outlet 'Z' Reading Report Flows");
		List<String> workLocationsList = null,countersList = null;
		String locationStr = null,customerIdStr=null,emailIdStr=null;
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			if(workLocationsList != null && workLocationsList.size()>0)
				locationStr = workLocationsList.get(0);
			countersList = reportsServiceObj.getCounters(locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
/*				 zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"0");*/
				request.getSession().setAttribute("zoneList", zoneList);
			}
			
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("countersList", countersList);
			modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/viewOutletZReadingReport");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
		}
	
	/*@Author chaitahnaya*/
	@SuppressWarnings("unchecked")
	@RequestMapping("/generateReportCriteriaWise")
	public ModelAndView generateReportCriteriaWise(@RequestParam("brand") String brand,@RequestParam("section") String section,@RequestParam("department") String department,@RequestParam("zone") String zone,@RequestParam("subcategory") String subcategory,@RequestParam("location") String locationStr,@RequestParam("startDate") String startDateStr,@RequestParam("endDate") String endDateStr,
			@RequestParam("maxRecords") String maxRecordsStr,@RequestParam("criteria") String criteriaStr,@RequestParam("index") String indexStr,@RequestParam("order")String order,
			@RequestParam("orderBy")String orderBy,@RequestParam("saveFlag") boolean saveFlag,@RequestParam("counterId") String counterId,@RequestParam("category") String categoryStr,@RequestParam("category") String supplier,HttpServletRequest request,HttpServletResponse response){
		List<SalesReport> salesReportList = null;
		String customerIdStr=null,emailIdStr=null;
		try{
			// log.info("generateSalesReportCriteriaWise");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, "", "","-1","","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
			if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
				categoryList = outletMasterServiceObj.getCategoryDetails("","", "","-1");
				request.getSession().setAttribute("categoryList", categoryList);
			}
			List<Department> departmentList =(List<Department>)request.getSession().getAttribute("departmentList");
			if(departmentList==null || departmentList.size()==0 || departmentList.isEmpty()){
				departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerIdStr, emailIdStr,"-1",false);
				request.getSession().setAttribute("departmentList", departmentList);
			}
			List<String> brandsList =(List<String>)request.getSession().getAttribute("brandsList");
			if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
				brandsList = adminServiceObj.getBrandNamesList("","");
				request.getSession().setAttribute("brandsList", brandsList);
			}
			
			if(startDateStr == null || startDateStr.equals("") )
			{
				startDateStr = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			
			
			salesReportList = reportsServiceObj.generateReportCriteriaWise(customerIdStr, emailIdStr,locationStr, startDateStr, endDateStr,maxRecordsStr,criteriaStr,indexStr,order,orderBy,saveFlag,counterId,categoryStr,zone,subcategory,department,brand,section,supplier);
			int start = 1,end = Integer.parseInt(maxRecordsStr);
			if(salesReportList == null || salesReportList.size() == 0)
			{
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}
			else
			{
				modelAndViewObj.addObject("orderSummarysize",salesReportList.size());
			}	
			
		String segments []={"#2484c1", "#65a620", "#7b6888", "#a05d56", "#961a1a", "#d8d23a", "#e98125", "#d0743c", "#635222", "#6ada6a",
				"#0c6197", "#7d9058", "#207f33", "#44b9b0", "#bca44a", "#e4a14b", "#a3acb2", "#8cc3e9", "#69a6f9", "#5b388f",
				"#546e91", "#8bde95", "#d2ab58", "#273c71", "#98bf6e", "#4daa4b", "#98abc5", "#cc1010", "#31383b", "#006391",
				"#c2643f", "#b0a474", "#a5a39c", "#a9c2bc", "#22af8c", "#7fcecf", "#987ac6", "#3d3b87", "#b77b1c", "#c9c2b6",
				"#807ece", "#8db27c", "#be66a2", "#9ed3c6", "#00644b", "#005064", "#77979f", "#77e079", "#9c73ab", "#1f79a7"
				
		};
					
		modelAndViewObj.addObject("segments",segments);	
		modelAndViewObj.addObject("criteria",criteriaStr);	
			modelAndViewObj.addObject("salesReportList", salesReportList);
				modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/summaryReport");
	
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Manasa.P
	 * 
	 *This method is used to display outlet sale price varaitions.
	 *
	 **/
	@SuppressWarnings("unchecked")
	@RequestMapping("/viewSalesPriceVariationReport")
	public ModelAndView viewSalesPriceVariationReport(@RequestParam("supplierId") String supplierId,@RequestParam("department") String department,@RequestParam("subcategory") String subcategory,@RequestParam("brand") String brand,@RequestParam("startdate") String startdate,@RequestParam("enddate") String enddate,@RequestParam("zone") String zone,@RequestParam("productCategory") String productCategory,@RequestParam("location") String location,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,@RequestParam("flow") String flow,HttpServletRequest request,HttpServletResponse response){
		List<SalesReport> salesReportList = null;
		List<String> countersList = null;
		ArrayList<LocationBean> workLocationsList = new ArrayList<LocationBean>();
		String locationStr = null,customerIdStr=null,emailIdStr=null;
		WarehouseCounterResponse counterDetails = null;

		try{
  			//// log.info("viewSalesPriceVariationReport ");
  			//////System.out.println(zone);
  			int start = 1,end = Integer.parseInt(maxRecords);
  			customerIdStr = (String)request.getSession().getAttribute("customerId");
  			emailIdStr  = (String)request.getSession().getAttribute("emailId");
//  			workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
  			//workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
  			if(zone == null || zone.trim().equals("")){
  				
  				if(flow == "" || flow.equals("")){
  					workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
  					}else{
  						workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
  					}
  				
  			}else{
  				
  				if(flow == "" || flow.equals("")){
  					workLocationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");
  					}else{
  						workLocationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Warehouse");
  					}
  				
  			}
  			
  			locationStr = (String)request.getSession().getAttribute("selectedLocation");
			if(locationStr == null && workLocationsList != null && workLocationsList.size() > 0)
				locationStr = workLocationsList.get(0).getLocationId();
			
			if(flow == "" || flow.equals("")){
				countersList = reportsServiceObj.getCounters(locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
				}else{
				counterDetails = adminServiceObj.getWhCounters("",locationStr,customerIdStr,emailIdStr,index,false,"100");
				}
  			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, "", "",index,"","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
			if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
				categoryList = outletMasterServiceObj.getCategoryDetails("","", "","-1");
				request.getSession().setAttribute("categoryList", categoryList);
			}
			List<String> brandsList =(List<String>)request.getSession().getAttribute("brandsList");
			if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
				brandsList = adminServiceObj.getBrandNamesList("","");
				request.getSession().setAttribute("brandsList", brandsList);
			}
			List<Suppliers> supplierList =(List<Suppliers>)request.getSession().getAttribute("supplierList");
			if(supplierList==null || supplierList.size()==0 || supplierList.isEmpty()){
				 supplierList = outletMasterServiceObj.getSuppliers("", "","-1","","");
				request.getSession().setAttribute("supplierList", supplierList);
			}
		/*	List<String> locationsList =(List<String>)request.getSession().getAttribute("locationsList");
			if(locationsList==null || locationsList.size()==0 || locationsList.isEmpty()){
				 locationsList = adminServiceObj.getOutletLocationsList("","",true);
				request.getSession().setAttribute("locationsList", locationsList);
			}*/
			ArrayList<String> categoriesList = new ArrayList<String>();
			
//			Added by vijay, to make default loaction as location list first occurrence, if location is empty
			if((location.trim()).equals("") || location.trim().isEmpty())
			{
				location = workLocationsList.get(0).getLocationId();
			}
			
			
			if(startdate == null || startdate.equals("") )
			{
				startdate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			
			
			salesReportList  = reportsServiceObj.getSalesPriceVariationReport(index,maxRecords,zone,location,productCategory,subcategory,brand,startdate,enddate,searchNameStr,supplierId,department,false);

			
			if(categoryList != null)
				for(ProductCategoryBean productCategoryBean : categoryList)
					categoriesList.add(productCategoryBean.getCategoryDescription());
//			ArrayList<String> categoriesList = masterServiceObj.getCategoriesList(subCategoriesStr);
  			modelAndViewObj = new ModelAndView();
  			if(salesReportList == null || salesReportList.size() == 0){
  				modelAndViewObj.addObject("totalRecords","0");
  				modelAndViewObj.addObject("index", "0");
  				modelAndViewObj.addObject("totalValue", "0");
  			}else{
  				if(salesReportList.size()<Integer.parseInt(maxRecords)){
  					end = (salesReportList.size())+(Integer.parseInt(index));
  				}else{
  					end = (Integer.parseInt(index)+end);
  				}
  				modelAndViewObj.addObject("totalRecords", salesReportList.get(0).getTotalRecords());
  				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
  				modelAndViewObj.addObject("totalValue", end);
  			}
//  			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			/*if(saveFlag){
				modelAndViewObj.addObject("downloadurl",salesReportList.get(0).getSalesReportFilePath());
		   // log.info(salesReportList.get(0).getSalesReportFilePath());
			}*/
//			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("locationsList", workLocationsList);
			modelAndViewObj.addObject("category", productCategory);
			modelAndViewObj.addObject("categories", categoriesList);
			modelAndViewObj.addObject("loc",locationStr);
  			modelAndViewObj.addObject("startdate", startdate);
			modelAndViewObj.addObject("enddate", enddate);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("selectedLocation", locationStr);
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("category", productCategory);
			modelAndViewObj.addObject("subcategory", subcategory);
			modelAndViewObj.addObject("brand", brand);
			modelAndViewObj.addObject("supplierId", supplierId);
			modelAndViewObj.addObject("salesReportList",salesReportList);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
  			//modelAndViewObj.addObject("warehousereport", warehousereport);
			modelAndViewObj.addObject("flowLocation", flow);
			modelAndViewObj.addObject("counterDetails", counterDetails);
  			modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/salesReportsPriceVariation");
  		}
  		catch(Exception exception){
  			exception.printStackTrace();
  		}
  		return modelAndViewObj;
  	}


	
	
	/**
	 * 
	 * @author Manasa.P
	 * 
	 *This method is used to display outlet sale price varaitions.
	 *
	 **/
	@SuppressWarnings("unchecked")
	@RequestMapping("/viewSalesHourWiseBillReport")
	public ModelAndView viewSalesHourWiseBillReport(@RequestParam("startTime") String startTime,@RequestParam("endTime") String endTime,@RequestParam("startdate") String startdate,@RequestParam("enddate") String enddate,@RequestParam("zone") String zone,@RequestParam("location") String location,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,@RequestParam("saveFlag") boolean saveFlag,@RequestParam("flow") String flow,HttpServletRequest request,HttpServletResponse response){
		List<SalesReport> salesReportList = null;
		ArrayList<LocationBean> workLocationsList = null;
		String locationStr = null,customerIdStr=null,emailIdStr=null;
		try{
  			//// log.info("viewSalesPriceVariationReport ");
  			int start = 1,end = Integer.parseInt(maxRecords);
  			customerIdStr = (String)request.getSession().getAttribute("customerId");
  			emailIdStr  = (String)request.getSession().getAttribute("emailId");
//  			workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
  			if(flow == "" || flow.equals("")){
				workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
				}else{
					workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
				}
  			//workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
  			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, "", "",index,"","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
			if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
				categoryList = outletMasterServiceObj.getCategoryDetails("","", "","-1");
				request.getSession().setAttribute("categoryList", categoryList);
			}
			List<String> brandsList =(List<String>)request.getSession().getAttribute("brandsList");
			if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
				brandsList = adminServiceObj.getBrandNamesList("","");
				request.getSession().setAttribute("brandsList", brandsList);
			}
			List<Suppliers> supplierList =(List<Suppliers>)request.getSession().getAttribute("supplierList");
			if(supplierList==null || supplierList.size()==0 || supplierList.isEmpty()){
				 supplierList = outletMasterServiceObj.getSuppliers("", "","-1","","");
				request.getSession().setAttribute("supplierList", supplierList);
			}
			
			if(startTime == "")
				startTime="00:00:00";
		
			if(startdate == null || startdate.equals("") )
			{
				startdate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			
			if(enddate == null || enddate.equals("") ){
				enddate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			
			salesReportList  = reportsServiceObj.getSalesReportHourWiseBill(index,maxRecords,zone,location,startdate,enddate,startTime,endTime,searchNameStr,saveFlag);
  			modelAndViewObj = new ModelAndView();
  			if(salesReportList == null || salesReportList.size() == 0){
  				modelAndViewObj.addObject("totalRecords","0");
  				modelAndViewObj.addObject("index", "0");
  				modelAndViewObj.addObject("totalValue", "0");
  			}else{
  				if(salesReportList.size()<Integer.parseInt(maxRecords)){
  					end = (salesReportList.size())+(Integer.parseInt(index));
  				}else{
  					end = (Integer.parseInt(index)+end);
  				}
  				modelAndViewObj.addObject("totalRecords", salesReportList.get(0).getTotalRecords());
  				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
  				modelAndViewObj.addObject("totalValue", end);
  			}
//  			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			if(saveFlag){
				if(salesReportList.get(0).getSalesReportFilePath() != null)
				modelAndViewObj.addObject("downloadurl",salesReportList.get(0).getSalesReportFilePath());
			}
			modelAndViewObj.addObject("locationsList", workLocationsList);
			modelAndViewObj.addObject("loc",location);
  			modelAndViewObj.addObject("startdate", startdate);
			modelAndViewObj.addObject("enddate", enddate);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("startTime", startTime);
			modelAndViewObj.addObject("endTime", endTime);
			modelAndViewObj.addObject("salesReportList",salesReportList);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
			 modelAndViewObj.addObject("flowLocation", flow);
  			//modelAndViewObj.addObject("warehousereport", warehousereport);
  			modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/salesReportHourWiseBill");
  		}
  		catch(Exception exception){
  			exception.printStackTrace();
  		}
  		return modelAndViewObj;
  	}


	
	@SuppressWarnings("unchecked")
	@RequestMapping("/viewSerialBillSalesReports")
	public ModelAndView viewSerialBillSalesReports(@RequestParam("startdate") String startdate,@RequestParam("enddate") String enddate,@RequestParam("location") String location,@RequestParam("zone") String zone,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,@RequestParam("index") String index,@RequestParam("flow") String flow,HttpServletRequest request,HttpServletResponse response){
		List<SalesReport> salesReportList = null;
		List<String> countersList = null;
		ArrayList<LocationBean> workLocationsList = null;
		String locationStr = null,customerIdStr=null,emailIdStr=null;

		try{
  			// log.info("viewSalesPriceVariationReport ");
  		//	////////System.out.println("viewSalesPriceVariationReport ");
  			int start = 1,end = Integer.parseInt(maxRecords);
  			customerIdStr = (String)request.getSession().getAttribute("customerId");
  			emailIdStr  = (String)request.getSession().getAttribute("emailId");
//  			workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
  			if(flow == "" || flow.equals("")){
				workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
				}else{
					workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
				}
				
  			if(locationStr == null && workLocationsList != null && workLocationsList.size() > 0)
				locationStr = workLocationsList.get(0).getLocationId();
  			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, "", "",index,"","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
			if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
				categoryList = outletMasterServiceObj.getCategoryDetails("","", "","-1");
				request.getSession().setAttribute("categoryList", categoryList);
			}
//			Added by vijay, to make default loaction as location list first occurrence, if location is empty
			if((location.trim()).equals("") || location.trim().isEmpty())
			{
				location = workLocationsList.get(0).getLocationId();
			}
			//salesReportList  = reportsServiceObj.getSalesPriceVariationReport(index,maxRecords,zone,location,"","","",startdate,enddate,searchName,"","",false);

  			modelAndViewObj = new ModelAndView();
  			if(salesReportList == null || salesReportList.size() == 0){
  				modelAndViewObj.addObject("totalRecords","0");
  				modelAndViewObj.addObject("index", "0");
  				modelAndViewObj.addObject("totalValue", "0");
  			}else{
  				if(salesReportList.size()<Integer.parseInt(maxRecords)){
  					end = (salesReportList.size())+(Integer.parseInt(index));
  				}else{
  					end = (Integer.parseInt(index)+end);
  				}
  				modelAndViewObj.addObject("totalRecords", salesReportList.get(0).getTotalRecords());
  				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
  				modelAndViewObj.addObject("totalValue", end);
  			}

//			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("locationsList", workLocationsList);
			modelAndViewObj.addObject("loc",locationStr);
  			modelAndViewObj.addObject("startDate", startdate);
			modelAndViewObj.addObject("endDate", enddate);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("selectedLocation", locationStr);
			modelAndViewObj.addObject("searchName", searchName);
			modelAndViewObj.addObject("salesReportList",salesReportList);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
			 modelAndViewObj.addObject("flowLocation", flow);
  			modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/serailBillSalesReport");
  		}
  		catch(Exception exception){
  			exception.printStackTrace();
  		}
  		return modelAndViewObj;
  	}
	
///////
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/viewSalesCouponIssueReports")
	public ModelAndView viewSalesCouponIssueReports(@RequestParam("startdate") String startdate,@RequestParam("enddate") String enddate,@RequestParam("location") String location,@RequestParam("zone") String zone,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,@RequestParam("index") String index,@RequestParam("saveFlag") Boolean saveFlag,@RequestParam("flow") String flow,HttpServletRequest request,HttpServletResponse response){
		List<SalesReport> salesReportList = null;
		List<String> countersList = null;
		ArrayList<LocationBean> workLocationsList = null;
		String locationStr = null,customerIdStr=null,emailIdStr=null;

		try{
  			// log.info("viewSalesCouponIssueReports ");
  		//	////////System.out.println("viewSalesPriceVariationReport ");
  			int start = 1,end = Integer.parseInt(maxRecords);
  			customerIdStr = (String)request.getSession().getAttribute("customerId");
  			emailIdStr  = (String)request.getSession().getAttribute("emailId");
//  			workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
  			if(flow == "" || flow.equals("")){
				workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
				}else{
					workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
				}
				
  			
			if(locationStr == null && workLocationsList != null && workLocationsList.size() > 0)
				locationStr = workLocationsList.get(0).getLocationId();
  			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, "", "",index,"","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
			if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
				categoryList = outletMasterServiceObj.getCategoryDetails("","", "","-1");
				request.getSession().setAttribute("categoryList", categoryList);
			}
			
			if((location.trim()).equals("") || location.trim().isEmpty())
			{
				//location = workLocationsList.get(0).getLocationId();
				location = "";
			}
			
			if(startdate == null || startdate.equals("") )
			{
				startdate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			String searchCriteria=searchName;
			salesReportList  = reportsServiceObj.getSalesCouponReport(index,maxRecords,zone,location,startdate,enddate,searchCriteria,saveFlag);
  			modelAndViewObj = new ModelAndView();
  			if(salesReportList == null || salesReportList.size() == 0){
  				modelAndViewObj.addObject("totalRecords","0");
  				modelAndViewObj.addObject("index", "0");
  				modelAndViewObj.addObject("totalValue", "0");
  			}else{
  				if(salesReportList.size()<Integer.parseInt(maxRecords)){
  					end = (salesReportList.size())+(Integer.parseInt(index));
  				}else{
  					end = (Integer.parseInt(index)+end);
  				}
  				modelAndViewObj.addObject("totalRecords", salesReportList.get(0).getTotalRecords());
  				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
  				modelAndViewObj.addObject("totalValue", end);
  			}

//			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("locationsList", workLocationsList);
			modelAndViewObj.addObject("loc",location);
  			modelAndViewObj.addObject("startdateSt", startdate);
			modelAndViewObj.addObject("enddateSt", enddate);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("searchName", searchName);
			modelAndViewObj.addObject("salesReportList",salesReportList);
			 modelAndViewObj.addObject("flowLocation", flow);
			if(saveFlag){
				if(salesReportList.get(0).getSalesReportFilePath()!= null)
				modelAndViewObj.addObject("downloadurl",salesReportList.get(0).getSalesReportFilePath());
				//////System.out.println(salesReportList.get(0).getSalesReportFilePath());
			}
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
  			modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/SalesCouponReport");
  		}
  		catch(Exception exception){
  			exception.printStackTrace();
  		}
  		return modelAndViewObj;
  	}
	
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/viewSalesVoucherIssueReports")
	public ModelAndView viewSalesVoucherIssueReports(@RequestParam("startdate") String startdate,@RequestParam("enddate") String enddate,@RequestParam("location") String location,@RequestParam("zone") String zone,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,@RequestParam("index") String index,@RequestParam("saveFlag") Boolean saveFlag,@RequestParam("flow") String flow,HttpServletRequest request,HttpServletResponse response){
		List<SalesReport> salesReportList = null;
		List<String> countersList = null;
		ArrayList<LocationBean> workLocationsList = null;
		String locationStr = null,customerIdStr=null,emailIdStr=null;

		try{
  			// log.info("viewSalesVoucherIssueReports ");
  		//	////////System.out.println("viewSalesPriceVariationReport ");
  			int start = 1,end = Integer.parseInt(maxRecords);
  			customerIdStr = (String)request.getSession().getAttribute("customerId");
  			emailIdStr  = (String)request.getSession().getAttribute("emailId");
//  			workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
  			if(flow == "" || flow.equals("")){
				workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
				}else{
					workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
				}
  			
  			if(locationStr == null && workLocationsList != null && workLocationsList.size() > 0)
				locationStr = workLocationsList.get(0).getLocationId();
  			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, "", "",index,"","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
			if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
				categoryList = outletMasterServiceObj.getCategoryDetails("","", "","-1");
				request.getSession().setAttribute("categoryList", categoryList);
			}
			
			if((location.trim()).equals("") || location.trim().isEmpty())
			{
				//location = workLocationsList.get(0).getLocationId();
				location = "";
			}
			
			if(startdate == null || startdate.equals("") )
			{
				startdate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			String searchCriteria=searchName;
			salesReportList  = reportsServiceObj.getSalesCouponReport(index,maxRecords,zone,location,startdate,enddate,searchCriteria,saveFlag);
  			modelAndViewObj = new ModelAndView();
  			if(salesReportList == null || salesReportList.size() == 0){
  				modelAndViewObj.addObject("totalRecords","0");
  				modelAndViewObj.addObject("index", "0");
  				modelAndViewObj.addObject("totalValue", "0");
  			}else{
  				if(salesReportList.size()<Integer.parseInt(maxRecords)){
  					end = (salesReportList.size())+(Integer.parseInt(index));
  				}else{
  					end = (Integer.parseInt(index)+end);
  				}
  				modelAndViewObj.addObject("totalRecords", salesReportList.get(0).getTotalRecords());
  				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
  				modelAndViewObj.addObject("totalValue", end);
  			}

//			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("locationsList", workLocationsList);
			modelAndViewObj.addObject("loc",location);
  			modelAndViewObj.addObject("startdateVt", startdate);
			modelAndViewObj.addObject("enddate", enddate);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("searchName", searchName);
			modelAndViewObj.addObject("salesReportList",salesReportList);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
			 modelAndViewObj.addObject("flowLocation", flow);
			if(saveFlag){
				if(salesReportList.get(0).getSalesReportFilePath() != null)
				modelAndViewObj.addObject("downloadurl",salesReportList.get(0).getSalesReportFilePath());
				//////System.out.println(salesReportList.get(0).getSalesReportFilePath());
			}
  			modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/SalesVoucherReport");
  		}
  		catch(Exception exception){
  			exception.printStackTrace();
  		}
  		return modelAndViewObj;
  	}
	
	//added by sneha
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/viewDeliveryPersonWiseReports")
	public ModelAndView viewDeliveryPersonWiseReports(@RequestParam("startdate") String startdate,@RequestParam("enddate") String enddate,@RequestParam("location") String location,@RequestParam("zone") String zone,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,@RequestParam("index") String index,@RequestParam("saveFlag") Boolean saveFlag,@RequestParam("flow") String flow,HttpServletRequest request,HttpServletResponse response){
		List<SalesReport> salesReportList = null;
		List<String> countersList = null;
		ArrayList<LocationBean> workLocationsList = null;
		String locationStr = null,customerIdStr=null,emailIdStr=null;

		try{
  			// log.info("viewSalesVoucherIssueReports ");
  			////////System.out.println("viewSalesPriceVariationReport ");
  			int start = 1,end = Integer.parseInt(maxRecords);
  			customerIdStr = (String)request.getSession().getAttribute("customerId");
  			emailIdStr  = (String)request.getSession().getAttribute("emailId");
  			//workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
  			if(flow == "" || flow.equals("")){
				workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
				}else{
					workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
				}
  			
  			if(locationStr == null && workLocationsList != null && workLocationsList.size() > 0)
				locationStr = workLocationsList.get(0).getLocationId();
  			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, "", "",index,"","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			
			
			if((location.trim()).equals("") || location.trim().isEmpty())
			{
				location = "";
			}
			
			if(startdate == null || startdate.equals("") )
			{
				startdate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			
			String searchCriteria=searchName;
			salesReportList  = reportsServiceObj.getSalesCouponReport(index,maxRecords,zone,location,startdate,enddate,searchCriteria,saveFlag);
  			modelAndViewObj = new ModelAndView();
  			if(salesReportList == null || salesReportList.size() == 0){
  				modelAndViewObj.addObject("totalRecords","0");
  				modelAndViewObj.addObject("index", "0");
  				modelAndViewObj.addObject("totalValue", "0");
  			}else{
  				if(salesReportList.size()<Integer.parseInt(maxRecords)){
  					end = (salesReportList.size())+(Integer.parseInt(index));
  				}else{
  					end = (Integer.parseInt(index)+end);
  				}
  				modelAndViewObj.addObject("totalRecords", salesReportList.get(0).getTotalRecords());
  				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
  				modelAndViewObj.addObject("totalValue", end);
  			}
  			
  			if(saveFlag){
  				if(salesReportList.get(0).getSalesReportFilePath() != null)
				modelAndViewObj.addObject("downloadurl",salesReportList.get(0).getSalesReportFilePath());
				//////System.out.println(salesReportList.get(0).getSalesReportFilePath());
			}

//			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("locationsList", workLocationsList);
			modelAndViewObj.addObject("loc",location);
  			modelAndViewObj.addObject("startdateSt", startdate);
			modelAndViewObj.addObject("endDateSt", enddate);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("searchName", searchName);
			modelAndViewObj.addObject("salesReportList",salesReportList);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
			 modelAndViewObj.addObject("flowLocation", flow);
  			modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/PersonWiseReport");
  		}
  		catch(Exception exception){
  			exception.printStackTrace();
  		}
  		return modelAndViewObj;
  	}
	
/**
	 * 
	 * @author Manasa.P
	 * 
	 *This method is used to display outlet sale price varaitions.
	 *
	 **/
	@SuppressWarnings("unchecked")
	@RequestMapping("/generatePriceVariationReport")
	public ModelAndView generatePriceVariationReport(@RequestParam("supplierId") String supplierId,@RequestParam("department") String department,@RequestParam("subcategory") String subcategory,@RequestParam("brand") String brand,@RequestParam("startdate") String startdate,@RequestParam("enddate") String enddate,@RequestParam("zone") String zone,@RequestParam("productCategory") String productCategory,@RequestParam("location") String location,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,@RequestParam("saveFlag") boolean saveFlag,HttpServletRequest request,HttpServletResponse response){
		List<SalesReport> salesReportList = null;
		List<String> countersList = null;
		String locationStr = null,customerIdStr=null,emailIdStr=null;
		ArrayList<LocationBean> workLocationsList = new ArrayList<LocationBean>();
		customerIdStr = (String)request.getSession().getAttribute("customerId");
		emailIdStr  = (String)request.getSession().getAttribute("emailId");
		try{
  			// log.info("viewOutletNotifications ");
  			//////////System.out.println("viewOutletNotifications ");
  			int start = 1,end = Integer.parseInt(maxRecords);
  			//WarehouseReport  warehousereport = new WarehouseReport();
//  			workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
  			//workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
  			
  			
  			if(zone == null || zone.trim().equals(""))
  				workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			else
				workLocationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");
			
  			locationStr = (String)request.getSession().getAttribute("selectedLocation");
			if(locationStr == null && workLocationsList != null && workLocationsList.size() > 0)
				locationStr = workLocationsList.get(0).getLocationId();
			countersList = reportsServiceObj.getCounters(locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
			String counterId = null;
			if(startdate == null || startdate.equals("") )
			{
				startdate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			
			
			
			
			salesReportList  = reportsServiceObj.getSalesPriceVariationReport(index,maxRecords,zone,location,productCategory,subcategory,brand,startdate,enddate,searchNameStr,supplierId,department,saveFlag);
  			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, "", "",index,"","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
			if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
				categoryList = outletMasterServiceObj.getCategoryDetails("","", "","-1");
				request.getSession().setAttribute("categoryList", categoryList);
			}
			List<String> brandsList =(List<String>)request.getSession().getAttribute("brandsList");
			if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
				brandsList = adminServiceObj.getBrandNamesList("","");
				request.getSession().setAttribute("brandsList", brandsList);
			}
			List<Suppliers> supplierList =(List<Suppliers>)request.getSession().getAttribute("supplierList");
			if(supplierList==null || supplierList.size()==0 || supplierList.isEmpty()){
				 supplierList = outletMasterServiceObj.getSuppliers("", "","-1","","");
				request.getSession().setAttribute("supplierList", supplierList);
			}
		/*	List<String> locationsList =(List<String>)request.getSession().getAttribute("locationsList");
			if(locationsList==null || locationsList.size()==0 || locationsList.isEmpty()){
				 locationsList = adminServiceObj.getOutletLocationsList("","",true);
				request.getSession().setAttribute("locationsList", locationsList);
			}*/
			ArrayList<String> categoriesList = new ArrayList<String>();
			if(categoryList != null)
				for(ProductCategoryBean productCategoryBean : categoryList)
					categoriesList.add(productCategoryBean.getCategoryDescription());
//			ArrayList<String> categoriesList = masterServiceObj.getCategoriesList(subCategoriesStr);
			String categoryStr = "";
  			modelAndViewObj = new ModelAndView();
  			if(salesReportList == null || salesReportList.size() == 0){
  				modelAndViewObj.addObject("totalRecords","0");
  				modelAndViewObj.addObject("index", "0");
  				modelAndViewObj.addObject("totalValue", "0");
  			}else{
  				if(salesReportList.size()<Integer.parseInt(maxRecords)){
  					end = (salesReportList.size())+(Integer.parseInt(index));
  				}else{
  					end = (Integer.parseInt(index)+end);
  				}
  				modelAndViewObj.addObject("totalRecords", salesReportList.get(0).getTotalRecords());
  				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
  				modelAndViewObj.addObject("totalValue", end);
  			}
  			modelAndViewObj.addObject("locationsList", workLocationsList);
			modelAndViewObj.addObject("countersList", countersList);
			String reportStr = new Gson().toJson(salesReportList);
			request.getSession().setAttribute("reportList", salesReportList);
			/*if(saveFlag){
				modelAndViewObj.addObject("downloadurl",salesReportList.get(0).getSalesReportFilePath());
		   // log.info(salesReportList.get(0).getSalesReportFilePath());
			}*/
			modelAndViewObj.addObject("locationsList", workLocationsList);
			modelAndViewObj.addObject("category", productCategory);
			modelAndViewObj.addObject("categories", categoriesList);
			modelAndViewObj.addObject("loc",location);
  			modelAndViewObj.addObject("startdate", startdate);
			modelAndViewObj.addObject("enddate", enddate);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("category", productCategory);
			modelAndViewObj.addObject("subcategory", subcategory);
			modelAndViewObj.addObject("brand", brand);
			modelAndViewObj.addObject("supplierId", supplierId);
			modelAndViewObj.addObject("salesReportList",salesReportList);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
			if(saveFlag){
				if(salesReportList.get(0).getSalesReportFilePath() != null)
				modelAndViewObj.addObject("downloadurl",salesReportList.get(0).getSalesReportFilePath());
		  // ////////System.out.println(salesReportList.get(0).getSalesReportFilePath());
			}
			//modelAndViewObj.addObject("warehousereport", warehousereport);
  			modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/salesReportsPriceVariation");
  		}
  		catch(Exception exception){
  			exception.printStackTrace();
  		}
  		return modelAndViewObj;
  	}
	
	/**
	 * 
	 *@author vijay
	 *written on 04/09/2017 4PM
	 *This method is used to display viewSalesmanCommission.
	 *updated by manasa
	 *
	 **/
	@RequestMapping("/viewSalesmanCommission")
	public ModelAndView viewSalesmanCommission(@RequestParam("Id") String Id,
			@RequestParam("index") String index,
			@RequestParam("maxRecords") String maxRecords,
			@RequestParam("bussinessArea") String bussinessArea,
			@RequestParam("section") String section,
			@RequestParam("subDepartment") String subDepartment,
			@RequestParam("location") String location,
			@RequestParam("zone") String zone,
			@RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate,
			@RequestParam("category") String category,
			@RequestParam("subCategory") String subCategory,
			@RequestParam("department") String department,
			@RequestParam("searchCriteria") String searchCriteria,
			@RequestParam("saveFlag") boolean saveFlag,
			@RequestParam("flow") String flow,
			HttpServletRequest request,HttpServletResponse response){
		List<SalesReport> salesReportList = null;
		List<String> workLocationsList = null,countersList = null;
		String locationStr = null,customerIdStr=null,emailIdStr=null;
		try{
			////////System.out.println("commission");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			//workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			locationStr = (String)request.getSession().getAttribute("selectedLocation");
			/*if(locationStr == null && workLocationsList != null && workLocationsList.size() > 0)
				locationStr = workLocationsList.get(0);*/
		
			
//			String subCategoriesStr = masterServiceObj.getCategories(customerIdStr,emailIdStr);
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, "", "","-1","","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
			if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
				categoryList = outletMasterServiceObj.getCategoryDetails("","", "","-1");
				request.getSession().setAttribute("categoryList", categoryList);
			}
			List<Department> departmentList =(List<Department>)request.getSession().getAttribute("departmentList");
			if(departmentList==null || departmentList.size()==0 || departmentList.isEmpty()){
				departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerIdStr, emailIdStr,"-1",false);
				request.getSession().setAttribute("departmentList", departmentList);
			}
			List<String> brandsList =(List<String>)request.getSession().getAttribute("brandsList");
			if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
				brandsList = adminServiceObj.getBrandNamesList("","");
				request.getSession().setAttribute("brandsList", brandsList);
			}
			List<String> locationsList =(List<String>)request.getSession().getAttribute("locationsList");
			if(locationsList==null || locationsList.size()==0 || locationsList.isEmpty()){
				 locationsList = adminServiceObj.getOutletLocationsList("","",true);
				request.getSession().setAttribute("locationsList", locationsList);
			}
			//List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
			ArrayList<String> categoriesList = new ArrayList<String>();
			if(categoryList != null)
				for(ProductCategoryBean productCategoryBean : categoryList)
					categoriesList.add(productCategoryBean.getCategoryDescription());
//			ArrayList<String> categoriesList = masterServiceObj.getCategoriesList(subCategoriesStr);
			//added by manasa
			
//			Added by vijay, to make default loaction as location list first occurrence, if location is empty
			if((location.trim()).equals("") || location.trim().isEmpty())
			{
				location = locationsList.get(0);
			}
			
			
			if(startDate == null || startDate.equals("") )
			{
				startDate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			
			if(endDate == null || endDate.equals("") ){
				endDate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			
			
			salesReportList  = reportsServiceObj.getSalesmanCommission(index,maxRecords,zone,location,category,subCategory,"",startDate,endDate,searchCriteria,department,saveFlag);

			
			int start = 1,end = Integer.parseInt(maxRecords);
			if(salesReportList == null || salesReportList.size() == 0)
			{
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}
			else{
				if(salesReportList.size()<Integer.parseInt(maxRecords))
				{
				
					end = (salesReportList.size())+(Integer.parseInt(index));
				}else
				{
					end = (Integer.parseInt(index)+end);
				}
  				modelAndViewObj.addObject("totalRecords", salesReportList.get(0).getTotalRecords());
//  				////////System.out.println(salesReportList.get(0).getTotalRecords());
  				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
  				modelAndViewObj.addObject("totalValue", end);
  			}
			modelAndViewObj.addObject("salesReportList",salesReportList);
			modelAndViewObj.addObject("maxRecords",Integer.parseInt(maxRecords));
			modelAndViewObj.addObject("loc",location);
			modelAndViewObj.addObject("category",category);
			modelAndViewObj.addObject("subcategory",subCategory);
			modelAndViewObj.addObject("zone",zone);
			modelAndViewObj.addObject("department",department);
			modelAndViewObj.addObject("startdate",startDate);
			modelAndViewObj.addObject("enddate",endDate);
			modelAndViewObj.addObject("flowLocation", flow);
			modelAndViewObj.addObject("department",department);
			
			if(saveFlag){
				if(salesReportList.get(0).getSalesReportFilePath()!=null)
				modelAndViewObj.addObject("downloadurl1",salesReportList.get(0).getSalesReportFilePath());
		   // log.info(salesReportList.get(0).getSalesReportFilePath());
			}
		
			modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/viewSalesmanCommission");
  		}
  		catch(Exception exception){
  			exception.printStackTrace();
  		}
  		return modelAndViewObj;
  	}

	
	@RequestMapping("/viewNewSalesmanCommission")
	public ModelAndView viewNewSalesmanCommission(@RequestParam("Id") String Id,
			@RequestParam("index") String index,
			@RequestParam("maxRecords") String maxRecords,
			@RequestParam("bussinessArea") String bussinessArea,
			@RequestParam("section") String section,
			@RequestParam("subDepartment") String subDepartment,
			@RequestParam("location") String location,
			@RequestParam("zone") String zone,
			@RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate,
			@RequestParam("category") String category,
			@RequestParam("subCategory") String subCategory,
			@RequestParam("department") String department,
			@RequestParam("searchCriteria") String searchCriteria,
			@RequestParam("saveFlag") boolean saveFlag,@RequestParam("flow") String flow,
			HttpServletRequest request,HttpServletResponse response){
		List<SalesReport> salesReportList = null;
		List<String> countersList = null;
		String locationStr = null,customerIdStr=null,emailIdStr=null;
       ArrayList<LocationBean> workLocationsList = null;
		try{
			//////////System.out.println("commission");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			//workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			locationStr = (String)request.getSession().getAttribute("selectedLocation");
			/*if(locationStr == null && workLocationsList != null && workLocationsList.size() > 0)
				locationStr = workLocationsList.get(0);*/
		
			
//			String subCategoriesStr = masterServiceObj.getCategories(customerIdStr,emailIdStr);
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, "", "","-1","","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			List<ProductCategoryBean> categoryList = (List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
			if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
				categoryList = outletMasterServiceObj.getCategoryDetails("","", "","-1");
				request.getSession().setAttribute("categoryList", categoryList);
			}
			List<Department> departmentList = (List<Department>)request.getSession().getAttribute("departmentList");
			if(departmentList==null || departmentList.size()==0 || departmentList.isEmpty()){
				departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerIdStr, emailIdStr,"-1",false);
				request.getSession().setAttribute("departmentList", departmentList);
			}
			List<String> brandsList =(List<String>)request.getSession().getAttribute("brandsList");
			if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
				brandsList = adminServiceObj.getBrandNamesList("","");
				request.getSession().setAttribute("brandsList", brandsList);
			}
			
			if(zone == null || zone.trim().equals("")){
				if(flow == "" || flow.equals("")){
					workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
					}else{
						workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
					}
			}else{
				if(flow == "" || flow.equals("")){
				workLocationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");
				}else{
					workLocationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Warehouse");

				}
			}
//			List<String> locationsList =(List<String>)request.getSession().getAttribute("locationsList");
//			if(locationsList==null || locationsList.size()==0 || locationsList.isEmpty()){
//				 locationsList = adminServiceObj.getOutletLocationsList("","",true);
//				request.getSession().setAttribute("locationsList", locationsList);
//			}
			//List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
			ArrayList<String> categoriesList = new ArrayList<String>();
			if(categoryList != null)
				for(ProductCategoryBean productCategoryBean : categoryList)
					categoriesList.add(productCategoryBean.getCategoryDescription());
//			ArrayList<String> categoriesList = masterServiceObj.getCategoriesList(subCategoriesStr);
			//added by manasa
			
//			Added by vijay, to make default loaction as location list first occurrence, if location is empty
			if((location.trim()).equals("") || location.trim().isEmpty())
			{
				//location = workLocationsList.get(0).getLocationId();
				location = "";
			}
			if(startDate == null || startDate.equals("") )
			{
				startDate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			
			salesReportList  = reportsServiceObj.getSalesmenSalesCommission(index,maxRecords,zone,location,category,subCategory,"",startDate,endDate,searchCriteria,department,saveFlag);

			
			int start = 1,end = Integer.parseInt(maxRecords);
			if(salesReportList == null || salesReportList.size() == 0)
			{
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}
			else{
				if(salesReportList.size()<Integer.parseInt(maxRecords))
				{
				
					end = (salesReportList.size())+(Integer.parseInt(index));
				}else
				{
					
					end = (Integer.parseInt(index)+end);
				}
  				modelAndViewObj.addObject("totalRecords", salesReportList.get(0).getTotalRecords());
  				//////////System.out.println(salesReportList.get(0).getTotalRecords());
  				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
  				modelAndViewObj.addObject("totalValue", end);
  			}
			
			modelAndViewObj.addObject("salesReportList",salesReportList);
			modelAndViewObj.addObject("maxRecords",Integer.parseInt(maxRecords));
			modelAndViewObj.addObject("loc",location);
			modelAndViewObj.addObject("locationsList",workLocationsList);
			modelAndViewObj.addObject("category",category);
			modelAndViewObj.addObject("subcategory",subCategory);
			modelAndViewObj.addObject("zone",zone);
			modelAndViewObj.addObject("department",department);
			modelAndViewObj.addObject("startdate",startDate);
			modelAndViewObj.addObject("enddate",endDate);
			modelAndViewObj.addObject("department",department);
			modelAndViewObj.addObject("flowLocation", flow);
			if(saveFlag){
				if(salesReportList.get(0).getSalesReportFilePath()!=null)
				modelAndViewObj.addObject("downloadurl",salesReportList.get(0).getSalesReportFilePath());
		   // log.info(salesReportList.get(0).getSalesReportFilePath());
			}
		
			modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/viewSalesmenSalesReport");
  		}
  		catch(Exception exception){
  			exception.printStackTrace();
  		}
  		return modelAndViewObj;
  	}
	
	/**
	 * 
	 *@author Surya.k
	 *written on 30/03/2019 
	 *This method is used to display viewItemWisePromotionSales.
	 *
	 *
	 **/
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/viewItemWisePromotionSalesReport")
	public ModelAndView viewItemWisePromotionSalesReport(@RequestParam("maxRecords") String maxRecords,
			@RequestParam("zone") String zone,
			@RequestParam("promotionName") String promotionName,
			@RequestParam("startDate") String startDate,
			@RequestParam("location") String location,
			@RequestParam("endDate") String endDate,
			@RequestParam("index") String index,
			@RequestParam("saveFlag") Boolean saveFlag,
			HttpServletRequest request,HttpServletResponse response){
		List<Offer> lst_offers = null;
		List<PromotionSalesReport> salesReportList = null;
		ArrayList<LocationBean> workLocationsList = null;
		String locationStr = null,customerIdStr=null,emailIdStr=null;

		try{
			lst_offers = new ArrayList<Offer>();
  			int start = 1,end = Integer.parseInt(maxRecords);
  			customerIdStr = (String)request.getSession().getAttribute("customerId");
  			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			lst_offers = offerServiceObj.getOffers(customerIdStr,emailIdStr,location,"all","0","100",false,"",null,"",zone,"","");

  			workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);

  			if(locationStr == null && workLocationsList != null && workLocationsList.size() > 0)
				locationStr = workLocationsList.get(0).getLocationId();
			
			
			if((location.trim()).equals("") || location.trim().isEmpty())
			{
				location = "";
			}
			
			if(startDate == null || startDate.equals("") )
			{
				startDate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			
			String searchCriteria="";
			salesReportList  = reportsServiceObj.getItemWisePromotionSalesReport(index,maxRecords,zone,location,startDate,endDate,searchCriteria,promotionName,saveFlag);
  			modelAndViewObj = new ModelAndView();
  			if(salesReportList == null || salesReportList.size() == 0){
  				modelAndViewObj.addObject("totalRecords","0");
  				modelAndViewObj.addObject("index", "0");
  				modelAndViewObj.addObject("totalValue", "0");
  			}else{
  				if(salesReportList.size()<Integer.parseInt(maxRecords)){
  					end = (salesReportList.size())+(Integer.parseInt(index));
  				}else{
  					end = (Integer.parseInt(index)+end);
  				}
  				modelAndViewObj.addObject("totalRecords", salesReportList.get(0).getTotalRecords());
  				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
  				modelAndViewObj.addObject("totalValue", end);
  			}
  			
  			if(saveFlag){
  				if(salesReportList.get(0).getFilePath() != null)
				modelAndViewObj.addObject("downloadurl",salesReportList.get(0).getFilePath());
				//////System.out.println(salesReportList.get(0).getFilePath());
			}

			modelAndViewObj.addObject("locationsList", workLocationsList);
			modelAndViewObj.addObject("lst_offers", lst_offers);
			modelAndViewObj.addObject("promotionName", promotionName);
			modelAndViewObj.addObject("loc",location);
  			modelAndViewObj.addObject("startdateSt", startDate);
			modelAndViewObj.addObject("endDateSt", endDate);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("salesReportList",salesReportList);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
  			modelAndViewObj.setViewName("Reports/PromotionReport/itemWisePromotionCampaign");
  		}
  		catch(Exception exception){
  			exception.printStackTrace();
  		}
  		return modelAndViewObj;
  	}
	
	

	/**
	 * 
	 *@author Surya.k
	 *written on 13/06/2019 
	 *This method is used to display viewItemWisePromotionSales.
	 *
	 *
	 **/
	@SuppressWarnings("unchecked")
	@RequestMapping("/getpendingCartReport")
	public ModelAndView getpendingCartReport(@RequestParam("maxRecords") String maxRecords,
			@RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate,
			@RequestParam("index") String index,
			@RequestParam("saveFlag") Boolean saveFlag,
			@RequestParam("status") String status,@RequestParam("searchItems") String searchItems,
			HttpServletRequest request,HttpServletResponse response){
			List <Cart> cartList= new ArrayList<Cart>();
			String customerIdStr=null,emailIdStr=null;
			ArrayList<LocationBean> workLocationsList = null;
		try{
  			int start = 1,end = Integer.parseInt(maxRecords);
  			customerIdStr = (String)request.getSession().getAttribute("customerId");
  			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			if(startDate == null || startDate.equals("") )
			{
				startDate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			String searchCriteria="";
  			workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);

			cartList = reportsServiceObj.getpendingCartReport(index,maxRecords,startDate,endDate,searchItems,saveFlag,status,"");
  			modelAndViewObj = new ModelAndView();
  			if(cartList == null || cartList.size() == 0){
  				modelAndViewObj.addObject("totalRecords","0");
  				modelAndViewObj.addObject("index", "0");
  				modelAndViewObj.addObject("totalValue", "0");
  			}else{
  				if(cartList.size()<Integer.parseInt(maxRecords)){
  					end = (cartList.size())+(Integer.parseInt(index));
  				}else{
  					end = (Integer.parseInt(index)+end);
  				}
  				modelAndViewObj.addObject("totalRecords", cartList.get(0).getTotalRecords());
  				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
  				modelAndViewObj.addObject("totalValue", end);
  			}
  			
  			/*if(saveFlag){
				modelAndViewObj.addObject("downloadurl",salesReportList.get(0).getFilePath());
				//////System.out.println(salesReportList.get(0).getFilePath());
			}*/
  			if(cartList == null || cartList.size() == 0){
  				modelAndViewObj.addObject("downloadurl", "");
  			}else{
  				if(cartList.get(0).getFilePath() != null)
  				modelAndViewObj.addObject("downloadurl", cartList.get(0).getFilePath());
  			}
  			
  			modelAndViewObj.addObject("locationsList", workLocationsList);
  			modelAndViewObj.addObject("startdateSt", startDate);
			modelAndViewObj.addObject("endDateSt", endDate);
			modelAndViewObj.addObject("OrderStatus",status);
			modelAndViewObj.addObject("cartList",cartList);
			modelAndViewObj.addObject("searchCriteria", searchItems);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
  			modelAndViewObj.setViewName("Reports/OrderReports/pendingCartReports");
  		}
  		catch(Exception exception){
  			exception.printStackTrace();
  		}
  		return modelAndViewObj;
  	}
	
	
	
	
	/**
	 * 
	 *@author Surya.k
	 *written on 13/06/2019 
	 *This method is used to display viewItemWisePromotionSales.
	 *
	 *
	 **/
	@SuppressWarnings("unchecked")
	@RequestMapping("/getCartDetails")
	public ModelAndView getCartDetails(@RequestParam("cartId") String cartId,
			
			HttpServletRequest request,HttpServletResponse response){
			List <Cart> cartList= new ArrayList<Cart>();
			String customerIdStr=null,emailIdStr=null;
			ArrayList<LocationBean> workLocationsList = null;
		try{
  			
			String searchCriteria="";

			cartList = reportsServiceObj.getpendingCartReportView("","","","",searchCriteria,false,"",cartId);
  			modelAndViewObj = new ModelAndView();
  
  		
			modelAndViewObj.addObject("cartList",cartList);
			//modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
  			modelAndViewObj.setViewName("Reports/OrderReports/orderItemDetails");
  		}
  		catch(Exception exception){
  			exception.printStackTrace();
  		}
  		return modelAndViewObj;
  	}
	
	
	@RequestMapping("/getOrderToBillReport")
	public @ResponseBody ModelAndView getOrderToBillReport(@RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate, @RequestParam("location") String location,
			@RequestParam("zone") String zoneId,@RequestParam("salesChannel") String salesChannel,
			@RequestParam("searchCriteria") String searchCriteria,@RequestParam("index") String index,
			@RequestParam("maxRecords") String maxRecords,@RequestParam("counterId") String counterId,
			HttpServletRequest request, HttpServletResponse response) {
		
		int start = 1, end = Integer.parseInt(maxRecords);
		Billing billDetails = new Billing();
		List<String> locationsListValue = null;
		List<Billing> lst_bills = null;
		ArrayList<LocationBean> locationBeansList = null;
		
		List<String> countersList = null;
		String customerIdStr = (String) request.getSession().getAttribute("customerId");
		String emailIdStr = (String) request.getSession().getAttribute("emailId");
		try {
			
			locationsListValue=new ArrayList<String>();
			countersList = reportsServiceObj.getCounters(location, customerIdStr, emailIdStr,Constants.PAGINATION_START_INDEX);
			locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			
			
			
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("locationsList", locationBeansList);
			
			//Here we are calling to getBills() from Service Class Object.....//
			lst_bills = reportsServiceObj.getBilledOrderReport(index,maxRecords,zoneId,location,counterId,salesChannel,startDate,endDate,searchCriteria,false,"");
			
			
			if (lst_bills == null || lst_bills.size() == 0) {
				modelAndViewObj.addObject("totalRecords", "0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			} else {
				if (lst_bills.size() < Integer.parseInt(maxRecords)) {
					end = (lst_bills.size()) + (Integer.parseInt(index));
				} else {
					end = (Integer.parseInt(index) + end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(lst_bills.get(0).getTotalRecords()));
				modelAndViewObj.addObject("startDate", startDate);
				modelAndViewObj.addObject("endDate", endDate);
				
				modelAndViewObj.addObject("index", (Integer.parseInt(index) + start));
				modelAndViewObj.addObject("totalValue", end);
			}
			/*//////System.out.println(lst_bills.size());
			//////System.out.println(index);
			//////System.out.println(lst_bills.get(0).getTotalRecords());*/
			if(lst_bills == null || lst_bills.size() == 0){
  				modelAndViewObj.addObject("downloadurl", "");
  			}else{
  				if(lst_bills.get(0).getFilePath() != null)
  				modelAndViewObj.addObject("downloadurl", lst_bills.get(0).getFilePath());
  			}
			//modelAndViewObj.addObject("downloadurl", lst_bills.get(0).getFilePath());
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
			modelAndViewObj.addObject("billDetails", lst_bills);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("countersList", countersList);
			modelAndViewObj.addObject("counterId", counterId);
			modelAndViewObj.addObject("startDate", startDate);
			modelAndViewObj.addObject("searchCriteria", searchCriteria);
			
	
			modelAndViewObj.setViewName("Reports/OrderReports/orderToBillReports");
		}
		
		catch (Exception e) {
			e.printStackTrace();
			lst_bills = new ArrayList<Billing>();
			modelAndViewObj.addObject("totalRecords", "0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
			modelAndViewObj.addObject("err",e.getMessage());
			modelAndViewObj.setViewName("Reports/OrderReports/orderToBillReports");
		}
		return modelAndViewObj;
	}

	

	//written by:Surya.k on 21/06/19
	
	@RequestMapping("/gstTaxReturn")
	public ModelAndView gstTaxReturn(@RequestParam("saveFlag") boolean saveFlag, @RequestParam("maxRecords") String maxRecords, 
			@RequestParam("locationList") String locationList,@RequestParam("index") String index,@RequestParam("brand") String brand,
			@RequestParam("section") String section,@RequestParam("subDepartment") String subDepartment, 
			@RequestParam("location") String location,@RequestParam("zone") String zone,
			@RequestParam("startDate")String startDate,@RequestParam("endDate") String endDate, 
			@RequestParam("category") String category, @RequestParam("subCategory") String subCategory,			
			@RequestParam("department") String department, @RequestParam("searchCriteria") String searchCriteria,
			HttpServletRequest request,HttpServletResponse response)
			{
		WarehouseReport WarehouseReportObj = null;
		String locationStr = null,customerIdStr=null,emailIdStr=null;
		List<String> countersList = null;
		String locationListAll="";
		ArrayList<LocationBean> workLocationsList = new ArrayList<LocationBean>();
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			//workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			if(zone == null || zone.trim().equals(""))
				workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			else
				workLocationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");
				
			/*workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			locationStr = (String)request.getSession().getAttribute("selectedLocation");*/
			if(locationStr == null && workLocationsList != null && workLocationsList.size() > 0)
				locationStr = workLocationsList.get(0).getLocationId();
			countersList = reportsServiceObj.getCounters(locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty())
			{
				 zoneList = genericMasterServiceObj.getZones(null, "", "","-1","","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
			if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty())
			{
				categoryList = outletMasterServiceObj.getCategoryDetails("","", "","-1");
				request.getSession().setAttribute("categoryList", categoryList);
			}
			List<Department> departmentList =(List<Department>)request.getSession().getAttribute("departmentList");
			if(departmentList==null || departmentList.size()==0 || departmentList.isEmpty())
			{
				departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerIdStr, emailIdStr,"-1",false);
				request.getSession().setAttribute("departmentList", departmentList);
			}
			List<ProductSubCategoryBean> subCategoryDetailsList =(List<ProductSubCategoryBean>)request.getSession().getAttribute("subCategoryDetailsList");
			if(subCategoryDetailsList==null || subCategoryDetailsList.size()==0 || subCategoryDetailsList.isEmpty()){
				subCategoryDetailsList = outletMasterServiceObj.getSubCategoryDetails("","", "","-1","",false);
				request.getSession().setAttribute("subCategoryDetailsList", subCategoryDetailsList);
			}
			
			ArrayList<String> categoriesList = new ArrayList<String>();
			if(categoryList != null)
				for(ProductCategoryBean productCategoryBean : categoryList)
					categoriesList.add(productCategoryBean.getCategoryDescription());
		
			
          List<String> locationsListValue=new ArrayList<String>();
  			
  	  		
  			if(location.equals("all")|| location.equals("")){
				if(workLocationsList != null){
					if(zone ==""){
						for(int i=0;i<workLocationsList.size();i++){
							locationsListValue.add(workLocationsList.get(i).getLocationId());
						}
						}
						else
						{
							locationsListValue.add(locationList);
						}
			
					for (String string : locationsListValue) {
						locationListAll = locationListAll+string+",";
					}
				}
				
			}
			
  			
  			if(startDate == null || startDate.equals("") )
			{
				startDate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			
  			
			
			modelAndViewObj = new ModelAndView();
					WarehouseReportObj = reportsServiceObj.gstTaxReturn(index,maxRecords,brand,zone,category,subCategory,department,subDepartment,section,location,startDate,endDate,searchCriteria,saveFlag,locationListAll);
				
				
				int start = 1,end = Integer.parseInt(maxRecords);
				if(WarehouseReportObj == null || WarehouseReportObj.getReportsList() == null)
				{
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}
				else
				{
					if(WarehouseReportObj.getReportsList().size()<Integer.parseInt(maxRecords)){
	  					end = (WarehouseReportObj.getReportsList().size())+(Integer.parseInt(index));
	  				}
					else{
	  					end = (Integer.parseInt(index)+end);
	  									
					}
					modelAndViewObj.addObject("totalRecords", WarehouseReportObj.getTotalRecords());
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue",end );
					
				}
				modelAndViewObj.addObject("WarehouseReportObj", WarehouseReportObj);
				modelAndViewObj.addObject("countersList", countersList);
				modelAndViewObj.addObject("workLocationsList", workLocationsList);
				modelAndViewObj.addObject("category", category);
				modelAndViewObj.addObject("subcategory", subCategory);
				modelAndViewObj.addObject("subCategoryDetailsList", subCategoryDetailsList);
				modelAndViewObj.addObject("categories", categoriesList);
				modelAndViewObj.addObject("zoneList", zoneList);
				modelAndViewObj.addObject("loc",location);
	  			modelAndViewObj.addObject("startdate", startDate);
				modelAndViewObj.addObject("enddate", endDate);
				modelAndViewObj.addObject("zone", zone);
				modelAndViewObj.addObject("selectedLocation", location);
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.addObject("searchName",searchCriteria);
				if(saveFlag)
				{
					if(WarehouseReportObj.getSalesReportFilePath()!=null)
					modelAndViewObj.addObject("downloadurl", WarehouseReportObj.getSalesReportFilePath());
				}
				modelAndViewObj.setViewName("FinantialManagement/viewItemWiseTaxReturnReport");
			}
		
		catch(Exception exception){
			////////System.out.println(exception);
		}
	return modelAndViewObj;
	
		}
	

	//written by:Surya.k on 21/06/19
	
	@RequestMapping("/inputItemWiseTaxGSTReport")
	public ModelAndView inputItemWiseTaxGSTReport(@RequestParam("saveFlag") boolean saveFlag, @RequestParam("maxRecords") String maxRecords, 
			@RequestParam("locationList") String locationList,@RequestParam("index") String index,@RequestParam("brand") String brand,
			@RequestParam("section") String section,@RequestParam("subDepartment") String subDepartment, 
			@RequestParam("location") String location,@RequestParam("zone") String zone,
			@RequestParam("startDate")String startDate,@RequestParam("endDate") String endDate, 
			@RequestParam("category") String category, @RequestParam("subCategory") String subCategory,			
			@RequestParam("department") String department, @RequestParam("searchCriteria") String searchCriteria,
			HttpServletRequest request,HttpServletResponse response)
			{
		WarehouseReport WarehouseReportObj = null;
		String locationStr = null,customerIdStr=null,emailIdStr=null;
		List<String> countersList = null;
		String locationListAll="";
		ArrayList<LocationBean> workLocationsList = new ArrayList<LocationBean>();
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			//workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			if(zone == null || zone.trim().equals(""))
				workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			else
				workLocationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");
				
			/*workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			locationStr = (String)request.getSession().getAttribute("selectedLocation");*/
			if(locationStr == null && workLocationsList != null && workLocationsList.size() > 0)
				locationStr = workLocationsList.get(0).getLocationId();
			countersList = reportsServiceObj.getCounters(locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty())
			{
				 zoneList = genericMasterServiceObj.getZones(null, "", "","-1","","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
			if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty())
			{
				categoryList = outletMasterServiceObj.getCategoryDetails("","", "","-1");
				request.getSession().setAttribute("categoryList", categoryList);
			}
			List<Department> departmentList =(List<Department>)request.getSession().getAttribute("departmentList");
			if(departmentList==null || departmentList.size()==0 || departmentList.isEmpty())
			{
				departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerIdStr, emailIdStr,"-1",false);
				request.getSession().setAttribute("departmentList", departmentList);
			}
			List<ProductSubCategoryBean> subCategoryDetailsList =(List<ProductSubCategoryBean>)request.getSession().getAttribute("subCategoryDetailsList");
			if(subCategoryDetailsList==null || subCategoryDetailsList.size()==0 || subCategoryDetailsList.isEmpty()){
				subCategoryDetailsList = outletMasterServiceObj.getSubCategoryDetails("","", "","-1","",false);
				request.getSession().setAttribute("subCategoryDetailsList", subCategoryDetailsList);
			}
			
			ArrayList<String> categoriesList = new ArrayList<String>();
			if(categoryList != null)
				for(ProductCategoryBean productCategoryBean : categoryList)
					categoriesList.add(productCategoryBean.getCategoryDescription());
		
			
          List<String> locationsListValue=new ArrayList<String>();
  			
  	  		
  			if(location.equals("all")|| location.equals("")){
				if(workLocationsList != null){
					if(zone ==""){
						for(int i=0;i<workLocationsList.size();i++){
							locationsListValue.add(workLocationsList.get(i).getLocationId());
						}
						}
						else
						{
							locationsListValue.add(locationList);
						}
			
					for (String string : locationsListValue) {
						locationListAll = locationListAll+string+",";
					}
				}
				
			}
			
  			
  			if(startDate == null || startDate.equals("") )
			{
				startDate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			
  			
			
			modelAndViewObj = new ModelAndView();
					WarehouseReportObj = reportsServiceObj.getInputTaxationReport(index,maxRecords,brand,zone,category,subCategory,department,subDepartment,section,location,startDate,endDate,searchCriteria,saveFlag,locationListAll);
				
				
				int start = 1,end = Integer.parseInt(maxRecords);
				if(WarehouseReportObj == null || WarehouseReportObj.getReportsList() == null)
				{
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}
				else
				{
					if(WarehouseReportObj.getReportsList().size()<Integer.parseInt(maxRecords)){
	  					end = (WarehouseReportObj.getReportsList().size())+(Integer.parseInt(index));
	  				}
					else{
	  					end = (Integer.parseInt(index)+end);
	  									
					}
					modelAndViewObj.addObject("totalRecords", WarehouseReportObj.getTotalRecords());
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue",end );
					
				}
				modelAndViewObj.addObject("WarehouseReportObj", WarehouseReportObj);
				modelAndViewObj.addObject("countersList", countersList);
				modelAndViewObj.addObject("workLocationsList", workLocationsList);
				modelAndViewObj.addObject("category", category);
				modelAndViewObj.addObject("subcategory", subCategory);
				modelAndViewObj.addObject("subCategoryDetailsList", subCategoryDetailsList);
				modelAndViewObj.addObject("categories", categoriesList);
				modelAndViewObj.addObject("zoneList", zoneList);
				modelAndViewObj.addObject("loc",location);
	  			modelAndViewObj.addObject("startdate", startDate);
				modelAndViewObj.addObject("enddate", endDate);
				modelAndViewObj.addObject("zone", zone);
				modelAndViewObj.addObject("selectedLocation", location);
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.addObject("searchName",searchCriteria);
				if(saveFlag)
				{
					if(WarehouseReportObj.getSalesReportFilePath()!=null)
					modelAndViewObj.addObject("downloadurl", WarehouseReportObj.getSalesReportFilePath());
				}
				modelAndViewObj.setViewName("FinantialManagement/viewInputItemWiseGstReport");
			}
		
		catch(Exception exception){
			////////System.out.println(exception);
		}
	return modelAndViewObj;
	
		}
	
	
	

	//written by:Surya.k on 21/06/19
	
	@RequestMapping("/outputItemWiseTaxGSTReport")
	public ModelAndView outputItemWiseTaxGSTReport(@RequestParam("saveFlag") boolean saveFlag, @RequestParam("maxRecords") String maxRecords, 
			@RequestParam("locationList") String locationList,@RequestParam("index") String index,@RequestParam("brand") String brand,
			@RequestParam("section") String section,@RequestParam("subDepartment") String subDepartment, 
			@RequestParam("location") String location,@RequestParam("zone") String zone,
			@RequestParam("startDate")String startDate,@RequestParam("endDate") String endDate, 
			@RequestParam("category") String category, @RequestParam("subCategory") String subCategory,			
			@RequestParam("department") String department, @RequestParam("searchCriteria") String searchCriteria,
			HttpServletRequest request,HttpServletResponse response)
			{
		WarehouseReport WarehouseReportObj = null;
		String locationStr = null,customerIdStr=null,emailIdStr=null;
		List<String> countersList = null;
		String locationListAll="";
		ArrayList<LocationBean> workLocationsList = new ArrayList<LocationBean>();
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			//workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			if(zone == null || zone.trim().equals(""))
				workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			else
				workLocationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");
				
			/*workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			locationStr = (String)request.getSession().getAttribute("selectedLocation");*/
			if(locationStr == null && workLocationsList != null && workLocationsList.size() > 0)
				locationStr = workLocationsList.get(0).getLocationId();
			countersList = reportsServiceObj.getCounters(locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty())
			{
				 zoneList = genericMasterServiceObj.getZones(null, "", "","-1","","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
			if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty())
			{
				categoryList = outletMasterServiceObj.getCategoryDetails("","", "","-1");
				request.getSession().setAttribute("categoryList", categoryList);
			}
			List<Department> departmentList =(List<Department>)request.getSession().getAttribute("departmentList");
			if(departmentList==null || departmentList.size()==0 || departmentList.isEmpty())
			{
				departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerIdStr, emailIdStr,"-1",false);
				request.getSession().setAttribute("departmentList", departmentList);
			}
			List<ProductSubCategoryBean> subCategoryDetailsList =(List<ProductSubCategoryBean>)request.getSession().getAttribute("subCategoryDetailsList");
			if(subCategoryDetailsList==null || subCategoryDetailsList.size()==0 || subCategoryDetailsList.isEmpty()){
				subCategoryDetailsList = outletMasterServiceObj.getSubCategoryDetails("","", "","-1","",false);
				request.getSession().setAttribute("subCategoryDetailsList", subCategoryDetailsList);
			}
			
			ArrayList<String> categoriesList = new ArrayList<String>();
			if(categoryList != null)
				for(ProductCategoryBean productCategoryBean : categoryList)
					categoriesList.add(productCategoryBean.getCategoryDescription());
			
			
          List<String> locationsListValue=new ArrayList<String>();
  			
  	  		
  			if(location.equals("all")|| location.equals("")){
				if(workLocationsList != null){
					if(zone ==""){
						for(int i=0;i<workLocationsList.size();i++){
							locationsListValue.add(workLocationsList.get(i).getLocationId());
						}
						}
						else
						{
							locationsListValue.add(locationList);
						}
			
					for (String string : locationsListValue) {
						locationListAll = locationListAll+string+",";
					}
				}
				
			}
			
  			
  			if(startDate == null || startDate.equals("") )
			{
				startDate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			
  			
			
			modelAndViewObj = new ModelAndView();
					WarehouseReportObj = reportsServiceObj.getItemTaxesGSTReport(index,maxRecords,brand,zone,category,subCategory,department,subDepartment,section,location,startDate,endDate,searchCriteria,saveFlag,locationListAll);
				
				
				int start = 1,end = Integer.parseInt(maxRecords);
				if(WarehouseReportObj == null || WarehouseReportObj.getReportsList() == null)
				{
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}
				else
				{
					if(WarehouseReportObj.getReportsList().size()<Integer.parseInt(maxRecords)){
	  					end = (WarehouseReportObj.getReportsList().size())+(Integer.parseInt(index));
	  				}
					else{
	  					end = (Integer.parseInt(index)+end);
	  									
					}
					modelAndViewObj.addObject("totalRecords", WarehouseReportObj.getTotalRecords());
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue",end );
					
				}
				modelAndViewObj.addObject("WarehouseReportObj", WarehouseReportObj);
				modelAndViewObj.addObject("countersList", countersList);
				modelAndViewObj.addObject("workLocationsList", workLocationsList);
				modelAndViewObj.addObject("category", category);
				modelAndViewObj.addObject("subcategory", subCategory);
				modelAndViewObj.addObject("subCategoryDetailsList", subCategoryDetailsList);
				modelAndViewObj.addObject("categories", categoriesList);
				modelAndViewObj.addObject("zoneList", zoneList);
				modelAndViewObj.addObject("loc",location);
	  			modelAndViewObj.addObject("startdate", startDate);
				modelAndViewObj.addObject("enddate", endDate);
				modelAndViewObj.addObject("zone", zone);
				modelAndViewObj.addObject("selectedLocation", location);
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.addObject("searchName",searchCriteria);
				if(saveFlag)
				{
					if(WarehouseReportObj.getSalesReportFilePath()!=null)
					modelAndViewObj.addObject("downloadurl", WarehouseReportObj.getSalesReportFilePath());
				}
				modelAndViewObj.setViewName("FinantialManagement/viewOutputItemWiseGstReport");
			}
		
		catch(Exception exception){
		}
	return modelAndViewObj;
	
		}
/*added by manideep	
 * Reason :to Show the Stock Reports flow*/
	@RequestMapping("/showStockReportsFlow")
	public ModelAndView showStockReportsFlow(HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("Show Reports Flows");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.setViewName("Reports/OutletReports/StockReports/showStockReportsFlow");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
		}
	
	
	
	
	@RequestMapping("/viewOutletSalesCreditNoteRedeemReport")
	public ModelAndView viewOutletSalesCreditNoteRedeemReport(
			@RequestParam("flowUnder") String flowUnder, @RequestParam("maxRecords") String maxRecords, 
			@RequestParam("index") String index,@RequestParam("brand") String brand,
			@RequestParam("section") String section,@RequestParam("subDepartment") String subDepartment, 
			@RequestParam("location") String location,@RequestParam("zone") String zone,
			@RequestParam("startDate")String startDate,@RequestParam("endDate") String endDate, 
			@RequestParam("category") String category, @RequestParam("subCategory") String subCategory,			
			@RequestParam("department") String department, @RequestParam("searchCriteria") String searchCriteria,@RequestParam("saveFlag") String saveFlag,@RequestParam("flow") String flow,
			HttpServletRequest request,HttpServletResponse response)
	{
		WarehouseReport WarehouseReportObj = null;
		String locationStr = null,customerIdStr=null,emailIdStr=null;
		List<String> countersList = null;
		ArrayList<LocationBean> workLocationsList = new ArrayList<LocationBean>();
		WarehouseCounterResponse counterDetails = null;
		// log.info("Show Reports - Credit Note Reports Flow");
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			//			workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
//			workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			
			if(zone == null || zone.trim().equals("")){
				if(flow == "" || flow.equals("")){
					workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
					}else{
						workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
					}
			}else{
				if(flow == "" || flow.equals("")){
				workLocationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");
				}else{
					workLocationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Warehouse");

				}
			}

			

			locationStr = (String)request.getSession().getAttribute("selectedLocation");
			if(locationStr == null && workLocationsList != null && workLocationsList.size() > 0)
				locationStr = workLocationsList.get(0).getLocationId();
			
			
			if(flow == "" || flow.equals("")){
				countersList = reportsServiceObj.getCounters(locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
				}else{
				counterDetails = adminServiceObj.getWhCounters("",locationStr,customerIdStr,emailIdStr,index,false,"100");
				}
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty())
			{
				zoneList = genericMasterServiceObj.getZones(null, "", "","-1","","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
			if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty())
			{
				categoryList = outletMasterServiceObj.getCategoryDetails("","", "","-1");
				request.getSession().setAttribute("categoryList", categoryList);
			}
			List<Department> departmentList =(List<Department>)request.getSession().getAttribute("departmentList");
			if(departmentList==null || departmentList.size()==0 || departmentList.isEmpty())
			{
				departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerIdStr, emailIdStr,"-1",false);
				request.getSession().setAttribute("departmentList", departmentList);
			}

			ArrayList<String> categoriesList = new ArrayList<String>();
			if(categoryList != null)
				for(ProductCategoryBean productCategoryBean : categoryList)
					categoriesList.add(productCategoryBean.getCategoryDescription());
			if(flow == "" || flow.equals("")){
				countersList = reportsServiceObj.getCounters(locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
				}else{
				counterDetails = adminServiceObj.getWhCounters("",locationStr,customerIdStr,emailIdStr,index,false,"100");
				}
			//			Added by vijay, to make default location as location list first occurrence, if location is empty
			if((location.trim()).equals("") || location.trim().isEmpty())
			{
				location = workLocationsList.get(0).getLocationId();
			}


			if(startDate == null || startDate.equals("") )
			{
				startDate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}


			modelAndViewObj = new ModelAndView();

			WarehouseReportObj = reportsServiceObj.getSaleCreditNoteRedeemReport(index,maxRecords,brand,zone,category,subCategory,department,subDepartment,section,location,startDate,endDate,searchCriteria,saveFlag);


			int start = 1,end = Integer.parseInt(maxRecords);
			if(WarehouseReportObj == null || WarehouseReportObj.getReportsList() == null)
			{
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}
			else
			{
				if(WarehouseReportObj.getReportsList().size()<Integer.parseInt(maxRecords)){
					end = (WarehouseReportObj.getReportsList().size())+(Integer.parseInt(index));
				}
				else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", WarehouseReportObj.getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue",end );
			}
			modelAndViewObj.addObject("WarehouseReportObj", WarehouseReportObj);
			modelAndViewObj.addObject("countersList", countersList);
			modelAndViewObj.addObject("counterDetails", counterDetails);
			 modelAndViewObj.addObject("flowLocation", flow);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("category", category);
			modelAndViewObj.addObject("categories", categoriesList);
			modelAndViewObj.addObject("zoneList", zoneList);
			modelAndViewObj.addObject("loc",location);
			modelAndViewObj.addObject("startdate", startDate);
			modelAndViewObj.addObject("enddate", endDate);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
			modelAndViewObj.addObject("searchName",searchCriteria);
			modelAndViewObj.addObject("urldownload",WarehouseReportObj.getSalesReportFilePath());

			modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/viewCreditNoteRedeemReport");
		}

		catch(Exception exception){
			////////System.out.println(exception);
		}
		return modelAndViewObj;

	}
	
	
	
	@RequestMapping("/viewOutletCashierEfficiencyReport")
	public ModelAndView viewOutletCashierEfficiencyReport(
			@RequestParam("flowUnder") String flowUnder, @RequestParam("maxRecords") String maxRecords, 
			@RequestParam("index") String index,@RequestParam("brand") String brand,
			@RequestParam("section") String section,@RequestParam("subDepartment") String subDepartment, 
			@RequestParam("location") String location,@RequestParam("zone") String zone,
			@RequestParam("startDate")String startDate,@RequestParam("endDate") String endDate, 
			@RequestParam("category") String category, @RequestParam("subCategory") String subCategory,			
			@RequestParam("department") String department, @RequestParam("searchCriteria") String searchCriteria,@RequestParam("saveFlag") String saveFlag,@RequestParam("flow") String flow,
			HttpServletRequest request,HttpServletResponse response)
	{
		SalesReport  WarehouseReportObj = null;
		String locationStr = null,customerIdStr=null,emailIdStr=null;
		List<String> countersList = null;
		ArrayList<LocationBean> workLocationsList = new ArrayList<LocationBean>();
		WarehouseCounterResponse counterDetails = null;
		// log.info("Show Reports - Credit Note Reports Flow");
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			//			workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
//			workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			
			if(zone == null || zone.trim().equals("")){
				if(flow == "" || flow.equals("")){
					workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
					}else{
						workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
					}
			}else{
				if(flow == "" || flow.equals("")){
				workLocationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");
				}else{
					workLocationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Warehouse");

				}
			}

			

			locationStr = (String)request.getSession().getAttribute("selectedLocation");
			if(locationStr == null && workLocationsList != null && workLocationsList.size() > 0)
				locationStr = workLocationsList.get(0).getLocationId();
			
			if(flow == "" || flow.equals("")){
				countersList = reportsServiceObj.getCounters(locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
				}else{
				counterDetails = adminServiceObj.getWhCounters("",locationStr,customerIdStr,emailIdStr,index,false,"100");
				}
			//countersList = reportsServiceObj.getCounters(locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty())
			{
				zoneList = genericMasterServiceObj.getZones(null, "", "","-1","","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
			if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty())
			{
				categoryList = outletMasterServiceObj.getCategoryDetails("","", "","-1");
				request.getSession().setAttribute("categoryList", categoryList);
			}
			List<Department> departmentList =(List<Department>)request.getSession().getAttribute("departmentList");
			if(departmentList==null || departmentList.size()==0 || departmentList.isEmpty())
			{
				departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerIdStr, emailIdStr,"-1",false);
				request.getSession().setAttribute("departmentList", departmentList);
			}

			ArrayList<String> categoriesList = new ArrayList<String>();
			if(categoryList != null)
				for(ProductCategoryBean productCategoryBean : categoryList)
					categoriesList.add(productCategoryBean.getCategoryDescription());
			if(flow == "" || flow.equals("")){
				countersList = reportsServiceObj.getCounters(locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
				}else{
				counterDetails = adminServiceObj.getWhCounters("",locationStr,customerIdStr,emailIdStr,index,false,"100");
				}

			//			Added by vijay, to make default location as location list first occurrence, if location is empty
			if((location.trim()).equals("") || location.trim().isEmpty())
			{
				location = workLocationsList.get(0).getLocationId();
			}


			if(startDate == null || startDate.equals("") )
			{
				startDate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}


			modelAndViewObj = new ModelAndView();

			WarehouseReportObj = reportsServiceObj.getSaleCashierEfficiencyReport(index,maxRecords,brand,zone,category,subCategory,department,subDepartment,section,location,startDate,endDate,searchCriteria,saveFlag);


			int start = 1,end = Integer.parseInt(maxRecords);
			if(WarehouseReportObj == null || WarehouseReportObj.getReportsList() == null)
			{
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}
			else
			{
				if(WarehouseReportObj.getReportsList().size()<Integer.parseInt(maxRecords)){
					end = (WarehouseReportObj.getReportsList().size())+(Integer.parseInt(index));
				}
				else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", WarehouseReportObj.getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue",end );
			}
			modelAndViewObj.addObject("WarehouseReportObj", WarehouseReportObj);
			modelAndViewObj.addObject("counterDetails", counterDetails);
			 modelAndViewObj.addObject("flowLocation", flow);
			modelAndViewObj.addObject("countersList", countersList);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("category", category);
			modelAndViewObj.addObject("categories", categoriesList);
			modelAndViewObj.addObject("zoneList", zoneList);
			modelAndViewObj.addObject("loc",location);
			modelAndViewObj.addObject("startdate", startDate);
			modelAndViewObj.addObject("enddate", endDate);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
			modelAndViewObj.addObject("searchName",searchCriteria);
			modelAndViewObj.addObject("urldownload",WarehouseReportObj.getSalesReportFilePath());

			modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/viewCashierEfficiencyReport");
		}

		catch(Exception exception){
			////////System.out.println(exception);
		}
		return modelAndViewObj;

	}
	
	
	@RequestMapping(value = "/updateCashDenominations",method=RequestMethod.POST,consumes="application/json")
	public void updateCashDenominations(@RequestBody ReportsRequestBean ReportsRequestBean,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null,str_response = null, roleIdStr= null;
		String jsonString = null;
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
		    roleIdStr = (String)request.getSession().getAttribute("role");
		    
		    str_response = reportsServiceObj.updateCashDenomination(customerIdStr,emailIdStr,roleIdStr,ReportsRequestBean);
		    
			if(str_response.equals(AppProperties.getAppMessageByProperty("Offer_Created_Successfully").trim()))
				 jsonString= "{\"success\":\""+str_response+"\",\"code\":\""+0+"\"}";
			else
				 jsonString = "{\"error\":\""+str_response+"\",\"code\":\""+1+"\"}";
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
	    	response.getWriter().write(jsonString);
			
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("error","Something went wrong");
			modelAndViewObj.setViewName("Deals and Offers/Offers/newoffer");
		}
		finally {
	    	try {
				response.getWriter().close();
			} catch (IOException e) {
				modelAndViewObj.addObject("error","Something went wrong");
				modelAndViewObj.setViewName("Deals and Offers/Offers/newoffer");
				e.printStackTrace();
			}
	    
	    }
}
	
	@RequestMapping("/viewOutletPriceChangeReport")
	public ModelAndView viewOutletPriceChangeReport(@RequestParam("department") String department,@RequestParam("subcategory") String subcategory,@RequestParam("brand") String brand,@RequestParam("startdate") String startdate,@RequestParam("enddate") String enddate,@RequestParam("zone") String zone,@RequestParam("productCategory") String productCategory,@RequestParam("location") String location,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,@RequestParam("saveFlag") boolean saveFlag,@RequestParam("flow") String flow,HttpServletRequest request,HttpServletResponse response){
	String customerIdStr = null,emailIdStr=null;
	ArrayList<LocationBean> locationsList = new ArrayList<LocationBean>();
	try{
			// log.info("Show Reports Flows");
			int start = 1,end = Integer.parseInt(maxRecords);
			modelAndViewObj = new ModelAndView();
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			PriceChangeReportBean  priceChangeReport = new PriceChangeReportBean();
  			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, "", "",index,"","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
			if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
				categoryList = outletMasterServiceObj.getCategoryDetails("","", "","-1");
				request.getSession().setAttribute("categoryList", categoryList);
			}
			
		// locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
//				 genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
		/*	List<String> locationsList =(List<String>)request.getSession().getAttribute("locationsList");
			if(locationsList==null || locationsList.size()==0 || locationsList.isEmpty()){
				locationsList = adminServiceObj.getOutletLocationsList("","",true);
				request.getSession().setAttribute("locationsList", locationsList);
			}*/
			
			
			if(zone == null || zone.trim().equals("")){
				if(flow == "" || flow.equals("")){
					locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
					}else{
						locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
					}
			}else{
				if(flow == "" || flow.equals("")){
					locationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");
				}else{
					locationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Warehouse");

				}
			}
			List<String> brandsList =(List<String>)request.getSession().getAttribute("brandsList");
			if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
				brandsList = adminServiceObj.getBrandNamesList("","");
				request.getSession().setAttribute("brandsList", brandsList);
			}
			
			
			
			if(startdate == null || startdate.equals("") )
			{
				startdate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			if(enddate == null || enddate.equals("") ){
				enddate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			
			priceChangeReport  = reportsServiceObj.getPriceChangeReport(index,maxRecords,zone,location,productCategory,subcategory,brand,startdate,enddate,searchNameStr,saveFlag,department);

			
  			modelAndViewObj = new ModelAndView();
  			if(priceChangeReport == null || priceChangeReport.getItemReportList() == null){
  				modelAndViewObj.addObject("totalRecords","0");
  				modelAndViewObj.addObject("index", "1");
  				modelAndViewObj.addObject("totalValue", "0");
  			}else{
  				if(priceChangeReport.getItemReportList().size()<Integer.parseInt(maxRecords)){
  					end = (priceChangeReport.getItemReportList().size())+(Integer.parseInt(index));
  				}else{
  					end = (Integer.parseInt(index)+end);
  				}
  				modelAndViewObj.addObject("totalRecords", priceChangeReport.getTotalRecords());
  				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
  				modelAndViewObj.addObject("totalValue", end);
  			}
  			if(saveFlag){
				if(priceChangeReport.getSalesReportFilePath()!=null)
				modelAndViewObj.addObject("downloadurl",priceChangeReport.getSalesReportFilePath());
			}
  			modelAndViewObj.addObject("startdate", startdate);
			modelAndViewObj.addObject("enddate", enddate);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("maxRecords", maxRecords);
			modelAndViewObj.addObject("flowLocation", flow);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("department", department);
			modelAndViewObj.addObject("category", productCategory);
			modelAndViewObj.addObject("subcategory", subcategory);
			modelAndViewObj.addObject("brand", brand);
  			modelAndViewObj.addObject("warehousereport", priceChangeReport);
			modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/PriceChangeReport");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
		}
	
	

	@RequestMapping("/cashierShoartageReport")
	public ModelAndView cashierShoartageReport(@RequestParam("cashier") String cashier,
			@RequestParam("startdate") String startdate,@RequestParam("enddate") String enddate,
			@RequestParam("zone") String zone,@RequestParam("counter") String counter,
			@RequestParam("location") String location,@RequestParam("maxRecords") String maxRecords,
			@RequestParam("index") String index,@RequestParam("saveFlag") boolean saveFlag,@RequestParam("flow") String flow,
			HttpServletRequest request,HttpServletResponse response){
		
	String customerIdStr = null,emailIdStr=null;
	ArrayList<LocationBean> locationsList = new ArrayList<LocationBean>();
	List<String> countersList = null;
	WarehouseCounterResponse counterDetails = null;
	try{
			int start = 1,end = Integer.parseInt(maxRecords);
			modelAndViewObj = new ModelAndView();
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			CashierShortageReportBean  priceChangeReport = new CashierShortageReportBean();
  			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, "", "",index,"","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			
			if(zone == null || zone.trim().equals("")){
				if(flow == "" || flow.equals("")){
					locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
					}else{
						locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
					}
			}else{
				if(flow == "" || flow.equals("")){
					locationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");
				}else{
					locationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Warehouse");

				}
			}
			
			if(flow == "" || flow.equals("")){
				countersList = reportsServiceObj.getCounters(location,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
				}else{
				counterDetails = adminServiceObj.getWhCounters("",location,customerIdStr,emailIdStr,index,false,"100");
				}
			ArrayList<EmployeeBean>	 employeeList = genericMasterServiceObj.getemployeesByRole("Cashier",customerIdStr, emailIdStr,"0",location,"",false);
			String empListStr="";
			List<String> counterDetailslist = new ArrayList<String>();
			if(employeeList!=null)
				for(int i=0;i<employeeList.size();i++)
				{
					empListStr=employeeList.get(i).getFirstName(); 
					counterDetailslist.add(empListStr);
				
				}
			
			
			
			
			
			if(startdate == null || startdate.equals("") )
			{
				startdate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			if(enddate == null || enddate.equals("") ){
				enddate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			
			priceChangeReport  = reportsServiceObj.getCashierShortageReport(index,maxRecords,zone,location,counter,cashier,startdate,enddate,saveFlag);

			
  			modelAndViewObj = new ModelAndView();
  			if(priceChangeReport == null || priceChangeReport.getReportList() == null){
  				modelAndViewObj.addObject("totalRecords","0");
  				modelAndViewObj.addObject("index", "1");
  				modelAndViewObj.addObject("totalValue", "0");
  			}else{
  				if(priceChangeReport.getReportList().size()<Integer.parseInt(maxRecords)){
  					end = (priceChangeReport.getReportList().size())+(Integer.parseInt(index));
  				}else{
  					end = (Integer.parseInt(index)+end);
  				}
  				modelAndViewObj.addObject("totalRecords", priceChangeReport.getTotalRecords());
  				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
  				modelAndViewObj.addObject("totalValue", end);
  			}
  			if(saveFlag){
				if(priceChangeReport.getSalesReportFilePath()!=null)
				modelAndViewObj.addObject("downloadurl",priceChangeReport.getSalesReportFilePath());
			}
  			modelAndViewObj.addObject("startdate", startdate);
			modelAndViewObj.addObject("enddate", enddate);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("maxRecords", maxRecords);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("selectedLocation", location);
			//modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("employeeList", counterDetailslist);
			modelAndViewObj.addObject("countersList", countersList);
  			modelAndViewObj.addObject("warehousereport", priceChangeReport);
  			modelAndViewObj.addObject("counterDetails", counterDetails);
			 modelAndViewObj.addObject("flowLocation", flow);
			modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/CashierShortageReport");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
		}
	
	@RequestMapping("/standardSalesReport")
	public ModelAndView standardSalesReport(@RequestParam("salesChannel") String salesChannel,
			@RequestParam("startdate") String startdate,@RequestParam("enddate") String enddate,
			@RequestParam("zone") String zone,@RequestParam("tender") String tender,
			@RequestParam("location") String location,@RequestParam("maxRecords") String maxRecords,
			@RequestParam("index") String index,@RequestParam("saveFlag") boolean saveFlag,@RequestParam("flow") String flow,
			HttpServletRequest request,HttpServletResponse response){
		
	String customerIdStr = null,emailIdStr=null;
	ArrayList<LocationBean> locationsList = new ArrayList<LocationBean>();
	try{
			int start = 1,end = Integer.parseInt(maxRecords);
			modelAndViewObj = new ModelAndView();
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			SalesReport  SalesReport = new SalesReport();
  			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, "", "",index,"","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			
			if(zone == null || zone.trim().equals("")){
				if(flow == "" || flow.equals("")){
					locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
					}else{
						locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
					}
			}else{
				if(flow == "" || flow.equals("")){
					locationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");
				}else{
					locationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Warehouse");

				}
			}
			
			if(startdate == null || startdate.equals("") )
			{
				startdate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			if(enddate == null || enddate.equals("") ){
				enddate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			
			ArrayList<TenderMaster> tenderDetails = genericMasterServiceObj.getTender("",customerIdStr,emailIdStr,"-1",100);
			
			List<SalesReport> salesReportList  = reportsServiceObj.getStandardSalesReport(index,maxRecords,zone,location,salesChannel,tender,startdate,enddate,saveFlag);
			////System.out.println("final::standard_sales_report::::::::::"+gson.toJson(salesReportList));
  			modelAndViewObj = new ModelAndView();
  			if(salesReportList == null || salesReportList.size() == 0){
  				modelAndViewObj.addObject("totalRecords","0");
  				modelAndViewObj.addObject("index", "0");
  				modelAndViewObj.addObject("totalValue", "0");
  			}else{
  				if(salesReportList.size()<Integer.parseInt(maxRecords)){
  					end = (salesReportList.size())+(Integer.parseInt(index));
  				}else{
  					end = (Integer.parseInt(index)+end);
  				}
  				modelAndViewObj.addObject("totalRecords", salesReportList.get(0).getTotalRecords());
  				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
  				modelAndViewObj.addObject("totalValue", end);
  			}
  			if(saveFlag){
				if(salesReportList.get(0).getSalesReportFilePath()!=null)
				modelAndViewObj.addObject("downloadurl",salesReportList.get(0).getSalesReportFilePath());
			}
  			modelAndViewObj.addObject("startdate", startdate);
			modelAndViewObj.addObject("enddate", enddate);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("maxRecords", maxRecords);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("selectedSalesChannel", salesChannel);
			modelAndViewObj.addObject("selectedTender", tender);
  			modelAndViewObj.addObject("StandardSalesList", salesReportList);
  			modelAndViewObj.addObject("tenderDetails",tenderDetails);
  			 modelAndViewObj.addObject("flowLocation", flow);
			modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/StandardSalesReport");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
		}
	
	
	@RequestMapping("/standardSalesDetailedReport")
	public ModelAndView standardSalesDetailedReport(@RequestParam("salesChannel") String salesChannel,
			@RequestParam("startdate") String startdate,@RequestParam("enddate") String enddate,
			@RequestParam("zone") String zone,@RequestParam("tender") String tender,
			@RequestParam("location") String location,@RequestParam("maxRecords") String maxRecords,
			@RequestParam("index") String index,@RequestParam("saveFlag") boolean saveFlag,@RequestParam("flow") String flow,
			HttpServletRequest request,HttpServletResponse response){
		
	String customerIdStr = null,emailIdStr=null;
	ArrayList<LocationBean> locationsList = new ArrayList<LocationBean>();
	try{
			int start = 1,end = Integer.parseInt(maxRecords);
			modelAndViewObj = new ModelAndView();
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			CashierShortageReportBean  priceChangeReport = new CashierShortageReportBean();
  			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, "", "",index,"","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			
			if(zone == null || zone.trim().equals("")){
				if(flow == "" || flow.equals("")){
					locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
					}else{
						locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
					}
			}else{
				if(flow == "" || flow.equals("")){
					locationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");
				}else{
					locationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Warehouse");

				}
			}
			if(startdate == null || startdate.equals("") )
			{
				startdate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			if(enddate == null || enddate.equals("") ){
				enddate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			
			ArrayList<TenderMaster> tenderDetails = genericMasterServiceObj.getTender("",customerIdStr,emailIdStr,"-1",100);
			List<SalesReport> salesReportList  = reportsServiceObj.getStandardSalesDetailedReport(index,maxRecords,zone,location,salesChannel,tender,startdate,enddate,saveFlag);
			////System.out.println("final::standard_sales_Detailed_report::::::::::"+gson.toJson(salesReportList));
  			modelAndViewObj = new ModelAndView();
  			if(salesReportList == null || salesReportList.size() == 0){
  				modelAndViewObj.addObject("totalRecords","0");
  				modelAndViewObj.addObject("index", "0");
  				modelAndViewObj.addObject("totalValue", "0");
  			}else{
  				if(salesReportList.size()<Integer.parseInt(maxRecords)){
  					end = (salesReportList.size())+(Integer.parseInt(index));
  				}else{
  					end = (Integer.parseInt(index)+end);
  				}
  				modelAndViewObj.addObject("totalRecords", salesReportList.get(0).getTotalRecords());
  				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
  				modelAndViewObj.addObject("totalValue", end);
  			}
  			if(saveFlag){
				if(salesReportList.get(0).getSalesReportFilePath()!=null)
				modelAndViewObj.addObject("downloadurl",salesReportList.get(0).getSalesReportFilePath());
			}
  			modelAndViewObj.addObject("startdate", startdate);
			modelAndViewObj.addObject("enddate", enddate);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("maxRecords", maxRecords);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("selectedSalesChannel", salesChannel);
			modelAndViewObj.addObject("selectedTender", tender);
  			modelAndViewObj.addObject("StandardSalesList", salesReportList);
  			modelAndViewObj.addObject("tenderDetails",tenderDetails);
  			 modelAndViewObj.addObject("flowLocation", flow); 
			modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/StandardSalesDetailedReport");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
		}
	
	
	
	
	
	

	@RequestMapping(value="/viewOutletXZReadingReportDiff",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView viewOutletXZReadingReportDiff(@RequestBody Reports reportObj,HttpServletRequest request,HttpServletResponse response){
		ArrayList<LocationBean> workLocationsList = new ArrayList<LocationBean> ();
		int start = 1,end = Integer.parseInt(reportObj.getMaxRecords());
		String index=reportObj.getStartIndex();
		String locationListAll="";
		List<String> countersList = null;
		List<ZoneMaster> zoneList = null;
		WarehouseCounterResponse counterDetails = null;
		
		String locationStr = null,customerIdStr=null,emailIdStr=null;
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			
			if(reportObj.getZone() == null || reportObj.getZone().equals("")){
				if(reportObj.getFlow() == "" || reportObj.getFlow().equals("")){
					workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
					}else{
						workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
					}
				
			}else
				{

				if(reportObj.getFlow() == "" || reportObj.getFlow().equals("")){
					 zoneList = genericMasterServiceObj.getZonalLocationBasedonZone(reportObj.getZone(), customerIdStr, emailIdStr, "0","","","Retail Outlet");
					}else{
				     zoneList = genericMasterServiceObj.getZonalLocationBasedonZone(reportObj.getZone(), customerIdStr, emailIdStr, "0","","","Warehouse");

					}
				
				LocationBean saleLocation = null;
					
					for(String zoneItems : zoneList.get(0).getZones() )
					{
						String zoneArray[] = zoneItems.split("\\+");
						saleLocation = new LocationBean(); 
						if(zoneArray != null && zoneArray.length>0)
						{
							saleLocation.setLocationId(zoneArray[0]);
							if(zoneArray.length > 1)
							saleLocation.setBusinessActivity(zoneArray[1]);
							if(zoneArray.length > 2)
							saleLocation.setDescription(zoneArray[2]);
							workLocationsList.add(saleLocation);
						} 
					}
				
				}
			
			
			
			locationStr=reportObj.getLocation();
			
			if(reportObj.getStore_location() =="" || reportObj.getStore_location().equals("")){
				reportObj.setStore_location(workLocationsList.get(0).getLocationId());
			}
			
			
			if(reportObj.getFlow() == "" || reportObj.getFlow().equals("")){
				countersList = reportsServiceObj.getCounters(locationStr,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
				}else{
				counterDetails = adminServiceObj.getWhCounters("",locationStr,customerIdStr,emailIdStr,index,false,"100");
				}
			zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				request.getSession().setAttribute("zoneList", zoneList);
			}
			
			
			XZReportBean reports=	reportsServiceObj.getOutletXZReportDiff(reportObj,customerIdStr,emailIdStr);
			
			
			
			modelAndViewObj = new ModelAndView();
			
			if(reports.getResponseHeader().getResponseCode() == "0" || reports.getResponseHeader().getResponseCode().equals("0")){
				
				if(reports.getXzReportList().size()<end){
					end = (reports.getXzReportList().size())+(Integer.parseInt(index));
				}else{
					end = (reports.getXzReportList().size())+(Integer.parseInt(index));
				}
				modelAndViewObj.addObject("totalRecords", reports.getTotalRecords());
				
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
				
			}else{
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
				modelAndViewObj.addObject("errorMsg",reports.getResponseHeader().getResponseMessage());
					
			}
			
			
			
			
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("countersList", countersList);
			modelAndViewObj.addObject("counterDetails", counterDetails);
			 modelAndViewObj.addObject("flowLocation", reportObj.getFlow());
			modelAndViewObj.addObject("reports", reports);
			modelAndViewObj.addObject("selectedLocation",reportObj.getStore_location());
			modelAndViewObj.addObject("zone",reportObj.getZone());
			modelAndViewObj.addObject("startdate",reportObj.getReportDate());
			
			modelAndViewObj.addObject("maxRecords",Integer.parseInt(reportObj.getMaxRecords()));
			
			
			modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/xzreadingreport");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
		}
	
	
	@RequestMapping("/viewPurchaseReports")
	public ModelAndView viewPurchaseReports(@RequestParam("index") String index,@RequestParam("flow") String flow,@RequestParam("zone") String zone, @RequestParam("category") String category, @RequestParam("startDate") String startDate, @RequestParam("location") String location, @RequestParam("items") String items, @RequestParam("supplierSearch") String supplierSearch,@RequestParam("supplierID") String supplierID, @RequestParam("endDate") String endDate, @RequestParam("search") String search, @RequestParam("maxRecords") String maxRecords,@RequestParam("save") String save,HttpServletRequest request,HttpServletResponse response){
	String customerIdStr = null,emailIdStr=null;
	ArrayList<LocationBean> locationsList = new ArrayList<LocationBean>();
	List<ZoneMaster> zonList = null;
	try{
		customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			int start = 1,end = Integer.parseInt(maxRecords);
			List<PurchaseReportsBean>  purchasereport = new ArrayList<PurchaseReportsBean>();
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
		if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
			 zoneList = genericMasterServiceObj.getZones(null, "", "",index,"","");
			request.getSession().setAttribute("zoneList", zoneList);
		}
		List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
		if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
			categoryList = outletMasterServiceObj.getCategoryDetails("","", "","-1");
			request.getSession().setAttribute("categoryList", categoryList);
		}
		List<String> brandsList =(List<String>)request.getSession().getAttribute("brandsList");
		if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
			brandsList = adminServiceObj.getBrandNamesList("","");
			request.getSession().setAttribute("brandsList", brandsList);
		}
		List<Suppliers> supplierList =(List<Suppliers>)request.getSession().getAttribute("supplierList");
		if(supplierList==null || supplierList.size()==0 || supplierList.isEmpty()){
			 supplierList = outletMasterServiceObj.getSuppliers("", "","-1","","");
			request.getSession().setAttribute("supplierList", supplierList);
		}
		//locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
		if(zone == null || zone.trim().equals("")){
			if(flow == "" || flow.equals("")){
				locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
				}else{
					locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
				}
		}else
		{
			if(flow == "" || flow.equals("")){
			 zonList = genericMasterServiceObj.getZonalLocationBasedonZone(zone, customerIdStr, emailIdStr, "0","","","Retail Outlet");
			}else{
		     zonList = genericMasterServiceObj.getZonalLocationBasedonZone(zone, customerIdStr, emailIdStr, "0","","","Warehouse");

			}
			
		
			LocationBean saleLocation = null;
			
			for(String zoneItems : zonList.get(0).getZones() )
			{
				String zoneArray[] = zoneItems.split("\\+");
				saleLocation = new LocationBean(); 
				if(zoneArray != null && zoneArray.length>0)
				{
					saleLocation.setLocationId(zoneArray[0]);
					if(zoneArray.length > 1)
						saleLocation.setBusinessActivity(zoneArray[1]);
					if(zoneArray.length > 2)
						saleLocation.setDescription(zoneArray[2]);
					locationsList.add(saleLocation);
				} 
			}
		}
	
			if((location.trim()).equals("") || location.trim().isEmpty())
			{
				location = locationsList.get(0).getLocationId();
			}
			
			if(startDate == null || startDate.equals("") )
			{
				startDate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			
			
			purchasereport  = reportsServiceObj.getPurchaseReport(index,flow,zone,category,supplierSearch,startDate,location,items,supplierID,endDate,search,maxRecords,save);
			//
			modelAndViewObj = new ModelAndView();
			if(purchasereport == null || purchasereport == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(purchasereport.size()<Integer.parseInt(maxRecords)){
					end = (purchasereport.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", purchasereport.get(0).getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			if(save == "true" || save.equals("true")){
				if(purchasereport.get(0).getFileUrl() != null)
		modelAndViewObj.addObject("urlgenerated", purchasereport.get(0).getFileUrl());
			}

		modelAndViewObj.addObject("startdate", startDate);
		modelAndViewObj.addObject("enddate", endDate);
		modelAndViewObj.addObject("zone", zone);
		modelAndViewObj.addObject("selectedLocation", location);
		modelAndViewObj.addObject("searchName", search);
		modelAndViewObj.addObject("category", category);
		modelAndViewObj.addObject("items", items);
		modelAndViewObj.addObject("supplierSearch", supplierSearch);
		modelAndViewObj.addObject("maxRecords", maxRecords);
		modelAndViewObj.addObject("supplierId", supplierID);
		modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("purchasereport", purchasereport);
		    modelAndViewObj.addObject("flowLocation", flow);
		
			modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/purchaseReport");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
		}



@RequestMapping("/viewStockIssueReport")
	public ModelAndView viewStockIssueReport(@RequestParam("index") String index,@RequestParam("flow") String flow,@RequestParam("zone") String zone, @RequestParam("category") String category,@RequestParam("brand") String brand, @RequestParam("startDate") String startDate, @RequestParam("location") String location, @RequestParam("subCategory") String subCategory, @RequestParam("supplier") String supplier, @RequestParam("endDate") String endDate, @RequestParam("search") String search, @RequestParam("maxRecords") String maxRecords,HttpServletRequest request,HttpServletResponse response){
	String customerIdStr = null,emailIdStr=null;
	ArrayList<LocationBean> locationsList = new ArrayList<LocationBean>();
	List<ZoneMaster> zonList = null;
	try{
		customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			int start = 1,end = Integer.parseInt(maxRecords);
			List<WHStockIssueReportBean>  warehousereport = new ArrayList<WHStockIssueReportBean>();
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
		if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
			 zoneList = genericMasterServiceObj.getZones(null, "", "",index,"","");
			request.getSession().setAttribute("zoneList", zoneList);
		}
		List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
		if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
			categoryList = outletMasterServiceObj.getCategoryDetails("","", "","-1");
			request.getSession().setAttribute("categoryList", categoryList);
		}
		List<String> brandsList =(List<String>)request.getSession().getAttribute("brandsList");
		if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
			brandsList = adminServiceObj.getBrandNamesList("","");
			request.getSession().setAttribute("brandsList", brandsList);
		}
		List<Suppliers> supplierList =(List<Suppliers>)request.getSession().getAttribute("supplierList");
		if(supplierList==null || supplierList.size()==0 || supplierList.isEmpty()){
			 supplierList = outletMasterServiceObj.getSuppliers("", "","-1","","");
			request.getSession().setAttribute("supplierList", supplierList);
		}
		//locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
		if(zone == null || zone.trim().equals("")){
			if(flow == "" || flow.equals("")){
				locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
				}else{
					locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
				}
		}else
		{
			if(flow == "" || flow.equals("")){
			 zonList = genericMasterServiceObj.getZonalLocationBasedonZone(zone, customerIdStr, emailIdStr, "0","","","Retail Outlet");
			}else{
		     zonList = genericMasterServiceObj.getZonalLocationBasedonZone(zone, customerIdStr, emailIdStr, "0","","","Warehouse");

			}
			
		
			LocationBean saleLocation = null;
			
			for(String zoneItems : zonList.get(0).getZones() )
			{
				String zoneArray[] = zoneItems.split("\\+");
				saleLocation = new LocationBean(); 
				if(zoneArray != null && zoneArray.length>0)
				{
					saleLocation.setLocationId(zoneArray[0]);
					if(zoneArray.length > 1)
						saleLocation.setBusinessActivity(zoneArray[1]);
					if(zoneArray.length > 2)
						saleLocation.setDescription(zoneArray[2]);
					locationsList.add(saleLocation);
				} 
			}
		}
		
	
			if((location.trim()).equals("") || location.trim().isEmpty())
			{
				location = locationsList.get(0).getLocationId();
			}
			
			if(startDate == null || startDate.equals("") )
			{
				startDate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
			}
			
			
			warehousereport  = reportsServiceObj.getOutletStockIssueReport(index,flow,zone,category,brand,startDate,location,subCategory,supplier,endDate,search,maxRecords);

			modelAndViewObj = new ModelAndView();
			if(warehousereport == null || warehousereport == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(warehousereport.size()<Integer.parseInt(maxRecords)){
					end = (warehousereport.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", warehousereport.get(0).getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
		
			modelAndViewObj.addObject("startdate", startDate);
		modelAndViewObj.addObject("enddate", endDate);
		modelAndViewObj.addObject("zone", zone);
		modelAndViewObj.addObject("selectedLocation", location);
		modelAndViewObj.addObject("searchName", search);
		modelAndViewObj.addObject("category", category);
		modelAndViewObj.addObject("subcategory", subCategory);
		modelAndViewObj.addObject("brand", brand);
		modelAndViewObj.addObject("maxRecords", maxRecords);
		modelAndViewObj.addObject("supplierId", supplier);
		modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("warehousereport", warehousereport);
		    modelAndViewObj.addObject("flowLocation", flow);
			modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/stockIssueReport");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
		}
@SuppressWarnings("unchecked")
@RequestMapping("/PrintPriceVariationReport")
public void PrintPriceVariationReport(@RequestParam("supplierId") String supplierId,@RequestParam("department") String department,@RequestParam("subcategory") String subcategory,@RequestParam("brand") String brand,@RequestParam("startdate") String startdate,@RequestParam("enddate") String enddate,@RequestParam("zone") String zone,@RequestParam("productCategory") String productCategory,@RequestParam("location") String location,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,@RequestParam("saveFlag") boolean saveFlag,@RequestParam("printFlag") boolean printFlag,HttpServletRequest request,HttpServletResponse response){
	
	String locationStr = null,customerIdStr=null,emailIdStr=null;
	customerIdStr = (String)request.getSession().getAttribute("customerId");
	emailIdStr  = (String)request.getSession().getAttribute("emailId");
	try{
			
		String result  = reportsServiceObj.PrintSalesPriceVariationReport(index,maxRecords,zone,location,productCategory,subcategory,brand,startdate,enddate,searchNameStr,supplierId,department,saveFlag,printFlag);
		
		response.setContentType("application/text");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(result);
		
				}
		catch(Exception exception){
			exception.printStackTrace();
		}
		
	}


@RequestMapping("/viewEventSummaryReport")
public ModelAndView viewEventSummaryReport(@RequestParam("index")String index,
		@RequestParam("maxRecords") String maxRecords,@RequestParam("zone")String zone,
		@RequestParam("location") String location,
		@RequestParam("eventType")String eventType,
		@RequestParam("salesPerson") String salesPerson,
		@RequestParam("status") String  status,
		@RequestParam("startDate") String startDate,
		@RequestParam("endDate")String endDate,
		@RequestParam("eventReport") boolean eventReport,
		@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
	
	String customerIdStr=null,emailIdStr=null;
	List<String> locationsList = null;
	String locationListAll="";
	List<EmployeeBean> employeeList = new ArrayList<EmployeeBean>();
	List<EventMaster> eventMasters = new ArrayList<EventMaster>();
	String resultStr;
	try{
		// log.info("Show Reports Flows");
		int start = 1,end = Integer.parseInt(maxRecords);
		modelAndViewObj = new ModelAndView();
		customerIdStr = (String)request.getSession().getAttribute("customerId");
		emailIdStr = (String)request.getSession().getAttribute("emailId");
		locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
		
		if(locationsList != null){
			
		for (String string : locationsList) {
			
			locationListAll = locationListAll+string+","; 
			}
		}
		
		List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
		if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
			zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"0","","");
			request.getSession().setAttribute("zoneList", zoneList);
		}
		
		employeeList = genericMasterServiceObj.getEmployees("",customerIdStr, emailIdStr,index,"","100",false,locationListAll);

		eventMasters = outletMasterServiceObj.getEventManagementDetails(customerIdStr, emailIdStr,index,maxRecords,"",true,zone,location,eventType,salesPerson,status,startDate,endDate,searchName,eventReport);
		
		
		if(eventMasters == null || eventMasters.size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(eventMasters.size()<Integer.parseInt(maxRecords)){
				end = (eventMasters.size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			
			modelAndViewObj.addObject("totalRecords", (eventMasters.get(0).getTotalRecords()));
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
		} //for max records
		
		
		if(eventReport){
			if(eventMasters != null)
			modelAndViewObj.addObject("printUrl", eventMasters.get(0).getUrl());	
				}
		
		modelAndViewObj.addObject("maxRecords", maxRecords);
		modelAndViewObj.addObject("eventMastersList", eventMasters);
		modelAndViewObj.addObject("employeeList", employeeList);
		modelAndViewObj.addObject("locationsList", locationsList);
		
		modelAndViewObj.addObject("selectedzone", zone);
		modelAndViewObj.addObject("selectedlocation", location);
		modelAndViewObj.addObject("selectedeventType", eventType);
		modelAndViewObj.addObject("selectedsalesPerson", salesPerson);
		modelAndViewObj.addObject("selectedstatus", status);
		modelAndViewObj.addObject("selectedstartDate", startDate);
		modelAndViewObj.addObject("selectedendDate", endDate);
		modelAndViewObj.addObject("selectedsearchName", searchName);
		
		modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/eventSummaryReport");
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
	}


@RequestMapping("/viewEventInventory")
public ModelAndView viewEventInventory(@RequestParam("index") String index,
		@RequestParam("maxRecords") String maxRecords,
		@RequestParam("zone") String zone,
		@RequestParam("location") String location,
		@RequestParam("counterId") String counterId,
		@RequestParam("salesChannel") String salesChannel,
		@RequestParam("startDate") String startDate,
		@RequestParam("endDate") String endDate,
		@RequestParam("searchName") String searchName,
		@RequestParam("category") String category,
		@RequestParam("subcategory") String subcategory,
		@RequestParam("brand") String brand,
		@RequestParam("billType") String billType,
		@RequestParam("flowUnder") String flowUnder, 
		@RequestParam("status") String status,
		@RequestParam("saveReport") boolean saveReport, 
		HttpServletRequest request,HttpServletResponse response){
	List<String> locationsList = null;
	List<String> countersList = null;
	String locationListAll="";
	List<EventInventoryTransferReport> inventoryTransferList = null;
	WarehouseCounterResponse counterDetails = null;

	try{
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr  = (String)request.getSession().getAttribute("emailId");

		List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
		if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
			zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"0","","");
			request.getSession().setAttribute("zoneList", zoneList);
		}
		List<String> brandsList = (List<String>)request.getSession().getAttribute("brandsList");
		if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
		 brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
			request.getSession().setAttribute("brandsList", brandsList);
		}
		List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
		if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
			categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
			request.getSession().setAttribute("categoryList", categoryList);
		}
		
		
		if(flowUnder.equals("outlet")){
			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			countersList = reportsServiceObj.getCounters("",customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
			
			inventoryTransferList = reportsServiceObj.getEventInventoryTransfer(customerIdStr,emailIdStr,index,maxRecords,zone,location,category,subcategory,brand,startDate,endDate,searchName,salesChannel,counterId,billType,locationListAll,saveReport,status);

		}else{
			locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
			counterDetails = adminServiceObj.getWhCounters("","",customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX,false,"100");
		}
		
		if(locationsList != null){
			for (String string : locationsList) {
				locationListAll = locationListAll+string+","; 
				}
			}
		
		modelAndViewObj = new ModelAndView();
		if(inventoryTransferList == null || inventoryTransferList.size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(inventoryTransferList.size()<Integer.parseInt(maxRecords)){
				end = (inventoryTransferList.size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			
			modelAndViewObj.addObject("totalRecords", (inventoryTransferList.get(0).getTotalRecords()));
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
		} //for max records
		
		
		if(saveReport){
			if(inventoryTransferList != null)
			modelAndViewObj.addObject("printUrl", inventoryTransferList.get(0).getURL());	
				}
		
		
		modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
		modelAndViewObj.addObject("inventoryList", inventoryTransferList);
		modelAndViewObj.addObject("brandsList", brandsList);
		modelAndViewObj.addObject("countersList", countersList);
		modelAndViewObj.addObject("counterDetails", counterDetails);
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("flowUnder", flowUnder);
		modelAndViewObj.addObject("startdate", startDate);
		modelAndViewObj.addObject("enddate", endDate);
		modelAndViewObj.addObject("zone", zone);
		modelAndViewObj.addObject("brand", brand);
		modelAndViewObj.addObject("salesChannel", salesChannel);
		modelAndViewObj.addObject("selectedLocation", location);
		modelAndViewObj.addObject("counterId", counterId);
		modelAndViewObj.addObject("searchName", searchName);
		modelAndViewObj.addObject("selectedstatus", status);
		modelAndViewObj.addObject("category",category);
		modelAndViewObj.addObject("subcategory", subcategory);
		modelAndViewObj.addObject("selectedbillType", billType);
		
		modelAndViewObj.setViewName("Reports/OutletReports/StockReports/EventInventory");
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}

	


@RequestMapping("/viewEventsReport")
public ModelAndView viewEventsReport(@RequestParam("index")String index,
                @RequestParam("maxRecords") String maxRecords,@RequestParam("zone")String zone,
                @RequestParam("location") String location,
                @RequestParam("eventType")String eventType,
                @RequestParam("salesPerson") String salesPerson,
                @RequestParam("status") String  status,
                @RequestParam("startDate") String startDate,
                @RequestParam("endDate")String endDate,
                @RequestParam("eventReport") boolean eventReport,
                @RequestParam("criteriaStr") String criteriaStr,
                @RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
        
        String customerIdStr=null,emailIdStr=null;
        List<String> locationsList = null;
        String locationListAll="";
        List<EmployeeBean> employeeList = new ArrayList<EmployeeBean>();
        ReportsBean eventReportList = null;
        String resultStr;
        try{
                int start = 1,end = Integer.parseInt(maxRecords);
                modelAndViewObj = new ModelAndView();
                customerIdStr = (String)request.getSession().getAttribute("customerId");
                emailIdStr = (String)request.getSession().getAttribute("emailId");
                locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
                
                if(locationsList != null){
                        
                for (String string : locationsList) {
                        
                        locationListAll = locationListAll+string+","; 
                        }
                }
                
                List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
                if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
                        zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"0","","");
                        request.getSession().setAttribute("zoneList", zoneList);
                }
                
                employeeList = genericMasterServiceObj.getEmployees("",customerIdStr, emailIdStr,index,"","100",false,locationListAll);

                eventReportList = reportsServiceObj.getEventReportDetails(customerIdStr,emailIdStr,index,maxRecords,zone,location,eventType,salesPerson,startDate,endDate,searchName,status,criteriaStr,eventReport);
                
                
                if(eventReportList == null || eventReportList.getReportsList() == null){
                        modelAndViewObj.addObject("totalRecords","0");
                        modelAndViewObj.addObject("index", "0");
                        modelAndViewObj.addObject("totalValue", "0");
                }else{
                        if(eventReportList.getReportsList().size()<Integer.parseInt(maxRecords)){
                                end = (eventReportList.getReportsList().size())+(Integer.parseInt(index));
                        }else{
                                end = (Integer.parseInt(index)+end);
                        }
                        
                        modelAndViewObj.addObject("totalRecords", eventReportList.getTotalRecords());
                        modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
                        modelAndViewObj.addObject("totalValue", end);
                } //for max records
                
                if(eventReportList.getReportsList() != null){
                        for(SalesReportsBean report : eventReportList.getReportsList()){
                                report.setFinalSoldQty(eventReportList.getReportSummery().getFinalSoldQty());
                                report.setFinalTotal(eventReportList.getReportSummery().getFinalTotal());
                                }
                        
                        modelAndViewObj.addObject("totalSoldValue", eventReportList.getReportSummery().getFinalTotal());
                        modelAndViewObj.addObject("totalSoldQty", eventReportList.getReportSummery().getFinalSoldQty());
                        }
                
                if(eventReport){
                        if(eventReportList != null)
                        modelAndViewObj.addObject("printUrl", eventReportList.getSalesReportFilePath());        
                }
                
                modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
                modelAndViewObj.addObject("eventReportList", eventReportList.getReportsList());
                modelAndViewObj.addObject("employeeList", employeeList);
                modelAndViewObj.addObject("locationsList", locationsList);
                
                modelAndViewObj.addObject("selectedzone", zone);
                modelAndViewObj.addObject("selectedlocation", location);
                modelAndViewObj.addObject("selectedeventType", eventType);
                modelAndViewObj.addObject("selectedsalesPerson", salesPerson);
                modelAndViewObj.addObject("selectedstatus", status);
                modelAndViewObj.addObject("selectedstartDate", startDate);
                modelAndViewObj.addObject("selectedendDate", endDate);
                modelAndViewObj.addObject("selectedsearchName", searchName);
                
                modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/eventsReport");
        }catch(Exception exception){
                exception.printStackTrace();
        }
        return modelAndViewObj;
        }
        
        


@RequestMapping("/viewEventSalesReports")
public ModelAndView viewEventSalesReports(@RequestParam("index") String index,
                @RequestParam("maxRecords") String maxRecords,
                @RequestParam("zone") String zone,
                @RequestParam("location") String location,
                @RequestParam("salesChannel") String salesChannel,
                @RequestParam("startDate") String startDate,
                @RequestParam("endDate") String endDate,
                @RequestParam("searchName") String searchName,
                @RequestParam("category") String category,
                @RequestParam("subcategory") String subcategory,
                @RequestParam("brand") String brand,
                @RequestParam("flowUnder") String flowUnder, 
                @RequestParam("saveReport") boolean saveReport, 
                @RequestParam("criteriaStr") String criteriaStr, 
                HttpServletRequest request,HttpServletResponse response){
        List<String> locationsList = null;
        String locationListAll="";
        ReportsBean reportList = null;

        try{
                        int start = 1,end = Integer.parseInt(maxRecords);
                        String customerIdStr = (String)request.getSession().getAttribute("customerId");
                        String emailIdStr  = (String)request.getSession().getAttribute("emailId");

                List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
                if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
                        zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"0","","");
                        request.getSession().setAttribute("zoneList", zoneList);
                }
                List<String> brandsList = (List<String>)request.getSession().getAttribute("brandsList");
                if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
                 brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
                        request.getSession().setAttribute("brandsList", brandsList);
                }
                List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
                if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
                        categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
                        request.getSession().setAttribute("categoryList", categoryList);
                }
                
                
                if(flowUnder.equals("outlet")){
                        locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
                        
                        reportList =  reportsServiceObj.getEventSalesReports(customerIdStr,emailIdStr,index,maxRecords,zone,location,category,subcategory,startDate,endDate,searchName,criteriaStr,saveReport);

                }else{
                        locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
                }
                
                if(locationsList != null){
                        for (String string : locationsList) {
                                locationListAll = locationListAll+string+","; 
                                }
                        }
                
                modelAndViewObj = new ModelAndView();
                
                if(reportList == null || reportList.getReportsList() == null){
                        modelAndViewObj.addObject("totalRecords","0");
                        modelAndViewObj.addObject("index", "0");
                        modelAndViewObj.addObject("totalValue", "0");
                }else{
                        if(reportList.getReportsList().size()<Integer.parseInt(maxRecords)){
                                end = (reportList.getReportsList().size())+(Integer.parseInt(index));
                        }else{
                                end = (Integer.parseInt(index)+end);
                        }
                        modelAndViewObj.addObject("totalRecords", reportList.getTotalRecords());
                        modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
                        modelAndViewObj.addObject("totalValue", end);
                } //for max records
                
                
                if(reportList.getReportsList() != null){
                for(SalesReportsBean report : reportList.getReportsList()){
                        report.setFinalSoldQty(reportList.getReportSummery().getFinalSoldQty());
                        report.setFinalTotal(reportList.getReportSummery().getFinalTotal());
                        }
                
                modelAndViewObj.addObject("totalSoldValue", reportList.getReportSummery().getFinalTotal());
                modelAndViewObj.addObject("totalSoldQty", reportList.getReportSummery().getFinalSoldQty());
                }
                if(saveReport){
                        if(reportList != null)
                                modelAndViewObj.addObject("printUrl", reportList.getSalesReportFilePath());        
                        }
                
                modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
                modelAndViewObj.addObject("billsReportList", reportList.getReportsList());
                
                modelAndViewObj.addObject("brandsList", brandsList);
                modelAndViewObj.addObject("locationsList", locationsList);
                modelAndViewObj.addObject("flowUnder", flowUnder);
                modelAndViewObj.addObject("startdate", startDate);
                modelAndViewObj.addObject("enddate", endDate);
                modelAndViewObj.addObject("zone", zone);
                modelAndViewObj.addObject("brand", brand);
                modelAndViewObj.addObject("salesChannel", salesChannel);
                modelAndViewObj.addObject("selectedLocation", location);
                modelAndViewObj.addObject("searchName", searchName);
                modelAndViewObj.addObject("category",category);
                modelAndViewObj.addObject("subcategory", subcategory);
                
                modelAndViewObj.setViewName("Reports/OutletReports/OutletSalesReports/billWiseReport");
                
        }catch(Exception exception){
                exception.printStackTrace();
        }
        return modelAndViewObj;
}


@RequestMapping(value="/updateMcnDetails",method=RequestMethod.POST,consumes="application/json")
public ModelAndView updateMcnDetails(@RequestBody WarehouseReport warehouseReport,HttpServletRequest request,HttpServletResponse response){
	
	try{
		String maxRecords=warehouseReport.getMaxRecords();
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		modelAndViewObj = new ModelAndView();
		
		String resultStr = reportsServiceObj.updateMcnDetails(warehouseReport, customerIdStr, emailIdStr);
		
		WarehouseReport WarehouseReportObj = reportsServiceObj.getSaleCreditNoteReportByBillId(warehouseReport.getCreditNoteRef(),"0","","");
		
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("warehouseReportObj", WarehouseReportObj);
			
		if(!resultStr.contains("Success")){
			modelAndViewObj.addObject("err", resultStr);
		}
		else{
			modelAndViewObj.addObject("success", resultStr);
		}
		modelAndViewObj.addObject("operation", "edit");
		modelAndViewObj.addObject("maxRecords", maxRecords);
		modelAndViewObj.setViewName("Inventory Manager/Billing/editMCNDetails");
		
	}catch(Exception exception){
		exception.printStackTrace();
	}
	
	
	return modelAndViewObj;
}
	
//end of controller	
}
