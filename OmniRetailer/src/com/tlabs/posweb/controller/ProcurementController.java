package com.tlabs.posweb.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import org.json.JSONArray;
import com.tlabs.posweb.init.AppProperties;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
//import com.sun.jmx.mbeanserver.ModifiableClassLoaderRepository;
import com.tlabs.posweb.beans.EmployeeBean;
import com.tlabs.posweb.beans.GoodsReceiptsItems;
import com.tlabs.posweb.beans.LocationBean;
import com.tlabs.posweb.beans.ProcurementReceipt;
import com.tlabs.posweb.beans.ProductCategoryBean;
import com.tlabs.posweb.beans.ProductsList;
import com.tlabs.posweb.beans.PurchaseOrder;
import com.tlabs.posweb.beans.PurchaseOrderBean;
import com.tlabs.posweb.beans.PurchaseOrderItems;
import com.tlabs.posweb.beans.PurchaseOrderShipmentLocation;
import com.tlabs.posweb.beans.PurchaseShipmentNote;
import com.tlabs.posweb.beans.PurchaseStockReturn;
import com.tlabs.posweb.beans.Quotation;
import com.tlabs.posweb.beans.RequestBean;
import com.tlabs.posweb.beans.Sku;
import com.tlabs.posweb.beans.SkuPriceList;
//import com.tlabs.posweb.beans.StockIssueDetails;
import com.tlabs.posweb.beans.StockIssues;
//import com.tlabs.posweb.beans.StockRequestItems;
import com.tlabs.posweb.beans.StockRequestSummaryResponse;
import com.tlabs.posweb.beans.StoreShipmentReturn;
import com.tlabs.posweb.beans.SupplierBean;
import com.tlabs.posweb.beans.SupplierProducts;
import com.tlabs.posweb.beans.SupplierQuotations;
import com.tlabs.posweb.beans.SupplierShipmentLocation;
import com.tlabs.posweb.beans.Suppliers;
import com.tlabs.posweb.beans.WHPurchaseOrderItems;
import com.tlabs.posweb.beans.WareHouseSku;
import com.tlabs.posweb.beans.Warehouse;
import com.tlabs.posweb.beans.Workflows;
//import com.tlabs.posweb.beans.WarehouseStorageSystems;
import com.tlabs.posweb.services.AdminService;
import com.tlabs.posweb.services.GenericMasterService;
import com.tlabs.posweb.services.OutletMasterService;
import com.tlabs.posweb.services.ProcurementService;
import com.tlabs.posweb.services.RoleService;
import com.tlabs.posweb.services.SkuService;
import com.tlabs.posweb.services.WarehouseService;
//import com.tlabs.posweb.util.Response;
import com.tlabs.posweb.util.Utilities;

@Controller
@RequestMapping(value = "/procurement")
public class ProcurementController {

