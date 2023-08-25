package com.tlabs.posweb.services;

import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;

import com.tlabs.posweb.init.AppProperties;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
//import com.technolabssoftware.www.SkuServiceProxy;
import com.tlabs.posweb.beans.ProductsList;
import com.tlabs.posweb.beans.RequestBean;
import com.tlabs.posweb.beans.SearchProductResponse;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.util.Constants;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.RestfulServiceConnection;
//import com.tlabs.posweb.util.Utilities;

public class ProductService {

	@Autowired
	private Gson gson;
	@Autowired
	SessionScope sessionScope;
	private static Logger log = Logger.getLogger(ProductService.class);
	
	public List<ProductsList> searchProducts(String customerIdStr,String emailIdStr,String searchNameStr){
		String resultStr = null;
//		SkuServiceProxy skuProxyObj = null;
//		SkuProxy skuProxyObj = null;
		RequestBean requestBeanObj = null;
		List<ProductsList> productsLists = new ArrayList<ProductsList>();
		try{
			// log.info("Get Raw Material based on provided name");
//			skuProxyObj = new SkuServiceProxy();
//			skuProxyObj = new SkuProxy();
			requestBeanObj = new RequestBean();
			requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			requestBeanObj.setSearchCriteria(searchNameStr);
			requestBeanObj.setStartIndex("0");
			requestBeanObj.setStoreLocation("");
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			// log.info("Request String::::"+gson.toJson(requestBeanObj));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Sku_Service_search_products"), gson.toJson(requestBeanObj),"GET");
			//resultStr = skuProxyObj.searchProducts(gson.toJson(requestBeanObj));
					
			// log.info("Response String::::"+resultStr);
			ProductsList productsList = new ProductsList();
			
			SearchProductResponse searchProductResponse = gson.fromJson(resultStr,SearchProductResponse.class);
			if (searchProductResponse.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)) {
				for (int i = 0; i < searchProductResponse.getProductsList().length; i++) {
					productsList = searchProductResponse.getProductsList()[i];
					ProductsList product = new ProductsList();
					if (productsList.getSkuID().toLowerCase().contains(searchNameStr.toLowerCase())) {
						product.setDescription(productsList.getSkuID());
						product.setSkuID(productsList.getSkuID());
						product.setProductId(productsList.getProductId());
					} else if (productsList.getDescription().toLowerCase().contains(searchNameStr.toLowerCase())) {
						product.setDescription(productsList.getDescription());
						product.setSkuID(productsList.getSkuID());
						product.setProductId(productsList.getProductId());
					} else {
						product.setDescription(productsList.getProductId());
						product.setSkuID(productsList.getSkuID());
						product.setProductId(productsList.getProductId());
					}
					productsLists.add(product);
				}
			}
		/*}catch(ConnectException ce) {
			ce.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");*/
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST");
		/*} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("UNKNOWN_HOST");
		} catch (IOException ex) {
			ex.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");*/
		}catch(Exception e){
			e.printStackTrace();
			ProductsList product = new ProductsList();
			product.setNoData("No Data");
			productsLists.add(product);
		}
		return productsLists;
		
	}
	
	public List<ProductsList> searchSkus(String customerIdStr,String emailIdStr,String saleProductIds){
		String resultStr = null;
//		SkuServiceProxy skuProxyObj = null;
//		SkuProxy skuProxyObj = null;
		RequestBean requestBeanObj = null;
		List<ProductsList> productsLists = new ArrayList<ProductsList>();
		
		try{
			// log.info("Get Raw Material based on provided name");
			String[] products = saleProductIds.split(",");
			
			for(int i = 0;i<products.length;i++){
				
//			skuProxyObj = new SkuServiceProxy();
//			skuProxyObj = new SkuProxy(); 
			requestBeanObj = new RequestBean();
			requestBeanObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			//requestBeanObj.setProductId(products[i]);
			requestBeanObj.setSearchCriteria(products[i]);
			requestBeanObj.setStartIndex("0");
			requestBeanObj.setStoreLocation("");
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			// log.info("Request String::::"+gson.toJson(requestBeanObj));
			
			//resultStr = skuProxyObj.searchProducts(gson.toJson(requestBeanObj));
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Sku_Service_search_products"), gson.toJson(requestBeanObj),"GET");
			// log.info("Response String::::"+resultStr);
			
			ProductsList productsList = new ProductsList();
			
			SearchProductResponse searchProductResponse = gson.fromJson(resultStr,SearchProductResponse.class);
			if (searchProductResponse.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)) {/*
				for (int j = 0; j < searchProductResponse.getProductsList().length; j++) {
					productsList = searchProductResponse.getProductsList()[j];
					ProductsList product = new ProductsList();
					if (productsList.getSkuID().toLowerCase().contains(products[i].toLowerCase())) {
						product.setDescription(productsList.getSkuID());
						product.setSkuID(productsList.getSkuID());
						product.setProductId(productsList.getProductId());
					} else if (productsList.getDescription().toLowerCase().contains(products[i].toLowerCase())) {
						product.setDescription(productsList.getDescription());
						product.setSkuID(productsList.getSkuID());
						product.setProductId(productsList.getProductId());
					} else {
						product.setDescription(productsList.getProductId());
						product.setSkuID(productsList.getSkuID());
						product.setProductId(productsList.getProductId());
					}
					productsLists.add(product);
				}
			*/

				for (int j = 0; j < searchProductResponse.getProductsList().length; j++) {
					productsList = searchProductResponse.getProductsList()[j];
					ProductsList productList = new ProductsList();
					if(productsList.getDescription() != null && productsList.getDescription().toLowerCase().contains(products[i].toLowerCase())){
						productList.setDescription(productsList.getDescription());
						productList.setSkuID(productsList.getSkuID());
					}
					else if(productsList.getCategory() != null && productsList.getCategory().toLowerCase().contains(products[i].toLowerCase())){
						productList.setDescription(productsList.getCategory());
						productList.setSkuID(productsList.getSkuID());
					}
					else if (productsList.getSkuID() != null && productsList.getSkuID().toLowerCase().contains(products[i].toLowerCase())) {
						productList.setDescription(productsList.getSkuID());
						productList.setSkuID(productsList.getSkuID());
					}
					else {
						productList.setDescription(productsList.getProductId());
						productList.setSkuID(productsList.getSkuID());
					}
					productList.setPluCode(productsList.getPluCode());
					productList.setPrice(productsList.getPrice());
					productList.setProductName(productsList.getProductName());
					productsLists.add(productList);
				}
				
			}
			}
	/*	}catch(ConnectException ce) {
			ce.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING");*/
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST");
		/*} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("UNKNOWN_HOST");
		} catch (IOException ex) {
			ex.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("FAILED_TO_RECEIVE_RESPONSE");*/
		}catch(Exception e){
			e.printStackTrace();
			ProductsList product = new ProductsList();
			product.setNoData("No Data");
			productsLists.add(product);
		}
		// log.info(gson.toJson(productsLists));
		return productsLists;
		
	}
	
}
