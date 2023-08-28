package com.tlabs.posweb.controller;

//import java.io.IOException;
//import java.text.SimpleDateFormat;
import java.util.ArrayList;
//import java.util.Arrays;
//import java.util.Calendar;
//import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlabs.posweb.init.AppProperties;
//import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
//import com.google.gson.Gson;
import com.tlabs.posweb.beans.AssetMaster;
import com.tlabs.posweb.beans.B2BPartner;
import com.tlabs.posweb.beans.BrandMaster;
import com.tlabs.posweb.beans.CurrencyBean;
import com.tlabs.posweb.beans.DenominationMaster;
import com.tlabs.posweb.beans.DenominationMasterResponse;
import com.tlabs.posweb.beans.EmployeeBean;
import com.tlabs.posweb.beans.FleetMaster;
import com.tlabs.posweb.beans.GenericRegionalSettings;
import com.tlabs.posweb.beans.HSNMaster;
import com.tlabs.posweb.beans.HomePageGroup;
import com.tlabs.posweb.beans.LocationBean;
//import com.tlabs.posweb.beans.OrderedItems;
//import com.tlabs.posweb.beans.OutletInfo;
import com.tlabs.posweb.beans.ProductCategoryBean;
import com.tlabs.posweb.beans.ProductSubCategoryBean;
import com.tlabs.posweb.beans.RetailServiceArea;
import com.tlabs.posweb.beans.RouteMaster;
import com.tlabs.posweb.beans.SectionDetails;
import com.tlabs.posweb.beans.States;
import com.tlabs.posweb.beans.StoreTaxation;
import com.tlabs.posweb.beans.SupplierBean;
import com.tlabs.posweb.beans.TaxBean;
import com.tlabs.posweb.beans.TenderMaster;
import com.tlabs.posweb.beans.WarehouseTaxation;
//import com.tlabs.posweb.beans.TaxLocations;
import com.tlabs.posweb.beans.ZoneMaster;
import com.tlabs.posweb.services.AdminService;
import com.tlabs.posweb.services.GenericMasterService;
import com.tlabs.posweb.services.MasterService;
import com.tlabs.posweb.services.OutletMasterService;
import com.tlabs.posweb.services.SettingsService;
import com.tlabs.posweb.util.Constants;
//import com.tlabs.posweb.util.Utilities;
//import com.tlabs.posweb.util.RequestHeaderUtil;
//import com.tlabs.posweb.util.Response;
//import com.tlabs.posweb.util.RestfulServiceConnection;

@Controller
@RequestMapping(value = "/genericMaster")
public class GenericMasterController {
	
	private ModelAndView modelAndViewObj;
	@Autowired
	private AdminService adminServiceObj;
	@Autowired
	private SettingsService settingsServiceObj;
	@Autowired
    private GenericMasterService genericMasterServiceObj;
	@Autowired
	private OutletMasterService outletMasterServiceObj;
	@Autowired
	private MasterService masterServiceObj;
	
//	 @Autowired
//     private Gson gson;
	//private static Logger log = Logger.getLogger(GenericMasterController.class);
	
	
	
	/**
	 * @author Mythri.S
	 * @param request
	 * @param response
	 * @return returns a jsp which displays all the icons of outlet management flow
	 */
	@RequestMapping("/showMasterDataManagementFlows")
	public ModelAndView showMasterDataManagementFlows(HttpServletRequest request,HttpServletResponse response){
		// log.info("showMasterDataManagementFlows");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("MasterDataManagement/masterDataManagementFlow");
		return modelAndViewObj;
	}
	
