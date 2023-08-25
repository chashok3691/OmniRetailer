
<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : SNEHA
 * file name		        : /OmniRetailer/WebContent/WEB-INF/jsp/FinantialManagement/deep.jsp
 * file type		        : JSP
 * description				: to display balance sheet
 * */ -->
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <!DOCTYPE html>
<html>

<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
           <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script> 
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/procurement/purchaseOrderAndReceipts.js"></script>
   <style>
table, th {
  border: 1px solid black;
  border-collapse: collapse;
  marigin-bottom:30px;
}
th {
  border: 1px solid black;
  marigin-top:300px;
  marigin-bottom:30px;
  font-size:14pt;
  font-family:Arial;
  border-collapse: collapse;
  background-color:   #B0E0E6;
}
td
{
border-right :1px solid black;
font-size:12pt;
padding-left:5px;
}
tfoot
{
border 1px white;
}

.labelHeader {
    font-size: 17px;
    font-weight: normal;
    color: #000;
    background-color: #B0E0E6 text-align: center;
    white-space: nowrap;
    vertical-align: baseline;
    background-color: #B0E0E6;
    width: 100%;
    height: 35px;
    color: black;
    text-align: center;
    padding: 0px;
     border-radius: 0px;
    
}
}
</style>     
 
 </head>
<body>

<!-- <div class="box box-primary">
       <div class="box-header" style="text-align: center;padding-bottom: 0px;">
		
		
			
	</div>
	    <div class="box-body table-responsive"> -->



<!-- <table align="center" cellspacing="14" style="width:75%;height: 400px;"> -->
 <!--  <tr>
    <th>Assets</th>
    
    <th>INR</th> 
    <th>Liabilities & Stockholders Equity</th>
    <th>INR</th>
    
  </tr> -->
  
  <div class="col-lg-12 col-sm-12 col-xs-12 box" style="margin-top: 20px;  padding: 30px;">
  
  <h3 align="center" style="line-height:0.01;">BUSINESS CONSULTING COMAPANY</h3>
<h3 align="center">BALANCE SHEET</h3>
<p align="center">As at</p>
  
    <div class="col-lg-12 col-sm-12 col-xs-12"  style="border: 1px solid;margin-top: 20px;padding: 0px;padding-bottom: 10px;">       
  <div class="col-lg-12 col-sm-12 col-xs-12" style="border-bottom: 1px solid; padding: 0px;">
   <div class="col-lg-3 col-sm-3 col-xs-3" style=" padding: 0px;">
   <label class="labelHeader">Assets</label>
  
   </div>
    <div class="col-lg-3 col-sm-3 col-xs-3" style=" padding: 0px;">
   <label class="labelHeader">INR</label>
   </div>
    <div class="col-lg-3 col-sm-3 col-xs-3" style=" padding: 0px;">
   <label class="labelHeader">Liabilities & Stockholders Equity</label>
  
   </div>
    <div class="col-lg-3 col-sm-3 col-xs-3" style=" padding: 0px;">
   <label class="labelHeader">INR</label>
   </div>

