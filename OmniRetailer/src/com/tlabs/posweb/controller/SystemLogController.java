package com.tlabs.posweb.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tlabs.posweb.beans.Billing;
import com.tlabs.posweb.beans.LogBean;
import com.tlabs.posweb.beans.SAPBean;
import com.tlabs.posweb.beans.WarehouseCounterResponse;
import com.tlabs.posweb.init.AppProperties;
import com.tlabs.posweb.services.AdminService;
import com.tlabs.posweb.services.LogService;
import com.tlabs.posweb.services.ReportsService;
import com.tlabs.posweb.util.Constants;

@Controller
@RequestMapping(value = "/systemLog")
public class SystemLogController {
		//private static Logger log = Logger.getLogger(SystemLogController.class);
		@Autowired
	    private LogService logServiceObj;
		@Autowired
		private AdminService adminServiceObj;
		private ModelAndView modelAndViewObj;
		@Autowired
		private ReportsService reportsServiceObj;
		
		/**
		 * @author Mythri.S
		 * @param request
		 * @param response
		 * @return returns a jsp which displays all the icons of outlet management flow
		 */
		@RequestMapping("/showSystemLogs")
		public ModelAndView showSystemLogs(HttpServletRequest request,HttpServletResponse response){
			// log.info("showSystemLogs");
			modelAndViewObj = new ModelAndView();
			modelAndViewObj.setViewName("SystemLogs/systemLogsFlow");
			return modelAndViewObj;
		}
	  
	  /**
	   * 
	   * @author Viswanath
	   * 
	   *This method is used to display  Application log info.
	   *
	   **/
	
		
	  
	 /*@RequestMapping("/viewApplicationLog")
	  public ModelAndView viewApplicationLog(@RequestParam("id") String id,
			  @RequestParam("index") String indexStr,@RequestParam("maxRecords") String maxRecords,
			  @RequestParam("searchCreteria") String searchCreteriastr,@RequestParam("startDate") String startDate,
			  @RequestParam("endDate") String endDate,@RequestParam("location") String location,
			 @RequestParam("saveFlag") boolean saveFlag,
			 HttpServletRequest request,HttpServletResponse response) {
	  	String customerIdStr = null,emailIdStr=null;List<String> locationsList=null;
	  	try{
	  		// log.info("viewApplicationLog");
	  		customerIdStr = (String)request.getSession().getAttribute("customerId");
	  		emailIdStr = (String)request.getSession().getAttribute("emailId");
	  		locationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr,emailIdStr,true);
	  		
	  		List<LogBean> logList = logServiceObj.getApplicationLog(searchCreteriastr,customerIdStr,emailIdStr,indexStr,location,maxRecords,startDate,endDate,false,saveFlag);
	  		
	  		String url = "";
	  		modelAndViewObj = new ModelAndView();
	  		
	  		if(saveFlag){
	  			if(logList != null && logList.size()>0 && logList.get(0).getLogFileurl()!=null){
	  				url = logList.get(0).getLogFileurl();
	  			modelAndViewObj.addObject("downloadurl",url);
	  			logList.clear();
	  			}
	  		}
	  		int start = 1,end = Integer.parseInt(maxRecords);
	  		if(logList == null || logList.size() == 0){
	  			modelAndViewObj.addObject("totalRecords","0");
	  			modelAndViewObj.addObject("index", "0");
	  			modelAndViewObj.addObject("totalValue", "0");
	  					
		  			modelAndViewObj.addObject("startDate", startDate);
		  			modelAndViewObj.addObject("endDate", endDate);	 
	  		}else{
	  			if(logList.size()<10){
	  				end = (logList.size())+(Integer.parseInt(indexStr));
	  			}else{
	  				end = (Integer.parseInt(indexStr)+end);
	  			}
//	  			if(logList !=null && logList.size()>0)
//	  				////////System.out.println(logList.get(0).getTotalRecords());
	  			modelAndViewObj.addObject("totalRecords", logList.get(0).getTotalRecords());
	  			modelAndViewObj.addObject("index", (Integer.parseInt(indexStr)+start));
	  			modelAndViewObj.addObject("totalValue", end);
		  			modelAndViewObj.addObject("startDate", startDate);
		  			modelAndViewObj.addObject("endDate", endDate);	 
	  		}
	  		//modelAndViewObj.addObject("logList", logList);
	  		modelAndViewObj.addObject("maxRecords", maxRecords);
	  		modelAndViewObj.addObject("locationsList", locationsList);
	  		
	  	//	if(id.equals("applicationLog"))
	  		         modelAndViewObj.setViewName("SystemLogs/viewApplicationLog");
	  	  else
	            modelAndViewObj.setViewName("SystemLogs/viewExportLog");

	  	}catch(Exception e){
	  	  e.printStackTrace();	
	  	}
	  	return modelAndViewObj;
	  }*/
	  
	  
		
