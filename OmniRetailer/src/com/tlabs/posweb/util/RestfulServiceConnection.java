/*******************************************************************************
 * Copyright  2015 Omni Retailer Customer Console, All rights reserved.
 * Author : Sahitya
 * Created On : 31-8-2015
 * 
 * Licensed under the Technolabs Software License, Version 1.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *   http://www.technolabssoftware.com/pages/privacy-policy/
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 ******************************************************************************/

package com.tlabs.posweb.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
//import java.net.SocketTimeoutException;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.rmi.ConnectException;
import java.rmi.RemoteException;
import java.rmi.UnknownHostException;
//import java.text.DateFormat;
import java.text.SimpleDateFormat;
//import java.util.Calendar;
import java.util.Date;
import java.util.NoSuchElementException;
import java.util.Properties;

//import javax.activation.DataHandler;
//import javax.ws.rs.core.MultivaluedMap;

import org.apache.log4j.Logger;
import org.ksoap2.SoapEnvelope;
import org.ksoap2.SoapFault;
import org.ksoap2.serialization.SoapObject;
import org.ksoap2.serialization.SoapPrimitive;
import org.ksoap2.serialization.SoapSerializationEnvelope;
import org.ksoap2.transport.HttpTransportSE;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.UriUtils;
import org.xmlpull.v1.XmlPullParserException;

//import com.google.gson.Gson;
//import com.technolabssoftware.www.FileUploader;
import com.tlabs.posweb.beans.MasterDataImportsAndExportsBean;
import com.tlabs.posweb.beans.ResponseHeader;
import com.tlabs.posweb.init.AppProperties;
//import com.tlabs.posweb.services.AdminService;

//import sun.net.www.http.HttpClient;


/**
 * 
 * @author Mythri.S
 * This class is used to access restful services.
 *
 */
public class RestfulServiceConnection {
	private static Logger log = Logger.getLogger(RestfulServiceConnection.class);
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
	 * This method is used to call the restful web service methods.
	 * It accepts the url of the web service, request string i.e a JSON string, requestType is the method type of the web service to be called.
	 *  It returns the response received from the web service. 
	 * 
	 */
	public String getResponse(String Url,String jsonRequest,String requestType)throws IOException{
	String result=null;
		BufferedReader reader = null;
		HttpURLConnection con = null;
		StringBuilder builder = null;
	// int timout=100;
		try{
			builder = new StringBuilder();
			System.setProperty("http.keepAlive", "false");
			Url = Url + jsonRequest;
//			String encodedUrl = URLEncoder.encode(Url,"UTF-8");
			@SuppressWarnings("deprecation")
			String encodedUrl = UriUtils.encodeHttpUrl(Url, StandardCharsets.UTF_8.toString());
			//String encodedUrl = URLEncoder.encode(Url, StandardCharsets.UTF_8.toString());
			
			
			URL url = new URL(encodedUrl);
			////System.out.println("Restfull URL>>>>>>>>>>>>>>>>>>>>>>>>>" + Url);
			con = (HttpURLConnection) url.openConnection();
		   // con.setConnectTimeout(15);
            //con.setReadTimeout(100);
            //con.setRequestProperty("Connection", "close");
			con.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
		    con.setRequestMethod(requestType);
		    con.setDoOutput(true);
		    
		   
			////System.out.println("connection status:::: "+ con.getResponseCode()+"::::::::::"+con.getResponseMessage());
			//reader = new BufferedReader(new InputStreamReader(con.getInputStream()));
		    reader = new BufferedReader(new InputStreamReader(con.getInputStream(), StandardCharsets.UTF_8));
			String line = "";
			while ((line = reader.readLine()) != null) {
				builder.append(line);
			}
			/*if(con.getResponseCode() >=200 && con.getResponseCode()<=399)
				con.setReadTimeout(0);*/
			result = builder.toString();
			
			
			////System.out.println("Restfull Response>>>>>>>>>>>>>>>>>>>>>>>>>" + result);
		}catch(ConnectException ce) {
			ce.printStackTrace();
			result = getResponseCode("SERVER_NOT_RESPONDING").trim();
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = getResponseCode("INVALID_REQUEST").trim();
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			result = getResponseCode("UNKNOWN_HOST").trim();
		} catch(RemoteException rme){
			rme.printStackTrace();
			result = getResponseCode("SERVER_NOT_RESPONDING").trim();
		}
		/*catch (SocketTimeoutException exception) {
			result = getResponseCode("CONNECTION_TIMEOUT").trim();
			//return result;
			//System.out.println("dgdfg");
			exception.printStackTrace();
			result = getResponseCode("CONNECTION_TIMEOUT").trim();
        }*/
	    catch (FileNotFoundException fnf) {
	    	fnf.printStackTrace();
			result = getResponseCode("SERVER_NOT_RESPONDING").trim();
			} 
		catch (IOException ioe) {
	    	ioe.printStackTrace();
			result = getResponseCode("SERVER_NOT_RESPONDING").trim();
			} 
		
		catch(Exception e){
			e.printStackTrace();
		}
		con.disconnect();
		
		//con.setConnectTimeout(timeout);
		return result;
		
	}
	
