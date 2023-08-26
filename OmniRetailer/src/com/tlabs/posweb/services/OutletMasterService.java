package com.tlabs.posweb.services;

import java.rmi.ConnectException;
import java.rmi.RemoteException;
import java.rmi.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Set;

import com.tlabs.posweb.init.AppProperties;
import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import com.technolabssoftware.www.ExportImportsProxy;
import com.technolabssoftware.www.FileUploader;
import com.technolabssoftware.www.ProductMasterProxy;
import com.technolabssoftware.www.SupplierServiceProxy;
import com.technolabssoftware.www.UtilityMasterServiceProxy;
import com.tlabs.posweb.beans.ApplyCampaignsRequest;
import com.tlabs.posweb.beans.BillOfMaterial;
import com.tlabs.posweb.beans.BillOfMaterialResponse;
//import com.tlabs.posweb.beans.Billing;
import com.tlabs.posweb.beans.DayOpenSummary;
import com.tlabs.posweb.beans.EventMaster;
//import com.tlabs.posweb.beans.ExportImportBean;
import com.tlabs.posweb.beans.Group;
import com.tlabs.posweb.beans.GroupChild;
import com.tlabs.posweb.beans.HSNMaster;
import com.tlabs.posweb.beans.HomePageGroup;
import com.tlabs.posweb.beans.MachineAndEquipmentMaster;
import com.tlabs.posweb.beans.Menu;
import com.tlabs.posweb.beans.NearestLocationResponse;
import com.tlabs.posweb.beans.OutletInfo;
import com.tlabs.posweb.beans.OutletSettings;
import com.tlabs.posweb.beans.OutletSyncSettings;
import com.tlabs.posweb.beans.PriceRangeMaster;
import com.tlabs.posweb.beans.PriceRangeResponse;
import com.tlabs.posweb.beans.ProductCategoryBean;
import com.tlabs.posweb.beans.ProductMaster;
import com.tlabs.posweb.beans.ProductStores;
import com.tlabs.posweb.beans.ProductSubCategoryBean;
import com.tlabs.posweb.beans.ProductSuppliers;
import com.tlabs.posweb.beans.Products;
import com.tlabs.posweb.beans.ProductsList;
import com.tlabs.posweb.beans.RequestBean;
import com.tlabs.posweb.beans.SearchProductResponse;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.beans.ShipmentRateMaster;
import com.tlabs.posweb.beans.ShipmentRateMasterResponse;
import com.tlabs.posweb.beans.States;
import com.tlabs.posweb.beans.SupplierBean;
import com.tlabs.posweb.beans.SupplierResponseBean;
import com.tlabs.posweb.beans.Suppliers;
import com.tlabs.posweb.beans.UserLog;
import com.tlabs.posweb.util.Constants;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
import com.tlabs.posweb.util.RestfulServiceConnection;
//import com.tlabs.posweb.util.Utilities;

public class OutletMasterService {
	
	@Autowired
	private Gson gson;
	@Autowired
	SessionScope sessionScope;
//	private static Logger log = Logger.getLogger(OutletMasterService.class);
	
	
	
	
	
	
	

