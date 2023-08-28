/**
 * 
 */
package com.tlabs.posweb.services;

import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Set;

import com.tlabs.posweb.init.AppProperties;
import org.apache.log4j.Logger;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.tlabs.posweb.beans.Billing;
import com.tlabs.posweb.beans.GetLogRequest;
import com.tlabs.posweb.beans.GetLogResponse;
import com.tlabs.posweb.beans.LogBean;
import com.tlabs.posweb.beans.ResponseHeader;
import com.tlabs.posweb.beans.SAPBean;
import com.tlabs.posweb.beans.SessionScope;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
import com.tlabs.posweb.util.RestfulServiceConnection;
//import com.tlabs.posweb.util.Utilities;

/**
 * @author Ashishrathore
 * 
 */
public class LogService {
	
//	private static Logger log = Logger.getLogger(LogService.class);
	@Autowired
	SessionScope sessionScope;
	
	static Date date = new Date();
	private Gson gson;


	
	
	public List<LogBean> getApplicationLog(String searchNameStr,String customerIdStr,String emailIdStr,String indexStr,String locationStr,String maxRecordsStr,String startDateStr,String endDateStr,boolean search,boolean saveFlag){
		String resultStr = null;
		GetLogRequest logReqObj=new GetLogRequest();
		GetLogResponse logResponseObj= new GetLogResponse();
		gson=new Gson();
		try{
			logReqObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			logReqObj.setStartIndex(indexStr);
			
//			if(search){
				logReqObj.setSearchCriteria(searchNameStr);
				logReqObj.setMaxRecords(maxRecordsStr);
				logReqObj.setStartDate(startDateStr);
				logReqObj.setEndDate(endDateStr);
				logReqObj.setLocation(locationStr);
				logReqObj.setSaveLog(saveFlag);
//			}
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			//System.out.println("Request String:: getApplicationLog ::::::::::"+gson.toJson(logReqObj));
			resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Log_Service_get_Log"), gson.toJson(logReqObj),"GET");
			//System.out.println("Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				logResponseObj = gson.fromJson(resultStr, GetLogResponse.class);
				
				if(logResponseObj.getLogList() != null && logResponseObj.getLogList().size() > 0){
					logResponseObj.getLogList().get(0).setTotalRecords(Response.getResponseTotalRecords(resultStr));
				
					int slNo = Integer.parseInt(indexStr);
					for(LogBean beanObj : logResponseObj.getLogList())
						beanObj.setSlNo(++slNo);
				}
				else
				{
					String logFileUrl = Response.getLogFileURL(resultStr);
					if(logFileUrl!=null && !logFileUrl.isEmpty())
					{
						LogBean logBeanObj = new LogBean();
						logBeanObj.setLogFileurl(logFileUrl);
						logResponseObj.getLogList().add(logBeanObj);
					}
				}
			}
		/*}catch(ConnectException ce) {
			ce.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();*/
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		/*} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("UNKNOWN_HOST").trim();*/
		/*} catch(RemoteException rme){
			rme.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("SERVER_NOT_RESPONDING").trim();*/
		} catch(Exception e){
			e.printStackTrace();
		}
		return logResponseObj.getLogList();
	}
	

	
	
	
	public List<LogBean> getExportLog(String searchNameStr,String customerIdStr,String emailIdStr,String indexStr,String locationStr,String maxRecordsStr,String startDateStr,String endDateStr,boolean search,boolean saveFlag){
		String resultStr = null;
		GetLogRequest logReqObj=new GetLogRequest();
		GetLogResponse logResponseObj= new GetLogResponse();
		gson=new Gson();
		try{
			
			logReqObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			logReqObj.setStartIndex(indexStr);
				logReqObj.setSearchCriteria(searchNameStr);
				logReqObj.setMaxRecords(maxRecordsStr);
				if(!startDateStr.equals(""))
					logReqObj.setStartDate(startDateStr+" 00:00:00");
				if(!endDateStr.equals(""))
					logReqObj.setEndDate(endDateStr+" 00:00:00");
				logReqObj.setLocation(locationStr);
				logReqObj.setLogType("export_logs");
				logReqObj.setSaveLog(saveFlag);
				
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection();
			//////////System.out.println("Request for Log_Service_get_Log "+gson.toJson(logReqObj));
			resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("Log_Service_get_Log"), gson.toJson(logReqObj),"GET");
			String responseCode = Response.getResponseCode(resultStr);
			//////////System.out.println("REsponce for Log_Service_get_Log "+resultStr);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				logResponseObj = gson.fromJson(resultStr, GetLogResponse.class);
				if(logResponseObj.getLogList() != null && logResponseObj.getLogList().size() > 0){
					logResponseObj.getLogList().get(0).setTotalRecords(Response.getResponseTotalRecords(resultStr));
					int slNo = Integer.parseInt(indexStr);
					for(LogBean beanObj : logResponseObj.getLogList())
						beanObj.setSlNo(++slNo);
				}
				else
				{
					String logFileUrl = Response.getLogFileURL(resultStr);
					if(logFileUrl!=null && !logFileUrl.isEmpty())
					{
						LogBean logBeanObj = new LogBean();
						logBeanObj.setLogFileurl(logFileUrl);
						logResponseObj.getLogList().add(logBeanObj);
					}
				}
			}
		
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
	
		} catch(Exception e){
			e.printStackTrace();
		}
		return logResponseObj.getLogList();
	}
	

	
	
	
	
	
	public List<Billing> getIntegrationMonitoringDetails(String customerId,String emailId,String index,String maxRecords,String zone,String type,String location,String startDate,String endDate,String counterName,String locationListAll){
		String resultStr = null;
		Billing intDetailObj = new Billing();
		try {
			intDetailObj.setStartIndex(index);
			intDetailObj.setMaxRecords(maxRecords);
			intDetailObj.setCustomerId(customerId);
			intDetailObj.setEmailId(emailId);
			intDetailObj.setZoneId(zone);
			if(location.equals("all") || location.equals("") && locationListAll.trim() !=""){
				Set<String> myList = new HashSet<String>(Arrays.asList(locationListAll.split(",")));
				intDetailObj.setLocationsList(myList);
			}else{
				intDetailObj.setStore_location(location);
			}
			intDetailObj.setCounterId(counterName);
			intDetailObj.setStartDate(startDate);
			intDetailObj.setEndDate(endDate);
			
			intDetailObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			////////System.out.println("Request String GET INTMON ::"+new Gson().toJson(intDetailObj));
			RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			resultStr = restfulServiceConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_integrationMonitor_Details"), new Gson().toJson(intDetailObj),"GET");
			/////////System.out.println("Response String:::::::::::"+resultStr);
			String responseCode = Response.getResponseCode(resultStr);
			intDetailObj =new Gson().fromJson(resultStr,Billing.class);
			if(responseCode.equals(AppProperties.getAppMessageByProperty("RESPONSE_SUCCESS_CODE").trim())){
				if(intDetailObj.getBillingList() != null && intDetailObj.getBillingList().size() > 0)
					intDetailObj.getBillingList().get(0).setTotalRecords(intDetailObj.getTotalRecords());
				
			}
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		return intDetailObj.getBillingList();
	}
	public SAPBean billsPushingtoSAP(String customerId,String emailId,String index,String location,String dateStr,String counterId){
		String resultStr = null;
		SAPBean intDetailObj = new SAPBean();
		SAPBean responseObj = null;
		try {
			
			intDetailObj.setStoreLocation(location);
			intDetailObj.setDateStr(dateStr);
			intDetailObj.setCounterId(counterId);
			
			intDetailObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			//System.out.println("Request String PUSH Bills ::"+new Gson().toJson(intDetailObj));
			//RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("push_Bills_SAP_ID"), new Gson().toJson(intDetailObj),"GET");
			
			//System.out.println("Response String:::::::::::"+resultStr);
			responseObj =new Gson().fromJson(resultStr,SAPBean.class);
			
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		
		return responseObj;
	}
	
	


	

	public SAPBean allBillPushtoSAPfromID(String customerIdStr,String emailId,String location,String startDate,String endDate){
		String resultStr = null;
		SAPBean intDetailObj = new SAPBean();
		SAPBean responseObj = null;
		try {
			
			intDetailObj.setStoreLocation(location);
			intDetailObj.setStartDateStr(startDate);
			intDetailObj.setEndDateStr(endDate);
			
			intDetailObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(sessionScope));
			
			//System.out.println("Request String PUSH Bills ::"+new Gson().toJson(intDetailObj));
			//RestfulServiceConnection restfulServiceConnectionObj = new RestfulServiceConnection(); 
			RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
			resultStr = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("push_Bills_SAP_ID"), new Gson().toJson(intDetailObj),"GET");
			
			// System.out.println("Response String:::::::::::"+resultStr);
			responseObj =new Gson().fromJson(resultStr,SAPBean.class);
			JSONObject jsonResponse = new JSONObject(resultStr);
			String responseCode = jsonResponse.getString("responseCode");
			String responseMsg = jsonResponse.getString("responseMessage");
			ResponseHeader rs = new ResponseHeader();
			rs.setResponseCode(responseCode);
			rs.setResponseMessage(responseMsg);
			responseObj.setResponseHeader(rs);
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			resultStr = AppProperties.getAppMessageByProperty("INVALID_REQUEST").trim();
		} catch(Exception e){
			e.printStackTrace();
		}
		
		return responseObj;
	}
}






	
	/*
	public List<String> getLogDetails(String filePath,String timeVal,String moduleVal)
		{
		List<String> todayList=new ArrayList<String>();
		try {
		if((Constants.Today).equalsIgnoreCase(timeVal))
		{
		todayList=LogService.todayLogDetails(filePath);					
		}
		else if(timeVal.equalsIgnoreCase(Constants.Weekly) || timeVal.equalsIgnoreCase(Constants.Monthly) || timeVal.equalsIgnoreCase(Constants.AllLogs))
		{
		todayList=LogService.logDetails(filePath,timeVal);
		}				
		}catch(Exception e)
		{
		e.printStackTrace();
		}
		return todayList;
	}
	public static List<String> todayLogDetails(String filePath){
		List<String> todayList=new ArrayList<String>();
		//Date date=new Date();
		StringTokenizer timeSplit=new StringTokenizer(date.toGMTString()," ");
		StringBuilder saveDate=new StringBuilder();	
		
		for(int i=0;i<timeSplit.countTokens();i++)
		{
		if(timeSplit.hasMoreTokens())
		{
		saveDate.append(timeSplit.nextElement());
		}
		}
		try{
			//Modified by Chandan 27 Aug 2015 for proper file path
		FileReader fileReader = new FileReader(filePath+saveDate+".log");
		BufferedReader bufferedReader = new BufferedReader(fileReader);
		StringBuffer stringBuffer = new StringBuffer();
		String line;
		List<String> arrayList = new ArrayList<String>();
		while ((line = bufferedReader.readLine()) != null) {
		stringBuffer.append(line);
		StringTokenizer st = new StringTokenizer(line);
		while (st.hasMoreElements()) {
		String str=(String) st.nextElement();
		if(str.equalsIgnoreCase("INFO:"))						
		arrayList.add(line);
		////////////System.out.println("This is the details"+arrayList);
		}
		stringBuffer.append("\n");
		}
		fileReader.close();
		Iterator<String> itr = arrayList.iterator();
		while(itr.hasNext()) {
		String element = (String) itr.next();
		StringTokenizer st = new StringTokenizer(element,"|");
		while (st.hasMoreElements()) {
		st.nextElement();
		String strVal=(String) st.nextElement();
		todayList.add(strVal);
		}
		}			
		} catch (IOException e) {
		e.printStackTrace();
		}
		return todayList;
	}
	
	public static List<String> logDetails(String filePath,String timeVal){
		List<String> arrayList1=new ArrayList<String>();
		LogService.getAllFile(filePath,timeVal);
		try{
		FileReader fileReader = new FileReader(filePath+"temp.log");
		BufferedReader bufferedReader = new BufferedReader(fileReader);
		StringBuffer stringBuffer = new StringBuffer();
		String line;
		List<String> arrayList = new ArrayList<String>();
		while ((line = bufferedReader.readLine()) != null) {
		stringBuffer.append(line);
		StringTokenizer st = new StringTokenizer(line);
		while (st.hasMoreElements()) {
		String str=(String) st.nextElement();
		if(str.equalsIgnoreCase("INFO:"))						
		arrayList.add(line);
		}
		stringBuffer.append("\n");
		}
		fileReader.close();
		Iterator<String> itr = arrayList.iterator();
		while(itr.hasNext()) {
		String element = (String) itr.next();
		StringTokenizer st = new StringTokenizer(element,"|");
		while (st.hasMoreElements()) {
		st.nextElement();
		String strVal=(String) st.nextElement();
		// log.info(strVal);
		arrayList1.add(strVal);
		}
		}			
		} catch (IOException e) {
		e.printStackTrace();
		}
		return arrayList1;
		}
		
	public static void getAllFile(String filePath,String timeVal){
		List<String> fileList=new ArrayList<String>();	
		File file=new File(filePath+"temp.log");
		try{
		File dir = new File(filePath);
		Date today=new Date();
		
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
	
		Calendar cal = Calendar.getInstance();
	
		if(timeVal.equalsIgnoreCase(Constants.Weekly))
		{
		cal.add(Calendar.DATE, -7);
		}
		else if(timeVal.equalsIgnoreCase(Constants.Monthly))
		{
		cal.add(Calendar.DATE, -30);
		}
		else if(timeVal.equalsIgnoreCase(Constants.AllLogs)){
			cal.add(Calendar.DATE, -365);
		}
		Date todayDate = sdf1.parse(sdf.format(today));
		Date weekDate = sdf1.parse(sdf.format(cal.getTime()));
		
		//int i=0;
		for (File file1 : dir.listFiles()) {				
		if (file1.getName().endsWith((".log"))) {
//				      if(sdf1.parse(sdf.format(file1.lastModified())).before(todayDate) && sdf1.parse(sdf.format(file1.lastModified())).after(weekDate))
		if(sdf1.parse(sdf.format(file1.lastModified())).compareTo(todayDate)  <= 0 && sdf1.parse(sdf.format(file1.lastModified())).compareTo(weekDate)>=0)
		{
		fileList.add(file1.getName());
		//i++;
		}
		}
		}
		FileWriter output=new FileWriter(file);			 
		for(int j=0;j<fileList.size();j++)
		{
		BufferedReader objBufferedReader = new BufferedReader(new FileReader(filePath+fileList.get(j)));
		String line;
		while ((line = objBufferedReader.readLine())!=null )
		{
		
		output.write(line);
		output.write(System.getProperty("line.separator"));
		}
		objBufferedReader.close();
		}
		output.close();
		}
		catch(Exception e)
		{
		e.printStackTrace();
		}		
	}

	public void logCreation(HttpServletRequest request,HttpServletResponse response,LogBean logBeanObj,String customerIdStr){
		String ipAddress = request.getHeader("X-FORWARDED-FOR");  
		if (ipAddress == null) {  
		ipAddress = request.getRemoteAddr();  
		}
		// log.info("Accessing System id:"+ipAddress);
		StringTokenizer st1=new StringTokenizer(new Date().toGMTString()," ");
		StringBuilder sb1=new StringBuilder();	
		for(int i=0;i<st1.countTokens();i++)
		{
		if(st1.hasMoreTokens())
		{
		sb1.append(st1.nextElement());
		}
		}
		
		try {
		File file = new File(AppProperties.getAppMessageByProperty("COMMON_FOLDER_PATH")+customerIdStr);
		if (!file.exists()) {
			if (file.mkdir()) {
				////////////System.out.println("Directory is created!");
			} else {
				////////////System.out.println("Failed to create directory!");
			}
		}
		String separatorStr = " "+Character.toString((char)240)+" ";
		java.util.logging.Logger logger =java.util.logging.Logger.getLogger("Login Controller");
		FileHandler fh = new FileHandler(AppProperties.getAppMessageByProperty("COMMON_FOLDER_PATH")+customerIdStr+"/"+sb1+".log",true);
		SimpleFormatter formatter = new SimpleFormatter();  
		fh.setFormatter(formatter);
		logger.addHandler(fh);
		logger.info("|"+"Mythri"+separatorStr+"Admin"+separatorStr+
				"mythri.sabath@technolabssoftware.com"+separatorStr+"OmniRetailerConsole-FMCG"+separatorStr+"11/02/2016"+
				separatorStr+"07:36:00"+separatorStr+"Login"+separatorStr+"Login"+separatorStr+"Success"+separatorStr+"123456"+separatorStr+ipAddress+separatorStr+"Logined Successfully");		
		fh.close();	
		} catch (IOException e) {
		e.printStackTrace();
		}			
	}
	public void log(HttpServletRequest request,HttpServletResponse response,String controllername,String logpath,String user_name,String task,String message_status,String module){
		Date sDate=new Date();			
		String start_time=sDate.getHours()+":"+sDate.getMinutes()+":"+sDate.getSeconds();
		Date eDate=new Date();
		String end_time=eDate.getHours()+":"+eDate.getMinutes()+":"+eDate.getSeconds();
		String ipAddress = request.getHeader("X-FORWARDED-FOR");  
		if (ipAddress == null) {  
		ipAddress = request.getRemoteAddr();  
		}
		// log.info("Accessing System id:"+ipAddress);
		StringTokenizer st1=new StringTokenizer(date.toGMTString()," ");
		StringBuilder sb1=new StringBuilder();	
		for(int i=0;i<st1.countTokens();i++)
		{
		if(st1.hasMoreTokens())
		{
		sb1.append(st1.nextElement());
		}
		}
		
		try {
		java.util.logging.Logger logger =java.util.logging.Logger.getLogger(controllername);
		FileHandler fh = new FileHandler(logpath+sb1+".log",true);	
		
		SimpleFormatter formatter = new SimpleFormatter();  
		fh.setFormatter(formatter);
		logger.addHandler(fh);
			
		SimpleDateFormat dateformat= new SimpleDateFormat ("MMM dd yyyy");
				
		logger.info("|"+"USER="+user_name+","+"DATE="+dateformat.format(date)+
		","+"TASK_PERFORMED="+task+
		","+"REQUEST_IP_ADDRESS="+ipAddress+
		","+"START_TIME="+start_time+
		","+"END_TIME="+end_time+
		","+"MESSGAE_TYPE="+message_status+
		","+"MODULE="+module);		
		fh.close();			    
		} catch (IOException e) {
		e.printStackTrace();
		}			
	}*/
