package com.tlabs.posweb.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.tlabs.posweb.beans.Outlet;
import com.tlabs.posweb.beans.OutletInfo;
import com.tlabs.posweb.beans.OutletStorageSystem;
import com.tlabs.posweb.beans.OutletStorageSystemDetails;
import com.tlabs.posweb.beans.Warehouse;
import com.tlabs.posweb.beans.WarehouseBean;
import com.tlabs.posweb.beans.WarehouseStorageSystems;
import com.tlabs.posweb.init.AppProperties;
import com.tlabs.posweb.services.AdminService;
import com.tlabs.posweb.services.StoreService;
import com.tlabs.posweb.services.WarehouseService;
import com.tlabs.posweb.util.Constants;
import com.tlabs.posweb.util.Response;

@Controller
@RequestMapping(value = "/outletconfigurations")
public class OutletConfigurationsController{

	//private static Logger log = Logger.getLogger(OutletConfigurationsController.class);
    @Autowired
	private AdminService adminServiceObj;
    @Autowired
    private StoreService storeServiceObj;
    @Autowired
    private Gson gson;
    @Autowired
    private WarehouseService warehouseServiceObj;
   /* @Autowired
    private OutletConfigurationService outletConfigurationObj;
    */
    private ModelAndView modelAndViewObj;
    
    public static Properties properties = null;

    /*
     * Sambaiah Y	
     * This method is used to get the apparal configuration view
     * */
    @RequestMapping(value="viewApparelConfigurations")
    private ModelAndView viewApparelConfigurations(HttpServletRequest request,HttpServletResponse response){
    	/**
    	 * Developed By : Sambaiah Y
    	 * Created On   : 09-07-2015
    	 * 
    	 * This method is used to get the all apparels outlet configuration details
    	 * 
    	 */
    	// log.info("OutletConfigurationController - viewApparelConfigurations");
    	modelAndViewObj = new ModelAndView();
    	String userIdStr = null,emailIdStr = null;
    	try{
    		List<String> locationsList = null;
    		userIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			locationsList = adminServiceObj.getLocationsList(userIdStr,emailIdStr,null);
			
			modelAndViewObj.addObject("locationsList", locationsList);
		}catch(Exception exception){
    		exception.printStackTrace();
    		modelAndViewObj.addObject("err", "Something Went Wrong!");
    	}
    	modelAndViewObj.setViewName("Inventory Manager/Apparel Configuration/allconfigurations");
    	return modelAndViewObj;
    }
    @RequestMapping(value="newApparelConfigurations")
    private ModelAndView newApparelConfigurations(HttpServletRequest request,HttpServletResponse response){
    	/**
    	 * Developed By : Sambaiah Y
    	 * Created On   : 09-07-2015
    	 * 
    	 * This method is used to display the new warehouse configuration page
    	 * 
    	 */
    	// log.info("OutletConfigurationController - newApparelConfigurations");
    	modelAndViewObj = new ModelAndView();
    	String userIdStr = null,emailIdStr = null;
    	try{
    		List<String> locationsList = null;
    		userIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			locationsList = adminServiceObj.getLocationsList(userIdStr,emailIdStr,null);
			
			modelAndViewObj.addObject("locationsList", locationsList);
		}catch(Exception exception){
    		exception.printStackTrace();
    		modelAndViewObj.addObject("err", "Something Went Wrong!");
    	}
    	modelAndViewObj.setViewName("Inventory Manager/Apparel Configuration/newconfiguration");
    	return modelAndViewObj;
    }
    
