package com.tlabs.posweb.controller;

import java.io.IOException;
import java.math.BigDecimal;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.tlabs.posweb.beans.AccountTypeMaster;
import com.tlabs.posweb.beans.AdvanceAndPayments;
import com.tlabs.posweb.beans.AssetAccounts;
import com.tlabs.posweb.beans.AssetMaster;
import com.tlabs.posweb.beans.BalanceSheetBean;
import com.tlabs.posweb.beans.CreditNoteMaster;
import com.tlabs.posweb.beans.CurrentAssetBean;
import com.tlabs.posweb.beans.DebitNoteMaster;
import com.tlabs.posweb.beans.ExpensesAccounts;
import com.tlabs.posweb.beans.IncomeAccounts;
import com.tlabs.posweb.beans.JournalAccount;
import com.tlabs.posweb.beans.LiabilityAccounts;
import com.tlabs.posweb.beans.LocationBean;
import com.tlabs.posweb.beans.LoginForm;
import com.tlabs.posweb.beans.MasterDataImportsAndExportsBean;
import com.tlabs.posweb.beans.OrganizationLocations;
import com.tlabs.posweb.beans.OrganizationMaster;
import com.tlabs.posweb.beans.PettyCashBook;
import com.tlabs.posweb.beans.PurchasePaymentMaster;
import com.tlabs.posweb.beans.ReconciliationMaster;
import com.tlabs.posweb.beans.RetailServiceArea;
import com.tlabs.posweb.beans.Role;
import com.tlabs.posweb.beans.RoleLocations;
import com.tlabs.posweb.beans.RouteMaster;
import com.tlabs.posweb.beans.SalesAndPaymentsMaster;
import com.tlabs.posweb.beans.StockRequests;
import com.tlabs.posweb.beans.SubAccountTypeMaster;
import com.tlabs.posweb.beans.Suppliers;
//import com.tlabs.posweb.beans.Sku;
import com.tlabs.posweb.beans.UserDetails;
import com.tlabs.posweb.beans.Workflows;
import com.tlabs.posweb.beans.ZoneMaster;
import com.tlabs.posweb.services.AdminService;
import com.tlabs.posweb.services.GenericMasterService;
import com.tlabs.posweb.services.RoleService;
import com.tlabs.posweb.services.UserService;
import com.tlabs.posweb.util.Constants;
import com.tlabs.posweb.util.DateUtil;
import com.tlabs.posweb.util.RestfulServiceConnection;
import com.tlabs.posweb.util.ServerSideValidations;
//import com.tlabs.posweb.util.Utilities;

@Controller
@RequestMapping(value = "/userAccessControl")
public class UserAccessController {
	 
	// private static Logger log = Logger.getLogger(InventoryManagerController.class);
	 @Autowired
	 private AdminService adminServiceObj;
	 private ModelAndView modelAndViewObj;
	 @Autowired
	 private RoleService roleServiceObj;
	 @Autowired
	 private UserService userServiceObj;
	 @Autowired
	 private Gson gson;
	 @Autowired
	 private GenericMasterService genericMasterServiceObj;
	 
	 
	 /**
		 * @author Mythri.S
		 * @param request
		 * @param response
		 * @return returns a jsp which displays all the icons of deals and offers flow
		 */
		@RequestMapping("/showUserAccessControlFlow")
		public ModelAndView showUserAccessControlFlow(HttpServletRequest request,HttpServletResponse response){
			// log.info("showUserAccessControlFlow");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.setViewName("UserAccessControl/usersAccessControlFlow");
			return modelAndViewObj;
		}
	 
	 /**
		 * @author Mythri.S
		 * @param request
		 * @param response
		 * @return returns a jsp which displays all the icons of deals and offers flow
		 */
		@RequestMapping("/showUsersFlow")
		public ModelAndView showUsersFlow(HttpServletRequest request,HttpServletResponse response){
			// log.info("showUsersFlow");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.setViewName("UserAccessControl/Users/usersFlow");
			return modelAndViewObj;
		}
	 

		/**
		 * 
		 * @author Mythri.S
		 * 
		 *This method is used to display the Role Master
		 *
		 **/
		@RequestMapping("/viewRoles")
		public ModelAndView viewRoles(@RequestParam("searchname")String searchname,@RequestParam("maxRecords")String maxRecords,@RequestParam("index")String index,HttpServletRequest request,HttpServletResponse response) {
			try{
				// log.info("viewRoles");
				int start = 1,end = Integer.parseInt(maxRecords);
				String customerId = (String)request.getSession().getAttribute("customerId");
				String emailId = (String)request.getSession().getAttribute("emailId");
				List<Role> roleList = roleServiceObj.getRoleDetails(null,customerId,emailId,index,maxRecords,searchname);
				modelAndViewObj = new ModelAndView();
				if(roleList == null){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(roleList.size()<Integer.parseInt(maxRecords)){
						end = (roleList.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(roleList.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
				}
				modelAndViewObj.addObject("roleList",roleList);
				modelAndViewObj.addObject("maxRecords",Integer.parseInt(maxRecords));
				modelAndViewObj.addObject("searchName",searchname);
				modelAndViewObj.setViewName("UserAccessControl/Roles/rolesMaster");
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
	 
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display the newRole Jsp
	 *
	 **//*
	@RequestMapping("/newRole")
	public ModelAndView newRole(HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("newRole");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<String> outletLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr, emailIdStr,false);
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"0");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			for (ZoneMaster zoneMaster : zoneList) {
				outletLocationsList.add(zoneMaster.getZoneID());
			}
			List<String> warehouseLocationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,false);
			List<Workflows> workflowsList = roleServiceObj.getWorkflows("-1");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("workflowsList", workflowsList);
			modelAndViewObj.addObject("outletLocationsList", outletLocationsList);
			modelAndViewObj.addObject("warehouseLocationsList", warehouseLocationsList);
			modelAndViewObj.addObject("role",new Role());
			modelAndViewObj.setViewName("UserAccessControl/Roles/newRole");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}*/
		
		
		
		/**
		 * 
		 * @author Mythri.S
		 * 
		 *This method is used to display the newRole Jsp
		 *
		 **/
		@RequestMapping("/newRole")
		public ModelAndView newRole(HttpServletRequest request,HttpServletResponse response) {
			try{
				// log.info("newRole");
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				List<String> outletLocationsList = adminServiceObj.getOutletLocationsList("1", emailIdStr,false);
				List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
				if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
					 zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"0","","");
					request.getSession().setAttribute("zoneList", zoneList);
				}
				for (ZoneMaster zoneMaster : zoneList) {
					outletLocationsList.add(zoneMaster.getZoneID());
				}
				List<String> warehouseLocationsList = adminServiceObj.getWarehouseLocationsList("1", emailIdStr,false);
				List<String> cloudLocationsList = adminServiceObj.getAllLocationsList("1", emailIdStr,false);
				List<Workflows> workflowsList = roleServiceObj.getWorkflows("-1","");
				LoginForm loginFormObj = roleServiceObj.getIssueFeilds(request,response);
                ////System.out.println(gson.toJson(loginFormObj));
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("workflowsList", workflowsList);
				modelAndViewObj.addObject("outletLocationsList", outletLocationsList);
				modelAndViewObj.addObject("warehouseLocationsList", warehouseLocationsList);
				modelAndViewObj.addObject("cloudLocationsList", cloudLocationsList);
				modelAndViewObj.addObject("issueFeildNames", loginFormObj.getFieldNames());
				modelAndViewObj.addObject("role",new Role());
				modelAndViewObj.setViewName("UserAccessControl/Roles/newRole");
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
		
		
		
		
		/**
		 * 
		 * @author Mythri.S
		 * 
		 *This method is used to create role and display the response 
		 *
		 **/
		
		@RequestMapping(value="/createRole",method=RequestMethod.POST,consumes="application/json")
		public ModelAndView createRole(@RequestBody Role roleObj,HttpServletRequest request,HttpServletResponse response){
			try{
				// log.info("createRole");
				ArrayList<String> wareHouseLocations=new ArrayList<String>();
				ArrayList<String> consoleLocations=new ArrayList<String>();
				ArrayList<String> outletLocations=new ArrayList<String>();
				String outlet="outlet";
				String wareHouse="wareHouse";
				String console="console";
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				String result = roleServiceObj.createRole(roleObj,customerIdStr,emailIdStr);
				List<String> outletLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr, emailIdStr,false);
				
				List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
				if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
					 zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"0","","");
					request.getSession().setAttribute("zoneList", zoneList);
				}
				for (ZoneMaster zoneMaster : zoneList) {
					outletLocationsList.add(zoneMaster.getZoneID());
				}
				List<String> warehouseLocationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,false);
				List<String> cloudLocationsList = adminServiceObj.getAllLocationsList(customerIdStr, emailIdStr,false);
				List<Workflows> workflowsList = roleServiceObj.getWorkflows("-1","");
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("workflowsList", workflowsList);
				modelAndViewObj.addObject("outletLocationsList", outletLocationsList);
				modelAndViewObj.addObject("warehouseLocationsList", warehouseLocationsList);
				modelAndViewObj.addObject("cloudLocationsList", cloudLocationsList);
				if(!result.equals(AppProperties.getAppMessageByProperty("ROLE_CREATE_SUCCESS").trim())){
					modelAndViewObj.addObject("err",result);
					List<String> locationsList = new ArrayList<String>();
					if(roleObj.getRoleLocations() != null)
						for(RoleLocations roleLocations : roleObj.getRoleLocations())
							locationsList.add(roleLocations.getLocation());
					//roleObj.setRoleLocations(null);
					roleObj.setLocations(locationsList);
					
					String accessControlList = gson.toJson(roleObj.getAccessControl());
					roleObj.setAccessControl(null);
					roleObj.setActivitiesStr(roleServiceObj.getActivityAccessControlList(roleObj.getAccessControlActivity()));
					roleObj.setAccessControlActivity(null);
					
					
					//written by manasa
					//purpose:locations should not be clear when we submit form.
					if(roleObj.getRoleLocations() != null)
					for(RoleLocations rList:roleObj.getRoleLocations())
					{
						String remarks = rList.getRemarks();
					
						if (outlet.equals(remarks))
						{
						
							outletLocations.add(rList.getLocation());
							
						}
						if (wareHouse.equals(remarks))
						{
						
							wareHouseLocations.add(rList.getLocation());
							
						}
						if (console.equals(remarks))
						{
				
							consoleLocations.add(rList.getLocation());
							
						}
						
					}

               modelAndViewObj.addObject("outletLocations",  gson.toJson(outletLocations));
				modelAndViewObj.addObject("wareHouseLocations",  gson.toJson(wareHouseLocations));
				modelAndViewObj.addObject("consoleLocations",  gson.toJson(consoleLocations));
					
					modelAndViewObj.addObject("accessControlList", accessControlList);
					modelAndViewObj.addObject("role",roleObj);
				}
				else{
					modelAndViewObj.addObject("success",result);
					modelAndViewObj.addObject("role",new Role());
				}
				modelAndViewObj.setViewName("UserAccessControl/Roles/newRole");
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
	 *This method is used to create role and display the response 
	 *
	 **//*
	
