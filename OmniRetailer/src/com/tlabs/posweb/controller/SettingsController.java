package com.tlabs.posweb.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.tlabs.posweb.beans.GenericAttachment;
import com.tlabs.posweb.beans.GenericCustomer;
import com.tlabs.posweb.beans.GenericRegionalSettings;
import com.tlabs.posweb.beans.GenericResponse;
import com.tlabs.posweb.beans.GenericSettings;
import com.tlabs.posweb.beans.IntegrationSettings;
import com.tlabs.posweb.beans.PrintSettings;
import com.tlabs.posweb.beans.SecuritySettings;
import com.tlabs.posweb.services.AdminService;
import com.tlabs.posweb.services.MasterService;
import com.tlabs.posweb.services.SettingsService;
//import com.tlabs.posweb.util.Utilities;

@Controller
@RequestMapping(value = "/settings")
public class SettingsController {
	
	private ModelAndView modelAndViewObj;
	@Autowired
	private MasterService masterServiceObj;
	@Autowired
	private AdminService adminServiceObj;
	@Autowired
	private SettingsService settingsServiceObj;
	//private static Logger log = Logger.getLogger(SettingsController.class);
	
	
	/**
	 * @author Mythri.S
	 * @param request
	 * @param response
	 * @return returns a jsp which displays all the icons of outlet management flow
	 */
	@RequestMapping("/showCustomerSettingsFlow")
	public ModelAndView showCustomerSettingsFlow(HttpServletRequest request,HttpServletResponse response){
		// log.info("showCustomerSettingsFlow");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("Settings/customerSettingsFlow");
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to create New Customer settings
	 *
	 **/
	
	@RequestMapping(value="/createCustomerSettings",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createCustomerSettings(@RequestBody GenericCustomer customerSettingsObj,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("createCustomerSettings");
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr=settingsServiceObj.createCustomerSettings(customerSettingsObj, customerIdStr, emailIdStr);
			List<GenericCustomer> settingsObj = settingsServiceObj.getCustomerSettings(customerIdStr, emailIdStr);
			String status = "new";
			GenericCustomer genericCustomerObj = null;
			if(settingsObj != null && settingsObj.size() > 0){
				genericCustomerObj = settingsObj.get(0);
				status = "edit";
			}
			else
				genericCustomerObj = new GenericCustomer();
			List<String> locationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr,true);
			modelAndViewObj.addObject("status", status);
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("CUSTOMER_PROFILE_CREATE_SUCCESS").trim())){
				modelAndViewObj.addObject("err", resultStr);
			}else{
				modelAndViewObj.addObject("success", resultStr);
			}
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("customerSettings", genericCustomerObj);
			modelAndViewObj.addObject("CID", customerIdStr);
			modelAndViewObj.setViewName("Settings/newCustomerSettings");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to display the Edit customer settings form consisting of existing settings
	 *
	 **/
	@RequestMapping("/editCustomerSettings")
	public ModelAndView editCustomerSettings(@RequestParam("operation") String operation,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("editCustomerSettings");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			List<GenericCustomer> settingsObj = settingsServiceObj.getCustomerSettings(customerIdStr, emailIdStr);
			List<String> locationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr,true);
			String status = "new";
			GenericCustomer genericCustomerObj = null;
			if(settingsObj != null && settingsObj.size() > 0){
				genericCustomerObj = settingsObj.get(0);
				status = "edit";
			}
			else
				genericCustomerObj = new GenericCustomer();
			if(locationsList == null || locationsList.size() == 0)
				modelAndViewObj.addObject("err", AppProperties.getAppMessageByProperty("DEFAULT_LOCATION_REQUIRED"));
			modelAndViewObj.addObject("status", status);
			modelAndViewObj.addObject("customerSettings", genericCustomerObj);
			modelAndViewObj.addObject("CID", customerIdStr);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.setViewName("Settings/newCustomerSettings");
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
	 * This method is used to update the Existing customer Settings
	 *
	 **/
	@RequestMapping(value="/updateCustomerSettings",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView updateCustomerSettings(@RequestBody GenericCustomer settingsObj,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("updateCustomerSettings");
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr=masterServiceObj.updateCustomerSettings(settingsObj, customerIdStr, emailIdStr);
			modelAndViewObj.addObject("CID", customerIdStr);
			List<GenericCustomer> settingsList=settingsServiceObj.getCustomerSettings(customerIdStr, emailIdStr);
			if(settingsList != null && settingsList.size() > 0)
				modelAndViewObj.addObject("customerSettings", settingsList.get(0));
			String status = "edit";
			modelAndViewObj.addObject("status", status);
			List<String> locationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr,true);
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("CUSTOMER_PROFILE_UPDATE_SUCCESS").trim())){
				modelAndViewObj.addObject("err", resultStr);
			}else{
				modelAndViewObj.addObject("success", resultStr);
			}
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.setViewName("Settings/newCustomerSettings");
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
	 *This method is used to create New mail settings
	 *
	 **/
	
	@RequestMapping(value="/createMailSettings",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createMailSetting(@RequestBody GenericSettings mailSettingsObj,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("createMailSettings");
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr=settingsServiceObj.createMailSettings(mailSettingsObj, customerIdStr, emailIdStr);
			List<GenericResponse> settingsObj = settingsServiceObj.getEmailSettings(customerIdStr, emailIdStr);
			List<GenericSettings> genAttObj = settingsObj.get(0).getMailSettings();
			List<GenericAttachment> attObj= settingsObj.get(0).getMailTemplates();	
			String status = "new";
			if(genAttObj != null && genAttObj.size() > 0){
				modelAndViewObj.addObject("mailSettings", genAttObj.get(0));
			status = "edit";
			}
			if(attObj != null){
			for(int i=0;i<attObj.size();i++)
			{
				modelAndViewObj.addObject(attObj.get(i).getTemplateType(), attObj.get(i).getFileName());
				modelAndViewObj.addObject(attObj.get(i).getTemplateType()+"Url", attObj.get(i).getTemplateUrl());
				if(attObj.get(i).getStatus()!=null && !attObj.get(i).getStatus().isEmpty() && attObj.get(i).getStatus().equalsIgnoreCase("true")){
					modelAndViewObj.addObject(attObj.get(i).getTemplateType()+"Status", true);
				}else{
					modelAndViewObj.addObject(attObj.get(i).getTemplateType()+"Status", false);
				}
			}
			}
			modelAndViewObj.addObject("status", status);
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("MAIL_SETTING_CREATE_SUCCESS").trim())){
				modelAndViewObj.addObject("err", resultStr);
			}else{
				modelAndViewObj.addObject("success", resultStr);
			}
			modelAndViewObj.setViewName("Settings/editEmailSettings");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}




	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to update the Existing mail Settings
	 *
	 **/
	@RequestMapping(value="/updateMailSettings",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView updateMailSettings(@RequestBody GenericSettings settingObj,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("updateMailSettings");
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr=settingsServiceObj.updateMailSettings(settingObj, customerIdStr, emailIdStr);
			List<GenericResponse> settingsObj = settingsServiceObj.getEmailSettings(customerIdStr, emailIdStr);
			List<GenericSettings> genAttObj = settingsObj.get(0).getMailSettings();
			List<GenericAttachment> attObj= settingsObj.get(0).getMailTemplates();	
			String status = "new";
			if(genAttObj != null && genAttObj.size() > 0){
				modelAndViewObj.addObject("mailSettings", genAttObj.get(0));
			status = "edit";
			}
			if(attObj != null){
			for(int i=0;i<attObj.size();i++)
			{
				modelAndViewObj.addObject(attObj.get(i).getTemplateType(), attObj.get(i).getFileName());
				modelAndViewObj.addObject(attObj.get(i).getTemplateType()+"Url", attObj.get(i).getTemplateUrl());
				if(attObj.get(i).getStatus()!=null && !attObj.get(i).getStatus().isEmpty() && attObj.get(i).getStatus().equalsIgnoreCase("true")){
					modelAndViewObj.addObject(attObj.get(i).getTemplateType()+"Status", true);
				}else{
					modelAndViewObj.addObject(attObj.get(i).getTemplateType()+"Status", false);
				}
			}
			}
			modelAndViewObj.addObject("status", status);
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("MAIL_SETTING_UPDATE_SUCCESS").trim())){
				modelAndViewObj.addObject("err", resultStr);
			}else{
				modelAndViewObj.addObject("success", resultStr);
			}
			modelAndViewObj.setViewName("Settings/editEmailSettings");
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
	 *This method is used to display the Edit mail settings form consisting of existing settings
	 *
	 **/
	@RequestMapping("/editMailSettings")
	public ModelAndView editMailSettings(@RequestParam("operation") String operation,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("editMailSettings");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			List<GenericResponse> settingsObj = settingsServiceObj.getEmailSettings(customerIdStr, emailIdStr);
			List<GenericSettings> genAttObj = settingsObj.get(0).getMailSettings();
			List<GenericAttachment> attObj= settingsObj.get(0).getMailTemplates();	
			String status = "new";
			if(genAttObj != null && genAttObj.size() > 0){
				modelAndViewObj.addObject("mailSettings", genAttObj.get(0));
			status = "edit";
			}
			if(attObj != null){
			for(int i=0;i<attObj.size();i++)
			{
				modelAndViewObj.addObject(attObj.get(i).getTemplateType(), attObj.get(i).getFileName());
				modelAndViewObj.addObject(attObj.get(i).getTemplateType()+"Url", attObj.get(i).getTemplateUrl());
				if(attObj.get(i).getStatus()!=null && !attObj.get(i).getStatus().isEmpty() && attObj.get(i).getStatus().equalsIgnoreCase("true")){
					modelAndViewObj.addObject(attObj.get(i).getTemplateType()+"Status", true);
				}else{
					modelAndViewObj.addObject(attObj.get(i).getTemplateType()+"Status", false);
				}
			}
			}
			modelAndViewObj.addObject("status", status);
			/*if(operation.equals("view"))
				modelAndViewObj.setViewName("Settings/viewEmailSettings");
			else*/
				modelAndViewObj.setViewName("Settings/editEmailSettings");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		
		return modelAndViewObj;
		
	}
	
	@RequestMapping(value="/createSMSSettings",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createSMSSettings(@RequestBody GenericSettings smsSettingsObj,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("createSMSSettings");
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr=settingsServiceObj.createSMSSettings(smsSettingsObj, customerIdStr, emailIdStr);
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("SMS_SETTING_CREATE_SUCCESS").trim())){
				modelAndViewObj.addObject("err", resultStr);
			}else
				modelAndViewObj.addObject("success", resultStr);
			
			List<GenericResponse> settingsObj = settingsServiceObj.getSMSSettings(customerIdStr, emailIdStr);
			List<GenericSettings> attObj = settingsObj.get(0).getMessageSettings();
			List<GenericAttachment> genAttObj= settingsObj.get(0).getMessageTemplates();
			List<GenericSettings> parameters = settingsObj.get(0).getMessageParameters();

			String status = "new";
			if(attObj != null && attObj.size() > 0){
				modelAndViewObj.addObject("smsSettings",attObj.get(0));
				if(parameters != null && parameters.size() > 0)
					modelAndViewObj.addObject("parametersList", parameters);
				status = "edit";
			}				
			if(genAttObj != null){
			for(int i=0;i<genAttObj.size();i++)
			{
				
				modelAndViewObj.addObject(genAttObj.get(i).getTemplateType(), genAttObj.get(i).getFileName());
				modelAndViewObj.addObject(genAttObj.get(i).getTemplateType()+"Url", genAttObj.get(i).getTemplateUrl());
				if(genAttObj.get(i).getStatus()!=null && !genAttObj.get(i).getStatus().isEmpty() && genAttObj.get(i).getStatus().equalsIgnoreCase("true")){
					modelAndViewObj.addObject(genAttObj.get(i).getTemplateType()+"Status", true);
				}else{
					modelAndViewObj.addObject(genAttObj.get(i).getTemplateType()+"Status", false);
				}
			}
			}
			modelAndViewObj.addObject("status", status);
			modelAndViewObj.setViewName("Settings/editSMSSettings");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}




