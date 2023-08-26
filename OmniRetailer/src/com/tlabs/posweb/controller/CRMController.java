package com.tlabs.posweb.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.tlabs.posweb.beans.BillItems;
import com.tlabs.posweb.beans.Billing;
import com.tlabs.posweb.beans.BusinessEnquiry;
import com.tlabs.posweb.beans.Customer;
import com.tlabs.posweb.beans.CustomerAddress;
import com.tlabs.posweb.beans.CustomerComplaints;
import com.tlabs.posweb.beans.CustomerDetails;
//import com.tlabs.posweb.beans.CustomerGiftCoupons;
import com.tlabs.posweb.beans.CustomerGiftVouchers;
import com.tlabs.posweb.beans.CustomerGroupMaster;
import com.tlabs.posweb.beans.CustomerLedger;
import com.tlabs.posweb.beans.CustomerLedgerResponse;
import com.tlabs.posweb.beans.CustomerLoyaltyCards;
import com.tlabs.posweb.beans.CustomerNotification;
import com.tlabs.posweb.beans.CustomerPurchases;
import com.tlabs.posweb.beans.CustomerReferralMaster;
//import com.tlabs.posweb.beans.CustomerSignUp;
import com.tlabs.posweb.beans.CustomerSignUpMaster;
import com.tlabs.posweb.beans.CustomerSubscription;
import com.tlabs.posweb.beans.CustomerWalletLocations;
import com.tlabs.posweb.beans.CustomerWalletMaster;
import com.tlabs.posweb.beans.CustomerWallets;
import com.tlabs.posweb.beans.CustomerWarrenty;
import com.tlabs.posweb.beans.Feedback;
import com.tlabs.posweb.beans.FilterInput;
import com.tlabs.posweb.beans.GiftCouponLocations;
import com.tlabs.posweb.beans.GiftCoupons;
import com.tlabs.posweb.beans.GiftCouponsMaster;
//import com.tlabs.posweb.beans.GiftCouponsResponse;
import com.tlabs.posweb.beans.GiftVoucherLocations;
import com.tlabs.posweb.beans.GiftVoucherMaster;
import com.tlabs.posweb.beans.Group;
import com.tlabs.posweb.beans.LocationBean;
import com.tlabs.posweb.beans.LoyaltyCardMaster;
import com.tlabs.posweb.beans.LoyaltyCards;
import com.tlabs.posweb.beans.LoyaltyPurchaseRanges;
import com.tlabs.posweb.beans.LoyaltyZones;
import com.tlabs.posweb.beans.MasterDataImportsAndExportsBean;
import com.tlabs.posweb.beans.MembershipLocations;
import com.tlabs.posweb.beans.MembershipMaster;
//import com.tlabs.posweb.beans.OrderedItems;
import com.tlabs.posweb.beans.ProductCategoryBean;
import com.tlabs.posweb.beans.TenderMaster;
//import com.tlabs.posweb.beans.PurchaseOrderBean;
import com.tlabs.posweb.beans.ZoneMaster;
import com.tlabs.posweb.init.AppProperties;
import com.tlabs.posweb.services.AdminService;
import com.tlabs.posweb.services.BillingService;
import com.tlabs.posweb.services.CustomerService;
import com.tlabs.posweb.services.FeedbackService;
import com.tlabs.posweb.services.GenericMasterService;
import com.tlabs.posweb.services.LoyaltyCardService;
import com.tlabs.posweb.services.MasterService;
import com.tlabs.posweb.services.OutletMasterService;
import com.tlabs.posweb.services.WarrantService;
import com.tlabs.posweb.util.Constants;
//import com.tlabs.posweb.util.Utilities;
import com.tlabs.posweb.util.RestfulServiceConnection;
import com.tlabs.posweb.util.Utilities;

@Controller
@RequestMapping(value = "/crm")
public class CRMController {
	
	private ModelAndView modelAndViewObj;
	//private static Logger log = Logger.getLogger(CRMController.class);
	@Autowired
	private OutletMasterService outletMasterServiceObj;
	@Autowired
    private CustomerService customerServiceObj;
	@Autowired
	private LoyaltyCardService loyaltyCardServiceObj;
	@Autowired
	private MasterService masterServiceObj;
	@Autowired
	private AdminService adminServiceObj;
	@Autowired
	private WarrantService warrentyServiceObj;
	@Autowired
	private FeedbackService feedbackServiceObj;
	@Autowired
	private BillingService billingServiceObj;
	@Autowired
    private GenericMasterService genericMasterServiceObj;
	@Autowired
    private Gson gson;
	
	/**
	 * @author Mythri.S
	 * @param request
	 * @param response
	 * @return returns a jsp which displays all the icons of outlet management flow
	 */
	@RequestMapping("/showCRMFlow")
	public ModelAndView showCRMFlow(HttpServletRequest request,HttpServletResponse response){
		// log.info("showCRMFlow");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("CRM/CRMFlow");
		return modelAndViewObj;
	}
	
	/**
	 * @author Mythri.S
	 * @param request
	 * @param response
	 * @return returns a jsp which displays all the icons of loyalty program flow
	 */
	@RequestMapping("/showLoyaltyFlow")
	public ModelAndView showLoyaltyFlow(HttpServletRequest request,HttpServletResponse response){
		// log.info("InventoryManagerController - showLoyaltyFlow");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("CRM/loyaltyFlow");
		return modelAndViewObj;
	}
	
