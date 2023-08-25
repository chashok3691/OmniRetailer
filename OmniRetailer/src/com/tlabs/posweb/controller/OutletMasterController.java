package com.tlabs.posweb.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
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
import com.tlabs.posweb.beans.BatchOperationsResponse;
import com.tlabs.posweb.beans.BillOfMaterial;
import com.tlabs.posweb.beans.BillOfMaterialResponse;
//import com.tlabs.posweb.beans.CustomerAddress;
import com.tlabs.posweb.beans.Department;
import com.tlabs.posweb.beans.EmployeeBean;
import com.tlabs.posweb.beans.EventInventoryReturnDetails;
import com.tlabs.posweb.beans.EventMaster;
//import com.tlabs.posweb.beans.FeaturedProducts;
//import com.tlabs.posweb.beans.GoodsReceiptsItems;
import com.tlabs.posweb.beans.Group;
import com.tlabs.posweb.beans.GroupChild;
import com.tlabs.posweb.beans.HomePageGroup;
import com.tlabs.posweb.beans.LocationBean;
import com.tlabs.posweb.beans.MachineAndEquipmentMaster;
import com.tlabs.posweb.beans.MasterDataImportsAndExportsBean;
import com.tlabs.posweb.beans.Menu;
import com.tlabs.posweb.beans.PriceHistory;
import com.tlabs.posweb.beans.PriceRangeMaster;
import com.tlabs.posweb.beans.PriceRangeResponse;
//import com.tlabs.posweb.beans.ProcurementReceipt;
import com.tlabs.posweb.beans.ProductCategoryBean;
import com.tlabs.posweb.beans.ProductMaster;
import com.tlabs.posweb.beans.ProductSubCategoryBean;
//import com.tlabs.posweb.beans.ProductSubcategorySections;
import com.tlabs.posweb.beans.Products;
import com.tlabs.posweb.beans.ProductsList;
//import com.tlabs.posweb.beans.ResponseHeader;
import com.tlabs.posweb.beans.SearchProductResponse;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.beans.ShipmentRateMaster;
import com.tlabs.posweb.beans.Sku;
import com.tlabs.posweb.beans.SkuEans;
import com.tlabs.posweb.beans.SkuPriceList;
import com.tlabs.posweb.beans.States;
import com.tlabs.posweb.beans.SupplierAddresses;
//import com.tlabs.posweb.beans.SkuPriceList;
//import com.tlabs.posweb.beans.SkuPriceListDetails;
import com.tlabs.posweb.beans.SupplierBean;
import com.tlabs.posweb.beans.SupplierProducts;
import com.tlabs.posweb.beans.Suppliers;
import com.tlabs.posweb.beans.TaxBean;
import com.tlabs.posweb.beans.TenderMaster;
import com.tlabs.posweb.beans.WareHouseSku;
//import com.tlabs.posweb.beans.WareHouseSkuResponse;
import com.tlabs.posweb.beans.Warehouse;
import com.tlabs.posweb.beans.ZoneMaster;
import com.tlabs.posweb.init.AppProperties;
import com.tlabs.posweb.services.AdminService;
import com.tlabs.posweb.services.DataManagementService;
import com.tlabs.posweb.services.DepartmentService;

import com.tlabs.posweb.services.GenericMasterService;
import com.tlabs.posweb.services.MasterService;
import com.tlabs.posweb.services.OutletMasterService;
import com.tlabs.posweb.services.SkuService;
import com.tlabs.posweb.services.StoreService;
import com.tlabs.posweb.services.WarehouseService;
import com.tlabs.posweb.util.Constants;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
import com.tlabs.posweb.util.RestfulServiceConnection;
//import com.tlabs.posweb.util.Utilities;

@Controller
@RequestMapping(value = "/outletMaster")
public class OutletMasterController {
	
	private ModelAndView modelAndViewObj;
	@Autowired
	SessionScope sessionScope;
	@Autowired
	private MasterService masterServiceObj;
	@Autowired
	private OutletMasterService outletMasterServiceObj;
	@Autowired
	private StoreService storeServiceObj;
	@Autowired
	private WarehouseService warehouseServiceObj;
	@Autowired
	private Gson gson;
	@Autowired
	private AdminService adminServiceObj;
	@Autowired
	private SkuService skuServiceObj;
	@Autowired
    private GenericMasterService genericMasterServiceObj;
	@Autowired
	private DepartmentService departmentServiceObj;
	@Autowired 
	private DataManagementService dataManagementServiceObj;
	//private static Logger log = Logger.getLogger(OutletMasterController.class);
	
	//private FormatConverter convertionObj;
	/**
	 * @author Mythri.S
	 * @param request
	 * @param response
	 * @return returns a jsp which displays all the icons of outlet management flow
	 */
	@RequestMapping("/showOutletMasterFlows")
	public ModelAndView showOutletMasterFlows(HttpServletRequest request,HttpServletResponse response){
		// log.info("InventoryManagerController - showOutletFlows");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/outletMastersFlow");
		return modelAndViewObj;
	}
	
