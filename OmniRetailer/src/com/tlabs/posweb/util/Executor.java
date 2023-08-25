package com.tlabs.posweb.util;

import java.io.InputStream;
//import java.util.NoSuchElementException;
import java.util.Properties;

import org.apache.log4j.Logger;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
//
//import com.google.gson.Gson;
//import com.tlabs.posweb.beans.BillingCounters;
import com.tlabs.posweb.services.AdminService;

public class Executor implements Job{
	private static Logger log = Logger.getLogger(Executor.class);
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
		//System.out.println("Job Executed at "+DateTime.getDateTime());
		String result = null;
		/*try {
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			
			log.info("Request Sent::::::::::::");
			result = restfulConnectionObj.getResponse(getResponseCode("batch_service_pull_reservation"), new Gson().toJson(RequestHeaderUtil.getRequestHeader("CID8995440", "enosh.f@barbeque-nation.com")),"GET");
			log.info("Response String:::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(getResponseCode("RESPONSE_SUCCESS_CODE").trim()))
				result = getResponseCode("SKU_CREATE_SUCCESS").trim();
			else
				result = Response.getResponseMessage(result);
			
			log.info("Request Sent::::::::::::");
			result = restfulConnectionObj.getResponse(getResponseCode("batch_service_pull_vouchers"), new Gson().toJson(RequestHeaderUtil.getRequestHeader("CID8995440", "enosh.f@barbeque-nation.com")),"GET");
			log.info("Response String:::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(getResponseCode("RESPONSE_SUCCESS_CODE").trim()))
				result = getResponseCode("SKU_CREATE_SUCCESS").trim();
			else
				result = Response.getResponseMessage(result);
			
			synchronized(this){
//			    this.wait(120*1000);
			    this.wait(60*1000);
			}
			log.info("Request Sent::::::::::::");
			result = restfulConnectionObj.getResponse(getResponseCode("batch_service_push_reservation"), new Gson().toJson(RequestHeaderUtil.getRequestHeader("CID8995431", "shiva.pothuluru@technolabssoftware.com")),"GET");
			log.info("Response String:::::::::::"+result);
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = getResponseCode("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}*/
	}
}
