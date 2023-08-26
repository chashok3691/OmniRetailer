package com.tlabs.posweb.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.tlabs.posweb.beans.CustomerGroupMaster;
import com.tlabs.posweb.beans.Deal;
import com.tlabs.posweb.beans.DealRanges;
import com.tlabs.posweb.beans.Department;
import com.tlabs.posweb.beans.LoyaltyCardMaster;
import com.tlabs.posweb.beans.Offer;
import com.tlabs.posweb.beans.OfferRanges;
import com.tlabs.posweb.beans.OffersBean;
import com.tlabs.posweb.beans.ProductCategoryBean;
import com.tlabs.posweb.beans.ProductSubCategoryBean;
import com.tlabs.posweb.beans.ProductsList;
//import com.tlabs.posweb.beans.SectionDetails;
import com.tlabs.posweb.beans.Sku;
//import com.tlabs.posweb.beans.SkuId;
import com.tlabs.posweb.beans.SkuPriceList;
import com.tlabs.posweb.beans.Suppliers;
import com.tlabs.posweb.init.AppProperties;
import com.tlabs.posweb.services.AdminService;
import com.tlabs.posweb.services.CustomerService;
import com.tlabs.posweb.services.DealService;
import com.tlabs.posweb.services.DepartmentService;
import com.tlabs.posweb.services.MasterService;
import com.tlabs.posweb.services.OfferService;
import com.tlabs.posweb.services.OutletMasterService;
import com.tlabs.posweb.services.SkuService;
import com.tlabs.posweb.util.Response;
import com.tlabs.posweb.util.Utilities;

@Controller
@RequestMapping(value = "/dealsAndOffers")
public class DealsAndOffersController {
	
	private ModelAndView modelAndViewObj;
	//private static Logger log = Logger.getLogger(DealsAndOffersController.class);
	@Autowired
	private DealService dealServiceObj;
	@Autowired
	private OfferService offerServiceObj;
	@Autowired
	private AdminService adminServiceObj;
	@Autowired
    private CustomerService customerServiceObj;
	@Autowired
	private MasterService masterServiceObj;
	@Autowired
	private OutletMasterService outletMasterServiceObj;
	@Autowired
	private Gson gson;
	  @Autowired
	    private DepartmentService departmentServiceObj;
	  @Autowired
	  private SkuService skuServiceObj;
	
