package com.tlabs.posweb.services;

import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;

import com.tlabs.posweb.init.AppProperties;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.tlabs.posweb.beans.Deal;
import com.tlabs.posweb.beans.DealsBean;
import com.tlabs.posweb.beans.HotDealResponse;
import com.tlabs.posweb.beans.HotDeals;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.util.Constants;
import com.tlabs.posweb.util.DateUtil;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
import com.tlabs.posweb.util.RestfulServiceConnection;
//import com.tlabs.posweb.util.Utilities;

public class DealService {

	@Autowired
	private Gson gson;
	@Autowired
	SessionScope sessionScope;
//	private static Logger log = Logger.getLogger(DealService.class);
	
	public String createDeal(String customer,String email,String roleIdStr,Deal deal){
		// log.info("DealService - createDeal()");
		String str_response = null;
//		DealProxy deal_proxy = null;
		try {
//			deal_proxy = new DealProxy();
		deal.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
		deal.setBanner(deal.isBannerImg());
		deal.setUserName(email);
		deal.setRoleName(roleIdStr);
		if(deal.getCustomerFilter()!=null && deal.getCustomerFilter().isFilterAdded()!=false)
			deal.setCustomerSpecific(true);
		//// log.info("Request String : : : : " + gson.toJson(deal));
		//////////////System.out.println("Request String : : : : " + gson.toJson(deal));
		//// log.info("Request Sended to Server");
	///	System.out.println("Request String : : Create deal: : " + gson.toJson(deal));
		
		str_response = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Deal_Service_create_Deal_details"), gson.toJson(deal),"POST");
		//str_response = deal_proxy.createDeal(gson.toJson(deal));
		//// log.info("Response String : : : : " + str_response);
		//// log.info("Response String : : : :  Getting Details Successfully");
		//System.out.println("Response String : : Create deal : :"+str_response);
		String responseCode = Response.getResponseCode(str_response);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			str_response = AppProperties.getAppMessageByProperty("Deal_Created_Successfully").trim();
			
		}
		else{
			//result = "Couldn't create, please try after some time";
			str_response = Response.getResponseMessage(str_response);
		}
		// log.info(str_response);
		/*}catch(ConnectException ce) {
			ce.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");*/
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("INVALID_REQUEST");
		/*} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("UNKNOWN_HOST");
		} catch (IOException ex) {
			ex.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");*/
		}catch(Exception e){
			e.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
		}
		return str_response;
	}
	
	public List<Deal> getDeals(String customer,String email,String location,String specific,String index,String maxRecords,boolean searchOnCategory,String refStr,String status){
		// log.info("DealService - getDeals()");
		String str_response = null,str_check="";
//		DealProxy deal_proxy = null;
		Deal obj_deal=new Deal();
		DealsBean bean_obj = null;
		List<Deal> lst_deals = null;
		List<String> sell_products=null;
		List<String> sell_skus=null;
		List<String> deal_products=null;
		List<String> deal_skus=null;
		try {
			bean_obj = new DealsBean();
//			deal_proxy = new DealProxy();
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			sell_products = new ArrayList<String>();
			sell_skus = new ArrayList<String>();
			deal_products = new ArrayList<String>();
			deal_skus = new ArrayList<String>();
			
		obj_deal.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		if(specific.equals("all")){
			obj_deal.setImageRequired(false);
			obj_deal.setStoreLocation(location);
		}
		else {
			obj_deal.setImageRequired(true);
			obj_deal.setDealID(location);
		}
		if(searchOnCategory){
			if(refStr.equals("add")){
				obj_deal.setDealID(specific);
			}/*else{
				obj_deal.setSearchText(specific);
				obj_deal.setSearchCriteria("product_category");
			}*/
		}
		if(refStr.equals("add")){
			obj_deal.setImageRequired(true);
		}
		obj_deal.setMaxRecords(maxRecords);
		obj_deal.setStartIndex(index);
		if(status != null && status.equals("active"))
			obj_deal.setDealStatus(status);
		// log.info("Request String : : : : " + gson.toJson(obj_deal));
		//////System.out.println("Request String : : : : " + gson.toJson(obj_deal));
		str_response = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Deal_Service_get_Deal_details"), gson.toJson(obj_deal),"GET");
		//str_response = deal_proxy.getDeals(gson.toJson(obj_deal));
		// log.info("Response String : : : : " + str_response);
	//	System.out.println("get deals Response String : : : : " + str_response);
		bean_obj = gson.fromJson(str_response,DealsBean.class); 
		
		
		if(bean_obj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
			lst_deals = bean_obj.getDealsList();
			
			if(!specific.equals("all")){
			 lst_deals.get(0).setBannerImg(lst_deals.get(0).isBanner());
			 lst_deals.get(0).setDealPicture(lst_deals.get(0).getDealPicture());
//			 String encodedImage = Base64.encode(bean_obj.getDealsList().get(0).getDeal_image());
//			 if(encodedImage == null || encodedImage == ""){
//				 encodedImage = "";
//				 lst_deals.get(0).setImageDeleted(false);
//			 }
//			 else
//				 lst_deals.get(0).setImageDeleted(true);
//			 lst_deals.get(0).setBannerImage(encodedImage);
			/* String encodedImage = Base64.encode(menuObj.getMenu_category_details().get(i).getCategory_icon());
		      menuObj.getMenu_category_details().get(i).setCategoryIcons(encodedImage);*/
		      
		     /* sell product ids */
		     if(lst_deals.get(0).getSellProducts() != null && !lst_deals.get(0).getSellProducts().equals("null") && !lst_deals.get(0).getSellProducts().equals("") && (lst_deals.get(0).getSellProducts()).contains(",")){
		    	 String[] sellItems = (lst_deals.get(0).getSellProducts()).split(",");
		    	 for(int i=0;i<sellItems.length;i++){
		    		 sell_products.add(sellItems[i]);
		    	 }
		    	 }
		     else if(lst_deals.get(0).getSellProducts() != null && !lst_deals.get(0).getSellProducts().equals("null") && !lst_deals.get(0).getSellProducts().equals("")) {sell_products.add(lst_deals.get(0).getSellProducts()); }
		     
		      /* sell sku ids*/
		     if(!str_check.equals(lst_deals.get(0).getSellSkuids())){
		     if(lst_deals.get(0).getSellSkuids() != null && (lst_deals.get(0).getSellSkuids()).contains(",")){
		    	 String[] sellItems = (lst_deals.get(0).getSellSkuids()).split(",");
		    	 for(int i=0;i<sellItems.length;i++){
		    		 sell_skus.add(sellItems[i]);
		    	 }
		    	 }
		     else if(lst_deals.get(0).getSellSkuids() != null && !lst_deals.get(0).getSellSkuids().equals("null") && !lst_deals.get(0).getSellSkuids().equals("")){sell_skus.add(lst_deals.get(0).getSellSkuids()); }
		     }
		     List<String> sellPluCode = new ArrayList<String>();
		     if(!str_check.equals(lst_deals.get(0).getSellPluCode())){
			     if(lst_deals.get(0).getSellPluCode() != null && (lst_deals.get(0).getSellPluCode()).contains(",")){
			    	 String[] pluCode = (lst_deals.get(0).getSellPluCode()).split(",");
			    	 for(int i=0;i<pluCode.length;i++){
			    		 sellPluCode.add(pluCode[i]);
			    	 }
			    	 }
			     else if(lst_deals.get(0).getSellPluCode() != null && !lst_deals.get(0).getSellPluCode().equals("null") && !lst_deals.get(0).getSellPluCode().equals("")){sellPluCode.add(lst_deals.get(0).getSellPluCode()); }
			     }
		     
		     /* for  deal products */
		     if(lst_deals.get(0).getDealProducts() != null && (lst_deals.get(0).getDealProducts()).contains(",") && !lst_deals.get(0).getDealProducts().equals("") && !lst_deals.get(0).getDealProducts().equals("null")){
		    	 String[] sellItems = (lst_deals.get(0).getDealProducts()).split(",");
		    	 for(int i=0;i<sellItems.length;i++){
		    		 deal_products.add(sellItems[i]);
		    	 }
		    	 }
		     else if(lst_deals.get(0).getDealProducts() != null && !lst_deals.get(0).getDealProducts().equals("null") && !lst_deals.get(0).getDealProducts().equals("")){deal_products.add(lst_deals.get(0).getDealProducts()); }
		     
		     /* sell sku ids*/
		     if(!str_check.equals(lst_deals.get(0).getDealSkus())){
		     if(lst_deals.get(0).getDealSkus() != null && !lst_deals.get(0).getDealSkus().equals("") && (lst_deals.get(0).getDealSkus()).contains(",")){
		    	 String[] sellItems = (lst_deals.get(0).getDealSkus()).split(",");
		    	 for(int i=0;i<sellItems.length;i++){
		    		 deal_skus.add(sellItems[i]);
		    	 }
		    	 }
		     else  if(lst_deals.get(0).getDealSkus() != null && !lst_deals.get(0).getDealSkus().equals("null") && !lst_deals.get(0).getDealSkus().equals("")){deal_skus.add(lst_deals.get(0).getDealSkus()); }
		     }
		     List<String> dealPluCode = new ArrayList<String>();
		     if(!str_check.equals(lst_deals.get(0).getDealPluCode())){
			     if(lst_deals.get(0).getDealPluCode() != null && !lst_deals.get(0).getDealPluCode().equals("null") && (lst_deals.get(0).getDealPluCode()).contains(",")){
			    	 String[] dealPlus = (lst_deals.get(0).getDealPluCode()).split(",");
			    	 for(int i=0;i<dealPlus.length;i++){
			    		 dealPluCode.add(dealPlus[i]);
			    	 }
			    	 }
			     else  if(lst_deals.get(0).getDealPluCode() != null && !lst_deals.get(0).getDealPluCode().equals("") && !lst_deals.get(0).getDealPluCode().equals("null")){dealPluCode.add(lst_deals.get(0).getDealPluCode()); }
			     }
		     List<String> saleSkuPlu = new ArrayList<String>();
		     for(int i =0; i< sell_skus.size(); i++){
		    	 if(sellPluCode.size()>0)
		    	 {
		    		 saleSkuPlu.add(sell_skus.get(i));
			    	 saleSkuPlu.add(sellPluCode.get(i));
		    	 } 
		     }
		     sell_skus = saleSkuPlu;
		     List<String> dealSkuPlu = new ArrayList<String>();
		     for(int i =0; i< deal_skus.size(); i++){
		    	 if(dealPluCode.size()>0)
		    	 {
		    		 dealSkuPlu.add(deal_skus.get(i));
			    	 dealSkuPlu.add(dealPluCode.get(i));
		    	 } 
		     }
		     deal_skus = dealSkuPlu;
		   }else{
			   for(Deal dealObj : lst_deals){
				   dealObj.setDealStartDate(DateUtil.getDateYYYYMMDD(dealObj.getDealStartDate()));
				   dealObj.setDealEndDate(DateUtil.getDateYYYYMMDD(dealObj.getDealEndDate()));
			   }
		   }
				
			lst_deals.get(0).setSell_products(sell_products);
			lst_deals.get(0).setSell_skus(sell_skus);
			lst_deals.get(0).setDeal_products(deal_products);
			lst_deals.get(0).setDeal_skus(deal_skus);
			lst_deals.get(0).setTotalRecords(Response.getResponseTotalRecords(str_response));
			
			
		}
	/*	}catch(ConnectException ce) {
			ce.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");*/
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("INVALID_REQUEST");
		/*} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("UNKNOWN_HOST");
		} catch (IOException ex) {
			ex.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");*/
		}catch(Exception e){
			e.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
		}
		//// log.info(lst_dealDetails.size());
		return lst_deals;
	}
	public String updateDeal(String customer,String email,String roleIdStr,Deal deal){
		
		// log.info("DealService - createDeal()");
		String str_response = null;
//		DealProxy deal_proxy = null;
		try {
//		deal_proxy = new DealProxy();
		deal.setUserName(email);
		deal.setRoleName(roleIdStr);	
		deal.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
		deal.setBanner(deal.isBannerImg());
		if(deal.getCustomerFilter()!=null && deal.getCustomerFilter().isFilterAdded()!=false)
			deal.setCustomerSpecific(true);
		//// log.info("Request String : : : : " + gson.toJson(deal));
		// log.info("Request Sended to Server"+gson.toJson(deal));
	//	System.out.println(" update Request Server Deal_Service_update_Deal_details"+gson.toJson(deal));
		str_response = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Deal_Service_update_Deal_details"), gson.toJson(deal),"POST");
		//str_response = deal_proxy.updateDeal((gson.toJson(deal)));
		// log.info("Response String : : : : " + str_response);
		//// log.info("Response String : : : :  Getting Details Successfully");
		//////////System.out.println("Response String : : Deal_Service_update_Deal_details: : " + str_response);
		String responseCode = Response.getResponseCode(str_response);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			str_response = AppProperties.getAppMessageByProperty("Deal_Update_Successfully").trim();
			
		}
		else{
			//result = "Couldn't create, please try after some time";
			str_response = Response.getResponseMessage(str_response);
		}
		// log.info(str_response);
		/*}catch(ConnectException ce) {
			ce.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");*/
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("INVALID_REQUEST");
		/*} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("UNKNOWN_HOST");
		} catch (IOException ex) {
			ex.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");*/
		}catch(Exception e){
			e.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
		}
		return str_response;
	}
	
	public String deleteDeal(String customer,String email,String deal){
		// log.info("DealService - deleteDeal()");
		String str_response = null;
//		DealProxy deal_proxy = null;
		Deal deals = new Deal();
		List<String> dealList = new ArrayList<String>();
		try {
//		deal_proxy = new DealProxy();
		RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
		deals.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		String[] dealids = deal.split(",");
		for(int i=0;i<dealids.length;i++){
			dealList.add(dealids[i]);
		}
		deals.setDealIDList(dealList);
		// log.info("Request String : : : : " + gson.toJson(deals));
		 //////////////System.out.println("Request String : : : : " + gson.toJson(deals));
		//// log.info("Request Sended to Server");
		str_response = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Deal_Service_delete_Deal_details"), gson.toJson(deals),"GET");
		//str_response = deal_proxy.deleteDeals((gson.toJson(deals)));
		// log.info("Response String : : : : " + str_response);
	   // ////////////System.out.println("Response String : : : : " + str_response);
		String responseCode = Response.getResponseCode(str_response);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			str_response = AppProperties.getAppMessageByProperty("deal_delete_success").trim();
			
		}
		else{
			//result = "Couldn't create, please try after some time";
			str_response = Response.getResponseMessage(str_response);
		}
		// log.info(str_response);
		/*}catch(ConnectException ce) {
			ce.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");*/
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("INVALID_REQUEST");
	/*	} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("UNKNOWN_HOST");
		} catch (IOException ex) {
			ex.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");*/
		}catch(Exception e){
			e.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
		}
		return str_response;
	}
	
	
	
	
	
	public List<Deal> searchDeals(String customerIdStr,String emailIdStr,String locationStr,String searchCriteriaStr,String index,
			String maxRecords,String startDate,String endDate,boolean onCategory,String groupid,String zone,String offerType,String offerStatusValue,String saveFlag){
		// log.info("DealService - getDeals()");
		String resultStr = null;
		Deal dealObj=new Deal();
		DealsBean dealsBeanObj = null;
		List<Deal> dealsList = null;
		try {
			dealsBeanObj = new DealsBean();
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			dealObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			dealObj.setImageRequired(false);
			dealObj.setStoreLocation(locationStr);
			dealObj.setStartIndex(index);
//			dealObj.setSearchCriteria(searchCriteriaStr);
			/*dealObj.setDealCategory(searchCriteriaStr);
			dealObj.setDealID(searchCriteriaStr);
			dealObj.setDealName(searchCriteriaStr);
			dealObj.setSellProducts(searchCriteriaStr);
			dealObj.setSellSkuids(searchCriteriaStr);*/
//			dealObj.setSearchKey("console");
			dealObj.setDealStatus(offerStatusValue);
			dealObj.setZoneId(zone);
			dealObj.setDealCategory(offerType);
			dealObj.setMaxRecords(maxRecords);
			dealObj.setDealStartDate(startDate);
			dealObj.setDealEndDate(endDate);
			if(onCategory){
				dealObj.setSearchCriteria("productCategoryOrGroupId");
				dealObj.setSaleProductCategory(searchCriteriaStr);
				dealObj.setSellGroupId(groupid);
			}else{
			dealObj.setSearchCriteria(searchCriteriaStr);
			dealObj.setSearchKey("console");
			}
			
			if(saveFlag.equals("true") || saveFlag=="true")
			{
				dealObj.setSaveReport(true);
			}
			else
			{
				dealObj.setSaveReport(false);
			}
			
			// log.info("Request String : : : : " + gson.toJson(dealObj));
//			////////////System.out.println("Request String : : : : " + gson.toJson(dealObj));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Deal_Service_search_Deal_details"), gson.toJson(dealObj),"GET");
			// log.info("Response String : : : : " + resultStr);
//			////////////System.out.println("Response String : : : : " + resultStr);
			dealsBeanObj = gson.fromJson(resultStr,DealsBean.class); 
			if(dealsBeanObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				dealsList = dealsBeanObj.getSearchDeals();
				 for(Deal deal : dealsList){
					   deal.setDealStartDate(DateUtil.getDateYYYYMMDD(deal.getDealStartDate()+" 00:00:00"));
					   deal.setDealEndDate(DateUtil.getDateYYYYMMDD(deal.getDealEndDate()+" 00:00:00"));
				   }
				dealsList.get(0).setTotalRecords(Response.getResponseTotalRecords(resultStr));
				dealsList.get(0).setFilePath(dealsBeanObj.getFilePath());
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST");
		}catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
		}
		return dealsList;
	}
	
	/**
	 * @author Mythri.S	
	 * 
	 * This method is used to call the getDeals method of web service and return the deal names List
	 * 
	 */
	public List<String> searchDealNames(String customerId,String emailId,String searchNameStr){
		String result = null;
		List<String> dealNameList = new ArrayList<String>();
		try {
			// log.info("searchDealNames");
			Deal dealObj = new Deal();
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			dealObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			dealObj.setDealName(searchNameStr);
			dealObj.setStartIndex("0");
			// log.info("Request String:::::::::"+gson.toJson(dealObj));
			result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Deal_Service_get_Deal_details"), gson.toJson(dealObj),"GET");
			// log.info("Response String:::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				DealsBean dealsBeanObj = gson.fromJson(result,DealsBean.class); 
				for(int i=0; i<dealsBeanObj.getDealsList().size(); i++){
					dealNameList.add(dealsBeanObj.getDealsList().get(i).getDealName());
				}
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
		} catch(Exception e){
			e.printStackTrace();
		}
		return dealNameList;
	}
	
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to call createHotDeals method of web service and return the response
	 *
	 **/
	public String createNewHotDeal(HotDeals hotDealsObj,String customerIdStr,String emailIdStr){
		String result = null;
		try {
			hotDealsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			//////System.out.println("Request String:::::::::::"+gson.toJson(hotDealsObj));
			result = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("hotdeal_service_create_hotDeals"), gson.toJson(hotDealsObj));
			//////System.out.println("Response String:::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("HOTDEAL_CREATE_SUCCESS").trim();
			}
			else{
				//result = "Couldn't create, please try after some time";
				result = Response.getResponseMessage(result);
			}
		/*}catch(ConnectException ce) {
			ce.printStackTrace();
			result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();*/
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		/*} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			result = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
		} catch(RemoteException rme){
			rme.printStackTrace();
			result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();*/
		} catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to call updateHotDeals method of web service and return the response
	 *
	 **/
	public String updateHotDeal(HotDeals dealObj,String customerId,String emailId){
		String result = null;
		try {
			dealObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			// log.info("Request String:::::::::::"+gson.toJson(dealObj));
			result = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("hotdeal_service_update_hotDeals"), gson.toJson(dealObj));
			// log.info("Response String:::::::::::"+result);
			 String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					result = AppProperties.getAppMessageByProperty("HOTDEAL_UPDATE_SUCCESS").trim();
				}
				else{
//					result = "Couldn't update, please try after some time";
					result = Response.getResponseMessage(result);
				}
		/*}catch(ConnectException ce) {
			ce.printStackTrace();
			result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();*/
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		/*} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			result = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
		} catch(RemoteException rme){
			rme.printStackTrace();
			result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();*/
		} catch(Exception e){
			e.printStackTrace();
		}
		//////////////System.out.println(result);
		return result;
	}
	
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to get Hot Deal Details
	 *
	 **/
	
	public List<HotDeals> getHotDealsInfo(String nameStr,String customerIdStr,String emailIdStr,String index,boolean search,String maxRecords,String startDate,String endDate){
		String result = null;
		HotDeals dealsObj = new HotDeals();
		HotDealResponse responseObj = new HotDealResponse();
		List<HotDeals> hotDealsList =new ArrayList<HotDeals>();
		try{
			
			dealsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			if(search)
				dealsObj.setSearchCriteria(nameStr);
			else
				dealsObj.setHotDealRef(nameStr);
			dealsObj.setStartIndex(index);
			dealsObj.setMaxRecords(maxRecords);
			dealsObj.setEffectiveFromDateStr(startDate);
			dealsObj.setEndDateStr(endDate);
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			// log.info("Request String:::::::::::"+gson.toJson(dealsObj));
			result = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("hotdeal_service_get_hotDeals"), gson.toJson(dealsObj),"GET");
			// log.info("Response String:::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				responseObj = gson.fromJson(result, HotDealResponse.class);
				if(responseObj.getHotDealsList() != null && responseObj.getHotDealsList().size()>0){
					
					responseObj.getHotDealsList().get(0).setTotalRecords(Response.getResponseTotalRecords(result));
					
					if(responseObj.getHotDealsList() != null && responseObj.getHotDealsList().size()>0)
						for(int i=0;i<responseObj.getHotDealsList().size();i++){
						if(responseObj.getHotDealsList().get(i).getStatusStr().equals("1"))
							responseObj.getHotDealsList().get(i).setStatusStr("Active");
						else 
							responseObj.getHotDealsList().get(i).setStatusStr("In-Active");
					}
					
						
					int slNo = Integer.parseInt(index);
					for(HotDeals hotDealsObj : responseObj.getHotDealsList())
						hotDealsObj.setSlNo(++slNo);
				}else if(responseObj.getDealObj()!=null){
					hotDealsList.add(responseObj.getDealObj());
					return hotDealsList;
				}
			}
		/*}catch(ConnectException ce) {
			ce.printStackTrace();
			result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();*/
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
/*		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			result = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
		} catch(RemoteException rme){
			rme.printStackTrace();
			result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();*/
		} catch(Exception e){
			e.printStackTrace();
		}
		return responseObj.getHotDealsList();
	}

	
	
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to call deleteHotDeal method of web service and return the response
	 *
	 **/
	public String deleteHotDeal(String customerIdStr,String emailIdStr,String ids) {
		String result = null;
		try {
			HotDeals deals=new HotDeals();
			//////////////System.out.println("ids "+ids);
			deals.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			String[] bnames = ids.split(",");
			//////////////System.out.println(bnames);
			/*List<String> brandDetails = new ArrayList<String>();
			for(int i=0;i<bnames.length;i++)
				brandDetails.add(bnames[i]);*/
			deals.setHotDealRefIds(bnames);
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			// log.info("Request String:::::::::::"+gson.toJson(deals));
			result = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("hotdeal_service_delete_hotDeals"), gson.toJson(deals));
			// log.info("Response String:::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("HOTDEAL_DELETE_SUCCESS").trim();
			else if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_FAILED_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("DELETE_FAILED").trim();
		/*}catch(ConnectException ce) {
			ce.printStackTrace();
			result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();*/
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		/*} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			result = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
		} catch(RemoteException rme){
			rme.printStackTrace();
			result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();*/
		} catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
}