/**
			 * 
			 * @author Viswanath
			 * 
			 *This method is used to  Edit SMS settings
			 *
			 **/
	/*@RequestMapping("/editSMSSettings")
	public ModelAndView editSMSSettings(@RequestParam("operation") String operation,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("editSMSSettings");
			
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			List<GenericResponse> settingsObj = settingsServiceObj.getSMSSettings(customerIdStr, emailIdStr);
			List<GenericSettings> attObj = settingsObj.get(0).getMessageSettings();
			List<GenericAttachment> genAttObj= settingsObj.get(0).getMessageTemplates();						
			String status = "new";
			
			if(attObj != null && attObj.size() > 0){
				modelAndViewObj.addObject("smsSettings",attObj.get(0));
			status = "edit";
			}			
			if(genAttObj != null){
			for(int i=0;i<genAttObj.size();i++)
			{
				modelAndViewObj.addObject(genAttObj.get(i).getTemplateType(), genAttObj.get(i).getFileName());
				modelAndViewObj.addObject(genAttObj.get(i).getTemplateType()+"Url", genAttObj.get(i).getTemplateUrl());
			}
			}
			
			modelAndViewObj.addObject("status", status);
			
			if(operation.equals("view"))
				modelAndViewObj.setViewName("Settings/viewSMSSettings");
			else
				modelAndViewObj.setViewName("Settings/editSMSSettings");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		
		return modelAndViewObj;
		
	}
	*/

	@RequestMapping("/editSMSSettings")
	public ModelAndView editSMSSettings(@RequestParam("operation") String operation,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("editSMSSettings");
			
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			List<GenericResponse> settingsObj = settingsServiceObj.getSMSSettings(customerIdStr, emailIdStr);
			List<GenericSettings> attObj = settingsObj.get(0).getMessageSettings();
			List<GenericAttachment> genAttObj= settingsObj.get(0).getMessageTemplates();	
			List<GenericSettings> parameters = settingsObj.get(0).getMessageParameters();
			String status = "new";
			
			if(attObj != null && attObj.size() > 0){
				modelAndViewObj.addObject("smsSettings",attObj.get(0));
			if(parameters != null && parameters.size() > 0)
				modelAndViewObj.addObject("parametersList", parameters);
				
			status = "edit";
			}			
			if(genAttObj != null){
			for(int i=0;i<genAttObj.size();i++)
			{
				modelAndViewObj.addObject(genAttObj.get(i).getTemplateType(), genAttObj.get(i).getFileName());
				modelAndViewObj.addObject(genAttObj.get(i).getTemplateType()+"Url", genAttObj.get(i).getTemplateUrl());
				if(genAttObj.get(i).getStatus()!=null && !genAttObj.get(i).getStatus().isEmpty() && genAttObj.get(i).getStatus().equalsIgnoreCase("true")){
					modelAndViewObj.addObject(genAttObj.get(i).getTemplateType()+"Status", true);
				}else{
					modelAndViewObj.addObject(genAttObj.get(i).getTemplateType()+"Status", false);
				}
			}
			}
			
			modelAndViewObj.addObject("status", status);
			
			if(operation.equals("view"))
				modelAndViewObj.setViewName("Settings/viewSMSSettings");
			else
				modelAndViewObj.setViewName("Settings/editSMSSettings");
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
		 *This method is used to update the Existing SMS Settings
		 *
		 **/
	/*@RequestMapping(value="/updateSMSSettings",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView updateSMSSettings(@RequestBody GenericSettings settingsObj,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("updateSMSSettings");
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr=settingsServiceObj.updateSMSSettings(settingsObj, customerIdStr, emailIdStr);
			
			
			List<GenericResponse> settingObj = settingsServiceObj.getSMSSettings(customerIdStr, emailIdStr);
			List<GenericSettings> attObj = settingObj.get(0).getMessageSettings();
			List<GenericAttachment> genAttObj= settingObj.get(0).getMessageTemplates();					
		
			String status = "new";
			GenericSettings genericSettingsObj = null;
			
			if(attObj != null && attObj.size() > 0){
				genericSettingsObj = attObj.get(0);
			status = "edit";
			}
			else{
				genericSettingsObj=new GenericSettings();
				modelAndViewObj.addObject("smsSettings",genericSettingsObj);
			}
			if(genAttObj != null){
			for(int i=0;i<genAttObj.size();i++)
			{
				modelAndViewObj.addObject(genAttObj.get(i).getTemplateType(), genAttObj.get(i).getFileName());
				modelAndViewObj.addObject(genAttObj.get(i).getTemplateType()+"Url", genAttObj.get(i).getTemplateUrl());
			}
			}
			
			modelAndViewObj.addObject("status", status);
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("SMS_SETTING_UPDATE_SUCCESS").trim())){
				modelAndViewObj.addObject("err", resultStr);
			}else
				modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.addObject("smsSettings", settingsObj);
			
		if(settingsObj.getTemplatesList() != null && settingsObj.getTemplatesList().size() > 0){
			modelAndViewObj.addObject("smsTemplates",settingsObj.getTemplatesList().get(0));
			}
			modelAndViewObj.setViewName("Settings/editSMSSettings");
			////////System.out.println(modelAndViewObj);
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
*/
	
	@RequestMapping(value="/updateSMSSettings",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView updateSMSSettings(@RequestBody GenericSettings settingsObj,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("updateSMSSettings");
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr=settingsServiceObj.updateSMSSettings(settingsObj, customerIdStr, emailIdStr);
			
			
			List<GenericResponse> settingObj = settingsServiceObj.getSMSSettings(customerIdStr, emailIdStr);
			List<GenericSettings> attObj = settingObj.get(0).getMessageSettings();
			List<GenericAttachment> genAttObj= settingObj.get(0).getMessageTemplates();					
			List<GenericSettings> parameters = settingObj.get(0).getMessageParameters();
			if(parameters != null && parameters.size() > 0)
				modelAndViewObj.addObject("parametersList", parameters);
			String status = "new";
			GenericSettings genericSettingsObj = null;
			
			if(attObj != null && attObj.size() > 0){
				genericSettingsObj = attObj.get(0);
			status = "edit";
			}
			else{
				genericSettingsObj=new GenericSettings();
				modelAndViewObj.addObject("smsSettings",genericSettingsObj);
			}
			if(genAttObj != null){
			for(int i=0;i<genAttObj.size();i++)
			{
				modelAndViewObj.addObject(genAttObj.get(i).getTemplateType(), genAttObj.get(i).getFileName());
				modelAndViewObj.addObject(genAttObj.get(i).getTemplateType()+"Url", genAttObj.get(i).getTemplateUrl());
				if(genAttObj.get(i).getStatus()!=null && !genAttObj.get(i).getStatus().isEmpty() && genAttObj.get(i).getStatus().equalsIgnoreCase("true")){
					modelAndViewObj.addObject(genAttObj.get(i).getTemplateType()+"Status", true);
				}else{
					modelAndViewObj.addObject(genAttObj.get(i).getTemplateType()+"Status", false);
				}
				
			}
			}
			
			modelAndViewObj.addObject("status", status);
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("SMS_SETTING_UPDATE_SUCCESS").trim())){
				modelAndViewObj.addObject("err", resultStr);
			}else
				modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.addObject("smsSettings", settingsObj);
			
		if(settingsObj.getTemplatesList() != null && settingsObj.getTemplatesList().size() > 0){
			modelAndViewObj.addObject("smsTemplates",settingsObj.getTemplatesList().get(0));
			}
			modelAndViewObj.setViewName("Settings/editSMSSettings");
			////////System.out.println(modelAndViewObj);
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}

	
	
	
	
	@RequestMapping(value="/validatesettings",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView validatesettings(@RequestBody GenericSettings settingsObj,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("updateSMSSettings");
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			
			String resultStr=settingsServiceObj.validatesmssettings(settingsObj, customerIdStr, emailIdStr);
			
			/*if(!resultStr.equals("0")){
				modelAndViewObj.addObject("err", resultStr);
			}else
				modelAndViewObj.addObject("success", resultStr);*/
			
			
			if(resultStr.contains("Success"))
			{
				modelAndViewObj.addObject("success", resultStr);
			}else{
				modelAndViewObj.addObject("err", resultStr);
			}
			
			List<GenericResponse> settingsObj1 = settingsServiceObj.getSMSSettings(customerIdStr, emailIdStr);
			List<GenericSettings> attObj = settingsObj1.get(0).getMessageSettings();
			List<GenericAttachment> genAttObj= settingsObj1.get(0).getMessageTemplates();
			List<GenericSettings> parameters = settingsObj1.get(0).getMessageParameters();

			String status = "new";
			if(attObj != null && attObj.size() > 0){
				modelAndViewObj.addObject("smsSettings",attObj.get(0));
				if(parameters != null && parameters.size() > 0)
					modelAndViewObj.addObject("parametersList", parameters);
				status = "edit";
			}				
			if(genAttObj != null){
			for(int i=0;i<genAttObj.size();i++)
			{
				
				modelAndViewObj.addObject(genAttObj.get(i).getTemplateType(), genAttObj.get(i).getFileName());
				modelAndViewObj.addObject(genAttObj.get(i).getTemplateType()+"Url", genAttObj.get(i).getTemplateUrl());
			}
			}
			modelAndViewObj.addObject("status", status);
			
			modelAndViewObj.setViewName("Settings/editSMSSettings");
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
	 *This method is used to create the createPrintSettings
	 *
	 **/
@RequestMapping(value="/createPrintSettings",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createPrintSettings(@RequestBody PrintSettings printSettingsObj,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("createPrintSettings");
			modelAndViewObj = new ModelAndView();
			List<GenericAttachment> genAttachmentObj=null;
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr=settingsServiceObj.createPrintSettings(printSettingsObj, customerIdStr, emailIdStr);
			PrintSettings settingsObj = settingsServiceObj.getPrintSettings(customerIdStr, emailIdStr);
			if(settingsObj != null && settingsObj.getTemplatesList() != null && settingsObj.getTemplatesList().size() > 0 ){
			genAttachmentObj= settingsObj.getTemplatesList();
			}
			String status = "new";
			if(settingsObj != null){
			status = "edit";
			}			
			if(genAttachmentObj != null){
			for(int i=0;i<genAttachmentObj.size();i++)
			{
				modelAndViewObj.addObject(genAttachmentObj.get(i).getTemplateType(), genAttachmentObj.get(i).getFileName());
				modelAndViewObj.addObject(genAttachmentObj.get(i).getTemplateType()+"Url", genAttachmentObj.get(i).getTemplateUrl());
				if(genAttachmentObj.get(i).getStatus()!=null && !genAttachmentObj.get(i).getStatus().isEmpty() && genAttachmentObj.get(i).getStatus().equalsIgnoreCase("true")){
					modelAndViewObj.addObject(genAttachmentObj.get(i).getTemplateType()+"Status", true);
				}else{
					modelAndViewObj.addObject(genAttachmentObj.get(i).getTemplateType()+"Status", false);
				}
			}
			}
			modelAndViewObj.addObject("printSettings",settingsObj);
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("PRINT_SETTING_CREATE_SUCCESS").trim())){
				modelAndViewObj.addObject("err", resultStr);
			}else{
				modelAndViewObj.addObject("success", resultStr);
			}
			modelAndViewObj.addObject("status", status);
			modelAndViewObj.setViewName("Settings/editPrintSettings");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	} 

@RequestMapping("/editPrintSettings")
	public ModelAndView editPrintSettings(@RequestParam("operation") String operation,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("editPrintSettings");
			List<GenericAttachment> genAttachmentObj=null;
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			PrintSettings settingsObj = settingsServiceObj.getPrintSettings(customerIdStr, emailIdStr);
			if(settingsObj != null && settingsObj.getTemplatesList() != null && settingsObj.getTemplatesList().size() > 0 ){
			genAttachmentObj= settingsObj.getTemplatesList();
			}
			String status = "new";
			if(settingsObj != null){
			status = "edit";
			}			
			if(genAttachmentObj != null){
			for(int i=0;i<genAttachmentObj.size();i++)
			{
				modelAndViewObj.addObject(genAttachmentObj.get(i).getTemplateType(), genAttachmentObj.get(i).getFileName());
				modelAndViewObj.addObject(genAttachmentObj.get(i).getTemplateType()+"Url", genAttachmentObj.get(i).getTemplateUrl());
				if(genAttachmentObj.get(i).getStatus()!=null && !genAttachmentObj.get(i).getStatus().isEmpty() && genAttachmentObj.get(i).getStatus().equalsIgnoreCase("true")){
					modelAndViewObj.addObject(genAttachmentObj.get(i).getTemplateType()+"Status", true);
				}else{
					modelAndViewObj.addObject(genAttachmentObj.get(i).getTemplateType()+"Status", false);
				}
			
			}
			}
			
			modelAndViewObj.addObject("printSettings",settingsObj);
			modelAndViewObj.addObject("status", status);
				modelAndViewObj.setViewName("Settings/editPrintSettings");
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
	 * This method is used to update the Existing Print Settings
	 *
	 **/
@RequestMapping(value="/updatePrintSettings",method=RequestMethod.POST,consumes="application/json")
public ModelAndView updatePrintSettings(@RequestBody PrintSettings printSettingsObj,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("updateSMSSettings");
		modelAndViewObj = new ModelAndView();
		List<GenericAttachment> genAttachmentObj=null;
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		String resultStr=settingsServiceObj.updatePrintSettings(printSettingsObj, customerIdStr, emailIdStr);
		
		
		PrintSettings settingsObj = settingsServiceObj.getPrintSettings(customerIdStr, emailIdStr);
		if(settingsObj != null && settingsObj.getTemplatesList() != null && settingsObj.getTemplatesList().size() > 0 ){
			////////System.out.println("not null");
		genAttachmentObj= settingsObj.getTemplatesList();
		}
		String status = "new";
		if(settingsObj != null){
			modelAndViewObj.addObject("printSettings",settingsObj);
		status = "edit";
		}			
		if(genAttachmentObj != null){
		for(int i=0;i<genAttachmentObj.size();i++)
		{
			
			System.err.println("template"+genAttachmentObj.get(i).getTemplateUrl());
			modelAndViewObj.addObject(genAttachmentObj.get(i).getTemplateType(), genAttachmentObj.get(i).getFileName());
			modelAndViewObj.addObject(genAttachmentObj.get(i).getTemplateType()+"Url", genAttachmentObj.get(i).getTemplateUrl());
			if(genAttachmentObj.get(i).getStatus()!=null && !genAttachmentObj.get(i).getStatus().isEmpty() && genAttachmentObj.get(i).getStatus().equalsIgnoreCase("true")){
				modelAndViewObj.addObject(genAttachmentObj.get(i).getTemplateType()+"Status", true);
			}else{
				modelAndViewObj.addObject(genAttachmentObj.get(i).getTemplateType()+"Status", false);
			}
		
		}
		}
		modelAndViewObj.addObject("status", status);

		if(!resultStr.equals(AppProperties.getAppMessageByProperty("PRINT_SETTING_UPDATE_SUCCESS").trim())){
			modelAndViewObj.addObject("err", resultStr);
		}else{
			modelAndViewObj.addObject("success", resultStr);
		}
		modelAndViewObj.setViewName("Settings/editPrintSettings");
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}


/**
 * 
 * @author 
 * 
 * @modifiedBy vijay
 * 
 *This method is used to create the hardaware and software settings
 *
 **/

@RequestMapping("/editIntegrationSettings")
public ModelAndView editIntegrationSettings(@RequestParam("operation") String operation,HttpServletRequest request,HttpServletResponse response)
{
	try{
		// log.info("editIntegrationSettings");
		String status = "";
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		IntegrationSettings	integrationSettings = settingsServiceObj.getIntegartionSettings(customerIdStr,emailIdStr);
		modelAndViewObj = new ModelAndView();
		

		if(integrationSettings != null)
		{
			IntegrationSettings genericCustomerObj = integrationSettings.getIntegrationSettingsObj();

			modelAndViewObj.addObject("integrationSettings", genericCustomerObj);
			status = "edit";
		}
		else
			status ="new";


		modelAndViewObj.addObject("status",status);
		modelAndViewObj.setViewName("Settings/newIntegrationSettings");
	}
	catch(Exception exception){
		exception.printStackTrace();
	}

	return modelAndViewObj;
}




/*@RequestMapping("/editIntegrationSettings")
public ModelAndView editIntegrationSettings(@RequestParam("operation") String operation,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("editIntegrationSettings");

		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		IntegrationSettings	integrationSettings = settingsServiceObj.getIntegartionSettings(customerIdStr,emailIdStr);
		integrationSettings=integrationSettings.getIntegrationSettingsObj();
		modelAndViewObj = new ModelAndView();
		String status = "new";
		modelAndViewObj.addObject("intSettings",integrationSettings);
		IntegrationSettings  genericCustomerObj = null;
		if(integrationSettings != null){
			genericCustomerObj = integrationSettings.getIntegrationSettingsObj();
			status = "edit";
		}
		else
			genericCustomerObj = new IntegrationSettings();
		////////System.out.println(status);
		modelAndViewObj.addObject("status",status);
		modelAndViewObj.setViewName("Settings/newIntegrationSettings");
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	
	return modelAndViewObj;
}*/


/**
	 * 
	 * @author Manasa.P
	 * 
	 *This method is used to create the hardaware and software settings
	 *
	 **/
@RequestMapping(value="/createHardwareAndSoftwaresettings",method=RequestMethod.POST,consumes="application/json")
public ModelAndView createHardwareAndSoftwaresettings(@RequestBody String intSettingsObj,HttpServletRequest request,HttpServletResponse response){
	try{
		
		modelAndViewObj = new ModelAndView();
//		List<GenericAttachment> genAttachmentObj=null;
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		String resultStr=settingsServiceObj.createHardwareAndSoftwaresettings(intSettingsObj, customerIdStr, emailIdStr);
		IntegrationSettings	integrationSettings = settingsServiceObj.getIntegartionSettings(customerIdStr,emailIdStr);
		modelAndViewObj.addObject("intsettings",integrationSettings.getIntegrationSettingsObj());
		if(!resultStr.equals(AppProperties.getAppMessageByProperty("INTEGRATION_CREATE_SUCCESS").trim())){
			modelAndViewObj.addObject("err", resultStr);
		}else{
			modelAndViewObj.addObject("success", resultStr);
		}
		String status="new";
		modelAndViewObj.addObject("status", status);
		//////////System.out.println(status);
		modelAndViewObj.setViewName("Settings/newIntegrationSettings");
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
} 


/*
@RequestMapping(value="/createHardwareAndSoftwaresettings",method=RequestMethod.POST,consumes="application/json")
public ModelAndView createHardwareAndSoftwaresettings(@RequestBody String intSettingsObj,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("createHardwareAndSoftwaresettings");
		modelAndViewObj = new ModelAndView();
		List<GenericAttachment> genAttachmentObj=null;
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		String resultStr=settingsServiceObj.createHardwareAndSoftwaresettings(intSettingsObj, customerIdStr, emailIdStr);
		IntegrationSettings	integrationSettings = settingsServiceObj.getIntegartionSettings(customerIdStr,emailIdStr);
		modelAndViewObj.addObject("intsettings",integrationSettings.getIntegrationSettingsObj());
		if(!resultStr.equals(AppProperties.getAppMessageByProperty("INTEGRATION_CREATE_SUCCESS").trim())){
			modelAndViewObj.addObject("err", resultStr);
		}else{
			modelAndViewObj.addObject("success", resultStr);
		}
		String status="new";
		modelAndViewObj.addObject("status", status);
		//////////System.out.println(status);
		modelAndViewObj.setViewName("Settings/newIntegrationSettings");
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
} 

*/
/*
@RequestMapping(value="/createHardwareAndSoftwaresettings",method=RequestMethod.POST,consumes="application/json")
public ModelAndView createHardwareAndSoftwaresettings(@RequestBody String intSettingsObj,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("createHardwareAndSoftwaresettings");
		modelAndViewObj = new ModelAndView();
		List<GenericAttachment> genAttachmentObj=null;
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		String resultStr=settingsServiceObj.createHardwareAndSoftwaresettings(intSettingsObj, customerIdStr, emailIdStr);
		IntegrationSettings	integrationSettings = settingsServiceObj.getIntegartionSettings(customerIdStr,emailIdStr);
		modelAndViewObj.addObject("intsettings",integrationSettings.getIntegrationSettingsObj());
		if(!resultStr.equals(AppProperties.getAppMessageByProperty("INTEGRATION_CREATE_SUCCESS").trim())){
			modelAndViewObj.addObject("err", resultStr);
		}else{
			modelAndViewObj.addObject("success", resultStr);
		}
		String status="new";
		modelAndViewObj.addObject("status", status);
		//////////System.out.println(status);
		modelAndViewObj.setViewName("Settings/newIntegrationSettings");
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
} 

*/



/**
 * 
 * @author Manasa.P
 * 
 *This method is used to update the Existing hardware and software Settings
 *
 **/
@RequestMapping(value="/updateHardwareAndSoftwareSettings",method=RequestMethod.POST,consumes="application/json")
public ModelAndView updateHardwareAndSoftwareSettings(@RequestBody String settingObj,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("updateMailSettings");
		modelAndViewObj = new ModelAndView();
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		String resultStr=settingsServiceObj.updateIntegrationSettings(settingObj, customerIdStr, emailIdStr);
		
		IntegrationSettings	integrationSettings = settingsServiceObj.getIntegartionSettings(customerIdStr,emailIdStr);
		//integrationSettings=integrationSettings.getIntegrationSettingsObj();
		
		String status = "new";
		if(integrationSettings != null){
			//modelAndViewObj.addObject("intsettings", integrationSettings.getIntegrationSettingsObj());
			IntegrationSettings genericCustomerObj = integrationSettings.getIntegrationSettingsObj();
			  modelAndViewObj.addObject("integrationSettings", genericCustomerObj);
			status = "edit";
		}
		modelAndViewObj.addObject("status", status);
		if(!resultStr.equals(AppProperties.getAppMessageByProperty("INTEGRATION_UPDATE_SUCCESS").trim())){
			modelAndViewObj.addObject("err", resultStr);
		}else{
			modelAndViewObj.addObject("success", resultStr);
		}
		modelAndViewObj.setViewName("Settings/newIntegrationSettings");
//		////////System.out.println(modelAndViewObj);
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}


/**
 * 
 * @author Viswanath
 * 
 *This method is used to create the userSecuritySettings
 *
 **/
@RequestMapping(value="/createUserSecuritySettings",method=RequestMethod.POST,consumes="application/json")
public ModelAndView createUserSecuritySettings(@RequestBody SecuritySettings securitySettingsObj,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("createUserSecuritySettings");
		modelAndViewObj = new ModelAndView();
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		String resultStr=settingsServiceObj.createUserSecuritySettings(securitySettingsObj, customerIdStr, emailIdStr);
		SecuritySettings settingsObj = settingsServiceObj.getUserSecuritySettings(customerIdStr, emailIdStr);
		//List<GenericCustomer> genAttObj = settingsObj.get(0).getCustomerSettings();
		String status = "new";
		SecuritySettings userSecurityObj = null;
		if(settingsObj != null){
			userSecurityObj = settingsObj;
			status = "edit";
		}
		else
			userSecurityObj = new SecuritySettings();
		modelAndViewObj.addObject("status", status);
		if(!resultStr.equals(AppProperties.getAppMessageByProperty("SECURITY_SETTING_CREATE_SUCCESS").trim())){
			modelAndViewObj.addObject("err", resultStr);
		}else{
			modelAndViewObj.addObject("success", resultStr);
		}
		modelAndViewObj.addObject("securitySettings", userSecurityObj);
		modelAndViewObj.setViewName("Settings/userSecurity");
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}

/**
 * 
 * @author Viswanath
 * 
 *This method is used to edit  userSecuritySettings
 *
 **/
@RequestMapping("/editUserSecurity")
public ModelAndView editUserSecurity(@RequestParam("operation") String operation,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("editUserSecurity");
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		modelAndViewObj = new ModelAndView();
		SecuritySettings settingsObj=settingsServiceObj.getUserSecuritySettings(customerIdStr, emailIdStr);
		//modelAndViewObj.addObject("err", resultStr);
		String status = "new";
		SecuritySettings userSecurityObj = null;
		if(settingsObj.getMinPasswordLength() != null){
	//if(settingsObj != null){
	userSecurityObj = settingsObj;
		status = "edit";
	}
	else{
		userSecurityObj = new SecuritySettings();
	userSecurityObj.setMinPasswordLength("8");
	userSecurityObj.setCapitalLetters("3");
	userSecurityObj.setPasswordExpiryInDays("30");
	userSecurityObj.setNoOfAttempts("3");
	userSecurityObj.setSmallLetters("3");
	userSecurityObj.setSpecialLetters("1");
	}
	modelAndViewObj.addObject("securitySettings", userSecurityObj);
	////////System.out.println(status);
	modelAndViewObj.addObject("status", status);
		modelAndViewObj.setViewName("Settings/userSecurity");
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
 *This method is used to update the userSecuritySettings
 *
 **/
@RequestMapping(value="/updateUserSecuritySettings",method=RequestMethod.POST,consumes="application/json")
public ModelAndView updateUserSecuritySettings(@RequestBody SecuritySettings settingsObj,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("updateUserSecuritySettings");
		modelAndViewObj = new ModelAndView();
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		String resultStr=settingsServiceObj.updateUserSecuritySettings(settingsObj, customerIdStr, emailIdStr);
		SecuritySettings securitySettingsObj=settingsServiceObj.getUserSecuritySettings(customerIdStr, emailIdStr);
		//modelAndViewObj.addObject("customerSettings", settingsObj);
		modelAndViewObj.addObject("securitySettings", securitySettingsObj);
		String status = "edit";
		modelAndViewObj.addObject("status", status);
		if(!resultStr.equals(AppProperties.getAppMessageByProperty("SECURITY_SETTING_UPDATE_SUCCESS").trim())){
			modelAndViewObj.addObject("err", resultStr);
		}else{
			modelAndViewObj.addObject("success", resultStr);
		}
		modelAndViewObj.setViewName("Settings/userSecurity");
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
 *This method is used to create Regional settings
 *
 **/

@RequestMapping(value="/createRegionalSettings",method=RequestMethod.POST,consumes="application/json")
public ModelAndView createRegionalSettings(@RequestBody GenericRegionalSettings regionalSettingsObj,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("createRegionalSettings");
		modelAndViewObj = new ModelAndView();
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		String resultStr=settingsServiceObj.createRegionalSettings(regionalSettingsObj, customerIdStr, emailIdStr);
		GenericRegionalSettings genericRegionalSettingsObj = settingsServiceObj.getRegionalSettings(customerIdStr, emailIdStr);
		String status = "new";
		if(genericRegionalSettingsObj != null)
			status = "edit";
		modelAndViewObj.addObject("status", status);
		modelAndViewObj.addObject("regionalSettings", genericRegionalSettingsObj);
		if(!resultStr.equals(AppProperties.getAppMessageByProperty("REGIONAL_SETTING_CREATE_SUCCESS").trim())){
			modelAndViewObj.addObject("err", resultStr);
		}else{
			modelAndViewObj.addObject("success", resultStr);
		}
		modelAndViewObj.setViewName("Settings/editRegionalSettings");
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}

/**
 * 
 * @author Viswanath
 * 
 *This method is used to display the editRegionalSettings form consisting of the existing settings
 *
 **/
@RequestMapping("/editRegionalSettings")
public ModelAndView editRegionalSettings(@RequestParam("operation") String operation,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("editRegionalSettings");
		
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		modelAndViewObj = new ModelAndView();
		GenericRegionalSettings genericRegionalSettingsObj = settingsServiceObj.getRegionalSettings(customerIdStr, emailIdStr);
		String status = "new";
		if(genericRegionalSettingsObj != null)
			status = "edit";
		modelAndViewObj.addObject("status", status);
		modelAndViewObj.addObject("regionalSettings", genericRegionalSettingsObj);
		if(operation.equals("view"))
			modelAndViewObj.setViewName("Settings/viewRegionalSettings");
		else
			modelAndViewObj.setViewName("Settings/editRegionalSettings");
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
 *This method is used to update the Existing regional Settings
 *
 **/
@RequestMapping(value="/updateRegionalSettings",method=RequestMethod.POST,consumes="application/json")
public ModelAndView updateRegionalSettings(@RequestBody GenericRegionalSettings settingsObj,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("updateRegionalSettings");
		modelAndViewObj = new ModelAndView();
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		String resultStr=settingsServiceObj.updateRegionalSettings(settingsObj, customerIdStr, emailIdStr);
		GenericRegionalSettings genericRegionalSettingsObj = settingsServiceObj.getRegionalSettings(customerIdStr, emailIdStr);
		String status = "new";
		if(genericRegionalSettingsObj != null)
			status = "edit";
		modelAndViewObj.addObject("status", status);
		modelAndViewObj.addObject("regionalSettings", genericRegionalSettingsObj);
		if(!resultStr.equals(AppProperties.getAppMessageByProperty("REGIONAL_SETTING_UPDATE_SUCCESS").trim())){
			modelAndViewObj.addObject("err", resultStr);
		}else{
			modelAndViewObj.addObject("success", resultStr);
		}
		modelAndViewObj.setViewName("Settings/editRegionalSettings");
		////////System.out.println(modelAndViewObj);
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}


@RequestMapping(value="/sendTestMail",method=RequestMethod.POST)
public void sendTestMail(@RequestParam("protocol") String protocol,@RequestParam("smtp") String smtp,@RequestParam("mailId") String mailId,@RequestParam("password") String password,@RequestParam("port") String port,@RequestParam("testmsg") String testmsg,@RequestParam("testemail") String testemail,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("updateRegionalSettings");
		modelAndViewObj = new ModelAndView();
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		String resultStr=settingsServiceObj.sendTestMsg(testmsg,testemail, customerIdStr, emailIdStr,smtp,mailId,password,port,protocol);
		response.setContentType("application/text");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(resultStr);
	}catch(Exception exception){
		exception.printStackTrace();
	}
	
}


@RequestMapping(value="/createWhatsAppSettings",method=RequestMethod.POST,consumes="application/json")
public ModelAndView createWhatsAppSettings(@RequestBody GenericSettings smsSettingsObj,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("createSMSSettings");
		modelAndViewObj = new ModelAndView();
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		String resultStr=settingsServiceObj.createWhatsAppSettings(smsSettingsObj, customerIdStr, emailIdStr);
		if(!resultStr.equals(AppProperties.getAppMessageByProperty("WHATSAPP_SETTING_CREATE_SUCCESS").trim())){
			modelAndViewObj.addObject("err", resultStr);
		}else
			modelAndViewObj.addObject("success", resultStr);
		
		List<GenericResponse> settingsObj = settingsServiceObj.getWhatsAppSettings(customerIdStr, emailIdStr);
		List<GenericSettings> attObj = settingsObj.get(0).getWattsAppMessageSettings();
		List<GenericAttachment> genAttObj= settingsObj.get(0).getWattsappMsgTemplates();
		List<GenericSettings> parameters = settingsObj.get(0).getWattsappMessageParameters();

		String status = "new";
		if(attObj != null && attObj.size() > 0){
			modelAndViewObj.addObject("whatsappSettings",attObj.get(0));
			if(parameters != null && parameters.size() > 0)
				modelAndViewObj.addObject("parametersList", parameters);
			status = "edit";
		}				
		if(genAttObj != null){
		for(int i=0;i<genAttObj.size();i++)
		{
			
			modelAndViewObj.addObject(genAttObj.get(i).getTemplateType(), genAttObj.get(i).getFileName());
			modelAndViewObj.addObject(genAttObj.get(i).getTemplateType()+"Url", genAttObj.get(i).getTemplateUrl());
			if(genAttObj.get(i).getStatus()!=null && !genAttObj.get(i).getStatus().isEmpty() && genAttObj.get(i).getStatus().equalsIgnoreCase("true")){
				modelAndViewObj.addObject(genAttObj.get(i).getTemplateType()+"Status", true);
			}else{
				modelAndViewObj.addObject(genAttObj.get(i).getTemplateType()+"Status", false);
			}
		}
		}
		modelAndViewObj.addObject("status", status);
		modelAndViewObj.setViewName("Settings/editWhatsAppSettings");
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}


@RequestMapping("/editWhatsAppSettings")
public ModelAndView editWhatsAppSettings(@RequestParam("operation") String operation,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("editWhatsAppSettings");
		
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		modelAndViewObj = new ModelAndView();
		List<GenericResponse> settingsObj = settingsServiceObj.getWhatsAppSettings(customerIdStr, emailIdStr);
		List<GenericSettings> attObj = settingsObj.get(0).getWattsAppMessageSettings();
		List<GenericAttachment> genAttObj= settingsObj.get(0).getWattsappMsgTemplates();	
		List<GenericSettings> parameters = settingsObj.get(0).getWattsappMessageParameters();
		String status = "new";
		
		if(attObj != null && attObj.size() > 0){
			modelAndViewObj.addObject("whatsappSettings",attObj.get(0));
		if(parameters != null && parameters.size() > 0)
			modelAndViewObj.addObject("parametersList", parameters);
			
		status = "edit";
		}			
		if(genAttObj != null){
		for(int i=0;i<genAttObj.size();i++)
		{
			modelAndViewObj.addObject(genAttObj.get(i).getTemplateType(), genAttObj.get(i).getFileName());
			modelAndViewObj.addObject(genAttObj.get(i).getTemplateType()+"Url", genAttObj.get(i).getTemplateUrl());
			if(genAttObj.get(i).getStatus()!=null && !genAttObj.get(i).getStatus().isEmpty() && genAttObj.get(i).getStatus().equalsIgnoreCase("true")){
				modelAndViewObj.addObject(genAttObj.get(i).getTemplateType()+"Status", true);
			}else{
				modelAndViewObj.addObject(genAttObj.get(i).getTemplateType()+"Status", false);
			}
		
		}
		}
		
		modelAndViewObj.addObject("status", status);
		
		if(operation.equals("view"))
			modelAndViewObj.setViewName("Settings/editWhatsAppSettings");
		else
			modelAndViewObj.setViewName("Settings/editWhatsAppSettings");
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	
	return modelAndViewObj;
	
}


@RequestMapping(value="/updateWhatsAppSettings",method=RequestMethod.POST,consumes="application/json")
public ModelAndView updateWhatsAppSettings(@RequestBody GenericSettings settingsObj,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("updateWhatsAppSettings");
		modelAndViewObj = new ModelAndView();
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		String resultStr=settingsServiceObj.updateWhatsAppSettings(settingsObj, customerIdStr, emailIdStr);
		
		
		List<GenericResponse> settingObj = settingsServiceObj.getWhatsAppSettings(customerIdStr, emailIdStr);
		List<GenericSettings> attObj = settingObj.get(0).getWattsAppMessageSettings();
		List<GenericAttachment> genAttObj= settingObj.get(0).getWattsappMsgTemplates();					
		List<GenericSettings> parameters = settingObj.get(0).getWattsappMessageParameters();
		if(parameters != null && parameters.size() > 0)
			modelAndViewObj.addObject("parametersList", parameters);
		String status = "new";
		GenericSettings genericSettingsObj = null;
		
		if(attObj != null && attObj.size() > 0){
			genericSettingsObj = attObj.get(0);
		status = "edit";
		}
		else{
			genericSettingsObj=new GenericSettings();
			modelAndViewObj.addObject("whatsappSettings",genericSettingsObj);
		}
		if(genAttObj != null){
		for(int i=0;i<genAttObj.size();i++)
		{
			modelAndViewObj.addObject(genAttObj.get(i).getTemplateType(), genAttObj.get(i).getFileName());
			modelAndViewObj.addObject(genAttObj.get(i).getTemplateType()+"Url", genAttObj.get(i).getTemplateUrl());
			if(genAttObj.get(i).getStatus()!=null && !genAttObj.get(i).getStatus().isEmpty() && genAttObj.get(i).getStatus().equalsIgnoreCase("true")){
				modelAndViewObj.addObject(genAttObj.get(i).getTemplateType()+"Status", true);
			}else{
				modelAndViewObj.addObject(genAttObj.get(i).getTemplateType()+"Status", false);
			}
		}
		}
		
		modelAndViewObj.addObject("status", status);
		if(!resultStr.equals(AppProperties.getAppMessageByProperty("WHATSAPP_SETTING_UPDATE_SUCCESS").trim())){
			modelAndViewObj.addObject("err", resultStr);
		}else
			modelAndViewObj.addObject("success", resultStr);
		modelAndViewObj.addObject("whatsappSettings", settingsObj);
		
	if(settingsObj.getTemplatesList() != null && settingsObj.getTemplatesList().size() > 0){
		modelAndViewObj.addObject("smsTemplates",settingsObj.getTemplatesList().get(0));
		}
		modelAndViewObj.setViewName("Settings/editWhatsAppSettings");
		
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}



@RequestMapping(value="/validateWhatsAppTestSettings",method=RequestMethod.POST,consumes="application/json")
public ModelAndView validateWhatsAppTestSettings(@RequestBody GenericSettings settingsObj,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("updateSMSSettings");
		modelAndViewObj = new ModelAndView();
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		
		String resultStr=settingsServiceObj.validateWhatsAppSettings(settingsObj, customerIdStr, emailIdStr);
		
		if(!resultStr.equals("0")){
			modelAndViewObj.addObject("err", resultStr);
		}else
			modelAndViewObj.addObject("success", resultStr);
		
		List<GenericResponse> settingsObj1 = settingsServiceObj.getWhatsAppSettings(customerIdStr, emailIdStr);
		List<GenericSettings> attObj = settingsObj1.get(0).getWattsAppMessageSettings();
		List<GenericAttachment> genAttObj= settingsObj1.get(0).getWattsappMsgTemplates();
		List<GenericSettings> parameters = settingsObj1.get(0).getWattsappMessageParameters();

		String status = "new";
		if(attObj != null && attObj.size() > 0){
			modelAndViewObj.addObject("whatsappSettings",attObj.get(0));
			if(parameters != null && parameters.size() > 0)
				modelAndViewObj.addObject("parametersList", parameters);
			status = "edit";
		}				
		if(genAttObj != null){
		for(int i=0;i<genAttObj.size();i++)
		{
			
			modelAndViewObj.addObject(genAttObj.get(i).getTemplateType(), genAttObj.get(i).getFileName());
			modelAndViewObj.addObject(genAttObj.get(i).getTemplateType()+"Url", genAttObj.get(i).getTemplateUrl());
		}
		}
		modelAndViewObj.addObject("status", status);
		
		modelAndViewObj.setViewName("Settings/editWhatsAppSettings");
		////////System.out.println(modelAndViewObj);
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}


@RequestMapping("/editFTPSettings")
public ModelAndView editFTPSettings(@RequestParam("operation") String operation,HttpServletRequest request,HttpServletResponse response)
{
	try{
		// log.info("editIntegrationSettings");
		String status = "";
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		List<GenericResponse> ftpSettingsObj = settingsServiceObj.getFTPSettings(customerIdStr,emailIdStr);
		modelAndViewObj = new ModelAndView();
		
		if(ftpSettingsObj != null && ftpSettingsObj.size()>0)
		{
			if(ftpSettingsObj.get(0).getSftpSettingsnew() != null || ftpSettingsObj.get(0).getBackUpSftpsettingsnew() != null){
			if(ftpSettingsObj.get(0).getSftpSettingsnew() != null && ftpSettingsObj.get(0).getSftpSettingsnew().size()>0)
				modelAndViewObj.addObject("sftpSettings", ftpSettingsObj.get(0).getSftpSettingsnew().get(0));
			if(ftpSettingsObj.get(0).getBackUpSftpsettingsnew() != null && ftpSettingsObj.get(0).getBackUpSftpsettingsnew().size()>0)
				modelAndViewObj.addObject("backUpsftpSettings", ftpSettingsObj.get(0).getBackUpSftpsettingsnew().get(0));
			/*if(ftpSettingsObj.get(0).getSftpSettingsnew() != null && ftpSettingsObj.get(0).getSftpSettingsnew().size()>0)
				modelAndViewObj.addObject("ftpSettings", ftpSettingsObj.get(0).getSftpSettingsnew());*/
				status = "edit";
				modelAndViewObj.addObject("status", status);
			
			}else {
				status = "new";
				modelAndViewObj.addObject("status", status);
				
			}
			
		}else {
			status = "new";
			modelAndViewObj.addObject("status", status);
		}
		
		modelAndViewObj.setViewName("Settings/editFTPSettings");
	}
	catch(Exception exception){
		exception.printStackTrace();
	}

	return modelAndViewObj;
}


@RequestMapping(value="/validateFTPSettings",method=RequestMethod.POST,consumes="application/json")
public ModelAndView validateFTPSettings(@RequestBody GenericSettings settingsObj,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("validateFTPTestSettings");
		String status = "";
		modelAndViewObj = new ModelAndView();
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		
		String resultStr = settingsServiceObj.validateFTPSettings(settingsObj, customerIdStr, emailIdStr);
		
		if(!resultStr.contains("Success")){
			modelAndViewObj.addObject("err", resultStr);
		}else {
			modelAndViewObj.addObject("success", resultStr);
		}
		
		List<GenericResponse> ftpSettingsObj = settingsServiceObj.getFTPSettings(customerIdStr,emailIdStr);
		
		if(ftpSettingsObj != null && ftpSettingsObj.size()>0)
		{
			if(ftpSettingsObj.get(0).getSftpSettingsnew() != null || ftpSettingsObj.get(0).getBackUpSftpsettingsnew() != null){
				if(ftpSettingsObj.get(0).getSftpSettingsnew() != null && ftpSettingsObj.get(0).getSftpSettingsnew().size()>0)
					modelAndViewObj.addObject("sftpSettings", ftpSettingsObj.get(0).getSftpSettingsnew().get(0));
				if(ftpSettingsObj.get(0).getBackUpSftpsettingsnew() != null && ftpSettingsObj.get(0).getBackUpSftpsettingsnew().size()>0)
					modelAndViewObj.addObject("backUpsftpSettings", ftpSettingsObj.get(0).getBackUpSftpsettingsnew().get(0));
				/*if(ftpSettingsObj.get(0).getSftpSettingsnew() != null && ftpSettingsObj.get(0).getSftpSettingsnew().size()>0)
					modelAndViewObj.addObject("ftpSettings", ftpSettingsObj.get(0).getSftpSettingsnew());*/
					status = "edit";
					modelAndViewObj.addObject("status", status);
				
				}else {
					status = "new";
					modelAndViewObj.addObject("status", status);
					
				}
			
		}else {
			status = "new";
			modelAndViewObj.addObject("status", status);
		}
		
		modelAndViewObj.setViewName("Settings/editFTPSettings");
		
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}


}
