package com.tlabs.posweb.util;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.regex.Pattern;

//import org.apache.poi.hssf.usermodel.HSSFCell;
//import org.apache.poi.hssf.usermodel.HSSFRow;
//import org.apache.poi.hssf.usermodel.HSSFSheet;
//import org.apache.poi.hssf.usermodel.HSSFWorkbook;
//import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.Row;
//import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.tlabs.posweb.beans.LocationBean;
import com.tlabs.posweb.beans.SkuPriceList;
import com.tlabs.posweb.beans.ZoneMaster;
import com.tlabs.posweb.services.GenericMasterService;

import jdk.nashorn.internal.scripts.JS;

public class Utilities {
	/**
	 * 
	 * @author Mythri
	 * This is a static method to get value for a key from "commonResources.properties" file
	 * modified by chaithanya we are not laoading common Resources file every time we are using as static files
	 * @param constantName
	 * @return value for constantName
	 */
	public static String getResponseCode(String constantName) {
		Properties propertiesObj = null;
		String constantStr = null;
		InputStream inputStreamObj = null;
		try {
			propertiesObj = new Properties();
			//inputStreamObj = Utilities.class.getClassLoader().getResourceAsStream("commonResources.properties");
			/*inputStreamObj = AppProperties.getCommonProperties();
			propertiesObj.load(inputStreamObj);
			
			constantStr = (String) propertiesObj.get(constantName);*/
			//constantStr = AppProperties.getCommonProperties().getProperty(constantName);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try{
//				propertiesObj.clear();
//				inputStreamObj.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return constantStr.trim();
	}
	
	private static boolean checkIfRowIsEmpty(Row row) {
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
	}
	
	
	
	
	/**
	 * 
	 * @author Chaithanya.V
	 * This is a static method to get values from excel files file
	 * @param excelfile
	 * @return value for Skulist
	 */
	
	public static List<SkuPriceList> getExcelData(MultipartFile excelFile) {
		DataFormatter df;
		List<SkuPriceList> skuList = null;
		Row row = null;
		Gson gson =  new Gson();
		try {
			XSSFWorkbook workBook = new XSSFWorkbook(excelFile.getInputStream());
			
			XSSFSheet skuMasterSheet = workBook.getSheetAt(0);
			//XSSFSheet skuMasterSheet = workBook.getSheet("PO FORMAT");
		
		    skuList = new ArrayList<SkuPriceList>();
		    df = new DataFormatter();
		   // System.out.println(skuMasterSheet.getLastRowNum());
		    FormulaEvaluator evaluator = workBook.getCreationHelper().createFormulaEvaluator();
		    
		
		   
		  //  System.out.println(skuMasterSheet.getLastRowNum());
		    for (int i = 1; i <= skuMasterSheet.getLastRowNum(); i++) {
				row = skuMasterSheet.getRow(i);
				SkuPriceList sku = new SkuPriceList();
				row = skuMasterSheet.getRow(i);
		    
				
                if(row.getCell(1)!=null && !row.getCell(1).equals(""))			
				sku.setSkuId(df.formatCellValue(row.getCell(1)));
             
                if(row.getCell(2)!=null && !row.getCell(2).equals(""))
				sku.setDescription(df.formatCellValue(row.getCell(2)));
                if(row.getCell(3)!=null && !row.getCell(3).equals(""))
				sku.setEan(df.formatCellValue(row.getCell(3)));
                else
                sku.setEan("");	
                if(row.getCell(4)!=null && !row.getCell(4).equals(""))
				sku.setCostPrice(Float.parseFloat(df.formatCellValue(row.getCell(4), evaluator)));
                 else
                sku.setCostPrice(0.0f);	
                if(row.getCell(5)!=null && !row.getCell(5).equals(""))
                sku.setQuantity(Float.parseFloat(df.formatCellValue(row.getCell(5), evaluator)));
                else
                sku.setQuantity(1.0f);
                if(row.getCell(6)!=null && !row.getCell(6).equals(""))
                sku.setTaxRate(Float.parseFloat(df.formatCellValue(row.getCell(6), evaluator)));
                else
                	sku.setTaxRate(0.0f);	
                if(row.getCell(7)!=null && !row.getCell(7).equals(""))
                sku.setUom(df.formatCellValue(row.getCell(7)));
				 if(row.getCell(10)!=null && !row.getCell(10).equals(""))
				sku.setColor(df.formatCellValue(row.getCell(10)));
				 if(row.getCell(11)!=null && !row.getCell(11).equals(""))
				sku.setSize(df.formatCellValue(row.getCell(11)));
				 if(row.getCell(9)!=null && !row.getCell(9).equals(""))
				sku.setMeasureRange(df.formatCellValue(row.getCell(9)));
				 else
				 sku.setMeasureRange("");	
				 if(row.getCell(8)!=null && !row.getCell(8).equals(""))
				sku.setProductRange(df.formatCellValue(row.getCell(8)));
				 else
					 sku.setProductRange(""); 
				 if(row.getCell(12)!=null && !row.getCell(12).equals(""))
				sku.setUtility(df.formatCellValue(row.getCell(15)));
				 if(row.getCell(12)!=null && !row.getCell(12).equals(""))
				sku.setCategory(df.formatCellValue(row.getCell(12)));
				 if(row.getCell(13)!=null && !row.getCell(13).equals(""))
				sku.setSubCategory(df.formatCellValue(row.getCell(13)));
				 if(row.getCell(14)!=null && !row.getCell(14).equals(""))
				sku.setBrand(df.formatCellValue(row.getCell(14)));
				 if(row.getCell(15)!=null && !row.getCell(15).equals(""))			
						sku.setPluCode(df.formatCellValue(row.getCell(15)));
				 
				
				 if(row.getCell(16)!=null && !row.getCell(16).equals(""))
						sku.setCgstRate(Float.parseFloat(df.formatCellValue(row.getCell(16),evaluator)));
				 else
					 sku.setCgstRate(0.0f); 
				 if(row.getCell(17)!=null && !row.getCell(17).equals(""))
					 sku.setSgstRate(Float.parseFloat(df.formatCellValue(row.getCell(17),evaluator)));
				 else
					 sku.setSgstRate(0.0f); 
				 if(row.getCell(18)!=null && !row.getCell(18).equals(""))
					 sku.setIgstRate(Float.parseFloat(df.formatCellValue(row.getCell(18),evaluator)));
				 else
					 sku.setIgstRate(0.0f);
				 
				  if(row.getCell(19)!=null && !row.getCell(19).equals(""))
						sku.setHsnCode(df.formatCellValue(row.getCell(19)));
				
				  sku.setMrp(0.0f);
				  sku.setSalePrice(0.0f);
				  sku.setMbq("0.0");
				  skuList.add(sku);
				
				  
				 
			}
			System.out.println("response------"+gson.toJson(skuList));
//		    }
		} catch(Exception ioe) {
		    ioe.printStackTrace();
		}
		return skuList;
	}
	
	
	//Added by vijay
	public static List<String> getLocationsBasedOnZone(String zone, String  customerIdStr, String emailIdStr)
	{
		List<String> locationsList= new ArrayList<String>();
		
		if (zone != null && !zone.trim().equals("")) {
			List<ZoneMaster> zonesList = new GenericMasterService().getZones(zone, customerIdStr, emailIdStr, "0", "",
					"");
			for (String zoneId : zonesList.get(0).getZones()) {
				String zoneStrList[] = zoneId.split(Pattern.quote("+"));
				zoneId = zoneStrList[0];
				locationsList.add(zoneId);
			}
		}
		return locationsList ;
	}
	
	
	
	public static ArrayList<LocationBean> getLocationsOnZone(String zone, String customerIdStr,String emailIdStr, String bussinessActivity)
	{
		ArrayList<LocationBean> locationDetails = new ArrayList<LocationBean>();
		if(zone == null || zone.equals(""))
			locationDetails = new GenericMasterService().getLocationDetails("",customerIdStr, emailIdStr,"-1","Retail Outlet",false,true,false);
			else
			{
				List<ZoneMaster> zoneList = new GenericMasterService().getZonalLocationBasedonZone(zone, customerIdStr, emailIdStr, "0","","","Retail Outlet");
				LocationBean saleLocation = null;
				/*if(zoneList != null && zoneList.get(0).getZoneDetails() != null && zoneList.get(0).getZoneDetails().size()>0)
					for(ZoneDetails zoneItems : zoneList.get(0).getZoneDetails() )
					{
						saleLocation = new LocationBean(); 
						saleLocation.setLocationId(zoneItems.getLocation());
						locationBeansList.add(saleLocation);
					}
				else*/
				for(String zoneItems : zoneList.get(0).getZones() )
				{
					String zoneArray[] = zoneItems.split("\\+");
					saleLocation = new LocationBean(); 
					if(zoneArray != null && zoneArray.length>0)
					{
						saleLocation.setLocationId(zoneArray[0]);
						if(zoneArray.length > 1)
						saleLocation.setBusinessActivity(zoneArray[1]);
						if(zoneArray.length > 2)
						saleLocation.setDescription(zoneArray[2]);
						locationDetails.add(saleLocation);
					} 
				}
			
			}
		return locationDetails;
	}
	
	

	public static List<SkuPriceList> getStockissueExcelData(MultipartFile excelFile) {
		DataFormatter df;
		List<SkuPriceList> skuList = null;
		Row row = null;
		try {
			XSSFWorkbook workBook = new XSSFWorkbook(excelFile.getInputStream());
			XSSFSheet skuMasterSheet = workBook.getSheetAt(0);
			//XSSFSheet skuMasterSheet = workBook.getSheet("PO FORMAT");
		
		    skuList = new ArrayList<SkuPriceList>();
		    df = new DataFormatter();
		   // System.out.println(skuMasterSheet.getLastRowNum());
		    FormulaEvaluator evaluator = workBook.getCreationHelper().createFormulaEvaluator();
		    
		
		    
		   
		  //  System.out.println(skuMasterSheet.getLastRowNum());
		    for (int i = 1; i <= skuMasterSheet.getLastRowNum(); i++) {
				row = skuMasterSheet.getRow(i);
				SkuPriceList sku = new SkuPriceList();
				row = skuMasterSheet.getRow(i);
		    	
				
                if(row.getCell(1)!=null && !row.getCell(1).equals(""))			
                	sku.setSkuId(df.formatCellValue(row.getCell(1)));
                
                if(row.getCell(2)!=null && !row.getCell(2).equals(""))			
    				sku.setHsnCode(df.formatCellValue(row.getCell(2)));
                
                if(row.getCell(3)!=null && !row.getCell(3).equals(""))
                	sku.setDescription(df.formatCellValue(row.getCell(3)));
                	
                if(row.getCell(4)!=null && !row.getCell(4).equals(""))
                	sku.setUom((df.formatCellValue(row.getCell(4), evaluator)));
               	
                if(row.getCell(5)!=null && !row.getCell(5).equals(""))
                	sku.setCostPrice(Float.parseFloat(df.formatCellValue(row.getCell(5), evaluator)));
                else
                	sku.setCostPrice(0.0f);
                
                if(row.getCell(6)!=null && !row.getCell(6).equals(""))
                	sku.setReqQuantity(Float.parseFloat(df.formatCellValue(row.getCell(6), evaluator)));
                else
                	sku.setReqQuantity(0.0f);	
                
                if(row.getCell(7)!=null && !row.getCell(7).equals(""))
                    sku.setQuantity(Float.parseFloat(df.formatCellValue(row.getCell(7), evaluator)));
                 else
                    sku.setQuantity(0.0f);	
                
                if(row.getCell(8)!=null && !row.getCell(8).equals(""))
                    sku.setActuvalQuantity(Float.parseFloat(df.formatCellValue(row.getCell(8), evaluator)));
                 else
                    sku.setActuvalQuantity(0.0f);	
                
                if(row.getCell(9)!=null && !row.getCell(9).equals(""))
                	sku.setSalePrice(Float.parseFloat(df.formatCellValue(row.getCell(9), evaluator)));
                else
                	sku.setSalePrice(0.0f);
                
               
				if(row.getCell(10)!=null && !row.getCell(10).equals(""))
					sku.setColor(df.formatCellValue(row.getCell(10)));
				
				if(row.getCell(11)!=null && !row.getCell(11).equals(""))
					 sku.setSize(df.formatCellValue(row.getCell(11)));
				
				 if(row.getCell(12)!=null && !row.getCell(12).equals(""))
					 sku.setMeasureRange(df.formatCellValue(row.getCell(12)));
				 else
					 sku.setMeasureRange("");	
				 
				 if(row.getCell(13)!=null && !row.getCell(13).equals(""))
					 sku.setProductRange(df.formatCellValue(row.getCell(13)));
				 else
					 sku.setProductRange(""); 
				 
				 if(row.getCell(14)!=null && !row.getCell(14).equals(""))
					 sku.setUtility(df.formatCellValue(row.getCell(14)));
				 
				 if(row.getCell(15)!=null && !row.getCell(15).equals(""))
					 sku.setCategory(df.formatCellValue(row.getCell(15)));
				 
				 if(row.getCell(16)!=null && !row.getCell(16).equals(""))
					 sku.setSubCategory(df.formatCellValue(row.getCell(16)));
				 
				 if(row.getCell(17)!=null && !row.getCell(17).equals(""))
					 sku.setBrand(df.formatCellValue(row.getCell(17)));
				 
				 if(row.getCell(18)!=null && !row.getCell(18).equals(""))			
					sku.setPluCode(df.formatCellValue(row.getCell(18)));
				 
				skuList.add(sku);
				
               
			}
//		    }
		} catch(Exception ioe) {
		    ioe.printStackTrace();
		}
		Gson gson = new Gson();
		System.out.println(gson.toJson(skuList));
		return skuList;
	}
	
	
	public static List<SkuPriceList> getExcelDataForOffers(MultipartFile excelFile) {
		DataFormatter df;
		List<SkuPriceList> skuList = null;
		Row row = null;
		try {
			XSSFWorkbook workBook = new XSSFWorkbook(excelFile.getInputStream());
			XSSFSheet skuMasterSheet = workBook.getSheetAt(0);

		    skuList = new ArrayList<SkuPriceList>();
		    df = new DataFormatter();
		  
		    FormulaEvaluator evaluator = workBook.getCreationHelper().createFormulaEvaluator();
		    
		   
		    for (int i = 1; i <= skuMasterSheet.getLastRowNum(); i++) {
				row = skuMasterSheet.getRow(i);
				SkuPriceList sku = new SkuPriceList();
				row = skuMasterSheet.getRow(i);

                if(row.getCell(1)!=null && !row.getCell(1).equals(""))			
				sku.setSkuId(df.formatCellValue(row.getCell(1)));
             
                if(row.getCell(2)!=null && !row.getCell(2).equals(""))
                	sku.setPluCode(df.formatCellValue(row.getCell(2)));
                
                if(row.getCell(3)!=null && !row.getCell(3).equals(""))
				sku.setOfferType(df.formatCellValue(row.getCell(3)));
                else
                sku.setOfferType("fixed_rate");
                
                if(row.getCell(4)!=null && !row.getCell(4).equals(""))
    				sku.setOfferValue(df.formatCellValue(row.getCell(4)));
                if(row.getCell(5)!=null && !row.getCell(5).equals(""))
    				sku.setQuantity(Float.valueOf(df.formatCellValue(row.getCell(5))));
                
                
                skuList.add(sku);
			}

		} catch(Exception ioe) {
		    ioe.printStackTrace();
		}
		return skuList;
	}
	
	
	public static List<SkuPriceList> getExcelDataForDeals(MultipartFile excelFile) {
		DataFormatter df;
		List<SkuPriceList> skuList = null;
		Row row = null;
		try {
			XSSFWorkbook workBook = new XSSFWorkbook(excelFile.getInputStream());
			XSSFSheet skuMasterSheet = workBook.getSheetAt(0);

		    skuList = new ArrayList<SkuPriceList>();
		    df = new DataFormatter();
		  
		    FormulaEvaluator evaluator = workBook.getCreationHelper().createFormulaEvaluator();
		    
		    for (int i = 1; i <= skuMasterSheet.getLastRowNum(); i++) {
				row = skuMasterSheet.getRow(i);
				SkuPriceList sku = new SkuPriceList();

                if(row.getCell(1)!=null && !row.getCell(1).equals(""))			
                	sku.setSkuId(df.formatCellValue(row.getCell(1)));
             
                if(row.getCell(2)!=null && !row.getCell(2).equals(""))
                	sku.setPluCode(df.formatCellValue(row.getCell(2)));
                
                if(row.getCell(3)!=null && !row.getCell(3).equals(""))
                	sku.setSaleQty(Float.parseFloat(df.formatCellValue(row.getCell(3))));
                else
                	sku.setSaleQty(0.0f);
                
                if(row.getCell(4)!=null && !row.getCell(4).equals(""))			
    				sku.setDealSkuId(df.formatCellValue(row.getCell(4)));
                 
                if(row.getCell(5)!=null && !row.getCell(5).equals(""))
                    sku.setDealPluCode(df.formatCellValue(row.getCell(5)));
                    
                if(row.getCell(6)!=null && !row.getCell(6).equals(""))
    				sku.setDealQty(Float.valueOf(df.formatCellValue(row.getCell(6))));
                else
                	sku.setDealQty(0.0f);
                
                skuList.add(sku);
			}

		} catch(Exception ioe) {
		    ioe.printStackTrace();
		}
		return skuList;
	}
	
	
	public List<SkuPriceList> getExcelDataforGRNupdate(MultipartFile excelFile,List<Integer> headerList) {
		DataFormatter df;
		List<SkuPriceList> skuList = null;
		Row row = null;
		
		try {
			XSSFWorkbook workBook = new XSSFWorkbook(excelFile.getInputStream());
			
			XSSFSheet skuMasterSheet = workBook.getSheetAt(0);
			//XSSFSheet skuMasterSheet = workBook.getSheet("PO FORMAT");
		
		    skuList = new ArrayList<SkuPriceList>();
		    df = new DataFormatter();
		    System.out.println(skuMasterSheet.getLastRowNum());
		    FormulaEvaluator evaluator = workBook.getCreationHelper().createFormulaEvaluator();
		    
		   
		    System.out.println(skuMasterSheet.getLastRowNum());
		    for (int i = 1; i <= skuMasterSheet.getLastRowNum(); i++) {
				row = skuMasterSheet.getRow(i);
				SkuPriceList sku = new SkuPriceList();
				row = skuMasterSheet.getRow(i);
		    
                if(row.getCell(headerList.get(0))!=null && !row.getCell(headerList.get(0)).equals(""))			
				sku.setSkuId(df.formatCellValue(row.getCell(headerList.get(0))));
               
                if(row.getCell(headerList.get(1))!=null && !row.getCell(headerList.get(1)).equals(""))			
    				sku.setCostPrice(Float.parseFloat(df.formatCellValue(row.getCell(headerList.get(1)))));
                
                if(row.getCell(headerList.get(2))!=null && !row.getCell(headerList.get(2)).equals(""))			
    				sku.setQuantity(Float.parseFloat(df.formatCellValue(row.getCell(headerList.get(2)))));
                
                if(row.getCell(headerList.get(3))!=null && !row.getCell(headerList.get(3)).equals(""))			
    				sku.setTaxCode(df.formatCellValue(row.getCell(headerList.get(3))));
                
                if(row.getCell(headerList.get(4))!=null && !row.getCell(headerList.get(4)).equals(""))			
    				sku.setHsnCode(df.formatCellValue(row.getCell(headerList.get(4))));
				
				  /*sku.setMrp(0.0f);
				  sku.setSalePrice(0.0f);
				  sku.setMbq("0.0");*/
                
				  skuList.add(sku);
				
			}
			//System.out.println("response------"+new Gson().toJson(skuList));
//		    }
		} catch(Exception ioe) {
		    ioe.printStackTrace();
		}
		return skuList;
	}

	
	
}
