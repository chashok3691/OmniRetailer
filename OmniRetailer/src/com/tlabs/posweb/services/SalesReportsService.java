package com.tlabs.posweb.services;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.technolabssoftware.www.SalesReportsProxy;
import com.technolabssoftware.www.StoreServiceProxy;
import com.tlabs.posweb.beans.BillingCounters;
import com.tlabs.posweb.beans.ReportsBean;
import com.tlabs.posweb.beans.SalesReportsByCounter;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.init.AppProperties;
import com.tlabs.posweb.util.Constants;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.RestfulServiceConnection;

public class SalesReportsService {


	@Autowired
	private Gson gson;
	@Autowired
	SessionScope sessionScope;
	private static Logger log = Logger.getLogger(SalesReportsService.class);

	public List<String> getCounters(String location,String customerId,String email,String startIndex){
		//// log.info("SalesReportsService - getCounters");
		List<String> counters = null;
		BillingCounters billingCounters = null;
		String str_response = null;
		try{
			billingCounters = new BillingCounters();
			counters = new ArrayList<String>();
			billingCounters.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			billingCounters.setStartIndex(startIndex);
			
			/*// log.info("Request  ::: "+ gson.toJson(billingCounters));
			StoreServiceProxy proxy = new StoreServiceProxy();
			str_response = proxy.getBillingCounters(gson.toJson(billingCounters));
			// log.info("Response ::: "+ str_response);*/
			
			/** added by vasudev*/
			str_response = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("get_Billing_counters"), gson.toJson(billingCounters), "GET");

			
			billingCounters = gson.fromJson(str_response,BillingCounters.class); 
			if(billingCounters.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				counters = billingCounters.getCounters();
			}
			// log.info("CounterDetails : "+ gson.toJson(counters));
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return counters;
	}
	public List<?> getSaleReportsByCounter(SalesReportsByCounter counterdetails){
		// log.info("SalesReportsService - getSaleReportsByCounter");
		List<?> reports = null;
		ReportsBean obj_reports = null;
		String response = null;
		try{
			SalesReportsProxy proxy = new SalesReportsProxy();
			obj_reports = new ReportsBean();
			// log.info("Request ::: "+ gson.toJson(counterdetails));
			response = proxy.getSalesReportsCounter(gson.toJson(counterdetails));
			// log.info("Response :::"+ response);
			obj_reports = gson.fromJson(response,ReportsBean.class); 
			if(obj_reports.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				reports = obj_reports.getReportsList();
			}
			// log.info("CounterDetails : "+ gson.toJson(reports));
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return reports;
	}
}