	/**
	 * @author Mythri.S
	 * @param request
	 * @param response
	 * @return returns a jsp which displays all the icons of outlet management flow
	 */
	@RequestMapping("/showGenericMasterFlows")
	public ModelAndView showGenericMasterFlows(HttpServletRequest request,HttpServletResponse response){
		// log.info("InventoryManagerController - showOutletFlows");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/genericMastersFlow");
		return modelAndViewObj;
	}
	
	
	
	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to view all the currency details in a tabular format
	 *
	 **/
	@RequestMapping("/viewCurrency")
	public ModelAndView viewCurrency(@RequestParam("index") String index,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewCurrency ");
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			ArrayList<CurrencyBean> currencyDetails = genericMasterServiceObj.getCurrency(searchName,customerId,emailId,index,maxRecords);
			modelAndViewObj = new ModelAndView();
			if(currencyDetails == null || currencyDetails.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(currencyDetails.size()<end){
					end = (currencyDetails.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(currencyDetails.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
				
			}
			modelAndViewObj.addObject("maxRecords", maxRecords);
			modelAndViewObj.addObject("searchName",searchName);
			modelAndViewObj.addObject("currencyDetails", currencyDetails);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/CurrencyMaster/currencyMaster");
			
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display the New Currency form
	 *
	 **/
	@RequestMapping("/newCurrency")
	public ModelAndView newCurrency(@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("newCurrency ");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			GenericRegionalSettings genericRegionalSettingsObj = settingsServiceObj.getRegionalSettings(customerIdStr, emailIdStr);
			
			if(genericRegionalSettingsObj == null){
				modelAndViewObj.addObject("baseCurrency", "");
				modelAndViewObj.addObject("err", AppProperties.getAppMessageByProperty("CURRENCY_REQUIRED_IN_SETTINGS").trim());
			}else{
				modelAndViewObj.addObject("baseCurrency", genericRegionalSettingsObj.getCurrency());
			}
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);
			
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/CurrencyMaster/newCurrency");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to save the New Currency
	 *
	 **/
	@RequestMapping("/saveCurrency")
	public ModelAndView createCurrency(@RequestParam("countryName") String countryName,
			@RequestParam("baseCurrency") String baseCurrency,
			@RequestParam("maxRecords") String maxRecords,
			@RequestParam("searchName") String searchName,
			@RequestParam("currencyCode") String currencyCode,
			@RequestParam("conversionRatio") String conversionRatio,HttpServletRequest request,HttpServletResponse response){
	
		try{
			// log.info("createCurrency ");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = genericMasterServiceObj.createCurrency(countryName,currencyCode,baseCurrency,conversionRatio,customerIdStr,emailIdStr);
			modelAndViewObj = new ModelAndView();
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("CURRENCY_CREATE_SUCCESS").trim())){
				CurrencyBean currencyDetails = new CurrencyBean();
				currencyDetails.setCountryName(countryName);
				currencyDetails.setCurrencyCode(currencyCode);
				currencyDetails.setConversionRatio(conversionRatio);
				modelAndViewObj.addObject("err", resultStr);
				modelAndViewObj.addObject("currencyDetails", currencyDetails);
			}else
				modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.addObject("baseCurrency", baseCurrency);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/CurrencyMaster/newCurrency");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display the Edit Currency form consisting of the details of the Currency
	 *
	 **/
	@RequestMapping("/editCurrency")
	public ModelAndView editCurrency(@RequestParam("countryName") String countryName,@RequestParam("operation") String operation,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("editCurrency");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			ArrayList<CurrencyBean> currencyDetails = genericMasterServiceObj.getCurrency(countryName,customerIdStr,emailIdStr,"0","");
			modelAndViewObj = new ModelAndView();
			if(currencyDetails.get(0).getBaseCurrency() == null || currencyDetails.get(0).getBaseCurrency().equals("")){
				GenericRegionalSettings genericRegionalSettingsObj = settingsServiceObj.getRegionalSettings(customerIdStr, emailIdStr);
				if(genericRegionalSettingsObj == null && !operation.equals("view"))
					modelAndViewObj.addObject("err", AppProperties.getAppMessageByProperty("CURRENCY_REQUIRED_IN_SETTINGS").trim());
				else
					currencyDetails.get(0).setBaseCurrency(genericRegionalSettingsObj.getCurrency());
			}
			modelAndViewObj.addObject("currencyDetails", currencyDetails.get(0));
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);
			if(operation.equals("view"))
				modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/CurrencyMaster/viewCurrency");
			else
				modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/CurrencyMaster/editCurrency");
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
	 *This method is used to update the Existing Location Details
	 *
	 **/
	@RequestMapping(value="/updateCurrency",method=RequestMethod.POST)
	public ModelAndView updateCurrency(@RequestParam("countryName") String countryName,@RequestParam("baseCurrency") String baseCurrency,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,
			@RequestParam("currencyCode") String currencyCode,@RequestParam("conversionRatio") String conversionRatio,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("updateCurrency");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = genericMasterServiceObj.updateCurrency(countryName,currencyCode,baseCurrency,conversionRatio,customerIdStr,emailIdStr);
			modelAndViewObj = new ModelAndView();
			CurrencyBean currencyDetails = new CurrencyBean();
			currencyDetails.setCountryName(countryName);
			currencyDetails.setCurrencyCode(currencyCode);
			currencyDetails.setBaseCurrency(baseCurrency);
			currencyDetails.setConversionRatio(conversionRatio);
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("CURRENCY_UPDATE_SUCCESS").trim()))
				modelAndViewObj.addObject("err", resultStr);
			else
				modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.addObject("currencyDetails", currencyDetails);
			modelAndViewObj.addObject("searchName", searchName);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/CurrencyMaster/editCurrency");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to delete Currencies
	 *
	 **/
	@RequestMapping("/deleteCurrency")
	public ModelAndView deleteCurrency(@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,@RequestParam("ids") String ids,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("deleteCurrency ");
			modelAndViewObj = new ModelAndView();
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			String resultStr = genericMasterServiceObj.deleteCurrency(customerId,emailId,ids);
			ArrayList<CurrencyBean> currencyDetails = genericMasterServiceObj.getCurrency(searchName,customerId,emailId,"0",maxRecords);
			if(currencyDetails == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0"); 
			}else{
				if(currencyDetails.size()<end){
					end = (currencyDetails.size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(currencyDetails.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("currencyDetails", currencyDetails);
			modelAndViewObj.addObject("err", resultStr);
			modelAndViewObj.addObject("searchName", searchName);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/CurrencyMaster/currencyMaster");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	@RequestMapping("/searchCurrencyMaster")
	public ModelAndView searchCurrencyMaster(@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,@RequestParam("maxRecords") String maxRecords, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		try{
			// log.info("searchCurrencyMaster");
			int start = 1,end = Integer.parseInt(maxRecords);
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			ArrayList<CurrencyBean> currencyDetails = genericMasterServiceObj.getCurrency(searchNameStr,customerIdStr,emailIdStr,index,maxRecords);
			modelAndViewObj = new ModelAndView();
			if(currencyDetails == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(currencyDetails.size()<end){
					end = (currencyDetails.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(currencyDetails.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("currencyDetails", currencyDetails);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/CurrencyMaster/currencyMaster");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to view all the currency details in a tabular format
	 *
	 **//*
	@RequestMapping("/viewCurrency")
	public ModelAndView viewCurrency(@RequestParam("index") String index,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewCurrency ");
			int start = 1,end = 10;
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			ArrayList<CurrencyBean> currencyDetails = genericMasterServiceObj.getCurrency("",customerId,emailId,index);
			modelAndViewObj = new ModelAndView();
			if(currencyDetails == null || currencyDetails.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(currencyDetails.size()<10){
					end = (currencyDetails.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(currencyDetails.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("currencyDetails", currencyDetails);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/CurrencyMaster/currencyMaster");
			
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	*//**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display the New Currency form
	 *
	 **//*
	@RequestMapping("/newCurrency")
	public ModelAndView newCurrency(HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("newCurrency ");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			GenericRegionalSettings genericRegionalSettingsObj = settingsServiceObj.getRegionalSettings(customerIdStr, emailIdStr);
			if(genericRegionalSettingsObj == null){
				modelAndViewObj.addObject("baseCurrency", "");
				modelAndViewObj.addObject("err", AppProperties.getAppMessageByProperty("CURRENCY_REQUIRED_IN_SETTINGS").trim());
			}else{
				modelAndViewObj.addObject("baseCurrency", genericRegionalSettingsObj.getCurrency());
			}
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/CurrencyMaster/newCurrency");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	*//**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to save the New Currency
	 *
	 **//*
	@RequestMapping("/saveCurrency")
	public ModelAndView createCurrency(@RequestParam("countryName") String countryName,@RequestParam("baseCurrency") String baseCurrency,
			@RequestParam("currencyCode") String currencyCode,@RequestParam("conversionRatio") String conversionRatio,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("createCurrency ");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = genericMasterServiceObj.createCurrency(countryName,currencyCode,baseCurrency,conversionRatio,customerIdStr,emailIdStr);
			modelAndViewObj = new ModelAndView();
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("CURRENCY_CREATE_SUCCESS").trim())){
				CurrencyBean currencyDetails = new CurrencyBean();
				currencyDetails.setCountryName(countryName);
				currencyDetails.setCurrencyCode(currencyCode);
				currencyDetails.setConversionRatio(conversionRatio);
				modelAndViewObj.addObject("err", resultStr);
				modelAndViewObj.addObject("currencyDetails", currencyDetails);
			}else
				modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.addObject("baseCurrency", baseCurrency);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/CurrencyMaster/newCurrency");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	*//**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display the Edit Currency form consisting of the details of the Currency
	 *
	 **//*
	@RequestMapping("/editCurrency")
	public ModelAndView editCurrency(@RequestParam("countryName") String countryName,@RequestParam("operation") String operation,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("editCurrency");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			ArrayList<CurrencyBean> currencyDetails = genericMasterServiceObj.getCurrency(countryName,customerIdStr,emailIdStr,"0");
			modelAndViewObj = new ModelAndView();
			if(currencyDetails.get(0).getBaseCurrency() == null || currencyDetails.get(0).getBaseCurrency().equals("")){
				GenericRegionalSettings genericRegionalSettingsObj = settingsServiceObj.getRegionalSettings(customerIdStr, emailIdStr);
				if(genericRegionalSettingsObj == null && !operation.equals("view"))
					modelAndViewObj.addObject("err", AppProperties.getAppMessageByProperty("CURRENCY_REQUIRED_IN_SETTINGS").trim());
				else
					currencyDetails.get(0).setBaseCurrency(genericRegionalSettingsObj.getCurrency());
			}
			modelAndViewObj.addObject("currencyDetails", currencyDetails.get(0));
			if(operation.equals("view"))
				modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/CurrencyMaster/viewCurrency");
			else
				modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/CurrencyMaster/editCurrency");
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
	 *This method is used to update the Existing Location Details
	 *
	 **//*
	@RequestMapping(value="/updateCurrency",method=RequestMethod.POST)
	public ModelAndView updateCurrency(@RequestParam("countryName") String countryName,@RequestParam("baseCurrency") String baseCurrency,
			@RequestParam("currencyCode") String currencyCode,@RequestParam("conversionRatio") String conversionRatio,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("updateCurrency");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = genericMasterServiceObj.updateCurrency(countryName,currencyCode,baseCurrency,conversionRatio,customerIdStr,emailIdStr);
			modelAndViewObj = new ModelAndView();
			CurrencyBean currencyDetails = new CurrencyBean();
			currencyDetails.setCountryName(countryName);
			currencyDetails.setCurrencyCode(currencyCode);
			currencyDetails.setBaseCurrency(baseCurrency);
			currencyDetails.setConversionRatio(conversionRatio);
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("CURRENCY_UPDATE_SUCCESS").trim()))
				modelAndViewObj.addObject("err", resultStr);
			else
				modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.addObject("currencyDetails", currencyDetails);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/CurrencyMaster/editCurrency");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	*//**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to delete Currencies
	 *
	 **//*
	@RequestMapping("/deleteCurrency")
	public ModelAndView deleteCurrency(@RequestParam("ids") String ids,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("deleteCurrency ");
			modelAndViewObj = new ModelAndView();
			int start = 1,end = 10;
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			String resultStr = genericMasterServiceObj.deleteCurrency(customerId,emailId,ids);
			ArrayList<CurrencyBean> currencyDetails = genericMasterServiceObj.getCurrency("",customerId,emailId,"0");
			if(currencyDetails == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(currencyDetails.size()<10){
					end = (currencyDetails.size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(currencyDetails.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("currencyDetails", currencyDetails);
			modelAndViewObj.addObject("err", resultStr);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/CurrencyMaster/currencyMaster");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	@RequestMapping("/searchCurrencyMaster")
	public ModelAndView searchCurrencyMaster(@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		try{
			// log.info("searchCurrencyMaster");
			int start = 1,end = 10;
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			ArrayList<CurrencyBean> currencyDetails = genericMasterServiceObj.getCurrency(searchNameStr,customerIdStr,emailIdStr,index);
			modelAndViewObj = new ModelAndView();
			if(currencyDetails == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(currencyDetails.size()<10){
					end = (currencyDetails.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(currencyDetails.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("currencyDetails", currencyDetails);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/CurrencyMaster/currencyMaster");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	*/
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display all the Employee details in a tabular format
	 *
	 **/
	
	@RequestMapping("/viewEmployee")
	public ModelAndView viewEmployee(
			@RequestParam("index") String index,
			@RequestParam("location") String location, 
			@RequestParam("maxRecords") String maxRecords,
			@RequestParam("searchName") String searchName, 
			HttpServletRequest request,HttpServletResponse response){
		try{
			int start = 1,end = Integer.parseInt(maxRecords);
			List<String> locationsListValue=new ArrayList<String>();
			String locationListAll="";
			// log.info("viewEmployee ");
			List<EmployeeBean> employeeList = new ArrayList<EmployeeBean>();
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
//			List<String> workLocationsList = adminServiceObj.getLocationsList(customerId,emailId,null);
	
			ArrayList<LocationBean> workLocationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
//			genericMasterServiceObj.getLocationDetails("","1", emailId,"-1",maxRecords,"",false,true,true);
			//added by vinay
			
			/*if((location.trim()).equals(null) || location.trim().isEmpty())
			{
				location = workLocationsList.get(0).getLocationId();
			}*/
			if(location.equals("all")|| location.equals("")){
				if(workLocationsList != null){
					for(int i=0;i<workLocationsList.size();i++){
					
						locationsListValue.add(workLocationsList.get(i).getLocationId());
							
					}
				for (String string : locationsListValue) {
					
					locationListAll = locationListAll+string+",";
				}
				}
				
			}
			
			////////System.out.println(location);
			List<String> specialisationList = adminServiceObj.getSpecialisationList(customerId, emailId);
			employeeList = genericMasterServiceObj.getEmployees(searchName,customerId, emailId,index,location,maxRecords,false,locationListAll);
			////////System.out.println("searchName "+ searchName);
			if(employeeList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(employeeList.size()<end){
					end = (employeeList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(employeeList.get(0).getMaxRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			//added by vinay
			modelAndViewObj.addObject("specialisationlist",specialisationList );
		    modelAndViewObj.addObject("employeeList", employeeList);
		    //added by manasa
		    modelAndViewObj.addObject("location", location);
		    modelAndViewObj.addObject("selectedLocation", location);
		    modelAndViewObj.addObject("searchName", searchName);
		    modelAndViewObj.addObject("maxRecords", maxRecords);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/EmployeeMaster/employeeMaster");
			
		}catch(Exception exception){
			exception.printStackTrace();
			////////System.out.println(exception.getMessage());
			 modelAndViewObj.addObject("err", exception.getMessage());
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/EmployeeMaster/employeeMaster");
		}
		return modelAndViewObj;
	}
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display the New Employee form
	 *
	 **/
	@RequestMapping("/newEmployee")
	public ModelAndView newEmployee(@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName, HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("newEmployee ");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String location = (String)request.getSession().getAttribute("selectedLocation");
			List<String> workLocationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
			List<String> specialisationList = adminServiceObj.getSpecialisationList(customerIdStr, emailIdStr);
//			List<String> departmentList = departmentServiceObj.getDepartmentsList(customerIdStr, emailIdStr);
			////////System.out.println("searchName "+ searchName);
			if(location == null)
				location = workLocationsList.get(0);
			if(location != null && !location.equals(""))
				request.getSession().setAttribute("selectedLocation", location);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("specialisationList",specialisationList );
			modelAndViewObj.addObject("selectedLocation", location);
			 modelAndViewObj.addObject("searchName", searchName);
			    modelAndViewObj.addObject("maxRecords", maxRecords);
//			modelAndViewObj.addObject("departmentList", departmentList);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/EmployeeMaster/newEmployee");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to save the details of the the New Employee
	 *
	 **/
	@RequestMapping(value="/createEmployee",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createEmployee(@RequestBody EmployeeBean employeeBean,HttpServletRequest request,HttpServletResponse response){
		String resultStr=null;
		try{
//			Gson gson=new Gson();
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
		    resultStr=genericMasterServiceObj.createEmployee(employeeBean, customerIdStr, emailIdStr);
			
			
		//	//////System.out.println(" resultstr :::"+resultStr);
			modelAndViewObj.addObject("type", "new");
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("EMPLOYEE_CREATE_SUCCESS").trim())){
				modelAndViewObj.addObject("employee", employeeBean);
				//written by manasa
				/*Date date = null;

				Calendar c = Calendar.getInstance();
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

				if(employeeBean.getDateOfJoin()!=null)
				date = formatter.parse(employeeBean.getDateOfJoin());
				////////System.out.println(date);
				c.setTime(date);
				int mon = c.get(Calendar.MONTH) + 1;
				String doj = c.get(Calendar.DATE) + "/" + mon + "/" + c.get(Calendar.YEAR);
				////////System.out.println(doj);

				if(employeeBean.getDob()!=null)
				date = formatter.parse(employeeBean.getDob());
				c.setTime(date);
				mon = c.get(Calendar.MONTH) + 1;
				String dob = c.get(Calendar.DATE) + "/" + mon + "/" + c.get(Calendar.YEAR);

				employeeBean.setDob(dob);
				employeeBean.setDateOfJoin(doj);*/
				
				
				modelAndViewObj.addObject("err", resultStr);
				
			}else
				modelAndViewObj.addObject("success", resultStr);
			
			//EmployeeBean employee = genericMasterServiceObj.getEmployeeByCode(employeeBean.getEmployeeCode(),customerIdStr, emailIdStr);
			//modelAndViewObj.addObject("employee", employee);
			String location = employeeBean.getLocation();
			if(location != null && !location.equals(""))
			request.getSession().setAttribute("selectedLocation", location);
			modelAndViewObj.addObject("selectedLocation", location);
			List<String> workLocationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
			List<String> specialisationList = adminServiceObj.getSpecialisationList(customerIdStr, emailIdStr);
			////////System.out.println(employeeBean.getSearchCriteria());
			////////System.out.println(gson.toJson(specialisationList));
			modelAndViewObj.addObject("workLocationsList", workLocationsList);	
			modelAndViewObj.addObject("specialisationList",specialisationList );
			 modelAndViewObj.addObject("searchName", employeeBean.getSearchCriteria());
		    modelAndViewObj.addObject("maxRecords", employeeBean.getMaxRecords());
			
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/EmployeeMaster/newEmployee");						
			
		}catch(Exception exception){
			exception.printStackTrace();
			modelAndViewObj.addObject("employee", employeeBean);
			modelAndViewObj.addObject("err", resultStr);
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
	@RequestMapping("/editEmployeeView")
	public ModelAndView editEmployee(@RequestParam("empCode") String empCode,@RequestParam("operation") String operation,@RequestParam("location") String location,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("editEmployee");
			EmployeeBean reportingManager = null;
			String reportingManagerName = null;
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			EmployeeBean employee = genericMasterServiceObj.getEmployeeByCode(empCode,customerIdStr, emailIdStr);
			if(employee.getReportingManager() != "" && employee.getReportingManager() != null)
				reportingManager = genericMasterServiceObj.getEmployeeByCode(employee.getReportingManager(),customerIdStr, emailIdStr);
			if(reportingManager != null)
				reportingManagerName = reportingManager.getFirstName()+" "+reportingManager.getLastName();
			/*employee.setDateOfJoin(employee.getDateOfJoin().substring(0, 10));
			employee.setDateOfBirth(employee.getDateOfBirth().substring(0, 10));*/
			List<String> workLocationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
			List<String> specialisationList = adminServiceObj.getSpecialisationList(customerIdStr, emailIdStr);
//			List<String> departmentList = departmentServiceObj.getDepartmentsList(customerIdStr, emailIdStr);
			modelAndViewObj = new ModelAndView();
			////////System.out.println("searchName "+ searchName);
//			modelAndViewObj.addObject("departmentList", departmentList);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("specialisationList",specialisationList );
			modelAndViewObj.addObject("reportingManagerName",reportingManagerName);
			modelAndViewObj.addObject("location",location);
			modelAndViewObj.addObject("selectedLocation", employee.getLocation());
			modelAndViewObj.addObject("searchName", searchName);
			modelAndViewObj.addObject("maxRecords", maxRecords);
			//////System.out.println("searchName "+ searchName);
			modelAndViewObj.addObject("employee", employee);
			if(operation.equals("view"))
				modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/EmployeeMaster/viewEmployee");
			else
				modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/EmployeeMaster/editEmployee");
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
	 *This method is used to save the details of an already existing Employee
	 *
	 **/
	@RequestMapping(value="/updateEmployee",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView updateEmployee(@RequestBody EmployeeBean employeeBean,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("update Employee");
			EmployeeBean reportingManager = null;
			String reportingManagerName = null;
			
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = genericMasterServiceObj.updateEmployee(employeeBean,customerIdStr,emailIdStr);
			if(employeeBean.getReportingManager() != "" && employeeBean.getReportingManager() != null)
				reportingManager = genericMasterServiceObj.getEmployeeByCode(employeeBean.getReportingManager(),customerIdStr, emailIdStr);
			if(reportingManager != null)
				reportingManagerName = reportingManager.getFirstName()+" "+reportingManager.getLastName();
			List<String> workLocationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
			List<String> specialisationList = adminServiceObj.getSpecialisationList(customerIdStr, emailIdStr);
			request.getSession().setAttribute("selectedLocation", employeeBean.getLocation());
//			List<String> departmentList = departmentServiceObj.getDepartmentsList(customerIdStr, emailIdStr);
			modelAndViewObj = new ModelAndView();
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("EMPLOYEE_UPDATE_SUCCESS").trim()))
				modelAndViewObj.addObject("err", resultStr);
			else
				modelAndViewObj.addObject("success", resultStr);
//			modelAndViewObj.addObject("departmentList", departmentList);
			modelAndViewObj.addObject("reportingManagerName",reportingManagerName);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("selectedLocation", employeeBean.getLocation());
			modelAndViewObj.addObject("specialisationList",specialisationList );
			modelAndViewObj.addObject("selectedSecondaryspecialization",employeeBean.getSecondarySpecialization());
			modelAndViewObj.addObject("selectedPrimarySpecialiazation", employeeBean.getPrimarySpecialization());
			//written by manasa
			employeeBean.setDob(employeeBean.getDateOfBirth());
			employeeBean.setDateOfJoin(employeeBean.getDateOfJoining());
			modelAndViewObj.addObject("employee", employeeBean);
			modelAndViewObj.addObject("searchName", employeeBean.getSearchCriteria());
			modelAndViewObj.addObject("maxRecords", employeeBean.getMaxRecords());
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/EmployeeMaster/editEmployee");
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
	 *This method is used to delete Employees
	 *
	 **/
	@RequestMapping("/deleteEmployee")
	public ModelAndView deleteEmployee(@RequestParam("ids") String ids,@RequestParam("maxRecords") String maxRecords, @RequestParam("searchName") String searchName,@RequestParam("location") String location,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("deleteEmployee ");
			////////System.out.println("ds");
			int start = 1,end = Integer.parseInt(maxRecords);
			modelAndViewObj = new ModelAndView();
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			String resultStr = genericMasterServiceObj.deleteEmployees(customerId,emailId,ids);
			ArrayList<LocationBean> workLocationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
			List<String> specialisationList = adminServiceObj.getSpecialisationList(customerId, emailId);
			List<EmployeeBean> employeeList = genericMasterServiceObj.getEmployees(searchName,customerId, emailId,"0",location,maxRecords,false,"");
			modelAndViewObj.addObject("selectedLocation", location);
			if(employeeList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(employeeList.size()<end){
					end = (employeeList.size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(employeeList.get(0).getMaxRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("specialisationList",specialisationList );
			modelAndViewObj.addObject("employeeList", employeeList);
			modelAndViewObj.addObject("searchName",searchName);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			
			
			if(resultStr.equals(AppProperties.getAppMessageByProperty("EMPLOYEE_DELETE_SUCCESS").trim())){
				modelAndViewObj.addObject("Success", resultStr);
			}else{
				modelAndViewObj.addObject("err", resultStr);
			}
			
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/EmployeeMaster/employeeMaster");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}	
	
	
	@RequestMapping("/searchEmployeeMaster")
	public ModelAndView searchEmployeeMaster(@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,@RequestParam("location") String location, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		try{
			// log.info("searchEmployeeMaster");
			int start = 1,end = 10;
			String locationListAll = "";
			List<String> locationsListValue = new ArrayList<String>();
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
//			List<String> workLocationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
//			ArrayList<LocationBean> workLocationsList = genericMasterServiceObj.getLocationDetails(customerIdStr,"1", emailIdStr,"-1","10","",false,true,true);
			
		
			ArrayList<LocationBean> workLocationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,true,true);
			
			if(location.equals("all")|| location.equals("")){
				if(workLocationsList != null){
					for(int i=0;i<workLocationsList.size();i++){
						locationsListValue.add(workLocationsList.get(i).getLocationId());
					}
				for (String string : locationsListValue) {
					locationListAll = locationListAll+string+",";
				}
				}
			}
			
			List<String> specialisationList = adminServiceObj.getSpecialisationList(customerIdStr, emailIdStr);
			
			List<EmployeeBean> employeeList = genericMasterServiceObj.getEmployees(searchNameStr,customerIdStr, emailIdStr,index,location,"",true,locationListAll);
			modelAndViewObj = new ModelAndView();
			/*if(location != null && !"".equals(location))
				request.getSession().setAttribute("selectedLocation", location);*/
		
			////////System.out.println(location);
			if(employeeList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(employeeList.size()<10){
					end = (employeeList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(employeeList.get(0).getMaxRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("specialisationList",specialisationList );
		    modelAndViewObj.addObject("employeeList", employeeList);
		    modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/EmployeeMaster/employeeMaster");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display all the Employee details in a tabular format
	 *
	 **//*
	@RequestMapping("/viewEmployee")
	public ModelAndView viewEmployee(@RequestParam("index") String index,@RequestParam("location") String location,HttpServletRequest request,HttpServletResponse response){
		try{
			int start = 1,end = 10;
			// log.info("viewEmployee ");
			ArrayList<EmployeeBean> employeeList = new ArrayList<EmployeeBean>();
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			List<String> workLocationsList = adminServiceObj.getLocationsList(customerId,emailId,null);
			if(location==""||location==null){
				location = (String)request.getSession().getAttribute("selectedLocation");
				if(location == null && workLocationsList != null && workLocationsList.size()>0 )
					location = workLocationsList.get(0);
			}
			//
			if((location.trim()).equals(null) || location.trim().isEmpty())
				location = workLocationsList.get(0);
			
			
			if(location != null && !"".equals(location))
				request.getSession().setAttribute("selectedLocation", location);
				employeeList = genericMasterServiceObj.getEmployees(null,customerId, emailId,index,location,false);
				modelAndViewObj.addObject("selectedLocation", location);
			if(employeeList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(employeeList.size()<10){
					end = (employeeList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(employeeList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
		    modelAndViewObj.addObject("employeeList", employeeList);
		    //added by manasa
		    modelAndViewObj.addObject("location", location);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/EmployeeMaster/employeeMaster");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	*//**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display the New Employee form
	 *
	 **//*
	@RequestMapping("/newEmployee")
	public ModelAndView newEmployee(HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("newEmployee ");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String location = (String)request.getSession().getAttribute("selectedLocation");
			List<String> workLocationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
//			List<String> departmentList = departmentServiceObj.getDepartmentsList(customerIdStr, emailIdStr);
			if(location == null)
				location = workLocationsList.get(0);
			if(location != null && !location.equals(""))
				request.getSession().setAttribute("selectedLocation", location);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("selectedLocation", location);
//			modelAndViewObj.addObject("departmentList", departmentList);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/EmployeeMaster/newEmployee");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	*//**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to save the details of the the New Employee
	 *
	 **//*
	@RequestMapping(value="/createEmployee",method=RequestMethod.POST)
	public ModelAndView createEmployee(@RequestBody EmployeeBean employeeBean,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("createEmployee ");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = genericMasterServiceObj.createEmployee(employeeBean,customerIdStr,emailIdStr);
			modelAndViewObj = new ModelAndView();
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("EMPLOYEE_CREATE_SUCCESS").trim())){
				modelAndViewObj.addObject("employee", employeeBean);
				modelAndViewObj.addObject("err", resultStr);
			}
			else
				modelAndViewObj.addObject("success", resultStr);
			String location = employeeBean.getLocation();
			if(location != null && !location.equals(""))
				request.getSession().setAttribute("selectedLocation", location);
			modelAndViewObj.addObject("selectedLocation", location);
			List<String> workLocationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
//			List<String> departmentList = departmentServiceObj.getDepartmentsList(customerIdStr, emailIdStr);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
//			modelAndViewObj.addObject("departmentList", departmentList);
			
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/EmployeeMaster/newEmployee");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	*//**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display the Edit Employee form consisting of the details of the Employee
	 *
	 **//*
	@RequestMapping("/editEmployeeView")
	public ModelAndView editEmployee(@RequestParam("empCode") String empCode,@RequestParam("operation") String operation,@RequestParam("location") String location,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("editEmployee");
			EmployeeBean reportingManager = null;
			String reportingManagerName = null;
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			EmployeeBean employee = genericMasterServiceObj.getEmployeeByCode(empCode,customerIdStr, emailIdStr);
			if(employee.getReportingManager() != "" && employee.getReportingManager() != null)
				reportingManager = genericMasterServiceObj.getEmployeeByCode(employee.getReportingManager(),customerIdStr, emailIdStr);
			if(reportingManager != null)
				reportingManagerName = reportingManager.getFirstName()+" "+reportingManager.getLastName();
			List<String> workLocationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
//			List<String> departmentList = departmentServiceObj.getDepartmentsList(customerIdStr, emailIdStr);
			modelAndViewObj = new ModelAndView();
//			modelAndViewObj.addObject("departmentList", departmentList);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("reportingManagerName",reportingManagerName);
			modelAndViewObj.addObject("location",location);
			modelAndViewObj.addObject("employee", employee);
			if(operation.equals("view"))
				modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/EmployeeMaster/viewEmployee");
			else
				modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/EmployeeMaster/editEmployee");
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
	 *This method is used to save the details of an already existing Employee
	 *
	 **//*
	@RequestMapping(value="/updateEmployee",method=RequestMethod.POST)
	public ModelAndView updateEmployee(@RequestBody EmployeeBean employeeBean,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("update Employee");
			EmployeeBean reportingManager = null;
			String reportingManagerName = null;
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = genericMasterServiceObj.updateEmployee(employeeBean,customerIdStr,emailIdStr);
			if(employeeBean.getReportingManager() != "" && employeeBean.getReportingManager() != null)
				reportingManager = genericMasterServiceObj.getEmployeeByCode(employeeBean.getReportingManager(),customerIdStr, emailIdStr);
			if(reportingManager != null)
				reportingManagerName = reportingManager.getFirstName()+" "+reportingManager.getLastName();
			List<String> workLocationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
			request.getSession().setAttribute("selectedLocation", employeeBean.getLocation());
//			List<String> departmentList = departmentServiceObj.getDepartmentsList(customerIdStr, emailIdStr);
			modelAndViewObj = new ModelAndView();
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("EMPLOYEE_UPDATE_SUCCESS").trim()))
				modelAndViewObj.addObject("err", resultStr);
			else
				modelAndViewObj.addObject("success", resultStr);
//			modelAndViewObj.addObject("departmentList", departmentList);
			modelAndViewObj.addObject("reportingManagerName",reportingManagerName);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("employee", employeeBean);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/EmployeeMaster/editEmployee");
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
	 *This method is used to delete Employees
	 *
	 **//*
	@RequestMapping("/deleteEmployee")
	public ModelAndView deleteEmployee(@RequestParam("ids") String ids,@RequestParam("location") String location,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("deleteEmployee ");
			int start = 1,end = 10;
			modelAndViewObj = new ModelAndView();
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			String resultStr = genericMasterServiceObj.deleteEmployees(customerId,emailId,ids);
			List<String> workLocationsList = adminServiceObj.getLocationsList(customerId,emailId,null);
			ArrayList<EmployeeBean> employeeList = genericMasterServiceObj.getEmployees(null,customerId, emailId,"0",location,false);
			modelAndViewObj.addObject("selectedLocation", location);
			if(employeeList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(employeeList.size()<10){
					end = (employeeList.size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(employeeList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("employeeList", employeeList);
			modelAndViewObj.addObject("err", resultStr);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/EmployeeMaster/employeeMaster");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}*/
	/*
	@RequestMapping("/searchEmployeeMaster")
	public ModelAndView searchEmployeeMaster(@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,@RequestParam("location") String location, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		try{
			// log.info("searchEmployeeMaster");
			int start = 1,end = 10;
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<String> workLocationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
			ArrayList<EmployeeBean> employeeList = genericMasterServiceObj.getEmployees(searchNameStr,customerIdStr, emailIdStr,index,location,true);
			modelAndViewObj = new ModelAndView();
			if(location != null && !"".equals(location))
				request.getSession().setAttribute("selectedLocation", location);
			modelAndViewObj.addObject("selectedLocation", location);
			if(employeeList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(employeeList.size()<10){
					end = (employeeList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(employeeList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
		    modelAndViewObj.addObject("employeeList", employeeList);
		    modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/EmployeeMaster/employeeMaster");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	*/
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display newLocation form
	 *
	 **/
	@RequestMapping("/newLocation")
	public ModelAndView newLocation(@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("newLocation ");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("maxRecords", maxRecords);
			modelAndViewObj.addObject("searchName",searchName);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/LocationMaster/newLocation");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display all the Location details in a tabular format
	 *
	 **/
	@RequestMapping(value="/viewLocation",method=RequestMethod.POST)
	public ModelAndView viewLocation(@RequestParam("index") String index,@RequestParam("maxRecords") String maxRecords, @RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewLocation ");
			int start = 1,end = Integer.parseInt(maxRecords);
//			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			ArrayList<LocationBean> locationDetails = genericMasterServiceObj.getLocationDetails(searchName,"1", emailId,index,maxRecords,"",false,true,true);
			modelAndViewObj = new ModelAndView();
			if(locationDetails == null || locationDetails.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(locationDetails.size()<end){
					end = (locationDetails.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(locationDetails.get(0).getStartValue())+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(locationDetails.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("locationDetails", locationDetails);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/LocationMaster/locationMaster");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	@RequestMapping("/deleteLocation")
	public ModelAndView deleteLocation(@RequestParam("ids") String ids,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("deleteLocation ");
			int start = 1,end = Integer.parseInt(maxRecords);
			modelAndViewObj = new ModelAndView();
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			String resultStr = genericMasterServiceObj.deleteLocation(customerId, emailId, ids);
			ArrayList<LocationBean> locationDetails = genericMasterServiceObj.getLocationDetails(searchName,"1", emailId,"0",maxRecords,"",true,true,true);

			modelAndViewObj = new ModelAndView();
			if(locationDetails == null || locationDetails.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(locationDetails.size()<end){
					end = locationDetails.size();
				}else{
					end = (Integer.parseInt(locationDetails.get(0).getStartValue())+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(locationDetails.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", start);
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("locationDetails", locationDetails);
			modelAndViewObj.addObject("err", resultStr);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/LocationMaster/locationMaster");
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
	 *This method is used to save the New Location
	 *
	 **/
	@RequestMapping(value="/saveLocation",method=RequestMethod.POST)
	public ModelAndView createLocation(@RequestBody LocationBean locationBean,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("createLocation");
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			String resultStr = genericMasterServiceObj.createLocation(locationBean,customerId,emailId);
			modelAndViewObj = new ModelAndView();
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("LOCATION_CREATE_SUCCESS").trim())){
				modelAndViewObj.addObject("locationDetails", locationBean);
				modelAndViewObj.addObject("err", resultStr);
			}
			else
				modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/LocationMaster/newLocation");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		modelAndViewObj.addObject("maxRecords",locationBean.getMaxRecords());
		modelAndViewObj.addObject("searchName",locationBean.getSearchCriteria());
		return modelAndViewObj;
	}
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to update the Existing Location Details
	 *
	 **/
	@RequestMapping(value="/updateLocation",method=RequestMethod.POST)
	public ModelAndView updateLocation(@RequestBody LocationBean locationBean,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("updateLocation");
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			String resultStr = genericMasterServiceObj.updateLocation(locationBean,customerId,emailId);
			modelAndViewObj = new ModelAndView();
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("LOCATION_UPDATE_SUCCESS").trim())){
				modelAndViewObj.addObject("err", resultStr);
			}
			else
				modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.addObject("locationDetails", locationBean);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/LocationMaster/editLocation");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		modelAndViewObj.addObject("maxRecords",locationBean.getMaxRecords());
		modelAndViewObj.addObject("searchName",locationBean.getSearchCriteria());
		return modelAndViewObj;
	}
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display the Edit Location form consisting of the details of the Location
	 *
	 **/
	@RequestMapping("/editLocation")
	public ModelAndView editLocation(@RequestParam("locationId") String locationId,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,@RequestParam("operation") String operation,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("editLocation");
//			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			ArrayList<LocationBean> locationDetails = genericMasterServiceObj.getLocationDetails(locationId,"1", emailId,"0","",false,true,true);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("locationDetails", locationDetails.get(0));
			if(operation.equals("view"))
				modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/LocationMaster/viewLocation");
			else
				modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/LocationMaster/editLocation");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		modelAndViewObj.addObject("maxRecords",maxRecords);
		modelAndViewObj.addObject("searchName",searchName);
		
		
		return modelAndViewObj;
	}
	
	
	@RequestMapping("/searchLocationMaster")
	public ModelAndView searchLocationMaster(@RequestParam("searchName") String searchNameStr,@RequestParam("maxRecords") String maxRecords, @RequestParam("index") String index, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		try{
			// log.info("searchLocationMaster");
			int start = 1,end = Integer.parseInt(maxRecords);
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			ArrayList<LocationBean> locationDetails = genericMasterServiceObj.getLocationDetails(searchNameStr,"1", emailIdStr,index,maxRecords,"",true,true,true);
			modelAndViewObj = new ModelAndView();
			if(locationDetails == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(locationDetails.size()<end){
					end = (locationDetails.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(locationDetails.get(0).getStartValue())+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(locationDetails.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("maxRecords", maxRecords);
			modelAndViewObj.addObject("locationDetails", locationDetails);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/LocationMaster/locationMaster");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used display the form to create a new Tax
	 *
	 **//*
	@RequestMapping("/newTax")
	public ModelAndView newTax(HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("newTax ");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/TaxMaster/newTax");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	*//**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display all Tax details in a tabular format
	 *
	 **//*
	@RequestMapping("/viewTax")
	public ModelAndView viewTax(@RequestParam("index")String index,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewTax ");
			int start = 1,end = 10;
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails("",customerId, emailId,index,false);
			modelAndViewObj = new ModelAndView();
			if(taxDetails == null || taxDetails.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(taxDetails.size()<10){
					end = (taxDetails.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(taxDetails.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("taxDetails", taxDetails);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/TaxMaster/taxMaster");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	*//**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to save the New Tax
	 *
	 **//*
	@RequestMapping("/saveTax")
	public ModelAndView createTax(@RequestParam("taxName") String taxName,@RequestParam("taxDescription") String taxDescription,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("createTax ");
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			String resultStr = genericMasterServiceObj.createTax(taxName,taxDescription,customerId,emailId);
			modelAndViewObj = new ModelAndView();
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("TAX_CREATE_SUCCESS").trim())){
				modelAndViewObj.addObject("err", resultStr);
				modelAndViewObj.addObject("taxName",taxName);
				modelAndViewObj.addObject("taxDescription",taxDescription);
			}else
				modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/TaxMaster/newTax");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	*//**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display the Edit Tax form consisting of the details of the Tax
	 *
	 **//*
	@RequestMapping("/editTax")
	public ModelAndView editTax(@RequestParam("taxId") String taxId,@RequestParam("operation") String operation,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("editTax");
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails(taxId,customerId, emailId,"0",false);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("taxDetails", taxDetails.get(0));
			if(operation.equals("view"))
				modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/TaxMaster/viewTax");
			else
				modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/TaxMaster/editTax");
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
	 *This method is used to update the Existing Tax
	 *
	 **//*
	@RequestMapping("/updateTax")
	public ModelAndView updateTax(@RequestParam("taxName") String taxName,@RequestParam("taxId") String taxId,@RequestParam("taxDescription") String taxDescription, HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("updateTax ");
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			TaxBean taxBean = new TaxBean();
			taxBean.setTaxId(taxId);
			taxBean.setTaxName(taxName);
			taxBean.setTaxDescription(taxDescription);
			String resultStr = genericMasterServiceObj.updateTax(taxBean,customerId,emailId);
			modelAndViewObj = new ModelAndView();
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("TAX_UPDATE_SUCCESS").trim()))
				modelAndViewObj.addObject("err", resultStr);
			else
				modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.addObject("taxDetails", taxBean);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/TaxMaster/editTax");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	*//**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to delete Taxes
	 *
	 **//*
	@RequestMapping("/deleteTax")
	public ModelAndView deleteTax(@RequestParam("ids") String ids,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("deleteTax ");
			int start = 1,end = 10;
			modelAndViewObj = new ModelAndView();
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			String resultStr = genericMasterServiceObj.deleteTax(customerId,emailId,ids);
			ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails("",customerId, emailId,"0",false);
			modelAndViewObj = new ModelAndView();
			if(taxDetails == null || taxDetails.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(taxDetails.size()<10){
					end = (taxDetails.size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(taxDetails.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("taxDetails", taxDetails);
			modelAndViewObj.addObject("err", resultStr);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/TaxMaster/taxMaster");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	
	@RequestMapping("/searchTaxMaster")
	public ModelAndView searchTaxMaster(@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		try{
			// log.info("searchTaxMaster");
			int start = 1,end = 10;
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails(searchNameStr,customerIdStr, emailIdStr,index,true);
			modelAndViewObj = new ModelAndView();
			if(taxDetails == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(taxDetails.size()<10){
					end = (taxDetails.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(taxDetails.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("taxDetails", taxDetails);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/TaxMaster/taxMaster");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	*/
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used display the form to create a new Tax
	 *
	 **/
	@RequestMapping("/newTax")
	public ModelAndView newTax(@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
//		List<String> locationsList = null;
		try{
			// log.info("newTax ");
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			List<String> locationsList = null;
			locationsList = adminServiceObj.getOutletLocationsList(customerId,emailId,false);
			modelAndViewObj.addObject("locationsList", locationsList);
			
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/TaxMaster/newTax");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		modelAndViewObj.addObject("maxRecords",maxRecords);
		modelAndViewObj.addObject("searchName",searchName);

		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display all Tax details in a tabular format
	 *
	 **/
	@RequestMapping("/viewTax")
	public ModelAndView viewTax(@RequestParam("index")String index,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,
HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewTax ");
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails("",customerId, emailId,index,false,maxRecords);
			modelAndViewObj = new ModelAndView();
			
		/*	
			String counterListStr="";
			List<String> taxLocations=new ArrayList<String>();
//			if(taxDetails.get(0).()!=null)
				for(int i=0;i<taxDetails.get(0).getTaxLocationsList().size();i++)
				{
					counterListStr=taxDetails.get(0).getTaxLocationsList().get(i).getStore_location(); 
					taxLocations.add(counterListStr);
					////////System.out.println(i);
				//	//////System.out.println(empList1);
				}
			
				modelAndViewObj.addObject("taxLocationList", taxLocations);*/
			
			if(taxDetails == null || taxDetails.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(taxDetails.size()<end){
					end = (taxDetails.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(taxDetails.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("taxDetails", taxDetails);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/TaxMaster/taxMaster");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to save the New Tax
	 *
	 **/
	@RequestMapping(value="/saveTax",method=RequestMethod.POST)
	public ModelAndView createTax(@RequestBody TaxBean taxBean,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("createTax ");
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			String resultStr = genericMasterServiceObj.createTax(taxBean,customerId,emailId);
			modelAndViewObj = new ModelAndView();
			
			List<String> locationsList = null;
			locationsList = adminServiceObj.getOutletLocationsList(customerId,emailId,false);
			modelAndViewObj.addObject("locationsList", locationsList);
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("TAX_CREATE_SUCCESS").trim())){
				modelAndViewObj.addObject("err", resultStr);
			/*	String taxListStr="";
				List<String> taxLocationsList=new ArrayList<String>();
//				if(taxDetails.get(0).()!=null)
				for(int i=0;i<taxBean.getTaxLocationsList().size();i++)
					{
						taxListStr=taxBean.getTaxLocationsList().get(i).getStore_location(); 
						taxLocationsList.add(taxListStr);
						////////System.out.println(i);
					//	//////System.out.println(empList1);
					}
				
				modelAndViewObj.addObject("taxLocationList", taxLocationsList);*/
				modelAndViewObj.addObject("taxName",taxBean.getTaxName());
				modelAndViewObj.addObject("taxDescription",taxBean.getTaxDescription());
			}else
				modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/TaxMaster/newTax");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		modelAndViewObj.addObject("maxRecords",taxBean.getMaxRecords());
		modelAndViewObj.addObject("searchName",taxBean.getSearchCriteria());
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display the Edit Tax form consisting of the details of the Tax
	 *
	 **/
	@RequestMapping("/editTax")
	public ModelAndView editTax(@RequestParam("taxId") String taxId,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,@RequestParam("operation") String operation,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("editTax");
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails(taxId,customerId, emailId,"0",false,"");
			modelAndViewObj = new ModelAndView();
			List<String> locationsList = null;
			locationsList = adminServiceObj.getOutletLocationsList(customerId,emailId,false);
			//modelAndViewObj.addObject("locationsList", locationsList);
			String taxListStr="";
			List<String> taxLocations=new ArrayList<String>();
		/*	if(taxDetails.get(0).getTaxLocationsList().size()>0)
				for(int i=0;i<taxDetails.get(0).getTaxLocationsList().size();i++)
				{
					taxListStr=taxDetails.get(0).getTaxLocationsList().get(i).getStore_location(); 
					taxLocations.add(taxListStr);
					////////System.out.println(i);
				//	//////System.out.println(empList1);
				}
			*/
				//modelAndViewObj.addObject("taxLocationList", taxLocations);
			modelAndViewObj.addObject("taxDetails", taxDetails.get(0));
			if(operation.equals("view"))
				modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/TaxMaster/viewTax");
			else
				modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/TaxMaster/editTax");
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
	 * 
	 *This method is used to update the Existing Tax
	 *
	 **/
	@RequestMapping(value="/updateTax",method=RequestMethod.POST)
	public ModelAndView updateTax(@RequestBody TaxBean taxBean, HttpServletRequest request,HttpServletResponse response){
//		List<String> locationsListValue = null;
//		List<String> locationsList = null;
		try{
			// log.info("updateTax ");
//			List<TaxLocations> taxLocations = new ArrayList<TaxLocations>();
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
//			//////System.out.println("dgfdg");
		/*	TaxBean taxBean = new TaxBean();
			taxBean.setTaxId(taxId);
			taxBean.setTaxName(taxName);
			taxBean.setTaxDescription(taxDescription);
			//////System.out.println(locationList);*/
			modelAndViewObj = new ModelAndView();
			/*locationsList=new ArrayList<String>();
			locationsList = adminServiceObj.getOutletLocationsList(customerId,emailId,false);
			modelAndViewObj.addObject("locationsList", locationsList);*/
			String resultStr = genericMasterServiceObj.updateTax(taxBean,customerId,emailId);
			
//			String taxListStr="";
		/*	List<String> taxLocationsList=new ArrayList<String>();
			if(taxBean.getTaxLocationsList().size()>0)
				for(int i=0;i<taxBean.getTaxLocationsList().size();i++)
				{
					taxListStr=taxBean.getTaxLocationsList().get(i).getStore_location(); 
					taxLocationsList.add(taxListStr);
					////////System.out.println(i);
				//	//////System.out.println(empList1);
				}
			
			
			modelAndViewObj.addObject("taxLocationList", taxLocationsList);*/
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("TAX_UPDATE_SUCCESS").trim()))
				modelAndViewObj.addObject("err", resultStr);
			else
				modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.addObject("taxDetails", taxBean);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/TaxMaster/editTax");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		modelAndViewObj.addObject("maxRecords",taxBean.getMaxRecords());
		modelAndViewObj.addObject("searchName",taxBean.getSearchCriteria());
		return modelAndViewObj;
	}
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to delete Taxes
	 *
	 **/
	@RequestMapping("/deleteTax")
	public ModelAndView deleteTax(@RequestParam("ids") String ids,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("deleteTax ");
			int start = 1,end = 10;
			modelAndViewObj = new ModelAndView();
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			String resultStr = genericMasterServiceObj.deleteTax(customerId,emailId,ids);
			ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails(searchName,customerId, emailId,"0",false,maxRecords);
			modelAndViewObj = new ModelAndView();
			if(taxDetails == null || taxDetails.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(taxDetails.size()<10){
					end = (taxDetails.size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(taxDetails.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("taxDetails", taxDetails);
			modelAndViewObj.addObject("err", resultStr);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/TaxMaster/taxMaster");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	
	@RequestMapping("/searchTaxMaster")
	public ModelAndView searchTaxMaster(@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,@RequestParam("maxRecords") String maxRecords, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		try{
			// log.info("searchTaxMaster");
			int start = 1,end = Integer.parseInt(maxRecords);
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails(searchNameStr,customerIdStr, emailIdStr,index,true,maxRecords);
			modelAndViewObj = new ModelAndView();
			if(taxDetails == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(taxDetails.size()<end){
					end = (taxDetails.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(taxDetails.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("taxDetails", taxDetails);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/TaxMaster/taxMaster");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		modelAndViewObj.addObject("maxRecords",maxRecords);
		return modelAndViewObj;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display the New User form
	 *
	 **//*
	@RequestMapping("/newZone")
	public ModelAndView newZone(HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("newZone");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<String> workLocationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
			ArrayList<LocationBean> locationDetails = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,false,true);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("locationDetails", locationDetails);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/ZoneMaster/newZone");
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
	 *This method is used to save the details of the Sku
	 *
	 **//*
	@RequestMapping(value="/createZone",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createZone(@RequestBody ZoneMaster zoneMasterObj,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("createZone");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = genericMasterServiceObj.createZone(zoneMasterObj,customerIdStr,emailIdStr);
			List<String> workLocationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
			modelAndViewObj = new ModelAndView();
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("ZONE_CREATE_SUCCESS").trim())){
				List<String> locationsList = new ArrayList<String>();
				for(int i=0;i<zoneMasterObj.getZoneDetails().size();i++){
					locationsList.add(zoneMasterObj.getZoneDetails().get(i).getLocation());
				}
				zoneMasterObj.setZones(locationsList);
				modelAndViewObj.addObject("zone", zoneMasterObj);
				modelAndViewObj.addObject("err", resultStr);
			}else
				modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/ZoneMaster/newZone");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	*//**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display all the sku details in a tabular form
	 *
	 **//*
	@RequestMapping("/viewZoneMaster")
	public ModelAndView viewZoneMaster(@RequestParam("index") String index,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewZoneMaster ");
			int start = 1,end = 10;
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			List<ZoneMaster> zoneList = genericMasterServiceObj.getZones(null, customerId, emailId,index);
			modelAndViewObj = new ModelAndView();
			if(zoneList == null || zoneList.isEmpty()){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(zoneList.size()<10){
					end = (zoneList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", zoneList.get(0).getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("zoneList", zoneList);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/ZoneMaster/zoneMaster");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	@RequestMapping("/searchZoneMaster")
	public ModelAndView searchZoneMaster(@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<ZoneMaster> zoneList = null;
		try{
			// log.info("searchZoneMaster");
			int start = 1,end = 10;
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			zoneList = genericMasterServiceObj.searchZoneMaster(customerIdStr, emailIdStr,searchNameStr,index);
			modelAndViewObj = new ModelAndView();
			if(zoneList == null || zoneList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(zoneList.size()<10){
					end = (zoneList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", zoneList.get(0).getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("zoneList", zoneList);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/ZoneMaster/zoneMaster");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	*//**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display the Edit Sku form with all the details of the Sku
	 *
	 **//*
	@RequestMapping("/editZone")
	public ModelAndView editZone(@RequestParam("zoneID") String zoneID,@RequestParam("operation") String operation,HttpServletRequest request,
			HttpServletResponse response){
		try{
			// log.info("editZone");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<ZoneMaster> zoneList = genericMasterServiceObj.getZones(zoneID, customerIdStr, emailIdStr, "0");
			List<String> workLocationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
			ArrayList<LocationBean> locationDetails = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,false,true);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("zone", zoneList.get(0));
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("locationDetails", locationDetails);
			if(operation.equals("view"))
				modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/ZoneMaster/viewZone");
			else
				modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/ZoneMaster/editZone");
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
	 *This method is used to save the details of the Sku
	 *
	 **//*
	@RequestMapping(value="/updateZone",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView updateZone(@RequestBody ZoneMaster zoneMasterObj,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("updateZone");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = genericMasterServiceObj.updateZone(zoneMasterObj,customerIdStr,emailIdStr);
			List<String> workLocationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
			List<String> locationsList = new ArrayList<String>();
			for(int i=0;i<zoneMasterObj.getZoneDetails().size();i++){
				locationsList.add(zoneMasterObj.getZoneDetails().get(i).getLocation());
			}
			zoneMasterObj.setZones(locationsList);
			modelAndViewObj = new ModelAndView();
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("ZONE_UPDATE_SUCCESS").trim()))
				modelAndViewObj.addObject("err", resultStr);
			else
				modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.addObject("zone", zoneMasterObj);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/ZoneMaster/editZone");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	*//**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to delete Taxes
	 *
	 **//*
	@RequestMapping("/deleteZone")
	public ModelAndView deleteZone(@RequestParam("ids") String ids,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("deleteZone ");
			int start = 1,end = 10;
			modelAndViewObj = new ModelAndView();
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			String resultStr = genericMasterServiceObj.deleteZone(customerId,emailId,ids);
			List<ZoneMaster> zoneList = genericMasterServiceObj.getZones(null, customerId, emailId,"0");
			modelAndViewObj = new ModelAndView();
			if(zoneList == null || zoneList.isEmpty()){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(zoneList.size()<10){
					end = (zoneList.size())+(0);
				}
				modelAndViewObj.addObject("totalRecords", zoneList.get(0).getTotalRecords());
				modelAndViewObj.addObject("index", start);
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("zoneList", zoneList);
			modelAndViewObj.addObject("err", resultStr);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/ZoneMaster/zoneMaster");
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
	 *This method is used to display the New User form
	 *
	 **/
	@RequestMapping("/newZone")
	public ModelAndView newZone(@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,
HttpServletRequest request,HttpServletResponse response){
		ArrayList<LocationBean> zonelocationDetails  =null;
		try{
			// log.info("newZone");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			//List<String> workLocationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
			ArrayList<LocationBean> locationDetails = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,true,true);
		
			/*written by manasa
			purpose:to get zone locations*/
			 zonelocationDetails = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","Zone",false,true,true);
			modelAndViewObj = new ModelAndView();
			List<String> locationStr=new ArrayList<String>();
			List<LocationBean> zoneLocations=new ArrayList<LocationBean>();
			if(zonelocationDetails!=null)
		    for(int i=0;i<zonelocationDetails.size();i++)
		    {
		    //	if(locationDetails.get(i).getBusinessActivity()=="zone");
		    	locationStr.add(zonelocationDetails.get(i).getLocationId());
		     }
			 for(int i=0;i<locationDetails.size();i++)
			    {
			    	if(!locationDetails.get(i).getBusinessActivity().equalsIgnoreCase("Zone"))
			    		zoneLocations.add(locationDetails.get(i));
			     }
			
		    modelAndViewObj.addObject("locationStr", locationStr);
			//modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("locationDetails", zoneLocations);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);

			
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/ZoneMaster/newZone");
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
	 *This method is used to save the details of the Sku
	 *
	 **/
	@RequestMapping(value="/createZone",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createZone(@RequestBody ZoneMaster zoneMasterObj,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("createZone");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String maxRecords = zoneMasterObj.getMaxRecords();
			String searchName = zoneMasterObj.getSearchCriteria();
			String resultStr = genericMasterServiceObj.createZone(zoneMasterObj,customerIdStr,emailIdStr);
//			List<String> workLocationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
			ArrayList<LocationBean> locationDetails = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,false,true);

			modelAndViewObj = new ModelAndView();
			/*written by manasa
			purpose:to get zone locations*/
			
			ArrayList<LocationBean> zonelocationDetails = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","Zone",false,true,true);
			List<String> locationStr=new ArrayList<String>();
		    for(int i=0;i<zonelocationDetails.size();i++)
		    {
		    //	if(locationDetails.get(i).getBusinessActivity()=="zone");
		    	locationStr.add(zonelocationDetails.get(i).getLocationId());
		     }
		    modelAndViewObj.addObject("locationStr", locationStr);
			
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("ZONE_CREATE_SUCCESS").trim())){
				List<String> locationsList = new ArrayList<String>();
				for(int i=0;i<zoneMasterObj.getZoneDetails().size();i++){
					locationsList.add(zoneMasterObj.getZoneDetails().get(i).getLocation()+"+"+zoneMasterObj.getZoneDetails().get(i).getLocationType());
				}
				zoneMasterObj.setZones(locationsList);
				////////System.out.println(zoneMasterObj.getZones());
				modelAndViewObj.addObject("zone", zoneMasterObj);
				modelAndViewObj.addObject("err", resultStr);
			}else
				modelAndViewObj.addObject("success", resultStr);
//			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("locationDetails", locationDetails);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/ZoneMaster/newZone");
		}catch(Exception e){
			e.printStackTrace();
		}
		

		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display all the sku details in a tabular form
	 *
	 **/
	@RequestMapping("/viewZoneMaster")
	public ModelAndView viewZoneMaster(@RequestParam("index") String index,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,
HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewZoneMaster ");
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			List<ZoneMaster> zoneList = genericMasterServiceObj.getZones(null, customerId, emailId,index,maxRecords,searchName);
			modelAndViewObj = new ModelAndView();
			if(zoneList == null || zoneList.isEmpty()){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(zoneList.size()<end){
					end = (zoneList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", zoneList.get(0).getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("zoneList", zoneList);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);

			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/ZoneMaster/zoneMaster");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}


	@RequestMapping("/newServiceAreaMaster")
	public ModelAndView newServiceAreaMaster(@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,
HttpServletRequest request,HttpServletResponse response){
//		ArrayList<LocationBean> zonelocationDetails  =null;
		try{
			// log.info("newZone");
			//List<String> locationsList = null;
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			//List<String> workLocationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
			ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,true,true);
		
			modelAndViewObj = new ModelAndView();
			List<String> locationStr=new ArrayList<String>();
			
		    modelAndViewObj.addObject("locationStr", locationStr);
			//modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/ServiceAreaMaster/newServiceAreaMaster");
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
	 *This method is used to display all the sku details in a tabular form
	 *
	 **/
	@RequestMapping("/viewRouteMaster")
	public ModelAndView viewRouteMaster(@RequestParam("location") String location,@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,@RequestParam("zone") String zone,@RequestParam("index") int index,@RequestParam("maxRecords") int maxRecords,@RequestParam("searchName") String searchName,
HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewZoneMaster ");
			int start = 1,end = maxRecords;
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			List<RouteMaster> routeList =genericMasterServiceObj.getRouteMasters(customerId, emailId,index,maxRecords,searchName,false,null,location,startDate,endDate,zone);
			ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
			modelAndViewObj = new ModelAndView();
			if(routeList == null || routeList.isEmpty()){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(routeList.size()<end){
					end = (routeList.size())+index;
				}else{
					end = ((index)+end);
				}
				modelAndViewObj.addObject("totalRecords", routeList.get(0).getTotalRecords());
				modelAndViewObj.addObject("index", ((index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("routeList", routeList);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);
			modelAndViewObj.addObject("enddate",endDate);
			modelAndViewObj.addObject("loc",location);
			modelAndViewObj.addObject("startdate",startDate);
			modelAndViewObj.addObject("zone",zone);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/RouteMaster/routeMaster");
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
	 *This method is used to display the New User form
	 *
	 **/
	@RequestMapping("/newRoute")
	public ModelAndView newRoute(@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,
HttpServletRequest request,HttpServletResponse response){
//		ArrayList<LocationBean> zonelocationDetails  =null;
		try{
			// log.info("newZone");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			//List<String> workLocationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
			ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,true,true);
		
			modelAndViewObj = new ModelAndView();
			List<String> locationStr=new ArrayList<String>();
			
		
		    modelAndViewObj.addObject("locationStr", locationStr);
			//modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);

			
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/RouteMaster/newRoute");
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
	 *
	 **/
	@RequestMapping("/viewEditRouteMaster")
	public ModelAndView viewEditRouteMaster(@RequestParam("routeId") String routeId,@RequestParam("maxRecords") int maxRecords,@RequestParam("searchName") String searchName,@RequestParam("operation") String operation,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("editTax");
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			List<RouteMaster> routeList =genericMasterServiceObj.getRouteMasters(customerId, emailId,0,maxRecords,searchName,true,routeId,null,null,null,null);
			modelAndViewObj = new ModelAndView();
			List<LocationBean> locationsList = null;
			locationsList =genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("routeList", routeList);
			if(operation.equals("view"))
				modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/RouteMaster/viewRouteMasterDetails");
			else
				modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/RouteMaster/editRouteMasterDetails");
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
	 * @author Manasa.P
	 * 
	 *This method is used to save the New Tax
	 *
	 **/
	@RequestMapping(value="/createRouteMaster",method=RequestMethod.POST)
	public ModelAndView createRouteMaster(@RequestBody RouteMaster routeMaster,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("createTax ");
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			String resultStr = genericMasterServiceObj.createRouteMaster(customerId,emailId,routeMaster);
			modelAndViewObj = new ModelAndView();
			ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
			modelAndViewObj.addObject("locationsList", locationsList);
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("ROUTE_MASTER_SUCCESSFULLY").trim())){
				modelAndViewObj.addObject("err", resultStr);
				modelAndViewObj.addObject("routeMaster",routeMaster);
//				modelAndViewObj.addObject("taxDescription",taxBean.getTaxDescription());
			}else
				modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/RouteMaster/newRoute");
		}catch(Exception exception){
			exception.printStackTrace();
		}
	/*	modelAndViewObj.addObject("maxRecords",taxBean.getMaxRecords());
		modelAndViewObj.addObject("searchName",taxBean.getSearchCriteria());*/
		return modelAndViewObj;
	}
	
	
	
	
	@RequestMapping("/viewServiceAreaMaster")
	public ModelAndView viewServiceAreaMaster(@RequestParam("location") boolean location,@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,@RequestParam("zone") String zone,@RequestParam("index") int index,@RequestParam("maxRecords") int maxRecords,@RequestParam("searchName") String searchName,
HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewZoneMaster");
			int start = 1,end = maxRecords;
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			List<RetailServiceArea> serviceAreaList = genericMasterServiceObj.getServiceAreaDetails("", customerId, emailId,index,maxRecords,searchName,startDate,endDate,location);
			ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
			modelAndViewObj = new ModelAndView();
			if(serviceAreaList == null || serviceAreaList.isEmpty()){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(serviceAreaList.size()<end){
					end = (serviceAreaList.size())+index;
				}else{
					end = ((index)+end);
				}
				modelAndViewObj.addObject("totalRecords", serviceAreaList.get(0).getTotalRecords());
				modelAndViewObj.addObject("index", ((index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("serviceAreaList", serviceAreaList);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);
			modelAndViewObj.addObject("enddate",endDate);
			modelAndViewObj.addObject("status",location);
			modelAndViewObj.addObject("startdate",startDate);
			modelAndViewObj.addObject("zone",zone);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/ServiceAreaMaster/serviceAreaMaster");
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
	 *
	 **/
	@RequestMapping(value="/createServiceAreaMaster",method=RequestMethod.POST)
	public ModelAndView createServiceAreaMaster(@RequestBody RetailServiceArea serviceAreaMaster,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("createTax ");
			//////System.out.println("zfd");
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			String roleStr = (String)request.getSession().getAttribute("role");
			if(serviceAreaMaster.getIsRadiusSepcificFlag().equals("true"))
			{
				serviceAreaMaster.setRadiusSepcific(true);
			}
			else
			{
				serviceAreaMaster.setRadiusSepcific(false);
			}
			String resultStr = genericMasterServiceObj.createServiceAreaMaster(customerId,emailId,roleStr,serviceAreaMaster);
			modelAndViewObj = new ModelAndView();
			ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
			modelAndViewObj.addObject("locationsList", locationsList);
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("SERVICE_AREA_CREATED_SUCCESSFULLY").trim())){
				modelAndViewObj.addObject("err", resultStr);
				modelAndViewObj.addObject("serviceAreaMaster",serviceAreaMaster);
//				modelAndViewObj.addObject("taxDescription",taxBean.getTaxDescription());
			}else
				modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.addObject("maxRecords",serviceAreaMaster.getMaxRecords());
//			modelAndViewObj.addObject("searchName",serviceAreaMaster.getSearchCriteria());
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/ServiceAreaMaster/newServiceAreaMaster");
		}catch(Exception exception){
			exception.printStackTrace();
		}
	
		return modelAndViewObj;
	}
	
	
	
	/**
	 * 
	 * @author Manasa.P
	 * 
	
	 *
	 **/
	@RequestMapping(value="/updateServiceAreaMaster",method=RequestMethod.POST)
	public ModelAndView updateServiceAreaMaster(@RequestBody RetailServiceArea serviceAreaMaster,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("updateServiceAreaMaster ");
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			if(serviceAreaMaster.getIsRadiusSepcificFlag().equals("true"))
			{
				serviceAreaMaster.setRadiusSepcific(true);
			}
			else
			{
				serviceAreaMaster.setRadiusSepcific(false);
			}
			String resultStr = genericMasterServiceObj.updateServiceAreaMaster(customerId,emailId,serviceAreaMaster);
			modelAndViewObj = new ModelAndView();
			List<RetailServiceArea> serviceAreaList = genericMasterServiceObj.getServiceAreaDetails(serviceAreaMaster.getArea_code(), customerId, emailId, 0,serviceAreaMaster.getMaxRecords(),"","","",true);
			ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
			modelAndViewObj.addObject("serviceAreaMaster",serviceAreaList);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("maxRecords",serviceAreaMaster.getMaxRecords());
			modelAndViewObj.addObject("searchName","");
			modelAndViewObj.addObject("statusCheck",true);
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("SERVICE_AREA_UPDATED_SUCCESSFULLY").trim())){
				modelAndViewObj.addObject("err", resultStr);
				
//				modelAndViewObj.addObject("taxDescription",taxBean.getTaxDescription());
			}else
				modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/ServiceAreaMaster/editServiceAreaMaster");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		modelAndViewObj.addObject("maxRecords",serviceAreaMaster.getMaxRecords());
//		modelAndViewObj.addObject("searchName",taxBean.getSearchCriteria());
		return modelAndViewObj;
	}
	
	
	
	
	@RequestMapping("/viewEditServiceAreaMaster")
	public ModelAndView viewEditServiceAreaMaster(@RequestParam("status") String status,@RequestParam("areaCode") String areaCode,@RequestParam("maxRecords") int maxRecords,@RequestParam("searchName") String searchName,@RequestParam("operation") String operation,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("editTax");
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			List<RetailServiceArea> serviceAreaList = genericMasterServiceObj.getServiceAreaDetails(areaCode, customerId, emailId, 0,maxRecords,"","","",true);
		
			modelAndViewObj.addObject("serviceAreaMaster", serviceAreaList);
			if(operation.equals("view"))
				modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/ServiceAreaMaster/viewServiceAreaMaster");
			else
				modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/ServiceAreaMaster/editServiceAreaMaster");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		modelAndViewObj.addObject("maxRecords",maxRecords);
		modelAndViewObj.addObject("searchName",searchName);
		modelAndViewObj.addObject("statusCheck",status);
		return modelAndViewObj;
	}

	
	
	@RequestMapping("/deleteserviceAreaMaster")
	public ModelAndView deleteserviceAreaMaster(@RequestParam("ids") String ids,@RequestParam("searchName") String searchName,@RequestParam("maxRecords") int maxRecords,HttpServletRequest request,HttpServletResponse response){
		try{
			int start = 1,end = maxRecords;
			modelAndViewObj = new ModelAndView();
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			String resultStr = genericMasterServiceObj.deleteServiceAreaMaster(customerId,emailId,ids);
			List<RetailServiceArea> serviceAreaList = genericMasterServiceObj.getServiceAreaDetails("", customerId, emailId, 0,maxRecords,"","","",true);
			ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
			modelAndViewObj = new ModelAndView();
			if(serviceAreaList == null || serviceAreaList.isEmpty()){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(serviceAreaList.size()<end){
					end = (serviceAreaList.size())+0;
				}else{
					end = ((0)+end);
				}
				modelAndViewObj.addObject("totalRecords", serviceAreaList.get(0).getTotalRecords());
				modelAndViewObj.addObject("index", ((0)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("SERVICE_AREA_DELETED_SUCCESSFULLY").trim())){
				modelAndViewObj.addObject("err", resultStr);
			}else
				modelAndViewObj.addObject("success", resultStr);
			
			
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("serviceAreaList", serviceAreaList);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);
		/*	modelAndViewObj.addObject("enddate",endDate);
			modelAndViewObj.addObject("loc",location);
			modelAndViewObj.addObject("startdate",startDate);
			modelAndViewObj.addObject("zone",zone);*/
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/ServiceAreaMaster/serviceAreaMaster");
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
	 *
	 **/
	@RequestMapping(value="/updateRouteMaster",method=RequestMethod.POST)
	public ModelAndView updateRouteMaster(@RequestBody RouteMaster routeMaster,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("createTax ");
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			String resultStr = genericMasterServiceObj.updateRouteMaster(customerId,emailId,routeMaster);
			modelAndViewObj = new ModelAndView();
			List<RouteMaster> routeList =genericMasterServiceObj.getRouteMasters(customerId, emailId,0,10,"",true,routeMaster.getRouteId(),null,null,null,null);
			ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
			modelAndViewObj.addObject("locationsList", locationsList);
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("ROUTE_MASTER_UPDATED_SUCCESSFULLY").trim())){
				modelAndViewObj.addObject("err", resultStr);
				/*modelAndViewObj.addObject("taxName",taxBean.getTaxName());
				modelAndViewObj.addObject("taxDescription",taxBean.getTaxDescription());*/
			}else
				modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.addObject("routeList", routeList);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/RouteMaster/editRouteMasterDetails");
		}catch(Exception exception){
			exception.printStackTrace();
		}
	/*	modelAndViewObj.addObject("maxRecords",taxBean.getMaxRecords());
		modelAndViewObj.addObject("searchName",taxBean.getSearchCriteria());*/
		return modelAndViewObj;
	}
	
	
	
	@RequestMapping("/searchZoneMaster")
	public ModelAndView searchZoneMaster(@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,@RequestParam("maxRecords") String maxRecords, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<ZoneMaster> zoneList = null;
		try{
			// log.info("searchZoneMaster");
			int start = 1,end = Integer.parseInt(maxRecords);
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			zoneList = genericMasterServiceObj.getZones("", customerIdStr, emailIdStr, index, maxRecords, searchNameStr);
			modelAndViewObj = new ModelAndView();
			if(zoneList == null || zoneList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(zoneList.size()<end){
					end = (zoneList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", zoneList.get(0).getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("zoneList", zoneList);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/ZoneMaster/zoneMaster");
		}catch(Exception e){
			e.printStackTrace();
		}
		modelAndViewObj.addObject("maxRecords",maxRecords);
		

		return modelAndViewObj;
	}
	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display the Edit Sku form with all the details of the Sku
	 *
	 **/
	@RequestMapping("/editZone")
	public ModelAndView editZone(@RequestParam("zoneID") String zoneID,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,
@RequestParam("operation") String operation,HttpServletRequest request,
			HttpServletResponse response){
		try{
			// log.info("editZone");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<ZoneMaster> zoneList = genericMasterServiceObj.getZones(zoneID, customerIdStr, emailIdStr, "0","","");
			List<String> workLocationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
			ArrayList<LocationBean> locationDetails = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,true,true);
			
			/*written by manasa
			purpose:to get zone locations*/
			modelAndViewObj = new ModelAndView();
			ArrayList<LocationBean> zonelocationDetails = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","Zone",false,true,true);
			modelAndViewObj = new ModelAndView();
			List<String> locationStr=new ArrayList<String>();
			List<LocationBean> zoneLocations=new ArrayList<LocationBean>();
			if(zonelocationDetails != null)
		    for(int i=0;i<zonelocationDetails.size();i++)
		    {
		    //	if(locationDetails.get(i).getBusinessActivity()=="zone");
		    	locationStr.add(zonelocationDetails.get(i).getLocationId());
		     }
			
			 for(int i=0;i<locationDetails.size();i++)
			    {
				 	if(!locationDetails.get(i).getBusinessActivity().equalsIgnoreCase("Zone"))
			    		zoneLocations.add(locationDetails.get(i));
			    }
		    modelAndViewObj.addObject("locationStr", locationStr);
			modelAndViewObj.addObject("zone", zoneList.get(0));
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("locationDetails", zoneLocations);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);

			if(operation.equals("view"))
				modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/ZoneMaster/viewZone");
			else
				modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/ZoneMaster/editZone");
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
	 *This method is used to save the details of the Sku
	 *
	 **/
	@RequestMapping(value="/updateZone",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView updateZone(@RequestBody ZoneMaster zoneMasterObj,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("updateZone");
			String maxRecords = zoneMasterObj.getMaxRecords();
			String searchName = zoneMasterObj.getSearchCriteria();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = genericMasterServiceObj.updateZone(zoneMasterObj,customerIdStr,emailIdStr);
			List<String> workLocationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
			
			//written by manasa 
			ArrayList<LocationBean> locationDetails = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,false,true);
			List<ZoneMaster> zoneList = genericMasterServiceObj.getZones(zoneMasterObj.getZoneID(), customerIdStr, emailIdStr, "0","","");
			/*	List<String> locationsList = new ArrayList<String>();
			for(int i=0;i<zoneMasterObj.getZoneDetails().size();i++){
				locationsList.add(zoneMasterObj.getZoneDetails().get(i).getLocation());
			}
			zoneMasterObj.setZones(locationsList);*/
			modelAndViewObj = new ModelAndView();
		
			ArrayList<LocationBean> zonelocationDetails = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","Zone",false,true,true);
			modelAndViewObj = new ModelAndView();
			List<String> locationStr=new ArrayList<String>();
		    for(int i=0;i<zonelocationDetails.size();i++)
		    {
		    //	if(locationDetails.get(i).getBusinessActivity()=="zone");
		    	locationStr.add(zonelocationDetails.get(i).getLocationId());
		     }
		    modelAndViewObj.addObject("locationStr", locationStr);
			
			
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("ZONE_UPDATE_SUCCESS").trim()))
				modelAndViewObj.addObject("err", resultStr);
			else
				modelAndViewObj.addObject("success", resultStr);
		//	modelAndViewObj.addObject("zone", zoneMasterObj);
			
			modelAndViewObj.addObject("zone", zoneList.get(0));
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("locationDetails", locationDetails);
			modelAndViewObj.addObject("searchName",searchName);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/ZoneMaster/editZone");
		}catch(Exception e){
			e.printStackTrace();
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
	@RequestMapping("/deleteZone")
	public ModelAndView deleteZone(@RequestParam("ids") String ids,@RequestParam("searchName") String searchName,@RequestParam("maxRecords") String maxRecords,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("deleteZone ");
			int start = 1,end = Integer.parseInt(maxRecords);
			modelAndViewObj = new ModelAndView();
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			String resultStr = genericMasterServiceObj.deleteZone(customerId,emailId,ids);
		//	List<ZoneMaster> zoneList = genericMasterServiceObj.getZones(null, customerId, emailId,"0");
			List<ZoneMaster> zoneList = genericMasterServiceObj.getZones("", customerId, emailId, "0", maxRecords, searchName);

			modelAndViewObj = new ModelAndView();
			if(zoneList == null || zoneList.isEmpty()){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(zoneList.size()<end){
					end = (zoneList.size())+(0);
				}
				modelAndViewObj.addObject("totalRecords", zoneList.get(0).getTotalRecords());
				modelAndViewObj.addObject("index", start);
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("zoneList", zoneList);
			modelAndViewObj.addObject("err", resultStr);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/ZoneMaster/zoneMaster");
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		modelAndViewObj.addObject("maxRecords",maxRecords);
		modelAndViewObj.addObject("searchName",searchName);
		return modelAndViewObj;
	}


	@RequestMapping("/deleteRouteMaster")
	public ModelAndView deleteRouteMaster(@RequestParam("ids") String ids,@RequestParam("searchName") String searchName,@RequestParam("maxRecords") int maxRecords,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("deleteZone ");
			int start = 1,end = maxRecords;
			modelAndViewObj = new ModelAndView();
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			String resultStr = genericMasterServiceObj.deleteRouteMaster(customerId,emailId,ids);
			List<RouteMaster> routeList = genericMasterServiceObj.getRouteMasters(customerId, emailId,0,maxRecords,searchName,false,null,"","","","");
			ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
			modelAndViewObj = new ModelAndView();
			if(routeList == null || routeList.isEmpty()){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(routeList.size()<end){
					end = (routeList.size())+0;
				}else{
					end = ((0)+end);
				}
				modelAndViewObj.addObject("totalRecords", routeList.get(0).getTotalRecords());
				modelAndViewObj.addObject("index", ((0)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("routeList", routeList);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);
		/*	modelAndViewObj.addObject("enddate",endDate);
			modelAndViewObj.addObject("loc",location);
			modelAndViewObj.addObject("startdate",startDate);
			modelAndViewObj.addObject("zone",zone);*/
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/RouteMaster/routeMaster");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}

	
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to view the  brand details  
	 *
	 **/
	
	@RequestMapping("/viewBrand")
	public ModelAndView viewBrand(@RequestParam("index")String index,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName, HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewBrand ");
			int start = 1, end = Integer.parseInt(maxRecords);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<BrandMaster> brandsList = genericMasterServiceObj.getBrandDetails(searchName,customerIdStr, emailIdStr,index,maxRecords, false);
			modelAndViewObj = new ModelAndView();
			if(brandsList == null || brandsList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(brandsList.size()<Integer.parseInt(maxRecords)){
					end = (brandsList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(brandsList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("brandDetails", brandsList);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			
			modelAndViewObj.addObject("searchName",searchName);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/BrandMaster/brandMaster");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}

/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to display the Edit Brand form consisting of the details of the Brand
	 *
	 **/
	@RequestMapping("/editBrand")
	public ModelAndView editBrand(@RequestParam("bName") String bName,@RequestParam("operation") String operation,@RequestParam("maxRecords") String maxRecords, @RequestParam("searchName") String searchName, HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("editBrand");
			List<SupplierBean> supplierList;
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			List<BrandMaster> brandDetailsList = genericMasterServiceObj.getBrandDetails(bName,customerIdStr, emailIdStr,"0","",false);
			String supplierIdStr = brandDetailsList.get(0).getSupplier();
			if(supplierIdStr != null || supplierIdStr != "");
			 supplierList=outletMasterServiceObj.searchSuppliers(customerIdStr, emailIdStr, supplierIdStr, "0","");
			 
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,Constants.PAGINATION_START_INDEX);
			List<String> workLocationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr,true);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("categories", categoryList);
			modelAndViewObj.addObject("maxRecords", maxRecords);
			modelAndViewObj.addObject("searchName",searchName);
			if(brandDetailsList != null && brandDetailsList.size() > 0){
				modelAndViewObj.addObject("brandDetails", brandDetailsList.get(0));
				if(brandDetailsList.get(0).getBrandprice() != null && brandDetailsList.get(0).getBrandprice().size() > 0)
					modelAndViewObj.addObject("brandPrice",brandDetailsList.get(0).getBrandprice().get(0));
			}
			if(supplierList != null && supplierList.size() > 0)
				modelAndViewObj.addObject("supplierName",supplierList.get(0).getFirmName());
			if(operation.equals("view"))
				modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/BrandMaster/viewBrand");
			else
				modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/BrandMaster/editBrand");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		
		return modelAndViewObj;
		
	}

	
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to update the Existing Brand
	 *
	 **/

@RequestMapping(value="/updateBrandMaster",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView updateBrandMaster(@RequestBody BrandMaster brandMasterObj,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("updateBrandMaster");
			List<SupplierBean> supplierList;
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
//			String subCategoriesStr = masterServiceObj.getCategories(customerIdStr,emailIdStr);
			String supplierIdStr = brandMasterObj.getSupplier();
			if(supplierIdStr != null | supplierIdStr != "");
			{
			 supplierList=outletMasterServiceObj.searchSuppliers(customerIdStr, emailIdStr, supplierIdStr, "0","");
			}
//			ArrayList<String> categories = masterServiceObj.getCategoriesList(subCategoriesStr);
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,Constants.PAGINATION_START_INDEX);
			if(categoryList != null && categoryList.size() >0){
				List<ProductSubCategoryBean> subCategoryList = outletMasterServiceObj.getSubCategoryDetails(categoryList.get(0).getCategoryName(), customerIdStr, emailIdStr, "-1","", true);
				modelAndViewObj.addObject("subCategoryList", subCategoryList);
			}
			List<String> workLocationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr,true);
			// log.info(workLocationsList.size());
			String resultStr=genericMasterServiceObj.updateBrand(brandMasterObj, customerIdStr, emailIdStr);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("categories", categoryList);
//			modelAndViewObj.addObject("subCategories", subCategoriesStr);
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("BRAND_UPDATE_SUCCESS").trim()))
				modelAndViewObj.addObject("err", resultStr);
			else
				modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.addObject("brandDetails", brandMasterObj);
			modelAndViewObj.addObject("brandPrice",brandMasterObj.getBrandprice().get(0));
			modelAndViewObj.addObject("maxRecords",brandMasterObj.getMaxRecords());
			modelAndViewObj.addObject("searchName", brandMasterObj.getSearchCriteria());
			modelAndViewObj.addObject("brandProduct", brandMasterObj.getBrandproduct());
			modelAndViewObj.addObject("supplierName",supplierList.get(0).getFirmName());
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/BrandMaster/editBrand");
			////////System.out.println(modelAndViewObj);
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}

	
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to search the Brand 
	 *11/12/2015
	 **/
	@RequestMapping("/searchBrandMaster")
	public ModelAndView searchBrandMaster(@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,@RequestParam("maxRecords") String maxRecords, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		try{
			// log.info("searchBrandMaster");
			int start = 1,end = Integer.parseInt(maxRecords);
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<BrandMaster> brandDetailsList = genericMasterServiceObj.getBrandDetails(searchNameStr,customerIdStr, emailIdStr,index,maxRecords,true);
			modelAndViewObj = new ModelAndView();
			if(brandDetailsList == null || brandDetailsList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(brandDetailsList.size()<end){
					end = (brandDetailsList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(brandDetailsList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("maxRecords)",maxRecords);
			modelAndViewObj.addObject("brandDetails", brandDetailsList);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/BrandMaster/brandMaster");
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	

	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to delete the Brand
	 *
	 **/
	@RequestMapping("/deleteBrand")
	public ModelAndView deleteBrand(@RequestParam("ids") String ids,@RequestParam("searchName") String searchName, @RequestParam("maxRecords")String maxRecords, HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("deleteBrand ");
			int start = 1,end = Integer.parseInt(maxRecords);
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = genericMasterServiceObj.deleteBrand(customerIdStr,emailIdStr,ids);
			List<BrandMaster> brandDetailsList = genericMasterServiceObj.getBrandDetails(searchName,customerIdStr, emailIdStr,"0",maxRecords,false);
			modelAndViewObj = new ModelAndView();
			if(brandDetailsList == null || brandDetailsList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(brandDetailsList.size()<end){
					end = (brandDetailsList.size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(brandDetailsList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("brandDetails", brandDetailsList);
			modelAndViewObj.addObject("err", resultStr);
			modelAndViewObj.addObject("maxRecords", maxRecords);
			modelAndViewObj.addObject("searchName",searchName);
			
			
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/BrandMaster/brandMaster");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to display new Brand
	 *
	 **/
	@RequestMapping(value="/newBrandMaster")
		public ModelAndView newBrandMaster(@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName, HttpServletRequest request,HttpServletResponse response){
			try{
				// log.info("newBrandMaster");
				modelAndViewObj = new ModelAndView();
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,Constants.PAGINATION_START_INDEX);
				if(categoryList != null && categoryList.size() >0){
					List<ProductSubCategoryBean> subCategoryList = outletMasterServiceObj.getSubCategoryDetails(categoryList.get(0).getCategoryName(), customerIdStr, emailIdStr, "-1","", true);
					modelAndViewObj.addObject("subCategoryList", subCategoryList);
				}
				List<String> workLocationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr,false);
				// log.info(workLocationsList.size());
				modelAndViewObj.addObject("workLocationsList", workLocationsList);
				modelAndViewObj.addObject("categories", categoryList);
				modelAndViewObj.addObject("maxRecords",maxRecords);
				modelAndViewObj.addObject("searchName",searchName);
				modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/BrandMaster/newBrandMaster");
			//	//////System.out.println(modelAndViewObj);
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}

	
	
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to view the  brand details  
	 *
	 **//*
	
	
	@RequestMapping("/viewBrand")
	public ModelAndView viewBrand(@RequestParam("index")String index,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewBrand ");
			int start = 1,end = 10;
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<BrandMaster> brandsList = genericMasterServiceObj.getBrandDetails("",customerIdStr, emailIdStr,index,false);
			modelAndViewObj = new ModelAndView();
			if(brandsList == null || brandsList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(brandsList.size()<10){
					end = (brandsList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(brandsList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("brandDetails", brandsList);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/BrandMaster/brandMaster");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}

*//**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to display the Edit Brand form consisting of the details of the Brand
	 *
	 **//*
	@RequestMapping("/editBrand")
	public ModelAndView editBrand(@RequestParam("bName") String bName,@RequestParam("operation") String operation,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("editBrand");
			List<SupplierBean> supplierList;
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			List<BrandMaster> brandDetailsList = genericMasterServiceObj.getBrandDetails(bName,customerIdStr, emailIdStr,"0",false);
			String supplierIdStr = brandDetailsList.get(0).getSupplier();
			if(supplierIdStr != null || supplierIdStr != "");
			 supplierList=outletMasterServiceObj.searchSuppliers(customerIdStr, emailIdStr, supplierIdStr, "0");
			String subCategoriesStr = masterServiceObj.getCategories(customerIdStr,emailIdStr);
			if(subCategoriesStr.equals("{}"))
				modelAndViewObj.addObject("err", "Please Create Category and Sub Category prior to create product");
//			ArrayList<String> categoriesList = masterServiceObj.getCategoriesList(subCategoriesStr);
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,Constants.PAGINATION_START_INDEX);
			List<String> workLocationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr,true);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("categories", categoryList);
//			modelAndViewObj.addObject("subCategories", subCategoriesStr);
			if(brandDetailsList != null && brandDetailsList.size() > 0){
				modelAndViewObj.addObject("brandDetails", brandDetailsList.get(0));
				if(brandDetailsList.get(0).getBrandprice() != null && brandDetailsList.get(0).getBrandprice().size() > 0)
					modelAndViewObj.addObject("brandPrice",brandDetailsList.get(0).getBrandprice().get(0));
			}
			if(supplierList != null && supplierList.size() > 0)
				modelAndViewObj.addObject("supplierName",supplierList.get(0).getFirmName());
			if(operation.equals("view"))
				modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/BrandMaster/viewBrand");
			else
				modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/BrandMaster/editBrand");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		
		return modelAndViewObj;
		
	}

	
	*//**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to update the Existing Brand
	 *
	 **//*

@RequestMapping(value="/updateBrandMaster",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView updateBrandMaster(@RequestBody BrandMaster brandMasterObj,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("updateBrandMaster");
			List<SupplierBean> supplierList;
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
//			String subCategoriesStr = masterServiceObj.getCategories(customerIdStr,emailIdStr);
			String supplierIdStr = brandMasterObj.getSupplier();
			if(supplierIdStr != null | supplierIdStr != "");
			{
			 supplierList=outletMasterServiceObj.searchSuppliers(customerIdStr, emailIdStr, supplierIdStr, "0");
			}
//			ArrayList<String> categories = masterServiceObj.getCategoriesList(subCategoriesStr);
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,Constants.PAGINATION_START_INDEX);
			if(categoryList != null && categoryList.size() >0){
				List<ProductSubCategoryBean> subCategoryList = outletMasterServiceObj.getSubCategoryDetails(categoryList.get(0).getCategoryName(), customerIdStr, emailIdStr, "-1", true);
				modelAndViewObj.addObject("subCategoryList", subCategoryList);
			}
			List<String> workLocationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr,true);
			// log.info(workLocationsList.size());
			String resultStr=genericMasterServiceObj.updateBrand(brandMasterObj, customerIdStr, emailIdStr);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("categories", categoryList);
//			modelAndViewObj.addObject("subCategories", subCategoriesStr);
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("BRAND_UPDATE_SUCCESS").trim()))
				modelAndViewObj.addObject("err", resultStr);
			else
				modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.addObject("brandDetails", brandMasterObj);
			modelAndViewObj.addObject("brandPrice",brandMasterObj.getBrandprice().get(0));
			modelAndViewObj.addObject("brandProduct", brandMasterObj.getBrandproduct().get(0));
			modelAndViewObj.addObject("supplierName",supplierList.get(0).getFirmName());
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/BrandMaster/editBrand");
			//////System.out.println(modelAndViewObj);
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}

	
	*//**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to search the Brand 
	 *11/12/2015
	 **//*
	
	

	@RequestMapping("/searchBrandMaster")
	public ModelAndView searchBrandMaster(@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		try{
			// log.info("searchBrandMaster");
			int start = 1,end = 10;
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<BrandMaster> brandDetailsList = genericMasterServiceObj.getBrandDetails(searchNameStr,customerIdStr, emailIdStr,index,true);
			modelAndViewObj = new ModelAndView();
			if(brandDetailsList == null || brandDetailsList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(brandDetailsList.size()<10){
					end = (brandDetailsList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(brandDetailsList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("brandDetails", brandDetailsList);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/BrandMaster/brandMaster");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	

	*//**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to delete the Brand
	 *
	 **//*
	
	@RequestMapping("/deleteBrand")
	public ModelAndView deleteBrand(@RequestParam("ids") String ids,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("deleteBrand ");
			int start = 1,end = 10;
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = genericMasterServiceObj.deleteBrand(customerIdStr,emailIdStr,ids);
			List<BrandMaster> brandDetailsList = genericMasterServiceObj.getBrandDetails("",customerIdStr, emailIdStr,"0",false);
			modelAndViewObj = new ModelAndView();
			if(brandDetailsList == null || brandDetailsList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(brandDetailsList.size()<10){
					end = (brandDetailsList.size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(brandDetailsList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("brandDetails", brandDetailsList);
			modelAndViewObj.addObject("err", resultStr);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/BrandMaster/brandMaster");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	*//**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to display new Brand
	 *
	 **//*
	

@RequestMapping(value="/newBrandMaster")
		public ModelAndView newBrandMaster(HttpServletRequest request,HttpServletResponse response){
			try{
				// log.info("newBrandMaster");
				modelAndViewObj = new ModelAndView();
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,Constants.PAGINATION_START_INDEX);
				if(categoryList != null && categoryList.size() >0){
					List<ProductSubCategoryBean> subCategoryList = outletMasterServiceObj.getSubCategoryDetails(categoryList.get(0).getCategoryName(), customerIdStr, emailIdStr, "-1", true);
					modelAndViewObj.addObject("subCategoryList", subCategoryList);
				}
				List<String> workLocationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr,false);
				// log.info(workLocationsList.size());
				modelAndViewObj.addObject("workLocationsList", workLocationsList);
				modelAndViewObj.addObject("categories", categoryList);
				modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/BrandMaster/newBrandMaster");
				//////System.out.println(modelAndViewObj);
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
*/
	
		
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to create New Brand
	 *
	 **/
	

@RequestMapping(value="/createBrandMaster",method=RequestMethod.POST,consumes="application/json")
public ModelAndView createBrandMaster(@RequestBody BrandMaster brandMasterObj,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("createBrandMaster");
		List<SupplierBean> supplierList;
		modelAndViewObj = new ModelAndView();
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,Constants.PAGINATION_START_INDEX);
		if(categoryList != null && categoryList.size() >0){
			List<ProductSubCategoryBean> subCategoryList = outletMasterServiceObj.getSubCategoryDetails(categoryList.get(0).getCategoryName(), customerIdStr, emailIdStr, "-1","",true);
			modelAndViewObj.addObject("subCategoryList", subCategoryList);
		}
		List<String> workLocationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr,false);
		String supplierIdStr = brandMasterObj.getSupplier();
		if(supplierIdStr != null | supplierIdStr != "");
		{
		 supplierList=outletMasterServiceObj.searchSuppliers(customerIdStr, emailIdStr, supplierIdStr, "0","");
		}
		String resultStr = genericMasterServiceObj.createNewBrand(brandMasterObj, customerIdStr, emailIdStr);
		if(!resultStr.equals(AppProperties.getAppMessageByProperty("BRAND_CREATE_SUCCESS").trim())){
			modelAndViewObj.addObject("brandDetails", brandMasterObj);
			if(brandMasterObj.getBrandprice() != null && brandMasterObj.getBrandprice().size()>0){
			modelAndViewObj.addObject("brandPrice",brandMasterObj.getBrandprice().get(0));
			}
			modelAndViewObj.addObject("supplierName",supplierList.get(0).getFirmName());
			modelAndViewObj.addObject("err", resultStr);
			modelAndViewObj.addObject("type", "new");
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/BrandMaster/editBrand");
		}else{
			modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/BrandMaster/newBrandMaster");
		}
		modelAndViewObj.addObject("workLocationsList", workLocationsList);
		modelAndViewObj.addObject("categories", categoryList);
	}catch(Exception exception){
		exception.printStackTrace();
	}
	modelAndViewObj.addObject("maxRecords",brandMasterObj.getMaxRecords());
	modelAndViewObj.addObject("searchName", brandMasterObj.getSearchCriteria());
	return modelAndViewObj;
}


/*
*//**
 * 
 * @author Viswanath
 * 
 *This method is used to display new Asset
 *
 **//*

	@RequestMapping(value="/newAssetMaster")
	public ModelAndView newAssetMaster(HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("newAssetMaster");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/AssetMaster/newAssetMaster");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	*//**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to get the  asset details to display
	 *
	 **//*
	
	
	@RequestMapping("/viewAssetMaster")
	public ModelAndView viewAssetMaster(@RequestParam("index")String index,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewAsset ");
			int start = 1,end = 10;
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<AssetMaster> assetList = genericMasterServiceObj.getAssetDetails("",customerIdStr, emailIdStr,index,false);
			modelAndViewObj = new ModelAndView();
			if(assetList == null || assetList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(assetList.size()<10){
					end = (assetList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(assetList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("assetMaster", assetList);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/AssetMaster/assetMaster");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	
	
	

	*//**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to create New Asset
	 *
	 **//*
	
	@RequestMapping(value="/createAssetMaster",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createAssetMaster(@RequestBody AssetMaster assetMasterObj,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("createAssetMaster");
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr=genericMasterServiceObj.createNewAsset(assetMasterObj, customerIdStr, emailIdStr);
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("ASSET_CREATE_SUCCESS").trim())){
				modelAndViewObj.addObject("err", resultStr);
				modelAndViewObj.addObject("assetMaster", assetMasterObj);
			}else
				modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/AssetMaster/newAssetMaster");
			//////System.out.println(modelAndViewObj);
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	*//**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to update the Existing Asset
	 *
	 **//*
	@RequestMapping(value="/updateAssetMaster",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView updateAssetMaster(@RequestBody AssetMaster assetMasterObj,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("updateAssetMaster");
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr=genericMasterServiceObj.updateAsset(assetMasterObj, customerIdStr, emailIdStr);
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("ASSET_UPDATE_SUCCESS").trim()))
				modelAndViewObj.addObject("err", resultStr);
			else
				modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.addObject("assetMaster", assetMasterObj);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/AssetMaster/editAsset");
			//////System.out.println(modelAndViewObj);
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}

	*//**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to display the Edit Asset form consisting of the details of the Asset
	 *
	 **//*
	@RequestMapping("/editAsset")
	public ModelAndView editAsset(@RequestParam("AssetName") String assetNameStr,@RequestParam("operation") String operationStr,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("editAsset");
			
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			List<AssetMaster> assetMasterList = genericMasterServiceObj.getAssetDetails(assetNameStr,customerIdStr, emailIdStr,"0",false);
			modelAndViewObj.addObject("assetMaster", assetMasterList.get(0));
			if(operationStr.equals("view"))
				modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/AssetMaster/viewAsset");
			else
				modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/AssetMaster/editAsset");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		
		return modelAndViewObj;
		
	}
	
	*//**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to search the Asset 
	 *11/12/2015
	 **//*
	
	@RequestMapping("/searchAssetMaster")
	public ModelAndView searchAssetMaster(@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		try{
			// log.info("searchAssetMaster");
			int start = 1,end = 10;
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<AssetMaster> assetMasterObj = genericMasterServiceObj.getAssetDetails(searchNameStr,customerIdStr, emailIdStr,index,true);
			modelAndViewObj = new ModelAndView();
			if(assetMasterObj == null || assetMasterObj.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(assetMasterObj.size()<10){
					end = (assetMasterObj.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(assetMasterObj.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("assetMaster", assetMasterObj);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/AssetMaster/assetMaster");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}

	*//**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to delete the Asset
	 *
	 **//*
	
	@RequestMapping("/deleteAsset")
	public ModelAndView deleteAsset(@RequestParam("ids") String idsStr,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("deleteAsset ");
			int start = 1,end = 10;
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = genericMasterServiceObj.deleteAsset(customerIdStr,emailIdStr,idsStr);
			List<AssetMaster> assetMasterList = genericMasterServiceObj.getAssetDetails("",customerIdStr, emailIdStr,"0",false);
			modelAndViewObj = new ModelAndView();
			if(assetMasterList == null || assetMasterList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(assetMasterList.size()<10){
					end = (assetMasterList.size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(assetMasterList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("assetMaster", assetMasterList);
			modelAndViewObj.addObject("err", resultStr);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/AssetMaster/assetMaster");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}*/






/**
 * 
 * @author Viswanath
 * 
 *This method is used to display new Asset
 *
 **/

	@RequestMapping(value="/newAssetMaster")
	public ModelAndView newAssetMaster(@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("newAssetMaster");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("maxRecords",maxRecords);
			//modelAndViewObj.addObject("searchName", searchName);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/AssetMaster/newAssetMaster");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to get the  asset details to display
	 *
	 **/
	
	
	@RequestMapping("/viewAssetMaster")
	public ModelAndView viewAssetMaster(@RequestParam("index")String index,@RequestParam("maxRecords")String maxRecords,@RequestParam("searchName")String searchName, HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewAsset ");
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<AssetMaster> assetList = genericMasterServiceObj.getAssetDetails(searchName,customerIdStr, emailIdStr,index, maxRecords,false);
			modelAndViewObj = new ModelAndView();
			if(assetList == null || assetList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(assetList.size()<10){
					end = (assetList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(assetList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("assetMaster", assetList);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/AssetMaster/assetMaster");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}

	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to create New Asset
	 *
	 **/
	
	@RequestMapping(value="/createAssetMaster",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createAssetMaster(@RequestBody AssetMaster assetMasterObj,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("createAssetMaster");
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr=genericMasterServiceObj.createNewAsset(assetMasterObj, customerIdStr, emailIdStr);
			////////System.out.println(resultStr);
			
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("ASSET_CREATE_SUCCESS").trim())){
				modelAndViewObj.addObject("err", resultStr);
				modelAndViewObj.addObject("assetMaster", assetMasterObj);
			}
			else
			modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.addObject("maxRecords",assetMasterObj.getMaxRecords());
			modelAndViewObj.addObject("searchName",assetMasterObj.getSearchCriteria());
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/AssetMaster/newAssetMaster");
			////////System.out.println(modelAndViewObj);
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to update the Existing Asset
	 *
	 **/
	@RequestMapping(value="/updateAssetMaster",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView updateAssetMaster(@RequestBody AssetMaster assetMasterObj,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("updateAssetMaster");
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr=genericMasterServiceObj.updateAsset(assetMasterObj, customerIdStr, emailIdStr);
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("ASSET_UPDATE_SUCCESS").trim()))
				modelAndViewObj.addObject("err", resultStr);
			else
				modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.addObject("assetMaster", assetMasterObj);
			modelAndViewObj.addObject("maxRecords",assetMasterObj.getMaxRecords());
			modelAndViewObj.addObject("searchName",assetMasterObj.getSearchCriteria());
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/AssetMaster/editAsset");
		//	//////System.out.println(modelAndViewObj);
		}catch(Exception exception){
			exception.printStackTrace();
		}
		modelAndViewObj.addObject("maxRecords",assetMasterObj.getMaxRecords());
		modelAndViewObj.addObject("searchName",assetMasterObj.getSearchCriteria());
		return modelAndViewObj;
	}

	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to display the Edit Asset form consisting of the details of the Asset
	 *
	 **/
	@RequestMapping("/editAsset")
	public ModelAndView editAsset(@RequestParam("AssetName") String assetNameStr,@RequestParam("operation") String operationStr,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
		try{
			//// log.info("editAsset");
			
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			List<AssetMaster> assetMasterList = genericMasterServiceObj.getAssetDetails(assetNameStr,customerIdStr, emailIdStr,"0",maxRecords,false);
			modelAndViewObj.addObject("assetMaster", assetMasterList.get(0));
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);
			if(operationStr.equals("view"))
				modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/AssetMaster/viewAsset");
			else
				modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/AssetMaster/editAsset");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		
		return modelAndViewObj;
		
	}
	
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to search the Asset 
	 *11/12/2015
	 **/
	
	@RequestMapping("/searchAssetMaster")
	public ModelAndView searchAssetMaster(@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index, @RequestParam("maxRecords") String maxRecords,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		try{
			//// log.info("searchAssetMaster");
			int start = 1,end = Integer.parseInt(maxRecords);
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<AssetMaster> assetMasterObj = genericMasterServiceObj.getAssetDetails(searchNameStr,customerIdStr, emailIdStr,index,maxRecords,true);
			modelAndViewObj = new ModelAndView();
			if(assetMasterObj == null || assetMasterObj.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(assetMasterObj.size()<end){
					end = (assetMasterObj.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(assetMasterObj.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("maxRecords", maxRecords);
			modelAndViewObj.addObject("assetMaster", assetMasterObj);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/AssetMaster/assetMaster");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}

	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to delete the Asset
	 *
	 **/
	
	@RequestMapping("/deleteAsset")
	public ModelAndView deleteAsset(@RequestParam("ids") String idsStr,@RequestParam("maxRecords") String maxRecords, @RequestParam("searchName") String searchName, HttpServletRequest request,HttpServletResponse response){
		try{
			//// log.info("deleteAsset ");
			int start = 1,end = 10;
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = genericMasterServiceObj.deleteAsset(customerIdStr,emailIdStr,idsStr);
			List<AssetMaster> assetMasterList = genericMasterServiceObj.getAssetDetails(searchName,customerIdStr, emailIdStr,"0",maxRecords,false);
			modelAndViewObj = new ModelAndView();
			if(assetMasterList == null || assetMasterList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(assetMasterList.size()<10){
					end = (assetMasterList.size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(assetMasterList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("assetMaster", assetMasterList);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);
			
			modelAndViewObj.addObject("err", resultStr);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/AssetMaster/assetMaster");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	

	/**
	 * 
	 * @author RaviTeja.N
	 * 
	 *This method is used to display All Denominations
	 *
	 **/
@RequestMapping("/viewDenominationMaster")
public ModelAndView viewDenominationMaster(@RequestParam("index") String index,HttpServletRequest request,HttpServletResponse response){
	try{
		//// log.info("viewDenomination ");
		int start = 1,end = 10;
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		DenominationMasterResponse denominationMasterResponse = genericMasterServiceObj.getDenominationMaster("",customerIdStr, emailIdStr,index);
		modelAndViewObj = new ModelAndView();
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
		modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/DenominationMaster/denominationMaster");
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}


/**
 * 
 * @author RaviTeja.N
 * 
 *This method is used to display new page for creating Denomination
 *
 **/
@RequestMapping("/newDenominationMaster")
public ModelAndView newDenominationMaster(HttpServletRequest request,HttpServletResponse response){
	try{
		//// log.info("newDenominationMaster");
		
		List<String> currencyCodes = new ArrayList<String>();
		currencyCodes=genericMasterServiceObj.getCurrencyCodes();
		/*List<String> currencyCodes = new ArrayList();
		currencyCodes=genericMasterServiceObj.getCurrencyCodes();*/
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("currencyCodes", currencyCodes);
		modelAndViewObj.addObject("type", "new");
		modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/DenominationMaster/newDenominationMaster");
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
	
}

/**
 * 
 * @author RaviTeja.N
 * 
 *This method is used to create the new Denomination
 *
 **/
@RequestMapping(value="/createDenominationMaster",method=RequestMethod.POST,consumes="application/json" ) 
public ModelAndView createDenominationMaster(@RequestBody DenominationMaster denominationMaster, HttpServletRequest request,HttpServletResponse response){
	try{
		//// log.info("createDenominationMaster");
		
		modelAndViewObj = new ModelAndView();
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		String roleIdStr = (String)request.getSession().getAttribute("role");
		String resultStr=genericMasterServiceObj.createDenominationMaster(customerIdStr,emailIdStr,roleIdStr,denominationMaster);
		//// log.info(resultStr);
		modelAndViewObj.addObject("type", "new");
		if(!resultStr.equals(AppProperties.getAppMessageByProperty("DENOMINATION_CREATE_SUCCESS").trim())){
			modelAndViewObj.addObject("err", resultStr);
			/*modelAndViewObj.addObject("assetMaster", denominationMaster);*/
		}else
			modelAndViewObj.addObject("success", resultStr);
		
		
		modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/DenominationMaster/newDenominationMaster");
		
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
	
}

/**
 * 
 * @author RaviTeja.N
 * 
 *This method is used to delete either single or multiple Denomination(s)
 *
 **/
@RequestMapping("/deleteDenomination")
public ModelAndView deleteDenomination(@RequestParam("ids") String idsStr,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("deleteAsset ");
		int start = 1,end = 10;
		modelAndViewObj = new ModelAndView();
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		String resultStr = genericMasterServiceObj.deleteDenomination(customerIdStr,emailIdStr,idsStr);
		DenominationMasterResponse denominationMasterResponse = genericMasterServiceObj.getDenominationMaster("",customerIdStr, emailIdStr,"0");
		modelAndViewObj = new ModelAndView();
		if(denominationMasterResponse.getDenominationMasters() == null || denominationMasterResponse.getDenominationMasters().size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(denominationMasterResponse.getDenominationMasters().size()<10){
				end = (denominationMasterResponse.getDenominationMasters().size())+(Integer.parseInt("0"));
			}else{
				end = (Integer.parseInt("0")+end);
			}
			modelAndViewObj.addObject("totalRecords", denominationMasterResponse.getTotalRecords());
			modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
			modelAndViewObj.addObject("totalValue", end);
		}
		modelAndViewObj.addObject("denominationMasterList", denominationMasterResponse.getDenominationMasters());
		modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/DenominationMaster/denominationMaster");
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}

/**
 * 
 * @author RaviTeja.N
 * 
 *This method is used to get either edit or view denomination
 *
 **/
@RequestMapping("/viewEditDenomination" ) 
public ModelAndView viewEditDenomination(@RequestParam("denominationValue") Float denominationValue,@RequestParam("denominationType") String denominationType,@RequestParam("index") String index,@RequestParam("type") String type, HttpServletRequest request,HttpServletResponse response){
	try{
		//// log.info("viewEditDenomination");
		modelAndViewObj = new ModelAndView();
		List<String> currencyCodes = new ArrayList<String>();
		currencyCodes=genericMasterServiceObj.getCurrencyCodes();
		modelAndViewObj.addObject("currencyCodes", currencyCodes);
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
//		String roleIdStr = (String)request.getSession().getAttribute("role");
		DenominationMasterResponse denominationMasterResponse=genericMasterServiceObj.viewEditDenomination(emailIdStr, customerIdStr, denominationValue,index,denominationType);
		//// log.info(denominationMasterResponse);
		modelAndViewObj.addObject("type", type);
	
		modelAndViewObj.addObject("denominationMasterResponse", denominationMasterResponse.getDenominationMaster());
		modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/DenominationMaster/newDenominationMaster");
		
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
	
}

/**
 * 
 * @author RaviTeja.N
 * 
 *This method is used to get update  denomination
 *
 **/
@RequestMapping(value="/editDenominationMaster",method=RequestMethod.POST,consumes="application/json" ) 
public ModelAndView editDenominationMaster(@RequestBody DenominationMaster denominationMaster, HttpServletRequest request,HttpServletResponse response){
	try{
		//// log.info("editDenominationMaster");
		modelAndViewObj = new ModelAndView();
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		String roleIdStr = (String)request.getSession().getAttribute("role");
		String resultStr=genericMasterServiceObj.editDenominationMaster(customerIdStr,emailIdStr,roleIdStr, denominationMaster);
		//// log.info(resultStr);
		modelAndViewObj.addObject("type", "edit");
		if(genericMasterServiceObj.viewEditDenomination(emailIdStr, customerIdStr, denominationMaster.getDenominations().getDenominationValue(),"0",denominationMaster.getDenominations().getDenominationType())!=null)
			denominationMaster=genericMasterServiceObj.viewEditDenomination(emailIdStr, customerIdStr, denominationMaster.getDenominationValue(),"0",denominationMaster.getDenominationType()).getDenominationMaster();
		modelAndViewObj.addObject("denominationMasterResponse",denominationMaster);
		if(!resultStr.equals(AppProperties.getAppMessageByProperty("DENOMINATION_EDIT_SUCCESS").trim())){
			modelAndViewObj.addObject("err", resultStr);
			/*modelAndViewObj.addObject("assetMaster", denominationMaster);*/
		}else
			modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/DenominationMaster/newDenominationMaster");
		
	}catch(Exception exception){
		exception.printStackTrace();
	}

	return modelAndViewObj;
	
}

//******** Section Master Starts **********//

/**
		 * 
		 * @author Mythri.S
		 * 
		 *This method is used to display all Tax details in a tabular format
		 *
		 **/
		@RequestMapping("/viewSection")
		public ModelAndView viewSection(@RequestParam("index")String index,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
			try{
				// log.info("viewSection");
				int start = 1,end = Integer.parseInt(maxRecords);
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = request.getSession().getAttribute("emailId").toString();
				List<SectionDetails> sectionDetailsList = masterServiceObj.getSection(searchName, customerIdStr, emailIdStr, index,false,maxRecords);
				modelAndViewObj = new ModelAndView();
				if(sectionDetailsList == null){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(sectionDetailsList.size()< end){
						end = (sectionDetailsList.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", sectionDetailsList.get(0).getTotalRecords());
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
				}
				modelAndViewObj.addObject("sectionDetailsList", sectionDetailsList);
				modelAndViewObj.addObject("maxRecords",maxRecords);
				modelAndViewObj.addObject("searchName",searchName);

				modelAndViewObj.setViewName("Admin/genericData/sectionMaster");
			}
		/*	catch(IOException IOexception){
				//IOexception.printStackTrace();
				
				modelAndViewObj.addObject("err","services not exist");
				modelAndViewObj.setViewName("Admin/genericData/sectionMaster");
			}*/
			catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
		
		
		
		/**
		 * 
		 * @author Mythri.S
		 * 
		 *This method is used display the form to create a new Tax
		 *
		 **/
		@RequestMapping("/newSection")
		public ModelAndView newSection(@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName, HttpServletRequest request,HttpServletResponse response){
			try{
				// log.info("newSection ");
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.setViewName("Admin/genericData/newSection");
			}catch(Exception exception){
				exception.printStackTrace();
			}
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);
		

			return modelAndViewObj;
		}
		
		/**
		 * 
		 * @author Mythri.S
		 * 
		 *This method is used to save the New Tax
		 *
		 **/
		@RequestMapping(value="/createSection",method=RequestMethod.POST,consumes="application/json")
		public ModelAndView createSection(@RequestBody SectionDetails sectionDetailsObj,HttpServletRequest request,HttpServletResponse response){
			try{
				// log.info("createSection ");
				String roleStr = request.getSession().getAttribute("role").toString();
				String customerIdStr = request.getSession().getAttribute("customerId").toString();
				String emailIdStr = request.getSession().getAttribute("emailId").toString();
				String resultStr = masterServiceObj.createSection(sectionDetailsObj,customerIdStr,emailIdStr,roleStr);
				
				if(!resultStr.equals(AppProperties.getAppMessageByProperty("DENOMINATION_CREATE_SUCCESS").trim())){
					
				}
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("err", resultStr);
				modelAndViewObj.addObject("maxRecords",sectionDetailsObj.getMaxRecords());
				modelAndViewObj.addObject("searchName",sectionDetailsObj.getSearchCriteria());
				
				modelAndViewObj.setViewName("Admin/genericData/newSection");
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
		
		/**
		 * 
		 * @author Mythri.S
		 * 
		 *This method is used to display the Edit Tax form consisting of the details of the Tax
		 *
		 **/
		@RequestMapping("/editSection")
		public ModelAndView editSection(@RequestParam("sectionId") String sectionId,@RequestParam("operation") String operation,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
			try{
				// log.info("editSection");
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = request.getSession().getAttribute("emailId").toString();
				List<SectionDetails> sectionDetailsList = masterServiceObj.getSection(sectionId, customerIdStr, emailIdStr, "0",false,"");
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("sectionDetails", sectionDetailsList.get(0));
				if(operation.equals("view"))
					modelAndViewObj.setViewName("Admin/genericData/viewSection");
				else
					modelAndViewObj.setViewName("Admin/genericData/editSection");
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
		 * 
		 *This method is used to save the New Tax
		 *
		 **/
		@RequestMapping(value="/updateSection",method=RequestMethod.POST,consumes="application/json")
		public ModelAndView updateSection(@RequestBody SectionDetails sectionDetailsObj,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
			try{
				// log.info("updateSection ");
				String roleStr = request.getSession().getAttribute("role").toString();
				String customerIdStr = request.getSession().getAttribute("customerId").toString();
				String emailIdStr = request.getSession().getAttribute("emailId").toString();
				String resultStr = masterServiceObj.updateSection(sectionDetailsObj,customerIdStr,emailIdStr,roleStr);
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("err", resultStr);
				modelAndViewObj.addObject("sectionDetails", sectionDetailsObj);
				modelAndViewObj.setViewName("Admin/genericData/editSection");
				modelAndViewObj.addObject("maxRecords",maxRecords);
				modelAndViewObj.addObject("searchName",searchName);
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
		
		/**
		 * 
		 * @author Mythri.S
		 * Created On: 25-jul-2015.
		 * 
		 *  This method is used to delete the skuIds.
		 *  It retrieves the skus and returns to display in a tabular format.
		 *  
		 *
		 **/
		@RequestMapping("/deleteSection")
		public ModelAndView deleteSection(@RequestParam("ids") String ids,@RequestParam("maxRecords") String maxRecords, @RequestParam("searchName") String searchName, HttpServletRequest request,HttpServletResponse response){
			try{
				// log.info("deleteSection ");
				int start = 1,end = Integer.parseInt(maxRecords);
				modelAndViewObj = new ModelAndView();
				String customerIdStr = request.getSession().getAttribute("customerId").toString();
				String emailIdStr = request.getSession().getAttribute("emailId").toString();
				String result = masterServiceObj.deleteSection(customerIdStr,emailIdStr ,ids);
				List<SectionDetails> sectionDetailsList = masterServiceObj.getSection(searchName, customerIdStr, emailIdStr, "0",false,maxRecords);
				modelAndViewObj = new ModelAndView();
				if(sectionDetailsList == null){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(sectionDetailsList.size()<end){
						end = (sectionDetailsList.size());
					}
					modelAndViewObj.addObject("totalRecords", sectionDetailsList.get(0).getTotalRecords());
					modelAndViewObj.addObject("index", start);
					modelAndViewObj.addObject("totalValue", end);
				}
				modelAndViewObj.addObject("err", result);
				modelAndViewObj.addObject("sectionDetailsList", sectionDetailsList);
				modelAndViewObj.setViewName("Admin/genericData/sectionMaster");
			}
			catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}

		
@RequestMapping("/searchSectionMaster")
public ModelAndView searchSectionMaster(@RequestParam("searchName") String searchNameStr,@RequestParam("maxRecords") String maxRecords,@RequestParam("index") String index, HttpServletRequest request,HttpServletResponse response) {
	String customerIdStr = null,emailIdStr=null;
	try{
		// log.info("searchSectionMaster");
		int start = 1,end = Integer.parseInt(maxRecords);
		customerIdStr = request.getSession().getAttribute("customerId").toString();
		emailIdStr = request.getSession().getAttribute("emailId").toString();
		List<SectionDetails> sectionDetailsList = masterServiceObj.getSection(searchNameStr, customerIdStr, emailIdStr, index,true,maxRecords);
		modelAndViewObj = new ModelAndView();
		if(sectionDetailsList == null){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(sectionDetailsList.size()<end){
				end = (sectionDetailsList.size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			modelAndViewObj.addObject("totalRecords", sectionDetailsList.get(0).getTotalRecords());
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
		}
		modelAndViewObj.addObject("sectionDetailsList", sectionDetailsList);
		modelAndViewObj.addObject("searchName", searchNameStr);
		modelAndViewObj.addObject("maxRecords",maxRecords);

		modelAndViewObj.setViewName("Admin/genericData/sectionMaster");
		
	}catch(Exception e){
		e.printStackTrace();
	}
	return modelAndViewObj;
}


@RequestMapping("/viewtenderMaster")
public ModelAndView viewtenderMaster(@RequestParam("maxRecords") int maxRecords,@RequestParam("index") String index,@RequestParam("searchName") String searchName,
HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("viewZoneMaster");
		
		
		int start = 1,end = maxRecords;
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		
		ArrayList<TenderMaster> tenderDetails = genericMasterServiceObj.getTender(searchName,customerId,emailId,index,maxRecords);
		modelAndViewObj = new ModelAndView();
		
		if(tenderDetails == null || tenderDetails.size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(tenderDetails.size()<end){
				end = (tenderDetails.size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			modelAndViewObj.addObject("totalRecords", (tenderDetails.get(0).getTotalRecords()));
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
			
		}
		modelAndViewObj.addObject("tenderDetails",tenderDetails);
		modelAndViewObj.addObject("maxRecords",maxRecords);
		modelAndViewObj.addObject("searchName",searchName);
		modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/TenderMaster/TenderMaster");
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}






@RequestMapping("/newTenderMaster")
public ModelAndView newTenderMaster(HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("newZone");
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/TenderMaster/newTenderMaster");
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}




@RequestMapping( value="/createTender",method=RequestMethod.POST,consumes="application/json")
public ModelAndView createTender(@RequestBody TenderMaster tenderMaster,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("Create Tender");
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		
		

		modelAndViewObj = new ModelAndView();
		
		
	
		String resultStr = genericMasterServiceObj.createTender(tenderMaster,customerIdStr,emailIdStr);
		ArrayList<TenderMaster> tenderDetails = genericMasterServiceObj.editViewTender(tenderMaster.getTenderCode(),customerIdStr,emailIdStr);


		if(!resultStr.equals(AppProperties.getAppMessageByProperty("TENDER_MASTER_CREATE_SUCCESSFULLY").trim()) && !resultStr.equals(AppProperties.getAppMessageByProperty("TENDER_MASTER_UPDATE_SUCCESSFULLY").trim())){
			
			modelAndViewObj.addObject("err",resultStr);

		}
		else{
		modelAndViewObj.addObject("success",resultStr);
		}
			
		if(tenderDetails!=null && tenderDetails.size()>0)
		{
			modelAndViewObj.addObject("tenderDetails", tenderDetails.get(0));
		}else{
			modelAndViewObj.addObject("tenderDetails", tenderDetails);
		}
		
		if(tenderMaster.getOperation().equals("create")){

		modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/TenderMaster/newTenderMaster");
		}else{
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/TenderMaster/editTender");

		}
		
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}




@RequestMapping("/deleteTenderMaster")
public ModelAndView deleteTenderMaster(@RequestParam("ids") String ids,@RequestParam("searchName") String searchName,@RequestParam("maxRecords") int maxRecords,HttpServletRequest request,HttpServletResponse response){
	try{
		int start = 1,end = maxRecords;
		modelAndViewObj = new ModelAndView();
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		String resultStr = genericMasterServiceObj.deleteTenderMaster(customerId,emailId,ids);
		
		
		ArrayList<TenderMaster> tenderDetails = genericMasterServiceObj.getTender(searchName,customerId,emailId,"0",maxRecords);
		modelAndViewObj = new ModelAndView();
		
		if(tenderDetails == null || tenderDetails.size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(tenderDetails.size()<end){
				end = (tenderDetails.size())+((0));
			}else{
				end = ((0)+end);
			}
			modelAndViewObj.addObject("totalRecords", (tenderDetails.get(0).getTotalRecords()));
			modelAndViewObj.addObject("index", ((0)+start));
			modelAndViewObj.addObject("totalValue", end);
			
		}
		
		if(!resultStr.equals(AppProperties.getAppMessageByProperty("TENDER_MASTER_DELETE_SUCCESSFULLY").trim())){
			modelAndViewObj.addObject("errh", resultStr);
		}else
			modelAndViewObj.addObject("successh", resultStr);
		
		
		modelAndViewObj.addObject("tenderDetails",tenderDetails);
		modelAndViewObj.addObject("maxRecords",maxRecords);
		modelAndViewObj.addObject("searchName",searchName);
		modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/TenderMaster/TenderMaster");
		
		
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}



@RequestMapping("/editViewTender")
public ModelAndView editViewTender(@RequestParam("tendercode") String tendercode,@RequestParam("operation") String operation,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("edit ViewTender");
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		
		ArrayList<TenderMaster> tenderDetails = genericMasterServiceObj.editViewTender(tendercode,customerIdStr,emailIdStr);

		modelAndViewObj = new ModelAndView();
		
		modelAndViewObj.addObject("tenderDetails", tenderDetails.get(0));
		
		if(operation.equals("view"))
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/TenderMaster/viewTender");
		else
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/TenderMaster/editTender");
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}



@RequestMapping("/deletehomepagegroup")
public ModelAndView deletehomepagegroup(@RequestParam("ids") String ids,@RequestParam("maxRecords") String maxRecords,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("deleteEmployee ");
		////////System.out.println("ds");
		int start = 1,end = Integer.parseInt(maxRecords);
		modelAndViewObj = new ModelAndView();
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		String resultStr = genericMasterServiceObj.deleteHomepageGroup(customerId,emailId,ids);
		
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		List<HomePageGroup> dealsList = outletMasterServiceObj.getHomepagegroupInfo("",customerIdStr, emailIdStr,"0",maxRecords,"");
	
		
		modelAndViewObj = new ModelAndView();
		if(dealsList == null || dealsList.size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(dealsList.size()<10){
				end = (dealsList.size())+(Integer.parseInt("0"));
			}else{
				end = (Integer.parseInt("0")+end);
			}
			modelAndViewObj.addObject("totalRecords", (dealsList.get(0).getTotalRecords()));
			modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
			modelAndViewObj.addObject("totalValue", end);
		}
		modelAndViewObj.addObject("dealsList", dealsList);
		modelAndViewObj.addObject("maxRecords", "10");
		modelAndViewObj.setViewName("B2C/homePageGroups/viewHomePageGroups");
		
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}	


@RequestMapping("/viewHsnMaster")
public ModelAndView viewHsnMaster(@RequestParam("index") String index,@RequestParam("location") String location,@RequestParam("maxRecords") String maxRecords,HttpServletRequest request,HttpServletResponse response){
	try{
		int start = 1,end = Integer.parseInt(maxRecords);
		modelAndViewObj = new ModelAndView();
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		
		List<HSNMaster> hsnList = outletMasterServiceObj.getHSNmaster("",customerId, emailId,"0",maxRecords,"");
	
		
		modelAndViewObj = new ModelAndView();
		if(hsnList == null || hsnList.size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(hsnList.size()<10){
				end = (hsnList.size())+(Integer.parseInt("0"));
			}else{
				end = (Integer.parseInt("0")+end);
			}
			modelAndViewObj.addObject("totalRecords", (hsnList.get(0).getTotalRecords()));
			modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
			modelAndViewObj.addObject("totalValue", end);
		}
		
		ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails("",customerId, emailId,"-1",false,"");
		modelAndViewObj.addObject("taxDetails",taxDetails);
		
		modelAndViewObj.addObject("hsnList", hsnList);
		modelAndViewObj.addObject("maxRecords",maxRecords);
		
		
		

		modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/hsnMaster/HsnMaster");
		
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}	



@RequestMapping( value="/createHsnMaster",method=RequestMethod.POST,consumes="application/json")
public ModelAndView createHsnMaster(@RequestBody HSNMaster hsnMaster,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("Create Tender");
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		
		

		modelAndViewObj = new ModelAndView();
		
		ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails("",customerIdStr, emailIdStr,"-1",false,"");
		modelAndViewObj.addObject("taxDetails",taxDetails);
	
		String resultStr = genericMasterServiceObj.createHsnMaster(hsnMaster,customerIdStr,emailIdStr);
		
		
		int start = 1,end = Integer.parseInt("10");
		
		
		List<HSNMaster> hsnList = outletMasterServiceObj.getHSNmaster("",customerIdStr, emailIdStr,"0","10","");
	
		/*
		  /// added by ashutosh
		if(!resultStr.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			modelAndViewObj.addObject("err", resultStr);
			
		}else
			modelAndViewObj.addObject("success", resultStr);*/
		
		if(!resultStr.contains("Success")){
			modelAndViewObj.addObject("err", resultStr);
		}else
			modelAndViewObj.addObject("success", resultStr);
		
		
		if(hsnList == null || hsnList.size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(hsnList.size()<10){
				end = (hsnList.size())+(Integer.parseInt("0"));
			}else{
				end = (Integer.parseInt("0")+end);
			}
			modelAndViewObj.addObject("totalRecords", (hsnList.get(0).getTotalRecords()));
			modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
			modelAndViewObj.addObject("totalValue", end);
		}
		modelAndViewObj.addObject("hsnList", hsnList);
		modelAndViewObj.addObject("maxRecords", "10");
		
		
		

		modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/hsnMaster/HsnMaster");
				
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}


@RequestMapping("/deleteHSN")
public ModelAndView deleteHSN(@RequestParam("ids") String ids,@RequestParam("maxRecords") String maxRecords,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("deleteEmployee ");
		////////System.out.println("ds");
		int start = 1,end = Integer.parseInt(maxRecords);
		modelAndViewObj = new ModelAndView();
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		String resultStr = genericMasterServiceObj.deleteHSN(customerId,emailId,ids);
		
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		List<HSNMaster> hsnList = outletMasterServiceObj.getHSNmaster("",customerIdStr, emailIdStr,"0",maxRecords,"");
	
		ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails("",customerIdStr, emailIdStr,"-1",false,"");
		modelAndViewObj.addObject("taxDetails",taxDetails);
		
		if(hsnList == null || hsnList.size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(hsnList.size()<10){
				end = (hsnList.size())+(Integer.parseInt("0"));
			}else{
				end = (Integer.parseInt("0")+end);
			}
			modelAndViewObj.addObject("totalRecords", (hsnList.get(0).getTotalRecords()));
			modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
			modelAndViewObj.addObject("totalValue", end);
		}
		modelAndViewObj.addObject("hsnList", hsnList);
		modelAndViewObj.addObject("maxRecords", "10");
		
		
		

		modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/hsnMaster/HsnMaster");
		
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}	

@RequestMapping("/deleteStoreTaxation")
public ModelAndView deleteStoreTaxation(@RequestParam("ids") String ids,@RequestParam("maxRecords") String maxRecords,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("deleteEmployee ");
		////////System.out.println("ds");
		int start = 1,end = Integer.parseInt(maxRecords);
		String index= "0";
		ArrayList<LocationBean> locationBeansList = null;
		List<String> locationsListValue =new ArrayList<String>();
		String locationListAll = "";
		String location="";
		
		
		
		
		modelAndViewObj = new ModelAndView();
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		
		
		locationBeansList = genericMasterServiceObj.getLocationDetails("",customerId, emailId,"-1","Retail Outlet",false,true,false);	

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
		String resultStr = genericMasterServiceObj.deleteStoreTaxation(customerId,emailId,ids);
		
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		List<StoreTaxation> storeTaxationList = adminServiceObj.getStoreTaxation("", customerIdStr, emailIdStr, index,"",null,false,maxRecords,"");
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
		modelAndViewObj.addObject("selectedLocation", "");
		modelAndViewObj.addObject("searchName", "");
		modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
		modelAndViewObj.addObject("storeTaxationList", storeTaxationList);
		modelAndViewObj.addObject("workLocationsList", locationBeansList);
		if(resultStr == "Store Taxation deleted successfully" || resultStr.equals("Store Taxation deleted successfully"))
			modelAndViewObj.addObject("success", resultStr);	
		else
		modelAndViewObj.addObject("err", resultStr);
		modelAndViewObj.setViewName("Outlet Master/storeTaxationMaster");
		
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}	



@RequestMapping("/deleteWarehouseTaxation")
public ModelAndView deleteWarehouseTaxation(@RequestParam("ids") String ids,@RequestParam("maxRecords") String maxRecords,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("deleteEmployee ");
		////////System.out.println("ds");
		int start = 1,end = Integer.parseInt(maxRecords);
		String index= "0";
		ArrayList<LocationBean> locationBeansList = null;
		List<String> locationsListValue =new ArrayList<String>();
		String locationListAll = "";
		String location="";
		
		
		
		
		modelAndViewObj = new ModelAndView();
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		
		
		locationBeansList = genericMasterServiceObj.getLocationDetails("",customerId, emailId,"-1","Retail Outlet",false,true,false);	

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
		String resultStr = genericMasterServiceObj.deleteWarehouseTaxation(customerId,emailId,ids);
		
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		//List<StoreTaxation> storeTaxationList = adminServiceObj.getStoreTaxation("", customerIdStr, emailIdStr, index,"",null,false,maxRecords,"");
		List<WarehouseTaxation> storeTaxationList = adminServiceObj.getWarehouseTaxation("", customerIdStr, emailIdStr, index,location,null,false,maxRecords,locationListAll);
		
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
		modelAndViewObj.addObject("selectedLocation", "");
		modelAndViewObj.addObject("searchName", "");
		modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
		modelAndViewObj.addObject("storeTaxationList", storeTaxationList);
		modelAndViewObj.addObject("workLocationsList", locationBeansList);
		if(resultStr == "Warehouse Taxation deleted successfully" || resultStr.equals("Warehouse Taxation deleted successfully"))
			modelAndViewObj.addObject("success", resultStr);	
		else
		modelAndViewObj.addObject("err", resultStr);
		modelAndViewObj.setViewName("Inventory Manager/warehouse/taxation/WHTaxationMaster");
		
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}	




@RequestMapping("/LoadHRMS")
public ModelAndView LoadHRMS(
		@RequestParam("index") String index,
		@RequestParam("location") String location, 
		@RequestParam("maxRecords") String maxRecords,
		HttpServletRequest request,HttpServletResponse response){
	try{
		int start = 1,end = Integer.parseInt(maxRecords);
		List<String> locationsListValue=new ArrayList<String>();
		String locationListAll="";
		// log.info("viewEmployee ");
		List<EmployeeBean> employeeList = new ArrayList<EmployeeBean>();
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		modelAndViewObj = new ModelAndView();
//		List<String> workLocationsList = adminServiceObj.getLocationsList(customerId,emailId,null);

		ArrayList<LocationBean> workLocationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
//		genericMasterServiceObj.getLocationDetails("","1", emailId,"-1",maxRecords,"",false,true,true);
		//added by vinay
		
		/*if((location.trim()).equals(null) || location.trim().isEmpty())
		{
			location = workLocationsList.get(0).getLocationId();
		}*/
		if(location.equals("all")|| location.equals("")){
			if(workLocationsList != null){
				for(int i=0;i<workLocationsList.size();i++){
				
					locationsListValue.add(workLocationsList.get(i).getLocationId());
						
				}
			for (String string : locationsListValue) {
				
				locationListAll = locationListAll+string+",";
			}
			}
			
		}
		
	
		
		
		////////System.out.println(location);
		List<String> specialisationList = adminServiceObj.getSpecialisationList(customerId, emailId);
		String resultStr = genericMasterServiceObj.getEmployeesByHRMS("",customerId, emailId,location);

		employeeList = genericMasterServiceObj.getEmployees("",customerId, emailId,index,location,maxRecords,false,locationListAll);
		////////System.out.println("searchName "+ searchName);
		if(employeeList == null){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(employeeList.size()<end){
				end = (employeeList.size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			modelAndViewObj.addObject("totalRecords", Integer.parseInt(employeeList.get(0).getMaxRecords()));
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
		}
		modelAndViewObj.addObject("workLocationsList", workLocationsList);
		//added by vinay
		modelAndViewObj.addObject("specialisationlist",specialisationList );
	    modelAndViewObj.addObject("employeeList", employeeList);
	    //added by manasa
	    modelAndViewObj.addObject("location", location);
	    modelAndViewObj.addObject("selectedLocation", location);
	    modelAndViewObj.addObject("maxRecords", maxRecords);
	    if(resultStr.equalsIgnoreCase("No Records Found ")){
	    	modelAndViewObj.addObject("err", resultStr);
	    }else{
	    	modelAndViewObj.addObject("Success", resultStr);
	    }
	    
		modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/EmployeeMaster/employeeMaster");
		
	}catch(Exception exception){
		exception.printStackTrace();
		////////System.out.println(exception.getMessage());
		 modelAndViewObj.addObject("err", exception.getMessage());
		modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/EmployeeMaster/employeeMaster");
	}
	return modelAndViewObj;
}




@RequestMapping(value = "/viewFleetMasterSummary")
public ModelAndView viewFleetMasterSummary(@RequestParam("index") String index,
		@RequestParam("location") String location, 
		@RequestParam("maxRecords") String maxRecords,
		@RequestParam("startDate") String startDate, 
		@RequestParam("endDate") String endDate,
		@RequestParam("status") boolean status, 
		@RequestParam("searchCriteria") String searchCriteria,
		HttpServletRequest request,HttpServletResponse response) {

	try{
		int start = 1,end = Integer.parseInt(maxRecords);
		List<FleetMaster> fleetList = new ArrayList<FleetMaster>();
		com.tlabs.posweb.beans.Response responseList = null;
		List<String> locationsList = new ArrayList<String>();
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		
		locationsList = adminServiceObj.getWarehouseLocationsList(customerId, emailId,true);
		if(location.equals("all")|| location.equals("")){
			
			location="";
		}
		responseList = genericMasterServiceObj.getFleetMasterDetails(customerId,emailId,index,location,maxRecords,startDate,endDate,status,searchCriteria,"");
	
		modelAndViewObj = new ModelAndView();
		
	
		if (responseList.getResponseHeader().getResponseCode().equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())) {
			
			if(responseList.getFleetMasterDetails() != null || !responseList.getFleetMasterDetails().isEmpty()){
		
				fleetList = responseList.getFleetMasterDetails();
			}
			
		}else{

			modelAndViewObj.addObject("err", responseList.getResponseHeader().getResponseMessage());
		}
		
		if(fleetList == null || fleetList.size() < 0 ){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(fleetList.size()<end){
				end = (fleetList.size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
		modelAndViewObj.addObject("totalRecords", responseList.getTotalRecords());
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
		}
	
	
		if(fleetList != null){
			for(int i=0;i<fleetList.size();i++){
				fleetList.get(i).setNoofrec(fleetList.get(i).getFleetDetails().size());				
			}
		}
		
		locationsList = adminServiceObj.getWarehouseLocationsList(customerId, emailId,true);
		States states = genericMasterServiceObj.getStates();
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("states", states);
		
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("fleetList", fleetList);

	    modelAndViewObj.addObject("selectedLocation", location);
	    modelAndViewObj.addObject("maxRecords", maxRecords);
	    modelAndViewObj.addObject("startDate", startDate);
	    modelAndViewObj.addObject("endDate", endDate);
	    modelAndViewObj.addObject("status", status);
	    modelAndViewObj.addObject("searchName", searchCriteria);
		modelAndViewObj.setViewName("Inventory Manager/fleetMaster/viewFleetMasterSummary");
	}catch(Exception e){
		e.printStackTrace();
	}
	return modelAndViewObj; 
}


@RequestMapping("/editFleetMasterDetails")
public ModelAndView editFleetMasterDetails(HttpServletRequest request,HttpServletResponse response,@RequestParam("fleetId") String fleetId,@RequestParam("operation") String operation){
	modelAndViewObj = new ModelAndView();
	try {
	List<String> locationsList = new ArrayList<String>();
	com.tlabs.posweb.beans.Response responseList = null;
	String customerIdStr = (String)request.getSession().getAttribute("customerId");
	String emailIdStr = (String)request.getSession().getAttribute("emailId");
	
	responseList=genericMasterServiceObj.getFleetMasterDetails(customerIdStr,emailIdStr,"0","","10","","",false,"",fleetId);
	
	locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
	States states = genericMasterServiceObj.getStates();
	modelAndViewObj.addObject("locationsList", locationsList);
	modelAndViewObj.addObject("states", states);
	
	if(responseList.getFleetMasterDetails() != null){
		modelAndViewObj.addObject("fleetList",responseList.getFleetMasterDetails().get(0));
	}
	if(operation.equals("view"))
		modelAndViewObj.setViewName("Inventory Manager/fleetMaster/viewFleetMaster");
	else
		modelAndViewObj.setViewName("Inventory Manager/fleetMaster/editFleetMaster");
		
	
} catch (Exception e){
	e.printStackTrace();
}

return modelAndViewObj;
}


@RequestMapping(value="/updateFleetMaster",method=RequestMethod.POST)
public ModelAndView updateFleetMaster(@RequestParam("beanval") String  formData,HttpServletRequest request,HttpServletResponse response){
	try{
		List<String> locationsList = new ArrayList<String>();
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		FleetMaster fleetDetailsObj = new Gson().fromJson(formData, FleetMaster.class);
		
		String resultStr = genericMasterServiceObj.updateFleetMaster(fleetDetailsObj,customerIdStr,emailIdStr);
		
		modelAndViewObj = new ModelAndView();
		
		locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
		States states = genericMasterServiceObj.getStates();
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("states", states);
		
		if(!resultStr.equals(AppProperties.getAppMessageByProperty("FLEET_MASTER_UPDATE_SUCCESSFULLY").trim())){
			modelAndViewObj.addObject("err", resultStr);
			modelAndViewObj.setViewName("Inventory Manager/fleetMaster/editFleetMaster");
		}else{
			modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.setViewName("Inventory Manager/fleetMaster/editFleetMaster");
		}
		
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
	}




@RequestMapping("/viewStateMaster")
public ModelAndView viewStateMaster(@RequestParam("index") String index,@RequestParam("location") String location,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchCritaria") String searchCritaria,HttpServletRequest request,HttpServletResponse response){
	try{
		int start = 1,end = Integer.parseInt(maxRecords);
		modelAndViewObj = new ModelAndView();
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");

		List<States> stateList = outletMasterServiceObj.getStateMaster("",customerId, emailId,"0",maxRecords,searchCritaria,"");
		
		modelAndViewObj = new ModelAndView();
		if(stateList == null || stateList.size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(stateList.size()<10){
				end = (stateList.size())+(Integer.parseInt("0"));
			}else{
				end = (Integer.parseInt("0")+end);
			}
			modelAndViewObj.addObject("totalRecords", (stateList.get(0).getTotalRecords()));
			modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
			modelAndViewObj.addObject("totalValue", end);
		}
		modelAndViewObj.addObject("stateList", stateList);
		modelAndViewObj.addObject("maxRecords",maxRecords);
		modelAndViewObj.addObject("searchCritaria",searchCritaria);
		modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/State/StateMaster");
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}	

@RequestMapping( value="/createStateMaster",method=RequestMethod.POST,consumes="application/json")
public ModelAndView createStateMaster(@RequestBody States States,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("Create Tender");
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
	
		modelAndViewObj = new ModelAndView();
		
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		String maxRecords = (String)request.getSession().getAttribute("maxRecords");
		
		String resultStr = genericMasterServiceObj.createStateMaster(States,customerIdStr,emailIdStr);
		
		int start = 1,end = Integer.parseInt("10");
		 List<States> stateList = outletMasterServiceObj.getStateMaster("",customerId, emailId,"0",maxRecords,"","");
			
		  /// added by Pratiksha
		if(!resultStr.contains("Success")){
			modelAndViewObj.addObject("err", resultStr);
		}else
			modelAndViewObj.addObject("success", resultStr);
		if(stateList == null || stateList.size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(stateList.size()<10){
				end = (stateList.size())+(Integer.parseInt("0"));
			}else{
				end = (Integer.parseInt("0")+end);
			}
			modelAndViewObj.addObject("totalRecords", (stateList.get(0).getTotalRecords()));
			modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
			modelAndViewObj.addObject("totalValue", end);
		}
		modelAndViewObj.addObject("stateList", stateList);
		modelAndViewObj.addObject("maxRecords", "10");
		modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/State/StateMaster");
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}


@RequestMapping("/deleteStateMaster")
public ModelAndView deleteStateMaster(@RequestParam("ids") String ids,@RequestParam("maxRecords") String maxRecords,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("deleteEmployee ");
		////////System.out.println("ds");
		int start = 1,end = Integer.parseInt(maxRecords);
		modelAndViewObj = new ModelAndView();
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		
		String resultStr = genericMasterServiceObj.deleteStateMaster(customerId,emailId,ids);
		
		List<States> stateList = outletMasterServiceObj.getStateMaster("",customerId, emailId,"0",maxRecords,"","");
	
		if(stateList == null || stateList.size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(stateList.size()<10){
				end = (stateList.size())+(Integer.parseInt("0"));
			}else{
				end = (Integer.parseInt("0")+end);
			}
			modelAndViewObj.addObject("totalRecords", (stateList.get(0).getTotalRecords()));
			modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
			modelAndViewObj.addObject("totalValue", end);
		}
		modelAndViewObj.addObject("stateList", stateList);
		modelAndViewObj.addObject("maxRecords", "10");
		
		
		if(!resultStr.contains("success")){
			modelAndViewObj.addObject("err", resultStr);
		}else
			modelAndViewObj.addObject("success", resultStr);
	
		modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/State/StateMaster");
		
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}	





/*  @RequestMapping("/deleteB2BPartners")
	public ModelAndView deleteB2BPartners(@RequestParam("ids") String ids,@RequestParam("searchName") String searchName, @RequestParam("maxRecords")String maxRecords, HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("deleteBrand ");
			int start = 1,end = Integer.parseInt(maxRecords);
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			
			String resultStr = genericMasterServiceObj.deleteB2BPartners(customerIdStr,emailIdStr,ids);
			if(resultStr.contains("successfully"))
				modelAndViewObj.addObject("success", resultStr);
				else
				modelAndViewObj.addObject("err", resultStr);
			
			///List<LoyaltyCardMaster> list_loyaltyCardMaster = loyaltyCardServiceObj.getLoyaltyCards("",customerIdStr, emailIdStr,"0",maxRecords);
			List<LoyaltyCardMaster> list_loyaltyCardMaster = loyaltyCardServiceObj.getLoyaltyCardsSummary("",customerIdStr, emailIdStr,"0",maxRecords);

			modelAndViewObj = new ModelAndView();
			
			if(list_loyaltyCardMaster == null || list_loyaltyCardMaster.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}
			else
			{
			if(list_loyaltyCardMaster.size()<Integer.parseInt(maxRecords))
			{
				end = (list_loyaltyCardMaster.size())+(Integer.parseInt("0"));
			}
			else
			{
				end = (Integer.parseInt("0")+end);
			}
				modelAndViewObj.addObject("totalRecords", list_loyaltyCardMaster.get(0).getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);

			modelAndViewObj.addObject("loyaltyCardsList", list_loyaltyCardMaster);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
		}
			modelAndViewObj.addObject("list_loyaltyCardMaster", list_loyaltyCardMaster);
			modelAndViewObj.addObject("err", resultStr);
			modelAndViewObj.addObject("maxRecords", maxRecords);
			modelAndViewObj.addObject("searchName",searchName);
			
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/B2BPartners");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}*/




@RequestMapping(value="/createfleetmaster",method=RequestMethod.POST)
public ModelAndView createfleetmaster(@RequestParam("beanval") String  formData,HttpServletRequest request,HttpServletResponse response){
	try{
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		List<String> locationsList = new ArrayList<String>();
		
		FleetMaster fleetmasterservice = new Gson().fromJson(formData, FleetMaster.class);
		
		String resultStr = genericMasterServiceObj.createfleetmaster(customerId,emailId,fleetmasterservice);
		modelAndViewObj = new ModelAndView();
		States states = genericMasterServiceObj.getStates();
		modelAndViewObj.addObject("states", states);
		locationsList = adminServiceObj.getWarehouseLocationsList(customerId, emailId,true);
		modelAndViewObj.addObject("locationsList", locationsList);
	
		if(!resultStr.equals(AppProperties.getAppMessageByProperty("FLEET_MASTER_CREATE_SUCCESSFULLY").trim())){
			modelAndViewObj.addObject("err", resultStr);
			modelAndViewObj.addObject("FleetMaster",fleetmasterservice);
		}else{
			modelAndViewObj.addObject("success", resultStr);
		}
		modelAndViewObj.setViewName("Inventory Manager/fleetMaster/newFleetMaster");
	}catch(Exception exception){
		exception.printStackTrace();
	}

	return modelAndViewObj;
}


@RequestMapping("/viewb2bPartners")
public ModelAndView viewb2bPartners(@RequestParam("index") String index,
		@RequestParam("maxRecords") String maxRecords,
		@RequestParam("searchName") String searchName, 
		HttpServletRequest request,HttpServletResponse response){
	try{
		int start = 1,end = Integer.parseInt(maxRecords);
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		modelAndViewObj = new ModelAndView();
		
		B2BPartner b2bPartnerObj = genericMasterServiceObj.getB2BPartners("",customerId, emailId,index,maxRecords,searchName);
		
		if(b2bPartnerObj != null && b2bPartnerObj.getB2bPartners() != null && b2bPartnerObj.getB2bPartners().size()>0){
			if(b2bPartnerObj.getB2bPartners().size()<end){
				end = (b2bPartnerObj.getB2bPartners().size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			modelAndViewObj.addObject("totalRecords", b2bPartnerObj.getTotalRecords());
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
			modelAndViewObj.addObject("b2bPartnersList", b2bPartnerObj.getB2bPartners());
			
		}else{
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}
		
	    modelAndViewObj.addObject("searchName", searchName);
	    modelAndViewObj.addObject("maxRecords", maxRecords);
		modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/B2BPartner/B2BPartners");
		
	}catch(Exception exception){
		exception.printStackTrace();
		modelAndViewObj.addObject("err", exception.getMessage());
		modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/B2BPartner/B2BPartners");
	}
	
	return modelAndViewObj;
}


@RequestMapping("/newB2BPartner")
public ModelAndView newB2BPartner(HttpServletRequest request,HttpServletResponse response){
	try{
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
        
		States states = genericMasterServiceObj.getStates();
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("states", states);
		///String str= "http://101.53.158.27/NTMCart/home/registrationbyQR.do?partnerId=id1";  
		
		modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/B2BPartner/newB2BPartner");
		
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}


@RequestMapping(value="/createB2BPartner",method=RequestMethod.POST)
public ModelAndView createB2BPartner(@RequestParam("dataform") String formData,HttpServletRequest request,HttpServletResponse response){
	try{
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		B2BPartner b2bPartnersObj = new Gson().fromJson(formData, B2BPartner.class);
		String operation = b2bPartnersObj.getOperation();
		B2BPartner	resultObj =genericMasterServiceObj.createB2BPartner(b2bPartnersObj, customerIdStr, emailIdStr);
		modelAndViewObj = new ModelAndView();
		
		States states = genericMasterServiceObj.getStates();
		modelAndViewObj.addObject("states", states);
		
	   	if(resultObj != null && resultObj.getResponseHeader() != null && resultObj.getResponseHeader().getResponseCode() != null && resultObj.getResponseHeader().getResponseCode().equals("0")){
	   		if(operation.equals("new"))
	   		modelAndViewObj.addObject("success", "B2B Partner Created Successfully");
	   		else
	   		modelAndViewObj.addObject("success", "B2B Partner Updated Successfully");	
		}else{
			modelAndViewObj.addObject("err", resultObj.getResponseHeader().getResponseMessage());
		}
	   	
	   	if(resultObj != null && resultObj.getB2bPdfUrl() != null && resultObj.getB2bPdfUrl().length()>0){
	   		modelAndViewObj.addObject("partnerURL", resultObj.getB2bPdfUrl());
	   	}
	   	if(operation.equals("new")){
	   	modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/B2BPartner/newB2BPartner");
	   	} else {
	   	B2BPartner b2bPartnerObj =genericMasterServiceObj.getB2BPartners(b2bPartnersObj.getPartnerId(),customerIdStr,emailIdStr,"0","10","");
	   	if(b2bPartnerObj != null && b2bPartnerObj.getB2bPartners() != null && b2bPartnerObj.getB2bPartners().size()>0)
	   	modelAndViewObj.addObject("b2bPartnerList", b2bPartnerObj.getB2bPartners().get(0));
	   	
	   	modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/B2BPartner/editB2BPartner");
	   	}
	   	
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
	}



@RequestMapping("/viewEditB2BPartner")
public ModelAndView viewEditB2BPartner(@RequestParam("partnerId") String partnerId,@RequestParam("operation") String operation,HttpServletRequest request,HttpServletResponse response){
	try{
		
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		
		States states = genericMasterServiceObj.getStates();
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("states", states);
		
		B2BPartner b2bPartnerObj =genericMasterServiceObj.getB2BPartners(partnerId,customerId,emailId,"0","10","");
		//System.out.println("b2bPartnerObj ::"+new Gson().toJson(b2bPartnerObj));
		
		if(b2bPartnerObj != null && b2bPartnerObj.getB2bPartners() != null && b2bPartnerObj.getB2bPartners().size()>0)
		modelAndViewObj.addObject("b2bPartnerList", b2bPartnerObj.getB2bPartners().get(0));
		
		if(operation.equals("view"))
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/B2BPartner/viewB2BPartner");
		else
			modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/B2BPartner/editB2BPartner");
	}
	
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}


@RequestMapping("/deleteB2BPartners")
public ModelAndView deleteB2BPartners(@RequestParam("ids") String ids,@RequestParam("maxRecords") String maxRecords, @RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
	try{
		
		int start = 1,end = Integer.parseInt(maxRecords);
		String index="0";
		modelAndViewObj = new ModelAndView();
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		String resultStr = genericMasterServiceObj.deleteB2BPartners(customerId,emailId,ids);
		
		if(!resultStr.contains("Success")){
			modelAndViewObj.addObject("err", resultStr);
		}else{
			modelAndViewObj.addObject("Success", resultStr);
		}
		
		B2BPartner b2bPartnerObj = genericMasterServiceObj.getB2BPartners("",customerId, emailId,index,maxRecords,searchName);
		if(b2bPartnerObj != null && b2bPartnerObj.getB2bPartners() != null && b2bPartnerObj.getB2bPartners().size()>0){
			if(b2bPartnerObj.getB2bPartners().size()<end){
				end = (b2bPartnerObj.getB2bPartners().size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			modelAndViewObj.addObject("totalRecords", b2bPartnerObj.getTotalRecords());
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
			modelAndViewObj.addObject("b2bPartnersList", b2bPartnerObj.getB2bPartners());
			
		}else{
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}
	    modelAndViewObj.addObject("searchName", searchName);
	    modelAndViewObj.addObject("maxRecords", maxRecords);
		modelAndViewObj.setViewName("MasterDataManagement/GenericMasters/B2BPartner/B2BPartners");
		
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}

}