	/*
	 * @RequestMapping("/showPricemanagementFlow") public ModelAndView
	 * showPricemanagementFlow(HttpServletRequest request,HttpServletResponse
	 * response){ // log.info("InventoryManagerController - showOutletFlows");
	 * modelAndViewObj = new ModelAndView(); modelAndViewObj.setViewName(
	 * "MasterDataManagement/OutletMasters/pricemanagementFlow"); return
	 * modelAndViewObj; }
	 */
	
	
	/**
	 * 
	 * @author Manasa.P
	 * Created_On : 4-12-17
	 *This method is used to display the Sku Details 
	 *
	 **/
	@RequestMapping("/viewPriceUpdate")
	public ModelAndView viewPriceUpdate(@RequestParam("zone") String zone,@RequestParam("index") String index,@RequestParam("brand") String brand,@RequestParam("maxRecords") String maxRecords,@RequestParam("location") String location,@RequestParam("category") String category,@RequestParam("subcategory") String subcategory,@RequestParam("department") String department,@RequestParam("section") String section,
		@RequestParam("searchName") String searchNameStr,@RequestParam("startprice") Float startprice,@RequestParam("endprice") Float endprice ,@RequestParam("flowLocation") String flowLocation,HttpServletRequest request,HttpServletResponse response){
//		List<String> locationsList = null;
//		String locationsAllList="";
		ArrayList<LocationBean> locationsList = null;
		List<Sku> skuResponse = null;
		List<WareHouseSku>  wareHouseSkuResponse=null;
//		String locationListAll = "";
		//SearchProductResponse skuResponse =null;
		try{
			// log.info("viewSPriceUpdate");
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
//		    locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
			
			
			if(flowLocation.equals("warehouse") ||flowLocation ==  "warehouse" ){
				locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
			}else{
			locationsList =	genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			
			}/*if((location.trim()).equals(null) || location.trim().isEmpty())
			{
				location = locationsList.get(0);
			}*/
			
		/*	List<String> locationsListValue=new ArrayList<String>();
			if(location.equals("all") || location.equals(""))
			{
				if(locationsList != null){
					for(int i=0;i<locationsList.size();i++){
					
						locationsListValue.add(locationsList.get(i).getLocationId());
							
					}
				for (String string : locationsListValue) {
					
					locationListAll = locationListAll+string+",";
				}
				}
			}
			*/
			/*skuResponse = skuServiceObj.getPriceupdateDetails(index,customerIdStr,emailIdStr,location);*/
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				 zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,index,"","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			List<String> brandsList =(List<String>)request.getSession().getAttribute("brandsList");
			if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
				brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
				request.getSession().setAttribute("brandsList", brandsList);
			}
			if(flowLocation.equals("warehouse") ||flowLocation ==  "warehouse" ){
			wareHouseSkuResponse = skuServiceObj.getWarehouseSKUDetailsForPriceUpdate(searchNameStr,zone,customerIdStr, emailIdStr,Integer.parseInt(index),brand,maxRecords,location,category,subcategory,department);

			modelAndViewObj = new ModelAndView();
			if(wareHouseSkuResponse == null ){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0"); 
			}else{
				if(wareHouseSkuResponse.size()<Integer.parseInt(maxRecords)){
					end = (wareHouseSkuResponse.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", wareHouseSkuResponse.get(0).getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("priceUpdateList", wareHouseSkuResponse);
				
				modelAndViewObj.addObject("department", department);
				//modelAndViewObj.addObject("zoneList", zoneList);
				//////////System.out.println(skuResponse.size());
				modelAndViewObj.addObject("category", category);
				modelAndViewObj.addObject("subcategory", subcategory);
				modelAndViewObj.addObject("brand", brand);
				modelAndViewObj.addObject("zone", zone);
				modelAndViewObj.addObject("brandsList", brandsList);
				//modelAndViewObj.addObject("brandsList", brandsList);
				//modelAndViewObj.addObject("priceUpdateList", skuResponse);
				modelAndViewObj.addObject("outletlocationsList", locationsList);
				modelAndViewObj.addObject("selectedLocation", location);
				modelAndViewObj.addObject("flowLocation",flowLocation);
				modelAndViewObj.addObject("searchName", searchNameStr);
				modelAndViewObj.addObject("maxRecords",Integer.parseInt(maxRecords));
				/*modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/viewPriceUpdate");*/
			    }
			modelAndViewObj.setViewName("MasterDataManagement/WarehouseMasters/viewPriceUpdate");
			}else{
			skuResponse = skuServiceObj.getSKUDetails(null, customerIdStr, emailIdStr,index,maxRecords,location,category,subcategory,brand,department,"","","","");
			System.out.println("SKU ::"+gson.toJson(skuResponse));
			modelAndViewObj = new ModelAndView();
			if(skuResponse == null ){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(skuResponse.size()<Integer.parseInt(maxRecords)){
					end = (skuResponse.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", skuResponse.get(0).getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("priceUpdateList", skuResponse);
				modelAndViewObj.addObject("department", department);
				//modelAndViewObj.addObject("zoneList", zoneList);
				//////////System.out.println(skuResponse.size());
				modelAndViewObj.addObject("category", category);
				modelAndViewObj.addObject("subcategory", subcategory);
				modelAndViewObj.addObject("brand", brand);
				modelAndViewObj.addObject("zone", zone);
				modelAndViewObj.addObject("brandsList", brandsList);
				//modelAndViewObj.addObject("brandsList", brandsList);
				//modelAndViewObj.addObject("priceUpdateList", skuResponse);
				modelAndViewObj.addObject("outletlocationsList", locationsList);
				modelAndViewObj.addObject("selectedLocation", location);
				modelAndViewObj.addObject("flowLocation",flowLocation);
				modelAndViewObj.addObject("maxRecords",Integer.parseInt(maxRecords));
				/*modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/viewPriceUpdate");*/
			    }
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/viewPriceUpdate");
			}
			
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Manasa.P
	 * Created_On : 4-12-17
	 *This method is used to display the Sku Details 
	 *
	 **/
	@RequestMapping("/viewOutletStockUpdateDetails")
	public ModelAndView viewOutletStockUpdateDetails(@RequestParam("searchName") String searchNameStr,@RequestParam("zone") String zone,@RequestParam("index") String index,@RequestParam("brand") String brand,@RequestParam("maxRecords") String maxRecords,@RequestParam("location") String location,@RequestParam("category") String category,@RequestParam("subcategory") String subcategory,@RequestParam("department") String department,@RequestParam("section") String section ,HttpServletRequest request,HttpServletResponse response){
//		List<String> locationsList = null;
//		String locationsAllList="";
//		ArrayList<LocationBean> locationsList = null;
//		String locationListAll = "";
//		List<WareHouseSku>  wareHouseSkuResponse=null;
		//SearchProductResponse skuResponse =null;
		try{
			// log.info("viewSPriceUpdate");
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
//		    locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
			ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","Retail Outlet",false,false,true);
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			
			List<String> brandsList =(List<String>)request.getSession().getAttribute("brandsList");
			if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
				brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
				request.getSession().setAttribute("brandsList", brandsList);
			}
			List<Sku> skuResponse = skuServiceObj.getSKUDetails(null, customerIdStr, emailIdStr,index,maxRecords,location,category,subcategory,brand,department,"","",searchNameStr,"");
			modelAndViewObj = new ModelAndView();
			if(skuResponse == null ){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(skuResponse.size()<Integer.parseInt(maxRecords)){
					end = (skuResponse.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", skuResponse.get(0).getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.addObject("totalValue", end);
			    }
			modelAndViewObj.addObject("department", department);
			
			modelAndViewObj.addObject("category", category);
			modelAndViewObj.addObject("subcategory", subcategory);
			modelAndViewObj.addObject("brand", brand);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("brandsList", brandsList);
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("priceUpdateList", skuResponse);
			modelAndViewObj.addObject("outletlocationsList", locationsList);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("maxRecords",Integer.parseInt(maxRecords));
			/*modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/viewPriceUpdate");*/
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/outletStockUpdate");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	
	/**
	 * 
	 * @author Manasa.P
	 * Created_On : 4-12-17
	 *This method is used to display the Sku Details 
	 *
	 **/
	@RequestMapping("/viewStockUpdateDetails")
	public ModelAndView viewStockUpdateDetails(@RequestParam("searchName") String searchNameStr,@RequestParam("zone") String zone,@RequestParam("index") int index,@RequestParam("brand") String brand,@RequestParam("maxRecords") String maxRecords,@RequestParam("location") String location,@RequestParam("category") String category,@RequestParam("subcategory") String subcategory,@RequestParam("department") String department,@RequestParam("section") String section ,HttpServletRequest request,HttpServletResponse response){
//		List<String> locationsList = null;
//		String locationsAllList="";
//		ArrayList<LocationBean> locationsList = null;
//		String locationListAll = "";
		List<WareHouseSku>  wareHouseSkuResponse=null;
		//SearchProductResponse skuResponse =null;
		try{
			// log.info("viewSPriceUpdate");
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
//		    locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
			ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","Warehouse",false,false,true);
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			
			List<String> brandsList =(List<String>)request.getSession().getAttribute("brandsList");
			if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
				brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
				request.getSession().setAttribute("brandsList", brandsList);
			}
			
         wareHouseSkuResponse = skuServiceObj.getWarehouseSKUDetailsForStockUpdate(searchNameStr,zone,customerIdStr, emailIdStr,index,brand,maxRecords,location,category);
			modelAndViewObj = new ModelAndView();
			if(wareHouseSkuResponse == null ){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(wareHouseSkuResponse.size()<Integer.parseInt(maxRecords)){
					end = (wareHouseSkuResponse.size())+(index);
				}else{
					end = (index+end);
				}
				modelAndViewObj.addObject("totalRecords", wareHouseSkuResponse.get(0).getTotalRecords());
				modelAndViewObj.addObject("index", (index+start));
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.addObject("totalValue", end);
			    }
			modelAndViewObj.addObject("department", department);
			
			modelAndViewObj.addObject("category", category);
			modelAndViewObj.addObject("subcategory", subcategory);
			modelAndViewObj.addObject("brand", brand);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("brandsList", brandsList);
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("priceUpdateList", wareHouseSkuResponse);
			modelAndViewObj.addObject("outletlocationsList", locationsList);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("maxRecords",Integer.parseInt(maxRecords));
			/*modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/viewPriceUpdate");*/
			modelAndViewObj.setViewName("MasterDataManagement/WarehouseMasters/stockUpdate");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	
	
	@RequestMapping("/searchPriceUpdate")
	public ModelAndView searchPriceUpdate(@RequestParam("zone") String zone,@RequestParam("locationList") String locationList,@RequestParam("subcategory") String subcategory,@RequestParam("brand") String brand,@RequestParam("department") String department,@RequestParam("supplierid") String supplierid,@RequestParam("status") String status,
			@RequestParam("productCategory") String productCategory,@RequestParam("location") String location,
			@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchNameStr,
			@RequestParam("index") String index,@RequestParam("flowLocation") String flowLocation,
			HttpServletRequest request,HttpServletResponse response) {
		String customerId = null,emailId=null;
		ArrayList<LocationBean> locationsList = null;
		try{
			// log.info("searchPriceUpdate");
			int start = 1,end = Integer.parseInt(maxRecords);
			customerId = (String)request.getSession().getAttribute("customerId");
			emailId = (String)request.getSession().getAttribute("emailId");
			List<Sku> skuList = skuServiceObj.getSKUDetails(null, customerId, emailId,index,maxRecords,location,productCategory,subcategory,brand,department,supplierid,status,searchNameStr,zone);

			//			List<String> locationsList = adminServiceObj.getOutletLocationsList(customerId,emailId,false);
//			List<Sku> skuList = skuServiceObj.getForPriceSKUDetails(null, customerId, emailId,index,maxRecords,location,productCategory,subcategory,brand,department,supplierid,status,searchNameStr,locationList);
			if(flowLocation.equals("warehouse") ||flowLocation ==  "warehouse" ){
				locationsList = genericMasterServiceObj.getLocationDetails("",customerId, emailId,"-1","Warehouse",false,false,true);
			}else{
			locationsList =	genericMasterServiceObj.getLocationDetails("",customerId, emailId,"-1","Retail Outlet",false,true,false);
			}
			List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
			if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
				categoryList = outletMasterServiceObj.getCategoryDetails("",customerId, emailId,"-1","");
				request.getSession().setAttribute("categoryList", categoryList);
			}
			List<Department> departmentList =(List<Department>)request.getSession().getAttribute("departmentList");
			if(departmentList==null || departmentList.size()==0 || departmentList.isEmpty()){
				departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerId, emailId,index,false);
				request.getSession().setAttribute("departmentList", departmentList);
			}
			List<String> brandsList =(List<String>)request.getSession().getAttribute("brandsList");
			if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
				brandsList = adminServiceObj.getBrandNamesList(customerId,emailId);
				request.getSession().setAttribute("brandsList", brandsList);
			}
			modelAndViewObj = new ModelAndView();
			if(skuList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(skuList.size()<end){
					end = (skuList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(skuList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("maxRecords", maxRecords);
			}
			modelAndViewObj.addObject("outletlocationsList", locationsList);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("subcategory", subcategory);
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("brand", brand);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("supplierid", supplierid);
			modelAndViewObj.addObject("department", department);
			modelAndViewObj.addObject("status", status);
			modelAndViewObj.addObject("brandsList", brandsList);
			modelAndViewObj.addObject("categoryList", categoryList);
			modelAndViewObj.addObject("category", productCategory);
			modelAndViewObj.addObject("priceUpdateList", skuList);
			modelAndViewObj.addObject("flowLocation", flowLocation);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/viewPriceUpdate");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	
	
	@RequestMapping("/viewBulkPriceUpdate")
	public ModelAndView viewBulkPriceUpdate(@RequestParam("zone") String zone,@RequestParam("locationList") String locationList,@RequestParam("subcategory") String subcategory,@RequestParam("brand") String brand,@RequestParam("department") String department,@RequestParam("supplierid") String supplierid,@RequestParam("status") String status,@RequestParam("productCategory") String productCategory,@RequestParam("location") String location,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,@RequestParam("flowLocation") String flowLocation, HttpServletRequest request,HttpServletResponse response) {
		String customerId = null,emailId=null;
		String locationListAll="";
		ArrayList<LocationBean> locationsList = null;
		try{
			// log.info("searchPriceUpdate");
			int start = 1,end = Integer.parseInt(maxRecords);
			customerId = (String)request.getSession().getAttribute("customerId");
			emailId = (String)request.getSession().getAttribute("emailId");
			
			if(flowLocation.equals("warehouse") ||flowLocation ==  "warehouse" ){
				 locationsList = genericMasterServiceObj.getLocationDetails("",customerId, customerId,"-1","Warehouse",false,false,true);
			}else{
			
			  locationsList =	genericMasterServiceObj.getLocationDetails("",customerId, emailId,"-1","Retail Outlet",false,true,false);
			}
			
			
			
			List<String> locationsListValue=new ArrayList<String>();
	  			
	  	  		
	  			if(location.equals("all")|| location.equals("")){
					if(locationsList != null){
						if(zone ==""){
							for(int i=0;i<locationsList.size();i++){
								locationsListValue.add(locationsList.get(i).getLocationId());
									
							}
							}
							else
							{
								locationsListValue.add(locationList);
							}
						
						for (String string : locationsListValue) {
							
							locationListAll = locationListAll+string+",";
						}
					}
					
				}
			
			
			
			PriceHistory skuPrice = skuServiceObj.getForPriceSKUDetails(index,maxRecords,location,searchNameStr,locationListAll,startDate ,endDate,productCategory,subcategory,brand,zone);
		
			List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
			if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
				categoryList = outletMasterServiceObj.getCategoryDetails("",customerId, emailId,"-1","");
				request.getSession().setAttribute("categoryList", categoryList);
			}
			List<Department> departmentList =(List<Department>)request.getSession().getAttribute("departmentList");
			if(departmentList==null || departmentList.size()==0 || departmentList.isEmpty()){
				departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerId, emailId,index,false);
				request.getSession().setAttribute("departmentList", departmentList);
			}
			List<String> brandsList =(List<String>)request.getSession().getAttribute("brandsList");
			if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
				brandsList = adminServiceObj.getBrandNamesList(customerId,emailId);
				request.getSession().setAttribute("brandsList", brandsList);
			}
			List<ProductSubCategoryBean> subCategoryDetailsList =(List<ProductSubCategoryBean>)request.getSession().getAttribute("subCategoryDetailsList");
			if(subCategoryDetailsList==null || subCategoryDetailsList.size()==0 || subCategoryDetailsList.isEmpty()){
				subCategoryDetailsList = outletMasterServiceObj.getSubCategoryDetails("","", "","-1","",false);
				request.getSession().setAttribute("subCategoryDetailsList", subCategoryDetailsList);
			}
			modelAndViewObj = new ModelAndView();
			if(skuPrice.getPriceHistory() == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(skuPrice.getPriceHistory() != null)
				if(skuPrice.getPriceHistory().size()<end){
					end = (skuPrice.getPriceHistory().size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", skuPrice.getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("maxRecords", maxRecords);
			}
			modelAndViewObj.addObject("maxRecords", maxRecords);
			modelAndViewObj.addObject("outletlocationsList", locationsList);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("subcategory", subcategory);
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("brand", brand);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("supplierid", supplierid);
			modelAndViewObj.addObject("department", department);
			modelAndViewObj.addObject("status", status);
			modelAndViewObj.addObject("brandsList", brandsList);
			modelAndViewObj.addObject("categoryList", categoryList);
			modelAndViewObj.addObject("startDate", startDate);
			modelAndViewObj.addObject("endDate", endDate);
			modelAndViewObj.addObject("category", productCategory);
			modelAndViewObj.addObject("flowLocation", flowLocation);
			modelAndViewObj.addObject("bulkPriceUpdateDetails", skuPrice.getPriceHistory());
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/viewBulkPriceUpdate");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	

	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to view the details of all the products in tabular form
	 *
	 **/
	@RequestMapping(value="/viewProduct",method=RequestMethod.POST)
	public ModelAndView viewProduct(@RequestParam("index") String index,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
		try{
			int start = 1,end = 10;
			// log.info("viewProduct ");
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			//String role = (String)request.getSession().getAttribute("role");
			List<Products> productList = outletMasterServiceObj.getProducts(customerId,emailId,searchName,index,"","",maxRecords);
			modelAndViewObj = new ModelAndView();
			if(productList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(productList.size()<10){
					end = (productList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(productList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("productList", productList);
			modelAndViewObj.addObject("maxRecords", maxRecords);
			modelAndViewObj.addObject("searchName",searchName);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ProductMaster/productMaster");
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
	 *This method is used to display the New Product form
	 *
	 **/
	@RequestMapping("/newProduct")
	public ModelAndView newProduct(@RequestParam("maxRecords") String maxRecords, @RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("newProduct");
			String locationStr = "";
			modelAndViewObj = new ModelAndView();
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			List<Suppliers> supplierList = outletMasterServiceObj.getSuppliers(customerId, emailId,"-1","","");
			Warehouse warehouse = new Warehouse();
//			warehouse.setRequestHeader(RequestHeaderUtil.getRequestHeaderr(customerId, emailId));
			warehouse.setWarehouseLocation("all");
			warehouse.setStartIndex("0");
			List<Warehouse> warehouses = warehouseServiceObj.getWarehouses(warehouse);
//			String subCategories = masterServiceObj.getCategories(customerId,emailId);
//			if(subCategories.equals("{}"))
//				modelAndViewObj.addObject("err", "Please Create Category and Sub Category prior to create product");
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerId, emailId,Constants.PAGINATION_START_INDEX);
			if(categoryList != null && categoryList.size() >0){
				List<ProductSubCategoryBean> subCategoryList = outletMasterServiceObj.getSubCategoryDetails(categoryList.get(0).getCategoryName(), customerId, emailId, "-1", true);
				modelAndViewObj.addObject("subCategoryList", subCategoryList);
			}
//			ArrayList<String> categories = masterServiceObj.getCategoriesList(subCategories);
			modelAndViewObj.addObject("categories", categoryList);
//			modelAndViewObj.addObject("subCategories", subCategories);
			Map<String,Object> storesListMap = storeServiceObj.getStoresList(customerId, emailId,locationStr,"-1","10");
			modelAndViewObj.addObject("storesList", storesListMap.get("storeDetailsList"));
			modelAndViewObj.addObject("supplierList", supplierList);
			modelAndViewObj.addObject("warehouseList", warehouses);
			modelAndViewObj.addObject("searchName",searchName);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ProductMaster/newProduct");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	



	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to save the details of a New Product
	 *
	 **/
	@RequestMapping(value="/createProduct",method=RequestMethod.POST)
	public ModelAndView createProduct(@RequestParam("formData") String productMasterDetaills,@RequestParam("maxRecords")String maxRecords,@RequestParam("searchName")String searchName,@RequestParam("productSupplier") String productSupplier,@RequestParam("productStore") String productStore,HttpServletRequest request,HttpServletResponse response) {
		try{
			String locationStr = "";
			// log.info("create Product");
			modelAndViewObj = new ModelAndView();
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			String resultStr = outletMasterServiceObj.createProduct(productMasterDetaills,productSupplier,productStore,customerId,emailId);
//			String subCategories = masterServiceObj.getCategories(customerId,emailId);
			List<Suppliers> supplierList = outletMasterServiceObj.getSuppliers(customerId, emailId,"-1","","");
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerId, emailId,Constants.PAGINATION_START_INDEX);
			if(categoryList != null && categoryList.size() >0){
				List<ProductSubCategoryBean> subCategoryList = outletMasterServiceObj.getSubCategoryDetails(categoryList.get(0).getCategoryName(), customerId, emailId, "-1", true);
				modelAndViewObj.addObject("subCategoryList", subCategoryList);
			}
//			ArrayList<String> categories = masterServiceObj.getCategoriesList(subCategories);
			Map<String,Object> storesListMap = storeServiceObj.getStoresList(customerId, emailId,locationStr,"-1","10");
			Warehouse warehouse = new Warehouse();
//			warehouse.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerId, emailId));
			warehouse.setWarehouseLocation("all");
			warehouse.setStartIndex("0");
			List<Warehouse> warehouses = warehouseServiceObj.getWarehouses(warehouse);
			modelAndViewObj.addObject("warehouseList", warehouses);
			modelAndViewObj.addObject("categories", categoryList);
//			modelAndViewObj.addObject("subCategories", subCategories);
			modelAndViewObj.addObject("supplierList", supplierList);
			modelAndViewObj.addObject("storesList", storesListMap.get("storeDetailsList"));
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("PRODUCT_CREATE_SUCCESS").trim())){
				ProductMaster productMaster = gson.fromJson(productMasterDetaills, ProductMaster.class);
				productSupplier = Response.getResponseList(productSupplier, "productSupplier");
				productStore = Response.getResponseList(productStore, "productStore");
				List<String> suppliersList = new ArrayList<String>();
				if(productSupplier.contains("[")){
					JSONArray jsonArray = new JSONArray(productSupplier);
					for (int i=0; i<jsonArray.length(); i++) {
						suppliersList.add(jsonArray.getString(i));
					}
				}
				else{
					suppliersList.add(productSupplier);
				}
				modelAndViewObj.addObject("selectedSuppliers", suppliersList);
				List<String> storesList = new ArrayList<String>();
				if(productStore.contains("[")){
					JSONArray jsonArray = new JSONArray(productStore);
					for (int i=0; i<jsonArray.length(); i++) {
						storesList.add(jsonArray.getString(i));
					}
				}else{
					storesList.add(productStore);
				}
				modelAndViewObj.addObject("selectedStores", storesList);
				modelAndViewObj.addObject("err", resultStr);
				modelAndViewObj.addObject("product", productMaster);
			}else
				modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ProductMaster/newProduct");
		}catch(Exception e){
			e.printStackTrace();
		}
		modelAndViewObj.addObject("maxRecords", maxRecords);
		modelAndViewObj.addObject("searchName", searchName);
		return modelAndViewObj;
	}

	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display the Edit Product form with all the values of the product
	 *
	 **/
	@RequestMapping("/editProduct")
	public ModelAndView editProduct(@RequestParam("productId") String productId,@RequestParam("maxRecords")String maxRecords,@RequestParam("searchName") String searchName, @RequestParam("operation") String operation,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("editProduct");
			String locationStr = "";
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			Map<String,Object> productDetails = outletMasterServiceObj.getProductByProductId(customerId, emailId,productId);
//			String subCategories = masterServiceObj.getCategories(customerId,emailId);
			List<Suppliers> supplierList = outletMasterServiceObj.getSuppliers(customerId, emailId,"-1","","");
//			ArrayList<String> categories = masterServiceObj.getCategoriesList(subCategories);
			ProductMaster productMasterObj = (ProductMaster)productDetails.get("product");
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerId, emailId,Constants.PAGINATION_START_INDEX);
			modelAndViewObj = new ModelAndView();
			List<ProductSubCategoryBean> subCategoryList = outletMasterServiceObj.getSubCategoryDetails(productMasterObj.getCategory(), customerId, emailId, "-1", true);
			Map<String,Object> storesListMap = storeServiceObj.getStoresList(customerId, emailId,locationStr,"-1","10");
			Warehouse warehouse = new Warehouse();
//			warehouse.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerId, emailId));
			warehouse.setWarehouseLocation("all");
			warehouse.setStartIndex("0");
			List<Warehouse> warehouses = warehouseServiceObj.getWarehouses(warehouse);
			modelAndViewObj.addObject("warehouseList", warehouses);
			modelAndViewObj.addObject("product", productMasterObj);
			modelAndViewObj.addObject("categories", categoryList);
			modelAndViewObj.addObject("subCategoryList", subCategoryList);
//			modelAndViewObj.addObject("subCategories", subCategories);
			modelAndViewObj.addObject("supplierList", supplierList);
			modelAndViewObj.addObject("searchName", searchName);
			modelAndViewObj.addObject("maxRecords", maxRecords);
			modelAndViewObj.addObject("selectedSuppliers", productDetails.get("selectedSuppliers"));
			modelAndViewObj.addObject("selectedStores", productDetails.get("selectedStores"));
			modelAndViewObj.addObject("storesList", storesListMap.get("storeDetailsList"));
			if(operation.equals("view"))
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ProductMaster/viewProduct");
			else
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ProductMaster/editProduct");
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
	 *This method is used to update the existing product
	 *
	 **/
	@RequestMapping(value="/updateProduct",method=RequestMethod.POST)
	public ModelAndView updateProduct(@RequestParam("formData") String productMasterDetaills,@RequestParam("productSupplier") String productSupplier,@RequestParam("productStore") String productStore,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("update Product");
			String locationStr = "";
			modelAndViewObj = new ModelAndView();
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			Map<String,Object> productDetails = outletMasterServiceObj.updateProduct(productMasterDetaills,productSupplier,productStore,customerId,emailId);
//			String subCategories = masterServiceObj.getCategories(customerId,emailId);
			List<Suppliers> supplierList = outletMasterServiceObj.getSuppliers(customerId, emailId,"-1","","");
//			ArrayList<String> categories = masterServiceObj.getCategoriesList(subCategories);
			ProductMaster productMasterObj = (ProductMaster)productDetails.get("product");
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerId, emailId,Constants.PAGINATION_START_INDEX);
			List<ProductSubCategoryBean> subCategoryList = outletMasterServiceObj.getSubCategoryDetails(productMasterObj.getCategory(), customerId, emailId, "-1", true);
			Map<String,Object> storesListMap = storeServiceObj.getStoresList(customerId, emailId,locationStr,"-1","10");
			Warehouse warehouse = new Warehouse();
//			warehouse.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerId, emailId));
			warehouse.setWarehouseLocation("all");
			warehouse.setStartIndex("0");
			List<Warehouse> warehouses = warehouseServiceObj.getWarehouses(warehouse);
			modelAndViewObj.addObject("warehouseList", warehouses);
			modelAndViewObj.addObject("categories", categoryList);
			modelAndViewObj.addObject("subCategoryList", subCategoryList);
//			modelAndViewObj.addObject("subCategories", subCategories);
			modelAndViewObj.addObject("supplierList", supplierList);
			modelAndViewObj.addObject("storesList", storesListMap.get("storeDetailsList"));
			modelAndViewObj.addObject("product", productMasterObj);
			modelAndViewObj.addObject("selectedSuppliers", productDetails.get("selectedSuppliers"));
			modelAndViewObj.addObject("selectedStores", productDetails.get("selectedStores"));
			if(!productDetails.get("responseMessage").equals(AppProperties.getAppMessageByProperty("PRODUCT_UPDATE_SUCCESS").trim()))
				modelAndViewObj.addObject("err", productDetails.get("responseMessage"));
			else
				modelAndViewObj.addObject("success", productDetails.get("responseMessage"));
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ProductMaster/editProduct");
		}catch(Exception e){
			e.printStackTrace();
		}
		modelAndViewObj.addObject("maxRecords", maxRecords);
		modelAndViewObj.addObject("searchName", searchName);
		
		return modelAndViewObj;
	}

	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to delete the products
	 *
	 **/
	@RequestMapping("/deleteProduct")
	public ModelAndView deleteProduct(@RequestParam("ids") String ids,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("deleteProduct ");
			int start = 1,end = Integer.parseInt(maxRecords);
			modelAndViewObj = new ModelAndView();
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			String result = masterServiceObj.deleteProduct(customerId,emailId ,ids);
			List<Products> productList = outletMasterServiceObj.getProducts(customerId,emailId,searchName,"0","","",maxRecords);
			if(productList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(productList.size()<end){
					end = (productList.size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(productList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("productList", productList);
			modelAndViewObj.addObject("searchName", searchName);
			modelAndViewObj.addObject("err", result);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ProductMaster/productMaster");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On:6-jun-2015.
	 * 
	 * This method accepts the search string and retrieves a list of product matching it.
	 * It returns the list of the products. 
	 * 
	 */
	
	@RequestMapping("/searchProductMaster")
	public ModelAndView searchProductMaster(@RequestParam("searchName") String searchNameStr,@RequestParam("maxRecords")String maxRecords,@RequestParam("index") String index,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		try{
			// log.info("searchProductMaster");
			int start = 1,end = Integer.parseInt(maxRecords);
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<Products> productsList = outletMasterServiceObj.getProducts(customerIdStr, emailIdStr,searchNameStr,index,"","",maxRecords);
			modelAndViewObj = new ModelAndView();
			if(productsList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(productsList.size()<end){
					end = (productsList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(productsList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("productList", productsList);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ProductMaster/productMaster");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On:3-mar-2015
	 * 
	 * This method is used to display all the supplier details in a tabular form.
	 * This method accepts the current index, sends it to web service and retrieves the next 10 records to be displayed.
	 *
	 **//*
	@RequestMapping("/viewSupplier")
	public ModelAndView viewSupplier(@RequestParam("index") String index, HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewSupplier ");
			int start = 1,end = 10;
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<Suppliers> supplierList = outletMasterServiceObj.getSuppliers(customerIdStr, emailIdStr,index);
			modelAndViewObj = new ModelAndView();
			if(supplierList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(supplierList.size()<10){
					end = (supplierList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(supplierList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("supplierList", supplierList);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SupplierMaster/supplierMaster");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	*//**
	 * 
	 * @author Mythri.S
	 * Created On: 3-mar-2015
	 * 
	 * This method is used to display the New Supplier form
	 * This method interacts with the service to retrieve the categories List.
	 * The categoryList is added to the model object as it needs to be dynamically populated in the view.
	 *
	 **//*
	@RequestMapping("/newSupplier")
	public ModelAndView newSupplier(HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("newSupplier ");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<String> currenciesList = adminServiceObj.getCurrenciesList(customerIdStr, emailIdStr);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("currencyList",currenciesList);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SupplierMaster/newSupplier");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	*//**
	 * 
	 * @author Mythri.S
	 * Created On: 3-mar-2015.
	 * 
	 * This method is used to display the Edit Supplier form with all the details of the Supplier.
	 * This method accepts the firmName and retrieves details from service based on the firmName.
	 * This method retrieves the currenciesList as it need to be dynamically populated in the view.
	 * based on the operation it returns either viewSupplier or editSupplier JSP along with supplier info and curreciesLlist 
	 *
	 **//*
	@RequestMapping("/editSupplier")
	public ModelAndView editSupplier(@RequestParam("firmName") String firmName,@RequestParam("operation")String operation, HttpServletRequest request,
			HttpServletResponse response){
		try{
			// log.info("editSupplier");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			SupplierBean supplierBeanObj = outletMasterServiceObj.getSupplierByFirmName(customerIdStr, emailIdStr,firmName);
			List<String> currenciesList = adminServiceObj.getCurrenciesList(customerIdStr, emailIdStr);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("currencyList",currenciesList);
			modelAndViewObj.addObject("supplierBean", supplierBeanObj.getSupplierMaster());
			if(operation.equals("view"))
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SupplierMaster/viewSupplier");
			else{
				modelAndViewObj.addObject("type", "edit");
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SupplierMaster/editSupplier");
			}
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	*//**
	 * 
	 * @author Mythri.S
	 *  Created On: 3-mar-2015
	 *  
	 * This method is used to save the details of the New Supplier.
	 * It accepts all the details of the supplier.
	 * It returns the newSupplier JSP, along with message or creation successful or not and currenciesList
	 *
	 **//*
	@RequestMapping(value="/createSupplier",method=RequestMethod.POST)
	public ModelAndView createSupplier(@RequestParam("formData") String formData,@RequestParam("itemDetails") String itemDetails,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("create Supplier");
			SupplierBean supplierBean = new SupplierBean();
			supplierBean = gson.fromJson(formData, SupplierBean.class);
			if(supplierBean.getRating() != null && "".equals(supplierBean.getRating()))
				supplierBean.setRating("0");
			if(supplierBean.getrFactor() != null && "".equals(supplierBean.getrFactor()))
				supplierBean.setrFactor(null);
			if(supplierBean.getMaxFactor() != null && "".equals(supplierBean.getMaxFactor()))
				supplierBean.setMaxFactor(null);
			ArrayList<SupplierProducts> itemDetailsList = new ArrayList<SupplierProducts>();
			itemDetails = Response.getResponseList(itemDetails, "itemDetails");
			SupplierProducts goodsReceiptsItems = null;
			JSONArray jsonArray = new JSONArray(itemDetails);
			for (int i=0; i<jsonArray.length(); i++) {
				goodsReceiptsItems = gson.fromJson(jsonArray.getString(i), SupplierProducts.class);
				itemDetailsList.add(goodsReceiptsItems);
			}
			supplierBean.setSupplierProducts(itemDetailsList);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = outletMasterServiceObj.createSupplier(supplierBean,customerIdStr,emailIdStr);
			modelAndViewObj = new ModelAndView();
			List<String> currenciesList = adminServiceObj.getCurrenciesList(customerIdStr, emailIdStr);
			modelAndViewObj.addObject("currencyList",currenciesList);
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("SUPPLIER_CREATE_SUCCESS").trim())){
				modelAndViewObj.addObject("supplierBean", supplierBean);
				modelAndViewObj.addObject("err", resultStr);
				modelAndViewObj.addObject("type", "new");
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SupplierMaster/editSupplier");
			}else{
				modelAndViewObj.addObject("succcess", resultStr);
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SupplierMaster/newSupplier");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	@RequestMapping("/getSupplierDetails")
	public @ResponseBody SupplierBean getSupplierDetails(@RequestParam("firmName") String firmName, HttpServletRequest request,HttpServletResponse response){
		SupplierBean supplierBean = null;
		try{
			// log.info("getSupplierDetails");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			SupplierBean supplierBeanObj = outletMasterServiceObj.getSupplierByFirmName(customerIdStr, emailIdStr,firmName);
			if(supplierBeanObj != null)
			{
				supplierBean = supplierBeanObj.getSupplierMaster();
			}
			
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return supplierBean;
	}
	*//**
	 * 
	 * @author Mythri.S
	 * Created on: 4-mar-2015.
	 * 
	 * This method is used to save the details of the already existing supplier.
	 * It accepts all the details of the supplier.
	 * It returns the editSupplier JSP, along with message or updation successful or not and currenciesList
	 *
	 **//*
	@RequestMapping(value="/updateSupplier",method=RequestMethod.POST)
	public ModelAndView updateSupplier(@RequestParam("formData") String formData,@RequestParam("itemDetails") String itemDetails,HttpServletRequest request,HttpServletResponse response) {
		try{
			SupplierBean supplierBean = new SupplierBean();
			supplierBean = gson.fromJson(formData, SupplierBean.class);
			if(supplierBean.getRating() != null && "".equals(supplierBean.getRating()))
				supplierBean.setRating("0");
			if(supplierBean.getrFactor() != null && "".equals(supplierBean.getrFactor()))
				supplierBean.setrFactor(null);
			if(supplierBean.getMaxFactor() != null && "".equals(supplierBean.getMaxFactor()))
				supplierBean.setMaxFactor(null);
			ArrayList<SupplierProducts> itemDetailsList = new ArrayList<SupplierProducts>();
			itemDetails = Response.getResponseList(itemDetails, "itemDetails");
			SupplierProducts goodsReceiptsItems = null;
			JSONArray jsonArray = new JSONArray(itemDetails);
			for (int i=0; i<jsonArray.length(); i++) {
				goodsReceiptsItems = gson.fromJson(jsonArray.getString(i), SupplierProducts.class);
				if(goodsReceiptsItems.getsNo() != null && "".equals(goodsReceiptsItems.getsNo()))
					goodsReceiptsItems.setsNo(null);
				itemDetailsList.add(goodsReceiptsItems);
			}
			supplierBean.setSupplierProducts(itemDetailsList);
			// log.info("update Supplier");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = outletMasterServiceObj.updateSupplier(supplierBean,customerIdStr,emailIdStr);
			List<String> currenciesList = adminServiceObj.getCurrenciesList(customerIdStr, emailIdStr);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("currencyList",currenciesList);
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("SUPPLIER_UPDATE_SUCCESS").trim()))
				modelAndViewObj.addObject("err", resultStr);
			else
				modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.addObject("type", "edit");
			modelAndViewObj.addObject("supplierBean", supplierBean);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SupplierMaster/editSupplier");
		}catch(Exception e){
			e.printStackTrace();
		}
	
		return modelAndViewObj;
	}
	
	*//**
	 * 
	 * @author Mythri.S
	 * Created On: -4-mar-2015.
	 * 
	 * This method is used to delete the suppliers
	 * It accepts the ids that need to be deleted.
	 * It retrieves the suppliersList to display in the table.
	 * It also sends the message of successful deletion or not.
	 * 
	 **//*
	@RequestMapping("/deleteSupplier")
	public ModelAndView deleteSupplier(@RequestParam("ids") String ids,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("deleteSupplier ");
			modelAndViewObj = new ModelAndView();
			int start = 1,end = 10;
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			String result = outletMasterServiceObj.deleteSupplier(customerId,emailId ,ids);
			List<Suppliers> supplierList = outletMasterServiceObj.getSuppliers(customerId,emailId,"0");
			modelAndViewObj = new ModelAndView();
			if(supplierList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(supplierList.size()<10){
					end = (supplierList.size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(supplierList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("supplierList", supplierList);
			modelAndViewObj.addObject("err", result);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SupplierMaster/supplierMaster");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}*/
	
	@RequestMapping("/viewSupplier")
	public ModelAndView viewSupplier(@RequestParam("index") String index,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName, HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewSupplier ");
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<Suppliers> supplierList = outletMasterServiceObj.getSuppliers(customerIdStr, emailIdStr,index,maxRecords,searchName);
			modelAndViewObj = new ModelAndView();
			if(supplierList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(supplierList.size()<end){
					end = (supplierList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(supplierList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			
			/*supplierList.get(0).setPreviousStates(l);
			supplierList.get(0).setPreviousWorkFlowLogList(li);
			
			modelAndViewObj.addObject("PreviousWorkFlowLogList", supplierList.get(0).getPreviousWorkFlowLogList());
			modelAndViewObj.addObject("previousStates", supplierList.get(0).getPreviousStates());*/
			
			modelAndViewObj.addObject("supplierList", supplierList);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SupplierMaster/supplierMaster");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		
		modelAndViewObj.addObject("maxRecords", maxRecords);
		modelAndViewObj.addObject("searchName", searchName);
		return modelAndViewObj;
	}
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 3-mar-2015
	 * 
	 * This method is used to display the New Supplier form
	 * This method interacts with the service to retrieve the categories List.
	 * The categoryList is added to the model object as it needs to be dynamically populated in the view.
	 *
	 **/
	@RequestMapping("/newSupplier")
	public ModelAndView newSupplier(@RequestParam("maxRecords")String maxRecords,@RequestParam("searchName")String searchName,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("newSupplier ");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<String> currenciesList = adminServiceObj.getCurrenciesList(customerIdStr, emailIdStr);
			States states = genericMasterServiceObj.getStates();
			ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","Warehouse",false,false,true);
			
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("currencyList",currenciesList);
			modelAndViewObj.addObject("states", states);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SupplierMaster/newSupplier");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		modelAndViewObj.addObject("maxRecords", maxRecords);
		modelAndViewObj.addObject("searchName",searchName);
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 3-mar-2015.
	 * 
	 * This method is used to display the Edit Supplier form with all the details of the Supplier.
	 * This method accepts the firmName and retrieves details from service based on the firmName.
	 * This method retrieves the currenciesList as it need to be dynamically populated in the view.
	 * based on the operation it returns either viewSupplier or editSupplier JSP along with supplier info and curreciesLlist 
	 *
	 **/
	@RequestMapping("/editSupplier")
	public ModelAndView editSupplier(@RequestParam("firmName") String firmName,@RequestParam("maxRecords") String maxRecords, @RequestParam("searchName")String searchName,@RequestParam("operation")String operation, HttpServletRequest request,
			HttpServletResponse response){
		try{
			// log.info("editSupplier");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			SupplierBean supplierBeanObj = outletMasterServiceObj.getSupplierByFirmName(customerIdStr, emailIdStr,firmName);
			List<String> currenciesList = adminServiceObj.getCurrenciesList(customerIdStr, emailIdStr);
			States states = genericMasterServiceObj.getStates();
          ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","Warehouse",false,false,true);
			
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("states", states);
			modelAndViewObj.addObject("currencyList",currenciesList);
			
			
		
			
			/*List<String> l= new ArrayList();
			l.add(supplierBeanObj.getStatusOrder());
			
			List<String> n= new ArrayList();
			n.add("Approved");*/
			/*supplierBeanObj.setPreviousStates(l);
			//supplierBeanObj.setPreviousWorkFlowLogList(li);
			supplierBeanObj.setNextWorkFlowStates(n);*/
			/*List<String> nextWorkFlowStates= new ArrayList();
			nextWorkFlowStates.add(supplierBeanObj.getSupplierMaster().getStatusOrder());
			supplierBeanObj.setNextWorkFlowStates(nextWorkFlowStates);*/
			modelAndViewObj.addObject("nextWorkFlowStates", supplierBeanObj.getSupplierMaster().getNextWorkFlowStates());
			//modelAndViewObj.addObject("PreviousWorkFlowLogList", supplierBeanObj.getPreviousWorkFlowLogList());
			modelAndViewObj.addObject("previousStates", supplierBeanObj.getSupplierMaster().getPreviousStates());
			
			
			if(!supplierBeanObj.getResponseHeader().getResponseCode().equalsIgnoreCase("0")) {
			modelAndViewObj.addObject("err", supplierBeanObj.getResponseHeader().getResponseMessage());
			}else {
			modelAndViewObj.addObject("supplierBean", supplierBeanObj.getSupplierMaster());
			}
			if(supplierBeanObj.getSupplierMaster() != null)
			modelAndViewObj.addObject("productFlag", supplierBeanObj.getSupplierMaster().isProductRestrictions());
			////////System.out.println("Response String:::::::::"+supplierBeanObj.getSupplierMaster().isProductRestrictions());
			if(operation.equals("view"))
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SupplierMaster/viewSupplier");
			else{
				modelAndViewObj.addObject("type", "edit");
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SupplierMaster/editSupplier");
			}
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		
		modelAndViewObj.addObject("maxRecords",maxRecords);
		modelAndViewObj.addObject("searchName",searchName);
		
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 *  Created On: 3-mar-2015
	 *  
	 * This method is used to save the details of the New Supplier.
	 * It accepts all the details of the supplier.
	 * It returns the newSupplier JSP, along with message or creation successful or not and currenciesList
	 *
	 **/
	@RequestMapping(value="/createSupplier",method=RequestMethod.POST)
	public ModelAndView createSupplier(@RequestParam("formData") String formData,@RequestParam("itemDetails") String itemDetails,@RequestParam("supplierAddresses") String supplierAddresses,
			@RequestParam("maxRecords") String maxRecords, @RequestParam("searchName")String searchName,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("create Supplier");
			SupplierBean supplierBean = new SupplierBean();
			supplierBean = gson.fromJson(formData, SupplierBean.class);
			if(supplierBean.getRating() != null && "".equals(supplierBean.getRating()))
				supplierBean.setRating("0");
			if(supplierBean.getrFactor() != null && "".equals(supplierBean.getrFactor()))
				supplierBean.setrFactor(null);
			if(supplierBean.getMaxFactor() != null && "".equals(supplierBean.getMaxFactor()))
				supplierBean.setMaxFactor(null);
			if(supplierBean.getProductRestrictionsStr().equals("0")){
				supplierBean.setProductRestrictions(true);
			}else{
				supplierBean.setProductRestrictions(false);
			}
			
			if(supplierBean.getStatusStr().equals("0")){
				supplierBean.setStatus(false);
			}else{
				supplierBean.setStatus(true);
			}	
			
			if(supplierBean.getGstn_num().equals("")) {
				supplierBean.setGstn_num(null);
			}
			
				supplierBean.setStatusOrder("Submitted");
			
			ArrayList<SupplierProducts> itemDetailsList = new ArrayList<SupplierProducts>();
			itemDetails = Response.getResponseList(itemDetails, "itemDetails");
			SupplierProducts goodsReceiptsItems = null;
			JSONArray jsonArray = new JSONArray(itemDetails);
			for (int i=0; i<jsonArray.length(); i++) {
				goodsReceiptsItems = gson.fromJson(jsonArray.getString(i), SupplierProducts.class);
				itemDetailsList.add(goodsReceiptsItems);
			}
			supplierBean.setSupplierProducts(itemDetailsList);
			
			ArrayList<SupplierAddresses> AddressesList = new ArrayList<SupplierAddresses>();
			supplierAddresses = Response.getResponseList(supplierAddresses, "supplierAddresses");
			SupplierAddresses supplierAddreseslist = null;
			JSONArray jsonArray2 = new JSONArray(supplierAddresses);
			for (int i=0; i<jsonArray2.length(); i++) {
				supplierAddreseslist = gson.fromJson(jsonArray2.getString(i), SupplierAddresses.class);
				AddressesList.add(supplierAddreseslist);
			}
			supplierBean.setSupplierAddresses(AddressesList);
			
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = outletMasterServiceObj.createSupplier(supplierBean,customerIdStr,emailIdStr);
			modelAndViewObj = new ModelAndView();
			List<String> currenciesList = adminServiceObj.getCurrenciesList(customerIdStr, emailIdStr);
			modelAndViewObj.addObject("currencyList",currenciesList);
			States states = genericMasterServiceObj.getStates();
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("SUPPLIER_CREATE_SUCCESS").trim())){
			
				
				modelAndViewObj.addObject("states", states);
				
				modelAndViewObj.addObject("supplierBean", supplierBean);
				modelAndViewObj.addObject("err", resultStr);
				modelAndViewObj.addObject("type", "new");
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SupplierMaster/editSupplier");
			}else{
				modelAndViewObj.addObject("succcess", resultStr);
				modelAndViewObj.addObject("states", states);
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SupplierMaster/newSupplier");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		modelAndViewObj.addObject("maxRecords",maxRecords);
		modelAndViewObj.addObject("searchName", searchName);
		return modelAndViewObj;
	}
	
	
	
	@RequestMapping("/getSupplierDetails")
	public @ResponseBody SupplierBean getSupplierDetails(@RequestParam("firmName") String firmName, HttpServletRequest request,HttpServletResponse response){
		SupplierBean supplierBean = null;
		try{
			// log.info("getSupplierDetails");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			SupplierBean supplierBeanObj = outletMasterServiceObj.getSupplierByFirmName(customerIdStr, emailIdStr,firmName);
			if(supplierBeanObj != null)
			{
				supplierBean = supplierBeanObj.getSupplierMaster();
			}
			
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return supplierBean;
	}
	/**
	 * 
	 * @author Mythri.S
	 * Created on: 4-mar-2015.
	 * 
	 * This method is used to save the details of the already existing supplier.
	 * It accepts all the details of the supplier.
	 * It returns the editSupplier JSP, along with message or updation successful or not and currenciesList
	 *
	 **/
	@RequestMapping(value="/updateSupplier",method=RequestMethod.POST)
	public ModelAndView updateSupplier(@RequestParam("formData") String formData,@RequestParam("itemDetails") String itemDetails,@RequestParam("supplierAddresses") String supplierAddresses,
			@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName, HttpServletRequest request,HttpServletResponse response) {
		try{
			SupplierBean supplierBean = new SupplierBean();
			supplierBean = gson.fromJson(formData, SupplierBean.class);
			if(supplierBean.getRating() != null && "".equals(supplierBean.getRating()))
				supplierBean.setRating("0");
			if(supplierBean.getrFactor() != null && "".equals(supplierBean.getrFactor()))
				supplierBean.setrFactor(null);
			if(supplierBean.getMaxFactor() != null && "".equals(supplierBean.getMaxFactor()))
				supplierBean.setMaxFactor(null);
			if(supplierBean.getProductRestrictionsStr().equals("0")){
				supplierBean.setProductRestrictions(true);
			}else{
				supplierBean.setProductRestrictions(false);
			}
			if(supplierBean.getStatusStr().equals("0")){
				supplierBean.setStatus(false);
			}else{
				supplierBean.setStatus(true);
			}
			if(supplierBean.getGstn_num().equals("")) {
				supplierBean.setGstn_num(null);
			}
			//supplierBean.setStatusOrder(statusOrder);
			ArrayList<SupplierProducts> itemDetailsList = new ArrayList<SupplierProducts>();
			itemDetails = Response.getResponseList(itemDetails, "itemDetails");
			SupplierProducts goodsReceiptsItems = null;
			JSONArray jsonArray = new JSONArray(itemDetails);
			for (int i=0; i<jsonArray.length(); i++) {
				goodsReceiptsItems = gson.fromJson(jsonArray.getString(i), SupplierProducts.class);
				if(goodsReceiptsItems.getsNo() != null && "".equals(goodsReceiptsItems.getsNo()))
					goodsReceiptsItems.setsNo(null);
				itemDetailsList.add(goodsReceiptsItems);
			}
			supplierBean.setSupplierProducts(itemDetailsList);
			
			ArrayList<SupplierAddresses> AddressesList = new ArrayList<SupplierAddresses>();
			supplierAddresses = Response.getResponseList(supplierAddresses, "supplierAddresses");
			SupplierAddresses supplierAddreseslist = null;
			JSONArray jsonArray2 = new JSONArray(supplierAddresses);
			for (int i=0; i<jsonArray2.length(); i++) {
				supplierAddreseslist = gson.fromJson(jsonArray2.getString(i), SupplierAddresses.class);
				AddressesList.add(supplierAddreseslist);
			}
			supplierBean.setSupplierAddresses(AddressesList);
			
			
			// log.info("update Supplier");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = outletMasterServiceObj.updateSupplier(supplierBean,customerIdStr,emailIdStr);
			SupplierBean supplierBeanObj = outletMasterServiceObj.getSupplierByFirmName(customerIdStr, emailIdStr,supplierBean.getSupplierCode());
			List<String> currenciesList = adminServiceObj.getCurrenciesList(customerIdStr, emailIdStr);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("currencyList",currenciesList);
			States states = genericMasterServiceObj.getStates();
			
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("SUPPLIER_UPDATE_SUCCESS").trim()))
				modelAndViewObj.addObject("err", resultStr);
			else
				modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.addObject("nextWorkFlowStates", supplierBeanObj.getSupplierMaster().getNextWorkFlowStates());
			//modelAndViewObj.addObject("PreviousWorkFlowLogList", supplierBeanObj.getPreviousWorkFlowLogList());
			modelAndViewObj.addObject("previousStates", supplierBeanObj.getSupplierMaster().getPreviousStates());
			modelAndViewObj.addObject("type", "edit");
			modelAndViewObj.addObject("supplierBean", supplierBeanObj.getSupplierMaster());
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);
			modelAndViewObj.addObject("states", states);
			
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SupplierMaster/editSupplier");
		}catch(Exception e){
			e.printStackTrace();
		}
	
		return modelAndViewObj;
	}
	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 4-mar-2015.
	 * 
	 * This method is used to delete the suppliers
	 * It accepts the ids that need to be deleted.
	 * It retrieves the suppliersList to display in the table.
	 * It also sends the message of successful deletion or not.
	 * 
	 **/
	@RequestMapping("/deleteSupplier")
	public ModelAndView deleteSupplier(@RequestParam("ids") String ids,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName, HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("deleteSupplier ");
			modelAndViewObj = new ModelAndView();
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			String result = outletMasterServiceObj.deleteSupplier(customerId,emailId ,ids);
			List<Suppliers> supplierList = outletMasterServiceObj.getSuppliers(customerId, emailId,"0",maxRecords,searchName);
			modelAndViewObj = new ModelAndView();
			if(supplierList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(supplierList.size()<end){
					end = (supplierList.size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(supplierList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("supplierList", supplierList);
			////modelAndViewObj.addObject("err", result);
			if(result.contains("Success"))
				modelAndViewObj.addObject("success", result);
				else
				modelAndViewObj.addObject("err", result);
			
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SupplierMaster/supplierMaster");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		modelAndViewObj.addObject("maxRecords",maxRecords);
		modelAndViewObj.addObject("searchName",searchName);
		return modelAndViewObj;
	}
	
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 6-may-2015.
	 * 
	 * This method is used to search supplier.
	 * It returns the supplier list matching the search string
	 * 
	 */

	@RequestMapping("/searchSupplierMater")
	public ModelAndView searchSupplierMater(@RequestParam("searchName") String searchNameStr,@RequestParam("maxRecords")String maxRecords, @RequestParam("index") String index,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<SupplierBean> suppliersList = new ArrayList<SupplierBean>();
		try{
			// log.info("searchSupplierMater");
			int start = 1,end = Integer.parseInt(maxRecords);
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			suppliersList = outletMasterServiceObj.searchSuppliers(customerIdStr, emailIdStr,searchNameStr,index,maxRecords);
			modelAndViewObj = new ModelAndView();
			if(suppliersList == null || suppliersList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(suppliersList.size()<end){
					end = (suppliersList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(suppliersList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("maxRecords", maxRecords); 
			modelAndViewObj.addObject("supplierList", suppliersList);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SupplierMaster/supplierMaster");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display all the sku details in a tabular form
	 *
	 **/
	@SuppressWarnings("unchecked")
	@RequestMapping("/viewSkuMaster")
	public ModelAndView viewSkuMaster(@RequestParam("searchName") String searchName,@RequestParam("subcategory") String subcategory,@RequestParam("brand") String brand,@RequestParam("department") String department,@RequestParam("supplierid") String supplierid,@RequestParam("status") String status,@RequestParam("productCategory") String productCategory,@RequestParam("location") String location,@RequestParam("maxRecords") String maxRecords,@RequestParam("index") String index,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewSkuMaster ");
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
//			List<String> locationsList = adminServiceObj.getOutletLocationsList(customerId,emailId,false);
			ArrayList<LocationBean> locationsList =	genericMasterServiceObj.getLocationDetails("",customerId, emailId,"-1","Retail Outlet",false,true,false);
			//added by vijay , in case of empty location first occurance of lications list will considered as default location
			/*if((location.trim()).equals(null) || location.trim().isEmpty())
				location= locationsList.get(0).getLocationId();*/
			
			if(location == ""){
				location = locationsList.get(0).getLocationId();
			}
			
			
			List<Sku> skuList = skuServiceObj.getSKUDetails(null, customerId, emailId,index,maxRecords,location,productCategory,subcategory,brand,department,supplierid,status,searchName,"");
			
			
		
//			////////System.out.println(skuList.get(0).getSkuPriceLists().g);
			List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
			if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
				categoryList = outletMasterServiceObj.getCategoryDetails("",customerId, emailId,"-1","");
				request.getSession().setAttribute("categoryList", categoryList);
			}
			List<Suppliers> supplierList =(List<Suppliers>)request.getSession().getAttribute("supplierList");
			if(supplierList==null || supplierList.size()==0 || supplierList.isEmpty()){
				 supplierList = outletMasterServiceObj.getSuppliers(customerId, emailId,"-1","","");
				request.getSession().setAttribute("supplierList", supplierList);
			}
			List<Department> departmentList =(List<Department>)request.getSession().getAttribute("departmentList");
			if(departmentList==null || departmentList.size()==0 || departmentList.isEmpty()){
				departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerId, emailId,index,false);
				request.getSession().setAttribute("departmentList", departmentList);
			}
			List<String> brandsList =(List<String>)request.getSession().getAttribute("brandsList");
			//if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
				brandsList = adminServiceObj.getBrandNamesList(customerId,emailId);
				request.getSession().setAttribute("brandsList", brandsList);
			//}
			modelAndViewObj = new ModelAndView();
			if(skuList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(skuList.size()<end){
					end = (skuList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(skuList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("maxRecords", maxRecords);
			
			}
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("subcategory", subcategory);
			modelAndViewObj.addObject("brand", brand);
			modelAndViewObj.addObject("supplierid", supplierid);
			modelAndViewObj.addObject("department", department);
			modelAndViewObj.addObject("status", status);
//			modelAndViewObj.addObject("brandsList", brandsList);
			modelAndViewObj.addObject("searchName", searchName);
			modelAndViewObj.addObject("category", productCategory);
			modelAndViewObj.addObject("skuList", skuList);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SkuMaster/skuMaster");
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
	 *This method is used to display the New sku form
	 *
	 **/
	@RequestMapping("/newSku")
	public ModelAndView newSku(HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("newSku ");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
//			List<String> brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
			ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails("",customerIdStr, emailIdStr,"-1",false,"");
			List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("taxDetails",taxDetails);
//			modelAndViewObj.addObject("brandsList",brandsList);
			modelAndViewObj.addObject("type","new");
			modelAndViewObj.addObject("customerId",customerIdStr);
			
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SkuMaster/newDetailAndQuickSku");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to save the details of the Sku
	 *
	 **/
	@RequestMapping(value="/createQuickSku",method=RequestMethod.POST,consumes="application/json")
	public void createQuickSku(@RequestBody Sku obj_SkuMasterBean,HttpServletRequest request,HttpServletResponse response) {
//		String locationListAll="";
		String jsonString=null;
		try{
			// log.info("createSku");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
//			List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
			String resultStr = skuServiceObj.createSku(obj_SkuMasterBean,customerIdStr,emailIdStr);
			modelAndViewObj = new ModelAndView();
			if(resultStr.equals(AppProperties.getAppMessageByProperty("SKU_CREATE_SUCCESS").trim()))
				 jsonString= "{\"success\":\""+resultStr+"\",\"code\":\""+0+"\"}";
			else
				 jsonString = "{\"error\":\""+resultStr+"\",\"code\":\""+1+"\"}";
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
	    	response.getWriter().write(jsonString);
			/*modelAndViewObj.addObject("errorDisplay", "errorDisplay");
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("SKU_CREATE_SUCCESS").trim())){
				modelAndViewObj.addObject("sku", obj_SkuMasterBean);
				modelAndViewObj.addObject("skuPriceList", obj_SkuMasterBean.getSkuPriceLists());
				modelAndViewObj.addObject("err", resultStr);
				modelAndViewObj.addObject("type", "new");
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SkuMaster/newDetailAndQuickSku");
			}else{
				modelAndViewObj.addObject("type", "new");
				modelAndViewObj.addObject("success", resultStr);
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SkuMaster/newDetailAndQuickSku");
			}
			ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails("",customerIdStr, emailIdStr,"-1",false,"");
			List<String> brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
			modelAndViewObj.addObject("brandsList",brandsList);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("taxDetails",taxDetails);*/
			
		}catch(Exception e){
			e.printStackTrace();
		}
//		return modelAndViewObj;
	}
	
	
	
	
	/**
	 * 
	 * @author 
	 * 	 * 
	 *This method is used to save the details of the Sku
	 *
	 **//*
	@RequestMapping(value="/updateQuickSku",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView updateQuickSku(@RequestBody Sku obj_SkuMasterBean,HttpServletRequest request,HttpServletResponse response) {
		String locationListAll="";
		try{
			// log.info("createSku");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
			String resultStr = skuServiceObj.updateSku(obj_SkuMasterBean,customerIdStr,emailIdStr);
			modelAndViewObj = new ModelAndView();
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("SKU_UPDATE_SUCCESS").trim()))
				modelAndViewObj.addObject("err", resultStr);
			else
				modelAndViewObj.addObject("success", resultStr);
			ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails("",customerIdStr, emailIdStr,"-1",false,"");
			List<String> brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
			modelAndViewObj.addObject("brandsList",brandsList);
			modelAndViewObj.addObject("sku",obj_SkuMasterBean);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("taxDetails",taxDetails);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SkuMaster/newDetailAndQuickSku");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	*/
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to save the details of the Sku
	 *
	 **/
	@RequestMapping(value="/createSku",method=RequestMethod.POST,consumes="application/json")
	public void createSku(@RequestBody Sku obj_SkuMasterBean,HttpServletRequest request,HttpServletResponse response) {
	String jsonString=null;
		try{
			// log.info("createSku");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = skuServiceObj.createSku(obj_SkuMasterBean,customerIdStr,emailIdStr);
			modelAndViewObj = new ModelAndView();
			if(resultStr.equals(AppProperties.getAppMessageByProperty("SKU_CREATE_SUCCESS").trim()))
				 jsonString= "{\"success\":\""+resultStr+"\",\"code\":\""+0+"\"}";
			else
				 jsonString = "{\"error\":\""+resultStr+"\",\"code\":\""+1+"\"}";
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
	    	response.getWriter().write(jsonString);
			
			/*List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("SKU_CREATE_SUCCESS").trim())){
				Set<String> productRangeList = new HashSet<String>();
				Set<String> measurementRangeList = new HashSet<String>();
				Set<String> selectedLocationsList = new HashSet<String>();
				
				Set<String> utilityRangeList = new HashSet<String>();
				Set<String> sizeRangeList = new HashSet<String>();
				Set<String> colourRangeList = new HashSet<String>();
				Set<String> styleRangeList = new HashSet<String>();
				Set<String> batchRangeList = new HashSet<String>();
				
				
				if(obj_SkuMasterBean.getSkuPriceLists() != null)
					for(SkuPriceList skuPriceList : obj_SkuMasterBean.getSkuPriceLists()){
						if(skuPriceList.getProductRange() != null && !skuPriceList.getProductRange().equals(""))
							productRangeList.add(skuPriceList.getProductRange());
						if(skuPriceList.getMeasureRange() != null && !skuPriceList.getMeasureRange().equals(""))
							measurementRangeList.add(skuPriceList.getMeasureRange());
						if(skuPriceList.getUtility() != null && !skuPriceList.getUtility().equals(""))
							utilityRangeList.add(skuPriceList.getUtility());
						if(skuPriceList.getSize() != null && !skuPriceList.getSize().equals(""))
							sizeRangeList.add(skuPriceList.getSize());
						if(skuPriceList.getColor() != null && !skuPriceList.getColor().equals(""))
							colourRangeList.add(skuPriceList.getColor());
						if(skuPriceList.getStyleRange() != null && !skuPriceList.getStyleRange().equals(""))
							styleRangeList.add(skuPriceList.getStyleRange());
						if(skuPriceList.getProductBatchNo() != null && !skuPriceList.getProductBatchNo().equals(""))
							batchRangeList.add(skuPriceList.getProductBatchNo());
						
						selectedLocationsList.add(skuPriceList.getStoreLocation());
						skuPriceList.setStoreLocationId(skuPriceList.getStoreLocation().replaceAll(" ", "_"));
					}
				
				obj_SkuMasterBean.setUtilityRangeList(utilityRangeList);
				obj_SkuMasterBean.setColourRangeList(colourRangeList);
				obj_SkuMasterBean.setSizeRangeList(sizeRangeList);
				obj_SkuMasterBean.setBatchRangeList(batchRangeList);
				obj_SkuMasterBean.setStyleRangeList(styleRangeList);
				
				obj_SkuMasterBean.setProductRangeList(productRangeList);
				obj_SkuMasterBean.setMeasurementRangeList(measurementRangeList);
				obj_SkuMasterBean.setSelectedLocationsList(selectedLocationsList);
				Set<String> selectedLocationsIdList = new HashSet<String>();
				for(String location : workLocationsList)
					selectedLocationsIdList.add(location.replaceAll(" ", "_"));
				obj_SkuMasterBean.setSelectedLocationsIdList(selectedLocationsIdList);
				modelAndViewObj.addObject("sku", obj_SkuMasterBean);
				modelAndViewObj.addObject("err", resultStr);
				modelAndViewObj.addObject("type", "new");
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SkuMaster/editSku");
			}else{
				modelAndViewObj.addObject("success", resultStr);
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SkuMaster/newSku");
			}
			ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails("",customerIdStr, emailIdStr,"-1",false,"");
			List<String> brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
			modelAndViewObj.addObject("brandsList",brandsList);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("taxDetails",taxDetails);*/
	    	
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
//		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display the Edit Sku form with all the details of the Sku
	 *
	 **/
	@RequestMapping("/editSku")
	public ModelAndView editSku(@RequestParam("skuID") String skuID,@RequestParam("operation") String operation,@RequestParam("formData") String formData,HttpServletRequest request,
			HttpServletResponse response){
		try{
			// log.info("editSku");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String decimalFormat = (String)request.getSession().getAttribute("decimalFormat");
			List<Sku> skuList = skuServiceObj.getSKUDetails(skuID, customerIdStr, emailIdStr,"0","10","","","","","","","","","");
//			List<Suppliers> supplierList = outletMasterServiceObj.getSuppliers(customerIdStr, emailIdStr,"-1","","");
			//getDecimalFormat();
			Set<String> MulEans = new HashSet<String>();
            ////////System.out.println(skuList.get(0).getEans());
            for(SkuEans ean : skuList.get(0).getEans()){
          	  MulEans.add(ean.getEan());
            }
            List<String> multipleEan = new ArrayList<String>(MulEans);
		    //System.out.println(multipleEan);
		    Double value=3.5555;
		    
			ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails("",customerIdStr, emailIdStr,"-1",false,"");
			List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			Set<String> selectedLocationsIdList = new HashSet<String>();
			for(String location : workLocationsList)
				selectedLocationsIdList.add(location.replaceAll(" ", "_"));
			if(skuList != null && skuList.size() > 0){
				for(String location : skuList.get(0).getSelectedLocationsList()){
					if(!selectedLocationsIdList.contains(location))
						selectedLocationsIdList.add(location.replaceAll(" ", "_"));
				}
				skuList.get(0).setSelectedLocationsIdList(selectedLocationsIdList);
			}

//			skuList.get(0).setSelectedLocationsIdList(selectedLocationsIdList);
//			List<String> brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
			List<SkuPriceList> skupriceList= new ArrayList<SkuPriceList>();
			skupriceList.addAll(skuList.get(0).getSkuPriceLists());
			
			
			
			
			/*convertionObj = new FormatConverter();
			//double sale=(double)skupriceList.get(0).getSalePrice();
			double sale=10.2222222222;
			Double sales=convertionObj.decimalFormat(sale,decimalFormat);
			skupriceList.get(0).setSalePrice(sales.floatValue());
	*/
			
			
			
			
			
			modelAndViewObj = new ModelAndView();
//			modelAndViewObj.addObject("brandsList",brandsList);
			modelAndViewObj.addObject("sku", skuList.get(0));
			modelAndViewObj.addObject("multipleEanPriceList", skuList.get(0).getEans());
		 	
			

			modelAndViewObj.addObject("skuMaxSaleQty", skupriceList.get(0).getMax_sale_qty());
			modelAndViewObj.addObject("type", operation);
//			modelAndViewObj.addObject("supplierList", supplierList);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("taxDetails",taxDetails);
			//added by manasa 
			Sku skuObj=gson.fromJson(formData, Sku.class);
			modelAndViewObj.addObject("skuObj",skuObj);
			modelAndViewObj.addObject("multipleEan", multipleEan);
//			////////System.out.println("dsgsdg");
			if(operation.equals("view"))
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SkuMaster/newDetailAndQuickSku");
			else
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SkuMaster/newDetailAndQuickSku");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	

	/*private void getDecimalFormat() {
		String s = RequestHeaderUtil.getRequestHeader(sessionScope).getDecimalFormat();
		System.out.println(s);
		
	}*/

	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to update the details of the Sku
	 *
	 **/
	@RequestMapping(value="/updateSku",method=RequestMethod.POST,consumes="application/json")
	public void updateSku(@RequestBody Sku obj_SkuMasterBean,HttpServletRequest request,HttpServletResponse response) {
		String jsonString = null;
		try{
			// log.info("update Sku");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String result = skuServiceObj.updateSku(obj_SkuMasterBean,customerIdStr,emailIdStr);
		
			if(result.equals(AppProperties.getAppMessageByProperty("SKU_UPDATE_SUCCESS").trim()))
				 jsonString= "{\"success\":\""+result+"\",\"code\":\""+0+"\"}";
			else
				 jsonString = "{\"error\":\""+result+"\",\"code\":\""+1+"\"}";
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
	    	response.getWriter().write(jsonString);
			
			/*List<Suppliers> supplierList = outletMasterServiceObj.getSuppliers(customerIdStr, emailIdStr,"-1","","");
			List<Sku> skuList = skuServiceObj.getSKUDetails(obj_SkuMasterBean.getSkuId(), customerIdStr, emailIdStr,"0","10","","","","","","","","");
			ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails("",customerIdStr, emailIdStr,"-1",false,"");
			List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
			Set<String> selectedLocationsIdList = new HashSet<String>();
			for(String location : workLocationsList)
				selectedLocationsIdList.add(location.replaceAll(" ", "_"));
			if(skuList != null && skuList.size() > 0){
				for(String location : skuList.get(0).getSelectedLocationsList()){
					if(!selectedLocationsIdList.contains(location))
						selectedLocationsIdList.add(location.replaceAll(" ", "_"));
				}
				skuList.get(0).setSelectedLocationsIdList(selectedLocationsIdList);
			}

//			skuList.get(0).setSelectedLocationsIdList(selectedLocationsIdList);
			modelAndViewObj = new ModelAndView();
			List<String> brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
			modelAndViewObj.addObject("brandsList",brandsList);
			modelAndViewObj.addObject("supplierList", supplierList);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("taxDetails",taxDetails);
			modelAndViewObj.addObject("sku", skuList.get(0));
			modelAndViewObj.addObject("skuObj", obj_SkuMasterBean);
			modelAndViewObj.addObject("type", "edit");
			if(!result.equals(AppProperties.getAppMessageByProperty("SKU_UPDATE_SUCCESS").trim()))
				modelAndViewObj.addObject("err", result);
			else
				modelAndViewObj.addObject("success", result);*/
//			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SkuMaster/newDetailAndQuickSku");
		}catch(Exception e){
			e.printStackTrace();
		}
//		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Surya.k
	 * 
	 *This method is used to update the details of the Sku
	 *
	 **/
	@RequestMapping(value="/quickEditSku",method=RequestMethod.POST,consumes="application/json")
	public void quickEditSku(@RequestBody Sku obj_SkuMasterBean,HttpServletRequest request,HttpServletResponse response) {
		String jsonString = null;
		try{
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String result = skuServiceObj.quickEditSku(obj_SkuMasterBean,customerIdStr,emailIdStr);
		
			if(result.equals(AppProperties.getAppMessageByProperty("SKU_UPDATE_SUCCESS").trim()))
				 jsonString= "{\"success\":\""+result+"\",\"code\":\""+0+"\"}";
			else
				 jsonString = "{\"error\":\""+result+"\",\"code\":\""+1+"\"}";
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
	    	response.getWriter().write(jsonString);
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	
	
	
	/**
	 * 
	 * @author Manasa.P
	 * Created_On : 5-12-2017
	 *This method is used to update the details of the Sku Price
	 *
	 **/
	@RequestMapping(value="/updateSkuPriceAll",method=RequestMethod.POST,consumes="application/json")
	public  ModelAndView updateSkuPriceAll(@RequestBody Sku obj_SkuMasterBean,HttpServletRequest request,HttpServletResponse response) {
		String location="";
		try{
			// log.info("update Sku");
			//////////System.out.println("update Sku Price");
			int start = 1,end = Integer.parseInt(obj_SkuMasterBean.getMaxRecords());
			String index="0";
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String result = skuServiceObj.updateSkuPrice(obj_SkuMasterBean,customerIdStr,emailIdStr);
			List<String> locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
			if((location.trim()).equals(null) || location.trim().isEmpty())
			{
				location = locationsList.get(0);
			}
			List<Sku> skuList = skuServiceObj.getSKUDetails(null, customerIdStr, emailIdStr,"0","10",obj_SkuMasterBean.getStoreLocation(),"","","","","","","","");
			modelAndViewObj = new ModelAndView();
			if(skuList!=null){
			modelAndViewObj.addObject("totalRecords", skuList.get(0).getTotalRecords());
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(obj_SkuMasterBean.getMaxRecords()));
			modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("selectedLocation", obj_SkuMasterBean.getStoreLocation());
			modelAndViewObj.addObject("outletlocationsList", locationsList);
			modelAndViewObj.addObject("priceUpdateList",skuList);
		//	modelAndViewObj.addObject("countId",obj_SkuMasterBean.getExpandCount());
			if(!result.equals(AppProperties.getAppMessageByProperty("PRICE_UPDATE_SUCCESS").trim()))
				modelAndViewObj.addObject("err", result);
			else
				modelAndViewObj.addObject("success", result);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/viewPriceUpdate");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	
	/**
	 * 
	 * @author Manasa.P
	 * Created_On : 5-12-2017
	 *This method is used to update the details of the Sku Price
	 *
	 **/
	
	@RequestMapping(value="/updateSkuPrice",method=RequestMethod.POST,consumes="application/json")
	public void  updateSkuPrice(@RequestBody Sku obj_SkuMasterBean,HttpServletRequest request,HttpServletResponse response) {
//		String location="";
		String result =null;
		String jsonString = null;
		try{
			// log.info("update Sku");
			//////////System.out.println("update Sku Price");
//			String columnIndex = obj_SkuMasterBean.getStartIndex();
			obj_SkuMasterBean.setStartIndex(null);
//			int start = 1,end = Integer.parseInt(obj_SkuMasterBean.getMaxRecords());
//			String index="0";
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			result = skuServiceObj.updateSkuPrice(obj_SkuMasterBean,customerIdStr,emailIdStr);
			//////////System.out.println(result);
			
			if(result.equals(AppProperties.getAppMessageByProperty("PRICE_UPDATE_SUCCESS").trim()))
				 jsonString= "{\"success\":\""+result+"\",\"code\":\""+0+"\"}";
			else
				 jsonString = "{\"error\":\""+result+"\",\"code\":\""+1+"\"}";
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
	    	response.getWriter().write(jsonString);
			
			/*List<String> locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
			if((location.trim()).equals(null) || location.trim().isEmpty())
			{
				location = locationsList.get(0);
			}
			List<Sku> skuList = skuServiceObj.getSKUDetails(null, customerIdStr, emailIdStr,"0","10",obj_SkuMasterBean.getStoreLocation(),"","","","","","","");
			modelAndViewObj = new ModelAndView();
			if(skuList!=null){
			modelAndViewObj.addObject("totalRecords", skuList.get(0).getTotalRecords());
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(obj_SkuMasterBean.getMaxRecords()));
			modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("selectedLocation", obj_SkuMasterBean.getStoreLocation());
			modelAndViewObj.addObject("outletlocationsList", locationsList);
			modelAndViewObj.addObject("priceUpdateList",skuList);
			modelAndViewObj.addObject("columnIndex",columnIndex);
			if(!result.equals(AppProperties.getAppMessageByProperty("PRICE_UPDATE_SUCCESS").trim()))
				modelAndViewObj.addObject("err", result);
			else
				modelAndViewObj.addObject("success", result);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/viewPriceUpdate");
			*/
	    	
		}catch(Exception e){
			e.printStackTrace();
			
		}
		/*return response;*/
	}
	
	
	
	
	
	
	/**
	 * 
	 * @author Manasa.P
	 * Created_On : 28-09-2017
	 *This method is used to update the details of the Sku Price
	 *
	 **/
	
	@RequestMapping(value="/updateStock",method=RequestMethod.POST,consumes="application/json")
	public void  updateStock(@RequestBody WareHouseSku obj_SkuMasterBean,HttpServletRequest request,HttpServletResponse response) {
//		String location="";
		String result =null;
		String jsonString = null;
		try{
			// log.info("update Sku");
			//////////System.out.println("update Sku Price");
//			String columnIndex = obj_SkuMasterBean.getStartIndex();
//			obj_SkuMasterBean.setStartIndex(null);
//			int start = 1,end = Integer.parseInt(obj_SkuMasterBean.getMaxRecords());
//			String index="0";
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			
			result = skuServiceObj.updateStocks(obj_SkuMasterBean,customerIdStr,emailIdStr);
			//////////System.out.println(result);
			if(result.equals(AppProperties.getAppMessageByProperty("STOCK_UPDATED_SUCCESSFULLY").trim()))
				 jsonString= "{\"success\":\""+result+"\",\"code\":\""+0+"\"}";
			else
				 jsonString = "{\"error\":\""+result+"\",\"code\":\""+1+"\"}";
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
	    	response.getWriter().write(jsonString);
			
			/*List<String> locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
			if((location.trim()).equals(null) || location.trim().isEmpty())
			{
				location = locationsList.get(0);
			}
			List<Sku> skuList = skuServiceObj.getSKUDetails(null, customerIdStr, emailIdStr,"0","10",obj_SkuMasterBean.getStoreLocation(),"","","","","","","");
			modelAndViewObj = new ModelAndView();
			if(skuList!=null){
			modelAndViewObj.addObject("totalRecords", skuList.get(0).getTotalRecords());
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(obj_SkuMasterBean.getMaxRecords()));
			modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("selectedLocation", obj_SkuMasterBean.getStoreLocation());
			modelAndViewObj.addObject("outletlocationsList", locationsList);
			modelAndViewObj.addObject("priceUpdateList",skuList);
			modelAndViewObj.addObject("columnIndex",columnIndex);
			if(!result.equals(AppProperties.getAppMessageByProperty("PRICE_UPDATE_SUCCESS").trim()))
				modelAndViewObj.addObject("err", result);
			else
				modelAndViewObj.addObject("success", result);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/viewPriceUpdate");
			*/
	    	
		}catch(Exception e){
			e.printStackTrace();
			
		}
		/*return response;*/
	}
	
	
	
	
	/**
	 * 
	 * @author Manasa.P
	 * Created_On : 28-09-2017
	 *This method is used to update the details of the Sku Price
	 *
	 **/
	
	@RequestMapping(value="/updateOutletStock",method=RequestMethod.POST,consumes="application/json")
	public void  updateOutletStock(@RequestBody Sku obj_SkuMasterBean,HttpServletRequest request,HttpServletResponse response) {
//		String location="";
		String result =null;
		String jsonString = null;
		try{
			// log.info("update Sku");
			////////System.out.println("update");
			//////////System.out.println("update Sku Price");
//			String columnIndex = obj_SkuMasterBean.getStartIndex();
//			obj_SkuMasterBean.setStartIndex(null);
//			int start = 1,end = Integer.parseInt(obj_SkuMasterBean.getMaxRecords());
//			String index="0";
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			result = skuServiceObj.updateOutletStock(obj_SkuMasterBean,customerIdStr,emailIdStr);
			//////////System.out.println(result);
			if(result.equals(AppProperties.getAppMessageByProperty("STOCK_UPDATED_SUCCESSFULLY").trim()))
				 jsonString= "{\"success\":\""+result+"\",\"code\":\""+0+"\"}";
			else
				 jsonString = "{\"error\":\""+result+"\",\"code\":\""+1+"\"}";
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
	    	response.getWriter().write(jsonString);
			
			/*List<String> locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
			if((location.trim()).equals(null) || location.trim().isEmpty())
			{
				location = locationsList.get(0);
			}
			List<Sku> skuList = skuServiceObj.getSKUDetails(null, customerIdStr, emailIdStr,"0","10",obj_SkuMasterBean.getStoreLocation(),"","","","","","","");
			modelAndViewObj = new ModelAndView();
			if(skuList!=null){
			modelAndViewObj.addObject("totalRecords", skuList.get(0).getTotalRecords());
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(obj_SkuMasterBean.getMaxRecords()));
			modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("selectedLocation", obj_SkuMasterBean.getStoreLocation());
			modelAndViewObj.addObject("outletlocationsList", locationsList);
			modelAndViewObj.addObject("priceUpdateList",skuList);
			modelAndViewObj.addObject("columnIndex",columnIndex);
			if(!result.equals(AppProperties.getAppMessageByProperty("PRICE_UPDATE_SUCCESS").trim()))
				modelAndViewObj.addObject("err", result);
			else
				modelAndViewObj.addObject("success", result);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/viewPriceUpdate");
			*/
	    	
		}catch(Exception e){
			e.printStackTrace();
			
		}
		/*return response;*/
	}
	
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 25-jul-2015.
	 * 
	 *  This method is used to delete the skuIds.
	 *  It retrieves the skus and returns to display in a tabular format.
	 *  
	 *
	 **/
	@RequestMapping("/deleteSku")
	public ModelAndView deleteSku(@RequestParam("ids") String ids,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("deleteSku ");
			int start = 1,end = 10;
			modelAndViewObj = new ModelAndView();
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			String result = skuServiceObj.deleteSku(customerId,emailId ,ids);
			List<Sku> skuList = skuServiceObj.getSKUDetails(null, customerId, emailId,"0","10","","","","","","","","","");
			if(skuList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(skuList.size()<10){
					end = (skuList.size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(skuList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("err", result);
			modelAndViewObj.addObject("skuList", skuList);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SkuMaster/skuMaster");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	@RequestMapping("/searchSkuMaster")
	public ModelAndView searchSkuMaster(@RequestParam("subcategory") String subcategory,@RequestParam("brand") String brand,@RequestParam("department") String department,@RequestParam("supplierid") String supplierid,@RequestParam("status") String status,@RequestParam("productCategory") String productCategory,@RequestParam("location") String location,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index, HttpServletRequest request,HttpServletResponse response) {
		String customerId = null,emailId=null;
		try{
			// log.info("searchSkuMaster");
			int start = 1,end = Integer.parseInt(maxRecords);
			customerId = (String)request.getSession().getAttribute("customerId");
			emailId = (String)request.getSession().getAttribute("emailId");
			List<Sku> skuList = skuServiceObj.getSKUDetails(null, searchNameStr, emailId,index,maxRecords,location,productCategory,subcategory,brand,department,supplierid,status,searchNameStr,"");
//			List<String> locationsList = adminServiceObj.getOutletLocationsList(customerId,emailId,false);
			ArrayList<LocationBean> locationsList =	genericMasterServiceObj.getLocationDetails("",customerId, emailId,"-1","Retail Outlet",false,true,false);
			List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
			if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
				categoryList = outletMasterServiceObj.getCategoryDetails("",customerId, emailId,"-1","");
				request.getSession().setAttribute("categoryList", categoryList);
			}
			List<Suppliers> supplierList =(List<Suppliers>)request.getSession().getAttribute("supplierList");
			if(supplierList==null || supplierList.size()==0 || supplierList.isEmpty()){
				 supplierList = outletMasterServiceObj.getSuppliers(customerId, emailId,"-1","","");
				request.getSession().setAttribute("supplierList", supplierList);
			}
			List<Department> departmentList =(List<Department>)request.getSession().getAttribute("departmentList");
			if(departmentList==null || departmentList.size()==0 || departmentList.isEmpty()){
				departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerId, emailId,index,false);
				request.getSession().setAttribute("departmentList", departmentList);
			}
			List<String> brandsList =(List<String>)request.getSession().getAttribute("brandsList");
			if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
				brandsList = adminServiceObj.getBrandNamesList(customerId,emailId);
				request.getSession().setAttribute("brandsList", brandsList);
			}
			modelAndViewObj = new ModelAndView();
			if(skuList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(skuList.size()<end){
					end = (skuList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(skuList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("maxRecords", maxRecords);
			
				
			}
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("subcategory", subcategory);
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("brand", brand);
			modelAndViewObj.addObject("supplierid", supplierid);
			modelAndViewObj.addObject("department", department);
			modelAndViewObj.addObject("status", status);
			modelAndViewObj.addObject("brandsList", brandsList);
			
			modelAndViewObj.addObject("category", productCategory);
			modelAndViewObj.addObject("skuList", skuList);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SkuMaster/skuMaster");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 20-feb-2015
	 * 
	 * This method is used to display the New Category form.
	 * It does not interact with any service as there is no dynamic data required in the view.
	 *
	 **//*
	@RequestMapping("/newCategory")
	public ModelAndView newCategory(HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("newCategory ");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/CategoryMaster/newCategory");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	*//**
	 * 
	 * @author Mythri.S
	 * Created On: 20-feb-2015
	 * 
	 * This method is used to display all the category details in tabular format.
	 * This method accepts the current index, sends it to web service and retrieves the next 10 records to be displayed. 
	 *
	 **//*
	@RequestMapping("/viewCategory")
	public ModelAndView viewCategory(@RequestParam("index")String index,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("viewCategory ");
			int start = 1,end = 10;
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,index);
			modelAndViewObj = new ModelAndView();
			if(categoryList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(categoryList.size()<10){
					end = (categoryList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(categoryList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("categoryDetails", categoryList);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/CategoryMaster/categoryMaster");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}

	*//**
	 * 
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 22-feb-2015.
	 * 
	 * This method is used to display the edit category form consisting of the category details.
	 * It retrieves the category details based on the categoryName.
	 * Based on the operation, it returns either the viewCategory JSP or editCategory JSP.
	 *
	 **//*
	@RequestMapping("/editCategory")
	public ModelAndView editCategory(@RequestParam("categoryName") String categoryName,@RequestParam("operation") String operation, HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("editCategory ");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails(categoryName,customerIdStr, emailIdStr,"0");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("categoryDetails", categoryList.get(0));
			if(operation.equals("view"))
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/CategoryMaster/viewCategory");
			else	
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/CategoryMaster/editCategory");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	

	
	
	*//**
	 * 
	 * @author Mythri.S
	 * Created On: 23-feb-2015.
	 * 
	 * This method is used to delete the categories.
	 * It accepts the ids that need to be deleted.
	 * It retrieves the category details to display in the table.
	 * It also sends the message of successful deletion or not.
	 *
	 **//*
	@RequestMapping("/deleteCategory")
	public ModelAndView deleteCategory(@RequestParam("ids") String ids,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("deleteCategory ");
			modelAndViewObj = new ModelAndView();
			int start = 1,end = 10;
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = outletMasterServiceObj.deleteCategory(customerIdStr,emailIdStr ,ids);
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"0");
			if(categoryList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(categoryList.size()<10){
					end = (categoryList.size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(categoryList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("categoryDetails", categoryList);
			modelAndViewObj.addObject("err", resultStr);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/CategoryMaster/categoryMaster");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	@RequestMapping("/searchCategoryMaster")
	public ModelAndView searchCategoryMaster(@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		try{
			// log.info("searchCategoryMaster");
			int start = 1,end = 10;
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails(searchNameStr,customerIdStr, emailIdStr,index);
			modelAndViewObj = new ModelAndView();
			if(categoryList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(categoryList.size()<10){
					end = (categoryList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(categoryList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("categoryDetails", categoryList);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/CategoryMaster/categoryMaster");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}*/
	
	
	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 20-feb-2015
	 * 
	 * This method is used to display the New Category form.
	 * It does not interact with any service as there is no dynamic data required in the view.
	 *
	 **/
	@RequestMapping("/newCategory")
	public ModelAndView newCategory(@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("newCategory ");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName", searchName);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/CategoryMaster/newCategory");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 20-feb-2015
	 * 
	 * This method is used to display all the category details in tabular format.
	 * This method accepts the current index, sends it to web service and retrieves the next 10 records to be displayed. 
	 *
	 **/
	@RequestMapping("/viewCategory")
	public ModelAndView viewCategory(@RequestParam("index")String index,@RequestParam("maxRecords")String maxRecords,@RequestParam("searchName")String searchName,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("viewCategory ");
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails(searchName,customerIdStr, emailIdStr,index,maxRecords);
			modelAndViewObj = new ModelAndView();
			if(categoryList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(categoryList.size()<end){
					end = (categoryList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(categoryList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("categoryDetails", categoryList);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/CategoryMaster/categoryMaster");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}

	/**
	 * 
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 22-feb-2015.
	 * 
	 * This method is used to display the edit category form consisting of the category details.
	 * It retrieves the category details based on the categoryName.
	 * Based on the operation, it returns either the viewCategory JSP or editCategory JSP.
	 *
	 **/
	@RequestMapping("/editCategory")
	public ModelAndView editCategory(@RequestParam("categoryName") String categoryName, @RequestParam("maxRecords") String maxRecords,@RequestParam("searchName")String searchName,@RequestParam("operation") String operation, HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("editCategory ");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails(categoryName,customerIdStr, emailIdStr,"0","");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("categoryDetails", categoryList.get(0));
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);
			if(operation.equals("view"))
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/CategoryMaster/viewCategory");
			else	
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/CategoryMaster/editCategory");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	

	
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 23-feb-2015.
	 * 
	 * This method is used to delete the categories.
	 * It accepts the ids that need to be deleted.
	 * It retrieves the category details to display in the table.
	 * It also sends the message of successful deletion or not.
	 *
	 **/
	@RequestMapping("/deleteCategory")
	public ModelAndView deleteCategory(@RequestParam("ids") String ids,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName")String searchName,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("deleteCategory ");
			modelAndViewObj = new ModelAndView();
			int start = 1,end = 10;
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = outletMasterServiceObj.deleteCategory(customerIdStr,emailIdStr ,ids);
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails(searchName,customerIdStr, emailIdStr,"0",maxRecords);
			if(categoryList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(categoryList.size()<10){
					end = (categoryList.size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(categoryList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("categoryDetails", categoryList);
			if(resultStr.equalsIgnoreCase(AppProperties.getAppMessageByProperty("CATEGORY_DELETE_SUCCESS").trim())) {
				modelAndViewObj.addObject("err", "");	
			}else {
				modelAndViewObj.addObject("err", resultStr);
			}
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/CategoryMaster/categoryMaster");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	@RequestMapping("/searchCategoryMaster")
	public ModelAndView searchCategoryMaster(@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index, @RequestParam("maxRecords")String maxRecords, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		try{
			// log.info("searchCategoryMaster");
			int start = 1,end = Integer.parseInt(maxRecords);
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails(searchNameStr,customerIdStr, emailIdStr,index,maxRecords);
			modelAndViewObj = new ModelAndView();
			if(categoryList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(categoryList.size()<end){
					end = (categoryList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(categoryList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("categoryDetails", categoryList);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/CategoryMaster/categoryMaster");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}



/**
	 * 
	 * @author Mythri.S
	 * Created On: 22-feb-2015
	 *   modified by raviteja.N
	 * This method is used to save the Existing Category Details.
	 * It accepts all the info related to the category, calls the service based to update it based on the category name.
	 * It returns the editCategory JSP which displays the updated info along with a message of update success or failure. 
	 *
	 **/
	@RequestMapping("/updateCategory")
	public ModelAndView updateCategory(@RequestBody ProductCategoryBean productCategoryBean,
			HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("updateCategory ");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = outletMasterServiceObj.updateCategory(productCategoryBean,customerIdStr,emailIdStr);
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails(productCategoryBean.getCategoryName(),customerIdStr, emailIdStr,"0","");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("categoryDetails", categoryList.get(0));
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("CATEGORY_UPDATE_SUCCESS").trim()))
				modelAndViewObj.addObject("err", resultStr);
			else
				modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.addObject("maxRecords", productCategoryBean.getMaxRecords());
			modelAndViewObj.addObject("searchName", productCategoryBean.getSearchCriteria());
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/CategoryMaster/editCategory");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 23-feb-2015
	 * 
	 * This method is used to view all the sub category details in tabular format.
	 * This method accepts the current index, sends it to web service and retrieves the next 10 records to be displayed. 
	 *
	 **/
	@RequestMapping("/viewSubCategory")
	public ModelAndView viewSubCategory(@RequestParam("index") String index,@RequestParam("maxRecords")String maxRecords, @RequestParam("searchName")String searchName, HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewSubCategory ");
			int start = 1,end = Integer.parseInt(maxRecords);			
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<ProductSubCategoryBean> subCategoryDetailsList = outletMasterServiceObj.getSubCategoryDetails(searchName,customerIdStr, emailIdStr,index,maxRecords,false);
			modelAndViewObj = new ModelAndView();
			if(subCategoryDetailsList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(subCategoryDetailsList.size()<end){
					end = (subCategoryDetailsList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(subCategoryDetailsList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("subCategoryDetails", subCategoryDetailsList);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);

			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SubCategoryMaster/subCategoryMaster");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 25-feb-2015.
	 * 
	 *	This method is used to display the New Sub Category form.
	 *	This method interacts with the service to retrieve the categories List.
	 *	The categoryList is added to the model object as it needs to be dynamically populated in the view.
	 *
	 **/
	@RequestMapping("/newSubCategory")
	public ModelAndView newSubCategory(@RequestParam("maxRecords")String maxRecords,@RequestParam("searchName") String searchName,  HttpServletRequest request,HttpServletResponse response){
		try{
			String customerIdStr,emailIdStr;
			// log.info("newSubCategory ");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
//			List<String> categoriesList = adminServiceObj.getCategories(customerIdStr,emailIdStr);
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("categoriesList", categoryList);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);

			
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SubCategoryMaster/newSubCategory");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}

	
	@RequestMapping("/viewBomMaster")
	public ModelAndView viewBomMaster(@RequestParam("index")String index, @RequestParam("maxRecords")String maxRecords,@RequestParam("searchName")String searchName,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewBomMaster");
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			BillOfMaterialResponse priceRangeMasterResponeObj  = outletMasterServiceObj.getBoms(searchName,customerIdStr, emailIdStr,index,"",maxRecords,"");
			if(priceRangeMasterResponeObj.getBomList() == null || priceRangeMasterResponeObj.getBomList().size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(priceRangeMasterResponeObj.getBomList().size()<end){
					end = (priceRangeMasterResponeObj.getBomList().size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", priceRangeMasterResponeObj.getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("shipmentRatesList", priceRangeMasterResponeObj.getBomList());
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/BomMaster/BomMaster");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		modelAndViewObj.addObject("maxRecords",maxRecords);
		modelAndViewObj.addObject("searchName",searchName);
		return modelAndViewObj;
	}

	@RequestMapping("/searchBomMaster")
	public ModelAndView searchBomMaster(@RequestParam("searchName")String searchName,@RequestParam("maxRecords")String maxRecords,@RequestParam("index")String index,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("searchBomMaster");
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			BillOfMaterialResponse priceRangeMasterResponeObj  = outletMasterServiceObj.getBoms(searchName,customerIdStr, emailIdStr,index,"",maxRecords,"");
			if(priceRangeMasterResponeObj.getBomList() == null || priceRangeMasterResponeObj.getBomList().size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(priceRangeMasterResponeObj.getBomList().size()<end){
					end = (priceRangeMasterResponeObj.getBomList().size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", priceRangeMasterResponeObj.getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("searchName", searchName);
			modelAndViewObj.addObject("maxRecords", maxRecords);
			modelAndViewObj.addObject("shipmentRatesList", priceRangeMasterResponeObj.getBomList());
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/BomMaster/BomMaster");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 25-feb-2015.
	 * 
	 *	This method is used to display the New Sub Category form.
	 *	This method interacts with the service to retrieve the categories List.
	 *	The categoryList is added to the model object as it needs to be dynamically populated in the view.
	 *
	 **/
	@RequestMapping("/newBomMaster")
	public ModelAndView newBomMaster(@RequestParam("searchName")String searchName,@RequestParam("maxRecords")String maxRecords,HttpServletRequest request,HttpServletResponse response){
		try{
			String customerIdStr,emailIdStr;
			// log.info("newBOMMaster ");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
//			List<String> categoriesList = adminServiceObj.getCategories(customerIdStr,emailIdStr);
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("categoriesList", categoryList);
			modelAndViewObj.addObject("searchName", searchName);
			modelAndViewObj.addObject("maxRecords", maxRecords);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/BomMaster/newBomMaster");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author chaithanya.v
	 * 
	 *This method is used to create New Product Group
	 *
	 **/
	
	@RequestMapping(value="/createBom",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createBom(@RequestBody BillOfMaterial featureobj,HttpServletRequest request,HttpServletResponse response){
		//////////System.out.println(featureobj);
		try{
			// log.info("createBOMMaster");
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr=outletMasterServiceObj.createBom(featureobj, customerIdStr, emailIdStr);
			//////////System.out.println(resultStr);
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("BOM_GROUP_CREATE_SUCCESS").trim()) && !resultStr.equals(AppProperties.getAppMessageByProperty("BOM_GROUP_UPDATE_SUCCESS").trim())){
				modelAndViewObj.addObject("err", resultStr);
				modelAndViewObj.addObject("type", "new");
				modelAndViewObj.addObject("bomresponse", featureobj);
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/BomMaster/newBomMaster");
			}else{
				modelAndViewObj.addObject("success", resultStr);
				modelAndViewObj.addObject("type", "edit");
				modelAndViewObj.addObject("bomresponse", featureobj);
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/BomMaster/newBomMaster");
			}
		}catch(Exception exception){
			exception.printStackTrace();
		}
		modelAndViewObj.addObject("maxRecords", featureobj.getMaxRecords());
		modelAndViewObj.addObject("searchName", featureobj.getSearchCriteria());
		return modelAndViewObj;
	}
	
	
	@RequestMapping("/deleteBom")
	public ModelAndView deleteBom(@RequestParam("searchName")String searchName,@RequestParam("maxRecords")String maxRecords,@RequestParam("ids") String ids,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("deleteBOMMaster ");
			int start = 1,end = Integer.parseInt(maxRecords);
			modelAndViewObj = new ModelAndView();
			//////////System.out.println("Ids : "+ids);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = outletMasterServiceObj.deleteBoms(customerIdStr,emailIdStr,ids);
			BillOfMaterialResponse priceRangeMasterResponeObj  = outletMasterServiceObj.getBoms(searchName, customerIdStr, emailIdStr, "0", "",maxRecords,"");
			if(priceRangeMasterResponeObj.getBomList() == null || priceRangeMasterResponeObj.getBomList().size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(priceRangeMasterResponeObj.getBomList().size()<10){
					end = (priceRangeMasterResponeObj.getBomList().size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", priceRangeMasterResponeObj.getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("err", resultStr);
			}
			modelAndViewObj.addObject("shipmentRatesList", priceRangeMasterResponeObj.getBomList());
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/BomMaster/BomMaster");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		
		modelAndViewObj.addObject("maxRecords", maxRecords);
		modelAndViewObj.addObject("searchName", searchName);
		return modelAndViewObj;
	}	
	
	
	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 27-feb-2015
	 * 
	 * This method is used to display the editSubCategory form consisting of the subCategory details.
	 * It accepts the subcategoryName and retrieves data based on that subcategoryName and adds model object.
	 * based on the operation, it returns either viewSubCategory JSP or editSubCategory JSP.
	 * 
	 *
	 **/
	@RequestMapping("/editSubCategory")
	public ModelAndView editSubCategory(@RequestParam("subcategoryName") String subcategoryName,@RequestParam("maxRecords")String maxRecords,@RequestParam("searchName")String searchName, @RequestParam("operation") String operation, HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("editSubCategory ");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<ProductSubCategoryBean> subCategoryDetailsList = outletMasterServiceObj.getSubCategoryDetails(subcategoryName,customerIdStr, emailIdStr,"0",false);
//			List<String> categoriesList = adminServiceObj.getCategories(customerIdStr,emailIdStr);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("subCategoryDetails", subCategoryDetailsList.get(0));
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
			modelAndViewObj.addObject("categoriesList", categoryList);
			if(operation.equals("view"))
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SubCategoryMaster/viewSubCategory");
			else
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SubCategoryMaster/editSubCategory");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		modelAndViewObj.addObject("maxRecords",maxRecords);
		modelAndViewObj.addObject("searchName",searchName);

		
		return modelAndViewObj;
	}
	

	/**
	 * 
	 * @author Mythri.S
	 * Created On: 21-feb-2015
	 * modified by raviteja.N
	 * This method is used to save the New Category Details.
	 * It accepts the info that need to be saved in the database.
	 * It return the newCategory JSP along with the result as saved or any issue. 
	 *
	 **/
	
	
	@RequestMapping(value="/saveCategory" ,method=RequestMethod.POST,consumes="application/json")
	public ModelAndView saveCategory(@RequestBody ProductCategoryBean productCategoryBean ,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("saveCategory ");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = outletMasterServiceObj.createCategory(productCategoryBean,customerIdStr,emailIdStr);
			modelAndViewObj = new ModelAndView();
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("CATEGORY_CREATE_SUCCESS").trim())){
				
				modelAndViewObj.addObject("categoryDetails", productCategoryBean);
				modelAndViewObj.addObject("err", resultStr);
			}else
				modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/CategoryMaster/newCategory");
	
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/CategoryMaster/newCategory");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}

/**
	 * 
	 * @author Mythri.S
	 * Created On: 22-feb-2015
	 *   modified by raviteja.N
	 * This method is used to save the Existing Category Details.
	 * It accepts all the info related to the category, calls the service based to update it based on the category name.
	 * It returns the editCategory JSP which displays the updated info along with a message of update success or failure. 
	 *
	 **//*
	@RequestMapping("/updateCategory")
	public ModelAndView updateCategory(@RequestBody ProductCategoryBean productCategoryBean,
			HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("updateCategory ");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = outletMasterServiceObj.updateCategory(productCategoryBean,customerIdStr,emailIdStr);
		
			
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("categoryDetails", productCategoryBean);
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("CATEGORY_UPDATE_SUCCESS").trim()))
				modelAndViewObj.addObject("err", resultStr);
			else
				modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/CategoryMaster/editCategory");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
*/


/**
	 * 
	 * @author Mythri.S
	 * Created On: 26-feb-2015
	 *   modified by raviteja.N
	 * This method is used to save the details of New sub category.
	 * It accepts all the info to be saved to the db.
	 * It returns the newCategory JSP.
	 * It adds a message related to the successful saving or not.
	 * 
	 *
	 **/
	
	
	@RequestMapping(value="/saveSubCategory" ,method=RequestMethod.POST,consumes="application/json")
	public ModelAndView saveSubCategory(@RequestBody ProductSubCategoryBean productSubCategoryBean,	HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("saveSubCategory ");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = outletMasterServiceObj.createSubCategory(productSubCategoryBean,customerIdStr,emailIdStr);
//			List<String> categoriesList = adminServiceObj.getCategories(customerIdStr,emailIdStr);
			modelAndViewObj = new ModelAndView();
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("SUBCATEGORY_CREATE_SUCCESS").trim())){
				
				modelAndViewObj.addObject("subCategoryDetails",productSubCategoryBean);
				modelAndViewObj.addObject("err", resultStr);
			}else
				modelAndViewObj.addObject("success", resultStr);
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
			modelAndViewObj.addObject("categoriesList", categoryList);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SubCategoryMaster/newSubCategory");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		
		
		modelAndViewObj.addObject("maxRecords",productSubCategoryBean.getMaxRecords());
		modelAndViewObj.addObject("searchName",productSubCategoryBean.getSearchCriteria());
		return modelAndViewObj;

	}
	
	
	
	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 2-mar-2015.
	 *  modified by raviteja.N
	 * This method is used to save the details of Existing sub category
	 * This method accepts all the info related to the categoryName need to be saved in db.
	 * This returns the editSubCategory JSP along with the updated details and a message related to successful saving or not 
	 *
	 **/
	@RequestMapping("/updateSubCategory")
	public ModelAndView updateSubCategory(@RequestBody ProductSubCategoryBean productSubCategoryBean,
			
			HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("updateSubCategory ");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			/*ProductSubCategoryBean subCategoryDetailsObj = new ProductSubCategoryBean();*/
			
		
			String resultStr = outletMasterServiceObj.updateSubCategory(productSubCategoryBean,customerIdStr,emailIdStr);
//			List<String> categoriesList = adminServiceObj.getCategories(customerIdStr,emailIdStr);
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
			
			modelAndViewObj = new ModelAndView();
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("SUBCATEGORY_UPDATE_SUCCESS").trim()))
				modelAndViewObj.addObject("err", resultStr);
			else
				modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.addObject("subCategoryDetails",productSubCategoryBean);
			modelAndViewObj.addObject("categoriesList", categoryList);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SubCategoryMaster/editSubCategory");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		modelAndViewObj.addObject("maxRecords",productSubCategoryBean.getMaxRecords());
		modelAndViewObj.addObject("searchName",productSubCategoryBean.getSearchCriteria());


		return modelAndViewObj;
	}

	

	/**
	 * 
	 * @author Mythri.S
	 * Created On: 2-mar-2015.
	 * 
	 * This method is used to delete the sub categories.
	 * It accepts the ids that need to be deleted.
	 * It retrieves the subCategory details to display in the table.
	 * It also sends the message of successful deletion or not.
	 * 
	 **/
	@RequestMapping("/deleteSubCategory")
	public ModelAndView deleteSubCategory(@RequestParam("ids") String ids,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("deleteSubCategory ");
			modelAndViewObj = new ModelAndView();
			int start = 1,end = Integer.parseInt(maxRecords);		
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String result = outletMasterServiceObj.deleteSubCategory(customerIdStr,emailIdStr ,ids);
			List<ProductSubCategoryBean> subCategoryDetailsList = outletMasterServiceObj.getSubCategoryDetails(searchName,customerIdStr, emailIdStr,"0",maxRecords,false);
			if(subCategoryDetailsList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(subCategoryDetailsList.size()<end){
					end = (subCategoryDetailsList.size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(subCategoryDetailsList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("subCategoryDetails", subCategoryDetailsList);
			modelAndViewObj.addObject("err", result);
			modelAndViewObj.addObject("maxRecords", maxRecords);
			modelAndViewObj.addObject("searchName", searchName);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SubCategoryMaster/subCategoryMaster");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	@RequestMapping("/searchSubCategoryMaster")
	public ModelAndView searchSubCategoryMaster(@RequestParam("searchName") String searchNameStr,@RequestParam("maxRecords") String maxRecords, @RequestParam("index") String index, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		try{
			// log.info("searchSubCategoryMaster");
			int start = 1,end = Integer.parseInt(maxRecords);
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<ProductSubCategoryBean> subCategoryDetailsList = outletMasterServiceObj.getSubCategoryDetails(searchNameStr,customerIdStr, emailIdStr,index,maxRecords,true);
			modelAndViewObj = new ModelAndView();
			if(subCategoryDetailsList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(subCategoryDetailsList.size()<end){
					end = (subCategoryDetailsList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(subCategoryDetailsList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("maxRecords",maxRecords);

			modelAndViewObj.addObject("subCategoryDetails", subCategoryDetailsList);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SubCategoryMaster/subCategoryMaster");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to display new Product Group form
	 *
	 **/
	
		@RequestMapping(value="/newProductGroupMaster")
		public ModelAndView newProductGroupMaster(HttpServletRequest request,HttpServletResponse response){
			
			try{
				// log.info("newProductGroupMaster");
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				modelAndViewObj = new ModelAndView();
				List<Suppliers> supplierList =(List<Suppliers>)request.getSession().getAttribute("supplierList");
				if(supplierList==null || supplierList.size()==0 || supplierList.isEmpty()){
					 supplierList = outletMasterServiceObj.getSuppliers(customerIdStr, emailIdStr,"-1","","");
					request.getSession().setAttribute("supplierList", supplierList);
				}
				List<String> brandsList =(List<String>)request.getSession().getAttribute("brandsList");
				if(brandsList==null || brandsList.size()==0 || brandsList.isEmpty()){
					brandsList = adminServiceObj.getBrandNamesList("","");
					request.getSession().setAttribute("brandsList", brandsList);
				}
				
	          List<String>  locationsList =(List<String>)request.getSession().getAttribute("locationsList");
				if(locationsList==null || locationsList.size()==0 || locationsList.isEmpty()){
					locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
					request.getSession().setAttribute("locationsList", locationsList);
				}
				
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ProductGroupMaster/newProductGroupMaster");
				//////////System.out.println(modelAndViewObj);
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
		
	
		/**
		 * 
		 * @author Viswanath
		 * 
		 *This method is used to create New Product Group
		 *
		 **//*
		
		@RequestMapping(value="/createProductGroupMaster",method=RequestMethod.POST,consumes="application/json")
		public ModelAndView createProductGroupMaster(@RequestBody Group groupObj,HttpServletRequest request,HttpServletResponse response){
			
			try{
				// log.info("createProductGroupMaster");
				modelAndViewObj = new ModelAndView();
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				String resultStr=outletMasterServiceObj.createNewProductGroup(groupObj, customerIdStr, emailIdStr);
				if(!resultStr.equals(AppProperties.getAppMessageByProperty("GROUP_CREATE_SUCCESS").trim())){
					modelAndViewObj.addObject("productGroup", groupObj);
					modelAndViewObj.addObject("err", resultStr);
					modelAndViewObj.addObject("type", "new");
					modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ProductGroupMaster/editProductGroup");
				}else{
					modelAndViewObj.addObject("success", resultStr);
					modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ProductGroupMaster/newProductGroupMaster");
				}
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}*/
		
		

		/**
		 * 
		 * @author Viswanath
		 * 
		 *This method is used to create New Product Group
		 *
		 *@modifiedBy:  Vijay
		 *@modifiedDate:
		 **/
		@RequestMapping(value="/createProductGroupMaster",method=RequestMethod.POST,consumes="application/json")
		public ModelAndView createProductGroupMaster(@RequestBody Group groupObj,HttpServletRequest request,HttpServletResponse response){
			
			try{
				// log.info("createProductGroupMaster");
				modelAndViewObj = new ModelAndView();
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				String resultStr=outletMasterServiceObj.createNewProductGroup(groupObj, customerIdStr, emailIdStr);
				if(!resultStr.equals(AppProperties.getAppMessageByProperty("GROUP_CREATE_SUCCESS").trim()))
				{
					modelAndViewObj.addObject("productGroup", groupObj);
					modelAndViewObj.addObject("err", resultStr);
					modelAndViewObj.addObject("type", "new");
					modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ProductGroupMaster/newProductGroupMaster");
				}
				else
				{
					modelAndViewObj.addObject("success", resultStr);
					modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ProductGroupMaster/newProductGroupMaster");
				}
			}
			catch(Exception exception)
			{
				exception.printStackTrace();
			}
			 modelAndViewObj.addObject("maxRecords",groupObj.getMaxRecords());
			 modelAndViewObj.addObject("searchName",groupObj.getSearchCriteria());
			 
			return modelAndViewObj;
		}
		
		
		/**
		 * 
		 * @author Viswanath
		 * 
		 *This method is used to display the Edit Product Group form consisting of the details of the Group
		 *
		 **//*
		@RequestMapping("/editProductGroup")
		public ModelAndView editProductGroup(@RequestParam("index") String index,@RequestParam("searchcriteria") String searchcriteria,@RequestParam("groupId") String groupIdStr,@RequestParam("operation") String operation,HttpServletRequest request,HttpServletResponse response){
			try{
				// log.info("editProductGroup");
				int start = 1,end =10;
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				modelAndViewObj = new ModelAndView();
				GroupChild groupDetails = outletMasterServiceObj.getProductGroupDetailsforGroupId(groupIdStr,customerIdStr, emailIdStr,index,false,searchcriteria);
				modelAndViewObj.addObject("productGroup", groupDetails);
				modelAndViewObj.addObject("type", "edit");
				if(operation.equals("view")){
					if(groupDetails == null || groupDetails.getGroupChildLists().size() == 0)
					{
						modelAndViewObj.addObject("totalRecords","0");
						modelAndViewObj.addObject("index", "0");
						modelAndViewObj.addObject("totalValue", "0");
					}
					else
					{
						if(groupDetails.getGroupChildLists().size()<10)
						{
							end = (groupDetails.getGroupChildLists().size())+(Integer.parseInt(index));
						}else
						{
							end = (Integer.parseInt(index)+end);
						}
						modelAndViewObj.addObject("totalRecords", groupDetails.getTotalRecords());
						modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
						modelAndViewObj.addObject("totalValue", end);
					}
					
					
					modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ProductGroupMaster/viewProductGroup");
				}
				
				else
					modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ProductGroupMaster/editProductGroup");
			}
			catch(Exception exception){
				exception.printStackTrace();
			}
			
			return modelAndViewObj;
			
		}*/
		

		/**
		 * 
		 * @author Viswanath
		 * 
		 *This method is used to display the Edit Product Group form consisting of the details of the Group
		 *
		 **/
		@RequestMapping("/editProductGroup")
        public ModelAndView editProductGroup(@RequestParam("index") String index,@RequestParam("searchcriteria") String searchcriteria,@RequestParam("groupId") String groupIdStr,@RequestParam("operation") String operation,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response)throws Exception{
                try{
                        // log.info("editProductGroup");
                        int start = 1,end =Integer.parseInt(maxRecords);
                        String customerIdStr = (String)request.getSession().getAttribute("customerId");
                        String emailIdStr = (String)request.getSession().getAttribute("emailId");
                        modelAndViewObj = new ModelAndView();
                        GroupChild groupDetails = outletMasterServiceObj.getProductGroupDetailsforGroupId(groupIdStr,customerIdStr, emailIdStr,index,false,searchcriteria,maxRecords);
                        modelAndViewObj.addObject("productGroup", groupDetails);
                        modelAndViewObj.addObject("type", "edit");
                        
                                if(groupDetails.getGroupChildLists()== null)
                                {
                                        modelAndViewObj.addObject("totalRecords","0");
                                        modelAndViewObj.addObject("index", "0");
                                        modelAndViewObj.addObject("totalValue", "0");
                                }
                                else
                                {
                                        if(groupDetails.getGroupChildLists().size()<Integer.parseInt(maxRecords))
                                                end = (groupDetails.getGroupChildLists().size())+(Integer.parseInt(index));
                                        else
                                                end = (Integer.parseInt(index)+end);
                                        modelAndViewObj.addObject("totalRecords", Integer.parseInt(groupDetails.getTotalRecords()));
                                        modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
                                        modelAndViewObj.addObject("totalValue", end);
                                }
                                modelAndViewObj.addObject("maxRecords",maxRecords);
                                if(operation.equals("view"))
                                {
                                        modelAndViewObj.addObject("searchCriteria",searchcriteria); 
                                        modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ProductGroupMaster/viewProductGroup");
                                }
                                else
                                modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ProductGroupMaster/editProductGroup");
                }
                catch(Exception exception){
                        //throw new Exception(exception.getMessage());
                        exception.printStackTrace();
                        
                }
                modelAndViewObj.addObject("operation",operation);
                modelAndViewObj.addObject("maxRecords",maxRecords);
                modelAndViewObj.addObject("searchName",searchName); 
                return modelAndViewObj;
                
        }

		
		
		/**
		 * 
		 * @author Viswanath
		 * 
		 * This method is used to view the  product Group details  
		 * @modified by Vijay
		 * @desc added maxREcords, and searchCriteria
		 *
		 **/
		
		@RequestMapping("/viewProductGroup")
		public ModelAndView viewProductGroup(
				
				@RequestParam("index") String index, 
				@RequestParam("searchCriteria") String searchCriteria, 
				@RequestParam("maxRecords")String maxRecords,
				
				HttpServletRequest request,HttpServletResponse response){
			try{
				// log.info("viewProductGroup ");
				int start = 1,end = Integer.parseInt(maxRecords);
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				List<Group> groupsList = outletMasterServiceObj.getProductGroupDetails(searchCriteria,customerIdStr, emailIdStr,index,maxRecords,true);
				modelAndViewObj = new ModelAndView();
				if(groupsList == null || groupsList.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(groupsList.size()<end){
						end = (groupsList.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(groupsList.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
					
				}
				modelAndViewObj.addObject("groupsList", groupsList);
			
				modelAndViewObj.addObject("maxRecords",maxRecords);
				modelAndViewObj.addObject("searchName",searchCriteria);
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ProductGroupMaster/productGroupMaster");
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
		
		
		
		/**
		 * 
		 * @author Viswanath
		 * 
		 *This method is used to update the Existing Product Group
		 *
		 **/
		@RequestMapping(value="/updateProductGroupMaster",method=RequestMethod.POST,consumes="application/json")
		public ModelAndView updateProductGroupMaster(@RequestBody Group groupObj,HttpServletRequest request,HttpServletResponse response){
			
			try{
				// log.info("updateProductGroupMaster");
				int end=10;
				modelAndViewObj = new ModelAndView();
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				String resultStr=outletMasterServiceObj.updateProductGroup(groupObj, customerIdStr, emailIdStr);
				//////////System.out.println(resultStr);
				if(!resultStr.equals(AppProperties.getAppMessageByProperty("PRODUCT_GROUP_UPDATE_SUCCESS").trim()))
					modelAndViewObj.addObject("err", resultStr);
				else
					modelAndViewObj.addObject("success", resultStr);
				GroupChild groupDetails = outletMasterServiceObj.getProductGroupDetailsforGroupId(groupObj.getGroupId(),customerIdStr, emailIdStr,groupObj.getStartIndex(),false,"","10");
				
				if(groupDetails.getGroupChildLists() == null){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(groupDetails.getGroupChildLists().size()<end){
						end = (Integer.parseInt(groupObj.getStartIndex()) + groupDetails.getGroupChildLists().size());
					}
					
					modelAndViewObj.addObject("totalRecords", groupDetails.getTotalRecords() );
					modelAndViewObj.addObject("index", Integer.parseInt(groupObj.getStartIndex()) + 1);
					modelAndViewObj.addObject("totalValue", Integer.parseInt(groupObj.getStartIndex()) + groupDetails.getGroupChildLists().size());
					
				}
				
				modelAndViewObj.addObject("productGroup", groupDetails);
				modelAndViewObj.addObject("operation", "edit");
				modelAndViewObj.addObject("type", "edit");
				 modelAndViewObj.addObject("maxRecords",groupObj.getMaxRecords());
				 modelAndViewObj.addObject("searchName",groupObj.getSearchCriteria());
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ProductGroupMaster/editProductGroup");
//				////////System.out.println(modelAndViewObj);
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}

		
		/**
		 * 
		 * @author Viswanath
		 * 
		 *This method is used to delete the Product Group
		 * 	
		 **/
		
		@RequestMapping("/deleteProductGroup")
		public ModelAndView deleteProductGroup(@RequestParam("ids") String ids,@RequestParam("maxRecords") String maxRecords,
				@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
			try{
				// log.info("deleteProductGroup ");
				int start = 1,end = Integer.parseInt(maxRecords);
				modelAndViewObj = new ModelAndView();
				String customerId = (String)request.getSession().getAttribute("customerId");
				String emailId = (String)request.getSession().getAttribute("emailId");
				//////////System.out.println(ids);
				String resultStr = outletMasterServiceObj.deleteProductGroup(customerId,emailId,ids);
				//////////System.out.println(resultStr);
				List<Group> groupDetails = outletMasterServiceObj.getProductGroupDetails(searchName,customerId, emailId,"0",maxRecords,true);
				modelAndViewObj = new ModelAndView();
				if(groupDetails == null || groupDetails.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(groupDetails.size()<end){
						end = (groupDetails.size())+(Integer.parseInt("0"));
					}else{
						end = (Integer.parseInt("0")+end);
					}
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(groupDetails.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
					modelAndViewObj.addObject("totalValue", end);
					
				}
				modelAndViewObj.addObject("groupsList", groupDetails);
				modelAndViewObj.addObject("err", resultStr);
				modelAndViewObj.addObject("maxRecords",maxRecords);
				modelAndViewObj.addObject("searchName",searchName);
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ProductGroupMaster/productGroupMaster");
			}
			catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
		/**
		 * 
		 * @author: Vijay
		 * @Desc: This method to get the records based on filters applied in creation of productGroupMaster 
		 * @param: category, Sub Category, Section, brand, subDepartment,index, maxRecords,type
		 * @return: ModelAndView Object
		 * @WrittenDate: 24-01-2018
		 * @implementation: outletMasters in ProductGroup creation 
		 */
		
		@RequestMapping("/getFilterItems")
		public ModelAndView  getProductGroupFilteredItems(
				@RequestParam("category") String category,
				@RequestParam("subcategory") String subcategory,
				@RequestParam("section") String section,
				@RequestParam("brand") String brand,
				@RequestParam("department") String department,
				@RequestParam("subdepartment") String subdepartment,
				@RequestParam("index") String index,
				@RequestParam("maxRecords") String maxRecords,
				@RequestParam("location") String location,
				@RequestParam("supplier") String supplier,
				@RequestParam("className") String className,
				@RequestParam("subClass") String subClass,
				@RequestParam("styleOrModel") String styleOrModel,
				@RequestParam("type") String type,
				
				HttpServletRequest request,HttpServletResponse response){
				// log.info("filteritems");
				int start = 1,end = Integer.parseInt(maxRecords);
				SearchProductResponse skuResponse =new SearchProductResponse();
				
				/*List<ProductsList> productGroupList= null;*/
				modelAndViewObj = new ModelAndView();
				try {
			

				skuResponse = outletMasterServiceObj.filterItemsByCriteria(category,subcategory,brand,section,department,subdepartment,location,supplier,"","","",index,maxRecords);
				if(skuResponse.getSkuIdList() == null || skuResponse.getSkuIdList().size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}
				else
				{
					if(skuResponse.getSkuIdList().size()<end)
					{
						end = (skuResponse.getSkuIdList().size())+(Integer.parseInt(index));
					}
					else
					{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", skuResponse.getTotalRecords());
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
					
					
				}

				modelAndViewObj.addObject("itemsList",skuResponse.getSkuIdList());

				modelAndViewObj.addObject("maxRecords",Integer.parseInt(maxRecords));

				modelAndViewObj.addObject("mode","standardFilters");
				
				
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ProductGroupMaster/productGroupMasterChilds");

				}
				catch(Exception exception)
				{

						
						exception.printStackTrace();
				}
				return modelAndViewObj;
				
		}
		
		
		/**
		 * 
		 * @author: Vijay
		 * @Desc: This method to store and fetch the records temporarily provided from Excel sheet
		 * @param: ExcelFile
		 * @return: ModelAndView Object
		 * @WrittenDate: 25-01-2018
		 * @implementation:outletMasters in ProductGroup creation 
		 * 
		 */
		@RequestMapping(value="/importExcelData",method=RequestMethod.POST)
		public ModelAndView importExcelData(
				@RequestParam("file") MultipartFile excelFile,
				HttpServletRequest request,
				HttpServletResponse response) {
			Group  productGroupObj =new Group();
			List<ProductsList> productsList=null;
			
			try{
				
				// log.info("importProductGroupExcelData");
				// log.info(excelFile.getSize());
				String customerId = (String)request.getSession().getAttribute("customerId");
				String emailId = (String)request.getSession().getAttribute("emailId");
				String responseStr= outletMasterServiceObj.uploadProductGroupExcelSheet(customerId, emailId, excelFile);
				
				if(responseStr.equals(AppProperties.getAppMessageByProperty("EXEL_IMPORT_SUCCESS").trim()))
				{
					modelAndViewObj.addObject("success", responseStr);
					productGroupObj= outletMasterServiceObj.getProductGroupMasterTempData(customerId,emailId,"0","10");
					
				}
				else if(responseStr.equals(AppProperties.getAppMessageByProperty("EXEL_IMPORT_FAILURE").trim()))
				{
					modelAndViewObj.addObject("err", responseStr);
					modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ProductGroupMaster/productGroupMasterChilds");
				}
				//below code works for Partial import of excelSheet	
				else
				{
					modelAndViewObj.addObject("err", responseStr);
					productGroupObj = outletMasterServiceObj.getProductGroupMasterTempData(customerId,emailId,"0","10");
					modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ProductGroupMaster/productGroupMasterChilds");
				}
				
				int end = 10,index = 1;
				productsList = productGroupObj.getTemporaryGroupList();
//				////////System.out.println(productsList.size());
				
				if(productsList  == null || productsList.size() == 0){
					
					
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(productsList.size() < end){
						end = (productsList.size());
					}else{
						end = (index+end);
					}
					modelAndViewObj.addObject("totalRecords", productGroupObj.getTotalRecords());
					modelAndViewObj.addObject("maxRecords",10);
					modelAndViewObj.addObject("index", index);
					modelAndViewObj.addObject("totalValue", end);
					modelAndViewObj.addObject("itemsList",productsList);
					modelAndViewObj.addObject("mode","excelImport");
//					modelAndViewObj.addObject("isProductGroup",true);
					modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ProductGroupMaster/productGroupMasterChilds");
					
				}
			
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ProductGroupMaster/productGroupMasterChilds");
				modelAndViewObj.addObject("err", ex.getMessage());
			}
			return modelAndViewObj ;
		}
		
		
		
		
		@RequestMapping(value="/importExcelDataforEdit",method=RequestMethod.POST)
		public @ResponseBody List<ProductsList> importExcelDataforEdit(
				@RequestParam("file") MultipartFile excelFile,
				HttpServletRequest request,
				HttpServletResponse response) {
			Group  productGroupObj =new Group();
			List<ProductsList> productsList=null;
			
			try{
				
				// log.info("importProductGroupExcelData");
				// log.info(excelFile.getSize());
				String customerId = (String)request.getSession().getAttribute("customerId");
				String emailId = (String)request.getSession().getAttribute("emailId");
				String responseStr= outletMasterServiceObj.uploadProductGroupExcelSheet(customerId, emailId, excelFile);
				
				if(responseStr.equals(AppProperties.getAppMessageByProperty("EXEL_IMPORT_SUCCESS").trim()))
				{
					modelAndViewObj.addObject("success", responseStr);
					productGroupObj= outletMasterServiceObj.getProductGroupMasterTempData(customerId,emailId,"0","10");
					
				}
				else if(responseStr.equals(AppProperties.getAppMessageByProperty("EXEL_IMPORT_FAILURE").trim()))
				{
					modelAndViewObj.addObject("err", responseStr);
					modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ProductGroupMaster/editProductGroup");
				}
				//below code works for Partial import of excelSheet	
				else
				{
					modelAndViewObj.addObject("err", responseStr);
					productGroupObj = outletMasterServiceObj.getProductGroupMasterTempData(customerId,emailId,"0","10");
					modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ProductGroupMaster/editProductGroup");
				}
				
				int end = 10,index = 1;
				productsList = productGroupObj.getTemporaryGroupList();
//				////////System.out.println(productsList.size());
				
				if(productsList  == null || productsList.size() == 0){
					
					
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(productsList.size() < end){
						end = (productsList.size());
					}else{
						end = (index+end);
					}
					modelAndViewObj.addObject("totalRecords", productGroupObj.getTotalRecords());
					modelAndViewObj.addObject("maxRecords",10);
					modelAndViewObj.addObject("index", index);
					modelAndViewObj.addObject("totalValue", end);
					modelAndViewObj.addObject("itemsList",productsList);
					modelAndViewObj.addObject("mode","excelImport");
//					modelAndViewObj.addObject("isProductGroup",true);
					modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ProductGroupMaster/editProductGroup");
					
				}
			
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ProductGroupMaster/editProductGroup");
				modelAndViewObj.addObject("err", ex.getMessage());
			}
			return productsList;
		}
		
		/**
		 * 
		 * @author: Vijay
		 * @Desc: This method to store price details for excel
		 * @param: ExcelFile
		 * @return: ModelAndView Object
		 * @WrittenDate: 25-01-2018
		 * @implementation:outletMasters in PriceUpdate creation 
		 * 
		 */
		
		@RequestMapping(value="/uploadPriceExcelData",method=RequestMethod.POST)
		public ModelAndView   uploadPriceExcelData(@RequestParam("file") MultipartFile excelFile,HttpServletRequest request,HttpServletResponse response) {
			MasterDataImportsAndExportsBean masterDataImportsAndExportsBean=null;
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			PriceHistory history = new PriceHistory();
			modelAndViewObj = new ModelAndView();
			try{
//				////////System.out.println("price update");
				RestfulServiceConnection restfulServiceConnection=new RestfulServiceConnection();
				masterDataImportsAndExportsBean = restfulServiceConnection.uploadFile(customerId, excelFile);
				history = skuServiceObj.updateBulkPriceDetails(masterDataImportsAndExportsBean.getFileName(), customerId, emailId);
//				history = skuServiceObj.getBulkPriceDetails(masterDataImportsAndExportsBean.getFileName(), customerId, emailId);
//				history = new Gson().fromJson(resultStr, PriceHistory.class);
				
				if(history.getResponseHeader().getResponseCode().equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
					if(history.getPriceHistory() != null && history.getPriceHistory().size() > 0)
						
					{
						modelAndViewObj.addObject("success",history.getResponseHeader().getResponseMessage());
						modelAndViewObj.addObject("priceList", history.getPriceHistory());
					}
				}
				else if(history.getResponseHeader().getResponseCode().equals(AppProperties.getAppMessageByProperty("RESPONSE_EXEL_IMPORT_PARTIAL_SUCCESS_CODE").trim())){
					if(history.getPriceHistory() != null && history.getPriceHistory().size() > 0)
						
					{
						modelAndViewObj.addObject("error",history.getResponseHeader().getResponseMessage());
						modelAndViewObj.addObject("priceList", history.getPriceHistory());
					}
				}
				
					else
					{
//						modelAndViewObj.addObject("fileName", masterDataImportsAndExportsBean.getPriceUploadfilePath());
						modelAndViewObj.addObject("error",history.getResponseHeader().getResponseMessage());

					}
					
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/newBulkPriceDetails");

				
			}catch(Exception e){
				e.printStackTrace();
			}

			return modelAndViewObj;
		}
		
		/*@RequestMapping("/updateBulkPriceDetails")
		public ModelAndView updateBulkPriceDetails(@RequestParam("fileName") String fileName,HttpServletRequest request,HttpServletResponse response) {
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			try{
	    		// log.info("updateBulkPriceDetails");
				modelAndViewObj = new ModelAndView();
				String resultStr = skuServiceObj.updateBulkPriceDetails(fileName, customerId, emailId);
				if(!resultStr.equals(AppProperties.getAppMessageByProperty("PRICE_UPDATE_SUCCESS").trim()))
					modelAndViewObj.addObject("err", resultStr);
				else
					modelAndViewObj.addObject("success", resultStr);
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/newBulkPriceDetails");
	    	}catch(Exception e){
	    	  e.printStackTrace();	
	    	}
	    	return modelAndViewObj;
		}
		*/
		
		/**
		 * 
		 * @author: Vijay
		 * @Desc: This method to show the creation view
		 * @param: ExcelFile
		 * @return: ModelAndView Object
		 * @WrittenDate: 25-01-2018
		 * @implementation:outletMasters in PriceUpdate new jsp 
		 * 
		 */
		
		@RequestMapping("/newBulkPriceupdate")
		public ModelAndView newBulkPriceupdate(HttpServletRequest request,HttpServletResponse response) {
	    	try{
	    		// log.info("newBulkPriceupdate called");
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/newBulkPriceDetails");
	    	}catch(Exception e){
	    	  e.printStackTrace();	
	    	}
	    	return modelAndViewObj;
		}
		

		/**
		 * 
		 * @author: Vijay
		 * @Desc: This is a static method to get values from excel file 
		 * @param: category, Sub Category, Section, brand, subDepartment,index, maxRecords,type
		 * @returns: ModelAndView Object
		 * @WrittenDate: 24-01-2018
		 * @implementation: in outletMasters of ProductGroup creation 
		 */
		
		@RequestMapping("/getProductGroupExelItems")
		public ModelAndView  getProductGroupExelItems(

				@RequestParam("index") String index,
				@RequestParam("maxRecords") String maxRecords,

				@RequestParam("type") String type,
				HttpServletRequest request,HttpServletResponse response)
		{
				// log.info("filteritems");
				int start = 1, end = Integer.parseInt(maxRecords);
				Group productGroupObj =new Group();
				List<ProductsList> productsList=null;
				
				/*List<ProductsList> productGroupList= null;*/
				modelAndViewObj = new ModelAndView();
				try 
				{
			
					////System.out.print(index);
					String customerId = (String)request.getSession().getAttribute("customerId");
					String emailId = (String)request.getSession().getAttribute("emailId");
				
					productGroupObj = outletMasterServiceObj.getProductGroupMasterTempData(customerId,emailId,index, maxRecords);
				
					productsList = productGroupObj.getTemporaryGroupList();
				
//					////////System.out.println(productsList); 
				
					if(productsList  == null || productsList.size() == 0)
					{
						modelAndViewObj.addObject("totalRecords","0");
						modelAndViewObj.addObject("index", "0");
						modelAndViewObj.addObject("totalValue", "0");
					}
					else
					{
						if(productsList.size()<end)
						{
							end = (productsList.size()+Integer.parseInt(index));
						}
						else
						{
							end = (Integer.parseInt(index)+end);
						}
						modelAndViewObj.addObject("maxRecords",Integer.parseInt(maxRecords));
						modelAndViewObj.addObject("totalRecords", productGroupObj.getTotalRecords());
						modelAndViewObj.addObject("index", Integer.parseInt(index)+start);
						modelAndViewObj.addObject("totalValue", end);  
						modelAndViewObj.addObject("itemsList",productsList);
						modelAndViewObj.addObject("mode","excelImport");
//						modelAndViewObj.addObject("isProductGroup",true);
						modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ProductGroupMaster/productGroupMasterChilds");
						
					}
				 
				}
				catch(Exception ex) 
				{
					ex.printStackTrace();
					modelAndViewObj.addObject("err", ex.getMessage());
//					modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ProductGroupMaster/newProductGroupMaster");
				}
				return modelAndViewObj ;

		}
		
		/**
		 * 
		 * @author Viswanath
		 * 
		 *This method is used to view the  product Group details  
		 *
		 **//*
		
		
		@RequestMapping("/viewProductGroup")
		public ModelAndView viewProductGroup(@RequestParam("index")String index,HttpServletRequest request,HttpServletResponse response){
			try{
				// log.info("viewProductGroup ");
				int start = 1,end = 10;
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				List<Group> groupsList = outletMasterServiceObj.getProductGroupDetails("",customerIdStr, emailIdStr,index,false);
				modelAndViewObj = new ModelAndView();
				if(groupsList == null || groupsList.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(groupsList.size()<10){
						end = (groupsList.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(groupsList.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
				}
				modelAndViewObj.addObject("groupsList", groupsList);
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ProductGroupMaster/productGroupMaster");
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
		*/
		/**
		 * 
		 * @author Viswanath
		 * 
		 *This method is used to update the Existing Product Group
		 *
		 **//*
		@RequestMapping(value="/updateProductGroupMaster",method=RequestMethod.POST,consumes="application/json")
		public ModelAndView updateProductGroupMaster(@RequestBody Group groupObj,HttpServletRequest request,HttpServletResponse response){
			
			try{
				// log.info("updateProductGroupMaster");
				modelAndViewObj = new ModelAndView();
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				String resultStr=outletMasterServiceObj.updateProductGroup(groupObj, customerIdStr, emailIdStr);
				if(!resultStr.equals(AppProperties.getAppMessageByProperty("PRODUCT_GROUP_UPDATE_SUCCESS").trim()))
					modelAndViewObj.addObject("err", resultStr);
				else
					modelAndViewObj.addObject("success", resultStr);
				GroupChild groupDetails = outletMasterServiceObj.getProductGroupDetailsforGroupId(groupObj.getGroupId(),customerIdStr, emailIdStr,"0",false,"");
				modelAndViewObj.addObject("productGroup", groupDetails);
				modelAndViewObj.addObject("type", "edit");
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ProductGroupMaster/editProductGroup");
				////////System.out.println(modelAndViewObj);
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}*/

	/*	
		*//**
		 * 
		 * @author Viswanath
		 * 
		 *This method is used to delete the Product Group
		 *
		 **//*
		
		@RequestMapping("/deleteProductGroup")
		public ModelAndView deleteProductGroup(@RequestParam("ids") String ids,HttpServletRequest request,HttpServletResponse response){
			try{
				// log.info("deleteProductGroup ");
				int start = 1,end = 10;
				modelAndViewObj = new ModelAndView();
				String customerId = (String)request.getSession().getAttribute("customerId");
				String emailId = (String)request.getSession().getAttribute("emailId");
				String resultStr = outletMasterServiceObj.deleteProductGroup(customerId,emailId,ids);
				List<Group> groupDetails = outletMasterServiceObj.getProductGroupDetails("",customerId, emailId,"0",false);
				modelAndViewObj = new ModelAndView();
				if(groupDetails == null || groupDetails.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(groupDetails.size()<10){
						end = (groupDetails.size())+(Integer.parseInt("0"));
					}else{
						end = (Integer.parseInt("0")+end);
					}
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(groupDetails.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
					modelAndViewObj.addObject("totalValue", end);
				}
				modelAndViewObj.addObject("groupsList", groupDetails);
				modelAndViewObj.addObject("err", resultStr);
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ProductGroupMaster/productGroupMaster");
			}
			catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
		*/
		

		/**
		 * 
		 * @author Viswanath
		 * 
		 *This method is used to search the Product Group
		 *11/12/2015
		 **/
		
		

		@RequestMapping("/searchProductGroupMaster")
		public ModelAndView searchProductGroupMaster(@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index, HttpServletRequest request,HttpServletResponse response) {
			String customerIdStr = null,emailIdStr=null;
			try{
				// log.info("searchProductGroupMaster");
				int start = 1,end = 10;
				customerIdStr = (String)request.getSession().getAttribute("customerId");
				emailIdStr = (String)request.getSession().getAttribute("emailId");
				List<Group> groupDetails = outletMasterServiceObj.getProductGroupDetails(searchNameStr,customerIdStr, emailIdStr,index,"10",true);
				modelAndViewObj = new ModelAndView();
				if(groupDetails == null || groupDetails.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(groupDetails.size()<10){
						end = (groupDetails.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(groupDetails.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
				}
				modelAndViewObj.addObject("searchName", searchNameStr);
				modelAndViewObj.addObject("groupsList", groupDetails);
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ProductGroupMaster/productGroupMaster");
				
			}catch(Exception e){
				e.printStackTrace();
			}
			return modelAndViewObj;
		}
		
		/**
		 * 
		 * @author Viswanath
		 * 
		 *This method is used to display new Shipment Rate form.
		 *
		 **/
		

		@RequestMapping(value="/newShipmentRateMaster")
		public ModelAndView newShipmentRateMaster(@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName, HttpServletRequest request,HttpServletResponse response){
			try{
				// log.info("newShipmentRateMaster");
				modelAndViewObj = new ModelAndView();
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,true,false);
				BatchOperationsResponse  batchOperationsResponse = dataManagementServiceObj.getPackages("", "","-1","","");
				modelAndViewObj.addObject("batchOperationsResponse",batchOperationsResponse.getBatchOperationsList());
				modelAndViewObj.addObject("locationsList", locationsList);
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ShipmentRateMaster/newShipmentRateMaster");
			}catch(Exception exception){
				exception.printStackTrace();
			}
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);

			return modelAndViewObj;
		}



		
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to view  Shipment Rates  
	 *
	 **/


	@RequestMapping("/viewShipmentRateMaster")
	public ModelAndView viewShipmentRateMaster(@RequestParam("index")String index,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewShipmentRateMaster");
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			List<ShipmentRateMaster> shipmentRatesList = outletMasterServiceObj.getShipmentRates(searchName,customerIdStr, emailIdStr,index,false,maxRecords);
			if(shipmentRatesList == null || shipmentRatesList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(shipmentRatesList.size()<end){
					end = (shipmentRatesList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(shipmentRatesList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("shipmentRatesList", shipmentRatesList);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);

			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ShipmentRateMaster/viewShipmentRateMaster");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}	
	
	
	
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to create New Shipment Rate
	 *
	 **/


	@RequestMapping(value="/createShipmentRateMaster",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createShipmentRateMaster(@RequestBody ShipmentRateMaster shipmentRateMasterObj,HttpServletRequest request,HttpServletResponse response){
	try{
		// log.info("createShipmentRateMaster");
		modelAndViewObj = new ModelAndView();
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
		String resultStr = outletMasterServiceObj.createNewShipmentRate(shipmentRateMasterObj, customerIdStr, emailIdStr);
		if(!resultStr.equals(AppProperties.getAppMessageByProperty("SHIPMENT_RATE_CREATE_SUCCESS").trim())){
			modelAndViewObj.addObject("shipmentRateDetails", shipmentRateMasterObj);
			modelAndViewObj.addObject("err", resultStr);
			modelAndViewObj.addObject("type", "new");
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ShipmentRateMaster/newShipmentRateMaster");
		}else{
			modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ShipmentRateMaster/newShipmentRateMaster");
		}
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.addObject("maxRecords",shipmentRateMasterObj.getMaxRecords());
		modelAndViewObj.addObject("searchName",shipmentRateMasterObj.getSearchCriteria());
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
	}

	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to display the Edit ShipmentRate form consisting  of Shipment Rate details
	 *
	 **/

	@RequestMapping("/editShipmentRate")
	public ModelAndView editShipmentRate(@RequestParam("rateNo") String rateNoStr,@RequestParam("operation") String operation,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("editShipmentRate");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,true,true);
			modelAndViewObj = new ModelAndView();
			List<ShipmentRateMaster> shipmentRatesList = outletMasterServiceObj.getShipmentRates(rateNoStr,customerIdStr, emailIdStr,"0",false,"");
			BatchOperationsResponse  batchOperationsResponse = dataManagementServiceObj.getPackages("", "","-1","","");
			String batchList =null;
			List<String> batchlist = new ArrayList<String>();
			for(int i=0;i<batchOperationsResponse.getBatchOperationsList().size();i++)
			{
				//////////System.out.println(batchOperationsResponse.getBatchOperationsList().get(i).getBatch_title());
				batchList=batchOperationsResponse.getBatchOperationsList().get(i).getBatch_title();
				batchlist.add(batchList);
			}
			
			modelAndViewObj.addObject("batchOperationsResponse",batchlist);
			if(shipmentRatesList !=  null && shipmentRatesList.size() > 0){
			modelAndViewObj.addObject("shipmentRateObj", shipmentRatesList.get(0));
			}
			if(operation.equals("view"))
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ShipmentRateMaster/viewSpecificShipmentRate");
			else
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ShipmentRateMaster/editShipmentRate");
			modelAndViewObj.addObject("locationsList", locationsList);
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		
		modelAndViewObj.addObject("maxRecords",maxRecords);
		modelAndViewObj.addObject("searchName",searchName);

		return modelAndViewObj;
	}








	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to update the Existing Brand
	 *
	 **/

	@RequestMapping(value="/updateShipmentRateMaster",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView updateShipmentRateMaster(@RequestBody ShipmentRateMaster rateMasterObj,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("updateBrandMaster");
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,true);
			String resultStr=outletMasterServiceObj.updateShipmentRate(rateMasterObj, customerIdStr, emailIdStr);
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("SHIPMENT_RATE_UPDATE_SUCCESS").trim()))
				modelAndViewObj.addObject("err", resultStr);
			else
				modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.addObject("shipmentRateObj", rateMasterObj);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("maxRecords",rateMasterObj.getMaxRecords());
			modelAndViewObj.addObject("searchName",rateMasterObj.getSearchCriteria());
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ShipmentRateMaster/editShipmentRate");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}

	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to delete the Brand
	 *
	 **/

	@RequestMapping("/deleteShipmentRate")
	public ModelAndView deleteShipmentRate(@RequestParam("ids") String ids,@RequestParam("searchName") String searchName,@RequestParam("maxRecords") String maxRecords,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("deleteShipmentRate ");
			int start = 1,end = Integer.parseInt(maxRecords);
			modelAndViewObj = new ModelAndView();
			//////////System.out.println("Ids : "+ids);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = outletMasterServiceObj.deleteShipmentRate(customerIdStr,emailIdStr,ids);
			List<ShipmentRateMaster> shipmentRatesList = outletMasterServiceObj.getShipmentRates(searchName,customerIdStr, emailIdStr,"0",false,maxRecords);
			if(shipmentRatesList == null || shipmentRatesList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(shipmentRatesList.size()<end){
					end = (shipmentRatesList.size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(shipmentRatesList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("shipmentRatesList", shipmentRatesList);
			modelAndViewObj.addObject("err", resultStr);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);
			
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ShipmentRateMaster/viewShipmentRateMaster");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}

	
	
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to search the Shipment Rates 
	 *11/12/2015
	 **/
	@RequestMapping("/searchShipmentRate")
	public ModelAndView searchShipmentRate(@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index, @RequestParam("maxRecords") String maxRecords,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		try{
			// log.info("searchShipmentRate");
			int start = 1,end = Integer.parseInt(maxRecords);
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<ShipmentRateMaster> shipmentRatesList = outletMasterServiceObj.getShipmentRates(searchNameStr,customerIdStr, emailIdStr,"0",true,maxRecords);
			modelAndViewObj = new ModelAndView();
			if(shipmentRatesList == null || shipmentRatesList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(shipmentRatesList.size()<end)
				{
					end = (shipmentRatesList.size())+(Integer.parseInt(index));
				}
				else
				{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(shipmentRatesList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("shipmentRatesList", shipmentRatesList);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ShipmentRateMaster/viewShipmentRateMaster");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}


	
	/**
	 * 
	 * @author Chaithanya
	 * 
	 *This method is used to view  Price Ranges   
	 *
	 **/
	@RequestMapping("/viewpriceRangeMaster")
	public ModelAndView viewpriceRangeMaster(@RequestParam("index")String index,@RequestParam("maxRecords")String maxRecords,@RequestParam("searchName")String searchName,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewShipmentRateMaster");
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			PriceRangeResponse priceRangeMasterResponeObj  = outletMasterServiceObj.getPriceRanges(searchName,customerIdStr, emailIdStr,index,maxRecords,false);
			if(priceRangeMasterResponeObj.getPriceRangeMasters() == null || priceRangeMasterResponeObj.getPriceRangeMasters().size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(priceRangeMasterResponeObj.getPriceRangeMasters().size()<end){
					end = (priceRangeMasterResponeObj.getPriceRangeMasters().size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", priceRangeMasterResponeObj.getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("shipmentRatesList", priceRangeMasterResponeObj.getPriceRangeMasters());
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/PriceRangeMaster/priceRangeMaster");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}	
	
	
	
	
	
@RequestMapping(value="/createPriceRangeMaster",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createPriceRangeMaster(
			HttpServletRequest request,HttpServletResponse response,@RequestBody PriceRangeMaster priceRangeMasterObj){
		modelAndViewObj = new ModelAndView();
		// log.info("In create PriceRangeMaster");
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		 
			try{
			String resultStr=outletMasterServiceObj.createPriceRangeMaster(customerIdStr,emailIdStr,priceRangeMasterObj);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/PriceRangeMaster/newPriceRangeMaster");	
			if(resultStr.equals(AppProperties.getAppMessageByProperty("PRICERANGE_CREATE_SUCCESS").trim())){
					modelAndViewObj.addObject("success", resultStr);
					modelAndViewObj.addObject("type", "new");
					modelAndViewObj.addObject("priceRangeResponse", priceRangeMasterObj);
					modelAndViewObj.addObject("priceRangeChilds",priceRangeMasterObj.getPriceRangeChilds());
					/*List<Sku> skuList = skuServiceObj.getSKUDetails(null, customerIdStr, emailIdStr,"0");*/
					List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
					modelAndViewObj.addObject("categoryList",categoryList);
					/*modelAndViewObj.addObject("skuList",skuList);*/
					
				}else{
					modelAndViewObj.addObject("priceRangeResponse", priceRangeMasterObj);
					modelAndViewObj.addObject("priceRangeChilds",priceRangeMasterObj.getPriceRangeChilds());
					modelAndViewObj.addObject("err", resultStr);
					modelAndViewObj.addObject("maxRecords",priceRangeMasterObj.getMaxRecords());
					//modelAndViewObj.addObject("maxRecords",priceRangeMasterObj.getSearchCriteria());
					
				}
				
			}
			
			catch(Exception e){
				e.printStackTrace();
				
			}

		
		return modelAndViewObj;
	}
/**
 * 
 * @author N.Raviteja
 * 
 *This method is used to update  Price Ranges   
 *
 **/
@RequestMapping(value="/updatePriceRangeMaster",method=RequestMethod.POST,consumes="application/json")
public ModelAndView updatePriceRangeMaster(
		HttpServletRequest request,HttpServletResponse response,@RequestBody PriceRangeMaster priceRangeMasterObj){
	modelAndViewObj = new ModelAndView();
	// log.info("In create PriceRangeMaster");
	String customerIdStr = (String)request.getSession().getAttribute("customerId");
	String emailIdStr = (String)request.getSession().getAttribute("emailId");
	 
		try{
		String resultStr=outletMasterServiceObj.updatePriceRangeMaster(customerIdStr,emailIdStr,priceRangeMasterObj);
		modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/PriceRangeMaster/editPriceRangeMaster");	
		
		if(resultStr.equals(AppProperties.getAppMessageByProperty("PRICERANGE_UPDATE_SUCCESS").trim())){
				
				modelAndViewObj.addObject("success", resultStr);
				modelAndViewObj.addObject("type", "update");
				/*List<Sku> skuList = skuServiceObj.getSKUDetails(null, customerIdStr, emailIdStr,"0");*/
				List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
				modelAndViewObj.addObject("categoryList",categoryList);
				modelAndViewObj.addObject("priceRangeResponse",priceRangeMasterObj);
				/*modelAndViewObj.addObject("skuList",skuList);*/
				
				
			}else{
				modelAndViewObj.addObject("err", resultStr);
				
			}
			
		}
		
		catch(Exception e){
			e.printStackTrace();
			
		}
		modelAndViewObj.addObject("maxRecords",priceRangeMasterObj.getMaxRecords());
		modelAndViewObj.addObject("searchName",priceRangeMasterObj.getSearchCriteria());
	
	return modelAndViewObj;
}

	
	
	@RequestMapping("/deletePriceRange")
	public ModelAndView deletePriceRange(@RequestParam("ids") String ids,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("deleteShipmentRate ");
			int start = 1,end = 10;
			modelAndViewObj = new ModelAndView();
		//	////////System.out.println("Ids : "+ids);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = outletMasterServiceObj.deletePriceRange(customerIdStr,emailIdStr,ids);
			PriceRangeResponse priceRangeMasterResponeObj  = outletMasterServiceObj.getPriceRanges("",customerIdStr, emailIdStr,"0","",false);
			if(priceRangeMasterResponeObj.getPriceRangeMasters() == null || priceRangeMasterResponeObj.getPriceRangeMasters().size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(priceRangeMasterResponeObj.getPriceRangeMasters().size()<10){
					end = (priceRangeMasterResponeObj.getPriceRangeMasters().size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", priceRangeMasterResponeObj.getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("err", resultStr);
			}
			modelAndViewObj.addObject("shipmentRatesList", priceRangeMasterResponeObj.getPriceRangeMasters());
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/PriceRangeMaster/priceRangeMaster");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}	

	/**
	 * 
	 * @author N.Raviteja
	 * 
	 *This method is used to view  perticular Price Ranges record  
	 *
	 **/
	@RequestMapping("/viewEditPriceRangeMaster")
	public ModelAndView viewEditPriceRangeMaster(
			HttpServletRequest request,HttpServletResponse response,@RequestParam("priceRangeId") String priceRangeId,@RequestParam("maxRecords")String maxRecords,@RequestParam("searchName") String searchName, 
			@RequestParam("type") String type){
		modelAndViewObj = new ModelAndView();
		// log.info("In get PriceRangeMaster");
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		
	try {
		PriceRangeResponse priceRangeResponse=outletMasterServiceObj.getPriceRangeMaster(priceRangeId);
		List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
		if(priceRangeResponse!=null){
			modelAndViewObj.addObject("categoryList",categoryList);
			modelAndViewObj.addObject("priceRangeChilds",priceRangeResponse.getPriceRangeChilds());
			modelAndViewObj.addObject("priceRangeResponse",priceRangeResponse.getPriceRangeMasterObj());
		}
		if(type.equals("view"))
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/PriceRangeMaster/viewPriceRangeMaster");
		else
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/PriceRangeMaster/editPriceRangeMaster");
			
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	modelAndViewObj.addObject("maxRecords",maxRecords);
	modelAndViewObj.addObject("searchName",searchName);
	return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author N.Raviteja
	 * 
	 *This method is used to view get new Price Ranges form  
	 *
	 **/
	
	@RequestMapping("/newPriceRangeMaster")
	public ModelAndView newPriceRangeMaster(@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
		 modelAndViewObj = new ModelAndView();
		 String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			try{
				/*List<Sku> skuList = skuServiceObj.getSKUDetails(null, customerIdStr, emailIdStr,"0");*/
				List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
				
				modelAndViewObj.addObject("categoryList",categoryList);
			/*	modelAndViewObj.addObject("skuList",skuList);*/
				modelAndViewObj.addObject("searchName", searchName);
			    modelAndViewObj.addObject("maxRecords", maxRecords);
				 modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/PriceRangeMaster/newPriceRangeMaster");
			}
			
			catch(Exception e){
				e.printStackTrace();
				
			}
			
		
		return modelAndViewObj;
	}
	/*@RequestMapping(value="/createPriceRangeMaster",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createPriceRangeMaster(@RequestBody PriceRangeMaster priceRangeMasterObj,
			HttpServletRequest request,HttpServletResponse response){
		modelAndViewObj = new ModelAndView();
		// log.info("In create PriceRangeMaster");
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		 
			try{
			String resultStr=outletMasterServiceObj.createPriceRangeMaster(customerIdStr,emailIdStr,priceRangeMasterObj);
				if(resultStr==null){
					
					modelAndViewObj.addObject("err", resultStr);
					modelAndViewObj.addObject("type", "new");
					modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ShipmentRateMaster/editShipmentRateMaster");
				}else{
					modelAndViewObj.addObject("success", resultStr);
					modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ShipmentRateMaster/newShipmentRateMaster");
				}
				
			}
			
			catch(Exception e){
				e.printStackTrace();
				
			}
			
			 
			
			 
			
		return modelAndViewObj;
		
	}*/
	/**
	 * 
	 * @author N.Raviteja
	 * 
	 *This method is used to view get new Price Ranges form  
	 *
	 **/
	
	@RequestMapping("/viewEditBomMaster")
	public ModelAndView viewEditBomMaster(
			@RequestParam("priceRangeId") String bomRef,
			@RequestParam("type") String type,@RequestParam("maxRecords")String maxRecords,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
		modelAndViewObj = new ModelAndView();
	try {
		BillOfMaterialResponse priceRangeResponse=outletMasterServiceObj.getBoms("", "", "", "0", bomRef,maxRecords,"");
		if(priceRangeResponse!=null){
			modelAndViewObj.addObject("bomresponse",priceRangeResponse.getBomObj());
		}
		if(type.equals("view"))
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/BomMaster/viewBomMaster");
		else
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/BomMaster/newBomMaster");
			
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	modelAndViewObj.addObject("maxRecords",maxRecords);
	modelAndViewObj.addObject("searchName",searchName);
	return modelAndViewObj;
	}
	
	
	
	/**
	 * 
	 * @author N.Vijay
	 * @writtenDate dec 19,2018
	 * @Desc This method is used to view get new Price Ranges form  
	 *
	 **/
	
	@RequestMapping("/getSerialId")
	public @ResponseBody String getSerialId(
			@RequestParam("id") String id,
			@RequestParam("noOfDigits") String noOfDigits,HttpServletRequest request,HttpServletResponse response){
		modelAndViewObj = new ModelAndView();
		try {

			

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";

	}
	
	
	
	@RequestMapping("/viewProductGroupforHomepage")
	public @ResponseBody List<Group>  viewProductGroupforHomepage(
			
			@RequestParam("index") String index, 
			@RequestParam("searchCriteria") String searchCriteria, 
			@RequestParam("maxRecords")String maxRecords,
			
			HttpServletRequest request,HttpServletResponse response){
		List<Group> groupsList = null;
		try{
			// log.info("viewProductGroup ");
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			 groupsList = outletMasterServiceObj.getProductGroupDetails(searchCriteria,customerIdStr, emailIdStr,index,maxRecords,true);
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return groupsList;
	}
	
	@RequestMapping(value="/createHomepageGroup")
	public ModelAndView createHomepageGroup(@RequestParam("groupid") String groupIdStr,HttpServletRequest request,HttpServletResponse response){
		
		try{
			int start = 1,end = 10;
			// log.info("createProductGroupMaster");
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<Group> groupsList = null;
			
			GroupChild groupDetails = outletMasterServiceObj.getProductGroupDetailsforGroupId(groupIdStr,customerIdStr, emailIdStr,"-1",false,"","10");
			
			groupsList = outletMasterServiceObj.getProductGroupDetails(groupIdStr,customerIdStr, emailIdStr,"0","100",true);
			
			//////System.out.println(gson.toJson(groupDetails));
			HomePageGroup homepageGroup = new HomePageGroup();
			
			homepageGroup.setGroupId(groupDetails.getGroupObj().getGroupId());
			homepageGroup.setGroupDescription(groupDetails.getGroupObj().getGroupDescription());
			homepageGroup.setGroupName(groupDetails.getGroupObj().getGroupDescription());
			homepageGroup.setGroupCategory(groupDetails.getGroupObj().getGroupProductCategory());
			if(groupDetails.getGroupObj().getGroupStatus() == 1){
				
				homepageGroup.setStatus(true);
			}
			homepageGroup.setGroupImage(groupsList.get(0).getGroupImage());
			homepageGroup.setHomePageOrder(false);
			
			
			String resultStr=outletMasterServiceObj.createNewHomepageProductGroup(homepageGroup, customerIdStr, emailIdStr);
			List<HomePageGroup> dealsList = outletMasterServiceObj.getHomepagegroupInfo("",customerIdStr, emailIdStr,"0","10","");
			modelAndViewObj = new ModelAndView();
			if(dealsList == null || dealsList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(dealsList.size()<10){
					end = (dealsList.size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", (dealsList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("dealsList", dealsList);
			modelAndViewObj.addObject("maxRecords", "10");
			
			
			if(resultStr == "Homepage Group created successfully" || resultStr.equals("Homepage Group created successfully")){
				modelAndViewObj.addObject("success", resultStr);

				modelAndViewObj.addObject("err", "");
			}else{
				modelAndViewObj.addObject("success", "");
			modelAndViewObj.addObject("err", resultStr);
			}
			modelAndViewObj.setViewName("B2C/homePageGroups/viewHomePageGroups");				
			
			
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		 
		return modelAndViewObj;
	}
	
	
	
	
	@RequestMapping(value="/newEventManagement")
	public ModelAndView newEventManagement(@RequestParam("operation") String operation,@RequestParam("maxRecords") String maxRecords,HttpServletRequest request,HttpServletResponse response){
		List<String> locationsList = null;
		String locationListAll = "";
		List<EmployeeBean> employeeList = new ArrayList<EmployeeBean>();
		try{
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			ArrayList<TenderMaster> tenderDetails = genericMasterServiceObj.getTender("",customerIdStr,emailIdStr,"-1",100);
			
			if(locationsList != null){
				
				for (String string : locationsList) {
					
					locationListAll = locationListAll+string+",";
				}
				}

			employeeList = genericMasterServiceObj.getEmployees("",customerIdStr, emailIdStr,"0","","100",false,locationListAll);

	         modelAndViewObj.addObject("employeeList", employeeList);


			modelAndViewObj.addObject("tenderDetails", tenderDetails);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.setViewName("Inventory Manager/EventManagement/newevent");				
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		 
		return modelAndViewObj;
	}
	
	
	@RequestMapping(value="/createEventManagement",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createEventManagement(@RequestBody EventMaster  eventMaster,HttpServletRequest request,HttpServletResponse response){
		List<String> locationsList = null;
		String locationListAll = "";
		Map<String,Object> responseMapObj = null;
		String resultStr,eventRef;
		List<EmployeeBean> employeeList = new ArrayList<EmployeeBean>();
		List<EventMaster> eventMasters = new ArrayList<EventMaster>();

		try{
			
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			responseMapObj = outletMasterServiceObj.createEventManagemnt(eventMaster,customerIdStr,emailIdStr);
			resultStr = (String)responseMapObj.get("result");
			eventRef = (String)responseMapObj.get("eventRef");
			
			modelAndViewObj = new ModelAndView();
			
			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			ArrayList<TenderMaster> tenderDetails = genericMasterServiceObj.getTender("",customerIdStr,emailIdStr,"-1",100);
			
			modelAndViewObj.addObject("tenderDetails", tenderDetails);
			modelAndViewObj.addObject("locationsList", locationsList);
			
			if(locationsList != null){
				
				for (String string : locationsList) {
					
					locationListAll = locationListAll+string+",";
				}
				} 
			employeeList = genericMasterServiceObj.getEmployees("",customerIdStr, emailIdStr,"0","","100",false,locationListAll);

	         modelAndViewObj.addObject("employeeList", employeeList);

			if(resultStr.contains(Constants.SUCCESS)){
				
				eventMasters = outletMasterServiceObj.getEventManagementDetails(customerIdStr, emailIdStr,"-1","10",eventRef,false,"","","","","","","","",false);
				  for(int i = 0;i<tenderDetails.size();i++){
					   if(tenderDetails.get(i).getTenderName().equalsIgnoreCase(eventMasters.get(0).getPaymentMode())){
						   eventMasters.get(0).setCardType(tenderDetails.get(i).getModeOfPayment());
					   }
				   }
	            modelAndViewObj.addObject("eventMastersList", eventMasters.get(0));
				if(eventMasters.get(0).getMenuDetails() != null && eventMasters.get(0).getMenuDetails().size() != 0)
			 	modelAndViewObj.addObject("eventMastersMenuList", eventMasters.get(0).getMenuDetails().get(0));
				modelAndViewObj.addObject("eventMastersPaymentsList", eventMasters.get(0).getEventPaymentTransactions());
				modelAndViewObj.addObject("eventMastersManpower", eventMasters.get(0).getEventManPowerDetails());

				modelAndViewObj.addObject("success", resultStr);
				
				modelAndViewObj.addObject("eventRef", eventRef);
				modelAndViewObj.addObject("eventMasterData", eventMaster);
				modelAndViewObj.addObject("selectedLocation", eventMaster.getOutletStoreLocation());
				modelAndViewObj.setViewName("Inventory Manager/EventManagement/editevent");
				
			}else{

				modelAndViewObj.addObject("eventMaster", eventMaster);
				modelAndViewObj.addObject("err", resultStr);
				modelAndViewObj.addObject("type", "new");
				
				SimpleDateFormat format1 = new SimpleDateFormat("dd/mm/yyyy");
				SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
				Date date = format2.parse(eventMaster.getStartDateStr());
				Date date1 = format2.parse(eventMaster.getEndDateStr());
				Date date2 = format2.parse(eventMaster.getCreatedDateStr());
				String startDateStr =  format1.format(date).toString();
				String endDateStr  =  format1.format(date1).toString();
				String createdDateStr  =  format1.format(date2).toString();
				eventMaster.setStartDateStr(startDateStr);
				eventMaster.setEndDateStr(endDateStr);
				eventMaster.setCreatedDateStr(createdDateStr);
				modelAndViewObj.addObject("eventMasterData", eventMaster);
				modelAndViewObj.setViewName("Inventory Manager/EventManagement/newevent");	
			}
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}

	
	
	
	
	
	
	
	@RequestMapping(value="/updateEventManagement",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView updateEventManagement(@RequestBody EventMaster  eventMaster,HttpServletRequest request,HttpServletResponse response){
		List<String> locationsList = null;
		Map<String,Object> responseMapObj = null;
		String resultStr,eventRef;
		List<EventMaster> eventMasters = new ArrayList<EventMaster>();
		String locationListAll = "";
		
		List<EmployeeBean> employeeList = new ArrayList<EmployeeBean>();


		try{
			
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			responseMapObj = outletMasterServiceObj.updateEventManagemnt(eventMaster,customerIdStr,emailIdStr);
			resultStr = (String)responseMapObj.get("result");
			eventRef = (String)responseMapObj.get("eventRef");
			
			modelAndViewObj = new ModelAndView();
			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			ArrayList<TenderMaster> tenderDetails = genericMasterServiceObj.getTender("",customerIdStr,emailIdStr,"-1",100);
			
                if(locationsList != null){
				
				for (String string : locationsList) {
					
					locationListAll = locationListAll+string+",";
				}
				}
			
			
			employeeList = genericMasterServiceObj.getEmployees("",customerIdStr, emailIdStr,"0","","100",false,locationListAll);

	         modelAndViewObj.addObject("employeeList", employeeList);

			
			modelAndViewObj.addObject("tenderDetails", tenderDetails);
			modelAndViewObj.addObject("locationsList", locationsList);
			
		

			eventMasters = outletMasterServiceObj.getEventManagementDetails(customerIdStr, emailIdStr,"-1","10",eventMaster.getEventReference(),false,"","","","","","","","",false);

		   for(int i = 0;i<tenderDetails.size();i++){
			   if(tenderDetails.get(i).getTenderName().equalsIgnoreCase(eventMasters.get(0).getPaymentMode())){
				   eventMasters.get(0).setCardType(tenderDetails.get(i).getModeOfPayment());
			   }
		   }
			
			
              modelAndViewObj.addObject("eventMastersList", eventMasters.get(0));
			if(eventMasters.get(0).getMenuDetails() != null && eventMasters.get(0).getMenuDetails().size() != 0)
		 	modelAndViewObj.addObject("eventMastersMenuList", eventMasters.get(0).getMenuDetails().get(0));
			modelAndViewObj.addObject("eventMastersPaymentsList", eventMasters.get(0).getEventPaymentTransactions());
			modelAndViewObj.addObject("eventMastersManpower", eventMasters.get(0).getEventManPowerDetails());


             modelAndViewObj.addObject("eventRef", eventMaster.getEventReference());
			modelAndViewObj.addObject("selectedLocation", eventMasters.get(0).getOutletStoreLocation());

			 modelAndViewObj.addObject("SubmittionCountvalEquip", "1");
			   modelAndViewObj.addObject("SubmittionCountval", "1");
			   modelAndViewObj.addObject("SubmittionCountvalEmp", "1");
			
			if(resultStr.contains(Constants.SUCCESS)){
				modelAndViewObj.addObject("success", resultStr);
				modelAndViewObj.addObject("eventRef", eventRef);
				modelAndViewObj.addObject("selectedLocation", eventMaster.getOutletStoreLocation());
				modelAndViewObj.setViewName("Inventory Manager/EventManagement/editevent");
				
			}else{
				modelAndViewObj.addObject("eventMaster", eventMaster);
				modelAndViewObj.addObject("err", resultStr);
				modelAndViewObj.addObject("type", "new");
				modelAndViewObj.setViewName("Inventory Manager/EventManagement/editevent");	
			}
		
		
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		 
		return modelAndViewObj;
	}

	
	

	@RequestMapping(value="/createEventManagementMenu",method=RequestMethod.POST)
	public ModelAndView createEventManagementMenu(@RequestParam("formData") String data,HttpServletRequest request,HttpServletResponse response){
		List<String> locationsList = null;
		Menu menu = null;
		Map<String,Object> responseMapObj = null;
		String resultStr,eventRef;
		try{ 
			
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			
			menu = gson.fromJson(data,Menu.class);
			
			responseMapObj = outletMasterServiceObj.createEventManagemntMenu(menu,customerIdStr,emailIdStr);
			resultStr = (String)responseMapObj.get("result");
			eventRef = (String)responseMapObj.get("eventRef");
			
			
			
			modelAndViewObj = new ModelAndView();
			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			modelAndViewObj.addObject("locationsList", locationsList);
			
			
			if(resultStr.contains(Constants.SUCCESS)){
				modelAndViewObj.addObject("SuccessMenu", resultStr);
				modelAndViewObj.addObject("type", "new");
				modelAndViewObj.addObject("eventRef", eventRef);
				modelAndViewObj.addObject("selectedLocation", menu.getOutlet_name());
				modelAndViewObj.setViewName("Inventory Manager/EventManagement/newevent");
			}else{
				modelAndViewObj.addObject("errMenu", resultStr);
				modelAndViewObj.setViewName("Inventory Manager/EventManagement/newevent");
			}
		
		
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		 
		return modelAndViewObj;
	}

	
	
	
	

	@RequestMapping(value="/updateEventManagementMenu",method=RequestMethod.POST)
	public ModelAndView updateEventManagementMenu(@RequestParam("formData") String data,HttpServletRequest request,HttpServletResponse response){
		List<String> locationsList = null;
		Menu menu = null;
		Map<String,Object> responseMapObj = null;
		String resultStr,eventRef;
		List<EventMaster> eventMasters = new ArrayList<EventMaster>();
		String locationListAll = "";
		
		List<EmployeeBean> employeeList = new ArrayList<EmployeeBean>();

		try{ 
			
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			
			menu = gson.fromJson(data,Menu.class);
			
			responseMapObj = outletMasterServiceObj.updateEventManagemntMenu(menu,customerIdStr,emailIdStr);
			resultStr = (String)responseMapObj.get("result");
			eventRef = (String)responseMapObj.get("eventRef");
			
			modelAndViewObj = new ModelAndView();
			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			modelAndViewObj.addObject("locationsList", locationsList);
			
			ArrayList<TenderMaster> tenderDetails = genericMasterServiceObj.getTender("",customerIdStr,emailIdStr,"-1",100);

			eventMasters = outletMasterServiceObj.getEventManagementDetails(customerIdStr, emailIdStr,"-1","10",menu.getEventReference(),false,"","","","","","","","",false);
			  for(int i = 0;i<tenderDetails.size();i++){
				   if(tenderDetails.get(i).getTenderName().equalsIgnoreCase(eventMasters.get(0).getPaymentMode())){
					   eventMasters.get(0).setCardType(tenderDetails.get(i).getModeOfPayment());
				   }
			   }
            modelAndViewObj.addObject("eventMastersList", eventMasters.get(0));
			if(eventMasters.get(0).getMenuDetails() != null && eventMasters.get(0).getMenuDetails().size() != 0)
		 	modelAndViewObj.addObject("eventMastersMenuList", eventMasters.get(0).getMenuDetails().get(0));
			modelAndViewObj.addObject("eventMastersPaymentsList", eventMasters.get(0).getEventPaymentTransactions());
			modelAndViewObj.addObject("eventMastersManpower", eventMasters.get(0).getEventManPowerDetails());
			 modelAndViewObj.addObject("SubmittionCountvalEquip", "1");
			   modelAndViewObj.addObject("SubmittionCountval", "1");
			   modelAndViewObj.addObject("SubmittionCountvalEmp", "1");


           modelAndViewObj.addObject("eventRef", menu.getEventReference());
			modelAndViewObj.addObject("selectedLocation", eventMasters.get(0).getOutletStoreLocation());
			  if(locationsList != null){
					
					for (String string : locationsList) {
						
						locationListAll = locationListAll+string+",";
					}
					}
			  
			  employeeList = genericMasterServiceObj.getEmployees("",customerIdStr, emailIdStr,"0","","100",false,locationListAll);

		         modelAndViewObj.addObject("employeeList", employeeList);

			modelAndViewObj.addObject("tenderDetails", tenderDetails);
				
			
			if(resultStr.contains(Constants.SUCCESS)){
				modelAndViewObj.addObject("successMenu", resultStr);
				modelAndViewObj.addObject("type", "new");
				modelAndViewObj.addObject("eventRef", eventRef);
				modelAndViewObj.addObject("selectedLocation", menu.getOutlet_name());
				modelAndViewObj.setViewName("Inventory Manager/EventManagement/editevent");
			}else{
				modelAndViewObj.addObject("errMenu", resultStr);
				modelAndViewObj.setViewName("Inventory Manager/EventManagement/editevent");
			}
		
		
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		 
		return modelAndViewObj;
	}


	@RequestMapping(value="/loadMenu",method=RequestMethod.POST)
	public ModelAndView loadMenu(@RequestParam("location") String location,HttpServletRequest request,HttpServletResponse response){
	List<String> locationsList = null;
	
	modelAndViewObj = new ModelAndView();
	EventMaster   eventresponse = new EventMaster();
		
	String customerIdStr = (String)request.getSession().getAttribute("customerId");
	String emailIdStr = (String)request.getSession().getAttribute("emailId");
		
		try{ 
		    String resultStr = outletMasterServiceObj.loadMenu(location,customerIdStr,emailIdStr);
			
			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			modelAndViewObj.addObject("locationsList", locationsList);
			
			
				if(resultStr.contains("successfully"))
				{
					modelAndViewObj.addObject("success", resultStr);
					modelAndViewObj.setViewName("Inventory Manager/EventManagement/eventManagementSummary");
				}
				else{
					modelAndViewObj.addObject("err", resultStr);
					modelAndViewObj.setViewName("Inventory Manager/EventManagement/eventManagementSummary");
				}
			/*else{
			if(resultStr.contains("successfully"))
			{
				modelAndViewObj.addObject("SuccessMenu", resultStr);
				modelAndViewObj.setViewName("Inventory Manager/EventManagement/neweventMenu");
			}
			else{
				modelAndViewObj.addObject("Error", resultStr);
				modelAndViewObj.setViewName("Inventory Manager/EventManagement/neweventMenu");
			}
			}*/
			
		modelAndViewObj.addObject("eventresponse", eventresponse);
		modelAndViewObj.addObject("loadLocation", location);
		}
		
		
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	@RequestMapping(value="/loadInventory",method=RequestMethod.POST)
	public ModelAndView loadInventory(@RequestParam("location") String location,HttpServletRequest request,HttpServletResponse response){
		List<String> locationsList = null;
		modelAndViewObj = new ModelAndView();
		EventMaster   eventresponse = new EventMaster();
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
			
			try{ 
			    String resultStr = outletMasterServiceObj.loadInventory(location,customerIdStr,emailIdStr);
				locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
				modelAndViewObj.addObject("locationsList", locationsList);
				
					if(resultStr.contains("successfully"))
					{
						modelAndViewObj.addObject("success", resultStr);
						modelAndViewObj.setViewName("Inventory Manager/EventManagement/eventManagementSummary");
					}
					else{
						modelAndViewObj.addObject("err", resultStr);
						modelAndViewObj.setViewName("Inventory Manager/EventManagement/eventManagementSummary");
					}
				
			modelAndViewObj.addObject("eventresponse", eventresponse);
			modelAndViewObj.addObject("loadLocation", location);
			}
			catch(Exception exception)
			{
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
	
	
	

	@RequestMapping(value="/editViewEventManagement",method=RequestMethod.POST)
	public ModelAndView editViewEventManagement(@RequestParam("eventid") String eventid,@RequestParam("operation") String operation,HttpServletRequest request,HttpServletResponse response){
		List<String> locationsList = null;
		List<EmployeeBean> employeeList = new ArrayList<EmployeeBean>();
		String locationListAll = "";
		
		List<EventMaster> eventMasters = new ArrayList<EventMaster>();
		try{ 
			
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			
			ArrayList<TenderMaster> tenderDetails = genericMasterServiceObj.getTender("",customerIdStr,emailIdStr,"-1",100);

			eventMasters = outletMasterServiceObj.getEventManagementDetails(customerIdStr, emailIdStr,"-1","10",eventid,false,"","","","","","","","",false);
			
			  for(int i = 0;i<tenderDetails.size();i++){
				   if(tenderDetails.get(i).getTenderName().equalsIgnoreCase(eventMasters.get(0).getPaymentMode())){
					   eventMasters.get(0).setCardType(tenderDetails.get(i).getModeOfPayment());
				   }
			   }
			modelAndViewObj = new ModelAndView();
			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			modelAndViewObj.addObject("locationsList", locationsList);
			//////System.out.println(gson.toJson(eventMasters.get(0)));
			if(eventMasters != null ){
			modelAndViewObj.addObject("eventMastersList", eventMasters.get(0));
			if(eventMasters.get(0).getMenuDetails() != null && eventMasters.get(0).getMenuDetails().size() != 0)
		 	modelAndViewObj.addObject("eventMastersMenuList", eventMasters.get(0).getMenuDetails().get(0));
			modelAndViewObj.addObject("eventMastersPaymentsList", eventMasters.get(0).getEventPaymentTransactions());
			modelAndViewObj.addObject("eventMastersManpower", eventMasters.get(0).getEventManPowerDetails());
			modelAndViewObj.addObject("selectedLocation", eventMasters.get(0).getOutletStoreLocation());
			modelAndViewObj.addObject("SubmittionCountInv", "1");

			}else{
				modelAndViewObj.addObject("err","Internal error,please contact admin for support.");
			}
			modelAndViewObj.addObject("tenderDetails", tenderDetails);
			
               if(locationsList != null){
				
				for (String string : locationsList) {
					
					locationListAll = locationListAll+string+",";
				}
				}

			employeeList = genericMasterServiceObj.getEmployees("",customerIdStr, emailIdStr,"0","","100",false,locationListAll);

	         modelAndViewObj.addObject("employeeList", employeeList);

			
			modelAndViewObj.addObject("eventRef", eventid);
			if(operation == "edit" || operation.equalsIgnoreCase("edit")){	
				modelAndViewObj.setViewName("Inventory Manager/EventManagement/editevent");
			}else{
				modelAndViewObj.setViewName("Inventory Manager/EventManagement/viewevent");
			}
		
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		 
		return modelAndViewObj;
	}

	
	
	

	@RequestMapping(value="/createEventManagementInventory",method=RequestMethod.POST)
	public ModelAndView createEventManagementInventory(@RequestParam("formData") String data,HttpServletRequest request,HttpServletResponse response){
		List<String> locationsList = null;
		EventMaster eventMaster = null;
		Map<String,Object> responseMapObj = null;
		String resultStr,eventRef;
		try{ 
			
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			
			eventMaster = gson.fromJson(data,EventMaster.class);
			
			responseMapObj = outletMasterServiceObj.createEventManagemntInventory(eventMaster,customerIdStr,emailIdStr);
			resultStr = (String)responseMapObj.get("result");
			eventRef = (String)responseMapObj.get("eventRef");
			
			
			
			modelAndViewObj = new ModelAndView();
			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			modelAndViewObj.addObject("locationsList", locationsList);
			
			
			if(resultStr.contains(Constants.SUCCESS)){
				modelAndViewObj.addObject("SuccessInventory", resultStr);
				modelAndViewObj.addObject("type", "new");
				modelAndViewObj.addObject("eventRef", eventRef);
				modelAndViewObj.addObject("selectedLocation", eventMaster.getOutletStoreLocation());
				modelAndViewObj.setViewName("Inventory Manager/EventManagement/newevent");
			}else{
				modelAndViewObj.addObject("errInventory", resultStr);
				modelAndViewObj.addObject("eventRef", eventRef);
				modelAndViewObj.setViewName("Inventory Manager/EventManagement/newevent");
			}
		
		
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		 
		return modelAndViewObj;
	}

	

	@RequestMapping(value="/updateEventManagementInventory",method=RequestMethod.POST)
	public ModelAndView updateEventManagementInventory(@RequestParam("formData") String data,HttpServletRequest request,HttpServletResponse response){
		List<String> locationsList = null;
		EventMaster eventMaster = null;
		Map<String,Object> responseMapObj = null;
		String resultStr,eventRef;
		List<EventMaster> eventMasters = new ArrayList<EventMaster>();
		String locationListAll = "";
		
		List<EmployeeBean> employeeList = new ArrayList<EmployeeBean>();

		try{ 
			
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			//System.out.println(data);
			eventMaster = gson.fromJson(data,EventMaster.class);
			
			responseMapObj = outletMasterServiceObj.updateEventManagemntInventory(eventMaster,customerIdStr,emailIdStr);
			resultStr = (String)responseMapObj.get("result");
			eventRef = (String)responseMapObj.get("eventRef");
			
			modelAndViewObj = new ModelAndView();
			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			modelAndViewObj.addObject("locationsList", locationsList);
			
			ArrayList<TenderMaster> tenderDetails = genericMasterServiceObj.getTender("",customerIdStr,emailIdStr,"-1",100);

			eventMasters = outletMasterServiceObj.getEventManagementDetails(customerIdStr, emailIdStr,"-1","10",eventMaster.getEventReference(),false,"","","","","","","","",false);
			  for(int i = 0;i<tenderDetails.size();i++){
				   if(tenderDetails.get(i).getTenderName().equalsIgnoreCase(eventMasters.get(0).getPaymentMode())){
					   eventMasters.get(0).setCardType(tenderDetails.get(i).getModeOfPayment());
				   }
			   }
			if(eventMasters != null){
            modelAndViewObj.addObject("eventMastersList", eventMasters.get(0));
          
            if(eventMasters.get(0).getMenuDetails() != null && eventMasters.get(0).getMenuDetails().size() != 0)
		 	modelAndViewObj.addObject("eventMastersMenuList", eventMasters.get(0).getMenuDetails().get(0));
			modelAndViewObj.addObject("eventMastersPaymentsList", eventMasters.get(0).getEventPaymentTransactions());
			modelAndViewObj.addObject("eventMastersManpower", eventMasters.get(0).getEventManPowerDetails());
			modelAndViewObj.addObject("selectedLocation", eventMasters.get(0).getOutletStoreLocation());
             }

           modelAndViewObj.addObject("eventRef", eventMaster.getEventReference());
			  if(locationsList != null){
					
					for (String string : locationsList) {
						
						locationListAll = locationListAll+string+",";
					}
					}
			  
			  employeeList = genericMasterServiceObj.getEmployees("",customerIdStr, emailIdStr,"0","","100",false,locationListAll);

		         modelAndViewObj.addObject("employeeList", employeeList);

			modelAndViewObj.addObject("tenderDetails", tenderDetails);
			 modelAndViewObj.addObject("SubmittionCountvalEquip", "1");
			   modelAndViewObj.addObject("SubmittionCountval",eventMasters.get(0).getSubmissionCount());
			   modelAndViewObj.addObject("SubmittionCountvalEmp", "1");
			
			if(resultStr.contains(Constants.SUCCESS)){
				modelAndViewObj.addObject("successInventory", resultStr);
				modelAndViewObj.addObject("type", "new");
				modelAndViewObj.addObject("eventRef", eventRef);
				modelAndViewObj.addObject("selectedLocation", eventMaster.getOutletStoreLocation());
				modelAndViewObj.addObject("SubmittionCountval", eventMaster.getSubmissionCount());
				
				modelAndViewObj.setViewName("Inventory Manager/EventManagement/editevent");
			}else{
				modelAndViewObj.addObject("errInventory", resultStr);
				modelAndViewObj.addObject("SubmittionCountval", eventMaster.getSubmissionCount());
				modelAndViewObj.setViewName("Inventory Manager/EventManagement/editevent");
			}
		
		
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		 
		return modelAndViewObj;
	}


	
	

	@RequestMapping(value="/createEventManagementManpower",method=RequestMethod.POST)
	public ModelAndView createEventManagementManpower(@RequestParam("formData") String data,HttpServletRequest request,HttpServletResponse response){
		List<String> locationsList = null;
		EventMaster eventMaster = null;
		Map<String,Object> responseMapObj = null;
		String resultStr,eventRef;
		try{ 
			
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			
			eventMaster = gson.fromJson(data,EventMaster.class);
			
			responseMapObj = outletMasterServiceObj.createEventManagemntManpower(eventMaster,customerIdStr,emailIdStr);
			resultStr = (String)responseMapObj.get("result");
			eventRef = (String)responseMapObj.get("eventRef");
			
			
			
			modelAndViewObj = new ModelAndView();
			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			modelAndViewObj.addObject("locationsList", locationsList);
			
			
			if(resultStr.contains(Constants.SUCCESS)){
				modelAndViewObj.addObject("successManpower", resultStr);
				modelAndViewObj.addObject("type", "new");
				modelAndViewObj.addObject("eventRef", eventRef);
				modelAndViewObj.addObject("selectedLocation", eventMaster.getOutletStoreLocation());
				modelAndViewObj.setViewName("Inventory Manager/EventManagement/newevent");
			}else{
				modelAndViewObj.addObject("errManpower", resultStr);
				modelAndViewObj.setViewName("Inventory Manager/EventManagement/newevent");
			}
		
		
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		 
		return modelAndViewObj;
	}

	

	@RequestMapping(value="/updateEventManagementManpower",method=RequestMethod.POST)
	public ModelAndView updateEventManagementManpower(@RequestParam("formData") String data,HttpServletRequest request,HttpServletResponse response){
		List<String> locationsList = null;
		EventMaster eventMaster = null;
		Map<String,Object> responseMapObj = null;
		String resultStr,eventRef;
		List<EventMaster> eventMasters = new ArrayList<EventMaster>();
		String locationListAll = "";
		
		List<EmployeeBean> employeeList = new ArrayList<EmployeeBean>();

		try{ 
			
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			
			eventMaster = gson.fromJson(data,EventMaster.class);
			
			responseMapObj = outletMasterServiceObj.updateEventManagemntManpower(eventMaster,customerIdStr,emailIdStr);
			resultStr = (String)responseMapObj.get("result");
			eventRef = (String)responseMapObj.get("eventRef");
			
			modelAndViewObj = new ModelAndView();
			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			modelAndViewObj.addObject("locationsList", locationsList);
			ArrayList<TenderMaster> tenderDetails = genericMasterServiceObj.getTender("",customerIdStr,emailIdStr,"-1",100);

			
			eventMasters = outletMasterServiceObj.getEventManagementDetails(customerIdStr, emailIdStr,"-1","10",eventMaster.getEventReference(),false,"","","","","","","","",false);

			  for(int i = 0;i<tenderDetails.size();i++){
				   if(tenderDetails.get(i).getTenderName().equalsIgnoreCase(eventMasters.get(0).getPaymentMode())){
					   eventMasters.get(0).setCardType(tenderDetails.get(i).getModeOfPayment());
				   }
			   }
            modelAndViewObj.addObject("eventMastersList", eventMasters.get(0));
			if(eventMasters.get(0).getMenuDetails() != null && eventMasters.get(0).getMenuDetails().size() != 0)
		 	modelAndViewObj.addObject("eventMastersMenuList", eventMasters.get(0).getMenuDetails().get(0));
			modelAndViewObj.addObject("eventMastersPaymentsList", eventMasters.get(0).getEventPaymentTransactions());
			modelAndViewObj.addObject("eventMastersManpower", eventMasters.get(0).getEventManPowerDetails());


           modelAndViewObj.addObject("eventRef", eventMaster.getEventReference());
		   modelAndViewObj.addObject("selectedLocation", eventMasters.get(0).getOutletStoreLocation());
		   modelAndViewObj.addObject("SubmittionCountvalEquip", "1");
		   modelAndViewObj.addObject("SubmittionCountval", "1");
		   modelAndViewObj.addObject("SubmittionCountvalEmp", eventMaster.getSubmissionCount());
		   
		   
		   
			  if(locationsList != null){
					
					for (String string : locationsList) {
						
						locationListAll = locationListAll+string+",";
					}
					}
			  
			  employeeList = genericMasterServiceObj.getEmployees("",customerIdStr, emailIdStr,"0","","100",false,locationListAll);

		         modelAndViewObj.addObject("employeeList", employeeList);

			modelAndViewObj.addObject("tenderDetails", tenderDetails);
			
			
			
			if(resultStr.contains(Constants.SUCCESS)){
				modelAndViewObj.addObject("successManpower", resultStr);
				modelAndViewObj.addObject("type", "new");
				modelAndViewObj.addObject("eventRef", eventMaster.getEventReference());
				modelAndViewObj.addObject("selectedLocation", eventMaster.getOutletStoreLocation());
				modelAndViewObj.setViewName("Inventory Manager/EventManagement/editevent");
			}else{
				modelAndViewObj.addObject("errManpower", resultStr);
				modelAndViewObj.setViewName("Inventory Manager/EventManagement/editevent");
			}
		
		
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		 
		return modelAndViewObj;
	}

	@RequestMapping("/searchEquipment")
	public @ResponseBody List<MachineAndEquipmentMaster> searchEquipment(@RequestParam("searchName") String searchNameStr,@RequestParam("storeLocation")String storeLocation,@RequestParam("searchCategory")String searchCategory, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<MachineAndEquipmentMaster> productsList = new ArrayList<MachineAndEquipmentMaster>();
		try{
			// log.info("searchProducts");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			
	    productsList = outletMasterServiceObj.searchEquipments(customerIdStr, emailIdStr,searchNameStr,storeLocation,"",false);
		//////System.out.println(gson.toJson(productsList));
		}catch(Exception e){
			e.printStackTrace();
		}
		return productsList;
	}


	@RequestMapping(value="/createEventManagementEquipment",method=RequestMethod.POST)
	public ModelAndView createEventManagementEquipment(@RequestParam("formData") String data,HttpServletRequest request,HttpServletResponse response){
		List<String> locationsList = null;
		EventMaster eventMaster = null;
		Map<String,Object> responseMapObj = null;
		String resultStr,eventRef;
		try{ 
			
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			//////System.out.println(data);
			eventMaster = gson.fromJson(data,EventMaster.class);
			//////System.out.println(gson.toJson(eventMaster));
			responseMapObj = outletMasterServiceObj.createEventManagemntEquipment(eventMaster,customerIdStr,emailIdStr);
			resultStr = (String)responseMapObj.get("result");
			eventRef = (String)responseMapObj.get("eventRef");
			
			
			modelAndViewObj = new ModelAndView();
			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			modelAndViewObj.addObject("locationsList", locationsList);
			
			
			if(resultStr.contains(Constants.SUCCESS)){
				modelAndViewObj.addObject("SuccessEquipment", resultStr);
				modelAndViewObj.addObject("type", "new");
				modelAndViewObj.addObject("eventRef", eventRef);
				modelAndViewObj.addObject("selectedLocation", eventMaster.getOutletStoreLocation());
				modelAndViewObj.setViewName("Inventory Manager/EventManagement/newevent");
			}else{
				modelAndViewObj.addObject("errEquipment", resultStr);
				modelAndViewObj.setViewName("Inventory Manager/EventManagement/newevent");
			}
		
		
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		 
		return modelAndViewObj;
	}


	@RequestMapping(value="/updateEventManagementEquipment",method=RequestMethod.POST)
	public ModelAndView updateEventManagementEquipment(@RequestParam("formData") String data,HttpServletRequest request,HttpServletResponse response){
		List<String> locationsList = null;
		EventMaster eventMaster = null;
		Map<String,Object> responseMapObj = null;
		String resultStr,eventRef;
		List<EventMaster> eventMasters = new ArrayList<EventMaster>();
		String locationListAll = "";
		
		List<EmployeeBean> employeeList = new ArrayList<EmployeeBean>();

		try{ 
			
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			
			////System.out.println(data);
			
			eventMaster = gson.fromJson(data,EventMaster.class);
			
			responseMapObj = outletMasterServiceObj.updateEventManagemntEquipment(eventMaster,customerIdStr,emailIdStr);
			resultStr = (String)responseMapObj.get("result");
			eventRef = (String)responseMapObj.get("eventRef");
			
			modelAndViewObj = new ModelAndView();
			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			modelAndViewObj.addObject("locationsList", locationsList);
			
			ArrayList<TenderMaster> tenderDetails = genericMasterServiceObj.getTender("",customerIdStr,emailIdStr,"-1",100);

			eventMasters = outletMasterServiceObj.getEventManagementDetails(customerIdStr, emailIdStr,"-1","10",eventMaster.getEventReference(),false,"","","","","","","","",false);

			  for(int i = 0;i<tenderDetails.size();i++){
				   if(tenderDetails.get(i).getTenderName().equalsIgnoreCase(eventMasters.get(0).getPaymentMode())){
					   eventMasters.get(0).setCardType(tenderDetails.get(i).getModeOfPayment());
				   }
			   }
            modelAndViewObj.addObject("eventMastersList", eventMasters.get(0));
			if(eventMasters.get(0).getMenuDetails() != null && eventMasters.get(0).getMenuDetails().size() != 0)
		 	modelAndViewObj.addObject("eventMastersMenuList", eventMasters.get(0).getMenuDetails().get(0));
			modelAndViewObj.addObject("eventMastersPaymentsList", eventMasters.get(0).getEventPaymentTransactions());
			modelAndViewObj.addObject("eventMastersManpower", eventMasters.get(0).getEventManPowerDetails());


           modelAndViewObj.addObject("eventRef", eventMaster.getEventReference());
			modelAndViewObj.addObject("selectedLocation", eventMasters.get(0).getOutletStoreLocation());
			  if(locationsList != null){
					
					for (String string : locationsList) {
						
						locationListAll = locationListAll+string+",";
					}
					}
			  
			  employeeList = genericMasterServiceObj.getEmployees("",customerIdStr, emailIdStr,"0","","100",false,locationListAll);

		         modelAndViewObj.addObject("employeeList", employeeList);

			modelAndViewObj.addObject("tenderDetails", tenderDetails);
			
			 modelAndViewObj.addObject("SubmittionCountvalEquip", eventMaster.getSubmissionCount());
			   modelAndViewObj.addObject("SubmittionCountval", "1");
			   modelAndViewObj.addObject("SubmittionCountvalEmp", "1");
				
			
			if(resultStr.contains(Constants.SUCCESS)){
				modelAndViewObj.addObject("successEquipment", resultStr);
				modelAndViewObj.addObject("type", "new");
				modelAndViewObj.addObject("eventRef", eventMaster.getEventReference());
				modelAndViewObj.addObject("selectedLocation", eventMaster.getOutletStoreLocation());
				modelAndViewObj.setViewName("Inventory Manager/EventManagement/editevent");
			}else{
				modelAndViewObj.addObject("errEquipment", resultStr);
				modelAndViewObj.setViewName("Inventory Manager/EventManagement/editevent");
			}
		
		
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		 
		return modelAndViewObj;
	}


	
	
	
	//create Event Closure details.
    
    @RequestMapping(value="/createEventInventoryReturnDetails",method=RequestMethod.POST)
    public ModelAndView createEventInventoryReturnDetails(@RequestParam("formData") String data,HttpServletRequest request,HttpServletResponse response){
            List<String> locationsList = null;
            EventMaster eventMaster = null;
            Map<String,Object> responseMapObj = null;
            String resultStr,eventRef;
            List<EventMaster> eventMasters = new ArrayList<EventMaster>();
            String locationListAll = "";
            List<EmployeeBean> employeeList = new ArrayList<EmployeeBean>();
            List<EventInventoryReturnDetails> eventReturnList = new ArrayList<EventInventoryReturnDetails>();
            try{ 
                    
                    String customerIdStr = (String)request.getSession().getAttribute("customerId");
                    String emailIdStr = (String)request.getSession().getAttribute("emailId");
                    
                    eventMaster = gson.fromJson(data,EventMaster.class);
                    
                    responseMapObj = outletMasterServiceObj.createEventInventoryReturnDetails(eventMaster,customerIdStr,emailIdStr);
                    resultStr = (String)responseMapObj.get("result");
                    eventRef = (String)responseMapObj.get("eventRef");
                    
                    
                    
                    modelAndViewObj = new ModelAndView();
                    locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
                    modelAndViewObj.addObject("locationsList", locationsList);
                    
                    

                    eventMasters = outletMasterServiceObj.getEventManagementDetails(customerIdStr, emailIdStr,"-1","10",eventMaster.getEventReference(),false,"","","","","","","","",false);
                    /*if(eventMasters.size()>0){
                            for(int i=0;i<eventMasters.get(0).getEventInventoryIssueDetails().size();i++){
                                    boolean found=false;
                                    String Sku=eventMasters.get(0).getEventInventoryIssueDetails().get(i).getItemCode();
                                    for(int j=0;j<eventMasters.get(0).getEventInventoryReturnDetails().size();j++){
                                            if(eventMasters.get(0).getEventInventoryReturnDetails().get(j).getSkuId()==Sku){
                                                    found=true;
                                            }
                                    }
                                    if(found==false){
                                            EventInventoryReturnDetails evem=new EventInventoryReturnDetails();
                                            evem.setSkuId(eventMasters.get(0).getEventInventoryIssueDetails().get(i).getItemCode());
                                            evem.setIssueQuantity(eventMasters.get(0).getEventInventoryIssueDetails().get(i).getQuantity());
                                            evem.setUom(eventMasters.get(0).getEventInventoryIssueDetails().get(i).getUom());
                                            evem.setSize(eventMasters.get(0).getEventInventoryIssueDetails().get(i).getSize());
                                            evem.setReturnQuantity(eventMasters.get(0).getEventInventoryIssueDetails().get(i).getQuantity());
                                            evem.setConsQuantity(0.0);
                                            evem.setWastageQuantity(0.0);
                                            evem.setItem_description(eventMasters.get(0).getEventInventoryIssueDetails().get(i).getItem_description());
                                            eventReturnList.add(evem);
                                    }
                            }
                            
                    }*/
        modelAndViewObj.addObject("eventMastersList", eventMasters.get(0));
        modelAndViewObj.addObject("ReturnUniqueList", eventReturnList);
                    if(eventMasters.get(0).getMenuDetails() != null && eventMasters.get(0).getMenuDetails().size() != 0)
                     modelAndViewObj.addObject("eventMastersMenuList", eventMasters.get(0).getMenuDetails().get(0));
                    modelAndViewObj.addObject("eventMastersPaymentsList", eventMasters.get(0).getEventPaymentTransactions());
                    modelAndViewObj.addObject("eventMastersManpower", eventMasters.get(0).getEventManPowerDetails());


       modelAndViewObj.addObject("eventRef", eventMaster.getEventReference());
                    modelAndViewObj.addObject("selectedLocation", eventMasters.get(0).getOutletStoreLocation());
                      ArrayList<TenderMaster> tenderDetails = genericMasterServiceObj.getTender("",customerIdStr,emailIdStr,"-1",100);
                      if(locationsList != null){
                                    
                                    for (String string : locationsList) {
                                            
                                            locationListAll = locationListAll+string+",";
                                    }
                                    }
                      
                      employeeList = genericMasterServiceObj.getEmployees("",customerIdStr, emailIdStr,"0","","100",false,locationListAll);

                     modelAndViewObj.addObject("employeeList", employeeList);

                    modelAndViewObj.addObject("tenderDetails", tenderDetails);
                    if(resultStr.contains(Constants.SUCCESS)){
                            modelAndViewObj.addObject("SuccessInventoryClosure", resultStr);
                            modelAndViewObj.addObject("type", "new");
                            modelAndViewObj.addObject("eventRef", eventRef);
                            modelAndViewObj.addObject("selectedLocation", eventMaster.getOutletStoreLocation());
                            modelAndViewObj.setViewName("Inventory Manager/EventManagement/editevent");
                    }else{
                            modelAndViewObj.addObject("ErrorInventoryClosure", resultStr);
                            modelAndViewObj.setViewName("Inventory Manager/EventManagement/editevent");
                    }
            
            
            }
            catch(Exception exception)
            {
                    exception.printStackTrace();
            }
             
            return modelAndViewObj;
    }

	
	

	@RequestMapping(value="/printEventDetails",method=RequestMethod.POST)
	public ModelAndView printEventDetails(@RequestParam("eventref") String eventref,@RequestParam("status") String status,@RequestParam("flow") String flow,@RequestParam("printflow") String printflow,@RequestParam("subCount") String subCount,HttpServletRequest request,HttpServletResponse response){
		
		try{ 
			
			List<String> locationsList = null;
			EventMaster eventMaster = null;
			String resultStr;
			
			
			List<EventMaster> eventMasters = new ArrayList<EventMaster>();
			String locationListAll = "";
			
			List<EmployeeBean> employeeList = new ArrayList<EmployeeBean>();
			
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			
			
			
			List<EventMaster>  URLlist = outletMasterServiceObj.PrintEventManagemntDetails(eventref,status,printflow,customerIdStr,emailIdStr,subCount);
			
			
			modelAndViewObj = new ModelAndView();
			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			modelAndViewObj.addObject("locationsList", locationsList);
			ArrayList<TenderMaster> tenderDetails = genericMasterServiceObj.getTender("",customerIdStr,emailIdStr,"-1",100);

			
			eventMasters = outletMasterServiceObj.getEventManagementDetails(customerIdStr, emailIdStr,"-1","10",eventref,false,"","","","","","","","",false);

			  for(int i = 0;i<tenderDetails.size();i++){
				   if(tenderDetails.get(i).getTenderName().equalsIgnoreCase(eventMasters.get(0).getPaymentMode())){
					   eventMasters.get(0).setCardType(tenderDetails.get(i).getModeOfPayment());
				   }
			   }
			  
			  
			  if( printflow.equalsIgnoreCase("printinventoryReturn") || printflow.equalsIgnoreCase("Inventory")){
				  eventMasters.get(0).setDc_OrginalPrintURL(URLlist.get(0).getDc_OrginalPrintURL());
				  eventMasters.get(0).setDc_DuplicatePrintURL(URLlist.get(0).getDc_DuplicatePrintURL());
				  eventMasters.get(0).setDc_TriplicatePrintURL(URLlist.get(0).getDc_TriplicatePrintURL());
				
			  } else{
						eventMasters.get(0).setPrintURL(URLlist.get(0).getPrintURL());
					}
			
			
			
			
			
            modelAndViewObj.addObject("eventMastersList", eventMasters.get(0));
			if(eventMasters.get(0).getMenuDetails() != null && eventMasters.get(0).getMenuDetails().size() != 0)
		 	modelAndViewObj.addObject("eventMastersMenuList", eventMasters.get(0).getMenuDetails().get(0));
			modelAndViewObj.addObject("eventMastersPaymentsList", eventMasters.get(0).getEventPaymentTransactions());
			modelAndViewObj.addObject("eventMastersManpower", eventMasters.get(0).getEventManPowerDetails());


           modelAndViewObj.addObject("eventRef", eventref);
			modelAndViewObj.addObject("selectedLocation", eventMasters.get(0).getOutletStoreLocation());
			  if(locationsList != null){
					
					for (String string : locationsList) {
						
						locationListAll = locationListAll+string+",";
					}
					}
			  
			  employeeList = genericMasterServiceObj.getEmployees("",customerIdStr, emailIdStr,"0","","100",false,locationListAll);

		         modelAndViewObj.addObject("employeeList", employeeList);

			modelAndViewObj.addObject("tenderDetails", tenderDetails);
				
			if(URLlist.get(0).getPrintURL() == null){
				resultStr = "Something Went Wrong, Contact Admin.";
			}
			
			if(URLlist.get(0).getPrintURL().contains("http")){
				modelAndViewObj.addObject("success", "Success");
				modelAndViewObj.addObject("type", "new");
				modelAndViewObj.addObject("eventRef", eventref);
				modelAndViewObj.addObject("selectedLocation", eventref);
				
				
				
				
				if(printflow.equalsIgnoreCase("Inventory")) {
				 modelAndViewObj.addObject("SubmittionCountvalEquip", "1");
				   modelAndViewObj.addObject("SubmittionCountval", subCount);
				   modelAndViewObj.addObject("SubmittionCountvalEmp", "1");
				}else if(printflow.equalsIgnoreCase("Equipmemt")) {
					 modelAndViewObj.addObject("SubmittionCountvalEquip", subCount);
					   modelAndViewObj.addObject("SubmittionCountval", "1");
					   modelAndViewObj.addObject("SubmittionCountvalEmp", "1");
				}
				
				if(flow == "edit" || flow.equalsIgnoreCase("edit")){
				modelAndViewObj.setViewName("Inventory Manager/EventManagement/editevent");
				}else{
				modelAndViewObj.setViewName("Inventory Manager/EventManagement/viewevent");
				}
			}else{
				if(printflow.equalsIgnoreCase("Inventory")) {
					 modelAndViewObj.addObject("SubmittionCountvalEquip", "1");
					   modelAndViewObj.addObject("SubmittionCountval", subCount);
					   modelAndViewObj.addObject("SubmittionCountvalEmp", "1");
					}else if(printflow.equalsIgnoreCase("Equipmemt")) {
						 modelAndViewObj.addObject("SubmittionCountvalEquip", subCount);
						   modelAndViewObj.addObject("SubmittionCountval", "1");
						   modelAndViewObj.addObject("SubmittionCountvalEmp", "1");
					}
				modelAndViewObj.addObject("err", URLlist.get(0).getPrintURL());
				if(flow == "edit" || flow.equalsIgnoreCase("edit")){
				modelAndViewObj.setViewName("Inventory Manager/EventManagement/editevent");
				}else{
					modelAndViewObj.setViewName("Inventory Manager/EventManagement/viewevent");
				}
			}
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		 
		return modelAndViewObj;
	}

	
	@RequestMapping(value="/createEventEquipmentReturnDetails",method=RequestMethod.POST)
	public ModelAndView createEventEquipmentReturnDetails(@RequestParam("formData") String data,HttpServletRequest request,HttpServletResponse response){
		List<String> locationsList = null;
		EventMaster eventMaster = null;
		Map<String,Object> responseMapObj = null;
		String resultStr,eventRef;
		List<EventMaster> eventMasters = new ArrayList<EventMaster>();
		String locationListAll = "";
		List<EmployeeBean> employeeList = new ArrayList<EmployeeBean>();
		List<EventInventoryReturnDetails> eventReturnList = new ArrayList<EventInventoryReturnDetails>();
		try{ 
			
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			
			eventMaster = gson.fromJson(data,EventMaster.class);
			
			responseMapObj = outletMasterServiceObj.createEventEquipmentReturnDetails(eventMaster,customerIdStr,emailIdStr);
			resultStr = (String)responseMapObj.get("result");
			eventRef = eventMaster.getEventReference();
			
			
			
			modelAndViewObj = new ModelAndView();
			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			modelAndViewObj.addObject("locationsList", locationsList);
			
			

			ArrayList<TenderMaster> tenderDetails = genericMasterServiceObj.getTender("",customerIdStr,emailIdStr,"-1",100);
			eventMasters = outletMasterServiceObj.getEventManagementDetails(customerIdStr, emailIdStr,"-1","10",eventMaster.getEventReference(),false,"","","","","","","","",false);
			  for(int i = 0;i<tenderDetails.size();i++){
				   if(tenderDetails.get(i).getTenderName().equalsIgnoreCase(eventMasters.get(0).getPaymentMode())){
					   eventMasters.get(0).setCardType(tenderDetails.get(i).getModeOfPayment());
				   }
			   }
            modelAndViewObj.addObject("eventMastersList", eventMasters.get(0));
            modelAndViewObj.addObject("ReturnUniqueList", eventReturnList);
			if(eventMasters.get(0).getMenuDetails() != null && eventMasters.get(0).getMenuDetails().size() != 0)
		 	modelAndViewObj.addObject("eventMastersMenuList", eventMasters.get(0).getMenuDetails().get(0));
			modelAndViewObj.addObject("eventMastersPaymentsList", eventMasters.get(0).getEventPaymentTransactions());
			modelAndViewObj.addObject("eventMastersManpower", eventMasters.get(0).getEventManPowerDetails());


           modelAndViewObj.addObject("eventRef", eventMaster.getEventReference());
			modelAndViewObj.addObject("selectedLocation", eventMasters.get(0).getOutletStoreLocation());
			  if(locationsList != null){
					
					for (String string : locationsList) {
						
						locationListAll = locationListAll+string+",";
					}
					}
			  
			  employeeList = genericMasterServiceObj.getEmployees("",customerIdStr, emailIdStr,"0","","100",false,locationListAll);

		         modelAndViewObj.addObject("employeeList", employeeList);

			modelAndViewObj.addObject("tenderDetails", tenderDetails);
			if(resultStr.contains(Constants.SUCCESS)){
				modelAndViewObj.addObject("SuccessEquipmentClosure", resultStr);
				modelAndViewObj.addObject("type", "new");
				modelAndViewObj.addObject("eventRef", eventRef);
				modelAndViewObj.addObject("selectedLocation", eventMaster.getOutletStoreLocation());
				modelAndViewObj.setViewName("Inventory Manager/EventManagement/editevent");
			}else{
				modelAndViewObj.addObject("ErrorEquipmentClosure", resultStr);
				modelAndViewObj.setViewName("Inventory Manager/EventManagement/editevent");
			}
		
		
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		 
		return modelAndViewObj;
	}

	
	@RequestMapping("/showPricemanagementFlow")
	public ModelAndView showPricemanagementFlow(@RequestParam("flowunder")String flowunder,HttpServletRequest request,HttpServletResponse response){
		// log.info("InventoryManagerController - showOutletFlows");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("flowunder", flowunder);
		modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/pricemanagementFlow");
		return modelAndViewObj;
	}

	
	
}
