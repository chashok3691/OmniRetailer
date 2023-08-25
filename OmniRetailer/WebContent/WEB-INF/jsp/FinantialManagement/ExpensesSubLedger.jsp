<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sneha
 * file name		        : inventorymanager/FinantialManagement/SubLedger.jsp
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

<script type="text/javascript">
$(document).ready(function(){
	callCalender('startDate');
	callCalender('endDate');

	
});
</script> 
</head>
<body>


 <!-- Content Header (Page header) -->
	<%-- <section class="content-header">
				<h1><spring:message code="outlet.management.label" />
     				<small><spring:message code="customer.label" /> <spring:message code="orders.label" /></small>
    			</h1>
                 <ol class="breadcrumb">
                    <li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
                        <li class="active"><spring:message code="outlet.management.label"/></li>
                    </ol>
                </section> --%>
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
       <div class="box-header" style="text-align: center;padding-bottom: 0px;">
		
		
			<h3 class="box-title" style="border: 1px solid gray;padding: 5px;padding-left: 40px;padding-right: 40px;">
				<spring:message code="Expenses.subLedger.label"/>
			</h3>
		<%-- </c:if>  --%>
	</div><!-- /.box-header -->
	    <div class="box-body table-responsive">
	      
	      <div class="row" style="padding-left:15px;padding-right:15px;">
                              <div class="col-lg-11" style="background: #eee; width: 88%; padding-top: 7.5px; padding-bottom: 21px;">
                  <div class="row" style="padding-bottom: 15px;">
                  <input type="hidden" id="orderworkflow" value="${status}"/>
                  
                   <div class="col-lg-3" >
                          <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                            <label><spring:message code="Accounting.Organisation.Id" /></label>
                             <input type="text" class="form-control" disabled="disabled" value="${Organization}" id="organization" />

 	                 </div>
	            </div>
                  
                         <div class="col-lg-3" style="display: none">
                       <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="zone.label"/></label>
                        <c:choose>
                        <c:when test="${flowUnder == 'outlet' }">
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','location','')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
	                        </c:when>
	                        <c:otherwise>
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','location','warehouse')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
	                        </c:otherwise>
	                        </c:choose>
                         </div>
                      </div>
                       <div class="col-lg-3"></div>
	               <div class="col-lg-3">
                       <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;" >
                           <label>Account Id</label>
                           <input type="text" class="form-control" value="${accountId}" disabled="disabled" id="accountId"   />
                       </div>
                   </div>
	            
	            
	            
	           <div class="col-lg-3">
              <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                 			 <input type="hidden" id="type" value="${type}">
							                 <input type="hidden" id="sd" value="${startDate}">
						                     <input type="hidden" id="ed" value="${endDate}">
						            <label><spring:message code="offer_start_date.label"/></label>
						                    <input class="form-control  calendar_icon" style="background-color: white;" value="${Start_date}"  id="startDate" size="20" type="text" readOnly="readOnly" onfocus="callCalender('startDate')" onclick="callCalender('startDate')" placeholder="DD/MM/YYYY" />
	              </div>
	            </div>
	           
                    </div>
                     <div class="row">
                       <div class="col-lg-3" style="display: none">
                       <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                          <label><spring:message code="location.label"/></label>
		             <select class="form-control form-group" id="location" >
		             	<option value="">ALL</option>
		                <c:forEach var="location" items="${locationsList}">
							<option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''} id="${location.locationId}" >${location.locationId}</option>
						</c:forEach>
		            </select> 
                      </div>
                      </div>

		               <div class="col-lg-3">
                       <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="newarrival.product.status" /></label>
                      
                           		  <select class="form-control" name="orderChannel" id="status">
                                  <option value="all"><spring:message code="ALL.label"/></option>
                                   <option value="Active" ${'Active' == status ? 'selected' : ''} id="Active" >Active</option>
                                   <option value="In Active" ${'In Active' == status ? 'selected' : ''} id="In Active" >In Active</option>
                                 
                                  </select>
                                 
	                        
                      </div>
                      </div>
                       <div class="col-lg-3"></div>
                      
                   <div class="col-lg-3">
                       <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                           <label>Account Name</label>
                          <input type="text" class="form-control" disabled="disabled" value="${accountname}" id="accountName" />
                      </div>
                   </div>
                      
                      
                  <div class="col-lg-3">
	               <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
	                  <label><spring:message code="offer_end_date.label"/></label>
						      <input class="form-control  calendar_icon" style="background-color: white;" value="${End_date}" id="endDate" size="20" type="text" onfocus="callCalender('endDate')" onclick="callCalender('endDate')" placeholder="DD/MM/YYYY" />
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
                   <input type="button" style="margin-top:22px;width: 135%;" class="btn bg-olive btn-inline addBtn" onclick="ExpensesSubLedger('view','${Organization}','${accountId}','${accountname}','')" value="<spring:message code="search" />" />
                  </div>
                  <div class="row">
                  <a  type="button" style="margin-top:31px;width: 135%;"  class="btn bg-olive btn-inline addBtn" onclick="ExpensesSubLedger('clear','${Organization}','${accountId}','${accountname}','')"><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div></div>
                
                </div>
	      
	     
	      <div class="row">
                <div class="col-lg-11"></div>
                <div class="col-lg-1 summaryBtn">
                	<img class="summaryImg" src="${pageContext.request.contextPath}/images/summary.png" style="cursor: pointer;display:none;" onclick="getOrderSummary();" >
                </div>
          </div>
	        		<%--  <c:if test="${type != 'management' }">
	        		  <div class="row">
				      <div class="col-lg-1 col-xs-2" style="margin-top: 10px;">
			                <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="searchOrders('','','0');">
			               		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
			               		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
			               		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
			              		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
			               	</select>
			           </div>
       					<div class="col-lg-11 col-xs-10">
		        	 		 <input type="text"  class="form-control searchItems"  value="" id="searchOrders" placeholder="<spring:message code="search.orders.label" />"style="margin-top: 10px;    width: ;margin-left:;height:30PX;text-align: center;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
								<div class="services">
					    			<div class="items">
					     				<ul class="matchedStringUl searchOrders" style=""></ul>
					   				</div>
								</div>
								<input type="hidden" id="ordersSearch" value="${searchName}">
		        	 	</div>
		        	 	</div>
		        	 </c:if> --%>
	        <%-- <c:if test="${type == 'management' }"> --%>
	        
