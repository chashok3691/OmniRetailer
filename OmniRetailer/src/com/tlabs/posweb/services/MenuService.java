package com.tlabs.posweb.services;


import java.io.InputStream;
import java.rmi.ConnectException;
import java.rmi.RemoteException;
import java.rmi.UnknownHostException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Properties;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
//import com.technolabssoftware.www.MenuProxy;
import com.tlabs.posweb.beans.MenuDetails;
import com.tlabs.posweb.init.AppProperties;
import com.tlabs.posweb.util.RequestHeaderUtil;
import com.tlabs.posweb.util.Response;
import com.tlabs.posweb.util.RestfulServiceConnection;
//import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

public class MenuService {
	
	@Autowired
	private Gson gson;
	private static Logger log = Logger.getLogger(MenuService.class);
	public static String getResponseCode(String constantName) {
			Properties properties = null;
			String constant = null;
			InputStream inputStream = null;
			try {
				properties = new Properties();
				inputStream = MenuService.class.getClassLoader().getResourceAsStream("commonResources.properties");
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
		 *This method is used to call createMenu method of web service and return the response
		 *
		 **/
		public String createMenu(MenuDetails menuObj,String customerId, String emailId){
			String result = null;
			try {
				// log.info("createMenu");
				menuObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerId, emailId));
				//menuObj.setStatus("true");
				//MenuProxy menuProxy = new MenuProxy();
				//// log.info("Request String::::::::::::"+gson.toJson(menuObj));
				RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
				// log.info("Request String:::::::::::: "+gson.toJson(menuObj));
//				////////////System.out.println(" create Request String:::::::::::: "+gson.toJson(menuObj));
				//	result = menuProxy.createMenu(gson.toJson(menuObj));
				result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("create_Menu"), gson.toJson(menuObj),"POST");
				// log.info("Response String::::::::::: "+result);
				//////////////System.out.println("Response String::::::::::: "+result);
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(getResponseCode("RESPONSE_SUCCESS_CODE").trim())){
					result = getResponseCode("CREATE_MENU_SUCCESS").trim();
				}
				else{
					result = Response.getResponseMessage(result);
				}
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
			} catch(Exception e){
				e.printStackTrace();
			}
			return result;
		}
		
		
		/**
		 * 
		 * @author Mythri.S
		 * 
		 *This method is used to call updateMenu method of web service and return the response
		 *
		 **/
		public String updateMenu(MenuDetails menuObj,String customerId, String emailId){
			String result = null;
			try {
				// log.info("updateMenu");
				RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
				menuObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerId, emailId));
			//	menuObj.getMenu_item_details().get
				//MenuProxy menuProxy = new MenuProxy();
				// log.info("Request String::::::::::::"+gson.toJson(menuObj));
//				////////////System.out.println("Request String::::::::::::"+gson.toJson(menuObj));
				//result = menuProxy.updateMenu(gson.toJson(menuObj));
				result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("update_Menu"), gson.toJson(menuObj),"POST");
				// log.info("Response String::::::::::: "+result);
//				////////////System.out.println("Response String::::::::::: "+result);
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(getResponseCode("RESPONSE_SUCCESS_CODE").trim())){
					result = getResponseCode("UPDATE_MENU_SUCCESS").trim();
				}
				else{
					result = Response.getResponseMessage(result);
				}
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
			} catch(Exception e){
				e.printStackTrace();
			}
			return result;
		}
		
		/**
		 * 
		 * @author Mythri.S
		 * 
		 *This method is used to call addItemToMenu method of web service and return the response
		 *
		 **/
		public String addItemToMenu(MenuDetails menuObj,String customerId, String emailId){
			String result = null;
			try {
				// log.info("addItemToMenu");
				RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
				menuObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerId, emailId));
				//MenuProxy menuProxy = new MenuProxy();
				//// log.info("Request String::::::::::::"+gson.toJson(menuObj));
				// log.info("Request String::::::::::: "+gson.toJson(menuObj));