    @RequestMapping(value="viewGroceryConfigurations")
    private ModelAndView viewGroceryConfigurations(HttpServletRequest request,HttpServletResponse response){
    	/**
    	 * Developed By : Sambaiah Y
    	 * Created On   : 11-07-2015
    	 * 
    	 * This method is used to get the all grocery outlet configuration details
    	 * 
    	 */
    	/*// log.info("OutletConfigurationController - viewGroceryConfigurations");
    	modelAndViewObj = new ModelAndView();
    	String userIdStr = null,emailIdStr = null;
    	try{
    		List<String> locationsList = null;
    		userIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			locationsList = adminServiceObj.getLocationsList(userIdStr,emailIdStr);
			
			modelAndViewObj.addObject("locationsList", locationsList);
		}catch(Exception exception){
    		exception.printStackTrace();
    		modelAndViewObj.addObject("err", "Something Went Wrong!");
    	}
    	modelAndViewObj.setViewName("Inventory Manager/Grocery Configuration/allconfigurations");
    	return modelAndViewObj;*/
    	
    	// log.info("configurations");
		String locationStr="",customerIdStr=null,emailIdStr=null,resultStr=null;
		Map<String, Object> storesList=null;
		try{
			modelAndViewObj = new ModelAndView();
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			storesList = storeServiceObj.getStoresList(customerIdStr,emailIdStr,locationStr,"-1","10");
			if(storesList.size()>0 && storesList.get("result")!=null){
				resultStr = (String)storesList.get("result");
				if(resultStr.contains(Constants.SUCCESS)){
					request.getSession().removeAttribute("taxList");
					request.getSession().removeAttribute("locationsList");
					request.getSession().removeAttribute("currencyList");
					modelAndViewObj.addObject("storeDetailsList",storesList.get("storeDetailsList"));
				}else{
					modelAndViewObj.addObject("err",properties.getProperty("CONTACT_ADMIN"));
					modelAndViewObj.addObject("storeDetailsList","");
				}
			}else{
				modelAndViewObj.addObject("err",properties.getProperty("CONTACT_ADMIN"));
				modelAndViewObj.addObject("storeDetailsList","");
			}
		  modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allstoredetails");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
    }
    
    @RequestMapping(value="newGroceryConfigurations")
    private ModelAndView newGroceryConfigurations(HttpServletRequest request,HttpServletResponse response){
    	/**
    	 * Developed By : Sambaiah Y
    	 * Created On   : 09-07-2015
    	 * 
    	 * This method is used to display the grocery configuration details
    	 * 
    	 */
    	// log.info("OutletConfigurationController - newGroceryConfigurations");
    	modelAndViewObj = new ModelAndView();
    	String userIdStr = null,emailIdStr = null;
    	try{
    		List<String> locationsList = null;
    		userIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			locationsList = adminServiceObj.getLocationsList(userIdStr,emailIdStr,null);
			
			modelAndViewObj.addObject("locationsList", locationsList);
		}catch(Exception exception){
    		exception.printStackTrace();
    		modelAndViewObj.addObject("err", "Something Went Wrong!");
    	}
    	modelAndViewObj.setViewName("Inventory Manager/Grocery Configuration/outletconfiguration");
    	return modelAndViewObj;
    }
    
    @SuppressWarnings({ "unused", "null" })
	@RequestMapping(value="newoutletdetails")
    private ModelAndView newoutletdetails(HttpServletRequest request,HttpServletResponse response){
    	/**
    	 * Developed By : Sambaiah Y
    	 * Created On   : 09-07-2015
    	 * 
    	 * This method is used to display new outlet information details
    	 * 
    	 */

    	// log.info("OutletConfigurationControl - newoutletdetails()");
		String userIdStr = null,emailIdStr=null;
		List<String> locationsList = null,taxList=null,currenciesList=null,languagesList=null;
		try{
			userIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			locationsList = adminServiceObj.getLocationsList(userIdStr,emailIdStr,null);
			taxList = adminServiceObj.getTaxesList(userIdStr,emailIdStr);
			currenciesList = adminServiceObj.getCurrenciesList(userIdStr, emailIdStr);
			languagesList = adminServiceObj.getLanguagesList(userIdStr, emailIdStr);
			modelAndViewObj = new ModelAndView();
			if(locationsList.size()==0 && locationsList==null){
				modelAndViewObj.addObject("err",properties.getProperty("LOCATIONS_NOT_AVAILABLE"));
			}else if(taxList.size()==0 && taxList==null){
				modelAndViewObj.addObject("err",properties.getProperty("TAXES_NOT_AVAILABLE"));
			}else if(currenciesList==null && currenciesList.size()==0){
				modelAndViewObj.addObject("err",properties.getProperty("CURRENCIES_NOT_AVAILABLE"));
			}else if(languagesList==null && languagesList.size()==0){
				modelAndViewObj.addObject("err",properties.getProperty("LANGUAGES_NOT_AVAILABLE"));
			}else{
				
				request.getSession().setAttribute("locationsList",locationsList);
				modelAndViewObj.addObject("locationsList", locationsList);
				modelAndViewObj.addObject("taxList",taxList);
				request.getSession().setAttribute("taxList",taxList);
				modelAndViewObj.addObject("currencyList",currenciesList);
				request.getSession().setAttribute("currencyList",currenciesList);
				modelAndViewObj.addObject("languagesList",languagesList);
				request.getSession().setAttribute("languagesList",languagesList);
			}
			modelAndViewObj.setViewName("Inventory Manager/retailoutlets/newoutlet");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("err",properties.getProperty("CONTACT_ADMIN"));
			modelAndViewObj.setViewName("Inventory Manager/Grocery Configuration/allconfigurations");
		}
		return modelAndViewObj;
    }
    
    /**
     * @createdon  18-07-2015
     * 
     * @param storageSystemDetaisl
     *  
     * @return return appropriate view 
     * 
     * This method is used to store the new storage systems details in database
     * 
     */
    @RequestMapping(value = "savestoragesystems",method=RequestMethod.POST)
    public ModelAndView savestoragesystems(@RequestParam("storeCode")String storeCode,@RequestParam("storages")String storages,HttpServletRequest request,HttpServletResponse servletResponse){
    	// log.info("OutletConfigurationController - savestoragesystems()");
    	// log.info(storages);
    	OutletStorageSystem storageSystem = null;
    	List<OutletStorageSystem> lst_storages = null;
    	String userIdStr = null,emailIdStr=null;
    	String response = null,locationStr="",resultStr=null;
    	Map<String, Object> storesList=null;
    	try{
    		Outlet outlet = new Outlet();
    		lst_storages = new ArrayList<OutletStorageSystem>();
    		storageSystem = new OutletStorageSystem();
    		modelAndViewObj = new ModelAndView();
    		userIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			
    		/* convert storage systems string to  */
			
			try{
    		String storageSystems = Response.getResponseList(storages,"storageArray");
    		////////System.out.println(storageSystems);
    		JSONArray jsonStorageSystems = new JSONArray(storageSystems);
    		for (int i=0; i<jsonStorageSystems.length(); i++) {
    			storageSystem = gson.fromJson(jsonStorageSystems.getString(i), OutletStorageSystem.class);
    			lst_storages.add(storageSystem);
			}
			}catch(JSONException exception){
				exception.printStackTrace();

			}
    		outlet.setStoreCode(storeCode);
    		outlet.setStorageSystems(lst_storages);
//    		outlet.setRequestHeader(RequestHeaderUtil.getRequestHeader(userIdStr, emailIdStr));
    		//outlet.setRequestHeader(requestHeader);
    		response = warehouseServiceObj.saveStorageSystems(outlet);
    		// log.info(response);
    		request.getSession().removeAttribute("taxList");
			request.getSession().removeAttribute("locationsList");
			request.getSession().removeAttribute("currencyList");
//    		locationsList = adminServiceObj.getLocationsList(userIdStr,emailIdStr);
    		storesList = storeServiceObj.getStoresList(userIdStr,emailIdStr,locationStr,"0","10");
    		int start = 1,end = 10;
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
//    		modelAndViewObj.addObject("locationsList", locationsList);    
    		modelAndViewObj.addObject("err", response);    		
    		modelAndViewObj.setViewName("Inventory Manager/retailoutlets/allstoredetails");
    		
    	}catch(Exception exception){
    		exception.printStackTrace();
    		request.getSession().removeAttribute("taxList");
			request.getSession().removeAttribute("locationsList");
			request.getSession().removeAttribute("currencyList");
			storesList = storeServiceObj.getStoresList(userIdStr,emailIdStr,locationStr,"0","10");
    		int start = 1,end = 10;
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
    	return modelAndViewObj;
    }
    /**
     * @createdon 20-07-2015
     * @param storeCode
     * @param storeLocation
     * @param request
     * @return
     * This method is used to get the all storage system details based on the store code
     */
    @RequestMapping(value = "viewStorageSystems",method=RequestMethod.POST)
    public ModelAndView viewStorageSystems(@RequestParam("storeCode")String storeCode,@RequestParam("location")String location,HttpServletRequest request){
    	OutletStorageSystem storageSystems = null;
    	String userIdStr = null,emailIdStr = null;
    	List<String> locationsList = null;
    	List<OutletStorageSystem> storages_response = null;
    	try{
    		modelAndViewObj = new ModelAndView();
    		storageSystems = new OutletStorageSystem();
    		userIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			storageSystems.setOutletId(storeCode);
//			storageSystems.setRequestHeader(RequestHeaderUtil.getRequestHeader(userIdStr, emailIdStr));
			storages_response = warehouseServiceObj.getOutletStorageSystems(storageSystems);
    		
    		locationsList = adminServiceObj.getLocationsList(userIdStr,emailIdStr,null);
    		// log.info("========================= Size : "+ storages_response.size() +"Boolean Value :");
    		if(storages_response.size() == 0){
    			modelAndViewObj.addObject("err", "Storage Systems Not Available");    
    		}
    		modelAndViewObj.addObject("locationsList", locationsList);    
    		modelAndViewObj.addObject("storeCode", storeCode);
    		modelAndViewObj.addObject("storageSystems", storages_response);
    		modelAndViewObj.addObject("location", location);
    		modelAndViewObj.setViewName("Inventory Manager/Grocery Configuration/viewstoragesystems");
    		
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	return modelAndViewObj;
    }
    
    /**
     * @createdon 20-07-2015
     * @param storeCode
     * @param storeLocation
     * @param request
     * @return
     * This method is used to get the all storage system details based on the store code
     */
    @RequestMapping(value = "viewOutletStorageSystems",method=RequestMethod.POST)
    public ModelAndView viewOutletStorageSystems(@RequestParam("storeCode")String storeCode,@RequestParam("location")String location,HttpServletRequest request){
    	// log.info("OutletConfigurationsController - viewOutletStorageSystems()");
    	OutletStorageSystem storageSystems = null;
    	String userIdStr = null,emailIdStr = null;
    	List<String> locationsList = null;
    	List<OutletStorageSystem> storages_response = null;
    	try{
    		modelAndViewObj = new ModelAndView();
    		storageSystems = new OutletStorageSystem();
    		userIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			storageSystems.setOutletId(storeCode);
//			storageSystems.setRequestHeader(RequestHeaderUtil.getRequestHeader(userIdStr, emailIdStr));
			storages_response = warehouseServiceObj.getOutletStorageSystems(storageSystems);
    		
    		locationsList = adminServiceObj.getLocationsList(userIdStr,emailIdStr,null);
    		
    		modelAndViewObj.addObject("locationsList", locationsList);    
    		modelAndViewObj.addObject("storageSystems", storages_response);    		
    		modelAndViewObj.addObject("storeCode", storeCode);
    		modelAndViewObj.addObject("location", location);
    		modelAndViewObj.setViewName("Inventory Manager/Grocery Configuration/editstoragesystems");
    		
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	return modelAndViewObj;
    }
    /**
     * @createdon 20-07-2015
     * @param storeCode
     * @param storeLocation
     * @param request
     * @return
     * This method is used to get update storage system details on database
     */
    @RequestMapping(value = "updateOutletStorageSystems",method = RequestMethod.POST)
    public ModelAndView updateOutletStorageSystems(@RequestParam("storeCode")String storeCode,@RequestParam("storages")String storages,@RequestParam("location")String location,HttpServletRequest request,HttpServletResponse servletResponse){
    	// log.info("OutletConfigurationController - updateOutletStorageSystems()");
    	OutletStorageSystem storageSystem = null;
    	List<OutletStorageSystem> lst_storages = null;
    	String userIdStr = null,emailIdStr=null;
    	String response = null;
    	List<OutletStorageSystem> storages_response = null;
    	List<String> locationsList = null;
    	OutletStorageSystem outletStorageSystems = null;
    	try{
    		outletStorageSystems = new OutletStorageSystem();
    		Outlet outlet = new Outlet();
    		lst_storages = new ArrayList<OutletStorageSystem>();
    		storageSystem = new OutletStorageSystem();
    		modelAndViewObj = new ModelAndView();
    		userIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			
    		/* convert storage systems string to  */
    		String storageSystems = Response.getResponseList(storages,"editstorageArray");
    		JSONArray jsonStorageSystems = new JSONArray(storageSystems);
    		for (int i=0; i<jsonStorageSystems.length(); i++) {
    			storageSystem = gson.fromJson(jsonStorageSystems.getString(i), OutletStorageSystem.class);
    			if(storageSystem.getStorageLocation().contains("visible"))
    			lst_storages.add(storageSystem);
			}
    		outlet.setStoreCode(storeCode);
    		outlet.setStorageSystems(lst_storages);
//    		outlet.setRequestHeader(RequestHeaderUtil.getRequestHeader(userIdStr, emailIdStr));
    		//outlet.setRequestHeader(requestHeader);
    		response = warehouseServiceObj.updateOutletStorageSystems(outlet);
    		// log.info(response);
    		
    		/* for getting the existing stores */
    		outletStorageSystems.setOutletId(storeCode);
//    		outletStorageSystems.setRequestHeader(RequestHeaderUtil.getRequestHeader(userIdStr, emailIdStr));
    		storages_response = warehouseServiceObj.getOutletStorageSystems(outletStorageSystems);
    		modelAndViewObj.addObject("storageSystems", storages_response);
    		modelAndViewObj.addObject("location", location);
    		modelAndViewObj.addObject("storeCode", storeCode);
    		locationsList = adminServiceObj.getLocationsList(userIdStr,emailIdStr,null);
    		
    		modelAndViewObj.addObject("locationsList", locationsList);  
    		
           if(Response.getResponseCode(response).equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				
				modelAndViewObj.addObject("success", Response.getResponseMessage(response));  
			}
			else{
				modelAndViewObj.addObject("err", Response.getResponseMessage(response));   
			}
    		//modelAndViewObj.addObject("err", response);    		
    		modelAndViewObj.setViewName("Inventory Manager/Grocery Configuration/editstoragesystems");
    		
    	}catch(Exception exception){
    		exception.printStackTrace();
    		/* for getting the existing stores */
    		storages_response = warehouseServiceObj.getOutletStorageSystems(outletStorageSystems);
    		modelAndViewObj.addObject("storageSystems", storages_response);
    		modelAndViewObj.addObject("location", location);
    		
    		locationsList = adminServiceObj.getLocationsList(userIdStr,emailIdStr,null);
    		
    		modelAndViewObj.addObject("locationsList", locationsList);    
    		modelAndViewObj.addObject("err", response);    		
    		modelAndViewObj.setViewName("Inventory Manager/Grocery Configuration/editstoragesystems");
    	}
    	return modelAndViewObj;
    }
    /**@author Sambaiah.Y
     * @createdon 05-10-2015
     * @param storeCode
     * @param storeLocation
     * @param request
     * @return
     * This method is used to get the selected storage system details from database
     */
    @RequestMapping(value = "getStorageSystemDetails")
    public @ResponseBody String getStorageSystemDetails(@RequestParam("storageSystemId") String storageSystemId,@RequestParam("outletId") String outletId,HttpServletRequest request,HttpServletResponse servletResponse){
    	// log.info("OutletConfigurationController - getStorageSystemDetails");
    	List<OutletStorageSystemDetails> details = null;
//    	String userIdStr = null,emailIdStr = null;
    	OutletStorageSystem system = null;
    	try{
    		details = new ArrayList<OutletStorageSystemDetails>();
    		system = new OutletStorageSystem();
    		// log.info(storageSystemId);
//    		userIdStr = (String)request.getSession().getAttribute("customerId");
//			emailIdStr  = (String)request.getSession().getAttribute("emailId");
//			system.setRequestHeader(RequestHeaderUtil.getRequestHeader(userIdStr, emailIdStr));
			system.setStorageSystemId(storageSystemId);
			system.setOutletId(outletId);
			details = warehouseServiceObj.getStorageSystemDetails(system);
			
    		////////System.out.println(details);
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	return gson.toJson(details);
    }
    /**@author Sambaiah.Y
     * @createdon 05-10-2015
     * @param storeCode
     * @param storeLocation
     * @param request
     * @return
     * This method is used to update the selected storage systemdetails on database
     */
    @RequestMapping(value = "updateStorageSystemDetails",method =RequestMethod.POST)
    public @ResponseBody String updateStorageSystemDetails(@RequestParam("storageSystemId")String storageSystemId,@RequestParam("storagesInfo")String storagesInfo,HttpServletRequest request,HttpServletResponse servletResponse){
    	// log.info("OutletConfigurationController - updateStorageSystemDetails");
//    	String userIdStr = null,emailIdStr = null,response = null;
    	String response = null;
    	OutletStorageSystem storageSystemDetails = null;
    	OutletStorageSystemDetails storageSystem = null;
    	List<OutletStorageSystemDetails> lst_storages = null;
    	try{
    		lst_storages = new ArrayList<OutletStorageSystemDetails>();
    		storageSystem = new OutletStorageSystemDetails();
    		storageSystemDetails = new OutletStorageSystem();
//    		userIdStr = (String)request.getSession().getAttribute("customerId");
//			emailIdStr  = (String)request.getSession().getAttribute("emailId");
//			storageSystemDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(userIdStr, emailIdStr));
			storageSystemDetails.setStorageSystemId(storageSystemId);
			// log.info(storagesInfo);
			
			JSONArray jsonStorageSystems = new JSONArray(storagesInfo);
    		for (int i=0; i<jsonStorageSystems.length(); i++) {
    			storageSystem = gson.fromJson(jsonStorageSystems.getString(i), OutletStorageSystemDetails.class);
    			lst_storages.add(storageSystem);
			}
    		storageSystemDetails.setStoragesInformation(lst_storages);
			// log.info(gson.toJson(storageSystemDetails));
			response = warehouseServiceObj.updateStorageSystemDetails(storageSystemDetails);
			
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	return response;
    }
    
    
    
    @RequestMapping(value = "savestoragesystemsWareHouse",method=RequestMethod.POST)
    public ModelAndView savestoragesystemsWareHouse(@RequestParam("storeCode")String storeCode,@RequestParam("storages")String storages,@RequestParam("warehouseidcreated")String warehouseidcreated,HttpServletRequest request,HttpServletResponse servletResponse){
    	// log.info("OutletConfigurationController - savestoragesystems()");
    	// log.info(storages);
    	WarehouseStorageSystems storageSystem = null;
    	List<WarehouseStorageSystems> lst_storages = null;
    	String userIdStr = null,emailIdStr=null;
    	String response = null,locationStr="",resultStr=null;
    	Map<String, Object> storesList=null;
    	Warehouse warehouse = null;
    	try{
    		WarehouseBean outlet = new WarehouseBean();
    		lst_storages = new ArrayList<WarehouseStorageSystems>();
    		storageSystem = new WarehouseStorageSystems();
    		modelAndViewObj = new ModelAndView();
    		userIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			
    		/* convert storage systems string to  */
			
			try{
    		String storageSystems = Response.getResponseList(storages,"storageArray");
    	//System.out.println("storageSystems"+ storageSystems);
    		JSONArray jsonStorageSystems = new JSONArray(storageSystems);
    		for (int i=0; i<jsonStorageSystems.length(); i++) {
    			storageSystem = gson.fromJson(jsonStorageSystems.getString(i), WarehouseStorageSystems.class);
    			lst_storages.add(storageSystem);
			}
			}catch(JSONException exception){
				exception.printStackTrace();

			}
    		outlet.setStoreCode(storeCode);
    		outlet.setWarehouseId(warehouseidcreated);
    		outlet.setStorageSystems(lst_storages);
//    		outlet.setRequestHeader(RequestHeaderUtil.getRequestHeader(userIdStr, emailIdStr));
    		//outlet.setRequestHeader(requestHeader);
    		response = warehouseServiceObj.saveStorageSystemsWarehouse(outlet);
    		// log.info(response);
    		request.getSession().removeAttribute("taxList");
			request.getSession().removeAttribute("locationsList");
			request.getSession().removeAttribute("currencyList");
//    		locationsList = adminServiceObj.getLocationsList(userIdStr,emailIdStr);
			
			warehouse = new Warehouse();
			
			
			warehouse.setWarehouseLocation("all");
			warehouse.setStartIndex("-1");
			/* for getting the warehouses from db */
			List<Warehouse> warehouses = warehouseServiceObj.getWarehouses(warehouse);
			
			
			int start = 1,end = 10;
			String index="0";
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
    		modelAndViewObj.addObject("success", response);    		
    		
    		
    	}catch(Exception exception){
    		exception.printStackTrace();
    		modelAndViewObj.addObject("err","Something Went Wrong!");
    		
			}
    	modelAndViewObj.setViewName("Inventory Manager/warehouse/allwarehouses");
    	
    	return modelAndViewObj;
    }
  

    
}