</div>
  <div class="col-lg-12 col-sm-12 col-xs-12" style="margin-top: 0px; padding: 0px;">

  		 <div class="col-lg-3 col-sm-3 col-xs-3" style="margin-top: 0px; padding: 0px;text-align: left;">
  		       <label style="width:100%;margin-top: 10px;text-decoration:underline;">Current Assets</label>
  		 
                <c:forEach var="balanceSheet1" items="${balanceSheetObj.currentAssetTransactionList}" varStatus="TheCount">
             	 
             	 	 <label style="width:100%;margin-top: 10px;">${balanceSheet1.accountName}</label>
                 	 
                
                </c:forEach>
                <label style="width:100%;margin-top: 10px;">Total current assets</label>
            </div>
       <div class="col-lg-3 col-sm-3 col-xs-3" style="margin-top: 0px; padding: 0px;text-align: center;">
        <label style="width:100%;margin-top: 10px;"></label>
                <c:forEach var="balanceSheet2" items= "${balanceSheetObj.currentAssetTransactionList}" varStatus="TheCount">
             	 
             	 	 
                 	 <label style="width:100%;margin-top: 10px;">${balanceSheet2.balanceAmount}</label>
                 
                </c:forEach>   
                <label style="width:100%;margin-top: 10px;">${balanceSheetObj.totalAssetAmount}</label>     
  		 </div>
  		   <div class="col-lg-3 col-sm-3 col-xs-3" style="margin-top: 0px; padding: 0px;text-align: left;">
			<label style="width:100%;margin-top: 10px;text-decoration:underline;">Liabilities</label>
                <c:forEach var="balanceSheet3" items="${balanceSheetObj.liabilitiesList}" varStatus="TheCount">
             	 
             	 	 <label style="width:100%;margin-top: 10px;">${balanceSheet3.accountName}</label>
                 	 
                
                </c:forEach>
                 <label style="width:100%;margin-top: 10px;">Total liabilities</label>
             </div>
              <div class="col-lg-3 col-sm-3 col-xs-3" style="margin-top: 0px; padding: 0px;text-align: center;">
              <label style="width:100%;margin-top: 10px;"></label>
                <c:forEach var="balanceSheet" items="${balanceSheetObj.liabilitiesList}" varStatus="TheCount">
             	 
             	 	 
                 	 <label style="width:100%;margin-top: 10px;">${balanceSheet.totalLiabilityAmount}</label>
                
                </c:forEach>
         <label style="width:100%;margin-top: 10px;">${balanceSheetObj.totalLiabilityAmount}</label>
         </div>
  		 
  		 </div>
  		 
  		  <div class="col-lg-12 col-sm-12 col-xs-12" style="margin-top: 0px; padding: 0px;">

  		 <div class="col-lg-3 col-sm-3 col-xs-3" style="margin-top: 0px; padding: 0px;text-align: left;">
  		 <label style="width:100%;margin-top: 10px;text-decoration:underline;">Non-current assets</label>
                <c:forEach var="balanceSheet" items="${balanceSheetObj.longRunAssetTransactionList}" varStatus="TheCount">
             	 
             	 	 <label style="width:100%;margin-top: 10px;">${balanceSheet.accountName}</label>
                 	 
                 
                </c:forEach>
                 <label style="width:100%;margin-top: 10px;">Total assets</label>
            </div>
       <div class="col-lg-3 col-sm-3 col-xs-3" style="margin-top: 0px; padding: 0px;text-align: center;">
       <label style="width:100%;margin-top: 10px;"></label>
                <c:forEach var="balanceSheet" items= "${balanceSheetObj.longRunAssetTransactionList}" varStatus="TheCount">
             	
             	 	 
                 	 <label style="width:100%;margin-top: 10px;">${balanceSheet.balanceAmount}</label>
                
                </c:forEach>      
                <label style="width:100%;margin-top: 10px;">${balanceSheetObj.totalLiabilityAmount}</label>  
  		 </div>
  		   <div class="col-lg-3 col-sm-3 col-xs-3" style="margin-top: 0px; padding: 0px;text-align: left;">