////////System.out.println(" menu item Request String::::::::::: "+gson.toJson(menuObj));
				//result = menuProxy.addItemToMenu(gson.toJson(menuObj));
				result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("add_ItemToMenu"), gson.toJson(menuObj));
				//// log.info("Response String:::::::::::"+result);
			//	////////////System.out.println("Response String:::::::::::"+result);
				// log.info("Response String::::::::::: "+result);
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(getResponseCode("RESPONSE_SUCCESS_CODE").trim())){
					result = getResponseCode("ADD_MENU_ITEMS_SUCCESS").trim();
				}
				else{
					result = Response.getResponseMessage(result);
				}
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
			} catch(Exception e){
				e.printStackTrace();
			}
			return result;
		}

		
		/**
		 * 
		 * @author Mythri.S
		 * 
		 *This method is used to call updateMenuItems method of web service and return the response
		 *
		 **/
		public String updateMenuItems(MenuDetails menuObj,String customerId, String emailId){
			String result = null;
			try {
				// log.info("addItemToMenu");
				RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
				menuObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerId, emailId));
				//MenuProxy menuProxy = new MenuProxy();
				// log.info("Request String::::::::::::"+gson.toJson(menuObj));
				//////////System.out.println("Request String::::::::::::"+gson.toJson(menuObj));
//				// log.info("Request String::::::::::: Sended");
				//result = menuProxy.updateMenuItems(gson.toJson(menuObj));
				result = restfulConnectionObj.getResponseFromPost(AppProperties.getRESTFulCloudServiceURL("update_MenuItems"), gson.toJson(menuObj));
				// log.info("Response String:::::::::::"+result);
