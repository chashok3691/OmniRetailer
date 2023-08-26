package com.tlabs.posweb.services;

import java.rmi.ConnectException;
import java.rmi.RemoteException;
import java.rmi.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;

import com.tlabs.posweb.init.AppProperties;
import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.technolabssoftware.www.OrderShipmentServiceProxy;
import com.technolabssoftware.www.WHShipmentsProxy;
import com.tlabs.posweb.beans.Order;
//import com.tlabs.posweb.beans.OrderDetails;
import com.tlabs.posweb.beans.OrderShipment;
import com.tlabs.posweb.beans.OrderShipmentItems;
import com.tlabs.posweb.beans.OrderShipmentLocations;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.beans.ShipmentBean;
import com.tlabs.posweb.util.Constants;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
//import com.tlabs.posweb.util.Utilities;
import com.tlabs.posweb.util.RestfulServiceConnection;

public class ShipmentService {

	
	@Autowired
	private Gson gson;
	@Autowired
   	private OrderService orderServiceObj;
	@Autowired
	SessionScope sessionScope;
	private static Logger log = Logger.getLogger(ShipmentService.class);
	 
		
		/**
		 * @author Mythri.S	
		 * 
		 * This method is used to call the getShipments method of web service and return the Shipment List
		 * 
		 */
		public List<OrderShipment> getOutletShipments(String status,String index,String location,String maxRecords,String searchCriteria, String startDate,String endDate,String customerIdStr,String emailIdStr){
			String result = null;
			List<OrderShipment> orderShipmentList = null;
			try {
				//OrderShipmentServiceProxy orderShipmentServiceProxy = new OrderShipmentServiceProxy();
				OrderShipment orderShipment = new OrderShipment();
				orderShipment.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				orderShipment.setStartIndex(index);
				orderShipment.setShipmentStatus(status);
				orderShipment.setLocation(location);
				orderShipment.setStartDate(startDate);
				orderShipment.setEndDate(endDate);
				orderShipment.setMaxRecords(maxRecords);
				orderShipment.setSearchCriteria(searchCriteria);
				
				/*// log.info("Request String:::::::"+gson.toJson(orderShipment));
				result = orderShipmentServiceProxy.getShipments(gson.toJson(orderShipment));
				// log.info("Response String:::::::"+result);*/
				result = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("get_shipments"), gson.toJson(orderShipment), "GET");

				
				String responseCode = Response.getResponseCode(result);
				int slNo = Integer.parseInt(index);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					orderShipment = gson.fromJson(result, OrderShipment.class);
					orderShipmentList = orderShipment.getShipmentList();
					if(orderShipmentList != null && orderShipmentList.size() > 0){
						orderShipmentList.get(0).setTotalRecords(orderShipment.getTotalRecords());
						for (OrderShipment orderShipmentObj : orderShipmentList){
							++slNo;
							orderShipmentObj.setSlNo(slNo+"");
						}
							
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
			return orderShipmentList;
		}
		
		/**
		 * @author Mythri.S	
		 * 
		 * This method is used to call the getShipments method of web service and return the Shipment List
		 * 
		 */
		public List<ShipmentBean> getShipments(String location,String customerId,String emailId){
			String result = null;
			List<ShipmentBean> shipmentBeanList = null;
			try {
				//WHShipmentsProxy whShipmentsProxy = new WHShipmentsProxy();
				ShipmentBean shipmentBean = new ShipmentBean();
				shipmentBean.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				shipmentBean.setStartIndex("-1");
				shipmentBean.setWarehouse_location(location);
				
				/*// log.info("Request String:::::::"+gson.toJson(shipmentBean));
				result = whShipmentsProxy.getShipments(gson.toJson(shipmentBean));
				// log.info("Response String:::::::"+result);*/
				result = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("get_whshipments"), gson.toJson(shipmentBean), "GET");

				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					String responseList = Response.getResponseList(result, "shipments");
					JSONArray jsonResponseArray = new JSONArray(responseList);
					shipmentBeanList = new ArrayList<ShipmentBean>();
					for (int i=0; i<jsonResponseArray.length(); i++) {
						shipmentBean = gson.fromJson(jsonResponseArray.getString(i), ShipmentBean.class);
						shipmentBeanList.add(shipmentBean);
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
			return shipmentBeanList;
		}
		
		/**
		 * @author Mythri.S	
		 * 
		 * This method is used to call the getShipmentDetails method of web service and return the Shipment Details
		 * 
		 */
		public OrderShipment viewShipmentDetails(String shipmentId,String customerId,String emailId,String operation){
			String result = null;
			OrderShipment orderShipmentObj = new OrderShipment();
			try {
				//OrderShipmentServiceProxy orderShipmentServiceProxyObj = new OrderShipmentServiceProxy();
				orderShipmentObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				orderShipmentObj.setShipmentId(shipmentId);
				
				/*// log.info("Request String:::::::"+gson.toJson(orderShipmentObj));
				result = orderShipmentServiceProxyObj.getShipments(gson.toJson(orderShipmentObj));
				// log.info("Response String::::::::"+result);*/
				result = new RestfulServiceConnection().getResponse(AppProperties.getRESTFulCloudServiceURL("get_shipments"), gson.toJson(orderShipmentObj), "GET");

				
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					orderShipmentObj = gson.fromJson(result, OrderShipment.class);
					if(orderShipmentObj !=null)
					orderShipmentObj = orderShipmentObj.getShipmentObj();
					
					orderShipmentObj.setShipmentCostStr(orderShipmentObj.getShipmentCost());
					if(orderShipmentObj.getTotalCostStr() == null || orderShipmentObj.getTotalCostStr().equals(""))
						orderShipmentObj.setTotalCostStr("0");
					if(orderShipmentObj.getTaxStr() == null || orderShipmentObj.getTaxStr().equals(""))
						orderShipmentObj.setTaxStr("0");
					if(orderShipmentObj.getShipmentCost() == null || orderShipmentObj.getShipmentCost().equals(""))
						orderShipmentObj.setShipmentCost("0");
					float subTotal = Float.parseFloat(orderShipmentObj.getTotalCostStr())- (Float.parseFloat(orderShipmentObj.getTaxStr()) + Float.parseFloat(orderShipmentObj.getShipmentCost())); 
					orderShipmentObj.setSubTotal(subTotal+"");
					Map<String,String> orderShipmentCharge = new HashMap<String,String>();
					if(orderShipmentObj.getShipmentLocations() != null)
						for(OrderShipmentLocations orderShipmentLocation : orderShipmentObj.getShipmentLocations()){
							if(orderShipmentLocation.getOrderId() != null && !orderShipmentLocation.getOrderId().equals("")){
								Order orderDetails = new Order();
								orderDetails.setOrderId(orderShipmentLocation.getOrderId());
								orderDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
								orderDetails.setStartIndex(Constants.PAGINATION_START_INDEX);
								orderDetails = orderServiceObj.getOrderDetailsByLocation(orderDetails);
								orderShipmentCharge.put(orderShipmentLocation.getOrderId(), orderDetails.getShipmentCharges()+"");
							}
						}
					if(orderShipmentObj.getShipmentItemsList() != null)
						for(OrderShipmentItems orderShipmentItems : orderShipmentObj.getShipmentItemsList()){
							String orderId = orderShipmentItems.getOrderId();
							if(orderId != null && !orderId.equals(""))
								orderShipmentItems.setShipmentCharge(orderShipmentCharge.get(orderId));
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
			return orderShipmentObj;
		}
		
		/**
		 * @author Mythri.S	
		 * 
		 * This method is used to call the createOder method of web service and return the response
		 * 
		 */
		public String createShipment(OrderShipment orderShipmentObj,String customerId,String emailId){
			String result = null;
			try {
				//OrderShipmentServiceProxy orderShipmentServiceProxy = new OrderShipmentServiceProxy();
//				WHShipmentsProxy whShipmentsProxyObj = new WHShipmentsProxy();
				orderShipmentObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				
				/*// log.info("Request String::::::::::"+gson.toJson(orderShipmentObj));
				result = orderShipmentServiceProxy.createShipment(gson.toJson(orderShipmentObj));
				// log.info("Response String::::::::::::"+result);*/
				result = new RestfulServiceConnection().getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("create_shipment"), gson.toJson(orderShipmentObj));

				
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					result = AppProperties.getAppMessageByProperty("SHIPMENT_CREATED_SUCCESS").trim();
				}
				else{
//					responseMessage = "Couldn't update, please try after some time";
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
		 * This method is used to call the createOder method of web service and return the response
		 * 
		 */
		public String updateShipment(OrderShipment orderShipmentObj,String customerId,String emailId){
			String result = null;
			try {
				//OrderShipmentServiceProxy orderShipmentServiceProxy = new OrderShipmentServiceProxy();
				orderShipmentObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
				
				/*// log.info("Request String::::::::::"+gson.toJson(orderShipmentObj));
				result = orderShipmentServiceProxy.updateShipment(gson.toJson(orderShipmentObj));
				// log.info("Response String::::::::::::"+result);*/
				result = new RestfulServiceConnection().getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_shipment"), gson.toJson(orderShipmentObj));
				
				
				
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					result = AppProperties.getAppMessageByProperty("SHIPMENT_UPDATED_SUCCESS").trim();
				}
				else{
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
}
