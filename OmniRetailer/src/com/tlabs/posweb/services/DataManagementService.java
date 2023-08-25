package com.tlabs.posweb.services;

//import java.io.File;
import java.rmi.ConnectException;
import java.rmi.RemoteException;
import java.rmi.UnknownHostException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.NoSuchElementException;
//
//import javax.ws.rs.core.MediaType;
//import javax.ws.rs.core.UriBuilder;

import com.tlabs.posweb.init.AppProperties;


import org.apache.log4j.Logger;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
//import org.apache.poi.xssf.usermodel.XSSFSheet;
//import org.apache.poi.xssf.usermodel.XSSFWorkbook;
//import org.glassfish.jersey.media.multipart.MultiPart;
//import org.glassfish.jersey.media.multipart.MultiPartFeature;
//import org.glassfish.jersey.media.multipart.file.FileDataBodyPart;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.sun.jersey.api.client.Client;
//import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
//import com.sun.jersey.api.client.config.ClientConfig;
//import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.representation.Form;
//import com.sun.xml.internal.stream.Entity;
import com.technolabssoftware.www.ExportImportsProxy;
import com.technolabssoftware.www.FileUploader;
import com.tlabs.posweb.beans.Assement;
import com.tlabs.posweb.beans.BackupAndRecovery;
import com.tlabs.posweb.beans.BackupAndRecoveryResponse;
import com.tlabs.posweb.beans.BatchOperations;
import com.tlabs.posweb.beans.BatchOperationsResponse;
import com.tlabs.posweb.beans.Counter;
import com.tlabs.posweb.beans.CounterResponse;
import com.tlabs.posweb.beans.ExportImportBean;
import com.tlabs.posweb.beans.MasterDataImportsAndExportsBean;
//import com.tlabs.posweb.beans.PriceHistory;
import com.tlabs.posweb.beans.ResponseHeader;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.beans.StoreStockVerification;
import com.tlabs.posweb.util.Constants;
import com.tlabs.posweb.util.DateUtil;
import com.tlabs.posweb.util.EncryptAndDecrypt;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
import com.tlabs.posweb.util.RestfulServiceConnection;