	//private static Logger log = Logger.getLogger(ProcurementController.class);
    @Autowired
	private AdminService adminServiceObj;
    @Autowired
    private ProcurementService procurementServiceObj;
    @Autowired
	private OutletMasterService outletMasterServiceObj;
	private ModelAndView modelAndViewObj;
	@Autowired
	private GenericMasterService genericMasterServiceObj;
	@Autowired
	private Gson gson;
	@Autowired
    private SkuService skuServiceObj;
	@Autowired
	private RoleService roleServiceObj;
	/*
	 * Steps under Procurement flow
	 * 1. Request for Quotation flow is implemented to send quotation request to different suppliers for the given list of items 
	 * 	  to be delivered to the given delivery locations.
	 * 2. Quotations from different suppliers will be received
	 * 3. Send Purchase Order to suppliers by selecting the best and suitable quotation
	 * 
	 * 
	 */
	
	
	/**
	 * @author Mythri.S
	 * @param request
	 * @param response
	 * @return returns a jsp which displays all the icons of procurement flow
	 */
	@RequestMapping("/showOutletProcurementFlow")
	public ModelAndView showOutletProcurementFlow(HttpServletRequest request,HttpServletResponse response){
		// log.info("InventoryManagerController - showOutletProcurementFlow");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("Procurement/procurementflow");
		return modelAndViewObj;
	}
	
	
	/**
	 * @author Mythri.S
	 * @param request
	 * @param response
	 * @return returns a jsp which displays all the icons of procurement flow
	 */
	@RequestMapping("/showWarehouseProcurementFlows")
	public ModelAndView showWarehouseProcurementFlows(HttpServletRequest request,HttpServletResponse response){
		// log.info("showWarehouseProcurementFlows");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("Procurement/warehouseProcurementFlow");
		return modelAndViewObj;
	}
	/**
	 * @author Mythri.S
	 * @param request
	 * @param response
	 * @return returns a jsp which displays all the icons of procurement flow
	 */
	@RequestMapping("/showWarehouseProcurementShipmentFlow")
	public ModelAndView showWarehouseProcurementShipmentFlow(HttpServletRequest request,HttpServletResponse response){
		// log.info("showWarehouseProcurementShipmentFlow");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("Procurement/procurementShipmentFlow");
		return modelAndViewObj;
	}
	
	
	/**
	 * @author Mythri.S
	 * @param index
	 * @param maxRecords
	 * @param location
	 * @param request
	 * @param response
	 * @return a jsp which displays all request for quotation.
	 */
	@RequestMapping("/viewRequestForQuotation")
	public ModelAndView viewRequestForQuotation(@RequestParam("index") String index,@RequestParam("maxRecords") String maxRecords,
			@RequestParam("location") String location,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<String> locationsList=null;
		try{
			// log.info("viewRequestForQuotation");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
			
//			Added by vijay, to make default loaction as location list first occurrence, if location is empty
			if((location.trim()).equals(null) || location.trim().isEmpty())
			{
				location = locationsList.get(0);
			}
			
			
			
			
			List<Quotation> quotesList=procurementServiceObj.getRequestForQuotation("",index,customerIdStr,emailIdStr,location,maxRecords,null,null);
			modelAndViewObj = new ModelAndView();
			int start = 1,end = 10;
			if(quotesList == null || quotesList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(quotesList.size()<10){
					end = (quotesList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(quotesList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("quotesList", quotesList);
			modelAndViewObj.addObject("selectedLocation",location);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.setViewName("Procurement/RequestForQuotation/requestForQuotation");
		}catch(Exception e){
		  e.printStackTrace();	
		}
		return modelAndViewObj;
	}




	@RequestMapping("/searchRequestForQuotation")
	public ModelAndView searchRequestForQuotation(@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,@RequestParam("maxRecords") String maxRecords,@RequestParam("location") String location,@RequestParam("endDate") String endDate,@RequestParam("startDate") String startDate, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<Quotation> quotesList = null;
		try{
			// log.info("searchRequestForQuotation");
			int start = 1,end = 10;
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<String> locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
			quotesList = procurementServiceObj.getRequestForQuotation(searchNameStr,index,customerIdStr,emailIdStr,location,maxRecords,startDate,endDate);
			modelAndViewObj = new ModelAndView();
			if(quotesList == null || quotesList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(quotesList.size()<10){
					end = (quotesList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(quotesList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("selectedLocation",location);
			modelAndViewObj.addObject("quotesList",quotesList);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("endDate",endDate);
			modelAndViewObj.addObject("startDate", startDate);
			modelAndViewObj.setViewName("Procurement/RequestForQuotation/requestForQuotation");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	@RequestMapping("/newRFQ")
	public ModelAndView newRFQ(HttpServletRequest request,HttpServletResponse response) {
		
		String customerIdStr = null,emailIdStr=null;
		try{
			// log.info("newRFQ");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<String> locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
			ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
			List<Suppliers> supplierList = outletMasterServiceObj.getSuppliers(customerIdStr, emailIdStr,"-1","","");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("workLocationsList", locationBeanList);
			modelAndViewObj.addObject("quoteSuppliers","");
			modelAndViewObj.addObject("supplierList", supplierList);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("type", "new");
			modelAndViewObj.setViewName("Procurement/RequestForQuotation/newRequestForQuotation");
		}catch(Exception e){
		  e.printStackTrace();	
		}
		return modelAndViewObj;
	}
	
	@RequestMapping(value="/createRequestForQuotation",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createRequestForQuotation(@RequestBody Quotation quotationObj,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("createRequestForQuotation");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			quotationObj.setUserName(emailIdStr);
			quotationObj.setRoleName((String)request.getSession().getAttribute("role"));
			String resultStr = procurementServiceObj.createRequestForQuotation(quotationObj,customerIdStr,emailIdStr);
			modelAndViewObj = new ModelAndView();
			List<String> locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
			ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
			List<Suppliers> supplierList = outletMasterServiceObj.getSuppliers(customerIdStr, emailIdStr,"-1","","");
			String suppliersStr = "";
			modelAndViewObj.addObject("workLocationsList", locationBeanList);
			modelAndViewObj.addObject("supplierList", supplierList);
			modelAndViewObj.addObject("locationsList", locationsList);
			if(quotationObj.getQuoteRef() == null || quotationObj.getQuoteRef().equals(""))
				modelAndViewObj.addObject("type", "new");
			if(resultStr.equals(AppProperties.getAppMessageByProperty("REQUEST_FOR_QUOTE_CREATE_SUCCESS").trim())){
				modelAndViewObj.addObject("quoteSuppliers","");
				modelAndViewObj.addObject("success", resultStr);
				modelAndViewObj.setViewName("Procurement/RequestForQuotation/newRequestForQuotation");
				return modelAndViewObj;
			}
			else if(resultStr.equals(AppProperties.getAppMessageByProperty("REQUEST_FOR_QUOTE_UPDATE_SUCCESS").trim())){
				Quotation quoteObj=procurementServiceObj.getRequestForQuotationDetails("0", customerIdStr, emailIdStr,quotationObj.getQuoteRef());
				if(quoteObj.getSuppliersList() != null && quoteObj.getSuppliersList().size()>0){
					for(int i=0;i<quoteObj.getSuppliersList().size();i++){
						suppliersStr=suppliersStr+quoteObj.getSuppliersList().get(i).getSupplierId()+",";
					}
				}
				modelAndViewObj.addObject("quoteObj", quoteObj);
				modelAndViewObj.addObject("success", resultStr);
			}
			else{
				if(quotationObj.getSuppliersList() != null && quotationObj.getSuppliersList().size()>0){
					for(int i=0;i<quotationObj.getSuppliersList().size();i++){
						suppliersStr=suppliersStr+quotationObj.getSuppliersList().get(i).getSupplierId()+",";
					}
				}
				modelAndViewObj.addObject("quoteObj", quotationObj);
				modelAndViewObj.addObject("err", resultStr);
			}
			modelAndViewObj.addObject("quoteSuppliers",suppliersStr);
			modelAndViewObj.setViewName("Procurement/RequestForQuotation/newRequestForQuotation");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	@RequestMapping("/viewRequestForQuotationDetails")
	public ModelAndView viewRequestForQuotationDetails(@RequestParam("rfqId") String rfqIdStr,@RequestParam("operation") String operation,@RequestParam("formData") String formData,HttpServletRequest request,HttpServletResponse response) {
		
		String customerIdStr = null,emailIdStr=null;
		List<String> locationsList=null;
		String suppliersStr="";
		try{
			// log.info("viewRequestForQuotationDetails");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
			ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
			List<Suppliers> supplierList = outletMasterServiceObj.getSuppliers(customerIdStr, emailIdStr,"-1","","");
			Quotation quoteObj=procurementServiceObj.getRequestForQuotationDetails("0", customerIdStr, emailIdStr,rfqIdStr);
			if(quoteObj != null && quoteObj.getSuppliersList() != null && quoteObj.getSuppliersList().size()>0){
				for(int i=0;i<quoteObj.getSuppliersList().size();i++){
					suppliersStr=suppliersStr+quoteObj.getSuppliersList().get(i).getSupplierId()+",";
				}
			}
			modelAndViewObj = new ModelAndView();
			
			//added by manasa 
			Quotation skuObj=gson.fromJson(formData, Quotation.class);
			modelAndViewObj.addObject("skuObj",skuObj);
			
			modelAndViewObj.addObject("quoteObj", quoteObj);
			modelAndViewObj.addObject("workLocationsList", locationBeanList);
			modelAndViewObj.addObject("quoteSuppliers",suppliersStr);
		//	modelAndViewObj.addObject("shipmentLocationsList", quoteObj.getSelectedLocationList());
			modelAndViewObj.addObject("supplierList", supplierList);
			modelAndViewObj.addObject("locationsList", locationsList);
			if(operation.equals("view"))
				modelAndViewObj.setViewName("Procurement/RequestForQuotation/viewRequestForQuotation");
			else
				modelAndViewObj.setViewName("Procurement/RequestForQuotation/newRequestForQuotation");
		}catch(Exception e){
		  e.printStackTrace();	
		}
		return modelAndViewObj;
	}
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to view the Purchase Orders in a tabular format
	 *
	 **/
	@RequestMapping("/viewPurchaseOrder")
	public ModelAndView viewPurchaseOrder(@RequestParam("startdate") String startdate,@RequestParam("operation") String operation,@RequestParam("location")String location,@RequestParam("index")String index,@RequestParam("maxRecords")String maxRecords,HttpServletRequest request,HttpServletResponse response){
//		String locationsAllList="";
		ArrayList<LocationBean> locationsList=null;
//		List<String> locationsList =null;
		try{
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			
		
		//	List<String> locationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr,emailIdStr,true);
			List<Workflows> workflowsList = roleServiceObj.getWorkflows("-1","Warehouse Purchase Orders");
			if(operation.equals("warehouse")) {
				 locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","100","Warehouse",false,false,true);
				
//				locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,false);
			}else {
//				locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
			
				locationsList = genericMasterServiceObj.getLocationDetails("","1", emailIdStr,"-1","","Retail Outlet",false,true,true);
			}
//				genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
//			Added by vijay, to make default loaction as location list first occurrence, if location is empty
			/*if((location.trim()).equals(null) || location.trim().isEmpty())
			{
				location = locationsList.get(0).getLocationId();
			}*/
			
			/*if(location.equals("all")||location.equals(""))
			{
				if(locationsAllList!=null)
					for (String string : locationsList) {
						locationsAllList=locationsAllList+string+",";
					}
			}*/
			if(locationsList.size()>0)
			 location = locationsList.get(0).getLocationId();
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,index,maxRecords);
			
			modelAndViewObj = new ModelAndView();
			int start = 1,end = Integer.parseInt(maxRecords);
			List<PurchaseOrder> purchaseOrderBeansList = procurementServiceObj.getPurchaseOrders(operation,customerIdStr, emailIdStr,location,index,maxRecords,"",startdate,"",true,"","","","");
			request.getSession().setAttribute("warehousePos",purchaseOrderBeansList);
			if(purchaseOrderBeansList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
				modelAndViewObj.addObject("IndentQty",  "0");
				modelAndViewObj.addObject("PoQty",  "0");
				modelAndViewObj.addObject("POValue",  "0");
			}else{
				if(purchaseOrderBeansList.size()<Integer.parseInt(maxRecords)){
					end = (purchaseOrderBeansList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("IndentQty", purchaseOrderBeansList.get(0).getTotalIndentQty());
				modelAndViewObj.addObject("PoQty", purchaseOrderBeansList.get(0).getTotalPoQty());
				modelAndViewObj.addObject("POValue", purchaseOrderBeansList.get(0).getTotalPOValue());
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(purchaseOrderBeansList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
//			if(!operation.equals("Draft"))
//				operation = "all";
			if(location != null && !location.equals(""))
				request.getSession().setAttribute("selectedLocation", location);
			modelAndViewObj.addObject("operation", operation);
			modelAndViewObj.addObject("startDate", startdate);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("selectedLocation",location);
			modelAndViewObj.addObject("purchaseOrderBeansList", purchaseOrderBeansList);
			modelAndViewObj.addObject("categoryDetails", categoryList);
			modelAndViewObj.addObject("workflowsList", workflowsList);
			modelAndViewObj.setViewName("Procurement/PurchaseOrder/purchaseOrder");
//			}
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
		return modelAndViewObj;
	}
	
	
	
	@RequestMapping("/searchPurchaseOrders")
	public ModelAndView searchPurchaseOrders(@RequestParam("itemwise") String itemwise,@RequestParam("supplier") String supplier,@RequestParam("searchName") String searchNameStr,@RequestParam("startDate") String startDateStr,@RequestParam("endDate") String endDateStr,@RequestParam("index") String index,@RequestParam("maxRecords") String maxRecords,@RequestParam("location") String location,@RequestParam("zone") String zone,@RequestParam("category") String category,@RequestParam("operation") String operation, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
//		String locationsAllList="";
//		List<String> locationsList = null;
		ArrayList<LocationBean> locationsList = null;
		try{
			// log.info("searchPurchaseOrders");
			int start = 1,end = Integer.parseInt(maxRecords);
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
//			List<String> locationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr,emailIdStr,true);
	
			List<Workflows> workflowsList = roleServiceObj.getWorkflows("-1","Warehouse Purchase Orders");
			if(operation.equals("warehouse"))
				 locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","Warehouse",false,false,true);
//				locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,false);
			else
//				locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
				locationsList = genericMasterServiceObj.getLocationDetails("","1", emailIdStr,"-1","","",false,true,true);
//				genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,index,maxRecords);

			
			List<PurchaseOrder> purchaseOrderBeansList = procurementServiceObj.getPurchaseOrders(operation,customerIdStr, emailIdStr,location,index,maxRecords,searchNameStr,startDateStr,endDateStr,true,itemwise,supplier,zone,category);
		
			if(purchaseOrderBeansList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
				modelAndViewObj.addObject("IndentQty", "0");
				modelAndViewObj.addObject("PoQty", "0");
				modelAndViewObj.addObject("POValue", "0");
			}else{
				if(purchaseOrderBeansList.size()<Integer.parseInt(maxRecords)){
					end = (purchaseOrderBeansList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(purchaseOrderBeansList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("IndentQty", purchaseOrderBeansList.get(0).getTotalIndentQty());
				modelAndViewObj.addObject("PoQty", purchaseOrderBeansList.get(0).getTotalPoQty());
				modelAndViewObj.addObject("POValue", purchaseOrderBeansList.get(0).getTotalPOValue());
			}
			/*if(!operation.equals("Draft"))
				operation = "all";*/
			if(location != null && !location.equals(""))
				request.getSession().setAttribute("selectedLocation", location);
			modelAndViewObj.addObject("operation", operation);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("warehouse",location);
			modelAndViewObj.addObject("purchaseOrderBeansList", purchaseOrderBeansList);
			modelAndViewObj.addObject("startDate", startDateStr);
			modelAndViewObj.addObject("endDate", endDateStr);
			modelAndViewObj.addObject("itemwise", itemwise);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("categoryDetails", categoryList);
			modelAndViewObj.addObject("selectedcategory", category);
			modelAndViewObj.addObject("supplier", supplier);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
		    modelAndViewObj.addObject("searchName", searchNameStr);
		    modelAndViewObj.addObject("workflowsList", workflowsList);
		    modelAndViewObj.setViewName("Procurement/PurchaseOrder/purchaseOrder");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On : 28-jun-2015
	 * 
	 * This method returns the newPurchaseOrder JSP.
	 * It retrieves location list and adds it to the model object as it needs to be dynamically populated in the view.
	 *
	 **/
	@RequestMapping("/newPurchaseOrder")
	public ModelAndView newPurchaseOrder(@RequestParam("operation") String operation,HttpServletRequest request,HttpServletResponse response){
		try{
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String warehouse="";
			ArrayList<LocationBean> locationsList=null;
			
			
			if(operation.equals("warehouse"))
				 locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","100","Warehouse",false,false,true);
//				locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,false);
			else
//				locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
				locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","100","",false,true,true);
//				
			
		//	ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("","1",emailIdStr,"-1","",false,true,false);
//			ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("","1", emailIdStr,"-1","","",false,true,true);
			List<String> workLocationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr,emailIdStr,false);
			modelAndViewObj = new ModelAndView();
			for(int i=0;i<locationsList.size();i++){
				if(locationsList.get(i).getBusinessActivity().equalsIgnoreCase("Warehouse")){
					warehouse = locationsList.get(i).getLocationId();
				}
					
			}
			
			String location = (String)request.getSession().getAttribute("selectedLocation");
			modelAndViewObj.addObject("warehouse", warehouse);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("locationBeanList", locationsList);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("type","new");
			modelAndViewObj.addObject("operation",operation);
			
			modelAndViewObj.setViewName("Procurement/PurchaseOrder/editPurchaseOrder");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	@RequestMapping("/searchQuoteRef")
	public @ResponseBody List<String> searchQuoteRef(@RequestParam("searchName") String searchNameStr, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<String> quoteRefsList = new ArrayList<String>();
		try{
			// log.info("searchQuoteRef");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			quoteRefsList = procurementServiceObj.searchQuoteRef(customerIdStr, emailIdStr, searchNameStr);
			// log.info("Result:::"+quoteRefsList);
		}catch(Exception e){
			e.printStackTrace();
		}
		return quoteRefsList;
	}
	
	@RequestMapping(value="/addQuoteItemsToPurchaseOrder",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView addQuoteItemsToPurchaseOrder(@RequestBody PurchaseOrder purchaseOrderDetails,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("addQuoteItemsToPurchaseOrder");
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		modelAndViewObj = new ModelAndView();
		purchaseOrderDetails = procurementServiceObj.addQuoteItemsToPurchaseOrder(purchaseOrderDetails,customerIdStr,emailIdStr);
		request.getSession().setAttribute("selectedLocation",purchaseOrderDetails.getStoreLocation());
		modelAndViewObj.addObject("selectedLocation", purchaseOrderDetails.getStoreLocation());
		ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
		List<String> workLocationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr,emailIdStr,false);
		modelAndViewObj.addObject("purchaseOrderBeanObj", purchaseOrderDetails);
		modelAndViewObj.addObject("locationBeanList", locationBeanList);
		modelAndViewObj.addObject("workLocationsList", workLocationsList);
		if((purchaseOrderDetails.getpO_Ref() == null || purchaseOrderDetails.getpO_Ref().equals("")) && (purchaseOrderDetails.getPO_Ref() == null || purchaseOrderDetails.getPO_Ref().equals("")))
			modelAndViewObj.addObject("type","new");
		else
			modelAndViewObj.addObject("type","edit");
		modelAndViewObj.setViewName("Procurement/PurchaseOrder/editPurchaseOrder");
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}
	
	
	
	@RequestMapping(value="/createPurchaseOrder",method=RequestMethod.POST)
	public ModelAndView createPurchaseOrder(@RequestBody PurchaseOrder purchaseOrderDetails,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("createPurchaseOrder");
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		ArrayList<LocationBean> locationsList=null;
		modelAndViewObj = new ModelAndView();
		String result = procurementServiceObj.createPurchaseOrder(purchaseOrderDetails,customerIdStr,emailIdStr);
		request.getSession().setAttribute("selectedLocation",purchaseOrderDetails.getStoreLocation());
		modelAndViewObj.addObject("selectedLocation", purchaseOrderDetails.getStoreLocation());
		
		/*ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("","1",emailIdStr,"-1","",false,true,false);
		modelAndViewObj.addObject("locationBeanList", locationBeanList);
		*/

		if(purchaseOrderDetails.getFlowUnder().equals("warehouse"))
			 locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","100","Warehouse",false,false,true);
		else
			locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","100","",false,true,true);
			
		modelAndViewObj.addObject("locationBeanList", locationsList);
		
		List<String> workLocationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr,emailIdStr,false);
		modelAndViewObj.addObject("workLocationsList", workLocationsList);
		
		if(!result.equals(AppProperties.getAppMessageByProperty("PURCHASEORDER_CREATE_SUCCESS").trim())){
			purchaseOrderDetails.setPO_Ref(purchaseOrderDetails.getPoRef());
			List<String> selectedLocationsList = new ArrayList<String>();
			if(purchaseOrderDetails.getShipmentLocations() != null && purchaseOrderDetails.getShipmentLocations().size() > 0)
				for(PurchaseOrderShipmentLocation purchaseOrderShipmentLocation : purchaseOrderDetails.getShipmentLocations()){
					float totalCost = Float.parseFloat(purchaseOrderShipmentLocation.getQuantity()) * purchaseOrderShipmentLocation.getSkuPrice();
					double cost = Math.round(totalCost*100.0)/100.0;
					purchaseOrderShipmentLocation.setTotalCost(cost);
					if(!selectedLocationsList.contains(purchaseOrderShipmentLocation.getStoreLocation()))
						selectedLocationsList.add(purchaseOrderShipmentLocation.getStoreLocation());
				}
			List<LocationBean> locationDetails = new ArrayList<LocationBean>();
			List<LocationBean> selectedLocationDetails = new ArrayList<LocationBean>();
			for(String locationId : selectedLocationsList){
				locationDetails = genericMasterServiceObj.getLocationDetails(locationId,customerIdStr, emailIdStr,"0","",false,true,true);
				if(locationDetails != null && locationDetails.size() > 0)
					selectedLocationDetails.add(locationDetails.get(0));
			}
			purchaseOrderDetails.setSelectedLocationList(selectedLocationDetails);
			modelAndViewObj.addObject("purchaseOrderBeanObj", purchaseOrderDetails);			
			modelAndViewObj.addObject("err", result);
		}
		else
			modelAndViewObj.addObject("success", result);
		modelAndViewObj.addObject("type","new");
		modelAndViewObj.addObject("operation",purchaseOrderDetails.getFlowUnder());
		modelAndViewObj.setViewName("Procurement/PurchaseOrder/editPurchaseOrder");
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
	 *This method is used to view the purchase Order Details of the given  PO_Ref
	 *
	 **/
	@RequestMapping("/viewPurchaseOrderDetails")
	public ModelAndView viewPurchaseOrderDetails(@RequestParam("formData") String formData,@RequestParam("PO_Ref") String PO_Ref,@RequestParam("operation") String operation,@RequestParam("op") String op,@RequestParam("status") String status,HttpServletRequest request,HttpServletResponse response){
		try{
			////////System.out.println("fasdf");
			// log.info("viewPurchaseOrderDetails");
			RequestBean requestBeanObj = null;
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			PurchaseOrder  purchaseOrderBeanObj = procurementServiceObj.getPurchaseOrderDetails(PO_Ref,status,customerIdStr, emailIdStr);
			
			
			if(purchaseOrderBeanObj.getPurchaseItems() != null){
				/*
				 * for(int i = 0;i<purchaseOrderBeanObj.getPurchaseItems().size();i++){ String
				 * responseStr = skuServiceObj.getWarehouseSkuDetails(customerIdStr,
				 * emailIdStr,purchaseOrderBeanObj.getPurchaseItems().get(i).getSkuId(),
				 * purchaseOrderBeanObj.getPurchaseItems().get(i).getLocation(),"");
				 * requestBeanObj = gson.fromJson(responseStr,RequestBean.class);
				 * 
				 * if(requestBeanObj.getSkuLists().get(0).getTax() != null){
				 * purchaseOrderBeanObj.getPurchaseItems().get(i).setTaxdetailsStr(gson.toJson(
				 * requestBeanObj.getSkuLists().get(0).getTax())); }
				 * 
				 * }
				 */
				for(int i = 0;i<purchaseOrderBeanObj.getPurchaseItems().size();i++){
					if(purchaseOrderBeanObj.getPurchaseItems().get(i).getTaxList() != null){
						purchaseOrderBeanObj.getPurchaseItems().get(i).setTaxdetailsStr(gson.toJson(purchaseOrderBeanObj.getPurchaseItems().get(i).getTaxList()));
						}
					}
			}
			
			
			List<LocationBean> locationList  =  genericMasterServiceObj.getLocationDetails(purchaseOrderBeanObj.getWarehouse_location(),customerIdStr,emailIdStr,"0","",false,false,true);
			List<SupplierBean> suppliersList  = outletMasterServiceObj.searchSuppliers(customerIdStr, emailIdStr,purchaseOrderBeanObj.getSupplier_name(),"0","");

			if(suppliersList != null)
			purchaseOrderBeanObj.setSupplier_state(suppliersList.get(0).getState());
			if(locationList != null) {
				for(LocationBean loc : locationList)
				if(purchaseOrderBeanObj.getWarehouse_location().equalsIgnoreCase(loc.getLocationId()))
				purchaseOrderBeanObj.setLocation_state(loc.getState());
				
			}
			
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("purchaseOrderBeanObj", purchaseOrderBeanObj);
			//ArrayList<LocationBean> locationBeanList = null;
			ArrayList<LocationBean> locationsList=null;
			if(operation.equals("view")){
				PurchaseOrder skuObj=gson.fromJson(formData, PurchaseOrder.class);
				modelAndViewObj.addObject("skuObj",skuObj);
				
				
				if(op.equals("warehouse"))
					 locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","100","Warehouse",false,false,true);
//					locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,false);
				else
//					locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
					locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","100","",false,true,true);
//					
				//locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,true);
				modelAndViewObj.setViewName("Procurement/PurchaseOrder/viewPurchaseOrder");
			}
			else{
				modelAndViewObj.addObject("type","edit");
				List<String> workLocationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr,emailIdStr,false);
				
				
				if(op.equals("warehouse"))
					 locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","100","Warehouse",false,false,true);
//					locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,false);
				else
//					locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
					locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","100","",false,true,true);
//					
				
				
				//locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
				modelAndViewObj.addObject("workLocationsList", workLocationsList);
				modelAndViewObj.setViewName("Procurement/PurchaseOrder/editPurchaseOrder");
			}
			
			
			modelAndViewObj.addObject("operation",op);
			modelAndViewObj.addObject("locationBeanList", locationsList);
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Chaithanya.V
	 * 
	 *This method is used to PRINT the purchase Order Details of the given  PO_Ref
	 *
	 **/
	@RequestMapping("/printPurchaseOrderDetails")
	public void printPurchaseOrderDetails(@RequestParam("PO_Ref") String PO_Ref,@RequestParam("operation") String operation,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("printPurchaseOrderDetails");
			////////System.out.println("printPurchaseOrderDetails");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			  String result = procurementServiceObj.getprintPurchaseOrderDetails(PO_Ref,customerIdStr, emailIdStr);
			String jsonString = null;
			if(result.contains("0"))
				jsonString = result;
			else if(result.contains("-1"))
				jsonString = "{\"err\":\" Sorry please try after some time\"}";
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
    	response.getWriter().write(result);
	}catch(Exception e){
		e.printStackTrace();
	}finally {
    	try {
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
    
    }
	}
	
	
	
	@RequestMapping("/printInvioceDetails")
	public void printInvioceDetails(@RequestParam("Invoice_Ref") String Invoice_Ref,@RequestParam("operation") String operation,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("printInvoiceOrderDetails");
			////////System.out.println("printInvoiceOrderDetails");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			  String result = procurementServiceObj.getprintWhInvoiceDetails(Invoice_Ref,customerIdStr, emailIdStr);
			String jsonString = null;
			if(result.contains("0"))
				jsonString = result;
			else if(result.contains("-1"))
				jsonString = "{\"err\":\" Sorry please try after some time\"}";
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
    	response.getWriter().write(result);
	}catch(Exception e){
		e.printStackTrace();
	}finally {
    	try {
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
    
    }
	}
	
	
	
	/**
	 * 
	 * @author Chaithanya.V
	 * 
	 *This method is used to PRINT the purchase Order Details of the given  PO_Ref
	 *
	 **/
	@RequestMapping("/printgrnOrderDetails")
	public void printgrnOrderDetails(@RequestParam("PO_Ref") String PO_Ref,@RequestParam("operation") String operation,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("printgrnOrderDetails");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			  String result = procurementServiceObj.getprintgrnDetails(PO_Ref,customerIdStr, emailIdStr);
			String jsonString = null;
			if(result.contains("0"))
				jsonString = result;
			else if(result.contains("-1"))
				jsonString = "{\"err\":\" Sorry please try after some time\"}";
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
    	response.getWriter().write(result);
	}catch(Exception e){
		e.printStackTrace();
	}finally {
    	try {
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
    
    }
	}
	/**
	 * 
	 * @author Mythri.S
	 * Created on :1-jul-2015.
	 * 
	 * This method is used to update the existing purchase order Details.
	 * It accepts the order details need to be saved into database.
	 * It returns editPurchaseOrder JSP along with the updated details and message related to update success or not.
	 *
	 **/
	
	@RequestMapping(value="/updatePurchaseOrder",method=RequestMethod.POST)
	public ModelAndView updatePurchaseOrder(@RequestBody PurchaseOrder purchaseOrderDetails,HttpServletRequest request,HttpServletResponse response){
		String result = null;
		ArrayList<LocationBean> locationsList = null;
		RequestBean requestBeanObj = null;
		try{
		// log.info("updatePurchaseOrder");
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		modelAndViewObj = new ModelAndView();
		
		PurchaseOrder purchaseorder = new PurchaseOrder();
		if(purchaseOrderDetails.getId()!=null && purchaseOrderDetails.getQuantity()!=null){
			List<String> skuid = purchaseOrderDetails.getId();
			List<String> Qty = purchaseOrderDetails.getQuantity();
			List<String> issued = purchaseOrderDetails.getItemPrice();
			if(request.getSession().getAttribute("warehousePos")!= null)
			{
				List<PurchaseOrder>	srlist =(List<PurchaseOrder>)request.getSession().getAttribute("warehousePos");
				for(int i=0;i<srlist.size();i++){
					if(srlist.get(i).getPO_Ref().equalsIgnoreCase(purchaseOrderDetails.getPoRef())){
						String PoRef = purchaseOrderDetails.getPoRef();
						
						purchaseorder = srlist.get(i);
						purchaseOrderDetails = srlist.get(i);
						purchaseorder.setPoRef(PoRef);
						purchaseorder.setOrder_date(purchaseOrderDetails.getOrdereDate());
						purchaseorder.setDelivery_due_date(purchaseOrderDetails.getDeliveryDate());
						
						//purchaseOrderDetails.setPoRef(PoRef);
						purchaseorder.setWhPOShipmentLocations(srlist.get(i).getLocationsList());
						for(int j=0;j<purchaseOrderDetails.getItemsList().size();j++){
							for(int k=0;k<skuid.size();k++)
							if(purchaseOrderDetails.getItemsList().get(j).getSkuId().equalsIgnoreCase(skuid.get(k))){
								WHPurchaseOrderItems items = purchaseOrderDetails.getItemsList().get(j);
								items.setQuantity(Qty.get(k));
								items.setItemPrice(Float.valueOf(issued.get(k)));
								purchaseOrderDetails.getItemsList().set(k, items);
							}
							purchaseorder.setWhPurchaseItems(purchaseOrderDetails.getItemsList());
							
						}
						
					}
				}
				
			}
			purchaseorder.setItemsList(null);
			 result = procurementServiceObj.updatePurchaseOrder(purchaseorder,customerIdStr,emailIdStr);
			return viewPurchaseOrder("","warehouse", "", "0", "10", request, response);
			
			/*if(!result.equals(AppProperties.getAppMessageByProperty("PURCHASEORDER_UPDATE_SUCCESS").trim()))
				modelAndViewObj.addObject("err", result);
			else
				modelAndViewObj.addObject("success", result);
//			if(purchaseOrderDetails.getStatus().equals("Draft") || purchaseOrderDetails.getStatus().equals("Submitted") || purchaseOrderDetails.getStatus().equals("Re-Order"))
				modelAndViewObj.setViewName("Procurement/PurchaseOrder/editPurchaseOrder");
			else
				modelAndViewObj.setViewName("Procurement/PurchaseOrder/viewPurchaseOrder");
			modelAndViewObj.addObject("type","edit");*/
		}
		else{

			 result = procurementServiceObj.updatePurchaseOrder(purchaseOrderDetails,customerIdStr,emailIdStr);
			PurchaseOrder  purchaseOrderBeanObj = procurementServiceObj.getPurchaseOrderDetails(purchaseOrderDetails.getpO_Ref(),"",customerIdStr, emailIdStr);
			
			if(purchaseOrderBeanObj.getPurchaseItems() != null){
				for(int i = 0;i<purchaseOrderBeanObj.getPurchaseItems().size();i++){
					
					if(purchaseOrderBeanObj.getPurchaseItems().get(i).getTaxList() != null){
						purchaseOrderBeanObj.getPurchaseItems().get(i).setTaxdetailsStr(gson.toJson(purchaseOrderBeanObj.getPurchaseItems().get(i).getTaxList()));
						}
					
				}
			}
			List<SupplierBean> suppliersList  = outletMasterServiceObj.searchSuppliers(customerIdStr, emailIdStr,purchaseOrderBeanObj.getSupplier_name(),"0","");

			if(suppliersList != null)
			purchaseOrderBeanObj.setSupplier_state(suppliersList.get(0).getState());
			
			modelAndViewObj.addObject("purchaseOrderBeanObj", purchaseOrderBeanObj);
			/*ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("","1",emailIdStr,"-1","",false,true,false);
			modelAndViewObj.addObject("locationBeanList", locationBeanList);*/
			if(purchaseOrderDetails.getFlowUnder().equals("warehouse"))
				 locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","100","Warehouse",false,false,true);
			else
				locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","100","",false,true,true);
				
			modelAndViewObj.addObject("locationBeanList", locationsList);
			
			
			
			List<String> workLocationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr,emailIdStr,false);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			if(!result.equals(AppProperties.getAppMessageByProperty("PURCHASEORDER_UPDATE_SUCCESS").trim()))
				modelAndViewObj.addObject("err", result);
			else
				modelAndViewObj.addObject("success", result);
//			if(purchaseOrderDetails.getStatus().equals("Draft") || purchaseOrderDetails.getStatus().equals("Submitted") || purchaseOrderDetails.getStatus().equals("Re-Order"))
			modelAndViewObj.addObject("operation",purchaseOrderDetails.getFlowUnder());	
			modelAndViewObj.setViewName("Procurement/PurchaseOrder/editPurchaseOrder");
			/*else
				modelAndViewObj.setViewName("Procurement/PurchaseOrder/viewPurchaseOrder");*/
			modelAndViewObj.addObject("type","edit");
		}
		
		
	}
	catch(Exception exception){
		exception.printStackTrace();
		
	}
	return modelAndViewObj;
}
	
		
	@RequestMapping("/viewShipmentNotes")
	public ModelAndView viewShipmentNotes(@RequestParam("index") String index,@RequestParam("maxRecords") String maxRecords,@RequestParam("flowUnder") String flowUnder,
			@RequestParam("location") String location,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<String> locationsList =null;
		try{
			// log.info("viewShipmentNotes");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
		
			if(flowUnder.equals("warehouse"))
				locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
			else
				locationsList = adminServiceObj.getOutletLocationsList(customerIdStr, emailIdStr, true);
			
//			locationsListValue = adminServiceObj.getOutletLocationsList(customerIdStr, emailIdStr, true);
			
//			Added by vijay, to make default loaction as location list first occurrence, if location is empty
			if((location.trim()).equals(null) || location.trim().isEmpty())
			{
				location = locationsList.get(0);
			}
			
			
			List<PurchaseShipmentNote> purchaseShipmentNoteList = procurementServiceObj.getShipmentNote("",index,customerIdStr,emailIdStr,location,maxRecords,null,null);
			modelAndViewObj = new ModelAndView();
			int start = 1,end = 10;
			if(purchaseShipmentNoteList == null || purchaseShipmentNoteList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(purchaseShipmentNoteList.size()<10){
					end = (purchaseShipmentNoteList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(purchaseShipmentNoteList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("purchaseShipmentNoteList", purchaseShipmentNoteList);
			modelAndViewObj.addObject("selectedLocation",location);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.setViewName("Procurement/ShipmentNotes/shipmentNotes");
		}catch(Exception e){
		  e.printStackTrace();	
		}
		return modelAndViewObj;
	}
	
	
	@RequestMapping("/searchShipmentNotes")
	public ModelAndView searchShipmentNotes(@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,@RequestParam("maxRecords") String maxRecords,@RequestParam("location") String location,@RequestParam("endDate") String endDate,@RequestParam("startDate") String startDate, @RequestParam("flowUnder") String flowUnder,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<String> locationsList =null;
		try{
			// log.info("searchShipmentNotes");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
//			List<String> locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
			if(flowUnder.equals("warehouse"))
				locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
			else
				locationsList = adminServiceObj.getOutletLocationsList(customerIdStr, emailIdStr, true);
			
			List<PurchaseShipmentNote> purchaseShipmentNoteList = procurementServiceObj.getShipmentNote(searchNameStr,index,customerIdStr,emailIdStr,location,maxRecords,startDate,endDate);
			modelAndViewObj = new ModelAndView();
			int start = 1,end = 10;
			if(purchaseShipmentNoteList == null || purchaseShipmentNoteList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(purchaseShipmentNoteList.size()<10){
					end = (purchaseShipmentNoteList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(purchaseShipmentNoteList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("purchaseShipmentNoteList", purchaseShipmentNoteList);
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("selectedLocation",location);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("endDate",endDate);
			modelAndViewObj.addObject("startDate", startDate);
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.setViewName("Procurement/ShipmentNotes/shipmentNotes");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	@RequestMapping("/newShipmentNote")
	public ModelAndView newShipmentNote(@RequestParam("flowUnder") String flowUnder,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		try{
			// log.info("newShipmentNote");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
			String location = (String)request.getSession().getAttribute("selectedLocation");
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("workLocationsList", locationBeanList);
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.addObject("type","new");
			modelAndViewObj.setViewName("Procurement/ShipmentNotes/newShipmentNote");
		}catch(Exception e){
		  e.printStackTrace();	
		}
		return modelAndViewObj;
	}
	
	
	@RequestMapping(value="/addPoItemsToShipmentNote",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView addPoItemsToShipmentNote(@RequestBody PurchaseShipmentNote purchaseShipmentNote,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("addPoItemsToShipmentNote");
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		modelAndViewObj = new ModelAndView();
		purchaseShipmentNote = procurementServiceObj.addPoItemsToShipmentNote(purchaseShipmentNote,customerIdStr,emailIdStr);
		ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
		String location = (String)request.getSession().getAttribute("selectedLocation");
		modelAndViewObj.addObject("selectedLocation", location);
		modelAndViewObj.addObject("workLocationsList", locationBeanList);
		modelAndViewObj.addObject("shipmentNoteObj", purchaseShipmentNote);
		if(purchaseShipmentNote.getShipmentNoteRef() == null || purchaseShipmentNote.getShipmentNoteRef().equals(""))
			modelAndViewObj.addObject("type","new");
		else
			modelAndViewObj.addObject("type","edit");
		modelAndViewObj.addObject("flowUnder", purchaseShipmentNote.getFlowUnder());
		modelAndViewObj.setViewName("Procurement/ShipmentNotes/newShipmentNote");
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}
	
	@RequestMapping(value="/createShipmentNote",method=RequestMethod.POST)
	public ModelAndView createShipmentNote(@RequestBody PurchaseShipmentNote purchaseShipmentNote,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("createShipmentNote");
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		modelAndViewObj = new ModelAndView();
		purchaseShipmentNote.setUserName(emailIdStr);
		String role = (String)request.getSession().getAttribute("role");
		purchaseShipmentNote.setRoleName(role);
		String result = procurementServiceObj.createShipmentNote(purchaseShipmentNote,customerIdStr,emailIdStr);
		String location = (String)request.getSession().getAttribute("selectedLocation");
		modelAndViewObj.addObject("selectedLocation", location);
		ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
		modelAndViewObj.addObject("workLocationsList", locationBeanList);
		if(!result.equals(AppProperties.getAppMessageByProperty("SHIPMENT_NOTE_CREATE_SUCCESS").trim())){
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
				locationDetails = genericMasterServiceObj.getLocationDetails(locationId,customerIdStr, emailIdStr,"0","",false,true,true);
				if(locationDetails != null && locationDetails.size() > 0)
					selectedLocationDetails.add(locationDetails.get(0));
			}
			purchaseShipmentNote.setSelectedLocationList(selectedLocationDetails);
			modelAndViewObj.addObject("shipmentNoteObj", purchaseShipmentNote);			
			modelAndViewObj.addObject("err", result);
		}
		else
			modelAndViewObj.addObject("success", result);
		modelAndViewObj.addObject("type","new");
		modelAndViewObj.addObject("flowUnder", purchaseShipmentNote.getFlowUnder());
		modelAndViewObj.setViewName("Procurement/ShipmentNotes/newShipmentNote");
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}
	
	
	@RequestMapping("/viewShipmentNoteDetails")
	public ModelAndView viewShipmentNoteDetails(@RequestParam("shipmentNoteRef") String shipmentNoteRef,@RequestParam("operation") String operation,@RequestParam("flowUnder") String flowUnder,@RequestParam("formData") String formData,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		try{
			// log.info("viewShipmentNoteDetails");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			PurchaseShipmentNote  purchaseShipmentNoteObj = procurementServiceObj.getShipmentNoteDetails(shipmentNoteRef,customerIdStr, emailIdStr);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("shipmentNoteObj", purchaseShipmentNoteObj);
			ArrayList<LocationBean> locationBeanList = null;
			
			//added by manasa 
			PurchaseShipmentNote skuObj=gson.fromJson(formData, PurchaseShipmentNote.class);
			modelAndViewObj.addObject("skuObj",skuObj);
			
			if(operation.equals("view")){
				locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,true);
				modelAndViewObj.setViewName("Procurement/ShipmentNotes/viewShipmentNotes");
			}
			else{
				modelAndViewObj.addObject("type","edit");
				locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
				modelAndViewObj.setViewName("Procurement/ShipmentNotes/newShipmentNote");
			}
			modelAndViewObj.addObject("workLocationsList", locationBeanList);
			modelAndViewObj.addObject("flowUnder", flowUnder);
		}catch(Exception e){
		  e.printStackTrace();	
		}
		return modelAndViewObj;
	}
	
	
	@RequestMapping(value="/updateShipmentNote",method=RequestMethod.POST)
	public ModelAndView updateShipmentNote(@RequestBody PurchaseShipmentNote purchaseShipmentNote,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("updateShipmentNote");
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		modelAndViewObj = new ModelAndView();
		purchaseShipmentNote.setUserName(emailIdStr);
		String role = (String)request.getSession().getAttribute("role");
		purchaseShipmentNote.setRoleName(role);
		String result = procurementServiceObj.updateShipmentNote(purchaseShipmentNote,customerIdStr,emailIdStr);
		PurchaseShipmentNote  purchaseShipmentNoteObj = procurementServiceObj.getShipmentNoteDetails(purchaseShipmentNote.getShipmentNoteRef(),customerIdStr, emailIdStr);
		modelAndViewObj.addObject("shipmentNoteObj", purchaseShipmentNoteObj);
		ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
		modelAndViewObj.addObject("workLocationsList", locationBeanList);
		if(!result.equals(AppProperties.getAppMessageByProperty("SHIPMENT_NOTE_UPDATE_SUCCESS").trim()))
			modelAndViewObj.addObject("err", result);
		else
			modelAndViewObj.addObject("success", result);
		modelAndViewObj.addObject("type","edit");
		modelAndViewObj.addObject("flowUnder", purchaseShipmentNote.getFlowUnder());
		modelAndViewObj.setViewName("Procurement/ShipmentNotes/newShipmentNote");
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}
	



	@RequestMapping("/viewShipmentReceipts")
	public ModelAndView viewShipmentReceipts(@RequestParam("operation") String operation,@RequestParam("location") String location,@RequestParam("index") String index,@RequestParam("flowUnder") String flowUnder,@RequestParam("startdate") String startdate,HttpServletRequest request,HttpServletResponse response){
//		String locationsAllList="";
//		List<String> locationsList= null;
		ArrayList<LocationBean> locationsList=null;
		try{
			// log.info("viewShipmentReceipts");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			
			
			if(flowUnder.equals("warehouse"))
			{
				locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","Warehouse",false,false,true);
//			locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
			}
			else
			{
				locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
//			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr, emailIdStr, true);
		//	 locationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr,emailIdStr,true);	
			}
//			Added by vijay, to make default loaction as location list first occurrence, if location is empty
			/*if((location.trim()).equals(null) || location.trim().isEmpty())
			{
				location = locationsList.get(0).getLocationId();
			}*/
			
			/*if(location.equals("all")||location.equals(""))
			{
				if(locationsAllList!=null)
					for (String string : locationsList) {
						locationsAllList=locationsAllList+string+",";
					}
			}*/
			
		//	List<String> locationsList = null;
		/*if(flowUnder.equals("management"))
				
				locationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr,true);
			else if(flowUnder.equals("warehouse")){
				//////System.out.println("management");
			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
		locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
			}	else
				locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
				locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);*/
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("flowUnder", flowUnder);
			ProcurementReceipt receiptObj = procurementServiceObj.getShipmentReceipts(operation,customerIdStr, emailIdStr,location,index,"10","",startdate,"",false,flowUnder,"","",false,"");
			
			List<ProcurementReceipt> procurementReceiptList = receiptObj.getReceiptDetails();
			request.getSession().setAttribute("warehouseGrn",procurementReceiptList);
			int start = 1,end = 10;
			if(procurementReceiptList == null || procurementReceiptList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(procurementReceiptList.size()<10){
					end = (procurementReceiptList.size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(procurementReceiptList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("selectedLocation",location);
			modelAndViewObj.addObject("operation", operation);
			modelAndViewObj.addObject("maxRecords", 10);
			modelAndViewObj.addObject("startDate", startdate);
			modelAndViewObj.addObject("procurementReceiptList", procurementReceiptList);
			modelAndViewObj.setViewName("Procurement/ShipmentReceipts/shipmentReceipts");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	

@RequestMapping("/viewShipmentReceiptDetails")
	public ModelAndView viewShipmentReceiptDetails(@RequestParam("receiptRefNo") String receiptRefNo,@RequestParam("flowUnder") String flowUnder,@RequestParam("formData") String formData,@RequestParam("operation") String operation,HttpServletRequest request,HttpServletResponse response){
		try{
//			List<ProcurementReceipt> procurementReceiptsList=new ArrayList<ProcurementReceipt>();
			// log.info("viewShipmentReceiptDetails");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String responseStr="";
			RequestBean requestBeanObj = null;
			ProcurementReceipt procurementReceipt = procurementServiceObj.getShipmentReceipt(receiptRefNo,customerIdStr, emailIdStr,flowUnder);
			ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("workLocationsList", locationBeanList);
			if(flowUnder.equals("warehouse")){
				procurementReceipt= procurementReceipt.getGrnObj();	
				procurementReceipt.setItems(procurementReceipt.getItemsList());
				if(procurementReceipt.getItems() != null){
					for (int i = 0; i < procurementReceipt.getItems().size(); i++) {
					
						if(procurementReceipt.getItems().get(i).getTaxList() != null){
							procurementReceipt.getItems().get(i).setTaxdetailsStr(gson.toJson(procurementReceipt.getItems().get(i).getTaxList()));

						}
					
					}
				}
			}
			else
			{
				procurementReceipt= procurementReceipt.getGrnObj();	
				procurementReceipt.setItems(procurementReceipt.getItemsList());
				
				
				/*
				procurementReceipt.setGrnList(procurementReceipt.getGrnList());
				procurementReceiptsList=procurementReceipt.getGrnList();
				for(int i=0;i<procurementReceiptsList.size();i++)
				{
					procurementReceipt=(ProcurementReceipt) procurementReceiptsList.get(i).getGrnList();
				}*/
				}
			List<EmployeeBean> empList = new ArrayList<EmployeeBean>();
			
			empList = genericMasterServiceObj.getEmployees("",customerIdStr,emailIdStr,"-1","","",false,"");
		
			//List<String> empList1= new ArrayList<String>();;
			String empListStr="";
			List<String> empList1 = new ArrayList<String>();
			if(empList != null){
				for(int i=0;i<empList.size();i++)
				{
					empListStr=empList.get(i).getFirstName()+" "+empList.get(i).getLastName()+" - "+empList.get(i).getEmployeeCode(); 
					empList1.add(empListStr);
					////////System.out.println(i);
				//	//////System.out.println(empList1);
				}
			}
				////////System.out.println(empList1);
				modelAndViewObj.addObject("empList", empList1);
//				modelAndViewObj.addObject("maxRecords", maxRecords);
				
				//added by manasa 
				ProcurementReceipt skuObj=gson.fromJson(formData, ProcurementReceipt.class);
				modelAndViewObj.addObject("skuObj",skuObj);
				
			modelAndViewObj.addObject("procurementReceipt", procurementReceipt);
			modelAndViewObj.addObject("operation", operation);
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.setViewName("Procurement/ShipmentReceipts/viewShipmentReceipt");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	

@RequestMapping("/editShipmentReceiptDetails")
	public ModelAndView editShipmentReceiptDetails(@RequestParam("maxRecords") String maxRecords,@RequestParam("formData") String formData,@RequestParam("receiptRefNo") String receiptRefNo,@RequestParam("flowUnder") String flowUnder,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("editShipmentReceiptDetails");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String responseStr="";
			RequestBean requestBeanObj = null;
			ProcurementReceipt procurementReceipt = procurementServiceObj.getShipmentReceipt(receiptRefNo,customerIdStr, emailIdStr,flowUnder);
			//System.out.println(gson.toJson(procurementReceipt));
			ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
			modelAndViewObj = new ModelAndView();
			if(flowUnder.equals("warehouse") || flowUnder.equals("procurement") ){
				
				

				procurementReceipt= procurementReceipt.getGrnObj();	
				procurementReceipt.setItems(procurementReceipt.getItemsList());
			
				if(procurementReceipt.getItems() != null){
					for (int i = 0; i < procurementReceipt.getItems().size(); i++) {
					
						if(procurementReceipt.getItems().get(i).getTaxList() != null){
							procurementReceipt.getItems().get(i).setTaxdetailsStr(gson.toJson(procurementReceipt.getItems().get(i).getTaxList()));

						}
					
					}
				}
			}
			
			
			
			List<SupplierBean> suppliersList  = outletMasterServiceObj.searchSuppliers(customerIdStr, emailIdStr,procurementReceipt.getSupplierName(),"0","");

			if(suppliersList != null)
			procurementReceipt.setSupplier_state(suppliersList.get(0).getState());
			
			/*else
			{
				procurementReceipt= procurementReceipt.getGrnObj();	
				procurementReceipt.setItems(procurementReceipt.getItemsList());	
			}*/
			List<EmployeeBean> empList = new ArrayList<EmployeeBean>();
			
		empList = genericMasterServiceObj.getEmployees("",customerIdStr,emailIdStr,"-1","","",false,"");
	
		//List<String> empList1= new ArrayList<String>();;
		String empListStr="";
		List<String> empList1 = new ArrayList<String>();
		
		if(empList != null){
			for(int i=0;i<empList.size();i++)
			{
				empListStr=empList.get(i).getFirstName()+" "+empList.get(i).getLastName()+" - "+empList.get(i).getEmployeeCode(); 
				empList1.add(empListStr);
				////////System.out.println(i);
			//	//////System.out.println(empList1);
			}
			////////System.out.println(empList1);
		}
			modelAndViewObj.addObject("empList", empList1);
			
			ProcurementReceipt skuObj=gson.fromJson(formData, ProcurementReceipt.class);
			modelAndViewObj.addObject("skuObj",skuObj);
			modelAndViewObj.addObject("startDate",skuObj.getStartDate());
			modelAndViewObj.addObject("endDate",skuObj.getEndDate());
			modelAndViewObj.addObject("selectedLocation",skuObj.getLocation());
			
			//modelAndViewObj.addObject("operation", operation);
			modelAndViewObj.addObject("workLocationsList", locationBeanList);
			modelAndViewObj.addObject("procurementReceipt", procurementReceipt);
			modelAndViewObj.addObject("outletLocation", procurementReceipt.getLocation());
			
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.addObject("maxRecords", maxRecords);
			//modelAndViewObj.addObject("operation", operation);
			
			modelAndViewObj.setViewName("Procurement/ShipmentReceipts/editShipmentReceipt");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	


@RequestMapping("/searchShipmentReceipts")
public ModelAndView searchShipmentReceipts(
		@RequestParam("itemwise") String itemwise,
		@RequestParam("supplier") String supplier,
		@RequestParam("searchName") String searchNameStr,
		@RequestParam("startDate") String startDateStr,
		@RequestParam("endDate") String endDateStr,
		@RequestParam("index") String index,@RequestParam("maxRecords") String maxRecords,@RequestParam("location") String location,@RequestParam("operation") String operation,@RequestParam("flowUnder") String flowUnder, 
		@RequestParam("saveFlag") boolean saveFlag,
		@RequestParam("category") String category,
		HttpServletRequest request,HttpServletResponse response) {
	String customerIdStr = null,emailIdStr=null;
	ArrayList<LocationBean> locationsList = null;
	try{
		// log.info("searchShipmentReceipts");
		////////System.out.println("searchShipmentReceipts");
		int start = 1,end = Integer.parseInt(maxRecords);
		customerIdStr = (String)request.getSession().getAttribute("customerId");
		emailIdStr = (String)request.getSession().getAttribute("emailId");
//		List<String> locationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr,true);
		if(flowUnder.equals("management"))
			locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,true,true);
		else if(flowUnder.equals("warehouse"))
			locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","Warehouse",false,false,true);
//			locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr,emailIdStr,true);
//			locationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr,emailIdStr,true);
		else
			locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
//			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr, emailIdStr, true);
//			locationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr,true);
		
		ProcurementReceipt recieptObj =  procurementServiceObj.getShipmentReceipts(operation,customerIdStr, emailIdStr,location,index,maxRecords,searchNameStr,startDateStr,endDateStr,true,flowUnder,itemwise,supplier,saveFlag,category);
		List<ProcurementReceipt> procurementReceiptList = recieptObj.getReceiptDetails();
//		List<PurchaseOrder> purchaseOrderBeansList = procurementServiceObj.getPurchaseOrders(operation,customerIdStr, emailIdStr,location,index,maxRecords,searchNameStr,startDateStr,endDateStr,true);
		if(procurementReceiptList == null){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(procurementReceiptList.size()<Integer.parseInt(maxRecords)){
				end = (procurementReceiptList.size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			modelAndViewObj.addObject("totalRecords", Integer.parseInt(procurementReceiptList.get(0).getTotalRecords()));
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
		}
		if(!operation.equals("draft"))
			operation = "all";
		if(location != null && !location.equals(""))
			request.getSession().setAttribute("selectedLocation", location);
		modelAndViewObj.addObject("operation", operation);
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("selectedLocation",location);
		modelAndViewObj.addObject("startDate", startDateStr);
		modelAndViewObj.addObject("endDate", endDateStr);
		modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
	    modelAndViewObj.addObject("searchName", searchNameStr);
	    modelAndViewObj.addObject("procurementReceiptList", procurementReceiptList);
	    modelAndViewObj.addObject("flowUnder", flowUnder);
	    modelAndViewObj.addObject("category", category);
	    modelAndViewObj.addObject("downloadurl",recieptObj.getFilePath());
		modelAndViewObj.setViewName("Procurement/ShipmentReceipts/shipmentReceipts");
	}catch(Exception e){
		e.printStackTrace();
	}
	return modelAndViewObj;
}
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to view the New Procurement Receipt form
	 *
	 **/
	@RequestMapping("/newShipmentReceipt")
	public ModelAndView newShipmentReceipt(@RequestParam("outletlocation") String outletlocation,@RequestParam("flowUnder") String flowUnder,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("newShipmentReceipt");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			// log.info(request.getLocale());
			ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
			
//			List<String> workLocationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerId,emailId);
			modelAndViewObj = new ModelAndView();
			String location = (String) request.getSession().getAttribute("selectedLocation");
			if(location != null)
				modelAndViewObj.addObject("selectedLocation",location);
			modelAndViewObj.addObject("workLocationsList", locationBeanList);
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.addObject("outletLocation", outletlocation);
			modelAndViewObj.setViewName("Procurement/ShipmentReceipts/newShipmentReceipt");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	@RequestMapping("/searchPoRefs")
	public @ResponseBody List<String> searchPoRefs(@RequestParam("searchName") String searchNameStr,@RequestParam("storeLocation")String storeLocation, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<String> poRefsList = new ArrayList<String>();
		try{
			// log.info("searchPoRefs");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			poRefsList = procurementServiceObj.searchPoRefs(customerIdStr, emailIdStr, searchNameStr,storeLocation);
			// log.info("Result:::"+poRefsList);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return poRefsList;
	}
	
	
	
	@RequestMapping("/searchGRNRefs")
	public @ResponseBody List<String> searchGRNRefs(@RequestParam("searchName") String searchNameStr,@RequestParam("storeLocation")String storeLocation, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<String> grnRefsList = new ArrayList<String>();
		try{
			// log.info("searchPoRefs");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			grnRefsList = procurementServiceObj.searchgGRNRefs(customerIdStr, emailIdStr, searchNameStr,storeLocation);
			// log.info("Result:::"+grnRefsList);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return grnRefsList;
	}
	
	
	@RequestMapping("/getPoItems")
	public @ResponseBody PurchaseOrderBean getPoItems(@RequestParam("poRefId") String poRefId,@RequestParam("storeLocation")String storeLocation,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		PurchaseOrderBean purchaseOrderShipmentLocationsList = new PurchaseOrderBean();
		List<ProductsList> productsList = new ArrayList<ProductsList>();
		String responseStr = "";
		RequestBean requestBeanObj = null;
		
		try{
			// log.info("getPoItems");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			purchaseOrderShipmentLocationsList = procurementServiceObj.getPoItems(poRefId, storeLocation, customerIdStr, emailIdStr);
			
			
			
			
			if(purchaseOrderShipmentLocationsList.getItemDetails()!=null && purchaseOrderShipmentLocationsList.getItemDetails().size()>0)
			{
				if(purchaseOrderShipmentLocationsList.getWhPurchaseOrder().getWarehouse_location()!=null)
				purchaseOrderShipmentLocationsList.getItemDetails().get(0).setLocation(purchaseOrderShipmentLocationsList.getWhPurchaseOrder().getWarehouse_location());
				if(purchaseOrderShipmentLocationsList.getWhPurchaseOrder().getSupplier_Id()!=null)
				purchaseOrderShipmentLocationsList.getItemDetails().get(0).setSupplierId(purchaseOrderShipmentLocationsList.getWhPurchaseOrder().getSupplier_Id());
				if(purchaseOrderShipmentLocationsList.getWhPurchaseOrder().getSupplier_name()!=null){
				purchaseOrderShipmentLocationsList.getItemDetails().get(0).setSupplierName(purchaseOrderShipmentLocationsList.getWhPurchaseOrder().getSupplier_name());
				List<SupplierBean> suppliersList  = outletMasterServiceObj.searchSuppliers(customerIdStr, emailIdStr,purchaseOrderShipmentLocationsList.getWhPurchaseOrder().getSupplier_name(),"0","");

				if(suppliersList != null)
					purchaseOrderShipmentLocationsList.getItemDetails().get(0).setSupplierstate(suppliersList.get(0).getState());
				purchaseOrderShipmentLocationsList.getItemDetails().get(0).setSupplierId(suppliersList.get(0).getSupplierCode());

				
				}
				List<SupplierBean> suppliersList  = outletMasterServiceObj.searchSuppliers(customerIdStr, emailIdStr,purchaseOrderShipmentLocationsList.getWhPurchaseOrder().getSupplier_name(),"0","");

				if(suppliersList != null)
					purchaseOrderShipmentLocationsList.getItemDetails().get(0).setGSTIN(suppliersList.get(0).getGstn_num());
			
			}
			if(purchaseOrderShipmentLocationsList.getItemDetails() != null){
				for(int i = 0;i<purchaseOrderShipmentLocationsList.getItemDetails().size();i++){
			
			if(purchaseOrderShipmentLocationsList.getItemDetails().get(i).getTaxList() != null){
				purchaseOrderShipmentLocationsList.getItemDetails().get(i).setTaxdetails(purchaseOrderShipmentLocationsList.getItemDetails().get(i).getTaxList());
				purchaseOrderShipmentLocationsList.getItemDetails().get(i).setTaxdetailsStr(new Gson().toJson(purchaseOrderShipmentLocationsList.getItemDetails().get(i).getTaxList()));
	
			}
			
			
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return purchaseOrderShipmentLocationsList;
	}
	
	
	 @RequestMapping("/getGrnItems")

	 public @ResponseBody PurchaseOrderBean getGrnItems(@RequestParam("grnRefId") String grnRefId,HttpServletRequest request,HttpServletResponse response) {
	 	PurchaseOrderBean purchaseOrderShipmentLocationsList = new PurchaseOrderBean();
	 	ProcurementReceipt grnobjList = new ProcurementReceipt();
	 	PurchaseOrderItems item= null;
	 	List<PurchaseOrderItems> poitems = new ArrayList<PurchaseOrderItems>();
	 	try{
	 		// log.info("getPoItems");
	 		////////System.out.println("getPoItems");
	 		
	 		grnobjList = procurementServiceObj.getGRNItems(grnRefId,"","", "");
	 		
	 		
	 	//	//////System.out.println(grnobjList.getItemsList().size());
	 		
	 	
	 		for(GoodsReceiptsItems grnitems : grnobjList.getItemsList())
	 		{
	 			 item = new PurchaseOrderItems();
	 			 item.setSkuId(grnitems.getSkuId());
	 			 item.setUom(grnitems.getUom());
	 			 item.setItemDesc(grnitems.getItemDesc());
	 			 item.setItemId(grnitems.getItemName());
	 			 item.setItemPrice(grnitems.getOrderPrice());
	 			 item.setQuantity(grnitems.getOrderQty().toString());
	 			 item.setPluCode(grnitems.getPluCode());
	 			 item.setTotalCost(grnitems.getTotalCost().toString());
	 			 item.setTax(grnitems.getItemTax());
	 			 item.setMeasurementRange(grnitems.getMeasurementRange());
	 			 item.setCategory(grnitems.getCategory());
	 			 item.setBrand(grnitems.getBrand());
	 			 item.setColor(grnitems.getColor());
	 			 item.setSize(grnitems.getSize());
	 			 item.setEan(grnitems.getEan());
	 			 item.setUtility(grnitems.getUtility());
	 			 
	 			 poitems.add(item);
	 		}
	 		purchaseOrderShipmentLocationsList.setItemDetails(poitems);
	 		if(grnobjList.getInvoiceRefNumber()!=null)
	 		purchaseOrderShipmentLocationsList.setInvoiceNo(grnobjList.getInvoiceRefNumber());
	 		if(grnobjList.getSupplierName()!=null)
	 		purchaseOrderShipmentLocationsList.setSupplierName(grnobjList.getSupplierName());
	 		purchaseOrderShipmentLocationsList.setSupplierId(grnobjList.getSupplierId());
	 		////////System.out.println(grnobjList.getSupplierName());
	 		
	 	}catch(Exception e){
	 		e.printStackTrace();
	 	}
	 	return purchaseOrderShipmentLocationsList;
	 }
	
	/*
	@RequestMapping("/getGrnItems")
	public @ResponseBody PurchaseOrderBean getGrnItems(@RequestParam("grnRefId") String grnRefId,HttpServletRequest request,HttpServletResponse response) {
		PurchaseOrderBean purchaseOrderShipmentLocationsList = new PurchaseOrderBean();
		ProcurementReceipt grnobjList = new ProcurementReceipt();
		PurchaseOrderItems item= null;
		List<PurchaseOrderItems> poitems = new ArrayList<PurchaseOrderItems>();
		try{
			// log.info("getPoItems");
			//////System.out.println("getPoItems");
			
			grnobjList = procurementServiceObj.getGRNItems(grnRefId,"","", "");
			if(grnobjList.getGrnObj().getItemsList()!=null)	
			grnobjList.getGrnObj().setItems(grnobjList.getGrnObj().getItemsList());
			//purchaseOrderShipmentLocationsList.setItemsList(grnobjList.getItemsList());
			for(GoodsReceiptsItems grnitems : grnobjList.getItemsList())
			{
				 item = new PurchaseOrderItems();
				 item.setSkuId(grnitems.getSkuId());
				 poitems.add(item);
			}
			purchaseOrderShipmentLocationsList.setItemDetails(poitems);
			
			//////System.out.println(grnobjList.getItemsList());
		}catch(Exception e){
			e.printStackTrace();
		}
		return purchaseOrderShipmentLocationsList;
	}
	*/
	
	
	/*@RequestMapping("/getGrnItems")
	public @ResponseBody ProcurementReceipt getGrnItems(@RequestParam("grnRefId") String grnRefId,@RequestParam("storeLocation") String storeLocation,HttpServletRequest request,HttpServletResponse response) {

		ProcurementReceipt grnobjList = new ProcurementReceipt();
		try{
			// log.info("getPoItems");
			//////System.out.println("getPoItems");
			
			grnobjList = procurementServiceObj.getGRNItems(grnRefId,"","", "");
			if(grnobjList.getGrnObj().getItemsList()!=null)	
			grnobjList.getGrnObj().setItems(grnobjList.getGrnObj().getItemsList());
		}catch(Exception e){
			e.printStackTrace();
		}
		return grnobjList;
	}
	*/
/*	@RequestMapping("/getGRNItems")
	public @ResponseBody ProcurementReceipt getGRNItems(@RequestParam("grnRefId") String grnRefId,@RequestParam("storeLocation")String storeLocation,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		ProcurementReceipt purchaseOrderShipmentLocationsList = new ProcurementReceipt();
		
		List<GoodsReceiptsItems> goodsItems = new ArrayList<GoodsReceiptsItems>();
		try{
			// log.info("getPoItems");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			purchaseOrderShipmentLocationsList = procurementServiceObj.getGRNItems(grnRefId, storeLocation, customerIdStr, emailIdStr);
			purchaseOrderShipmentLocationsList.getGrnObj().setItems(purchaseOrderShipmentLocationsList.getItemsList());
			//////System.out.println(purchaseOrderShipmentLocationsList.getItemsList().size());
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return purchaseOrderShipmentLocationsList;
	}*/
		
	
	
	
	@RequestMapping("/searchShipmentNoteRefs")
	public @ResponseBody List<String> searchShipmentNoteRefs(@RequestParam("searchName") String searchNameStr,@RequestParam("storeLocation")String storeLocation, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<String> shipmentNoteRefsList = new ArrayList<String>();
		try{
			// log.info("searchShipmentNoteRefs");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			shipmentNoteRefsList = procurementServiceObj.searchShipmentNoteRefs(customerIdStr, emailIdStr, searchNameStr,storeLocation);
			// log.info("Result:::"+shipmentNoteRefsList);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return shipmentNoteRefsList;
	}
	
	@RequestMapping("/getShipmentNoteItems")
	public @ResponseBody List<PurchaseOrderShipmentLocation> getShipmentNoteItems(@RequestParam("shipmentNoteRefId") String shipmentNoteRefId,@RequestParam("storeLocation")String storeLocation,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<PurchaseOrderShipmentLocation> purchaseOrderShipmentLocationsList = new ArrayList<PurchaseOrderShipmentLocation>();
		try{
			// log.info("getShipmentNoteItems");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			purchaseOrderShipmentLocationsList = procurementServiceObj.getShipmentNoteItems(shipmentNoteRefId, storeLocation, customerIdStr, emailIdStr);
		}catch(Exception e){
			e.printStackTrace();
		}
		return purchaseOrderShipmentLocationsList;
	}
	
	
	
	/**
	 * 
	 * @author Chaithanya.V
	 * 
	 *This method is used to save the details of a productMaster from excel file
	 *
	 **/
	@RequestMapping(value="/importExcelData",method=RequestMethod.POST)
	public @ResponseBody List<ProductsList>  importExcelData(@RequestParam("file") MultipartFile excelFile,@RequestParam("warehouseLocation")String warehouseLocation,@RequestParam("supplier")String supplier,@RequestParam("flag")String flag,HttpServletRequest request,HttpServletResponse response) {
		List <SkuPriceList> skuList =null;
		List <SkuPriceList> skuLists = new ArrayList<SkuPriceList>();
		String customerIdStr = null,emailIdStr=null;
		List<ProductsList> productsList = new ArrayList<ProductsList>();
		List<ProductsList> productsListwopricedup = new ArrayList<ProductsList>();
		List<ProductsList> productsLists = new ArrayList<ProductsList>();
		List<String> urllist = new ArrayList<String>();
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			 skuList = Utilities.getExcelData(excelFile);
			 
			String SkuIds = "";
			 for (int i = 0; i <skuList.size(); i++){
				 if((i != 0 ||  skuList.size()-1 == 0)&& (i%200 == 0 || i== skuList.size()-1)) {
					 skuLists.add(skuList.get(i));
					 SkuIds = SkuIds+skuList.get(i).getSkuId()+',';
					 Boolean skuflag=false;
						if(flag=="true" || flag.equals("true"))
						{
							skuflag=true;
						}
						productsList = skuServiceObj.importSkuProducts(customerIdStr,emailIdStr,SkuIds,warehouseLocation,"",supplier,skuflag);
						
						if(productsList.get(0).getUrl() != null && !productsList.get(0).getUrl().equals("")) {
							urllist.add(productsList.get(0).getUrl());
						}
						
						
						
						for(int b =0;b<skuLists.size();b++) {
							int count = 0;
							for(int r =0;r<productsList.size();r++) {
								
								
								if(skuLists.get(b).getSkuId().equalsIgnoreCase(productsList.get(r).getSkuID()) && count==0) {
								count = count+1;
								productsListwopricedup.add(productsList.get(r));
							}
						}
						}
						
						
						for(int j=0; j< skuLists.size(); j++){
		                    for (int s = 0; s <productsListwopricedup.size(); s++){
	           						if(productsListwopricedup.get(s).getSkuID().equalsIgnoreCase(skuLists.get(j).getSkuId()) )
	           							{
		                             
	           							productsListwopricedup.get(s).setQuantityInHand(productsListwopricedup.get(s).getQuantity());
	           							productsListwopricedup.get(s).setQuantity(skuLists.get(j).getQuantity());
	           							if(skuLists.get(j).getCostPrice() != null && skuLists.get(j).getCostPrice() != 0.0 )
	           								productsListwopricedup.get(s).setCost(skuLists.get(j).getCostPrice().toString());
	           							productsListwopricedup.get(s).setCostPrice(skuLists.get(j).getCostPrice());
	           						   productsLists.add(productsListwopricedup.get(s));	
	           							}
	           					
	           					}	}
	            			
						
						
					 SkuIds = "";
					 skuLists = new ArrayList<SkuPriceList>();
					
				 }else {
					     skuLists.add(skuList.get(i));
						SkuIds=SkuIds+skuList.get(i).getSkuId()+',';
					
				 }
			 }
			 
			
			 if(productsList.get(0).getResponseHeader() != null) {
				 productsLists.get(0).setResponseHeader(productsList.get(0).getResponseHeader());
			 }
			  
			 if(urllist != null) {
			 productsLists.get(0).setUrlList(urllist);
			 }
			 
		}catch(Exception e){
			e.printStackTrace();
		}
		return productsLists;
	}
	@RequestMapping(value="/importStockissueExcelData",method=RequestMethod.POST)
	public @ResponseBody List<SkuPriceList>  importStockissueExcelData(@RequestParam("file") MultipartFile excelFile,HttpServletRequest request,HttpServletResponse response) {
		List <SkuPriceList> skuList =null;
		try{
			 skuList = Utilities.getStockissueExcelData(excelFile);
			 ////////System.out.println(excelFile);
		/*	response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(gson.toJson(skuList));*/
		}catch(Exception e){
			e.printStackTrace();
		}
		return skuList;
	}

	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to save the details of a New Procurement Receipt and update the existing Procurement Receipt
	 *
	 **/
	@RequestMapping(value="/createShipmentReceipt",method=RequestMethod.POST)
	public ModelAndView createShipmentReceipt(@RequestParam("endDate") String endDate,@RequestParam("startDate") String startDate,@RequestParam("maxRecords") String maxRecords,@RequestParam("formData") String formData,@RequestParam("totalQty") String totalQty,@RequestParam("totalCost") String totalCost,@RequestParam("itemDetails") String itemDetails,@RequestParam("flowUnder") String flowUnder,@RequestParam("qtyFlag") boolean  qtyFlag,HttpServletRequest request,HttpServletResponse response) {
		ProcurementReceipt procurementReceipt=null;
//		List<GoodsReceiptsItems> itemsList=null;
		List<EmployeeBean> empList = new ArrayList<EmployeeBean>();
		String empname = "";
		List<String> empListName=new ArrayList<String>();
		try{
			// log.info("createShipmentReceipt");
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			// log.info(request.getLocale());
		    procurementReceipt = procurementServiceObj.createShipmentReceipt((Locale)request.getSession().getAttribute("currentLocale"),formData, totalQty, totalCost, itemDetails,customerIdStr,emailIdStr,flowUnder);
			ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
//			List<String> workLocationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerId,emailId);
			modelAndViewObj.addObject("workLocationsList", locationBeanList);
			request.getSession().setAttribute("selectedLocation",procurementReceipt.getLocation());
			modelAndViewObj.addObject("selectedLocation",procurementReceipt.getLocation());
			modelAndViewObj.addObject("outletLocation",procurementReceipt.getLocation());
		//	procurementReceipt=new ProcurementReceipt();
			
		/*	if (procurementReceipt.getOperation().equals("updated")){
				modelAndViewObj.addObject("procurementReceipt", procurementReceipt);
				if(procurementReceipt.getStatus().equals("draft"))
					modelAndViewObj.setViewName("Procurement/ShipmentReceipts/editShipmentReceipt");
				else
					modelAndViewObj.setViewName("Procurement/ShipmentReceipts/viewShipmentReceipt");
				if(!procurementReceipt.getResult().equals(AppProperties.getAppMessageByProperty("PROCUREMENT_UPDATE_SUCCESS").trim()))
					modelAndViewObj.addObject("err", procurementReceipt.getResult());
				else
					modelAndViewObj.addObject("success", procurementReceipt.getResult());
			}*/
			
					
				if(!procurementReceipt.getResult().equals(AppProperties.getAppMessageByProperty("PROCUREMENT_CREATE_SUCCESS").trim())){
					
					/*Gson gson = new Gson();
				ProcurementReceipt procurementReceiptObj = gson.fromJson(formData, ProcurementReceipt.class);
					ArrayList<GoodsReceiptsItems> itemDetailsList = new ArrayList<GoodsReceiptsItems>();
					itemDetails = Response.getResponseList(itemDetails, "itemDetails");
					GoodsReceiptsItems goodsReceiptsItems = null;
					JSONArray jsonArray = new JSONArray(itemDetails);
					for (int i=0; i<jsonArray.length(); i++) {
						// log.info(jsonArray.getString(i));
						goodsReceiptsItems = gson.fromJson(jsonArray.getString(i), GoodsReceiptsItems.class);
						itemDetailsList.add(goodsReceiptsItems);
					}
					procurementReceiptObj.setItemDetails(itemDetailsList);*/
					
					//written by manasa to get employee details 
					empList = genericMasterServiceObj.getEmployees("",customerIdStr, emailIdStr,"-1","","",false,"");
					
					if(empList != null){
					for(int i=0;i<empList.size();i++)
					{
					empname = empList.get(i).getFirstName()+" "+empList.get(i).getLastName()+" - "+empList.get(i).getEmployeeCode();
					empListName.add(empname);
					}
					}
					
					////////System.out.println(empListName);
					modelAndViewObj.addObject("empList",empListName);
					modelAndViewObj.addObject("procurementreceipt",procurementReceipt);
				    modelAndViewObj.addObject("err", procurementReceipt.getResult());
					// 
					/*Gson gson=new Gson();
					procurementReceipt=gson.fromJson(formData, ProcurementReceipt.class);*/
				modelAndViewObj.setViewName("Procurement/ShipmentReceipts/newShipmentReceipt");
				}
				
				else{
					/*procurementReceipt = procurementServiceObj.getShipmentReceipt(procurementReceipt.getReceiptNoteId(),customerIdStr, emailIdStr,flowUnder);
					if(procurementReceipt.getGrnObj().getItemsList()!=null)
					procurementReceipt.getGrnObj().setItems(procurementReceipt.getGrnObj().getItemsList());
					modelAndViewObj.addObject("procurementReceipt",procurementReceipt.getGrnObj());*/
					modelAndViewObj.addObject("success", procurementReceipt.getResult());
					//modelAndViewObj.addObject("procurementreceipt",procurementReceipt);
					modelAndViewObj.setViewName("Procurement/ShipmentReceipts/newShipmentReceipt");
				}
					
			
			modelAndViewObj.addObject("flowUnder",flowUnder);
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	@RequestMapping(value="/updateShipmentReceipt",method=RequestMethod.POST)
	public ModelAndView updateShipmentReceipt(@RequestParam("endDate") String endDate,@RequestParam("startDate") String startDate,@RequestParam("maxRecords") String maxRecords,@RequestParam("formData") String formData,@RequestParam("totalQty") String totalQty,@RequestParam("totalCost") String totalCost,@RequestParam("itemDetails") String itemDetails,@RequestParam("flowUnder") String flowUnder,@RequestParam("qtyFlag") boolean  qtyFlag,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("updateShipmentReceipt");
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String responseStr="";
			RequestBean requestBeanObj = null;
			// log.info(request.getLocale());
			ProcurementReceipt procurementReceipt = procurementServiceObj.updateShipmentReceipt((Locale)request.getSession().getAttribute("currentLocale"),formData, totalQty, totalCost, itemDetails,customerIdStr,emailIdStr,flowUnder,qtyFlag);
			ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
//			List<String> workLocationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerId,emailId);
			modelAndViewObj.addObject("workLocationsList", locationBeanList);
			request.getSession().setAttribute("selectedLocation",procurementReceipt.getLocation());
			modelAndViewObj.addObject("selectedLocation",procurementReceipt.getLocation());
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("startDate",startDate);
			modelAndViewObj.addObject("endDate",endDate);
			/*	modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("startDate",startDate);
			modelAndViewObj.addObject("endDate",endDate);*/
			/*	if (procurementReceipt.getOperation().equals("updated")){
				modelAndViewObj.addObject("procurementReceipt", procurementReceipt);
				if(procurementReceipt.getStatus().equals("draft"))
					modelAndViewObj.setViewName("Procurement/ShipmentReceipts/editShipmentReceipt");
				else
					modelAndViewObj.setViewName("Procurement/ShipmentReceipts/viewShipmentReceipt");
				if(!procurementReceipt.getResult().equals(AppProperties.getAppMessageByProperty("PROCUREMENT_UPDATE_SUCCESS").trim()))
					modelAndViewObj.addObject("err", procurementReceipt.getResult());
				else
					modelAndViewObj.addObject("success", procurementReceipt.getResult());
			}
			else{*/
			
			boolean pomismatch = false;
				if(!procurementReceipt.getResult().equals(AppProperties.getAppMessageByProperty("PROCUREMENT_CREATE_SUCCESS").trim())) {
					modelAndViewObj.addObject("err", procurementReceipt.getResult());
				if(procurementReceipt.getResult().contains("Do you want to close the po")) {
					
					pomismatch = true;
				}
				}
				else {
					modelAndViewObj.addObject("success", AppProperties.getAppMessageByProperty("PROCUREMENT_UPDATE_SUCCESS"));
				}
				
					procurementReceipt = procurementServiceObj.getShipmentReceipt(procurementReceipt.getReceiptNoteId(),customerIdStr, emailIdStr,flowUnder);
					if(procurementReceipt.getGrnObj().getItemsList()!=null)
					procurementReceipt.getGrnObj().setItems(procurementReceipt.getGrnObj().getItemsList());
					
					
					
					if(procurementReceipt.getGrnObj().getItems() != null){
						for(int i = 0;i<procurementReceipt.getGrnObj().getItems().size();i++){
							if(procurementReceipt.getGrnObj().getItems().get(i).getTaxList() != null){
								procurementReceipt.getGrnObj().getItems().get(i).setTaxdetailsStr(gson.toJson(procurementReceipt.getGrnObj().getItems().get(i).getTaxList()));

							}
						}
					}
					
					List<SupplierBean> suppliersList  = outletMasterServiceObj.searchSuppliers(customerIdStr, emailIdStr,procurementReceipt.getGrnObj().getSupplierName(),"0","");

					if(suppliersList != null)
					procurementReceipt.getGrnObj().setSupplier_state(suppliersList.get(0).getState());
					
					if(pomismatch) {
						procurementReceipt.getGrnObj().setQtyFlag(true);
					}
					
					modelAndViewObj.addObject("procurementReceipt",procurementReceipt.getGrnObj());
					modelAndViewObj.setViewName("Procurement/ShipmentReceipts/editShipmentReceipt");
				
			
			modelAndViewObj.addObject("flowUnder",flowUnder);
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	
	@RequestMapping(value="/updateShipmentReceiptGrid",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView updateShipmentReceiptGrid(@RequestBody StockIssues stockissueobj,HttpServletRequest request,HttpServletResponse response) {
		try{
			ProcurementReceipt goodsreceiptnote = null;
				List<String> skuid = stockissueobj.getSkuId();
				List<String> Qty = stockissueobj.getQty();
				List<String> issued = stockissueobj.getIssuedqty();
				if(request.getSession().getAttribute("warehouseGrn")!= null)
				{
					List<ProcurementReceipt>	srlist =(List<ProcurementReceipt>)request.getSession().getAttribute("warehouseGrn");
					for(int i=0;i<srlist.size();i++){
						if(srlist.get(i).getReceiptNoteId().equalsIgnoreCase(stockissueobj.getGoods_issue_ref_num())){
							goodsreceiptnote = srlist.get(i);
							for(int j=0;j<goodsreceiptnote.getItemsList().size();j++){
								for(int k=0;k<skuid.size();k++)
								if(goodsreceiptnote.getItemsList().get(j).getSkuId().equalsIgnoreCase(skuid.get(k))){
									GoodsReceiptsItems items = goodsreceiptnote.getItemsList().get(k);
									items.setSuppliedQty(Float.valueOf(Qty.get(k)));
									items.setSupplyPrice(Float.valueOf(issued.get(k)));
									goodsreceiptnote.getItemsList().set(j, items);
								}
									
									
							}
						}
					}
					
				}
			ProcurementReceipt procurementReceipt = procurementServiceObj.updateShipmentReceiptGrid(goodsreceiptnote);
			
				if(!procurementReceipt.getResult().equals(AppProperties.getAppMessageByProperty("PROCUREMENT_CREATE_SUCCESS").trim()))
					modelAndViewObj.addObject("err", procurementReceipt.getResult());
				else
					modelAndViewObj.addObject("success", AppProperties.getAppMessageByProperty("PROCUREMENT_UPDATE_SUCCESS"));
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	
	//Modified by Surya.k on 27/08/2019
	@RequestMapping("/viewShipmentReturn")
	public ModelAndView viewShipmentReturn(@RequestParam("index") String index,@RequestParam("maxRecords") String maxRecords,
			@RequestParam("location") String location,@RequestParam("flowUnder") String flowUnder,@RequestParam("startDate") String startDate,HttpServletRequest request,HttpServletResponse response) {
		List<String> locationsList = null;
		try{
			// log.info("viewShipmentReturn");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			if(flowUnder.equals("warehouse"))
			locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
			else
//			locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			
			ArrayList<LocationBean> locationBeanList =null;
			
		//	ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);

			if(flowUnder.equals("procurement")){
				 locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","Retail Outlet",false,false,false);
				}else{
					 locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","Warehouse",false,false,false);
				}			
			
			
//			Added by vijay, to make default loaction as location list first occurrence, if location is empty
			/*if((location.trim()).equals(null) || location.trim().isEmpty())
			{
				location = locationsList.get(0);
			}*/
			
			
			
			List<StoreShipmentReturn> storeShipmentReturnList = procurementServiceObj.getShipmentReturns("","",index,customerIdStr,emailIdStr,location,maxRecords,startDate,null,flowUnder,false,"","","","");
			modelAndViewObj = new ModelAndView();
			int start = 1,end = 10;
			if(storeShipmentReturnList == null || storeShipmentReturnList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(storeShipmentReturnList.size()<10){
					end = (storeShipmentReturnList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", (storeShipmentReturnList.get(0).getTotRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
				
				for(int i = 0; i<storeShipmentReturnList.size();i++){
					storeShipmentReturnList.get(i).setNoofItems(storeShipmentReturnList.get(i).getStockReturnItems().size()); 
					storeShipmentReturnList.get(i).setCost(storeShipmentReturnList.get(i).getGoodsVal()+storeShipmentReturnList.get(i).getTaxValue()); 

				}
			}
			modelAndViewObj.addObject("purchaseStockReturnList", storeShipmentReturnList);
			modelAndViewObj.addObject("selectedLocation",location);
			modelAndViewObj.addObject("locationsList", locationBeanList);
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.addObject("startDate", startDate);

			modelAndViewObj.setViewName("Procurement/shipmentReturn/shipmentReturn");
		}catch(Exception e){
		  e.printStackTrace();	
		}
		return modelAndViewObj;
	}
	
	//Modified by Surya.k on 27/08/2019
	@RequestMapping("/searchShipmentReturns")
	public ModelAndView searchShipmentReturns(@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,@RequestParam("maxRecords") String maxRecords,@RequestParam("location") String location,@RequestParam("endDate") String endDate,@RequestParam("startDate") String startDate,@RequestParam("flowUnder") String flowUnder,	@RequestParam("category") String category,@RequestParam("subcategory") String subcategory,@RequestParam("supplier") String supplier,@RequestParam("supplierid") String supplierid, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<String> locationsList=null;
		ArrayList<LocationBean> locationBeanList  = null;
		try{
			// log.info("searchShipmentReturns");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
//			List<String> locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
			if(flowUnder.equals("warehouse")){
				locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
				locationBeanList  = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","Warehouse",false,false,false);


			}else{
//				locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
			   locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			   locationBeanList   = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","Retail Outlet",false,false,false);
			
			
			}

			List<StoreShipmentReturn> purchaseStockReturnList = procurementServiceObj.getShipmentReturns("",searchNameStr,index,customerIdStr,emailIdStr,location,maxRecords,startDate,endDate,flowUnder,false,supplier,supplierid,category,subcategory);
			modelAndViewObj = new ModelAndView();
			int start = 1,end = 10;
			if(purchaseStockReturnList == null || purchaseStockReturnList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(purchaseStockReturnList.size()<10){
					end = (purchaseStockReturnList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", (purchaseStockReturnList.get(0).getTotRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
				
				for(int i = 0; i<purchaseStockReturnList.size();i++){
					purchaseStockReturnList.get(i).setNoofItems(purchaseStockReturnList.get(i).getStockReturnItems().size()); 
					purchaseStockReturnList.get(i).setCost(purchaseStockReturnList.get(i).getGoodsVal()+purchaseStockReturnList.get(i).getTaxValue()); 

				}
			}
			modelAndViewObj.addObject("purchaseStockReturnList", purchaseStockReturnList);
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("selectedLocation",location);
			modelAndViewObj.addObject("locationsList", locationBeanList);
			modelAndViewObj.addObject("endDate",endDate);
			modelAndViewObj.addObject("startDate", startDate);
			modelAndViewObj.addObject("flowUnder",flowUnder);
			modelAndViewObj.addObject("category",category);
			modelAndViewObj.addObject("subcategory",subcategory);
			modelAndViewObj.addObject("supplier",supplier);
			modelAndViewObj.addObject("supplierid",supplierid);
			modelAndViewObj.setViewName("Procurement/shipmentReturn/shipmentReturn");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	@RequestMapping("/newShipmentReturn")
	public ModelAndView newShipmentReturn(@RequestParam("flowUnder") String flowUnder,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		try{
			// log.info("newShipmentReturn");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			ArrayList<LocationBean> locationBeanList =null;
			
			if(flowUnder.equals("procurement")){
				 locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","Retail Outlet",false,false,false);
				}else{
					 locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","Warehouse",false,false,false);
				}
			
			
			ArrayList<LocationBean> locationsListState = genericMasterServiceObj.getLocationDetails(locationBeanList.get(0).getLocationId(),customerIdStr,emailIdStr,"0","",false,false,true);
			
		
			//ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
			String location = (String)request.getSession().getAttribute("selectedLocation");
			
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("location_state", locationsListState.get(0).getState());
			
			modelAndViewObj.addObject("locationBeanList", locationBeanList);
			modelAndViewObj.addObject("type","new");
			modelAndViewObj.addObject("flowUnder", flowUnder);
			modelAndViewObj.setViewName("Procurement/shipmentReturn/newShipmentReturn");
		}catch(Exception e){
		  e.printStackTrace();	
		}
		return modelAndViewObj;
	}
		
	@RequestMapping(value="/createShipmentReturn",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createShipmentReturn(@RequestBody PurchaseStockReturn purchaseStockReturnObj,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("createRequestForQuotation");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			ArrayList<LocationBean> locationBeanList =  null;
			String responseStr = "";
			RequestBean requestBeanObj = null;
			purchaseStockReturnObj.setUserName(emailIdStr);
			purchaseStockReturnObj.setUserRole((String)request.getSession().getAttribute("role"));
			String resultStr = procurementServiceObj.createShipmentReturn(purchaseStockReturnObj,customerIdStr,emailIdStr);
			String type= purchaseStockReturnObj.getType();
			if(purchaseStockReturnObj.getFlowUnder().equals("warehouse")){
				 locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","Warehouse",false,false,false);
				}else{
					 locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","Retail Outlet",false,false,false);
				}
			
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("selectedLocation", purchaseStockReturnObj.getFromLocation());
			modelAndViewObj.addObject("locationBeanList", locationBeanList);
			if(purchaseStockReturnObj.getPurchaseStockReturnRef() == null || purchaseStockReturnObj.getPurchaseStockReturnRef().equals(""))
				modelAndViewObj.addObject("type", "new");
			if(resultStr.equals(AppProperties.getAppMessageByProperty("SHIPMENT_RETURN_CREATE_SUCCESS").trim())){
				modelAndViewObj.addObject("success", resultStr);
			}
			else if(resultStr.equals(AppProperties.getAppMessageByProperty("SHIPMENT_RETURN_UPDATE_SUCCESS").trim())){
				
				List<StoreShipmentReturn>	purchaseStockReturnlist = procurementServiceObj.getShipmentReturns(purchaseStockReturnObj.getPurchaseStockReturnRef(),"","0",customerIdStr,emailIdStr,"","","","","warehouse",false,"","","","");

				if(purchaseStockReturnlist.get(0).getStockReturnItems() != null){
					for(int i = 0;i<purchaseStockReturnlist.get(0).getStockReturnItems().size();i++){
				 responseStr = skuServiceObj.getWarehouseSkuDetails(customerIdStr, emailIdStr,purchaseStockReturnlist.get(0).getStockReturnItems().get(i).getItemId(),purchaseStockReturnlist.get(0).getFromLocation(),"");
				 requestBeanObj = gson.fromJson(responseStr,RequestBean.class);
				
				if(requestBeanObj.getSkuLists().get(0).getTax() != null){
					purchaseStockReturnlist.get(0).getStockReturnItems().get(i).setTaxdetailsStr(gson.toJson(requestBeanObj.getSkuLists().get(0).getTax()));
					}
				
					}
				}
				ArrayList<LocationBean> locationsListState = genericMasterServiceObj.getLocationDetails(purchaseStockReturnlist.get(0).getFromLocation(),customerIdStr,emailIdStr,"0","",false,false,true);
				if(locationsListState != null)
					purchaseStockReturnlist.get(0).setLocation_state(locationsListState.get(0).getState());
			
				
				List<SupplierBean> suppliersList  = outletMasterServiceObj.searchSuppliers(customerIdStr, emailIdStr,purchaseStockReturnlist.get(0).getSupplierDescription(),"0","");

				if(suppliersList != null)
					purchaseStockReturnlist.get(0).setSupplier_state(suppliersList.get(0).getState());
				
				
				modelAndViewObj.addObject("shipmentReturn", purchaseStockReturnlist);
				modelAndViewObj.addObject("success", resultStr);
			}
			else{
				//////System.out.println("ShipmentReturn Error."+gson.toJson(purchaseStockReturnObj));
				if(purchaseStockReturnObj.getStockReturnItems() != null){
					for(int i = 0;i<purchaseStockReturnObj.getStockReturnItems().size();i++){
				responseStr = skuServiceObj.getWarehouseSkuDetails(customerIdStr, emailIdStr,purchaseStockReturnObj.getStockReturnItems().get(i).getItemId(),purchaseStockReturnObj.getFromLocation(),"");
				requestBeanObj = gson.fromJson(responseStr,RequestBean.class);
				
				if(requestBeanObj.getSkuLists().get(0).getTax() != null){
					purchaseStockReturnObj.getStockReturnItems().get(i).setTaxdetailsStr(gson.toJson(requestBeanObj.getSkuLists().get(0).getTax()));
					}
				
					}
				}
				List<SupplierBean> suppliersList  = outletMasterServiceObj.searchSuppliers(customerIdStr, emailIdStr,purchaseStockReturnObj.getSupplierDescription(),"0","");

				if(suppliersList != null)
					purchaseStockReturnObj.setSupplier_state(suppliersList.get(0).getState());
				modelAndViewObj.addObject("shipmentReturn", purchaseStockReturnObj);
				modelAndViewObj.addObject("err", resultStr);
			}
			modelAndViewObj.addObject("flowUnder", purchaseStockReturnObj.getFlowUnder());
			
			if(type.equalsIgnoreCase("edit")) {
				modelAndViewObj.setViewName("Procurement/shipmentReturn/editShipmentReturn");	
			}else {
			modelAndViewObj.setViewName("Procurement/shipmentReturn/newShipmentReturn");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	@RequestMapping("/viewShipmentReturnDetails")
	public ModelAndView viewShipmentReturnDetails(@RequestParam("purchaseStockReturnRef") String purchaseStockReturnRef,@RequestParam("operation") String operation,@RequestParam("flowUnder") String flowUnder,
			@RequestParam("formData") String formData,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("viewWarehouseStockReturn");
			RequestBean requestBeanObj = null;
			String customerIdStr= (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
			//PurchaseStockReturn purchaseStockReturnObj = procurementServiceObj.getShipmentReturnDetails(purchaseStockReturnRef,customerIdStr,emailIdStr);
			List<StoreShipmentReturn> purchaseStockReturnObj = procurementServiceObj.getShipmentReturns(purchaseStockReturnRef,"","0",customerIdStr,emailIdStr,"","","","",flowUnder,false,"","","","");

			if(purchaseStockReturnObj.get(0).getStockReturnItems() != null){
				for(int i = 0;i<purchaseStockReturnObj.get(0).getStockReturnItems().size();i++){
			String responseStr = skuServiceObj.getWarehouseSkuDetails(customerIdStr, emailIdStr,purchaseStockReturnObj.get(0).getStockReturnItems().get(i).getItemId(),purchaseStockReturnObj.get(0).getFromLocation(),"");
			requestBeanObj = gson.fromJson(responseStr,RequestBean.class);
			
			if(requestBeanObj.getSkuLists().get(0).getTax() != null){
				purchaseStockReturnObj.get(0).getStockReturnItems().get(i).setTaxdetailsStr(gson.toJson(requestBeanObj.getSkuLists().get(0).getTax()));
				}
			}
			}
			
			ArrayList<LocationBean> locationsListState = genericMasterServiceObj.getLocationDetails(purchaseStockReturnObj.get(0).getFromLocation(),customerIdStr,emailIdStr,"0","",false,false,true);
			if(locationsListState != null)
			purchaseStockReturnObj.get(0).setLocation_state(locationsListState.get(0).getState());
		
			
			List<SupplierBean> suppliersList  = outletMasterServiceObj.searchSuppliers(customerIdStr, emailIdStr,purchaseStockReturnObj.get(0).getSupplierDescription(),"0","");

			if(suppliersList != null)
				purchaseStockReturnObj.get(0).setSupplier_state(suppliersList.get(0).getState());
			
			modelAndViewObj = new ModelAndView();
			//modelAndViewObj.addObject("selectedLocation", purchaseStockReturnObj.getFromLocation());
			modelAndViewObj.addObject("locationBeanList", locationBeanList);
			//System.out.println(gson.toJson(purchaseStockReturnObj));
			modelAndViewObj.addObject("shipmentReturn", purchaseStockReturnObj);
			modelAndViewObj.addObject("flowUnder", flowUnder);
			
			//added by manasa 
			PurchaseStockReturn skuObj=gson.fromJson(formData, PurchaseStockReturn.class);
			modelAndViewObj.addObject("skuObj",skuObj);
			
			if(operation.equals("edit")){
				modelAndViewObj.addObject("type","edit");
				modelAndViewObj.setViewName("Procurement/shipmentReturn/editShipmentReturn");
			}else
				modelAndViewObj.setViewName("Procurement/shipmentReturn/viewShipmentReturn");
		}catch(Exception e){
		  e.printStackTrace();	
		}
		return modelAndViewObj;
	}
	/**
	 * 
	 * @author chaithanya.v
	 * Created On: 2-nov-2015
	 * 
	 *This method is used to display the PO Summary
	 *
	 **/
	@RequestMapping("/getPoSummary")
	public ModelAndView getPoSummary(@RequestParam("flowUnder") String flowUnder,@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,@RequestParam("itemwise") String itemwise,@RequestParam("supplier") String supplier,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewStockRequestDetails");
			modelAndViewObj = new ModelAndView();
			StockRequestSummaryResponse stockRequestsList = procurementServiceObj.getPoSummary(flowUnder,startDate,endDate,itemwise,supplier);
			/*modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("warehouseList", warehouseLocationsList);*/
			modelAndViewObj.addObject("stockRequestsList", stockRequestsList);
			modelAndViewObj.setViewName("Procurement/PurchaseOrder/PoSummary");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		modelAndViewObj.addObject("flowUnder",flowUnder);
		return modelAndViewObj;
	}
	/* @author chaithanya.v
	 * Created On: 2-nov-2015
	 * 
	 *This method is used to display the newStockRequest form
	 *
	 **/
	@RequestMapping("/dispatchPo")
	public ModelAndView dispatchPo(@RequestParam("ids") String ids,@RequestParam("flag") Boolean flag,@RequestParam("flowUnder") String flowUnder,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("dispatchPo");
			modelAndViewObj = new ModelAndView();
			StockRequestSummaryResponse stockRequestsList = procurementServiceObj.dispatchPo(flowUnder,ids,flag);
			/*modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("warehouseList", warehouseLocationsList);*/
			modelAndViewObj.addObject("stockRequestsList", stockRequestsList);
			modelAndViewObj.setViewName("Procurement/ShipmentReceipts/goodsReceiptSummary");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		modelAndViewObj.addObject("flowUnder","warehouse");
		return modelAndViewObj;
	}
	/* @author chaithanya.v
	 * Created On: 2-nov-2015
	 * 
	 *This method is used to display the newStockRequest form
	 *
	 **/
	@RequestMapping("/createGrn")
	public ModelAndView createGrn(@RequestParam("flowUnder") String flowUnder,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("dispatchPo");
			modelAndViewObj = new ModelAndView();
			StockRequestSummaryResponse stockRequestsList = procurementServiceObj.createGrn(flowUnder);
			/*modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("warehouseList", warehouseLocationsList);*/
			modelAndViewObj.addObject("stockRequestsList", stockRequestsList);
			modelAndViewObj.setViewName("Procurement/ShipmentReceipts/goodsReceiptSummary");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		modelAndViewObj.addObject("flowUnder","warehouse");
		return modelAndViewObj;
	}
	
	
	
	
	
	/**
	 * 
	 * @author chaithanya.v
	 * Created On: 2-nov-2015
	 * 
	 *This method is used to display the newStockRequest form
	 *
	 **/
	@RequestMapping("/getgoodsReceiptSummary")
	public ModelAndView getgoodsReceiptSummary(@RequestParam("flowUnder") String flowUnder,@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,@RequestParam("itemwise") String itemwise,@RequestParam("supplier") String supplier,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewStockRequestDetails");
			modelAndViewObj = new ModelAndView();
			StockRequestSummaryResponse stockRequestsList = procurementServiceObj.getgoodsReceiptSummary(flowUnder,startDate,endDate,itemwise,supplier);
			/*modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("warehouseList", warehouseLocationsList);*/
			modelAndViewObj.addObject("stockRequestsList", stockRequestsList);
			modelAndViewObj.setViewName("Procurement/ShipmentReceipts/goodsReceiptSummary");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		modelAndViewObj.addObject("flowUnder",flowUnder);
		return modelAndViewObj;
	}
	
	@RequestMapping("/viewQuotation")
	public ModelAndView viewQuotation(@RequestParam("index") String index,@RequestParam("maxRecords") String maxRecords,@RequestParam("location") String location,
			HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<String> locationsList=null;
		try{
			// log.info("viewrQuotation");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
			
//			Added by vijay, to make default loaction as location list first occurrence, if location is empty
			if((location.trim()).equals(null) || location.trim().isEmpty())
			{
				location = locationsList.get(0);
			}
			
			
			
			List<SupplierQuotations> quotesList=procurementServiceObj.getSupplierQuotation("",index,customerIdStr,emailIdStr,"",maxRecords,null,null);
			modelAndViewObj = new ModelAndView();
			int start = 1,end = Integer.parseInt(maxRecords);
			if(quotesList == null || quotesList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(quotesList.size()<Integer.parseInt(maxRecords)){
					end = (quotesList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(quotesList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("quotesList", quotesList);
			modelAndViewObj.addObject("selectedLocation",location);
			modelAndViewObj.addObject("maxRecords",Integer.parseInt(maxRecords));
		
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.setViewName("Procurement/Quotation/quotation");
		}catch(Exception e){
		  e.printStackTrace();	
		}
		return modelAndViewObj;
	}

	@RequestMapping("/newQuotation")
	public ModelAndView newQuotation(HttpServletRequest request,HttpServletResponse response) {
		
		String customerIdStr = null,emailIdStr=null;
		try{
			// log.info("newQuotation");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			//List<String> locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
			ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
			//ArrayList<SupplierBean> locationBeanList = genericMasterServiceObj.geSupplierDetails(customerIdStr,emailIdStr,null);

			List<Suppliers> supplierList = outletMasterServiceObj.getSuppliers(customerIdStr, emailIdStr,"-1","","");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("workLocationsList", locationBeanList);
			modelAndViewObj.addObject("quoteSuppliers","");
			
			modelAndViewObj.addObject("supplierList", supplierList);
			//modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("type", "new");
			modelAndViewObj.setViewName("Procurement/Quotation/newQuotation");
		}catch(Exception e){
		  e.printStackTrace();	
		}
		return modelAndViewObj;
	}
	
	
	
	@RequestMapping(value="/createSupplierQuotation",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createSupplierQuotation(@RequestBody SupplierQuotations quotationObj,HttpServletRequest request,HttpServletResponse response) {
		try{
			
			// log.info("createQuotation");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			quotationObj.setUserName(emailIdStr);
			quotationObj.setRoleName((String)request.getSession().getAttribute("role"));
			String resultStr = procurementServiceObj.createSupplierQuotation(quotationObj,customerIdStr,emailIdStr);
			modelAndViewObj = new ModelAndView();
			List<String> locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
			ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
			//List<Suppliers> supplierList = outletMasterServiceObj.getSuppliers(customerIdStr, emailIdStr,"-1");
			//String suppliersStr = "";
			modelAndViewObj.addObject("workLocationsList", locationBeanList);
			//modelAndViewObj.addObject("supplierList", supplierList);
		   modelAndViewObj.addObject("locationsList", locationsList);
			if(quotationObj.getQuoteRef() == null || quotationObj.getQuoteRef().equals(""))
				modelAndViewObj.addObject("type", "new");
			if(resultStr.equals(AppProperties.getAppMessageByProperty("SUPPLIER_QUOTE_CREATE_SUCCESS").trim())){
			
				List<String> selectedLocationsList = new ArrayList<String>();
				if(quotationObj.getSuplierShipmentLocation() != null && quotationObj.getSuplierShipmentLocation().size() > 0)
					for(SupplierShipmentLocation purchaseOrderShipmentLocation : quotationObj.getSuplierShipmentLocation()){
						if(!selectedLocationsList.contains(purchaseOrderShipmentLocation.getShipmentLocation()))
							selectedLocationsList.add(purchaseOrderShipmentLocation.getShipmentLocation());
					}
				List<LocationBean> locationDetails = new ArrayList<LocationBean>();
				List<LocationBean> selectedLocationDetails = new ArrayList<LocationBean>();
				for(String locationId : selectedLocationsList){
					locationDetails = genericMasterServiceObj.getLocationDetails(locationId,customerIdStr, emailIdStr,"0","",false,true,true);
					if(locationDetails != null && locationDetails.size() > 0)
						selectedLocationDetails.add(locationDetails.get(0));
				}
				quotationObj.setSelectedLocationList(selectedLocationDetails);
				
				modelAndViewObj.addObject("quoteSuppliers","");
				modelAndViewObj.addObject("success", resultStr);
				modelAndViewObj.setViewName("Procurement/Quotation/newQuotation");
				
			}
			else if(resultStr.equals(AppProperties.getAppMessageByProperty("SUPPLIER_QUOTE_UPDATE_SUCCESS").trim())){
				SupplierQuotations quoteObj=procurementServiceObj.getSupplierQuotationDetails("0", customerIdStr, emailIdStr,quotationObj.getQuoteRef());
				
				modelAndViewObj.addObject("quoteObj", quoteObj);
				modelAndViewObj.addObject("success", resultStr);
			}
			else{
				if(quotationObj.getSuppliersList() != null && quotationObj.getSuppliersList().size()>0){
					for(int i=0;i<quotationObj.getSuppliersList().size();i++){
					//	suppliersStr=suppliersStr+quotationObj.getSuppliersList().get(i).getSupplierId()+",";
					}
				}
				modelAndViewObj.addObject("quoteObj", quotationObj);
				modelAndViewObj.addObject("err", resultStr);
			}
			//modelAndViewObj.addObject("quoteSuppliers",suppliersStr);
			modelAndViewObj.setViewName("Procurement/Quotation/newQuotation");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
		
	
	@RequestMapping("/searchSupplierQuotation")
	public ModelAndView searchSupplierQuotation(@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,@RequestParam("maxRecords") String maxRecords,@RequestParam("location") String location,@RequestParam("endDate") String endDate,@RequestParam("startDate") String startDate, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<SupplierQuotations> quotesList = null;
		try{
			// log.info("searchSupplierQuotation");
			int start = 1,end = 10;
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<String> locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
			quotesList=procurementServiceObj.getSupplierQuotation(searchNameStr,index,customerIdStr,emailIdStr,location,maxRecords,startDate,endDate);
			modelAndViewObj = new ModelAndView();
			if(quotesList == null || quotesList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(quotesList.size()<10){
					end = (quotesList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(quotesList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("selectedLocation",location);
			modelAndViewObj.addObject("quotesList",quotesList);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("endDate",endDate);
			modelAndViewObj.addObject("startDate", startDate);
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.setViewName("Procurement/Quotation/quotation");
			////////System.out.println("totalValue"+end);
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	
	@RequestMapping("/viewSupplierQuotationDetails")
	public ModelAndView viewSupplierQuotationDetails(@RequestParam("rfqId") String rfqIdStr,@RequestParam("operation") String operation,@RequestParam("formData") String formData,HttpServletRequest request,HttpServletResponse response) {
		
		String customerIdStr = null,emailIdStr=null;
		List<String> locationsList=null;
		String suppliersStr="";
		try{
			// log.info("viewRequestForQuotationDetails");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
			ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
			List<Suppliers> supplierList = outletMasterServiceObj.getSuppliers(customerIdStr, emailIdStr,"-1","","");
			SupplierQuotations quoteObj=procurementServiceObj.getSupplierQuotationDetails("0", customerIdStr, emailIdStr,rfqIdStr);
			
			if(quoteObj != null && quoteObj.getSuppliersList() != null && quoteObj.getSuppliersList().size()>0){
				for(int i=0;i<quoteObj.getSuppliersList().size();i++){
					suppliersStr=suppliersStr+quoteObj.getSuppliersList().get(i).getSupplierId()+",";
				}
			}
			modelAndViewObj = new ModelAndView();
			
			//added by manasa
			RequestBean stockIssueObj=gson.fromJson(formData, RequestBean.class);
			modelAndViewObj.addObject("quotObj",stockIssueObj);
			
			modelAndViewObj.addObject("quoteObj", quoteObj);
			modelAndViewObj.addObject("workLocationsList", locationBeanList);
			modelAndViewObj.addObject("quoteSuppliers",suppliersStr);
		    modelAndViewObj.addObject("shipmentLocationsList", quoteObj.getSelectedLocationList());
			modelAndViewObj.addObject("supplierList", supplierList);
			modelAndViewObj.addObject("locationsList", locationsList);
			if(operation.equals("view"))
				modelAndViewObj.setViewName("Procurement/Quotation/viewQuotation");
			else
				modelAndViewObj.setViewName("Procurement/Quotation/newQuotation");
		}catch(Exception e){
		  e.printStackTrace();	
		}
		return modelAndViewObj;
	}
	
	
	@RequestMapping("/getSupplierDetails")
	public ModelAndView getSupplierDetails(@RequestParam("firmName") String firmName, HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("getSupplierDetails");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			SupplierBean supplierBeanObj = outletMasterServiceObj.getSupplierByFirmName(customerIdStr, emailIdStr,firmName);
			List<String> currenciesList = adminServiceObj.getCurrenciesList(customerIdStr, emailIdStr);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("currencyList",currenciesList);
			modelAndViewObj.addObject("supplierBean", supplierBeanObj.getSupplierMaster());
			
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	
@RequestMapping(value="/addQuoteItemsToSupplierQuotation",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView addQuoteItemsToSupplierQuotation(@RequestBody SupplierQuotations supplierQuotations,HttpServletRequest request,HttpServletResponse response){
	try{
//		List<SupplierShipmentLocation> supplierShipmentLocation=new ArrayList<SupplierShipmentLocation>();
		// log.info("addQuoteItemsToPurchaseOrder");
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		modelAndViewObj = new ModelAndView();
		supplierQuotations = procurementServiceObj.addQuoteItemsToSupplierQuotation(supplierQuotations,customerIdStr,emailIdStr);
		//request.getSession().setAttribute("selectedLocation",purchaseOrderDetails.getStoreLocation());
		ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
		//List<String> workLocationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr,emailIdStr,false);
		List<Suppliers> supplierList = outletMasterServiceObj.getSuppliers(customerIdStr, emailIdStr,"-1","","");

		modelAndViewObj.addObject("quoteObj", supplierQuotations);
		//modelAndViewObj.addObject("locationBeanList", locationBeanList);
		modelAndViewObj.addObject("workLocationsList", locationBeanList);
		modelAndViewObj.addObject("supplierList", supplierList);
	
		if((supplierQuotations.getQuoteRef() == null || supplierQuotations.getQuoteRef().equals("")) && (supplierQuotations.getQuoteRef() == null || supplierQuotations.getQuoteRef().equals("")))
		{
			modelAndViewObj.addObject("type","new");
		modelAndViewObj.setViewName("Procurement/Quotation/newQuotation");
		}
		else
		modelAndViewObj.addObject("type","new");
		modelAndViewObj.setViewName("Procurement/Quotation/newQuotation");
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}
	
	
	
@RequestMapping("/printShipmentReturnDetails")
public void printShipmentReturnDetails(@RequestParam("PO_Ref") String PO_Ref,@RequestParam("flowUnder") String flowUnder,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("printPurchaseOrderDetails");
		////////System.out.println("printPurchaseOrderDetails");
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		 //String result = procurementServiceObj.printShipmentReturnDetails(PO_Ref,customerIdStr, emailIdStr);
		List<StoreShipmentReturn> storeShipmentReturnList = procurementServiceObj.getShipmentReturns(PO_Ref,"","0",customerIdStr,emailIdStr,"","10",null,null,flowUnder,true,"","","","");

		// //System.out.println(gson.toJson(storeShipmentReturnList));
				
		  
		  String jsonString = null;
		  if(storeShipmentReturnList.get(0).getPrintURL() != null){
		if(storeShipmentReturnList.get(0).getPrintURL().contains("pdf"))
			jsonString = storeShipmentReturnList.get(0).getPrintURL();
		else 
			jsonString = " Sorry please try after some time";
		  }else{
			jsonString = " Sorry please try after some time"; 
		  }
		response.setContentType("application/text");
		response.setCharacterEncoding("UTF-8");
	response.getWriter().write(jsonString);
}catch(Exception e){
	e.printStackTrace();
}finally {
	try {
		response.getWriter().close();
	} catch (IOException e) {
		e.printStackTrace();
	}

}
}




@RequestMapping(value="/importExcelDataGRN",method=RequestMethod.POST)
public @ResponseBody List<WareHouseSku>  importExcelDataGRN(@RequestParam("file") MultipartFile excelFile,@RequestParam("supplierCode") String supplierCode,@RequestParam("warehouseLocation") String warehouseLocation,@RequestParam("flowunder") String flowunder,HttpServletRequest request,HttpServletResponse response) {
	List<WareHouseSku> skuList =null;

	try{
		skuList = new ArrayList<WareHouseSku>();
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		
	
		skuList = procurementServiceObj.ExcelfileDataGRN(customerId, emailId, excelFile,supplierCode,warehouseLocation,flowunder);
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	return skuList;
}



@RequestMapping(value="/importExcelDataGRNOutlet",method=RequestMethod.POST)
public @ResponseBody List<Sku>  importExcelDataGRNOutlet(@RequestParam("file") MultipartFile excelFile,@RequestParam("supplierCode") String supplierCode,@RequestParam("warehouseLocation") String warehouseLocation,@RequestParam("flowunder") String flowunder,HttpServletRequest request,HttpServletResponse response) {
	List<Sku> skuList =null;
	try{
		skuList = new ArrayList<Sku>();
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		
		skuList = procurementServiceObj.ExcelfileDataGRNs(customerId, emailId, excelFile,supplierCode,warehouseLocation,flowunder);
		////System.out.println("SKU list ::"+gson.toJson(skuList));
		
	}catch(Exception e){
		e.printStackTrace();
	}
	return skuList;
}





@RequestMapping(value="/importExcelDataforGRNupdate",method=RequestMethod.POST)
public @ResponseBody List<SkuPriceList>  importExcelDataforGRNupdate(@RequestParam("file") MultipartFile excelFile,@RequestParam("supplierCode") String supplierCode,@RequestParam("warehouseLocation") String warehouseLocation,HttpServletRequest request,HttpServletResponse response) {
	List <SkuPriceList> skuList =null;
	SupplierProducts headerList = null;
	SkuPriceList skuListobj =new SkuPriceList();
	try{
		skuList = new ArrayList<SkuPriceList>();
		headerList = new SupplierProducts();
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		
		headerList = procurementServiceObj.ExcelDataforGRNupdate(customerId, emailId, excelFile,supplierCode,warehouseLocation);
		
		if(headerList.getResponseHeader().getResponseCode().equalsIgnoreCase("0")){
		Utilities utilities = new Utilities();
		skuList = utilities.getExcelDataforGRNupdate(excelFile,headerList.getHeaderPositionsList());
		//System.out.println(skuList);
		}else {
			
	    skuList.add(skuListobj)	;	
			
		skuList.get(0).setResponnseMessage(headerList.getResponseHeader().getResponseMessage());
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}
	return skuList;
}





//koti Bommineni




@RequestMapping(value="/updateShipmentReceiptforPocomparision",method=RequestMethod.POST)
public void updateShipmentReceiptforPocomparision(@RequestParam("endDate") String endDate,@RequestParam("startDate") String startDate,@RequestParam("maxRecords") String maxRecords,@RequestParam("formData") String formData,@RequestParam("totalQty") String totalQty,@RequestParam("totalCost") String totalCost,@RequestParam("itemDetails") String itemDetails,@RequestParam("flowUnder") String flowUnder,@RequestParam("qtyFlag") boolean  qtyFlag,HttpServletRequest request,HttpServletResponse response) {
	try{
		modelAndViewObj = new ModelAndView();
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		String responseStr="";
		RequestBean requestBeanObj = null;
		ProcurementReceipt procurementReceipt = procurementServiceObj.updateShipmentReceipt((Locale)request.getSession().getAttribute("currentLocale"),formData, totalQty, totalCost, itemDetails,customerIdStr,emailIdStr,flowUnder,qtyFlag);
		String jsonString = null;
		if(procurementReceipt.getResult().contains("Do you want to close the po")) {
			jsonString = procurementReceipt.getResult();
	     	}else {
			jsonString = "PO data Matches with GRN,click OK to continue";
		     }
    response.setContentType("application/text");
	response.setCharacterEncoding("UTF-8");
	response.getWriter().write(jsonString);
}catch(Exception e){
	e.printStackTrace();
}finally {
	try {
		response.getWriter().close();
	} catch (IOException e) {
		e.printStackTrace();
	}

}
}

	
	

}
