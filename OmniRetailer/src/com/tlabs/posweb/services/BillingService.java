package com.tlabs.posweb.services;

//import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.NoSuchElementException;

import com.tlabs.posweb.init.AppProperties;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.tlabs.posweb.beans.BillSummaryReport;
import com.tlabs.posweb.beans.Billing;
import com.tlabs.posweb.beans.BillingBean;
import com.tlabs.posweb.beans.BillingTransactions;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.beans.WarehouseReport;
import com.tlabs.posweb.util.Constants;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
import com.tlabs.posweb.util.RestfulServiceConnection;
//import com.tlabs.posweb.util.Utilities;

public class BillingService {

	@Autowired
	private Gson gson;
	@Autowired
	SessionScope sessionScope;
	
	//private static Logger log = Logger.getLogger(BillingService.class);
		
	
	public List<Billing> getBills(Billing billDetails,String location,String status){
		/**
		 * @author Sambaiah.Y
		 * @createdon : 29-04-2015 
		 * @param customerId,location,status of order
		 * 	
		 * This method is used to get the bills information from server
		*/
		//// log.info("orderService - getBills");
		String resultStr = null;
		BillingBean beanObj = null;
		List<Billing> lst_bills = null,lst_billDetails = null;
		String checkStatus = null;
		try{
			gson = new Gson();
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			beanObj = new BillingBean();
			if(!status.equals("HD")){
				billDetails.setStatus(status);
			checkStatus =billDetails.getStatus();}
			else{
				billDetails.setDeliveryType("HD");
				billDetails.setStatus("HD");
				checkStatus =billDetails.getStatus();
			}
			if(location.isEmpty()) {
				billDetails.setStore_location("all");
			}else {
				billDetails.setStore_location(location);
			}
			
		//	billDetails.setBilledLocations(null);
			billDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
//		// log.info("Request String : : : : "+ gson.toJson(billDetails));
	      /// System.out.println("Request String  bills: : : : "+ gson.toJson(billDetails));
			
			if ((billDetails.getReportDate() != null || billDetails.getReportEndDate() != null)) {
				resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL
						("billing_Service_search_bills"), gson.toJson(billDetails), "POST");
			} else {
				if (checkStatus=="" || checkStatus==null) {
					resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL
							("billing_Service_search_bills"), gson.toJson(billDetails), "POST");
				} else {
					resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL
							("billing_Service_get_bills"), gson.toJson(billDetails), "POST");
				}
			}
			
		//resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("billing_Service_get_bills"), gson.toJson(billDetails), "POST");
		//// log.info("Response String : : : : "+ resultStr);
		//System.out.println("Bills Response String : : : : "+ resultStr);
		beanObj = gson.fromJson(resultStr,BillingBean.class); 
		
		if(beanObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
			lst_billDetails = new ArrayList<Billing>();
			lst_bills = beanObj.getBillsList();
			int slNo = Integer.parseInt(billDetails.getStartIndex());
			if(lst_bills != null)
				for(int i=0;i<lst_bills.size();i++){
					lst_bills.get(i).setSlNo(++slNo);
					lst_billDetails.add(lst_bills.get(i));
				}
			if(lst_billDetails.size() != 0)
			{
				lst_billDetails.get(0).setTotalRecords(Response.getResponseTotalRecords(resultStr));
				lst_billDetails.get(0).setGrandTotalValue(beanObj.getGrandTotalValue());
				lst_billDetails.get(0).setGrandTotalBillsValue(beanObj.getGrandTotalBillsValue());
			}
				
		}
		}
	
		catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} 
		
		catch(Exception e){
			e.printStackTrace();
			//throw new Exception(resultStr);
		}
	if(lst_bills!=null){	
		for(Billing ls_bills : lst_billDetails)
		{
			ls_bills.setStatus(ls_bills.getStatus().trim());
		}
	}
		return lst_billDetails;
	}
	
	
	
	public Billing getBillHtml(String billId,String customerId){
		/**
		 * @author Manasa.P
		 * @createdon : 29-04-2015 
		 * @param customerId,location,status of order
		*/
		//// log.info("orderService - getBills");
		String resultStr = null;
		Billing beanObj = null;
		try{
			beanObj = new Billing();
			beanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerId,customerId));
			beanObj.setBillId(billId);
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("generate_bill_html"), gson.toJson(beanObj), "GET");
//			//////////////System.out.println("getBillcontent"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				beanObj = gson.fromJson(resultStr,Billing.class);
				
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return beanObj;
	}
	
	
	public List<Billing> searchBills(Billing billDetails,String status){
		String resultStr = null;
		BillingBean beanObj = null;
		List<Billing> lst_bills = null,lst_billDetails = null;
		try{
			gson = new Gson();
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			beanObj = new BillingBean();
			if(!status.equals("HD")){
				/*if(status.equalsIgnoreCase("all")){
					status="";
				}
				billDetails.setStatus(status);*/
			}
				
			else{
				billDetails.setDeliveryType("HD");
				billDetails.setStatus("HD");
			}
			//billDetails.setBilledLocations(null);
			billDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		//// log.info("Request String : : : : "+ gson.toJson(billDetails));
		////System.out.println("Request billing_Service_search_bills String : : : : "+ gson.toJson(billDetails));
		resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("billing_Service_search_bills"), gson.toJson(billDetails), "POST");
		//// log.info("Response String : : : : "+ resultStr);
		////////////System.out.println("Response String Search Bills:::::::::: : : : : "+ resultStr);
		beanObj = gson.fromJson(resultStr,BillingBean.class); 
		////////////System.out.println("Response String Search Bills:::::::::: : : : : "+ gson.toJson(beanObj));
		if(beanObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
			lst_billDetails = new ArrayList<Billing>();
			lst_bills = beanObj.getBillsList();
			int slNo = Integer.parseInt(billDetails.getStartIndex());
				for(int i=0;i<lst_bills.size();i++){
					lst_bills.get(i).setSlNo(++slNo);
					lst_billDetails.add(lst_bills.get(i));
			}
				if(lst_billDetails.size() != 0)
				{
					lst_billDetails.get(0).setTotalRecords(Response.getResponseTotalRecords(resultStr));
					lst_billDetails.get(0).setSearchBillsFilePath(beanObj.getSearchBillsFilePath());
					lst_billDetails.get(0).setGrandTotalBillsValue(beanObj.getGrandTotalBillsValue());
					lst_billDetails.get(0).setGrandTotalValue(beanObj.getGrandTotalValue());
				}
					
					
		}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return lst_billDetails;
	}
	
	public BillSummaryReport getBillSummary(String location,String startDate,String endDate,String status,String customerIdStr,String emailIdStr,String locationList){
		String resultStr = null;
		BillSummaryReport billSummaryReportObj = new BillSummaryReport();
		try{
			gson = new Gson();
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
//			billSummaryReportObj.setStore_location(location);
			//written by manasa
			if(location.equals("all")|| location.equals("")){
			List<String> myList = new ArrayList<String>(Arrays.asList(locationList.split(",")));
			billSummaryReportObj.setBilledLocations(myList);
		}
		else
		    billSummaryReportObj.setStore_location(location);
			billSummaryReportObj.setStartDate(startDate);
			billSummaryReportObj.setEndDate(endDate);
			if(status.equals("all"))
				billSummaryReportObj.setBillStatus("");
			else
				billSummaryReportObj.setBillStatus(status);
			billSummaryReportObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String : : : : "+ gson.toJson(billSummaryReportObj));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("billing_Service_get_bill_summary"), gson.toJson(billSummaryReportObj), "GET");
			// log.info("Response String : : : : "+ resultStr);
		
			billSummaryReportObj = gson.fromJson(resultStr,BillSummaryReport.class); 
		if(billSummaryReportObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
			if(!location.equals(""))
				billSummaryReportObj.setStore_location(location);
			else
				billSummaryReportObj.setStore_location("ALL");
			billSummaryReportObj.setStartDate(startDate);
			billSummaryReportObj.setEndDate(endDate);
			billSummaryReportObj.setBillStatus(status);
		}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return billSummaryReportObj;
	}
	
	

	public String updateMCNDetails(String billId,String creditNoteRef,String maxRecords,String index)throws IOException{
		/**
		 * @author Mansa.P
		 * @param billid,status 
		 * 	
		 * This method is used to cancel the bills 
		*/
		String resultStr = null;
		WarehouseReport warehouseReport=null;
//		Billing beanObj = null;
		try{
			warehouseReport = new WarehouseReport();
//			warehouseReport.setCreditNoteRef(creditNoteRef);
//			warehouseReport.setBillRef(billId);
			warehouseReport.setBillId(billId);
			warehouseReport.setCreditNoteNo(creditNoteRef);
			warehouseReport.setMaxRecords(maxRecords);
			warehouseReport.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			warehouseReport.setStartIndex(index);
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			// log.info("Request String : : : : "+ gson.toJson(warehouseReport));
//			//////////////System.out.println("update Request String : : : : "+ gson.toJson(warehouseReport));
			resultStr = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("cancel_Credit_Note"), gson.toJson(warehouseReport));
			// log.info("Response String : : : : "+ resultStr);
//			//////////////System.out.println("Response String : : : : "+ resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("MCN_UPDATED_SUCESSFULLY").trim();
			}
			else{
//				result = "Couldn't update, please try after some time";
				resultStr = Response.getResponseMessage(resultStr);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}
	
		catch(Exception e){
			e.printStackTrace();
		}
		
		return resultStr;
	}
	 
	
	