		@RequestMapping("/viewApplicationLog")
		  public ModelAndView viewApplicationLog(@RequestParam("id") String id,
				  @RequestParam("index") String indexStr,@RequestParam("maxRecords") String maxRecords,
				  @RequestParam("searchCreteria") String searchCreteriastr,@RequestParam("startDate") String startDate,
				  @RequestParam("endDate") String endDate,@RequestParam("location") String location,
				 @RequestParam("saveFlag") boolean saveFlag,
				 HttpServletRequest request,HttpServletResponse response) {
		  	String customerIdStr = null,emailIdStr=null;List<String> locationsList=null;
		  	try{
		  		// log.info("viewApplicationLog");
		  		customerIdStr = (String)request.getSession().getAttribute("customerId");
		  		emailIdStr = (String)request.getSession().getAttribute("emailId");
		  		locationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr,emailIdStr,true);
		  		
		  		List<LogBean> logList = logServiceObj.getApplicationLog(searchCreteriastr,customerIdStr,emailIdStr,indexStr,location,maxRecords,startDate,endDate,false,saveFlag);
		  		
		  		String url = "";
		  		modelAndViewObj = new ModelAndView();
		  		
		  		if(saveFlag){
		  			if(logList != null && logList.size()>0 && logList.get(0).getLogFileurl()!=null){
		  				url = logList.get(0).getLogFileurl();
		  			modelAndViewObj.addObject("downloadurl",url);
		  			logList.clear();
		  			}
		  		}
		  		
		  		int start = 1,end = Integer.parseInt(maxRecords);
		  		if(logList == null || logList.size() == 0){
		  			modelAndViewObj.addObject("totalRecords","0");
		  			modelAndViewObj.addObject("index", "0");
		  			modelAndViewObj.addObject("totalValue", "0");
		  					
		  		}else{
		  			if(logList.size()<Integer.parseInt(maxRecords)){
		  				end = (logList.size())+(Integer.parseInt(indexStr));
		  			}else{
		  				end = (Integer.parseInt(indexStr)+end);
		  			}
		  			
		  			if(logList !=null && logList.size()>0){
			  			modelAndViewObj.addObject("totalRecords", logList.get(0).getTotalRecords());
		  			} else {
		  				modelAndViewObj.addObject("totalRecords", 0);
		  			}
		  			modelAndViewObj.addObject("index", (Integer.parseInt(indexStr)+start));
		  			modelAndViewObj.addObject("totalValue", end);
		  		}
		  		
		  		modelAndViewObj.addObject("startDate", startDate);
		  		modelAndViewObj.addObject("endDate", endDate);	 
		  		modelAndViewObj.addObject("logList", logList);
		  		modelAndViewObj.addObject("maxRecords", maxRecords);
		  		modelAndViewObj.addObject("locationsList", locationsList);
		  		
		  	//	if(id.equals("applicationLog"))
		  		modelAndViewObj.setViewName("SystemLogs/viewApplicationLog");
		  	/*  else
		            modelAndViewObj.setViewName("SystemLogs/viewExportLog");*/

		  	}catch(Exception e){
		  	  e.printStackTrace();	
		  	}
		  	return modelAndViewObj;
		  }
		
	  
	  
	  
	  /**
	   * 
	   * @author Viswanath
	   * 
	   *This method is used to search  Application log info.
	   *
	   **/
	  
	  
	  @RequestMapping("/searchApplicationLog")
		
	  
	  public ModelAndView searchApplicationLog(@RequestParam("index") String index,@RequestParam("location") String locationStr,
		  		@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,
		  		@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,
		  	HttpServletRequest request,HttpServletResponse response){
		  	String customerIdStr=null,emailIdStr=null;
		  	List<LogBean> logList=null;
		  	List<String> locationsList=null;
		  	try{
		  		int start = 1,end = Integer.parseInt(maxRecords);
		  		customerIdStr = (String)request.getSession().getAttribute("customerId");
		  		emailIdStr  = (String)request.getSession().getAttribute("emailId");
		  		modelAndViewObj = new ModelAndView();
		  		locationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr,emailIdStr,true);
		  			modelAndViewObj.addObject("locationsList", locationsList);
		  			logList = logServiceObj.getApplicationLog(searchName,customerIdStr,emailIdStr,index,locationStr,maxRecords,startDate,endDate,true, false);
		  			//request.getSession().setAttribute("selectedLocation",locationStr);
		  			if(logList == null || logList.size() == 0){
		  				modelAndViewObj.addObject("totalRecords","0");
		  				modelAndViewObj.addObject("index", "0");
		  				modelAndViewObj.addObject("totalValue", "0");
		  			}else{
		  				if(logList.size()<Integer.parseInt(maxRecords)){
		  					end = (logList.size())+(Integer.parseInt(index));
		  				}else{
		  					end = (Integer.parseInt(index)+end);
		  				}
		  				if(logList.size() > 0 && logList.get(0).getTotalRecords() != null)
		  				modelAndViewObj.addObject("totalRecords", Integer.parseInt(logList.get(0).getTotalRecords()));
		  				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
		  				modelAndViewObj.addObject("totalValue", end);
		  			}
		  			modelAndViewObj.addObject("searchName", searchName);
		  			modelAndViewObj.addObject("selectedLocation", locationStr);
		  			modelAndViewObj.addObject("startDate", startDate);
		  			modelAndViewObj.addObject("endDate", endDate);
		  			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
		  			modelAndViewObj.addObject("logList",logList);
		  		modelAndViewObj.setViewName("SystemLogs/viewApplicationLog");
		  		
		  	}catch(Exception e){
		  		e.printStackTrace();
		  	}
		  	return modelAndViewObj;
		  }
		 
		  
	  
	  
	  
	  
	  
	  /**
	   * 
	   * @author koti bommineni
	   * 
	   *This method is used to display  export log info.
	   *
	   **/
	 
	  @RequestMapping("/viewExportLog")
	  public ModelAndView viewExportLog(
			  @RequestParam("id") String id,
			  @RequestParam("index") String indexStr,@RequestParam("maxRecords") String maxRecords,
			  @RequestParam("searchCreteria") String searchCreteria,@RequestParam("startDate") String startDate,
			  @RequestParam("endDate") String endDate,@RequestParam("location") String location,
			  @RequestParam("saveFlag") boolean saveFlag,
			  HttpServletRequest request,HttpServletResponse response) {
		  
	  	String customerIdStr = null,emailIdStr=null;List<String> locationsList=null;
	  	try{
	  		// log.info("viewExportLog");
	  		customerIdStr = (String)request.getSession().getAttribute("customerId");
	  		emailIdStr = (String)request.getSession().getAttribute("emailId");
	  		locationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr,emailIdStr,true);
	  		List<LogBean> logList = logServiceObj.getExportLog(searchCreteria,customerIdStr,emailIdStr,indexStr,location,maxRecords,startDate,endDate,false,saveFlag);
	//  		maxRecords,startDate,endDate,false,saveFlag);

	  		
	  		
	  		String url = "";
	  		modelAndViewObj = new ModelAndView();
	  		
	  		if(saveFlag){
	  			if(logList != null && logList.size()>0 && logList.get(0).getLogFileurl()!=null){
	  				url = logList.get(0).getLogFileurl();
	  			modelAndViewObj.addObject("downloadurl",url);
	  			logList.clear();
	  			}
	  		}
	  		
	  		
	  		int start = 1,end = Integer.parseInt(maxRecords);
	  		if(logList == null || logList.size() == 0){
	  			modelAndViewObj.addObject("totalRecords","0");
	  			modelAndViewObj.addObject("index", "0");
	  			modelAndViewObj.addObject("totalValue", "0");
	  			
	  			/* added by        :  koti bomminei
		  	      description     :  to show default date */ 		
		  			
		  			modelAndViewObj.addObject("startDate", startDate);
		  			modelAndViewObj.addObject("endDate", endDate);}
	  		else{
	  			if(logList.size()<10){
	  				end = (logList.size())+(Integer.parseInt(indexStr));
	  			}else{
	  				end = (Integer.parseInt(indexStr)+end);
	  			}
	  			modelAndViewObj.addObject("totalRecords", logList.get(0).getTotalRecords());
	  			modelAndViewObj.addObject("index", (Integer.parseInt(indexStr)+start));
	  			modelAndViewObj.addObject("totalValue", end);
	  			/* added by        :  koti bomminei
		  	      description     :  to show default date */ 		
		  			
		  			modelAndViewObj.addObject("startDate", startDate);
		  			modelAndViewObj.addObject("endDate", endDate);
	  		}
	  		modelAndViewObj.addObject("logList", logList);
	  		modelAndViewObj.addObject("maxRecords", maxRecords);
	  		modelAndViewObj.addObject("locationsList", locationsList);
	  		
	  		
	  		modelAndViewObj.setViewName("SystemLogs/viewExportLog");
	  	}catch(Exception e){
	  	  e.printStackTrace();	
	  	}
	  	return modelAndViewObj;
	  }
	  
	  
	  
	  
	  
	  @RequestMapping(value = "/viewIntegrationDashboards")
	  public ModelAndView viewIntegrationDashboards(@RequestParam("index") String index,@RequestParam("maxRecords") String maxRecords,@RequestParam("zone") String zone,@RequestParam("type") String type,@RequestParam("location") String location,@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,@RequestParam("counterName") String counterName,HttpServletRequest request,HttpServletResponse response) {
		  String customerIdStr = null,emailIdStr=null;
		  List<String> allLocationsList=null;
		  List<String> locationsList=new ArrayList<String>();
		  List<String> countersList = null;
		  WarehouseCounterResponse counterDetails = null;
		  String counterId = null;
		  String locationListAll = "";
		  List<Billing> intMonitoringDetails = null;
		  try{
			 int start = 1,  end = Integer.parseInt(maxRecords);
			customerIdStr = (String)request.getSession().getAttribute("customerId");
		  	emailIdStr = (String)request.getSession().getAttribute("emailId");
		  	
		  		
		  	allLocationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr,emailIdStr,true);
		  	if(location == "" || location.equals("all")){
		  		if(allLocationsList != null){
		  				locationsList.addAll(allLocationsList);
		  		}
		  		for (String string : locationsList) {
		  			locationListAll = locationListAll+string+",";
				}
		  	}
		  	
		  	///////System.out.println("LOCC :"+new Gson().toJson(location));
		  	
			countersList = reportsServiceObj.getCounters("",customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
			counterDetails = adminServiceObj.getWhCounters("","",customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX,false,"100");
				
				if(countersList != null && countersList.size()>0)
					counterId=counterName;
				else
					counterId = "";
				
			intMonitoringDetails = logServiceObj.getIntegrationMonitoringDetails(customerIdStr,emailIdStr,index,maxRecords,zone,type,location,startDate,endDate,counterName,locationListAll);
	  		modelAndViewObj = new ModelAndView();
	  		
	  		if(intMonitoringDetails == null || intMonitoringDetails.size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(intMonitoringDetails.size()<end){
					end = (intMonitoringDetails.size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				
				String val = intMonitoringDetails.get(0).getTotalRecords();
				modelAndViewObj.addObject("totalRecords", Integer.parseInt(intMonitoringDetails.get(0).getTotalRecords()));
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
	  		
	  		modelAndViewObj.addObject("intMonitorDetails", intMonitoringDetails);
	  		modelAndViewObj.addObject("countersList", countersList);
			modelAndViewObj.addObject("counterDetails", counterDetails);
			modelAndViewObj.addObject("counterName",counterId);
	  		modelAndViewObj.addObject("allLocationsList", allLocationsList);
	  		modelAndViewObj.addObject("startIndex", index);
	  		modelAndViewObj.addObject("maxRecords", maxRecords);
	  		modelAndViewObj.addObject("selectedZone", zone);
	  		modelAndViewObj.addObject("type", type);
	  		modelAndViewObj.addObject("selectedLocation", location);
	  		modelAndViewObj.addObject("startDate", startDate);
	  		modelAndViewObj.addObject("endDate", endDate);
	  		
	  		modelAndViewObj.setViewName("SystemLogs/viewintegrationdashboard");
	  	}catch(Exception e){
	  		e.printStackTrace();
	  	}
	  	return modelAndViewObj; 
	  }
	  
	  
	
	  
	  @RequestMapping(value = "/allBillPushtoSAPfromID")
	  public ModelAndView allBillPushtoSAPfromID(@RequestParam("index") String index,@RequestParam("maxRecords") String maxRecords,@RequestParam("zone") String zone,@RequestParam("type") String type,@RequestParam("location") String location,@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,@RequestParam("counterName") String counterName,HttpServletRequest request,HttpServletResponse response) {

	  	  String customerIdStr = null,emailIdStr=null;
	  	  List<String> allLocationsList=null;
	  	  List<String> locationsList=new ArrayList<String>();
	  	  List<String> countersList = null;
	  	  WarehouseCounterResponse counterDetails = null;
	  	 String counterId = null;
	  	  String locationListAll = "";
	  	  List<Billing> intMonitoringDetails = null;
	  	  try{
	  		 
			int start = 1,  end = Integer.parseInt(maxRecords);
	  		customerIdStr = (String)request.getSession().getAttribute("customerId");
	  	  	emailIdStr = (String)request.getSession().getAttribute("emailId");
	  	  	
	  	  		
	  	  	allLocationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr,emailIdStr,true);
	  	  	/*if(location == "" || location.equals("all")){*/
	  	  		if(allLocationsList != null){
	  	  				locationsList.addAll(allLocationsList);
	  	  		}
	  	  		for (String string : locationsList) {
	  	  			locationListAll = locationListAll+string+",";
	  			}
	  	  	/*}*/
	  	  	
	  	  	///////System.out.println("LOCC :"+new Gson().toJson(location));
	  	  	
	  	  	SAPBean responseObj = logServiceObj.allBillPushtoSAPfromID(customerIdStr,emailIdStr,location,startDate,endDate);
	  	  	modelAndViewObj = new ModelAndView();
	  	  	
	  	 	if(responseObj != null && responseObj.getResponseHeader() != null && responseObj.getResponseHeader().getResponseCode().equals("0")){
	  	  		modelAndViewObj.addObject("successMsg", responseObj.getResponseHeader().getResponseMessage());
	  	  	} else {
	  	  		modelAndViewObj.addObject("errorMsg", responseObj.getResponseHeader().getResponseMessage());
	  	  	}
	  	  	
	  		countersList = reportsServiceObj.getCounters("",customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
	  		counterDetails = adminServiceObj.getWhCounters("","",customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX,false,"100");
	  			
	  		if(countersList != null && countersList.size()>0)
				counterId=counterName;
			else
				counterId = "";
	  		intMonitoringDetails = logServiceObj.getIntegrationMonitoringDetails(customerIdStr,emailIdStr,index,maxRecords,zone,type,location,startDate,endDate,counterName,locationListAll);
	  		
	  		if(intMonitoringDetails == null || intMonitoringDetails.size() == 0){
	  			modelAndViewObj.addObject("totalRecords","0");
	  			modelAndViewObj.addObject("index", "0");
	  			modelAndViewObj.addObject("totalValue", "0");
	  		}else{
	  			if(intMonitoringDetails.size()<end){
	  				end = (intMonitoringDetails.size())+(Integer.parseInt(index));
	  			}else{
	  				end = (Integer.parseInt(index)+end);
	  			}
	  			
	  			String val = intMonitoringDetails.get(0).getTotalRecords();
	  			modelAndViewObj.addObject("totalRecords", Integer.parseInt(intMonitoringDetails.get(0).getTotalRecords()));
	  			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
	  			modelAndViewObj.addObject("totalValue", end);
	  		}
	  		
	  		modelAndViewObj.addObject("intMonitorDetails", intMonitoringDetails);
	  		modelAndViewObj.addObject("countersList", countersList);
	  		modelAndViewObj.addObject("counterDetails", counterDetails);
	  		
	  		modelAndViewObj.addObject("allLocationsList", allLocationsList);
	  		modelAndViewObj.addObject("startIndex", index);
	  		modelAndViewObj.addObject("maxRecords", maxRecords);
	  		modelAndViewObj.addObject("selectedZone", "");
	  		modelAndViewObj.addObject("type", "");
	  		modelAndViewObj.addObject("selectedLocation", location);
	  	
	  		
	  		modelAndViewObj.setViewName("SystemLogs/viewintegrationdashboard");
	  	}catch(Exception e){
	  		e.printStackTrace();
	  	}
	  	return modelAndViewObj; 
	  }
	 

	




@RequestMapping(value = "/billsPushingtoSAPinID")
public ModelAndView billsPushingtoSAPinID(@RequestParam("index") String index,@RequestParam("maxRecords") String maxRecords,@RequestParam("location") String location,@RequestParam("date") String dateStr,@RequestParam("counter") String counterId,HttpServletRequest request,HttpServletResponse response) {
	  String customerIdStr = null,emailIdStr=null;
	  List<String> allLocationsList=null;
	  List<String> locationsList=new ArrayList<String>();
	  List<String> countersList = null;
	  WarehouseCounterResponse counterDetails = null;
	  //String counterId = null;
	  String locationListAll = "";
	  List<Billing> intMonitoringDetails = null;
	  try{
		 int start = 1,  end = Integer.parseInt(maxRecords);
		customerIdStr = (String)request.getSession().getAttribute("customerId");
	  	emailIdStr = (String)request.getSession().getAttribute("emailId");
	  	
	  		
	  	allLocationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr,emailIdStr,true);
	  	/*if(location == "" || location.equals("all")){*/
	  		if(allLocationsList != null){
	  				locationsList.addAll(allLocationsList);
	  		}
	  		for (String string : locationsList) {
	  			locationListAll = locationListAll+string+",";
			}
	  	/*}*/
	  	
	  	///////System.out.println("LOCC :"+new Gson().toJson(location));
	  	
	  	SAPBean responseObj = logServiceObj.billsPushingtoSAP(customerIdStr,emailIdStr,index,location,dateStr,counterId);
	  	modelAndViewObj = new ModelAndView();
	  	
	  	if(responseObj != null && responseObj.getResponseHeader() != null && responseObj.getResponseHeader().getResponseCode().equals("0")){
	  		modelAndViewObj.addObject("successMsg", responseObj.getResponseHeader().getResponseMessage());
	  	} else {
	  		modelAndViewObj.addObject("errorMsg", responseObj.getResponseHeader().getResponseMessage());
	  	}
	  	
		countersList = reportsServiceObj.getCounters("",customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX);
		counterDetails = adminServiceObj.getWhCounters("","",customerIdStr,emailIdStr,Constants.PAGINATION_START_INDEX,false,"100");
			
			/*if(countersList != null && countersList.size()>0)
				counterId="";
			else
				counterId = "";*/
			
		intMonitoringDetails = logServiceObj.getIntegrationMonitoringDetails(customerIdStr,emailIdStr,index,maxRecords,"","",location,dateStr,dateStr,counterId,locationListAll);
		
		if(intMonitoringDetails == null || intMonitoringDetails.size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(intMonitoringDetails.size()<end){
				end = (intMonitoringDetails.size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			
			String val = intMonitoringDetails.get(0).getTotalRecords();
			modelAndViewObj.addObject("totalRecords", Integer.parseInt(intMonitoringDetails.get(0).getTotalRecords()));
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
		}
		
		modelAndViewObj.addObject("intMonitorDetails", intMonitoringDetails);
		modelAndViewObj.addObject("countersList", countersList);
		modelAndViewObj.addObject("counterDetails", counterDetails);
		modelAndViewObj.addObject("counterName",counterId);
		modelAndViewObj.addObject("allLocationsList", allLocationsList);
		modelAndViewObj.addObject("startIndex", index);
		modelAndViewObj.addObject("maxRecords", maxRecords);
		modelAndViewObj.addObject("selectedZone", "");
		modelAndViewObj.addObject("type", "");
		modelAndViewObj.addObject("selectedLocation", location);
		modelAndViewObj.addObject("startDate", dateStr);
		modelAndViewObj.addObject("endDate", dateStr);
		
		modelAndViewObj.setViewName("SystemLogs/viewintegrationdashboard");
	}catch(Exception e){
		e.printStackTrace();
	}
	return modelAndViewObj; 
}
}






/*@RequestMapping("/searchExportLog")
public ModelAndView searchExportLog(@RequestParam("index") String indexStr,@RequestParam("maxRecords") String maxRecords,
		  @RequestParam("searchCreteria") String searchCreteria,@RequestParam("startDate") String startDate,
		  @RequestParam("endDate") String endDate,@RequestParam("location") String location,
		  HttpServletRequest request,HttpServletResponse response) {
	  
	String customerIdStr = null,emailIdStr=null;List<String> locationsList=null;
	try{
		// log.info("viewExportLog");
		customerIdStr = (String)request.getSession().getAttribute("customerId");
		emailIdStr = (String)request.getSession().getAttribute("emailId");
		locationsList = adminServiceObj.getOutletAndWarehouseLocationsList(customerIdStr,emailIdStr,true);
		List<LogBean> logList = logServiceObj.getExportLog(searchCreteria,customerIdStr,emailIdStr,indexStr,location,maxRecords,startDate,endDate,false);
		modelAndViewObj = new ModelAndView();
		int start = 1,end = Integer.parseInt(maxRecords);
		if(logList == null || logList.size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
			
			 added by        :  koti bomminei
	  	      description     :  to show default date  		
	  			
	  			modelAndViewObj.addObject("startDate", startDate);
	  			modelAndViewObj.addObject("endDate", endDate);	}
		else{
			if(logList.size()<10){
				end = (logList.size())+(Integer.parseInt(indexStr));
			}else{
				end = (Integer.parseInt(indexStr)+end);
			}
			modelAndViewObj.addObject("totalRecords", logList.get(0).getTotalRecords());
			modelAndViewObj.addObject("index", (Integer.parseInt(indexStr)+start));
			modelAndViewObj.addObject("totalValue", end);
		}
		modelAndViewObj.addObject("logList", logList);
		modelAndViewObj.addObject("maxRecords", maxRecords);
		modelAndViewObj.addObject("locationsList", locationsList);
		modelAndViewObj.setViewName("SystemLogs/viewExportLog");
	}catch(Exception e){
	  e.printStackTrace();	
	}
	return modelAndViewObj;
}

}
*/