//				////////////System.out.println("Response String:::::::::::"+result);
//				// log.info("Response String::::::::::: Received");
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(getResponseCode("RESPONSE_SUCCESS_CODE").trim())){
					result = getResponseCode("UPDATE_MENU_ITEMS_SUCCESS").trim();
				}
				else{
					result = Response.getResponseMessage(result);
				}
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
			} catch(Exception e){
				e.printStackTrace();
			}
			return result;
		}

		
		
		/**
		 * @author Mythri.S	
		 * 
		 * This method is used to call the getMenuDetails method of web service and return the MenuDetails List
		 * 
		 */
		public List<MenuDetails> getMenuDetails(String outletName,String customerId,String emailId,String searchName,boolean search){
			String responseMessage = null;
			List<MenuDetails> menuDetailsList = null;
			try {
				// log.info("getMenuDetails");
				MenuDetails menuObj = new MenuDetails();
				menuObj.setSearchCriteria(searchName);
//				menuObj.setOutlet_name(outletName);
//				if(outletName.equals("all") || outletName.equals("")){
				List<String> myList = new ArrayList<String>(Arrays.asList(outletName.split(",")));
				menuObj.setLocationsList(myList);
//				}
//				else
//				menuObj.setOutlet_name(outletName);
				menuObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerId, emailId));
				
				menuObj.setStartIndex("0");
				if(search)
				menuObj.setMenuStatus(true);
				else
				menuObj.setMenuStatus(false);
				//menuObj.setOutlet_location(outletName);
				//MenuProxy menuProxy = new MenuProxy();
				RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
				//System.out.println("Request String:: getMenuDetails ::::::::: "+gson.toJson(menuObj));
				//// log.info("Request String::::::::::::"+gson.toJson(menuObj));
				// log.info("Request String::::::::::: "+gson.toJson(menuObj));
				//responseMessage = menuProxy.getMenuDetails(gson.toJson(menuObj));
				responseMessage = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("get_MenuDetails"), gson.toJson(menuObj), "GET");
				//// log.info("Response String:::::::::::"+responseMessage);
				///System.out.println("Response String:::::::::::"+responseMessage);
				// log.info("Response String::::::::::: "+responseMessage);
				String responseCode = Response.getResponseCode(responseMessage);
				int slNo=0;
				if(responseCode.equals(getResponseCode("RESPONSE_SUCCESS_CODE").trim())){
					String responseList = Response.getResponseList(responseMessage, "menuCategories");
					JSONArray jsonResponseArray = new JSONArray(responseList);
					menuDetailsList = new ArrayList<MenuDetails>();
					for (int i=0; i<jsonResponseArray.length(); i++) {
						menuObj = gson.fromJson(jsonResponseArray.getString(i), MenuDetails.class);
						menuObj.setSlNo(++slNo);
						menuDetailsList.add(menuObj);
					}
				}
			}catch(ConnectException ce) {
				ce.printStackTrace();
				responseMessage = getResponseCode("SERVER_NOT_RESPONDING").trim();
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				responseMessage = getResponseCode("INVALID_REQUEST").trim();
			} catch (UnknownHostException uhe) {
				uhe.printStackTrace();
				responseMessage = getResponseCode("UNKNOWN_HOST").trim();
			} catch(RemoteException rme){
				rme.printStackTrace();
				responseMessage = getResponseCode("SERVER_NOT_RESPONDING").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return menuDetailsList;
		}
		
		
		/**
		 * @author Mythri.S	
		 * 
		 * This method is used to call the getCategoryDetails method of web service and return the Menu and its Categories
		 * 
		 */
		public MenuDetails getCategoryDetails(String menu_name,String outletName,String customerId,String emailId){
			String responseMessage = null;
			@SuppressWarnings("unused")
			List<MenuDetails> menuDetailsList = null;
			MenuDetails menuObj = new MenuDetails();
			try {
				// log.info("getCategoryDetails");
				RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
				menuObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerId, emailId));
				menuObj.setOutlet_name(outletName);
				menuObj.setMenu_name(menu_name);
				menuObj.setStartIndex("-1");
				//MenuProxy menuProxy = new MenuProxy();
				//// log.info("Request String::::::::::::"+gson.toJson(menuObj));
				//System.out.println("Request String:: getCategoryDetails ::::::::::"+gson.toJson(menuObj));
				// log.info("Request String::::::::::: Sended");
				//responseMessage = menuProxy.getCategoryDetails(gson.toJson(menuObj));
				responseMessage = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_CategoryDetails"), gson.toJson(menuObj), "GET");
				// log.info("Response String:::::::::::"+responseMessage);
				//System.out.println("Response String:::::::::::"+responseMessage);
				//// log.info("Response String::::::::::: Received");
				String responseCode = Response.getResponseCode(responseMessage);
				if(responseCode.equals(getResponseCode("RESPONSE_SUCCESS_CODE").trim())){
						menuObj = gson.fromJson(responseMessage, MenuDetails.class);
						menuObj.setOutlet_name(menuObj.getOutlet_location());
						int slNo=0;
						for(int i = 0; i<menuObj.getMenuCategories().size();i++){
						      //String encodedImage = Base64.encode(menuObj.getMenu_category_details().get(i).getCategory_icon());
						     // menuObj.getMenu_category_details().get(i).setCategoryIcons(encodedImage);
						      menuObj.getMenuCategories().get(i).setSlNo(++slNo);
						      if(menuObj.getMenuCategories().get(i).getCategory_icon() != null){
						    	  String s=menuObj.getMenuCategories().get(i).getCategory_icon();
						    	  int a=menuObj.getMenuCategories().get(i).getCategory_icon().lastIndexOf("\\");
						    	  menuObj.getMenuCategories().get(i).setImgName(s.substring(a+1));
						    	  ////////////System.out.println( s.substring(a+1));
						      }
						}
				}
			}catch(ConnectException ce) {
				ce.printStackTrace();
				responseMessage = getResponseCode("SERVER_NOT_RESPONDING").trim();
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				responseMessage = getResponseCode("INVALID_REQUEST").trim();
			} catch (UnknownHostException uhe) {
				uhe.printStackTrace();
				responseMessage = getResponseCode("UNKNOWN_HOST").trim();
			} catch(RemoteException rme){
				rme.printStackTrace();
				responseMessage = getResponseCode("SERVER_NOT_RESPONDING").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return menuObj;
		}
		
		
		
		
		public MenuDetails getCategoryDetailsBasedOnCategory(String menu_name,String categoryName,String customerId,String emailId){
			String responseMessage = null;
			MenuDetails menuObj = new MenuDetails();
			try {
				// log.info("getitems");
				RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
				menuObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerId, emailId));
