package com.tlabs.posweb.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.tlabs.posweb.beans.Department;
import com.tlabs.posweb.beans.GoodsReceiptsItems;
import com.tlabs.posweb.beans.LocationBean;
//import com.tlabs.posweb.beans.InvoiceBean;
//import com.tlabs.posweb.beans.LocationBean;
import com.tlabs.posweb.beans.ProcurementReceipt;
import com.tlabs.posweb.beans.ProductCategoryBean;
import com.tlabs.posweb.beans.ProductSubCategoryBean;
import com.tlabs.posweb.beans.PurchaseOrderBean;
import com.tlabs.posweb.beans.PurchaseOrderItems;
import com.tlabs.posweb.beans.SupplierBean;
import com.tlabs.posweb.beans.Suppliers;
import com.tlabs.posweb.beans.WHInvoice;
//import com.tlabs.posweb.beans.WHInvoiceItems;
import com.tlabs.posweb.init.AppProperties;
import com.tlabs.posweb.services.AdminService;
import com.tlabs.posweb.services.DepartmentService;
import com.tlabs.posweb.services.OutletMasterService;
import com.tlabs.posweb.services.ProcurementService;
//import com.tlabs.posweb.services.ReportsService;
import com.tlabs.posweb.services.WarehouseService;
//import com.tlabs.posweb.util.Constants;
import com.tlabs.posweb.util.Response;

@Controller
@RequestMapping(value = "/whInvoice")
public class WHInvoiceController {
	ModelAndView modelAndViewObj;
   // private static Logger log = Logger.getLogger(InventoryManagerController.class);

	 @Autowired
	 private WarehouseService warehouseServiceObj;
	 @Autowired
	 private AdminService adminServiceObj;
	 @Autowired
	 private ProcurementService procurementServiceObj;
	 @Autowired
		private OutletMasterService outletMasterServiceObj;
	 @Autowired
	    private DepartmentService departmentServiceObj;
	 /**
		 * @author vijay
		 * @Verified By :
		 * @param index,flowunder,max Records with standard filters
		 * @Description: This method is used to view list of invoices under WareHouse Shipments
		 * @Created On:4-dec-2017
	     * @return ModelAndView 
	    */
	 @RequestMapping("/viewInvoice")
	 public ModelAndView viewInvoice(
			@RequestParam("flowUnder") String flowUnder,
			@RequestParam("maxRecords") String maxRecords,
			@RequestParam("index") String index,
			@RequestParam("subDepartment") String subDepartment,
			@RequestParam("location") String location,
			@RequestParam("zone") String zone,
			@RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate,
			@RequestParam("category") String category,
			@RequestParam("subCategory") String subCategory,
			@RequestParam("department") String department,
			@RequestParam("searchName") String searchName,
			@RequestParam("section") String section,
			@RequestParam("brand") String brand,
			HttpServletRequest request,HttpServletResponse response)
	 		{
		 List<String> locationsList=null;
			WHInvoice invoiceList = null;
			try {
					invoiceList = new WHInvoice();
					// log.info("view-ShipmentInvoice-List");
					String customerIdStr = (String) request.getSession().getAttribute("customerId");
					String emailIdStr = (String) request.getSession().getAttribute("emailId");
					modelAndViewObj = new ModelAndView();
					int start = 1, end = Integer.parseInt(maxRecords);
					locationsList  = adminServiceObj.getWarehouseLocationsList(customerIdStr,emailIdStr,true);
					if(location.isEmpty()||location.equals(""))
						location=locationsList.get(0);

					
					invoiceList = warehouseServiceObj.getWarehouseInvoices(index, maxRecords, customerIdStr, emailIdStr,category,subCategory,brand,location,department,subDepartment,startDate,endDate,searchName,section);
				
					
					List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
					if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
						categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
						request.getSession().setAttribute("categoryList", categoryList);
					}
					List<ProductSubCategoryBean> subCategoryDetailsList =(List<ProductSubCategoryBean>)request.getSession().getAttribute("subCategoryDetailsList");
					if(subCategoryDetailsList==null || subCategoryDetailsList.size()==0 || subCategoryDetailsList.isEmpty()){
						subCategoryDetailsList = outletMasterServiceObj.getSubCategoryDetails("",customerIdStr, emailIdStr,"-1",false);
						request.getSession().setAttribute("subCategoryDetailsList", subCategoryDetailsList);
					}
					List<String> brandsList =(List<String>)request.getSession().getAttribute("brandsList");
					if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
						brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
						request.getSession().setAttribute("brandsList", brandsList);
					}
					
