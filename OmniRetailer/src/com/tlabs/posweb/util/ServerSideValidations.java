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

//import java.util.Iterator;

import org.apache.log4j.Logger;
//import org.apache.poi.hssf.usermodel.HSSFSheet;
//import org.apache.poi.hssf.usermodel.HSSFWorkbook;
//import org.apache.poi.ss.usermodel.Cell;
//import org.apache.poi.ss.usermodel.DataFormatter;
//import org.apache.poi.ss.usermodel.Row;
//import org.apache.poi.ss.usermodel.Sheet;
//import org.apache.poi.ss.usermodel.Workbook;
//import org.apache.poi.xssf.usermodel.XSSFSheet;
//import org.apache.poi.xssf.usermodel.XSSFWorkbook;
//import org.springframework.web.multipart.MultipartFile;
//
//import com.tlabs.posweb.beans.Assement;
import com.tlabs.posweb.beans.ChangePasswordForm;


import com.tlabs.posweb.beans.UserDetails;
import com.tlabs.posweb.beans.LoginForm;

/* *
 * This class is used for performing validations for form @ server side level
 * 
 */
public class ServerSideValidations {

	private static Logger log = Logger.getLogger(ServerSideValidations.class);
	private String status="",mailFormat,passwordFormat,emailStr,passwordStr,newPassStr,confPassSrr;
	private String firstName,lastName,contactOffice,contactPersonal;
	
	
	public ServerSideValidations(){
		mailFormat = "^\\w+([\\.-]?\\w+)*@\\w+([\\.-]?\\w+)*(\\.\\w{2,3})+$";
		passwordFormat = "^((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{6,20})$";
	}
	
	public String loginForm(LoginForm loginForm) throws Exception{
		log.info("Server-Side:::Login Form Validations");
		emailStr = loginForm.getEmailId();
		passwordStr = loginForm.getPassword();
		if((emailStr!="")&&(passwordStr!="")){
			if(!emailStr.matches(mailFormat)){
				status = Constants.EMAIL_FORMAT_MSG;
			}else if(!passwordStr.matches(passwordFormat)){
				status = Constants.PASSWORD_FORMAT_MSG;
			}else{
				status = Constants.SUCCESS;
			}
		}else{
			if(emailStr==""){
				status = Constants.EMAIL_REQUIRED;
			}else{
				status = Constants.PASSWORD_REQUIRED;
			}
		}
		return status;
	}
	
	
	public String changePasswordForm(ChangePasswordForm changePasswordForm) throws Exception{
		log.info("Server-Side:::change Password Form Validations");
		passwordStr = changePasswordForm.getPassword();
		newPassStr = changePasswordForm.getNewPassword();
		confPassSrr = changePasswordForm.getConfirmPassword();
		if((passwordStr != "")&&(newPassStr != "")&&(confPassSrr != "")){
			if(!passwordStr.matches(passwordFormat)){
				status = Constants.PASSWORD_FORMAT_MSG;
			}
			else if(!newPassStr.matches(passwordFormat)){
				status = Constants.PASSWORD_FORMAT_MSG;
			}
			else if(! newPassStr.equals(confPassSrr)){
				status = Constants.PASSWORD_MISMATCH;
			}
			else{
				status = Constants.SUCCESS;
			}
		}else{
			if(passwordStr == ""){
				status = Constants.PASSWORD_REQUIRED;
			}
			else if(newPassStr == ""){
				status = Constants.NEW_PASSWORD_REQUIRED;
			}
			else{
				status = Constants.CONFIRM_PASSWORD_REQUIRED;
			}
		}
		return status;
	}
	
	public String newUserForm(UserDetails userDetails) throws Exception{
		log.info("Server-Side:::New User Form Validations");
		firstName = userDetails.getFirstName();
		lastName = userDetails.getLastName();
		emailStr = userDetails.getEmail();
		passwordStr = userDetails.getPassword();
		confPassSrr = userDetails.getConfirmPassword();
		contactOffice = userDetails.getContactOffice();
		contactPersonal = userDetails.getContactPersonnel();
		if(firstName == "")
			return status = Constants.FIRST_NAME_REQUIRED;
		if(lastName == "")
			return status = Constants.LAST_NAME_REQUIRED;
		if(emailStr == "")
			return status = Constants.EMAIL_REQUIRED;
		if(passwordStr == "")
			return status = Constants.PASSWORD_REQUIRED;
		if(confPassSrr == "")
			return status = Constants.CONFIRM_PASSWORD_REQUIRED;
		if(contactOffice == "")
			return status = Constants.CONTACT_OFFICE_REQUIRED;
		if(contactPersonal == "")
			return status = Constants.CONTACT_PERSONAL_REQUIRED;
		if(!passwordStr.matches(passwordFormat))
			return status = Constants.PASSWORD_FORMAT_MSG;
		if(!passwordStr.equals(confPassSrr))
			return	status = Constants.PASSWORD_MISMATCH;
		else
			return	status = Constants.SUCCESS;
			
	}
	

	
	/*public String excelFormValidation(MultipartFile excelFile) throws Exception{
		DataFormatter df;
		Row row = null;
		Cell cell = null;
		XSSFWorkbook workBook = new XSSFWorkbook(excelFile.getInputStream());
        XSSFSheet skuMasterSheet = workBook.getSheetAt(1);
        XSSFSheet skumasterSheet1 = workBook.getSheetAt(0);
      //  System.out.println(skumasterSheet1.getSheetName());
       // int rowNumber=skuMasterSheet.getFirstRowNum()+1;
       // System.out.println(skuMasterSheet.getFirstRowNum());
      
        
//        if(row==null){
//        return status = "add atleast one location";
//        }
      for (int i = 1; i <= skuMasterSheet.getLastRowNum(); i++) {
    	  
		row = skuMasterSheet.getRow(i);
		
	//	System.out.println(skuMasterSheet.getRow(1));
	 boolean rowCheck =  checkIfRowIsEmpty(row);
		
		//System.out.println(row);
		System.out.println("cxf"+row.getCell(1));
	
		//Cell c = row.getCell(1);
		Cell c= row.getCell(1);
		
		
	if(rowCheck == false)	
	{
		if (c.getStringCellValue().equals(""))
        {
		 
			return status = Constants.LOCATION_IS_REQUIRED;
			
        }
        else
        {
       	status = Constants.SUCCESS;
      
        }
        }
	else
	{
		if(i==1)
			return status = "add atleast one location";
		else
		break;
		
	}
	}
//System.out.println("status"+status);
	return status;
}

	
	private boolean checkIfRowIsEmpty(Row row) {
	    if (row == null) {
	        return true;
	    }
	    if (row.getLastCellNum() <= 0) {
	        return true;
	    }
	    for (int cellNum = 1; cellNum < row.getLastCellNum(); cellNum++) {
	        Cell cell = row.getCell(cellNum);
	        if (cell != null && cell.getCellType() != Cell.CELL_TYPE_BLANK ) {
	            return false;
	        }
	    }
	    return true;
	}*/
}