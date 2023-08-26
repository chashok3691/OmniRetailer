/*******************************************************************************
 * Copyright  2015 Omni Retailer Customer Console, All rights reserved.
 * Author : Sahitya P
 * Created On : 27-3-2015
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

import java.util.Date;

import org.apache.log4j.Logger;

import com.tlabs.posweb.beans.RequestHeader;
import com.tlabs.posweb.beans.SessionScope;


/**
 * 
 * @author Sahitya 
 * 
 *	This bean class is used to send request header object when userid & emaildid is passed
 *       among all class whenever request header is required 
 *
 */
public class RequestHeaderUtil {
	
	
	private static Logger log = Logger.getLogger(RequestHeaderUtil.class);
	
	public static RequestHeader getRequestHeader(String userIdStr,String emailIdStr){
		RequestHeader requestHeaderObj = null;
		try{
			log.info("Getting Request Header");
			requestHeaderObj = new RequestHeader();
			requestHeaderObj.setAccessKey(userIdStr);
			requestHeaderObj.setApplicationName(Constants.APPLICATION_NAME);
			requestHeaderObj.setDateTime(new Date().toString());
			requestHeaderObj.setUserName(emailIdStr);
			requestHeaderObj.setCustomerId(userIdStr);
			requestHeaderObj.setCorrelationId(Constants.CORRELATION_ID);
		}catch(Exception e){
			e.printStackTrace();
		}
		return requestHeaderObj;
	}
	
	public static RequestHeader getRequestHeader(SessionScope sessionScope){
		RequestHeader requestHeaderObj = null;
		try{
			log.info("Getting Request Header");
			requestHeaderObj = new RequestHeader();
			requestHeaderObj.setAccessKey(sessionScope.getCustomerId());
			requestHeaderObj.setApplicationName(sessionScope.getApplicationName());
			requestHeaderObj.setDateTime(new Date().toString());
			requestHeaderObj.setUserName(sessionScope.getLoginId());
			requestHeaderObj.setCustomerId(sessionScope.getCustomerId());
			requestHeaderObj.setCorrelationId(Constants.CORRELATION_ID);
			requestHeaderObj.setLocation(sessionScope.getLocation());
			requestHeaderObj.setIpAddress(sessionScope.getIpAddress());
			requestHeaderObj.setAppName(sessionScope.getApplicationName());
			requestHeaderObj.setLoginId(sessionScope.getLoginId());
			requestHeaderObj.setRole(sessionScope.getRole());
			requestHeaderObj.setName(sessionScope.getUserName());
			requestHeaderObj.setRequestChannel(Constants.APPLICATION_NAME);
		}catch(Exception e){
			e.printStackTrace();
		}
		return requestHeaderObj;
	}
	
	
	
}