public String getCancelBillid(Billing billDetails)throws IOException{
	/**
	 * @author Mansa.P
	 * @param billid,status 
	 * 	
	 * This method is used to cancel the bills 
	*/
	// log.info("orderService - getBills");
	String resultStr = null;
//	Billing beanObj = null;
	try{
//		beanObj = new Billing();
		billDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		
		RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
		// log.info("Request String : : : : "+ gson.toJson(billDetails));
//		//////////////System.out.println("Request String : : : : "+ gson.toJson(billDetails));
		resultStr = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("get_cancel_bill"), gson.toJson(billDetails));
		// log.info("Response String : : : : "+ resultStr);
		////////////////System.out.println("Response String : : : : "+ resultStr);
		String responseCode = Response.getResponseCode(resultStr);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			
			resultStr = AppProperties.getAppMessageByProperty("BILL_UPDATED_SUCCESSFULLY").trim();
			/*beanObj = gson.fromJson(resultStr,Billing.class);
			float voucherDiscounts = 0.0f;
			if(beanObj.getBillingTransactions() != null && beanObj.getBillingTransactions().size() > 0){
				for(BillingTransactions billingTransactionsObj : beanObj.getBillingTransactions()){
					if(billingTransactionsObj.getModeOfPayment().equalsIgnoreCase("giftvoucher") || billingTransactionsObj.getModeOfPayment().equalsIgnoreCase("coupon") || billingTransactionsObj.getModeOfPayment().equalsIgnoreCase("Loyalty Points"))
						voucherDiscounts = voucherDiscounts + Float.valueOf(billingTransactionsObj.getPaidAmount());
				}
			}
			beanObj.setVoucherDiscounts(voucherDiscounts+"");
			beanObj.setSubTotal((Float.parseFloat(beanObj.getTotalPrice()) - Float.parseFloat(beanObj.getTax())));
		*/	
		}
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	}
	catch(IOException ioe)
	{
		ioe.printStackTrace();
		return billDetails.getResponseHeader().getResponseMessage();
	}
	
	catch(Exception e){
		e.printStackTrace();
	}
	return resultStr;
}
 
	

