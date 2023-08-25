<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah Y
 * file name		        : inventorymanager/FinantialManagement/FinantialAssets.jsp
 * file type		        : JSP
 * description				: The new storage system form is displayed using this jsp
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
</head>
<body>
<div class="row">
  <div class="col-lg-12" style="padding: 35px">
  <div class="box box-primary">
       <div class="box-header" style="text-align: center;padding-bottom: 0px;">
		
		
			<h3>Income Sub Ledger</h3>
	</div>
	    <div class="box-body table-responsive">
        <div class="">
            <form id="newEmployee" method="post">
                                    <div class="box-body">
                                    <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 25px; margin-top: -20px">${err}</div>
                        			<div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${resultStr}</div>
                                   	<div class="row">
                                    	 <div class="form-group col-lg-6">
                                    	 
                                    	<div class="row" style="margin-left:20%;">
                                    	 		<div class="form-group col-lg-12">
		                                            <label><spring:message code="Accounting.SubAccount.Id" /><span style="color:red; font-size:2">*</span></label>
		                                            <input type="text" class="form-control" style="width: 60%;" onchange="RemoveAccountErr();" id="Sub_AccountId" placeholder="<spring:message code="Accounting.SubAccount.Id" />" />
                                    	 			<span id="errorAccId" style="text-align:Left;color: red;font-size: 2;font-weight: bold;display:none;">Please enter account ID</span>
                                    	 		
                                    	 		</div>
                                    	</div>
                                    	 
                                    	 
                                    	  <div class="row" style="margin-left:20%;">
                                    	 		<div class="form-group col-lg-12">
		                                            <label><spring:message code="Accounting.Account.name" /></label>
		                                            <input type="text" class="form-control" style="width: 60%;" id="Sub_AccountName" placeholder="<spring:message code="Accounting.Account.name" />" />
                                    	 	</div>
                                    	 	</div>
                                    	 
                                    	 
                                    	  <div class="row" style="margin-left:20%;">
                                    	 		<div class="form-group col-lg-12">
		                                            <label><spring:message code="Accounting.discription" /></label>
		                                            <input type="text" class="form-control" style="width: 60%;" id="Sub_DiscriptionId" placeholder="<spring:message code="Accounting.discription" />" />
                                    	 		</div>
                                    	 	</div>
                                    	 
                                    	 
                                  
                                    	 	
                                    	 	
                                 
                                        </div>
                                       
							<div class="form-group col-lg-6">
							<div class="row" style="margin-left:20%;">
                                    	 		<div class="form-group col-lg-12">
		                                            <label><spring:message code="Accounting.Account.Id" /><span style="color:red; font-size:2">*</span></label>
		                                            <input type="text" class="form-control" style="width: 60%;" value="${accountId}" disabled="disabled" id="AccountId" placeholder="<spring:message code="Accounting.Account.Id" />" />
                                    	 		
                                    	 		</div>
                                    	</div>
								<div class="row" style="margin-left:20%;">
                                 	 		<div class="form-group col-lg-12">
                                           <label><spring:message code="Accounting.Account.Type" /><!-- <span style="color:red; font-size:2">*</span> --></label>
                                              <select class="form-control" name="zoneID" id="Sub_AccountType" style="width: 60% !important;">
                                                   <!-- <option value="" id="" >Select Type</option> -->
                                                   <option value="Income" id="Income" >Income</option>
                                                 
                                      
				                        	  </select>
				                        	
                                           </div>
                                 	 	</div>
                                 <div class="row" style="margin-left:20%;">
                                  	 	<div class="form-group col-lg-12">
                                           <label><spring:message code="Accounting.Status" /></label>
				                              <select  class="form-control" name="Status" id="StatusId" style="width: 60% !important;">
                                                   <option value="Active" id="Active" >Active</option>
                                                   <option value="In Active" id="In Active" >In Active</option>
                                                  
				                        	  </select>
                                  	 	</div>
                                   </div>
                                           <input type="hidden" id="slectedLocations" value="${zone.zones}">
                                        </div>
                                        
                                        </div>
                                        
						<div class="row" style="text-align: center;">
						 <input type="button" style="" class="btnCls" onclick="CreateSubLiabilities('New','0');" value="<spring:message code="submit.label" />" />
						  <c:if test="${sessionScope.role == 'super admin'}"> 
						  	<input type="button" class="btnCls buttonMargin"  onclick="accountingAssets('data','','');" value="<spring:message code="cancel.label" />" />
						  </c:if>
						 <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                             <c:if test="${accessControl.appDocument == 'ZoneMaster' && accessControl.write == true && accessControl.read == true}">
								<input type="button" class="btnCls buttonMargin" onclick="accountingAssets('data','','');" data-dismiss="modal" value="<spring:message code="cancel.label" />" />
							</c:if>
						</c:forEach>
						</div>
									<br/>
                              <div class="box-footer"></div>
                              </div>
                                    
                                     <input type="hidden" value="${maxRecords}" id="maxRecords"/>
                           			<input type="hidden" value="${searchName}" id="searchZone"/>
                                    
                                </form>
        </div>
       </div>
 </div>
    </div>
  </div> 
  </body>
  </html>