	/**
	
	 * manasa
	
	 **/
	
	
	@RequestMapping("/searchCouponIds")
	public @ResponseBody List<String> searchCouponIds(@RequestParam("searchName") String searchNameStr, HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<String> couponRefsList = new ArrayList<String>();
		try{
			// log.info("searchCouponeRef");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			couponRefsList = loyaltyCardServiceObj.getGiftCouponsForSearch("",customerIdStr, emailIdStr, "0");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return couponRefsList;
	}
	
	/*manasa
	*/

	@RequestMapping("/viewEditCustomerReferral")
	public ModelAndView viewEditCustomerReferral(@RequestParam("referralId") String referralId, @RequestParam("maxRecords") String maxRecords,@RequestParam("searchName")String searchName,@RequestParam("operation") String operation, HttpServletRequest request,HttpServletResponse response) {
		CustomerReferralMaster filterInputObj = new CustomerReferralMaster();
		try{
			// log.info("editCategory ");
			filterInputObj.setReferralProgramId(referralId);
			filterInputObj.setStartIndex("0");
			filterInputObj.setMaxRecords(maxRecords);
//			String customerIdStr = (String)request.getSession().getAttribute("customerId");
//			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<CustomerReferralMaster> customerReferralMaster = customerServiceObj.getCustomerReferral(filterInputObj);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("customerReferralMaster", customerReferralMaster.get(0));
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);
			if(operation.equals("view"))
				modelAndViewObj.setViewName("CRM/CustomerReferrals/viewCustomerReferral");
			else	
				modelAndViewObj.setViewName("CRM/CustomerReferrals/editCustomerReferral");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	/*manasa
	*/

	@RequestMapping(value="/createCustomerReferral" ,method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createCustomerReferral(@RequestBody CustomerReferralMaster customerReferralMaster ,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("saveCategory ");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = customerServiceObj.createCustomerReferral(customerReferralMaster,customerIdStr,emailIdStr);
			modelAndViewObj = new ModelAndView();
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("REFERRAL_CREATED_SUCCESS").trim())){
				modelAndViewObj.addObject("customerReferralMaster", customerReferralMaster);
				modelAndViewObj.addObject("err", resultStr);
			}else
				modelAndViewObj.addObject("success", resultStr);
			
			modelAndViewObj.setViewName("CRM/CustomerReferrals/newCustomerReferral");
	
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	/*
	@RequestMapping(value="/createCustomerSignup" ,method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createCustomerSignup(@ModelAttribute("signup")CustomerSignUp signup ,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("saveCategory ");
			////////////System.out.println("dgsdf");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = customerServiceObj.createCustomerSignup(signup,customerIdStr,emailIdStr);
			modelAndViewObj = new ModelAndView();
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("SIGNUP_CREATED_SUCCESS").trim())){
				modelAndViewObj.addObject("customerReferralMaster", signup);
				modelAndViewObj.addObject("err", resultStr);
			}else
				modelAndViewObj.addObject("success", resultStr);
			
			modelAndViewObj.setViewName("CRM/CustomerReferrals/newSignUp");
	
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	*/
	
	/*manasa
	*/

	@RequestMapping(value="/updateCustomerSignUp" ,method=RequestMethod.POST)
	public ModelAndView updateCustomerSignUp(@RequestParam("formData") String formData  ,HttpServletRequest request,HttpServletResponse response){
		CustomerSignUpMaster custReferral = new CustomerSignUpMaster();
		try{
			// log.info("updateCustomerReferral");
            CustomerSignUpMaster signup = null;
			
			signup = gson.fromJson(formData,CustomerSignUpMaster.class);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = customerServiceObj.updateCustomerSignUp(signup,customerIdStr,emailIdStr);
			modelAndViewObj = new ModelAndView();
			custReferral.setCampaignId(signup.getCampaignId());
			custReferral.setStartIndex("0");
			custReferral.setMaxRecords("10");
			List<CustomerSignUpMaster> customerReferralMasterDetails = customerServiceObj.getCustomersignup(custReferral);
			if(resultStr.equals(AppProperties.getAppMessageByProperty("SIGNUP_UPDATE_SUCCESS").trim())){
//				modelAndViewObj.setViewName("CRM/CustomerReferrals/editCustomerReferral");
//				modelAndViewObj.addObject("customerReferralMaster", customerReferralMaster);
				modelAndViewObj.addObject("success", resultStr);
			}else{
//			modelAndViewObj.setViewName("CRM/CustomerReferrals/editCustomerReferral");
			modelAndViewObj.addObject("err", resultStr);
			}
			modelAndViewObj.addObject("customerSignup", customerReferralMasterDetails.get(0));
			modelAndViewObj.setViewName("CRM/CustomerReferrals/editSignup");
//			modelAndViewObj.setViewName("CRM/CustomerReferrals/newCustomerReferral");
	
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/*manasa
	*/

	@RequestMapping(value="/createCustomerSignup" ,method=RequestMethod.POST)
	public ModelAndView createCustomerSignup(@RequestParam("formData") String formData ,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("saveCategory ");
		System.out.println(formData);
			CustomerSignUpMaster signup = null;
			
			signup = gson.fromJson(formData,CustomerSignUpMaster.class);
			
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = customerServiceObj.createCustomerSignup(signup,customerIdStr,emailIdStr);
			modelAndViewObj = new ModelAndView();
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("SIGNUP_CREATED_SUCCESS").trim())){
				modelAndViewObj.addObject("customerSignup", signup);
				modelAndViewObj.addObject("err", resultStr);
			}else
				modelAndViewObj.addObject("success", resultStr);
			
			modelAndViewObj.setViewName("CRM/CustomerReferrals/newSignUp");
	
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/*manasa
	*/

	@RequestMapping("/viewEditCustomerSignup")
	public ModelAndView viewEditCustomerSignup(@RequestParam("campignId") String campignId, @RequestParam("maxRecords") String maxRecords,@RequestParam("searchName")String searchName,@RequestParam("operation") String operation, HttpServletRequest request,HttpServletResponse response) {
		CustomerSignUpMaster filterInputObj = new CustomerSignUpMaster();
		try{
			// log.info("editCategory ");
			filterInputObj.setCampaignId(campignId);
			filterInputObj.setStartIndex("0");
			filterInputObj.setMaxRecords(maxRecords);
//			String customerIdStr = (String)request.getSession().getAttribute("customerId");
//			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<CustomerSignUpMaster> customerReferralMaster = customerServiceObj.getCustomersignup(filterInputObj);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("customerSignup", customerReferralMaster.get(0));
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);
			if(operation.equals("view"))
				modelAndViewObj.setViewName("CRM/CustomerReferrals/viewCustomerSignup");
			else	
				modelAndViewObj.setViewName("CRM/CustomerReferrals/editSignup");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	
	/*manasa
	*/

	@RequestMapping(value="/updateCustomerReferral" ,method=RequestMethod.POST,consumes="application/json")
	public ModelAndView updateCustomerReferral(@RequestBody CustomerReferralMaster customerReferralMaster ,HttpServletRequest request,HttpServletResponse response){
		CustomerReferralMaster custReferral = new CustomerReferralMaster();
//		FilterInput filterInput = new FilterInput();
		try{
			// log.info("updateCustomerReferral");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = customerServiceObj.updateCustomerReferral(customerReferralMaster,customerIdStr,emailIdStr);
			modelAndViewObj = new ModelAndView();
			custReferral.setReferralProgramId(customerReferralMaster.getReferralProgramId());
			custReferral.setStartIndex("0");
			custReferral.setMaxRecords("10");
			List<CustomerReferralMaster> customerReferralMasterDetails = customerServiceObj.getCustomerReferral(custReferral);
			
			if(resultStr.equals(AppProperties.getAppMessageByProperty("REFERRAL_UPDATE_SUCCESS").trim())){
//				modelAndViewObj.setViewName("CRM/CustomerReferrals/editCustomerReferral");
//				modelAndViewObj.addObject("customerReferralMaster", customerReferralMaster);
				modelAndViewObj.addObject("success", resultStr);
			}else{
//			modelAndViewObj.setViewName("CRM/CustomerReferrals/editCustomerReferral");
			modelAndViewObj.addObject("err", resultStr);
			}
			modelAndViewObj.addObject("customerReferralMaster", customerReferralMasterDetails.get(0));
			modelAndViewObj.setViewName("CRM/CustomerReferrals/editCustomerReferral");
//			modelAndViewObj.setViewName("CRM/CustomerReferrals/newCustomerReferral");
	
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	

	
	
	@RequestMapping("/viewCustomers")
	public ModelAndView viewCustomers(@RequestParam("outletlocation") String outletlocationStr,HttpServletRequest request,HttpServletResponse response) {
//		List<String> locationsList = null;
		ArrayList<LocationBean> locationsList = null;
		List<String> locationsListValue = null;
		//String location="";
		try{
    		// log.info("viewCustomers called");
    		String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,Constants.PAGINATION_START_INDEX);
			FilterInput filterInputObj = new FilterInput();
			filterInputObj.setStartIndex("0");
			filterInputObj.setMaxRecords("10");
			
			locationsListValue=new ArrayList<String>();
			locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			//Added by vijay, to make default loaction as location list first occurrence, if location is empty
			//locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
//			locationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr, false);
//			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
			/*if((location.trim()).equals(null) || location.trim().isEmpty())
			{
				location = locationsList.get(0);
			}
			*/
			
			List<CustomerGroupMaster> groupsList = customerServiceObj.getCustomerGroupDetails("",customerIdStr, emailIdStr,"-1","",true, false,"","","","");
			
			
			
			/*
			 * if(outletlocationStr.equals("") || outletlocationStr.equals("all")){
			 * if(locationsList != null){ for(int i=0;i<locationsList.size();i++){
			 * locationsListValue.add(locationsList.get(i).getLocationId());
			 * 
			 * } } filterInputObj.setLocationsList(locationsListValue); } else
			 */
			filterInputObj.setStoreLocation(outletlocationStr);
			List<CustomerDetails> customerDetailsList = customerServiceObj.getCustomerList(filterInputObj, customerIdStr, emailIdStr);
			int start = 1,end = 10;
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("locationsList", locationsList);
            modelAndViewObj.addObject("groupsList", groupsList);
			if(customerDetailsList == null || customerDetailsList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(customerDetailsList.size()<10)
					end = customerDetailsList.size();
				modelAndViewObj.addObject("totalRecords", customerDetailsList.get(0).getTotalRecords());
				modelAndViewObj.addObject("index", start);
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("maxRecords", 10);
    		modelAndViewObj.addObject("customerDetailsList",customerDetailsList);
    		modelAndViewObj.addObject("categoryList",categoryList);
    		modelAndViewObj.addObject("storeLocation",outletlocationStr);
    		modelAndViewObj.setViewName("CRM/CustomerViewAndNoification/customerView");
    	}catch(Exception e){
    	  e.printStackTrace();	
    	}
    	return modelAndViewObj;
	}
	
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 1-oct-2015
	 * Reviewed By : Siva Sir on 5-oct-2015 
	 * 
	 * This method is used to get the list of customers based on the filters given by the user.
	 * This list of customers is added to model object and returns a JSP. 
	 *
	 *
	 **/
	@RequestMapping(value = "/getCustomers",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView getCustomers(@RequestBody FilterInput filterInputObj,HttpServletRequest request,HttpServletResponse response) {
//		List<String> locationsList = null;
		try{
			// log.info("getCustomers");
//		List<String> locationsListValue=new ArrayList<String>();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
//			ArrayList<LocationBean>	locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			ArrayList<LocationBean>	locationsList = new ArrayList<LocationBean>(); 

			if( filterInputObj.getZoneID() == null ||  filterInputObj.getZoneID().equals(""))
				locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
				else
				{
					List<ZoneMaster> zoneList = genericMasterServiceObj.getZonalLocationBasedonZone( filterInputObj.getZoneID(), customerIdStr, emailIdStr, "0","","","Retail Outlet");
					LocationBean saleLocation = null;
					/*if(zoneList != null && zoneList.get(0).getZoneDetails() != null && zoneList.get(0).getZoneDetails().size()>0)
						for(ZoneDetails zoneItems : zoneList.get(0).getZoneDetails() )
						{
							saleLocation = new LocationBean(); 
							saleLocation.setLocationId(zoneItems.getLocation());
							locationBeansList.add(saleLocation);
						}
					else*/
					for(String zoneItems : zoneList.get(0).getZones() )
					{
						String zoneArray[] = zoneItems.split("\\+");
						saleLocation = new LocationBean(); 
						if(zoneArray != null && zoneArray.length>0)
						{
							saleLocation.setLocationId(zoneArray[0]);
							if(zoneArray.length > 1)
							saleLocation.setBusinessActivity(zoneArray[1]);
							if(zoneArray.length > 2)
							saleLocation.setDescription(zoneArray[2]);
							locationsList.add(saleLocation);
						} 
					}
				
				}
			
			/*if(filterInputObj.getStoreLocation().equals("") || filterInputObj.getStoreLocation().equals("all")){
				if(locationsList != null){
					for(int i=0;i<locationsList.size();i++){
						locationsListValue.add(locationsList.get(i).getLocationId());
							
					}
				}
			filterInputObj.setLocationsList(locationsListValue);
			}
			else
			filterInputObj.setStoreLocation(filterInputObj.getStoreLocation());*/
			
			if(filterInputObj.getLocationsList() != null && filterInputObj.getLocationsList().size()>0) {
				filterInputObj.setLocationsList(null);
				filterInputObj.setStoreLocation("");
			}
			
			
			
			List<CustomerDetails> customerDetailsList = customerServiceObj.getCustomerList(filterInputObj, customerIdStr, emailIdStr);
			int start = 1,end = Integer.parseInt(filterInputObj.getMaxRecords());
			modelAndViewObj = new ModelAndView();
		//	locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
//			locationsList = adminServiceObj.getOutletLocationsList(customerIdStr,emailIdStr,false);
//			locationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr, emailIdStr, false);
			if(customerDetailsList == null || customerDetailsList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(customerDetailsList.size()<Integer.parseInt(filterInputObj.getMaxRecords())){
					end = (customerDetailsList.size())+(Integer.parseInt(filterInputObj.getStartIndex()));
				}else{
					end = (Integer.parseInt(filterInputObj.getStartIndex())+end);
				}
				modelAndViewObj.addObject("totalRecords", customerDetailsList.get(0).getTotalRecords());
				modelAndViewObj.addObject("filepath", customerDetailsList.get(0).getFilePath());
				modelAndViewObj.addObject("index", (Integer.parseInt(filterInputObj.getStartIndex())+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("locationsList", locationsList);
			modelAndViewObj.addObject("zone", filterInputObj.getZoneID());
			modelAndViewObj.addObject("storeLocation", filterInputObj.getStoreLocation());
			modelAndViewObj.addObject("searchName", filterInputObj.getSearchCriteria());
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(filterInputObj.getMaxRecords()));
			modelAndViewObj.addObject("customerDetailsList",customerDetailsList);
			modelAndViewObj.setViewName("CRM/CustomerViewAndNoification/customerDetails");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 5-oct-2015
	 * 
	 * This method is used to send notification to the customers.
	 * It accepts various filters based on which the customers are selected.
	 *
	 *
	 **/
	@RequestMapping(value = "/sendNotification",method=RequestMethod.POST,consumes="application/json")
	public @ResponseBody String  sendNotification(@RequestBody FilterInput filterInputObj,HttpServletRequest request,HttpServletResponse response) {
		String result = "";
		try{
			// log.info("sendNotification");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			result =  customerServiceObj.sendNotification(filterInputObj, customerIdStr, emailIdStr);
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping("/newCustomer")
	public ModelAndView newCustomer(HttpServletRequest request,HttpServletResponse response) {
    	try{
    		// log.info("newCustomer called");
			modelAndViewObj = new ModelAndView();
			List<Integer> numbersList = new ArrayList<Integer>();
			List<CustomerAddress> addressList = new ArrayList<CustomerAddress>(); 
			for(int i = 0;i<4;i++)
				addressList.add(new CustomerAddress());
			modelAndViewObj.addObject("addressList",addressList);
			for(int i = 15; i<100;i++)
				numbersList.add(i);
			modelAndViewObj.addObject("numbersList",numbersList);
    		modelAndViewObj.setViewName("CRM/CustomerViewAndNoification/newCustomer");
    	}catch(Exception e){
    	  e.printStackTrace();	
    	}
    	return modelAndViewObj;
	}
	
	
	
	@RequestMapping(value="/createCustomer",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createCustomer(@RequestBody Customer customerObj,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("createCustomer");
			String resultStr = customerServiceObj.createCustomer(customerObj);
			modelAndViewObj = new ModelAndView();
			List<Integer> numbersList = new ArrayList<Integer>();
			for(int i = 15; i<100;i++)
				numbersList.add(i);
			List<CustomerAddress> addressList = new ArrayList<CustomerAddress>(); 
			modelAndViewObj.addObject("numbersList",numbersList);
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("CUSTOMER_CREATE_SUCCESS").trim())){
				modelAndViewObj.addObject("customerObj", customerObj);
				if(customerObj.getAddressList() != null)
					addressList = customerObj.getAddressList();
				for(int i = addressList.size();i<4;i++)
					addressList.add(new CustomerAddress());
				modelAndViewObj.addObject("err", resultStr);
//				modelAndViewObj.addObject("type", "new");
			}else{
				for(int i = 0;i<4;i++)
					addressList.add(new CustomerAddress());
				modelAndViewObj.addObject("success", resultStr);
			}
			modelAndViewObj.addObject("addressList",addressList);
			modelAndViewObj.setViewName("CRM/CustomerViewAndNoification/newCustomer");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	@RequestMapping("/editCustomerDetails")
	public ModelAndView editCustomerDetails(@RequestParam("phone")String phone,@RequestParam("operation")String operation, HttpServletRequest request,HttpServletResponse response) {
    	try{
    		// log.info("editCustomerDetails called");
    		Customer customerObj = customerServiceObj.getCustomerDetails(phone);
			modelAndViewObj = new ModelAndView();
			List<Integer> numbersList = new ArrayList<Integer>();
			for(int i = 15; i<100;i++)
				numbersList.add(i);
			List<CustomerAddress> addressList = new ArrayList<CustomerAddress>(); 
			if(customerObj.getAddressList() != null)
				addressList = customerObj.getAddressList();
			for(int i = addressList.size();i<4;i++)
				addressList.add(new CustomerAddress());
			customerObj.setFamilySize(customerObj.getFamilySizeStr());
			modelAndViewObj.addObject("numbersList",numbersList);
			modelAndViewObj.addObject("customerObj", customerObj);
			modelAndViewObj.addObject("addressList",addressList);
			if(operation.equals("view"))
				modelAndViewObj.setViewName("CRM/CustomerViewAndNoification/viewCustomer");
			else
				modelAndViewObj.setViewName("CRM/CustomerViewAndNoification/editCustomer");
    	}catch(Exception e){
    	  e.printStackTrace();	
    	}
    	return modelAndViewObj;
	}
	
	@RequestMapping(value="/updateCustomer",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView updateCustomer(@RequestBody Customer customerObj,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("updateCustomer");
			String resultStr = customerServiceObj.updateCustomer(customerObj);
			modelAndViewObj = new ModelAndView();
			List<Integer> numbersList = new ArrayList<Integer>();
			for(int i = 15; i<100;i++)
				numbersList.add(i);
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("CUSTOMER_UPDATE_SUCCESS").trim())){
				modelAndViewObj.addObject("err", resultStr);
			}else{
				modelAndViewObj.addObject("success", resultStr);
			}
			customerObj.setMobileNumber(customerObj.getPhoneNumber());
			List<CustomerAddress> addressList = new ArrayList<CustomerAddress>();
			if(customerObj.getAddressList() != null)
				addressList = customerObj.getAddressList();
			for(int i = addressList.size();i<4;i++)
				addressList.add(new CustomerAddress());
			modelAndViewObj.addObject("numbersList",numbersList);
			modelAndViewObj.addObject("addressList",addressList);
			modelAndViewObj.addObject("customerObj", customerObj);
			modelAndViewObj.setViewName("CRM/CustomerViewAndNoification/editCustomer");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display the newGiftVoucher form 
	 *
	 **/
	@RequestMapping("/newGiftVoucher")
	public ModelAndView newGiftVoucher(HttpServletRequest request,HttpServletResponse response){
		
		try{
			// log.info("newGiftVoucher ");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			
			ArrayList<TenderMaster> tenderDetails = genericMasterServiceObj.getTender("",customerIdStr,emailIdStr,"-1",100);
			
			if(tenderDetails != null && tenderDetails.size() > 0)
			modelAndViewObj.addObject("tenderDetails",tenderDetails);
			
			List<Group> groupsList = outletMasterServiceObj.getProductGroupDetails("",customerIdStr, emailIdStr,"-1","",true);
			if(groupsList != null && groupsList.size() != 0){
				modelAndViewObj.addObject("groupsList", groupsList);
				
			}
			
			
			modelAndViewObj.setViewName("CRM/LoyaltyPrograms/GiftVouchers/newGiftVouchers");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/** 
	 * @author Mythri.S
	 * 
	 *This method is used to display all the gift voucher details in a tabular form
	 *
	 **/
	
	@RequestMapping("/viewGiftVouchers")
	public ModelAndView viewGiftVouchers(
			@RequestParam("index")String index, 
			@RequestParam("maxRecords")String maxRecords, 
			HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewGiftVouchers ");
			int start = 1,end = 10;
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<GiftVoucherMaster> list_giftVoucher= loyaltyCardServiceObj.getGiftVouchers("",maxRecords,customerIdStr, emailIdStr,index,"");
			modelAndViewObj = new ModelAndView();
			if(list_giftVoucher == null || list_giftVoucher.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(list_giftVoucher.size()<10){
					end = (list_giftVoucher.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(list_giftVoucher.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("maxRecords", maxRecords);
			modelAndViewObj.addObject("giftVouchersList", list_giftVoucher);
			modelAndViewObj.setViewName("CRM/LoyaltyPrograms/GiftVouchers/giftVouchers");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * modified by :manasa
	 * 
	 *This method is used to save the details of the Gift Vouchers
	 *
	 **//*
	@RequestMapping(value="/createGiftVouchers",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createGiftVouchers(@RequestBody GiftVoucherMaster giftVoucherMaster,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("createGiftVouchers");
			List<String> locationList = new ArrayList<String>();
			String result;
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			result = loyaltyCardServiceObj.createGiftVouchers(giftVoucherMaster,customerId,emailId);
			modelAndViewObj = new ModelAndView();
			
			String states[]=  giftVoucherMaster.getStates().split(",");
			java.util.Set<String> statesSelectedList = new java.util.LinkedHashSet<String>(java.util.Arrays.asList(states));
			
			//modified by manasa
			if(!result.equals(AppProperties.getAppMessageByProperty("GIFTVOUCHERS_CREATE_SUCCESS").trim())){
				locationList = adminServiceObj.getLocationsListByStates(giftVoucherMaster.getStates(),customerId, emailId);
				modelAndViewObj.addObject("locationList", locationList);
				modelAndViewObj.addObject("giftVoucher", giftVoucherMaster);
				modelAndViewObj.addObject("statesList", statesSelectedList);
				modelAndViewObj.addObject("err", result);
			}else
				modelAndViewObj.addObject("success", result);
			
		//	modelAndViewObj.addObject("err", result);
			modelAndViewObj.setViewName("CRM/LoyaltyPrograms/GiftVouchers/newGiftVouchers");
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
	 *This method is used to display the Gift Voucher Details based on the voucherProgramCode  
	 *
	 **/
	@RequestMapping("/viewGiftVoucherDetails")
	public ModelAndView viewGiftVoucherDetails(
			@RequestParam("id")String voucherProgramCode,
			@RequestParam("operation")String operation,
			HttpServletRequest request,HttpServletResponse response){
		try{
			String zonestr="";
			// log.info("viewGiftVoucherDetails ");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			
            ArrayList<TenderMaster> tenderDetails = genericMasterServiceObj.getTender("",customerIdStr,emailIdStr,"-1",100);
			if(tenderDetails != null && tenderDetails.size() > 0)
			modelAndViewObj.addObject("tenderDetails",tenderDetails);
			
			List<Group> groupsList = outletMasterServiceObj.getProductGroupDetails("",customerIdStr, emailIdStr,"-1","",true);
			if(groupsList != null && groupsList.size() != 0){
				modelAndViewObj.addObject("groupsList", groupsList);
			}
			
			List<GiftVoucherMaster> list_giftVoucher= loyaltyCardServiceObj.getGiftVouchers(voucherProgramCode,"10",customerIdStr, emailIdStr,"0","");
			System.out.println(gson.toJson(list_giftVoucher));
			List<String> zones  = new ArrayList<String>();
			List<String> locations  = new ArrayList<String>();
			if(list_giftVoucher == null || list_giftVoucher.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}
			else
			{
				if(list_giftVoucher.get(0).getVouchersLocaionsList() != null)
				for (GiftVoucherLocations loyalityZone : list_giftVoucher.get(0).getVouchersLocaionsList()) 
				{
					zones.add(loyalityZone.getZone_id());
					locations.add(loyalityZone.getValidLocation());
					
				}
		
				
			
				for(String string:zones)
				{
//					zonestr=zoneStr+zonestr+",";
					zonestr = zonestr+string+",";
				}
				
				int end = 0;
				if(list_giftVoucher.get(0).getQuantity() != null )
				{
					if((list_giftVoucher.get(0).getQuantity()) < 10){
						end = (list_giftVoucher.size());
					}else{
						end = 10;
					}
				}
				
				if(list_giftVoucher.get(0).isPaid()==true )
				{
					list_giftVoucher.get(0).setIsPaidFlag("true");
				}
				else
				{
					list_giftVoucher.get(0).setIsPaidFlag("false");
				}
				
				Set<String> locationsbasedzone = genericMasterServiceObj.getlocationsBasedOnZone(zonestr,customerIdStr, emailIdStr, "0","","");
				ArrayList<LocationBean> locationDetails = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,false,true);
				
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(list_giftVoucher.get(0).getTotalRecords()));

				modelAndViewObj.addObject("index", 1);
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("locationDetails", locationDetails);
		    	modelAndViewObj.addObject("locationsbasedzone",locationsbasedzone);
			}
			modelAndViewObj.addObject("giftVoucher", list_giftVoucher.get(0));
			modelAndViewObj.addObject("maxRecords", 10);
			
			
			if(zones != null && zones.size()>0)
				modelAndViewObj.addObject("zones", new java.util.LinkedHashSet<String>(zones));
			if(locations != null && locations.size()>0)
				modelAndViewObj.addObject("locationList", new java.util.LinkedHashSet<String>(locations));
			
	
			
			if(operation.equalsIgnoreCase("edit"))
				modelAndViewObj.setViewName("CRM/LoyaltyPrograms/GiftVouchers/editGiftVouchers");
			else
				modelAndViewObj.setViewName("CRM/LoyaltyPrograms/GiftVouchers/viewGiftVouchers");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	

/**
 * 
 * @author: Vijay
 * @WrittenDate : 10-22-2018
 * @Description : this method search Gift vouchers
 *
 **/

@RequestMapping("/searchGiftVouchers")
public ModelAndView searchGiftVouchers(
		@RequestParam("searchCriteria") String searchCriteria,
		@RequestParam("maxRecords") String maxRecords,
		@RequestParam("index") String index,
		@RequestParam("voucherProgramCode") String voucherProgramCode,
		@RequestParam("saveFlag") boolean saveFlag,@RequestParam("actionTest") String actionTest,

		HttpServletRequest request,HttpServletResponse response){

	try{
		// log.info("editLoyaltyCardDetails ");
		//GenericMasterService genericMasterServiceObj = new GenericMasterService();
		int start = 1,end = Integer.parseInt(maxRecords);
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		GiftVoucherMaster masterObj= loyaltyCardServiceObj.getGiftVouchersForSearchCriteria(voucherProgramCode,customerIdStr, emailIdStr,index,searchCriteria,maxRecords, saveFlag);
		List<CustomerGiftVouchers> list_vouchers = masterObj.getGiftVouchersChildList();
		modelAndViewObj = new ModelAndView();
		if(list_vouchers== null ){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(list_vouchers.size()<Integer.parseInt(maxRecords)){
				end = (list_vouchers.size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			modelAndViewObj.addObject("totalRecords", masterObj.getTotalRecords());
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
		}
		//////////////System.out.println(list_loyaltyCardMaster.get(0).getTotalLoyaltyCards());
		//////////////System.out.println(Integer.parseInt(list_loyaltyCardMaster.get(0).getTotalRecords()));

		modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
		modelAndViewObj.addObject("searchCriteria", searchCriteria);
		modelAndViewObj.addObject("giftVoucher", masterObj);
		modelAndViewObj.addObject("actionTest", actionTest);

		modelAndViewObj.setViewName("CRM/LoyaltyPrograms/GiftVouchers/vouchersItemDetails");
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}
	/**
	 * 
	 * @author Mythri.S
	 * modified by :manasa
	 * 
	 *This method is used to save the details of the Gift Vouchers
	 *
	 **/
	@RequestMapping(value="/createGiftVouchers",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createGiftVouchers(
			@RequestBody GiftVoucherMaster voucher,
			 HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("createGiftVouchers");
//			List<String> locationList = new ArrayList<String>();
			String result;
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			
			/*		Written by: Manideep
			Reason: To add the is paid flag */
			
			if(voucher.getIsPaidFlag().equals("true"))
			{
				voucher.setPaid(true);
			}
			else{
				voucher.setPaid(false);
			}
			
			
			/*		Written by: koti
			Reason: To add the is otp flag */
			
			if(voucher.getIsOTPFlag().equals("true"))
			{
				voucher.setOtp_requirement(true);
			}
			else{
				voucher.setOtp_requirement(false);
			}
			
			result = loyaltyCardServiceObj.createGiftVouchers(voucher,customerId,emailId);
			modelAndViewObj = new ModelAndView();
			
			if(!result.equals(AppProperties.getAppMessageByProperty("GIFTVOUCHERS_CREATE_SUCCESS").trim())){
				
				modelAndViewObj.addObject("giftVoucher", voucher);
				modelAndViewObj.addObject("err", result);
			}else
				modelAndViewObj.addObject("success", result);
			
			modelAndViewObj.setViewName("CRM/LoyaltyPrograms/GiftVouchers/newGiftVouchers");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	

/**
	 * 
	 * @author Vijay
	 * 
	 *This method is used to save the details of the Gift Vouchers
	 *
	 **/
	@RequestMapping(value="/updateGiftVouchers",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView updateGiftVouchers(@RequestBody GiftVoucherMaster giftVoucherMaster,HttpServletRequest request,HttpServletResponse response) {
		try{
			
			
//			List<String> locationList = new ArrayList<String>();
			String result;
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			List<String> zones  = new ArrayList<String>();
			List<String> locations  = new ArrayList<String>();
			String zonestr ="";
			
			/*		Written by: Manideep
			Reason: To add the is paid flag */		
			if(giftVoucherMaster.getIsPaidFlag().equals("true"))
			{
				giftVoucherMaster.setPaid(true);
			}
			else{
				giftVoucherMaster.setPaid(false);
			}
			/*		Written by: koti
			Reason: To add the is otp flag */
			
			if(giftVoucherMaster.getIsOTPFlag().equals("true"))
			{
				giftVoucherMaster.setOtp_requirement(true);
			}
			else{
				giftVoucherMaster.setOtp_requirement(false);
			}
			
			List<String> myList1 = new ArrayList<String>(Arrays.asList(giftVoucherMaster.getVoucheridsStr().split(",")));
			giftVoucherMaster.setVoucherids(myList1);
			
			
			giftVoucherMaster.setVoucheridsStr("");
			
			result = loyaltyCardServiceObj.updateGiftVouchers(giftVoucherMaster,customerId,emailId);
			modelAndViewObj = new ModelAndView();
			
			ArrayList<TenderMaster> tenderDetails = genericMasterServiceObj.getTender("",customerId,emailId,"-1",100);
			if(tenderDetails != null && tenderDetails.size() > 0)
			modelAndViewObj.addObject("tenderDetails",tenderDetails);
			
			List<Group> groupsList = outletMasterServiceObj.getProductGroupDetails("",customerId, emailId,"-1","",true);
			if(groupsList != null && groupsList.size() != 0){
				modelAndViewObj.addObject("groupsList", groupsList);
			}
			
		
			if(!result.equals(AppProperties.getAppMessageByProperty("GIFTVOUCHERS_UPDATE_SUCCESS").trim())){
				
				modelAndViewObj.addObject("giftVoucher", giftVoucherMaster);
				
				modelAndViewObj.addObject("err", result);
			}
			else
				modelAndViewObj.addObject("success", result);
			
			
			
			
			
			List<GiftVoucherMaster> list_giftVoucher= loyaltyCardServiceObj.getGiftVouchers(giftVoucherMaster.getVoucherProgramCode(),"10",customerId, emailId,"0","");
			//modelAndViewObj = new ModelAndView();
			if(list_giftVoucher == null || list_giftVoucher.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}
			else
			{
				if(list_giftVoucher.get(0).getVouchersLocaionsList() != null)
				for (GiftVoucherLocations loyalityZone : list_giftVoucher.get(0).getVouchersLocaionsList()) 
				{
					zones.add(loyalityZone.getZone_id());
					locations.add(loyalityZone.getValidLocation());
				}
		
				for(String string:zones)
				{
					zonestr = zonestr+string+",";
				}
				
				int end = 0;
				if(list_giftVoucher.get(0).getQuantity() != null )
				{
					if((list_giftVoucher.get(0).getQuantity()) < 10){
						end = (list_giftVoucher.size());
					}else{
						end = 10;
					}
				}
				
				Set<String> locationsbasedzone = genericMasterServiceObj.getlocationsBasedOnZone(zonestr,customerId, emailId, "0","","");
				ArrayList<LocationBean> locationDetails = genericMasterServiceObj.getLocationDetails("",customerId, emailId,"-1","",false,false,true);
				
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(list_giftVoucher.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", 1);
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("locationDetails", locationDetails);
		    	modelAndViewObj.addObject("locationsbasedzone",locationsbasedzone);
			}
			modelAndViewObj.addObject("giftVoucher", list_giftVoucher.get(0));
			modelAndViewObj.addObject("maxRecords", 10);
			
			if(zones != null && zones.size()>0)
				modelAndViewObj.addObject("zones", new java.util.LinkedHashSet<String>(zones));
			if(locations != null && locations.size()>0)
				modelAndViewObj.addObject("locationList", new java.util.LinkedHashSet<String>(locations));
			
			
			modelAndViewObj.setViewName("CRM/LoyaltyPrograms/GiftVouchers/editGiftVouchers");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display the Gift Voucher Details based on the voucherProgramCode  
	 *
	 **//*
	@RequestMapping("/viewGiftVoucherDetails")
	public ModelAndView viewGiftVoucherDetails(@RequestParam("id")String voucherProgramCode,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewGiftVoucherDetails ");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<GiftVoucherMaster> list_giftVoucher= loyaltyCardServiceObj.getGiftVouchers(voucherProgramCode,customerIdStr, emailIdStr,"0");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("giftVoucher", list_giftVoucher.get(0));
			modelAndViewObj.setViewName("CRM/LoyaltyPrograms/GiftVouchers/viewGiftVouchers");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}*/
	
	
	/** 
	 * @author Mythri.S
	 * 
	 *This method is used to display all the Gift Coupon details in a tabular form
	 *
	 **/
	@RequestMapping("/viewGiftCoupons")
	public ModelAndView viewGiftCoupons(@RequestParam("maxRecords")String maxRecords,@RequestParam("allLocationsList")String allLocationsList,@RequestParam("searchName")String searchName,@RequestParam("location")String location,@RequestParam("zone")String zone,@RequestParam("startdate")String startdate,@RequestParam("enddate")String enddate,@RequestParam("index")String index,HttpServletRequest request,HttpServletResponse response){
		
		String locationListAll="";
		try{
			// log.info("viewGiftCoupons ");
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			ArrayList<LocationBean> locationDetails = new ArrayList<LocationBean>();//genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,false,true);	
			 List<String> locationsListValue=new ArrayList<String>();
//	  	  		////////////System.out.println(selectedIds);
			 

				if(zone == null || zone.equals(""))
					locationDetails = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,true,false);
				//locationDetails = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
	
				else
					{
						List<ZoneMaster> zoneList = genericMasterServiceObj.getZonalLocationBasedonZone(zone, customerIdStr, emailIdStr, "0","","","");
						//List<ZoneMaster> zoneList = genericMasterServiceObj.getZonalLocationBasedonZone(zone, customerIdStr, emailIdStr, "0","","","Retail Outlet");

						LocationBean saleLocation = null;
						
						for(String zoneItems : zoneList.get(0).getZones() )
						{
							String zoneArray[] = zoneItems.split("\\+");
							saleLocation = new LocationBean(); 
							if(zoneArray != null && zoneArray.length>0)
							{
								saleLocation.setLocationId(zoneArray[0]);
								if(zoneArray.length > 1)
								saleLocation.setBusinessActivity(zoneArray[1]);
								if(zoneArray.length > 2)
								saleLocation.setDescription(zoneArray[2]);
								locationDetails.add(saleLocation);
							} 
						}
					
					}
			 
				

	  			if(location.equals("all")|| location.equals("")){
					if(locationDetails != null){
						if(zone ==""){
							for(int i=0;i<locationDetails.size();i++){
								locationsListValue.add(locationDetails.get(i).getLocationId());
							}
							}
							else
							{
								locationsListValue.add(allLocationsList);
							}
						for (String string : locationsListValue) {
							
							locationListAll = locationListAll+string+",";
						}
					}
					
				}
			
			List<GiftCouponsMaster> list_giftCoupons= loyaltyCardServiceObj.getGiftCoupons("",customerIdStr, emailIdStr,index,location,zone,startdate,enddate,searchName,locationListAll,maxRecords);
//			////////////System.out.println(list_giftCoupons.size());
			modelAndViewObj = new ModelAndView();
		
			
		
			
			
			
			if(list_giftCoupons == null){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(list_giftCoupons.size()<Integer.parseInt(maxRecords)){
					end = (list_giftCoupons.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(list_giftCoupons.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			/*if(list_giftCoupons != null)
			{
				if(list_giftCoupons.get(0).isMultiples() == true)
				{
					list_giftCoupons.get(0).setQuantity(1);
					modelAndViewObj.addObject("quantity","1");
				}
			}*/
			
//			////////////System.out.println(end);
			modelAndViewObj.addObject("locationsList", locationDetails);
			modelAndViewObj.addObject("giftCouponsList", list_giftCoupons);
			modelAndViewObj.addObject("searchName", searchName);
			modelAndViewObj.addObject("searchlocation", location);
			modelAndViewObj.addObject("zone", zone);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
//			////////////System.out.println(Integer.parseInt(maxRecords));
			modelAndViewObj.addObject("startdate", startdate);
			modelAndViewObj.addObject("enddate", enddate);
			modelAndViewObj.setViewName("CRM/LoyaltyPrograms/GiftCoupons/giftCoupons");
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
	 *This method is used to display the newGiftCoupons form 
	 *
	 **/
	@RequestMapping("/newGiftCoupons")
	public ModelAndView newGiftCoupons(HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("newGiftCoupons ");
			modelAndViewObj = new ModelAndView();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<Group> groupsList = outletMasterServiceObj.getProductGroupDetails("",customerIdStr, emailIdStr,"-1","",true);
			if(groupsList != null && groupsList.size() != 0){
				modelAndViewObj.addObject("groupsList", groupsList);
				
			}
			List<CustomerGroupMaster> cusgroupsList = customerServiceObj.getCustomerGroupDetails("",customerIdStr, emailIdStr,"-1","10",true, true,"","","","");
			List<String> groupid = new ArrayList<String>();
			if(cusgroupsList != null) {
			for(int i=0;i<cusgroupsList.size();i++)
				{
				 groupid.add(cusgroupsList.get(i).getGroup_id());
			
				}
			 modelAndViewObj.addObject("groupids", groupid);
			}
			
			
			
			
			modelAndViewObj.setViewName("CRM/LoyaltyPrograms/GiftCoupons/newGiftCoupons");
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
	 *This method is used to display the Gift Coupon Details based on the couponProgramCode
	 *
	 **//*
	@RequestMapping("/viewGiftCouponDetails")
	public ModelAndView viewGiftCouponDetails(@RequestParam("id")String couponProgramCode,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewGiftCouponDetails ");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<GiftCouponsMaster> list_giftCoupons= loyaltyCardServiceObj.getGiftCoupons(couponProgramCode,customerIdStr, emailIdStr,"0");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("giftCoupon", list_giftCoupons.get(0));
			modelAndViewObj.setViewName("CRM/LoyaltyPrograms/GiftCoupons/viewGiftCoupons");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	*/
	


@RequestMapping("/searchLoyaltyCards")
public ModelAndView searchLoyaltyCards(
		@RequestParam("searchCriteria") String searchCriteria,
		@RequestParam("maxRecords") String maxRecords,
		@RequestParam("index") String index,
		@RequestParam("loyaltyProgramNumber") String loyaltyProgramNumber,
		@RequestParam("saveFlag") boolean saveFlag,
		HttpServletRequest request,HttpServletResponse response){

	try{
		// log.info("editLoyaltyCardDetails ");
		//GenericMasterService genericMasterServiceObj = new GenericMasterService();
		int start = 1,end = Integer.parseInt(maxRecords);
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		LoyaltyCardMaster masterObj= loyaltyCardServiceObj.getLoyaltyCardsForSearchCriteria(loyaltyProgramNumber,customerIdStr, emailIdStr,index,searchCriteria,maxRecords,saveFlag);
		List<LoyaltyCards> list_cards = masterObj.getLoyaltyCards();
		modelAndViewObj = new ModelAndView();
		if(list_cards== null ){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(list_cards.size()<Integer.parseInt(maxRecords)){
				end = (list_cards.size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			modelAndViewObj.addObject("totalRecords", masterObj.getTotalRecords());
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
		}

//		modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
//		modelAndViewObj.addObject("searchCriteria", searchCriteria);
		modelAndViewObj.addObject("loyaltyCard", masterObj);
		
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	finally
	{
		modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
		modelAndViewObj.addObject("searchCriteria", searchCriteria);
		modelAndViewObj.setViewName("CRM/LoyaltyPrograms/LoyaltyCards/editLoyalityItemDetails");


	}
	return modelAndViewObj;
}

	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display the Gift Coupon Details based on the couponProgramCode
	 *
	 **/
/*
	@RequestMapping("/viewGiftCouponDetails")
	public ModelAndView viewGiftCouponDetails(@RequestParam("type")String type,@RequestParam("id")String couponProgramCode,HttpServletRequest request,HttpServletResponse response){
		String zonestr="";
//		List<String> zonalLocations=new ArrayList<String>();
		try{
			// log.info("viewGiftCouponDetails");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<GiftCouponsMaster> list_giftCoupons= loyaltyCardServiceObj.getGiftCoupons(couponProgramCode,customerIdStr, emailIdStr,"0","","","","","","","10");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("giftCoupon", list_giftCoupons.get(0));
			List<String> zones  = new ArrayList<String>();
			List<String> locations  = new ArrayList<String>();
			
			for (GiftCouponLocations loyalityZone : list_giftCoupons.get(0).getCouponLocationsList()) 
			{
				zones.add(loyalityZone.getZoneId());
				locations.add(loyalityZone.getValidLocation());
				
			}
			for(String string:zones)
			{
//				zonestr=zoneStr+zonestr+",";
				zonestr = zonestr+string+",";
			}
			//////////////System.out.println(zonestr);
			int start = 1,end = Integer.parseInt("10");
			
			if(list_giftCoupons.get(0).getGiftCoupons()== null ){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(list_giftCoupons.get(0).getGiftCoupons().size()<Integer.parseInt("10")){
					end = (list_giftCoupons.get(0).getGiftCoupons().size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", list_giftCoupons.get(0).getTotolGiftCoupons());
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			
			if(list_giftCoupons.get(0).isMultiples() == true)
				list_giftCoupons.get(0).setQuantity(1);
				modelAndViewObj.addObject("quantity","1");
			Set<String> locationsbasedzone = genericMasterServiceObj.getlocationsBasedOnZone(zonestr,customerIdStr, emailIdStr, "0","","");
			ArrayList<LocationBean> locationDetails = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,false,true);
			java.util.Set<String> zoneList = new java.util.LinkedHashSet<String>(zones); 
			java.util.Set<String> locationList = new java.util.LinkedHashSet<String>(locations);
//        java.util.Set<String> locationsbasedzone = new java.util.LinkedHashSet<String>(locationsbasedzone);
//        java.util.Set<String> locationList = new java.util.LinkedHashSet<String>(locationsbasedzone.get(0).getZones());
 			
//        for(int i=0;i<locationsbasedzone.size();i++)
//		{
//			String[] discount=locationsbasedzone.get(0).getZones().split("+");
//			featureIds.add(discount[i]);
//		}s
			List<Group> groupsList = outletMasterServiceObj.getProductGroupDetails("",customerIdStr, emailIdStr,"-1","",true);
			if(groupsList != null && groupsList.size() != 0){
				modelAndViewObj.addObject("groupsList", groupsList);
				
			}
			List<CustomerGroupMaster> cusgroupsList = customerServiceObj.getCustomerGroupDetails("",customerIdStr, emailIdStr,"-1","10",true, true,"","","","");
			List<String> groupid = new ArrayList<String>();
			if(cusgroupsList != null) {
			for(int i=0;i<cusgroupsList.size();i++)
				{
				 groupid.add(cusgroupsList.get(i).getGroup_id());
			
				}
			 modelAndViewObj.addObject("groupids", groupid);
			}
        
        modelAndViewObj.addObject("maxRecords",Integer.parseInt("10"));
        modelAndViewObj.addObject("zones",zoneList);
    	modelAndViewObj.addObject("locationDetails", locationDetails);
    	modelAndViewObj.addObject("locationsbasedzone",locationsbasedzone);
    	modelAndViewObj.addObject("locationList",locationList);
			if(type.equals("view"))
			modelAndViewObj.setViewName("CRM/LoyaltyPrograms/GiftCoupons/viewGiftCoupons");
			else
			modelAndViewObj.setViewName("CRM/LoyaltyPrograms/GiftCoupons/editGiftCoupons");	
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	*/
	
	
	@RequestMapping("/viewGiftCouponDetails")
	public ModelAndView viewGiftCouponDetails(@RequestParam("type")String type,@RequestParam("id")String couponProgramCode,HttpServletRequest request,HttpServletResponse response){
		String zonestr="";
//		List<String> zonalLocations=new ArrayList<String>();
		try{
			// log.info("viewGiftCouponDetails");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<GiftCouponsMaster> list_giftCoupons= loyaltyCardServiceObj.getGiftCoupons(couponProgramCode,customerIdStr, emailIdStr,"0","","","","","","","10");
			modelAndViewObj = new ModelAndView();
			List<String> zones  = new ArrayList<String>();
			List<String> locations  = new ArrayList<String>();
			if(list_giftCoupons.get(0).isDiscountCoupon()){
				list_giftCoupons.get(0).setCouponType("discount");
			}else
				list_giftCoupons.get(0).setCouponType("paid");
			if(list_giftCoupons != null && list_giftCoupons.size()> 0 && list_giftCoupons.get(0)!= null) {
			modelAndViewObj.addObject("giftCoupon", list_giftCoupons.get(0));
			
			for (GiftCouponLocations loyalityZone : list_giftCoupons.get(0).getCouponLocationsList()) 
			{
				zones.add(loyalityZone.getZoneId());
				locations.add(loyalityZone.getValidLocation());
				
			}
			}
			for(String string:zones)
			{
//				zonestr=zoneStr+zonestr+",";
				zonestr = zonestr+string+",";
			}
			//////////////System.out.println(zonestr);
			int start = 1,end = Integer.parseInt("10");
			
			if(list_giftCoupons == null || list_giftCoupons.get(0).getGiftCoupons()== null ){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(list_giftCoupons.get(0).getGiftCoupons().size()<Integer.parseInt("10")){
					end = (list_giftCoupons.get(0).getGiftCoupons().size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", list_giftCoupons.get(0).getTotolGiftCoupons());
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			
			/*if(list_giftCoupons.get(0).isMultiples() == true)
				list_giftCoupons.get(0).setQuantity(1);
				modelAndViewObj.addObject("quantity","1");*/
			Set<String> locationsbasedzone = genericMasterServiceObj.getlocationsBasedOnZone(zonestr,customerIdStr, emailIdStr, "0","","");
			ArrayList<LocationBean> locationDetails = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,false,true);
			java.util.Set<String> zoneList = new java.util.LinkedHashSet<String>(zones); 
			java.util.Set<String> locationList = new java.util.LinkedHashSet<String>(locations);
//        java.util.Set<String> locationsbasedzone = new java.util.LinkedHashSet<String>(locationsbasedzone);
//        java.util.Set<String> locationList = new java.util.LinkedHashSet<String>(locationsbasedzone.get(0).getZones());
 			
//        for(int i=0;i<locationsbasedzone.size();i++)
//		{
//			String[] discount=locationsbasedzone.get(0).getZones().split("+");
//			featureIds.add(discount[i]);
//		}s
			List<Group> groupsList = outletMasterServiceObj.getProductGroupDetails("",customerIdStr, emailIdStr,"-1","",true);
			if(groupsList != null && groupsList.size() != 0){
				modelAndViewObj.addObject("groupsList", groupsList);
				
			}
			List<CustomerGroupMaster> cusgroupsList = customerServiceObj.getCustomerGroupDetails("",customerIdStr, emailIdStr,"-1","10",true, true,"","","","");
			List<String> groupid = new ArrayList<String>();
			if(cusgroupsList != null) {
			for(int i=0;i<cusgroupsList.size();i++)
				{
				 groupid.add(cusgroupsList.get(i).getGroup_id());
			
				}
			 modelAndViewObj.addObject("groupids", groupid);
			}
			
			
        modelAndViewObj.addObject("maxRecords",Integer.parseInt("10"));
        modelAndViewObj.addObject("zones",zoneList);
    	modelAndViewObj.addObject("locationDetails", locationDetails);
    	modelAndViewObj.addObject("locationsbasedzone",locationsbasedzone);
    	modelAndViewObj.addObject("locationList",locationList);
			if(type.equals("view"))
			modelAndViewObj.setViewName("CRM/LoyaltyPrograms/GiftCoupons/viewGiftCoupons");
			else
			modelAndViewObj.setViewName("CRM/LoyaltyPrograms/GiftCoupons/editGiftCoupons");	
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	
	
	
	@RequestMapping("/vieweditGiftCouponDetailsForPagination")
	public ModelAndView vieweditGiftCouponDetailsForPagination(@RequestParam("searchname") String searchname,@RequestParam("maxRecords") String maxRecords,@RequestParam("index") String index,@RequestParam("id")String couponProgramCode,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("editLoyaltyCardDetails ");
//			GenericMasterService genericMasterServiceObj = new GenericMasterService();
//			int start = 1,end = Integer.parseInt(maxRecords);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<GiftCoupons> list_giftCoupons= loyaltyCardServiceObj.getGiftCouponsBySearchCreiteria(couponProgramCode,customerIdStr, emailIdStr,index,"","","","",searchname,false,"10");
			modelAndViewObj = new ModelAndView();
			/*if(list_giftCoupons== null ){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(list_giftCoupons.size()<Integer.parseInt(maxRecords)){
					end = (list_giftCoupons.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
//				modelAndViewObj.addObject("totalRecords", list_giftCoupons.get(0).getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}*/
//			////////////System.out.println(list_loyaltyCardMaster.get(0).getTotalLoyaltyCards());
			
//			////////////System.out.println(Integer.parseInt(list_loyaltyCardMaster.get(0).getTotalRecords()));
		
			modelAndViewObj.addObject("giftCoupon", list_giftCoupons);
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.setViewName("CRM/LoyaltyPrograms/GiftCoupons/viewEditCouponsItemDetails");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	
	@RequestMapping("/getGiftCouponDetails")
	public @ResponseBody GiftCouponsMaster getGiftCouponDetails(@RequestParam("couponProgramCode") String couponProgramCode,HttpServletRequest request,HttpServletResponse response) {
		String customerIdStr = null,emailIdStr=null;
		List<GiftCouponsMaster> list_giftCoupons = new ArrayList<GiftCouponsMaster>();
		try{
			// log.info("getgiftcoupondetails");
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			list_giftCoupons= loyaltyCardServiceObj.getGiftCoupons(couponProgramCode,customerIdStr, emailIdStr,"0","","","","","","","10");
			if(list_giftCoupons.get(0).isDiscountCoupon()){
				list_giftCoupons.get(0).setCouponType("discount");
			}else
				list_giftCoupons.get(0).setCouponType("paid");
		}catch(Exception e){
			e.printStackTrace();
		}
		return list_giftCoupons.get(0);
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to save the details of the Gift Coupons
	 *
	 **/
	@RequestMapping(value="/createGiftCoupons",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createGiftCoupons(@RequestBody GiftCouponsMaster giftCouponsMaster,HttpServletRequest request,HttpServletResponse response) {
//		String zonestr="";
		try{
//			List<String> locationListzones = new ArrayList<String>();
			// log.info("createGiftVouchers");
//			////////////System.out.println("createGiftVouchers");
			String result;
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			
			if(giftCouponsMaster.getCouponType().equalsIgnoreCase("discount") || giftCouponsMaster.getCouponType() == "discount"){
				giftCouponsMaster.setDiscountCoupon(true);
			}else{
				giftCouponsMaster.setDiscountCoupon(false);
			}
				
			
			result = loyaltyCardServiceObj.createGiftCoupons(giftCouponsMaster,customerId,emailId);
			modelAndViewObj = new ModelAndView();
			
			
			//written by manasa
			//purpose:form data should not clear, when we submit form
			if(!result.equals(AppProperties.getAppMessageByProperty("GIFTCOUPONS_CREATE_SUCCESS").trim())){
				modelAndViewObj.addObject("err", result);
				
//				List<String> zonelocations = new ArrayList<String>(Arrays.asList(giftCouponsMaster.getLocations().split(",")));
//				locationListzones.add(giftCouponsMaster.getLocations().split(","));				java.util.Set<String> zonesSelectedList = new java.util.LinkedHashSet<String>(java.util.Arrays.asList(zonelocations));
				Set<String> locationsbasedzone = genericMasterServiceObj.getlocationsBasedOnZone(giftCouponsMaster.getSelectdZones(),customerId, emailId, "0","","");
//				String states[]=  giftCouponsMaster.getStates().split(",");
//				String locations[]=  giftCouponsMaster.getLocations().split(",");
				//////////////System.out.println(states);
				/*////////////System.out.println("sdgdRg"+giftCouponsMaster.getSelectdZones());
				List<String> myList = new ArrayList<String>(Arrays.asList(giftCouponsMaster.getSelectdZones().split(",")));
				giftCouponsMaster.setZones(myList);
			////////////System.out.println("sdgdRg"+giftCouponsMaster.getLocations());*/
				
//				java.util.Set<String> statesSelectedList = new java.util.LinkedHashSet<String>(java.util.Arrays.asList(states));
//				java.util.Set<String> locationSelectedList = new java.util.LinkedHashSet<String>(java.util.Arrays.asList(locations));
//			
				modelAndViewObj.addObject("locationsbasedzone", locationsbasedzone);
//				modelAndViewObj.addObject("locationSelectedList", locationSelectedList);
				modelAndViewObj.addObject("giftCoupon", giftCouponsMaster);
				  List<Group> groupsList = outletMasterServiceObj.getProductGroupDetails("",customerId, emailId,"-1","",true);
					if(groupsList != null && groupsList.size() != 0){
						modelAndViewObj.addObject("groupsList", groupsList);
						
					}
					List<CustomerGroupMaster> cusgroupsList = customerServiceObj.getCustomerGroupDetails("",customerId, emailId,"-1","10",true, true,"","","","");
					List<String> groupid = new ArrayList<String>();
					if(cusgroupsList != null) {
					for(int i=0;i<cusgroupsList.size();i++)
						{
						 groupid.add(cusgroupsList.get(i).getGroup_id());
					
						}
					 modelAndViewObj.addObject("groupids", groupid);
					}
				//modelAndViewObj.addObject("type", "new");
				modelAndViewObj.setViewName("CRM/LoyaltyPrograms/GiftCoupons/newGiftCoupons");
			}else{
				modelAndViewObj.addObject("success", result);
				modelAndViewObj.setViewName("CRM/LoyaltyPrograms/GiftCoupons/newGiftCoupons");
			}
			
			//modelAndViewObj.addObject("err", result);
		//	modelAndViewObj.setViewName("CRM/LoyaltyPrograms/GiftCoupons/newGiftCoupons");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	


	@RequestMapping(value="/updateGiftCoupons",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView updateGiftCoupons(@RequestBody GiftCouponsMaster giftCouponsMaster,HttpServletRequest request,HttpServletResponse response) {
		String zonestr="";
		try{
//			List<String> locationList = new ArrayList<String>();
			// log.info("createGiftVouchers");
//			////////////System.out.println("createGiftVouchers");
			String result;
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			
			List<String> myList1 = new ArrayList<String>(Arrays.asList(giftCouponsMaster.getCustomerCouponidsStr().split(",")));
			giftCouponsMaster.setCustomerCouponids(myList1);
			giftCouponsMaster.setCouponids(myList1);
			
			giftCouponsMaster.setCustomerCouponidsStr("");
			if(giftCouponsMaster.getCouponType().equalsIgnoreCase("discount") || giftCouponsMaster.getCouponType() == "discount"){
				giftCouponsMaster.setDiscountCoupon(true);
			}else{
				giftCouponsMaster.setDiscountCoupon(false);
			}
			if(giftCouponsMaster.getRenewCoupon().equals("true") || giftCouponsMaster.getRenewCoupon() == "true"){
				giftCouponsMaster.setRenewalCoupon(true);
			}else{
				giftCouponsMaster.setRenewalCoupon(false);
			}
			result = loyaltyCardServiceObj.updateGiftCoupons(giftCouponsMaster,customerId,emailId);
			modelAndViewObj = new ModelAndView();
			
			//written by manasa
			List<GiftCouponsMaster> list_giftCoupons= loyaltyCardServiceObj.getGiftCoupons(giftCouponsMaster.getCouponProgramCode(),customerId, emailId,"0","","","","","","","10");
			List<String> zones  = new ArrayList<String>();
			List<String> locations  = new ArrayList<String>();
			if(list_giftCoupons.get(0).isDiscountCoupon()){
				list_giftCoupons.get(0).setCouponType("discount");
			}else
				list_giftCoupons.get(0).setCouponType("paid");
			for (GiftCouponLocations loyalityZone : list_giftCoupons.get(0).getCouponLocationsList()) 
			{
				zones.add(loyalityZone.getZoneId());
				locations.add(loyalityZone.getValidLocation());
			}
			for(String string:zones)
			{
//				zonestr=zoneStr+zonestr+",";
				zonestr = zonestr+string+",";
			}
//			////////////System.out.println(zonestr);
			
         int start = 1,end = Integer.parseInt("10");
			
			if(list_giftCoupons.get(0).getGiftCoupons()== null ){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(list_giftCoupons.get(0).getGiftCoupons().size()<Integer.parseInt("10")){
					end = (list_giftCoupons.get(0).getGiftCoupons().size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", list_giftCoupons.get(0).getTotolGiftCoupons());
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			
			Set<String> locationsbasedzone = genericMasterServiceObj.getlocationsBasedOnZone(zonestr,customerId, emailId, "0","","");
			ArrayList<LocationBean> locationDetails = genericMasterServiceObj.getLocationDetails("",customerId, emailId,"-1","",false,false,true);
		        java.util.Set<String> zoneList = new java.util.LinkedHashSet<String>(zones); 
		        java.util.Set<String> locationList = new java.util.LinkedHashSet<String>(locations);

		    	modelAndViewObj.addObject("zones",zoneList);
		    	modelAndViewObj.addObject("locationDetails", locationDetails);
		    	modelAndViewObj.addObject("locationsbasedzone",locationsbasedzone);
		    	modelAndViewObj.addObject("locationList",locationList);
		    	modelAndViewObj.addObject("giftCoupon", list_giftCoupons.get(0));
			//written by manasa
			//purpose:form data should not clear, when we submit form
		    	  modelAndViewObj.addObject("maxRecords",Integer.parseInt("10"));
		    	  
		    	  List<Group> groupsList = outletMasterServiceObj.getProductGroupDetails("",customerId, emailId,"-1","",true);
					if(groupsList != null && groupsList.size() != 0){
						modelAndViewObj.addObject("groupsList", groupsList);
						
					}
					List<CustomerGroupMaster> cusgroupsList = customerServiceObj.getCustomerGroupDetails("",customerId, emailId,"-1","10",true, true,"","","","");
					List<String> groupid = new ArrayList<String>();
					if(cusgroupsList != null) {
					for(int i=0;i<cusgroupsList.size();i++)
						{
						 groupid.add(cusgroupsList.get(i).getGroup_id());
					
						}
					 modelAndViewObj.addObject("groupids", groupid);
					}
					
		    	  
			if(!result.equals(AppProperties.getAppMessageByProperty("COUPON_UPDATED_SUCCESS").trim())){
				modelAndViewObj.addObject("err", result);
				
			
				//modelAndViewObj.addObject("type", "new");
				modelAndViewObj.setViewName("CRM/LoyaltyPrograms/GiftCoupons/editGiftCoupons");
			}else{
				modelAndViewObj.addObject("success", result);
				modelAndViewObj.setViewName("CRM/LoyaltyPrograms/GiftCoupons/editGiftCoupons");
			}
			
			//modelAndViewObj.addObject("err", result);
		//	modelAndViewObj.setViewName("CRM/LoyaltyPrograms/GiftCoupons/newGiftCoupons");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	


	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display all the loyalty card details in a tabular form
	 *
	 *@modifications Vijay
	 *@desc : added maxRecords parameter
	 *
	 **/
	/*@RequestMapping("/viewLoyaltyCards")
	public ModelAndView viewLoyaltyCards(@RequestParam("index")String index,
			@RequestParam("maxRecords")String maxRecords, HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewLoyaltyCards ");
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<LoyaltyCardMaster> list_loyaltyCardMaster = loyaltyCardServiceObj.getLoyaltyCards("",customerIdStr, emailIdStr,index,maxRecords);
			modelAndViewObj = new ModelAndView();
//			if(list_loyaltyCardMaster.get(0).getResponseCode().equals("0"))
//			{
				if(list_loyaltyCardMaster == null || list_loyaltyCardMaster.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}
				else
				{
				if(list_loyaltyCardMaster.size()<Integer.parseInt(maxRecords))
				{
					end = (list_loyaltyCardMaster.size())+(Integer.parseInt(index));
				}
				else
				{
					end = (Integer.parseInt(index)+end);
				}
					modelAndViewObj.addObject("totalRecords", list_loyaltyCardMaster.get(0).getTotalRecords());
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
//				}
				modelAndViewObj.addObject("loyaltyCardsList", list_loyaltyCardMaster);
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
			}
//			else
//			{
//				modelAndViewObj.addObject("err",list_loyaltyCardMaster.get(0).getResponseMessage());
//			}
			   
			modelAndViewObj.setViewName("CRM/LoyaltyPrograms/LoyaltyCards/loyaltyCards");
			
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		
		return modelAndViewObj;
	}*/
	
	/**
	 * 
	 * @author Vijay
	 * 
	 *This method is used to display the loyalty card details based on the given loyaltyProgramNumber 
	 *
	 **/
	@RequestMapping("/editLoyaltyCardDetails")
	public ModelAndView editLoyaltyCardDetails(@RequestParam("maxRecords") String maxRecords,@RequestParam("loyaltyProgramNumber") String loyaltyProgramNumber,HttpServletRequest request,HttpServletResponse response){
		
		
		try{
			// log.info("editLoyaltyCardDetails ");
			GenericMasterService genericMasterServiceObj = new GenericMasterService();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<LoyaltyCardMaster> list_loyaltyCardMaster = loyaltyCardServiceObj.getLoyaltyCards(loyaltyProgramNumber,customerIdStr, emailIdStr,"0",maxRecords);
			modelAndViewObj = new ModelAndView();
			int start = 1,end = Integer.parseInt(maxRecords);
			System.out.println("LL:"+gson.toJson(list_loyaltyCardMaster));
			if(list_loyaltyCardMaster == null || list_loyaltyCardMaster.size() == 0 || list_loyaltyCardMaster.get(0).getLoyaltyCards()== null ){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(list_loyaltyCardMaster.get(0).getLoyaltyCards().size()<Integer.parseInt(maxRecords)){
					end = (list_loyaltyCardMaster.get(0).getLoyaltyCards().size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", list_loyaltyCardMaster.get(0).getTotalLoyaltyCards());
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			
			List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
			if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
				zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"0","","");
				request.getSession().setAttribute("zoneList", zoneList);
			}
			
//			////////////System.out.println(list_loyaltyCardMaster.get(0).getTotalLoyaltyCards());
			
			List<String> zones  = new ArrayList<String>();
			List<String> states  = new ArrayList<String>();
			List<String> countries  = new ArrayList<String>();
			
			if(list_loyaltyCardMaster != null && list_loyaltyCardMaster.size() >0 && list_loyaltyCardMaster.get(0).getLoyaltyZones() != null){
			for (LoyaltyZones loyalityZone : list_loyaltyCardMaster.get(0).getLoyaltyZones()) 
			{
				zones.add(loyalityZone.getZone());
				states.add(loyalityZone.getStates());
				countries.add(loyalityZone.getCountry());
			}
			modelAndViewObj.addObject("startdateloyaltycard", list_loyaltyCardMaster.get(0).getStartDateStr());
			modelAndViewObj.addObject("enddateloyaltyCard", list_loyaltyCardMaster.get(0).getEndDateStr());
			modelAndViewObj.addObject("loyaltyCard", list_loyaltyCardMaster.get(0));
			}
			
			java.util.Set<String> zoneSelectedList = new java.util.LinkedHashSet<String>(zones);  
			java.util.Set<String> countrySelectedList = new java.util.LinkedHashSet<String>(countries);
			java.util.Set<String> statesSelectedList = new java.util.LinkedHashSet<String>(states);

//			////////////System.out.println(Integer.parseInt(list_loyaltyCardMaster.get(0).getTotalRecords()));
		//	////////////System.out.println(statesSelectedList.size());
		
			modelAndViewObj.addObject("zones",zoneSelectedList);
			modelAndViewObj.addObject("countries",countrySelectedList);
			modelAndViewObj.addObject("statesList",statesSelectedList);
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
			
			modelAndViewObj.setViewName("CRM/LoyaltyPrograms/LoyaltyCards/editLoyaltyDetails");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	@RequestMapping("/editLoyaltyCardDetailsForPagination")
	public ModelAndView editLoyaltyCardDetailsForPagination(@RequestParam("maxRecords") String maxRecords,@RequestParam("index") String index,@RequestParam("loyaltyProgramNumber") String loyaltyProgramNumber,HttpServletRequest request,HttpServletResponse response){
		
		
		try{
			// log.info("editLoyaltyCardDetails ");
//			GenericMasterService genericMasterServiceObj = new GenericMasterService();
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<LoyaltyCardMaster> list_loyaltyCardMaster = loyaltyCardServiceObj.getLoyaltyCards(loyaltyProgramNumber,customerIdStr, emailIdStr,index,maxRecords);
			modelAndViewObj = new ModelAndView();
			if(list_loyaltyCardMaster.get(0).getLoyaltyCards()== null ){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(list_loyaltyCardMaster.get(0).getLoyaltyCards().size()<Integer.parseInt(maxRecords)){
					end = (list_loyaltyCardMaster.get(0).getLoyaltyCards().size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", list_loyaltyCardMaster.get(0).getTotalLoyaltyCards());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
//			////////////System.out.println(list_loyaltyCardMaster.get(0).getTotalLoyaltyCards());
			
//			////////////System.out.println(Integer.parseInt(list_loyaltyCardMaster.get(0).getTotalRecords()));
		
			modelAndViewObj.addObject("loyaltyCard", list_loyaltyCardMaster.get(0));
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
			modelAndViewObj.setViewName("CRM/LoyaltyPrograms/GiftCoupons/viewEditCouponsItemDetails");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	
	@RequestMapping("/editLoyaltyCouponForPagination")
	public ModelAndView editLoyaltyCouponForPagination(@RequestParam("noofClaims") String noofClaims,@RequestParam("saveFlag") boolean saveFlag,@RequestParam("searchCriteria") String searchCriteria,@RequestParam("maxRecords") String maxRecords,@RequestParam("index") String index,@RequestParam("loyaltyCouponNumber") String loyaltyCouponNumber,@RequestParam("actionTest") String actionTest,HttpServletRequest request,HttpServletResponse response){
				
		try{
			// log.info("editLoyaltyCardDetails ");
//			GenericMasterService genericMasterServiceObj = new GenericMasterService();
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			
		//	if(saveFlag == true || searchCriteria != ""){
			List<GiftCoupons> list_giftCoupons= loyaltyCardServiceObj.getGiftCouponsBySearchCreiteria(loyaltyCouponNumber,customerIdStr, emailIdStr,index,"","","","",searchCriteria,saveFlag,"10");
			modelAndViewObj = new ModelAndView();
			
			if(list_giftCoupons== null || list_giftCoupons.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}
			else{
				if(list_giftCoupons.size()<Integer.parseInt(maxRecords)){
					end = (list_giftCoupons.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				
				modelAndViewObj.addObject("totalRecords", list_giftCoupons.get(0).getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
				modelAndViewObj.addObject("giftCoupon", list_giftCoupons.get(0));
			}
			
		modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
		modelAndViewObj.addObject("searchCriteria", searchCriteria);
		modelAndViewObj.addObject("loyaltyCouponNumber", loyaltyCouponNumber);
		modelAndViewObj.addObject("noofClaims", noofClaims);
		modelAndViewObj.addObject("giftCoupons", list_giftCoupons);
		modelAndViewObj.addObject("actionTest", actionTest);
		

		if(list_giftCoupons!=null && list_giftCoupons.size()>0 && list_giftCoupons.get(0).getFilePath()!=null)
			modelAndViewObj.addObject("downloadurl", list_giftCoupons.get(0).getFilePath());
		
		modelAndViewObj.setViewName("CRM/LoyaltyPrograms/GiftCoupons/editCouponItemsTest");
	
		
		
	/*	}else{
				List<GiftCouponsMaster> list_giftCoupons= loyaltyCardServiceObj.getGiftCoupons(loyaltyCouponNumber,customerIdStr, emailIdStr,index,"","","","",searchCriteria,"","10");
				List<String> zones  = new ArrayList<String>();
				List<String> locations  = new ArrayList<String>();
				
				if(list_giftCoupons.get(0).getGiftCoupons()== null ){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(list_giftCoupons.get(0).getGiftCoupons().size()<Integer.parseInt("10")){
						end = (list_giftCoupons.get(0).getGiftCoupons().size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", list_giftCoupons.get(0).getTotolGiftCoupons());
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
					modelAndViewObj.addObject("giftCoupon", list_giftCoupons.get(0));
			}
			
				modelAndViewObj.setViewName("CRM/LoyaltyPrograms/GiftCoupons/editCouponItemsTest1");
		}*/
		
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	
	
/*	@RequestMapping("/editLoyaltyCouponForPagination")
	public ModelAndView editLoyaltyCouponForPagination(@RequestParam("noofClaims") String noofClaims,@RequestParam("saveFlag") boolean saveFlag,@RequestParam("searchCriteria") String searchCriteria,@RequestParam("maxRecords") String maxRecords,@RequestParam("index") String index,@RequestParam("loyaltyCouponNumber") String loyaltyCouponNumber,@RequestParam("actionTest") String actionTest,HttpServletRequest request,HttpServletResponse response){
				
		try{
			// log.info("editLoyaltyCardDetails ");
//			GenericMasterService genericMasterServiceObj = new GenericMasterService();
			int start = 1,end = Integer.parseInt(maxRecords);
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			
			if(saveFlag == true || searchCriteria != ""){
			List<GiftCoupons> list_giftCoupons= loyaltyCardServiceObj.getGiftCouponsBySearchCreiteria(loyaltyCouponNumber,customerIdStr, emailIdStr,index,"","","","",searchCriteria,saveFlag,"10");
			modelAndViewObj = new ModelAndView();
			if(list_giftCoupons== null ){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(list_giftCoupons.size()<Integer.parseInt(maxRecords)){
					end = (list_giftCoupons.size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", list_giftCoupons.get(0).getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}

			
			
		modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
		modelAndViewObj.addObject("searchCriteria", searchCriteria);
		modelAndViewObj.addObject("loyaltyCouponNumber", loyaltyCouponNumber);
		modelAndViewObj.addObject("noofClaims", noofClaims);
		modelAndViewObj.addObject("giftCoupons", list_giftCoupons);
		modelAndViewObj.addObject("actionTest", actionTest);
		

		if(list_giftCoupons.get(0).getFilePath()!=null)
			modelAndViewObj.addObject("downloadurl", list_giftCoupons.get(0).getFilePath());
		
		modelAndViewObj.setViewName("CRM/LoyaltyPrograms/GiftCoupons/editCouponItemsTest");
			}else{
				
				
				List<GiftCouponsMaster> list_giftCoupons= loyaltyCardServiceObj.getGiftCoupons(loyaltyCouponNumber,customerIdStr, emailIdStr,index,"","","","",searchCriteria,"","10");
				List<String> zones  = new ArrayList<String>();
				List<String> locations  = new ArrayList<String>();
				
				if(list_giftCoupons.get(0).getGiftCoupons()== null ){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(list_giftCoupons.get(0).getGiftCoupons().size()<Integer.parseInt("10")){
						end = (list_giftCoupons.get(0).getGiftCoupons().size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", list_giftCoupons.get(0).getTotolGiftCoupons());
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
					modelAndViewObj.addObject("giftCoupon", list_giftCoupons.get(0));
				
				
			}
			
				modelAndViewObj.setViewName("CRM/LoyaltyPrograms/GiftCoupons/editCouponItemsTest1");
		}
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}*/
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to save the details of the Loyalty Cards
	 *
	 **/
	@RequestMapping(value="/createLoyaltyCards",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createLoyaltyCards(@RequestBody LoyaltyCardMaster loyaltyCardMaster,HttpServletRequest request,HttpServletResponse response) throws Exception{
		try{
			// log.info("createLoyaltyCards"+loyaltyCardMaster);
			modelAndViewObj = new ModelAndView();
			
			String result;
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			
			JSONArray jsonResponseArray = new JSONArray(loyaltyCardMaster.getItems());
			List<LoyaltyPurchaseRanges> itemDetails = new ArrayList<LoyaltyPurchaseRanges>();
			for (int i=0; i<jsonResponseArray.length(); i++) {
				LoyaltyPurchaseRanges items = gson.fromJson(jsonResponseArray.getString(i), LoyaltyPurchaseRanges.class);
				itemDetails.add(items);
			}
			loyaltyCardMaster.setLoyaltyPurcahseRanges(itemDetails);
			
			result = loyaltyCardServiceObj.createLayoutCards(loyaltyCardMaster,customerId,emailId);
		
			if(result.equals(AppProperties.getAppMessageByProperty("LOYALTY_CREATE_SUCCESS").trim()))
			{
				modelAndViewObj.addObject("success", result);
				
			}
			else
			{

				
				String zones[]=    loyaltyCardMaster.getZone().split(",");
			/*	String states[]=  loyaltyCardMaster.getStates().split(",");*/

				java.util.Set<String> zoneSelectedList = new java.util.LinkedHashSet<String>(java.util.Arrays.asList(zones));  
				/*java.util.Set<String> statesSelectedList = new java.util.LinkedHashSet<String>(java.util.Arrays.asList(states));*/
				
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("zones",zoneSelectedList);
			/*	modelAndViewObj.addObject("statesList",statesSelectedList);*/
				modelAndViewObj.addObject("err", result);
				modelAndViewObj.addObject("loyaltyCards", loyaltyCardMaster);
			}
			
			
			
			modelAndViewObj.setViewName("CRM/LoyaltyPrograms/LoyaltyCards/newLoyaltyCards");
		}catch(Exception e){
			e.printStackTrace();
			//modelAndViewObj.addObject("err", e.getMessage());
				throw new Exception(e.getMessage());	
			}
		return modelAndViewObj;
	}
/**
	 * 
	 * @author Vijay
	 * 
	 *This method is used to save the details of the Loyalty Cards
	 *
	 **/
	  @RequestMapping(value="/updateLoyaltyCards",method=RequestMethod.POST,consumes="application/json")
      public ModelAndView  updateLoyaltyCards(@RequestBody LoyaltyCardMaster loyaltyCardMaster,HttpServletRequest request,HttpServletResponse response) throws Exception{
              String result=null;
              try{
                      // log.info("updateLoyaltyCards"+loyaltyCardMaster);
                      modelAndViewObj = new ModelAndView();
                      String customerId = (String)request.getSession().getAttribute("customerId");
                      String emailId = (String)request.getSession().getAttribute("emailId");
                      
                      
                      JSONArray jsonResponseArray = new JSONArray(loyaltyCardMaster.getItems());
                      List<LoyaltyPurchaseRanges> itemDetails = new ArrayList<LoyaltyPurchaseRanges>();
                      for (int i=0; i<jsonResponseArray.length(); i++) {
                              LoyaltyPurchaseRanges items = gson.fromJson(jsonResponseArray.getString(i), LoyaltyPurchaseRanges.class);
                              itemDetails.add(items);
                      }
                      loyaltyCardMaster.setLoyaltyPurcahseRanges(itemDetails);
                      
                      
                      
                      JSONArray jsonResponseArray3 = new JSONArray(loyaltyCardMaster.getLoyaltyCardsdetails());
                      List<LoyaltyCards> itemDetails3 = new ArrayList<LoyaltyCards>();
                      for (int i=0; i<jsonResponseArray3.length(); i++) {
                              LoyaltyCards items3 = gson.fromJson(jsonResponseArray3.getString(i), LoyaltyCards.class);
                              itemDetails3.add(items3);
                      }
                      loyaltyCardMaster.setLoyaltyCards(itemDetails3);
                      JSONArray jsonResponseArray2 = new JSONArray(loyaltyCardMaster.getCustomerLoyaltyCardsitems());
                      List<CustomerLoyaltyCards> itemDetails2 = new ArrayList<CustomerLoyaltyCards>();
                      for (int i=0; i<jsonResponseArray2.length(); i++) {
                              CustomerLoyaltyCards items2 = gson.fromJson(jsonResponseArray2.getString(i), CustomerLoyaltyCards.class);
                              itemDetails2.add(items2);
                      }
                      loyaltyCardMaster.setCustomerLoyaltyCards(itemDetails2);
                      
                      JSONArray jsonResponseArray4 = new JSONArray(loyaltyCardMaster.getLoyaltyZonesdetails());
                      Set<LoyaltyZones> itemDetails4 = new HashSet<LoyaltyZones>();
                      for (int i=0; i<jsonResponseArray4.length(); i++) {
                              LoyaltyZones items4 = gson.fromJson(jsonResponseArray4.getString(i), LoyaltyZones.class);
                              itemDetails4.add(items4);
                      }
                      loyaltyCardMaster.setLoyaltyZones(itemDetails4);
              
                      
                      
                      /*List<String> deletedDetails = new ArrayList<String>();
                      deletedDetails.add(loyaltyCardMaster.getDeletePlusItem());*/
                      List<String> myList = new ArrayList<String>(Arrays.asList(loyaltyCardMaster.getDeletePlusItem().split(",")));
                      loyaltyCardMaster.setDeletePurchaseRangesBySno(myList);
                      List<String> myList1 = new ArrayList<String>(Arrays.asList(loyaltyCardMaster.getLoyaltyCardsIdsstr().split(",")));
                      loyaltyCardMaster.setLoyaltyCardsIds(myList1);
              //        List<String> myList2 = new ArrayList<String>(Arrays.asList(loyaltyCardMaster.getCustomerLoyaltyCardsIdsstr().split(",")));
                      loyaltyCardMaster.setCustomerLoyaltyCardsIds(myList1);
                      
                      
              /*        loyaltyCardMaster.setStartDateStr(loyaltyCardMaster.getStartDate());
                      loyaltyCardMaster.setEndDateStr(loyaltyCardMaster.getEndDate());

                      loyaltyCardMaster.setStartDate("");
                      loyaltyCardMaster.setEndDate("");*/
                      loyaltyCardMaster.setItems("");
                      loyaltyCardMaster.setCustomerLoyaltyCardsitems("");
                      loyaltyCardMaster.setLoyaltyCardsdetails("");
                      loyaltyCardMaster.setLoyaltyZonesdetails("");
                      
                      
                      
                      
                      result = loyaltyCardServiceObj.updateLayoutCards(loyaltyCardMaster,customerId,emailId);
                      
                      if(result.equals(AppProperties.getAppMessageByProperty("LOYALTY_UPDATE_SUCCESS").trim()))
                      {
                              modelAndViewObj.addObject("success", result);
                      }
                      else
                      {
                              modelAndViewObj.addObject("err", result);
                      }
                      //////////////System.out.println("err:"+result);
                      
                      GenericMasterService genericMasterServiceObj = new GenericMasterService();

                      String customerIdStr = (String)request.getSession().getAttribute("customerId");
                      String emailIdStr = (String)request.getSession().getAttribute("emailId");
                      List<LoyaltyCardMaster> list_loyaltyCardMaster = loyaltyCardServiceObj.getLoyaltyCards(loyaltyCardMaster.getLoyaltyProgramNumber(),customerIdStr, emailIdStr,"0","");
                      
                      List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
                      if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
                              zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"0","","");
                              request.getSession().setAttribute("zoneList", zoneList);
                      }
                      
                      
                      
                      List<String> zones  = new ArrayList<String>();
                      List<String> states  = new ArrayList<String>();
                      List<String> countries  = new ArrayList<String>();
                      

                      for (LoyaltyZones loyalityZone : list_loyaltyCardMaster.get(0).getLoyaltyZones()) 
                      {
                              zones.add(loyalityZone.getZone());
                              states.add(loyalityZone.getStates());
                              countries.add(loyalityZone.getCountry());
                      }
                      
                      java.util.Set<String> zoneSelectedList = new java.util.LinkedHashSet<String>(zones);  
                      java.util.Set<String> countrySelectedList = new java.util.LinkedHashSet<String>(countries);
                      java.util.Set<String> statesSelectedList = new java.util.LinkedHashSet<String>(states);

                      
                      //////////////System.out.println(statesSelectedList.size());
                      modelAndViewObj.addObject("zones",zoneSelectedList);
                      modelAndViewObj.addObject("countries",countrySelectedList);
                      modelAndViewObj.addObject("statesList",statesSelectedList);
                      modelAndViewObj.addObject("startdateloyaltycard", list_loyaltyCardMaster.get(0).getStartDateStr());
          			modelAndViewObj.addObject("enddateloyaltyCard", list_loyaltyCardMaster.get(0).getEndDateStr());

                      
                      
                              modelAndViewObj.addObject("loyaltyCard", list_loyaltyCardMaster.get(0));
                              modelAndViewObj.setViewName("CRM/LoyaltyPrograms/LoyaltyCards/editLoyaltyDetails");
                      
              
                      
                      
              }
              catch(Exception e)
              {
                              e.printStackTrace();
                              ///throw new Exception(result);
              }
              
              return modelAndViewObj;
              
      }


	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to display all the loyalty card details in a tabular form
	 *
	 **//*
	@RequestMapping("/viewLoyaltyCards")
	public ModelAndView viewLoyaltyCards(@RequestParam("index")String index,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewLoyaltyCards ");
			int start = 1,end = 10;
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<LoyaltyCardMaster> list_loyaltyCardMaster = loyaltyCardServiceObj.getLoyaltyCards("",customerIdStr, emailIdStr,index);
			modelAndViewObj = new ModelAndView();
			if(list_loyaltyCardMaster == null || list_loyaltyCardMaster.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(list_loyaltyCardMaster.size()<10){
					end = (list_loyaltyCardMaster.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(list_loyaltyCardMaster.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("loyaltyCardsList", list_loyaltyCardMaster);
			modelAndViewObj.setViewName("CRM/LoyaltyPrograms/LoyaltyCards/loyaltyCards");
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
	 * 
	 *This method is used to display the loyalty card details based on the given loyaltyProgramNumber 
	 *
	 **/
	@RequestMapping("/viewLoyaltyCardDetails")
	public ModelAndView viewLoyaltyCardDetails(@RequestParam("loyaltyProgramNumber") String loyaltyProgramNumber,@RequestParam("maxRecords") String maxRecords,HttpServletRequest request,HttpServletResponse response){
		
//		String zonestr="";
		try{
			// log.info("viewLoyaltyCardDetails ");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<LoyaltyCardMaster> list_loyaltyCardMaster = loyaltyCardServiceObj.getLoyaltyCards(loyaltyProgramNumber,customerIdStr, emailIdStr,"0","");
			
			
			
			int start = 1,end = Integer.parseInt(maxRecords);
//			////////////System.out.println(list_loyaltyCardMaster.size());
			if(list_loyaltyCardMaster.get(0).getLoyaltyCards()== null ){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(list_loyaltyCardMaster.get(0).getLoyaltyCards().size()<Integer.parseInt(maxRecords)){
					end = (list_loyaltyCardMaster.get(0).getLoyaltyCards().size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", list_loyaltyCardMaster.get(0).getTotalLoyaltyCards());
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			
			
			
			List<String> zones  = new ArrayList<String>();
			List<String> states  = new ArrayList<String>();
			List<String> countries  = new ArrayList<String>();
				
			for (LoyaltyZones loyalityZone : list_loyaltyCardMaster.get(0).getLoyaltyZones()) 
			{
				zones.add(loyalityZone.getZone());
				states.add(loyalityZone.getStates());
				countries.add(loyalityZone.getCountry());
			}
		
			
			java.util.Set<String> zoneList = new java.util.LinkedHashSet<String>(zones);  
			java.util.Set<String> countryList = new java.util.LinkedHashSet<String>(countries);
			
			java.util.Set<String> statesList = new java.util.LinkedHashSet<String>(states);
		
			
			modelAndViewObj.addObject("zones",zoneList);
			modelAndViewObj.addObject("countries",countryList);
			modelAndViewObj.addObject("statesList",statesList);

			
				modelAndViewObj.addObject("loyaltyCard", list_loyaltyCardMaster.get(0));
				modelAndViewObj.setViewName("CRM/LoyaltyPrograms/LoyaltyCards/viewLoyaltyCards");
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
	 *This method is used to display the newLoyaltyCard form 
	 *
	 **/
	@RequestMapping("/newLoyaltyCard")
	public ModelAndView newLoyaltyCard(HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("newLoyaltyCard ");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.setViewName("CRM/LoyaltyPrograms/LoyaltyCards/newLoyaltyCards");
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
	 *This method is used to save the details of the Loyalty Cards
	 *
	 **//*
	@RequestMapping(value="/createLoyaltyCards",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createLoyaltyCards(@RequestBody LoyaltyCardMaster loyaltyCardMaster,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("createLoyaltyCards"+loyaltyCardMaster);
			String result;
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			result = loyaltyCardServiceObj.createLayoutCards(loyaltyCardMaster,customerId,emailId);
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.addObject("err", result);
			modelAndViewObj.setViewName("CRM/LoyaltyPrograms/LoyaltyCards/newLoyaltyCards");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}*/
	
	/**
	 * 
	 * @author Mythri.S
	 * created On: 8-oct-2015
	 * 
	 * This method is used to return the customerNotification GUI.
	 * It retrieves the batchNames in different categories and adds to the ModelAndView object,
	 * as it need to be displayed dynamically in the GUI.
	 * 
	 *
	 **/
	
	@RequestMapping("/viewCustomerNotifications")
	public ModelAndView viewCustomerNotifications(HttpServletRequest request,HttpServletResponse response) {
    	try{
    		// log.info("viewCustomerNotifications called");
    		String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,Constants.PAGINATION_START_INDEX);
			List<CustomerNotification> greetingsBatchNameList = customerServiceObj.getBatchNamesByEventType(customerIdStr, emailIdStr,AppProperties.getAppMessageByProperty("GREETING"));
			List<CustomerNotification> campaignBatchNameList = customerServiceObj.getBatchNamesByEventType(customerIdStr, emailIdStr, AppProperties.getAppMessageByProperty("CAMPAIGN"));
			List<CustomerNotification> arrivalBatchNameList = customerServiceObj.getBatchNamesByEventType(customerIdStr, emailIdStr,AppProperties.getAppMessageByProperty("ARRIVAL"));
			List<CustomerNotification> outletBatchNameList = customerServiceObj.getBatchNamesByEventType(customerIdStr, emailIdStr,AppProperties.getAppMessageByProperty("OUTLET"));
    		modelAndViewObj = new ModelAndView();
    		modelAndViewObj.addObject("categoryList",categoryList);
    		modelAndViewObj.addObject("greetingsBatchNameList",greetingsBatchNameList);
    		modelAndViewObj.addObject("campaignBatchNameList",campaignBatchNameList);
    		modelAndViewObj.addObject("arrivalBatchNameList",arrivalBatchNameList);
    		modelAndViewObj.addObject("outletBatchNameList",outletBatchNameList);
    		modelAndViewObj.setViewName("CRM/CustomerViewAndNoification/customerNotification");
    	}catch(Exception e){
    	  e.printStackTrace();	
    	}
    	return modelAndViewObj;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 8-oct-2015
	 * 
	 * This method is used to schedule notification to the customers.
	 * It accepts various filters based on which the customers are selected.
	 *
	 *
	 **/
	@RequestMapping(value = "/createNotificationPackage",method=RequestMethod.POST,consumes="application/json")
	public void createNotificationPackage(@RequestBody FilterInput filterInputObj,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("createNotificationPackage");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String resultStr = customerServiceObj.createNotificationPackage(filterInputObj, customerIdStr, emailIdStr);
			String jsonString = "{\"msg\":\""+resultStr+"\",\"batchName\":\""+filterInputObj.getBatchName()+"\"}";
		
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
	    	response.getWriter().write(jsonString);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On: 8-oct-2015
	 * 
	 * This method is used to get bach details based on the given batchName and category.
	 *
	 *
	 **/
	@RequestMapping(value = "/getBatchDetails")
	public @ResponseBody List<FilterInput> getBatchDetails(@RequestParam("batchName") String batchName,@RequestParam("category") String category,HttpServletRequest request,HttpServletResponse response) {
		List<FilterInput> filterInputObj = new ArrayList<FilterInput>();
		try{
			// log.info("getBatchDetails");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			filterInputObj = customerServiceObj.getBatchInfo(batchName,category, customerIdStr,emailIdStr);
		}catch(Exception e){
			e.printStackTrace();
		}
		return filterInputObj;
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * Created On:15-oct-2015.
	 * 
	 * This method accepts the category, batchName, enable and enables or disables
	 *  the batch based on the value of the enable.
	 * 
	 */

	@RequestMapping("/enableOrDisableBatches")
	public void enableOrDisableBatches(@RequestParam("category") String category,@RequestParam("batchName") String batchName,@RequestParam("enable") Boolean enable,@RequestParam("subCategory") String subCategory,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("enableOrDisableBatches");
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			customerServiceObj.enableOrDisableBatches(batchName,category,enable,subCategory, customerIdStr,emailIdStr);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to view the customer complaint information  
	 *
	 **/
	
	
	@RequestMapping("/viewCustomerComplaints")
	public ModelAndView viewCustomerComplaints(@RequestParam("index")String index,@RequestParam("location")String location,@RequestParam("maxRecords")String maxRecords,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("viewCustomerComplaints ");
			String customerIdStr = (String) request.getSession().getAttribute("customerId");
			String emailIdStr = (String) request.getSession().getAttribute("emailId");
//			List<String> workLocationsList = adminServiceObj.getLocationsList("","",null);
			ArrayList<LocationBean>	locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);

			List<String> workLocationsList = adminServiceObj.getLocationsList("","",null);
			//			Added by vijay, to make default loaction as location list first occurrence, if location is empty
			/*if((location.trim()).equals(null) || location.trim().isEmpty())
			{
				location = workLocationsList.get(0);
			}*/
			
			List<CustomerComplaints> compliantsList = masterServiceObj.getCustomerComplaints("","",index,false,location,"","",maxRecords);
		
			int start = 1,end = Integer.parseInt(maxRecords);
			modelAndViewObj = new ModelAndView();
			if(compliantsList == null || compliantsList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(compliantsList.size()<Integer.parseInt(maxRecords)){
					end = compliantsList.size()+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords",  Integer.parseInt(compliantsList.get(0).getMaxRecords()));
				modelAndViewObj.addObject("index", start);
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("selectedLocation", location);
			modelAndViewObj.addObject("maxRecords",  Integer.parseInt(maxRecords));
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("customerComplaints", compliantsList);
			modelAndViewObj.setViewName("CRM/ComplaintsAndFeedback/customerComplaints");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}

	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to editCustomer Complaints
	 *
	 **/
	@RequestMapping("/editCustomerComplaints")
	public ModelAndView editCustomerComplaints(@RequestParam("complaintId") String complaintIdStr,@RequestParam("operation") String operation,HttpServletRequest request,HttpServletResponse response){
		try{
			// log.info("editCustomerComplaints");
			
			modelAndViewObj = new ModelAndView();
			List<String> workLocationsList = adminServiceObj.getLocationsList("","",null);
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			List<CustomerComplaints> customerComplaintsList = masterServiceObj.getCustomerComplaints(complaintIdStr,"","0",false,"","","","");
			modelAndViewObj.addObject("customerComplaints", customerComplaintsList.get(0));
			modelAndViewObj.addObject("customerObj",customerComplaintsList.get(0).getCustomerObj());
			if(operation.equals("view"))
				modelAndViewObj.setViewName("CRM/ComplaintsAndFeedback/viewCustomerComplaints");
			else
				modelAndViewObj.setViewName("CRM/ComplaintsAndFeedback/editCustomerComplaints");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		
		return modelAndViewObj;
		
	}
	
	
	
	/**
	 * 
	 * @author Viswanath
	 * @desc This method is used to get Complaints
	 *
	 **/
	
	@RequestMapping(value="/getComplaints")
	public @ResponseBody List<CustomerComplaints> getComplaints(@RequestParam("searchName")String mobileNoStr,HttpServletRequest request,HttpServletResponse response){
		List<CustomerComplaints> complaintsList=new ArrayList<CustomerComplaints>();
		try{
			// log.info("getComplaints");
			modelAndViewObj = new ModelAndView();
			if(mobileNoStr != null && !mobileNoStr.equals(""))
				complaintsList=masterServiceObj.getCustomerComplaints("",mobileNoStr,"", false,"","","","");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return complaintsList;
	}
	
	/**
	 * 
	 * @author Viswanath
	 * 
	 *This method is used to display newCustomerComplaints Form
	 *
	 **/
	
		@RequestMapping(value="/newCustomerComplaints")
		public ModelAndView newCustomerComplaints(HttpServletRequest request,HttpServletResponse response){
			try{
				// log.info("newCustomerComplaints");
				modelAndViewObj = new ModelAndView();
				List<String> workLocationsList = adminServiceObj.getLocationsList("","",null);
				modelAndViewObj.addObject("workLocationsList", workLocationsList);
				modelAndViewObj.setViewName("CRM/ComplaintsAndFeedback/newCustomerComplaints");
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
		
		/**
		 * 
		 * @author Viswanath
		 * 
		 *This method is used to search customer complaint
		 *
		 **/
		
		

		@RequestMapping("/searchCustomerComplaints")
		public ModelAndView searchCustomerComplaints(@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,@RequestParam("maxRecords") String maxRecords,@RequestParam("location") String location,@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate, HttpServletRequest request,HttpServletResponse response) {
			try{
				// log.info("searchCustomerComplaints");
				int start = 1,end = Integer.parseInt(maxRecords);
				String customerIdStr = (String) request.getSession().getAttribute("customerId");
				String emailIdStr = (String) request.getSession().getAttribute("emailId");
//				List<String> workLocationsList = adminServiceObj.getLocationsList("","",null);
				ArrayList<LocationBean>	locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
				
				List<String> workLocationsList = adminServiceObj.getLocationsList("","",null);
				List<CustomerComplaints> customerComplaintsList = masterServiceObj.getCustomerComplaints(searchNameStr,"",index,true,location,startDate,endDate,maxRecords);
				modelAndViewObj = new ModelAndView();
				if(customerComplaintsList == null || customerComplaintsList.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(customerComplaintsList.size()<Integer.parseInt(maxRecords)){
						end = customerComplaintsList.size()+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(customerComplaintsList.get(0).getMaxRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
				}
				modelAndViewObj.addObject("selectedLocation", location);
				modelAndViewObj.addObject("maxRecords", maxRecords);
				modelAndViewObj.addObject("searchName", searchNameStr);
				modelAndViewObj.addObject("startDate", startDate);
				modelAndViewObj.addObject("endDate", endDate);
				modelAndViewObj.addObject("workLocationsList", workLocationsList);
				modelAndViewObj.addObject("customerComplaints", customerComplaintsList);
				modelAndViewObj.setViewName("CRM/ComplaintsAndFeedback/customerComplaints");
				
			}catch(Exception e){
				e.printStackTrace();
			}
			return modelAndViewObj;
		}
		
		
		/**
		 * 
		 * @author Viswanath
		 * 
		 *This method is used to create New Customer Complaint
		 *
		 **/
		
		@RequestMapping(value="/createCustomerComplaints",method=RequestMethod.POST,consumes="application/json")
		public ModelAndView createCustomerComplaints(@RequestBody CustomerComplaints customerComplaintsObj,HttpServletRequest request,HttpServletResponse response){
			try{
				// log.info("createCustomerComplaints");
				modelAndViewObj = new ModelAndView();
				List<String> workLocationsList = adminServiceObj.getLocationsList("","",null);
				modelAndViewObj.addObject("workLocationsList", workLocationsList);
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				
				String resultStr=masterServiceObj.createCustomerComplaints(customerComplaintsObj, customerIdStr, emailIdStr);
				if(!resultStr.equals(AppProperties.getAppMessageByProperty("CUSTOMER_COMPLAINT_CREATE_SUCCESS").trim())){
				modelAndViewObj.addObject("err", resultStr);
//				modelAndViewObj.addObject("customerInfo",customerComplaintsObj);
				}
				else {
					modelAndViewObj.addObject("success",resultStr);
				}
				modelAndViewObj.setViewName("CRM/ComplaintsAndFeedback/newCustomerComplaints");
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
		
		/**
		 * 
		 * @author Viswanath
		 * 
		 *This method is used to get Customer Info
		 *
		 **/
		
		@RequestMapping(value="/getCustomerInfo")
		public ModelAndView getCustomerInfo(@RequestParam("mobileNum")String mobileNoStr,HttpServletRequest request,HttpServletResponse response){
			try{
				// log.info("getCustomerInfo");
				modelAndViewObj = new ModelAndView();
				List<String> workLocationsList = adminServiceObj.getLocationsList("","",null);
				modelAndViewObj.addObject("workLocationsList", workLocationsList);
				Customer custDetails=masterServiceObj.getCustomerDetails(mobileNoStr,"", false);
				modelAndViewObj.addObject("customerInfo", custDetails);
				modelAndViewObj.addObject("phone", mobileNoStr);
				modelAndViewObj.setViewName("CRM/ComplaintsAndFeedback/newCustomerComplaints");
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
		
		
		/**
		 * 
		 * @author Viswanath
		 * 
		 *This method is used to update the Existing complaint
		 *
		 **/
		@RequestMapping(value="/updateCustomerComplaints",method=RequestMethod.POST,consumes="application/json")
		public ModelAndView updateCustomerComplaints(@RequestBody CustomerComplaints customerComplaintsObj,HttpServletRequest request,HttpServletResponse response){
			try{
				// log.info("updateCustomerComplaints");
				modelAndViewObj = new ModelAndView();
				List<String> workLocationsList = adminServiceObj.getLocationsList("","",null);
				modelAndViewObj.addObject("workLocationsList", workLocationsList);
				String resultStr=masterServiceObj.updateCustomerComplaints(customerComplaintsObj);
				List<CustomerComplaints> customerComplaintsList = masterServiceObj.getCustomerComplaints(customerComplaintsObj.getComplaintID(), "","0",false,"","","","");
				modelAndViewObj.addObject("customerComplaints", customerComplaintsList.get(0));
				modelAndViewObj.addObject("customerObj",customerComplaintsList.get(0).getCustomerObj());
				if(!resultStr.equals(AppProperties.getAppMessageByProperty("CUSTOMER_COMPLAINT_UPDATE_SUCCESS").trim())){
					modelAndViewObj.addObject("err", resultStr);
					}
					else {
						modelAndViewObj.addObject("success",resultStr);
					}

				modelAndViewObj.setViewName("CRM/ComplaintsAndFeedback/editCustomerComplaints");
//				////////////System.out.println(modelAndViewObj);
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
		
		/**
		 * 
		 * @author Viswanath
		 * 
		 *This method is used to get Complaints
		 *
		 **/
		
		@RequestMapping(value="/getPurchases")
		public @ResponseBody List<BillItems> getPurchases(@RequestParam("status")String statusStr,@RequestParam("phoneNumber")String phoneNumberStr,HttpServletRequest request,HttpServletResponse response){
			Billing billingObj = new Billing();
			List<Billing> billingList = null;
			List<BillItems> billItemsList = new ArrayList<BillItems>();
			try{
				// log.info("getPurchases");
				modelAndViewObj = new ModelAndView();
				if(phoneNumberStr != null && !phoneNumberStr.equals("")){
					billingObj.setPhoneNumber(phoneNumberStr);
					billingObj.setStartIndex("0");
					billingObj.setMaxRecords("10");
					billingList = billingServiceObj.getBills(billingObj, "", statusStr);
					if(billingList != null)
						for(int i=0;i<billingList.size();i++){
							for(int j = 0; j<billingList.get(i).getBillItems().size();j++){
								billItemsList.add(billingList.get(i).getBillItems().get(j));
							}
						}
				}
			}catch(Exception exception){
				exception.printStackTrace();
			}
			return billItemsList;
		}
		
		@RequestMapping(value = "/viewCustomerPurchases")
		public ModelAndView viewCustomerPurchases(HttpServletRequest request,HttpServletResponse response,@RequestParam("index")String index,@RequestParam("maxRecords")String maxRecords,@RequestParam("fromDate")String fromDate,@RequestParam("endDate")String endDate) {
			int start = 1,end = 10;
//			List<String> locationsList = null;
//			Billing billingObj= new Billing();
			String location="";
			try{
				// log.info("viewCustomerPurchases");
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,Constants.PAGINATION_START_INDEX);
				FilterInput filterInputObj = new FilterInput();
				filterInputObj.setStartIndex("0");
				filterInputObj.setMaxRecords("10");
				filterInputObj.setStartDateStr(fromDate);
				filterInputObj.setEndDateStr(endDate);
				ArrayList<LocationBean>	locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
				//Added by vijay, to make default loaction as location list first occurrence, if location is empty
//				locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
				if((location.trim()).equals(null) || location.trim().isEmpty())
				{
					location = "";
				}
				
				filterInputObj.setStoreLocation(location);
				List<CustomerDetails> customersList = customerServiceObj.getCustomerPurchaseList(filterInputObj);
				modelAndViewObj = new ModelAndView();
//				locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
				if(customersList == null || customersList.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(customersList.size()<10)
						end = customersList.size();
					modelAndViewObj.addObject("totalRecords", customersList.get(0).getTotalRecords());
					modelAndViewObj.addObject("index", start);
					modelAndViewObj.addObject("totalValue", end);
				}
				modelAndViewObj.addObject("maxRecords", 10);
			//	modelAndViewObj.addObject("startDate", new Date());
				modelAndViewObj.addObject("locationsList", locationsList);
	    		modelAndViewObj.addObject("customerDetailsList",customersList);
	    		modelAndViewObj.addObject("categoryList",categoryList);
	    		modelAndViewObj.addObject("startDate",fromDate);
	    		modelAndViewObj.addObject("endDate",endDate);
//	    		modelAndViewObj.setViewName("CRM/CustomerViewAndNoification/customerView");
				
				
				
				/*List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("",customerIdStr, emailIdStr,Constants.PAGINATION_START_INDEX);
				modelAndViewObj = new ModelAndView();
				billingObj.setPhoneNumber("");
				billingObj.setStartIndex(index);
				billingObj.setMaxRecords(maxRecords);
				
				List<Billing> billingList =billServiceObj.getBills(billingObj, "", "customer");
				if(billingList == null || billingList.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(billingList.size()<Integer.parseInt(maxRecords))
						end = (billingList.size())+(Integer.parseInt(index));
					else
						end = (Integer.parseInt(index)+end);
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(billingList.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
				}
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.addObject("categoryList",categoryList);
				modelAndViewObj.addObject("billsList",billingList);*/
				modelAndViewObj.setViewName("CRM/CustomerPurchases/customerPurchases");
			}catch(Exception e){
				e.printStackTrace();
			}
			return modelAndViewObj;
		}
		
		
		/**
		 * 
		 * @author Mythri.S
		 * Created On: 1-oct-2015
		 * Reviewed By : Siva Sir on 5-oct-2015 
		 * 
		 * This method is used to get the list of customers based on the filters given by the user.
		 * This list of customers is added to model object and returns a JSP. 
		 *
		 *
		 **/
		@RequestMapping(value = "/getCustomerPurchases",method=RequestMethod.POST,consumes="application/json")
		public ModelAndView getCustomerPurchases(@RequestBody FilterInput filterInputObj,HttpServletRequest request,HttpServletResponse response) {
			try{
				// log.info("getCustomerPurchases");
				List<CustomerDetails> customersList = customerServiceObj.getCustomerPurchaseList(filterInputObj);
//				List<CustomerDetails> customerDetailsList = customerServiceObj.getCustomerList(filterInputObj, customerIdStr, emailIdStr);
				int start = 1,end = Integer.parseInt(filterInputObj.getMaxRecords());
				modelAndViewObj = new ModelAndView();
				if(customersList == null || customersList.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(customersList.size()<Integer.parseInt(filterInputObj.getMaxRecords())){
						end = (customersList.size())+(Integer.parseInt(filterInputObj.getStartIndex()));
					}else{
						end = (Integer.parseInt(filterInputObj.getStartIndex())+end);
					}
					modelAndViewObj.addObject("totalRecords", customersList.get(0).getTotalRecords());
					modelAndViewObj.addObject("index", (Integer.parseInt(filterInputObj.getStartIndex())+start));
					modelAndViewObj.addObject("totalValue", end);
					modelAndViewObj.addObject("filepath", customersList.get(0).getFilePath());
				}

                modelAndViewObj.addObject("zone", filterInputObj.getZoneID());
                modelAndViewObj.addObject("startDate", filterInputObj.getStartDateStr());
                modelAndViewObj.addObject("endDate", filterInputObj.getEndDateStr());
			    modelAndViewObj.addObject("storeLocation", filterInputObj.getStoreLocation());
			    modelAndViewObj.addObject("customerCategory", filterInputObj.getCategory());
				modelAndViewObj.addObject("searchName", filterInputObj.getSearchCriteria());
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(filterInputObj.getMaxRecords()));
				modelAndViewObj.addObject("customerDetailsList",customersList);
				modelAndViewObj.setViewName("CRM/CustomerPurchases/customerDetailsForPurchases");
			}catch(Exception e){
				e.printStackTrace();
			}
			return modelAndViewObj;
		}
		
		
		
		@RequestMapping("/getCustomerVisits")
		public ModelAndView getCustomerVisits(@RequestParam("locationList")String locationList,@RequestParam("saveFlag") boolean saveFlag,@RequestParam("productCategory")String productCategory,@RequestParam("zone")String zone,@RequestParam("index")String index,@RequestParam("maxRecords")String maxRecords,@RequestParam("searchName")String searchName,@RequestParam("location")String location,@RequestParam("startDate")String startDate,@RequestParam("endDate")String endDate,HttpServletRequest request,HttpServletResponse response) {
			FilterInput filterInputObj = new FilterInput();
//			List<String> locationsList= null;
			String customerIdStr = (String) request.getSession().getAttribute("customerId");
			String emailIdStr = (String) request.getSession().getAttribute("emailId");
			try{
				// log.info("getCustomerPurchases");
				filterInputObj.setStartIndex(index);
				filterInputObj.setMaxRecords(maxRecords);
				filterInputObj.setSearchCriteria(searchName);
				filterInputObj.setStoreLocation(location);
				filterInputObj.setStartDate(startDate);
				filterInputObj.setEndDate(endDate);
				filterInputObj.setSaveCustomer(saveFlag);
				filterInputObj.setZoneID(zone);
				filterInputObj.setCategory(productCategory);
				ArrayList<LocationBean>	locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);	
			
				if(zone == null || zone.equals(""))
					locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
					else
					{
						List<ZoneMaster> zoneList = genericMasterServiceObj.getZonalLocationBasedonZone(zone, customerIdStr, emailIdStr, "0","","","Retail Outlet");
						LocationBean saleLocation = null;
						/*if(zoneList != null && zoneList.get(0).getZoneDetails() != null && zoneList.get(0).getZoneDetails().size()>0)
							for(ZoneDetails zoneItems : zoneList.get(0).getZoneDetails() )
							{
								saleLocation = new LocationBean(); 
								saleLocation.setLocationId(zoneItems.getLocation());
								locationBeansList.add(saleLocation);
							}
						else*/
						for(String zoneItems : zoneList.get(0).getZones() )
						{
							String zoneArray[] = zoneItems.split("\\+");
							saleLocation = new LocationBean(); 
							if(zoneArray != null && zoneArray.length>0)
							{
								saleLocation.setLocationId(zoneArray[0]);
								if(zoneArray.length > 1)
								saleLocation.setBusinessActivity(zoneArray[1]);
								if(zoneArray.length > 2)
								saleLocation.setDescription(zoneArray[2]);
								locationsList.add(saleLocation);
							} 
						}
					
					}
				List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
				if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
					 zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,index,"","");
					request.getSession().setAttribute("zoneList", zoneList);
				}
				
				 List<String> locationsListValue=new ArrayList<String>();
					if(location.equals("all") || location == "")
					{
//						locationStr = workLocationsList.get(0);
						if(locationsList != null && !locationsList.isEmpty())
							if(zone ==""){
								for(int i=0;i<locationsList.size();i++){
									locationsListValue.add(locationsList.get(i).getLocationId());
								}
								}
								else
								{
									locationsListValue.add(locationList);
								}
						
						filterInputObj.setLocationsList(locationsListValue);
//						filterInputObj.setLocationList(null);
					}
					else
					{
						filterInputObj.setStoreLocation(location);
//						reportObj.setLocationList(null);
					}
				
				
				
				List<Billing> customerVisitList = customerServiceObj.getCustomerVisitList(filterInputObj);

				int start = 1,end = Integer.parseInt(maxRecords);
				modelAndViewObj = new ModelAndView();
				if(customerVisitList == null || customerVisitList.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(customerVisitList.size()<Integer.parseInt(maxRecords)){
						end = (customerVisitList.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					
					
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(customerVisitList.get(0).getTotalRecords()));
//					////////////System.out.println(Integer.parseInt(customerVisitList.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
					modelAndViewObj.addObject("totalTurnover", customerVisitList.get(0).getTotalTurnOver());
					modelAndViewObj.addObject("noOfCustomerVisits",customerVisitList.get(0).getNoOfCustomerVisits());
					if(saveFlag)
					modelAndViewObj.addObject("filepath", customerVisitList.get(0).getFilePath());
				}

                modelAndViewObj.addObject("zone", zone);
			    modelAndViewObj.addObject("storeLocation", location);
			    modelAndViewObj.addObject("locationsList", locationsList);
				modelAndViewObj.addObject("searchName", searchName);
				modelAndViewObj.addObject("customerCategory", productCategory);
				modelAndViewObj.addObject("startdate", startDate);
				modelAndViewObj.addObject("enddate", endDate);
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.addObject("customerVisitList",customerVisitList);
				modelAndViewObj.setViewName("CRM/CustomerVisits/customerVisits");
			}catch(Exception e){
				e.printStackTrace();
			}
			return modelAndViewObj;
		}
		
		
		
		@RequestMapping("/printCustomerVisitsDetails")
		public void printCustomerVisitsDetails(@RequestParam("locationList")String locationList,@RequestParam("saveFlag") boolean saveFlag,@RequestParam("productCategory")String productCategory,@RequestParam("zone")String zone,@RequestParam("index")String index,@RequestParam("maxRecords")String maxRecords,@RequestParam("searchName")String searchName,@RequestParam("location")String location,@RequestParam("startDate")String startDate,@RequestParam("endDate")String endDate,HttpServletRequest request,HttpServletResponse response){
			FilterInput filterInputObj = new FilterInput();
//			List<String> locationsList= null;
			String customerIdStr = (String) request.getSession().getAttribute("customerId");
			String emailIdStr = (String) request.getSession().getAttribute("emailId");
			try{
				// log.info("getCustomerPurchases");
				filterInputObj.setStartIndex(index);
				filterInputObj.setMaxRecords(maxRecords);
				filterInputObj.setSearchCriteria(searchName);
				filterInputObj.setStoreLocation(location);
				filterInputObj.setStartDate(startDate);
				filterInputObj.setEndDate(endDate);
				filterInputObj.setSaveCustomer(saveFlag);
				filterInputObj.setZoneID(zone);
				filterInputObj.setCategory(productCategory);
				ArrayList<LocationBean>	locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);	
			
				if(zone == null || zone.equals(""))
					locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
					else
					{
						List<ZoneMaster> zoneList = genericMasterServiceObj.getZonalLocationBasedonZone(zone, customerIdStr, emailIdStr, "0","","","Retail Outlet");
						LocationBean saleLocation = null;
						/*if(zoneList != null && zoneList.get(0).getZoneDetails() != null && zoneList.get(0).getZoneDetails().size()>0)
							for(ZoneDetails zoneItems : zoneList.get(0).getZoneDetails() )
							{
								saleLocation = new LocationBean(); 
								saleLocation.setLocationId(zoneItems.getLocation());
								locationBeansList.add(saleLocation);
							}
						else*/
						for(String zoneItems : zoneList.get(0).getZones() )
						{
							String zoneArray[] = zoneItems.split("\\+");
							saleLocation = new LocationBean(); 
							if(zoneArray != null && zoneArray.length>0)
							{
								saleLocation.setLocationId(zoneArray[0]);
								if(zoneArray.length > 1)
								saleLocation.setBusinessActivity(zoneArray[1]);
								if(zoneArray.length > 2)
								saleLocation.setDescription(zoneArray[2]);
								locationsList.add(saleLocation);
							} 
						}
					
					}
				List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
				if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
					 zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,index,"","");
					request.getSession().setAttribute("zoneList", zoneList);
				}
				
				 List<String> locationsListValue=new ArrayList<String>();
					if(location.equals("all") || location == "")
					{
//						locationStr = workLocationsList.get(0);
						if(locationsList != null && !locationsList.isEmpty())
							if(zone ==""){
								for(int i=0;i<locationsList.size();i++){
									locationsListValue.add(locationsList.get(i).getLocationId());
								}
								}
								else
								{
									locationsListValue.add(locationList);
								}
						
						filterInputObj.setLocationsList(locationsListValue);
//						filterInputObj.setLocationList(null);
					}
					else
					{
						filterInputObj.setStoreLocation(location);
//						reportObj.setLocationList(null);
					}
				
				
				
				List<Billing> customerVisitList = customerServiceObj.getCustomerVisitList(filterInputObj);

				int start = 1,end = Integer.parseInt(maxRecords);
				modelAndViewObj = new ModelAndView();
				if(customerVisitList == null || customerVisitList.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(customerVisitList.size()<Integer.parseInt(maxRecords)){
						end = (customerVisitList.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					
					
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(customerVisitList.get(0).getTotalRecords()));
//					////////////System.out.println(Integer.parseInt(customerVisitList.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
					modelAndViewObj.addObject("totalTurnover", customerVisitList.get(0).getTotalTurnOver());
					modelAndViewObj.addObject("noOfCustomerVisits",customerVisitList.get(0).getNoOfCustomerVisits());
					if(saveFlag)
					modelAndViewObj.addObject("filepath", customerVisitList.get(0).getFilePath());
				}

                modelAndViewObj.addObject("zone", zone);
			    modelAndViewObj.addObject("storeLocation", location);
			    modelAndViewObj.addObject("locationsList", locationsList);
				modelAndViewObj.addObject("searchName", searchName);
				modelAndViewObj.addObject("customerCategory", productCategory);
				modelAndViewObj.addObject("startdate", startDate);
				modelAndViewObj.addObject("enddate", endDate);
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.addObject("customerVisitList",customerVisitList);
				  
				  String jsonString = null;
				  if(customerVisitList.get(0).getFilePath() != null){
				if(customerVisitList.get(0).getFilePath().contains("csv"))
					jsonString = customerVisitList.get(0).getFilePath();
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
		
		
		
		@RequestMapping("/getCustomerReferrals")
		public ModelAndView getCustomerReferrals(@RequestParam("saveFlag") boolean saveFlag,@RequestParam("productCategory")String productCategory,@RequestParam("zone")String zone,@RequestParam("index")String index,@RequestParam("maxRecords")String maxRecords,@RequestParam("searchName")String searchName,@RequestParam("location")String location,@RequestParam("startDate")String startDate,@RequestParam("endDate")String endDate,HttpServletRequest request,HttpServletResponse response) {
			CustomerReferralMaster filterInputObj = new CustomerReferralMaster();
//			List<String> locationsList= null;
		
//			List<CustomerReferralMaster> customerVisitList=null;
			String customerIdStr = (String) request.getSession().getAttribute("customerId");
			String emailIdStr = (String) request.getSession().getAttribute("emailId");
			try{
				// log.info("getCustomerPurchases");
				filterInputObj.setStartIndex(index);
				filterInputObj.setMaxRecords(maxRecords);
				filterInputObj.setSearchCriteria(searchName);
//				filterInputObj.setStoreLocation(location);
				filterInputObj.setStartDateStr(startDate);
				filterInputObj.setEndDateStr(endDate);
				filterInputObj.setSaveFlag(saveFlag);
//				filterInputObj.setSaveCustomer(saveFlag);
//				filterInputObj.setZoneID(zone);
//				filterInputObj.setCategory(productCategory);
				ArrayList<LocationBean>	locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,true,false);	
//				locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
				
				List<CustomerReferralMaster> customerVisitList = customerServiceObj.getCustomerReferral(filterInputObj);

				int start = 1,end = Integer.parseInt(maxRecords);
				modelAndViewObj = new ModelAndView();
				if(customerVisitList == null || customerVisitList.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(customerVisitList.size()<Integer.parseInt(maxRecords)){
						end = (customerVisitList.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					
					
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(customerVisitList.get(0).getTotalRecords()));
//					////////////System.out.println(Integer.parseInt(customerVisitList.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
					modelAndViewObj.addObject("filepath", customerVisitList.get(0).getFilePath());
				
				}

                modelAndViewObj.addObject("zone", zone);
			    modelAndViewObj.addObject("storeLocation", location);
			    modelAndViewObj.addObject("locationsList", locationsList);
				modelAndViewObj.addObject("searchName", searchName);
				modelAndViewObj.addObject("customerCategory", productCategory);
				modelAndViewObj.addObject("startdate", startDate);
				modelAndViewObj.addObject("enddate", endDate);
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.addObject("customerReferralList",customerVisitList);
				modelAndViewObj.setViewName("CRM/CustomerReferrals/customerReferrals");
			}catch(Exception e){
				e.printStackTrace();
			}
			return modelAndViewObj;
		}
		
		
		@RequestMapping("/getCustomerSignUp")
		public ModelAndView getCustomerSignUp(@RequestParam("saveFlag") boolean saveFlag,@RequestParam("productCategory")String productCategory,@RequestParam("zone")String zone,@RequestParam("index")String index,@RequestParam("maxRecords")String maxRecords,@RequestParam("searchName")String searchName,@RequestParam("location")String location,@RequestParam("startDate")String startDate,@RequestParam("endDate")String endDate,HttpServletRequest request,HttpServletResponse response) {
            CustomerSignUpMaster filterInputObj = new CustomerSignUpMaster();
//			List<String> locationsList= null;
			String customerIdStr = (String) request.getSession().getAttribute("customerId");
			String emailIdStr = (String) request.getSession().getAttribute("emailId");
			try{
				// log.info("getCustomerPurchases");
				filterInputObj.setStartIndex(index);
				filterInputObj.setMaxRecords(maxRecords);
				filterInputObj.setSearchCriteria(searchName);
				filterInputObj.setStartDateStr(startDate);
				filterInputObj.setEndDateStr(endDate);
				filterInputObj.setSaveFlag(saveFlag);
				ArrayList<LocationBean>	locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,true,false);	
//				locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
				List<CustomerSignUpMaster> customerSignup = customerServiceObj.getCustomersignup(filterInputObj);
//				List<Billing> customerVisitList = customerServiceObj.getCustomerVisitList(filterInputObj);

				int start = 1,end = Integer.parseInt(maxRecords);
				modelAndViewObj = new ModelAndView();
				if(customerSignup == null || customerSignup.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(customerSignup.size()<Integer.parseInt(maxRecords)){
						end = (customerSignup.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					
					
					
					
					
					modelAndViewObj.addObject("totalRecords", customerSignup.get(0).getTotalRecords());
//					////////////System.out.println(Integer.parseInt(customerVisitList.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
					modelAndViewObj.addObject("filepath", customerSignup.get(0).getFilePath());
				}
                modelAndViewObj.addObject("zone", zone);
			    modelAndViewObj.addObject("locationsList", locationsList);
				modelAndViewObj.addObject("searchName", searchName);
				modelAndViewObj.addObject("customerCategory", productCategory);
				modelAndViewObj.addObject("startdate", startDate);
				modelAndViewObj.addObject("enddate", endDate);
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.addObject("customerSignup",customerSignup);
				modelAndViewObj.setViewName("CRM/CustomerReferrals/customerSignUp");
			}catch(Exception e){
				e.printStackTrace();
			}
			return modelAndViewObj;
		}
		
		
		
		@RequestMapping("/newCustomerReferrals")
		public ModelAndView newCustomerReferrals(HttpServletRequest request,HttpServletResponse response){
			try{
				// log.info("newCustomerReferrals");
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				// log.info(request.getLocale());
				ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
				List<String> workLocationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr,emailIdStr,false);
				modelAndViewObj = new ModelAndView();
				String location = (String)request.getSession().getAttribute("selectedLocation");
				modelAndViewObj.addObject("selectedLocation", location);
				modelAndViewObj.addObject("locationBeanList", locationBeanList);
				modelAndViewObj.addObject("workLocationsList", workLocationsList);
				modelAndViewObj.addObject("type","new");
				modelAndViewObj.setViewName("CRM/CustomerReferrals/newCustomerReferral");
			}
			catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
		
		
		
		@RequestMapping("/newCustomerSignUp")
		public ModelAndView newCustomerSignUp(HttpServletRequest request,HttpServletResponse response){
			try{
				// log.info("newCustomerReferrals");
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				// log.info(request.getLocale());
				ArrayList<LocationBean> locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
				List<String> workLocationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr,emailIdStr,false);
				modelAndViewObj = new ModelAndView();
				String location = (String)request.getSession().getAttribute("selectedLocation");
				modelAndViewObj.addObject("selectedLocation", location);
				modelAndViewObj.addObject("locationBeanList", locationBeanList);
				modelAndViewObj.addObject("workLocationsList", workLocationsList);
				modelAndViewObj.addObject("type","new");
				modelAndViewObj.setViewName("CRM/CustomerReferrals/newSignUp");
			}
			catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
		
		@RequestMapping(value = "/getCustomerPurchaseDetails")
		public ModelAndView getCustomerPurchaseDetails(@RequestParam("phoneNumber")String phoneNumber,@RequestParam("index")String index,@RequestParam("maxRecords")String maxRecords,@RequestParam("startDate")String startDate,@RequestParam("endDate")String endDate,@RequestParam("searchName")String searchName,HttpServletRequest request,HttpServletResponse response) {
			List<CustomerPurchases> customersPurchaseList = new ArrayList<CustomerPurchases>();
			try{
				// log.info("getCustomerPurchases");
				if(phoneNumber != null && !phoneNumber.equals(""))
					customersPurchaseList = customerServiceObj.getCustomerPurchaseDetailsList(phoneNumber,index,maxRecords,startDate,endDate,searchName);
//				List<CustomerDetails> customerDetailsList = customerServiceObj.getCustomerList(filterInputObj, customerIdStr, emailIdStr);
				int start = 1,end = Integer.parseInt(maxRecords);
				modelAndViewObj = new ModelAndView();
				if(customersPurchaseList == null || customersPurchaseList.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(customersPurchaseList.size()<Integer.parseInt(maxRecords)){
						end = (customersPurchaseList.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", customersPurchaseList.get(0).getTotalRecords());
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
				}
				modelAndViewObj.addObject("phoneNo", phoneNumber);
				modelAndViewObj.addObject("searchName", searchName);
				modelAndViewObj.addObject("purchaseMaxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.addObject("purchaseList",customersPurchaseList);
				modelAndViewObj.setViewName("CRM/CustomerPurchases/purchases");
			}catch(Exception e){
				e.printStackTrace();
			}
			return modelAndViewObj;
		}
		

		@RequestMapping("/viewBusinessEnquiry")
		public ModelAndView viewBusinessEnquiry(@RequestParam("index")String index,@RequestParam("maxRecords")String maxRecords,@RequestParam("location")String location, HttpServletRequest request,HttpServletResponse response) {
	    	try{
	    		// log.info("viewBusinessEnquiry called");
	    		String customerIdStr = (String) request.getSession().getAttribute("customerId");
	    		String emailIdStr = (String) request.getSession().getAttribute("emailId");
//				List<String> workLocationsList = adminServiceObj.getLocationsList("","",null);
				
	    		ArrayList<LocationBean>	locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
//				Added by vijay, to make default loaction as location list first occurrence, if location is empty
				if((location.trim()).equals(null) || location.trim().isEmpty())
				{
					location = locationsList.get(0).getLocationId();
				}
				
				List<BusinessEnquiry> businessEnquiryList = customerServiceObj.getBusinessEnquiryList(index,maxRecords,"","","",false,location);
				int start = 1,end = Integer.parseInt(maxRecords);
				modelAndViewObj = new ModelAndView();
				if(businessEnquiryList == null || businessEnquiryList.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(businessEnquiryList.size()<Integer.parseInt(maxRecords))
						end = businessEnquiryList.size()+(Integer.parseInt(index));
					else
						end = (Integer.parseInt(index)+end);
					modelAndViewObj.addObject("totalRecords",  Integer.parseInt(businessEnquiryList.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", start);
					modelAndViewObj.addObject("totalValue", end);
				}
				modelAndViewObj.addObject("selectedLocation", location);
				modelAndViewObj.addObject("maxRecords",  Integer.parseInt(maxRecords));
				modelAndViewObj.addObject("workLocationsList", locationsList);
	    		modelAndViewObj.addObject("businessEnquiryList",businessEnquiryList);
	    		modelAndViewObj.setViewName("CRM/BusinessEnquiry/businessEnquiry");
	    	}catch(Exception e){
	    	  e.printStackTrace();	
	    	}
	    	return modelAndViewObj;
		}
		
		@RequestMapping("/searchBusinessEnquiry")
		public ModelAndView searchBusinessEnquiry(@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,@RequestParam("maxRecords") String maxRecords,@RequestParam("location") String location,@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate, HttpServletRequest request,HttpServletResponse response) {
			try{
				// log.info("searchBusinessEnquiry");
				int start = 1,end = Integer.parseInt(maxRecords);
				String customerIdStr = (String) request.getSession().getAttribute("customerId");
				String emailIdStr = (String) request.getSession().getAttribute("emailId");
//				List<String> workLocationsList = adminServiceObj.getLocationsList("","",null);
				ArrayList<LocationBean>	locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
				List<BusinessEnquiry> businessEnquiryList = customerServiceObj.getBusinessEnquiryList(index,maxRecords,searchNameStr,startDate,endDate,true,location);
				modelAndViewObj = new ModelAndView();
				if(businessEnquiryList == null || businessEnquiryList.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(businessEnquiryList.size()<Integer.parseInt(maxRecords)){
						end = businessEnquiryList.size()+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(businessEnquiryList.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
				}
				modelAndViewObj.addObject("selectedLocation", location);
				modelAndViewObj.addObject("maxRecords", maxRecords);
				modelAndViewObj.addObject("searchName", searchNameStr);
				modelAndViewObj.addObject("startDate", startDate);
				modelAndViewObj.addObject("endDate", endDate);
				modelAndViewObj.addObject("workLocationsList", locationsList);
				modelAndViewObj.addObject("businessEnquiryList",businessEnquiryList);
				modelAndViewObj.setViewName("CRM/BusinessEnquiry/businessEnquiry");
			}catch(Exception e){
				e.printStackTrace();
			}
			return modelAndViewObj;
		}
		
		@RequestMapping("/newBusinessEnquiry")
		public ModelAndView newBusinessEnquiry(HttpServletRequest request,HttpServletResponse response) {
	    	try{
	    		// log.info("newBusinessEnquiry");
				modelAndViewObj = new ModelAndView();
				List<String> workLocationsList = adminServiceObj.getLocationsList("","",null);
				modelAndViewObj.addObject("workLocationsList", workLocationsList);
				modelAndViewObj.addObject("type", "new");
	    		modelAndViewObj.setViewName("CRM/BusinessEnquiry/newBusinessEnquiry");
	    	}catch(Exception e){
	    	  e.printStackTrace();	
	    	}
	    	return modelAndViewObj;
		}
		
		@RequestMapping(value="/createBusinessEnquiry",method=RequestMethod.POST,consumes="application/json")
		public ModelAndView createBusinessEnquiry(@RequestBody BusinessEnquiry businessEnquiryObj,HttpServletRequest request,HttpServletResponse response) {
			try{
				// log.info("createBusinessEnquiry");
				String resultStr = customerServiceObj.createBusinessEnquiry(businessEnquiryObj);
				List<String> workLocationsList = adminServiceObj.getLocationsList("","",null);
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("workLocationsList", workLocationsList);
				if(!resultStr.equals(AppProperties.getAppMessageByProperty("BUSINESS_ENQUIRY_CREATE_SUCCESS").trim())){
					modelAndViewObj.addObject("businessEnquiry", businessEnquiryObj);
					modelAndViewObj.addObject("err", resultStr);
				}else{
					modelAndViewObj.addObject("success", resultStr);
				}
				modelAndViewObj.addObject("type", "new");
				modelAndViewObj.setViewName("CRM/BusinessEnquiry/newBusinessEnquiry");
			}catch(Exception e){
				e.printStackTrace();
			}
			return modelAndViewObj;
		}

		@RequestMapping("/viewEditBusinessEnquiry")
		public ModelAndView viewEditBusinessEnquiry(@RequestParam("formData") String formData,@RequestParam("enquiryId")String enquiryId,@RequestParam("operation")String operation, HttpServletRequest request,HttpServletResponse response) {
	    	try{
	    		// log.info("viewEditBusinessEnquiry called");
	    		BusinessEnquiry businessEnquiryObj = customerServiceObj.getBusinessEnquiryDetails(enquiryId);
	    		List<String> workLocationsList = adminServiceObj.getLocationsList("","",null);
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("businessEnquiry", businessEnquiryObj);
				modelAndViewObj.addObject("workLocationsList", workLocationsList);
				
				//added by manasa 
				BusinessEnquiry businessObj=gson.fromJson(formData, BusinessEnquiry.class);
				modelAndViewObj.addObject("businessObj",businessObj);
				
				if(operation.equals("view"))
					modelAndViewObj.setViewName("CRM/BusinessEnquiry/viewBusinessEnquiry");
				else{
					modelAndViewObj.addObject("type", "edit");
					modelAndViewObj.setViewName("CRM/BusinessEnquiry/editBusinessEnquiry");
				}
	    	}catch(Exception e){
	    	  e.printStackTrace();	
	    	}
	    	return modelAndViewObj;
		}


		@RequestMapping(value="/updateBusinessEnquiry",method=RequestMethod.POST,consumes="application/json")
		public ModelAndView updateBusinessEnquiry(@RequestBody BusinessEnquiry businessEnquiryObj,HttpServletRequest request,HttpServletResponse response) {
			try{
				// log.info("updateBusinessEnquiry");
				String resultStr = customerServiceObj.updateBusinessEnquiry(businessEnquiryObj);
				businessEnquiryObj = customerServiceObj.getBusinessEnquiryDetails(businessEnquiryObj.getEnquiryId());
				List<String> workLocationsList = adminServiceObj.getLocationsList("","",null);
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("workLocationsList", workLocationsList);
				modelAndViewObj.addObject("businessEnquiry", businessEnquiryObj);
				if(!resultStr.equals(AppProperties.getAppMessageByProperty("BUSINESS_ENQUIRY_UPDATE_SUCCESS").trim())){
					modelAndViewObj.addObject("err", resultStr);
				}else{
					modelAndViewObj.addObject("success", resultStr);
				}
				modelAndViewObj.addObject("type", "edit");
				modelAndViewObj.setViewName("CRM/BusinessEnquiry/editBusinessEnquiry");
			}catch(Exception e){
				e.printStackTrace();
			}
			return modelAndViewObj;
		}
		
		
		/**
		 * @author Narayan
		 * Created On: 22/7/2016
		 * This method is used to view all the warranty details
		 * 
		 */
		
		@RequestMapping("/viewCustomerWarrants")
		public ModelAndView viewCustomerWarrants(@RequestParam("index")String index,@RequestParam("maxRecords")String maxRecords,@RequestParam("product")String product,@RequestParam("warehouse_location")String warehouse_location,@RequestParam("dealStatus")String dealStatus, HttpServletRequest request,HttpServletResponse response){
			String customerIdStr = (String) request.getSession().getAttribute("customerId");
			String emailIdStr = (String) request.getSession().getAttribute("emailId");	
			try{
//					List<String> locationsList = null;
					// log.info("viewCustomerWarrants");
					String selectedLocation = warehouse_location;
					int start = 1,end = 10;
//					locationsList = adminServiceObj.getLocationsList("","",null);
					ArrayList<LocationBean>	locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
//					Added by vijay, to make default loaction as location list first occurrence, if location is empty
					if((selectedLocation.trim()).equals(null) || selectedLocation.trim().isEmpty())
					{
						selectedLocation = locationsList.get(0).getLocationId();
					}
					
					
					
					
					List<CustomerWarrenty> warrentyList = warrentyServiceObj.getCustomerWarranty("",index,false,"","",product,warehouse_location,dealStatus, maxRecords);
					List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("","", "","-1");
					modelAndViewObj = new ModelAndView();
					if(warrentyList == null || warrentyList.size() == 0){
						modelAndViewObj.addObject("totalRecords","0");
						modelAndViewObj.addObject("Index", "0");
						modelAndViewObj.addObject("totalValue", "0");
					}else{
						if(warrentyList.size()<10)
							end = (warrentyList.size())+(Integer.parseInt(index));
						else
							end = (Integer.parseInt(index)+end);
						modelAndViewObj.addObject("totalRecords", warrentyList.get(0).getTotalRecords());
						modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
						modelAndViewObj.addObject("totalValue", end);
					}
					if(locationsList==null || locationsList.size()==0){
						modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
					}else{
						modelAndViewObj.addObject("locationsList", locationsList);
						
					}
					modelAndViewObj.addObject("selectedLocation",selectedLocation);
					modelAndViewObj.addObject("categoryList", categoryList);
					modelAndViewObj.addObject("customerWarrants", warrentyList);
					modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
					modelAndViewObj.setViewName("CRM/CustomerWarranties/viewCustomerWarrants");
					
					}catch(Exception exception){
						exception.printStackTrace();
					}
				return modelAndViewObj;
			}	
		
		/**
		 * @author Narayan
		 * Created On: 22/7/2016
		 * This method is used to search the warranty details
		 * 
		 */
		
		@RequestMapping("/searchWarrant")
		public ModelAndView searchWarrant(@RequestParam("searchName") String searchNameStr,@RequestParam("index") String index,@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,@RequestParam("product") String product,@RequestParam("warehouse_location") String warehouse_location,@RequestParam("dealStatus") String dealStatus, @RequestParam("maxRecords") String maxRecords,HttpServletRequest request,HttpServletResponse response) {
			try{
				// log.info("searchWarrant");
				String customerIdStr = (String) request.getSession().getAttribute("customerId");
				String emailIdStr = (String) request.getSession().getAttribute("emailId");
				int start = 1,end = Integer.parseInt(maxRecords);
//				List<String> locationsList = null;
				List<CustomerWarrenty> warrentyList = warrentyServiceObj.getCustomerWarranty(searchNameStr,index,true,startDate,endDate,product,warehouse_location,dealStatus, maxRecords);
//				locationsList = adminServiceObj.getLocationsList("","",null);
				ArrayList<LocationBean>	locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
				List<ProductCategoryBean> categoryList = outletMasterServiceObj.getCategoryDetails("","", "","-1");
				modelAndViewObj = new ModelAndView();
				if(warrentyList == null || warrentyList.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(warrentyList.size()<Integer.parseInt(maxRecords)){
						end = (warrentyList.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords", Integer.parseInt(warrentyList.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
				}
				if(locationsList==null || locationsList.size()==0){
					modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
				}else{
					modelAndViewObj.addObject("locationsList", locationsList);
					
				}
				modelAndViewObj.addObject("searchName", searchNameStr);
				modelAndViewObj.addObject("startDate", startDate);
				modelAndViewObj.addObject("endDate", endDate);
				modelAndViewObj.addObject("selectedLocation",warehouse_location);
				modelAndViewObj.addObject("product",product);
				modelAndViewObj.addObject("categoryList", categoryList);
				modelAndViewObj.addObject("dealStatus", dealStatus);
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.addObject("customerWarrants",warrentyList);
				modelAndViewObj.setViewName("CRM/CustomerWarranties/viewCustomerWarrants");
				
			}catch(Exception e){
				e.printStackTrace();
			}
			return modelAndViewObj;
		}
		
		/**
		 * 
		 * @author Soumya Vatte
		 * 
		 *This method is used to view the customer feedback information  
		 *
		 **/
		
		@RequestMapping("/viewCustomerFeedback")
		public ModelAndView viewCustomerFeedback(@RequestParam("startIndex") String index,@RequestParam("maxRecords")String maxRecords,@RequestParam("zone")String zone,
				@RequestParam("location")String location,@RequestParam("salesChannel")String salesChannel,@RequestParam("feedbackCategory")String feedbackCategory,
				@RequestParam("startDate")String startDate,@RequestParam("endDate")String endDate,@RequestParam("search")String search,
				HttpServletRequest request,HttpServletResponse response){
			String customerIdStr = null,emailIdStr=null;
//			List<String> locationsList = null;
			String selectedLocation = location;
			int start = 1,end = Integer.parseInt(maxRecords);
			customerIdStr = (String)request.getSession().getAttribute("customerId");
			emailIdStr = (String)request.getSession().getAttribute("emailId");
			List<Feedback> feedbackList = null;
			try{
				// log.info("viewCustomerFeedback"+maxRecords);
				
//			locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
			
			ArrayList<LocationBean>	locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			
			
			
			
			 feedbackList = feedbackServiceObj.getFeedbackDetails(null,customerIdStr,emailIdStr,search,startDate,endDate,location,false,index,maxRecords,feedbackCategory,"",salesChannel,zone);
			modelAndViewObj = new ModelAndView();
			if(locationsList==null || locationsList.size()==0){
				modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
			}else{
				modelAndViewObj.addObject("locationsList", locationsList);
			    selectedLocation = locationsList.get(0).getLocationId();
			
			if(feedbackList == null || feedbackList.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(feedbackList.size()< Integer.parseInt(maxRecords)){
					end = (feedbackList.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				
				modelAndViewObj.addObject("totalRecords", feedbackList.get(0).getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}		
			}
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
			modelAndViewObj.addObject("feedbackDetails", feedbackList);
			
			modelAndViewObj.addObject("zone",zone);
			modelAndViewObj.addObject("selectedLocation",location);
			modelAndViewObj.addObject("salesChannel",salesChannel);
			modelAndViewObj.addObject("feedbackCategory",feedbackCategory);
			modelAndViewObj.addObject("startdate",startDate);
			modelAndViewObj.addObject("enddate",endDate);
			
			modelAndViewObj.setViewName("CRM/ComplaintsAndFeedback/customerFeedback");
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
		}
		@RequestMapping("/searchCustomerFeedback")
		public ModelAndView searchCustomerFeedback(@RequestParam("searchName") String searchNameStr,@RequestParam("location") String locationStr,@RequestParam("index") String index,@RequestParam("feedbackCategory") String feedbackCategory,@RequestParam("status") String status,@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,@RequestParam("maxRecords") String maxRecords,HttpServletRequest request,HttpServletResponse response) {
			String customerIdStr = null,emailIdStr=null;
			List<Feedback> feedbackList = null;
//			List<String> locationsList=null;
			try{
				// log.info("searchCustomerFeedback"+maxRecords);
				
				int start = 1,end = Integer.parseInt(maxRecords);
				customerIdStr = (String)request.getSession().getAttribute("customerId");
				emailIdStr = (String)request.getSession().getAttribute("emailId");
				feedbackList = feedbackServiceObj.getFeedbackDetails(null,customerIdStr,emailIdStr,searchNameStr,startDate,endDate,locationStr,true,index,maxRecords,feedbackCategory,status,"","");
//			    locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
				ArrayList<LocationBean>	locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
				modelAndViewObj = new ModelAndView();
				modelAndViewObj.addObject("locationsList", locationsList);
			    if(locationStr != null && !locationStr.equals(""))
			 		request.getSession().setAttribute("selectedLocation",locationStr);
				if(feedbackList == null || feedbackList.size() == 0){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(feedbackList.size()<Integer.parseInt(maxRecords)){
						end = (feedbackList.size())+(Integer.parseInt(index));
						
					}else{
						end = (Integer.parseInt(index)+end);
						// log.info(maxRecords+"else");
					}
					modelAndViewObj.addObject("totalRecords",feedbackList.get(0).getTotalRecords());
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
				}
				if(startDate.trim()!="")
					startDate = startDate.substring(0, 10);
				if(endDate.trim()!="")
					endDate = endDate.substring(0, 10);
				modelAndViewObj.addObject("searchName", searchNameStr);
				modelAndViewObj.addObject("startDate", startDate);
				modelAndViewObj.addObject("endDate", endDate);
				modelAndViewObj.addObject("status", status);
				modelAndViewObj.addObject("feedbackCategory", feedbackCategory);
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.addObject("feedbackDetails",feedbackList);
				modelAndViewObj.addObject("selectedLocation",locationStr);
				modelAndViewObj.setViewName("CRM/ComplaintsAndFeedback/customerFeedback");
			}catch(Exception e){
				e.printStackTrace();
			}
			return modelAndViewObj;
		}
		/**
		 * 
		 * @author Soumya Vatte
		 * 
		 *This method is used to display newCustomerFeedback Form
		 *
		 **/
		
			@RequestMapping(value="/newCustomerFeedback")
			public ModelAndView newCustomerFeedback(HttpServletRequest request,HttpServletResponse response){
				List<String> locationsList=null;
				try{
					// log.info("newCustomerFeedback");
					modelAndViewObj = new ModelAndView();
					String customerIdStr = (String)request.getSession().getAttribute("customerId");
					String emailIdStr = (String)request.getSession().getAttribute("emailId");
					locationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
					if(locationsList==null || locationsList.size()==0){
						modelAndViewObj.addObject("err",AppProperties.getAppMessageByProperty("LOCATIONS_NOT_AVAILABLE"));
					}else{
						modelAndViewObj.addObject("locationsList", locationsList);
					   // selectedLocation = locationsList.get(0);
					}
					modelAndViewObj.addObject("type", "new");
					modelAndViewObj.setViewName("CRM/ComplaintsAndFeedback/newCustomerFeedback");
				}catch(Exception exception){
					exception.printStackTrace();
				}
				return modelAndViewObj;
			}
			

/**
 * 
 * @author Soumya Vatte
 * 
 *This method is used to create New Customer Feedback
 *
 **/

@RequestMapping(value="/createCustomerFeedback" ,method=RequestMethod.POST,consumes="application/json")
public ModelAndView createCustomerFeedback(@RequestBody Feedback feedbackObj,HttpServletRequest request,HttpServletResponse response){
	String resultStr = "";
	
	try{
		// log.info("createCustomerFeedback");
		modelAndViewObj = new ModelAndView();
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		
		resultStr=feedbackServiceObj.createCustomerFeedback(feedbackObj, customerIdStr, emailIdStr);
		
		if(!resultStr.equals(AppProperties.getAppMessageByProperty("CUSTOMER_FEEDBACK_CREATE_SUCCESS").trim())){
			/*feedbackObj.setStoreLocation(null);
			feedbackObj.setFeedback_date(null);
			feedbackObj.setFeedbackChannel(null);
			feedbackObj.setCustomerName(null);
			feedbackObj.setCustomer_mobileNo(null);
			feedbackObj.setCustomer_emailId(null);
			feedbackObj.setCountry(null);*/
		
			
			modelAndViewObj.addObject("feedbackObj", feedbackObj);
			modelAndViewObj.addObject("err", resultStr);
		}else{
			modelAndViewObj.addObject("success", resultStr);
		}
		//modelAndViewObj.addObject("selectedLocation",location);
		modelAndViewObj.setViewName("CRM/ComplaintsAndFeedback/newCustomerFeedback");
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}
@RequestMapping("/editFeedback")
public ModelAndView editEvent(@RequestParam("feedback_id") String feedback_id,@RequestParam("operation") String operation,@RequestParam("formData") String formData,HttpServletRequest request,
		HttpServletResponse response){
	String customerIdStr = (String)request.getSession().getAttribute("customerId");
	String emailIdStr = (String)request.getSession().getAttribute("emailId");
	try{
		// log.info("editFeedback");
		Feedback feedbackList = feedbackServiceObj.getFeedbackDetailsbyId(feedback_id,customerIdStr,emailIdStr,null,"","","",false,"0","","","");
		modelAndViewObj = new ModelAndView();
		
		//added by manasa 
				Feedback dealObj=gson.fromJson(formData, Feedback.class);
				modelAndViewObj.addObject("dealObj",dealObj);
		
		if(feedbackList != null ){
		
		if(operation.equals("view")){
			modelAndViewObj.addObject("feedbackObj",feedbackList);
			modelAndViewObj.setViewName("CRM/ComplaintsAndFeedback/viewFeedback");
		}
			
		else{
			modelAndViewObj.addObject("type", "edit");	
			modelAndViewObj.addObject("feedbackObj",feedbackList);
			
			modelAndViewObj.setViewName("CRM/ComplaintsAndFeedback/editFeedback");
		}
		}
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}


@RequestMapping(value="/updateFeedback",method=RequestMethod.POST,consumes="application/json")
public ModelAndView updateFeedback(@RequestBody Feedback feedbackObj,HttpServletRequest request,HttpServletResponse response) {
	
	
	
String resultStr = "";
	
	try{
		// log.info("updateCustomerFeedback");
		modelAndViewObj = new ModelAndView();
		
		
		
		resultStr=feedbackServiceObj.updateFeedback(feedbackObj);
		
		if(!resultStr.equals(AppProperties.getAppMessageByProperty("CUSTOMER_FEEDBACK_UPDATE_SUCCESS").trim())){
			/*feedbackObj.setStoreLocation(null);
			feedbackObj.setFeedback_date(null);
			feedbackObj.setFeedbackChannel(null);
			feedbackObj.setCustomerName(null);
			feedbackObj.setCustomer_mobileNo(null);
			feedbackObj.setCustomer_emailId(null);
			feedbackObj.setCountry(null);*/
		
			
			modelAndViewObj.addObject("feedbackObj", feedbackObj);
			modelAndViewObj.addObject("err", resultStr);
		}else{
			modelAndViewObj.addObject("success", resultStr);
		}
		//modelAndViewObj.addObject("selectedLocation",location);
		modelAndViewObj.addObject("feedbackObj", feedbackObj);
		modelAndViewObj.setViewName("CRM/ComplaintsAndFeedback/viewFeedback");
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
	/*try{
		// log.info("updateFeedback");
		//String resultStr = feedbackServiceObj.updateEvent(feedbackObj);
		//List<BusinessEvent> businessEventList = eventServiceObj.getEvents(businessEventObj.getEventId(), "0", false,true,"","","");
		modelAndViewObj = new ModelAndView();
		//if(!resultStr.equals(AppProperties.getAppMessageByProperty("EVENT_UPDATE_SUCCESS").trim())){
		//	modelAndViewObj.addObject("err", resultStr);
	//	}else{
	//		modelAndViewObj.addObject("success", resultStr);
	//	}
	//	modelAndViewObj.addObject("businessEventObj",businessEventList.get(0));
		modelAndViewObj.addObject("type", "edit");
		modelAndViewObj.setViewName("CRM/ComplaintsAndFeedback/newCustomerFeedback");
		
	}catch(Exception e){
		e.printStackTrace();
	}
	return modelAndViewObj;*/
}
		



/**
 * @writtenBy: Akhil M
 * @date: 4th nov,2018
 * @verified By: 
     * @description: This method is used to view the selected customer group
     * 
     * 
     */
@RequestMapping("/viewCustomerGroup")
public ModelAndView viewCustomerGroup(
		
		@RequestParam("index") String index, 
		@RequestParam("searchCriteria") String searchCriteria, 
		@RequestParam("maxRecords")String maxRecords,
		@RequestParam("saveCustomerGroup")Boolean saveCustomerGroup,
		@RequestParam("outletZone") String outletZone, 
		@RequestParam("outletLocation") String outletLocation, 
		@RequestParam("from")String from,
		@RequestParam("to")String to,
		HttpServletRequest request,HttpServletResponse response){
	ArrayList<LocationBean> locationsList = null;
	try{
		// log.info("viewCustomerGroup ");
		int start = 1,end = Integer.parseInt(maxRecords);
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		List<CustomerGroupMaster> groupsList = customerServiceObj.getCustomerGroupDetails(searchCriteria,customerIdStr, emailIdStr,index,maxRecords,true, saveCustomerGroup,outletZone,outletLocation,from,to);
		
		locationsList = Utilities.getLocationsOnZone(outletZone, customerIdStr, emailIdStr, "");//Utilities.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
		
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
		
		if (saveCustomerGroup) {
			if (groupsList.get(0).getFilePath() != null)
				modelAndViewObj.addObject("downloadurl", groupsList.get(0).getFilePath());
		} 
		 modelAndViewObj.addObject("locationsList", locationsList);
			
		modelAndViewObj.addObject("groupsList", groupsList);
	    modelAndViewObj.addObject("maxRecords",maxRecords);
	    modelAndViewObj.addObject("startDate",from);
	    modelAndViewObj.addObject("endDate",from);
	    modelAndViewObj.addObject("zone",outletZone);
	    modelAndViewObj.addObject("storeLocation",outletLocation);
		modelAndViewObj.addObject("searchName",searchCriteria);
		modelAndViewObj.setViewName("CRM/CustomerGroup/customerGroup");
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}


/**
 * @writtenBy: Akhil M
 * @date: 4th nov,2018
 * @verified By: 
     * @description: This method is used to update the changes done in customer group
     * 
     * 
     */	
@RequestMapping(value="/updateCustomersGroup",method=RequestMethod.POST,consumes="application/json")
public ModelAndView updateCustomersGroup(@RequestBody CustomerGroupMaster groupObj,HttpServletRequest request,HttpServletResponse response){
	
	try{
		// log.info("updateCustomersGroup");
		int end=10;
		modelAndViewObj = new ModelAndView();
		groupObj.setStartIndex("0");
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		String resultStr=customerServiceObj.updateCustomerGroup(groupObj, customerIdStr, emailIdStr);
		
//		//////////System.out.println(resultStr);
//		//////////System.out.println("Result of first service request i.e update");
		if(!resultStr.equals(AppProperties.getAppMessageByProperty("CUSTOMER_GROUP_UPDATE_SUCCESS").trim()))
			modelAndViewObj.addObject("err", resultStr);
		else
			modelAndViewObj.addObject("success", resultStr);
//		//////////System.out.println("elements for second reuest"+ groupObj.getGroup_id() + " " + groupObj.getStartIndex() );
		CustomerGroupMaster groupDetails = customerServiceObj.getCustomerGroupDetailsforGroupId(groupObj.getGroup_id(),customerIdStr, emailIdStr,groupObj.getStartIndex(),false,"");
		
		List<LocationBean> locationsList = Utilities.getLocationsOnZone(groupObj.getZone(), customerIdStr, emailIdStr, "");//Utilities.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
		modelAndViewObj.addObject("locationsList", locationsList);
		if(groupDetails.getCustomerGroupList() == null){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(groupDetails.getCustomerGroupList().size()<end){
				end = (Integer.parseInt(groupObj.getStartIndex()) + groupDetails.getCustomerGroupList().size());
			}
			
			modelAndViewObj.addObject("totalRecords", groupDetails.getTotalRecords() );
			modelAndViewObj.addObject("index", Integer.parseInt(groupObj.getStartIndex()) + 1);
			modelAndViewObj.addObject("totalValue", Integer.parseInt(groupObj.getStartIndex()) + groupDetails.getCustomerGroupList().size());
			
		}
		
		modelAndViewObj.addObject("customerGroup", groupDetails.getCustomerGroupList());
		modelAndViewObj.addObject("operation", "edit");
		modelAndViewObj.addObject("type", "edit");
		 modelAndViewObj.addObject("maxRecords",groupObj.getMaxRecords());
		 modelAndViewObj.addObject("searchName",groupObj.getSearchCriteria());
		modelAndViewObj.setViewName("CRM/CustomerGroup/editCustomerGroup");
//		//////////System.out.println(modelAndViewObj);
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}



/**
 * @writtenBy: Akhil M
 * @date: 4th nov,2018
 * @verified By: 
     * @description: This method is used to search customers in DB
     * 
     * 
     */
@RequestMapping("/searchCustomers")
public @ResponseBody List<CustomerDetails> searchCustomers(@RequestParam("searchName") String searchNameStr, HttpServletRequest request,HttpServletResponse response) {
	String customerIdStr = null,emailIdStr=null;
	List<CustomerDetails> customersList = new ArrayList<CustomerDetails>();
	try{
		// log.info("searchCustomers");
		customerIdStr = (String)request.getSession().getAttribute("customerId");
		emailIdStr = (String)request.getSession().getAttribute("emailId");
		customersList = customerServiceObj.searchCustomers(customerIdStr, emailIdStr,searchNameStr);
		// log.info("Result:::"+customersList);
	
	}catch(Exception e){
		e.printStackTrace();
	}
	return customersList;
}

/**
 * @writtenBy: Akhil M
 * @date: 4th nov,2018
 * @verified By: 
     * @description: This method is used to search customers based on phone number
     * 
     * 
     */
@RequestMapping("/searchCustomersByPhone")
public @ResponseBody CustomerDetails searchCustomersByPhone(@RequestParam("phone") String phone, HttpServletRequest request,HttpServletResponse response) {
	String customerIdStr = null,emailIdStr=null;
	CustomerDetails customerDetails = new CustomerDetails();
	try{
		// log.info("searchCustomers");
		customerIdStr = (String)request.getSession().getAttribute("customerId");
		emailIdStr = (String)request.getSession().getAttribute("emailId");
		customerDetails = customerServiceObj.getCustomerDetails(customerIdStr, emailIdStr,phone);
		// log.info("Result:::"+customerDetails);
		//////////System.out.println("Result:::"+customerDetails);
	
	}catch(Exception e){
		e.printStackTrace();
	}
	return customerDetails;
}

/**
 * @writtenBy: Akhil M
 * @date: 4th nov,2018
 * @verified By: 
     * @description: This method is used to to create customer group
     * 
     * 
     */
@RequestMapping(value="/createCustomersGroup",method=RequestMethod.POST,consumes="application/json")
public ModelAndView createCustomersGroup(@RequestBody CustomerGroupMaster groupObj,HttpServletRequest request,HttpServletResponse response){
	ArrayList<LocationBean> locationsList = null;
	try{
		// log.info("createCustomerGroupMaster");
		modelAndViewObj = new ModelAndView();
		
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
		String resultStr=customerServiceObj.createNewCustomerGroup(groupObj, customerIdStr, emailIdStr);
		
		if(!resultStr.equals(AppProperties.getAppMessageByProperty("GROUP_CREATE_SUCCESS").trim()))
		{
			
			modelAndViewObj.addObject("customerGroup", groupObj);
			modelAndViewObj.addObject("err", resultStr);
			modelAndViewObj.addObject("type", "new");
			modelAndViewObj.setViewName("CRM/CustomerGroup/newCustomerGroupMaster");
		}
		else
		{
			modelAndViewObj.addObject("success", resultStr);
			modelAndViewObj.setViewName("CRM/CustomerGroup/newCustomerGroupMaster");
		}
	}
	catch(Exception exception)
	{
		exception.printStackTrace();
	}
	 modelAndViewObj.addObject("maxRecords",groupObj.getMaxRecords());
	 modelAndViewObj.addObject("searchName",groupObj.getSearchCriteria());
	 modelAndViewObj.addObject("locationsList", locationsList);
	 
	return modelAndViewObj;
}

/**
 * @writtenBy: Akhil M
 * @date: 4th nov,2018
 * @verified By: 
     * @description: This method is used to create new group
     * 
     * 
     */
@RequestMapping(value="/newCustomerGroupMaster")
public ModelAndView newCustomerGroupMaster(HttpServletRequest request,HttpServletResponse response){
ArrayList<LocationBean> locationsList = null;
try{
	// log.info("newCustomerGroupMaster");
	String customerIdStr = (String)request.getSession().getAttribute("customerId");
	String emailIdStr = (String)request.getSession().getAttribute("emailId");
	modelAndViewObj = new ModelAndView();
	locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
	
	modelAndViewObj.addObject("locationsList", locationsList);
	modelAndViewObj.setViewName("CRM/CustomerGroup/newCustomerGroupMaster");
	
	////////////System.out.println(modelAndViewObj);
}catch(Exception exception){
	exception.printStackTrace();
}
return modelAndViewObj;
}


/**
 * @writtenBy: Akhil M
 * @date: 4th nov,2018
 * @verified By: 
     * @description: This method is used to delete the available customer group
     * 
     * 
     */
@RequestMapping("/deleteCustomerGroup")
public ModelAndView deleteCustomerGroup(@RequestParam("ids") String ids,@RequestParam("maxRecords") String maxRecords,
	@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
try{
	// log.info("deleteCustomerGroup ");
	int start = 1,end = Integer.parseInt(maxRecords);
	modelAndViewObj = new ModelAndView();
	String customerId = (String)request.getSession().getAttribute("customerId");
	String emailId = (String)request.getSession().getAttribute("emailId");
    //////////System.out.println(ids);
	String resultStr = customerServiceObj.deleteCustomerGroup(customerId,emailId,ids);
	////////////System.out.println(resultStr);changed the method for filter
	List<CustomerGroupMaster> groupDetails = customerServiceObj.getCustomerGroupDetails(searchName,customerId, emailId,"0",maxRecords,true,false,"","","","");
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
	modelAndViewObj.setViewName("CRM/CustomerGroup/customerGroup");
}
catch(Exception exception){
	exception.printStackTrace();
}
return modelAndViewObj;
}

/**
 * @writtenBy: Akhil M
 * @date: 4th nov,2018
 * @verified By: 
     * @description: This method is used to get the edit page of customer group
     * 
     * 
     */
@RequestMapping("/editCustomerGroup")
public ModelAndView editCustomerGroup(@RequestParam("index") String index,@RequestParam("searchcriteria") String searchcriteria,@RequestParam("groupId") String groupIdStr,@RequestParam("operation") String operation,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response)throws Exception{
	ArrayList<LocationBean> locationsList = null;
	
	try{
		// log.info("editCustomerGroup");
		int start = 1,end =Integer.parseInt(maxRecords);
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		modelAndViewObj = new ModelAndView();
		CustomerGroupMaster groupDetails = customerServiceObj.getCustomerGroupDetailsforGroupId(groupIdStr,customerIdStr, emailIdStr,index,false,searchcriteria);
		modelAndViewObj.addObject("customerGroup", groupDetails.getCustomerGroupList());
		////////////System.out.println(groupDetails);
		modelAndViewObj.addObject("type", "edit");
		locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
		
		modelAndViewObj.addObject("locationsList", locationsList);
			if(groupDetails.getCustomerGroupList()== null)
			{
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}
			else
			{
				if(groupDetails.getCustomerGroupList().size()<Integer.parseInt(maxRecords))
				{
					end = (groupDetails.getCustomerGroupList().size())+(Integer.parseInt(index));
				}else
				{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", groupDetails.getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			
			if(operation.equals("view"))
			{
				modelAndViewObj.addObject("searchCriteria",searchcriteria); 
				modelAndViewObj.setViewName("CRM/CustomerGroup/viewCustomerGroup");
			}
		
		else{
			
			modelAndViewObj.setViewName("CRM/CustomerGroup/editCustomerGroup");
			
		}
	}
	catch(Exception exception){
		//throw new Exception(exception.getMessage());
		exception.printStackTrace();
		
	}
	modelAndViewObj.addObject("operation",operation);
	modelAndViewObj.addObject("maxRecords",maxRecords);
	modelAndViewObj.addObject("searchName",searchName); 
	////////////System.out.println("object came back to view1");
	return modelAndViewObj;
	
}

/**
 * @writtenBy: Akhil M
 * @date: 4th nov,2018
 * @verified By: 
     * @description: This method is used to import data from excel sheet
     * 
     * 
     */
@RequestMapping(value="/importExcelData",method=RequestMethod.POST)
	public ModelAndView   importExcelData(@RequestParam("file") MultipartFile excelFile,HttpServletRequest request,HttpServletResponse response) {
		MasterDataImportsAndExportsBean masterDataImportsAndExportsBean=null;
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		ArrayList<LocationBean> locationsList = null;
		String history = "";
		modelAndViewObj = new ModelAndView();
		String maxRecords= "10";
		String index = "0";
		String searchCriteria = "";
		String outletZone="",outletLocation="",from="",to="";
		boolean saveCustomerGroup = false;
		try{
			
			RestfulServiceConnection restfulServiceConnection=new RestfulServiceConnection();
			masterDataImportsAndExportsBean = restfulServiceConnection.uploadFile(customerId, excelFile);
			masterDataImportsAndExportsBean.getFileName();
			
		    history = customerServiceObj.importService(masterDataImportsAndExportsBean.getFileName(), customerId, emailId);

			
			if(history != null && !history.equals("")){
				
				int start = 1,end = Integer.parseInt(maxRecords);
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				List<CustomerGroupMaster> groupsList = customerServiceObj.getCustomerGroupDetails(searchCriteria,customerIdStr, emailIdStr,index,maxRecords,true, saveCustomerGroup,outletZone,outletLocation,from,to);
				
				locationsList = Utilities.getLocationsOnZone(outletZone, customerIdStr, emailIdStr, "");
				
				
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
				
				if (saveCustomerGroup) {
					if (groupsList.get(0).getFilePath() != null)
						modelAndViewObj.addObject("downloadurl", groupsList.get(0).getFilePath());
				} 
				 modelAndViewObj.addObject("locationsList", locationsList);
					
				modelAndViewObj.addObject("groupsList", groupsList);
			    modelAndViewObj.addObject("maxRecords",maxRecords);
			    modelAndViewObj.addObject("startDate",from);
			    modelAndViewObj.addObject("endDate",from);
			    modelAndViewObj.addObject("zone",outletZone);
			    modelAndViewObj.addObject("storeLocation",outletLocation);
				modelAndViewObj.addObject("searchName",searchCriteria);
				modelAndViewObj.addObject("success",history);
				modelAndViewObj.setViewName("CRM/CustomerGroup/customerGroup");
			
			
			}
		   }catch(Exception e){
			
			e.printStackTrace();
		   }

		return modelAndViewObj;
	}

/**
 * 
 * @author Vasudeva Reddy.G
 * @Created_on: 17/09/2019
 * @description :This method is used to display all the membership details in a tabular form
 * 
 **/
@RequestMapping("/viewMemberships")
public ModelAndView viewMemberships(@RequestParam("maxRecords")String maxRecords,@RequestParam("allLocationsList")String allLocationsList,@RequestParam("searchName")String searchName,@RequestParam("location")String location,@RequestParam("zone")String zone,@RequestParam("startdate")String startdate,@RequestParam("enddate")String enddate,@RequestParam("index")String index,@RequestParam("membershipType")String membershipType
		,@RequestParam("status")String status,HttpServletRequest request,HttpServletResponse response){
	
	String locationListAll="";
	try{
		int start = 1,end = Integer.parseInt(maxRecords);
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		ArrayList<LocationBean> locationDetails = new ArrayList<LocationBean>();//genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,false,true);	
		 List<String> locationsListValue=new ArrayList<String>();
		 

			if(zone == null || zone.equals(""))
				locationDetails = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,true,false);
			//locationDetails = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
	
			else
				{
					List<ZoneMaster> zoneList = genericMasterServiceObj.getZonalLocationBasedonZone(zone, customerIdStr, emailIdStr, "0","","","");
					//List<ZoneMaster> zoneList = genericMasterServiceObj.getZonalLocationBasedonZone(zone, customerIdStr, emailIdStr, "0","","","Retail Outlet");

					LocationBean saleLocation = null;
					
					for(String zoneItems : zoneList.get(0).getZones() )
					{
						String zoneArray[] = zoneItems.split("\\+");
						saleLocation = new LocationBean(); 
						if(zoneArray != null && zoneArray.length>0)
						{
							saleLocation.setLocationId(zoneArray[0]);
							if(zoneArray.length > 1)
							saleLocation.setBusinessActivity(zoneArray[1]);
							if(zoneArray.length > 2)
							saleLocation.setDescription(zoneArray[2]);
							locationDetails.add(saleLocation);
						} 
					}
				
				}
		 
		 
  			if(location.equals("all")|| location.equals("")){
				if(locationDetails != null){
					if(zone ==""){
						for(int i=0;i<locationDetails.size();i++){
							locationsListValue.add(locationDetails.get(i).getLocationId());
						}
						}
						else
						{
							locationsListValue.add(allLocationsList);
						}
					for (String string : locationsListValue) {
						
						locationListAll = locationListAll+string+",";
					}
				}
				
			}
		
		List<MembershipMaster> list_membership= loyaltyCardServiceObj.getMemberships("",customerIdStr, emailIdStr,index,location,zone,startdate,enddate,searchName,locationListAll,maxRecords,membershipType,status,"");
		modelAndViewObj = new ModelAndView();
		if(list_membership == null){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(list_membership.size()<Integer.parseInt(maxRecords)){
				end = (list_membership.size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			modelAndViewObj.addObject("totalRecords", (list_membership.get(0).getTotalRecords()));
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);

		}
		modelAndViewObj.addObject("locationsList", locationDetails);
		modelAndViewObj.addObject("membershiplist", list_membership);
		modelAndViewObj.addObject("searchName", searchName);
		modelAndViewObj.addObject("searchlocation", location);
		modelAndViewObj.addObject("zone", zone);
		modelAndViewObj.addObject("status", status);
		modelAndViewObj.addObject("membershipTypeFilter", membershipType);
		modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
		modelAndViewObj.addObject("startdate", startdate);
		modelAndViewObj.addObject("enddate", enddate);
    	modelAndViewObj.addObject("searchCriteriamaster",searchName);

		modelAndViewObj.setViewName("CRM/LoyaltyPrograms/Memberships/memberships");
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}

/**
 * 
 * @author Vasudeva Reddy.G
 * @Created_on: 17/09/2019
 * @description :1.This method will return model and view object with new Membership jsp page
 * 
 **/
@RequestMapping("/newMembership")
public ModelAndView newMembership(HttpServletRequest request,HttpServletResponse response){
	try{
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("CRM/LoyaltyPrograms/Memberships/newMembership");
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}

/**
 * 
 * @author Vasudeva Reddy.G
 * @Created_on: 17/09/2019
 * @description :This method is used to display specific membership details.
 * 
 **/
@RequestMapping("/viewMembershipDetails")
public ModelAndView viewMembershipDetails(@RequestParam("type")String type,@RequestParam("id")String membershipProgramCode,@RequestParam("index")String index,@RequestParam("searchName")String searchName,@RequestParam("pagination")String pagination,HttpServletRequest request,HttpServletResponse response){
	String zonestr="";
//	List<String> zonalLocations=new ArrayList<String>();
	try{

		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		List<MembershipMaster> list_membership= loyaltyCardServiceObj.getMemberships(membershipProgramCode,customerIdStr, emailIdStr,index,"","","","",searchName,"","10","","",pagination);
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("membership", list_membership.get(0));
		List<String> zones  = new ArrayList<String>();
		List<String> locations  = new ArrayList<String>();
		
		for (MembershipLocations loyalityZone : list_membership.get(0).getMembershipLocations()) 
		{
			zones.add(loyalityZone.getZoneId());
			locations.add(loyalityZone.getValidLocations());
			
		}
		for(String string:zones)
		{
//			zonestr=zoneStr+zonestr+",";
			zonestr = zonestr+string+",";
		}
		int start = 1,end = Integer.parseInt("10");
		
		if(list_membership== null ){
			
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
			
		}else{
			if(list_membership.get(0).getQuantity()<Integer.parseInt("10")){
				end = (list_membership.get(0).getQuantity())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
				if(end>list_membership.get(0).getQuantity())
				{
					end=list_membership.get(0).getQuantity();
				}
			}
			modelAndViewObj.addObject("totalRecords", list_membership.get(0).getQuantity());
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
		}
		
		
		Set<String> locationsbasedzone = genericMasterServiceObj.getlocationsBasedOnZone(zonestr,customerIdStr, emailIdStr, "0","","");
		ArrayList<LocationBean> locationDetails = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,false,true);
		java.util.Set<String> zoneList = new java.util.LinkedHashSet<String>(zones); 
		java.util.Set<String> locationList = new java.util.LinkedHashSet<String>(locations);
    modelAndViewObj.addObject("maxRecords",Integer.parseInt("10"));
    modelAndViewObj.addObject("zones",zoneList);
	modelAndViewObj.addObject("locationDetails", locationDetails);
	modelAndViewObj.addObject("locationsbasedzone",locationsbasedzone);
	modelAndViewObj.addObject("locationList",locationList);
		if(type.equals("view"))
		modelAndViewObj.setViewName("CRM/LoyaltyPrograms/Memberships/viewMembership");
		else
		modelAndViewObj.setViewName("CRM/LoyaltyPrograms/Memberships/editMembership");	
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndViewObj;
}

/**
 * 
 * @author Vasudeva Reddy.G
 * @Created_on: 17/09/2019
 * @description :1.This method is used to save the details of the Membership
 * 2.This method returns a message based on the successful creation or not 
 **/		
@RequestMapping(value="/createMembership",method=RequestMethod.POST,consumes="application/json")
public ModelAndView createMembership(@RequestBody MembershipMaster membershipMaster,HttpServletRequest request,HttpServletResponse response) {
//	String zonestr="";
	try{

		String result;
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		
		
		
		result = loyaltyCardServiceObj.createMembership(membershipMaster,customerId,emailId);
		modelAndViewObj = new ModelAndView();		
		if(!result.equals(AppProperties.getAppMessageByProperty("MEMBERSHIP_CREATE_SUCCESS").trim())){
			modelAndViewObj.addObject("err", result);
			Set<String> locationsbasedzone = genericMasterServiceObj.getlocationsBasedOnZone(membershipMaster.getZoneId(),customerId, emailId, "0","","");
			modelAndViewObj.addObject("locationsbasedzone", locationsbasedzone);
//			modelAndViewObj.addObject("locationSelectedList", locationSelectedList);
			modelAndViewObj.addObject("membership", membershipMaster);
			//modelAndViewObj.addObject("type", "new");
			modelAndViewObj.setViewName("CRM/LoyaltyPrograms/Memberships/newMembership");
		}else{
			modelAndViewObj.addObject("success", result);
			modelAndViewObj.setViewName("CRM/LoyaltyPrograms/Memberships/newMembership");
		}

	}catch(Exception e){
		e.printStackTrace();
	}
	return modelAndViewObj;
}
/**
 * 
 * @author Vasudeva Reddy.G
 * @Created_On 18/09/2019
 * @Reviewed_by 
 *@description This method is used to update the details of the Memberships.
 *It returns the edit Membership view along with a message of successful updation or not
 **/

@RequestMapping(value="/updateMembership",method=RequestMethod.POST,consumes="application/json")
public ModelAndView updateMembership(@RequestBody MembershipMaster membershipMaster,HttpServletRequest request,HttpServletResponse response) {
	String zonestr="";
	try{

		String result;
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		result = loyaltyCardServiceObj.updateMembership(membershipMaster,customerId,emailId);
		modelAndViewObj = new ModelAndView();

		List<MembershipMaster> list_membership= loyaltyCardServiceObj.getMemberships(membershipMaster.getMembershipProgramCode(),customerId, emailId,"0","","","","","","","10","","","");
		List<String> zones  = new ArrayList<String>();
		List<String> locations  = new ArrayList<String>();
		
		
		for (MembershipLocations loyalityZone : list_membership.get(0).getMembershipLocations()) 
		{
			zones.add(loyalityZone.getZoneId());
			locations.add(loyalityZone.getValidLocations());
			
		}
		for(String string:zones)
		{
			zonestr = zonestr+string+",";
			////////System.out.println("zonests"+zonestr);
		}
		
     int start = 1,end = Integer.parseInt("10");
		
     if(list_membership== null ){
			
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
			
		}else{
			if(list_membership.get(0).getQuantity()<Integer.parseInt("10")){
				end = (list_membership.get(0).getQuantity())+(Integer.parseInt("0"));
			}else{
				end = (Integer.parseInt("0")+end);
			}
			modelAndViewObj.addObject("totalRecords", list_membership.get(0).getQuantity());
			modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
			modelAndViewObj.addObject("totalValue", end);
		}
		
		Set<String> locationsbasedzone = genericMasterServiceObj.getlocationsBasedOnZone(zonestr,customerId, emailId, "0","","");
		ArrayList<LocationBean> locationDetails = genericMasterServiceObj.getLocationDetails("",customerId, emailId,"-1","",false,false,true);
	        java.util.Set<String> zoneList = new java.util.LinkedHashSet<String>(zones); 
	        java.util.Set<String> locationList = new java.util.LinkedHashSet<String>(locations);

	    	modelAndViewObj.addObject("zones",zoneList);
	    	modelAndViewObj.addObject("locationDetails", locationDetails);
	    	modelAndViewObj.addObject("locationsbasedzone",locationsbasedzone);
	    	modelAndViewObj.addObject("locationList",locationList);
	    	modelAndViewObj.addObject("membership", list_membership.get(0));

	    	  modelAndViewObj.addObject("maxRecords",Integer.parseInt("10"));
		if(!result.equals(AppProperties.getAppMessageByProperty("MEMBERSHIP_UPDATE_SUCCESS").trim())){
			modelAndViewObj.addObject("err", result);

			modelAndViewObj.setViewName("CRM/LoyaltyPrograms/Memberships/editMembership");
		}else{
			modelAndViewObj.addObject("success", result);
			modelAndViewObj.setViewName("CRM/LoyaltyPrograms/Memberships/editMembership");
		}

	}catch(Exception e){
		e.printStackTrace();
	}
	return modelAndViewObj;
}





/*Added by:Swathi*/
@RequestMapping(value="/createCustCoupon",method=RequestMethod.POST,consumes="application/json")
public ModelAndView createCustCoupon(@RequestBody GiftCouponsMaster giftCouponsMaster,HttpServletRequest request,HttpServletResponse response) {
	String zonestr="";
		try{
	String result;
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			
			result = loyaltyCardServiceObj.createCustCoupons(giftCouponsMaster,customerId,emailId);
			modelAndViewObj = new ModelAndView();
			
		
			List<GiftCouponsMaster> list_giftCoupons= loyaltyCardServiceObj.getGiftCoupons(giftCouponsMaster.getCouponProgramCode(),customerId, emailId,"0","","","","","","","10");
			List<String> zones  = new ArrayList<String>();
			List<String> locations  = new ArrayList<String>();
			
			
			for (GiftCouponLocations loyalityZone : list_giftCoupons.get(0).getCouponLocationsList()) 
			{
				zones.add(loyalityZone.getZoneId());
				locations.add(loyalityZone.getValidLocation());
			}
			for(String string:zones)
			{
//				zonestr=zoneStr+zonestr+",";
				zonestr = zonestr+string+",";
			}
//			////////////System.out.println(zonestr);
			
         int start = 1,end = Integer.parseInt("10");
			
			if(list_giftCoupons.get(0).getGiftCoupons()== null ){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(list_giftCoupons.get(0).getGiftCoupons().size()<Integer.parseInt("10")){
					end = (list_giftCoupons.get(0).getGiftCoupons().size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", list_giftCoupons.get(0).getTotolGiftCoupons());
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			
			Set<String> locationsbasedzone = genericMasterServiceObj.getlocationsBasedOnZone(zonestr,customerId, emailId, "0","","");
			ArrayList<LocationBean> locationDetails = genericMasterServiceObj.getLocationDetails("",customerId, emailId,"-1","",false,false,true);
		        java.util.Set<String> zoneList = new java.util.LinkedHashSet<String>(zones); 
		        java.util.Set<String> locationList = new java.util.LinkedHashSet<String>(locations);

		    	modelAndViewObj.addObject("zones",zoneList);
		    	modelAndViewObj.addObject("locationDetails", locationDetails);
		    	modelAndViewObj.addObject("locationsbasedzone",locationsbasedzone);
		    	modelAndViewObj.addObject("locationList",locationList);
		    	modelAndViewObj.addObject("giftCoupon", list_giftCoupons.get(0));
			//written by manasa
			//purpose:form data should not clear, when we submit form
		    	  modelAndViewObj.addObject("maxRecords",Integer.parseInt("10"));
			if(!result.equals(AppProperties.getAppMessageByProperty("COUPON_UPDATED_SUCCESS").trim())){
				modelAndViewObj.addObject("err", result);
				
			
				//modelAndViewObj.addObject("type", "new");
				modelAndViewObj.setViewName("CRM/LoyaltyPrograms/GiftCoupons/editGiftCoupons");
			}else{
				modelAndViewObj.addObject("success", result);
				modelAndViewObj.setViewName("CRM/LoyaltyPrograms/GiftCoupons/editGiftCoupons");
			}
			
			//modelAndViewObj.addObject("err", result);
		//	modelAndViewObj.setViewName("CRM/LoyaltyPrograms/GiftCoupons/newGiftCoupons");
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndViewObj;
	}


	
	
	
	//added by koti bommineni
	
		@RequestMapping(value="/newWallets",method=RequestMethod.GET)
		public ModelAndView newWallets(@RequestParam("index") String index,@RequestParam("location") String location,@RequestParam("zone") String zone,@RequestParam("startdate") String startdate,@RequestParam("enddate") String enddate,@RequestParam("searchName") String searchName,@RequestParam("maxRecords") String maxRecords,HttpServletRequest request,HttpServletResponse response) {
		
			List<CustomerWalletMaster> walletList=null;
			try{
	    		// log.info("new Wallets ");
	    		//String customerIdStr = (String)request.getSession().getAttribute("customerId");
				//String emailIdStr = (String)request.getSession().getAttribute("emailId");
	    		
	    		modelAndViewObj.addObject("walletList",walletList);
	    		modelAndViewObj.setViewName("CRM/LoyaltyPrograms/Wallets/newwalllets");
	    	}catch(Exception e){
	    	  e.printStackTrace();	
	    	}	
			
			
			
			
			return modelAndViewObj;

	}	
		
		
		
		
		//added by koti bommineni
		
			@RequestMapping(value="/createWallet")
			public ModelAndView createWallet(@RequestParam("zone") String zone,
					@RequestParam("fileName") String fileName,
					@RequestParam("importStatus") String importStatus,
			   		@RequestParam("walletProgramId") String walletProgramId,
					@RequestParam("createdDate") String createdDate,
					@RequestParam("updatedDate") String updatedDate,
					@RequestParam("autoAssigned") String autoAssigned,
					@RequestParam("walletType") String walletType,
					@RequestParam("minCashDeposit") String minCashDeposit,
					@RequestParam("activationFee") String activationFee,
					@RequestParam("walletProgramName") String walletProgramName,
					@RequestParam("validityPeriod") String validityPeriod,
					@RequestParam("status") String status,
					@RequestParam("maxCashDeposit") String maxCashDeposit,
					@RequestParam("renewalFee") String renewalFee,
					@RequestParam("minBillAmount") String minBillAmount,
					@RequestParam("maxBillAmount") String maxBillAmount,
					@RequestParam("otpRequired") String otpRequired,
					@RequestParam("country") String country,
					@RequestParam("location") String locationStr,
					@RequestParam("type") String type,
					@RequestParam("signupCash") String signupCash,
					@RequestParam("noOfWallets") int noOfWallets,@RequestParam("maxTopupAmt") String maxTopupAmt,
					@RequestParam("autoGenerated") boolean autoGenerated,
					HttpServletRequest request,HttpServletResponse response) {
			
			try{
		    		// log.info("new Wallets");
		    		String customerIdStr = (String)request.getSession().getAttribute("customerId");
					String emailIdStr = (String)request.getSession().getAttribute("emailId");
					
					CustomerLedger customerWalletMaster = new CustomerLedger();
					customerWalletMaster.setWalletProgramId(walletProgramId);
					customerWalletMaster.setStartdate(createdDate);
					customerWalletMaster.setEnddate(updatedDate);
					
					if(autoAssigned.equals("true")){
						customerWalletMaster.setAutoAssigned(true);
					}
					customerWalletMaster.setWalletType(walletType);
					customerWalletMaster.setActivationFee(Float.parseFloat(activationFee));
					customerWalletMaster.setWalletProgramName(walletProgramName);
					customerWalletMaster.setValidityPeriod(Integer.parseInt(validityPeriod));
					
					if(status.equals("Active")){
					customerWalletMaster.setStatus(true);
					}
					customerWalletMaster.setMaxCashDeposit(Float.parseFloat(maxCashDeposit));
					customerWalletMaster.setMinCashDeposit(Float.parseFloat(minCashDeposit));
					customerWalletMaster.setMaxTopupAmt(Float.parseFloat(maxTopupAmt));
					customerWalletMaster.setRenewalFee(Float.parseFloat(renewalFee));
					customerWalletMaster.setMinBillAmount(Float.parseFloat(minBillAmount));
					customerWalletMaster.setMaxBillAmount(Float.parseFloat(maxBillAmount));
					customerWalletMaster.setSignupCash(Float.parseFloat(signupCash));
					customerWalletMaster.setQuantity(noOfWallets);
					customerWalletMaster.setAutoGenerated(autoGenerated);
					List<String> myList = new ArrayList<String>(Arrays.asList(locationStr.split(",")));
						customerWalletMaster.setLocationsList(myList);
						List<String> myList2 = new ArrayList<String>(Arrays.asList(zone.split(",")));
						customerWalletMaster.setZoneList(myList2);

					if(otpRequired.equals("true") || otpRequired=="true"){
					customerWalletMaster.setOtpRequired(true);
					}
					if(importStatus.equals("true")||importStatus=="true"){
						customerWalletMaster.setImportFlag(true);
						customerWalletMaster.setUploadedfilePath(fileName.trim());
					}  
					else
						customerWalletMaster.setImportFlag(false);
					customerWalletMaster.setCountry(country);
					customerWalletMaster.setZone(zone);
					customerWalletMaster.setLocation(locationStr);			
					
		String resultStr = customerServiceObj.createWallet(customerWalletMaster,customerIdStr,emailIdStr,type);
		
		modelAndViewObj = new ModelAndView();
        CustomerLedgerResponse customerRes = new Gson().fromJson(resultStr, CustomerLedgerResponse.class);
		
		if(customerRes.getUrl() != null && !customerRes.getUrl().equals(null) && !customerRes.getUrl().equals("")){
			modelAndViewObj.addObject("url", customerRes.getUrl());
			modelAndViewObj.addObject("errorMsg", customerRes.getErrorMsg());
		}
		if(type.equals("new")){
		if(!customerRes.getResponseHeader().getResponseCode().equals("0")){
			modelAndViewObj.addObject("customerReferralMaster", customerWalletMaster);
			modelAndViewObj.addObject("err", customerRes.getResponseHeader().getResponseMessage());
		}else{
			
			modelAndViewObj.addObject("success", AppProperties.getAppMessageByProperty("WALLET_CREATED_SUCCESS").trim() );
		}
		}
		
		if(type.equals("edit")){
			
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("WALLET_UPDATED_SUCCESS").trim())){
				modelAndViewObj.addObject("customerReferralMaster", customerWalletMaster);
				modelAndViewObj.addObject("err", customerRes.getResponseHeader().getResponseMessage());
			}else {
			
			    modelAndViewObj.addObject("success", AppProperties.getAppMessageByProperty("WALLET_CREATED_SUCCESS").trim());
			}
			}
		if(type.equals("new"))
			modelAndViewObj.setViewName("CRM/LoyaltyPrograms/Wallets/newwalllets");
		else
			modelAndViewObj.setViewName("CRM/LoyaltyPrograms/Wallets/vieweditwallet");
		    	}catch(Exception e){
		    	  e.printStackTrace();	
		    	}	
				return modelAndViewObj;

		}	



			

			@RequestMapping(value="/viewCustomerWallet")
			public ModelAndView viewCustomerWallet(@RequestParam("index") String index , @RequestParam("maxRecords") String maxRecords,@RequestParam("searchName")String searchName,@RequestParam("zone")String zone,
					@RequestParam("startdate")String startdate ,@RequestParam("enddate")String enddate  ,@RequestParam("WalletStatusList")String WalletStatusList ,@RequestParam("location") String location , HttpServletRequest request,HttpServletResponse response) {
				CustomerLedger filterInputObj = new CustomerLedger();
				try{
					// log.info("view Wallwts ");
					int start = 1,end = Integer.parseInt(maxRecords);
					String customerIdStr = (String)request.getSession().getAttribute("customerId");
					String emailIdStr = (String)request.getSession().getAttribute("emailId");
					List<CustomerWalletMaster> walletList = customerServiceObj.getCustomerWalletDetails(customerIdStr, emailIdStr,location,zone,startdate,enddate ,WalletStatusList,searchName,"",index,maxRecords,"");
					
				ArrayList<LocationBean> locationDetails = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,false,true);


				
				
				
				
				ArrayList<LocationBean>	locationsList = new ArrayList<LocationBean>(); 

				if( zone == null ||  zone.equals(""))
					locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,true,false);
				//locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
				else
					{
						List<ZoneMaster> zoneList = genericMasterServiceObj.getZonalLocationBasedonZone( zone, customerIdStr, emailIdStr, "0","","","");
						//List<ZoneMaster> zoneList = genericMasterServiceObj.getZonalLocationBasedonZone( zone, customerIdStr, emailIdStr, "0","","","Retail Outlet");

						LocationBean saleLocation = null;
						/*if(zoneList != null && zoneList.get(0).getZoneDetails() != null && zoneList.get(0).getZoneDetails().size()>0)
							for(ZoneDetails zoneItems : zoneList.get(0).getZoneDetails() )
							{
								saleLocation = new LocationBean(); 
								saleLocation.setLocationId(zoneItems.getLocation());
								locationBeansList.add(saleLocation);
							}
						else*/
						for(String zoneItems : zoneList.get(0).getZones() )
						{
							String zoneArray[] = zoneItems.split("\\+");
							saleLocation = new LocationBean(); 
							if(zoneArray != null && zoneArray.length>0)
							{
								saleLocation.setLocationId(zoneArray[0]);
								if(zoneArray.length > 1)
								saleLocation.setBusinessActivity(zoneArray[1]);
								if(zoneArray.length > 2)
								saleLocation.setDescription(zoneArray[2]);
								locationsList.add(saleLocation);
							} 
						}
					
					}
				
				modelAndViewObj = new ModelAndView();
				if(walletList == null){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(walletList.size()<Integer.parseInt(maxRecords)){
						end = (walletList.size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords",(walletList.get(0).getTotalRecords()));
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
				}
				
					
					
					
					if(walletList != null){
					modelAndViewObj.addObject("walletList",walletList);
					}
					
				 	modelAndViewObj.addObject("locationsList", locationDetails);
				 	

					modelAndViewObj.addObject("maxRecords",maxRecords);
					modelAndViewObj.addObject("WalletStatusList",WalletStatusList);
					modelAndViewObj.addObject("searchlocation",location);
					modelAndViewObj.addObject("zone",zone);
					modelAndViewObj.addObject("searchName",searchName);
					modelAndViewObj.addObject("enddate",enddate);
					modelAndViewObj.addObject("startdate",startdate);
					modelAndViewObj.addObject("searchCriteria",searchName);
					
					modelAndViewObj.setViewName("CRM/LoyaltyPrograms/Wallets/wallets");
				}catch(Exception exception){
					exception.printStackTrace();
				}
				return modelAndViewObj;
			}


			
			
			
			
			/*@RequestMapping(value="/viewEditWallet")
			public ModelAndView viewEditWallet(@RequestParam("id")String id ,@RequestParam("operation") String operation ,@RequestParam("index") String index ,@RequestParam("walletMaxRecords") String walletMaxRecords ,@RequestParam("childsearch") String childsearch,@RequestParam("searchName") String searchName, HttpServletRequest request,HttpServletResponse response) {
				CustomerLedger filterInputObj = new CustomerLedger();
				try{
					// log.info("view Wallwts ");
					String LocationString="";
					String customerIdStr = (String)request.getSession().getAttribute("customerId");
					String emailIdStr = (String)request.getSession().getAttribute("emailId");
					List<CustomerWalletMaster> walletList = customerServiceObj.getCustomerWalletDetails(customerIdStr, emailIdStr,"","","","" ,"",searchName,id,index,walletMaxRecords,childsearch);
					
			
					
					
					modelAndViewObj = new ModelAndView();
					modelAndViewObj.addObject("walletList",walletList.get(0));
					modelAndViewObj.addObject("operation",operation);
					String zonestr="";
					List<String> zones  = new ArrayList<String>();
					List<String> locations  = new ArrayList<String>();
					
					for (CustomerWalletLocations loyalityZone : walletList.get(0).getCustomerWalletLocations()) 
					{
						zones.add(loyalityZone.getZone());
						locations.add(loyalityZone.getLocation());
						LocationString = LocationString+loyalityZone.getLocation()+",";
						
					}
					for(String string:zones)
					{
//						
						zonestr = zonestr+string+",";
					}
					
					
					
					int start = 1,end = Integer.parseInt(walletMaxRecords);
					
					if(walletList.get(0).getWallets()== null ){
						modelAndViewObj.addObject("totalRecords","0");
						modelAndViewObj.addObject("index", "0");
						modelAndViewObj.addObject("totalValue", "0");
					}else{
						if(walletList.get(0).getWallets().size()<Integer.parseInt(walletMaxRecords)){
							end = (walletList.get(0).getWallets().size())+(Integer.parseInt(index));
						}else{
							end = (Integer.parseInt(index)+end);
						}
						modelAndViewObj.addObject("totalRecords",walletList.get(0).getTotalWallets());
						modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
						modelAndViewObj.addObject("totalValue", end);
					}
					
					
					Set<String> locationsbasedzone = genericMasterServiceObj.getlocationsBasedOnZone(zonestr,customerIdStr, emailIdStr, "0","","");
					ArrayList<LocationBean> locationDetails = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,false,true);
					java.util.Set<String> zoneList = new java.util.LinkedHashSet<String>(zones); 
					java.util.Set<String> locationList = new java.util.LinkedHashSet<String>(locations);

					List<Group> groupsList = outletMasterServiceObj.getProductGroupDetails("",customerIdStr, emailIdStr,"-1","",true);
					if(groupsList != null && groupsList.size() != 0){
						modelAndViewObj.addObject("groupsList", groupsList);
						
					}
		        
		        modelAndViewObj.addObject("maxRecords",Integer.parseInt(walletMaxRecords));
		        modelAndViewObj.addObject("zones",zoneList);
		    	modelAndViewObj.addObject("locationDetails", locationDetails);
		    	modelAndViewObj.addObject("locationsbasedzone",locationsbasedzone);
		    	modelAndViewObj.addObject("locationList",locationList);
		    	modelAndViewObj.addObject("LocationString",LocationString);
		    	modelAndViewObj.addObject("searchCriteria",searchName);
					
						modelAndViewObj.setViewName("CRM/LoyaltyPrograms/Wallets/vieweditwallet");
				}catch(Exception exception){
					exception.printStackTrace();
				}
				return modelAndViewObj;
			}*/


			@RequestMapping("/editWalletForPagination")
			public ModelAndView editWalletForPagination(@RequestParam("walletId")String walletId ,@RequestParam("index") String index ,
					@RequestParam("walletMaxRecords") String walletMaxRecords ,
					@RequestParam("searchName") String searchName,@RequestParam("operation") String operation,
					HttpServletRequest request,HttpServletResponse response){
				try{
					int start = 1,end = Integer.parseInt(walletMaxRecords);
					String customerIdStr = (String)request.getSession().getAttribute("customerId");
					String emailIdStr = (String)request.getSession().getAttribute("emailId");
					List<CustomerWallets> customerWallets= customerServiceObj.getWalletBySearchCreiteria(walletId,customerIdStr, emailIdStr,searchName,index,"10");
					modelAndViewObj = new ModelAndView();
					modelAndViewObj.addObject("customerWallets",customerWallets);
					modelAndViewObj.addObject("walletId", walletId);
					if(customerWallets== null ){
						modelAndViewObj.addObject("totalRecords","0");
						modelAndViewObj.addObject("index", "0");
						modelAndViewObj.addObject("totalValue", "0");
					}else{
						if(customerWallets.size()<Integer.parseInt(walletMaxRecords)){
							end = (customerWallets.size())+(Integer.parseInt(index));
						}else{
							end = (Integer.parseInt(index)+end);
						}
						modelAndViewObj.addObject("totalRecords",customerWallets.get(0).getTotalRecords());
						modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
						modelAndViewObj.addObject("totalValue", end);
					}
		        modelAndViewObj.addObject("maxRecords",Integer.parseInt(walletMaxRecords));
		    	modelAndViewObj.addObject("searchName",searchName);
		    	modelAndViewObj.addObject("operation",operation);
				modelAndViewObj.setViewName("CRM/LoyaltyPrograms/Wallets/vieweditwalletsForpagination");
				}catch(Exception exception){
					exception.printStackTrace();
				}
				return modelAndViewObj;
			}
			
			
			@RequestMapping(value="/viewEditWallet")
			public ModelAndView viewEditWallet(@RequestParam("id")String id ,@RequestParam("operation") String operation ,@RequestParam("index") String index ,
					@RequestParam("walletMaxRecords") String walletMaxRecords ,
					@RequestParam("childsearch") String childsearch,
					@RequestParam("searchName") String searchName,@RequestParam("walletID") String  walletID ,
					HttpServletRequest request,HttpServletResponse response) {
				CustomerLedger filterInputObj = new CustomerLedger();
				try{
					// log.info("view Wallwts ");
					String LocationString="";
					String customerIdStr = (String)request.getSession().getAttribute("customerId");
					String emailIdStr = (String)request.getSession().getAttribute("emailId");
					List<CustomerWalletMaster> walletList = customerServiceObj.getCustomerWalletDetails(customerIdStr, emailIdStr,"","","","" ,"",searchName,id,index,walletMaxRecords,childsearch);
					
					CustomerWalletMaster walletLists = new CustomerWalletMaster();
					modelAndViewObj = new ModelAndView();
					
					if(walletID.trim().isEmpty()){
						
					}else{
					for(CustomerWalletMaster cwm:walletList){
						if(walletID.trim().equalsIgnoreCase(cwm.getWalletProgramId()))
						walletLists	= cwm;
					}
					walletList.clear();
					walletList.add(walletLists);
					}
					
					modelAndViewObj.addObject("walletList",walletList.get(0));
					modelAndViewObj.addObject("operation",operation);
					String zonestr="";
					List<String> zones  = new ArrayList<String>();
					List<String> locations  = new ArrayList<String>();
					
					for (CustomerWalletLocations loyalityZone : walletList.get(0).getCustomerWalletLocations()) 
					{
						zones.add(loyalityZone.getZone());
						locations.add(loyalityZone.getLocation());
						LocationString = LocationString+loyalityZone.getLocation()+",";
					}
					for(String string:zones)
					{
//						
						zonestr = zonestr+string+",";
					}
					
					int start = 1,end = Integer.parseInt(walletMaxRecords);
					
					if(walletList.get(0).getWallets()== null ){
						modelAndViewObj.addObject("totalRecords","0");
						modelAndViewObj.addObject("index", "0");
						modelAndViewObj.addObject("totalValue", "0");
					}else{
						if(walletList.get(0).getWallets().size()<Integer.parseInt(walletMaxRecords)){
							end = (walletList.get(0).getWallets().size())+(Integer.parseInt(index));
						}else{
							end = (Integer.parseInt(index)+end);
						}
						modelAndViewObj.addObject("totalRecords",walletList.get(0).getTotalWallets());
						modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
						modelAndViewObj.addObject("totalValue", end);
					}
					Set<String> locationsbasedzone = genericMasterServiceObj.getlocationsBasedOnZone(zonestr,customerIdStr, emailIdStr, "0","","");
					ArrayList<LocationBean> locationDetails = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,false,true);
					java.util.Set<String> zoneList = new java.util.LinkedHashSet<String>(zones); 
					java.util.Set<String> locationList = new java.util.LinkedHashSet<String>(locations);

					List<Group> groupsList = outletMasterServiceObj.getProductGroupDetails("",customerIdStr, emailIdStr,"-1","",true);
					if(groupsList != null && groupsList.size() != 0){
						modelAndViewObj.addObject("groupsList", groupsList);
					}
		        
		        modelAndViewObj.addObject("maxRecords",Integer.parseInt(walletMaxRecords));
		        modelAndViewObj.addObject("zones",zoneList);
		    	modelAndViewObj.addObject("locationDetails", locationDetails);
		    	modelAndViewObj.addObject("locationsbasedzone",locationsbasedzone);
		    	modelAndViewObj.addObject("locationList",locationList);
		    	modelAndViewObj.addObject("LocationString",LocationString);
		    	modelAndViewObj.addObject("searchCriteria",searchName);
		    	modelAndViewObj.addObject("searchName",searchName);
					
						modelAndViewObj.setViewName("CRM/LoyaltyPrograms/Wallets/vieweditwallet");
				}catch(Exception exception){
					exception.printStackTrace();
				}
				return modelAndViewObj;
			}
			
			
			@RequestMapping(value="/geteditWalletLedger")
			public ModelAndView geteditWalletLedger(@RequestParam("id")String id ,
					@RequestParam("operation") String operation ,
					@RequestParam("phone") String phone,
					@RequestParam("walletName") String walletName,
					@RequestParam("status") boolean status,
					@RequestParam("index") String index,
					@RequestParam("maxRecords") String maxRecords,
					@RequestParam("walletId") String walletId,
					@RequestParam("txnRef") String txnRef,
					@RequestParam("tender") String tender,
				//	@RequestParam("date") String date,
					@RequestParam("amount") Float amount,
					@RequestParam("totalAmount") Float totalAmount,@RequestParam("type") String type,
					HttpServletRequest request,HttpServletResponse response) {
				
					CustomerLedger customerLedger = new CustomerLedger();
					try{ 
					String customerIdStr = (String)request.getSession().getAttribute("customerId");
					String emailIdStr = (String)request.getSession().getAttribute("emailId");
					
					modelAndViewObj = new ModelAndView();
					
					if(operation.equalsIgnoreCase("new"))
						{
							 String result = customerServiceObj.addWallet(txnRef,tender,amount,walletId,phone,type,customerIdStr,emailIdStr);
	
							 if(result.contains("Success"))
								{
									modelAndViewObj.addObject("Success", "Transaction Created Successfully");
								}
								else{
									modelAndViewObj.addObject("error", result);
				          	}
						}
						
						List<CustomerLedger> walletList = customerServiceObj.getCustomerWalletLedger(customerIdStr, emailIdStr,"","","","" ,"","",id,index,maxRecords,phone,false,"");
						
						ArrayList<TenderMaster> tenderDetails = genericMasterServiceObj.getTender("",customerIdStr,emailIdStr,"-1",100);
						
						modelAndViewObj.addObject("walletPhoneNo",phone);
						
						modelAndViewObj.addObject("walletName",walletName);
						modelAndViewObj.addObject("walletStatus",status);
						
						modelAndViewObj.addObject("tenderDetails",tenderDetails);
						
						customerLedger = customerServiceObj.geteditCustomerWalletLedger(customerIdStr, emailIdStr,phone,walletName,status);
						{
						
						if(customerLedger!=null && customerLedger.getResponseHeader()!=null && customerLedger.getResponseHeader().getResponseCode().equals("0"))
						{
							modelAndViewObj.addObject("WalletDataObj", customerLedger);
							if(walletList != null) {
								modelAndViewObj.addObject("walletTransList",walletList);
							}
							
						}else{
							modelAndViewObj.addObject("WalletDataObj", null);
							
							
							
							
							if(!operation.equals("new"))
							modelAndViewObj.addObject("error", customerLedger.getResponseHeader().getResponseMessage());
						//	modelAndViewObj.addObject("error",responseMessage());
						}
					}
					  // modelAndViewObj.addObject("searchCreteria",searchCreteria);
						modelAndViewObj.setViewName("CRM/LoyaltyPrograms/Wallets/walletpopUP");
						
					}catch(Exception exception){
						exception.printStackTrace();
					}
					return modelAndViewObj;
				}
			
			
			
			@RequestMapping(value="/getWalletLedger")
			public ModelAndView getWalletLedger(@RequestParam("id")String id ,@RequestParam("operation") String operation ,@RequestParam("phone") String phone,@RequestParam("index") String index,@RequestParam("maxRecords") String maxRecords, @RequestParam("saveflag") boolean saveFlag,@RequestParam("walletId") String walletId, HttpServletRequest request,HttpServletResponse response) {
				CustomerLedger filterInputObj = new CustomerLedger();
				try{/*
					
					String customerIdStr = (String)request.getSession().getAttribute("customerId");
					String emailIdStr = (String)request.getSession().getAttribute("emailId");
					List<CustomerLedger> walletList = customerServiceObj.getCustomerWalletLedger(customerIdStr, emailIdStr,"","","","" ,"","",id,index,maxRecords,phone,saveFlag,walletId);
					
					modelAndViewObj = new ModelAndView();
					modelAndViewObj.addObject("walletList",walletList);
					modelAndViewObj.addObject("operation",operation);
					modelAndViewObj.addObject("programCode",id);
					modelAndViewObj.addObject("phone",phone);
					
					int start = 1,end = Integer.parseInt(maxRecords);
					
					if(walletList== null ){
						modelAndViewObj.addObject("totalRecords","0");
						modelAndViewObj.addObject("index", "0");
						modelAndViewObj.addObject("totalValue", "0");
					}else{
						if(walletList.size()<Integer.parseInt(maxRecords)){
							end = (walletList.size())+(Integer.parseInt(index));
						}else{
							end = (Integer.parseInt(index)+end);
						}
						modelAndViewObj.addObject("totalRecords", walletList.get(0).getTotalRecords());
						modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
						modelAndViewObj.addObject("totalValue", end);
					}
					
					
					if(saveFlag == true && walletList != null)
			    	    modelAndViewObj.addObject("downloadurl", walletList.get(0).getFilePath());
					//modelAndViewObj.addObject("downloadurl", "http://101.53.158.27/Configurations/CID8995448/Exports/CustomerGiftCoupons.csv");
					if(walletList == null)
						 modelAndViewObj.addObject("err","There is no previous transactions.");
					
		        modelAndViewObj.addObject("maxRecords",Integer.parseInt(maxRecords));
				modelAndViewObj.setViewName("CRM/LoyaltyPrograms/Wallets/walletLedgers");
				*/
					

					
					String customerIdStr = (String)request.getSession().getAttribute("customerId");
					String emailIdStr = (String)request.getSession().getAttribute("emailId");
					List<CustomerLedger> walletList = customerServiceObj.getCustomerWalletLedger(customerIdStr, emailIdStr,"","","","" ,"","",id,index,maxRecords,phone,saveFlag,walletId);
					
					modelAndViewObj = new ModelAndView();
					
					if(walletId != null && walletId !=""){
						
						modelAndViewObj.addObject("walletList",walletList);
						modelAndViewObj.addObject("operation",operation);
						modelAndViewObj.addObject("programCode",id);
						modelAndViewObj.addObject("phone",phone);

						int start = 1,end = Integer.parseInt(maxRecords);

						if(walletList== null ){
							modelAndViewObj.addObject("totalRecords","0");
							modelAndViewObj.addObject("index", "0");
							modelAndViewObj.addObject("totalValue", "0");
						}else{
							if(walletList.size()<Integer.parseInt(maxRecords)){
								end = (walletList.size())+(Integer.parseInt(index));
							}else{
								end = (Integer.parseInt(index)+end);
							}
							modelAndViewObj.addObject("totalRecords", walletList.get(0).getTotalRecords());
							modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
							modelAndViewObj.addObject("totalValue", end);
							if(walletList == null)
								 modelAndViewObj.addObject("err","There is no previous transactions.");
							if(saveFlag == true && walletList != null)
					    	    modelAndViewObj.addObject("downloadurl", walletList.get(0).getFilePath());
							 modelAndViewObj.addObject("maxRecords",Integer.parseInt(maxRecords));
							 modelAndViewObj.setViewName("CRM/LoyaltyPrograms/Wallets/walletLedgers");
						}
					}else{
						modelAndViewObj=viewEditWallet(id,operation,"0","10","","","",request,response);
						if(saveFlag == true && walletList != null)
				    	    modelAndViewObj.addObject("downloadurl", walletList.get(0).getFilePath());
					}
					
					
					//modelAndViewObj.addObject("downloadurl", "http://101.53.158.27/Configurations/CID8995448/Exports/CustomerGiftCoupons.csv");
					
					
		       
				
				
				
				
				
				}catch(Exception exception){
					exception.printStackTrace();
				}
				return modelAndViewObj;
			}


			@RequestMapping("/saveMembershipDetails")
			public ModelAndView saveMembershipDetails(@RequestParam("type")String type,@RequestParam("id")String membershipProgramCode,@RequestParam("searchName")String searchName,@RequestParam("saveflag")String saveflag,HttpServletRequest request,HttpServletResponse response){
				String zonestr="";
//				List<String> zonalLocations=new ArrayList<String>();
				try{
					String customerIdStr = (String)request.getSession().getAttribute("customerId");
					String emailIdStr = (String)request.getSession().getAttribute("emailId");
					List<MembershipMaster> list_membership= loyaltyCardServiceObj.saveMemberships(membershipProgramCode,customerIdStr, emailIdStr,"0","","","","",searchName,"","10","","",saveflag);
					
					////////System.out.println(gson.toJson(list_membership));
					
					modelAndViewObj = new ModelAndView();
					List<String> zones  = new ArrayList<String>();
					List<String> locations  = new ArrayList<String>();
					if(saveflag.equals("true") || saveflag == "true"){

					modelAndViewObj.addObject("membership", list_membership.get(0));
					
					modelAndViewObj.addObject("filePath", list_membership.get(0).getFilePath());
					
					
					for (MembershipLocations loyalityZone : list_membership.get(0).getMembershipLocations()) 
					{
						zones.add(loyalityZone.getZoneId());
						locations.add(loyalityZone.getValidLocations());
						
					}
					for(String string:zones)
					{
//						zonestr=zoneStr+zonestr+",";
						zonestr = zonestr+string+",";
					}
					
					}else{
						
						modelAndViewObj.addObject("membership", list_membership);
						////////System.out.println(gson.toJson(list_membership));


						
						
					}
					
					int start = 1,end = Integer.parseInt("10");
					
					
					if(saveflag.equals("true") || saveflag == "true"){
						
						if(list_membership.get(0)== null ){
							modelAndViewObj.addObject("totalRecords","0");
							modelAndViewObj.addObject("index", "0");
							modelAndViewObj.addObject("totalValue", "0");
						}else{
							if(list_membership.get(0).getQuantity()<Integer.parseInt("10")){
								end = (list_membership.get(0).getQuantity())+(Integer.parseInt("0"));
							}else{
								end = (Integer.parseInt("0")+end);
							}
							modelAndViewObj.addObject("totalRecords", list_membership.get(0).getQuantity());
							modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
							modelAndViewObj.addObject("totalValue", end);
						}
						
						}else{
							if(list_membership== null ){
								modelAndViewObj.addObject("totalRecords","0");
								modelAndViewObj.addObject("index", "0");
								modelAndViewObj.addObject("totalValue", "0");
							}else{
								if(list_membership.size()<Integer.parseInt("10")){
									end = (list_membership.size())+(Integer.parseInt("0"));
								}else{
									end = (Integer.parseInt("0")+end);
								}
								modelAndViewObj.addObject("totalRecords", list_membership.size());
								modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
								modelAndViewObj.addObject("totalValue", end);
							}
							
							
						}
					
					
					
					
					Set<String> locationsbasedzone = genericMasterServiceObj.getlocationsBasedOnZone(zonestr,customerIdStr, emailIdStr, "0","","");
					ArrayList<LocationBean> locationDetails = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,false,true);
					java.util.Set<String> zoneList = new java.util.LinkedHashSet<String>(zones); 
					java.util.Set<String> locationList = new java.util.LinkedHashSet<String>(locations);
			    modelAndViewObj.addObject("maxRecords",Integer.parseInt("10"));
			    modelAndViewObj.addObject("zones",zoneList);
				modelAndViewObj.addObject("locationDetails", locationDetails);
				modelAndViewObj.addObject("locationsbasedzone",locationsbasedzone);
				modelAndViewObj.addObject("locationList",locationList);
				modelAndViewObj.addObject("type",type);
					
				
				if(saveflag.equals("true") || saveflag == "true"){
				
				if(type.equals("view"))
					modelAndViewObj.setViewName("CRM/LoyaltyPrograms/Memberships/viewMembership");
					else
					modelAndViewObj.setViewName("CRM/LoyaltyPrograms/Memberships/editMembership");	
				}else{
					modelAndViewObj.setViewName("CRM/LoyaltyPrograms/Memberships/editmembershiptest");
					
				}
				}
				catch(Exception exception){
					exception.printStackTrace();
				}
				return modelAndViewObj;
			}		
			  /**
             * @author Surya.K        
             * 
             * This method is used to call the Loyalty to giftVocuher convertion method of web service and return the Loyalty Cards List
             * 
             * @modifications 
             * 
             */
            
            @RequestMapping(value="/generateConvertedpoints")
            public ModelAndView generateConvertedpoints(@RequestParam("loyaltyPlanId") String loyaltyProgramNumber,@RequestParam("maxRecords") String maxRecords,
                            @RequestParam("minClaimPointsGenerate") String minClaimPoints,@RequestParam("enroledate") String enroledate,@RequestParam("basePointsGenerate") String basePoints,
                            @RequestParam("maxClaimPoints") String maxClaimPoints,@RequestParam("rewardConversionRatio") String rewardConversionRatio,HttpServletRequest request,HttpServletResponse response) {
            
                    try{
                            // log.info("editLoyaltyCardDetails ");
                            GenericMasterService genericMasterServiceObj = new GenericMasterService();
                            String customerIdStr = (String)request.getSession().getAttribute("customerId");
                            String emailIdStr = (String)request.getSession().getAttribute("emailId");
                            
                    String result = loyaltyCardServiceObj.loyaltyCardsToGiftVoucher(loyaltyProgramNumber,minClaimPoints,maxClaimPoints,basePoints,enroledate,rewardConversionRatio,customerIdStr, emailIdStr,"0",maxRecords);

                            
                            List<LoyaltyCardMaster> list_loyaltyCardMaster = loyaltyCardServiceObj.getLoyaltyCards(loyaltyProgramNumber,customerIdStr, emailIdStr,"0",maxRecords);
                            modelAndViewObj = new ModelAndView();
                            int start = 1,end = Integer.parseInt(maxRecords);

                            if(result.equals(AppProperties.getAppMessageByProperty("Gift_VOUCHER_SUCCESS").trim()))
                            {
                                    modelAndViewObj.addObject("success", result);
                            }
                            else
                            {
                                    modelAndViewObj.addObject("err", result);
                            }
                            
                            if(list_loyaltyCardMaster.get(0).getLoyaltyCards()== null ){
                                    modelAndViewObj.addObject("totalRecords","0");
                                    modelAndViewObj.addObject("index", "0");
                                    modelAndViewObj.addObject("totalValue", "0");
                            }else{
                                    if(list_loyaltyCardMaster.get(0).getLoyaltyCards().size()<Integer.parseInt(maxRecords)){
                                            end = (list_loyaltyCardMaster.get(0).getLoyaltyCards().size())+(Integer.parseInt("0"));
                                    }else{
                                            end = (Integer.parseInt("0")+end);
                                    }
                                    modelAndViewObj.addObject("totalRecords", list_loyaltyCardMaster.get(0).getTotalLoyaltyCards());
                                    modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
                                    modelAndViewObj.addObject("totalValue", end);
                            }
                            
                            List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
                            if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
                                    zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"0","","");
                                    request.getSession().setAttribute("zoneList", zoneList);
                            }
                            
//                            
                            
                            List<String> zones  = new ArrayList<String>();
                            List<String> states  = new ArrayList<String>();
                            List<String> countries  = new ArrayList<String>();
                            

                            for (LoyaltyZones loyalityZone : list_loyaltyCardMaster.get(0).getLoyaltyZones()) 
                            {
                                    zones.add(loyalityZone.getZone());
                                    states.add(loyalityZone.getStates());
                                    countries.add(loyalityZone.getCountry());
                            }
                            
                            java.util.Set<String> zoneSelectedList = new java.util.LinkedHashSet<String>(zones);  
                            java.util.Set<String> countrySelectedList = new java.util.LinkedHashSet<String>(countries);
                            java.util.Set<String> statesSelectedList = new java.util.LinkedHashSet<String>(states);


                    
                            modelAndViewObj.addObject("zones",zoneSelectedList);
                            modelAndViewObj.addObject("countries",countrySelectedList);
                            modelAndViewObj.addObject("statesList",statesSelectedList);
                            modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
                            modelAndViewObj.addObject("startdateloyaltycard", list_loyaltyCardMaster.get(0).getStartDateStr());
                  			modelAndViewObj.addObject("enddateloyaltyCard", list_loyaltyCardMaster.get(0).getEndDateStr());

                            
                                    modelAndViewObj.addObject("loyaltyCard", list_loyaltyCardMaster.get(0));
                                    modelAndViewObj.setViewName("CRM/LoyaltyPrograms/LoyaltyCards/editLoyaltyDetails");
                }catch(Exception e){
                  e.printStackTrace();        
                }        
                    
                    
                    
                    
                    return modelAndViewObj;

    }                

            
            


            
            
            /**
             * @author koti bommineni    
             * 
             * This method is used to call the Loyalty upgrade
             * 
             * @modifications 
             * 
             */
            
            @RequestMapping(value="/upgradeLoyaltyCards")
            public ModelAndView upgradeLoyaltyCards(@RequestParam("loyaltyPlanId") String loyaltyProgramNumber,@RequestParam("maxRecords") String maxRecords,
                            @RequestParam("minClaimPointsUpgrade") String minClaimPoints,@RequestParam("startdateUpgrade") String startdate,@RequestParam("enddateUpgrade") String enddate,
                            @RequestParam("pricerangeUpgrade") String pricerange,@RequestParam("loyaltyCardTypeUpgrade") String loyaltyCardType,
                            @RequestParam("maxClaimPointsUpgrade") String maxClaimPoints,@RequestParam("rewardConversionRatio") String rewardConversionRatio,HttpServletRequest request,HttpServletResponse response) {
            
                    try{
                            // log.info("editLoyaltyCardDetails ");
                            GenericMasterService genericMasterServiceObj = new GenericMasterService();
                            String customerIdStr = (String)request.getSession().getAttribute("customerId");
                            String emailIdStr = (String)request.getSession().getAttribute("emailId");
                            
                   String result = loyaltyCardServiceObj.upgradeLoyaltyCards(loyaltyProgramNumber,minClaimPoints,maxClaimPoints,startdate,enddate,rewardConversionRatio,customerIdStr, emailIdStr,"0",maxRecords,pricerange,loyaltyCardType);

                            
                            List<LoyaltyCardMaster> list_loyaltyCardMaster = loyaltyCardServiceObj.getLoyaltyCards(loyaltyProgramNumber,customerIdStr, emailIdStr,"0",maxRecords);
                            modelAndViewObj = new ModelAndView();
                            int start = 1,end = Integer.parseInt(maxRecords);

                          if(result.equals(AppProperties.getAppMessageByProperty("LOYALTY_UPGRADE_SUCCESS").trim()))
                            {
                                    modelAndViewObj.addObject("success", result);
                            }
                            else
                            {
                                    modelAndViewObj.addObject("err", result);
                            }
                           
                            if(list_loyaltyCardMaster.get(0).getLoyaltyCards()== null ){
                                    modelAndViewObj.addObject("totalRecords","0");
                                    modelAndViewObj.addObject("index", "0");
                                    modelAndViewObj.addObject("totalValue", "0");
                            }else{
                                    if(list_loyaltyCardMaster.get(0).getLoyaltyCards().size()<Integer.parseInt(maxRecords)){
                                            end = (list_loyaltyCardMaster.get(0).getLoyaltyCards().size())+(Integer.parseInt("0"));
                                    }else{
                                            end = (Integer.parseInt("0")+end);
                                    }
                                    modelAndViewObj.addObject("totalRecords", list_loyaltyCardMaster.get(0).getTotalLoyaltyCards());
                                    modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
                                    modelAndViewObj.addObject("totalValue", end);
                            }
                            
                            List<ZoneMaster> zoneList =(List<ZoneMaster>)request.getSession().getAttribute("zoneList");
                            if(zoneList==null || zoneList.size()==0 || zoneList.isEmpty()){
                                    zoneList = genericMasterServiceObj.getZones(null, customerIdStr, emailIdStr,"0","","");
                                    request.getSession().setAttribute("zoneList", zoneList);
                            }
                            
//                            
                            
                            List<String> zones  = new ArrayList<String>();
                            List<String> states  = new ArrayList<String>();
                            List<String> countries  = new ArrayList<String>();
                            

                            for (LoyaltyZones loyalityZone : list_loyaltyCardMaster.get(0).getLoyaltyZones()) 
                            {
                                    zones.add(loyalityZone.getZone());
                                    states.add(loyalityZone.getStates());
                                    countries.add(loyalityZone.getCountry());
                            }
                            
                            java.util.Set<String> zoneSelectedList = new java.util.LinkedHashSet<String>(zones);  
                            java.util.Set<String> countrySelectedList = new java.util.LinkedHashSet<String>(countries);
                            java.util.Set<String> statesSelectedList = new java.util.LinkedHashSet<String>(states);


                    
                            modelAndViewObj.addObject("zones",zoneSelectedList);
                            modelAndViewObj.addObject("countries",countrySelectedList);
                            modelAndViewObj.addObject("statesList",statesSelectedList);
                            modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
                            modelAndViewObj.addObject("startdateloyaltycard", list_loyaltyCardMaster.get(0).getStartDateStr());
                  			modelAndViewObj.addObject("enddateloyaltyCard", list_loyaltyCardMaster.get(0).getEndDateStr());

                            
                                    modelAndViewObj.addObject("loyaltyCard", list_loyaltyCardMaster.get(0));
                                    modelAndViewObj.setViewName("CRM/LoyaltyPrograms/LoyaltyCards/editLoyaltyDetails");
                }catch(Exception e){
                  e.printStackTrace();        
                }        
                    
                    
                    
                    
                    return modelAndViewObj;

    }                

            
            

		
			
            @RequestMapping("/viewSubscriptions")
            public ModelAndView viewSubscriptions(@RequestParam("maxRecords")String maxRecords,
            		//@RequestParam("allLocationsList")String allLocationsList,
            		@RequestParam("searchName")String searchName,
            		//@RequestParam("location")String location,
            		//@RequestParam("zone")String zone,
            		@RequestParam("startdate")String startdate,
            		@RequestParam("enddate")String enddate,
            		@RequestParam("index")String index,
            		@RequestParam("subscriptionType")String subscriptionType,
            		
                	@RequestParam("status") String status,HttpServletRequest request,HttpServletResponse response){
            	
            //	String locationListAll="";
            	try{
            		int start = 1,end = Integer.parseInt(maxRecords);
            		String customerIdStr = (String)request.getSession().getAttribute("customerId");
            		String emailIdStr = (String)request.getSession().getAttribute("emailId");
            		
            		List<CustomerSubscription> list_CustomerSubscription= loyaltyCardServiceObj.getSubscriptions("",customerIdStr, emailIdStr,index,startdate,enddate,searchName,subscriptionType,maxRecords,status,"");
            		modelAndViewObj = new ModelAndView();
            		//System.out.println("FINAL RESS:: "+gson.toJson(list_CustomerSubscription));
            		if(list_CustomerSubscription == null){
            			modelAndViewObj.addObject("totalRecords","0");
            			modelAndViewObj.addObject("index", "0");
            			modelAndViewObj.addObject("totalValue", "0");
            		}else{
            			if(list_CustomerSubscription.size()<Integer.parseInt(maxRecords)){
            				end = (list_CustomerSubscription.size())+(Integer.parseInt(index));
            			}else{
            				end = (Integer.parseInt(index)+end);
            			}
            			modelAndViewObj.addObject("totalRecords", list_CustomerSubscription.get(0).getTotalRecords());
            			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
            			modelAndViewObj.addObject("totalValue", end);
            		}
            		modelAndViewObj.addObject("subscriptionlist", list_CustomerSubscription);
            		modelAndViewObj.addObject("searchName", searchName);
            		modelAndViewObj.addObject("status", status);
            		modelAndViewObj.addObject("subscriptionTypeFilter", subscriptionType);
            		modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
            		modelAndViewObj.addObject("startdate", startdate);
            		modelAndViewObj.addObject("enddate", enddate);

            		modelAndViewObj.setViewName("CRM/LoyaltyPrograms/Subscription/subscription");
            	}
            	catch(Exception exception){
            		exception.printStackTrace();
            	}
            	return modelAndViewObj;
            }          
			
		
			
			
          @RequestMapping("/viewSubscriptionDetails")
            public ModelAndView viewSubscriptionDetails(@RequestParam("type")String type,@RequestParam("id")String subscriptionProgramCode,@RequestParam("index")String index,@RequestParam("searchName")String searchName,@RequestParam("pagination")String pagination,HttpServletRequest request,HttpServletResponse response){
            	String zonestr="";
//            	List<String> zonalLocations=new ArrayList<String>();
            	try{

            		String customerIdStr = (String)request.getSession().getAttribute("customerId");
            		String emailIdStr = (String)request.getSession().getAttribute("emailId");
            		List<CustomerSubscription> list_CustomerSubscription = loyaltyCardServiceObj.getSubscriptions(subscriptionProgramCode,customerIdStr, emailIdStr,index,"","","",searchName,"","10",pagination);
            		modelAndViewObj = new ModelAndView();
            		modelAndViewObj.addObject("subscription", list_CustomerSubscription.get(0));
            		/*List<String> zones  = new ArrayList<String>();
            		List<String> locations  = new ArrayList<String>();*/
            		int start = 1,end = Integer.parseInt("10");
            		if(list_CustomerSubscription.get(0).getQuantity()<Integer.parseInt("10")){
						end = (list_CustomerSubscription.get(0).getQuantity())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
						if(end>list_CustomerSubscription.get(0).getQuantity())
						{
							end=list_CustomerSubscription.get(0).getQuantity();
						}}
					modelAndViewObj.addObject("totalRecords", list_CustomerSubscription.get(0).getQuantity());
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
            		Set<String> locationsbasedzone = genericMasterServiceObj.getlocationsBasedOnZone(zonestr,customerIdStr, emailIdStr, "0","","");
            		ArrayList<LocationBean> locationDetails = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,false,true);
            		modelAndViewObj.addObject("maxRecords",Integer.parseInt("10"));
            		if(type.equals("view"))
            		modelAndViewObj.setViewName("CRM/LoyaltyPrograms/Subscription/viewSubscription");
            		else
            		modelAndViewObj.setViewName("CRM/LoyaltyPrograms/Subscription/editSubscription");	
            	}
            	catch(Exception exception){
            		exception.printStackTrace();
            	}
            	return modelAndViewObj;
            }     
           
            
            
           
            @RequestMapping("/viewEditSubscriptionDetails")
            public ModelAndView viewEditSubscriptionDetails(@RequestParam("id") String subscriptionId,@RequestParam("type") String type,@RequestParam("subscriptionType") String subscriptionType,HttpServletRequest request,HttpServletResponse response){
            	
            	try{
            		String customerIdStr = (String)request.getSession().getAttribute("customerId");
            		String emailIdStr = (String)request.getSession().getAttribute("emailId");
            		CustomerSubscription list_CustomerSubscription = loyaltyCardServiceObj.getSubscriptionsDetails(subscriptionId,subscriptionType);
            		modelAndViewObj = new ModelAndView();
            		///System.out.println(new Gson().toJson(list_CustomerSubscription.getCustomerSubscriptionDetails().get(0)));
            		modelAndViewObj.addObject("subscriptionObj", list_CustomerSubscription.getCustomerSubscriptionDetails().get(0));
            		if(type.equals("view"))
            		modelAndViewObj.setViewName("CRM/LoyaltyPrograms/Subscription/viewSubscription");
            		else
            		modelAndViewObj.setViewName("CRM/LoyaltyPrograms/Subscription/EditSubscription");	
            	}
            	catch(Exception exception){
            		exception.printStackTrace();
            	}
            	return modelAndViewObj;
            }  
            
            
            
          @RequestMapping(value="/updateSubscription",method=RequestMethod.POST)
            public ModelAndView updateSubscription(@RequestParam("formData") String formData,HttpServletRequest request,HttpServletResponse response) {
            	try{
            		String result;
            		String customerId = (String)request.getSession().getAttribute("customerId");
            		String emailId = (String)request.getSession().getAttribute("emailId");
            		 CustomerSubscription CustomerSubscriptionObj = gson.fromJson(formData, CustomerSubscription.class);
            		result = loyaltyCardServiceObj.updateSubscription(CustomerSubscriptionObj,customerId,emailId);
            		modelAndViewObj = new ModelAndView();
            		
            		
            		if(!result.contains("Success")){
            			modelAndViewObj.addObject("err", result);
            		}else{
            			modelAndViewObj.addObject("success", "Subscription updated successfully.");
            		}
            		
            		CustomerSubscription list_CustomerSubscription = loyaltyCardServiceObj.getSubscriptionsDetails(CustomerSubscriptionObj.getSubscriptionId(),CustomerSubscriptionObj.getPeriod());
            		////System.out.println(new Gson().toJson(list_CustomerSubscription.getCustomerSubscriptionDetails().get(0)));
            		modelAndViewObj.addObject("subscriptionObj", list_CustomerSubscription.getCustomerSubscriptionDetails().get(0));
            		
            		modelAndViewObj.setViewName("CRM/LoyaltyPrograms/Subscription/EditSubscription");
            		
            	}catch(Exception e){
            		e.printStackTrace();
            	}
            	return modelAndViewObj;
            }     
			
          @RequestMapping("/deleteLoyaltyCards")
      	public ModelAndView deleteLoyaltyCards(@RequestParam("ids") String ids,@RequestParam("searchName") String searchName, @RequestParam("maxRecords")String maxRecords, HttpServletRequest request,HttpServletResponse response){
      		try{
      			// log.info("deleteBrand ");
      			int start = 1,end = Integer.parseInt(maxRecords);
      			modelAndViewObj = new ModelAndView();
      			String customerIdStr = (String)request.getSession().getAttribute("customerId");
      			String emailIdStr = (String)request.getSession().getAttribute("emailId");
      			String resultStr = loyaltyCardServiceObj.deleteLoyaltyCards(customerIdStr,emailIdStr,ids);
      			
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
      	
      	
      	
      	
      	
      	@RequestMapping("/viewLoyaltyCards")
      	public ModelAndView viewLoyaltyCards(@RequestParam("index")String index,
      			@RequestParam("maxRecords")String maxRecords, HttpServletRequest request,HttpServletResponse response){
      		try{
      			// log.info("viewLoyaltyCards ");
      			int start = 1,end = Integer.parseInt(maxRecords);
      			String customerIdStr = (String)request.getSession().getAttribute("customerId");
      			String emailIdStr = (String)request.getSession().getAttribute("emailId");
      			List<LoyaltyCardMaster> list_loyaltyCardMaster = loyaltyCardServiceObj.getLoyaltyCardsSummary("",customerIdStr, emailIdStr,index,maxRecords);
      			
      			modelAndViewObj = new ModelAndView();
//      			if(list_loyaltyCardMaster.get(0).getResponseCode().equals("0"))
//      			{
      				if(list_loyaltyCardMaster == null || list_loyaltyCardMaster.size() == 0){
      					modelAndViewObj.addObject("totalRecords","0");
      					modelAndViewObj.addObject("index", "0");
      					modelAndViewObj.addObject("totalValue", "0");
      				}
      				else
      				{
      				if(list_loyaltyCardMaster.size()<Integer.parseInt(maxRecords))
      				{
      					end = (list_loyaltyCardMaster.size())+(Integer.parseInt(index));
      				}
      				else
      				{
      					end = (Integer.parseInt(index)+end);
      				}
      					modelAndViewObj.addObject("totalRecords", list_loyaltyCardMaster.get(0).getTotalRecords());
      					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
      					modelAndViewObj.addObject("totalValue", end);
//      				}
      				modelAndViewObj.addObject("loyaltyCardsList", list_loyaltyCardMaster);
      				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
      			}
//      			else
//      			{
//      				modelAndViewObj.addObject("err",list_loyaltyCardMaster.get(0).getResponseMessage());
//      			}
      			   
      			modelAndViewObj.setViewName("CRM/LoyaltyPrograms/LoyaltyCards/loyaltyCards");
      		}
      		catch(Exception exception){
      			exception.printStackTrace();
      		}
      		return modelAndViewObj;
      	}
			
			
			
      	
       	@RequestMapping("/viewCustomerOTP")
    	public ModelAndView viewCustomerOTP(@RequestParam("index")String index,@RequestParam("location")String location,
    			@RequestParam("maxRecords")String maxRecords,@RequestParam("searchName")String searchName,HttpServletRequest request,HttpServletResponse response){
    		try{
    			String customerIdStr = (String) request.getSession().getAttribute("customerId");
    			String emailIdStr = (String) request.getSession().getAttribute("emailId");
    			FilterInput filterInputObj = new FilterInput();
      			filterInputObj.setStartIndex(index);
      			filterInputObj.setMaxRecords(maxRecords);
      			filterInputObj.setSearchCriteria(searchName);
      			filterInputObj.setStoreLocation(location);
    			
    			ArrayList<LocationBean>	locationsList = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);

    			List<String> workLocationsList = adminServiceObj.getLocationsList("","",null);
    		
    		//	List<CustomerGroupMaster> groupsList = customerServiceObj.getCustomerGroupDetails("",customerIdStr, emailIdStr,"-1","",true, false,"","","","");
    			
    			List<CustomerDetails> customerDetailsList = customerServiceObj.getCustomerList(filterInputObj, customerIdStr, emailIdStr);
      			
    			int start = 1,end = Integer.parseInt(maxRecords);
      			modelAndViewObj = new ModelAndView();
      			modelAndViewObj.addObject("locationsList", locationsList);
            //      modelAndViewObj.addObject("groupsList", groupsList);
      			
      			if(customerDetailsList == null || customerDetailsList.size() == 0){
      				modelAndViewObj.addObject("totalRecords","0");
      				modelAndViewObj.addObject("index", "0");
      				modelAndViewObj.addObject("totalValue", "0");
      			}
      			else{
      				if(customerDetailsList.size()<Integer.parseInt(maxRecords)){
    					end = (customerDetailsList.size())+(Integer.parseInt(index));
    				}else{
    					end = (Integer.parseInt(index)+end);
    				}
      				modelAndViewObj.addObject("totalRecords", Integer.parseInt(customerDetailsList.get(0).getTotalRecords()));
      				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
      				modelAndViewObj.addObject("totalValue", end);
      			}
      			
      			/*else{
    				if(customerDetailsList.size()<Integer.parseInt(filterInputObj.getMaxRecords())){
    					end = customerDetailsList.size()+Integer.parseInt(filterInputObj.getStartIndex());
    				}else{
    					end = Integer.parseInt(filterInputObj.getStartIndex())+end;
    				}
    				modelAndViewObj.addObject("totalRecords", customerDetailsList.get(0).getTotalRecords());
    				modelAndViewObj.addObject("index", Integer.parseInt(filterInputObj.getStartIndex())+start);
    				modelAndViewObj.addObject("totalValue", end);
    			}*/
      			
      			modelAndViewObj.addObject("selectedLocation", location);
      			modelAndViewObj.addObject("searchName", searchName);
      			modelAndViewObj.addObject("maxRecords", maxRecords);
      			modelAndViewObj.addObject("customerDetailsList",customerDetailsList);
          		modelAndViewObj.addObject("workLocationsList", workLocationsList);
          		
    			modelAndViewObj.setViewName("CRM/CustomerOTP");
    		}catch(Exception exception){
    			exception.printStackTrace();
    		}
    		return modelAndViewObj;
    	}
			
		
       	
       	@RequestMapping(value="/exportWallet")
		public ModelAndView exportWallet(@RequestParam("walletProgramId")String id ,@RequestParam("operation") String operation ,@RequestParam("index") String index ,
				@RequestParam("maxRecords") String walletMaxRecords ,
				@RequestParam("childsearch") String childsearch,
				@RequestParam("searchName") String searchName,@RequestParam("walletID") String  walletID ,
				@RequestParam("saveFlag") boolean saveFlag,
				HttpServletRequest request,HttpServletResponse response) {
			CustomerLedger filterInputObj = new CustomerLedger();
			try{
				// log.info("view Wallwts ");
				String LocationString="";
				String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
				List<CustomerWalletMaster> walletList = customerServiceObj.exportWallet(customerIdStr, emailIdStr,"","","","" ,"",searchName,id,index,walletMaxRecords,childsearch,saveFlag);
				
				CustomerWalletMaster walletLists = new CustomerWalletMaster();
				modelAndViewObj = new ModelAndView();
				
				if(walletID.trim().isEmpty()){
					
				}else{
				for(CustomerWalletMaster cwm:walletList){
					if(walletID.trim().equalsIgnoreCase(cwm.getWalletProgramId()))
					walletLists	= cwm;
				}
				walletList.clear();
				walletList.add(walletLists);
				}
				
				modelAndViewObj.addObject("walletList",walletList.get(0));
				modelAndViewObj.addObject("operation",operation);
				String zonestr="";
				List<String> zones  = new ArrayList<String>();
				List<String> locations  = new ArrayList<String>();
				
				for (CustomerWalletLocations loyalityZone : walletList.get(0).getCustomerWalletLocations()) 
				{
					zones.add(loyalityZone.getZone());
					locations.add(loyalityZone.getLocation());
					LocationString = LocationString+loyalityZone.getLocation()+",";
				}
				for(String string:zones)
				{
//					
					zonestr = zonestr+string+",";
				}
				
				int start = 1,end = Integer.parseInt(walletMaxRecords);
				
				if(walletList.get(0).getWallets()== null ){
					modelAndViewObj.addObject("totalRecords","0");
					modelAndViewObj.addObject("index", "0");
					modelAndViewObj.addObject("totalValue", "0");
				}else{
					if(walletList.get(0).getWallets().size()<Integer.parseInt(walletMaxRecords)){
						end = (walletList.get(0).getWallets().size())+(Integer.parseInt(index));
					}else{
						end = (Integer.parseInt(index)+end);
					}
					modelAndViewObj.addObject("totalRecords",walletList.get(0).getTotalWallets());
					modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
					modelAndViewObj.addObject("totalValue", end);
				}
				Set<String> locationsbasedzone = genericMasterServiceObj.getlocationsBasedOnZone(zonestr,customerIdStr, emailIdStr, "0","","");
				ArrayList<LocationBean> locationDetails = genericMasterServiceObj.getLocationDetails("",customerIdStr, emailIdStr,"-1","",false,false,true);
				java.util.Set<String> zoneList = new java.util.LinkedHashSet<String>(zones); 
				java.util.Set<String> locationList = new java.util.LinkedHashSet<String>(locations);

				List<Group> groupsList = outletMasterServiceObj.getProductGroupDetails("",customerIdStr, emailIdStr,"-1","",true);
				if(groupsList != null && groupsList.size() != 0){
					modelAndViewObj.addObject("groupsList", groupsList);
				}
	        
	        modelAndViewObj.addObject("maxRecords",Integer.parseInt(walletMaxRecords));
	        modelAndViewObj.addObject("zones",zoneList);
	    	modelAndViewObj.addObject("locationDetails", locationDetails);
	    	modelAndViewObj.addObject("locationsbasedzone",locationsbasedzone);
	    	modelAndViewObj.addObject("locationList",locationList);
	    	modelAndViewObj.addObject("LocationString",LocationString);
	    	modelAndViewObj.addObject("searchCriteria",searchName);
	    	modelAndViewObj.addObject("searchName",searchName);
	    	if(walletList.get(0).getFilePath()!=null && !walletList.get(0).getFilePath().equals("") && walletList.get(0).getFilePath() != "")
	    	    modelAndViewObj.addObject("downloadurl", walletList.get(0).getFilePath());
	    	//modelAndViewObj.addObject("downloadurl", "http://101.53.158.27/Configurations/CID8995448/Exports/CustomerGiftCoupons.csv");
			modelAndViewObj.setViewName("CRM/LoyaltyPrograms/Wallets/vieweditwallet");
			}
			catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndViewObj;
		}
			
			
//end of controller.	
}	
		

