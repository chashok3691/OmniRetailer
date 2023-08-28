/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tlabs.posweb.util;

import java.io.*;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

//import org.apache.//log4j.PropertyConfigurator;

//import org.apache.//log4j.//logger;
//import org.apache.//log4j.PropertyConfigurator;

/**
 * @author kalyankumar
 *
 */
public class MySqlBackupWorking {

    private int STREAM_BUFFER = 512000;
//    private boolean status = false;
//    initializing the ////logger  
//    static //logger //log = //logger.get//logger(MySqlBackup.class.getName());

    /**
     * This method is used for backup the mysql database
     *
     * @param host - hostname - 10.10.0.5:80/127.0.0.1
     * @param port - 3306
     * @param user - username
     * @param password - password
     * @param db - database name
     * @param backupfile - file path to backup from the current location ex/
     * "/backup/"
     * @param mysqlDumpExePath - file path to mysqldump.exe from the current
     * location ex/ copy the mysqldump.exe from mysql bin in to backup folder
     * and set the path as backup ex/ "/backup/mysqldump.exe"
     * @return the status of the backup true/false
     */
    public boolean backupDatabase(String host, String port, String user, String password, String db, String backupfile, String mysqlDumpExePath) {
    	boolean status = false;
        try {
        	String path = MySqlBackupWorking.class.getClassLoader().getResource("").getPath()+backupfile;
    		path = path.replace("%20", " ");
    		File files = new File(path);
    		if (!files.exists()) {
    			if (files.mkdir()) {
    				//System.out.println("Directory is created!");
    			} else {
    				//System.out.println("Failed to create directory!");
    			}
    		}
        	// Compose full path, create a filename as you wish
        	DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        	Date date = new Date();
        	String filepath = path  + db + "-(" + dateFormat.format(date) + ").sql";
            getServerDumpData(host, port, user, password, db, mysqlDumpExePath,filepath);
            //check the backup dump
            if (status) {
                //System.out.println("Backup created successfully for - " + db + " " + host);
            } else {
                //when status false  
            	System.err.println("Could not create the backup for - " + db + " " + host);
            }

        } catch (Exception ex) {
            //log.error(ex, ex.getCause());
        }

        return status;
    }

    private String getServerDumpData(String host, String port, String user, String password, String db, String mysqlDumpExePath,String filepath) {
    	boolean status = false;
        StringBuilder dumpdata = new StringBuilder();
        String execlient = "";
        try {
            if (host != null && user != null && password != null && db != null) {
            	execlient = mysqlDumpExePath;
                /*String command[] = new String[]{execlient,
                    "--host=" + host,
                    "--port=" + port,
                    "--user=" + user,
                    "--password=" + password,
                    "--skip-comments",
                    "--databases",
                    db};*/
                String executeCmd = "D:/mysqldump -u " + user + " -p" + password + " --add-drop-database -B " + db;
                // Run mysqldump
//                ProcessBuilder pb = new ProcessBuilder(executeCmd);
//                Process process = pb.start();
                Process process = Runtime.getRuntime().exec(executeCmd);
                //System.out.println(filepath);
                InputStream in = process.getInputStream();
                BufferedReader br = new BufferedReader(new InputStreamReader(in));
                File filedst = new File(filepath);
                FileOutputStream dest = new FileOutputStream(filedst);
               
                int count;
                char[] cbuf = new char[STREAM_BUFFER];

                // Read datastream
                while ((count = br.read(cbuf, 0, STREAM_BUFFER)) != -1) {
                	
                    dumpdata.append(cbuf, 0, count);
                    dest.write(dumpdata.toString().getBytes());
                    dumpdata.setLength(0);
                }
                
                //set the status
                int processComplete = process.waitFor();
                if (processComplete == 0) {                   
                    status = true;
                } else {
                    status = false;
                }
                // Close
                br.close();
                in.close();
                dest.close();
            }

        } catch (Exception ex) {
        	ex.printStackTrace();
            //log.error(ex, ex.getCause());
            return "";
        }
        return dumpdata.toString();
    }

