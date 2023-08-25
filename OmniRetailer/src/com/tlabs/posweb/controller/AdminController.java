/*******************************************************************************
 * Copyright  2015 Omni Retailer Customer Console, All rights reserved.
 * Author : Mythri
 * Created On : 2-2-2015
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


import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlabs.posweb.init.AppProperties;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import java.util.Map;
import com.google.gson.Gson;
import com.tlabs.posweb.beans.Counter;
import com.tlabs.posweb.beans.EmployeeBean;
import com.tlabs.posweb.beans.EventMaster;
import com.tlabs.posweb.beans.LocationBean;
import com.tlabs.posweb.beans.MenuDetails;
import com.tlabs.posweb.beans.OutletInfo;
import com.tlabs.posweb.beans.ShiftAllocationBean;
import com.tlabs.posweb.beans.ShiftMaster;
import com.tlabs.posweb.beans.ShiftResponse;
import com.tlabs.posweb.beans.TaxBean;
import com.tlabs.posweb.beans.TenderMaster;
import com.tlabs.posweb.beans.WarehouseCounterResponse;
import com.tlabs.posweb.beans.ZoneMaster;
import com.tlabs.posweb.services.AdminService;
import com.tlabs.posweb.services.DepartmentService;
import com.tlabs.posweb.services.GenericMasterService;
import com.tlabs.posweb.services.MenuService;
import com.tlabs.posweb.services.ShiftService;
import com.tlabs.posweb.services.StoreService;
import com.tlabs.posweb.util.BackupAndRestore;
//import com.tlabs.posweb.util.Utilities;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

	
	private ModelAndView modelAndViewObj;
	@Autowired
	private AdminService adminServiceObj;
	 @Autowired
	    private MenuService menuServiceObj;
	 @Autowired
	    private StoreService storeServiceObj;
	@Autowired
	private Gson gson;
	@Autowired
	private ShiftService shiftServiceObj;
    @Autowired
    private DepartmentService departmentServiceObj;
    @Autowired
    private GenericMasterService genericMasterServiceObj;
    
//	private static Logger log = Logger.getLogger(AdminController.class);
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display the DashBoard
	 *
	 **/
	@RequestMapping("/dashboard")
	public ModelAndView viewDashboard(HttpServletRequest request,HttpServletResponse response) {
		try{
			//log.info("viewDashboard called");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.setViewName("Admin/dashboard");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	

	
	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display the Edit Employee form consisting of the details of the Employee
	 *
	 **/
	@RequestMapping("/searchEmployee")
	public @ResponseBody List<EmployeeBean> searchEmployee(@RequestParam("empName") String empName,@RequestParam("location") String location,HttpServletRequest request,HttpServletResponse response){
		List<EmployeeBean> empList = new ArrayList<EmployeeBean>();
		try{
			//log.info("searchEmployee");
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			empList = genericMasterServiceObj.getEmployees(empName,customerId, emailId,"-1",location,"",false,"");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return empList;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *	This method is used to display the List departments
	 *
	 **/
	@RequestMapping("/searchDepartmentNames")
	public @ResponseBody List<String> searchDepartmentNames(@RequestParam("deptName") String deptName,HttpServletRequest request,HttpServletResponse response){
		List<String> deptList = new ArrayList<String>();
		try{
			//log.info("searchDepartmentNames");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			deptList = departmentServiceObj.getDepartmentsList(deptName, customerIdStr, emailIdStr);
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return deptList;
	}
	
	




/**
	 * 
	 * @author RaviTeja.N
	 * 
	 *	This method is used to display the List sub departments
	 *
	 **/
	@RequestMapping("/searchSubDepartmentNames")
	public @ResponseBody List<String> searchSubDepartmentNames(@RequestParam("deptName") String deptName,HttpServletRequest request,HttpServletResponse response){
		List<String> subDeptList = new ArrayList<String>();
		try{
			//log.info("searchSubDepartmentNames");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			subDeptList = departmentServiceObj.getSubDepartmentsList(deptName, customerIdStr, emailIdStr);
			
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return subDeptList;
	}


	
	
	
	
	@RequestMapping("/getLocationDetails")
	public @ResponseBody LocationBean getLocationDetails(@RequestParam("locationId") String locationId,HttpServletRequest request,HttpServletResponse response){
		ArrayList<LocationBean> locationDetails = new ArrayList<LocationBean>();
		try{
			//log.info("getLocationDetails");
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			locationDetails = genericMasterServiceObj.getLocationDetails(locationId,customerId, emailId,"0","",false,true,true);
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return locationDetails.get(0);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
/*	@RequestMapping("/newLanguage")
	public ModelAndView newLanguage(HttpServletRequest request,
			HttpServletResponse response)
			throws Exception, TransformerException {
		
		log.info("newLanguage ");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("Admin/genericData/languageMaster");
		return modelAndViewObj;
	}*/
	
	
	
	
	
	
	@RequestMapping("/viewCounters")
	public ModelAndView viewCounters(@RequestParam("index")String index,@RequestParam("maxRecords") String maxRecords,@RequestParam("location")String location,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){

		/**
		 * @author Sambaiah.Y  03-07-2015
		 * 
		 *This method is used to get the all counters from server
		 *added maxrecords as param by manasa
		 **/
		String locationListAll="";
		ArrayList<LocationBean> locationBeansList = null;
		try{
    List<String> locationsListValue =new ArrayList<String>();
			//log.info("AdminController - viewCounters");
			int start = 1,end = Integer.parseInt(maxRecords);//modified by manasa
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
		 // List<String> locationsList = adminServiceObj.getOutletLocationsList(customerIdStr, emailIdStr,true);
		//	List<String> locationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr,true);
			modelAndViewObj = new ModelAndView();
			/*if(locationsList != null && locationsList.size() > 0){
				location = locationsList.get(0);
			}*/
		/*	
//			Added by vijay, to make default loaction as location list first occurrence, if location is empty
			if((location.trim()).equals(null) || location.trim().isEmpty())
				location = locationsList.get(0);*/

			/*if((location.trim()).equals(null) || location.trim().isEmpty())
			{
				location = locationBeansList.get(0).getLocationId();
			}*/
			if(location.equals("all")|| location.equals("")){
				if(locationBeansList != null){
					for(int i=0;i<locationBeansList.size();i++){
					
						locationsListValue.add(locationBeansList.get(i).getLocationId());
							
					}
				for (String string : locationsListValue) {
					
					locationListAll = locationListAll+string+",";
				}
				}
				
			}
			
			List<Counter> counterDetails = adminServiceObj.getCounters("",location,customerIdStr,emailIdStr,index,true,maxRecords,locationListAll);
			if(counterDetails == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(counterDetails.size()<Integer.parseInt(maxRecords)){
					end = (counterDetails.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(counterDetails.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("workLocationsList", locationBeansList);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));//added by manasa
			modelAndViewObj.addObject("counterDetails", counterDetails);
			modelAndViewObj.addObject("searchName", searchName);
			modelAndViewObj.setViewName("Admin/genericData/Counters/countermaster");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	@RequestMapping("/viewWhCounters")
	public ModelAndView viewWhCounters(@RequestParam("index")String index,@RequestParam("maxRecords") String maxRecords,@RequestParam("location")String location,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){

		/**
		 * @author Sambaiah.Y  03-07-2015
		 * 
		 *This method is used to get the all counters from server
		 *
		 **/
//		String locationListAll="";
		try{
			//log.info("AdminController - viewCounters");
			int start = 1,end = 10;
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
//			List<String> locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
			ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","Warehouse",false,false,true);
			modelAndViewObj = new ModelAndView();
			/*if(locationsList != null && locationsList.size() > 0){
				location = locationsList.get(0);
			}*/
			
//			Added by vijay, to make default loaction as location list first occurrence, if location is empty
			
		//	if(locationsList!=null)
			if((location.trim()).equals(null) || location.trim().isEmpty())
			{
				location = locationsList.get(0).getLocationId();
			}
			
			
			/*if(location.equals("all")|| location.equals("")){
				if(locationsList != null){
				for (String string : locationsList) {
					locationListAll = locationListAll+string+",";
				}
				}
				
			}*/
			
			
			WarehouseCounterResponse counterDetails = adminServiceObj.getWhCounters("",location,customerIdStr,emailIdStr,index,false,maxRecords);
			if(counterDetails == null || counterDetails.getWarehouseCountersList() == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(counterDetails.getWarehouseCountersList().size()<Integer.parseInt(maxRecords)){
					end = (counterDetails.getWarehouseCountersList().size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", counterDetails.getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue",end);
			}
			modelAndViewObj.addObject("workLocationsList", locationsList);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));//added by manasa
			////System.out.println(Integer.parseInt(maxRecords));
			modelAndViewObj.addObject("counterDetails", counterDetails.getWarehouseCountersList());
			modelAndViewObj.addObject("searchName", searchName);
			modelAndViewObj.setViewName("Admin/genericData/WarehouseCounters/countermaster");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	@RequestMapping("/newCounter")
	public ModelAndView newCounter(@RequestParam("location")String location,HttpServletRequest request,HttpServletResponse response){

		/**
		 * @author Sambaiah.Y  03-07-2015
		 * 
		 *This method is used to get the all counters from server
		 *
		 **/
		try{
			String locationStr = "";
			String locationListAll="";
			String outlet_name = null;
			List<String> locationsLists = null;
			List<OutletInfo> storeList = null;
			List<MenuDetails> menuDetailsList = new ArrayList<MenuDetails>();

			//log.info("AdminController - newCounter");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<String> locationsList = adminServiceObj.getOutletLocationsList(customerIdStr, emailIdStr,false);
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"0","","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			for (ZoneMaster zoneMaster : zoneList) {
				locationsList.add(zoneMaster.getZoneID());
			}
			List<String> customerDevicecs = adminServiceObj.getCustomerDevices(customerIdStr,emailIdStr);
			List<EmployeeBean> empList = genericMasterServiceObj.getEmployees("",customerIdStr, emailIdStr,"-1","","",false,"");

					if(locationsList != null && locationsList.size() != 0){
						outlet_name = "";
						menuDetailsList = menuServiceObj.getMenuDetails(locationsList.get(0), customerIdStr, emailIdStr,"",false);
					}

             
			
			//log.info(resultStr);
			modelAndViewObj = new ModelAndView();
			ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails("",customerIdStr, emailIdStr,"-1",false,"");

			modelAndViewObj.addObject("taxDetails", taxDetails);
			
			 modelAndViewObj.addObject("menuDetailsList", menuDetailsList);
			modelAndViewObj.addObject("devicesList", customerDevicecs);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("locationInfo", location);
			modelAndViewObj.addObject("empInfo", empList);
			modelAndViewObj.setViewName("Admin/genericData/Counters/newcounter");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}

	/*
	 * @RequestMapping("/newWhCounter") public ModelAndView
	 * newWhCounter(@RequestParam("location")String location,HttpServletRequest
	 * request,HttpServletResponse response){
	 * 
	 *//**
		 * @author Sambaiah.Y 03-07-2015
		 * 
		 *         This method is used to get the all counters from server
		 *
		 **//*
			 * try{ //log.info("AdminController - newCounter"); String customerIdStr =
			 * (String)request.getSession().getAttribute("customerId"); String emailIdStr =
			 * (String)request.getSession().getAttribute("emailId"); List<String>
			 * locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr,
			 * emailIdStr,false); List<String> customerDevicecs =
			 * adminServiceObj.getCustomerDevices(customerIdStr,emailIdStr);
			 * //log.info(resultStr); modelAndViewObj = new ModelAndView();
			 * modelAndViewObj.addObject("devicesList", customerDevicecs);
			 * modelAndViewObj.addObject("locationsList", locationsList);
			 * modelAndViewObj.addObject("locationInfo", location);
			 * modelAndViewObj.setViewName("Admin/genericData/WarehouseCounters/newcounter")
			 * ; }catch(Exception exception){ exception.printStackTrace(); } return
			 * modelAndViewObj; }
			 */
	
	

	@RequestMapping("/newWhCounter")
	public ModelAndView newWhCounter(@RequestParam("location")String location,HttpServletRequest request,HttpServletResponse response){

		/**
		 * @author Sambaiah.Y  03-07-2015
		 * 
		 *This method is used to get the all counters from server
		 *
		 **/
		try{
			//log.info("AdminController - newCounter");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<String> locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,false);
			List<String> customerDevicecs = adminServiceObj.getCustomerDevices(customerIdStr,emailIdStr);
			//log.info(resultStr);
			modelAndViewObj = new ModelAndView();
			ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails("",customerIdStr, emailIdStr,"-1",false,"");
			List<EmployeeBean> empList = genericMasterServiceObj.getEmployees("",customerIdStr, emailIdStr,"-1","","",false,"");

			modelAndViewObj.addObject("taxDetails", taxDetails);
			modelAndViewObj.addObject("devicesList", customerDevicecs);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("locationInfo", location);
			modelAndViewObj.addObject("empInfo", empList);
			modelAndViewObj.setViewName("Admin/genericData/WarehouseCounters/newcounter");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	@RequestMapping(value = "/createCounter" , method = RequestMethod.POST)
	public ModelAndView createCounter(@RequestParam("nformData")String data,HttpServletRequest request,HttpServletResponse response){
		/**
		 * @author Sambaiah.Y  03-07-2015
		 * 
		 *This method is used to store the new counter information in server
		 *
		 **/
		Counter counter = null;
		
		counter = gson.fromJson(data,Counter.class);
		String str_response = null;
		List<String> locationsList = null;
		List<String> customerDevicecs  = null;
		List<EmployeeBean> empList =null;
		
		String locationStr = "";
		String locationListAll="";
		String outlet_name = null;
		List<String> locationsLists = null;
		List<OutletInfo> storeList = null;
		List<MenuDetails> menuDetailsList = new ArrayList<MenuDetails>();

		//log.info(counter.getCounterName());
		try{
			//log.info("AdminController - createCounter");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			
			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr, emailIdStr,false);
			customerDevicecs = adminServiceObj.getCustomerDevices(customerIdStr,emailIdStr);
			str_response = adminServiceObj.createCounter(counter,customerIdStr,emailIdStr);
			empList = genericMasterServiceObj.getEmployees("",customerIdStr, emailIdStr,"-1","","",false,"");

			
			
			Map<String,Object> storesListMap = storeServiceObj.getStoresList(customerIdStr, emailIdStr,locationStr,"-1", "10");
			storeList = (List<OutletInfo>)storesListMap.get("storeDetailsList");
			
			 List<String> locationsListValue=new ArrayList<String>();
//	  			if(outlet_name.equals("all")|| outlet_name.equals("")){
					if(storeList != null){
							for(int i=0;i<storeList.size();i++){
								locationsListValue.add(storeList.get(i).getLocation());
							}
				
						for (String string : locationsListValue) {
							locationListAll = locationListAll+string+",";
						}
					}
				
					
					if(storeList != null && storeList.size() != 0){
						outlet_name = "";
						menuDetailsList = menuServiceObj.getMenuDetails(locationListAll, customerIdStr, emailIdStr,"",false);
					}

             
			
			
			//log.info(resultStr);
			modelAndViewObj = new ModelAndView();
			
			ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails("",customerIdStr, emailIdStr,"-1",false,"");

			modelAndViewObj.addObject("countertax",counter.getTaxCode());
	    	modelAndViewObj.addObject("taxDetails",taxDetails);
		 modelAndViewObj.addObject("menuDetailsList", menuDetailsList);
			if(!str_response.equals(AppProperties.getAppMessageByProperty("COUNTER_CREATE_SUCCESS").trim()))
				modelAndViewObj.addObject("err", str_response);
			else
				modelAndViewObj.addObject("success", str_response);
			modelAndViewObj.addObject("devicesList", customerDevicecs);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("empInfo", empList);
			modelAndViewObj.addObject("counterName",counter.getCounterName());
			modelAndViewObj.addObject("locationInfo",counter.getStoreLocation());
			modelAndViewObj.addObject("deviceId",counter.getDeviceId());
			modelAndViewObj.addObject("counterType",counter.getCounterType());
			modelAndViewObj.addObject("deviceType",counter.getDeviceType());
			modelAndViewObj.addObject("remarks",counter.getRemarks());
			modelAndViewObj.addObject("printingType",counter.getPrintingType());
			modelAndViewObj.addObject("quickBillFlag",counter.isQuickBill());
			modelAndViewObj.addObject("paymentDeviceUsername",counter.getPaymentDeviceUsername());
			modelAndViewObj.addObject("paymentDevicePin",counter.getPaymentDevicePin());
			modelAndViewObj.addObject("paymentDevicePort",counter.getPaymentDevicePort());
			
		}catch(Exception exception){
			modelAndViewObj.addObject("err", str_response);
			modelAndViewObj.addObject("devicesList", customerDevicecs);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("empInfo", empList);
			modelAndViewObj.addObject("counterName",counter.getCounterName());
			modelAndViewObj.addObject("location",counter.getStoreLocation());
			modelAndViewObj.addObject("deviceId",counter.getDeviceId());
			modelAndViewObj.addObject("counterType",counter.getCounterType());
			modelAndViewObj.addObject("deviceType",counter.getDeviceType());
			modelAndViewObj.addObject("remarks",counter.getRemarks());
			modelAndViewObj.addObject("printingType",counter.getPrintingType());
			modelAndViewObj.addObject("quickBillFlag",counter.isQuickBill());
			modelAndViewObj.addObject("paymentDeviceUsername",counter.getPaymentDeviceUsername());
			modelAndViewObj.addObject("paymentDevicePin",counter.getPaymentDevicePin());
			modelAndViewObj.addObject("paymentDevicePort",counter.getPaymentDevicePort());
			exception.printStackTrace();
		}
		modelAndViewObj.setViewName("Admin/genericData/Counters/newcounter");
		return modelAndViewObj;

	}
	
	/*
	 * @RequestMapping(value = "/createWhCounter" , method = RequestMethod.POST)
	 * public ModelAndView createWhCounter(Counter counter,HttpServletRequest
	 * request,HttpServletResponse response){
	 *//**
		 * @author Sambaiah.Y 03-07-2015
		 * 
		 *         This method is used to store the new counter information in server
		 *
		 **//*
			 * String str_response = null; List<String> locationsList = null; List<String>
			 * customerDevicecs = null; //log.info(counter.getCounterName()); try{
			 * //log.info("AdminController - createCounter"); String customerIdStr =
			 * (String)request.getSession().getAttribute("customerId"); String emailIdStr =
			 * (String)request.getSession().getAttribute("emailId");
			 * 
			 * locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr,
			 * emailIdStr,false); customerDevicecs =
			 * adminServiceObj.getCustomerDevices(customerIdStr,emailIdStr); str_response =
			 * adminServiceObj.createWhCounter(counter,customerIdStr,emailIdStr);
			 * //log.info(resultStr); modelAndViewObj = new ModelAndView();
			 * if(!str_response.equals(AppProperties.getAppMessageByProperty(
			 * "COUNTER_CREATE_SUCCESS").trim())) modelAndViewObj.addObject("err",
			 * str_response); else modelAndViewObj.addObject("success", str_response);
			 * modelAndViewObj.addObject("devicesList", customerDevicecs);
			 * modelAndViewObj.addObject("locationsList", locationsList);
			 * 
			 * modelAndViewObj.addObject("counterName",counter.getCounterName());
			 * modelAndViewObj.addObject("locationInfo",counter.getStoreLocation());
			 * modelAndViewObj.addObject("deviceId",counter.getDeviceId());
			 * modelAndViewObj.addObject("counterType",counter.getCounterType());
			 * modelAndViewObj.addObject("deviceType",counter.getDeviceType());
			 * modelAndViewObj.addObject("remarks",counter.getRemarks());
			 * 
			 * 
			 * }catch(Exception exception){ modelAndViewObj.addObject("err", str_response);
			 * modelAndViewObj.addObject("devicesList", customerDevicecs);
			 * modelAndViewObj.addObject("locationsList", locationsList);
			 * 
			 * modelAndViewObj.addObject("counterName",counter.getCounterName());
			 * modelAndViewObj.addObject("location",counter.getStoreLocation());
			 * modelAndViewObj.addObject("deviceId",counter.getDeviceId());
			 * modelAndViewObj.addObject("counterType",counter.getCounterType());
			 * modelAndViewObj.addObject("deviceType",counter.getDeviceType());
			 * modelAndViewObj.addObject("remarks",counter.getRemarks());
			 * 
			 * exception.printStackTrace(); }
			 * modelAndViewObj.setViewName("Admin/genericData/WarehouseCounters/newcounter")
			 * ; return modelAndViewObj;
			 * 
			 * }
			 */
	
	
	@RequestMapping(value = "/createWhCounter" , method = RequestMethod.POST,consumes="application/json")
	public ModelAndView createWhCounter(@RequestBody Counter counter,HttpServletRequest request,HttpServletResponse response){
		/**
		 * @author Sambaiah.Y  03-07-2015
		 * 
		 *This method is used to store the new counter information in server
		 *
		 **/
		String str_response = null;
		List<String> locationsList = null;
		List<String> customerDevicecs  = null;
		//log.info(counter.getCounterName());
		try{
			//System.out.println(""+gson.toJson(counter));
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			
			locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,false);
			customerDevicecs = adminServiceObj.getCustomerDevices(customerIdStr,emailIdStr);
			str_response = adminServiceObj.createWhCounter(counter,customerIdStr,emailIdStr);
			ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails("",customerIdStr, emailIdStr,"-1",false,"");

			
			
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("taxDetails",taxDetails);
			if(!str_response.equals(AppProperties.getAppMessageByProperty("COUNTER_CREATE_SUCCESS").trim()))
				modelAndViewObj.addObject("err", str_response);
			else
				modelAndViewObj.addObject("success", str_response);
			modelAndViewObj.addObject("devicesList", customerDevicecs);
			modelAndViewObj.addObject("locationsList", locationsList);
			
			modelAndViewObj.addObject("counterName",counter.getCounterName());
			modelAndViewObj.addObject("locationInfo",counter.getStoreLocation());
			modelAndViewObj.addObject("deviceId",counter.getDeviceId());
			modelAndViewObj.addObject("counterType",counter.getCounterType());
			modelAndViewObj.addObject("deviceType",counter.getDeviceType());
			modelAndViewObj.addObject("remarks",counter.getRemarks());
			modelAndViewObj.addObject("countertax",counter.getTaxCode());
			modelAndViewObj.addObject("counterCategory",counter.isB2bCounters());
		
			
			
		}catch(Exception exception){
			modelAndViewObj.addObject("err", str_response);
			modelAndViewObj.addObject("devicesList", customerDevicecs);
			modelAndViewObj.addObject("locationsList", locationsList);
			
			modelAndViewObj.addObject("counterName",counter.getCounterName());
			modelAndViewObj.addObject("location",counter.getStoreLocation());
			modelAndViewObj.addObject("deviceId",counter.getDeviceId());
			modelAndViewObj.addObject("counterType",counter.getCounterType());
			modelAndViewObj.addObject("deviceType",counter.getDeviceType());
			modelAndViewObj.addObject("remarks",counter.getRemarks());
			
			exception.printStackTrace();
		}
		modelAndViewObj.setViewName("Admin/genericData/WarehouseCounters/newcounter");
		return modelAndViewObj;

	}
	
	@RequestMapping("/getCounterDetails")
	public ModelAndView getCounterDetails(@RequestParam("maxRecords")String maxRecords,@RequestParam("counterId")String counterId,@RequestParam("purpose")String purpose,@RequestParam("location")String location,@RequestParam("outletlocation")String outletlocation,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){

		/**
		 * @author Sambaiah.Y  03-07-2015
		 * 
		 *This method is used to get the all specific counter details
		 *
		 **/
		try{
			//log.info("AdminController - getCounterDetails");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String locationStr = "";
			String locationListAll="";
			String outlet_name = null;
			List<String> locationsLists = null;
			List<OutletInfo> storeList = null;
			List<MenuDetails> menuDetailsList = new ArrayList<MenuDetails>();


			
			modelAndViewObj = new ModelAndView();
			
			Map<String,Object> storesListMap = storeServiceObj.getStoresList(customerIdStr, emailIdStr,locationStr,"-1", "10");
			storeList = (List<OutletInfo>)storesListMap.get("storeDetailsList");
			
			 List<String> locationsListValue=new ArrayList<String>();
//	  			if(outlet_name.equals("all")|| outlet_name.equals("")){
					if(storeList != null){
							for(int i=0;i<storeList.size();i++){
								locationsListValue.add(storeList.get(i).getLocation());
							}
				
						for (String string : locationsListValue) {
							locationListAll = locationListAll+string+",";
						}
					}
				
					
					if(storeList != null && storeList.size() != 0){
						outlet_name = "";
						menuDetailsList = menuServiceObj.getMenuDetails(locationListAll, customerIdStr, emailIdStr,"",false);
					}
			
			//log.info(resultStr);
			modelAndViewObj = new ModelAndView();
			
			 modelAndViewObj.addObject("menuDetailsList", menuDetailsList);
			
			List<String> customerDevicecs = adminServiceObj.getCustomerDevices(customerIdStr,emailIdStr);
			List<EmployeeBean> empList = genericMasterServiceObj.getEmployees("",customerIdStr, emailIdStr,"-1","","",false,"");

			modelAndViewObj.addObject("devicesList", customerDevicecs);
			List<String> locationsList = adminServiceObj.getOutletLocationsList(customerIdStr, emailIdStr,true);
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"0","","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			for (ZoneMaster zoneMaster : zoneList) {
				locationsList.add(zoneMaster.getZoneID());
			}
			List<Counter> counterDetails = adminServiceObj.getCounters(counterId,location,customerIdStr,emailIdStr,"0",false,"10","");
			//modelAndViewObj.addObject("location", counterDetails.get(0).getStoreLocation());
		
			ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails("",customerIdStr, emailIdStr,"-1",false,"");

			modelAndViewObj.addObject("taxDetails",taxDetails);

			modelAndViewObj.addObject("countertax",counterDetails.get(0).getTaxCode());
			
			
			
			
			
			modelAndViewObj.addObject("device", counterDetails.get(0).getDeviceId());
			modelAndViewObj.addObject("counterId", counterDetails.get(0).getCounterId());
			modelAndViewObj.addObject("counterName", counterDetails.get(0).getCounterName());
			modelAndViewObj.addObject("type", counterDetails.get(0).getCounterType());
			modelAndViewObj.addObject("deviceType", counterDetails.get(0).getDeviceType());//added by manasa
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("empInfo", empList);
			modelAndViewObj.addObject("counterDetails", counterDetails);
			modelAndViewObj.addObject("storeLocation", counterDetails.get(0).getStoreLocation());
			//added by manasa
			modelAndViewObj.addObject("location", outletlocation);
			modelAndViewObj.addObject("counterUserId", counterDetails.get(0).getCounterUserId());
			modelAndViewObj.addObject("remarks", counterDetails.get(0).getRemarks());
			modelAndViewObj.addObject("printingType",counterDetails.get(0).getPrintingType());
			modelAndViewObj.addObject("menu",counterDetails.get(0).getMenu());
			modelAndViewObj.addObject("counterCategory",counterDetails.get(0).isB2bCounter());
			modelAndViewObj.addObject("quickBillFlag",counterDetails.get(0).isQuickBill());
			modelAndViewObj.addObject("createdOnStr",counterDetails.get(0).getCreatedOnStr());
			
			modelAndViewObj.addObject("paymentDeviceUsername",counterDetails.get(0).getPaymentDeviceUsername());
			modelAndViewObj.addObject("paymentDevicePin",counterDetails.get(0).getPaymentDevicePin());
			modelAndViewObj.addObject("paymentDevicePort",counterDetails.get(0).getPaymentDevicePort());
			
		//	//System.out.println("zsf"+counterDetails.get(0).getStoreLocation());
			modelAndViewObj.addObject("searchName", searchName);
			modelAndViewObj.addObject("maxRecords", maxRecords);
			if(purpose.equalsIgnoreCase("view"))
				modelAndViewObj.setViewName("Admin/genericData/Counters/counterdetails");
			else
				modelAndViewObj.setViewName("Admin/genericData/Counters/editcounterdetails");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	


	/*
	 * @RequestMapping("/getWhCounterDetails") public ModelAndView
	 * getWhCounterDetails(@RequestParam("maxRecords")String
	 * maxRecords,@RequestParam("counterId")String
	 * counterId,@RequestParam("purpose")String
	 * purpose,@RequestParam("location")String
	 * location,@RequestParam("outletlocation")String
	 * outletlocation,@RequestParam("searchName") String
	 * searchName,HttpServletRequest request,HttpServletResponse response){
	 * 
	 *//**
		 * @author Sambaiah.Y 03-07-2015
		 * 
		 *         This method is used to get the all specific counter details
		 *
		 **//*
			 * try{ //log.info("AdminController - getCounterDetails"); String customerIdStr
			 * = (String)request.getSession().getAttribute("customerId"); String emailIdStr
			 * = (String)request.getSession().getAttribute("emailId");
			 * 
			 * modelAndViewObj = new ModelAndView();
			 * 
			 * List<String> customerDevicecs =
			 * adminServiceObj.getCustomerDevices(customerIdStr,emailIdStr);
			 * 
			 * modelAndViewObj.addObject("devicesList", customerDevicecs); List<String>
			 * locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr,
			 * emailIdStr,true); WarehouseCounterResponse counterDetails =
			 * adminServiceObj.getWhCounters(counterId,location,customerIdStr,emailIdStr,"0"
			 * ,false,"10"); modelAndViewObj.addObject("location",
			 * counterDetails.getWarehouseCounters().getWarehouseLocation());
			 * modelAndViewObj.addObject("device",
			 * counterDetails.getWarehouseCounters().getDeviceId());
			 * modelAndViewObj.addObject("type",
			 * counterDetails.getWarehouseCounters().getCounterType());
			 * modelAndViewObj.addObject("locationsList", locationsList);
			 * modelAndViewObj.addObject("counterDetails",
			 * counterDetails.getWarehouseCounters());
			 * 
			 * //added by manasa modelAndViewObj.addObject("outletlocation",
			 * outletlocation); modelAndViewObj.addObject("searchName", searchName);
			 * modelAndViewObj.addObject("maxRecords", maxRecords);
			 * if(purpose.equalsIgnoreCase("view")) modelAndViewObj.setViewName(
			 * "Admin/genericData/WarehouseCounters/counterdetails"); else
			 * modelAndViewObj.setViewName(
			 * "Admin/genericData/WarehouseCounters/editcounterdetails"); }catch(Exception
			 * exception){ exception.printStackTrace(); } return modelAndViewObj; }
			 */
	
	@RequestMapping("/getWhCounterDetails")
	public ModelAndView getWhCounterDetails(@RequestParam("maxRecords")String maxRecords,@RequestParam("counterId")String counterId,@RequestParam("purpose")String purpose,@RequestParam("location")String location,@RequestParam("outletlocation")String outletlocation,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){

		/**
		 * @author Sambaiah.Y  03-07-2015
		 * 
		 *This method is used to get the all specific counter details
		 *
		 **/
		try{
			//log.info("AdminController - getCounterDetails");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			
			modelAndViewObj = new ModelAndView();
			
			List<String> customerDevicecs = adminServiceObj.getCustomerDevices(customerIdStr,emailIdStr);
			
			modelAndViewObj.addObject("devicesList", customerDevicecs);
			List<String> locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
			List<EmployeeBean> empList = genericMasterServiceObj.getEmployees("",customerIdStr, emailIdStr,"-1","","",false,"");
			WarehouseCounterResponse counterDetails = adminServiceObj.getWhCounters(counterId,location,customerIdStr,emailIdStr,"0",false,"10");
			
			ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails("",customerIdStr, emailIdStr,"-1",false,"");

			modelAndViewObj.addObject("taxDetails",taxDetails);
			modelAndViewObj.addObject("location", counterDetails.getWarehouseCounters().getWarehouseLocation());
			modelAndViewObj.addObject("device", counterDetails.getWarehouseCounters().getDeviceId());
			modelAndViewObj.addObject("type", counterDetails.getWarehouseCounters().getCounterType());
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("counterDetails", counterDetails.getWarehouseCounters());
		
			modelAndViewObj.addObject("counterUserId", counterDetails.getWarehouseCounters().getCounterUserId());
			modelAndViewObj.addObject("quickBillFlag",counterDetails.getWarehouseCounters().isQuickBill());
			modelAndViewObj.addObject("deviceType", counterDetails.getWarehouseCounters().getDeviceType());
			modelAndViewObj.addObject("countertax",counterDetails.getWarehouseCounters().getTaxCode());
			modelAndViewObj.addObject("counterCategory",counterDetails.getWarehouseCounters().isB2bCounters());
			modelAndViewObj.addObject("printingType",counterDetails.getWarehouseCounters().getPrintingType());
			modelAndViewObj.addObject("menu", counterDetails.getWarehouseCounters().getMenu());
	

			//added by manasa
			modelAndViewObj.addObject("outletlocation", outletlocation);
			modelAndViewObj.addObject("empInfo", empList);
			modelAndViewObj.addObject("searchName", searchName);
			modelAndViewObj.addObject("maxRecords", maxRecords);
			if(purpose.equalsIgnoreCase("view"))
				modelAndViewObj.setViewName("Admin/genericData/WarehouseCounters/counterdetails");
			else
				modelAndViewObj.setViewName("Admin/genericData/WarehouseCounters/editcounterdetails");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	@RequestMapping(value = "/updateCounter" , method = RequestMethod.POST,consumes="application/json")
	public ModelAndView updateCounter(@RequestBody Counter counter,HttpServletRequest request,HttpServletResponse response){
		/**
		 * @author Sambaiah.Y  03-07-2015
		 * 
		 *This method is used to store the new counter information in server
		 *modified by:manasa
		 **/
		String str_response = null;
		List<String> locationsList = null;
		List<String> customerDevicecs  = null;
		//log.info(counter.getCounterName());
		List<Counter> counterDetails = null;
		List<EmployeeBean> empList =null;
		String customerIdStr  = null,emailIdStr = null;
		String locationStr = "";
		String locationListAll="";
		String outlet_name = null;
		List<String> locationsLists = null;
		List<OutletInfo> storeList = null;
		List<MenuDetails> menuDetailsList = new ArrayList<MenuDetails>();


		try{
			//log.info("AdminController - createCounter");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr, emailIdStr,true);
			customerDevicecs = adminServiceObj.getCustomerDevices(customerIdStr,emailIdStr);
			str_response = adminServiceObj.createCounter(counter,customerIdStr,emailIdStr);
			 empList = genericMasterServiceObj.getEmployees("",customerIdStr, emailIdStr,"-1","","",false,"");

			 Map<String,Object> storesListMap = storeServiceObj.getStoresList(customerIdStr, emailIdStr,locationStr,"-1", "10");
				storeList = (List<OutletInfo>)storesListMap.get("storeDetailsList");
				
				 List<String> locationsListValue=new ArrayList<String>();
//		  			if(outlet_name.equals("all")|| outlet_name.equals("")){
						if(storeList != null){
								for(int i=0;i<storeList.size();i++){
									locationsListValue.add(storeList.get(i).getLocation());
								}
					
							for (String string : locationsListValue) {
								locationListAll = locationListAll+string+",";
							}
						}
					
						
						if(storeList != null && storeList.size() != 0){
							outlet_name = "";
							menuDetailsList = menuServiceObj.getMenuDetails(locationListAll, customerIdStr, emailIdStr,"",false);
						}

	             
				 
			//log.info(resultStr);
			modelAndViewObj = new ModelAndView();
			
			ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails("",customerIdStr, emailIdStr,"-1",false,"");

			modelAndViewObj.addObject("countertax",counter.getTaxCode());

		    modelAndViewObj.addObject("taxDetails", taxDetails);
			
			modelAndViewObj.addObject("menuDetailsList", menuDetailsList);
			modelAndViewObj.addObject("storeLocation", counter.getStoreLocation());
			modelAndViewObj.addObject("counterId", counter.getCounterId());
			modelAndViewObj.addObject("counterName", counter.getCounterName());
			modelAndViewObj.addObject("device", counter.getDeviceId());
			modelAndViewObj.addObject("counterUserId", counter.getCounterUserId());
//			modelAndViewObj.addObject("type", counterDetails.get(0).getCounterType());
			modelAndViewObj.addObject("type", counter.getCounterType());
			
			modelAndViewObj.addObject("remarks", counter.getRemarks());
			modelAndViewObj.addObject("printingType",counter.getPrintingType());
			modelAndViewObj.addObject("counterCategory",counter.isB2bCounter());
			modelAndViewObj.addObject("quickBillFlag",counter.isQuickBill());
			modelAndViewObj.addObject("createdOnStr", counter.getCreatedOnStr());
			modelAndViewObj.addObject("paymentDeviceUsername",counter.getPaymentDeviceUsername());
			modelAndViewObj.addObject("paymentDevicePin",counter.getPaymentDevicePin());
			modelAndViewObj.addObject("paymentDevicePort", counter.getPaymentDevicePort());


//			modelAndViewObj.addObject("counterDetails", counterDetails);
			if(!str_response.equals(AppProperties.getAppMessageByProperty("COUNTER_UPDATE_SUCCESS").trim()))
				modelAndViewObj.addObject("err", str_response);
			else
				modelAndViewObj.addObject("success", str_response);
			modelAndViewObj.addObject("devicesList", customerDevicecs);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("empInfo", empList);
			modelAndViewObj.addObject("maxRecords", counter.getMaxRecords());
			modelAndViewObj.addObject("deviceType", counter.getDeviceType());
			modelAndViewObj.addObject("menu", counter.getMenu());
			modelAndViewObj.setViewName("Admin/genericData/Counters/editcounterdetails");
		}catch(Exception exception){
			modelAndViewObj.addObject("err", str_response);
			modelAndViewObj.addObject("devicesList", customerDevicecs);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("empInfo", empList);
//			counterDetails = adminServiceObj.getCounters(counter.getCounterId(),counter.getStoreLocation(),customerIdStr,emailIdStr,"0",false,"10","");
//			modelAndViewObj.addObject("location", counter.getStoreLocation());
			modelAndViewObj.addObject("storeLocation", counter.getStoreLocation());
			modelAndViewObj.addObject("device", counter.getDeviceId());
			modelAndViewObj.addObject("counterUserId", counter.getCounterUserId());
//			modelAndViewObj.addObject("type", counterDetails.get(0).getCounterType());
			modelAndViewObj.addObject("type", counter.getCounterType());
			modelAndViewObj.addObject("remarks", counter.getRemarks());
			modelAndViewObj.addObject("printingType",counter.getPrintingType());
			modelAndViewObj.addObject("menu", counter.getMenu());
			modelAndViewObj.addObject("countertax",counter.getTaxCode());
			modelAndViewObj.addObject("createdOnStr", counter.getCreatedOnStr());

//			modelAndViewObj.addObject("counterDetails", counterDetails);
			exception.printStackTrace();
		}
		modelAndViewObj.setViewName("Admin/genericData/Counters/editcounterdetails");
		return modelAndViewObj;

	}
	
	/*
	 * @RequestMapping(value = "/updateWhCounter" , method =
	 * RequestMethod.POST,consumes="application/json") public ModelAndView
	 * updateWhCounter(@RequestBody Counter counter,HttpServletRequest
	 * request,HttpServletResponse response){
	 *//**
		 * @author Sambaiah.Y 03-07-2015
		 * 
		 *         This method is used to store the new counter information in server
		 *
		 **//*
			 * String str_response = null; List<String> locationsList = null; List<String>
			 * customerDevicecs = null; //log.info(counter.getCounterName());
			 * WarehouseCounterResponse counterDetails = null; String customerIdStr =
			 * null,emailIdStr = null; try{ //log.info("AdminController - createCounter");
			 * customerIdStr = (String)request.getSession().getAttribute("customerId");
			 * emailIdStr = (String)request.getSession().getAttribute("emailId");
			 * locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr,
			 * emailIdStr,true); customerDevicecs =
			 * adminServiceObj.getCustomerDevices(customerIdStr,emailIdStr); str_response =
			 * adminServiceObj.createWhCounter(counter,customerIdStr,emailIdStr);
			 * //log.info(resultStr); modelAndViewObj = new ModelAndView(); counterDetails =
			 * adminServiceObj.getWhCounters(counter.getCounterId(),counter.getStoreLocation
			 * (),customerIdStr,emailIdStr,"0",false,"10"); //log.info(new
			 * Gson().toJson(counterDetails)); modelAndViewObj.addObject("location",
			 * counterDetails.getWarehouseCounters().getWarehouseLocation());
			 * modelAndViewObj.addObject("device",
			 * counterDetails.getWarehouseCounters().getDeviceId());
			 * modelAndViewObj.addObject("type",
			 * counterDetails.getWarehouseCounters().getCounterType());
			 * modelAndViewObj.addObject("counterDetails",
			 * counterDetails.getWarehouseCounters());
			 * if(!str_response.equals(AppProperties.getAppMessageByProperty(
			 * "COUNTER_UPDATE_SUCCESS").trim())) modelAndViewObj.addObject("err",
			 * str_response); else modelAndViewObj.addObject("success", str_response);
			 * modelAndViewObj.addObject("devicesList", customerDevicecs);
			 * modelAndViewObj.addObject("locationsList", locationsList);
			 * modelAndViewObj.addObject("maxRecords", counter.getMaxRecords());
			 * modelAndViewObj.addObject("deviceType",
			 * counterDetails.getWarehouseCounters().getDeviceType()); }catch(Exception
			 * exception){ modelAndViewObj.addObject("err", str_response);
			 * modelAndViewObj.addObject("devicesList", customerDevicecs);
			 * modelAndViewObj.addObject("locationsList", locationsList); counterDetails =
			 * adminServiceObj.getWhCounters(counter.getCounterId(),counter.getStoreLocation
			 * (),customerIdStr,emailIdStr,"0",false,"10");
			 * modelAndViewObj.addObject("location",
			 * counterDetails.getWarehouseCounters().getWarehouseLocation());
			 * modelAndViewObj.addObject("device",
			 * counterDetails.getWarehouseCounters().getDeviceId());
			 * modelAndViewObj.addObject("type",
			 * counterDetails.getWarehouseCounters().getCounterType());
			 * modelAndViewObj.addObject("counterDetails",
			 * counterDetails.getWarehouseCounters()); exception.printStackTrace(); }
			 * modelAndViewObj.setViewName(
			 * "Admin/genericData/WarehouseCounters/editcounterdetails"); return
			 * modelAndViewObj;
			 * 
			 * }
			 */
	
	
	
	@RequestMapping(value = "/updateWhCounter" , method = RequestMethod.POST,consumes="application/json")
	public ModelAndView updateWhCounter(@RequestBody Counter counter,HttpServletRequest request,HttpServletResponse response){
		/**
		 * @author Sambaiah.Y  03-07-2015
		 * 
		 *This method is used to store the new counter information in server
		 *
		 **/
		String str_response = null;
		List<String> locationsList = null;
		List<String> customerDevicecs  = null;
		//log.info(counter.getCounterName());
		WarehouseCounterResponse counterDetails = null;
		String customerIdStr  = null,emailIdStr = null;
		try{
			//log.info("AdminController - createCounter");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
			customerDevicecs = adminServiceObj.getCustomerDevices(customerIdStr,emailIdStr);
			str_response = adminServiceObj.createWhCounter(counter,customerIdStr,emailIdStr);
			ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails("",customerIdStr, emailIdStr,"-1",false,"");

		
			//log.info(resultStr);
			modelAndViewObj = new ModelAndView();
			
			
			modelAndViewObj.addObject("taxDetails",taxDetails);
			
			if(!str_response.equals(AppProperties.getAppMessageByProperty("COUNTER_UPDATE_SUCCESS").trim()))
		    modelAndViewObj.addObject("err", str_response);
			else{
				
				counterDetails = adminServiceObj.getWhCounters(counter.getCounterId(),counter.getStoreLocation(),customerIdStr,emailIdStr,"0",false,"10");
				//log.info(new Gson().toJson(counterDetails));
				modelAndViewObj.addObject("location", counterDetails.getWarehouseCounters().getWarehouseLocation());
				modelAndViewObj.addObject("device", counterDetails.getWarehouseCounters().getDeviceId());
				modelAndViewObj.addObject("type", counterDetails.getWarehouseCounters().getCounterType());
				modelAndViewObj.addObject("counterDetails", counterDetails.getWarehouseCounters());
				modelAndViewObj.addObject("counterUserId", counterDetails.getWarehouseCounters().getCounterUserId());
				modelAndViewObj.addObject("quickBillFlag",counterDetails.getWarehouseCounters().isQuickBill());
				modelAndViewObj.addObject("countertax",counterDetails.getWarehouseCounters().getTaxCode());
				modelAndViewObj.addObject("counterCategory",counterDetails.getWarehouseCounters().isB2bCounters());
			
			modelAndViewObj.addObject("success", str_response);
			modelAndViewObj.addObject("devicesList", customerDevicecs);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("maxRecords", counter.getMaxRecords());
			modelAndViewObj.addObject("deviceType", counterDetails.getWarehouseCounters().getDeviceType());
			
			
			
			
			}
		}catch(Exception exception){
			modelAndViewObj.addObject("err", str_response);
			modelAndViewObj.addObject("devicesList", customerDevicecs);
			modelAndViewObj.addObject("locationsList", locationsList);
			counterDetails = adminServiceObj.getWhCounters(counter.getCounterId(),counter.getStoreLocation(),customerIdStr,emailIdStr,"0",false,"10");
			modelAndViewObj.addObject("location", counterDetails.getWarehouseCounters().getWarehouseLocation());
			modelAndViewObj.addObject("device", counterDetails.getWarehouseCounters().getDeviceId());
			modelAndViewObj.addObject("type", counterDetails.getWarehouseCounters().getCounterType());
			modelAndViewObj.addObject("counterDetails", counterDetails.getWarehouseCounters());
			modelAndViewObj.addObject("counterUserId", counterDetails.getWarehouseCounters().getCounterUserId());
			modelAndViewObj.addObject("quickBillFlag",counterDetails.getWarehouseCounters().isQuickBill());
			modelAndViewObj.addObject("countertax",counterDetails.getWarehouseCounters().getTaxCode());
			modelAndViewObj.addObject("counterCategory",counterDetails.getWarehouseCounters().isB2bCounters());
		
		modelAndViewObj.addObject("success", str_response);
		modelAndViewObj.addObject("devicesList", customerDevicecs);
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("maxRecords", counter.getMaxRecords());
		modelAndViewObj.addObject("deviceType", counterDetails.getWarehouseCounters().getDeviceType());
			exception.printStackTrace();
		}
		modelAndViewObj.setViewName("Admin/genericData/WarehouseCounters/editcounterdetails");
		return modelAndViewObj;

	}
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to delete the counters
	 *
	 **/
	@RequestMapping("/deleteCounter")
	public ModelAndView deleteCounter(@RequestParam("ids")String ids,HttpServletRequest request,HttpServletResponse response){
		ArrayList<LocationBean> locationBeansList = null;
		try{
			//log.info("deleteCounter ");
			int start = 1,end = 10;
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String result = adminServiceObj.deleteCounter(customerIdStr,emailIdStr ,ids);
			//List<String> locationsList = adminServiceObj.getOutletLocationsList(customerIdStr, emailIdStr,true);
           locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			List<Counter> counterDetails = adminServiceObj.getCounters("",locationBeansList.get(0).getLocationId(),customerIdStr,emailIdStr,"0",false,"10","");
			modelAndViewObj = new ModelAndView();
			if(counterDetails == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(counterDetails.size()<10){
					end = (counterDetails.size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(counterDetails.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("counterDetails", counterDetails);
			modelAndViewObj.addObject("workLocationsList", locationBeansList);
			modelAndViewObj.addObject("err", result);
			modelAndViewObj.setViewName("Admin/genericData/Counters/countermaster");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	

	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to delete the counters
	 *
	 **/
	/*
	 * @RequestMapping("/deleteWhCounter") public ModelAndView
	 * deleteWhCounter(@RequestParam("ids")String ids,HttpServletRequest
	 * request,HttpServletResponse response){ try{ //log.info("deleteCounter "); int
	 * start = 1,end = 10; modelAndViewObj = new ModelAndView(); String
	 * customerIdStr = (String)request.getSession().getAttribute("customerId");
	 * String emailIdStr = (String)request.getSession().getAttribute("emailId");
	 * String result = adminServiceObj.deleteWhCounter(customerIdStr,emailIdStr
	 * ,ids); List<String> locationsList =
	 * adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
	 * WarehouseCounterResponse counterDetails =
	 * adminServiceObj.getWhCounters("",locationsList.get(0),customerIdStr,
	 * emailIdStr,"0",false,"10"); modelAndViewObj = new ModelAndView();
	 * if(counterDetails == null){ modelAndViewObj.addObject("totalRecords","0");
	 * modelAndViewObj.addObject("index", "0");
	 * modelAndViewObj.addObject("totalValue", "0"); }else{
	 * if(counterDetails.getWarehouseCountersList() != null ){
	 * if(counterDetails.getWarehouseCountersList().size()<10){ end =
	 * (counterDetails.getWarehouseCountersList().size())+(Integer.parseInt("0"));
	 * }else{ end = (Integer.parseInt("0")+end); }
	 * modelAndViewObj.addObject("totalRecords", counterDetails.getTotalRecords());
	 * modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
	 * modelAndViewObj.addObject("totalValue", end); } }
	 * modelAndViewObj.addObject("counterDetails",
	 * counterDetails.getWarehouseCountersList()); modelAndViewObj.addObject("err",
	 * result); modelAndViewObj.setViewName(
	 * "Admin/genericData/WarehouseCounters/countermaster"); } catch(Exception
	 * exception){ exception.printStackTrace(); } return modelAndViewObj; }
	 */
	
	
	
	
	@RequestMapping("/deleteWhCounter")
	public ModelAndView deleteWhCounter(@RequestParam("ids")String ids,HttpServletRequest request,HttpServletResponse response){
		try{
			//log.info("deleteCounter ");
			int start = 1,end = 10;
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String result = adminServiceObj.deleteWhCounter(customerIdStr,emailIdStr ,ids);
			
			
			ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","Warehouse",false,false,true);

			WarehouseCounterResponse counterDetails = adminServiceObj.getWhCounters("",locationsList.get(0).getLocationId(),customerIdStr,emailIdStr,"0",false,"10");
			modelAndViewObj = new ModelAndView();
			if(counterDetails == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(counterDetails.getWarehouseCountersList() != null ){
				if(counterDetails.getWarehouseCountersList().size()<10){
					end = (counterDetails.getWarehouseCountersList().size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", counterDetails.getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			}
			modelAndViewObj.addObject("workLocationsList", locationsList);
			modelAndViewObj.addObject("counterDetails", counterDetails.getWarehouseCountersList());
			modelAndViewObj.addObject("err", result);
			modelAndViewObj.setViewName("Admin/genericData/WarehouseCounters/countermaster");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	
	
	
	/**
	 * @author Mythri.S
	 * @param request
	 * @param response
	 * @return returns a jsp which displays all the icons of outlet management flow
	 */
	/*@RequestMapping("/viewBackupFlow")
	public ModelAndView viewBackupFlow(HttpServletRequest request,HttpServletResponse response){
		log.info("viewImportFlow");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("Admin/backUpData.jsp");
		return modelAndViewObj;
	} */
	/**
	 * @author Sahitya
	 * @param request
	 * @param response
	 * @return returns a jsp which displays all the icons of shift management flow under outlet management flow
	 */
	
	@RequestMapping("/showShiftManagementFlows")
	public ModelAndView showShiftManagementFlows(@RequestParam("flowunder")String flowunder,HttpServletRequest request,HttpServletResponse response){
		//log.info("InventoryManagerController - showShiftManagementFlows");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("flowunder", flowunder);
		modelAndViewObj.setViewName("Admin/genericData/shiftManagementFlows");
		return modelAndViewObj;
	}
	

/**
	 * 
	 * @author Sahitya
	 * 
	 *This method is used to view the details of all shifts in tabular form
	 *
	 **/
	@RequestMapping(value="/viewShiftMaster",method=RequestMethod.GET)
	public ModelAndView viewShiftMaster(@RequestParam("flowunder")String flowunder,@RequestParam("index")String index,@RequestParam("location")String location,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
		List<ShiftMaster> shiftMasterDetailsList = null;
		ShiftResponse shiftMasterList = null;
		String locationListAll="";
		ArrayList<LocationBean> workLocationsList = null;
		List<String> locationsListValue = null;
		
		try{
			int start = 1,end = 10;
			//log.info("viewShift");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			locationsListValue=new ArrayList<String>();
			
			if(flowunder.equals("warehouse") ||flowunder ==  "warehouse" ){
				//workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
				
				/*ArrayList<LocationBean> workLocationsList1 = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,false);
				workLocationsList =workLocationsList1;*/
				
				workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
			}else{
				workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,false,true);
			}
			
			//List<String> workLocationsList = adminServiceObj.getAllLocationsList(customerIdStr, emailIdStr,true);
			
			modelAndViewObj = new ModelAndView();
			
			if(workLocationsList != null){
				for(int i=0;i<workLocationsList.size();i++){
					locationsListValue.add(workLocationsList.get(i).getLocationId());
				}
			}
			
			
			
			
			if(location.equals("all") || location.equals(""))
			{
				if(workLocationsList!=null)
		             for (String string : locationsListValue) {
							
							locationListAll = locationListAll+string+",";
						}
				
			}
				
			if(location != null && !location.equals(""))
				request.getSession().setAttribute("selectedLocation", location);
			shiftMasterList = shiftServiceObj.getShifts(searchName,index,customerIdStr,emailIdStr,location,false,locationListAll);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
		
			if(shiftMasterList.getTotalRecords()==null||shiftMasterList.getShifts()==null || shiftMasterList.getShifts().size() == 0){
				modelAndViewObj.addObject("shiftsList", shiftMasterList);
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				shiftMasterDetailsList = shiftMasterList.getShifts();
				if(shiftMasterDetailsList.size()<10){
					end = (shiftMasterDetailsList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("shiftsList", shiftMasterList);
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(shiftMasterList.getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("searchName", searchName);
			modelAndViewObj.addObject("flowunder", flowunder);
			modelAndViewObj.addObject("maxRecords", "10");
			modelAndViewObj.setViewName("Admin/genericData/shiftMaster");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	
	/**
	 * 
	 * @author Sahitya
	 * 
	 *This method is used to view the details of all shifts in tabular form
	 *
	 **/
	@RequestMapping(value="/newShift",method=RequestMethod.GET)
	public ModelAndView newShift(@RequestParam("flowUnder")String flowUnder,HttpServletRequest request,HttpServletResponse response){
		try{
			//log.info("New Shift");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			ArrayList<LocationBean> workLocationsList = null;
			
			if(flowUnder.equals("warehouse") ||flowUnder ==  "warehouse" ){
				workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
			}else{
				workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,true,false);

			}

			//List<String> workLocationsList = adminServiceObj.getAllLocationsList(customerIdStr, emailIdStr,false);
			/*List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"0");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			for (ZoneMaster zoneMaster : zoneList) {
				workLocationsList.add(zoneMaster.getZoneID());
			}*/
			String location = (String)request.getSession().getAttribute("selectedLocation");
			if(location == null)
				location = workLocationsList.get(0).getLocationId();
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("flowUnder",flowUnder);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.setViewName("Admin/genericData/newShift");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Sahitya
	 * 
	 *This method is used to save the shift details 
	 *
	 **/
	@RequestMapping(value="/createShift",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createShift(@RequestBody ShiftMaster shiftMaster,HttpServletRequest request,HttpServletResponse response){
		try{
			//log.info("create Shift Master"+shiftMaster);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			//log.info("Request from controller to services::::::"+gson.toJson(shiftMaster));
			String resultStr = shiftServiceObj.createShift(shiftMaster,customerIdStr,emailIdStr);
			//List<String> workLocationsList = adminServiceObj.getAllLocationsList(customerIdStr, emailIdStr,false);
			
			 ArrayList<LocationBean> workLocationsList = null;
             if(shiftMaster.getFlowUnder().equals("warehouse") ||shiftMaster.getFlowUnder() ==  "warehouse" ){
				workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
			}else{
				workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,true,false);

			}

			request.getSession().setAttribute("selectedLocation",shiftMaster.getStoreLocation());
			modelAndViewObj = new ModelAndView();
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("SHIFT_CREATE_SUCCESS").trim())){
				modelAndViewObj.addObject("err", resultStr);
				String shiftTimings = gson.toJson(shiftMaster.getShiftTimings());
				modelAndViewObj.addObject("shiftMasterDetailsObj",shiftMaster);
				modelAndViewObj.addObject("shiftTimings",shiftTimings);
				modelAndViewObj.addObject("type","new");
				modelAndViewObj.setViewName("Admin/genericData/editShift");
			}else{
				modelAndViewObj.setViewName("Admin/genericData/newShift");
				modelAndViewObj.addObject("success", resultStr);
			}
			modelAndViewObj.addObject("flowUnder",shiftMaster.getFlowUnder());
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("selectedLocation", shiftMaster.getStoreLocation());
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
		}
	
	/**
	 * 
	 * @author Sahitya
	 * 
	 *This method is used to delete the shifts
	 *
	 **/
	@RequestMapping(value="/deleteShifts",method=RequestMethod.POST)
	public ModelAndView deleteShifts(@RequestParam("flowUnder")String flowUnder,@RequestParam("ids") String ids,@RequestParam("location") String location,HttpServletRequest request,HttpServletResponse response){
		List<ShiftMaster> shiftMasterDetailsList = null;
		ShiftResponse shiftMasterList = null;
		int start = 1,end = 10;
		String  locationListAll ="";
		try{
			//log.info("deleteShifts");
			modelAndViewObj = new ModelAndView();
			ArrayList<LocationBean> workLocationsList = null;
			List<String> locationsListValue = null;
			locationsListValue=new ArrayList<String>();
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			String result = shiftServiceObj.deleteShifts(customerId,emailId ,ids);
			request.getSession().setAttribute("selectedLocation",location);
			modelAndViewObj.addObject("err", result);
			
			
			if(flowUnder.equals("warehouse") ||flowUnder ==  "warehouse" ){
				workLocationsList = genericMasterServiceObj.getLocationDetails("",customerId, emailId,"-1","Warehouse",false,false,true);
			}else{
				workLocationsList = genericMasterServiceObj.getLocationDetails("",customerId, emailId,"-1","",false,true,false);
			}
	
			
          // List<String> workLocationsList = adminServiceObj.getAllLocationsList(customerId, emailId,true);
//			modelAndViewObj = new ModelAndView();
			
			if(workLocationsList != null){
				for(int i=0;i<workLocationsList.size();i++){
					locationsListValue.add(workLocationsList.get(i).getLocationId());
				}
			}
			if(location.equals("all") || location.equals(""))
			{
				if(workLocationsList!=null)
		             for (String string : locationsListValue) {
							locationListAll = locationListAll+string+",";
						}
			}
					
				
			if(location != null && !location.equals(""))
				request.getSession().setAttribute("selectedLocation", location);
			shiftMasterList = shiftServiceObj.getShifts("","0",customerId,emailId,location,false,locationListAll);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			if(shiftMasterList.getTotalRecords()==null||shiftMasterList.getShifts()==null || shiftMasterList.getShifts().size() == 0){
				modelAndViewObj.addObject("shiftsList", shiftMasterList);
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				shiftMasterDetailsList = shiftMasterList.getShifts();
				if(shiftMasterDetailsList.size()<10){
					end = (shiftMasterDetailsList.size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("shiftsList", shiftMasterList);
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(shiftMasterList.getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}
//			modelAndViewObj.addObject("searchName", searchName);
			modelAndViewObj.addObject("flowunder", flowUnder);
			modelAndViewObj.addObject("maxRecords", "10");
			modelAndViewObj.setViewName("Admin/genericData/shiftMaster");
		}
			
			
//			modelAndViewObj = viewShiftMaster(flowUnder,"0",location,"", request, response);
		
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	

/**
	 * 
	 * @author Sahitya
	 * 
	 *This method is used to view specific shift
	 *added shiftlocation as param by manasa
	 **/
	@RequestMapping("/viewSpecificShift")
	public ModelAndView viewSpecificShift(@RequestParam("flowUnder") String flowUnder,@RequestParam("shiftCode") int shiftCode,@RequestParam("location") String location,@RequestParam("shiftLocation") String shiftLocation,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
		ShiftMaster shiftMasterDetailsObj = null;
		try{
			//log.info("viewSpecificShift ");
			modelAndViewObj = new ModelAndView();
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			shiftMasterDetailsObj = shiftServiceObj.viewSpecificShift(shiftCode,location,customerId,emailId);
			String shiftTimings = gson.toJson(shiftMasterDetailsObj.getShiftTimings());
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("shiftMasterDetailsObj",shiftMasterDetailsObj);
			modelAndViewObj.addObject("shiftTimings",shiftTimings);
			//added by manasa
			modelAndViewObj.addObject("shiftLocation",shiftLocation);
			modelAndViewObj.addObject("searchName", searchName);
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.setViewName("Admin/genericData/viewShift");
			
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	

	/**
	 * 
	 * @author Sahitya
	 * 
	 *This method is used to edit specific shift
	 *
	 **/
	@RequestMapping("/editSpecificShift")
	public ModelAndView editSpecificShift(@RequestParam("flowUnder") String flowUnder,@RequestParam("shiftCode") int shiftCode,@RequestParam("location") String location,@RequestParam("shiftLocation") String shiftLocation,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
		ShiftMaster shiftMasterDetailsObj = null;
		try{
			//log.info("editSpecificShift ");
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");

              ArrayList<LocationBean> workLocationsList = null;
                if(flowUnder.equals("warehouse") ||flowUnder ==  "warehouse" ){
				workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
			}else{
				workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,true,false);

			}

			//List<String> workLocationsList = adminServiceObj.getAllLocationsList(customerIdStr, emailIdStr,true);
			modelAndViewObj = new ModelAndView();
			shiftMasterDetailsObj = shiftServiceObj.viewSpecificShift(shiftCode,location,customerIdStr,emailIdStr);
			String shiftTimings = gson.toJson(shiftMasterDetailsObj.getShiftTimings());
			modelAndViewObj.addObject("type","edit");
			modelAndViewObj.addObject("shiftMasterDetailsObj",shiftMasterDetailsObj);
			modelAndViewObj.addObject("shiftTimings",shiftTimings);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			//added by manasa
			modelAndViewObj.addObject("shiftLocation",shiftLocation);
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.addObject("searchName", searchName);
			modelAndViewObj.setViewName("Admin/genericData/editShift");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Sahitya
	 * 
	 *This method is used to view the details of all shifts in tabular form
	 *
	 **/
	@RequestMapping(value="/updateShift",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView updateShift(@RequestBody ShiftMaster shiftMaster,HttpServletRequest request,HttpServletResponse response){
		ShiftMaster shiftMasterDetailsObj = null;
		try{
			//log.info("update Shift Master"+shiftMaster);
			String resultStr="";
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			//List<String> workLocationsList = adminServiceObj.getAllLocationsList(customerIdStr, emailIdStr,true);
			
			 ArrayList<LocationBean> workLocationsList = null;
             if(shiftMaster.getFlowUnder().equals("warehouse") ||shiftMaster.getFlowUnder() ==  "warehouse" ){
				workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
			}else{
				workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,true,false);

			}
			//log.info("Request from controller to services::::::"+gson.toJson(shiftMaster));
			resultStr = shiftServiceObj.updateShift(shiftMaster,customerIdStr,emailIdStr);
			shiftMasterDetailsObj = shiftServiceObj.viewSpecificShift(shiftMaster.getShiftId(),shiftMaster.getStoreLocation(),customerIdStr,emailIdStr);
			String shiftTimings = gson.toJson(shiftMasterDetailsObj.getShiftTimings());
			request.getSession().setAttribute("selectedLocation",shiftMaster.getStoreLocation());
			modelAndViewObj = new ModelAndView();
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("SHIFT_UPDATE_SUCCESS").trim()))
				modelAndViewObj.addObject("err",resultStr);
			else
				modelAndViewObj.addObject("success",resultStr);
			modelAndViewObj.addObject("type","edit");
			modelAndViewObj.addObject("flowUnder",shiftMaster.getFlowUnder());
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("shiftMasterDetailsObj",shiftMasterDetailsObj);
			modelAndViewObj.addObject("shiftTimings",shiftTimings);
			modelAndViewObj.setViewName("Admin/genericData/editShift");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
		}
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to view the details of all shifts in tabular form
	 *
	 **/
	@RequestMapping(value="/newShiftAllocation",method=RequestMethod.GET)
	public ModelAndView newShiftAllocation(@RequestParam("flowUnder") String flowUnder,HttpServletRequest request,HttpServletResponse response){
		try{
			//log.info("newShiftAllocation");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			

ArrayList<LocationBean> workLocationsList = null;
if(flowUnder.equals("warehouse") ||flowUnder ==  "warehouse" ){
				workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
			}else{
				workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,true,false);

			}

			//List<String> workLocationsList = adminServiceObj.getAllLocationsList(customerIdStr, emailIdStr,false);
			/*List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"0");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			for (ZoneMaster zoneMaster : zoneList) {
				workLocationsList.add(zoneMaster.getZoneID());
			}*/
			String location = (String)request.getSession().getAttribute("selectedLocation");
			ShiftMaster shiftMasterDetailsObj = null;
			if(location == null)
				location = workLocationsList.get(0).getLocationId();
			if(location != null && !location.equals(""))
				request.getSession().setAttribute("selectedLocation", location);
			ShiftResponse shiftMasterList = shiftServiceObj.getShifts("","-1",customerIdStr,emailIdStr,location,false,"");
			if(shiftMasterList.getShifts() != null){
				shiftMasterDetailsObj = shiftServiceObj.viewSpecificShift(shiftMasterList.getShifts().get(0).getShiftId(),location,customerIdStr,emailIdStr);
				List<String> departmentList = departmentServiceObj.getDepartmentsList(null,customerIdStr, emailIdStr);
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("departmentList", departmentList);
				modelAndViewObj.addObject("shiftMasterDetailsObj",shiftMasterDetailsObj);
				modelAndViewObj.addObject("shifts",shiftMasterList.getShifts());
				modelAndViewObj.addObject("workLocationsList", workLocationsList);
				modelAndViewObj.addObject("selectedLocation", location);
				modelAndViewObj.addObject("flowUnder", flowUnder);
				modelAndViewObj.setViewName("Admin/genericData/newShiftAllocation");
			}
			else
				modelAndViewObj.addObject("err", "No Shifts in This Location");
			modelAndViewObj.addObject("flowUnder", flowUnder);
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display the Edit Employee form consisting of the details of the Employee
	 *
	 **/
	@RequestMapping("/getShiftIds")
	public @ResponseBody String getShiftIds(@RequestParam("location") String location,@RequestParam("shiftId") Integer shiftId,HttpServletRequest request,HttpServletResponse response){
		ShiftResponse shiftMasterList = null;
		try{
			//log.info("getShiftIds");
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			if (shiftId != null && shiftId != 0){
				shiftMasterList = new ShiftResponse();
				shiftMasterList.setShiftMaster(shiftServiceObj.viewSpecificShift(shiftId,location,customerId,emailId));
			}
			else{
			shiftMasterList = shiftServiceObj.getShifts("","-1",customerId,emailId,location,false,"");
			////System.out.println(shiftMasterList.getShifts().get(0).getShiftId());
			if(shiftMasterList != null)
				shiftMasterList.setShiftMaster(shiftServiceObj.viewSpecificShift(shiftMasterList.getShifts().get(0).getShiftId(),location,customerId,emailId));
			}
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return new Gson().toJson(shiftMasterList);
	}
	
	
	@RequestMapping(value="/createShiftAllocation",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createShiftAllocation(@RequestBody ShiftAllocationBean shiftAllocationBeanObj,HttpServletRequest request,HttpServletResponse response){
		try{
			//log.info("createShiftAllocation");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			ArrayList<LocationBean> workLocationsList = null;
			String result = shiftServiceObj.createShiftAllocation(shiftAllocationBeanObj,customerIdStr,emailIdStr);
			request.getSession().setAttribute("selectedLocation", shiftAllocationBeanObj.getShiftLocation());
			//List<String> workLocationsList = adminServiceObj.getAllLocationsList(customerIdStr,emailIdStr,false);

          if(shiftAllocationBeanObj.getFlowUnder().equals("warehouse") ||shiftAllocationBeanObj.getFlowUnder() ==  "warehouse" ){
				workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
			}else{
				workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,true,false);

			}
			
			
			ShiftMaster shiftMasterDetailsObj = null;
			ShiftResponse shiftMasterList = shiftServiceObj.getShifts("","-1",customerIdStr,emailIdStr,shiftAllocationBeanObj.getShiftLocation(),false,"");
			if(shiftMasterList != null)
			    shiftMasterDetailsObj = shiftServiceObj.viewSpecificShift(shiftMasterList.getShifts().get(0).getShiftId(),shiftAllocationBeanObj.getShiftLocation(),customerIdStr,emailIdStr);
			List<String> departmentList = departmentServiceObj.getDepartmentsList(null,customerIdStr, emailIdStr);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("departmentList", departmentList);
			modelAndViewObj.addObject("shiftMasterDetailsObj",shiftMasterDetailsObj);
			modelAndViewObj.addObject("shifts",shiftMasterList.getShifts());
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("flowUnder", shiftAllocationBeanObj.getFlowUnder());
			
			modelAndViewObj.addObject("selectedLocation", shiftAllocationBeanObj.getShiftLocation());
			if(!result.equals(AppProperties.getAppMessageByProperty("SHIFT_ALLOCATION_TO_EMPLOYEE_SUCCESS").trim()))
			{
				modelAndViewObj.addObject("shiftAllocation", shiftAllocationBeanObj);
				modelAndViewObj.addObject("err", result);
			}
			else
				modelAndViewObj.addObject("success", result);
			modelAndViewObj.addObject("flowUnder", shiftAllocationBeanObj.getFlowUnder());
			modelAndViewObj.setViewName("Admin/genericData/newShiftAllocation");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}

	@RequestMapping(value="/viewShiftAllocationMaster",method=RequestMethod.GET)
	public ModelAndView viewShiftAllocationMaster(@RequestParam("flowUnder")String flowUnder,@RequestParam("index") String index,@RequestParam("location") String location,HttpServletRequest request,HttpServletResponse response){
		ShiftAllocationBean shiftAllocationBeanObj = null;
		List<String> locationsListValue=null;
//		String locationListAll="";
		try{
			int start = 1,end = 10;
			//log.info("viewShiftAllocationMaster");
			locationsListValue=new ArrayList<String>();
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			List<String> workLocationsList=null;
			if(flowUnder.equalsIgnoreCase("outlet")){
			workLocationsList = adminServiceObj.getOutletLocationsList(customerId,emailId,false);
			}
			else
			{
			 workLocationsList = adminServiceObj.getWarehouseLocationsList(customerId, emailId,false);
			}
//			ArrayList<LocationBean> workLocationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
			modelAndViewObj = new ModelAndView();
		/*	if(location==""||location==null||location=="undefined"){
				location = (String)request.getSession().getAttribute("selectedLocation");
				if(location == null && workLocationsList != null && workLocationsList.size()>0)
					location = workLocationsList.get(0);
			}*/
			
//			Added by vijay, to make default loaction as location list first occurrence, if location is empty
//			if((location.trim()).equals(null) || location.trim().isEmpty())
//			{
//				location = workLocationsList.get(0);
//			}
			/*if(location.equals("all")|| location.equals("")){
				if(workLocationsList != null){
					for(int i=0;i<workLocationsList.size();i++){
					
						locationsListValue.add(workLocationsList.get(i).getLocationId());
							
					}
				for (String string : locationsListValue) {
					
					locationListAll = locationListAll+string+",";
				}
				}
				
			}
			*/
			
			if(location != null && !location.equals(""))
				request.getSession().setAttribute("selectedLocation", location);
			
			shiftAllocationBeanObj = shiftServiceObj.getShiftAllocations("",null,customerId,emailId,index,location,flowUnder);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			if(shiftAllocationBeanObj.getTotalRecords()== 0||shiftAllocationBeanObj.getShiftAllocationBeanList()==null || shiftAllocationBeanObj.getShiftAllocationBeanList().size() == 0){
				modelAndViewObj.addObject("shiftAllocationList", shiftAllocationBeanObj.getShiftAllocationBeanList());
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(shiftAllocationBeanObj.getShiftAllocationBeanList().size()<10){
					end = (shiftAllocationBeanObj.getShiftAllocationBeanList().size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("shiftAllocationList", shiftAllocationBeanObj.getShiftAllocationBeanList());
				modelAndViewObj.addObject("totalRecords", shiftAllocationBeanObj.getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("maxRecords", "10");
			
//				//System.out.println("dgd"+flowUnder);
			}
//			//System.out.println("dgd"+flowUnder);
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.setViewName("Admin/genericData/shiftAllocationMaster");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display the Edit Tax form consisting of the details of the Tax
	  *added location as param by manasa
	 **/
	@RequestMapping("/viewSpecificShiftAllocation")
	public ModelAndView viewSpecificShiftAllocation(@RequestParam("flowUnder")String flowUnder,@RequestParam("shiftId") Integer shiftId,@RequestParam("type") String type,@RequestParam("location") String location,HttpServletRequest request,HttpServletResponse response){
		try{
//.info("viewSpecificShiftAllocation");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");

ArrayList<LocationBean> workLocationsList = null;
if(flowUnder.equals("warehouse") ||flowUnder ==  "warehouse" ){
				workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
			}else{
				workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,true,false);

			}
			


			ShiftAllocationBean shiftAllocationBeanObj = shiftServiceObj.getShiftAllocations("",shiftId,customerIdStr,emailIdStr,"-1",null,"");
			ShiftMaster shiftMasterDetailsObj = shiftServiceObj.viewSpecificShift(shiftId,shiftAllocationBeanObj.getShiftLocation(),customerIdStr,emailIdStr);
			ShiftResponse shiftMasterList = shiftServiceObj.getShifts("","-1",customerIdStr,emailIdStr,shiftAllocationBeanObj.getShiftLocation(),false,"");
			//List<String> workLocationsList = adminServiceObj.getAllLocationsList(customerIdStr,emailIdStr,true);
			List<String> departmentList = departmentServiceObj.getDepartmentsList(null,customerIdStr, emailIdStr);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("departmentList", departmentList);
			modelAndViewObj.addObject("shiftMasterDetailsObj",shiftMasterDetailsObj);
			modelAndViewObj.addObject("shiftAllocation", shiftAllocationBeanObj);
			modelAndViewObj.addObject("shifts",shiftMasterList.getShifts());
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("location", location);
			modelAndViewObj.addObject("flowUnder", flowUnder);
			if(type.equals("view"))
				modelAndViewObj.setViewName("Admin/genericData/viewShiftAllocation");
			else
				modelAndViewObj.setViewName("Admin/genericData/editShiftAllocation");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	@RequestMapping(value="/updateShiftAllocation",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView updateShiftAllocation(@RequestBody ShiftAllocationBean shiftAllocationBeanObj,HttpServletRequest request,HttpServletResponse response){
		try{
			//log.info("updateShiftAllocation");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			ArrayList<LocationBean> workLocationsList = null;
			
			String result = shiftServiceObj.updateShiftAllocation(shiftAllocationBeanObj,customerIdStr,emailIdStr);
			request.getSession().setAttribute("selectedLocation", shiftAllocationBeanObj.getShiftLocation());
			//List<String> workLocationsList = adminServiceObj.getAllLocationsList(customerIdStr,emailIdStr,true);
			if(shiftAllocationBeanObj.getFlowUnder().equals("warehouse") ||shiftAllocationBeanObj.getFlowUnder() ==  "warehouse" ){
				workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
			}else{
				workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,true,false);

			}

			
			ShiftResponse shiftMasterList = shiftServiceObj.getShifts("","-1",customerIdStr,emailIdStr,shiftAllocationBeanObj.getShiftLocation(),false,"");
			ShiftMaster shiftMasterDetailsObj = shiftServiceObj.viewSpecificShift(shiftAllocationBeanObj.getShiftId(),shiftAllocationBeanObj.getShiftLocation(),customerIdStr,emailIdStr);
			List<String> departmentList = departmentServiceObj.getDepartmentsList(null,customerIdStr, emailIdStr);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("departmentList", departmentList);
			modelAndViewObj.addObject("shiftMasterDetailsObj",shiftMasterDetailsObj);
			modelAndViewObj.addObject("shiftAllocation", shiftAllocationBeanObj);
			modelAndViewObj.addObject("shifts",shiftMasterList.getShifts());
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("flowUnder", shiftAllocationBeanObj.getFlowUnder());
			if(!result.equals(AppProperties.getAppMessageByProperty("SHIFT_ALLOCATION_TO_EMPLOYEE_SUCCESS").trim()))
				modelAndViewObj.addObject("err", result);
			else
				modelAndViewObj.addObject("success", result);
			modelAndViewObj.setViewName("Admin/genericData/editShiftAllocation");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}

	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to delete Taxes
	 *
	 **/
	@RequestMapping("/deleteShiftAllocation")
	public ModelAndView deleteShiftAllocation(@RequestParam("flowUnder")String flowUnder,@RequestParam("ids") String ids,HttpServletRequest request,HttpServletResponse response){
		try{
			//log.info("deleteShiftAllocation");
			int start = 1,end = 10;
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			String resultStr = shiftServiceObj.deleteShiftAllocation(customerId,emailId,ids);
			List<String> workLocationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerId,emailId,true);
			String location = (String)request.getSession().getAttribute("selectedLocation");
			modelAndViewObj = new ModelAndView();
			/*if(location==""||location==null||location=="undefined"){
				location = (String)request.getSession().getAttribute("selectedLocation");
				if(location == null)
					location = workLocationsList.get(0);
			}*/
			if(location != null && !location.equals(""))
				request.getSession().setAttribute("selectedLocation", location);
			ShiftAllocationBean  shiftAllocationBeanObj = shiftServiceObj.getShiftAllocations("",null,customerId,emailId,"0",location,"");
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			if(shiftAllocationBeanObj.getTotalRecords()== 0||shiftAllocationBeanObj.getShiftAllocationBeanList()==null || shiftAllocationBeanObj.getShiftAllocationBeanList().size() == 0){
				modelAndViewObj.addObject("shiftAllocationList", shiftAllocationBeanObj.getShiftAllocationBeanList());
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(shiftAllocationBeanObj.getShiftAllocationBeanList().size()<10){
					end = (shiftAllocationBeanObj.getShiftAllocationBeanList().size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("shiftAllocationList", shiftAllocationBeanObj.getShiftAllocationBeanList());
				modelAndViewObj.addObject("totalRecords", shiftAllocationBeanObj.getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("err", resultStr);
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.setViewName("Admin/genericData/shiftAllocationMaster");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	
	
	
	
		
			

			

	




		



	
	
	
	


	



	
		
		

					
				
					
	

	/**
	 * @author Mythri.S
	 * @param request
	 * @param response
	 * @return returns a jsp which displays all the icons of outlet management flow
	 */
	@RequestMapping("/viewBackupFlow")
	public ModelAndView viewBackupFlow(HttpServletRequest request,HttpServletResponse response){
		//log.info("viewImportFlow");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("Admin/backUpData");
		return modelAndViewObj;
	}
	
	/**
	 * @author Mythri.S
	 * @param request
	 * @param response
	 * @return returns a jsp which displays all the icons of outlet management flow
	 */
	@RequestMapping("/backupDB")
	public void backupDB(@RequestParam("id")String id,HttpServletRequest request,HttpServletResponse response){
		//log.info("backupDB");
		try {
			BackupAndRestore backupAndRestore = new  BackupAndRestore(); 
			if(id.equals("fullBackupDb")){
				backupAndRestore.absoluteBackupForDB("emp", "root", "root", "Backup");
			}else
				backupAndRestore.incrementalBackupForDB("emp", "root", "root", "Backup","bin-log.000002");
			
		} catch (Exception e) {
		}
		try {
			/*response.setContentType("application/text");
			response.setCharacterEncoding("UTF-8");
			result = "Success";
			response.getWriter().write(result);*/
			String filePath = "D:/backup/emp/11-12-2015_abs.sql";
			
		        File downloadFile = new File(filePath);
		        FileInputStream inStream = new FileInputStream(downloadFile);
		         
		        String   mimeType = "application/octet-stream";
		        ////System.out.println("MIME type: " + mimeType);
		        // modifies response
		        response.setContentType(mimeType);
		        response.setContentLength((int) downloadFile.length());
		         
		        // forces download
		        String headerKey = "Content-Disposition";
		        String headerValue = String.format("attachment; filename=\"%s\"", downloadFile.getName());
		        response.setHeader(headerKey, headerValue);
		        
		        // obtains response's output stream
		        OutputStream outStream = response.getOutputStream();
		         
		        byte[] buffer = new byte[4096];
		        int bytesRead = -1;
		         
		        while ((bytesRead = inStream.read(buffer)) != -1) {
		            outStream.write(buffer, 0, bytesRead);
		        }
		         
		        inStream.close();
		        outStream.close(); 
			
		} catch (Exception e) {
		}
	}
	
	 public boolean backupDB(String dbName, String dbUserName, String dbPassword, String path) {
	   	 
	        String executeCmd = "D:/mysqldump -u " + dbUserName + " -p" + dbPassword + " --add-drop-database -B " + dbName + " -r " + path;
	        Process runtimeProcess;
	        try {
	            runtimeProcess = Runtime.getRuntime().exec(executeCmd);
	            int processComplete = runtimeProcess.waitFor();
	            if (processComplete == 0) {
	                ////System.out.println("Backup created successfully");
	                return true;
	            } else {
	                ////System.out.println("Could not create the backup");
	            }
	        } catch (Exception ex) {
	            ex.printStackTrace();
	        }
	 
	        return false;
	    }
	 
		

	

	
	@RequestMapping("/searchShiftMaster")
	public ModelAndView searchShiftMaster(@RequestParam("flowUnder") String flowUnder,@RequestParam("searchName") String searchNameStr,@RequestParam("location") String 

	location,@RequestParam("index") String index, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		ShiftResponse shiftMasterList = null;
		List<String> locationsList = null;
		List<ShiftMaster> shiftMasterDetailsList = null;
		try{
			//log.info("searchShiftMaster");
			int start = 1,end = 10;
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			modelAndViewObj = new ModelAndView();
			/*if(location==""||location==null||location=="undefined"){
				location = (String)request.getSession().getAttribute("selectedLocation");
				if(location == null && workLocationsList != null && workLocationsList.size()>0)
					location = workLocationsList.get(0);
			}*/
			if(location != null && !location.equals(""))
				request.getSession().setAttribute("selectedLocation", location);
			shiftMasterList = shiftServiceObj.getShifts(searchNameStr,index, customerIdStr, emailIdStr, location, true,"");
			modelAndViewObj.addObject("locationsList", locationsList);
			if(shiftMasterList.getTotalRecords()==null||shiftMasterList.getShifts()==null || shiftMasterList.getShifts().size() == 0){
				modelAndViewObj.addObject("shiftsList", shiftMasterList);
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{shiftMasterDetailsList = shiftMasterList.getShifts();
			if(shiftMasterDetailsList.size()<10){
				end = (shiftMasterDetailsList.size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			modelAndViewObj.addObject("shiftsList", shiftMasterList);
			modelAndViewObj.addObject("totalRecords", Integer.parseInt(shiftMasterList.getTotalRecords()));
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
			}
			//}
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("flowunder", flowUnder);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.setViewName("Admin/genericData/shiftMaster");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}

	@RequestMapping("/searchShiftAllocationMaster")
	public ModelAndView searchShiftAllocationMaster(@RequestParam("flowUnder") String flowUnder,@RequestParam("locationList") String locationList,@RequestParam("searchName") String searchNameStr,@RequestParam("location") String 
			location,@RequestParam("index") String index, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		ShiftAllocationBean shiftAllocationBeanObj = null;
		List<String> locationsList = null;
		try{
			//log.info("searchShiftAllocationMaster");
			int start = 1,end = 10;
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
//			List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
		
			ArrayList<LocationBean> workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,true,true);
			modelAndViewObj = new ModelAndView();
			/*if(location==""||location==null||location=="undefined"){
				location = (String)request.getSession().getAttribute("selectedLocation");
				if(location == null && workLocationsList != null && workLocationsList.size()>0)
					location = workLocationsList.get(0);
			}*/
			if(location != null && !location.equals(""))
				request.getSession().setAttribute("selectedLocation", location);
			shiftAllocationBeanObj = shiftServiceObj.getShiftAllocations(searchNameStr,null,customerIdStr,emailIdStr,index,location,"");
			modelAndViewObj.addObject("locationsList", locationsList);
			if(shiftAllocationBeanObj.getTotalRecords()== 0||shiftAllocationBeanObj.getShiftAllocationBeanList()==null || shiftAllocationBeanObj.getShiftAllocationBeanList().size() == 0){
				modelAndViewObj.addObject("shiftAllocationList", shiftAllocationBeanObj.getShiftAllocationBeanList());
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(shiftAllocationBeanObj.getShiftAllocationBeanList().size()<10){
				end = (shiftAllocationBeanObj.getShiftAllocationBeanList().size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			modelAndViewObj.addObject("shiftAllocationList", shiftAllocationBeanObj.getShiftAllocationBeanList());
			modelAndViewObj.addObject("totalRecords",shiftAllocationBeanObj.getTotalRecords());
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.setViewName("Admin/genericData/shiftAllocationMaster");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Surya.K
	 * 
	 *	This method is used to display the List departments
	 *
	 **/
	@RequestMapping("/searchOrganizationDepartmentNames")
	public @ResponseBody List<String> searchOrganizationDepartmentNames(@RequestParam("deptName") String deptName,HttpServletRequest request,HttpServletResponse response){
		List<String> deptList = new ArrayList<String>();
		try{
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			deptList = departmentServiceObj.getOrganizationDepartmentDetails(customerIdStr, emailIdStr,deptName);
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return deptList;
	}

	
	@RequestMapping("/showOutletMonitoringFlows")
	public ModelAndView showOutletMonitoringFlows(@RequestParam("flowunder")String flowunder,HttpServletRequest request,HttpServletResponse response){
		//log.info("InventoryManagerController - showShiftManagementFlows");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("flowunder", flowunder);
		modelAndViewObj.setViewName("Admin/genericData/OutletMonitoring");
		return modelAndViewObj;
	}

	@RequestMapping("/searchTenderMaster")
	public @ResponseBody List<TenderMaster> searchTenderMaster(@RequestParam("empName") String empName,@RequestParam("location") String location,HttpServletRequest request,HttpServletResponse response){
		List<TenderMaster> tenderList = new ArrayList<TenderMaster>();
		try{
			//log.info("searchEmployee");
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			
			tenderList = genericMasterServiceObj.getTender("",customerId,emailId,"-1",100);
			
			///customerId.empList = genericMasterServiceObj.getEmployees(empName,customerId, emailId,"-1",location,"",false,"");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return tenderList;
	}


}
