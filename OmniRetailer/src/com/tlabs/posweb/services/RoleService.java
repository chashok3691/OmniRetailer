package com.tlabs.posweb.services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlabs.posweb.init.AppProperties;
import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.tlabs.posweb.beans.ActivityAccessControl;
import com.tlabs.posweb.beans.LoginForm;
import com.tlabs.posweb.beans.Role;
import com.tlabs.posweb.beans.RoleLocations;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.beans.Workflows;
import com.tlabs.posweb.util.DateUtil;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
import com.tlabs.posweb.util.RestfulServiceConnection;
//import com.tlabs.posweb.util.Utilities;

public class RoleService {

	@Autowired
	private Gson gson;
	@Autowired
	SessionScope sessionScope;
	private static Logger log = Logger.getLogger(RoleService.class);
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 * This method is used to call createRole method of web service and return the response
	 * 
	 * */
	public String createRole(Role roleObj,String customerId,String emailId) {
	  String resultStr = null;
	  try {
//		  RoleServiceProxy roleServiceProxyObj = new RoleServiceProxy();
	      roleObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
	      for(int i=0;i<roleObj.getAccessControlActivity().size();i++)
		  {
			 if(roleObj.getAccessControlActivity().get(i).getAppDocument().equals("OrderManagementSalesOrder"))
			roleObj.getAccessControlActivity().get(i).setAppSubDocument("Order");
		  }
	      
		  roleObj.setRoleStatus("Active");
		  roleObj.setCreatedBy(emailId);
		  String roleDetails = gson.toJson(roleObj);
		  ////////System.out.println("Request String::::"+roleDetails);
		  RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
		  resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_role"), gson.toJson(roleObj));
//		  resultStr = roleServiceProxyObj.createRole(roleDetails);
		  // log.info("Response String:::"+resultStr);
		  String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals( AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("ROLE_CREATE_SUCCESS").trim();
			}
			else{
				//result = "Couldn't create, please try after some time";
				resultStr = Response.getResponseMessage(resultStr);
			}
		/*}catch(ConnectException ce) {
			ce.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();*/
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		/*} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
		} catch(RemoteException rme){
			rme.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();*/
		} catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
	}
	