    public boolean backupDataWithOutDatabase(String dumpExePath, String host, String port, String user, String password, String database, String backupPath) {
        boolean status = false;
        try {
            Process p = null;

            DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
            Date date = new Date();
            String filepath = "backup(without_DB)-" + database + "-" + host + "-(" + dateFormat.format(date) + ").sql";

            String batchCommand = "";
            if (password != "") {
                //only backup the data not included create database
                batchCommand = dumpExePath + " -h " + host + " --port " + port + " -u " + user + " --password=" + password + " " + database + " -r \"" + backupPath + "" + filepath + "\"";
            } else {
                batchCommand = dumpExePath + " -h " + host + " --port " + port + " -u " + user + " " + database + " -r \"" + backupPath + "" + filepath + "\"";
            }

            Runtime runtime = Runtime.getRuntime();
            p = runtime.exec(batchCommand);
            int processComplete = p.waitFor();

            if (processComplete == 0) {
                status = true;
                //log.info("Backup created successfully for without DB " + database + " in " + host + ":" + port);
            } else {
                status = false;
                //log.info("Could not create the backup for without DB " + database + " in " + host + ":" + port);
            }

        } catch (IOException ioe) {
            //log.error(ioe, ioe.getCause());
        } catch (Exception e) {
            //log.error(e, e.getCause());
        }
        return status;
    }

    public boolean backupDataWithDatabase(String dumpExePath, String host, String port, String user, String password, String database, String backupPath) {
        boolean status = false;
        try {
            Process p = null;

            DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
            Date date = new Date();
            String filepath = "backup(with_DB)-" + database + "-" + host + "-(" + dateFormat.format(date) + ").sql";

            String batchCommand = "";
            if (password != "") {
                //Backup with database
                batchCommand = dumpExePath + " -h " + host + " --port " + port + " -u " + user + " --password=" + password + " --add-drop-database -B " + database + " -r \"" + backupPath + "" + filepath + "\"";
            } else {
                batchCommand = dumpExePath + " -h " + host + " --port " + port + " -u " + user + " --add-drop-database -B " + database + " -r \"" + backupPath + "" + filepath + "\"";
            }

            Runtime runtime = Runtime.getRuntime();
            p = runtime.exec(batchCommand);
            int processComplete = p.waitFor();


            if (processComplete == 0) {
                status = true;
                //log.info("Backup created successfully for with DB " + database + " in " + host + ":" + port);
            } else {
                status = false;
                //log.info("Could not create the backup for with DB " + database + " in " + host + ":" + port);
            }

        } catch (IOException ioe) {
            //log.error(ioe, ioe.getCause());
        } catch (Exception e) {
            //log.error(e, e.getCause());
        }
        return status;
    }

    public boolean backupAllDatabases(String dumpExePath, String host, String port, String user, String password, String backupPath) {
        boolean status = false;
        try {
            Process p = null;

            DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
            Date date = new Date();
            String filepath = "backup(with_DB)-All-" + host + "-(" + dateFormat.format(date) + ").sql";

            String batchCommand = "";
            if (password != "") {
                //Backup with database
                batchCommand = dumpExePath + " -h " + host + " --port " + port + " -u " + user + " --password=" + password + " --add-drop-database -A  -r \"" + backupPath + "" + filepath + "\"";
            } else {
                batchCommand = dumpExePath + " -h " + host + " --port " + port + " -u " + user + " --add-drop-database -A  -r \"" + backupPath + "" + filepath + "\"";
            }

            Runtime runtime = Runtime.getRuntime();
            p = runtime.exec(batchCommand);
            int processComplete = p.waitFor();


            if (processComplete == 0) {
                status = true;
                //System.out.println("Backup created successfully with All DBs in " + host + ":" + port);
                //log.info("Backup created successfully with All DBs in " + host + ":" + port);
            } else {
                status = false;
                
                System.err.println("Could not create the backup for All DBs in " + host + ":" + port);
                //log.info("Could not create the backup for All DBs in " + host + ":" + port);
            }

        } catch (IOException ioe) {
            //log.error(ioe, ioe.getCause());
        } catch (Exception e) {
            //log.error(e, e.getCause());
        }
        return status;
    }

    /**
     * Restore the backup into a local database
     *
     * @param dbUserName - user name
     * @param dbPassword - password
     * @param source - backup file
     * @return the status true/false
     */
    public boolean restoreDatabase(String dbUserName, String dbPassword, String source) {

//        String[] executeCmd = new String[]{"C:/Program Files/MySQL/MySQL Server 6.0/bin/mysql", "--user=" + dbUserName, "--password=" + dbPassword, "-e", "source " + source};
    	
    	String executeCmd = "\"C:/Program Files/MySQL/MySQL Server 6.0/bin/mysql\" -u " + dbUserName + " -p" + dbPassword + " -f -e source "+source ;
        Process runtimeProcess;
        try {
            runtimeProcess = Runtime.getRuntime().exec(executeCmd);
            int processComplete = runtimeProcess.waitFor();

            if (processComplete == 0) {
            	//System.out.println("Backup restored successfully with " + source);
                //log.info("Backup restored successfully with " + source);
                return true;
            } else {
            	System.err.println("Could not restore the backup " + source);
                //log.info("Could not restore the backup " + source);
            }
        } catch (Exception ex) {
        	ex.printStackTrace();
            //log.error(ex, ex.getCause());
        }

        return false;

    }
    
