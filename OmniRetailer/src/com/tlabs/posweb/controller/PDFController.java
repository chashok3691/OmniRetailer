package com.tlabs.posweb.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tlabs.posweb.beans.BillItems;
import com.tlabs.posweb.beans.Billing;
import com.tlabs.posweb.beans.LocationBean;
import com.tlabs.posweb.beans.PurchaseOrder;
import com.tlabs.posweb.beans.PurchaseOrderBean;
import com.tlabs.posweb.beans.ReportsView;
import com.tlabs.posweb.beans.SalesReport;
import com.tlabs.posweb.beans.WHPurchaseOrderItems;
import com.tlabs.posweb.services.GenericMasterService;
import com.tlabs.posweb.services.ReportsService;

@Controller
@RequestMapping(value="/pdf")
public class PDFController {

   // private static Logger log = Logger.getLogger(PDFController.class);
	
	private ModelAndView modelAndViewObj;
	@Autowired
	private ReportsService reportsServiceObj;
	@Autowired
	private GenericMasterService genericMasterServiceObj;
	@RequestMapping(value="/purchaseorder",method=RequestMethod.GET)
	public ModelAndView purchaseorderPdf(HttpServletRequest request,HttpServletResponse response){
		
		
		PurchaseOrderBean orderBeanObj = null;
		
		//log.info("Calling generatePdf()...");
		  try{
			  //Response will come from webservices. For Generating Purchase Order template, placing static values
			  orderBeanObj = new PurchaseOrderBean();
			  PurchaseOrder orderDetails = new PurchaseOrder();
			  WHPurchaseOrderItems purchaseOrderItems = new WHPurchaseOrderItems();
			  List<WHPurchaseOrderItems> itemDetails = new ArrayList<WHPurchaseOrderItems>();
			  orderDetails.setLogo("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");
			  orderDetails.setCredit_terms("");
			  orderDetails.setShipping_address_doorNo("8-2-293/82/A-120");
			  orderDetails.setShipping_address_street("Road No.70,");
			  orderDetails.setShipping_address_location("Jubilee Hills");
			  orderDetails.setShipping_address_city("Hyderabad");
			  orderDetails.setSupplier_name("Asmara Apparels India Private Limited ");
			  orderDetails.setSupplier_contact_name("XXXX");
			  orderDetails.setOrder_date("03/09/2015");
			  orderDetails.setDelivery_due_date("08/09/2015");
			  orderDetails.setShipping_mode("Ordinary");
			  orderDetails.setPayment_terms("60 Days");
			  orderDetails.setShipping_terms("shipping terms");
			  orderDetails.setCredit_terms("credit Terms");
			  orderDetails.setOrder_submitted_by("YYYY");
			  orderDetails.setOrder_approved_by("ZZZZ");
			  orderDetails.setShipping_cost(50.0);
			  orderDetails.setTotal_tax(200.0);
			  orderDetails.setTotal_po_value(120250.0);
			  
			  orderBeanObj.setWhPurchaseOrder(orderDetails);
			  
			  purchaseOrderItems.setItemId("SK100001");
			  purchaseOrderItems.setItemDesc("Apple IPAD - BLACK");
			  purchaseOrderItems.setItemPrice(60000.0);
//			  purchaseOrderItems.setQuantity(2);
			  purchaseOrderItems.setSize("Small");
			  purchaseOrderItems.setColor("BLACK");
			  itemDetails.add(purchaseOrderItems);
			  
			  /*purchaseOrderItems.setItemId("SK100002");
			  purchaseOrderItems.setItemDesc("Galaxy Tab - WHITE");
			  purchaseOrderItems.setItemPrice(12000.0);
			  purchaseOrderItems.setQuantity(1);
			  purchaseOrderItems.setSize("Medium");
			  purchaseOrderItems.setColor("WHITE");
			  itemDetails.add(purchaseOrderItems);*/
			  
//			  orderBeanObj.setItemDetails(itemDetails);
			  
			  response.setContentType("application/pdf");
			  modelAndViewObj = new ModelAndView("invoicePdfView", "orderBean",orderBeanObj);
		  }catch(Exception e){
			  e.printStackTrace();
		  }
		
		/*List<Employee> listEmps = new ArrayList<Employee>();
		listEmps.add(new Employee("Sahitya","P"));
		listEmps.add(new Employee("Mythri","S"));
		listEmps.add(new Employee("Sonali","M"));
		listEmps.add(new Employee("Prashanth","P"));
		listEmps.add(new Employee("Rnajith","G"));
		listEmps.add(new Employee("Chandra","J"));
		listEmps.add(new Employee("Sambaiah","Y"));*/
		
		
		
		
		  
		  return modelAndViewObj;
	}
	
