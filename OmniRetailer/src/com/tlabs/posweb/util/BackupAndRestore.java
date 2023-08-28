package com.tlabs.posweb.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
//import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Properties;



public class BackupAndRestore {
	 private int STREAM_BUFFER = 512000;
	 
	 public static String getResponseCode(String constantName) {
			Properties properties = null;
			String constant = null;
			InputStream inputStream = null;
			try {
				properties = new Properties();
				inputStream = BackupAndRestore.class.getClassLoader().getResourceAsStream("database.properties");
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
	 
	 //using log file taking incremental backup
	 public String incrementalBackupForDB(String dbName, String dbUserName, String dbPassword, String destFilePath,String logFileName){
	    	boolean status = false;
	    	destFilePath = "D:/"+destFilePath +"/"+dbName;
			File files = new File(destFilePath);
			if (!files.exists()) {
				if (files.mkdir()) {
					//System.out.println("Directory is created!");
				} else {
					//System.out.println("Failed to create directory!");
				}
			}
	    	DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
	    	Date date = new Date();
	    	String currentFileName = dateFormat.format(date) + ".sql";
	    	destFilePath = destFilePath + "/" + currentFileName;
	    	//System.out.println("******* "+destFilePath+" *******************");
	    	String executeCmd = "\"C:/Program Files/MySQL/MySQL Server 6.0/bin/mysqlbinlog\" \"C:/Program Files/MySQL/MySQL Server 6.0/data/binlog/"+logFileName+"\" --database="+dbName;
	    	System.err.println(executeCmd);
	    	 StringBuilder dumpdata = new StringBuilder();
	         try {
	         	 Process process = Runtime.getRuntime().exec(executeCmd);
	              //System.out.println(destFilePath);
	              InputStream in = process.getInputStream();
	              BufferedReader br = new BufferedReader(new InputStreamReader(in));
	              File filedst = new File(destFilePath);
	              FileOutputStream dest = new FileOutputStream(filedst);
	              int count;
	              char[] cbuf = new char[STREAM_BUFFER];
	              // Read datastream
	              while ((count = br.read(cbuf, 0, STREAM_BUFFER)) != -1) {
	              	
	                  dumpdata.append(cbuf, 0, count);
	                  dest.write(dumpdata.toString().getBytes());
	                  dumpdata.setLength(0);
	              }
	             int processComplete = process.waitFor();
	             if (processComplete == 0) {
	                 //System.out.println("Backup created successfully");
	                 status = true;
	             } else {
	                 //System.out.println("Could not create the backup");
	             }
	             br.close();
	             in.close();
	             dest.close();
	         } catch (Exception ex) {
	             ex.printStackTrace();
	         }
	         if(status)
	        	 return currentFileName;
	         else
	        	 return "Failed to create Backup";
	    }
	    
	 	// using mysqldump taking absolute backup
	    public String absoluteBackupForDB(String dbName, String dbUserName, String dbPassword, String destFilePath){
	    	boolean status = false;
	    	destFilePath = "D:/"+destFilePath +"/"+dbName;
			File files = new File(destFilePath);
			//if the folder does not exist, then create a folder.
			if (!files.exists()) {
				if (files.mkdir()) {
					//System.out.println("Directory is created!");
				} else {
					//System.out.println("Failed to create directory!");
				}
			}
	    	String currentFileName = new SimpleDateFormat("dd-MM-yyyy").format(new Date())+"_abs.sql";
	    	destFilePath = destFilePath + "/" +currentFileName;
	    	//System.out.println("******* "+destFilePath+" *******************");
	    	String executeCmd = "\"C:/Program Files/MySQL/MySQL Server 6.0/bin/mysqldump\"  -u " + dbUserName + " -p" + dbPassword + " --add-drop-database -B "+dbName;
	    	System.err.println(executeCmd);
	    	 StringBuilder dumpdata = new StringBuilder();
	         try {
	         	 Process process = Runtime.getRuntime().exec(executeCmd);
	              InputStream in = process.getInputStream();
	              BufferedReader br = new BufferedReader(new InputStreamReader(in));
	              File filedst = new File(destFilePath);
	              FileOutputStream dest = new FileOutputStream(filedst);
	              int count;
	              char[] cbuf = new char[STREAM_BUFFER];
	              // Read datastream
	              while ((count = br.read(cbuf, 0, STREAM_BUFFER)) != -1) {
	                  dumpdata.append(cbuf, 0, count);
	                  dest.write(dumpdata.toString().getBytes());
	                  dumpdata.setLength(0);
	              }
	             int processComplete = process.waitFor();
	             if (processComplete == 0) {
	                 //System.out.println("Backup created successfully");
	                 //When absolute backup taken, all other files are deleted.
	                 String fileName;
	                 File[] listOfFiles = files.listFiles(); 
	                 for (int i = 0; i < listOfFiles.length; i++){
	                     if (listOfFiles[i].isFile()){
	                    	 fileName = listOfFiles[i].getName();
	                         if(!fileName.equalsIgnoreCase(currentFileName)){
	                             boolean issuccess=new File(listOfFiles[i].toString()).delete();
	                             System.err.println("Deletion Success "+issuccess);
	                         }
	                     }
	                 }
	                 status = true;
	             } else {
	                 //System.out.println("Could not create the backup");
	             }
	             br.close();
	             in.close();
	             dest.close();
	         } catch (Exception ex) {
	             ex.printStackTrace();
	         }
	         if(status)
	        	 return currentFileName;
	         else
	        	 return "Failed to create Backup";
	    }
	    
	    public boolean restoreDB(String dbName, String dbUserName, String dbPassword, String sourceDirectory) {
	    	boolean status = false;
	    	/*Connection connectionObj = getConnection();
	    	Statement statementObj;
			try {
				statementObj = connectionObj.createStatement();
				String sql = "DROP DATABASE "+dbName;
				statementObj.executeUpdate(sql);
				//System.out.println("database deleted");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try{
				statementObj = connectionObj.createStatement();
				String sql = "create database "+dbName;
				statementObj.executeUpdate(sql);
				//System.out.println("database created");
			}catch(Exception exception){
				exception.printStackTrace();
			}*/
//			List<String> fileNames = getSortedFileNames(sourceDirectory);
	    	List<String> fileNames = new ArrayList<String>();
	    	fileNames.add("abc.sql");
			//System.out.println(fileNames.size());
			
			for (int i = 0; i < fileNames.size(); i++) {
				//System.out.println(fileNames.get(i));
				 String[] executeCmd = new String[]{"\"C:/Program Files/MySQL/MySQL Server 6.0/bin/mysql\"", "--user=" + dbUserName, "--password=" + dbPassword, dbName,"-e", "source "+sourceDirectory+"/"+fileNames.get(i)};
				Process runtimeProcess;
				try {
					runtimeProcess = Runtime.getRuntime().exec(executeCmd);
					int processComplete = runtimeProcess.waitFor();
					if (processComplete == 0) {
						//System.out.println("Backup restored successfully");
						status = true;
					} else {
						//System.out.println("Could not restore the backup");
					}
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
	 
	        return status;
	    }
	    
	    public static Connection getConnection(){
	    	Connection conn = null;
	    	try{
	    		//System.out.println(getResponseCode("jdbc.driverClassName"));
	    		Class.forName(getResponseCode("jdbc.driverClassName"));
	    		conn = DriverManager.getConnection(getResponseCode("jdbc.url"), getResponseCode("jdbc.username"), getResponseCode("jdbc.password"));
	    		if(conn != null){
	    			//System.out.println("Connected");
	    		}
	    		else{
	    			//System.out.println("Not Connected");
	    		}
	    	}catch(Exception exception){
	    		exception.printStackTrace();
	    	}
	    	return conn;
	    }
	    public static void main(String[] args) {
	    	BackupAndRestore b = new BackupAndRestore();
//	    	b.incrementalBackupForDB("emp", "root", "root", "backup", "bin-log.000002");
//	    	b.getSortedFileNames("D:/backup");
	    	b.restoreDB("emp", "root", "root", "D:/backup");
		}
	    
	    public List<String> getSortedFileNames(String sourceDirectory){
	    	List<String> fileNamesList = new ArrayList<String>();
	    	try{
		    	File files = new File(sourceDirectory);
				File[] listOfFiles = files.listFiles(); 
				SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
				List<Date> datesList = new ArrayList<Date>();
	            for (int i = 0; i < listOfFiles.length; i++){
	                if (listOfFiles[i].isFile()){
	               	  	String fileName = listOfFiles[i].getName();
	                    if(!fileName.contains("_abs")){
	                    	Date date = sdf.parse(fileName);
	                    	datesList.add(date);
	                    }else{
	                    	fileNamesList.add(fileName);
	                    }
	                }
	            }
	            Collections.sort(datesList);
	            DateFormat formatter = new SimpleDateFormat("E MMM dd HH:mm:ss Z yyyy");
	            for (int i = 0; i < datesList.size(); i++){
					Calendar cal = Calendar.getInstance();
					cal.setTime(formatter.parse(datesList.get(i).toString()));
					String formatedDate = cal.get(Calendar.DATE) + "-" + (cal.get(Calendar.MONTH) + 1) + "-" + cal.get(Calendar.YEAR);
					//System.out.println("formatedDate : " + formatedDate);
					fileNamesList.add(formatedDate+".sql");
	            }
//	            for(String str: fileNamesList)
	            	//System.out.println(str);
	    	}catch(Exception exception){
	    		exception.printStackTrace();
	    	}
	    	return fileNamesList;
	    }
	    
	    
}
