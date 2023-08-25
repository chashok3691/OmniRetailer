package com.tlabs.posweb.services;

import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;

import com.tlabs.posweb.init.AppProperties;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.tlabs.posweb.beans.Banner;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
import com.tlabs.posweb.util.RestfulServiceConnection;
//import com.tlabs.posweb.util.Utilities;

public class BannerService {
	
	@Autowired
	private Gson gson;
	
	@Autowired
	SessionScope sessionScope;
	
	//private static Logger log = Logger.getLogger(BannerService.class);
	
	public List<Banner> getBanner(String bannerId,String customerIdStr,String emailIdStr,String index,boolean search,boolean imageRequired,String type){
		List<Banner> bannerList = null;
		String resultStr = null;
		try{
			Banner bannerObj = new Banner();
			
			bannerObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			if(search)
				bannerObj.setSearchCriteria(bannerId);
			else
				bannerObj.setBannerId(bannerId);
			bannerObj.setImageRequired(imageRequired);
			bannerObj.setStartIndex(index);
			// log.info("Request::"+gson.toJson(bannerObj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			if(type.equals("banner"))
				resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("get_banner"), gson.toJson(bannerObj));
			if(type.equals("miniBanner"))
				resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_mini_banner"), gson.toJson(bannerObj),"GET");
			//System.out.println("Response::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				bannerObj = gson.fromJson(resultStr, Banner.class);
				if(imageRequired){
					bannerObj = bannerObj.getBannerObj();
					if(bannerObj != null){
						String effectiveFromStr = bannerObj.getEffectiveFromStr();
						int indexOf;
						if(effectiveFromStr != null){
							indexOf = effectiveFromStr.indexOf(" ");
							effectiveFromStr = effectiveFromStr.substring(0, indexOf);;
							bannerObj.setEffectiveFromStr(effectiveFromStr);
						}
						String endDateStr = bannerObj.getEndDateStr();
						if(endDateStr != null){
							indexOf = endDateStr.indexOf(" ");
							endDateStr = endDateStr.substring(0, indexOf);;
							bannerObj.setEndDateStr(endDateStr);
						}
						bannerList = new ArrayList<Banner>();
						bannerList.add(bannerObj);
					}
				}else{
					if(bannerObj.getBannerList() != null && bannerObj.getBannerList().size() > 0){
						bannerList = bannerObj.getBannerList();
						bannerList.get(0).setTotalRecords(bannerObj.getTotalRecords());
						int slNo = Integer.parseInt(index);
						for(Banner banner : bannerList){
							String effectiveFromStr = banner.getEffectiveFromStr();
							int indexOf;
							if(effectiveFromStr != null){
								indexOf = effectiveFromStr.indexOf(" ");
								effectiveFromStr = effectiveFromStr.substring(0, indexOf);;
								banner.setEffectiveFromStr(effectiveFromStr);
							}
							String endDateStr = banner.getEndDateStr();
							
							if(endDateStr != null){
								indexOf = endDateStr.indexOf(" ");
								endDateStr = endDateStr.substring(0, indexOf);
								banner.setEndDateStr(endDateStr);
							}
							banner.setSlNo(++slNo);
						}
					}
				}
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return bannerList;
	}
	
	public String createBanner(Banner bannerObj,String customerIdStr,String emailIdStr){
		String resultStr = null;
		try {
			bannerObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//// log.info("Request:::"+gson.toJson(bannerObj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			
			////////System.out.println(gson.toJson(bannerObj));
			if(bannerObj.getType().equals("banner"))
				resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_banner"), gson.toJson(bannerObj));
			if(bannerObj.getType().equals("miniBanner"))
				resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_mini_banner"), gson.toJson(bannerObj));
			//// log.info("Result:::"+resultStr);
			////////System.out.println(resultStr);
			 String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					if(bannerObj.getType().equals("banner"))
						resultStr = AppProperties.getAppMessageByProperty("BANNER_CREATE_SUCCESS").trim();
					if(bannerObj.getType().equals("miniBanner"))
						resultStr = AppProperties.getAppMessageByProperty("MINI_BANNER_CREATE_SUCCESS").trim();
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
	
	public String updateBanner(Banner bannerObj,String customerIdStr,String emailIdStr){
		String resultStr = null;
		try {
			bannerObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request:::"+gson.toJson(bannerObj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			if(bannerObj.getType().equals("banner"))
				resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_banner"), gson.toJson(bannerObj));
			if(bannerObj.getType().equals("miniBanner"))
				resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_mini_banner"), gson.toJson(bannerObj));
			// log.info("Result:::"+resultStr);
			//System.out.println("resss::"+resultStr);
			 String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					if(bannerObj.getType().equals("banner"))
						resultStr = AppProperties.getAppMessageByProperty("BANNER_UPDATE_SUCCESS").trim();
					if(bannerObj.getType().equals("miniBanner"))
						resultStr = AppProperties.getAppMessageByProperty("MINI_BANNER_UPDATE_SUCCESS").trim();
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
	
	public String deleteBanner(String customerId,String emailId,String ids,String type) {
		String resultStr = null;
		try {
			Banner bannerObj = new Banner();
			bannerObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			String[] idsArray = ids.split(",");
			bannerObj.setBannerIds(idsArray);
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			if(type.equals("banner"))
				resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("delete_banner"), gson.toJson(bannerObj));
			if(type.equals("miniBanner"))
				resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("delete_mini_banner"), gson.toJson(bannerObj));
			// log.info(resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				if(type.equals("banner"))
					resultStr = AppProperties.getAppMessageByProperty("BANNER_DELETE_SUCCESS").trim();
				if(type.equals("miniBanner"))
					resultStr = AppProperties.getAppMessageByProperty("MINI_BANNER_DELETE_SUCCESS").trim();
			}
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
