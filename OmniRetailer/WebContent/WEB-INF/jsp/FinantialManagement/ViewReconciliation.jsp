<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sneha
 * file name		        : FinancialManagement/Reconciliation.jsp
 * file type		        : JSP
 * description				: The new storage system form is displayed using this jsp
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ln" uri="http://java.sun.com/jsp/jstl/functions" %>
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script> -->
        <!-- DATA TABLES -->
        	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
        	<script type="text/javascript" src="${pageContext.request.contextPath}/js/d3pie.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/d3pie.js"></script>	
	<script src="${pageContext.request.contextPath}/js/d3.min.js"></script>
       <script src="${pageContext.request.contextPath}/js/plugins/chartjs/ChartNew.js" type="text/javascript"></script>
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/order.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/FinantialManagement/orginizationMaster.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/excelReader/excelreader.js"></script>
        
<style type="text/css">
@media only screen and (max-width:767px){
.table-responsive{
 overflow:hidden;
}
}
@media only screen and (max-width:1080px)  {

   .table.dataTable {
         width: 100%; 
       
        margin-bottom: 15px;
        overflow-x: auto;
        overflow-y: hidden;
        -webkit-overflow-scrolling: touch;
        -ms-overflow-style: -ms-autohiding-scrollbar;
        border: 1px solid #DDD;
       
    display: inline-block;
    white-space: nowrap;
    
  }
  }
.buttons {
	float: right;
	padding-top: 0px;
	/* margin-right: 2%;
	margin-top:1%; */
}
a.button, .list a.button {
	position:relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 5px 10px 5px 10px;
	background: #3c8dbc;
	border-radius: 5px;
	/* box-shadow:1px 0px 2px #000; */
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}

table.dataTable {
    clear: both;
    margin-top: 3px !important;
    margin-bottom: 6px !important;
    max-width: none !important;
}

