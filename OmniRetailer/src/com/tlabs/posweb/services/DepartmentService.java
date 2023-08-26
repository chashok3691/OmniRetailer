package com.tlabs.posweb.services;

import java.rmi.ConnectException;
import java.rmi.RemoteException;
import java.rmi.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;

import com.tlabs.posweb.init.AppProperties;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.technolabssoftware.www.DepartmentProxy;
import com.tlabs.posweb.beans.Department;
import com.tlabs.posweb.beans.OrganizationalDept;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
//import com.tlabs.posweb.util.Utilities;
import com.tlabs.posweb.util.RestfulServiceConnection;

public class DepartmentService {
	@Autowired
	private Gson gson;
	@Autowired
	SessionScope sessionScope;
//	private static Logger log = Logger.getLogger(DepartmentService.class);
	 
		
		
		/**
		 * 
		 * @author Mythri.S
		 * Created On: 3-nov-2015
		 * 
		 * This method is used to call createDepartment method of web service and return the response
		 *
		 **/
		public String createDepartment(Department departmentObj,String customerIdStr,String emailIdStr){
			String result = null;
			try {
				departmentObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
				result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("create_Department"), gson.toJson(departmentObj),"POST");
				//result = departmentProxyObj.createDepartment(gson.toJson(departmentObj));
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					result = AppProperties.getAppMessageByProperty("DEPARTMENT_CREATE_SUCCESS").trim();
				}
				else{
					//result = "Couldn't create, please try after some time";
					result = Response.getResponseMessage(result);
				}
			}catch(ConnectException ce) {
				ce.printStackTrace();
				result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch (UnknownHostException uhe) {
				uhe.printStackTrace();
				result = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
			} catch(RemoteException rme){
				rme.printStackTrace();
				result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return result;
		}
		
		
		/**
		 * @author Mythri.S	
		 * Created On: 4-nov-2015
		 * 
		 * This method is used to call the getDepartment method of web service and return the Department List.
		 * 
		 */
		public List<Department> getDepartmentDetails(String primaryDepartment,String secondaryDepartment,String customerId,String emailId,String index,String maxRecords, boolean search){
			String result = null;
			List<Department> departmentList = null;
			try {
				Department departmentObj = new Department();
				if(search)
					departmentObj.setSearchCriteria(primaryDepartment);
				else{
					if(primaryDepartment != null)
						departmentObj.setPrimaryDepartment(primaryDepartment);
					if(secondaryDepartment != null)
						departmentObj.setSecondaryDepartment(secondaryDepartment);
				}
				departmentObj.setStartIndex(index);
				departmentObj.setStartIndexStr(index);
				departmentObj.setMaxRecords(maxRecords);
				departmentObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				////////////System.out.println(gson.toJson(departmentObj));
				RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
				result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Departments"), gson.toJson(departmentObj),"POST");
				//result = departmentProxyObj.getDepartments(gson.toJson(departmentObj));
				////////////System.out.println(result);
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				{
					departmentObj = gson.fromJson(result, Department.class);
					if(search)
					{
						departmentList = departmentObj.getDepartmentList();
						if(departmentList != null && departmentList.size() > 0)
						{
							departmentList.get(0).setTotalRecords(departmentObj.getTotalRecords());
						}
					}
					else
					{
						departmentList = departmentObj.getDepartments();
					}
					int slNo = Integer.parseInt(index);
					for(Department depart : departmentList)
					{
						depart.setSlNo(++slNo);
						if(depart.getSecondaryDepartments() != null)
						{
							depart.setNoOfSubDepartments(depart.getSecondaryDepartments().size());
						}
					}
						/*JSONArray jsonResponseArray = new JSONArray(responseList);
						departmentList = new ArrayList<Department>();
						for (int i=0; i<jsonResponseArray.length(); i++) {
							departmentObj = gson.fromJson(jsonResponseArray.getString(i), Department.class);
							if(departmentObj.getSecondaryDepartments() != null)
								departmentObj.setNoOfSubDepartments(departmentObj.getSecondaryDepartments().size());
							departmentList.add(departmentObj);
						}*/
				}
			}catch(ConnectException ce) {
				ce.printStackTrace();
				result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch (UnknownHostException uhe) {
				uhe.printStackTrace();
				result = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
			} catch(RemoteException rme){
				rme.printStackTrace();
				result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return departmentList;
		}
	
		

/**
		 * @author Mythri.S	
		 * Created On: 4-nov-2015
		 * 
		 * This method is used to call the getDepartment method of web service and return the Department List.
		 * 
		 */
		public List<Department> getDepartmentDetails(String primaryDepartment,String secondaryDepartment,String customerId,String emailId,String index,String maxRecords, boolean search, String searchName){
			String result = null;
			List<Department> departmentList = null;
			try {
				Department departmentObj = new Department();
				
					if(primaryDepartment != null)
						departmentObj.setPrimaryDepartment(primaryDepartment);
					if(secondaryDepartment != null)
						departmentObj.setSecondaryDepartment(secondaryDepartment);
					if(searchName != null && !searchName.isEmpty() && !searchName.equals(""))
						search=true;
					
				
				departmentObj.setStartIndex(index);
				departmentObj.setStartIndexStr(index);
				departmentObj.setMaxRecords(maxRecords);
				departmentObj.setSearchCriteria(searchName);
				departmentObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				////////////System.out.println(gson.toJson(departmentObj));
				RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
				result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Departments"), gson.toJson(departmentObj),"POST");
				//result = departmentProxyObj.getDepartments(gson.toJson(departmentObj));
				////////////System.out.println(result);
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				{
					departmentObj = gson.fromJson(result, Department.class);
					if(search)
					{
						departmentList = departmentObj.getDepartmentList();
						if(departmentList != null && departmentList.size() > 0)
						{
							departmentList.get(0).setTotalRecords(departmentObj.getTotalRecords());
						}
					}
					else
					{
						departmentList = departmentObj.getDepartments();
					}
					
					int slNo = Integer.parseInt(index);
					for(Department depart : departmentList)
					{
						depart.setSlNo(++slNo);
						if(depart.getSecondaryDepartments() != null)
						{
							depart.setNoOfSubDepartments(depart.getSecondaryDepartments().size());
						}
					}
						/*JSONArray jsonResponseArray = new JSONArray(responseList);
						departmentList = new ArrayList<Department>();
						for (int i=0; i<jsonResponseArray.length(); i++) {
							departmentObj = gson.fromJson(jsonResponseArray.getString(i), Department.class);
							if(departmentObj.getSecondaryDepartments() != null)
								departmentObj.setNoOfSubDepartments(departmentObj.getSecondaryDepartments().size());
							departmentList.add(departmentObj);
						}*/
				}
			}catch(ConnectException ce) {
				ce.printStackTrace();
				result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch (UnknownHostException uhe) {
				uhe.printStackTrace();
				result = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
			} catch(RemoteException rme){
				rme.printStackTrace();
				result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return departmentList;
		}
		
		/**
		 * @author Mythri.S	
		 * Created On: 4-nov-2015
		 * 
		 * This method is used to call the getDepartment method of web service and return the Department List.
		 * 
		 */
		public List<Department> getDepartmentDetails(String primaryDepartment,String secondaryDepartment,String customerId,String emailId,String index,boolean search){
			String result = null;
			List<Department> departmentList = null;
			try {
				//DepartmentProxy departmentProxyObj = new DepartmentProxy();
				Department departmentObj = new Department();
				if(search)
					departmentObj.setSearchCriteria(primaryDepartment);
				else{
					if(primaryDepartment != null)
						departmentObj.setPrimaryDepartment(primaryDepartment);
					if(secondaryDepartment != null)
						departmentObj.setSecondaryDepartment(secondaryDepartment);
				}
				departmentObj.setStartIndex(index);
				departmentObj.setStartIndexStr(index);
				departmentObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				//result = departmentProxyObj.getDepartments(gson.toJson(departmentObj));
				
				
				RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
				result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Departments"), gson.toJson(departmentObj),"POST");
				
				
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					departmentObj = gson.fromJson(result, Department.class);
					if(search){
						departmentList = departmentObj.getDepartmentList();
						if(departmentList != null && departmentList.size() > 0){
							departmentList.get(0).setTotalRecords(departmentObj.getTotalRecords());
						}
					}
					else
						departmentList = departmentObj.getDepartments();
					int slNo = Integer.parseInt(index);
					for(Department depart : departmentList){
						depart.setSlNo(++slNo);
						if(depart.getSecondaryDepartments() != null)
							depart.setNoOfSubDepartments(depart.getSecondaryDepartments().size());
					}
						/*JSONArray jsonResponseArray = new JSONArray(responseList);
						departmentList = new ArrayList<Department>();
						for (int i=0; i<jsonResponseArray.length(); i++) {
							departmentObj = gson.fromJson(jsonResponseArray.getString(i), Department.class);
							if(departmentObj.getSecondaryDepartments() != null)
								departmentObj.setNoOfSubDepartments(departmentObj.getSecondaryDepartments().size());
							departmentList.add(departmentObj);
						}*/
				}
			}catch(ConnectException ce) {
				ce.printStackTrace();
				result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch (UnknownHostException uhe) {
				uhe.printStackTrace();
				result = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
			} catch(RemoteException rme){
				rme.printStackTrace();
				result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return departmentList;
		}
		
		/**
		 * 
		 * @author Mythri.S
		 * Created On: 4-nov-2015
		 * 
		 * This method is used to call updateDepartment method of web service and return the response.
		 * This method accepts all the department details and sends it to web service for updating the department.
		 * It returns a string based on the successful update or not.
		 *
		 **/
		public String updateDepartment(Department departmentObj,String customerIdStr,String emailIdStr){
			String result = null;
			try {
				departmentObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				//result = departmentProxyObj.updateDepartment(gson.toJson(departmentObj));
				RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
				result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("update_Department"), gson.toJson(departmentObj),"POST");
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					result = AppProperties.getAppMessageByProperty("DEPARTMENT_UPDATE_SUCCESS").trim();
				}
				else{
					//result = "Couldn't create, please try after some time";
					result = Response.getResponseMessage(result);
				}
			}catch(ConnectException ce) {
				ce.printStackTrace();
				result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch (UnknownHostException uhe) {
				uhe.printStackTrace();
				result = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
			} catch(RemoteException rme){
				rme.printStackTrace();
				result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return result;
		}
		
		
		/**
		 * @author Sahitya
		 * 
		 * This method is used to return locations list which are retrieved from admin service class 
		 * 
		 */
		public List<String> getDepartmentsList(String searchCriteria,String customerIdStr,String emailIdStr){
			List<Department> departmentList = null;
		    List<String> departmentNamesList = null;
			try{
				departmentNamesList = new ArrayList<String>();
				boolean search = true;
				if(searchCriteria == null || searchCriteria.equals(""))
					search = false;
				departmentList = getDepartmentDetails(searchCriteria,null, customerIdStr, emailIdStr,"-1",search);
				if(departmentList != null)
					for(int i=0;i<departmentList.size();i++){
						departmentNamesList.add(departmentList.get(i).getPrimaryDepartment());
					}
				
			}catch(Exception e){
				e.printStackTrace();
			}
			return departmentNamesList;
		}
		
		
		 /**
		 * @author RaviTeja
		 * 
		 * This method is used to return SubDepartmentsList which are retrieved from admin service class 
		 * 
		 */
		public List<String> getSubDepartmentsList(String searchCriteria,String customerIdStr,String emailIdStr){
			List<Department> departmentList = null;
		    List<String> departmentNamesList = null;
			try{
				departmentNamesList = new ArrayList<String>();
				boolean search = true;
				if(searchCriteria == null || searchCriteria.equals(""))
					search = false;
				departmentList = getDepartmentDetails(searchCriteria,null, customerIdStr, emailIdStr,"-1",search);
				if(departmentList != null)
					// log.info("primary dept  length"+departmentList.size());
					for(int primaryDepts=0;primaryDepts<departmentList.size();primaryDepts++){
						for (int secondaryDepts = 0; secondaryDepts <departmentList.get(primaryDepts).getSecondaryDepartments().size(); secondaryDepts++) {
							departmentNamesList.add(departmentList.get(primaryDepts).getSecondaryDepartments().get(secondaryDepts).getSecondaryDepartment());
						 // log.info("-----------}}}"+departmentList.get(primaryDepts).getSecondaryDepartments().get(secondaryDepts).getSecondaryDepartment());
						}
						
					}
				
			}catch(Exception e){
				e.printStackTrace();
			}
			return departmentNamesList;
		}
		
		
		/**
		 * @author Surya.K
		 * Created On: 10-Sep-2019
		 * 
		 * This method is used to call the getOrganizationDepartment method of web service and return the Department List.
		 * 
		 */
		public List<String> getOrganizationDepartmentDetails(String customerId,String emailId,String search){
			String result = null;
			ArrayList<String> departmentList = new ArrayList<String>();
			try {
				OrganizationalDept departmentObj = new OrganizationalDept();
				
				departmentObj.setSearchCriteria(search);
				
			
				departmentObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				
				
				RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
				result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_organizational_department"), gson.toJson(departmentObj),"GET");
				
				////////System.out.println("Responce for departments   "+result);
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					departmentObj = gson.fromJson(result, OrganizationalDept.class);
					
					
					for(int i=0;i<departmentObj.getOrganizationalDeptObj().size();i++){
						departmentList.add(departmentObj.getOrganizationalDeptObj().get(i).getDeptName());
					}
						
				}
			}catch(ConnectException ce) {
				ce.printStackTrace();
				result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch (UnknownHostException uhe) {
				uhe.printStackTrace();
				result = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
			} catch(RemoteException rme){
				rme.printStackTrace();
				result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return departmentList;
		}


		
		
		
}
