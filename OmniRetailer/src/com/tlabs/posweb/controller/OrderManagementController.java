package com.tlabs.posweb.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlabs.posweb.init.AppProperties;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.tlabs.posweb.beans.ApplyCampaignsRequest;
//import com.tlabs.posweb.beans.Billing;
//import com.tlabs.posweb.beans.BillingBean;
import com.tlabs.posweb.beans.Customer;
import com.tlabs.posweb.beans.LocationBean;
import com.tlabs.posweb.beans.NearestLocationResponse;
//import com.tlabs.posweb.beans.Offer;
import com.tlabs.posweb.beans.Order;
import com.tlabs.posweb.beans.OrderB2BSalesQuotation;
import com.tlabs.posweb.beans.OrderDetails;
import com.tlabs.posweb.beans.OrderShipment;
import com.tlabs.posweb.beans.Quotation;
//import com.tlabs.posweb.beans.PurchaseOrderBean;
import com.tlabs.posweb.beans.ShipmentRateMaster;
import com.tlabs.posweb.beans.ShipmentRateMasterResponse;
import com.tlabs.posweb.beans.Suppliers;
import com.tlabs.posweb.beans.Workflows;
import com.tlabs.posweb.services.AdminService;
import com.tlabs.posweb.services.GenericMasterService;
import com.tlabs.posweb.services.MasterService;
import com.tlabs.posweb.services.OrderService;
import com.tlabs.posweb.services.OutletMasterService;
import com.tlabs.posweb.services.RoleService;
import com.tlabs.posweb.services.ShipmentService;
//import com.tlabs.posweb.util.Utilities;

@Controller
@RequestMapping(value = "/orderManagement")
public class OrderManagementController {
	
	private ModelAndView modelAndViewObj;
	//private static Logger log = Logger.getLogger(OrderManagementController.class);
	@Autowired
	private ShipmentService shipmentServiceObj;
	@Autowired
	private AdminService adminServiceObj;
	@Autowired
    private Gson gson;
   	@Autowired
   	private OrderService orderServiceObj;
    @Autowired
    private GenericMasterService genericMasterServiceObj;
    @Autowired
	private MasterService masterServiceObj;
    @Autowired
    private OutletMasterService outletMasterServiceObj;
    @Autowired
	 private RoleService roleServiceObj;
    /**
	 * @author Mythri.S
	 * @param request
	 * @param response
	 * @return returns a jsp which displays all the icons of shipment flow under outlet management flow
	 */
	
	@RequestMapping("/showFulfilmentOrders")
	public ModelAndView showOutletShipmentsFlows(HttpServletRequest request,HttpServletResponse response){
		// log.info("showFulfilmentOrders");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("OrderManagement/shipments/outletShipmentsFlow");
		return modelAndViewObj;
	}
	
	@RequestMapping("/showOrderPaymentsFlow")
	public ModelAndView showOrderPaymentsFlow(HttpServletRequest request,HttpServletResponse response){
		// log.info("showOutletShipmentsFlows");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("OrderManagement/payments/showPaymentsFlow");
		return modelAndViewObj;
	}
	
	@RequestMapping("/showSalesOrderFlows")
	public ModelAndView showSalesOrderFlows(HttpServletRequest request,HttpServletResponse response){
		// log.info("showSalesOrderFlows");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("OrderManagement/showSalesOrdersFlow");
		return modelAndViewObj;
	}
	
	@RequestMapping("/showEmpty")
	public ModelAndView showEmpty(HttpServletRequest request,HttpServletResponse response){
		// log.info("showEmpty");
		modelAndViewObj = new ModelAndView();
//		modelAndViewObj.setViewName("OrderManagement/shipments/outletShipmentsFlow");
		modelAndViewObj.setViewName("empty");
		return modelAndViewObj;
	}
	
