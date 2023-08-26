
/*******************************************************************************
 * Copyright  2015 Omni Retailer Services, All rights reserved.
 * Author : Mythri.Sabath
 * Created On : 10-2-2015
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

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.attribute.BasicFileAttributes;
import java.nio.file.attribute.FileTime;
import java.security.Key;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import org.aspectj.apache.bcel.classfile.Field;

import com.ibm.icu.text.DecimalFormat;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class EncryptAndDecrypt {
	
	  private static final String ALGO = "AES";
	    private static final byte[] keyValue = 
	        new byte[] { 'T', 'h', 'e', 'B', 'e', 's', 't','S', 'e', 'c', 'r','e', 't', 'K', 'e', 'y'};
	    
	    /**
	     * 
	     * @param Data
	     * @return Encrypted Data. 
	     * @throws Exception
	     * 
	     */
	    
	    
	    
	    public static String encrypt(String Data) throws Exception {
	    	
	        Key key = generateKey();
	        Cipher c = Cipher.getInstance(ALGO);
	        c.init(Cipher.ENCRYPT_MODE, key);
	        byte[] encVal = c.doFinal(Data.getBytes());
	        String encryptedValue = new BASE64Encoder().encode(encVal);
	        return encryptedValue;
	    }
	    
	    
	    /**
	     * 
	     * @param encryptedData
	     * @return Decrypted Data
	     * @throws Exception
	     * 
	     */
	    public static String decrypt(String encryptedData) throws Exception {
	        Key key = generateKey();
	        Cipher c = Cipher.getInstance(ALGO);
	        c.init(Cipher.DECRYPT_MODE, key);
	        byte[] decordedValue = new BASE64Decoder().decodeBuffer(encryptedData);
	        byte[] decValue = c.doFinal(decordedValue);
	        String decryptedValue = new String(decValue);
	        return decryptedValue;
	    }
	    
	    /**
	     * 
	     * @return Key to be used by the algorithm
	     * @throws Exception
	     * 
	     */
	    private static Key generateKey() throws Exception {
	        Key key = new SecretKeySpec(keyValue, ALGO);
	        return key;
	    }
	    
	    
	    public static void main(String args[]) throws Exception{
	    
			/*
			 * String inputString = "2.050"; String[] pricestr = inputString.split("\\.");
			 * if(pricestr.length>1 && (pricestr[1].equalsIgnoreCase("0") ||
			 * pricestr[1].equalsIgnoreCase("00"))){ inputString = pricestr[0]; }
			 * System.out.println(inputString);
			 */
	    	
			/*
			 * unzip(new File("C:/Users/shukla/Desktop/New folder/OmniRetailer_FMCG.zip"),
			 * new File("C:/Users/shukla/Desktop/New folder")); File file = new
			 * File("C:/Users/shukla/Desktop/New folder/OmniRetailer_FMCG.zip");
			 * 
			 * if (file.delete()) { System.out.println("File deleted successfully"); } else
			 * { System.out.println("Failed to delete the file"); }
			 */
	    	
	    	//java.sql.Date sqlDate = new java.sql.Date(new Date().getTime());
	    	System.out.println("Decrypted Data::"+decrypt("KA1aCfKy30+WwwF+OO7mJw=="));
	    	System.out.println("Encrypted Data::"+encrypt("Jaiambey1@#"));
	    	
	    	
	
//	    	String name="super admin";
	    	////System.out.println("status:::"+name.equalsIgnoreCase("Admin"));
	    	////System.out.println("status::"+name.contains("Sahitya"));
	    	

	    }


		private static float round(double d, int i) {
			// TODO Auto-generated method stub
			return 0;
		}
	    

	    public static void unzip(File zipFile, File targetDirectory) throws IOException {
	        ZipInputStream zis = new ZipInputStream(
	                new BufferedInputStream(new FileInputStream(zipFile)));
	        try {
	            ZipEntry ze;
	            int count;
	            byte[] buffer = new byte[8192];
	            while ((ze = zis.getNextEntry()) != null) {
	                File file = new File(targetDirectory, ze.getName());
	                File dir = ze.isDirectory() ? file : file.getParentFile();
	                if (!dir.isDirectory() && !dir.mkdirs())
	                    throw new FileNotFoundException("Failed to ensure directory: " +
	                            dir.getAbsolutePath());
	                if (ze.isDirectory())
	                    continue;
	                FileOutputStream fout = new FileOutputStream(file);
	                try {
	                    while ((count = zis.read(buffer)) != -1)
	                        fout.write(buffer, 0, count);
	                } finally {
	                    fout.close();
	                }

	            }
	        } finally {
	            zis.close();
	        }
	    }

	    
	    

	    
	    
}
