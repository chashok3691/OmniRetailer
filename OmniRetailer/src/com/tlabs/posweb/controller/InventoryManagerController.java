/*******************************************************************************
 * Copyright  2015 Omni Retailer Customer Console, All rights reserved.
 * Author : Sahitya
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

import java.io.IOException;
import java.math.BigDecimal;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.rmi.RemoteException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
//import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

//import javax.annotation.Resources;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import com.tlabs.posweb.beans.ItemWiseReport;
//import com.tlabs.posweb.beans.Restaurant;
//import com.tlabs.posweb.beans.SalesReport;
//import com.tlabs.posweb.beans.SectionDetails;
//import com.tlabs.posweb.beans.StockIssue;
//import com.tlabs.posweb.beans.VerificationDetails;
//import com.tlabs.posweb.beans.WareHouseSku;
//import com.tlabs.posweb.beans.ZoneDetails;
import com.tlabs.posweb.beans.*;
import com.tlabs.posweb.init.AppProperties;
//import org.apache.axis.session.Session;
import org.apache.log4j.Logger;
//import org.apache.poi.util.SystemOutLogger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.zxing.Result;
//import com.sun.glass.ui.MenuItem;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import com.technolabssoftware.www.Attachment;

import com.technolabssoftware.www.OfferProxy;
import com.tlabs.posweb.services.AdminService;
import com.tlabs.posweb.services.BillingService;
import com.tlabs.posweb.services.DealService;
import com.tlabs.posweb.services.DepartmentService;
import com.tlabs.posweb.services.GenericMasterService;
import com.tlabs.posweb.services.MasterService;
import com.tlabs.posweb.services.MenuService;
import com.tlabs.posweb.services.OfferService;
import com.tlabs.posweb.services.OrderService;
import com.tlabs.posweb.services.OrganizationDepartmentService;
import com.tlabs.posweb.services.OutletMasterService;
import com.tlabs.posweb.services.OutletNotificationService;
import com.tlabs.posweb.services.ProcurementService;
import com.tlabs.posweb.services.ProductService;
import com.tlabs.posweb.services.ReportsService;
import com.tlabs.posweb.services.RoleService;
import com.tlabs.posweb.services.SkuService;
import com.tlabs.posweb.services.StockIssueService;
import com.tlabs.posweb.services.StockReceiptService;
import com.tlabs.posweb.services.StockVerificationService;
import com.tlabs.posweb.services.StoreService;
import com.tlabs.posweb.services.WarehouseService;
import com.tlabs.posweb.util.Constants;
import com.tlabs.posweb.util.DateUtil;
//import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
//import com.tlabs.posweb.util.RestfulServiceConnection;
import com.tlabs.posweb.util.TallyRequest;
import com.tlabs.posweb.util.Utilities;




/**
 * @author : Sahitya
 * @VerifiedBy : 
 * @Desc : This controller is used to receive/send data related to outlet,layout,main masters from/to webservice/user-experience  
 */
@Controller
@RequestMapping(value = "/inventorymanager")
public class InventoryManagerController {

	
    //private static Logger log = Logger.getLogger(InventoryManagerController.class);
    @Autowired
	private RoleService roleServiceObj;
    @Autowired
	private AdminService adminServiceObj;
    @Autowired
    private StoreService storeServiceObj;
    @Autowired
    private Gson gson;
    @Autowired
    private MasterService masterServiceObj;
    @Autowired
    private BillingService billServiceObj;
   	@Autowired
   	private OrderService orderServiceObj;
    @Autowired
    private StockReceiptService stockReceiptServiceObj;
    @Autowired
    private StockIssueService stockIssueServiceObj;
    @Autowired
    private ProductService productServiceObj;
    @Autowired
    private DealService dealServiceObj;
    @Autowired
    private ProcurementService procurementServiceObj;
    @Autowired
    private OfferService offerServiceObj;
    @Autowired
    private SkuService skuServiceObj;
    @Autowired
    private StockVerificationService storeStockVerificationServiceObj;
    @Autowired
    private WarehouseService warehouseServiceObj;
    @Autowired
    private DepartmentService departmentServiceObj;
    @Autowired
    private OutletNotificationService outletNotificataionServiceObj;
    @Autowired
    private GenericMasterService genericMasterServiceObj;
    @Autowired
	private OutletMasterService outletMasterServiceObj;
    @Autowired
 	private ReportsService reportsServiceObj;
    @Autowired 
    private OrganizationDepartmentService orgdepartmentServiceObj;
    @Autowired
    private MenuService menuServiceObj;
    private ModelAndView modelAndViewObj;
	

    /**
	  * @author Sahitya
	  * Verified By : 
	  * 
	  * @param Request,Response
	  * 
      * This method is used to send dashboard page whenever user clicks home page in GUI(user-experience)
      * 
      * @return ModelAndView 
      */
    @RequestMapping("/dashboard")
	public ModelAndView viewDashboard(HttpServletRequest request,HttpServletResponse response) {
    	try{
    		// log.info("viewDashboard called");
    		modelAndViewObj = new ModelAndView();
    		modelAndViewObj.setViewName("Inventory Manager/dashboard");
    	}catch(Exception e){
    	  e.printStackTrace();	
    	}
    	return modelAndViewObj;
	}
    
    /**
	 * @author Manasa.P
	 * @param location,Request,Response
      @return  object with list of outlet details
     */
	@RequestMapping("/getStorelistByLocation")
	public @ResponseBody Object getStorelistByLocation(@RequestParam("location") String location,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<String> locationsList = null;	Map<String, Object> storesList = null;;
		try{
			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
			if(location == null || location == "")
				location = locationsList.get(0);
			storesList = storeServiceObj.getStoresList(customerIdStr,emailIdStr,location,"-1","10");
			
		}catch(Exception e){
			e.printStackTrace();
			
		}
		
		return  storesList.get("storeDetailsList");
	}
	
	

	/**
	 * 
	 * @author chaithanya.V
	 * 
	 *This method is used display peoples count from remote camera *
	 **/
	@RequestMapping("/peoplemonitoring")
	public ModelAndView peoplemonitoring(HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("peoplemonitoring ");
			modelAndViewObj = new ModelAndView();
		
			modelAndViewObj.setViewName("monitoring/peoplemonitoringpage");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	/**
	 * 
	 * @author chaithanya.V
	 * 
	 *This method is used display peoples count from remote camera using iframe *
	 **/
	@RequestMapping("/peoplemonitoringurl")
	public ModelAndView peoplemonitoringurl(HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("peoplemonitoring ");
			modelAndViewObj = new ModelAndView();
		
			modelAndViewObj.setViewName("monitoring/peoplemonitoring");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
    /**
	  * @author Sahitya
	  * Verified By : 
	  * 
	  * @param Request, Response
	  * 
     * This method is used to send next GUI(user-experience) view page with locations, currencies & taxes as pre-populated list
     * 
     * @return ModelAndView object with list of currencies,taxes and locations list 
     */
	@RequestMapping("/newOutlet")
	public ModelAndView newOutlet(HttpServletRequest request,HttpServletResponse response) {
		// log.info("New Store View");
		String userIdStr = null;
		String	emailIdStr=null;
		List<String> locationsList = null;
		List<String> warehouselocationsList = null;
		List<String> restaurantList = null;
		
		try{
			String selectedLocation = ""; 
			userIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			locationsList = adminServiceObj.getLocationsList(userIdStr,emailIdStr,"Retail Outlet");
			
		//added by akhil
			restaurantList=adminServiceObj.getLocationsList(userIdStr,emailIdStr,"Restaurant");
			if(restaurantList !=null && restaurantList.size()>0)
				locationsList.addAll(restaurantList);
			
			
			warehouselocationsList = adminServiceObj.getWarehouseLocationsList("1",emailIdStr,true);
			
			@SuppressWarnings("unchecked")
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, userIdStr, emailIdStr,"-1","","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			
			modelAndViewObj = new ModelAndView();
			if(locationsList==null || locationsList.size()==0){
				modelAndViewObj.addObject("err", AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			}else{
				modelAndViewObj.addObject("locationsList", locationsList);
				modelAndViewObj.addObject("warehouselocationsList", warehouselocationsList);
//				if("".equals(location))
					selectedLocation = locationsList.get(0);
				/*else 
					selectedLocation = location;*/
				/*Map<String, Object> responseMapObj = storeServiceObj.getStoresList(userIdStr,emailIdStr,selectedLocation);
				if(responseMapObj.size()>0){
					String resultStr = responseMapObj.get("result");
					if(resultStr.contains(Constants.SUCCESS)){
						@SuppressWarnings("unchecked")
						List<OutletInfo> storesList = (List<OutletInfo>) responseMapObj.get("storeDetailsList");
						modelAndViewObj.addObject("outletDetails",storesList.get(0));
					}
				}*/
			}
			modelAndViewObj.addObject("selectedLocation",selectedLocation);
			modelAndViewObj.addObject("outletDetails",new OutletInfo());
//			modelAndViewObj.addObject("type",type);
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/newoutlet");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allstoredetails");
		}
		return modelAndViewObj;
	}
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param outletDetails, taxes in the form of array of JSON objects, Request, Response
	 * 
    * This method is used to accept all values related to outlet from GUI(user-experience) and sent to webservice via store service
    * 
    * @return ModelAndView 
    */
	@RequestMapping(value="/createOutlet",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createOutlet(@RequestBody OutletInfo outletInfoObj,HttpServletRequest request,HttpServletResponse response) {
		String userIdStr = null,emailIdStr=null,resultStr=null;
		Map<String,Object> responseMapObj = null;
		List<String> locationsList = null;
		List<String> restaurantList = null;
		try{
			
			// log.info("Creating New Outlet");
			userIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			String roleStr = (String)request.getSession().getAttribute("role");
			modelAndViewObj = new ModelAndView();
			String location = "",storeCode = "";
			if(!"".equals(outletInfoObj.getStoreCode())){
				resultStr = storeServiceObj.updateOutlet(userIdStr,emailIdStr,roleStr,outletInfoObj);
				location = outletInfoObj.getLocation();
				storeCode = outletInfoObj.getStoreCode();
			}
			else{
				responseMapObj = storeServiceObj.createOutlet(userIdStr,emailIdStr,roleStr,outletInfoObj);
				resultStr = (String)responseMapObj.get("result");
				location = (String)responseMapObj.get("selectedLocation");
				storeCode = (String)responseMapObj.get("storeCode");
			}
			locationsList = adminServiceObj.getLocationsList(userIdStr,emailIdStr,"Retail Outlet");
			
			restaurantList=adminServiceObj.getLocationsList(userIdStr,emailIdStr,"Restaurant");
			
			if(restaurantList!= null && restaurantList.size()>0)
				locationsList.addAll(restaurantList);
			
			if(resultStr.contains(Constants.SUCCESS)){
				modelAndViewObj.addObject("location",location);
				modelAndViewObj.addObject("success",resultStr);
				modelAndViewObj.addObject("locationsList", locationsList);
				modelAndViewObj.addObject("storeCode",storeCode);
				modelAndViewObj.setViewName("Inventory Manager/Grocery Configuration/outletconfiguration");
			}
			else{
				modelAndViewObj.addObject("locationsList", locationsList);
				modelAndViewObj.addObject("storeCode",storeCode);
				modelAndViewObj.addObject("err",resultStr);
				modelAndViewObj.addObject("outletDetails",outletInfoObj);
				modelAndViewObj.addObject("selectedLocation",outletInfoObj.getLocationId());
				modelAndViewObj.setViewName("Inventory Manager/retailoutlets/newoutlet");
			}
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("storeCode",responseMapObj.get("storeCode"));
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allstoredetails");
		}
		
		return modelAndViewObj;
	}
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param outletDetails, taxes in the form of array of JSON objects, Request, Response
	 * 
    * This method is used to accept all updated values related to outlet from GUI(user-experience) and sent to webservice via store service
    * 
    * @return ModelAndView 
    *//*
	@RequestMapping(value="/updateOutlet",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView updateOutlet(@RequestBody OutletInfo outletInfoObj,HttpServletRequest request,HttpServletResponse response) {
		// log.info("updating outlet details");
	    String userIdStr = null,emailIdStr=null,resultStr="";
		try{
			userIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			String roleStr = (String)request.getSession().getAttribute("role");
			resultStr = storeServiceObj.updateOutlet(userIdStr,emailIdStr,roleStr,outletInfoObj);
			Map<String, Object> responseMapObj = storeServiceObj.getStoresList(userIdStr,emailIdStr,outletInfoObj.getLocationId(),"-1","10");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("type", outletInfoObj.getType());
			if(responseMapObj.size()>0){
				resultStr = (String)responseMapObj.get("result");
				if(resultStr.contains(Constants.SUCCESS)){
					modelAndViewObj.addObject("success",AppProperties.getAppMessageByProperty("STORE_UPDATE_SUCCESS"));
					modelAndViewObj.addObject("storeDetailsList",responseMapObj.get("storeDetailsList"));
					modelAndViewObj.setViewName("Inventory Manager/retailoutlets/editoutlet");
				}else{
					modelAndViewObj.addObject("err",responseMapObj.get("result"));
					modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allstoredetails");
				}
			}else{
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
				modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allstoredetails");
			}
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allstoredetails");
		}
		
		return modelAndViewObj;
	}
*/
	
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param outletDetails, taxes in the form of array of JSON objects, Request, Response
	 * 
    * This method is used to accept all updated values related to outlet from GUI(user-experience) and sent to webservice via store service
    * 
    * @return ModelAndView 
    */
	@RequestMapping(value="/updateOutlet",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView updateOutlet(@RequestBody OutletInfo outletInfoObj,HttpServletRequest request,HttpServletResponse response) {
		// log.info("updating outlet details");
	    String userIdStr = null,emailIdStr=null,resultStr="";
		try{
			//////////System.out.println("ddf");
			userIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			String roleStr = (String)request.getSession().getAttribute("role");
			resultStr = storeServiceObj.updateOutlet(userIdStr,emailIdStr,roleStr,outletInfoObj);
			Map<String, Object> responseMapObj = storeServiceObj.getStoresList(userIdStr,emailIdStr,outletInfoObj.getLocationId(),"-1","10");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("type", outletInfoObj.getType());
			if(responseMapObj.size()>0){
				resultStr = (String)responseMapObj.get("result");
				if(resultStr.contains(Constants.SUCCESS)){
					modelAndViewObj.addObject("success",AppProperties.getAppMessageByProperty("STORE_UPDATE_SUCCESS"));
					modelAndViewObj.addObject("storeDetailsList",responseMapObj.get("storeDetailsList"));
					modelAndViewObj.setViewName("Inventory Manager/retailoutlets/editoutlet");
				}else{
					modelAndViewObj.addObject("err",responseMapObj.get("result"));
					modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allstoredetails");
				}
			}else{
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
				modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allstoredetails");
			}
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allstoredetails");
		}
		
		return modelAndViewObj;
	}

	
	
	/**
	 * @author Sahitya
	 * Verified By : 
	 * 
	 * @param Request, Response
	 * 
    * This method is used to receive outlet related response data from session then set to edit GUI(user-experience) view page
    */
	@RequestMapping("/editOutlet")
	public ModelAndView editOutlet(@RequestParam("location") String location,HttpServletRequest request,HttpServletResponse response) {
		String userIdStr,emailIdStr;
		try{
			// log.info("Edit Specific Outlet View");
			userIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			Map<String, Object> responseMapObj = storeServiceObj.getStoresList(userIdStr,emailIdStr,location,"-1","10");
			List<String>warehouselocationsList = adminServiceObj.getWarehouseLocationsList("1",emailIdStr,true);
			modelAndViewObj = new ModelAndView();
			if(responseMapObj.size()>0){
				String resultStr = (String)responseMapObj.get("result");
				if(resultStr.contains(Constants.SUCCESS)){
					modelAndViewObj.addObject("warehouselocationsList",warehouselocationsList);
					modelAndViewObj.addObject("storeDetailsList",responseMapObj.get("storeDetailsList"));
					modelAndViewObj.setViewName("Inventory Manager/retailoutlets/editoutlet");
				}else{
					modelAndViewObj.addObject("err",responseMapObj.get("result"));
					modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allstoredetails");
				}
			}else{
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
				modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allstoredetails");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return modelAndViewObj;
	}
	
	/**
	 * @author Sahitya
	 * Verified By : 
	 * 
	 * @param location, Request, Response
	 * 
    * This method is used to receive outlet related response data from webservices via store service, then send to GUI(user-experience)
    * 
    * @return ModelAndView object with list of outlet details & tax details
    */
	@RequestMapping("/viewOutlet")
	public ModelAndView viewOutlet(@RequestParam("location") String location,HttpServletRequest request,HttpServletResponse response) {
		Map<String, Object> responseMapObj = null;
		String resultStr = null,emailIdStr=null,userIdStr=null;
		try{
			// log.info("View Specific Outlet Details");
			modelAndViewObj = new ModelAndView();
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			userIdStr = (String)request.getSession().getAttribute("customerId");
			responseMapObj = storeServiceObj.getStoresList(userIdStr,emailIdStr,location,"-1","10");
			List<String> warehouselocationsList = adminServiceObj.getWarehouseLocationsList(userIdStr,emailIdStr,true);
			
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				zoneList = genericMasterServiceObj.getZones(null, userIdStr, emailIdStr,"0","","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			
			if(responseMapObj.size()>0){
				resultStr = (String)responseMapObj.get("result");
				if(resultStr.contains(Constants.SUCCESS)){
					modelAndViewObj.addObject("warehouselocationsList", warehouselocationsList);
					modelAndViewObj.addObject("storeDetailsList",responseMapObj.get("storeDetailsList"));
					modelAndViewObj.setViewName("Inventory Manager/retailoutlets/viewoutlet");
				}else{
					modelAndViewObj.addObject("err",responseMapObj.get("result"));
					modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allstoredetails");
				}
			}else{
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
				modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allstoredetails");
			}
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allstoredetails");
		}
		
		return modelAndViewObj;
	}
	
	
	
	/**
	 * @author Sahitya
	 * Verified By : 
	 * 
	 * @param location,layoutName,layoutDesc,tablesList(which contains array of json object's of Dine table info),Request,Response
	 * 
     * This method is used to receive layout information which contains table,chairs & level information
     *  from GUI(user-experience) then send to webservices via store service class
     *  
     *  @return ModelAndView
     */
	@RequestMapping("/createLayout")
	public ModelAndView createLayout(@RequestParam("location") String locationStr,@RequestParam("layoutName") String layoutNameStr,@RequestParam("layoutDesc") String layoutDescStr,@RequestParam("tablesList") String tablesListStr,HttpServletRequest request,HttpServletResponse response) {
		Map<String,Object> storesList = null;
		String str_location="",customerIdStr=null,emailIdStr=null,resultStr=null;
		try{
			// log.info("Create New Layout Details");
			modelAndViewObj = new ModelAndView();
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			resultStr = storeServiceObj.createLayout(customerIdStr,emailIdStr,locationStr,layoutNameStr,layoutDescStr,tablesListStr);
			if(resultStr.equalsIgnoreCase(Constants.SUCCESS)){
				storesList = storeServiceObj.getStoresList(customerIdStr,emailIdStr,str_location,"-1","10");
				if(storesList.size()>0 && storesList.get("result")!=null){
					resultStr = (String)storesList.get("result");
					if(resultStr.contains(Constants.SUCCESS)){
						modelAndViewObj.addObject("storeDetailsList",storesList.get("storeDetailsList"));
						request.getSession().setAttribute("storeDetailsList",storesList.get("storeDetailsList"));
					}else{
						modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
					}
				}else{
					modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
				}
             }else{
            	 modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
             }
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allstoredetails");
			}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allstoredetails");
		}
		
		return modelAndViewObj;
	}
	
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param location,layoutName,layoutDesc,tablesList(which contains array of json object's of Dine table info),Request,Response
	 * 
     * This method is used to accept all updated values related to layout which contains table,chairs & level information
     *  from GUI(user-experience) and sent to webservice via store service
     *  
     *  @return ModelAndView
     */
	@RequestMapping("/updateLayout")
	public ModelAndView updateLayout(@RequestParam("location") String str_location,@RequestParam("layoutName") String layoutNameStr,@RequestParam("layoutDesc") String layoutDescStr,@RequestParam("tablesList") String tablesListStr,HttpServletRequest request,HttpServletResponse response) {
		
		Map<String,Object> storesList = null;
		String locationStr="",customerIdStr="",emailIdStr="",resultStr="";
		try{
			// log.info("update Layout Details");
			modelAndViewObj = new ModelAndView();
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
		    resultStr = storeServiceObj.updateLayout(customerIdStr,emailIdStr,str_location,layoutNameStr,layoutDescStr,tablesListStr);
			if(resultStr.equalsIgnoreCase(Constants.SUCCESS)){
				storesList = storeServiceObj.getStoresList(customerIdStr,emailIdStr,locationStr,"-1","10");
				if(storesList.size()>0 && storesList.get("result")!=null){
					resultStr = (String)storesList.get("result");
					if(resultStr.contains(Constants.SUCCESS)){
						modelAndViewObj.addObject("storeDetailsList",storesList.get("storeDetailsList"));
					}else{
						modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
					}
				}else{
					modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
				}
				modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allstoredetails");

			}else{
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
				modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allstoredetails");
			}
			}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allstoredetails");
		}
		
		return modelAndViewObj;
	}
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param Request,Response
	 * 
     * This method is used to receive all outlet details response from webservices via store service class,then send to GUI(user-experience)
     * 
     * @return ModelAndView object with list of all outlet details
     * updation:added maxrecords as param by manaasa
     */
	@RequestMapping("/configurations")
	public ModelAndView configurations(@RequestParam("index")String index,
			@RequestParam("maxRecords") String maxRecords,@RequestParam("searchStores") String searchStores ,HttpServletRequest request,HttpServletResponse response) {
		// log.info("configurations");
		String locationStr="",customerIdStr=null,emailIdStr=null,resultStr=null;
		Map<String, Object> storesList=null;
		try{
			int start = 1,end = Integer.parseInt(maxRecords);//modified by manasa
			modelAndViewObj = new ModelAndView();
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			storesList = storeServiceObj.getStoresList(customerIdStr,emailIdStr,searchStores,index,maxRecords);
			if(storesList.size()>0 && storesList.get("result")!=null){
				resultStr = (String)storesList.get("result");
				if(resultStr.contains(Constants.SUCCESS)){
					@SuppressWarnings("unchecked")
					List<OutletInfo> storesDetailsList = (List<OutletInfo>) storesList.get("storeDetailsList");
					
					if(storesDetailsList == null){
						modelAndViewObj.addObject("totalRecords","0");
						modelAndViewObj.addObject("index", "0");
						modelAndViewObj.addObject("totalValue", "0");
					}else{
						if(storesDetailsList.size()<Integer.parseInt(maxRecords)){
							end = (storesDetailsList.size())+(Integer.parseInt(index));
						}else{
							end = (Integer.parseInt(index)+end);
						}
						modelAndViewObj.addObject("totalRecords", Integer.parseInt(storesDetailsList.get(0).getTotalRecords()));
						modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
						modelAndViewObj.addObject("totalValue", end);
					}
					modelAndViewObj.addObject("storeDetailsList",storesDetailsList);
				}else{
					modelAndViewObj.addObject("err",resultStr);
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
					modelAndViewObj.addObject("storeDetailsList","");
				}
			}else{
				modelAndViewObj.addObject("err",storesList.get("result"));
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
				modelAndViewObj.addObject("storeDetailsList","");
			}
			 modelAndViewObj.addObject("searchStores",searchStores);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));//added by manasa
		  modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allstoredetails");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}


	
	
	/**
	 * @author Sambaiah.Y
	 * Verified By :
	 * 
	 * @param outletid,level,Request,Response
	 *  
     * This method is used to receive layout related response data which contains layout name, layout desc & dine table information
     *  via store service,then send to GUI(user-experience)
     *  
     *  @return ModelAndView object with list of tables info and layout info
     */
	@RequestMapping("/viewLayout")
	public ModelAndView viewLayout(@RequestParam("storeCode") String storeCode,@RequestParam("level") String level,HttpServletRequest request,HttpServletResponse response) {
		Map<String, Object> layoutMapObj = null;
		String customerIdStr=null,emailIdStr=null,resultStr=null;
		try{
			// log.info("View Layout");
			modelAndViewObj = new ModelAndView();
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			layoutMapObj = storeServiceObj.getLayout(customerIdStr,emailIdStr,storeCode,level);
			if(layoutMapObj.size()>0){
				resultStr = (String)layoutMapObj.get("result");
				if(resultStr.equals(Constants.SUCCESS)){
					modelAndViewObj.addObject("tablesList",layoutMapObj.get("tablesList"));
					request.getSession().setAttribute("tablesList", layoutMapObj.get("tablesList"));
					modelAndViewObj.addObject("layoutDetails",layoutMapObj.get("layoutDetails"));
					request.getSession().setAttribute("layoutDetails", layoutMapObj.get("layoutDetails"));
					modelAndViewObj.setViewName("Inventory Manager/retailoutlets/viewstoragesystem");
				}else{
					modelAndViewObj.addObject("err",resultStr);
					int start = 1,end = 10;
					Map<String, Object> storesList = storeServiceObj.getStoresList(customerIdStr,emailIdStr,"","0","10");
					if(storesList.size()>0 && storesList.get("result")!=null){
						resultStr = (String)storesList.get("result");
						if(resultStr.contains(Constants.SUCCESS)){
							@SuppressWarnings("unchecked")
							List<OutletInfo> storesDetailsList = (List<OutletInfo>) storesList.get("storeDetailsList");
							if(storesDetailsList == null){
								modelAndViewObj.addObject("totalRecords","0");
								modelAndViewObj.addObject("index", "0");
								modelAndViewObj.addObject("totalValue", "0");
							}else{
								if(storesDetailsList.size()<10)
									end = storesDetailsList.size();
								modelAndViewObj.addObject("totalRecords", Integer.parseInt(storesDetailsList.get(0).getTotalRecords()));
								modelAndViewObj.addObject("index", start);
								modelAndViewObj.addObject("totalValue", end);
							}
							modelAndViewObj.addObject("storeDetailsList",storesDetailsList);
						}else{
							modelAndViewObj.addObject("err",resultStr);
							modelAndViewObj.addObject("totalRecords","0");
							modelAndViewObj.addObject("index", "0");
							modelAndViewObj.addObject("totalValue", "0");
							modelAndViewObj.addObject("storeDetailsList","");
						}
					}else{
						modelAndViewObj.addObject("err",storesList.get("result"));
						modelAndViewObj.addObject("totalRecords","0");
						modelAndViewObj.addObject("index", "0");
						modelAndViewObj.addObject("totalValue", "0");
						modelAndViewObj.addObject("storeDetailsList","");
					}
					modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allstoredetails");
				}
			}else{
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
				modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allstoredetails");
			}
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allstoredetails");
		}
		return modelAndViewObj;
	}
	
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param Request,Response
	 * 
     * This method is used to receive layout related response data from session then set to edit GUI(user-experience) view page
     * 
     * @return ModelAndView
     */
	@RequestMapping("/editLayout")
	public ModelAndView editLayout(HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("Edit Layout");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("tablesList",request.getSession().getAttribute("tablesList"));
			modelAndViewObj.addObject("layoutDetails",request.getSession().getAttribute("layoutDetails"));
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/editstoragesystem");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allstoredetails");
		}
		return modelAndViewObj;
	}
	
	
	@RequestMapping("/searchProducts")
	public @ResponseBody List<ProductsList> searchProducts(@RequestParam("searchName") String searchNameStr,@RequestParam("storeLocation")String storeLocation, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null,b2crequired=null;
		List<ProductsList> productsList = new ArrayList<ProductsList>();
		try{
			// log.info("searchProducts");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			b2crequired = (String)request.getSession().getAttribute("b2cRequired");
			productsList = skuServiceObj.searchProducts(customerIdStr, emailIdStr,searchNameStr,storeLocation,"","",false,"",b2crequired,false);
			// log.info("Result:::"+productsList);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return productsList;
	}
	
	
	@RequestMapping("/BomSearchProducts")
	public @ResponseBody List<ProductsList> BomSearchProducts(@RequestParam("searchName") String searchNameStr,@RequestParam("storeLocation")String storeLocation,@RequestParam("bomsearchSkusFlag") boolean bomsearchSkusFlag, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null,b2crequired=null;
		List<ProductsList> productsList = new ArrayList<ProductsList>();
		try{
			// log.info("searchProducts");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			b2crequired = (String)request.getSession().getAttribute("b2cRequired");
			productsList = skuServiceObj.searchProducts(customerIdStr, emailIdStr,searchNameStr,storeLocation,"","",false,"",b2crequired,bomsearchSkusFlag);
			// log.info("Result:::"+productsList);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return productsList;
	}
	
	
	
	@RequestMapping("/IssuesearchProducts")
	public @ResponseBody List<ProductsList> IssuesearchProducts(@RequestParam("searchName") String searchNameStr,@RequestParam("storeLocation")String storeLocation,@RequestParam("Category")String Category,@RequestParam("subCategory")String subCategory, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<ProductsList> productsList = new ArrayList<ProductsList>();
		try{
			// log.info("searchProducts");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			productsList = skuServiceObj.searchProducts(customerIdStr, emailIdStr,searchNameStr,storeLocation,Category,"",false,subCategory,"",false);
			// log.info("Result:::"+productsList);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return productsList;
	}
	
	
	
	@RequestMapping("/GRNsearchProducts")
	public @ResponseBody List<ProductsList> GRNsearchProducts(@RequestParam("searchName") String searchNameStr,@RequestParam("storeLocation")String storeLocation,@RequestParam("Category")String Category,@RequestParam("subCategory")String subCategory, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<ProductsList> productsList = new ArrayList<ProductsList>();
		try{
			// log.info("searchProducts");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			productsList = skuServiceObj.searchProducts(customerIdStr, emailIdStr,searchNameStr,storeLocation,Category,"",false,subCategory,"",false);
			// log.info("Result:::"+productsList);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return productsList;
	}
	
	
	
	@RequestMapping("/searchProductsWarehouse")
	public @ResponseBody List<ProductsList> searchProductsWarehouse(@RequestParam("searchName") String searchNameStr,@RequestParam("storeLocation")String storeLocation, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<ProductsList> productsList = new ArrayList<ProductsList>();
		try{
			// log.info("searchProducts");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			productsList = skuServiceObj.searchProductsWarehouse(customerIdStr, emailIdStr,searchNameStr,storeLocation,"","",false);
			// log.info("Result:::"+productsList);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return productsList;
	}
	
	@RequestMapping("/searchBOMMaster")
	public @ResponseBody List<BillOfMaterial> searchBOMMaster(@RequestParam("searchName") String searchNameStr,@RequestParam("searchCategory")String searchCategory,@RequestParam("supplier")String supplier , @RequestParam("location")String location ,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<BillOfMaterial> productsList = new ArrayList<BillOfMaterial>();
		BillOfMaterialResponse billOfMaterialResponse = null;
		 WareHouseSkuResponse wareHouseSkuResponse=null;
		try{
			// log.info("searchProducts");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			billOfMaterialResponse  = outletMasterServiceObj.getBoms(searchNameStr,customerIdStr, emailIdStr,"0","","100",location);
			if(billOfMaterialResponse.getBomList() != null || billOfMaterialResponse.getBomList().size() != 0){
		   if(billOfMaterialResponse.getBomList().size() == 1){
			wareHouseSkuResponse = skuServiceObj.getWarehousemasterSKUDetails(billOfMaterialResponse.getBomList().get(0).getProductId(),customerIdStr, emailIdStr,"");
			////System.out.println(gson.toJson(wareHouseSkuResponse));
			//////System.out.println(gson.toJson(wareHouseSkuResponse.getWarehouseskumaster()));
			//////System.out.println(gson.toJson(wareHouseSkuResponse.getWarehouseskumaster().getWarehouseSkuPriceLists().get(0).getStoreLocation()));
			
			for(int i=0;i<wareHouseSkuResponse.getWarehouseskumaster().getWarehouseSkuPriceLists().size();i++){
			if(location == wareHouseSkuResponse.getWarehouseskumaster().getWarehouseSkuPriceLists().get(i).getStoreLocation() || location.equalsIgnoreCase(wareHouseSkuResponse.getWarehouseskumaster().getWarehouseSkuPriceLists().get(i).getStoreLocation())){
				 billOfMaterialResponse.getBomList().get(0).setPackSkuIDQty(wareHouseSkuResponse.getWarehouseskumaster().getWarehouseSkuPriceLists().get(0).getQuantityInHand());
				 ////System.out.println(gson.toJson(wareHouseSkuResponse.getWarehouseskumaster().getWarehouseSkuPriceLists().get(i).getQuantityInHand()));
			}
			}
		   }
			}
			//////System.out.println(gson.toJson(billOfMaterialResponse.getBomList()));
			
			// log.info("Result:::"+productsList);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return billOfMaterialResponse.getBomList();
	}
	
	
	@RequestMapping("/posearchProducts")
	public @ResponseBody List<ProductsList> posearchProducts(@RequestParam("searchName") String searchNameStr,@RequestParam("storeLocation")String storeLocation,@RequestParam("supplier")String supplier,@RequestParam("supplierflag")boolean supplierFlag,@RequestParam("Category")String Category,@RequestParam("subCategory")String subCategory, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<ProductsList> productsList = new ArrayList<ProductsList>();
		try{
			// log.info("searchProducts");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			productsList = skuServiceObj.searchProducts(customerIdStr, emailIdStr,searchNameStr,storeLocation,Category,supplier,supplierFlag,subCategory,"",false);
			// log.info("Result:::"+productsList);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return productsList;
	}
	
	@RequestMapping("/searchSupplierWiseProducts")
	public @ResponseBody List<ProductsList> searchSupplierWiseProducts(@RequestParam("searchName") String searchNameStr,@RequestParam("storeLocation")String storeLocation, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<ProductsList> productsList = new ArrayList<ProductsList>();
		try{
			// log.info("searchProducts");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			productsList = skuServiceObj.searchSupplierWiseProducts(customerIdStr, emailIdStr,searchNameStr,storeLocation,"");
			// log.info("Result:::"+productsList);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return productsList;
	}
	

	
	
	@RequestMapping("/searchProductsForAllLocations")
	public @ResponseBody List<ProductsList> searchProductsForAllLocations(@RequestParam("searchName") String searchNameStr/*,@RequestParam("storeLocation")String storeLocation*/,@RequestParam("selectedLocationsList")String selectedLocationsList, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<ProductsList> productsList = new ArrayList<ProductsList>();
		try{
			// log.info("searchProducts");
//			////////System.out.println("searchProducts");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			productsList = skuServiceObj.searchProductsForAllLocations(customerIdStr, emailIdStr,searchNameStr,"","",selectedLocationsList);
			// log.info("Result:::"+productsList);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return productsList;
	}
	
	
	@RequestMapping("/searchProductsForMenu")
	public @ResponseBody List<ProductsList> searchProductsForMenu(@RequestParam("searchName") String searchNameStr,@RequestParam("storeLocation")String storeLocation,@RequestParam("selectedLocationsList")String selectedLocationsList, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<ProductsList> productsList = new ArrayList<ProductsList>();
		try{
			// log.info("searchProducts");
//			////////System.out.println("searchProducts");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			productsList = skuServiceObj.searchProductsForAllLocations(customerIdStr, emailIdStr,searchNameStr,storeLocation,"",selectedLocationsList);
			// log.info("Result:::"+productsList);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return productsList;
	}
	
	
	@RequestMapping("/searchProductsForCategory")
	public @ResponseBody List<ProductsList> searchProductsForCategory(@RequestParam("searchName") String searchNameStr,@RequestParam("categoryName")String categoryName,@RequestParam("location") String location, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<ProductsList> productsList = new ArrayList<ProductsList>();
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			productsList = skuServiceObj.searchProducts(customerIdStr, emailIdStr,searchNameStr,location,categoryName,"",false,"","",false);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return productsList;
	}
	
	
	@RequestMapping("/getSkuDetails")
	public @ResponseBody String getSkuDetails(@RequestParam("skuId") String skuIdStr,@RequestParam("storeLocation")String storeLocation,@RequestParam("WarehouseReturnflag")String WarehouseReturnflag,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null,responseStr = null,b2crequired = null;
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			b2crequired = (String)request.getSession().getAttribute("b2cRequired");
			
			responseStr = skuServiceObj.getSkuDetails(customerIdStr, emailIdStr,skuIdStr,storeLocation,WarehouseReturnflag,b2crequired);
		}catch(Exception e){
			e.printStackTrace();
		}
		return responseStr;
	}
	
	
	@RequestMapping("/getSkuDetailsForEvents")
	public @ResponseBody String getSkuDetailsForEvents(@RequestParam("skuId") String skuIdStr,@RequestParam("storeLocation")String storeLocation,@RequestParam("mrp")String mrp,@RequestParam("plucode")String plucode,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null,responseStr = null;
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			
			responseStr = skuServiceObj.getSkuDetailsForEvents(customerIdStr, emailIdStr,plucode,storeLocation);
		}catch(Exception e){
			e.printStackTrace();
		}
		return responseStr;
	}
	
	
	@RequestMapping("/getSkuDetailsForOffeers")
	public @ResponseBody String getSkuDetailsForOffeers(@RequestParam("skuId") String skuIdStr,@RequestParam("storeLocation")String storeLocation,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null,responseStr = null;
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			responseStr = skuServiceObj.getSkuDetailsForOffeers(customerIdStr,emailIdStr,skuIdStr,storeLocation);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return responseStr;
	}
	
	@RequestMapping("/searchWarehouseProducts")
	public @ResponseBody List<ProductsList> searchWarehouseProducts(@RequestParam("searchName") String searchNameStr,@RequestParam("storeLocation")String storeLocation,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<ProductsList> productsList = new ArrayList<ProductsList>();
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			productsList = skuServiceObj.searchWarehouseProducts(customerIdStr, emailIdStr,searchNameStr,storeLocation,"","",false,"",false);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return productsList;
	}
	
	@RequestMapping("/BomSearchWarehouseProducts")
	public @ResponseBody List<ProductsList> BomSearchWarehouseProducts(@RequestParam("searchName") String searchNameStr,@RequestParam("storeLocation")String storeLocation,@RequestParam("bomsearchSkusFlag") boolean bomsearchSkusFlag,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<ProductsList> productsList = new ArrayList<ProductsList>();
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			productsList = skuServiceObj.searchWarehouseProducts(customerIdStr, emailIdStr,searchNameStr,storeLocation,"","",false,"",bomsearchSkusFlag);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return productsList;
	}
	
	@RequestMapping("/IssuesearchWarehouseProducts")
	public @ResponseBody List<ProductsList> IssuesearchWarehouseProducts(@RequestParam("searchName") String searchNameStr,@RequestParam("storeLocation")String storeLocation,@RequestParam("Category")String Category,@RequestParam("subCategory")String subCategory,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;

List<ProductsList> productsList = new ArrayList<ProductsList>();
		try{

customerIdStr = (String)request.getSession().getAttribute("customerId");

emailIdStr = (String)request.getSession().getAttribute("emailId");
			productsList = skuServiceObj.searchWarehouseProducts(customerIdStr, emailIdStr,searchNameStr,storeLocation,Category,"",false,subCategory,false);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return productsList;
	}
	
	
	@RequestMapping("/GRNsearchWarehouseProducts")
	public @ResponseBody List<ProductsList> GRNsearchWarehouseProducts(@RequestParam("searchName") String searchNameStr,@RequestParam("storeLocation")String storeLocation,@RequestParam("Category")String Category,@RequestParam("subCategory")String subCategory,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<ProductsList> productsList = new ArrayList<ProductsList>();
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			productsList = skuServiceObj.searchWarehouseProducts(customerIdStr, emailIdStr,searchNameStr,storeLocation,Category,"",false,subCategory,false);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return productsList;
	}
	
	
	@RequestMapping("/posearchWarehouseProducts")
	public @ResponseBody List<ProductsList> posearchWarehouseProducts(@RequestParam("searchName") String searchNameStr,@RequestParam("storeLocation")String storeLocation,@RequestParam("supplier")String supplier,@RequestParam("supplierflag")boolean supplierFlag,@RequestParam("Category")String Category,@RequestParam("subCategory")String subCategory, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<ProductsList> productsList = new ArrayList<ProductsList>();
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			productsList = skuServiceObj.searchWarehouseProducts(customerIdStr, emailIdStr,searchNameStr,storeLocation,Category,supplier,supplierFlag,subCategory,false);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return productsList;
	}
	
	@RequestMapping("/getWarehouseSkuDetails")
	public @ResponseBody String getWarehouseSkuDetails(@RequestParam("skuId") String skuIdStr,@RequestParam("storeLocation")String storeLocation,@RequestParam("WarehouseReturnflag")String WarehouseReturnflag,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null,responseStr = null;
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			responseStr = skuServiceObj.getWarehouseSkuDetails(customerIdStr, emailIdStr,skuIdStr,storeLocation,WarehouseReturnflag);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return responseStr;
	}
	
	
	

	@RequestMapping("/getWarehouseSkuDetailsforAutoAppend")
	public @ResponseBody String getWarehouseSkuDetailsforAutoAppend(@RequestParam("skuId") String skuIdStr,@RequestParam("storeLocation")String storeLocation,@RequestParam("supplier")String supplier,@RequestParam("supplierflag")boolean supplierFlag,@RequestParam("Category")String Category,@RequestParam("subCategory")String subCategory,@RequestParam("supplierName")String supplierName,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null,responseStr = null;
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			responseStr = skuServiceObj.getWarehouseSkuDetailsAutoAppend(customerIdStr, emailIdStr,skuIdStr,storeLocation,supplier,supplierFlag,Category,subCategory,supplierName);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return responseStr;
	}
	
	
	
	
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param Request,Response,operation
     *  
     * This method is used to send view page with outlet stock receipt details along with item details
	 *  
     *  @return ModelAndView with stock receipts details
     */
	@RequestMapping("/viewAllStockReceipts")
	public ModelAndView viewAllStockReceipts(@RequestParam("operation") String operationStr,@RequestParam("index") String index,@RequestParam("flowUnder") String flowUnder,@RequestParam("location") String location,@RequestParam("maxRecords") String maxRecords,@RequestParam("startDate") String startDate,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
//		List<String> locationsList = null;
		ArrayList<LocationBean> locationBeansList = null;
		List<StockReciept> stockReceiptDetailsList = null;
		List<String>locationsListValue =null;
		String locationListAll = "";
		try{
			locationsListValue= new ArrayList<String>();
			int start = 1,end = Integer.parseInt(maxRecords);
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			if(flowUnder.equals("outlet")){
				locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);	
				//locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
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
			}
				else
				{
//				locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
					locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","Warehouse",false,false,true);
//			Added by vijay, to make default loaction as location list first occurrence, if location is empty
			if((location.trim()).equals(null) || location.trim().isEmpty())
			{
				location = locationBeansList.get(0).getLocationId();
			}
			
				}
			
				modelAndViewObj = new ModelAndView();
				if(flowUnder.equals("outlet"))
				modelAndViewObj.addObject("locationsList", locationBeansList);
				else
				modelAndViewObj.addObject("locationsList", locationBeansList);
				stockReceiptDetailsList = stockReceiptServiceObj.getStockReceiptsByLocation("",customerIdStr,emailIdStr,location,operationStr,index,startDate,"",maxRecords,flowUnder,locationListAll);
			
				if(flowUnder.equals("outlet")){
					
				}else{
					double receivedQty = 0.0;
					double acceptedQty = 0.0;
					double returnQty = 0.0;

					
				for(int i = 0;i<stockReceiptDetailsList.size();i++){
					for(int j = 0;j<stockReceiptDetailsList.get(i).getReciptDetails().size();j++){
					
						if(stockReceiptDetailsList.get(i).getReciptDetails().get(j).getReceivedQty() != null){
						receivedQty = receivedQty+stockReceiptDetailsList.get(i).getReciptDetails().get(j).getReceivedQty().doubleValue();
						}
						if(stockReceiptDetailsList.get(i).getReciptDetails().get(j).getAcceptedQty() != null){

						acceptedQty = acceptedQty+stockReceiptDetailsList.get(i).getReciptDetails().get(j).getAcceptedQty().doubleValue();
						}
						if(stockReceiptDetailsList.get(i).getReciptDetails().get(j).getReturnQty() != null){

						returnQty = returnQty+stockReceiptDetailsList.get(i).getReciptDetails().get(j).getReturnQty().doubleValue();
						}
						}
					stockReceiptDetailsList.get(i).setRecieved((receivedQty));
					stockReceiptDetailsList.get(i).setAcceptedQty((acceptedQty));
					stockReceiptDetailsList.get(i).setSupplied((returnQty));
				}
				}

				
				
				if(stockReceiptDetailsList == null){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(stockReceiptDetailsList.size()<Integer.parseInt(maxRecords)){
						end = (stockReceiptDetailsList.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(stockReceiptDetailsList.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
				}
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.addObject("stockReceiptDetailsList",stockReceiptDetailsList);
				modelAndViewObj.addObject("operation",operationStr);
				modelAndViewObj.addObject("selectedLocation",location);
				modelAndViewObj.addObject("flowUnder", flowUnder);
				modelAndViewObj.addObject("startDate", startDate);

				modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allstockreceipts");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.addObject("startDate", startDate);
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allstockreceipts");
		}
		return modelAndViewObj;
		
	}
	
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param Request,Response,receipt_location,operation
     *  
     * This method is used to send view page with locations are pre-populated and stock receipt details 
	 *  
     *  @return ModelAndView 
     */
	@RequestMapping("/getStockReceiptsByLocation")
	public ModelAndView getStockReceiptsByLocation(@RequestParam("receipt_location") String receipt_location,@RequestParam("operation") String operationStr,@RequestParam("flowUnder") String flowUnder,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<StockReciept> stockReceiptDetailsList = null;
		List<String> locationsList = null;
		try{
			int start = 1,end = 10;
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			if(flowUnder.equals("outlet"))
				locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			else
				locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
			request.getSession().setAttribute("selectedLocation", receipt_location);
			stockReceiptDetailsList = stockReceiptServiceObj.getStockReceiptsByLocation("",customerIdStr,emailIdStr,receipt_location,operationStr,"0","","","10",flowUnder,"");
			modelAndViewObj = new ModelAndView();
			if(stockReceiptDetailsList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(stockReceiptDetailsList.size()<10){
					end = (stockReceiptDetailsList.size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(stockReceiptDetailsList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("stockReceiptDetailsList",stockReceiptDetailsList);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("operation",operationStr);
			modelAndViewObj.addObject("selectedLocation",receipt_location);
			modelAndViewObj.addObject("maxRecords", 10);
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allstockreceipts");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("flowUnder", flowUnder);
			stockReceiptDetailsList = new ArrayList<StockReciept>();
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allstockreceipts");
		}
		return modelAndViewObj;
	}
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param Request,Response
     *  
     * This method is used to send view page with locations are pre-populated
	 *  
     *  @return ModelAndView 
     */
	@RequestMapping("/newStockReceiptView")
	public ModelAndView newStockReceiptView(@RequestParam("outletlocation") String outletlocation,@RequestParam("flowUnder") String flowUnder,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<String> locationsList = null;
		ArrayList<LocationBean> locationBeansList = null;

		try{
			modelAndViewObj = new ModelAndView();
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			if(flowUnder.equals("outlet")){
				//locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);	

				locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
			}else{
			//	locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);

				locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,false);
			
			}
			List<String> allLocationsList =  adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr, false);
			if(locationsList==null || locationsList.size()==0){
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			}
			String location = (String)request.getSession().getAttribute("selectedLocation");
			if(location == null)
				location = locationsList.get(0);
			modelAndViewObj.addObject("selectedLocation",location);
			modelAndViewObj.addObject("locationsList", locationsList);
		//	modelAndViewObj.addObject("locationBeansList", locationBeansList);
			modelAndViewObj.addObject("allLocationsList", allLocationsList);
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/newstockreceipt");
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.addObject("outletlocation", outletlocation);
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allstockreceipts");
		}
		return modelAndViewObj;
	}
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param shippedfrom,shippedto,delivered by, inspected by , received by, shipped from & shipped to locations along with receipt item details
     *  
     * This method is used to receive receipt related response data which contains delivered by, inspected by , received by, shipped from & shipped to locations 
     *  along with receipt item details from GUI(user-experience) to webservice via Stock Receipt Service
	 *  
     *  @return ModelAndView 
     */
	@RequestMapping(value = "/createStockReceipt", method = RequestMethod.POST, consumes = "application/json")
	public ModelAndView createStockReceipt(@RequestBody StockReciept stockReceiptObj, HttpServletRequest request,
			HttpServletResponse response) {
		String customerIdStr=null,emailIdStr=null,responseStr=null;
		List<String> locationsList = null;
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			responseStr = stockReceiptServiceObj.createStockReciept(customerIdStr,emailIdStr,stockReceiptObj);
			modelAndViewObj = new ModelAndView();
			if(stockReceiptObj.getFlowUnder().equals("outlet"))
				locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
			else
				locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,false);
			if(locationsList.size()==0 || locationsList==null){
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			}
			else{
				String location = (String)request.getSession().getAttribute("selectedLocation");
				if(location == null)
					location = locationsList.get(0);
				modelAndViewObj.addObject("selectedLocation",location);
			}
			if(responseStr.equals(AppProperties.getAppMessageByProperty("STOCK_RECEIPT_CREATE_SUCCESS").trim()))
			{
				
				modelAndViewObj.addObject("success",responseStr);
			}
			else
			{

				
				modelAndViewObj.addObject("err",responseStr);
				modelAndViewObj.addObject("stockReceiptObj",stockReceiptObj);
				
			}
			List<String> allLocationsList =  adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr, false);
			modelAndViewObj.addObject("allLocationsList", allLocationsList);
		//	modelAndViewObj.addObject("err",responseStr);
			modelAndViewObj.addObject("locationsList",locationsList);
			modelAndViewObj.addObject("flowUnder", stockReceiptObj.getFlowUnder());
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/newstockreceipt");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("flowUnder", stockReceiptObj.getFlowUnder());
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/newstockreceipt");
		}
		
		
		return modelAndViewObj;
	}
	
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param Request,Response,good receipt ref number
     *  
     * This method is used to send view page with locations are pre-populated and stock receipt details along with item details
	 *  
     *  @return ModelAndView 
     */
	@RequestMapping("/viewStockReceipt")
	public ModelAndView viewStockReceipt(@RequestParam("goods_receipt_ref_num") String goods_receipt_ref_num,@RequestParam("flowUnder") String flowUnder,@RequestParam("operation") String operationStr,@RequestParam("formData") String formData,HttpServletRequest request,HttpServletResponse response){
		String customerIdStr=null,emailIdStr=null;
		StockReciept stockReceiptDetailsObj =null;
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			stockReceiptDetailsObj = stockReceiptServiceObj.getStockReceipt(customerIdStr, emailIdStr, goods_receipt_ref_num,flowUnder);
			if(flowUnder.equalsIgnoreCase("outlet")){
				
			}else{
			for(int i = 0;i<stockReceiptDetailsObj.getReciptDetails().size();i++){
				
				stockReceiptDetailsObj.getReciptDetails().get(i).setPrice(stockReceiptDetailsObj.getReciptDetails().get(i).getPrice());
				stockReceiptDetailsObj.getReciptDetails().get(i).setCost(stockReceiptDetailsObj.getReciptDetails().get(i).getCostPrice());
				stockReceiptDetailsObj.getReciptDetails().get(i).setRejected(stockReceiptDetailsObj.getReciptDetails().get(i).getRejQty());
				stockReceiptDetailsObj.getReciptDetails().get(i).setRecieved(stockReceiptDetailsObj.getReciptDetails().get(i).getReceivedQty());
				stockReceiptDetailsObj.getReciptDetails().get(i).setReqQty(stockReceiptDetailsObj.getReciptDetails().get(i).getReqQty());
				stockReceiptDetailsObj.getReciptDetails().get(i).setQuantity(stockReceiptDetailsObj.getReciptDetails().get(i).getReqQty());
				stockReceiptDetailsObj.getReciptDetails().get(i).setAcceptedQty(stockReceiptDetailsObj.getReciptDetails().get(i).getAcceptedQty());
				stockReceiptDetailsObj.getReciptDetails().get(i).setSupplied(stockReceiptDetailsObj.getReciptDetails().get(i).getReturnQty());

			
			}
			}
			
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.addObject("stockReceiptDetails",stockReceiptDetailsObj);
			
			//added by manasa
			RequestBean stockReceiptObj=gson.fromJson(formData, RequestBean.class);
			modelAndViewObj.addObject("stockReceiptObj",stockReceiptObj);
			
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/viewstockreceipt");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allstockreceipts");
		}
		
		return modelAndViewObj;
	}
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param Request,Response,good receipt ref number
	 *  
	 * This method is used to send view page with locations are pre-populated and stock receipt details along with item details
	 *  
	 *  @return ModelAndView 
	 */
	@RequestMapping("/editStockReceiptView")
	public ModelAndView editStockReceiptView(@RequestParam("goods_receipt_ref_num") String goods_receipt_ref_num,@RequestParam("flowUnder") String flowUnder,@RequestParam("operation") String operationStr,@RequestParam("formData") String formData,HttpServletRequest request,HttpServletResponse response){
		String customerIdStr=null,emailIdStr=null;
		StockReciept stockReceiptDetailsObj =null;
		List<String> locationsList = null;
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			if(flowUnder.equals("outlet"))
				locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
			else
				locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,false);
			stockReceiptDetailsObj = stockReceiptServiceObj.getStockReceipt(customerIdStr, emailIdStr, goods_receipt_ref_num,flowUnder);
			
			
          
			
			 if(flowUnder.equalsIgnoreCase("outlet")){
				
			}else{
				
				
				
				
				
				
			for(int i = 0;i<stockReceiptDetailsObj.getReciptDetails().size();i++){
				
                   if(stockReceiptDetailsObj.getReciptDetails().get(i).getRejQty() == null){
					
   					
                	   BigDecimal b1= stockReceiptDetailsObj.getReciptDetails().get(i).getCostPrice();
                	  BigDecimal b2= stockReceiptDetailsObj.getReciptDetails().get(i).getAcceptedQty();
                	  Double d1=b1.doubleValue();
                	  Double d2=b2.doubleValue();
                	  
                	  Double d3=d1/d2;
                	  //conveted to bigdecimal
                	  BigDecimal pricevalue = new BigDecimal(d3);
                	  
					stockReceiptDetailsObj.getReciptDetails().get(i).setPrice(pricevalue);
					BigDecimal rejqty = new BigDecimal("0");
					stockReceiptDetailsObj.getReciptDetails().get(i).setRejQty(rejqty);
					stockReceiptDetailsObj.getReciptDetails().get(i).setQuantity(rejqty);
					stockReceiptDetailsObj.getReciptDetails().get(i).setReturnQty(stockReceiptDetailsObj.getReciptDetails().get(i).getReceivedQty());
				}
				
				
			/*	stockReceiptDetailsObj.getReciptDetails().get(i).setPrice(stockReceiptDetailsObj.getReciptDetails().get(i).getPrice());
				stockReceiptDetailsObj.getReciptDetails().get(i).setCost(stockReceiptDetailsObj.getReciptDetails().get(i).getCostPrice());
				stockReceiptDetailsObj.getReciptDetails().get(i).setRejected(stockReceiptDetailsObj.getReciptDetails().get(i).getRejQty());
				stockReceiptDetailsObj.getReciptDetails().get(i).setRecieved(stockReceiptDetailsObj.getReciptDetails().get(i).getReceivedQty());
				stockReceiptDetailsObj.getReciptDetails().get(i).setReqQty(stockReceiptDetailsObj.getReciptDetails().get(i).getReqQty());
				stockReceiptDetailsObj.getReciptDetails().get(i).setQuantity(stockReceiptDetailsObj.getReciptDetails().get(i).getReqQty());
				stockReceiptDetailsObj.getReciptDetails().get(i).setAcceptedQty(stockReceiptDetailsObj.getReciptDetails().get(i).getAcceptedQty());
				stockReceiptDetailsObj.getReciptDetails().get(i).setSupplied(stockReceiptDetailsObj.getReciptDetails().get(i).getReturnQty());
*/
			
			}
			}
			
			modelAndViewObj = new ModelAndView();
			List<String> previous = new ArrayList<String>();
			if(stockReceiptDetailsObj.getPreviousStates() != null){
			Iterator<String> Iter = stockReceiptDetailsObj.getPreviousStates().iterator();
			 while(Iter.hasNext())
		        {
		        String status = Iter.next();
		        if(previous.contains(status))
		        {
		            Iter.remove();
		        }else
		        {
		        	previous.add(status);
		        }
		        }
			 modelAndViewObj.addObject("previousList",previous);
			}
			if(locationsList==null || locationsList.size()==0){
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			}
			List<String> allLocationsList =  adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr, false);
			modelAndViewObj.addObject("allLocationsList", allLocationsList);
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.addObject("stockReceiptDetails",stockReceiptDetailsObj);
			modelAndViewObj.addObject("locationsList", locationsList);
			
			//added by manasa
			RequestBean stockReceiptObj=gson.fromJson(formData, RequestBean.class);
			modelAndViewObj.addObject("stockReceiptObj",stockReceiptObj);
			if(flowUnder.equalsIgnoreCase("outlet")){
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/editstockreceipt");
			}else{
				modelAndViewObj.setViewName("Inventory Manager/retailoutlets/editstockreceiptwh");	
			}
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allstockreceipts");
		}

		return modelAndViewObj;


	}
	
	

	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param shippedfrom,shippedto,delivered by, inspected by , received by, shipped from & shipped to locations along with receipt item details
     *  
     * This method is used to receive receipt related response data which contains delivered by, inspected by , received by, shipped from & shipped to locations 
     *  along with receipt item details from GUI(user-experience) to webservice via Stock Receipt Service
	 *  
     *  @return ModelAndView 
     *  @edited by VAsudeva reddy
     *  @edit corrected repeating work flow,location details not being displayed after updating
     *  
     */
	@RequestMapping(value = "/updateStockReceipt", method = RequestMethod.POST, consumes = "application/json")
	public ModelAndView updateStockReceipt(@RequestBody StockReciept stockReceiptObj, HttpServletRequest request,
			HttpServletResponse response) {
		String customerIdStr=null,emailIdStr=null,responseStr=null;
		List<String> locationsList = null;
		StockReciept stockReceiptDetailsObj = null;
		try{
			// log.info("Update Stock Receipt Details");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			responseStr = stockReceiptServiceObj.updateStockReciept(customerIdStr,emailIdStr,stockReceiptObj);
			modelAndViewObj = new ModelAndView();
			////////System.out.println("flow"+stockReceiptObj.getFlowUnder());
			stockReceiptDetailsObj = stockReceiptServiceObj.getStockReceipt(customerIdStr, emailIdStr, stockReceiptObj.getGoods_receipt_ref_num(),stockReceiptObj.getFlowUnder());
		
			 /* if(stockReceiptObj.getFlowUnder().equalsIgnoreCase("outlet")){
					
				}else{
				for(int i = 0;i<stockReceiptDetailsObj.getReciptDetails().size();i++){
					
					stockReceiptDetailsObj.getReciptDetails().get(i).setPrice(stockReceiptDetailsObj.getReciptDetails().get(i).getPrice());
					stockReceiptDetailsObj.getReciptDetails().get(i).setCost(stockReceiptDetailsObj.getReciptDetails().get(i).getCostPrice());
					stockReceiptDetailsObj.getReciptDetails().get(i).setRejected(stockReceiptDetailsObj.getReciptDetails().get(i).getRejQty());
					stockReceiptDetailsObj.getReciptDetails().get(i).setRecieved(stockReceiptDetailsObj.getReciptDetails().get(i).getReceivedQty());
					stockReceiptDetailsObj.getReciptDetails().get(i).setReqQty(stockReceiptDetailsObj.getReciptDetails().get(i).getReqQty());
					stockReceiptDetailsObj.getReciptDetails().get(i).setQuantity(stockReceiptDetailsObj.getReciptDetails().get(i).getReqQty());
					stockReceiptDetailsObj.getReciptDetails().get(i).setAcceptedQty(stockReceiptDetailsObj.getReciptDetails().get(i).getAcceptedQty());
					stockReceiptDetailsObj.getReciptDetails().get(i).setSupplied(stockReceiptDetailsObj.getReciptDetails().get(i).getReturnQty());

				
				}
				}*/
				
			
			
			List<String> previous = new ArrayList<String>();
			if(stockReceiptDetailsObj.getPreviousStates() != null){
			Iterator<String> Iter = stockReceiptDetailsObj.getPreviousStates().iterator();
			 while(Iter.hasNext())
		        {
		        String status = Iter.next();
		        if(previous.contains(status))
		        {
		            Iter.remove();
		        }else
		        {
		        	previous.add(status);
		        }
		        }
		      modelAndViewObj.addObject("previousList",previous);
			}
			modelAndViewObj.addObject("stockReceiptDetails",stockReceiptDetailsObj);
			if(!responseStr.equals(AppProperties.getAppMessageByProperty("STOCK_RECEIPT_UPDATE_SUCCESS").trim())){				
				modelAndViewObj.addObject("err", responseStr);
				
			}
			else{
				if(stockReceiptObj.getFlowUnder().equals("outlet")){
					locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
				}else{
					locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,false);
				}
				if(locationsList==null || locationsList.size()==0){
					modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
				}
				List<String> allLocationsList =  adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr, false);
				modelAndViewObj.addObject("allLocationsList", allLocationsList);
				modelAndViewObj.addObject("locationsList", locationsList);
				modelAndViewObj.addObject("success", responseStr);
			}
			
			//modelAndViewObj.setViewName("Inventory Manager/retailoutlets/editstockreceipt");
			
			if(stockReceiptObj.getFlowUnder().equalsIgnoreCase("outlet")){
				modelAndViewObj.setViewName("Inventory Manager/retailoutlets/editstockreceipt");
				}else{
					modelAndViewObj.setViewName("Inventory Manager/retailoutlets/editstockreceiptwh");	
				}
			modelAndViewObj.addObject("flowUnder", stockReceiptObj.getFlowUnder());
			//modelAndViewObj.addObject("stockReceiptObj", stockReceiptObj);
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("flowUnder", stockReceiptObj.getFlowUnder());
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allstockreceipts");
		}
		
		return modelAndViewObj;
	}



	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param Request,Response
     *  
     * This method is used to send view page with locations are pre-populated
	 *  
     *  @return ModelAndView 
     */
	@RequestMapping("/viewAllStockIssues")
	public ModelAndView viewAllStockIssues(@RequestParam("startdate") String startdate,@RequestParam("zone") String zone,@RequestParam("operation") String operationStr,@RequestParam("index") String index,@RequestParam("location") String location,@RequestParam("flowUnder") String flowUnder,@RequestParam("maxRecords") String maxRecords,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
//		List<String> locationsList = null;
		List<String> warehouselocationsList = null;
		List<StockIssues> stockIssueDetailsList = null;
		ArrayList<LocationBean> locationBeansList = null;
		List<String> locationsListValue =new ArrayList<String>();
		String locationListAll="";
		try{
		// log.info("View All Stock Issues");
		int start = 1,end = Integer.parseInt(maxRecords);
		customerIdStr = (String)request.getSession().getAttribute("customerId");
		emailIdStr  = (String)request.getSession().getAttribute("emailId");
		List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
		if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
			 zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,index,"","");
			request.getSession().setAttribute("zoneList", zoneList);
		}
		modelAndViewObj = new ModelAndView();
		if(flowUnder.equals("outlet")){
			//locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);	
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
			modelAndViewObj.addObject("locationsList", locationBeansList);
		}
			
		else{
			warehouselocationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
//			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
//			Added by vijay, to make default loaction as location list first occurrence, if location is empty
			
			modelAndViewObj.addObject("locationsList", locationBeansList);
		}
		
		
			
			modelAndViewObj.addObject("warehouselocationsList", warehouselocationsList);
			
			stockIssueDetailsList = stockIssueServiceObj.getStockIssuesByLocation("",customerIdStr,emailIdStr,location,operationStr,index,startdate,"",maxRecords,flowUnder,zone,"","",locationListAll);
			request.getSession().setAttribute("warehouseStockIssue",stockIssueDetailsList);
			if(stockIssueDetailsList == null){
//				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(stockIssueDetailsList.size()<Integer.parseInt(maxRecords)){
					end = (stockIssueDetailsList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(stockIssueDetailsList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("stockIssueDetailsList",stockIssueDetailsList);
			
			modelAndViewObj.addObject("selectedLocation",location);
//		}
			modelAndViewObj.addObject("zone", zone);
		modelAndViewObj.addObject("flowUnder", flowUnder);
		modelAndViewObj.addObject("operation",operationStr);
		modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allissuedstocks");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allissuedstocks");
		}
		modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
		return modelAndViewObj;
	}
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param Request,Response
     *  
     * This method is used to send view page with locations are pre-populated
	 *  
     *  @return ModelAndView 
     */
	@RequestMapping("/newStockIssueView")
	public ModelAndView newStockIssueView(@RequestParam("outletlocation") String outletlocation,@RequestParam("flowUnder") String flowUnder,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<String> locationsList = null;
		List<OutletSettings> outletsettingsList = null;
		try{
			// log.info("New Stock Issue View");
			modelAndViewObj = new ModelAndView();
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			if(flowUnder.equals("outlet"))
				locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
			else
				locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,false);
			List<String> allLocationsList =  adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr, false);
			
			outletsettingsList = adminServiceObj.getOutletSettingList(customerIdStr,emailIdStr,"");
			
			if(locationsList==null || locationsList.size()==0){
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			}else{
				String location = (String)request.getSession().getAttribute("selectedLocation");
				if(location == null)
					location = locationsList.get(0);
				modelAndViewObj.addObject("selectedLocation",location);
			}
			List<LocationBean> allLocationstatesList =  adminServiceObj.getOutletStates(customerIdStr, emailIdStr, false);
			List<LocationBean> warehouseStatesList =  adminServiceObj.getWarehousList(customerIdStr, emailIdStr, false);
			
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
			List<ProductSubCategoryBean> subCategoryDetailsList = outletMasterServiceObj.getSubCategoryDetails("",customerIdStr,emailIdStr,"-1",false);
			
			
			if(categoryList != null){
				modelAndViewObj.addObject("categoryListIssue", categoryList);
			}
			if(subCategoryDetailsList != null){
				modelAndViewObj.addObject("SubCategoryIssue", subCategoryDetailsList);
			}
			
			modelAndViewObj.addObject("allLocationstatesList", allLocationstatesList);
			modelAndViewObj.addObject("warehouseStatesList", warehouseStatesList);
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.addObject("outletLocation", outletlocation);
			modelAndViewObj.addObject("outletsettingsList", outletsettingsList);
			if(outletsettingsList != null && outletsettingsList.size()>0)
			modelAndViewObj.addObject("companyType", outletsettingsList.get(0).getCompanyOwned());
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("allLocationsList", allLocationsList);
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/newstockissue");
			
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allissuedstocks");
		}
		return modelAndViewObj;
	}
	
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param Request,Response
     *  
     * This method is used to send view page with locations are pre-populated
	 *  
     *  @return ModelAndView 
     */
	@RequestMapping("/newStockRequestView")
	public ModelAndView newStockRequestView(@RequestParam("flowUnder") String flowUnder,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<String> locationsList = null;
		List<String> outletlocations = null;
		try{
			// log.info("New Stock Issue View");
			modelAndViewObj = new ModelAndView();
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			if(flowUnder.equals("outlet")){
				locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,false);
				outletlocations = adminServiceObj.getOutletLocationsList(customerIdStr, emailIdStr, false);
			}
				
			else{
				locationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr, false);
				//outletlocations = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
				outletlocations = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr, false);
			}
				
			List<String> allLocationsList =  adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr, false);
			if(locationsList==null || locationsList.size()==0){
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			}else{
				String location = (String)request.getSession().getAttribute("selectedLocation");
				if(location == null)
					location = locationsList.get(0);
				modelAndViewObj.addObject("selectedLocation",location);
			}
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("outletlocations", outletlocations);
			modelAndViewObj.addObject("allLocationsList", allLocationsList);
			modelAndViewObj.setViewName("Inventory Manager/stockRequest/newstockrequest");
			
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allstockreceipts");
		}
		return modelAndViewObj;
	}
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param shippedfrom,shippedto,delivered by, inspected by , received by, shipped from & shipped to locations along with receipt item details
     *  
     * This method is used to receive receipt related response data which contains delivered by, inspected by , received by, shipped from & shipped to locations 
     *  along with receipt item details from GUI(user-experience) to webservice via Stock Issue Service
	 *  
     *  @return ModelAndView 
     */

	@RequestMapping(value="/createStockIssue",method=RequestMethod.POST)
	//@RequestMapping("/createStockIssue",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createStockIssue(@RequestParam("formData") String formData,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr=null,emailIdStr=null,responseStr=null;
		List<String> locationsList = null;
		List<OutletSettings> outletsettingsList = null;
		StockIssues stockissueobj=gson.fromJson(formData, StockIssues.class);

		try{
			// log.info("Create New Stock Issue Details");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			responseStr = stockIssueServiceObj.createStockIssue(customerIdStr,emailIdStr,stockissueobj);
			modelAndViewObj = new ModelAndView();
			if(stockissueobj.getFlowUnder().equals("outlet"))
				locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
			else
				locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,false);
			if(locationsList==null || locationsList.size()==0){
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			}
			else{
				String locationStr = (String)request.getSession().getAttribute("selectedLocation");
				if(locationStr == null)
					locationStr = locationsList.get(0);
				modelAndViewObj.addObject("selectedLocation",locationStr);
			}
			
			if(responseStr.equals(AppProperties.getAppMessageByProperty("STOCK_ISSUE_CREATE_SUCCESS").trim()))
			{
				modelAndViewObj.addObject("success",responseStr);
			}
			
			else
			{
				modelAndViewObj.addObject("err",responseStr);
				modelAndViewObj.addObject("stockissue",stockissueobj);
				
			}
			outletsettingsList = adminServiceObj.getOutletSettingList(customerIdStr,emailIdStr,"");
			modelAndViewObj.addObject("outletsettingsList", outletsettingsList);
			modelAndViewObj.addObject("flowUnder", stockissueobj.getFlowUnder());
			//modelAndViewObj.addObject("err",responseStr);
			//////////System.out.println(stockissueobj.getFlowUnder());
			List<String> allLocationsList =  adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr, false);
			List<LocationBean> allLocationstatesList =  adminServiceObj.getOutletStates(customerIdStr, emailIdStr, false);
			List<LocationBean> warehouseStatesList =  adminServiceObj.getWarehousList(customerIdStr, emailIdStr, false);
			modelAndViewObj.addObject("allLocationsList", allLocationsList);
			modelAndViewObj.addObject("allLocationstatesList", allLocationstatesList);
			modelAndViewObj.addObject("warehouseStatesList", warehouseStatesList);
			modelAndViewObj.addObject("outletLocation", stockissueobj.getShipped_from());
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/newstockissue");
		}catch(Exception e){
			e.printStackTrace();
		
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allissuedstocks");
		}
		
		
		return modelAndViewObj;
	}
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param Request,Response,receipt_location,operation
     *  
     * This method is used to send view page with locations are pre-populated and stock receipt details 
	 *  
     *  @return ModelAndView 
     */
	@RequestMapping("/getStockIssuessByLocation")
	public ModelAndView getStockIssuessByLocation(@RequestParam("fromlocation") String fromlocation,@RequestParam("operation") String operationStr,@RequestParam("flowUnder") String flowUnder,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<StockIssues> stockIssueDetailsList = null;
		List<String> locationsList = null;
		try{
			// log.info("View All Stock Issues By Location");
			int start = 1,end = 10;
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			if(flowUnder.equals("outlet"))
				locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			else
				locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
			stockIssueDetailsList = stockIssueServiceObj.getStockIssuesByLocation("",customerIdStr,emailIdStr,fromlocation,operationStr,"0","","","10",flowUnder,"","","","");
			modelAndViewObj = new ModelAndView();
			if(stockIssueDetailsList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(stockIssueDetailsList.size()<10){
					end = (stockIssueDetailsList.size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(stockIssueDetailsList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			request.getSession().setAttribute("selectedLocation", fromlocation);
			modelAndViewObj.addObject("stockIssueDetailsList",stockIssueDetailsList);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("operation",operationStr);
			modelAndViewObj.addObject("selectedLocation",fromlocation);
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allissuedstocks");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allissuedstocks");
		}
		modelAndViewObj.addObject("maxRecords", 10);
		return modelAndViewObj;
	}
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param Request,Response,good issue ref number
     *  
     * This method is used to send view page with locations are pre-populated and stock issue details along with item details
	 *  
     *  @return ModelAndView 
     */
	@RequestMapping("/viewStockIssue")
	public ModelAndView viewStockIssue(@RequestParam("goods_issue_ref_num") String goods_issue_ref_num,@RequestParam("flowUnder") String flowUnder,@RequestParam("operation") String operationStr,@RequestParam("formData") String formData,HttpServletRequest request,HttpServletResponse response){
		String customerIdStr=null,emailIdStr=null;
		StockIssueBean stockIssueDetailsObj =null;
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			stockIssueDetailsObj = stockIssueServiceObj.getStockIssue(customerIdStr, emailIdStr, goods_issue_ref_num,flowUnder);
			modelAndViewObj = new ModelAndView();
			//added by manasa
			RequestBean stockIssueObj=gson.fromJson(formData, RequestBean.class);
			modelAndViewObj.addObject("stockIssueObj",stockIssueObj);
			modelAndViewObj.addObject("operation",operationStr);
			
			if(flowUnder.equals("warehouse"))
				stockIssueDetailsObj.setRequestId(stockIssueDetailsObj.getGoods_Request_Ref());
			modelAndViewObj.addObject("stockIssueDetails",stockIssueDetailsObj);
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/viewstockissue");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allissuedstocks");
		}
		modelAndViewObj.addObject("flowUnder", flowUnder);
		return modelAndViewObj;
	}
	
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param Request,Response,good issue ref number
	 *  
	 * This method is used to send view page with locations are pre-populated and stock issue details along with item details
	 *  
	 *  @return ModelAndView 
	 */
	@RequestMapping("/editStockIssueView")
	public ModelAndView editStockIssueView(@RequestParam("goods_issue_ref_num") String goods_issue_ref_num,@RequestParam("flowUnder") String flowUnder,@RequestParam("operation") String operationStr,@RequestParam("formData") String formData,HttpServletRequest request,HttpServletResponse response){
		String customerIdStr=null,emailIdStr=null;
		StockIssueBean stockIssueDetailsObj =null;
		List<String> locationsList = null;
		WareHouseSkuResponse wareHouseSkuResponse=null;
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			if(flowUnder.equals("outlet"))
				locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
			else
				locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,false);
			stockIssueDetailsObj = stockIssueServiceObj.getStockIssue(customerIdStr, emailIdStr, goods_issue_ref_num,flowUnder);
			modelAndViewObj = new ModelAndView();
			if(locationsList==null || locationsList.size()==0){
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			}
			
			//added by manasa
			RequestBean stockIssueObj=gson.fromJson(formData, RequestBean.class);
			modelAndViewObj.addObject("stockIssueObj",stockIssueObj);
			modelAndViewObj.addObject("operation",operationStr);
			
			for(int i = 0;i<stockIssueDetailsObj.getItemDetails().size();i++){
			if(flowUnder.equals("warehouse")){
			wareHouseSkuResponse = skuServiceObj.getWarehousemasterSKUDetails(stockIssueDetailsObj.getItemDetails().get(i).getSkuId(),customerIdStr, emailIdStr,"");
			stockIssueDetailsObj.getItemDetails().get(i).setManufactured(wareHouseSkuResponse.getWarehouseskumaster().isManufacturedItem());
			
			}else{
	       List<Sku> skuList = skuServiceObj.getSKUDetails(stockIssueDetailsObj.getItemDetails().get(i).getSkuId(), customerIdStr, emailIdStr,"0","10","","","","","","","","","");
	       stockIssueDetailsObj.getItemDetails().get(i).setManufactured(skuList.get(0).isManufacturedItem());
			
			}
			}
			
			if(flowUnder.equals("warehouse"))
				stockIssueDetailsObj.setRequestId(stockIssueDetailsObj.getGoods_Request_Ref());
			modelAndViewObj.addObject("stockIssueDetails",stockIssueDetailsObj);
			
			List<String> allLocationsList =  adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr, false);
			modelAndViewObj.addObject("allLocationsList", allLocationsList);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/editstockissue");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allissuedstocks");
		}
		modelAndViewObj.addObject("flowUnder", flowUnder);
		return modelAndViewObj;


	}
	

	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param shippedfrom,shippedto,delivered by, inspected by , received by, shipped from & shipped to locations along with receipt item details
     *  
     * This method is used to receive receipt related response data which contains delivered by, inspected by , received by, shipped from & shipped to locations 
     *  along with receipt item details from GUI(user-experience) to webservice via Stock Issue Service
	 *  
     *  @return ModelAndView 
     */
	@RequestMapping(value="/updateStockIssue",method=RequestMethod.POST)
	public ModelAndView updateStockIssue(@RequestParam("formData") String formData,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr=null,emailIdStr=null,responseStr=null;
		List<String> locationsList = null;
		
		StockIssues stockissueobj=gson.fromJson(formData, StockIssues.class);
		String flowUnder = stockissueobj.getFlowUnder();
		try{
			// log.info("Update Stock Issue Details");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			if(stockissueobj.getSkuId()!=null && stockissueobj.getQty()!=null){
				List<String> skuid = stockissueobj.getSkuId();
				List<String> Qty = stockissueobj.getQty();
				List<String> issued = stockissueobj.getIssuedqty();
				if(request.getSession().getAttribute("warehouseStockIssue")!= null)
				{
					List<StockIssues>	srlist =(List<StockIssues>)request.getSession().getAttribute("warehouseStockIssue");
					for(int i=0;i<srlist.size();i++){
						if(srlist.get(i).getGoods_issue_ref_num().equalsIgnoreCase(stockissueobj.getGoods_issue_ref_num())){
							stockissueobj = srlist.get(i);
							stockissueobj.setFlowUnder(flowUnder);
							for(int j=0;j<stockissueobj.getReciptDetails().size();j++){
								for(int k=0;k<skuid.size();k++)
								if(stockissueobj.getReciptDetails().get(j).getSkuId().equalsIgnoreCase(skuid.get(k))){
									StockIssueDetails items = stockissueobj.getReciptDetails().get(j);
									items.setActualQty(Float.valueOf(Qty.get(k)));
									items.setQuantity(Float.valueOf(issued.get(k)));
									stockissueobj.getReciptDetails().set(j, items);
								}
									
									
							}
						}
					}
					
				}
				responseStr = stockIssueServiceObj.updateStockIssue(customerIdStr,emailIdStr,stockissueobj);

				if(!responseStr.equals(AppProperties.getAppMessageByProperty("STOCK_ISSUE_UPDATE_SUCCESS").trim())){
					if(stockissueobj.getFlowUnder().equals("outlet"))
						locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
					else
						locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,false);
					if(locationsList==null || locationsList.size()==0){
						modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
					}
					List<String> allLocationsList =  adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr, false);
					modelAndViewObj.addObject("allLocationsList", allLocationsList);
					modelAndViewObj.addObject("locationsList", locationsList);
				}
			}
			else{
				responseStr = stockIssueServiceObj.updateStockIssue(customerIdStr,emailIdStr,stockissueobj);

				if(!responseStr.equals(AppProperties.getAppMessageByProperty("STOCK_ISSUE_UPDATE_SUCCESS").trim())){
					if(stockissueobj.getFlowUnder().equals("outlet"))
						locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
					else
						locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,false);
					if(locationsList==null || locationsList.size()==0){
						modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
					}
					List<String> allLocationsList =  adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr, false);
					modelAndViewObj.addObject("allLocationsList", allLocationsList);
					modelAndViewObj.addObject("locationsList", locationsList);
				}
				locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,false);
				if(locationsList==null || locationsList.size()==0){
					modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
				}
				List<String> allLocationsList =  adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr, false);
				modelAndViewObj.addObject("allLocationsList", allLocationsList);
				modelAndViewObj.addObject("locationsList", locationsList);
				modelAndViewObj = new ModelAndView();
				StockIssueBean stockIssueDetailsObj = stockIssueServiceObj.getStockIssue(customerIdStr, emailIdStr, stockissueobj.getGoods_issue_ref_num(),stockissueobj.getFlowUnder());
				if(responseStr.contains("Success")){
					modelAndViewObj.addObject("success", responseStr);
				}else{
					
					modelAndViewObj.addObject("err", responseStr);
				}
				modelAndViewObj.addObject("stockIssueDetails",stockIssueDetailsObj);
				modelAndViewObj.addObject("allLocationsList", allLocationsList);
				modelAndViewObj.addObject("locationsList", locationsList);
				modelAndViewObj.setViewName("Inventory Manager/retailoutlets/editstockissue");
				modelAndViewObj.addObject("allLocationsList", allLocationsList);
				modelAndViewObj.addObject("locationsList", locationsList);
			}
			
			/*else{
				modelAndViewObj.setViewName("Inventory Manager/retailoutlets/viewstockissue");
			}*/
		
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allissuedstocks");
		}
		
		modelAndViewObj.addObject("flowUnder", stockissueobj.getFlowUnder());
		return modelAndViewObj;
	}
	
	
	@RequestMapping(value="/saveStockIssue",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView saveStockIssue(@RequestBody StockIssues stockissueobj,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr=null,emailIdStr=null,responseStr=null;
		List<String> locationsList = null;
		String flowUnder = stockissueobj.getFlowUnder();
		try{
			// log.info("Update Stock Issue Details");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			
				List<String> skuid = stockissueobj.getSkuId();
				List<String> Qty = stockissueobj.getQty();
				List<String> issued = stockissueobj.getIssuedqty();
				if(request.getSession().getAttribute("warehouseStockIssue")!= null)
				{
					List<StockIssues>	srlist =(List<StockIssues>)request.getSession().getAttribute("warehouseStockIssue");
					for(int i=0;i<srlist.size();i++){
						if(srlist.get(i).getGoods_issue_ref_num().equalsIgnoreCase(stockissueobj.getGoods_issue_ref_num())){
							stockissueobj = srlist.get(i);
							stockissueobj.setFlowUnder(flowUnder);
							for(int j=0;j<stockissueobj.getReciptDetails().size();j++){
								for(int k=0;k<skuid.size();k++)
								if(stockissueobj.getReciptDetails().get(j).getSkuId().equalsIgnoreCase(skuid.get(k))){
									StockIssueDetails items = stockissueobj.getReciptDetails().get(j);
									items.setActualQty(Float.valueOf(Qty.get(k)));
									items.setQuantity(Float.valueOf(issued.get(k)));
									stockissueobj.getReciptDetails().set(j, items);
								}
									
									
							}
						}
					}
					
				}
				responseStr = stockIssueServiceObj.updateStockIssue(customerIdStr,emailIdStr,stockissueobj);

				if(!responseStr.equals(AppProperties.getAppMessageByProperty("STOCK_ISSUE_UPDATE_SUCCESS").trim())){
					if(stockissueobj.getFlowUnder().equals("outlet"))
						locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
					else
						locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,false);
					if(locationsList==null || locationsList.size()==0){
						modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
					}
					List<String> allLocationsList =  adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr, false);
					modelAndViewObj.addObject("allLocationsList", allLocationsList);
					modelAndViewObj.addObject("locationsList", locationsList);
				}
			
		
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allissuedstocks");
		}
		
		modelAndViewObj.addObject("flowUnder", stockissueobj.getFlowUnder());
		return modelAndViewObj;
	}
	
	
	@RequestMapping("/viewOutletStocks")
	public ModelAndView viewOutletStocks(@RequestParam("stockType") String stockType,@RequestParam("index") String index,
			@RequestParam("location") String locationStr,@RequestParam("maxRecords") String maxRecords,@RequestParam("flowUnder") String flowUnder,
			@RequestParam("zone") String zone,@RequestParam("category") String category,
			@RequestParam("subcategory") String subcategory,@RequestParam("brand") String brand,@RequestParam("department") String department,
			@RequestParam("startdate") String startdate,@RequestParam("enddate") String enddate,
			@RequestParam("startprice") Float startprice,@RequestParam("endprice") Float endprice ,@RequestParam("stockdownload") Boolean stockdownload,@RequestParam("suppliername") String suppliername,@RequestParam("searchName") String searchName,
		HttpServletRequest request,HttpServletResponse response){
		String customerIdStr=null,emailIdStr=null;
		List<SkuDetails> skuDetailsList=null;
		//List<String> locationsList=null;
		List<String> locationsListValue=new ArrayList<String>();
		ArrayList<LocationBean> locationBeansList = new ArrayList<LocationBean>();
		String locationListAll = "";
		try{
			int start = 1,  end = Integer.parseInt(maxRecords);
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
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
			List<Suppliers> supplierList =(List<Suppliers>)request.getSession().getAttribute("supplierList");
			if(supplierList==null || supplierList.size()==0 || supplierList.isEmpty()){
				 supplierList = outletMasterServiceObj.getSuppliers(customerIdStr, emailIdStr,"-1","","");
				request.getSession().setAttribute("supplierList", supplierList);
			}
//			List<String> brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
			
			List<String> brandsList = (List<String>)request.getSession().getAttribute("brandsList");
			if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
			 brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
				request.getSession().setAttribute("brandsList", brandsList);
			}
			
			modelAndViewObj = new ModelAndView();
			if(flowUnder.equals("outlet")){
			//	locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
				
			if(zone == null || zone.trim().equals(""))
					locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
				else
					locationBeansList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");
				
				//locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,true);	
				/*if((locationStr.trim()).equals(null) || locationStr.trim().isEmpty())
				{
					locationStr = locationBeansList.get(0).getLocationId();
				}*/
				
			}else{
			//	locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
				locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
				/*if((locationStr.trim()).equals(null) || locationStr.trim().isEmpty())
				locationStr = locationsList.get(0);*/
//			modelAndViewObj.addObject("locationsList", locationsList);
			}
			
			modelAndViewObj.addObject("locationsList", locationBeansList);
			if(locationStr.equals("all")|| locationStr.equals("")){
				if(locationBeansList != null){
					/*for(int i=0;i<locationBeansList.size();i++){
					
						locationsListValue.add(locationBeansList.get(0).getLocationId());
							
					}
				for (String string : locationsListValue) {
					
					locationListAll = locationListAll+string+",";
				}*/
					locationListAll = locationBeansList.get(0).getLocationId();
				}
				
			}
			    modelAndViewObj.addObject("zoneList", zoneList);
				modelAndViewObj.addObject("departmentList", departmentList);
				modelAndViewObj.addObject("categoryList", categoryList);
				modelAndViewObj.addObject("subCategoryDetailsList", subCategoryDetailsList);
				modelAndViewObj.addObject("brandsList", brandsList);
				skuDetailsList = skuServiceObj.getProductStocks(searchName,"",startdate,enddate,locationStr,stockType,customerIdStr,emailIdStr,index,flowUnder,zone,category,subcategory,brand,department,startprice,endprice,stockdownload,suppliername,maxRecords,locationListAll,"");
				
				if(locationStr != null && !locationStr.equals(""))
					request.getSession().setAttribute("selectedLocation",locationStr);
				if(skuDetailsList == null){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(skuDetailsList.size()<10){
						end = (skuDetailsList.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(skuDetailsList.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
					modelAndViewObj.addObject("totalcost",skuDetailsList.get(0).getTotalPrice());
					modelAndViewObj.addObject("totalquantity",skuDetailsList.get(0).getTotalQuantity());
				}
				if(stockdownload){
				modelAndViewObj.addObject("downloadurl",skuDetailsList.get(0).getStockDownload());
				modelAndViewObj.addObject("downloadDaywiseurl",skuDetailsList.get(0).getStockDaywiseDownload());
				}
				modelAndViewObj.addObject("skuDetailsList",skuDetailsList);
				modelAndViewObj.addObject("selectedLocation",locationStr);
			modelAndViewObj.addObject("maxRecords",Integer.parseInt(maxRecords));
			modelAndViewObj.addObject("stockType",stockType);
			String jsp = stockType + "Stock";
			modelAndViewObj.addObject("startdate", startdate);
			modelAndViewObj.addObject("enddate", enddate);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("endprice", endprice);
			modelAndViewObj.addObject("startprice", startprice);
			modelAndViewObj.addObject("category", category);
			modelAndViewObj.addObject("subcategory", subcategory);
			modelAndViewObj.addObject("brand", brand);
			modelAndViewObj.addObject("department", department);
			modelAndViewObj.addObject("suppliername", suppliername);
			modelAndViewObj.addObject("searchName", searchName);
			modelAndViewObj.setViewName("Stocks/"+jsp);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		modelAndViewObj.addObject("flowUnder", flowUnder);
		return modelAndViewObj;
	}
	
	
	@RequestMapping("/viewOutletStocksHistory")
	public ModelAndView viewOutletStocksHistory(@RequestParam("stockType") String stockType,@RequestParam("index") String index,
			@RequestParam("location") String locationStr,@RequestParam("maxRecords") String maxRecords,@RequestParam("flowUnder") String flowUnder,
			@RequestParam("zone") String zone,@RequestParam("category") String category,
			@RequestParam("subcategory") String subcategory,@RequestParam("brand") String brand,@RequestParam("department") String department,
			@RequestParam("startdate") String startdate,@RequestParam("enddate") String enddate,
			@RequestParam("stockdownload") Boolean stockdownload,@RequestParam("suppliername") String suppliername,@RequestParam("searchName") String searchName,
		HttpServletRequest request,HttpServletResponse response){
		String customerIdStr=null,emailIdStr=null;
		List<SkuDetails> skuDetailsList=null;
		
		List<String> locationsListValue=new ArrayList<String>();
		ArrayList<LocationBean> locationBeansList = new ArrayList<LocationBean>();
		String locationListAll = "";
		try{
			int start = 1,  end = Integer.parseInt(maxRecords);
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
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
			List<Suppliers> supplierList =(List<Suppliers>)request.getSession().getAttribute("supplierList");
			if(supplierList==null || supplierList.size()==0 || supplierList.isEmpty()){
				 supplierList = outletMasterServiceObj.getSuppliers(customerIdStr, emailIdStr,"-1","","");
				request.getSession().setAttribute("supplierList", supplierList);
			}
//			List<String> brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
			
			List<String> brandsList = (List<String>)request.getSession().getAttribute("brandsList");
			if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
			 brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
				request.getSession().setAttribute("brandsList", brandsList);
			}
			modelAndViewObj = new ModelAndView();
			if(flowUnder.equals("outlet")){
			//	locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
												
				if(zone == null || zone.trim().equals(""))
					locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
				else
					locationBeansList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");
				
				//locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,true);	
			
				
			}else{
			//	locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
				locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
				
//			modelAndViewObj.addObject("locationsList", locationsList);
			}
			
			modelAndViewObj.addObject("locationsList", locationBeansList);
			if(locationStr.equals("all")|| locationStr.equals("")){
				if(locationBeansList != null){
					
					locationListAll = locationBeansList.get(0).getLocationId();
				}
				
			}
				modelAndViewObj.addObject("zoneList", zoneList);
				modelAndViewObj.addObject("departmentList", departmentList);
				modelAndViewObj.addObject("categoryList", categoryList);
				modelAndViewObj.addObject("subCategoryDetailsList", subCategoryDetailsList);
				modelAndViewObj.addObject("brandsList", brandsList);
			
				skuDetailsList = skuServiceObj.getProductStocksNew(searchName,"",startdate,enddate,locationStr,stockType,customerIdStr,emailIdStr,index,flowUnder,zone,category,subcategory,brand,department,stockdownload,suppliername,maxRecords,locationListAll,"");
				
				if(locationStr != null && !locationStr.equals(""))
					request.getSession().setAttribute("selectedLocation",locationStr);
				if(skuDetailsList == null){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(skuDetailsList.size()<10){
						end = (skuDetailsList.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(skuDetailsList.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
					modelAndViewObj.addObject("totalcost",skuDetailsList.get(0).getTotalPrice());
					modelAndViewObj.addObject("totalquantity",skuDetailsList.get(0).getTotalQuantity());
				}
				if(stockdownload){
				modelAndViewObj.addObject("downloadurl",skuDetailsList.get(0).getStockDownload());
				modelAndViewObj.addObject("downloadDaywiseurl",skuDetailsList.get(0).getStockDaywiseDownload());
				}
				modelAndViewObj.addObject("skuDetailsList",skuDetailsList);
				modelAndViewObj.addObject("selectedLocation",locationStr);
			modelAndViewObj.addObject("maxRecords",Integer.parseInt(maxRecords));
			modelAndViewObj.addObject("stockType",stockType);
			String jsp = stockType + "Stock";
			modelAndViewObj.addObject("startdate", startdate);
			modelAndViewObj.addObject("enddate", enddate);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("category", category);
			modelAndViewObj.addObject("subcategory", subcategory);
			modelAndViewObj.addObject("brand", brand);
			modelAndViewObj.addObject("department", department);
			modelAndViewObj.addObject("suppliername", suppliername);
			modelAndViewObj.addObject("searchName", searchName);
			//modelAndViewObj.setViewName("Stocks/"+jsp);
			modelAndViewObj.setViewName("Stocks/DayWiseStockHistory");
		}catch(Exception e){
			e.printStackTrace();
		}
		modelAndViewObj.addObject("flowUnder", flowUnder);
		return modelAndViewObj;
	}

	
	
	
	
	
	@RequestMapping("/searchStocks")
	public ModelAndView searchStocks(@RequestParam("searchType") String searchTypeStr,@RequestParam("stockType") String stockType,@RequestParam("index") String index,
			@RequestParam("location") String locationStr,@RequestParam("maxRecords") String maxRecords,@RequestParam("flowUnder") String flowUnder,
			@RequestParam("searchName") String searchName,@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,@RequestParam("locationList") String locationListAll,
		HttpServletRequest request,HttpServletResponse response){
		String customerIdStr=null,emailIdStr=null;
		List<SkuDetails> skuDetailsList=null;
		List<String> locationsListValue=null;
		List<String> locationsList=null;
		ArrayList<LocationBean> locationBeansList = null;
		try{
			int start = 1,end = 10;
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			if(flowUnder.equals("outlet")){
			//	locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
				locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);	
				
				
		
			}
				else
				{
//					locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
					locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,false);
//					modelAndViewObj.addObject("locationsList", locationsList);
					
				}
					
			    modelAndViewObj.addObject("locationsList", locationBeansList);
				skuDetailsList = skuServiceObj.getProductStocks(searchName,searchTypeStr,startDate,endDate,locationStr,stockType,customerIdStr,emailIdStr,index,flowUnder,"","","","","",0f,0f,false,"","10",locationListAll,"");
				request.getSession().setAttribute("selectedLocation",locationStr);
				if(skuDetailsList == null || skuDetailsList.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(skuDetailsList.size()<10){
						end = (skuDetailsList.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(skuDetailsList.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
					modelAndViewObj.addObject("totalcost",skuDetailsList.get(0).getTotalPrice());
					modelAndViewObj.addObject("totalquantity",skuDetailsList.get(0).getTotalQuantity());
				}
				modelAndViewObj.addObject("searchName", searchName);
				modelAndViewObj.addObject("startdate", startDate);
				modelAndViewObj.addObject("enddate", endDate);
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.addObject("skuDetailsList",skuDetailsList);
				modelAndViewObj.addObject("selectedLocation",locationStr);
				modelAndViewObj.addObject("searchType",searchTypeStr);
			modelAndViewObj.addObject("stockType",stockType);
			String jsp = stockType + "Stock";
			modelAndViewObj.setViewName("Stocks/"+jsp);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		modelAndViewObj.addObject("flowUnder", flowUnder);
		return modelAndViewObj;
	}
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param Request,Response
     *  
     * This method is used to send view page with locations as pre-populated
	 *  
     *  @return ModelAndView 
     */
	@RequestMapping("/getProductStocksByCriteria")
	public ModelAndView getProductStocksByCriteria(@RequestParam("stockType") String stockTypeStr,@RequestParam("location") String locationStr,@RequestParam("flowUnder") String flowUnder,HttpServletRequest request,HttpServletResponse response){
		String customerIdStr =null,emailIdStr=null;
		List<SkuDetails> skuDetailsList=null;
		List<String> locationsList=null;
		List<String> locationsListValue=null;
		try{
			// log.info("getProductStocksByCriteria");
			int start = 1,end = 10;
			locationsListValue = new ArrayList<String>();
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			if(flowUnder.equals("outlet"))
				locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			else
				locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
			modelAndViewObj = new ModelAndView();
			/*if(locationsList==null || locationsList.size()==0){
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			}else{*/
				/*if(locationStr == null || "".equals(locationStr)){
					locationStr = (String)request.getSession().getAttribute("selectedLocation");
				}
				if(locationStr == null && locationsList != null && locationsList.size() > 0)
					locationStr = locationsList.get(0);*/
				modelAndViewObj.addObject("locationsList", locationsList);
				skuDetailsList = skuServiceObj.getProductStocks("","","","",locationStr,stockTypeStr,customerIdStr,emailIdStr,"0",flowUnder,"","","","","",0f,0f,false,"","10","","");
				request.getSession().setAttribute("selectedLocation",locationStr);
				if(skuDetailsList == null){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(skuDetailsList.size()<10){
						end = (skuDetailsList.size())+(Integer.parseInt("0"));
					}else{
						end = (Integer.parseInt("0")+end);
					}
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(skuDetailsList.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
					modelAndViewObj.addObject("totalValue", end);
				}
				modelAndViewObj.addObject("skuDetailsList",skuDetailsList);
				modelAndViewObj.addObject("selectedLocation",locationStr);
			//}	
			modelAndViewObj.addObject("stockType",stockTypeStr);
			String jsp = stockTypeStr + "Stock";
			modelAndViewObj.setViewName("Stocks/"+jsp);
		}catch(Exception e){
			e.printStackTrace();
		}
		modelAndViewObj.addObject("flowUnder", flowUnder);
		return modelAndViewObj;
	}
	
	
	
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param Request,Response,operation
     *  
     * This method is used to send view page with all outlet stock verification details 
	 *  
     *  @return ModelAndView with stock verification details
     */
	@RequestMapping("/viewOutletStockVerification")
	public ModelAndView viewOutletStockVerification(@RequestParam("index")String index,@RequestParam("location")String location,HttpServletRequest request,HttpServletResponse response) {
		String userIdStr = null,emailIdStr=null;
		List<String> locationsList = null;
		List<StoreStockVerification> productStockVerificationDetailsList = null;
		try{
			// log.info("View All Stocks Verification");
			int start = 1,end = 10;
			userIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			locationsList = adminServiceObj.getOutletLocationsList(userIdStr,emailIdStr,true);
			modelAndViewObj = new ModelAndView();
//			String location = (String)request.getSession().getAttribute("selectedLocation");
			/*if(location == null && locationsList==null || locationsList.size()==0)
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			else{*/
				modelAndViewObj.addObject("locationsList", locationsList);
				/*if(location == null && locationsList != null && locationsList.size()>0)
					location = locationsList.get(0);*/
				if((location == null || location.equals("")) && (locationsList != null && locationsList.size() > 0))
					location = locationsList.get(0);
//				productStockVerificationDetailsList = storeStockVerificationServiceObj.getProductVerification(userIdStr,emailIdStr,location,index);
				modelAndViewObj.addObject("selectedLocation", location);
				request.getSession().setAttribute("selectedLocation",location);
				if(productStockVerificationDetailsList == null || productStockVerificationDetailsList.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(productStockVerificationDetailsList.size()<10){
						end = (productStockVerificationDetailsList.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(productStockVerificationDetailsList.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
				}
				modelAndViewObj.addObject("productStockVerificationDetailsList",productStockVerificationDetailsList);
//			}
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allverifiedproductstocks");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allverifiedproductstocks");
		}
		return modelAndViewObj;
	}
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param Request,Response,operation
     *  
     * This method is used to send view page with all outlet product stock verification details 
	 *  
     *  @return ModelAndView with product stock verification details
     */
	@RequestMapping("/viewOutletProductStockVerification")
	public ModelAndView viewOutletProductStockVerification(HttpServletRequest request,HttpServletResponse response) {
		String userIdStr = null,emailIdStr=null;
		List<String> locationsList = null;
		List<StoreStockVerification> productStockVerificationDetailsList = null;
		try{
			// log.info("View All Stocks Verification");
			userIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			locationsList = adminServiceObj.getOutletLocationsList(userIdStr,emailIdStr,true);
			modelAndViewObj = new ModelAndView();
			if(locationsList==null || locationsList.size()==0){
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			}else{
				modelAndViewObj.addObject("locationsList", locationsList);
//				productStockVerificationDetailsList = storeStockVerificationServiceObj.getProductVerification(userIdStr,emailIdStr,locationsList.get(0),"0");
				modelAndViewObj.addObject("productStockVerificationDetailsList",productStockVerificationDetailsList);
				modelAndViewObj.addObject("selectedLocation",locationsList.get(0));
			}
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allverifiedproductstocks");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allverifiedproductstocks");
		}
		return modelAndViewObj;
	}
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param Request,Response,operation
     *  
     * This method is used to send view page with selected outlet product stock verification details 
	 *  
     *  @return ModelAndView with product stock verification details
     */
	/*@RequestMapping("/getProductStockVerificationByOutletWise")
	public ModelAndView getProductStockVerificationByOutletWise(@RequestParam("location")String locationStr,HttpServletRequest request,HttpServletResponse response) {
		String userIdStr = null,emailIdStr=null;
		List<String> locationsList = null;
		List<StoreStockVerification> productStockVerificationDetailsList = null;
		try{
			// log.info("View All Stocks Verification");
			int start = 1,end = 10;
			userIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			locationsList = adminServiceObj.getOutletLocationsList(userIdStr,emailIdStr,true);
			modelAndViewObj = new ModelAndView();
			if(locationsList==null || locationsList.size()==0){
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			}else{
				modelAndViewObj.addObject("locationsList", locationsList);
//				productStockVerificationDetailsList = storeStockVerificationServiceObj.getProductVerification(userIdStr,emailIdStr,locationStr,"0");
				request.getSession().setAttribute("selectedLocation",locationStr);
				modelAndViewObj.addObject("productStockVerificationDetailsList",productStockVerificationDetailsList);
				if(productStockVerificationDetailsList == null || productStockVerificationDetailsList.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(productStockVerificationDetailsList.size()<10){
						end = (productStockVerificationDetailsList.size())+(Integer.parseInt("0"));
					}else{
						end = (Integer.parseInt("0")+end);
					}
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(productStockVerificationDetailsList.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
					modelAndViewObj.addObject("totalValue", end);
				}
				modelAndViewObj.addObject("selectedLocation",locationStr);
			}
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allverifiedproductstocks");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allverifiedproductstocks");
		}
		return modelAndViewObj;
	}*/
	
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param Request,Response,operation
     *  
     * This method is used to send view page with specific outlet product stock verification details 
	 *  
     *  @return ModelAndView with product stock verification details
     */
	@RequestMapping("/viewSpecificOutletProductStockVerification")
	public ModelAndView viewSpecificOutletProductStockVerification(@RequestParam("verificationCode") String verificationCode,HttpServletRequest request,HttpServletResponse response) {
		List<StoreStockVerificationDetails> productStockVerificationItemDetailsList = null;
//		String userIdStr = null,emailIdStr=null;
		try{
			// log.info("View Specific Outlet Stock Verification");
//			userIdStr = (String)request.getSession().getAttribute("customerId");
//			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
//			productStockVerificationItemDetailsList = storeStockVerificationServiceObj.getProductVerificationDetails(userIdStr,emailIdStr,verificationCode);
			modelAndViewObj.addObject("productStockVerificationItemDetailsList",productStockVerificationItemDetailsList);
			modelAndViewObj.addObject("verificationCode",verificationCode);
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allverifiedproductstockitems");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allverifiedproductstocks");
		}
		return modelAndViewObj;
	}
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param Request,Response,operation
     *  
     * This method is used to send view page with product stock verification item details 
	 *  
     *  @return ModelAndView 
     */
	@RequestMapping(value="/viewOutletProductStockVerificationItems",method=RequestMethod.POST)
	public ModelAndView viewOutletProductStockVerificationItems(@RequestBody StoreStockVerificationDetails specificProductData,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("View Outlet Product Stock Verification Items");
			modelAndViewObj.addObject("specificProductData",specificProductData);
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/viewoutletproductstockverification");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allverifiedproductstocks");
		}
		return modelAndViewObj;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On:6-jun-2015.
	 * 
	 * This method accepts the search string and retrieves a list of product matching it.
	 * It returns the list of the products. 
	 * 
	 */
	
	@RequestMapping("/searchProductNames")
	public @ResponseBody List<Products> searchProductNames(@RequestParam("searchName") String searchNameStr,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<Products> productsList = new ArrayList<Products>();
		try{
			// log.info("searchProductNames");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			productsList = outletMasterServiceObj.getProducts(customerIdStr, emailIdStr,searchNameStr,"0","","","30");
			// log.info("Result:::"+productsList);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return productsList;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On:6-jun-2015.
	 * 
	 * This method accepts the search string and retrieves a list of product matching it.
	 * It returns the list of the products. 
	 * 
	 */
	
	@RequestMapping("/searchSubCategoriesBasedOnCategory")
	public @ResponseBody List<ProductSubCategoryBean> searchSubCategoriesBasedOnCategory(@RequestParam("categoryName") String categoryName,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<ProductSubCategoryBean> subCategoryList = new ArrayList<ProductSubCategoryBean>();
		try{
			// log.info("searchProductNames");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			subCategoryList = outletMasterServiceObj.getSubCategoryDetails(categoryName, customerIdStr, emailIdStr, "-1","",false);
			
			// log.info("Result:::"+subCategoryList);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return subCategoryList;
	}
	
	
	

	@RequestMapping("/searchMenusforCounter")
	public @ResponseBody List<MenuDetails> searchMenusforCounter(@RequestParam("location") String location,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<MenuDetails> menuDetailsList = new ArrayList<MenuDetails>();
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			
				menuDetailsList = menuServiceObj.getMenuDetails(location, customerIdStr, emailIdStr,"",false);
			

		
		}catch(Exception e){
			e.printStackTrace();
		}
		return menuDetailsList;
	}
	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On:6-jun-2015.
	 * 
	 * This method accepts the search string and retrieves a list of product matching it.
	 * It returns the list of the products. 
	 * 
	 */
	
	@RequestMapping("/searchCategorybasedonlocation")
	public @ResponseBody ProductSubCategoryBean searchCategorybasedonlocation(@RequestParam("location") String location,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<String> categories = null;
		ProductSubCategoryBean subCategoryList = new ProductSubCategoryBean();
		try{
			// log.info("searchProductNames");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			subCategoryList = outletMasterServiceObj.getCategoriesbasedonlocation(location, customerIdStr, emailIdStr, "-1", true);
			// log.info("Result:::"+subCategoryList);
		}catch(Exception e){
			e.printStackTrace();
		}
		return subCategoryList;
	}
	
	

	
	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to view the procurement Receipts and purchase order receipts in a tabular format
	 *
	 **/
	/*@RequestMapping("/viewAllProcurementDetails")
	public ModelAndView viewAllProcurementDetails(HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewProcurement");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<String> locationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr);
			modelAndViewObj = new ModelAndView();
			if(locationsList.size()==0 || locationsList==null){
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			}else{
			List<PurchaseOrder> purchaseOrderBeansList = procurementServiceObj.getPurchaseOrders("all",customerIdStr, emailIdStr,locationsList.get(0));
			modelAndViewObj.addObject("operation", "all");
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("selectedLocation",locationsList.get(0));
			modelAndViewObj.addObject("purchaseOrderBeansList", purchaseOrderBeansList);
			modelAndViewObj.setViewName("Inventory Manager/warehouse/procurement/procurementDetails");
			}
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}*/
	
	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * Created on: 28-jun-2015
	 * 
	 * 
	 * This method is used to create new purchase order.
	 * It accepts all the purchase order details need to be saved into database.
	 * It returns newPurchaseOrder JSP along with a message of successful creation or not.
	 *
	 **/
	
	/*@RequestMapping(value="/createNewPurchaseOrder",method=RequestMethod.POST)
	public ModelAndView createNewPurchaseOrder(@RequestBody PurchaseOrder purchaseOrderDetails,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("createNewPurchaseOrder");
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		modelAndViewObj = new ModelAndView();
		JSONArray jsonResponseArray = new JSONArray(purchaseOrderDetails.getItemDetails());
		List<WHPurchaseOrderItems> itemDetails = new ArrayList<WHPurchaseOrderItems>();
		for (int i=0; i<jsonResponseArray.length(); i++) {
			WHPurchaseOrderItems items = gson.fromJson(jsonResponseArray.getString(i), WHPurchaseOrderItems.class);
			itemDetails.add(items);
		}
		purchaseOrderDetails.setWhPurchaseItems(itemDetails);
		String result = procurementServiceObj.createOutletPurchaseOrder(purchaseOrderDetails,customerIdStr,emailIdStr);
		List<String> workLocationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr);
		modelAndViewObj.addObject("workLocationsList", workLocationsList);
		modelAndViewObj.addObject("err", result);
		modelAndViewObj.setViewName("Inventory Manager/warehouse/procurement/newPurchaseOrder");
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}*/
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to view the Purchase Orders in a tabular format
	 *
	 **/
	/*@RequestMapping("/viewPurchaseOrder")
	public ModelAndView viewPurchaseOrder(@RequestParam("operation") String operation,@RequestParam("location")String location,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewPurchaseOrder");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<String> locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr);
			modelAndViewObj = new ModelAndView();
			if(locationsList.size()==0 || locationsList==null){
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			}else{
				if(location == "" || location == null)
					location = locationsList.get(0);
			List<PurchaseOrder> purchaseOrderBeansList = procurementServiceObj.getPurchaseOrders(operation,customerIdStr, emailIdStr,location);
			if(!operation.equals("draft"))
				operation = "all";
			modelAndViewObj.addObject("operation", operation);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("selectedLocation",location);
			modelAndViewObj.addObject("purchaseOrderBeansList", purchaseOrderBeansList);
			modelAndViewObj.setViewName("Inventory Manager/warehouse/procurement/purchaseOrder");
			}
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}*/
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to view the purchase Order Details of the given  PO_Ref
	 *
	 **/
	/*@RequestMapping("/viewPurchaseOrderDetails")
	public ModelAndView viewPurchaseOrderDetails(@RequestParam("PO_Ref") String PO_Ref,@RequestParam("operation") String operation,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewPurchaseOrderDetails");
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			PurchaseOrder  purchaseOrderBeanObj = procurementServiceObj.getPurchaseOrderDetails(PO_Ref,customerId, emailId);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("purchaseOrderBeanObj", purchaseOrderBeanObj);
			if(operation.equals("view"))
				modelAndViewObj.setViewName("Inventory Manager/warehouse/procurement/viewPurchaseOrder");
			else{
				List<String> workLocationsList = adminServiceObj.getLocationsList(customerId,emailId);
				modelAndViewObj.addObject("workLocationsList", workLocationsList);
				modelAndViewObj.setViewName("Inventory Manager/warehouse/procurement/editPurchaseOrder");
			}
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}*/
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to view the procurement Receipts in a tabular format
	 *
	 **/
	/*@RequestMapping("/viewProcurement")
	public ModelAndView viewProcurement(@RequestParam("operation") String operation,@RequestParam("location") String location,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewProcurement");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<String> locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr);
			modelAndViewObj = new ModelAndView();
			if(locationsList.size()==0 || locationsList==null){
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			}else{
				if(location == "" || location == null)
					location = locationsList.get(0);
			List<ProcurementReceipt> procurementReceiptList = procurementServiceObj.getStockProcurementReceipts(operation,customerIdStr, emailIdStr,location);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("selectedLocation",location);
			modelAndViewObj.addObject("operation", operation);
			modelAndViewObj.addObject("procurementReceiptList", procurementReceiptList);
			modelAndViewObj.setViewName("Inventory Manager/warehouse/procurement/procurement");
			}
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}*/
	

	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to view the New Procurement Receipt form
	 *
	 **/
	/*@RequestMapping("/newProcurement")
	public ModelAndView newProcurement(HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("newProcurement");
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			// log.info(request.getLocale());
			List<String> workLocationsList = adminServiceObj.getLocationsList(customerId,emailId);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.setViewName("Inventory Manager/warehouse/procurement/newProcurementReceipt");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}*/
	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to save the details of a New Procurement Receipt and update the existing Procurement Receipt
	 *
	 **/
	/*@RequestMapping(value="/createNewProcurementReceipt",method=RequestMethod.POST)
	public ModelAndView createNewProcurementReceipt(@RequestParam("formData") String formData,@RequestParam("totalQty") String totalQty,@RequestParam("totalCost") String totalCost,@RequestParam("itemDetails") String itemDetails,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("createNewProcurementReceipt");
			modelAndViewObj = new ModelAndView();
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			// log.info(request.getLocale());
			ProcurementReceipt procurementReceipt = procurementServiceObj.createNewProcurement((Locale)request.getSession().getAttribute("currentLocale"),formData, totalQty, totalCost, itemDetails,customerId,emailId);
			List<String> workLocationsList = adminServiceObj.getLocationsList(customerId,emailId);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("err",procurementReceipt.getResult());
			if (procurementReceipt.getResult().contains("Updated")){
				modelAndViewObj.addObject("procurementReceipt", procurementReceipt);
				if(procurementReceipt.getStatus().equals("draft"))
					modelAndViewObj.setViewName("Inventory Manager/warehouse/procurement/editProcurementReceipt");
				else
					modelAndViewObj.setViewName("Inventory Manager/warehouse/procurement/viewProcurementReceipt");
			}
			else
				modelAndViewObj.setViewName("Inventory Manager/warehouse/procurement/newProcurementReceipt");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}*/
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to view the procurement Receipts of the given  receiptRefNo
	 *
	 **/
	/*@RequestMapping("/viewProcurementDetails")
	public ModelAndView viewProcurementDetails(@RequestParam("receiptRefNo") String receiptRefNo,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewProcurementDetails");
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			ProcurementReceipt procurementReceipt = procurementServiceObj.getStockProcurementReceipt(receiptRefNo,customerId, emailId);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("procurementReceipt", procurementReceipt);
			modelAndViewObj.setViewName("Inventory Manager/warehouse/procurement/viewProcurementReceipt");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}*/
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to view the procurement Receipts of the given  receiptRefNo
	 *
	 **/
	/*@RequestMapping("/editProcurementDetails")
	public ModelAndView editProcurementDetails(@RequestParam("receiptRefNo") String receiptRefNo,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewProcurementDetails");
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			ProcurementReceipt procurementReceipt = procurementServiceObj.getStockProcurementReceipt(receiptRefNo,customerId, emailId);
			List<String> workLocationsList = adminServiceObj.getLocationsList(customerId,emailId);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("procurementReceipt", procurementReceipt);
			modelAndViewObj.setViewName("Inventory Manager/warehouse/procurement/editProcurementReceipt");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}*/
	
	@RequestMapping("/getOrders")
	public @ResponseBody ModelAndView getOrders(
			@RequestParam("searchName") String searchName,
			@RequestParam("status") String status,
			@RequestParam("operation") String operation,
			@RequestParam("location") String location,
			@RequestParam("index") String index,
			@RequestParam("type") String type,
			@RequestParam("flowUnder") String flowUnder,
			@RequestParam("orderChannel") String orderChannel,
			@RequestParam("maxRecords") String maxRecords,
			@RequestParam("zone") String zone,
			@RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate,
			HttpServletRequest request,HttpServletResponse response){
		
		/**
		 * Developed By : Sambaiah Y
		 * Created On   : 27-04-2015
		 * Modified By  : 
		 * access services for getting the orders from server
		 * 
		 */
		// log.info("InventoryManagerController - getOrders()-"+type);
		OrderDetails orderDetails = new OrderDetails();
		List<String> locationsList = null;
		List<OrderDetails> lst_orders = null;
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		int start = 1,end = Integer.parseInt(maxRecords);
		List<String> startTimeList =new ArrayList<String>();
		List<String> endTimeList =new ArrayList<String>();
		try {
//			orderDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr, emailIdStr));
			orderDetails.setStartIndex(index);
			//////////System.out.println();
			
			String flow = "";
			if(type.equals("management")){
				flow = "all";				
				locationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr,true);
			}
			else if(flowUnder.equals("outlet")){
				flow = "outlet";
				locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			}
			else{
				flow = "warehouse";
				locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
			}
			
//			Added by vijay, to make default loaction as location list first occurrence, if location is empty
			/*if((location.trim()).equals(null) || location.trim().isEmpty())
			{
				location = locationsList.get(0);
			}*/
			
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
		    modelAndViewObj = new ModelAndView();
			/*if(locationsList==null  || locationsList.size()==0 ){
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			}else{*/
				/*if(location == null || location.equals(""))
					location = (String) request.getSession().getAttribute("selectedLocation");
				if((location == null || location.equals("")) && locationsList != null && locationsList.size()>0)
					location = locationsList.get(0);*/
				modelAndViewObj.addObject("locationsList", locationsList);
				
				
//				lst_orders = orderServiceObj.getOrders(searchName,operation,status,orderDetails,location,index,"","",maxRecords,flow,orderChannel,"","");
				lst_orders = orderServiceObj.getOrdersByLocationOrders(searchName,operation,status,orderDetails,location,index,true,startDate,endDate,maxRecords,flow,true,orderChannel,"","","","false",zoneList);
				
				List<RouteMaster> routeMasterList =genericMasterServiceObj.getRouteMasters(customerIdStr, emailIdStr,0,10,"",false,null,"","","","");
				if(routeMasterList!=null)
				{
				for(int i=0;i<routeMasterList.get(0).getRouteList().size();i++){
					
						startTimeList.add(DateUtil.getTimeIn12HoursFormat(routeMasterList.get(0).getRouteList().get(i).getStartTimeStr()));
						endTimeList.add(DateUtil.getTimeIn12HoursFormat(routeMasterList.get(0).getRouteList().get(i).getEndTimeStr()));
				}
				}
				
				if(!location.equals(""))
					request.getSession().setAttribute("selectedLocation",location);
				if(lst_orders == null){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(lst_orders.size()<Integer.parseInt(maxRecords)){
						end = (lst_orders.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					
					for(int i=0;i<lst_orders.size();i++){
						Date date = lst_orders.get(i).getOrderPlacedDate();  
		                DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");  
		                String strDate = dateFormat.format(date); 
						lst_orders.get(i).setOrderPlacedDateStr(strDate);
					}
					
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(lst_orders.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
				}

				modelAndViewObj.addObject("orderDetails",lst_orders);
				modelAndViewObj.addObject("selectedLocation",location);
			//}
				modelAndViewObj.addObject("startTimeList",startTimeList);
				modelAndViewObj.addObject("endTimeList",endTimeList);
				modelAndViewObj.addObject("startDate",startDate);
				modelAndViewObj.addObject("endDate",endDate);
			modelAndViewObj.addObject("status",status);
			modelAndViewObj.addObject("searchName",searchName);
			modelAndViewObj.addObject("orderChannel",orderChannel);
			modelAndViewObj.addObject("type",type);
			/*if(operation.equalsIgnoreCase("Door Delivery")){
				modelAndViewObj.setViewName("Inventory Manager/Deliveries/viewdeliveries");
			}else{*/
				modelAndViewObj.setViewName("Inventory Manager/Orders/viewOrders");
//			}
		}catch(Exception e){
			e.printStackTrace();
//			lst_orders = new ArrayList<OrderDetails>();
			modelAndViewObj.addObject("type",type);
			/*if(operation.equalsIgnoreCase("Door Delivery")){
				modelAndViewObj.setViewName("Inventory Manager/Deliveries/viewdeliveries");
			}else{*/
			modelAndViewObj.setViewName("Inventory Manager/Orders/viewOrders");
//			}
		}
		modelAndViewObj.addObject("flowUnder",flowUnder);
		modelAndViewObj.addObject("maxRecords",maxRecords);
		modelAndViewObj.addObject("zone",zone);
		
		return modelAndViewObj;
	}
	
	
	
	/**
	 * 
	 * @author mythri
	 * created on : 23/4/2016
	 * This method is used to get order summary from services and display in a pop-up
	 */
	@RequestMapping("/getOrderSummary")
	public ModelAndView getOrderSummary(@RequestParam("location") String location,@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,@RequestParam("status") String status,HttpServletRequest request,
			HttpServletResponse response){
		try{
			// log.info("getOrderSummary");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			OrderSummaryResponse orderSummaryResponseObj = orderServiceObj.getOrderSummary(location,startDate,endDate,status,customerIdStr,emailIdStr);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("orderSummaryResponse",orderSummaryResponseObj);
			if(orderSummaryResponseObj.getSummaryList()!=null)
			if(orderSummaryResponseObj.getSummaryList().size()>0){
				modelAndViewObj.addObject("orderSummarysize",orderSummaryResponseObj.getSummaryList().size());
			}
			String segments []={"#2484c1", "#65a620", "#7b6888", "#a05d56", "#961a1a", "#d8d23a", "#e98125", "#d0743c", "#635222", "#6ada6a",
					"#0c6197", "#7d9058", "#207f33", "#44b9b0", "#bca44a", "#e4a14b", "#a3acb2", "#8cc3e9", "#69a6f9", "#5b388f",
					"#546e91", "#8bde95", "#d2ab58", "#273c71", "#98bf6e", "#4daa4b", "#98abc5", "#cc1010", "#31383b", "#006391",
					"#c2643f", "#b0a474", "#a5a39c", "#a9c2bc", "#22af8c", "#7fcecf", "#987ac6", "#3d3b87", "#b77b1c", "#c9c2b6",
					"#807ece", "#8db27c", "#be66a2", "#9ed3c6", "#00644b", "#005064", "#77979f", "#77e079", "#9c73ab", "#1f79a7"
					
			};
						
			modelAndViewObj.addObject("segments",segments);	
			modelAndViewObj.addObject("location",location);
			modelAndViewObj.addObject("startDate",startDate);
			modelAndViewObj.addObject("endDate",endDate);	
			modelAndViewObj.setViewName("Inventory Manager/Orders/orderSummaryReport");
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
	 *This method is used to view the Order Details based on the given OrderId and allows the user to edit the details
	 *
	 **/
	
	@RequestMapping(value="/newOrder")
	public ModelAndView newOrder(@RequestParam("flowUnder") String flowUnder,@RequestParam("status") String status,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("newOrder");
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		List<String> startTimeList =new ArrayList<String>();
		List<String> endTimeList =new ArrayList<String>();
		List<String> startTimeList2 =new ArrayList<String>();
		List<String> endTimeList2 =new ArrayList<String>();
		Map<String, Object> responseMapObj = null;
//		List<String> locationsList = null; 
//		if(type.equals("management"))
		modelAndViewObj = new ModelAndView();
		ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
		States states = genericMasterServiceObj.getStates();

//			locationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr);
//		else if(flowUnder.equals("outlet"))
//			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr);
//		else
//			locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr);
		List<EmployeeBean> employeeList = genericMasterServiceObj.getEmployees("",customerIdStr, emailIdStr,"-1","","",false,"");
		if(employeeList != null && employeeList.size()>0)
		{
			modelAndViewObj.addObject("employeeList",employeeList);
		    modelAndViewObj.addObject("employeeCode", employeeList.get(0).getEmployeeCode());
		}
			
		
		String location = (String) request.getSession().getAttribute("selectedLocation");
		if(location == null && locationBeanList != null)
			location = locationBeanList.get(0).getLocationId();

		List<Tax> taxDetails = adminServiceObj.getTaxForLocation(customerIdStr, emailIdStr, location);
		
		String ApiKey = (String) request.getSession().getAttribute("b2cRequired");
		if(ApiKey=="Yes" || ApiKey.equals("Yes"))
		{
			responseMapObj = storeServiceObj.getStoresList(customerIdStr,emailIdStr,"B2C","-1","10");
		}
		{
			responseMapObj = storeServiceObj.getStoresList(customerIdStr,emailIdStr,location,"-1","10");
		}
		
		

		
		List<CustomerAddress> addressList = new ArrayList<CustomerAddress>(); 
		for(int i = 0;i<10;i++)
			addressList.add(new CustomerAddress());
	
		List<RouteMaster> routeMasterList =genericMasterServiceObj.getRouteMasters(customerIdStr, emailIdStr,0,10,"",false,null,"","","","");
		String timeStamp = new SimpleDateFormat("HH:mm:ss").format(Calendar.getInstance().getTime());
		Date date1=new SimpleDateFormat("HH:mm:ss").parse(timeStamp);
		
		if(routeMasterList!=null)
		{
		for(int i=0;i<routeMasterList.get(0).getRouteList().size();i++){
			Date date2=new SimpleDateFormat("HH:mm:ss").parse(routeMasterList.get(0).getRouteList().get(i).getEndTimeStr());
			if(date2.after(date1))
			{
				startTimeList.add(DateUtil.getTimeIn12HoursFormat(routeMasterList.get(0).getRouteList().get(i).getStartTimeStr()));
				endTimeList.add(DateUtil.getTimeIn12HoursFormat(routeMasterList.get(0).getRouteList().get(i).getEndTimeStr()));
			}	
			
			startTimeList2.add(DateUtil.getTimeIn12HoursFormat(routeMasterList.get(0).getRouteList().get(i).getStartTimeStr()));
			endTimeList2.add(DateUtil.getTimeIn12HoursFormat(routeMasterList.get(0).getRouteList().get(i).getEndTimeStr()));
		
		}
		}
		
		
		modelAndViewObj.addObject("startTimeList",startTimeList);
		modelAndViewObj.addObject("endTimeList",endTimeList);
		modelAndViewObj.addObject("startTimeList2",startTimeList2);
		modelAndViewObj.addObject("endTimeList2",endTimeList2);
		modelAndViewObj.addObject("addressList",addressList);
		modelAndViewObj.addObject("selectedLocation",location);
		modelAndViewObj.addObject("locationsList", locationBeanList);
		modelAndViewObj.addObject("taxDetails", taxDetails);
//		modelAndViewObj.addObject("type", "management");
		modelAndViewObj.addObject("status", status);
		modelAndViewObj.addObject("states", states);

		modelAndViewObj.addObject("storeDetailsList",responseMapObj.get("storeDetailsList"));
		modelAndViewObj.setViewName("Inventory Manager/Orders/newOrder");
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	modelAndViewObj.addObject("flowUnder",flowUnder);
	return modelAndViewObj;
	}
	
	
	/**
	 * @modified by Vinay
	 * @modified Date 03/01/2017
	 *
	 * @return ModelAndView
	 */
	@RequestMapping("/deleteoffers")
	public ModelAndView deleteoffers(@RequestParam("ids") String ids,@RequestParam("location") String location,@RequestParam("type") String type,HttpServletRequest request,HttpServletResponse response){
		// log.info("deleteoffers ");
		List<String> locationsList = null;
		List<Offer> lst_offer = null;
		try{
			int start = 1,end = 10;
			lst_offer = new ArrayList<Offer>();
			modelAndViewObj = new ModelAndView();
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			// log.info(ids + "  " + location);
			String result = offerServiceObj.deleteOffer(customerId,emailId ,ids);
			// log.info(result);
			lst_offer = offerServiceObj.getOffers(customerId,emailId,location,"all","0","10",false,"",null,"","","","");
			locationsList = adminServiceObj.getOutletLocationsList(customerId,emailId,true);
			if(lst_offer == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
//				modelAndViewObj.addObject("err","No Offers Found");
			}else{
				if(lst_offer.size()<10){
					end = (lst_offer.size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(lst_offer.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("offerDetails",lst_offer);
			}
			
			if(result.equals(AppProperties.getAppMessageByProperty("Offer_delete_success").trim()))
			    modelAndViewObj.addObject("success", result);
				else
				modelAndViewObj.addObject("err", result);
			
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("type",type);
			modelAndViewObj.addObject("location",location);
			modelAndViewObj.addObject("maxRecords",10);
		
			modelAndViewObj.setViewName("Deals and Offers/Offers/offers");
			
			}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}


	
	
	
	@RequestMapping(value="/getTaxesForLocation")
	public @ResponseBody List<Tax> getTaxesForLocation(@RequestParam("location")String location,HttpServletRequest request,HttpServletResponse response){
		List<Tax> taxDetails = null;
		try{
		// log.info("editOrder");
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		taxDetails = adminServiceObj.getTaxForLocation(customerIdStr, emailIdStr, location);
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return taxDetails;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to update the existing order Details
	 *
	 **/
	
	@RequestMapping(value="/createOrder",method=RequestMethod.POST)
	public ModelAndView createOrder(@RequestBody Order orderDetails,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("createOrder");
		//////////System.out.println("createOrder");
		Map<String, Object> responseMapObj = null;
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		modelAndViewObj = new ModelAndView();
		JSONArray jsonResponseArray = new JSONArray(orderDetails.getItems());
		List<OrderedItems> itemDetails = new ArrayList<OrderedItems>();
		for (int i=0; i<jsonResponseArray.length(); i++) {
			OrderedItems items = gson.fromJson(jsonResponseArray.getString(i), OrderedItems.class);
			itemDetails.add(items);
		}
		
		JSONArray jsonResponseArrayTaxation = new JSONArray(orderDetails.getTaxationItems());
//		////////System.out.println(jsonResponseArrayTaxation);
		Set<OrderItemTaxes> itemDetailsTaxes = new HashSet<OrderItemTaxes>();
		for (int i=0; i<jsonResponseArrayTaxation.length(); i++) {
			OrderItemTaxes itemsTaxes = gson.fromJson(jsonResponseArrayTaxation.getString(i), OrderItemTaxes.class);
			itemDetailsTaxes.add(itemsTaxes);
		}
		JSONArray jsonResponseArrayTransaction = new JSONArray(orderDetails.getTransactionItems());
		Set<OrderTransactions> itemDetailsTransaction = new HashSet<OrderTransactions>();
		if(orderDetails.getTransactionItems()!=null)
		for (int i=0; i<jsonResponseArrayTransaction.length(); i++) {
			OrderTransactions itemsTransaction = gson.fromJson(jsonResponseArrayTransaction.getString(i), OrderTransactions.class);
			itemDetailsTransaction.add(itemsTransaction);
		}
		
		
	////////System.out.println(orderDetails.getDiscountItems());
		
		JSONArray jsonResponseArrayDiscounts = new JSONArray(orderDetails.getDiscountItems());
		Set<OrderDiscounts> itemDetailsDiscounts = new HashSet<OrderDiscounts>();
		for (int i=0; i<jsonResponseArrayDiscounts.length(); i++) {
			OrderDiscounts itemsDiscounts = gson.fromJson(jsonResponseArrayDiscounts.getString(i), OrderDiscounts.class);
//			if(itemsDiscounts.getDiscountPrice()==)
			itemDetailsDiscounts.add(itemsDiscounts);
		}
				
		
		orderDetails.setOrderItemTaxesList(itemDetailsTaxes);
		orderDetails.setItemDetails(itemDetails);
		orderDetails.setOrderTransactions(itemDetailsTransaction);
		orderDetails.setOrderDiscountsList(itemDetailsDiscounts);
		String resultStr = orderServiceObj.createOrder(orderDetails,customerIdStr,emailIdStr);
		
		List<CustomerAddress> addressList = new ArrayList<CustomerAddress>();
		if(!resultStr.equals(AppProperties.getAppMessageByProperty("ORDER_CREATE_SUCCESS").trim())){
			modelAndViewObj.addObject("err", resultStr);
			jsonResponseArray = new JSONArray(orderDetails.getAddress());
			for (int i=0; i<jsonResponseArray.length(); i++) {
				CustomerAddress customerAddressObj = gson.fromJson(jsonResponseArray.getString(i), CustomerAddress.class);
				addressList.add(customerAddressObj);
			}
			for(int i = jsonResponseArray.length(); i < 5; i++)
				addressList.add(new CustomerAddress());
		
			modelAndViewObj.addObject("orderDetails",orderDetails);
		}else{
			for(int i = 1; i<5;i++)
				addressList.add(new CustomerAddress());
			modelAndViewObj.addObject("success", resultStr);
		}
		ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
//		List<String> locationsList = null; 
//		if(type.equals("management"))
//			locationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr);
		/*if(flowUnder.equals("outlet"))
			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr);
		else
			locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr);*/
		String location = (String) request.getSession().getAttribute("selectedLocation");
		if(location == null && locationBeanList != null)
			location = locationBeanList.get(0).getLocationId();
		
		
		States states = genericMasterServiceObj.getStates();
		modelAndViewObj.addObject("states", states);
		
		String ApiKey = (String) request.getSession().getAttribute("b2cRequired");
		if(ApiKey=="Yes" || ApiKey.equals("Yes"))
		{
			responseMapObj = storeServiceObj.getStoresList(customerIdStr,emailIdStr,"B2C","-1","10");
		}
		{
			responseMapObj = storeServiceObj.getStoresList(customerIdStr,emailIdStr,orderDetails.getSaleLocation(),"-1","10");
		}
		modelAndViewObj.addObject("storeDetailsList",responseMapObj.get("storeDetailsList"));
		
//		List<Tax> taxDetails = adminServiceObj.getTaxForLocation(customerIdStr, emailIdStr, location);
		modelAndViewObj.addObject("addressList",addressList);
		modelAndViewObj.addObject("selectedLocation",orderDetails.getSaleLocation());
		modelAndViewObj.addObject("locationsList", locationBeanList);
//		modelAndViewObj.addObject("taxDetails", taxDetails);
//		modelAndViewObj.addObject("type", "management");
		modelAndViewObj.addObject("status",orderDetails.getSelectedStatus());
		modelAndViewObj.setViewName("Inventory Manager/Orders/newOrder");
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	modelAndViewObj.addObject("flowUnder",orderDetails.getFlowUnder());
	return modelAndViewObj;
}
	
	
	/*@author: vijay
	* Created On: 11-12-2017
	* Desc: to get all the outlet products*/
	@RequestMapping("/getallStockRequestProductsByCriteria")
	public @ResponseBody List<Sku> getallStockRequestProductsByCriteria(@RequestParam("category") String category, @RequestParam("subCategory") String subCategory,@RequestParam("index") String index,@RequestParam("storeLocation") String storeLocation,@RequestParam("Brand") String Brand,HttpServletRequest request,HttpServletResponse response){
			// log.info("getProductsByCriteria");
			SkuId skuResponse =new SkuId();
			try {
				if(request.getSession().getAttribute("skuResponse")==null){
					skuResponse = skuServiceObj.getallStockRequestProductsByCriteria(index,storeLocation,category,subCategory,Brand);
					request.getSession().setAttribute("skuResponse", skuResponse);
				}

				else
					skuResponse = skuServiceObj.getallStockRequestProductsByCriteria(index,storeLocation,category,subCategory,Brand);
				
		}catch(Exception exception){
			exception.printStackTrace();
		}
			
		return skuResponse.getSkuList();
	}
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to view the Order Details based on the given OrderId and allows the user to edit the details
	 *
	 **/
	
	@RequestMapping(value="/editOrder",method=RequestMethod.POST)
	public ModelAndView editOrder(@RequestParam("orderId") String orderId,@RequestParam("flowUnder") String flowUnder,@RequestParam("status") String status,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("editOrder");
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		/*JSONArray jsonResponseArray = new JSONArray(orderDetails.getItems());
		List<OrderedItems> itemDetails = new ArrayList<OrderedItems>();
		for (int i=0; i<jsonResponseArray.length(); i++) {
			OrderedItems items = gson.fromJson(jsonResponseArray.getString(i), OrderedItems.class);
			itemDetails.add(items);
		}
		orderDetails.setItemDetails(itemDetails);*/
		ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
		Order orderDetails = new Order();
//		orderDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr, emailIdStr));
		orderDetails.setStartIndex(Constants.PAGINATION_START_INDEX);
		orderDetails.setOrderId(orderId);
		orderDetails = orderServiceObj.getOrderDetailsByLocation(orderDetails);
//		List<String> locationsList = null; 
//		if(type.equals("management"))
//			locationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr);
		/*if(flowUnder.equals("outlet"))
			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr);
		else
			locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr);*/
		List<Tax> taxDetails = adminServiceObj.getTaxForLocation(customerIdStr, emailIdStr, orderDetails.getSaleLocation());
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("locationsList", locationBeanList);
		modelAndViewObj.addObject("taxDetails", taxDetails);
		modelAndViewObj.addObject("orderDetails",orderDetails);
		modelAndViewObj.addObject("orderItemTaxesSize",orderDetails.getOrderItemTaxesList().size());
//////////System.out.println("size"+orderDetails.getOrderItemTaxesList().size());
//		modelAndViewObj.addObject("type", "management");
		/*if(orderDetails.getOperation().equalsIgnoreCase("Door Delivery")){
			modelAndViewObj.setViewName("Inventory Manager/Deliveries/editDeliveryDetails");
		}else{*/
		modelAndViewObj.addObject("status",status);
			modelAndViewObj.setViewName("Inventory Manager/Orders/editOrderDetails");
//		}
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	modelAndViewObj.addObject("flowUnder",flowUnder);
	return modelAndViewObj;
	}
	
	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to update the existing order Details
	 *
	 **/
	
	@RequestMapping(value="/updateOrder",method=RequestMethod.POST)
	public ModelAndView updateOrder(@RequestBody Order orderDetails,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("updateOrder");
//		////////System.out.println("dgdfg");
		Map<String, Object> responseMapObj = null;
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		List<String> startTimeList  = new ArrayList<String>();
		List<String> endTimeList  = new ArrayList<String>();
		modelAndViewObj = new ModelAndView();
		JSONArray jsonResponseArray = new JSONArray(orderDetails.getItems());
		List<OrderedItems> itemDetails = new ArrayList<OrderedItems>();
		for (int i=0; i<jsonResponseArray.length(); i++) {
			OrderedItems items = gson.fromJson(jsonResponseArray.getString(i), OrderedItems.class);
			itemDetails.add(items);
		}
		
		JSONArray jsonResponseArrayTaxation = new JSONArray(orderDetails.getTaxationItems());
//		////////System.out.println(jsonResponseArrayTaxation);
		Set<OrderItemTaxes> itemDetailsTaxes = new HashSet<OrderItemTaxes>();
		for (int i=0; i<jsonResponseArrayTaxation.length(); i++) {
			OrderItemTaxes itemsTaxes = gson.fromJson(jsonResponseArrayTaxation.getString(i), OrderItemTaxes.class);
			itemDetailsTaxes.add(itemsTaxes);
		}
		
		JSONArray jsonResponseArrayTransaction = new JSONArray(orderDetails.getTransactionItems());
		Set<OrderTransactions> itemDetailsTransaction = new HashSet<OrderTransactions>();
		for (int i=0; i<jsonResponseArrayTransaction.length(); i++) {
			OrderTransactions itemsTransaction = gson.fromJson(jsonResponseArrayTransaction.getString(i), OrderTransactions.class);
			itemDetailsTransaction.add(itemsTransaction);
		}
		
		JSONArray jsonResponseArrayDiscounts = new JSONArray(orderDetails.getDiscountItems());
		Set<OrderDiscounts> itemDetailsDiscounts = new HashSet<OrderDiscounts>();
		for (int i=0; i<jsonResponseArrayDiscounts.length(); i++) {
			OrderDiscounts itemsDiscounts = gson.fromJson(jsonResponseArrayDiscounts.getString(i), OrderDiscounts.class);
			itemDetailsDiscounts.add(itemsDiscounts);
		}
		
		orderDetails.setOrderItemTaxesList(itemDetailsTaxes);
		orderDetails.setOrderTransactions(itemDetailsTransaction);
		orderDetails.setItemDetails(itemDetails);
		orderDetails.setOrderDiscountsList(itemDetailsDiscounts);
		
		
		String result = orderServiceObj.updateOrder(orderDetails,customerIdStr,emailIdStr);
//		List<String> locationsList = null; 
//		if(type.equals("management"))
//			locationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr);
		/*if(flowUnder.equals("outlet"))
			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr);
		else
			locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr);*/
		String orderId = orderDetails.getOrderId();
		String viewOrEdit = orderDetails.getViewOrEdit();
		modelAndViewObj.addObject("flowUnder",orderDetails.getFlowUnder());
//		modelAndViewObj.addObject("status",orderDetails.getSelectedStatus());
		modelAndViewObj.addObject("maxRecords",orderDetails.getMaxRecords());
//		////////System.out.println(orderDetails.getMaxRecords());
		orderDetails = new Order();
		orderDetails.setViewOrEdit(viewOrEdit);
		orderDetails.setStartIndex(Constants.PAGINATION_START_INDEX);
		orderDetails.setOrderId(orderId);
		orderDetails = orderServiceObj.getOrderDetailsByLocation(orderDetails);
		ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
//		List<Tax> taxDetails = adminServiceObj.getTaxForLocation(customerIdStr, emailIdStr, orderDetails.getSaleLocation());
		
		List<RouteMaster> routeMasterList =genericMasterServiceObj.getRouteMasters(customerIdStr, emailIdStr,0,10,"",false,null,"","","","");
		if(routeMasterList != null){
		for(int i=0;i<routeMasterList.get(0).getRouteList().size();i++){
			startTimeList.add(DateUtil.getTimeIn12HoursFormat(routeMasterList.get(0).getRouteList().get(i).getStartTimeStr()));
			endTimeList.add(DateUtil.getTimeIn12HoursFormat(routeMasterList.get(0).getRouteList().get(i).getEndTimeStr()));
			}
		}
		
		States states = genericMasterServiceObj.getStates();
		modelAndViewObj.addObject("states",states);

		modelAndViewObj.addObject("locationsList", locationBeanList);
		modelAndViewObj.addObject("startTimeList", startTimeList);
		modelAndViewObj.addObject("endTimeList", endTimeList);
//		modelAndViewObj.addObject("taxDetails", taxDetails);
	//	modelAndViewObj.addObject("err", result);
		modelAndViewObj.addObject("orderDetails",orderDetails);
		modelAndViewObj.addObject("maxRecords",orderDetails.getMaxRecords());
		modelAndViewObj.addObject("type", "management");
		modelAndViewObj.addObject("addressList",orderDetails.getAddressList());
		
		String ApiKey = (String) request.getSession().getAttribute("b2cRequired");
		if(ApiKey=="Yes" || ApiKey.equals("Yes"))
		{
			responseMapObj = storeServiceObj.getStoresList(customerIdStr,emailIdStr,"B2C","-1","10");
		}
		{
			responseMapObj = storeServiceObj.getStoresList(customerIdStr,emailIdStr,orderDetails.getSaleLocation(),"-1","10");
		}
		modelAndViewObj.addObject("storeDetailsList",responseMapObj.get("storeDetailsList"));
		
		if(!result.equals(AppProperties.getAppMessageByProperty("ORDER_UPDATE_SUCCESS").trim()))
			modelAndViewObj.addObject("err", result);
		else
			modelAndViewObj.addObject("success", result);
		
		if(orderDetails.getViewOrEdit() != null && orderDetails.getViewOrEdit().equals("edit"))
			modelAndViewObj.setViewName("Inventory Manager/Orders/editOrderDetails");
		else
			modelAndViewObj.setViewName("Inventory Manager/Orders/orderdetails");
//		}
	}
	catch(Exception exception){
		exception.printStackTrace();
	}

	return modelAndViewObj;
}
	@RequestMapping("/getOrdersByLocation")
	public @ResponseBody ModelAndView getOrdersByLocation(@RequestParam("location")String location,@RequestParam("operation")String operation,@RequestParam("status")String status,@RequestParam("index")String index,@RequestParam("type")String type,@RequestParam("flowUnder") String flowUnder,HttpServletRequest request,HttpServletResponse response){
		
		/**
		 * Developed By : Sambaiah Y
		 * Created On   : 27-04-2015
		 * Modified By  : 
		 *This method is used to get the orders based on the type and location from services
		 *This method interacts with order services to get the orders
		 * 
		 */
		// log.info("InventoryManagerController - getOrdersByLocation()");
		OrderDetails orderDetails = new OrderDetails();
		List<OrderDetails> lst_orders = null;
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		int start = 1,end = 10;
		try {
//			orderDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr, emailIdStr));
			orderDetails.setStartIndex(index);
			List<String> locationsList = null; 
			String flow = "";
			if(type.equals("management")){
				flow = "all";				
				locationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr,true);
			}
			else if(flowUnder.equals("outlet")){
				flow = "outlet";
				locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			}
			else{
				flow = "warehouse";
				locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
			}
			modelAndViewObj = new ModelAndView();
			if(locationsList==null || locationsList.size() == 0){
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			}else{
				modelAndViewObj.addObject("locationsList", locationsList);
				lst_orders = orderServiceObj.getOrdersByLocation("",operation,status,orderDetails,location,index,false,"","","10",flow,false,"","","","","false");
				if(location != null && !location.equals(""))
					request.getSession().setAttribute("selectedLocation", location);
				if(lst_orders == null){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(lst_orders.size()<10){
						end = (lst_orders.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(lst_orders.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
				}
				modelAndViewObj.addObject("orderDetails",lst_orders);
				modelAndViewObj.addObject("selectedLocation",location);
				modelAndViewObj.addObject("status",status);
				modelAndViewObj.addObject("type",type);
				/*if(operation.equalsIgnoreCase("Door Delivery")){
					modelAndViewObj.setViewName("Inventory Manager/Deliveries/viewdeliveries");
				}else{*/
				modelAndViewObj.setViewName("Inventory Manager/Orders/viewOrders");
//				}
			}
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("type",type);
			/*if(operation.equalsIgnoreCase("Door Delivery")){
				modelAndViewObj.setViewName("Inventory Manager/Deliveries/viewdeliveries");
			}else{*/
			modelAndViewObj.setViewName("Inventory Manager/Orders/viewOrders");
//			}
		}
		modelAndViewObj.addObject("flowUnder",flowUnder);
		modelAndViewObj.addObject("maxRecords","10");
		return modelAndViewObj;
	}
	
	@RequestMapping("/getOrderDetails")
	public @ResponseBody ModelAndView getOrderDetails(@RequestParam("orderId")String orderId,@RequestParam("operation")String operation,@RequestParam("type")String type,@RequestParam("flowUnder") String flowUnder,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,@RequestParam("status") String status,@RequestParam("viewOrEdit") String viewOrEdit,HttpServletRequest request,HttpServletResponse response){
		
		/**
		 * Developed By : Sambaiah Y
		 * Created On   : 27-04-2015
		 * Modified By  : 
		 *This method is used to get the specific order details from services
		 *This method interacts with order services to get the orders
		 * 
		 */
		
		// log.info("InventoryManagerController - getOrderDetails()");
		Order orderDetails = new Order();
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		List<String> startTimeList  = new ArrayList<String>();
		List<String> endTimeList  = new ArrayList<String>();
		Map<String, Object> responseMapObj = null;
		try {
//			orderDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr, emailIdStr));
			orderDetails.setStartIndex(Constants.PAGINATION_START_INDEX);
			orderDetails.setOrderId(orderId);
			orderDetails = orderServiceObj.getOrderDetailsByLocation(orderDetails);
			
			//////System.out.println(gson.toJson(orderDetails));
			modelAndViewObj = new ModelAndView();
			
			States states = genericMasterServiceObj.getStates();

			List<EmployeeBean> employeeList = genericMasterServiceObj.getEmployees("",customerIdStr, emailIdStr,"-1","","",false,"");
			if(employeeList != null && employeeList.size()>0)
				modelAndViewObj.addObject("employeeList",employeeList);
			
			if(employeeList==null || employeeList.size()==0 || employeeList.isEmpty()){
				employeeList = genericMasterServiceObj.getEmployees("",customerIdStr, emailIdStr,"-1","","",false,"");
				request.getSession().setAttribute("employeeList", employeeList);
			}
			
			
			ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
			List<Tax> taxDetails = adminServiceObj.getTaxForLocation(customerIdStr, emailIdStr, orderDetails.getSaleLocation());
			
			String ApiKey = (String) request.getSession().getAttribute("b2cRequired");
			if(ApiKey=="Yes" || ApiKey.equals("Yes"))
			{
				responseMapObj = storeServiceObj.getStoresList(customerIdStr,emailIdStr,"B2C","-1","10");
			}
			{
				responseMapObj = storeServiceObj.getStoresList(customerIdStr,emailIdStr,orderDetails.getSaleLocation(),"-1","10");
			}
			
			
			
			
			List<RouteMaster> routeMasterList =genericMasterServiceObj.getRouteMasters(customerIdStr, emailIdStr,0,10,"",false,null,"","","","");
			if(routeMasterList!= null){
			for(int i=0;i<routeMasterList.get(0).getRouteList().size();i++){
				startTimeList.add(DateUtil.getTimeIn12HoursFormat(routeMasterList.get(0).getRouteList().get(i).getStartTimeStr()));
				endTimeList.add(DateUtil.getTimeIn12HoursFormat(routeMasterList.get(0).getRouteList().get(i).getEndTimeStr()));
			}
			}
			
			if(orderDetails.getAddressList() != null){
			for(int i=0;i<orderDetails.getAddressList().size();i++){
				if(orderDetails.getShipement_address_location().equalsIgnoreCase(orderDetails.getAddressList().get(i).getLocality())){
					orderDetails.setInstructions(orderDetails.getAddressList().get(i).getInstructions());
				}
			}
			}
			//Added by Surya.K on 20/08/2019
			if(orderDetails.getConfirmedSlotStartTime()==null){
				orderDetails.setConfirmedSlotStartTime(orderDetails.getDeliverySlotStartTime());
			}
			if(orderDetails.getConfirmedSlotEndTime()==null){
				orderDetails.setConfirmedSlotEndTime(orderDetails.getDeliverySlotEndTime());
			}
//			// log.info(orderDetails.getItemDetails().size());
			modelAndViewObj.addObject("locationsList", locationBeanList);
			modelAndViewObj.addObject("orderDetails",orderDetails);
			modelAndViewObj.addObject("startTimeList",startTimeList);
			modelAndViewObj.addObject("endTimeList",endTimeList);
			modelAndViewObj.addObject("taxDetails", taxDetails);
			modelAndViewObj.addObject("type", type);
			modelAndViewObj.addObject("status",status);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);
			modelAndViewObj.addObject("states",states);

			
			/*if(operation.equalsIgnoreCase("Door Delivery")){
				modelAndViewObj.setViewName("Inventory Manager/Deliveries/ViewDeliveryDetails");
			}else{*/
			if(viewOrEdit.equals("view"))
			{
				modelAndViewObj.setViewName("Inventory Manager/Orders/orderdetails");
				modelAndViewObj.addObject("addressList",orderDetails.getAddressList());
				
			}
			else{
				/*List<CustomerAddress> addressList = new ArrayList<CustomerAddress>();
				if(orderDetails.getMobile_num() != null){
					String[] mobileNumber = orderDetails.getMobile_num().split("-");
					if(mobileNumber.length == 2)
						mobileNumber[0] = mobileNumber[1];
					Customer custDetails=masterServiceObj.getCustomerDetails(mobileNumber[0], "", false);
					CustomerAddress customerAddressObj = new CustomerAddress();
					customerAddressObj.setCity(orderDetails.getShipement_address_city());
					customerAddressObj.setCountry(orderDetails.getShipmentContact());
					customerAddressObj.setDoorNumber(orderDetails.getShipement_address_doorNo());
					customerAddressObj.setLocality(orderDetails.getShipement_address_location());
					customerAddressObj.setShipmentContact(orderDetails.getShipmentContact());
					customerAddressObj.setShipmentName(orderDetails.getShipmentName());
					customerAddressObj.setState(orderDetails.getShipement_address_street());
					customerAddressObj.setStreetName(orderDetails.getShipement_address_street());
					addressList.add(customerAddressObj);
					if(custDetails.getAddressList() != null && custDetails.getAddressList().size() >0){
						int addressLength = custDetails.getAddressList().size(); 
						for(int i = 1; i<addressLength;i++){
							if(customerAddressObj.equals(custDetails.getAddressList().get(i))){
								addressList.get(0).setLatitude(custDetails.getAddressList().get(i).getLatitude());
								addressList.get(0).setLongitude(custDetails.getAddressList().get(i).getLongitude());
							}
							else
								addressList.add(custDetails.getAddressList().get(i));
						}
						for(int i = addressLength; i < 5; i++)
							addressList.add(new CustomerAddress());
					}else{
						for(int i = 1; i<5;i++)
							addressList.add(new CustomerAddress());
					}
				}else{
					for(int i = 1; i<5;i++)
						addressList.add(new CustomerAddress());
				}*/
				modelAndViewObj.addObject("addressList",orderDetails.getAddressList());
				modelAndViewObj.addObject("storeDetailsList",responseMapObj.get("storeDetailsList"));
				modelAndViewObj.addObject("orderItemTaxesSize",orderDetails.getOrderItemTaxesList().size());
				modelAndViewObj.setViewName("Inventory Manager/Orders/editOrderDetails");
			}
//			}
		}catch(Exception e){
			e.printStackTrace();
			/*if(operation.equalsIgnoreCase("Door Delivery")){
				modelAndViewObj.setViewName("Inventory Manager/Deliveries/ViewDeliveryDetails");
			}else{*/
				modelAndViewObj.setViewName("Inventory Manager/Orders/orderdetails");
//			}
		}
		modelAndViewObj.addObject("flowUnder",flowUnder);
		return modelAndViewObj;
	}
	
	

	
	/*@RequestMapping("/viewNewOutletShipment")
	public ModelAndView viewNewOutletShipment(@RequestParam("flowUnder") String flowUnder,@RequestParam("type") String type,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewNewOutletShipment ");
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<String> locationsList = null;
			if(type.equals("management"))
				locationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr,false);
			else if(flowUnder.equals("outlet"))
				locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
			else
				locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,false);
			modelAndViewObj.addObject("locationsList", locationsList);
			List<String> orderIdList = orderServiceObj.getWarehouseOrderIds(customerIdStr, emailIdStr,locationsList.get(0));
			OrderDetails orderDetails = new OrderDetails();
			orderDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr, emailIdStr));
			orderDetails.setStartIndex(Constants.PAGINATION_START_INDEX);
			orderDetails.setOrderId(orderIdList.get(0));
			orderDetails = orderServiceObj.getWarehouseOrderDetailsByLocation(orderDetails);
			modelAndViewObj.addObject("orderIdList",orderIdList);
			modelAndViewObj.addObject("orderDetails",orderDetails);
			modelAndViewObj.setViewName("Inventory Manager/warehouse/shipments/newShipment");
		}
		catch(Exception exception){
			exception.printStackTrace();
			modelAndViewObj.addObject("err", "No Orders for Shipment");
			modelAndViewObj.setViewName("Inventory Manager/warehouse/shipments/newShipment");
		}
		modelAndViewObj.addObject("flowUnder", flowUnder);
		modelAndViewObj.addObject("type", type);
		return modelAndViewObj;
	}*/
	/*Billing billDetails = new Billing();
	@RequestMapping("/getBills")
	public @ResponseBody ModelAndView getBills(@RequestParam("startDate")String startDate,@RequestParam("endDate") String endDate,@RequestParam("location")String location,@RequestParam("status")String status,@RequestParam("index") String index,@RequestParam("maxRecords")String maxRecords,@RequestParam("order")String order,@RequestParam("orderBy")String orderBy,HttpServletRequest request,HttpServletResponse response){
		
		*//**
		 * Developed By : Sambaiah Y
		 * Created On   : 30-04-2015
		 * Modified By  : 
		 * This method is used to get the billings from the services
		 * This method interacts with bills service to get billing details 
		 * 
		 *//*
		
		// log.info("InventoryManagerController - getBills()");
		int start = 1,end = Integer.parseInt(maxRecords);
		//Billing billDetails = new Billing();
		List<String> locationsList = null;
		List<Billing> lst_bills = null;
		List<String> countersList = null;
		
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		try {
//			billDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr, emailIdStr));
			billDetails.setStartIndex(index);
			billDetails.setMaxRecords(maxRecords);
			billDetails.setOrder(order);
			billDetails.setOrderBy(orderBy);
			billDetails.setStartDate(startDate);
			
			
			startDate=billDetails.getReportDate();
			if (startDate != "")
				billDetails.setReportDate(startDate);
			
			endDate=billDetails.getReportEndDate();
			if (endDate != "")
				billDetails.setReportEndDate(endDate);
			
			
			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			countersList = reportsServiceObj.getCounters(location,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			request.getSession().setAttribute("selectedLocation",location);
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,index);
				request.getSession().setAttribute("zoneList", zoneList);
			}
			
			
			
			List<Department> departmentList =(List<Department>)request.getSession().getAttribute("departmentList");
			if(departmentList==null || departmentList.size()==0 || departmentList.isEmpty()){
				departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerIdStr, emailIdStr,index,false);
				request.getSession().setAttribute("departmentList", departmentList);
			}
			List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
			if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
				categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
				request.getSession().setAttribute("categoryList", categoryList);
			}
			List<ProductSubCategoryBean> subCategoryDetailsList =(List<ProductSubCategoryBean>)request.getSession().getAttribute("subCategoryDetailsList");
			if(subCategoryDetailsList==null || subCategoryDetailsList.size()==0 || subCategoryDetailsList.isEmpty()){
				subCategoryDetailsList = outletMasterServiceObj.getSubCategoryDetails("",customerIdStr, emailIdStr,"-1",false);
				request.getSession().setAttribute("subCategoryDetailsList", subCategoryDetailsList);
			}
			List<String> brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
		
			if(location.equals("all")){
			location = (String)request.getSession().getAttribute("selectedLocation");
			if(location == null && locationsList != null && locationsList.size()>0)
				location = locationsList.get(0);
		}
			
			
			if(location != null && !location.equals(""))
				request.getSession().setAttribute("selectedLocation",location);
		modelAndViewObj = new ModelAndView();
		if(locationsList.size()==0 && locationsList==null){
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
		}else{
			modelAndViewObj.addObject("locationsList", locationsList);
			lst_bills = billServiceObj.getBills(billDetails,location,status);
			
			
			
			if(lst_bills == null || lst_bills.size() == 0)
			{
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}
			else
			{
				if(lst_bills.size()<Integer.parseInt(maxRecords))
				{
					end = (lst_bills.size())+(Integer.parseInt(index));
				}else
				{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(lst_bills.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			
				modelAndViewObj.addObject("startDate", startDate);
				modelAndViewObj.addObject("endDate", endDate);
			}
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
			modelAndViewObj.addObject("billDetails",lst_bills);
			modelAndViewObj.addObject("selectedLocation",location);
			modelAndViewObj.addObject("status", status);
			modelAndViewObj.addObject("countersList", countersList);
			modelAndViewObj.addObject("brandsList", brandsList); 
			modelAndViewObj.addObject("zoneList", zoneList);
			modelAndViewObj.addObject("startDate", startdate);
			modelAndViewObj.addObject("categoryList", categoryList);
			modelAndViewObj.setViewName("Inventory Manager/Billing/billings");
//		}
		}catch(Exception e){
			e.printStackTrace();
			lst_bills = new ArrayList<Billing>();
			modelAndViewObj.setViewName("Inventory Manager/Billing/billings");
		}
		return modelAndViewObj;
	}
	
	@RequestMapping("/searchBills")
	public @ResponseBody ModelAndView searchBills(@RequestParam("saveFlag")Boolean saveFlag,@RequestParam("searchName")String searchName,@RequestParam("index")String index,
		  @RequestParam("location") String location,@RequestParam("maxRecords")String maxRecords,@RequestParam("startDate")String startDate,
		  @RequestParam("endDate")String endDate,
		  @RequestParam("zone")String zone,
		  @RequestParam("category")String category,
		  @RequestParam("subcategory")String subcategory,
		  @RequestParam("brand")String brand,
		  @RequestParam("counterId")String counterId,
		 
		  @RequestParam("status")String status,
		  HttpServletRequest request,HttpServletResponse response){
		// log.info("searchBills");
		int start = 1,end = Integer.parseInt(maxRecords);
		//Billing billDetails = new Billing();
		List<String> locationsList = null;
		List<Billing> billsList = null;
		
		List<String> countersList = null;
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		try {
//			billDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr, emailIdStr));
			billDetails.setSearchCriteria(searchName);
			billDetails.setStartIndex(index);
			billDetails.setStore_location(location);
			billDetails.setCategory(category);
			billDetails.setSubCategory(subcategory);
			billDetails.setBrand(brand);
			billDetails.setCounterId(counterId);
			billDetails.setZoneId(zone);
			billDetails.setMaxRecords(maxRecords);
			billDetails.setSaveReportFlag(saveFlag);
			if(startDate != "")
				billDetails.setReportDate(startDate+" 00:00:00");
			if(endDate != "")
				billDetails.setReportEndDate(endDate+" 00:00:00");
			billDetails.setStatus(status);
			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			request.getSession().setAttribute("selectedLocation",location);
			List<String> brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
			countersList = reportsServiceObj.getCounters(location,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("locationsList", locationsList);
			billsList = billServiceObj.searchBills(billDetails,status);
			if(billsList == null || billsList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}
			else{
				if(billsList.size()<Integer.parseInt(maxRecords))
					end = (billsList.size())+(Integer.parseInt(index));
				else
					end = (Integer.parseInt(index)+end);
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(billsList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			if(saveFlag){
				if(billsList.get(0).getSearchBillsFilePath()!=null)
				modelAndViewObj.addObject("downloadurl",billsList.get(0).getSearchBillsFilePath());
			}
			modelAndViewObj.addObject("searchName", searchName);
			modelAndViewObj.addObject("startDate", startDate);
			modelAndViewObj.addObject("endDate", endDate);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
			modelAndViewObj.addObject("billDetails",billsList);
			modelAndViewObj.addObject("selectedLocation",location);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("brandsList", brandsList);
			modelAndViewObj.addObject("countersList", countersList);
			modelAndViewObj.addObject("category", category);
			modelAndViewObj.addObject("subcategory", subcategory);
			modelAndViewObj.addObject("brand", brand);
			
			modelAndViewObj.addObject("counterId", counterId);
			modelAndViewObj.setViewName("Inventory Manager/Billing/billings");
		}catch(Exception e){
			e.printStackTrace();
			billsList = new ArrayList<Billing>();
			modelAndViewObj.setViewName("Inventory Manager/Billing/billings");
		}
		return modelAndViewObj;
	}*/
	
	
	
	/*
	 * manasa*/
	
	@RequestMapping("/viewMCNBillDetails")
	public ModelAndView viewMCNBillDetails(@RequestParam("location") String location,@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,@RequestParam("creditNoteRef") String creditNoteRef, @RequestParam("maxRecords") String maxRecords,@RequestParam("searchName")String searchName,@RequestParam("operation") String operation,@RequestParam("zone") String zone, HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("editCategory ");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
//			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails(categoryName,customerIdStr, emailIdStr,"0","");
			WarehouseReport WarehouseReportObj = reportsServiceObj.getSaleCreditNoteReportByBillId(creditNoteRef,"0",maxRecords,"");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("warehouseReportObj", WarehouseReportObj);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);
			modelAndViewObj.addObject("location",location);
			modelAndViewObj.addObject("startDate",startDate);
			modelAndViewObj.addObject("endDate",endDate);
			modelAndViewObj.addObject("zone",zone);
			modelAndViewObj.addObject("operation",operation);
			if(operation.equals("view"))
				modelAndViewObj.setViewName("Inventory Manager/Billing/editMCNDetails");
			else	
				modelAndViewObj.setViewName("Inventory Manager/Billing/editMCNDetails");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	
	@RequestMapping(value = "/viewBill",method = RequestMethod.GET)
	public ModelAndView viewBill(HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("View Specific Outlet Details");
			modelAndViewObj = new ModelAndView();
			Billing bill = billServiceObj.getBillHtml(request.getParameter("billid"), request.getParameter("customerId"));
			if(bill!=null)	
			modelAndViewObj.addObject("content",bill.getHtmlContent());
			modelAndViewObj.setViewName("Inventory Manager/Billing/customerInvoice");
	
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allstoredetails");
		}
		
		return modelAndViewObj;
	}


	
	
	/**
	 * Developed By : Sambaiah Y Created On : 30-04-2015 Modified By : This
	 * method is used to get the billings from the services This method
	 * interacts with bills service to get billing details
	 * 
	 */
	@RequestMapping("/getBills")
	public @ResponseBody ModelAndView getBills(@RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate, @RequestParam("location") String location,
			@RequestParam("status") String status, @RequestParam("index") String index,
			@RequestParam("maxRecords") String maxRecords, @RequestParam("order") String order,@RequestParam("tester") String tester,
			@RequestParam("orderBy") String orderBy,@RequestParam("category") String category,@RequestParam("subCategory") String subCategory,@RequestParam("counterId") String counterId,@RequestParam("brand") String brand,@RequestParam("location") String outletlocation,@RequestParam("zone") String zone,@RequestParam("flowLocation") String flowLocation,HttpServletRequest request, HttpServletResponse response) {
		// log.info("InventoryManagerController - getBills()");
		int start = 1, end = Integer.parseInt(maxRecords);
		Billing billDetails = new Billing();
		//List<String> locationsListValue = null;
		List<String> locationsListValue=new ArrayList<String>();
		String locationListAll="";
		List<Billing> lst_bills = null;
		ArrayList<LocationBean> locationBeansList = null;
		WarehouseCounterResponse counterDetails = null;
		
		List<String> countersList = null;
		String customerIdStr = (String) request.getSession().getAttribute("customerId");
		String emailIdStr = (String) request.getSession().getAttribute("emailId");
		////////System.out.println("getbills");
		try {
			billDetails.setStartIndex(index);
			billDetails.setMaxRecords(maxRecords);
			billDetails.setOrder(order);
			billDetails.setOrderBy(orderBy);
			
			billDetails.setCounterId(counterId);
			billDetails.setCategory(category);
			billDetails.setSubCategory(subCategory);
			billDetails.setBrand(brand);
			billDetails.setZoneId(zone);
//			billDetails.setStore_location(outletlocation);
			if (startDate != "")
				billDetails.setReportDate(startDate+" 00:00:00");
			if (endDate != "")
				billDetails.setReportEndDate(endDate+" 00:00:00");
			locationsListValue=new ArrayList<String>();
//			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr, emailIdStr, true);
			
			if(flowLocation.equals("warehouse") ||flowLocation ==  "warehouse" ){
				 counterDetails = adminServiceObj.getWhCounters("",location,customerIdStr,emailIdStr,index,false,"100");

				
			}else{
			countersList = reportsServiceObj.getCounters(location, customerIdStr, emailIdStr,Constants.PAGINATION_START_INDEX);
			}



			
			
			
			
			//countersList = reportsServiceObj.getCounters(location, customerIdStr, emailIdStr,Constants.PAGINATION_START_INDEX);
			//locationsListValue = adminServiceObj.getOutletLocationsList(customerIdStr, emailIdStr, true);
		
			
			if(flowLocation.equals("warehouse") ||flowLocation ==  "warehouse" ){
				locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
			}else{
				locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);

			}
			
			request.getSession().setAttribute("selectedLocation", location);
			
			List<ZoneMaster> zoneList = (List<ZoneMaster>) request.getSession().getAttribute("zoneList");
			if (zoneList == null || zoneList.size() == 0 || zoneList.isEmpty()) {
				zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr, index,"","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			List<ProductCategoryBean> categoryList = (List<ProductCategoryBean>) request.getSession().getAttribute("categoryList");
			if (categoryList == null || categoryList.size() == 0 || categoryList.isEmpty()) {
				categoryList = outletMasterServiceObj.getCategoryDetails("", customerIdStr, emailIdStr, "-1");
				request.getSession().setAttribute("categoryList", categoryList);
			}
			List<ProductSubCategoryBean> subCategoryDetailsList = (List<ProductSubCategoryBean>) request.getSession().getAttribute("subCategoryDetailsList");
			if (subCategoryDetailsList == null || subCategoryDetailsList.size() == 0 || subCategoryDetailsList.isEmpty()) {
				subCategoryDetailsList = outletMasterServiceObj.getSubCategoryDetails("", customerIdStr, emailIdStr, "-1","",false);
				request.getSession().setAttribute("subCategoryDetailsList", subCategoryDetailsList);
			}
//			List<String> brandsList = adminServiceObj.getBrandNamesList(customerIdStr, emailIdStr);
			List<String> brandsList = (List<String>)request.getSession().getAttribute("brandsList");
			
			if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
			 brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
				request.getSession().setAttribute("brandsList", brandsList);
			}
			
			
			
			
//			Added by vijay, to make default loaction as location list first occurrence, if location is empty
			/*if((location.trim()).equals(null) || location.trim().isEmpty())
			{
				location = locationBeansList.get(0).getLocationId();
			}*/
			if (location.equals("all") || location.equals("")) {
				/*
				 * if(locationBeansList != null){ for(int i=0;i<locationBeansList.size();i++){
				 * locationsListValue.add(locationBeansList.get(i).getLocationId());
				 * 
				 * } }
				 * 
				 * for (String string : locationsListValue) { locationListAll =
				 * locationListAll+string+","; } List<String> myList = new
				 * ArrayList<String>(Arrays.asList(locationListAll.split(",")));
				 * billDetails.setBilledLocations(myList);
				 */
				billDetails.setStore_location("all");		
			}
				else
				{
					billDetails.setStore_location(outletlocation);	
				}
			
			
			if (location != null && !location.equals(""))
				request.getSession().setAttribute("selectedLocation", location);
			
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("locationsList", locationBeansList);
			
			//Here we are calling to getBills() from Service Class Object.....//
			lst_bills = billServiceObj.getBills(billDetails, location, status);
			
			
			if (lst_bills == null || lst_bills.size() == 0) {
				modelAndViewObj.addObject("totalRecords", "0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
				modelAndViewObj.addObject("zone", zone);
				modelAndViewObj.addObject("grandTotalValue", "0");
			} else {
				if (lst_bills.size() < Integer.parseInt(maxRecords)) {
					end = (lst_bills.size()) + (Integer.parseInt(index));
				} else {
					end = (Integer.parseInt(index) + end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(lst_bills.get(0).getTotalRecords()));
				modelAndViewObj.addObject("startDate", startDate);
				modelAndViewObj.addObject("endDate", endDate);
				
				
				////////System.out.println("blah"+tester);
				modelAndViewObj.addObject("index", (Integer.parseInt(index) + start));
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("grandTotalValue", lst_bills.get(0).getGrandTotalBillsValue());
			}
			/*////////System.out.println(lst_bills.size());
			////////System.out.println(index);
			////////System.out.println(lst_bills.get(0).getTotalRecords());*/
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
			modelAndViewObj.addObject("billDetails", lst_bills);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("status", status);
			modelAndViewObj.addObject("countersList", countersList);
			modelAndViewObj.addObject("counterDetails", counterDetails);

			modelAndViewObj.addObject("brandsList", brandsList);
			modelAndViewObj.addObject("zoneList", zoneList);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("categoryList", categoryList);
			modelAndViewObj.addObject("category", category);
			modelAndViewObj.addObject("subcategory", subCategory);
			modelAndViewObj.addObject("counterId", counterId);
			modelAndViewObj.addObject("brand", brand);
			modelAndViewObj.addObject("startDate", startDate);
			modelAndViewObj.addObject("tester", tester);
			 modelAndViewObj.addObject("flowLocation", flowLocation);
			/*if(status.equals("Mcn"))
				modelAndViewObj.setViewName("Inventory Manager/Billing/mcnDetails");
			else*/
			modelAndViewObj.setViewName("Inventory Manager/Billing/billings");
		}
		
		catch (Exception e) {
			e.printStackTrace();
			lst_bills = new ArrayList<Billing>();
			modelAndViewObj.addObject("totalRecords", "0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
			modelAndViewObj.addObject("err",e.getMessage());
			modelAndViewObj.addObject("tester", tester);
			 modelAndViewObj.addObject("flowLocation", flowLocation);
			modelAndViewObj.setViewName("Inventory Manager/Billing/billings");
		}
		return modelAndViewObj;
	}

	@RequestMapping("/searchBills")
	public @ResponseBody ModelAndView searchBills(@RequestParam("saveFlag") Boolean saveFlag,
			@RequestParam("searchName") String searchName, @RequestParam("index") String index,
			@RequestParam("location") String location, @RequestParam("maxRecords") String maxRecords,
			@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate,
			@RequestParam("zone") String zone, @RequestParam("category") String category,
			@RequestParam("subcategory") String subcategory, @RequestParam("brand") String brand,
			@RequestParam("tester") String tester,
			@RequestParam("counterId") String counterId, @RequestParam("status") String status,
			@RequestParam("locationList") String locationList,@RequestParam("salesChannel") String salesChannel,@RequestParam("flowLocation") String flowLocation,
			HttpServletRequest request, HttpServletResponse response) {
		// log.info("searchBills");
		int start = 1, end = Integer.parseInt(maxRecords);
		Billing billDetails = new Billing();
	//	List<String> locationsList = null;
		List<Billing> billsList = null;
		ArrayList<LocationBean> locationBeansList = null;
		List<String> locationsListValue=new ArrayList<String>();
		List<String> countersList = null;
		WarehouseCounterResponse counterDetails = null;
		String locationListAll="";
		String customerIdStr = (String) request.getSession().getAttribute("customerId");
		String emailIdStr = (String) request.getSession().getAttribute("emailId");
		try {
			 //billDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr,
			// emailIdStr));
			//////////System.out.println(startDate);
			billDetails.setSearchCriteria(searchName);
			billDetails.setStartIndex(index);
//			billDetails.setStore_location(location);
			billDetails.setCategory(category);
			billDetails.setSubCategory(subcategory);
			billDetails.setBrand(brand);
			billDetails.setCounterId(counterId);
			billDetails.setZoneId(zone);
			billDetails.setMaxRecords(maxRecords);
			billDetails.setSaveReportFlag(saveFlag);
			if(startDate != "")
				billDetails.setReportDate(startDate+" 00:00:00");
			if(endDate != "")
				billDetails.setReportEndDate(endDate+" 00:00:00");
			billDetails.setStatus(status);
			billDetails.setSalesChannel(salesChannel);
			
			//locationsList = adminServiceObj.getOutletLocationsList(customerIdStr, emailIdStr, true);
			
			if(flowLocation.equals("warehouse") ||flowLocation ==  "warehouse" ){
				locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
			}else{
				locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);

			}
			
			//locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			//request.getSession().setAttribute("selectedLocation", location);
           List<String> brandsList = (List<String>)request.getSession().getAttribute("brandsList");
			if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
			 brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
				request.getSession().setAttribute("brandsList", brandsList);
			}
//			List<String> brandsList = adminServiceObj.getBrandNamesList(customerIdStr, emailIdStr);
			
			
			
			
			if(flowLocation.equals("warehouse") ||flowLocation ==  "warehouse" ){
				 counterDetails = adminServiceObj.getWhCounters("",location,customerIdStr,emailIdStr,index,false,"100");

				
			}else{
			countersList = reportsServiceObj.getCounters(location, customerIdStr, emailIdStr,Constants.PAGINATION_START_INDEX);
			}


               ////System.out.println(gson.toJson(counterDetails));

			
			
			//countersList = reportsServiceObj.getCounters(location, customerIdStr, emailIdStr, Constants.PAGINATION_START_INDEX);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("locationsList", locationBeansList);
			/*//to get zone based locations
			Set<String> zoneList = genericMasterServiceObj.getlocationsBasedOnZone(zone, customerIdStr, emailIdStr, "0","","");*/
		/*	
			if(zoneList.get(0).getZones().contains("+"))
			{
				
			}*/
			//for zone based locations for all locations
			if(location.equals("all")|| location.equals("")){
				/*if(zone != ""){
					if(zoneList != null){
							for(String loc :zoneList)
							{
								locationsListValue.add(loc);
							}
				}
				}else
				{*/
				/*
				 * if(locationBeansList != null){ for(int i=0;i<locationBeansList.size();i++){
				 * locationsListValue.add(locationBeansList.get(i).getLocationId());
				 * 
				 * } } for (String string : locationsListValue) { locationListAll =
				 * locationListAll+string+","; } List<String> myList = new
				 * ArrayList<String>(Arrays.asList(locationListAll.split(",")));
				 * billDetails.setBilledLocations(myList);
				 */
				billDetails.setStore_location("all");	
			}
				else
				{
					billDetails.setStore_location(location);	
				}
			/*if(location.equals("all")|| location.equals("")){
				List<String> myList = new ArrayList<String>(Arrays.asList(locationList.split(",")));
				billDetails.setBilledLocations(myList);
			}
			else
			{
				billDetails.setStore_location(location);
			}*/
			
			billsList = billServiceObj.searchBills(billDetails, status);
			if (billsList == null || billsList.size() == 0) {
				modelAndViewObj.addObject("totalRecords", "0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
				modelAndViewObj.addObject("grandTotalValue", "0");
			} else {
				if (billsList.size() < Integer.parseInt(maxRecords))
					end = (billsList.size()) + (Integer.parseInt(index));
				else
					end = (Integer.parseInt(index) + end);
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(billsList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index) + start));
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("grandTotalValue", billsList.get(0).getGrandTotalBillsValue());
			}
			if (saveFlag) {
				if (billsList.get(0).getSearchBillsFilePath() != null)
					modelAndViewObj.addObject("downloadurl", billsList.get(0).getSearchBillsFilePath());
			}
			modelAndViewObj.addObject("searchName", searchName);
			modelAndViewObj.addObject("startDate", startDate);
			modelAndViewObj.addObject("endDate", endDate);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
			modelAndViewObj.addObject("billDetails", billsList);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("zone", zone);
//			modelAndViewObj.addObject("locationList", locationList);
			modelAndViewObj.addObject("brandsList", brandsList);
			modelAndViewObj.addObject("countersList", countersList);
			modelAndViewObj.addObject("counterDetails", counterDetails);

			modelAndViewObj.addObject("category", category);
			modelAndViewObj.addObject("subcategory", subcategory);
			modelAndViewObj.addObject("brand", brand);
			modelAndViewObj.addObject("counterId", counterId);
			modelAndViewObj.addObject("status", status);
			modelAndViewObj.addObject("tester", tester);
			 modelAndViewObj.addObject("flowLocation", flowLocation);

			modelAndViewObj.setViewName("Inventory Manager/Billing/billings");
		} catch (Exception e) {
			e.printStackTrace();
			billsList = new ArrayList<Billing>();
			modelAndViewObj.setViewName("Inventory Manager/Billing/billings");
		}
		return modelAndViewObj;
	}

	
	/**
	 * 
	 * @param skuID
	 * @param operation
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/getBillSummary")
	public ModelAndView getBillSummary(@RequestParam("location") String location,@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,@RequestParam("status") String status,@RequestParam("locationList") String locationList,HttpServletRequest request,
			HttpServletResponse response){
		try{
			// log.info("getBillSummary");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			BillSummaryReport billSummaryReport = billServiceObj.getBillSummary(location,startDate,endDate,status,customerIdStr,emailIdStr,locationList);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("billSummaryReport",billSummaryReport);
			modelAndViewObj.setViewName("Inventory Manager/Billing/billSummaryReport");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/*@RequestMapping("/getBillDetails")
	public @ResponseBody ModelAndView getBillDetails(@RequestParam("billId")String billId,@RequestParam("status")String status,@RequestParam("flow")String flow,@RequestParam("criteria")String criteria,HttpServletRequest request,HttpServletResponse response){
		
		*//**
		 * Developed By : Sambaiah Y
		 * Created On   : 30-04-2015
		 * Reviewed By  : Siva Sir on 5-oct-2015 
		 * 
		 * This method is used to get the billings from the services
		 * This method interacts with bills service to get billing details 
		 * 
		 *//*
		
		// log.info("InventoryManagerController - getBills()");
		Billing billDetails = new Billing();
		List<String> locationsList = null;
		Billing billingBean = null;
//		String customerIdStr = (String)request.getSession().getAttribute("customerId");
//		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		try {
//			billDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr, emailIdStr));
			billDetails.setStartIndex(Constants.PAGINATION_START_INDEX);
			billDetails.setBillId(billId);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("locationsList", locationsList);
			billingBean = billServiceObj.getBillDetails(billDetails);
			List<String> featureIds = new ArrayList<String>();
			for(int i=0;i<billingBean.getBillItems().get(0).getDiscountId().length();i++)
			{
				String[] discount=billingBean.getBillItems().get(i).getDiscountId().split(",");
				featureIds.add(discount[i]);
			}
			////////System.out.println(featureIds);
			request.getSession().setAttribute("reportList", billingBean);
			modelAndViewObj.addObject("status", status);
			modelAndViewObj.addObject("billDetails",billingBean);
			modelAndViewObj.addObject("billId",billId);
			modelAndViewObj.addObject("flow",flow);
			modelAndViewObj.addObject("criteria",criteria);
			modelAndViewObj.setViewName("Inventory Manager/Billing/billdetails");
		
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("flow",flow);
			modelAndViewObj.addObject("criteria",criteria);
			modelAndViewObj.setViewName("Inventory Manager/Billing/billdetails");
		}
		return modelAndViewObj;
	}*/
	
	
	
	@RequestMapping("/getBillDetails")
	public @ResponseBody ModelAndView getBillDetails(@RequestParam("storeLocation")String storeLocation,@RequestParam("billId")String billId,@RequestParam("status")String status,@RequestParam("flow")String flow,@RequestParam("criteria")String criteria,@RequestParam("type")String type,HttpServletRequest request,HttpServletResponse response){
		
		/**
		 * Developed By : Sambaiah Y
		 * Created On   : 30-04-2015
		 * Reviewed By  : Siva Sir on 5-oct-2015 
		 * 
		 * This method is used to get the billings from the services
		 * This method interacts with bills service to get billing details 
		 * 
		 */
		
		// log.info("InventoryManagerController - getBills()");
		Billing billDetails = new Billing();
		List<String> locationsList = null;
        Map<String, Object> responseMapObj = null;
        Set<String> tenders = new LinkedHashSet<String>(); 
		Billing billingBean = null;
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		try {
//			billDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr, emailIdStr));
			billDetails.setStartIndex(Constants.PAGINATION_START_INDEX);
			billDetails.setBillId(billId);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("locationsList", locationsList);
			billingBean = billServiceObj.getBillDetails(billDetails);
		/*	List<String> featureIds = new ArrayList<String>();
			for(int i=0;i<billingBean.getBillItems().get(0).getDiscountId().length();i++)
			{
				String[] discount=billingBean.getBillItems().get(i).getDiscountId().split(",");
				featureIds.add(discount[i]);
			}
			////////System.out.println(featureIds);*/
			
			
			responseMapObj = storeServiceObj.getStoresList(customerIdStr,emailIdStr,storeLocation,"-1","10");
			if(responseMapObj.size()>0)
			modelAndViewObj.addObject("storeDetailsList",responseMapObj.get("storeDetailsList"));
			
			ArrayList<TenderMaster> tenderDetails = genericMasterServiceObj.getTender("",customerIdStr,emailIdStr,"-1",100);
			
			for(int i=0;i<tenderDetails.size();i++)
			{
				tenders.add(tenderDetails.get(i).getModeOfPayment());
			}

			//////System.out.println("get_tender_details:::::::" + gson.toJson(tenderDetails));
			
			request.getSession().setAttribute("reportList", billingBean);
			modelAndViewObj.addObject("status", status);
			//			////////System.out.println("dd"+status);
			modelAndViewObj.addObject("billDetails",billingBean);
			modelAndViewObj.addObject("billId",billId);
			modelAndViewObj.addObject("flow",flow);
			modelAndViewObj.addObject("criteria",criteria);
			modelAndViewObj.addObject("type",type);
			modelAndViewObj.addObject("tenderDetails",tenderDetails);
			if(billingBean.getResponseHeader().getResponseCode().equals(AppProperties.getAppMessageByProperty("RESPONSE_FAILED_CODE").trim())){
				modelAndViewObj.addObject("err",billingBean.getResponseHeader().getResponseMessage());
			}

			modelAndViewObj.setViewName("Inventory Manager/Billing/billdetails");
		
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("flow",flow);
			modelAndViewObj.addObject("criteria",criteria);
			modelAndViewObj.setViewName("Inventory Manager/Billing/billdetails");
		}
		return modelAndViewObj;
	}


	/*
	 * manasa*/

	@RequestMapping(value="/updateMcnDetails" ,method = RequestMethod.POST/*,consumes="application/json"*/)
	public @ResponseBody ModelAndView updateMcnDetails(@RequestParam("maxRecords")String maxRecords,@RequestParam("billId")String billId,@RequestParam("location")String location,@RequestParam("counterId")String counterId,@RequestParam("creditNoteRef")String creditNoteRef,HttpServletRequest request,HttpServletResponse response){
		
		/**
		 * Developed By : Manasa P
		 * This method is used to cancel the billings from the services
		 */
		
		// log.info("InventoryManagerController - getBills()");
		
		try{
			// log.info("updateCategory ");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = billServiceObj.updateMCNDetails(billId,creditNoteRef,maxRecords,"0");
			WarehouseReport WarehouseReportObj = reportsServiceObj.getSaleCreditNoteReportByBillId(creditNoteRef,"0",maxRecords,"");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("warehouseReportObj", WarehouseReportObj);
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("MCN_UPDATED_SUCESSFULLY").trim()))
				modelAndViewObj.addObject("err", resultStr);
			else
				modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.addObject("maxRecords", maxRecords);
			modelAndViewObj.addObject("billId", billId);
			modelAndViewObj.addObject("counterId", counterId);
			modelAndViewObj.addObject("operation","edit");
			modelAndViewObj.addObject("creditNoteRef", creditNoteRef);
			modelAndViewObj.setViewName("Inventory Manager/Billing/editMCNDetails");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}

	/*manasa
	*/

	@RequestMapping(value="/getCancelBillid" ,method = RequestMethod.POST/*,consumes="application/json"*/)
	public @ResponseBody ModelAndView getCancelBillid(@RequestParam("maxRecords")String maxRecords,@RequestParam("billId")String billId,@RequestParam("status")String status,@RequestParam("flow")String flow,@RequestParam("criteria")String criteria,@RequestParam("billSyncStatus") boolean billSyncStatus,@RequestParam("customerGstin") String customerGstin,@RequestParam("customerName")String customerName,HttpServletRequest request,HttpServletResponse response){
		
		/**
		 * Developed By : Manasa P
		 * This method is used to cancel the billings from the services
		 */
		
		// log.info("InventoryManagerController - getBills()");
		Billing billDetails = new Billing();
		List<String> locationsList = null;
		Billing billingBean = null;
		String resultStr=null;
//		String customerIdStr = (String)request.getSession().getAttribute("customerId");
//		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		try {
//			billDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr, emailIdStr));
			billDetails.setStartIndex(Constants.PAGINATION_START_INDEX);
			billDetails.setBillId(billId);
			billDetails.setStatus(status.trim());
			billDetails.setCustomerGstin(customerGstin);
			billDetails.setCustomerName(customerName);
			billDetails.setBillSyncStatus(billSyncStatus);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("locationsList", locationsList);
			resultStr = billServiceObj.getCancelBillid(billDetails);
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("BILL_UPDATED_SUCCESSFULLY").trim()))
				{
				modelAndViewObj.addObject("err", resultStr);
				}
			else
			{
				billingBean = billServiceObj.getBillDetails(billDetails);
				modelAndViewObj.addObject("success", resultStr);
				
			}
			request.getSession().setAttribute("reportList", billingBean);
			modelAndViewObj.addObject("status", status);
			modelAndViewObj.addObject("billDetails",billingBean);
			modelAndViewObj.addObject("billId",billId);
			modelAndViewObj.addObject("flow",flow);
			modelAndViewObj.addObject("criteria",criteria);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("type","edit");
			modelAndViewObj.setViewName("Inventory Manager/Billing/billdetails");
		
		}
		catch(IOException ioe){
			ioe.printStackTrace();
			modelAndViewObj.addObject("flow",flow);
			modelAndViewObj.addObject("criteria",criteria);
			modelAndViewObj.addObject("err",resultStr);
			modelAndViewObj.setViewName("Inventory Manager/Billing/billdetails");
		}
		
		catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("flow",flow);
			modelAndViewObj.addObject("criteria",criteria);
			modelAndViewObj.setViewName("Inventory Manager/Billing/edititemdetails");
		}
		return modelAndViewObj;
	}
	
	
	
	@RequestMapping(value="/getdealsandofers",method = RequestMethod.POST)
	public @ResponseBody Offer getdealsandofers(@RequestParam("type")String type,@RequestParam("id")String id,HttpServletRequest request,HttpServletResponse response){
		
		List<String> locationsList = null;
		List<Deal> lst_deal = null;
		List<Offer> lst_offers = null;
		try {
			int start = 1,end = Integer.parseInt("10");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			lst_deal = new ArrayList<Deal>();
			lst_offers = new ArrayList<Offer>();
			modelAndViewObj = new ModelAndView();
			if(type.contains("DI")){
				lst_deal = dealServiceObj.getDeals(customerIdStr,emailIdStr,id,"specific","0","",false,"",null);
				if(lst_deal == null){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
					modelAndViewObj.addObject("err","No Deals Found");
				}else{
					Offer offer = new Offer();
					offer.setOfferName(lst_deal.get(0).getDealDescription());
					lst_offers.add(offer);
					modelAndViewObj.addObject("totalValue", end);
					modelAndViewObj.addObject("dealDetails",lst_deal);
			}
			}
			else{
				lst_offers = offerServiceObj.getOffers(customerIdStr,emailIdStr,id,"specific","0","10",false,"",null,"","","","");
				if(lst_offers == null){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
					modelAndViewObj.addObject("err","No Offers Found");
				}else{
					modelAndViewObj.addObject("totalValue", end);
					modelAndViewObj.addObject("offerDetails",lst_offers);
				}
				modelAndViewObj.addObject("locationsList", locationsList);
				modelAndViewObj.addObject("type",type);
				modelAndViewObj.setViewName("Deals and Offers/Offers/offers");
			}
		}catch(Exception e){
			e.printStackTrace();
		
		}
		return lst_offers.get(0);
	}
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display all the shipment details in a tabular form
	 *
	 **/
	/*@RequestMapping("/viewShipments")
	public ModelAndView viewShipments(HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewShipments ");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<String> locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr,emailIdStr,true);
			modelAndViewObj = new ModelAndView();
			if(locationsList==null || locationsList.size()==0){
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			}else{
				modelAndViewObj.addObject("locationsList", locationsList);
				List<ShipmentBean> shipmentBeanList = shipmentServiceObj.getShipments(locationsList.get(0),customerIdStr, emailIdStr);
		
				modelAndViewObj.addObject("shipmentBeanList", shipmentBeanList);
				modelAndViewObj.addObject("selectedLocation",locationsList.get(0));
				modelAndViewObj.setViewName("Inventory Manager/warehouse/shipments/shipments");
			}
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	*/
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display all the shipment details in a tabular form based on the location given
	 *
	 **/
	/*@RequestMapping("/viewShipmentsByLocation")
	public ModelAndView viewShipmentsByLocation(@RequestParam("location")String location,HttpServletRequest request,HttpServletResponse response){
		
		
		try{
			// log.info("viewShipmentsByLocation ");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<String> locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr,emailIdStr,true);
			if(location == "" || location == null){
				location = locationsList.get(0);
			}
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("locationsList", locationsList);
			List<ShipmentBean> shipmentBeanList = shipmentServiceObj.getShipments(location,customerIdStr, emailIdStr);
			modelAndViewObj.addObject("shipmentBeanList", shipmentBeanList);
			modelAndViewObj.addObject("selectedLocation",location);
			modelAndViewObj.setViewName("Inventory Manager/warehouse/shipments/shipments");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}*/

	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display the newShipment form 
	 *
	 **/
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display  shipment details based on the shipmentId given
	 *
	 **/

	/*@RequestMapping("/editShipmentDetails")
	public @ResponseBody ModelAndView editShipmentDetails(@RequestParam("shipmentId")String shipmentId,HttpServletRequest request,HttpServletResponse response){
		
		// log.info("InventoryManagerController - editShipmentDetails()");
		try {
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			ShipmentBean shipmentBean = shipmentServiceObj.viewShipmentDetails(shipmentId,customerIdStr,emailIdStr);
			modelAndViewObj = new ModelAndView();
			
			modelAndViewObj.addObject("shipmentBean",shipmentBean);
			modelAndViewObj.setViewName("Inventory Manager/warehouse/shipments/editShipment");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.setViewName("Inventory Manager/warehouse/shipments/editShipment");
		}
		return modelAndViewObj;
	}*/
	
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param Request,Response,operation
     *  
     * This method is used to send view page with all warehouse stock verification details 
	 *  
     *  @return ModelAndView with stock verification details
     */
	@RequestMapping("/viewStockVerification")
	public ModelAndView viewStockVerification(@RequestParam("index") String index,@RequestParam("flowUnder") String flowUnder,@RequestParam("location") String location,
			@RequestParam("maxRecords") String maxRecords,@RequestParam("mastercode") String mastercode,HttpServletRequest request,HttpServletResponse response) {
		List<String> locationsList = null;
		List<WareHouseStockVerification> stockVerificationDetailsList = null;
		StoreStockVerificationMaster  whstockverifiObj=null;
		try{
			// log.info("viewStockVerification");
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr  = (String)request.getSession().getAttribute("emailId");
			
			if(flowUnder.equals("outlet")){
				stockVerificationDetailsList = storeStockVerificationServiceObj.getProductVerification(customerIdStr,emailIdStr,location,"",index,"","",maxRecords,flowUnder,mastercode);
				locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			}
			else{
				//////////System.out.println("dfgf");
				stockVerificationDetailsList = storeStockVerificationServiceObj.getWarehouseProductVerification(customerIdStr,emailIdStr,location,"",index,"","",maxRecords,flowUnder);
				locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
				
			}
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("locationsList", locationsList);
				
				//modelAndViewObj.addObject("stockVerificationMaster",stockVerificationMaster.getVerification_code());
				if(stockVerificationDetailsList == null || stockVerificationDetailsList.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(stockVerificationDetailsList.size()<Integer.parseInt(maxRecords)){
						end = (stockVerificationDetailsList.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(stockVerificationDetailsList.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
				}
	
				//modelAndViewObj.addObject("whstockverifiObj",whstockverifiObj.getVerification_code());
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.addObject("productStockVerificationDetailsList",stockVerificationDetailsList);
			
				modelAndViewObj.addObject("selectedLocation",location);
				//////////System.out.println(stockVerificationDetailsList.get(0).getLocation());
				modelAndViewObj.addObject("flowUnder", flowUnder);
				if(mastercode.trim().isEmpty())
					modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/stockVerificationmaster");
				else
				modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/allverifiedproductstocks");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/allverifiedproductstocks");
		}
		return modelAndViewObj;
	}
	
	
	
	/**
	 * 
	 * @author Chaithanya.V
	 * 
	 *This method is used to PRINT the purchase Order Details of the given  PO_Ref
	 *
	 **/
	@RequestMapping("/printbusinessdocument")
	public void printbusinessdocument(@RequestParam("id") String id,@RequestParam("operation") String operation,@RequestParam("eway") boolean eway,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("printbusinessdocument");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			  String result = procurementServiceObj.printbusinessdocument(id,customerIdStr, emailIdStr,operation,eway);
			String jsonString = null;
			if(result.contains("0"))
				jsonString = result;
			else if(result.contains("-1"))
				jsonString = "{\"err\":\" Sorry please try after some time\"}";
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
    	response.getWriter().write(result);
	}catch(Exception e){
		e.printStackTrace();
	}finally {
    	try {
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
    
    }
	}
	
	
	@RequestMapping("/sendtestMail")
	public void sendtestMail(@RequestParam("testmail") String testmail,@RequestParam("testmsg") String testmsg,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("printbusinessdocument");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			  String result = procurementServiceObj.sendemail(testmail,customerIdStr, emailIdStr,testmsg);
				/*
				 * String jsonString = null; if(result.contains("0")) jsonString = result; else
				 * if(result.contains("-1")) jsonString =
				 * "{\"err\":\" Sorry please try after some time\"}";
				 * response.setContentType("application/json");
				 * response.setCharacterEncoding("UTF-8"); response.getWriter().write(result);
				 */
	}catch(Exception e){
		e.printStackTrace();
	}finally {
    	try {
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
    
    }
	}
	
	
	
	
	/**
	 * @author Chaithanya.v
	 * Verified By :
	 * 
	 * @param Request,Response,operation
     *  
     * This method is used to send view page with all warehouse stock verification details 
	 *  
     *  @return ModelAndView with stock verification details
     */
	@RequestMapping("/viewMaterialConsumption")
	public ModelAndView viewMaterialConsumption(@RequestParam("search") String search,@RequestParam("index") String index,@RequestParam("zone") String zone,@RequestParam("category") String category,@RequestParam("subcategory") String subcategory,@RequestParam("brand") String brand,@RequestParam("startdate") String startdate,@RequestParam("enddate") String enddate,@RequestParam("flowUnder") String flowUnder,@RequestParam("location") String location,
			@RequestParam("maxRecords") String maxRecords,HttpServletRequest request,HttpServletResponse response) {
		//List<String> locationsList = null;
		BillOfMaterialResponse stockVerificationDetailsList = null;
		ArrayList<LocationBean> locationBeansList = null;
		String locationListAll = "";
		try{
			// log.info("viewStockVerification");
			int start = 1,end = Integer.parseInt(maxRecords);
			List<String> locationsListValue = new ArrayList<String>();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr  = (String)request.getSession().getAttribute("emailId");
			//locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);	
			/*
//			Added by vijay, to make default loaction as location list first occurrence, if location is empty
			if((location.trim()).equals(null) || location.trim().isEmpty())
			{
				location = locationsList.get(0);
			}*/
			
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
			
			
			if(flowUnder.equals("outlet")){
				   stockVerificationDetailsList = storeStockVerificationServiceObj.getMaterialConsumption(customerIdStr,emailIdStr,index,maxRecords,zone,location,category,subcategory,brand,startdate,enddate,search,locationListAll);

			}
		

				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("locationsList", locationBeansList);
				
				
				if(stockVerificationDetailsList == null){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(stockVerificationDetailsList.getTotalRecords()<Integer.parseInt(maxRecords)){
						end = (stockVerificationDetailsList.getTotalRecords())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", stockVerificationDetailsList.getTotalRecords());
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
				}
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.addObject("bomreports",stockVerificationDetailsList.getBomSummaryList());
				modelAndViewObj.addObject("selectedLocation",location);
				modelAndViewObj.addObject("flowUnder", flowUnder);
				modelAndViewObj.addObject("startdate", startdate);
				modelAndViewObj.addObject("enddate", enddate);
				modelAndViewObj.addObject("zone", zone);
				modelAndViewObj.addObject("category", category);
				modelAndViewObj.addObject("subcategory", subcategory);
				modelAndViewObj.addObject("brand", brand);
				modelAndViewObj.setViewName("Inventory Manager/MaterialConsumption/materialConsumption");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/MaterialConsumption/materialConsumption");
		}
		return modelAndViewObj;
	}
	
	
	
	
	
	/**
	 * @author Chaithanya.v
	 * Verified By :
	 * 
	 * @param Request,Response,operation
     *  
     * This method is used to send view page with all warehouse stock verification details 
	 *  
     *  @return ModelAndView with stock verification details
     */
	@RequestMapping("/viewoutletstockMovement")
	public ModelAndView viewoutletstockMovement(@RequestParam("search") String search,@RequestParam("index") String index,
			@RequestParam("zone") String zone,@RequestParam("category") String category,@RequestParam("subcategory") String subcategory,
			@RequestParam("brand") String brand,@RequestParam("startdate") String startdate,@RequestParam("enddate") String enddate,
			@RequestParam("flowUnder") String flowUnder,@RequestParam("location") String location,@RequestParam("saveFlag") String saveFlag,
			@RequestParam("maxRecords") String maxRecords,
			HttpServletRequest request,HttpServletResponse response) {
		List<String> locationsList = null;
		BillOfMaterialResponse stockVerificationDetailsList = null;
		TallyRequest tally = new TallyRequest();
		String locationListAll = "";
		try{
			// log.info("viewStockVerification");
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr  = (String)request.getSession().getAttribute("emailId");
			//tally.SendToTally();

			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);

			/*			
//			Added by vijay, to make default loaction as location list first occurrence, if location is empty
			if((location.trim()).equals(null) || location.trim().isEmpty())
			{
				location = locationsList.get(0);
			}*/
			if(location.equals("all")|| location.equals("")){
				if(locationsList != null){
					for (String string : locationsList) {

						locationListAll = locationListAll+string+",";
					}
				}

			}

			if(flowUnder.equals("outlet")){
				stockVerificationDetailsList = storeStockVerificationServiceObj.getStockMovement(customerIdStr,emailIdStr,index,maxRecords,zone,location,category,subcategory,brand,startdate,enddate,search,locationListAll,saveFlag);
			}

			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("locationsList", locationsList);


			if(stockVerificationDetailsList.getStockMovementList() == null){
				modelAndViewObj.addObject("url","");
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(stockVerificationDetailsList.getTotalRecords()<Integer.parseInt(maxRecords)){
					end = (stockVerificationDetailsList.getTotalRecords())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", stockVerificationDetailsList.getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("url",stockVerificationDetailsList.getUrl());
			}
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
			modelAndViewObj.addObject("bomreports",stockVerificationDetailsList.getStockMovementList());
			modelAndViewObj.addObject("selectedLocation",location);
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.addObject("startdate", startdate);
			modelAndViewObj.addObject("enddate", enddate);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("category", category);
			modelAndViewObj.addObject("subcategory", subcategory);
			modelAndViewObj.addObject("brand", brand);
			modelAndViewObj.setViewName("Inventory Manager/stockMovement/stockMovement");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/stockMovement/stockMovement");
		}
		return modelAndViewObj;
	}
	
	
	/**
	 * @author Chaithanya.v
	 * Verified By :
	 * 
	 * @param Request,Response,operation
     *  
     * This method is used to send view page with all warehouse stock verification details 
	 *  
     *  @return ModelAndView with stock verification details
     */
	@RequestMapping("/viewoutletsuppliesReport")
	public ModelAndView viewoutletsuppliesReport(@RequestParam("search") String search,@RequestParam("index") String index,@RequestParam("zone") String zone,@RequestParam("category") String category,@RequestParam("subcategory") String subcategory,@RequestParam("brand") String brand,@RequestParam("startdate") String startdate,@RequestParam("enddate") String enddate,@RequestParam("flowUnder") String flowUnder,@RequestParam("location") String location,
			@RequestParam("maxRecords") String maxRecords,@RequestParam("department") String department,@RequestParam("subDepartment") String subDepartment,HttpServletRequest request,HttpServletResponse response) {
		List<String> locationsList = null;
		
		BillOfMaterialResponse stockVerificationDetailsList = null;
		try{
			//BigDecimal bigDecimal= BigDecimal.ZERO;
			// log.info("viewStockVerification");
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr  = (String)request.getSession().getAttribute("emailId");
			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			
//			Added by vijay, to make default loaction as location list first occurrence, if location is empty
			if((location.trim()).equals(null) || location.trim().isEmpty())
			{
				location = locationsList.get(0);
			}
			
			if(flowUnder.equals("outlet")){
				stockVerificationDetailsList = storeStockVerificationServiceObj.getSuppliesReport(customerIdStr,emailIdStr,index,maxRecords,zone,location,category,subcategory,brand,department,subDepartment,startdate,enddate,search);
			}
			
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("locationsList", locationsList);
				
				if(stockVerificationDetailsList.getSuppliesReportBeanList() == null){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(stockVerificationDetailsList.getTotalRecords()<Integer.parseInt(maxRecords)){
						end = (stockVerificationDetailsList.getTotalRecords())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", stockVerificationDetailsList.getTotalRecords());
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
				}
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.addObject("bomreports",stockVerificationDetailsList.getSuppliesReportBeanList());
				modelAndViewObj.addObject("selectedLocation",location);
				modelAndViewObj.addObject("flowUnder", flowUnder);
				modelAndViewObj.addObject("startdate", startdate);
				modelAndViewObj.addObject("enddate", enddate);
				modelAndViewObj.addObject("zone", zone);
				//modelAndViewObj.addObject("bigDecimal", BigDecimal.ZERO);
				modelAndViewObj.addObject("category", category);
				modelAndViewObj.addObject("subcategory", subcategory);
				modelAndViewObj.addObject("department", department);
				modelAndViewObj.addObject("subDepartment", subDepartment);
				modelAndViewObj.addObject("brand", brand);
				modelAndViewObj.setViewName("Inventory Manager/suppliesReport/suppliesReport");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/suppliesReport/suppliesReport");
		}
		return modelAndViewObj;
	}
	
	
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param Request,Response,operation
     *  
     * This method is used to send view page with specific warehouse product stock verification details 
	 *  
     *  @return ModelAndView with product stock verification details
     */
	@RequestMapping("/viewSpecificStockVerification")
	public ModelAndView viewSpecificStockVerification(@RequestParam("verificationCode") String verificationCode,@RequestParam("masterverificationCode") String masterverificationCode,@RequestParam("index") String index,@RequestParam("maxRecords") String maxRecords,@RequestParam("flowUnder") String flowUnder,HttpServletRequest request,HttpServletResponse response) {
		List<WareHouseStockVerificationItems> stockVerificationItemDetailsList = null;
		String userIdStr = null,emailIdStr=null;
		try{
			// log.info("viewSpecificStockVerification");
			userIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("masterverificationCode",masterverificationCode);
			//////////System.out.println(verificationCode);
			Verification verificationObj = null;
			if(flowUnder.equals("outlet"))
				verificationObj = storeStockVerificationServiceObj.getProductVerificationDetails(userIdStr,emailIdStr,verificationCode,index,maxRecords);
			else
				verificationObj = storeStockVerificationServiceObj.getWarehouseProductVerificationDetails(userIdStr,emailIdStr,verificationCode,index,maxRecords);
				
			if(verificationObj != null && verificationObj.getWarehouseStockVerification() != null){
				stockVerificationItemDetailsList = verificationObj.getWarehouseStockVerification().getItemsList();
			}
			int start = 1,end = Integer.parseInt(maxRecords);
			if(stockVerificationItemDetailsList == null || stockVerificationItemDetailsList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(stockVerificationItemDetailsList.size()<Integer.parseInt(maxRecords)){
					end = (stockVerificationItemDetailsList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(stockVerificationItemDetailsList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
			modelAndViewObj.addObject("verificationObj", verificationObj);
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.addObject("productStockVerificationItemDetailsList",stockVerificationItemDetailsList);
		
			modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/allverifiedproductstockitems");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/allverifiedproductstocks");
		}
		return modelAndViewObj;
	}
	
	/*@RequestMapping("/viewStockVerificationReport")
	public ModelAndView viewStockVerificationReport(@RequestParam("index")String index,@RequestParam("location")String locationStr,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<String> locationsList = null;
		List<VerificationDetails> verificationDetailsList = null;
		try{
			// log.info("viewStockVerificationReport");
			int start = 1,end = 10;
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			if(flowUnder.equals("outlet"))
				locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			else
				locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
				modelAndViewObj.addObject("locationsList", locationsList);
				if(locationStr == null && locationsList != null && locationsList.size()>0)
					locationStr = locationsList.get(0);
				verificationDetailsList = storeStockVerificationServiceObj.getStockVerification(customerIdStr, emailIdStr,locationStr,"",index,"","","","","");
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
			modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/stockVerificationReport");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/stockVerificationReport");
		}
		return modelAndViewObj;
	}
*/	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param Request,Response,operation
     *  
     * This method is used to send view page with selected warehouse product stock verification details 
	 *  
     *  @return ModelAndView with product stock verification details
     */
	/*@RequestMapping("/getProductStockVerificationByWarehouseWise")
	public ModelAndView getProductStockVerificationByWarehouseWise(@RequestParam("location")String locationStr,HttpServletRequest request,HttpServletResponse response) {
		String userIdStr = null,emailIdStr=null;
		List<String> locationsList = null;
		List<StoreStockVerification> productStockVerificationDetailsList = null;
		try{
			// log.info("View All Stocks Verification");
			userIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			locationsList = adminServiceObj.getWarehouseLocationsList(userIdStr,emailIdStr,true);
			modelAndViewObj = new ModelAndView();
			if(locationsList == null || locationsList.size()==0){
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			}else{
				modelAndViewObj.addObject("locationsList", locationsList);
				productStockVerificationDetailsList = storeStockVerificationServiceObj.getWarehouseProductVerification(userIdStr,emailIdStr,locationStr);
				modelAndViewObj.addObject("productStockVerificationDetailsList",productStockVerificationDetailsList);
				modelAndViewObj.addObject("selectedLocation",locationStr);
			}
			modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/allverifiedproductstocks");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/allverifiedproductstocks");
		}
		return modelAndViewObj;
	}*/
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param Request,Response,operation
     *  
     * This method is used to send view page with all warehouse product stock verification details 
	 *  
     *  @return ModelAndView with product stock verification details
     */
	/*@RequestMapping("/viewWarehouseProductStockVerification")
	public ModelAndView viewWarehouseProductStockVerification(HttpServletRequest request,HttpServletResponse response) {
		String userIdStr = null,emailIdStr=null;
		List<String> locationsList = null;
		List<StoreStockVerification> productStockVerificationDetailsList = null;
		try{
			// log.info("View All Stocks Verification");
			userIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			locationsList = adminServiceObj.getWarehouseLocationsList(userIdStr,emailIdStr,true);
			modelAndViewObj = new ModelAndView();
			if(locationsList == null || locationsList.size()==0){
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			}else{
				modelAndViewObj.addObject("locationsList", locationsList);
				productStockVerificationDetailsList = storeStockVerificationServiceObj.getWarehouseProductVerification(userIdStr,emailIdStr,locationsList.get(0));
				modelAndViewObj.addObject("productStockVerificationDetailsList",productStockVerificationDetailsList);
				modelAndViewObj.addObject("selectedLocation",locationsList.get(0));
			}
			modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/allverifiedproductstocks");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/allverifiedproductstocks");
		}
		return modelAndViewObj;
	}*/
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param Request,Response,operation
     *  
     * This method is used to send view page with product stock verification item details 
	 *  
     *  @return ModelAndView 
     */
	/*@RequestMapping(value="/viewWarehouseProductStockVerificationItems",method=RequestMethod.POST)
	public ModelAndView viewWarehouseProductStockVerificationItems(@RequestBody StoreStockVerificationDetails specificProductData,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("View warehouse Product Stock Verification Items");
			modelAndViewObj.addObject("specificProductData",specificProductData);
			modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/viewoutletproductstockverification");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/allverifiedproductstocks");
		}
		return modelAndViewObj;
	}*/
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param Request,Response,operation
     *  
     * This method is used to send view page with warehouse stock receipt details along with item details
	 *  
     *  @return ModelAndView with stock receipts details
     */
	/*@RequestMapping("/warehouseGoodsTransfer")
	public ModelAndView warehouseGoodsTransfer(@RequestParam("operation") String operationStr,HttpServletRequest request,HttpServletResponse response) {
		String userIdStr = null,emailIdStr=null;
		List<String> locationsList = null;
		List<StockReciept> stockReceiptDetailsList =null;
		try{
			// log.info("View All Warehouse Stock Indents");
			int start = 1,end = 10;
			userIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			locationsList = adminServiceObj.getLocationsList(userIdStr,emailIdStr);
			modelAndViewObj = new ModelAndView();
			if(locationsList==null || locationsList.size()==0 ){
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			}else{
				String location = (String)request.getSession().getAttribute("selectedLocation");
				if(location == null)
					location = locationsList.get(0);
				boolean goodsReceiptFlag = false;
				List<AccessControl> warehouseGoodsTransferList = (List<AccessControl>) request.getSession().getAttribute("warehouseGoodsTransfer");
				String role = (String)request.getSession().getAttribute("role");
				if((warehouseGoodsTransferList != null && !warehouseGoodsTransferList.isEmpty()) || role.equals("super admin")){
					if( !role.equals("super admin")){
						for(int i= 0; i<warehouseGoodsTransferList.size();i++){
							if(warehouseGoodsTransferList.get(i).getAppDocument().equals("WarehouseGoodsReceipt")){
								goodsReceiptFlag = true;
							}
						}
					}
					if( role.equals("super admin"))
						goodsReceiptFlag = true;
					if(goodsReceiptFlag == true){
						stockReceiptDetailsList = stockReceiptServiceObj.getWarehouseStockReceiptsByLocation(userIdStr,emailIdStr,locationsList.get(0),operationStr);
						if(stockReceiptDetailsList == null){
							modelAndViewObj.addObject("totalRecords","0");
							modelAndViewObj.addObject("index", "0");
							modelAndViewObj.addObject("totalValue", "0");
						}else{
							modelAndViewObj.addObject("totalValue", end);
						}
						modelAndViewObj.addObject("stockReceiptDetailsList",stockReceiptDetailsList);
					}
				}
				if(goodsReceiptFlag == false){
					List<StockIssues> stockIssueDetailsList = stockIssueServiceObj.getWarehouseStockIssuesByLocation(userIdStr,emailIdStr,location,operationStr);
					if(stockIssueDetailsList == null){
						modelAndViewObj.addObject("totalRecords","0");
						modelAndViewObj.addObject("index", "0");
						modelAndViewObj.addObject("totalValue", "0");
					}else{
						modelAndViewObj.addObject("totalValue", end);
					}
					modelAndViewObj.addObject("stockIssueDetailsList",stockIssueDetailsList);
				}
				request.getSession().setAttribute("selectedLocation",location);
				modelAndViewObj.addObject("locationsList", locationsList);
				modelAndViewObj.addObject("operation",operationStr);
				modelAndViewObj.addObject("selectedLocation",locationsList.get(0));
			}
			modelAndViewObj.setViewName("Inventory Manager/warehouse/goodsTransfer/goodstransfer");
			
			
			
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/warehouse/goodsTransfer/goodstransfer");
		}
		return modelAndViewObj;
	}*/
	
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param Request,Response,operation
     *  
     * This method is used to send view page with warehouse stock receipt details along with item details
	 *  
     *  @return ModelAndView with stock receipts details
     */
	/*@RequestMapping("/viewAllWarehouseStockReceipts")
	public ModelAndView viewAllWarehouseStockReceipts(@RequestParam("operation") String operationStr,HttpServletRequest request,HttpServletResponse response) {
		String userIdStr = null,emailIdStr=null;
		List<String> locationsList = null;
		List<StockReciept> stockReceiptDetailsList = null;
		try{
			// log.info("View All Warehouse Stock Receipts");
			userIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			locationsList = adminServiceObj.getWarehouseLocationsList(userIdStr,emailIdStr);
			modelAndViewObj = new ModelAndView();
			if(locationsList==null || locationsList.size()==0){
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			}else{
				modelAndViewObj.addObject("locationsList", locationsList);
				stockReceiptDetailsList = stockReceiptServiceObj.getWarehouseStockReceiptsByLocation(userIdStr,emailIdStr,locationsList.get(0),operationStr);
				modelAndViewObj.addObject("stockReceiptDetailsList",stockReceiptDetailsList);
				modelAndViewObj.addObject("operation",operationStr);
				modelAndViewObj.addObject("selectedLocation",locationsList.get(0));
			}
			modelAndViewObj.setViewName("Inventory Manager/warehouse/goodsTransfer/allstockreceipts");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/warehouse/goodsTransfer/allstockreceipts");
		}
		return modelAndViewObj;
	}*/
	
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param Request,Response,receipt_location,operation
     *  
     * This method is used to send view page with locations are pre-populated and stock receipt details 
	 *  
     *  @return ModelAndView 
     */
	/*@RequestMapping("/getWarehoseStockReceiptsByLocation")
	public ModelAndView getWarehoseStockReceiptsByLocation(@RequestParam("receipt_location") String receipt_location,@RequestParam("operation") String operationStr,HttpServletRequest request,HttpServletResponse response) {
		String userIdStr = null,emailIdStr=null;
		List<StockReciept> stockReceiptDetailsList = null;
		List<String> locationsList = null;
		try{
			// log.info("View All Warehouse Stock Receipts");
			userIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			locationsList = adminServiceObj.getWarehouseLocationsList(userIdStr,emailIdStr);
			stockReceiptDetailsList = stockReceiptServiceObj.getWarehouseStockReceiptsByLocation(userIdStr,emailIdStr,receipt_location,operationStr);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("stockReceiptDetailsList",stockReceiptDetailsList);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("operation",operationStr);
			modelAndViewObj.addObject("selectedLocation",receipt_location);
			modelAndViewObj.setViewName("Inventory Manager/warehouse/goodsTransfer/allstockreceipts");
		}catch(Exception e){
			e.printStackTrace();
			stockReceiptDetailsList = new ArrayList<StockReciept>();
			modelAndViewObj.setViewName("Inventory Manager/warehouse/goodsTransfer/allstockreceipts");
		}
		return modelAndViewObj;
	}*/
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param Request,Response
     *  
     * This method is used to send view page with locations are pre-populated
	 *  
     *  @return ModelAndView 
     */
	/*@RequestMapping("/newWarehouseStockReceiptView")
	public ModelAndView newWarehouseStockReceiptView(HttpServletRequest request,HttpServletResponse response) {
		String userIdStr = null,emailIdStr=null;
		List<String> locationsList = null;
		try{
			// log.info("All Storage System Details");
			modelAndViewObj = new ModelAndView();
			userIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			locationsList = adminServiceObj.getWarehouseLocationsList(userIdStr,emailIdStr);
			if(locationsList==null || locationsList.size()==0){
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			}
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.setViewName("Inventory Manager/warehouse/goodsTransfer/newstockreceipt");
			
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			modelAndViewObj.setViewName("Inventory Manager/warehouse/goodsTransfer/allstockreceipts");
		}
		return modelAndViewObj;
	}*/
	
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param Request,Response,good receipt ref number
	 *  
	 * This method is used to send view page with locations are pre-populated and stock receipt details along with item details
	 *  
	 *  @return ModelAndView 
	 */
	/*@RequestMapping("/editWarehouseStockReceipt")
	public ModelAndView editWarehouseStockReceipt(@RequestParam("goods_receipt_ref_num") String goods_receipt_ref_num,HttpServletRequest request,HttpServletResponse response){
		String customerIdStr=null,emailIdStr=null;
		StockReciept stockReceiptDetailsObj =null;
		List<String> locationsList = null;
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr,emailIdStr);
			stockReceiptDetailsObj = stockReceiptServiceObj.getWarehouseStockReceipt(customerIdStr, emailIdStr, goods_receipt_ref_num);
			modelAndViewObj = new ModelAndView();
			if(locationsList == null || locationsList.size()==0){
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			}
			modelAndViewObj.addObject("stockReceiptDetails",stockReceiptDetailsObj);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.setViewName("Inventory Manager/warehouse/goodsTransfer/editstockreceipt");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/warehouse/goodsTransfer/allstockreceipts");
		}

		return modelAndViewObj;
	}*/
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param Request,Response,good receipt ref number
     *  
     * This method is used to send view page with locations are pre-populated and stock receipt details along with item details
	 *  
     *  @return ModelAndView 
     */
	/*@RequestMapping("/viewWarehouseStockReceipt")
	public ModelAndView viewWarehouseStockReceipt(@RequestParam("goods_receipt_ref_num") String goods_receipt_ref_num,HttpServletRequest request,HttpServletResponse response){
		String customerIdStr=null,emailIdStr=null;
		StockReciept stockReceiptDetailsObj =null;
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			stockReceiptDetailsObj = stockReceiptServiceObj.getWarehouseStockReceipt(customerIdStr, emailIdStr, goods_receipt_ref_num);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("stockReceiptDetails",stockReceiptDetailsObj);
			modelAndViewObj.setViewName("Inventory Manager/warehouse/goodsTransfer/viewstockreceipt");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/warehouse/goodsTransfer/allstockreceipts");
		}
		
		return modelAndViewObj;
	}*/
	
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param Request,Response
     *  
     * This method is used to send view page with locations are pre-populated
	 *  
     *  @return ModelAndView 
     */
	/*@RequestMapping("/viewAllWarehouseStockIssues")
	public ModelAndView viewAllWarehouseStockIssues(@RequestParam("operation") String operationStr,HttpServletRequest request,HttpServletResponse response) {
		String userIdStr = null,emailIdStr=null;
		List<String> locationsList = null;
		List<StockIssues> stockIssueDetailsList = null;
		try{
		// log.info("View All Stock Issues");
		userIdStr = (String)request.getSession().getAttribute("customerId");
		emailIdStr  = (String)request.getSession().getAttribute("emailId");
		locationsList = adminServiceObj.getWarehouseLocationsList(userIdStr,emailIdStr);
		modelAndViewObj = new ModelAndView();
		if(locationsList == null || locationsList.size()==0){
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
		}else{
			modelAndViewObj.addObject("locationsList", locationsList);
			stockIssueDetailsList = stockIssueServiceObj.getWarehouseStockIssuesByLocation(userIdStr,emailIdStr,locationsList.get(0),operationStr);
			modelAndViewObj.addObject("stockIssueDetailsList",stockIssueDetailsList);
			modelAndViewObj.addObject("operation",operationStr);
			modelAndViewObj.addObject("selectedLocation",locationsList.get(0));
		}
		modelAndViewObj.setViewName("Inventory Manager/warehouse/goodsTransfer/allissuedstocks");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/warehouse/goodsTransfer/allissuedstocks");
		}
		return modelAndViewObj;
	}*/
	
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param Request,Response,receipt_location,operation
     *  
     * This method is used to send view page with locations are pre-populated and stock receipt details 
	 *  
     *  @return ModelAndView 
     */
	/*@RequestMapping("/getWarehouseStockIssuessByLocation")
	public ModelAndView getWarehouseStockIssuessByLocation(@RequestParam("fromlocation") String fromlocation,@RequestParam("operation") String operationStr,HttpServletRequest request,HttpServletResponse response) {
		String userIdStr = null,emailIdStr=null;
		List<StockIssues> stockIssueDetailsList = null;
		List<String> locationsList = null;
		try{
			// log.info("View All Warehouse Stock Issues By Location");
			userIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			locationsList = adminServiceObj.getWarehouseLocationsList(userIdStr,emailIdStr);
			stockIssueDetailsList = stockIssueServiceObj.getWarehouseStockIssuesByLocation(userIdStr,emailIdStr,fromlocation,operationStr);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("stockIssueDetailsList",stockIssueDetailsList);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("operation",operationStr);
			modelAndViewObj.addObject("selectedLocation",fromlocation);
			modelAndViewObj.setViewName("Inventory Manager/warehouse/goodsTransfer/allissuedstocks");
		}catch(Exception e){
			e.printStackTrace();
			stockIssueDetailsList = new ArrayList<StockIssues>();
			modelAndViewObj.setViewName("Inventory Manager/warehouse/goodsTransfer/allissuedstocks");
		}
		return modelAndViewObj;
	}*/
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param Request,Response
     *  
     * This method is used to send view page with locations are pre-populated
	 *  
     *  @return ModelAndView 
     */
	/*@RequestMapping("/newWarehouseStockIssueView")
	public ModelAndView newWarehouseStockIssueView(HttpServletRequest request,HttpServletResponse response) {
		String userIdStr = null,emailIdStr=null;
		List<String> locationsList = null;
		try{
			// log.info("New Warehouse Stock Issue View");
			modelAndViewObj = new ModelAndView();
			userIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			locationsList = adminServiceObj.getWarehouseLocationsList(userIdStr,emailIdStr);
			if(locationsList == null || locationsList.size()==0){
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			}
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.setViewName("Inventory Manager/warehouse/goodsTransfer/newstockissue");
			
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			modelAndViewObj.setViewName("Inventory Manager/warehouse/goodsTransfer/allstockreceipts");
		}
		return modelAndViewObj;
	}*/
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param Request,Response,good issue ref number
	 *  
	 * This method is used to send view page with locations are pre-populated and stock issue details along with item details
	 *  
	 *  @return ModelAndView 
	 */
	/*@RequestMapping("/editWarehouseStockIssueView")
	public ModelAndView editWarehouseStockIssueView(@RequestParam("goods_issue_ref_num") String goods_issue_ref_num,HttpServletRequest request,HttpServletResponse response){
		String customerIdStr=null,emailIdStr=null;
		StockIssueBean stockIssueDetailsObj =null;
		List<String> locationsList = null;
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr,emailIdStr);
			stockIssueDetailsObj = stockIssueServiceObj.getWarehouseStockIssue(customerIdStr, emailIdStr, goods_issue_ref_num);
			modelAndViewObj = new ModelAndView();
			if(locationsList == null || locationsList.size()==0){
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			}
			modelAndViewObj.addObject("stockIssueDetails",stockIssueDetailsObj);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.setViewName("Inventory Manager/warehouse/goodsTransfer/editstockissue");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/warehouse/goodsTransfer/allissuedstocks");
		}

		return modelAndViewObj;


	}*/
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param Request,Response,good issue ref number
     *  
     * This method is used to send view page with locations are pre-populated and stock issue details along with item details
	 *  
     *  @return ModelAndView 
     */
	/*@RequestMapping("/viewWarehouseStockIssue")
	public ModelAndView viewWarehouseStockIssue(@RequestParam("goods_issue_ref_num") String goods_issue_ref_num,HttpServletRequest request,HttpServletResponse response){
		String customerIdStr=null,emailIdStr=null;
		StockIssueBean stockIssueDetailsObj =null;
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			stockIssueDetailsObj = stockIssueServiceObj.getWarehouseStockIssue(customerIdStr, emailIdStr, goods_issue_ref_num);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("stockIssueDetails",stockIssueDetailsObj);
			modelAndViewObj.setViewName("Inventory Manager/warehouse/goodsTransfer/viewstockissue");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/warehouse/goodsTransfer/allissuedstocks");
		}
		
		return modelAndViewObj;
	}*/
	
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param shippedfrom,shippedto,delivered by, inspected by , received by, shipped from & shipped to locations along with receipt item details
     *  
     * This method is used to receive receipt related response data which contains delivered by, inspected by , received by, shipped from & shipped to locations 
     *  along with receipt item details from GUI(user-experience) to webservice via Stock Issue Service
	 *  
     *  @return ModelAndView 
     */
	/*@RequestMapping("/createWarehouseStockIssue")
	public ModelAndView createWarehouseStockIssue(@RequestParam("shippedFrom") String shippedFrom,@RequestParam("shippedTo") String shippedTo,@RequestParam("date") String date,
			@RequestParam("deliveredBy") String deliveredBy,@RequestParam("inspectedBy") String inspectedBy,@RequestParam("receivedBy") String receivedBy,
			@RequestParam("status") String status,@RequestParam("totalQty") String totalQty,@RequestParam("totalCost") String totalCost,@RequestParam("remarks") String remarks,
			@RequestParam("itemDetails") String itemDetails,@RequestParam("issue_ref_num") String issue_ref_num,@RequestParam("id_goods_issue") String id_goods_issue,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr=null,emailIdStr=null,responseStr=null;
		List<String> locationsList = null;
		try{
			// log.info("Create New Warehouse Stock Issue Details");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			responseStr = stockIssueServiceObj.createWarehouseStockIssue(customerIdStr,emailIdStr,shippedFrom,shippedTo,date,deliveredBy,inspectedBy,receivedBy,status,itemDetails,totalQty,totalCost,remarks);
			modelAndViewObj = new ModelAndView();
			locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr,emailIdStr);
			if(locationsList == null || locationsList.size()==0){
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			}
			else
				modelAndViewObj.addObject("err",responseStr);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.setViewName("Inventory Manager/warehouse/goodsTransfer/newstockissue");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/warehouse/goodsTransfer/allissuedstocks");
		}
		
		
		return modelAndViewObj;
	}*/
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param shippedfrom,shippedto,delivered by, inspected by , received by, shipped from & shipped to locations along with receipt item details
     *  
     * This method is used to receive receipt related response data which contains delivered by, inspected by , received by, shipped from & shipped to locations 
     *  along with receipt item details from GUI(user-experience) to webservice via Stock Issue Service
	 *  
     *  @return ModelAndView 
     */
	/*@RequestMapping("/updateWarehouseStockIssue")
	public ModelAndView updateWarehouseStockIssue(@RequestParam("shippedFrom") String shippedFrom,@RequestParam("shippedTo") String shippedTo,@RequestParam("date") String date,
			@RequestParam("deliveredBy") String deliveredBy,@RequestParam("inspectedBy") String inspectedBy,@RequestParam("receivedBy") String receivedBy,
			@RequestParam("status") String status,@RequestParam("totalQty") String totalQty,@RequestParam("totalCost") String totalCost,@RequestParam("remarks") String remarks,
			@RequestParam("itemDetails") String itemDetails,@RequestParam("issue_ref_num") String issue_ref_num,@RequestParam("id_goods_issue") String id_goods_issue,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr=null,emailIdStr=null,responseStr=null;
		List<String> locationsList = null;
		try{
			// log.info("Update Warehouse Stock Issue Details");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			responseStr = stockIssueServiceObj.updateWarehouseStockIssue(customerIdStr,emailIdStr,shippedFrom,shippedTo,date,deliveredBy,inspectedBy,receivedBy,status,itemDetails,totalQty,totalCost,remarks,issue_ref_num,id_goods_issue);
			modelAndViewObj = new ModelAndView();
			StockIssueBean stockIssueDetailsObj = stockIssueServiceObj.getWarehouseStockIssue(customerIdStr, emailIdStr, issue_ref_num);
			modelAndViewObj.addObject("err", responseStr);
			modelAndViewObj.addObject("stockIssueDetails",stockIssueDetailsObj);
			if(stockIssueDetailsObj.getStatus().equals("draft")){
				locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr,emailIdStr);
				if(locationsList == null || locationsList.size()==0){
					modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
				}
				modelAndViewObj.addObject("locationsList", locationsList);
				modelAndViewObj.setViewName("Inventory Manager/warehouse/goodsTransfer/editstockissue");
			}else{
				modelAndViewObj.setViewName("Inventory Manager/warehouse/goodsTransfer/viewstockissue");
			}
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/warehouse/goodsTransfer/allissuedstocks");
		}
		
		
		return modelAndViewObj;
	}*/
	
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param shippedfrom,shippedto,delivered by, inspected by , received by, shipped from & shipped to locations along with receipt item details
     *  
     * This method is used to receive receipt related response data which contains delivered by, inspected by , received by, shipped from & shipped to locations 
     *  along with receipt item details from GUI(user-experience) to webservice via Stock Receipt Service
	 *  
     *  @return ModelAndView 
     */
	/*@RequestMapping("/createWarehouseStockReceipt")
	public ModelAndView createWarehouseStockReceipt(@RequestParam("shippedFrom") String shippedFrom,@RequestParam("shippedTo") String shippedTo,@RequestParam("date") String date,
			@RequestParam("deliveredBy") String deliveredBy,@RequestParam("inspectedBy") String inspectedBy,@RequestParam("receivedBy") String receivedBy,
			@RequestParam("status") String status,@RequestParam("totalQty") String totalQty,@RequestParam("totalCost") String totalCost,@RequestParam("remarks") String remarks,
			@RequestParam("itemDetails") String itemDetails,@RequestParam("receipt_ref_num") String receipt_ref_num,@RequestParam("id_goods_receipt") String id_goods_receipt,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr=null,emailIdStr=null,responseStr=null;
		List<String> locationsList = null;
		try{
			// log.info("Create New Warehouse Stock Receipt Details");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			responseStr = stockReceiptServiceObj.createWarehouseStockReciept(customerIdStr,emailIdStr,shippedFrom,shippedTo,date,deliveredBy,inspectedBy,receivedBy,status,itemDetails,totalQty,totalCost,remarks);
			modelAndViewObj = new ModelAndView();
			locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr,emailIdStr);
			if(locationsList == null || locationsList.size()==0){
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			}
			else
				modelAndViewObj.addObject("err",responseStr);
			modelAndViewObj.addObject("locationsList",locationsList);
			modelAndViewObj.setViewName("Inventory Manager/warehouse/goodsTransfer/newstockreceipt");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/warehouse/goodsTransfer/allstockreceipts");
		}
		
		
		return modelAndViewObj;
	}*/
	
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * 
	 * @param shippedfrom,shippedto,delivered by, inspected by , received by, shipped from & shipped to locations along with receipt item details
     *  
     * This method is used to receive receipt related response data which contains delivered by, inspected by , received by, shipped from & shipped to locations 
     *  along with receipt item details from GUI(user-experience) to webservice via Stock Receipt Service
	 *  
     *  @return ModelAndView 
     */
	/*@RequestMapping("/updateWarehouseStockReceipt")
	public ModelAndView updateWarehouseStockReceipt(@RequestParam("shippedFrom") String shippedFrom,@RequestParam("shippedTo") String shippedTo,@RequestParam("date") String date,
			@RequestParam("deliveredBy") String deliveredBy,@RequestParam("inspectedBy") String inspectedBy,@RequestParam("receivedBy") String receivedBy,
			@RequestParam("status") String status,@RequestParam("totalQty") String totalQty,@RequestParam("totalCost") String totalCost,@RequestParam("remarks") String remarks,
			@RequestParam("itemDetails") String itemDetails,@RequestParam("receipt_ref_num") String receipt_ref_numStr,@RequestParam("id_goods_receipt") String id_goods_receiptStr,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr=null,emailIdStr=null,responseStr=null;
		List<String> locationsList = null;
		try{
			// log.info("Update Warehouse Stock Receipt Details");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			responseStr = stockReceiptServiceObj.updateWarehouseStockReciept(customerIdStr,emailIdStr,shippedFrom,shippedTo,date,deliveredBy,inspectedBy,receivedBy,status,itemDetails,totalQty,totalCost,remarks,receipt_ref_numStr,id_goods_receiptStr);
			modelAndViewObj = new ModelAndView();
			StockReciept stockReceiptDetailsObj = stockReceiptServiceObj.getWarehouseStockReceipt(customerIdStr, emailIdStr, receipt_ref_numStr);
			modelAndViewObj.addObject("err", responseStr);
			modelAndViewObj.addObject("stockReceiptDetails",stockReceiptDetailsObj);
			if(stockReceiptDetailsObj.getStatus().equals("draft")){
				locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr,emailIdStr);
				if(locationsList == null || locationsList.size()==0){
					modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
				}
				modelAndViewObj.addObject("locationsList", locationsList);
				modelAndViewObj.setViewName("Inventory Manager/warehouse/goodsTransfer/editstockreceipt");
			}
			else{
				modelAndViewObj.setViewName("Inventory Manager/warehouse/goodsTransfer/viewstockreceipt");
			}
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/warehouse/goodsTransfer/allstockreceipts");
		}
		return modelAndViewObj;
	}*/
	
	
	
	
	
	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to return the locations based on the states list
	 *
	 **/
	
	@RequestMapping("/getLocations")
	public @ResponseBody List<String> getLocations(@RequestParam("states")String states,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<String> locationList = new ArrayList<String>();
		try{
			// log.info("getLocations");
			// log.info(states);
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			locationList = adminServiceObj.getLocationsListByStates(states,customerIdStr, emailIdStr);
			// log.info("Result:::"+locationList.size());
		}catch(Exception e){
			e.printStackTrace();
		}
		return locationList;
	}
	
	@RequestMapping("/getLocationsforPOGRN")
	public @ResponseBody ArrayList<LocationBean> getLocationsforPOGRN(@RequestParam("storeLocation")String location,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		ArrayList<LocationBean> locationsList = null;
		try{
			// log.info("getLocations");
			// log.info(states);
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			locationsList = genericMasterServiceObj.getLocationDetails(location,customerIdStr,emailIdStr,"0","",false,false,true);

			// log.info("Result:::"+locationList.size());
		}catch(Exception e){
			e.printStackTrace();
		}
		return locationsList;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("/searchdealProducts")
	public @ResponseBody List<ProductsList> searchdealProducts(@RequestParam("searchName") String searchNameStr,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<ProductsList> productsList = new ArrayList<ProductsList>();
		try{
			// log.info("searchdealProducts");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			productsList = productServiceObj.searchProducts(customerIdStr, emailIdStr,searchNameStr);
			// log.info("Result:::"+productsList);
		}catch(Exception e){
			e.printStackTrace();
		}
		return productsList;
	}
	@RequestMapping("/searchskus")
	public @ResponseBody List<ProductsList> searchskus(@RequestParam("productsarray") String productsarray,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<ProductsList> productsList = new ArrayList<ProductsList>();
		try{
			// log.info("searchProducts");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			productsList = productServiceObj.searchSkus(customerIdStr, emailIdStr,productsarray);
		}catch(Exception e){
			e.printStackTrace();
		}
		return productsList;
	}

	
	
	/*@RequestMapping("/deletedeals")
	public ModelAndView deletedeals(@RequestParam("ids") String ids,@RequestParam("location") String location,@RequestParam("type") String type,HttpServletRequest request,HttpServletResponse response){
		// log.info("deleteProduct ");
		List<String> locationsList = null;
		List<Deal> lst_deal = null;
		try{
			int start = 1,end = 10;
			lst_deal = new ArrayList<Deal>();
			modelAndViewObj = new ModelAndView();
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			// log.info(ids + "  " + location);
			String result = dealServiceObj.deleteDeal(customerId,emailId ,ids);
			// log.info(result);
			lst_deal = dealServiceObj.getDeals(customerId,emailId,location,"all","0");
			locationsList = adminServiceObj.getOutletLocationsList(customerId,emailId);
			modelAndViewObj = new ModelAndView();
			
			if(lst_deal == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
				modelAndViewObj.addObject("err","No Deals Found");
			}else{
				if(lst_deal.size()<10){
					end = (lst_deal.size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", lst_deal.get(0).getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("dealDetails",lst_deal);
			}
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("type",type);
			modelAndViewObj.addObject("location",location);
			modelAndViewObj.addObject("err", result);
			modelAndViewObj.setViewName("Inventory Manager/Deals and Offers/dealsandoffers");
			}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}*/
	
	
	
	/*@RequestMapping("/deleteoffers")
	public ModelAndView deleteoffers(@RequestParam("ids") String ids,@RequestParam("location") String location,@RequestParam("type") String type,HttpServletRequest request,HttpServletResponse response){
		// log.info("deleteoffers ");
		List<String> locationsList = null;
		List<Offer> lst_offer = null;
		try{
			int start = 1,end = 10;
			lst_offer = new ArrayList<Offer>();
			modelAndViewObj = new ModelAndView();
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			// log.info(ids + "  " + location);
			String result = offerServiceObj.deleteOffer(customerId,emailId ,ids);
			// log.info(result);
			lst_offer = offerServiceObj.getOffers(customerId,emailId,location,"all","0","10",false,"");
			locationsList = adminServiceObj.getOutletLocationsList(customerId,emailId);
			if(lst_offer == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
				modelAndViewObj.addObject("err","No Offers Found");
			}else{
				if(lst_offer.size()<10){
					end = (lst_offer.size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(lst_offer.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("offerDetails",lst_offer);
			}
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("type",type);
			modelAndViewObj.addObject("location",location);
			modelAndViewObj.addObject("err", result);
			modelAndViewObj.setViewName("Inventory Manager/Deals and Offers/dealsandoffers");
			
			}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}*/

	/*@RequestMapping("/salesreports")
	public ModelAndView salesreports(HttpServletRequest request,HttpServletResponse response){
		// log.info("InventoryManagerController - salesreports");
		
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("Inventory Manager/Reports/salesreports");
		return modelAndViewObj;
	}
	@RequestMapping("/getCounterWiseSalesReports")
	public ModelAndView getCounterWiseSalesReports(SalesReportsByCounter salesreports,HttpServletRequest request,HttpServletResponse response){
		// log.info("InventoryManagerController - getCounterWiseSalesReports");
		List<String> locationsList = null;
		List<String> counters = null;
		List<?> reports = null;
		String startIndex = "-1";
		try{
		modelAndViewObj = new ModelAndView();
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
//		salesreports.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr, emailIdStr));
		modelAndViewObj = new ModelAndView();
		locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
		counters = salesReportsServiceObj.getCounters(locationsList.get(0),customerIdStr,emailIdStr,startIndex);
		salesreports.setCounterId(counters.get(0));
		salesreports.setStore_location(locationsList.get(0));
		//reports = salesReportsServiceObj.getSaleReportsByCounter(salesreports);
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("counters", counters);
		modelAndViewObj.addObject("reports", reports);
		modelAndViewObj.addObject("selectedCounter", counters.get(0));
		modelAndViewObj.addObject("selectedLocation", locationsList.get(0));
		modelAndViewObj.setViewName("Inventory Manager/Reports/salesreportsbycounter");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	@RequestMapping("/getSalesRepotrsBasedOnCounter")
	public ModelAndView getSalesRepotrsBasedOnCounter(SalesReportsByCounter salesreports,HttpServletRequest request,HttpServletResponse response){
		// log.info("InventoryManagerController - getSalesRepotrsBasedOnCounter");
		List<String> locationsList = null;
		List<String> counters = null;
		List<?> reports = null;
		String startIndex = "-1";
		try{
		modelAndViewObj = new ModelAndView();
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
//		salesreports.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr, emailIdStr));
		modelAndViewObj = new ModelAndView();
		locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
		counters = salesReportsServiceObj.getCounters(locationsList.get(0),customerIdStr,emailIdStr,startIndex);
		reports = salesReportsServiceObj.getSaleReportsByCounter(salesreports);
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("counters", counters);
		modelAndViewObj.addObject("reports", reports);
		modelAndViewObj.addObject("selectedCounter", salesreports.getCounterId());
		modelAndViewObj.addObject("selectedLocation", locationsList.get(0));
		modelAndViewObj.setViewName("Inventory Manager/Reports/salesreportsbycounter");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}*/
	
	
	
	
	
	
	
	
	
	/**
	 * @author Mythri.S
	 * @param request
	 * @param response
	 * @return returns a jsp which displays all the icons of outlet management flow
	 */
	@RequestMapping("/showOutletFlows")
	public ModelAndView showOutletFlows(HttpServletRequest request,HttpServletResponse response){
		// log.info("InventoryManagerController - showOutletFlows");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("Inventory Manager/retailoutlets/outletmanagement");
		return modelAndViewObj;
	}
	
	/**
	 * @author Mythri.S
	 * @param request
	 * @param response
	 * @return returns a jsp which displays all the icons of bills flow under outlet management flow
	 */
	
	@RequestMapping("/showBillsFlows")
	public ModelAndView showBillsFlows(@RequestParam("flowLocation") String flowLocation,HttpServletRequest request,HttpServletResponse response){
		// log.info("InventoryManagerController - showBillsFlows");
		modelAndViewObj = new ModelAndView();
		 modelAndViewObj.addObject("flowLocation", flowLocation);
		modelAndViewObj.setViewName("Inventory Manager/Billing/billsFlow");
		return modelAndViewObj;
	}
	
	
	/**
	 * @author Mythri.S
	 * @param request
	 * @param response
	 * @return returns a jsp which displays all the icons of orders flow under outlet management flow
	 */
	
	@RequestMapping("/showOutletOrdersFlows")
	public ModelAndView showOutletOrdersFlows(HttpServletRequest request,HttpServletResponse response){
		// log.info("showOutletOrdersFlows");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("OrderManagement/showCustomerOrdersFlow");
		return modelAndViewObj;
	}
	
	/**
	 * @author Mythri.S
	 * @param request
	 * @param response
	 * @return returns a jsp which displays all the icons of orders flow under outlet management flow
	 */
	
	@RequestMapping("/showWarehouseOrders")
	public ModelAndView showWarehouseOrders(HttpServletRequest request,HttpServletResponse response){
		// log.info("showWarehouseOrders");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("Inventory Manager/Orders/warehouseOrdersFlow");
		return modelAndViewObj;
	}
	
	
	
	/**
	 * @author Mythri.S
	 * @param request
	 * @param response
	 * @return returns a jsp which displays all the icons of inventory management flow under outlet management flow
	 */
	@RequestMapping("/showInventoryManagementFlows")
	public ModelAndView showInventoryManagementFlows(HttpServletRequest request,HttpServletResponse response){
		// log.info("InventoryManagerController - showInventoryManagementFlows");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("Inventory Manager/retailoutlets/inventoryManagementFlow");
		return modelAndViewObj;
	}
	
	/**
	 * @author Mythri.S
	 * @param request
	 * @param response
	 * @return returns a jsp which displays all the icons of procurement flow under warehouse management flow
	 */
	@RequestMapping("/showOutletStocksFlow")
	public ModelAndView showOutletStocksFlow(HttpServletRequest request,HttpServletResponse response){
		// log.info("showOutletStocksFlow");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("Stocks/OutletStocksFlow");
		return modelAndViewObj;
	}
	
	/**
	 * @author Mythri.S
	 * @param request
	 * @param response
	 * @return returns a jsp which displays all the icons of procurement flow under warehouse management flow
	 */
	@RequestMapping("/showWarehouseStockManagementFlows")
	public ModelAndView showWarehouseStockManagementFlows(HttpServletRequest request,HttpServletResponse response){
		// log.info("showWarehouseStockManagementFlows");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("Stocks/WarehouseStocksManagementFlow");
		return modelAndViewObj;
	}
	
	
	/**
	 * @author Mythri.S
	 * @param request
	 * @param response
	 * @return returns a jsp which displays all the icons of procurement flow under warehouse management flow
	 */
	@RequestMapping("/showWarehouseStocksFlow")
	public ModelAndView showWarehouseStocksFlow(HttpServletRequest request,HttpServletResponse response){
		// log.info("showWarehouseStocksFlow");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("Stocks/WarehouseStocksFlow");
		return modelAndViewObj;
	}
	
	/**
	 * @author Mythri.S
	 * @param request
	 * @param response
	 * @return returns a jsp which displays all the icons of procurement flow under warehouse management flow
	 */
	@RequestMapping("/showOutletHealthFlows")
	public ModelAndView showOutletHealthFlows(HttpServletRequest request,HttpServletResponse response){
		// log.info("showOutletHealthFlows");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("Inventory Manager/OutletHealth/OutletHealthFlows");
		return modelAndViewObj;
	}
	
	
	/**
	 * @author Mythri.S
	 * @param request
	 * @param response
	 * @return returns a jsp which displays all the icons of procurement flow under warehouse management flow
	 */
	@RequestMapping("/showOutletGoodsTransferFlow")
	public ModelAndView showOutletGoodsTransferFlow(HttpServletRequest request,HttpServletResponse response){
		// log.info("showOutletGoodsTransferFlow");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("GoodsTransfer/GoodsTransferFlows");
		return modelAndViewObj;
	}
	
	/**
	 * @author Mythri.S
	 * @param request
	 * @param response
	 * @return returns a jsp which displays all the icons of procurement flow under warehouse management flow
	 */
	@RequestMapping("/showWarehouseGoodsTrasferFlow")
	public ModelAndView showWarehouseGoodsTrasferFlow(HttpServletRequest request,HttpServletResponse response){
		// log.info("showWarehouseGoodsTrasferFlow");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("GoodsTransfer/WarehouseGoodsTransferFlows");
		return modelAndViewObj;
	}
	
	/**
	 * @author Mythri.S
	 * @param request
	 * @param response
	 * @return returns a jsp which displays all the icons of procurement flow under warehouse management flow
	 */
	@RequestMapping("/showProcurementFlow")
	public ModelAndView showProcurementFlow(HttpServletRequest request,HttpServletResponse response){
		// log.info("InventoryManagerController - showProcurementFlow");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("Inventory Manager/warehouse/procurement/procurementflow");
		return modelAndViewObj;
	}
	
	
	
	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On : 28-jun-2015
	 * 
	 * This method returns the newPurchaseOrder JSP.
	 * It retrieves location list and adds it to the model object as it needs to be dynamically populated in the view.
	 *
	 **/
	/*@RequestMapping("/newPurchaseOrder")
	public ModelAndView newPurchaseOrder(HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("newPurchaseOrder");
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			// log.info(request.getLocale());
			List<String> workLocationsList = adminServiceObj.getLocationsList(customerId,emailId);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.setViewName("Inventory Manager/warehouse/procurement/newPurchaseOrder");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}*/
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 6-may-2015.
	 * 
	 * This method is used to search supplier.
	 * It returns the supplier list matching the search string
	 * 
	 */
	
	@RequestMapping("/searchSuppliers")
	public @ResponseBody List<SupplierBean> searchSuppliers(@RequestParam("searchName") String searchNameStr,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<SupplierBean> suppliersList = new ArrayList<SupplierBean>();
		try{
			// log.info("searchSuppliers");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			suppliersList = outletMasterServiceObj.searchSuppliers(customerIdStr, emailIdStr,searchNameStr,"0","");
			// log.info("Result:::"+suppliersList);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return suppliersList;
	}
	
	
	/**
	 * 
	 * @author Mythri.S
	 * Created on: 28-jun-2015
	 * 
	 * 
	 * This method is used to create new purchase order.
	 * It accepts all the purchase order details need to be saved into database.
	 * It returns newPurchaseOrder JSP along with a message of successful creation or not.
	 *
	 **/
	
	/*@RequestMapping(value="/createPurchaseOrder",method=RequestMethod.POST)
	public ModelAndView createPurchaseOrder(@RequestBody PurchaseOrder purchaseOrderDetails,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("createPurchaseOrder");
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		modelAndViewObj = new ModelAndView();
		JSONArray jsonResponseArray = new JSONArray(purchaseOrderDetails.getItemDetails());
		List<WHPurchaseOrderItems> itemDetails = new ArrayList<WHPurchaseOrderItems>();
		for (int i=0; i<jsonResponseArray.length(); i++) {
			WHPurchaseOrderItems items = gson.fromJson(jsonResponseArray.getString(i), WHPurchaseOrderItems.class);
			itemDetails.add(items);
		}
		purchaseOrderDetails.setWhPurchaseItems(itemDetails);
		String result = procurementServiceObj.createPurchaseOrder(purchaseOrderDetails,customerIdStr,emailIdStr);
		List<String> workLocationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr);
		modelAndViewObj.addObject("workLocationsList", workLocationsList);
		modelAndViewObj.addObject("err", result);
		modelAndViewObj.setViewName("Inventory Manager/warehouse/procurement/newPurchaseOrder");
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}*/
	
	
	/**
	 * 
	 * @author Mythri.S
	 * Created on :1-jul-2015.
	 * 
	 * This method is used to update the existing purchase order Details.
	 * It accepts the order details need to be saved into database.
	 * It returns editPurchaseOrder JSP along with the updated details and message related to update success or not.
	 *
	 **/
	
	/*@RequestMapping(value="/updatePurchaseOrder",method=RequestMethod.POST)
	public ModelAndView updatePurchaseOrder(@RequestBody PurchaseOrder purchaseOrderDetails,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("updatePurchaseOrder");
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		modelAndViewObj = new ModelAndView();
		JSONArray jsonResponseArray = new JSONArray(purchaseOrderDetails.getItemDetails());
		List<WHPurchaseOrderItems> itemDetails = new ArrayList<WHPurchaseOrderItems>();
		for (int i=0; i<jsonResponseArray.length(); i++) {
			WHPurchaseOrderItems items = gson.fromJson(jsonResponseArray.getString(i), WHPurchaseOrderItems.class);
			itemDetails.add(items);
		}
		purchaseOrderDetails.setWhPurchaseItems(itemDetails);
		String result = procurementServiceObj.updatePurchaseOrder(purchaseOrderDetails,customerIdStr,emailIdStr);
		List<String> workLocationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr);
		modelAndViewObj.addObject("workLocationsList", workLocationsList);
		modelAndViewObj.addObject("err", result);
		modelAndViewObj.addObject("purchaseOrderBeanObj", purchaseOrderDetails);
		modelAndViewObj.setViewName("Inventory Manager/warehouse/procurement/editPurchaseOrder");
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}*/
	
	
	/* 01-07-2015   Warehouse configuration flows start  */
	
	/* Created By : Sambaiah Y
	 * Created On : 25-05-2015
	 * 
	 * used to load the warehouse home page
	 * */
	@RequestMapping("/showWarehouseFlows")
	public ModelAndView showWarehouseFlows(HttpServletRequest request,HttpServletResponse response){
		// log.info("InventoryManagerController - showWarehouseFlows");
		
		modelAndViewObj = new ModelAndView();
	
		modelAndViewObj.setViewName("Inventory Manager/warehouse/warehouse");
		return modelAndViewObj;
	}
	
	
	
	
	
	
	//koti
	
	@RequestMapping("/skuSuppliers")
	public @ResponseBody SupplierResponseBean skuSuppliers(
			@RequestParam("skuid") String skuid,
			@RequestParam("LocationType") String LocationType,
			@RequestParam("storeLocation") String storeLocation,@RequestParam("issue") boolean issue,
			HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		SupplierResponseBean skuSuppliers = new SupplierResponseBean();
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			skuSuppliers = outletMasterServiceObj.skuSuppliers(skuid,LocationType,storeLocation,issue);
			 
			
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return skuSuppliers;
	}
	
	
	
	
	
	
	
	
	
	
	

	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to view the Purchase Orders in a tabular format
	 *
	 **/
	@RequestMapping("/viewAutoPurchaseOrder")
	public ModelAndView viewAutoPurchaseOrder(@RequestParam("operation") String operation,@RequestParam("index")String index,HttpServletRequest request,HttpServletResponse response){
    Warehouse warehouse = null;
		
			
	List<String> locationsList =null;
		try{
		
			warehouse = new Warehouse();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			
			 List<Warehouse> warehouses = warehouseServiceObj.getWarehouses(warehouse);
			 locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			 
		List<PurchaseOrder> purchaseOrderBeansList = procurementServiceObj.getPurchaseOrders(operation,customerIdStr, emailIdStr,"",index,"10","","","",true,"","","","");

	         
		int start = 1,end = 10;
		modelAndViewObj = new ModelAndView();
		if(purchaseOrderBeansList == null || purchaseOrderBeansList.size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(purchaseOrderBeansList.size()<10){
				end = (purchaseOrderBeansList.size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			modelAndViewObj.addObject("totalRecords", Integer.parseInt(purchaseOrderBeansList.get(0).getTotalRecords()));
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
		}
		 modelAndViewObj.addObject("maxRecords",Integer.parseInt("10"));
		
		
		
		
		
		
		modelAndViewObj.addObject("purchaseOrderBeansList", purchaseOrderBeansList);
				modelAndViewObj.addObject("warehouses",warehouses);
				modelAndViewObj.addObject("locationsList", locationsList);
				

			
				
//			
			modelAndViewObj.setViewName("Procurement/PurchaseOrder/GeneratePurchaseOrder");
//			}
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	

	
	
	@RequestMapping(value="/generateAutoPO",method=RequestMethod.POST)
	public ModelAndView generateAutoPO(@RequestParam("location") String location,@RequestParam("operation") String operation,@RequestParam("index") String index,HttpServletRequest request,HttpServletResponse response){
	
		
		try{
			//// log.info("Auto Generate PO");
			Warehouse warehouse = null;
			List<String> locationsList =null;
			
			
			warehouse = new Warehouse();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			
			
			 List<Warehouse> warehouses = warehouseServiceObj.getWarehouses(warehouse);
			 
			 locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			 
			
					
			
			
			modelAndViewObj = new ModelAndView();
			PurchaseOrder autoPO = procurementServiceObj.generateAutoPO(location);
			/*modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("warehouseList", warehouseLocationsList);*/
			
			List<PurchaseOrder> purchaseOrderBeansList = procurementServiceObj.getPurchaseOrders(operation,customerIdStr, emailIdStr,location,index,"10","","","",true,"","","","");

			
			
			
			int start = 1,end = 10;
			modelAndViewObj = new ModelAndView();
			if(purchaseOrderBeansList == null || purchaseOrderBeansList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(purchaseOrderBeansList.size()<10){
					end = (purchaseOrderBeansList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(purchaseOrderBeansList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			 modelAndViewObj.addObject("maxRecords",Integer.parseInt("10"));
			
			
			
			modelAndViewObj.addObject("purchaseOrderBeansList", purchaseOrderBeansList);
			
			modelAndViewObj.addObject("autoPO", autoPO);
			modelAndViewObj.addObject("warehouses",warehouses);
			modelAndViewObj.addObject("locationsList", locationsList);
			
			if(autoPO.getResponseMessage().equals("Success")){
				modelAndViewObj.addObject("success",autoPO.getResponseMessage());

			}else{
				modelAndViewObj.addObject("err",autoPO.getResponseMessage());
			}
			
			modelAndViewObj.setViewName("Procurement/PurchaseOrder/GeneratePurchaseOrder");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	
	
	
	
	
	
	/* Created By : Sambaiah Y
	 * Created On : 25-05-2015
	 * 
	 * used to get the all warehouses from database
	 * */
	@RequestMapping("/getWareHouses")
	public ModelAndView getWareHouses(@RequestParam("index")String index,@RequestParam("id")String id,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
		// log.info("InventoryManagerController - getWareHouses");
//		List<String> locationsList = null;
		Warehouse warehouse = null;
		try{
			warehouse = new Warehouse();
//			String customerIdStr = (String)request.getSession().getAttribute("customerId");
//			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			/* for getting the locations  */
//			locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr);
			/* add request header to warehouse object */
//			warehouse.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr, emailIdStr));
//			warehouse.setWarehouseLocation(locationsList.get(0));
			warehouse.setWarehouseLocation("all");
			warehouse.setStartIndex(index);
			warehouse.setSearchCriteria(searchName);
			/* for getting the warehouses from db */
			List<Warehouse> warehouses = warehouseServiceObj.getWarehouses(warehouse);
			int start = 1,end = 10;
			modelAndViewObj = new ModelAndView();
			if(warehouses == null || warehouses.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(warehouses.size()<10){
					end = (warehouses.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(warehouses.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("warehouses",warehouses);
			 modelAndViewObj.addObject("maxRecords",Integer.parseInt("10"));
//			modelAndViewObj.addObject("locationsList", locationsList);
//			modelAndViewObj.addObject("location", locationsList.get(0));
			 modelAndViewObj.addObject("id",id);
			 modelAndViewObj.addObject("searchName",searchName);
			
		}catch(Exception exception){
			exception.printStackTrace();
			//modelAndViewObj.addObject("location", locationsList.get(0));
		//	modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("err","Something Went Wrong!");
		}
		modelAndViewObj.setViewName("Inventory Manager/warehouse/allwarehouses");
		return modelAndViewObj;
	}
	
	/* Created By : Sambaiah Y
	 * Created On : 25-05-2015
	 * 
	 * used to get the all warehouses from database
	 * */
	/*@RequestMapping("/getWareHousesByLocation")
	public ModelAndView getWareHousesByLocation(@RequestParam("location")String location,HttpServletRequest request,HttpServletResponse response){
		// log.info("InventoryManagerController - getWareHousesByLocation");
		List<String> locationsList = null;
		Warehouse warehouse = null;
		try{
			warehouse = new Warehouse();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			 for getting the locations  
			locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr);
			 add request header to warehouse object 
			warehouse.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr, emailIdStr));
			warehouse.setWarehouseLocation(location);
			warehouse.setStartIndex("-1");
			 for getting the warehouses from db 
			List<Warehouse> warehouses = warehouseServiceObj.getWarehouses(warehouse);
			
			modelAndViewObj.addObject("warehouses",warehouses);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("location", location);
			
			
		}catch(Exception exception){
			exception.printStackTrace();
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("location", location);
			modelAndViewObj.addObject("err","Failed to Get Locations");
		}
		
		modelAndViewObj.setViewName("Inventory Manager/warehouse/allwarehouses");
		return modelAndViewObj;
	}*/
	
	/* Created By : Sambaiah Y
	 * Created On : 10-06-2015
	 * 
	 * used to configure the new warehouse
	 * */
	@RequestMapping("/warehouseconfiguration")
	public ModelAndView warehouseconfiguration(@RequestParam("id")String id,HttpServletRequest request,HttpServletResponse response){
		// log.info("InventoryManagerController - warehouseconfiguration");
		Warehouse warehouse = null;
		try{
		List<String> locationsList = null;
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		modelAndViewObj = new ModelAndView();
		locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,"Warehouse");
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("warehouse", new Warehouse());
		if(id == "WarehousePOSs" || id.equals("WarehousePOSs")){
		warehouse = new Warehouse();
//		
		warehouse.setWarehouseLocation("all");
		warehouse.setStartIndex("0");
	
	List<Warehouse> warehouses = warehouseServiceObj.getWarehouses(warehouse);
	modelAndViewObj.addObject("warehouses", warehouses);
		}
		}catch(Exception exception){
			exception.printStackTrace();
			modelAndViewObj.addObject("err","Something Went Wrong!");
		}
		if(id == "WarehousePOSs" || id.equals("WarehousePOSs")){
			modelAndViewObj.setViewName("Inventory Manager/warehouse/newwarehouse");
		}else{
		modelAndViewObj.setViewName("Inventory Manager/warehouse/newwarehouseconfig");
		}
		return modelAndViewObj;
	}
	/* Developed By : Sambaiah Y
	 * Created on   : 19-06-2015
	 * Modified By  :
	 * This method is used to display the configuration view to the customer 
	 */
	@RequestMapping(value="/newwarehouseconfiguration",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView newwarehouseconfiguration(@RequestBody Warehouse warehouse , HttpServletRequest request,HttpServletResponse response){
		// log.info("InventoryManagerController - newwarehouseconfiguration");
		// log.info(new Gson().toJson(warehouse));
	
		Warehouse warehouseObj = null;
		try{
		List<String> locationsList = null;
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		modelAndViewObj = new ModelAndView();
		/* get warehouses based on the location */
//		warehouse.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr, emailIdStr));
		warehouse.setWarehouseLocation(warehouse.getWarehouseLocation());
		warehouse.setStartIndex("-1");
	//List<Warehouse> warehouses = warehouseServiceObj.getWarehouses(warehouse);
		
		////////System.out.println("----warehouse data---- "+warehouse);
		locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,"Warehouse");
	/*if(warehouses.size()>0){
			modelAndViewObj.addObject("err","Warehouse is already there in selected location, Please select another location");
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("warehouse", warehouse);
			modelAndViewObj.setViewName("Inventory Manager/warehouse/newwarehouse");
		}
		else{*/
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
			ArrayList<String> categoriesList = new ArrayList<String>();
			if(categoryList != null)
				for(ProductCategoryBean productCategoryBean : categoryList)
					categoriesList.add(productCategoryBean.getCategoryDescription());
			String str_response = null;
			warehouseObj = warehouseServiceObj.createWarehouse(warehouse);
			////System.out.println(gson.toJson(warehouseObj));
			
			
			if(warehouseObj.getResponseHeader().getResponseMessage().equals(AppProperties.getAppMessageByProperty("WAREHOUSE_CREATED_SUCCESS").trim())){
				modelAndViewObj.addObject("success",warehouseObj.getResponseHeader().getResponseMessage());
				modelAndViewObj.addObject("locationsList", locationsList);
				//modelAndViewObj.addObject("storeCode",storeCode);
				modelAndViewObj.addObject("location", warehouse.getWarehouseLocation());
				modelAndViewObj.addObject("warehouseidcreated",warehouseObj.getWarehouseId());
				modelAndViewObj.setViewName("Inventory Manager/warehouse/wareHouseconfigurations");
				str_response = "Add atleast one storage system";
				modelAndViewObj.addObject("err",str_response);
				
			}else{
			
			Warehouse getWarehouses = new Warehouse();
			getWarehouses.setWarehouseLocation("all");
			getWarehouses.setStartIndex("0");
			/* for getting the warehouses from db */
			List<Warehouse> warehouses = warehouseServiceObj.getWarehouses(getWarehouses);
			int start = 1,end = 10;
			
			if(warehouses == null || warehouses.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(warehouses.size()<10){
					end = (warehouses.size());
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(warehouses.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", start);
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("warehouses",warehouses);

			
//		String subCategories = masterServiceObj.getCategories(customerIdStr,emailIdStr);
//		ArrayList<String> categories = masterServiceObj.getCategoriesList(subCategories);
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("location", warehouse.getWarehouseLocation());
		modelAndViewObj.addObject("categories", categoriesList);
		modelAndViewObj.addObject("warehouse",new Gson().toJson(warehouse));
		
		if(warehouseObj.getResponseHeader().getResponseMessage().equals(AppProperties.getAppMessageByProperty("WAREHOUSE_UPDATE_SUCCESS").trim()) )
			modelAndViewObj.addObject("success",warehouseObj.getResponseHeader().getResponseMessage());
			else
	        modelAndViewObj.addObject("err",warehouseObj.getResponseHeader().getResponseMessage());
		
		
		modelAndViewObj.setViewName("Inventory Manager/warehouse/allwarehouses");
			/*}*/
		/*}*/}
		}catch(Exception exception){
			exception.printStackTrace();
			modelAndViewObj.addObject("err","Something Went Wrong!");
		}
		
		return modelAndViewObj;
	}
	
	/* Developed By : Sambaiah Y
	 * Created on   : 19-06-2015
	 * Modified By  :
	 * This method is used to save the warehouse details in database
	 */
	@RequestMapping(value="/savewarehouse",method=RequestMethod.POST)
	public ModelAndView savewarehouse(Warehouse warehouse, HttpServletRequest request,HttpServletResponse response){
		// log.info("InventoryManagerController - savewarehouse");
		// log.info(gson.toJson(warehouse));
		Warehouse obj_warehouse = null;
		WarehouseStorageSystems obj_storageSystems = null;
		List<WarehouseStorageSystems> lst_storageSystems = null;
		Warehouse getWarehouses = new Warehouse();
		List<String> locationsList = null;
		try{
			obj_warehouse = new Warehouse();
			obj_storageSystems = new WarehouseStorageSystems();
			lst_storageSystems = new ArrayList<WarehouseStorageSystems>();
		
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		
	//	modelAndViewObj = new ModelAndView();
		/* convert warehouse details string to object */
		obj_warehouse = new Gson().fromJson(warehouse.getWarehouseDetails(), Warehouse.class);
		/* convert storage systems string to  */
		String str_response = null;
		Warehouse warehouseObj = null;
		modelAndViewObj = new ModelAndView();
		try{
			String storageSystems = Response.getResponseList(warehouse.getStorageStstemDetails(),"storageArray");
			JSONArray jsonStorageSystems = new JSONArray(storageSystems);
			for (int i=0; i<jsonStorageSystems.length(); i++) {
				obj_storageSystems = gson.fromJson(jsonStorageSystems.getString(i), WarehouseStorageSystems.class);
				lst_storageSystems.add(obj_storageSystems);
			}
			obj_warehouse.setStorageSystems(lst_storageSystems);
			obj_warehouse.setWarehouseDetails("");
			obj_warehouse.setStorageStstemDetails("");
//			obj_warehouse.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr, emailIdStr));
			warehouseObj = warehouseServiceObj.createWarehouse(obj_warehouse);
			/* save warehouse */
		}catch(JSONException jsonException){
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
			ArrayList<String> categoriesList = new ArrayList<String>();
			if(categoryList != null)
				for(ProductCategoryBean productCategoryBean : categoryList)
					categoriesList.add(productCategoryBean.getCategoryDescription());
//			String subCategories = masterServiceObj.getCategories(customerIdStr,emailIdStr);
//			ArrayList<String> categories = masterServiceObj.getCategoriesList(subCategories);
			locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,"Warehouse");
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("location", obj_warehouse.getWarehouseLocation());
			modelAndViewObj.addObject("categories", categoriesList);
			modelAndViewObj.addObject("warehouse",new Gson().toJson(obj_warehouse));
			modelAndViewObj.setViewName("Inventory Manager/warehouse/warehouseconfiguration");
			str_response = "Add atleast one storage system";
			modelAndViewObj.addObject("err",str_response);
			return modelAndViewObj;
		}
		catch(Exception exception){
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
			ArrayList<String> categoriesList = new ArrayList<String>();
			if(categoryList != null)
				for(ProductCategoryBean productCategoryBean : categoryList)
					categoriesList.add(productCategoryBean.getCategoryDescription());
//			String subCategories = masterServiceObj.getCategories(customerIdStr,emailIdStr);
//			ArrayList<String> categories = masterServiceObj.getCategoriesList(subCategories);
			locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,"Warehouse");
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("location", obj_warehouse.getWarehouseLocation());
			modelAndViewObj.addObject("categories", categoriesList);
			modelAndViewObj.addObject("warehouse",new Gson().toJson(obj_warehouse));
			modelAndViewObj.setViewName("Inventory Manager/warehouse/warehouseconfiguration");
			str_response = "Add atleast one storage system";
			modelAndViewObj.addObject("err",str_response);
			return modelAndViewObj;
		}
		/* get locations */
		locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,"Warehouse");
		/* get warehouses */
//		getWarehouses.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr, emailIdStr));
		getWarehouses.setWarehouseLocation("all");
		getWarehouses.setStartIndex("0");
		/* for getting the warehouses from db */
		List<Warehouse> warehouses = warehouseServiceObj.getWarehouses(getWarehouses);
		int start = 1,end = 10;
		
		if(warehouses == null || warehouses.size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(warehouses.size()<10){
				end = (warehouses.size());
			}
			modelAndViewObj.addObject("totalRecords", Integer.parseInt(warehouses.get(0).getTotalRecords()));
			modelAndViewObj.addObject("index", start);
			modelAndViewObj.addObject("totalValue", end);
		}
		modelAndViewObj.addObject("warehouses",warehouses);
//		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("location",obj_warehouse.getWarehouseLocation());
		if(str_response.equals(AppProperties.getAppMessageByProperty("WAREHOUSE_UPDATE_SUCCESS").trim()) || str_response.equals(AppProperties.getAppMessageByProperty("WAREHOUSE_CREATED_SUCCESS").trim()))
			modelAndViewObj.addObject("success",str_response);
			else
	        modelAndViewObj.addObject("err",str_response);
		
		
		}catch(Exception exception){
			exception.printStackTrace();
			modelAndViewObj.addObject("location",obj_warehouse.getWarehouseLocation());
//			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("err","Something Went Wrong!");
		}
		modelAndViewObj.setViewName("Inventory Manager/warehouse/allwarehouses");
		return modelAndViewObj;
	}
	
	/* 24-06-2015   Sambaiah Y
	 * This method is used to display the all storage systems  */
	@RequestMapping("/viewwarehousestoragesystems")
	public ModelAndView viewwarehousestoragesystems(@RequestParam("warehouseId")String warehouseId,@RequestParam("purpose")String purpose, HttpServletRequest request){
		// log.info("InventoryManagerController - viewwarehousestoragesystems");
		Warehouse warehouse = null;
		WarehouseResponse response = null;
		try{
			warehouse = new Warehouse();
			response = new WarehouseResponse();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			
//			warehouse.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr, emailIdStr));
			warehouse.setWarehouseId(warehouseId);
			response = warehouseServiceObj.getWarehouseDetails(warehouse);
			
			/* for getting the categories details */
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
			ArrayList<String> categoriesList = new ArrayList<String>();
			if(categoryList != null)
				for(ProductCategoryBean productCategoryBean : categoryList)
					categoriesList.add(productCategoryBean.getCategoryDescription());
//			String subCategories = masterServiceObj.getCategories(customerIdStr,emailIdStr);
//			List<String> categories = masterServiceObj.getCategoriesList(subCategories);
			
			modelAndViewObj.addObject("location", response.getWarehouse().getWarehouseLocation());
			modelAndViewObj.addObject("categoriesList", categoriesList);
			modelAndViewObj.addObject("storages",response);
			modelAndViewObj.addObject("warehouse",response.getWarehouse());
			
			
		}catch(Exception exception){
			exception.printStackTrace();
			modelAndViewObj.addObject("err","Something Went Wrong!");
		}
		if(purpose.equalsIgnoreCase("view")){
		modelAndViewObj.setViewName("Inventory Manager/warehouse/viewwarehousestoragesystems");}
		if(purpose.equalsIgnoreCase("edit")){
			modelAndViewObj.setViewName("Inventory Manager/warehouse/editwarehousestoragesystems");}
		return modelAndViewObj;
	}
	
	/* 24-06-2015   Sambaiah Y
	 * This method is used to display the all warehouse information */
	@RequestMapping(value = "/viewwarehouse", method = RequestMethod.POST)
	public ModelAndView viewwarehouse(@RequestParam("warehouseId")String warehouseId,@RequestParam("purpose")String purpose,@RequestParam("id")String id,HttpServletRequest request){
		// log.info("InventoryManagerController - viewwarehouse");
		Warehouse warehouse = null;
		WarehouseResponse response = null;
		try{
			warehouse = new Warehouse();
			response = new WarehouseResponse();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			
//			warehouse.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr, emailIdStr));
			warehouse.setWarehouseId(warehouseId);
			response = warehouseServiceObj.getWarehouseDetails(warehouse);
			modelAndViewObj.addObject("wareHouse",response.getWarehouse());
			//modelAndViewObj.addObject("WareHouseDetails",response.getWarehousePOSList().get(0));
			modelAndViewObj.addObject("flowdes",purpose);
			
			List<String> locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,"Warehouse");
			
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("id", id);
			
		}catch(Exception exception){
			exception.printStackTrace();
			modelAndViewObj.addObject("err","Something Went Wrong!");
		}
		if(purpose == "view" || purpose.equalsIgnoreCase("view"))
		/*	if(id == "WarehousePOSs" || id.equalsIgnoreCase("WarehousePOSs")){
				modelAndViewObj.setViewName("Inventory Manager/warehouse/viewwarehouse");
			}else{*/
				modelAndViewObj.setViewName("Inventory Manager/warehouse/viewwarehouseconfig");
			/*}*/
		if(purpose == "edit" || purpose.equalsIgnoreCase("edit"))
			/*if(id == "WarehouseConfigurations" || id.equalsIgnoreCase("WarehouseConfigurations")){*/
				modelAndViewObj.setViewName("Inventory Manager/warehouse/editwareHouseconfig");
			/*}else{
				modelAndViewObj.setViewName("Inventory Manager/warehouse/editwareHouse");
			}*/
		return modelAndViewObj;
		
	}
	
	
	
	
	@RequestMapping(value = "/viewwarehousepos", method = RequestMethod.POST)

	public ModelAndView viewwarehousepos(@RequestParam("warehouseId")String warehouseId,@RequestParam("warehouselocation")String warehouselocation,@RequestParam("purpose")String purpose,@RequestParam("id")String id,HttpServletRequest request){
		// log.info("InventoryManagerController - viewwarehouse");
		Warehouse warehouse = null;
		WarehousePOS response = null;
		WarehouseResponse responses = null;
		try{
			warehouse = new Warehouse();
			response = new WarehousePOS();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			
//			warehouse.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr, emailIdStr));
			warehouse.setWarehouseId(warehouseId);
			warehouse.setLocation(warehouselocation);
			
			response = warehouseServiceObj.getWarehouseposDetails(warehouse);
			responses = warehouseServiceObj.getWarehouseDetails(warehouse);
			modelAndViewObj.addObject("wareHouse",responses.getWarehouse());
			
			modelAndViewObj.addObject("wareHouseDetails",response.getPosList().get(0));
			//modelAndViewObj.addObject("WareHouseDetails",response.getWarehousePOSList().get(0));
			modelAndViewObj.addObject("flowdes",purpose);
			
			List<String> locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,"Warehouse");
			
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("id", id);
			
		}catch(Exception exception){
			exception.printStackTrace();
			modelAndViewObj.addObject("err","Something Went Wrong!");
		}
		if(purpose == "view" || purpose.equalsIgnoreCase("view"))
			//if(id == "WarehousePOSs" || id.equalsIgnoreCase("WarehousePOSs")){
				modelAndViewObj.setViewName("Inventory Manager/warehouse/viewwarehouse");
				/*}else
				modelAndViewObj.setViewName("Inventory Manager/warehouse/viewwarehouseconfig");
			/*}*/
		if(purpose == "edit" || purpose.equalsIgnoreCase("edit"))
			/*if(id == "WarehouseConfigurations" || id.equalsIgnoreCase("WarehouseConfigurations")){
				modelAndViewObj.setViewName("Inventory Manager/warehouse/editwareHouseconfig");
			}else{*/
				modelAndViewObj.setViewName("Inventory Manager/warehouse/editwareHouse");
			/*}*/
		return modelAndViewObj;
		
	}
	
	/* 24-06-2015   Sambaiah Y
	 * This method is used to update the warehouse details in database */
	@RequestMapping("/editwarehousedetails")
	public ModelAndView editwarehousedetails(Warehouse warehouse,HttpServletRequest request){
		// log.info("InventoryManagerController - viewwarehouse");
		WarehouseResponse response = null;
		String str_response = null;
		List<String> locationsList = null;
		try{
			response = new WarehouseResponse();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
//			warehouse.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr, emailIdStr));
			warehouse.setWarehouseId(warehouse.getWarehouseId());
			warehouse.setType("details");
			/* update warehouse details */
			str_response = warehouseServiceObj.updateWarehouseDetails(warehouse);
			/* for getting the warehouse details */
			response = warehouseServiceObj.getWarehouseDetails(warehouse);
			//* for getting the locations */
			locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,"Warehouse");
			
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("warehouse",response.getWarehouse());
			modelAndViewObj.addObject("err",str_response);
			
			
		}catch(Exception exception){
			exception.printStackTrace();
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("warehouse",response.getWarehouse());
			modelAndViewObj.addObject("err","Something Went Wrong!");
		}
			modelAndViewObj.setViewName("Inventory Manager/warehouse/warehousedetails");
		return modelAndViewObj;
	}
	
	/* 24-06-2015   Sambaiah Y
	 * This method is used to update the warehouse details in database */
	@RequestMapping("/updatewarehousestoragesystems")
	public ModelAndView updatewarehousestoragesystems(@RequestParam("warehouseId")String warehouseId,@RequestParam("storageStstemDetails")String storageStstemDetails,HttpServletRequest request){
		// log.info("InventoryManagerController - updatewarehousestoragesystems");
		WarehouseResponse response = null;
		String str_response = null;
		List<String> locationsList = null;
		Warehouse warehouse = null;
		WarehouseStorageSystems obj_storageSystems = null;
		List<WarehouseStorageSystems> lst_storageSystems = null;
		try{
			lst_storageSystems = new ArrayList<WarehouseStorageSystems>();
			warehouse = new Warehouse();
			response = new WarehouseResponse();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
//			warehouse.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr, emailIdStr));
			warehouse.setWarehouseId(warehouseId);
			
			/* convert storage systems string to  */
			String storageSystems = Response.getResponseList(storageStstemDetails,"editstorageArray");
			JSONArray jsonStorageSystems = new JSONArray(storageSystems);
			for (int i=0; i<jsonStorageSystems.length(); i++) {
				
				obj_storageSystems = gson.fromJson(jsonStorageSystems.getString(i), WarehouseStorageSystems.class);
				lst_storageSystems.add(obj_storageSystems); 
				}
			warehouse.setStorageSystems(lst_storageSystems);
			
			// log.info(gson.toJson(warehouse));
			/* update warehouse details */
			str_response = warehouseServiceObj.updateWarehouseStorageSystems(warehouse);
			
			response = warehouseServiceObj.getWarehouseDetails(warehouse);
			
			/* for getting the categories details */
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
			ArrayList<String> categoriesList = new ArrayList<String>();
			if(categoryList != null)
				for(ProductCategoryBean productCategoryBean : categoryList)
					categoriesList.add(productCategoryBean.getCategoryDescription());
//			String subCategories = masterServiceObj.getCategories(customerIdStr,emailIdStr);
//			List<String> categories = masterServiceObj.getCategoriesList(subCategories);
			
			/* get locations */
			locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,"Warehouse");
			modelAndViewObj.addObject("categoriesList", categoriesList);
			modelAndViewObj.addObject("storages",response);
			modelAndViewObj.addObject("warehouse",response.getWarehouse());
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("success",str_response);
			modelAndViewObj.addObject("location", response.getWarehouse().getWarehouseLocation());
		}catch(Exception exception){
			exception.printStackTrace();
			modelAndViewObj.addObject("location", response.getWarehouse().getWarehouseLocation());
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("warehouse",response.getWarehouse());
			modelAndViewObj.addObject("err","Something Went Wrong!");
		}
			modelAndViewObj.setViewName("Inventory Manager/warehouse/editwarehousestoragesystems");
		return modelAndViewObj;
	}
	@RequestMapping(value="/deleteWarehouse",method=RequestMethod.POST)
	public ModelAndView deleteWarehouse(@RequestParam("ids") String ids,@RequestParam("location")String location,HttpServletRequest request,HttpServletResponse response){
	
			List<String> locationsList = null;
			// log.info("deleteWarehouse ");
			List<Warehouse> warehouses = null;
			Warehouse warehouse = new Warehouse();
			List<Products> productList = null;
			String result = null;
			try{
			modelAndViewObj = new ModelAndView();
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			/* delete the warehouse details */
			result = warehouseServiceObj.deleteWarehouses(customerId,emailId ,ids);
			
			productList = outletMasterServiceObj.getProducts(customerId,emailId,"","0","","","");
			locationsList = adminServiceObj.getLocationsList(customerId,emailId,"Warehouse");
			/* add request header to warehouse object */
//			warehouse.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerId, emailId));
			warehouse.setWarehouseLocation(location);
			warehouse.setStartIndex("-1");
			/* for getting the warehouses from db */
			 warehouses = warehouseServiceObj.getWarehouses(warehouse);
			
			modelAndViewObj.addObject("warehouses",warehouses);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("location", location);
			modelAndViewObj.addObject("productList", productList);
			modelAndViewObj.addObject("err", result);
			}
		catch(Exception exception){
			exception.printStackTrace();
			modelAndViewObj.addObject("warehouses",warehouses);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("location", location);
			modelAndViewObj.addObject("productList", productList);
			modelAndViewObj.addObject("err", "Something Went Wrong!");
		}
		modelAndViewObj.setViewName("Inventory Manager/warehouse/allwarehouses");
		return modelAndViewObj;
	}
	
	
	/*  01-07-2015  Warehouse configuration flows end */
	
	

	/*@RequestMapping("/getWarehouseOrders")
	public @ResponseBody ModelAndView getWarehouseOrders(@RequestParam("status") String status,@RequestParam("location") String location,@RequestParam("index") String index,HttpServletRequest request,HttpServletResponse response){
		
		*//**
		 * Developed By : Sambaiah Y
		 * Created On   : 27-04-2015
		 * Modified By  : 
		 * access services for getting the orders from server
		 * 
		 *//*
		// log.info(status);
		// log.info(location);
		// log.info("InventoryManagerController - getWarehouseOrders()");
		OrderDetails orderDetails = new OrderDetails();
		List<String> locationsList = null;
		List<OrderDetails> lst_orders = null;
		try {
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			orderDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr, emailIdStr));
			orderDetails.setStartIndex(Constants.PAGINATION_START_INDEX);
			locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr,emailIdStr);
			modelAndViewObj = new ModelAndView();
			if(locationsList==null || locationsList.size()==0){
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			}else{
				if(location == "" || location == null)
					location = locationsList.get(0);
				modelAndViewObj.addObject("locationsList", locationsList);
				lst_orders = orderServiceObj.getWarehouseOrdersByLocation(status,orderDetails,location,index);
				int start = 1,end = 10;
				request.getSession().setAttribute("selectedLocation",location);
				if(lst_orders == null){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(lst_orders.size()<10){
						end = (lst_orders.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(lst_orders.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
				}
				modelAndViewObj.addObject("orderDetails",lst_orders);
				modelAndViewObj.addObject("selectedLocation",location);
				modelAndViewObj.addObject("status",status);
				modelAndViewObj.setViewName("Inventory Manager/warehouse/Orders/viewWarehouseOrders");
//			}
		}catch(Exception e){
			e.printStackTrace();
			lst_orders = new ArrayList<OrderDetails>();
			modelAndViewObj.setViewName("Inventory Manager/warehouse/Orders/viewWarehouseOrders");
		}
		return modelAndViewObj;
	}*/
	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * Created on :14-aug-2015.
	 * 
	 * This method is used to return newWarehouseOrder JSP.
	 * It retrieves the location list and adds it to the model object as it need to be dynamically populated in the view.
	 *
	 **/
	
	/*@RequestMapping(value="/newWarehouseOrder")
	public ModelAndView newWarehouseOrder(HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("newWarehouseOrder");
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		List<String> locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr,emailIdStr);
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.setViewName("Inventory Manager/warehouse/Orders/newWarehouseOrder");
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
	}*/
	
	/**
	 * 
	 * @author Mythri.S
	 * Created on : 14-aug-2015
	 * 
	 * This method is used to create the warehouse order.
	 * It accepts all the order details that need to be saved.
	 * It returns the newWarehouseOrder JSP along with a message related to successful saving or not.
	 *
	 **/
	
	/*@RequestMapping(value="/createWarehouseOrder",method=RequestMethod.POST)
	public ModelAndView createWarehouseOrder(@RequestBody OrderDetails orderDetails,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("createWarehouseOrder");
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		modelAndViewObj = new ModelAndView();
		JSONArray jsonResponseArray = new JSONArray(orderDetails.getItems());
		List<WHOrderedItems> itemDetails = new ArrayList<WHOrderedItems>();
		for (int i=0; i<jsonResponseArray.length(); i++) {
			WHOrderedItems items = gson.fromJson(jsonResponseArray.getString(i), WHOrderedItems.class);
			itemDetails.add(items);
		}
		orderDetails.setWhOrderedItemsList(itemDetails);
		String result = orderServiceObj.createWarehouseOrder(orderDetails,customerIdStr,emailIdStr);
		List<String> locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr,emailIdStr);
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("err", result);
		modelAndViewObj.setViewName("Inventory Manager/warehouse/Orders/newWarehouseOrder");
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}*/
	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 17-aug-2015
	 * 
	 * This method is used to view the Order Details based on the given OrderId and allows the user to edit the details.
	 * 
	 *
	 **/
	
	/*@RequestMapping(value="/editWarehouseOrder",method=RequestMethod.POST)
	public ModelAndView editWarehouseOrder(@RequestBody OrderDetails orderDetails,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("editWarehouseOrder");
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		JSONArray jsonResponseArray = new JSONArray(orderDetails.getItems());
		List<OrderedItems> itemDetails = new ArrayList<OrderedItems>();
		for (int i=0; i<jsonResponseArray.length(); i++) {
			OrderedItems items = gson.fromJson(jsonResponseArray.getString(i), OrderedItems.class);
			itemDetails.add(items);
		}
		orderDetails.setItemDetails(itemDetails);
		List<String> locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr,emailIdStr);
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("orderDetails",orderDetails);
		modelAndViewObj.setViewName("Inventory Manager/warehouse/Orders/editWarehouseOrderDetails");
		
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
	}*/
	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 17-aug-2015
	 * 
	 * This method is used to update the existing order Details.
	 * It accepts all the details of the order, and calls sevice to update the order based on the orderId
	 *
	 **/
	
	/*@RequestMapping(value="/updateWarehouseOrder",method=RequestMethod.POST)
	public ModelAndView updateWarehouseOrder(@RequestBody OrderDetails orderDetails,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("updateWarehouseOrder");
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		modelAndViewObj = new ModelAndView();
		JSONArray jsonResponseArray = new JSONArray(orderDetails.getItems());
		List<WHOrderedItems> whOrderedItemsList = new ArrayList<WHOrderedItems>();
		for (int i=0; i<jsonResponseArray.length(); i++) {
			WHOrderedItems items = gson.fromJson(jsonResponseArray.getString(i), WHOrderedItems.class);
			whOrderedItemsList.add(items);
		}
		orderDetails.setWhOrderedItemsList(whOrderedItemsList);
		String resultStr = orderServiceObj.updateWarehouseOrder(orderDetails,customerIdStr,emailIdStr);
		List<OrderedItems> itemDetailsList = new ArrayList<OrderedItems>();
		for (int i=0; i<jsonResponseArray.length(); i++) {
			OrderedItems items = gson.fromJson(jsonResponseArray.getString(i), OrderedItems.class);
			itemDetailsList.add(items);
		}
		orderDetails.setItemDetails(itemDetailsList);
		List<String> locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr,emailIdStr);
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("err", resultStr);
		modelAndViewObj.addObject("orderDetails",orderDetails);
		if(orderDetails.getOrderStatus().equals("draft"))
			modelAndViewObj.setViewName("Inventory Manager/warehouse/Orders/editWarehouseOrderDetails");
		else
			modelAndViewObj.setViewName("Inventory Manager/warehouse/Orders/warehouseOrderdetails");
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}*/
	

	/*@RequestMapping("/getWarehouseOrdersByLocation")
	public @ResponseBody ModelAndView getWarehouseOrdersByLocation(@RequestParam("location")String location,@RequestParam("status")String status,@RequestParam("index")String index,HttpServletRequest request,HttpServletResponse response){
		
		*//**
		 * Developed By : Sambaiah Y
		 * Created On   : 27-04-2015
		 * Modified By  : 
		 *This method is used to get the orders based on the type and location from services
		 *This method interacts with order services to get the orders
		 * 
		 *//*
		// log.info(location);
		// log.info(status);
		// log.info("InventoryManagerController - getWarehouseOrdersByLocation()");
		OrderDetails orderDetails = new OrderDetails();
		List<String> locationsList = null;
		List<OrderDetails> lst_orders = null;
		try {
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			orderDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr, emailIdStr));
			orderDetails.setStartIndex(Constants.PAGINATION_START_INDEX);
			locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr,emailIdStr);
			modelAndViewObj = new ModelAndView();
			if(locationsList==null ||locationsList.size()==0){
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			}else{
				modelAndViewObj.addObject("locationsList", locationsList);
				lst_orders = orderServiceObj.getWarehouseOrdersByLocation(status,orderDetails,location,index);
				int start = 1,end = 10;
				request.getSession().setAttribute("selectedLocation",location);
				if(lst_orders == null){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(lst_orders.size()<10){
						end = (lst_orders.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(lst_orders.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
				}
				modelAndViewObj.addObject("orderDetails",lst_orders);
				modelAndViewObj.addObject("selectedLocation",location);
				modelAndViewObj.addObject("status",status);
				modelAndViewObj.setViewName("Inventory Manager/warehouse/Orders/viewWarehouseOrders");
			}
		}catch(Exception e){
			e.printStackTrace();
			lst_orders = new ArrayList<OrderDetails>();
			modelAndViewObj.setViewName("Inventory Manager/warehouse/Orders/viewWarehouseOrders");
		}
		return modelAndViewObj;
	}
	
	@SuppressWarnings("unused")
	@RequestMapping("/getWarehouseOrderDetails")
	public @ResponseBody ModelAndView getWarehouseOrderDetails(@RequestParam("orderId")String orderId,HttpServletRequest request,HttpServletResponse response){
		
		*//**
		 * Developed By : Sambaiah Y
		 * Created On   : 27-04-2015
		 * Modified By  : 
		 *This method is used to get the specific order details from services
		 *This method interacts with order services to get the orders
		 * 
		 *//*
		
		// log.info("InventoryManagerController - getWarehouseOrderDetails()");
		OrderDetails orderDetails = new OrderDetails();
		List<OrderDetails> lst_orders = null;
		try {
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			orderDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr, emailIdStr));
			orderDetails.setStartIndex(Constants.PAGINATION_START_INDEX);
			orderDetails.setOrderId(orderId);
			modelAndViewObj = new ModelAndView();
			orderDetails = orderServiceObj.getWarehouseOrderDetailsByLocation(orderDetails);
			// log.info(orderDetails.getItemDetails().size());
			modelAndViewObj.addObject("orderDetails",orderDetails);
			modelAndViewObj.setViewName("Inventory Manager/warehouse/Orders/warehouseOrderdetails");
		}catch(Exception e){
			e.printStackTrace();
			lst_orders = new ArrayList<OrderDetails>();
			modelAndViewObj.setViewName("Inventory Manager/warehouse/Orders/warehouseOrderdetails");
		}
		return modelAndViewObj;
	}*/
	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * created On: 25-sep-2015
	 * 
	 * This method is used to accept a file from browser,
	 * send it to webservice and get a token related to that file.
	 * This token is returned to the ajax call.
	 * This token should be used, where ever this file info is needed.  
	 *
	 *
	 **/
	@RequestMapping(value="/addToAttachementList",method=RequestMethod.POST)
	public void addToAttachementList(@RequestParam("file") MultipartFile file,@RequestParam("refId") String refId,HttpServletRequest request,HttpServletResponse response) {
		Attachment attachmentObj = new Attachment();
		try {
			// log.info("addToAttachementList");
			// log.info(file.getOriginalFilename());
			attachmentObj.setContent(file.getBytes());
			attachmentObj.setFileName(file.getOriginalFilename());
			attachmentObj.setAttachmentId(refId);
			OfferProxy offerProxyObj = new OfferProxy();
			String tokenStr = offerProxyObj.addAttahmentInTemp(attachmentObj);
			if(tokenStr != null || tokenStr != "" ) {
			Path path = Paths.get(file.getOriginalFilename());
			String filepath = path.toAbsolutePath().toString();
			////System.out.println(filepath);
			}
			////System.out.println(tokenStr);
			response.setContentType("application/text");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(tokenStr);
		}catch (RemoteException e) {
			e.printStackTrace();
		}
		catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 
	 * @author Mythri.S
	 * created On: 1-oct-2015
	 * 
	 * This method is accepts the product category and search string.
	 * It retrives list of products matching the search string and under the given productCategory.
	 *
	 *
	 **/
	@RequestMapping("/searchProductsBasedOnCategory")
	public @ResponseBody List<ProductsList> searchProductsBasedOnCategory(@RequestParam("searchName") String searchNameStr,@RequestParam("productCategory")String productCategoryStr, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<ProductsList> productsList = new ArrayList<ProductsList>();
		try{
			// log.info("searchProductsBasedOnCategory");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			productsList = skuServiceObj.searchProducts(customerIdStr, emailIdStr,searchNameStr,"",productCategoryStr,"",false,"","",false);
		}catch(Exception e){
			e.printStackTrace();
		}
		return productsList;
	}
	
	
	@RequestMapping("/searchProductsOnCategoryBasis")
	public @ResponseBody List<ProductsList> searchProductsOnCategoryBasis(@RequestParam("searchName") String searchCriteria,@RequestParam("categoryName")String categoryName,@RequestParam("subCategory")String subCategory, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<ProductsList> productsList = new ArrayList<ProductsList>();
		try{
			// log.info("searchProductsOnCategoryBasis");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			productsList = outletMasterServiceObj.searchProducts(customerIdStr, emailIdStr, searchCriteria, "", categoryName,subCategory, "", false);
		
		}catch(Exception e){               
			e.printStackTrace();
		}
		return productsList;
	}
	
	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 6-oct-2015
	 * This method is used to display the stock ledger.
	 * It accepts skuId, and retrieves all transaction related to this skuId
	 * It returns the skuLedger JSP.
	 * 
	 * @modifiedBy: Vijay
	 * @modificationDate : 11/10/2017
	 * @description : added parameters like description, ean , uom, category, sub category to the existing parameters.
	 *
	 **/
	@RequestMapping("/stockLedger")
	public ModelAndView stockLedger(@RequestParam("plucode") String plucode,
			@RequestParam("flowUnder") String flowUnder,
			@RequestParam("skuId") String skuId,
			@RequestParam("index") String index,
			@RequestParam("storeLocation") String storeLocation,
			@RequestParam("stockType") String stockType,
			@RequestParam("description") String description,
			@RequestParam("ean") String ean,
			@RequestParam("uom") String uom,
			@RequestParam("pluCode") String pluCode,
			@RequestParam("productCategory") String category,
			@RequestParam("productSubCategory") String subCategory,
			@RequestParam("productClass") String productClass,
			@RequestParam("productSubClass") String productSubClass,
			@RequestParam("productDepartment") String productDepartment,
			@RequestParam("productSubDepartment") String productSubDepartment,
			@RequestParam("zone") String zone,
			@RequestParam("formData") String formData,HttpServletRequest request,HttpServletResponse response){
		
		try{
			// log.info("stockLedger ");
			int start = 1,end = 10;
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<StockLedgerDetails> stockLedgerDetailsList = skuServiceObj.getSkuLedger(skuId, customerIdStr, emailIdStr,index,storeLocation,flowUnder,pluCode);
			modelAndViewObj = new ModelAndView();
			if(stockLedgerDetailsList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(stockLedgerDetailsList.size()<10){
					end = (stockLedgerDetailsList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(stockLedgerDetailsList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			//added by manasa
			ProductStocks skuObj=gson.fromJson(formData, ProductStocks.class);
			modelAndViewObj.addObject("skuObj", skuObj);
			modelAndViewObj.addObject("description",description);
			modelAndViewObj.addObject("ean",ean);
			modelAndViewObj.addObject("uom",uom);
			modelAndViewObj.addObject("category",category);
			modelAndViewObj.addObject("subCategory",subCategory);
			modelAndViewObj.addObject("productClass",productClass);
			modelAndViewObj.addObject("productSubClass",productSubClass);
			modelAndViewObj.addObject("productDepartment",productDepartment);
			modelAndViewObj.addObject("productDepartment",productDepartment);
			modelAndViewObj.addObject("storeLocation",storeLocation);
			modelAndViewObj.addObject("zone",zone);
			//////////System.out.println("productSubDepartment"+productSubDepartment);
			modelAndViewObj.addObject("skuId", skuId);
			modelAndViewObj.addObject("stockType", stockType);
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.addObject("pluCode", pluCode);
			modelAndViewObj.addObject("stockOrVerify", "stock");
			modelAndViewObj.addObject("type", "stockledger");
			modelAndViewObj.addObject("stockLedgerDetailsList", stockLedgerDetailsList);
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/stockLedger");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	
	/**
	 * @author Manasa.P	
	 * Created On: 1-jan-2017
	 * This method is used to display item track details
	 **/
	
	@RequestMapping("/stockItemTrack")
	public ModelAndView stockItemTrack(@RequestParam("plucode") String plucode,
			@RequestParam("flowUnder") String flowUnder,
			@RequestParam("skuId") String skuId,
			@RequestParam("index") String index,
			@RequestParam("storeLocation") String storeLocation,
			@RequestParam("stockType") String stockType,
			@RequestParam("description") String description,
			@RequestParam("ean") String ean,
			@RequestParam("uom") String uom,
			@RequestParam("pluCode") String pluCode,
			@RequestParam("productCategory") String category,
			@RequestParam("productSubCategory") String subCategory,
			@RequestParam("productClass") String productClass,
			@RequestParam("productSubClass") String productSubClass,
			@RequestParam("productDepartment") String productDepartment,
			@RequestParam("productSubDepartment") String productSubDepartment,
			@RequestParam("formData") String formData,HttpServletRequest request,HttpServletResponse response){
	    TrackerItemDetails salesReportList = null;
		try{
			// log.info("stockLedger ");
			int start = 1,end = 10;
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			
			
			salesReportList = skuServiceObj.getStockItemTrackDetails(skuId, customerIdStr, emailIdStr,index,storeLocation,flowUnder,plucode,pluCode);
			
			
			/*modelAndViewObj = new ModelAndView();
			if(salesReportList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(salesReportList.size()<10){
					end = (salesReportList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(salesReportList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}*/
			
			//added by manasa
			ProductStocks skuObj=gson.fromJson(formData, ProductStocks.class);
			modelAndViewObj.addObject("skuObj", skuObj);
			modelAndViewObj.addObject("description",description);
			modelAndViewObj.addObject("ean",ean);
			modelAndViewObj.addObject("uom",uom);
			modelAndViewObj.addObject("category",category);
			modelAndViewObj.addObject("subCategory",subCategory);
			modelAndViewObj.addObject("productClass",productClass);
			modelAndViewObj.addObject("productSubClass",productSubClass);
			modelAndViewObj.addObject("productDepartment",productDepartment);
			modelAndViewObj.addObject("productSubDepartment",productSubDepartment);
			modelAndViewObj.addObject("skuId", skuId);
			modelAndViewObj.addObject("storeLocation", storeLocation);
			modelAndViewObj.addObject("stockType", stockType);
			modelAndViewObj.addObject("pluCode", pluCode);
			modelAndViewObj.addObject("stockOrVerify", "stock");
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.addObject("type", "stockItemTrack");
			modelAndViewObj.addObject("outletstockLedgerDetailsList", salesReportList.getItemdetails());
			modelAndViewObj.addObject("stockLedgerDetailsList", salesReportList);
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/stockLedger");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	

	@RequestMapping("/dailyStockItem")
	public ModelAndView dailyStockItem(@RequestParam("plucode") String plucode,
			@RequestParam("flowUnder") String flowUnder,
			@RequestParam("skuId") String skuId,
			@RequestParam("index") String index,
			@RequestParam("storeLocation") String storeLocation,
			@RequestParam("stockType") String stockType,
			@RequestParam("description") String description,
			@RequestParam("ean") String ean,
			@RequestParam("uom") String uom,
			@RequestParam("pluCode") String pluCode,
			@RequestParam("productCategory") String category,
			@RequestParam("productSubCategory") String subCategory,
			@RequestParam("productClass") String productClass,
			@RequestParam("productSubClass") String productSubClass,
			@RequestParam("productDepartment") String productDepartment,
			@RequestParam("productSubDepartment") String productSubDepartment,
			@RequestParam("formData") String formData,HttpServletRequest request,HttpServletResponse response){
		//TrackerItemDetails salesReportList = null;
		List<SkuDetails> salesReportList = null;
		try{
			// log.info("stockLedger ");
			int start = 1,end = 10;
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			//if(type.)
			salesReportList = skuServiceObj.getdailyStockItem(skuId, customerIdStr, emailIdStr,index,storeLocation,flowUnder,plucode,pluCode);
			if(salesReportList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(salesReportList.size()<10){
					end = (salesReportList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", salesReportList.get(0).getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			//added by manasa
			ProductStocks skuObj=gson.fromJson(formData, ProductStocks.class);
			modelAndViewObj.addObject("skuObj", skuObj);
			modelAndViewObj.addObject("description",description);
			modelAndViewObj.addObject("ean",ean);
			modelAndViewObj.addObject("uom",uom);
			modelAndViewObj.addObject("category",category);
			modelAndViewObj.addObject("subCategory",subCategory);
			modelAndViewObj.addObject("productClass",productClass);
			modelAndViewObj.addObject("productSubClass",productSubClass);
			modelAndViewObj.addObject("productDepartment",productDepartment);
			modelAndViewObj.addObject("productSubDepartment",productSubDepartment);
			
			//////////System.out.println("productSubDepartment"+productSubDepartment);
			modelAndViewObj.addObject("skuId", skuId);
			modelAndViewObj.addObject("stockType", stockType);
			modelAndViewObj.addObject("pluCode", pluCode);
			modelAndViewObj.addObject("stockOrVerify", "stock");
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.addObject("type", "dailystockItemDetails");
			modelAndViewObj.addObject("storeLocation", storeLocation);
			modelAndViewObj.addObject("stockLedgerDetailsList", salesReportList);
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/stockLedger");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 6-oct-2015
	 * 
	 * This method is used to display the stock ledger.
	 * It accepts skuId, and retrieves all transaction related to this skuId
	 * It returns the skuLedger JSP.
	 *
	 **//*
	@RequestMapping("/stockLedger")
	public ModelAndView stockLedger(@RequestParam("plucode") String plucode,@RequestParam("flowUnder") String flowUnder,@RequestParam("skuId") String skuId,@RequestParam("index") String index,@RequestParam("storeLocation") String storeLocation,@RequestParam("stockType") String stockType,@RequestParam("formData") String formData,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("stockLedger ");
			int start = 1,end = 10;
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<StockLedgerDetails> stockLedgerDetailsList = skuServiceObj.getSkuLedger(skuId, customerIdStr, emailIdStr,index,storeLocation,flowUnder,plucode);
			modelAndViewObj = new ModelAndView();
			if(stockLedgerDetailsList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(stockLedgerDetailsList.size()<10){
					end = (stockLedgerDetailsList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(stockLedgerDetailsList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			//added by manasa
			ProductStocks skuObj=gson.fromJson(formData, ProductStocks.class);
			modelAndViewObj.addObject("skuObj", skuObj);
			
			modelAndViewObj.addObject("skuId", skuId);
			modelAndViewObj.addObject("stockType", stockType);
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.addObject("stockOrVerify", "stock");
			modelAndViewObj.addObject("stockLedgerDetailsList", stockLedgerDetailsList);
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/stockLedger");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	*/
	
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On:14-oct-2015.
	 * 
	 * This method accepts the search string and retrieves a list of deal names matching it.
	 * It returns the list of the dealNames. 
	 * 
	 */

	@RequestMapping("/searchDealNames")
	public @ResponseBody List<String> searchDealNames(@RequestParam("searchName") String searchNameStr,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<String> dealNameList = new ArrayList<String>();
		try{
			// log.info("searchDealNames");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			dealNameList = dealServiceObj.searchDealNames(customerIdStr, emailIdStr,searchNameStr);
			// log.info("Result:::"+dealNameList);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return dealNameList;
	}
	
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On:14-oct-2015.
	 * 
	 * This method accepts the search string and retrieves a list of offer names matching it.
	 * It returns the list of the offerNames. 
	 * 
	 */

	@RequestMapping("/searchOfferNames")
	public @ResponseBody List<String> searchOfferNames(@RequestParam("searchName") String searchNameStr,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<String> offerNameList = new ArrayList<String>();
		try{
			// log.info("searchOfferNames");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			offerNameList = offerServiceObj.searchOfferNames(customerIdStr, emailIdStr,searchNameStr);
			// log.info("Result:::"+offerNameList);
		}catch(Exception e){
			e.printStackTrace();
		}
		return offerNameList;
	}
	
	
	@RequestMapping("/newDepartment")
	public ModelAndView newDepartment(@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("newDepartment ");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);
			modelAndViewObj.setViewName("Inventory Manager/master/newDepartmentMaster");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 20-feb-2015
	 * 
	 * This method is used to display the New Department form.
	 * It does not interact with any service as there is no dynamic data required in the view.
	 *
	 **//*
	@RequestMapping("/newDepartment")
	public ModelAndView newDepartment(HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("newDepartment ");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.setViewName("Inventory Manager/master/newDepartmentMaster");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	*/
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 2-nov-2015
	 * 
	 *This method is used to display the newStockRequest form
	 *
	 **/
	@RequestMapping("/newStockRequest")
	public ModelAndView newStockRequest(HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("newStockRequest");
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<String> warehouseLocationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr,emailIdStr,false);
			List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("warehouseList", warehouseLocationsList);
			modelAndViewObj.setViewName("Inventory Manager/stockRequest/newStockRequest");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 3-nov-2015
	 * 
	 *This method is used to save the details of the Department
	 *This method returns a message based on the successfull creation or not
	 *
	 **//*
	@RequestMapping(value="/createDepartment",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createDepartment(@RequestBody Department departmentObj,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("createDepartment");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			String result = departmentServiceObj.createDepartment(departmentObj, customerIdStr, emailIdStr);
			if(!result.equals(AppProperties.getAppMessageByProperty("DEPARTMENT_CREATE_SUCCESS").trim())){
				modelAndViewObj.addObject("err", result);
			}else
				modelAndViewObj.addObject("success", result);
			modelAndViewObj.setViewName("Inventory Manager/master/newDepartmentMaster");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	*//**
	 * 
	 * @author Mythri.S
	 * Created On: 4-nov-2015
	 * 
	 *This method is used to display all the department details in a tabular form
	 *
	 **//*
	@RequestMapping("/viewDepartmentMaster")
	public ModelAndView viewDepartmentMaster(@RequestParam("index") String index,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewDepartmentMaster ");
			int start = 1,end = 10;
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			List<Department> departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerId, emailId,index,false);
			modelAndViewObj = new ModelAndView();
			if(departmentList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(departmentList.size()<10){
					end = (departmentList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(departmentList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("departmentList", departmentList);
			modelAndViewObj.setViewName("Inventory Manager/master/departmentMaster");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	@RequestMapping("/searchDepartmentMaster")
	public ModelAndView searchDepartmentMaster(@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		try{
			// log.info("searchDepartmentMaster");
			int start = 1,end = 10;
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<Department> departmentList = departmentServiceObj.getDepartmentDetails(searchNameStr,null, customerIdStr, emailIdStr,index,true);
			modelAndViewObj = new ModelAndView();
			if(departmentList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(departmentList.size()<10){
					end = (departmentList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(departmentList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("departmentList", departmentList);
			modelAndViewObj.setViewName("Inventory Manager/master/departmentMaster");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	*//**
	 * 
	 * @author Mythri.S
	 * Created On: 4-nov-2015
	 * 
	 *This method is used to display the Edit Department form with department and sub department details
	 *
	 **//*
	@RequestMapping("/editDepartment")
	public ModelAndView editDepartment(@RequestParam("primaryDepartment") String primaryDepartment,@RequestParam("operation") String operation,HttpServletRequest request,
			HttpServletResponse response){
		try{
			// log.info("editDepartment");
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			List<SkuDepartment> skuDepartmentList = null;
			modelAndViewObj = new ModelAndView();
			List<Department> departmentList = departmentServiceObj.getDepartmentDetails(primaryDepartment,null, customerId, emailId,"0",false);
			if(departmentList != null && departmentList.size() > 0){
				if(departmentList.get(0).getSecondaryDepartments() != null && departmentList.get(0).getSecondaryDepartments().size() > 0){
					List<Department> secondaryDepartmentList = departmentServiceObj.getDepartmentDetails(primaryDepartment,departmentList.get(0).getSecondaryDepartments().get(0).getSecondaryDepartment(), customerId, emailId,"0",false);
					if(secondaryDepartmentList != null && secondaryDepartmentList.size() > 0)
						skuDepartmentList = secondaryDepartmentList.get(0).getSkuDepartments();
				}
				modelAndViewObj.addObject("department", departmentList.get(0));
				modelAndViewObj.addObject("skuDepartmentList", skuDepartmentList);
			}
			if(operation.equals("view"))
				modelAndViewObj.setViewName("Inventory Manager/master/viewDepartment");
			else
				modelAndViewObj.setViewName("Inventory Manager/master/editDepartment");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	*/
	
	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 3-nov-2015
	 * 
	 *This method is used to save the details of the Department
	 *This method returns a message based on the successfull creation or not
	 *
	 **/
	@RequestMapping(value="/createDepartment",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createDepartment(@RequestBody Department departmentObj,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("createDepartment");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			String result = departmentServiceObj.createDepartment(departmentObj, customerIdStr, emailIdStr);
			if(!result.equals(AppProperties.getAppMessageByProperty("DEPARTMENT_CREATE_SUCCESS").trim())){
				modelAndViewObj.addObject("err", result);
			}else
				modelAndViewObj.addObject("success", result);
			
			modelAndViewObj.addObject("maxRecords",departmentObj.getMaxRecords());
			modelAndViewObj.addObject("searchName",departmentObj.getSearchCriteria());
			modelAndViewObj.setViewName("Inventory Manager/master/newDepartmentMaster");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 4-nov-2015
	 * 
	 *This method is used to display all the department details in a tabular form
	 *
	 **/
	@RequestMapping("/viewDepartmentMaster")
	public ModelAndView viewDepartmentMaster(@RequestParam("index") String index,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewDepartmentMaster ");
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			List<Department> departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerId, emailId,index,maxRecords,false,searchName);
			modelAndViewObj = new ModelAndView();
			if(departmentList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(departmentList.size()<end){
					end = (departmentList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(departmentList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("departmentList", departmentList);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);
			modelAndViewObj.setViewName("Inventory Manager/master/departmentMaster");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	@RequestMapping("/searchDepartmentMaster")
	public ModelAndView searchDepartmentMaster(@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,@RequestParam("maxRecords") String maxRecords, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		try{
			// log.info("searchDepartmentMaster");
			
			int start = 1,end = Integer.parseInt(maxRecords);
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<Department> departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerIdStr, emailIdStr,index,maxRecords,false,searchNameStr);			
			modelAndViewObj = new ModelAndView();
			if(departmentList == null)
			{
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}
			else
			{
				if(departmentList.size()<end)
				{
					end = (departmentList.size())+(Integer.parseInt(index));
				}
				else 
				{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(departmentList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("departmentList", departmentList);
			modelAndViewObj.setViewName("Inventory Manager/master/departmentMaster");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 4-nov-2015
	 * 
	 *This method is used to display the Edit Department form with department and sub department details
	 *
	 **/
	@RequestMapping("/editDepartment")
	public ModelAndView editDepartment(@RequestParam("primaryDepartment") String primaryDepartment,@RequestParam("operation") String operation,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,HttpServletRequest request,
			HttpServletResponse response){
		try{
			// log.info("editDepartment");
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			List<SkuDepartment> skuDepartmentList = null;
			modelAndViewObj = new ModelAndView();
			List<Department> departmentList = departmentServiceObj.getDepartmentDetails(primaryDepartment,null, customerId, emailId,"0",false);
			if(departmentList != null && departmentList.size() > 0){
				if(departmentList.get(0).getSecondaryDepartments() != null && departmentList.get(0).getSecondaryDepartments().size() > 0){
					List<Department> secondaryDepartmentList = departmentServiceObj.getDepartmentDetails(primaryDepartment,departmentList.get(0).getSecondaryDepartments().get(0).getSecondaryDepartment(), customerId, emailId,"0",false);
					if(secondaryDepartmentList != null && secondaryDepartmentList.size() > 0)
						skuDepartmentList = secondaryDepartmentList.get(0).getSkuDepartments();
				}
				modelAndViewObj.addObject("department", departmentList.get(0));
				modelAndViewObj.addObject("skuDepartmentList", skuDepartmentList);
			}
			if(operation.equals("view"))
				modelAndViewObj.setViewName("Inventory Manager/master/viewDepartment");
			else
				modelAndViewObj.setViewName("Inventory Manager/master/editDepartment");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		modelAndViewObj.addObject("maxRecords",maxRecords);
		modelAndViewObj.addObject("searchName",searchName);
		return modelAndViewObj;
	}
	
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 4-nov-2015
	 * 
	 * This method is used to get the sku details based on the primaryDepartment and sub-department
	 *
	 **/
	@RequestMapping("/getSkuDepartments")
	public @ResponseBody List<SkuDepartment> getSkuDepartments(@RequestParam("primaryDepartment") String primaryDepartment,@RequestParam("secondaryDepartment") String secondaryDepartment,HttpServletRequest request,
			HttpServletResponse response){
		List<SkuDepartment> skuDepartmentList = new ArrayList<SkuDepartment>();
		try{
			// log.info("getSkuDepartments");
//			int start = 1,end = 10;
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			List<Department> departmentList = departmentServiceObj.getDepartmentDetails(primaryDepartment,secondaryDepartment, customerId, emailId,"0",false);
			skuDepartmentList = departmentList.get(0).getSkuDepartments();
			/*if(skuDepartmentList == null){
				skuDepartmentList = new ArrayList<SkuDepartment>();
				SkuDepartment skuDepartmentObj = new SkuDepartment();
				skuDepartmentObj.setTotalRecorsds(0);
				skuDepartmentObj.setIndex(0);
				skuDepartmentObj.setTotalValue(0);
				skuDepartmentList.add(skuDepartmentObj);
			}else{
				if(skuDepartmentList.size()<10){
					end = (skuDepartmentList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				skuDepartmentList.get(0).setIndex((Integer.parseInt(index)+start));
				skuDepartmentList.get(0).setTotalValue(end);
			}*/
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return skuDepartmentList;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 4-nov-2015
	 * 
	 *This method is used to update the details of the department
	 *It returns the edit department view along with a message of successfull updation or not
	 *
	 **/
	@RequestMapping(value="/updateDepartment",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView updateDepartment(@RequestBody Department departmentObj,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("updateDepartment");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String result = departmentServiceObj.updateDepartment(departmentObj,customerIdStr,emailIdStr);
			List<SkuDepartment> skuDepartmentList = null;
			List<Department> departmentList = departmentServiceObj.getDepartmentDetails(departmentObj.getPrimaryDepartment(),null, customerIdStr, emailIdStr,"0",false);
			if(departmentList != null && departmentList.size() > 0){
				if(departmentList.get(0).getSecondaryDepartments() != null && departmentList.get(0).getSecondaryDepartments().size() > 0){
					List<Department> secondaryDepartmentList = departmentServiceObj.getDepartmentDetails(departmentObj.getPrimaryDepartment(),departmentList.get(0).getSecondaryDepartments().get(0).getSecondaryDepartment(), customerIdStr, emailIdStr,"0",false);
					if(secondaryDepartmentList != null && secondaryDepartmentList.size() > 0)
						skuDepartmentList = secondaryDepartmentList.get(0).getSkuDepartments();
				}
				modelAndViewObj.addObject("department", departmentList.get(0));
				modelAndViewObj.addObject("skuDepartmentList", skuDepartmentList);
			}
			modelAndViewObj.addObject("department", departmentObj);
			if(!result.equals(AppProperties.getAppMessageByProperty("DEPARTMENT_UPDATE_SUCCESS").trim())){
				modelAndViewObj.addObject("err", result);
			}else
				modelAndViewObj.addObject("success", result);
			modelAndViewObj.setViewName("Inventory Manager/master/editDepartment");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 11-nov-2015
	 * 
	 * This method is used to display the New Outlet Notification form.
	 * It displays the location list and role list
	 *
	 **/
	@RequestMapping("/newOutletNotification")
	public ModelAndView newOutletNotification(HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("newOutletNotification ");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<Role> roleList = roleServiceObj.getRoleDetails(null,customerIdStr,emailIdStr,"-1","10","");
			modelAndViewObj = new ModelAndView();
			List<String> outletLocationList = adminServiceObj.getOutletLocationsList(customerIdStr, emailIdStr,false);
			modelAndViewObj.addObject("outletLocationList",outletLocationList);
			modelAndViewObj.addObject("roleList",roleList);
			modelAndViewObj.setViewName("Inventory Manager/outletNotification/newNotification");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 12-nov-2015
	 * 
	 * This method is used to get the users list based on the location.
	 *
	 **/
	@RequestMapping("/getUsersList")
	public @ResponseBody List<String> getUsersList(@RequestParam("locations")String locations, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<String> usersList = new ArrayList<String>();
		try{
			// log.info("getUsersList");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			String[] locationArray = locations.split(",");
			List<String> locationList = new ArrayList<String>(Arrays.asList(locationArray));
			usersList = adminServiceObj.getUsersList("active",locationList,customerIdStr, emailIdStr);
		}catch(Exception e){
			e.printStackTrace();
		}
		return usersList;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 12-nov-2015
	 * 
	 *This method is used to send the notification details
	 *It returns the new Notification jsp along with the successfull saving or not message
	 *
	 **/
	@RequestMapping(value="/createOutletNotification",method=RequestMethod.POST,consumes="application/json")
	public void createOutletNotification(@RequestBody MessageBoard messageBoardObj,HttpServletRequest request,HttpServletResponse response) {
		List<String> usersList = new ArrayList<String>();
		String jsonString = null;
		try{
			// log.info("createOutletNotification");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String result = outletNotificataionServiceObj.createMessageBoard(messageBoardObj,customerIdStr,emailIdStr);
			List<Role> roleList = roleServiceObj.getRoleDetails(null,customerIdStr,emailIdStr,"-1","10","");
			List<String> outletLocationList = adminServiceObj.getOutletLocationsList(customerIdStr, emailIdStr,false);
			modelAndViewObj = new ModelAndView();
			
			if(result.equals(AppProperties.getAppMessageByProperty("MESSAGE_SENT_SUCCESS").trim()))
				 jsonString= "{\"success\":\""+result+"\",\"code\":\""+0+"\"}";
			else
				 jsonString = "{\"error\":\""+result+"\",\"code\":\""+1+"\"}";
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
	    	response.getWriter().write(jsonString);
			
			/*if(!result.equals(AppProperties.getAppMessageByProperty("MESSAGE_SENT_SUCCESS").trim()))
			{
				modelAndViewObj.addObject("err", result);
				String[] locationArray = messageBoardObj.getLocations().split(",");
				List<String> locationList = new ArrayList<String>(Arrays.asList(locationArray));
				usersList = adminServiceObj.getUsersList("active",locationList,customerIdStr, emailIdStr);
				modelAndViewObj.addObject("messageBoardObj", messageBoardObj);
			}
				else
				modelAndViewObj.addObject("success", result);	
			*/
		/*	modelAndViewObj.addObject("outletLocationList",outletLocationList);
			modelAndViewObj.addObject("roleList",roleList);
			modelAndViewObj.setViewName("Inventory Manager/outletNotification/newNotification");*/
		}catch(Exception e){
			e.printStackTrace();
		}
//		return modelAndViewObj;
	}
	
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 13-nov-2015
	 * 
	 *This method is used to display all the notification details in a tabular form
	 *
	 **/
	@RequestMapping("/viewOutletNotifications")
	public ModelAndView viewOutletNotifications(@RequestParam("index") String index,@RequestParam("maxRecords") String maxRecords,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewOutletNotifications ");
			int start = 1,end = Integer.parseInt(maxRecords);//modified by manasa
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<MessageBoard> messageBoardList = outletNotificataionServiceObj.getMessageBoards(customerIdStr, emailIdStr,index);
			modelAndViewObj = new ModelAndView();
			if(messageBoardList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(messageBoardList.size()<Integer.parseInt(maxRecords)){
					end = (messageBoardList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(messageBoardList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));//added by manasa
			modelAndViewObj.addObject("messageBoardList", messageBoardList);
			modelAndViewObj.setViewName("Inventory Manager/outletNotification/outletNotificationMaster");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 13-nov-2015
	 * 
	 *This method is used to display the editNotification form with all notification details for the given messageId
	 *
	 **/
	@RequestMapping("/editNotification")
	public ModelAndView editNotification(@RequestParam("messageId") String messageId,@RequestParam("operation") String operation,HttpServletRequest request,
			HttpServletResponse response){
		try{
			// log.info("editNotification");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			MessageBoard messageBoardObj = outletNotificataionServiceObj.getMessageBoard(messageId, customerIdStr, emailIdStr);
			List<Role> roleList = roleServiceObj.getRoleDetails(null,customerIdStr,emailIdStr,"-1","10","");
			List<String> usersList = new ArrayList<String>();
			if(messageBoardObj.getLocations() != null && messageBoardObj.getLocations().size() != 0)
				usersList = adminServiceObj.getUsersList("active",messageBoardObj.getLocations(),customerIdStr, emailIdStr);
			modelAndViewObj = new ModelAndView();
			List<String> outletLocationList = adminServiceObj.getOutletLocationsList(customerIdStr, emailIdStr,false);
			modelAndViewObj.addObject("outletLocationList",outletLocationList);
			modelAndViewObj.addObject("roleList",roleList);
			modelAndViewObj.addObject("usersList",usersList);
			modelAndViewObj.addObject("messageBoardObj", messageBoardObj);
			modelAndViewObj.setViewName("Inventory Manager/outletNotification/editNotification");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	
	
	
	@RequestMapping("/searchCounterMaster")
	public ModelAndView searchCounterMaster(@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,@RequestParam("location") String location,@RequestParam("locationList") String locationList,
			@RequestParam("maxRecords") String maxRecords, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		ArrayList<LocationBean> locationBeansList = null;
		try{
			// log.info("searchCounterMaster");
			int start = 1,end = Integer.parseInt(maxRecords);//modified by manasa
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<Counter> counterDetails = adminServiceObj.getCounters(searchNameStr,location,customerIdStr, emailIdStr,index,true,maxRecords,locationList);
			if(counterDetails == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(counterDetails.size()<10){
					end = (counterDetails.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(counterDetails.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
		//	List<String> locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			modelAndViewObj.addObject("workLocationsList", locationBeansList);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("counterDetails", counterDetails);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));//added by manasa
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.setViewName("Admin/genericData/Counters/countermaster");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	@RequestMapping("/searchWhCounterMaster")
	public ModelAndView searchWhCounterMaster(@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,@RequestParam("maxRecords") String maxRecords,@RequestParam("location") String location, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		try{
			// log.info("searchCounterMaster");
			int start = 1,end = 10;
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			WarehouseCounterResponse counterDetails = adminServiceObj.getWhCounters(searchNameStr,location,customerIdStr, emailIdStr,index,true,maxRecords);
			if(counterDetails.getWarehouseCountersList() == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(counterDetails.getWarehouseCountersList().size()<Integer.parseInt(maxRecords)){
					end = (counterDetails.getWarehouseCountersList().size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords",counterDetails.getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
//			List<String> locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr,emailIdStr,true);
			ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","Warehouse",false,false,true);
			modelAndViewObj.addObject("workLocationsList", locationsList);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));//added by manasa
			modelAndViewObj.addObject("counterDetails", counterDetails.getWarehouseCountersList());
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.setViewName("Admin/genericData/WarehouseCounters/countermaster");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 4-nov-2015
	 * 
	 *This method is used to display all the department details in a tabular form
	 *
	 **/
	@RequestMapping("/viewStockRequest")
	public ModelAndView viewStockRequest(@RequestParam("index") String index,@RequestParam("date") String date,@RequestParam("flowUnder") String flowUnder,@RequestParam("maxRecords") String maxRecords,@RequestParam("location") String location,@RequestParam("requestType") String requestType,HttpServletRequest request,HttpServletResponse response){
		List<String> locationslist = null;
		List<String> locationsList = null;
		List<String> outletlocationsList = null;
		ArrayList<LocationBean> locationBeansList = null;
		String locationListAll="";
		try{
			List<String> locationsListValue =new ArrayList<String>();
			// log.info("viewStockRequest ");
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,index,"","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			modelAndViewObj = new ModelAndView();
		//	////////System.out.println(flowUnder);
			if(flowUnder.equals("outlet")){
				//outletlocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
				
				if(requestType.equals("outletStockRequestIn")){
				locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,true,false);	
				}else {
				locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);	
	
				}
				
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

				modelAndViewObj.addObject("outletlocationsList", locationBeansList);
			
			}
			
			else
			{
				//outletlocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
				if(requestType.equals("wstockRequestIn")){
					locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,true,false);	
					}else {
					locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,true,false);	
		
					}
				
			//	outletlocationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr,emailIdStr,true);
				locationslist = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
				locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);	

				 if((location.trim()).equals(null) || location.trim().isEmpty()) { 
					 location =locationsList.get(0); 
					 }
				
				modelAndViewObj.addObject("outletlocationsList", locationBeansList);
			}
			
			
			
//			Added by vijay, to make default loaction as location list first occurrence, if location is empty
			
			
				
			List<StockRequests> stockRequestsList = stockReceiptServiceObj.getStockRequests("",customerIdStr, emailIdStr,index, null,false,location,date,"",maxRecords,flowUnder,"","","","","",locationListAll,requestType);
			request.getSession().setAttribute("warehouseStockRequest", stockRequestsList);
			
			/*if(locationsList.size()==0 && locationsList==null){
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			}*/
			if(stockRequestsList == null || stockRequestsList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
				modelAndViewObj.addObject("TotalIndents", "0");
				modelAndViewObj.addObject("IndentsOpened", "0" );
				modelAndViewObj.addObject("TotalIndentQty",  "0");
				modelAndViewObj.addObject("TotalOutlets",  "0");
			}else{
				if(stockRequestsList.size()<Integer.parseInt(maxRecords)){
					end = (stockRequestsList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				
				for(int i= 0;i<stockRequestsList.size();i++ ){
					stockRequestsList.get(i).setNoofitems(stockRequestsList.get(i).getStockRequestItems().size());
				}
				for(int i= 0;i<stockRequestsList.size();i++ ){
					Set<String> categorylist = new HashSet<String>();
					String Category="";
					for(int j= 0;j<stockRequestsList.get(i).getStockRequestItems().size();j++ ){
						categorylist.add(stockRequestsList.get(i).getStockRequestItems().get(j).getCategory());
				}
					List<String> aList = new ArrayList<String>(categorylist);
					String category = getStringFromList(aList);
					stockRequestsList.get(i).setCategory(Category);
				}
				
				
				
				

				modelAndViewObj.addObject("totalRecords", Integer.parseInt(stockRequestsList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("TotalIndents", stockRequestsList.get(0).getTotalIndents());
				modelAndViewObj.addObject("IndentsOpened", stockRequestsList.get(0).getIndentsOpened() );
				modelAndViewObj.addObject("TotalIndentQty",  stockRequestsList.get(0).getTotalIndentQty());
				modelAndViewObj.addObject("TotalOutlets",  stockRequestsList.get(0).getTotalOutlets());
				modelAndViewObj.addObject("statuswiselist",  stockRequestsList.get(0).getStatusWiseQtyList());
			}
			modelAndViewObj.addObject("stockRequestsList", stockRequestsList);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("requestType", requestType);

			modelAndViewObj.addObject("zoneList", zoneList);
			modelAndViewObj.addObject("maxRecords",Integer.parseInt(maxRecords));
			modelAndViewObj.addObject("selectedLocation", "");
			modelAndViewObj.addObject("startDate", date);
			modelAndViewObj.setViewName("Inventory Manager/stockRequest/stockRequests");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		modelAndViewObj.addObject("flowUnder",flowUnder);
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 2-nov-2015
	 * 
	 *This method is used to display the newStockRequest form
	 *
	 **/
	@RequestMapping("/viewStockRequestDetails")
	public ModelAndView viewStockRequestDetails(@RequestParam("requestId") String requestId,@RequestParam("operation") String operation,@RequestParam("flowUnder") String flowUnder,@RequestParam("formData") String formData,HttpServletRequest request,HttpServletResponse response){
		//List<String> outletlocations=null;
		try{
			// log.info("viewStockRequestDetails");
			
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			/*List<String> warehouseLocationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr,emailIdStr);
			List<String> workLocationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr);*/
			List<StockRequests> stockRequestsList = stockReceiptServiceObj.getStockRequests("",customerIdStr, emailIdStr,"0", requestId,false,"","","","10",flowUnder,"","","","","","","");
			if(stockRequestsList != null && stockRequestsList.size()>0){
				/*for(int i=0;i<stockRequestsList.size();i++){
					stockRequestsList.get(i).setDeliveryDateStr(stockRequestsList.get(i).getDeliveryDateStr().substring(0, 10));
					stockRequestsList.get(i).setRequestDateStr(stockRequestsList.get(i).getRequestDateStr().substring(0, 10));
				}*/
				modelAndViewObj.addObject("stockRequestsObj", stockRequestsList.get(0));
				}
			//outletlocations = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr, false);
			//modelAndViewObj.setViewName("Inventory Manager/stockReturn/viewStockReturn");
			//////////System.out.println(operation);
			//added by manasa
			RequestBean stockRequestObj=gson.fromJson(formData, RequestBean.class);
			modelAndViewObj.addObject("stockRequestObj",stockRequestObj);
			
			if(operation.equalsIgnoreCase("view"))
				modelAndViewObj.setViewName("Inventory Manager/stockRequest/viewStockRequest");
			else{
				List <String> outletlocations = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr, false);
					//	adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
				List <String> locationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr, false);
				modelAndViewObj.setViewName("Inventory Manager/stockRequest/editStockRequest");
				modelAndViewObj.addObject("outletlocationsList",outletlocations);
				modelAndViewObj.addObject("locationsList",locationsList);
			}
		}catch(Exception exception){
			exception.printStackTrace();
		}
		modelAndViewObj.addObject("flowUnder",flowUnder);
		return modelAndViewObj;
	}
	
	
	@RequestMapping("/searchProductGroupMaster")
	public @ResponseBody List<Group> searchProductGroupMaster(@RequestParam("searchName") String searchNameStr,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<Group> GroupsList = new ArrayList<Group>();
		try{
			// log.info("searchProductGroupMaster");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			GroupsList = outletMasterServiceObj.searchProductGroupMaster(customerIdStr, emailIdStr,searchNameStr);
			// log.info("Result:::"+GroupsList);
		}catch(Exception e){
			e.printStackTrace();
		}
		return GroupsList;
	}
	
	@RequestMapping("/searchCategoryMaster")
	public @ResponseBody List<ProductCategoryBean> searchCategoryMaster(@RequestParam("searchName") String searchNameStr,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<ProductCategoryBean> categoryList = new ArrayList<ProductCategoryBean>();
		try{
			// log.info("searchProductGroupMaster");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			 categoryList = outletMasterServiceObj.getCategoryDetails(searchNameStr,customerIdStr, emailIdStr,"0");
			// log.info("Result:::"+categoryList);
		}catch(Exception e){
			e.printStackTrace();
		}
		return categoryList;
	}
	
	@RequestMapping("/searchGroupSkus")
	public @ResponseBody List<GroupChild> searchGroupSkus(@RequestParam("groupId") String groupId,@RequestParam("searchCriteria")String searchCriteria, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<GroupChild> groupChildList = new ArrayList<GroupChild>();
		try{
			// log.info("searchProducts");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			groupChildList = outletMasterServiceObj.searchGroupSkus(customerIdStr, emailIdStr,groupId,searchCriteria);
			// log.info("Result:::"+groupChildList);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return groupChildList;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 4-nov-2015
	 * 
	 *This method is used to display all the department details in a tabular form
	 *
	 **/
	@RequestMapping("/viewGoodsReturn")
	public ModelAndView viewGoodsReturn(@RequestParam("index") String index,@RequestParam("fromLocation") String fromLocation,@RequestParam("flowUnder") String flowUnder,@RequestParam("maxRecords") String maxRecords,HttpServletRequest request,HttpServletResponse response){

     ArrayList<LocationBean> locationsList = null;
		try{
			// log.info("viewGoodsReturn");
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
//			List<String> locationsList = null;
			if(flowUnder.equals("outlet"))
				locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			else
				 locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","Warehouse",false,false,true);
//				locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
			/*if(fromLocation == null || "".equals(fromLocation))
				fromLocation = (String)request.getSession().getAttribute("selectedLocation");*/
			
			if(fromLocation == null || fromLocation == "")
				fromLocation = locationsList.get(0).getLocationId();
			
			List<StockReturn> stockReturnsList = stockIssueServiceObj.getStockReturn(customerIdStr, emailIdStr, fromLocation,"","", index,"","",maxRecords,flowUnder);
			
			if(!fromLocation.equals(""))
				request.getSession().setAttribute("selectedLocation", fromLocation);
			modelAndViewObj = new ModelAndView();
			if(stockReturnsList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(stockReturnsList.size()<Integer.parseInt(maxRecords)){
					end = (stockReturnsList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(stockReturnsList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("selectedLocation", fromLocation);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("stockReturnsList", stockReturnsList);
			modelAndViewObj.setViewName("Inventory Manager/stockReturn/stockReturns");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
		modelAndViewObj.addObject("flowUnder", flowUnder);
		return modelAndViewObj;
	}
	
	
		@RequestMapping("/newStockReturn")
		public ModelAndView newStockReturn(@RequestParam("flowUnder") String flowUnder,HttpServletRequest request,HttpServletResponse response) {
			String customerIdStr = null,emailIdStr=null;
			List<String> locationsList = null;
			try{
				// log.info("newStockReturn");
				modelAndViewObj = new ModelAndView();
				customerIdStr = (String)request.getSession().getAttribute("customerId");
				emailIdStr  = (String)request.getSession().getAttribute("emailId");
				if(flowUnder.equals("outlet"))
					locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
				else
					locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,false);
				
				if(locationsList==null || locationsList.size()==0 ){
					modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
				}
				String location = (String)request.getSession().getAttribute("selectedLocation");
				if(location == null)
					location = locationsList.get(0);
				modelAndViewObj.addObject("selectedLocation",location);
				modelAndViewObj.addObject("locationsList", locationsList);
				modelAndViewObj.setViewName("Inventory Manager/stockReturn/newStockReturn");
				
			}catch(Exception e){
				e.printStackTrace();
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
				modelAndViewObj.setViewName("Inventory Manager/stockReturn/newStockReturn");
			}
			modelAndViewObj.addObject("flowUnder", flowUnder);
			return modelAndViewObj;
		}
		
		
		/**
		 * 
		 * @author Mythri.S
		 * Created On: 6-may-2015.
		 * 
		 * This method is used to search supplier.
		 * It returns the supplier list matching the search string
		 * 
		 */
		
		@RequestMapping("/searchGoodsIssue")
		public @ResponseBody List<String> searchGoodsIssue(@RequestParam("searchName") String searchNameStr,@RequestParam("issueToLocation") String issueToLocation,HttpServletRequest request,HttpServletResponse response) {
			String customerIdStr = null,emailIdStr=null;
			List<String> issueRefList = new ArrayList<String>();
			try{
				// log.info("searchGoodsIssue");
				customerIdStr = (String)request.getSession().getAttribute("customerId");
				emailIdStr = (String)request.getSession().getAttribute("emailId");
				ArrayList<LocationBean> locationDetails = genericMasterServiceObj.getLocationDetails(issueToLocation,customerIdStr, emailIdStr,"0","",false,true,true);
				issueRefList = stockIssueServiceObj.getStockIssueIds(customerIdStr, emailIdStr, issueToLocation, searchNameStr,locationDetails.get(0).getBusinessActivity());
				// log.info("Result:::"+issueRefList);
			
			}catch(Exception e){
				e.printStackTrace();
			}
			return issueRefList;
		}
		
		@RequestMapping("/getGoodsIssues")
		public @ResponseBody List<StockIssueDetails> getGoodsIssues(@RequestParam("issueRef") String issueRef,HttpServletRequest request,HttpServletResponse response){
			String customerIdStr=null,emailIdStr=null;
			List<StockIssueDetails> itemDetails = new ArrayList<StockIssueDetails>();
			StockIssueBean stockIssueDetailsObj =null;
			try{
				customerIdStr = (String)request.getSession().getAttribute("customerId");
				emailIdStr  = (String)request.getSession().getAttribute("emailId");
				stockIssueDetailsObj = stockIssueServiceObj.getStockIssue(customerIdStr, emailIdStr, issueRef,"");
				itemDetails = stockIssueDetailsObj.getItemDetails();
				if(itemDetails != null && itemDetails.size() > 0){
					itemDetails.get(0).setStockRequestId(stockIssueDetailsObj.getGoods_Request_Ref());
					itemDetails.get(0).setFromLocation(stockIssueDetailsObj.getShipped_from());
					if(stockIssueDetailsObj.getDeliveryDate() != null && !stockIssueDetailsObj.getDeliveryDate().equals("")){
						String deliveryDate[] = stockIssueDetailsObj.getDeliveryDate().split(" ");
						if(deliveryDate != null && deliveryDate.length > 0)
							itemDetails.get(0).setDeliveryDateStr(deliveryDate[0]);
					}
					itemDetails.get(0).setDeliveredBy(stockIssueDetailsObj.getDelivered_by());
					itemDetails.get(0).setInspectedBy(stockIssueDetailsObj.getInspectedBy());
					itemDetails.get(0).setReceivedBy(stockIssueDetailsObj.getReceivedBy());
					
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			
			return itemDetails;
		}
		
		@RequestMapping("/searchGoodsReceipt")
		public @ResponseBody List<String> searchGoodsReceipt(@RequestParam("searchName") String searchNameStr,@RequestParam("fromLocation") String fromLocation,HttpServletRequest request,HttpServletResponse response) {
			String customerIdStr = null,emailIdStr=null;
			List<String> issueRefList = new ArrayList<String>();
			try{
				// log.info("searchGoodsReceipt");
				customerIdStr = (String)request.getSession().getAttribute("customerId");
				emailIdStr = (String)request.getSession().getAttribute("emailId");
				issueRefList = stockReceiptServiceObj.getStockReceiptIds(customerIdStr, emailIdStr, fromLocation, searchNameStr);
				// log.info("Result:::"+issueRefList);
			}catch(Exception e){
				e.printStackTrace();
			}
			return issueRefList;
		}
		
		@RequestMapping("/getGoodsReceipts")
		public @ResponseBody List<StockRecieptDetails> getGoodsReceipts(@RequestParam("receiptRef") String receiptRef,HttpServletRequest request,HttpServletResponse response){
			String customerIdStr=null,emailIdStr=null;
			List<StockRecieptDetails> itemDetails = new ArrayList<StockRecieptDetails>();
			StockReciept stockReceiptObj =null;
			try{
				customerIdStr = (String)request.getSession().getAttribute("customerId");
				emailIdStr  = (String)request.getSession().getAttribute("emailId");
				stockReceiptObj = stockReceiptServiceObj.getStockReceipt(customerIdStr, emailIdStr, receiptRef,"");
				itemDetails = stockReceiptObj.getReciptDetails();
			}catch(Exception e){
				e.printStackTrace();
			}
			return itemDetails;
		}
		
		
		
		/**
		 * 
		 * @author Mythri.S
		 * Created On: 6-may-2015.
		 * 
		 * This method is used to search supplier.
		 * It returns the supplier list matching the search string
		 * 
		 */
		
		@RequestMapping("/searchGoodsRequest")
		public @ResponseBody List<String> searchGoodsRequest(@RequestParam("searchName") String searchNameStr,@RequestParam("fromlocation") String fromlocation,@RequestParam("flowUnder") String flowUnder,HttpServletRequest request,HttpServletResponse response) {
			String customerIdStr = null,emailIdStr=null;
			List<String> requestRefList = new ArrayList<String>();
			try{
				// log.info("searchGoodsRequest");
				customerIdStr = (String)request.getSession().getAttribute("customerId");
				emailIdStr = (String)request.getSession().getAttribute("emailId");
				 requestRefList = stockReceiptServiceObj.getStockRequestIds(customerIdStr, emailIdStr, fromlocation, searchNameStr);
			
			
			}catch(Exception e){
				e.printStackTrace();
			}
			return requestRefList;
		}
		
		@RequestMapping("/getGoodsRequest")
		public @ResponseBody List<StockRequestItems> getGoodsRequest(@RequestParam("requestId") String requestId,@RequestParam("flowUnder") String flowUnder,HttpServletRequest request,HttpServletResponse response){
			String customerIdStr=null,emailIdStr=null;
			List<StockRequestItems> itemDetails = new ArrayList<StockRequestItems>();
			try{
				customerIdStr = (String)request.getSession().getAttribute("customerId");
				emailIdStr  = (String)request.getSession().getAttribute("emailId");
				List<StockRequests> stockRequestsList = stockReceiptServiceObj.getStockRequests("",customerIdStr, emailIdStr,"0", requestId,false,"","","","10","all","","","","","","","");
				
				
				if(stockRequestsList != null && stockRequestsList.size() > 0){
					
					itemDetails = stockRequestsList.get(0).getStockRequestItems();
					if(itemDetails != null && itemDetails.size() > 0){
						itemDetails.get(0).setFromLocation(stockRequestsList.get(0).getFromWareHouseId());
						if(stockRequestsList.get(0).getDeliveryDateStr() != null && !stockRequestsList.get(0).getDeliveryDateStr().equals("")){
							String deliveryDate[] = stockRequestsList.get(0).getDeliveryDateStr().split(" ");
							if(deliveryDate != null && deliveryDate.length > 0)
								itemDetails.get(0).setDeliveryDateStr(deliveryDate[0]);
							String requestedBy = stockRequestsList.get(0).getRequestedUserName();
							if(requestedBy != null && requestedBy.length() > 0)
								itemDetails.get(0).setRequestedBy(requestedBy);
							if(stockRequestsList.get(0).getRequestedQty() != null)
								itemDetails.get(0).setReqQty(stockRequestsList.get(0).getRequestedQty());
						}
					}
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			
			return itemDetails;
		}
		
		@RequestMapping(value="/createStockReturn",method=RequestMethod.POST,consumes="application/json")
		public ModelAndView createStockReturn(@RequestBody StockReturn stockReturnObj,HttpServletRequest request,HttpServletResponse response) {
			try{
				// log.info("createStockReturn");
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				String result = stockIssueServiceObj.createStockReturn(stockReturnObj,customerIdStr,emailIdStr);
				request.getSession().setAttribute("selectedLocation", stockReturnObj.getFromLocation());
				List<String> locationsList = null;
				if(stockReturnObj.getFlowUnder().equals("outlet"))
					locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
				else
					locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,false);
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("selectedLocation",stockReturnObj.getFromLocation());
				modelAndViewObj.addObject("locationsList", locationsList);
				modelAndViewObj.addObject("err", result);
				modelAndViewObj.setViewName("Inventory Manager/stockReturn/newStockReturn");
			}catch(Exception e){
				e.printStackTrace();
			}
			modelAndViewObj.addObject("flowUnder", stockReturnObj.getFlowUnder());
			return modelAndViewObj;
		}

		/**
		 * 
		 * @author Mythri.S
		 * 
		 *This method is used to display the Edit Sku form with all the details of the Sku
		 *
		 **/
		@RequestMapping("/editStockReturn")
		public ModelAndView editStockReturn(@RequestParam("retrunNoteRef") String retrunNoteRef,@RequestParam("operation") String operation,@RequestParam("flowUnder") String flowUnder,@RequestParam("formData") String formData,HttpServletRequest request,
				HttpServletResponse response){
			try{
				// log.info("editSku");
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				List<StockReturn> stockReturnsList = stockIssueServiceObj.getStockReturn(customerIdStr, emailIdStr, "","",retrunNoteRef, "0","","","10",flowUnder);
//				List<Sku> skuList = skuServiceObj.getSKUDetails(skuID, customerId, emailId,"0");
				List<String> locationsList = null;
				List<String> locationsListAll = null;
				
				
				locationsListAll = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr,emailIdStr,true);

				if(flowUnder.equals("outlet"))
					locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
				else
					locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
				modelAndViewObj = new ModelAndView();
//				modelAndViewObj.addObject("sku", skuList.get(0));
				modelAndViewObj.addObject("stockReturnObj", stockReturnsList.get(0));
				modelAndViewObj.addObject("locationsList", locationsList);
				
				
				//added by manasa 
				StockReturn skuObj=gson.fromJson(formData, StockReturn.class);
				modelAndViewObj.addObject("skuObj",skuObj);
				modelAndViewObj.addObject("locationsListAll", locationsListAll);
				if(operation.equals("view"))
					modelAndViewObj.setViewName("Inventory Manager/stockReturn/viewStockReturn");
				else
					modelAndViewObj.setViewName("Inventory Manager/stockReturn/editStockReturn");
			}
			catch(Exception exception){
				exception.printStackTrace();
			}
			modelAndViewObj.addObject("flowUnder", flowUnder);
			return modelAndViewObj;
		}
		
		@RequestMapping("/searchOutletStockReturn")
		public ModelAndView searchStockReturn(@RequestParam("searchName") String searchNameStr,@RequestParam("startDate") String startDateStr,@RequestParam("endDate") String endDateStr,@RequestParam("index") String index,@RequestParam("maxRecords") String maxRecordsStr,@RequestParam("fromLocation") String fromLocation,@RequestParam("zone") String zone,@RequestParam("flowUnder") String flowUnder, HttpServletRequest request,HttpServletResponse response) {
			String customerIdStr = null,emailIdStr=null;
			ArrayList<LocationBean> locationsList = new ArrayList<LocationBean>();
			try{
				// log.info("searchStockReturn");
				int start = 1,end = Integer.parseInt(maxRecordsStr);
				customerIdStr = (String)request.getSession().getAttribute("customerId");
				emailIdStr = (String)request.getSession().getAttribute("emailId");
//				List<String> locationsList = null;
				if(flowUnder.equals("outlet"))
				{
				//	locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
					
					if(zone == null || zone.trim().equals(""))
						locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
					else
						locationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");
					
				
				}
				else
					locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","Warehouse",false,false,true);
				List<StockReturn> stockReturnsList = stockIssueServiceObj.getStockReturn(customerIdStr, emailIdStr, fromLocation,searchNameStr,"", index,startDateStr,endDateStr,maxRecordsStr,flowUnder);
				modelAndViewObj = new ModelAndView();
				request.getSession().setAttribute("selectedLocation", fromLocation);
				modelAndViewObj.addObject("selectedLocation", fromLocation);
				if(stockReturnsList == null || stockReturnsList.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(stockReturnsList.size()<Integer.parseInt(maxRecordsStr)){
						end = (stockReturnsList.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(stockReturnsList.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
				}
				modelAndViewObj.addObject("selectedLocation", fromLocation);
				modelAndViewObj.addObject("locationsList", locationsList);
				modelAndViewObj.addObject("startDate", startDateStr);
				modelAndViewObj.addObject("endDate", endDateStr);
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecordsStr));
			    modelAndViewObj.addObject("stockReturnsList", stockReturnsList);
			    modelAndViewObj.addObject("searchName", searchNameStr);
			    modelAndViewObj.addObject("zone", zone);
				modelAndViewObj.setViewName("Inventory Manager/stockReturn/stockReturns");
				
			}catch(Exception e){
				e.printStackTrace();
			}
			modelAndViewObj.addObject("flowUnder", flowUnder);
			return modelAndViewObj;
		}
		
		@RequestMapping(value="/updateStockReturn",method=RequestMethod.POST,consumes="application/json")
		public ModelAndView updateStockReturn(@RequestBody StockReturn stockReturnObj,HttpServletRequest request,HttpServletResponse response) {
			try{
				// log.info("updateStockReturn");
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				String result = stockIssueServiceObj.updateStockReturn(stockReturnObj,customerIdStr,emailIdStr);
				request.getSession().setAttribute("selectedLocation", stockReturnObj.getFromLocation());
				List<String> locationsList = null;
                List<String> locationsListAll = null;
				
				locationsListAll = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr,emailIdStr,true);

				if(stockReturnObj.getFlowUnder().equals("outlet"))
					locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
				else
					locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,false);
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("stockReturnObj", stockReturnObj);
				modelAndViewObj.addObject("selectedLocation",stockReturnObj.getFromLocation());
				modelAndViewObj.addObject("locationsList", locationsList);
				modelAndViewObj.addObject("err", result);
				modelAndViewObj.addObject("locationsListAll", locationsListAll);
				modelAndViewObj.setViewName("Inventory Manager/stockReturn/editStockReturn");
			}catch(Exception e){
				e.printStackTrace();
			}
			modelAndViewObj.addObject("flowUnder", stockReturnObj.getFlowUnder());
			return modelAndViewObj;
		}
		
		
		/**
		 * 
		 * @author Mythri.S
		 * 
		 *This method is used to display all Tax details related to a location in a tabular format
		 *
		 **/
		@RequestMapping("/viewStoreTaxation")
		public ModelAndView viewStoreTaxation(@RequestParam("maxRecords") String maxRecords,@RequestParam("index") String index,@RequestParam("location") String location,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
			ArrayList<LocationBean> locationBeansList = null;
			List<String> locationsListValue =null;
			String locationListAll = "";
			try{
				// log.info("viewStoreTaxation");
				locationsListValue = new ArrayList<String>();
				int start = 1,end = Integer.parseInt(maxRecords);
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
			//	List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
				
			/*	
//				Added by vijay, to make default loaction as location list first occurrence, if location is empty
				if((location.trim()).equals(null) || location.trim().isEmpty())
					location = workLocationsList.get(0);*/
				locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);	
//				Added by vijay, to make default loaction as location list first occurrence, if location is empty
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
				
				if(location != null && !location.equals(""))
					request.getSession().setAttribute("selectedLocation", location);
				List<StoreTaxation> storeTaxationList = adminServiceObj.getStoreTaxation(searchName, customerIdStr, emailIdStr, index,location,null,false,maxRecords,locationListAll);
				modelAndViewObj = new ModelAndView();
				if(storeTaxationList == null || storeTaxationList.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(storeTaxationList.size()<Integer.parseInt(maxRecords)){
						end = (storeTaxationList.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(storeTaxationList.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
				}
				modelAndViewObj.addObject("selectedLocation", location);
				modelAndViewObj.addObject("searchName", searchName);
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.addObject("storeTaxationList", storeTaxationList);
				modelAndViewObj.addObject("workLocationsList", locationBeansList);
				modelAndViewObj.setViewName("Outlet Master/storeTaxationMaster");
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
		
		
		
		
		@RequestMapping("/viewWarehouseTaxation")
		public ModelAndView viewWarehouseTaxation(@RequestParam("maxRecords") String maxRecords,@RequestParam("index") String index,@RequestParam("location") String location,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
			ArrayList<LocationBean> locationBeansList = null;
			List<String> locationsListValue =null;
			String locationListAll = "";
			try{
				// log.info("viewStoreTaxation");
				locationsListValue = new ArrayList<String>();
				int start = 1,end = Integer.parseInt(maxRecords);
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
			
				locationBeansList =  genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","Warehouse",false,false,true);

				if(location.equals("all")|| location.equals("")){
					
					location = "";
					
				}
				
				if(location != null && !location.equals(""))
					request.getSession().setAttribute("selectedLocation", location);
				List<WarehouseTaxation> storeTaxationList = adminServiceObj.getWarehouseTaxation(searchName, customerIdStr, emailIdStr, index,location,null,false,maxRecords,locationListAll);
				modelAndViewObj = new ModelAndView();
				if(storeTaxationList == null || storeTaxationList.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(storeTaxationList.size()<Integer.parseInt(maxRecords)){
						end = (storeTaxationList.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(storeTaxationList.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
				}
				modelAndViewObj.addObject("selectedLocation", location);
				modelAndViewObj.addObject("searchName", searchName);
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.addObject("storeTaxationList", storeTaxationList);
				modelAndViewObj.addObject("workLocationsList", locationBeansList);
				modelAndViewObj.setViewName("Inventory Manager/warehouse/taxation/WHTaxationMaster");
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
		
		
		
		/**
		 * 
		 * @author Mythri.S
		 * 
		 *This method is used display the form to new store taxation form, which allows to allocate tax values to a location
		 *
		 **/
		@RequestMapping("/newStoreTax")
		public ModelAndView newStoreTax(@RequestParam("locationStr") String locationStr,HttpServletRequest request,HttpServletResponse response){
			try{
				// log.info("newStoreTax ");
				modelAndViewObj = new ModelAndView();
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				String location = (String)request.getSession().getAttribute("selectedLocation");
				List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
				if(location == null)
					location = workLocationsList.get(0);
				if(location != null && !location.equals(""))
					request.getSession().setAttribute("selectedLocation", location);
				ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails("",customerIdStr, emailIdStr,"-1",false,"");
				modelAndViewObj.addObject("taxDetails",taxDetails);
				if(taxDetails != null && taxDetails.size() > 0)
					modelAndViewObj.addObject("taxDescription",taxDetails.get(0).getTaxDescription());
				modelAndViewObj.addObject("workLocationsList", workLocationsList);
				modelAndViewObj.addObject("selectedLocation", location);
				modelAndViewObj.addObject("location", locationStr);
				modelAndViewObj.setViewName("Outlet Master/newStoreTaxation");
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
		
		
		@RequestMapping("/newWarehouseTax")
		public ModelAndView newWarehouseTax(@RequestParam("locationStr") String locationStr,HttpServletRequest request,HttpServletResponse response){
			try{
				// log.info("newStoreTax ");
				modelAndViewObj = new ModelAndView();
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				String location = (String)request.getSession().getAttribute("selectedLocation");
				
				
				List<String> workLocationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr, true);
				if(location == null)
					location = workLocationsList.get(0);
				if(location != null && !location.equals(""))
					request.getSession().setAttribute("selectedLocation", location);
				ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails("",customerIdStr, emailIdStr,"-1",false,"");
				modelAndViewObj.addObject("taxDetails",taxDetails);
				if(taxDetails != null && taxDetails.size() > 0)
					modelAndViewObj.addObject("taxDescription",taxDetails.get(0).getTaxDescription());
				modelAndViewObj.addObject("workLocationsList", workLocationsList);
				modelAndViewObj.addObject("selectedLocation", location);
				modelAndViewObj.addObject("location", locationStr);
				modelAndViewObj.setViewName("Inventory Manager/warehouse/taxation/newWHTaxation");
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
			
		
		
		
		
		
		/**
		 * 
		 * @author Mythri.S
		 * 
		 *This method is used to save the tax value to the location
		 *
		 **/
		@RequestMapping(value="/createStoreTaxation",method=RequestMethod.POST,consumes="application/json")
		public ModelAndView createStoreTaxation(@RequestBody StoreTaxation storeTaxationObj,HttpServletRequest request,HttpServletResponse response){
			try{
				// log.info("createStoreTaxation ");
				modelAndViewObj = new ModelAndView();
				String roleStr = (String)request.getSession().getAttribute("role");
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				String resultStr = adminServiceObj.createStoreTaxation(storeTaxationObj,customerIdStr,emailIdStr,roleStr);
				String location = (String)request.getSession().getAttribute("selectedLocation");
				List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
				if(location == null)
					location = workLocationsList.get(0);
				if(location != null && !location.equals(""))
					request.getSession().setAttribute("selectedLocation", location);
				ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails("",customerIdStr, emailIdStr,"-1",false,"");
				modelAndViewObj.addObject("taxDetails",taxDetails);
				if(taxDetails != null && taxDetails.size() > 0)
					modelAndViewObj.addObject("taxDescription",taxDetails.get(0).getTaxDescription());
			
				
				//added by manasa
				//purpose:to get success or error message
				if(!resultStr.equals(AppProperties.getAppMessageByProperty("STORE_TAXATION_CREATE_SUCCESS").trim())){
					modelAndViewObj.addObject("storeTaxation", storeTaxationObj);
					modelAndViewObj.addObject("err", resultStr);
					modelAndViewObj.addObject("type", "new");
					modelAndViewObj.setViewName("Outlet Master/newStoreTaxation");
				}else{
					modelAndViewObj.addObject("succcess", resultStr);
					modelAndViewObj.setViewName("Outlet Master/newStoreTaxation");
				}
				modelAndViewObj.addObject("workLocationsList", workLocationsList);
				modelAndViewObj.addObject("selectedLocation", location);
				modelAndViewObj.setViewName("Outlet Master/newStoreTaxation");
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
		
		@RequestMapping(value="/createWarehouseTaxation",method=RequestMethod.POST,consumes="application/json")
		public ModelAndView createWarehouseTaxation(@RequestBody WarehouseTaxation storeTaxationObj,HttpServletRequest request,HttpServletResponse response){
			try{
				// log.info("createStoreTaxation ");
				modelAndViewObj = new ModelAndView();
				String roleStr = (String)request.getSession().getAttribute("role");
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				String resultStr = adminServiceObj.createWarehouseTaxation(storeTaxationObj,customerIdStr,emailIdStr,roleStr);
				String location = (String)request.getSession().getAttribute("selectedLocation");
				List<String> workLocationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr,emailIdStr,true);
				if(location == null)
					location = workLocationsList.get(0);
				if(location != null && !location.equals(""))
					request.getSession().setAttribute("selectedLocation", location);
				ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails("",customerIdStr, emailIdStr,"-1",false,"");
				modelAndViewObj.addObject("taxDetails",taxDetails);
				if(taxDetails != null && taxDetails.size() > 0)
					modelAndViewObj.addObject("taxDescription",taxDetails.get(0).getTaxDescription());
			
				
				//added by manasa
				//purpose:to get success or error message
				if(!resultStr.equals(AppProperties.getAppMessageByProperty("WH_TAXATION_CREATE_SUCCESS").trim())){
					modelAndViewObj.addObject("storeTaxation", storeTaxationObj);
					modelAndViewObj.addObject("err", resultStr);
					modelAndViewObj.addObject("type", "new");
					modelAndViewObj.setViewName("Inventory Manager/warehouse/taxation/newWHTaxation");
				}else{
					modelAndViewObj.addObject("succcess", resultStr);
					modelAndViewObj.setViewName("Inventory Manager/warehouse/taxation/newWHTaxation");
				}
				modelAndViewObj.addObject("workLocationsList", workLocationsList);
				modelAndViewObj.addObject("selectedLocation", location);
				modelAndViewObj.setViewName("Inventory Manager/warehouse/taxation/newWHTaxation");
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
		
		/**
		 * 
		 * @author Mythri.S
		 * 
		 *This method is used to tax description of the given taxId
		 *
		 **/
		@RequestMapping("/getTaxDesc")
		public @ResponseBody String getTaxDesc(@RequestParam("taxId") String taxId,HttpServletRequest request,HttpServletResponse response){
			String taxDesc = null;
			try{
				// log.info("getTaxDesc");
				String customerId = (String)request.getSession().getAttribute("customerId");
				String emailId = (String)request.getSession().getAttribute("emailId");
				ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails(taxId,customerId, emailId,"0",false,"");
				if(taxDetails != null && taxDetails.size() > 0)
					taxDesc = taxDetails.get(0).getTaxDescription();
			}
			catch(Exception exception){
				exception.printStackTrace();
			}
			return taxDesc;
		}
		
		/**
		 * 
		 * @param searchNameStr
		 * @param index
		 * @param location
		 * @param request
		 * @param response
		 * 
		 * This method is used to search store taxation based on search criteria and location
		 * 
		 */
		
		@RequestMapping("/searchStoreTaxationMaster")
		public ModelAndView searchStoreTaxationMaster(@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,@RequestParam("location") String location, @RequestParam("locationList") String locationListAll,HttpServletRequest request,HttpServletResponse response) {
			String customerIdStr = null,emailIdStr=null;
			ArrayList<LocationBean> workLocationsList = null;
			try{
				// log.info("searchStoreTaxationMaster");
				int start = 1,end = 10;
				customerIdStr = (String)request.getSession().getAttribute("customerId");
				emailIdStr = (String)request.getSession().getAttribute("emailId");
			//	List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
				workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
				List<StoreTaxation> storeTaxationList = adminServiceObj.getStoreTaxation(searchNameStr, customerIdStr, emailIdStr, index,location,null,true,maxRecords,locationListAll);
				modelAndViewObj = new ModelAndView();
				if(location != null && !location.equals(""))
					request.getSession().setAttribute("selectedLocation", location);
				modelAndViewObj.addObject("selectedLocation", location);
				if(storeTaxationList == null || storeTaxationList.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(storeTaxationList.size()<10){
						end = (storeTaxationList.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(storeTaxationList.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
				}
				modelAndViewObj.addObject("workLocationsList", workLocationsList);
				modelAndViewObj.addObject("storeTaxationList", storeTaxationList);
			    modelAndViewObj.addObject("searchName", searchNameStr);
			    modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
			    modelAndViewObj.setViewName("Outlet Master/storeTaxationMaster");
			}catch(Exception e){
				e.printStackTrace();
			}
			return modelAndViewObj;
		}
		
		/**
		 * 
		 * @author Mythri.S
		 * 
		 *This method is used to display the Edit Store Taxation form consisting of the details of the Store Tax
		 * added taxlocation as param to display get selected location
		 **/
		@RequestMapping("/editStoreTaxation")
		public ModelAndView editStoreTaxation(@RequestParam("maxRecords") String maxRecords,@RequestParam("taxName") String taxName,@RequestParam("location") String location,@RequestParam("taxCategory") String taxCategory,@RequestParam("operation") String operation,@RequestParam("taxlocation") String taxlocation,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
			try{
				// log.info("editStoreTaxation");
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				List<StoreTaxation> storeTaxationList = adminServiceObj.getStoreTaxation(taxName, customerIdStr, emailIdStr, "0",location,taxCategory,false,"10","");
				List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
				ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails("",customerIdStr, emailIdStr,"-1",false,"");
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("taxDetails",taxDetails);
				modelAndViewObj.addObject("workLocationsList", workLocationsList);
				modelAndViewObj.addObject("storeTaxation", storeTaxationList.get(0));
				//added by manasa
				modelAndViewObj.addObject("taxlocation", taxlocation);
				modelAndViewObj.addObject("maxRecords", maxRecords);
				modelAndViewObj.addObject("searchName", searchName);
				if(operation.equals("view"))
					modelAndViewObj.setViewName("Outlet Master/viewStoreTaxation");
				else
					modelAndViewObj.setViewName("Outlet Master/editStoreTaxation");
			}
			catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
		
		@RequestMapping("/editWHTaxation")
		public ModelAndView editWHTaxation(@RequestParam("maxRecords") String maxRecords,@RequestParam("taxName") String taxName,@RequestParam("location") String location,@RequestParam("taxCategory") String taxCategory,@RequestParam("operation") String operation,@RequestParam("taxlocation") String taxlocation,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
			try{
				// log.info("editStoreTaxation");
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				List<WarehouseTaxation> storeTaxationList = adminServiceObj.getWarehouseTaxation(taxName, customerIdStr, emailIdStr, "0",location,taxCategory,false,"10","");
				List<String> workLocationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr,emailIdStr,true);
				ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails("",customerIdStr, emailIdStr,"-1",false,"");
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("taxDetails",taxDetails);
				modelAndViewObj.addObject("workLocationsList", workLocationsList);
				modelAndViewObj.addObject("storeTaxation", storeTaxationList.get(0));
				//added by manasa
				modelAndViewObj.addObject("taxlocation", taxlocation);
				modelAndViewObj.addObject("maxRecords", maxRecords);
				modelAndViewObj.addObject("searchName", searchName);
				if(operation.equals("view"))
					modelAndViewObj.setViewName("Inventory Manager/warehouse/taxation/viewWHTaxation");
				else
					modelAndViewObj.setViewName("Inventory Manager/warehouse/taxation/editWHTaxation");
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
		 *This method is used to update the value of the tax already allocated to store
		 *
		 **/
		@RequestMapping(value="/updateStoreTaxation",method=RequestMethod.POST,consumes="application/json")
		public ModelAndView updateStoreTaxation(@RequestBody StoreTaxation storeTaxationObj,HttpServletRequest request,HttpServletResponse response){
			try{
				// log.info("updateStoreTaxation ");
				modelAndViewObj = new ModelAndView();
				String roleStr = (String)request.getSession().getAttribute("role");
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				String resultStr = adminServiceObj.updateStoreTaxation(storeTaxationObj,customerIdStr,emailIdStr,roleStr);
				List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
				ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails("",customerIdStr, emailIdStr,"-1",false,"");
				
				modelAndViewObj.addObject("taxDetails",taxDetails);
			
				
				if(!resultStr.equals(AppProperties.getAppMessageByProperty("STORE_TAXATION_UPDATE_SUCCESS").trim())){
					modelAndViewObj.addObject("storeTaxation", storeTaxationObj);
					modelAndViewObj.addObject("err", resultStr);
					modelAndViewObj.addObject("type", "new");
					modelAndViewObj.setViewName("Outlet Master/newStoreTaxation");
				}else{
					modelAndViewObj.addObject("succcess", resultStr);
					modelAndViewObj.addObject("storeTaxation", storeTaxationObj);
					modelAndViewObj.setViewName("Outlet Master/newStoreTaxation");
				}
				//added by manasa to get location for back filter
				modelAndViewObj.addObject("taxlocation",storeTaxationObj.getLocation());
				modelAndViewObj.addObject("workLocationsList", workLocationsList);
				//modelAndViewObj.addObject("err", resultStr);
				modelAndViewObj.setViewName("Outlet Master/editStoreTaxation");
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
	
		
		@RequestMapping(value="/updateWarehouseTaxation",method=RequestMethod.POST,consumes="application/json")
		public ModelAndView updateWarehouseTaxation(@RequestBody WarehouseTaxation storeTaxationObj,HttpServletRequest request,HttpServletResponse response){
			try{
				// log.info("updateStoreTaxation ");
				modelAndViewObj = new ModelAndView();
				String roleStr = (String)request.getSession().getAttribute("role");
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				String resultStr = adminServiceObj.updateWarehouseTaxation(storeTaxationObj,customerIdStr,emailIdStr,roleStr);
				List<String> workLocationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr,emailIdStr,true);
				ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails("",customerIdStr, emailIdStr,"-1",false,"");
				
				modelAndViewObj.addObject("taxDetails",taxDetails);
			
				
				if(!resultStr.equals(AppProperties.getAppMessageByProperty("WH_TAXATION_UPDATE_SUCCESS").trim())){
					modelAndViewObj.addObject("storeTaxation", storeTaxationObj);
					modelAndViewObj.addObject("err", resultStr);
					modelAndViewObj.addObject("type", "new");
					modelAndViewObj.setViewName("Inventory Manager/warehouse/taxation/newWHTaxation");
				}else{
					modelAndViewObj.addObject("succcess", resultStr);
					modelAndViewObj.addObject("storeTaxation", storeTaxationObj);
					modelAndViewObj.setViewName("Inventory Manager/warehouse/taxation/newWHTaxation");
				}
				//added by manasa to get location for back filter
				modelAndViewObj.addObject("taxlocation",storeTaxationObj.getLocation());
				modelAndViewObj.addObject("workLocationsList", workLocationsList);
				//modelAndViewObj.addObject("err", resultStr);
				modelAndViewObj.setViewName("Inventory Manager/warehouse/taxation/editWHTaxation");
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
	
		
		@RequestMapping("/viewAverageInventory")
		public ModelAndView viewAverageInventory(HttpServletRequest request,HttpServletResponse response) {
			String emailIdStr=null,customerIdStr=null;
			try{
				// log.info("viewAverageInventory");
				modelAndViewObj = new ModelAndView();
				emailIdStr = (String)request.getSession().getAttribute("emailId");
				customerIdStr = (String)request.getSession().getAttribute("customerId");
				List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
				/*String location = (String)request.getSession().getAttribute("selectedLocation");
					if(location == null && workLocationsList != null && workLocationsList.size()>0 )
						location = workLocationsList.get(0);
					request.getSession().setAttribute("selectedLocation", location);*/
				
			
				AverageInventoryBean averageInventoryBeanObj = new AverageInventoryBean();
				averageInventoryBeanObj.setStartDate("");
				averageInventoryBeanObj.setEndDate("");
				averageInventoryBeanObj.setStartIndex("0");
				averageInventoryBeanObj.setRequiredRecords("10");
				averageInventoryBeanObj.setStore_location(workLocationsList.get(0));
				averageInventoryBeanObj.setLocationId(workLocationsList.get(0));
				averageInventoryBeanObj.setFilterBy("");
				averageInventoryBeanObj.setTimeCycle("date");
				AverageInventoryResponse averageInventoryResponseObj = masterServiceObj.getAverageStock(averageInventoryBeanObj,customerIdStr, emailIdStr);
				int start = 1,end = 10;
				if(averageInventoryResponseObj.getReportsList() == null){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(averageInventoryResponseObj.getReportsList().size()<10){
						end = (averageInventoryResponseObj.getReportsList().size());
					}
					modelAndViewObj.addObject("totalRecords", averageInventoryResponseObj.getTotalRecords());
					modelAndViewObj.addObject("index", start);
					modelAndViewObj.addObject("totalValue", end);
				}
//				modelAndViewObj.addObject("filterBy", "category");
				modelAndViewObj.addObject("filterBy", "skuId");
				modelAndViewObj.addObject("filterBy", "skuId");
				modelAndViewObj.addObject("summary", averageInventoryResponseObj.getAverageSummery());
				modelAndViewObj.addObject("averageInventoryValuesList", averageInventoryResponseObj.getReportsList());
				modelAndViewObj.addObject("locationsList", workLocationsList);
				modelAndViewObj.addObject("maxRecords", "10");
				modelAndViewObj.addObject("selectedLocation", "");
				modelAndViewObj.setViewName("Inventory Manager/OutletHealth/avgInventory");
			}catch(Exception e){
				e.printStackTrace();
				modelAndViewObj.setViewName("Inventory Manager/OutletHealth/avgInventory");
			}
			
			return modelAndViewObj;
		}
		
		@RequestMapping(value="/searchAvgStock",method=RequestMethod.POST,consumes="application/json")
		public ModelAndView searchAvgStock(@RequestBody AverageInventoryBean averageInventoryBeanObj,HttpServletRequest request,HttpServletResponse response) {
			String emailIdStr=null,customerIdStr=null;
			try{
				// log.info("searchAvgStock");
				modelAndViewObj = new ModelAndView();
				emailIdStr = (String)request.getSession().getAttribute("emailId");
				customerIdStr = (String)request.getSession().getAttribute("customerId");
				averageInventoryBeanObj.setStore_location(averageInventoryBeanObj.getLocationId());
				//added by manasa
				averageInventoryBeanObj.setMaxRecords(averageInventoryBeanObj.getMaxRecords());
				averageInventoryBeanObj.setRequiredRecords(averageInventoryBeanObj.getMaxRecords());
				List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
					AverageInventoryResponse averageInventoryResponseObj = masterServiceObj.getAverageStock(averageInventoryBeanObj,customerIdStr, emailIdStr);
					request.getSession().setAttribute("selectedLocation", averageInventoryBeanObj.getLocationId());
					int start = 1,end = Integer.parseInt(averageInventoryBeanObj.getMaxRecords());
					if(averageInventoryResponseObj.getReportsList() == null){
						modelAndViewObj.addObject("totalRecords","0");
						modelAndViewObj.addObject("index", "0");
						modelAndViewObj.addObject("totalValue", "0");
					}else{
						if(averageInventoryResponseObj.getReportsList().size()<10){
							end = (averageInventoryResponseObj.getReportsList().size())+(Integer.parseInt(averageInventoryBeanObj.getStartIndex()));
						}else{
							end = (Integer.parseInt(averageInventoryBeanObj.getStartIndex())+end);
						}
					modelAndViewObj.addObject("totalRecords", averageInventoryResponseObj.getTotalRecords());
					modelAndViewObj.addObject("index", (Integer.parseInt(averageInventoryBeanObj.getStartIndex())+start));
					modelAndViewObj.addObject("totalValue", end);
				}
//				modelAndViewObj.addObject("filterBy", averageInventoryBeanObj.getFilterBy());
				modelAndViewObj.addObject("filterBy", "skuId");
				//added by manasa
				modelAndViewObj.addObject("maxRecords", averageInventoryBeanObj.getMaxRecords());
				
				modelAndViewObj.addObject("averageInventoryValuesList", averageInventoryResponseObj.getReportsList());
				modelAndViewObj.addObject("locationsList", workLocationsList);
				modelAndViewObj.setViewName("Inventory Manager/OutletHealth/inventoryReport");
			}catch(Exception e){
				e.printStackTrace();
				modelAndViewObj.setViewName("Inventory Manager/OutletHealth/inventoryReport");
			}
			
			return modelAndViewObj;
		}
	
		
		
		
		
		
		
		




@RequestMapping(value = "/accessDenied")
public ModelAndView accessDenied(HttpServletRequest request,HttpServletResponse response) {
//	BillingService billingServiceObj= new BillingService();
//	Billing billingObj= new Billing();
	try{
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("Inventory Manager/accessdenied");
	}catch(Exception e){
		e.printStackTrace();
	}
	return modelAndViewObj; 
}

@RequestMapping(value = "/fleetMasters")
public ModelAndView fleetMasters(HttpServletRequest request,HttpServletResponse response) {
//	BillingService billingServiceObj= new BillingService();
//	Billing billingObj= new Billing();
	try{
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("Inventory Manager/fleetMaster");
	}catch(Exception e){
		e.printStackTrace();
	}
	return modelAndViewObj;
}


/*@RequestMapping("/searchOrders")
public ModelAndView searchOrders(@RequestParam("searchName") String searchNameStr,@RequestParam("location") String 

location,@RequestParam("status") String status,@RequestParam("index") String index, @RequestParam("type") String type,HttpServletRequest request,HttpServletResponse response) {
	String customerIdStr = null,emailIdStr=null;
	OrderDetails detailsObj= new OrderDetails();
	List<String> locationsList = null;
	try{
		// log.info("searchOrders");
		int start = 1,end = 10;
		customerIdStr = (String)request.getSession().getAttribute("customerId");
		emailIdStr = (String)request.getSession().getAttribute("emailId");
		detailsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr, emailIdStr));
		locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr);
		List<OrderDetails> orderDetails = orderServiceObj.getOrdersByLocation(searchNameStr, "", status, detailsObj, location,index, true);
		modelAndViewObj = new ModelAndView();
		if(location == "" || location == null)
			location = (String) request.getSession().getAttribute("selectedLocation");
		if(location == null && locationsList != null && locationsList.size()>0)
			location = locationsList.get(0);
		modelAndViewObj.addObject("locationsList", locationsList);
		if(orderDetails == null){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(orderDetails.size()<10){
				end = (orderDetails.size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			modelAndViewObj.addObject("totalRecords", orderDetails.get(0).getTotalRecords());
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
		}
		modelAndViewObj.addObject("selectedLocation",location);
		//}
		modelAndViewObj.addObject("searchName", searchNameStr);
		modelAndViewObj.addObject("orderDetails", orderDetails);
		modelAndViewObj.addObject("type",type);
		modelAndViewObj.setViewName("Inventory Manager/Orders/viewOrders");
		
	}catch(Exception e){
		e.printStackTrace();
	}
	return modelAndViewObj;
}
*/

@RequestMapping("/searchOrders")
public ModelAndView searchOrders(@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchNameStr,@RequestParam("location") String 
location,@RequestParam("status") String status,@RequestParam("index") String index, @RequestParam("type") String type, @RequestParam("flowUnder") String flowUnder,@RequestParam("orderChannel") String orderChannel,@RequestParam("orderStartValue") String orderStartValue,
@RequestParam("zoneId") String zoneId,@RequestParam("orderEndValue") String orderEndValue,@RequestParam("deliverySlotStartTime") String deliverySlotStartTime,@RequestParam("deliverySlotEndTime") String deliverySlotEndTime,@RequestParam("file") String file,HttpServletRequest request,HttpServletResponse response) {
	String customerIdStr = null,emailIdStr=null;
	OrderDetails detailsObj= new OrderDetails();
	List<String> locationsList = null;
	List<String> startTimeList =new ArrayList<String>();
	List<String> endTimeList =new ArrayList<String>();
	try{
		// log.info("searchOrders");
		int start = 1,end = Integer.parseInt(maxRecords);
		customerIdStr = (String)request.getSession().getAttribute("customerId");
		emailIdStr = (String)request.getSession().getAttribute("emailId");
//		detailsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr, emailIdStr));
		String flow = "";
		if(type.equals("management")){
			flow = "all";
			locationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr,true);
		}
		else if(flowUnder.equals("outlet")){
			flow = "outlet";
			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
		}
		else{
			flow = "warehouse";
			locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
		}
		
		List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
		
		List<OrderDetails> orderDetails = orderServiceObj.getOrdersByLocations(searchNameStr,"",status,detailsObj,location,index,true,startDate,endDate,maxRecords,flow,true,orderChannel,orderStartValue,orderEndValue,zoneId,file,deliverySlotStartTime,deliverySlotEndTime,zoneList);
//				orderServiceObj.getOrders(searchNameStr,"", status, detailsObj, location,index,startDate,endDate,maxRecords,flow,orderChannel,orderStartValue,orderEndValue);
		
	List<RouteMaster> routeMasterList =genericMasterServiceObj.getRouteMasters(customerIdStr, emailIdStr,0,10,"",false,null,"","","","");
		
		
		if(routeMasterList!=null)													
		{
		for(int i=0;i<routeMasterList.get(0).getRouteList().size();i++){
			
				startTimeList.add(DateUtil.getTimeIn12HoursFormat(routeMasterList.get(0).getRouteList().get(i).getStartTimeStr()));
				endTimeList.add(DateUtil.getTimeIn12HoursFormat(routeMasterList.get(0).getRouteList().get(i).getEndTimeStr()));
		}
		}
		modelAndViewObj = new ModelAndView();
		/*if(location == "" || location == null)
			location = (String) request.getSession().getAttribute("selectedLocation");
		if(location == null && locationsList != null && locationsList.size()>0)
			location = locationsList.get(0);*/
		modelAndViewObj.addObject("locationsList", locationsList);
		if(orderDetails == null || orderDetails.size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(orderDetails.size()<Integer.parseInt(maxRecords)){
				end = (orderDetails.size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			modelAndViewObj.addObject("totalRecords", Integer.parseInt(orderDetails.get(0).getTotalRecords()));
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
		}
		
		modelAndViewObj.addObject("startTimeList",startTimeList);
		modelAndViewObj.addObject("endTimeList",endTimeList);
		modelAndViewObj.addObject("deliverySlotStartTime",deliverySlotStartTime);
		modelAndViewObj.addObject("deliverySlotEndTime",deliverySlotEndTime);
		modelAndViewObj.addObject("selectedLocation",location);
		modelAndViewObj.addObject("zone",zoneId);
		//}
		modelAndViewObj.addObject("searchName", searchNameStr);
		modelAndViewObj.addObject("orderDetails", orderDetails);
		modelAndViewObj.addObject("orderStartValue", orderStartValue);
		modelAndViewObj.addObject("orderEndValue", orderEndValue);
		modelAndViewObj.addObject("orderChannel",orderChannel);
		modelAndViewObj.addObject("startDate", startDate);
		modelAndViewObj.addObject("endDate", endDate);
		modelAndViewObj.addObject("type",type);
		modelAndViewObj.addObject("status",status);
		modelAndViewObj.addObject("maxRecords",Integer.parseInt(maxRecords));
		modelAndViewObj.setViewName("Inventory Manager/Orders/viewOrders");
		
	}catch(Exception e){
		e.printStackTrace();
	}
	modelAndViewObj.addObject("flowUnder",flowUnder);
	return modelAndViewObj;
}



/**
 * @author Viswanath
 * modified by:
 * @param searchName
 * @param index
 * Description: This method is used to search the stock requests.
 */
@RequestMapping("/searchStockRequests")
public ModelAndView searchStockRequests(@RequestParam("subcategory") String subcategory,/*,@RequestParam("saveFlag") boolean saveFlag,*/@RequestParam("brand") String brand,@RequestParam("warehouse") String warehouse,@RequestParam("productCategory") String productCategory,@RequestParam("zone") String zone,@RequestParam("searchName") String searchNameStr,@RequestParam("location") String locationStr,@RequestParam("requestType") String requestType,@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,@RequestParam("maxRecords") String maxRecords,@RequestParam("index") String index,@RequestParam("flowUnder") String flowUnder, @RequestParam("locationList") String locationList,HttpServletRequest request,HttpServletResponse response) {
	String customerIdStr = null,emailIdStr=null;
//	OrderDetails detailsObj= new OrderDetails();
	List<String> locationsList=null;
	List<String> outletlocationsList=null;
	ArrayList<LocationBean> locationBeansList = new ArrayList<LocationBean>();
	try{
		// log.info("searchStockRequests");
		int start = 1,end = Integer.parseInt(maxRecords);
		customerIdStr = (String)request.getSession().getAttribute("customerId");
		emailIdStr = (String)request.getSession().getAttribute("emailId");
		modelAndViewObj = new ModelAndView();
		if(flowUnder.equals("outlet")){
			//outletlocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
		//	locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);	
			

			if(zone == null || zone.trim().equals(""))
				locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			else
				locationBeansList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");
			
			
			
			locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
			modelAndViewObj.addObject("outletlocationsList", locationBeansList);
		}
			
		else{
			outletlocationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr,emailIdStr,true);
			//outletlocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
			modelAndViewObj.addObject("outletlocationsList", outletlocationsList);
		}
			locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
//		detailsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr, emailIdStr));
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,index,"","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			
		
			
			
			
		List<StockRequests> stockRequestsList = stockReceiptServiceObj.getStockRequests(searchNameStr,customerIdStr, emailIdStr, index, "",true,locationStr,startDate,endDate,maxRecords,flowUnder,zone,warehouse,productCategory,subcategory,brand,locationList,requestType) ;
		
		/*if(locationStr == null || "".equals(locationStr)){
			locationStr = (String)request.getSession().getAttribute("selectedLocation");
		}
		if(locationStr == null && locationsList != null && locationsList.size() >0)
			locationStr = locationsList.get(0);*/
		modelAndViewObj.addObject("locationsList", locationsList);
	
		request.getSession().setAttribute("selectedLocation",locationStr);
		if(stockRequestsList == null || stockRequestsList.size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
			modelAndViewObj.addObject("TotalIndents", "0");
			modelAndViewObj.addObject("IndentsOpened","0");
			modelAndViewObj.addObject("TotalIndentQty", "0");
			modelAndViewObj.addObject("TotalOutlets", "0");
		}else{
			if(stockRequestsList.size()<Integer.parseInt(maxRecords)){
				end = (stockRequestsList.size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			
			for(int i= 0;i<stockRequestsList.size();i++ ){
				stockRequestsList.get(i).setNoofitems(stockRequestsList.get(i).getStockRequestItems().size());
			}
			stockRequestsList.get(0).setNoofitems(stockRequestsList.get(0).getNoofitems());
			
			modelAndViewObj.addObject("totalRecords", Integer.parseInt(stockRequestsList.get(0).getTotalRecords()));
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
			modelAndViewObj.addObject("TotalIndents", stockRequestsList.get(0).getTotalIndents());
			modelAndViewObj.addObject("IndentsOpened", stockRequestsList.get(0).getIndentsOpened() );
			modelAndViewObj.addObject("TotalIndentQty",  stockRequestsList.get(0).getTotalIndentQty());
			modelAndViewObj.addObject("TotalOutlets",  stockRequestsList.get(0).getTotalOutlets());
			modelAndViewObj.addObject("statuswiselist",  stockRequestsList.get(0).getStatusWiseQtyList());
		}
		modelAndViewObj.addObject("searchName", searchNameStr);
		modelAndViewObj.addObject("startDate", startDate);
		modelAndViewObj.addObject("endDate", endDate);
		modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
		modelAndViewObj.addObject("stockRequestsList", stockRequestsList);
		modelAndViewObj.addObject("selectedLocation",locationStr);
		modelAndViewObj.addObject("warehouse",warehouse);
		modelAndViewObj.addObject("requestType",requestType);
		modelAndViewObj.addObject("category", productCategory);
		modelAndViewObj.addObject("subcategory", subcategory);
		modelAndViewObj.addObject("brand", brand);
		modelAndViewObj.addObject("zoneList", zoneList);
		modelAndViewObj.addObject("zone",zone);
		modelAndViewObj.setViewName("Inventory Manager/stockRequest/stockRequests");
		
	}catch(Exception e){
		e.printStackTrace();
	}
	modelAndViewObj.addObject("flowUnder",flowUnder);
	return modelAndViewObj;
}
/**
 * @author Viswanath
 * modified by:
 * @param searchName
 * @param index
 * Description: This method is used to search the stock receipts.
 */
@RequestMapping("/searchStockReceipts")
public ModelAndView searchStockReceipts(
		@RequestParam("searchName") String searchNameStr,
		@RequestParam("operation") String operationStr,
		@RequestParam("location") String locationStr,
		@RequestParam("index") String index,
		@RequestParam("startDate") String startDate,
		@RequestParam("endDate") String endDate,
		@RequestParam("maxRecords") String maxRecords,
		@RequestParam("flowUnder") String flowUnder,
		@RequestParam("locationList") String locationList,
		@RequestParam("zone") String zone,HttpServletRequest request,HttpServletResponse response) {
	String customerIdStr = null,emailIdStr=null;
	List<StockReciept> stockReceiptDetailsList = null;
	List<String> locationsList=null;
	ArrayList<LocationBean> locationBeansList = new ArrayList<LocationBean>();
	try{
		// log.info("searchStockReceipts");
		int start = 1,end = Integer.parseInt(maxRecords);
		customerIdStr = (String)request.getSession().getAttribute("customerId");
		emailIdStr = (String)request.getSession().getAttribute("emailId");
		if(flowUnder.equals("outlet")){
		//	locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			//locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);	

			if(zone == null || zone.trim().equals(""))
				locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			else
				locationBeansList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");
			
			
			
			
			
			
		}else
			locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","Warehouse",false,false,true);
//			locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
		stockReceiptDetailsList = stockReceiptServiceObj.getStockReceiptsByLocation(searchNameStr,customerIdStr, emailIdStr, locationStr, operationStr, index,startDate,endDate,maxRecords,flowUnder,locationList);
		modelAndViewObj = new ModelAndView();
		if(flowUnder.equals("outlet"))
		modelAndViewObj.addObject("locationsList", locationBeansList);
		else
		modelAndViewObj.addObject("locationsList", locationBeansList);	
		if(locationStr != null && !locationStr.equals(""))
			request.getSession().setAttribute("selectedLocation",locationStr);
		if(stockReceiptDetailsList == null || stockReceiptDetailsList.size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(stockReceiptDetailsList.size()<Integer.parseInt(maxRecords)){
				end = (stockReceiptDetailsList.size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			modelAndViewObj.addObject("totalRecords", Integer.parseInt(stockReceiptDetailsList.get(0).getTotalRecords()));
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
		}
		modelAndViewObj.addObject("searchName", searchNameStr);
		modelAndViewObj.addObject("operation",operationStr);
		modelAndViewObj.addObject("startDate", startDate);
		modelAndViewObj.addObject("endDate", endDate);
		modelAndViewObj.addObject("flowUnder", flowUnder);
		modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
		modelAndViewObj.addObject("stockReceiptDetailsList",stockReceiptDetailsList);
		modelAndViewObj.addObject("selectedLocation",locationStr);
		modelAndViewObj.addObject("zone",zone);
		modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allstockreceipts");
		
	}catch(Exception e){
		e.printStackTrace();
	}
	return modelAndViewObj;
}


/**
 * @author Viswanath
 * modified by:
 * @param searchName
 * @param index
 * Description: This method is used to search the stock Issues.
 */
@RequestMapping("/searchStockIssues")
public ModelAndView searchStockIssues(@RequestParam("warehouse") String warehouse,@RequestParam("itemwise") String itemwise,@RequestParam("itemname") String itemname,@RequestParam("zone") String zone,@RequestParam("searchName") String searchNameStr,@RequestParam("operation") String operationStr,@RequestParam("location") String locationStr,@RequestParam("index") String index,@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,@RequestParam("maxRecords") String maxRecords, @RequestParam("flowUnder") String flowUnder,@RequestParam("locationList") String locationList,HttpServletRequest request,HttpServletResponse response) {
	String customerIdStr = null,emailIdStr=null;
	List<StockIssues> stockIssueDetailsList = null;
	List<String> locationsList=null;
	ArrayList<LocationBean> locationBeansList = new ArrayList<LocationBean>();
	List<String> warehouselocationsList =null;
	String filePath;
	try{
		// log.info("searchStockIssues");
		int start = 1,end = Integer.parseInt(maxRecords);
		customerIdStr = (String)request.getSession().getAttribute("customerId");
		emailIdStr = (String)request.getSession().getAttribute("emailId");
		modelAndViewObj = new ModelAndView();
		if(flowUnder.equals("outlet")){
//			locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);	
		//	locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			

			if(zone == null || zone.trim().equals(""))
				locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			else
				locationBeansList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");
			
			
			
			modelAndViewObj.addObject("locationsList", locationBeansList);
		}
			else
			{
//			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
				locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
				warehouselocationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
			modelAndViewObj.addObject("locationsList", locationBeansList);
			}
			//
		stockIssueDetailsList = stockIssueServiceObj.getStockIssuesByLocation(searchNameStr,customerIdStr, emailIdStr, locationStr, operationStr, index,startDate,endDate,maxRecords,flowUnder,zone,itemwise,warehouse,locationList);
	
		/*if(locationStr == null || "".equals(locationStr)){
			locationStr = (String)request.getSession().getAttribute("selectedLocation");
		}
		if(locationStr == null && locationsList != null && locationsList.size() >0)
			locationStr = locationsList.get(0);*/
		
		if(locationStr == null || "".equals(locationStr))
			request.getSession().setAttribute("selectedLocation",locationStr);
		if(stockIssueDetailsList == null || stockIssueDetailsList.size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
			filePath ="";
		}else{
			if(stockIssueDetailsList.size()<Integer.parseInt(maxRecords)){
				end = (stockIssueDetailsList.size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			modelAndViewObj.addObject("totalRecords", Integer.parseInt(stockIssueDetailsList.get(0).getTotalRecords()));
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
			filePath = stockIssueDetailsList.get(0).getPickListURL();
		}
		modelAndViewObj.addObject("filePath", filePath);
		modelAndViewObj.addObject("searchName", searchNameStr);
		modelAndViewObj.addObject("operation",operationStr);
		modelAndViewObj.addObject("startDate", startDate);
		modelAndViewObj.addObject("endDate", endDate);
		modelAndViewObj.addObject("warehouse", warehouse);
		modelAndViewObj.addObject("zone", zone);
		modelAndViewObj.addObject("itemwise", itemwise);
		modelAndViewObj.addObject("itemname", itemname);
		modelAndViewObj.addObject("warehouselocationsList", warehouselocationsList);
		modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
		modelAndViewObj.addObject("stockIssueDetailsList",stockIssueDetailsList);
		modelAndViewObj.addObject("selectedLocation",locationStr);
		modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allissuedstocks");
		
	}catch(Exception e){
		e.printStackTrace();
	}
	modelAndViewObj.addObject("flowUnder", flowUnder);
	return modelAndViewObj;
}



/*@RequestMapping("/viewInvoicing")
public ModelAndView viewInvoicing(@RequestParam("index")String index,HttpServletRequest request,HttpServletResponse response) {
	try{
		// log.info("viewInvoicing");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("totalRecords","0");
		modelAndViewObj.addObject("index", "0");
		modelAndViewObj.addObject("totalValue", "0");
		modelAndViewObj.setViewName("Inventory Manager/warehouse/shipments/invoices");
	}catch(Exception e){
	  e.printStackTrace();	
	}
	return modelAndViewObj;
}*/




@RequestMapping("/newstockverification")
public ModelAndView newstockverification(@RequestParam("flowUnder")String flowUnder,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("newstockverification");
		modelAndViewObj = new ModelAndView();
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		
		List<String> locationsList = null;
		List<String> brandsList = adminServiceObj.getBrandNamesList("","");
		if(flowUnder.equals("outlet"))
		 locationsList = adminServiceObj.getOutletLocationsList("","",true);
		else
		 locationsList = adminServiceObj.getWarehouseLocationsList("", "", true);
		
		List<Group> groupsList = outletMasterServiceObj.getProductGroupDetails("",customerIdStr,emailIdStr,"-1","",true);
		if(groupsList != null && groupsList.size()>0){
		modelAndViewObj.addObject("groupsList", groupsList);
		}
		
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("brandsList", brandsList);
		modelAndViewObj.addObject("flowUnder",flowUnder);
		modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/newstockverification");
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}

@RequestMapping(value="/createstockverification",method = RequestMethod.POST, consumes = "application/json")
public ModelAndView createstockverification(@RequestBody StoreStockVerificationMaster finalobj, HttpServletRequest request,HttpServletResponse response)
{
	String customerIdStr=null,emailIdStr=null;
	try{
		customerIdStr = (String)request.getSession().getAttribute("customerId");
		emailIdStr = (String)request.getSession().getAttribute("emailId");
		// log.info("createstockverification");
		modelAndViewObj = new ModelAndView();
		List<Group> groupsList = outletMasterServiceObj.getProductGroupDetails("",customerIdStr,emailIdStr,"-1","",true);
		if(groupsList != null && groupsList.size()>0){
		modelAndViewObj.addObject("groupsList", groupsList);
		}
		String resultStr=storeStockVerificationServiceObj.createStockVerification(finalobj);
		List<String> locationsList= null;
		modelAndViewObj.addObject("location",finalobj.getLocation());
/*	List<String> brandsList = adminServiceObj.getBrandNamesList("","");
	
		modelAndViewObj.addObject("brandsList", brandsList);*/
		
		if(finalobj.getFlowUnder().equals("outlet"))
			 locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			else
			 locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr,emailIdStr, true);
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("startdate",finalobj.getStartDateStr());
		modelAndViewObj.addObject("enddate",finalobj.getEndDateStr());
		modelAndViewObj.addObject("approvedBy",finalobj.getApprovedBy());
		modelAndViewObj.addObject("flowUnder",finalobj.getFlowUnder());
		modelAndViewObj.addObject("maxRecords",finalobj.getMaxRecords());
		//modelAndViewObj.addObject("flowUnder",flowUnder);
		if(resultStr.equals(AppProperties.getAppMessageByProperty("STOCK_VERIFICATION_CREATION_SUCCESS").trim())){
			modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/newstockverification");
		}
		else if(resultStr.equals(AppProperties.getAppMessageByProperty("STOCK_VERIFICATION_UPDATE_SUCCESS").trim())){
			modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.addObject("verification_code", finalobj.getVerification_code());
//			modelAndViewObj.addObject("verification_code", finalobj.getVerification_code());
			modelAndViewObj.addObject("storeStockVerificationObj", finalobj);
			modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/newstockverification");
		}
		else{
			// log.info("error");
			modelAndViewObj.addObject("err", resultStr);
//			modelAndViewObj.addObject("verification_code", finalobj.getVerification_code());
			modelAndViewObj.addObject("storeStockVerificationObj", finalobj);
			modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/newstockverification");
//			modelAndViewObj.addObject("success", resultStr);
//			modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/newstockverification");
		}
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}


/**
 * @author Manasa
 *  Created On: 3-april-2017
 * @param flowunder verificationCode, Request, Response
 * Description: This method is used to view stockverificationMaster .
 *  @return ModelAndView with stock verification master details
 */


@RequestMapping("/viewEditWarehouseStockVerification")
public ModelAndView viewEditWarehouseStockVerification(@RequestParam("maxRecords") String maxRecords,@RequestParam("type") String type,@RequestParam("flowUnder") String flowUnder,@RequestParam("verificationCode") String verificationCode,HttpServletRequest request,HttpServletResponse response){
	List<String> locationsList=null;
	try{
		// log.info("viewEditWarehouseStockVerification");
		StoreStockVerificationMaster stockVerificationMaster = new StoreStockVerificationMaster();
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		modelAndViewObj = new ModelAndView();
		List<Group> groupsList = outletMasterServiceObj.getProductGroupDetails("",customerIdStr,emailIdStr,"-1","",true);
		if(groupsList != null && groupsList.size()>0){
		modelAndViewObj.addObject("groupsList", groupsList);
		}
		Verification  whstockverifiObj = storeStockVerificationServiceObj.getWarehouseStockVerificationMaster(customerIdStr,emailIdStr,verificationCode,"0",flowUnder);
		if(flowUnder.equals("outlet"))
		{
			modelAndViewObj.addObject("whstockverifiObj",whstockverifiObj.getVerificationMasterObj());
			if(whstockverifiObj.getVerificationMasterObj().getVerificationStartDateStr()!=null)
			whstockverifiObj.setStartTime(whstockverifiObj.getVerificationMasterObj().getVerificationStartDateStr().substring(0,10));
			List<String> featureIds = new ArrayList<String>();
			if(whstockverifiObj.getVerificationMasterObj().getSpecDays().length()>0)
			{
				String[] groups = whstockverifiObj.getVerificationMasterObj().getSpecDays().split(",");
				for(int i=0;i<groups.length;i++)
					featureIds.add(groups[i]);
				
			}
			if(featureIds.size()>0)
				modelAndViewObj.addObject("featureIds",featureIds);
		}
		else{
			modelAndViewObj.addObject("whstockverifiObj",whstockverifiObj.getMasterObj());
			if(whstockverifiObj.getMasterObj().getVerificationStartDateStr()!=null)
			whstockverifiObj.setStartTime(whstockverifiObj.getMasterObj().getVerificationStartDateStr().substring(0,10));	
		}
		
		
		/*
		locationsList = adminServiceObj.getWarehouseLocationsList("","",true);
		List<String> brandsList = adminServiceObj.getBrandNamesList("","");
		modelAndViewObj.addObject("locationsList", locationsList);
		
		modelAndViewObj.addObject("brandsList", brandsList);*/
		modelAndViewObj.addObject("flowUnder", flowUnder);
		modelAndViewObj.addObject("maxRecords", maxRecords);
	
		if(type.equals("edit"))
		modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/viewstockVerificationMaster");
		else
			modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/viewverificationmaster");	
	}
		catch(Exception exception){
			exception.printStackTrace();
		}
		
		return modelAndViewObj;
		
	
}



/**
 * @author Vijay
 * @createdon : 15-11-2017 
 * @param: customerId,emailid,modeofPayment	
 * @description: This method is used to update mode-of-payment in the bills transactions
 * @reviewedBy: 
 * @reviewDate:
*/

@RequestMapping(value="/updateBillTransaction",method=RequestMethod.POST)
public @ResponseBody ModelAndView updateBillTransaction(@RequestParam("modeofPayment") String modeofPayment,
		@RequestParam("transactionList") String transactionList,
		@RequestParam("billId") String billId,
		@RequestParam("flow") String flow,
		@RequestParam("criteria") String criteria,
		@RequestParam("status") String status,
		@RequestParam("maxRecords") String maxRecords,
		@RequestParam("type") String type,
		@RequestParam("typePay") String typePay,
		@RequestParam("paidAmount") String paidAmount,
		@RequestParam("tenderCode") String tenderCode,
		HttpServletRequest request,HttpServletResponse response){

	try {
		// log.info("InventoryManagerController - updateTranactionBill()");
		Billing billDetails = new Billing();
		Billing billingBean =  new Billing();
		Set<String> tenders = new LinkedHashSet<String>();
		//////////System.out.println(transactionList);
		String customerIdStr = request.getSession().getAttribute("customerId").toString();
		String emailIdStr = request.getSession().getAttribute("emailId").toString();
		modelAndViewObj = new ModelAndView();
		String resultStr = billServiceObj.updateBillTransaction(customerIdStr , emailIdStr, billId, modeofPayment,transactionList,paidAmount,tenderCode);
		if (!resultStr.equals(AppProperties.getAppMessageByProperty("BILL_UPDATED_SUCCESSFULLY").trim())) {
			billDetails.setStartIndex(Constants.PAGINATION_START_INDEX);
			billDetails.setBillId(billId);
			billingBean = billServiceObj.getBillDetails(billDetails);
			modelAndViewObj.addObject("err", resultStr);
		} 
		else {
			billDetails.setStartIndex(Constants.PAGINATION_START_INDEX);
			billDetails.setBillId(billId);
			billingBean = billServiceObj.getBillDetails(billDetails);
			modelAndViewObj.addObject("success", resultStr);

		}
		
ArrayList<TenderMaster> tenderDetails = genericMasterServiceObj.getTender("",customerIdStr,emailIdStr,"-1",100);
		
		for(int i=0;i<tenderDetails.size();i++)
		{
			tenders.add(tenderDetails.get(i).getModeOfPayment());
		}
		
		request.getSession().setAttribute("reportList", billingBean);
		modelAndViewObj.addObject("billDetails", billingBean);
		modelAndViewObj.addObject("billId", billId);
		modelAndViewObj.addObject("flow", flow);
		modelAndViewObj.addObject("criteria", criteria);
		modelAndViewObj.addObject("status",status);
		modelAndViewObj.addObject("tenderDetails",tenderDetails);
		modelAndViewObj.addObject("type",type);
//		////////System.out.println(type);
		modelAndViewObj.addObject("maxRecords",maxRecords);
		modelAndViewObj.addObject("transaction","transaction");
		modelAndViewObj.setViewName("Inventory Manager/Billing/billdetails");

	} catch (Exception e) {
		e.printStackTrace();
		modelAndViewObj.addObject("flow", flow);
		modelAndViewObj.addObject("criteria", criteria);
		modelAndViewObj.setViewName("Inventory Manager/Billing/billdetails");
	}
	return modelAndViewObj;

}

/**
 * @author Manasa
 * @createdon : 22-11-2017 
 * @param: form object	
 * @purpose: This method is used to write off  verification 
 * @reviewedBy: 
 * @reviewDate:
 
*/

@RequestMapping(value="/writeOffStockVerification",method = RequestMethod.POST, consumes = "application/json")
public ModelAndView writeOffStockVerification(@RequestBody StoreStockVerificationBean finalobj, HttpServletRequest request,HttpServletResponse response)
{
	StoreStockVerification verificationObj=null;
	WareHouseStockVerification verificationObjWarehouse = null;
	try{
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr  = (String)request.getSession().getAttribute("emailId");
		// log.info("createstockverification");
		modelAndViewObj = new ModelAndView();
		String resultStr=storeStockVerificationServiceObj.writeOffstockverification(finalobj);
		/*
		 * List<String> locationsList= null;
		 * modelAndViewObj.addObject("location",finalobj.getLocation());
		 * if(finalobj.getFlowUnder() == "outlet" ||
		 * finalobj.getFlowUnder().equals("outlet")){ locationsList =
		 * adminServiceObj.getOutletLocationsList("","",true); verificationObj =
		 * storeStockVerificationServiceObj.getProductDetails(customerIdStr,emailIdStr,
		 * finalobj.getVerification_code(),"0","10");
		 * modelAndViewObj.addObject("productStockOpenVerificationDetailsList",
		 * verificationObj.getStockVerificationObj()); }else{ locationsList =
		 * adminServiceObj.getWarehouseLocationsList("","",true);
		 * verificationObjWarehouse =
		 * storeStockVerificationServiceObj.getProductDetailsWarehouse(customerIdStr,
		 * emailIdStr,finalobj.getVerification_code(),"0","10");
		 * modelAndViewObj.addObject("productStockOpenVerificationDetailsList",
		 * verificationObjWarehouse.getVerificationList().get(0));
		 * 
		 * } modelAndViewObj.addObject("locationsList", locationsList);
		 * 
		 * modelAndViewObj.addObject("startTimeStr", finalobj.getStartTimeStr());
		 * modelAndViewObj.addObject("endTimeStr", finalobj.getEndTimeStr());
		 * modelAndViewObj.addObject("verifiedOnStr", finalobj.getVerified_on());
		 * //modelAndViewObj.addObject("verifiedUptoStr", verifiedUptoStr);
		 * 
		 * modelAndViewObj.addObject("flowUnder", finalobj.getFlowUnder());
		 * modelAndViewObj.addObject("verified_by", finalobj.getVerified_by());
		 * modelAndViewObj.addObject("verificationCode",finalobj.getVerification_code())
		 * ; modelAndViewObj.addObject("verifiedOnStr", finalobj.getVerifiedDateStr());
		 * modelAndViewObj.addObject("verifiedUptoStr", finalobj.getUpdatedOnStr());
		 * 
		 * if(!resultStr.equals(AppProperties.getAppMessageByProperty(
		 * "VERIFICATION_UPDATED_SUCCESSFULLY").trim())){
		 * modelAndViewObj.addObject("err", resultStr); modelAndViewObj.
		 * setViewName("Inventory Manager/warehouse/stockVerification/editWriteoffStockVerificationReport"
		 * ); }else{ // log.info("successed"); modelAndViewObj.addObject("success",
		 * resultStr); modelAndViewObj.
		 * setViewName("Inventory Manager/warehouse/stockVerification/editWriteoffStockVerificationReport"
		 * ); }
		 */
		
		List<String> locationsList = null;
		List<WareHouseStockVerification> stockVerificationDetailsList = null;
		//List<String> locationsList = null;
		List<String> warehouselocationsList = null;
		
			// log.info("viewStockVerificationReport");
			int start = 1,end = Integer.parseInt("10");
	
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"0","","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			List<Department> departmentList =(List<Department>)request.getSession().getAttribute("departmentList");
			if(departmentList==null || departmentList.size()==0 || departmentList.isEmpty()){
				departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerIdStr, emailIdStr,"0",false);
				request.getSession().setAttribute("departmentList", departmentList);
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

			stockVerificationDetailsList = new ArrayList<WareHouseStockVerification>();
			if(finalobj.getFlowUnder().equals("outlet")){
				stockVerificationDetailsList = storeStockVerificationServiceObj.getProductVerificationReport(customerIdStr,emailIdStr,"","","0","","","10","outlet","","","","","");
				locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
				}
				else{
					stockVerificationDetailsList = storeStockVerificationServiceObj.getProductVerificationReport(customerIdStr,emailIdStr,"","","0","","","10","","","","","","");
					locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
				}
				
			
			modelAndViewObj = new ModelAndView();
			
			modelAndViewObj.addObject("locationsList", locationsList);

			if(stockVerificationDetailsList == null || stockVerificationDetailsList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}
			else{
				if(stockVerificationDetailsList.size()<Integer.parseInt("10")){
					end = (stockVerificationDetailsList.size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(stockVerificationDetailsList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}

			modelAndViewObj.addObject("maxRecords", Integer.parseInt("10"));
			modelAndViewObj.addObject("flowUnder", finalobj.getFlowUnder());
			
			modelAndViewObj.addObject("StockVerificationDetailsList",stockVerificationDetailsList);
			modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/stockVerificationReport");
		
	}catch(Exception exception){
		modelAndViewObj.addObject("err",Utilities.getResponseCode("CONTACT_ADMIN"));
		modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/allverifiedproductstocks");
		exception.printStackTrace();
	}
	return modelAndViewObj;
}


/**
 * 
 * @author chaithanya.v
 * Created On: 2-nov-2015
 * 
 *This method is used to display the newStockRequest form
 *
 **/
@RequestMapping("/getstockRequestSummary")
public ModelAndView getstockRequestSummary(@RequestParam("locationList") String locationList,@RequestParam("flowUnder") String flowUnder,@RequestParam("warehouse") String warehouse,@RequestParam("zone") String zone,@RequestParam("location") String locationStr,@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("viewStockRequestDetails");
		modelAndViewObj = new ModelAndView();
		StockRequestSummaryResponse stockRequestsList = stockReceiptServiceObj.getstockRequestSummary(flowUnder,warehouse,locationStr,zone,startDate,endDate,locationList);
		/*modelAndViewObj.addObject("workLocationsList", workLocationsList);
		modelAndViewObj.addObject("warehouseList", warehouseLocationsList);*/
		modelAndViewObj.addObject("stockRequestsList", stockRequestsList);
		modelAndViewObj.setViewName("Inventory Manager/stockRequest/stockRequestsummary");
	}catch(Exception exception){
		exception.printStackTrace();
	}
	modelAndViewObj.addObject("flowUnder",flowUnder);
	return modelAndViewObj;
}

/**
 * 
 * @author chaithanya.v
 * Created On: 2-nov-2015
 * 
 *This method is used to display the newStockRequest form
 *
 **/
@RequestMapping("/createprovisionalPo")
public ModelAndView createprovisionalPo(@RequestParam("ids") String ids,@RequestParam("flowUnder") String flowUnder,@RequestParam("status") Boolean status,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("viewStockRequestDetails");
		modelAndViewObj = new ModelAndView();
		StockRequestSummaryResponse stockRequestsList = stockReceiptServiceObj.createprovisionalPo(flowUnder,status,ids);
		modelAndViewObj.addObject("stockRequestsList", stockRequestsList);
		modelAndViewObj.setViewName("Inventory Manager/stockRequest/stockRequestsummary");
	}catch(Exception exception){
		exception.printStackTrace();
	}
	modelAndViewObj.addObject("flowUnder","warehouse");
	return modelAndViewObj;
}
/**
 * 
 * @author chaithanya.v
 * Created On: 2-nov-2015
 * 
 *This method is used to display the newStockRequest form
 *
 **/
@RequestMapping("/generateIndents")
public ModelAndView generateIndents(@RequestParam("ids") String ids,@RequestParam("flowUnder") String flowUnder,@RequestParam("indentCategory") String indentCategory,@RequestParam("Tolocation") String Tolocation,@RequestParam("startDate") String startDate,
		@RequestParam("endDate") String endDate,@RequestParam("requestType") String requestType,@RequestParam("select") String select,HttpServletRequest request,HttpServletResponse response){
	List<String> locationslist = null;
	List<String> locationsList = null;
	List<String> outletlocationsList = null;
	ArrayList<LocationBean> locationBeansList = null;
	String locationListAll="";
	/*String resultStr = null;*/
	try{
		List<String> locationsListValue =new ArrayList<String>();
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		// log.info("viewStockRequestDetails");
		modelAndViewObj = new ModelAndView();
		StockRequestSummaryResponse stockRequestsList = stockReceiptServiceObj.generateIndents(flowUnder,ids,indentCategory,startDate,endDate,Tolocation,select);
		/*if(stockRequestsList.getResponseHeader().getResponseCode().equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			modelAndViewObj.addObject("success",stockRequestsList.getResponseHeader().getResponseMessage());
		}else{
			modelAndViewObj.addObject("err",stockRequestsList.getResponseHeader().getResponseMessage());
		}*/
		if(flowUnder.equals("outlet")){
			//outletlocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);	
			locationslist = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);	
			/*if((location.trim()).equals(null) || location.trim().isEmpty())
			{
				location = locationBeansList.get(0).getLocationId();
			}*/
			if(Tolocation.equals("all")|| Tolocation.equals("")){
				if(locationBeansList != null){
					for(int i=0;i<locationBeansList.size();i++){
					locationsListValue.add(locationBeansList.get(i).getLocationId());	
				}
				for (String string : locationsListValue) {
					
					locationListAll = locationListAll+string+",";
				}
				}
			}

			modelAndViewObj.addObject("outletlocationsList", locationBeansList);
		
		}else{
			//outletlocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			outletlocationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr,emailIdStr,true);
			locationslist = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
			if((Tolocation.trim()).equals(null) || Tolocation.trim().isEmpty())
			{
				Tolocation = locationslist.get(0);
			}
			modelAndViewObj.addObject("outletlocationsList", outletlocationsList);
		}
	
		/*if(!resultStr.equals((Constants.RESPONSE_SUCCESS_CODE).trim())){
			modelAndViewObj.addObject("err", resultStr);
		}else{
			modelAndViewObj.addObject("succcess", resultStr);
		}*/
		/*modelAndViewObj.addObject("workLocationsList", workLocationsList);
		modelAndViewObj.addObject("warehouseList", warehouseLocationsList);*/
	/*	modelAndViewObj.addObject("warehouseList", locationsList);*/
		modelAndViewObj.addObject("warehouseList", locationsList);
		modelAndViewObj.addObject("selectedLocation",Tolocation);
		modelAndViewObj.addObject("stockRequestsList", stockRequestsList);
		modelAndViewObj.addObject("indentCategory",indentCategory);
		modelAndViewObj.addObject("Tolocation",Tolocation);
		
		modelAndViewObj.addObject("requestType",requestType);
		modelAndViewObj.addObject("select",select);
		modelAndViewObj.addObject("startDate",startDate);
		modelAndViewObj.addObject("endDate",endDate);
		
		modelAndViewObj.setViewName("Inventory Manager/stockRequest/stockRequestsummary");
	}catch(Exception exception){
		exception.printStackTrace();
	}
	modelAndViewObj.addObject("flowUnder","warehouse");
	return modelAndViewObj;
}
/**
 * 
 * @author chaithanya.v
 * Created On: 2-nov-2015
 * 
 *This method is used to display the newStockRequest form
 *
 **/
@RequestMapping("/openedIndents")
public ModelAndView openedIndents(@RequestParam("flowUnder") String flowUnder,@RequestParam("location")String location,HttpServletRequest request,HttpServletResponse response){
	List<String> locationslist = null;
	List<String> locationsList = null;
	List<String> outletlocationsList = null;
	ArrayList<LocationBean> locationBeansList = null;
	String locationListAll="";
	try{
		// log.info("viewStockRequestDetails");
		modelAndViewObj = new ModelAndView();
		List<String> locationsListValue =new ArrayList<String>();
		// log.info("viewStockRequest ");
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
		StockRequestSummaryResponse stockRequestsList = stockReceiptServiceObj.openedIndents(flowUnder);
		if(flowUnder.equals("outlet")){
			//outletlocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);	
			locationslist = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);	
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

			modelAndViewObj.addObject("outletlocationsList", locationBeansList);
		
		}
		
		else
		{
			//outletlocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			outletlocationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr,emailIdStr,true);
			locationslist = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
			if((location.trim()).equals(null) || location.trim().isEmpty())
			{
				location = locationslist.get(0);
			}
			modelAndViewObj.addObject("outletlocationsList", outletlocationsList);
		}
		modelAndViewObj.addObject("warehouseList", locationsList);
		modelAndViewObj.addObject("selectedLocation",location);
		modelAndViewObj.addObject("stockRequestsList", stockRequestsList);
		modelAndViewObj.addObject("Tolocation", location);
		modelAndViewObj.setViewName("Inventory Manager/stockRequest/stockRequestsummary");
	}catch(Exception exception){
		exception.printStackTrace();
	}
	modelAndViewObj.addObject("flowUnder","warehouse");
	return modelAndViewObj;
}
/**
 * 
 * @author chaithanya.v
 * Created On: 2-nov-2015
 * 
 *This method is used to display the newStockRequest form
 *
 **/
@RequestMapping("/getstockIssueSummary")
public ModelAndView getstockIssueSummary(@RequestParam("flowUnder") String flowUnder,@RequestParam("warehouse") String warehouse,@RequestParam("itemwise") String itemwise,@RequestParam("itemname") String itemname,@RequestParam("zone") String zone,@RequestParam("location") String locationStr,@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("viewStockRequestDetails");
		modelAndViewObj = new ModelAndView();
		StockRequestSummaryResponse stockRequestsList = stockReceiptServiceObj.getstockIssueSummary(flowUnder,warehouse,itemwise,startDate,endDate,locationStr);
		/*modelAndViewObj.addObject("workLocationsList", workLocationsList);
		modelAndViewObj.addObject("warehouseList", warehouseLocationsList);*/
		modelAndViewObj.addObject("stockRequestsList", stockRequestsList);
		modelAndViewObj.setViewName("Inventory Manager/retailoutlets/stockIssuesummary");
	}catch(Exception exception){
		exception.printStackTrace();
	}
	modelAndViewObj.addObject("flowUnder",flowUnder);
	return modelAndViewObj;
}
/*chaithanya
*/
@RequestMapping(value="/updateStockRequests",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView updateStockRequests(@RequestBody StockRequests stockRequestObj,HttpServletRequest request,HttpServletResponse response)
	{
	String customerIdStr=null,emailIdStr=null,resultStr =null;
	//////////System.out.println("updatestockreq");
	try{
	// log.info("Update Stock Request Details");
	customerIdStr = (String)request.getSession().getAttribute("customerId");
	emailIdStr  = (String)request.getSession().getAttribute("emailId");
	
	
	List<String> locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,false);
	List<String> outletlocations = adminServiceObj.getOutletLocationsList(customerIdStr, emailIdStr, false);
	
	if(stockRequestObj.getSid().size()>0 && stockRequestObj.getQty().size()>0 ){
		List<String> skuid = stockRequestObj.getSid();
		List<String> Qty = stockRequestObj.getQty();
		if(request.getSession().getAttribute("warehouseStockRequest")!= null)
		{
			List<StockRequests>	srlist =(List<StockRequests>)request.getSession().getAttribute("warehouseStockRequest");
			for(int i=0;i<srlist.size();i++){
				if(srlist.get(i).getStockRequestId().equalsIgnoreCase(stockRequestObj.getStockRequestId())){
					stockRequestObj = srlist.get(i);
					for(int j=0;j<stockRequestObj.getStockRequestItems().size();j++){
						for(int k=0;k<skuid.size();k++)
						if(stockRequestObj.getStockRequestItems().get(j).getSkuId().equalsIgnoreCase(skuid.get(k))){
							StockRequestItems items = stockRequestObj.getStockRequestItems().get(j);
							BigDecimal bd=new BigDecimal(Qty.get(k));
							items.setApprovedQty(bd);
							stockRequestObj.getStockRequestItems().set(j, items);
						}
							
							
					}
				}
			}
			resultStr = stockReceiptServiceObj.updateStockRequest(stockRequestObj,customerIdStr,emailIdStr);
		}
		
	}else{
		resultStr = stockReceiptServiceObj.updateStockRequest(stockRequestObj,customerIdStr,emailIdStr);
		
		
		List<StockRequests> stockRequestsList = stockReceiptServiceObj.getStockRequests("",customerIdStr, emailIdStr,"0", stockRequestObj.getStockRequestId(),false,"","","","10",stockRequestObj.getFlowUnder(),"","","","","","","");
		modelAndViewObj = new ModelAndView();
		if(!resultStr.equals(AppProperties.getAppMessageByProperty("STOCK_REQUEST_UPDATE_SUCCESS").trim())){
			modelAndViewObj.addObject("err", resultStr);
		}else{
			modelAndViewObj.addObject("success", resultStr);
			
		}
		
		modelAndViewObj.addObject("stockRequestsObj",stockRequestsList.get(0));
		modelAndViewObj.addObject("type", "edit");
		modelAndViewObj.addObject("outletlocationsList", outletlocations);
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.setViewName("Inventory Manager/stockRequest/editStockRequest");
	
		
	}
	

}catch(Exception e){
	e.printStackTrace();
}
return modelAndViewObj;
}


/*manasa
*/


@RequestMapping("/viewoutletUserLog")
public ModelAndView viewoutletUserLog(@RequestParam("startIndex") String startIndex,
		@RequestParam("maxRecords") String maxRecords, 
		@RequestParam("location") String location,
		@RequestParam("zone") String zone,
		@RequestParam("startDate") String startDate,
		@RequestParam("endDate") String endDate,
		@RequestParam("searchCriteria") String searchCriteria,
		@RequestParam("emailId") String emailId,
		@RequestParam("appName") String appName,
		HttpServletRequest request,HttpServletResponse response){
    String customerIdStr=null,emailIdStr = null;
	try{
		int start = 1,  end = Integer.parseInt(maxRecords);
		customerIdStr = (String)request.getSession().getAttribute("customerId");
		emailIdStr  = (String)request.getSession().getAttribute("emailId");
		// log.info("peoplemonitoring ");
		modelAndViewObj = new ModelAndView();
		List<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
		List<EmployeeBean> employeeList = genericMasterServiceObj.getEmployees("",customerIdStr, emailIdStr,"-1","","",false,"");
		if(employeeList != null && employeeList.size()>0)
			modelAndViewObj.addObject("employeeList",employeeList);
		
		if(locationsList != null && locationsList.size()>0)
			modelAndViewObj.addObject("locationsList",locationsList);
		List<UserLog> userlogdetails = outletMasterServiceObj.getOutletUserLog(startIndex,maxRecords,location,zone,startDate,endDate,searchCriteria,emailId,appName);
		
		if(userlogdetails == null){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(userlogdetails.size()<Integer.parseInt(maxRecords)){
				end = (userlogdetails.size())+(Integer.parseInt(startIndex));
			}else{
				end = (Integer.parseInt(startIndex)+end);
			}
			modelAndViewObj.addObject("totalRecords",userlogdetails.get(0).getTotalRecords());
			modelAndViewObj.addObject("index", (Integer.parseInt(startIndex)+start));
			modelAndViewObj.addObject("totalValue", end);
		}
		
		modelAndViewObj.addObject("userlogdetails", userlogdetails);
		modelAndViewObj.addObject("startDate", startDate);
		modelAndViewObj.addObject("endDate", endDate);
		modelAndViewObj.addObject("searchName", searchCriteria);
		modelAndViewObj.addObject("selectedLocation", location);
		modelAndViewObj.addObject("selectedEmployee", emailId);
		modelAndViewObj.addObject("selectedApp", appName);
		modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
		modelAndViewObj.setViewName("monitoring/viewoutletUserLog");
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}

/*manasa
*/
@RequestMapping("/viewoutletNewSynchStatus")
	public ModelAndView viewoutletNewSynchStatus(
			@RequestParam("startIndex") String startIndex,
			@RequestParam("maxRecords") String maxRecords, 
			@RequestParam("location") String location,
			HttpServletRequest request,HttpServletResponse response){
	String customerIdStr=null,emailIdStr=null;
		try{
			// log.info("peoplemonitoring ");
			int start = 1,  end = Integer.parseInt(maxRecords);
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			List<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			if(locationsList != null && locationsList.size()>0)
				modelAndViewObj.addObject("locationsList",locationsList);
			List<OutletSyncSettings> userlogdetails = outletMasterServiceObj.getOutletSynchStatus(startIndex,maxRecords,location);
			if(userlogdetails == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(userlogdetails.size()<Integer.parseInt(maxRecords)){
					end = (userlogdetails.size())+(Integer.parseInt(startIndex));
				}else{
					end = (Integer.parseInt(startIndex)+end);
				}
				modelAndViewObj.addObject("totalRecords",userlogdetails.get(0).getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(startIndex)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("synchStatusdetails", userlogdetails);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
			modelAndViewObj.setViewName("monitoring/outletSynchStatus");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
/**
 * 
 * @author Vijay
 * Created On: 31-july-2018
 * 
 *	This method is used to display the Outlet DayOpen DayClose details 
 *
 **/

@RequestMapping("/outletSynchStatus")
public ModelAndView outletSynchStatus(
                @RequestParam("saveFlag") boolean saveFlag,
                @RequestParam("startIndex") String startIndex,
                @RequestParam("maxRecords") String maxRecords, 
                @RequestParam("location") String location,
                @RequestParam("zone") String zone,
                @RequestParam("startDate") String startDate,
                @RequestParam("endDate") String endDate,
                @RequestParam("locationAllList") String locationAllList,
                @RequestParam("searchCriteria") String searchCriteria,
                HttpServletRequest request,HttpServletResponse response){
        String locationListAll= "";
        try{
                // log.info("peoplemonitoring ");
                modelAndViewObj = new ModelAndView();
                int totalRecords = 0, totalValue = 0;
                String customerIdStr = (String)request.getSession().getAttribute("customerId");
                String emailIdStr = (String)request.getSession().getAttribute("emailId");
        
                List<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);

                if(locationsList != null && locationsList.size()>0)
                        modelAndViewObj.addObject("locationsList",locationsList);
                
                if(startDate == null || startDate.equals("") )
                {
                        startDate = DateUtil.getCurrentDateInFormat("dd/MM/yyyy");
                }
                  List<String> locationsListValue=new ArrayList<String>();
                          if(location.equals("all")|| location.equals("")){
                                if(locationAllList.equals("") || locationAllList == ""){
                                        if(locationsList != null)
//                                        if(locationAllList.equals("")){
//                                        if(zone ==""){
                                                for(int i=0;i<locationsList.size();i++){
                                                        locationsListValue.add(locationsList.get(i).getLocationId());
                                                }
//                                                }
//                                }
                                }
                                else
                                        {
//                                        ////////System.out.println("dg"+locationAllList);
                                        locationsListValue.add(locationAllList);
                                        }
                                for (String string : locationsListValue) {
                                        locationListAll = locationListAll+string+",";
                                }
                          }        
                DayOpenSummary dayOpen = outletMasterServiceObj.getOutletDaySync(startIndex,maxRecords,location,zone,startDate,endDate,searchCriteria,locationListAll,saveFlag);
                
                if(dayOpen  != null )
                {
                        if( dayOpen.getDayOpen()!= null && dayOpen.getDayOpen().size() > 0 )
                        {
                                modelAndViewObj.addObject("outletSettings", dayOpen.getDayOpen());
                                totalRecords = dayOpen.getTotalRecords();
                                modelAndViewObj.addObject("totalRecords",totalRecords);
                                
                                if(dayOpen.getDayOpen().size() < Integer.parseInt(maxRecords))
                                        totalValue = dayOpen.getDayOpen().size() +Integer.parseInt(startIndex);
                                else if(maxRecords.equals("-1"))
                                        totalValue = totalRecords; 
                                else        
                                        totalValue = Integer.parseInt(maxRecords)+Integer.parseInt(startIndex); 
                                
                                modelAndViewObj.addObject("totalValue",totalValue);
                        }
                        else
                        {
                                modelAndViewObj.addObject("totalRecords",0);
                                modelAndViewObj.addObject("totalValue",0);
                        }
                }
                else
                {
                        modelAndViewObj.addObject("totalRecords",0);
        
                }
//                if(dayOpen != null){
                if (saveFlag) {
                          if (dayOpen.getFilePathUrl() != null)
                                  modelAndViewObj.addObject("downloadOutleturl", dayOpen.getFilePathUrl());
                }
//}
                
                
                if(maxRecords.equals("-1") && totalRecords>0)
                        modelAndViewObj.addObject("maxRecords",totalRecords);
                else
                        modelAndViewObj.addObject("maxRecords",Integer.parseInt(maxRecords));
                modelAndViewObj.addObject("index",startIndex);
                modelAndViewObj.addObject("selectedLocation",location);
//                ////////System.out.println("dfg"+location);
                modelAndViewObj.addObject("zone",zone);
                modelAndViewObj.addObject("zone",zone);
                modelAndViewObj.addObject("startDate",startDate);
                modelAndViewObj.addObject("endDate",endDate);
                modelAndViewObj.addObject("searchCriteria",searchCriteria);
                modelAndViewObj.addObject("saveReport",saveFlag);
                
        modelAndViewObj.setViewName("monitoring/outletMonitoringStatus");
        }catch(Exception exception){
                exception.printStackTrace();
        }
        return modelAndViewObj;
}

/**
	 * 
	 * @author Vijay
	 *  Created On: 31-july-2018
	 *This method is used display  outlets information from remote  *
	 **/
		@RequestMapping("/outletMonitoringMap")
	public ModelAndView outletMonitoringMap(@RequestParam("location") String location ,
			@RequestParam("startIndex") String startIndex, 
			HttpServletRequest request,HttpServletResponse response){

			  Map<String, Object> responseMapObj = null;
		try{
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
		/*	responseMapObj = storeServiceObj.getStoresList(customerIdStr,emailIdStr,location,"-1","10");
			if(responseMapObj.size()>0)
			modelAndViewObj.addObject("outletSettings",responseMapObj.get("storeDetailsList"));*/

			OutletSettings outletSetting = outletMasterServiceObj.getOutletMapSettings(location);
			
			if(outletSetting != null )
			{
				if( outletSetting.getOutletSettingsObj() != null && outletSetting.getOutletSettingsObj().size() > 0 )
				{
					modelAndViewObj.addObject("outletSettings", outletSetting.getOutletSettingsObj());
				}
						
			}
			
			modelAndViewObj.setViewName("monitoring/outletMonitoringMap");
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
 *This method is used to display the Edit Sku form with all the details of the Sku
 *
 **/
@RequestMapping("/searchlocationsBasedOnZone")
public @ResponseBody List<String> searchlocationsBasedOnZone(@RequestParam("zoneID") String zoneID,HttpServletRequest request,
		HttpServletResponse response){
	List<String> locations = new ArrayList<String>();
	try{
		// log.info("getZonallocation");
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		List<ZoneMaster> zoneList = genericMasterServiceObj.getZones(zoneID, customerIdStr, emailIdStr, "0","","");
		if(zoneID=="")
		{
			ArrayList<LocationBean> locationDetails = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,true,true);
			for(int i=0;i<locationDetails.size();i++){
				locations.add(locationDetails.get(i).getLocationId()+"+"+locationDetails.get(i).getBusinessActivity()+"+"+locationDetails.get(i).getDescription());
			}
		}
		else	
		locations = zoneList.get(0).getZones();
		/*for (int i=0;i<zoneList.size();i++) {
			locations.add(zoneList.get(0).getZoneDetails().get(i).getLocation()+"+"+zoneList.get(0).getZoneDetails().get(i).getLocationType());
		}*/
		
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return locations;
}

/**
 * 
 * @author Manasa.P
 * 
 *
 **/
@RequestMapping("/searchZonalLocationsBasedZone")
public @ResponseBody List<String> searchZonalLocationsBasedZone(@RequestParam("zoneID") String zoneID,
		@RequestParam("bussinessActivity") String bussinessActivity, HttpServletRequest request,
		HttpServletResponse response){
	List<String> locations = new ArrayList<String>();
	try{
		//// log.info("editZone");
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		List<ZoneMaster> zoneList = genericMasterServiceObj.getZonalLocationBasedonZone(zoneID, customerIdStr, emailIdStr, "0","","",bussinessActivity);
		if(zoneID.equals(""))
		{
			ArrayList<LocationBean> locationDetails = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1",bussinessActivity,false,true,true);
			for(int i=0;i<locationDetails.size();i++){
				locations.add(locationDetails.get(i).getLocationId()+"+"+locationDetails.get(i).getBusinessActivity()+"+"+locationDetails.get(i).getDescription());
			}
		}
		else if(bussinessActivity.contains("wareHouse") && zoneList != null && zoneList.get(0).getZoneDetails() != null && zoneList.get(0).getZoneDetails().size()>0)
			for(ZoneDetails zoneItems : zoneList.get(0).getZoneDetails() )
			{
				locations.add(zoneItems.getLocation());
			}
		else
			locations = zoneList.get(0).getZones();
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return locations;
}


@RequestMapping("/getlocationsBasedOnZone")
public @ResponseBody Set<String> getlocationsBasedOnZone(@RequestParam("zone") String zone,HttpServletRequest request,
		HttpServletResponse response){
	List<String> locations = new ArrayList<String>();
	List<String> zonelocations = new ArrayList<String>();
	Set<String> zoneList = new HashSet<String>();
	
	try{
		// log.info("editZone");
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		zoneList = genericMasterServiceObj.getlocationsBasedOnZone(zone, customerIdStr, emailIdStr, "0","","");
		
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return zoneList;
}


	@RequestMapping(value = "/createStockRequests", method = RequestMethod.POST, consumes = "application/json")
	public ModelAndView createStockRequests(@RequestBody StockRequests stockRequestObj, HttpServletRequest request,
			HttpServletResponse response) {
		String customerIdStr = null, emailIdStr = null, resultStr = null;
	
		try {
			// log.info("Update Stock Request Details");
			customerIdStr = (String) request.getSession().getAttribute("customerId");
			if (stockRequestObj != null && stockRequestObj.getToWareHouseId() != null) {
				ArrayList<LocationBean> locationDetails = genericMasterServiceObj.getLocationDetails(
						stockRequestObj.getToWareHouseId(), customerIdStr, emailIdStr, "0", "", false, true, true);
				if (locationDetails.size()>0) {
					if (locationDetails.get(0).getBusinessActivity().equalsIgnoreCase("Warehouse")) {

					} else {
						stockRequestObj.setToStoreCode(stockRequestObj.getToWareHouseId());
						stockRequestObj.setToWareHouseId("");
					}
				}

			}
			resultStr = stockReceiptServiceObj.createStockRequest(stockRequestObj, customerIdStr, emailIdStr);
			List<String> locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,false);
			List<String> outletlocations = adminServiceObj.getOutletLocationsList(customerIdStr, emailIdStr, false);
			List<String> allLocationsList =  adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr, false);
			modelAndViewObj = new ModelAndView();
			/*if (!resultStr.equals(AppProperties.getAppMessageByProperty("STOCK_REQUEST_CREATE_SUCCESS").trim())) {
				modelAndViewObj.addObject("stockRequestsObj", stockRequestObj);
				modelAndViewObj.addObject("err", resultStr);
			} else {
				modelAndViewObj.addObject("success", resultStr);
				
			}*/
			if (!resultStr.equals(AppProperties.getAppMessageByProperty("STOCK_REQUEST_CREATE_SUCCESS").trim())) 
			{
				modelAndViewObj.addObject("stockRequestsObj", stockRequestObj);
				modelAndViewObj.addObject("err", resultStr);
			} 
			else 
			{
				modelAndViewObj.addObject("success", resultStr);
				
			}
			modelAndViewObj.addObject("type", "new");
			modelAndViewObj.addObject("flowUnder", stockRequestObj.getFlowUnder());
			modelAndViewObj.setViewName("Inventory Manager/stockRequest/newstockrequest");
			modelAndViewObj.addObject("outletlocations", outletlocations);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("allLocationsList", allLocationsList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return modelAndViewObj;
	}

/* @author chaithanya.v
 * Created On: 2-nov-2015
 * 
 *This method is used to display the newStockRequest form
 *
 **/
@RequestMapping("/issueToOutlets")
public ModelAndView issueToOutlets(@RequestParam("ids") String ids,@RequestParam("flowUnder") String flowUnder,@RequestParam("flag") Boolean flag,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("issueToOutlets");
		modelAndViewObj = new ModelAndView();
		StockRequestSummaryResponse stockRequestsList = stockIssueServiceObj.issueToOutlets(flowUnder,flag,ids);
		/*modelAndViewObj.addObject("workLocationsList", workLocationsList);
		modelAndViewObj.addObject("warehouseList", warehouseLocationsList);*/
		modelAndViewObj.addObject("stockRequestsList", stockRequestsList);
		modelAndViewObj.setViewName("Procurement/ShipmentReceipts/goodsReceiptSummary");
	}catch(Exception exception){
		exception.printStackTrace();
	}
	modelAndViewObj.addObject("flowUnder","warehouse");
	return modelAndViewObj;
}
/*chaithanya 
to get all the outlet products*/
@RequestMapping("/getallProductsByCriteria")
public @ResponseBody List<ProductsList> getallProductsByCriteria(@RequestParam("category") String category,@RequestParam("index") String index,@RequestParam("storeLocation") String storeLocation,HttpServletRequest request,HttpServletResponse response){
		// log.info("getProductsByCriteria");
		SearchProductResponse skuResponse =new SearchProductResponse();
		try {
			if(request.getSession().getAttribute("skuResponse")==null){
				skuResponse = skuServiceObj.getallProductsByCriteria(index,storeLocation,category);
				request.getSession().setAttribute("skuResponse", skuResponse);
			}
			else if (storeLocation=="")
			skuResponse = (SearchProductResponse)request.getSession().getAttribute("skuResponse");
			else
				skuResponse = skuServiceObj.getallProductsByCriteria(index,storeLocation,category);
			
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return skuResponse.getSkuLists();
}

	@RequestMapping(value = "/createGatePass", method = RequestMethod.POST, consumes = "application/json")
	public ModelAndView createShipmentGatePass(@RequestBody WarehouseGatepass warehouseGatepassobj,
			HttpServletRequest request, HttpServletResponse response) {
		//////////System.out.println("entererd");
		String result = null;
		try {

			// log.info("createShipmentGatePass");
			String customerIdStr = (String) request.getSession().getAttribute("customerId");
			String emailIdStr = (String) request.getSession().getAttribute("emailId");
			warehouseServiceObj = new WarehouseService();
			result = warehouseServiceObj.createShipmentGatePass(warehouseGatepassobj, customerIdStr, emailIdStr);
			modelAndViewObj.addObject("flowUnder", "warehouse");
			
			
			
			modelAndViewObj.addObject("warehouseGatepassobj", warehouseGatepassobj);
			modelAndViewObj.setViewName("Inventory Manager/Gatepass/viewNewShipmentGatePass");
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		modelAndViewObj.addObject("success", result);
		return modelAndViewObj;
	}

	@RequestMapping(value = "/viewNewShipmentGatePass")
	public ModelAndView viewNewShipmentGatePass(HttpServletRequest request, HttpServletResponse response) {

		try {
			List<LocationBean> locationsList = new ArrayList<LocationBean>();
			String customerIdStr = (String) request.getSession().getAttribute("customerId");
			String emailIdStr = (String) request.getSession().getAttribute("emailId");
			// log.info("newshipmentgatepass");
			// locationsList =
			// adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr,
			// emailIdStr,true);
			locationsList = warehouseServiceObj.getLocationDetails("", customerIdStr, emailIdStr, "-1", "", false,
					false, true);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("flowUnder", "warehouse");
			modelAndViewObj.setViewName("Inventory Manager/Gatepass/viewNewShipmentGatePass");
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		modelAndViewObj.addObject("flowUnder", "warehouse");
		return modelAndViewObj;
	}

	@RequestMapping(value = "/updateGatePass", method = RequestMethod.POST, consumes = "application/json")
	public ModelAndView updateGatePass(@RequestBody WarehouseGatepass warehouseGatepassobj, HttpServletRequest request,
			HttpServletResponse response) {
	//	////////System.out.println("entererd");
		String result = null;
		try {

			// log.info("updatingGatePass");
			String customerIdStr = (String) request.getSession().getAttribute("customerId");
			String emailIdStr = (String) request.getSession().getAttribute("emailId");

			warehouseServiceObj = new WarehouseService();
			result = warehouseServiceObj.createShipmentGatePass(warehouseGatepassobj, customerIdStr, emailIdStr);
			modelAndViewObj.addObject("warehouseGatepassobj", warehouseGatepassobj);
			modelAndViewObj.addObject("flowUnder", "warehouse");
			modelAndViewObj.setViewName("Inventory Manager/Gatepass/viewNewShipmentGatePass");
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		modelAndViewObj.addObject("success", result);
		return modelAndViewObj;
	}

	@RequestMapping("/searchShipmentGatepass")
	public @ResponseBody List<WarehouseGatepassItems> searchShipmentGatepass(
			@RequestParam("searchName") String searchNameStr, @RequestParam("storeLocation") String storeLocation,
			@RequestParam("status") String status, HttpServletRequest request, HttpServletResponse response) {
		String customerIdStr = null, emailIdStr = null;
		List<WarehouseGatepassItems> warehousegatepassList = new ArrayList<WarehouseGatepassItems>();
		try {
			// log.info("searchShipmentGatepass");
			customerIdStr = (String) request.getSession().getAttribute("customerId");
			emailIdStr = (String) request.getSession().getAttribute("emailId");
			//////////System.out.println("search name is" + searchNameStr);
			warehousegatepassList = warehouseServiceObj.searchShipmentGatepass(customerIdStr, emailIdStr, searchNameStr,
					storeLocation);

			// log.info("Result:::" + warehousegatepassList);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return warehousegatepassList;
	}

	@RequestMapping("/searchGatepass")
	public ModelAndView searchGatepass(@RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate, @RequestParam("maxRecords") String maxRecords,
			@RequestParam("searchName") String searchNameStr, @RequestParam("location") String location,
			@RequestParam("index") String index, HttpServletRequest request, HttpServletResponse response) {
		String customerIdStr = null, emailIdStr = null;
		List<WarehouseGatepass> WarehosegatepassList = new ArrayList<WarehouseGatepass>();
		List<String> locationsList = new ArrayList<String>();
		// List<WarehouseGatepass> WarehosegatepassLists = new
		// ArrayList<WarehouseGatepass>();
		try {
			// log.info("searchShipmentGatepass");
			customerIdStr = (String) request.getSession().getAttribute("customerId");
			emailIdStr = (String) request.getSession().getAttribute("emailId");
			WareHouseGatepassResponse responseObj = new WareHouseGatepassResponse();
			int start = 1, end = Integer.parseInt(maxRecords);
			//////////System.out.println("search name is" + searchNameStr);
			//////////System.out.println("location is" + location);
			warehouseServiceObj = new WarehouseService();
			responseObj = warehouseServiceObj.searchGatepass(startDate, endDate, index, maxRecords, customerIdStr,
					emailIdStr, searchNameStr, location);
			if (responseObj.getTotalRecords() > 0) {
				for (WarehouseGatepass warehouseGatepassobjs : responseObj.getGatePass()) {
					WarehosegatepassList.add(warehouseGatepassobjs);
				}
			}
			// WarehosegatepassList =
			// warehouseServiceObj.searchGatepass(startDate,endDate,index,maxRecords,customerIdStr,emailIdStr,searchNameStr,location);
			// WarehosegatepassLists =
			// warehouseServiceObj.searchGatepass("-1",maxRecords,customerIdStr,emailIdStr,searchNameStr,location);
			// log.info("Result:::" + WarehosegatepassList);
			modelAndViewObj = new ModelAndView();
			locationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr, true);
			modelAndViewObj.addObject("locationsList", locationsList);
			if (responseObj.getTotalRecords() == 0) {
				modelAndViewObj.addObject("totalRecords", "0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			} else {
				if (WarehosegatepassList.size() < Integer.parseInt(maxRecords)) {
					end = (WarehosegatepassList.size()) + (Integer.parseInt(index));
				} else {
					end = (Integer.parseInt(index) + end);
				}

				//////////System.out.println("length is" + WarehosegatepassList.size());
				modelAndViewObj.addObject("totalRecords", responseObj.getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index) + start));
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("maxRecords", maxRecords);

			}

			// modelAndViewObj.addObject("status",status);
			// modelAndViewObj.addObject("type",type);

			// modelAndViewObj.setViewName("Inventory
			// Manager/shipments/viewShipmentGatePass");
			modelAndViewObj.addObject("flowUnder", "warehouse");
			modelAndViewObj.addObject("selectedLocation", location);
			// }
			modelAndViewObj.addObject("searchName", searchNameStr);
			// modelAndViewObj.addObject("orderDetails", orderDetails);
			modelAndViewObj.addObject("startDate", startDate);
			modelAndViewObj.addObject("endDate", endDate);

			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));

			modelAndViewObj.addObject("orderDetails", WarehosegatepassList);
			modelAndViewObj.setViewName("Inventory Manager/shipments/viewShipmentGatePass");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return modelAndViewObj;
	}

	@RequestMapping("/ShipmentGatePass")
	public @ResponseBody ModelAndView ShipmentGatePass(@RequestParam("maxRecords") String maxRecords,
			@RequestParam("index") String index, HttpServletRequest request, HttpServletResponse response) {
		/**
		 * Developed By : vamsi v Created On : 02-02-2017 Modified By : access
		 * services for getting the shipmentgatepass from server
		 * 
		 */
		List<WarehouseGatepass> WarehosegatepassList = new ArrayList<WarehouseGatepass>();
		List<WarehouseGatepass> WarehosegatepassLists = new ArrayList<WarehouseGatepass>();
		List<String> locationsList = new ArrayList<String>();
		// log.info("InventoryManagerController - ShipmentGatePass()");
		String customerIdStr = (String) request.getSession().getAttribute("customerId");
		String emailIdStr = (String) request.getSession().getAttribute("emailId");
		int start = 1, end = Integer.parseInt(maxRecords);
		modelAndViewObj = new ModelAndView();
		warehouseServiceObj = new WarehouseService();
		WarehosegatepassList = warehouseServiceObj.getShipmentGatepass(index, maxRecords, customerIdStr, emailIdStr);
		WarehosegatepassLists = warehouseServiceObj.getShipmentGatepass("-1", maxRecords, customerIdStr, emailIdStr);
		locationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr, true);
		
		
		modelAndViewObj.addObject("locationsList", locationsList);
		if (WarehosegatepassList == null) {
			modelAndViewObj.addObject("totalRecords", "0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		} else {
			if (WarehosegatepassList.size() < Integer.parseInt(maxRecords)) {
				end = (WarehosegatepassList.size()) + (Integer.parseInt(index));
			} else {
				end = (Integer.parseInt(index) + end);
			}
			//////////System.out.println("length is" + WarehosegatepassLists.size());
			modelAndViewObj.addObject("totalRecords", WarehosegatepassLists.size());
			modelAndViewObj.addObject("index", (Integer.parseInt(index) + start));
			modelAndViewObj.addObject("totalValue", end);
			modelAndViewObj.addObject("maxRecords", maxRecords);

		}

		// modelAndViewObj.addObject("status",status);
		// modelAndViewObj.addObject("type",type);
		modelAndViewObj.addObject("flowUnder", "warehouse");
		modelAndViewObj.setViewName("Inventory Manager/shipments/viewShipmentGatePass");
		// modelAndViewObj.setViewName("Inventory
		// Manager/shipments/viewShipmentGatePass");

		modelAndViewObj.addObject("orderDetails", WarehosegatepassList);
		return modelAndViewObj;

	}

	@RequestMapping("/viewEditGatepass")
	public @ResponseBody ModelAndView viewEditGatepass(@RequestParam("id") String id,
			@RequestParam("operation") String operation, HttpServletRequest request, HttpServletResponse response) {
		/**
		 * Developed By : vamsi v Created On : 16-02-2017 Modified By : access
		 * services for getting and viewing gatepass details from server
		 * 
		 */
		List<LocationBean> locationsList = new ArrayList<LocationBean>();
		// log.info("InventoryManagerController - viewEditGatepass()");
		WarehouseGatepass warehouseGatepassobj = new WarehouseGatepass();
		String customerIdStr = (String) request.getSession().getAttribute("customerId");
		String emailIdStr = (String) request.getSession().getAttribute("emailId");
		modelAndViewObj = new ModelAndView();
		// warehouseServiceObj = new WarehouseService();
		locationsList = warehouseServiceObj.getLocationDetails("", customerIdStr, emailIdStr, "-1", "", false, false,
				true);
		// modelAndViewObj.addObject("locationsList",locationsList);
		warehouseGatepassobj = warehouseServiceObj.viewEditGatepass(id, customerIdStr, emailIdStr);
		/*
		 * locationsList =
		 * adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr,
		 * emailIdStr,true);
		 */
		modelAndViewObj.addObject("warehouseGatepassobj", warehouseGatepassobj);
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("flowUnder", "warehouse");
		if (operation.equals("view")) {
			modelAndViewObj.setViewName("Inventory Manager/Gatepass/viewGatepass");
		} else {
			modelAndViewObj.addObject("operation", "edit");
			modelAndViewObj.setViewName("Inventory Manager/Gatepass/viewNewShipmentGatePass");
		}

		return modelAndViewObj;

	}

	/* invoice-------- */
	@RequestMapping("/viewInvoicing")
	public ModelAndView viewInvoicing(@RequestParam("maxRecords") String maxRecords,
			@RequestParam("index") String index, HttpServletRequest request, HttpServletResponse response) {
		// InvoiceResponse invoiceresponse=null;
		List<WHInvoice> invoiceList = null;
		try {
			invoiceList = new ArrayList<WHInvoice>();
			// log.info("viewInvoicing");
			List<LocationBean> locationsList = new ArrayList<LocationBean>();
			String customerIdStr = (String) request.getSession().getAttribute("customerId");
			String emailIdStr = (String) request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			int start = 1, end = Integer.parseInt(maxRecords);
			invoiceList = warehouseServiceObj.getInvoices(index, maxRecords, customerIdStr, emailIdStr);
			List<WHInvoice> invoiceLists = warehouseServiceObj.getInvoices("-1", maxRecords, customerIdStr, emailIdStr);
			// locationsList =
			// adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr,
			// emailIdStr,true);
			locationsList = warehouseServiceObj.getLocationDetails("", customerIdStr, emailIdStr, "-1", "", false,
					false, true);
			modelAndViewObj.addObject("locations", locationsList);
			if (invoiceList.size() == 0) {
				modelAndViewObj.addObject("totalRecords", "0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			} else {
				if (invoiceList.size() < Integer.parseInt(maxRecords)) {
					end = (invoiceList.size()) + (Integer.parseInt(index));
				} else {
					end = (Integer.parseInt(index) + end);
				}
				//////////System.out.println("length is" + invoiceLists.size());
				modelAndViewObj.addObject("totalRecords", invoiceLists.size());
				modelAndViewObj.addObject("index", (Integer.parseInt(index) + start));
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("maxRecords", maxRecords);

			}
			modelAndViewObj.addObject("shipmentBeanList", invoiceList);
			modelAndViewObj.setViewName("Inventory Manager/warehouse/shipments/invoices");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return modelAndViewObj;
	}

	@RequestMapping("/searchInvoice")
	public ModelAndView searchInvoice(@RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate, @RequestParam("maxRecords") String maxRecords,
			@RequestParam("searchName") String searchNameStr, @RequestParam("location") String location,
			@RequestParam("index") String index, HttpServletRequest request, HttpServletResponse response) {
		List<WHInvoice> invoiceList = null;
		try {
			invoiceList = new ArrayList<WHInvoice>();
			// log.info("searchInvoice");
			List<LocationBean> locationsList = new ArrayList<LocationBean>();
			String customerIdStr = (String) request.getSession().getAttribute("customerId");
			String emailIdStr = (String) request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			int start = 1, end = Integer.parseInt(maxRecords);
			invoiceList = warehouseServiceObj.searchInvoices(startDate, endDate, index, maxRecords, customerIdStr,
					emailIdStr, searchNameStr, location);
			List<WHInvoice> invoiceLists = warehouseServiceObj.searchInvoices(startDate, endDate, "-1", maxRecords,
					customerIdStr, emailIdStr, searchNameStr, location);
			// locationsList =
			// adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr,
			// emailIdStr,true);
			locationsList = warehouseServiceObj.getLocationDetails("", customerIdStr, emailIdStr, "-1", "", false,
					false, true);
			modelAndViewObj.addObject("locations", locationsList);
			if (invoiceList.size() == 0) {
				modelAndViewObj.addObject("totalRecords", "0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			} else {
				if (invoiceList.size() < Integer.parseInt(maxRecords)) {
					end = (invoiceList.size()) + (Integer.parseInt(index));
				} else {
					end = (Integer.parseInt(index) + end);
				}
				//////////System.out.println("length is" + invoiceLists.size());
				modelAndViewObj.addObject("totalRecords", invoiceLists.size());
				modelAndViewObj.addObject("index", (Integer.parseInt(index) + start));
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("maxRecords", maxRecords);

			}
			modelAndViewObj.addObject("shipmentBeanList", invoiceList);
			modelAndViewObj.setViewName("Inventory Manager/warehouse/shipments/invoices");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return modelAndViewObj;

	}

	@RequestMapping("/viewInvoiceDetails")
	public ModelAndView viewInvoiceDetails(HttpServletRequest request, HttpServletResponse response) {
		try {
			List<LocationBean> locationsList = new ArrayList<LocationBean>();
			String customerIdStr = (String) request.getSession().getAttribute("customerId");
			String emailIdStr = (String) request.getSession().getAttribute("emailId");
			// log.info("viewInvoiceDetails");
			// locationsList =
			// adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr,
			// emailIdStr,true);
			locationsList = warehouseServiceObj.getLocationDetails("", customerIdStr, emailIdStr, "-1", "", false,
					false, true);
			modelAndViewObj.addObject("invoiceloc", locationsList);

			modelAndViewObj.setViewName("Inventory Manager/warehouse/shipments/newInvoicing");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return modelAndViewObj;
	}

	@RequestMapping("/viewEditinvoice")
	public @ResponseBody ModelAndView viewEditinvoice(@RequestParam("id") String id,
			@RequestParam("operation") String operation, HttpServletRequest request, HttpServletResponse response) {

		List<LocationBean> locationDetails = new ArrayList<LocationBean>();
		List<String> loc = new ArrayList<String>();
		// log.info("InventoryManagerController - viewEditGatepass()");
		InvoiceResponse invoiceRes = new InvoiceResponse();
		String customerIdStr = (String) request.getSession().getAttribute("customerId");
		String emailIdStr = (String) request.getSession().getAttribute("emailId");
		modelAndViewObj = new ModelAndView();
		// warehouseServiceObj = new WarehouseService();
		// locationsList=warehouseServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,true);
		// locationDetails =
		// genericMasterServiceObj.getLocationDetails(invoiceRes.getInvoice().getWarehouseLocation(),customerIdStr,
		// emailIdStr,"0","",false,true,true);
		// modelAndViewObj.addObject("locationsList",locationsList);
		invoiceRes = warehouseServiceObj.getinvoiceDetails(id, customerIdStr, emailIdStr);
		locationDetails = genericMasterServiceObj.getLocationDetails(invoiceRes.getInvoice().getWarehouseLocation(),
				customerIdStr, emailIdStr, "0", "", false, true, true);
		loc.add(invoiceRes.getInvoice().getWarehouseLocation());
		/*
		 * locationsList =
		 * adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr,
		 * emailIdStr,true);
		 */
		modelAndViewObj.addObject("quoteObj", invoiceRes.getInvoice());
		modelAndViewObj.addObject("selectedLocation", loc);
		modelAndViewObj.addObject("invoiceloc", locationDetails);
		modelAndViewObj.addObject("locationsList", locationDetails);
		modelAndViewObj.addObject("itemObj", invoiceRes.getInvoiceItems());
		if (operation.equals("view")) {
			modelAndViewObj.setViewName("Inventory Manager/warehouse/shipments/viewinvoices");
		} else {

			modelAndViewObj.addObject("operation", "edit");
			modelAndViewObj.setViewName("Inventory Manager/warehouse/shipments/newInvoicing");
		}

		return modelAndViewObj;

	}

	@RequestMapping(value = "/createInvoice", method = RequestMethod.POST, consumes = "application/json")
	public ModelAndView createInvoice(@RequestBody InvoiceBean invoicebeanobj, HttpServletRequest request,
			HttpServletResponse response) {
		//////////System.out.println("entererd");
		String result = null;
		List<LocationBean> locationDetails = new ArrayList<LocationBean>();
		List<String> loc = new ArrayList<String>();
		try {

			// log.info("createInvoice");
			String customerIdStr = (String) request.getSession().getAttribute("customerId");
			String emailIdStr = (String) request.getSession().getAttribute("emailId");
			warehouseServiceObj = new WarehouseService();
			locationDetails = genericMasterServiceObj.getLocationDetails(invoicebeanobj.getWarehouse_location(),
					customerIdStr, emailIdStr, "0", "", false, true, true);
			result = warehouseServiceObj.createInvoice(invoicebeanobj, customerIdStr, emailIdStr);
			loc.add(invoicebeanobj.getWarehouse_location());
			modelAndViewObj.addObject("selectedLocation", loc);
			modelAndViewObj.addObject("locationsList", locationDetails);
			modelAndViewObj.addObject("quoteObj", invoicebeanobj);
			modelAndViewObj.addObject("operation", "submit");
			modelAndViewObj.setViewName("Inventory Manager/warehouse/shipments/newInvoicing");
			if (result.equals(AppProperties.getAppMessageByProperty("INVOICE_UPDATED_SUCCESS").trim())
					|| result.equals(AppProperties.getAppMessageByProperty("INVOICE_CREATED_SUCCESS").trim())) {
				modelAndViewObj.addObject("success", result);
			} else {
				modelAndViewObj.addObject("err", result);
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}

		return modelAndViewObj;
	}

	@RequestMapping("/searchOrderRef")
	public @ResponseBody List<OrderDetails> searchOrderRef(@RequestParam("searchName") String searchNameStr,
			HttpServletRequest request, HttpServletResponse response) {
		String customerIdStr = null, emailIdStr = null;
		OrderDetails detailsObj = new OrderDetails();
		List<OrderDetails> orderDetails = new ArrayList<OrderDetails>();
		// OrderDetails orderDetails = new OrderDetails();
		// List<SupplierBean> suppliersList = new ArrayList<SupplierBean>();
		try {
			// log.info("searchOrderRef");
			customerIdStr = (String) request.getSession().getAttribute("customerId");
			emailIdStr = (String) request.getSession().getAttribute("emailId");
			// orderDetails.setOrderId(searchNameStr);
			// orderDetails =
			// orderServiceObj.getOrderDetailsByLocation(orderDetails);
			orderDetails = orderServiceObj.getOrdersByLocation(searchNameStr, "", "", detailsObj, "", "-1", true, "",
					"", "", "", false,"","","","","false");
			// suppliersList =
			// outletMasterServiceObj.searchSuppliers(customerIdStr,
			// emailIdStr,searchNameStr,"0");
			// log.info("Result:::" + orderDetails);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return orderDetails;
	}

	
	
	@RequestMapping("/searchOrderRefItems")
	public @ResponseBody Order searchOrderRefItems(@RequestParam("searchName") String searchNameStr,
			HttpServletRequest request, HttpServletResponse response) {
		String customerIdStr = null, emailIdStr = null;
		// OrderDetails detailsObj= new OrderDetails();
		// List<OrderDetails> orderDetails =new ArrayList<OrderDetails>();
		Order orderDetails = new Order();
		// List<SupplierBean> suppliersList = new ArrayList<SupplierBean>();
		try {
			// log.info("searchOrderRef");
			customerIdStr = (String) request.getSession().getAttribute("customerId");
			emailIdStr = (String) request.getSession().getAttribute("emailId");
			orderDetails.setOrderId(searchNameStr);
			orderDetails = orderServiceObj.getOrderDetailsByLocation(orderDetails);
			// orderDetails =
			// orderServiceObj.getOrdersByLocation(searchNameStr,"","",
			// detailsObj, "","-1", true,"","","","",false);
			// suppliersList =
			// outletMasterServiceObj.searchSuppliers(customerIdStr,
			// emailIdStr,searchNameStr,"0");
			// log.info("Result:::" + orderDetails);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return orderDetails;
	}

	@RequestMapping("/orderRefLocations")
	public @ResponseBody List<LocationBean> orderRefLocations(@RequestParam("locationId") String locationId,
			HttpServletRequest request, HttpServletResponse response) {
		List<LocationBean> locationDetails = new ArrayList<LocationBean>();
		try {
			// log.info("orderRefLocations");
			String customerId = (String) request.getSession().getAttribute("customerId");
			String emailId = (String) request.getSession().getAttribute("emailId");
			locationDetails = genericMasterServiceObj.getLocationDetails(locationId, customerId, emailId, "0", "",
					false, true, true);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return locationDetails;
	}
	
	
	
	/**
	 * @author Manasa
	 *  Created On: 4-april-2017
	 * @param flowunder index,verificationCode,maxRecords,Request, Response
	 * Description: This method is used to view stockverification .
	 *  @return ModelAndView with stock verification master details
	 */
/*	@RequestMapping("/viewWarehouseStockVerification")
	public ModelAndView viewWarehouseStockVerification(@RequestParam("index") String index,@RequestParam("flowUnder") String flowUnder,@RequestParam("location") String location,
			@RequestParam("verificationCode") String verificationCode,@RequestParam("maxRecords") String maxRecords,HttpServletRequest request,HttpServletResponse response) {
		List<String> locationsList = null;
		List<WareHouseStockVerification> stockVerificationDetailsList = null;
		StoreStockVerificationMaster  whstockverifiObj=null;
		try{
			// log.info("viewStockVerification");
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr  = (String)request.getSession().getAttribute("emailId");
			
			if(flowUnder.equals("outlet")){
				stockVerificationDetailsList = storeStockVerificationServiceObj.getProductVerification(customerIdStr,emailIdStr,location,"",index,"","",maxRecords,flowUnder,verificationCode);
				locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			}
			else{
				////////System.out.println("dfgf");
				stockVerificationDetailsList = storeStockVerificationServiceObj.getWarehouseStockVerification(customerIdStr,emailIdStr,location,"",index,"","",maxRecords,flowUnder,verificationCode);
				locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
	        			}
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("locationsList", locationsList);
				
				//modelAndViewObj.addObject("stockVerificationMaster",stockVerificationMaster.getVerification_code());
				if(stockVerificationDetailsList == null || stockVerificationDetailsList.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(stockVerificationDetailsList.size()<Integer.parseInt(maxRecords)){
						end = (stockVerificationDetailsList.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(stockVerificationDetailsList.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
				}
		
				//modelAndViewObj.addObject("whstockverifiObj",whstockverifiObj.getVerification_code());
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.addObject("productStockVerificationDetailsList",stockVerificationDetailsList);
				//modelAndViewObj.addObject("whstockverifiObj",stockVerificationDetailsList.get);
				//modelAndViewObj.addObject("whstockverifiObj",stockVerificationDetailsList.get(0).getVerification_code());
				modelAndViewObj.addObject("selectedLocation",location);
				modelAndViewObj.addObject("flowUnder", flowUnder);
			
				modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/stockVerification");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/allverifiedproductstocks");
		}
		return modelAndViewObj;
	}*/


/**
 * @author Manasa
 *  Created On: 10-april-2017
 * @param flowunder verificationCode, Request, Response
 * Description: This method is used to update the stock verification master details .
 * 
 */

@RequestMapping(value="/updatestockverification",method = RequestMethod.POST, consumes = "application/json")
public ModelAndView updatestockverification(@RequestBody StoreStockVerificationMaster finalobj, HttpServletRequest request,HttpServletResponse response)
{
	try{
		// log.info("createstockverification");
		modelAndViewObj = new ModelAndView();
		String resultStr=storeStockVerificationServiceObj.updatestockverification(finalobj);
		List<String> locationsList= null;
		modelAndViewObj.addObject("location",finalobj.getLocation());
	   List<String> brandsList = adminServiceObj.getBrandNamesList("","");
	
		modelAndViewObj.addObject("brandsList", brandsList);
		
		if(finalobj.getFlowUnder().equals("outlet"))
			 locationsList = adminServiceObj.getOutletLocationsList("","",true);
			else
			 locationsList = adminServiceObj.getWarehouseLocationsList("", "", true);
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("startdate",finalobj.getStartDateStr());
		modelAndViewObj.addObject("enddate",finalobj.getEndDateStr());
		modelAndViewObj.addObject("approvedBy",finalobj.getApprovedBy());
		modelAndViewObj.addObject("flowUnder",finalobj.getFlowUnder());
		//modelAndViewObj.addObject("flowUnder",flowUnder);
	
		
		if(!resultStr.equals(AppProperties.getAppMessageByProperty("STOCK_VERIFICATION_CREATION_SUCCESS").trim())){
			modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/newstockverification");
		}else{
			// log.info("successed");
			modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/newstockverification");
		}
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}



@RequestMapping("/searchStockVerification")
	public ModelAndView searchStockVerification(@RequestParam("searchName") String searchNameStr,@RequestParam("location") String locationStr,@RequestParam("index") String index,@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,@RequestParam("maxRecords") String maxRecords,@RequestParam("flowUnder") String flowUnder,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<WareHouseStockVerification> stockVerificationDetailsList = null;
		List<String> locationsList=null;
		try{
			// log.info("searchStockVerification");
			int start = 1,end = Integer.parseInt(maxRecords);
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			if(flowUnder.equals("outlet")){
				stockVerificationDetailsList = storeStockVerificationServiceObj.getProductVerification(customerIdStr,emailIdStr,locationStr,searchNameStr,index,startDate,endDate,maxRecords,flowUnder,"");
				locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			}
			else{
				stockVerificationDetailsList = storeStockVerificationServiceObj.getWarehouseProductVerification(customerIdStr,emailIdStr,locationStr,searchNameStr,index,startDate,endDate,maxRecords,flowUnder);
				locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
			}
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("locationsList", locationsList);
			if(locationStr != null && !locationStr.equals(""))
				request.getSession().setAttribute("selectedLocation",locationStr);
			if(stockVerificationDetailsList == null || stockVerificationDetailsList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(stockVerificationDetailsList.size()<Integer.parseInt(maxRecords)){
					end = (stockVerificationDetailsList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(stockVerificationDetailsList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("startDate", startDate);
			modelAndViewObj.addObject("endDate", endDate);
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
			//////////System.out.println(stockVerificationDetailsList.size());
			//////////System.out.println(Integer.parseInt(stockVerificationDetailsList.get(0).getTotalRecords()));
			modelAndViewObj.addObject("productStockVerificationDetailsList",stockVerificationDetailsList);
			modelAndViewObj.addObject("selectedLocation",locationStr);
			modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/stockVerificationmaster");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}





/**
	 * 
	 * @author Manasa.P
	 * Created On:4-april-2017.
	 * 
	 * This method accepts the search string and retrieves a list of stockverification  matching it.
	 * It returns the list of the stockverification details. 
	 * 
	 */
	
	@RequestMapping("/searchwarehouseStockVerification")
	public ModelAndView searchwarehouseStockVerification(@RequestParam("searchName") String searchNameStr,@RequestParam("location") String locationStr,@RequestParam("index") String index,@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,@RequestParam("maxRecords") String maxRecords,@RequestParam("flowUnder") String flowUnder,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<WareHouseStockVerification> stockVerificationDetailsList = null;
		List<String> locationsList=null;
		try{
			// log.info("searchWarehouseStockVerification");
			int start = 1,end = Integer.parseInt(maxRecords);
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			if(flowUnder.equals("outlet")){
				stockVerificationDetailsList = storeStockVerificationServiceObj.getProductVerification(customerIdStr,emailIdStr,locationStr,searchNameStr,index,startDate,endDate,maxRecords,flowUnder,"");
				locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			}
			else{
				stockVerificationDetailsList = storeStockVerificationServiceObj.getStockVerification(customerIdStr,emailIdStr,locationStr,searchNameStr,index,startDate,endDate,maxRecords,flowUnder,"");
				locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
	        			}
			locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("locationsList", locationsList);
			if(locationStr != null && !locationStr.equals(""))
				request.getSession().setAttribute("selectedLocation",locationStr);
			if(stockVerificationDetailsList == null || stockVerificationDetailsList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(stockVerificationDetailsList.size()<Integer.parseInt(maxRecords)){
					end = (stockVerificationDetailsList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(stockVerificationDetailsList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("startDate", startDate);
			modelAndViewObj.addObject("endDate", endDate);
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
			modelAndViewObj.addObject("productStockVerificationDetailsList",stockVerificationDetailsList);
			modelAndViewObj.addObject("selectedLocation",locationStr);
			modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/stockVerification");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}

	

	/**
	 * @author Manasa
	 *  Created On: 3-april-2017
	 *   * This method is used to accept all values related to outlet dayopen from GUI(user-experience) and sent to webservice 
	 *  
	*/
	@RequestMapping(value="/createOutletDayopen",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createOutletDayopen(@RequestBody OutletDayOpen outletdayopenobj,HttpServletRequest request,HttpServletResponse response)
	{
		String customerIdStr = null,emailIdStr=null;
		try{
			
			// log.info("Create ShoppingList");
			modelAndViewObj = new ModelAndView();
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr=outletNotificataionServiceObj.createOutletDayopen(outletdayopenobj);
		//	////////System.out.println(resultStr);
			
			String location = (String)request.getSession().getAttribute("selectedLocation");
			List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
			if(location == null)
				location = workLocationsList.get(0);
			if(location != null && !location.equals(""))
				request.getSession().setAttribute("selectedLocation", location);
			List<Counter> counterDetails = adminServiceObj.getCounters("","",customerIdStr,emailIdStr,"0",false,"10","");
			String counterListStr="";
			List<String> counterDetailslist = new ArrayList<String>();
				for(int i=0;i<counterDetails.size();i++)
				{
					counterListStr=counterDetails.get(i).getCounterName(); 
					counterDetailslist.add(counterListStr);
					//////////System.out.println(i);
				//	////////System.out.println(empList1);
				}
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("counterDetails", counterDetailslist);
			
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("Day_Open_Created_Successfully").trim())){
				modelAndViewObj.addObject("err", resultStr);
				modelAndViewObj.addObject("outletDayopen", outletdayopenobj);
				//modelAndViewObj.addObject("type", "new");
				modelAndViewObj.setViewName("Inventory Manager/DaysOpen/newDaysOpen");
			}else{
				modelAndViewObj.addObject("success", resultStr);
				modelAndViewObj.setViewName("Inventory Manager/DaysOpen/newDaysOpen");
			}
			
		
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
/**
	 * 
	 * @author Manasa.P
	 * 
	 *This method is used to delete the day open
	 *
	 **/


	@RequestMapping("/deleteDayOpens")
	public ModelAndView deleteDayOpens(@RequestParam("businessCounter") String businessCounter,@RequestParam("outletLocation") String outletLocation,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("deleteShoppingList ");
			String maxRecords="10";
			int start = 1,end = Integer.parseInt(maxRecords);
			String index="0";
			
			String resultStr = outletNotificataionServiceObj.deleteDayOpens(businessCounter,outletLocation);
			modelAndViewObj =new ModelAndView();
			OutletDayOpenResponse  outletdayopenResponse = outletNotificataionServiceObj.getDayOpen("","","-1",maxRecords,"");
			 
			modelAndViewObj.addObject("outletdayopenResponse", outletdayopenResponse.getOutletDayOpen());

			if(outletdayopenResponse == null || outletdayopenResponse.getOutletDayOpen()==null || outletdayopenResponse.getOutletDayOpen().size()==0)
			{
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(outletdayopenResponse.getOutletDayOpen().size()<Integer.parseInt(maxRecords)){
					end = (outletdayopenResponse.getOutletDayOpen().size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", outletdayopenResponse.getTotalRecords());
				//////////System.out.println(outletdayopenResponse.getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
				//////////System.out.println("totalValue"+end);
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				//////////System.out.println(Integer.parseInt(maxRecords));
				modelAndViewObj.setViewName("Inventory Manager/DaysOpen/viewDaysOpen");
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}

	/**
	 * 
	 * @author Manasa.P
	 * Created On: 22-march-2017
	 * 
	 *This method is used to display all Day Open  details in a tabular form
	 *
	 **/
	
	@RequestMapping("/searchDaysOpen")
	public ModelAndView searchDaysOpen(@RequestParam("searchName") String searchNameStr,@RequestParam("index")String index,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewOutletDayOpens");
			
			int start = 1,end = 10;
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			OutletDayOpenResponse  outletdayopenResponse = outletNotificataionServiceObj.getDayOpen(customerIdStr, emailIdStr,index,"",searchNameStr);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("outletdayopenResponse", outletdayopenResponse.getOutletDayOpen());
			if(outletdayopenResponse == null || outletdayopenResponse.getOutletDayOpen()==null || outletdayopenResponse.getOutletDayOpen().size()==0)
			{
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(outletdayopenResponse.getOutletDayOpen().size()<10){
					end = (outletdayopenResponse.getOutletDayOpen().size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", outletdayopenResponse.getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			//	modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("searchName", searchNameStr);
			}
			
			modelAndViewObj.setViewName("Inventory Manager/DaysOpen/viewDaysOpen");
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}

	/**
	 * 
	 * @author Manasa.P
	 * Created On: 22-march-2017
	 * 
	 *This method is used to display all Day Open  details in a tabular form
	 *
	 **/
	
	@RequestMapping("/viewoutletdaysOpen")
	public ModelAndView viewoutletdaysOpen(@RequestParam("index") String index,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewOutletDayOpens");
			String maxRecords = "10";
			int start = 1,end = 10;
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			OutletDayOpenResponse  outletdayopenResponse = outletNotificataionServiceObj.getDayOpen(customerIdStr, emailIdStr,"-1",maxRecords,"");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("outletdayopenResponse", outletdayopenResponse.getOutletDayOpen());
			if(outletdayopenResponse == null || outletdayopenResponse.getOutletDayOpen()==null || outletdayopenResponse.getOutletDayOpen().size()==0)
			{
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(outletdayopenResponse.getOutletDayOpen().size()<Integer.parseInt(maxRecords)){
					end = (outletdayopenResponse.getOutletDayOpen().size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", outletdayopenResponse.getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.addObject("totalValue", end);
			}
			
			modelAndViewObj.setViewName("Inventory Manager/DaysOpen/viewDaysOpen");
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}
	
	@RequestMapping("/newdaysOpen")
	public ModelAndView newdaysOpen(HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("newOutletNotification ");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			//List<Role> roleList = roleServiceObj.getRoleDetails(null,customerIdStr,emailIdStr,"-1");
			modelAndViewObj = new ModelAndView();
			String location = (String)request.getSession().getAttribute("selectedLocation");
			List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
			if(location == null)
				location = workLocationsList.get(0);
			if(location != null && !location.equals(""))
				request.getSession().setAttribute("selectedLocation", location);
			List<Counter> counterDetails = adminServiceObj.getCounters("","",customerIdStr,emailIdStr,"0",false,"-1","");
			String counterListStr="";
			List<String> counterDetailslist = new ArrayList<String>();
				for(int i=0;i<counterDetails.size();i++)
				{
					counterListStr=counterDetails.get(i).getCounterName(); 
					counterDetailslist.add(counterListStr);
					//////////System.out.println(i);
				//	////////System.out.println(empList1);
				}
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("counterDetails", counterDetailslist);
			modelAndViewObj.addObject("outletDayopen",new OutletDayOpen());
			modelAndViewObj.setViewName("Inventory Manager/DaysOpen/newDaysOpen");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * @author Manasa
	 *  Created On: 3-april-2017
	 * @param businessCounter, outletLocatione,startIndex, operation,Request, Response
	 * Description: This method is used to view outlet day open details .
	 *  @return ModelAndView with outlet dayOpen details
	 */


	@RequestMapping("/viewOutletDayOenDetails")
		public ModelAndView viewOutletDayOenDetails(@RequestParam("businessCounter")String businessCounter,@RequestParam("outletLocation")String outletLocation,@RequestParam("startIndex")String startIndex,@RequestParam("operation")String operation,HttpServletRequest request,HttpServletResponse response){
		
			
			// log.info("viewOutletDayOenDetails");
			OutletDayOpenResponse outletDayOpenresponse = null;
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			
			try {
				modelAndViewObj = new ModelAndView();
				outletDayOpenresponse = outletNotificataionServiceObj.viewOutletDayOenDetails(customerIdStr,emailIdStr,businessCounter,outletLocation,"-1",operation);
				modelAndViewObj.addObject("outletDayOpenresponse",outletDayOpenresponse.getOutletDayOpenObj());
				String location = (String)request.getSession().getAttribute("selectedLocation");
				List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
				if(location == null)
					location = workLocationsList.get(0);
				if(location != null && !location.equals(""))
					request.getSession().setAttribute("selectedLocation", location);
				List<Counter> counterDetails = adminServiceObj.getCounters("","",customerIdStr,emailIdStr,"0",false,"-1","");
				String counterListStr="";
				List<String> counterDetailslist = new ArrayList<String>();
					for(int i=0;i<counterDetails.size();i++)
					{
						counterListStr=counterDetails.get(i).getCounterName(); 
						counterDetailslist.add(counterListStr);
						//////////System.out.println(i);
					//	////////System.out.println(empList1);
					}
				modelAndViewObj.addObject("workLocationsList", workLocationsList);
				modelAndViewObj.addObject("counterDetails", counterDetailslist);
				if(operation.equals("view"))
				{
					modelAndViewObj.setViewName("Inventory Manager/DaysOpen/viewSpecificDayOpenDetails");
				}
			    else
			    {
			    	modelAndViewObj.setViewName("Inventory Manager/DaysOpen/editdayopens");
			    }
				
				
				
		
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}




	/**
	 * 
	 * @author Manasa.P
	 * 
	 *This method is used to update the existing day open Details
	 *
	 **/


	@RequestMapping(value="/updateOutletDayOpen",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView updateOutletDayOpen(@RequestBody OutletDayOpen outletDayOpen,HttpServletRequest request,HttpServletResponse response){

	OutletDayOpenResponse outletDayOpenresponse = null;
	List<String> countersList = null;
		try{
		
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr=outletNotificataionServiceObj.updateOutletDayOpen(outletDayOpen, customerIdStr, emailIdStr);
			String location = (String)request.getSession().getAttribute("selectedLocation");
			List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
			if(location == null)
				location = workLocationsList.get(0);
			if(location != null && !location.equals(""))
				request.getSession().setAttribute("selectedLocation", location);
			List<Counter> counterDetails = adminServiceObj.getCounters("","",customerIdStr,emailIdStr,"0",false,"-1","");
			String counterListStr="";
			List<String> counterDetailslist = new ArrayList<String>();
				for(int i=0;i<counterDetails.size();i++)
				{
					counterListStr=counterDetails.get(i).getCounterName(); 
					counterDetailslist.add(counterListStr);
					//////////System.out.println(i);
				//	////////System.out.println(empList1);
				}
				//countersList = reportsServiceObj.getCounters(location,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
				modelAndViewObj.addObject("counterDetails", countersList);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("counterDetails", counterDetailslist);
			
			
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("Day_open_update_Success").trim())){
			
				modelAndViewObj.addObject("err", resultStr);
				//modelAndViewObj.addObject("type", "new");
				
			}else{
				modelAndViewObj.addObject("success", resultStr);
				outletDayOpenresponse = outletNotificataionServiceObj.viewOutletDayOenDetails(customerIdStr,emailIdStr,outletDayOpen.getBusinessCounter(),outletDayOpen.getOutletLocation(),"0","");
				modelAndViewObj.addObject("outletDayOpenresponse",outletDayOpenresponse.getOutletDayOpenObj());
				modelAndViewObj.setViewName("Inventory Manager/DaysOpen/editdayopens");
			}
		}catch(Exception exception){
			exception.printStackTrace();
		}
		
		
		return modelAndViewObj;
	}













	/**
		 * 
		 * @author Manasa.P
		 * Created On: 24-april-2017
		 * 
		 *This method is used to display all Day Close  details in a tabular form
		 *
		 **/
		
		@RequestMapping("/searchDaysClose")
		public ModelAndView searchDaysClose(@RequestParam("searchName") String searchNameStr,@RequestParam("index")String index,HttpServletRequest request,HttpServletResponse response){
			try{
				// log.info("viewOutletDayOpens");
				
				int start = 1,end = 10;
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				OutletDayCloseResponse  outletdayopenResponse = outletNotificataionServiceObj.getDayClose(customerIdStr, emailIdStr,index,"",searchNameStr);
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("outletdayopenResponse", outletdayopenResponse.getOutletDayClose());
				if(outletdayopenResponse == null || outletdayopenResponse.getOutletDayClose()==null || outletdayopenResponse.getOutletDayClose().size()==0)
				{
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(outletdayopenResponse.getOutletDayClose().size()<10){
						end = (outletdayopenResponse.getOutletDayClose().size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", outletdayopenResponse.getTotalRecords());
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				//	modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
					modelAndViewObj.addObject("totalValue", end);
					modelAndViewObj.addObject("searchName", searchNameStr);
				}
			
					modelAndViewObj.setViewName("Inventory Manager/DayClose/viewDayClose");	
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}

		

	/**
		 * 
		 * @author Manasa.P
		 * Created On: 24-april-2017
		 * 
		 *This method is used to display all Day Open  details in a tabular form
		 *
		 **/
		
		@RequestMapping("/viewoutletdaysClose")
		public ModelAndView viewoutletdaysClose(@RequestParam("index") String index,HttpServletRequest request,HttpServletResponse response){
			try{
				// log.info("viewOutletDayOpens");
				String maxRecords = "10";
				int start = 1,end = 10;
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				OutletDayCloseResponse  outletdayopenResponse = outletNotificataionServiceObj.getDayClose(customerIdStr, emailIdStr,"-1",maxRecords,"");
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("outletdayopenResponse", outletdayopenResponse.getOutletDayClose());
				if(outletdayopenResponse == null || outletdayopenResponse.getOutletDayClose()==null || outletdayopenResponse.getOutletDayClose().size()==0)
				{
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(outletdayopenResponse.getOutletDayClose().size()<Integer.parseInt(maxRecords)){
						end = (outletdayopenResponse.getOutletDayClose().size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", outletdayopenResponse.getTotalRecords());
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
					modelAndViewObj.addObject("totalValue", end);
					
				}
				//modelAndViewObj.addObject("type", type);
				modelAndViewObj.setViewName("Inventory Manager/DayClose/viewDayClose");	
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
		
		/**
		 * 
		 * @author Manasa.P
		 * Created On: 24-april-2017
		 * 
		 *This method is used to display the newDayOpen or newDayClose form based on type
		 *
		 **/
		@RequestMapping("/newdaysClose")
		public ModelAndView newdaysClose(HttpServletRequest request,HttpServletResponse response){
			
			List<String> countersList = null;
			try{
				// log.info("newOutletNotification ");
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				//List<Role> roleList = roleServiceObj.getRoleDetails(null,customerIdStr,emailIdStr,"-1");
				modelAndViewObj = new ModelAndView();
				String location = (String)request.getSession().getAttribute("selectedLocation");
				List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
				if(location == null)
					location = workLocationsList.get(0);
				if(location != null && !location.equals(""))
					request.getSession().setAttribute("selectedLocation", location);
				List<Counter> counterDetails = adminServiceObj.getCounters("","",customerIdStr,emailIdStr,"0",false,"-1","");
				/*String counterListStr="";
				List<String> counterDetailslist = new ArrayList<String>();
					for(int i=0;i<counterDetails.size();i++)
					{
						counterListStr=counterDetails.get(i).getCounterName(); 
						counterDetailslist.add(counterListStr);
						//////////System.out.println(i);
					//	////////System.out.println(empList1);
					}*/
				
				countersList = reportsServiceObj.getCounters(location,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
				modelAndViewObj.addObject("countersList", countersList);
				modelAndViewObj.addObject("workLocationsList", workLocationsList);
				//modelAndViewObj.addObject("counterDetails", counterDetailslist);
				modelAndViewObj.addObject("outletDayopen",new OutletDayClose());
				
				modelAndViewObj.setViewName("Inventory Manager/DayClose/newDaysClose");
			
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
	/**
	 * @author Manasa.P
	 *  Created On: 24-april-2017
	 *   * This method is used to accept all values related to outlet dayclose from GUI(user-experience) and sent to webservice 
	 *  
	*/
	@RequestMapping(value="/createOutletDayclose",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createOutletDayclose(@RequestBody OutletDayClose outletdayopenobj,HttpServletRequest request,HttpServletResponse response)
	{
		String customerIdStr = null,emailIdStr=null;
		
		try{
			
			// log.info("Create outlet day close");
			
			//////////System.out.println("Create outlet day close");
			modelAndViewObj = new ModelAndView();
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr=outletNotificataionServiceObj.createOutletDayclose(outletdayopenobj);
			//////////System.out.println(resultStr);
			String location = (String)request.getSession().getAttribute("selectedLocation");
			List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
			if(location == null)
				location = workLocationsList.get(0);
			if(location != null && !location.equals(""))
				request.getSession().setAttribute("selectedLocation", location);
			List<Counter> counterDetails = adminServiceObj.getCounters("","",customerIdStr,emailIdStr,"0",false,"-1","");
			String counterListStr="";
			List<String> counterDetailslist = new ArrayList<String>();
				for(int i=0;i<counterDetails.size();i++)
				{
					counterListStr=counterDetails.get(i).getCounterName(); 
					counterDetailslist.add(counterListStr);
					//////////System.out.println(i);
				//	////////System.out.println(empList1);
				}
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("counterDetails", counterDetailslist);
			
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("Day_Close_Created_Successfully").trim())){
				modelAndViewObj.addObject("err", resultStr);
				modelAndViewObj.addObject("outletDayclose", outletdayopenobj);
				//modelAndViewObj.addObject("type", "new");
				modelAndViewObj.setViewName("Inventory Manager/DayClose/newDaysClose");
			}else{
				modelAndViewObj.addObject("success", resultStr);
				modelAndViewObj.setViewName("Inventory Manager/DayClose/newDaysClose");
			}
			
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}

		

	/**
	 * @author Manasa
	 *  Created On: 24-april-2017
	 * @param businessCounter, outletLocatione,startIndex, operation,Request, Response
	 * Description: This method is used to view outlet day open details .
	 *  @return ModelAndView with outlet dayOpen details
	 */


	@RequestMapping("/viewOutletDayCloseDetails")
		public ModelAndView viewOutletDayCloseDetails(@RequestParam("businessCounter")String businessCounter,@RequestParam("outletLocation")String outletLocation,@RequestParam("startIndex")String startIndex,@RequestParam("operation")String operation,HttpServletRequest request,HttpServletResponse response){
			// log.info("viewOutletDayCloseDetails");
			OutletDayCloseResponse outletDayCloseresponse = null;
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<String> countersList = null;
			try {
				modelAndViewObj = new ModelAndView();
				outletDayCloseresponse = outletNotificataionServiceObj.viewOutletDayCloseDetails(customerIdStr,emailIdStr,businessCounter,outletLocation,"0",operation);
				modelAndViewObj.addObject("outletDayCloseresponse",outletDayCloseresponse.getOutletDayCloseObj());
				String location = (String)request.getSession().getAttribute("selectedLocation");
				List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
				if(location == null)
					location = workLocationsList.get(0);
				if(location != null && !location.equals(""))
					request.getSession().setAttribute("selectedLocation", location);
				List<Counter> counterDetails = adminServiceObj.getCounters("","",customerIdStr,emailIdStr,"0",false,"-1","");
				String counterListStr="";
				List<String> counterDetailslist = new ArrayList<String>();
					for(int i=0;i<counterDetails.size();i++)
					{
						counterListStr=counterDetails.get(i).getCounterName(); 
						counterDetailslist.add(counterListStr);
						//////////System.out.println(i);
					//	////////System.out.println(empList1);
					}
				//countersList = reportsServiceObj.getCounters(location,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
				modelAndViewObj.addObject("countersList", counterDetailslist);
				modelAndViewObj.addObject("workLocationsList", workLocationsList);
				//modelAndViewObj.addObject("counterDetails", counterDetailslist);
				//modelAndViewObj.addObject("type", type);
				if(operation.equals("view"))
				{
					modelAndViewObj.setViewName("Inventory Manager/DayClose/viewSpecificDayCloseDetails");
				}
			    else
			    {
			    	modelAndViewObj.setViewName("Inventory Manager/DayClose/editDayClose");
			    }
				
				
				
		
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}


		
		

	/**
	 * 
	 * @author Manasa.P
	 * createdDate:24-04-2017
	 *This method is used to update the existing day open Details
	 *
	 **/


	@RequestMapping(value="/updateOutletDayClose",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView updateOutletDayClose(@RequestBody OutletDayClose outletDayClose,HttpServletRequest request,HttpServletResponse response){

	OutletDayCloseResponse outletDayCloseresponse = null;
	List<String> countersList = null;
		try{
		
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr=outletNotificataionServiceObj.updateOutletDayClose(outletDayClose, customerIdStr, emailIdStr);
			String location = (String)request.getSession().getAttribute("selectedLocation");
			List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
			if(location == null)
				location = workLocationsList.get(0);
			if(location != null && !location.equals(""))
				request.getSession().setAttribute("selectedLocation", location);
			List<Counter> counterDetails = adminServiceObj.getCounters("","",customerIdStr,emailIdStr,"0",false,"-1","");
			String counterListStr="";
			List<String> counterDetailslist = new ArrayList<String>();
				for(int i=0;i<counterDetails.size();i++)
				{
					counterListStr=counterDetails.get(i).getCounterName(); 
					counterDetailslist.add(counterListStr);
					//////////System.out.println(i);
				//	////////System.out.println(empList1);
				}
				//countersList = reportsServiceObj.getCounters(location,customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
				modelAndViewObj.addObject("counterDetails", countersList);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("counterDetails", counterDetailslist);
			
			
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("Day_Close_update_Success").trim())){
			
				modelAndViewObj.addObject("err", resultStr);
				//modelAndViewObj.addObject("type", "new");
				
			}else{
				modelAndViewObj.addObject("success", resultStr);
				outletDayCloseresponse = outletNotificataionServiceObj.viewOutletDayCloseDetails(customerIdStr,emailIdStr,outletDayClose.getBusinessCounter(),outletDayClose.getOutletLocation(),"0","");
				modelAndViewObj.addObject("outletDayCloseresponse",outletDayCloseresponse.getOutletDayCloseObj());
				modelAndViewObj.setViewName("Inventory Manager/DayClose/editDayClose");
			}
		}catch(Exception exception){
			exception.printStackTrace();
		}
		
		
		return modelAndViewObj;
	}




	/**
	 * 
	 * @author Manasa.P
	 * 
	 *This method is used to delete the day close details
	 *
	 **/


	@RequestMapping("/deleteDayClose")
	public ModelAndView deleteDayClose(@RequestParam("businessCounter") String businessCounter,@RequestParam("outletLocation") String outletLocation,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("deleteShoppingList ");
			String maxRecords="10";
			int start = 1,end = Integer.parseInt(maxRecords);
			String index="0";
			
			String resultStr = outletNotificataionServiceObj.deleteDayClose(businessCounter,outletLocation);
			modelAndViewObj =new ModelAndView();
			OutletDayCloseResponse  outletdayopenResponse = outletNotificataionServiceObj.getDayClose("","","-1",maxRecords,"");
			 
			modelAndViewObj.addObject("outletdayopenResponse", outletdayopenResponse.getOutletDayClose());

			if(outletdayopenResponse == null || outletdayopenResponse.getOutletDayClose()==null || outletdayopenResponse.getOutletDayClose().size()==0)
			{
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(outletdayopenResponse.getOutletDayClose().size()<Integer.parseInt(maxRecords)){
					end = (outletdayopenResponse.getOutletDayClose().size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", outletdayopenResponse.getTotalRecords());
				//////////System.out.println(outletdayopenResponse.getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
				//////////System.out.println("totalValue"+end);
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				//////////System.out.println(Integer.parseInt(maxRecords));
				modelAndViewObj.setViewName("Inventory Manager/DayClose/viewDayClose");
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}



@RequestMapping("/newverification")
public ModelAndView newverification(@RequestParam("flowUnder")String flowUnder,@RequestParam("verificationCode")String verificationCode,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("newstockverification");
		modelAndViewObj = new ModelAndView();
		List<String> locationsList = null;List<String> storageList = null;
		List<String> brandsList = adminServiceObj.getBrandNamesList("","");
		if(flowUnder.equals("outlet"))
		 locationsList = adminServiceObj.getOutletLocationsList("","",true);
		else
		 locationsList = adminServiceObj.getWarehouseLocationsList("", "", true);
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("brandsList", brandsList);
		modelAndViewObj.addObject("flowUnder",flowUnder);
		//storageList = storeStockVerificationServiceObj.getStorageUnit(customerIdStr,emailIdStr,locationStr);
		modelAndViewObj.addObject("masterverificationCode",verificationCode);
		modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/newVerification");
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}


@RequestMapping(value="/createVerification",method = RequestMethod.POST, consumes = "application/json")
public ModelAndView createVerification(@RequestBody StoreStockVerification finalobj, HttpServletRequest request,HttpServletResponse response)
{
	try{
		// log.info("createstockverification");
		modelAndViewObj = new ModelAndView();
		String resultStr=storeStockVerificationServiceObj.createVerification(finalobj);
		List<String> locationsList= null;
		modelAndViewObj.addObject("location",finalobj.getLocation());
		
		locationsList = adminServiceObj.getOutletLocationsList("","",true);
			
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("masterverificationCode",finalobj.getMasterVerificationCode());
		/*modelAndViewObj.addObject("enddate",finalobj.getEndDateStr());
		modelAndViewObj.addObject("approvedBy",finalobj.getApprovedBy());*/
		//modelAndViewObj.addObject("flowUnder",finalobj.getFlowUnder());
		//modelAndViewObj.addObject("flowUnder",flowUnder);
		//modelAndViewObj.addObject("selectedLocation",location);
		if(!resultStr.equals(AppProperties.getAppMessageByProperty("STOCK_VERIFICATION_CREATION_SUCCESS").trim())){
			modelAndViewObj.addObject("err", resultStr);
			modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/newVerification");
		}else{
			// log.info("successed");
			//////////System.out.println("successed");
			modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/newVerification");
		}
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}





/**
	 * @author Manasa.P
	 *  Created On: 4-april-2017
	 * @param flowunder index,verificationCode,maxRecords,Request, Response
	 * Description: This method is used to view stockverification .
	 *  @return ModelAndView with stock verification master details
	 */
	@RequestMapping("/viewEditStockVerification")
	public ModelAndView viewEditStockVerification(@RequestParam("verificationCode") String verificationCode,@RequestParam("type") String type,/*@RequestParam("location") String location,@RequestParam("masterverificationCode") String masterverificationCode*/@RequestParam("index") String index,@RequestParam("maxRecords") String maxRecords,@RequestParam("flowUnder") String flowUnder,HttpServletRequest request,HttpServletResponse response) {
		List<WareHouseStockVerificationItems> stockVerificationItemDetailsList = null;
		String userIdStr = null,emailIdStr=null;
		List<String> locationsList = null;
		List<String> storageList = null;
		try{
			// log.info("viewSpecificStockVerification");
			//////////System.out.println("details");
			userIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			StoreStockVerification verificationObj = null;
			locationsList = adminServiceObj.getOutletLocationsList(userIdStr,emailIdStr,true);
			//storageList = storeStockVerificationServiceObj.getStorageUnit(userIdStr,emailIdStr,"");
				verificationObj = storeStockVerificationServiceObj.getProductDetails(userIdStr,emailIdStr,verificationCode,"0",maxRecords);
			/*else
				verificationObj = storeStockVerificationServiceObj.getWarehouseProductVerificationDetails(userIdStr,emailIdStr,verificationCode,index,maxRecords);
				*/
		
			/*if(location != null && !location.equals(""))
				request.getSession().setAttribute("selectedLocation",location);*/
			//modelAndViewObj.addObject("masterverificationCode", masterverificationCode);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("storageList", storageList);
			modelAndViewObj.addObject("verificationcode", verificationCode);
			modelAndViewObj.addObject("flowUnder", flowUnder);
			//modelAndViewObj.addObject("selectedLocation",location);
			modelAndViewObj.addObject("productStockVerificationItemDetailsList",verificationObj.getStockVerificationObj());
			if(type.equals("view"))
			modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/viewEditStockverification");
			else
				modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/editStockVerification");	
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",Utilities.getResponseCode("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/allverifiedproductstocks");
		}
		return modelAndViewObj;
	}
	


@RequestMapping(value="/updateVerification",method = RequestMethod.POST, consumes = "application/json")
public ModelAndView updateVerification(@RequestBody StoreStockVerification whverificationobj,HttpServletRequest request,HttpServletResponse response){
	StoreStockVerification verificationObj=null;
List<WareHouseStockVerificationItems> stockVerificationItemDetailsList = null;
	try{
	//////////System.out.println("update");
		modelAndViewObj = new ModelAndView();
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		String resultStr=storeStockVerificationServiceObj.updateVerification(whverificationobj);
		String location = (String)request.getSession().getAttribute("selectedLocation");
		List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
		if(location == null)
			location = workLocationsList.get(0);
		if(location != null && !location.equals(""))
			request.getSession().setAttribute("selectedLocation", location);
	
		modelAndViewObj.addObject("locationsList", workLocationsList);
		if(!resultStr.equals(AppProperties.getAppMessageByProperty("STOCK_VERIFICATION_CREATION_SUCCESS").trim())){
			modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.addObject("productStockVerificationItemDetailsList",whverificationobj.getStockVerificationObj());
			modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/editStockVerification");
			//modelAndViewObj.addObject("type", "new");
		}else{
			modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.addObject("productStockVerificationItemDetailsList",whverificationobj);
			modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/editStockVerification");
		}
	}catch(Exception exception){
		exception.printStackTrace();
	}
	
	
	return modelAndViewObj;
}










/**
 * @author Manasa.P
 *  Created On: 4-april-2017
 * @param flowunder index,verificationCode,maxRecords,Request, Response
 * Description: This method is used to view stockverification .
 *  @return ModelAndView with stock verification master details
 *  modified by vijay to on 21-08-2017 to implement stockSkverification report
 */


@RequestMapping("/viewWarehouseStockVerification")
public ModelAndView viewWarehouseStockVerification(@RequestParam("index") String index,
		@RequestParam("flowUnder") String flowUnder,
		@RequestParam("location") String location, 
		@RequestParam("searchName") String searchName, 
		@RequestParam("verificationCode") String verificationCode, 
		@RequestParam("startDate") String startDate,
		@RequestParam("endDate") String endDate,
		@RequestParam("zone") String zone ,
		@RequestParam("maxRecords") String maxRecords,
		@RequestParam("department") String department,
		@RequestParam("subdepartment") String subdepartment,
		@RequestParam("category") String category,
		@RequestParam("subcategory") String subcategory,
		@RequestParam("section") String section,
	HttpServletRequest request,HttpServletResponse response) {
	
	List<String> locationsList = null;
	List<WareHouseStockVerification> stockVerificationDetailsList = null;
	//List<String> locationsList = null;
	List<String> warehouselocationsList = null;
	try{
		// log.info("viewStockVerificationReport");
		int start = 1,end = Integer.parseInt(maxRecords);
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr  = (String)request.getSession().getAttribute("emailId");


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

		stockVerificationDetailsList = new ArrayList<WareHouseStockVerification>();
		if(flowUnder.equals("outlet")){
			stockVerificationDetailsList = storeStockVerificationServiceObj.getProductVerificationReport(customerIdStr,emailIdStr,location,searchName,index,startDate,endDate,maxRecords,flowUnder,verificationCode,category,subcategory,department,subdepartment);

			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
		}

		else{
			stockVerificationDetailsList = storeStockVerificationServiceObj.getProductVerificationReport(customerIdStr,emailIdStr,location,searchName,index,startDate,endDate,maxRecords,flowUnder,verificationCode,category,subcategory,department,subdepartment);
			locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
		}
		modelAndViewObj = new ModelAndView();
		
		modelAndViewObj.addObject("locationsList", locationsList);

		if(stockVerificationDetailsList == null || stockVerificationDetailsList.size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}
		else{
			if(stockVerificationDetailsList.size()<Integer.parseInt(maxRecords)){
				end = (stockVerificationDetailsList.size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			modelAndViewObj.addObject("totalRecords", Integer.parseInt(stockVerificationDetailsList.get(0).getTotalRecords()));
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
		}

		modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
		modelAndViewObj.addObject("startDate",startDate);
		modelAndViewObj.addObject("endDate",endDate);
		modelAndViewObj.addObject("flowUnder", flowUnder);
		modelAndViewObj.addObject("zone", zone);
		modelAndViewObj.addObject("searchName", searchName);
		modelAndViewObj.addObject("location", location);
		modelAndViewObj.addObject("department", department);
		modelAndViewObj.addObject("subdepartment", subdepartment);
		modelAndViewObj.addObject("category", category);
		modelAndViewObj.addObject("subcategory", subcategory);
		modelAndViewObj.addObject("section", section);
		modelAndViewObj.addObject("StockVerificationDetailsList",stockVerificationDetailsList);
		modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/stockVerificationReport");

	}catch(Exception e){
		e.printStackTrace();
		modelAndViewObj.addObject("err",Utilities.getResponseCode("CONTACT_ADMIN"));
		modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/allverifiedproductstocks");
	}
	return modelAndViewObj;

}

/*@author chaithanya
purpose: this method is used to filter items by certain filters*/
	@RequestMapping("/filteritems")
	public @ResponseBody List<ProductsList> filteritems(@RequestParam("category") String category,@RequestParam("subcategory") String subcategory,@RequestParam("section") String section,@RequestParam("brand") String brand,@RequestParam("department") String department,@RequestParam("subdepartment") String subdepartment,HttpServletRequest request,HttpServletResponse response){
			// log.info("filteritems");
			SearchProductResponse skuResponse =new SearchProductResponse();
			try {
				skuResponse = skuServiceObj.filterItemsByCriteria(category,subcategory,brand,section,department,subdepartment);
				
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return skuResponse.getSkuIdList();
	}
	/**
	 * @author vijay
	 * Verified By :
		 * @param indeX,flowunder,location, max records , verified by, start time,end time,verification code, status, verifiedon , verifiedUpto & zone along with receipt item details
    *  Description: This method is used to view stockverification report based on masters verification code
	 *   Created On: 22-august-2017
	 *   modified on 31-august-2017 
	 *   modified by : manasa
	              * added operation as param to know the view r edit       
    *  @return ModelAndView 
    */
	@RequestMapping("/viewOpenStockVerificationReport")
	public ModelAndView viewOpenStockVerificationReport(@RequestParam("index") String index,@RequestParam("flowUnder") String flowUnder,@RequestParam("location") String location,
			@RequestParam("maxRecords") String maxRecords,@RequestParam("verificationCode") String verificationCode,@RequestParam("status") String status,
			@RequestParam("startTimeStr") String startTimeStr,
			@RequestParam("endTimeStr") String endTimeStr,
			@RequestParam("verifiedOnStr") String verifiedOnStr,
			@RequestParam("verifiedUptoStr") String verifiedUptoStr,
			@RequestParam("verifiedBy") String verifiedBy,
			@RequestParam("zone") String zone,
			@RequestParam("operation") String operation,
			@RequestParam("masterVerificationcode") String masterVerificationcode,
			@RequestParam("formData") String formData,
			HttpServletRequest request,HttpServletResponse response) {
		List<String> locationsList = null;
		List<String> warehouselocationsList = null;
		List<WareHouseStockVerificationItems> stockVerificationItemDetailsList = null;

		//List<WareHouseStockVerificationItems> stockVerificationDetailsList = null;
		StoreStockVerification verificationObj=null;
		WareHouseStockVerification verificationObjWarehouse=null;
		//List<WareHouseStockVerification> stockVerificationDetailsList=null;
		modelAndViewObj = new ModelAndView();
		try{
			// log.info("viewStockVerificationreport-open");
			int start = 1,end = Integer.parseInt(maxRecords);
			
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr  = (String)request.getSession().getAttribute("emailId");
			if(flowUnder.equals("outlet")){
				/*verificationObj = storeStockVerificationServiceObj.getProductVerificationReportOpen(customerIdStr,emailIdStr,location,"",index,"","","",flowUnder,verificationCode);
				 * */
				verificationObj = storeStockVerificationServiceObj.getProductDetails(customerIdStr,emailIdStr,verificationCode,index,maxRecords);
				locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
				
				if(verificationObj.getStockVerificationObj().getItemsList() == null ){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(verificationObj.getStockVerificationObj().getItemsList().size()<Integer.parseInt(maxRecords)){
						end = (verificationObj.getStockVerificationObj().getItemsList().size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(verificationObj.getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
				}
				modelAndViewObj.addObject("productStockOpenVerificationDetailsList",verificationObj.getStockVerificationObj());
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(verificationObj.getTotalRecords()));
				
			}else{
				verificationObjWarehouse = storeStockVerificationServiceObj.getProductDetailsWarehouse(customerIdStr,emailIdStr,verificationCode,"0",maxRecords);
				locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr,emailIdStr,true);
				
				if(verificationObjWarehouse.getVerificationList().get(0).getItemsList() == null ){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(verificationObjWarehouse.getVerificationList().get(0).getItemsList().size()<Integer.parseInt(maxRecords)){
						end = (verificationObjWarehouse.getVerificationList().get(0).getItemsList().size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(verificationObjWarehouse.getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
				}
				modelAndViewObj.addObject("productStockOpenVerificationDetailsList",verificationObjWarehouse.getVerificationList().get(0));
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(verificationObjWarehouse.getTotalRecords()));
			}
			
			/*if(verificationObj != null && verificationObj.getWarehouseStockVerification() != null){
				stockVerificationItemDetailsList = verificationObj.getWarehouseStockVerification().getItemsList();
			}*/
			
			
			
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,index,"","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			
			if(flowUnder.equals("outlet")){
				locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			}
				
			else{
				locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
				//locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			}
			
				
				modelAndViewObj.addObject("locationsList", locationsList);
				
				
		
				//added by manasa 
				Verification verifiObj=gson.fromJson(formData, Verification.class);
					modelAndViewObj.addObject("verifiObj",verifiObj);
				
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				
				modelAndViewObj.addObject("location",location);
				modelAndViewObj.addObject("flowUnder", flowUnder);
				modelAndViewObj.addObject("status", status);
				modelAndViewObj.addObject("verified_by", verifiedBy);
				modelAndViewObj.addObject("startTimeStr", startTimeStr);
				modelAndViewObj.addObject("endTimeStr", endTimeStr);
				modelAndViewObj.addObject("verifiedOnStr", verifiedOnStr);
				modelAndViewObj.addObject("verifiedUptoStr", verifiedUptoStr);
				modelAndViewObj.addObject("zone", zone);
				modelAndViewObj.addObject("masterVerificationcode", masterVerificationcode);
				modelAndViewObj.addObject("locationsList",locationsList);
				modelAndViewObj.addObject("zoneList",zoneList);
				
				modelAndViewObj.addObject("verificationCode",verificationCode);
				//modified by manasa
				if(operation.equalsIgnoreCase("view"))
				modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/viewOpenStockVerificationReport");
				else
					modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/editWriteoffStockVerificationReport");	
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/viewOpenStockVerificationReport");
		}
		return modelAndViewObj;
	}

	
	
	@RequestMapping("/viewOpenVerificationforPagination")
	public ModelAndView viewOpenVerificationforPagination(@RequestParam("index") String index,@RequestParam("flowUnder") String flowUnder,@RequestParam("location") String location,
			@RequestParam("maxRecords") String maxRecords,@RequestParam("verificationCode") String verificationCode,@RequestParam("status") String status,
			@RequestParam("startTimeStr") String startTimeStr,
			@RequestParam("endTimeStr") String endTimeStr,
			@RequestParam("verifiedOnStr") String verifiedOnStr,
			@RequestParam("verifiedUptoStr") String verifiedUptoStr,
			@RequestParam("verifiedBy") String verifiedBy,
			@RequestParam("zone") String zone,
			@RequestParam("operation") String operation,
			@RequestParam("masterVerificationcode") String masterVerificationcode,
			@RequestParam("formData") String formData,
			HttpServletRequest request,HttpServletResponse response) {
		List<String> locationsList = null;
		List<String> warehouselocationsList = null;
		List<WareHouseStockVerificationItems> stockVerificationItemDetailsList = null;

		//List<WareHouseStockVerificationItems> stockVerificationDetailsList = null;
		StoreStockVerification verificationObj=null;
		List<StoreStockVerificationItems> items=null;
		//List<WareHouseStockVerification> stockVerificationDetailsList=null;
		try{
			// log.info("viewStockVerificationreport-open");
			int start = 1,end = Integer.parseInt(maxRecords);
			
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr  = (String)request.getSession().getAttribute("emailId");
			if(flowUnder.equals("outlet")){
				/*verificationObj = storeStockVerificationServiceObj.getProductVerificationReportOpen(customerIdStr,emailIdStr,location,"",index,"","","",flowUnder,verificationCode);
				 * */
				verificationObj = storeStockVerificationServiceObj.getProductDetails(customerIdStr,emailIdStr,verificationCode,index,maxRecords);
				locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			}
			
			if(flowUnder.equals("outlet")){
				locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			}
				
			else{
				warehouselocationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
				locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			}
			
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("locationsList", locationsList);
				
				if(verificationObj.getStockVerificationObj().getItemsList() == null ){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(verificationObj.getStockVerificationObj().getItemsList().size()<Integer.parseInt(maxRecords)){
						end = (verificationObj.getStockVerificationObj().getItemsList().size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(verificationObj.getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
				}
				//added by manasa 
				Verification verifiObj=gson.fromJson(formData, Verification.class);
					modelAndViewObj.addObject("verifiObj",verifiObj);
				
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.addObject("productStockOpenVerificationDetailsList",verificationObj.getStockVerificationObj());
				modelAndViewObj.addObject("location",location);
				modelAndViewObj.addObject("flowUnder", flowUnder);
				modelAndViewObj.addObject("status", status);
				modelAndViewObj.addObject("verified_by", verifiedBy);
				modelAndViewObj.addObject("startTimeStr", startTimeStr);
				modelAndViewObj.addObject("endTimeStr", endTimeStr);
				modelAndViewObj.addObject("verifiedOnStr", verifiedOnStr);
				modelAndViewObj.addObject("verifiedUptoStr", verifiedUptoStr);
				modelAndViewObj.addObject("zone", zone);
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(verificationObj.getTotalRecords()));
				modelAndViewObj.addObject("masterVerificationcode", masterVerificationcode);
				modelAndViewObj.addObject("locationsList",locationsList);
//				modelAndViewObj.addObject("zoneList",zoneList);
				
				modelAndViewObj.addObject("verificationCode",verificationCode);
				//modified by manasa
				if(operation.equalsIgnoreCase("view"))
				modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/viewOpenVerificationItems");
				else
					modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/editWriteoffStockVerificationReport");	
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/viewOpenStockVerificationReport");
		}
		return modelAndViewObj;
	}

	
	

	/**
	 * @author vijay
	 * Verified By :
		 * @param indeX,flowunder,location, max records , verified by, start time,end time,verification code, status, verifiedon , verifiedUpto & zone along with receipt item details
    *  Description: This method is used to view stockverification report based on masters verification code
	 *   Created On: 22-august-2017
	 *   modified on 31-august-2017 
	 *   modified by : manasa
	              * added operation as param to know the view r edit       
    *  @return ModelAndView 
    *//*
	@RequestMapping("/viewEditWriteOffStockVerificationReport")
	public ModelAndView viewEditWriteOffStockVerificationReport(@RequestParam("index") String index,@RequestParam("flowUnder") String flowUnder,@RequestParam("location") String location,
			@RequestParam("maxRecords") String maxRecords,@RequestParam("verificationCode") String verificationCode,@RequestParam("status") String status,
			@RequestParam("startTimeStr") String startTimeStr,
			@RequestParam("endTimeStr") String endTimeStr,
			@RequestParam("verifiedOnStr") String verifiedOnStr,
			@RequestParam("verifiedUptoStr") String verifiedUptoStr,
			@RequestParam("verifiedBy") String verifiedBy,
			@RequestParam("zone") String zone,
			@RequestParam("operation") String operation,
			@RequestParam("formData") String formData,
			HttpServletRequest request,HttpServletResponse response) {
		List<String> locationsList = null;
		List<String> warehouselocationsList = null;
		List<WareHouseStockVerification> stockVerificationDetailsList = null;
		
		try{
			// log.info("viewStockVerificationreport-open");
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr  = (String)request.getSession().getAttribute("emailId");
			if(flowUnder.equals("outlet")){
				stockVerificationDetailsList = storeStockVerificationServiceObj.getProductVerificationReportWriteOff(customerIdStr,emailIdStr,location,"",index,"","","",flowUnder,verificationCode);
				locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			}
			
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,index);
				request.getSession().setAttribute("zoneList", zoneList);
			}
			
			
			
			if(flowUnder.equals("outlet")){
				locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			}
				
			else{
				warehouselocationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
				locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			}
			
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("locationsList", locationsList);
				
				if(stockVerificationDetailsList == null || stockVerificationDetailsList.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(stockVerificationDetailsList.size()<Integer.parseInt(maxRecords)){
						end = (stockVerificationDetailsList.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(stockVerificationDetailsList.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
				}
		
				//added by manasa 
				Verification verifiObj=gson.fromJson(formData, Verification.class);
					modelAndViewObj.addObject("verifiObj",verifiObj);
				
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.addObject("productStockOpenVerificationDetailsList",stockVerificationDetailsList);
				modelAndViewObj.addObject("location",location);
				modelAndViewObj.addObject("flowUnder", flowUnder);
				modelAndViewObj.addObject("status", status);
				modelAndViewObj.addObject("verified_by", verifiedBy);
				modelAndViewObj.addObject("startTimeStr", startTimeStr);
				modelAndViewObj.addObject("endTimeStr", endTimeStr);
				modelAndViewObj.addObject("verifiedOnStr", verifiedOnStr);
				modelAndViewObj.addObject("verifiedUptoStr", verifiedUptoStr);
				modelAndViewObj.addObject("zone", zone);
				
				
				
				modelAndViewObj.addObject("verificationCode",verificationCode);
				//modified by manasa
				if(operation.equalsIgnoreCase("view"))
				modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/viewOpenStockVerificationReport");
				else
					modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/editWriteoffStockVerificationReport");	
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/viewOpenStockVerificationReport");
		}
		return modelAndViewObj;
	}
*/
	
	
	/*below code is for f&b*/

	/* Menu Functionalitities */

	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display the menus based on outlet in a tabular format 
	 *
	 **//*
	@RequestMapping("/menuConfigurations")
	public ModelAndView menuConfigurations(HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("menuConfigurations");
			String locationStr = "";
			List<MenuDetails> menuDetailsList = new ArrayList<MenuDetails>();
			String outlet_name = null;
			String customerId = request.getSession().getAttribute("customerId").toString();
			String emailId = request.getSession().getAttribute("emailId").toString();
			Map<String,Object> storesListMap = storeServiceObj.getStoresList(customerId, emailId,locationStr,"-1", "10");
			@SuppressWarnings("unchecked")
			List<OutletInfo> storeList = (List<OutletInfo>)storesListMap.get("storeDetailsList");
			if(storeList != null && storeList.size() != 0){
				outlet_name =  storeList.get(0).getLocation();
				menuDetailsList = menuServiceObj.getMenuDetails(outlet_name, customerId, emailId,"",false);
			}
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("storesList", storeList);
			modelAndViewObj.addObject("selectedStore", outlet_name);
			modelAndViewObj.addObject("menuDetailsList", menuDetailsList);
			modelAndViewObj.setViewName("Inventory Manager/menu/menu");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	
	
	
	
	*//**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display the menu categories based on outlet in a tabular format 
	 *
	 **//*
	@RequestMapping("/searchMenuCategories")
	public ModelAndView searchMenuCategories(@RequestParam("outlet_name") String outlet_name,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("getMenuCategories");
			String locationStr = "";
			String customerId = request.getSession().getAttribute("customerId").toString();
			String emailId = request.getSession().getAttribute("emailId").toString();
			Map<String,Object> storesListMap = storeServiceObj.getStoresList(customerId, emailId,locationStr,"-1","10");
			@SuppressWarnings("unchecked")
			List<OutletInfo> storeList = (List<OutletInfo>)storesListMap.get("storeDetailsList");
			if(outlet_name == null || outlet_name == ""){
				if(storeList.size() != 0)
					outlet_name = storeList.get(0).getLocation();
			}
			List<MenuDetails> menuDetailsList = menuServiceObj.getMenuDetails(outlet_name, customerId, emailId,searchName,true);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("storesList", storeList);
			modelAndViewObj.addObject("selectedStore", outlet_name);
			modelAndViewObj.addObject("menuDetailsList", menuDetailsList);
			modelAndViewObj.setViewName("Inventory Manager/menu/menuCategories");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	
	*//**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display the menu categories based on outlet in a tabular format 
	 *
	 **//*
	@RequestMapping("/searchMenuCategoriesinMenuItem")
	public ModelAndView searchMenuCategoriesinMenuItem(@RequestParam("outlet_name") String outlet_name,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("getMenuCategories");
			String locationStr = "";
			String customerId = request.getSession().getAttribute("customerId").toString();
			String emailId = request.getSession().getAttribute("emailId").toString();
			Map<String,Object> storesListMap = storeServiceObj.getStoresList(customerId, emailId,locationStr,"-1","10");
			@SuppressWarnings("unchecked")
			List<OutletInfo> storeList = (List<OutletInfo>)storesListMap.get("storeDetailsList");
			if(outlet_name == null || outlet_name == ""){
				if(storeList.size() != 0)
					outlet_name = storeList.get(0).getLocation();
			}
			List<MenuDetails> menuDetailsList = menuServiceObj.getMenuDetails(outlet_name, customerId, emailId,searchName,true);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("storesList", storeList);
			modelAndViewObj.addObject("selectedStore", outlet_name);
			modelAndViewObj.addObject("menuDetailsList", menuDetailsList);
			modelAndViewObj.setViewName("Inventory Manager/menu/menuItems");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
		
	*//**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display the menu categories based on outlet in a tabular format 
	 *
	 **//*
	@RequestMapping("/getMenuCategories")
	public ModelAndView getMenuCategories(@RequestParam("outlet_name") String outlet_name, HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("getMenuCategories");
			String locationStr = "";
			String customerId = request.getSession().getAttribute("customerId").toString();
			String emailId = request.getSession().getAttribute("emailId").toString();
			Map<String,Object> storesListMap = storeServiceObj.getStoresList(customerId, emailId,locationStr,"-1","10");
			@SuppressWarnings("unchecked")
			List<OutletInfo> storeList = (List<OutletInfo>)storesListMap.get("storeDetailsList");
			if(outlet_name == null || outlet_name == ""){
				if(storeList.size() != 0)
					outlet_name = storeList.get(0).getLocation();
			}
			List<MenuDetails> menuDetailsList = menuServiceObj.getMenuDetails(outlet_name, customerId, emailId,"",false);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("storesList", storeList);
			modelAndViewObj.addObject("selectedStore", outlet_name);
			modelAndViewObj.addObject("menuDetailsList", menuDetailsList);
			modelAndViewObj.setViewName("Inventory Manager/menu/menuCategories");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
*/

	
	
	/*below code is for f&b*/

	/* Menu Functionalitities */

	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display the menus based on outlet in a tabular format 
	 *
	 **/
	@RequestMapping("/menuConfigurations")
	public ModelAndView menuConfigurations(HttpServletRequest request,HttpServletResponse response){
		String locationListAll="";
		try{
			// log.info("menuConfigurations");
			String locationStr = "";
			List<String> locationsList = null;
			List<OutletInfo> storeList = null;
			List<MenuDetails> menuDetailsList = new ArrayList<MenuDetails>();
			String outlet_name = null;
			String customerId = request.getSession().getAttribute("customerId").toString();
			String emailId = request.getSession().getAttribute("emailId").toString();
			
			
			
			Map<String,Object> storesListMap = storeServiceObj.getStoresList(customerId, emailId,locationStr,"-1", "10");
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
						menuDetailsList = menuServiceObj.getMenuDetails(locationListAll, customerId, emailId,"",false);
					}
					
			

					
//	  			}
			
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("storesList", storeList);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("selectedStore", outlet_name);
			modelAndViewObj.addObject("menuDetailsList", menuDetailsList);
			//modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.setViewName("Inventory Manager/menu/menu");
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
	 *This method is used to display the menu categories based on outlet in a tabular format 
	 *
	 **/
	@RequestMapping("/searchMenuCategories")
	public ModelAndView searchMenuCategories(@RequestParam("outlet_name") String outlet_name,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
		String locationListAll="";
		try{
			// log.info("getMenuCategories");
			String locationStr = "";
			String customerId = request.getSession().getAttribute("customerId").toString();
			String emailId = request.getSession().getAttribute("emailId").toString();
			Map<String,Object> storesListMap = storeServiceObj.getStoresList(customerId, emailId,locationStr,"-1","10");
			@SuppressWarnings("unchecked")
			List<OutletInfo> storeList = (List<OutletInfo>)storesListMap.get("storeDetailsList");
			/*if(outlet_name == null || outlet_name == ""){
				if(storeList.size() != 0)
					outlet_name = storeList.get(0).getLocation();
			}*/
			
			 List<String> locationsListValue=new ArrayList<String>();
	  			if(outlet_name.equals("all")|| outlet_name.equals("")){
					if(storeList != null){
							for(int i=0;i<storeList.size();i++){
								locationsListValue.add(storeList.get(i).getLocation());
							}
				
						for (String string : locationsListValue) {
							locationListAll = locationListAll+string+",";
						}
					}
//	  			}
	  			}
	  			else
	  			{
	  				locationListAll=outlet_name;
	  			}
			List<MenuDetails> menuDetailsList = menuServiceObj.getMenuDetails(locationListAll, customerId, emailId,searchName,true);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("storesList", storeList);
			modelAndViewObj.addObject("selectedStore", outlet_name);
			modelAndViewObj.addObject("searchName", searchName);
			modelAndViewObj.addObject("menuDetailsList", menuDetailsList);
			modelAndViewObj.setViewName("Inventory Manager/menu/menuCategories");
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
	 *This method is used to display the menu categories based on outlet in a tabular format 
	 *
	 **/
	@RequestMapping("/searchMenuCategoriesinMenuItem")
	public ModelAndView searchMenuCategoriesinMenuItem(@RequestParam("outlet_name") String outlet_name,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
	String locationListAll = "";
		try{
			// log.info("getMenuCategories");
			String locationStr = "";
			String customerId = request.getSession().getAttribute("customerId").toString();
			String emailId = request.getSession().getAttribute("emailId").toString();
			Map<String,Object> storesListMap = storeServiceObj.getStoresList(customerId, emailId,locationStr,"-1","10");
			@SuppressWarnings("unchecked")
			List<OutletInfo> storeList = (List<OutletInfo>)storesListMap.get("storeDetailsList");
			/*if(outlet_name == null || outlet_name == ""){
				if(storeList.size() != 0)
					outlet_name = storeList.get(0).getLocation();
			}*/
			 List<String> locationsListValue=new ArrayList<String>();
	  			if(outlet_name.equals("all")|| outlet_name.equals("")){
					if(storeList != null){
							for(int i=0;i<storeList.size();i++){
								locationsListValue.add(storeList.get(i).getLocation());
							}
				
						for (String string : locationsListValue) {
							locationListAll = locationListAll+string+",";
						}
					}
//	  			}
	  			}
	  			else
	  			{
	  				locationListAll=outlet_name;
	  			}
			
			List<MenuDetails> menuDetailsList = menuServiceObj.getMenuDetails(locationListAll, customerId, emailId,searchName,true);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("storesList", storeList);
			modelAndViewObj.addObject("selectedStore", outlet_name);
			modelAndViewObj.addObject("menuDetailsList", menuDetailsList);
			modelAndViewObj.setViewName("Inventory Manager/menu/menuItems");
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
	 *This method is used to display the menu categories based on outlet in a tabular format 
	 *
	 **/
	@RequestMapping("/getMenuCategories")
	public ModelAndView getMenuCategories(@RequestParam("outlet_name") String outlet_name, HttpServletRequest request,HttpServletResponse response){
		String locationListAll="";
		try{
			// log.info("getMenuCategories");
			String locationStr = "";
			List<OutletInfo> storeList = null;
			List<String> locationsList = null;
			Map<String,Object> storesListMap = null;
			String customerId = request.getSession().getAttribute("customerId").toString();
			String emailId = request.getSession().getAttribute("emailId").toString();
			
			modelAndViewObj = new ModelAndView();
			
			
				 storesListMap = storeServiceObj.getStoresList(customerId, emailId,locationStr,"-1","10");
				 storeList = (List<OutletInfo>)storesListMap.get("storeDetailsList");
				// log.info(outlet_name);
				 List<String> locationsListValue=new ArrayList<String>();
		  			if(outlet_name.equals("all")|| outlet_name.equals("")){
						if(storeList != null){
								for(int i=0;i<storeList.size();i++){
									locationsListValue.add(storeList.get(i).getLocation());
								}
					
							for (String string : locationsListValue) {
								locationListAll = locationListAll+string+",";
							}
						}
		  			}
		  			else
		  				locationListAll=outlet_name;
		  			
		  			modelAndViewObj.addObject("storesList", storeList);
			
			
			/*if(outlet_name == null || outlet_name == ""){
				if(storeList.size() != 0)
					outlet_name = storeList.get(0).getLocation();
			}*/
			List<MenuDetails> menuDetailsList = menuServiceObj.getMenuDetails(locationListAll, customerId, emailId,"",false);
			
			
			modelAndViewObj.addObject("selectedStore", outlet_name);
			modelAndViewObj.addObject("menuDetailsList", menuDetailsList);
			modelAndViewObj.setViewName("Inventory Manager/menu/menuCategories");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}

	@RequestMapping("/getCategoryDetailsBasedOnCategory")
	public @ResponseBody List<MenuItems> getCategoryDetailsBasedOnCategory(@RequestParam("categoryName") String categoryName,@RequestParam("menu_name")String menu_name,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<MenuItems> menuitems = new ArrayList<MenuItems>();
		try{
			// log.info("getShipmentNoteItems");
			String customerId = request.getSession().getAttribute("customerId").toString();
			String emailId = request.getSession().getAttribute("emailId").toString();
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			MenuDetails menuDetailsList = menuServiceObj.getCategoryDetailsBasedOnCategory(menu_name,categoryName, customerId, emailId);
			for(MenuCategory zone :menuDetailsList.getMenuCategories()){
				if(zone.getMenuItemsList()!=null && zone.getMenuItemsList().size()>0){
					for(MenuItems details : zone.getMenuItemsList()){
//						if(details.getLocationType() == "Retail outlet")
						menuitems.add(details);
					}
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return menuitems;
	}
	
	/*@RequestMapping("/getCategoryDetailsBasedOnCategory")
	public @ResponseBody List<MenuItems> getCategoryDetailsBasedOnCategory(@RequestParam("categoryName") String categoryName,@RequestParam("menu_name")String menu_name,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<MenuItems> menuitems = new ArrayList<MenuItems>();
		try{
			// log.info("getShipmentNoteItems");
			String customerId = request.getSession().getAttribute("customerId").toString();
			String emailId = request.getSession().getAttribute("emailId").toString();
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			MenuDetails menuDetailsList = menuServiceObj.getCategoryDetailsBasedOnCategory(menu_name,categoryName, customerId, emailId);
			for(MenuCategory zone :menuDetailsList.getMenuCategories()){
				if(zone.getMenuItemsList()!=null && zone.getMenuItemsList().size()>0){
					for(MenuItems details : zone.getMenuItemsList()){
//						if(details.getLocationType() == "Retail outlet")
						menuitems.add(details);
					}
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return menuitems;
	}
	*/
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display the menu names in drop downs
	 *
	 **/
	@RequestMapping("/getMenuNames")
	public @ResponseBody List<MenuDetails> getMenuNames(@RequestParam("outlet_name") String outlet_name, HttpServletRequest request,HttpServletResponse response){
		List<MenuDetails> menuDetailsList = new ArrayList<MenuDetails>();
		try{
			// log.info("getMenuNames");
			String customerId = request.getSession().getAttribute("customerId").toString();
			String emailId = request.getSession().getAttribute("emailId").toString();
			menuDetailsList = menuServiceObj.getMenuDetails(outlet_name, customerId, emailId,"",false);
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return menuDetailsList;
	}
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display the category names in the drop downs
	 *
	 **/
	@RequestMapping("/getMenuCategoryNames")
	public @ResponseBody List<String> getMenuCategoryNames(@RequestParam("menu_name") String menu_name,@RequestParam("outlet_name") String outlet_name, HttpServletRequest request, HttpServletResponse response){
		List<String> menuCategoryNamesList = new ArrayList<String>();
		try{
			// log.info("getMenuCategoryNames");
			String customerId = request.getSession().getAttribute("customerId").toString();
			String emailId = request.getSession().getAttribute("emailId").toString();
			menuCategoryNamesList = menuServiceObj.getMenuCategoriesNames(menu_name,outlet_name, customerId, emailId);
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return menuCategoryNamesList;
	}

	/**
	 * 
	 * @author Mythri.S
	 * 
	 *	This method is used to display the menu items based on outlet in a tabular format 
	 *
	 **/
	@RequestMapping("/getMenuItems")
	public ModelAndView getMenuItems(@RequestParam("outlet_name") String outlet_name, HttpServletRequest request,HttpServletResponse response){
		String locationListAll="";
		try{
			// log.info("getMenuItems");
			List<OutletInfo> storeList = null;
			List<String> locationsList = null;
			Map<String,Object> storesListMap = null;
			String locationStr = "";
			String customerId = request.getSession().getAttribute("customerId").toString();
			String emailId = request.getSession().getAttribute("emailId").toString();
			modelAndViewObj = new ModelAndView();
		
			 storesListMap = storeServiceObj.getStoresList(customerId, emailId,locationStr,"-1","10");
			 storeList = (List<OutletInfo>)storesListMap.get("storeDetailsList");
			// log.info(outlet_name);
			 List<String> locationsListValue=new ArrayList<String>();
	  			if(outlet_name.equals("all")|| outlet_name.equals("")){
					if(storeList != null){
							for(int i=0;i<storeList.size();i++){
								locationsListValue.add(storeList.get(i).getLocation());
							}
				
						for (String string : locationsListValue) {
							locationListAll = locationListAll+string+",";
						}
					}
	  			}
	  			else
	  				locationListAll=outlet_name;
	  		
	  			
	  			modelAndViewObj.addObject("storesList", storesListMap.get("storeDetailsList"));
	  			
		
			/*if(outlet_name == null || outlet_name == ""){
				if(storeList.size() != 0)
					outlet_name = storeList.get(0).getLocation();
			}*/
		//  MenuDetails  menuDetailsList = menuServiceObj.getitems("",outlet_name, customerId, emailId);
			List<MenuDetails> menuDetailsList = menuServiceObj.getMenuDetails(locationListAll, customerId, emailId,"",false);
			
			modelAndViewObj.addObject("selectedStore", outlet_name);
			modelAndViewObj.addObject("menuDetailsList", menuDetailsList);
			modelAndViewObj.setViewName("Inventory Manager/menu/menuItems");
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
	 *This method is used to display the new menu form 
	 *
	 **/
	@RequestMapping("/newMenuCategory")
	public ModelAndView newMenuCategory(@RequestParam("outlet_name") String outlet_name,HttpServletRequest request,HttpServletResponse response){
		try{
			String locationStr = "";
			// log.info("newMenuCategory");
			String customerId = request.getSession().getAttribute("customerId").toString();
			String emailId = request.getSession().getAttribute("emailId").toString();
			modelAndViewObj = new ModelAndView();
Map<String,Object> storesListMap = storeServiceObj.getStoresList(customerId, emailId,locationStr,"-1","10");
			
			
			@SuppressWarnings("unchecked")
			List<OutletInfo> storeList = (List<OutletInfo>)storesListMap.get("storeDetailsList");
			
			
	  			modelAndViewObj.addObject("storesList", storeList);		modelAndViewObj.addObject("selectedStore", outlet_name);
			modelAndViewObj.addObject("storesList", storeList);
			modelAndViewObj.setViewName("Inventory Manager/menu/newMenu");
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
	 *This method is used to display the new menu items form 
	 *
	 **/
	@RequestMapping("/newMenuItems")
	public ModelAndView newMenuItems(@RequestParam("outlet_name") String outlet_name,HttpServletRequest request,HttpServletResponse response){
		List<String> menuCategoryNamesList = new ArrayList<String>();
		List<MenuDetails> menuDetailsList = new ArrayList<MenuDetails>();
		String locationListAll ="";
		List<String> locationsList = null;
		try{
			String locationStr = "";
			// log.info("newMenuItems");
			String customerId = request.getSession().getAttribute("customerId").toString();
			String emailId = request.getSession().getAttribute("emailId").toString();
			modelAndViewObj = new ModelAndView();
			
			
			Map<String,Object> storesListMap = storeServiceObj.getStoresList(customerId, emailId,locationStr,"-1","10");
			
			
			@SuppressWarnings("unchecked")
			List<OutletInfo> storeList = (List<OutletInfo>)storesListMap.get("storeDetailsList");
			
			 List<String> locationsListValue=new ArrayList<String>();
	  			if(outlet_name.equals("all")|| outlet_name.equals("")){
					if(storeList != null){
							for(int i=0;i<storeList.size();i++){
								locationsListValue.add(storeList.get(i).getLocation());
							}
				
						for (String string : locationsListValue) {
							locationListAll = locationListAll+string+",";
						}
					}
	  			}
	  			modelAndViewObj.addObject("storesList", storeList);
			
			menuDetailsList = menuServiceObj.getMenuDetails(locationListAll, customerId, emailId,"",false);
			if( menuDetailsList != null && menuDetailsList.size() != 0){
				menuCategoryNamesList = menuServiceObj.getMenuCategoriesNames(menuDetailsList.get(0).getMenu_name(),locationListAll, customerId, emailId);
			}
			
			modelAndViewObj.addObject("menuDetailsList", menuDetailsList);
			modelAndViewObj.addObject("menuCategoryNamesList", menuCategoryNamesList);
			modelAndViewObj.addObject("selectedStore", outlet_name);
			modelAndViewObj.setViewName("Inventory Manager/menu/newMenuItems");
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
	 *This method is used to create menu and display the response 
	 *
	 **/

	@RequestMapping(value="/createMenu",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createMenu(@RequestBody MenuDetails menuObj,HttpServletRequest request,HttpServletResponse response){
		try{
			String locationStr = "";
			// log.info("createMenu");
			// log.info(menuObj.getMenu_category_details().size());
			String customerId = request.getSession().getAttribute("customerId").toString();
			String emailId = request.getSession().getAttribute("emailId").toString();
			String result = menuServiceObj.createMenu(menuObj,customerId,emailId);
			Map<String,Object> storesListMap = storeServiceObj.getStoresList(customerId, emailId,locationStr,"-1","10");
			modelAndViewObj = new ModelAndView();
			//modelAndViewObj.addObject("err",result);
			if(!result.equals(AppProperties.getAppMessageByProperty("CREATE_MENU_SUCCESS").trim())){
				modelAndViewObj.addObject("err", result);
				modelAndViewObj.addObject("menuDetailsList", menuObj);
			}else
				modelAndViewObj.addObject("success", result);
			
			modelAndViewObj.addObject("storesList", storesListMap.get("storeDetailsList"));
			modelAndViewObj.addObject("selectedStore", menuObj.getOutlet_name());
//			////////System.out.println("fhfh"+menuObj.getOutlet_name());
			modelAndViewObj.setViewName("Inventory Manager/menu/newMenu");
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
	 *This method is used to add items to a newly created menu and display the response 
	 *
	 **/

	@RequestMapping(value="/addItemsToMenu",method=RequestMethod.POST)
	public ModelAndView addItemsToMenu(@RequestBody MenuDetails menuObj,HttpServletRequest request,HttpServletResponse response){
	String locationListAll="";
	List<String> menuCategoryNamesList = new ArrayList<String>();
	List<MenuDetails> menuDetailsList = new ArrayList<MenuDetails>();
		try{
		String locationStr = "";
		// log.info("addItemsToMenu");
		// log.info(menuObj.getMenu_category_details().size());
		String customerId = request.getSession().getAttribute("customerId").toString();
		String emailId = request.getSession().getAttribute("emailId").toString();
		String result = menuServiceObj.addItemToMenu(menuObj,customerId,emailId);
		Map<String,Object> storesListMap = storeServiceObj.getStoresList(customerId, emailId,locationStr,"-1","10");
		modelAndViewObj = new ModelAndView();
		for (String string : menuObj.getLocationsList()) {
			locationListAll = locationListAll+string+",";
		}
		menuDetailsList = menuServiceObj.getMenuDetails(locationListAll, customerId, emailId,"",false);
		if( menuDetailsList != null && menuDetailsList.size() != 0){
		 menuCategoryNamesList = menuServiceObj.getMenuCategoriesNames(menuObj.getMenu_name(),locationListAll, customerId, emailId);
		}//modelAndViewObj.addObject("err",result);
		if(!result.equals(AppProperties.getAppMessageByProperty("ADD_MENU_ITEMS_SUCCESS").trim())){
			
			for(int i = 0; i<menuObj.getMenu_item_details().size();i++){
				menuObj.setMenuItemsList(menuObj.getMenu_item_details());
//				menuObj.getMenu_item_details().get(i).getMenu_item_id();
			}
			modelAndViewObj.addObject("menuitemDetailsList", menuObj);
			modelAndViewObj.addObject("err", result);
		}else
			modelAndViewObj.addObject("success", result);
		modelAndViewObj.addObject("menuCategoryNamesList", menuCategoryNamesList);
		modelAndViewObj.addObject("menuDetailsList", menuDetailsList);
		modelAndViewObj.addObject("storesList", storesListMap.get("storeDetailsList"));
	   modelAndViewObj.setViewName("Inventory Manager/menu/newMenuItems");
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
	 *This method is used to display the Edit Menu Categories form with all the details of the categories
	 *
	 **/
	@RequestMapping("/editMenuCategory")
	public ModelAndView editMenuCategory(@RequestParam("menu_name") String menu_name,@RequestParam("outlet_name") String outlet_name, HttpServletRequest request,
			HttpServletResponse response){
		try{
			// log.info("editMenuCategory");
			String locationStr = "";
			String customerId = request.getSession().getAttribute("customerId").toString();
			String emailId = request.getSession().getAttribute("emailId").toString();
			MenuDetails menuDetailsList = menuServiceObj.getCategoryDetails(menu_name,outlet_name, customerId, emailId);
		
			Map<String,Object> storesListMap = storeServiceObj.getStoresList(customerId, emailId,locationStr,"-1","10");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("storesList", storesListMap.get("storeDetailsList"));
			modelAndViewObj.addObject("menuDetailsList", menuDetailsList);
			modelAndViewObj.addObject("outletLocationname", outlet_name);
			modelAndViewObj.setViewName("Inventory Manager/menu/editMenu");
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
	 *This method is used to update the menu and display the response
	 *
	 **/
	@RequestMapping(value="/updateMenu",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView updateMenu(@RequestBody MenuDetails menuObj,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("updateMenu");
			String locationStr = "";
			// log.info(menuObj.getMenu_category_details().size());
			String customerId = request.getSession().getAttribute("customerId").toString();
			String emailId = request.getSession().getAttribute("emailId").toString();
			String result = menuServiceObj.updateMenu(menuObj,customerId,emailId);
			for(int i = 0; i<menuObj.getMenu_category_details().size();i++){
			     // String encodedImage = Base64.encode(menuObj.getMenu_category_details().get(i).getCategory_icon());
			      //menuObj.getMenu_category_details().get(i).setCategoryIcons(encodedImage);
			}
		   MenuDetails menuDetailsList = menuServiceObj.getCategoryDetails(menuObj.getMenu_name(),menuObj.getOutlet_name(), customerId, emailId);
			Map<String,Object> storesListMap = storeServiceObj.getStoresList(customerId, emailId,locationStr,"-1","10");
			modelAndViewObj = new ModelAndView();
			//modelAndViewObj.addObject("err",result);
			if(!result.equals(AppProperties.getAppMessageByProperty("UPDATE_MENU_SUCCESS").trim())){
				modelAndViewObj.addObject("err", result);
			}else
				modelAndViewObj.addObject("success", result);
			
			modelAndViewObj.addObject("storesList", storesListMap.get("storeDetailsList"));
			modelAndViewObj.addObject("menuDetailsList", menuDetailsList);
			modelAndViewObj.setViewName("Inventory Manager/menu/editMenu");
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
	 *This method is used to update the menu items and display the response
	 *
	 **/

	@RequestMapping(value="/updateMenuItems",method=RequestMethod.POST)
	public ModelAndView updateMenuItems(@RequestBody MenuDetails menuObj,HttpServletRequest request,HttpServletResponse response){
	String locationListAll="";
		try{
		String locationStr = "";
		// log.info("updateMenuItems");
		// log.info(menuObj.getMenu_category_details().size());
//		List<MenuItems> menuitems = new ArrayList<MenuItems>();
		String customerId = request.getSession().getAttribute("customerId").toString();
		String emailId = request.getSession().getAttribute("emailId").toString();
		String result = menuServiceObj.updateMenuItems(menuObj,customerId,emailId);
		for(int i = 0; i<menuObj.getMenu_item_details().size();i++){
		     /* String encodedImage = Base64.encode(menuObj.getMenu_item_details().get(i).getItem_icon());
		      menuObj.getMenu_item_details().get(i).setItem_icons(encodedImage);
		      encodedImage = Base64.encode(menuObj.getMenu_item_details().get(i).getItem_picture1());
		      menuObj.getMenu_item_details().get(i).setItem_pictures1(encodedImage);
		      encodedImage = Base64.encode(menuObj.getMenu_item_details().get(i).getItem_picture2());
		      menuObj.getMenu_item_details().get(i).setItem_pictures2(encodedImage);*/
		}
		
		for (String string : menuObj.getLocationsList()) {
			locationListAll = locationListAll+string+",";
		}
		Map<String,Object> storesListMap = storeServiceObj.getStoresList(customerId, emailId,locationStr,"-1","10");
		List<String> menuCategoryNamesList = menuServiceObj.getMenuCategoriesNames(menuObj.getMenu_name(),locationListAll, customerId, emailId);
//		MenuDetails menuDetailsList = menuServiceObj.getitems(menuObj.getMenu_name(),menuObj.getOutlet_name(), customerId, emailId);
		modelAndViewObj = new ModelAndView();
		//modelAndViewObj.addObject("err",result);
		if(!result.equals(AppProperties.getAppMessageByProperty("UPDATE_MENU_ITEMS_SUCCESS").trim())){
			modelAndViewObj.addObject("err", result);
		}else
			modelAndViewObj.addObject("success", result);
		modelAndViewObj.addObject("menuDetailsList", menuObj);
		modelAndViewObj.addObject("menuItemsDetailsList",menuObj.getMenu_item_details());
//		modelAndViewObj.addObject("menuDetailsList", menuDetailsList);
		modelAndViewObj.addObject("menuCategoryNamesList", menuCategoryNamesList);
		modelAndViewObj.addObject("storesList", storesListMap.get("storeDetailsList"));
		modelAndViewObj.setViewName("Inventory Manager/menu/editMenuItems");
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
	 *This method is used to display the View Menu Categories form with all the details of the categories
	 *
	 **/
	@RequestMapping("/viewMenuCategory")
	public ModelAndView viewMenuCategory(@RequestParam("menu_name") String menu_name,@RequestParam("outlet_name") String outlet_name, HttpServletRequest request,
			HttpServletResponse response){
		try{
			// log.info("viewMenuCategory");
			String locationStr = "";
			String customerId = request.getSession().getAttribute("customerId").toString();
			String emailId = request.getSession().getAttribute("emailId").toString();
			MenuDetails menuDetailsList = menuServiceObj.getCategoryDetails(menu_name,outlet_name, customerId, emailId);
			Map<String,Object> storesListMap = storeServiceObj.getStoresList(customerId, emailId,locationStr,"-1","10");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("storesList", storesListMap.get("storeDetailsList"));
			modelAndViewObj.addObject("menuDetailsList", menuDetailsList);
			modelAndViewObj.addObject("outletLocationname", outlet_name);
			modelAndViewObj.setViewName("Inventory Manager/menu/viewMenu");
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
	 *This method is used to display the View Menu Items form with all the details of the items
	 *
	 **/
	@RequestMapping("/viewMenuItems")
	public ModelAndView viewMenuItems(@RequestParam("menu_name") String menu_name,@RequestParam("outlet_name") String outlet_name, HttpServletRequest request,
			HttpServletResponse response){
		List<MenuItems> menuitems = null;
		try{
			// log.info("viewMenuItems");
			menuitems = new ArrayList<MenuItems>();
			String locationStr = "";
			String customerId = request.getSession().getAttribute("customerId").toString();
			String emailId = request.getSession().getAttribute("emailId").toString();
			MenuDetails menuDetailsList = menuServiceObj.getitems(menu_name,outlet_name, customerId, emailId);
			Map<String,Object> storesListMap = storeServiceObj.getStoresList(customerId, emailId,locationStr,"-1","10");
			modelAndViewObj = new ModelAndView();
			List<String> menuCategoryNamesList = menuServiceObj.getMenuCategoryNames(menu_name,outlet_name, customerId, emailId);
		

			
			for(MenuCategory zone :menuDetailsList.getMenuCategories()){
				if(zone.getMenuItemsList()!=null && zone.getMenuItemsList().size()>0){
					for(MenuItems details : zone.getMenuItemsList()){
//						if(details.getLocationType() == "Retail outlet")
						menuitems.add(details);
					}
				}
			}
			modelAndViewObj.addObject("storesList", storesListMap.get("storeDetailsList"));
			modelAndViewObj.addObject("menuDetailsList", menuDetailsList);
			modelAndViewObj.addObject("outletLocationname", outlet_name);
			modelAndViewObj.addObject("menuitemsList", menuitems);
			modelAndViewObj.addObject("menuCategoryNamesList", menuCategoryNamesList);
			modelAndViewObj.setViewName("Inventory Manager/menu/viewMenuItems");
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
	 *This method is used to display the Edit Menu Items form with all the details of the items
	 *
	 **/
	@RequestMapping("/editMenuItems")
	public ModelAndView editMenuItems(@RequestParam("menu_name") String menu_name,@RequestParam("outlet_name") String outlet_name, HttpServletRequest request,
			HttpServletResponse response){
		List<MenuItems> menuitems = null;
		
		try{
			// log.info("editMenuItems");
			menuitems = new ArrayList<MenuItems>();
			String locationStr = "";
			String customerId = request.getSession().getAttribute("customerId").toString();
			String emailId = request.getSession().getAttribute("emailId").toString();
			MenuDetails menuDetailsList = menuServiceObj.getitems(menu_name,outlet_name, customerId, emailId);
			List<String> menuCategoryNamesList = menuServiceObj.getMenuCategoryNames(menu_name,outlet_name, customerId, emailId);
			Map<String,Object> storesListMap = storeServiceObj.getStoresList(customerId, emailId,locationStr,"-1","10");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("storesList", storesListMap.get("storeDetailsList"));
			
			
			if(menuDetailsList.getMenuCategories() != null){
			for(MenuCategory zone :menuDetailsList.getMenuCategories()){
				if(zone.getMenuItemsList()!=null && zone.getMenuItemsList().size()>0){
					for(MenuItems details : zone.getMenuItemsList()){
//						if(details.getLocationType() == "Retail outlet")
						menuitems.add(details);
					}
				}
			}
			}
//			modelAndViewObj.addObject("selectedStore",menuDetailsList.get());
//			for(int i=0;i<menuDetailsList.getMenuCategories().size();i++)
//			{
//				menuitems = menuDetailsList.getMenuCategories().get(i).getMenuItemsList();
//				
//				menuDetailsList.setMenuItemsList(menuitems);
//			}
//			
//			menuitems.add(menuDetailsList);
//			////////System.out.println(menuDetailsList.getMenuItemsList());
			//////////System.out.println(menuDetailsList.getOutlet_name());
			modelAndViewObj.addObject("menuDetailsList", menuDetailsList);
			modelAndViewObj.addObject("menuItemsDetailsList",menuitems);
			modelAndViewObj.addObject("outletLocationname", outlet_name);
			//////////System.out.println(menuDetailsList.getMenuItemsList());
		//	modelAndViewObj.addObject("menuCategoryDetailsList", menuitems);
			modelAndViewObj.addObject("menuCategoryNamesList", menuCategoryNamesList);
			modelAndViewObj.setViewName("Inventory Manager/menu/editMenuItems");
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
	 *This method is used to delete the menu
	 *
	 **/
	@RequestMapping("/deleteMenu")
	public ModelAndView deleteMenu(@RequestParam("ids") String ids,@RequestParam("outlet_name") String outlet_name,HttpServletRequest request,HttpServletResponse response){
		String locationListAll ="";
		try{
			// log.info("deleteMenu ");
			//////////System.out.println("deletemenu");
			modelAndViewObj = new ModelAndView();
			String result;
			String locationStr = "";
			String customerId = request.getSession().getAttribute("customerId").toString();
			String emailId = request.getSession().getAttribute("emailId").toString();
			result = menuServiceObj.deleteMenu(customerId,emailId ,ids,outlet_name);
			// log.info(result);
			Map<String,Object> storesListMap = storeServiceObj.getStoresList(customerId, emailId,locationStr,"-1","10");
			@SuppressWarnings("unchecked")
			List<OutletInfo> storeList = (List<OutletInfo>)storesListMap.get("storeDetailsList");
			
			 List<String> locationsListValue=new ArrayList<String>();
	  			if(outlet_name.equals("all")|| outlet_name.equals("")){
					if(storeList != null){
							for(int i=0;i<storeList.size();i++){
								locationsListValue.add(storeList.get(i).getLocation());
							}
				
						for (String string : locationsListValue) {
							locationListAll = locationListAll+string+",";
						}
					}
	  			}
	  			else
	  				locationListAll = outlet_name;
			List<MenuDetails> menuDetailsList = menuServiceObj.getMenuDetails(locationListAll, customerId, emailId,"",false);
			//need to know what is stores list commneted by kalyan
		
			
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("storesList", storesListMap.get("storeDetailsList"));
			modelAndViewObj.addObject("selectedStore", outlet_name);
			modelAndViewObj.addObject("menuDetailsList", menuDetailsList);
			modelAndViewObj.addObject("err", result);
			modelAndViewObj.setViewName("Inventory Manager/menu/menu");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}

	/**
	 * 
	 * Created by: kalyan Creation date: 06-11-2015 Updated by: kalyan Last
	 * updated on: 13-11-2015 Verified by: Purpose: to view all booking by
	 * filter . if all parameters empty will get all bookings
	 * 
	 * @param location
	 * @param level
	 * @param startDate
	 * @param endDate
	 * @param index
	 * @param bookingId
	 * @param request
	 * @param response
	 * @return ModelAndView
	 */
	@RequestMapping("/viewRestaurantBookings")
	public ModelAndView viewRestaurantBookings(@RequestParam("location") String location,
			@RequestParam("level") String level, @RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate, @RequestParam("index") int index,
			@RequestParam("bookingId") String bookingId, @RequestParam("slot") String slot,
			@RequestParam("orderType") String orderTypeStr, HttpServletRequest request, HttpServletResponse response) {

		String userIdStr = (String) request.getSession().getAttribute("customerId");
		String emailIdStr = request.getSession().getAttribute("emailId").toString();
		
		modelAndViewObj = new ModelAndView();
		List<String> storesList = adminServiceObj.getRestaruntLocationsList(userIdStr, emailIdStr, true);

		//		Added by vijay, to make default loaction as location list first occurrence, if location is empty
		if((location.trim()).equals(null) || location.trim().isEmpty())
			location = storesList.get(0);
		
		
		
		String responseStr = masterServiceObj.viewRestaurantBookingsService(location, level, startDate, endDate, index,
				bookingId, userIdStr, emailIdStr, slot, orderTypeStr);
		
		
		if (storesList.size() > 0 && storesList != null) {
				modelAndViewObj.addObject("Locations", storesList);
				//modelAndViewObj.addObject("restaurantLevels", storesList.get("restaurants"));
			
		} else {
			modelAndViewObj.addObject("err", "");
			modelAndViewObj.addObject("storeDetailsList", "");
		}
		try {
			JSONObject jsonResponseObject = new JSONObject(responseStr);

			if (jsonResponseObject.getJSONObject("responseHeader").getString("responseCode").equalsIgnoreCase("-1")) {
				modelAndViewObj.addObject("totalRecords", "0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
				if (orderTypeStr.equalsIgnoreCase("take_away")) {
					modelAndViewObj.setViewName("Inventory Manager/restaurant/Orders/takeAways");
				} else {
					modelAndViewObj.setViewName("Inventory Manager/restaurant/Orders/restaurantBookings");
					return modelAndViewObj;
				}

			}

			JSONArray jsonBookingInfoArray = jsonResponseObject.getJSONArray("ordersList");

			TableBookings tableBooking = null;
			List<TableBookings> bookings = new ArrayList<TableBookings>();
//			int slNo = index;
			for (int i = 0; i < jsonBookingInfoArray.length(); i++) {
				tableBooking = gson.fromJson(jsonBookingInfoArray.getString(i), TableBookings.class);
				bookings.add(tableBooking);
			}

			int start = 1, end = 10;
			if (bookings.size() == 0) {
				modelAndViewObj.addObject("totalRecords", "0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			} else {
				if (bookings.size() < 10) {
					end = (bookings.size()) + (index);
				} else {
					end = (index + end);
				}
				modelAndViewObj.addObject("totalRecords", jsonResponseObject.getString("totalRecords"));
				modelAndViewObj.addObject("index", (index + start));
				modelAndViewObj.addObject("totalValue", end);
			}

			modelAndViewObj.addObject("bookings", bookings);
			if (orderTypeStr.equalsIgnoreCase("take_away")) {
				modelAndViewObj.setViewName("Inventory Manager/restaurant/Orders/takeAways");
			} else {
				modelAndViewObj.setViewName("Inventory Manager/restaurant/Orders/restaurantBookings");
			}
		} catch (Exception e) {
			e.printStackTrace();
			e.printStackTrace();
			modelAndViewObj.addObject("err", AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			if (orderTypeStr.equalsIgnoreCase("take_away")) {
				modelAndViewObj.setViewName("Inventory Manager/restaurant/Orders/takeAways");
			} else {
				modelAndViewObj.setViewName("Inventory Manager/restaurant/Orders/restaurantBookings");
			}
		}
		return modelAndViewObj;
	}
	
	@RequestMapping("/viewRestaurantBookingDetails")
	public ModelAndView viewSpecifivRestaurantBookingInf(@RequestParam("bookingId") String bookingId,
			HttpServletRequest request, HttpServletResponse response) {
		// log.info("room Configurations");
		String userIdStr = (String) request.getSession().getAttribute("customerId");
		String emailIdStr = request.getSession().getAttribute("emailId").toString();
		TableBookings tBooking = new TableBookings();
		try {
			modelAndViewObj = new ModelAndView();
			RequestHeader reqHead = new RequestHeader();
			reqHead.setAccessKey(userIdStr);
			reqHead.setApplicationName(Constants.APPLICATION_NAME);
			reqHead.setDateTime(new Date().toString());
			reqHead.setUserName(emailIdStr);
			reqHead.setCustomerId(userIdStr);
			reqHead.setCorrelationId(Constants.CORRELATION_ID);
			FilterInput fi = new FilterInput();
			fi.setRequestHeader(reqHead);
			fi.setBookingId(bookingId);
			fi.setOrderId(bookingId);
			Client client = Client.create();
			WebResource webResource = client.resource(AppProperties.getCloudServiceUrlWithContext());
			String responseStr = webResource.path("FBBookingsServices/getOrdersByOrderId")
					.queryParam("filterInput", gson.toJson(fi)).get(String.class);
			List<String> locationsList = adminServiceObj.getRestaruntLocationsList(userIdStr, emailIdStr, true);
			modelAndViewObj = new ModelAndView();
			JSONObject jsonResponseObject = new JSONObject(responseStr);

			if (jsonResponseObject.getJSONObject("responseHeader").getString("responseCode").equalsIgnoreCase("-1")) {
				modelAndViewObj.addObject("totalRecords", "0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
				modelAndViewObj.addObject("err", AppProperties.getAppMessageByProperty("no.rooms.found.label"));
				modelAndViewObj.addObject("locationsList", locationsList);
				modelAndViewObj.addObject("selectedLocation", locationsList);
				modelAndViewObj.addObject("selectedLevel", locationsList);
				modelAndViewObj.setViewName("Inventory Manager/restaurant/Orders/restaurantBookings");
				return modelAndViewObj;
			}

			String responseCode = Response.getResponseCode(responseStr);
			if (responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())) {
				tBooking = gson.fromJson(responseStr, TableBookings.class);
			}

			if (locationsList.size() == 0 || locationsList == null) {
				modelAndViewObj.addObject("err", AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			} else {
				// .....modelAndViewObj.addObject("bookingInfo", bookingInfo);
				modelAndViewObj.addObject("bookingInfo", tBooking);
			}
			modelAndViewObj.setViewName("Inventory Manager/restaurant/Orders/restaurantBookingInfo");
		} catch (Exception e) {
			e.printStackTrace();
			e.printStackTrace();
			modelAndViewObj.addObject("err", AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/restaurant/Orders/restaurantBookingInfo");
		}
		return modelAndViewObj;
	}
	/**
	 * added by kalyan
	 * 
	 * search booking ids
	 * 
	 * @param searchNameStr
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/searchRestaurantBookingIds")
	public @ResponseBody List<TableBookings> searchRestaurantBookingIds(@RequestParam("searchName") String searchNameStr,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<TableBookings> bookingIdList = new ArrayList<TableBookings>();
		try{
			// log.info("search Booking Ids");
			customerIdStr = request.getSession().getAttribute("customerId").toString();
			emailIdStr = request.getSession().getAttribute("emailId").toString();
			bookingIdList = masterServiceObj.searchRestaurantBookingIds(customerIdStr, emailIdStr,searchNameStr);
			// log.info("Result:::"+bookingIdList);
		}catch(Exception e){
			e.printStackTrace();
		}
		return bookingIdList;
	}
	
	
	@RequestMapping("/getOutletDetails")
	public @ResponseBody List<OutletSettings> getOutletDetails(@RequestParam("tolocation") String tolocation,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<OutletSettings> outletsettingsList = new ArrayList<OutletSettings>();
		try{
			customerIdStr = request.getSession().getAttribute("customerId").toString();
			emailIdStr = request.getSession().getAttribute("emailId").toString();
			outletsettingsList = adminServiceObj.getOutletSettingList(customerIdStr,emailIdStr,tolocation);
		}catch(Exception e){
			e.printStackTrace();
		}
		return outletsettingsList;
	}
	
	/**
	 * @author Sahitya
	 * Verified By :
	 * updated by kalyan 28-jan
	 * 
	 * @param outletid,level,Request,Response
	 *  
	 * This method is used to receive layout related response data which contains layout name, layout desc & dine table information
	 *  via store service,then send to GUI(user-experience)
	 *  
	 *  @return ModelAndView object with list of tables info and layout info
	 *//*
	@RequestMapping("/viewRestaurantLayout")
	public ModelAndView viewRestaurantLayout(@RequestParam("location") String location,
			@RequestParam("level") String level,
			@RequestParam("buildingName") String buildingName,
			@RequestParam("levels") String levels,
			HttpServletRequest request,HttpServletResponse response) {
		// log.info("view Restaurant Layout ");

		try{
			
			modelAndViewObj = new ModelAndView();
			
			String userIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr  = request.getSession().getAttribute("emailId").toString();
			
			List<Restaurant> restaurantList = masterServiceObj.viewRestaurantLayoutService(userIdStr, emailIdStr, level, location);
			
			List<SectionDetails> sectionDetailsList = masterServiceObj.getSection("", userIdStr, emailIdStr, "-1",false);

			modelAndViewObj.addObject("location",location);
			modelAndViewObj.addObject("level",level);
			modelAndViewObj.addObject("buildingName",buildingName);
			modelAndViewObj.addObject("levelsStr",levels);
			modelAndViewObj.addObject("sectionDetailsList",sectionDetailsList);
			if (restaurantList != null && restaurantList.size() > 0) {
				modelAndViewObj.addObject("roomDetailsList",restaurantList);
			}else{
				modelAndViewObj.addObject("roomDetailsList",restaurantList);
			}
			
			
			modelAndViewObj.setViewName("Inventory Manager/restaurant/viewstoragesystem");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/restaurant/allRestaurantDetails");
		}
		return modelAndViewObj;

	}*/

	/**
	 * 
	 * @author Vasudeva Reddy.G
	 * @Created_on: 02-Aug-2019
	 * @Reviewed_by Surya on 20/08/2019
	 * @description :1.This method is used to save the details of the OrganizationDepartment
	 * 2.This method returns a message based on the successful creation or not 
	 **/
	@RequestMapping(value="/createOrganizationalDept",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createOrganizationalDept(@RequestBody OrganizationalDept orgdepartmentObj,HttpServletRequest request,HttpServletResponse response) {
		try{
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			String result = orgdepartmentServiceObj.createOrganizationalDept(orgdepartmentObj, customerIdStr, emailIdStr);
			if(!result.equals(AppProperties.getAppMessageByProperty("ORGANIZATIONDEPARTMENT_CREATE_SUCCESS").trim())){
				modelAndViewObj.addObject("err", result);
			}else
				modelAndViewObj.addObject("success", result);
			
			modelAndViewObj.addObject("maxRecords",orgdepartmentObj.getMaxRecords());
			modelAndViewObj.addObject("searchName",orgdepartmentObj.getSearchCriteria());
			modelAndViewObj.setViewName("Inventory Manager/master/newOrganizationDepartmentMaster");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Vasudeva Reddy.G
	 * @Created_on: 05-08-2019
	 * @Reviewed_by Surya on 20/08/2019
	 * @description:This method is used to display all the organization department details in a tabular form
	 **/	
	@RequestMapping("/viewOrganizationDepartmentMaster")
	public ModelAndView viewOrganizationDepartmentMaster(@RequestParam("index") String index,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
		try{
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			String deptId="";
			List<OrganizationalDept> orgdepartmentList = orgdepartmentServiceObj.getOrganizationalDept(deptId,customerId, emailId,index,maxRecords,searchName);
			modelAndViewObj = new ModelAndView();
			if(orgdepartmentList == null){
				modelAndViewObj.addObject("totalRecords","0");  
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(orgdepartmentList.size()<end){
					end = (orgdepartmentList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", (orgdepartmentList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("orgdepartmentList", orgdepartmentList);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);
			modelAndViewObj.setViewName("Inventory Manager/master/organizationdepartmentMaster");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	/**
	 * 
	 * @author Vasudeva Reddy.G
	 * @Created_on: 02-Aug-2019
	 * @Reviewed_by Surya on 20/08/2019
	 * @description :1.This method will return model and view object with new organization department jsp page
	 * 
	 **/
	@RequestMapping("/newOrganizationDepartment")
	public ModelAndView newOrganizationDepartment(@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
		try{
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);
			modelAndViewObj.setViewName("Inventory Manager/master/newOrganizationDepartmentMaster");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	/**
	 * @author Vasudeva Reddy.G
	 * @Created_on: 06-Aug-2019
	 * @Reviewed_by Surya on 20/08/2019
	 * @description:This method is used to display the Edit Organization Department form with Organization department  details
	 **/	
	@RequestMapping("/editOrganizationDepartment")
	public ModelAndView editOrganizationDepartment(@RequestParam("deptId") String deptId,@RequestParam("operation") String operation,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,HttpServletRequest request,
			HttpServletResponse response){
		try{
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			String index="";
			modelAndViewObj = new ModelAndView();
			List<OrganizationalDept> orgdepartmentList = orgdepartmentServiceObj.getOrganizationalDept(deptId,customerId, emailId,index,maxRecords,searchName);
			if(orgdepartmentList != null && orgdepartmentList.size() > 0){
				modelAndViewObj.addObject("orgdepartment", orgdepartmentList.get(0));
			}
			if(operation.equals("view"))
				modelAndViewObj.setViewName("Inventory Manager/master/viewOrganizationDepartment");
			else
				modelAndViewObj.setViewName("Inventory Manager/master/editOrganizationDepartment");
		}  
		catch(Exception exception){
			exception.printStackTrace();
		}
		modelAndViewObj.addObject("maxRecords",maxRecords);
		modelAndViewObj.addObject("searchName",searchName);
		return modelAndViewObj;
	}
	/**
	 * 
	 * @author Vasudeva Reddy.G
	 * @Created_On 5-Aug-2019
	 * @Reviewed_by Surya on 20/08/2019
	 *@description This method is used to update the details of the organization department.
	 *It returns the edit organization department view along with a message of successful updation or not
	 **/	
	@RequestMapping(value="/updateOrganizationDepartment",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView updateOrganizationalDept(@RequestBody OrganizationalDept orgdepartmentObj,HttpServletRequest request,HttpServletResponse response) {
		try{
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			String result = orgdepartmentServiceObj.updateOrganizationalDept(orgdepartmentObj,customerId,emailId);
			List<OrganizationalDept> orgdepartmentList = orgdepartmentServiceObj.getOrganizationalDept(orgdepartmentObj.getDeptId(),customerId, emailId,orgdepartmentObj.getStartIndex(),orgdepartmentObj.getMaxRecords(),orgdepartmentObj.getSearchCriteria());
			if(orgdepartmentList != null && orgdepartmentList .size() > 0){
				
				modelAndViewObj.addObject("orgdepartment", orgdepartmentList.get(0));
				
			}
			modelAndViewObj.addObject("orgdepartment", orgdepartmentObj);
			if(!result.equals(AppProperties.getAppMessageByProperty("ORGANIZATIONDEPARTMENT_UPDATE_SUCCESS").trim())){
				modelAndViewObj.addObject("err", result);
			}else
				modelAndViewObj.addObject("success", result);
			modelAndViewObj.setViewName("Inventory Manager/master/editOrganizationDepartment");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}


	@RequestMapping("/viewoutletstockAging")
	public ModelAndView viewoutletstockAging(@RequestParam("search") String search,@RequestParam("index") String index,
			@RequestParam("zone") String zone,@RequestParam("category") String category,@RequestParam("subcategory") String subcategory,
			@RequestParam("brand") String brand,@RequestParam("startdate") String startdate,@RequestParam("enddate") String enddate,
			@RequestParam("flowUnder") String flowUnder,@RequestParam("location") String location,@RequestParam("saveFlag") String saveFlag,
			@RequestParam("maxRecords") String maxRecords,
			HttpServletRequest request,HttpServletResponse response) {
		List<String> locationsList = null;
		SalesReportsBean stockVerificationDetailsList = null;
		//TallyRequest tally = new TallyRequest();
		String locationListAll = "";
		try{
			// log.info("viewStockVerification");
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr  = (String)request.getSession().getAttribute("emailId");

			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);

		
			if(location.equals("all")|| location.equals("")){
				if(locationsList != null){
					for (String string : locationsList) {

						locationListAll = locationListAll+string+",";
					}
				}

			}

			if(flowUnder.equals("outlet")){
				stockVerificationDetailsList = storeStockVerificationServiceObj.getStockAging(customerIdStr,emailIdStr,index,maxRecords,zone,location,category,subcategory,brand,startdate,enddate,search,locationListAll,saveFlag);
			}

			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("locationsList", locationsList);


			if(stockVerificationDetailsList.getStockAgingList() == null){
				modelAndViewObj.addObject("url","");
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(stockVerificationDetailsList.getTotalRecords()<Integer.parseInt(maxRecords)){
					end = (stockVerificationDetailsList.getTotalRecords())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", stockVerificationDetailsList.getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("url",stockVerificationDetailsList.getSalesReportFilePath());
			}
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
			modelAndViewObj.addObject("report",stockVerificationDetailsList.getStockAgingList());
			modelAndViewObj.addObject("selectedLocation",location);
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.addObject("startdate", startdate);
			modelAndViewObj.addObject("enddate", enddate);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("category", category);
			modelAndViewObj.addObject("subcategory", subcategory);
			modelAndViewObj.addObject("brand", brand);
			modelAndViewObj.setViewName("Reports/OutletReports/StockReports/stockAging");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Reports/OutletReports/StockReports/stockAging");
		}
		return modelAndViewObj;
	}
	

	@RequestMapping("/viewoutletstockExpiry")
	public ModelAndView viewoutletstockExpiry(@RequestParam("search") String search,@RequestParam("index") String index,
			@RequestParam("zone") String zone,@RequestParam("category") String category,@RequestParam("subcategory") String subcategory,
			@RequestParam("brand") String brand,@RequestParam("startdate") String startdate,
			@RequestParam("flowUnder") String flowUnder,@RequestParam("location") String location,@RequestParam("saveFlag") String saveFlag,
			@RequestParam("maxRecords") String maxRecords,
			HttpServletRequest request,HttpServletResponse response) {
		List<String> locationsList = null;
		SalesReportsBean stockVerificationDetailsList = null;
		
		String locationListAll = "";
		try{
			// log.info("viewStockVerification");
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr  = (String)request.getSession().getAttribute("emailId");

			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);

		
			if(location.equals("all")|| location.equals("")){
				if(locationsList != null){
					for (String string : locationsList) {

						locationListAll = locationListAll+string+",";
					}
				}

			}

			if(flowUnder.equals("outlet")){
				stockVerificationDetailsList = storeStockVerificationServiceObj.getStockExpiry(customerIdStr,emailIdStr,index,maxRecords,zone,location,category,subcategory,brand,startdate,search,locationListAll,saveFlag);
			}

			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("locationsList", locationsList);


			if(stockVerificationDetailsList.getStockAgingList() == null){
				modelAndViewObj.addObject("url","");
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(stockVerificationDetailsList.getTotalRecords()<Integer.parseInt(maxRecords)){
					end = (stockVerificationDetailsList.getTotalRecords())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", stockVerificationDetailsList.getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("url",stockVerificationDetailsList.getFilePath());
			
			}
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
			modelAndViewObj.addObject("report",stockVerificationDetailsList.getStockAgingList());
			modelAndViewObj.addObject("selectedLocation",location);
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.addObject("startdate", startdate);
			//modelAndViewObj.addObject("enddate", enddate);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("category", category);
			modelAndViewObj.addObject("subcategory", subcategory);
			modelAndViewObj.addObject("brand", brand);
			modelAndViewObj.setViewName("Reports/OutletReports/StockReports/stockExpiry");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Reports/OutletReports/StockReports/stockExpiry");
		}
		return modelAndViewObj;
	}
	
	
	
	@RequestMapping(value="/importSkuDetails",method=RequestMethod.POST)
	public @ResponseBody List<ProductsList> importSkuDetails(@RequestParam("SkuIds") String SkuIds,@RequestParam("warehouseLocation")String warehouseLocation,@RequestParam("supplier")String supplier,@RequestParam("flag")String flag, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<ProductsList> productsList = new ArrayList<ProductsList>();
		try{
			//// log.info("searchProducts");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			Boolean skuflag=false;
			if(flag=="true" || flag.equals("true"))
			{
				skuflag=true;
			}
			productsList = skuServiceObj.importSkuProducts(customerIdStr,emailIdStr,SkuIds,warehouseLocation,"",supplier,skuflag);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return productsList;
	}
	
	/*
	@RequestMapping("/viewStockverificationUpload")
	public ModelAndView viewStockverificationUpload(@RequestParam("index") String index,
			@RequestParam("flowUnder") String flowUnder,
			@RequestParam("location") String location, 
			@RequestParam("searchName") String searchName, 
			@RequestParam("verificationCode") String verificationCode, 
			@RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate,
			@RequestParam("zone") String zone ,
			@RequestParam("maxRecords") String maxRecords,
			@RequestParam("department") String department,
			@RequestParam("subdepartment") String subdepartment,
			@RequestParam("category") String category,
			@RequestParam("subcategory") String subcategory,
			@RequestParam("section") String section,
		HttpServletRequest request,HttpServletResponse response) {
		
		List<String> locationsList = null;
		List<WareHouseStockVerificationBean> stockVerificationDetailsList = null;
		//List<String> locationsList = null;
		List<String> warehouselocationsList = null;
		try{
			//// log.info("viewStockVerificationReport");
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr  = (String)request.getSession().getAttribute("emailId");


			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,index,"","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			
			stockVerificationDetailsList = new ArrayList<WareHouseStockVerificationBean>();
			if(flowUnder.equals("outlet")){
				//stockVerificationDetailsList = storeStockVerificationServiceObj.getProductVerificationReport(customerIdStr,emailIdStr,location,searchName,index,startDate,endDate,maxRecords,flowUnder,verificationCode,category);

				locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			}

			else{
				stockVerificationDetailsList = warehouseServiceObj.getStockaPosting(customerIdStr,emailIdStr,location,"",index,"","",maxRecords,flowUnder,verificationCode);
				locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
			}
			modelAndViewObj = new ModelAndView();
			
			
			modelAndViewObj.addObject("locationsList", locationsList);

			if(stockVerificationDetailsList == null || stockVerificationDetailsList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}
			else{
				if(stockVerificationDetailsList.size()<Integer.parseInt(maxRecords)){
					end = (stockVerificationDetailsList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				//modelAndViewObj.addObject("totalRecords", Integer.parseInt(stockVerificationDetailsList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}

			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
			modelAndViewObj.addObject("startDate",startDate);
			modelAndViewObj.addObject("endDate",endDate);
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("searchName", searchName);
			modelAndViewObj.addObject("location", location);
			modelAndViewObj.addObject("department", department);
			modelAndViewObj.addObject("subdepartment", subdepartment);
			modelAndViewObj.addObject("category", category);
			modelAndViewObj.addObject("subcategory", subcategory);
			modelAndViewObj.addObject("section", section);
			modelAndViewObj.addObject("StockVerificationDetailsList",stockVerificationDetailsList);
			modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/stockVerificationReport");

		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",Utilities.getResponseCode("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/stockVerificationReport");
		}
		return modelAndViewObj;
	}
	*/
	
	@RequestMapping("/getStorelistByLocationOrders")
	public @ResponseBody Object getStorelistByLocationOrders(@RequestParam("location") String location,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
			Map<String, Object> storesList = null;
			String businessActivity="";
			String warehouseId="";
			Warehouse warehouse = null;
		try{
			
		ArrayList<LocationBean> locationDetails = genericMasterServiceObj.getLocationDetails(location.trim(),"1", emailIdStr,"0","",false,true,true);
      if(locationDetails!=null && locationDetails.size()>0){
     	businessActivity = locationDetails.get(0).getBusinessActivity();
         }
      
      if(businessActivity.equals("Warehouse")){
    	warehouse = new Warehouse();
    	warehouse.setStartIndex("0");
    	/*warehouse.setWarehouseLocation(location);*/
    	warehouse.setSearchCriteria(location);
    	List<Warehouse> warehouses = warehouseServiceObj.getWarehouses(warehouse);
    	//System.out.println("All Warehouses :: "+gson.toJson(warehouses));
    	if(warehouses != null && warehouses.size()>0){
    	for(int i=0;i<warehouses.size();i++){
    			if(warehouses.get(i).getWarehouseLocation().equalsIgnoreCase(location)){
    				warehouseId=warehouses.get(i).getWarehouseId();
    			}
    		}
    	}
    	
    	Map<String,Object> responseMapObj = new HashMap<String,Object>();
    	if(!warehouseId.isEmpty()){
    		Warehouse warehouseObj = new Warehouse();
    		warehouseObj.setWarehouseId(warehouseId);
    		/*warehouseObj.setLocation(location);*/
    		WarehousePOS warehouseData = warehouseServiceObj.getWarehouseposDetails(warehouseObj);
    		//System.out.println("warehouseDatabyLocation ::"+gson.toJson(warehouseData));
    		if(warehouseData != null && warehouseData.getPosList() != null && warehouseData.getPosList().size()>0){
    			List<WarehousePOS> warehouseList = new ArrayList<WarehousePOS>();
    			warehouseList = warehouseData.getPosList();
    			responseMapObj.put("storeDetailsList", warehouseList);
    			storesList = responseMapObj;
    		}else{
    			String resultStr = warehouseData.getResponseHeader().getResponseMessage();
    			responseMapObj.put("storeDetailsList",resultStr);
    			storesList = responseMapObj;
    		}
    	}else{
    		responseMapObj.put("storeDetailsList","Something went wrong, while loading Warehouse data.");
    		storesList = responseMapObj;
    	}
      }else {
		storesList = storeServiceObj.getStoresListforOrders(customerIdStr,emailIdStr,location.trim(),"-1","10",businessActivity);
      }
      
		}catch(Exception e){
			e.printStackTrace();
			
		}
		
		return  storesList.get("storeDetailsList");
	}
	
	 

	@RequestMapping("/newpackage")
	public ModelAndView newpackage(
			
			@RequestParam("type") String type,@RequestParam("zone") String zone,@RequestParam("flowUnder") String flowUnder,HttpServletRequest request,HttpServletResponse response){
		modelAndViewObj = new ModelAndView();
	try {
		String customerIdStr=null,emailIdStr=null;
		List<String> locationsListValue=new ArrayList<String>();
		ArrayList<LocationBean> locationBeansList = new ArrayList<LocationBean>();
		String locationListAll = "";
		
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"","","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
		
		if(flowUnder.equals("outlet")){
			
				if(zone == null || zone.trim().equals(""))
					locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
				else
					locationBeansList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");
				
				
			}else{
				locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
				
			}
			
			modelAndViewObj.addObject("locationsList", locationBeansList);
		
		
		if(type.equals("view"))
			modelAndViewObj.setViewName("Inventory Manager/warehouse/packagingandprocessing/newpackage");
		else
			modelAndViewObj.setViewName("Inventory Manager/warehouse/packagingandprocessing/newpackage");
			
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	return modelAndViewObj;
	}
	



		@RequestMapping("/viewPackagingandProcessing")
		public ModelAndView viewPackagingandProcessing(@RequestParam("index") String index,
				@RequestParam("location") String locationStr,@RequestParam("maxRecords") String maxRecords,@RequestParam("flowUnder") String flowUnder,
				@RequestParam("zone") String zone,@RequestParam("category") String category,
				@RequestParam("subcategory") String subcategory,@RequestParam("brand") String brand,@RequestParam("department") String department,
				@RequestParam("startdate") String startdate,@RequestParam("enddate") String enddate,
				@RequestParam("stockdownload") Boolean stockdownload,@RequestParam("suppliername") String suppliername,HttpServletRequest request,HttpServletResponse response) {
		
						try {
							
							com.tlabs.posweb.beans.Response responseobj = null;
							String customerIdStr=null,emailIdStr=null,resultStr;
							List<SkuDetails> skuDetailsList=null;
							//List<String> locationsList=null;
							List<String> locationsListValue=new ArrayList<String>();
							ArrayList<LocationBean> locationBeansList = new ArrayList<LocationBean>();
							List<ProcessingAndPackaging> packageList = null;
							String locationListAll = "";
							
								int start = 1,  end = Integer.parseInt(maxRecords);
								customerIdStr = (String)request.getSession().getAttribute("customerId");
								emailIdStr  = (String)request.getSession().getAttribute("emailId");
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
								List<Suppliers> supplierList =(List<Suppliers>)request.getSession().getAttribute("supplierList");
								if(supplierList==null || supplierList.size()==0 || supplierList.isEmpty()){
									 supplierList = outletMasterServiceObj.getSuppliers(customerIdStr, emailIdStr,"-1","","");
									request.getSession().setAttribute("supplierList", supplierList);
								}
//								List<String> brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
								
								List<String> brandsList = (List<String>)request.getSession().getAttribute("brandsList");
								if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
								 brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
									request.getSession().setAttribute("brandsList", brandsList);
								}
								
								modelAndViewObj = new ModelAndView();
								if(flowUnder.equals("outlet")){
								//	locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
									
									

									
									if(zone == null || zone.trim().equals(""))
										locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
									else
										locationBeansList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");
									
									//locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,true);	
									/*if((locationStr.trim()).equals(null) || locationStr.trim().isEmpty())
									{
										locationStr = locationBeansList.get(0).getLocationId();
									}*/
									
								}else{
								//	locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
									locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
									/*if((locationStr.trim()).equals(null) || locationStr.trim().isEmpty())
									locationStr = locationsList.get(0);*/
//								modelAndViewObj.addObject("locationsList", locationsList);
								}
								
								modelAndViewObj.addObject("locationsList", locationBeansList);
								if(locationStr.equals("all")|| locationStr.equals("")){
									if(locationBeansList != null){
										for(int i=0;i<locationBeansList.size();i++){
										
											locationsListValue.add(locationBeansList.get(i).getLocationId());
												
										}
									for (String string : locationsListValue) {
										
										locationListAll = locationListAll+string+",";
									}
									}
									
								}
								
								
			 resultStr = skuServiceObj.getpackage("","",startdate,enddate,locationStr,"",customerIdStr,emailIdStr,index,flowUnder,zone,category,subcategory,brand,department,stockdownload,suppliername,maxRecords,locationListAll,"");
			
			
			
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				responseobj = gson.fromJson(resultStr, com.tlabs.posweb.beans.Response.class);
				
			for(int i=0;i<responseobj.getPackagingList().size();i++){
				
				responseobj.getPackagingList().get(i).setTotalRecords(responseobj.getTotalRecords());
			
				for(int j=0;j<responseobj.getPackagingList().get(i).getPackagingDetails().size();j++){
					
					responseobj.getPackagingList().get(i).setNoOfItems(responseobj.getPackagingList().get(i).getPackagingDetails().get(j).getNoOfPacks());

					
				}
			}
			
            
			
			//////System.out.println(gson.toJson(responseobj.getPackagingList()));
			
			if(responseobj.getPackagingList() == null || responseobj.getPackagingList().size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}
			else{
				
				if(responseobj.getPackagingList().size()<Integer.parseInt(maxRecords)){
					end = (responseobj.getPackagingList().size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", (responseobj.getPackagingList().get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("packageList", responseobj.getPackagingList());
				
			}
			}else{
				 resultStr = Response.getResponseMessage(resultStr);
				 
			}
			
									modelAndViewObj.addObject("zoneList", zoneList);
									modelAndViewObj.addObject("departmentList", departmentList);
									modelAndViewObj.addObject("categoryList", categoryList);
									modelAndViewObj.addObject("subCategoryDetailsList", subCategoryDetailsList);
									modelAndViewObj.addObject("brandsList", brandsList);
									
									modelAndViewObj.addObject("selectedLocation",locationStr);
								modelAndViewObj.addObject("maxRecords",Integer.parseInt(maxRecords));
								modelAndViewObj.addObject("startdate", startdate);
								modelAndViewObj.addObject("enddate", enddate);
								modelAndViewObj.addObject("zone", zone);
								modelAndViewObj.addObject("category", category);
								modelAndViewObj.addObject("subcategory", subcategory);
								modelAndViewObj.addObject("brand", brand);
								modelAndViewObj.addObject("department", department);
								modelAndViewObj.addObject("suppliername", suppliername);
							
						
							
							
							modelAndViewObj.setViewName("Inventory Manager/warehouse/packagingandprocessing/packagingandprocessingsummary");
			}catch(Exception e){
				e.printStackTrace();
				}
			return modelAndViewObj;
		}
		


@RequestMapping("/viewStockHistory")
public ModelAndView viewStockHistory(@RequestParam("index") String index,
		@RequestParam("location") String locationStr,@RequestParam("maxRecords") String maxRecords,@RequestParam("flowUnder") String flowUnder,
		@RequestParam("zone") String zone,@RequestParam("category") String category,
		@RequestParam("subcategory") String subcategory,@RequestParam("brand") String brand,@RequestParam("department") String department,
		@RequestParam("startdate") String startdate,@RequestParam("enddate") String enddate,
		@RequestParam("startprice") Float startprice,@RequestParam("endprice") Float endprice ,@RequestParam("stockType") String stockType ,@RequestParam("stockdownload") Boolean stockdownload,@RequestParam("suppliername") String suppliername,@RequestParam("searchName") String searchName,
	HttpServletRequest request,HttpServletResponse response){
	String customerIdStr=null,emailIdStr=null;
	List<SkuDetails> skuDetailsList=null;
	List<DailyStockTracker> dailyStockTrackerList=null;
	//List<String> locationsList=null;
	List<String> locationsListValue=new ArrayList<String>();
	ArrayList<LocationBean> locationBeansList = new ArrayList<LocationBean>();
	String locationListAll = "";
	try{
		int start = 1,  end = Integer.parseInt(maxRecords);
		customerIdStr = (String)request.getSession().getAttribute("customerId");
		emailIdStr  = (String)request.getSession().getAttribute("emailId");
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
		List<Suppliers> supplierList =(List<Suppliers>)request.getSession().getAttribute("supplierList");
		if(supplierList==null || supplierList.size()==0 || supplierList.isEmpty()){
			 supplierList = outletMasterServiceObj.getSuppliers(customerIdStr, emailIdStr,"-1","","");
			request.getSession().setAttribute("supplierList", supplierList);
		}
//		List<String> brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
		
		List<String> brandsList = (List<String>)request.getSession().getAttribute("brandsList");
		if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
		 brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
			request.getSession().setAttribute("brandsList", brandsList);
		}
		
		modelAndViewObj = new ModelAndView();
		if(flowUnder.equals("outlet")){
		//	locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			
			

			
			if(zone == null || zone.trim().equals(""))
				locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			else
				locationBeansList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");
			
			//locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,true);	
			/*if((locationStr.trim()).equals(null) || locationStr.trim().isEmpty())
			{
				locationStr = locationBeansList.get(0).getLocationId();
			}*/
			
		}else{
		//	locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
			locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
			/*if((locationStr.trim()).equals(null) || locationStr.trim().isEmpty())
			locationStr = locationsList.get(0);*/
//		modelAndViewObj.addObject("locationsList", locationsList);
		}
		
		modelAndViewObj.addObject("locationsList", locationBeansList);
		if(locationStr.equals("all")|| locationStr.equals("")){
			if(locationBeansList != null){
				for(int i=0;i<locationBeansList.size();i++){
				
					locationsListValue.add(locationBeansList.get(i).getLocationId());
						
				}
			for (String string : locationsListValue) {
				
				locationListAll = locationListAll+string+",";
			}
			}
			
		}
		
			modelAndViewObj.addObject("zoneList", zoneList);
			modelAndViewObj.addObject("departmentList", departmentList);
			modelAndViewObj.addObject("categoryList", categoryList);
			modelAndViewObj.addObject("subCategoryDetailsList", subCategoryDetailsList);
			modelAndViewObj.addObject("brandsList", brandsList);
			//skuDetailsList = skuServiceObj.getProductStocks(searchName,"",startdate,enddate,locationStr,stockType,customerIdStr,emailIdStr,index,flowUnder,zone,category,subcategory,brand,department,startprice,endprice,stockdownload,suppliername,maxRecords,locationListAll);
			dailyStockTrackerList = skuServiceObj.getStockHistory(searchName,"",startdate,enddate,locationStr,"",customerIdStr,emailIdStr,index,flowUnder,zone,category,subcategory,brand,department,startprice,endprice,stockdownload,suppliername,maxRecords,locationListAll,stockType);
			
		//	////System.out.println("Daily Stock History Request String controller:::"+(gson.toJson(dailyStockTrackerList)) );
			if(locationStr != null && !locationStr.equals(""))
				request.getSession().setAttribute("selectedLocation",locationStr);
			if(dailyStockTrackerList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(dailyStockTrackerList.size()<10){
					end = (dailyStockTrackerList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords",(dailyStockTrackerList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			if(stockdownload){
			}
			modelAndViewObj.addObject("dailyStockTrackerList",dailyStockTrackerList);
			modelAndViewObj.addObject("selectedLocation",locationStr);
		modelAndViewObj.addObject("maxRecords",Integer.parseInt(maxRecords));
		//modelAndViewObj.addObject("stockType",stockType);
		//String jsp = stockType + "Stock";
		modelAndViewObj.addObject("startdate", startdate);
		modelAndViewObj.addObject("enddate", enddate);
		modelAndViewObj.addObject("zone", zone);
		modelAndViewObj.addObject("endprice", endprice);
		modelAndViewObj.addObject("startprice", startprice);
		modelAndViewObj.addObject("category", category);
		modelAndViewObj.addObject("subcategory", subcategory);
		modelAndViewObj.addObject("brand", brand);
		modelAndViewObj.addObject("department", department);
		modelAndViewObj.addObject("suppliername", suppliername);
		modelAndViewObj.addObject("searchName", searchName);
		modelAndViewObj.setViewName("Stocks/DailyStockHistory");
		
	}catch(Exception e){
		e.printStackTrace();
	}
	modelAndViewObj.addObject("flowUnder", flowUnder);
	return modelAndViewObj;
}





@RequestMapping(value="/createWarehousePOS",method=RequestMethod.POST,consumes="application/json")
public ModelAndView createWarehousePOS(@RequestBody WarehouseBean warehouseBeanObj,HttpServletRequest request,HttpServletResponse response) {
	String userIdStr = null,emailIdStr=null,resultStr=null;
	Map<String,Object> responseMapObj = null;
	List<String> locationsList = null;
	List<String> restaurantList = null;
	WarehousePOS warehouse = null;
	try{
		// log.info("Creating New Outlet");
		userIdStr = (String)request.getSession().getAttribute("customerId");
		emailIdStr  = (String)request.getSession().getAttribute("emailId");
		String roleStr = (String)request.getSession().getAttribute("role");
		modelAndViewObj = new ModelAndView();
		String location = "",storeCode = "",warehouseidcreated = "";
		/*if(!"".equals(warehouseBeanObj.getWarehouseId())){
			resultStr = storeServiceObj.updateWareHousePOS(userIdStr,emailIdStr,roleStr,warehouseBeanObj);
			location = warehouseBeanObj.getLocation();
			storeCode = warehouseBeanObj.getWarehouseId();
		}
		else{*/
		if(warehouseBeanObj.getOperation().equals("edit") || warehouseBeanObj.getOperation() == "edit"){
			resultStr = storeServiceObj.updateWareHousePOS(userIdStr,emailIdStr,roleStr,warehouseBeanObj);
		}else{
			resultStr = storeServiceObj.createWareHousePOS(userIdStr,emailIdStr,roleStr,warehouseBeanObj);
			
		}
		/*}*/
		//locationsList = adminServiceObj.getLocationsList(userIdStr,emailIdStr,"Retail Outlet");
		locationsList = adminServiceObj.getLocationsList(userIdStr,emailIdStr,"Warehouse");
		restaurantList=adminServiceObj.getLocationsList(userIdStr,emailIdStr,"Restaurant");
		
		if(restaurantList!= null && restaurantList.size()>0)
			locationsList.addAll(restaurantList);
		
		
		////System.out.println(gson.toJson(warehouseBeanObj));
		
		
			
			
			
				warehouse = new WarehousePOS();
//				
				String index="0";
				//warehouse.setLocation("all");
				warehouse.setStartIndex(index);
				
				List<WarehousePOS> warehouses = warehouseServiceObj.getWarehousespos(warehouse);
				int start = 1,end = 10;
				modelAndViewObj = new ModelAndView();
				if(warehouses == null || warehouses.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(warehouses.size()<10){
						end = (warehouses.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(warehouses.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
				}
				modelAndViewObj.addObject("warehouses",warehouses);
				 modelAndViewObj.addObject("maxRecords",Integer.parseInt("10"));
			
			
			if(resultStr.contains(Constants.SUCCESS)){
				modelAndViewObj.addObject("success",resultStr);
			}else{
		
			modelAndViewObj.addObject("err",resultStr);
			}
			
			modelAndViewObj.setViewName("Inventory Manager/warehouse/allwarehousespos");
		
	}catch(Exception e){
		e.printStackTrace();
		//modelAndViewObj.addObject("storeCode",responseMapObj.get("storeCode"));
		modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("CONTACT_ADMIN"));
		modelAndViewObj.setViewName("Inventory Manager/warehouse/allwarehousespos");
	}
	
	return modelAndViewObj;
}
@RequestMapping("/getWareHousespos")
public ModelAndView getWareHousespos(@RequestParam("index")String index,@RequestParam("id")String id,HttpServletRequest request,HttpServletResponse response){
	// log.info("InventoryManagerController - getWareHouses");
//	List<String> locationsList = null;
	WarehousePOS warehouse = null;
	try{
		warehouse = new WarehousePOS();
//		String customerIdStr = (String)request.getSession().getAttribute("customerId");
//		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		modelAndViewObj = new ModelAndView();
		/* for getting the locations  */
//		locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr);
		/* add request header to warehouse object */
//		warehouse.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr, emailIdStr));
//		warehouse.setWarehouseLocation(locationsList.get(0));
		//warehouse.setLocation("all");
		warehouse.setStartIndex(index);
		/* for getting the warehouses from db */
		List<WarehousePOS> warehouses = warehouseServiceObj.getWarehousespos(warehouse);
		int start = 1,end = 10;
		modelAndViewObj = new ModelAndView();
		if(warehouses == null || warehouses.size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(warehouses.size()<10){
				end = (warehouses.size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			modelAndViewObj.addObject("totalRecords", Integer.parseInt(warehouses.get(0).getTotalRecords()));
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
		}
		modelAndViewObj.addObject("warehouses",warehouses);
		 modelAndViewObj.addObject("maxRecords",Integer.parseInt("10"));
//		modelAndViewObj.addObject("locationsList", locationsList);
//		modelAndViewObj.addObject("location", locationsList.get(0));
		 modelAndViewObj.addObject("id",id);
		
	}catch(Exception exception){
		exception.printStackTrace();
		//modelAndViewObj.addObject("location", locationsList.get(0));
	//	modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("err","Something Went Wrong!");
	}
	modelAndViewObj.setViewName("Inventory Manager/warehouse/allwarehousespos");
	return modelAndViewObj;
}

@RequestMapping(value="/addPackagingNew",method=RequestMethod.POST)
public ModelAndView addPackagingNew(@RequestParam("formData")String data,HttpServletRequest request,HttpServletResponse response){
	ProcessingAndPackaging packageObj = null;
	String customerIdStr=null,emailIdStr=null;
	String resultStr = "";
	com.tlabs.posweb.beans.Response responseobj = null;
	List<SkuDetails> skuDetailsList=null;
	//List<String> locationsList=null;
	List<String> locationsListValue=new ArrayList<String>();
	ArrayList<LocationBean> locationBeansList = new ArrayList<LocationBean>();
	List<ProcessingAndPackaging> packageList = null;
	String locationListAll = "";
	modelAndViewObj = new ModelAndView();
	try{
     String Data=data;
     //////System.out.println(Data);
          int start = 1,  end = Integer.parseInt("10");
          String maxRecords = "10", index="0";
		packageObj = gson.fromJson(Data,ProcessingAndPackaging.class);
		
		customerIdStr = (String)request.getSession().getAttribute("customerId");
		emailIdStr  = (String)request.getSession().getAttribute("emailId");
		resultStr = warehouseServiceObj.addpackage(packageObj,customerIdStr,emailIdStr);
		
		if(resultStr == AppProperties.getAppMessageByProperty("PACKAGING_CREATED_SUCCESFULLY").trim() || resultStr == AppProperties.getAppMessageByProperty("PACKAGING_UPDATED_SUCCESFULLY").trim()){
			modelAndViewObj.addObject("success",resultStr);
		}else{
			modelAndViewObj.addObject("err",resultStr);
		}
		
		
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"0","","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			List<Department> departmentList =(List<Department>)request.getSession().getAttribute("departmentList");
			if(departmentList==null || departmentList.size()==0 || departmentList.isEmpty()){
				departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerIdStr, emailIdStr,"0",false);
				request.getSession().setAttribute("departmentList", departmentList);
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
			List<Suppliers> supplierList =(List<Suppliers>)request.getSession().getAttribute("supplierList");
			if(supplierList==null || supplierList.size()==0 || supplierList.isEmpty()){
				 supplierList = outletMasterServiceObj.getSuppliers(customerIdStr, emailIdStr,"-1","","");
				request.getSession().setAttribute("supplierList", supplierList);
			}
//			List<String> brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
			
			List<String> brandsList = (List<String>)request.getSession().getAttribute("brandsList");
			if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
			 brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
				request.getSession().setAttribute("brandsList", brandsList);
			}
			
			
				locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
				
			
			modelAndViewObj.addObject("locationsList", locationBeansList);
			
				if(locationBeansList != null){
					for(int i=0;i<locationBeansList.size();i++){
					
						locationsListValue.add(locationBeansList.get(i).getLocationId());
							
					}
				for (String string : locationsListValue) {
					
					locationListAll = locationListAll+string+",";
				}
				}
				
			
		
		
		
		
		 resultStr = skuServiceObj.getpackage("","","","","","",customerIdStr,emailIdStr,"0","","","","","","",false,"","10",locationListAll,"");
			
			
			
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				responseobj = gson.fromJson(resultStr, com.tlabs.posweb.beans.Response.class);
				
			for(int i=0;i<responseobj.getPackagingList().size();i++){
				
				responseobj.getPackagingList().get(i).setTotalRecords(responseobj.getTotalRecords());
			}
			
			
			//////System.out.println(gson.toJson(responseobj.getPackagingList()));
			
			if(responseobj.getPackagingList() == null || responseobj.getPackagingList().size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}
			else{
				
				if(responseobj.getPackagingList().size()<Integer.parseInt(maxRecords)){
					end = (responseobj.getPackagingList().size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", (responseobj.getPackagingList().get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("packageList", responseobj.getPackagingList());
				
			}
			}else{
				 resultStr = Response.getResponseMessage(resultStr);
				 
			}
		
			modelAndViewObj.addObject("zoneList", zoneList);
			modelAndViewObj.addObject("departmentList", departmentList);
			modelAndViewObj.addObject("categoryList", categoryList);
			modelAndViewObj.addObject("maxRecords",Integer.parseInt(maxRecords));

			modelAndViewObj.addObject("subCategoryDetailsList", subCategoryDetailsList);
			modelAndViewObj.addObject("brandsList", brandsList);
		
		modelAndViewObj.setViewName("Inventory Manager/warehouse/packagingandprocessing/packagingandprocessingsummary");
		
	}catch(Exception exception){
		exception.printStackTrace();
		modelAndViewObj.setViewName("Inventory Manager/warehouse/packagingandprocessing/packagingandprocessingsummary");
	}
	
	return modelAndViewObj;
}






@RequestMapping("/viewEditPack")
public ModelAndView viewEditPack(@RequestParam("packageId")String packageId,@RequestParam("operation")String operation,HttpServletRequest request,HttpServletResponse response){
	String customerIdStr=null,emailIdStr=null;
	String resultStr = "";
	com.tlabs.posweb.beans.Response responseobj = null;
	//List<String> locationsList=null;
	ArrayList<LocationBean> locationBeansList = new ArrayList<LocationBean>();
	modelAndViewObj = new ModelAndView();
	try {
		
		
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"","","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
		
		
				locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
				
			
			
			
			
			 resultStr = skuServiceObj.getpackage("","","","","","",customerIdStr,emailIdStr,"","","","","","","",false,"","","",packageId);

			
			 responseobj = gson.fromJson(resultStr, com.tlabs.posweb.beans.Response.class);
			 Set<String> SKUids = null;
			 List<String> listSKUs =   new ArrayList<String>(); ;
			 
			 for(int i = 0; i< responseobj.getPackagingList().get(0).getPackagingDetails().size();i++){
				 
				  
				 listSKUs.add(responseobj.getPackagingList().get(0).getPackagingDetails().get(i).getChildSkuId());  
			       
			        
			 }
			 SKUids = new LinkedHashSet<String>(listSKUs);  
			// ////System.out.println(SKUids);
			 
			 
			 modelAndViewObj.addObject("locationsList", locationBeansList);
			 modelAndViewObj.addObject("zoneList", zoneList);
			 modelAndViewObj.addObject("SKUids", SKUids);

			 modelAndViewObj.addObject("packages", responseobj.getPackagingList().get(0));
			 modelAndViewObj.addObject("packagesList", responseobj.getPackagingList().get(0).getPackagingDetails());
			 modelAndViewObj.addObject("packagesLists", gson.toJson(responseobj.getPackagingList().get(0).getPackagingDetails()));
			 
			 //////System.out.println(gson.toJson(responseobj.getPackagingList().get(0).getPackagingDetails()));
			// modelAndViewObj.addObject("packagesLists", responseobj.getPackagingList().get(0).getPackagingDetails().toString());


				
		
		
		if(operation.equals("view"))
			modelAndViewObj.setViewName("Inventory Manager/warehouse/packagingandprocessing/viewpackage");
		else
			modelAndViewObj.setViewName("Inventory Manager/warehouse/packagingandprocessing/editpackage");
			
		
	}catch(Exception exception){
		exception.printStackTrace();
		modelAndViewObj.setViewName("Inventory Manager/warehouse/packagingandprocessing/packagingandprocessingsummary");
	}
	
	return modelAndViewObj;
}


@RequestMapping(value = "/warehouseStorageMaster")
public ModelAndView warehouseStorageMaster(@RequestParam("index") String index,HttpServletRequest request,HttpServletResponse response) {
//	BillingService billingServiceObj= new BillingService();
//	Billing billingObj= new Billing();
	try{
		
							
							WarehouseStorageSystems warehouseStorageSystems = null;
							String customerIdStr=null,emailIdStr=null,resultStr;
							
							List<WarehouseStorageSystems> warehouseStorageSystemsList = null;
							String locationListAll = "";
							
								int start = 1,  end = Integer.parseInt("10");
								customerIdStr = (String)request.getSession().getAttribute("customerId");
								emailIdStr  = (String)request.getSession().getAttribute("emailId");
								
								modelAndViewObj = new ModelAndView();			
			 resultStr = warehouseServiceObj.getStorageMaster(customerIdStr,emailIdStr,"10","",index);
			
			
			
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				warehouseStorageSystems = gson.fromJson(resultStr, WarehouseStorageSystems.class);
				
			
			
            
			
			//////System.out.println(gson.toJson(warehouseStorageSystems.getWarehouseStorageSystems()));
			
			if(warehouseStorageSystems.getWarehouseStorageSystems() == null || warehouseStorageSystems.getWarehouseStorageSystems().size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}
			else{
				
				if(warehouseStorageSystems.getWarehouseStorageSystems().size()<Integer.parseInt("10")){
					end = (warehouseStorageSystems.getWarehouseStorageSystems().size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				//////System.out.println(warehouseStorageSystems.getTotalRecords());
				modelAndViewObj.addObject("totalRecords",warehouseStorageSystems.getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("storageSystemMaster", warehouseStorageSystems.getWarehouseStorageSystems());
				
			}
			}else{
				 resultStr = Response.getResponseMessage(resultStr);
				 
			}
			
									
			modelAndViewObj.addObject("maxRecords",Integer.parseInt("10"));
															
						
		
		modelAndViewObj.setViewName("MasterDataManagement/WarehouseMasters/StorageSystemMaster/storageSystemsSummary"); 
	}catch(Exception e){
		e.printStackTrace();
	}
	return modelAndViewObj;
}



@RequestMapping(value="/createWarehouseStorageSystemMaster",method=RequestMethod.POST)
public ModelAndView createWarehouseStorageSystemMaster(@RequestParam("formData")String data,@RequestParam("operation")String operation,HttpServletRequest request,HttpServletResponse response){
	WarehouseStorageSystems warehouseStorageSystems = null;
	String customerIdStr=null,emailIdStr=null;
	String resultStr = "";
	
	//List<WarehouseStorageSystems> warehouseStorageSystemsList = null;
	//String locationListAll = "";
	modelAndViewObj = new ModelAndView();
	try{
     String Data=data;
          int start = 1,  end = Integer.parseInt("10");
          ////System.out.println((Data));
          warehouseStorageSystems = gson.fromJson(Data,WarehouseStorageSystems.class);
          ////System.out.println(gson.toJson(warehouseStorageSystems));
		
		customerIdStr = (String)request.getSession().getAttribute("customerId");
		emailIdStr  = (String)request.getSession().getAttribute("emailId");
		resultStr = warehouseServiceObj.addwarehousestoragemaster(warehouseStorageSystems,customerIdStr,emailIdStr,operation);
		
		modelAndViewObj = new ModelAndView();
		if(resultStr == AppProperties.getAppMessageByProperty("WAREHOUSE_STORAGE_MASTER_CREATED_SUCCESFULLY").trim() || resultStr == AppProperties.getAppMessageByProperty("WAREHOUSE_STORAGE_MASTER_UPDATED_SUCCESFULLY").trim()){
			modelAndViewObj.addObject("success",resultStr);
		}else{
			modelAndViewObj.addObject("err",resultStr);
		}
		
		
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			
						
resultStr = warehouseServiceObj.getStorageMaster(customerIdStr,emailIdStr,"10","","");



String responseCode = Response.getResponseCode(resultStr);
if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
warehouseStorageSystems = gson.fromJson(resultStr, WarehouseStorageSystems.class);





//////System.out.println(gson.toJson(warehouseStorageSystems.getWarehouseStorageSystems()));

if(warehouseStorageSystems.getWarehouseStorageSystems() == null || warehouseStorageSystems.getWarehouseStorageSystems().size() == 0){
modelAndViewObj.addObject("totalRecords","0");
modelAndViewObj.addObject("index", "0");
modelAndViewObj.addObject("totalValue", "0");
}
else{

if(warehouseStorageSystems.getWarehouseStorageSystems().size()<Integer.parseInt("10")){
end = (warehouseStorageSystems.getWarehouseStorageSystems().size())+(Integer.parseInt("0"));
}else{
end = (Integer.parseInt("0")+end);
}
////System.out.println(warehouseStorageSystems.getTotalRecords());
modelAndViewObj.addObject("totalRecords",warehouseStorageSystems.getTotalRecords());
modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
modelAndViewObj.addObject("totalValue", end);
modelAndViewObj.addObject("storageSystemMaster", warehouseStorageSystems.getWarehouseStorageSystems());

}
}else{
resultStr = Response.getResponseMessage(resultStr);

}

				
modelAndViewObj.addObject("maxRecords",Integer.parseInt("10"));
modelAndViewObj.setViewName("MasterDataManagement/WarehouseMasters/StorageSystemMaster/storageSystemsSummary"); 

	}catch(Exception exception){
		exception.printStackTrace();
		modelAndViewObj.setViewName("MasterDataManagement/WarehouseMasters/StorageSystemMaster/storageSystemsSummary"); 
	}
	
	return modelAndViewObj;
}




@RequestMapping(value = "/viewWarehouseStorageSystemMaster")
public ModelAndView viewWarehouseStorageSystemMaster(@RequestParam("id")String id,@RequestParam("operation")String operation,HttpServletRequest request,HttpServletResponse response) {
//	BillingService billingServiceObj= new BillingService();
//	Billing billingObj= new Billing();
	try{
		
		                  Warehouse warehouse = new Warehouse();
							WarehouseStorageSystems warehouseStorageSystems = null;
							String customerIdStr=null,emailIdStr=null,resultStr;
							
							
								int start = 1,  end = Integer.parseInt("10");
								customerIdStr = (String)request.getSession().getAttribute("customerId");
								emailIdStr  = (String)request.getSession().getAttribute("emailId");
								
								modelAndViewObj = new ModelAndView();			
			    resultStr = warehouseServiceObj.getStorageMaster(customerIdStr,emailIdStr,"10",id,"");
			

				warehouse.setWarehouseLocation("all");
				warehouse.setStartIndex("0");
				List<Warehouse> warehouses = warehouseServiceObj.getWarehouses(warehouse);
				
				
				
				

			
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				warehouseStorageSystems = gson.fromJson(resultStr, WarehouseStorageSystems.class);
				
			
			
            
			
		//	////System.out.println(gson.toJson(warehouseStorageSystems.getWarehouseStorageSystems().get(0)));
			//////System.out.println(gson.toJson(warehouses));
			
			
				 resultStr = Response.getResponseMessage(resultStr);
				 
			}
			modelAndViewObj.addObject("warehouseStorage",warehouseStorageSystems.getWarehouseStorageSystems().get(0));
			modelAndViewObj.addObject("warehouseStorageDetails",warehouseStorageSystems.getWarehouseStorageSystems().get(0).getWarehouseStorageSystemDetails());
			
			modelAndViewObj.addObject("warehouses", warehouses);
									
															
						
		if(operation == "edit" || operation.equals("edit")){
		modelAndViewObj.setViewName("MasterDataManagement/WarehouseMasters/StorageSystemMaster/editstorageSystems"); 
		}else{
			modelAndViewObj.setViewName("MasterDataManagement/WarehouseMasters/StorageSystemMaster/viewstorageSystems"); 
		}
		}catch(Exception e){
		e.printStackTrace();
	}
	return modelAndViewObj;
}





@RequestMapping(value = "/newWarehouseStorageSystemMaster")
public ModelAndView newWarehouseStorageSystemMaster(HttpServletRequest request,HttpServletResponse response) {
//	BillingService billingServiceObj= new BillingService();
//	Billing billingObj= new Billing();
	try{
		Warehouse warehouse = new Warehouse();
								
			modelAndViewObj = new ModelAndView();	
			
			
			warehouse.setWarehouseLocation("all");
			warehouse.setStartIndex("0");
			List<Warehouse> warehouses = warehouseServiceObj.getWarehouses(warehouse);
			
			
			
			modelAndViewObj.addObject("warehouses", warehouses);
			modelAndViewObj.setViewName("MasterDataManagement/WarehouseMasters/StorageSystemMaster/newstoragesystemswarehouse"); 
		
		}catch(Exception e){
		e.printStackTrace();
	}
	return modelAndViewObj;
}





@RequestMapping("/viewWarehouseStockUploading")
public ModelAndView viewWarehouseStockUploading(@RequestParam("index") String index,
		@RequestParam("flowUnder") String flowUnder,
		@RequestParam("location") String location, 
		@RequestParam("searchName") String searchName, 
		@RequestParam("verificationCode") String verificationCode, 
		@RequestParam("startDate") String startDate,
		@RequestParam("endDate") String endDate,
		@RequestParam("zone") String zone ,
		@RequestParam("maxRecords") String maxRecords,
		@RequestParam("department") String department,
		@RequestParam("subdepartment") String subdepartment,
		@RequestParam("category") String category,
		@RequestParam("subcategory") String subcategory,
		@RequestParam("section") String section,
	HttpServletRequest request,HttpServletResponse response) {
	
	List<String> locationsList = null;
	List<WHStockVerificationPosting> stockVerificationDetailsList = null;
	//List<String> locationsList = null;
	List<String> warehouselocationsList = null;
	try{
		// log.info("viewStockVerificationReport");
		int start = 1,end = Integer.parseInt(maxRecords);
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr  = (String)request.getSession().getAttribute("emailId");


		List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
		if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
			zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,index,"","");
			request.getSession().setAttribute("zoneList", zoneList);
		}
		
		List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
		if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
			categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
			request.getSession().setAttribute("categoryList", categoryList);
		}
		
		
	

		if(flowUnder.equals("outlet")){

			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
		}

		else{
			stockVerificationDetailsList = warehouseServiceObj.getStocksPosting(customerIdStr,emailIdStr,location,zone,searchName,index,startDate,endDate,maxRecords,flowUnder,verificationCode,"","");

			locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
		}
		modelAndViewObj = new ModelAndView();
		if(stockVerificationDetailsList == null || stockVerificationDetailsList.size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(stockVerificationDetailsList.size()<Integer.parseInt(maxRecords)){
				end = (stockVerificationDetailsList.size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			modelAndViewObj.addObject("totalRecords", Integer.parseInt(stockVerificationDetailsList.get(0).getTotalRecords()));
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
		}
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
		modelAndViewObj.addObject("startDate",startDate);
		modelAndViewObj.addObject("endDate",endDate);
		modelAndViewObj.addObject("flowUnder", flowUnder);
		modelAndViewObj.addObject("zone", zone);
		modelAndViewObj.addObject("searchName", searchName);
		modelAndViewObj.addObject("location", location);
		modelAndViewObj.addObject("department", department);
		modelAndViewObj.addObject("subdepartment", subdepartment);
		modelAndViewObj.addObject("category", category);
		modelAndViewObj.addObject("subcategory", subcategory);
		modelAndViewObj.addObject("section", section);
		modelAndViewObj.addObject("StockPostingList",stockVerificationDetailsList);
		modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/stockPosting");

	}catch(Exception e){
		e.printStackTrace();
		modelAndViewObj.addObject("err",Utilities.getResponseCode("CONTACT_ADMIN"));
		modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/stockPosting");
	}
	return modelAndViewObj;

}




@RequestMapping("/viewWarehouseStockUploadingData")
public ModelAndView viewWarehouseStockUploadingData(@RequestParam("skuid") String skuid,
		@RequestParam("flowUnder") String flowUnder,@RequestParam("ref") String ref,@RequestParam("operation") String operation,
		
	HttpServletRequest request,HttpServletResponse response) {
	
	List<String> locationsList = null;
	List<WHStockVerificationPosting> stockVerificationDetailsList = null;
	//List<String> locationsList = null;
	List<String> warehouselocationsList = null;
	try{
		// log.info("viewStockVerificationReport");
		//int start = 1,end = Integer.parseInt(maxRecords);
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr  = (String)request.getSession().getAttribute("emailId");


		List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
		if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
			zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"0","","");
			request.getSession().setAttribute("zoneList", zoneList);
		}
		
		List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
		if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
			categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
			request.getSession().setAttribute("categoryList", categoryList);
		}
		
		
	

		if(flowUnder.equals("outlet")){

			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
		}

		else{
			stockVerificationDetailsList = warehouseServiceObj.getStocksPosting(customerIdStr,emailIdStr,"","","","0","","","10",flowUnder,"",skuid,ref);

			locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
		}
		modelAndViewObj = new ModelAndView();
		
		modelAndViewObj.addObject("locationsList", locationsList);
		
		modelAndViewObj.addObject("flowUnder", flowUnder);
		
			modelAndViewObj.addObject("StockPostingList",stockVerificationDetailsList);
			
			
			modelAndViewObj.addObject("operation",operation);
			
			if(operation == "view" || operation.equals("view")){
		modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/ViewstockPosting");
			}else{
				modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/editstockPosting");

			}
	}catch(Exception e){
		e.printStackTrace();
		modelAndViewObj.addObject("err",Utilities.getResponseCode("CONTACT_ADMIN"));
		modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/ViewstockPosting");
	}
	return modelAndViewObj;

}

@RequestMapping("/eventSummary")
public ModelAndView eventSummary(@RequestParam("index")String index,
		@RequestParam("maxRecords") String maxRecords,@RequestParam("zone")String zone,
		@RequestParam("location") String location,
		@RequestParam("eventType")String eventType,
		@RequestParam("salesPerson") String salesPerson,
		@RequestParam("status") String  status,
		@RequestParam("startDate") String startDate,
		@RequestParam("endDate")String endDate,
		@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response) {
	// log.info("configurations");
	String customerIdStr=null,emailIdStr=null;
	List<String> locationsList = new ArrayList<>();
	String locationListAll="";
	List<EmployeeBean> employeeList = new ArrayList<EmployeeBean>();
	List<EventMaster> eventMasters = new ArrayList<EventMaster>();
	try{
		int start = 1,end = Integer.parseInt(maxRecords);//modified by manasa
		modelAndViewObj = new ModelAndView();
		customerIdStr = (String)request.getSession().getAttribute("customerId");
		emailIdStr = (String)request.getSession().getAttribute("emailId");
		//storesList = storeServiceObj.getStoresList(customerIdStr,emailIdStr,locationStr,index,maxRecords);
		//locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
		ArrayList<LocationBean> locationsLists =	genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,true,false);

		for(LocationBean locationBean:locationsLists){
			locationsList.add(locationBean.getLocationId());
		}
		
		
		
		
		if(locationsList != null && locationsList.size()>0){
			
		for (String string : locationsList) {
			
			locationListAll = locationListAll+string+","; 
		}
		}
		
		
		

		
		employeeList = genericMasterServiceObj.getEmployees("",customerIdStr, emailIdStr,index,"","100",false,locationListAll);

		eventMasters = outletMasterServiceObj.getEventManagementDetails(customerIdStr, emailIdStr,index,maxRecords,"",true,zone,location,eventType,salesPerson,status,startDate,endDate,searchName,false);
		

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
		
		
		
		
	  modelAndViewObj.setViewName("Inventory Manager/EventManagement/eventManagementSummary");
	}catch(Exception e){
		e.printStackTrace();
	}
	return modelAndViewObj;
}




@RequestMapping("/getOrdersvsStock")
public @ResponseBody ModelAndView getOrdersvsStock(
		@RequestParam("searchName") String searchName,
		@RequestParam("location") String location,
		@RequestParam("index") String index,
		@RequestParam("maxRecords") String maxRecords,
		@RequestParam("zone") String zone,
		@RequestParam("startDate") String startDate,
		@RequestParam("endDate") String endDate,
		@RequestParam("category") String category,
		@RequestParam("subcategory") String subcategory,
		@RequestParam("department") String department,
		@RequestParam("section") String section,
		@RequestParam("saveflag") boolean saveflag,
		HttpServletRequest request,HttpServletResponse response){
	
	// log.info("viewSalesReportsCriteriaWise");
			ArrayList<LocationBean> workLocationsList = null;
			String customerIdStr=null,emailIdStr=null;
			String locationListAll = "";
			try{
				customerIdStr = (String)request.getSession().getAttribute("customerId");
				emailIdStr = (String)request.getSession().getAttribute("emailId");
				modelAndViewObj = new ModelAndView();

				if(zone == null || zone.trim().equals("")){
					
							workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,false,true);
				}else{
						workLocationsList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "");

					}
				List<String> locationsListValue=new ArrayList<String>();
				if(location == "" || location.equals("all")){
					if(workLocationsList != null){
						for(int i=0;i<workLocationsList.size();i++){
						
							locationsListValue.add(workLocationsList.get(i).getLocationId());
								
						}
					for (String string : locationsListValue) {
						
						locationListAll = locationListAll+string+",";
					}
					}
				}
				
				
				
				
			;
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
//				ArrayList<String> categoriesList = masterServiceObj.getCategoriesList(subCategoriesStr);
				
				
				
				
				
				List<ProductsList> salesReportList = reportsServiceObj.generateOrderVsSaleReport(customerIdStr, emailIdStr,location,startDate, endDate,maxRecords,searchName,index,saveflag,category,zone,subcategory,department,section,locationListAll);
				int start = 1,end = Integer.parseInt(maxRecords);
				if(salesReportList == null || salesReportList.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}
				else{
					
					if(salesReportList.size()<Integer.parseInt(maxRecords)){
						end = (salesReportList.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(salesReportList.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
					modelAndViewObj.addObject("packageList", salesReportList);
					
				}

				if(salesReportList != null){
				if (saveflag) {
					if (salesReportList.get(0).getFileUrl() != null)
						modelAndViewObj.addObject("downloadurl", salesReportList.get(0).getFileUrl());
				}
				}
				
				String reportStr = new Gson().toJson(salesReportList);
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.addObject("criteria", searchName);
				modelAndViewObj.addObject("locationsList", workLocationsList);
				request.getSession().setAttribute("reportList", salesReportList);
				modelAndViewObj.addObject("category", category);
				modelAndViewObj.addObject("subcategoryName", subcategory);
				modelAndViewObj.addObject("department", department);
				modelAndViewObj.addObject("selectedLocation",location);
				modelAndViewObj.addObject("reportStr",reportStr);
				modelAndViewObj.addObject("OrderVsStockList",salesReportList);
				modelAndViewObj.addObject("startdate",startDate);
				modelAndViewObj.addObject("enddate",endDate);
				modelAndViewObj.addObject("zone",zone);
			modelAndViewObj.setViewName("Inventory Manager/Orders/orderVSstock");
//		}
	}catch(Exception e){
		e.printStackTrace();
	
		modelAndViewObj.setViewName("Inventory Manager/Orders/orderVSstock");
//		}
	}
	modelAndViewObj.addObject("maxRecords",maxRecords);
	modelAndViewObj.addObject("zone",zone);
	
	return modelAndViewObj;
}



/*@RequestMapping(value="/updateStockPosting",method=RequestMethod.POST,consumes="application/json")
*/


@RequestMapping(value="/updateStockPosting",method=RequestMethod.POST)
public ModelAndView updateStockPosting(@RequestParam("formData") String formData,HttpServletRequest request,HttpServletResponse response){
	String result ="",customerIdStr = null,emailIdStr =null;
	List<WHStockVerificationPosting> stockVerificationDetailsList = null;
	WareHouseStockVerificationBean wareHouseStockVerificationBean = null;
	try{
		modelAndViewObj = new ModelAndView();
		
		
		customerIdStr = (String)request.getSession().getAttribute("customerId");
		emailIdStr = (String)request.getSession().getAttribute("emailId");
		wareHouseStockVerificationBean = gson.fromJson(formData,WareHouseStockVerificationBean.class);
		
		result=warehouseServiceObj.updateStockPosting(wareHouseStockVerificationBean)	;
		
		stockVerificationDetailsList = warehouseServiceObj.getStocksPosting(customerIdStr,emailIdStr,"","","","0","","","10","","",wareHouseStockVerificationBean.getPostingList().get(0).getSku_id(),wareHouseStockVerificationBean.getPostingList().get(0).getVerification_reference());
		
		//////System.out.println(gson.toJson(stockVerificationDetailsList));
		if(result == AppProperties.getAppMessageByProperty("STOCKPOSTING_UPDATE_SUCCESS").trim() || result.equals(AppProperties.getAppMessageByProperty("STOCKPOSTING_UPDATE_SUCCESS").trim())){
		modelAndViewObj.addObject("success",result);
		}else{
			modelAndViewObj.addObject("err",result);	
		}
	   modelAndViewObj.addObject("StockPostingList",stockVerificationDetailsList);
		modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/editstockPosting");
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}





@RequestMapping("/viewWarehouseStorageStocks")
public ModelAndView viewWarehouseStorageStocks(@RequestParam("stockType") String stockType,@RequestParam("index") String index,
		@RequestParam("location") String locationStr,@RequestParam("maxRecords") String maxRecords,@RequestParam("flowUnder") String flowUnder,
		@RequestParam("zone") String zone,@RequestParam("category") String category,
		@RequestParam("subcategory") String subcategory,@RequestParam("brand") String brand,@RequestParam("department") String department,
		@RequestParam("startdate") String startdate,@RequestParam("enddate") String enddate,
		@RequestParam("startprice") Float startprice,@RequestParam("endprice") Float endprice ,@RequestParam("stockdownload") Boolean stockdownload,@RequestParam("suppliername") String suppliername,@RequestParam("searchName") String searchName,@RequestParam("StorageArea") String StorageArea,
	HttpServletRequest request,HttpServletResponse response){
	String customerIdStr=null,emailIdStr=null;
	List<SkuDetails> skuDetailsList=null;
	//List<String> locationsList=null;
	List<String> locationsListValue=new ArrayList<String>();
	ArrayList<LocationBean> locationBeansList = new ArrayList<LocationBean>();
	String locationListAll = "";
	try{
		int start = 1,  end = Integer.parseInt(maxRecords);
		customerIdStr = (String)request.getSession().getAttribute("customerId");
		emailIdStr  = (String)request.getSession().getAttribute("emailId");
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
		List<Suppliers> supplierList =(List<Suppliers>)request.getSession().getAttribute("supplierList");
		if(supplierList==null || supplierList.size()==0 || supplierList.isEmpty()){
			 supplierList = outletMasterServiceObj.getSuppliers(customerIdStr, emailIdStr,"-1","","");
			request.getSession().setAttribute("supplierList", supplierList);
		}
//		List<String> brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
		
		List<String> brandsList = (List<String>)request.getSession().getAttribute("brandsList");
		if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
		 brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
			request.getSession().setAttribute("brandsList", brandsList);
		}
		
		modelAndViewObj = new ModelAndView();
		if(flowUnder.equals("outlet")){
		//	locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			
			

			
			if(zone == null || zone.trim().equals(""))
				locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			else
				locationBeansList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");
			
			
			
		}else{
			locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
			
		}
		
		modelAndViewObj.addObject("locationsList", locationBeansList);
		if(locationStr.equals("all")|| locationStr.equals("")){
			if(locationBeansList != null){
				for(int i=0;i<locationBeansList.size();i++){
				
					locationsListValue.add(locationBeansList.get(i).getLocationId());
						
				}
			for (String string : locationsListValue) {
				
				locationListAll = locationListAll+string+",";
			}
			}
			
		}
			
			modelAndViewObj.addObject("zoneList", zoneList);
			modelAndViewObj.addObject("departmentList", departmentList);
			modelAndViewObj.addObject("categoryList", categoryList);
			modelAndViewObj.addObject("subCategoryDetailsList", subCategoryDetailsList);
			modelAndViewObj.addObject("brandsList", brandsList);
			skuDetailsList = skuServiceObj.getStorageProductStocks(searchName,"",startdate,enddate,locationStr,stockType,customerIdStr,emailIdStr,index,flowUnder,zone,category,subcategory,brand,department,startprice,endprice,stockdownload,suppliername,maxRecords,locationListAll,StorageArea);
			
			if(locationStr != null && !locationStr.equals(""))
				request.getSession().setAttribute("selectedLocation",locationStr);
			if(skuDetailsList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(skuDetailsList.size()<10){
					end = (skuDetailsList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(skuDetailsList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("totalcost",skuDetailsList.get(0).getTotalPrice());
				modelAndViewObj.addObject("totalquantity",skuDetailsList.get(0).getTotalQuantity());
			}
			if(stockdownload){
			modelAndViewObj.addObject("downloadurl",skuDetailsList.get(0).getStockDownload());
			modelAndViewObj.addObject("downloadDaywiseurl",skuDetailsList.get(0).getStockDaywiseDownload());
			}
			modelAndViewObj.addObject("skuDetailsList",skuDetailsList);
			modelAndViewObj.addObject("selectedLocation",locationStr);
		modelAndViewObj.addObject("maxRecords",Integer.parseInt(maxRecords));
		modelAndViewObj.addObject("stockType",stockType);
		String jsp = stockType + "Stock";
		modelAndViewObj.addObject("startdate", startdate);
		modelAndViewObj.addObject("enddate", enddate);
		modelAndViewObj.addObject("zone", zone);
		modelAndViewObj.addObject("endprice", endprice);
		modelAndViewObj.addObject("startprice", startprice);
		modelAndViewObj.addObject("category", category);
		modelAndViewObj.addObject("subcategory", subcategory);
		modelAndViewObj.addObject("brand", brand);
		modelAndViewObj.addObject("department", department);
		modelAndViewObj.addObject("suppliername", suppliername);
		modelAndViewObj.addObject("searchName", searchName);
		modelAndViewObj.addObject("StorageArea", StorageArea);
		modelAndViewObj.setViewName("Storage/"+jsp);
		
	}catch(Exception e){
		e.printStackTrace();
	}	
	modelAndViewObj.addObject("flowUnder", flowUnder);
	return modelAndViewObj;
}




@RequestMapping("/searchStorageStocks")
public ModelAndView searchStorageStocks(@RequestParam("searchType") String searchTypeStr,@RequestParam("stockType") String stockType,@RequestParam("index") String index,
		@RequestParam("location") String locationStr,@RequestParam("maxRecords") String maxRecords,@RequestParam("flowUnder") String flowUnder,
		@RequestParam("searchName") String searchName,@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,@RequestParam("locationList") String locationListAll,
	HttpServletRequest request,HttpServletResponse response){
	String customerIdStr=null,emailIdStr=null;
	List<SkuDetails> skuDetailsList=null;
	List<String> locationsListValue=null;
	List<String> locationsList=null;
	ArrayList<LocationBean> locationBeansList = null;
	try{
		int start = 1,end = 10;
		customerIdStr = (String)request.getSession().getAttribute("customerId");
		emailIdStr  = (String)request.getSession().getAttribute("emailId");
		modelAndViewObj = new ModelAndView();
		if(flowUnder.equals("outlet")){
		//	locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);	
			
			
	
		}
			else
			{
//				locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
				locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,false);
//				modelAndViewObj.addObject("locationsList", locationsList);
				
			}
				
		    modelAndViewObj.addObject("locationsList", locationBeansList);
			skuDetailsList = skuServiceObj.getStorageProductStocks(searchName,searchTypeStr,startDate,endDate,locationStr,stockType,customerIdStr,emailIdStr,index,flowUnder,"","","","","",0f,0f,false,"","10",locationListAll,"");
			request.getSession().setAttribute("selectedLocation",locationStr);
			if(skuDetailsList == null || skuDetailsList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(skuDetailsList.size()<10){
					end = (skuDetailsList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(skuDetailsList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("totalcost",skuDetailsList.get(0).getTotalPrice());
				modelAndViewObj.addObject("totalquantity",skuDetailsList.get(0).getTotalQuantity());
			}
			modelAndViewObj.addObject("searchName", searchName);
			modelAndViewObj.addObject("startdate", startDate);
			modelAndViewObj.addObject("enddate", endDate);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
			modelAndViewObj.addObject("skuDetailsList",skuDetailsList);
			modelAndViewObj.addObject("selectedLocation",locationStr);
			modelAndViewObj.addObject("searchType",searchTypeStr);
		    modelAndViewObj.addObject("stockType",stockType);
	String jsp = stockType + "Stock";
		    modelAndViewObj.setViewName("Storage/"+jsp);
		
	}catch(Exception e){
		e.printStackTrace();
	}
	modelAndViewObj.addObject("flowUnder", flowUnder);
	return modelAndViewObj;
}



@RequestMapping("/searchProductsforEventManagement")
public @ResponseBody List<ProductsList> searchProductsforEventManagement(@RequestParam("searchName") String searchNameStr,@RequestParam("storeLocation")String storeLocation,@RequestParam("searchCategory")String searchCategory,@RequestParam("category")String category, HttpServletRequest request,HttpServletResponse response) {
	String customerIdStr = null,emailIdStr=null;
	List<ProductsList> productsList = new ArrayList<ProductsList>();
	try{
		// log.info("searchProducts");
		customerIdStr = (String)request.getSession().getAttribute("customerId");
		emailIdStr = (String)request.getSession().getAttribute("emailId");
		if(searchCategory.contains("eventInventory")){
		productsList = skuServiceObj.searchProductsforInventory(customerIdStr, emailIdStr,searchNameStr,storeLocation,category,"",false);
		}else{
		productsList = skuServiceObj.searchProductsforEvents(customerIdStr, emailIdStr,searchNameStr,storeLocation,category,"",false,"","",false);
		}// log.info("Result:::"+productsList);
	
	}catch(Exception e){
		e.printStackTrace();
	}
	return productsList;
}





@RequestMapping("/viewWarehouseStoragePickList")
public ModelAndView viewWarehouseStoragePickList(@RequestParam("stockType") String stockType,@RequestParam("index") String index,
		@RequestParam("location") String locationStr,@RequestParam("maxRecords") String maxRecords,@RequestParam("flowUnder") String flowUnder,
		@RequestParam("zone") String zone,@RequestParam("category") String category,
		@RequestParam("subcategory") String subcategory,@RequestParam("brand") String brand,@RequestParam("department") String department,
		@RequestParam("startdate") String startdate,@RequestParam("enddate") String enddate,
		@RequestParam("startprice") Float startprice,@RequestParam("endprice") Float endprice ,@RequestParam("stockdownload") Boolean stockdownload,@RequestParam("suppliername") String suppliername,@RequestParam("searchName") String searchName,@RequestParam("StorageArea") String StorageArea,
	HttpServletRequest request,HttpServletResponse response){
	String customerIdStr=null,emailIdStr=null;
	List<WarehousePicklistMaster> warehousePicklistMasters=null;
	//List<String> locationsList=null;
	List<String> locationsListValue=new ArrayList<String>();
	ArrayList<LocationBean> locationBeansList = new ArrayList<LocationBean>();
	String locationListAll = "";
	try{
		int start = 1,  end = Integer.parseInt(maxRecords);
		customerIdStr = (String)request.getSession().getAttribute("customerId");
		emailIdStr  = (String)request.getSession().getAttribute("emailId");
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
		List<Suppliers> supplierList =(List<Suppliers>)request.getSession().getAttribute("supplierList");
		if(supplierList==null || supplierList.size()==0 || supplierList.isEmpty()){
			 supplierList = outletMasterServiceObj.getSuppliers(customerIdStr, emailIdStr,"-1","","");
			request.getSession().setAttribute("supplierList", supplierList);
		}
//		List<String> brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
		
		List<String> brandsList = (List<String>)request.getSession().getAttribute("brandsList");
		if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
		 brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
			request.getSession().setAttribute("brandsList", brandsList);
		}
		
		modelAndViewObj = new ModelAndView();
		if(flowUnder.equals("outlet")){
		//	locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			
			

			
			if(zone == null || zone.trim().equals(""))
				locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			else
				locationBeansList = genericMasterServiceObj.getLocationsOnZoneAndBussinessActivity(zone, customerIdStr, emailIdStr, "Retail Outlet");
			
			
			
		}else{
			locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
			
		}
		
		modelAndViewObj.addObject("locationsList", locationBeansList);
		if(locationStr.equals("all")|| locationStr.equals("")){
			if(locationBeansList != null){
				for(int i=0;i<locationBeansList.size();i++){
					locationsListValue.add(locationBeansList.get(i).getLocationId());
						
				}
			for (String string : locationsListValue) {
				
				locationListAll = locationListAll+string+",";
			}
			}
		}
			
			modelAndViewObj.addObject("zoneList", zoneList);
			modelAndViewObj.addObject("departmentList", departmentList);
			modelAndViewObj.addObject("categoryList", categoryList);
			modelAndViewObj.addObject("subCategoryDetailsList", subCategoryDetailsList);
			modelAndViewObj.addObject("brandsList", brandsList);
			warehousePicklistMasters = skuServiceObj.getStorageProductPicklist(searchName,"",startdate,enddate,locationStr,stockType,customerIdStr,emailIdStr,index,flowUnder,zone,category,subcategory,brand,department,startprice,endprice,stockdownload,suppliername,maxRecords,locationListAll,StorageArea);
			
			if(locationStr != null && !locationStr.equals(""))
				request.getSession().setAttribute("selectedLocation",locationStr);
			if(warehousePicklistMasters == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(warehousePicklistMasters.size()<10){
					end = (warehousePicklistMasters.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", (warehousePicklistMasters.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			float totalcost = 0.0f;
			
			if(warehousePicklistMasters != null){
			for(int i = 0;i<warehousePicklistMasters.size();i++){
				
				
				for(int j = 0;j<warehousePicklistMasters.get(i).getWarehousePickListItems().size();j++){
					totalcost = warehousePicklistMasters.get(i).getWarehousePickListItems().get(j).getCostPrice();
				}
				
				warehousePicklistMasters.get(i).setTotalCost(totalcost);
			}
			}
			
		modelAndViewObj.addObject("PicklistDetailsList",warehousePicklistMasters);
		modelAndViewObj.addObject("selectedLocation",locationStr);
		modelAndViewObj.addObject("maxRecords",Integer.parseInt(maxRecords));
		modelAndViewObj.addObject("stockType",stockType);
		String jsp = stockType + "Stock";
		modelAndViewObj.addObject("startdate", startdate);
		modelAndViewObj.addObject("enddate", enddate);
		modelAndViewObj.addObject("zone", zone);
		modelAndViewObj.addObject("endprice", endprice);
		modelAndViewObj.addObject("startprice", startprice);
		modelAndViewObj.addObject("category", category);
		modelAndViewObj.addObject("subcategory", subcategory);
		modelAndViewObj.addObject("brand", brand);
		modelAndViewObj.addObject("department", department);
		modelAndViewObj.addObject("suppliername", suppliername);
		modelAndViewObj.addObject("searchName", searchName);
		modelAndViewObj.addObject("StorageArea", StorageArea);
		modelAndViewObj.setViewName("Storage/"+jsp);
		
	}catch(Exception e){
		e.printStackTrace();
	}	
	modelAndViewObj.addObject("flowUnder", flowUnder);
	return modelAndViewObj;
}




@RequestMapping(value = "/newPickList")
public ModelAndView newPickList(HttpServletRequest request,HttpServletResponse response) {
	String customerIdStr=null,emailIdStr=null;
	try{
		ArrayList<LocationBean> locationBeansList = new ArrayList<LocationBean>();	
		customerIdStr = (String)request.getSession().getAttribute("customerId");
		emailIdStr  = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();	
			
			locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
            modelAndViewObj.addObject("locationsList", locationBeansList);
			
			
			modelAndViewObj.setViewName("Storage/newPicklist"); 
		
		}catch(Exception e){
		e.printStackTrace();
	}
	return modelAndViewObj;
}


@RequestMapping(value = "/viewpicklistDetails")
public ModelAndView viewpicklistDetails(@RequestParam("operation")String operation,@RequestParam("pickListId")String pickListId,HttpServletRequest request,HttpServletResponse response) {
	String customerIdStr=null,emailIdStr=null;
	try{
		List<WarehousePicklistMaster> warehousePicklistMasters=null;
		
		ArrayList<LocationBean> locationBeansList = new ArrayList<LocationBean>();	
		customerIdStr = (String)request.getSession().getAttribute("customerId");
		emailIdStr  = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();	
			
			locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
            modelAndViewObj.addObject("locationsList", locationBeansList);
            warehousePicklistMasters = skuServiceObj.getStorageProductPicklistEdit("","","","","","",customerIdStr,emailIdStr,"","","","","","","",0.0f,0.0f,false,"","","","",pickListId);
        	
            modelAndViewObj.addObject("PicklistDetailsList",warehousePicklistMasters);
            
            if(operation.equals("view"))
    			modelAndViewObj.setViewName("Storage/viewpicklist");
    			else
    			modelAndViewObj.setViewName("Storage/editpicklist");	
		}catch(Exception e){
		e.printStackTrace();
	}
	return modelAndViewObj;
}                     




@RequestMapping(value = "/generatePickList")
public ModelAndView generatePickList(@RequestParam("startDate") String startDate,@RequestParam("outletLocation") String outletLocation,@RequestParam("StockReqType") String StockReqType ,HttpServletRequest request,HttpServletResponse response) {
	String customerIdStr=null,emailIdStr=null;
	List<UpdateDto> updateDtos=null;
	
	try{
		ArrayList<LocationBean> locationBeansList = new ArrayList<LocationBean>();	
		customerIdStr = (String)request.getSession().getAttribute("customerId");
		emailIdStr  = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();	
			
			locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
			
			updateDtos = skuServiceObj.generatePicklistdetails(customerIdStr,emailIdStr,startDate,outletLocation,StockReqType);

			modelAndViewObj.addObject("locationsList", locationBeansList);
			
			modelAndViewObj.addObject("updateDtos", updateDtos);
			modelAndViewObj.setViewName("Storage/picklistPagination"); 
		
		}catch(Exception e){
		e.printStackTrace();
	}
	return modelAndViewObj;
}




@RequestMapping("/getSkuDetailsForEventInventory")
public @ResponseBody String getSkuDetailsForEventInventory(@RequestParam("skuId") String skuIdStr,@RequestParam("storeLocation")String storeLocation,@RequestParam("mrp")String mrp,@RequestParam("plucode")String plucode,HttpServletRequest request,HttpServletResponse response) {
	String customerIdStr = null,emailIdStr=null,responseStr = null;
	try{
		customerIdStr = (String)request.getSession().getAttribute("customerId");
		emailIdStr = (String)request.getSession().getAttribute("emailId");
		
			responseStr = skuServiceObj.getSkuDetailsForInventory(customerIdStr, emailIdStr,skuIdStr,storeLocation,mrp,plucode);
	}catch(Exception e){
		e.printStackTrace();
	}
	return responseStr;
}




@RequestMapping("/searchGoodsReturn")
public @ResponseBody List<String> searchGoodsReturn(@RequestParam("searchName") String searchNameStr,@RequestParam("returnToLocation") String returnToLocation,HttpServletRequest request,HttpServletResponse response) {
	String customerIdStr = null,emailIdStr=null;
	List<String> returnRefList = new ArrayList<String>();
	try{
		// log.info("searchGoodsIssue");
		customerIdStr = (String)request.getSession().getAttribute("customerId");
		emailIdStr = (String)request.getSession().getAttribute("emailId");
		ArrayList<LocationBean> locationDetails = genericMasterServiceObj.getLocationDetails(returnToLocation,customerIdStr, emailIdStr,"0","",false,true,true);
		returnRefList = stockIssueServiceObj.getStockReturnIds(customerIdStr, emailIdStr, returnToLocation, searchNameStr,locationDetails.get(0).getBusinessActivity());
		// log.info("Result:::"+issueRefList);
	
	}catch(Exception e){
		e.printStackTrace();
	}
	return returnRefList;
}


@RequestMapping("/getGoodsReturn")
public @ResponseBody List<StockReturnList> getGoodsReturn(@RequestParam("retrunNoteRef") String retrunNoteRef,@RequestParam("flowUnder") String flowUnder,@RequestParam("formData") String formData,HttpServletRequest request,HttpServletResponse response){
	String customerIdStr=null,emailIdStr=null;
	List<StockReturn> stockReturnsList = null;
	
	try{
		// log.info("editSku");
	    customerIdStr = (String)request.getSession().getAttribute("customerId");
		emailIdStr = (String)request.getSession().getAttribute("emailId");
		StockReturn skuObj=gson.fromJson(formData, StockReturn.class);
	    stockReturnsList = stockIssueServiceObj.getStockReturn(customerIdStr, emailIdStr,skuObj.getFromLocation(),"",retrunNoteRef, "0","","","10",flowUnder);
	
	    stockReturnsList.get(0).getStockList().get(0).setFromLocation( stockReturnsList.get(0).getFromLocation());
	    stockReturnsList.get(0).getStockList().get(0).setReturnBy( stockReturnsList.get(0).getReturnBy());
	    stockReturnsList.get(0).getStockList().get(0).setShippedBy( stockReturnsList.get(0).getShippedBy());

	
	}
	catch(Exception e){
		e.printStackTrace();
	}
	
	
	return stockReturnsList.get(0).getStockList();
}



@RequestMapping("/searchWHTaxationMaster")
public ModelAndView searchWHTaxationMaster(@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,@RequestParam("location") String location, @RequestParam("locationList") String locationListAll,HttpServletRequest request,HttpServletResponse response) {
	String customerIdStr = null,emailIdStr=null;
	ArrayList<LocationBean> workLocationsList = null;
	try{
		// log.info("searchStoreTaxationMaster");
		int start = 1,end = 10;
		customerIdStr = (String)request.getSession().getAttribute("customerId");
		emailIdStr = (String)request.getSession().getAttribute("emailId");
	//	List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
		workLocationsList =  genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","Warehouse",false,false,true);

		
		List<WarehouseTaxation> storeTaxationList = adminServiceObj.getWarehouseTaxation(searchNameStr, customerIdStr, emailIdStr, index,location,null,true,maxRecords,locationListAll);
		modelAndViewObj = new ModelAndView();
		if(location != null && !location.equals(""))
			request.getSession().setAttribute("selectedLocation", location);
		modelAndViewObj.addObject("selectedLocation", location);
		if(storeTaxationList == null || storeTaxationList.size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(storeTaxationList.size()<10){
				end = (storeTaxationList.size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			modelAndViewObj.addObject("totalRecords", Integer.parseInt(storeTaxationList.get(0).getTotalRecords()));
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
		}
		modelAndViewObj.addObject("workLocationsList", workLocationsList);
		modelAndViewObj.addObject("storeTaxationList", storeTaxationList);
	    modelAndViewObj.addObject("searchName", searchNameStr);
	    modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
	    modelAndViewObj.setViewName("Inventory Manager/warehouse/taxation/WHTaxationMaster");
	}catch(Exception e){
		e.printStackTrace();
	}
	return modelAndViewObj;
}



@RequestMapping("/loadStockverifications")
public ModelAndView loadStockverifications(@RequestParam("index") String index,
		@RequestParam("flowUnder") String flowUnder,
		@RequestParam("location") String location, 
		@RequestParam("searchName") String searchName, 
		@RequestParam("verificationCode") String verificationCode, 
		@RequestParam("startDate") String startDate,
		@RequestParam("endDate") String endDate,
		@RequestParam("zone") String zone ,
		@RequestParam("maxRecords") String maxRecords,
		@RequestParam("department") String department,
		@RequestParam("subdepartment") String subdepartment,
		@RequestParam("category") String category,
		@RequestParam("subcategory") String subcategory,
		@RequestParam("section") String section,
	HttpServletRequest request,HttpServletResponse response) {

List<String> locationsList = null;
List<WareHouseStockVerification> stockVerificationDetailsList = null;
//List<String> locationsList = null;
List<String> warehouselocationsList = null;
try{
	// log.info("viewStockVerificationReport");
	int start = 1,end = Integer.parseInt(maxRecords);
	String customerIdStr = (String)request.getSession().getAttribute("customerId");
	String emailIdStr  = (String)request.getSession().getAttribute("emailId");


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

	String resultStr = storeStockVerificationServiceObj.getProductVerificationLoad(customerIdStr,emailIdStr,location);
	
	stockVerificationDetailsList = new ArrayList<WareHouseStockVerification>();
	if(flowUnder.equals("outlet")){
		stockVerificationDetailsList = storeStockVerificationServiceObj.getProductVerificationReport(customerIdStr,emailIdStr,location,searchName,index,startDate,endDate,maxRecords,flowUnder,verificationCode,category,subcategory,department,subdepartment);

		locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
	}

	else{
		stockVerificationDetailsList = storeStockVerificationServiceObj.getProductVerificationReport(customerIdStr,emailIdStr,location,searchName,index,startDate,endDate,maxRecords,flowUnder,verificationCode,category,subcategory,department,subdepartment);
		locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
	}
	
	

	modelAndViewObj = new ModelAndView();
	
	modelAndViewObj.addObject("locationsList", locationsList);

	if(stockVerificationDetailsList == null || stockVerificationDetailsList.size() == 0){
		modelAndViewObj.addObject("totalRecords","0");
		modelAndViewObj.addObject("index", "0");
		modelAndViewObj.addObject("totalValue", "0");
	}
	else{
		if(stockVerificationDetailsList.size()<Integer.parseInt(maxRecords)){
			end = (stockVerificationDetailsList.size())+(Integer.parseInt(index));
		}else{
			end = (Integer.parseInt(index)+end);
		}
		modelAndViewObj.addObject("totalRecords", Integer.parseInt(stockVerificationDetailsList.get(0).getTotalRecords()));
		modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
		modelAndViewObj.addObject("totalValue", end);
	}

	modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
	modelAndViewObj.addObject("startDate",startDate);
	modelAndViewObj.addObject("endDate",endDate);
	modelAndViewObj.addObject("flowUnder", flowUnder);
	modelAndViewObj.addObject("zone", zone);
	modelAndViewObj.addObject("searchName", searchName);
	modelAndViewObj.addObject("location", location);
	modelAndViewObj.addObject("department", department);
	modelAndViewObj.addObject("subdepartment", subdepartment);
	modelAndViewObj.addObject("category", category);
	modelAndViewObj.addObject("subcategory", subcategory);
	modelAndViewObj.addObject("section", section);
	modelAndViewObj.addObject("resultStr", resultStr);
	
	modelAndViewObj.addObject("StockVerificationDetailsList",stockVerificationDetailsList);
	modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/stockVerificationReport");

}catch(Exception e){
	e.printStackTrace();
	modelAndViewObj.addObject("err",Utilities.getResponseCode("CONTACT_ADMIN"));
	modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/allverifiedproductstocks");
}
return modelAndViewObj;
}



@RequestMapping("/loadstocverficationswarehouse")
public ModelAndView loadstocverficationswarehouse(@RequestParam("index") String index,
		@RequestParam("flowUnder") String flowUnder,
		@RequestParam("location") String location, 
		@RequestParam("searchName") String searchName, 
		@RequestParam("verificationCode") String verificationCode, 
		@RequestParam("startDate") String startDate,
		@RequestParam("endDate") String endDate,
		@RequestParam("zone") String zone ,
		@RequestParam("maxRecords") String maxRecords,
		@RequestParam("department") String department,
		@RequestParam("subdepartment") String subdepartment,
		@RequestParam("category") String category,
		@RequestParam("subcategory") String subcategory,
		@RequestParam("section") String section,
	HttpServletRequest request,HttpServletResponse response) {

List<String> locationsList = null;
List<WareHouseStockVerification> stockVerificationDetailsList = null;
//List<String> locationsList = null;
List<String> warehouselocationsList = null;
try{
	// log.info("viewStockVerificationReport");
	int start = 1,end = Integer.parseInt(maxRecords);
	String customerIdStr = (String)request.getSession().getAttribute("customerId");
	String emailIdStr  = (String)request.getSession().getAttribute("emailId");


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

	String resultStr = storeStockVerificationServiceObj.getProductVerificationLoadWarehouse(customerIdStr,emailIdStr,location);
	
	stockVerificationDetailsList = new ArrayList<WareHouseStockVerification>();
	if(flowUnder.equals("warehouse")){
		stockVerificationDetailsList = storeStockVerificationServiceObj.getProductVerificationReport(customerIdStr,emailIdStr,location,searchName,index,startDate,endDate,maxRecords,flowUnder,verificationCode,category,subcategory,department,subdepartment);

		/*locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);*/
		locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
	}

	else{
		stockVerificationDetailsList = storeStockVerificationServiceObj.getProductVerificationReport(customerIdStr,emailIdStr,location,searchName,index,startDate,endDate,maxRecords,flowUnder,verificationCode,category,subcategory,department,subdepartment);
		/*locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);*/
		locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
	}
	
	

	modelAndViewObj = new ModelAndView();
	
	modelAndViewObj.addObject("locationsList", locationsList);

	if(stockVerificationDetailsList == null || stockVerificationDetailsList.size() == 0){
		modelAndViewObj.addObject("totalRecords","0");
		modelAndViewObj.addObject("index", "0");
		modelAndViewObj.addObject("totalValue", "0");
	}
	else{
		if(stockVerificationDetailsList.size()<Integer.parseInt(maxRecords)){
			end = (stockVerificationDetailsList.size())+(Integer.parseInt(index));
		}else{
			end = (Integer.parseInt(index)+end);
		}
		modelAndViewObj.addObject("totalRecords", Integer.parseInt(stockVerificationDetailsList.get(0).getTotalRecords()));
		modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
		modelAndViewObj.addObject("totalValue", end);
	}

	modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
	modelAndViewObj.addObject("startDate",startDate);
	modelAndViewObj.addObject("endDate",endDate);
	modelAndViewObj.addObject("flowUnder", flowUnder);
	modelAndViewObj.addObject("zone", zone);
	modelAndViewObj.addObject("searchName", searchName);
	modelAndViewObj.addObject("location", location);
	modelAndViewObj.addObject("department", department);
	modelAndViewObj.addObject("subdepartment", subdepartment);
	modelAndViewObj.addObject("category", category);
	modelAndViewObj.addObject("subcategory", subcategory);
	modelAndViewObj.addObject("section", section);
	modelAndViewObj.addObject("resultStr", resultStr);
	
	modelAndViewObj.addObject("StockVerificationDetailsList",stockVerificationDetailsList);
	modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/stockVerificationReport");

}catch(Exception e){
	e.printStackTrace();
	modelAndViewObj.addObject("err",Utilities.getResponseCode("CONTACT_ADMIN"));
	modelAndViewObj.setViewName("Inventory Manager/warehouse/stockVerification/allverifiedproductstocks");
}
return modelAndViewObj;
}





@RequestMapping("/showWarehouseStorageFlow")
public ModelAndView showWarehouseStorageFlow(HttpServletRequest request,HttpServletResponse response){
	// log.info("showWarehouseStocksFlow");
	modelAndViewObj = new ModelAndView();
	modelAndViewObj.setViewName("Stocks/warehouseStorageflow");
	return modelAndViewObj;
}


@RequestMapping("/showWarehouseStocksverficationflow")
public ModelAndView showWarehouseStocksverficationflow(HttpServletRequest request,HttpServletResponse response){
	// log.info("showWarehouseStocksFlow");
	modelAndViewObj = new ModelAndView();
	modelAndViewObj.setViewName("Stocks/warehousestockverification");
	return modelAndViewObj;
}

@RequestMapping("/showStockverfication")
public ModelAndView showStockverfication(HttpServletRequest request,HttpServletResponse response){
	// log.info("InventoryManagerController - showInventoryManagementFlows");
	modelAndViewObj = new ModelAndView();
	modelAndViewObj.setViewName("Inventory Manager/retailoutlets/showstockverfication");
	return modelAndViewObj;
}




@RequestMapping("/printVerficationItems")
public void printVerficationItems(@RequestParam("verno") String verno,@RequestParam("location") String location,HttpServletRequest request,HttpServletResponse response){
	String url1 = null;
	try{
		// log.info("printPurchaseOrderDetails");
		//////////System.out.println("printPurchaseOrderDetails");
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
	
		 //String result = procurementServiceObj.printShipmentReturnDetails(PO_Ref,customerIdStr, emailIdStr);
		
		 url1 = storeStockVerificationServiceObj.getverifiedItems(verno,location,customerIdStr,emailIdStr);
			
		  
		 
		  if(url1 != null ){
		if(url1.contains("csv"))
			url1= url1;
		else 
			url1 = "Sorry please try after some time";
		  }else{
			  url1 = "Sorry please try after some time";
		  }
		  response.setContentType("application/text");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(url1);
		}catch (RemoteException e) {
			e.printStackTrace();
		}
		catch (IOException e) {
			e.printStackTrace();
		}
		}



@RequestMapping("/printNonVerficationItems")
public void printNonVerficationItems(@RequestParam("verno") String verno,@RequestParam("location") String location,HttpServletRequest request,HttpServletResponse response){

	String url2 = null;
	try{
		// log.info("printPurchaseOrderDetails");
		//////////System.out.println("printPurchaseOrderDetails");
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		
		 //String result = procurementServiceObj.printShipmentReturnDetails(PO_Ref,customerIdStr, emailIdStr);
		try {
		 url2 = storeStockVerificationServiceObj.getNonverifiedItems(verno,location,customerIdStr,emailIdStr);
		}catch (Exception e) {
			e.printStackTrace();
		}
		// ////System.out.println(gson.toJson(storeShipmentReturnList));
				
		  
		  String jsonString = null;
		  if(url2 != null ){
		if(url2.contains("csv") )
			url2= url2;
		else 
			url2 = "Sorry please try after some time";
		  }else{
			  url2 = "Sorry please try after some time";
		  }
		  
		  response.setContentType("application/text");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(url2);
		}catch (RemoteException e) {
			e.printStackTrace();
		}
		catch (IOException e) {
			e.printStackTrace();
		}
		}



@RequestMapping("/viewOutletStockPosting")
public ModelAndView viewOutletStockPosting(@RequestParam("index") String index,
		@RequestParam("flowUnder") String flowUnder,
		@RequestParam("location") String location, 
		@RequestParam("searchName") String searchName, 
		@RequestParam("startDate") String startDate,
		@RequestParam("endDate") String endDate,
		@RequestParam("zone") String zone ,
		@RequestParam("maxRecords") String maxRecords,
		@RequestParam("department") String department,
		@RequestParam("subdepartment") String subdepartment,
		@RequestParam("category") String category,
		@RequestParam("subcategory") String subcategory,
		@RequestParam("section") String section,
	HttpServletRequest request,HttpServletResponse response) {
	
	List<String> locationsList = null;
	List<StoreStockVerificationPosting> stockPostingDetailsList = null;
	List<StoreStockVerificationPosting> stockPostingDetailsListfinal = null;

	//List<String> locationsList = null;
	List<String> warehouselocationsList = null;
	try{
		// log.info("viewStockVerificationReport");
		int start = 1,end = Integer.parseInt(maxRecords);
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr  = (String)request.getSession().getAttribute("emailId");


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

		stockPostingDetailsList = new ArrayList<StoreStockVerificationPosting>();
		stockPostingDetailsListfinal = new ArrayList<StoreStockVerificationPosting>();
		if(flowUnder.equals("outlet")){
			stockPostingDetailsList = storeStockVerificationServiceObj.getOutletStockPosting(customerIdStr,emailIdStr,location,zone,searchName,index,startDate,endDate,maxRecords,department,subdepartment,category,subcategory,section,flowUnder, "", "");
			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
		}else{
			
			locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
		}
		
		
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("locationsList", locationsList);
		
		if(stockPostingDetailsList == null || stockPostingDetailsList.size() == 0){
			modelAndViewObj.addObject("stockPostingDetailsList",stockPostingDetailsList);
			}
			else {
			Set<String> stringSet = new HashSet<String>();
			for(StoreStockVerificationPosting posting : stockPostingDetailsList){
				stringSet.add(posting.getVerification_code());
			}
			//////System.out.println(stringSet);
			
			for(String verCode : stringSet){
				int count =0;
			for(StoreStockVerificationPosting posting : stockPostingDetailsList){
				if(count == 0 && verCode.equalsIgnoreCase(posting.getVerification_code())){
					stockPostingDetailsListfinal.add(posting);
					count= count+1;
					}
				}
			}
			modelAndViewObj.addObject("stockPostingDetailsList",stockPostingDetailsListfinal);
		}  

		if(stockPostingDetailsList == null || stockPostingDetailsList.size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(stockPostingDetailsList.size()<Integer.parseInt(maxRecords)){
				end = (stockPostingDetailsList.size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			modelAndViewObj.addObject("totalRecords", Integer.parseInt(stockPostingDetailsList.get(0).getTotalRecords()));
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
		}

		modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
		modelAndViewObj.addObject("startDate",startDate);
		modelAndViewObj.addObject("endDate",endDate);
		modelAndViewObj.addObject("flowUnder", flowUnder);
		modelAndViewObj.addObject("zone", zone);
		modelAndViewObj.addObject("searchName", searchName);
		modelAndViewObj.addObject("location", location);
		modelAndViewObj.addObject("department", department);
		modelAndViewObj.addObject("subdepartment", subdepartment);
		modelAndViewObj.addObject("category", category);
		modelAndViewObj.addObject("subcategory", subcategory);
		modelAndViewObj.addObject("section", section);
		modelAndViewObj.setViewName("Inventory Manager/storeStockPosting/storeStockPosting");

	}catch(Exception e){
		e.printStackTrace();
		modelAndViewObj.addObject("err",Utilities.getResponseCode("CONTACT_ADMIN"));
		modelAndViewObj.setViewName("Inventory Manager/storeStockPosting/storeStockPosting");
	}
	return modelAndViewObj;

}


@RequestMapping("/viewStoreStockUploadingData")
public ModelAndView viewStoreStockUploadingData(@RequestParam("index") String index,@RequestParam("maxRecords") String maxRecords,
		@RequestParam("flowUnder") String flowUnder,@RequestParam("ref") String ref,@RequestParam("operation") String operation,
	HttpServletRequest request,HttpServletResponse response) {
	
	List<String> locationsList = null;
	List<StoreStockVerificationPosting> storeStockPostingDetailsList = null;
	try{
		int start = 1,end = Integer.parseInt(maxRecords);
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr  = (String)request.getSession().getAttribute("emailId");

		List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
		if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
			zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"0","","");
			request.getSession().setAttribute("zoneList", zoneList);
		}
		
		List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
		if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
			categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
			request.getSession().setAttribute("categoryList", categoryList);
		}
		
		if(flowUnder.equals("outlet")){
			storeStockPostingDetailsList = storeStockVerificationServiceObj.getOutletStockPosting(customerIdStr,emailIdStr,"","","",index,"","","10","","","","","",flowUnder,"",ref);
			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
		}else{
			locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
		}
		
		modelAndViewObj = new ModelAndView();
		
		if(storeStockPostingDetailsList == null || storeStockPostingDetailsList.size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(storeStockPostingDetailsList.size()<Integer.parseInt(maxRecords)){
				end = (storeStockPostingDetailsList.size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			modelAndViewObj.addObject("StockPostingList",storeStockPostingDetailsList);
			modelAndViewObj.addObject("totalRecords", storeStockPostingDetailsList.get(0).getTotalRecords());
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
		}

		modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("flowUnder", flowUnder);
		modelAndViewObj.addObject("operation",operation);
		
			if(operation == "view" || operation.equals("view")){
		modelAndViewObj.setViewName("Inventory Manager/storeStockPosting/viewStoreStockPosting");
			}else{
		modelAndViewObj.setViewName("Inventory Manager/storeStockPosting/editStoreStockPosting");
			}
			
	}catch(Exception e){
		e.printStackTrace();
		modelAndViewObj.addObject("err",Utilities.getResponseCode("CONTACT_ADMIN"));
		modelAndViewObj.setViewName("Inventory Manager/storeStockPosting/storeStockPosting");
	}
	return modelAndViewObj;

}




@RequestMapping("/printStockPostingdetails")
public void printStockPostingdetails(@RequestParam("verno") String verno,HttpServletRequest request,HttpServletResponse response){

	String printpostingURL = null;
	try{
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		
		try {
			printpostingURL = storeStockVerificationServiceObj.printStockPostingdetails(verno,customerIdStr,emailIdStr);
		}catch (Exception e) {
			e.printStackTrace();
		}

		String jsonString = null;
		  if(printpostingURL != null ){
		if(printpostingURL.contains("csv") )
			printpostingURL= printpostingURL;
		else 
			printpostingURL = "Sorry please try after some time";
		  }else{
			  printpostingURL = "Sorry please try after some time";
		  }
		  
		  response.setContentType("application/text");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(printpostingURL);
		}catch (RemoteException e) {
			e.printStackTrace();
		}
		catch (IOException e) {
			e.printStackTrace();
		}
		}


public static String getStringFromList(java.util.List<String> pluList)
{
	String pluCodes="";
	for(String locationStr :pluList)
	{
		pluCodes += "'"+locationStr+"',";

	}
	pluCodes = pluCodes.substring(0, pluCodes.length() - ",".length());
	return pluCodes;
}


@RequestMapping(value = "/viewNewFleetMaster")
public ModelAndView viewNewFleetMaster(HttpServletRequest request,HttpServletResponse response) {
//	BillingService billingServiceObj= new BillingService();
//	Billing billingObj= new Billing();
	try{
		List<String> locationsList = new ArrayList<String>();
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		
		locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
		States states = genericMasterServiceObj.getStates();
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("locationsList", locationsList);
		
		modelAndViewObj.addObject("states", states);
		modelAndViewObj.setViewName("Inventory Manager/fleetMaster/newFleetMaster");
	}catch(Exception e){
		e.printStackTrace();
	}
	return modelAndViewObj;
}


@RequestMapping(value = "/getcustomerWalkIns")
public ModelAndView getcustomerWalkIns(HttpServletRequest request,HttpServletResponse response) {
//	BillingService billingServiceObj= new BillingService();
//	Billing billingObj= new Billing();
	try{
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("Inventory Manager/OutletHealth/customerWalkIns");
	}catch(Exception e){
		e.printStackTrace();
	}
	return modelAndViewObj; 
}



//added by manoj

@RequestMapping(value="/createBillTransaction",method=RequestMethod.POST,consumes="application/json")
public @ResponseBody ModelAndView createBillTransaction(@RequestBody Billing billingObj,
		
		HttpServletRequest request,HttpServletResponse response){

	try {
		// log.info("InventoryManagerController - updateTranactionBill()");
		Billing billDetails = new Billing();
		Billing billingBean =  new Billing();
		Set<String> tenders = new LinkedHashSet<String>();
		//////////System.out.println(transactionList);
		String customerIdStr = request.getSession().getAttribute("customerId").toString();
		String emailIdStr = request.getSession().getAttribute("emailId").toString();
		modelAndViewObj = new ModelAndView();
		String resultStr = billServiceObj.createBillTransaction(customerIdStr , emailIdStr,billingObj);
		if (!resultStr.equals(AppProperties.getAppMessageByProperty("BILL_UPDATED_SUCCESSFULLY").trim())) {
			billDetails.setStartIndex(Constants.PAGINATION_START_INDEX);
			billDetails.setBillId(billingObj.getBillId());
			billingBean = billServiceObj.getBillDetails(billDetails);
			modelAndViewObj.addObject("err", resultStr);
		} 
		else {
			billDetails.setStartIndex(Constants.PAGINATION_START_INDEX);
			billDetails.setBillId(billingObj.getBillId());
			billingBean = billServiceObj.getBillDetails(billDetails);
			modelAndViewObj.addObject("success", resultStr);

		}
		
ArrayList<TenderMaster> tenderDetails = genericMasterServiceObj.getTender("",customerIdStr,emailIdStr,"-1",100);
		
		for(int i=0;i<tenderDetails.size();i++)
		{
			tenders.add(tenderDetails.get(i).getModeOfPayment());
		}
		
		request.getSession().setAttribute("reportList", billingBean);
		modelAndViewObj.addObject("billDetails", billingBean);
		modelAndViewObj.addObject("billId", billingObj.getBillId());
		modelAndViewObj.addObject("flow", billingObj.getFlow());
		modelAndViewObj.addObject("criteria", billingObj.getCriteria());
		modelAndViewObj.addObject("status",billingObj.getStatus());
		modelAndViewObj.addObject("tenderDetails",tenderDetails);
		modelAndViewObj.addObject("type",billingObj.getType());
//		////////System.out.println(type);
		modelAndViewObj.addObject("maxRecords",billingObj.getMaxRecords());
		modelAndViewObj.addObject("transaction","transaction");
		modelAndViewObj.setViewName("Inventory Manager/Billing/billdetails");

	} catch (Exception e) {
		e.printStackTrace();
		modelAndViewObj.addObject("flow", billingObj.getFlow());
		modelAndViewObj.addObject("criteria", billingObj.getCriteria());
		modelAndViewObj.setViewName("Inventory Manager/Billing/billdetails");
	}
	return modelAndViewObj;

}

/*
@RequestMapping("/getOrdersMenuDetails")
public ModelAndView getOrdersMenuDetails(@RequestParam("outletName") String outletName,@RequestParam("menuName") String menuName,@RequestParam("categoryName") String categoryName, HttpServletRequest request,HttpServletResponse response){
	String locationListAll="";
	String locationStr = "";
	List<OutletInfo> storeList = null;
	List<String> locationsList = null;
	Map<String,Object> storesListMap = null;
	List<MenuDetails> menusList = null;
	MenuDetails menuDetailsList = null;
	MenuDetails menuDetailsList2 = null;
	List<MenuItems> AllmenuItems = new ArrayList<MenuItems>();
	List<MenuCategory> AllmenuCategories = new ArrayList<MenuCategory>();
	try{
		
		String customerId = request.getSession().getAttribute("customerId").toString();
		String emailId = request.getSession().getAttribute("emailId").toString();
		modelAndViewObj = new ModelAndView();
		
		storesListMap = storeServiceObj.getStoresList(customerId, emailId,locationStr,"-1","10");
		storeList = (List<OutletInfo>)storesListMap.get("storeDetailsList");
			// log.info(outlet_name);
			 List<String> locationsListValue=new ArrayList<String>();
	  			if(outletName.equals("all")|| outletName.equals("")){
					if(storeList != null){
							for(int i=0;i<storeList.size();i++){
								locationsListValue.add(storeList.get(i).getLocation());
							}
				
						for (String string : locationsListValue) {
							locationListAll = locationListAll+string+",";
						}
					}
	  			}
	  			else
	  				locationListAll=outletName;
	  			
	  	modelAndViewObj.addObject("storesList", storeList);
		
	  	menusList = menuServiceObj.getMenuDetails(locationListAll, customerId, emailId,"",false);
		if(menusList != null && menusList.size()>0){
			menuDetailsList = menuServiceObj.getCategoryDetails(menusList.get(0).getMenu_name(),outletName, customerId, emailId);
			//System.out.println("menus::"+gson.toJson(menuDetailsList));
		if(menuDetailsList != null && menuDetailsList.getMenuCategories() != null && menuDetailsList.getMenuCategories().size()>0 && menuDetailsList.getMenuCategories().get(0).getMenuItemsList() != null && menuDetailsList.getMenuCategories().get(0).getMenuItemsList().size()>0) {
				AllmenuCategories.addAll(menuDetailsList.getMenuCategories());
			} 
		}
		//System.out.println("menus Categories::"+gson.toJson(AllmenuCategories));
		
	  	if(menuName.isEmpty() || categoryName.isEmpty()){
			if(menusList != null && menusList.size()>0 && menuDetailsList != null && menuDetailsList.getMenuCategories() != null && menuDetailsList.getMenuCategories().size()>0 && menuDetailsList.getMenuCategories().get(0).getMenuItemsList() != null && menuDetailsList.getMenuCategories().get(0).getMenuItemsList().size()>0) {
				for(int i=0;i<menuDetailsList.getMenuCategories().size();i++){
					menuDetailsList2 = menuServiceObj.getCategoryDetailsBasedOnCategory(menusList.get(0).getMenu_name(),menuDetailsList.getMenuCategories().get(i).getCategory_name(), customerId, emailId);
					AllmenuItems.addAll(menuDetailsList2.getMenuCategories().get(0).getMenuItemsList());
				}
			}
		
	  	}else {
	  		menuDetailsList = menuServiceObj.getCategoryDetailsBasedOnCategory(menuName,categoryName, customerId, emailId);
			//System.out.println("menus::"+gson.toJson(menuDetailsList));
			if(menuDetailsList != null && menuDetailsList.getMenuCategories() != null && menuDetailsList.getMenuCategories().size()>0 && menuDetailsList.getMenuCategories().get(0).getMenuItemsList() != null && menuDetailsList.getMenuCategories().get(0).getMenuItemsList().size()>0)
				AllmenuItems.addAll(menuDetailsList.getMenuCategories().get(0).getMenuItemsList());
	  	}
	  	
	  	//System.out.println("Total Menu Items ::"+gson.toJson(AllmenuItems));		
		modelAndViewObj.addObject("selectedStore", outletName);
		modelAndViewObj.addObject("menuCategoriesList", AllmenuCategories);
		modelAndViewObj.addObject("menuItemsList", AllmenuItems);
		modelAndViewObj.setViewName("Inventory Manager/Orders/menuItemsPopup");
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}

*/

@RequestMapping("/viewoutletKeyValue")
public ModelAndView viewoutletKeyValue(@RequestParam("index") String index,HttpServletRequest request,HttpServletResponse response){
	List<String> locationsList = null;
	try{
		//// log.info("viewDenomination ");
		int start = 1,end = 10;
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		modelAndViewObj = new ModelAndView();
		
		locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
		System.out.println("Locs :"+gson.toJson(locationsList));
		modelAndViewObj.addObject("locationsList", locationsList);
		List<Group> groupsList = outletMasterServiceObj.getProductGroupDetails("",customerIdStr,emailIdStr,"-1","",true);
			if(groupsList != null && groupsList.size()>0){
			modelAndViewObj.addObject("groupsList", groupsList);
			}
		//DenominationMasterResponse denominationMasterResponse = genericMasterServiceObj.getDenominationMaster("",customerIdStr, emailIdStr,index);
		/*modelAndViewObj = new ModelAndView();
		if(denominationMasterResponse.getDenominationMasters() == null || denominationMasterResponse.getDenominationMasters().size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(denominationMasterResponse.getDenominationMasters().size()<10){
				end = (denominationMasterResponse.getDenominationMasters().size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			modelAndViewObj.addObject("totalRecords", denominationMasterResponse.getTotalRecords());
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
		}
		modelAndViewObj.addObject("denominationMasterList", denominationMasterResponse.getDenominationMasters());
		*/
		modelAndViewObj.setViewName("Inventory Manager/outletKeyValueProducts");
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}




@RequestMapping("/getOrdersMenuDetails")
public ModelAndView getOrdersMenuDetails(@RequestParam("outletName") String outletName,@RequestParam("menuName") String menuName,@RequestParam("categoryName") String categoryName, HttpServletRequest request,HttpServletResponse response){
	String locationListAll="";
	String locationStr = "";
	List<OutletInfo> storeList = null;
	List<String> locationsList = null;
	Map<String,Object> storesListMap = null;
	List<MenuDetails> menusList = null;
	MenuDetails menuDetailsList = null;
	MenuDetails menuDetailsList2 = null;
	List<MenuItems> AllmenuItems = new ArrayList<MenuItems>();
	List<MenuCategory> AllmenuCategories = new ArrayList<MenuCategory>();
	try{
		
		String customerId = request.getSession().getAttribute("customerId").toString();
		String emailId = request.getSession().getAttribute("emailId").toString();
		modelAndViewObj = new ModelAndView();
		
		storesListMap = storeServiceObj.getStoresList(customerId, emailId,locationStr,"-1","10");
		storeList = (List<OutletInfo>)storesListMap.get("storeDetailsList");
			// log.info(outlet_name);
			 List<String> locationsListValue=new ArrayList<String>();
	  			if(outletName.equals("all")|| outletName.equals("")){
					if(storeList != null){
							for(int i=0;i<storeList.size();i++){
								locationsListValue.add(storeList.get(i).getLocation());
							}
				
						for (String string : locationsListValue) {
							locationListAll = locationListAll+string+",";
						}
					}
	  			}
	  			else
	  				locationListAll=outletName;
	  			
	  	modelAndViewObj.addObject("storesList", storeList);
		
	  	menusList = menuServiceObj.getMenuDetails(locationListAll, customerId, emailId,"",false);
		if(menusList != null && menusList.size()>0){
			menuDetailsList = menuServiceObj.getCategoryDetails(menusList.get(0).getMenu_name(),outletName, customerId, emailId);
			//System.out.println("menus::"+gson.toJson(menuDetailsList));
		if(menuDetailsList != null && menuDetailsList.getMenuCategories() != null && menuDetailsList.getMenuCategories().size()>0 && menuDetailsList.getMenuCategories().get(0).getMenuItemsList() != null && menuDetailsList.getMenuCategories().get(0).getMenuItemsList().size()>0) {
				AllmenuCategories.addAll(menuDetailsList.getMenuCategories());
			} 
		}
		//System.out.println("menus Categories::"+gson.toJson(AllmenuCategories));
		
	  	if(menuName.isEmpty() || categoryName.isEmpty()){
			if(menusList != null && menusList.size()>0 && menuDetailsList != null && menuDetailsList.getMenuCategories() != null && menuDetailsList.getMenuCategories().size()>0 && menuDetailsList.getMenuCategories().get(0).getMenuItemsList() != null && menuDetailsList.getMenuCategories().get(0).getMenuItemsList().size()>0) {
				for(int i=0;i<menuDetailsList.getMenuCategories().size();i++){
					AllmenuItems.addAll(menuDetailsList.getMenuCategories().get(i).getMenuItemsList());
				}
			}
		} 
	  	
	  	//System.out.println("Total Menu Items ::"+gson.toJson(AllmenuItems));		
		modelAndViewObj.addObject("selectedStore", outletName);
		modelAndViewObj.addObject("menuCategoriesList", AllmenuCategories);
		modelAndViewObj.addObject("menuItemsList", AllmenuItems);
		modelAndViewObj.setViewName("Inventory Manager/Orders/menuItemsPopup");
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}


@RequestMapping(value="/printBarcodesforSkuData",method=RequestMethod.POST,consumes="application/json")
public void printBarcodesforSkuData(@RequestBody BarcodePrintRequestBean messageObj,HttpServletRequest request,HttpServletResponse response) {
	try{
		String jsonString = null;
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		BarcodePrintRequestBean barcodeSkusObj = skuServiceObj.printBarcodesforSkuData(messageObj,customerIdStr,emailIdStr);
		
		if(barcodeSkusObj != null && barcodeSkusObj.getBarcodeLabelPrintUrl() != null && !barcodeSkusObj.getBarcodeLabelPrintUrl().isEmpty())
			jsonString = barcodeSkusObj.getBarcodeLabelPrintUrl();
		else {
			if(barcodeSkusObj != null && barcodeSkusObj.getResponseHeader() != null)
				jsonString = barcodeSkusObj.getResponseHeader().getResponseMessage();
			else 
				jsonString =  "Internal Error, Please Contact for Support.";;
		}
		
    	response.setContentType("application/text");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonString);
		
	}catch(Exception e){
		e.printStackTrace();
	}
}


@RequestMapping("/viewMirrorStoreTaxation")
public ModelAndView viewMirrorStoreTaxation(@RequestParam("maxRecords") String maxRecords,@RequestParam("index") String index,@RequestParam("location") String location,@RequestParam("searchCriteria") String searchName,HttpServletRequest request,HttpServletResponse response){
	ArrayList<LocationBean> locationBeansList = null;
	List<String> locationsListValue =null;
	String locationListAll = "";
	StoreTaxation storeTaxationObj;
	try{
		storeTaxationObj=new StoreTaxation();
		locationsListValue = new ArrayList<String>();
		int start = 1,end = Integer.parseInt(maxRecords);
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
	
		locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);	
		
		if(location != null && !location.equals(""))
			request.getSession().setAttribute("selectedLocation", location);
		String resultStr = adminServiceObj.getMirrorStoreTaxation(customerIdStr, emailIdStr,location);
		
		if(!resultStr.equals(AppProperties.getAppMessageByProperty("MIRROR_STORE_TAXATION_SUCCESS").trim())){
			modelAndViewObj.addObject("error", resultStr);	
		}else{
			
			
			List<StoreTaxation> storeTaxationList = adminServiceObj.getStoreTaxation(searchName, customerIdStr, emailIdStr, index,location,null,false,maxRecords,locationListAll);
			modelAndViewObj = new ModelAndView();
			if(storeTaxationList == null || storeTaxationList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(storeTaxationList.size()<Integer.parseInt(maxRecords)){
					end = (storeTaxationList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(storeTaxationList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			
			modelAndViewObj.addObject("succcess", resultStr);//Response.getResponseMessage(resultStr);
			
			
			modelAndViewObj.addObject("searchName", searchName);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
			modelAndViewObj.addObject("storeTaxationList", storeTaxationList);
			modelAndViewObj.addObject("workLocationsList", locationBeansList);
		}
		
		
		modelAndViewObj.setViewName("Outlet Master/storeTaxationMaster");
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}

//end of controller	
}

