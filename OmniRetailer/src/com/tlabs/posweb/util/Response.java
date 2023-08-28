package com.tlabs.posweb.util;

import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;

import com.tlabs.posweb.beans.ResponseHeader;



public class Response {
	
	private String URL;
	
	
	  private ResponseHeader responseHeader;
	  
	  private List<Integer> headerPositionsList;
	  
	  
	  
	  
		
		
		public List<Integer> getHeaderPositionsList() {
		return headerPositionsList;
	}

	public void setHeaderPositionsList(List<Integer> headerPositionsList) {
		this.headerPositionsList = headerPositionsList;
	}

		public ResponseHeader getResponseHeader() {
			return responseHeader;
		}

		public void setResponseHeader(ResponseHeader responseHeader) {
			this.responseHeader = responseHeader;
		}
	

	public String getURL() {
		return URL;
	}

	public void setURL(String uRL) {
		URL = uRL;
	}

	public static String getResponseMessage(String result){
		String responseMessage = "";
		try {
			JSONObject jsonResult = new JSONObject(result);
			String responseHeader = jsonResult.getString("responseHeader");
			JSONObject jsonResponse = new JSONObject(responseHeader);
			responseMessage = jsonResponse.getString("responseMessage");
		} catch (JSONException e) {
			e.printStackTrace();
		}
		
		return responseMessage;
	}
	
	public static String getResponseCode(String result){
		String responseCode = "";
		try {
			JSONObject jsonResult = new JSONObject(result);
			String responseHeader = jsonResult.getString("responseHeader");
			JSONObject jsonResponse = new JSONObject(responseHeader);
			responseCode = jsonResponse.getString("responseCode");
		} catch (JSONException e) {
			e.printStackTrace();
		}
		
		return responseCode;
		
	}
	
	public static String getResponseMsg(String result){
		String responseMessage = "";
		try {
			JSONObject jsonResult = new JSONObject(result);
			String responseHeader = jsonResult.getString("response");
			JSONObject jsonResponse = new JSONObject(responseHeader);
			responseMessage = jsonResponse.getString("responseMessage");
		} catch (JSONException e) {
			e.printStackTrace();
		}
		
		return responseMessage;
	}
	public static String getResponseTotalRecords(String result){
		String totalRecords = "";
		try {
			JSONObject jsonResult = new JSONObject(result);
			totalRecords = jsonResult.getString("totalRecords");
		} catch (JSONException e) {
			e.printStackTrace();
		}
		
		return totalRecords;
	}
	public static String getResponse(String result){
		String responseCode = "";
		JSONObject jsonResponse,jsonResponseMessage = null;
		try{
			jsonResponse = new JSONObject(result);
			String response = jsonResponse.getString(Constants.RESPONSE);
			jsonResponseMessage = new JSONObject(response);
			responseCode = jsonResponseMessage.getString(Constants.RESPONSE_CODE);
		}catch (JSONException e) {
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
		return responseCode;
	}
	
	
	public static String getLogFileURL(String result){
		String logFileUrl = "";
		try {
			JSONObject jsonResult = new JSONObject(result);
			logFileUrl = jsonResult.getString("logFileurl");
		} catch (JSONException e) {
			e.printStackTrace();
		}
		
		return logFileUrl;
	}
	
	
	public static String getResponseList(String result,String listName){
		String responseList = null;
		try {
			JSONObject jsonResponseList = new JSONObject(result);
			responseList = jsonResponseList.getString(listName);
		} catch (JSONException e) {
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
		return responseList;
	}
}
