package com.tlabs.posweb.services;
import java.net.ConnectException;
import java.net.UnknownHostException;
import java.rmi.RemoteException;
import java.util.ArrayList;
//import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.NoSuchElementException;

import com.tlabs.posweb.init.AppProperties;
import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.technolabssoftware.www.ExportImportsProxy;
import com.technolabssoftware.www.FileUploader;
//import com.technolabssoftware.www.PurchaseOrderProxy;
import com.tlabs.posweb.beans.GoodsReceiptsItems;
import com.tlabs.posweb.beans.LocationBean;
import com.tlabs.posweb.beans.ProcurementReceipt;
import com.tlabs.posweb.beans.PurchaseOrder;
import com.tlabs.posweb.beans.PurchaseOrderBean;
import com.tlabs.posweb.beans.PurchaseOrderItems;
import com.tlabs.posweb.beans.PurchaseOrderShipmentLocation;
import com.tlabs.posweb.beans.PurchaseShipmentNote;
import com.tlabs.posweb.beans.PurchaseStockReturn;
import com.tlabs.posweb.beans.Quotation;
import com.tlabs.posweb.beans.QuoteItems;
import com.tlabs.posweb.beans.QuoteRequestResponse;
import com.tlabs.posweb.beans.QuoteShipmentLocation;
import com.tlabs.posweb.beans.RequestBean;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.beans.Sku;
import com.tlabs.posweb.beans.SkuPriceList;
import com.tlabs.posweb.beans.StockRequestSummaryResponse;
import com.tlabs.posweb.beans.StoreShipmentReturn;
import com.tlabs.posweb.beans.SupplierProducts;
import com.tlabs.posweb.beans.SupplierQuotationResponse;
import com.tlabs.posweb.beans.SupplierQuotations;
import com.tlabs.posweb.beans.SupplierQuoteItems;
import com.tlabs.posweb.beans.SupplierShipmentLocation;
import com.tlabs.posweb.beans.WHInvoice;
import com.tlabs.posweb.beans.WareHouseSku;
import com.tlabs.posweb.beans.WarehouseSkuPriceList;
import com.tlabs.posweb.util.Constants;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
import com.tlabs.posweb.util.RestfulServiceConnection;
//import com.tlabs.posweb.util.Utilities;
public class ProcurementService {
	@Autowired
	private Gson gson;
	@Autowired
	SessionScope sessionScope;
	@Autowired
	private GenericMasterService genericMasterServiceObj;
	private static Logger log = Logger.getLogger(ProcurementService.class);
	/**
		 * 
		 * @author Mythri.S
		 * 
		 *This method is used to call createNewProcurement method of web service and return the response
		 *
		 **/
	public ProcurementReceipt createShipmentReceipt(Locale currentLocale,String formData,String totalQty,String totalCost,String itemDetails,String customerId, String emailId,String flowUnder){
		String result = null;
		ProcurementReceipt procurementReceiptObj = new ProcurementReceipt();
		RestfulServiceConnection restfulServiceConnection = null;
		try {
			restfulServiceConnection = new RestfulServiceConnection();
			
			////////////System.out.println(formData);
			
			
			procurementReceiptObj = gson.fromJson(formData, ProcurementReceipt.class);
		/*	procurementReceiptObj.setReceipt_total_qty(totalQty);
			procurementReceiptObj.setGrand_total(Float.parseFloat(totalCost));
			procurementReceiptObj.setSub_total(Float.parseFloat(totalCost));*/
			ArrayList<GoodsReceiptsItems> itemDetailsList = new ArrayList<GoodsReceiptsItems>();
			itemDetails = Response.getResponseList(itemDetails, "itemDetails");
			GoodsReceiptsItems goodsReceiptsItems = null;
			JSONArray jsonArray = new JSONArray(itemDetails);
			
			for (int i=0; i<jsonArray.length(); i++) {
				// log.info(jsonArray.getString(i));
				goodsReceiptsItems = gson.fromJson(jsonArray.getString(i), GoodsReceiptsItems.class);
				itemDetailsList.add(goodsReceiptsItems);
			}
			
			
			procurementReceiptObj.setItemDetails(itemDetailsList);
			procurementReceiptObj.setItemsList(itemDetailsList);
			procurementReceiptObj.setItems(itemDetailsList);
			if(procurementReceiptObj.getReceipt_ref_num() != "" && procurementReceiptObj.getReceipt_ref_num() != null)
				procurementReceiptObj.setGoods_receipt_ref_num(procurementReceiptObj.getReceipt_ref_num());
			procurementReceiptObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			if(!procurementReceiptObj.getInvoiceRefNumber().contains(procurementReceiptObj.getSupplierId())) {
			procurementReceiptObj.setInvoiceRefNumber(procurementReceiptObj.getSupplierId()+"/"+procurementReceiptObj.getInvoiceRefNumber());
			}
	////		System.out.println("shipment procurment create Request String::::::::::::"+gson.toJson(procurementReceiptObj));
			if(flowUnder.equals("warehouse"))
				result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_goodsreceipt_note"), gson.toJson(procurementReceiptObj));
			else
			result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_outlet_goodsreceipt_note"), gson.toJson(procurementReceiptObj));
			//////////////////////System.out.println("Response String:::::::::::"+result);
			//////////////////////System.out.println("Response String:::::::::::"+procurementReceiptObj);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			//	ResourceBundle languageBundle = ResourceBundle.getBundle("properties.bundle", currentLocale);
			//	// log.info(languageBundle.getString("user.not"));
				if(procurementReceiptObj.getReceipt_ref_num() == null || procurementReceiptObj.getReceipt_ref_num() == ""){
					result = AppProperties.getAppMessageByProperty("PROCUREMENT_CREATE_SUCCESS").trim();
					procurementReceiptObj.setOperation("created");
				}
				else{
					procurementReceiptObj.setOperation("updated");
					result = AppProperties.getAppMessageByProperty("PROCUREMENT_UPDATE_SUCCESS").trim();
				}
			}
			else{
				result = Response.getResponseMessage(result);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}  catch(Exception e){
			e.printStackTrace();
		}
		procurementReceiptObj.setResult(result);
		return procurementReceiptObj;
	}



		
		/**
		 * 
		 * @author Mythri.S
		 * 
		 *This method is used to call createNewProcurement method of web service and return the response
		 * @param qtyFlag 
		 *
		 **/
	public ProcurementReceipt updateShipmentReceipt(Locale currentLocale,String formData,String totalQty,String totalCost,String itemDetails,String customerId, String emailId,String flowUnder, boolean qtyFlag){
		String result = null;
		ProcurementReceipt procurementReceiptObj = new ProcurementReceipt();
		RestfulServiceConnection restfulServiceConnection = null;
		try {
			restfulServiceConnection = new RestfulServiceConnection();
			
		////////System.out.println(formData);
			
			procurementReceiptObj = gson.fromJson(formData, ProcurementReceipt.class);
			if(procurementReceiptObj.getDeleteditems().length()>0){
				String[] idsArray = procurementReceiptObj.getDeleteditems().split(",");
				List<Integer> counterIds = new ArrayList<Integer>();
				for(int i=0;i<idsArray.length;i++){
					if(idsArray[i].contains("undefined")){
					
					}else{
						counterIds.add(Integer.parseInt(idsArray[i]));	
					}
					
				}
				procurementReceiptObj.setItemDeletionList(counterIds);
			}
		
			procurementReceiptObj.setReceipt_total_qty(totalQty);
			ArrayList<GoodsReceiptsItems> itemDetailsList = new ArrayList<GoodsReceiptsItems>();
			itemDetails = Response.getResponseList(itemDetails, "itemDetails");
			GoodsReceiptsItems goodsReceiptsItems = null;
			/*String test="{\"pluCode\":\"00048901\",\"item_code\":\"\",\"cost\":\"15.0\",\"supplied\":\"\",\"price\":\"15.0\",\"reject\":\"\",\"received\":\"15.0\",\"item_description\":\"LAYS BAKED TOMATO 31G\",\"make\":\"\",\"pack\":\"1.0\",\"skuId\":\"00048901\"}";
			gson.fromJson(test, GoodsReceiptsItems.class);*/
			JSONArray jsonArray = new JSONArray(itemDetails);
	///		System.out.println(jsonArray);
			for (int i=0; i<jsonArray.length(); i++) {
				goodsReceiptsItems = gson.fromJson(jsonArray.getString(i), GoodsReceiptsItems.class);
				itemDetailsList.add(goodsReceiptsItems);
			}
			procurementReceiptObj.setItemDetails(itemDetailsList);
			procurementReceiptObj.setQtyFlag(qtyFlag);
			procurementReceiptObj.setItemsList(itemDetailsList);
			procurementReceiptObj.setItems(itemDetailsList);
			if(procurementReceiptObj.getReceipt_ref_num() != "" && procurementReceiptObj.getReceipt_ref_num() != null)
				procurementReceiptObj.setGoods_receipt_ref_num(procurementReceiptObj.getReceipt_ref_num());
			procurementReceiptObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			////////System.out.println("Request String::::::::::::"+gson.toJson(procurementReceiptObj));
			
			if(!procurementReceiptObj.getInvoiceRefNumber().contains(procurementReceiptObj.getSupplierId())) {
			procurementReceiptObj.setInvoiceRefNumber(procurementReceiptObj.getSupplierId()+"/"+procurementReceiptObj.getInvoiceRefNumber());
			}
			
           // System.out.println("Request String::::::::::::"+gson.toJson(procurementReceiptObj));
			if(flowUnder.equals("warehouse"))
				result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_goodsreceipt_note"), gson.toJson(procurementReceiptObj));
			else
			result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_Outlet_GoodsReceipt_Note"), gson.toJson(procurementReceiptObj));
		  //   //////System.out.println("Response String:::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			//	ResourceBundle languageBundle = ResourceBundle.getBundle("properties.bundle", currentLocale);
			//	// log.info(languageBundle.getString("user.not"));
				if(procurementReceiptObj.getReceipt_ref_num() == null || procurementReceiptObj.getReceipt_ref_num() == ""){
					result = AppProperties.getAppMessageByProperty("PROCUREMENT_CREATE_SUCCESS").trim();
					procurementReceiptObj.setOperation("created");
				}
				else{
					procurementReceiptObj.setOperation("updated");
					result = AppProperties.getAppMessageByProperty("PROCUREMENT_UPDATE_SUCCESS").trim();
				}
			}
			else{
				result = Response.getResponseMessage(result);
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}  catch(Exception e){
			e.printStackTrace();
		}
		procurementReceiptObj.setResult(result);
		return procurementReceiptObj;
	}
		