/**
	 * @author Vijay
	 * @createdon : 15-11-2017 
	 * @param: customerId,emailid,modeofPayment	
	 * @description: This method is used to update mode-of-payment in the bills transactions
	 * @reviewedBy: 
	 * @reviewDate:
	*/
	
	public String updateBillTransaction(String CustomerId, String Emailid,String billId, String modeofPayment,String transactionlistStr,String paidAmount,String tenderCode){
	
		// log.info("BillService - updateTransactionBills");
		String resultStr = null;
		Billing billDetails=new Billing();
		Billing  billBean= new Billing ();
	
		try{
		        billDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				billDetails.setStartIndex(Constants.PAGINATION_START_INDEX);
				billDetails.setBillId(billId);
				
				billDetails	= getBillDetails(billDetails);
				
				String transactionId[]=transactionlistStr.split(",");
				String modeofPay[]=modeofPayment.split(",");
				String paidAmt[]=paidAmount.split(",");
				String tenderCodes[]=tenderCode.split(",");
				
				
				if(billDetails.getBillingTransactions() != null && billDetails.getBillingTransactions().size() > 0){
				
					for(BillingTransactions billingTransactionsObj : billDetails.getBillingTransactions())
					{
						for(int i=0; i<transactionId.length;i++)
						if(billingTransactionsObj.getTransactionId().equalsIgnoreCase(transactionId[i]))
						{
							billingTransactionsObj.setModeOfPayment(modeofPay[i]);
							if(tenderCodes != null && tenderCodes.length-1>=i){
								billingTransactionsObj.setTenderMode(tenderCodes[i]);
							}else{
								billingTransactionsObj.setTenderMode("");	
							}
							billingTransactionsObj.setDateAndTime(null);
							billingTransactionsObj.setDateTime(null);
							billingTransactionsObj.setReceivedAmountt(null);
							billingTransactionsObj.setPaidAmount(paidAmt[i]);
							billingTransactionsObj.setChangeReturns(null);
							billingTransactionsObj.setCardInfo(null);
							billingTransactionsObj.setReceivedAmount(null);
							billingTransactionsObj.setBankName(null);
							billingTransactionsObj.setApprovalCode(null);
							billingTransactionsObj.setChangeReturn(null);
						}
						
					}
				}
				
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			billBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			billBean.setBillId(billDetails.getBillId());
			billBean.setBillingTransactions(billDetails.getBillingTransactions());
			//////////System.out.println("Request String : : : : "+ gson.toJson(billBean));
			resultStr = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("billing_Service_update_transaction_details"), gson.toJson(billBean));
			// log.info("Response String : : : : "+ resultStr);
			//////////System.out.println("Responce ....."+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				
				resultStr = AppProperties.getAppMessageByProperty("BILL_UPDATED_SUCCESSFULLY").trim();
			}
			else
			{
			 billDetails = gson.fromJson(resultStr,Billing.class);
			 throw new Exception(billDetails.getResponseHeader().getResponseMessage());	
				
			}
			return resultStr;
			
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			return billDetails.getResponseHeader().getResponseMessage();
		} catch(Exception e){
			/*return billDetails.getResponseHeader().getResponseMessage();*/
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			return resultStr;
		}
		
	}
	
	public Billing getBillDetails(Billing billDetails){
		/**
		 * @author Sambaiah.Y
		 * @createdon : 29-04-2015 
		 * @param customerId,location,status of order
		 * 	
		 * This method is used to get the bills information from server
		*/
		// log.info("orderService - getBills");
		String resultStr = null;
		Billing beanObj = null;
		try{
			beanObj = new Billing();
			billDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			billDetails.setPrintResponseRequired(true);
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			// log.info("Request String : : : : "+ gson.toJson(billDetails));
////////////////System.out.println("Request. String : : : : "+ gson.toJson(billDetails));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("billing_Service_get_billing_details"), gson.toJson(billDetails), "GET");
//			resultStr = obj_billsProxy.getBillsDetails(gson.toJson(billDetails));
		 	// log.info("Response String : : : : "+ resultStr);
////////////        System.out.println("Response. billing_Service_get_billing_details : : : : "+ resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			String responseMsg = Response.getResponseMessage(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				beanObj = gson.fromJson(resultStr,Billing.class);
				float voucherDiscounts = 0.0f;
				if(beanObj.getBillingTransactions() != null && beanObj.getBillingTransactions().size() > 0){
					for(BillingTransactions billingTransactionsObj : beanObj.getBillingTransactions()){
						if(billingTransactionsObj.getModeOfPayment().equalsIgnoreCase("giftvoucher") || billingTransactionsObj.getModeOfPayment().equalsIgnoreCase("coupon") || billingTransactionsObj.getModeOfPayment().equalsIgnoreCase("Loyalty Points"))
							voucherDiscounts = voucherDiscounts + Float.valueOf(billingTransactionsObj.getPaidAmount());
					}
				}
				beanObj.setVoucherDiscounts(voucherDiscounts+"");
				//beanObj.setSubTotal((Float.parseFloat(beanObj.getTotalPrice()) - Float.parseFloat(beanObj.getTax())));
				
			}
			else{
                beanObj = gson.fromJson(resultStr,Billing.class);
                beanObj.getResponseHeader().setResponseCode(responseCode);
                beanObj.getResponseHeader().setResponseMessage(responseMsg);
                
        }
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return beanObj;
	}
	 
	
	
	public Billing getApplyCampaignDetails(Billing billDetails){
		/**
		 * @author Manasa.P
		 * @createdon : 29-04-2015 
		 * @param customerId,location,status of order
		*/
		// log.info("orderService - getBills");
		String resultStr = null;
		Billing beanObj = null;
		try{
			beanObj = new Billing();
			billDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			billDetails.setPrintResponseRequired(true);
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			// log.info("Request String : : : : "+ gson.toJson(billDetails));
			////////////////System.out.println("Request String : : : : "+ gson.toJson(billDetails));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("apply_Campaigns"), gson.toJson(billDetails), "GET");
//			resultStr = obj_billsProxy.getBillsDetails(gson.toJson(billDetails));
			// log.info("Response String : : : : "+ resultStr);
			////////////////System.out.println("Response String : : : : "+ resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				beanObj = gson.fromJson(resultStr,Billing.class);
				
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return beanObj;
	}
	
	
	
	
public String createBillTransaction(String CustomerId, String Emailid,Billing billBean){
		
		// log.info("BillService - updateTransactionBills");
		String resultStr = null;
		Billing billDetails=new Billing();
	
		try{
		    
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			billBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			//System.out.println("Request String : : : : "+ gson.toJson(billBean));
			resultStr = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("createBill_transaction_details"), gson.toJson(billBean));
			// log.info("Response String : : : : "+ resultStr);
			//System.out.println("Responce ....."+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				
				resultStr = AppProperties.getAppMessageByProperty("BILL_UPDATED_SUCCESSFULLY").trim();
			}
			else
			{
			 billDetails = gson.fromJson(resultStr,Billing.class);
			 throw new Exception(billDetails.getResponseHeader().getResponseMessage());	
				
			}
			return resultStr;
			
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			return billDetails.getResponseHeader().getResponseMessage();
		} catch(Exception e){
			return billDetails.getResponseHeader().getResponseMessage();
		}
		
	}
	
	
	
	
}