	public List<ProductsList> searchProducts(String customerIdStr,String emailIdStr,String searchNameStr,String storeLocation,String productCategoryStr,String productSubCategory,String supplier,boolean supplierFlag){
		String resultStr = null;
		RequestBean requestBeanObj = null;
		List<ProductsList> productsLists = new ArrayList<ProductsList>();
		RestfulServiceConnection restfulConnectionObj = null;
		try{
			restfulConnectionObj = new RestfulServiceConnection();
			requestBeanObj = new RequestBean();
			requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestBeanObj.setSearchCriteria(searchNameStr);
			requestBeanObj.setStartIndex("-1");
			requestBeanObj.setStoreLocation(storeLocation);
			requestBeanObj.setProductCategory(productCategoryStr);
			requestBeanObj.setProductSubCategory(productSubCategory);
			requestBeanObj.setSupplierId(supplier);
			requestBeanObj.setSupplierCode(supplier);
			requestBeanObj.setProductRestrictions(supplierFlag);
			//////////////////reqQty"Request String::::"+gson.toJson(requestBeanObj));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Sku_Service_search_products"), gson.toJson(requestBeanObj), "GET");
					
			//////////////////reqQty"Response String::::"+resultStr);
			ProductsList productsList = new ProductsList();
			
			SearchProductResponse searchProductResponse = gson.fromJson(resultStr,SearchProductResponse.class);
			if (searchProductResponse.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)) {
				for (int i = 0; i < searchProductResponse.getProductsList().length; i++) {
					productsList = searchProductResponse.getProductsList()[i];
					ProductsList productList = new ProductsList();
					if(productsList.getDescription() != null && productsList.getDescription().toLowerCase().contains(searchNameStr.toLowerCase())){
						productList.setDescription(productsList.getDescription());
						productList.setSkuID(productsList.getSkuID());
					}
					else if(productsList.getCategory() != null && productsList.getCategory().toLowerCase().contains(searchNameStr.toLowerCase())){
						productList.setDescription(productsList.getCategory());
						productList.setSkuID(productsList.getSkuID());
					}
					else if (productsList.getSkuID() != null && productsList.getSkuID().toLowerCase().contains(searchNameStr.toLowerCase())) {
						productList.setDescription(productsList.getSkuID());
						productList.setSkuID(productsList.getSkuID());
					}
					else {
						productList.setDescription(productsList.getProductId());
						productList.setSkuID(productsList.getSkuID());
					}
					productList.setPluCode(productsList.getPluCode());
					productList.setPrice(productsList.getPrice());
					productList.setBuy_price(productsList.getBuy_price());
					productList.setProductName(productsList.getProductName());
					productList.setColor(productsList.getColor());
					productList.setEan(productsList.getEan());
					productList.setSize(productsList.getSize());
					productList.setMeasureRange(productsList.getMeasurementRange());
					productList.setQuantity(productsList.getStock());
					productList.setMbq(productsList.getMbq());
					productList.setMrp(productsList.getMrp());
					

					productList.setQuantityInHand(productsList.getQuantityInHand());
					productList.setReorderPoint(productsList.getReorderPoint());
					
					productsLists.add(productList);
				}
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return productsLists;
		
	}
	
	
	
	/**
	 * @author Mythri.S	
	 * 
	 * This method is used to call the getProducts method of web service and return the Products List
	 * 
	 */
	public List<Products> getProducts(String customerIdStr,String emailIdStr,String productName,String index,String categoryName,String subCategoryName,String maxRecords ){
		String result = null;
		List<Products> productList = null;
		try {
			// log.info("getProducts");
			ProductMasterProxy productMasterProxy = new ProductMasterProxy();
			ProductMaster productMaster = new ProductMaster();
			productMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			productMaster.setPageNo(index);
			productMaster.setProductName(productName);
			productMaster.setCategory(categoryName);
			productMaster.setSub_category(subCategoryName);
			productMaster.setSearchCriteria(productName);
			productMaster.setMaxRecords(maxRecords);
			// log.info("Request String:::::::::"+gson.toJson(productMaster));
			//////////////////reqQty"Request String:::::::::"+gson.toJson(productMaster));
			result = productMasterProxy.getProducts(gson.toJson(productMaster));
			// log.info("Response String:::::::::"+result);
			//////////////////reqQty"Response String:::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			// log.info(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim());
			JSONObject jsonResult = new JSONObject(result);
			String totalRecords = jsonResult.getString("totalRecords");
			// log.info(totalRecords);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				String responseList = Response.getResponseList(result, "searchResults");
				JSONArray jsonResponseArray = new JSONArray(responseList);
				productList = new ArrayList<Products>();
				Products product = new Products();
				if(index.equals(""))
					index = "0";
				int slNo = Integer.parseInt(index);
				for (int i=0; i<jsonResponseArray.length(); i++) {
					product = gson.fromJson(jsonResponseArray.getString(i), Products.class);
					product.setSlNo(++slNo);
					product.setTotalRecords(totalRecords);
					product.setStartValue(index);
					
					productList.add(product);
				}
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
		return productList;
	}
	
	
	/**
	 * 
	 * @author Vijay
	 * Created On: 31-july-2018
	 * 
	 *	This method is used to make the service call to get remote Outlet details 
	 *
	 **/
		public  OutletSettings getOutletMapSettings(String request)
		{
			
			
			String resultStr = null;
			OutletSettings requestBeanObj = null;
			OutletSettings responseObj = null;
			try{
				responseObj = new OutletSettings();
				requestBeanObj = new OutletSettings();
				requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				requestBeanObj.setStartIndex("-1");
				RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
				resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_outlet_configuration"), gson.toJson(requestBeanObj),"GET");
				////////////////////reqQtyresultStr);
				String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					responseObj = gson.fromJson(resultStr, OutletSettings.class);
				}
				
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
			}
			return responseObj;
			
		}
		
		
		
		
		public  List<OutletSyncSettings> getOutletSynchStatus(String startIndex, String maxRecords,String location)
		{
			String resultStr = null;
			OutletSyncSettings requestBeanObj = null;
			try{
				requestBeanObj = new OutletSyncSettings();
				requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				requestBeanObj.setStartIndex(startIndex);
				requestBeanObj.setMaxRecords(maxRecords);
				requestBeanObj.setStoreLocation(location);
				//////////////////reqQtygson.toJson(requestBeanObj));
				RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
				resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_OutletSync_Status"), gson.toJson(requestBeanObj),"GET");
				//////////System.out.println(resultStr);
				String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					requestBeanObj = gson.fromJson(resultStr, OutletSyncSettings.class);
					if(requestBeanObj.getOutletSyncList()!=null && requestBeanObj.getOutletSyncList().size()>0)
					requestBeanObj.getOutletSyncList().get(0).setTotalRecords(requestBeanObj.getTotalRecords());
				}
				
				
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
			}
			return requestBeanObj.getOutletSyncList();
			
		}
		
		
		public  List<UserLog> getOutletUserLog(String startIndex, String maxRecords,String location,String zone, String startDate, String endDate, String searchCriteria,String emailId,String appName)
		{
			String resultStr = null;
			UserLog requestBeanObj = null;
//			List<UserLog> responseObj = null;
			try{
//				responseObj = new ArrayList<UserLog>();
				requestBeanObj = new UserLog();
				requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				requestBeanObj.setStartIndex(startIndex);
				requestBeanObj.setMaxRecords(maxRecords);
				requestBeanObj.setStore_location(location);
//				requestBeanObj.setZoneId(zone);
				requestBeanObj.setStartDate(startDate);
				requestBeanObj.setEndDate(endDate);
				requestBeanObj.setEmail_id(emailId);
				requestBeanObj.setApp_name(appName);
				requestBeanObj.setSearchCriteria(searchCriteria);
				// log.info("Request String::::"+gson.toJson(requestBeanObj));
//				////////////////////reqQtygson.toJson(requestBeanObj));
				RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
				resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Log"), gson.toJson(requestBeanObj),"GET");
//				////////////////////reqQtyresultStr);
				// log.info("Response String::::"+resultStr);
				String responseCode = Response.getResponseCode(resultStr);
				
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
//					responseObj.add(requestBeanObj.getUserLogDetails());
//					responseObj.get(0).setTotalRecords(requestBeanObj.getTotalRecords());
					requestBeanObj = gson.fromJson(resultStr, UserLog.class);
					requestBeanObj.getUserLogDetails().get(0).setTotalRecords(requestBeanObj.getTotalRecords());
				}
				
				
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
			} catch(Exception e){
				e.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
			}
			return requestBeanObj.getUserLogDetails();
			
		}
		
		/**
		 * 
		 * @author Vijay
		 * Created On: 31-july-2018
		 * 
		 *	This method is used to make service call the Outlet DayOpen DayClose details 
		 *
		 **/

		public  DayOpenSummary getOutletDaySync(String startIndex, String maxRecords,String location,String zone, String startDate, String endDate, String searchCriteria,String locationListAll, boolean saveFlag)
        {
                String resultStr = null;
                DayOpenSummary requestBeanObj = null;
                DayOpenSummary responseObj = null;
                try{
                        responseObj = new DayOpenSummary();
                        requestBeanObj = new DayOpenSummary();
                        requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
                        requestBeanObj.setStartIndex(startIndex);
                        requestBeanObj.setMaxRecords(maxRecords);
                        if(location.equals("all") || location.equals("")){
                                Set<String> myList = new HashSet<String>(Arrays.asList(locationListAll.split(",")));
                                requestBeanObj.setLocationsList(myList);
                                }
                                else
                        requestBeanObj.setStoreLocation(location);
                        requestBeanObj.setZoneId(zone);
                        requestBeanObj.setStartDate(startDate);
                        requestBeanObj.setEndDate(endDate);
                        requestBeanObj.setSearchCriteria(searchCriteria);
                        requestBeanObj.setSaveReport(saveFlag);
                         
                 //System.out.println("Request String::::"+gson.toJson(requestBeanObj));
                //////reqQtygson.toJson(requestBeanObj));
                        RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
                        resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_outlet_Sync"), gson.toJson(requestBeanObj),"GET");
                        
//                        ////////////////////reqQtyresultStr);
                         //System.out.println("Response String::::"+resultStr);
                        String responseCode = Response.getResponseCode(resultStr);
                        if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
                                responseObj = gson.fromJson(resultStr, DayOpenSummary.class);
                        }
                        
                } catch (NoSuchElementException nse) {
                        nse.printStackTrace();
                        resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
                } catch(Exception e){
                        e.printStackTrace();
                        resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
                }
                return responseObj;
        }
	
	/**
	 * @author Vijay
	 * 
	 * @Description: This method is used to call the uploadProductMaster method of web service and returns the response the Response Message.
	 * @implementation: In outletMasters of ProductGroup creation 
	 * @throws Exception 
	 * 
	 */
	public String uploadProductGroupExcelSheet(String customerId,String emailId,MultipartFile excelFile) throws Exception{
		String resultStr = null;
//		ExportImportBean exportImportObj = null;
		//List<ProductsList> productsList=null;
		try {
			// log.info("uploadProductGroupMasterUsingExel");
			byte[] encodedByte =excelFile.getBytes();
			ExportImportsProxy uploadSEIProxy = new ExportImportsProxy();
			// log.info(excelFile.getOriginalFilename()+"   "+excelFile.getName());
			FileUploader file = new FileUploader();
			file.setName("file");
			file.setFileType("xls");
			file.setDfile(encodedByte);
			if(excelFile.getOriginalFilename().toUpperCase().contains(".DWN"))
			{
				// log.info("uploadProductGroupMasterUsingJDA");
			}
			else
			{
				JSONObject json = new JSONObject();
				json.put("requestHeader", new Gson().toJson(RequestHeaderUtil.getRequestHeader(sessionScope)));
				resultStr = uploadSEIProxy.importTemporaryGroup(json.toString(), file);
				
//				////////////////////reqQtyresultStr);
				//RESPONSE_FAILED_CODE
				
				String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				{
					resultStr = AppProperties.getAppMessageByProperty("EXEL_IMPORT_SUCCESS").trim();
				}
				else if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_FAILED_CODE").trim())) 
				{
					resultStr = AppProperties.getAppMessageByProperty("EXEL_IMPORT_FAILURE").trim();
				}
				
				else if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_EXEL_IMPORT_PARTIAL_SUCCESS_CODE").trim()))
				{
					resultStr = Response.getResponseMessage(resultStr);
				}
				
				else
				{
					resultStr = Response.getResponseMessage(resultStr);
				}
				
			}
	
			// log.info(resultStr);
		}catch(ConnectException ce) {
			ce.printStackTrace();
			throw new Exception(AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim());
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			throw new Exception(AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim());
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			throw new Exception(AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim());
		} catch(RemoteException rme){
			rme.printStackTrace();
			throw new Exception(AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim());
		} catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
		
	}
	
	
	
	
	/**
	 * @author Mythri.S	
	 * 
	 * This method is used to call the getProductDetails method of web service and return the Product Details
	 * 
	 */
	public Map<String,Object> getProductByProductId(String customerId,String emailId,String productId){
		String result = null;
		Map<String,Object> productDetails = new HashMap<String, Object>();
		ProductMaster product = new ProductMaster();
		try {
			// log.info("getProductByProductId");
			ProductMasterProxy productMasterProxy = new ProductMasterProxy();
			ArrayList<String> selectedSuppliers = new ArrayList<String>();
			ArrayList<String> selectedStores = new ArrayList<String>();
			ProductMaster productMaster = new ProductMaster();
			productMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			productMaster.setPageNo("0");
			productMaster.setProductId(productId);
			// log.info("Request String::::::::"+gson.toJson(productMaster));
			result = productMasterProxy.getProductDetails(gson.toJson(productMaster));
			// log.info("Response String:::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				String responseList = Response.getResponseList(result, "productDetails");
					product = gson.fromJson(responseList, ProductMaster.class);
					// log.info(product.getProductId());
				for(int i=0; i<product.getProductSuppliers().size();i++){
					// log.info(product.getProductSuppliers().get(i).getSupplier_id());
					selectedSuppliers.add(product.getProductSuppliers().get(i).getSupplier_id());
				}
				for(int i=0; i<product.getProductStores().size();i++){
					// log.info(product.getProductStores().get(i).getStore_id());
					selectedStores.add(product.getProductStores().get(i).getStore_id());
				}
				product.setProductStores(null);
				product.setProductSuppliers(null);
				productDetails.put("product", product);
				productDetails.put("selectedSuppliers", selectedSuppliers);
				productDetails.put("selectedStores", selectedStores);
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
		return productDetails;
	}
	
	/**
	 * @author Mythri.S	
	 * 
	 * This method is used to call the createProduct method of web service and return the response
	 * 
	 */
	public String createProduct(String productMasterDetaills,String productSupplier,String productStore,String customerId,String emailId){
		String result = null;
		try {
			JSONArray jsonArray = null;
			ArrayList<ProductSuppliers> productSuppliers = new ArrayList<ProductSuppliers>();
			ArrayList<ProductStores> productStores = new ArrayList<ProductStores>();
			ProductSuppliers productSuppliersObj = null;
			ProductStores productStoresObj = null;
			ProductMaster productMaster = gson.fromJson(productMasterDetaills, ProductMaster.class);
			productSupplier = Response.getResponseList(productSupplier, "productSupplier");
			productStore = Response.getResponseList(productStore, "productStore");
			if(productSupplier.contains("[")){
				jsonArray = new JSONArray(productSupplier);
				for (int i=0; i<jsonArray.length(); i++) {
					productSuppliersObj = new ProductSuppliers();
					productSuppliersObj.setSupplier_id(jsonArray.getString(i));
					productSuppliers.add(productSuppliersObj);
				}
			}
			else{
				productSuppliersObj = new ProductSuppliers();
				productSuppliersObj.setSupplier_id(productSupplier);
				productSuppliers.add(productSuppliersObj);
			}
			if(productStore.contains("[")){
			jsonArray = new JSONArray(productStore);
			for (int i=0; i<jsonArray.length(); i++) {
				productStoresObj  = new ProductStores();
				productStoresObj.setStore_id(jsonArray.getString(i));
				productStores.add(productStoresObj);
			}
			}else{
				productStoresObj  = new ProductStores();
				productStoresObj.setStore_id(productStore);
				productStores.add(productStoresObj);
			}
			productMaster.setProductStores(productStores);
			productMaster.setProductSuppliers(productSuppliers);
			productMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			if(productMaster.getSub_category() != null && (productMaster.getSub_category().equals("Select") || productMaster.getSub_category().equals("-- Select --")))
				productMaster.setSub_category("");
			ProductMasterProxy productMasterProxy = new ProductMasterProxy();
			// log.info("Request String::::::::::"+gson.toJson(productMaster));
			result = productMasterProxy.createProduct(gson.toJson(productMaster));
			// log.info("Response String:::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("PRODUCT_CREATE_SUCCESS").trim();
			else
				result = Response.getResponseMessage(result);
//				responseMessage = "Couldn't create, please try after some time";
		} catch(ConnectException ce) {
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
	 * @author Mythri.S	
	 * 
	 * This method is used to call the updateProduct method of web service and return the response
	 * 
	 */
	public Map<String, Object> updateProduct(String productMasterDetaills,String productSupplier,String productStore,String customerId,String emailId){
		Map<String,Object> productDetails = new HashMap<String, Object>();
		String result = null;
		try {
			JSONArray jsonArray = null;
			ArrayList<String> selectedSuppliers = new ArrayList<String>();
			ArrayList<String> selectedStores = new ArrayList<String>();
			ArrayList<ProductSuppliers> productSuppliers = new ArrayList<ProductSuppliers>();
			ArrayList<ProductStores> productStores = new ArrayList<ProductStores>();
			ProductSuppliers productSuppliersObj = null;
			ProductStores productStoresObj = null;
			ProductMaster productMaster = gson.fromJson(productMasterDetaills, ProductMaster.class);
			productSupplier = Response.getResponseList(productSupplier, "productSupplier");
			productStore = Response.getResponseList(productStore, "productStore");
			if(productSupplier.contains("[")){
				jsonArray = new JSONArray(productSupplier);
				for (int i=0; i<jsonArray.length(); i++) {
					productSuppliersObj = new ProductSuppliers();
					productSuppliersObj.setSupplier_id(jsonArray.getString(i));
					productSuppliers.add(productSuppliersObj);
					selectedSuppliers.add(jsonArray.getString(i));
				}
			}
			else{
				productSuppliersObj = new ProductSuppliers();
				productSuppliersObj.setSupplier_id(productSupplier);
				productSuppliers.add(productSuppliersObj);
				selectedSuppliers.add(productSupplier);
			}
			for(int i=0; i<selectedSuppliers.size();i++){
				
			}
				// log.info(selectedSuppliers.get(i));
			if(productStore.contains("[")){
			jsonArray = new JSONArray(productStore);
			for (int i=0; i<jsonArray.length(); i++) {
				productStoresObj  = new ProductStores();
				productStoresObj.setStore_id(jsonArray.getString(i));
				productStores.add(productStoresObj);
				selectedStores.add(jsonArray.getString(i));
			}
			}else{
				productStoresObj  = new ProductStores();
				productStoresObj.setStore_id(productStore);
				productStores.add(productStoresObj);
				selectedStores.add(productStore);
			}
			for(int i=0; i<selectedStores.size();i++)
				// log.info(selectedStores.get(i));
			productMaster.setProductStores(productStores);
			productMaster.setProductSuppliers(productSuppliers);
			productMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			if(productMaster.getSub_category() != null && (productMaster.getSub_category().equals("Select") || productMaster.getSub_category().equals("-- Select --")))
				productMaster.setSub_category("");
			ProductMasterProxy productMasterProxy = new ProductMasterProxy();
			// log.info("Request String::::::::::"+gson.toJson(productMaster));
			result = productMasterProxy.updateProduct(gson.toJson(productMaster));
			// log.info("Response String::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("PRODUCT_UPDATE_SUCCESS").trim();
			else
				result = Response.getResponseMessage(result);
//				responseMessage = "Couldn't update, please try after some time";
			productMaster.setProductStores(null);
			productMaster.setProductSuppliers(null);
			productDetails.put("product", productMaster);
			productDetails.put("selectedSuppliers", selectedSuppliers);
			productDetails.put("selectedStores", selectedStores);
			
		} catch(ConnectException ce) {
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
		productDetails.put("responseMessage", result);
		return productDetails;
	}
	
	
	/**
	 * @author Mythri.S	
	 * 
	 * This method is used to call the createSupplier method of web service and return the response
	 * 
	 */
	public String createSupplier(SupplierBean supplierBean,String customerId,String emailId){
		String result = null;
		try {
			supplierBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			////////System.out.println("create supplier Request String::::::::"+gson.toJson(supplierBean));
			//result = supplierMaster.createSupplier(gson.toJson(supplierBean));
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_Supplier"), gson.toJson(supplierBean));
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("SUPPLIER_CREATE_SUCCESS").trim();
			}
			else{
//				responseMessage = "Couldn't create, please try after some time";
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
	}
	
	/**
	 * @author Mythri.S	
	 * 
	 * This method is used to call the getSuppliers method of web service and return the Supplier List
	 * 
	 */
	public List<Suppliers> getSuppliers(String customerId,String emailId,String index,String maxRecords,String searchCriteria){
		String result = null;
		List<Suppliers> supplierList = null;
		try {
			//SupplierServiceProxy supplierMaster = new SupplierServiceProxy();
			SupplierBean supplierBean = new SupplierBean();
			supplierBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			supplierBean.setPageNo(Integer.parseInt(index));
			supplierBean.setStartIndex(Integer.parseInt(index));
			supplierBean.setSearchCriteria(searchCriteria);
			supplierBean.setMaxRecords(maxRecords);
	//System.out.println("get supplier ::"+gson.toJson(supplierBean));		////////////reqQty"get supplier ::"+gson.toJson(supplierBean));
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_suppliers"), gson.toJson(supplierBean),"GET");
		//	System.out.println("get supplier ress ::"+result);
			//result = supplierMaster.getSuppliers(gson.toJson(supplierBean));
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				String responseList = Response.getResponseList(result, "suppliers");
				JSONArray jsonResponseArray = new JSONArray(responseList);
				supplierList = new ArrayList<Suppliers>();
				Suppliers suppliers = new Suppliers();
				int slNo = Integer.parseInt(index);
				for (int i=0; i<jsonResponseArray.length(); i++) {
					suppliers = gson.fromJson(jsonResponseArray.getString(i), Suppliers.class);
					suppliers.setSlNo(++slNo);
					supplierList.add(suppliers);
				}
				supplierList.get(0).setTotalRecords(Response.getResponseTotalRecords(result));
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
		return supplierList;
	}
	
	/**
	 * @author Mythri.S	
	 * 
	 * This method is used to call the getSuppliers method of web service and return the Supplier Details
	 * 
	 */
	public SupplierBean getSupplierByFirmName(String customerId, String emailId,String firmName){
		String result = null;
		SupplierBean supplierBean = new SupplierBean();
		try {
			//SupplierServiceProxy supplierMaster = new SupplierServiceProxy();
			supplierBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			supplierBean.setPageNo(0);
			//supplierBean.setSearchCriteria(firmName);
			supplierBean.setSupplierCode(firmName);
			//////////////////////////System.out.println("Request String:::::::::"+gson.toJson(supplierBean));
			
			/*result = supplierMaster.getSuppliers(gson.toJson(supplierBean));
			// log.info("Response String:::::::::::"+result);*/
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_suppliers"), gson.toJson(supplierBean),"GET");

			//System.out.println(result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				supplierBean = gson.fromJson(result, SupplierBean.class);
			}else {
				supplierBean = gson.fromJson(result, SupplierBean.class);
			}
			////////////////////reqQty"Response String:::::::::"+gson.toJson(supplierBean));
		} catch(ConnectException ce) {
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
		return supplierBean;
	}
	
	/*public List<SupplierBean> searchSuppliers(String customerIdStr,String emailIdStr,String searchNameStr,String index){
		List<SupplierBean> supplierList = new ArrayList<SupplierBean>();
		String result = "";
		try{
			// log.info("Get Suppliers based on provided name");
			SupplierBean supplierBean = new SupplierBean();
			SupplierServiceProxy supplierMaster = new SupplierServiceProxy();
			supplierBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			supplierBean.setPageNo(Integer.parseInt(index));
			supplierBean.setSearchCriteria(searchNameStr);
			// log.info("Request String:::::::::"+gson.toJson(supplierBean));
			result = supplierMaster.getSuppliers(gson.toJson(supplierBean));
			// log.info("Response String:::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				JSONObject jsonResult = new JSONObject(result);
				String totalRecords = jsonResult.getString("totalRecords");
				String responseList = Response.getResponseList(result, "suppliers");
				JSONArray jsonResponseArray = new JSONArray(responseList);
				for (int i=0; i<jsonResponseArray.length(); i++) {
					supplierBean = gson.fromJson(jsonResponseArray.getString(i), SupplierBean.class);
					supplierList.add(supplierBean);
				}
				supplierList.get(0).setTotalRecords(totalRecords);
			}
		} catch(ConnectException ce) {
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
		return supplierList;
	}
	*/
	public List<SupplierBean> searchSuppliers(String customerIdStr,String emailIdStr,String searchNameStr,String index,String maxRecords){
		List<SupplierBean> supplierList = new ArrayList<SupplierBean>();
		String result = "";
		try{
			SupplierBean supplierBean = new SupplierBean();
			supplierBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			supplierBean.setPageNo(Integer.parseInt(index));
			supplierBean.setSearchCriteria(searchNameStr);
			supplierBean.setMaxRecords(maxRecords);
			
		//	////////System.out.println("Request String rrr::::::::::"+gson.toJson(supplierBean));
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_suppliers"), gson.toJson(supplierBean),"GET");
		
		//	////////System.out.println("Response String rrr::::::::::"+result);
			
			//result = supplierMaster.getSuppliers(gson.toJson(supplierBean));
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				JSONObject jsonResult = new JSONObject(result);
				String totalRecords = jsonResult.getString("totalRecords");
				String responseList = Response.getResponseList(result, "suppliers");
				JSONArray jsonResponseArray = new JSONArray(responseList);
				for (int i=0; i<jsonResponseArray.length(); i++) {
					supplierBean = gson.fromJson(jsonResponseArray.getString(i), SupplierBean.class);
					supplierList.add(supplierBean);
				}
				supplierList.get(0).setTotalRecords(totalRecords);
			}
		} catch(ConnectException ce) {
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
		return supplierList;
	}


	
	//koti
	public SupplierResponseBean skuSuppliers(String skuid,String LocationType,String storeLocation,boolean issue){
		SupplierResponseBean supplierResponseBean = new SupplierResponseBean();
		String result = "";
		try{
			SupplierBean supplierBean = new SupplierBean();
			
			supplierBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			supplierBean.setSkuId(skuid);
			supplierBean.setStoreLocation(storeLocation);
			supplierBean.setLocationType(LocationType);
			supplierBean.setIssueWiseLocation(issue);
			
			//System.out.println("Request String rrr:::sku_suppliers:::::::"+gson.toJson(supplierBean));
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("sku_suppliers"), gson.toJson(supplierBean),"GET");
			//System.out.println("Response String rrr:::sku_suppliers:::::::"+result);
			
			
			supplierResponseBean = gson.fromJson(result, SupplierResponseBean.class);
			
				
			
		} catch(ConnectException ce) {
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
		return supplierResponseBean;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * @author Mythri.S	
	 * 
	 * This method is used to call the updateSupplier method of web service and return the response
	 * 
	 */
	public String updateSupplier(SupplierBean supplierBean,String customerId,String emailId){
		String result = null;
		try {
		/*	supplierBean = gson.fromJson(supplier, SupplierBean.class);
			ArrayList<SupplierProducts> itemDetailsList = new ArrayList<SupplierProducts>();
			itemslist = Response.getResponseList(itemslist, "itemDetails");
			SupplierProducts goodsReceiptsItems = null;
			JSONArray jsonArray = new JSONArray(itemslist);
			for (int i=0; i<jsonArray.length(); i++) {
				goodsReceiptsItems = gson.fromJson(jsonArray.getString(i), SupplierProducts.class);
				itemDetailsList.add(goodsReceiptsItems);
			}*/
			
			supplierBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
	//////////System.out.println("update supplier Request String::::::::::"+gson.toJson(supplierBean));
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_Supplier"), gson.toJson(supplierBean));
		//	result = supplierMaster.updateSupplier(gson.toJson(supplierBean));
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("SUPPLIER_UPDATE_SUCCESS").trim();
			}
			else{
//				responseMessage = "Couldn't update, please try after some time";
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
	}
	
	/**
	 * @author Mythri.S	
	 * 
	 * This method is used to call the deleteSupplier method of web service and return the response
	 * 
	 */
	public String deleteSupplier(String customerId,String emailId,String ids){
		String result = null;
		try {
			String[] idsArray = ids.split(",");
			SupplierBean supplierBean = new SupplierBean();
			supplierBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			List<String> supplierCodes = new ArrayList<String>();
			for(int i=0;i<idsArray.length;i++)
				supplierCodes.add(idsArray[i]);
			supplierBean.setSupplierCodes(supplierCodes);
			//result = supplierMaster.deleteSupplier(gson.toJson(supplierBean));
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("delete_Supplier"), gson.toJson(supplierBean));
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("SUPPLIER_DELETE_SUCCESS").trim();
			else 
				result = Response.getResponseMessage(result);
				////result = AppProperties.getAppMessageByProperty("DELETE_FAILED").trim();
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
	 * @author Mythri.S	
	 * 
	 * This method is used to call the deleteProductCategory method of web service and return the response
	 * 
	 */
	public String deleteCategory(String customerId,String emailId,String ids){
		String result = null;
		try {
			ProductCategoryBean productCategoryBean = new ProductCategoryBean();
			//UtilityMasterServiceProxy utitlitymaster = new UtilityMasterServiceProxy();
			String[] idsArray = ids.split(",");
			productCategoryBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			List<String> categoryCodes = new ArrayList<String>();
			for(int i=0;i<idsArray.length;i++)
				categoryCodes.add(idsArray[i]);
			productCategoryBean.setCategoryList(categoryCodes);
			//result = utitlitymaster.deleteProductCategory(gson.toJson(productCategoryBean));
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("delete_ProductCategory"), gson.toJson(productCategoryBean));
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("CATEGORY_DELETE_SUCCESS").trim();
			else if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_FAILED_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("DELETE_FAILED").trim();
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
	 * @author Mythri.S	
	 * Created On: 20-feb-2015
	 * 
	 * This method is used to call the getProductCategory method of web service and return the Category List
	 * 
	 */
	public List<ProductCategoryBean> getCategoryDetails(String categoryName,String customerId,String emailId,String index){
		String result = null;
		List<ProductCategoryBean> categoryList = null;
		try {
			ProductCategoryBean productCategoryBean = new ProductCategoryBean();
			productCategoryBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			if(index != null && index.equals("-1"))
				productCategoryBean.setMaxRecords(index);
			productCategoryBean.setStartIndex(index);
			productCategoryBean.setCategoryName(categoryName);
			////////////////////////System.out.println("Request String Got:::::::::::"+gson.toJson(productCategoryBean));
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_ProductCategory"), gson.toJson(productCategoryBean),"GET");

			//result = utitlitymaster.getProductCategory(gson.toJson(productCategoryBean));
			////////////////////////System.out.println("Response String Got:::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				String responseList = Response.getResponseList(result, "productDetails");
				JSONArray jsonResponseArray = new JSONArray(responseList);
				categoryList = new ArrayList<ProductCategoryBean>();
				int slNo = Integer.parseInt(index);
				for (int i=0; i<jsonResponseArray.length(); i++) {
					productCategoryBean = gson.fromJson(jsonResponseArray.getString(i), ProductCategoryBean.class);
					productCategoryBean.setSlNo(++slNo);
					categoryList.add(productCategoryBean);
				}
				categoryList.get(0).setTotalRecords(Response.getResponseTotalRecords(result));
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
		return categoryList;
	}
	
	

	
	public List<ProductCategoryBean> getCategoryDetails(String categoryName,String customerId,String emailId,String index,String maxRecords){
		String result = null;
		List<ProductCategoryBean> categoryList = null;
		try {
			ProductCategoryBean productCategoryBean = new ProductCategoryBean();
			//UtilityMasterServiceProxy utitlitymaster = new UtilityMasterServiceProxy();
			productCategoryBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			if(index != null && index.equals("-1"))
				productCategoryBean.setMaxRecords(index);
			
			productCategoryBean.setMaxRecords(maxRecords);
			productCategoryBean.setStartIndex(index);
			productCategoryBean.setCategoryName(categoryName);
			
			//System.out.println("Request String Got:::::::::::"+gson.toJson(productCategoryBean));
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_ProductCategory"), gson.toJson(productCategoryBean),"GET");

			//System.out.println("Response String Got:::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				String responseList = Response.getResponseList(result, "productDetails");
				JSONArray jsonResponseArray = new JSONArray(responseList);
				categoryList = new ArrayList<ProductCategoryBean>();
				int slNo = Integer.parseInt(index);
				for (int i=0; i<jsonResponseArray.length(); i++) {
					productCategoryBean = gson.fromJson(jsonResponseArray.getString(i), ProductCategoryBean.class);
					productCategoryBean.setSlNo(++slNo);
					categoryList.add(productCategoryBean);
				}
				categoryList.get(0).setTotalRecords(Response.getResponseTotalRecords(result));
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
		return categoryList;
	}
	
	
	
	
	public List<ProductSubCategoryBean> getSubCategoryDetails(String subcategoryName,String customerId,String emailId,String index,String maxRecords, boolean search){
		String result = null;
		List<ProductSubCategoryBean> subCategoryDetails = null;
		try {
			ProductSubCategoryBean productSubCategoryBean = new ProductSubCategoryBean();
			//UtilityMasterServiceProxy utitlitymaster = new UtilityMasterServiceProxy();
			productSubCategoryBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			productSubCategoryBean.setStartIndex(index);
			if(search)
				productSubCategoryBean.setSearchCriteria(subcategoryName);
			else
				productSubCategoryBean.setCategoryName(subcategoryName);
			
			productSubCategoryBean.setMaxRecords(maxRecords);
			//////////////////reqQty"get_ProductSubCategory"+gson.toJson(productSubCategoryBean));
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_ProductSubCategory"), gson.toJson(productSubCategoryBean),"GET");
			//////////////////reqQtyresult);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				String responseList = Response.getResponseList(result, "productDetails");
				JSONArray jsonResponseArray = new JSONArray(responseList);
				subCategoryDetails = new ArrayList<ProductSubCategoryBean>();
				int slNo = Integer.parseInt(index);
				for (int i=0; i<jsonResponseArray.length(); i++) {
					productSubCategoryBean = gson.fromJson(jsonResponseArray.getString(i), ProductSubCategoryBean.class);
					productSubCategoryBean.setSlNo(++slNo);
					subCategoryDetails.add(productSubCategoryBean);
				}
				subCategoryDetails.get(0).setTotalRecords(Response.getResponseTotalRecords(result));
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
		return subCategoryDetails;
	}
	
	
	/**
	 * @author Mythri.S	
	 * 
	 * This method is used to call the getProductSubCategory method of web service and return the Category List
	 * 
	 */
	public List<ProductSubCategoryBean> getSubCategoryDetails(String subcategoryName,String customerId,String emailId,String index,boolean search){
		String result = null;
		List<ProductSubCategoryBean> subCategoryDetails = null;
		try {
			ProductSubCategoryBean productSubCategoryBean = new ProductSubCategoryBean();
			//UtilityMasterServiceProxy utitlitymaster = new UtilityMasterServiceProxy();
			productSubCategoryBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			productSubCategoryBean.setStartIndex(index);
			if(search)
				productSubCategoryBean.setSearchCriteria(subcategoryName);
			else
				productSubCategoryBean.setSubcategoryName(subcategoryName);
			//////////////////reqQty"Request String Got:::::::::::"+gson.toJson(productSubCategoryBean));
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_ProductSubCategory"), gson.toJson(productSubCategoryBean),"GET");
			//////////////////reqQty"Response String Got:::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				String responseList = Response.getResponseList(result, "productDetails");
				JSONArray jsonResponseArray = new JSONArray(responseList);
				subCategoryDetails = new ArrayList<ProductSubCategoryBean>();
				int slNo = Integer.parseInt(index);
				for (int i=0; i<jsonResponseArray.length(); i++) {
					productSubCategoryBean = gson.fromJson(jsonResponseArray.getString(i), ProductSubCategoryBean.class);
					productSubCategoryBean.setSlNo(++slNo);
					subCategoryDetails.add(productSubCategoryBean);
				}
				subCategoryDetails.get(0).setTotalRecords(Response.getResponseTotalRecords(result));
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
		return subCategoryDetails;
	}
	

	/**
	 * @author Mythri.S	
	 * 
	 * This method is used to call the getProductSubCategory method of web service and return the Category List
	 * 
	 */
	public ProductSubCategoryBean getCategoriesbasedonlocation(String location,String customerId,String emailId,String index,boolean search){
		String result = null;
		String resultStr = null;
		ProductSubCategoryBean subCategoryDetails = null;
		ProductSubCategoryBean brandDetails = null;
		try {
			RequestBean productSubCategoryBean = new RequestBean();
			productSubCategoryBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			productSubCategoryBean.setStartIndexStr(index);
			productSubCategoryBean.setStoreLocation(location);
			RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
			// log.info("Request String::::::"+gson.toJson(productSubCategoryBean));
			result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_categories_basedon_location"), gson.toJson(productSubCategoryBean), "GET");
			resultStr = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_brands_basedon_location"), gson.toJson(productSubCategoryBean), "GET");
			// log.info("Respose String:::::"+result);
			String responseCode = Response.getResponseCode(result);
			String responsebrandCode = Response.getResponseCode(resultStr);
			subCategoryDetails = gson.fromJson(result, ProductSubCategoryBean.class);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				subCategoryDetails = gson.fromJson(result, ProductSubCategoryBean.class);
			}
			if(responsebrandCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				brandDetails = gson.fromJson(resultStr, ProductSubCategoryBean.class);
				subCategoryDetails.setBrandList(brandDetails.getBrandList());
			}
		}catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		}  catch(Exception e){
			e.printStackTrace();
		}
		return subCategoryDetails;
	}
	
	
	
	/**
	 * @author Mythri.S	
	 * 
	 * This method is used to call the deleteProductSubCategory method of web service and return the response
	 * 
	 */
	public String deleteSubCategory(String customerId,String emailId,String ids){
		String result = null;
		try {
			ProductSubCategoryBean productSubCategoryBean = new ProductSubCategoryBean();
			productSubCategoryBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			String[] idsArray = ids.split(",");
			List<String> subCategoryCodes = new ArrayList<String>();
			for(int i=0;i<idsArray.length;i++)
				subCategoryCodes.add(idsArray[i]);
			productSubCategoryBean.setSubCategoryList(subCategoryCodes);
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("delete_ProductSubCategory"), gson.toJson(productSubCategoryBean));
			//result = utitlitymaster.deleteProductSubCategory(gson.toJson(productSubCategoryBean));
			
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				result = AppProperties.getAppMessageByProperty("SUBCATEGORY_DELETE_SUCCESS").trim();
			else if(responseCode.equals(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_FAILED_CODE").trim())))
				result = AppProperties.getAppMessageByProperty("DELETE_FAILED").trim();
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
	
	public List<Group> searchProductGroupMaster(String customerIdStr,String emailIdStr,String searchNameStr){
		String resultStr = null;
		RequestBean requestBeanObj = null;
		Group groupObj = null;
		try{
			requestBeanObj = new RequestBean();
			requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestBeanObj.setSearchCriteria(searchNameStr);
			requestBeanObj.setStartIndex("-1");
//			ProductGroupMasterProxy productGroupMasterProxyObj = new ProductGroupMasterProxy();
			// log.info("Request String::::"+gson.toJson(requestBeanObj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_product_group"), gson.toJson(requestBeanObj),"GET");
//			resultStr = productGroupMasterProxyObj.getProductGroups(gson.toJson(requestBeanObj));
			// log.info("Response String::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			    groupObj = gson.fromJson(resultStr, Group.class);
			}
			else
				groupObj = new Group();
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return groupObj.getGroupsList();
		
	}

/**
	 * @author Viswanath
	 * 
	 *This method is used to call createProductGroup method of web service and return the response
	 *
	 **//*
	public String createNewProductGroup(Group groupObj,String customerIdStr,String emailIdStr){
		String resultStr = null;
		try {
//			ProductGroupMasterProxy masterServiceProxy = new ProductGroupMasterProxy();
			groupObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String::::::::::::"+gson.toJson(groupObj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_product_group"), gson.toJson(groupObj));
//			resultStr = masterServiceProxy.createProductGroup(gson.toJson(groupObj));
			// log.info("Response String:::::::::::"+resultStr);
			////////////////////reqQty"Request String::::::::::::"+gson.toJson(groupObj));
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("GROUP_CREATE_SUCCESS").trim();
			}
			else{
				//result = "Couldn't create, please try after some time";
				resultStr = Response.getResponseMessage(resultStr);
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
		return resultStr;
	}*/

/**
	 * @author Viswanath
	 * 
	 *This method is used to call createProductGroup method of web service and return the response
	 *
	 **/
	public String createNewProductGroup(Group groupObj,String customerIdStr,String emailIdStr){
		String resultStr = null;
		try {
			groupObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String::::::::::::"+gson.toJson(groupObj));
			
			//////////////////////reqQtygson.toJson(groupObj));
	///		System.out.println("Request createNewProductGroup :"+gson.toJson(groupObj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_product_group"), gson.toJson(groupObj));
			//////////////////////reqQtyresultStr);
			// log.info("Response String:::::::::::"+resultStr);
	////		System.out.println("Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("GROUP_CREATE_SUCCESS").trim();
			}
			else{
				
				if((Response.getResponseMessage(resultStr)).trim().equals(AppProperties.getAppMessageByProperty("CONTRAINT_KEY_VIOLATED")))
					resultStr = AppProperties.getAppMessageByProperty("GROUP_EXISTS");
				else	
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
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to call updateProductGroup method of web service and return the response
	 *
	 **/
	public String updateProductGroup(Group masterObj,String customerId,String emailId){
		String resultStr = null;
		try {
//			ProductGroupMasterProxy masterServiceProxy = new ProductGroupMasterProxy();
			masterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info(gson.toJson(masterObj));
			////////////////////reqQtygson.toJson(masterObj));
////			System.out.println("Req updateProductGroup :"+gson.toJson(masterObj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_product_group"), gson.toJson(masterObj));
//			result = masterServiceProxy.updateProductGroup(gson.toJson(masterObj));
			// log.info(resultStr);
			 String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					resultStr = AppProperties.getAppMessageByProperty("PRODUCT_GROUP_UPDATE_SUCCESS").trim();
				}
				else{
//					result = "Couldn't update, please try after some time";
					resultStr = Response.getResponseMessage(resultStr);
				}
	/*	}catch(ConnectException ce) {
			ce.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();*/
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	/*	} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
		} catch(RemoteException rme){
			rme.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();*/
		} catch(Exception e){
			e.printStackTrace();
		}
		//////////////////////reqQtyresultStr);
		return resultStr;
	}
	

	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to get ProductGroup Details
	 *
	 **/
	
	/*public List<Group> getProductGroupDetails(String groupNameStr,String customerIdStr,String emailIdStr,String index,boolean search){
		String resultStr = null;
		Group masterObj=new Group();
		try{
			
			masterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			if(search)
				masterObj.setSearchCriteria(groupNameStr);
			else
				masterObj.setGroupId(groupNameStr);
			masterObj.setStartIndex(index);
//			ProductGroupMasterProxy masterServiceProxy = new ProductGroupMasterProxy();
			// log.info("Request::"+gson.toJson(masterObj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_product_group"), gson.toJson(masterObj),"GET");
//			result = masterServiceProxy.getProductGroups(gson.toJson(masterObj));
			// log.info("Response::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			int slNo = Integer.parseInt(index);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				masterObj = gson.fromJson(resultStr, Group.class);
				if(masterObj.getGroupsList() != null && masterObj.getGroupsList().size() > 0){
					masterObj.getGroupsList().get(0).setTotalRecords(Response.getResponseTotalRecords(resultStr));
					for(Group group : masterObj.getGroupsList())
						group.setSlNo(++slNo);
				}
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
		return masterObj.getGroupsList();
	}
	*/
	
	

	/*
	 * *
	 * @author Vijay
	 * @Description: This method is used to call the getProductsByCriteria method of SkuServices web service and returns the response the Response as class.
	 * @implementation: in outletMasters of ProductGroup creation 
	 * @throws Exception 
	 * 
	 */
	public SearchProductResponse filterItemsByCriteria(String category,String subcategory,String brand,String section,String department,String subdepartment,String location,String supplier,String productClass,String subClass,String model,String index,String maxRecords )throws Exception{
		String resultStr = null;
		SearchProductResponse skuIdBean =new SearchProductResponse();
		RequestBean requestBeanObj = null;
		RestfulServiceConnection restfulConnectionObj = null;
		try{
			restfulConnectionObj = new RestfulServiceConnection();
			requestBeanObj = new RequestBean();
			requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestBeanObj.setInitialRecord(index);
			requestBeanObj.setMaxRecords(maxRecords);
			requestBeanObj.setStoreLocation(location);
			requestBeanObj.setCategoryId(category);
			requestBeanObj.setSubCategory(subcategory);
			requestBeanObj.setSection(section);
			requestBeanObj.setSupplierName(supplier);
			requestBeanObj.setBrandCode(brand);
			requestBeanObj.setPrimaryDepartment(department);
			requestBeanObj.setSecondaryDepartment(subdepartment);
			requestBeanObj.setProductClass(productClass);
			requestBeanObj.setSubClass(subClass);
			requestBeanObj.setModel(model);
			// log.info("Request String::::"+gson.toJson(requestBeanObj));
			//////////////////////reqQtygson.toJson(requestBeanObj));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_products_criteria"), gson.toJson(requestBeanObj), "GET");
			//////////////////////reqQtyresultStr);
			 skuIdBean = gson.fromJson(resultStr,SearchProductResponse.class);
			if (skuIdBean.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)) {
				skuIdBean= gson.fromJson(resultStr, SearchProductResponse.class);	
			}
			
			/*if (!skuIdBean.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)) {
				throw new Exception(skuIdBean.getResponseHeader().getResponseMessage());	
			}*/
			
		} 
		catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} 
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return skuIdBean;
		
	}
	/**
	 * @author Vijay
	 * 
	 * @Description: This method is used to call the getTemporaryGroupDetails method of Product Group web service and returns the response the Response as class.
	 * @implementation: in outletMasters of ProductGroup creation 
	 * @throws Exception 
	 * 
	 */
	
	
	public Group getProductGroupMasterTempData(String customerId,String emailId,String index,String maxRecords)throws Exception
	{
		Group groupResponse =new Group();
		RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
		RequestBean requestObj = new RequestBean();
		try
		{
		
			requestObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestObj.setStartIndex(index);
			requestObj.setMaxRecords(maxRecords);
			//////////////////////reqQtygson.toJson(requestObj));
			String result = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("productGroupMaster_temp_data"), gson.toJson(requestObj), "GET");
			//////////////////////reqQtyresult);
			groupResponse  = gson.fromJson(result, Group.class);
			
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())) 
			{
				groupResponse  = gson.fromJson(result, Group.class);
			}
			else if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_FAILED_CODE").trim())) 
			{
				result = AppProperties.getAppMessageByProperty("EXEL_IMPORT_FAILURE").trim();
			}
			
			else if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_EXEL_IMPORT_PARTIAL_SUCCESS_CODE").trim()))
			{
				result= Response.getResponseMessage(result);
			}
			
		}
		catch(JsonSyntaxException jse)
		{
			jse.printStackTrace();
		}
		catch (NoSuchElementException nse) {
			nse.printStackTrace();
			throw new Exception(AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim());
		} 
		catch(Exception e){
			e.printStackTrace();
		}
		return groupResponse;
		
		
	}
	
	
	public List<Group> getProductGroupDetails(String groupNameStr,String customerIdStr,String emailIdStr,String index, String maxRecords,boolean search){
		String resultStr = null;
		Group masterObj=new Group();
		try{
			
			masterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			if(search)
				masterObj.setSearchCriteria(groupNameStr);
			else
				masterObj.setGroupId(groupNameStr);
			masterObj.setStartIndex(index);
			masterObj.setMaxRecords(maxRecords);
//			ProductGroupMasterProxy masterServiceProxy = new ProductGroupMasterProxy();
			
//			//System.out.println(""+gson.toJson(masterObj));
			
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			//System.out.println("request getproduct"+gson.toJson(masterObj));
			resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_product_group"), gson.toJson(masterObj),"GET");
//			result = masterServiceProxy.getProductGroups(gson.toJson(masterObj));
			//////////////reqQtyresultStr);
			String responseCode = Response.getResponseCode(resultStr);
			int slNo = Integer.parseInt(index);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				masterObj = gson.fromJson(resultStr, Group.class);
				if(masterObj.getGroupsList() != null && masterObj.getGroupsList().size() > 0){
					masterObj.getGroupsList().get(0).setTotalRecords(Response.getResponseTotalRecords(resultStr));
					for(Group group : masterObj.getGroupsList())
						group.setSlNo(++slNo);
				}
			}
		/*}catch(ConnectException ce) {
			ce.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();*/
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		/*} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
		} catch(RemoteException rme){
			rme.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();*/
		} catch(Exception e){
			e.printStackTrace();
		}
		return masterObj.getGroupsList();
	}
	
	
	
	
	public List<GroupChild> searchGroupSkus(String customerIdStr,String emailIdStr,String groupId,String searchCriteria){
		String resultStr = null;
		List<GroupChild> groupChildList=new ArrayList<GroupChild>();
		try{
			GroupChild groupChildObj = new GroupChild();
			groupChildObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			groupChildObj.setGroupId(groupId);
			groupChildObj.setSearchCriteria(searchCriteria);
			groupChildObj.setStartIndex("0");
			
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_product_group_childs"), gson.toJson(groupChildObj),"GET");
			//////////////////////reqQty"Response::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				GroupChild groupObj = gson.fromJson(resultStr, GroupChild.class);
				if(groupObj.getGroupChildLists() != null && groupObj.getGroupChildLists().size() > 0)
					groupChildList = groupObj.getGroupChildLists();
			
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return groupChildList;
		
	}


/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to call deleteProductGroup method of web service and return the response
	 *
	 **/
	public String deleteProductGroup(String customerIdStr,String emailIdStr,String ids) {
		String resultStr = null;
		try {
			Group masterObj=new Group();
			//////////////////////reqQty"Ids::"+ids);
//			ProductGroupMasterProxy masterServiceProxy = new ProductGroupMasterProxy();
			masterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			String[] groups = ids.split(",");
			List<String> groupDetails = new ArrayList<String>();
			for(int i=0;i<groups.length;i++)
				groupDetails.add(groups[i]);
			masterObj.setGroupIds(groupDetails);
			//////////////////////reqQty"groupDetails::"+groupDetails);
			// log.info(gson.toJson(masterObj));
//////////////System.out.println("Request String:::::delete product group:::::::"+gson.toJson(masterObj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("delete_product_group"), gson.toJson(masterObj),"GET");
//			result = masterServiceProxy.deleteProductGroup(gson.toJson(masterObj));
//////////////	System.out.println("Result String:::::delete product group:::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				resultStr = AppProperties.getAppMessageByProperty("PRODUCT_GROUP_DELETE_SUCCESS").trim();
			else if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_FAILED_CODE").trim()))
				resultStr = AppProperties.getAppMessageByProperty("DELETE_FAILED").trim();
		/*}catch(ConnectException ce) {
			ce.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();*/
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	/*	} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
		} catch(RemoteException rme){
			rme.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();*/
		} catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
	}
	
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to call createShipmentRate method of web service and return the response
	 *
	 **/
	public String createNewShipmentRate(ShipmentRateMaster shipmentRateMasterObj,String customerIdStr,String emailIdStr){
		String resultStr = null;
		try {
			shipmentRateMasterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			//////////////////reqQty"Request String::::::::::::"+gson.toJson(shipmentRateMasterObj));
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("shipment_rate_service_create_shipment_rate"), gson.toJson(shipmentRateMasterObj));
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("SHIPMENT_RATE_CREATE_SUCCESS").trim();
			}
			else{
				//result = "Couldn't create, please try after some time";
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
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to get Shipment Rates info
	 *
	 **/
	
	public List<ShipmentRateMaster> getShipmentRates(String searchNameStr,String customerIdStr,String emailIdStr,String index,boolean search,String maxRecords){
		String resultStr = null;
		ShipmentRateMaster shipmentRateMasterObj = new ShipmentRateMaster();
		ShipmentRateMasterResponse shipmentRateMasterResponseObj = new ShipmentRateMasterResponse(); 
		List<ShipmentRateMaster> shipmentMasterList =new ArrayList<ShipmentRateMaster>();
		try{
			
			shipmentRateMasterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			if(search)
				shipmentRateMasterObj.setSearchCriteria(searchNameStr);
			else
				shipmentRateMasterObj.setSnoStr(searchNameStr);
			shipmentRateMasterObj.setStartIndex(index);
			shipmentRateMasterObj.setMaxRecords(maxRecords);
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("shipment_rate_service_get_shipment_rates"), gson.toJson(shipmentRateMasterObj),"GET");
			//////////////////reqQty"Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				shipmentRateMasterResponseObj = gson.fromJson(resultStr, ShipmentRateMasterResponse.class);
				if(shipmentRateMasterResponseObj.getShipmentRatesList() != null && shipmentRateMasterResponseObj.getShipmentRatesList().size() > 0){
					shipmentRateMasterResponseObj.getShipmentRatesList().get(0).setTotalRecords(Response.getResponseTotalRecords(resultStr));
					int slNo = Integer.parseInt(index);
					for(ShipmentRateMaster rateMaster : shipmentRateMasterResponseObj.getShipmentRatesList())
						rateMaster.setSlNo(++slNo);
				}else if(shipmentRateMasterResponseObj.getShipmentRateObj()!=null){
					shipmentMasterList.add(shipmentRateMasterResponseObj.getShipmentRateObj());
					return shipmentMasterList;
				}
			}
		
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		
		} catch(Exception e){
			e.printStackTrace();
		}
		return shipmentRateMasterResponseObj.getShipmentRatesList();
	}
	
	
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to get Shipment Rates info
	 *
	 **/
	
	public PriceRangeResponse getPriceRanges(String searchNameStr,String customerIdStr,String emailIdStr,String index,String maxRecords,boolean search){
		String resultStr = null;
		ShipmentRateMaster shipmentRateMasterObj = new ShipmentRateMaster();
		PriceRangeResponse priceRangeMasterResponeObj = new PriceRangeResponse(); 
//		List<ShipmentRateMaster> shipmentMasterList =new ArrayList<ShipmentRateMaster>();
		try{
			
			shipmentRateMasterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			if(search)
				shipmentRateMasterObj.setSearchCriteria(searchNameStr);
			else
				shipmentRateMasterObj.setSnoStr(searchNameStr);
			shipmentRateMasterObj.setStartIndex(index);
			shipmentRateMasterObj.setMaxRecords(maxRecords);
			shipmentRateMasterObj.setSearchCriteria(searchNameStr);
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			// log.info("Request String::::::::::::"+gson.toJson(shipmentRateMasterObj));
			resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_pricerange_master"), gson.toJson(shipmentRateMasterObj),"GET");
			// log.info("Response String:::::::::::"+resultStr);
			
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				priceRangeMasterResponeObj = gson.fromJson(resultStr, PriceRangeResponse.class);
			
			}
		
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		
		} catch(Exception e){
			e.printStackTrace();
		}
		return priceRangeMasterResponeObj;
	}
	
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to call updateShipmentRate method of web service and return the response
	 *
	 **/
	public String updateShipmentRate(ShipmentRateMaster masterObj,String customerId,String emailId){
		String resultStr = null;
		try {
			masterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			//////////////////reqQty"Request String::::::::::::"+gson.toJson(masterObj));
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("shipment_rate_service_update_shipment_rate"), gson.toJson(masterObj));
			 String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					resultStr = AppProperties.getAppMessageByProperty("SHIPMENT_RATE_UPDATE_SUCCESS").trim();
				}
				else{
//					result = "Couldn't update, please try after some time";
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
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to call deleteShipmentRate method of web service and return the response
	 *
	 **/
	public String deleteShipmentRate(String customerIdStr,String emailIdStr,String rates) {
		String resultStr = null;
		ShipmentRateMaster masterObj= new ShipmentRateMaster();
		try {
			masterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			String[] ratesAry =  rates.split(","); 
			masterObj.setSerialNums(ratesAry);
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("shipment_rate_service_delete_shipment_rate"), gson.toJson(masterObj));
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				resultStr = AppProperties.getAppMessageByProperty("SHIPMENT_RATE_DELETE_SUCCESS").trim();
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
	
	
	public ShipmentRateMasterResponse getShipmentPrice(ShipmentRateMaster shipmentRateMasterObj){
		ShipmentRateMasterResponse shipmentRateMasterResponseObj = new ShipmentRateMasterResponse();
		try{
			shipmentRateMasterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
//			shipmentRateMasterObj.setOrderStartPrice(null);
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			// log.info("Request String::::::::::::"+gson.toJson(shipmentRateMasterObj));
			//////////////////reqQty"Request String::::::::::::"+gson.toJson(shipmentRateMasterObj));
	///		System.out.println("Request String::getShipmentPrice:"+gson.toJson(shipmentRateMasterObj));
			String resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("shipment_rate_service_get_shipment_price"), gson.toJson(shipmentRateMasterObj),"GET");
			// log.info("Response String:::::::::::"+resultStr);
			//////////////////reqQty"Response String::::::::::: shipment price......."+resultStr);
//			String responseCode = Response.getResponseCode(resultStr);
	///		System.out.println("Response String::::::::::::"+resultStr);
			shipmentRateMasterResponseObj = gson.fromJson(resultStr, ShipmentRateMasterResponse.class);
			if(!shipmentRateMasterResponseObj.getResponseHeader().getResponseCode().equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				shipmentRateMasterResponseObj.setErrorMessage(shipmentRateMasterResponseObj.getResponseHeader().getResponseMessage());
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
//			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		
		} catch(Exception e){
			e.printStackTrace();
		}
		return shipmentRateMasterResponseObj;
	}
	
	public NearestLocationResponse getNearestStore(NearestLocationResponse nearestLocationObj){
		//NearestLocationResponse nearestLocationResponseObj = new NearestLocationResponse();
		try{
			nearestLocationObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));

			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			//nearestLocationObj.setServiceAreaType("");
			//////////////////reqQty"Request String:::::::::::: nearest Store"+gson.toJson(nearestLocationObj));
			String resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_nearst_store_location"), gson.toJson(nearestLocationObj),"GET");
			
			//////////////////reqQty"Response String::::::::::: Nearest Store......."+resultStr);

			nearestLocationObj = gson.fromJson(resultStr, NearestLocationResponse.class);
			/*if(!nearestLocationResponseObj.getResponseHeader().getResponseCode().equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				nearestLocationResponseObj.setErrorMessage(nearestLocationResponseObj.getResponseHeader().getResponseMessage());*/
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
		
		} catch(Exception e){
			e.printStackTrace();
		}
		return nearestLocationObj;
	}
	
		
	
	public ApplyCampaignsRequest getApplyCampaignDetails(ApplyCampaignsRequest billingFormObj,String customerIdStr,String emailIdStr){
		ApplyCampaignsRequest billingObj = new ApplyCampaignsRequest();
		try{
			billingFormObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			// log.info("Request String::::::::::::"+gson.toJson(billingFormObj));
//			////////////////////reqQty"Request String::::::::::::"+gson.toJson(billingFormObj));
			String resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("apply_Campaigns"), gson.toJson(billingFormObj),"GET");
			// log.info("Response String:::::::::::"+resultStr);
//			////////////////////reqQty"Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				billingObj = gson.fromJson(resultStr, ApplyCampaignsRequest.class);
			
		} 
		}catch (NoSuchElementException nse) {
			nse.printStackTrace();
//			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return billingObj;
	}
	
	/**
	 * 
	 * @author chaithanya
	 * 
	 *This method is used to get ProductGroup Details
	 *
	 **/
	
public GroupChild getProductGroupDetailsforGroupId(String groupNameStr,String customerIdStr,String emailIdStr,String index,boolean search,String searchcriteria, String maxRecords){
                String resultStr = null;
                GroupChild masterObj=new GroupChild();
                try{
                        
                        masterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
                        
                        if(search)
                                masterObj.setSearchCriteria(groupNameStr);
                        else
                                masterObj.setGroupId(groupNameStr);
                        masterObj.setStartIndex(index);
                        masterObj.setSearchCriteria(searchcriteria);
                        masterObj.setMaxRecords(maxRecords);
//                        ProductGroupMasterProxy masterServiceProxy = new ProductGroupMasterProxy();
                        //System.out.println("Request string::"+gson.toJson(masterObj));
//                        ////////////////////reqQty"Request::"+gson.toJson(masterObj));
                        RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
                        resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_product_group_childs"), gson.toJson(masterObj),"GET");
//                        result = masterServiceProxy.getProductGroups(gson.toJson(masterObj));
          ////               System.out.println("Response::"+resultStr);
            //////////////reqQty"Response::"+resultStr);
                        String responseCode = Response.getResponseCode(resultStr);
//                        int slNo = Integer.parseInt(index);
                        if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
                                masterObj = gson.fromJson(resultStr, GroupChild.class);
                        
                        }
                /*}catch(ConnectException ce) {
                        ce.printStackTrace();
                        resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();*/
                } catch (NoSuchElementException nse) {
                        nse.printStackTrace();
                        resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
                /*} catch (UnknownHostException uhe) {
                        uhe.printStackTrace();
                        resultStr = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();
                } catch(RemoteException rme){
                        rme.printStackTrace();
                        resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();*/
                } catch(Exception e){
                        e.printStackTrace();
                }
                return masterObj;
        }

	/**
	 * 
	 * @author chaithanya
	 * 
	 *This method is used to get ProductGroup Details
	 *
	 **/
	


	public String updatePriceRangeMaster(String customerIdStr, String emailIdStr,PriceRangeMaster priceRangeMasterObj) {
		String resultStr = null;
		try {
			
			priceRangeMasterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			// log.info("Request String::::::::::::"+gson.toJson(priceRangeMasterObj));
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_pricerange_master"), gson.toJson(priceRangeMasterObj));
			// log.info("Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("PRICERANGE_UPDATE_SUCCESS").trim();
			}
			else{
				//result = "Couldn't create, please try after some time";
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

	public String createPriceRangeMaster(String customerIdStr, String emailIdStr,PriceRangeMaster priceRangeMasterObj) {
		String resultStr = null;
		try {
			// log.info("Request String::::::::::::"+gson.toJson(priceRangeMasterObj));
			priceRangeMasterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			RestfulServiceConnection  restfulServiceConnectionObj=new RestfulServiceConnection();
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_pricerange_master"), gson.toJson(priceRangeMasterObj));
			// log.info("Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = AppProperties.getAppMessageByProperty("PRICERANGE_CREATE_SUCCESS").trim();
			}
			else{
				//result = "Couldn't create, please try after some time";
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

	
	
	public String deletePriceRange(String customerIdStr,String emailIdStr,String rates) {
		String resultStr = null;
		PriceRangeMaster masterObj= new PriceRangeMaster();
		try {
			masterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			String[] ratesAry =  rates.split(","); 
			List<String> PriceRangeCodes = new ArrayList<String>();
			for(int i=0;i<ratesAry.length;i++)
				PriceRangeCodes.add(ratesAry[i]);
			masterObj.setPriceRangeIds(PriceRangeCodes);
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			// log.info("Request String::::::::::::"+gson.toJson(masterObj));
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("delete_pricerange_master"), gson.toJson(masterObj));
			// log.info("Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				resultStr = AppProperties.getAppMessageByProperty("RM_SUCCESS").trim();
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
	
	public PriceRangeResponse getPriceRangeMaster(String priceRangeId) {
		PriceRangeMaster priceRangeMaster=new PriceRangeMaster();
		PriceRangeResponse priceRangeResponse=null;
		String resultStr=null;
		try{
		priceRangeMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		priceRangeMaster.setStartIndex("0");
		priceRangeMaster.setPriceRangeId(priceRangeId);
		RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
		// log.info("Request String::::::::::::"+gson.toJson(priceRangeMaster));
		resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_pricerange_master"), gson.toJson(priceRangeMaster),"GET");
		// log.info("Response String:::::::::::"+resultStr);
		}
	 catch (NoSuchElementException nse) {
		nse.printStackTrace();
		resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	} catch(Exception e){
		e.printStackTrace();
	}
return priceRangeResponse = gson.fromJson(resultStr, PriceRangeResponse.class);
		
	}
	/**
	 * @author chaithanya.v
	 * 
	 *This method is used to call createNewFeatureProductGroupMaster method of web service and return the response
	 *
	 **/
	public String createBom(BillOfMaterial featureobj,String customerIdStr,String emailIdStr){
		String resultStr = null;
		try {
			featureobj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//////////////////////System.out.println("Request String::::::::::::"+gson.toJson(featureobj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			if(featureobj.getBomRef().isEmpty()){
				resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_bom"), gson.toJson(featureobj));
				////////////////////////System.out.println("Response String:::::::::::"+resultStr);
				String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					resultStr = AppProperties.getAppMessageByProperty("BOM_GROUP_CREATE_SUCCESS").trim();
				}
				else{
					resultStr = Response.getResponseMessage(resultStr);
				}
			}
			
			else
			{
				resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("edit_bom_master"), gson.toJson(featureobj));
				// log.info("Response String:::::::::::"+resultStr);
				String responseCode = Response.getResponseCode(resultStr);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					resultStr = AppProperties.getAppMessageByProperty("BOM_GROUP_UPDATE_SUCCESS").trim();
				}
				else{
					resultStr = Response.getResponseMessage(resultStr);
				}
			}
				
			
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
	}		

	
	public String deleteBoms(String customerIdStr,String emailIdStr,String rates) {
		String resultStr = null;
		BillOfMaterial masterObj= new BillOfMaterial();
		try {
			masterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			String[] ratesAry =  rates.split(","); 
			List<String> PriceRangeCodes = new ArrayList<String>();
			for(int i=0;i<ratesAry.length;i++)
				PriceRangeCodes.add(ratesAry[i]);
			masterObj.setBoMaterialRefIds(PriceRangeCodes);
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			// log.info("Request String::::::::::::"+gson.toJson(masterObj));
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("delete_bom_master"), gson.toJson(masterObj));
			// log.info("Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim()))
				resultStr = AppProperties.getAppMessageByProperty("RM_SUCCESS").trim();
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
	
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to get Shipment Rates info
	 *
	 **/
	
	public BillOfMaterialResponse getBoms(String searchNameStr,String customerIdStr,String emailIdStr,String index,String bomref,String maxRecords,String location){
		String resultStr = null;
		BillOfMaterial shipmentRateMasterObj = new BillOfMaterial();
		BillOfMaterialResponse priceRangeMasterResponeObj = new BillOfMaterialResponse(); 
		try{
			
			shipmentRateMasterObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			shipmentRateMasterObj.setSearchCriteria(searchNameStr);
			shipmentRateMasterObj.setStartIndex(index);
			shipmentRateMasterObj.setBomRef(bomref);
			shipmentRateMasterObj.setMaxRecords(maxRecords);
			shipmentRateMasterObj.setStoreLocation(location);
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
		//System.out.println("Request String::::::::::::"+gson.toJson(shipmentRateMasterObj));
			resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_bom_master"), gson.toJson(shipmentRateMasterObj),"GET");
		//	System.out.println("Response String:::::::::::"+resultStr);
			//////////reqQtyresultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				priceRangeMasterResponeObj = gson.fromJson(resultStr, BillOfMaterialResponse.class);
			
			}
		
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		
		} catch(Exception e){
			e.printStackTrace();
		}
		return priceRangeMasterResponeObj;
	}
	
	

	/**
	 * 
	 * @author Mythri.S
	 * 
	 *  modified by raviteja.N
	 *  
	 *This method is used to call createProductCategory method of web service and return the response
	 *
	 **/
	public String createCategory(ProductCategoryBean productCategoryBean,String customerId,String emailId){
		String result = null;
		try {
			
			//UtilityMasterServiceProxy utitlitymaster = new UtilityMasterServiceProxy();
			productCategoryBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//System.out.println("Request String::::::::::::"+gson.toJson(productCategoryBean));
			//result = utitlitymaster.createProductCategory(gson.toJson(productCategoryBean));
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
		/*	//System.out.println("Request String::::::::::::"+gson.toJson(productCategoryBean));*/
			result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_ProductCategory"), gson.toJson(productCategoryBean));
			//System.out.println("Request String::::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("CATEGORY_CREATE_SUCCESS").trim();
			}
			else{
				//result = "Couldn't create, please try after some time";
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
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *  modified by raviteja.N
	 *  
	 *This method is used to call updateProductCategory method of web service and return the response
	 *
	 **/
	public String updateCategory(ProductCategoryBean productCategoryBean,String customerId,String emailId){
		String result = null;
		try {
			
			
			productCategoryBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//System.out.println("Requesting update"+gson.toJson(productCategoryBean));
			//result = utitlitymaster.updateProductCategory(gson.toJson(productCategoryBean));
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_ProductCategory"), gson.toJson(productCategoryBean));
			//System.out.println("Response String update:::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("CATEGORY_UPDATE_SUCCESS").trim();
			}
			else{
//				result = "Couldn't update, please try after some time";
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
	}
	/**
	 * 
	 * @author Mythri.S
	 * updated by RaviTeja.N
	 * 
	 *This method is used to call createProductSubCategory method of web service and return the response
	 * @param emailIdStr 
	 * @param customerIdStr 
	 * @param imageId 
	 *
	 **/
	public String createSubCategory(ProductSubCategoryBean  productSubCategoryBean, String customerId,String emailId){
		String result = null;
		try {
			productSubCategoryBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
	
			//result = utitlitymaster.updateProductSubCategory(gson.toJson(productSubCategoryBean));
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_ProductSubCategory"), gson.toJson(productSubCategoryBean));
			//result = utitlitymaster.createProductSubCategory(gson.toJson(productSubCategoryBean));
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("SUBCATEGORY_CREATE_SUCCESS").trim();
			}
			else{
//				result = "Couldn't create, please try after some time";
				result = Response.getResponseMessage(result);
			}
		} catch(ConnectException ce) {
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
	 * 
	 * @author Mythri.S
	 * 
	 * updated by RaviTeja.N
	 * 
	 *This method is used to call updateProductSubCategory method of web service and return the response
	 *
	 **/
	public String updateSubCategory(ProductSubCategoryBean  productSubCategoryBean, String customerId,String emailId){
		String result = null;
		try {
			productSubCategoryBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_ProductSubCategory"), gson.toJson(productSubCategoryBean));
			//result = utitlitymaster.updateProductSubCategory(gson.toJson(productSubCategoryBean));
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("SUBCATEGORY_UPDATE_SUCCESS").trim();
			}
			else{
//				result = "Couldn't update, please try after some time";
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
	}
	
	
	public List<HomePageGroup> getHomepagegroupInfo(String searchName,String customerId,String emailId,String index,String maxRecords,String groupId){
		String result = null;
		List<HomePageGroup> homePageGrouplist = null;
		try {
			HomePageGroup homePageGroup = new HomePageGroup();
			homePageGroup.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			homePageGroup.setStartIndex(index);
			homePageGroup.setMaxRecords(maxRecords);
			homePageGroup.setGroupId(groupId);
			//////////////reqQtygson.toJson(homePageGroup));
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_homepage_group"), gson.toJson(homePageGroup),"GET");
			//////////////reqQtyresult);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				String responseList = Response.getResponseList(result, "homePageGroups");
				JSONArray jsonResponseArray = new JSONArray(responseList);
				homePageGrouplist = new ArrayList<HomePageGroup>();
				
				int slNo = Integer.parseInt(index);
				for (int i=0; i<jsonResponseArray.length(); i++) {
					homePageGroup = gson.fromJson(jsonResponseArray.getString(i), HomePageGroup.class);
					//homePageGroup.setsNo(++slNo);
					homePageGrouplist.add(homePageGroup);
				}
				homePageGrouplist.get(0).setTotalRecords(Integer.parseInt(Response.getResponseTotalRecords(result)));
				
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
		return homePageGrouplist;
	}
	
	public String createNewHomepageProductGroup(HomePageGroup groupObj,String customerIdStr,String emailIdStr){
		String resultStr = null;
		try {
			groupObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//////////////reqQty"Request String::::::::::::"+gson.toJson(groupObj));
			
			////////////////reqQtygson.toJson(groupObj));
			
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_homepage_group"), gson.toJson(groupObj));
			////////////////reqQtyresultStr);
			
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				resultStr = "Homepage Group created successfully";
			}
			else{
				
				if((Response.getResponseMessage(resultStr)).trim().equals(AppProperties.getAppMessageByProperty("CONTRAINT_KEY_VIOLATED")))
					resultStr = AppProperties.getAppMessageByProperty("GROUP_EXISTS");
				else	
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
	
	

	public List<HSNMaster> getHSNmaster(String searchName,String customerId,String emailId,String index,String maxRecords,String groupId){
		String result = null;
		List<HSNMaster> homePageGrouplist = null;
		try {
			HSNMaster homePageGroup = new HSNMaster();
			homePageGroup.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			homePageGroup.setStartIndex(index);
			homePageGroup.setMaxRecords(maxRecords);
			//homePageGroup.setSearchCriteria(searchName);
			//homePageGroup.setGroupId(groupId);
			//////////////reqQtygson.toJson(homePageGroup));
			//System.out.println("Requesting"+gson.toJson(homePageGroup));
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_hsnmasterdetails"), gson.toJson(homePageGroup),"GET");
			//System.out.println("Response"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				String responseList = Response.getResponseList(result, "hsnMasters");
				JSONArray jsonResponseArray = new JSONArray(responseList);
				homePageGrouplist = new ArrayList<HSNMaster>();
				
				int slNo = Integer.parseInt(index);
				for (int i=0; i<jsonResponseArray.length(); i++) {
					homePageGroup = gson.fromJson(jsonResponseArray.getString(i), HSNMaster.class);
					//homePageGroup.setsNo(++slNo);
					homePageGrouplist.add(homePageGroup);
				}
				homePageGrouplist.get(0).setTotalRecords(Integer.parseInt(Response.getResponseTotalRecords(result)));
				
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
		return homePageGrouplist;
	}
	
	
	
	public Map<String,Object> createEventManagemnt(EventMaster eventMaster,String customerId,String emailId){
		String resultStr = null;
		Map<String,Object> responseMap = new HashMap<String, Object>();
		try {
			eventMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			SimpleDateFormat format1 = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
			
			if(eventMaster.getStartDateStr() != ""  && eventMaster.getStartDateStr() != null ){
				Date date = format1.parse(eventMaster.getStartDateStr());
				String startDateStr =  format2.format(date).toString();
				eventMaster.setStartDateStr(startDateStr);
			}
           if(eventMaster.getEndDateStr() != ""  && eventMaster.getEndDateStr() != null ){
        	   Date date1 = format1.parse(eventMaster.getEndDateStr());
        	   String endDateStr  =  format2.format(date1).toString();
        	   eventMaster.setEndDateStr(endDateStr);
			}
           if(eventMaster.getCreatedDateStr() != ""  && eventMaster.getCreatedDateStr() != null ){
        	   Date date2 = format1.parse(eventMaster.getCreatedDateStr());
        		String createdDateStr  =  format2.format(date2).toString();
        		eventMaster.setCreatedDateStr(createdDateStr);
            }
		
           if(eventMaster.getDueDateStr() != ""  && eventMaster.getDueDateStr() != null ){
        	   Date date2 = format1.parse(eventMaster.getDueDateStr());
        		String dueDateStr  =  format2.format(date2).toString();
        		eventMaster.setDueDateStr(dueDateStr);
            }
           
           
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
		    ////////////////////System.out.println("Request String::::::::::::"+gson.toJson(eventMaster));
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_Event_Managment"), gson.toJson(eventMaster));
			String responseCode = Response.getResponseCode(resultStr);
			//////////////////System.out.println(resultStr);
			 eventMaster = gson.fromJson(resultStr,EventMaster.class);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				
				
				resultStr = Constants.SUCCESS;
				responseMap.put("result",resultStr);
				responseMap.put("eventRef",eventMaster.getEventReference());
				
			}
			else{
				resultStr = Response.getResponseMessage(resultStr);
				responseMap.put("result",resultStr);
				//result = "Couldn't create, please try after some time";
				//resultStr = Response.getResponseMessage(resultStr);
			}
		} catch(ConnectException ce) {
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
		return responseMap;
	}



	public List<EventMaster> getEventManagementDetails(String customerIdStr, String emailIdStr, String index,
			String maxRecords,String eventref,boolean summary, String zone, String location, String eventType, String salesPerson,String  status, String startDate, String endDate, String searchName,boolean eventReport) {
		String result = null;
		EventMaster eventMasterData = new EventMaster();
		try {
			EventMaster eventMaster = new EventMaster();
			eventMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			eventMaster.setStartIndex(index);
			eventMaster.setMaxRecords(maxRecords);
			eventMaster.setEventReference(eventref);
			eventMaster.setSummery(summary);
			eventMaster.setOutletStoreLocation(location);
			eventMaster.setEventType(eventType);
			eventMaster.setSalePerson(salesPerson);
			eventMaster.setStartDateStr(startDate); 
			eventMaster.setEndDateStr(endDate);
			eventMaster.setSearchCriteria(searchName);
			eventMaster.setWorkflowStatus(status);
			eventMaster.setPrintRequired(false);
			eventMaster.setZoneId(zone);
			eventMaster.setSaveReport(eventReport);

			
			////////////System.out.println("Request String EventManagement GET : "+gson.toJson(eventMaster));
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Event_Management_Details"), gson.toJson(eventMaster),"GET");
		      //////////System.out.println(result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				
				
				eventMasterData = gson.fromJson(result, EventMaster.class);
				
				List<Integer> array = new ArrayList<Integer>();
				array.add(1);
				array.add(2);
				array.add(3);
				array.add(4);
				array.add(5);
				
				array.add(6);
				array.add(7);
				array.add(8);
				array.add(9);
				array.add(10);
				
				eventMasterData.getListOfEvents().get(0).setArray(array);
				eventMasterData.getListOfEvents().get(0).setTotalRecords(Integer.parseInt(Response.getResponseTotalRecords(result)));
				
				if(eventReport){
					   eventMasterData.getListOfEvents().get(0).setUrl(eventMasterData.getUrl());
						}
				
			}
			
			
		    //////////System.out.println(gson.toJson(eventMasterData));
			
			
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
		return eventMasterData.getListOfEvents();
	}



	public Map<String,Object> createEventManagemntMenu(Menu menu, String customerIdStr, String emailIdStr) {
		String result = null;
		Map<String,Object> responseMap = new HashMap<String, Object>();
		EventMaster eventMaster = null;
		try {
			
			menu.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			////////////////////System.out.println("Request String::::::::::::"+gson.toJson(menu));
			result = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_Event_Managment_menu"), gson.toJson(menu));
			String responseCode = Response.getResponseCode(result);
			//////////reqQtyresult);
			 eventMaster = gson.fromJson(result,EventMaster.class);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					
					
					result = Constants.SUCCESS;
					responseMap.put("result",result);
					responseMap.put("eventRef",eventMaster.getEventReference());
					
				}
			else{
				result = Response.getResponseMessage(result);
				responseMap.put("result",result);
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
		return responseMap;
	}
	
	
	
	

	public Map<String,Object> updateEventManagemntMenu(Menu menu, String customerIdStr, String emailIdStr) {
		String result = null;
		Map<String,Object> responseMap = new HashMap<String, Object>();
		EventMaster eventMaster = null;
		try {
			
			menu.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			//////////////System.out.println("Request String::::::::::::"+gson.toJson(menu));
			result = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_Event_Managment_menu"), gson.toJson(menu));
			String responseCode = Response.getResponseCode(result);
			//reqQtyresult);
			 eventMaster = gson.fromJson(result,EventMaster.class);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					
					
					result = Constants.SUCCESS;
					responseMap.put("result",result);
					responseMap.put("eventRef",eventMaster.getEventReference());
					
				}
			else{
				result = Response.getResponseMessage(result);
				responseMap.put("result",result);
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
		return responseMap;
	}
	
	
	
	
	public Map<String,Object> updateEventManagemnt(EventMaster eventMaster,String customerId,String emailId){
		String resultStr = null;
		Map<String,Object> responseMap = new HashMap<String, Object>();
		try {
			eventMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			SimpleDateFormat format1 = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
			
			if(eventMaster.getStartDateStr() != ""  && eventMaster.getStartDateStr() != null ){
				Date date = format1.parse(eventMaster.getStartDateStr());
				String startDateStr =  format2.format(date).toString();
				eventMaster.setStartDateStr(startDateStr);
			}
           if(eventMaster.getEndDateStr() != ""  && eventMaster.getEndDateStr() != null ){
        	   Date date1 = format1.parse(eventMaster.getEndDateStr());
        	   String endDateStr  =  format2.format(date1).toString();
        	   eventMaster.setEndDateStr(endDateStr);
			}
           if(eventMaster.getCreatedDateStr() != ""  && eventMaster.getCreatedDateStr() != null ){
        	   Date date2 = format1.parse(eventMaster.getCreatedDateStr());
        		String createdDateStr  =  format2.format(date2).toString();
        		eventMaster.setCreatedDateStr(createdDateStr);
            }
		
           if(eventMaster.getDueDateStr() != ""  && eventMaster.getDueDateStr() != null ){
        	   Date date2 = format1.parse(eventMaster.getDueDateStr());
        		String dueDateStr  =  format2.format(date2).toString();
        		eventMaster.setDueDateStr(dueDateStr);
            }
           if(eventMaster.getWorkflowStatus() == "Closed" || eventMaster.getWorkflowStatus().equalsIgnoreCase("Closed")){
        	   eventMaster.setEventStatus(false);
           }
           
           
           
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			////////////////////System.out.println("Request String::::::::::::"+gson.toJson(eventMaster));
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_Event_Managment"), gson.toJson(eventMaster));
			String responseCode = Response.getResponseCode(resultStr);
			////////////////////System.out.println(resultStr);
			 eventMaster = gson.fromJson(resultStr,EventMaster.class);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				
				
				resultStr = Constants.SUCCESS;
				responseMap.put("result",resultStr);
				responseMap.put("eventRef",eventMaster.getEventReference());
				
			}
			else{
				//result = "Couldn't create, please try after some time";
				resultStr = Response.getResponseMessage(resultStr);
				responseMap.put("result",resultStr);
			}
		} catch(ConnectException ce) {
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
		return responseMap;
	}



	public Map<String, Object> createEventManagemntInventory(EventMaster eventMaster, String customerIdStr,
			String emailIdStr) {
		
			String result = null;
			Map<String,Object> responseMap = new HashMap<String, Object>();
			try {
				
				eventMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				
				RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
				//reqQty"Request String::::::::::::"+gson.toJson(eventMaster));
				result = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_Event_Managment_inventory"), gson.toJson(eventMaster));
				String responseCode = Response.getResponseCode(result);
				//reqQtyresult);
				 eventMaster = gson.fromJson(result,EventMaster.class);
					if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
						
						
						result = Constants.SUCCESS;
						responseMap.put("result",result);
						responseMap.put("eventRef",eventMaster.getEventReference());
						
					}
				else{
					result = Response.getResponseMessage(result);
					responseMap.put("result",result);
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
			return responseMap;
		}


	
	public String loadMenu(String location,String customerIdStr, String emailIdStr) {

		String resultStr = null;
		try {
			EventMaster	eventMaster = new EventMaster();
			eventMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			eventMaster.setOutletStoreLocation(location.trim());
		//	eventMaster.setOperation(operation.trim());
			
			//System.out.println("Request String::::Load::::::::"+gson.toJson(eventMaster));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("load_Event_Managment_menu"), gson.toJson(eventMaster));
			//System.out.println("Response String::::Load:::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
		
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			//	resultStr = AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim();
		
				resultStr = Response.getResponseMessage(resultStr);
			}
			else{
				resultStr = Response.getResponseMessage(resultStr);
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
		return resultStr;
	}
	
	public String loadInventory(String location,String customerIdStr, String emailIdStr) {
		
		String resultStr = null;
		try {
			EventMaster	eventMaster = new EventMaster();
			eventMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			eventMaster.setOutletStoreLocation(location.trim());
			//	eventMaster.setOperation(operation.trim());
			
			//System.out.println("Request String::::Load::::::::"+gson.toJson(eventMaster));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			
			resultStr = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("load_Event_Managment_inventory"), gson.toJson(eventMaster));
			//System.out.println("Response String::::Load:::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				//	resultStr = AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim();
				
				resultStr = Response.getResponseMessage(resultStr);
			}
			else{
				resultStr = Response.getResponseMessage(resultStr);
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
		return resultStr;
	}
	
	
	
	

	public Map<String, Object> updateEventManagemntInventory(EventMaster eventMaster, String customerIdStr,
			String emailIdStr) {String result = null;
			Map<String,Object> responseMap = new HashMap<String, Object>();
			try {
				
				eventMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				
				RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
				//////////////////System.out.println("Request String::::::::::::"+gson.toJson(eventMaster));
				result = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_Event_Managment_inventory"), gson.toJson(eventMaster));
				String responseCode = Response.getResponseCode(result);
				////////////////System.out.println(result);
				 eventMaster = gson.fromJson(result,EventMaster.class);
					if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
						
						
						result = Constants.SUCCESS;
						responseMap.put("result",result);
						responseMap.put("eventRef",eventMaster.getEventReference());
						
					}
				else{
					result = Response.getResponseMessage(result);
					responseMap.put("result",result);
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
			return responseMap;
	}
		
	

	

	public Map<String, Object> createEventManagemntManpower(EventMaster eventMaster, String customerIdStr,
			String emailIdStr) {
		
			String result = null;
			Map<String,Object> responseMap = new HashMap<String, Object>();
			try {
				
				eventMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				
				RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
				//////reqQty"Request String::::::::::::"+gson.toJson(eventMaster));
				result = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_Event_Managment_emp"), gson.toJson(eventMaster));
				String responseCode = Response.getResponseCode(result);
				//////reqQtyresult);
				 eventMaster = gson.fromJson(result,EventMaster.class);
					if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
						
						
						result = Constants.SUCCESS;
						responseMap.put("result",result);
						responseMap.put("eventRef",eventMaster.getEventReference());
						
					}
				else{
					result = Response.getResponseMessage(result);
					responseMap.put("result",result);
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
			return responseMap;
		}



	public Map<String, Object> updateEventManagemntManpower(EventMaster eventMaster, String customerIdStr,
			String emailIdStr) {String result = null;
			Map<String,Object> responseMap = new HashMap<String, Object>();
			try {
				
				eventMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				
				RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
				//////////////////////////////System.out.println("Request String::::::::::::"+gson.toJson(eventMaster));
				result = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_Event_Managment_emp"), gson.toJson(eventMaster));
				String responseCode = Response.getResponseCode(result);
				////reqQtyresult);
				 eventMaster = gson.fromJson(result,EventMaster.class);
					if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
						
						
						result = Constants.SUCCESS;
						responseMap.put("result",result);
						responseMap.put("eventRef",eventMaster.getEventReference());
						
					}
				else{
					result = Response.getResponseMessage(result);
					responseMap.put("result",result);
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
			return responseMap;
	}



	
		
	
	
	public List<MachineAndEquipmentMaster> searchEquipments(String customerIdStr, String emailIdStr,
			String searchNameStr, String storeLocation, String string, boolean b) {
		String resultStr = null;
		RequestBean requestBeanObj = null;
		List<MachineAndEquipmentMaster> machineAndEquipmentMasters = null;
		MachineAndEquipmentMaster machineEquipment  = new MachineAndEquipmentMaster();
		RestfulServiceConnection restfulConnectionObj = null;
		try{
			restfulConnectionObj = new RestfulServiceConnection();
			requestBeanObj = new RequestBean();
			requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestBeanObj.setSearchCriteria(searchNameStr);
			requestBeanObj.setStartIndex("-1");
			requestBeanObj.setStoreLocation(storeLocation);
			
			////////////////////System.out.println("Request String::::"+gson.toJson(requestBeanObj));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_sku_for_Equipment"), gson.toJson(requestBeanObj), "GET");
				
			////////////////////System.out.println("Response String::::"+resultStr); 
			
			
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				String responseList = Response.getResponseList(resultStr, "listOfMachineEquipments");
				JSONArray jsonResponseArray = new JSONArray(responseList);
				machineAndEquipmentMasters = new ArrayList<MachineAndEquipmentMaster>();
			
				for (int i=0; i<jsonResponseArray.length(); i++) {
					machineEquipment = gson.fromJson(jsonResponseArray.getString(i), MachineAndEquipmentMaster.class);
					machineAndEquipmentMasters.add(machineEquipment);
				}
				
			}
			
			
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE").trim();
		}
		return machineAndEquipmentMasters;
		
	}
	
		
	


	public Map<String, Object> createEventManagemntEquipment(EventMaster eventMaster, String customerIdStr,
			String emailIdStr) {
		
			String result = null;
			Map<String,Object> responseMap = new HashMap<String, Object>();
			try {
				
				eventMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				
				RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
				////reqQty"Request String::::::::::::"+gson.toJson(eventMaster));
				result = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_Event_Managment_equipment"), gson.toJson(eventMaster));
				String responseCode = Response.getResponseCode(result);
				////reqQtyresult);
				 eventMaster = gson.fromJson(result,EventMaster.class);
					if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
						
						
						result = Constants.SUCCESS;
						responseMap.put("result",result);
						responseMap.put("eventRef",eventMaster.getEventReference());
						
					}
				else{
					result = Response.getResponseMessage(result);
					responseMap.put("result",result);
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
			return responseMap;
		}



	public Map<String, Object> updateEventManagemntEquipment(EventMaster eventMaster, String customerIdStr,
			String emailIdStr) {String result = null;
			Map<String,Object> responseMap = new HashMap<String, Object>();
			try {
				
				eventMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				
				RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
				////////////////////System.out.println("Request String::::::::::::"+gson.toJson(eventMaster));
				result = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_Event_Managment_equipment"), gson.toJson(eventMaster));
				String responseCode = Response.getResponseCode(result);
				//////////////////System.out.println(result);
				 eventMaster = gson.fromJson(result,EventMaster.class);
					if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
						
						
						result = Constants.SUCCESS;
						responseMap.put("result",result);
						responseMap.put("eventRef",eventMaster.getEventReference());
						
					}
				else{
					result = Response.getResponseMessage(result);
					responseMap.put("result",result);
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
			return responseMap;
	}

	//create inventory closure
	
		public Map<String, Object> createEventInventoryReturnDetails(EventMaster eventMaster, String customerIdStr,
				String emailIdStr) {
			
				String result = null;
				Map<String,Object> responseMap = new HashMap<String, Object>();
				try {
					
					eventMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
					
					RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
					//////////////System.out.println("create_Event_Inventory_Return_Details Request String::::::::::::"+gson.toJson(eventMaster));
					result = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_Event_Inventory_Return_Details"), gson.toJson(eventMaster));
					String responseCode = Response.getResponseCode(result);
					//////////////System.out.println(result);
					//reqQty"create_Event_Inventory_Return_Details"+result);
					 eventMaster = gson.fromJson(result,EventMaster.class);
						if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
							
							
							result = Constants.SUCCESS;
							responseMap.put("result",result);
							responseMap.put("eventRef",eventMaster.getEventReference());
							
						}
					else{
						result = Response.getResponseMessage(result);
						responseMap.put("result",result);
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
				return responseMap;
			}



		public List<EventMaster> PrintEventManagemntDetails(String eventref, String status,String printflow, String customerIdStr, String emailIdStr,String subCount) {
			String resultStr = null;
			List<EventMaster> eventMastersList = null;
			try {
				EventMaster eventMaster = new EventMaster();
				
				eventMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				eventMaster.setEventReference(eventref);
				eventMaster.setPrintRequired(true);
				eventMaster.setSummery(false);
				eventMaster.setStartIndex("0");
				eventMaster.setSubmissionCount(Integer.valueOf(subCount));
				
				if(status == "true" || status.equalsIgnoreCase("true")){
				eventMaster.setEventStatus(true);
				}else{
				eventMaster.setEventStatus(false);
				}
				
				if(printflow == "Inventory" || printflow.equalsIgnoreCase("Inventory")){
				eventMaster.setPrintDeliveryChallanRequired(true);
				}else{
				eventMaster.setPrintDeliveryChallanRequired(false);
				}
				
				
				if(printflow == "printinventoryReturn" || printflow.equalsIgnoreCase("printinventoryReturn")){
					eventMaster.setPrintReturnDeliveryChallanRequired(true);
					}else{
					eventMaster.setPrintReturnDeliveryChallanRequired(false);
					}
				
				if(printflow == "Equipmemt" || printflow.equalsIgnoreCase("Equipmemt")){
					eventMaster.setEquipmentPrintRequired(true);
					}else{
					eventMaster.setEquipmentPrintRequired(false);
					}
				
				
				
				
		        //////////////System.out.println(gson.toJson(eventMaster));
				RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
				resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Event_Management_Details"), gson.toJson(eventMaster),"GET");
				////////////System.out.println(resultStr);
				String responseCode = Response.getResponseCode(resultStr);
				
				
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
						String responseList = Response.getResponseList(resultStr, "listOfEvents");
						JSONArray jsonResponseArray = new JSONArray(responseList);
						eventMastersList = new ArrayList<EventMaster>();
						
						for (int i=0; i<jsonResponseArray.length(); i++) {
							eventMaster = gson.fromJson(jsonResponseArray.getString(i), EventMaster.class);
							eventMastersList.add(eventMaster);
						}
						resultStr = eventMastersList.get(0).getPrintURL();
					
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
			return eventMastersList;	
			
			
		}

		
		public  List<States> getStateMaster(String searchName,String customerId,String emailId,String index,String maxRecords,String searchCritaria,String groupId){
			String result = null;
			List<States> homePageGrouplist = null;
			try {
				States homePageGroup = new States();
				homePageGroup.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				homePageGroup.setStartIndex(index);
				homePageGroup.setMaxRecords(maxRecords);
				homePageGroup.setSearchCritaria(searchCritaria);
				//homePageGroup.setSearchCriteria(searchName);
				//homePageGroup.setGroupId(groupId);
				//////////////reqQtygson.toJson(homePageGroup));
	////			System.out.println("Requesting"+gson.toJson(homePageGroup));
				RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
				result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_states"), gson.toJson(homePageGroup),"GET");
	/////			System.out.println("Response"+result);
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			
					String responseList = Response.getResponseList(result, "stateMasters");
					JSONArray jsonResponseArray = new JSONArray(responseList);
					homePageGrouplist = new ArrayList<States>();
					
					int slNo = Integer.parseInt(index);
					for (int i=0; i<jsonResponseArray.length(); i++) {
						homePageGroup = gson.fromJson(jsonResponseArray.getString(i), States.class);
						//homePageGroup.setsNo(++slNo);
						homePageGrouplist.add(homePageGroup);
					}
					homePageGrouplist.get(0).setTotalRecords(Integer.parseInt(Response.getResponseTotalRecords(result)));
					
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
			return homePageGrouplist;
		}
		
		
		
		
		


		public Map<String, Object> createEventEquipmentReturnDetails(EventMaster eventMaster, String customerIdStr,
				String emailIdStr) {
			
				String result = null;
				Map<String,Object> responseMap = new HashMap<String, Object>();
				try {
					
					eventMaster.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
					
					RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
					////////////////////////////////System.out.println("create_Event_Equipment_Return_Details Request String::::::::::::"+gson.toJson(eventMaster));
					result = restfulServiceConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_Event_Equipment_Return_Details"), gson.toJson(eventMaster));
					String responseCode = Response.getResponseCode(result);
				//	//////////////////////////////System.out.println("create_Event_Equipment_Return_Details::::"+result);
					 eventMaster = gson.fromJson(result,EventMaster.class);
						if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
							result = Constants.SUCCESS;
							responseMap.put("result",result);
							responseMap.put("eventRef",eventMaster.getEventReference());
							
						}
					else{
						result = Response.getResponseMessage(result);
						responseMap.put("result",result);
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
				return responseMap;
			}


	

	
}