		/**
		 * 
		 * @author Chaithanya
		 * 
		 *This method is used to call Update GoodsReceipt Note method of web service and return the response
		 *
		 **/
		public ProcurementReceipt updateShipmentReceiptGrid(ProcurementReceipt procurementReceiptObj){
			String result = null;
			RestfulServiceConnection restfulServiceConnection = null;
			try {
				restfulServiceConnection = new RestfulServiceConnection();
				procurementReceiptObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_goodsreceipt_note"), gson.toJson(procurementReceiptObj));
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				//	ResourceBundle languageBundle = ResourceBundle.getBundle("properties.bundle", currentLocale);
				//	// log.info(languageBundle.getString("user.not"));
					if(procurementReceiptObj.getReceipt_ref_num() == null || procurementReceiptObj.getReceipt_ref_num() == ""){
						result = AppProperties.getAppMessageByProperty("PROCUREMENT_CREATE_SUCCESS").trim();
						procurementReceiptObj.setOperation("created");
					}
					else{
						procurementReceiptObj.setOperation("updated");
						result = AppProperties.getAppMessageByProperty("PROCUREMENT_UPDATE_SUCCESS").trim();
					}
				}
				else{
					result = Response.getResponseMessage(result);
				}
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			}  catch(Exception e){
				e.printStackTrace();
			}
			procurementReceiptObj.setResult(result);
			return procurementReceiptObj;
		}
		
		/**
		 * @author Mythri.S	
		 * 
		 * This method is used to call the getStockProcurementReceipts method of web service and return the Procurement Receipt List
		 * 
		 */
		
		
		public ProcurementReceipt getShipmentReceipts(String operationStr,String customerIdStr,String emailIdStr,String locationStr,String indexStr,String maxRecords,String searchNameStr,String startDateStr,String endDateStr,boolean search,String flowUnder,String skuid,String supplier,boolean saveFlag,String category){
			String result = null;
			ProcurementReceipt procurementReceiptObj = new ProcurementReceipt();
			RestfulServiceConnection restfulServiceConnection = null;
			try {
				restfulServiceConnection = new RestfulServiceConnection();
				procurementReceiptObj.setStart(indexStr);
				procurementReceiptObj.setSkuId(skuid);
				procurementReceiptObj.setSupplier_Id(supplier);
				procurementReceiptObj.setSupplierId(supplier);
				procurementReceiptObj.setStartIndex(indexStr);
				procurementReceiptObj.setItemsRequired(true);
				procurementReceiptObj.setStartDate(startDateStr);
				procurementReceiptObj.setEndDate(endDateStr);
				procurementReceiptObj.setSaveGRNFlag(saveFlag);
				procurementReceiptObj.setCategory(category);
				if(!operationStr.equals("all"))
					procurementReceiptObj.setStatus(operationStr);
				procurementReceiptObj.setLocation(locationStr);
				
				
				/*if(storeLocation.equals("all")||storeLocation.equals("")){
			 	List<String> myList = new ArrayList<String>(Arrays.asList(locationsListValue.split(",")));
				procurementReceiptObj.setLocationList(locationList);
			}
			else
				procurementReceiptObj.setLocation(storeLocation);*/
				
				procurementReceiptObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				procurementReceiptObj.setMaxRecords(maxRecords);
				if(search){
					procurementReceiptObj.setStartDate(startDateStr);
					procurementReceiptObj.setEndDate(endDateStr);
					procurementReceiptObj.setSearchCriteria(searchNameStr);
				}
				
				////////////////////////System.out.println("Request String:::::::::::"+gson.toJson(procurementReceiptObj));
				if(flowUnder.equals("procurement")){
					procurementReceiptObj.setOutletAll(true);
					result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Outlet_GoodsReceipt_Notes"), gson.toJson(procurementReceiptObj), "GET");
				}
				else if(flowUnder.equals("warehouse")){
					procurementReceiptObj.setWarehouseAll(true);
					result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_goodsreceipt_note"), gson.toJson(procurementReceiptObj), "GET");
				}
					
				
	/////		   System.out.println("Response  get_goodsreceipt_note String:::::::::::"+result);
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					procurementReceiptObj = gson.fromJson(result, ProcurementReceipt.class);
						procurementReceiptObj.setReceiptDetails(procurementReceiptObj.getGrnList());	
	/////					  System.out.println("Response  get_goodsreceipt_note String:::::::::::"+gson.toJson(procurementReceiptObj.getGrnList()));
					if(procurementReceiptObj.getReceiptDetails() != null && procurementReceiptObj.getReceiptDetails().size() > 0)
						procurementReceiptObj.getReceiptDetails().get(0).setTotalRecords(procurementReceiptObj.getTotalRecords());
					int slNo = Integer.parseInt(indexStr);
					for(int i=0;i<procurementReceiptObj.getReceiptDetails().size();i++){
						procurementReceiptObj.getReceiptDetails().get(i).setSlNo(++slNo);
						if(procurementReceiptObj.getReceiptDetails().get(i).getDate() != null)
							procurementReceiptObj.getReceiptDetails().get(i).setDate(procurementReceiptObj.getReceiptDetails().get(i).getDate().substring(0, 10));
					}
				}
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return procurementReceiptObj;
		}
		
		
		/**
		 * @author Mythri.S	
		 * 
		 * This method is used to call the getStockProcurementReceipt method of web service and return the Procurement Receipt of the given Receipt Reference No
		 * 
		 */
		public ProcurementReceipt getShipmentReceipt(String receiptRefNo,String customerId,String emailId,String flowUnder){
			String result = null;
			ProcurementReceipt procurementReceiptObj = new ProcurementReceipt();
			RestfulServiceConnection restfulServiceConnection = null;
//			List<ProcurementReceipt> procurementReceipts=new ArrayList<ProcurementReceipt>();
			try {
				restfulServiceConnection = new RestfulServiceConnection();
				procurementReceiptObj.setReceiptId(receiptRefNo);
				procurementReceiptObj.setReceiptNoteId(receiptRefNo);
				procurementReceiptObj.setStartIndex("0");
				procurementReceiptObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				if(receiptRefNo != null && !receiptRefNo.equals("") && !receiptRefNo.equalsIgnoreCase("ALL"))
				{
					procurementReceiptObj.setItemsRequired(true);
				}
				
				// log.info("Request String:::::::::"+gson.toJson(procurementReceiptObj));
				////////////////System.out.println("Request String:::::::::"+gson.toJson(procurementReceiptObj));
				if(flowUnder.equals("warehouse"))
				
					{
					result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_goodsreceipt_note"), gson.toJson(procurementReceiptObj), "GET");
			}
				else
				{
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Outlet_GoodsReceipt_Notes"), gson.toJson(procurementReceiptObj), "GET");
				}
				// log.info("Response String:::::::::"+result);
	///		System.out.println("Response get_Outlet_GoodsReceipt_NotesString:::::::::"+result);
				procurementReceiptObj = gson.fromJson(result, ProcurementReceipt.class);
			if(procurementReceiptObj.getGrnObj().getDueDateStr()!=null)
				if(procurementReceiptObj.getGrnObj().getDueDateStr()!=null && procurementReceiptObj.getGrnObj().getDueDateStr().trim()!="")
					procurementReceiptObj.getGrnObj().setDueDateStr(procurementReceiptObj.getGrnObj().getDueDateStr().substring(0, 10));
			if(procurementReceiptObj.getGrnObj().getDeliveredOnStr()!=null && procurementReceiptObj.getGrnObj().getDeliveredOnStr().trim()!="")
				procurementReceiptObj.getGrnObj().setDeliveredOnStr(procurementReceiptObj.getGrnObj().getDeliveredOnStr().substring(0, 10));
		
			if(procurementReceiptObj.getGrnObj().getCgstAmt()==null)
				procurementReceiptObj.getGrnObj().setCgstAmt(0.0f);	
			if(procurementReceiptObj.getGrnObj().getSgstAmt()==null)
				procurementReceiptObj.getGrnObj().setSgstAmt(0.0f);	
			if(procurementReceiptObj.getGrnObj().getOtherTaxAmt()==null)
				procurementReceiptObj.getGrnObj().setOtherTaxAmt(0.0f);	
			
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			}  catch(Exception e){
				e.printStackTrace();
			}
			return procurementReceiptObj;
		}
		
		
		/**
		 * @author Mythri.S	
		 * 
		 * This method is used to call the getPurchaseOrders method of web service and return the Purchase Order List      
		 * 
		 */
		public List<PurchaseOrder> getPurchaseOrders(String operation,String customerId,String emailId,String storeLocation,String index,String maxRecords,String searchNameStr,String startDateStr,String endDateStr,boolean search,String itemwise,String vendor,String zone,String category){
			String result = null;
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			PurchaseOrder purchaseOrderBeanObj = new PurchaseOrder();
			try {
				purchaseOrderBeanObj.setStartIndex(index);
				purchaseOrderBeanObj.setItemsFlag(true);
				purchaseOrderBeanObj.setWarehouse_location(storeLocation);
				purchaseOrderBeanObj.setZoneId(zone);
				//purchaseOrderBeanObj.setCategoryName(category);
				purchaseOrderBeanObj.setCategory(category);
				
				/*if(storeLocation.equals("all")||storeLocation.equals("")){
				 	List<String> myList = new ArrayList<String>(Arrays.asList(locationsListValue.split(",")));
					purchaseOrderBeanObj.setLocationList(locationList);
				}
				else
					purchaseOrderBeanObj.setWarehouse_location(storeLocation);*/
				
				
				/*if(operation.equals("warehouse"))
					purchaseOrderBeanObj.setStatus("");
				else
					purchaseOrderBeanObj.setStatus(operation);*/
				purchaseOrderBeanObj.setMaxRecords(maxRecords);
				purchaseOrderBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				if(search){
					purchaseOrderBeanObj.setStartDateStr(startDateStr);
					purchaseOrderBeanObj.setEndDateStr(endDateStr);
					purchaseOrderBeanObj.setSearchCriteria(searchNameStr);
					purchaseOrderBeanObj.setOrderStartDate(startDateStr);
					purchaseOrderBeanObj.setOrderEndDate(endDateStr);
					purchaseOrderBeanObj.setItem_name(itemwise);
					purchaseOrderBeanObj.setSkuId(itemwise);
					purchaseOrderBeanObj.setSupplier_Id(vendor);
				}
				// log.info("Request String:::::::::::"+gson.toJson(purchaseOrderBeanObj));
				/*result = purchaseOrderProxyObj.getPurchaseOrders(gson.toJson(purchaseOrderBeanObj));*/
			//	//////////////System.out.println("Request String  po___________:::::::::::"+gson.toJson(purchaseOrderBeanObj));
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_purchase_orders"), gson.toJson(purchaseOrderBeanObj), "GET");
				// log.info("Response String:::::::::::"+result);
			//	//////////System.out.println("Response String:::::::::::po___________"+result);
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					purchaseOrderBeanObj = gson.fromJson(result, PurchaseOrder.class);
					if(purchaseOrderBeanObj.getOrdersList() != null && purchaseOrderBeanObj.getOrdersList().size() > 0){
						purchaseOrderBeanObj.getOrdersList().get(0).setTotalRecords(purchaseOrderBeanObj.getTotalOrders());
						purchaseOrderBeanObj.getOrdersList().get(0).setTotalIndentQty(purchaseOrderBeanObj.getTotalIndentQty());
						purchaseOrderBeanObj.getOrdersList().get(0).setTotalPoQty(purchaseOrderBeanObj.getTotalPoQty());
						purchaseOrderBeanObj.getOrdersList().get(0).setTotalPOValue(purchaseOrderBeanObj.getTotalPOValue());
						int slNo = Integer.parseInt(index);
						for(PurchaseOrder purchaseOrder : purchaseOrderBeanObj.getOrdersList())
							purchaseOrder.setSlNo(++slNo);
					}
				}
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return purchaseOrderBeanObj.getOrdersList();
		}


		/**
		 * @author Mythri.S	
		 * 
		 * This method is used to call the getPurchaseOrders method of web service and return the Purchase Order List
		 * 
		 */
		/*public List<PurchaseOrder> getPOReferences(String operation,String customerId,String emailId,String storeLocation,String index){
			String result = null;
//			List<PurchaseOrder> purchaseOrderDraftList = new ArrayList<PurchaseOrder>();
//			List<PurchaseOrder> purchaseOrderAllList = new ArrayList<PurchaseOrder>();
			PurchaseOrder purchaseOrderBeanObj = new PurchaseOrder();
			try {
				purchaseOrderBeanObj.setStartIndex(index);
				PurchaseOrderProxy purchaseOrderProxyObj = new PurchaseOrderProxy();
				purchaseOrderBeanObj.setStoreLocation(storeLocation);
				if(operation.equals("all"))
					purchaseOrderBeanObj.setStatus("");
				else
					purchaseOrderBeanObj.setStatus(operation);
				purchaseOrderBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				// log.info("Request String:::::::::::"+gson.toJson(purchaseOrderBeanObj));
				result = purchaseOrderProxyObj.getPOReference(gson.toJson(purchaseOrderBeanObj));
				// log.info("Response String:::::::::::"+result);
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					purchaseOrderBeanObj = gson.fromJson(result, PurchaseOrder.class);
					if(purchaseOrderBeanObj.getOrdersList() != null && purchaseOrderBeanObj.getOrdersList().size() > 0)
						purchaseOrderBeanObj.getOrdersList().get(0).setTotalRecords(purchaseOrderBeanObj.getTotalRecords());
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
			return purchaseOrderBeanObj.getOrdersList();
		}*/

		
		/**
		 * 
		 * @author Mythri.S
		 * 
		 *This method is used to call createNewProcurement method of web service and return the response
		 *
		 **/
		public String createPurchaseOrder(PurchaseOrder purchaseOrderObj,String customerId, String emailId){
			String result = null;
			RestfulServiceConnection restfulServiceConnection =new RestfulServiceConnection();
			try {
				purchaseOrderObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
//		purchaseOrderObj.setSupplier_contact_name(purchaseOrderObj.getSupplier_name());
//				PurchaseOrderProxy purchaseOrderProxyObj = new PurchaseOrderProxy();
				// log.info("Request String::::::::::::sss"+gson.toJson(purchaseOrderObj));
			//System.out.println("purchase order Request String::::::::::::sss"+gson.toJson(purchaseOrderObj));
				/*result = purchaseOrderProxyObj.createPurchaseOrder(gson.toJson(purchaseOrderObj));*/
				result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_purchase_order"), gson.toJson(purchaseOrderObj));
				// log.info("Response String:::::::::::"+result);
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					result = AppProperties.getAppMessageByProperty("PURCHASEORDER_CREATE_SUCCESS").trim();
				}
				else{
					result = Response.getResponseMessage(result);
				}
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return result;
		}
		
		
		public PurchaseOrder addQuoteItemsToPurchaseOrder(PurchaseOrder purchaseOrderObj,String customerIdStr,String emailIdStr){
			try {
				List<PurchaseOrderItems> purchaseItemsList = new ArrayList<PurchaseOrderItems>();
				Quotation quotationObj = getRequestForQuotationDetails("0", customerIdStr, emailIdStr,purchaseOrderObj.getQuoteRef());
				List<PurchaseOrderShipmentLocation> purchaseOrderShipmentLocationsList = new ArrayList<PurchaseOrderShipmentLocation>();
				List<String> selectedLocationsList = new ArrayList<String>();
				double subTotalCost = 0.0;
				if(quotationObj.getItemsList() != null)
					for(QuoteItems quoteItems : quotationObj.getItemsList()){
						PurchaseOrderItems purchaseOrderItemsObj = new PurchaseOrderItems();
						purchaseOrderItemsObj.setColor(quoteItems.getColor());
						purchaseOrderItemsObj.setItemDesc(quoteItems.getItemDescription());
						purchaseOrderItemsObj.setItemId(quoteItems.getItemId());
						purchaseOrderItemsObj.setItemPrice(quoteItems.getPrice());
						purchaseOrderItemsObj.setMake(quoteItems.getMake());
						purchaseOrderItemsObj.setModel(quoteItems.getModel());
						purchaseOrderItemsObj.setPluCode(quoteItems.getPluCode());
						purchaseOrderItemsObj.setQuantity(quoteItems.getQuantityStr());
						purchaseOrderItemsObj.setSize(quoteItems.getSize());
						purchaseOrderItemsObj.setSkuId(quoteItems.getSkuId());
						purchaseOrderItemsObj.setTotalCost(quoteItems.getTotalStr());
						subTotalCost = subTotalCost + Float.parseFloat(quoteItems.getTotalStr());
						purchaseItemsList.add(purchaseOrderItemsObj);
						if(quotationObj.getShipmentLocationsList() != null && quotationObj.getShipmentLocationsList().size() > 0)
							for(QuoteShipmentLocation quoteShipmentLocation : quotationObj.getShipmentLocationsList()){
								PurchaseOrderShipmentLocation purchaseOrderShipmentLocationObj = new PurchaseOrderShipmentLocation();
								if(quoteItems.getSkuId().equals(quoteShipmentLocation.getSkuId())){
									purchaseOrderShipmentLocationObj.setMake(quoteItems.getMake());
									purchaseOrderShipmentLocationObj.setPluCode(quoteItems.getPluCode());
									purchaseOrderShipmentLocationObj.setQuantity(quoteShipmentLocation.getQuantity());
									purchaseOrderShipmentLocationObj.setQuantityStr(quoteShipmentLocation.getQuantity());
									purchaseOrderShipmentLocationObj.setRemarks(quoteItems.getRemarks());
									purchaseOrderShipmentLocationObj.setSkuId(quoteItems.getSkuId());
									purchaseOrderShipmentLocationObj.setSkuName(quoteItems.getItemDescription());
									purchaseOrderShipmentLocationObj.setSkuPrice(quoteItems.getPrice());
									purchaseOrderShipmentLocationObj.setStoreLocation(quoteShipmentLocation.getShipmentLocation());
									float totalCost = Float.parseFloat(purchaseOrderShipmentLocationObj.getQuantity()) * purchaseOrderShipmentLocationObj.getSkuPrice();
									double cost = Math.round(totalCost*100.0)/100.0;
									purchaseOrderShipmentLocationObj.setTotalCost(cost);
									if(!selectedLocationsList.contains(purchaseOrderShipmentLocationObj.getStoreLocation()))
										selectedLocationsList.add(purchaseOrderShipmentLocationObj.getStoreLocation());
									purchaseOrderShipmentLocationsList.add(purchaseOrderShipmentLocationObj);
								}
							}
					}
				purchaseOrderObj.setPurchaseItems(purchaseItemsList);
				purchaseOrderObj.setShipmentLocations(purchaseOrderShipmentLocationsList);
				List<LocationBean> locationDetails = new ArrayList<LocationBean>();
				List<LocationBean> selectedLocationDetails = new ArrayList<LocationBean>();
				for(String locationId : selectedLocationsList){
					locationDetails = genericMasterServiceObj.getLocationDetails(locationId,customerIdStr, emailIdStr,"0","",false,true,true);
					if(locationDetails != null && locationDetails.size() > 0)
						selectedLocationDetails.add(locationDetails.get(0));
				}
				purchaseOrderObj.setSelectedLocationList(selectedLocationDetails);
				if(purchaseOrderObj.getTotal_tax() == null)
					purchaseOrderObj.setTotal_tax(0.0);
					purchaseOrderObj.setTotal_po_value(0.0);
				if(purchaseOrderObj.getShipping_cost() == null)
					purchaseOrderObj.setShipping_cost(0.0);
				purchaseOrderObj.setSub_total(subTotalCost);
				purchaseOrderObj.setTotal_po_value(subTotalCost+purchaseOrderObj.getTotal_tax()+purchaseOrderObj.getShipping_cost());
				purchaseOrderObj.setpO_Ref(purchaseOrderObj.getPoRef());
				purchaseOrderObj.setPO_Ref(purchaseOrderObj.getPoRef());
			//	purchaseOrderObj.setSub_total(purchaseOrderObj.getTotal_po_value()-purchaseOrderObj.getTotal_tax()-purchaseOrderObj.getShipping_cost());
			} catch(Exception e){
				e.printStackTrace();
			}
			return purchaseOrderObj;
		}
		

		public PurchaseOrder getPurchaseOrderDetails(String PO_Ref,String status,String customerId,String emailId){
			String result = null;
			PurchaseOrder purchaseOrderObj = new PurchaseOrder();
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			try {
				purchaseOrderObj.setpO_Ref(PO_Ref);
				purchaseOrderObj.setStorageRefRequired(true);
				purchaseOrderObj.setWHShipmentSearch(false);
				purchaseOrderObj.setWorkflowStatus(status);
				purchaseOrderObj.setRequestChannel("Warehouse");
				//purchaseOrderObj.setPO_Ref(PO_Ref);
//				PurchaseOrderProxy purchaseOrderProxyObj = new PurchaseOrderProxy();
				purchaseOrderObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				///// log.info("Request String::get_purchase_order_details:::::::"+gson.toJson(purchaseOrderObj));
				/////////////System.out.println("Request String::get_purchase_order_details:::::::"+gson.toJson(purchaseOrderObj));
				/*result = purchaseOrderProxyObj.getPurchaseOrderDetails(gson.toJson(purchaseOrderObj));*/
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_purchase_order_details"), gson.toJson(purchaseOrderObj), "GET");
				//// log.info("Response String:::::::::"+result);
				//////////////System.out.println("Response String  get_purchase_order_details:::::::::"+result);
				//////////System.out.println("Response String  get :: "+result);
				PurchaseOrderBean purchaseOrderBeanObj = gson.fromJson(result, PurchaseOrderBean.class);
				purchaseOrderObj = purchaseOrderBeanObj.getWhPurchaseOrder();
				purchaseOrderObj.setShipmentLocations(purchaseOrderBeanObj.getLocationsList());
				purchaseOrderObj.setPurchaseItems(purchaseOrderBeanObj.getItemDetails());
				List<String> selectedLocationsList = new ArrayList<String>();
				if(purchaseOrderObj.getShipmentLocations() != null && purchaseOrderObj.getShipmentLocations().size() > 0)
					for(PurchaseOrderShipmentLocation purchaseOrderShipmentLocation : purchaseOrderObj.getShipmentLocations()){
						float totalCost = Float.parseFloat(purchaseOrderShipmentLocation.getQuantity()) * purchaseOrderShipmentLocation.getSkuPrice();
						double cost = Math.round(totalCost*100.0)/100.0;
						purchaseOrderShipmentLocation.setTotalCost(cost);
						if(!selectedLocationsList.contains(purchaseOrderShipmentLocation.getStoreLocation()))
							selectedLocationsList.add(purchaseOrderShipmentLocation.getStoreLocation());
					}
				List<LocationBean> locationDetails = new ArrayList<LocationBean>();
				List<LocationBean> selectedLocationDetails = new ArrayList<LocationBean>();
				for(String locationId : selectedLocationsList){
					locationDetails = genericMasterServiceObj.getLocationDetails(locationId,customerId, emailId,"0","",false,true,true);
					if(locationDetails != null && locationDetails.size() > 0)
						selectedLocationDetails.add(locationDetails.get(0));
				}
				purchaseOrderObj.setSelectedLocationList(selectedLocationDetails);
				if(purchaseOrderObj.getTotal_tax() == null)
					purchaseOrderObj.setTotal_tax(0.0);
				if(purchaseOrderObj.getTotal_po_value() == null)
					purchaseOrderObj.setTotal_po_value(0.0);
				if(purchaseOrderObj.getShipping_cost() == null)
					purchaseOrderObj.setShipping_cost(0.0);
				purchaseOrderObj.setSub_total(purchaseOrderObj.getTotal_po_value()-purchaseOrderObj.getTotal_tax()-purchaseOrderObj.getShipping_cost());
			}catch (NoSuchElementException nse) {
				nse.printStackTrace();
				result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return purchaseOrderObj;
		}
		
		/*Chaithanya.v*/
		public String getprintPurchaseOrderDetails(String PO_Ref,String customerId,String emailId){
			String result = null;
			PurchaseOrder purchaseOrderObj = new PurchaseOrder();
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			try {
				purchaseOrderObj.setpO_Ref(PO_Ref);
				purchaseOrderObj.setPO_Ref(PO_Ref);
				purchaseOrderObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				// log.info("Request String:::::::::"+gson.toJson(purchaseOrderObj));
				////////////////System.out.println("Request String:::::::::"+gson.toJson(purchaseOrderObj));
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("generate_pdf"), gson.toJson(purchaseOrderObj), "GET");
				//////////////////////System.out.println("Response"+result);
				
					}catch (NoSuchElementException nse) {
				nse.printStackTrace();
				result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return result;
		}
		
		
		public String getprintWhInvoiceDetails(String Invoice_Ref,String customerId,String emailId){
			String result = null;
			WHInvoice invoiceObj = new WHInvoice();
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			try {
				invoiceObj.setInvoiceId(Invoice_Ref);
				invoiceObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				// log.info("Request String:::::::::"+gson.toJson(invoiceObj));
				////////////////////////////System.out.println("invoice Request String:::::::::"+gson.toJson(invoiceObj));
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Invoice_Pdf"), gson.toJson(invoiceObj), "GET");
				////////////////////////////System.out.println("Response"+result);
					}catch (NoSuchElementException nse) {
				nse.printStackTrace();
				result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return result;
		}
		
		
		/*Chaithanya.v*/
		public String printbusinessdocument(String id,String customerId,String emailId,String operation, boolean eway){
			String result = null;
			RequestBean request = new RequestBean();
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			try {
				request.setStockRequestId(id);
				request.setGoods_receipt_ref_num(id);
				request.setStartIndex("0");
				request.setReceiptNoteId(id);
				request.setBillId(id);
				request.setPrintingType("general");
				if(eway) {
				request.setJsonFileRequired(true);
				}else {
				request.setPrintResponseRequired(true);
				}
				
				request.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				// log.info("Request String:::::::::"+gson.toJson(request));
			    //System.out.println("Request String:::::::::"+gson.toJson(request));
				if(operation.equals("StockRequest"))
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("generate_indent_pdf"), gson.toJson(request), "GET");
				else if(operation.equals("StockReceipt"))
					result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("generate_receipt_pdf"), gson.toJson(request), "GET");
				else if(operation.equals("OutletGrn"))
					result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("generate_outlet_grn_pdf"), gson.toJson(request), "GET");
				else if(operation.equals("Bill")){
					result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("billing_Service_get_billing_details"), gson.toJson(request), "GET");

				}// log.info("Response :::::::::"+result);
			//System.out.println("Response :::::::::"+result);
			}catch (NoSuchElementException nse) {
				nse.printStackTrace();
				result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return result;
		}
		
		
		
		
		public String sendemail(String testmail,String customerId,String emailId,String testmsg){
			String result = null;
			RequestBean request = new RequestBean();
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			try {
				/*request.setStockRequestId(id);
				request.setGoods_receipt_ref_num(id);
				request.setStartIndex("0");
				request.setReceiptNoteId(id);
				request.setBillId(id);
				request.setPrintingType("general");
				if(eway) {
				request.setJsonFileRequired(true);
				}else {
				request.setPrintResponseRequired(true);
				}
				
				request.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				// log.info("Request String:::::::::"+gson.toJson(request));
			    //////////System.out.println("Request String:::::::::"+gson.toJson(request));
				if(operation.equals("StockRequest"))
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("generate_indent_pdf"), gson.toJson(request), "GET");
				else if(operation.equals("StockReceipt"))
					result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("generate_receipt_pdf"), gson.toJson(request), "GET");
				else if(operation.equals("OutletGrn"))
					result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("generate_outlet_grn_pdf"), gson.toJson(request), "GET");
				else if(operation.equals("Bill")){
					result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("billing_Service_get_billing_details"), gson.toJson(request), "GET");
*/
				//}// log.info("Response :::::::::"+result);
			//	//////////System.out.println("Response :::::::::"+result);
			}catch (NoSuchElementException nse) {
				nse.printStackTrace();
				result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return result;
		}
		
		
		
		
		/*Chaithanya.v*/
		public String getprintgrnDetails(String PO_Ref,String customerId,String emailId){
			String result = null;
			ProcurementReceipt purchaseOrderObj = new ProcurementReceipt();
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			try {
				purchaseOrderObj.setReceiptId(PO_Ref);
				purchaseOrderObj.setReceiptNoteId(PO_Ref);
				purchaseOrderObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				// log.info("Request String:::::::::"+gson.toJson(purchaseOrderObj));
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("generate_goodsreceipt_note"), gson.toJson(purchaseOrderObj), "GET");
				
				
					}catch (NoSuchElementException nse) {
				nse.printStackTrace();
				result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return result;
		}
		
		
		
		
		/**
		 * 
		 * @author Mythri.S
		 * 
		 *This method is used to call updatePurchaseOrder method of web service and return the response
		 *
		 **/
		public String updatePurchaseOrder(PurchaseOrder purchaseOrderObj,String customerId, String emailId){
			String result = null;
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			try {
//				// log.info(purchaseOrderObj.getPO_Ref());
//				// log.info(purchaseOrderObj.getpO_Ref());
//				purchaseOrderObj.setPO_Ref(purchaseOrderObj.getpO_Ref());
				purchaseOrderObj.setpO_Ref(purchaseOrderObj.getPoRef());
				purchaseOrderObj.setPO_Ref(purchaseOrderObj.getPoRef());
				// log.info(purchaseOrderObj.getPO_Ref());
				//purchaseOrderObj.getItemsList().remove()
				purchaseOrderObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
//				PurchaseOrderProxy purchaseOrderProxy = new PurchaseOrderProxy();
			      //System.out.println("Request String::::::::::::"+gson.toJson(purchaseOrderObj));
				/*result = purchaseOrderProxy.updatePurchaseOrder(gson.toJson(purchaseOrderObj));*/
				result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_purchase_order"), gson.toJson(purchaseOrderObj));
			       ////System.out.println("Response String:::::::::::"+result);
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					result = AppProperties.getAppMessageByProperty("PURCHASEORDER_UPDATE_SUCCESS").trim();
				}
				else{
					result = Response.getResponseMessage(result);
				}
			}catch (NoSuchElementException nse) {
				nse.printStackTrace();
				result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return result;
		}
		
		
		public Quotation getRequestForQuotationDetails(String index,String customerId,String emailId,String rfqIdStr){
			String result = null;
			QuoteRequestResponse responseObj=new QuoteRequestResponse();
			Quotation quotationObj=new Quotation();
			try {
				quotationObj.setStartIndex(index);
				quotationObj.setQuoteRef(rfqIdStr);
				quotationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
				// log.info("Request String:::::::::::"+gson.toJson(quotationObj));
				result = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_quote_requests"), gson.toJson(quotationObj),"GET");
				// log.info("Response String:::::::::::"+result);
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					responseObj = gson.fromJson(result, QuoteRequestResponse.class);
					quotationObj=responseObj.getQuoteObj();
					quotationObj.setCreatedDateStr(quotationObj.getCreatedDateStr().substring(0, 10));
					quotationObj.setLastDateForQuoteStr(quotationObj.getLastDateForQuoteStr().substring(0, 10));
				}
				List<String> selectedLocationsList = new ArrayList<String>();
				if(quotationObj.getShipmentLocationsList() != null && quotationObj.getShipmentLocationsList().size() > 0)
					for(QuoteShipmentLocation quotationShipmentLocation : quotationObj.getShipmentLocationsList()){
						if(!selectedLocationsList.contains(quotationShipmentLocation.getShipmentLocation()))
							selectedLocationsList.add(quotationShipmentLocation.getShipmentLocation());
					}
				List<LocationBean> locationDetails = new ArrayList<LocationBean>();
				List<LocationBean> selectedLocationDetails = new ArrayList<LocationBean>();
				for(String locationId : selectedLocationsList){
					locationDetails = genericMasterServiceObj.getLocationDetails(locationId,customerId, emailId,"0","",false,true,true);
					if(locationDetails != null && locationDetails.size() > 0)
						selectedLocationDetails.add(locationDetails.get(0));
				}
				quotationObj.setSelectedLocationList(selectedLocationDetails);
				if(quotationObj.getItemsList() != null)
					for(QuoteItems quoteItems : quotationObj.getItemsList()){
						if(quotationObj.getShipmentLocationsList() != null)
							for(QuoteShipmentLocation quoteShipmentLocation : quotationObj.getShipmentLocationsList()){
								if(quoteShipmentLocation.getSkuId().equals(quoteItems.getSkuId())){
									quoteShipmentLocation.setItemDescription(quoteItems.getItemDescription());
									quoteShipmentLocation.setRemarks(quoteItems.getRemarks());
									quoteShipmentLocation.setUnitOfMeasurement(quoteItems.getUnitOfMeasurement());
								}
							}
					}
				// log.info("RESPONSE::"+gson.toJson(quotationObj));
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
		return quotationObj;
			
		}

		
		public List<Quotation> getRequestForQuotation(String searchName,String index,String customerId,String emailId,String location,String maxRecords,String startDate,String endDate){
			String result = null;
			List<Quotation> quotesList= new ArrayList<Quotation>();
			try {
				Quotation quotationObj=new Quotation();
				quotationObj.setStartIndex(index);
				quotationObj.setSearchCriteria(searchName);
				quotationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				quotationObj.setFromLocation(location);
				quotationObj.setMaxRecords(maxRecords);
				quotationObj.setStartDate(startDate);
				quotationObj.setEndDate(endDate);
				RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
				// log.info("Request String:::::::::::"+gson.toJson(quotationObj));
				result = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_quote_requests"), gson.toJson(quotationObj),"GET");
				// log.info("Response String:::::::::::"+result);
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					quotationObj = gson.fromJson(result, Quotation.class);
					if(quotationObj.getQuotesList() != null && quotationObj.getQuotesList().size() > 0){
						quotationObj.getQuotesList().get(0).setTotalRecords(quotationObj.getTotalRecords());
						int slNo = Integer.parseInt(index);
						for(int i=0;i<quotationObj.getQuotesList().size();i++){
							quotationObj.getQuotesList().get(i).setSlNo(++slNo);
							quotationObj.getQuotesList().get(i).setCreatedDateStr(quotationObj.getQuotesList().get(i).getCreatedDateStr().substring(0, 10));
							quotationObj.getQuotesList().get(i).setLastDateForQuoteStr(quotationObj.getQuotesList().get(i).getLastDateForQuoteStr().substring(0, 10));
						}
					}
					quotesList = quotationObj.getQuotesList();
				}
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
		return quotesList;
		}
		
		public List<String> searchQuoteRef(String customerIdStr,String emailIdStr,String searchNameStr){
			List<String> quoteRefsList = new ArrayList<String>();
			String result = null;
			try {
				Quotation quotationObj = new Quotation();
				quotationObj.setSearchCriteria(searchNameStr);
				quotationObj.setStartIndex("-1");
				quotationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
				// log.info("Request String:::::::::::"+gson.toJson(quotationObj));
				result = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_quote_requests"), gson.toJson(quotationObj),"GET");
				// log.info("Response String:::::::::::"+result);
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					quotationObj = gson.fromJson(result, Quotation.class);
					if(quotationObj.getQuotesList() != null && quotationObj.getQuotesList().size() > 0)
						for(Quotation quotation : quotationObj.getQuotesList()){
								quoteRefsList.add(quotation.getQuoteRef());
						}
				}
				else{
					result = Response.getResponseMessage(result);
				}
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return quoteRefsList;
		}
		
		
		/**
		 * 
		 * @author Mythri.S
		 * 
		 *This method is used to call createNewProcurement method of web service and return the response
		 *
		 **/
		public String createRequestForQuotation(Quotation quotationObj,String customerIdStr, String emailIdStr){
			String resultStr = null;
			try {
				quotationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				
				// log.info("Request String::::::::::::"+gson.toJson(quotationObj));
				RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
				if(quotationObj.getQuoteRef() == null || quotationObj.getQuoteRef().equals(""))
					resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getAppMessageByProperty("create_quote_requests"), gson.toJson(quotationObj));
				else
					resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getAppMessageByProperty("update_quote_requests"), gson.toJson(quotationObj));
				// log.info("Response String:::::::::::"+resultStr);
				String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					if(quotationObj.getQuoteRef() == null || quotationObj.getQuoteRef().equals(""))
						resultStr = AppProperties.getAppMessageByProperty("REQUEST_FOR_QUOTE_CREATE_SUCCESS").trim();
					else
						resultStr = AppProperties.getAppMessageByProperty("REQUEST_FOR_QUOTE_UPDATE_SUCCESS").trim();
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
		
		
		
	//	written by manasa
		public List<String> searchgGRNRefs(String customerIdStr,String emailIdStr,String searchNameStr,String storeLocation){
			List<String> grnRefsList = new ArrayList<String>();
			RestfulServiceConnection restfulServiceConnection =new RestfulServiceConnection();
			String result = null;
			try {
				ProcurementReceipt grnObj = new ProcurementReceipt();
				//purchaseOrderObj.setpO_Ref(searchNameStr);
				//purchaseOrderObj.setPO_Ref(searchNameStr);
				grnObj.setStartIndex("-1");
				grnObj.setGoods_receipt_ref_num(searchNameStr);
				grnObj.setSearchCriteria(searchNameStr);
				grnObj.setLocation(storeLocation);
				//purchaseOrderObj.setDeliveryLocation(storeLocation);
				grnObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				// log.info("Request String::::::::::::"+gson.toJson(grnObj));
				////////////////////////////System.out.println("Request String::::::::::::"+gson.toJson(grnObj));
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_GoodsReceipt_Ids"), gson.toJson(grnObj), "GET");
				// log.info("Response String:::::::::::"+result);
				////////////////////////////System.out.println("Response String:::::::::::"+result);
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					grnObj = gson.fromJson(result, ProcurementReceipt.class);
					if(grnObj.getGrnRefList() != null && grnObj.getGrnRefList().size() > 0)
					{
						grnRefsList = grnObj.getGrnRefList();
					}
					
				}
				else{
					result = Response.getResponseMessage(result);
				}
			}catch (NoSuchElementException nse) {
				nse.printStackTrace();
				result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			}  catch(Exception e){
				e.printStackTrace();
			}
			return grnRefsList;
		}

		
		
		
		
		//added by vijay	
		public ProcurementReceipt getGRNItems(String grnRefId,String storeLocation,String customerIdStr,String emailIdStr){
			String result = null;
			ProcurementReceipt grnOrderObj = new ProcurementReceipt();
			//PurchaseOrderBean grnOrderBeanObj =null;
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
//			List<PurchaseOrderShipmentLocation> purchaseOrderShipmentLocationsList =  new ArrayList<PurchaseOrderShipmentLocation>();
			try {
				grnOrderObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
//				grnOrderObj.setLocation(storeLocation);
				grnOrderObj.setReceiptId(grnRefId);
				grnOrderObj.setReceiptNoteId(grnRefId);
				grnOrderObj.setStartIndex("0");
				// log.info("Request String:::::::::"+gson.toJson(grnOrderObj));
			//	//////////////////////System.out.println(gson.toJson(grnOrderObj));
				/*result = purchaseOrderProxyObj.getPurchaseOrderDetails(gson.toJson(purchaseOrderObj));*/
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_goodsreceipt_note"), gson.toJson(grnOrderObj), "GET");
				// log.info("Response String:::::::::"+result);
			//  //////////System.out.println("Response String:::::::::"+result);
				grnOrderObj = gson.fromJson(result, ProcurementReceipt.class);
				//grnOrderObj.setItemsList(grnOrderObj.g);
				//grnOrderObj.getGrnObj();
			
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return grnOrderObj.getGrnObj();
		}

		

		public List<String> searchPoRefs(String customerIdStr,String emailIdStr,String searchNameStr,String storeLocation){
			List<String> poRefsList = new ArrayList<String>();
			RestfulServiceConnection restfulServiceConnection =new RestfulServiceConnection();
			String result = null;
			try {
				PurchaseOrder purchaseOrderObj = new PurchaseOrder();
				purchaseOrderObj.setpO_Ref(searchNameStr);
				purchaseOrderObj.setPO_Ref(searchNameStr);
				purchaseOrderObj.setStartIndex("-1");
				purchaseOrderObj.setSearchCriteria(searchNameStr);
				purchaseOrderObj.setDeliveryLocation(storeLocation);
				purchaseOrderObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
/////			System.out.println("Request String::::::::::::"+gson.toJson(purchaseOrderObj));
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_po_ids"), gson.toJson(purchaseOrderObj), "GET");
/////			System.out.println("Response String:::::::::::"+result);
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					 purchaseOrderObj = gson.fromJson(result, PurchaseOrder.class);
					if(purchaseOrderObj.getWhPurchaseOrderRefList() != null && purchaseOrderObj.getWhPurchaseOrderRefList().size() > 0)
					{
						poRefsList = purchaseOrderObj.getWhPurchaseOrderRefList();
					}
					
				}
				else{
					result = Response.getResponseMessage(result);
				}
			}catch (NoSuchElementException nse) {
				nse.printStackTrace();
				result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			}  catch(Exception e){
				e.printStackTrace();
			}
			return poRefsList;
		}
		
		public PurchaseOrderBean getPoItems(String poRefId,String storeLocation,String customerIdStr,String emailIdStr){
			String result = null;
			PurchaseOrder purchaseOrderObj = new PurchaseOrder();
			PurchaseOrderBean purchaseOrderBeanObj =null;
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
//			List<PurchaseOrderShipmentLocation> purchaseOrderShipmentLocationsList =  new ArrayList<PurchaseOrderShipmentLocation>();
			try {
				purchaseOrderObj.setpO_Ref(poRefId);
				purchaseOrderObj.setPO_Ref(poRefId);
				purchaseOrderObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				// log.info("Request String:::::::::"+gson.toJson(purchaseOrderObj));
				////////////System.out.println("Request String:::::::::"+gson.toJson(purchaseOrderObj));
				/*result = purchaseOrderProxyObj.getPurchaseOrderDetails(gson.toJson(purchaseOrderObj));*/
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_purchase_order_details"), gson.toJson(purchaseOrderObj), "GET");
				// log.info("Response String:::::::::"+result);
			//     //////////System.out.println("Response String:::::::::"+result);
				purchaseOrderBeanObj = gson.fromJson(result, PurchaseOrderBean.class);
				purchaseOrderObj = purchaseOrderBeanObj.getWhPurchaseOrder();
				purchaseOrderObj.setShipmentLocations(purchaseOrderBeanObj.getLocationsList());
				purchaseOrderObj.setPurchaseItems(purchaseOrderBeanObj.getItemDetails());
				/*if(purchaseOrderObj.getShipmentLocations() != null && purchaseOrderObj.getShipmentLocations().size() > 0)
					for(PurchaseOrderShipmentLocation purchaseOrderShipmentLocation : purchaseOrderObj.getShipmentLocations()){
						if(storeLocation != null && storeLocation.equals(purchaseOrderShipmentLocation.getStoreLocation())){
							float totalCost = Float.parseFloat(purchaseOrderShipmentLocation.getQuantity()) * purchaseOrderShipmentLocation.getSkuPrice();
							double cost = Math.round(totalCost*100.0)/100.0;
							purchaseOrderShipmentLocation.setTotalCost(cost);
							purchaseOrderShipmentLocationsList.add(purchaseOrderShipmentLocation);
						}
					}*/
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return purchaseOrderBeanObj;
		}
		
		
		
		
		
		
		
		public List<String> searchShipmentNoteRefs(String customerIdStr,String emailIdStr,String searchNameStr,String storeLocation){
			List<String> shipmentNoteRefsList = new ArrayList<String>();
			String result = null;
			try {
				PurchaseShipmentNote purchaseShipmentNoteObj = new PurchaseShipmentNote();
//				purchaseShipmentNoteObj.setStartIndex("-1");
				
				purchaseShipmentNoteObj.setStartIndex("0");
				purchaseShipmentNoteObj.setMaxRecords("10");
				
				purchaseShipmentNoteObj.setSearchCriteria(searchNameStr);
				purchaseShipmentNoteObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				purchaseShipmentNoteObj.setLocation(storeLocation);
				RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
				// log.info("Request String:::::::::::"+gson.toJson(purchaseShipmentNoteObj));
				result = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_shipment_notes"), gson.toJson(purchaseShipmentNoteObj),"GET");
				// log.info("Response String:::::::::::"+result);
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					purchaseShipmentNoteObj = gson.fromJson(result, PurchaseShipmentNote.class);
					if(purchaseShipmentNoteObj.getShipmentNotes() != null && purchaseShipmentNoteObj.getShipmentNotes().size() > 0){
						for(int i=0;i<purchaseShipmentNoteObj.getShipmentNotes().size();i++){
							shipmentNoteRefsList.add(purchaseShipmentNoteObj.getShipmentNotes().get(i).getShipmentNoteRef());
						}
					}
				}
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return shipmentNoteRefsList;
		}
		
		
		public List<PurchaseOrderShipmentLocation> getShipmentNoteItems(String shipmentNoteRef,String storeLocation,String customerIdStr,String emailIdStr){
			String result = null;
			List<PurchaseOrderShipmentLocation> purchaseOrderShipmentLocationsList =  new ArrayList<PurchaseOrderShipmentLocation>();
			try {
				PurchaseShipmentNote purchaseShipmentNote = new PurchaseShipmentNote();
				purchaseShipmentNote.setShipmentNoteRef(shipmentNoteRef);
				purchaseShipmentNote.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
				// log.info("Request String:::::::::::"+gson.toJson(purchaseShipmentNote));
				result = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_shipment_note_details"), gson.toJson(purchaseShipmentNote),"GET");
				// log.info("Response String:::::::::::"+result);
				purchaseShipmentNote = gson.fromJson(result, PurchaseShipmentNote.class);
				purchaseShipmentNote = purchaseShipmentNote.getShipmentNoteDetails();
				if(purchaseShipmentNote.getShipmentNoteLocations() != null && purchaseShipmentNote.getShipmentNoteLocations().size() > 0)
					for(PurchaseOrderShipmentLocation purchaseOrderShipmentLocation : purchaseShipmentNote.getShipmentNoteLocations()){
						if(storeLocation != null && storeLocation.equals(purchaseOrderShipmentLocation.getStoreLocation())){
							float totalCost = Float.parseFloat(purchaseOrderShipmentLocation.getQuantity()) * purchaseOrderShipmentLocation.getSkuPrice();
							double cost = Math.round(totalCost*100.0)/100.0;
							purchaseOrderShipmentLocation.setTotalCost(cost);
							purchaseOrderShipmentLocationsList.add(purchaseOrderShipmentLocation);
						}
					}
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return purchaseOrderShipmentLocationsList;
		}
		
		
		public PurchaseShipmentNote addPoItemsToShipmentNote(PurchaseShipmentNote purchaseShipmentNote,String customerIdStr,String emailIdStr){
			try {
				PurchaseOrder purchaseOrderObj = getPurchaseOrderDetails(purchaseShipmentNote.getPoRef(),"",customerIdStr, emailIdStr);
				if(purchaseOrderObj != null && purchaseShipmentNote != null){
					purchaseShipmentNote.setShipmentNoteItems(purchaseOrderObj.getPurchaseItems());
					purchaseShipmentNote.setSelectedLocationList(purchaseOrderObj.getSelectedLocationList());
					purchaseShipmentNote.setShipmentNoteLocations(purchaseOrderObj.getShipmentLocations());
				}
//				//////////////////////System.out.println(purchaseShipmentNote);
			} catch(Exception e){
				e.printStackTrace();
			}
			return purchaseShipmentNote;
		}
		
		
		public String createShipmentNote(PurchaseShipmentNote purchaseShipmentNoteObj,String customerId, String emailId){
			String resultStr = null;
			try {
				purchaseShipmentNoteObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
				// log.info("Request String::::::::::::"+gson.toJson(purchaseShipmentNoteObj));
				resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_shipment_note"), gson.toJson(purchaseShipmentNoteObj));
				// log.info("Result:::"+resultStr);
				 String responseCode = Response.getResponseCode(resultStr);
					if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
							resultStr = AppProperties.getAppMessageByProperty("SHIPMENT_NOTE_CREATE_SUCCESS").trim();
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
		
		
		public List<PurchaseShipmentNote> getShipmentNote(String searchName,String index,String customerId,String emailId,String location,String maxRecords,String startDate,String endDate){
			String result = null;
			List<PurchaseShipmentNote> purchaseShipmentNoteList= new ArrayList<PurchaseShipmentNote>();
			try {
				PurchaseShipmentNote purchaseShipmentNoteObj = new PurchaseShipmentNote();
				purchaseShipmentNoteObj.setStartIndex(index);
				purchaseShipmentNoteObj.setSearchCriteria(searchName);
				purchaseShipmentNoteObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				purchaseShipmentNoteObj.setLocation(location);
				purchaseShipmentNoteObj.setMaxRecords(maxRecords);
				purchaseShipmentNoteObj.setStartDate(startDate);
				purchaseShipmentNoteObj.setEndDate(endDate);
				RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
				// log.info("Request String:::::::::::"+gson.toJson(purchaseShipmentNoteObj));
				result = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_shipment_notes"), gson.toJson(purchaseShipmentNoteObj),"GET");
				// log.info("Response String:::::::::::"+result);
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					purchaseShipmentNoteObj = gson.fromJson(result, PurchaseShipmentNote.class);
					if(purchaseShipmentNoteObj.getShipmentNotes() != null && purchaseShipmentNoteObj.getShipmentNotes().size() > 0){
						purchaseShipmentNoteObj.getShipmentNotes().get(0).setTotalRecords(purchaseShipmentNoteObj.getTotalRecords());
						int slNo = Integer.parseInt(index);
						for(int i=0;i<purchaseShipmentNoteObj.getShipmentNotes().size();i++){
							purchaseShipmentNoteObj.getShipmentNotes().get(i).setSlNo(++slNo);
							purchaseShipmentNoteObj.getShipmentNotes().get(i).setCreatedDateStr(purchaseShipmentNoteObj.getShipmentNotes().get(i).getCreatedDateStr().substring(0, 10));
							purchaseShipmentNoteObj.getShipmentNotes().get(i).setShippedDateStr(purchaseShipmentNoteObj.getShipmentNotes().get(i).getShippedDateStr().substring(0, 10));
							purchaseShipmentNoteObj.getShipmentNotes().get(i).setArrivalDateStr(purchaseShipmentNoteObj.getShipmentNotes().get(i).getArrivalDateStr().substring(0, 10));
						}
					}
					purchaseShipmentNoteList = purchaseShipmentNoteObj.getShipmentNotes();
				}
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
		return purchaseShipmentNoteList;
		}
		
		
		public PurchaseShipmentNote getShipmentNoteDetails(String shipmentNoteRef,String customerId,String emailId){
			String result = null;
			PurchaseShipmentNote purchaseShipmentNote = new PurchaseShipmentNote();
			try {
				purchaseShipmentNote.setShipmentNoteRef(shipmentNoteRef);
				purchaseShipmentNote.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
				// log.info("Request String:::::::::::"+gson.toJson(purchaseShipmentNote));
				result = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_shipment_note_details"), gson.toJson(purchaseShipmentNote),"GET");
				// log.info("Response String:::::::::::"+result);
				purchaseShipmentNote = gson.fromJson(result, PurchaseShipmentNote.class);
				purchaseShipmentNote = purchaseShipmentNote.getShipmentNoteDetails();
				List<String> selectedLocationsList = new ArrayList<String>();
				if(purchaseShipmentNote.getShipmentNoteLocations() != null && purchaseShipmentNote.getShipmentNoteLocations().size() > 0)
					for(PurchaseOrderShipmentLocation purchaseOrderShipmentLocation : purchaseShipmentNote.getShipmentNoteLocations()){
						float totalCost = Float.parseFloat(purchaseOrderShipmentLocation.getQuantity()) * purchaseOrderShipmentLocation.getSkuPrice();
						double cost = Math.round(totalCost*100.0)/100.0;
						purchaseOrderShipmentLocation.setTotalCost(cost);
						if(!selectedLocationsList.contains(purchaseOrderShipmentLocation.getStoreLocation()))
							selectedLocationsList.add(purchaseOrderShipmentLocation.getStoreLocation());
					}
				List<LocationBean> locationDetails = new ArrayList<LocationBean>();
				List<LocationBean> selectedLocationDetails = new ArrayList<LocationBean>();
				for(String locationId : selectedLocationsList){
					locationDetails = genericMasterServiceObj.getLocationDetails(locationId,customerId, emailId,"0","",false,true,true);
					if(locationDetails != null && locationDetails.size() > 0)
						selectedLocationDetails.add(locationDetails.get(0));
				}
				purchaseShipmentNote.setSelectedLocationList(selectedLocationDetails);
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return purchaseShipmentNote;
		}
		
		public String updateShipmentNote(PurchaseShipmentNote purchaseShipmentNoteObj,String customerId, String emailId){
			String resultStr = null;
			try {
				purchaseShipmentNoteObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
				// log.info("Request String::::::::::::"+gson.toJson(purchaseShipmentNoteObj));
				resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_shipment_note"), gson.toJson(purchaseShipmentNoteObj));
				// log.info("Result:::"+resultStr);
				 String responseCode = Response.getResponseCode(resultStr);
					if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
							resultStr = AppProperties.getAppMessageByProperty("SHIPMENT_NOTE_UPDATE_SUCCESS").trim();
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
		
		public String createShipmentReturn(PurchaseStockReturn purchaseStockReturnObj,String customerIdStr, String emailIdStr){
			String resultStr = null;
			try {
				purchaseStockReturnObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				
				// log.info("Request String::::::::::::"+gson.toJson(purchaseStockReturnObj));
				//////////////System.out.println("Request String::::::SHIPMENT_RETURN_CREATE_SUCCESS::::::"+gson.toJson(purchaseStockReturnObj));
				RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
				if(purchaseStockReturnObj.getPurchaseStockReturnRef() == null || purchaseStockReturnObj.getPurchaseStockReturnRef().equals("")){
					if(purchaseStockReturnObj.getFlowUnder().equals("procurement")){
				 resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_ShipmentReturn"), gson.toJson(purchaseStockReturnObj));
	
					}else{
			 resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_WHShipmentReturn"), gson.toJson(purchaseStockReturnObj));

					}
					
				}else{
					
					if(purchaseStockReturnObj.getFlowUnder().equals("procurement")){

					resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_ShipmentReturn"), gson.toJson(purchaseStockReturnObj));
				}else{
					resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_WHShipmentReturn"), gson.toJson(purchaseStockReturnObj));

				}
				}
					// log.info("Response String:::::::::::"+resultStr);
				////////////////////////System.out.println("Response String::::::SHIPMENT_RETURN_CREATE_SUCCESS:::::"+resultStr);
				String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					if(purchaseStockReturnObj.getPurchaseStockReturnRef() == null || purchaseStockReturnObj.getPurchaseStockReturnRef().equals(""))
						resultStr = AppProperties.getAppMessageByProperty("SHIPMENT_RETURN_CREATE_SUCCESS").trim();
					else
						resultStr = AppProperties.getAppMessageByProperty("SHIPMENT_RETURN_UPDATE_SUCCESS").trim();
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
		
		
		public List<StoreShipmentReturn> getShipmentReturns(String purchaseStockReturnRef,String searchName,String index,String customerId,String emailId,String location,String maxRecords,String startDate,String endDate,String flowUnder,boolean flag, String supplier, String supplierid, String category, String subcategory){
			String result = null;
			List<StoreShipmentReturn> storeShipmentReturnList = new ArrayList<StoreShipmentReturn>();
			try {
				StoreShipmentReturn storeShipmentReturnObj = new StoreShipmentReturn();
				
				storeShipmentReturnObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				storeShipmentReturnObj.setFromLocation(location);
				storeShipmentReturnObj.setMaxRecords(maxRecords);
				storeShipmentReturnObj.setStartDate(startDate);
				storeShipmentReturnObj.setEndDate(endDate);
				storeShipmentReturnObj.setPurchaseStockReturnRef(purchaseStockReturnRef);
				storeShipmentReturnObj.setItemsReq(true);
				storeShipmentReturnObj.setFlowUnder(flowUnder);
				storeShipmentReturnObj.setPrintRequired(flag);
				storeShipmentReturnObj.setSupplierName(supplier);
				storeShipmentReturnObj.setSupplierId(supplierid);
				storeShipmentReturnObj.setCategory(category);
				storeShipmentReturnObj.setSubCategory(subcategory);
				
				RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
				//System.out.println("Request String:::::getshipreturn::::::"+gson.toJson(storeShipmentReturnObj));
				
				if(storeShipmentReturnObj.getFlowUnder().equals("procurement")){
					result = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_ShipmentReturn"), gson.toJson(storeShipmentReturnObj),"GET");

				}else{
					result = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_WHShipmentReturn"), gson.toJson(storeShipmentReturnObj),"GET");
				}
				//System.out.println("Response String:::::::::::getshipreturn"+result);
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					storeShipmentReturnObj = gson.fromJson(result, StoreShipmentReturn.class);
					

					if(flowUnder.equals("procurement")){
					if(storeShipmentReturnObj.getStoreShipmentReturnList() != null && storeShipmentReturnObj.getStoreShipmentReturnList().size() > 0){
						storeShipmentReturnObj.getStoreShipmentReturnList().get(0).setTotRecords(storeShipmentReturnObj.getTotRecords());
						int slNo = Integer.parseInt(index);
						for(int i=0;i<storeShipmentReturnObj.getStoreShipmentReturnList().size();i++){
							//storeShipmentReturnObj.getStoreShipmentReturnList().get(i).setSlNo(++slNo);
							if(storeShipmentReturnObj.getStoreShipmentReturnList().get(i).getCreatedDateStr() != null)
								storeShipmentReturnObj.getStoreShipmentReturnList().get(i).setCreatedDateStr(storeShipmentReturnObj.getStoreShipmentReturnList().get(i).getCreatedDateStr().substring(0, 10));
							if(storeShipmentReturnObj.getStoreShipmentReturnList().get(i).getUpdatedDateStr() != null)
								storeShipmentReturnObj.getStoreShipmentReturnList().get(i).setUpdatedDateStr(storeShipmentReturnObj.getStoreShipmentReturnList().get(i).getUpdatedDateStr().substring(0, 10));
							if(storeShipmentReturnObj.getStoreShipmentReturnList().get(i).getReturnDateStr() != null)
								storeShipmentReturnObj.getStoreShipmentReturnList().get(i).setReturnDateStr(storeShipmentReturnObj.getStoreShipmentReturnList().get(i).getReturnDateStr().substring(0, 10));
						}
					}
					storeShipmentReturnList = storeShipmentReturnObj.getStoreShipmentReturnList();
					
					}else{
					
					if(storeShipmentReturnObj.getWHShipmentReturnList() != null && storeShipmentReturnObj.getWHShipmentReturnList().size() > 0){
						storeShipmentReturnObj.getWHShipmentReturnList().get(0).setTotRecords(storeShipmentReturnObj.getTotRecords());
						int slNo = Integer.parseInt(index);
						for(int i=0;i<storeShipmentReturnObj.getWHShipmentReturnList().size();i++){
							//storeShipmentReturnObj.getStoreShipmentReturnList().get(i).setSlNo(++slNo);
							if(storeShipmentReturnObj.getWHShipmentReturnList().get(i).getCreatedDateStr() != null)
								storeShipmentReturnObj.getWHShipmentReturnList().get(i).setCreatedDateStr(storeShipmentReturnObj.getWHShipmentReturnList().get(i).getCreatedDateStr().substring(0, 10));
							if(storeShipmentReturnObj.getWHShipmentReturnList().get(i).getUpdatedDateStr() != null)
								storeShipmentReturnObj.getWHShipmentReturnList().get(i).setUpdatedDateStr(storeShipmentReturnObj.getWHShipmentReturnList().get(i).getUpdatedDateStr().substring(0, 10));
							if(storeShipmentReturnObj.getWHShipmentReturnList().get(i).getReturnDateStr() != null)
								storeShipmentReturnObj.getWHShipmentReturnList().get(i).setReturnDateStr(storeShipmentReturnObj.getWHShipmentReturnList().get(i).getReturnDateStr().substring(0, 10));
						}
					}
					storeShipmentReturnList = storeShipmentReturnObj.getWHShipmentReturnList();
				}}
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
		return storeShipmentReturnList;
		}
		
		
		public PurchaseStockReturn getShipmentReturnDetails(String purchaseStockReturnRef,String customerId,String emailId){
			String result = null;
			PurchaseStockReturn purchaseStockReturnObj = new PurchaseStockReturn();
			try {
				purchaseStockReturnObj.setPurchaseStockReturnRef(purchaseStockReturnRef);
				purchaseStockReturnObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
				// log.info("Request String:::::::::::"+gson.toJson(purchaseStockReturnObj));
				result = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_shipment_returns_details"), gson.toJson(purchaseStockReturnObj),"GET");
				// log.info("Response String:::::::::::"+result);
				////////////////////////////System.out.println("return Response String:::::::::::"+result);
				purchaseStockReturnObj = gson.fromJson(result, PurchaseStockReturn.class);
				purchaseStockReturnObj = purchaseStockReturnObj.getPurchaseStockReturn();
				if(purchaseStockReturnObj.getCreatedDateStr() != null)
					purchaseStockReturnObj.setCreatedDateStr(purchaseStockReturnObj.getCreatedDateStr().substring(0, 10));
				if(purchaseStockReturnObj.getUpdatedDateStr() != null)
					purchaseStockReturnObj.setUpdatedDateStr(purchaseStockReturnObj.getUpdatedDateStr().substring(0, 10));
				if(purchaseStockReturnObj.getReturnDateStr() != null)
					purchaseStockReturnObj.setReturnDateStr(purchaseStockReturnObj.getReturnDateStr().substring(0, 10));
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return purchaseStockReturnObj;
		}
		
		
		/**
		 * 
		 * @author chaithanya.v
		 * Created On: 2-nov-2015
		 * 
		 *This method is used to display the PO Summary
		 *
		 **/
		public StockRequestSummaryResponse getPoSummary(String flowUnder,String startDate,String endDate,String itemwise,String supplier){
			String resultStr=null;
			StockRequestSummaryResponse stockRequestObj =null;
			RequestBean beanObj = null;
			RestfulServiceConnection restfulConnectionObj =null;
			try{
				restfulConnectionObj = new RestfulServiceConnection();
				 stockRequestObj = new StockRequestSummaryResponse();
				beanObj = new RequestBean();
				beanObj.setStartDate(startDate);
				beanObj.setEndDate(endDate);
				beanObj.setSkuId(itemwise);
				beanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				beanObj.setStartIndex("0");
				// log.info("Request String:::"+gson.toJson(beanObj));
			
				resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_purchase_order_summary"), gson.toJson(beanObj), "GET");
				// log.info("Response String:::"+resultStr);
				
				if(Response.getResponseCode(resultStr).equals(Constants.RESPONSE_SUCCESS_CODE)){
					stockRequestObj = gson.fromJson(resultStr,StockRequestSummaryResponse.class); 
				}
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
			}
			return stockRequestObj;
		}
		
		
		/**
		 * @author Sahitya
		 * Verified By : 
		 * 
		 * @param customerId,emailid,goods_receipt_ref_num
		 * 
	     * This method is used to receive receipt related response data which contains stock receipt details along with item details 
	     *    from webservice to controller
	     * 
	     * @return  outlet-wise stock receipts based on provided goods_receipt_ref_num
	     */
		public StockRequestSummaryResponse getgoodsReceiptSummary(String flowUnder,String startDate,String endDate,String itemwise,String supplier){
			String resultStr=null;
			StockRequestSummaryResponse stockRequestObj =null;
			RequestBean beanObj = null;
			RestfulServiceConnection restfulConnectionObj =null;
			try{
				/*stockRequestsProxyOnj = new StockRequestsProxy();*/
				restfulConnectionObj = new RestfulServiceConnection();
				 stockRequestObj = new StockRequestSummaryResponse();
				beanObj = new RequestBean();
				beanObj.setSupplierId(supplier);
				beanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				beanObj.setStartIndex("0");
				beanObj.setStartDate(startDate);
				beanObj.setEndDate(endDate);
				beanObj.setSkuId(itemwise);
				// log.info("Request String:::"+gson.toJson(beanObj));
				/*resultStr = stockRequestsProxyOnj.getStockRequests(gson.toJson(beanObj));*/
				if(flowUnder.equals("warehouse"))
				resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_goodsreceipt_note_summary"), gson.toJson(beanObj), "GET");
				else
					resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_oulet_grn_summary"), gson.toJson(beanObj), "GET");	
				// log.info("Response String:::"+resultStr);
				
				if(Response.getResponseCode(resultStr).equals(Constants.RESPONSE_SUCCESS_CODE)){
					stockRequestObj = gson.fromJson(resultStr,StockRequestSummaryResponse.class); 
				
				}
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
			}
			return stockRequestObj;
		}
		
	
		
		
		
		public StockRequestSummaryResponse dispatchPo(String flowUnder,String ids,Boolean flag){
			String resultStr=null;
			StockRequestSummaryResponse stockRequestObj =null;
			RequestBean beanObj = null;
			RestfulServiceConnection restfulConnectionObj =null;
			try{
				/*stockRequestsProxyOnj = new StockRequestsProxy();*/
				String[] idsArray = ids.split(",");
				
				restfulConnectionObj = new RestfulServiceConnection();
				 stockRequestObj = new StockRequestSummaryResponse();
				beanObj = new RequestBean();
				List<String> featureIds = new ArrayList<String>();
				for(int i=0;i<idsArray.length;i++)
					featureIds.add(idsArray[i]);
				beanObj.setPoRefList(featureIds);
				beanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				beanObj.setStartIndex("0");
				beanObj.setToConfirm(flag);
				beanObj.setWareHouseLocation(flowUnder);
				//// log.info("Request String:::"+gson.toJson(beanObj));
				/*resultStr = stockRequestsProxyOnj.getStockRequests(gson.toJson(beanObj));*/
				////////////////////////System.out.println("Request String:dispatch_pos::"+gson.toJson(beanObj));
				resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("dispatch_pos"), gson.toJson(beanObj), "GET");
				//// log.info("Response String:::"+resultStr);
				////////////////////////System.out.println("Response String:dispatch_pos::"+resultStr);
				//stockRequestObj.setResponseMessage(Response.getResponseMessage(resultStr));	
				if(Response.getResponseCode(resultStr).equals(Constants.RESPONSE_SUCCESS_CODE)){
					stockRequestObj = gson.fromJson(resultStr,StockRequestSummaryResponse.class); 
					stockRequestObj.setResponseMessage(Response.getResponseMessage(resultStr));	
				}
				
				
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
			}
			return stockRequestObj;
		}
		
		public StockRequestSummaryResponse createGrn(String flowUnder){
			String resultStr=null;
			StockRequestSummaryResponse stockRequestObj =null;
			RequestBean beanObj = null;
			RestfulServiceConnection restfulConnectionObj =null;
			try{
				/*stockRequestsProxyOnj = new StockRequestsProxy();*/
				
				restfulConnectionObj = new RestfulServiceConnection();
				 stockRequestObj = new StockRequestSummaryResponse();
				beanObj = new RequestBean();
				beanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				beanObj.setStartIndex("0");
				beanObj.setWareHouseLocation(flowUnder);
				beanObj.setWarehouseLocation(flowUnder);
				// log.info("Request String:::"+gson.toJson(beanObj));
				/*resultStr = stockRequestsProxyOnj.getStockRequests(gson.toJson(beanObj));*/
				resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("create_grn"), gson.toJson(beanObj), "GET");
				// log.info("Response String:::"+resultStr);
				stockRequestObj.setResponseMessage(Response.getResponseMessage(resultStr));	
				if(Response.getResponseCode(resultStr).equals(Constants.RESPONSE_SUCCESS_CODE)){
					stockRequestObj = gson.fromJson(resultStr,StockRequestSummaryResponse.class); 
					stockRequestObj.setResponseMessage(Response.getResponseMessage(resultStr));	
				}
				
				
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
			}
			return stockRequestObj;
		}
		
		
		
		//added by koti to generate auto PO
		
		
		public PurchaseOrder generateAutoPO(String location){
			String resultStr=null;
			PurchaseOrder purchaseOrderObj =null;
			RequestBean beanObj = null;
			RestfulServiceConnection restfulConnectionObj =null;
			try{
				
				restfulConnectionObj = new RestfulServiceConnection();
				purchaseOrderObj = new PurchaseOrder();
				beanObj = new RequestBean();
				beanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				beanObj.setStartIndex("0");
				beanObj.setWareHouseLocation(location);
				//////////////////////System.out.println("Request String auto generated Po:::"+gson.toJson(beanObj));
				resultStr = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("generate_autopo"), gson.toJson(beanObj));
				//////////////////////System.out.println("response String auto generated Po:::"+resultStr);

				purchaseOrderObj.setResponseMessage(Response.getResponseMessage(resultStr));	
				if(Response.getResponseCode(resultStr).equals(Constants.RESPONSE_SUCCESS_CODE)){
					purchaseOrderObj = gson.fromJson(resultStr,PurchaseOrder.class); 
					purchaseOrderObj.setResponseMessage(Response.getResponseMessage(resultStr));	
				}
				
				
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
			}
			return purchaseOrderObj;
		}
		
		
		
		
		
		
		
		
		
		public List<SupplierQuotations> getSupplierQuotation(String searchName,String index,String customerId,String emailId,String location,String maxRecords,String startDate,String endDate){
			String result = null;
			List<SupplierQuotations> quotesList= new ArrayList<SupplierQuotations>();
			try {
				SupplierQuotations quotationObj=new SupplierQuotations();
				quotationObj.setStartIndex(index);
				quotationObj.setSearchCriteria(searchName);
				quotationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				quotationObj.setSupplierAddress(location);
				quotationObj.setMaxRecords(maxRecords);
				quotationObj.setStartDate(startDate);
				quotationObj.setEndDate(endDate);
				RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
				// log.info("Request String:::::::::::"+gson.toJson(quotationObj));
				result = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Supplier_Quotation"), gson.toJson(quotationObj),"GET");
				// log.info("Response String:::::::::::"+result);
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					quotationObj = gson.fromJson(result, SupplierQuotations.class);
					if(quotationObj.getSupplierQuotesList() != null && quotationObj.getSupplierQuotesList().size() > 0){
						quotationObj.getSupplierQuotesList().get(0).setTotalRecords(quotationObj.getTotalRecords());
						int slNo = Integer.parseInt(index);
						for(int i=0;i<quotationObj.getSupplierQuotesList().size();i++){
							quotationObj.getSupplierQuotesList().get(i).setSno(++slNo);
						
						}
						
					}
					quotesList = quotationObj.getSupplierQuotesList();
				}
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
		return quotesList;
		}
		
		




public SupplierQuotations getSupplierQuotationDetails(String index,String customerId,String emailId,String rfqIdStr){
			String result = null;
			SupplierQuotationResponse responseObj=new SupplierQuotationResponse();
			SupplierQuotations quotationObj=new SupplierQuotations();
			try {
				quotationObj.setStartIndex(index);
				quotationObj.setQuoteRef(rfqIdStr);
				quotationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
				// log.info("Request String:::::::::::"+gson.toJson(quotationObj));
				result = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Supplier_Quotation"), gson.toJson(quotationObj),"GET");
				// log.info("Response String:::::::::::"+result);
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					responseObj = gson.fromJson(result, SupplierQuotationResponse.class);
					quotationObj=responseObj.getSupplierQuoteObj();
					quotationObj.setCreatedDateStr(quotationObj.getCreatedDateStr().substring(0, 10));
			        quotationObj.setLastDateForQuoteStr(quotationObj.getLastDateForQuoteStr().substring(0, 10));
				}
				List<String> selectedLocationsList = new ArrayList<String>();
				if(quotationObj.getSuplierShipmentLocation() != null && quotationObj.getSuplierShipmentLocation().size() > 0)
					for(SupplierShipmentLocation quotationShipmentLocation : quotationObj.getSuplierShipmentLocation()){
						if(!selectedLocationsList.contains(quotationShipmentLocation.getShipmentLocation()))
							selectedLocationsList.add(quotationShipmentLocation.getShipmentLocation());
					}
				List<LocationBean> locationDetails = new ArrayList<LocationBean>();
				List<LocationBean> selectedLocationDetails = new ArrayList<LocationBean>();
				for(String locationId : selectedLocationsList){
					locationDetails = genericMasterServiceObj.getLocationDetails(locationId,customerId, emailId,"0","",false,true,true);
					if(locationDetails != null && locationDetails.size() > 0)
						selectedLocationDetails.add(locationDetails.get(0));
				}
				quotationObj.setSelectedLocationList(selectedLocationDetails);
			 
				
				if(quotationObj.getSupplierQuoteItems()!= null)
					for(SupplierQuoteItems quoteItems : quotationObj.getSupplierQuoteItems()){
						if(quotationObj.getSuplierShipmentLocation() != null)
							for(SupplierShipmentLocation quoteShipmentLocation : quotationObj.getSuplierShipmentLocation()){
								if(quoteShipmentLocation.getSkuId().equals(quoteItems.getSkuId())){
									quoteShipmentLocation.setItemDescription(quoteItems.getItemDescription());
									quoteShipmentLocation.setRemarks(quoteItems.getRemarks());
									quoteShipmentLocation.setUnitOfMeasurement(quoteItems.getUnitOfMeasurement());
									quoteShipmentLocation.setSupplyQty(quoteItems.getSupplyQty());
									quoteShipmentLocation.setMinQty(quoteItems.getMinQty());
									quoteShipmentLocation.setLeadTime(quoteItems.getLeadTime());
									

								}
							}
					}
				// log.info("RESPONSE::"+gson.toJson(quotationObj));
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
		return quotationObj;
			
		}

		
		



public String createSupplierQuotation(SupplierQuotations quotationObj,String customerIdStr, String emailIdStr){
			String resultStr = null;
			try {
				quotationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				quotationObj.getSupplierId();
				// log.info("Request String::::::::::::"+gson.toJson(quotationObj));
				RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
				if(quotationObj.getQuoteRef() == null || quotationObj.getQuoteRef().equals(""))
					resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_supplier_quotation"), gson.toJson(quotationObj));
				else
					resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_supplier_quote_requests"), gson.toJson(quotationObj));
				// log.info("Response String:::::::::::"+resultStr);
				String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					if(quotationObj.getQuoteRef() == null || quotationObj.getQuoteRef().equals(""))
						resultStr = AppProperties.getAppMessageByProperty("SUPPLIER_QUOTE_CREATE_SUCCESS").trim();
					else
						resultStr = AppProperties.getAppMessageByProperty("SUPPLIER_QUOTE_UPDATE_SUCCESS").trim();
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
		
		
		
		


public SupplierQuotations addQuoteItemsToSupplierQuotation(SupplierQuotations purchaseOrderObj,String customerIdStr,String emailIdStr){
			try {
//				SupplierQuotations supplierQuotations=new  SupplierQuotations();
				List<SupplierQuotations> supplierQuotesList=new ArrayList<SupplierQuotations>();
				List<SupplierQuoteItems>  purchaseItemsList = new ArrayList<SupplierQuoteItems>();
				Quotation quotationObj = getRequestForQuotationDetails("0", customerIdStr, emailIdStr,purchaseOrderObj.getQuoteRef());
				
				List<SupplierShipmentLocation> purchaseOrderShipmentLocationsList = new ArrayList<SupplierShipmentLocation>();
				List<String> selectedLocationsList = new ArrayList<String>();
//				double subTotalCost = 0.0;
//				float quantity=0,minquantity=0;
				float supplyQty=0;
				float minQty=0;
				float leadTime=0;
				if(quotationObj.getItemsList() != null)
					for(QuoteItems quoteItems : quotationObj.getItemsList()){
						SupplierQuoteItems supplierQuoteItemsObj = new SupplierQuoteItems();
						supplierQuoteItemsObj.setColor(quoteItems.getColor());
						supplierQuoteItemsObj.setItemDescription(quoteItems.getItemDescription());
						supplierQuoteItemsObj.setItemId(quoteItems.getItemId());
						supplierQuoteItemsObj.setPrice(quoteItems.getPrice());
						supplierQuoteItemsObj.setMake(quoteItems.getMake());
						supplierQuoteItemsObj.setModel(quoteItems.getModel());
						supplierQuoteItemsObj.setPluCode(quoteItems.getPluCode());
						supplierQuoteItemsObj.setUnitOfMeasurement(quoteItems.getUnitOfMeasurement());
						supplierQuoteItemsObj.setQuantity(quoteItems.getQuantity());
						supplierQuoteItemsObj.setSupplyQty(supplyQty);
						supplierQuoteItemsObj.setMinQty(minQty);;
						supplierQuoteItemsObj.setLeadTime(leadTime);
						supplierQuoteItemsObj.setSize(quoteItems.getSize());
						supplierQuoteItemsObj.setSkuId(quoteItems.getSkuId());
						supplierQuoteItemsObj.setPrice(quoteItems.getPrice());
						//purchaseOrderItemsObj.setTotalCost(quoteItems.getTotalStr());
						purchaseItemsList.add(supplierQuoteItemsObj);
						if(quotationObj.getShipmentLocationsList() != null && quotationObj.getShipmentLocationsList().size() > 0)
							for(QuoteShipmentLocation quoteShipmentLocation : quotationObj.getShipmentLocationsList()){
								SupplierShipmentLocation supplierShipmentLocationObj = new SupplierShipmentLocation();
								if(quoteItems.getSkuId().equals(quoteShipmentLocation.getSkuId())){
									//purchaseOrderShipmentLocationObj.setMake(quoteItems.getMake());
									supplierShipmentLocationObj.setPluCode(quoteItems.getPluCode());
									supplierShipmentLocationObj.setQuantity(quoteItems.getQuantity());
									//supplierQuoteItemsObj.setQuantity(quantity);
									supplierShipmentLocationObj.setRemarks(quoteItems.getRemarks());
									supplierShipmentLocationObj.setSkuId(quoteItems.getSkuId());
									supplierShipmentLocationObj.setItemDescription(quoteItems.getItemDescription());
									supplierShipmentLocationObj.setUnitOfMeasurement(quoteItems.getUnitOfMeasurement());
									supplierShipmentLocationObj.setSupplyQty(supplyQty);
									supplierQuoteItemsObj.setLeadTime(leadTime);
									supplierQuoteItemsObj.setMinQty(minQty);
									supplierQuoteItemsObj.setPrice(quoteItems.getPrice());
									//purchaseOrderShipmentLocationObj.setSkuPrice(quoteItems.getPrice());
									supplierShipmentLocationObj.setShipmentLocation(quoteShipmentLocation.getShipmentLocation());
									
									if(!selectedLocationsList.contains(supplierShipmentLocationObj.getShipmentLocation()))
										selectedLocationsList.add(supplierShipmentLocationObj.getShipmentLocation());
									purchaseOrderShipmentLocationsList.add(supplierShipmentLocationObj);
								}
							}
					}
				
				purchaseOrderObj.setSupplierQuoteItems(purchaseItemsList);
				purchaseOrderObj.setSuplierShipmentLocation(purchaseOrderShipmentLocationsList);
				List<LocationBean> locationDetails = new ArrayList<LocationBean>();
				List<LocationBean> selectedLocationDetails = new ArrayList<LocationBean>();
				for(String locationId : selectedLocationsList){
					locationDetails = genericMasterServiceObj.getLocationDetails(locationId,customerIdStr, emailIdStr,"0","",false,true,true);
					if(locationDetails != null && locationDetails.size() > 0)
						selectedLocationDetails.add(locationDetails.get(0));
				}
				purchaseOrderObj.setSelectedLocationList(selectedLocationDetails);
				purchaseOrderObj.setQuoteRef(((SupplierQuotations) supplierQuotesList).getQuoteRef());
			
				purchaseOrderObj.setReqQuoteRef(quotationObj.getQuoteRef());
				//purchaseOrderObj.getReqQuoteRef());
			//	purchaseOrderObj.setSub_total(purchaseOrderObj.getTotal_po_value()-purchaseOrderObj.getTotal_tax()-purchaseOrderObj.getShipping_cost());
			} catch(Exception e){
				e.printStackTrace();
			}
			return purchaseOrderObj;
		}
		
		
		
public String printShipmentReturnDetails(String PO_Ref,String customerId,String emailId){
	String result = null;
	ProcurementReceipt purchaseOrderObj = new ProcurementReceipt();
	RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
	try {
		purchaseOrderObj.setReceiptId(PO_Ref);
		purchaseOrderObj.setReceiptNoteId(PO_Ref);
		purchaseOrderObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		// log.info("Request String:::::::::"+gson.toJson(purchaseOrderObj));
		result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("generate_goodsreceipt_note"), gson.toJson(purchaseOrderObj), "GET");
		
		
			}catch (NoSuchElementException nse) {
		nse.printStackTrace();
		result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	} catch(Exception e){
		e.printStackTrace();
	}
	return result;
}	
		


public List<WareHouseSku> ExcelfileDataGRN(String customerId,String emailId,MultipartFile excelFile,String supplierCode,String warehouseLocation, String flowunder){
	String resultStr = null;
	List<WareHouseSku> skuList = null;
	WareHouseSku skuListObj = null;
	com.tlabs.posweb.beans.Response response = null;
	SupplierProducts supplierProducts = new SupplierProducts();
	try {
		 skuList = new ArrayList<WareHouseSku>();
		 skuListObj = new WareHouseSku();
		byte[] encodedByte =excelFile.getBytes();
		FileUploader file = new FileUploader();
		supplierProducts.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		file.setName("file");
		file.setFileType("xlsx");
		file.setDfile(encodedByte);
		
		supplierProducts.setFile(file);
		supplierProducts.setSupplierCode(supplierCode);
		//supplierProducts.setSupplierCode("4208993");
		supplierProducts.setStoreLocation(warehouseLocation);
		
	//////////System.out.println("REQ String GRN file :: "+gson.toJson(supplierProducts));
		
		ExportImportsProxy uploadSEIProxy = new ExportImportsProxy();
		resultStr = uploadSEIProxy.uploadSupplierSkus(new Gson().toJson(supplierProducts), file);
 /////      System.out.println("RESPONSE :: "+resultStr);
		
		response = gson.fromJson(resultStr, com.tlabs.posweb.beans.Response.class);
		if ( response.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)) {
			
			
			
			if(flowunder.equalsIgnoreCase("warehouse")) {
			 List<WareHouseSku> aList = new ArrayList<WareHouseSku>();
		        for (WareHouseSku x : response.getWhSkukuLists()) {
		            aList.add(x);
		        }
			
			response.setWhSkukuListsList(aList);
		
			for(int i=0;i<response.getWhSkukuListsList().size();i++) {
				for(int j=0; j<response.getWhSkukuListsList().get(i).getWarehouseSkuPriceLists().size();j++) {
					
			response.getWhSkukuListsList().get(i).setProductBatchNo(response.getWhSkukuListsList().get(i).getWarehouseSkuPriceLists().get(j).getProductBatchNo());
			response.getWhSkukuListsList().get(i).setExpiryDateStr(response.getWhSkukuListsList().get(i).getWarehouseSkuPriceLists().get(j).getExpiryDateStr());
			response.getWhSkukuListsList().get(i).setCostPrice(response.getWhSkukuListsList().get(i).getWarehouseSkuPriceLists().get(j).getCostPrice());

				}
			}
			skuList.addAll(response.getWhSkukuListsList());
			skuList.get(0).setResponseHeader(response.getResponseHeader());
			}
		}else {
			
			if(flowunder.equalsIgnoreCase("warehouse")) {
			if(response.getWhSkukuLists()!=null){
				
				 List<WareHouseSku> aList = new ArrayList<WareHouseSku>();
			        for (WareHouseSku x : response.getWhSkukuLists()) {
			            aList.add(x);
			        }
				
				response.setWhSkukuListsList(aList);
			
				for(int i=0;i<response.getWhSkukuListsList().size();i++) {
					for(int j=0; j<response.getWhSkukuListsList().get(i).getWarehouseSkuPriceLists().size();j++) {
						
				response.getWhSkukuListsList().get(i).setProductBatchNo(response.getWhSkukuListsList().get(i).getWarehouseSkuPriceLists().get(j).getProductBatchNo());
				response.getWhSkukuListsList().get(i).setCostPrice(response.getWhSkukuListsList().get(i).getWarehouseSkuPriceLists().get(j).getCostPrice());
				response.getWhSkukuListsList().get(i).setExpiryDateStr(response.getWhSkukuListsList().get(i).getWarehouseSkuPriceLists().get(j).getExpiryDateStr());
					}
				}
				skuList.addAll(response.getWhSkukuListsList());
				skuList.get(0).setResponseHeader(response.getResponseHeader());
				skuList.get(0).setUrl(response.getUrl());
			}else{
			skuListObj.setResponseHeader(response.getResponseHeader());
			skuList.add(skuListObj);
			}
			}
		}
	//	//////////////System.out.println("Final SKULIST RES:: "+gson.toJson(skuList));
		
	}catch(ConnectException ce) {
		ce.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	} catch (UnknownHostException uhe) {
		uhe.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
	} catch(RemoteException rme){
		rme.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
	} catch(Exception e){
		e.printStackTrace();
	}
	return skuList;
}




public List<Sku> ExcelfileDataGRNs(String customerId,String emailId,MultipartFile excelFile,String supplierCode,String warehouseLocation, String flowunder){
	String resultStr = null;
	List<Sku> skuList = null;
	Sku skuListObj = null;
	com.tlabs.posweb.beans.Response response = null;
	SupplierProducts supplierProducts = new SupplierProducts();
	try {
		 skuList = new ArrayList<Sku>();
		 skuListObj = new Sku();
		byte[] encodedByte =excelFile.getBytes();
		FileUploader file = new FileUploader();
		supplierProducts.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		file.setName("file");
		file.setFileType("xlsx");
		file.setDfile(encodedByte);
		
		supplierProducts.setFile(file);
		supplierProducts.setSupplierCode(supplierCode);
		//supplierProducts.setSupplierCode("4208993");
		supplierProducts.setStoreLocation(warehouseLocation);
		
	//System.out.println("REQ String GRN file :: "+gson.toJson(supplierProducts));
		
		ExportImportsProxy uploadSEIProxy = new ExportImportsProxy();
		resultStr = uploadSEIProxy.uploadSupplierSkus(new Gson().toJson(supplierProducts), file);
   //    System.out.println("RESPONSE :: "+resultStr);
		
		response = gson.fromJson(resultStr, com.tlabs.posweb.beans.Response.class);
		if ( response.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)) {
			
		
			 List<Sku> aList = new ArrayList<Sku>();
		        for (Sku x : response.getOutletSkuLists()) {
		            aList.add(x);
		        }
			
			
		
			for(int i=0;i<aList.size();i++) {
				for(SkuPriceList ss : aList.get(i).getSkuPriceLists()) {
					aList.get(i).setProductBatchNo(ss.getProductBatchNo());
					aList.get(i).setExpiryDateStr(ss.getExpiryDate());
					aList.get(i).setCostPrice(ss.getCostPrice());
					aList.get(i).setPluCode(ss.getPluCode());
				}
			}
			
			skuList.addAll(aList);
			skuList.get(0).setResponseHeader(response.getResponseHeader());
			skuList.get(0).setUrl(response.getUrl());
		}else {
			
		
			if(response.getWhSkukuLists()!=null){
				
				 List<Sku> aList = new ArrayList<Sku>();
			        for (Sku x : response.getOutletSkuLists()) {
			            aList.add(x);
			        }
				
			        for(int i=0;i<aList.size();i++) {
						for(SkuPriceList ss : aList.get(i).getSkuPriceLists()) {
							aList.get(i).setProductBatchNo(ss.getProductBatchNo());
							aList.get(i).setExpiryDateStr(ss.getExpiryDate());
							aList.get(i).setCostPrice(ss.getCostPrice());
						}
					}
				skuList.addAll(aList);
				skuList.get(0).setResponseHeader(response.getResponseHeader());
				skuList.get(0).setUrl(response.getUrl());
			}else{
			skuListObj.setResponseHeader(response.getResponseHeader());
			skuList.add(skuListObj);
			skuList.get(0).setUrl(response.getUrl());
			}
			
		}
	//	//////////////System.out.println("Final SKULIST RES:: "+gson.toJson(skuList));
		
	}catch(ConnectException ce) {
		ce.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	} catch (UnknownHostException uhe) {
		uhe.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
	} catch(RemoteException rme){
		rme.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
	} catch(Exception e){
		e.printStackTrace();
	}
	return skuList;
}


public SupplierProducts ExcelDataforGRNupdate(String customerId,String emailId,MultipartFile excelFile,String supplierCode,String warehouseLocation){
	String resultStr = null;
	List<Integer> headerPositionsList = null;
	Integer headermsg = null;
	Response response = null;
	SupplierProducts supplierProducts = new SupplierProducts();
	SupplierProducts supplierProductsresponse = new SupplierProducts();
	try {
		headerPositionsList = new ArrayList<Integer>();
		byte[] encodedByte =excelFile.getBytes();
		FileUploader file = new FileUploader();
		supplierProducts.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		file.setName("file");
		file.setFileType("xlsx");
		file.setDfile(encodedByte);
		
		supplierProducts.setFile(file);
		supplierProducts.setSupplierCode(supplierCode);
		supplierProducts.setStoreLocation(warehouseLocation);
		
		//////////////System.out.println("REQ String GRN update :: "+gson.toJson(supplierProducts));
		
		ExportImportsProxy uploadSEIProxy = new ExportImportsProxy();
		resultStr = uploadSEIProxy.getExcelHeaderPositions(new Gson().toJson(supplierProducts), file);
	//	////////////System.out.println("RESPONSE :: "+resultStr);
		
		response = gson.fromJson(resultStr, Response.class);
		if (response.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)) {
			headerPositionsList.addAll(response.getHeaderPositionsList());
			supplierProductsresponse.setHeaderPositionsList(headerPositionsList);
			supplierProductsresponse.setResponseHeader(response.getResponseHeader());
		} else {
			supplierProductsresponse.setResponseHeader(response.getResponseHeader());
			
		}
		
		
		
	}catch(ConnectException ce) {
		ce.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
	} catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	} catch (UnknownHostException uhe) {
		uhe.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
	} catch(RemoteException rme){
		rme.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
	} catch(Exception e){
		e.printStackTrace();
	}
	return supplierProductsresponse;
}


	
		
		
}