//				menuObj.setOutlet_name(outletName);
				menuObj.setMenu_name(menu_name);
				menuObj.setCategory_name(categoryName);
				menuObj.setStartIndex("-1");
				//MenuProxy menuProxy = new MenuProxy();
				//// log.info("Request String::::::::::::"+gson.toJson(menuObj));
				// log.info("Request String::::::::::: "+gson.toJson(menuObj));
				//System.out.println("getCategoryDetailsBasedOnCategory Request String::::::::::: "+gson.toJson(menuObj));
				//responseMessage = menuProxy.getitems(gson.toJson(menuObj));
				responseMessage = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_CategoryDetails"), gson.toJson(menuObj), "GET");
				// log.info("Response String:::::::::::"+responseMessage);
				//System.out.println("Response String:::::::::::"+responseMessage);
				//// log.info("Response String::::::::::: Received");
				String responseCode = Response.getResponseCode(responseMessage);
//				int slNo=0;
				if(responseCode.equals(getResponseCode("RESPONSE_SUCCESS_CODE").trim())){
						menuObj = gson.fromJson(responseMessage, MenuDetails.class);
						//menuObj.setOutlet_name(menuObj.getOutlet_location());
						//menuObj.setMenu_name(menuObj.getMenu_name());
						/*for(int i = 0; i<menuObj.getMenu_item_details().size();i++){
						      String encodedImage = Base64.encode(menuObj.getMenu_item_details().get(i).getItem_icon());
						      menuObj.getMenu_item_details().get(i).setItem_icons(encodedImage);
						      encodedImage = Base64.encode(menuObj.getMenu_item_details().get(i).getItem_picture1());
						      menuObj.getMenu_item_details().get(i).setItem_pictures1(encodedImage);
						      encodedImage = Base64.encode(menuObj.getMenu_item_details().get(i).getItem_picture2());
						      menuObj.getMenu_item_details().get(i).setItem_pictures2(encodedImage);
						      menuObj.getMenu_item_details().get(i).setSlNo(++slNo);
						     
						}*/
				}
			}catch(ConnectException ce) {
				ce.printStackTrace();
				responseMessage = getResponseCode("SERVER_NOT_RESPONDING").trim();
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				responseMessage = getResponseCode("INVALID_REQUEST").trim();
			} catch (UnknownHostException uhe) {
				uhe.printStackTrace();
				responseMessage = getResponseCode("UNKNOWN_HOST").trim();
			} catch(RemoteException rme){
				rme.printStackTrace();
				responseMessage = getResponseCode("SERVER_NOT_RESPONDING").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return menuObj;
		}
		
		/**
		 * @author Mythri.S	
		 * 
		 * This method is used to call the getitems method of web service and return the Menu and its items
		 * 
		 */
		public MenuDetails getitems(String menu_name,String outletName,String customerId,String emailId){
			String responseMessage = null;
			MenuDetails menuObj = new MenuDetails();
			try {
				// log.info("getitems");
				RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
				menuObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerId, emailId));
//				menuObj.setOutlet_name(outletName);
				menuObj.setMenu_name(menu_name);
				menuObj.setStartIndex("-1");
				//MenuProxy menuProxy = new MenuProxy();
				//// log.info("Request String::::::::::::"+gson.toJson(menuObj));
				// log.info("Request String::::::::::: "+gson.toJson(menuObj));
//				////////////System.out.println("get menu items Request String::::::::::: "+gson.toJson(menuObj));
				//responseMessage = menuProxy.getitems(gson.toJson(menuObj));
				responseMessage = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_CategoryDetails"), gson.toJson(menuObj), "GET");
				// log.info("Response String:::::::::::"+responseMessage);
//				////////////System.out.println("get menu  items Response String:::::::::::"+responseMessage);
				//// log.info("Response String::::::::::: Received");
				String responseCode = Response.getResponseCode(responseMessage);
