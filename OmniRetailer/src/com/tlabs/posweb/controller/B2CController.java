package com.tlabs.posweb.controller;

import java.io.IOException;
import java.rmi.RemoteException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.technolabssoftware.www.Attachment;
import com.technolabssoftware.www.OfferProxy;
import com.tlabs.posweb.beans.Banner;
import com.tlabs.posweb.beans.BrandMaster;
import com.tlabs.posweb.beans.BusinessEvent;
import com.tlabs.posweb.beans.CustomerShoppingList;
import com.tlabs.posweb.beans.Deal;
import com.tlabs.posweb.beans.FeaturedProducts;
import com.tlabs.posweb.beans.FeaturedProductsResponse;
import com.tlabs.posweb.beans.FeaturedRetailer;
import com.tlabs.posweb.beans.Group;
import com.tlabs.posweb.beans.HomePageGroup;
import com.tlabs.posweb.beans.HotDeals;
import com.tlabs.posweb.beans.HotDealsList;
import com.tlabs.posweb.beans.NewArrivalProducts;
import com.tlabs.posweb.beans.NewArrivalResponse;
import com.tlabs.posweb.beans.Offer;
import com.tlabs.posweb.beans.OnlinePaymentResponse;
import com.tlabs.posweb.beans.OnlinePayments;
import com.tlabs.posweb.beans.ProductCategoryBean;
import com.tlabs.posweb.beans.ProductsList;
import com.tlabs.posweb.beans.ShoppingItemsListResponse;
import com.tlabs.posweb.beans.SkuId;
import com.tlabs.posweb.init.AppProperties;
import com.tlabs.posweb.services.AdminService;
import com.tlabs.posweb.services.BannerService;
import com.tlabs.posweb.services.DealService;
import com.tlabs.posweb.services.DepartmentService;
import com.tlabs.posweb.services.EventService;
import com.tlabs.posweb.services.FeaturedProductService;
import com.tlabs.posweb.services.GenericMasterService;
import com.tlabs.posweb.services.MasterService;
import com.tlabs.posweb.services.NewArrivalsService;
import com.tlabs.posweb.services.OfferService;
import com.tlabs.posweb.services.OutletMasterService;
import com.tlabs.posweb.services.PaymentGateWayService;
import com.tlabs.posweb.services.ShoppingListService;
import com.tlabs.posweb.services.SkuService;
import com.tlabs.posweb.util.Constants;
//import com.tlabs.posweb.util.Utilities;

@Controller
@RequestMapping(value = "/b2c")
public class B2CController {
	