public class DataManagementService {
	
//	private static Logger log = Logger.getLogger(MasterService.class);
	@Autowired
	SessionScope sessionScope;
	@Autowired
	private Gson gson;
	
	
	/**
	 * @author Mythri.S	
	 * for import   _call.setTimeout(2147483637); 
	 * above line has to be there for timeout exception in service soap binding file
	 * This method is used to call the uploadProductMaster method of web service and return the response
	 * 
	 */
	public String importProductData(String customerId,String emailId,MultipartFile excelFile){
		String result = null;
		try {
			//byte[] encodedByte = Base64.decode(excelBase64Str);
			byte[] encodedByte =excelFile.getBytes();
			ExportImportsProxy uploadSEIProxy = new ExportImportsProxy();
			FileUploader file = new FileUploader();
			file.setName("file");
			file.setFileType("xls");
			file.setDfile(encodedByte);
			JSONObject json = new JSONObject();
			json.put("requestHeader", new Gson().toJson(RequestHeaderUtil.getRequestHeader(sessionScope)));
			result = uploadSEIProxy.uploadProductMaster(json.toString(), file);
			// log.info(result);
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
	}
	

	
	

	private enum exportValue {
		BrandMaster, Suppliers, TaxMaster, Departments,Category,Employee,ShipmentRate,Bom,ProductGroup,PriceRange,Sku,
		WarehouseSku,StockReceipts,StockIssue,StockReturn,StockRequest,StockVerification,Ordered,Pending,Completed,Cancelled,
		shipmentsReturns,shipmentsReciept,whshipmentsReturns,whStockReceipts,WHStockVerification,Deals,Offers,SignUp,Referrals,GiftVouchers,GiftCoupons,LoyalityCards,CustomersProfile,
		CustomerComplaints,CustomerFeedback,shipmentsWHReciept;
	}
	public String exportFiles(String startDate,String endDate,String flow,String location){
		String result = "";
		try {
			////////////System.out.println("flow " + flow);
//			ExportImportsProxy uploadSEIProxy = new ExportImportsProxy();
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();

			ExportImportBean exportbean = new ExportImportBean();
			exportbean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			exportbean.setStartDate(startDate);
			exportbean.setEndDate(endDate);
			exportbean.setStoreLocation(location);
			
			// log.info(gson.toJson(exportbean));
			//////System.out.println(gson.toJson(exportbean));
			
			
			
			switch(exportValue.valueOf(flow))
			{

			case BrandMaster:
			{
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_brand_master"), gson.toJson(exportbean), "GET");
				break;
			}
			case Suppliers :
			{
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_supplier_master"), gson.toJson(exportbean), "GET");
				break;
			}
			case TaxMaster :
			{
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_tax_master"), gson.toJson(exportbean), "GET");
				break;
			}
			case Departments:
			{
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_departments_master"), gson.toJson(exportbean), "GET");
				break;
			}
			case Category :
			{
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_category_master"), gson.toJson(exportbean), "GET");
				break;
			}
			case Employee :
			{
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_employee_master"), gson.toJson(exportbean), "GET");
				break;
			}
			case ShipmentRate :
			{
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_shipmentrate_master"), gson.toJson(exportbean), "GET");
				break;
			}
			case Bom :
			{
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_bom_master"), gson.toJson(exportbean), "GET");
				break;
			}
			case ProductGroup :
			{
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_productgroup_master"), gson.toJson(exportbean), "GET");
				break;
			}
			case PriceRange :
			{
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_pricerange_master"), gson.toJson(exportbean), "GET");
				break;
			}
			case Sku :
			{
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_sku_master"), gson.toJson(exportbean), "GET");
				break;
			}
			case WarehouseSku :
			{
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_warehousesku_master"), gson.toJson(exportbean), "GET");
				break;
			}
			case StockReceipts :
			{
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_stock_reciept"), gson.toJson(exportbean), "GET");
				break;
			}
			case StockIssue :
			{
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_stock_issue"), gson.toJson(exportbean), "GET");
				break;
			}
			case StockReturn :
			{
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_stock_returns"), gson.toJson(exportbean), "GET");
				break;
			}
			case StockRequest :
			{
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_stock_request"), gson.toJson(exportbean), "GET");
				break;
			}
			case StockVerification :
			{
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_stock_verification"), gson.toJson(exportbean), "GET");
				break;
			}
			case Ordered :
			{
				exportbean.setFlowStatus("Ordered");
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_customer_orders"), gson.toJson(exportbean), "GET");
				break;
			}
			case Pending :
			{
				exportbean.setFlowStatus("Pending");
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_customer_orders"), gson.toJson(exportbean), "GET");
				break;
			}
			case Completed :
			{	
				exportbean.setFlowStatus("Completed");
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_customer_orders"), gson.toJson(exportbean), "GET");
				break;
			}
			case Cancelled :
			{
				exportbean.setFlowStatus("Cancelled");
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_customer_orders"), gson.toJson(exportbean), "GET");
				break;
			}
			case shipmentsReturns :
			{

				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_shipment_return"), gson.toJson(exportbean), "GET");
				break;
			}
			case shipmentsReciept :
			{

				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_shipment_reciept"), gson.toJson(exportbean), "GET");
				break;
			}
			
			case whshipmentsReturns :
			{

				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_WarehouseShipmentReturn"), gson.toJson(exportbean), "GET");
				break;
			}
			case whStockReceipts:
			{

				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_WarehouseStockReceipts"), gson.toJson(exportbean), "GET");
				break;
			}
			case WHStockVerification:
			{

				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_WHStockVerification"), gson.toJson(exportbean), "GET");
				break;
			}
			//
			case Deals :
			{

				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_deals"), gson.toJson(exportbean), "GET");
				break;
			}
			case Offers :
			{

				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_offers"), gson.toJson(exportbean), "GET");
				break;
			}
			case SignUp :
			{

				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_signup"), gson.toJson(exportbean), "GET");
				break;
			}
			case Referrals :
			{

				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_referral"), gson.toJson(exportbean), "GET");
				break;
			}
			case GiftVouchers :
			{

				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_gift_vouchers"), gson.toJson(exportbean), "GET");
				break;
			}
			case GiftCoupons :
			{

				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_gift_coupons"), gson.toJson(exportbean), "GET");
				break;
			}
			case LoyalityCards :
			{

				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_loyalty_card"), gson.toJson(exportbean), "GET");
				break;
			}
			case CustomersProfile :
			{

				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_customer"), gson.toJson(exportbean), "GET");
				break;
			}
			case CustomerComplaints :
			{

				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_customer_complaints"), gson.toJson(exportbean), "GET");
				break;
			}
			case CustomerFeedback :
			{
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_customer_feedback"), gson.toJson(exportbean), "GET");
				break;
			}
			case shipmentsWHReciept :
			{
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_whshipment_reciept"), gson.toJson(exportbean), "GET");
				break;
			}

			default:
			{
				return result;

			}

			}
			
			//////////System.out.println(result);
			
			// log.info(result);
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
	}
	
		
	/**
	 * @author Manasa.P	
	
	 */
	public String exportShipmentReceipt(String startDate,String endDate,String location,String type){
		String result = null;
		try {
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			//byte[] encodedByte = Base64.decode(excelBase64Str);
			ExportImportBean exportbean = new ExportImportBean();
			exportbean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			exportbean.setStartDate(startDate);
			exportbean.setEndDate(endDate);
			//exportbean.setLocation(location);
			exportbean.setStoreLocation(location);
			//////////System.out.println("Request String"+gson.toJson(exportbean));

			if(type.equalsIgnoreCase("0"))
			{
				exportbean.setFileExtension("csv");
				exportbean.setDataSeparator(',');
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_shipment_reciept"), gson.toJson(exportbean),"GET");

			}
			// log.info(gson.toJson(exportbean));
			if(type.equals("TALLY"))
			{
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Purchases"), gson.toJson(exportbean),"GET");
			}
		//////////System.out.println("Response String"+result);
			// log.info(gson.toJson(result));
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
	}

/*	public ResponseHeader importWarehouseSkuData(String customerId,String emailId,MultipartFile excelFile){
		String resultStr = null;
		Assement assementObj = null;
		try {
			byte[] encodedByte =excelFile.getBytes();
			ExportImportsProxy uploadSEIProxy = new ExportImportsProxy();
			// log.info(excelFile.getOriginalFilename()+"   "+excelFile.getName());
			FileUploader file = new FileUploader();
			ExportImportBean exportImportBean = new ExportImportBean();
			exportImportBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			file.setName("file");
			file.setFileType("xls");
			file.setDfile(encodedByte);
			if(excelFile.getOriginalFilename().toUpperCase().contains(".DWN")){
				// log.info("uploadSkuMasterUsingJDA");
				//resultStr = uploadSEIProxy.uploadSkuMasterUsingJDA(new Gson().toJson(exportImportBean), file);
			}else
			{
				resultStr = uploadSEIProxy.uploadWarehouseSkuMaster(new Gson().toJson(exportImportBean), file);
			}
			assementObj = new Gson().fromJson(resultStr, Assement.class);
		
			// log.info(resultStr);
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
		return assementObj.getResponseHeader();
	}*/
	
	
	
	public Assement importWarehouseSkuData(String customerId,String emailId,MultipartFile excelFile){
		String resultStr = null;
		Assement assementObj = null;
		try {
			byte[] encodedByte =excelFile.getBytes();
			ExportImportsProxy uploadSEIProxy = new ExportImportsProxy();
			// log.info(excelFile.getOriginalFilename()+"   "+excelFile.getName());
			FileUploader file = new FileUploader();
			ExportImportBean exportImportBean = new ExportImportBean();
			exportImportBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			file.setName("file");
			file.setFileType("xls");
			file.setDfile(encodedByte);
			//System.out.println(new Gson().toJson(exportImportBean));
			if(excelFile.getOriginalFilename().toUpperCase().contains(".DWN")){
				// log.info("uploadSkuMasterUsingJDA");
				//resultStr = uploadSEIProxy.uploadSkuMasterUsingJDA(new Gson().toJson(exportImportBean), file);
			}else
			{
				resultStr = uploadSEIProxy.uploadWarehouseSkuMaster(new Gson().toJson(exportImportBean), file);
			}
		//System.out.println(resultStr);
			assementObj = new Gson().fromJson(resultStr, Assement.class);
		
			// log.info(resultStr);
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
		return assementObj;
	}
	
	
	
	/**
	 * @author Mythri.S	
	 * 
	 * This method is used to call the uploadProductMaster method of web service and return the response.
	 * It accepts a file consisting of data to be uploaded to sku master table.
	 * 
	 */
	public Assement importSkuData(String customerId,String emailId,MultipartFile excelFile){
		String resultStr = null;
		Assement assementObj = null;
//		DataFormatter df;
//		Row row = null;
	//	String locationReq = "Location Required";
		try {
			/*byte[] encodedByte =excelFile.getBytes();
			ExportImportsProxy uploadSEIProxy = new ExportImportsProxy();
			FileUploader file = new FileUploader();
			file.setName("file");
			file.setFileType("xls");
			file.setDfile(encodedByte);
			JSONObject json = new JSONObject();
			json.put("requestHeader", new Gson().toJson(RequestHeaderUtil.getRequestHeader(sessionScope)));
//			resultStr = uploadSEIProxy.uploadSkuPriceUsingJDA(json.toString(), file);
			ExportImportBean exportImportBean = new ExportImportBean();
			exportImportBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
//			exportImportBean.setBillDate("2016-08-17 17:00:46");
			resultStr = uploadSEIProxy.uploadSkuMasterUsingJDA(new Gson().toJson(exportImportBean), file);
//			resultStr = uploadSEIProxy.exportBillTransactionInfo(new Gson().toJson(exportImportBean));
*/			/*XSSFWorkbook workBook = new XSSFWorkbook(excelFile.getInputStream());
            XSSFSheet skuMasterSheet = workBook.getSheetAt(1);
            assementObj=new Assement();
            for (int i = 1; i <= skuMasterSheet.getLastRowNum(); i++) {
				row = skuMasterSheet.getRow(i);
			
				////////////System.out.println(row.getCell(1));
			 if( row.getCell(1).equals(""))
			 {
				 assementObj.getResponseHeader().setResponseMessage(locationReq);
				 return assementObj.getResponseHeader();
			 }
            }*/
            
           // ////////////System.out.println(skuMasterSheet.getSheetName());
			byte[] encodedByte =excelFile.getBytes();
			ExportImportsProxy uploadSEIProxy = new ExportImportsProxy();
			// log.info(excelFile.getOriginalFilename()+"   "+excelFile.getName());
			FileUploader file = new FileUploader();
			ExportImportBean exportImportBean = new ExportImportBean();
			exportImportBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			file.setName("file");
			file.setFileType("xls");
			file.setDfile(encodedByte);
			
			//System.out.println(new Gson().toJson(exportImportBean));
			if(excelFile.getOriginalFilename().toUpperCase().contains(".DWN")){
				// log.info("uploadSkuMasterUsingJDA");
				resultStr = uploadSEIProxy.uploadSkuMasterUsingJDA(new Gson().toJson(exportImportBean), file);
			}else
			{
				resultStr = uploadSEIProxy.uploadSkuMaster(new Gson().toJson(exportImportBean), file);
			}
		//	System.out.println(resultStr);
			assementObj = new Gson().fromJson(resultStr, Assement.class);
			// log.info(resultStr);
		////	
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
		return assementObj;
	}
	/**
	 * @author Mythri.S	
	 * 
	 * This method is used to call the uploadSupplier method of web service and return the response.
	 * It accepts a file consisting of data to be uploaded to sku master table.
	 * 
	 */
	public Assement importsuppliersData(String customerId,String emailId,MultipartFile excelFile){
		String resultStr = null;
		Assement assementObj = null;
		try {

			byte[] encodedByte =excelFile.getBytes();
			// log.info(excelFile.getOriginalFilename()+"   "+excelFile.getName());
			FileUploader file = new FileUploader();
			ExportImportBean exportImportBean = new ExportImportBean();
			exportImportBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			file.setName("file");
			file.setFileType("xls");
			file.setDfile(encodedByte);
			// log.info(gson.toJson(exportImportBean));
            Form formData = new Form() ; 
            formData.add("param1",gson.toJson(exportImportBean)) ; 
            formData.add("uploadFile", file) ; 
            exportImportBean.setFile(file);
			ExportImportsProxy uploadSEIProxy = new ExportImportsProxy();
			resultStr = uploadSEIProxy.uploadSupplierMaster(new Gson().toJson(exportImportBean), file);
		////////////System.out.println(resultStr);
			/*	assementObj = new Gson().fromJson(resultStr, Assement.class);
           // resultStr = restfulServiceConnection.getResponseFromPost(AppProperties.getAppMessageByProperty("import_suppliers_data"), gson.toJson(exportImportBean));
			ClientResponse response = webResource.type(MediaType.APPLICATION_FORM_URLENCODED).post(ClientResponse.class,formData);
			resultStr = restfulServiceConnection.getResponseFromPost(AppProperties.getAppMessageByProperty("import_suppliers_data"), gson.toJson(exportImportBean));
			assementObj = new Gson().fromJson(resultStr, Assement.class);
			////////////System.out.println(response);
			resultStr = response.getEntity(String.class);*/
			assementObj = new Gson().fromJson(resultStr, Assement.class);
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
		return assementObj;
	}
	
	/**
	 * @author Mythri.S	
	 * 
	 * This method is used to call the uploadProductMaster method of web service and return the response.
	 * It accepts a file consisting of data to be uploaded to sku master table.
	 * 
	 */
	public Assement importtaxMasterData(String customerId,String emailId,MultipartFile excelFile){
		String resultStr= "";
		Assement assementObj = null;
		try {
			
			byte[] encodedByte =excelFile.getBytes();
			ExportImportsProxy uploadSEIProxy = new ExportImportsProxy();
			// log.info(excelFile.getOriginalFilename()+"   "+excelFile.getName());
			FileUploader file = new FileUploader();
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			ExportImportBean exportImportBean = new ExportImportBean();
			exportImportBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			file.setName("file");
			file.setFileType("xls");
			file.setDfile(encodedByte);
		
			// log.info(gson.toJson(exportImportBean));
			Client client = Client.create();	
		//	WebResource webResource = client.resource(AppProperties.getRESTFulCloudServiceURL("import_suppliers_data"));
            Form formData = new Form() ; 
            formData.add("param1",gson.toJson(exportImportBean)) ; 
            formData.add("uploadFile", file) ; 
            exportImportBean.setFile(file);
         ///   resultStr = uploadSEIProxy.uploadTaxMaster(new Gson().toJson(exportImportBean), file);
         //   System.out.println(gson.toJson(exportImportBean));
         resultStr = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("import_tax_data"), gson.toJson(exportImportBean));
        	
     //  System.out.println(resultStr);
            
            /*ClientResponse response = webResource.type("application/json").post(ClientResponse.class,gson.toJson(exportImportBean));*/
			/*resultStr = restfulServiceConnection.getResponseFromPost(AppProperties.getAppMessageByProperty("import_suppliers_data"), gson.toJson(exportImportBean));
			assementObj = new Gson().fromJson(resultStr, Assement.class);*/
            assementObj = new Gson().fromJson(resultStr, Assement.class);
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
		return assementObj;
	}
	
	
	
	
	/**
	 * @author Mythri.S	
	 * 
	 * This method is used to call the uploadProductMaster method of web service and return the response.
	 * It accepts a file consisting of data to be uploaded to sku master table.
	 * 
	 */
	/*public BackupAndRecoveryResponse getbackup(String index){
		String resultStr = null;
		BackupAndRecoveryResponse response = null;
		try {
			BackupAndRecovery backup = new BackupAndRecovery();
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			backup.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			backup.setStartIndex(index);
            resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_backup_details"), gson.toJson(backup),"GET");
            response = gson.fromJson(resultStr,BackupAndRecoveryResponse.class); 
			if(response.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}  catch(Exception e){
			e.printStackTrace();
		}
		return response;
	}
	*/
	
	/**
	 * @author Mythri.S	
	 * 
	 * This method is used to call the uploadProductMaster method of web service and return the response.
	 * It accepts a file consisting of data to be uploaded to sku master table.
	 * 
	 */
	public Assement importbrandMasterData(String customerId,String emailId,MultipartFile excelFile){
		String resultStr = null;
		Assement assementObj = null;
		try {

			byte[] encodedByte =excelFile.getBytes();
			// log.info(excelFile.getOriginalFilename()+"   "+excelFile.getName());
			FileUploader file = new FileUploader();
			ExportImportBean exportImportBean = new ExportImportBean();
			exportImportBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			file.setName("file");
			file.setFileType("xls");
			file.setDfile(encodedByte);
            exportImportBean.setFile(file);
        	ExportImportsProxy uploadSEIProxy = new ExportImportsProxy();
        	//System.out.println("Reqq::::::::"+ new Gson().toJson(exportImportBean));
			resultStr = uploadSEIProxy.importBrandMaster(new Gson().toJson(exportImportBean), file);
			//System.out.println("Ress::::::::"+ resultStr);
            assementObj = new Gson().fromJson(resultStr, Assement.class);
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
		return assementObj;
	}
	
	
	/**
	 * @author Mythri.S	
	 * 
	 * This method is used to call the uploadProductMaster method of web service and return the response.
	 * It accepts a file consisting of data to be uploaded to sku master table.
	 * 
	 */
	public Assement importemployeeMasterData(String customerId,String emailId,MultipartFile excelFile){
		String resultStr = null;
		Assement assementObj = null;
		try {

			byte[] encodedByte =excelFile.getBytes();
			// log.info(excelFile.getOriginalFilename()+"   "+excelFile.getName());
			FileUploader file = new FileUploader();
			ExportImportBean exportImportBean = new ExportImportBean();
			exportImportBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			file.setName("file");
			file.setFileType("xls");
			file.setDfile(encodedByte);
            exportImportBean.setFile(file);
        	ExportImportsProxy uploadSEIProxy = new ExportImportsProxy();
        //	System.out.println("reqq:::::::"+new Gson().toJson(exportImportBean));
			resultStr = uploadSEIProxy.importEmployeeMaster(new Gson().toJson(exportImportBean), file);
			//System.out.println(resultStr);
            assementObj = new Gson().fromJson(resultStr, Assement.class);
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
		return assementObj;
	}
	
	
	/**
	 * @author Mythri.S	
	 * 
	 * This method is used to call the uploadProductMaster method of web service and return the response.
	 * It accepts a file consisting of data to be uploaded to sku master table.
	 * 
	 */
	public Assement importgroupMasterData(String customerId,String emailId,MultipartFile excelFile){
		String resultStr = null;
		Assement assementObj = null;
		try {

			byte[] encodedByte =excelFile.getBytes();
			// log.info(excelFile.getOriginalFilename()+"   "+excelFile.getName());
			FileUploader file = new FileUploader();
			ExportImportBean exportImportBean = new ExportImportBean();
			exportImportBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			file.setName("file");
			file.setFileType("xls");
			file.setDfile(encodedByte);
            exportImportBean.setFile(file);
        	ExportImportsProxy uploadSEIProxy = new ExportImportsProxy();
        //	System.out.println(new Gson().toJson(exportImportBean));
			resultStr = uploadSEIProxy.importGroupMasterData(new Gson().toJson(exportImportBean), file);
		//	System.out.println(resultStr);
            assementObj = new Gson().fromJson(resultStr, Assement.class);
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
		return assementObj;
	}
	
	/**
	 * @author Mythri.S	
	 * 
	 * This method is used to call the uploadProductMaster method of web service and return the response.
	 * It accepts a file consisting of data to be uploaded to sku master table.
	 * 
	 */
	public String importStockReceiptData(String customerId,String emailId,MultipartFile excelFile){
		String resultStr = null;
		try {
			byte[] encodedByte =excelFile.getBytes();
			ExportImportsProxy uploadSEIProxy = new ExportImportsProxy();
			FileUploader file = new FileUploader();
			ExportImportBean exportImportBean = new ExportImportBean();
			file.setName("file");
			file.setFileType("xls");
			file.setDfile(encodedByte);
			exportImportBean.setFile(file);
			JSONObject json = new JSONObject();
			json.put("requestHeader", new Gson().toJson(RequestHeaderUtil.getRequestHeader(sessionScope)));
			//System.out.println(new Gson().toJson(exportImportBean));
			/*resultStr = uploadSEIProxy.uploadStockReceipt(json.toString(), file);*/
			resultStr = uploadSEIProxy.uploadStockReceipt( new Gson().toJson(exportImportBean), file);
			//System.out.println(resultStr);
			// log.info(resultStr);
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
		return resultStr;
	}
	
	/**
	 * @author chaithanya.v
	 * 
	 *This method is used to call create batch operations  method of web service and return the response
	 *
	 **/
	public String batchOperations(BatchOperations batchoperations){
		String resultStr = null;
		try {
			batchoperations.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String::::::::::::"+gson.toJson(batchoperations));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("customer_import"), gson.toJson(batchoperations));
			// log.info("Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("PACKAGE_CREATE_SUCCESS").trim();
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
	 * @author Manasa.P
	 * created On:18-May-17
	 * This method is used to call the getBatchOperation method of web service and return the response.
	 * 
	 */
	
	public BatchOperationsResponse getPackages(String customerIdStr,String emailIdStr,String index,String maxRecords,String searchCriteria){
		String resultStr = null;
		BatchOperationsResponse batchOperationsResponse = new BatchOperationsResponse();
		try {
			BatchOperations batchOperations = new BatchOperations();
			batchOperations.setMaxRecords(maxRecords);
			batchOperations.setStartIndex(index);
			batchOperations.setMaxRecords("10");
			//outletDayOpen.setSearchCriteria(searchCriteria);
			batchOperations.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//////////////System.out.println(gson.toJson(batchOperations));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			// log.info("request String:::::::::::"+gson.toJson(batchOperations));
			resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_batchoperations"), gson.toJson(batchOperations),"GET");
			// log.info("Response String:::::::::::"+resultStr);
			//////////////System.out.println("Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				batchOperationsResponse =gson.fromJson(resultStr,BatchOperationsResponse.class );
				//batchOperationsResponse.getBatchOperationsList();
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return batchOperationsResponse;
	}
	
	




	
	






	/**
	 * @author chaithanya.v
	 * 
	 *This method is used to call create batch operations  method of web service and return the response
	 *
	 **/

	
	/*public String createbackup(String type){
		String resultStr = null;
		try {
			BackupAndRecovery backup = new BackupAndRecovery();
			backup.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			backup.setBackUpType(type);
			// log.info("Request String::::::::::::"+gson.toJson(backup));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_backup"), gson.toJson(backup));
			// log.info("Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("BACKUP_CREATE_SUCCESS").trim();
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
	}	*/
	
	
	
	
	public String createbackup(String type){
		String resultStr = null;
		try {
			BackupAndRecovery backup = new BackupAndRecovery();
			backup.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			backup.setBackUpType(type);
		//	System.out.println("Request String::::::::::::"+gson.toJson(backup));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_backup"), gson.toJson(backup));
		//	System.out.println("Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
		
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("BACKUP_CREATE_SUCCESS").trim();
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
	
	
	public BackupAndRecoveryResponse getbackup(String index,String backupDateStr,String backUpType){
		String resultStr = null;
		BackupAndRecoveryResponse response = null;
		try {
			BackupAndRecovery backup = new BackupAndRecovery();
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			backup.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			backup.setStartIndex(index);
			backup.setBackupDateStr(backupDateStr);
			backup.setBackUpType(backUpType);
			
            resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_backup_details"), gson.toJson(backup),"GET");
       //    System.out.println("request::::"+gson.toJson(backup));
      ////   System.out.println("response:::getbackup:::::" + resultStr );
         response = gson.fromJson(resultStr,BackupAndRecoveryResponse.class); 
         
			if(response.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}  catch(Exception e){
			e.printStackTrace();
		}
		return response;
	}
	
	
	/**
	 * 
	 * added on 30-dec
	 * @author chaithanya.v
	 * 
	 * This method is used to call the uploadProductMaster method of web service and return the response.
	 * It accepts a file consisting of data to be uploaded to sku master table.
	 * 
	 */
	public ResponseHeader importPriceListData(String customerId,String emailId,MultipartFile excelFile){
		String resultStr = null;
		Assement assementObj = null;
		try {
			byte[] encodedByte =excelFile.getBytes();
			ExportImportsProxy uploadSEIProxy = new ExportImportsProxy();
			FileUploader file = new FileUploader();
			file.setName("file");
			file.setFileType("xls");
			file.setDfile(encodedByte);
			ExportImportBean exportImportBean = new ExportImportBean();
			exportImportBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			if(excelFile.getOriginalFilename().toUpperCase().contains(".DWN")){
				// log.info("uploadSkupricelistUsingJDA");
				resultStr = uploadSEIProxy.uploadSkuPriceUsingJDA(new Gson().toJson(exportImportBean), file);
			}else
			{
				resultStr = uploadSEIProxy.uploadSkuPriceInfo(new Gson().toJson(exportImportBean), file);
			}
			assementObj = new Gson().fromJson(resultStr, Assement.class);
			// log.info(resultStr);
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
		return assementObj.getResponseHeader();
	}	/**
	 * 
	 * added on 30-dec
	 * @author kalyan
	 * 
	 * This method is used to call the uploadProductMaster method of web service and return the response.
	 * It accepts a file consisting of data to be uploaded to sku master table.
	 * 
	 */
	public Assement importskuEansData(String customerId,String emailId,MultipartFile excelFile){
		String resultStr = null;
		Assement assementObj = null;
		try {
			byte[] encodedByte =excelFile.getBytes();
			ExportImportsProxy uploadSEIProxy = new ExportImportsProxy();
			FileUploader file = new FileUploader();
			file.setName("file");
			file.setFileType("xls");
			file.setDfile(encodedByte);
			ExportImportBean exportImportBean = new ExportImportBean();
			exportImportBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//System.out.println(new Gson().toJson(exportImportBean));
			if(excelFile.getOriginalFilename().toUpperCase().contains(".DWN")){
				// log.info("uploadskuEansUsingJDA");
				resultStr = uploadSEIProxy.uploadSkuEansUsingJDA(new Gson().toJson(exportImportBean), file);
			}else
			{
				//resultStr = uploadSEIProxy.uploadSkuPriceInfo(new Gson().toJson(exportImportBean), file);
			}
			//System.out.println(resultStr);
			assementObj = new Gson().fromJson(resultStr, Assement.class);
			// log.info(resultStr);
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
		return assementObj;
	}
	
	
	/**
	 * 
	 * added on 30-dec
	 * @author kalyan
	 * 
	 * This method is used to call the uploadProductMaster method of web service and return the response.
	 * It accepts a file consisting of data to be uploaded to sku master table.
	 * 
	 */
	public ResponseHeader importbillsData(String customerId,String emailId,MultipartFile excelFile){
		String resultStr = null;
		Assement assementObj = null;
		try {
			RestfulServiceConnection restfulServiceConnection= new RestfulServiceConnection();
			ExportImportBean exportImportBean = new ExportImportBean();
			exportImportBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//System.out.println("Reqq:::::"+gson.toJson(exportImportBean));
			if(excelFile.getOriginalFilename().toUpperCase().contains(".DWN")){
			}else
			{
				MasterDataImportsAndExportsBean result = restfulServiceConnection.uploadFile(customerId,excelFile);
				exportImportBean.setUploadedFilePath(result.getUploadedFilePath());
				resultStr =  restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("import_billing_Data"), gson.toJson(exportImportBean),"GET");
				
			}
			//System.out.println("Ress:::::"+gson.toJson(resultStr));
			assementObj = new Gson().fromJson(resultStr, Assement.class);
			// log.info(resultStr);
		}catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return assementObj.getResponseHeader();
	}
	
	
	
	/**
	 * @author Chaithanya.v
	 * 
	 * This method is used to call the uploadProductMaster method of web service and return the response
	 * 
	 */
	public String exportBills(String startDate,String endDate,String status,String location,String type,Boolean isftpreqired,String server,String port,String loginId,String password){
		String result = null;
		try {
			//byte[] encodedByte = Base64.decode(excelBase64Str);
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			//ExportImportsProxy uploadSEIProxy = new ExportImportsProxy();
			ExportImportBean exportbean = new ExportImportBean();
			exportbean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			exportbean.setStartDate(startDate);
			if(type.equalsIgnoreCase("CSV"))
			{
				exportbean.setFileExtension("csv");
				exportbean.setDataSeparator(',');
			}
			if(isftpreqired)
			{
				exportbean.setIsFtpUploadRequired(isftpreqired);
				exportbean.setServer(server);
				exportbean.setPortNo(Integer.parseInt(port));
				exportbean.setUserId(loginId);
				if(password!=null)
				exportbean.setPassword(EncryptAndDecrypt.encrypt(password));
			}
			exportbean.setEndDate(endDate);
			exportbean.setStatus(status);
			exportbean.setStoreLocation(location);
			// log.info(gson.toJson(exportbean));
			//////////System.out.println(gson.toJson(exportbean));
			if(type.equals("JDA"))
			{
			//result = uploadSEIProxy.exportBills(gson.toJson(exportbean));
			result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("export_bills"), gson.toJson(exportbean),"GET");
			}
			else if(type.equals("TALLY"))
			{
			result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Tally_Sales"), gson.toJson(exportbean),"GET");
			}else if(type.equals("SAP")){
				result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Sap_Sales"), gson.toJson(exportbean),"GET");
			}
			else
				result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("export_billings"), gson.toJson(exportbean),"GET");
			//result = uploadSEIProxy.exportBillings(gson.toJson(exportbean));	
			//// log.info(gson.toJson(result));
			////////////System.out.println(result);
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
	}
	
	
	public String exportBillsSapOnline(String status,String startDate,String endDate,String location){
		String result = null;
		try {

			ExportImportBean exportbean = new ExportImportBean();
			exportbean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			exportbean.setStartDate(startDate);
			
			
			exportbean.setEndDate(endDate);
			exportbean.setStore_location(location);

			//////////System.out.println("sap online request"+gson.toJson(exportbean));
			
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			if(!status.equalsIgnoreCase("return")){
				result = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("sap_online_service"), gson.toJson(exportbean));

			}else{
				result = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_SalesReturnBatch"), gson.toJson(exportbean));

			}
			
			
			//////////System.out.println("Sap ONline response:::::::::::::::::::::"+result);
		
		} catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	
	public String exportBillsSapIdocs(String status,String startDate,String endDate,String location){
		String result = null;
		try {

			ExportImportBean exportbean = new ExportImportBean();
			exportbean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			exportbean.setStartDate(startDate);
			exportbean.setEndDate(endDate);
			exportbean.setStore_location(location);

			////System.out.println("SAP IDOCS Request String :: "+gson.toJson(exportbean));
			
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			result = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Sap_Idocs_Sales"), gson.toJson(exportbean),"GET");
			
			////System.out.println("SAP Idocs Response:::::::::"+result);
		
		} catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	
	/**
	 * @author Chaithanya.v
	 * 
	 * This method is used to call the uploadProductMaster method of web service and return the response
	 * 
	 */
	public String exportMasterData(String startDate,String endDate,String status){
		String result = null;
		try {
			//byte[] encodedByte = Base64.decode(excelBase64Str);
			//ExportImportsProxy uploadSEIProxy = new ExportImportsProxy();
			MasterDataImportsAndExportsBean exportbean = new MasterDataImportsAndExportsBean();
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			exportbean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			exportbean.setStartDate(startDate);
			exportbean.setEndDate(endDate);
			exportbean.setFileExtension("csv");
			exportbean.setDataSeparator(',');
			// log.info(gson.toJson(exportbean));
			if(status.equals("brand"))
			result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_brand_master"), gson.toJson(exportbean), "GET");
			if(status.equals("tax"))
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_tax_master"), gson.toJson(exportbean), "GET");
			if(status.equals("supplier"))
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_supplier_master"), gson.toJson(exportbean), "GET");
			if(status.equals("sku"))
				result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("export_skumaster"), gson.toJson(exportbean), "GET");

				/*result = uploadSEIProxy.exportSkuMasterData(gson.toJson(exportbean));
			// log.info(gson.toJson(result));*/
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}  catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	/**
	 * @author Chaithanya.v
	 * 
	 * This method is used to call the uploadProductMaster method of web service and return the response
	 * 
	 */
	public String exportStockReceipts(String startDate,String endDate,String location){
		String result = null;
		try {
			//byte[] encodedByte = Base64.decode(excelBase64Str);
			//ExportImportsProxy uploadSEIProxy = new ExportImportsProxy();
			ExportImportBean exportbean = new ExportImportBean();
			exportbean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			exportbean.setStartDate(startDate);
			exportbean.setEndDate(endDate);
			exportbean.setLocation(location);
			exportbean.setFileExtension("csv");
			exportbean.setDataSeparator(',');
			
			/*// log.info(gson.toJson(exportbean));
			result = uploadSEIProxy.exportStockReceipts(gson.toJson(exportbean));
			// log.info(gson.toJson(result));*/
			result = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("export_stock_receipts"), gson.toJson(exportbean), "GET");

			
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
	}
	
	
	/**
	 * @author Chaithanya.v
	 * 
	 * This method is used to call the uploadProductMaster method of web service and return the response
	 * 
	 */
	public String exportStockIssue(String startDate,String endDate,String location){
		String result = null;
		try {
			//byte[] encodedByte = Base64.decode(excelBase64Str);
			//ExportImportsProxy uploadSEIProxy = new ExportImportsProxy();
			ExportImportBean exportbean = new ExportImportBean();
			exportbean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			exportbean.setStartDate(startDate);
			exportbean.setEndDate(endDate);
			exportbean.setLocation(location);
			exportbean.setFileExtension("csv");
			exportbean.setDataSeparator(',');
			
			/*// log.info(gson.toJson(exportbean));
			result = uploadSEIProxy.exportStockIssues(gson.toJson(exportbean));
			// log.info(gson.toJson(result));*/
			
			result = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("export_stock_issues"), gson.toJson(exportbean), "GET");
			
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
	}
	
	
	/**
	 * @author Chaithanya.v
	 * 
	 * This method is used to call the uploadProductMaster method of web service and return the response
	 * 
	 */
	public String exportStockRequest(String startDate,String endDate,String location){
		String result = null;
		try {
			//byte[] encodedByte = Base64.decode(excelBase64Str);
			//ExportImportsProxy uploadSEIProxy = new ExportImportsProxy();
			ExportImportBean exportbean = new ExportImportBean();
			exportbean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			exportbean.setStartDate(startDate);
			exportbean.setEndDate(endDate);
			exportbean.setLocation(location);
			exportbean.setFileExtension("csv");
			exportbean.setDataSeparator(',');
			
			
			/*// log.info(gson.toJson(exportbean));
			result = uploadSEIProxy.exportStockRequests(gson.toJson(exportbean));
			// log.info(gson.toJson(result));
			////////////System.out.println((result));
*/			result = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("export_stock_requests"), gson.toJson(exportbean), "GET");

			
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
	}
	
	/**
	 * @author Chaithanya.v
	 * 
	 * This method is used to call the uploadProductMaster method of web service and return the response
	 * 
	 */
	public String exportStockReturn(String startDate,String endDate,String location){
		String result = null;
		try {
			//byte[] encodedByte = Base64.decode(excelBase64Str);
			//ExportImportsProxy uploadSEIProxy = new ExportImportsProxy();
			ExportImportBean exportbean = new ExportImportBean();
			exportbean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			exportbean.setStartDate(startDate);
			exportbean.setEndDate(endDate);
			exportbean.setLocation(location);
			exportbean.setFileExtension("csv");
			exportbean.setDataSeparator(',');
			
			
			/*// log.info(gson.toJson(exportbean));
			result = uploadSEIProxy.exportStockReturns(gson.toJson(exportbean));
			// log.info(gson.toJson(result));*/
			
			result = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("export_stock_return"), gson.toJson(exportbean), "GET");
	
			
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
	}
	/**
	 * @author Chaithanya.v
	 * 
	 * This method is used to call the exportSkuMaster method of web service and return the response
	 * 
	 */
	public String exportSkuMaster(String startDate,String endDate,String fileType,String location
			){
		String result = null;
		try {
			//byte[] encodedByte = Base64.decode(excelBase64Str);
			//ExportImportsProxy uploadSEIProxy = new ExportImportsProxy();
			ExportImportBean exportbean = new ExportImportBean();
			exportbean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			exportbean.setStartDate(startDate);
			exportbean.setEndDate(endDate);
			if(fileType.equals("warehouse"))
				exportbean.setWarehouseExport(true);
			exportbean.setStoreLocation(location);
			exportbean.setFileExtension("csv");
			exportbean.setDataSeparator(',');
			// log.info(gson.toJson(exportbean));
			//////////////System.out.println(gson.toJson(exportbean));
			/*result = uploadSEIProxy.exportSkuMasterData(gson.toJson(exportbean));
			// log.info(result);*/
			result = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("export_skumaster"), gson.toJson(exportbean), "GET");

			
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
	}
	
	
	
	/**
	 * @author : vijay
	 * @date : 15-nov-18
	 * @desc : This method is used to call the method of web service and return the response
	 * @note : service call changes with respectively on switch case input 
	 */
	
	private enum importValue {
		customerImport,coupons, giftVouchers,loyaltyCards,memberships,
		wallets;
	}
	
	public MasterDataImportsAndExportsBean uploadData(String filePath,String flow,String customerId,String emailId){
		String result = null;
		MasterDataImportsAndExportsBean masterDataImportsAndExportsBean=new MasterDataImportsAndExportsBean();
		try {
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			masterDataImportsAndExportsBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			masterDataImportsAndExportsBean.setUploadedfilePath(filePath);
			// log.info("Request String::::::::::::" + gson.toJson(masterDataImportsAndExportsBean));
		//System.out.println("Request String::::::::::::" + gson.toJson(masterDataImportsAndExportsBean));
			masterDataImportsAndExportsBean.setStartDate(DateUtil.getDateFromYYYYMMDDHHMMSS(new Date()));
			switch (importValue.valueOf(flow)) 
			{
				case customerImport: 
				{
					result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("customer_import"),gson.toJson(masterDataImportsAndExportsBean), "POST");
					break;
				}
				case coupons: 
				{
					result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("coupons_import"),gson.toJson(masterDataImportsAndExportsBean), "POST");
					break;
				}
				case loyaltyCards: 
				{
					result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("loyalty_cards_import"),gson.toJson(masterDataImportsAndExportsBean), "POST");
					break;
				}
				
				case giftVouchers: 
				{
					result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("gift_vouchers_import"),gson.toJson(masterDataImportsAndExportsBean), "POST");
					break;
				}
				case memberships: 
				{
					result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("import_memberships"),gson.toJson(masterDataImportsAndExportsBean), "POST");
					break;
				}
				
				case wallets: 
				{
					result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("import_wallets"),gson.toJson(masterDataImportsAndExportsBean), "POST");
					break;
				}
				
				
				
				default: {
					break;

				}
			}
	//	System.out.println("result:" +result);
			masterDataImportsAndExportsBean = new Gson().fromJson(result, MasterDataImportsAndExportsBean.class);
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
		return masterDataImportsAndExportsBean;
	}
	
	
	public CounterResponse uploadDataforPromotion(String customerId){
		String result = null;
		Counter counter=new Counter();
		CounterResponse counterResponse = null;
		try {
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			counter.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			counter.setCustomerId(customerId);
		
	     //   System.out.println(gson.toJson(counter));
	
	       result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("promotion_posting"), gson.toJson(counter));

			
			//System.out.println("result:" +result);
			counterResponse = gson.fromJson(result,CounterResponse.class);
		
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
		return counterResponse;
	}
	
	
	/**
	 * @author mk
	 * 
	 * This method is used to save batch related services in DB
	 * 
	 */
	public String updateBatch(BatchOperations batchOperationsObj,String customerIdStr,String emailIdStr){
	    String result = null;
	    try{
	    	BatchOperationsResponse	batchOperationsResponse = new BatchOperationsResponse();
	    	batchOperationsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			////System.out.println("REQ UPDATE BATCH ::"+gson.toJson(batchOperationsObj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			result = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_Batch"), gson.toJson(batchOperationsObj));
			////System.out.println("RESPONSE ::"+result);
			
			batchOperationsResponse = gson.fromJson(result,BatchOperationsResponse.class);
			if(batchOperationsResponse.getResponseHeader().getResponseCode().equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("BATCH_UPDATE_SUCCESS").trim();
			}
			else{
				result = batchOperationsResponse.getResponseHeader().getResponseMessage();
			}
		}catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		}
	    return result;
	}
	
	
	
	/*public String run(BatchOperations batchOperationsObj,String customerIdStr,String emailIdStr){
        String result = null;
        try{
                BatchOperationsResponse        batchOperationsResponse = new BatchOperationsResponse();
                batchOperationsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
                     System.out.println("REQ UPDATE BATCH ::"+gson.toJson(batchOperationsObj));
                    RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
                    result = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("run_Batch"), gson.toJson(batchOperationsObj));
                     System.out.println("RESPONSE ::"+result);
                    batchOperationsResponse = gson.fromJson(result,BatchOperationsResponse.class);
                    if(batchOperationsResponse.getResponseHeader().getResponseCode().equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
                            result = batchOperationsResponse.getResponseHeader().getResponseMessage();
                    }
                    else{
                            result = batchOperationsResponse.getResponseHeader().getResponseMessage();
                    }
            }catch (NoSuchElementException nse) {
                    nse.printStackTrace();
                    result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
            } catch(Exception e){
                    e.printStackTrace();
                    result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
            }
        return result;
    }*/
	
	
	
	public String run(BatchOperations batchOperationsObj,String customerIdStr,String emailIdStr){
        String result = null;
        try{
                BatchOperationsResponse  batchOperationsResponse = new BatchOperationsResponse();
                batchOperationsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
     // System.out.println("REQ UPDATE BATCH ::"+gson.toJson(batchOperationsObj));
                    RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
                    result = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("run_Batch"), gson.toJson(batchOperationsObj));
      // System.out.println("RESPONSE ::"+result);
                    batchOperationsResponse = gson.fromJson(result,BatchOperationsResponse.class);
                    if(batchOperationsResponse.getResponseHeader().getResponseCode().equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
                            result = batchOperationsResponse.getResponseHeader().getResponseMessage();
                    }
                    else{
                            result = batchOperationsResponse.getResponseHeader().getResponseMessage();
                    }
                    
            }catch (NoSuchElementException nse) {
                    nse.printStackTrace();
                    result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
            } catch(Exception e){
                    e.printStackTrace();
                    result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
            }
        return result;
    }
    
	
	
    

	/**
	 * @author mk
	 * 
	 * This method is used to save batch related services in DB
	 * 
	 */
	public String createBatch(BatchOperations batchOperationsObj,String customerIdStr,String emailIdStr){
	    String result = null;
	    try{
	    	BatchOperationsResponse	batchOperationsResponse = new BatchOperationsResponse();
	    	batchOperationsObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
		///	System.out.println("REQ CREATE BATCH ::"+gson.toJson(batchOperationsObj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			result = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_Batch"), gson.toJson(batchOperationsObj));
		//	System.out.println("RES CREATE BATCH ::"+result);
			
			batchOperationsResponse = gson.fromJson(result,BatchOperationsResponse.class);
			if(batchOperationsResponse.getResponseHeader().getResponseCode().equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("BATCH_CREATE_SUCCESS").trim();
			}
			else{
				result = batchOperationsResponse.getResponseHeader().getResponseMessage();
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
			result = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		}
	    return result;
	}
	
	/**
	 * @author mk
	 * 
	 * This method is used to get batch related services in DB
	 * 
	 */
	public BatchOperationsResponse getBatchOperations(String customerIdStr,String emailIdStr,String index,String maxRecords,String searchCriteria){
		String resultStr = null;
		BatchOperationsResponse batchOperationsResponse = null;
		try {
			BatchOperations batchOperations = new BatchOperations();
			batchOperations.setStartIndex(index);
			batchOperations.setMaxRecords(maxRecords);
			batchOperations.setSearchCriteria(searchCriteria);
			batchOperations.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//System.out.println("Request String GET BATCH ::"+gson.toJson(batchOperations));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Batch_Details"), gson.toJson(batchOperations),"GET");
			////System.out.println("Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			batchOperationsResponse =gson.fromJson(resultStr,BatchOperationsResponse.class);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				batchOperationsResponse.getBatchOperationsList();
				batchOperationsResponse.getTotalRecords();
			}else{
				batchOperationsResponse.getBatchOperationsList();
				batchOperationsResponse.getResponseHeader().getResponseMessage();
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return batchOperationsResponse;
	}
	
	
	/**
	 * @author mk
	 * 
	 * This method is used to get batch related services in DB
	 * 
	 */
	public BatchOperationsResponse getBatchOperationDetails(String customerIdStr,String emailIdStr,String batchId) {
		BatchOperations batchOperations = new BatchOperations();
		BatchOperationsResponse	batchOperationsResponse = null;
		String resultStr=null;
		try{
			batchOperations.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			batchOperations.setStartIndex("0");
			batchOperations.setBatch_id(batchId);
		RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
		//System.out.println("Request String EDIT::::::::::::"+gson.toJson(batchOperations));
		resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Batch_Details"), gson.toJson(batchOperations),"GET");
		//System.out.println("Response String:::::::::::"+resultStr);
		String responseCode = Response.getResponseCode(resultStr);
		batchOperationsResponse =gson.fromJson(resultStr,BatchOperationsResponse.class );
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			batchOperationsResponse.getBatchOperationsList();
			
			}
		}
	 catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	} catch(Exception e){
		e.printStackTrace();
	}
		
		return batchOperationsResponse;
		
	}
	
	/**
	 * @author mk
	 * 
	 * This method is used to get batch related services in DB
	 * 
	 */
	public String deleteBatchOperation(String customerId,String emailId,String ids) {
		String result = null;
		try {
			BatchOperations batchOperations = new BatchOperations();
			batchOperations.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			String[] idsArray = ids.split(",");
			List<String> batchesList = new ArrayList<String>();
			for(int i=0;i<idsArray.length;i++)
				batchesList.add(idsArray[i]);
			batchOperations.setDeleteBatchIDList(batchesList);
			////System.out.println("Request String BATCH DELETE :: "+gson.toJson(batchOperations));
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			result = restfulServiceConnection.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("delete_Batch"), gson.toJson(batchOperations));
			////System.out.println("Response String :: "+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("BATCH_DELETE_SUCCESS").trim();
			else{
				batchOperations = gson.fromJson(result, BatchOperations.class);
				result = batchOperations.getResponseHeader().getResponseMessage();
				
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
	}

	
}
