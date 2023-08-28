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

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
//import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.tlabs.posweb.beans.Department;
import com.tlabs.posweb.beans.LocationBean;
import com.tlabs.posweb.beans.OrdersDashboardBean;
import com.tlabs.posweb.beans.ProductCategoryBean;
import com.tlabs.posweb.beans.ReportsBean;
import com.tlabs.posweb.beans.TurnOverDashBoardBean;
import com.tlabs.posweb.beans.WastageDashboardBean;
import com.tlabs.posweb.beans.ZoneMaster;
import com.tlabs.posweb.services.AdminService;
import com.tlabs.posweb.services.DashboardService;
import com.tlabs.posweb.services.DepartmentService;
import com.tlabs.posweb.services.GenericMasterService;
import com.tlabs.posweb.services.OutletMasterService;

/**
 * @author Sahitya
 * Verified By : 
 * 
 * This controller is used to send/receive reports related data 
 */

@Controller
@RequestMapping(value = "/dashboard")
public class DashboardController {

	
//private static Logger log = Logger.getLogger(DashboardController.class);
	
	private ModelAndView modelAndViewObj;
	
	
	@Autowired
	private AdminService adminServiceObj;
	@Autowired
	private OutletMasterService outletMasterServiceObj;
	@Autowired
	private DashboardService dashboardServiceObj;
	@Autowired
    private GenericMasterService genericMasterServiceObj;
	@Autowired
	private DepartmentService departmentServiceObj;
	 @Autowired
	    private Gson gson;
	/**
	 * 
	 * @author Sahitya
	 * 
	 *This method is used to display dashboard flows
	 *
	 **/
	@RequestMapping("/showDashboardFlows")
	public ModelAndView showReportsFlows(HttpServletRequest request,HttpServletResponse response){
		try{
			//log.info("Show Dashboard Flows");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.setViewName("dashboard");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
		}
	
	/**
	 * 
	 * @author Sahitya
	 * 
	 *This method is used to display outlet dashboard
	 *
	 **//*
	@RequestMapping("/showOutletDashboard")
	public ModelAndView showOutletDashboard(@RequestParam("location") String location,@RequestParam("category") String categoryStr,
			@RequestParam("searchCriteria") String searchCriteriaStr,@RequestParam("stockCategory")String stockCategoryStr,@RequestParam("selectedDate")String selectedDate,@RequestParam("zone")String zone,@RequestParam("subcategory")String subcategory,@RequestParam("brand")String brand,@RequestParam("startdate")String startdate,@RequestParam("enddate")String enddate, HttpServletRequest request,HttpServletResponse response){
		try{
			log.info("Show Outlet Dashboard");
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
			List<String> zoneList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
//			List<String> categoriesList = adminServiceObj.getCategories(customerIdStr,emailIdStr);
			String turnOverObj = new String();
			OrdersDashboardBean ordersObj = new OrdersDashboardBean();
			WastageDashboardBean wastageDashboardBeanObj = new WastageDashboardBean();
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
			List<Department> departmentList =(List<Department>)request.getSession().getAttribute("departmentList");
			if(departmentList==null || departmentList.size()==0 || departmentList.isEmpty()){
				departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerIdStr, emailIdStr,"-1",false);
				request.getSession().setAttribute("departmentList", departmentList);
			}
			List<String> brandsList =(List<String>)request.getSession().getAttribute("brandsList");
			if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
				brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
				request.getSession().setAttribute("brandsList", brandsList);
			}
			List<Float> salesObj = new ArrayList<Float>();
			List<Float> stocksObj = new ArrayList<Float>();
			 selectedDate = "";
			DateFormat dateFormatObj = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
			Date today = Calendar.getInstance().getTime();        
			selectedDate = dateFormatObj.format(today);
			selectedDate = selectedDate.substring(0,10);
			if(location==""||location==null){
				location = (String)request.getSession().getAttribute("selectedLocation");
				if (location == null && workLocationsList != null && workLocationsList.size()>0) 
					location = workLocationsList.get(0);
			}
			if(location!=""||location!=null){
				if((categoryStr == null || categoryStr == "") && categoryList != null && categoryList.size()>0)
					categoryStr = categoryList.get(0).getCategoryName();
					if(categoryStr != null || categoryStr != ""){
						salesObj=dashboardServiceObj.getSales(customerIdStr, emailIdStr, location, searchCriteriaStr, categoryStr,selectedDate,zone,subcategory,brand,startdate,enddate);
						modelAndViewObj.addObject("selectedCategory",categoryStr);
					}
				if((stockCategoryStr == null || stockCategoryStr == "") && categoryList != null && categoryList.size()>0)
					stockCategoryStr = categoryList.get(0).getCategoryName();
				if(stockCategoryStr != null || stockCategoryStr != ""){
					stocksObj=dashboardServiceObj.getStocks(customerIdStr, emailIdStr, location, searchCriteriaStr, categoryStr,selectedDate,zone,subcategory,brand,startdate,enddate);
					//modelAndViewObj.addObject("selectedstockCategory",stockCategoryStr);
				}
				ordersObj = dashboardServiceObj.getOrders(customerIdStr,emailIdStr,location,searchCriteriaStr,selectedDate,categoryStr,zone,subcategory,brand,startdate,enddate);
				turnOverObj = dashboardServiceObj.getTurnOvers(customerIdStr,emailIdStr,location,searchCriteriaStr,selectedDate,categoryStr,zone,subcategory,brand,startdate,enddate);
				wastageDashboardBeanObj = dashboardServiceObj.getWastageStockInfo(customerIdStr,emailIdStr,location,searchCriteriaStr,selectedDate,categoryStr,zone,subcategory,brand,startdate,enddate);
				if(location != null && !location.equals("") && !location.equals("all"))
					request.getSession().setAttribute("selectedLocation", location);
				modelAndViewObj.addObject("workLocationsList",workLocationsList);
//				modelAndViewObj.addObject("categoriesList", categoriesList);
				modelAndViewObj.addObject("categoriesList", categoryList);
				modelAndViewObj.addObject("ordersObj",ordersObj);
				modelAndViewObj.addObject("wastageDashboardBeanObj",wastageDashboardBeanObj);
				modelAndViewObj.addObject("turnOverObj",turnOverObj);
				modelAndViewObj.addObject("salesObj",salesObj);
				modelAndViewObj.addObject("stocksObj",stocksObj);
				String segments []={"#2484c1", "#65a620", "#7b6888", "#a05d56", "#961a1a", "#d8d23a", "#e98125", "#d0743c", "#635222", "#6ada6a",
						"#0c6197", "#7d9058", "#207f33", "#44b9b0", "#bca44a", "#e4a14b", "#a3acb2", "#8cc3e9", "#69a6f9", "#5b388f",
						"#546e91", "#8bde95", "#d2ab58", "#273c71", "#98bf6e", "#4daa4b", "#98abc5", "#cc1010", "#31383b", "#006391",
						"#c2643f", "#b0a474", "#a5a39c", "#a9c2bc", "#22af8c", "#7fcecf", "#987ac6", "#3d3b87", "#b77b1c", "#c9c2b6",
						"#807ece", "#8db27c", "#be66a2", "#9ed3c6", "#00644b", "#005064", "#77979f", "#77e079", "#9c73ab", "#1f79a7"
				};
				modelAndViewObj.addObject("segments",segments);	
		
			modelAndViewObj.addObject("selectedLocation",location);
			modelAndViewObj.addObject("selectedCriteria",searchCriteriaStr);
			modelAndViewObj.addObject("selectedDate",selectedDate);
			modelAndViewObj.setViewName("dashboardDetails");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
		}*/
	
	
/*	*//**
	 * 
	 * @author Sahitya
	 * 
	 *This method is used to display outlet dashboard
	 *@modifiedBy: Vijay
	 *@modificationDate: 02-Nov-17
	 *@modificationDescription: added parameters like location,category,subcategory,zone,brand,model,department,sub department,startdate,enddate to implement search functionality
	 *@modificationDate:10-nov-17
	 *@modificationDescription: added code to generate dynamic buttons for weeks and months in dash board based on two dates provided by end user.
	 *//*
	@RequestMapping("/showOutletDashboard")
	public ModelAndView showOutletDashboard(
			@RequestParam("location") String location,
			@RequestParam("category") String categoryStr,
			@RequestParam("searchCriteria") String searchCriteriaStr,
			@RequestParam("stockCategory")String stockCategoryStr,
			@RequestParam("selectedDate")String selectedDate,
			@RequestParam("zone")String zone,
			@RequestParam("subcategory")String subcategory,
			@RequestParam("brand")String brand,
			@RequestParam("model")String model,
			@RequestParam("department")String department,
			@RequestParam("subDepartment")String subDepartment,
			@RequestParam("startdate")String startdate,
			@RequestParam("enddate")String enddate, HttpServletRequest request,HttpServletResponse response){
		try{
			log.info("Show Outlet Dashboard");
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
			List<String> zoneList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
//			List<String> categoriesList = adminServiceObj.getCategories(customerIdStr,emailIdStr);
			String turnOverObj = null;
			ReportsBean dashBoardObj = new ReportsBean();
			OrdersDashboardBean ordersObj = new OrdersDashboardBean();
			WastageDashboardBean wastageDashboardBeanObj = new WastageDashboardBean();
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
			List<Department> departmentList =(List<Department>)request.getSession().getAttribute("departmentList");
			if(departmentList==null || departmentList.size()==0 || departmentList.isEmpty()){
				departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerIdStr, emailIdStr,"-1",false);
				request.getSession().setAttribute("departmentList", departmentList);
			}
			List<String> brandsList =(List<String>)request.getSession().getAttribute("brandsList");
			if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
				brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
				request.getSession().setAttribute("brandsList", brandsList);
			}
			List<Float> salesObj = new ArrayList<Float>();
			List<Float> stocksObj = new ArrayList<Float>();
			 selectedDate = "";
			 
			DateFormat dateFormatObj = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
			Date today = Calendar.getInstance().getTime();        
			selectedDate = dateFormatObj.format(today);
			selectedDate = selectedDate.substring(0,10);
			if(location==""||location==null){
				location = (String)request.getSession().getAttribute("selectedLocation");
				if (location == null && workLocationsList != null && workLocationsList.size()>0) 
					location = workLocationsList.get(0);
			}
			if(location!=""||location!=null){
				if((categoryStr == null || categoryStr == "") && categoryList != null && categoryList.size()>0)
					categoryStr = categoryList.get(0).getCategoryName();
					if(categoryStr != null || categoryStr != ""){
						salesObj=dashboardServiceObj.getSales(customerIdStr, emailIdStr, location, searchCriteriaStr, categoryStr,selectedDate,zone,subcategory,brand,startdate,enddate);
						modelAndViewObj.addObject("selectedCategory",categoryStr);
					}
				if((stockCategoryStr == null || stockCategoryStr == "") && categoryList != null && categoryList.size()>0)
					stockCategoryStr = categoryList.get(0).getCategoryName();
				if(stockCategoryStr != null || stockCategoryStr != ""){
					stocksObj=dashboardServiceObj.getStocks(customerIdStr, emailIdStr, location, searchCriteriaStr, categoryStr,selectedDate,zone,subcategory,brand,startdate,enddate);
					//modelAndViewObj.addObject("selectedstockCategory",stockCategoryStr);
				}
				ordersObj = dashboardServiceObj.getOrders(customerIdStr,emailIdStr,location,searchCriteriaStr,selectedDate,categoryStr,zone,subcategory,brand,startdate,enddate,department,subDepartment);
				turnOverObj = dashboardServiceObj.getTurnOvers(customerIdStr,emailIdStr,location,searchCriteriaStr,selectedDate,categoryStr,zone,subcategory,brand,startdate,enddate,department,subDepartment);
				wastageDashboardBeanObj = dashboardServiceObj.getWastageStockInfo(customerIdStr,emailIdStr,location,searchCriteriaStr,selectedDate,categoryStr,zone,subcategory,brand,startdate,enddate,department,subDepartment);
				dashBoardObj = dashboardServiceObj.getdasboardinfo(customerIdStr,emailIdStr,location,searchCriteriaStr,selectedDate,categoryStr,zone,subcategory,brand,startdate,enddate,department,subDepartment);
				TurnOverDashBoardBean turnOver = gson.fromJson(turnOverObj, TurnOverDashBoardBean.class);
				if(location != null && !location.equals("") && !location.equals("all"))
					request.getSession().setAttribute("selectedLocation", location);
				modelAndViewObj.addObject("workLocationsList",workLocationsList);
//				modelAndViewObj.addObject("categoriesList", categoriesList);
				modelAndViewObj.addObject("categoriesList", categoryList);
				modelAndViewObj.addObject("ordersObj",ordersObj);
				modelAndViewObj.addObject("wastageDashboardBeanObj",wastageDashboardBeanObj);
				modelAndViewObj.addObject("turnOverObj",turnOverObj);
				modelAndViewObj.addObject("turnOver",turnOver);
				modelAndViewObj.addObject("salesObj",salesObj);
				modelAndViewObj.addObject("stocksObj",stocksObj);
				modelAndViewObj.addObject("dashboardinfo",dashBoardObj);
				String segments []={"#2484c1", "#65a620", "#7b6888", "#a05d56", "#961a1a", "#d8d23a", "#e98125", "#d0743c", "#635222", 
						"#6ada6a","#0c6197", "#7d9058", "#207f33", "#44b9b0", "#bca44a", "#e4a14b", "#a3acb2", "#8cc3e9", "#69a6f9", "#5b388f",
						"#546e91", "#8bde95", "#d2ab58", "#273c71", "#98bf6e", "#4daa4b", "#98abc5", "#cc1010", "#31383b", "#006391",
						"#c2643f", "#b0a474", "#a5a39c", "#a9c2bc", "#22af8c", "#7fcecf", "#987ac6", "#3d3b87", "#b77b1c", "#c9c2b6",
						"#807ece", "#8db27c", "#be66a2", "#9ed3c6", "#00644b", "#005064", "#77979f", "#77e079", "#9c73ab", "#1f79a7"
				};
				
//				if(!startdate.isEmpty() & !enddate.isEmpty())
//				{
//					Date date1=new SimpleDateFormat("dd/MM/yyyy").parse(startdate);
//					Date date2=new SimpleDateFormat("dd/MM/yyyy").parse(enddate);
//			
//					
//					if(searchCriteriaStr.equals("month"))
//						modelAndViewObj.addObject("monthly",months);
//					if(searchCriteriaStr.equals("week"))
//						modelAndViewObj.addObject("weekly",weeks);
//						
//				}
				
				modelAndViewObj.addObject("segments",segments);	
				modelAndViewObj.addObject("startDate",startdate);
				modelAndViewObj.addObject("endDate",enddate);
				modelAndViewObj.addObject("zone",zone);
				modelAndViewObj.addObject("department",department);
				modelAndViewObj.addObject("subDepartment",subDepartment);
				modelAndViewObj.addObject("category",categoryStr);
				modelAndViewObj.addObject("subCategory",subcategory);

			modelAndViewObj.addObject("selectedLocation",location);
			modelAndViewObj.addObject("selectedCriteria",searchCriteriaStr);
			modelAndViewObj.addObject("selectedDate",selectedDate);
			modelAndViewObj.setViewName("dashboardDetails");
				
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
	 *This method is used to display outlet dashboard
	 *@modifiedBy: Vijay
	 *@modificationDate: 02-Nov-17
	 *@modificationDescription: added parameters like location,category,subcategory,zone,brand,model,department,sub department,startdate,enddate to implement search functionality
	 *@modificationDate:10-nov-17
	 *@modificationDescription: added code to generate dynamic buttons for weeks and months in dash board based on two dates provided by end user.
	 */
	@RequestMapping("/showOutletDashboard")
	public ModelAndView showOutletDashboard(
			@RequestParam("location") String location,
			@RequestParam("category") String categoryStr,
			@RequestParam("searchCriteria") String searchCriteriaStr,
			@RequestParam("stockCategory")String stockCategoryStr,
			@RequestParam("selectedDate")String selectedDate,
			@RequestParam("zone")String zone,
			@RequestParam("subcategory")String subcategory,
			@RequestParam("brand")String brand,
			@RequestParam("model")String model,
			@RequestParam("department")String department,
			@RequestParam("subDepartment")String subDepartment,
			@RequestParam("startdate")String startdate,
			@RequestParam("enddate")String enddate, HttpServletRequest request,HttpServletResponse response){
		ArrayList<LocationBean> workLocationsList = null;
		try{
			//log.info("Show Outlet Dashboard");
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
//			List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
			workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			//List<String> zoneList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
//			List<String> categoriesList = adminServiceObj.getCategories(customerIdStr,emailIdStr);
			String turnOverObj = null;
			ReportsBean dashBoardObj = new ReportsBean();
			OrdersDashboardBean ordersObj = new OrdersDashboardBean();
			WastageDashboardBean wastageDashboardBeanObj = new WastageDashboardBean();
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
			List<Department> departmentList =(List<Department>)request.getSession().getAttribute("departmentList");
			if(departmentList==null || departmentList.size()==0 || departmentList.isEmpty()){
				departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerIdStr, emailIdStr,"-1",false);
				request.getSession().setAttribute("departmentList", departmentList);
			}
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"-1","","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			List<String> brandsList =(List<String>)request.getSession().getAttribute("brandsList");
			if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
				brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
				request.getSession().setAttribute("brandsList", brandsList);
			}
			List<Float> salesObj = new ArrayList<Float>();
			List<Float> stocksObj = new ArrayList<Float>();
			 selectedDate = "";
			 
			DateFormat dateFormatObj = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
			/*Date today = Calendar.getInstance().getTime();        
			selectedDate = dateFormatObj.format(today);
			selectedDate = selectedDate.substring(0,10);*/
			 Calendar cal = Calendar.getInstance();
		     cal.add(Calendar.DATE, -1); 
		     selectedDate= dateFormatObj.format(cal.getTime());
		   //  //////System.out.println(selectedDate);
		     selectedDate = selectedDate.substring(0,10);
			if(startdate.equals("")||startdate.isEmpty())
				startdate=selectedDate;
			/*if(location==""||location==null){
				location = (String)request.getSession().getAttribute("selectedLocation");
				if (location == null && workLocationsList != null && workLocationsList.size()>0) 
					location = workLocationsList.get(0);
			}*/
		/*	if(location!=""||location!=null){
				if((categoryStr == null || categoryStr == "") && categoryList != null && categoryList.size()>0)
					categoryStr = categoryList.get(0).getCategoryName();
					if(categoryStr != null || categoryStr != ""){*/
						salesObj=dashboardServiceObj.getSales(customerIdStr, emailIdStr, location, searchCriteriaStr, categoryStr,selectedDate,zone,subcategory,brand,startdate,enddate);
						modelAndViewObj.addObject("selectedCategory",categoryStr);
						dashBoardObj = dashboardServiceObj.getdasboardinfo(customerIdStr,emailIdStr,location,searchCriteriaStr,selectedDate,categoryStr,zone,subcategory,brand,startdate,enddate,department,subDepartment);
				/*	}*/
				/*if((stockCategoryStr == null || stockCategoryStr == "") && categoryList != null && categoryList.size()>0)
					stockCategoryStr = categoryList.get(0).getCategoryName();
				if(stockCategoryStr != null || stockCategoryStr != ""){*/
					stocksObj=dashboardServiceObj.getStocks(customerIdStr, emailIdStr, location, searchCriteriaStr, categoryStr,selectedDate,zone,subcategory,brand,startdate,enddate);
					//modelAndViewObj.addObject("selectedstockCategory",stockCategoryStr);
				/*}*/
				ordersObj = dashboardServiceObj.getOrders(customerIdStr,emailIdStr,location,searchCriteriaStr,selectedDate,categoryStr,zone,subcategory,brand,startdate,enddate,department,subDepartment);
				turnOverObj = dashboardServiceObj.getTurnOvers(customerIdStr,emailIdStr,location,searchCriteriaStr,selectedDate,categoryStr,zone,subcategory,brand,startdate,enddate,department,subDepartment);
				wastageDashboardBeanObj = dashboardServiceObj.getWastageStockInfo(customerIdStr,emailIdStr,location,searchCriteriaStr,selectedDate,categoryStr,zone,subcategory,brand,startdate,enddate,department,subDepartment);
				
				TurnOverDashBoardBean turnOver = gson.fromJson(turnOverObj, TurnOverDashBoardBean.class);
				/*if(location != null && !location.equals("") && !location.equals("all"))
					request.getSession().setAttribute("selectedLocation", location);*/
				modelAndViewObj.addObject("selectedLocation",location);
				modelAndViewObj.addObject("workLocationsList",workLocationsList);
//				modelAndViewObj.addObject("categoriesList", categoriesList);
				modelAndViewObj.addObject("categoriesList", categoryList);
				modelAndViewObj.addObject("ordersObj",ordersObj);
				modelAndViewObj.addObject("wastageDashboardBeanObj",wastageDashboardBeanObj);
				modelAndViewObj.addObject("turnOverObj",turnOverObj);
				modelAndViewObj.addObject("turnOver",turnOver);
				modelAndViewObj.addObject("salesObj",salesObj);
				modelAndViewObj.addObject("stocksObj",stocksObj);
				modelAndViewObj.addObject("dashboardinfo",dashBoardObj);
				String segments []={"#2484c1", "#65a620", "#7b6888", "#a05d56", "#961a1a", "#d8d23a", "#e98125", "#d0743c", "#635222", 
						"#6ada6a","#0c6197", "#7d9058", "#207f33", "#44b9b0", "#bca44a", "#e4a14b", "#a3acb2", "#8cc3e9", "#69a6f9", "#5b388f",
						"#546e91", "#8bde95", "#d2ab58", "#273c71", "#98bf6e", "#4daa4b", "#98abc5", "#cc1010", "#31383b", "#006391",
						"#c2643f", "#b0a474", "#a5a39c", "#a9c2bc", "#22af8c", "#7fcecf", "#987ac6", "#3d3b87", "#b77b1c", "#c9c2b6",
						"#807ece", "#8db27c", "#be66a2", "#9ed3c6", "#00644b", "#005064", "#77979f", "#77e079", "#9c73ab", "#1f79a7"
				};
				
//				if(!startdate.isEmpty() & !enddate.isEmpty())
//				{
//					Date date1=new SimpleDateFormat("dd/MM/yyyy").parse(startdate);
//					Date date2=new SimpleDateFormat("dd/MM/yyyy").parse(enddate);
//			
//					
//					if(searchCriteriaStr.equals("month"))
//						modelAndViewObj.addObject("monthly",months);
//					if(searchCriteriaStr.equals("week"))
//						modelAndViewObj.addObject("weekly",weeks);
//						
//				}
				
				modelAndViewObj.addObject("segments",segments);	
				modelAndViewObj.addObject("startDate",startdate);
				modelAndViewObj.addObject("endDate",enddate);
				modelAndViewObj.addObject("zone",zone);
			//	//////System.out.println(zone);
				modelAndViewObj.addObject("department",department);
				modelAndViewObj.addObject("subDepartment",subDepartment);
				modelAndViewObj.addObject("category",categoryStr);
				modelAndViewObj.addObject("subCategory",subcategory);

			
			modelAndViewObj.addObject("selectedCriteria",searchCriteriaStr);
			modelAndViewObj.addObject("selectedDate",selectedDate);
			modelAndViewObj.setViewName("dashboardDetails");
				
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
		}
	
	
	@RequestMapping("/showOutletStocks")
	public @ResponseBody List<Float> showOutletStocks(@RequestParam("location") String location,
			@RequestParam("searchCriteria") String searchCriteriaStr,@RequestParam("stockCategory")String stockCategoryStr,@RequestParam("selectedDate")String selectedDate, HttpServletRequest request,HttpServletResponse response){
		String customerIdStr=null,emailIdStr=null;
		List<Float> stocksObj=null;
		try{
			//log.info("showOutletStocks");
			modelAndViewObj = new ModelAndView();
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			stocksObj = new ArrayList<Float>();
			stocksObj=dashboardServiceObj.getStocks(customerIdStr, emailIdStr, location, searchCriteriaStr, stockCategoryStr,selectedDate,"","","","","");
			//request.getSession().setAttribute("selectedLocation", location);
		/*	modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("stocksObj",stocksObj);
			modelAndViewObj.addObject("selectedLocation",location);
			modelAndViewObj.addObject("selectedCriteria",searchCriteriaStr);
			modelAndViewObj.addObject("selectedDate",selectedDate);
			
			modelAndViewObj.setViewName("outletDashboard");*/
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return stocksObj;
		}
	
	@RequestMapping("/showOutletSales")
	public @ResponseBody List<Float> showOutletSales(@RequestParam("location") String location,
			@RequestParam("searchCriteria") String searchCriteriaStr,@RequestParam("category")String categoryStr,@RequestParam("selectedDate")String selectedDate, HttpServletRequest request,HttpServletResponse response){
		String customerIdStr=null,emailIdStr=null;
		List<Float> salesObj=null;
		try{
			//log.info("showOutletSales");
			modelAndViewObj = new ModelAndView();
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			salesObj = new ArrayList<Float>();
			salesObj=dashboardServiceObj.getSales(customerIdStr, emailIdStr, location, searchCriteriaStr, categoryStr,selectedDate,"","","","","");
		//	stocksObj=dashboardServiceObj.getWeeklyOrMonthlyStocks(customerIdStr, emailIdStr, location, searchCriteriaStr, stockCategoryStr);
			//request.getSession().setAttribute("selectedLocation", location);
		/*	modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("stocksObj",stocksObj);
			modelAndViewObj.addObject("selectedLocation",location);
			modelAndViewObj.addObject("selectedCriteria",searchCriteriaStr);
			modelAndViewObj.addObject("selectedDate",selectedDate);
			
			modelAndViewObj.setViewName("outletDashboard");*/
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return salesObj;
		}
	
	
	
}
