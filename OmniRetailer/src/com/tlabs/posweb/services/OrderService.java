package com.tlabs.posweb.services;

import java.io.IOException;
import java.math.BigDecimal;
import java.rmi.ConnectException;
import java.rmi.RemoteException;
import java.rmi.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;

import com.tlabs.posweb.init.AppProperties;
import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.technolabssoftware.www.OrdersProxy;
//import com.technolabssoftware.www.UtilityMasterServiceProxy;
import com.tlabs.posweb.beans.Customer;
import com.tlabs.posweb.beans.CustomerAddress;
//import com.tlabs.posweb.beans.LocationBean;
import com.tlabs.posweb.beans.Order;
import com.tlabs.posweb.beans.OrderB2BSalesQuotation;
import com.tlabs.posweb.beans.OrderDetails;
import com.tlabs.posweb.beans.OrderSummaryResponse;
//import com.tlabs.posweb.beans.OrderedItems;
import com.tlabs.posweb.beans.OrdersBean;
import com.tlabs.posweb.beans.RequestBean;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.beans.ZoneMaster;
import com.tlabs.posweb.util.Constants;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
import com.tlabs.posweb.util.RestfulServiceConnection;
//import com.tlabs.posweb.util.Utilities;

public class OrderService {

	@Autowired
	private Gson gson;
	@Autowired
	SessionScope sessionScope;
	@Autowired
	private MasterService masterServiceObj;
	@Autowired
    private CustomerService customerServiceObj;
	
//	private static Logger log = Logger.getLogger(OrderService.class);

	
	public List<Order> getOrders(String searchNameStr,String operation,String status,Order 
			orderDetails,String location,String index,String startDateStr,String endDateStr,String maxRecordsStr,String flowUnder,String orderChannel,String orderStartValue,String orderEndValue){
					// log.info("orderService - getOrdersByLocation");
					String resultStr = null;
					Order beanObj = null;
					List<Order> lst_orders = null;
//					OrdersProxy obj_ordersProxy = new OrdersProxy();
					RestfulServiceConnection restfulConnectionObj = null;
					try{
						beanObj = new Order();
						restfulConnectionObj = new RestfulServiceConnection();
//						if(search){
//							orderDetails.setSearchCriteria(searchNameStr);
							orderDetails.setSaleLocation(location);
							orderDetails.setStartIndex(index);
							orderDetails.setOrderStatus(status);
							orderDetails.setOrderStartDate(startDateStr);
							orderDetails.setOrderEndDate(endDateStr);
							//added by vinay
							if(orderChannel.equals("all"))
							orderDetails.setOrderChannel("");
							else
							orderDetails.setOrderChannel(orderChannel);	
							orderDetails.setOrderEndValue(orderEndValue);
							orderDetails.setOrderStartValue(orderStartValue);
//						}else {
							orderDetails.setSaleLocation(location);
							if(!status.equals("all") && !status.equals("ShipmentOrders"))
								orderDetails.setOrderStatus(status);
							if(orderChannel.equals("all"))
							orderDetails.setOrderChannel("");
							else
							orderDetails.setOrderChannel(orderChannel);
//						}
						/*if(status.equals("ShipmentOrders"))
							orderDetails.setShippedOrders(true);*/
						if(operation.equals("Door Delivery"))
							orderDetails.setOrderDeliveryType(operation);
						/*if(flowUnder.equals("outlet"))
							orderDetails.setOutletAll(true);
						else if(flowUnder.equals("warehouse"))
							orderDetails.setWarehouseAll(true);*/
//						orderDetails.setForShipment(isForShipment);
						orderDetails.setMaxRecords(maxRecordsStr);
						orderDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
						////////////System.out.println("Request String : : : : "+ gson.toJson(orderDetails));
//						resultStr = obj_ordersProxy.getOrders(gson.toJson(orderDetails));
						resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Orders"), gson.toJson(orderDetails), "GET");
					    ////////System.out.println("Response get_Orders String : : : : "+ resultStr);
						
						beanObj = gson.fromJson(resultStr,Order.class); 
					
						if(resultStr.equals(Constants.RESPONSE_SUCCESS_CODE)){
							lst_orders = beanObj.getOrdersList();
//							int slNo = Integer.parseInt(orderDetails.getStartIndex());
							/*for(int i=0;i<lst_orders.size();i++){
								lst_orders.get(i).setOrderDate(lst_orders.get(i).getOrder_date());
								lst_orders.get(i).setDeliveryDate(lst_orders.get(i).getDelivery_date());
								lst_orders.get(i).setSlNo(++slNo);
						}*/
						lst_orders.get(0).setTotalRecords(beanObj.getTotalOrders());
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
					}
					catch(Exception exception){
						exception.printStackTrace();
					}
					return lst_orders;
				}
	
	
	
	
	public List<OrderDetails> getOrdersByLocation(String searchNameStr,String operation,String status,OrderDetails 
			orderDetails,String location,String index,boolean search,String startDateStr,String endDateStr,String maxRecordsStr,String flowUnder,boolean isForShipment,String orderChannel,String orderStartValue,String orderEndValue,String zoneId,String file){
					// log.info("orderService - getOrdersByLocation");
					String resultStr = null;
					RequestBean beanObj = null;
					List<OrderDetails> lst_orders = null;
//					OrdersProxy obj_ordersProxy = new OrdersProxy();
					RestfulServiceConnection restfulConnectionObj = null;
					try{
						beanObj = new RequestBean();
						restfulConnectionObj = new RestfulServiceConnection();
						if(search){
							orderDetails.setSearchCriteria(searchNameStr);
							orderDetails.setSaleLocation(location);
							orderDetails.setStartIndex(index);
							orderDetails.setOrderStatus(status);
							orderDetails.setOrderStartDate(startDateStr);
							orderDetails.setOrderEndDate(endDateStr);
							//added by vinay
							if(orderChannel.equals("all"))
							orderDetails.setOrderChannel("");
							else
							orderDetails.setOrderChannel(orderChannel);	
							orderDetails.setOrderEndValue(orderEndValue);
							orderDetails.setOrderStartValue(orderStartValue);
							
						}else {
							
							orderDetails.setSaleLocation(location);
							if(!status.equals("all") && !status.equals("ShipmentOrders"))
								orderDetails.setOrderStatus(status);
							orderDetails.setSearchCriteria(searchNameStr);
							orderDetails.setStartIndex(index);
							if(orderChannel.equals("all"))
							orderDetails.setOrderChannel("");
							
							else
							orderDetails.setOrderChannel(orderChannel);
						}
						if(status.equals("ShipmentOrders"))
							orderDetails.setShippedOrders(true);
						if(operation.equals("Door Delivery"))
							orderDetails.setOrderDeliveryType(operation);
						if(flowUnder.equals("outlet"))
							orderDetails.setOutletAll(true);
						else if(flowUnder.equals("warehouse"))
							orderDetails.setWarehouseAll(true);
						orderDetails.setForShipment(isForShipment);
						orderDetails.setMaxRecords(maxRecordsStr);
						orderDetails.setSaveFlag(false);
						orderDetails.setZoneId(zoneId);
						
				
						
						orderDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
						//// log.info("Request String : : : : "+ gson.toJson(orderDetails));
						//////////////System.out.println("Request String : : : :get orders :::::::::: "+ gson.toJson(orderDetails));
//						resultStr = obj_ordersProxy.getOrders(gson.toJson(orderDetails));
						resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Orders"), gson.toJson(orderDetails), "GET");
						//// log.info("Response String : : : : "+ resultStr);
					    //////////////System.out.println("Response String : : : : "+ resultStr);
						beanObj = gson.fromJson(resultStr,RequestBean.class); 
						if(beanObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
							lst_orders = beanObj.getOrdersList();
							int slNo = Integer.parseInt(orderDetails.getStartIndex());
							for(int i=0;i<lst_orders.size();i++){
								/*lst_orders.get(i).setOrderDate(lst_orders.get(i).getOrder_date());
								lst_orders.get(i).setDeliveryDate(lst_orders.get(i).getDelivery_date());*/
								lst_orders.get(i).setSlNo(++slNo);
						}
						lst_orders.get(0).setTotalRecords(beanObj.getTotalOrders());
						lst_orders.get(0).setUrlOfSaveOrders(beanObj.getUrlOfSaveOrders());
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
					}
					catch(Exception e)
					{
						
					}
					return lst_orders;
				}
	
	
	public List<OrderDetails> getOrdersByLocationOrders(String searchNameStr,String operation,String status,OrderDetails 
			orderDetails,String location,String index,boolean search,String startDateStr,String endDateStr,String maxRecordsStr,String flowUnder,boolean isForShipment,String orderChannel,String orderStartValue,String orderEndValue,String zoneId,String file,List<ZoneMaster> zoneList){
					// log.info("orderService - getOrdersByLocation");
					String resultStr = null;
					RequestBean beanObj = null;
					List<OrderDetails> lst_orders = null;
//					OrdersProxy obj_ordersProxy = new OrdersProxy();
					RestfulServiceConnection restfulConnectionObj = null;
					try{
						beanObj = new RequestBean();
						restfulConnectionObj = new RestfulServiceConnection();
						if(search){
							orderDetails.setSearchCriteria(searchNameStr);
							orderDetails.setSaleLocation(location);
							orderDetails.setStartIndex(index);
							orderDetails.setOrderStatus(status);
							orderDetails.setOrderStartDate(startDateStr);
							orderDetails.setOrderEndDate(endDateStr);
							//added by vinay
							if(orderChannel.equals("all"))
							orderDetails.setOrderChannel("");
							else
							orderDetails.setOrderChannel(orderChannel);	
							orderDetails.setOrderEndValue(orderEndValue);
							orderDetails.setOrderStartValue(orderStartValue);
							
						}else {
							
							orderDetails.setSaleLocation(location);
							if(!status.equals("all") && !status.equals("ShipmentOrders"))
								orderDetails.setOrderStatus(status);
							orderDetails.setSearchCriteria(searchNameStr);
							orderDetails.setStartIndex(index);
							if(orderChannel.equals("all"))
							orderDetails.setOrderChannel("");
							
							else
							orderDetails.setOrderChannel(orderChannel);
						}
						if(status.equals("ShipmentOrders"))
							orderDetails.setShippedOrders(true);
						if(operation.equals("Door Delivery"))
							orderDetails.setOrderDeliveryType(operation);
						if(flowUnder.equals("outlet"))
							orderDetails.setOutletAll(true);
						else if(flowUnder.equals("warehouse"))
							orderDetails.setWarehouseAll(true);
						orderDetails.setForShipment(isForShipment);
						orderDetails.setMaxRecords(maxRecordsStr);
						orderDetails.setSaveFlag(false);
						orderDetails.setZoneId(zoneId);
						
						if(zoneId.equals("") || zoneId=="")
						{
							List<String> zoneL = new ArrayList<String>(); 
							for(ZoneMaster zone :zoneList ){
								
								zoneL.add(zone.getZoneID());
								
							}
						
							if(zoneL.size()>0 && !zoneL.isEmpty())
							{
							
									orderDetails.setZoneList(zoneL);
								
							}
							
						}
						
						orderDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
						//// log.info("Request String : : : : "+ gson.toJson(orderDetails));
						//////////System.out.println("Request String : : : :get orders :::::::::: "+ gson.toJson(orderDetails));
//						resultStr = obj_ordersProxy.getOrders(gson.toJson(orderDetails));
						resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Orders"), gson.toJson(orderDetails), "GET");
						//// log.info("Response String : : : : "+ resultStr);
					    //////////System.out.println("Response String : : : : "+ resultStr);
						beanObj = gson.fromJson(resultStr,RequestBean.class); 
						if(beanObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
							lst_orders = beanObj.getOrdersList();
							int slNo = Integer.parseInt(orderDetails.getStartIndex());
							for(int i=0;i<lst_orders.size();i++){
								/*lst_orders.get(i).setOrderDate(lst_orders.get(i).getOrder_date());
								lst_orders.get(i).setDeliveryDate(lst_orders.get(i).getDelivery_date());*/
								lst_orders.get(i).setSlNo(++slNo);
						}
						lst_orders.get(0).setTotalRecords(beanObj.getTotalOrders());
						lst_orders.get(0).setUrlOfSaveOrders(beanObj.getUrlOfSaveOrders());
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
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}
					return lst_orders;
				}
	
	
	public List<OrderDetails> getOrdersByLocations(String searchNameStr,String operation,String status,OrderDetails 
			orderDetails,String location,String index,boolean search,String startDateStr,String endDateStr,String maxRecordsStr,String flowUnder,boolean isForShipment,String orderChannel,String orderStartValue,String orderEndValue,String zoneId,String file,String deliverySlotStartTime,String deliverySlotEndTime,List<ZoneMaster> zoneList){
					// log.info("orderService - getOrdersByLocation");
					String resultStr = null;
					RequestBean beanObj = null;
					List<OrderDetails> lst_orders = null;
//					OrdersProxy obj_ordersProxy = new OrdersProxy();
					RestfulServiceConnection restfulConnectionObj = null;
					try{
						beanObj = new RequestBean();
						restfulConnectionObj = new RestfulServiceConnection();
						if(search){
							orderDetails.setSearchCriteria(searchNameStr);
							orderDetails.setSaleLocation(location);
							orderDetails.setStartIndex(index);
							orderDetails.setOrderStatus(status);
							orderDetails.setOrderStartDate(startDateStr);
							orderDetails.setOrderEndDate(endDateStr);
							orderDetails.setDeliverySlotStartTime(deliverySlotStartTime);
							orderDetails.setDeliverySlotEndTime(deliverySlotEndTime);
							//added by vinay
							if(orderChannel.equals("all"))
							orderDetails.setOrderChannel("");
							else
							orderDetails.setOrderChannel(orderChannel);	
							orderDetails.setOrderEndValue(orderEndValue);
							orderDetails.setOrderStartValue(orderStartValue);
							
						}else {
							
							orderDetails.setSaleLocation(location);
							if(!status.equals("all") && !status.equals("ShipmentOrders"))
								orderDetails.setOrderStatus(status);
							orderDetails.setSearchCriteria(searchNameStr);
							orderDetails.setStartIndex(index);
							if(orderChannel.equals("all"))
							orderDetails.setOrderChannel("");
							
							else
							orderDetails.setOrderChannel(orderChannel);
						}
						if(status.equals("ShipmentOrders"))
							orderDetails.setShippedOrders(true);
						if(operation.equals("Door Delivery"))
							orderDetails.setOrderDeliveryType(operation);
						if(flowUnder.equals("outlet"))
							orderDetails.setOutletAll(true);
						else if(flowUnder.equals("warehouse"))
							orderDetails.setWarehouseAll(true);
						orderDetails.setForShipment(isForShipment);
						orderDetails.setMaxRecords(maxRecordsStr);
						if(file.equals("false"))
						{
							orderDetails.setSaveFlag(false);
						}
						else
						{
							orderDetails.setSaveFlag(true);
						}
						
						
						
						orderDetails.setZoneId(zoneId);
						
						
						if(zoneId.equals("") || zoneId=="")
						{
							List<String> zoneL = new ArrayList<String>(); 
							for(ZoneMaster zone :zoneList ){
								zoneL.add(zone.getZoneID());
							}
						
							if(zoneL.size()>0 && !zoneL.isEmpty())
							{
									orderDetails.setZoneList(zoneL);
							}

						}
						
						orderDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
						//// log.info("Request String : : : : "+ gson.toJson(orderDetails));
						//////////System.out.println("Request String : : : :get orders :::::::::: "+ gson.toJson(orderDetails));
//						resultStr = obj_ordersProxy.getOrders(gson.toJson(orderDetails));
						resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Orders"), gson.toJson(orderDetails), "GET");
						//// log.info("Response String : : : : "+ resultStr);
					  // ////////System.out.println("Response String : : : : "+ resultStr);
						beanObj = gson.fromJson(resultStr,RequestBean.class); 
						if(beanObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
							lst_orders = beanObj.getOrdersList();
							int slNo = Integer.parseInt(orderDetails.getStartIndex());
							for(int i=0;i<lst_orders.size();i++){
								/*lst_orders.get(i).setOrderDate(lst_orders.get(i).getOrder_date());
								lst_orders.get(i).setDeliveryDate(lst_orders.get(i).getDelivery_date());*/
								lst_orders.get(i).setSlNo(++slNo);
						}
						lst_orders.get(0).setTotalRecords(beanObj.getTotalOrders());
						lst_orders.get(0).setUrlOfSaveOrders(beanObj.getUrlOfSaveOrders());
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
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}
					return lst_orders;
				}
	
	
	
	/**
	 * @author Mythri.S	
	 * 
	 * This method is used to call the createOder method of web service and return the response
	 * 
	 */
	public String createOrder(Order orderDetails,String customerId,String emailId){
		String result = null;
		RestfulServiceConnection restfulConnectionObj = null;
		try {
			restfulConnectionObj = new RestfulServiceConnection();
			orderDetails.setSales_executive_name(orderDetails.getSalesmanName());
			orderDetails.setSalesmanName(null);
//			OrdersProxy obj_ordersProxy = new OrdersProxy();
			orderDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			orderDetails.setOrderedItemsList(orderDetails.getItemDetails());
			//orderDetails.setTotalOrderAmount(orderDetails.getOrderTotalCost()-orderDetails.getOtherDiscounts().floatValue());
			if(orderDetails.getCartId() != null && orderDetails.getCartId().equals(""))
				orderDetails.setCartId(null);
			if(orderDetails.getShipmentCharges() != null && orderDetails.getShipmentCharges().equals(""))
				orderDetails.setShipmentCharges(null);
	////	System.out.println("Request create_Order String::::::::::"+gson.toJson(orderDetails));
//			result = obj_ordersProxy.createOrder(gson.toJson(orderDetails));
			result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_Order"), gson.toJson(orderDetails));
 			//////////System.out.println("Response String::::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("ORDER_CREATE_SUCCESS").trim();
			}
			else{
				result = Response.getResponseMessage(result);
			}
			Customer customerObj = new Customer();
			List<CustomerAddress> addressList = new ArrayList<CustomerAddress>();
			JSONArray jsonResponseArray = new JSONArray(orderDetails.getAddress());
			for (int i=0; i<jsonResponseArray.length(); i++) {
				CustomerAddress customerAddressObj = gson.fromJson(jsonResponseArray.getString(i), CustomerAddress.class);
				if(!customerAddressObj.isEmpty())
					addressList.add(customerAddressObj);
			}
			customerObj.setAddressList(addressList);
			customerObj.setEmail(orderDetails.getEmail_id());
			customerObj.setPhone(orderDetails.getMobile_num());
//			customerObj.setMobileNumber(orderDetails.getMobile_num());
			customerObj.setHouseNo(orderDetails.getCustomer_address_doorNo());
			customerObj.setStreet(orderDetails.getCustomer_address_street());
			customerObj.setLocality(orderDetails.getCustomer_address_location());
			customerObj.setCity(orderDetails.getCustomer_address_city());
			customerObj.setCountry(orderDetails.getCountry());
			customerObj.setState(orderDetails.getShipmentState());
			customerObj.setName(orderDetails.getShipmentName());
			customerObj.setCustomerGstin(addressList.get(0).getCustomerGstin());
			customerServiceObj.updateCustomer(customerObj);
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
	 * This method is used to call the updateOrder method of web service and return the response
	 * 
	 */
	public String updateOrder(Order orderDetails,String customerId,String emailId){
		String result = null;
		RestfulServiceConnection restfulConnectionObj = null;
		try {
			restfulConnectionObj = new RestfulServiceConnection();
//			OrdersProxy obj_ordersProxy = new OrdersProxy();
			orderDetails.setSales_executive_name(orderDetails.getSalesmanName());
			orderDetails.setSalesmanName(null);
			orderDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			orderDetails.setOrderedItemsList(orderDetails.getItemDetails());
			//orderDetails.setTotalOrderAmount(orderDetails.getOrderTotalCost()-orderDetails.getOtherDiscounts().floatValue());
			//orderDetails.setTotalOrderAmount(orderDetails.getOrderTotalCost());
			/*if(orderDetails.getCartId() != null && orderDetails.getCartId().equals(""))
				orderDetails.setCartId(null);*/
			if(orderDetails.getShipmentCharges() != null && orderDetails.getShipmentCharges().equals(""))
				orderDetails.setShipmentCharges(null);
			// log.info("Request String::::::::::"+gson.toJson(orderDetails));
			////////System.out.println("update order Request String::::::::::"+gson.toJson(orderDetails));
//			result = obj_ordersProxy.updateOrder(gson.toJson(orderDetails));
			
			result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_Order"), gson.toJson(orderDetails));
			// log.info("Response String::::::::::::"+result);
			////////System.out.println("Response String::::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("ORDER_UPDATE_SUCCESS").trim();
			}
			else{
//				responseMessage = "Couldn't update, please try after some time";
				result = Response.getResponseMessage(result);
			}
			Customer customerObj = new Customer();
			List<CustomerAddress> addressList = new ArrayList<CustomerAddress>();
			JSONArray jsonResponseArray = new JSONArray(orderDetails.getAddress());
			for (int i=0; i<jsonResponseArray.length(); i++) {
				CustomerAddress customerAddressObj = gson.fromJson(jsonResponseArray.getString(i), CustomerAddress.class);
				if(!customerAddressObj.isEmpty())
					addressList.add(customerAddressObj);
			}
			customerObj.setAddressList(addressList);
			customerObj.setEmail(orderDetails.getEmail_id());
			customerObj.setPhone(orderDetails.getMobile_num());
//			customerObj.setMobileNumber(orderDetails.getMobile_num());
			customerObj.setHouseNo(orderDetails.getCustomer_address_doorNo());
			customerObj.setStreet(orderDetails.getCustomer_address_street());
			customerObj.setLocality(orderDetails.getCustomer_address_location());
			customerObj.setCity(orderDetails.getCustomer_address_city());
			customerObj.setCountry(orderDetails.getCountry());
			////////////////System.out.println("update customer Request String::::::::::"+gson.toJson(customerObj));
			//customerServiceObj.updateCustomer(customerObj);
			
			
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
	
	
	
	
	public String assigendLocationsBasedOnOrders(String customerId,String emailId,String orderIds,String location){
		String result = null;
		RestfulServiceConnection restfulConnectionObj = null;
		Order orderbean = new Order();
		List<String> orderList = new ArrayList<String>();
		try {
//			UtilityMasterServiceProxy utitlitymaster = new UtilityMasterServiceProxy();
			restfulConnectionObj = new RestfulServiceConnection();
			String[] orderIdds = orderIds.split(",");
			for(int i=0;i<orderIdds.length;i++){
				orderList.add(orderIdds[i]);
			}
			orderbean.setOrderIdsList(orderList);
			orderbean.setSaleLocation(location);
			orderbean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
//			////////////////System.out.println("update order Locations Request String::::::::::"+gson.toJson(orderbean));

			result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_OrderLocations"), gson.toJson(orderbean));
//		////////////////System.out.println(result);
			// log.info(result);
			 String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					result = AppProperties.getAppMessageByProperty("ORDER_ASSIGNED_SUCCESSFULLY").trim();
				}
				else{
//					result = "Couldn't update, please try after some time";
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
	
	
	
	public Order getOrderDetailsByLocation(Order orderDetails){
		
		/**
		 * @author Sambaiah.Y
		 * @createdon  29-04-2015
		 * @param orderid and order location 
		 * 
		 * This method is used to get the specific order details based on order reference
		 */
		
		// log.info("OrderService - getOrderDetailsByLocation()");
		String str_response = null;
		Order orderdetails = null;
		OrdersBean beanObj = null;
		RestfulServiceConnection restfulConnectionObj = null;
//		OrdersProxy obj_ordersProxy = new OrdersProxy();
		try{
			orderdetails = new Order();
			beanObj = new OrdersBean();
			restfulConnectionObj = new RestfulServiceConnection();
			orderDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			////////System.out.println("Request String : : : : " + gson.toJson(orderDetails));
//			str_response = obj_ordersProxy.getOrderDetails(gson.toJson(orderDetails));
			str_response = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Order_Details"), gson.toJson(orderDetails), "GET");
			 ////////System.out.println(" order detials Response String : : : : " + str_response);
			
			beanObj = gson.fromJson(str_response,OrdersBean.class); 
			if(beanObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				orderdetails = beanObj.getOrder();
				orderdetails.setOrderedItemsList(beanObj.getItemDetails());
			/*	orderdetails.setOrderDate(orderdetails.getOrder_date());
				orderdetails.setDeliveryDate(orderdetails.getDelivery_date());*/
				List<CustomerAddress> addressList = new ArrayList<CustomerAddress>();
				if(orderdetails.getMobile_num() != null){
					Customer custDetails=masterServiceObj.getCustomerDetails(orderdetails.getMobile_num(), "", false);
					CustomerAddress customerAddressObj = new CustomerAddress();
					if(orderdetails.getShipmentContact()!=null && orderdetails.getShipmentContact()!=""){
						customerAddressObj.setCity(orderdetails.getShipement_address_city());
						customerAddressObj.setCountry(orderdetails.getShipmentCountry());
						customerAddressObj.setDoorNumber(orderdetails.getShipement_address_doorNo());
						customerAddressObj.setLocality(orderdetails.getShipement_address_location());
						customerAddressObj.setShipmentContact(orderdetails.getShipmentContact());
						customerAddressObj.setShipmentName(orderdetails.getShipmentName());
						customerAddressObj.setState(orderdetails.getShipmentState());
						customerAddressObj.setStreetName(orderdetails.getShipement_address_street());
						customerAddressObj.setLatitude(orderdetails.getLatitude());
						customerAddressObj.setLongitude(orderdetails.getLongitude());
						addressList.add(customerAddressObj);
					}else{
						if(custDetails.getAddressList() != null && custDetails.getAddressList().size() >0){
						customerAddressObj.setCity(custDetails.getAddressList().get(0).getCity());
						customerAddressObj.setCountry(custDetails.getAddressList().get(0).getCountry());
						customerAddressObj.setDoorNumber(custDetails.getAddressList().get(0).getDoorNumber());
						customerAddressObj.setLocality(custDetails.getAddressList().get(0).getLocality());
						customerAddressObj.setShipmentContact(custDetails.getAddressList().get(0).getShipmentContact());
						customerAddressObj.setShipmentName(custDetails.getAddressList().get(0).getShipmentName());
						customerAddressObj.setState(custDetails.getAddressList().get(0).getState());
						customerAddressObj.setStreetName(custDetails.getAddressList().get(0).getStreetName());
						customerAddressObj.setLatitude(custDetails.getAddressList().get(0).getLatitude());
						customerAddressObj.setLongitude(custDetails.getAddressList().get(0).getLongitude());
						
						orderdetails.setShipmentCountry(custDetails.getAddressList().get(0).getCountry());
						orderdetails.setShipement_address_city(custDetails.getAddressList().get(0).getCity());
						orderdetails.setShipement_address_doorNo(custDetails.getAddressList().get(0).getDoorNumber());
						orderdetails.setShipement_address_location(custDetails.getAddressList().get(0).getLocality());
						orderdetails.setShipmentContact(custDetails.getAddressList().get(0).getShipmentContact());
						orderdetails.setShipmentName(custDetails.getAddressList().get(0).getShipmentName());
						orderdetails.setShipmentState(custDetails.getAddressList().get(0).getState());
						orderdetails.setShipement_address_street(custDetails.getAddressList().get(0).getStreetName());
						orderdetails.setLatitude(custDetails.getAddressList().get(0).getLatitude());
						orderdetails.setLongitude(custDetails.getAddressList().get(0).getLongitude());
						addressList.add(customerAddressObj);
						}
						else{
							addressList.add(customerAddressObj);
						}
					}
					
					if(custDetails.getAddressList() != null && custDetails.getAddressList().size() >0){
						int addressLength = custDetails.getAddressList().size(); 
						for(int i = 0; i<addressLength;i++){
							if(!custDetails.getAddressList().get(i).isEmpty())
							if(customerAddressObj.equals(custDetails.getAddressList().get(i))){
								addressList.get(0).setCustAddressId(custDetails.getAddressList().get(i).getCustAddressId());
//								addressList.get(0).setLongitude(custDetails.getAddressList().get(i).getLongitude());
							}
							else
								
								
							if(customerAddressObj.getDoorNumber() == null){
								customerAddressObj.setDoorNumber("");
							}
							if(customerAddressObj.getLocality() == null){
								customerAddressObj.setLocality("");
							}
							if(customerAddressObj.getShipmentContact() == null){
								customerAddressObj.setShipmentContact("");
							}
							if(customerAddressObj.getShipmentName() == null){
								customerAddressObj.setShipmentName("");
							}
							
							
							if(customerAddressObj.getLatitude() == null){
								customerAddressObj.setLatitude("");
							}
							if(customerAddressObj.getLongitude() == null){
								customerAddressObj.setLongitude("");
							}
								
							
							
							if(customerAddressObj.getDoorNumber().equals(custDetails.getAddressList().get(i).getDoorNumber()) &&customerAddressObj.getLocality().equals(custDetails.getAddressList().get(i).getLocality()) &&customerAddressObj.getShipmentContact().equals(custDetails.getAddressList().get(i).getShipmentContact()) &&customerAddressObj.getShipmentName().equals(custDetails.getAddressList().get(i).getShipmentName()) &&customerAddressObj.getLatitude().equals(custDetails.getAddressList().get(i).getLatitude())  &&customerAddressObj.getLongitude().equals(custDetails.getAddressList().get(i).getLongitude())){
								
							}else{
							
								addressList.add(custDetails.getAddressList().get(i));
							}
						}
						for(int i = addressLength; i < 5; i++)
							addressList.add(new CustomerAddress());
					}else{
						for(int i = 1; i<5;i++)
							addressList.add(new CustomerAddress());
					}
					orderdetails.setCustomerGstin(custDetails.getCustomerGstin());
				}else{
					for(int i = 1; i<5;i++)
						addressList.add(new CustomerAddress());
				}
				orderdetails.setAddressList(addressList);
				
				
//				orderDetails.setCustAddressId(addressList.get(0).getCustAddressId());
				orderdetails.setViewOrEdit(orderDetails.getViewOrEdit());
				
			}
		}catch(Exception exception){
			exception.printStackTrace();
		}
		////////System.out.println("response end:: " + gson.toJson(orderdetails));
		return orderdetails;
	}
	
	
	
	
	
	
	
	
	
	public List<String> searchSalesOrders(String customerIdStr,String emailIdStr,String location,String searchName,String shipmentMode,boolean isForShipment){
		List<String> orderIdList = new ArrayList<String>();
		try{
		OrderDetails orderDetails = new OrderDetails();
		orderDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
		orderDetails.setShipmentMode(shipmentMode);
		List<OrderDetails> orderDetailsList = getOrdersByLocation(searchName, "Door Delivery", "", orderDetails, location, "-1", true, "", "", "", "all",isForShipment,"","","","","false");
		if(orderDetailsList != null)
			for(OrderDetails orders : orderDetailsList){
				if(orders.getOrderStatus() != null)
					orderIdList.add(orders.getOrderId());
			}
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return orderIdList;
	}
	
	
	/*public List<OrderDetails> getWarehouseOrdersByLocation(String status,OrderDetails orderDetails,String location,String index){
		*//**
		 * @author Sambaiah.Y
		 * @createdon : 29-04-2015 
		 * @param customerId,location,status of order
		 * 	
		 * This method is used to get the order details based on the location and status from web services
		 * 
		 * @return list of location wise order details
		 *//*
		
		// log.info("orderService - getWarehouseOrdersByLocation");
		String resultStr = null;
		RequestBean beanObj = null;
//		List<OrderDetails> orderDetailsDraftList = new ArrayList<OrderDetails>();
//		List<OrderDetails> orderDetailsAllList = new ArrayList<OrderDetails>();
		List<OrderDetails> lst_orders = null;
		WHOrdersProxy whOrdersProxyObj = new WHOrdersProxy();
		try{
			beanObj = new RequestBean();
			orderDetails.setSaleLocation(location);
			if(!status.equals("all"))
				orderDetails.setOrderStatus(status);
			orderDetails.setStartIndex(index);
			// log.info("Request String : : : : "+ gson.toJson(orderDetails));
			resultStr = whOrdersProxyObj.getOrders(gson.toJson(orderDetails));
			// log.info("Response String : : : : "+ resultStr);
			beanObj = gson.fromJson(resultStr,RequestBean.class); 
			if(beanObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				lst_orders = beanObj.getOrdersList();
				for(int i=0;i<lst_orders.size();i++){
					
//					String orderStatus = lst_orders.get(i).getOrderStatus();
					Date date = null;
					Calendar c = Calendar.getInstance();
					SimpleDateFormat  formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					date = formatter.parse(lst_orders.get(i).getOrderDate());
					c.setTime(date);
					int mon = c.get(Calendar.MONTH) +1;
					String orderDate = c.get(Calendar.DATE) +"/"+ mon +"/"+ c.get(Calendar.YEAR);
					lst_orders.get(i).setOrderDate(orderDate);
			}
				lst_orders.get(0).setTotalRecords(beanObj.getTotalOrders());
		}
		}catch (ParseException e) {
			e.printStackTrace();
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
		}
		
//		if(status.equals("pending"))
//			return orderDetailsDraftList;
//		else
//			return orderDetailsAllList;
		return lst_orders;
	}*/
	
	
	/**
	 * @author Mythri.S	
	 * 
	 * This method is used to call the createOder method of web service and return the response
	 * 
	 */
	/*public String createWarehouseOrder(OrderDetails orderDetails,String customerId,String emailId){
		String result = null;
		try {
			WHOrdersProxy whOrdersProxyObj = new WHOrdersProxy();
			orderDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerId, emailId));
			// log.info("Request String::::::::::"+gson.toJson(orderDetails));
			orderDetails.setTotalOrderAmount(orderDetails.getOrderTotalCost());
			result = whOrdersProxyObj.createOrder(gson.toJson(orderDetails));
			// log.info("Response String::::::::::::"+result);
			String responseCode = Response.getResponseCode(result);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				result = AppProperties.getAppMessageByProperty("ORDER_CREATE_SUCCESS").trim();
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
	}*/
	
/*public OrderDetails getWarehouseOrderDetailsByLocation(OrderDetails orderDetails){
		
		*//**
		 * @author Sambaiah.Y
		 * @createdon  29-04-2015
		 * @param orderid and order location 
		 * 
		 * This method is used to get the specific order details based on order reference
		 *//*
		
		// log.info("OrderService - getWarehouseOrderDetailsByLocation()");
		String str_response = null;
		OrderDetails orderdetails = null;
		OrdersBean beanObj = null;
		WHOrdersProxy whOrdersProxyObj = new WHOrdersProxy();
		try{
			orderdetails = new OrderDetails();
			beanObj = new OrdersBean();
			// log.info("Request String : : : : " + gson.toJson(orderDetails));
			str_response = whOrdersProxyObj.getOrderDetails(gson.toJson(orderDetails));
			// log.info("Response String : : : : " + str_response);
			beanObj = gson.fromJson(str_response,OrdersBean.class); 
			if(beanObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				orderdetails = beanObj.getWhOrder();
				orderdetails.setItemDetails(beanObj.getItemDetails());
				// log.info(orderdetails.getOrderDate());
				// log.info(orderdetails.getDeliveryDate());
				Date date = null;
				Calendar c = Calendar.getInstance();
				SimpleDateFormat  formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				date = formatter.parse(orderdetails.getOrderDate());
				c.setTime(date);
				int mon = c.get(Calendar.MONTH) +1;
				String orderDate = c.get(Calendar.DATE) +"/"+ mon +"/"+ c.get(Calendar.YEAR);
				date = formatter.parse(orderdetails.getDeliveryDate());
				c.setTime(date);
				mon = c.get(Calendar.MONTH) +1;
				String deliveryDate = c.get(Calendar.DATE) +"/"+ mon +"/"+ c.get(Calendar.YEAR);
				orderdetails.setOrderDate(orderDate);
				orderdetails.setDeliveryDate(deliveryDate);
				// log.info(orderdetails.getItemDetails().size());
			}
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return orderdetails;
	}*/

/*public String updateWarehouseOrder(OrderDetails orderDetails,String customerId,String emailId){
	String result = null;
	try {
		WHOrdersProxy whOrdersProxyObj= new WHOrdersProxy();
		orderDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerId, emailId));
		// log.info("Request String::::::::::"+gson.toJson(orderDetails));
		orderDetails.setTotalOrderAmount(orderDetails.getOrderTotalCost());
		result = whOrdersProxyObj.updateOrder(gson.toJson(orderDetails));
		// log.info("Response String::::::::::::"+result);
		String responseCode = Response.getResponseCode(result);
		if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
			result = AppProperties.getAppMessageByProperty("ORDER_UPDATE_SUCCESS").trim();
		}
		else{
//			responseMessage = "Couldn't update, please try after some time";
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
}*/

/**
 * 
 * @author mythri
 * created on : 23/4/2016
 * 
 * This method is used to call webservices for getting order summary and send the response to controller
 * 
 */
public OrderSummaryResponse getOrderSummary(String location,String startDate,String endDate,String status,String customerIdStr,String emailIdStr){
			// log.info("orderService - getOrderSummary");
			String resultStr = null;
			OrderSummaryResponse orderSummaryResponseObj = new OrderSummaryResponse();
			OrdersProxy obj_ordersProxy = new OrdersProxy();
			try{
				orderSummaryResponseObj.setSaleLocation(location);
				orderSummaryResponseObj.setOrderStartDate(startDate);
				orderSummaryResponseObj.setOrderEndDate(endDate);
				if(!status.equals("all"))
					orderSummaryResponseObj.setOrderStatus(status);
				orderSummaryResponseObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				
				/*// log.info("Request String : : : : "+ gson.toJson(orderSummaryResponseObj));
//				////////////////System.out.println("Request String : : : : "+ gson.toJson(orderSummaryResponseObj));
				resultStr = obj_ordersProxy.getOrdersSummary(gson.toJson(orderSummaryResponseObj));
				// log.info("Response String : : : : "+ resultStr);
//			   ////////////////System.out.println("Response String : : : : "+ resultStr);
*/				

				RestfulServiceConnection restFulServiceConnectionObj = new RestfulServiceConnection();
				resultStr = restFulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_Order_summary"),gson.toJson(orderSummaryResponseObj), "GET");

				orderSummaryResponseObj = gson.fromJson(resultStr,OrderSummaryResponse.class); 
				if(orderSummaryResponseObj.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
					/*orderSummaryResponseObj.setTotalOrderAmt(Math.round(orderSummaryResponseObj.getTotalOrderAmt()*100.0)/100.0);
					orderSummaryResponseObj.setTotalOrderTax(Math.round(orderSummaryResponseObj.getTotalOrderTax()*100.0)/100.0);
					orderSummaryResponseObj.setPendingOrderAmt(Math.round(orderSummaryResponseObj.getPendingOrderAmt()*100.0)/100.0);
					orderSummaryResponseObj.setPendingCartAmt(Math.round(orderSummaryResponseObj.getPendingCartAmt()*100.0)/100.0);
					orderSummaryResponseObj.setFulFilledOrderAmt(Math.round(orderSummaryResponseObj.getFulFilledOrderAmt()*100.0)/100.0);
					orderSummaryResponseObj.setSummaryList(orderSummaryResponseObj.getSummaryList());*/
					if(!location.equals(""))
						orderSummaryResponseObj.setSaleLocation(location);
					else
						orderSummaryResponseObj.setSaleLocation("ALL");
					orderSummaryResponseObj.setOrderStartDate(startDate);
					orderSummaryResponseObj.setOrderEndDate(endDate);
					orderSummaryResponseObj.setOrderStatus(status);
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
			}
				catch(Exception e){
				e.printStackTrace();
				}
			return orderSummaryResponseObj;
		}


	public List<OrderB2BSalesQuotation> getSaleQuotation(String zone,String location,String startValue,String endValue,String status,String startDate,String endDate,String searchCreteria,String index,String quotationId){
		String resultStr = null;
		OrderB2BSalesQuotation orderSalesQuotation=null;
		try{
			orderSalesQuotation = new OrderB2BSalesQuotation();
			orderSalesQuotation.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			orderSalesQuotation.setZoneId(zone);
			orderSalesQuotation.setFromLocation(location);
			orderSalesQuotation.setStatus(status);
			orderSalesQuotation.setStartDate(startDate);
			orderSalesQuotation.setEndDate(endDate);
			if(startValue.equalsIgnoreCase("")){
				orderSalesQuotation.setQuotationStartValue(null);
			}else{
				orderSalesQuotation.setQuotationStartValue(new BigDecimal(startValue));
			}
			if(startValue.equalsIgnoreCase("")){
				orderSalesQuotation.setQuotationEndValue(null);
			}else{
				orderSalesQuotation.setQuotationEndValue(new BigDecimal(endValue));
			}
			
			orderSalesQuotation.setSearchCritaria(searchCreteria);
			orderSalesQuotation.setStartIndex(index);
			orderSalesQuotation.setQuotationRef(quotationId);
			
			//////////////System.out.println("Request String :get_OrderB2BSalesQuotation : : : "+ gson.toJson(orderSalesQuotation));
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			try {
				resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_OrderB2BSalesQuotation"), gson.toJson(orderSalesQuotation),"GET");
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		    //////////////System.out.println("Response String : : : : "+ resultStr);
		    orderSalesQuotation = gson.fromJson(resultStr,OrderB2BSalesQuotation.class); 
			if(orderSalesQuotation.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				
				orderSalesQuotation.getSalesQuotations().get(0).setTotalRecords(orderSalesQuotation.getTotalRecords());
				
			}
		}catch(Exception ce) {
			ce.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		} 
		return orderSalesQuotation.getSalesQuotations();
	}

	public String createSaleQuotation(OrderB2BSalesQuotation orderSalesQuotation){
			String resultStr = null;
			try{
				orderSalesQuotation.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				
				//////////////System.out.println("Request String : : : : "+ gson.toJson(orderSalesQuotation));
				RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
				try {
					resultStr = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_OrderB2BSalesQuotation"), gson.toJson(orderSalesQuotation));
				} catch (IOException e) {
					e.printStackTrace();
				}
				
			    //////////////System.out.println("Response String : : : : "+ resultStr);
			    orderSalesQuotation = gson.fromJson(resultStr,OrderB2BSalesQuotation.class); 
				if(orderSalesQuotation.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
					resultStr = AppProperties.getAppMessageByProperty("SALEQUOTATION_CREATED_SUCCESSFULLY").trim();
					
				}else{
					resultStr = orderSalesQuotation.getResponseHeader().getResponseMessage();
				}
			}catch(Exception ce) {
				ce.printStackTrace();
				resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
			} 
			return resultStr;
		}
	public String updateSaleQuotation(OrderB2BSalesQuotation orderSalesQuotation){
		String resultStr = null;
		try{
			orderSalesQuotation.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			//////////////System.out.println("Request String : : : : "+ gson.toJson(orderSalesQuotation));
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			try {
				resultStr = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_OrderB2BSalesQuotation"), gson.toJson(orderSalesQuotation));
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		    //////////////System.out.println("Response String : : : : "+ resultStr);
		    orderSalesQuotation = gson.fromJson(resultStr,OrderB2BSalesQuotation.class); 
			if(orderSalesQuotation.getResponseHeader().getResponseCode().equals(Constants.RESPONSE_SUCCESS_CODE)){
				resultStr = AppProperties.getAppMessageByProperty("SALEQUOTATION_UPDATED_SUCCESSFULLY").trim();
				
			}else{
				resultStr = orderSalesQuotation.getResponseHeader().getResponseMessage();
			}
		}catch(Exception ce) {
			ce.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();
		} 
		return resultStr;
	}

}
