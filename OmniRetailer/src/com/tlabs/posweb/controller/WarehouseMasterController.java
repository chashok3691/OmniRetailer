package com.tlabs.posweb.controller;

import java.io.IOException;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlabs.posweb.init.AppProperties;
import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.technolabssoftware.www.Attachment;
import com.technolabssoftware.www.OfferProxy;
import com.tlabs.posweb.beans.BillOfMaterial;
import com.tlabs.posweb.beans.BillOfMaterialResponse;
//import com.tlabs.posweb.beans.CustomerAddress;
import com.tlabs.posweb.beans.Group;
import com.tlabs.posweb.beans.GroupChild;
import com.tlabs.posweb.beans.LocationBean;
import com.tlabs.posweb.beans.Menu;
import com.tlabs.posweb.beans.MenuCategory;
import com.tlabs.posweb.beans.MenuDetails;
import com.tlabs.posweb.beans.MenuItems;
import com.tlabs.posweb.beans.OutletInfo;
import com.tlabs.posweb.beans.ProductCategoryBean;
import com.tlabs.posweb.beans.ProductMaster;
import com.tlabs.posweb.beans.ProductSubCategoryBean;
import com.tlabs.posweb.beans.Products;
import com.tlabs.posweb.beans.ProductsList;
import com.tlabs.posweb.beans.ShipmentRateMaster;
import com.tlabs.posweb.beans.Sku;
import com.tlabs.posweb.beans.SkuPriceList;
import com.tlabs.posweb.beans.SupplierBean;
import com.tlabs.posweb.beans.Suppliers;
import com.tlabs.posweb.beans.TaxBean;
import com.tlabs.posweb.beans.WareHouseSku;
import com.tlabs.posweb.beans.WareHouseSkuResponse;
import com.tlabs.posweb.beans.Warehouse;
import com.tlabs.posweb.beans.WarehousePicklistMaster;
import com.tlabs.posweb.beans.WarehouseProductBom;
import com.tlabs.posweb.beans.WarehouseSkuPriceList;
import com.tlabs.posweb.services.AdminService;
import com.tlabs.posweb.services.GenericMasterService;
import com.tlabs.posweb.services.MasterService;
import com.tlabs.posweb.services.MenuService;
import com.tlabs.posweb.services.OutletMasterService;
import com.tlabs.posweb.services.SkuService;
import com.tlabs.posweb.services.StoreService;
import com.tlabs.posweb.services.WarehouseService;
import com.tlabs.posweb.util.Constants;
import com.tlabs.posweb.util.Response;
//import com.tlabs.posweb.util.Utilities;

@Controller
@RequestMapping(value = "/warehouseMaster")
public class WarehouseMasterController {
	
	private ModelAndView modelAndViewObj;
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
    private MenuService menuServiceObj;
	
	//private static Logger log = Logger.getLogger(WarehouseMasterController.class);
	
	/**
	 * @author Mythri.S
	 * @param request
	 * @param response
	 * @return returns a jsp which displays all the icons of outlet management flow
	 */
	@RequestMapping("/showWarehouseMasterFlows")
	public ModelAndView showWarehouseMasterFlows(HttpServletRequest request,HttpServletResponse response){
		// log.info("InventoryManagerController - showOutletFlows");
		
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("MasterDataManagement/WarehouseMasters/wareHouseMasterFlow");
		return modelAndViewObj;
	}
	
	
	
	/**
	 
	 * @param request
	 * @param response
	 *This method is used to display the New Warehouse sku form
	 */
	