    //if backup taken without add drop
    public static boolean restoreDB(String dbName, String dbUserName, String dbPassword, String source) {
    	 
        String[] executeCmd = new String[]{"mysql", "--user=" + dbUserName, "--password=" + dbPassword, dbName,"-e", "source "+source};
 
        Process runtimeProcess;
        try {
 
            runtimeProcess = Runtime.getRuntime().exec(executeCmd);
            int processComplete = runtimeProcess.waitFor();
 
            if (processComplete == 0) {
                //System.out.println("Backup restored successfully");
                return true;
            } else {
                //System.out.println("Could not restore the backup");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
 
        return false;
    }
    
    
    public boolean backupTable(String dbName, String dbUserName, String dbPassword, String path,String tables) {
    	path = MySqlBackupWorking.class.getClassLoader().getResource("").getPath()+path;
		path = path.replace("%20", " ");
		boolean status = false;
		File files = new File(path);
		if (!files.exists()) {
			if (files.mkdir()) {
				//System.out.println("Directory is created!");
			} else {
				//System.out.println("Failed to create directory!");
			}
		}
    	// Compose full path, create a filename as you wish
    	DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
    	Date date = new Date();
    	String filepath = path  + tables + "-(" + dateFormat.format(date) + ").sql";
        String executeCmd = "D:/mysqldump -u " + dbUserName + " -p" + dbPassword + " " + dbName + " --tables " +tables;
        StringBuilder dumpdata = new StringBuilder();
        try {
        	 Process process = Runtime.getRuntime().exec(executeCmd);
             //System.out.println(filepath);
             InputStream in = process.getInputStream();
             BufferedReader br = new BufferedReader(new InputStreamReader(in));
             File filedst = new File(filepath);
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
 
        return status;
    }
    
    
    public static void main(String[] args) throws SQLException {
        MySqlBackupWorking b = new MySqlBackupWorking();
//        String log4jConfPath = "D:/J2EE/OmniRetailerConsoleF&B-2/07/15/OmniRetailerServices/WebContent/WEB-INF///log4j.xml";
//        PropertyConfigurator.configure(//log4jConfPath);
//         b.backupDatabase("10.10.0.5:80", "3306", "root", "root", "shivashakthi", "/backup/", "D:/mysqldump.exe");
        //b.backupDatabase("10.10.0.5:80", "3306", "root", "", "payroll", "/backup/", "/backup/mysqldump.exe");
//        b.backupTable("sampoorna", "root", "root", "backup/", "access_control");
//         b.restoreDatabase("root", "root", "E:/11-10-15/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/ShivaShakthi/WEB-INF/classes/backup/sampoorna-(02-12-2015).sql");
        // b.test();
      //  b.backupDataWithDatabase("C:\\wamp\\bin\\mysql\\mysql5.5.16\\bin\\mysqldump.exe", "10.10.0.5:80", "3306", "root", "", "payroll", "C:/Users/dinuka/Desktop/test/");
//         b.backupAllDatabases("C:/Program Files/MySQL/MySQL Server 5.5/bin/mysqldump.exe", "10.10.0.5:80", "3306", "root", "", "D:/test/sqlBkp");
        
//        b.incrementalBackupForDB("emp", "root", "root", "Backup", "bin-log.000001");
        b.absoluteBackupForDB("emp", "root", "root", "Backup");
        b.restoreDatabase("root", "root", "D:/backup/11-12-2015_abs.sql");
    }

    private boolean incrementalBackupForDB(String dbName, String dbUserName, String dbPassword, String destFilePath,String logFileName){
    	boolean status = false;
    	//destFilePath = MySqlBackupWorking.class.getClassLoader().getResource("").getPath()+destFilePath;
		//destFilePath = destFilePath.replace("%20", " ");
    	destFilePath = "D:/"+destFilePath;
		File files = new File(destFilePath);
		if (!files.exists()) {
			if (files.mkdir()) {
				//System.out.println("Directory is created!");
			} else {
				//System.out.println("Failed to create directory!");
			}
		}
    	// Compose full path, create a filename as you wish
    	DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
    	Date date = new Date();
    	destFilePath = destFilePath + "/" +dateFormat.format(date) + ".sql";
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
    	return status;
    }
    
    private boolean absoluteBackupForDB(String dbName, String dbUserName, String dbPassword, String destFilePath){
    	boolean status = false;
    	destFilePath = "D:/"+destFilePath;
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
    	return status;
    }
}
