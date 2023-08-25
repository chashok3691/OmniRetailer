/*******************************************************************************
 * Copyright  2015 Omni Retailer Customer Console, All rights reserved.
 * Author : Sahitya P
 * Created On : 12-2-2015
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

/**
 * @author Sahitya
 * Verified By : 
 * 
 * This class is used for maintaing constants throughout the applications
 */
public class Constants {

	public final static String SUCCESS_RESPONSE = "200";
	public final static String APPLICATION_NAME = "Customer Console";
	public final static String CORRELATION_ID = "-";
	public final static String PASSWORD_FORMAT_MSG = "Password syntax is wrong(Ex:Tech123@)";
	public final static String EMAIL_FORMAT_MSG = "Invalid Email Format(Ex:abc@gmail.com)";
	public final static String EMAIL_REQUIRED = "Email is required";
	public final static String PASSWORD_REQUIRED = "Password is required";
	public final static String NEW_PASSWORD_REQUIRED = "New Password is required";
	public final static String CONFIRM_PASSWORD_REQUIRED = "Confirm Password is required";
	public final static String PASSWORD_MISMATCH = "Password did not match";
	public final static String SUCCESS = "success";
	public final static String FAILURE = "failure";
	public final static String FIRST_NAME_REQUIRED = "First Name is required";
	public final static String LAST_NAME_REQUIRED = "Last Name is required";
	public final static String CONTACT_OFFICE_REQUIRED = "Contact Office is required";
	public final static String CONTACT_PERSONAL_REQUIRED = "Contact Personal is required";
	public final static String STORE_NAME = "Store Name";
    public final static String LOCATION_REQUIRED = "Location must be selected";
    public final static String PHONE_REQUIRED = "Phone number is required";
	public final static String FAX_REQUIRED = "Fax is required";
	
	public final static String LOCATION_IS_REQUIRED = "Location is required to import data";
	public final static String RESPONSE = "response";
	public final static String RESPONSE_MESSAGE = "responseMessage";
	public final static String RESPONSE_CODE = "responseCode";
	public final static String STORE_EXISTS = "Store is already there in that location";
	public static final String RESPONSE_SUCCESS_CODE = "0";
	public static final String ALERT_SUCCESS_CODE = "3";
	public static final String LOGIN_FAILED = "Server is not responding. Please contact admin for support";
	public static final String LOGIN_ERROR = "Server is not responding. Please contact admin for support";
	public static final String PAGINATION_START_INDEX = "-1";
	public static final String ALL = "all";
	
	public static final String NORMAL_STOCK = "Normal Stock";
	public static final String CRITICAL_STOCK = "Critical Stock";
	public static final String NORMAL_STOCK_VAL = ">=#0";
	public static final String CRITICAL_STOCK_VAL = "=#0";
	
	public static final String Today="Today";
	public static final String Monthly="Monthly";
	public static final String Weekly="Weekly";
	public static final String AllLogs = "Time Filter";
}