	@RequestMapping("/showOrderManagementFlows")
	public ModelAndView showOrderManagementFlows(HttpServletRequest request,HttpServletResponse response){
		// log.info("showOrderManagementFlows");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("OrderManagement/showOrderManagementFlow");
		return modelAndViewObj;
	}
	
	
	@RequestMapping("/AssigendOrdersToLocation")
	public ModelAndView AssigendOrdersToLocation(@RequestParam("flowUnder") String flowUnder,@RequestParam("ids") String ids,@RequestParam("location") String location,@RequestParam("status") String status,@RequestParam("type") String type,HttpServletRequest request,HttpServletResponse response){
		// log.info("deleteoffers ");
		List<String> locationsList = null;
//		List<Offer> lst_offer = null;
		List<OrderDetails> lst_orders = null;
		try{
//			//////System.out.println("zdgd");
			int start = 1,end = 10;
//			lst_offer = new ArrayList<Offer>();
			modelAndViewObj = new ModelAndView();
			OrderDetails orderDetails = new OrderDetails();
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
//			// log.info(ids + "  " + location);
			String result =orderServiceObj.assigendLocationsBasedOnOrders(customerId,emailId ,ids,location);
			lst_orders = orderServiceObj.getOrdersByLocation("","",status,orderDetails,"","0",false,"","","10","",false,"","","","","false");
			locationsList = adminServiceObj.getOutletLocationsList(customerId,emailId,true);
			
			if(result.equals(AppProperties.getAppMessageByProperty("ORDER_ASSIGNED_SUCCESSFULLY").trim()))
			    modelAndViewObj.addObject("success", result);
				else
				modelAndViewObj.addObject("err", result);
			
			
			if(lst_orders == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(lst_orders.size()<10){
					end = (lst_orders.size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(lst_orders.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("orderDetails",lst_orders);
			
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("type","management");
//			modelAndViewObj.addObject("type",type);
			modelAndViewObj.addObject("location",location);
			modelAndViewObj.addObject("maxRecords",10);
			modelAndViewObj.addObject("flowUnder",flowUnder);
			modelAndViewObj.addObject("status",status);
			modelAndViewObj.setViewName("Inventory Manager/Orders/viewOrders");
			
			}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	 
	@RequestMapping("/getCustomerInfo")
	public @ResponseBody String getCustomerInfo(@RequestParam("mobileNum")String mobileNoStr,HttpServletRequest request,HttpServletResponse response) {
		String responseStr= null;
		try{
			// log.info("getCustomerInfo");
			Customer custDetails=masterServiceObj.getCustomerDetails(mobileNoStr, "", false);
			responseStr = new Gson().toJson(custDetails);
		}catch(Exception e){
			e.printStackTrace();
		}
		return responseStr;
	}
	
	@RequestMapping(value="/getShipmentPrice",method=RequestMethod.POST,consumes="application/json")
	public @ResponseBody String getShipmentPrice(@RequestBody ShipmentRateMaster shipmentRateMasterObj,HttpServletRequest request,HttpServletResponse response) {
		String resultStr = "";
		ShipmentRateMasterResponse shipmentRateMasterResponseObj = new ShipmentRateMasterResponse();
		try{
			// log.info("getShipmentPrice");
			shipmentRateMasterResponseObj = outletMasterServiceObj.getShipmentPrice(shipmentRateMasterObj);
			resultStr = gson.toJson(shipmentRateMasterResponseObj);
		}catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
	}
	
	@RequestMapping(value="/getNearestLocation",method=RequestMethod.POST,consumes="application/json")
	public @ResponseBody String getNearestLocation(@RequestBody NearestLocationResponse nearestLocationObj,HttpServletRequest request,HttpServletResponse response) {
		String resultStr = "";
		NearestLocationResponse nearestLocationResponseObj = new NearestLocationResponse();
		try{
			// log.info("getShipmentPrice");
			nearestLocationResponseObj = outletMasterServiceObj.getNearestStore(nearestLocationObj);
			resultStr = gson.toJson(nearestLocationResponseObj);
		}catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
	}
		
	
	
	
	
	@RequestMapping(value="/getApplyCampaignDetails",method=RequestMethod.POST,consumes="application/json")
	public @ResponseBody String getApplyCampaignDetails(@RequestBody ApplyCampaignsRequest formData,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		ApplyCampaignsRequest billingDetailsList = new ApplyCampaignsRequest();
		String resultStr = "";
		try{
			// log.info("getcampaignDetails");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			billingDetailsList = outletMasterServiceObj.getApplyCampaignDetails(formData, customerIdStr, emailIdStr);
			resultStr = gson.toJson(billingDetailsList);
		}catch(Exception e){
			e.printStackTrace();
		}
		return resultStr;
	}
	
	
	@RequestMapping("/viewOutletShipments")
	public ModelAndView viewOutletShipments(@RequestParam("status") String status,@RequestParam("index") String index,@RequestParam("location") String location,@RequestParam("flowUnder") String flowUnder,@RequestParam("type") String type, @RequestParam("maxRecords") String maxRecords, HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewOutletShipments ");
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<String> locationsList = null;
			if(type.equals("management"))
				locationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr,true);
			else if(flowUnder.equals("outlet"))
				locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			else
				locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
			
			
			
			
//			Added by vijay, to make default loaction as location list first occurrence, if location is empty
			if((location.trim()).equals(null) || location.trim().isEmpty())
			{
				location = locationsList.get(0);
			}
			
			
			
			List<OrderShipment> orderShipmentList = shipmentServiceObj.getOutletShipments(status, index, location,"10",null,null,null, customerIdStr, emailIdStr);		
			modelAndViewObj = new ModelAndView();
			if(orderShipmentList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(orderShipmentList.size()<Integer.parseInt(maxRecords)){
					end = (orderShipmentList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(orderShipmentList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("selectedLocation",location);
			modelAndViewObj.addObject("maxRecords", maxRecords);
			modelAndViewObj.addObject("status", status);
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.addObject("type", type);
			modelAndViewObj.addObject("shipmentBeanList", orderShipmentList);
			modelAndViewObj.setViewName("OrderManagement/shipments/shipments");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	@RequestMapping("/searchShipments")
	public ModelAndView searchShipments(@RequestParam("status") String status,@RequestParam("index") String index,
			@RequestParam("location") String locationStr,@RequestParam("maxRecords") String maxRecords,
			@RequestParam("searchName") String searchName,@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,
			@RequestParam("flowUnder") String flowUnder,@RequestParam("type") String type,
		HttpServletRequest request,HttpServletResponse response){
		String customerIdStr=null,emailIdStr=null;
		List<OrderShipment> orderShipmentList=null;
		List<String> locationsList=null;
		try{
			int start = 1,end = 10;
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			if(type.equals("management"))
				locationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr,true);
			else if(flowUnder.equals("outlet"))
				locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			else
				locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("locationsList", locationsList);
			orderShipmentList = shipmentServiceObj.getOutletShipments(status, index, locationStr,maxRecords,searchName,startDate,endDate, customerIdStr, emailIdStr);
			request.getSession().setAttribute("selectedLocation",locationStr);
			if(orderShipmentList == null || orderShipmentList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(orderShipmentList.size()<10){
					end = (orderShipmentList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(orderShipmentList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("searchName", searchName);
			modelAndViewObj.addObject("startDate", startDate);
			modelAndViewObj.addObject("endDate", endDate);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
			modelAndViewObj.addObject("shipmentBeanList",orderShipmentList);
			modelAndViewObj.addObject("selectedLocation",locationStr);
			modelAndViewObj.addObject("status",status);
			modelAndViewObj.setViewName("OrderManagement/shipments/shipments");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		modelAndViewObj.addObject("flowUnder", flowUnder);
		modelAndViewObj.addObject("type", type);
		return modelAndViewObj;
	}
	
	
	
	@RequestMapping("/viewNewShipment")
	public ModelAndView viewNewShipment(@RequestParam("flowUnder") String flowUnder, HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewNewShipment ");
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
			String location = (String) request.getSession().getAttribute("selectedLocation");
			if(location == null && locationBeanList != null)
				location = locationBeanList.get(0).getLocationId();
			modelAndViewObj.addObject("selectedLocation",location);
			modelAndViewObj.addObject("locationsList", locationBeanList);
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.setViewName("OrderManagement/shipments/newShipment");
		}
		catch(Exception exception){
			exception.printStackTrace();
			modelAndViewObj.addObject("err", "No Orders for Shipment");
			modelAndViewObj.setViewName("OrderManagement/shipments/newShipment");
		}
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display the newShipment form 
	 *
	 **/
	@RequestMapping("/searchSalesOrders")
	public @ResponseBody List<String> searchSalesOrders(@RequestParam("location") String location,@RequestParam("searchName") String searchName,@RequestParam("shipmentMode") String shipmentMode,HttpServletRequest request,HttpServletResponse response){
		List<String> orderIdList = null;
		try{
			// log.info("searchSalesOrders");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			orderIdList = orderServiceObj.searchSalesOrders(customerIdStr, emailIdStr,location,searchName,shipmentMode,true);
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return orderIdList;
	}
	
	
	@RequestMapping("/getOrderForShipment")
	public @ResponseBody String getOrderForShipment(@RequestParam("orderId")String orderId,HttpServletRequest request,HttpServletResponse response){
		// log.info("getOrderForShipment");
		Order orderDetails = new Order();
		try {
//			String customerIdStr = (String)request.getSession().getAttribute("customerId");
//			String emailIdStr = (String)request.getSession().getAttribute("emailId");
//			orderDetails.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerIdStr, emailIdStr));
			orderDetails.setOrderId(orderId);
			orderDetails = orderServiceObj.getOrderDetailsByLocation(orderDetails);
		}catch(Exception e){
			e.printStackTrace();
		}
		return gson.toJson(orderDetails);
	}	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to update the existing order Details
	 *
	 **/
	
	@RequestMapping(value="/createShipment",method=RequestMethod.POST)
	public ModelAndView createShipment(@RequestBody OrderShipment orderShipmentObj,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("createShipment");
		modelAndViewObj = new ModelAndView();
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
		String resultStr = shipmentServiceObj.createShipment(orderShipmentObj,customerIdStr,emailIdStr);
		if(!resultStr.equals(AppProperties.getAppMessageByProperty("SHIPMENT_CREATED_SUCCESS").trim())){
			modelAndViewObj.addObject("orderShipment", orderShipmentObj);
			modelAndViewObj.addObject("err",resultStr);
		}
		else
		modelAndViewObj.addObject("success",resultStr);
		modelAndViewObj.addObject("selectedLocation",orderShipmentObj.getShipmentLocation());
		modelAndViewObj.addObject("locationsList", locationBeanList);
		modelAndViewObj.addObject("flowUnder", orderShipmentObj.getFlowUnder());
		modelAndViewObj.setViewName("OrderManagement/shipments/newShipment");
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}
	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display  shipment details based on the shipmentId given
	 *
	 **/

	@RequestMapping("/viewShipmentDetails")
	public @ResponseBody ModelAndView viewShipmentDetails(@RequestParam("shipmentId")String shipmentId,@RequestParam("operation")String operation,@RequestParam("flowUnder")String flowUnder,HttpServletRequest request,HttpServletResponse response){
		
		// log.info("viewShipmentDetails()");
		try {
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
			OrderShipment orderShipmentObj = shipmentServiceObj.viewShipmentDetails(shipmentId,customerIdStr,emailIdStr,operation);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("orderShipment",orderShipmentObj);
			modelAndViewObj.addObject("locationsList", locationBeanList);
			modelAndViewObj.addObject("flowUnder", flowUnder);
			if(operation.equals("view"))
				modelAndViewObj.setViewName("OrderManagement/shipments/viewShipment");
			else
				modelAndViewObj.setViewName("OrderManagement/shipments/editShipment");
		}catch(Exception e){
			e.printStackTrace();
			if(operation.equals("view"))
				modelAndViewObj.setViewName("OrderManagement/shipments/viewShipment");
			else
				modelAndViewObj.setViewName("OrderManagement/shipments/editShipment");
		}
		return modelAndViewObj;
	}
	
	
	@RequestMapping(value="/updateShipment",method=RequestMethod.POST)
	public ModelAndView updateShipment(@RequestBody OrderShipment orderShipmentObj,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("updateShipment");
		modelAndViewObj = new ModelAndView();
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
		String resultStr = shipmentServiceObj.updateShipment(orderShipmentObj,customerIdStr,emailIdStr);
		if(!resultStr.equals(AppProperties.getAppMessageByProperty("SHIPMENT_UPDATED_SUCCESS").trim())){
			modelAndViewObj.addObject("err",resultStr);
		}
		else
			modelAndViewObj.addObject("success",resultStr);
		modelAndViewObj.addObject("orderShipment", orderShipmentObj);
		modelAndViewObj.addObject("selectedLocation",orderShipmentObj.getShipmentLocation());
		modelAndViewObj.addObject("locationsList", locationBeanList);
		modelAndViewObj.addObject("flowUnder", orderShipmentObj.getFlowUnder());
		modelAndViewObj.setViewName("OrderManagement/shipments/editShipment");
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}
	
	

	@RequestMapping("/showSaleQuotation")
	public ModelAndView showSaleQuotation(@RequestParam("zone") String zone,@RequestParam("location") String location,
			@RequestParam("startValue") String startValue,@RequestParam("endValue") String endValue,@RequestParam("status") String status,
			@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,
			@RequestParam("searchCreteria") String searchCreteria,@RequestParam("index") String index,@RequestParam("maxRecords") String maxRecords,
			HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<String> locationsList=null;
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			
			int start = 1;
			int end;
			
			if(maxRecords.equals(""))
				end=Integer.parseInt("0");
			else
				end=Integer.parseInt(maxRecords);
			
			
			if(index.equals(""))
				index="0";
			
			locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
			List<OrderB2BSalesQuotation> saleQuotationList =orderServiceObj.getSaleQuotation(zone, location, startValue, endValue, status, startDate, endDate, searchCreteria, index,"");
			List<Workflows> workflowsList = roleServiceObj.getWorkflows("-1","Sales Quotation");
			if(saleQuotationList == null || saleQuotationList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");		
			}else{
				if(saleQuotationList.size()<end){
					end = (saleQuotationList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				
				modelAndViewObj.addObject("totalRecords",(saleQuotationList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("maxRecords", Integer.parseInt("10"));
			}
			
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("status", status);
			modelAndViewObj.addObject("orderStartValue", startValue);
			modelAndViewObj.addObject("orderEndValue", endValue);
			modelAndViewObj.addObject("startDate", startDate);
			modelAndViewObj.addObject("endDate", endDate);
			
			modelAndViewObj.addObject("workflowsList", workflowsList);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("saleQuotationList", saleQuotationList);
			modelAndViewObj.setViewName("OrderManagement/b2bSaleOrders/saleQuotation");
		}catch(Exception e){
		  e.printStackTrace();	
		}
		return modelAndViewObj;
	}

	
	@RequestMapping("/newSaleQuotation")
	public ModelAndView newSaleQuotation(HttpServletRequest request,HttpServletResponse response) {
		
		String customerIdStr = null,emailIdStr=null;
		try{
			// log.info("newRFQ");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<LocationBean> locationsList = adminServiceObj.getLocationsListofAll(customerIdStr,emailIdStr,false);
			ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("workLocationsList", locationBeanList);
			modelAndViewObj.addObject("quoteSuppliers","");
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("type", "new");
			modelAndViewObj.setViewName("OrderManagement/b2bSaleOrders/newSaleQuotation");
		}catch(Exception e){
		  e.printStackTrace();	
		}
		return modelAndViewObj;
	}
	

	@RequestMapping("/viewSaleQuotation")
	public ModelAndView viewSaleQuotation(@RequestParam("QuotationID") String QuotationID,HttpServletRequest request,HttpServletResponse response) {
		
		String customerIdStr = null,emailIdStr=null;
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<OrderB2BSalesQuotation> saleQuotationList =orderServiceObj.getSaleQuotation("", "", "", "", "", "", "", "", "",QuotationID);

			List<LocationBean> locationsList = adminServiceObj.getLocationsListofAll(customerIdStr,emailIdStr,false);
			ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("workLocationsList", locationBeanList);
			modelAndViewObj.addObject("quoteSuppliers","");
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("quoteObj", saleQuotationList);
			modelAndViewObj.addObject("type", "new");
			modelAndViewObj.setViewName("OrderManagement/b2bSaleOrders/viewSaleQuotation");
		}catch(Exception e){
		  e.printStackTrace();	
		}
		return modelAndViewObj;
	}
	

	@RequestMapping("/editSaleQuotation")
	public ModelAndView editSaleQuotation(@RequestParam("QuotationID") String QuotationID,HttpServletRequest request,HttpServletResponse response) {
		
		String customerIdStr = null,emailIdStr=null;
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<LocationBean> locationsList = adminServiceObj.getLocationsListofAll(customerIdStr,emailIdStr,false);
			ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
			List<OrderB2BSalesQuotation> saleQuotationList =orderServiceObj.getSaleQuotation("", "", "", "", "", "", "", "", "",QuotationID);

			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("workLocationsList", locationBeanList);
			modelAndViewObj.addObject("quoteSuppliers","");
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("quoteObj", saleQuotationList);
			modelAndViewObj.addObject("type", "new");
			modelAndViewObj.setViewName("OrderManagement/b2bSaleOrders/EditSaleQuotation");
		}catch(Exception e){
		  e.printStackTrace();	
		}
		return modelAndViewObj;
	}
	
	@RequestMapping(value="/createSaleQuotation",method=RequestMethod.POST)
	public ModelAndView createSaleQuotation(@RequestBody OrderB2BSalesQuotation orderSalesQuotation,HttpServletRequest request,HttpServletResponse response) {
		
		String customerIdStr = null,emailIdStr=null;
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			String str =orderServiceObj.createSaleQuotation(orderSalesQuotation);
			List<LocationBean> locationsList = adminServiceObj.getLocationsListofAll(customerIdStr,emailIdStr,false);
			ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("workLocationsList", locationBeanList);
			modelAndViewObj.addObject("quoteSuppliers","");
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("type", "new");
			if(!str.equals(AppProperties.getAppMessageByProperty("SALEQUOTATION_CREATED_SUCCESSFULLY").trim())){
				modelAndViewObj.addObject("err", str);
			}else{
				modelAndViewObj.addObject("success", str);
			}
			modelAndViewObj.setViewName("OrderManagement/b2bSaleOrders/newSaleQuotation");
		}catch(Exception e){
		  e.printStackTrace();	
		}
		return modelAndViewObj;
	}
	
	@RequestMapping(value="/updateSaleQuotation",method=RequestMethod.POST)
	public ModelAndView updateSaleQuotation(@RequestBody OrderB2BSalesQuotation orderSalesQuotation,HttpServletRequest request,HttpServletResponse response) {
		
		String customerIdStr = null,emailIdStr=null;
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			String str =orderServiceObj.updateSaleQuotation(orderSalesQuotation);
			List<LocationBean> locationsList = adminServiceObj.getLocationsListofAll(customerIdStr,emailIdStr,false);
			ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("workLocationsList", locationBeanList);
			modelAndViewObj.addObject("quoteSuppliers","");
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("type", "new");
			if(!str.equals(AppProperties.getAppMessageByProperty("SALEQUOTATION_UPDATED_SUCCESSFULLY").trim())){
				modelAndViewObj.addObject("err", str);
			}else{
				modelAndViewObj.addObject("success", str);
			}
			modelAndViewObj.setViewName("OrderManagement/b2bSaleOrders/EditSaleQuotation");
		}catch(Exception e){
		  e.printStackTrace();	
		}
		return modelAndViewObj;
	}
	
}