	public String getResponseFromPost(String Url,String jsonRequest)throws IOException{
		String result=null;
		BufferedReader reader = null;
		HttpURLConnection con = null;
		StringBuilder builder = null;
		try{
			builder = new StringBuilder();
			System.setProperty("http.keepAlive", "false");
		//	Url = Url + jsonRequest;
		//	String encodedUrl = UriUtils.encodeHttpUrl(Url, "UTF-8");
			
			URL url = new URL(Url);
			////System.out.println("Restfull URL>>>>>>>>>>>>>>>>>>>>>>>>>" + Url);
			////System.out.println("jsonRequest URL>>>>>>>>>>>>>>>>>>>>>>>>>" + jsonRequest);
			con = (HttpURLConnection) url.openConnection();
			con.setDoOutput(true);
			con.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
		    //con.setRequestProperty("Connection", "close");
		    con.setRequestMethod("POST");
		    OutputStream skuDetails = con.getOutputStream();
		    //System.out.println(jsonRequest.getBytes().toString());
		 //   skuDetails.write(jsonRequest.getBytes());
		    skuDetails.write(jsonRequest.getBytes(StandardCharsets.UTF_8));
		    skuDetails.flush();
		   // System.out.println(skuDetails);
			log.info(("connection status:::: "+ con.getResponseCode()+"::::::::::"+con.getResponseMessage()));
			//reader = new BufferedReader(new InputStreamReader(con.getInputStream()));
			 reader = new BufferedReader(new InputStreamReader(con.getInputStream(), StandardCharsets.UTF_8));
			String line = "";
			while ((line = reader.readLine()) != null) {
				builder.append(line);
			}
			
			
			result = builder.toString();
			con.disconnect();
			////System.out.println("Restfull Response>>>>>>>>>>>>>>>>>>>>>>>>>" + result);
		}catch(ConnectException ce) {
			ce.printStackTrace();
			result = getResponseCode("SERVER_NOT_RESPONDING").trim();
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = getResponseCode("INVALID_REQUEST").trim();
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			result = getResponseCode("UNKNOWN_HOST").trim();
		}
		
		catch(RemoteException rme){
			rme.printStackTrace();
			result = getResponseCode("SERVER_NOT_RESPONDING").trim();
		}
		
		/*catch (SocketTimeoutException exception) {
			//System.out.println("dgdfg");
            // Output expected SocketTimeoutExceptions.
           // Logging.log(exception);
        }*/
		catch(FileNotFoundException fnf){
			fnf.printStackTrace();
			result = getResponseCode("FILE_NOT_FOUND").trim();
		}
		catch(IOException ioe){
			ioe.printStackTrace();
			result = getResponseCode("IOE_NOT_FOUND").trim();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return result;
		
	}
	
	
	public MasterDataImportsAndExportsBean uploadFile(String customerId, MultipartFile excelFile) {
		MasterDataImportsAndExportsBean responseObj = null;
		String fileName = null;
		InputStream inputStream = null;
		OutputStream outputStream = null;
		ResponseHeader responseHeader = new ResponseHeader();
		File file = null;
		try {
			responseObj = new MasterDataImportsAndExportsBean();
				fileName = excelFile.getOriginalFilename();
//				//System.out.println(fileName);

				if (fileName!="" && fileName!=null) {
					inputStream = excelFile.getInputStream();
					
					String folder_path = System.getProperty(AppProperties.getAppMessageByProperty("CATALINA_BASE")) + File.separator + AppProperties.getAppMessageByProperty("WEBAPPS_FOLDER") + File.separator + AppProperties.getAppMessageByProperty("CONFIGURATIONS_FOLDER") + File.separator + customerId + File.separator + AppProperties.getAppMessageByProperty("UPLOAD_FOLDER");
					System.out.println(folder_path);
					file = new File(folder_path);
					if (!file.exists()) {
						if (!file.mkdirs()) {
							responseHeader.setResponseCode(AppProperties.getAppMessageByProperty("RC_EXCEPTION"));
							responseObj.setResponseHeader(responseHeader);
						}
					}
//					DateFormat dateFormatObj = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
					String selectedDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
					String fileAlteredName = selectedDate.trim().replace("-", "")+fileName;
					fileAlteredName=fileAlteredName.replace(":", "");
					fileAlteredName=fileAlteredName.replace(" ", "");
					File fille = new File(folder_path + File.separator + fileName);
					if (fille.exists()) {
						fille.delete();
						fille.createNewFile();
					}
					outputStream = new FileOutputStream(new File(folder_path + File.separator + fileName));
					int read = 0;
					byte[] bytes = new byte[1024];
					while ((read = inputStream.read(bytes)) != -1) {
						outputStream.write(bytes, 0, read);
					}
					outputStream.flush();
					inputStream.close();
					responseHeader.setResponseCode(AppProperties.getAppMessageByProperty("RC_SUCCESS"));
					responseHeader.setResponseMessage(AppProperties.getAppMessageByProperty("RC_SUCCESS"));
					responseObj.setResponseHeader(responseHeader);
					responseObj.setUploadedFilePath(folder_path + File.separator + fileName);
					responseObj.setFileName(fileName);
					responseObj.setPriceUploadfilePath(folder_path + File.separator + fileName);
					System.out.println(folder_path+ File.separator + fileName);
				
				}
			else {
				responseHeader.setResponseCode(AppProperties.getAppMessageByProperty("RC_EXCEPTION"));
				responseObj.setResponseHeader(responseHeader);
				responseHeader.setResponseMessage(AppProperties.getAppMessageByProperty("RC_EXCEPTION"));
			}
		} catch (IOException ioex) {
			ioex.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return responseObj;
	}
	

	
	/*

	public MasterDataImportsAndExportsBean uploadFile(String customerId, MultipartFile excelFile) {
		MasterDataImportsAndExportsBean responseObj = null;
		String fileName = null;
		InputStream inputStream = null;
		OutputStream outputStream = null;
		ResponseHeader responseHeader = new ResponseHeader();
		File file = null;
		try {
			responseObj = new MasterDataImportsAndExportsBean();
				fileName = excelFile.getOriginalFilename();
//				//System.out.println(fileName);

				if (fileName!="" && fileName!=null) {
					inputStream = excelFile.getInputStream();
					
					String folder_path = System.getProperty(AppProperties.getAppMessageByProperty("CATALINA_BASE")) + File.separator + AppProperties.getAppMessageByProperty("WEBAPPS_FOLDER") + File.separator + AppProperties.getAppMessageByProperty("CONFIGURATIONS_FOLDER") + File.separator + customerId + File.separator + AppProperties.getAppMessageByProperty("UPLOAD_FOLDER");
//					//System.out.println(folder_path);
					file = new File(folder_path);
					if (!file.exists()) {
						if (!file.mkdirs()) {
							responseHeader.setResponseCode(AppProperties.getAppMessageByProperty("RC_EXCEPTION"));
							responseObj.setResponseHeader(responseHeader);
						}
					}
//					DateFormat dateFormatObj = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
					String selectedDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
					String fileAlteredName = selectedDate.trim().replace("-", "")+fileName;
					fileAlteredName=fileAlteredName.replace(":", "");
					fileAlteredName=fileAlteredName.replace(" ", "");
					File fille = new File(folder_path + File.separator + fileAlteredName);
					if (fille.exists()) {
						fille.delete();
						fille.createNewFile();
					}
					outputStream = new FileOutputStream(new File(folder_path + File.separator + fileAlteredName));
					int read = 0;
					byte[] bytes = new byte[1024];
					while ((read = inputStream.read(bytes)) != -1) {
						outputStream.write(bytes, 0, read);
					}
					outputStream.flush();
					inputStream.close();
					responseHeader.setResponseCode(AppProperties.getAppMessageByProperty("RC_SUCCESS"));
					responseHeader.setResponseMessage(AppProperties.getAppMessageByProperty("RC_SUCCESS"));
					responseObj.setResponseHeader(responseHeader);
					responseObj.setUploadedFilePath(folder_path + File.separator + fileAlteredName);
					responseObj.setFileName(fileAlteredName);
					responseObj.setPriceUploadfilePath(fileName);
				
				}
			else {
				responseHeader.setResponseCode(AppProperties.getAppMessageByProperty("RC_EXCEPTION"));
				responseObj.setResponseHeader(responseHeader);
				responseHeader.setResponseMessage(AppProperties.getAppMessageByProperty("RC_EXCEPTION"));
			}
		} catch (IOException ioex) {
			ioex.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return responseObj;
	}
	
*/
	/**
	* @author 		:   Karthik K
	* @Created_on   :  	05-07-2017
	* @verified_By  :
	* @modified_By  :
	* @modified_On  :  
	* @modified_Ref : 
	* @description  :  This method  is the helper method to get fileName 
	* 	* */
/*	private String getFileName(MultivaluedMap<String, String> multivaluedMap) {
		String[] contentDisposition = multivaluedMap.getFirst("Content-Disposition").split(";");
		for (String filename : contentDisposition) {
			if ((filename.trim().startsWith("filename"))) {
				String[] name = filename.split("=");
				String exactFileName = name[1].trim().replaceAll("\"", "");
				return exactFileName;
			}
		}
		return "UnknownFile";
	}*/

	/**
	* @author 		:   Karthik K
	* @Created_on   :  	13-07-2017
	* @verified_By  :
	* @modified_By  :
	* @modified_On  :  
	* @modified_Ref : 
	* @description  :  This method  is the helper method to get string from I/P 
	* 	* */
	/*public static String getStringFromInputStream(InputStream in) throws Exception {
		InputStream ipStream = in;
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject) jsonParser.parse(new InputStreamReader(ipStream, "UTF-8"));
		return jsonObject.toString();
	}*/
	
	
	public String getResponseFromPostWithFile(String Url,String jsonRequest,MultipartFile file){
		String result=null;
		BufferedReader reader = null;
		HttpURLConnection con = null;
		StringBuilder builder = null;
		try{
			builder = new StringBuilder();
			System.setProperty("http.keepAlive", "false");
		//	Url = Url + jsonRequest;
		//	String encodedUrl = UriUtils.encodeHttpUrl(Url, "UTF-8");
			
			URL url = new URL(Url);
			////System.out.println("Restfull URL>>>>>>>>>>>>>>>>>>>>>>>>>" + Url);
			con = (HttpURLConnection) url.openConnection();
			con.setDoOutput(true);
			con.setRequestProperty("Content-Type", "multipart/form-data");
		    //con.setRequestProperty("Connection", "close");
		    con.setRequestMethod("POST");
		    OutputStream skuDetails = con.getOutputStream();
		    skuDetails.write(jsonRequest.getBytes());
		    skuDetails.flush();
			log.info(("connection status:::: "+ con.getResponseCode()+"::::::::::"+con.getResponseMessage()));
			reader = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String line = "";
			while ((line = reader.readLine()) != null) {
				builder.append(line);
			}
			result = builder.toString();
			con.disconnect();
			////System.out.println("Restfull Response>>>>>>>>>>>>>>>>>>>>>>>>>" + result);
		}catch(ConnectException ce) {
			ce.printStackTrace();
			result = getResponseCode("SERVER_NOT_RESPONDING").trim();
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = getResponseCode("INVALID_REQUEST").trim();
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			result = getResponseCode("UNKNOWN_HOST").trim();
		} catch(RemoteException rme){
			rme.printStackTrace();
			result = getResponseCode("SERVER_NOT_RESPONDING").trim();
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	
	public String getResponseFromGet(URL Url,String jsonRequest){
		String result=null;
		BufferedReader reader = null;
		StringBuilder builder = null;
		try{
			builder = new StringBuilder();
			HttpURLConnection conn = (HttpURLConnection) Url.openConnection();
			conn.setRequestMethod("GET");
			conn.setDoOutput(true);
			conn.setRequestProperty("Accept", "application/json");
			////System.out.println("Restfull URL>>>>>>>>>>>>>>>>>>>>>>>>>" + Url);
		    //con.setRequestProperty("Connection", "close");
		/*    OutputStream skuDetails = conn.getOutputStream();
		    skuDetails.write(jsonRequest.getBytes());
		    skuDetails.flush();*/
			//System.out.println("connection status:::: "+ conn.getResponseCode()+"::::::::::"+conn.getResponseMessage());
			reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			while ((line = reader.readLine()) != null) {
				builder.append(line);
			}
			result = builder.toString();
			conn.disconnect();
			//System.out.println("Restfull Response>>>>>>>>>>>>>>>>>>>>>>>>>" + result);
		}catch(ConnectException ce) {
			ce.printStackTrace();
			result = getResponseCode("SERVER_NOT_RESPONDING").trim();
		} catch (NoSuchElementException nse) {
			nse.printStackTrace();
			result = getResponseCode("INVALID_REQUEST").trim();
		} catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			result = getResponseCode("UNKNOWN_HOST").trim();
		} catch(RemoteException rme){
			rme.printStackTrace();
			result = getResponseCode("SERVER_NOT_RESPONDING").trim();
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
		
	}
	
	public static void main(String[] args) {
		RestfulServiceConnection connection = new RestfulServiceConnection();
		connection.soapCall();
	}
	
	public String soapCall(){
		String str = "";
		final SoapObject Request = new SoapObject("www.technolabssoftware.com", "getEmployees");
		String jsonRequest = Utilities.getResponseCode("request").trim();
		if (jsonRequest.length() != 0) {
			Request.addProperty("employeeDetails", jsonRequest);
		} else {
			Request.newInstance();
		}
		final SoapSerializationEnvelope soapEnvelope = new SoapSerializationEnvelope(SoapEnvelope.VER11);

		String webServerDomain = "",portNumber ="";
		soapEnvelope.setOutputSoapObject(Request);
		if (webServerDomain.equals("")) {
			webServerDomain = "10.10.0.5:80";
		}
		if (portNumber.length() == 0) {
			portNumber = "8080";
		}
		String URL = "http://" + webServerDomain + ":" + portNumber + "/OmniRetailerServices/";
		URL = URL + "Employees";
		//System.out.println("URL------------------>>>" + URL);
		final HttpTransportSE aht = new HttpTransportSE(URL);
		
		try {
			aht.call("", soapEnvelope);
		} catch (IOException  e) {
			e.printStackTrace();
		}catch(XmlPullParserException e){
			e.printStackTrace();
		}
		SoapPrimitive resultsRequestSOAP;
		try {
			resultsRequestSOAP = (SoapPrimitive) soapEnvelope.getResponse();
			str = resultsRequestSOAP.toString();
		} catch (SoapFault e) {
			e.printStackTrace();
		}
		return str;
	}

}
