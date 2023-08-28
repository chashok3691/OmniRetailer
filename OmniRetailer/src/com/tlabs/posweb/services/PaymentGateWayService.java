package com.tlabs.posweb.services;

import java.util.NoSuchElementException;

import com.tlabs.posweb.init.AppProperties;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.tlabs.posweb.beans.OnlinePaymentResponse;
import com.tlabs.posweb.beans.OnlinePayments;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
import com.tlabs.posweb.util.RestfulServiceConnection;
//import com.tlabs.posweb.util.Utilities;

public class PaymentGateWayService {
	
	@Autowired
	private Gson gson;
	@Autowired
	SessionScope sessionScope;
	
	private static Logger log = Logger.getLogger(PaymentGateWayService.class);
	
	/**
	 * @author chaithanya.v
	 * 
	 *This method is used to call createNewFeatureProductGroupMaster method of web service and return the response
	 *
	 **/
	
	
	public String savePaymentGateWay(OnlinePayments onlinePayments){
		String resultStr = null;
		try {
			onlinePayments.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String::::::::::::"+gson.toJson(onlinePayments));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_payment_gateway"), gson.toJson(onlinePayments));
			// log.info("Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("PAYMENT_GROUP_CREATE_SUCCESS").trim();
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
	
	
	public String updatePaymentGateWay(OnlinePayments onlinePayments){
		String resultStr = null;
		try {
			onlinePayments.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String::::::::::::"+gson.toJson(onlinePayments));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_payment_gateway"), gson.toJson(onlinePayments));
			// log.info("Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("PAYMENT_GROUP_UPDATE_SUCCESS").trim();
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
	
	
	/*public String savePaymentGateWay(String organization,Boolean master,Boolean visa,Boolean amex,Boolean info,String merchantId,String merchantKey,String onlineBankingAggregator){
		String resultStr = null;
		try {
			OnlinePayments onlinepayments = new OnlinePayments();
			onlinepayments.setOrganizationName(organization);
			onlinepayments.setAmexCard(amex);
			onlinepayments.setMasterCard(master);
			onlinepayments.setVisaCard(visa);
			onlinepayments.setOnlineMerchantId(merchantKey);
			onlinepayments.setOnlineMerchantPwd(merchantId);
			onlinepayments.setCardPaymentEnabled(true);
			onlinepayments.setOnlineBankingEnabled(true);
			onlinepayments.setOnlineBankingAggregator(onlineBankingAggregator);
			onlinepayments.setWalletAggregationEnabled(true);
			
			onlinepayments.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			// log.info("request String:::::::::::"+gson.toJson(onlinepayments));
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getAppMessageByProperty("create_payment_gateway"), gson.toJson(onlinepayments));
			// log.info("Response String:::::::::::"+resultStr);
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
	}*/
	
	public OnlinePaymentResponse getPaymentGateWay(){
		String resultStr = null;
		OnlinePaymentResponse onlinePaymentResponse= new OnlinePaymentResponse(); 
		try {
			OnlinePayments onlinepayments = new OnlinePayments();
			onlinepayments.setMaxRecords("30");
			onlinepayments.setStartIndex("0");
			onlinepayments.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			// log.info("request String:::::::::::"+gson.toJson(onlinepayments));
			resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_payment_gateway"), gson.toJson(onlinepayments),"GET");
			// log.info("Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				onlinePaymentResponse =gson.fromJson(resultStr,OnlinePaymentResponse.class );
			}
			
		
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return onlinePaymentResponse;
	}
	
}