	@RequestMapping(value="/createRole",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createRole(@RequestBody Role roleObj,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("createRole");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String result = roleServiceObj.createRole(roleObj,customerIdStr,emailIdStr);
			List<String> outletLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr, emailIdStr,false);
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"0");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			for (ZoneMaster zoneMaster : zoneList) {
				outletLocationsList.add(zoneMaster.getZoneID());
			}
			List<String> warehouseLocationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,false);
			List<Workflows> workflowsList = roleServiceObj.getWorkflows("-1");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("workflowsList", workflowsList);
			modelAndViewObj.addObject("outletLocationsList", outletLocationsList);
			modelAndViewObj.addObject("warehouseLocationsList", warehouseLocationsList);
			if(!result.equals(AppProperties.getAppMessageByProperty("ROLE_CREATE_SUCCESS").trim())){
				modelAndViewObj.addObject("err",result);
				List<String> locationsList = new ArrayList<String>();
				if(roleObj.getRoleLocations() != null)
					for(RoleLocations roleLocations : roleObj.getRoleLocations())
						locationsList.add(roleLocations.getLocation());
				roleObj.setRoleLocations(null);
				roleObj.setLocations(locationsList);
				String accessControlList = gson.toJson(roleObj.getAccessControl());
				roleObj.setAccessControl(null);
				roleObj.setActivitiesStr(roleServiceObj.getActivityAccessControlList(roleObj.getAccessControlActivity()));
				roleObj.setAccessControlActivity(null);
				modelAndViewObj.addObject("accessControlList", accessControlList);
				modelAndViewObj.addObject("role",roleObj);
			}
			else{
				modelAndViewObj.addObject("success",result);
				modelAndViewObj.addObject("role",new Role());
			}
			modelAndViewObj.setViewName("UserAccessControl/Roles/newRole");
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
	 *This method is used to display the viewRole JSP consisting of the details of the given roleName
	 *
	 **//*
	@RequestMapping("/viewRole")
	public ModelAndView viewRole(@RequestParam("roleName")String roleName,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("viewRole");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<Role> roleList = roleServiceObj.getRoleDetails(roleName,customerIdStr,emailIdStr,"0");
			String accessControlList = gson.toJson(roleList.get(0).getAccessControl());
			roleList.get(0).setAccessControl(null);
			List<String> outletLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr, emailIdStr,true);
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"0");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			for (ZoneMaster zoneMaster : zoneList) {
				outletLocationsList.add(zoneMaster.getZoneID());
			}
			List<String> warehouseLocationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
			List<Workflows> workflowsList = roleServiceObj.getWorkflows("-1");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("workflowsList", workflowsList);
			modelAndViewObj.addObject("outletLocationsList", outletLocationsList);
			modelAndViewObj.addObject("warehouseLocationsList", warehouseLocationsList);
			modelAndViewObj.addObject("accessControlList", accessControlList);
			modelAndViewObj.addObject("role",roleList.get(0));
			modelAndViewObj.setViewName("UserAccessControl/Roles/viewRole");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}*/
	
		
		
		
		
		/**
		 * 
		 * @author Mythri.S
		 * 
		 *This method is used to display the viewRole JSP consisting of the details of the given roleName
		 *@modifiedBy: vijay
		 *@modifiedDate:8-11-17
		 *@modificationDescription:implemented locations
		 *@reviewedBy:
		 *@reviewDate:
		 **/
		@RequestMapping("/viewRole")
		public ModelAndView viewRole(@RequestParam("roleName")String roleName,HttpServletRequest request,HttpServletResponse response) {
			try{
				// log.info("viewRole");
				ArrayList<String> wareHouseLocations=new ArrayList<String>();
				ArrayList<String> consoleLocations=new ArrayList<String>();
				ArrayList<String> outletLocations=new ArrayList<String>();
				String outlet="outlet";
				String wareHouse="wareHouse";
				String console="console";
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				List<Role> roleList = roleServiceObj.getRoleDetails(roleName,customerIdStr,emailIdStr,"0","10","");
				String accessControlList = gson.toJson(roleList.get(0).getAccessControl());
				roleList.get(0).setAccessControl(null);
				
				List <RoleLocations> roleLocationList = roleList.get(0).getRoleLocations();
				
				
				List<String> outletLocationsList = adminServiceObj.getOutletLocationsList("1", emailIdStr,true);
				List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
				if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
					 zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"0","","");
					request.getSession().setAttribute("zoneList", zoneList);
				}
				for (ZoneMaster zoneMaster : zoneList) {
					outletLocationsList.add(zoneMaster.getZoneID());
				}
				
			
				for(RoleLocations rList:roleLocationList)
				{
					String remarks = rList.getRemarks();
					if (outlet.equals(remarks))
					{
					
						outletLocations.add(rList.getLocation());
						
					}
					if (wareHouse.equals(remarks))
					{
					
						wareHouseLocations.add(rList.getLocation());
						
					}
					if (console.equals(remarks))
					{
			
						consoleLocations.add(rList.getLocation());
						
					}
				}
				
				
				List<String> warehouseLocationsList = adminServiceObj.getWarehouseLocationsList("1", emailIdStr,true);
				/*List<String> cloudLocationsList = adminServiceObj.getAllLocationsList("1", emailIdStr,false);*/
				ArrayList<LocationBean> cloudLocationsList = adminServiceObj.getLocationsListofAll("1", emailIdStr,false);

				List<Workflows> workflowsList = roleServiceObj.getWorkflows("-1","");
				
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("workflowsList", workflowsList);
				modelAndViewObj.addObject("outletLocationsList", outletLocationsList);
				modelAndViewObj.addObject("warehouseLocationsList", warehouseLocationsList);
				modelAndViewObj.addObject("accessControlList", accessControlList);
				modelAndViewObj.addObject("outletLocations",  gson.toJson(outletLocations));
				modelAndViewObj.addObject("wareHouseLocations",  gson.toJson(wareHouseLocations));
				modelAndViewObj.addObject("cloudLocationsList",cloudLocationsList);
				modelAndViewObj.addObject("consoleLocations",  gson.toJson(consoleLocations));
				modelAndViewObj.addObject("role",roleList.get(0));
				modelAndViewObj.setViewName("UserAccessControl/Roles/viewRole");
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
		
		
		
		
		
		/**
		 * 
		 * @author Mythri.S
		 * 
		 *This method is used to display the editRole JSP consisting of the details of the given roleName
		 *
		 *@modifiedBy: vijay
		 *@modifiedDate:8-11-17
		 *@modificationDescription:implemented locations
		 *@reviewedBy:
		 *@reviewDate:
		 **/
		@RequestMapping("/editRole")
		public ModelAndView editRole(@RequestParam("roleName")String roleName,HttpServletRequest request,HttpServletResponse response) {
			try{
				// log.info("editRole");
				ArrayList<String> wareHouseLocations=new ArrayList<String>();
				ArrayList<String> consoleLocations=new ArrayList<String>();
				ArrayList<String> outletLocations=new ArrayList<String>();
				String outlet="outlet";
				String wareHouse="wareHouse";
				String console="console";
				
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				List<Role> roleList = roleServiceObj.getRoleDetails(roleName,customerIdStr,emailIdStr,"0","10","");
				//System.out.println("ROLESS:: EDIT ::"+gson.toJson(roleList.get(0)));
				List<String> outletLocationsList = adminServiceObj.getOutletLocationsList("1", emailIdStr,true);
				List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
				List <RoleLocations> roleLocationList = roleList.get(0).getRoleLocations();
				List<String> cloudLocationsList = adminServiceObj.getAllLocationsList("1", emailIdStr,false);

				if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
					 zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"0","","");
					request.getSession().setAttribute("zoneList", zoneList);
				}
				for (ZoneMaster zoneMaster : zoneList) {
					outletLocationsList.add(zoneMaster.getZoneID());
				}
				for(RoleLocations rList:roleLocationList)
				{
					String remarks = rList.getRemarks();
				
					if (outlet.equals(remarks))
					{
					
						outletLocations.add(rList.getLocation());
						
					}
					if (wareHouse.equals(remarks))
					{
					
						wareHouseLocations.add(rList.getLocation());
						
					}
					if (console.equals(remarks))
					{
			
						consoleLocations.add(rList.getLocation());
						
					}
					
				}
				List<String> warehouseLocationsList = adminServiceObj.getWarehouseLocationsList("1", emailIdStr,true);
				List<Workflows> workflowsList = roleServiceObj.getWorkflows("-1","");
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("workflowsList", workflowsList);
				modelAndViewObj.addObject("outletLocationsList", outletLocationsList);
				modelAndViewObj.addObject("warehouseLocationsList", warehouseLocationsList);
				
				String accessControlList = gson.toJson(roleList.get(0).getAccessControl());
				roleList.get(0).setAccessControl(null);
				modelAndViewObj.addObject("outletLocations",  gson.toJson(outletLocations));
				modelAndViewObj.addObject("wareHouseLocations",  gson.toJson(wareHouseLocations));
				modelAndViewObj.addObject("consoleLocations",  gson.toJson(consoleLocations));
				//////////System.out.println(gson.toJson(outletLocations));
				modelAndViewObj.addObject("cloudLocationsList",  cloudLocationsList);
				modelAndViewObj.addObject("accessControlList", accessControlList);
				modelAndViewObj.addObject("role",roleList.get(0));
				modelAndViewObj.setViewName("UserAccessControl/Roles/editRole");
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
		
		
		
		
		/**
		 * 
		 * @author Mythri.S
		 * 
		 *This method is used to update role and display the response 
		 *@modifiedBy: vijay
		 *@modifiedDate:8-11-17
		 *@modificationDescription:implemented locations
		 *@reviewedBy:
		 *@reviewDate:
		 *
		 **/
		@RequestMapping(value="/updateRole",method=RequestMethod.POST,consumes="application/json")
		public ModelAndView updateRole(@RequestBody Role roleObj,HttpServletRequest request,HttpServletResponse response){
			try{
				// log.info("updateRole");
				List <RoleLocations> roleLocationList =null;
				ArrayList<String> wareHouseLocations=new ArrayList<String>();
				ArrayList<String> consoleLocations=new ArrayList<String>();
				ArrayList<String> outletLocations=new ArrayList<String>();
				String outlet="outlet";
				String wareHouse="wareHouse";
				String console="console";
				
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				roleObj.setCreatedBy(emailIdStr);
			//	////////System.out.println(gson.toJson(roleObj));
				String result = roleServiceObj.updateRole(roleObj,customerIdStr,emailIdStr);
				List<String> outletLocationsList = adminServiceObj.getOutletLocationsList("1", emailIdStr,true);
				List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
				if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
					 zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"0","","");
					request.getSession().setAttribute("zoneList", zoneList);
				}
				for (ZoneMaster zoneMaster : zoneList) {
					outletLocationsList.add(zoneMaster.getZoneID());
				}
				
				List<String> warehouseLocationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
				List<Workflows> workflowsList = roleServiceObj.getWorkflows("-1","");
				List<String> cloudLocationsList = adminServiceObj.getAllLocationsList("1", emailIdStr,false);

				modelAndViewObj = new ModelAndView();
			
				
				String accessControlList = gson.toJson(roleObj.getAccessControl());
		
				
				roleObj.setAccessControl(null);
				roleObj.setActivitiesStr(roleServiceObj.getActivityAccessControlList(roleObj.getAccessControlActivity()));
				roleObj.setAccessControlActivity(null);
				
				if(roleObj.getRoleLocations() != null )
				{
					roleLocationList = roleObj.getRoleLocations();
				}
				for(RoleLocations rList:roleLocationList)
				{
					String remarks = rList.getRemarks();
					if (outlet.equals(remarks))
					{
					
						outletLocations.add(rList.getLocation());
						
					}
					if (wareHouse.equals(remarks))
					{
					
						wareHouseLocations.add(rList.getLocation());
						
					}
					if (console.equals(remarks))
					{
			
						consoleLocations.add(rList.getLocation());
						
					}
				}
				
				
				if(!result.equals(AppProperties.getAppMessageByProperty("ROLE_UPDATE_SUCCESS").trim()))
					modelAndViewObj.addObject("err",result);
				else
					modelAndViewObj.addObject("success",result);
				modelAndViewObj.addObject("workflowsList", workflowsList);
				modelAndViewObj.addObject("outletLocationsList", outletLocationsList);
				modelAndViewObj.addObject("warehouseLocationsList", warehouseLocationsList);
				modelAndViewObj.addObject("cloudLocationsList", cloudLocationsList);
				modelAndViewObj.addObject("outletLocations",  gson.toJson(outletLocations));
				modelAndViewObj.addObject("wareHouseLocations",  gson.toJson(wareHouseLocations));
				modelAndViewObj.addObject("consoleLocations",  gson.toJson(consoleLocations));
				modelAndViewObj.addObject("accessControlList", accessControlList);
				modelAndViewObj.addObject("role",roleObj);
				modelAndViewObj.addObject("maxRecords",roleObj.getMaxRecords());
				modelAndViewObj.setViewName("UserAccessControl/Roles/editRole");
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
	 *This method is used to display the editRole JSP consisting of the details of the given roleName
	 *
	 **//*
	@RequestMapping("/editRole")
	public ModelAndView editRole(@RequestParam("roleName")String roleName,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("editRole");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<Role> roleList = roleServiceObj.getRoleDetails(roleName,customerIdStr,emailIdStr,"0");
			List<String> outletLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr, emailIdStr,true);
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"0");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			for (ZoneMaster zoneMaster : zoneList) {
				outletLocationsList.add(zoneMaster.getZoneID());
			}
			List<String> warehouseLocationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
			List<Workflows> workflowsList = roleServiceObj.getWorkflows("-1");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("workflowsList", workflowsList);
			modelAndViewObj.addObject("outletLocationsList", outletLocationsList);
			modelAndViewObj.addObject("warehouseLocationsList", warehouseLocationsList);
			String accessControlList = gson.toJson(roleList.get(0).getAccessControl());
			roleList.get(0).setAccessControl(null);
			modelAndViewObj.addObject("accessControlList", accessControlList);
			modelAndViewObj.addObject("role",roleList.get(0));
			modelAndViewObj.setViewName("UserAccessControl/Roles/editRole");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	*/
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to update role and display the response 
	 *
	 **//*
	
	@RequestMapping(value="/updateRole",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView updateRole(@RequestBody Role roleObj,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("updateRole");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			roleObj.setCreatedBy(emailIdStr);
			////////System.out.println(gson.toJson(roleObj));
			String result = roleServiceObj.updateRole(roleObj,customerIdStr,emailIdStr);
			List<String> outletLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr, emailIdStr,true);
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"0");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			for (ZoneMaster zoneMaster : zoneList) {
				outletLocationsList.add(zoneMaster.getZoneID());
			}
			
			List<String> warehouseLocationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
			List<Workflows> workflowsList = roleServiceObj.getWorkflows("-1");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("workflowsList", workflowsList);
			modelAndViewObj.addObject("outletLocationsList", outletLocationsList);
			modelAndViewObj.addObject("warehouseLocationsList", warehouseLocationsList);
			String accessControlList = gson.toJson(roleObj.getAccessControl());
			List<String> locationsList = new ArrayList<String>();
			if(roleObj.getRoleLocations() != null)
				for(RoleLocations roleLocations : roleObj.getRoleLocations())
					locationsList.add(roleLocations.getLocation());
			roleObj.setRoleLocations(null);
			roleObj.setLocations(locationsList);
			roleObj.setAccessControl(null);
			roleObj.setActivitiesStr(roleServiceObj.getActivityAccessControlList(roleObj.getAccessControlActivity()));
			roleObj.setAccessControlActivity(null);
			if(!result.equals(AppProperties.getAppMessageByProperty("ROLE_UPDATE_SUCCESS").trim()))
				modelAndViewObj.addObject("err",result);
			else
				modelAndViewObj.addObject("success",result);
			modelAndViewObj.addObject("accessControlList", accessControlList);
			modelAndViewObj.addObject("role",roleObj);
			modelAndViewObj.setViewName("UserAccessControl/Roles/editRole");
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
	 *This method is used to delete Roles
	 *
	 **/
	@RequestMapping("/deleteRole")
	public ModelAndView deleteRole(@RequestParam("ids") String ids,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("deleteRole ");
			int start = 1,end = 10;
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			String resultStr = roleServiceObj.deleteRole(customerId,emailId,ids);
			List<Role> roleList = roleServiceObj.getRoleDetails(null,customerId,emailId,"0","10","");
			modelAndViewObj = new ModelAndView();
			if(roleList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(roleList.size()<10){
					end = (roleList.size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(roleList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("roleList",roleList);
			modelAndViewObj.addObject("err", resultStr);
			modelAndViewObj.setViewName("UserAccessControl/Roles/rolesMaster");
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
	 *This method is used to display all the user Details in a Table Format
	 *
	 **/
	@RequestMapping("/userDetails")
	public ModelAndView viewUserDetails(@RequestParam("userLocation") String userLocation,@RequestParam("roleName") String roleName,@RequestParam("type") String type,@RequestParam("maxRecords") String maxRecords,@RequestParam("index")String index,@RequestParam("searchName")String searchName,HttpServletRequest request,HttpServletResponse response) {
		String locationListAll="";
		try{
		/*	ModelAndView mv = (ModelAndView)request.getSession().getAttribute(LastModelAndViewInterceptor.LAST_MODEL_VIEW_ATTRIBUTE);
			// log.info("view Name::::"+mv.getViewName());*/
			// log.info("viewUserDetails called");
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			
			
			 List<String> locationsListValue=new ArrayList<String>();
//				List<LocationBean> workLocationsList =(List<LocationBean>)request.getSession().getAttribute("locationDetails");
			List<LocationBean> workLocationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
	  			if(userLocation.equals("all")|| userLocation.equals("")){
					if(workLocationsList != null){
							for(int i=0;i<workLocationsList.size();i++){
								locationsListValue.add(workLocationsList.get(i).getLocationId());
							}
						for (String string : locationsListValue) {
							locationListAll = locationListAll+string+",";
						}
					}
					
				}
			
	  		List<Role> roleList = roleServiceObj.getRoleDetails(null,customerId,emailId,"-1","10","");
			ArrayList<UserDetails> userDetails = userServiceObj.getUserDetails(type,customerId, emailId,index,searchName,maxRecords,locationListAll,userLocation,roleName);
			modelAndViewObj = new ModelAndView();
			if(userDetails == null || userDetails.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(userDetails.size()<end){
					end = (userDetails.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(userDetails.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
		//	////////System.out.println((Integer.parseInt(index)+start));
			modelAndViewObj.addObject("userDetails", userDetails);
			modelAndViewObj.addObject("type", type);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
			modelAndViewObj.addObject("searchName", searchName);
			modelAndViewObj.addObject("roleList", roleList);
			modelAndViewObj.addObject("userLocation", userLocation);
			modelAndViewObj.addObject("roleName", roleName);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.setViewName("UserAccessControl/Users/userDetails");
		}catch(Exception exception){
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
	@RequestMapping("/newUser")
	public ModelAndView newUser(@RequestParam("type") String type,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("newUser ");
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			List<Role> roleList = roleServiceObj.getRoleDetails(null,customerId,emailId,"-1","10","");
			List<String> workLocationsList = adminServiceObj.getLocationsList(customerId,emailId,null);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("roleList", roleList);
			modelAndViewObj.addObject("type",type);
			modelAndViewObj.setViewName("UserAccessControl/Users/newUser");
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
	 *This method is used to save the details of the New User and return the response
	 *
	 **/
	@RequestMapping(value="/createUser",method=RequestMethod.POST)
	public ModelAndView createUser(@RequestParam("formData") String formData,@RequestParam("type") String type, HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("createUser ");
			// log.info(type);
			UserDetails userDetails = new Gson().fromJson(formData, UserDetails.class);
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			userDetails.setAccountStatus("active");
			List<String> workLocationsList = adminServiceObj.getLocationsList(customerId,emailId,null);
			String status = new ServerSideValidations().newUserForm(userDetails);
			List<Role> roleList = roleServiceObj.getRoleDetails(null,customerId,emailId,"-1","10","");
			modelAndViewObj = new ModelAndView();
			//////////System.out.println(status);
			if(status.equalsIgnoreCase(Constants.SUCCESS)){//server-side validations success
				String url = request.getRequestURL().toString();
				String contextPath = request.getContextPath();
				int index = url.lastIndexOf(contextPath);
				String ipAdd = url.substring(0, index);
				url = ipAdd + contextPath;
				userDetails.setUrl(url);
				String resultStr = userServiceObj.isUserCreated(userDetails,customerId,emailId);
				
				if(!resultStr.equals(AppProperties.getAppMessageByProperty("USER_CREATE_SUCCESS")))
				{
					modelAndViewObj.addObject("email", userDetails.getEmail());
					modelAndViewObj.addObject("password", userDetails.getPassword());
					modelAndViewObj.addObject("confirmPwd", userDetails.getConfirmPassword());
					modelAndViewObj.addObject("contactOffice", userDetails.getContactOffice());
					modelAndViewObj.addObject("contactPersonal", userDetails.getContactPersonnel());
					modelAndViewObj.addObject("firstname", userDetails.getFirstName());
					modelAndViewObj.addObject("lastname", userDetails.getLastName());
					modelAndViewObj.addObject("worklocation", userDetails.getWorkLocation());
					modelAndViewObj.addObject("specialChar", "-");
				//	modelAndViewObj.addObject("role", userDetails.getRole());
					modelAndViewObj.addObject("empId", userDetails.getEmployeeId());
					modelAndViewObj.addObject("err", resultStr);
				}
				else
					modelAndViewObj.addObject("success", resultStr);
					// log.info(resultStr);
				//modelAndViewObj.addObject("userDetails", userDetails);
				
			}else
			modelAndViewObj.addObject("err",status);
			modelAndViewObj.addObject("roleList", roleList);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("type", type);
			modelAndViewObj.setViewName("UserAccessControl/Users/newUser");
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
	 *This method is used to display edit user form consisting of the userDetails
	 *
	 **/
	@RequestMapping("/editUser")
	public ModelAndView editUser(@RequestParam("userLocation") String userLocation,@RequestParam("roleName") String roleName,@RequestParam("maxRecords") String maxRecords,@RequestParam("email") String email,@RequestParam("type") String type,@RequestParam("operation") String operation,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("editUser ");
			// log.info(type);
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			UserDetails userDetails = userServiceObj.getUser(email,customerId, emailId);
			List<String> workLocationsList = adminServiceObj.getLocationsList(customerId,emailId,null);
			List<Role> roleList = roleServiceObj.getRoleDetails(null,customerId,emailId,"-1","10","");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("userDetails", userDetails);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("roleList", roleList);
			modelAndViewObj.addObject("type", type);
			modelAndViewObj.addObject("userLocation", userLocation);
			modelAndViewObj.addObject("roles", roleName);
			modelAndViewObj.addObject("maxRecords", maxRecords);
			if(operation.equals("view"))
				modelAndViewObj.setViewName("UserAccessControl/Users/viewUser");
			else
				modelAndViewObj.setViewName("UserAccessControl/Users/editUser");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to save the details of the Existing User and return the response
	 *
	 **/
	@RequestMapping(value="/updateUser",method=RequestMethod.POST)
	public ModelAndView updateUser(@RequestParam("maxRecords") String maxRecords,@RequestParam("formData") String formData,@RequestParam("type") String type, HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("updateUser ");
			// log.info(type);
			UserDetails userDetails = new Gson().fromJson(formData, UserDetails.class);
			// log.info(userDetails.getFirstName());
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			List<String> workLocationsList = adminServiceObj.getLocationsList(customerId,emailId,null);
			List<Role> roleList = roleServiceObj.getRoleDetails(null,customerId,emailId,"-1","10","");
			modelAndViewObj = new ModelAndView();
			String resultStr = userServiceObj.updateUser(userDetails,customerId,emailId);
			
			
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("USER_UPDATE_SUCCESS").trim())){
				modelAndViewObj.addObject("err", resultStr);
				modelAndViewObj.setViewName("UserAccessControl/Users/editUser");
				//modelAndViewObj.addObject("type", "new");
			}else{
				modelAndViewObj.addObject("success", resultStr);
				modelAndViewObj.setViewName("UserAccessControl/Users/editUser");
			}
			
			//modelAndViewObj.addObject("err", resultStr);
			modelAndViewObj.addObject("type", type);
			modelAndViewObj.addObject("userDetails", userDetails);
			modelAndViewObj.addObject("roleList", roleList);
			modelAndViewObj.addObject("maxRecords", maxRecords);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.setViewName("UserAccessControl/Users/editUser");
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
	 *This method is used to delete Users
	 *
	 **/
	@RequestMapping("/deleteUser")
	public ModelAndView deleteUser(@RequestParam("ids") String ids,@RequestParam("type") String type,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("deleteUser ");
			int start = 1,end = Integer.parseInt("10");
			String index="0";
			modelAndViewObj = new ModelAndView();
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			String resultStr = userServiceObj.deleteUser(customerId,emailId,ids);
			ArrayList<UserDetails> userDetails = userServiceObj.getUserDetails(type,customerId, emailId,"0","","","","","");
			if(userDetails == null || userDetails.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(userDetails.size()<end){
					end = (userDetails.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				/*if(userDetails.size()<10){
					end = (userDetails.size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}*/
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(userDetails.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("maxRecords", Integer.parseInt("10"));
			}
			modelAndViewObj.addObject("userDetails", userDetails);
			modelAndViewObj.addObject("type", type);
			modelAndViewObj.addObject("err", resultStr);
			modelAndViewObj.setViewName("UserAccessControl/Users/userDetails");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}

	
/*manideep*/	
	
	
	@RequestMapping("/showFinantialManagementFlow")
	public ModelAndView showFinantialManagementFlow(HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("FinantialManagement/FinantialManagementFlow");
		return modelAndViewObj;
	}
	
	
	
	@RequestMapping("/showAccountingFlow")
	public ModelAndView showAccountingFlow(HttpServletRequest request,HttpServletResponse response){
		// log.info("showUsersFlow");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("FinantialManagement/AccountingFlow");
		return modelAndViewObj;
	}
	
	
	@RequestMapping("/ShowOrganizationMaster")
	public ModelAndView ShowOrganizationMaster(@RequestParam("OrganizationId") String OrganizationId,@RequestParam("index") String startIndex,HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		//OrganizationMaster organizationMaster = new OrganizationMaster();
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);
		ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
		modelAndViewObj = new ModelAndView();
	
		ArrayList<String> selectedlocation =new ArrayList<String>();
		if(OrganizationList.get(0).getOrganizationLocations()!=null){
			for(int i=0;i<OrganizationList.get(0).getOrganizationLocations().size();i++){
				selectedlocation.add(OrganizationList.get(0).getOrganizationLocations().get(i).getLocationId());
			}			
		}
	
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		modelAndViewObj.addObject("selectedlocation", selectedlocation);
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.setViewName("FinantialManagement/ShowOrganizationMaster");
		return modelAndViewObj;
	}
	
	@RequestMapping("/viewOrganizationMaster")
	public ModelAndView viewOrganizationMaster(@RequestParam("OrganizationId") String OrganizationId,@RequestParam("zone") String zone,@RequestParam("location") String location,@RequestParam("accountType") String accountType,@RequestParam("status") String status,@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,@RequestParam("searchCriteria") String searchCriteria,
			@RequestParam("index") String index,@RequestParam("maxRecords") String maxRecords,HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		
		int start = 1;
		int end;
		
		if(maxRecords.equals(""))
			end=Integer.parseInt("0");
		else
			end=Integer.parseInt(maxRecords);
		
		
		if(index.equals(""))
			index="0";
		
		//OrganizationMaster organizationMaster = new OrganizationMaster();
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.viewOrganizationMaster(customerId, emailId,OrganizationId,zone,location,accountType,status,startDate,endDate,searchCriteria,index);
		ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
		modelAndViewObj = new ModelAndView();
		if(OrganizationList == null || OrganizationList.size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");		
		}else{
			if(OrganizationList.size()<end){
				end = (OrganizationList.size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			
			modelAndViewObj.addObject("totalRecords",(OrganizationList.get(0).getTotalRecords()));
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt("10"));
		}
		
		
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		modelAndViewObj.addObject("locationsList", locationsList);
		
		modelAndViewObj.addObject("zone", zone);
		modelAndViewObj.addObject("accountType", accountType);
		modelAndViewObj.addObject("startDate", startDate);
		modelAndViewObj.addObject("endDate", endDate);
		modelAndViewObj.addObject("selectedLocation", location);
		modelAndViewObj.addObject("status", status);
		
		modelAndViewObj.setViewName("FinantialManagement/OrganizationMaster");
		return modelAndViewObj;
	}

	@RequestMapping("/EditOrganizationMaster")
	public ModelAndView EditOrganizationMaster(@RequestParam("OrganizationId") String OrganizationId,HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		//OrganizationMaster organizationMaster = new OrganizationMaster();
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);
		ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
		modelAndViewObj = new ModelAndView();
		
		ArrayList<String> selectedlocation =new ArrayList<String>();
		if(OrganizationList.get(0).getOrganizationLocations()!=null){
			for(int i=0;i<OrganizationList.get(0).getOrganizationLocations().size();i++){
				selectedlocation.add(OrganizationList.get(0).getOrganizationLocations().get(i).getLocationId());
			}			
		}
		
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		modelAndViewObj.addObject("selectedlocation", selectedlocation);
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.setViewName("FinantialManagement/EditOrganizationMaster");
		return modelAndViewObj;
	}
	
	
	@RequestMapping("/EditFinantialAssetsFlow")
	public ModelAndView EditFinantialAssetsFlow(@RequestParam("OrganizationId") String OrganizationId,@RequestParam("AccountId") String AccountId,HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		//OrganizationMaster organizationMaster = new OrganizationMaster();
		List<AccountTypeMaster> AssetsList = genericMasterServiceObj.getAssetsMaster(customerId, emailId,OrganizationId,AccountId,"","","","","","","","");
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);

		//ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("AssetsList", AssetsList);
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		//modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.setViewName("FinantialManagement/EditAssetMaster");
		return modelAndViewObj;
	}
	
	@RequestMapping("/ViewFinantialAssetsFlow")
	public ModelAndView ViewFinantialAssetsFlow(@RequestParam("OrganizationId") String OrganizationId,@RequestParam("AccountId") String AccountId,@RequestParam("maxRecords") String maxRecords,@RequestParam("zone") String zone,@RequestParam("location") String location,@RequestParam("BusinessType") String BusinessType,@RequestParam("status") String status,@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,@RequestParam("index") String index,@RequestParam("searchCretiria") String searchCretiria,HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		
		//OrganizationMaster organizationMaster = new OrganizationMaster();
		List<AccountTypeMaster> AssetsList = genericMasterServiceObj.getAssetsMaster(customerId, emailId,OrganizationId,AccountId,zone,location,BusinessType,status,startDate,endDate,index,searchCretiria);
		ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("AssetsList", AssetsList);
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		modelAndViewObj.setViewName("FinantialManagement/viewAssetMaster");
		return modelAndViewObj;
	}	

	@RequestMapping("/ViewFinancialLiabilitiesFlow")
	public ModelAndView ViewFinancialLiabilitiesFlow(@RequestParam("OrganizationId") String OrganizationId,@RequestParam("AccountId") String AccountId,HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		//OrganizationMaster organizationMaster = new OrganizationMaster();
		List<AccountTypeMaster> AssetsList = genericMasterServiceObj.getLiabilitiesMaster(customerId, emailId,OrganizationId,AccountId,"","","","","","","","");
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);
		//ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("AssetsList", AssetsList);
		//modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		modelAndViewObj.setViewName("FinantialManagement/ViewLiabilityMaster");
		return modelAndViewObj;
	}	
	
	@RequestMapping("/EditFinancialLiabilitiesFlow")
	public ModelAndView EditFinancialLiabilitiesFlow(@RequestParam("OrganizationId") String OrganizationId,@RequestParam("AccountId") String AccountId,HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		//OrganizationMaster organizationMaster = new OrganizationMaster();
		List<AccountTypeMaster> AssetsList = genericMasterServiceObj.getLiabilitiesMaster(customerId, emailId,OrganizationId,AccountId,"","","","","","","","");
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);
		//ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("AssetsList", AssetsList);
		//modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		modelAndViewObj.setViewName("FinantialManagement/EditLiabilityMaster");
		return modelAndViewObj;
	}
	
	

	@RequestMapping("/ViewIncome")
	public ModelAndView ViewIncome(@RequestParam("OrganizationId") String OrganizationId,@RequestParam("AccountId") String AccountId,HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		//OrganizationMaster organizationMaster = new OrganizationMaster();
		List<AccountTypeMaster> AssetsList = genericMasterServiceObj.getaIncomeMaster(customerId, emailId,OrganizationId,AccountId,"","","","","","","","");
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);
		//ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("AssetsList", AssetsList);
		//modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		modelAndViewObj.setViewName("FinantialManagement/ViewIncomeMaster");
		return modelAndViewObj;
	}
	
	@RequestMapping("/EditIncome")
	public ModelAndView EditIncome(@RequestParam("OrganizationId") String OrganizationId,@RequestParam("AccountId") String AccountId,HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		//OrganizationMaster organizationMaster = new OrganizationMaster();
		List<AccountTypeMaster> AssetsList = genericMasterServiceObj.getaIncomeMaster(customerId, emailId,OrganizationId,AccountId,"","","","","","","","");
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);
		//ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("AssetsList", AssetsList);
		//modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		modelAndViewObj.setViewName("FinantialManagement/EditIncomeMaster");
		return modelAndViewObj;
	}
	
	@RequestMapping("/EditExpenses")
	public ModelAndView EditExpenses(@RequestParam("OrganizationId") String OrganizationId,@RequestParam("AccountId") String AccountId,HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		//OrganizationMaster organizationMaster = new OrganizationMaster();
		List<AccountTypeMaster> AssetsList = genericMasterServiceObj.getaExpencesMaster(customerId, emailId,OrganizationId,AccountId,"","","","","","","","");
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);
		//ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("AssetsList", AssetsList);
		//modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		modelAndViewObj.setViewName("FinantialManagement/EditExpensesMaster");
		return modelAndViewObj;
	}
	@RequestMapping("/ViewExpenses")
	public ModelAndView ViewExpenses(@RequestParam("OrganizationId") String OrganizationId,@RequestParam("AccountId") String AccountId,HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		//OrganizationMaster organizationMaster = new OrganizationMaster();
		List<AccountTypeMaster> AssetsList = genericMasterServiceObj.getaExpencesMaster(customerId, emailId,OrganizationId,AccountId,"","","","","","","","");
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);
		//ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("AssetsList", AssetsList);
		//modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		modelAndViewObj.setViewName("FinantialManagement/ViewExpensesMaster");
		return modelAndViewObj;
	}	
	
	@RequestMapping("/CreateOrganizationMaster")
	public ModelAndView CreateOrganizationMaster(HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		//OrganizationMaster organizationMaster = new OrganizationMaster();
		ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.setViewName("FinantialManagement/CreateOrganizationMaster");
		return modelAndViewObj;
	}
	
	
	@RequestMapping("/CreateAssetAccount")
	public ModelAndView CreateAssetAccount(@RequestParam("AccountId") String AccountId,@RequestParam("Location") String Location,HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		String OrganizationId ="";
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);

		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
	//	modelAndViewObj.addObject("accountTypeList", accountTypeList);
		modelAndViewObj.setViewName("FinantialManagement/CreateAssetMaster");
		return modelAndViewObj;
	}
	
	
	
	@RequestMapping("/CreateLiabilityAccount")
	public ModelAndView CreateLiabilityAccount(HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		String OrganizationId ="";
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);

		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		modelAndViewObj.setViewName("FinantialManagement/CreateLiabilityMaster");
		return modelAndViewObj;
	}
	
	@RequestMapping("/CreateIncomeAccount")
	public ModelAndView CreateIncomeAccount(HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		String OrganizationId ="";
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);

		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		modelAndViewObj.setViewName("FinantialManagement/CreateIncomeMaster");
		return modelAndViewObj;
	}
	
	@RequestMapping("/CreateExpensesAccount")
	public ModelAndView CreateExpensesAccount(HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		String OrganizationId ="";
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);

		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		modelAndViewObj.setViewName("FinantialManagement/CreateExpensesMaster");
		return modelAndViewObj;
	}
	@RequestMapping("/createOrganizationMasterNew")
    public ModelAndView createOrganizationMasterNew(@RequestParam("location") List<String> location,@RequestParam("organization") String organization,
    		@RequestParam("incorporationName") String incorporationName,@RequestParam("discription") String discription,
    		@RequestParam("gstin") String gstin,@RequestParam("webSite") String webSite,@RequestParam("phoneNumber") String phoneNumber,
    		@RequestParam("email") String email,@RequestParam("incorporationType") String incorporationType,@RequestParam("address") String address,
    		@RequestParam("streetName") String streetName,@RequestParam("city") String city,@RequestParam("Area") String Area,@RequestParam("pinCode") String pinCode,
    		@RequestParam("businessType") String businessType,
    		@RequestParam("status") String status,@RequestParam("panNo") String panNo,@RequestParam("bankAccNo") String bankAccNo,
                    HttpServletRequest request,HttpServletResponse response){
            // log.info("showUserAccessControlFlow");
            String customerId = (String)request.getSession().getAttribute("customerId");
            String emailId = (String)request.getSession().getAttribute("emailId");
            String resultStr = genericMasterServiceObj.createOrganizationMaster(customerId,emailId,location,organization,incorporationName,discription,gstin,webSite,phoneNumber,email,incorporationType,address,status,panNo,bankAccNo,streetName,city,Area,pinCode,businessType);
            modelAndViewObj = new ModelAndView();
            modelAndViewObj.addObject("resultStr", resultStr);
            modelAndViewObj.setViewName("FinantialManagement/CreateOrganizationMaster");
            return modelAndViewObj;
    }

	
	
	
	@RequestMapping("/createAssetMasterNew")
	public ModelAndView createAssetMasterNew(@RequestParam("OrganizationId") String OrganizationId,@RequestParam("accountId") String accountId,@RequestParam("accountName") String accountName,@RequestParam("discription") String discription,@RequestParam("accountType") String accountType,@RequestParam("Status") String Status,
			HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		String resultStr = genericMasterServiceObj.createAssetMaster(customerId,emailId,OrganizationId,accountId,accountName,discription,accountType,Status);
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);

		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("resultStr", resultStr);
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		modelAndViewObj.setViewName("FinantialManagement/CreateAssetMaster");
		return modelAndViewObj;
	}

	
	
	@RequestMapping("/createLiabilityMasterNew")
	public ModelAndView createLiabilityMasterNew(@RequestParam("OrganizationId") String OrganizationId,@RequestParam("accountId") String accountId,@RequestParam("accountName") String accountName,@RequestParam("discription") String discription,@RequestParam("accountType") String accountType,@RequestParam("Status") String Status,
			HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		String resultStr = genericMasterServiceObj.createAssetMaster(customerId,emailId,OrganizationId,accountId,accountName,discription,accountType,Status);
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);

		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("resultStr", resultStr);
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		modelAndViewObj.setViewName("FinantialManagement/CreateLiabilityMaster");
		return modelAndViewObj;
	}
	
	@RequestMapping("/createIncomeMasterNew")
	public ModelAndView createIncomeMasterNew(@RequestParam("OrganizationId") String OrganizationId,@RequestParam("accountId") String accountId,@RequestParam("accountName") String accountName,@RequestParam("discription") String discription,@RequestParam("accountType") String accountType,@RequestParam("Status") String Status,
			HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		String resultStr = genericMasterServiceObj.createAssetMaster(customerId,emailId,OrganizationId,accountId,accountName,discription,accountType,Status);
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);

		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("resultStr", resultStr);
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		modelAndViewObj.setViewName("FinantialManagement/CreateIncomeMaster");
		return modelAndViewObj;
	}
	
	@RequestMapping("/createExpensesMasterNew")
	public ModelAndView createExpensesMasterNew(@RequestParam("OrganizationId") String OrganizationId,@RequestParam("accountId") String accountId,@RequestParam("accountName") String accountName,@RequestParam("discription") String discription,@RequestParam("accountType") String accountType,@RequestParam("Status") String Status,
			HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		String resultStr = genericMasterServiceObj.createAssetMaster(customerId,emailId,OrganizationId,accountId,accountName,discription,accountType,Status);
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);

		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("resultStr", resultStr);
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		modelAndViewObj.setViewName("FinantialManagement/CreateExpensesMaster");
		return modelAndViewObj;
	}
	
	
	
	@RequestMapping("/editOrganizationMasterNew")
	public ModelAndView editOrganizationMasterNew(@RequestParam("location") List<String> location,@RequestParam("organization") String organization,
			@RequestParam("incorporationName") String incorporationName,@RequestParam("discription") String discription,
			@RequestParam("gstin") String gstin,@RequestParam("webSite") String webSite,@RequestParam("phoneNumber") String phoneNumber,
			@RequestParam("email") String email,@RequestParam("incorporationType") String incorporationType,@RequestParam("address") String address,
			@RequestParam("streetName") String streetName,@RequestParam("city") String city,@RequestParam("Area") String Area,@RequestParam("pinCode") String pinCode,
    		@RequestParam("businessType") String businessType,
			@RequestParam("status") String status,@RequestParam("panNo") String panNo,@RequestParam("bankAccNo") String bankAccNo,
			HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		String resultStr = genericMasterServiceObj.editOrganizationMaster(customerId,emailId,location,organization,incorporationName,discription,gstin,webSite,phoneNumber,email,incorporationType,address,status,panNo,bankAccNo,streetName,city,Area,pinCode,businessType);
		
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,organization);
		ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
		modelAndViewObj = new ModelAndView();
		
		
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("resultStr", resultStr);
		modelAndViewObj.setViewName("FinantialManagement/EditOrganizationMaster");
		return modelAndViewObj;
	}
	
	
	@RequestMapping("/editAssetMasterNew")
	public ModelAndView editAssetMasterNew(@RequestParam("OrganizationId") String OrganizationId,@RequestParam("accountId") String accountId,@RequestParam("accountName") String accountName,@RequestParam("discription") String discription,@RequestParam("accountType") String accountType,@RequestParam("Status") String Status,
			HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		String resultStr = genericMasterServiceObj.editAssetMaster(customerId,emailId,accountId,accountName,discription,accountType,Status,OrganizationId);
		List<AccountTypeMaster> AssetsList = genericMasterServiceObj.getAssetsMaster(customerId, emailId,accountId,"","","","","","","","","");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("AssetsList", AssetsList);
		modelAndViewObj.addObject("resultStr", resultStr);
		modelAndViewObj.setViewName("FinantialManagement/EditAssetMaster");
		return modelAndViewObj;
	}
	
	@RequestMapping("/editLiabilityMasterNew")
	public ModelAndView editLiabilityMasterNew(@RequestParam("OrganizationId") String OrganizationId,@RequestParam("accountId") String accountId,@RequestParam("accountName") String accountName,@RequestParam("discription") String discription,@RequestParam("accountType") String accountType,@RequestParam("Status") String Status,
			HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		String resultStr = genericMasterServiceObj.editAssetMaster(customerId,emailId,accountId,accountName,discription,accountType,Status,OrganizationId);
		List<AccountTypeMaster> AssetsList = genericMasterServiceObj.getLiabilitiesMaster(customerId, emailId,accountId,"","","","","","","","","");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("AssetsList", AssetsList);
		modelAndViewObj.addObject("resultStr", resultStr);
		modelAndViewObj.setViewName("FinantialManagement/EditLiabilityMaster");
		return modelAndViewObj;
	}
	
	@RequestMapping("/editIncomeMasterNew")
	public ModelAndView editIncomeMasterNew(@RequestParam("OrganizationId") String OrganizationId,@RequestParam("accountId") String accountId,@RequestParam("accountName") String accountName,@RequestParam("discription") String discription,@RequestParam("accountType") String accountType,@RequestParam("Status") String Status,
			HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		String resultStr = genericMasterServiceObj.editAssetMaster(customerId,emailId,accountId,accountName,discription,accountType,Status,OrganizationId);
		List<AccountTypeMaster> AssetsList = genericMasterServiceObj.getaIncomeMaster(customerId, emailId,accountId,"","","","","","","","","");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("AssetsList", AssetsList);
		modelAndViewObj.addObject("resultStr", resultStr);
		modelAndViewObj.setViewName("FinantialManagement/EditIncomeMaster");
		return modelAndViewObj;
	}
	
	@RequestMapping("/editExpensesMasterNew")
	public ModelAndView editExpensesMasterNew(@RequestParam("OrganizationId") String OrganizationId,@RequestParam("accountId") String accountId,@RequestParam("accountName") String accountName,@RequestParam("discription") String discription,@RequestParam("accountType") String accountType,@RequestParam("Status") String Status,
			HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		String resultStr = genericMasterServiceObj.editAssetMaster(customerId,emailId,accountId,accountName,discription,accountType,Status,OrganizationId);
		List<AccountTypeMaster> AssetsList = genericMasterServiceObj.getaExpencesMaster(customerId, emailId,accountId,"","","","","","","","","");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("AssetsList", AssetsList);
		modelAndViewObj.addObject("resultStr", resultStr);
		modelAndViewObj.setViewName("FinantialManagement/EditExpensesMaster");
		return modelAndViewObj;
	}
	
	@RequestMapping("/accountingLiabilities")
	public ModelAndView accountingLiabilities(HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("FinantialManagement/AccountingLiabilities");
		return modelAndViewObj;
	}
	
	
	
	
	
	/**
	 * 
	 * @author Harsha.K
	 * 
	 *This method is used to load Assets menu of Accounting menu of Financial Management
	 *
	 **/	
	@RequestMapping("/showFinantialAssetsFlow")
	public ModelAndView showFinantialAssetsFlow(@RequestParam("OrganizationId") String OrganizationId,@RequestParam("AccountId") String AccountId,@RequestParam("zone") String zone,@RequestParam("location") String location,@RequestParam("BusinessType") String BusinessType,@RequestParam("status") String status,@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,@RequestParam("maxRecords") String maxRecords,@RequestParam("index") String index,@RequestParam("searchCretiria") String searchCretiria,HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		int start = 1;
		int end;
		
		if(maxRecords.equals(""))
			end=Integer.parseInt("0");
		else
			end=Integer.parseInt(maxRecords);
		
		
		if(index.equals(""))
			index="0";
		//OrganizationMaster organizationMaster = new OrganizationMaster();
		List<AccountTypeMaster> AssetsList = genericMasterServiceObj.getAssetsMaster(customerId, emailId,OrganizationId,AccountId,zone,location,BusinessType,status,startDate,endDate,index,searchCretiria);
		ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);

		modelAndViewObj = new ModelAndView();
		
		if(AssetsList == null || AssetsList.size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(AssetsList.size()<end){
				end = (AssetsList.size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			
			modelAndViewObj.addObject("totalRecords",AssetsList.get(0).getTotalRecords());
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
			modelAndViewObj.addObject("maxRecords", 10);
			
			/*modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
			modelAndViewObj.addObject("maxRecords", 10);*/
		}
		modelAndViewObj.addObject("AssetsList", AssetsList);
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		
		modelAndViewObj.addObject("organization", OrganizationId);
		modelAndViewObj.addObject("zone", zone);
		modelAndViewObj.addObject("selectedLocation", location);
		modelAndViewObj.addObject("status", status);
		modelAndViewObj.addObject("startDate", startDate);
		modelAndViewObj.addObject("endDate", endDate);
		
		modelAndViewObj.setViewName("FinantialManagement/FinantialAssets");
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Harsha.K
	 * 
	 *This method is used to load Liabilities menu of Accounting menu of Financial Management
	 *
	 **/	
	@RequestMapping("/showFinancialLiabilitiesFlow")
	public ModelAndView showFinancialLiabilitiesFlow(@RequestParam("OrganizationId") String OrganizationId,@RequestParam("AccountId") String AccountId,@RequestParam("zone") String zone,@RequestParam("location") String location,@RequestParam("BusinessType") String BusinessType,@RequestParam("status") String status,@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,@RequestParam("maxRecords") String maxRecords,@RequestParam("index") String index,@RequestParam("searchCretiria") String searchCretiria,HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		int start = 1;
		int end;
		
		if(maxRecords.equals(""))
			end=Integer.parseInt("0");
		else
			end=Integer.parseInt(maxRecords);
		
		
		if(index.equals(""))
			index="0";
		
		//OrganizationMaster organizationMaster = new OrganizationMaster();
		List<AccountTypeMaster> AssetsList = genericMasterServiceObj.getLiabilitiesMaster(customerId, emailId,OrganizationId,AccountId,zone,location,BusinessType,status,startDate,endDate,index,searchCretiria);
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);
		ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
		modelAndViewObj = new ModelAndView();
		
		
		
		if(AssetsList == null || AssetsList.size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");		
		}else{
			if(AssetsList.size()<end){
				end = (AssetsList.size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}

			modelAndViewObj.addObject("totalRecords",(AssetsList.get(0).getTotalRecords()));
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt("10"));
		}	
		
		modelAndViewObj.addObject("AssetsList", AssetsList);
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		
		modelAndViewObj.addObject("OrganizationId", OrganizationId);
		modelAndViewObj.addObject("zone", zone);
		modelAndViewObj.addObject("selectedLocation", location);
		modelAndViewObj.addObject("status", status);
		modelAndViewObj.addObject("startDate", startDate);
		modelAndViewObj.addObject("endDate", endDate);
		
		modelAndViewObj.setViewName("FinantialManagement/AccountingLiabilities");
		return modelAndViewObj;
	}	
	
	/**
	 * 
	 * @author Harsha.K
	 * 
	 *This method is used to load Income menu of Accounting menu of Financial Management
	 *
	 **/	
	@RequestMapping("/showIncome")
	public ModelAndView showIncome(@RequestParam("OrganizationId") String OrganizationId,@RequestParam("AccountId") String AccountId,@RequestParam("zone") String zone,@RequestParam("location") String location,@RequestParam("BusinessType") String BusinessType,@RequestParam("status") String status,@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,@RequestParam("maxRecords") String maxRecords,@RequestParam("index") String index,@RequestParam("searchCritiria") String searchCritiria,HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		int start = 1;
		int end;
		
		if(maxRecords.equals(""))
			end=Integer.parseInt("0");
		else
			end=Integer.parseInt(maxRecords);
		
		
		if(index.equals(""))
			index="0";

		
		//OrganizationMaster organizationMaster = new OrganizationMaster();
		List<AccountTypeMaster> AssetsList = genericMasterServiceObj.getaIncomeMaster(customerId, emailId,OrganizationId,AccountId,zone,location,BusinessType,status,startDate,endDate,index,searchCritiria);
		ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);
		modelAndViewObj = new ModelAndView();
		
		if(AssetsList == null || AssetsList.size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");		
		}else{
			if(AssetsList.size()<end){
				end = (AssetsList.size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			
			modelAndViewObj.addObject("totalRecords",(AssetsList.get(0).getTotalRecords()));
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt("10"));
		}
	
		modelAndViewObj.addObject("AssetsList", AssetsList);
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		
		modelAndViewObj.addObject("OrganizationId", OrganizationId);
		modelAndViewObj.addObject("zone", zone);
		modelAndViewObj.addObject("selectedLocation", location);
		modelAndViewObj.addObject("status", status);
		modelAndViewObj.addObject("startDate", startDate);
		modelAndViewObj.addObject("endDate", endDate);
		
		modelAndViewObj.setViewName("FinantialManagement/Income");
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Harsha.K
	 * 
	 *This method is used to load Expenses menu of Accounting menu of Financial Management
	 *
	 **/	
	@RequestMapping("/showExpenses")
	public ModelAndView showExpenses(@RequestParam("OrganizationId") String OrganizationId,@RequestParam("AccountId") String AccountId,@RequestParam("zone") String zone,@RequestParam("location") String location,@RequestParam("BusinessType") String BusinessType,@RequestParam("status") String status,@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,@RequestParam("maxRecords") String maxRecords, @RequestParam("index") String index,@RequestParam("searchCritiria") String searchCritiria,HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		
		int start = 1;
		int end;
		
		if(maxRecords.equals(""))
			end=Integer.parseInt("0");
		else
			end=Integer.parseInt(maxRecords);
		
		
		if(index.equals(""))
			index="0";
		//OrganizationMaster organizationMaster = new OrganizationMaster();
		List<AccountTypeMaster> AssetsList = genericMasterServiceObj.getaExpencesMaster(customerId, emailId,OrganizationId,AccountId,zone,location,BusinessType,status,startDate,endDate,index,searchCritiria);
		ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);
		modelAndViewObj = new ModelAndView();
		
		if(AssetsList == null || AssetsList.size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");		
		}else{
			if(AssetsList.size()<end){
				end = (AssetsList.size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			
			modelAndViewObj.addObject("totalRecords",(AssetsList.get(0).getTotalRecords()));
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt("10"));
		}
		modelAndViewObj.addObject("AssetsList", AssetsList);
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		
		modelAndViewObj.addObject("OrganizationId", OrganizationId);
		modelAndViewObj.addObject("zone", zone);
		modelAndViewObj.addObject("selectedLocation", location);
		modelAndViewObj.addObject("status", status);
		modelAndViewObj.addObject("startDate", startDate);
		modelAndViewObj.addObject("endDate", endDate);
		
		modelAndViewObj.setViewName("FinantialManagement/Expenses");
		return modelAndViewObj;
	}	

	/**
	 * 
	 * @author Surya.k
	 * 
	 *This method is used to load Organization master of Accounting menu of Financial Management
	 *
	 **/	
	@RequestMapping("/showJournal")
	public ModelAndView showJournal(@RequestParam("OrganizationId") String OrganizationId,@RequestParam("AccountType") String AccountType,@RequestParam("AccountId") String AccountId,@RequestParam("Zone") String zone,@RequestParam("Location") String location,@RequestParam("TxnType") String txnType,@RequestParam("Start_date") String start_date,@RequestParam("End_date") String end_date,@RequestParam("maxRecords") String maxRecords, @RequestParam("index") String index,HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		//OrganizationMaster organizationMaster = new OrganizationMaster();
		
		int start = 1;
		int end;
		
		if(maxRecords.equals(""))
			end=Integer.parseInt("0");
		else
			end=Integer.parseInt(maxRecords);
		
		
		if(index.equals(""))
			index="0";
		
		List<JournalAccount> AssetsList = genericMasterServiceObj.getJournalMaster(customerId, emailId,OrganizationId,AccountType,AccountId,zone,location,txnType,start_date,end_date);
		List<OrganizationLocations> locationsList = genericMasterServiceObj.getOrganizationLocationDetails(OrganizationId,customerId,emailId);
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);
		List<AccountTypeMaster> AccountsList = genericMasterServiceObj.getAccountIds(customerId, emailId,OrganizationId,AccountType);
		
		modelAndViewObj = new ModelAndView();
		
		if(AssetsList == null || AssetsList.size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");		
		}else{
			if(AssetsList.size()<end){
				end = (AssetsList.size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			
			modelAndViewObj.addObject("totalRecords",(AssetsList.get(0).getTotalRecords()));
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt("10"));
		}
		
		modelAndViewObj.addObject("AssetsList", AssetsList);
		modelAndViewObj.addObject("AccountsList", AccountsList);
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		
		modelAndViewObj.addObject("OrganizationID", OrganizationId);
		modelAndViewObj.addObject("selLocation", location);
		modelAndViewObj.addObject("zone", zone);
		modelAndViewObj.addObject("txnType", txnType);
		modelAndViewObj.addObject("start_date", start_date);
		modelAndViewObj.addObject("end_date", end_date);
		
		modelAndViewObj.setViewName("FinantialManagement/journal");
		return modelAndViewObj;
	}
	

	/**
	 * 
	 * @author Surya.k
	 * 
	 *This method is used to load Organization master of Accounting menu of Financial Management
	 *
	 **/	
	@RequestMapping("/createJournal")
	public ModelAndView createJournal(@RequestParam("AccountType") String accountType,@RequestParam("accountId") String accountId,@RequestParam("accountName") String accountName,@RequestParam("txnDiscription") String TxnDiscription,@RequestParam("txnDate") String TxnDate,@RequestParam("txnType") String TxnType,@RequestParam("txnValue") String TxnValue,@RequestParam("location") String location,HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		String OrganizationId ="";
		String resultStr = genericMasterServiceObj.createJournalMaster(customerId,emailId,accountId,accountName,accountType,TxnDiscription,TxnDate,TxnType,TxnValue,location);
		
		
		List<JournalAccount> AssetsList = genericMasterServiceObj.getJournalMaster(customerId, emailId,OrganizationId,"","","","","","","");
		ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);
		List<AccountTypeMaster> AccountsList = genericMasterServiceObj.getAccountIds(customerId, emailId,OrganizationId,accountType);
		
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("AssetsList", AssetsList);
		modelAndViewObj.addObject("AccountsList", AccountsList);
		modelAndViewObj.addObject("locationsList", locationsList);
		//modelAndViewObj.addObject("AccountId", accountId);
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		modelAndViewObj.addObject("resultStr", resultStr);
		modelAndViewObj.setViewName("FinantialManagement/journal");
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Surya.k
	 * 
	 *This method is used to load Organization master of Accounting menu of Financial Management
	 *
	 **/	
	@RequestMapping("/updateJournal")
	public ModelAndView updateJournal(@RequestParam("accountType") String accountType,@RequestParam("accountId") String accountId,
			@RequestParam("accountName") String accountName,@RequestParam("txnDiscription") String TxnDiscription,
			@RequestParam("txnDate") String TxnDate,@RequestParam("txnType") String TxnType,@RequestParam("txnValue") String TxnValue,
			@RequestParam("location") String location,@RequestParam("sno") String sno,
			HttpServletRequest request,HttpServletResponse response){
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		String OrganizationId ="";
		String resultStr = genericMasterServiceObj.updateJournalMaster(customerId,emailId,accountId,accountName,accountType,TxnDiscription,TxnDate,TxnType,TxnValue,location,sno);
		
		
		List<JournalAccount> AssetsList = genericMasterServiceObj.getJournalMaster(customerId, emailId,OrganizationId,accountType,"","","","","","");
		ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);
		List<AccountTypeMaster> AccountsList = genericMasterServiceObj.getAccountIds(customerId, emailId,OrganizationId,accountType);
		
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("AssetsList", AssetsList);
		modelAndViewObj.addObject("AccountsList", AccountsList);
		modelAndViewObj.addObject("locationsList", locationsList);
		//modelAndViewObj.addObject("AccountId", accountId);
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		modelAndViewObj.addObject("resultStr", resultStr);
		modelAndViewObj.setViewName("FinantialManagement/journal");
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Surya.k
	 * 
	 *This method is used to load Organization master of Accounting menu of Financial Management
	 *
	 **/	
	@RequestMapping("/deleteJournal")
	public String deleteJournal(@RequestParam("sno") String sno,HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		String OrganizationId ="";
		String resultStr = genericMasterServiceObj.deleteJournalMaster(customerId,emailId,sno);
		
		
		return null;
	}
	
	
	/**
	 * 
	 * @author Harsha.K
	 * 
	 *This method is used to load new Organization menu of Accounting menu of Financial Management
	 *
	 **/	
	@RequestMapping("/showOrganization")
	public ModelAndView showOrganization(HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("FinantialManagement/NewOrganization");
		return modelAndViewObj;
	}	
	
	/**
	 * 
	 * @author Harsha.K
	 * 
	 *This method is used to load Profitability.jsp menu of Reports menu of Financial Management
	 *
	 **/	
	@RequestMapping("/showProfitability")
	public ModelAndView showProfitability(HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("FinantialManagement/Profitability");
		return modelAndViewObj;
	}		
	
	/**
	 * 
	 * @author Harsha.K
	 * 
	 *This method is used to load Taxation.jsp menu of Reports menu of Financial Management
	 *
	 **/		
	@RequestMapping("/showTaxation")
	public ModelAndView showTaxation(HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("FinantialManagement/Taxation");
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Harsha.K
	 * 
	 *This method is used to load Receivable.jsp menu of Reports menu of Financial Management
	 *
	 **/		
	@RequestMapping("/showReceivable")
	public ModelAndView showReceivable(HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("FinantialManagement/Receivable");
		return modelAndViewObj;
	}	
	
	/**
	 * 
	 * @author Harsha.K
	 * 
	 *This method is used to load Payables.jsp menu of Reports menu of Financial Management
	 *
	 **/		
	@RequestMapping("/showPayables")
	public ModelAndView showPayables(HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("FinantialManagement/Payables");
		return modelAndViewObj;
	}	
	
	/**
	 * 
	 * @author Harsha.K
	 * 
	 *This method is used to load Deep.jsp menu of Reports menu of Financial Management
	 *
	 **/		
	@RequestMapping("/showDeep")
	public ModelAndView showDeep(HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("FinantialManagement/Deep");
		return modelAndViewObj;
	}	
	
	/**
	 * 
	 * @author Harsha.K
	 * 
	 *This method is used by Reports Menu of Accounting menu of Financial Management to load showReports.jsp
	 *
	 **/		
	@RequestMapping("/showReportsFlow")
	public ModelAndView showReportsFlow(HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("FinantialManagement/showReports");
		return modelAndViewObj;
	}	
	

	@RequestMapping("/deleteAccountTransactions")
	public String deleteAccountTransactions(@RequestParam("sno") String sno,@RequestParam("accountType") String accountType,
			HttpServletRequest request,HttpServletResponse response){
		List<AssetAccounts> AssetsList = genericMasterServiceObj.deleteAccountTransactions(sno, accountType);
		
		
		return null;
	}
	
	
	@RequestMapping("/editAccountTransactions")
	public ModelAndView editAccountTransactions(@RequestParam("accountId") String AccountId,@RequestParam("accountName") String AccounName,
			@RequestParam("location") String location,@RequestParam("txnDiscription") String TxnDiscription,@RequestParam("txnDate") String TxnDate,
			@RequestParam("txnType") String TxnType,@RequestParam("txnValue") String TxnValue,@RequestParam("accountType") String accountType,@RequestParam("sno") String sno,
			HttpServletRequest request,HttpServletResponse response){
		
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		String resultStr = genericMasterServiceObj.updateAccountTransactions(customerId, emailId,AccountId,AccounName,location,TxnDiscription,TxnType,TxnDate,TxnValue,accountType,sno);
		ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,"");

		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("OrganizationList", OrganizationList);

		modelAndViewObj.addObject("resultStr", resultStr);
		modelAndViewObj.addObject("AccountId", AccountId);
		if(accountType.equalsIgnoreCase("Assets")){
			List<AssetAccounts> AssetsList = genericMasterServiceObj.getAssetAccountTransactions(customerId, emailId,AccountId,"","","","","","","");
			modelAndViewObj.addObject("AssetsList", AssetsList);
			modelAndViewObj.setViewName("FinantialManagement/AssetTransactions");
		}else if(accountType.equalsIgnoreCase("Liability")){
			List<LiabilityAccounts> AssetsList = genericMasterServiceObj.getLiabilitiesTransactions(customerId, emailId,AccountId,"","","","","","","");
			modelAndViewObj.addObject("AssetsList", AssetsList);
			modelAndViewObj.setViewName("FinantialManagement/LiabilitiesTransactions");
		}else if(accountType.equalsIgnoreCase("Income")){
			List<IncomeAccounts> AssetsList = genericMasterServiceObj.getIncomeAccountTransactions(customerId, emailId,AccountId,"","","","","","","");
			modelAndViewObj.addObject("AssetsList", AssetsList);
			modelAndViewObj.setViewName("FinantialManagement/IncomeTransactions");
		}else {
			List<ExpensesAccounts> AssetsList = genericMasterServiceObj.getExpensesAccountTransaction(customerId, emailId,AccountId,"","","","","","","");
			modelAndViewObj.addObject("AssetsList", AssetsList);
			modelAndViewObj.setViewName("FinantialManagement/ExpensesTransactions2");
		}
		
		
		return modelAndViewObj;
	}
	
	
	@RequestMapping("/showAssetsTransactions")
	public ModelAndView showAssetsTransactions(@RequestParam("AccountId") String AccountId,@RequestParam("Organization") String organization,
			@RequestParam("Zone") String zone,@RequestParam("Location") String location,@RequestParam("TxnType") String txnType,
			@RequestParam("Start_date") String start_date,@RequestParam("End_date") String end_date,@RequestParam("maxRecords") String maxRecords,
			@RequestParam("index") String index,HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		String OrganizationId = "";
		int start = 1;
		int end;
		
		if(maxRecords.equals(""))
			end=Integer.parseInt("0");
		else
			end=Integer.parseInt(maxRecords);
		
		
		if(index.equals(""))
			index="0";	
		//OrganizationMaster organizationMaster = new OrganizationMaster();
		List<AssetAccounts> AssetsList = genericMasterServiceObj.getAssetAccountTransactions(customerId, emailId,AccountId,organization,zone,location,txnType,start_date,end_date,index);
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);
		List<OrganizationLocations> locationsList = genericMasterServiceObj.getOrganizationLocationDetails(organization,customerId,emailId);
		modelAndViewObj = new ModelAndView();
		if(AssetsList == null || AssetsList.size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");		
		}else{
			if(AssetsList.size()<end){
				end = (AssetsList.size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			
			modelAndViewObj.addObject("totalRecords",(AssetsList.get(0).getTotalRecords()));
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
			modelAndViewObj.addObject("maxRecords", 10);
		}
		modelAndViewObj.addObject("AssetsList", AssetsList);
		modelAndViewObj.addObject("AccountId", AccountId);
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		modelAndViewObj.addObject("locationsList", locationsList);
		
		modelAndViewObj.addObject("organizationID", organization);
		modelAndViewObj.addObject("zone", zone);
		modelAndViewObj.addObject("selectedLocation", location);
		modelAndViewObj.addObject("txnType", txnType);
		modelAndViewObj.addObject("start_date", start_date);
		modelAndViewObj.addObject("end_date", end_date);
		
		modelAndViewObj.setViewName("FinantialManagement/AssetTransactions");
		return modelAndViewObj;
	}
	
	@RequestMapping("/createAssetsTransactions")
	public ModelAndView createAssetsTransactions(@RequestParam("accountId") String AccountId,@RequestParam("accountName") String AccounName,@RequestParam("location") String location,@RequestParam("txnDiscription") String TxnDiscription,@RequestParam("txnDate") String TxnDate,@RequestParam("txnType") String TxnType,@RequestParam("txnValue") String TxnValue,HttpServletRequest request,HttpServletResponse response){
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		String OrganizationId = "";
		
		String resultStr = genericMasterServiceObj.createAssetAccountTransactions(customerId, emailId,AccountId,AccounName,location,TxnDiscription,TxnType,TxnDate,TxnValue);
		List<AssetAccounts> AssetsList = genericMasterServiceObj.getAssetAccountTransactions(customerId, emailId,AccountId,"","","","","","","");
		List<OrganizationLocations> locationsList = genericMasterServiceObj.getOrganizationLocationDetails(OrganizationId,customerId,emailId);
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);

		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("AssetsList", AssetsList);
		modelAndViewObj.addObject("AccountId", AccountId);
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("resultStr", resultStr);
		modelAndViewObj.setViewName("FinantialManagement/AssetTransactions");
		return modelAndViewObj;
	}
	
	
	@RequestMapping("/showLiabilitesTransactions")
	public ModelAndView showLiabilitesTransactions(@RequestParam("AccountId") String AccountId,@RequestParam("Organization") String organization,
			@RequestParam("Zone") String zone,@RequestParam("Location") String location,@RequestParam("TxnType") String txnType,
			@RequestParam("Start_date") String start_date,@RequestParam("End_date") String end_date,@RequestParam("maxRecords") String maxRecords,
			@RequestParam("index") String index,HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		String OrganizationId ="";
		int start = 1;
		int end;
		
		if(maxRecords.equals(""))
			end=Integer.parseInt("0");
		else
			end=Integer.parseInt(maxRecords);
		
		
		if(index.equals(""))
			index="0";	
		//OrganizationMaster organizationMaster = new OrganizationMaster();
		List<LiabilityAccounts> AssetsList = genericMasterServiceObj.getLiabilitiesTransactions(customerId, emailId,AccountId,organization,zone,location,txnType,start_date,end_date,index);
		
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);
		List<OrganizationLocations> locationsList = genericMasterServiceObj.getOrganizationLocationDetails(organization,customerId,emailId);
		modelAndViewObj = new ModelAndView();
		if(AssetsList == null || AssetsList.size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");		
		}else{
			if(AssetsList.size()<end){
				end = (AssetsList.size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			
			modelAndViewObj.addObject("totalRecords",(AssetsList.get(0).getTotalRecords()));
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
			modelAndViewObj.addObject("maxRecords", 10);
		}
		
		modelAndViewObj.addObject("AssetsList", AssetsList);
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		modelAndViewObj.addObject("AccountId", AccountId);
		modelAndViewObj.addObject("locationsList", locationsList);
		
		modelAndViewObj.addObject("organizationID", organization);
		modelAndViewObj.addObject("zone", zone);
		modelAndViewObj.addObject("selectedLocation", location);
		modelAndViewObj.addObject("txnType", txnType);
		modelAndViewObj.addObject("start_date", start_date);
		modelAndViewObj.addObject("end_date", end_date);
		
		modelAndViewObj.setViewName("FinantialManagement/LiabilitiesTransactions");
		return modelAndViewObj;
	}
	
	@RequestMapping("/createLiabilitesTransactions")
	public ModelAndView createLiabilitesTransactions(@RequestParam("accountId") String AccountId,@RequestParam("accountName") String AccounName,@RequestParam("location") String location,@RequestParam("txnDiscription") String TxnDiscription,@RequestParam("txnDate") String TxnDate,@RequestParam("txnType") String TxnType,@RequestParam("txnValue") String TxnValue,HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		String OrganizationId ="";
		//OrganizationMaster organizationMaster = new OrganizationMaster();
		String resultStr = genericMasterServiceObj.createLiabilitiesTransactions(customerId, emailId,AccountId,AccounName,location,TxnDiscription,TxnType,TxnDate,TxnValue);
		//ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
		List<LiabilityAccounts> AssetsList = genericMasterServiceObj.getLiabilitiesTransactions(customerId, emailId,AccountId,"","","","","","","");
		List<OrganizationLocations> locationsList = genericMasterServiceObj.getOrganizationLocationDetails(OrganizationId,customerId,emailId);
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,"");

		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("AssetsList", AssetsList);
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		modelAndViewObj.addObject("AccountId", AccountId);
		modelAndViewObj.addObject("resultStr", resultStr);
		modelAndViewObj.setViewName("FinantialManagement/LiabilitiesTransactions");
		return modelAndViewObj;
	}
	//
	@RequestMapping("/showIncomeTransactions")
	public ModelAndView showIncomeTransactions(@RequestParam("AccountId") String AccountId,@RequestParam("Organization") String organization,
			@RequestParam("Zone") String zone,@RequestParam("Location") String location,@RequestParam("TxnType") String txnType,
			@RequestParam("Start_date") String start_date,@RequestParam("End_date") String end_date,@RequestParam("maxRecords") String maxRecords,
			@RequestParam("index") String index,HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		String OrganizationId ="";
		int start = 1;
		int end;
		
		if(maxRecords.equals(""))
			end=Integer.parseInt("0");
		else
			end=Integer.parseInt(maxRecords);
				
		if(index.equals(""))
			index="0";	
		//OrganizationMaster organizationMaster = new OrganizationMaster();
		List<IncomeAccounts> AssetsList = genericMasterServiceObj.getIncomeAccountTransactions(customerId, emailId,AccountId,organization,zone,location,txnType,start_date,end_date,index);
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);

		List<OrganizationLocations> locationsList = genericMasterServiceObj.getOrganizationLocationDetails(organization,customerId,emailId);
		modelAndViewObj = new ModelAndView();
		if(AssetsList == null || AssetsList.size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");		
		}else{
			if(AssetsList.size()<end){
				end = (AssetsList.size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			
			modelAndViewObj.addObject("totalRecords",(AssetsList.get(0).getTotalRecords()));
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
			modelAndViewObj.addObject("maxRecords", 10);
		}
		
		modelAndViewObj.addObject("AssetsList", AssetsList);
		modelAndViewObj.addObject("AccountId", AccountId);
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		modelAndViewObj.addObject("locationsList", locationsList);
		
		modelAndViewObj.addObject("organizationID", organization);
		modelAndViewObj.addObject("zone", zone);
		modelAndViewObj.addObject("selectedLocation", location);
		modelAndViewObj.addObject("txnType", txnType);
		modelAndViewObj.addObject("start_date", start_date);
		modelAndViewObj.addObject("end_date", end_date);
		
		modelAndViewObj.setViewName("FinantialManagement/IncomeTransactions");
		return modelAndViewObj;
	}
	
	@RequestMapping("/createIncomeTransactions")
	public ModelAndView createIncomeTransactions(@RequestParam("accountId") String AccountId,@RequestParam("accountName") String AccounName,
			@RequestParam("txnDiscription") String TxnDiscription,@RequestParam("txnDate") String TxnDate,
			@RequestParam("txnType") String TxnType,@RequestParam("location") String location,
			@RequestParam("txnValue") String TxnValue,HttpServletRequest request,HttpServletResponse response){
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		String OrganizationId ="";
		//OrganizationMaster organizationMaster = new OrganizationMaster();
		String resultStr = genericMasterServiceObj.createIncomeAccountTransaction(customerId, emailId,AccountId,AccounName,TxnDiscription,TxnType,TxnDate,TxnValue,location);
		//ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
		List<IncomeAccounts> AssetsList = genericMasterServiceObj.getIncomeAccountTransactions(customerId, emailId,AccountId,"","","","","","","");
		List<OrganizationLocations> locationsList = genericMasterServiceObj.getOrganizationLocationDetails(OrganizationId,customerId,emailId);
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,"");

		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("AssetsList", AssetsList);
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		modelAndViewObj.addObject("AccountId", AccountId);
		modelAndViewObj.addObject("resultStr", resultStr);
		modelAndViewObj.setViewName("FinantialManagement/IncomeTransactions");
		return modelAndViewObj;
	}
	@RequestMapping("/showExpensesTransactions")
	public ModelAndView showExpensesTransactions(@RequestParam("AccountId") String AccountId,@RequestParam("Organization") String organization,
			@RequestParam("Zone") String zone,@RequestParam("Location") String location,@RequestParam("TxnType") String txnType,
			@RequestParam("Start_date") String start_date,@RequestParam("End_date") String end_date,@RequestParam("maxRecords") String maxRecords,
			@RequestParam("index") String index,HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		String OrganizationId ="";
		int start = 1;
		int end;
		
		if(maxRecords.equals(""))
			end=Integer.parseInt("0");
		else
			end=Integer.parseInt(maxRecords);
				
		if(index.equals(""))
			index="0";	
		
		//OrganizationMaster organizationMaster = new OrganizationMaster();
		List<ExpensesAccounts> AssetsList = genericMasterServiceObj.getExpensesAccountTransaction(customerId, emailId,AccountId,organization,zone,location,txnType,start_date,end_date,index);
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);

		List<OrganizationLocations> locationsList = genericMasterServiceObj.getOrganizationLocationDetails(organization,customerId,emailId);
		modelAndViewObj = new ModelAndView();
		
		if(AssetsList == null || AssetsList.size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");		
		}else{
			if(AssetsList.size()<end){
				end = (AssetsList.size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			
			modelAndViewObj.addObject("totalRecords",(AssetsList.get(0).getTotalRecords()));
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
			modelAndViewObj.addObject("maxRecords", 10);
		}
		
		modelAndViewObj.addObject("AssetsList", AssetsList);
		modelAndViewObj.addObject("AccountId", AccountId);
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		modelAndViewObj.addObject("locationsList", locationsList);
		
		modelAndViewObj.addObject("organizationID", organization);
		modelAndViewObj.addObject("zone", zone);
		modelAndViewObj.addObject("selectedLocation", location);
		modelAndViewObj.addObject("txnType", txnType);
		modelAndViewObj.addObject("start_date", start_date);
		modelAndViewObj.addObject("end_date", end_date);
		
		modelAndViewObj.setViewName("FinantialManagement/ExpensesTransactions2");
		return modelAndViewObj;
	}
	
	@RequestMapping("/createExpensesTransactions")
	public ModelAndView createExpensesTransactions(@RequestParam("accountId") String AccountId,@RequestParam("accountName") String AccounName,
			@RequestParam("txnDiscription") String TxnDiscription,@RequestParam("txnDate") String TxnDate,@RequestParam("txnType") String TxnType,
			@RequestParam("txnValue") String TxnValue,@RequestParam("location") String location,
			HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		String OrganizationId ="";
		//OrganizationMaster organizationMaster = new OrganizationMaster();
		String resultStr = genericMasterServiceObj.createExpensesAccountTransaction(customerId, emailId,AccountId,AccounName,TxnDiscription,TxnType,TxnDate,TxnValue,location);
		//ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
		List<ExpensesAccounts> AssetsList = genericMasterServiceObj.getExpensesAccountTransaction(customerId, emailId,AccountId,"","","","","","","");
		List<OrganizationLocations> locationsList = genericMasterServiceObj.getOrganizationLocationDetails(OrganizationId,customerId,emailId);
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,"");

		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("AssetsList", AssetsList);
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		modelAndViewObj.addObject("AccountId", AccountId);
		modelAndViewObj.addObject("resultStr", resultStr);
		modelAndViewObj.setViewName("FinantialManagement/ExpensesTransactions2");
		return modelAndViewObj;
	}
	
	
	@RequestMapping("/viewBalanceSheet")
	public ModelAndView viewBalanceSheet(HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		BalanceSheetBean balanceSheetObj = genericMasterServiceObj.getBalanceSheet(customerId, emailId);
		
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("balanceSheetObj", balanceSheetObj);
		modelAndViewObj.setViewName("FinantialManagement/balance_sheet");
		return modelAndViewObj;
	}
	
	@RequestMapping("/organizationLocations")
	public @ResponseBody List<OrganizationLocations> organizationLocations(@RequestParam("organization") String organization,HttpServletRequest request,HttpServletResponse response){
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		List<OrganizationLocations> locationsList = genericMasterServiceObj.getOrganizationLocationDetails(organization,customerId,emailId);

		
	
		return locationsList;
	}
	
	
	@RequestMapping("/getBusinessLocations")
	public @ResponseBody List<LocationBean> getBusinessLocations(@RequestParam("businessType") String businessType,HttpServletRequest request,HttpServletResponse response){
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		List<LocationBean> locationsList = genericMasterServiceObj.getBusinessLocations(businessType);

		
	
		return locationsList;
	}
	@RequestMapping("/getAccountList")
	public @ResponseBody List<AccountTypeMaster> getAccountList(@RequestParam("accountType") String accountType,HttpServletRequest request,HttpServletResponse response){
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		List<AccountTypeMaster> accountList= genericMasterServiceObj.getAccountList(accountType,customerId,emailId);

		
	
		return accountList;
	}

@RequestMapping("/viewTrialBalanceSheet")
	public ModelAndView viewTrialBalanceSheet(@RequestParam("organization") String organization,@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,HttpServletRequest request,HttpServletResponse response){
		// log.info("showUserAccessControlFlow");
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		String OrganizationId="";
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);
		BalanceSheetBean trailBalanceSheetObj = genericMasterServiceObj.getTrailBalanceSheet(customerId, emailId,organization,startDate,endDate);
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("trailBalanceSheetObj", trailBalanceSheetObj);
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		modelAndViewObj.setViewName("FinantialManagement/Trial_Balance");
		return modelAndViewObj;
	}	

	@RequestMapping("/showReconciliation")
	public ModelAndView showReconciliation(HttpServletRequest request,HttpServletResponse response){
		ArrayList<String> accountId=new ArrayList<String>();
		ArrayList<String> accountName=new ArrayList<String>();
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		String OrganizationId="";
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);
		List<AccountTypeMaster>  bankbookList = genericMasterServiceObj.getBankBook();
		if(bankbookList!=null){
			for(int i=0;i<bankbookList.size();i++){
				//accountId.add(bankbookList.get(i).getAccountId());
				//accountName.add(bankbookList.get(i).getAccountName());
				for(int j=0;j<bankbookList.get(i).getSubAccountTypeMasters().size();j++){
					accountId.add(bankbookList.get(i).getSubAccountTypeMasters().get(j).getSubAccountTypeId());
					accountName.add(bankbookList.get(i).getSubAccountTypeMasters().get(j).getAccountName());
				}
			}
		}
		
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		modelAndViewObj.addObject("accountId", accountId);
		modelAndViewObj.addObject("accountName", accountName);
		modelAndViewObj.addObject("bankbookList", bankbookList);
		modelAndViewObj.setViewName("FinantialManagement/Reconciliation");
		return modelAndViewObj;
	}
	
	
	

	@RequestMapping("/viewReconciliation")
	public ModelAndView viewReconciliation(@RequestParam("reconciliationId") String reconciliationId,HttpServletRequest request,HttpServletResponse response){
		ArrayList<String> accountId=new ArrayList<String>();
		ArrayList<String> accountName=new ArrayList<String>();
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		String OrganizationId="";
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);
		List<AccountTypeMaster>  bankbookList = genericMasterServiceObj.getBankBook();
		List<ReconciliationMaster> reconcilitionList = genericMasterServiceObj.getReconcilition(customerId, emailId,"","","","","","","",reconciliationId);

		for(int i=0;i<bankbookList.size();i++){
			//accountId.add(bankbookList.get(i).getAccountId());
			//accountName.add(bankbookList.get(i).getAccountName());
			for(int j=0;j<bankbookList.get(i).getSubAccountTypeMasters().size();j++){
				accountId.add(bankbookList.get(i).getSubAccountTypeMasters().get(j).getSubAccountTypeId());
				accountName.add(bankbookList.get(i).getSubAccountTypeMasters().get(j).getAccountName());
			}
		}
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		modelAndViewObj.addObject("accountId", accountId);
		modelAndViewObj.addObject("accountName", accountName);
		modelAndViewObj.addObject("bankbookList", bankbookList);
		modelAndViewObj.addObject("reconcilitionList", reconcilitionList);
		modelAndViewObj.setViewName("FinantialManagement/ViewReconciliation");
		return modelAndViewObj;
	}
	
	@RequestMapping("/showReconciliationSummary")
	public ModelAndView showReconciliationSummary(@RequestParam("location") String location,
			@RequestParam("organization") String organization,@RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate,@RequestParam("searchData") String searchData,
			@RequestParam("maxRecords") String maxRecords,@RequestParam("index") String index,
			HttpServletRequest request,HttpServletResponse response){
		
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		String OrganizationId="";
		int start = 1;
		int end;
		
		if(maxRecords.equals(""))
			end=Integer.parseInt("0");
		else
			end=Integer.parseInt(maxRecords);
		
		
		if(index.equals(""))
			index="0";
		
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);
		List<ReconciliationMaster> reconcilitionList = genericMasterServiceObj.getReconcilition(customerId, emailId,organization,location,startDate,endDate,searchData,maxRecords,index,"");
		ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
		
		modelAndViewObj = new ModelAndView();
		
		if(reconcilitionList == null || reconcilitionList.size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(reconcilitionList.size()<end){
				end = (reconcilitionList.size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			
			modelAndViewObj.addObject("totalRecords",reconcilitionList.get(0).getTotalRecords());
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
			modelAndViewObj.addObject("maxRecords", 10);
			
			/*modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
			modelAndViewObj.addObject("maxRecords", 10);*/
		}
		
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		modelAndViewObj.addObject("startDate", startDate);
		modelAndViewObj.addObject("endDate", endDate);
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("reconcilitionList", reconcilitionList);
		modelAndViewObj.setViewName("FinantialManagement/ReconciliationSummary");
		return modelAndViewObj;
	}
	
	
	@RequestMapping("/syncOrganizationMaster")
	public @ResponseBody String syncOrganizationMaster(@RequestParam("flowname") String flowname,@RequestParam("organization") String organizationId,@RequestParam("subAccountName") String subAccountName,HttpServletRequest request,HttpServletResponse response){
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		String str= genericMasterServiceObj.syncOrganizationMaster(customerId,emailId,organizationId,flowname,subAccountName);
		return str;
	}

	@RequestMapping("/viewProfitAndLoss")
		public ModelAndView viewProfitAndLoss(@RequestParam("organization") String organization,
				@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,
				@RequestParam("Strategy") String Strategy,
				HttpServletRequest request,HttpServletResponse response){
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			String OrganizationId="";
			List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);
			BalanceSheetBean profitAndLossList= genericMasterServiceObj.getProfitAndLoss(customerId, emailId,organization,startDate,endDate,Strategy);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("profitAndLossList", profitAndLossList);
			modelAndViewObj.addObject("OrganizationList", OrganizationList);
			modelAndViewObj.setViewName("FinantialManagement/ProfitAndLoss");
			return modelAndViewObj;
		}
	
	//Added by Surya.k 
	@RequestMapping("/getPurchasesAndPayments")
	public ModelAndView getPurchasesAndPayments(@RequestParam("organization") String organization,@RequestParam("zone") String zone,
			@RequestParam("location") String location,@RequestParam("category") String category,
			@RequestParam("supplier") String supplier,@RequestParam("status") String status,
			@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,
			@RequestParam("maxRecords") String maxRecords,@RequestParam("index") String index,
			@RequestParam("searchCriteria") String searchCriteria,HttpServletRequest request,HttpServletResponse response){
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		String OrganizationId="";
		String transactionId="";
		float totalInvoice;
		String filePath;
		int start = 1;
		int end;
		
		if(maxRecords.equals(""))
			end=Integer.parseInt("0");
		else
			end=Integer.parseInt(maxRecords);
		if(index.equals(""))
			index="0";
		
		List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);
	//	ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","Retail Outlet",false,true,true);
		List<OrganizationLocations> locationsList = genericMasterServiceObj.getOrganizationLocationDetails("",customerId,emailId);
		List<PurchasePaymentMaster> paymentsList = genericMasterServiceObj.getPurchasePayments(transactionId,organization,zone,location,category,supplier,status,startDate,endDate,index,searchCriteria);
		List<Workflows> workflowsList = roleServiceObj.getWorkflows("-1","Purchases and payments");
		
		modelAndViewObj = new ModelAndView();
		
		if(paymentsList == null || paymentsList.size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
			totalInvoice = 0;
			filePath="";
		}else{
			if(paymentsList.size()<end){
				end = (paymentsList.size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			modelAndViewObj.addObject("totalRecords",paymentsList.get(0).getTotalRecords());
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
			modelAndViewObj.addObject("maxRecords", 10);
			
			/*modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
			modelAndViewObj.addObject("maxRecords", 10);*/
			totalInvoice = paymentsList.get(0).getTotalInvoiceAmount();
			filePath = paymentsList.get(0).getFilePath();
		}
		modelAndViewObj.addObject("supplier",supplier);
		modelAndViewObj.addObject("startDate",startDate);
		modelAndViewObj.addObject("endDate",endDate);
		modelAndViewObj.addObject("selectedLocation",location);
		modelAndViewObj.addObject("zone",zone);
		modelAndViewObj.addObject("selectedOrganization",organization);
		modelAndViewObj.addObject("status",status);
		modelAndViewObj.addObject("filePath",filePath );
		modelAndViewObj.addObject("totalInvoice", totalInvoice);
		modelAndViewObj.addObject("OrganizationList", OrganizationList);
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("paymentsList", paymentsList);
		modelAndViewObj.addObject("workflowsList", workflowsList);
		
		modelAndViewObj.setViewName("FinantialManagement/PurchasesAndPayments");
		return modelAndViewObj;
	}
	
	//Added by Surya.k 
	@RequestMapping("/newPurchasesAndPayments")
	public ModelAndView newPurchasesAndPayments(@RequestParam("status") String status,HttpServletRequest request,HttpServletResponse response){
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","Retail Outlet",false,true,true);

		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("status", status);
		modelAndViewObj.setViewName("FinantialManagement/NewPurchasesAndPayments");
		return modelAndViewObj;
	}
	
	//Added by Surya.k 
	@RequestMapping("/viewPurchasesAndPayments")
	public ModelAndView viewPurchasesAndPayments(@RequestParam("transactionId") String transactionId,HttpServletRequest request,HttpServletResponse response){
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		ArrayList<String> nextActivitiesList = new ArrayList<String>();
		ArrayList<String> previousStates = new ArrayList<String>();
		modelAndViewObj = new ModelAndView();
		List<PurchasePaymentMaster> paymentsList = genericMasterServiceObj.getPurchasePayments(transactionId,"","","","","","","","","","");
		ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","Retail Outlet",false,true,true);

		
		for(int i=0;i<paymentsList.size();i++){
			if(paymentsList.get(i).getStatus() != null){
			nextActivitiesList.add(paymentsList.get(i).getStatus());
			}
			if(paymentsList.get(i).getNextActivities() != null){
			nextActivitiesList.addAll(paymentsList.get(i).getNextActivities());
			}
			
		}
		if(paymentsList.get(0).getPreviousStates() != null){
		for(int i=0;i<paymentsList.get(0).getPreviousStates().size();i++){
			if(!paymentsList.get(0).getPreviousStates().get(i).equalsIgnoreCase("Draft"))
				previousStates.add(paymentsList.get(0).getPreviousStates().get(i));
		}
		}
			
		
		modelAndViewObj.addObject("totalDiscount", paymentsList.get(0).getTotalDiscount());
		modelAndViewObj.addObject("totalNetCost", paymentsList.get(0).getTotalNetCost());
		modelAndViewObj.addObject("selectedLocation", paymentsList.get(0).getLocation());
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("nextActivitiesList", nextActivitiesList);
		modelAndViewObj.addObject("previousStates", previousStates);
		modelAndViewObj.addObject("paymentsList", paymentsList);
		modelAndViewObj.setViewName("FinantialManagement/ViewPurchasesAndPayments");
		return modelAndViewObj;
	}
	
	//Added by Surya.k 
	@RequestMapping("/editPurchasesAndPayments")
	public ModelAndView editPurchasesAndPayments(@RequestParam("transactionId") String transactionId,HttpServletRequest request,HttpServletResponse response){
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		ArrayList<String> nextActivitiesList = new ArrayList<String>();
		ArrayList<String> previousStates = new ArrayList<String>();
		modelAndViewObj = new ModelAndView();
		List<PurchasePaymentMaster> paymentsList = genericMasterServiceObj.getPurchasePayments(transactionId,"","","","","","","","","","");
		ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","Retail Outlet",false,true,true);
		List<Workflows> workflowsList = roleServiceObj.getWorkflows("-1","Purchases and payments");
		
		if(paymentsList.get(0).getStatus().equalsIgnoreCase("Draft")){
			nextActivitiesList.add(paymentsList.get(0).getStatus());
			nextActivitiesList.add(workflowsList.get(0).getStatusName());
			
		}else{
			for(int i=0;i<paymentsList.size();i++){
				if(paymentsList.get(i).getStatus() != null){
				nextActivitiesList.add(paymentsList.get(i).getStatus());
				}
				if(paymentsList.get(i).getNextActivities() != null){
				nextActivitiesList.addAll(paymentsList.get(i).getNextActivities());
				}
			}
			if(paymentsList.get(0).getPreviousStates() != null){
			for(int i=0;i<paymentsList.get(0).getPreviousStates().size();i++){
				if(!paymentsList.get(0).getPreviousStates().get(i).equalsIgnoreCase("Draft"))
					previousStates.add(paymentsList.get(0).getPreviousStates().get(i));
			}
			}
		}
		
		
		modelAndViewObj.addObject("totalDiscount", paymentsList.get(0).getTotalDiscount());
		modelAndViewObj.addObject("totalNetCost", paymentsList.get(0).getTotalNetCost());
		modelAndViewObj.addObject("selectedLocation", paymentsList.get(0).getLocation());
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("nextActivitiesList", nextActivitiesList);
		modelAndViewObj.addObject("previousStates", previousStates);
		modelAndViewObj.addObject("paymentsList", paymentsList);
		
		modelAndViewObj.setViewName("FinantialManagement/EditPurchasesAndPayments");
		return modelAndViewObj;
	}
	
	//Added by Surya.k 
	@RequestMapping(value = "/createPurchasesAndPayments", method = RequestMethod.POST, consumes = "application/json")
	public ModelAndView createPurchasesAndPayments(@RequestBody PurchasePaymentMaster purchasesobj,HttpServletRequest request,HttpServletResponse response){
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
	//	ArrayList<String> nextActivitiesList = new ArrayList<String>();
		modelAndViewObj = new ModelAndView();
		String str= genericMasterServiceObj.createPurchasesAndPayments(purchasesobj);
		List<PurchasePaymentMaster> paymentsList = genericMasterServiceObj.getPurchasePayments(purchasesobj.getTransactionId(),"","","","","","","","","","");

		ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","Retail Outlet",false,true,true);

		if(!str.equals(AppProperties.getAppMessageByProperty("PAYMENTS_CREATED_SUCCESSFULLY").trim())){
			modelAndViewObj.addObject("err", str);
		}else{
			modelAndViewObj.addObject("success", str);
		}
		
		modelAndViewObj.addObject("locationsList", locationsList);
		//modelAndViewObj.addObject("nextActivitiesList", nextActivitiesList);
		modelAndViewObj.addObject("paymentsList", paymentsList);
		modelAndViewObj.setViewName("FinantialManagement/NewPurchasesAndPayments");
		return modelAndViewObj;
	}
	
	//Added by Surya.k 
	@RequestMapping(value = "/updatePurchasesAndPayments", method = RequestMethod.POST, consumes = "application/json")
	public ModelAndView updatePurchasesAndPayments(@RequestBody PurchasePaymentMaster purchasesobj,HttpServletRequest request,HttpServletResponse response){
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		ArrayList<String> nextActivitiesList = new ArrayList<String>();
		ArrayList<String> previousStates = new ArrayList<String>();
		modelAndViewObj = new ModelAndView();
		String str= genericMasterServiceObj.updatePurchasesAndPayments(purchasesobj);
		List<PurchasePaymentMaster> paymentsList = genericMasterServiceObj.getPurchasePayments(purchasesobj.getTransactionId(),"","","","","","","","","","");
		ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","Retail Outlet",false,true,true);
		List<Workflows> workflowsList = roleServiceObj.getWorkflows("-1","Purchases and payments");
		
		if(!str.equals(AppProperties.getAppMessageByProperty("PAYMENTS_UPDATED_SUCCESSFULLY").trim())){
			modelAndViewObj.addObject("err", str);
		}else{
			modelAndViewObj.addObject("success", str);
		}
		
		
		if(paymentsList.get(0).getStatus().equalsIgnoreCase("Draft")){
			nextActivitiesList.add(paymentsList.get(0).getStatus());
			nextActivitiesList.add(workflowsList.get(0).getStatusName());
			
		}else{
			for(int i=0;i<paymentsList.size();i++){
				if(paymentsList.get(i).getStatus() != null){
				nextActivitiesList.add(paymentsList.get(i).getStatus());
				}
				if(paymentsList.get(i).getNextActivities() != null){
				nextActivitiesList.addAll(paymentsList.get(i).getNextActivities());
				}
			}
			if(paymentsList.get(0).getPreviousStates() != null){
			for(int i=0;i<paymentsList.get(0).getPreviousStates().size();i++){
				if(!paymentsList.get(0).getPreviousStates().get(i).equalsIgnoreCase("Draft"))
					previousStates.add(paymentsList.get(0).getPreviousStates().get(i));
			}
			}
		}
		modelAndViewObj.addObject("totalDiscount", paymentsList.get(0).getTotalDiscount());
		modelAndViewObj.addObject("totalNetCost", paymentsList.get(0).getTotalNetCost());
		modelAndViewObj.addObject("selectedLocation", paymentsList.get(0).getLocation());
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("nextActivitiesList", nextActivitiesList);
		modelAndViewObj.addObject("previousStates", previousStates);
		modelAndViewObj.addObject("paymentsList", paymentsList);
		modelAndViewObj.setViewName("FinantialManagement/EditPurchasesAndPayments");
		return modelAndViewObj;
	}

	//Added by Surya.k 
		@RequestMapping("/getSalesAndPayments")
		public ModelAndView getSalesAndPayments(@RequestParam("organization") String organization,@RequestParam("zone") String zone,
				@RequestParam("location") String location,@RequestParam("category") String category,
				@RequestParam("supplier") String supplier,@RequestParam("status") String status,
				@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,
				@RequestParam("maxRecords") String maxRecords,@RequestParam("index") String index,
				@RequestParam("searchCriteria") String searchCriteria,
				@RequestParam("customerID") String customerID,HttpServletRequest request,HttpServletResponse response){
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			ArrayList<String> accountName=new ArrayList<String>();
			String OrganizationId="";
			String transactionId="";
			float totalInvoice;
			String filePath;
			int start = 1;
			int end;
			
			if(maxRecords.equals(""))
				end=Integer.parseInt("0");
			else
				end=Integer.parseInt(maxRecords);
			
			
			if(index.equals(""))
				index="0";
			
			List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);
			ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","Retail Outlet",false,true,true);
			List<SalesAndPaymentsMaster> paymentsList = genericMasterServiceObj.getSalesPayments(transactionId,organization,zone,location,category,supplier,status,startDate,endDate,index,searchCriteria,customerID);
			List<Workflows> workflowsList = roleServiceObj.getWorkflows("-1","Sales and payments");
			List<AccountTypeMaster>  bankbookList = genericMasterServiceObj.getBankBook();
			if(bankbookList!=null){
				for(int i=0;i<bankbookList.size();i++){
					//accountName.add(bankbookList.get(i).getAccountName());
					for(int j=0;j<bankbookList.get(i).getSubAccountTypeMasters().size();j++){
						accountName.add(bankbookList.get(i).getSubAccountTypeMasters().get(j).getAccountName());
					}
				}
			}
			
			modelAndViewObj = new ModelAndView();
			
			if(paymentsList == null || paymentsList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
				totalInvoice = 0;
				filePath="";
			}else{
				if(paymentsList.size()<end){
					end = (paymentsList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				
				modelAndViewObj.addObject("totalRecords",paymentsList.get(0).getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("maxRecords", 10);
				
				/*modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
				modelAndViewObj.addObject("maxRecords", 10);*/
				totalInvoice = paymentsList.get(0).getTotalInvoiceAmount();
				filePath = paymentsList.get(0).getFilePath();
			}
			
			modelAndViewObj.addObject("supplier",supplier);
			modelAndViewObj.addObject("startDate",startDate);
			modelAndViewObj.addObject("endDate",endDate);
			modelAndViewObj.addObject("selectedLocation",location);
			modelAndViewObj.addObject("customerID",customerID);
			modelAndViewObj.addObject("zone",zone);
			modelAndViewObj.addObject("selectedOrganization",organization);
			modelAndViewObj.addObject("status",status);
			modelAndViewObj.addObject("accountNameList",accountName);
			
			modelAndViewObj.addObject("filePath",filePath );
			modelAndViewObj.addObject("totalInvoice", totalInvoice);
			modelAndViewObj.addObject("OrganizationList", OrganizationList);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("paymentsList", paymentsList);
			modelAndViewObj.addObject("workflowsList", workflowsList);
			
			modelAndViewObj.setViewName("FinantialManagement/SalesAndPayments");
			return modelAndViewObj;
		}
		
		//Added by Surya.k 
		@RequestMapping("/newSalesAndPayments")
		public ModelAndView newSalesAndPayments(@RequestParam("status") String status,HttpServletRequest request,HttpServletResponse response){
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","Retail Outlet",false,true,true);
			List<OrganizationLocations> OrganizationlocationsList = genericMasterServiceObj.getOrganizationLocationDetails("",customerId,emailId);

			//ArrayList<LocationBean> customerLocationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","Retail Outlet",false,true,true);

			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("OrganizationlocationsList", OrganizationlocationsList);
			modelAndViewObj.addObject("status", status);
			modelAndViewObj.setViewName("FinantialManagement/NewSalesAndPayments");
			return modelAndViewObj;
		}
		
		//Added by Surya.k 
		@RequestMapping("/viewSalesAndPayments")
		public ModelAndView viewSalesAndPayments(@RequestParam("transactionId") String transactionId,HttpServletRequest request,HttpServletResponse response){
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			ArrayList<String> nextActivitiesList = new ArrayList<String>();
			ArrayList<String> previousStates = new ArrayList<String>();
			ArrayList<String> accountName=new ArrayList<String>();
			modelAndViewObj = new ModelAndView();
			List<SalesAndPaymentsMaster> paymentsList = genericMasterServiceObj.getSalesPayments(transactionId,"","","","","","","","","","","");
			ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","Retail Outlet",false,true,true);
			List<OrganizationLocations> OrganizationlocationsList = genericMasterServiceObj.getOrganizationLocationDetails("",customerId,emailId);
			List<AccountTypeMaster>  bankbookList = genericMasterServiceObj.getBankBook();
			if(bankbookList!=null){
				for(int i=0;i<bankbookList.size();i++){
					//accountName.add(bankbookList.get(i).getAccountName());
					for(int j=0;j<bankbookList.get(i).getSubAccountTypeMasters().size();j++){
						accountName.add(bankbookList.get(i).getSubAccountTypeMasters().get(j).getAccountName());
					}
				}
			}
			
			for(int i=0;i<paymentsList.size();i++){
				if(paymentsList.get(i).getStatus() != null){
				nextActivitiesList.add(paymentsList.get(i).getStatus());
				}
				if(paymentsList.get(i).getNextActivities() != null){
				nextActivitiesList.addAll(paymentsList.get(i).getNextActivities());
				}
			}
			if( paymentsList.get(0).getPreviousStates() != null){
			for(int i=0;i<paymentsList.get(0).getPreviousStates().size();i++){
				if(!paymentsList.get(0).getPreviousStates().get(i).equalsIgnoreCase("Draft"))
					previousStates.add(paymentsList.get(0).getPreviousStates().get(i));
			}
			}
				
			
			modelAndViewObj.addObject("totalDiscount", paymentsList.get(0).getTotalDiscount());
			modelAndViewObj.addObject("totalNetCost", paymentsList.get(0).getTotalNetCost());
			modelAndViewObj.addObject("selectedLocation", paymentsList.get(0).getLocation());
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("accountNameList",accountName);
			modelAndViewObj.addObject("OrganizationlocationsList", OrganizationlocationsList);
			modelAndViewObj.addObject("nextActivitiesList", nextActivitiesList);
			modelAndViewObj.addObject("previousStates", previousStates);
			modelAndViewObj.addObject("paymentsList", paymentsList);
			modelAndViewObj.setViewName("FinantialManagement/ViewSalesAndPayments");
			return modelAndViewObj;
		}
		
		//Added by Surya.k 
		@RequestMapping("/editSalesAndPayments")
		public ModelAndView editSalesAndPayments(@RequestParam("transactionId") String transactionId,HttpServletRequest request,HttpServletResponse response){
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			ArrayList<String> nextActivitiesList = new ArrayList<String>();
			ArrayList<String> previousStates = new ArrayList<String>();
			ArrayList<String> accountName=new ArrayList<String>();
			modelAndViewObj = new ModelAndView();
			List<SalesAndPaymentsMaster> paymentsList = genericMasterServiceObj.getSalesPayments(transactionId,"","","","","","","","","","","");
			ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","Retail Outlet",false,true,true);
			List<Workflows> workflowsList = roleServiceObj.getWorkflows("-1","Sales and payments");
			List<OrganizationLocations> OrganizationlocationsList = genericMasterServiceObj.getOrganizationLocationDetails("",customerId,emailId);
			List<AccountTypeMaster>  bankbookList = genericMasterServiceObj.getBankBook();
			if(bankbookList!=null){
				for(int i=0;i<bankbookList.size();i++){
					//accountName.add(bankbookList.get(i).getAccountName());
					for(int j=0;j<bankbookList.get(i).getSubAccountTypeMasters().size();j++){
						accountName.add(bankbookList.get(i).getSubAccountTypeMasters().get(j).getAccountName());
					}
				}
			}
			
			if(paymentsList.get(0).getStatus().equalsIgnoreCase("Draft")){
				nextActivitiesList.add(paymentsList.get(0).getStatus());
				nextActivitiesList.add(workflowsList.get(0).getStatusName());
				
			}else{
				for(int i=0;i<paymentsList.size();i++){
					if(paymentsList.get(i).getStatus() != null){
					nextActivitiesList.add(paymentsList.get(i).getStatus());
					}if(paymentsList.get(i).getNextActivities() != null){
					nextActivitiesList.addAll(paymentsList.get(i).getNextActivities());
					}
				}
				if(paymentsList.get(0).getPreviousStates() != null){
				for(int i=0;i<paymentsList.get(0).getPreviousStates().size();i++){
					if(!paymentsList.get(0).getPreviousStates().get(i).equalsIgnoreCase("Draft"))
						previousStates.add(paymentsList.get(0).getPreviousStates().get(i));
				}
				}
			}
			
			
			modelAndViewObj.addObject("totalDiscount", paymentsList.get(0).getTotalDiscount());
			modelAndViewObj.addObject("totalNetCost", paymentsList.get(0).getTotalNetCost());
			modelAndViewObj.addObject("selectedLocation", paymentsList.get(0).getLocation());
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("accountNameList",accountName);
			modelAndViewObj.addObject("OrganizationlocationsList", OrganizationlocationsList);
			modelAndViewObj.addObject("nextActivitiesList", nextActivitiesList);
			modelAndViewObj.addObject("previousStates", previousStates);
			modelAndViewObj.addObject("paymentsList", paymentsList);
			
			modelAndViewObj.setViewName("FinantialManagement/EditSalesAndPayments");
			return modelAndViewObj;
		}
		
		//Added by Surya.k 
		@RequestMapping(value = "/createSalesAndPayments", method = RequestMethod.POST, consumes = "application/json")
		public ModelAndView createSalesAndPayments(@RequestBody SalesAndPaymentsMaster purchasesobj,HttpServletRequest request,HttpServletResponse response){
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
		//	ArrayList<String> nextActivitiesList = new ArrayList<String>();
			modelAndViewObj = new ModelAndView();
			String str= genericMasterServiceObj.createSalesAndPayments(purchasesobj);
			List<SalesAndPaymentsMaster> paymentsList = genericMasterServiceObj.getSalesPayments(purchasesobj.getTransactionId(),"","","","","","","","","","","");

			ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","Retail Outlet",false,true,true);
			List<OrganizationLocations> OrganizationlocationsList = genericMasterServiceObj.getOrganizationLocationDetails("",customerId,emailId);

			if(!str.equals(AppProperties.getAppMessageByProperty("PAYMENTS_CREATED_SUCCESSFULLY").trim())){
				modelAndViewObj.addObject("err", str);
			}else{
				modelAndViewObj.addObject("success", str);
			}
			
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("OrganizationlocationsList", OrganizationlocationsList);
			//modelAndViewObj.addObject("nextActivitiesList", nextActivitiesList);
			modelAndViewObj.addObject("paymentsList", paymentsList);
			modelAndViewObj.setViewName("FinantialManagement/NewSalesAndPayments");
			return modelAndViewObj;
		}
		
		//Added by Surya.k 
		@RequestMapping(value = "/updateSalesAndPayments", method = RequestMethod.POST, consumes = "application/json")
		public ModelAndView updateSalesAndPayments(@RequestBody SalesAndPaymentsMaster purchasesobj,HttpServletRequest request,HttpServletResponse response){
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			ArrayList<String> nextActivitiesList = new ArrayList<String>();
			ArrayList<String> previousStates = new ArrayList<String>();
			ArrayList<String> accountName=new ArrayList<String>();
			modelAndViewObj = new ModelAndView();
			String str= genericMasterServiceObj.updateSalesAndPayments(purchasesobj);
			List<SalesAndPaymentsMaster> paymentsList = genericMasterServiceObj.getSalesPayments(purchasesobj.getTransactionId(),"","","","","","","","","","","");
			ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","Retail Outlet",false,true,true);
			List<Workflows> workflowsList = roleServiceObj.getWorkflows("-1","Sales and payments");
			List<OrganizationLocations> OrganizationlocationsList = genericMasterServiceObj.getOrganizationLocationDetails("",customerId,emailId);
			List<AccountTypeMaster>  bankbookList = genericMasterServiceObj.getBankBook();
			if(bankbookList!=null){
				for(int i=0;i<bankbookList.size();i++){
					//accountName.add(bankbookList.get(i).getAccountName());
					for(int j=0;j<bankbookList.get(i).getSubAccountTypeMasters().size();j++){
						accountName.add(bankbookList.get(i).getSubAccountTypeMasters().get(j).getAccountName());
					}
				}
			}
			if(!str.equals(AppProperties.getAppMessageByProperty("PAYMENTS_UPDATED_SUCCESSFULLY").trim())){
				modelAndViewObj.addObject("err", str);
			}else{
				modelAndViewObj.addObject("success", str);
			}
			
			
			if(paymentsList.get(0).getStatus().equalsIgnoreCase("Draft")){
				nextActivitiesList.add(paymentsList.get(0).getStatus());
				nextActivitiesList.add(workflowsList.get(0).getStatusName());
				
			}else{
				for(int i=0;i<paymentsList.size();i++){
					if(paymentsList.get(i).getStatus() != null){
					nextActivitiesList.add(paymentsList.get(i).getStatus());
					}
					if(paymentsList.get(i).getNextActivities() != null){
					nextActivitiesList.addAll(paymentsList.get(i).getNextActivities());
					}
				}
				if(paymentsList.get(0).getPreviousStates() != null){
				for(int i=0;i<paymentsList.get(0).getPreviousStates().size();i++){
					if(!paymentsList.get(0).getPreviousStates().get(i).equalsIgnoreCase("Draft"))
						previousStates.add(paymentsList.get(0).getPreviousStates().get(i));
				}
				}
			}
			modelAndViewObj.addObject("totalDiscount", paymentsList.get(0).getTotalDiscount());
			modelAndViewObj.addObject("totalNetCost", paymentsList.get(0).getTotalNetCost());
			modelAndViewObj.addObject("selectedLocation", paymentsList.get(0).getLocation());
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("OrganizationlocationsList", OrganizationlocationsList);
			modelAndViewObj.addObject("nextActivitiesList", nextActivitiesList);
			modelAndViewObj.addObject("accountNameList",accountName);
			modelAndViewObj.addObject("previousStates", previousStates);
			modelAndViewObj.addObject("paymentsList", paymentsList);
			modelAndViewObj.setViewName("FinantialManagement/EditSalesAndPayments");
			return modelAndViewObj;
		}

		
	
	

			//Added by Surya.k on 15/05/2019
	@RequestMapping("/showDebitNoteSummary")
			public ModelAndView showDebitNoteSummary(@RequestParam("zone") String zone,@RequestParam("location") String location,
			@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,
			@RequestParam("searchCreteria") String searchCreteria,@RequestParam("maxRecords") String maxRecords,
			@RequestParam("index") String index, HttpServletRequest request,HttpServletResponse response){
		
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		List<DebitNoteMaster> debitNoteSummary=genericMasterServiceObj.getDebitNoteSummary(zone,location,startDate,endDate,searchCreteria,maxRecords,index,"");
		List<OrganizationLocations> OrganizationlocationsList = genericMasterServiceObj.getOrganizationLocationDetails("",customerId,emailId);

		modelAndViewObj = new ModelAndView();
		
		int start = 1;
		int end;
		
		if(maxRecords.equals(""))
			end=Integer.parseInt("0");
		else
			end=Integer.parseInt(maxRecords);
		
		
		if(index.equals(""))
			index="0";
		//List<SubAccountTypeMaster> subAccountTypeMasterList = genericMasterServiceObj.getSubLedger(accountId,"",accountType, "0");
		//modelAndViewObj = new ModelAndView();
		
		if(debitNoteSummary == null || debitNoteSummary.size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(debitNoteSummary.size()<end){
				end = (debitNoteSummary.size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			
			modelAndViewObj.addObject("totalRecords",debitNoteSummary.get(0).getTotalRecords());
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
			modelAndViewObj.addObject("maxRecords", 10);
			
		
		}
		modelAndViewObj.addObject("startDate", startDate);
		modelAndViewObj.addObject("endDate", endDate);		
		modelAndViewObj.addObject("selectedLocation", location);		
		
		modelAndViewObj.addObject("locationsList", OrganizationlocationsList);				
		modelAndViewObj.addObject("debitNoteSummary", debitNoteSummary);
		modelAndViewObj.setViewName("FinantialManagement/DebitNoteSummary");
		return modelAndViewObj;
	}
			
			//Added by Surya.k on 15/05/2019
			@RequestMapping("/showDebitNote")
			public ModelAndView showDebitNote(@RequestParam("refNum") String refNum,HttpServletRequest request,HttpServletResponse response){
				//List<DebitNoteMaster> debitNoteSummary=genericMasterServiceObj.getDebitNote();
				String customerId = (String)request.getSession().getAttribute("customerId");
				String emailId = (String)request.getSession().getAttribute("emailId");
				List<OrganizationLocations> OrganizationlocationsList = genericMasterServiceObj.getOrganizationLocationDetails("",customerId,emailId);
				modelAndViewObj = new ModelAndView();
				//modelAndViewObj.addObject("accountId", accountId);				
				modelAndViewObj.addObject("locationsList", OrganizationlocationsList);				
				modelAndViewObj.setViewName("FinantialManagement/NewDebitNote");
				return modelAndViewObj;
			}
			//Added by Surya.k on 15/05/2019
			@RequestMapping("/viewDebitNote")
			public ModelAndView viewDebitNote(@RequestParam("refNum") String refNum,HttpServletRequest request,HttpServletResponse response){
				String customerId = (String)request.getSession().getAttribute("customerId");
				String emailId = (String)request.getSession().getAttribute("emailId");
				List<DebitNoteMaster> debitNoteDeatils=genericMasterServiceObj.getDebitNoteSummary("","","","","","","",refNum);
				List<OrganizationLocations> OrganizationlocationsList = genericMasterServiceObj.getOrganizationLocationDetails("",customerId,emailId);
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("debitNoteDeatils", debitNoteDeatils);	
				modelAndViewObj.addObject("locationsList", OrganizationlocationsList);	
				modelAndViewObj.setViewName("FinantialManagement/ViewDebitNote");
				return modelAndViewObj;
			}
			
			//Added by Surya.k on 16/05/2019
			@RequestMapping("/createDebitNote")
			public ModelAndView createDebitNote(@RequestBody DebitNoteMaster debitNoteMasterObj,HttpServletRequest request,HttpServletResponse response){
				String customerId = (String)request.getSession().getAttribute("customerId");
				String emailId = (String)request.getSession().getAttribute("emailId");
				List<OrganizationLocations> OrganizationlocationsList = genericMasterServiceObj.getOrganizationLocationDetails("",customerId,emailId);
				String str = genericMasterServiceObj.createDebitMaster(debitNoteMasterObj);
				modelAndViewObj = new ModelAndView();
				
				if(!str.equals(AppProperties.getAppMessageByProperty("DEBITNOTE_CREATED_SUCCESSFULLY").trim())){
					modelAndViewObj.addObject("err", str);
				}else{
					modelAndViewObj.addObject("success", str);
				}
				modelAndViewObj.addObject("locationsList", OrganizationlocationsList);				
				modelAndViewObj.setViewName("FinantialManagement/NewDebitNote");
				return modelAndViewObj;
			}

			
			

					//Added by Surya.k on 03/07/2019
					@RequestMapping("/showCreditNoteSummary")
					public ModelAndView showCreditNoteSummary(@RequestParam("zone") String zone,@RequestParam("location") String location,
							@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,
							@RequestParam("searchCreteria") String searchCreteria,@RequestParam("maxRecords") String maxRecords,
							@RequestParam("index") String index, HttpServletRequest request,HttpServletResponse response){
						
						String customerId = (String)request.getSession().getAttribute("customerId");
						String emailId = (String)request.getSession().getAttribute("emailId");
						List<CreditNoteMaster> creditNoteSummary=genericMasterServiceObj.getCreditNoteSummary(zone,location,startDate,endDate,searchCreteria,maxRecords,index,"");
						List<OrganizationLocations> OrganizationlocationsList = genericMasterServiceObj.getOrganizationLocationDetails("",customerId,emailId);
		
						modelAndViewObj = new ModelAndView();
						
						int start = 1;
						int end;
						
						if(maxRecords.equals(""))
							end=Integer.parseInt("0");
						else
							end=Integer.parseInt(maxRecords);
						
						
						if(index.equals(""))
							index="0";
						//List<SubAccountTypeMaster> subAccountTypeMasterList = genericMasterServiceObj.getSubLedger(accountId,"",accountType, "0");
						//modelAndViewObj = new ModelAndView();
						
						if(creditNoteSummary == null || creditNoteSummary.size() == 0){
							modelAndViewObj.addObject("totalRecords","0");
							modelAndViewObj.addObject("index", "0");
							modelAndViewObj.addObject("totalValue", "0");
						}else{
							if(creditNoteSummary.size()<end){
								end = (creditNoteSummary.size())+(Integer.parseInt(index));
							}else{
								end = (Integer.parseInt(index)+end);
							}
							
							modelAndViewObj.addObject("totalRecords",creditNoteSummary.get(0).getTotalRecords());
							modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
							modelAndViewObj.addObject("totalValue", end);
							modelAndViewObj.addObject("maxRecords", 10);
							
						
						}
						modelAndViewObj.addObject("startDate", startDate);
						modelAndViewObj.addObject("endDate", endDate);		
						modelAndViewObj.addObject("selectedLocation", location);		
						
						modelAndViewObj.addObject("locationsList", OrganizationlocationsList);				
						modelAndViewObj.addObject("debitNoteSummary", creditNoteSummary);
						modelAndViewObj.setViewName("FinantialManagement/CreditNoteSummary");
						return modelAndViewObj;
					}
							
					//Added by Surya.k on 03/07/2019
					@RequestMapping("/showCreditNote")
					public ModelAndView showCreditNote(@RequestParam("refNum") String refNum,HttpServletRequest request,HttpServletResponse response){
						//List<DebitNoteMaster> debitNoteSummary=genericMasterServiceObj.getDebitNote();
						String customerId = (String)request.getSession().getAttribute("customerId");
						String emailId = (String)request.getSession().getAttribute("emailId");
						List<OrganizationLocations> OrganizationlocationsList = genericMasterServiceObj.getOrganizationLocationDetails("",customerId,emailId);
						modelAndViewObj = new ModelAndView();
						//modelAndViewObj.addObject("accountId", accountId);				
						modelAndViewObj.addObject("locationsList", OrganizationlocationsList);				
						modelAndViewObj.setViewName("FinantialManagement/NewCreditNote");
						return modelAndViewObj;
					}
					
					//Added by Surya.k on 03/07/2019
					@RequestMapping("/viewCreditNote")
					public ModelAndView viewCreditNote(@RequestParam("refNum") String refNum,HttpServletRequest request,HttpServletResponse response){
						//List<DebitNoteMaster> debitNoteSummary=genericMasterServiceObj.getDebitNote();
						String customerId = (String)request.getSession().getAttribute("customerId");
						String emailId = (String)request.getSession().getAttribute("emailId");
						List<CreditNoteMaster> creditNoteDetails=genericMasterServiceObj.getCreditNoteSummary("","","","","","","",refNum);

						List<OrganizationLocations> OrganizationlocationsList = genericMasterServiceObj.getOrganizationLocationDetails("",customerId,emailId);
						modelAndViewObj = new ModelAndView();
						//modelAndViewObj.addObject("accountId", accountId);				
						modelAndViewObj.addObject("locationsList", OrganizationlocationsList);	
						modelAndViewObj.addObject("creditNoteDetails", creditNoteDetails);	
						modelAndViewObj.setViewName("FinantialManagement/ViewCreditNote");
						return modelAndViewObj;
					}
					
					//Added by Surya.k on 03/07/2019
					@RequestMapping("/createCreditNote")
					public ModelAndView createCreditNote(@RequestBody CreditNoteMaster creditNoteMasterObj,HttpServletRequest request,HttpServletResponse response){
						String customerId = (String)request.getSession().getAttribute("customerId");
						String emailId = (String)request.getSession().getAttribute("emailId");
						List<OrganizationLocations> OrganizationlocationsList = genericMasterServiceObj.getOrganizationLocationDetails("",customerId,emailId);
						String str = genericMasterServiceObj.createCreditNote(creditNoteMasterObj);
						modelAndViewObj = new ModelAndView();
						
						if(!str.equals(AppProperties.getAppMessageByProperty("CREDITNOTE_CREATED_SUCCESSFULLY").trim())){
							modelAndViewObj.addObject("err", str);
						}else{
							modelAndViewObj.addObject("success", str);
						}
						modelAndViewObj.addObject("locationsList", OrganizationlocationsList);				
						modelAndViewObj.setViewName("FinantialManagement/NewCreditNote");
						return modelAndViewObj;
					}

					
			//Added by Surya.k on 27/04/2019 Accounting Assets SubLedger flows
			@RequestMapping("/createSubAssetMaster")
			public ModelAndView createSubAssetMaster(@RequestParam("accountId") String accountId,@RequestParam("subaccountId") String subaccountId,
					@RequestParam("subaccountName") String subaccountName,@RequestParam("subdiscription") String subdiscription,
					@RequestParam("accountType") String accountType,@RequestParam("Status") String Status,
					@RequestParam("organizationId") String organizationId,@RequestParam("accountName") String accountName,
					HttpServletRequest request,HttpServletResponse response){
				
				String customerId = (String)request.getSession().getAttribute("customerId");
				String emailId = (String)request.getSession().getAttribute("emailId");
				String resultStr = genericMasterServiceObj.createSubLedgerMaster(customerId,emailId,accountId,subaccountId,subaccountName,subdiscription,accountType,Status);
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("resultStr", resultStr);
				modelAndViewObj.addObject("accountId", accountId);
				modelAndViewObj.addObject("Organization", organizationId);
				modelAndViewObj.addObject("accountname", accountName);
				modelAndViewObj.setViewName("FinantialManagement/AssetsSubLedger");
				return modelAndViewObj;
			}
			@RequestMapping("/editSubAssetMaster")
			public ModelAndView editSubAssetMaster(@RequestParam("accountId") String accountId,@RequestParam("subaccountId") String subaccountId,
					@RequestParam("subaccountName") String subaccountName,@RequestParam("subdiscription") String subdiscription,
					@RequestParam("accountType") String accountType,@RequestParam("Status") String Status,
					@RequestParam("organizationId") String organizationId,@RequestParam("accountName") String accountName,
					HttpServletRequest request,HttpServletResponse response){
				
				String customerId = (String)request.getSession().getAttribute("customerId");
				String emailId = (String)request.getSession().getAttribute("emailId");
				String resultStr = genericMasterServiceObj.editSubLedgerMaster(customerId,emailId,accountId,subaccountId,subaccountName,subdiscription,accountType,Status);
				List<SubAccountTypeMaster> subAccountTypeMasterList = genericMasterServiceObj.getSubLedger(accountId,subaccountId,accountType,"","","", "0");
				
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("resultStr", resultStr);
				modelAndViewObj.addObject("accountId", accountId);
				modelAndViewObj.addObject("Organization", organizationId);
				modelAndViewObj.addObject("accountname", accountName);
				modelAndViewObj.addObject("subAssetsList", subAccountTypeMasterList);
				modelAndViewObj.setViewName("FinantialManagement/AssetsSubLedger");
				return modelAndViewObj;
			}
			
			@RequestMapping("/createAssetSubLedger")
			public ModelAndView createAssetSubLedger(@RequestParam("AccountId") String accountId,HttpServletRequest request,HttpServletResponse response){
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("accountId", accountId);
				modelAndViewObj.setViewName("FinantialManagement/AssetsCreateSubLedger");
				return modelAndViewObj;
			}	

			@RequestMapping("/showAssetSubLedger")
			public ModelAndView showSubLedger(@RequestParam("AccountId") String accountId,
					@RequestParam("AccountName") String accountname,@RequestParam("Organization") String Organization,
					@RequestParam("Start_date") String Start_date,@RequestParam("End_date") String End_date,@RequestParam("status") String status,
					@RequestParam("maxRecords") String maxRecords,@RequestParam("index") String index,
					HttpServletRequest request,HttpServletResponse response){
				String accountType = "Assets";
				int start = 1;
				int end;
				
				if(maxRecords.equals(""))
					end=Integer.parseInt("0");
				else
					end=Integer.parseInt(maxRecords);
				
				
				if(index.equals(""))
					index="0";
				List<SubAccountTypeMaster> subAccountTypeMasterList = genericMasterServiceObj.getSubLedger(accountId,"",accountType,status,Start_date,End_date,"0");
				modelAndViewObj = new ModelAndView();
				
				if(subAccountTypeMasterList == null || subAccountTypeMasterList.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(subAccountTypeMasterList.size()<end){
						end = (subAccountTypeMasterList.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					
					modelAndViewObj.addObject("totalRecords",subAccountTypeMasterList.get(0).getTotalRecords());
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
					modelAndViewObj.addObject("maxRecords", 10);
					
				
				}
				
				modelAndViewObj.addObject("Organization", Organization);
				modelAndViewObj.addObject("accountId", accountId);
				modelAndViewObj.addObject("accountname", accountname);
				modelAndViewObj.addObject("Start_date", Start_date);
				modelAndViewObj.addObject("End_date", End_date);
				modelAndViewObj.addObject("status", status);
				modelAndViewObj.addObject("subAssetsList", subAccountTypeMasterList);
				modelAndViewObj.setViewName("FinantialManagement/AssetsSubLedger");
				return modelAndViewObj;
			}	
			
			@RequestMapping("/viewAssetSubLedger")
			public ModelAndView viewAssetSubLedger(@RequestParam("AccountId") String accountId,@RequestParam("SubAccountId") String SubAccountId,
					@RequestParam("organizationId") String organizationId,@RequestParam("accountName") String accountName,
					HttpServletRequest request,HttpServletResponse response){
				
				String accountType = "Assets";
				modelAndViewObj = new ModelAndView();
				List<SubAccountTypeMaster> subAccountTypeMasterList = genericMasterServiceObj.getSubLedger(accountId,SubAccountId,accountType,"","","","0");
				modelAndViewObj.addObject("subAssetsList", subAccountTypeMasterList);
				modelAndViewObj.addObject("accountId", accountId);
				modelAndViewObj.addObject("Organization", organizationId);
				modelAndViewObj.addObject("accountname", accountName);
				modelAndViewObj.setViewName("FinantialManagement/AssetsSubLedger");
				return modelAndViewObj;
			}	
			@RequestMapping("/editAssetSubLedger")
			public ModelAndView editAssetSubLedger(@RequestParam("AccountId") String accountId,@RequestParam("SubAccountId") String SubAccountId,
					@RequestParam("organizationId") String organizationId,@RequestParam("accountName") String accountName,
					HttpServletRequest request,HttpServletResponse response){
				
				String accountType = "Assets";
				modelAndViewObj = new ModelAndView();
				List<SubAccountTypeMaster> subAccountTypeMasterList = genericMasterServiceObj.getSubLedger(accountId,SubAccountId,accountType,"","","", "0");
				modelAndViewObj.addObject("subAssetsList", subAccountTypeMasterList);
				modelAndViewObj.addObject("accountId", accountId);
				modelAndViewObj.addObject("Organization", organizationId);
				modelAndViewObj.addObject("accountname", accountName);
				modelAndViewObj.setViewName("FinantialManagement/AssetsSubLedger");
				return modelAndViewObj;
			}	
			
			//Added by Surya.k on 27/04/2019 Accounting Liabilities SubLedger flows
			
			@RequestMapping("/createSubLiabilitiesMaster")
			public ModelAndView createSubLiabilitiesMaster(@RequestParam("accountId") String accountId,@RequestParam("subaccountId") String subaccountId,
					@RequestParam("subaccountName") String subaccountName,@RequestParam("subdiscription") String subdiscription,
					@RequestParam("accountType") String accountType,@RequestParam("Status") String Status,
					@RequestParam("organizationId") String organizationId,@RequestParam("accountName") String accountName,
					HttpServletRequest request,HttpServletResponse response){
				
				String customerId = (String)request.getSession().getAttribute("customerId");
				String emailId = (String)request.getSession().getAttribute("emailId");
				String resultStr = genericMasterServiceObj.createSubLedgerMaster(customerId,emailId,accountId,subaccountId,subaccountName,subdiscription,accountType,Status);
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("resultStr", resultStr);
				modelAndViewObj.addObject("accountId", accountId);
				modelAndViewObj.addObject("Organization", organizationId);
				modelAndViewObj.addObject("accountname", accountName);
				modelAndViewObj.setViewName("FinantialManagement/LiabilitiesSubLedger");
				return modelAndViewObj;
			}
			@RequestMapping("/editSubLiabilitiesMaster")
			public ModelAndView editSubLiabilitiesMaster(@RequestParam("accountId") String accountId,@RequestParam("subaccountId") String subaccountId,
					@RequestParam("subaccountName") String subaccountName,@RequestParam("subdiscription") String subdiscription,
					@RequestParam("accountType") String accountType,@RequestParam("Status") String Status,
					@RequestParam("organizationId") String organizationId,@RequestParam("accountName") String accountName,
					HttpServletRequest request,HttpServletResponse response){
				
				String customerId = (String)request.getSession().getAttribute("customerId");
				String emailId = (String)request.getSession().getAttribute("emailId");
				String resultStr = genericMasterServiceObj.editSubLedgerMaster(customerId,emailId,accountId,subaccountId,subaccountName,subdiscription,accountType,Status);
				List<SubAccountTypeMaster> subAccountTypeMasterList = genericMasterServiceObj.getSubLedger(accountId,"",accountType,"","","", "0");

				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("subAssetsList", subAccountTypeMasterList);
				modelAndViewObj.addObject("accountId", accountId);
				modelAndViewObj.addObject("resultStr", resultStr);
				modelAndViewObj.addObject("Organization", organizationId);
	 			modelAndViewObj.addObject("accountname", accountName);
				modelAndViewObj.setViewName("FinantialManagement/LiabilitiesSubLedger");
				return modelAndViewObj;
			}
			
			
			
			@RequestMapping("/createLiabilitiesSubLedger")
			public ModelAndView createLiabilitiesSubLedger(@RequestParam("AccountId") String accountId,HttpServletRequest request,HttpServletResponse response){
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("accountId", accountId);
				modelAndViewObj.setViewName("FinantialManagement/CreateLiabilitiesSubLedger");
				return modelAndViewObj;
			}	

			@RequestMapping("/showLiabilitiesSubLedger")
			public ModelAndView showLiabilitiesSubLedger(@RequestParam("AccountId") String accountId,
					@RequestParam("AccountName") String accountname,@RequestParam("Organization") String Organization,
					@RequestParam("Start_date") String Start_date,@RequestParam("End_date") String End_date,@RequestParam("status") String status,
					@RequestParam("maxRecords") String maxRecords,@RequestParam("index") String index,
					HttpServletRequest request,HttpServletResponse response){
				String accountType = "Liability";
				int start = 1;
				int end;
				
				if(maxRecords.equals(""))
					end=Integer.parseInt("0");
				else
					end=Integer.parseInt(maxRecords);
				
				
				if(index.equals(""))
					index="0";
				List<SubAccountTypeMaster> subAccountTypeMasterList = genericMasterServiceObj.getSubLedger(accountId,"",accountType,status,Start_date,End_date, "0");
				modelAndViewObj = new ModelAndView();
				
				if(subAccountTypeMasterList == null || subAccountTypeMasterList.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(subAccountTypeMasterList.size()<end){
						end = (subAccountTypeMasterList.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					
					modelAndViewObj.addObject("totalRecords",subAccountTypeMasterList.get(0).getTotalRecords());
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
					modelAndViewObj.addObject("maxRecords", 10);
					
				
				}
				modelAndViewObj.addObject("Organization", Organization);
				modelAndViewObj.addObject("accountId", accountId);
				modelAndViewObj.addObject("accountname", accountname);
				modelAndViewObj.addObject("Start_date", Start_date);
				modelAndViewObj.addObject("End_date", End_date);
				modelAndViewObj.addObject("status", status);
				modelAndViewObj.addObject("subAssetsList", subAccountTypeMasterList);
				modelAndViewObj.setViewName("FinantialManagement/LiabilitiesSubLedger");
				return modelAndViewObj;
			}	
			
			@RequestMapping("/viewLiabilitiesSubLedger")
			public ModelAndView viewLiabilitiesSubLedger(@RequestParam("AccountId") String accountId,@RequestParam("SubAccountId") String SubAccountId,
					@RequestParam("organizationId") String organizationId,@RequestParam("accountName") String accountName,
					HttpServletRequest request,HttpServletResponse response){
				String accountType = "Liability";
				modelAndViewObj = new ModelAndView();
				List<SubAccountTypeMaster> subAccountTypeMasterList = genericMasterServiceObj.getSubLedger(accountId,SubAccountId,accountType,"","","","0");
				modelAndViewObj.addObject("accountId", accountId);
				modelAndViewObj.addObject("Organization", organizationId);
	 			modelAndViewObj.addObject("accountname", accountName);
				modelAndViewObj.addObject("subAssetsList", subAccountTypeMasterList);
				modelAndViewObj.setViewName("FinantialManagement/LiabilitiesSubLedger");
				return modelAndViewObj;
			}	
			@RequestMapping("/editLiabilitiesSubLedger")
			public ModelAndView editLiabilitiesSubLedger(@RequestParam("AccountId") String accountId,@RequestParam("SubAccountId") String SubAccountId,
					@RequestParam("organizationId") String organizationId,@RequestParam("accountName") String accountName,
					HttpServletRequest request,HttpServletResponse response){
				modelAndViewObj = new ModelAndView();
				String accountType = "Liability";
				List<SubAccountTypeMaster> subAccountTypeMasterList = genericMasterServiceObj.getSubLedger(accountId,SubAccountId,accountType,"","","", "0");
				modelAndViewObj.addObject("accountId", accountId);
				modelAndViewObj.addObject("Organization", organizationId);
	 			modelAndViewObj.addObject("accountname", accountName);
				modelAndViewObj.addObject("subAssetsList", subAccountTypeMasterList);
				modelAndViewObj.setViewName("FinantialManagement/LiabilitiesSubLedger");
				return modelAndViewObj;
			}	
			
			
			//Added by Surya.k on 27/04/2019 Accounting Income SubLedger flows
			
			@RequestMapping("/createSubIncomeMaster")
			public ModelAndView createSubIncomeMaster(@RequestParam("accountId") String accountId,@RequestParam("subaccountId") String subaccountId,
					@RequestParam("subaccountName") String subaccountName,@RequestParam("subdiscription") String subdiscription,
					@RequestParam("accountType") String accountType,@RequestParam("Status") String Status,
					@RequestParam("organizationId") String organizationId,@RequestParam("accountName") String accountName,
					HttpServletRequest request,HttpServletResponse response){
				String customerId = (String)request.getSession().getAttribute("customerId");
				String emailId = (String)request.getSession().getAttribute("emailId");
				String resultStr = genericMasterServiceObj.createSubLedgerMaster(customerId,emailId,accountId,subaccountId,subaccountName,subdiscription,accountType,Status);
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("accountId", accountId);
				modelAndViewObj.addObject("resultStr", resultStr);
				modelAndViewObj.addObject("Organization", organizationId);
	 			modelAndViewObj.addObject("accountname", accountName);
				modelAndViewObj.setViewName("FinantialManagement/IncomeSubLedger");
				return modelAndViewObj;
			}
			@RequestMapping("/editSubIncomeMaster")
			public ModelAndView editSubIncomeMaster(@RequestParam("accountId") String accountId,@RequestParam("subaccountId") String subaccountId,
					@RequestParam("subaccountName") String subaccountName,@RequestParam("subdiscription") String subdiscription,
					@RequestParam("accountType") String accountType,@RequestParam("Status") String Status,
					@RequestParam("organizationId") String organizationId,@RequestParam("accountName") String accountName,
					HttpServletRequest request,HttpServletResponse response){
				String customerId = (String)request.getSession().getAttribute("customerId");
				String emailId = (String)request.getSession().getAttribute("emailId");
				String resultStr = genericMasterServiceObj.editSubLedgerMaster(customerId,emailId,accountId,subaccountId,subaccountName,subdiscription,accountType,Status);
				List<SubAccountTypeMaster> subAccountTypeMasterList = genericMasterServiceObj.getSubLedger(accountId,"",accountType,"","","", "0");

				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("subAssetsList", subAccountTypeMasterList);
				modelAndViewObj.addObject("accountId", accountId);
				modelAndViewObj.addObject("resultStr", resultStr);
				modelAndViewObj.addObject("Organization", organizationId);
	 			modelAndViewObj.addObject("accountname", accountName);
				modelAndViewObj.setViewName("FinantialManagement/IncomeSubLedger");
				return modelAndViewObj;
			}
			
			
			
			@RequestMapping("/createIncomeSubLedger")
			public ModelAndView createIncomeSubLedger(@RequestParam("AccountId") String accountId,HttpServletRequest request,HttpServletResponse response){
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("accountId", accountId);
				modelAndViewObj.setViewName("FinantialManagement/CreateIncomeSubLedger");
				return modelAndViewObj;
			}	

			@RequestMapping("/showIncomeSubLedger")
			public ModelAndView showIncomeSubLedger(@RequestParam("AccountId") String accountId,
					@RequestParam("AccountName") String accountname,@RequestParam("Organization") String Organization,
					@RequestParam("Start_date") String Start_date,@RequestParam("End_date") String End_date,@RequestParam("status") String status,
					@RequestParam("maxRecords") String maxRecords,@RequestParam("index") String index,
					HttpServletRequest request,HttpServletResponse response){
				
				String accountType = "Income";
				int start = 1;
				int end;
				
				if(maxRecords.equals(""))
					end=Integer.parseInt("0");
				else
					end=Integer.parseInt(maxRecords);
				
				
				if(index.equals(""))
					index="0";
				List<SubAccountTypeMaster> subAccountTypeMasterList = genericMasterServiceObj.getSubLedger(accountId,"",accountType,status,Start_date,End_date,"0");
				modelAndViewObj = new ModelAndView();
				
				if(subAccountTypeMasterList == null || subAccountTypeMasterList.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(subAccountTypeMasterList.size()<end){
						end = (subAccountTypeMasterList.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					
					modelAndViewObj.addObject("totalRecords",subAccountTypeMasterList.get(0).getTotalRecords());
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
					modelAndViewObj.addObject("maxRecords", 10);
					
				
				}
				
				modelAndViewObj.addObject("Organization", Organization);
				modelAndViewObj.addObject("accountId", accountId);
				modelAndViewObj.addObject("accountname", accountname);
				modelAndViewObj.addObject("Start_date", Start_date);
				modelAndViewObj.addObject("End_date", End_date);
				modelAndViewObj.addObject("status", status);
				modelAndViewObj.addObject("subAssetsList", subAccountTypeMasterList);
				modelAndViewObj.setViewName("FinantialManagement/IncomeSubLedger");
				return modelAndViewObj;
			}	
			
			@RequestMapping("/viewIncomeSubLedger")
			public ModelAndView viewIncomeSubLedger(@RequestParam("AccountId") String accountId,@RequestParam("SubAccountId") String SubAccountId,
					@RequestParam("organizationId") String organizationId,@RequestParam("accountName") String accountName,
					HttpServletRequest request,HttpServletResponse response){
				String accountType = "Income";
				modelAndViewObj = new ModelAndView();
				List<SubAccountTypeMaster> subAccountTypeMasterList = genericMasterServiceObj.getSubLedger(accountId,SubAccountId,accountType,"","","","0");
				modelAndViewObj.addObject("accountId", accountId);
				modelAndViewObj.addObject("subAssetsList", subAccountTypeMasterList);
				modelAndViewObj.addObject("Organization", organizationId);
	 			modelAndViewObj.addObject("accountname", accountName);
				modelAndViewObj.setViewName("FinantialManagement/IncomeSubLedger");
				return modelAndViewObj;
			}	
			@RequestMapping("/editIncomeSubLedger")
			public ModelAndView editIncomeSubLedger(@RequestParam("AccountId") String accountId,@RequestParam("SubAccountId") String SubAccountId,
					@RequestParam("organizationId") String organizationId,@RequestParam("accountName") String accountName,
					HttpServletRequest request,HttpServletResponse response){
				modelAndViewObj = new ModelAndView();
				String accountType = "Income";
				List<SubAccountTypeMaster> subAccountTypeMasterList = genericMasterServiceObj.getSubLedger(accountId,SubAccountId,accountType,"","","", "0");
				modelAndViewObj.addObject("accountId", accountId);
				modelAndViewObj.addObject("subAssetsList", subAccountTypeMasterList);
				modelAndViewObj.addObject("Organization", organizationId);
	 			modelAndViewObj.addObject("accountname", accountName);
				modelAndViewObj.setViewName("FinantialManagement/IncomeSubLedger");
				return modelAndViewObj;
			}
	//Added by Surya.k on 27/04/2019 Accounting Expenses SubLedger flows
			
			@RequestMapping("/createSubExpensesMaster")
			public ModelAndView createSubExpensesMaster(@RequestParam("accountId") String accountId,@RequestParam("subaccountId") String subaccountId,
					@RequestParam("subaccountName") String subaccountName,@RequestParam("subdiscription") String subdiscription,
					@RequestParam("accountType") String accountType,@RequestParam("Status") String Status,
					@RequestParam("organizationId") String organizationId,@RequestParam("accountName") String accountName,
					HttpServletRequest request,HttpServletResponse response){
				String customerId = (String)request.getSession().getAttribute("customerId");
				String emailId = (String)request.getSession().getAttribute("emailId");
				String resultStr = genericMasterServiceObj.createSubLedgerMaster(customerId,emailId,accountId,subaccountId,subaccountName,subdiscription,accountType,Status);
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("accountId", accountId);
				modelAndViewObj.addObject("resultStr", resultStr);
				modelAndViewObj.addObject("Organization", organizationId);
	 			modelAndViewObj.addObject("accountname", accountName);
				modelAndViewObj.setViewName("FinantialManagement/ExpensesSubLedger");
				return modelAndViewObj;
			}
			@RequestMapping("/editSubExpensesMaster")
			public ModelAndView editSubExpensesMaster(@RequestParam("accountId") String accountId,@RequestParam("subaccountId") String subaccountId,
					@RequestParam("subaccountName") String subaccountName,@RequestParam("subdiscription") String subdiscription,
					@RequestParam("accountType") String accountType,@RequestParam("Status") String Status,
					@RequestParam("organizationId") String organizationId,@RequestParam("accountName") String accountName,
					HttpServletRequest request,HttpServletResponse response){
				String customerId = (String)request.getSession().getAttribute("customerId");
				String emailId = (String)request.getSession().getAttribute("emailId");
				String resultStr = genericMasterServiceObj.editSubLedgerMaster(customerId,emailId,accountId,subaccountId,subaccountName,subdiscription,accountType,Status);
				List<SubAccountTypeMaster> subAccountTypeMasterList = genericMasterServiceObj.getSubLedger(accountId,subaccountId,accountType,"","","", "0");

				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("accountId", accountId);
				modelAndViewObj.addObject("resultStr", resultStr);
				modelAndViewObj.addObject("Organization", organizationId);
	 			modelAndViewObj.addObject("accountname", accountName);
				modelAndViewObj.addObject("subAssetsList", subAccountTypeMasterList);
				modelAndViewObj.setViewName("FinantialManagement/ExpensesSubLedger");
				return modelAndViewObj;
			}
			
			
			
			@RequestMapping("/createExpensesSubLedger")
			public ModelAndView createExpensesSubLedger(@RequestParam("AccountId") String accountId,HttpServletRequest request,HttpServletResponse response){
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("accountId", accountId);
				modelAndViewObj.setViewName("FinantialManagement/CreateExpensesSubLedger");
				return modelAndViewObj;
			}	

			@RequestMapping("/showExpensesSubLedger")
			public ModelAndView showExpensesSubLedger(@RequestParam("AccountId") String accountId,
					@RequestParam("AccountName") String accountname,@RequestParam("Organization") String Organization,
					@RequestParam("Start_date") String Start_date,@RequestParam("End_date") String End_date,@RequestParam("status") String status,
					@RequestParam("maxRecords") String maxRecords,@RequestParam("index") String index,
					HttpServletRequest request,HttpServletResponse response){
				String accountType = "Expenses";
				int start = 1;
				int end;
				
				if(maxRecords.equals(""))
					end=Integer.parseInt("0");
				else
					end=Integer.parseInt(maxRecords);
				
				
				if(index.equals(""))
					index="0";
				List<SubAccountTypeMaster> subAccountTypeMasterList = genericMasterServiceObj.getSubLedger(accountId,"",accountType,status,Start_date,End_date,"0");
				modelAndViewObj = new ModelAndView();
				
				if(subAccountTypeMasterList == null || subAccountTypeMasterList.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(subAccountTypeMasterList.size()<end){
						end = (subAccountTypeMasterList.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					
					modelAndViewObj.addObject("totalRecords",subAccountTypeMasterList.get(0).getTotalRecords());
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
					modelAndViewObj.addObject("maxRecords", 10);
					
				
				}
				modelAndViewObj.addObject("Organization", Organization);
				modelAndViewObj.addObject("accountId", accountId);
				modelAndViewObj.addObject("accountname", accountname);
				modelAndViewObj.addObject("Start_date", Start_date);
				modelAndViewObj.addObject("End_date", End_date);
				modelAndViewObj.addObject("status", status);
				modelAndViewObj.addObject("subAssetsList", subAccountTypeMasterList);
				modelAndViewObj.setViewName("FinantialManagement/ExpensesSubLedger");
				return modelAndViewObj;
			}	
			
			@RequestMapping("/viewExpensesSubLedger")
			public ModelAndView viewExpensesSubLedger(@RequestParam("AccountId") String accountId,@RequestParam("SubAccountId") String SubAccountId,
					@RequestParam("organizationId") String organizationId,@RequestParam("accountName") String accountName,
					HttpServletRequest request,HttpServletResponse response){
				String accountType = "Expenses";
				modelAndViewObj = new ModelAndView();
				List<SubAccountTypeMaster> subAccountTypeMasterList = genericMasterServiceObj.getSubLedger(accountId,SubAccountId,accountType,"","","","0");
				modelAndViewObj.addObject("accountId", accountId);
				modelAndViewObj.addObject("subAssetsList", subAccountTypeMasterList);
				modelAndViewObj.addObject("Organization", organizationId);
	 			modelAndViewObj.addObject("accountname", accountName);
				modelAndViewObj.setViewName("FinantialManagement/ExpensesSubLedger");
				return modelAndViewObj;
			}	
			@RequestMapping("/editExpensesSubLedger")
			public ModelAndView editExpensesSubLedger(@RequestParam("AccountId") String accountId,@RequestParam("SubAccountId") String SubAccountId,
					@RequestParam("organizationId") String organizationId,@RequestParam("accountName") String accountName,
					HttpServletRequest request,HttpServletResponse response){
				modelAndViewObj = new ModelAndView();
				String accountType = "Expenses";
				List<SubAccountTypeMaster> subAccountTypeMasterList = genericMasterServiceObj.getSubLedger(accountId,SubAccountId,accountType,"","","", "0");
				modelAndViewObj.addObject("accountId", accountId);
				modelAndViewObj.addObject("subAssetsList", subAccountTypeMasterList);
				modelAndViewObj.addObject("Organization", organizationId);
	 			modelAndViewObj.addObject("accountname", accountName);
				modelAndViewObj.setViewName("FinantialManagement/ExpensesSubLedger");
				return modelAndViewObj;
			}
			
			@RequestMapping("/showOrderReportsFlow")
			public ModelAndView showOrderReportsFlow(HttpServletRequest request,HttpServletResponse response){
				// log.info("showUsersFlow");
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.setViewName("UserAccessControl/Users/orderReportsFlow");
				return modelAndViewObj;
			}
			@RequestMapping("/showB2BSaleOrdersFlow")
			public ModelAndView showB2BSaleOrdersFlow(HttpServletRequest request,HttpServletResponse response){
				// log.info("showUsersFlow");
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.setViewName("UserAccessControl/Users/b2bSaleOrdersFlow");
				return modelAndViewObj;
			}
			

			@RequestMapping(value="/uploadBankStatement",method=RequestMethod.POST)
			public String   uploadBankStatement(
					@RequestParam("file") MultipartFile excelFile,
					HttpServletRequest request,HttpServletResponse response) 
			{
				String jsonString = "";
				String resultStr="";
				MasterDataImportsAndExportsBean masterDataImportsAndExportsBean=null;
				String customerId = (String)request.getSession().getAttribute("customerId");
				String emailId = (String)request.getSession().getAttribute("emailId");
				try{
					RestfulServiceConnection restfulServiceConnection=new RestfulServiceConnection();
					masterDataImportsAndExportsBean = restfulServiceConnection.uploadFile(customerId, excelFile);
					MasterDataImportsAndExportsBean responseObj = genericMasterServiceObj.uploadBankStatement(masterDataImportsAndExportsBean.getFileName(),customerId, emailId);
					if(responseObj.getResponseHeader().getResponseCode().equals("0")){
						jsonString = "{\"msg\":\" "+responseObj.getResponseHeader().getResponseMessage()+"\"}";
						resultStr = responseObj.getResponseHeader().getResponseMessage();
					}else {
						jsonString = "{\"err\":\" "+responseObj.getResponseHeader().getResponseMessage()+"\" ,\"errorUrl\":\""+responseObj.getUrl()+"\"}";
						resultStr = responseObj.getResponseHeader().getResponseMessage();
					}
						/* }
				else
					jsonString = "{\"err\":\" "+status+"\"}";*/
				
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
		    	response.getWriter().write(jsonString);
			}catch(Exception e){
				e.printStackTrace();
			}finally {
		    	try {
					response.getWriter().close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		    
		    }
				return resultStr;
			}

			@RequestMapping("/startReconciliation")
			public ModelAndView startReconciliation(@RequestParam("AccountId") String AccountId,@RequestParam("Account_Name") String Account_Name,
					@RequestParam("start_date") String start_date,@RequestParam("end_date") String end_date,
					HttpServletRequest request,HttpServletResponse response){
				
				modelAndViewObj = new ModelAndView();
				int totalSize=0;
				ArrayList<String> accountId=new ArrayList<String>();
				ArrayList<String> accountName=new ArrayList<String>();
				String customerId = (String)request.getSession().getAttribute("customerId");
				String emailId = (String)request.getSession().getAttribute("emailId");
				String OrganizationId="";
				ReconciliationMaster reconciliationObj = genericMasterServiceObj.startReconciliation(AccountId,Account_Name,start_date,end_date);
				List<AccountTypeMaster>  bankbookList = genericMasterServiceObj.getBankBook();
				for(int i=0;i<bankbookList.size();i++){
					//accountId.add(bankbookList.get(i).getAccountId());
					//accountName.add(bankbookList.get(i).getAccountName());
					for(int j=0;j<bankbookList.get(i).getSubAccountTypeMasters().size();j++){
						accountId.add(bankbookList.get(i).getSubAccountTypeMasters().get(j).getSubAccountTypeId());
						accountName.add(bankbookList.get(i).getSubAccountTypeMasters().get(j).getAccountName());
					}
				}
				totalSize = reconciliationObj.getBankBookReconciliation().size()+reconciliationObj.getTransactionReconciliation().size();;
				
				List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);
				modelAndViewObj.addObject("OrganizationList", OrganizationList);
				modelAndViewObj.addObject("accountId", accountId);
				modelAndViewObj.addObject("accountName", accountName);
				modelAndViewObj.addObject("totalSize", totalSize);
				modelAndViewObj.addObject("bankbookList", bankbookList);
				
				modelAndViewObj.addObject("reconciliationObj", reconciliationObj);
				modelAndViewObj.setViewName("FinantialManagement/Reconciliation");
				return modelAndViewObj;
			}
			
			
			@RequestMapping(value ="/saveReconciliation", method = RequestMethod.POST, consumes = "application/json")
			public ModelAndView saveReconciliation(@RequestBody ReconciliationMaster reconciliationMasterObj,HttpServletRequest request,HttpServletResponse response){
				String customerId = (String)request.getSession().getAttribute("customerId");
				String emailId = (String)request.getSession().getAttribute("emailId");
				String str = genericMasterServiceObj.saveReconciliation(reconciliationMasterObj);
				modelAndViewObj = new ModelAndView();
				
				if(!str.equals(AppProperties.getAppMessageByProperty("RECONCILIATION_SAVED_SUCCESSFULLY").trim())){
					modelAndViewObj.addObject("err", str);
				}else{
					modelAndViewObj.addObject("success", str);
				}
				modelAndViewObj.setViewName("FinantialManagement/Reconciliation");
				return modelAndViewObj;
			}
			
			

			
			@RequestMapping("/showAssetsSubTransactions")
			public ModelAndView showAssetsSubTransactions(@RequestParam("SubAccountId") String SubAccountId,@RequestParam("Organization") String organization,
					@RequestParam("Zone") String zone,@RequestParam("Location") String location,@RequestParam("TxnType") String txnType,
					@RequestParam("Start_date") String start_date,@RequestParam("End_date") String end_date,@RequestParam("maxRecords") String maxRecords,
					@RequestParam("index") String index,HttpServletRequest request,HttpServletResponse response){
				// log.info("showUserAccessControlFlow");
				String customerId = (String)request.getSession().getAttribute("customerId");
				String emailId = (String)request.getSession().getAttribute("emailId");
				String OrganizationId = "";
				String accountType="Assets";
				int start = 1;
				int end;
				
				if(maxRecords.equals(""))
					end=Integer.parseInt("0");
				else
					end=Integer.parseInt(maxRecords);
				
				
				if(index.equals(""))
					index="0";	
				//OrganizationMaster organizationMaster = new OrganizationMaster();
				List<AssetAccounts> AssetsList = genericMasterServiceObj.getSubAccountTransactions(customerId, emailId,SubAccountId,organization,zone,location,txnType,start_date,end_date,index,accountType);
				List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);
				List<OrganizationLocations> locationsList = genericMasterServiceObj.getOrganizationLocationDetails(organization,customerId,emailId);
				modelAndViewObj = new ModelAndView();
				if(AssetsList == null || AssetsList.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");		
				}else{
					if(AssetsList.size()<end){
						end = (AssetsList.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					
					modelAndViewObj.addObject("totalRecords",(AssetsList.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
					modelAndViewObj.addObject("maxRecords", 10);
				}
				modelAndViewObj.addObject("AssetsList", AssetsList);
				modelAndViewObj.addObject("AccountId", SubAccountId);
				modelAndViewObj.addObject("OrganizationList", OrganizationList);
				modelAndViewObj.addObject("locationsList", locationsList);
				
				modelAndViewObj.addObject("organizationID", organization);
				modelAndViewObj.addObject("zone", zone);
				modelAndViewObj.addObject("selectedLocation", location);
				modelAndViewObj.addObject("txnType", txnType);
				modelAndViewObj.addObject("start_date", start_date);
				modelAndViewObj.addObject("end_date", end_date);
				
				modelAndViewObj.setViewName("FinantialManagement/AssetSubTransactions");
				return modelAndViewObj;
			}
			
			@RequestMapping("/createAssetsSubTransactions")
			public ModelAndView createAssetsSubTransactions(@RequestParam("accountId") String AccountId,@RequestParam("accountName") String AccounName,@RequestParam("location") String location,@RequestParam("txnDiscription") String TxnDiscription,@RequestParam("txnDate") String TxnDate,@RequestParam("txnType") String TxnType,@RequestParam("txnValue") String TxnValue,HttpServletRequest request,HttpServletResponse response){
				String customerId = (String)request.getSession().getAttribute("customerId");
				String emailId = (String)request.getSession().getAttribute("emailId");
				String OrganizationId = "";
				String accountType="Assets";
				String resultStr = genericMasterServiceObj.createSubAccountTransactions(customerId, emailId,AccountId,AccounName,location,TxnDiscription,TxnType,TxnDate,TxnValue,accountType);
				List<AssetAccounts> AssetsList = genericMasterServiceObj.getSubAccountTransactions(customerId, emailId,AccountId,"","","","","","","",accountType);
				List<OrganizationLocations> locationsList = genericMasterServiceObj.getOrganizationLocationDetails(OrganizationId,customerId,emailId);
				List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);

				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("AssetsList", AssetsList);
				modelAndViewObj.addObject("AccountId", AccountId);
				modelAndViewObj.addObject("OrganizationList", OrganizationList);
				modelAndViewObj.addObject("locationsList", locationsList);
				modelAndViewObj.addObject("resultStr", resultStr);
				modelAndViewObj.setViewName("FinantialManagement/AssetSubTransactions");
				return modelAndViewObj;
			}
			
			
			@RequestMapping("/showLiabilitesSubTransactions")
			public ModelAndView showLiabilitesSubTransactions(@RequestParam("SubAccountId") String AccountId,@RequestParam("Organization") String organization,
					@RequestParam("Zone") String zone,@RequestParam("Location") String location,@RequestParam("TxnType") String txnType,
					@RequestParam("Start_date") String start_date,@RequestParam("End_date") String end_date,@RequestParam("maxRecords") String maxRecords,
					@RequestParam("index") String index,HttpServletRequest request,HttpServletResponse response){
				// log.info("showUserAccessControlFlow");
				String customerId = (String)request.getSession().getAttribute("customerId");
				String emailId = (String)request.getSession().getAttribute("emailId");
				String OrganizationId ="";
				String accountType="Liability";
				int start = 1;
				int end;
				
				if(maxRecords.equals(""))
					end=Integer.parseInt("0");
				else
					end=Integer.parseInt(maxRecords);
				
				
				if(index.equals(""))
					index="0";	
				//OrganizationMaster organizationMaster = new OrganizationMaster();
				List<AssetAccounts> AssetsList = genericMasterServiceObj.getSubAccountTransactions(customerId, emailId,AccountId,organization,zone,location,txnType,start_date,end_date,index,accountType);
				
				List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);
				List<OrganizationLocations> locationsList = genericMasterServiceObj.getOrganizationLocationDetails(organization,customerId,emailId);

				modelAndViewObj = new ModelAndView();
				if(AssetsList == null || AssetsList.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");		
				}else{
					if(AssetsList.size()<end){
						end = (AssetsList.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					
					modelAndViewObj.addObject("totalRecords",(AssetsList.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
					modelAndViewObj.addObject("maxRecords", 10);
				}
				
				modelAndViewObj.addObject("AssetsList", AssetsList);
				modelAndViewObj.addObject("OrganizationList", OrganizationList);
				modelAndViewObj.addObject("AccountId", AccountId);
				modelAndViewObj.addObject("locationsList", locationsList);
				
				modelAndViewObj.addObject("organizationID", organization);
				modelAndViewObj.addObject("zone", zone);
				modelAndViewObj.addObject("selectedLocation", location);
				modelAndViewObj.addObject("txnType", txnType);
				modelAndViewObj.addObject("start_date", start_date);
				modelAndViewObj.addObject("end_date", end_date);
				
				modelAndViewObj.setViewName("FinantialManagement/LiabilitiesSubTransactions");
				return modelAndViewObj;
			}
			
			@RequestMapping("/createLiabilitesSubTransactions")
			public ModelAndView createLiabilitesSubTransactions(@RequestParam("accountId") String AccountId,@RequestParam("accountName") String AccounName,@RequestParam("location") String location,@RequestParam("txnDiscription") String TxnDiscription,@RequestParam("txnDate") String TxnDate,@RequestParam("txnType") String TxnType,@RequestParam("txnValue") String TxnValue,HttpServletRequest request,HttpServletResponse response){
				// log.info("showUserAccessControlFlow");
				String customerId = (String)request.getSession().getAttribute("customerId");
				String emailId = (String)request.getSession().getAttribute("emailId");
				String accountType="Liability";
				String OrganizationId="";
				//OrganizationMaster organizationMaster = new OrganizationMaster();
				String resultStr = genericMasterServiceObj.createSubAccountTransactions(customerId, emailId,AccountId,AccounName,location,TxnDiscription,TxnType,TxnDate,TxnValue,accountType);
				//ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
				List<AssetAccounts> AssetsList = genericMasterServiceObj.getSubAccountTransactions(customerId, emailId,AccountId,"","","","","","","",accountType);
				List<OrganizationLocations> locationsList = genericMasterServiceObj.getOrganizationLocationDetails(OrganizationId,customerId,emailId);
				List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,"");

				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("AssetsList", AssetsList);
				modelAndViewObj.addObject("locationsList", locationsList);
				modelAndViewObj.addObject("OrganizationList", OrganizationList);
				modelAndViewObj.addObject("AccountId", AccountId);
				modelAndViewObj.addObject("resultStr", resultStr);
				modelAndViewObj.setViewName("FinantialManagement/LiabilitiesSubTransactions");
				return modelAndViewObj;
			}
		
			@RequestMapping("/showIncomeSubTransactions")
			public ModelAndView showIncomeSubTransactions(@RequestParam("SubAccountId") String AccountId,@RequestParam("Organization") String organization,
					@RequestParam("Zone") String zone,@RequestParam("Location") String location,@RequestParam("TxnType") String txnType,
					@RequestParam("Start_date") String start_date,@RequestParam("End_date") String end_date,@RequestParam("maxRecords") String maxRecords,
					@RequestParam("index") String index,HttpServletRequest request,HttpServletResponse response){
				// log.info("showUserAccessControlFlow");
				String customerId = (String)request.getSession().getAttribute("customerId");
				String emailId = (String)request.getSession().getAttribute("emailId");
				String OrganizationId ="";
				String accountType="Income";
				int start = 1;
				int end;
				
				if(maxRecords.equals(""))
					end=Integer.parseInt("0");
				else
					end=Integer.parseInt(maxRecords);
						
				if(index.equals(""))
					index="0";	
				//OrganizationMaster organizationMaster = new OrganizationMaster();
				List<AssetAccounts> AssetsList = genericMasterServiceObj.getSubAccountTransactions(customerId, emailId,AccountId,organization,zone,location,txnType,start_date,end_date,index,accountType);
				List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);

				List<OrganizationLocations> locationsList = genericMasterServiceObj.getOrganizationLocationDetails(OrganizationId,customerId,emailId);
				modelAndViewObj = new ModelAndView();
				if(AssetsList == null || AssetsList.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");		
				}else{
					if(AssetsList.size()<end){
						end = (AssetsList.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					
					modelAndViewObj.addObject("totalRecords",(AssetsList.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
					modelAndViewObj.addObject("maxRecords", 10);
				}
				
				modelAndViewObj.addObject("AssetsList", AssetsList);
				modelAndViewObj.addObject("AccountId", AccountId);
				modelAndViewObj.addObject("OrganizationList", OrganizationList);
				modelAndViewObj.addObject("locationsList", locationsList);
				
				modelAndViewObj.addObject("organizationID", organization);
				modelAndViewObj.addObject("zone", zone);
				modelAndViewObj.addObject("selectedLocation", location);
				modelAndViewObj.addObject("txnType", txnType);
				modelAndViewObj.addObject("start_date", start_date);
				modelAndViewObj.addObject("end_date", end_date);
				
				modelAndViewObj.setViewName("FinantialManagement/IncomeSubTransactions");
				return modelAndViewObj;
			}
			
			@RequestMapping("/createIncomeSubTransactions")
			public ModelAndView createIncomeSubTransactions(@RequestParam("accountId") String AccountId,@RequestParam("accountName") String AccounName,
					@RequestParam("txnDiscription") String TxnDiscription,@RequestParam("txnDate") String TxnDate,
					@RequestParam("txnType") String TxnType,@RequestParam("location") String location,
					@RequestParam("txnValue") String TxnValue,HttpServletRequest request,HttpServletResponse response){
				String customerId = (String)request.getSession().getAttribute("customerId");
				String emailId = (String)request.getSession().getAttribute("emailId");
				String OrganizationId ="";
				String accountType="Income";
				//OrganizationMaster organizationMaster = new OrganizationMaster();
				String resultStr = genericMasterServiceObj.createSubAccountTransactions(customerId, emailId,AccountId,AccounName,location,TxnDiscription,TxnType,TxnDate,TxnValue,accountType);

				//ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
				List<AssetAccounts> AssetsList = genericMasterServiceObj.getSubAccountTransactions(customerId, emailId,AccountId,"","","","","","","",accountType);
				List<OrganizationLocations> locationsList = genericMasterServiceObj.getOrganizationLocationDetails(OrganizationId,customerId,emailId);
				List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,"");

				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("AssetsList", AssetsList);
				modelAndViewObj.addObject("locationsList", locationsList);
				modelAndViewObj.addObject("OrganizationList", OrganizationList);
				modelAndViewObj.addObject("AccountId", AccountId);
				modelAndViewObj.addObject("resultStr", resultStr);
				modelAndViewObj.setViewName("FinantialManagement/IncomeSubTransactions");
				return modelAndViewObj;
			}
					@RequestMapping("/showExpensesSubTransactions")
			public ModelAndView showExpensesSubTransactions(@RequestParam("SubAccountId") String AccountId,@RequestParam("Organization") String organization,
					@RequestParam("Zone") String zone,@RequestParam("Location") String location,@RequestParam("TxnType") String txnType,
					@RequestParam("Start_date") String start_date,@RequestParam("End_date") String end_date,@RequestParam("maxRecords") String maxRecords,
					@RequestParam("index") String index,HttpServletRequest request,HttpServletResponse response){
				// log.info("showUserAccessControlFlow");
				String customerId = (String)request.getSession().getAttribute("customerId");
				String emailId = (String)request.getSession().getAttribute("emailId");
				String OrganizationId ="";
				String accountType="Expenses";
				int start = 1;
				int end;
				
				if(maxRecords.equals(""))
					end=Integer.parseInt("0");
				else
					end=Integer.parseInt(maxRecords);
						
				if(index.equals(""))
					index="0";	
				
				//OrganizationMaster organizationMaster = new OrganizationMaster();
				List<AssetAccounts> AssetsList = genericMasterServiceObj.getSubAccountTransactions(customerId, emailId,AccountId,organization,zone,location,txnType,start_date,end_date,index,accountType);
				List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);

				List<OrganizationLocations> locationsList = genericMasterServiceObj.getOrganizationLocationDetails(OrganizationId,customerId,emailId);
				modelAndViewObj = new ModelAndView();
				
				if(AssetsList == null || AssetsList.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");		
				}else{
					if(AssetsList.size()<end){
						end = (AssetsList.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					
					modelAndViewObj.addObject("totalRecords",(AssetsList.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
					modelAndViewObj.addObject("maxRecords", 10);
				}
				
				modelAndViewObj.addObject("AssetsList", AssetsList);
				modelAndViewObj.addObject("AccountId", AccountId);
				modelAndViewObj.addObject("OrganizationList", OrganizationList);
				modelAndViewObj.addObject("locationsList", locationsList);
				
				modelAndViewObj.addObject("organizationID", organization);
				modelAndViewObj.addObject("zone", zone);
				modelAndViewObj.addObject("selectedLocation", location);
				modelAndViewObj.addObject("txnType", txnType);
				modelAndViewObj.addObject("start_date", start_date);
				modelAndViewObj.addObject("end_date", end_date);
				
				modelAndViewObj.setViewName("FinantialManagement/ExpensesSubTransactions");
				return modelAndViewObj;
			}
			
			@RequestMapping("/createExpensesSubTransactions")
			public ModelAndView createExpensesSubTransactions(@RequestParam("accountId") String AccountId,@RequestParam("accountName") String AccounName,
					@RequestParam("txnDiscription") String TxnDiscription,@RequestParam("txnDate") String TxnDate,@RequestParam("txnType") String TxnType,
					@RequestParam("txnValue") String TxnValue,@RequestParam("location") String location,
					HttpServletRequest request,HttpServletResponse response){
				// log.info("showUserAccessControlFlow");
				String customerId = (String)request.getSession().getAttribute("customerId");
				String emailId = (String)request.getSession().getAttribute("emailId");
				String accountType="Expenses";
				//OrganizationMaster organizationMaster = new OrganizationMaster();
				String resultStr = genericMasterServiceObj.createSubAccountTransactions(customerId, emailId,AccountId,AccounName,location,TxnDiscription,TxnType,TxnDate,TxnValue,accountType);
				//ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","",false,true,true);
				List<AssetAccounts> AssetsList = genericMasterServiceObj.getSubAccountTransactions(customerId, emailId,AccountId,"","","","","","","",accountType);
				List<OrganizationLocations> locationsList = genericMasterServiceObj.getOrganizationLocationDetails("",customerId,emailId);
				List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,"");

				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("AssetsList", AssetsList);
				modelAndViewObj.addObject("locationsList", locationsList);
				modelAndViewObj.addObject("OrganizationList", OrganizationList);
				modelAndViewObj.addObject("AccountId", AccountId);
				modelAndViewObj.addObject("resultStr", resultStr);
				modelAndViewObj.setViewName("FinantialManagement/ExpensesSubTransactions");
				return modelAndViewObj;
			}
			
			@RequestMapping("/getPurcphasePaymentsPDF")
			public  @ResponseBody String getPurcphasePaymentsPDF(@RequestParam("RefId") String refId,HttpServletRequest request,HttpServletResponse response){
				
				String customerId = (String)request.getSession().getAttribute("customerId");
				String emailId = (String)request.getSession().getAttribute("emailId");
				
				String resultStr = genericMasterServiceObj.getPurcphasePaymentsPDF(customerId, emailId,refId,"");

				
				return resultStr;
			}
			

			@RequestMapping("/getSalesPaymentsPDF")
			public  @ResponseBody String getSalesPaymentsPDF(@RequestParam("RefId") String refId,HttpServletRequest request,HttpServletResponse response){
				
				String customerId = (String)request.getSession().getAttribute("customerId");
				String emailId = (String)request.getSession().getAttribute("emailId");
				
				String resultStr = genericMasterServiceObj.getSalesPaymentsPDF(customerId, emailId,refId,"");

				
				return resultStr;
			}
			
			@RequestMapping("/getStockIssuePDF")
			public  @ResponseBody String getStockIssuePDF(@RequestParam("RefId") String refId,HttpServletRequest request,HttpServletResponse response){
				
				String customerId = (String)request.getSession().getAttribute("customerId");
				String emailId = (String)request.getSession().getAttribute("emailId");
				
				String resultStr = genericMasterServiceObj.getStockIssuePDF(customerId, emailId,refId,"");

				
				return resultStr;
			}
			
			

			//Added by Surya.k 
			@RequestMapping(value = "/createPettyCashPayments", method = RequestMethod.POST, consumes = "application/json")
				public @ResponseBody  String createPettyCashPayments(@RequestBody PettyCashBook pettycashObj,HttpServletRequest request,HttpServletResponse response){
					String customerId = (String)request.getSession().getAttribute("customerId");
					String emailId = (String)request.getSession().getAttribute("emailId");
					String result=null;
					result= genericMasterServiceObj.createPettyCashPayments(pettycashObj);
					
					
					return result;
				}
			
			//Added by Surya.k 
			@RequestMapping(value = "/editPettyCashPayments", method = RequestMethod.POST, consumes = "application/json")
				public @ResponseBody  String editPettyCashPayments(@RequestBody PettyCashBook pettycashObj,HttpServletRequest request,HttpServletResponse response){
					String customerId = (String)request.getSession().getAttribute("customerId");
					String emailId = (String)request.getSession().getAttribute("emailId");
					String result=null;
					result= genericMasterServiceObj.updatePettyCashBook(pettycashObj);
					
					
					return result;
				}

			//Added by Surya.k 
			@RequestMapping(value = "/createPettyCashReceipt")
				public  @ResponseBody  String createPettyCashReceipt(@RequestParam("location") String location,@RequestParam("receivedAmt") String receivedAmt,
						@RequestParam("receivedFrom") String receivedFrom,@RequestParam("bankAccount") String bankAccount,
						@RequestParam("purpose") String purpose,@RequestParam("date") String date,
						@RequestParam("givenBy") String givenBy,@RequestParam("receivedBy") String receivedBy,
						@RequestParam("txnDescription") String txnDescription,@RequestParam("transactionId") String transactionId
						,HttpServletRequest request,HttpServletResponse response){
					String customerId = (String)request.getSession().getAttribute("customerId");
					String emailId = (String)request.getSession().getAttribute("emailId");
					String result=null;
					PettyCashBook pettycashObj =new PettyCashBook();
					pettycashObj.setLocation(location);
					pettycashObj.setTransactionAmount(receivedAmt);
					pettycashObj.setReceivedFrom(receivedFrom);
					pettycashObj.setBankAccount(bankAccount);
					pettycashObj.setPurpose(purpose);
					pettycashObj.setTransactionDateStr(date);
					pettycashObj.setGivenBy(givenBy);
					pettycashObj.setReceivedBy(receivedBy);
					pettycashObj.setTransactionDescription(txnDescription);
					pettycashObj.setTransactionType("CASH RECEIPT");
					pettycashObj.setVoucherNo("");
					pettycashObj.setTransactionId(transactionId);
					result= genericMasterServiceObj.createPettyCashReceipt(pettycashObj);
					
					
					return result;
				}
				
			//Added by Surya.k 
			@RequestMapping(value = "/editPettyCashReceipt")
				public  @ResponseBody  String editPettyCashReceipt(@RequestParam("location") String location,@RequestParam("receivedAmt") String receivedAmt,
						@RequestParam("receivedFrom") String receivedFrom,@RequestParam("bankAccount") String bankAccount,
						@RequestParam("purpose") String purpose,@RequestParam("date") String date,@RequestParam("transactionId") String transactionId,
						@RequestParam("givenBy") String givenBy,@RequestParam("receivedBy") String receivedBy,@RequestParam("txnDescription") String txnDescription
						,HttpServletRequest request,HttpServletResponse response){
					String customerId = (String)request.getSession().getAttribute("customerId");
					String emailId = (String)request.getSession().getAttribute("emailId");
					String result=null;
					PettyCashBook pettycashObj =new PettyCashBook();
					pettycashObj.setLocation(location);
					pettycashObj.setTransactionAmount(receivedAmt);
					pettycashObj.setReceivedFrom(receivedFrom);
					pettycashObj.setBankAccount(bankAccount);
					pettycashObj.setPurpose(purpose);
					pettycashObj.setTransactionDateStr(date);
					pettycashObj.setGivenBy(givenBy);
					pettycashObj.setReceivedBy(receivedBy);
					pettycashObj.setTransactionDescription(txnDescription);
					pettycashObj.setTransactionType("CASH RECEIPT");
					pettycashObj.setVoucherNo("");
					pettycashObj.setTransactionId(transactionId);
					result= genericMasterServiceObj.updatePettyCashBook(pettycashObj);
					
					
					return result;
				}

				//Added by Surya.k 
					@RequestMapping("/getPettyCash")
					public ModelAndView getPettyCash(@RequestParam("organization") String organization,@RequestParam("zone") String zone,
							@RequestParam("location") String location,@RequestParam("category") String category,
							@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,
							@RequestParam("maxRecords") String maxRecords,@RequestParam("index") String index,
							@RequestParam("searchCriteria") String searchCriteria,@RequestParam("file") String file,HttpServletRequest request,HttpServletResponse response){
						String customerId = (String)request.getSession().getAttribute("customerId");
						String emailId = (String)request.getSession().getAttribute("emailId");
						ArrayList<String> accountName=new ArrayList<String>();
						String OrganizationId="";
						String transactionId="";
						String filePath;
						int start = 1;
						int end;
						int size=0;
						
						if(maxRecords.equals(""))
							end=Integer.parseInt("0");
						else
							end=Integer.parseInt(maxRecords);
						
						
						if(index.equals(""))
							index="0";
						List<OrganizationLocations> OrganizationlocationsList = genericMasterServiceObj.getOrganizationLocationDetails("",customerId,emailId);
						List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);
						ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","Retail Outlet",false,true,true);
						PettyCashBook paymentsList = genericMasterServiceObj.getPettyCashBook(transactionId,organization,zone,location,category,startDate,endDate,index,searchCriteria,file);
						List<AccountTypeMaster>  bankbookList = genericMasterServiceObj.getBankBook();
						if(bankbookList!=null){
							for(int i=0;i<bankbookList.size();i++){
								for(int j=0;j<bankbookList.get(i).getSubAccountTypeMasters().size();j++){
									accountName.add(bankbookList.get(i).getSubAccountTypeMasters().get(j).getAccountName());
								}
							}
						}
						
						modelAndViewObj = new ModelAndView();
						
						if(paymentsList.getResponseHeader()==null){
							modelAndViewObj.addObject("totalRecords","0");
							modelAndViewObj.addObject("index", "0");
							modelAndViewObj.addObject("totalValue", "0");
							filePath="";
						}
						else{
							if(paymentsList.getCashReceipts().size()<paymentsList.getCashPayments().size()){
								size =paymentsList.getCashPayments().size();
							}else{
								size =paymentsList.getCashReceipts().size();
							}
							if(size<end){
								end = (size)+(Integer.parseInt(index));
							}else{
								end = (Integer.parseInt(index)+end);
							}
							
							modelAndViewObj.addObject("totalRecords",paymentsList.getTotalRecords());
							modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
							modelAndViewObj.addObject("totalValue", end);
							modelAndViewObj.addObject("maxRecords", 10);
							
							
							
							filePath = paymentsList.getFilePath();
						}
						modelAndViewObj.addObject("selectedOrganization", organization);
						modelAndViewObj.addObject("zone", zone);
						modelAndViewObj.addObject("selectedLocation", location);
						modelAndViewObj.addObject("startDate", startDate);
						modelAndViewObj.addObject("endDate", endDate);
						modelAndViewObj.addObject("filePath", filePath);
						
						modelAndViewObj.addObject("totalReceipts", paymentsList.getTotalReceiptAmount());
						modelAndViewObj.addObject("totalPaymentValue", paymentsList.getTotalPaidAmount());
						modelAndViewObj.addObject("paymentsList", paymentsList);
						modelAndViewObj.addObject("accountName", accountName);
						modelAndViewObj.addObject("OrganizationList", OrganizationList);
						modelAndViewObj.addObject("locationsList", locationsList);
						modelAndViewObj.addObject("OrganizationlocationsList", OrganizationlocationsList);
						modelAndViewObj.setViewName("FinantialManagement/PettyCash");
						return modelAndViewObj;
					}

					//Added by Surya.k 
						@RequestMapping("/viewCashReceipt")
						public ModelAndView viewCashReceipt(@RequestParam("transactionId") String transactionId,
							HttpServletRequest request,HttpServletResponse response){
							String customerId = (String)request.getSession().getAttribute("customerId");
							String emailId = (String)request.getSession().getAttribute("emailId");
							ArrayList<String> accountName=new ArrayList<String>();
						
							
							List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,"");
							List<OrganizationLocations> OrganizationlocationsList = genericMasterServiceObj.getOrganizationLocationDetails("",customerId,emailId);
							
							ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","Retail Outlet",false,true,true);
							PettyCashBook paymentsList = genericMasterServiceObj.getPettyCashBookDetails(transactionId);
							List<AccountTypeMaster>  bankbookList = genericMasterServiceObj.getBankBook();
							if(bankbookList!=null){
								for(int i=0;i<bankbookList.size();i++){
									for(int j=0;j<bankbookList.get(i).getSubAccountTypeMasters().size();j++){
										accountName.add(bankbookList.get(i).getSubAccountTypeMasters().get(j).getAccountName());
									}
								}
							}
							
							modelAndViewObj = new ModelAndView();
							
						
							
							modelAndViewObj.addObject("paymentsList", paymentsList);
							modelAndViewObj.addObject("accountName", accountName);
							modelAndViewObj.addObject("OrganizationList", OrganizationList);
							modelAndViewObj.addObject("locationsList", locationsList);
							modelAndViewObj.addObject("OrganizationlocationsList", OrganizationlocationsList);
							modelAndViewObj.setViewName("FinantialManagement/PettyCash");
							return modelAndViewObj;
						}
						//Added by Surya.k 
						@RequestMapping("/viewCashPayments")
						public ModelAndView viewCashPayments(@RequestParam("transactionId") String transactionId,
							HttpServletRequest request,HttpServletResponse response){
							String customerId = (String)request.getSession().getAttribute("customerId");
							String emailId = (String)request.getSession().getAttribute("emailId");
						
							
							List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,"");
							List<OrganizationLocations> OrganizationlocationsList = genericMasterServiceObj.getOrganizationLocationDetails("",customerId,emailId);
							
							ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","Retail Outlet",false,true,true);
							PettyCashBook paymentsList = genericMasterServiceObj.getPettyCashBookDetails(transactionId);
							
							modelAndViewObj = new ModelAndView();
							
						
							
							modelAndViewObj.addObject("paymentsList", paymentsList);
							modelAndViewObj.addObject("OrganizationList", OrganizationList);
							modelAndViewObj.addObject("locationsList", locationsList);
							modelAndViewObj.addObject("OrganizationlocationsList", OrganizationlocationsList);
							modelAndViewObj.setViewName("FinantialManagement/PettyCash");
							return modelAndViewObj;
						}
						
						

						//Added by Surya.k 
							@RequestMapping("/getAdvancesAndPayments")
							public ModelAndView getAdvancesAndPayments(@RequestParam("organization") String organization,@RequestParam("zone") String zone,
									@RequestParam("location") String location,@RequestParam("advanceType") String advanceType,
									@RequestParam("advanceGiven") String advanceGiven,@RequestParam("status") String status,
									@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,
									@RequestParam("maxRecords") String maxRecords,@RequestParam("index") String index,
									@RequestParam("searchCriteria") String searchCriteria,
									@RequestParam("accountName") String bankName,HttpServletRequest request,HttpServletResponse response){
								String customerId = (String)request.getSession().getAttribute("customerId");
								String emailId = (String)request.getSession().getAttribute("emailId");
								ArrayList<String> accountName=new ArrayList<String>();
								String OrganizationId="";
								String transactionId="";
								float totalInvoice;
								String filePath;
								int start = 1;
								int end;
								
								if(maxRecords.equals(""))
									end=Integer.parseInt("0");
								else
									end=Integer.parseInt(maxRecords);
								
								
								if(index.equals(""))
									index="0";
								
								List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,OrganizationId);
								List<OrganizationLocations> OrganizationlocationsList = genericMasterServiceObj.getOrganizationLocationDetails("",customerId,emailId);
								List<AdvanceAndPayments> paymentsList = genericMasterServiceObj.getAdvancesAndPayments(transactionId,organization,zone,location,advanceType,advanceGiven,status,startDate,endDate,index,searchCriteria,bankName);
								List<Workflows> workflowsList = roleServiceObj.getWorkflows("-1","Sales and payments");
								List<AccountTypeMaster>  bankbookList = genericMasterServiceObj.getBankBook();
								if(bankbookList!=null){
									for(int i=0;i<bankbookList.size();i++){
										//accountName.add(bankbookList.get(i).getAccountName());
										for(int j=0;j<bankbookList.get(i).getSubAccountTypeMasters().size();j++){
											accountName.add(bankbookList.get(i).getSubAccountTypeMasters().get(j).getAccountName());
										}
									}
								}
								
								modelAndViewObj = new ModelAndView();
								
								if(paymentsList == null || paymentsList.size() == 0){
									modelAndViewObj.addObject("totalRecords","0");
									modelAndViewObj.addObject("index", "0");
									modelAndViewObj.addObject("totalValue", "0");
									
								}else{
									if(paymentsList.size()<end){
										end = (paymentsList.size())+(Integer.parseInt(index));
									}else{
										end = (Integer.parseInt(index)+end);
									}
									
									modelAndViewObj.addObject("totalRecords",paymentsList.get(0).getTotalRecords());
									modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
									modelAndViewObj.addObject("totalValue", end);
									modelAndViewObj.addObject("maxRecords", 10);
									
									
									
								}
								
								//modelAndViewObj.addObject("supplier",supplier);
								modelAndViewObj.addObject("startDate",startDate);
								modelAndViewObj.addObject("endDate",endDate);
								modelAndViewObj.addObject("selectedLocation",location);
								//modelAndViewObj.addObject("customerID",customerID);
								modelAndViewObj.addObject("zone",zone);
								modelAndViewObj.addObject("selectedOrganization",organization);
								modelAndViewObj.addObject("status",status);
								modelAndViewObj.addObject("accountNameList",accountName);
								
								//modelAndViewObj.addObject("filePath",filePath );
								//modelAndViewObj.addObject("totalInvoice", totalInvoice);
								modelAndViewObj.addObject("OrganizationList", OrganizationList);
								modelAndViewObj.addObject("locationsList", OrganizationlocationsList);
								modelAndViewObj.addObject("paymentsList", paymentsList);
								modelAndViewObj.addObject("workflowsList", workflowsList);
								
								modelAndViewObj.setViewName("FinantialManagement/AdvancesAndPayments");
								return modelAndViewObj;
							}
							
							
							
							//Added by Surya.k 
							@RequestMapping("/viewAdvancesAndPayments")
							public ModelAndView viewAdvancesAndPayments(@RequestParam("transactionId") String transactionId,HttpServletRequest request,HttpServletResponse response){
								String customerId = (String)request.getSession().getAttribute("customerId");
								String emailId = (String)request.getSession().getAttribute("emailId");
								ArrayList<String> nextActivitiesList = new ArrayList<String>();
								ArrayList<String> previousStates = new ArrayList<String>();
								ArrayList<String> accountName=new ArrayList<String>();
								modelAndViewObj = new ModelAndView();
								List<AdvanceAndPayments> paymentsList = genericMasterServiceObj.getAdvancesAndPayments(transactionId,"","","","","","","","","","","");
								List<OrganizationMaster> OrganizationList = genericMasterServiceObj.getOrganizationMaster(customerId, emailId,"");
								List<OrganizationLocations> OrganizationlocationsList = genericMasterServiceObj.getOrganizationLocationDetails("",customerId,emailId);
								List<AccountTypeMaster>  bankbookList = genericMasterServiceObj.getBankBook();
								if(bankbookList!=null){
									for(int i=0;i<bankbookList.size();i++){
										//accountName.add(bankbookList.get(i).getAccountName());
										for(int j=0;j<bankbookList.get(i).getSubAccountTypeMasters().size();j++){
											accountName.add(bankbookList.get(i).getSubAccountTypeMasters().get(j).getAccountName());
										}
									}
								}
								
									
								
							
								//modelAndViewObj.addObject("selectedLocation", paymentsList.get(0).getLocation());
								modelAndViewObj.addObject("OrganizationList", OrganizationList);
								modelAndViewObj.addObject("locationsList", OrganizationlocationsList);
								modelAndViewObj.addObject("accountNameList",accountName);
								modelAndViewObj.addObject("OrganizationlocationsList", OrganizationlocationsList);
								
								modelAndViewObj.addObject("paymentsList", paymentsList);
								modelAndViewObj.setViewName("FinantialManagement/AdvancesAndPayments");
								return modelAndViewObj;
							}
							
							//Added by Surya.k 
							@RequestMapping(value = "/createAdvancesAndPayments")
							public @ResponseBody  String  createAdvancesAndPayments(@RequestParam("organizationId") String organizationId,
									@RequestParam("zone") String zone,@RequestParam("advanceType") String advanceType,
									@RequestParam("paidDate") String paidDate,@RequestParam("paymentMode") String paymentMode,
									@RequestParam("location") String location,@RequestParam("paidTo") String paidTo,
									@RequestParam("paidRef") String paidRef,@RequestParam("paidAmt") String paidAmt,
									@RequestParam("paidComments") String paidComments,
									HttpServletRequest request,HttpServletResponse response){
								
								String customerId = (String)request.getSession().getAttribute("customerId");
								String emailId = (String)request.getSession().getAttribute("emailId");
								modelAndViewObj = new ModelAndView();
								AdvanceAndPayments paymentsObj = new AdvanceAndPayments(); 
								paymentsObj.setOrganizationId(organizationId);
								paymentsObj.setZoneId(zone);
								paymentsObj.setAdvanceType(advanceType);
								paymentsObj.setTransactionDateStr(paidDate);
								paymentsObj.setPaymentMode(paymentMode);
								paymentsObj.setLocation(location);
								paymentsObj.setPaidToRef(paidRef);
								paymentsObj.setAdvanceGivenTo(paidTo);
								paymentsObj.setAdvanceAmount(new BigDecimal(paidAmt));
								paymentsObj.setTransactionDescription(paidComments);
								paymentsObj.setStatus("Submitted");
								
								String str= genericMasterServiceObj.createAdvancesAndPayments(paymentsObj);
								//List<SalesAndPaymentsMaster> paymentsList = genericMasterServiceObj.getSalesPayments(purchasesobj.getTransactionId(),"","","","","","","","","","","");

								ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","Retail Outlet",false,true,true);
								List<OrganizationLocations> OrganizationlocationsList = genericMasterServiceObj.getOrganizationLocationDetails("",customerId,emailId);

								
								modelAndViewObj.addObject("locationsList", locationsList);
								modelAndViewObj.addObject("OrganizationlocationsList", OrganizationlocationsList);
								//modelAndViewObj.addObject("paymentsList", paymentsList);
								//modelAndViewObj.setViewName("FinantialManagement/AdvancesAndPayments");
								return str;
							}
							
							//Added by Surya.k 
							@RequestMapping(value = "/updateAdvancesAndPayments")
							public @ResponseBody  String  updateAdvancesAndPayments(@RequestParam("organizationId") String organizationId,
									@RequestParam("zone") String zone,@RequestParam("advanceType") String advanceType,
									@RequestParam("paidDate") String paidDate,@RequestParam("paymentMode") String paymentMode,
									@RequestParam("location") String location,@RequestParam("paidTo") String paidTo,
									@RequestParam("paidRef") String paidRef,@RequestParam("paidAmt") String paidAmt,
									@RequestParam("paidComments") String paidComments,@RequestParam("transactionId") String transactionId,
									@RequestParam("status") String status,
									HttpServletRequest request,HttpServletResponse response){
								
								String customerId = (String)request.getSession().getAttribute("customerId");
								String emailId = (String)request.getSession().getAttribute("emailId");
								ArrayList<String> nextActivitiesList = new ArrayList<String>();
								ArrayList<String> previousStates = new ArrayList<String>();
								ArrayList<String> accountName=new ArrayList<String>();
								modelAndViewObj = new ModelAndView();
								
								AdvanceAndPayments paymentsObj = new AdvanceAndPayments(); 
								paymentsObj.setOrganizationId(organizationId);
								paymentsObj.setZoneId(zone);
								paymentsObj.setAdvanceType(advanceType);
								paymentsObj.setTransactionDateStr(paidDate);
								paymentsObj.setPaymentMode(paymentMode);
								paymentsObj.setLocation(location);
								paymentsObj.setPaidToRef(paidRef);
								paymentsObj.setAdvanceGivenTo(paidTo);
								paymentsObj.setAdvanceAmount(new BigDecimal(paidAmt));
								paymentsObj.setTransactionDescription(paidComments);
								paymentsObj.setTransactionId(transactionId);
								paymentsObj.setStatus(status);
								
								String str= genericMasterServiceObj.updateAdvancesAndPayments(paymentsObj);
								List<AdvanceAndPayments> paymentsList = genericMasterServiceObj.getAdvancesAndPayments(paymentsObj.getTransactionId(),"","","","","","","","","","","");
								ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerId,emailId,"-1","Retail Outlet",false,true,true);
								List<Workflows> workflowsList = roleServiceObj.getWorkflows("-1","Sales and payments");
								List<OrganizationLocations> OrganizationlocationsList = genericMasterServiceObj.getOrganizationLocationDetails("",customerId,emailId);
								List<AccountTypeMaster>  bankbookList = genericMasterServiceObj.getBankBook();
								if(bankbookList!=null){
									for(int i=0;i<bankbookList.size();i++){
										//accountName.add(bankbookList.get(i).getAccountName());
										for(int j=0;j<bankbookList.get(i).getSubAccountTypeMasters().size();j++){
											accountName.add(bankbookList.get(i).getSubAccountTypeMasters().get(j).getAccountName());
										}
									}
								}
								
								
								
								
								modelAndViewObj.addObject("selectedLocation", paymentsList.get(0).getLocation());
								modelAndViewObj.addObject("locationsList", locationsList);
								modelAndViewObj.addObject("OrganizationlocationsList", OrganizationlocationsList);
								modelAndViewObj.addObject("accountNameList",accountName);
								modelAndViewObj.addObject("paymentsList", paymentsList);
							//	modelAndViewObj.setViewName("FinantialManagement/AdvancesAndPayments");
								return str;
							}

							
						
						
						
}