	@RequestMapping("/newWarehouseSku")
	public ModelAndView newWarehouseSku(HttpServletRequest request,HttpServletResponse response){
		List<String> locationsList = null;
		try{
			// log.info("newSku ");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<String> brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
			ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails("",customerIdStr, emailIdStr,"-1",false,"");
			
			locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);

			
			//List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("workLocationsList", locationsList);
			modelAndViewObj.addObject("type","new");
			modelAndViewObj.addObject("taxDetails",taxDetails);
			modelAndViewObj.addObject("brandsList",brandsList);
			modelAndViewObj.setViewName("MasterDataManagement/WarehouseMasters/WarehouseSkuMaster/newWarehouseQuickandDetailsSku");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	@RequestMapping("/viewWarehouseSkuMaster")
	public ModelAndView viewWarehouseSkuMaster(@RequestParam("subcategory") String subcategory,@RequestParam("brand") String brand,@RequestParam("department") String department,@RequestParam("supplierid") String supplierid,@RequestParam("productCategory") String productCategory,@RequestParam("searchName") String searchNameStr,@RequestParam("location") String location,@RequestParam("index") String index,HttpServletRequest request,HttpServletResponse response){
		
		String customerIdStr = null,emailIdStr=null;
		List<ProductsList> productsList = new ArrayList<ProductsList>();
		try{
			// log.info("viewwarehouseSkuMaster ");
			int start = 1,end = 10;
			 customerIdStr = (String)request.getSession().getAttribute("customerId");
			 emailIdStr = (String)request.getSession().getAttribute("emailId");
//			 List<String> locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr,emailIdStr,false);
			
				ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","Warehouse",false,false,true);
			 List<ProductCategoryBean> categoryList =(List<ProductCategoryBean>)request.getSession().getAttribute("categoryList");
				if(categoryList==null || categoryList.size()==0 || categoryList.isEmpty()){
					categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
					request.getSession().setAttribute("categoryList", categoryList);
				}
				//added by vijay , in case of empty location first occurrence of locations list will considered as default location
				/*if((location.trim()).equals(null) || location.trim().isEmpty())
				{
					location= locationsList.get(0).getLocationId();
				}*/
		     productsList = skuServiceObj.searchWarehouseProducts("","","",customerIdStr, emailIdStr,searchNameStr,location,productCategory,"",index,subcategory,brand,department,supplierid);
			 modelAndViewObj = new ModelAndView();
			if(productsList == null || productsList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(productsList.size()<10){
					end = (productsList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
//				////////System.out.println("totalrecords"+productsList.get(0).getTotalRecords());
			    modelAndViewObj.addObject("totalRecords",Integer.parseInt(productsList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("category", productCategory);
			modelAndViewObj.addObject("productsList", productsList);
			modelAndViewObj.addObject("subcategory", subcategory);
			modelAndViewObj.addObject("brand", brand);
			modelAndViewObj.addObject("supplierid", supplierid);
			modelAndViewObj.addObject("department", department);
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.setViewName("MasterDataManagement/WarehouseMasters/WarehouseSkuMaster/skuMaster");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	@RequestMapping(value="/createWarehouseSku",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createWarehouseSku(@RequestBody Sku obj_SkuMasterBean,HttpServletRequest request,HttpServletResponse response) {
		
		try{
			// log.info("createSku");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = skuServiceObj.createSku(obj_SkuMasterBean,customerIdStr,emailIdStr);
			modelAndViewObj = new ModelAndView();
			List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("SKU_CREATE_SUCCESS").trim())){
				Set<String> productRangeList = new HashSet<String>();
				Set<String> measurementRangeList = new HashSet<String>();
				Set<String> selectedLocationsList = new HashSet<String>();
				if(obj_SkuMasterBean.getSkuPriceLists() != null)
					for(SkuPriceList skuPriceList : obj_SkuMasterBean.getSkuPriceLists()){
						if(skuPriceList.getProductRange() != null && !skuPriceList.getProductRange().equals(""))
							productRangeList.add(skuPriceList.getProductRange());
						if(skuPriceList.getMeasureRange() != null && !skuPriceList.getMeasureRange().equals(""))
							measurementRangeList.add(skuPriceList.getMeasureRange());
						selectedLocationsList.add(skuPriceList.getStoreLocation());
						skuPriceList.setStoreLocationId(skuPriceList.getStoreLocation().replaceAll(" ", "_"));
					}
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
				//modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SkuMaster/editSku");
			}else{
				modelAndViewObj.addObject("success", resultStr);
				modelAndViewObj.setViewName("MasterDataManagement/WarehouseMasters/WarehouseSkuMaster/newWarehouseQuickandDetailsSku");
			}
			ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails("",customerIdStr, emailIdStr,"-1",false,"");
			List<String> brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
			modelAndViewObj.addObject("brandsList",brandsList);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("taxDetails",taxDetails);
			
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
	public ModelAndView viewProduct(@RequestParam("index") String index,HttpServletRequest request,HttpServletResponse response){
		try{
			int start = 1,end = 10;
			// log.info("viewProduct ");
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			List<Products> productList = outletMasterServiceObj.getProducts(customerId,emailId,"",index,"","","");
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
	public ModelAndView newProduct(HttpServletRequest request,HttpServletResponse response){
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
	public ModelAndView createProduct(@RequestParam("formData") String productMasterDetaills,@RequestParam("productSupplier") String productSupplier,@RequestParam("productStore") String productStore,HttpServletRequest request,HttpServletResponse response) {
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
	public ModelAndView editProduct(@RequestParam("productId") String productId,@RequestParam("operation") String operation,HttpServletRequest request,HttpServletResponse response){
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
	public ModelAndView updateProduct(@RequestParam("formData") String productMasterDetaills,@RequestParam("productSupplier") String productSupplier,@RequestParam("productStore") String productStore,HttpServletRequest request,HttpServletResponse response) {
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
	public ModelAndView deleteProduct(@RequestParam("ids") String ids,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("deleteProduct ");
			int start = 1,end = 10;
			modelAndViewObj = new ModelAndView();
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			String result = masterServiceObj.deleteProduct(customerId,emailId ,ids);
			List<Products> productList = outletMasterServiceObj.getProducts(customerId,emailId,"","0","","","");
			if(productList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(productList.size()<10){
					end = (productList.size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(productList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("productList", productList);
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
	public ModelAndView searchProductMaster(@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		try{
			// log.info("searchProductMaster");
			int start = 1,end = 10;
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<Products> productsList = outletMasterServiceObj.getProducts(customerIdStr, emailIdStr,searchNameStr,index,"","","");
			modelAndViewObj = new ModelAndView();
			if(productsList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(productsList.size()<10){
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
	 **/
	@RequestMapping("/viewSupplier")
	public ModelAndView viewSupplier(@RequestParam("index") String index, HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewSupplier ");
			int start = 1,end = 10;
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<Suppliers> supplierList = outletMasterServiceObj.getSuppliers(customerIdStr, emailIdStr,index,"","");
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
			modelAndViewObj.addObject("supplierBean", supplierBeanObj);
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
	public ModelAndView createSupplier(@RequestBody SupplierBean supplierBean,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("create Supplier");
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
	public ModelAndView updateSupplier(@RequestBody SupplierBean supplierBean,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("uodate Supplier");
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
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: -4-mar-2015.
	 * 
	 * This method is used to delete the suppliers
	 * It accepts the ids that need to be deleted.
	 * It retrieves the suppliersList to display in the table.
	 * It also sends the message of successful deletion or not.
	 * 
	 **/
	@RequestMapping("/deleteSupplier")
	public ModelAndView deleteSupplier(@RequestParam("ids") String ids,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("deleteSupplier ");
			modelAndViewObj = new ModelAndView();
			int start = 1,end = 10;
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			String result = outletMasterServiceObj.deleteSupplier(customerId,emailId ,ids);
			List<Suppliers> supplierList = outletMasterServiceObj.getSuppliers(customerId,emailId,"0","","");
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
	public ModelAndView searchSupplierMater(@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<SupplierBean> suppliersList = new ArrayList<SupplierBean>();
		try{
			// log.info("searchSupplierMater");
			int start = 1,end = 10;
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			suppliersList = outletMasterServiceObj.searchSuppliers(customerIdStr, emailIdStr,searchNameStr,index,"");
			modelAndViewObj = new ModelAndView();
			if(suppliersList == null || suppliersList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(suppliersList.size()<10){
					end = (suppliersList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(suppliersList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("searchName", searchNameStr);
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
			List<String> brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
			ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails("",customerIdStr, emailIdStr,"-1",false,"");
			List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("taxDetails",taxDetails);
			modelAndViewObj.addObject("brandsList",brandsList);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SkuMaster/newSku");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	
	/**
	 * 
	 
	 * 
	 *This method is used to save the details of the Sku
	 *
	 **/
	@RequestMapping(value="/createSku",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createSku(@RequestBody WareHouseSku obj_SkuMasterBean,HttpServletRequest request,HttpServletResponse response) {
		String resultStr=null;
		List<String> locationsList = null;
		try{
			// log.info("createWarehouseSku");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
		     resultStr = skuServiceObj.createWarehouseSku(obj_SkuMasterBean,customerIdStr,emailIdStr);
			modelAndViewObj = new ModelAndView();
			locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
			/*
			 * if(!resultStr.equals(AppProperties.getAppMessageByProperty(
			 * "SKU_CREATE_SUCCESS").trim())){ Set<String> productRangeList = new
			 * HashSet<String>(); Set<String> measurementRangeList = new HashSet<String>();
			 * Set<String> selectedLocationsList = new HashSet<String>(); Set<String>
			 * selectedLocationsIdList = new HashSet<String>();
			 * if(obj_SkuMasterBean.getWarehouseSkuPriceLists() != null)
			 * for(WarehouseSkuPriceList skuPriceList :
			 * obj_SkuMasterBean.getWarehouseSkuPriceLists()){
			 * if(skuPriceList.getProductRange() != null &&
			 * !skuPriceList.getProductRange().equals(""))
			 * productRangeList.add(skuPriceList.getProductRange());
			 * if(skuPriceList.getMeasureRange() != null &&
			 * !skuPriceList.getMeasureRange().equals(""))
			 * measurementRangeList.add(skuPriceList.getMeasureRange());
			 * 
			 * selectedLocationsList.add(skuPriceList.getStoreLocation());
			 * skuPriceList.setStoreLocationId(skuPriceList.getStoreLocation().
			 * replaceAll(" ", "_"));
			 * skuPriceList.setStoreLocationId(skuPriceList.getStoreLocation().
			 * replaceAll(" ", "_")); }
			 * obj_SkuMasterBean.setProductRangeList(productRangeList);
			 * obj_SkuMasterBean.setMeasurementRangeList(measurementRangeList);
			 * obj_SkuMasterBean.setSelectedLocationsList(selectedLocationsList); for(String
			 * location : locationsList)
			 * selectedLocationsIdList.add(location.replaceAll(" ", "_"));
			 * obj_SkuMasterBean.setSelectedLocationsIdList(selectedLocationsIdList);
			 * 
			 * //obj_SkuMasterBean.setSelectedLocationsIdList(selectedLocationsIdList);
			 * 
			 * 
			 * modelAndViewObj.addObject("sku", obj_SkuMasterBean);
			 * modelAndViewObj.addObject("err", resultStr);
			 * modelAndViewObj.addObject("type", "new");
			 * //modelAndViewObj.addObject("workLocationsList", workLocationsList);
			 * modelAndViewObj.setViewName(
			 * "MasterDataManagement/WarehouseMasters/WarehouseSkuMaster/editSku"); }else{
			 * //modelAndViewObj.addObject("warehousesku", obj_SkuMasterBean);
			 * modelAndViewObj.addObject("success", resultStr); modelAndViewObj.setViewName(
			 * "MasterDataManagement/WarehouseMasters/WarehouseSkuMaster/newSku"); }
			 */
			if(resultStr.equals(AppProperties.getAppMessageByProperty("SKU_CREATE_SUCCESS").trim())){
				Set<String> productRangeList = new HashSet<String>();
				Set<String> measurementRangeList = new HashSet<String>();
				Set<String> selectedLocationsList = new HashSet<String>();
				Set<String> selectedLocationsIdList = new HashSet<String>();
				if(obj_SkuMasterBean.getWarehouseSkuPriceLists() != null)
					for(WarehouseSkuPriceList skuPriceList : obj_SkuMasterBean.getWarehouseSkuPriceLists()){
						if(skuPriceList.getProductRange() != null && !skuPriceList.getProductRange().equals(""))
							productRangeList.add(skuPriceList.getProductRange());
						if(skuPriceList.getMeasureRange() != null && !skuPriceList.getMeasureRange().equals(""))
							measurementRangeList.add(skuPriceList.getMeasureRange());
						
						selectedLocationsList.add(skuPriceList.getStoreLocation());
						skuPriceList.setStoreLocationId(skuPriceList.getStoreLocation().replaceAll(" ", "_"));
						skuPriceList.setStoreLocationId(skuPriceList.getStoreLocation().replaceAll(" ", "_"));
					}
				obj_SkuMasterBean.setProductRangeList(productRangeList);
				obj_SkuMasterBean.setMeasurementRangeList(measurementRangeList);
				obj_SkuMasterBean.setSelectedLocationsList(selectedLocationsList);
				for(String location : locationsList)
					selectedLocationsIdList.add(location.replaceAll(" ", "_"));
				obj_SkuMasterBean.setSelectedLocationsIdList(selectedLocationsIdList);
				
				//obj_SkuMasterBean.setSelectedLocationsIdList(selectedLocationsIdList);
				
				
				modelAndViewObj.addObject("sku", obj_SkuMasterBean);
				modelAndViewObj.addObject("warehousesku", obj_SkuMasterBean);
				modelAndViewObj.addObject("success", resultStr);
				modelAndViewObj.addObject("type", "new");
				//modelAndViewObj.addObject("workLocationsList", workLocationsList);
				modelAndViewObj.setViewName("MasterDataManagement/WarehouseMasters/WarehouseSkuMaster/newWarehouseQuickandDetailsSku");
			}else if((!resultStr.equals(AppProperties.getAppMessageByProperty("SKU_CREATE_SUCCESS").trim()))){
				Set<String> productRangeList = new HashSet<String>();
				Set<String> measurementRangeList = new HashSet<String>();
				Set<String> selectedLocationsList = new HashSet<String>();
				Set<String> selectedLocationsIdList = new HashSet<String>();
				if(obj_SkuMasterBean.getWarehouseSkuPriceLists() != null)
					for(WarehouseSkuPriceList skuPriceList : obj_SkuMasterBean.getWarehouseSkuPriceLists()){
						if(skuPriceList.getProductRange() != null && !skuPriceList.getProductRange().equals(""))
							productRangeList.add(skuPriceList.getProductRange());
						if(skuPriceList.getMeasureRange() != null && !skuPriceList.getMeasureRange().equals(""))
							measurementRangeList.add(skuPriceList.getMeasureRange());
						
						selectedLocationsList.add(skuPriceList.getStoreLocation());
						skuPriceList.setStoreLocationId(skuPriceList.getStoreLocation().replaceAll(" ", "_"));
						skuPriceList.setStoreLocationId(skuPriceList.getStoreLocation().replaceAll(" ", "_"));
					}
				obj_SkuMasterBean.setProductRangeList(productRangeList);
				obj_SkuMasterBean.setMeasurementRangeList(measurementRangeList);
				obj_SkuMasterBean.setSelectedLocationsList(selectedLocationsList);
				for(String location : locationsList)
					selectedLocationsIdList.add(location.replaceAll(" ", "_"));
				obj_SkuMasterBean.setSelectedLocationsIdList(selectedLocationsIdList);
				
				//obj_SkuMasterBean.setSelectedLocationsIdList(selectedLocationsIdList);
				
				
				modelAndViewObj.addObject("sku", obj_SkuMasterBean);
				modelAndViewObj.addObject("warehousesku", obj_SkuMasterBean);
				modelAndViewObj.addObject("err", resultStr);
				modelAndViewObj.addObject("type", "edit");
				//modelAndViewObj.addObject("workLocationsList", workLocationsList);
				modelAndViewObj.setViewName("MasterDataManagement/WarehouseMasters/WarehouseSkuMaster/newWarehouseQuickandDetailsSku");
			}
			else{
				modelAndViewObj.addObject("warehousesku", obj_SkuMasterBean);
				modelAndViewObj.addObject("sku", obj_SkuMasterBean);
				modelAndViewObj.addObject("err", resultStr);
				modelAndViewObj.addObject("type", "new");
				modelAndViewObj.setViewName("MasterDataManagement/WarehouseMasters/WarehouseSkuMaster/newWarehouseQuickandDetailsSku");
			}
			
			ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails("",customerIdStr, emailIdStr,"-1",false,"");
			List<String> brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
			modelAndViewObj.addObject("brandsList",brandsList);
			modelAndViewObj.addObject("workLocationsList", locationsList);
			modelAndViewObj.addObject("taxDetails",taxDetails);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	
	
	
	
	
	/**
	 * 
	 * 
	 *This method is used to search the  Warehouse sku master
	 * @param skuID 
	 *
	 **/
	
	@RequestMapping("/searchWarehouseProducts")
	public ModelAndView searchWarehouseProducts(@RequestParam("subcategory") String subcategory,@RequestParam("brand") String brand,@RequestParam("department") String department,@RequestParam("supplierid") String supplierid,@RequestParam("location") String location,@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<ProductsList> productsList = null;
		try{
			// log.info("searchWarehousekuMaster");
			int start = 1,end = 10;
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","Warehouse",false,false,true);
			productsList = skuServiceObj.searchWarehouseProducts("","","",customerIdStr, emailIdStr,searchNameStr,location,"","",index,subcategory,brand,department,supplierid);
			modelAndViewObj = new ModelAndView();
			if(productsList == null || productsList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(productsList.size()<10){
					end = (productsList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
//				////////System.out.println("totalrecords " +productsList.get(0).getTotalRecords());
				modelAndViewObj.addObject("totalRecords", productsList.get(0).getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("maxRecords", 10);
//				////////System.out.println("totalValue"+end);
			}
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("productsList", productsList);
			modelAndViewObj.setViewName("MasterDataManagement/WarehouseMasters/WarehouseSkuMaster/skuMaster");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
			
		
	
	
	
	
	/**
	 * 
	 * 
	 *This method is used to display the Edit Sku form with all the details of the Sku
	 * @param skuID 
	 *
	 **/
	@RequestMapping("/editSku")
	public ModelAndView editSku(@RequestParam("skuID") String skuIdStr,@RequestParam("operation") String operation,@RequestParam("formData") String formData,HttpServletRequest request,
			HttpServletResponse response){
		List<String> locationsList = null;
		WareHouseSkuResponse wareHouseSkuResponse=null;
		//WareHouseSku wareHouseSku=new WareHouseSku();
		try{
			// log.info("editSku");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			wareHouseSkuResponse = skuServiceObj.getWarehousemasterSKUDetails(skuIdStr,customerIdStr, emailIdStr,"");
		    locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
		    ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails("",customerIdStr, emailIdStr,"-1",false,"");
			

			
			Set<String> selectedLocationsIdList = new HashSet<String>();
			for(String location : locationsList)
				selectedLocationsIdList.add(location.replaceAll(" ", "_"));
//			if(wareHouseSkuResponse.getWarehouseskumaster().getWarehouseSkuPriceLists().s)
			if(wareHouseSkuResponse.getWarehouseskumaster()!=null && wareHouseSkuResponse.getWarehouseskumaster().getWarehouseSkuPriceLists()!= null && wareHouseSkuResponse.getWarehouseskumaster().getWarehouseSkuPriceLists().size()>0){
				for(String location : wareHouseSkuResponse.getWarehouseskumaster().getSelectedLocationsList()){
					if(!selectedLocationsIdList.contains(location)){
						selectedLocationsIdList.add(location.replaceAll(" ", "_"));
					wareHouseSkuResponse.getWarehouseskumaster().getWarehouseSkuPriceLists().get(0).setStoreLocationId(location.replaceAll(" ", "_"));
					}
					
				}
				wareHouseSkuResponse.getWarehouseskumaster().setSelectedLocationsIdList(selectedLocationsIdList);
			}
			if(wareHouseSkuResponse.getWarehouseskumaster()!=null){
			wareHouseSkuResponse.getWarehouseskumaster().setSelectedLocationsIdList(selectedLocationsIdList);
			}
		 modelAndViewObj.addObject("skuId",skuIdStr);
		 // modelAndViewObj.addObject("supplierList", supplierList);
		    modelAndViewObj.addObject("workLocationsList", locationsList);
           
            modelAndViewObj.addObject("sku", wareHouseSkuResponse.getWarehouseskumaster());
          
          //added by manasa 
			Sku skuObj=gson.fromJson(formData, Sku.class);
			modelAndViewObj.addObject("skuObj",skuObj);
			
			modelAndViewObj.addObject("taxDetails",taxDetails);
			if(operation.equals("view")) {
				modelAndViewObj.addObject("type", "view");
			
				modelAndViewObj.setViewName("MasterDataManagement/WarehouseMasters/WarehouseSkuMaster/newWarehouseQuickandDetailsSku");
			}else {
				modelAndViewObj.addObject("type", "edit");
				modelAndViewObj.setViewName("MasterDataManagement/WarehouseMasters/WarehouseSkuMaster/newWarehouseQuickandDetailsSku");
			}
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	

	
	
	
	
	
	/**
	 * 
	 *
	 * 
	 *This method is used to update the details of the Warehouse Sku master
	 *
	 **/
	
	@RequestMapping(value="/updateSku",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView updateSku(@RequestBody WareHouseSku wareHouseSkuobj,HttpServletRequest request,HttpServletResponse response) {
		WareHouseSkuResponse wareHouseSkuResponse=null;
		List<String> locationsList = null;
		try{
			// log.info("update Sku");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String result = skuServiceObj.updateWarehouseSku(wareHouseSkuobj,customerIdStr,emailIdStr);
		//	List<Suppliers> supplierList = outletMasterServiceObj.getSuppliers(customerIdStr, emailIdStr,"-1");
		
			wareHouseSkuResponse= skuServiceObj.getWarehousemasterSKUDetails(wareHouseSkuobj.getSkuId(),customerIdStr, emailIdStr,"");
		
			locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
             
			
			Set<String> selectedLocationsIdList = new HashSet<String>();
			for(String location : locationsList)
				selectedLocationsIdList.add(location.replaceAll(" ", "_"));
			if(wareHouseSkuResponse.getWarehouseskumaster().getWarehouseSkuPriceLists()!= null && wareHouseSkuResponse.getWarehouseskumaster().getWarehouseSkuPriceLists().size()>0){
				for(String location : wareHouseSkuResponse.getWarehouseskumaster().getSelectedLocationsList()){
					if(!selectedLocationsIdList.contains(location))
						selectedLocationsIdList.add(location.replaceAll(" ", "_"));
				}
				wareHouseSkuResponse.getWarehouseskumaster().setSelectedLocationsIdList(selectedLocationsIdList);
			}
			
			
			wareHouseSkuResponse.getWarehouseskumaster().setSelectedLocationsIdList(selectedLocationsIdList);
			
			
			modelAndViewObj = new ModelAndView();
			 ArrayList<TaxBean> taxDetails = genericMasterServiceObj.getTaxDetails("",customerIdStr, emailIdStr,"-1",false,"");
				


			 modelAndViewObj.addObject("taxDetails",taxDetails);
			locationsList = adminServiceObj.getWarehouseLocationsList(customerIdStr, emailIdStr,true);
            modelAndViewObj.addObject("sku",wareHouseSkuResponse.getWarehouseskumaster());
            modelAndViewObj.addObject("skuId",wareHouseSkuobj.getSkuId());
			modelAndViewObj.addObject("type", "edit");
		    modelAndViewObj.addObject("workLocationsList", locationsList);

			if(!result.equals(AppProperties.getAppMessageByProperty("SKU_UPDATE_SUCCESS").trim()))
				modelAndViewObj.addObject("err", result);
			else
				modelAndViewObj.addObject("success", result);
			modelAndViewObj.setViewName("MasterDataManagement/WarehouseMasters/WarehouseSkuMaster/newWarehouseQuickandDetailsSku");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	/**
	 * 
	 *  This method is used to delete the Warehouse skuIds.
	 *  It retrieves the skus and returns to display in a tabular format.
	 *  
	 *
	 **/
	@RequestMapping("/deleteSku")
	public ModelAndView deleteSku(@RequestParam("ids") String ids,HttpServletRequest request,HttpServletResponse response){
		
			String customerIdStr = null,emailIdStr=null;
			List<ProductsList> productsList = null;
			try{
				String index="0";
			
				// log.info("deletewarehouse");
				int start = 1,end = 10;
				customerIdStr = (String)request.getSession().getAttribute("customerId");
				emailIdStr = (String)request.getSession().getAttribute("emailId");
				String result = skuServiceObj.deleteWarehouseSku(ids);
				productsList = skuServiceObj.searchWarehouseProducts("","","",customerIdStr, emailIdStr,"","","","",index,"","","","");
				modelAndViewObj = new ModelAndView();
				if(productsList == null || productsList.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(productsList.size()<10){
						end = (productsList.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					////////System.out.println("totalrecords "+productsList.get(0).getTotalRecords());
					modelAndViewObj.addObject("totalRecords", productsList.get(0).getTotalRecords());
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
					////////System.out.println("totalValue"+end);
				}
				//modelAndViewObj.addObject("searchName", searchNameStr);
				modelAndViewObj.addObject("err", result);
				modelAndViewObj.addObject("productsList", productsList);
				modelAndViewObj.setViewName("MasterDataManagement/WarehouseMasters/WarehouseSkuMaster/skuMaster");
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
	 **/
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
	public ModelAndView viewSubCategory(@RequestParam("index") String index,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewSubCategory ");
			int start = 1,end = 10;			
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<ProductSubCategoryBean> subCategoryDetailsList = outletMasterServiceObj.getSubCategoryDetails("",customerIdStr, emailIdStr,index,false);
			modelAndViewObj = new ModelAndView();
			if(subCategoryDetailsList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(subCategoryDetailsList.size()<10){
					end = (subCategoryDetailsList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(subCategoryDetailsList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("subCategoryDetails", subCategoryDetailsList);
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
	public ModelAndView newSubCategory(HttpServletRequest request,HttpServletResponse response){
		try{
			String customerIdStr,emailIdStr;
			// log.info("newSubCategory ");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
//			List<String> categoriesList = adminServiceObj.getCategories(customerIdStr,emailIdStr);
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("categoriesList", categoryList);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SubCategoryMaster/newSubCategory");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
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
	public ModelAndView editSubCategory(@RequestParam("subcategoryName") String subcategoryName,@RequestParam("operation") String operation, HttpServletRequest request,HttpServletResponse response) {
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
	public ModelAndView deleteSubCategory(@RequestParam("ids") String ids,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("deleteSubCategory ");
			modelAndViewObj = new ModelAndView();
			int start = 1,end = 10;		
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String result = outletMasterServiceObj.deleteSubCategory(customerIdStr,emailIdStr ,ids);
			List<ProductSubCategoryBean> subCategoryDetailsList = outletMasterServiceObj.getSubCategoryDetails("",customerIdStr, emailIdStr,"0",false);
			if(subCategoryDetailsList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(subCategoryDetailsList.size()<10){
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
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/SubCategoryMaster/subCategoryMaster");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	@RequestMapping("/searchSubCategoryMaster")
	public ModelAndView searchSubCategoryMaster(@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		try{
			// log.info("searchSubCategoryMaster");
			int start = 1,end = 10;
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<ProductSubCategoryBean> subCategoryDetailsList = outletMasterServiceObj.getSubCategoryDetails(searchNameStr,customerIdStr, emailIdStr,index,true);
			modelAndViewObj = new ModelAndView();
			if(subCategoryDetailsList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(subCategoryDetailsList.size()<10){
					end = (subCategoryDetailsList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(subCategoryDetailsList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("searchName", searchNameStr);
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
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ProductGroupMaster/newProductGroupMaster");
				////////System.out.println(modelAndViewObj);
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
		 **/
		
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
		}
		/**
		 * 
		 * @author Viswanath
		 * 
		 *This method is used to display the Edit Product Group form consisting of the details of the Group
		 *
		 **/
		@RequestMapping("/editProductGroup")
		public ModelAndView editProductGroup(@RequestParam("index") String index,@RequestParam("searchcriteria") String searchcriteria,@RequestParam("groupId") String groupIdStr,@RequestParam("operation") String operation,HttpServletRequest request,HttpServletResponse response){
			try{
				// log.info("editProductGroup");
				int start = 1,end =10;
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				modelAndViewObj = new ModelAndView();
				GroupChild groupDetails = outletMasterServiceObj.getProductGroupDetailsforGroupId(groupIdStr,customerIdStr, emailIdStr,index,false,searchcriteria,"10");
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
			
		}
		
		
		/**
		 * 
		 * @author Viswanath
		 * 
		 *This method is used to view the  product Group details  
		 *
		 **/
		
		
		@RequestMapping("/viewProductGroup")
		public ModelAndView viewProductGroup(@RequestParam("index")String index,HttpServletRequest request,HttpServletResponse response){
			try{
				// log.info("viewProductGroup ");
				int start = 1,end = 10;
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				//List<Group> groupsList = outletMasterServiceObj.getProductGroupDetails("",customerIdStr, emailIdStr,index,false);
				List<Group> groupsList = outletMasterServiceObj.getProductGroupDetails("",customerIdStr, emailIdStr,index,"",false);
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
				modelAndViewObj = new ModelAndView();
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				String resultStr=outletMasterServiceObj.updateProductGroup(groupObj, customerIdStr, emailIdStr);
				if(!resultStr.equals(AppProperties.getAppMessageByProperty("PRODUCT_GROUP_UPDATE_SUCCESS").trim()))
					modelAndViewObj.addObject("err", resultStr);
				else
					modelAndViewObj.addObject("success", resultStr);
				GroupChild groupDetails = outletMasterServiceObj.getProductGroupDetailsforGroupId(groupObj.getGroupId(),customerIdStr, emailIdStr,"0",false,"","10");
				modelAndViewObj.addObject("productGroup", groupDetails);
				modelAndViewObj.addObject("type", "edit");
				modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ProductGroupMaster/editProductGroup");
				////////System.out.println(modelAndViewObj);
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
		public ModelAndView deleteProductGroup(@RequestParam("ids") String ids,HttpServletRequest request,HttpServletResponse response){
			try{
				// log.info("deleteProductGroup ");
				int start = 1,end = 10;
				modelAndViewObj = new ModelAndView();
				String customerId = (String)request.getSession().getAttribute("customerId");
				String emailId = (String)request.getSession().getAttribute("emailId");
				String resultStr = outletMasterServiceObj.deleteProductGroup(customerId,emailId,ids);
				//List<Group> groupDetails = outletMasterServiceObj.getProductGroupDetails("",customerId, emailId,"0",false);
				List<Group> groupDetails = outletMasterServiceObj.getProductGroupDetails("",customerId, emailId,"0","10",true);
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
			//	List<Group> groupDetails = outletMasterServiceObj.getProductGroupDetails(searchNameStr,customerIdStr, emailIdStr,index,true);
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
			public ModelAndView newShipmentRateMaster(HttpServletRequest request,HttpServletResponse response){
				try{
					// log.info("newShipmentRateMaster");
					modelAndViewObj = new ModelAndView();
					String customerIdStr = (String)request.getSession().getAttribute("customerId");
					String emailIdStr = (String)request.getSession().getAttribute("emailId");
					ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"0","Retail Outlet",false,true,false);
					modelAndViewObj.addObject("locationsList", locationsList);
					modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ShipmentRateMaster/newShipmentRateMaster");
				}catch(Exception exception){
					exception.printStackTrace();
				}
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
	public ModelAndView viewShipmentRateMaster(@RequestParam("index")String index,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewShipmentRateMaster");
			int start = 1,end = 10;
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			List<ShipmentRateMaster> shipmentRatesList = outletMasterServiceObj.getShipmentRates("",customerIdStr, emailIdStr,index,false,"");
			if(shipmentRatesList == null || shipmentRatesList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(shipmentRatesList.size()<10){
					end = (shipmentRatesList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(shipmentRatesList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("shipmentRatesList", shipmentRatesList);
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
		ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"0","Retail Outlet",false,true,false);
		String resultStr = outletMasterServiceObj.createNewShipmentRate(shipmentRateMasterObj, customerIdStr, emailIdStr);
		if(!resultStr.equals(AppProperties.getAppMessageByProperty("SHIPMENT_RATE_CREATE_SUCCESS").trim())){
			modelAndViewObj.addObject("shipmentRateDetails", shipmentRateMasterObj);
			modelAndViewObj.addObject("err", resultStr);
			modelAndViewObj.addObject("type", "new");
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ShipmentRateMaster/editShipmentRateMaster");
		}else{
			modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ShipmentRateMaster/newShipmentRateMaster");
		}
		modelAndViewObj.addObject("locationsList", locationsList);
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
	public ModelAndView editShipmentRate(@RequestParam("rateNo") String rateNoStr,@RequestParam("operation") String operation,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("editShipmentRate");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"0","Retail Outlet",false,true,true);
			modelAndViewObj = new ModelAndView();
			List<ShipmentRateMaster> shipmentRatesList = outletMasterServiceObj.getShipmentRates(rateNoStr,customerIdStr, emailIdStr,"0",false,"");
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
			ArrayList<LocationBean> locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"0","Retail Outlet",false,true,true);
			String resultStr=outletMasterServiceObj.updateShipmentRate(rateMasterObj, customerIdStr, emailIdStr);
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("SHIPMENT_RATE_UPDATE_SUCCESS").trim()))
				modelAndViewObj.addObject("err", resultStr);
			else
				modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.addObject("shipmentRateObj", rateMasterObj);
			modelAndViewObj.addObject("locationsList", locationsList);
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
	public ModelAndView deleteShipmentRate(@RequestParam("ids") String ids,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("deleteShipmentRate ");
			int start = 1,end = 10;
			modelAndViewObj = new ModelAndView();
			////////System.out.println("Ids : "+ids);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = outletMasterServiceObj.deleteShipmentRate(customerIdStr,emailIdStr,ids);
			List<ShipmentRateMaster> shipmentRatesList = outletMasterServiceObj.getShipmentRates("",customerIdStr, emailIdStr,"0",false,"");
			if(shipmentRatesList == null || shipmentRatesList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(shipmentRatesList.size()<10){
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
	public ModelAndView searchShipmentRate(@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		try{
			// log.info("searchShipmentRate");
			int start = 1,end = 10;
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<ShipmentRateMaster> shipmentRatesList = outletMasterServiceObj.getShipmentRates(searchNameStr,customerIdStr, emailIdStr,"0",true,"");
			modelAndViewObj = new ModelAndView();
			if(shipmentRatesList == null || shipmentRatesList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(shipmentRatesList.size()<10){
					end = (shipmentRatesList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(shipmentRatesList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("shipmentRatesList", shipmentRatesList);
			modelAndViewObj.setViewName("MasterDataManagement/OutletMasters/ShipmentRateMaster/viewShipmentRateMaster");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	

	@RequestMapping("/viewWHBomMaster")
	public ModelAndView viewWHBomMaster(@RequestParam("index")String index, @RequestParam("maxRecords")String maxRecords,@RequestParam("searchName")String searchName,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewBomMaster");
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			BillOfMaterialResponse priceRangeMasterResponeObj  = warehouseServiceObj.getWHBoms(searchName,customerIdStr, emailIdStr,index,"",maxRecords,"");
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
			modelAndViewObj.setViewName("MasterDataManagement/WarehouseMasters/BomMaster/BomMaster");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		modelAndViewObj.addObject("maxRecords",maxRecords);
		modelAndViewObj.addObject("searchName",searchName);
		return modelAndViewObj;
	}


	@RequestMapping("/viewEditBomMaster")
	public ModelAndView viewEditBomMaster(
			@RequestParam("priceRangeId") String bomRef,
			@RequestParam("type") String type,@RequestParam("maxRecords")String maxRecords,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
		modelAndViewObj = new ModelAndView();
	try {
		BillOfMaterialResponse priceRangeResponse=warehouseServiceObj.getWHBoms("", "", "", "0", bomRef,maxRecords,"");
		if(priceRangeResponse!=null){
			modelAndViewObj.addObject("bomresponse",priceRangeResponse.getBomObj());
		}
		if(type.equals("view"))
			modelAndViewObj.setViewName("MasterDataManagement/WarehouseMasters/BomMaster/viewBomMaster");
		else
			modelAndViewObj.setViewName("MasterDataManagement/WarehouseMasters/BomMaster/newBomMaster");
			
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	modelAndViewObj.addObject("maxRecords",maxRecords);
	modelAndViewObj.addObject("searchName",searchName);
	return modelAndViewObj;
	}
	
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
			modelAndViewObj.setViewName("MasterDataManagement/WarehouseMasters/BomMaster/newBomMaster");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	@RequestMapping(value="/createBom",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createBom(@RequestBody WarehouseProductBom featureobj,HttpServletRequest request,HttpServletResponse response){
		////////System.out.println(featureobj);
		try{
			// log.info("createBOMMaster");
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr=warehouseServiceObj.createBom(featureobj, customerIdStr, emailIdStr);
			////////System.out.println(resultStr);
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("BOM_GROUP_CREATE_SUCCESS").trim()) && !resultStr.equals(AppProperties.getAppMessageByProperty("BOM_GROUP_UPDATE_SUCCESS").trim())){
				modelAndViewObj.addObject("err", resultStr);
				modelAndViewObj.addObject("type", "new");
				modelAndViewObj.addObject("bomresponse", featureobj);
				modelAndViewObj.setViewName("MasterDataManagement/WarehouseMasters/BomMaster/newBomMaster");
			}else{
				modelAndViewObj.addObject("success", resultStr);
				modelAndViewObj.addObject("type", "edit");
				modelAndViewObj.addObject("bomresponse", featureobj);
				modelAndViewObj.setViewName("MasterDataManagement/WarehouseMasters/BomMaster/newBomMaster");
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
			////////System.out.println("Ids : "+ids);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = warehouseServiceObj.deleteBoms(customerIdStr,emailIdStr,ids);
			BillOfMaterialResponse priceRangeMasterResponeObj  = warehouseServiceObj.getWHBoms(searchName, customerIdStr, emailIdStr, "0", "",maxRecords,"");
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
			modelAndViewObj.setViewName("MasterDataManagement/WarehouseMasters/BomMaster/BomMaster");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		
		modelAndViewObj.addObject("maxRecords", maxRecords);
		modelAndViewObj.addObject("searchName", searchName);
		return modelAndViewObj;
	}	
	
	
	public ModelAndView searchBomMaster(@RequestParam("searchName")String searchName,@RequestParam("maxRecords")String maxRecords,@RequestParam("index")String index,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("searchBomMaster");
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			BillOfMaterialResponse priceRangeMasterResponeObj  = warehouseServiceObj.getWHBoms(searchName,customerIdStr, emailIdStr,index,"",maxRecords,"");
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
			modelAndViewObj.setViewName("MasterDataManagement/WarehouseMasters/BomMaster/BomMaster");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	

	@RequestMapping("/menuConfigurationsWH")
	public ModelAndView menuConfigurationsWH(HttpServletRequest request,HttpServletResponse response){
		String locationListAll="";
		try{
			// log.info("menuConfigurations");
			String locationStr = "";
			List<String> warehouselocationsList = null;
			List<MenuDetails> menuDetailsList = new ArrayList<MenuDetails>();
			String outlet_name = null;
			String customerId = request.getSession().getAttribute("customerId").toString();
			String emailId = request.getSession().getAttribute("emailId").toString();
			
			
			
			warehouselocationsList = adminServiceObj.getWarehouseLocationsList(customerId,emailId,true);			
			if(warehouselocationsList != null){
				for (String string : warehouselocationsList) {

					locationListAll = locationListAll+string+",";
				}
			}
				
					
					if(warehouselocationsList != null && warehouselocationsList.size() != 0){
						outlet_name = "";
						menuDetailsList = menuServiceObj.getMenuDetails(locationListAll, customerId, emailId,"",false);
					}

			
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("storesList", warehouselocationsList);
			modelAndViewObj.addObject("selectedStore", outlet_name);
			modelAndViewObj.addObject("menuDetailsList", menuDetailsList);
			modelAndViewObj.setViewName("Warehouse Management/menu/menu");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}

	
	
	@RequestMapping("/getMenuCategories")
	public ModelAndView getMenuCategories(@RequestParam("outlet_name") String outlet_name, HttpServletRequest request,HttpServletResponse response){
		String locationListAll="";
		try{
			// log.info("getMenuCategories");
			String locationStr = "";
			List<OutletInfo> storeList = null;
			List<String> warehouselocationsList = null;
			Map<String,Object> storesListMap = null;
			String customerId = request.getSession().getAttribute("customerId").toString();
			String emailId = request.getSession().getAttribute("emailId").toString();
			
			modelAndViewObj = new ModelAndView();
			
			
			warehouselocationsList = adminServiceObj.getWarehouseLocationsList(customerId,emailId,true);
			
			
				// log.info(outlet_name);
		  			if(outlet_name.equals("all")|| outlet_name.equals("")){
		  				if(warehouselocationsList != null){
		  					for (String string : warehouselocationsList) {

		  						locationListAll = locationListAll+string+",";
		  					}
		  				}
		  			}
		  			else
		  				locationListAll=outlet_name;
		  			
		  			modelAndViewObj.addObject("storesList", warehouselocationsList);
			
			
			
			List<MenuDetails> menuDetailsList = menuServiceObj.getMenuDetails(locationListAll, customerId, emailId,"",false);
			
			
			modelAndViewObj.addObject("selectedStore", outlet_name);
			modelAndViewObj.addObject("menuDetailsList", menuDetailsList);
			modelAndViewObj.setViewName("Warehouse Management/menu/menuCategories");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	@RequestMapping("/getMenuItems")
	public ModelAndView getMenuItems(@RequestParam("outlet_name") String outlet_name, HttpServletRequest request,HttpServletResponse response){
		String locationListAll="";
		try{
			// log.info("getMenuItems");
			List<OutletInfo> storeList = null;
			List<String> warehouselocationsList = null;
			Map<String,Object> storesListMap = null;
			String locationStr = "";
			String customerId = request.getSession().getAttribute("customerId").toString();
			String emailId = request.getSession().getAttribute("emailId").toString();
			modelAndViewObj = new ModelAndView();
		
			warehouselocationsList = adminServiceObj.getWarehouseLocationsList(customerId,emailId,true);
			
	  			if(outlet_name.equals("all")|| outlet_name.equals("")){
	  				if(warehouselocationsList != null){
						for (String string : warehouselocationsList) {

							locationListAll = locationListAll+string+",";
						}
					}
	  			}
	  			else
	  				locationListAll=outlet_name;
	  		
	  			
	  			
		
			
			List<MenuDetails> menuDetailsList = menuServiceObj.getMenuDetails(locationListAll, customerId, emailId,"",false);
			
			modelAndViewObj.addObject("storesList", warehouselocationsList);
			modelAndViewObj.addObject("selectedStore", outlet_name);
			modelAndViewObj.addObject("menuDetailsList", menuDetailsList);
			modelAndViewObj.setViewName("Warehouse Management/menu/menuItems");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	@RequestMapping("/getMenuNames")
	public @ResponseBody List<MenuDetails> getMenuNames(@RequestParam("outlet_name") String outlet_name, HttpServletRequest request,HttpServletResponse response){
		List<MenuDetails> menuDetailsList = new ArrayList<MenuDetails>();
		try{
			// log.info("getMenuNames");
			String customerId = request.getSession().getAttribute("customerId").toString();
			String emailId = request.getSession().getAttribute("emailId").toString();
			menuDetailsList = menuServiceObj.getMenuDetails(outlet_name, customerId, emailId,"",false);
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return menuDetailsList;
	}
	
	
	@RequestMapping("/getMenuCategoryNames")
	public @ResponseBody List<String> getMenuCategoryNames(@RequestParam("menu_name") String menu_name,@RequestParam("outlet_name") String outlet_name, HttpServletRequest request, HttpServletResponse response){
		List<String> menuCategoryNamesList = new ArrayList<String>();
		try{
			// log.info("getMenuCategoryNames");
			String customerId = request.getSession().getAttribute("customerId").toString();
			String emailId = request.getSession().getAttribute("emailId").toString();
			menuCategoryNamesList = menuServiceObj.getMenuCategoriesNames(menu_name,outlet_name, customerId, emailId);
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return menuCategoryNamesList;
	}
	
	
	@RequestMapping("/newMenuCategory")
	public ModelAndView newMenuCategory(@RequestParam("outlet_name") String outlet_name,HttpServletRequest request,HttpServletResponse response){
		try{
			String locationStr = "";
			// log.info("newMenuCategory");
			String customerId = request.getSession().getAttribute("customerId").toString();
			String emailId = request.getSession().getAttribute("emailId").toString();
			modelAndViewObj = new ModelAndView();
			
			List<String> workLocationsList = adminServiceObj.getWarehouseLocationsList(customerId,emailId,true);
			modelAndViewObj.addObject("selectedStore", outlet_name);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.setViewName("Warehouse Management/menu/newMenu");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	@RequestMapping("/newMenuItems")
	public ModelAndView newMenuItems(@RequestParam("outlet_name") String outlet_name,HttpServletRequest request,HttpServletResponse response){
		List<String> menuCategoryNamesList = new ArrayList<String>();
		List<MenuDetails> menuDetailsList = new ArrayList<MenuDetails>();
		String locationListAll ="";
		List<String> warehouselocationsList = null;
		try{
			String locationStr = "";
			// log.info("newMenuItems");
			String customerId = request.getSession().getAttribute("customerId").toString();
			String emailId = request.getSession().getAttribute("emailId").toString();
			modelAndViewObj = new ModelAndView();
			
			
			warehouselocationsList = adminServiceObj.getWarehouseLocationsList(customerId,emailId,true);
			
  			if(outlet_name.equals("all")|| outlet_name.equals("")){
  				if(warehouselocationsList != null){
					for (String string : warehouselocationsList) {

						locationListAll = locationListAll+string+",";
					}
				}
  			}
	  			modelAndViewObj.addObject("storesList", warehouselocationsList);
			
			menuDetailsList = menuServiceObj.getMenuDetails(locationListAll, customerId, emailId,"",false);
			if( menuDetailsList != null && menuDetailsList.size() != 0){
				menuCategoryNamesList = menuServiceObj.getMenuCategoriesNames(menuDetailsList.get(0).getMenu_name(),locationListAll, customerId, emailId);
			}
			
			modelAndViewObj.addObject("menuDetailsList", menuDetailsList);
			modelAndViewObj.addObject("menuCategoryNamesList", menuCategoryNamesList);
			modelAndViewObj.addObject("selectedStore", outlet_name);
			modelAndViewObj.setViewName("Warehouse Management/menu/newMenuItems");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	@RequestMapping("/editMenuCategory")
	public ModelAndView editMenuCategory(@RequestParam("menu_name") String menu_name,@RequestParam("outlet_name") String outlet_name, HttpServletRequest request,
			HttpServletResponse response){
		try{
			// log.info("editMenuCategory");
			String locationStr = "";
			List<String> warehouselocationsList = null;
			String customerId = request.getSession().getAttribute("customerId").toString();
			String emailId = request.getSession().getAttribute("emailId").toString();
			MenuDetails menuDetailsList = menuServiceObj.getCategoryDetails(menu_name,outlet_name, customerId, emailId);
             warehouselocationsList = adminServiceObj.getWarehouseLocationsList(customerId,emailId,true);
			
  			
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("storesList", warehouselocationsList);
			modelAndViewObj.addObject("menuDetailsList", menuDetailsList);
			modelAndViewObj.addObject("outletLocationname", outlet_name);
			modelAndViewObj.setViewName("Warehouse Management/menu/editMenu");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	@RequestMapping("/editMenuItems")
	public ModelAndView editMenuItems(@RequestParam("menu_name") String menu_name,@RequestParam("outlet_name") String outlet_name, HttpServletRequest request,
			HttpServletResponse response){
		List<MenuItems> menuitems = null;
		List<String> warehouselocationsList = null;
		
		try{
			// log.info("editMenuItems");
			menuitems = new ArrayList<MenuItems>();
			String locationStr = "";
			String customerId = request.getSession().getAttribute("customerId").toString();
			String emailId = request.getSession().getAttribute("emailId").toString();
			MenuDetails menuDetailsList = menuServiceObj.getitems(menu_name,outlet_name, customerId, emailId);
			List<String> menuCategoryNamesList = menuServiceObj.getMenuCategoryNames(menu_name,outlet_name, customerId, emailId);
            warehouselocationsList = adminServiceObj.getWarehouseLocationsList(customerId,emailId,true);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("storesList",warehouselocationsList);
			
			
			
			for(MenuCategory zone :menuDetailsList.getMenuCategories()){
				if(zone.getMenuItemsList()!=null && zone.getMenuItemsList().size()>0){
					for(MenuItems details : zone.getMenuItemsList()){
						menuitems.add(details);
					}
				}
			}

			modelAndViewObj.addObject("menuDetailsList", menuDetailsList);
			modelAndViewObj.addObject("menuItemsDetailsList",menuitems);
			modelAndViewObj.addObject("outletLocationname", outlet_name);
			modelAndViewObj.addObject("menuCategoryNamesList", menuCategoryNamesList);
			modelAndViewObj.setViewName("Warehouse Management/menu/editMenuItems");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	@RequestMapping("/viewMenuCategory")
	public ModelAndView viewMenuCategory(@RequestParam("menu_name") String menu_name,@RequestParam("outlet_name") String outlet_name, HttpServletRequest request,
			HttpServletResponse response){
		try{
			// log.info("viewMenuCategory");
			String locationStr = "";
			List<String> warehouselocationsList = null;
			String customerId = request.getSession().getAttribute("customerId").toString();
			String emailId = request.getSession().getAttribute("emailId").toString();
			MenuDetails menuDetailsList = menuServiceObj.getCategoryDetails(menu_name,outlet_name, customerId, emailId);
			 warehouselocationsList = adminServiceObj.getWarehouseLocationsList(customerId,emailId,true);			
			 modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("storesList", warehouselocationsList);
			modelAndViewObj.addObject("menuDetailsList", menuDetailsList);
			modelAndViewObj.addObject("outletLocationname", outlet_name);
			modelAndViewObj.setViewName("Warehouse Management/menu/viewMenu");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	@RequestMapping("/viewMenuItems")
	public ModelAndView viewMenuItems(@RequestParam("menu_name") String menu_name,@RequestParam("outlet_name") String outlet_name, HttpServletRequest request,
			HttpServletResponse response){
		List<MenuItems> menuitems = null;
		List<String> warehouselocationsList = null;
		try{
			// log.info("viewMenuItems");
			menuitems = new ArrayList<MenuItems>();
			String locationStr = "";
			String customerId = request.getSession().getAttribute("customerId").toString();
			String emailId = request.getSession().getAttribute("emailId").toString();
			MenuDetails menuDetailsList = menuServiceObj.getitems(menu_name,outlet_name, customerId, emailId);
			warehouselocationsList = adminServiceObj.getWarehouseLocationsList(customerId,emailId,true);
			modelAndViewObj = new ModelAndView();
			List<String> menuCategoryNamesList = menuServiceObj.getMenuCategoryNames(menu_name,outlet_name, customerId, emailId);
		

			
			for(MenuCategory zone :menuDetailsList.getMenuCategories()){
				if(zone.getMenuItemsList()!=null && zone.getMenuItemsList().size()>0){
					for(MenuItems details : zone.getMenuItemsList()){
//						if(details.getLocationType() == "Retail outlet")
						menuitems.add(details);
					}
				}
			}
			modelAndViewObj.addObject("storesList",warehouselocationsList);
			modelAndViewObj.addObject("menuDetailsList", menuDetailsList);
			modelAndViewObj.addObject("outletLocationname", outlet_name);
			modelAndViewObj.addObject("menuitemsList", menuitems);
			modelAndViewObj.addObject("menuCategoryNamesList", menuCategoryNamesList);
			modelAndViewObj.setViewName("Warehouse Management/menu/viewMenuItems");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	@RequestMapping(value="/addToAttachementList",method=RequestMethod.POST)
	public void addToAttachementList(@RequestParam("file") MultipartFile file,@RequestParam("refId") String refId,HttpServletRequest request,HttpServletResponse response) {
		Attachment attachmentObj = new Attachment();
		try {
			
			attachmentObj.setContent(file.getBytes());
			attachmentObj.setFileName(file.getOriginalFilename());
			attachmentObj.setAttachmentId(refId);
			OfferProxy offerProxyObj = new OfferProxy();
			String tokenStr = offerProxyObj.addAttahmentInTemp(attachmentObj);
			response.setContentType("application/text");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(tokenStr);
		}catch (RemoteException e) {
			e.printStackTrace();
		}
		catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/searchProductsForAllLocations")
	public @ResponseBody List<ProductsList> searchProductsForAllLocations(@RequestParam("searchName") String searchNameStr/*,@RequestParam("storeLocation")String storeLocation*/,@RequestParam("selectedLocationsList")String selectedLocationsList, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<ProductsList> productsList = new ArrayList<ProductsList>();
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			productsList = skuServiceObj.searchProductsForAllLocations(customerIdStr, emailIdStr,searchNameStr,"","",selectedLocationsList);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return productsList;
	}
	
	
	@RequestMapping("/searchProductsForMenu")
	public @ResponseBody List<ProductsList> searchProductsForMenu(@RequestParam("searchName") String searchNameStr,@RequestParam("storeLocation")String storeLocation,@RequestParam("selectedLocationsList")String selectedLocationsList, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<ProductsList> productsList = new ArrayList<ProductsList>();
		try{
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			productsList = skuServiceObj.searchProductsForMenu(customerIdStr, emailIdStr,searchNameStr,storeLocation,"",selectedLocationsList);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return productsList;
	}
	
	@RequestMapping(value="/createMenu",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createMenu(@RequestBody MenuDetails menuObj,HttpServletRequest request,HttpServletResponse response){
		try{
			String locationStr = "";
			
			String customerId = request.getSession().getAttribute("customerId").toString();
			String emailId = request.getSession().getAttribute("emailId").toString();
			String result = menuServiceObj.createMenu(menuObj,customerId,emailId);
			List<String> warehouselocationsList = adminServiceObj.getWarehouseLocationsList(customerId,emailId,true);
			modelAndViewObj = new ModelAndView();
			if(!result.equals(AppProperties.getAppMessageByProperty("CREATE_MENU_SUCCESS").trim())){
				modelAndViewObj.addObject("err", result);
				modelAndViewObj.addObject("menuDetailsList", menuObj);
			}else
				modelAndViewObj.addObject("success", result);
			
			modelAndViewObj.addObject("storesList", warehouselocationsList);
			modelAndViewObj.addObject("selectedStore", menuObj.getOutlet_name());
			modelAndViewObj.setViewName("Warehouse Management/menu/newMenu");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	@RequestMapping(value="/updateMenu",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView updateMenu(@RequestBody MenuDetails menuObj,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("updateMenu");
			String locationStr = "";
			// log.info(menuObj.getMenu_category_details().size());
			String customerId = request.getSession().getAttribute("customerId").toString();
			String emailId = request.getSession().getAttribute("emailId").toString();
			String result = menuServiceObj.updateMenu(menuObj,customerId,emailId);
			for(int i = 0; i<menuObj.getMenu_category_details().size();i++){
			}
		   MenuDetails menuDetailsList = menuServiceObj.getCategoryDetails(menuObj.getMenu_name(),menuObj.getOutlet_name(), customerId, emailId);
		   List<String> warehouselocationsList = adminServiceObj.getWarehouseLocationsList(customerId,emailId,true);
		   modelAndViewObj = new ModelAndView();
			if(!result.equals(AppProperties.getAppMessageByProperty("UPDATE_MENU_SUCCESS").trim())){
				modelAndViewObj.addObject("err", result);
			}else
				modelAndViewObj.addObject("success", result);
			
			modelAndViewObj.addObject("storesList", warehouselocationsList);
			modelAndViewObj.addObject("menuDetailsList", menuDetailsList);
			modelAndViewObj.setViewName("Warehouse Management/menu/editMenu");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	

	@RequestMapping(value="/addItemsToMenu",method=RequestMethod.POST)
	public ModelAndView addItemsToMenu(@RequestBody MenuDetails menuObj,HttpServletRequest request,HttpServletResponse response){
	String locationListAll="";
	List<String> menuCategoryNamesList = new ArrayList<String>();
	List<MenuDetails> menuDetailsList = new ArrayList<MenuDetails>();
		try{
		String locationStr = "";
		// log.info("addItemsToMenu");
		// log.info(menuObj.getMenu_category_details().size());
		String customerId = request.getSession().getAttribute("customerId").toString();
		String emailId = request.getSession().getAttribute("emailId").toString();
		String result = menuServiceObj.addItemToMenu(menuObj,customerId,emailId);
		   List<String> warehouselocationsList = adminServiceObj.getWarehouseLocationsList(customerId,emailId,true);

		modelAndViewObj = new ModelAndView();
		for (String string : menuObj.getLocationsList()) {
			locationListAll = locationListAll+string+",";
		}
		menuDetailsList = menuServiceObj.getMenuDetails(locationListAll, customerId, emailId,"",false);
		if( menuDetailsList != null && menuDetailsList.size() != 0){
		 menuCategoryNamesList = menuServiceObj.getMenuCategoriesNames(menuObj.getMenu_name(),locationListAll, customerId, emailId);
		}//modelAndViewObj.addObject("err",result);
		if(!result.equals(AppProperties.getAppMessageByProperty("ADD_MENU_ITEMS_SUCCESS").trim())){
			
			for(int i = 0; i<menuObj.getMenu_item_details().size();i++){
				menuObj.setMenuItemsList(menuObj.getMenu_item_details());
//				menuObj.getMenu_item_details().get(i).getMenu_item_id();
			}
			modelAndViewObj.addObject("menuitemDetailsList", menuObj);
			modelAndViewObj.addObject("err", result);
		}else
			modelAndViewObj.addObject("success", result);
		modelAndViewObj.addObject("menuCategoryNamesList", menuCategoryNamesList);
		modelAndViewObj.addObject("menuDetailsList", menuDetailsList);
		modelAndViewObj.addObject("storesList", warehouselocationsList);
	   modelAndViewObj.setViewName("Warehouse Management/menu/newMenuItems");
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
	}


	@RequestMapping(value="/updateMenuItems",method=RequestMethod.POST)
	public ModelAndView updateMenuItems(@RequestBody MenuDetails menuObj,HttpServletRequest request,HttpServletResponse response){
	String locationListAll="";
		try{
		String locationStr = "";
		String customerId = request.getSession().getAttribute("customerId").toString();
		String emailId = request.getSession().getAttribute("emailId").toString();
		String result = menuServiceObj.updateMenuItems(menuObj,customerId,emailId);
		for(int i = 0; i<menuObj.getMenu_item_details().size();i++){
		}
		
		for (String string : menuObj.getLocationsList()) {
			locationListAll = locationListAll+string+",";
		}
		   List<String> warehouselocationsList = adminServiceObj.getWarehouseLocationsList(customerId,emailId,true);

		List<String> menuCategoryNamesList = menuServiceObj.getMenuCategoriesNames(menuObj.getMenu_name(),locationListAll, customerId, emailId);
		modelAndViewObj = new ModelAndView();
		if(!result.equals(AppProperties.getAppMessageByProperty("UPDATE_MENU_ITEMS_SUCCESS").trim())){
			modelAndViewObj.addObject("err", result);
		}else
			modelAndViewObj.addObject("success", result);
		modelAndViewObj.addObject("menuDetailsList", menuObj);
		modelAndViewObj.addObject("menuItemsDetailsList",menuObj.getMenu_item_details());
		modelAndViewObj.addObject("menuCategoryNamesList", menuCategoryNamesList);
		modelAndViewObj.addObject("storesList", warehouselocationsList);
		modelAndViewObj.setViewName("Warehouse Management/menu/editMenuItems");
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
	}
	@RequestMapping("/searchMenuCategories")
	public ModelAndView searchMenuCategories(@RequestParam("outlet_name") String outlet_name,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
		String locationListAll="";
		try{
			// log.info("getMenuCategories");
			String locationStr = "";
			String customerId = request.getSession().getAttribute("customerId").toString();
			String emailId = request.getSession().getAttribute("emailId").toString();
			   List<String> warehouselocationsList = adminServiceObj.getWarehouseLocationsList(customerId,emailId,true);
			
			
			 
	  			if(outlet_name.equals("all")|| outlet_name.equals("")){
	  				if(warehouselocationsList != null){
	  					for (String string : warehouselocationsList) {

	  						locationListAll = locationListAll+string+",";
	  					}
	  				}
	  			}
	  			else
	  			{
	  				locationListAll=outlet_name;
	  			}
			List<MenuDetails> menuDetailsList = menuServiceObj.getMenuDetails(locationListAll, customerId, emailId,searchName,true);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("storesList", warehouselocationsList);
			modelAndViewObj.addObject("selectedStore", outlet_name);
			modelAndViewObj.addObject("searchName", searchName);
			modelAndViewObj.addObject("menuDetailsList", menuDetailsList);
			modelAndViewObj.setViewName("Warehouse Management/menu/menuCategories");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	@RequestMapping("/getCategoryDetailsBasedOnCategory")
	public @ResponseBody List<MenuItems> getCategoryDetailsBasedOnCategory(@RequestParam("categoryName") String categoryName,@RequestParam("menu_name")String menu_name,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<MenuItems> menuitems = new ArrayList<MenuItems>();
		try{
			// log.info("getShipmentNoteItems");
			String customerId = request.getSession().getAttribute("customerId").toString();
			String emailId = request.getSession().getAttribute("emailId").toString();
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			MenuDetails menuDetailsList = menuServiceObj.getCategoryDetailsBasedOnCategory(menu_name,categoryName, customerId, emailId);
			for(MenuCategory zone :menuDetailsList.getMenuCategories()){
				if(zone.getMenuItemsList()!=null && zone.getMenuItemsList().size()>0){
					for(MenuItems details : zone.getMenuItemsList()){
//						if(details.getLocationType() == "Retail outlet")
						menuitems.add(details);
					}
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return menuitems;
	}
	
	@RequestMapping("/searchMenuCategoriesinMenuItem")
	public ModelAndView searchMenuCategoriesinMenuItem(@RequestParam("outlet_name") String outlet_name,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
	String locationListAll = "";
		try{
			// log.info("getMenuCategories");
			String locationStr = "";
			String customerId = request.getSession().getAttribute("customerId").toString();
			String emailId = request.getSession().getAttribute("emailId").toString();
			   List<String> warehouselocationsList = adminServiceObj.getWarehouseLocationsList(customerId,emailId,true);

	  			if(outlet_name.equals("all")|| outlet_name.equals("")){
	  				if(warehouselocationsList != null){
	  					for (String string : warehouselocationsList) {

	  						locationListAll = locationListAll+string+",";
	  					}
	  				}
	  			}
	  			else
	  			{
	  				locationListAll=outlet_name;
	  			}
			
			List<MenuDetails> menuDetailsList = menuServiceObj.getMenuDetails(locationListAll, customerId, emailId,searchName,true);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("storesList", warehouselocationsList);
			modelAndViewObj.addObject("selectedStore", outlet_name);
			modelAndViewObj.addObject("menuDetailsList", menuDetailsList);
			modelAndViewObj.setViewName("Warehouse Management/menu/menuItems");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	


	@RequestMapping(value="/createPickList",method=RequestMethod.POST)
	public ModelAndView createPickList(@RequestParam("formData") String data,HttpServletRequest request,HttpServletResponse response){
		String resultStr;
		WarehousePicklistMaster warehousePicklistMaster = null;
		ArrayList<LocationBean> locationBeansList = new ArrayList<LocationBean>();	
		try{ 
			
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			//System.out.println(data);
			warehousePicklistMaster = gson.fromJson(data,WarehousePicklistMaster.class);
			
			resultStr = warehouseServiceObj.createPickList(warehousePicklistMaster,customerIdStr,emailIdStr);
			
			locationBeansList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Warehouse",false,false,true);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("locationsList", locationBeansList);
			
			if(resultStr == "Picklist Created Succesfully")
		      modelAndViewObj.addObject("success", resultStr);
			else
		     modelAndViewObj.addObject("err", resultStr);
		    
			modelAndViewObj.setViewName("Storage/newPicklist");
		
		
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		 
		return modelAndViewObj;
	}

	
	@RequestMapping(value="/updatePickList",method=RequestMethod.POST)
	public ModelAndView updatePickList(@RequestParam("formData") String data,HttpServletRequest request,HttpServletResponse response){
		String resultStr;
		WarehousePicklistMaster warehousePicklistMaster = null;
		try{ 
			
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			
			warehousePicklistMaster = gson.fromJson(data,WarehousePicklistMaster.class);
			
			resultStr = warehouseServiceObj.updatePickList(warehousePicklistMaster,customerIdStr,emailIdStr);
			
			modelAndViewObj = new ModelAndView();
			
				modelAndViewObj.addObject("errMenu", resultStr);
				modelAndViewObj.setViewName("Storage/newPicklist");
		
		
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		 
		return modelAndViewObj;
	}

	
	@RequestMapping("/showPricemanagementFlow")
	public ModelAndView showPricemanagementFlow(@RequestParam("flowunder") String flowunder,HttpServletRequest request,HttpServletResponse response){
		// log.info("InventoryManagerController - showOutletFlows");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("flowunder", flowunder);
		modelAndViewObj.setViewName("MasterDataManagement/WarehouseMasters/pricemanagementFlow");
		return modelAndViewObj;
	}

	
	@RequestMapping(value="/createWarehouseQuickSku",method=RequestMethod.POST,consumes="application/json")
	public void createWarehouseQuickSku(@RequestBody WareHouseSku obj_SkuMasterBean,HttpServletRequest request,HttpServletResponse response) {
		String jsonString=null;
		String resultStr=null;
		try{
			// log.info("createSku");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			obj_SkuMasterBean.setCreationType("Quick");
			resultStr = skuServiceObj.createWarehouseSku(obj_SkuMasterBean,customerIdStr,emailIdStr);
			modelAndViewObj = new ModelAndView();
			
			if(resultStr.equals(AppProperties.getAppMessageByProperty("SKU_CREATE_SUCCESS").trim()))
				 jsonString = "{\"success\":\""+resultStr+"\",\"code\":\""+0+"\"}";
			else
				 jsonString = "{\"error\":\""+resultStr+"\",\"code\":\""+1+"\"}";
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
	    	response.getWriter().write(jsonString);
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
	///	return modelAndViewObj;
	}
	
	
	
	@RequestMapping(value="/updateWarehouseQuickSku",method=RequestMethod.POST,consumes="application/json")
	public void updateWarehouseQuickSku(@RequestBody WareHouseSku obj_SkuMasterBean,HttpServletRequest request,HttpServletResponse response) {
		String jsonString = null;
		try{
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			obj_SkuMasterBean.setCreationType("Quick");
			String result = skuServiceObj.updateWarehouseSku(obj_SkuMasterBean,customerIdStr,emailIdStr);
		
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

}


