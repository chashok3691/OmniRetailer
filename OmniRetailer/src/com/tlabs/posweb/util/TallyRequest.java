package com.tlabs.posweb.util;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
//import java.io.FileInputStream;
//import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.StringWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
//import javax.xml.transform.OutputKeys;
//import javax.xml.transform.Result;
import javax.xml.transform.Transformer;
//import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.output.ByteArrayOutputStream;
import org.w3c.dom.Document;
//import org.w3c.dom.Node;

/**
 *
 * @author Chaithanya
 */
public class TallyRequest{
   
    public String CreateRequest() throws IOException
    {             
        String TXML = null;
//        File fXmlFile = null;	
//    	DocumentBuilderFactory dbFactory = null;
//    	DocumentBuilder dBuilder = null;
//    	Document doc = null;
//    	DOMoperations dom=null;
    	File file=new File("C:/Program Files/Tally.ERP9/GrpSum.XML");
        String filepath = "C:/Program Files/Tally.ERP9/Master.XML";
      /*  TXML = "<ENVELOPE>"
	+"<HEADER>"
	+"<VERSION>1</VERSION>"
	+"<TALLYREQUEST>Import</TALLYREQUEST>"
		+"<TYPE>Data</TYPE>"
		+"<ID>Vouchers</ID>"
	+"</HEADER>"
	+"<BODY>"
		+"<DESC>"
			+"<STATICVARIABLES>"
  				 +"<IMPORTDUPS>@@DUPCOMBINE</IMPORTDUPS>"
 		     	+"</STATICVARIABLES>"
		+"</DESC>"
		+"<DATA>"
			+"<TALLYMESSAGE>"
				+"<VOUCHER>"
					+"<DATE>20090603</DATE>"
					+"<NARRATION>Ch. No. Tested</NARRATION>"
					+"<VOUCHERTYPENAME>Payment</VOUCHERTYPENAME>"
					+"<VOUCHERNUMBER>1</VOUCHERNUMBER>"
					+"<ALLLEDGERENTRIES.LIST>"
						+"<LEDGERNAME>Technolabs</LEDGERNAME>"
						+"<ISDEEMEDPOSITIVE>Yes</ISDEEMEDPOSITIVE>"
						+"<AMOUNT>12000.00</AMOUNT>"
					+"</ALLLEDGERENTRIES.LIST>"
					+"<ALLLEDGERENTRIES.LIST>"
						+"<LEDGERNAME>Amit</LEDGERNAME>"
						+"<ISDEEMEDPOSITIVE>No</ISDEEMEDPOSITIVE>"
						+"<AMOUNT>-12000.00</AMOUNT>"
					+"</ALLLEDGERENTRIES.LIST>"
				+"</VOUCHER>"
				+"<VOUCHER>"
					+"<DATE>20090603</DATE>"
					+"<NARRATION>Ch. No. : Tested</NARRATION>"
					+"<VOUCHERTYPENAME>Payment</VOUCHERTYPENAME>"
					+"<VOUCHERNUMBER>2</VOUCHERNUMBER>"
					+"<ALLLEDGERENTRIES.LIST>"
						+"<LEDGERNAME>Technolabs</LEDGERNAME>"
						+"<ISDEEMEDPOSITIVE>Yes</ISDEEMEDPOSITIVE>"
						+"<AMOUNT>-5000.00</AMOUNT>"
					+"</ALLLEDGERENTRIES.LIST>"
					+"<ALLLEDGERENTRIES.LIST>"
						+"<LEDGERNAME>Amit</LEDGERNAME>"
						+"<ISDEEMEDPOSITIVE>No</ISDEEMEDPOSITIVE>"
						+"<AMOUNT>5000.00</AMOUNT>"
					+"</ALLLEDGERENTRIES.LIST>"
				+"</VOUCHER>"
				+"</TALLYMESSAGE>"
		+"</DATA>"
	+"</BODY>"
+"</ENVELOPE>";*/
        /*TXML = "<ENVELOPE>"
        		+"<HEADER>"
        		+"<VERSION>1</VERSION>"
        		+"<TALLYREQUEST>Export</TALLYREQUEST>"
        		+"<TYPE>Data</TYPE>"
        		+"<ID>All Masters</ID>"
        		+"</HEADER>"
        		+"<BODY>"
        		+"<DESC>"
        		+"<STATICVARIABLES>"
                +"<EXPLODEFLAG>Yes</EXPLODEFLAG>"
                +"<SVEXPORTFORMAT>$$SysName:XML</SVEXPORTFORMAT>"
                +"</STATICVARIABLES>"
        		+"</DESC>"
        		+"</BODY>"
        		+"</ENVELOPE>";*/
     
        /*FileReader fileReader = null; 
       
		try {
			fileReader = new FileReader(filepath);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 BufferedReader bufferedReader = 
	                new BufferedReader(fileReader);
		 try {
			while((TXML+= bufferedReader.readLine()) != null) {
			     ////System.out.println(TXML);
			 }
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		} */
		/* final String EoL = System.getProperty("line.separator");
		 List<String> lines = File.readAllLines(filepath,
		         Charset.defaultCharset());

		 StringBuilder sb = new StringBuilder();
		 for (String line : lines) {
		     sb.append(line).append(EoL);
		 }
		 final String content = sb.toString();*/
		
		 TXML =  FileUtils.readFileToString(file, "UTF-8");
		 TXML.replaceAll("\n",""); 
		 TXML.replaceAll("\t","");
		
       /* TXML = "<ENVELOPE>"
                + "<HEADER><TALLYREQUEST>Import Data</TALLYREQUEST></HEADER>"
                + "<BODY>"
                + "<IMPORTDATA>"
                + "<REQUESTDESC><REPORTNAME>Vouchers</REPORTNAME><STATICVARIABLES><SVCURRENTCOMPANY>Company</SVCURRENTCOMPANY></STATICVARIABLES></REQUESTDESC>"
                + "<REQUESTDATA>"
                + "<TALLYMESSAGE xmlns:UDF=\"TallyUDF\">"
                + "<VOUCHER REMOTEID=\"00000001\" VCHTYPE=\"Receipt\" ACTION=\"Create\" OBJVIEW=\"Accounting Voucher View\">"      
                + "<DATE>20140401</DATE>"
                + "<VOUCHERTYPENAME>Receipt</VOUCHERTYPENAME>"
                + "<VOUCHERNUMBER>1</VOUCHERNUMBER>"
                + "<PARTYLEDGERNAME>Cash</PARTYLEDGERNAME>"
                + "<PERSISTEDVIEW>Accounting Voucher View</PERSISTEDVIEW>"      
                + "<ALLLEDGERENTRIES.LIST>"
                + "<LEDGERNAME>Capital Account</LEDGERNAME>"
                + "<ISDEEMEDPOSITIVE>No</ISDEEMEDPOSITIVE>"
                + "<AMOUNT>50000.00</AMOUNT>"       
                + "</ALLLEDGERENTRIES.LIST>"
                + "<ALLLEDGERENTRIES.LIST>"      
                + "<LEDGERNAME>Cash</LEDGERNAME>"
                + "<ISDEEMEDPOSITIVE>Yes</ISDEEMEDPOSITIVE>"
                + "<AMOUNT>-50000.00</AMOUNT>"          
                + "</ALLLEDGERENTRIES.LIST>"    
                + "</VOUCHER>"
                + "</TALLYMESSAGE>"
                + "</REQUESTDATA>"
                + "</IMPORTDATA>"
                + "</BODY>"
                + "</ENVELOPE>";*/
     

                //File file = new File("./store/robots.txt");
        TXML = readFileToString(filepath);
        byte[] bytes = TXML.getBytes("UTF-8");
         TXML = new String(bytes, "UTF-8");
         TXML = convertDocumentToString(getDocumentObject(file));
        return TXML;
    }
    public Document getDocumentObject(File fXmlfile){
    	Document doc = null;
		try{
    		   DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
    		   DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
    		
    		   doc = dBuilder.parse(fXmlfile);
    		}catch(Exception e){
    			e.printStackTrace();
    	}
    	return doc;
    }
    private static String convertDocumentToString(Document doc) {
        TransformerFactory tf = TransformerFactory.newInstance();
        Transformer transformer;
        try {
            transformer = tf.newTransformer();
            // below code to remove XML declaration
            // transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
            StringWriter writer = new StringWriter();
            transformer.transform(new DOMSource(doc), new StreamResult(writer));
            String output = writer.getBuffer().toString();
            return output;
        } catch (TransformerException e) {
            e.printStackTrace();
        }
        
        return null;
    }
    @SuppressWarnings("unused")
	private static String readFileToString(String filePath)
    	    throws java.io.IOException{
    	 
    	        StringBuffer fileData = new StringBuffer(1000);
    	        BufferedReader reader = new BufferedReader(
    	                new FileReader(filePath));
    	        char[] buf = new char[1024];
    	 
    	        int numRead=0;
    	        while((numRead=reader.read(buf)) != -1){
    	            String readData = String.valueOf(buf, 0, numRead);
    	            fileData.append(readData);
    	            buf = new char[1024];
    	        }
    	 
    	        reader.close();
    	        ////System.out.println(fileData.toString());
    	        return fileData.toString();
    	    }
    
    
    
    
    
    
    public void SendToTally() throws Exception{ 
        String Url = "http://localhost:9000/";      

        String SOAPAction = "";
       
        String Voucher = this.CreateRequest();

// Create the connection where we're going to send the file.
        URL url = new URL(Url);
        URLConnection connection = url.openConnection();
        HttpURLConnection httpConn = (HttpURLConnection) connection;

       
        ByteArrayInputStream bin = new ByteArrayInputStream(Voucher.getBytes());
        ByteArrayOutputStream bout = new ByteArrayOutputStream();

// Copy the SOAP file to the open connection.
       
        copy(bin, bout);     

        byte[] b = bout.toByteArray();

// Set the appropriate HTTP parameters.
        httpConn.setRequestProperty("Content-Length", String.valueOf(b.length));
        httpConn.setRequestProperty("Content-Type", "text/xml; charset=utf-8");
        httpConn.setRequestProperty("SOAPAction", SOAPAction);
        httpConn.setRequestMethod("POST");
        httpConn.setDoOutput(true);
        httpConn.setDoInput(true);

// Everything's set up; send the XML that was read in to b.
        OutputStream out = httpConn.getOutputStream();
        out.write(b);
        out.close();

// Read the response and write it to standard out.

        InputStreamReader isr =
                new InputStreamReader(httpConn.getInputStream());
        BufferedReader in = new BufferedReader(isr);

        String inputLine;
		File fXmlFile=null;
		fXmlFile = new File("http://10.10.0.5:80");
        while ((inputLine = in.readLine()) != null) {
            //System.out.println(inputLine);
        }

        in.close();
    }

    public static void copy(InputStream in, OutputStream out)
            throws IOException {

// do not allow other threads to read from the
// input or write to the output while copying is
// taking place

        synchronized (in) {
            synchronized (out) {

                byte[] buffer = new byte[256];
                while (true) {
                    int bytesRead = in.read(buffer);
                    if (bytesRead == -1) {
                        break;
                    }
                    out.write(buffer, 0, bytesRead);
                }
            }
        }
    }
   
    public static void main(String[] args) throws Exception {
        TallyRequest r = new TallyRequest();
        r.SendToTally();
    }
}