//				int slNo=0;
				if(responseCode.equals(getResponseCode("RESPONSE_SUCCESS_CODE").trim())){
						menuObj = gson.fromJson(responseMessage, MenuDetails.class);
						//menuObj.setOutlet_name(menuObj.getOutlet_location());
						//menuObj.setMenu_name(menuObj.getMenu_name());
						/*for(int i = 0; i<menuObj.getMenu_item_details().size();i++){
						      String encodedImage = Base64.encode(menuObj.getMenu_item_details().get(i).getItem_icon());
						      menuObj.getMenu_item_details().get(i).setItem_icons(encodedImage);
						      encodedImage = Base64.encode(menuObj.getMenu_item_details().get(i).getItem_picture1());
						      menuObj.getMenu_item_details().get(i).setItem_pictures1(encodedImage);
						      encodedImage = Base64.encode(menuObj.getMenu_item_details().get(i).getItem_picture2());
						      menuObj.getMenu_item_details().get(i).setItem_pictures2(encodedImage);
						      menuObj.getMenu_item_details().get(i).setSlNo(++slNo);
						     
						}*/
				}
			}catch(ConnectException ce) {
				ce.printStackTrace();
				responseMessage = getResponseCode("SERVER_NOT_RESPONDING").trim();
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				responseMessage = getResponseCode("INVALID_REQUEST").trim();
			} catch (UnknownHostException uhe) {
				uhe.printStackTrace();
				responseMessage = getResponseCode("UNKNOWN_HOST").trim();
			} catch(RemoteException rme){
				rme.printStackTrace();
				responseMessage = getResponseCode("SERVER_NOT_RESPONDING").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return menuObj;
		}
	
		
		
		
		public List<String> getMenuCategoriesNames(String menu_name,String outletName,String customerId,String emailId){
			String responseMessage = null;
			List<String> menuCategoryNamesList = new ArrayList<String>();
			try {
				// log.info("getMenuCategoryNames");
				RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
				MenuDetails menuObj = new MenuDetails();
				menuObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerId, emailId));
//				menuObj.setOutlet_name(outletName);
				List<String> myList = new ArrayList<String>(Arrays.asList(outletName.split(",")));
				menuObj.setLocationsList(myList);
				menuObj.setMenu_name(menu_name);
				menuObj.setStartIndex("-1");
				//MenuProxy menuProxy = new MenuProxy();
				// log.info("Request String::::::::::::"+gson.toJson(menuObj));
				//// log.info("Request String::::::::::: Sended");
//				////////////System.out.println("menu category names Request String::::::::::::"+gson.toJson(menuObj));
				responseMessage = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_CategoryDetails"), gson.toJson(menuObj), "GET");
				//responseMessage = menuProxy.getCategoryDetails(gson.toJson(menuObj));
//				////////////System.out.println(responseMessage);
				// log.info("Response String::::::::::: Received");
				String responseCode = Response.getResponseCode(responseMessage);
				if(responseCode.equals(getResponseCode("RESPONSE_SUCCESS_CODE").trim())){
						menuObj = gson.fromJson(responseMessage, MenuDetails.class);
						for(int i = 0; i<menuObj.getMenuCategories().size();i++){
							menuCategoryNamesList.add(menuObj.getMenuCategories().get(i).getCategory_name());
						}
				}
			}catch(ConnectException ce) {
				ce.printStackTrace();
				responseMessage = getResponseCode("SERVER_NOT_RESPONDING").trim();
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				responseMessage = getResponseCode("INVALID_REQUEST").trim();
			} catch (UnknownHostException uhe) {
				uhe.printStackTrace();
				responseMessage = getResponseCode("UNKNOWN_HOST").trim();
			} catch(RemoteException rme){
				rme.printStackTrace();
				responseMessage = getResponseCode("SERVER_NOT_RESPONDING").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return menuCategoryNamesList;
		}
		
		/**
		 * @author Mythri.S	
		 * 
		 * This method is used to call the getCategoryDetails method of web service and return the list of Menu Names
		 * 
		 */
		public List<String> getMenuCategoryNames(String menu_name,String outletName,String customerId,String emailId){
			String responseMessage = null;
			List<String> menuCategoryNamesList = new ArrayList<String>();
			try {
				// log.info("getMenuCategoryNames");
				RestfulServiceConnection restfulServiceConnection = new RestfulServiceConnection();
				MenuDetails menuObj = new MenuDetails();
				menuObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerId, emailId));
				menuObj.setOutlet_name(outletName);
				menuObj.setMenu_name(menu_name);
				menuObj.setStartIndex("-1");
				//MenuProxy menuProxy = new MenuProxy();
				// log.info("Request String::::::::::::"+gson.toJson(menuObj));
				//// log.info("Request String::::::::::: Sended");
				//////////////System.out.println("Request String::::::::::::"+gson.toJson(menuObj));
				responseMessage = restfulServiceConnection.getResponse(AppProperties.getRESTFulCloudServiceURL("get_CategoryDetails"), gson.toJson(menuObj), "GET");
				//responseMessage = menuProxy.getCategoryDetails(gson.toJson(menuObj));