	/*@RequestMapping(value="/generateInvoice",method=RequestMethod.GET)
	public ModelAndView generateInvoice(HttpServletRequest request,HttpServletResponse response){
		
		//////System.out.println("Calling generatePdf()...");
		  
		  Employee employee = new Employee();
		  employee.setFirstName("Mythri");
		  employee.setLastName("S");
	     //   response.setHeader("Content-Disposition", "attachment:filename=report.pdf");
		  modelAndViewObj = new ModelAndView("invoicePdfView", "invoice",employee);
		  
		  return modelAndViewObj;
	}*/
	
//	@RequestMapping(value="/taxReport",method=RequestMethod.POST,consumes="application/json")
//	@SuppressWarnings("unchecked")
	@RequestMapping(value="/taxReport")
//	public ModelAndView taxReport(@RequestBody SalesReport salesReportobj,HttpServletRequest request,HttpServletResponse response){
	public ModelAndView taxReport(@RequestParam("loc") String locationStr,HttpServletRequest request,HttpServletResponse response){
		//log.info("Calling generatePdf()...");
		List<String> datevalues=new ArrayList<String>();
		  try{
			  //////System.out.println("the loc is"+locationStr);
			  //Response will come from webservices. For Generating Purchase Order template, placing static values
//			  SalesReport salesReportobj = new SalesReport();
			  String customerIdStr = (String)request.getSession().getAttribute("customerId");
				String emailIdStr = (String)request.getSession().getAttribute("emailId");
//			  //////System.out.println(request.getSession().getAttribute("reportList"));
			  //salesReportobj.setReportsList((List<SalesReport>)request.getSession().getAttribute("reportList"));
			  List<SalesReport> salesReportobjs = reportsServiceObj.generateSalesReportCriteriaWise(customerIdStr, emailIdStr,locationStr, "", "","10","tax","-1",null,null, false,null,null,"","","","","","","","","","");
			  response.setContentType("application/pdf");
			  ReportsView reportsView = new ReportsView();
			  List<String> columnNames = new ArrayList<String>();
			  
			  for(Entry<String, List<String>> entry:salesReportobjs.get(0).getTaxWiseReport().entrySet())
			  {
				  if(entry.getKey().equals(""))
				  {
					  
				  } else {
				  columnNames.add(entry.getKey());
				  
					  
				  //List<String> l[i]=new ArrayList<String>();
				  if(entry.getKey().equals("Date"))
					  datevalues.addAll(entry.getValue());
				  }
				  
			  }
			  
			  ////////System.out.println(salesReportobjs.getTaxWiseReport().value[0]);	  
			 /* for (String key : salesReportobjs.getTaxWiseReport().keySet()) {
				  columnNames.add(key);
				  //////System.out.println("keys are"+key);
				  if(key.equals("Date"))
					  //////System.out.println(salesReportobj.getTaxWiseReport().get(key));   
				  //keys.add(key);
					 //values.addAll(salesReportobj.getTaxWiseReport().get(key)); 
					   ////////System.out.println("key: " + key + " value: " + loans.get(key));
					}*/
			 
			  
			  
			  /*columnNames.add("Date");
			  columnNames.add("G.T.O");
			  columnNames.add("5% Sales");
			  columnNames.add("Sales Tax 5%");
			  columnNames.add("14.5% Sales");
			  columnNames.add("Sales Tax 14.5%");
			  columnNames.add("Exempted Sales");
			  columnNames.add("Tax Amount");*/
			  reportsView.setColumnNames(columnNames);
			  String reportHeading = "TAX REPORTS";
			  String reportHeading1 = "from ";
			  reportsView.setReportHeading(reportHeading);
			  List<List<String>> resultList = new ArrayList<List<String>>();
			  if(Integer.parseInt(salesReportobjs.get(0).getTotalRecords()) != 0){
				  int length = salesReportobjs.get(0).getTaxWiseReport().get("Date").size();
//				  int i=0;
				  reportHeading1 = reportHeading1 + datevalues.get(length-1) + " to " + datevalues.get(0);
				//  reportHeading1 = reportHeading1 + salesReportobj.getReportsList().get(length-1).getDate() + " to " + salesReportobj.getReportsList().get(0).getDate();
				 // for(SalesReport salesReport : salesReportobj.getReportsList()){
				  for(int j=0;j<length;j++)
				  {
					  List<String> result = new ArrayList<String>();
					 
					  for(Entry<String, List<String>> entry:salesReportobjs.get(0).getTaxWiseReport().entrySet())
					  {
						  ////////System.out.println("the keys are"+entry.getKey()+"-");
						if(entry.getKey().equals("")){  
							//result.add("");
						} else
						{
							result.add(entry.getValue().get(j));
							
						}
					  
					  }
					  resultList.add(result);
					  
				  }
					 /* result.add(salesReport.getDate());
					  result.add(salesReport.getGto());
					  result.add(salesReport.getSales5());
					  result.add(salesReport.getSalesTax5());
					  result.add(salesReport.getSales145());
					  result.add(salesReport.getSalesTax145());
					  result.add(salesReport.getExempted());
					  result.add(salesReport.getTodayTotal());*/
					  //resultList.add(result);
				  
				 /* List<String> result = new ArrayList<String>();
				  result.add("");
				  result.add(salesReportobj.getReportsList().get(0).getGrossGto());
				  result.add(salesReportobj.getReportsList().get(0).getGrossSales5());
				  result.add(salesReportobj.getReportsList().get(0).getGrossSalesTax5());
				  result.add(salesReportobj.getReportsList().get(0).getGrossSales145());
				  result.add(salesReportobj.getReportsList().get(0).getGrossSalesTax145());
				  result.add(salesReportobj.getReportsList().get(0).getGrossExempted());
				  result.add(salesReportobj.getReportsList().get(0).getGrossTodayTotal());
				  resultList.add(result);*/
			  }
			  reportsView.setReportHeading1(reportHeading1);
			  reportsView.setResultList(resultList);
			  modelAndViewObj = new ModelAndView("pdfView", "pdfList",reportsView);
		  }catch(Exception e){
			  e.printStackTrace();
		  }
		  return modelAndViewObj;
	}
	
	
	@RequestMapping(value="/Bill",method=RequestMethod.GET)
	public ModelAndView Bill(HttpServletRequest request,HttpServletResponse response){
		
		  try{
			  //log.info("Calling Bill Pdf...");
			  Billing billingBean = (Billing)request.getSession().getAttribute("reportList");
			  response.setContentType("application/pdf");
			  ReportsView reportsView = new ReportsView();
			  List<String> columnNames = new ArrayList<String>();
			  columnNames.add("S No.");
			  columnNames.add("Particular");
			  columnNames.add("Qty");
			  columnNames.add("Rate");
			  columnNames.add("Tax");
			  columnNames.add("Total Amount");
			  reportsView.setColumnNames(columnNames);
			  String date = billingBean.getBill_date();
			  reportsView.setDateStr("Date : "+date);
			  String reportHeading1 = " ";
			  String reportHeading2 = " ";
			  String reportHeading = "";
			   reportHeading = (String)request.getSession().getAttribute("businessName");
			  ArrayList<LocationBean> locationDetails = genericMasterServiceObj.getLocationDetails(
					  billingBean.getStore_location(), "", "", "0", "", false, true, true);
			  if (locationDetails.size()>0) {
				   reportHeading1 = locationDetails.get(0).getLocationId()+",  "+locationDetails.get(0).getCity();
						   reportHeading2 = locationDetails.get(0).getAddress()+","+locationDetails.get(0).getArea();
			  }
			  //String reportHeading1 = "Wholesale Distributors for KMF";
			 // String reportHeading2 = "Shop No-1, Munni Ready Building, Nandini Mini Parlour, Vidyanagar,\nTaluka Anekal, Post Bommasandra, Near Lark Hotel, Near Hosur Road,\nBengaluru - 560099, Karnataka, India\nPh No: 9880063933,8050807673";
			  reportsView.setReportHeading(reportHeading);
			  reportsView.setReportHeading1(reportHeading1);
			  reportsView.setReportHeading2(reportHeading2);
			  List<String> keys = new ArrayList<String>();
			  List<String> values = new ArrayList<String>();
			  keys.add("Bill Id : ");
			  values.add(billingBean.getBillId());
			  keys.add("Counter : ");
			  values.add(billingBean.getCounterId());
			  List<List<String>> resultList = new ArrayList<List<String>>();
			  if(billingBean.getBillItems() != null){
				  int i=1;
				  for(BillItems billItems : billingBean.getBillItems()){
					  List<String> result = new ArrayList<String>();
					  result.add(i+"");
					  result.add(billItems.getItem_name());
					  result.add(billItems.getQuantity()+"");
					  result.add(billItems.getItemUnitPrice()+"");
//					  float ammount = (billItems.getItem_total_price()-((billItems.getItem_total_price()*100)/(100+billItems.getTaxRate())));
//					  result.add(ammount+"");
					  result.add(billItems.getTaxRate()+"%");
					  result.add(billItems.getItem_total_price()+"");
					  resultList.add(result);
					  i++;
				  }
			  }
			  
			  keys.add("Gift Voucher / Coupon");
			  values.add(billingBean.getVoucherDiscounts());
			  keys.add("Deals or Offers");
			  values.add(billingBean.getTotalDiscount());
			  keys.add("Sub Total");
			  values.add(billingBean.getSubTotal()+"");
			  keys.add("Tax");
			  values.add(billingBean.getTax());
			  keys.add("Total Bill");
			  values.add(billingBean.getTotalPrice());
			  keys.add("Other Discounts");
			  values.add(billingBean.getOtherDisc());
			  keys.add("Bill Due");
			  values.add(billingBean.getDueAmount());
			  
			  reportsView.setKeys(keys);
			  reportsView.setValues(values);
			  
			  /*String footer = "\nGift Voucher / Coupon : "+billingBean.getTotalDiscount()+"\nDeals or Offers : "+billingBean.getTotalDiscount()+"\nSub Total : "
			  		+ billingBean.getSubTotal()+"\nTax : "+billingBean.getTax()+"\nTotal Bill : "+billingBean.getTotalPrice()+"\nOther Discounts : "+billingBean.getOtherDisc()+"\nBill Due : "+billingBean.getDueAmount();
			  reportsView.setFooterStr(footer);*/
			  reportsView.setFooterStr("Thank You.");
			  reportsView.setResultList(resultList);
			  modelAndViewObj = new ModelAndView("invoicePdfView", "reportsView",reportsView);
		  }catch(Exception e){
			  e.printStackTrace();
		  }
		
		  return modelAndViewObj;
	}
	
}