<div id="Error" class="Error" style="margin-top:-40px;text-align:center;color:red;font-weight:bold;">${err}</div>
  <div id="Success" class="Error" style="margin-top:-40px;text-align:center;color:blue;font-weight:bold;">${success}</div>
	        
	        
	      <div class="row">
	    
           
           <div class="col-lg-8" style="margin-top: 10px; padding-left: 15px;width: 81%">
                      <div class="wrapper" style="display:none;">	 
                     <input type="text"  class="form-control"  value="${searchName}" id="searchAccount" placeholder="<spring:message code="search.account.label" />"/>
							<button id="mySearch" class="searchbutton" onclick="ExpensesSubLedger('view','${Organization}','${accountId}','${accountname}','');" ></button>
							<!-- <div class="services">
				    			<div class="items">
				     				<ul class="matchedStringUl searchStocks" style=""></ul>
				   				</div>
							</div> -->
							</div>
						<input type="hidden" id="ordersSearch" value="${searchName}">
                    </div>
           
	      
		<div class="col-lg-4" style="margin-top: -15px;padding-left: 0px;margin-left: 50px;float: right;width: 17%;">
	        <input type="button" style="float: right;" class="btn bg-olive btn-inline addBtn"   data-toggle="modal" data-target="#myModal" value="<spring:message code="Accounting.createnew.Subledger.label" />" />
	     </div>
	                                          
        <div class="modal fade" id="myModal" role="dialog">
         <div class="modal-dialog modal-lg" style="margin-top: 5%">
          <div class="modal-content" style="width: 75%;margin-left: 12%;">
           <div class="modal-header">
          <h3 class="modal-title" style="text-align: center;">Expenses Sub Ledger</h3>
          </div>
        <div class="modal-body">
        
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
                                                   <option value="Expenses" id="Expenses" >Expenses</option>
                                                 
                                      
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
						 <input type="button" style="" class="btnCls" onclick="CreateSubExpenses('New','0');" value="<spring:message code="submit.label" />" />
						  <c:if test="${sessionScope.role == 'super admin'}"> 
						  	<input type="button" class="btnCls buttonMargin"  onclick="ExpensesSubLedger('view','${Organization}','${accountId}','${accountname}','');" value="<spring:message code="cancel.label" />" />
						  </c:if>
						 <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                             <c:if test="${accessControl.appDocument == 'ZoneMaster' && accessControl.write == true && accessControl.read == true}">
								<input type="button" class="btnCls buttonMargin" onclick="ExpensesSubLedger('view','${Organization}','${accountId}','${accountname}','');" data-dismiss="modal" value="<spring:message code="cancel.label" />" />
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

                                      
        <div class="modal fade" id="viewModal" role="dialog">
         <div class="modal-dialog modal-lg" style="margin-top: 5%">
          <div class="modal-content" style="width: 75%;margin-left: 12%;">
           <div class="modal-header">
          <h3 class="modal-title" style="text-align: center;">Expenses Sub Ledger</h3>
          </div>
        <div class="modal-body">
        
            <form id="newEmployee" method="post">
                                    <div class="box-body">
                                    <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 25px; margin-top: -20px">${err}</div>
                        			<div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${resultStr}</div>
                                   	<div class="row">
                                    	 <div class="form-group col-lg-6">
                                    	 
                                    	<div class="row" style="margin-left:20%;">
                                    	 		<div class="form-group col-lg-12">
		                                            <label><spring:message code="Accounting.SubAccount.Id" /><span style="color:red; font-size:2">*</span></label>
		                                            <input type="text" class="form-control" style="width: 60%;" onchange="RemoveAccountErr();" value="${subAssetsList[0].subAccountTypeId}" disabled="disabled"  id="viewSub_AccountId" placeholder="<spring:message code="Accounting.SubAccount.Id" />" />
                                    	 			<span id="errorAccId" style="text-align:Left;color: red;font-size: 2;font-weight: bold;display:none;">Please enter account ID</span>
                                    	 		
                                    	 		</div>
                                    	</div>
                                    	 
                                    	 
                                    	  <div class="row" style="margin-left:20%;">
                                    	 		<div class="form-group col-lg-12">
		                                            <label><spring:message code="Accounting.Account.name" /></label>
		                                            <input type="text" class="form-control" style="width: 60%;" id="viewSub_AccountName" value="${subAssetsList[0].accountName}" disabled="disabled" placeholder="<spring:message code="Accounting.Account.name" />" />
                                    	 	</div>
                                    	 	</div>
                                    	 
                                    	 
                                    	  <div class="row" style="margin-left:20%;">
                                    	 		<div class="form-group col-lg-12">
		                                            <label><spring:message code="Accounting.discription" /></label>
		                                            <input type="text" class="form-control" style="width: 60%;" value="${subAssetsList[0].accountDescription}" disabled="disabled" id="viewSub_DiscriptionId" placeholder="<spring:message code="Accounting.discription" />" />
                                    	 		</div>
                                    	 	</div>
                                    	 
                                    	 
                                  
                                    	 	
                                    	 	
                                 
                                        </div>
                                       
							<div class="form-group col-lg-6">
							<div class="row" style="margin-left:20%;">
                                    	 		<div class="form-group col-lg-12">
		                                            <label><spring:message code="Accounting.Account.Id" /><span style="color:red; font-size:2">*</span></label>
		                                            <input type="text" class="form-control" style="width: 60%;" value="${subAssetsList[0].accountId}" disabled="disabled" id="viewAccountId" placeholder="<spring:message code="Accounting.Account.Id" />" />
                                    	 		
                                    	 		</div>
                                    	</div>
								<div class="row" style="margin-left:20%;">
                                 	 		<div class="form-group col-lg-12">
                                           <label><spring:message code="Accounting.Account.Type" /><!-- <span style="color:red; font-size:2">*</span> --></label>
                                              <select class="form-control" name="zoneID" id="viewSub_AccountType" style="width: 60% !important;">
                                                   <!-- <option value="" id="" >Select Type</option> -->
                                                   <option value="Expenses" id="Expenses" >Expenses</option>
                                                 
                                      
				                        	  </select>
				                        	
                                           </div>
                                 	 	</div>
                                 <div class="row" style="margin-left:20%;">
                                  	 	<div class="form-group col-lg-12">
                                           <label><spring:message code="Accounting.Status" /></label>
				                              <select  class="form-control" name="Status" id="viewStatusId" style="width: 60% !important;">
                                                    <option value="Active" ${'Active' == subAssetsList[0].subAccountTypeStatus ? 'selected' : ''} id="Active" >Active</option>
                                                   <option value="In Active" ${'In Active' == subAssetsList[0].subAccountTypeStatus ? 'selected' : ''} id="In Active" >In Active</option>
                                                  
				                        	  </select>
                                  	 	</div>
                                   </div>
                                           <input type="hidden" id="slectedLocations" value="${zone.zones}">
                                        </div>
                                        
                                        </div>
                                        
						<div class="row" style="text-align: center;">
						<%--  <input type="button" style="" class="btnCls" onclick="CreateSubExpenses('New','0');" value="<spring:message code="submit.label" />" /> --%>
						  <c:if test="${sessionScope.role == 'super admin'}"> 
						  	<input type="button" class="btnCls buttonMargin"  onclick="ExpensesSubLedger('view','${Organization}','${accountId}','${accountname}','');" value="<spring:message code="cancel.label" />" />
						  </c:if>
						 <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                             <c:if test="${accessControl.appDocument == 'ZoneMaster' && accessControl.write == true && accessControl.read == true}">
								<input type="button" class="btnCls buttonMargin" onclick="ExpensesSubLedger('view','${Organization}','${accountId}','${accountname}','');" data-dismiss="modal" value="<spring:message code="cancel.label" />" />
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


                                      
        <div class="modal fade" id="editModal" role="dialog">
         <div class="modal-dialog modal-lg" style="margin-top: 5%">
          <div class="modal-content" style="width: 75%;margin-left: 12%;">
           <div class="modal-header">
          <h3 class="modal-title" style="text-align: center;">Expenses Sub Ledger</h3>
          </div>
        <div class="modal-body">
        
            <form id="newEmployee" method="post">
                                    <div class="box-body">
                                    <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 25px; margin-top: -20px">${err}</div>
                        			<div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${resultStr}</div>
                                   	<div class="row">
                                    	 <div class="form-group col-lg-6">
                                    	 
                                    	<div class="row" style="margin-left:20%;">
                                    	 		<div class="form-group col-lg-12">
		                                            <label><spring:message code="Accounting.SubAccount.Id" /><span style="color:red; font-size:2">*</span></label>
		                                            <input type="text" class="form-control" style="width: 60%;" value="${subAssetsList[0].subAccountTypeId}" readonly="readonly" id="editSub_AccountId" placeholder="<spring:message code="Accounting.SubAccount.Id" />" />
                                    	 			<span id="errorAccId" style="text-align:Left;color: red;font-size: 2;font-weight: bold;display:none;">Please enter account ID</span>
                                    	 		
                                    	 		</div>
                                    	</div>
                                    	 
                                    	 
                                    	  <div class="row" style="margin-left:20%;">
                                    	 		<div class="form-group col-lg-12">
		                                            <label><spring:message code="Accounting.Account.name" /></label>
		                                            <input type="text" class="form-control" style="width: 60%;" id="editSub_AccountName" value="${subAssetsList[0].accountName}"  placeholder="<spring:message code="Accounting.Account.name" />" />
                                    	 	</div>
                                    	 	</div>
                                    	 
                                    	 
                                    	  <div class="row" style="margin-left:20%;">
                                    	 		<div class="form-group col-lg-12">
		                                            <label><spring:message code="Accounting.discription" /></label>
		                                            <input type="text" class="form-control" style="width: 60%;" id="editSub_DiscriptionId" value="${subAssetsList[0].accountDescription}" placeholder="<spring:message code="Accounting.discription" />" />
                                    	 		</div>
                                    	 	</div>
                                    	 
                                    	 
                                  
                                    	 	
                                    	 	
                                 
                                        </div>
                                       
							<div class="form-group col-lg-6">
							<div class="row" style="margin-left:20%;">
                                    	 		<div class="form-group col-lg-12">
		                                            <label><spring:message code="Accounting.Account.Id" /><span style="color:red; font-size:2">*</span></label>
		                                            <input type="text" class="form-control" style="width: 60%;" value="${subAssetsList[0].accountId}" disabled="disabled" id="editAccountId" placeholder="<spring:message code="Accounting.Account.Id" />" />
                                    	 		
                                    	 		</div>
                                    	</div>
								<div class="row" style="margin-left:20%;">
                                 	 		<div class="form-group col-lg-12">
                                           <label><spring:message code="Accounting.Account.Type" /><!-- <span style="color:red; font-size:2">*</span> --></label>
                                              <select class="form-control" name="zoneID" id="editSub_AccountType" style="width: 60% !important;">
                                                   <!-- <option value="" id="" >Select Type</option> -->
                                                   <option value="Expenses" id="Expenses" >Expenses</option>
                                                 
                                      
				                        	  </select>
				                        	
                                           </div>
                                 	 	</div>
                                 <div class="row" style="margin-left:20%;">
                                  	 	<div class="form-group col-lg-12">
                                           <label><spring:message code="Accounting.Status" /></label>
				                              <select  class="form-control" name="Status" id="editStatusId" style="width: 60% !important;">
                                                    <option value="Active" ${'Active' == subAssetsList[0].subAccountTypeStatus ? 'selected' : ''} id="Active" >Active</option>
                                                   <option value="In Active" ${'In Active' == subAssetsList[0].subAccountTypeStatus ? 'selected' : ''} id="In Active" >In Active</option>
                                                  
				                        	  </select>
                                  	 	</div>
                                   </div>
                                           <input type="hidden" id="slectedLocations" value="${zone.zones}">
                                        </div>
                                        
                                        </div>
                                        
						<div class="row" style="text-align: center;">
						 <input type="button" style="" class="btnCls" onclick="CreateSubExpenses('Edit','0');" value="<spring:message code="submit.label" />" />
						  <c:if test="${sessionScope.role == 'super admin'}"> 
						  	<input type="button" class="btnCls buttonMargin"  onclick="ExpensesSubLedger('view','${Organization}','${accountId}','${accountname}','');" value="<spring:message code="cancel.label" />" />
						  </c:if>
						 <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                             <c:if test="${accessControl.appDocument == 'ZoneMaster' && accessControl.write == true && accessControl.read == true}">
								<input type="button" class="btnCls buttonMargin" onclick="ExpensesSubLedger('view','${Organization}','${accountId}','${accountname}','');" data-dismiss="modal" value="<spring:message code="cancel.label" />" />
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
		
	 <div id="orderitemsForLocations">         
	  <div style="overflow:auto">    
         <table id="productstocks" class="table table-bordered table-striped" style="margin-top:0%;">
          <thead style="background-color: #3c8dbc; color: #ffffff">
                 <tr>  
                 	 <th class="col-lg-1"><spring:message code="Sno" /></th>
                 	 <th class="col-lg-2"><spring:message code="Sub.Account.Id" /></th>
                 	  <th class="col-lg-1"><spring:message code="Accounting.Account.name" /></th>  
                      <th class="col-lg-2"><spring:message code="Created.date" /></th>
                     <th class="col-lg-2"><spring:message code="Status" /></th>
                       <th class="col-lg-2"><spring:message code="Accounting.account.Descreption" /></th>  
                     <th class="col-lg-1"><spring:message code="Action" /></th>
                 </tr>
             </thead>
             <tbody style="text-align: center;white-space: nowrap;">
                <c:forEach var="subAssetsList" items="${subAssetsList}" varStatus="TheCount">
             	 <tr>
             	 	 <td>${TheCount.count+index-1}</td>
             	 	 <td>${subAssetsList.subAccountTypeId}</td>
             	 	  <td>${subAssetsList.accountName}</td>
             	 	    <td>${subAssetsList.createDateStr}</td>
             	 	      <td>${subAssetsList.subAccountTypeStatus}</td>
             	 	     <td>${subAssetsList.accountDescription}</td>
             	 	    <td><a style="color:#2e7ea7 !important;cursor: pointer;margin-right:6px;" onclick="viewExpensesSubLedger('View','${subAssetsList.accountId}','${subAssetsList.subAccountTypeId}')">View</a>
                    <a style="color:#2e7ea7 !important;cursor: pointer;margin-right:6px;" onclick="viewExpensesSubLedger('Edit','${subAssetsList.accountId}','${subAssetsList.subAccountTypeId}')">Edit</a>
             		<a style="color:#2e7ea7 !important;cursor: pointer;margin-right:6px;"   onclick="viewExpensesSubTransactions('data','${subAssetsList.subAccountTypeId}','')">Data</a>
                 </td>
                 </tr>
                </c:forEach>
             </tbody>
         </table>
         </div>
         </div>
              <input type="hidden" id="flowUnder" name="flowUnder" value= "${flowUnder}">
              
              <div class="row" >
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="ExpensesSubLedger('view','','','','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="ExpensesSubLedger('view','','','','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="ExpensesSubLedger('view','','','','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="ExpensesSubLedger('view','','','','${totalValue}')">
              	</div> 
              	</c:if>
              	
              	
              	<div class="col-lg-6" style="text-align: right;"> 
              	<div class="col-lg-8" style="text-align: right;padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
              	<div class="col-lg-2" style="padding-right: 0px;">
              		<select class="form-control" id="pagination">
              		<c:set var="totalRecords" value="${totalRecords}"></c:set>
              	<c:forEach var="i" begin="0" end="${totalRecords}">
              	<c:if test="${(totalRecords)>0}">
              		<option value="${(i*maxRecords)}" ${index-1 == i*maxRecords ? 'selected' : ''}> ${i+1}</option>
              		<c:set var="totalRecords" value="${totalRecords-maxRecords}"></c:set>
              	</c:if>
				</c:forEach>
					</select>
              	
              	</div>
              		<div class="col-lg-2" style="padding-right: 0px;">
              		  <input type="button" onclick="ExpensesSubLedger('view','','','',document.getElementById('pagination').value);" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
				</div>
              	
              	
              </div> 
              
               <div id="triggerEvent"></div>
    <!-- COMPOSE MESSAGE MODAL -->
    
    
    
    
		  <div id="triggerEvent"></div>
   <div class="modal fade" id="myModalIos" role="dialog" tabindex="-1">
    <div class="modal-dialog iosmodeldialog">
    
      <!-- Modal content-->
      <div class="modal-content iospopup">
        <div class="modal-header">
       
          <button type="button" class="close" onclick="" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
       <div class="form-group col-lg-12" style="padding: 0px;font-size: 15px">
       
      
                   
                          <label><spring:message code="location.label"/></label>
	             <select class="form-control form-group" id="modaloutletlocation" >
<!-- 	             	<option value="">ALL</option> -->
	                <c:forEach var="location" items="${locationsList}">
						<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option>
					</c:forEach>
	            </select> 
                     
                    
       
          <!-- <div class="col-lg-1"> -->
         
        <!--  </div> -->
         </div>
        <div class="form-group col-lg-12"></div>
          <div class="col-lg-2 col-sm-6 col-xs-6" style=""></div>
          <div class="form-group col-lg-8 col-sm-6 col-xs-6" style="padding-left: 0px; padding-right: 0px;">
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
 <input type="button" class="iosclosebutton1" onclick="AssigendOrdersToLocation('order')"  value="Ok">
</div>
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
  <input type="button" class="iosclosebutton1" data-dismiss="modal" value="Cancel">
</div></div>
   <br/>
        </div>
        <br/>
        <div class="modal-footer" style="padding:0px;">
         <!--  <input type="button" class="iosclosebutton" data-dismiss="modal" value="Close"/> -->
        </div>
      </div>
      
		</div>
		</div>
    
    
    <div class="col-sm-12 col-lg-12 col-xs-12">
            
         <div class="modal fade popup-display" id="items-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
             <div class="col-sm-2 col-lg-2 col-xs-0">
    		</div>
           <div class="col-sm-10 col-lg-10 col-xs-12">
             <div class="modal-content billsPopUp" style="">
          <!--    <i class="fa fa-angle-up billsPopUpUpArrow" aria-hidden="true"></i> -->
                 <div class="modal-header">
                        <button type="button" class="close" style="font-size: 30px;" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" style="text-align: center;"><div id="locationLable"></div><div id="dateLable"></div></h4>
                    </div>
             <form action="#" method="post">
                 <div class="modal-body">
                  <div class="box-body table-responsive" id="summary">
                  
                     <%-- <table id="itemsList" class="table table-bordered table-hover">
                       <thead style="background-color: #3c8dbc; color: #ffffff">
                         <tr>
                             <th><spring:message code="item.desc.label"/></th>
                             <th><spring:message code="price.label"/></th>
                         </tr>
                       </thead>
                       <tbody style="text-align: center;">
			 			</tbody>
                    </table> --%>
                 </div>
              </div>
             </form> 
             </div><!-- /.modal-content -->
         </div><!-- /.modal-dialog -->
     </div><!-- /.modal -->
 	</div>
  </div>
              
               
             </div><!-- /.box-body -->
         </div><!-- /.box -->
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