//				////////////System.out.println("categories response"+responseMessage);
				// log.info("Response String::::::::::: Received");
				String responseCode = Response.getResponseCode(responseMessage);
				if(responseCode.equals(getResponseCode("RESPONSE_SUCCESS_CODE").trim())){
						menuObj = gson.fromJson(responseMessage, MenuDetails.class);
						for(int i = 0; i<menuObj.getMenuCategories().size();i++){
							menuCategoryNamesList.add(menuObj.getMenuCategories().get(i).getCategory_name());
						}
				}
			}catch(ConnectException ce) {
				ce.printStackTrace();
				responseMessage = getResponseCode("SERVER_NOT_RESPONDING").trim();
			} catch (NoSuchElementException nse) {
				nse.printStackTrace();
				responseMessage = getResponseCode("INVALID_REQUEST").trim();
			} catch (UnknownHostException uhe) {
				uhe.printStackTrace();
				responseMessage = getResponseCode("UNKNOWN_HOST").trim();
			} catch(RemoteException rme){
				rme.printStackTrace();
				responseMessage = getResponseCode("SERVER_NOT_RESPONDING").trim();
			} catch(Exception e){
				e.printStackTrace();
			}
			return menuCategoryNamesList;
		}
	
		

		/**
		 * @author Mythri.S	
		 * 
		 * This method is used to call the deleteMenu method of web service and return the response
		 * 
		 */
		public String deleteMenu(String customerId,String emailId,String ids,String outlet_name){
			String result = null;
			try {
				RestfulServiceConnection restfulConnectionObj = new RestfulServiceConnection();
				MenuDetails menuObj = new MenuDetails();
				//MenuProxy menuProxy = new MenuProxy();
				String[] idsArray = ids.split(",");
				menuObj.setRequestHeader(RequestHeaderUtil.getRequestHeader(customerId, emailId));
				if(outlet_name.equals("")){
				List<String> myList = new ArrayList<String>(Arrays.asList(outlet_name.split(",")));
				menuObj.setLocationsList(myList);
				}
				else
				menuObj.setOutlet_name(outlet_name);
			
				List<String> menuList = new ArrayList<String>();
				for(int i=0;i<idsArray.length;i++)
					menuList.add(idsArray[i]);
				menuObj.setMenuNameList(menuList);
				// log.info("Request String::::::"+gson.toJson(menuObj));
//				////////////System.out.println("Request String::::::"+gson.toJson(menuObj));
				//result = menuProxy.deletemenu(gson.toJson(menuObj));
				result = restfulConnectionObj.getResponse(AppProperties.getRESTFulCloudServiceURL("delete_menu"), gson.toJson(menuObj), "GET");
				// log.info("Response String:::::"+result);
//				////////////System.out.println("Response String:::::"+result);
				String responseCode = Response.getResponseCode(result);
				if(responseCode.equals(getResponseCode("RESPONSE_SUCCESS_CODE").trim()))
					result = getResponseCode("DELETE_MENU_SUCCESS").trim();
				else if(responseCode.equals(getResponseCode("RESPONSE_FAILED_CODE").trim()))
					result = getResponseCode("DELETE_FAILED").trim();
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
			} catch(Exception e){
				e.printStackTrace();
			}
			return result;
		}
		
		
	
}

