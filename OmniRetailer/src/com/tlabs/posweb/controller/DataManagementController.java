package com.tlabs.posweb.controller;
//
//import java.io.File;
//import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
//import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.tlabs.posweb.beans.Assement;
import com.tlabs.posweb.beans.BackupAndRecoveryResponse;
import com.tlabs.posweb.init.AppProperties;
//import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import com.tlabs.posweb.beans.BatchOperations;
import com.tlabs.posweb.beans.BatchOperationsResponse;
import com.tlabs.posweb.beans.CounterResponse;
import com.tlabs.posweb.beans.LocationBean;
import com.tlabs.posweb.beans.MasterDataImportsAndExportsBean;
//import com.tlabs.posweb.beans.PriceHistory;
import com.tlabs.posweb.beans.ResponseHeader;
import com.tlabs.posweb.beans.Role;
import com.tlabs.posweb.services.AdminService;
import com.tlabs.posweb.services.DataManagementService;
import com.tlabs.posweb.services.GenericMasterService;
import com.tlabs.posweb.services.RoleService;
//import com.tlabs.posweb.util.Constants;
import com.tlabs.posweb.util.RestfulServiceConnection;
//import com.tlabs.posweb.util.ServerSideValidations;
//import com.tlabs.posweb.util.Utilities;

@Controller
@RequestMapping(value = "/dataManagement")
public class DataManagementController {
	
	//private static Logger log = Logger.getLogger(DataManagementController.class);
	private ModelAndView modelAndViewObj;
	@Autowired
	private DataManagementService dataManagementServiceObj;
	@Autowired
	private AdminService adminServiceObj;
	@Autowired
	private GenericMasterService genericMasterServiceObj;
	@Autowired
	private RoleService roleServiceObj;
	
	@RequestMapping("/uploadtoftp")
	public  void uploadFileToFtp(@RequestParam("ftpserver") String server ,@RequestParam("port") int portNo ,@RequestParam("loginid") String userName ,@RequestParam("password") String password ,HttpServletRequest request,HttpServletResponse response) throws IOException{
		//boolean flag=false;
		   String jsonString = null;
		try{
	        FTPClient ftpClient = new FTPClient();
	        ftpClient.connect(server, portNo);
            ftpClient.login(userName, password);
            //////////System.out.println(ftpClient.isRemoteVerificationEnabled());
            if (ftpClient.isConnected()) {
               // ////////System.out.println(ftpClient.getReplyCode());
            } else {
               // ////////System.out.println("Could not query server features");
            }
            //ftpClient.enterLocalPassiveMode();
            //ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
          
            // APPROACH #1: uploads first file using an InputStream
          /*  File firstLocalFile = new File(sourceDirectory);
            String firstRemoteFile = desinationDirectory;*/
           /* InputStream inputStream = new FileInputStream(firstLocalFile);
            boolean done = ftpClient.storeFile(firstRemoteFile, inputStream);*/
           /* inputStream.close();
            if (done) {
            	flag=true;
                //////////System.out.println("The first file is uploaded successfully.");
            }*/
            
         
			
				jsonString = "{\"err\":\" "+ftpClient.getReplyCode()+"\"}";
		
		}catch(Exception e){
			e.printStackTrace();
			jsonString = "{\"err\":\"530\"}";
		}
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
    	response.getWriter().write(jsonString);
	}
	
	
	