					List<Department> departmentList =(List<Department>)request.getSession().getAttribute("departmentList");
					if(departmentList==null || departmentList.size()==0 || departmentList.isEmpty()){
						departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerIdStr, emailIdStr,index,false);
						request.getSession().setAttribute("departmentList", departmentList);
					}
					
					List<Suppliers> supplierList =(List<Suppliers>)request.getSession().getAttribute("supplierList");
					if(supplierList==null || supplierList.size()==0 || supplierList.isEmpty()){
						 supplierList = outletMasterServiceObj.getSuppliers(customerIdStr, emailIdStr,"-1","","");
						request.getSession().setAttribute("supplierList", supplierList);
					}
				modelAndViewObj.addObject("locations", locationsList);
					if (invoiceList == null || invoiceList.getTotalRecords() <= 0) 
					{
						modelAndViewObj.addObject("totalRecords", "0");
						modelAndViewObj.addObject("index", "0");
						modelAndViewObj.addObject("totalValue", "0");
					} 
					
					else{
						if (invoiceList.getWhInvoiceList().size() < Integer.parseInt(maxRecords)) 
						{
							end = (invoiceList.getWhInvoiceList().size()) + (Integer.parseInt(index));
						} 
						else 
						{
							end = (Integer.parseInt(index) + end);
						}
						
						modelAndViewObj.addObject("totalRecords",invoiceList.getTotalRecords());
						modelAndViewObj.addObject("index", (Integer.parseInt(index) + start));
						modelAndViewObj.addObject("totalValue", end);
						
//						//////////System.out.println(maxRecords+" "+  (Integer.parseInt(index) + start) + " "+invoiceList.getTotalRecords());
					}
					modelAndViewObj.addObject("brandsList", brandsList);
					modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
					modelAndViewObj.addObject("selectedLocation", location);
					modelAndViewObj.addObject("shipmentBeanList", invoiceList.getWhInvoiceList());
					modelAndViewObj.addObject("outletlocationsList", locationsList);
					modelAndViewObj.addObject("category", category);
					modelAndViewObj.addObject("subcategory", subCategory);
					modelAndViewObj.addObject("brand", brand);
					modelAndViewObj.addObject("department", department);
					modelAndViewObj.addObject("subDepartment", subDepartment);
					modelAndViewObj.addObject("department", department);
					modelAndViewObj.addObject("startdate", startDate);
					modelAndViewObj.addObject("searchName", searchName);
					modelAndViewObj.addObject("suppliername", section);
					modelAndViewObj.addObject("enddate", endDate);
					modelAndViewObj.addObject("flowUnder", flowUnder);
					modelAndViewObj.setViewName("Warehouse Management/Stocks Management/Shipments/viewInvoices");
				} 
				catch (Exception e) 
				{
					e.printStackTrace();
				}
			return modelAndViewObj;
	 		}
	 
	 /**
		 * @author vijay
		 * @Verified By :
		 * @param view type and flow's under
		 * @Description: This method is used to view new invoices page for creation of invoice under WareHouse Shipments
		 * @Created On:4-dec-2017
	     * @returns ModelAndView 
	    */
	 @RequestMapping("/viewNewInvoiceShipments")
	 public ModelAndView viewNewInvoiceDetails(HttpServletRequest request,HttpServletResponse response,@RequestParam("type") String type,@RequestParam("flowUnder") String flowUnder)
	 
	 {
		 try {
				List<String> locationsList = new ArrayList<String>();
				List<String> outletLocationsList = new ArrayList<String>();
				String customerIdStr = (String) request.getSession().getAttribute("customerId");
				String emailIdStr = (String) request.getSession().getAttribute("emailId");
				// log.info("new - warehouse - shipments - NewInvoice");
				locationsList = adminServiceObj.getWarehouseLocationsList("1", emailIdStr,true);
				outletLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
				modelAndViewObj.addObject("invoiceloc", locationsList);
				modelAndViewObj.addObject("outletLocations", outletLocationsList);
				modelAndViewObj.addObject("selected",locationsList.get(0));
				modelAndViewObj.addObject("type",type);
				modelAndViewObj.addObject("flowUnder",flowUnder);
				modelAndViewObj.setViewName("Warehouse Management/Stocks Management/Shipments/newInvoicing");
			} catch (Exception e) {
				e.printStackTrace();
			}
			return modelAndViewObj;
		}
		 
	 /**
		 * @author vijay
		 * @Verified By :
		 * @param : WHInvoice bean class object 
		 * @Description: This method is used to create the new invoice under warehouse shipments
		 * @Created On:4-dec-2017
	     * @returns ModelAndView 
	    */
	 @RequestMapping(value="/createInvoice",method=RequestMethod.POST,consumes="application/json")
	 public ModelAndView createInvoice(@RequestBody WHInvoice formData ,HttpServletRequest request,HttpServletResponse response)
	 
	 {
		 try {
			 	// log.info("new - warehouse - shipments - Invoice");
			 	String responseStr;
				List<String> locationsList = new ArrayList<String>();
				List<String> outletLocationsList = new ArrayList<String>();
				String customerIdStr = (String) request.getSession().getAttribute("customerId");
				String emailIdStr = (String) request.getSession().getAttribute("emailId");
				responseStr = warehouseServiceObj.createWarehouseShipmentInvoice(formData, customerIdStr, emailIdStr);
				//locationsList = warehouseServiceObj.getLocationDetails("", customerIdStr, emailIdStr, "-1", "", false,false, true);
				locationsList = adminServiceObj.getWarehouseLocationsList("1", emailIdStr,true);
				outletLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
				modelAndViewObj = new ModelAndView();
				if(responseStr.equals(AppProperties.getAppMessageByProperty("INVOICE_CREATED_SUCCESS").trim()))
				{
					responseStr = AppProperties.getAppMessageByProperty("INVOICE_CREATED_SUCCESS").trim();
					modelAndViewObj.addObject("success",responseStr);
				}	
				else
				{
					responseStr = Response.getResponseMessage(responseStr);
					modelAndViewObj.addObject("err",responseStr);
				}
				modelAndViewObj.addObject("outletLocations", outletLocationsList);
				modelAndViewObj.addObject("invoiceloc", locationsList);
				modelAndViewObj.setViewName("Warehouse Management/Stocks Management/Shipments/newInvoicing");
			} catch (Exception e) {
				e.printStackTrace();
			}
			return modelAndViewObj;
		}
		 
	 
	 
	
	 /**
		 * @author vijay
		 * @Verified By :
		 * @param : invoice_id and type of page
		 * @Description: This method is used to edit the existing invoice under warehouse shipments
		 * @Created On:6-dec-2017
	     * @returns ModelAndView 
	    */
	 
	 @RequestMapping("/editViewInvoiceDetails")
	 public ModelAndView editViewInvoiceDetails(HttpServletRequest request,HttpServletResponse response,@RequestParam("invoiceId") String invoiceId,@RequestParam("type") String type)
	 
	 {
		 try {
				List<String> locationsList = new ArrayList<String>();
				List<String> outletLocationsList = new ArrayList<String>();
				// log.info("new - warehouse - shipments - Invoice");
				String customerIdStr = (String) request.getSession().getAttribute("customerId");
				String emailIdStr = (String) request.getSession().getAttribute("emailId");

				WHInvoice invoiceList = warehouseServiceObj.getWarehouseInvoice("", "",invoiceId ,customerIdStr, emailIdStr);
				
//				//////////System.out.println("invoiceList"+invoiceList.size());

				locationsList = adminServiceObj.getWarehouseLocationsList("1", emailIdStr,true);
				outletLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);

				if(invoiceList.getWhInvoiceList() != null) {
					
					
					if(invoiceList.getWhInvoiceList().get(0).getWhInvoiceItemsList() != null){
						for(int i = 0;i<invoiceList.getWhInvoiceList().get(0).getWhInvoiceItemsList().size();i++){
							if(invoiceList.getWhInvoiceList().get(0).getWhInvoiceItemsList().get(i).getTaxList() != null){
								invoiceList.getWhInvoiceList().get(0).getWhInvoiceItemsList().get(i).setTaxdetailsStr(new Gson().toJson(invoiceList.getWhInvoiceList().get(0).getWhInvoiceItemsList().get(i).getTaxList()));

							}
						}
					}
					
					
					
					modelAndViewObj.addObject("itemLists",invoiceList.getWhInvoiceList().get(0));
				
				}
				
				modelAndViewObj.addObject("invoiceList", invoiceList);
				////modelAndViewObj.addObject("invoiceList",invoiceList);
				modelAndViewObj.addObject("invoiceloc", locationsList);
				modelAndViewObj.addObject("nextWorkflowList", invoiceList.getNextWorkFlows());
				modelAndViewObj.addObject("outletLocations", outletLocationsList);
			
				modelAndViewObj.addObject("type",type);
				if(type.equals("view"))
					modelAndViewObj.setViewName("Warehouse Management/Stocks Management/Shipments/viewInvoicingDetails");
				else
				modelAndViewObj.setViewName("Warehouse Management/Stocks Management/Shipments/editInvoicing");
			} catch (Exception e) {
				e.printStackTrace();
			}
			return modelAndViewObj;
		}
		 
	 
	 
	 /**
		 * @author vijay
		 * @Verified By :
		 * @param : invoice_id and type of page
		 * @Description: This method is used to edit the update invoice under warehouse shipments
		 * @Created On:7-dec-2017
	     * @returns ModelAndView 
	    */
	 
	 @RequestMapping(value="/updateInvoice",method=RequestMethod.POST,consumes="application/json")
	 public ModelAndView updateInvoice(@RequestBody WHInvoice formData ,HttpServletRequest request,HttpServletResponse response)
	 
	 {
		 try {
			 	String responseStr;
				List<String> locationsList = new ArrayList<String>();
				List<String> outletLocationsList = new ArrayList<String>();
				String customerIdStr = (String) request.getSession().getAttribute("customerId");
				String emailIdStr = (String) request.getSession().getAttribute("emailId");
				responseStr = warehouseServiceObj.updateWarehouseShipmentInvoice(formData, customerIdStr, emailIdStr);
				// log.info("new - warehouse - shipments - Invoice");
				//locationsList = warehouseServiceObj.getLocationDetails("", customerIdStr, emailIdStr, "-1", "", false,false, true);
				if(responseStr.equals(AppProperties.getAppMessageByProperty("INVOICE_UPDATED_SUCCESS").trim()))
				{
					responseStr = AppProperties.getAppMessageByProperty("INVOICE_UPDATED_SUCCESS").trim();

					modelAndViewObj.addObject("success",responseStr);
					
				}	
				else
				{
					//result = "Couldn't create, please try after some time";
					responseStr = Response.getResponseMessage(responseStr);
				
					modelAndViewObj.addObject("err",responseStr);
				}
				
				
				WHInvoice invoiceList = warehouseServiceObj.getWarehouseInvoice("", "",formData.getInvoiceId() ,customerIdStr, emailIdStr);
				
//				//////////System.out.println("invoiceList"+invoiceList.size());

				
				if(invoiceList.getWhInvoiceList() != null)
					modelAndViewObj.addObject("itemLists",invoiceList.getWhInvoiceList().get(0));
				locationsList = adminServiceObj.getWarehouseLocationsList("1", emailIdStr,true);
				outletLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);

				modelAndViewObj.addObject("invoiceList",invoiceList);
				modelAndViewObj.addObject("nextWorkflowList", invoiceList.getNextWorkFlows());
				modelAndViewObj.addObject("invoiceloc", locationsList);
				modelAndViewObj.setViewName("Warehouse Management/Stocks Management/Shipments/editInvoicing");
			} catch (Exception e) {
				e.printStackTrace();
			}
			return modelAndViewObj;
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
	 
	 
	 @RequestMapping("/getGrnItems")

	 public @ResponseBody PurchaseOrderBean getGrnItems(@RequestParam("grnRefId") String grnRefId,HttpServletRequest request,HttpServletResponse response) {
	 	PurchaseOrderBean purchaseOrderShipmentLocationsList = new PurchaseOrderBean();
	 	ProcurementReceipt grnobjList = new ProcurementReceipt();
	 	PurchaseOrderItems item= null;
	 	String customerIdStr= (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
	 	List<PurchaseOrderItems> poitems = new ArrayList<PurchaseOrderItems>();
	 	try{
	 		
	 		
	 		grnobjList = procurementServiceObj.getGRNItems(grnRefId,"","", "");
	 	
	 	
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
	 			 item.setExpiryDateStr(grnitems.getExpiryDateStr());
	 			 item.setBactchNum(grnitems.getBactchNum());
	 			 item.setUtility(grnitems.getUtility());
	 			if(grnitems.getTaxList() != null){
	 			 item.setTaxdetailsStr(new Gson().toJson(grnitems.getTaxList()));
					}
	 			 
	 			 poitems.add(item);
	 		}
	 		purchaseOrderShipmentLocationsList.setItemDetails(poitems);
	 		if(grnobjList.getInvoiceRefNumber()!=null)
	 		purchaseOrderShipmentLocationsList.setInvoiceNo(grnobjList.getInvoiceRefNumber());
	 		if(grnobjList.getSupplierName()!=null) {
	 		purchaseOrderShipmentLocationsList.setSupplierName(grnobjList.getSupplierName());
	 		purchaseOrderShipmentLocationsList.setSupplierId(grnobjList.getSupplierId());
	 		
	 		List<SupplierBean> suppliersList  = outletMasterServiceObj.searchSuppliers(customerIdStr, emailIdStr,grnobjList.getSupplierName(),"0","");

			if(suppliersList != null)
				purchaseOrderShipmentLocationsList.setSupplier_state(suppliersList.get(0).getState());
	 		
	 		
	 		}
	 		////////////System.out.println(grnobjList.getSupplierName());
	 		
	 	}catch(Exception e){
	 		e.printStackTrace();
	 	}
	 	return purchaseOrderShipmentLocationsList;
	 }
	 
		
	/* @RequestMapping("/getGrnItems")

	 public @ResponseBody PurchaseOrderBean getGrnItems(@RequestParam("grnRefId") String grnRefId,HttpServletRequest request,HttpServletResponse response) {
	 	PurchaseOrderBean purchaseOrderShipmentLocationsList = new PurchaseOrderBean();
	 	ProcurementReceipt grnobjList = new ProcurementReceipt();
	 	PurchaseOrderItems item= null;
	 	List<PurchaseOrderItems> poitems = new ArrayList<PurchaseOrderItems>();
	 	try{
	 		// log.info("getPoItems");
	 		//////////System.out.println("getPoItems");
	 		
	 		grnobjList = procurementServiceObj.getGRNItems(grnRefId,"","", "");
	 		
	 		
	 		//////////System.out.println(grnobjList.getItemsList().size());
	 		
	 	
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
	 		purchaseOrderShipmentLocationsList.setInvoiceNo(grnobjList.getInvoiceRefNumber());
	 		//////////System.out.println(purchaseOrderShipmentLocationsList.getItemDetails().size());
	 		
	 	}catch(Exception e){
	 		e.printStackTrace();
	 	}
	 	return purchaseOrderShipmentLocationsList;
	 }
*/
	 	
	 
	 
}