.blinking{-webkit-animation: blink 1s infinite;-moz-animation: blink 1s infinite;animation: blink 1s infinite;color:#3c8dbc;}
@-webkit-keyframes blink{
 0%{ opacity:0;}
 100%{opacity:1;}
}
@-moz-keyframes blink{
    0%{ opacity:0;}
    100%{opacity:1;}
}
@keyframes blink{
    0%{ opacity:0;}
    100%{opacity:1;}
}
.modal-dialog {
    width: auto;
    margin: 30px auto;
}
.modal-dialog
{
 margin-top: 14.5%;
 }
.billsPopUp
{
	position: relative;
    border: 2px solid gray;
    border-radius: 10px;
    background: #eee;
    min-height: 400px;
    max-height: 500px;
  /*   margin-right:2%; */
}
.billsPopUpUpArrow
{
	float: right;
    margin-right: 1%;
    font-size: 35px;
    color: gray;
    position: relative;
    margin-top: -2.3%;
    border-bottom: 3px solid lightgrey;
    height: 25px;
    border-bottom-width: 2px;
}
@media (min-width:1400px) and (max-width:1600px)
{
.billsPopUp {
    	margin-left: -20px !important;
      /*   margin-right:2% !important; */
}
.modal-dialog
{
 margin-top: 13%;
 }
.billsPopUpUpArrow {
  margin-top: -2% !important;
  border-bottom-width: 3px !important;
 }
   
 }

@media only screen and (max-width:479px)
{
.billsPopUp {
    margin-right: -30px;
    margin-left: -30px;
}
.summaryImg{
	width: auto;
    float: left;
	}
}
@media (min-width: 1200px){
	.summaryBtn{
		margin-top: 9px;
	}
}
@media (min-width: 1200px){
	.summaryImg{
	    width: 50%;
    float: right;
    margin-right: 5%;
	}
}
.billsPopUp::after {
    content: "";
    position: absolute;
    bottom: 100%;
    /* left: 50%; */
    right: 1.5%;
    /* margin-left: 9px; */
    border-width: 14px;
    border-style: solid;
    border-color: transparent transparent #eee transparent;
}

</style>  
<script type="text/javascript">
$(document).ready(function(){
	callCalender('start_date');
	callCalender('end_date');
	
});
</script> 
</head>
<body>
<!-- Main content -->
<section class="content">
<div class="row" >
  <div class="col-lg-12" >
  <div class="box box-primary" style="">
       <div class="box-header" style="text-align: center;padding-bottom: 0px; ">				
		<%-- </c:if>  --%>
	</div><!-- /.box-header -->
	    <div class="box-body table-responsive" style="padding-bottom: 50px" >
	      
	      <div class="row" style="padding-left:15px;padding-right:15px;margin-bottom: 52px;">
                              <div class="col-lg-11" style="background: #eee; width: 88%; padding-top: 7.5px; padding-bottom: 7.5px;">
                  <div class="row" style="padding-bottom: 15px;">
                  <input type="hidden" id="orderworkflow" value="${status}"/>
                         <div class="col-lg-3">
                       <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="Organization.label"/></label>
                          <select class="form-control" id="organization" onchange="getOrganizationlocations()" disabled="disabled">
                           <option value=""><spring:message code="ALL.label"/></option>
                           		 <c:forEach var="organization" items="${OrganizationList}">
							<option value="${organization.organizationId}" ${organization.organizationId == selectedLocation ? 'selected' : ''} id="${organization.organizationId}" >${organization.organizationId}</option>
						</c:forEach>
	                        </select>
                         </div>
                      </div>  
                                       
	          <div class="col-lg-3">
              <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                  <input type="hidden" id="type" value="${type}">
				  <input type="hidden" id="sd" value="${startDate}">
				  <input type="hidden" id="ed" value="${endDate}">
				  <label><spring:message code="offer_start_date.label"/></label>
				  <input class="form-control  calendar_icon" style="background-color: white;" disabled="disabled" value="${reconcilitionList[0].createdDateStr}"  id="start_date" size="20" type="text"  onfocus="callCalender('start_date')" onclick="callCalender('start_date')" placeholder="DD/MM/YYYY" />
	          </div>
	          </div>	   
	            
	         <div class="col-lg-6">
              <div class="col-lg-3" style="margin-top: 14px;width: 63%;padding-left: 0px;">
						<input type="file" class="btn bg-olive btn-inline" accept=".xlsx" disabled="disabled" id="fileUploadCSV" onchange="addNameToTextBox('fileUploadCSV')"/>
						</div>
						<div class="col-lg-3" >
    					<input type="button" style="margin-top:15px" class="btn bg-olive btn-inline" value="Upload" id="btnUpload" disabled="disabled"  onclick="uploadBankStatement(this)" />
    					<!-- <input id="skuMasterFile" class="form-control" placeholder="Choose File" disabled="disabled"> -->
						</div>
	        </div>
	        
	          <%-- <div class="col-lg-3">
              <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;margin-top: 18px;left: -25px;">                			 
				<input type="button"  class="btn bg-olive btn-inline addBtn" style="height:28px;margin-top:2px;border:none;"onclick="importIssueSkuExcelData()" value="<spring:message code="Reconciliation.bank.statement.label" />" />	
			  </div>
	          </div>  --%>
	                         	         	         
          </div>
                    
             <div class="row">
                       <div class="col-lg-3">
                       <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                          <label><spring:message code="bank.account.label"/></label>
		             <select class="form-control form-group" id="Account_Name" disabled="disabled" >
		             	
	                      <c:forEach var="accountname" items="${accountName}">
							<option value="${accountname}" ${accountname == selectedLocation ? 'selected' : ''} id="${accountname}" >${accountname}</option>
						</c:forEach>                   
		            </select>  
                      </div>
                      </div>
                      
                      <div class="col-lg-3" style="display: none">
                       <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                          <label><spring:message code="bank.account.label"/></label>
		             <select class="form-control form-group" id="Account_Id" >
		             	
	                     <c:forEach var="accountid" items="${accountId}">
							<option value="${accountid}" ${accountid == selectedLocation ? 'selected' : ''} id="${accountid}" >${accountid}</option>
						</c:forEach>                  
		            </select>  
                      </div>
                      </div>
                <div class="col-lg-3">
	               <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
	                  <label><spring:message code="offer_end_date.label"/></label>
						      <input class="form-control  calendar_icon" style="background-color: white;" disabled="disabled" value="${reconcilitionList[0].createdDateStr}" id="end_date" size="20" type="text" onfocus="callCalender('end_date')" onclick="callCalender('end_date')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>   
		       <div class="col-lg-6">
	               <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;width:83%;">
	                  <label><spring:message code="comments.label"/></label>
						      <input type="text" disabled="disabled" value="${reconcilitionList[0].comments}" id="comments" class="form-control" style=""/>
		           </div>
		          </div>                      
               </div>
                  </div>
                  <div class="col-lg-1" style="padding-right:15px;border-right: 1px solid #ccc;padding-top: 7px;padding-bottom: 22px;width: 12%;padding: 10px 15px;background: #ccc;height: 140px;">
                  <div class="col-lg-9" style="">
                  <div class="row">
                  
                   <input type="hidden" id="type" value="${type}">
                       <%--  <input type="button"  class="buttonsearch" onclick="searchOrders('','','0')" value="<spring:message code="search" />" /> --%>
                        <%-- <a onclick="searchOrders('','','0')" class="buttonsearch"><spring:message code="search"/></a> --%>
                   <input type="button" style="margin-top:18px;width: 135%;" class="btn bg-olive btn-inline addBtn" value="<spring:message code="start.label" />" />
                  </div>
                  <div class="row">
                  <a  style="margin-top:31px;width: 135%;"  class="btn bg-olive btn-inline addBtn"><spring:message code="clearbutton.label"/></a>
                  
                  </div>
                  </div></div>
                
                </div>
        
<div id="Error" class="Error" style="margin-top:-40px;text-align:center;color:red;font-weight:bold;">${err}</div>
  <div id="Success" class="Error" style="margin-top:-40px;text-align:center;color:blue;font-weight:bold;">${success}</div>
  
  
  <table class="table table-bordered table-striped" style="margin-top:10px;width:100%;margin-bottom:-5px;">
  <thead style="background-color: #3c8dbc; color: #ffffff">
          			<tr style="width:100%;" >
                     <th style="width:50%;"><spring:message code="Reconciliation.label.Bank.ledger" /></th>
                     <th style="width:50%;"><spring:message code="Reconciliation.label.Bank.Statement" /></th>
                </tr>
         </thead>
  
  </table>
   <div class="row">
   <div class="col-lg-6" style="padding-right: 0px">
   
   <table id="asstesList" class="table table-bordered table-striped" style="margin-top:4px;width:100%;">
          
          <thead style="background-color: #3c8dbc; color: #ffffff">
                
                <tr>
                  
                     <th ><spring:message code="Txn.sno" /></th>
                 	 <th><spring:message code="Txn.Date" /></th>
                 	 <th ><spring:message code="Txn.Description" /></th>                 	 
                     <th><spring:message code="debit.amt" /></th>
                     <th><spring:message code="credit.amt" /></th>
                 </tr>
                 
             </thead>
             <tbody style="text-align: center;white-space: nowrap;">
              <c:forEach var="asstestransaction" items="${reconcilitionList[0].assetReconciliationDetails}" varStatus="TheCount">
	             	<tr>
	                 <td>${TheCount.count}</td>
             	 	 <td id="assetDate${TheCount.count}">${asstestransaction.transactionDateStr}</td>
			          <td id="assetDes${TheCount.count}">${asstestransaction.transactionDescription}</td>
			          
			          <td id="assetDebitAmt${TheCount.count}">${asstestransaction.debitAmount}</td>
	                 <td id="assetCreditAmt${TheCount.count}">${asstestransaction.creditAmount}</td> 
	                 <input type='hidden' id="assetflag${TheCount.count}" value="0"/>
	                </tr>
	                </c:forEach> 
             </tbody>
         </table> 
   
   </div>
    <div class="col-lg-6" style="padding-left: 0px">
    
    <table id="bankListIds" class="table table-bordered table-striped" style="margin-top:4px;width:100%;">
          
          <thead style="background-color: #3c8dbc; color: #ffffff">
                
                <tr>
                     <th ><spring:message code="Txn.sno" /></th>
                     <th><spring:message code="Txn.Date" /></th>
                     <th><spring:message code="Txn.Description" /></th>
                     <th><spring:message code="debit.amt" /></th>
                     <th><spring:message code="credit.amt" /></th>           	
                 </tr>
                 
             </thead>
             <tbody style="text-align: center;white-space: nowrap;">
             	 
	                 
	                 <c:forEach var="banktransaction" items="${reconcilitionList[0].bankReconciliationDetails}" varStatus="TheCount">
	             	<tr>
	                  <td>${TheCount.count}</td>
	                 <td id="bankDate${TheCount.count}">${banktransaction.transactionDateStr}</td> 
	                 <td id="bankDes${TheCount.count}">${banktransaction.transactionDescription}</td> 
	                 
	             	 <td id="bankDebit${TheCount.count}">${banktransaction.debitAmount}</td>
	                 <td id="bankCredit${TheCount.count}">${banktransaction.creditAmount}</td> 
	                 
	                  <input type='hidden' id="bankflag${TheCount.count}" value="1"/>
	                 
	                 </tr>
	                </c:forEach> 
               
             </tbody>
         </table> 
    
   </div>
   </div>
         	 
      
 <div class="row" style="height: 50px;padding-top: 12px; background: lightgray;margin-right: 0px;margin-left: 0px;">
         	  <div class="col-lg-6" style="padding-left: 0px">
         	  <div class="col-lg-3" style="padding-left: 0px">
         	  
         	  </div>
         	   <div class="col-lg-3" style="padding-left: 0px">
         	   <label style="font-size: 16px;font-weight: bold;">Totals</label>
         	  </div>
         	   <div class="col-lg-3" style="padding-left: 0px">
         	   <input type="text" disabled="disabled" value="${reconcilitionList[0].totalAssetDebitAmount}" id="comments" class="form-control" style=""/>
         	  </div>
         	   <div class="col-lg-3" style="padding-left: 0px">
         	   <input type="text" disabled="disabled" value="${reconcilitionList[0].totalAssetCreditAmount}" id="comments" class="form-control" style=""/>
         	  </div>
         	  </div>
         	   <div class="col-lg-6" style="padding-left: 0px">
         	   <div class="col-lg-3" style="padding-left: 0px">
         	  
         	  </div>
         	    <div class="col-lg-3" style="padding-left: 0px">
         	    <label style="font-size: 16px;font-weight: bold;">Totals</label>
         	  </div>
         	   <div class="col-lg-3" style="padding-left: 0px">
         	   <input type="text" disabled="disabled" value="${reconcilitionList[0].totalBankDebitAmount}" id="comments" class="form-control" style=""/>
         	  </div>
         	   <div class="col-lg-3" style="padding-left: 0px">
         	   <input type="text" disabled="disabled" value="${reconcilitionList[0].totalBankCreditAmount}" id="comments" class="form-control" style=""/>
         	  </div>
         	  </div>
         	  </div>
          	<div class="col-lg-1" style="float:right;padding-right:0px;margin-top:10px;width:14%">
            <input type="button" class="btn bg-olive btn-inline  addBtn" onclick="accountingReconciliationSummary('clear','0','0')" value="Cancel" >
            </div>
	        <div class="col-lg-1" style="float:right;padding-right:12px;margin-top:10px;width:15%">
            <input type="button" style="display: none" class="btn bg-olive btn-inline  addBtn" onclick="saveReconciliation()" value="Save" >
            <input type="hidden" id="stockdownloadurl" value="${downloadurl}">                         
           </div>
            </div>           
         </div>
 	</div>
	</div>		
   <div class="col-sm-12 col-lg-12 col-xs-12">
            
         <div class="modal fade popup-display" id="items-modal" tabindex="-1" role="dialog" aria-hidden="true">
          <div class="modal-body">
                  <div class="box-body table-responsive" id="summary">
                 </div>
              </div>
</div>
</div> 

</section>
			 <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function() {
                $("#productstocks").dataTable({
       			  "bPaginate": false,
                  "bLengthChange": false,
                  "bFilter": false,
                  "bSort": false,
                  "bInfo": false,
                  "bAutoWidth": false
    			});
                 });
        </script>
        
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="order_id.label" />"/>
        <input type="hidden" id="status" value="${status}"/>
        <input type="hidden" id="location" value="${selectedLocation}"/>
        
  </body>
</html>