	/**
	 * @author Mythri.S
	 * @param request
	 * @param response
	 * @return returns a jsp which displays all the icons of deals and offers flow
	 */
	@RequestMapping("/showDealsFlow")
	public ModelAndView showDealsFlow(HttpServletRequest request,HttpServletResponse response){
		// log.info("InventoryManagerController - showDealsFlow");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("Deals and Offers/dealsFlow");
		return modelAndViewObj;
	}
	
	
	@RequestMapping("/showPromotionsFlow")
	public ModelAndView showPromotionsFlow(HttpServletRequest request,HttpServletResponse response){
		// log.info("InventoryManagerController - showDealsFlow");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("Deals and Offers/promotionsFlow");
		return modelAndViewObj;
	}
	
	
	@RequestMapping(value="/getdealsandofers",method = RequestMethod.POST)
	public @ResponseBody ModelAndView getdealsandofers(
			@RequestParam("zone") String zone,
			@RequestParam("offerType") String offerType,
			@RequestParam("offerStatusValue")String offerStatusValue,
			@RequestParam("type")String type,
			@RequestParam("location")String location,
			@RequestParam("locationsList")String locationList,
			@RequestParam("index")String index,
			@RequestParam("maxRecords")String maxRecords,HttpServletRequest request,HttpServletResponse response){
		
		/**
		 * Developed By : Sambaiah Y
		 * Created On   : 30-04-2015
		 * Modified By  : 
		 * This method is used to get the billings from the services
		 * This method interacts with bills service to get billing details 
		 * 
		 */
		
		// log.info("InventoryManagerController - getdealsandofers()");
		List<String> locationsList = null;
		List<Deal> lst_deal = null;
		List<Offer> lst_offers = null;
//		String str_check = "",str_loc = "location";
		try {
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			lst_deal = new ArrayList<Deal>();
			lst_offers = new ArrayList<Offer>();
			modelAndViewObj = new ModelAndView();
			locationsList = adminServiceObj.getAllLocationsList(customerIdStr,emailIdStr,true);
			//locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			/*if(str_check.equalsIgnoreCase(location) || location == null || str_loc.equalsIgnoreCase(location)){
				location = (String)request.getSession().getAttribute("selectedLocation");
				if(location == null && locationsList != null && locationsList.size()>0)
					location = locationsList.get(0);
			}
			request.getSession().setAttribute("selectedLocation", location);*/
		
			
//			Added by vijay, to make default loaction as location list first occurrence, if location is empty
		/*	if((location.trim()).equals(null) || location.trim().isEmpty())
			{
				location = locationsList.get(0);
			}*/
			if(location != null && !location.equals("")){
				request.getSession().setAttribute("selectedLocation", location);
			}
			
			
			if(type.equals("deals")){
				lst_deal = dealServiceObj.getDeals(customerIdStr,emailIdStr,location,"all",index,maxRecords,false,"",null);
				if(lst_deal == null){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
					modelAndViewObj.addObject("err","No Deals Found");
				}else{
					if(lst_deal.size()<Integer.parseInt(maxRecords)){
						end = (lst_deal.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(lst_deal.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
					modelAndViewObj.addObject("dealDetails",lst_deal);
				}
				modelAndViewObj.addObject("locationsList", locationsList);
				modelAndViewObj.addObject("type",type);
				modelAndViewObj.addObject("location",location);
				
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.setViewName("Deals and Offers/Deals/deals");
			}
			else{
				// log.info("From Offers");
				/*if(str_check.equalsIgnoreCase(location) || location == null || str_loc.equalsIgnoreCase(location)){
					location = (String)request.getSession().getAttribute("selectedLocation");
					if(location == null && locationsList != null && locationsList.size()>0)
						location = locationsList.get(0);
				}
				if(location != null && !location.equals(""))
				request.getSession().setAttribute("selectedLocation", location);*/
				lst_offers = offerServiceObj.getOffers(customerIdStr,emailIdStr,location,"all",index,maxRecords,false,"",null,offerStatusValue,zone,offerType,locationList);
				if(lst_offers == null){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
					modelAndViewObj.addObject("err","No Offers Found");
				}else{
					if(lst_offers.size()<Integer.parseInt(maxRecords)){
						end = (lst_offers.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(lst_offers.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
					modelAndViewObj.addObject("offerDetails",lst_offers);
				}
				modelAndViewObj.addObject("locationsList", locationsList);
				modelAndViewObj.addObject("type",type);
				modelAndViewObj.addObject("location",location);
				modelAndViewObj.addObject("offerStatusValue",offerStatusValue);
				modelAndViewObj.addObject("zone",zone);
				modelAndViewObj.addObject("offerType",offerType);
				modelAndViewObj.addObject("offerStatusValue",offerStatusValue);
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.setViewName("Deals and Offers/Offers/offers");
			}
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("type",type);
			modelAndViewObj.addObject("err","Something went wrong");
			modelAndViewObj.setViewName("Deals and Offers/dealsFlow");
		}
		return modelAndViewObj;
	}
	
	
	
	
	
	/**
	 * @modified by Manasa
	 * @modified Date 19/02/2012
	 *@param :dealid's,location,maxrecords
	 * @return ModelAndView
	 */
	@RequestMapping("/deleteDeals")
	public ModelAndView deleteDeals(@RequestParam("ids") String ids,@RequestParam("location") String location,@RequestParam("type") String type,@RequestParam("maxRecords") String maxRecords,HttpServletRequest request,HttpServletResponse response){
		// log.info("deleteoffers ");
		List<String> locationsList = null;
		List<Deal> lst_deal = null;
		try{
			int start = 1,end = 10;
			lst_deal = new ArrayList<Deal>();
			modelAndViewObj = new ModelAndView();
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			String result = dealServiceObj.deleteDeal(customerId,emailId ,ids);
			// log.info(result);
			locationsList = adminServiceObj.getOutletLocationsList(customerId,emailId,true);
			lst_deal = dealServiceObj.getDeals(customerId,emailId,location,"all","0",maxRecords,false,"",null);
			if(lst_deal == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
				//modelAndViewObj.addObject("err","No Deals Found");
			}else{
				if(lst_deal.size()<Integer.parseInt(maxRecords)){
					end = (lst_deal.size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				//modelAndViewObj.addObject("locationsList", locationsList);
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(lst_deal.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("dealDetails",lst_deal);
			}
			
			if(result.equals(AppProperties.getAppMessageByProperty("deal_delete_success").trim()))
			    modelAndViewObj.addObject("success", result);
				else
				modelAndViewObj.addObject("err", result);
			
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("type",type);
			modelAndViewObj.addObject("location",location);
			//modelAndViewObj.addObject("err", result);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
			modelAndViewObj.setViewName("Deals and Offers/Deals/deals");
			}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}

	
	@RequestMapping("/searchDeals")
	public ModelAndView searchDeals(
			@RequestParam("zone") String zone,
			@RequestParam("offerType") String offerType,
			@RequestParam("offerStatusValue") String offerStatusValue,
			@RequestParam("searchName") String searchNameStr,
			@RequestParam("index") String index,
			@RequestParam("location") String location,
			@RequestParam("maxRecords") String maxRecords,
			@RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate,
			@RequestParam("saveFlag") String saveFlag,
			HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		try{
			// log.info("searchDeals");
			int start = 1,end = Integer.parseInt(maxRecords);
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			List<Deal> dealsList = dealServiceObj.searchDeals(customerIdStr, emailIdStr, location, searchNameStr, index,maxRecords,startDate,endDate,false,null,zone,offerType,offerStatusValue,saveFlag);
			modelAndViewObj = new ModelAndView();
			if(location != null && !location.equals(""))
				request.getSession().setAttribute("selectedLocation", location);
			if(dealsList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
				modelAndViewObj.addObject("filePath", "");

			}else{
				if(dealsList.size()<Integer.parseInt(maxRecords)){
					end = (dealsList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(dealsList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("dealDetails",dealsList);
				modelAndViewObj.addObject("filePath", dealsList.get(0).getFilePath());
			}
			modelAndViewObj.addObject("location",location);
			modelAndViewObj.addObject("locationsList", workLocationsList);
		    modelAndViewObj.addObject("searchName", searchNameStr);
		    modelAndViewObj.addObject("startDate",startDate);
		    modelAndViewObj.addObject("endDate", endDate);
		    modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
		    modelAndViewObj.addObject("offerStatusValue",offerStatusValue);
			modelAndViewObj.addObject("zone",zone);
			modelAndViewObj.addObject("offerType",offerType);
			modelAndViewObj.setViewName("Deals and Offers/Deals/deals");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	@RequestMapping("/searchOffers")
	public ModelAndView searchOffers(
			@RequestParam("zone") String zone,
			@RequestParam("offerType") String offerType,
			@RequestParam("offerStatusValue") String offerStatusValue,
			@RequestParam("searchName") String searchNameStr,
			@RequestParam("index") String index,
			@RequestParam("location") String location,
			@RequestParam("maxRecords") String maxRecords,
			@RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate,
			@RequestParam("locationsList") String locationsList,@RequestParam("saveFlag") String saveFlag  ,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		try{
			// log.info("searchOffers");
			int start = 1,end = Integer.parseInt(maxRecords);
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<String> workLocationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			List<Offer> offersList = offerServiceObj.searchOffers(customerIdStr, emailIdStr, location, searchNameStr, index,maxRecords,startDate,endDate,offerStatusValue,zone,offerType,locationsList,saveFlag);
			modelAndViewObj = new ModelAndView();
			/*if(location != null && !location.equals(""))
				request.getSession().setAttribute("selectedLocation", location);*/
			if(offersList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
				modelAndViewObj.addObject("filePath", "");
			}else{
				if(offersList.size()<Integer.parseInt(maxRecords)){
					end = (offersList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(offersList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("offerDetails",offersList);
				modelAndViewObj.addObject("filePath", offersList.get(0).getFilePath());
			}
			modelAndViewObj.addObject("location",location);
			modelAndViewObj.addObject("locationsList", workLocationsList);
		    modelAndViewObj.addObject("searchName", searchNameStr);
		    modelAndViewObj.addObject("startDate",startDate);
		    modelAndViewObj.addObject("endDate", endDate);
		    modelAndViewObj.addObject("offerStatusValue",offerStatusValue);
			modelAndViewObj.addObject("zone",zone);
			modelAndViewObj.addObject("offerType",offerType);
//		    modelAndViewObj.addObject("offerStatusValue", offerStatusValue);
		    modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
			modelAndViewObj.setViewName("Deals and Offers/Offers/offers");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	
	
	
	
	
	
	@RequestMapping("/deal")
	public @ResponseBody ModelAndView deal(HttpServletRequest request,HttpServletResponse response){
		
		/**
		 * Developed By : Sambaiah Y
		 * Created On   : 03-05-2015
		 * Modified By  : 
		 * This method is used display the create new deal page
		 * 	 */
		
		// log.info("InventoryManagerController - deal()");
		List<String> locationsList = null;
		try {
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			//locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
			locationsList = adminServiceObj.getAllLocationsList(customerIdStr,emailIdStr,true);
			List<Department> departmentList =(List<Department>)request.getSession().getAttribute("departmentList");
			if(departmentList==null || departmentList.size()==0 || departmentList.isEmpty()){
				departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerIdStr, emailIdStr,"-1",false);
				request.getSession().setAttribute("departmentList", departmentList);
			}
//			String subCategories = masterServiceObj.getCategories(customerIdStr,emailIdStr);
//			ArrayList<String> categories = masterServiceObj.getCategoriesList(subCategories);
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
			List<String> zones = masterServiceObj.getZonesList(customerIdStr, emailIdStr);
			modelAndViewObj.addObject("zones", zones);
			modelAndViewObj.addObject("categories", categoryList);
			/*if(subCategories.equals("{}"))
				modelAndViewObj.addObject("err", "Please Create Category and Sub Category prior to create product");
			modelAndViewObj.addObject("subCategories", subCategories);*/
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.setViewName("Deals and Offers/Deals/newdeal");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.setViewName("Deals and Offers/Deals/newdeal");
		}
			return modelAndViewObj;
		}
	
	@RequestMapping(value = "/createDeal",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createDeal(@RequestBody Deal deal,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null,str_response = null;
		List<DealRanges> lst_ranges = new ArrayList<DealRanges>();
		DealRanges obj_ranges = new DealRanges();
		try{
			/*// log.info("ImventoryManagerController - createDeal()");
			// log.info(deal.getDealRanges());
			// log.info(deal.getDeal_image());*/
			List<String> locationsList = null;
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			String  roleIdStr = (String)request.getSession().getAttribute("role");
			String responseList = Response.getResponseList(deal.getDealRanges(),"range");
			modelAndViewObj = new ModelAndView();
			JSONArray jsonResponseArray = new JSONArray(responseList);
			for (int i=0; i<jsonResponseArray.length(); i++) {
				obj_ranges = gson.fromJson(jsonResponseArray.getString(i), DealRanges.class);
				lst_ranges.add(obj_ranges);
			}
			deal.setRangeList(lst_ranges);
			str_response = dealServiceObj.createDeal(customerIdStr,emailIdStr,roleIdStr,deal);
			//// log.info(str_response);
			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
//			String subCategories = masterServiceObj.getCategories(customerIdStr,emailIdStr);
//			ArrayList<String> categories = masterServiceObj.getCategoriesList(subCategories);
			List<String> zones = masterServiceObj.getZonesList(customerIdStr, emailIdStr);
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
			modelAndViewObj.addObject("zones", zones);
			modelAndViewObj.addObject("categories", categoryList);
			/*if(subCategories.equals("{}"))
				modelAndViewObj.addObject("err", "Please Create Category and Sub Category prior to create product");
			modelAndViewObj.addObject("subCategories", subCategories);*/
			modelAndViewObj.addObject("locationsList", locationsList);
		
			
			if(!str_response.equals(AppProperties.getAppMessageByProperty("Deal_Created_Successfully").trim())){
				modelAndViewObj.addObject("error", str_response);
			}else
				modelAndViewObj.addObject("success", str_response);
			
			//modelAndViewObj.addObject("error",str_response);
			modelAndViewObj.setViewName("Deals and Offers/Deals/newdeal");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("error","Something went wrong");
			modelAndViewObj.setViewName("Deals and Offers/Deals/newdeal");
		}
	return modelAndViewObj;
}
	
	@RequestMapping(value = "/updatedeal",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView updatedeal(@RequestBody Deal deal,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null,str_response = null;
		List<DealRanges> lst_ranges = new ArrayList<DealRanges>();
		DealRanges obj_ranges = new DealRanges();
		List<Deal> lst_deal = null;
		try{
			lst_deal = new ArrayList<Deal>();
			//// log.info("ImventoryManagerController - updatedeal()");
			//// log.info(deal.getDealRanges());
			List<String> locationsList = null;
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			String  roleIdStr = (String)request.getSession().getAttribute("role");
			String responseList = Response.getResponseList(deal.getDealRanges(),"editrange");
			modelAndViewObj = new ModelAndView();
			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
			JSONArray jsonResponseArray = new JSONArray(responseList);
			for (int i=0; i<jsonResponseArray.length(); i++) {
				obj_ranges = gson.fromJson(jsonResponseArray.getString(i), DealRanges.class);
				lst_ranges.add(obj_ranges);
			}
			deal.setRangeList(lst_ranges);
			str_response = dealServiceObj.updateDeal(customerIdStr,emailIdStr,roleIdStr,deal);
			//// log.info(str_response);
			lst_deal = dealServiceObj.getDeals(customerIdStr,emailIdStr,deal.getDealID(),"specific","0","",false,"",null);
			
			List<String> dealLocations=new ArrayList<String>();
			String counterListStr="";
			if(lst_deal.get(0).getDealLocationsList()!=null)
				for(int i=0;i<lst_deal.get(0).getDealLocationsList().size();i++)
				{
					counterListStr=lst_deal.get(0).getDealLocationsList().get(i).getStoreLocation(); 
					dealLocations.add(counterListStr);
					//////////System.out.println(i);
				//	////////System.out.println(empList1);
				}
				
			modelAndViewObj.addObject("dealLocations",dealLocations);
			//////////System.out.println(dealLocations);
//			String subCategories = masterServiceObj.getCategories(customerIdStr,emailIdStr);
//			ArrayList<String> categories = masterServiceObj.getCategoriesList(subCategories);
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
			modelAndViewObj.addObject("categories", categoryList);
			List<String> zones = masterServiceObj.getZonesList(customerIdStr, emailIdStr);
			modelAndViewObj.addObject("zones", zones);
			/*if(subCategories.equals("{}"))
				modelAndViewObj.addObject("err", "Please Create Category and Sub Category prior to create product");
			modelAndViewObj.addObject("subCategories", subCategories);*/
			modelAndViewObj.addObject("dealBean", lst_deal.get(0));
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("selectedcategorie", lst_deal.get(0).getCategory());
			modelAndViewObj.addObject("sellProducts", lst_deal.get(0).getSell_products());
			if(lst_deal.get(0).getDealGroupId() != null && !"".equals(lst_deal.get(0).getDealGroupId())){
				modelAndViewObj.addObject("sellGroupSkus", lst_deal.get(0).getSell_skus());
				modelAndViewObj.addObject("dealGroupSkus", lst_deal.get(0).getDeal_skus());
			}else{
				modelAndViewObj.addObject("sellskus", lst_deal.get(0).getSell_skus());
				modelAndViewObj.addObject("dealskus", lst_deal.get(0).getDeal_skus());
			}
			modelAndViewObj.addObject("dealproducts", lst_deal.get(0).getDeal_products());
			modelAndViewObj.addObject("dealbanner", lst_deal.get(0).getBannerImage());
			//modelAndViewObj.addObject("error",str_response);
			
			if(!str_response.equals(AppProperties.getAppMessageByProperty("Deal_Update_Successfully").trim())){
				modelAndViewObj.addObject("error", str_response);
			}else
				modelAndViewObj.addObject("success", str_response);
			
			modelAndViewObj.addObject("dealObj",deal);
			modelAndViewObj.setViewName("Deals and Offers/Deals/editdeal");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("error","Something went wrong");
			modelAndViewObj.setViewName("Deals and Offers/Deals/editdeal");
		}
	return modelAndViewObj;
}
	
	
	@RequestMapping("/offer")
	public @ResponseBody ModelAndView offer(HttpServletRequest request,HttpServletResponse response){

		/**
		 * Developed By : Sambaiah Y
		 * Created On   : 09-05-2015
		 * Modified By  : 
		 * This method is used display the create new offer page
		 * 	 */

		// log.info("InventoryManagerController - offer()");
		List<String> locationsList = null;
		try {
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			modelAndViewObj = new ModelAndView();
			//			String subCategories = masterServiceObj.getCategories(customerIdStr,emailIdStr);
			//			ArrayList<String> categories = masterServiceObj.getCategoriesList(subCategories);
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
			modelAndViewObj.addObject("categories", categoryList);
			//			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
			//locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			locationsList = adminServiceObj.getAllLocationsList(customerIdStr,emailIdStr,true);
			modelAndViewObj.addObject("locationsList", locationsList);
			List<Department> departmentList =(List<Department>)request.getSession().getAttribute("departmentList");
			if(departmentList==null || departmentList.size()==0 || departmentList.isEmpty()){
				departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerIdStr, emailIdStr,"-1",false);
				request.getSession().setAttribute("departmentList", departmentList);
			}
			List<Suppliers> supplierList =(List<Suppliers>)request.getSession().getAttribute("supplierList");
			if(supplierList==null || supplierList.size()==0 || supplierList.isEmpty()){
				supplierList = outletMasterServiceObj.getSuppliers(customerIdStr, emailIdStr,"-1","","");
				request.getSession().setAttribute("supplierList", supplierList);
			}

			List<String> brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
			modelAndViewObj.addObject("brandsList", brandsList);
			/*if(subCategories.equals("{}"))
				modelAndViewObj.addObject("err", "Please Create Category and Sub Category prior to create product");
			modelAndViewObj.addObject("subCategories", subCategories);*/
			List<String> zones = masterServiceObj.getZonesList(customerIdStr, emailIdStr);
			
			//List<CustomerGroupMaster> groupsList = customerServiceObj.getCustomerGroupDetails("",customerIdStr, emailIdStr,"-1","10",true, true,"","","","");
			List<CustomerGroupMaster> groupsList = customerServiceObj.getCustomerGroupDetails("",customerIdStr, emailIdStr,"-1","10",true, false,"","","","");
			List<String> groupid = new ArrayList<String>();
			if(groupsList != null) {
			for(int i=0;i<groupsList.size();i++)
				{
				 groupid.add(groupsList.get(i).getGroup_id());
			
				}
			 modelAndViewObj.addObject("groupids", groupid);
			}
			
			modelAndViewObj.addObject("zones", zones);
			
			modelAndViewObj.setViewName("Deals and Offers/Offers/newoffer");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.setViewName("Deals and Offers/Offers/newoffer");
		}
		return modelAndViewObj;
	}
	
	@RequestMapping("/dealdetails")
	public @ResponseBody ModelAndView dealdetails(@RequestParam("dealId")String dealId,@RequestParam("formData") String formData,HttpServletRequest request,HttpServletResponse response){
		
		/**
		 * Developed By : Sambaiah Yo
		 * Created On   : 11-05-2015
		 * Modified By  : 
		 * This method is used display specific deal details
		 * 	 */
		
		// log.info("InventoryManagerController - dealdetails()");
		List<String> locationsList = null;
		List<Deal> lst_deal = null;
		try {
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			lst_deal = new ArrayList<Deal>();
			modelAndViewObj = new ModelAndView();
			//locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			locationsList = adminServiceObj.getAllLocationsList(customerIdStr,emailIdStr,true);
			lst_deal = dealServiceObj.getDeals(customerIdStr,emailIdStr,dealId,"specific","0","",false,"",null);
			
			List<String> dealLocations=new ArrayList<String>();
			String locationListStr="";
			if(lst_deal.get(0).getDealLocationsList()!=null)
				for(int i=0;i<lst_deal.get(0).getDealLocationsList().size();i++)
				{
					locationListStr=lst_deal.get(0).getDealLocationsList().get(i).getStoreLocation(); 
					dealLocations.add(locationListStr);
					//////////System.out.println(i);
				//	////////System.out.println(empList1);
				}
				
			modelAndViewObj.addObject("dealLocations",dealLocations);
			//////////System.out.println(dealLocations);
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
			modelAndViewObj.addObject("categories", categoryList);
			modelAndViewObj.addObject("locationsList", locationsList);
			if(lst_deal != null && lst_deal.size() > 0){
				List<ProductSubCategoryBean> saleSubCategoryList = outletMasterServiceObj.getSubCategoryDetails(lst_deal.get(0).getSaleProductCategory(), customerIdStr, emailIdStr, "-1","", true);
				List<ProductSubCategoryBean> dealSubCategoryList = outletMasterServiceObj.getSubCategoryDetails(lst_deal.get(0).getDealProductCategory(), customerIdStr, emailIdStr, "-1","", true);
				modelAndViewObj.addObject("saleSubCategoryList", saleSubCategoryList);
				modelAndViewObj.addObject("dealSubCategoryList", dealSubCategoryList);
				modelAndViewObj.addObject("selectedcategorie", lst_deal.get(0).getCategory());
				modelAndViewObj.addObject("dealBean", lst_deal.get(0));
				modelAndViewObj.addObject("sellProducts", lst_deal.get(0).getSell_products());
				
				//added by manasa 
				Deal dealObj=gson.fromJson(formData, Deal.class);
				modelAndViewObj.addObject("dealObj",dealObj);
				
				if(lst_deal.get(0).getDealGroupId() != null && !"".equals(lst_deal.get(0).getDealGroupId())){
					modelAndViewObj.addObject("sellGroupSkus", lst_deal.get(0).getSell_skus());
					modelAndViewObj.addObject("dealGroupSkus", lst_deal.get(0).getDeal_skus());
				}else{
					modelAndViewObj.addObject("sellskus", lst_deal.get(0).getSell_skus());
					modelAndViewObj.addObject("dealskus", lst_deal.get(0).getDeal_skus());
				}
				modelAndViewObj.addObject("dealproducts", lst_deal.get(0).getDeal_products());
				modelAndViewObj.addObject("dealbanner", lst_deal.get(0).getBannerImage());
			}
			List<String> zones = masterServiceObj.getZonesList(customerIdStr, emailIdStr);
			modelAndViewObj.addObject("zones", zones);
			modelAndViewObj.setViewName("Deals and Offers/Deals/dealdetails");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.setViewName("Deals and Offers/Deals/dealdetails");
		}
			return modelAndViewObj;
		}
	
	
	@RequestMapping("/editdeal")
	public @ResponseBody ModelAndView editdeal(@RequestParam("formData") String formData,@RequestParam("dealId")String dealId,HttpServletRequest request,HttpServletResponse response){
		
		/**
		 * Developed By : Sambaiah Y
		 * Created On   : 11-05-2015
		 * Modified By  : 
		 * This method is used display specific deal details
		 * 	 */
		
		// log.info("InventoryManagerController - dealdetails()");
		List<String> locationsList = null;
		List<Deal> lst_deal = null;
		try {
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			lst_deal = new ArrayList<Deal>();
			modelAndViewObj = new ModelAndView();
			// = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
			locationsList = adminServiceObj.getAllLocationsList(customerIdStr,emailIdStr,true);
			lst_deal = dealServiceObj.getDeals(customerIdStr,emailIdStr,dealId,"specific","0","",false,"",null);
			
			List<String> dealLocations=new ArrayList<String>();
			String counterListStr="";
			if(lst_deal.get(0).getDealLocationsList()!=null)
				for(int i=0;i<lst_deal.get(0).getDealLocationsList().size();i++)
				{
					counterListStr=lst_deal.get(0).getDealLocationsList().get(i).getStoreLocation(); 
					dealLocations.add(counterListStr);
					//////////System.out.println(i);
				//	////////System.out.println(empList1);
				}
				
			modelAndViewObj.addObject("dealLocations",dealLocations);
			//////////System.out.println(dealLocations);
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
			List<String> zones = masterServiceObj.getZonesList(customerIdStr, emailIdStr);
			modelAndViewObj.addObject("zones", zones);
			modelAndViewObj.addObject("categories", categoryList);
			modelAndViewObj.addObject("locationsList", locationsList);
			List<Department> departmentList =(List<Department>)request.getSession().getAttribute("departmentList");
			if(departmentList==null || departmentList.size()==0 || departmentList.isEmpty()){
				departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerIdStr, emailIdStr,"-1",false);
				request.getSession().setAttribute("departmentList", departmentList);
			}
			if(lst_deal != null && lst_deal.size() > 0){
				List<ProductSubCategoryBean> saleSubCategoryList = outletMasterServiceObj.getSubCategoryDetails(lst_deal.get(0).getSaleProductCategory(), customerIdStr, emailIdStr, "-1","", true);
				List<ProductSubCategoryBean> dealSubCategoryList = outletMasterServiceObj.getSubCategoryDetails(lst_deal.get(0).getDealProductCategory(), customerIdStr, emailIdStr, "-1","", true);
				modelAndViewObj.addObject("saleSubCategoryList", saleSubCategoryList);
				modelAndViewObj.addObject("dealSubCategoryList", dealSubCategoryList);
				modelAndViewObj.addObject("selectedcategorie", lst_deal.get(0).getCategory());
				modelAndViewObj.addObject("dealBean", lst_deal.get(0));
				modelAndViewObj.addObject("sellProducts", lst_deal.get(0).getSell_products());
				if(lst_deal.get(0).getDealGroupId() != null && !"".equals(lst_deal.get(0).getDealGroupId())){
					modelAndViewObj.addObject("sellGroupSkus", lst_deal.get(0).getSell_skus());
					modelAndViewObj.addObject("dealGroupSkus", lst_deal.get(0).getDeal_skus());
				}else{
					modelAndViewObj.addObject("sellskus", lst_deal.get(0).getSell_skus());
					modelAndViewObj.addObject("dealskus", lst_deal.get(0).getDeal_skus());
				}
				//added by manasa 
				/*Deal dealObj=gson.fromJson(formData, Deal.class);
				modelAndViewObj.addObject("dealObj",dealObj);*/
				//added by manasa 
				Deal dealObj=gson.fromJson(formData, Deal.class);
				modelAndViewObj.addObject("dealObj",dealObj);
				modelAndViewObj.addObject("dealproducts", lst_deal.get(0).getDeal_products());
				modelAndViewObj.addObject("dealbanner", lst_deal.get(0).getBannerImage());
			}
			modelAndViewObj.setViewName("Deals and Offers/Deals/editdeal");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.setViewName("Deals and Offers/Deals/editdeal");
		}
			return modelAndViewObj;
		}
	
	
	@RequestMapping(value = "/createOffer",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createOffer(@RequestBody Offer offer,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null,str_response = null, roleIdStr= null;
		List<OfferRanges> lst_ranges = new ArrayList<OfferRanges>();
		OfferRanges obj_ranges = new OfferRanges();
		String jsonString = null;
		List<Offer> lst_offers = null;
		int start = 1,end = Integer.parseInt("10");
		modelAndViewObj = new ModelAndView();
		try{
			//// log.info("ImventoryManagerController - createOffer()");
			List<String> locationsList = null;
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
		    roleIdStr = (String)request.getSession().getAttribute("role");
 
		    String responseList = Response.getResponseList(offer.getOfferRanges(),"offerSlabs");
		
			JSONArray jsonResponseArray = new JSONArray(responseList);
			for (int i=0; i<jsonResponseArray.length(); i++) {
				obj_ranges = gson.fromJson(jsonResponseArray.getString(i), OfferRanges.class);
				lst_ranges.add(obj_ranges);
			}
			
            if(offer.getOfferCategory().contains("turn") && offer.getRewardType().equalsIgnoreCase("gift_coupon")) {
            	lst_ranges.get(0).setCouponProgramId(offer.getCouponProgramId());
            	lst_ranges.get(0).setRangeRewardType(offer.getRewardType());
            }
			
			
			offer.setOfferRangesList(lst_ranges);
			
			//// log.info("Create Offer Request : : : "+gson.toJson(offer));
			//// log.info("Create Offer Request : : : "+offer.getOfferStatus());
			//////////System.out.println("Create Offer Request string333333333 : : : "+gson.toJson(offer));

			str_response = offerServiceObj.createOffer(customerIdStr,emailIdStr,roleIdStr,offer);
			//// log.info(str_response);
			locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,"");
//			String subCategories = masterServiceObj.getCategories(customerIdStr,emailIdStr);
//			ArrayList<String> categories = masterServiceObj.getCategoriesList(subCategories);
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
			modelAndViewObj.addObject("categories", categoryList);
			List<String> zones = masterServiceObj.getZonesList(customerIdStr, emailIdStr);
			modelAndViewObj.addObject("zones", zones);
		
			/*if(str_response.equals(AppProperties.getAppMessageByProperty("Offer_Created_Successfully").trim()))
				 jsonString= "{\"success\":\""+str_response+"\",\"code\":\""+0+"\"}";
			else
				 jsonString = "{\"error\":\""+str_response+"\",\"code\":\""+1+"\"}";
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
	    	response.getWriter().write(jsonString);*/
			
			if(!str_response.equals(AppProperties.getAppMessageByProperty("Offer_Created_Successfully").trim())){
				modelAndViewObj.addObject("err", str_response);
				modelAndViewObj.addObject("offerBean", offer);
				modelAndViewObj.setViewName("Deals and Offers/Offers/newoffer");
			}else{
				// log.info("successed");
				modelAndViewObj.addObject("success", str_response);
			
			
			modelAndViewObj.addObject("locationsList", locationsList);
			
			/*
			 * lst_offers =
			 * offerServiceObj.getOffers(customerIdStr,emailIdStr,"","all","0","10",false,""
			 * ,null,"","","",""); if(lst_offers == null){
			 * modelAndViewObj.addObject("totalRecords","0");
			 * modelAndViewObj.addObject("index", "0");
			 * modelAndViewObj.addObject("totalValue", "0");
			 * modelAndViewObj.addObject("err","No Offers Found"); }else{
			 * if(lst_offers.size()<Integer.parseInt("10")){ end =
			 * (lst_offers.size())+(Integer.parseInt("0")); }else{ end =
			 * (Integer.parseInt("0")+end); } modelAndViewObj.addObject("totalRecords",
			 * Integer.parseInt(lst_offers.get(0).getTotalRecords()));
			 * modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
			 * modelAndViewObj.addObject("totalValue", end);
			 * modelAndViewObj.addObject("offerDetails",lst_offers); }
			 */
			modelAndViewObj.addObject("locationsList", locationsList);
			
			modelAndViewObj.setViewName("Deals and Offers/Offers/newoffer");
			}
			
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.addObject("error","Something went wrong");
			modelAndViewObj.setViewName("Deals and Offers/Offers/newoffer");
		}
		/*finally {
	    	try {
				response.getWriter().close();
			} catch (IOException e) {
				modelAndViewObj.addObject("error","Something went wrong");
				modelAndViewObj.setViewName("Deals and Offers/Offers/newoffer");
				e.printStackTrace();
			}
	    
	    }*/
	return modelAndViewObj;
}
	
	
	@RequestMapping("/getProductsByCriteria")
	public @ResponseBody List<Sku> getProductsByCriteria(@RequestParam("subcategory") String subcategory,@RequestParam("department") String department,@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,@RequestParam("category") String category,@RequestParam("brand") String brand,HttpServletRequest request,HttpServletResponse response){
			// log.info("getProductsByCriteria");
			List<Sku> skuList = new ArrayList<Sku>();
			try {
				
				modelAndViewObj = new ModelAndView();
				 skuList = skuServiceObj.getSKUDetails(null, "", "",index,"","",category,subcategory,brand,department,"","","","");
				//modelAndViewObj.setViewName("B2C/newArrivals/newArrivals");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return skuList;
	}
	
	
	//written by manasa to get sku details
	@RequestMapping("/getProductsByCriterias")
	public @ResponseBody Set<SkuPriceList> getProductsByCriterias(@RequestParam("subcategory") String subcategory,@RequestParam("department") String department,@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,@RequestParam("category") String category,@RequestParam("brand") String brand,HttpServletRequest request,HttpServletResponse response){
			// log.info("getProductsByCriteria");
			List<Sku> skuList = new ArrayList<Sku>();
			Set<SkuPriceList> skuPriceLists=new HashSet<SkuPriceList>();
			try {
				
				modelAndViewObj = new ModelAndView();
				 skuList = skuServiceObj.getSKUDetails(null, "", "",index,"","",category,subcategory,brand,department,"","","","");
				//modelAndViewObj.setViewName("B2C/newArrivals/newArrivals");
	
				 for(int i=0;i<skuList.size();i++)
					{
						skuPriceLists=skuList.get(i).getSkuPriceLists();
					}
						
			
			}catch(Exception exception){
			exception.printStackTrace();
		}
		return skuPriceLists;
	}
	
	
	@RequestMapping("/offerdetails")
	public @ResponseBody ModelAndView offerdetails(@RequestParam("offerStatusValue")String offerStatusValue,@RequestParam("zone")String zone,@RequestParam("offerType")String offerType,@RequestParam("offerId")String offerId,@RequestParam("formData") String formData,HttpServletRequest request,HttpServletResponse response){
		
		/**
		 * Developed By : Sambaiah Y
		 * Created On   : 11-05-2015
		 * Modified By  : 
		 * This method is used display specific deal details
		 * 	 */
		
		// log.info("InventoryManagerController - offerdetails()");
		List<String> locationsList = null;
		List<Offer> lst_offer = null;
		try {
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			lst_offer = new ArrayList<Offer>();
			modelAndViewObj = new ModelAndView();
			//locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			locationsList = adminServiceObj.getAllLocationsList(customerIdStr,emailIdStr,true);
			lst_offer = offerServiceObj.getOffers(customerIdStr,emailIdStr,offerId,"specific","0","10",false,"",null,"","","",null);
			List<String> offerLocations=new ArrayList<String>();
			String counterListStr="";
			if(lst_offer.get(0).getOfferLocationsList()!=null)
			for(int i=0;i<lst_offer.get(0).getOfferLocationsList().size();i++)
			{
				counterListStr=lst_offer.get(0).getOfferLocationsList().get(i).getStoreLocation(); 
				offerLocations.add(counterListStr);
				//////////System.out.println(i);
			//	////////System.out.println(empList1);
			}
			
			modelAndViewObj.addObject("offerLocations",offerLocations);
			
			List<Suppliers> supplierList =(List<Suppliers>)request.getSession().getAttribute("supplierList");
			if(supplierList==null || supplierList.size()==0 || supplierList.isEmpty()){
				 supplierList = outletMasterServiceObj.getSuppliers(customerIdStr, emailIdStr,"-1","","");
				request.getSession().setAttribute("supplierList", supplierList);
			}
			
		//	////////System.out.println("locde"+offerLocations);
			modelAndViewObj.addObject("locations"+lst_offer.get(0).getOfferLocationsList());
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
			modelAndViewObj.addObject("categories", categoryList);
			modelAndViewObj.addObject("locationsList", locationsList);
			List<String> brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
			modelAndViewObj.addObject("brandsList", brandsList);
			List<Department> departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerIdStr, emailIdStr,"-1",false);
			modelAndViewObj.addObject("departmentList", departmentList);
			List<String> zones = masterServiceObj.getZonesList(customerIdStr, emailIdStr);
			modelAndViewObj.addObject("zones", zones);
			if(lst_offer != null && lst_offer.size() > 0){
				List<ProductSubCategoryBean> saleSubCategoryList = outletMasterServiceObj.getSubCategoryDetails(lst_offer.get(0).getProductCategory(), customerIdStr, emailIdStr, "-1","", true);
				modelAndViewObj.addObject("saleSubCategoryList", saleSubCategoryList);
				modelAndViewObj.addObject("selectedcategorie", lst_offer.get(0).getProductCategory());
				modelAndViewObj.addObject("offerBean", lst_offer.get(0));
				if(lst_offer.get(0).getSellGroupId() != null && !"".equals(lst_offer.get(0).getSellGroupId())){
					modelAndViewObj.addObject("sellGroupSkus", lst_offer.get(0).getSell_skus());
				}else{
					modelAndViewObj.addObject("sellskus", lst_offer.get(0).getSell_skus());
				}
				modelAndViewObj.addObject("sellProducts", lst_offer.get(0).getSell_products());
				modelAndViewObj.addObject("banner", lst_offer.get(0).getBannerImage());
			}
			//added by manasa 
			Offer offerObj=gson.fromJson(formData, Offer.class);
			modelAndViewObj.addObject("offerObj",offerObj);
			modelAndViewObj.addObject("offerStatusValue",offerStatusValue);
			modelAndViewObj.addObject("zone",zone);
			modelAndViewObj.addObject("offerType",offerType);
			
			
			List<CustomerGroupMaster> groupsList = customerServiceObj.getCustomerGroupDetails("",customerIdStr, emailIdStr,"-1","10",true, true,"","","","");
			List<String> groupid = new ArrayList<String>();
			if(groupsList != null) {
			for(int i=0;i<groupsList.size();i++)
				{
				 groupid.add(groupsList.get(i).getGroup_id());
			
				}
			 modelAndViewObj.addObject("groupids", groupid);
			}
			modelAndViewObj.setViewName("Deals and Offers/Offers/offerdetails");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.setViewName("Deals and Offers/Offers/offerdetails");
		}
			return modelAndViewObj;
		}
	@RequestMapping("/editoffer")
	public @ResponseBody ModelAndView editoffer(@RequestParam("offerStatusValue")String offerStatusValue,@RequestParam("zone")String zone,@RequestParam("offerType")String offerType,@RequestParam("offerId")String offerId,@RequestParam("formData") String formData,@RequestParam("expandValue")String expandValue,@RequestParam("expandVisibilityValue")String expandVisibilityValue,@RequestParam("expandAuthValue")String expandAuthValue,HttpServletRequest request,HttpServletResponse response){
		
		/**
		 * Developed By : Sambaiah Y
		 * Created On   : 09-05-2015
		 * Modified By  : 
		 * This method is used displayexisting order details
		 * 	 */
		
		// log.info("InventoryManagerController - editoffer()");
		List<String> locationsList = null;
		List<Offer> lst_offer = null;
		try {
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			lst_offer = new ArrayList<Offer>();
			modelAndViewObj = new ModelAndView();
			//locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,true);
			locationsList = adminServiceObj.getAllLocationsList(customerIdStr,emailIdStr,true);
			lst_offer = offerServiceObj.getOffers(customerIdStr,emailIdStr,offerId,"specific","0","10",false,"",null,"","","",null);
			
			
			List<String> offerLocations=new ArrayList<String>();
			String counterListStr="";
			if(lst_offer.get(0).getOfferLocationsList()!=null)
			for(int i=0;i<lst_offer.get(0).getOfferLocationsList().size();i++)
			{
				counterListStr=lst_offer.get(0).getOfferLocationsList().get(i).getStoreLocation(); 
				offerLocations.add(counterListStr);
				//////////System.out.println(i);
			//	////////System.out.println(empList1);
			}
			modelAndViewObj.addObject("offerLocations",offerLocations);
			List<Suppliers> supplierList =(List<Suppliers>)request.getSession().getAttribute("supplierList");
			if(supplierList==null || supplierList.size()==0 || supplierList.isEmpty()){
				 supplierList = outletMasterServiceObj.getSuppliers(customerIdStr, emailIdStr,"-1","","");
				request.getSession().setAttribute("supplierList", supplierList);
			}
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
			modelAndViewObj.addObject("categories", categoryList);
			modelAndViewObj.addObject("locationsList", locationsList);
			List<String> brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
			modelAndViewObj.addObject("brandsList", brandsList);
			List<String> zones = masterServiceObj.getZonesList(customerIdStr, emailIdStr);
			modelAndViewObj.addObject("zones", zones);
			List<Department> departmentList =(List<Department>)request.getSession().getAttribute("departmentList");
			if(departmentList==null || departmentList.size()==0 || departmentList.isEmpty()){
				departmentList = departmentServiceObj.getDepartmentDetails(null,null, customerIdStr, emailIdStr,"-1",false);
				request.getSession().setAttribute("departmentList", departmentList);
			}
			if(lst_offer != null && lst_offer.size() > 0){
				List<ProductSubCategoryBean> saleSubCategoryList = outletMasterServiceObj.getSubCategoryDetails(lst_offer.get(0).getProductCategory(), customerIdStr, emailIdStr, "-1","",true);
				modelAndViewObj.addObject("saleSubCategoryList", saleSubCategoryList);
				modelAndViewObj.addObject("selectedcategorie", lst_offer.get(0).getProductCategory());
				modelAndViewObj.addObject("offerBean", lst_offer.get(0));
				modelAndViewObj.addObject("sellProducts", lst_offer.get(0).getSell_products());
				if(lst_offer.get(0).getSellGroupId() != null && !"".equals(lst_offer.get(0).getSellGroupId())){
					modelAndViewObj.addObject("sellGroupSkus", lst_offer.get(0).getSell_skus());
				}else{
					modelAndViewObj.addObject("sellskus", lst_offer.get(0).getSell_skus());
				}
				modelAndViewObj.addObject("banner", lst_offer.get(0).getBannerImage());
			}
			modelAndViewObj.addObject("expandValue", expandValue);
			modelAndViewObj.addObject("expandVisibilityValue", expandVisibilityValue);
			modelAndViewObj.addObject("expandAuthValue", expandAuthValue);
			//added by manasa 
			Offer offerObj=gson.fromJson(formData, Offer.class);
			modelAndViewObj.addObject("offerObj",offerObj);
			modelAndViewObj.addObject("offerStatusValue",offerStatusValue);
			modelAndViewObj.addObject("zone",zone);
			modelAndViewObj.addObject("offerType",offerType);
			
			List<CustomerGroupMaster> groupsList = customerServiceObj.getCustomerGroupDetails("",customerIdStr, emailIdStr,"-1","10",true, true,"","","","");
			List<String> groupid = new ArrayList<String>();
			if(groupsList != null) {
			for(int i=0;i<groupsList.size();i++)
				{
				 groupid.add(groupsList.get(i).getGroup_id());
			
				}
			 modelAndViewObj.addObject("groupids", groupid);
			}
			modelAndViewObj.setViewName("Deals and Offers/Offers/editoffer");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.setViewName("Deals and Offers/Offers/editoffer");
		}
		return modelAndViewObj;
	}
	
	
	 /* @RequestMapping("/deleteOfferProduct")
    	public ModelAndView deleteOfferProduct(@RequestParam("ids") String ids,@RequestParam("searchName") String searchName, @RequestParam("maxRecords")String maxRecords, HttpServletRequest request,HttpServletResponse response){
    		try{
    			// log.info("deleteBrand ");
    			int start = 1,end = Integer.parseInt(maxRecords);
    			modelAndViewObj = new ModelAndView();
    			String customerIdStr = (String)request.getSession().getAttribute("customerId");
    			String emailIdStr = (String)request.getSession().getAttribute("emailId");
    			String resultStr = offerServiceObj.deleteOfferProduct(customerIdStr,emailIdStr,ids);
    			
    			if(resultStr.contains("successfully"))
    				modelAndViewObj.addObject("success", resultStr);
    				else
    				modelAndViewObj.addObject("err", resultStr);
    			
    			///List<LoyaltyCardMaster> list_loyaltyCardMaster = loyaltyCardServiceObj.getLoyaltyCards("",customerIdStr, emailIdStr,"0",maxRecords);
    			List<LoyaltyCardMaster> list_loyaltyCardMaster = loyaltyCardServiceObj.getLoyaltyCardsSummary("",customerIdStr, emailIdStr,"0",maxRecords);

    			modelAndViewObj = new ModelAndView();
    			
    			if(list_loyaltyCardMaster == null || list_loyaltyCardMaster.size() == 0){
    				modelAndViewObj.addObject("totalRecords","0");
    				modelAndViewObj.addObject("index", "0");
    				modelAndViewObj.addObject("totalValue", "0");
    			}
    			else
    			{
    			if(list_loyaltyCardMaster.size()<Integer.parseInt(maxRecords))
    			{
    				end = (list_loyaltyCardMaster.size())+(Integer.parseInt("0"));
    			}
    			else
    			{
    				end = (Integer.parseInt("0")+end);
    			}
    				modelAndViewObj.addObject("totalRecords", list_loyaltyCardMaster.get(0).getTotalRecords());
    				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
    				modelAndViewObj.addObject("totalValue", end);

    			modelAndViewObj.addObject("loyaltyCardsList", list_loyaltyCardMaster);
    			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
    		}
    			
    			modelAndViewObj.addObject("list_loyaltyCardMaster", list_loyaltyCardMaster);
    			modelAndViewObj.addObject("err", resultStr);
    			modelAndViewObj.addObject("maxRecords", maxRecords);
    			modelAndViewObj.addObject("searchName",searchName);
    			
    			modelAndViewObj.setViewName("CRM/LoyaltyPrograms/LoyaltyCards/loyaltyCards");
    		}
    		catch(Exception exception){
    			exception.printStackTrace();
    		}
    		return modelAndViewObj;
    	}
    	*/
	
	
	
	
	
	
	@RequestMapping("/updateOffer")
	public @ResponseBody ModelAndView updateOffer(@RequestBody Offer offer,HttpServletRequest request,HttpServletResponse response){
		
		/**
		 * Developed By : Sambaiah Y
		 * Created On   : 09-05-2015
		 * Modified By  : 
		 * This method is used display existing order details
		 * 	 */
		
		// log.info("InventoryManagerController - updateOffer()");
		List<String> locationsList = null;
		List<Offer> lst_offer = null;
		String str_response = null;
		OfferRanges obj_ranges = new OfferRanges();
		List<OfferRanges> lst_ranges = new ArrayList<OfferRanges>();
		try {
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
		    String  roleIdStr = (String)request.getSession().getAttribute("role");
			lst_offer = new ArrayList<Offer>();
			
			String responseList = Response.getResponseList(offer.getOfferRanges(),"editofferSlabs");
			
			////////System.out.println("thsi is checking response ary"+gson.toJson(responseList));
			modelAndViewObj = new ModelAndView();
			// Commented by vijay as ranges are directly binding in the script 
			JSONArray jsonResponseArray = new JSONArray(responseList);
			for (int i=0; i<jsonResponseArray.length(); i++) {
				obj_ranges = gson.fromJson(jsonResponseArray.getString(i), OfferRanges.class);
				lst_ranges.add(obj_ranges);
			}
			
			  if(offer.getOfferCategory().contains("turn") && offer.getRewardType().equalsIgnoreCase("gift_coupon")) {
	            	lst_ranges.get(0).setCouponProgramId(offer.getCouponProgramId());
	            	lst_ranges.get(0).setRangeRewardType(offer.getRewardType());
	            }
			  
			offer.setOfferRangesList(lst_ranges);
			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
			str_response = offerServiceObj.updateOffer(customerIdStr,emailIdStr,roleIdStr,offer);
			lst_offer = offerServiceObj.getOffers(customerIdStr,emailIdStr,offer.getOfferID(),"specific","0","10",false,"",null,"","","",null);

			List<String> offerLocations=new ArrayList<String>();
			String counterListStr="";
			if(lst_offer.get(0).getOfferLocationsList()!=null)
			for(int i=0;i<lst_offer.get(0).getOfferLocationsList().size();i++)
			{
				counterListStr=lst_offer.get(0).getOfferLocationsList().get(i).getStoreLocation(); 
				offerLocations.add(counterListStr);
			}
			modelAndViewObj.addObject("offerLocations",offerLocations);
			//			String subCategories = masterServiceObj.getCategories(customerIdStr,emailIdStr);
			
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
			modelAndViewObj.addObject("categories", categoryList);
			/*List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
			modelAndViewObj.addObject("categories", categoryList);*/
			modelAndViewObj.addObject("selectedcategorie", lst_offer.get(0).getProductCategory());
			
			List<Suppliers> supplierList =(List<Suppliers>)request.getSession().getAttribute("supplierList");
			if(supplierList==null || supplierList.size()==0 || supplierList.isEmpty()){
				 supplierList = outletMasterServiceObj.getSuppliers(customerIdStr, emailIdStr,"-1","","");
				request.getSession().setAttribute("supplierList", supplierList);
			}
			/*if(subCategories.equals("{}"))
				modelAndViewObj.addObject("err", "Please Create Category and Sub Category prior to create product");
			modelAndViewObj.addObject("subCategories", subCategories);*/
			modelAndViewObj.addObject("offerBean", lst_offer.get(0));
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("sellProducts", lst_offer.get(0).getSell_products());
			if(lst_offer.get(0).getSellGroupId() != null && !"".equals(lst_offer.get(0).getSellGroupId())){
				modelAndViewObj.addObject("sellGroupSkus", lst_offer.get(0).getSell_skus());
			}else{
				modelAndViewObj.addObject("sellskus", lst_offer.get(0).getSell_skus());
			}
			modelAndViewObj.addObject("banner", lst_offer.get(0).getBannerImage());
			//modelAndViewObj.addObject("err", str_response);
			if(!str_response.equals(AppProperties.getAppMessageByProperty("Offer_Update_Successfully")))
               modelAndViewObj.addObject("err", str_response);
             else
	           modelAndViewObj.addObject("success", str_response);
			
			List<String> zones = masterServiceObj.getZonesList(customerIdStr, emailIdStr);
			modelAndViewObj.addObject("zones", zones);
			modelAndViewObj.addObject("offerObj", offer);
			modelAndViewObj.setViewName("Deals and Offers/Offers/editoffer");
		}catch(Exception e){
			e.printStackTrace();
			modelAndViewObj.setViewName("Deals and Offers/Offers/editoffer");
		}
		return modelAndViewObj;
	}

	

@RequestMapping("/promotionPrint")
	public @ResponseBody OffersBean promotionPrint(@RequestParam("offerStatusValue")String offerStatusValue,@RequestParam("zone")String zone,@RequestParam("offerType")String offerType,@RequestParam("offerId")String offerId,@RequestParam("formData") String formData,HttpServletRequest request,HttpServletResponse response){
	
	OffersBean offersBeanObj =null;
		try {
			
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			offersBeanObj = offerServiceObj.getPromotionPrint(customerIdStr,emailIdStr,offerId,"specific","0","10",false,"",null,"","","",null);
		
		}catch(Exception e){
			e.printStackTrace();
		}
			return offersBeanObj;
		}



@RequestMapping(value="/importExcelDataForDeals",method=RequestMethod.POST)
public @ResponseBody List<SkuPriceList> importExcelDataForDeals(@RequestParam("file") MultipartFile excelFile,HttpServletRequest request,HttpServletResponse response) {
	List <SkuPriceList> skuList =null;
	try{
		 skuList = Utilities.getExcelDataForDeals(excelFile);
		 //System.out.println("ExcelReader Deals Skulist::::"+gson.toJson(skuList));
	
	}catch(Exception e){
		e.printStackTrace();
	}
	return skuList;
}

@RequestMapping(value="/importSkuDetailsForDeals",method = RequestMethod.POST)
public @ResponseBody List<ProductsList> importSkuDetailsForDeals(@RequestParam("SkuIds") String SkuIds,@RequestParam("storeLocation")String storeLocation,HttpServletRequest request,HttpServletResponse response) {
	String customerIdStr = null,emailIdStr=null;
	List<ProductsList> productsList = new ArrayList<ProductsList>();
	try{
		//// log.info("searchProducts");
		customerIdStr = (String)request.getSession().getAttribute("customerId");
		emailIdStr = (String)request.getSession().getAttribute("emailId");
		productsList = skuServiceObj.importSkuProductsForDealsExcel(customerIdStr,emailIdStr,SkuIds,storeLocation);
	
	}catch(Exception e){
		e.printStackTrace();
	}
	return productsList;
}


@RequestMapping(value="/importExcelDataForOffers",method=RequestMethod.POST)
public @ResponseBody List<SkuPriceList>  importExcelData(@RequestParam("file") MultipartFile excelFile,HttpServletRequest request,HttpServletResponse response) {
	List <SkuPriceList> skuList =null;
	try{
		 skuList = Utilities.getExcelDataForOffers(excelFile);
		 ////////System.out.println("ExcelReader Sku list::::"+gson.toJson(skuList));
	
	}catch(Exception e){
		e.printStackTrace();
	}
	return skuList;
}
@RequestMapping(value="/importSkuDetailsForOffers",method = RequestMethod.POST)
public @ResponseBody List<ProductsList> importSkuDetailsForOffers(@RequestParam("SkuIds") String SkuIds,@RequestParam("storeLocation")String storeLocation,HttpServletRequest request,HttpServletResponse response) {
	String customerIdStr = null,emailIdStr=null;
	List<ProductsList> productsList = new ArrayList<ProductsList>();
	try{
		//// log.info("searchProducts");
		customerIdStr = (String)request.getSession().getAttribute("customerId");
		emailIdStr = (String)request.getSession().getAttribute("emailId");
		productsList = skuServiceObj.importSkuProductsForOffersExcel(customerIdStr,emailIdStr,SkuIds,storeLocation);
		//System.out.println("Products ::"+gson.toJson(productsList));
		
	}catch(Exception e){
		e.printStackTrace();
	}
	return productsList;
}

@RequestMapping("/descriptionPrint")
public @ResponseBody OffersBean descriptionPrint(@RequestParam("offerStatusValue")String offerStatusValue,@RequestParam("zone")String zone,@RequestParam("offerType")String offerType,@RequestParam("offerId")String offerId,@RequestParam("formData") String formData,HttpServletRequest request,HttpServletResponse response){

OffersBean offersBeanObj =null;
	try {
		
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		offersBeanObj = offerServiceObj.getDescriptionPrint(customerIdStr,emailIdStr,offerId);
	
	}catch(Exception e){
		e.printStackTrace();
	}
		return offersBeanObj;
	}


	
}
