package com.tlabs.posweb.services;

import java.rmi.ConnectException;
import java.rmi.RemoteException;
import java.rmi.UnknownHostException;

import java.util.List;
import java.util.NoSuchElementException;

//import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.tlabs.posweb.beans.OrganizationalDept;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.init.AppProperties;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
import com.tlabs.posweb.util.RestfulServiceConnection;

public class OrganizationDepartmentService {
	@Autowired
	private Gson gson;
	@Autowired
	SessionScope sessionScope;	
	/**
	 * 
	 * @author Vasudeva Reddy.G
	 * @Created_On:02-Aug-2019
	 * @description:This method is used to call create Organization Department method of web service and return the response
	 * @Reviewed_by Surya on 20-Aug-2019
	 **/
	public String createOrganizationalDept(OrganizationalDept orgdepartmentObj,String customerIdStr,String emailIdStr) {
		String result = null;
		try {
			orgdepartmentObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			String orgdeptDetailsList = gson.toJson(orgdepartmentObj);
			// restful service connection
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			String url = AppProperties.getRESTFulCloudServiceURL("create_organizational_department");
			//service call
			result = restfulServiceConnectionObj.getResponseFromPost(url, orgdeptDetailsList);
			// response from service
			String responseCode = Response.getResponseCode(result);
			if (responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())) {
				result = AppProperties.getAppMessageByProperty("ORGANIZATIONDEPARTMENT_CREATE_SUCCESS").trim();
			} else {
				result = Response.getResponseMessage(result);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch (Exception e) {
			e.printStackTrace();
			result = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return result;
	}
	/**
	 * @author Vasudeva Reddy.G	
	 * @Created_On: 5-Aug-2019
	 * @description:This method is used to call the getOrganizationDepartment method of web service and return the Organization Department List.
	 * @Reviewed_by Surya on 20-Aug-2019
	 */
	public List<OrganizationalDept> getOrganizationalDept(String deptId,String customerId,String emailId,String index,String maxRecords, String searchName) throws Exception {
		String result = null;
		List<OrganizationalDept> organizationalDeptObj = null;
		try {
			// restful service connection
			RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
			OrganizationalDept orgdepartmentObj = new OrganizationalDept();
			orgdepartmentObj.setDeptId(deptId);
			orgdepartmentObj.setSearchCriteria(searchName);
			orgdepartmentObj.setStartIndex(index);
			orgdepartmentObj.setMaxRecords(maxRecords);
			orgdepartmentObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			String orgdeptDetailsList = gson.toJson(orgdepartmentObj);
			//service call
			String url = AppProperties.getRESTFulCloudServiceURL("get_organizational_department");
			result = restFulServiceConnectionObj.getResponse(url, orgdeptDetailsList, "GET");
			// response from service 
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
			{
				orgdepartmentObj = gson.fromJson(result, OrganizationalDept.class);
					organizationalDeptObj = orgdepartmentObj.getOrganizationalDeptObj();
					if(organizationalDeptObj != null && organizationalDeptObj.size() > 0)
					{
						organizationalDeptObj.get(0).setTotalRecords(orgdepartmentObj.getTotalRecords());
					}
				int slNo = Integer.parseInt(index);
				for(OrganizationalDept orgdepart : organizationalDeptObj)
				{
					orgdepart.setSlNo(++slNo);			
				}
		}
		}
		catch(ConnectException ce) {
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
		return organizationalDeptObj;
	}
	
	/**
	 * 
	 * @author Vasudeva Reddy.G
	 * @Created On: 6-Aug-2019
	 * @description:This method is used to call updateOrganizationDepartment method of web service and return the response.
	 * This method accepts all the organization department details and sends it to web service for updating the organizationdepartment.
	 * It returns a string based on the successful update or not.
	 * @Reviewed_by Surya on 20-Aug-2019
	 **/
	
	public String updateOrganizationalDept(OrganizationalDept orgdepartmentObj, String customerId, String emailId) {
		String result = null;
		try {

			// restful service connection
			RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
			orgdepartmentObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			String orgdeptDetailsList = gson.toJson(orgdepartmentObj);
			String url = AppProperties.getRESTFulCloudServiceURL("update_organizational_department");
			// service call
			result = restFulServiceConnectionObj.getResponseFromPost(url, orgdeptDetailsList);
			// response from service
			String responseCode = Response.getResponseCode(result);
			if (responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())) {
				result = AppProperties.getAppMessageByProperty("ORGANIZATIONDEPARTMENT_UPDATE_SUCCESS").trim();
			} else {
				result = Response.getResponseMessage(result);
			}
		} catch(ConnectException ce) {
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
}	
	
	
	