	public String getActivityAccessControlList(List<ActivityAccessControl> activityAccessControlList){
		List<String> keys = new ArrayList<String>();
		Map<String,String> activitiesMap = new HashMap<String,String>();
		for(ActivityAccessControl activityAccessControl : activityAccessControlList){
			String values = "";
			String key = "";
			if(activityAccessControl.getAppName().equals("Outlet")){
				if(activityAccessControl.getAppFlow().equals(activityAccessControl.getAppDocument()) || activityAccessControl.getAppSubFlow().equals(activityAccessControl.getAppDocument()))
					key = "store" + activityAccessControl.getAppDocument() + "Activities";
				else
					key =  activityAccessControl.getAppSubFlow() + activityAccessControl.getAppDocument() + "Activities";
//				key = "store" + activityAccessControl.getAppSubFlow() + activityAccessControl.getAppDocument() + "Activities";
			}
			if(activityAccessControl.getAppName().equals("Console")){
				if(activityAccessControl.getAppSubDocument() != null && !"".equals(activityAccessControl.getAppSubDocument()) )
					key = activityAccessControl.getAppSubDocument() + "Activities";
				else if(activityAccessControl.getAppDocument() != null && !"".equals(activityAccessControl.getAppDocument()) )
					key = activityAccessControl.getAppDocument() + "Activities";
				else if(activityAccessControl.getAppSubFlow() != null && !"".equals(activityAccessControl.getAppSubFlow()) )
					key = activityAccessControl.getAppSubFlow() + "Activities";
				else 
					key = activityAccessControl.getAppFlow() + "Activities";
			}
			if(activityAccessControl.getAppName().equals("Warehouse")){
				key = "warehouseApp" + activityAccessControl.getAppDocument() + "Activities";
			}
			if(!keys.contains(key)){
				keys.add(key);
				for(ActivityAccessControl activity : activityAccessControlList){
					if(activity.equals(activityAccessControl)){
						values = values + activity.getAppDocumentActivity() +",";
					}
				}
				values = values.substring(0,values.length()-1);
				activitiesMap.put(key, values);
			}
		}
		String activitiesStr = gson.toJson(activitiesMap);
		return activitiesStr;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * modified by chaithanya.v
	 * 
	 * This method is used to call getRoles method of web service and return all the Role Details List
	 * 
	 * */
	public ArrayList<Role> getRoleDetails(String roleName,String customerId,String emailId,String index,String maxRecords,String searchname){
		ArrayList<Role> roleList = null;
		String resultStr = null;
		try{
//			RoleServiceProxy roleServiceProxyObj = new RoleServiceProxy();
			Role roleObj = new Role();
			roleObj.setRoleName(roleName);
			roleObj.setStartIndex(index);
			roleObj.setMaxRecords(maxRecords);
			roleObj.setSearchCriteria(searchname);
			roleObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request:::"+gson.toJson(roleObj));
           //System.out.println("Request:::"+gson.toJson(roleObj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_role"), gson.toJson(roleObj),"GET");
//			resultStr = roleServiceProxyObj.getRoles(gson.toJson(roleObj));
			// log.info("Response:::"+resultStr);
			//System.out.println("ROLES::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			//System.out.println("role <%--  --%>Response:::"+resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				String responseList = Response.getResponseList(resultStr, "roleList");
				JSONArray jsonResponseArray = new JSONArray(responseList);
				roleList = new ArrayList<Role>();
				for (int i=0; i<jsonResponseArray.length(); i++) {
					roleObj = gson.fromJson(jsonResponseArray.getString(i), Role.class);
					if(roleObj.getValid_date()!= "" && roleObj.getValid_date()!= null){
						String validDate =DateUtil.getDateDDMMYYYY(roleObj.getValid_date());
						roleObj.setValidDate(validDate);
					}
					if(roleName != null){
						roleObj.setActivitiesStr(getActivityAccessControlList(roleObj.getAccessControlActivity()));
						List<String> locationsList = new ArrayList<String>();
						if(roleObj.getRoleLocations() != null)
							for(RoleLocations roleLocations : roleObj.getRoleLocations())
								locationsList.add(roleLocations.getLocation());
						//roleObj.setRoleLocations(null);
						roleObj.setLocations(locationsList);
					}
					if(roleName == null){
						roleObj.setAccessControl(null);
						roleObj.setAccessControlActivity(null);
						roleObj.setRoleLocations(null);
					}
					
					roleList.add(roleObj);
				}
				roleList.get(0).setTotalRecords(Response.getResponseTotalRecords(resultStr));
			}
		/*}catch(ConnectException ce) {
			ce.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();*/
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		/*} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
		} catch(RemoteException rme){
			rme.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();*/
		} catch(Exception e){
			e.printStackTrace();
		}
		return roleList;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 * This method is used to call updateRole method of web service and return the response
	 * 
	 * */
	public String updateRole(Role roleObj,String customerId,String emailId) {
	  String resultStr = null;
	  try {
//		  RoleServiceProxy roleServiceProxyObj = new RoleServiceProxy();
		  roleObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		  //roleObj.setRoleStatus("Active");
		  
//		  if(roleObj.getAccessControlActivity())
		  
		  
		  for(int i=0;i<roleObj.getAccessControlActivity().size();i++)
		  {
			 if(roleObj.getAccessControlActivity().get(i).getAppDocument().equals("OrderManagementSalesOrder"))
			roleObj.getAccessControlActivity().get(i).setAppSubDocument("Order");
		  }
		  
		  String roleDetails = gson.toJson(roleObj);
		  // log.info("Request String::::"+roleDetails);
		  //System.out.println("Request String::::"+roleDetails);
		  RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
		  resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_role"), gson.toJson(roleObj));
//		  resultStr = roleServiceProxyObj.updateRole(roleDetails);
		  // log.info("Response String:::"+resultStr);
		  //System.out.println("Response String:::"+resultStr);
		  String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals( AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("ROLE_UPDATE_SUCCESS").trim();
			}
			else{
				//result = "Couldn't create, please try after some time";
				resultStr = Response.getResponseMessage(resultStr);
			}
		/*}catch(ConnectException ce) {
			ce.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();*/
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		/*} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
		} catch(RemoteException rme){
			rme.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();*/
		} catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to call deleteTaxDetails method of web service and return the response
	 *
	 **/
	public String deleteRole(String customerId,String emailId,String ids) {
		String resultStr = null;
		try {
			Role roleObj = new Role();
//			RoleServiceProxy roleServiceProxyObj = new RoleServiceProxy();
			roleObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			String[] idsArray = ids.split(",");
			List<String> roleNameList = new ArrayList<String>();
			for(int i=0;i<idsArray.length;i++)
				roleNameList.add(idsArray[i]);
			roleObj.setRoleNameList(roleNameList);
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("delete_role"), gson.toJson(roleObj),"GET");
//			result = roleServiceProxyObj.deleteRole(gson.toJson(roleObj));
			// log.info(resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				resultStr = AppProperties.getAppMessageByProperty("ROLE_DELETE_SUCCESS").trim();
			else if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_FAILED_CODE").trim()))
				resultStr = Response.getResponseMessage(resultStr);
		/*}catch(ConnectException ce) {
			ce.printStackTrace();
			result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();*/
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		/*} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			result = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
		} catch(RemoteException rme){
			rme.printStackTrace();
			result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();*/
		} catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
	}
	
	
	public List<Workflows> getWorkflows(String index,String businessFlow){
		List<Workflows> workflowsList = null;
		String resultStr = null;
		try{
			Workflows workFlowObj = new Workflows();
			workFlowObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			workFlowObj.setStartIndex(index);
			workFlowObj.setBusinessFlow(businessFlow);
			//////////System.out.println("Request::"+gson.toJson(workFlowObj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_workflows"), gson.toJson(workFlowObj),"GET");
			// log.info("Response::"+resultStr);
			//////////System.out.println("work flowResponse::"+resultStr);
			workFlowObj = gson.fromJson(resultStr, Workflows.class);
			////////////System.out.println("work flowResponse::"+workFlowObj);
			if(workFlowObj.getResponseHeader().getResponseCode().equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				workflowsList = workFlowObj.getWorkFlowList();
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return workflowsList;
	}

	public LoginForm getIssueFeilds(HttpServletRequest request, HttpServletResponse response) {
		
		String resultStr = null;
		LoginForm workFlowObj = new LoginForm();
		try{
			workFlowObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		
		//	////////System.out.println("Request::"+gson.toJson(workFlowObj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Stock_issue_Feilds"), gson.toJson(workFlowObj),"GET");
		//	////////System.out.println("work flowResponse::"+resultStr);
			workFlowObj = gson.fromJson(resultStr, LoginForm.class);
			////////////System.out.println("work flowResponse::"+workFlowObj);
			if(workFlowObj.getResponseHeader().getResponseCode().equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				//workflowsList = workFlowObj.getWorkFlowList();
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return workFlowObj;
	}
	
	
	
}
