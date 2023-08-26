package com.tlabs.posweb.util;

import java.io.InputStream;
import java.util.NoSuchElementException;
import java.util.Properties;

import org.apache.log4j.Logger;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.google.gson.Gson;
import com.tlabs.posweb.beans.BillingCounters;
import com.tlabs.posweb.services.AdminService;

public class EventsLoader implements Job{
	private static Logger log = Logger.getLogger(EventsLoader.class);
	public static String getResponseCode(String constantName) {
		Properties properties = null;
		String constant = null;
		InputStream inputStream = null;
		try {
			properties = new Properties();
			inputStream = AdminService.class.getClassLoader().getResourceAsStream("commonResources.properties");
			properties.load(inputStream);
			constant = (String) properties.get(constantName);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try{
				properties.clear();
				inputStream.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return constant.trim();
	}
	
	public void execute(JobExecutionContext context) throws JobExecutionException {
		String result = null;
		try {
			BillingCounters billingCountersObj = new BillingCounters();
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			billingCountersObj.setRequestHeader(RequestHeaderUtil.getRequestHeader("CID8995431", "mythri.sabath@technolabssoftware.com"));
			
			log.info("Request String::::::::::::"+new Gson().toJson(billingCountersObj));
			result = restfulConnectionObj.getResponse(getResponseCode("batch_service_pull_reservation"), new Gson().toJson(billingCountersObj),"GET");
			log.info("Response String:::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(getResponseCode("RESPONSE_SUCCESS_CODE").trim()))
				result = getResponseCode("SKU_CREATE_SUCCESS").trim();
			else
				result = Response.getResponseMessage(result);
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = getResponseCode("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
	
}