<label style="width:100%;margin-top: 10px;text-decoration:underline;">Stock holders equity</label>
                <c:forEach var="balanceSheet" items="${balanceSheetObj.equityList}" varStatus="TheCount">
             	
             	 	 <label style="width:100%;margin-top: 10px;">${balanceSheet.accountName}</label>
                 	
                 
                </c:forEach>
                <label style="width:100%;margin-top: 10px;">Total liabilities & Stock holders equity</label>
             </div>
              <div class="col-lg-3 col-sm-3 col-xs-3" style="margin-top: 0px; padding: 0px;text-align: center;">
              <label style="width:100%;margin-top: 10px;"></label>
                <c:forEach var="balanceSheet" items="${balanceSheetObj.equityList}" varStatus="TheCount">
             	 
             	 	
                 	 <label style="width:100%;margin-top: 10px;">${balanceSheet.totalLiabilityAmount}</label>
                
                </c:forEach>
         <label style="width:100%;margin-top: 10px;">${balanceSheetObj.totalLiabilityAmount}</label>  
         </div>
  		 
  		 </div>
  		 
  		 </div>
  		 
  		</div>
  

  <%-- <div style="overflow:auto">    
         <table id="productstocks" class="table table-bordered table-striped" style="margin-top:0%;">
            
                <c:forEach var="balanceSheet" items="${balanceSheetObj.currentAssetTransactionlist}" varStatus="0">
             	 <tr>
             	 	 <td>${balanceSheet.accountName}</td>
                 	 <td>${balanceSheet.balanceAmount}</td>
                 </tr>
                </c:forEach>
            
       
                <c:forEach var="balanceSheet" items= "${balanceSheetObj.longRunAssetTransactionlist}" varStatus="TheCount">
             	 <tr>
             	 	 <td>${balanceSheet.accountName}</td>
                 	 <td>${balanceSheet.balanceAmount}</td>
                 </tr>
                </c:forEach>
             </tbody>
         </table>
         </div>
         
         <div style="overflow:auto">    
         <table id="productstocks" class="table table-bordered table-striped" style="margin-top:0%;">
             <tbody style="text-align: center;white-space: nowrap;">
                <c:forEach var="balanceSheet" items="${balanceSheetObj.liabilitiesList}" varStatus="TheCount">
             	 <tr>
             	 	 <td>${balanceSheet.accountName}</td>
                 	 <td>${balanceSheet.totalLiabilityAmount}</td>
                 </tr>
                </c:forEach>
             </tbody>
        
             <tbody style="text-align: center;white-space: nowrap;">
                <c:forEach var="balanceSheet" items="${balanceSheetObj.equityList}" varStatus="TheCount">
             	 <tr>
             	 	 <td>${balanceSheet.accountName}</td>
                 	 <td>${balanceSheet.totalLiabilityAmount}</td>
                 </tr>
                </c:forEach>
             </tbody>
         </table>
         </div> --%>
  <!-- <tr>
    <td><u>Current Assets</u></td>
    <td></td>
    <td><u>Liabilities</u></td>
    <td></td>
  </tr>
  <tr>
  <td>Cash</td> 
   <td></td>
  <td>Notes payable</td>
  <td></td>
  </tr>
  <tr>
  <td>Accounts Receivable</td>
   <td></td>
    <td>Account payable</td>
    <td></td>
  </tr>
  
  <tr>
  <td>Prepaid Building Rent</td>
  <td></td>
     <td>Salaries Payable</td>
    <td></td>
  </tr>
  
  <tr>
  <td>unexpired insurance</td>
  <td></td>
   <td>Income tax payable</td>
    <td></td>
  </tr>
  
  <tr>
  <td>Supplies</td>
  <td></td>
    <td>Unearned service revenue</td>
    <td></td>
  </tr>
   <tr>
   <td></td>
   <td style="border-bottom: 1px solid black;"></td>
   <td></td>
   <td style="border-bottom: 1px solid black;"></td>
   </tr>
  <td>Total current assets</td>
  <td></td>
    <td>Total liabilities</td>
    <td></td>
  </tr>
   <tr>
  <td><u>Non-current assets:</u></td>
  <td></td>
    <td><u>Stock holders equity:</u></td>
    <td></td>
  </tr>
   <tr>
  <td>Equipment</td>
  <td></td>
    <td>Capital stock</td>
    <td></td>
  </tr>
  <tr>
  <td>Acc. dep.- Equipment</td>
  <td></td>
    <td>Retained earnings</td>
    <td></td>
  </tr>

<tfoot>
<tr>
<td>Total assets</td>
<td></td>
<td>Total liabilities & Stock holders equity</td>
<td></td>
</tr> -->

</body>
</html>