	@RequestMapping(value="/exportFiles")
	public void exportFiles(
			@RequestParam("flow") String flow,
			@RequestParam("location") String location ,
			@RequestParam("startDate") String startDate ,
			@RequestParam("endDate") String endDate ,
			HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("exportFiles-" + flow);
		
		    String result = dataManagementServiceObj.exportFiles(startDate, endDate, flow,location);
			String jsonString = "";
				if(result.contains("0"))
					jsonString = result;
				else if(result.contains("-1"))
					jsonString = "{\"err\":\" Sorry please try after some time\"}";
			response.setContentType("application/json");
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
	
	
	@RequestMapping(value="/exportShipmentReceipt")
	public void exportShipmentReceipt(@RequestParam("type") String type,@RequestParam("location") String location ,@RequestParam("startDate") String startdate ,@RequestParam("enddate") String endDate ,HttpServletRequest request,HttpServletResponse response) {
		try{
		//	////////System.out.println("sfs");
			// log.info("exportStockReceipts");
		    String result = dataManagementServiceObj.exportShipmentReceipt(startdate, endDate, location,type);
			String jsonString = null;
				if(result.contains("0"))
					jsonString = "{\"msg\":\" File Uploaded Successfully\"}";
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
	 * @author Mythri.S
	 * @param request
	 * @param response
	 * @return returns a jsp which displays all the icons of outlet management flow
	 */
	@RequestMapping("/showDataManagementFlow")
	public ModelAndView showDataManagementFlow(HttpServletRequest request,HttpServletResponse response){
		// log.info("showDataManagementFlow");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("DataManagement/dataManagementFlow");
		return modelAndViewObj;
	}
	
	
	
	
	
	/**
	 * @author Mythri.S
	 * @param request
	 * @param response
	 * @return returns a jsp which displays all the icons of outlet management flow
	 */
	@RequestMapping("/viewReplication")
	public ModelAndView viewReplication(@RequestParam("id") String id,@RequestParam("index") String index,HttpServletRequest request,HttpServletResponse response){
		// log.info("viewReplication");
		modelAndViewObj = new ModelAndView();
		if(id.equals("replication")){
			modelAndViewObj.setViewName("DataManagement/Replication");	
		}else{
			modelAndViewObj.setViewName("DataManagement/manualreplication");
		}
		
		return modelAndViewObj;
	}
	
	
	
	
	
	
	/**
	 * @author vamsi v
	 * @param request
	 * @param response
	 * @return returns a jsp which displays all the import
	 */
	@RequestMapping("/viewImportdetails")
	public ModelAndView viewImportdetails(@RequestParam("flow") String flow/*,@RequestParam("index") String index*/,HttpServletRequest request,HttpServletResponse response){
		
		try
		{
		String maxRecords = "10";
		int start = 1,end = 10;
		String index="0";
		// log.info("viewImportdetails");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.addObject("flow",flow);
		BatchOperationsResponse  batchOperationsResponse = dataManagementServiceObj.getPackages("", "","-1","","");
		//////////System.out.println(batchOperationsResponse);
		modelAndViewObj.addObject("batchOperationsResponse",batchOperationsResponse.getBatchOperationsList());
		
		if(batchOperationsResponse == null || batchOperationsResponse.getBatchOperationsList()==null || batchOperationsResponse.getBatchOperationsList().size()==0)
		{
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(batchOperationsResponse.getBatchOperationsList().size()<Integer.parseInt(maxRecords)){
				end = (batchOperationsResponse.getBatchOperationsList().size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			modelAndViewObj.addObject("totalRecords", batchOperationsResponse.getTotalRecords());
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
			modelAndViewObj.addObject("totalValue", end);
		}
		
		
		modelAndViewObj.setViewName("DataManagement/importData");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}

	/**
	 * @author Mythri.S
	 * @param request
	 * @param response
	 * @return returns a jsp which displays all the icons of outlet management flow
	 */
	@RequestMapping("/viewImportFlow")
	public ModelAndView viewImportFlow(HttpServletRequest request,HttpServletResponse response){
		// log.info("viewImportFlow");
		modelAndViewObj = new ModelAndView();
		modelAndViewObj.setViewName("DataManagement/importFlow");
		return modelAndViewObj;
	}
	/**
	 * @author Chaithanya.v
	 * @param request
	 * @param response
	 * @return returns a jsp which displays all the icons of outlet management flow
	 */
	/*
	 * @RequestMapping("/viewBatchOperationsFlow") public ModelAndView
	 * viewBatchOperationsFlow(HttpServletRequest request,HttpServletResponse
	 * response){ // log.info("viewExportFlow"); modelAndViewObj = new
	 * ModelAndView();
	 * modelAndViewObj.setViewName("DataManagement/batchOperations"); return
	 * modelAndViewObj; }
	 */

	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to save the details of a productMaster from excel file
	 *
	 **/
	@RequestMapping(value="/importProductData",method=RequestMethod.POST)
	public void importProductData(@RequestParam("file") MultipartFile excelFile,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("importProductData");
			// log.info(excelFile.getSize());
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
//			////////System.out.println(excelFile.getOriginalFilename());
		    String result = dataManagementServiceObj.importProductData(customerId, emailId, excelFile);
//			 String result = "0";
			String jsonString = null;
				if(result.contains("0"))
					jsonString = "{\"msg\":\" File Uploaded Successfully\"}";
				else if(result.contains("-1"))
					jsonString = "{\"err\":\" Sorry please try after some time\"}";
			response.setContentType("application/json");
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
	
	
	/**
	 * @author Chaithanya.v
	 * @param request
	 * @param response
	 * @return returns a jsp which displays BackUp of OmniRetailer Application
	 */
	
	
	
	/*@RequestMapping("/viewBackUp")
	public ModelAndView viewBackUp(@RequestParam("index") String index,HttpServletRequest request,HttpServletResponse response){
		// log.info("viewBackUp");
		int end=10,start= 1;
		modelAndViewObj = new ModelAndView();
		BackupAndRecoveryResponse backupresponse = new BackupAndRecoveryResponse();
		backupresponse = dataManagementServiceObj.getbackup(index);
		if(backupresponse == null || backupresponse.getBackupList().size() == 0){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(backupresponse.getBackupList().size()<Integer.parseInt("10")){
				end = (backupresponse.getBackupList().size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			modelAndViewObj.addObject("totalRecords", backupresponse.getTotalRecords());
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
		}
		modelAndViewObj.addObject("backupresponse", backupresponse);
		modelAndViewObj.setViewName("DataManagement/viewBackUp");
		return modelAndViewObj;
	}*/
	
	
	
	/**
	 * 
	 * @author Manasa.S
	 * 
	 *This method is used to save the details of a warehouseSkumaster from excel file
	 *
	 **/
	
/*	@RequestMapping(value="/importWarehouseSkuData",method=RequestMethod.POST)
	public void importWarehouseSkuData(@RequestParam("file") MultipartFile excelFile,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("importWarehouseSkuData");
			// log.info(excelFile.getSize());
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			ResponseHeader responseHeader = dataManagementServiceObj.importWarehouseSkuData(customerId, emailId, excelFile);
			String jsonString = null;
				if(responseHeader.getResponseCode().equals("0"))
					jsonString = "{\"msg\":\" "+responseHeader.getResponseMessage()+"\"}";
				else
					jsonString = "{\"err\":\" "+responseHeader.getResponseMessage()+"\"}";
			response.setContentType("application/json");
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
	}*/
	
	
	@RequestMapping(value="/importWarehouseSkuData",method=RequestMethod.POST)
	public void importWarehouseSkuData(@RequestParam("file") MultipartFile excelFile,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("importWarehouseSkuData");
			// log.info(excelFile.getSize());
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			Assement assementObj = dataManagementServiceObj.importWarehouseSkuData(customerId, emailId, excelFile);
			String jsonString = null;
			
			/*if(responseHeader.getUrl() == null) {
				responseHeader.setUrl("");
			}*/
			
				/*if(responseHeader.getResponseCode().equals("0"))
					jsonString = "{\"msg\":\" "+responseHeader.getResponseMessage()+"\"}";
				else
					jsonString = "{\"err\":\" "+responseHeader.getResponseMessage()+"\"}";*/
			try{
				if(assementObj != null && assementObj.getResponseHeader() != null && assementObj.getResponseHeader().getResponseCode().equals("0"))
					jsonString = "{\"msg\":\" "+assementObj.getResponseHeader().getResponseMessage()+"\"}";
				else {
					if(assementObj.getUrl() != null && !assementObj.getUrl().equals("") && !assementObj.getUrl().equals(null))
						jsonString = "{\"err\":\" "+assementObj.getResponseHeader().getResponseMessage()+"\" ,\"errorUrl\":\""+assementObj.getUrl().replace("\\","/")+"\"}";
					else
						jsonString = "{\"err\":\" "+assementObj.getResponseHeader().getResponseMessage()+"\"}";
				}
			}catch(NullPointerException ne){
				jsonString = "{\"err\":\" "+ getResponseCode("SERVER_SIDE_RESPONDING").trim()+"\"}";
				
			}
			response.setContentType("application/json");
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
	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to save the details of a skuMaster from excel file
	 *
	 **/
	@RequestMapping(value="/importSkuData",method=RequestMethod.POST)
	public void importSkuData(@RequestParam("file") MultipartFile excelFile,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("importSkuData");
			// log.info(excelFile.getSize());
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			
			String jsonString = null;

				try{
					/*String status = new ServerSideValidations().excelFormValidation(excelFile);
					if(status.equalsIgnoreCase(Constants.SUCCESS)){*/
						Assement assesmentObj = dataManagementServiceObj.importSkuData(customerId, emailId, excelFile);
						ResponseHeader responseHeader = assesmentObj.getResponseHeader();
						if(assesmentObj.getUrl() == null) {
							assesmentObj.setUrl("");
						}
						
						
						if(responseHeader != null && responseHeader.getResponseCode().equals("0"))
							jsonString = "{\"msg\":\" "+responseHeader.getResponseMessage()+"\"}";
						else 
							jsonString = "{\"err\":\" "+responseHeader.getResponseMessage()+"\" ,\"errorUrl\":\""+assesmentObj.getUrl().replace("\\","/")+"\"}";
					/* }
					else
						jsonString = "{\"err\":\" "+status+"\"}";*/
					////////System.out.println(assesmentObj.getUrl());
				}
				
				catch(NullPointerException ne){
					jsonString = "{\"err\":\" "+ getResponseCode("SERVER_SIDE_RESPONDING").trim()+"\"}";
				
				}
			
				
			response.setContentType("application/json");
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
	
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to save the details of a skuMaster from excel file
	 *
	 **/
	@RequestMapping(value="/importsuppliersData",method=RequestMethod.POST)
	public void importsuppliersData(@RequestParam("file") MultipartFile excelFile,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("importsuppliersData");
			// log.info(excelFile.getSize());
			//////////System.out.println(excelFile.getSize());
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			Assement responseHeader = dataManagementServiceObj.importsuppliersData(customerId, emailId, excelFile);
			String jsonString = null;
				if(responseHeader.getResponseHeader().getResponseCode().equals("0"))
					jsonString = "{\"msg\":\" "+responseHeader.getResponseHeader().getResponseMessage()+"\"}";
				else{
					if(responseHeader.getUrl() != null && !responseHeader.getUrl().equals("") && !responseHeader.getUrl().equals(null))
						jsonString = "{\"err\":\" "+responseHeader.getResponseHeader().getResponseMessage()+"\" ,\"errorUrl\":\""+responseHeader.getUrl().replace("\\","/")+"\"}";
					else
						jsonString = "{\"err\":\" "+responseHeader.getResponseHeader().getResponseMessage()+"\"}";
				//	jsonString = "{\"err\":\" "+responseHeader.getResponseMessage()+"\"}";
				}    
				
			response.setContentType("application/json");
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
	
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to save the details of a skuMaster from excel file
	 *
	 **/
	/*@RequestMapping(value="/importtaxMasterData",method=RequestMethod.POST)
	public void importtaxMasterData(@RequestParam("file") MultipartFile excelFile,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("importtaxMasterData");
			// log.info(excelFile.getSize());
			
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			ResponseHeader responseHeader = dataManagementServiceObj.importtaxMasterData(customerId, emailId, excelFile);
			String jsonString = null;
				if(responseHeader.getResponseCode().equals("0"))
					jsonString = "{\"msg\":\" "+responseHeader.getResponseMessage()+"\"}";
				else if(responseHeader.getResponseCode().equals("-1"))
					jsonString = "{\"err\":\" "+responseHeader.getResponseMessage()+"\"}";
				
				
				
			response.setContentType("application/json");
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
	*/
	
	@RequestMapping(value="/importtaxMasterData",method=RequestMethod.POST)
	public void importtaxMasterData(@RequestParam("file") MultipartFile excelFile,HttpServletRequest request,HttpServletResponse response) {
		String jsonString = null;
		try{
			// log.info("importWarehouseSkuData");
			// log.info(excelFile.getSize());
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			Assement assementObj = dataManagementServiceObj.importtaxMasterData(customerId, emailId, excelFile);
			
				
			if(assementObj != null && assementObj.getResponseHeader() != null && assementObj.getResponseHeader().getResponseCode().equals("0"))
				jsonString = "{\"msg\":\" "+assementObj.getResponseHeader().getResponseMessage()+"\"}";
			else {
		//		jsonString = "{\"err\":\" "+assementObj.getResponseHeader().getResponseMessage()+"\" ,\"errorUrl\":\""+assementObj.getUrl().replace("\\","/")+"\"}";
			
			  if(assementObj.getUrl()!= null && !assementObj.getUrl().isEmpty()&&assementObj.getUrl()!=""){
				  jsonString = "{\"err\":\" "+assementObj.getResponseHeader().getResponseMessage()+"\" ,\"errorUrl\":\""+assementObj.getUrl().replace("\\","/")+"\"}";
			  }
			  else{
				try{ 
					jsonString = "{\"err\":\" "+assementObj.getResponseHeader().getResponseMessage()+"\"}";
				
				}
				  
				  catch(NullPointerException ne){
						jsonString = "{\"err\":\" "+ getResponseCode("SERVER_NOT_RESPONDING").trim()+"\"}";
						
					}
			  }
			}
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
	    	response.getWriter().write(jsonString);
		}
		
		catch(Exception e){
			e.printStackTrace();
		}finally {
	    	try {
				response.getWriter().close();
			} catch (IOException e) {
				e.printStackTrace();
			}
	    }
		
	}
	
	
	public static String getResponseCode(String constantName) {
		Properties properties = null;
		String constant = null;
		InputStream inputStream = null;
		try {
			properties = new Properties();
			inputStream = RestfulServiceConnection.class.getClassLoader().getResourceAsStream("commonResources.properties");
			properties.load(inputStream);
			constant = (String) properties.get(constantName);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try{
				properties.clear();
				inputStream.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return constant.trim();
	}
	
	/**
	 * 
	 * @author Mythri.S
	 * 
	 *This method is used to save the details of a skuMaster from excel file
	 *
	 **/
	@RequestMapping(value="/importbrandMasterData",method=RequestMethod.POST)
	public void importbrandMasterData(@RequestParam("file") MultipartFile excelFile,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("importsuppliersData");
			// log.info(excelFile.getSize());
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			Assement assObj = dataManagementServiceObj.importbrandMasterData(customerId, emailId, excelFile);
			String jsonString = null;
				/*if(responseHeader.getResponseCode().equals("0"))
					jsonString = "{\"msg\":\" "+responseHeader.getResponseMessage()+"\"}";
				else 
					jsonString = "{\"err\":\" "+responseHeader.getResponseMessage()+"\"}";
					*/
			
			if(assObj.getResponseHeader().getResponseCode().equals("0"))
				jsonString = "{\"msg\":\" "+assObj.getResponseHeader().getResponseMessage()+"\"}";
			else{
				if(assObj.getUrl() != null && !assObj.getUrl().equals("") && !assObj.getUrl().equals(null))
					jsonString = "{\"err\":\" "+assObj.getResponseHeader().getResponseMessage()+"\" ,\"errorUrl\":\""+assObj.getUrl().replace("\\","/")+"\"}";
				else
					jsonString = "{\"err\":\" "+assObj.getResponseHeader().getResponseMessage()+"\"}";
			//	jsonString = "{\"err\":\" "+responseHeader.getResponseMessage()+"\"}";
			}    
			response.setContentType("application/json");
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
	
	
	
	/**
	 * 
	 * @author Chaithanya.v
	 * 
	 *This method is used to save the details of a Employee Master from excel file
	 *
	 **/
	@RequestMapping(value="/importemployeeMasterData",method=RequestMethod.POST)
	public void importemployeeMasterData(@RequestParam("file") MultipartFile excelFile,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("importsuppliersData");
			// log.info(excelFile.getSize());
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			Assement responseHeader = dataManagementServiceObj.importemployeeMasterData(customerId, emailId, excelFile);
			System.out.println("ress :"+new Gson().toJson(responseHeader));
			String jsonString = null;
				/*if(responseHeader.getResponseCode().equals("0"))
					jsonString = "{\"msg\":\" "+responseHeader.getResponseMessage()+"\"}";
				else
					jsonString = "{\"err\":\" "+responseHeader.getResponseMessage()+"\"}";*/
			if(responseHeader.getResponseHeader().getResponseCode().equals("0"))
				jsonString = "{\"msg\":\" "+responseHeader.getResponseHeader().getResponseMessage()+"\"}";
			else{
				if(responseHeader.getUrl() != null && !responseHeader.getUrl().equals("") && !responseHeader.getUrl().equals(null))
					jsonString = "{\"err\":\" "+responseHeader.getResponseHeader().getResponseMessage()+"\" ,\"errorUrl\":\""+responseHeader.getUrl().replace("\\","/")+"\"}";
				else
					jsonString = "{\"err\":\" "+responseHeader.getResponseHeader().getResponseMessage()+"\"}";
			//	jsonString = "{\"err\":\" "+responseHeader.getResponseMessage()+"\"}";
			}    
			response.setContentType("application/json");
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
	
	
	
	/**
	 * 
	 * @author Chaithanya.v
	 * 
	 *This method is used to save the details of a Employee Master from excel file
	 *
	 **/
	@RequestMapping(value="/importgroupMasterData",method=RequestMethod.POST)
	public void importgroupMasterData(@RequestParam("file") MultipartFile excelFile,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("importsuppliersData");
			// log.info(excelFile.getSize());
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			Assement responseHeader = dataManagementServiceObj.importgroupMasterData(customerId, emailId, excelFile);
			String jsonString = null;
				/*if(responseHeader.getResponseCode().equals("0"))
					jsonString = "{\"msg\":\" "+responseHeader.getResponseMessage()+"\"}";
				else
					jsonString = "{\"err\":\" "+responseHeader.getResponseMessage()+"\"}";*/
			if(responseHeader.getResponseHeader().getResponseCode().equals("0"))
				jsonString = "{\"msg\":\" "+responseHeader.getResponseHeader().getResponseMessage()+"\"}";
			else{
				if(responseHeader.getUrl() != null && !responseHeader.getUrl().equals("") && !responseHeader.getUrl().equals(null))
					jsonString = "{\"err\":\" "+responseHeader.getResponseHeader().getResponseMessage()+"\" ,\"errorUrl\":\""+responseHeader.getUrl().replace("\\","/")+"\"}";
				else
					jsonString = "{\"err\":\" "+responseHeader.getResponseHeader().getResponseMessage()+"\"}";
			
			}    
			response.setContentType("application/json");
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
	/**
	 * 
	 * @author Sambaiah.y
	 * 
	 * This method is used to save the details of a stock receipt from excel file
	 *
	 **/
	@RequestMapping(value="/importStockReceiptData",method=RequestMethod.POST)
	public void importStockReceiptData(@RequestParam("file") MultipartFile excelFile,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("importSkuData");
			// log.info(excelFile.getSize());
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			String result = dataManagementServiceObj.importStockReceiptData(customerIdStr, emailIdStr, excelFile);
			String jsonString = null;
				if(result.contains("0"))
					jsonString = "{\"msg\":\" File Uploaded Successfully\"}";
				else if(result.contains("-1"))
					jsonString = "{\"err\":\" Sorry please try after some time\"}";
			response.setContentType("application/json");
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
	
	
	/**
	 * 
	 * @author Sambaiah.y
	 * 
	 * This method is used to save the details of a stock receipt from excel file
	 *
	 **/
	
	
/*	@RequestMapping(value="/createBackUp")
	public ModelAndView createBackUp(@RequestParam("type") String type,HttpServletRequest request,HttpServletResponse response) {
		
			int end=10,start= 1;
			modelAndViewObj = new ModelAndView();
			String result = dataManagementServiceObj.createbackup(type);
			BackupAndRecoveryResponse backupresponse = new BackupAndRecoveryResponse();
			backupresponse = dataManagementServiceObj.getbackup("0");
			if(backupresponse == null || backupresponse.getBackupList().size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(backupresponse.getBackupList().size()<Integer.parseInt("10")){
					end = (backupresponse.getBackupList().size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", backupresponse.getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			modelAndViewObj.addObject("result", result);
			modelAndViewObj.addObject("backupresponse", backupresponse);
			modelAndViewObj.setViewName("DataManagement/viewBackUp");
			return modelAndViewObj;
		
	}*/
	
	@RequestMapping(value="/createBackUp")
	public ModelAndView createBackUp(@RequestParam("type") String type,HttpServletRequest request,HttpServletResponse response) {
		try{
		int end=10,start= 1;
		modelAndViewObj = new ModelAndView();
		String result = dataManagementServiceObj.createbackup(type);
		BackupAndRecoveryResponse backupresponse = new BackupAndRecoveryResponse();
		backupresponse = dataManagementServiceObj.getbackup("0","","");
		if(backupresponse == null){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(backupresponse.getBackupAndrecovery()!=null && backupresponse.getBackupAndrecovery().size()<Integer.parseInt("10")){
				end = (backupresponse.getBackupAndrecovery().size())+(Integer.parseInt("0"));
			}else{
				end = (Integer.parseInt("0")+end);
			}
			modelAndViewObj.addObject("totalRecords", backupresponse.getTotalRecords());
			modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
			modelAndViewObj.addObject("totalValue", end);
		}
		
		if(result.contains("Success"))
		{
			modelAndViewObj.addObject("Success", result);
		}
		else{
			modelAndViewObj.addObject("Error", result);
		}
		
		modelAndViewObj.addObject("backupresponse", backupresponse);
		modelAndViewObj.setViewName("DataManagement/viewBackUp");
		
	}catch(Exception exception){
		exception.printStackTrace();
	}
		return modelAndViewObj;
}


	@RequestMapping("/viewBackUp")
	public ModelAndView viewBackUp(@RequestParam("index") String index,@RequestParam("backupDateStr") String backupDateStr,@RequestParam("backUpType") String backUpType, HttpServletRequest request,HttpServletResponse response){
		// log.info("viewBackUp");
		try{
		int end=10,start= 1;
		modelAndViewObj = new ModelAndView();
		
		BackupAndRecoveryResponse backupresponse = new BackupAndRecoveryResponse();
		backupresponse = dataManagementServiceObj.getbackup(index,backupDateStr,backUpType);
		if(backupresponse == null){
			modelAndViewObj.addObject("totalRecords","0");
			modelAndViewObj.addObject("index", "0");
			modelAndViewObj.addObject("totalValue", "0");
		}else{
			if(backupresponse != null && backupresponse.getBackupAndrecovery() != null && backupresponse.getBackupAndrecovery().size()<Integer.parseInt("10")){
				end = (backupresponse.getBackupAndrecovery().size())+(Integer.parseInt(index));
			}else{
				end = (Integer.parseInt(index)+end);
			}
			modelAndViewObj.addObject("totalRecords", backupresponse.getTotalRecords());
			modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
			modelAndViewObj.addObject("totalValue", end);
			
		}
		modelAndViewObj.addObject("backupresponse", backupresponse);
		modelAndViewObj.setViewName("DataManagement/viewBackUp");
		
	}catch(Exception exception){
		exception.printStackTrace();
	}
	
		return modelAndViewObj;
	}
	
	
	

	
	
	

	/**
	 * added on 30-dec
	 * @author kalyan
	 * 
	 * This method is used to save the details of a stock receipt from excel file
	 *
	 **/
	@RequestMapping(value="/importPriceListData",method=RequestMethod.POST)
	public void importPriceListData(@RequestParam("file") MultipartFile excelFile,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("importSkuData");
			// log.info(excelFile.getSize());
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			ResponseHeader responseHeader = dataManagementServiceObj.importPriceListData(customerIdStr, emailIdStr, excelFile);
			String jsonString = null;
				if(responseHeader.getResponseCode().equals("0"))
					jsonString = "{\"msg\":\" "+responseHeader.getResponseMessage()+"\"}";
				else if(responseHeader.getResponseCode().equals("-1"))
					jsonString = "{\"err\":\" "+responseHeader.getResponseMessage()+"\"}";
			response.setContentType("application/json");
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
	
	/**
	 * added on 30-dec
	 * @author kalyan
	 * 
	 * This method is used to save the details of a stock receipt from excel file
	 *
	 **/
	@RequestMapping(value="/batchOperations",method=RequestMethod.POST)
	public ModelAndView batchOperations(@RequestBody BatchOperations batchoperations,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("batchOperations");
			String resultStr = dataManagementServiceObj.batchOperations(batchoperations);
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("NEWARRIVAL_GROUP_UPDATE_SUCCESS").trim())){
				modelAndViewObj.addObject("Error", resultStr);
				modelAndViewObj.setViewName("DataManagement/batchOperations");
			}else{
				modelAndViewObj.addObject("success", resultStr);
				modelAndViewObj.setViewName("DataManagement/batchOperations");
			}
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	
	/**
	 * 
	 * @author Chaithanya.v
	 * 
	 *This method is used to save the details of a SkuMAaster Master to excel file
	 *
	 **/
	@RequestMapping(value="/exportSkuMaster")
	public void exportSkuMaster(@RequestParam("fileType") String fileType ,@RequestParam("location") String location ,@RequestParam("startdate") String startDate ,@RequestParam("enddate") String endDate ,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("exportSkuMaster");
		
//			////////System.out.println(excelFile.getOriginalFilename());
		    String result = dataManagementServiceObj.exportSkuMaster(startDate, endDate, fileType,location);
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
	 * @author Chaithanya.v
	 * 
	 *This method is used to save the details of a bills& bill items from excel file
	 *
	 **/
	@RequestMapping(value="/exportBills")
	public void exportBills(@RequestParam("ftpserver") String server,@RequestParam("loginid") String loginid,@RequestParam("password") String password,@RequestParam("port") String port,@RequestParam("isFtpUploadRequired") boolean isFtpUploadRequired,@RequestParam("type") String type,@RequestParam("status") String status ,@RequestParam("startdate") String startDate ,@RequestParam("enddate") String endDate ,@RequestParam("location") String location,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("exportBills");
		
//			////////System.out.println(excelFile.getOriginalFilename());
		    String result = dataManagementServiceObj.exportBills(startDate, endDate, status,location,type,isFtpUploadRequired,server,port,loginid,password);
			String jsonString = null;
				if(result.contains("0"))
					jsonString = "{\"msg\":\" File Exported Successfully\"}";
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
@RequestMapping(value="/exportBillsSapOnline")
	public void exportBillsSapOnline(@RequestParam("startdate") String startDate ,@RequestParam("enddate") String endDate ,
			@RequestParam("location") String location,@RequestParam("status") String status,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("exportBills");
		
//			////////System.out.println(excelFile.getOriginalFilename());
		    String result = dataManagementServiceObj.exportBillsSapOnline(status,startDate,endDate,location);
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
	

@RequestMapping(value="/exportBillsSapIdocs")
public void exportBillsSapIdocs(@RequestParam("startdate") String startDate ,@RequestParam("enddate") String endDate ,@RequestParam("status") String status,
		@RequestParam("location") String location,HttpServletRequest request,HttpServletResponse response) {
	try{
		// log.info("exportBills");
	
//		////////System.out.println(excelFile.getOriginalFilename());
	    String result = dataManagementServiceObj.exportBillsSapIdocs(status,startDate,endDate,location);
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
	 * @author Chaithanya.v
	 * 
	 *This method is used to save the details of a bills& bill items from excel file
	 *
	 **/
	@RequestMapping(value="/exportMasterData")
	public void exportMasterData(@RequestParam("status") String status ,@RequestParam("startDate") String startDate ,@RequestParam("enddate") String endDate, HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("exportBills");
		
//			////////System.out.println(excelFile.getOriginalFilename());
		    String result = dataManagementServiceObj.exportMasterData(startDate, endDate, status);
			String jsonString = null;
				if(result.contains("0"))
					jsonString = "{\"msg\":\" File Uploaded Successfully\"}";
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
	 * @author Chaithanya.v
	 * 
	 *This method is used to export the details of a exportStockReceipts from excel file
	 *
	 **/
	@RequestMapping(value="/exportStockReceipts")
	public void exportStockReceipts(@RequestParam("location") String location ,@RequestParam("startDate") String startdate ,@RequestParam("enddate") String endDate ,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("exportStockReceipts");
		    String result = dataManagementServiceObj.exportStockReceipts(startdate, endDate, location);
			String jsonString = null;
				if(result.contains("0"))
					jsonString = "{\"msg\":\" File Uploaded Successfully\"}";
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
	 * @author Chaithanya.v
	 * 
	 *This method is used to export the details of a exportStockReceipts from excel file
	 *
	 **/
	@RequestMapping(value="/exportStockRequest")
	public void exportStockRequest(@RequestParam("location") String location ,@RequestParam("startDate") String startdate ,@RequestParam("enddate") String endDate ,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("exportStockReceipts");
		    String result = dataManagementServiceObj.exportStockRequest(startdate, endDate, location);
			String jsonString = null;
				if(result.contains("0"))
					jsonString = "{\"msg\":\" File Uploaded Successfully\"}";
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
	 * @author Chaithanya.v
	 * 
	 *This method is used to export the details of a exportStockReceipts from excel file
	 *
	 **/
	@RequestMapping(value="/exportStockReturn")
	public void exportStockReturn(@RequestParam("location") String location ,@RequestParam("startDate") String startdate ,@RequestParam("enddate") String endDate ,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("exportStockReceipts");
		    String result = dataManagementServiceObj.exportStockReturn(startdate, endDate, location);
			String jsonString = null;
				if(result.contains("0"))
					jsonString = "{\"msg\":\" File Uploaded Successfully\"}";
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
	 * @author Chaithanya.v
	 * 
	 *This method is used to export the details of a exportStockReceipts from excel file
	 *
	 **/
	@RequestMapping(value="/exportStockIssue")
	public void exportStockIssue(@RequestParam("location") String location ,@RequestParam("startDate") String startdate ,@RequestParam("enddate") String endDate ,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("exportStockReceipts");
		    String result = dataManagementServiceObj.exportStockIssue(startdate, endDate, location);
			String jsonString = null;
				if(result.contains("0"))
					jsonString = "{\"msg\":\" File Uploaded Successfully\"}";
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
	 * added on 26-aug
	 * @author chaithanya
	 * 
	 * This method is used to save the details of a stock receipt from excel file
	 *
	 **/
	@RequestMapping(value="/importskuEansData",method=RequestMethod.POST)
	public void importskuEansData(@RequestParam("file") MultipartFile excelFile,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("skuEans");
			// log.info(excelFile.getSize());
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			Assement responseHeader = dataManagementServiceObj.importskuEansData(customerIdStr, emailIdStr, excelFile);
			String jsonString = null;
				try{
					if(responseHeader.getResponseHeader().getResponseCode().equals("0"))
				
					jsonString = "{\"msg\":\" "+responseHeader.getResponseHeader().getResponseMessage()+"\"}";
				else if(responseHeader.getResponseHeader().getResponseCode().equals("-1"))							
					jsonString = "{\"err\":\" "+responseHeader.getResponseHeader().getResponseMessage()+"\"}";
				}catch(NullPointerException ne){
					jsonString = "{\"err\":\" "+ getResponseCode("SERVER_NOT_RESPONDING").trim()+"\"}";
					
				}
			response.setContentType("application/json");
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

	
	/**
	 * added on 26-aug
	 * @author chaithanya
	 * 
	 * This method is used to save the details of a stock receipt from excel file
	 *
	 **/
	@RequestMapping(value="/importbillsData",method=RequestMethod.POST)
	public void importbillsData(@RequestParam("file") MultipartFile excelFile,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("skuEans");
			// log.info(excelFile.getSize());
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			ResponseHeader responseHeader = dataManagementServiceObj.importbillsData(customerIdStr, emailIdStr, excelFile);
			String jsonString = null;
				if(responseHeader.getResponseCode().equals("0"))
					jsonString = "{\"msg\":\" "+responseHeader.getResponseMessage()+"\"}";
				else if(responseHeader.getResponseCode().equals("-1"))
					jsonString = "{\"err\":\" "+responseHeader.getResponseMessage()+"\"}";
			response.setContentType("application/json");
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


/**
	 * @author Chaithanya.v
	 * @param request
	 * @param response
	 * @return returns a jsp which displays all the icons of outlet management flow
	 */
	@RequestMapping("/viewExportFlow")
	public ModelAndView viewExportFlow(HttpServletRequest request,HttpServletResponse response){
		// log.info("viewExportFlow");
		modelAndViewObj = new ModelAndView();
		List<String> workLocationsList = adminServiceObj.getLocationsList("","",null);
		modelAndViewObj.addObject("workLocationsList", workLocationsList);
		modelAndViewObj.setViewName("DataManagement/exportFlow");
		return modelAndViewObj;
	}
	/**
	 * @author vamsi.v
	 * @param request
	 * @param response
	 * @return returns a jsp which displays all the icons of outlet management flow
	 * @modified by vijay splitted single jsp to multiples
	 */
	@RequestMapping("/viewExportdetails")
	public ModelAndView viewExportdetails(@RequestParam("flow") String flow,HttpServletRequest request,HttpServletResponse response){
		try
		{
			// log.info("viewExportdetails");

			String maxRecords = "10";
			int start = 1,end = 10;
			String index="0";
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			List<String> workLocationsList = new ArrayList<String>();
			ArrayList<LocationBean> locationBeanList = new ArrayList<LocationBean>();
			List<LocationBean> locationsList = new ArrayList<LocationBean>();
			modelAndViewObj.addObject("flow", flow);


			BatchOperationsResponse  batchOperationsResponse = dataManagementServiceObj.getPackages("", "","-1","","");
//			////////System.out.println(batchOperationsResponse);
			modelAndViewObj.addObject("batchOperationsResponse",batchOperationsResponse.getBatchOperationsList());

			if(batchOperationsResponse == null || batchOperationsResponse.getBatchOperationsList()==null || batchOperationsResponse.getBatchOperationsList().size()==0)
			{
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(batchOperationsResponse.getBatchOperationsList().size()<Integer.parseInt(maxRecords)){
					end = (batchOperationsResponse.getBatchOperationsList().size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", batchOperationsResponse.getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("maxRecords", Integer.parseInt(maxRecords));
				modelAndViewObj.addObject("totalValue", end);
			}
			if(flow.equalsIgnoreCase("generic"))
			{
				modelAndViewObj.setViewName("DataManagement/exportMasterData");
				//workLocationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,null);
			 locationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
			 //System.out.println("generic Locs ::"+new Gson().toJson(locationBeanList));
			}	
			else if(flow.equalsIgnoreCase("outlet"))
			{
				modelAndViewObj.setViewName("DataManagement/exportOutletData");
				//workLocationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,"Retail Outlet");
				ArrayList<LocationBean> allLocationBeanList = genericMasterServiceObj.getLocationDetails("",customerIdStr,emailIdStr,"-1","",false,false,false);
				//System.out.println("Locs ::"+new Gson().toJson(allLocationBeanList));
				if(allLocationBeanList != null && allLocationBeanList.size()>0){
					 for(int i=0;i<allLocationBeanList.size();i++){
						 if(!allLocationBeanList.get(i).getBusinessActivity().isEmpty() && !allLocationBeanList.get(i).getBusinessActivity().equals("Warehouse")){
							 workLocationsList.add(allLocationBeanList.get(i).getLocationId());
						 }
					 }
				 }
				//System.out.println("outlet Locs ::"+new Gson().toJson(workLocationsList));
			}
			else
			{
				workLocationsList = adminServiceObj.getLocationsList(customerIdStr,emailIdStr,"Warehouse");
				modelAndViewObj.setViewName("DataManagement/exportWarehouseData");
				//System.out.println("warehouse Locs ::"+new Gson().toJson(workLocationsList));

			}
			
			if(!(flow.equalsIgnoreCase("generic")) && locationsList.size() >0 )
			{
				for( LocationBean location :locationsList)
					workLocationsList.add(location.getLocationId());
				
			}
			modelAndViewObj.addObject("workLocationsList", workLocationsList);
			modelAndViewObj.addObject("locationBeanList", locationBeanList);



		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	/**
	 * added on 18-may-17
	 * @author Manasa.P
	 * 
	 * This method is used to create the package
	 *
	 **/
	@RequestMapping(value="/createImportPackage",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createImportPackage(@RequestBody BatchOperations batchoperations,HttpServletRequest request,HttpServletResponse response) {
		try{
			// log.info("createPackage");
			//////////System.out.println("createPackage");
			String resultStr = dataManagementServiceObj.batchOperations(batchoperations);
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("PACKAGE_CREATE_SUCCESS").trim())){
			//////////System.out.println("error");
				modelAndViewObj.addObject("err", resultStr);
				modelAndViewObj.setViewName("DataManagement/importData");
			}else{
				modelAndViewObj.addObject("success", resultStr);
				modelAndViewObj.setViewName("DataManagement/importData");
			}
		
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}
	
	/**
	 * @author Vijay
	 * @CreatedDate 15-nov-18
	 * 
	 * @Desc This method is used to Import Data
	 **/
	
	@RequestMapping(value="/customerImportData",method=RequestMethod.POST)
	public void   customerImportData(
			@RequestParam("file") MultipartFile excelFile,
			
			HttpServletRequest request,HttpServletResponse response) 
	{
		String jsonString = "";
		MasterDataImportsAndExportsBean masterDataImportsAndExportsBean=null;
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		try{
			RestfulServiceConnection restfulServiceConnection=new RestfulServiceConnection();
			masterDataImportsAndExportsBean = restfulServiceConnection.uploadFile(customerId, excelFile);
			MasterDataImportsAndExportsBean responseObj = dataManagementServiceObj.uploadData(masterDataImportsAndExportsBean.getFileName(),"customerImport", customerId, emailId);
			
			try{
				if(responseObj.getResponseHeader().getResponseCode().equals("0"))
					jsonString = "{\"msg\":\" "+responseObj.getResponseHeader().getResponseMessage()+"\"}";
				else 
					jsonString = "{\"msg\":\" "+responseObj.getResponseHeader().getResponseMessage()+"\" ,\"errorUrl\":\""+responseObj.getUrl()+"\"}";
			}catch(NullPointerException ne){
				jsonString = "{\"msg\":\" "+ getResponseCode("SERVER_NOT_RESPONDING").trim()+"\"}";
				
			}
			//////////System.out.println(responseObj.getUrl());
			
			/* }
		else
			jsonString = "{\"err\":\" "+status+"\"}";*/
		
		response.setContentType("application/json");
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
	
	
	
	/**
	 * @author Vijay
	 * @CreatedDate 15-nov-18
	 * 
	 * @Desc This method is used to Import Data
	 **/
	
	@RequestMapping(value="/couponsData",method=RequestMethod.POST)
	public void   couponsImportData(
			@RequestParam("file") MultipartFile excelFile,
			HttpServletRequest request,HttpServletResponse response) 
	{
		String jsonString = "";
		MasterDataImportsAndExportsBean masterDataImportsAndExportsBean=null;
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		try{
			RestfulServiceConnection restfulServiceConnection=new RestfulServiceConnection();
			masterDataImportsAndExportsBean = restfulServiceConnection.uploadFile(customerId, excelFile);
			MasterDataImportsAndExportsBean responseObj = dataManagementServiceObj.uploadData(masterDataImportsAndExportsBean.getFileName(),"coupons", customerId, emailId);
			if(responseObj.getResponseHeader().getResponseCode().equals("0"))
				jsonString = "{\"msg\":\" "+responseObj.getResponseHeader().getResponseMessage()+"\"}";
			else 
				if(responseObj.getUrl()==null||responseObj.getUrl().isEmpty())
					jsonString = "{\"msg\":\" "+responseObj.getResponseHeader().getResponseMessage()+"\"}";
				else
				jsonString = "{\"msg\":\" "+responseObj.getResponseHeader().getResponseMessage()+"\",\"url\":\" "+responseObj.getUrl().replace("\\", "\\\\")+"\"}";
				//jsonString = "{\"err\":\" "+responseObj.getResponseHeader().getResponseMessage()+"\" ,\"errorUrl\":\""+responseObj.getUrl()+"\"}";
		/* }
		else
			jsonString = "{\"err\":\" "+status+"\"}";*/
		
			response.setContentType("application/json");
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
	
	

	/**
	 * @author Vijay
	 * @CreatedDate 15-nov-18
	 * 
	 * @Desc This method is used to Import Data
	 **/
	
	@RequestMapping(value="/giftVouchersData",method=RequestMethod.POST)
	public void   giftVouchersImportData(
			@RequestParam("file") MultipartFile excelFile,
			HttpServletRequest request,HttpServletResponse response) 
	{
		String jsonString = "";
		MasterDataImportsAndExportsBean masterDataImportsAndExportsBean=null;
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		try{
			RestfulServiceConnection restfulServiceConnection=new RestfulServiceConnection();
			masterDataImportsAndExportsBean = restfulServiceConnection.uploadFile(customerId, excelFile);
			MasterDataImportsAndExportsBean responseObj = dataManagementServiceObj.uploadData(masterDataImportsAndExportsBean.getFileName(),"giftVouchers", customerId, emailId);
			if(responseObj.getResponseHeader().getResponseCode().equals("0"))
				jsonString = "{\"msg\":\" "+responseObj.getResponseHeader().getResponseMessage()+"\"}";
			else 
				jsonString = "{\"msg\":\" "+responseObj.getResponseHeader().getResponseMessage()+"\" ,\"errorUrl\":\""+responseObj.getUrl()+"\"}";
		/* }
		else
			jsonString = "{\"err\":\" "+status+"\"}";*/
		
			response.setContentType("application/json");
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


	/**
	 * @author Vijay
	 * @CreatedDate 15-nov-18
	 * 
	 * @Desc This method is used to Import Data
	 **/
	
	/*@RequestMapping(value="/loaltyCardsData",method=RequestMethod.POST)
	public void   loyaltyCardsImportData(
			@RequestParam("file") MultipartFile excelFile,
			HttpServletRequest request,HttpServletResponse response) 
	{
		String jsonString = "";
		MasterDataImportsAndExportsBean masterDataImportsAndExportsBean=null;
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		try{
			RestfulServiceConnection restfulServiceConnection=new RestfulServiceConnection();
			masterDataImportsAndExportsBean = restfulServiceConnection.uploadFile(customerId, excelFile);
			MasterDataImportsAndExportsBean responseObj = dataManagementServiceObj.uploadData(masterDataImportsAndExportsBean.getFileName(),"loyaltyCards", customerId, emailId);
			if(responseObj.getResponseHeader().getResponseCode().equals("0"))
				jsonString = "{\"msg\":\" "+responseObj.getResponseHeader().getResponseMessage()+"\"}";
			else 
				jsonString = "{\"err\":\" "+responseObj.getResponseHeader().getResponseMessage()+"\" ,\"errorUrl\":\""+responseObj.getUrl()+"\"}";
		 }
		else
			jsonString = "{\"err\":\" "+status+"\"}";
		
			response.setContentType("application/json");
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
	}*/

	
	
	@RequestMapping(value="/loaltyCardsData",method=RequestMethod.POST)
	public void   loyaltyCardsImportData(
			@RequestParam("file") MultipartFile excelFile,
			HttpServletRequest request,HttpServletResponse response) 
	{
		String jsonString = "";
		MasterDataImportsAndExportsBean masterDataImportsAndExportsBean=null;
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		try{
			RestfulServiceConnection restfulServiceConnection=new RestfulServiceConnection();
			masterDataImportsAndExportsBean = restfulServiceConnection.uploadFile(customerId, excelFile);
			MasterDataImportsAndExportsBean responseObj = dataManagementServiceObj.uploadData(masterDataImportsAndExportsBean.getFileName(),"loyaltyCards", customerId, emailId);
			
		try{	
			if(responseObj.getResponseHeader().getResponseCode().equals("0"))
				jsonString = "{\"msg\":\" "+responseObj.getResponseHeader().getResponseMessage()+"\"}";
			
			else {
				if(responseObj.getUrl()!= null){
					jsonString = "{\"err\":\" "+responseObj.getResponseHeader().getResponseMessage()+"\" ,\"errorUrl\":\""+responseObj.getUrl().replace("\\", "/")+"\"}";
				}else{
					jsonString = "{\"err\":\" "+responseObj.getResponseHeader().getResponseMessage()+"\"}";
				}
			}
		}catch(NullPointerException ne){
			jsonString = "{\"err\":\" "+ getResponseCode("SERVER_NOT_RESPONDING").trim()+"\"}";
			
		}
			/* }
		else
			jsonString = "{\"err\":\" "+status+"\"}";*/
		
			response.setContentType("application/json");
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

	
	
	
	
	
	
	/**
	 * @author koti bommineni
	 * @CreatedDate 20-03-2020
	 * 
	 * @Desc This method is used to Import Data
	 **/
	
	@RequestMapping(value="/walletsImportData",method=RequestMethod.POST)
	public void   walletsImportData(
			@RequestParam("file") MultipartFile excelFile,
			HttpServletRequest request,HttpServletResponse response) 
	{
		String jsonString = "";
		MasterDataImportsAndExportsBean masterDataImportsAndExportsBean=null;
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		try{
			RestfulServiceConnection restfulServiceConnection=new RestfulServiceConnection();
			masterDataImportsAndExportsBean = restfulServiceConnection.uploadFile(customerId, excelFile);
			/*MasterDataImportsAndExportsBean responseObj = dataManagementServiceObj.uploadData(masterDataImportsAndExportsBean.getFileName(),"wallets", customerId, emailId);
			if(responseObj.getResponseHeader().getResponseCode().equals("0"))
				jsonString = "{\"msg\":\" "+responseObj.getResponseHeader().getResponseMessage()+"\"}";
			else 
				jsonString = "{\"err\":\" "+responseObj.getResponseHeader().getResponseMessage()+"\" ,\"errorUrl\":\""+responseObj.getUrl()+"\"}";*/
		/* }
		else
			jsonString = "{\"err\":\" "+status+"\"}";*/
			
			jsonString = "{\"msg\":\" "+masterDataImportsAndExportsBean.getFileName()+"\"}";
			response.setContentType("application/json");
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
	
	
	/**
	 * @author koti bommineni
	 * @CreatedDate 20-03-2020
	 * 
	 * @Desc This method is used to Import Data
	 **/
	
	@RequestMapping(value="/membershipImportData",method=RequestMethod.POST)
	public void   membershipImportData(
			@RequestParam("file") MultipartFile excelFile,
			HttpServletRequest request,HttpServletResponse response) 
	{
		String jsonString = "";
		MasterDataImportsAndExportsBean masterDataImportsAndExportsBean=null;
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		try{
			RestfulServiceConnection restfulServiceConnection=new RestfulServiceConnection();
			masterDataImportsAndExportsBean = restfulServiceConnection.uploadFile(customerId, excelFile);
			Gson gson = new Gson();
			//////System.out.println("data in json:::"+gson.toJson(masterDataImportsAndExportsBean));
			//MasterDataImportsAndExportsBean responseObj = dataManagementServiceObj.uploadData(masterDataImportsAndExportsBean.getFileName(),"memberships", customerId, emailId);
			if(masterDataImportsAndExportsBean.getResponseHeader().getResponseCode().equals("0")){
				if(masterDataImportsAndExportsBean.getFileName().equals("Membership.xlsx")){
					
					jsonString = "{\"msg\":\" "+"Imported Successfully"+"\"}";
				}
				else {
					jsonString = "{\"err\":\" "+"Please Rename File as 'Membership.xlsx'"+"\"}";
				}
			}else{
				jsonString = "{\"err\":\" "+"Error,Please try again"+"\"}";
			}
		/* }
		else
			jsonString = "{\"err\":\" "+status+"\"}";*/
		
			response.setContentType("application/json");
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
	
	
	
	
	@RequestMapping(value="/promotionData",method=RequestMethod.POST)
	public void   promotionData(HttpServletRequest request,HttpServletResponse response) 
	{
		String jsonString = "";
		MasterDataImportsAndExportsBean masterDataImportsAndExportsBean=null;
		String customerId = (String)request.getSession().getAttribute("customerId");
		String emailId = (String)request.getSession().getAttribute("emailId");
		try{
			RestfulServiceConnection restfulServiceConnection=new RestfulServiceConnection();
		
			CounterResponse responseObj = dataManagementServiceObj.uploadDataforPromotion(customerId);
			if(responseObj != null && responseObj.getResponseHeader() != null && responseObj.getResponseHeader().getResponseCode().equals("0"))
				jsonString = "{\"msg\":\" "+responseObj.getResponseHeader().getResponseMessage()+"\"}";
			else 
				jsonString = "{\"err\":\" "+"Something Went Wrong please try again."+"\"}";
		/* }
		else
			jsonString = "{\"err\":\" "+status+"\"}";*/
		
		response.setContentType("application/json");
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

	
	@RequestMapping("/viewBatchOperationsFlow")
	public ModelAndView viewBatchOperationsFlow(@RequestParam("index") String index,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchCriteria") String searchCriteria,HttpServletRequest request,HttpServletResponse response) {
		BatchOperationsResponse batchOperationsResponse = null;
    	try{
    		int start = 1,  end = Integer.parseInt(maxRecords);
    		String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			
			batchOperationsResponse = dataManagementServiceObj.getBatchOperations(customerId,emailId,index,maxRecords,searchCriteria);
			modelAndViewObj = new ModelAndView();
			if(batchOperationsResponse.getBatchOperationsList() == null || batchOperationsResponse.getBatchOperationsList().size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(batchOperationsResponse.getBatchOperationsList().size()<Integer.parseInt("10")){
					end = (batchOperationsResponse.getBatchOperationsList().size())+(Integer.parseInt(index));
				}else{
					end = (Integer.parseInt(index)+end);
				}
				modelAndViewObj.addObject("totalRecords", batchOperationsResponse.getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt(index)+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			
			modelAndViewObj.addObject("batchOperationsList", batchOperationsResponse.getBatchOperationsList());
    		modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName", searchCriteria);
			if(!batchOperationsResponse.getResponseHeader().getResponseCode().equals("0")){
			modelAndViewObj.addObject("err", batchOperationsResponse.getResponseHeader().getResponseMessage());
			}
    		modelAndViewObj.setViewName("DataManagement/batchOperationsSummary");
    	}catch(Exception e){
    	  e.printStackTrace();	
    	}
    	return modelAndViewObj;
	}





@RequestMapping("/viewNewBatchOperation")
	public ModelAndView viewNewBatchOperation(HttpServletRequest request,HttpServletResponse response){
		// log.info("viewExportFlow");
	try {
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		modelAndViewObj = new ModelAndView();
		List<Role> roleList = roleServiceObj.getRoleDetails(null,customerIdStr,emailIdStr,"-1","10","");
		modelAndViewObj.addObject("roleList", roleList);
		modelAndViewObj.setViewName("DataManagement/newbatchOperations");
	}catch(Exception e){
  	  e.printStackTrace();	
  	}
	
	return modelAndViewObj;
	}
	
	
	/**
	 * 
	 * @author Mk
	 * 
	 *This method is used to save the Batch details 
	 *
	 **/
	@RequestMapping(value="/createBatch",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView createBatch(@RequestBody BatchOperations batchOperationsObj,HttpServletRequest request,HttpServletResponse response){
		try{
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			modelAndViewObj = new ModelAndView();
			
			String resultStr = dataManagementServiceObj.createBatch(batchOperationsObj,customerIdStr,emailIdStr);
			
			List<Role> roleList = roleServiceObj.getRoleDetails(null,customerIdStr,emailIdStr,"-1","10","");
			modelAndViewObj.addObject("roleList", roleList);
			
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("BATCH_CREATE_SUCCESS").trim())){
				modelAndViewObj.addObject("err", resultStr);
				modelAndViewObj.setViewName("DataManagement/newbatchOperations");
			}else{
				modelAndViewObj.addObject("success", resultStr);
				modelAndViewObj.setViewName("DataManagement/newbatchOperations");
			}
			
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
		}
	/**
	 * 
	 * @author Mk
	 * 
	 *This method is used to save the Batch details 
	 *
	 **/
	@RequestMapping(value="/updateBatch",method=RequestMethod.POST,consumes="application/json")
	public ModelAndView updateBatch(@RequestBody BatchOperations batchOperationsObj,HttpServletRequest request,HttpServletResponse response){
		try{
			BatchOperationsResponse	batchOperationResponse = new BatchOperationsResponse();
			String customerIdStr = (String)request.getSession().getAttribute("customerId");
			String emailIdStr = (String)request.getSession().getAttribute("emailId");
			
			String resultStr = dataManagementServiceObj.updateBatch(batchOperationsObj,customerIdStr,emailIdStr);
			/*batchOperationResponse=dataManagementServiceObj.getBatchOperationDetails(customerIdStr,emailIdStr,batchId);
			if(batchOperationResponse.getBatchOperations() != null){
				modelAndViewObj.addObject("batchOperationList",batchOperationResponse.getBatchOperations());
			}*/
			
			modelAndViewObj = new ModelAndView();
			List<Role> roleList = roleServiceObj.getRoleDetails(null,customerIdStr,emailIdStr,"-1","10","");
			modelAndViewObj.addObject("roleList", roleList);
			
			 batchOperationResponse=dataManagementServiceObj.getBatchOperationDetails(customerIdStr,emailIdStr,batchOperationsObj.getBatch_id());
             if(batchOperationResponse.getBatchOperations().getBatchHistoryList() != null){
                     modelAndViewObj.addObject("batchOperationList",batchOperationResponse.getBatchOperations());
             }
             if(batchOperationResponse.getBatchOperations().getBatchHistoryList() !=null){
                     modelAndViewObj.addObject("batchhistorylist",batchOperationResponse.getBatchOperations().getBatchHistoryList());
             }
             
			if(!resultStr.equals(AppProperties.getAppMessageByProperty("BATCH_UPDATE_SUCCESS").trim())){
				modelAndViewObj.addObject("err", resultStr);
				modelAndViewObj.setViewName("DataManagement/editbatchOperations");
			}else{
				modelAndViewObj.addObject("success", resultStr);
				modelAndViewObj.setViewName("DataManagement/editbatchOperations");
			}
			
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
		}
	
	
	
	
	

	
/*	@RequestMapping(value="/run",method=RequestMethod.POST,consumes="application/json")
    public ModelAndView run(@RequestBody BatchOperations batchOperationsObj,HttpServletRequest request,HttpServletResponse response){
            try{
                    BatchOperationsResponse        batchOperationResponse = new BatchOperationsResponse();
                    String customerIdStr = (String)request.getSession().getAttribute("customerId");
                    String emailIdStr = (String)request.getSession().getAttribute("emailId");
                    modelAndViewObj = new ModelAndView();
                    String resultStr = dataManagementServiceObj.run(batchOperationsObj,customerIdStr,emailIdStr);
                    
                    batchOperationResponse=dataManagementServiceObj.getBatchOperationDetails(customerIdStr,emailIdStr,batchOperationsObj.getBatch_id());
                    if(batchOperationResponse.getBatchOperations().getBatchHistoryList() != null){
                            modelAndViewObj.addObject("batchOperationList",batchOperationResponse.getBatchOperations());
                    }
                    if(batchOperationResponse.getBatchOperations().getBatchHistoryList() !=null){
                            modelAndViewObj.addObject("batchhistorylist",batchOperationResponse.getBatchOperations().getBatchHistoryList());
                    }
                    
                    if(!resultStr.equals("Success")){
                            modelAndViewObj.addObject("err", resultStr);
                            modelAndViewObj.setViewName("DataManagement/editbatchOperations");
                    }else{
                            modelAndViewObj.addObject("success", "Batch history updated successfully.");
                            modelAndViewObj.setViewName("DataManagement/editbatchOperations");
                    }
            }catch(Exception exception){
                    exception.printStackTrace();
            }
            return modelAndViewObj;
            }
*/

	
	/*@RequestMapping(value="/run",method=RequestMethod.POST,consumes="application/json")
    public ModelAndView run(@RequestBody BatchOperations batchOperationsObj,HttpServletRequest request,HttpServletResponse response){
            try{
                    BatchOperationsResponse batchOperationResponse = new BatchOperationsResponse();
                    String customerIdStr = (String)request.getSession().getAttribute("customerId");
                    String emailIdStr = (String)request.getSession().getAttribute("emailId");
                    modelAndViewObj = new ModelAndView();
                    String result = dataManagementServiceObj.run(batchOperationsObj,customerIdStr,emailIdStr);
                    
                    batchOperationResponse=dataManagementServiceObj.getBatchOperationDetails(customerIdStr,emailIdStr,batchOperationsObj.getBatch_id());
                    if(batchOperationResponse.getBatchOperations().getBatchHistoryList() != null){
                            modelAndViewObj.addObject("batchOperationList",batchOperationResponse.getBatchOperations());
                    }
                    if(batchOperationResponse.getBatchOperations().getBatchHistoryList() !=null){
                            modelAndViewObj.addObject("batchhistorylist",batchOperationResponse.getBatchOperations().getBatchHistoryList());
                    }
                    
                    if(!resultStr.equals("Success")){
                            modelAndViewObj.addObject("err", resultStr);
                          //  modelAndViewObj.setViewName("DataManagement/editbatchOperations");
                    }else{
                            modelAndViewObj.addObject("success", "Batch history updated successfully.");
                           
                    }
                    
                    if(result.contains("Success"))
        			{
        				modelAndViewObj.addObject("Success", result);
        			}
        			else{
        				modelAndViewObj.addObject("Error", result);
        			}
                    
                   modelAndViewObj.setViewName("DataManagement/editbatchOperations");
                  
            }catch(Exception exception){
                    exception.printStackTrace();
            }
            return modelAndViewObj;
            }*/
	
	
	
	@RequestMapping(value="/run",method=RequestMethod.POST,consumes="application/json")
    public ModelAndView run(@RequestBody BatchOperations batchOperationsObj,HttpServletRequest request,HttpServletResponse response){
            try{
                    BatchOperationsResponse batchOperationResponse = new BatchOperationsResponse();
                    String customerIdStr = (String)request.getSession().getAttribute("customerId");
                    String emailIdStr = (String)request.getSession().getAttribute("emailId");
                    modelAndViewObj = new ModelAndView();
                    String result = dataManagementServiceObj.run(batchOperationsObj,customerIdStr,emailIdStr);
                    
                    batchOperationResponse=dataManagementServiceObj.getBatchOperationDetails(customerIdStr,emailIdStr,batchOperationsObj.getBatch_id());
                    if(batchOperationResponse.getBatchOperations().getBatchHistoryList() != null){
                            modelAndViewObj.addObject("batchOperationList",batchOperationResponse.getBatchOperations());
                    }
                    if(batchOperationResponse.getBatchOperations().getBatchHistoryList() !=null){
                            modelAndViewObj.addObject("batchhistorylist",batchOperationResponse.getBatchOperations().getBatchHistoryList());
                    }
                    
                 
                    
                    if(result.contains("Success"))
        			{
        				modelAndViewObj.addObject("Success", result);
        			}
        			else{
        				modelAndViewObj.addObject("Error", result);
        			}
                    
                   modelAndViewObj.setViewName("DataManagement/editbatchOperations");
                  
            }catch(Exception exception){
                    exception.printStackTrace();
            }
            return modelAndViewObj;
            }
	
	
	
	
	/**
	 * 
	 * @author Mk
	 * 
	 *This method is used to view the Batch details 
	 *
	 **/
	@RequestMapping("/viewEditBatchOperation")
	public ModelAndView viewEditBatchOperation(HttpServletRequest request,HttpServletResponse response,@RequestParam("batchId") String batchId,@RequestParam("operation") String operation){
		modelAndViewObj = new ModelAndView();
		try {
		String customerIdStr = (String)request.getSession().getAttribute("customerId");
		String emailIdStr = (String)request.getSession().getAttribute("emailId");
		
		BatchOperationsResponse	batchOperationResponse = new BatchOperationsResponse();
		batchOperationResponse=dataManagementServiceObj.getBatchOperationDetails(customerIdStr,emailIdStr,batchId);
		if(batchOperationResponse.getBatchOperations().getBatchHistoryList() != null){
			modelAndViewObj.addObject("batchOperationList",batchOperationResponse.getBatchOperations());
		}
		if(batchOperationResponse.getBatchOperations().getBatchHistoryList() !=null){
			modelAndViewObj.addObject("batchhistorylist",batchOperationResponse.getBatchOperations().getBatchHistoryList());
		}
		
		List<Role> roleList = roleServiceObj.getRoleDetails(null,customerIdStr,emailIdStr,"-1","10","");
		modelAndViewObj.addObject("roleList", roleList);
		
		if(operation.equals("view"))
			modelAndViewObj.setViewName("DataManagement/viewbatchOperations");
		else
			modelAndViewObj.setViewName("DataManagement/editbatchOperations");
			
		
	} catch (Exception e){
		e.printStackTrace();
	}
	
	return modelAndViewObj;
	}
	
	
	/**
	 * 
	 * @author Mk
	 * 
	 *This method is used to delete the Batch details 
	 *
	 **/	
	@RequestMapping("/deleteBatchOperation")
	public ModelAndView deleteBatchOperation(@RequestParam("ids") String ids,@RequestParam("maxRecords") String maxRecords,@RequestParam("searchName") String searchName,HttpServletRequest request,HttpServletResponse response){
		BatchOperationsResponse batchOperationsResponse = null;
		try{
			int start = 1,end = Integer.parseInt(maxRecords);
			modelAndViewObj = new ModelAndView();
			String customerId = (String)request.getSession().getAttribute("customerId");
			String emailId = (String)request.getSession().getAttribute("emailId");
			String resultStr = dataManagementServiceObj.deleteBatchOperation(customerId, emailId, ids);
			
			batchOperationsResponse = dataManagementServiceObj.getBatchOperations(customerId,emailId,"0",maxRecords,"");
			modelAndViewObj = new ModelAndView();
			if(batchOperationsResponse.getBatchOperationsList() == null || batchOperationsResponse.getBatchOperationsList().size() == 0){
				modelAndViewObj.addObject("totalRecords","0");
				modelAndViewObj.addObject("index", "0");
				modelAndViewObj.addObject("totalValue", "0");
			}else{
				if(batchOperationsResponse.getBatchOperationsList().size()<Integer.parseInt("10")){
					end = (batchOperationsResponse.getBatchOperationsList().size())+(Integer.parseInt("0"));
				}else{
					end = (Integer.parseInt("0")+end);
				}
				modelAndViewObj.addObject("totalRecords", batchOperationsResponse.getTotalRecords());
				modelAndViewObj.addObject("index", (Integer.parseInt("0")+start));
				modelAndViewObj.addObject("totalValue", end);
			}
			
			modelAndViewObj.addObject("batchOperationsList", batchOperationsResponse.getBatchOperationsList());
			
			modelAndViewObj.addObject("err", resultStr);
			modelAndViewObj.addObject("maxRecords",maxRecords);
			modelAndViewObj.addObject("searchName",searchName);
			modelAndViewObj.setViewName("DataManagement/batchOperationsSummary");
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndViewObj;
	}

	
}
	

