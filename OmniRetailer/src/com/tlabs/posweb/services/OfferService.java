package com.tlabs.posweb.services;

import java.io.IOException;
import java.rmi.ConnectException;
import java.rmi.RemoteException;
import java.rmi.UnknownHostException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.NoSuchElementException;

import com.tlabs.posweb.init.AppProperties;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.sun.xml.internal.bind.v2.runtime.output.StAXExStreamWriterOutput;
import com.technolabssoftware.www.OfferProxy;
import com.tlabs.posweb.beans.LoyaltyCardMaster;
import com.tlabs.posweb.beans.Offer;
import com.tlabs.posweb.beans.OfferLocations;
import com.tlabs.posweb.beans.OffersBean;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.util.Constants;
import com.tlabs.posweb.util.DateUtil;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
import com.tlabs.posweb.util.RestfulServiceConnection;
import com.tlabs.posweb.util.Utilities;

@SuppressWarnings("unused")
public class OfferService {

	@Autowired
	private Gson gson;
	@Autowired
	SessionScope sessionScope;
//	private static Logger log = Logger.getLogger(OfferService.class);
	
	public String createOffer(String customer,String email,String roleIdStr,Offer offerDetails){
		// log.info("DealService - createDeal()");
		String str_response = null;
		//OfferProxy offer_proxy = null;
		try {
			//offer_proxy = new OfferProxy();
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			offerDetails.setUserName(email);
			offerDetails.setRoleName(roleIdStr);
			offerDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		//// log.info("Request String : : : : " + gson.toJson(offerDetails));
			offerDetails.setBanner(offerDetails.isBannerImg());
//			//////////////System.out.println(offerDetails.getCustomerFilter().isFilterAdded());
			if(offerDetails.getCustomerFilter()!=null && offerDetails.getCustomerFilter().isFilterAdded()!=false)
			{
				offerDetails.setCustomerSpecific(true);
				if(offerDetails.getCustomerFilter().getNoOfClaims()>0)
				{
					offerDetails.getCustomerFilter().setFirsttimeOffer(true);
				}
				else
				{
					offerDetails.getCustomerFilter().setFirsttimeOffer(false);
				}
			}
			
		//// log.info("Request Sended to Server");
		
	///	System.out.println("Request String create offer req: : : : " + gson.toJson(offerDetails));
		str_response = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_Offer"), gson.toJson(offerDetails));

		//str_response = offer_proxy.createOffer(gson.toJson(offerDetails));
		// log.info("Response String : : : : " + str_response);
		// log.info("Response String : : : :  Getting Details Successfully");
   // System.out.println("Response String create offer res.... : : : : " + str_response);
		String responseCode = Response.getResponseCode(str_response);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			str_response = AppProperties.getAppMessageByProperty("Offer_Created_Successfully").trim();
			
		}
		else{
			//result = "Couldn't create, please try after some time";
			str_response = Response.getResponseMessage(str_response);
		}
		// log.info(str_response);
		}catch(ConnectException ce) {
			ce.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("INVALID_REQUEST");
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("UNKNOWN_HOST");
		} catch (IOException ex) {
			ex.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
		}catch(Exception e){
			e.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
		}
		return str_response;
	}
	
	public List<Offer> getOffers(String customer,String email,String location,String specific,String index,String maxRecords,boolean searchOnCategory,String refStr,String status,String offerStatusValue,String zone,String offerType,String allLocations){
		// log.info("DealService - getDeals()");
		String str_response = null,str_check="";
	    OfferLocations offerloction=null;
	    List<OfferLocations> offerLocations =null;
		List<String> offerLocationsString=null;
		//OfferProxy offer_proxy = null;
		Offer obj_offer=new Offer();
		OffersBean bean_obj = null;
		List<Offer> lst_offers = null;
		List<String> sell_products=null;
		List<String> sell_skus=null;
		List<String> locationList =null;
		try {
			bean_obj = new OffersBean();
//			lst_offers = new ArrayList<Offer>();
			//offer_proxy = new OfferProxy();
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			offerloction = new OfferLocations();
			offerLocations= new ArrayList<OfferLocations>();
			sell_products = new ArrayList<String>();
			sell_skus = new ArrayList<String>();
			if(location == null || location.equalsIgnoreCase("all"))
				location = "";
			
			obj_offer.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		if(specific.equals("all")){
			obj_offer.setImageRequired(false);
			obj_offer.setStoreLocation(location);
			/*offerloction.setStoreLocation(location);
			offerLocations.add(offerloction);
			obj_offer.setOfferLocationsList(offerLocations);*/
		}
		else {
			obj_offer.setImageRequired(true);
			obj_offer.setOfferID(location);
		}
		if(searchOnCategory){
			if(refStr.equals("add")){
				obj_offer.setOfferID(specific);
			}else{
				obj_offer.setProductCategory(specific);
			}
			obj_offer.setImageRequired(false);
			obj_offer.setOfferImage(null);
		}
//		if(status != null && status.equals("active"))
//			obj_offer.setOfferStatus(offerStatusValue);
		obj_offer.setStartIndex(index);
//		obj_offer.setOfferCategory(offerType);
		obj_offer.setZoneId(zone);
		obj_offer.setMaxRecords(maxRecords);
		if(refStr.equals("add")){
			obj_offer.setImageRequired(true);
		}
		if(allLocations != null && !allLocations.trim().equals(""))
			 locationList = new ArrayList<String>(Arrays.asList(allLocations.split(",")));
		obj_offer.setAllLocationsList(locationList);
		//// log.info("Request String : : : : " + gson.toJson(obj_offer));
///		System.out.println("get Request String : : : : " + gson.toJson(obj_offer));
		str_response = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_offers"), gson.toJson(obj_offer),"GET");

		//str_response = offer_proxy.getOffer(gson.toJson(obj_offer));
		//// log.info("Response String : : : : " + str_response);
		//// log.info("Response String : : : :  Getting Details Successfully"+str_response);
////		System.out.println("Response String offers response : : : :  "+str_response);
		
		bean_obj = gson.fromJson(str_response,OffersBean.class); 
		
		
		if(bean_obj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
			lst_offers = bean_obj.getOfferList();
			
			if(!specific.equals("all")){
				lst_offers.get(0).setOfferImage(lst_offers.get(0).getOfferPicture());
				lst_offers.get(0).setBannerImg(lst_offers.get(0).isBanner());
				lst_offers.get(0).setCustomerspecificflag(lst_offers.get(0).isCustomerSpecific());
//			 String encodedImage = Base64.encode(bean_obj.getOfferList().get(0).getOfferImage());
//			 lst_offers.get(0).setBannerImage(encodedImage);
			 
			/* String encodedImage = Base64.encode(menuObj.getMenu_category_details().get(i).getCategory_icon());
		      menuObj.getMenu_category_details().get(i).setCategoryIcons(encodedImage);*/
		      
			// // log.info(encodedImage);
		   //  // log.info(lst_offers.get(0).getBannerImage());
		     /* sell product ids */
		     if(!str_check.equals(lst_offers.get(0).getSellProducts()) && lst_offers.get(0).getSellProducts() != null){
		     if(lst_offers.get(0).getSellProducts() != null && (lst_offers.get(0).getSellProducts()).contains(",")){
		    	 String[] sellItems = (lst_offers.get(0).getSellProducts()).split(",");
		    	 for(int i=0;i<sellItems.length;i++){
		    		 sell_products.add(sellItems[i]);
		    	 }
		    	 }
		     else if(lst_offers.get(0).getSellProducts() != null && !lst_offers.get(0).getSellProducts().equals("null") && !lst_offers.get(0).getSellProducts().equals("")){sell_products.add(lst_offers.get(0).getSellProducts()); }
			}
		     
		      /* sell sku ids*/
		     if(!str_check.equals(lst_offers.get(0).getSellSkuids()) && lst_offers.get(0).getSellSkuids() != null){
		     if(lst_offers.get(0).getSellSkuids() != null && (lst_offers.get(0).getSellSkuids()).contains(",")){
		    	 String[] sellItems = (lst_offers.get(0).getSellSkuids()).split(",");
		    	 for(int i=0;i<sellItems.length;i++){
		    		 sell_skus.add(sellItems[i]);
		    	 }
		    	 }
		     else if(lst_offers.get(0).getSellSkuids() != null && !lst_offers.get(0).getSellSkuids().equals("null") && !lst_offers.get(0).getSellSkuids().equals("")){sell_skus.add(lst_offers.get(0).getSellSkuids()); }
		     }
		     List<String> sellPluCode = new ArrayList<String>();
		     if(!str_check.equals(lst_offers.get(0).getSellPluCode())){
			     if(lst_offers.get(0).getSellPluCode() != null && (lst_offers.get(0).getSellPluCode()).contains(",")){
			    	 String[] pluCode = (lst_offers.get(0).getSellPluCode()).split(",");
			    	 for(int i=0;i<pluCode.length;i++){
			    		 sellPluCode.add(pluCode[i]);
			    	 }
			    	 }
			     else if(lst_offers.get(0).getSellPluCode() != null && !lst_offers.get(0).getSellPluCode().equals("null") && !lst_offers.get(0).getSellPluCode().equals("")){sellPluCode.add(lst_offers.get(0).getSellPluCode()); }
			     }
		     
		     
		    /*  for  deal products 
		     if((lst_offers.get(0).getDealProducts()).contains(",")){
		    	 String[] sellItems = (lst_offers.get(0).getDealProducts()).split(",");
		    	 for(int i=0;i<sellItems.length;i++){
		    		 deal_products.add(sellItems[i]);
		    	 }
		    	 }
		     else{deal_products.add(lst_offers.get(0).getDealProducts()); }
		     
		      sell sku ids
		     if(!str_check.equals(lst_offers.get(0).getDealSkus())){
		     if((lst_offers.get(0).getDealSkus()).contains(",")){
		    	 String[] sellItems = (lst_offers.get(0).getDealSkus()).split(",");
		    	 for(int i=0;i<sellItems.length;i++){
		    		 deal_skus.add(sellItems[i]);
		    	 }
		    	 }
		     else{deal_skus.add(lst_offers.get(0).getDealSkus()); }*/
		     List<String> saleSkuPlu = new ArrayList<String>();
		     for(int i =0; i< sell_skus.size(); i++){
		    	 saleSkuPlu.add(sell_skus.get(i));
		    	 saleSkuPlu.add(sellPluCode.get(i));
		     }
		     sell_skus = saleSkuPlu;
		     }
			else{
				   for(Offer offerObj : lst_offers){
					   offerObj.setOfferStartDate(DateUtil.getDateYYYYMMDD(offerObj.getOfferStartDate()));
					   offerObj.setOfferEndDate(DateUtil.getDateYYYYMMDD(offerObj.getOfferEndDate()));
				   }
			   }
		 //  }
				
			lst_offers.get(0).setSell_products(sell_products);
			lst_offers.get(0).setSell_skus(sell_skus);
			//lst_offers.get(0).setDeal_products(deal_products);
			//lst_offers.get(0).setDeal_skus(deal_skus);
			lst_offers.get(0).setTotalRecords(Response.getResponseTotalRecords(str_response));
			//////////////System.out.println("Response String offers response 2222: : : :  "+gson.toJson(lst_offers));
		}
		}catch(ConnectException ce) {
			ce.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("INVALID_REQUEST");
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("UNKNOWN_HOST");
		} catch (IOException ex) {
			ex.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
		}catch(Exception e){
			e.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
		}
		//// log.info(lst_dealDetails.size());
//		// log.info(lst_offers.size());
		return lst_offers;
	}
	public String updateOffer(String customer,String email,String roleIdStr,Offer offer){
		// log.info("DealService - createDeal()");
		String str_response = null;
		//OfferProxy deal_proxy = null;
		try {
		//deal_proxy = new OfferProxy();
		RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
		offer.setUserName(email);
		offer.setRoleName(roleIdStr);
		offer.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		offer.setBanner(offer.isBannerImg());
		/*if(offer.getCustomerFilter()!=null && offer.getCustomerFilter().isFilterAdded()!=false)
			offer.setCustomerSpecific(true);
		*/
		if(offer.getCustomerFilter()!=null && offer.getCustomerFilter().isFilterAdded()!=false)
		{
			offer.setCustomerSpecific(true);
			if(offer.getCustomerFilter().getNoOfClaims()>0)
			{
				offer.getCustomerFilter().setFirsttimeOffer(true);
			}
			else
			{
				offer.getCustomerFilter().setFirsttimeOffer(false);
			}
		}
		//offer.setCustomerSpecific(offer.isCustomerspecificflag());
		//// log.info("Request String : : : : " + gson.toJson(offer));
///		System.out.println("Request String update offer testtttttt : : : : " + gson.toJson(offer));
		//// log.info("Request Sended to Server");
//		//////////////System.out.println("Request Sended to Server");
		str_response = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_Offer"), gson.toJson(offer));
		//str_response = deal_proxy.updateOffer((gson.toJson(offer)));
		//// log.info("Response String : : : : " + str_response);
		//// log.info("Response String : : : :  Getting Details Successfully");
///		System.out.println("Response String offer update successful: : : : " +str_response);
		String responseCode = Response.getResponseCode(str_response);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			str_response = AppProperties.getAppMessageByProperty("Offer_Update_Successfully").trim();
			
		}
		else{
			//result = "Couldn't create, please try after some time";
			str_response = Response.getResponseMessage(str_response);
		}
		// log.info(str_response);
		}catch(ConnectException ce) {
			ce.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("INVALID_REQUEST");
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("UNKNOWN_HOST");
		} catch (IOException ex) {
			ex.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
		}catch(Exception e){
			e.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
		}
		return str_response;
	}
	
	public String deleteOffer(String customer,String email,String deal){
		// log.info("OfferService - deleteOffer()");
		String str_response = null;
		//OfferProxy offerProxy = null;
		Offer deals = new Offer();
		List<String> dealList = new ArrayList<String>();
		try {
		//offerProxy = new OfferProxy();
		RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
		deals.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		String[] dealids = deal.split(",");
		for(int i=0;i<dealids.length;i++){
			dealList.add(dealids[i]);
		}
		deals.setOfferIdList(dealList);
		//// log.info("Request String : : : : " + gson.toJson(deals));
		// log.info("Request Sended to Server");
		str_response = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("delete_Offers"), gson.toJson(deals));

		//str_response = offerProxy.deleteOffers((gson.toJson(deals)));
		// log.info("Response String : : : : " + str_response);
		// log.info("Response String : : : :  Getting Details Successfully");
		////////////////System.out.println("Response String : : : : " + str_response);
		String responseCode = Response.getResponseCode(str_response);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			str_response = AppProperties.getAppMessageByProperty("Offer_delete_success").trim();
			
		}
		else{
			//result = "Couldn't create, please try after some time";
			str_response = Response.getResponseMessage(str_response);
		}
		// log.info(str_response);
		}catch(ConnectException ce) {
			ce.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("INVALID_REQUEST");
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("UNKNOWN_HOST");
		} catch (IOException ex) {
			ex.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
		}catch(Exception e){
			e.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
		}
		return str_response;
	}
	
	public List<Offer> searchOffers(String customerIdStr,String emailIdStr,String locationStr,String searchCriteriaStr,String index,String maxRecords,String startDate,String endDate,String offerStatusValue,String zone,String offerType,String AllLocations,String saveFlag){
		//// log.info("DealService - getDeals()");
		String resultStr = null;
		Offer offerObj=new Offer();
		OfferLocations offerloction=null;
	    List<OfferLocations> offerLocationsList =null;
		OffersBean offersBeanObj = null;
		List<String> offerLocations=null;
		List<Offer> offersList = null;
		List<String> myList = null;
		try {
			offersBeanObj = new OffersBean();
			offerLocationsList=new ArrayList<OfferLocations>();
			offerLocations=new ArrayList<String>();
			offerloction = new OfferLocations();
			offerLocationsList= new ArrayList<OfferLocations>();
			
			//OfferProxy offer_proxy = new OfferProxy();
			offerObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			offerObj.setImageRequired(false);
			/*offerloction.setStoreLocation(locationStr);
			offerLocationsList.add(offerloction);
			offerObj.setOfferLocationsList(offerLocationsList);*/
			offerObj.setOfferStatus(offerStatusValue);
			offerObj.setStoreLocation(locationStr);
			offerObj.setStartIndex(index);
			offerObj.setOfferCategory(offerType);
			offerObj.setZoneId(zone);
			offerObj.setSearchCriteria(searchCriteriaStr);
			offerObj.setMaxRecords(maxRecords);
			offerObj.setOfferStartDate(startDate);
			offerObj.setOfferEndDate(endDate);
			
			if(saveFlag.equals("true") || saveFlag=="true")
			{
				offerObj.setSaveReport(true);
			}
			else
			{
				offerObj.setSaveReport(false);
			}
			
			
			if(AllLocations != null && !AllLocations.trim().equals(""))
			 myList = new ArrayList<String>(Arrays.asList(AllLocations.split(",")));
			offerObj.setAllLocationsList(myList);
			offerObj.setSearchKey("console");
			
			
			// log.info("Request String : : : : " + gson.toJson(offerObj));
			//////System.out.println("search Request String : : : : " + gson.toJson(offerObj));
			resultStr = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("search_offers"), gson.toJson(offerObj), "GET");
			//resultStr = offer_proxy.searchOffers(gson.toJson(offerObj));
			//// log.info("Response String : : : : " + resultStr);
			//////System.out.println(" search Response String : search_offers: : : " + resultStr);
			
			offersBeanObj = gson.fromJson(resultStr,OffersBean.class); 
			if(offersBeanObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				offersList = offersBeanObj.getSearchOffers();
				for(Offer offer : offersList){
					   offer.setOfferStartDate(DateUtil.getDateYYYYMMDD(offer.getOfferStartDate()+" 00:00:00"));
					   offer.setOfferEndDate(DateUtil.getDateYYYYMMDD(offer.getOfferEndDate()+" 00:00:00"));
				   }
				offersList.get(0).setTotalRecords(Response.getResponseTotalRecords(resultStr));
				offersList.get(0).setFilePath(offersBeanObj.getFilePath());
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST");
		}catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
		}
		return offersList;
	}
	public List<Offer> getOffersbycategory(String productCategory,String groupId,String index){
		// log.info("OfferService - searchOffers()");
		String resultStr = null;
		Offer offerObj=new Offer();
		OffersBean offersBeanObj = null;
		List<Offer> offersList = null;
		try {
			offersBeanObj = new OffersBean();
			///OfferProxy offer_proxy = new OfferProxy();
			offerObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			offerObj.setImageRequired(false);
			offerObj.setStartIndex("0");
			offerObj.setSearchCriteria("productCategoryOrGroupId");
			offerObj.setProductCategory(productCategory);
			offerObj.setSellGroupId(groupId);
			
			/*// log.info("Request String : : : : " + gson.toJson(offerObj));
			resultStr = offer_proxy.searchOffers(gson.toJson(offerObj));
			// log.info("Response String : : : : " + resultStr);*/
			resultStr = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("search_offers"), gson.toJson(offerObj), "GET");

			
			offersBeanObj = gson.fromJson(resultStr,OffersBean.class); 
			if(offersBeanObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				offersList = offersBeanObj.getSearchOffers();
				for(Offer offer : offersList){
					   offer.setOfferStartDate(DateUtil.getDateYYYYMMDD(offer.getOfferStartDate()+" 00:00:00"));
					   offer.setOfferEndDate(DateUtil.getDateYYYYMMDD(offer.getOfferEndDate()+" 00:00:00"));
				   }
				offersList.get(0).setTotalRecords(Response.getResponseTotalRecords(resultStr));
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST");
		}catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
		}
		return offersList;
	}
	
	

	
	/*public String deleteOfferProduct(String customerIdStr,String emailIdStr,String ids) {
		String result = null;
		try {
			
			Offer offerObj=new Offer();
			
			LoyaltyCardMaster loyaltyCard = new LoyaltyCardMaster();
			offerObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			String[] skuId = ids.split(",");
			List<String> skuIdDetails = new ArrayList<String>();
			
		
			for(int i=0;i<skuId.length;i++){
				skuIdDetails.add(skuId[i]);
			}
			offerObj.setskuId(skuIdDetails);
			
			//result = brandMasterServiceProxyObj.deleteBrand(gson.toJson(master));
			
			
	///////	System.out.println("Request String:::delete::::"+gson.toJson(offerObj ));
			
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("delete_Loyalty_Card"), gson.toJson(offerObj));
			
/////		System.out.println("Response String:::delete::::"+result);
			String responseCode = Response.getResponseCode(result);
			
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
			//	result = AppProperties.getAppMessageByProperty("LOYALTY_DELETE_SUCCESS").trim();
				result = Response.getResponseMessage(result);
			
			else {
			//	result = AppProperties.getAppMessageByProperty("DELETE_FAILED").trim();
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
	}*/
	
	
	
	
	/**
	 * @author Mythri.S	
	 * 
	 * This method is used to call the getDeals method of web service and return the deal names List
	 * 
	 */
	public List<String> searchOfferNames(String customerId,String emailId,String searchNameStr){
		String result = null;
		List<String> offerNameList = new ArrayList<String>();
		try {
			// log.info("searchOfferNames");
			Offer offerObj = new Offer();
			//OfferProxy offerProxyObj = new OfferProxy();
			offerObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			offerObj.setOfferName(searchNameStr);
			offerObj.setStartIndex("0");
			
			/*// log.info("Request String:::::::::"+gson.toJson(offerObj));
			result = offerProxyObj.getOffer(gson.toJson(offerObj));
			// log.info("Response String:::::::::"+result);*/
			
			result = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("get_offers"), gson.toJson(offerObj), "GET");

			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				OffersBean offerBeanObj = gson.fromJson(result,OffersBean.class); 
				for(int i=0; i<offerBeanObj.getOfferList().size(); i++){
					offerNameList.add(offerBeanObj.getOfferList().get(i).getOfferName());
				}
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
		} catch(Exception e){
			e.printStackTrace();
		}
		return offerNameList;
	}
	
	

	public OffersBean getPromotionPrint(String customer,String email,String location,String specific,String index,String maxRecords,boolean searchOnCategory,String refStr,String status,String offerStatusValue,String zone,String offerType,String allLocations){
		String str_response = null,str_check="",printUrl="";
	  
		Offer obj_offer=new Offer();
		OffersBean bean_obj = null;
		
		List<String> locationList =null;
		try {
			bean_obj = new OffersBean();
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			
			if(location == null || location.equalsIgnoreCase("all"))
				location = "";
			
			obj_offer.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		if(specific.equals("all")){
			obj_offer.setImageRequired(false);
			obj_offer.setStoreLocation(location);
			
		}
		else {
			obj_offer.setImageRequired(true);
			obj_offer.setOfferID(location);
		}
		if(searchOnCategory){
			if(refStr.equals("add")){
				obj_offer.setOfferID(specific);
			}else{
				obj_offer.setProductCategory(specific);
			}
			obj_offer.setImageRequired(false);
			obj_offer.setOfferImage(null);
		}
		obj_offer.setStartIndex(index);
		obj_offer.setZoneId(zone);
		obj_offer.setMaxRecords(maxRecords);
		if(allLocations != null && !allLocations.trim().equals(""))
			 locationList = new ArrayList<String>(Arrays.asList(allLocations.split(",")));
		obj_offer.setAllLocationsList(locationList);
		////////////System.out.println("get Request String : : : : " + gson.toJson(obj_offer));
		str_response = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_promotionsPrint"), gson.toJson(obj_offer),"GET");

		
		////////////System.out.println("Response String get_promotionsPrint response : : : :  "+str_response);
		
		bean_obj = gson.fromJson(str_response,OffersBean.class); 
		
		
		if(bean_obj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
			
			printUrl=bean_obj.getPrintURL();
			
		}
		}catch(ConnectException ce) {
			ce.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("INVALID_REQUEST");
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("UNKNOWN_HOST");
		} catch (IOException ex) {
			ex.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
		}catch(Exception e){
			e.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
		}
		return bean_obj;
	}
	public OffersBean getDescriptionPrint(String customer,String email,String offerId){
		String str_response = null,str_check="",printUrl="";
	  
		Offer obj_offer=new Offer();
		OffersBean bean_obj = null;
		
		List<String> locationList =null;
		try {
			bean_obj = new OffersBean();
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			
			obj_offer.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			obj_offer.setOfferID(offerId);
		
		
		//System.out.println("getDescriptionPrint Request String : : : : " + gson.toJson(obj_offer));
		str_response = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Description_Print"), gson.toJson(obj_offer),"GET");
		
		//System.out.println("Response String : : : :  "+str_response);
		
		bean_obj = gson.fromJson(str_response,OffersBean.class); 
		
		if(bean_obj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
			
			printUrl=bean_obj.getPrintURL();
			
		}
		}catch(ConnectException ce) {
			ce.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("INVALID_REQUEST");
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("UNKNOWN_HOST");
		} catch (IOException ex) {
			ex.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
		}catch(Exception e){
			e.printStackTrace();
			str_response = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");
		}
		return bean_obj;
	}


	
}