	private ModelAndView modelAndViewObj;
	//private static Logger log = Logger.getLogger(B2CController.class);
	@Autowired
	private AdminService adminServiceObj;
	@Autowired
	private BannerService bannerServiceObj;
	@Autowired
	private EventService eventServiceObj;
	@Autowired
    private DepartmentService departmentServiceObj;
	@Autowired
    private DealService dealServiceObj;
	@Autowired
    private OfferService offerServiceObj;
	@Autowired
	private FeaturedProductService featuredServiceObj;
	@Autowired
	private GenericMasterService genericMasterServiceObj;
	@Autowired
	private OutletMasterService outletMasterServiceObj;
	@Autowired
	private SkuService skuServiceObj;
	@Autowired
	private NewArrivalsService newArrivalsServiceObj;
	@Autowired
	private PaymentGateWayService paymentGateWayServiceObj;
	@Autowired
	private ShoppingListService shoppingListServiceObj;
	@Autowired
	private MasterService masterServiceObj;
	@Autowired
    private Gson gson;
	/**
	 * @author Mythri.S
	 * @param request
	 * @param response
	 * @return returns a jsp which displays all the icons of outlet management flow
	 */
	@RequestMapping("/showB2cFlows")
	public ModelAndView showB2cFlows(HttpServletRequest request,HttpServletResponse response){
	//	log.info("showB2cFlows");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("B2C/b2cFlows");
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display all Tax details in a tabular format
	 *
	 **/
	@RequestMapping("/viewHomePageBanners")
	public ModelAndView viewHomePageBanners(@RequestParam("index")String index,@RequestParam("type")String type,HttpServletRequest request,HttpServletResponse response){
		try{
		//	log.info("viewHomePageBanners");
			int start = 1,end = 10;
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<Banner> bannerList = bannerServiceObj.getBanner(null, customerIdStr, emailIdStr, index, false,false,type);
			modelAndViewObj = new ModelAndView();
			if(bannerList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(bannerList.size()<10){
					end = (bannerList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", bannerList.get(0).getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("bannerList", bannerList);
			if(type.equals("banner"))
				modelAndViewObj.setViewName("B2C/homePageBanner/homePageBanner");
			else
				modelAndViewObj.setViewName("B2C/miniBanner/miniBanner");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	@RequestMapping("/searchHomePageBanners")
	public ModelAndView searchHomePageBanners(@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,@RequestParam("type") String type, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		try{
			//log.info("searchHomePageBanners");
			int start = 1,end = 10;
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<Banner> bannerList = bannerServiceObj.getBanner(searchNameStr, customerIdStr, emailIdStr, index, true,false,type);
			modelAndViewObj = new ModelAndView();
			if(bannerList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(bannerList.size()<10){
					end = (bannerList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", bannerList.get(0).getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("bannerList", bannerList);
			if(type.equals("banner"))
				modelAndViewObj.setViewName("B2C/homePageBanner/homePageBanner");
			else
				modelAndViewObj.setViewName("B2C/miniBanner/miniBanner");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	@RequestMapping("/newHomePageBanner")
	public ModelAndView newHomePageBanner(@RequestParam("type") String type,HttpServletRequest request,HttpServletResponse response){
		try{
			//log.info("newHomePageBanner");
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
			List<String> brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
			List<String> departmentList = departmentServiceObj.getDepartmentsList(null,customerIdStr, emailIdStr);
			List<Deal> dealsList = dealServiceObj.getDeals(customerIdStr,emailIdStr,"","all","-1","",false,"","active");
			List<Offer> offersList = offerServiceObj.getOffers(customerIdStr,emailIdStr,"","all","-1","",false,"","active","","","","");
			List<Group> groupsList= outletMasterServiceObj.getProductGroupDetails("", customerIdStr, emailIdStr, "0","10",false);
						
			modelAndViewObj.addObject("categoryList", categoryList);
			modelAndViewObj.addObject("brandsList", brandsList);
			modelAndViewObj.addObject("departmentList", departmentList);
			modelAndViewObj.addObject("dealsList", dealsList);
			modelAndViewObj.addObject("offersList", offersList);
			modelAndViewObj.addObject("groupsList", groupsList);
			
			if(type.equals("banner"))
				modelAndViewObj.setViewName("B2C/homePageBanner/newHomePageBanner");
			else
				modelAndViewObj.setViewName("B2C/miniBanner/newMiniBanner");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	@RequestMapping(value = "/createBanner",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createBanner(@RequestBody Banner banner,HttpServletRequest request,HttpServletResponse response) {
		try{
			//log.info("createBanner");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = bannerServiceObj.createBanner(banner, customerIdStr, emailIdStr);
			modelAndViewObj = new ModelAndView();
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("BANNER_CREATE_SUCCESS").trim()) && !resultStr.equals(AppProperties.getAppMessageByProperty("MINI_BANNER_CREATE_SUCCESS").trim())){
				String effectiveFromStr = banner.getEffectiveFromStr();
				int indexOf;
				if(effectiveFromStr != null){
					indexOf = effectiveFromStr.indexOf(" ");
					effectiveFromStr = effectiveFromStr.substring(0, indexOf);;
					banner.setEffectiveFromStr(effectiveFromStr);
				}
				String endDateStr = banner.getEndDateStr();
				if(endDateStr != null){
					indexOf = endDateStr.indexOf(" ");
					endDateStr = endDateStr.substring(0, indexOf);;
					banner.setEndDateStr(endDateStr);
				}
				modelAndViewObj.addObject("banner", banner);
				modelAndViewObj.addObject("err", resultStr);
				modelAndViewObj.addObject("type", "new");
				if(banner.getType().equals("banner"))
					modelAndViewObj.setViewName("B2C/homePageBanner/editHomePageBanner");
				else
					modelAndViewObj.setViewName("B2C/miniBanner/editMiniBanner");
			}else{
				modelAndViewObj.addObject("success", resultStr);
				if(banner.getType().equals("banner"))
					modelAndViewObj.setViewName("B2C/homePageBanner/newHomePageBanner");
				else
					modelAndViewObj.setViewName("B2C/miniBanner/newMiniBanner");
			}
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
			List<String> brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
			List<String> departmentList = departmentServiceObj.getDepartmentsList(null,customerIdStr, emailIdStr);
			List<Deal> dealsList = dealServiceObj.getDeals(customerIdStr,emailIdStr,"","all","-1","",false,"","active");
			List<Offer> offersList = offerServiceObj.getOffers(customerIdStr,emailIdStr,"","all","-1","",false,"","active","","","","");
			List<Group> groupsList= outletMasterServiceObj.getProductGroupDetails("", customerIdStr, emailIdStr, "0","10", false);
					
			
			modelAndViewObj.addObject("categoryList", categoryList);
			modelAndViewObj.addObject("brandsList", brandsList);
			modelAndViewObj.addObject("departmentList", departmentList);
			modelAndViewObj.addObject("dealsList", dealsList);
			modelAndViewObj.addObject("offersList", offersList);
			modelAndViewObj.addObject("groupsList", groupsList);
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	@RequestMapping("/editBanner")
	public ModelAndView editBanner(@RequestParam("bannerId")String bannerId,@RequestParam("type")String type,@RequestParam("operation")String operation,HttpServletRequest request,HttpServletResponse response){
		try{
			//log.info("editBanner");
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
			List<String> brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
			List<String> departmentList = departmentServiceObj.getDepartmentsList(null,customerIdStr, emailIdStr);
			List<Deal> dealsList = dealServiceObj.getDeals(customerIdStr,emailIdStr,"","all","-1","",false,"",null);
			List<Offer> offersList = offerServiceObj.getOffers(customerIdStr,emailIdStr,"","all","-1","",false,"",null,"","","","");
			List<Banner> bannerList = bannerServiceObj.getBanner(bannerId, customerIdStr, emailIdStr, "0", false,true,type);
			List<Group> groupsList= outletMasterServiceObj.getProductGroupDetails("", customerIdStr, emailIdStr, "0","10",false);
			
			if(bannerList != null && bannerList.size() > 0)
				modelAndViewObj.addObject("banner", bannerList.get(0));
			modelAndViewObj.addObject("type", "edit");
			modelAndViewObj.addObject("categoryList", categoryList);
			modelAndViewObj.addObject("brandsList", brandsList);
			modelAndViewObj.addObject("departmentList", departmentList);
			modelAndViewObj.addObject("dealsList", dealsList);
			modelAndViewObj.addObject("offersList", offersList);
			modelAndViewObj.addObject("groupsList", groupsList);
			if(operation.equals("edit")){
				if(type.equals("banner"))
					modelAndViewObj.setViewName("B2C/homePageBanner/editHomePageBanner");
				else
					modelAndViewObj.setViewName("B2C/miniBanner/editMiniBanner");
			}
			else{
				if(type.equals("banner"))
					modelAndViewObj.setViewName("B2C/homePageBanner/viewHomePageBanner");
				else
					modelAndViewObj.setViewName("B2C/miniBanner/viewMiniBanner");
			}
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	@RequestMapping(value = "/updateBanner",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView updateBanner(@RequestBody Banner banner,HttpServletRequest request,HttpServletResponse response) {
		try{
			//log.info("updateBanner");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = bannerServiceObj.updateBanner(banner, customerIdStr, emailIdStr);
			modelAndViewObj = new ModelAndView();
			List<Banner> bannerList = bannerServiceObj.getBanner(banner.getBannerId(), customerIdStr, emailIdStr, "0", false,true,banner.getType());
			if(bannerList != null && bannerList.size() > 0)
				modelAndViewObj.addObject("banner", bannerList.get(0));
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("BANNER_UPDATE_SUCCESS").trim()) && !resultStr.equals(AppProperties.getAppMessageByProperty("MINI_BANNER_UPDATE_SUCCESS").trim())){
				modelAndViewObj.addObject("err", resultStr);
			}else{
				modelAndViewObj.addObject("success", resultStr);
			}
			modelAndViewObj.addObject("type", "edit");
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
			List<String> brandsList = adminServiceObj.getBrandNamesList(customerIdStr,emailIdStr);
			List<String> departmentList = departmentServiceObj.getDepartmentsList(null,customerIdStr, emailIdStr);
			List<Deal> dealsList = dealServiceObj.getDeals(customerIdStr,emailIdStr,"","all","-1","",false,"",null);
			List<Offer> offersList = offerServiceObj.getOffers(customerIdStr,emailIdStr,"","all","-1","",false,"",null,"","","","");
			List<Group> groupsList= outletMasterServiceObj.getProductGroupDetails("", customerIdStr, emailIdStr, "0","10",false);
			
			modelAndViewObj.addObject("categoryList", categoryList);
			modelAndViewObj.addObject("brandsList", brandsList);
			modelAndViewObj.addObject("departmentList", departmentList);
			modelAndViewObj.addObject("dealsList", dealsList);
			modelAndViewObj.addObject("offersList", offersList);
			modelAndViewObj.addObject("groupsList", groupsList);
			if(banner.getType().equals("banner"))
				modelAndViewObj.setViewName("B2C/homePageBanner/editHomePageBanner");
			else
				modelAndViewObj.setViewName("B2C/miniBanner/editMiniBanner");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	@RequestMapping("/deleteBanner")
	public ModelAndView deleteBanner(@RequestParam("ids") String ids,@RequestParam("type") String type,HttpServletRequest request,HttpServletResponse response){
		try{
			//log.info("deleteBanner ");
			int start = 1,end = 10;
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = bannerServiceObj.deleteBanner(customerIdStr,emailIdStr,ids,type);
			List<Banner> bannerList = bannerServiceObj.getBanner(null, customerIdStr, emailIdStr, "0", false,false,type);
			modelAndViewObj = new ModelAndView();
			if(bannerList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(bannerList.size()<10)
					end = bannerList.size();
				modelAndViewObj.addObject("totalRecords", bannerList.get(0).getTotalRecords());
				modelAndViewObj.addObject("index",start);
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("bannerList", bannerList);
			modelAndViewObj.addObject("err", resultStr);
			if(type.equals("banner"))
				modelAndViewObj.setViewName("B2C/homePageBanner/homePageBanner");
			else
				modelAndViewObj.setViewName("B2C/miniBanner/miniBanner");
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
	 *This method is used to search offers based on product category
	 *
	 **/

	@RequestMapping("/searchOffersBasedOnCategory")
	public @ResponseBody List<Offer> searchOffersBasedOnCategory(@RequestParam("ref") String ref,@RequestParam("offerId") String offerId,@RequestParam("groupid") String groupId,@RequestParam("categoryName") String categoryNameStr,@RequestParam("ref") String refStr,HttpServletRequest request,HttpServletResponse response) {
		List<Offer> lst_offers = new ArrayList<Offer>();
		try{
			//log.info("searchOffersBasedOnCategory");
			if(ref.equals("add")){
				lst_offers = offerServiceObj.getOffers("","","",offerId,"0","",true,ref,"","","","","");
			}
			else{
				lst_offers = offerServiceObj.getOffersbycategory(categoryNameStr,groupId,"0");
			}
			
			////System.out.println("output"+gson.toJson(lst_offers));
			//log.info("Result:::"+lst_offers);
			if(lst_offers != null && lst_offers.size()>0){
			for(int i=0;i<lst_offers.size();i++){
			String s=lst_offers.get(i).getOfferStartDate().substring(0, 10);
			String s1=lst_offers.get(i).getOfferEndDate().substring(0, 10);
			
			    String dateString1 = s;
			    Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dateString1);
			    String dateString2 = new SimpleDateFormat("dd-MM-yyyy").format(date);
			    String dateString3 = s1;
			    Date date3 = new SimpleDateFormat("yyyy-MM-dd").parse(dateString3);
			    String dateString4 = new SimpleDateFormat("dd-MM-yyyy").format(date3);
			    lst_offers.get(i).setOfferStartDate(dateString2.replaceAll("-", "/"));
			    lst_offers.get(i).setOfferEndDate(dateString4.replaceAll("-", "/"));
			    if(lst_offers.get(i).getOfferStatus().equalsIgnoreCase("ACTIVE"))
			    	lst_offers.get(i).setOfferStatus("1");
			    else
			    	lst_offers.get(i).setOfferStatus("0");
			}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return lst_offers;
	}
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to search deals based on product category
	 *
	 **/

	@RequestMapping("/searchDealsBasedOnCategory")
	public @ResponseBody List<Deal> searchDealsBasedOnCategory(@RequestParam("groupid") String groupid,@RequestParam("categoryName") String categoryNameStr,@RequestParam("ref") String refStr,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<Deal> lst_deals = new ArrayList<Deal>();
		try{
			//log.info("searchDealsBasedOnCategory");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			if(refStr.equalsIgnoreCase("add"))
				lst_deals = dealServiceObj.getDeals(customerIdStr,emailIdStr,"",categoryNameStr,"0","",true,refStr,null);
			else
				lst_deals = dealServiceObj.searchDeals(customerIdStr,emailIdStr,"",categoryNameStr,"0","","","",true,groupid,"","","","false");
			
			////System.out.println("output of deals"+gson.toJson(lst_deals));
			//log.info("Result:::"+lst_deals);
			if(lst_deals != null && lst_deals.size()>0){
				for(int i=0;i<lst_deals.size();i++){
				String s=lst_deals.get(i).getDealStartDate().substring(0, 10);
				String s1=lst_deals.get(i).getDealEndDate().substring(0, 10);
				
				    String dateString1 = s;
				    Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dateString1);
				    String dateString2 = new SimpleDateFormat("dd-MM-yyyy").format(date);
				    String dateString3 = s1;
				    Date date3 = new SimpleDateFormat("yyyy-MM-dd").parse(dateString3);
				    String dateString4 = new SimpleDateFormat("dd-MM-yyyy").format(date3);
				    lst_deals.get(i).setDealStartDate(dateString2.replaceAll("-", "/"));
				    lst_deals.get(i).setDealEndDate(dateString4.replaceAll("-", "/"));
				    if(lst_deals.get(i).getDealStatus().equalsIgnoreCase("ACTIVE"))
				    	lst_deals.get(i).setDealStatus("1");
				    else
				    	lst_deals.get(i).setDealStatus("0");
				}
				}
		}catch(Exception e){
			e.printStackTrace();
		}
		return lst_deals;
	}

	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to display New Hot Deal form
	 *
	 **/
	@RequestMapping("/newHomePageDeal")
	public ModelAndView newHomePageDeal(HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr=null,emailIdStr=null;
		List<Deal> lst_deal = null;
		List<Offer> lst_offers = null;
		//List<Deal> lst_deals = null;
		try{
			//List<Offer> lst_offers = new ArrayList<Offer>(); 
		
			lst_deal = new ArrayList<Deal>();
			lst_offers = new ArrayList<Offer>();
		//	lst_deals = new ArrayList<Deal>();

			//log.info("newHomePageDeal");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr  = (String)request.getSession().getAttribute("emailId");
			List<Group> groupsList = outletMasterServiceObj.getProductGroupDetails("",customerIdStr, emailIdStr,"0","10",false);
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,Constants.PAGINATION_START_INDEX);
	
			
			
			
			lst_offers = offerServiceObj.getOffersbycategory("","","0");

			lst_deal = dealServiceObj.searchDeals(customerIdStr,emailIdStr,"","","0","","","",true,"","","","","false");

			

			
			//lst_offers = offerServiceObj.getOffersbycategory("","","0");
			//lst_deals = dealServiceObj.searchDeals(customerIdStr,emailIdStr,"","","0","","","",true,"","","","","false");


			//	lst_deal = dealServiceObj.getDeals(customerIdStr,emailIdStr,"","all","0");
			//lst_offers = offerServiceObj.searchOffers(customerIdStr,emailIdStr,"","","0");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("dealsList", lst_deal);
			modelAndViewObj.addObject("offersList",lst_offers);
			modelAndViewObj.addObject("groupsList",groupsList);
			modelAndViewObj.addObject("categoryList",categoryList);
			modelAndViewObj.setViewName("B2C/homePageDeals/newHomePageDeal");
		}catch(Exception e){
		  e.printStackTrace();	
		}
		return modelAndViewObj;
	}

	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to create New Hot Deal
	 *
	 **/


	@RequestMapping(value="/createNewHomepageDeal",method=RequestMethod.POST)
	public ModelAndView createNewHomepageDeal(@RequestBody HotDeals hotDealsObj,HttpServletRequest request,HttpServletResponse response){
		try{
		//log.info("createNewHomepageDeal");
		modelAndViewObj = new ModelAndView();
		
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,Constants.PAGINATION_START_INDEX);
		String resultStr = dealServiceObj.createNewHotDeal(hotDealsObj, customerIdStr, emailIdStr);
		if(!resultStr.equals(AppProperties.getAppMessageByProperty("HOTDEAL_CREATE_SUCCESS").trim())){
			modelAndViewObj.addObject("hotDealsObj", hotDealsObj);
			/*if(brandMasterObj.getBrandprice() != null && brandMasterObj.getBrandprice().size()>0){
			modelAndViewObj.addObject("brandPrice",brandMasterObj.getBrandprice().get(0));
			}*/
			modelAndViewObj.addObject("err", resultStr);
			modelAndViewObj.addObject("type", "new");
			//modelAndViewObj.setViewName("B2C/newHomePageDeal");
		}else{
			modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.setViewName("B2C/homePageDeals/newHomePageDeal");
		}
		modelAndViewObj.addObject("categoryList",categoryList);
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
	}

	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to update the HotDeal
	 *
	 **/

	@RequestMapping(value="/updateHotDeal",method=RequestMethod.POST)
	public ModelAndView updateHotDeal(@RequestBody HotDeals hotDealObj,HttpServletRequest request,HttpServletResponse response){
		try{
			//log.info("updateHotDeal");
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,Constants.PAGINATION_START_INDEX);
			String resultStr=dealServiceObj.updateHotDeal(hotDealObj, customerIdStr, emailIdStr);
			modelAndViewObj.addObject("categories", categoryList);
//			modelAndViewObj.addObject("subCategories", subCategoriesStr);
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("HOTDEAL_UPDATE_SUCCESS").trim()))
				modelAndViewObj.addObject("err", resultStr);
			else
				modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.addObject("hotDealObj", hotDealObj);
			/*modelAndViewObj.addObject("brandPrice",brandMasterObj.getBrandprice().get(0));
			modelAndViewObj.addObject("brandProduct", brandMasterObj.getBrandproduct().get(0));*/
			modelAndViewObj.setViewName("B2C/homePageDeals/editHomePageDeal");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}

	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to view the  Hot deal details  
	 *
	 **/


	@RequestMapping("/viewHomePageDeals")
	public ModelAndView viewHomePageDeals(@RequestParam("index")String index,HttpServletRequest request,HttpServletResponse response){
		try{
			//log.info("viewHomePageDeals ");
			int start = 1,end = 10;
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<HotDeals> dealsList = dealServiceObj.getHotDealsInfo("",customerIdStr, emailIdStr,index,false,"","","");
			modelAndViewObj = new ModelAndView();
			if(dealsList == null || dealsList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(dealsList.size()<10){
					end = (dealsList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(dealsList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("dealsList", dealsList);
			modelAndViewObj.addObject("maxRecords", "10");
			modelAndViewObj.setViewName("B2C/homePageDeals/viewHotDeals");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}

	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to delete the hotDeal
	 *
	 **/

	@RequestMapping("/deleteHotDeal")
	public ModelAndView deleteBrand(@RequestParam("ids") String ids,HttpServletRequest request,HttpServletResponse response){
		try{
			//log.info("deleteHotDeal");
			int start = 1,end = 10;
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = dealServiceObj.deleteHotDeal(customerIdStr,emailIdStr,ids);
			List<HotDeals> hotDealsList = dealServiceObj.getHotDealsInfo("",customerIdStr, emailIdStr,"0",false,"","","");
			modelAndViewObj = new ModelAndView();
			if(hotDealsList == null || hotDealsList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(hotDealsList.size()<10){
					end = (hotDealsList.size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(hotDealsList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("dealsList", hotDealsList);
			modelAndViewObj.addObject("maxRecords", "10");
			modelAndViewObj.addObject("err", resultStr);
			modelAndViewObj.setViewName("B2C/homePageDeals/viewHotDeals");
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
	 *This method is used to display the EditHomePageDeal form consisting of the details of the Brand
	 *
	 **/
	@RequestMapping("/editHomePageDeal")
	public ModelAndView editHomePageDeal(@RequestParam("dName") String dName,@RequestParam("operation") String operation,@RequestParam("formData") String formData,HttpServletRequest request,HttpServletResponse response){
		List<HotDealsList> offersList= new ArrayList<HotDealsList>();
		List<HotDealsList> dealsList= new ArrayList<HotDealsList>();
		List<Deal> lst_deal = null;
		List<Offer> lst_offers = null;

		try{
			lst_deal = new ArrayList<Deal>();
			lst_offers = new ArrayList<Offer>();

			//log.info("editHomePageDeal");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			List<Group> groupsList = outletMasterServiceObj.getProductGroupDetails("",customerIdStr, emailIdStr,"0","10",false);
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,Constants.PAGINATION_START_INDEX);
			List<HotDeals> hotDealsList = dealServiceObj.getHotDealsInfo(dName,customerIdStr, emailIdStr,"0",false,"","","");
			
			lst_offers = offerServiceObj.getOffersbycategory("","","0");

			lst_deal = dealServiceObj.searchDeals(customerIdStr,emailIdStr,"","","0","","","",true,"","","","","false");

			
			
			if(hotDealsList != null && hotDealsList.size()>0){
				for(int i=0;i<hotDealsList.get(0).getHotDealsList().size();i++){
				if(hotDealsList.get(0).getHotDealsList().get(i).getType().equalsIgnoreCase("offer")){
					offersList.add(hotDealsList.get(0).getHotDealsList().get(i));
				}else{
					dealsList.add(hotDealsList.get(0).getHotDealsList().get(i));
				}
			}
			}
			//////System.out.println(hotDealsList);
			//added by manasa 
			HotDeals dealObj=gson.fromJson(formData, HotDeals.class);
	    	modelAndViewObj.addObject("dealObj",dealObj);
	    	
	    	modelAndViewObj.addObject("dealsList", lst_deal);
			modelAndViewObj.addObject("offersList",lst_offers);
			modelAndViewObj.addObject("categoryList", categoryList);
			modelAndViewObj.addObject("hotDealsList", hotDealsList.get(0));
			modelAndViewObj.addObject("selectedOffersList", offersList);
			modelAndViewObj.addObject("selectedDealsList", dealsList);
			modelAndViewObj.addObject("groupsList", groupsList);
			modelAndViewObj.addObject("hotdealRef", dName);
			if(operation.equals("view"))
				modelAndViewObj.setViewName("B2C/homePageDeals/viewHomePageDeal");
			else
				modelAndViewObj.setViewName("B2C/homePageDeals/editHomePageDeal");
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
	 *This method is used to search the Hot Deals 
	 *11/12/2015
	 **/



	@RequestMapping("/searchHotDeals")
	public ModelAndView searchBrandMaster(@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,@RequestParam("searchName") String searchNameStr,@RequestParam("maxRecords") String maxRecords,@RequestParam("index") String index, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		try{
//			log.info("searchHotDeals");
			int start = 1,end = Integer.parseInt(maxRecords);
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<HotDeals> dealsList = dealServiceObj.getHotDealsInfo(searchNameStr,customerIdStr, emailIdStr,"0",true,maxRecords,startDate,endDate);
			modelAndViewObj = new ModelAndView();
			if(dealsList == null || dealsList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(dealsList.size()<Integer.parseInt(maxRecords)){
					end = (dealsList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(dealsList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("maxRecords", maxRecords);
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("dealsList", dealsList);
			modelAndViewObj.setViewName("B2C/homePageDeals/viewHotDeals");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display all Events in a tabular format
	 *
	 **/
	@RequestMapping("/viewEvents")
	public ModelAndView viewEvents(@RequestParam("index")String index,@RequestParam("maxRecords")String maxRecords,HttpServletRequest request,HttpServletResponse response){
		try{
//			log.info("viewEvents");
			int start = 1,end = Integer.parseInt(maxRecords);
			List<BusinessEvent> businessEventList = eventServiceObj.getEvents(null, index, false,false,"","",maxRecords);
			modelAndViewObj = new ModelAndView();
			if(businessEventList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(businessEventList.size()<Integer.parseInt(maxRecords)){
					end = (businessEventList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", businessEventList.get(0).getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
			modelAndViewObj.addObject("businessEventList", businessEventList);
				modelAndViewObj.setViewName("B2C/events/events");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	@RequestMapping("/searchEvents")
	public ModelAndView searchEvents(@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,@RequestParam("maxRecords") String maxRecords,HttpServletRequest request,HttpServletResponse response) {
		try{
//			log.info("searchEvents");
			int start = 1,end = Integer.parseInt(maxRecords);
			List<BusinessEvent> businessEventList = eventServiceObj.getEvents(searchNameStr, index, true,false,startDate,endDate,maxRecords);
			modelAndViewObj = new ModelAndView();
			if(businessEventList == null || businessEventList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(businessEventList.size()<Integer.parseInt(maxRecords)){
					end = (businessEventList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(businessEventList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("startDate", startDate);
			modelAndViewObj.addObject("endDate", endDate);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
			modelAndViewObj.addObject("businessEventList",businessEventList);
			modelAndViewObj.setViewName("B2C/events/events");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	@RequestMapping("/newEvent")
	public ModelAndView newEvent(HttpServletRequest request,HttpServletResponse response){
		try{
//			log.info("newEvent");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("type", "new");
			modelAndViewObj.setViewName("B2C/events/newEvent");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	@RequestMapping(value="/createEvent",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createEvent(@RequestBody BusinessEvent businessEventObj,HttpServletRequest request,HttpServletResponse response) {
		try{
//			log.info("createEvent");
			String resultStr = eventServiceObj.createEvent(businessEventObj);
//			String resultStr = "";
			modelAndViewObj = new ModelAndView();
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("EVENT_CREATE_SUCCESS").trim())){
				businessEventObj.setEventImage1(null);
				businessEventObj.setEventImage2(null);
				businessEventObj.setEventImage3(null);
				businessEventObj.setEventImage1RefId(null);
				businessEventObj.setEventImage2RefId(null);
				businessEventObj.setEventImage3RefId(null);
				modelAndViewObj.addObject("businessEventObj", businessEventObj);
				modelAndViewObj.addObject("err", resultStr);
			}else{
				modelAndViewObj.addObject("success", resultStr);
			}
			modelAndViewObj.addObject("type", "new");
			modelAndViewObj.setViewName("B2C/events/newEvent");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	@RequestMapping("/editEvent")
	public ModelAndView editEvent(@RequestParam("eventId") String eventId,@RequestParam("operation") String operation,@RequestParam("formData") String formData,HttpServletRequest request,
			HttpServletResponse response){
		try{
//			log.info("editEvent");
			List<BusinessEvent> businessEventList = eventServiceObj.getEvents(eventId, "0", false,true,"","","");
			modelAndViewObj = new ModelAndView();
			if(businessEventList != null && businessEventList.size() > 0)
			modelAndViewObj.addObject("businessEventObj",businessEventList.get(0));
			
			//added by manasa 
			BusinessEvent eventObj=gson.fromJson(formData, BusinessEvent.class);
			modelAndViewObj.addObject("eventObj",eventObj);
			if(operation.equals("view"))
				modelAndViewObj.setViewName("B2C/events/viewEvent");
			else{
				modelAndViewObj.addObject("type", "edit");				
				modelAndViewObj.setViewName("B2C/events/newEvent");
			}
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	@RequestMapping(value="/updateEvent",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView updateEvent(@RequestBody BusinessEvent businessEventObj,HttpServletRequest request,HttpServletResponse response) {
		try{
//			log.info("updateEvent");
			String resultStr = eventServiceObj.updateEvent(businessEventObj);
			List<BusinessEvent> businessEventList = eventServiceObj.getEvents(businessEventObj.getEventId(), "0", false,true,"","","");
			modelAndViewObj = new ModelAndView();
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("EVENT_UPDATE_SUCCESS").trim())){
				modelAndViewObj.addObject("err", resultStr);
			}else{
				modelAndViewObj.addObject("success", resultStr);
			}
			modelAndViewObj.addObject("businessEventObj",businessEventList.get(0));
			modelAndViewObj.addObject("type", "edit");
			modelAndViewObj.setViewName("B2C/events/newEvent");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	@RequestMapping("/deleteEvents")
	public ModelAndView deleteEvents(@RequestParam("ids") String ids,HttpServletRequest request,HttpServletResponse response){
		try{
//			log.info("deleteEvents ");
			int start = 1,end = 10;
			modelAndViewObj = new ModelAndView();
			String resultStr = eventServiceObj.deleteEvents(ids);
			List<BusinessEvent> businessEventList = eventServiceObj.getEvents(null, "0", false,false,"","","10");
			modelAndViewObj = new ModelAndView();
			if(businessEventList == null || businessEventList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(businessEventList.size()<10)
					end = businessEventList.size();
				modelAndViewObj.addObject("totalRecords", businessEventList.get(0).getTotalRecords());
				modelAndViewObj.addObject("index",start);
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("businessEventList", businessEventList);
			modelAndViewObj.addObject("err", resultStr);
			modelAndViewObj.addObject("maxRecords", "10");
			modelAndViewObj.setViewName("B2C/events/events");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author soumya
	 * created On: 7-07-2016
	 * 
**/
	@RequestMapping("/searchFeaturedProducts")
	public ModelAndView searchFeaturedGroup(@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		try{
//			log.info("searchFeaturedGroup");
			int start = 1,end = 10;
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<FeaturedProducts> featuredProductsList = featuredServiceObj.getFeaturedProducts(customerIdStr,emailIdStr,searchNameStr,"","",false,index,"","","");
			modelAndViewObj = new ModelAndView();
			if(featuredProductsList == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(featuredProductsList.size()<10){
					end = (featuredProductsList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(featuredProductsList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("featuredList", featuredProductsList);
			modelAndViewObj.setViewName("B2C/FeaturedProducts/featuredProducts");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author soumya
	 * created On: 7-07-2016
	 * 
	 * This method is used to accept a file from browser,
	 * send it to webservice and get a token related to that file.
	 * This token is returned to the ajax call.
	 * This token should be used, where ever this file info is needed.  
	 *
	 *
	 **/
	@RequestMapping(value="/addToAttachementList",method=RequestMethod.POST)
	public void addToAttachementList(@RequestParam("file") MultipartFile file,@RequestParam("refId") String refId,HttpServletRequest request,HttpServletResponse response) {
		Attachment attachmentObj = new Attachment();
		try {
//			log.info("addToAttachementList");
//			log.info(file.getOriginalFilename());
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
	@RequestMapping("/searchProductsOnCategoryBasis")
	public @ResponseBody List<ProductsList> searchProductsOnCategoryBasis(@RequestParam("searchName") String searchNameStr,@RequestParam("categoryName")String productCategoryStr,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<ProductsList> productsList = new ArrayList<ProductsList>();
		
		try{
//			log.info("searchProductsBasedOnCategory");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			//SkuResponse skuResponse = skuServiceObj.getProductsByCriteria(index,category,brand,searchNameStr,startPriceRange,endPricRange,maxRecords);
			productsList = skuServiceObj.searchProducts(customerIdStr, emailIdStr,searchNameStr,"",productCategoryStr,"",false,"","",false);
		}catch(Exception e){
			e.printStackTrace();
		}
		return productsList;
	}
	/*chaithanay.v*/
	
	@RequestMapping("/viewEditFeaturedProducts")
	public ModelAndView viewEditFeaturedProducts(@RequestParam("featuredId")String featuredId,@RequestParam("operation")String operation,@RequestParam("formData") String formData,HttpServletRequest request,HttpServletResponse response){

//			log.info("viewFeaturedProducts");
			FeaturedProductsResponse feturedresponse = null;
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			try {
				modelAndViewObj = new ModelAndView();
				feturedresponse = featuredServiceObj.viewFeaturedProducts(customerIdStr,emailIdStr,featuredId,"","",false,"-1","","");
				modelAndViewObj.addObject("featuredProductsResponse",feturedresponse.getProductObj());
				List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,Constants.PAGINATION_START_INDEX);
				List<BrandMaster> brandsList = genericMasterServiceObj.getBrandDetails("",customerIdStr, emailIdStr,"-1",false);
				modelAndViewObj.addObject("categories", categoryList);
				modelAndViewObj.addObject("brands", brandsList);
				//added by manasa 
				FeaturedProducts featureObj=gson.fromJson(formData, FeaturedProducts.class);
				modelAndViewObj.addObject("featureObj",featureObj);
				
				if(operation.equals("view"))
					modelAndViewObj.setViewName("B2C/FeaturedProducts/viewFeaturedProducts");
				else
					modelAndViewObj.setViewName("B2C/FeaturedProducts/editFeaturedProducts");
		//////System.out.println(modelAndViewObj);
			
		
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	@RequestMapping("newFeaturedProductGroupMaster")
	public ModelAndView newFeaturedProductGroupMaster(HttpServletRequest request,HttpServletResponse response){
		try{
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,Constants.PAGINATION_START_INDEX);
			List<BrandMaster> brandsList = genericMasterServiceObj.getBrandDetails("",customerIdStr, emailIdStr,"-1",false);
			modelAndViewObj.addObject("categories", categoryList);
			modelAndViewObj.addObject("brands", brandsList);
			modelAndViewObj.setViewName("B2C/FeaturedProducts/newFeaturedProducts");

		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return modelAndViewObj;
}
	/**
	 * @author chaithanya.v	
	 * created On: 02-08-2016
	 * This method is used to ,
	 * send it to webservice and .
	 **/
	@RequestMapping("/deleteFeaturedproductGroup")
	public ModelAndView deleteFeaturedproductGroup(@RequestParam("ids")String ids,HttpServletRequest request,HttpServletResponse response){

//			log.info("deleteFeaturedproductGroup");
			String index="0";
			String maxRecords="10";
			List<FeaturedProducts> featuredList = null;
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			try {
				modelAndViewObj = new ModelAndView();
				String resultStr = featuredServiceObj.deleteFeaturedproductGroup(customerIdStr,emailIdStr,ids);
				featuredList = featuredServiceObj.getFeaturedProducts(customerIdStr,emailIdStr,null,"","",false,index,maxRecords,"","");
				if(featuredList == null || featuredList.size() == 0)
				{
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}
				else
				{
					if(featuredList.size()<Integer.parseInt(maxRecords))
					{
						end = (featuredList.size())+(Integer.parseInt(index));
					}else
					{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(featuredList.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
				}
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.addObject("featuredList",featuredList);
				modelAndViewObj.addObject("err", resultStr);
			modelAndViewObj.setViewName("B2C/FeaturedProducts/featuredProducts");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}


	/**
	 * 
	 * @author soumya
	 * created On: 7-07-2016
	 * 
	 * This method is used to ,
	 * send it to webservice and .
	 * 
	 * 
	 *
	 *
	 **/
	
/* @RequestMapping("/viewFeaturedShops")
	public ModelAndView viewFeaturedShops(@RequestParam("index")String index,@RequestParam("maxRecords")String maxRecords,HttpServletRequest request,HttpServletResponse response){

//			log.info("viewFeaturedProducts");
			List<FeaturedProducts> featuredList = null;
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			try {
				modelAndViewObj = new ModelAndView();
				featuredList = featuredServiceObj.getFeaturedProducts(customerIdStr,emailIdStr,null,"","",false,index,maxRecords,"","");
				if(featuredList == null || featuredList.size() == 0)
				{
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}
				else
				{
					if(featuredList.size()<Integer.parseInt(maxRecords))
					{
						end = (featuredList.size())+(Integer.parseInt(index));
					}else
					{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(featuredList.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
				}
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.addObject("featuredList",featuredList);
			modelAndViewObj.setViewName("B2C/featuredShops/FeaturedShops");
	//	////System.out.println(modelAndViewObj);
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}*/
	
	/*@RequestMapping("newFeaturedshops")
	public ModelAndView newFeaturedshops(HttpServletRequest request,HttpServletResponse response){
		try{
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,Constants.PAGINATION_START_INDEX);
			List<BrandMaster> brandsList = genericMasterServiceObj.getBrandDetails("",customerIdStr, emailIdStr,"-1",false);
			modelAndViewObj.addObject("categories", categoryList);
			modelAndViewObj.addObject("brands", brandsList);
			modelAndViewObj.setViewName("B2C/featuredShops/newFeaturedShops");

		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return modelAndViewObj;
}*/
	
	
	@RequestMapping("/viewFeaturedProducts")
	public ModelAndView viewFeaturedProducts(@RequestParam("index")String index,@RequestParam("maxRecords")String maxRecords,HttpServletRequest request,HttpServletResponse response){

//			log.info("viewFeaturedProducts");
			List<FeaturedProducts> featuredList = null;
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			try {
				modelAndViewObj = new ModelAndView();
				featuredList = featuredServiceObj.getFeaturedProducts(customerIdStr,emailIdStr,null,"","",false,index,maxRecords,"","");
				if(featuredList == null || featuredList.size() == 0)
				{
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}
				else
				{
					if(featuredList.size()<Integer.parseInt(maxRecords))
					{
						end = (featuredList.size())+(Integer.parseInt(index));
					}else
					{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(featuredList.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
				}
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.addObject("featuredList",featuredList);
			modelAndViewObj.setViewName("B2C/FeaturedProducts/featuredProducts");
	//	////System.out.println(modelAndViewObj);
			
		
		}catch(Exception exception){
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
	
	@RequestMapping(value="/createFeatureProductGroupMaster",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createFeatureProductGroupMaster(@RequestBody FeaturedProducts featureobj,HttpServletRequest request,HttpServletResponse response){
		//////System.out.println(featureobj);
		try{
//			log.info("createFeatureProductGroupMaster");
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr=featuredServiceObj.createNewFeatureProductGroupMaster(featureobj, customerIdStr, emailIdStr);
		//	////System.out.println(resultStr);
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("FEATURED_GROUP_CREATE_SUCCESS").trim())){
				featureobj.setStartDateStr(featureobj.getStartDateStr().substring(0, 10));
				featureobj.setEndDateStr(featureobj.getEndDateStr().substring(0, 10));
				modelAndViewObj.addObject("featuredlist", featureobj);
				modelAndViewObj.addObject("err", resultStr);
				//modelAndViewObj.addObject("type", "new");
				modelAndViewObj.setViewName("B2C/FeaturedProducts/newFeaturedProducts");
			}else{
				modelAndViewObj.addObject("success", resultStr);
				modelAndViewObj.setViewName("B2C/FeaturedProducts/newFeaturedProducts");
			}
		}catch(Exception exception){
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
	
	@RequestMapping(value="/updateFeatureProductGroupMaster",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView updateFeatureProductGroupMaster(@RequestBody FeaturedProducts featureobj,HttpServletRequest request,HttpServletResponse response){
		//////System.out.println(featureobj);
		FeaturedProductsResponse feturedresponse = null;
		try{
//			log.info("createFeatureProductGroupMaster");
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr=featuredServiceObj.updateNewFeatureProductGroupMaster(featureobj, customerIdStr, emailIdStr);
			//////System.out.println(featureobj);
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("FEATURED_GROUP_UPDATE_SUCCESS").trim())){
				featureobj.setStartDateStr(featureobj.getStartDateStr().substring(0, 10));
				featureobj.setEndDateStr(featureobj.getEndDateStr().substring(0, 10));
				modelAndViewObj.addObject("featuredProductsResponse", featureobj);
				modelAndViewObj.addObject("err", resultStr);
				//modelAndViewObj.addObject("type", "new");
				modelAndViewObj.setViewName("B2C/FeaturedProducts/editFeaturedProducts");
			}else{
				modelAndViewObj.addObject("success", resultStr);
				feturedresponse = featuredServiceObj.viewFeaturedProducts(customerIdStr,emailIdStr,featureobj.getFeatureId(),"","",false,"-1","","");
				modelAndViewObj.addObject("featuredProductsResponse",feturedresponse.getProductObj());
				modelAndViewObj.setViewName("B2C/FeaturedProducts/editFeaturedProducts");
			}
		}catch(Exception exception){
			exception.printStackTrace();
		}
		
		
		return modelAndViewObj;
	}
	
	@RequestMapping("/searchFeaturedProductsGroup")
	public ModelAndView searchFeaturedProductsGroup(@RequestParam("featuredType") String featuredType,@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,@RequestParam("maxRecords") String maxRecords,HttpServletRequest request,HttpServletResponse response) {
//		log.info("viewFeaturedProducts");
		List<FeaturedProducts> featuredList = null;
		int start = 1,end = Integer.parseInt(maxRecords);
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		try {
			modelAndViewObj = new ModelAndView();
			featuredList = featuredServiceObj.getFeaturedProducts(customerIdStr,emailIdStr,searchNameStr,startDate,endDate,false,index,maxRecords,"",featuredType);
			modelAndViewObj = new ModelAndView();
			if(featuredList == null || featuredList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(featuredList.size()<Integer.parseInt(maxRecords)){
					end = (featuredList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(featuredList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("searchName", searchNameStr);
			modelAndViewObj.addObject("startDate", startDate);
			modelAndViewObj.addObject("featuredType", featuredType);
			modelAndViewObj.addObject("endDate", endDate);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
			modelAndViewObj.addObject("featuredList",featuredList);
			modelAndViewObj.setViewName("B2C/FeaturedProducts/featuredProducts");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	/* chaithanya*/
	@RequestMapping("/getNewArrivals")
	public ModelAndView getNewArrivals(HttpServletRequest request,HttpServletResponse response){
//			log.info("viewFeaturedProducts");
			String maxRecords = "10";
			int start = 1,end = Integer.parseInt(maxRecords);
			String index = "0";
			NewArrivalResponse newarrivalresponse =new NewArrivalResponse();
			try {
				modelAndViewObj = new ModelAndView();
				newarrivalresponse = newArrivalsServiceObj.getNewArrivals("0","","","","","","","");
				//List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,Constants.PAGINATION_START_INDEX);
				//List<BrandMaster> brandsList = genericMasterServiceObj.getBrandDetails("",customerIdStr, emailIdStr,"-1",false);
				//modelAndViewObj.addObject("categories", categoryList);
				//modelAndViewObj.addObject("brands", brandsList);
				if(newarrivalresponse.getNewArrivalProducts() == null || newarrivalresponse.getNewArrivalProducts().size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(newarrivalresponse.getNewArrivalProducts().size()<Integer.parseInt(maxRecords)){
						end = (newarrivalresponse.getNewArrivalProducts().size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", newarrivalresponse.getTotalRecords());
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
				}
				modelAndViewObj.addObject("maxRecords", maxRecords);
				modelAndViewObj.addObject("newarrivalslist", newarrivalresponse.getNewArrivalProducts());
				modelAndViewObj.setViewName("B2C/newArrivals/viewNewarrivals");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}

	 /* chaithanya*/
		@RequestMapping("/viewNewArrivals")
		public ModelAndView viewNewArrivals(@RequestParam("newarrivalType") String newarrivalType,@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,@RequestParam("maxRecords") String maxRecords,HttpServletRequest request,HttpServletResponse response){
//				log.info("viewFeaturedProducts");
				int start = 1,end = Integer.parseInt(maxRecords);
				NewArrivalResponse newarrivalresponse =new NewArrivalResponse();
				try {
					modelAndViewObj = new ModelAndView();
					newarrivalresponse = newArrivalsServiceObj.getNewArrivals(index,newarrivalType,searchNameStr,startDate,endDate,"",maxRecords,"");
					//List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,Constants.PAGINATION_START_INDEX);
					//List<BrandMaster> brandsList = genericMasterServiceObj.getBrandDetails("",customerIdStr, emailIdStr,"-1",false);
					//modelAndViewObj.addObject("categories", categoryList);
					//modelAndViewObj.addObject("brands", brandsList);
					if(newarrivalresponse.getNewArrivalProducts() == null || newarrivalresponse.getNewArrivalProducts().size() == 0){
						modelAndViewObj.addObject("totalRecords","0");
						modelAndViewObj.addObject("index", "0");
						modelAndViewObj.addObject("totalValue", "0");
					}else{
						if(newarrivalresponse.getNewArrivalProducts().size()<Integer.parseInt(maxRecords)){
							end = (newarrivalresponse.getNewArrivalProducts().size())+(Integer.parseInt(index));
						}else{
							end = (Integer.parseInt(index)+end);
						}
						modelAndViewObj.addObject("totalRecords", newarrivalresponse.getTotalRecords());
						modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
						modelAndViewObj.addObject("totalValue", end);
					}
					modelAndViewObj.addObject("maxRecords", maxRecords);
					modelAndViewObj.addObject("newarrivalType", newarrivalType);
					modelAndViewObj.addObject("newarrivalslist", newarrivalresponse.getNewArrivalProducts());
					modelAndViewObj.setViewName("B2C/newArrivals/viewNewarrivals");
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
		   /* chaithanya*/
		@RequestMapping("/getProductsByCriteria")
		public @ResponseBody List<SkuId> getProductsByCriteria(@RequestParam("maxRecords") String maxRecords,@RequestParam("priceRange") String priceRange,@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,@RequestParam("category") String category,@RequestParam("brand") String brand,HttpServletRequest request,HttpServletResponse response){
//				log.info("getProductsByCriteria");
				int start = 1,end = Integer.parseInt(maxRecords);
				SkuId skuResponse =new SkuId();
				try {
					String startPriceRange="";
					String endPricRange="";
					if(priceRange!=null && priceRange!=""){
						startPriceRange = priceRange.substring(0, priceRange.indexOf("-"));
						endPricRange = priceRange.substring(priceRange.indexOf("-")+1, priceRange.length());
					}
					
					modelAndViewObj = new ModelAndView();
					skuResponse = skuServiceObj.getProductsByCriteria(index,category,brand,searchNameStr,startPriceRange,endPricRange,maxRecords);
					if(skuResponse.getSkuIdList() == null || skuResponse.getSkuIdList().size() == 0){
						modelAndViewObj.addObject("totalRecords","0");
						modelAndViewObj.addObject("index", "0");
						modelAndViewObj.addObject("totalValue", "0");
					}else{
						if(skuResponse.getSkuIdList().size()<Integer.parseInt(maxRecords)){
							end = (skuResponse.getSkuIdList().size())+(Integer.parseInt(index));
						}else{
							end = (Integer.parseInt(index)+end);
						}
						modelAndViewObj.addObject("totalRecords", skuResponse.getTotalRecords());
						modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
						modelAndViewObj.addObject("totalValue", end);
					}
					modelAndViewObj.addObject("category", category);
					modelAndViewObj.addObject("brandcode", brand);
					modelAndViewObj.addObject("skuList", skuResponse.getSkuIdList());
					//modelAndViewObj.setViewName("B2C/newArrivals/newArrivals");
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return skuResponse.getSkuIdList();
		}
		
		
		
		
/*		@author chaithanya.v
		this method isused to view new new arrival group*/
		
		@RequestMapping("newNewarrivalProductGroupMaster")
		public ModelAndView newNewarrivalProductGroupMaster(HttpServletRequest request,HttpServletResponse response){
			try{
				modelAndViewObj = new ModelAndView();
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				
				List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,Constants.PAGINATION_START_INDEX);
				List<BrandMaster> brandsList = genericMasterServiceObj.getBrandDetails("",customerIdStr, emailIdStr,"-1",false);
				List<Group> groupsList = outletMasterServiceObj.getProductGroupDetails("",customerIdStr, emailIdStr,"0","10",false);
				modelAndViewObj.addObject("categories", categoryList);
				modelAndViewObj.addObject("brands", brandsList);
				modelAndViewObj.addObject("groupsList", groupsList);
				modelAndViewObj.setViewName("B2C/newArrivals/createNewarrivals");

			}catch(Exception e)
			{
				e.printStackTrace();
			}
			return modelAndViewObj;
			}
		
		/**
		 * @author chaithanya.v
		 *This method is used to create New Product Group
		 *
		 **/
		
		@RequestMapping(value="/createNewarrivalGroupMaster",method=RequestMethod.POST)
		public ModelAndView createNewarrivalGroupMaster(@RequestBody NewArrivalProducts newarrivals,HttpServletRequest request,HttpServletResponse response){
		//	////System.out.println(newarrivals);
			try{
//				log.info("createNewarrivalGroupMaster");
				modelAndViewObj = new ModelAndView();
				String resultStr= newArrivalsServiceObj.createNewarrivalGroupMaster(newarrivals);
				if(!resultStr.equals(AppProperties.getAppMessageByProperty("NEWARRIVAL_GROUP_CREATE_SUCCESS").trim())){
					modelAndViewObj.addObject("Error", resultStr);
					modelAndViewObj.setViewName("B2C/newArrivals/createNewarrivals");
				}else{
					modelAndViewObj.addObject("success", resultStr);
					/*feturedresponse = featuredServiceObj.viewFeaturedProducts(customerIdStr,emailIdStr,featureobj.getFeatureId(),"","",false,"-1","","");*/
					modelAndViewObj.setViewName("B2C/newArrivals/createNewarrivals");
				}
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
		
		/**
		 * @author chaithanya.v	
		 * created On: 02-08-2016
		 * This method is used to ,
		 * send it to webservice and .
		 **/
		@RequestMapping("/deleteNewArrivals")
		public ModelAndView deleteNewArrivals(@RequestParam("ids")String ids,HttpServletRequest request,HttpServletResponse response){

//				log.info("deleteFeaturedproductGroup");
				String index="0";
				String maxRecords="10";
				int start = 1,end = Integer.parseInt(maxRecords);
				try {
					modelAndViewObj = new ModelAndView();
					String resultStr = newArrivalsServiceObj.deleteNewArrivals(ids);
					NewArrivalResponse newarrivalresponse = newArrivalsServiceObj.getNewArrivals(index,"","","","","",maxRecords,"");
					if(newarrivalresponse.getNewArrivalProducts() == null || newarrivalresponse.getNewArrivalProducts().size() == 0){
						modelAndViewObj.addObject("totalRecords","0");
						modelAndViewObj.addObject("index", "0");
						modelAndViewObj.addObject("totalValue", "0");
					}else{
						if(newarrivalresponse.getNewArrivalProducts().size()<Integer.parseInt(maxRecords)){
							end = (newarrivalresponse.getNewArrivalProducts().size())+(Integer.parseInt(index));
						}else{
							end = (Integer.parseInt(index)+end);
						}
						modelAndViewObj.addObject("totalRecords", newarrivalresponse.getTotalRecords());
						modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
						modelAndViewObj.addObject("totalValue", end);
					}
					modelAndViewObj.addObject("maxRecords", maxRecords);
					modelAndViewObj.addObject("newarrivalslist", newarrivalresponse.getNewArrivalProducts());
					modelAndViewObj.setViewName("B2C/newArrivals/viewNewarrivals");
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}

		/*chaithanay.v*/
		
		@RequestMapping("/viewEditNewarrivalGroup")
		public ModelAndView viewEditNewarrivalGroup(@RequestParam("newarrivalId")String newarrivalId,@RequestParam("operation")String operation,@RequestParam("formData") String formData,HttpServletRequest request,HttpServletResponse response){

			String maxRecords = "10";
			int start = 1,end = Integer.parseInt(maxRecords);
			String index = "0";
			NewArrivalResponse newarrivalresponse =new NewArrivalResponse();
			try {
				modelAndViewObj = new ModelAndView();
				newarrivalresponse = newArrivalsServiceObj.getNewArrivals("0","","","","","","",newarrivalId);

				if(newarrivalresponse.getNewArrivalProducts() == null || newarrivalresponse.getNewArrivalProducts().size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(newarrivalresponse.getNewArrivalProducts().size()<Integer.parseInt(maxRecords)){
						end = (newarrivalresponse.getNewArrivalProducts().size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", newarrivalresponse.getTotalRecords());
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
				}
				modelAndViewObj.addObject("maxRecords", maxRecords);
				//added by manasa 
				NewArrivalProducts arrivalObj=gson.fromJson(formData, NewArrivalProducts.class);
				modelAndViewObj.addObject("arrivalObj",arrivalObj);
				
				modelAndViewObj.addObject("newarrivalslist", newarrivalresponse.getArrivalProducts());
					if(operation.equals("view"))
						modelAndViewObj.setViewName("B2C/newArrivals/viewNewarrivlasGroup");
					else{
						String customerIdStr = (String)request.getSession().getAttribute("customerId");
						String emailIdStr = (String)request.getSession().getAttribute("emailId");
						List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,Constants.PAGINATION_START_INDEX);
						List<BrandMaster> brandsList = genericMasterServiceObj.getBrandDetails("",customerIdStr, emailIdStr,"-1",false);
						List<Group> groupsList = outletMasterServiceObj.getProductGroupDetails("",customerIdStr, emailIdStr,"0","10",false);
						modelAndViewObj.addObject("categories", categoryList);
						modelAndViewObj.addObject("brands", brandsList);
						modelAndViewObj.addObject("groupsList", groupsList);
						modelAndViewObj.addObject("newarrivalId", newarrivalId);
						modelAndViewObj.setViewName("B2C/newArrivals/editNewarrivals");
					}
						
			}catch(Exception exception){
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
		
		@RequestMapping(value="/updateNewarrivalGroupMaster",method=RequestMethod.POST,consumes="application/json")
		public ModelAndView updateNewarrivalGroupMaster(@RequestBody NewArrivalProducts newarrivals,HttpServletRequest request,HttpServletResponse response){
			//////System.out.println(newarrivals);
			try{
//				log.info("updateNewarrivalGroupMaster");
				modelAndViewObj = new ModelAndView();
				String resultStr=newArrivalsServiceObj.updateNewarrivalGroupMaster(newarrivals);
				//////System.out.println(newarrivals);
				if(!resultStr.equals(AppProperties.getAppMessageByProperty("NEWARRIVAL_GROUP_UPDATE_SUCCESS").trim())){
					modelAndViewObj.addObject("newarrivalslist", newarrivals);
					modelAndViewObj.addObject("Error", resultStr);
					modelAndViewObj.setViewName("B2C/newArrivals/editNewarrivals");
				}else{
					modelAndViewObj.addObject("success", resultStr);
					NewArrivalResponse newarrivalresponse = newArrivalsServiceObj.getNewArrivals("0","","","","","","",newarrivals.getNewRefId());
					modelAndViewObj.addObject("newarrivalslist", newarrivalresponse.getArrivalProducts());
					modelAndViewObj.setViewName("B2C/newArrivals/editNewarrivals");
				}
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
		
		
		/**
		 * @author RaviTeja.N	
		 * created On: 03-08-2016
		 * This method is used to ,
		 * send request to payment page for online payment .
		 **/
		@RequestMapping("/viewPaymentPage")
		public ModelAndView viewPaymentGateWay(HttpServletRequest request,HttpServletResponse response){
			modelAndViewObj =new ModelAndView();
			 OnlinePaymentResponse onlinePaymentResponse=paymentGateWayServiceObj.getPaymentGateWay();
			 if(onlinePaymentResponse.getPaymentsList()!=null){
				 modelAndViewObj.addObject("onlinePaymentlist", onlinePaymentResponse.getPaymentsList().get(0));
			 }

			modelAndViewObj.setViewName("B2C/paymentGateway/viewPaymentPage");
			return modelAndViewObj;
			
		}
		
		
		
		
		
		
		/**
		 * @author chaithanya.v
		 *This method is used to savePaymentGateWay
		 **/
		
		@RequestMapping(value="/savePaymentGateWay",method=RequestMethod.POST,consumes="application/json")
		public ModelAndView savePaymentGateWay(@RequestBody OnlinePayments onlinePayments, HttpServletRequest request,HttpServletResponse response){
			
			try{
//				log.info("savePaymentGateWay");
				modelAndViewObj = new ModelAndView();
				
				String resultStr=paymentGateWayServiceObj.savePaymentGateWay(onlinePayments);
			//	////System.out.println(resultStr);
				if(!resultStr.equals(AppProperties.getAppMessageByProperty("PAYMENT_GROUP_CREATE_SUCCESS").trim())){
					
					modelAndViewObj.addObject("onlinePaymentslist", onlinePayments);
					modelAndViewObj.addObject("err", resultStr);
					modelAndViewObj.setViewName("B2C/paymentGateway/viewPaymentPage");
				}else{
					modelAndViewObj.addObject("success", resultStr);
					modelAndViewObj.setViewName("B2C/paymentGateway/viewPaymentPage");
				}
			
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
		
		
		@RequestMapping(value="/updatePaymentGateWay",method=RequestMethod.POST,consumes="application/json")
		public ModelAndView updatePaymentGateWay(@RequestBody OnlinePayments onlinePayments, HttpServletRequest request,HttpServletResponse response){
			
			try{
//				log.info("updatePaymentGateWay");
				modelAndViewObj = new ModelAndView();
				
				String resultStr=paymentGateWayServiceObj.updatePaymentGateWay(onlinePayments);
				//////System.out.println(resultStr);
				if(!resultStr.equals(AppProperties.getAppMessageByProperty("PAYMENT_GROUP_UPDATE_SUCCESS").trim())){
					modelAndViewObj.addObject("onlinePaymentslist", onlinePayments);
					modelAndViewObj.addObject("err", resultStr);
					modelAndViewObj.setViewName("B2C/paymentGateway/viewPaymentPage");
				}else{
					modelAndViewObj.addObject("onlinePaymentlist", onlinePayments);
					modelAndViewObj.addObject("success", resultStr);
					modelAndViewObj.setViewName("B2C/paymentGateway/viewPaymentPage");
				}
			
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
		
		@RequestMapping(value="/createShoppinglistForm",method=RequestMethod.POST,consumes="application/json")
		public ModelAndView createShoppinglistForm(@RequestBody CustomerShoppingList customershoppinglistobj,HttpServletRequest request,HttpServletResponse response)
		{
			String customerIdStr = null,emailIdStr=null;
			try{
				
//				log.info("Create ShoppingList");
				modelAndViewObj = new ModelAndView();
				customerIdStr = (String)request.getSession().getAttribute("customerId");
				emailIdStr = (String)request.getSession().getAttribute("emailId");
				String resultStr=shoppingListServiceObj.createCustomerShoppingList(customershoppinglistobj);
				//////System.out.println(resultStr);
				//////System.out.println(customershoppinglistobj);
				List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
				List<String> zones = masterServiceObj.getZonesList(customerIdStr, emailIdStr);
				modelAndViewObj.addObject("categories", categoryList);
				modelAndViewObj.addObject("zones", zones);
				if(!resultStr.equals(AppProperties.getAppMessageByProperty("SHOPPING_LIST_CREATION_SUCCESS").trim())){
					modelAndViewObj.addObject("shoppinglistresponse",customershoppinglistobj);
					modelAndViewObj.addObject("err", resultStr);
					//modelAndViewObj.addObject("type", "new");
					modelAndViewObj.setViewName("B2C/ShoppingList/newShoppingList");
				}else{
					modelAndViewObj.addObject("success", resultStr);
					modelAndViewObj.setViewName("B2C/ShoppingList/newShoppingList");
				}
				
			
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
		

		@RequestMapping(value="/updateShoppingList",method=RequestMethod.POST,consumes="application/json")
		public ModelAndView updateShoppingList(@RequestBody CustomerShoppingList customershoppinglistobj,HttpServletRequest request,HttpServletResponse response){
		ShoppingItemsListResponse shoppinglistresponse = null;
			
			try{
			
				modelAndViewObj = new ModelAndView();
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				String resultStr=shoppingListServiceObj.updateNewShoppingList(customershoppinglistobj, customerIdStr, emailIdStr);
				List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
				List<String> zones = masterServiceObj.getZonesList(customerIdStr, emailIdStr);
				modelAndViewObj.addObject("categories", categoryList);
				modelAndViewObj.addObject("zones", zones);
				
				if(!resultStr.equals(AppProperties.getAppMessageByProperty("shoppinglist_update_success").trim())){
				
					modelAndViewObj.addObject("err", resultStr);
					//modelAndViewObj.addObject("type", "new");
					
				}else{
					modelAndViewObj.addObject("success", resultStr);
					shoppinglistresponse = shoppingListServiceObj.viewShoppingListDetails(customerIdStr,emailIdStr,customershoppinglistobj.getListId(),"","");
					modelAndViewObj.addObject("categoryId",shoppinglistresponse.getShoppingObj().getItemsList().get(0).getCategoryId());
					modelAndViewObj.addObject("groupId",shoppinglistresponse.getShoppingObj().getItemsList().get(0).getGroupId());
			      	modelAndViewObj.addObject("shoppinglistresponse",shoppinglistresponse.getShoppingObj());
					modelAndViewObj.setViewName("B2C/ShoppingList/editShoppingList");
				}
			}catch(Exception exception){
				exception.printStackTrace();
			}
			
			
			return modelAndViewObj;
		}
		

	@RequestMapping("/viewCustomerShoppingListDetails")
		public ModelAndView viewCustomerShoppingListDetails(@RequestParam("listId")String listId,@RequestParam("startIndex")String startIndex,@RequestParam("operation")String operation,HttpServletRequest request,HttpServletResponse response){
		
			
//			log.info("vieweditCustomerShoppingListDetails");
			ShoppingItemsListResponse shoppinglistresponse = null;
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			
			try {
				modelAndViewObj = new ModelAndView();
				shoppinglistresponse = shoppingListServiceObj.viewShoppingListDetails(customerIdStr,emailIdStr,listId,startIndex,operation);
				modelAndViewObj.addObject("shoppinglistresponse",shoppinglistresponse.getShoppingObj());
				//////System.out.println(shoppinglistresponse);
				List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
				List<String> zones = masterServiceObj.getZonesList(customerIdStr, emailIdStr);
				modelAndViewObj.addObject("zones", zones);
				modelAndViewObj.addObject("categories", categoryList);
				List<BrandMaster> brandsList = genericMasterServiceObj.getBrandDetails("",customerIdStr, emailIdStr,"-1",false);
				modelAndViewObj.addObject("brands", brandsList);
			//	modelAndViewObj.addObject("categeryId",categeryId);
				modelAndViewObj.addObject("categoryId",shoppinglistresponse.getShoppingObj().getItemsList().get(0).getCategoryId());
				modelAndViewObj.addObject("groupId",shoppinglistresponse.getShoppingObj().getItemsList().get(0).getGroupId());
				if(operation.equals("view"))
				{
					
				modelAndViewObj.setViewName("B2C/ShoppingList/viewShoppingListDetails");
				}
			    else
			    {
			    modelAndViewObj.setViewName("B2C/ShoppingList/editShoppingList");
			    }
				
				//////System.out.println(shoppinglistresponse);
				//log.info(shoppinglistresponse);
		
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}




	@RequestMapping("/deleteShoppingList")
			public ModelAndView deleteShoppingList(@RequestParam("ids") String ids,HttpServletRequest request,HttpServletResponse response){
				try{
//					log.info("deleteShoppingList ");
					String maxRecords="10";
					int start = 1,end = Integer.parseInt(maxRecords);
					String index="0";
					
					String resultStr = shoppingListServiceObj.deleteShoppinglists(ids);
					modelAndViewObj =new ModelAndView();
					ShoppingItemsListResponse shoppinglistresponse=shoppingListServiceObj.getShoppingLists("",maxRecords,index);
					 
					modelAndViewObj.addObject("shoppinglistresponse", shoppinglistresponse.getShoppingLists());

					
					
					if(shoppinglistresponse == null || shoppinglistresponse.getShoppingLists()==null || shoppinglistresponse.getShoppingLists().size()==0)
					{
						modelAndViewObj.addObject("totalRecords","0");
						modelAndViewObj.addObject("index", "0");
						modelAndViewObj.addObject("totalValue", "0");
					}else{
						if(shoppinglistresponse.getShoppingLists().size()<Integer.parseInt(maxRecords)){
							end = (shoppinglistresponse.getShoppingLists().size())+(Integer.parseInt(index));
						}else{
							end = (Integer.parseInt(index)+end);
						}
						modelAndViewObj.addObject("totalRecords", shoppinglistresponse.getTotalRecords());
					//	////System.out.println(shoppinglistresponse.getTotalRecords());
						modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
						modelAndViewObj.addObject("totalValue", end);
						//////System.out.println("totalValue"+end);
						modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
						//////System.out.println(Integer.parseInt(maxRecords));
						modelAndViewObj.setViewName("B2C/ShoppingList/viewShoppingList");
					}
					
				}catch(Exception e){
					e.printStackTrace();
				}
				return modelAndViewObj;
			}
					
					

	@RequestMapping("/searchShoppingList")
		public ModelAndView searchShoppingList(@RequestParam("searchName") String searchNameStr,@RequestParam("index")String index,@RequestParam("maxRecords") String maxRecords,HttpServletRequest request,HttpServletResponse response) {
			try{
	    
				int start = 1,end =Integer.parseInt(maxRecords);
			
				
				modelAndViewObj =new ModelAndView();
				ShoppingItemsListResponse shoppinglistresponse=shoppingListServiceObj.getShoppingLists(searchNameStr,maxRecords,index);
				 
				modelAndViewObj.addObject("shoppinglistresponse", shoppinglistresponse.getShoppingLists());

				if(shoppinglistresponse == null || shoppinglistresponse.getShoppingLists()==null || shoppinglistresponse.getShoppingLists().size()==0)
				{
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(shoppinglistresponse.getShoppingLists().size()<Integer.parseInt(maxRecords)){
						end = (shoppinglistresponse.getShoppingLists().size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", shoppinglistresponse.getTotalRecords());
					//////System.out.println(shoppinglistresponse.getTotalRecords());
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
					//////System.out.println("totalValue"+end);
					modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
					//////System.out.println(Integer.parseInt(maxRecords));
					modelAndViewObj.setViewName("B2C/ShoppingList/viewShoppingList");
				}
				
			}catch(Exception e){
				e.printStackTrace();
			}
			return modelAndViewObj;
		}

			@RequestMapping("/newShoppingList")
			public ModelAndView newShoppingList(HttpServletRequest request,HttpServletResponse response){
				String customerIdStr = null,emailIdStr=null;
				try{
//					log.info("newEvent");
					modelAndViewObj = new ModelAndView();
					modelAndViewObj.addObject("type", "new");
					customerIdStr = (String)request.getSession().getAttribute("customerId");
					emailIdStr = (String)request.getSession().getAttribute("emailId");
					List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,"-1");
					List<String> zones = masterServiceObj.getZonesList(customerIdStr, emailIdStr);
					modelAndViewObj.addObject("categories", categoryList);
					modelAndViewObj.addObject("zones", zones);
					
					modelAndViewObj.setViewName("B2C/ShoppingList/newShoppingList");
				}catch(Exception exception){
					exception.printStackTrace();
				}
				return modelAndViewObj;
			}

	@RequestMapping("/viewShoppingList")
			public ModelAndView viewShoppingList(@RequestParam("maxRecords")String maxRecords,HttpServletRequest request,HttpServletResponse response){
				
				int start = 1,end = Integer.parseInt(maxRecords);
				String index="0";
				modelAndViewObj =new ModelAndView();
				ShoppingItemsListResponse shoppinglistresponse=shoppingListServiceObj.getShoppingLists("",maxRecords,index);
				 
				modelAndViewObj.addObject("shoppinglistresponse", shoppinglistresponse.getShoppingLists());

				if(shoppinglistresponse == null || shoppinglistresponse.getShoppingLists()==null || shoppinglistresponse.getShoppingLists().size()==0)
				{
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(shoppinglistresponse.getShoppingLists().size()<Integer.parseInt(maxRecords)){
						end = (shoppinglistresponse.getShoppingLists().size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", shoppinglistresponse.getTotalRecords());
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
					modelAndViewObj.addObject("totalValue", end);
					
				}
				
				modelAndViewObj.setViewName("B2C/ShoppingList/viewShoppingList");
				return modelAndViewObj;
			}
			

	@RequestMapping("/viewFeaturedShops")
	public ModelAndView viewFeaturedShops(@RequestParam("index") String index,@RequestParam("maxRecords") String maxRecords,
			@RequestParam("startDateStr") String startDateStr,
			@RequestParam("endDate") String endDateStr,
			@RequestParam("search") String search,HttpServletRequest request,HttpServletResponse response){
			List<FeaturedRetailer> featuredList = null;
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			try {
				modelAndViewObj = new ModelAndView();
				featuredList = featuredServiceObj.getFeaturedRetailers(customerIdStr,emailIdStr,search,startDateStr,endDateStr,index,maxRecords,"");
				
				if(featuredList == null || featuredList.size() == 0)
				{
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}
				else
				{
					if(featuredList.size()<Integer.parseInt(maxRecords))
					{
						end = (featuredList.size())+(Integer.parseInt(index));
					}
					else
					{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", featuredList.get(0).getTotalRecords());
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
				}
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.addObject("featuredList",featuredList);
				modelAndViewObj.addObject("startDateStr",startDateStr);
				modelAndViewObj.addObject("endDateStr",endDateStr);
				modelAndViewObj.addObject("searchName",search);
				modelAndViewObj.setViewName("B2C/FeaturedShops/featuredShops");
		
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
   
	 @RequestMapping("newFeaturedShopsGroupMaster")
		public ModelAndView newFeaturedShopsGroupMaster(HttpServletRequest request,HttpServletResponse response){
			try{
				modelAndViewObj = new ModelAndView();
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				List<String> zones = masterServiceObj.getZonesList(customerIdStr, emailIdStr);
				modelAndViewObj.addObject("zones", zones);
				
				List<String> workLocationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr,false);
				modelAndViewObj.addObject("workLocationsList", workLocationsList);
				///System.out.println(gson.toJson(workLocationsList));
				
				modelAndViewObj.setViewName("B2C/FeaturedShops/newFeaturedShops");

			}catch(Exception e)
			{
				e.printStackTrace();
			}
			return modelAndViewObj;
			}

	 @RequestMapping(value="/createFeatureRetailers",method=RequestMethod.POST,consumes="application/json")
		public ModelAndView createFeatureRetailers(@RequestBody FeaturedRetailer featureobj,HttpServletRequest request,HttpServletResponse response){
			//////System.out.println(featureobj);
			try{
				modelAndViewObj = new ModelAndView();
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				String resultStr=featuredServiceObj.createFeatureRetailers(featureobj, customerIdStr, emailIdStr);
				if(!resultStr.contains("Success")){
					modelAndViewObj.addObject("err", resultStr);
				}else{
					modelAndViewObj.addObject("success", resultStr);
				}
				
				List<String> zones = masterServiceObj.getZonesList(customerIdStr, emailIdStr);
				modelAndViewObj.addObject("zones", zones);
				
				List<String> workLocationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr,false);
				modelAndViewObj.addObject("workLocationsList", workLocationsList);
				
				modelAndViewObj.setViewName("B2C/FeaturedShops/newFeaturedShops");
				
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
	 
	 
	  @RequestMapping("/viewEditFeaturedRetailer")
		public ModelAndView viewEditFeaturedRetailer(@RequestParam("featuredId")String featuredId,@RequestParam("operation")String operation,HttpServletRequest request,HttpServletResponse response){

			    List<FeaturedRetailer> feturedList = null;
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				try {
				modelAndViewObj = new ModelAndView();
				
				List<String> zones = masterServiceObj.getZonesList(customerIdStr, emailIdStr);
				modelAndViewObj.addObject("zones", zones);
				
				List<String> workLocationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr,false);
				modelAndViewObj.addObject("workLocationsList", workLocationsList);
				
				feturedList = featuredServiceObj.getFeaturedRetailers(customerIdStr,emailIdStr,"","","","","",featuredId);
					
				if(feturedList != null && feturedList.size()>0 && feturedList.get(0) != null)
					modelAndViewObj.addObject("featuredRetailer",feturedList.get(0));
					
					if(operation.equals("view"))
						modelAndViewObj.setViewName("B2C/FeaturedShops/viewFeaturedRetailers");
					else
						modelAndViewObj.setViewName("B2C/FeaturedShops/editFeaturedRetailers");
			
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
	  
	  @RequestMapping(value="/updateFeatureRetailers",method=RequestMethod.POST,consumes="application/json")
		public ModelAndView updateFeatureRetailers(@RequestBody FeaturedRetailer featureobj,HttpServletRequest request,HttpServletResponse response){
			List<FeaturedRetailer> feturedList = null;
			try{
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");

				modelAndViewObj = new ModelAndView();
				List<String> zones = masterServiceObj.getZonesList(customerIdStr, emailIdStr);
				modelAndViewObj.addObject("zones", zones);
				
				List<String> workLocationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr,false);
				modelAndViewObj.addObject("workLocationsList", workLocationsList);
				
				String resultStr = featuredServiceObj.updateNewFeaturedRetailer(featureobj, customerIdStr, emailIdStr);
				
				feturedList = featuredServiceObj.getFeaturedRetailers(customerIdStr,emailIdStr,"","","","","",featureobj.getFeaturedRetailerId());
				
				
				if(feturedList != null && feturedList.size()>0 && feturedList.get(0) != null)
					modelAndViewObj.addObject("featuredRetailer",feturedList.get(0));
				
				if(!resultStr.contains("Success")){
					modelAndViewObj.addObject("err", resultStr);
				}
				
				else{
					modelAndViewObj.addObject("success", resultStr);
				}
				
				modelAndViewObj.setViewName("B2C/FeaturedShops/editFeaturedRetailers");
				
			}catch(Exception exception){
				exception.printStackTrace();
			}
			
			
			return modelAndViewObj;
		}

	  @RequestMapping("/deleteFeaturedRetailer")
		public ModelAndView deleteFeaturedRetailer(@RequestParam("ids")String ids,HttpServletRequest request,HttpServletResponse response){

				String index="0";
				String maxRecords="10";
				String startDateStr="";
				String endDateStr="";
				String search="";
				List<FeaturedRetailer> featuredList = null;
				int start = 1,end = Integer.parseInt(maxRecords);
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				try {
					modelAndViewObj = new ModelAndView();
					String resultStr = featuredServiceObj.deleteFeaturedRetailers(customerIdStr,emailIdStr,ids);
					

					modelAndViewObj = new ModelAndView();
					featuredList = featuredServiceObj.getFeaturedRetailers(customerIdStr,emailIdStr,search,startDateStr,endDateStr,index,maxRecords,"");
					
					if(featuredList == null || featuredList.size() == 0)
					{
						modelAndViewObj.addObject("totalRecords","0");
						modelAndViewObj.addObject("index", "0");
						modelAndViewObj.addObject("totalValue", "0");
					}
					else
					{
						if(featuredList.size()<Integer.parseInt(maxRecords))
						{
							end = (featuredList.size())+(Integer.parseInt(index));
						}
						else
						{
							end = (Integer.parseInt(index)+end);
						}
						modelAndViewObj.addObject("totalRecords", featuredList.get(0).getTotalRecords());
						modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
						modelAndViewObj.addObject("totalValue", end);
					}
					modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
					modelAndViewObj.addObject("featuredList",featuredList);
					modelAndViewObj.addObject("startDateStr",startDateStr);
					modelAndViewObj.addObject("endDateStr",endDateStr);
					modelAndViewObj.addObject("searchName",search);
					modelAndViewObj.setViewName("B2C/FeaturedShops/featuredShops");
			
			
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
	

	@RequestMapping("/viewHomePageGroups")
	public ModelAndView viewHomePageGroups(@RequestParam("index")String index,@RequestParam("maxRecords")String maxRecords,HttpServletRequest request,HttpServletResponse response){
		try{
			int start = 1,end = 10;
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<HomePageGroup> dealsList = outletMasterServiceObj.getHomepagegroupInfo("",customerIdStr, emailIdStr,index,maxRecords,"");
		
			
			modelAndViewObj = new ModelAndView();
			if(dealsList == null || dealsList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(dealsList.size()<10){
					end = (dealsList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", (dealsList.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("dealsList", dealsList);
			modelAndViewObj.addObject("maxRecords", "10");
			modelAndViewObj.setViewName("B2C/homePageGroups/viewHomePageGroups");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}





}
