package com.tlabs.posweb.services;

import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.tlabs.posweb.beans.FeaturedProducts;
import com.tlabs.posweb.beans.FeaturedProductsResponse;
import com.tlabs.posweb.beans.FeaturedRetailer;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.init.AppProperties;
import com.tlabs.posweb.util.Constants;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
import com.tlabs.posweb.util.RestfulServiceConnection;
//import com.tlabs.posweb.util.Utilities;

public class FeaturedProductService {
	
	@Autowired
	private Gson gson;
	@Autowired
	SessionScope sessionScope;
	
//	private static Logger log = Logger.getLogger(FeaturedProductService.class);
	/**
	 * @author soumya vatte
	 * @createdon : 14-07-2016
	 * @param 
	 * updated by chaithanya.v
	 * 	
	 * This method is used to get the Customer feedback information from server
	*/
	public List<FeaturedProducts> getFeaturedProducts(String customerIdStr,String emailIdStr,String searchName,String startDateStr,String endDateStr,boolean search,String index,String maxRecords,String status,String featuredType){
	
		// log.info("FeaturedProductService - getFeaturedProducts");
		String resultStr = null;
		FeaturedProductsResponse beanObj = null;
		FeaturedProducts featuredObj=null;
		List<FeaturedProducts> products = null,productslist = null;
		RestfulServiceConnection restfulConnectionObj = null;
		try{	
			gson = new Gson();
			restfulConnectionObj = new RestfulServiceConnection();
			featuredObj = new FeaturedProducts();
			featuredObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			featuredObj.setStartIndex(index);
			featuredObj.setSearchCriteria(searchName);
			featuredObj.setStartDateStr(startDateStr);
			featuredObj.setEndDateStr(endDateStr);
			featuredObj.setStatus(status);
			featuredObj.setFeaturedType(featuredType);
			featuredObj.setMaxRecords(maxRecords);
			// log.info("Request String:::"+gson.toJson(featuredObj));
			//////////System.out.println("Request String:::"+gson.toJson(featuredObj));
			featuredObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String : : : : "+ gson.toJson(featuredObj));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("FeaturedProducts_Service_get_Featured_Products"), gson.toJson(featuredObj), "GET");
			// log.info("Response String : : : : "+ resultStr);
			beanObj = gson.fromJson(resultStr,FeaturedProductsResponse.class); 
			if(beanObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				productslist = new ArrayList<FeaturedProducts>();
				products = beanObj.getProductsList();
				int slNo = Integer.parseInt(featuredObj.getStartIndex());
				if(products != null)
					for(int i=0;i<products.size();i++){
						products.get(i).setSlNo(++slNo);
						productslist.add(products.get(i));
					}
				if(productslist.size() != 0)
					productslist.get(0).setTotalRecords(Response.getResponseTotalRecords(resultStr));
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return productslist;
		
	}
	/**
	 * @author chaithanya.v
	 * 
	 *This method is used to call viewFeaturedProducts method of web service and return the response
	 *
	 **/
	public FeaturedProductsResponse viewFeaturedProducts(String customerIdStr,String emailIdStr,String featuredId,String startDateStr,String endDateStr,boolean search,String index,String maxRecords,String status){
		
		// log.info("FeaturedProductService - viewFeaturedProducts");
		String resultStr = null;
		FeaturedProductsResponse beanObj = null;
		FeaturedProducts featuredObj=null;
		List<FeaturedProducts> products = null,productslist = null;
		RestfulServiceConnection restfulConnectionObj = null;
		try{	
			gson = new Gson();
			restfulConnectionObj = new RestfulServiceConnection();
			featuredObj = new FeaturedProducts();
			featuredObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			featuredObj.setStartIndex(index);
			featuredObj.setStartDateStr(startDateStr);
			featuredObj.setEndDateStr(endDateStr);
			featuredObj.setStatus(status);
			featuredObj.setFeatureId(featuredId);
			featuredObj.setMaxRecords(maxRecords);
			// log.info("Request String:::"+gson.toJson(featuredObj));
			featuredObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String : : : : "+ gson.toJson(featuredObj));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("FeaturedProducts_Service_get_Featured_Products"), gson.toJson(featuredObj), "GET");
			// log.info("Response String : : : : "+ resultStr);
			beanObj = gson.fromJson(resultStr,FeaturedProductsResponse.class); 
			if(beanObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				productslist = new ArrayList<FeaturedProducts>();
				products = beanObj.getProductsList();
				int slNo = Integer.parseInt(featuredObj.getStartIndex());
				if(products != null)
					for(int i=0;i<products.size();i++){
						products.get(i).setSlNo(++slNo);
						productslist.add(products.get(i));
					}
				if(productslist.size() != 0)
					productslist.get(0).setTotalRecords(Response.getResponseTotalRecords(resultStr));
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return beanObj;
		
	}
	/**
	 * @author chaithanya.v
	 * 
	 *This method is used to call createNewFeatureProductGroupMaster method of web service and return the response
	 *
	 **/
	public String createNewFeatureProductGroupMaster(FeaturedProducts featureobj,String customerIdStr,String emailIdStr){
		String resultStr = null;
		try {
			featureobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
	///		System.out.println("Request String::::::::::::"+gson.toJson(featureobj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_feature_group"), gson.toJson(featureobj));
	////		System.out.println("Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("FEATURED_GROUP_CREATE_SUCCESS").trim();
			}
			else{
				resultStr = Response.getResponseMessage(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
	}	
	
	/**
	 * @author chaithanya.v
	 * 
	 *This method is used to call updateNewFeatureProductGroupMaster method of web service and return the response
	 *
	 **/
	public String updateNewFeatureProductGroupMaster(FeaturedProducts featureobj,String customerIdStr,String emailIdStr){
		String resultStr = null;
		try {
			featureobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String::::::::::::"+gson.toJson(featureobj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_feature_group"), gson.toJson(featureobj));
			// log.info("Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("FEATURED_GROUP_UPDATE_SUCCESS").trim();
			}
			else{
				resultStr = Response.getResponseMessage(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
	}		
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to call deleteProductGroup method of web service and return the response
	 *
	 **/
	
	
	
	public List<FeaturedRetailer> getFeaturedRetailers(String customerIdStr,String emailIdStr,String searchName,String startDateStr,String endDateStr,String index,String maxRecords,String featuredId) {

		String resultStr = null;
		FeaturedRetailer featuredObj=null;
		List<FeaturedRetailer> retailerList = null;
		RestfulServiceConnection restfulConnectionObj = null;
		try{	
			gson = new Gson();
			restfulConnectionObj = new RestfulServiceConnection();
			featuredObj = new FeaturedRetailer();
			featuredObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			featuredObj.setFeaturedRetailerId(featuredId);
			featuredObj.setStartIndex(index);
			featuredObj.setSearchCriteria(searchName);
			featuredObj.setStartDateStr(startDateStr);
			featuredObj.setEndDateStr(endDateStr);
			featuredObj.setMaxRecords(maxRecords);
		///	System.out.println("Request String::::::::: getFeaturedRetailers ::"+gson.toJson(featuredObj));
			featuredObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_featured_retailers"), gson.toJson(featuredObj), "GET");
		///	System.out.println("Response String : : : : "+ resultStr);
			FeaturedRetailer retailerListObj = gson.fromJson(resultStr,FeaturedRetailer.class); 
			if(retailerListObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				retailerList = retailerListObj.getFeaturedReatiler();
				retailerList.get(0).setTotalRecords(retailerListObj.getTotalRecords());
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return retailerList;
		
	
	}
	
	public String createFeatureRetailers(FeaturedRetailer featureobj,String customerIdStr,String emailIdStr){
		String resultStr = null;
		try {
			featureobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		////	System.out.println("Request String::::::::::::"+gson.toJson(featureobj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_feature_Retailer"), gson.toJson(featureobj));
		////    System.out.println("Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = Response.getResponseMessage(resultStr);
			}
			else{
				resultStr = Response.getResponseMessage(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
	}
	
	public String updateNewFeaturedRetailer(FeaturedRetailer featureobj,String customerIdStr,String emailIdStr){
		String resultStr = null;
		try {
			featureobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
	////		System.out.println("Request String::::::::::::"+gson.toJson(featureobj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_featured_retailer"), gson.toJson(featureobj));
	////		System.out.println("Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = Response.getResponseMessage(resultStr);
			} else {
				resultStr = Response.getResponseMessage(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
	}	
	
	
	public String deleteFeaturedRetailers(String customerIdStr,String emailIdStr,String ids) {
		String resultStr = null;
		try {
			FeaturedRetailer masterObj=new FeaturedRetailer();
			masterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			String[] groups = ids.split(",");
			List<String> featureIds = new ArrayList<String>();
			for(int i=0;i<groups.length;i++)
				featureIds.add(groups[i]);
			masterObj.setFeaturedRetailertIds(featureIds);
/////			System.out.println("Reqest::::::"+gson.toJson(masterObj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("delete_featured_retailer"), gson.toJson(masterObj));
////			System.out.println("Response::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				resultStr = AppProperties.getAppMessageByProperty("FEATURED_GROUP_DELETE_SUCCESS").trim();
			else if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_FAILED_CODE").trim()))
				resultStr = AppProperties.getAppMessageByProperty("DELETE_FAILED").trim();
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
	}
	
	
	
	
	
	
	public String deleteFeaturedproductGroup(String customerIdStr,String emailIdStr,String ids) {
		String resultStr = null;
		try {
			FeaturedProducts masterObj=new FeaturedProducts();
			////////////System.out.println("Ids::"+ids);
			masterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			String[] groups = ids.split(",");
			List<String> featureIds = new ArrayList<String>();
			for(int i=0;i<groups.length;i++)
				featureIds.add(groups[i]);
			masterObj.setFeatureIds(featureIds);
			////////////System.out.println("groupDetails::"+featureIds);
			// log.info(gson.toJson(masterObj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("delete_featured_group"), gson.toJson(masterObj));
			// log.info("Result:"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				resultStr = AppProperties.getAppMessageByProperty("FEATURED_GROUP_DELETE_SUCCESS").trim();
			else if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_FAILED_CODE").trim()))
				resultStr = AppProperties.getAppMessageByProperty("DELETE_FAILED").trim();
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
	}
		
	
	
	
}
