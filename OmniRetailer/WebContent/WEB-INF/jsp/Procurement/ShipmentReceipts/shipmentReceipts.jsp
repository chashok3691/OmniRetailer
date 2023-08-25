<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah Y
 * file name		        : Inventory Manager/warehouse/procurement/procurement.jsp
 * file type		        : JSP
 * description				: display total billings
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html>
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
           <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script> 
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/procurement/purchaseOrderAndReceipts.js"></script>
        
<style type="text/css">
.fa1{
   /*    border: 1px solid grey;
    border-radius: 50%;
    width: 29px;
    text-align: center;
    height: 28px; */
        margin-top: -10px;
    font-size: 26px;
        cursor: pointer;
    color: grey;
}
.fa-sort-asc{
margin-top: 5px !important;
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
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
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
.iosclosebutton {
    width: 25%;
    border: 1px solid #3c8dbc;
    background: #3c8dbc;
    color: #fff;
    font-size: 15px!important;
    padding: 3px 0 4px 0;
    height: 30px!important;
    font-size: 18px;
    letter-spacing: 1px;
    float: right;
}
.iospopup {
    width: 22%!important;
    margin-left:45%;
    margin-top: 0%;
    border-radius: 0;
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
		margin-top: 3px;
	}
}
@media (min-width: 1200px){
	.summaryImg{
	     width: 50%;
    float: right;
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
	callCalender('from');
	callCalender('to');
var err = $("#err").val();
if(err != "")
  //alert(err);
$("#searchShipmentReceiptId").val($("#shipmentReceiptSearch").val());
	$("#searchShipmentReceiptId").focus();
	
	
	
	
	var operation = $("#operation").val();
	$('#searchShipmentReceiptId').on('input',function(e){
		if($(this).val().trim()==""){
			viewShipmentReceipts(operation,'','0');
		}
	});
	
	
	var sDate=$("#sd").val();
	var s=sDate.split(' ');
	$("#from").val(s[0]);
	var eDate=$("#ed").val();
	var e=eDate.split(' ');
	$("#to").val(e[0]);
	
});
</script>
</head>
<body>
<%-- 	<section class="content-header">
		<h1><spring:message code="warehouse.management.label" />
		<small><spring:message code="procurement.label" /></small>
	</h1>
    <ol class="breadcrumb">
        <li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
		<li class="active"><a style="cursor: pointer;" onclick="showWarehouseFlows('warehouseDetails');"><spring:message code="warehouse.management.label" /></a></li>
		<li class="active"><a style="cursor: pointer;" onclick="showProcurementFlow()"><spring:message code="procurement.label" /></a></li>
    </ol>
   </section> --%>
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
           <div class="box-header">
				 <c:if test="${operation == 'all'}">
				      <h3 class="box-title"><spring:message code="allProcurement.label" /></h3>
				  </c:if>
				  <c:if test="${operation == 'draft'}">
				  	 <h3 class="box-title"><spring:message code="draftProcurement.label" /></h3>
				  </c:if>
			</div><!-- /.box-header -->
                                <div class="box-body table-responsive" >
        						  <div class="row" style="    margin-left: 1px; margin-right: 1px;">
				                       <input type="hidden" id="flowUnder" value="${flowUnder}">
				                       
				                       <div class="col-lg-11" style=" background: #f4f4f4;  width: 88%;    padding: 10px 20px; ">
				                       
				                       <div class = "row">
				                       
				                       
				                        <div class="col-lg-2" style="padding-left: 5px !important;padding-right:5px !important">
                                         <label><spring:message code="supplier.name.label" /></label>
                        
						                <div class="col-lg-12" style="padding-left: 0px;padding-right:0px">
						                  <div class="col-lg-12 col-xs-8 col-sm-10 col-md-10" style="padding-left: 0px;;padding-right:15px">
						                   <input type="text" value="${supplier}"  class="form-control searchItems vendorid" placeholder="<spring:message code="search.supplier.label" />"  style="background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" name="supplier_name" id="searchSupplier" value="${purchaseOrderBeanObj.supplier_name}" />
										<div class="services">
				    					<div class="items">
				     					<ul class="matchedStringUl supplier" style="width: 89%!important;padding: 0px!important;"></ul>
				   						</div>
										</div>
						                  </div>
						               </div>
						               </div>
						               <input type="hidden" class="form-control" name="supplier_Id" id="supplier_Id" readonly="readonly" value="${supplier}"/>
						               
				                         
						                <div class="col-lg-2" style="padding-left: 5px;padding-right:5px">
                                     <label><spring:message code="itemwise.label"/></label>
						                <div class="col-lg-12" style="padding-left: 0px;padding-right:0px">
						                  <div class="col-lg-12 col-xs-8 col-sm-10 col-md-10" style="padding-left: 0px;;padding-right:0px">
						                    <input type="text" value="${itemwise}"  class="form-control searchItems itemwise" id="searchItems"  placeholder="<spring:message code="search.items.here.label" />"  style="background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
										<div class="services">
						    				<div class="items">
						     				<ul class="matchedStringUl itemname" style=""></ul>
						   					</div>
										</div>
						                  </div>
						               </div>
						               </div>
						                
						               
				                        <div class="col-lg-6"></div>
				                       
				                        <div class="col-lg-2" style="padding-left: 0px;padding-right:5px">
						                <div class="col-lg-12" style="padding-left: 0px;padding-right:15px">
						                  	 <input type="hidden" id="type" value="${type}">
							                 <input type="hidden" id="sd" value="${startDate}">
						                   
						            <label><spring:message code="offer_start_date.label"/></label>
						                    <input class="form-control  calendar_icon" readonly="readonly" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
						               </div>
						              
						               </div>
				                       
				                       
				                       
				                       
				                       </div>
				                       
				                         <div class = "row">
				                                 
						                 <div class="col-lg-2" style="   padding-left: 5px;padding-right: 20px;">
								             <label><spring:message code="location.label"/></label>
							               <div class="col-lg-12" style="    padding-left: 0px;padding-right: 0px;">
							              
								                 <select class="form-control" id="warehouseLocation" ><!-- searchStockRequests('','','0'); -->
								                       <option value=""><spring:message code="ALL.label"/></option>
									                   <c:forEach var="location" items="${locationsList}">
<%-- 															<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option> --%>
														
														  <c:choose>
						                                      <c:when test="${location.description == ''}">
							                                   <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
							                                 </c:when>
							                                  <c:otherwise>
							                                  <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}-${location.description}</option>
							                                </c:otherwise>
							                              </c:choose>
														
														</c:forEach>
							                   </select>
							                 
								        	</div>
								        </div>
						         <div class="col-lg1-2 col-lg-2"   style=" padding-right: 5px;padding-left: 5px;">
                      			 <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="category.label"/></label>
                           <select class="form-control" id="outletCategory" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="categoryList" items="${categoryList}">
									<option value="${categoryList.categoryName}" ${categoryList.categoryName == category ? 'selected' : ''} id="${categoryList.categoryName}" >${categoryList.categoryName}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                      
                       <div class="col-lg-6"></div>
				                       
				                        <div class="col-lg-2" style="padding-left: 0px;padding-right:5px">
						                <div class="col-lg-12" style="padding-left: 0px;padding-right:15px">
						                  	
						                     <input type="hidden" id="ed" value="${endDate}">
						           
						              
						                <label><spring:message code="offer_end_date.label"/></label>
						                    <input class="form-control  calendar_icon" readonly="readonly" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
						               </div>
						               </div>
                      
                      
				                         
				                         </div>
				                       
				                      
						       
						                <input type="hidden" class="form-control" name="skuid" id="skuidpo" readonly="readonly" value="${itemwise}"/>
                                    
						              </div>
                                     <div class="col-lg-1" style=" height:116px;   width: 12%;    background: #ccc;">
                                         <input type="button" style="padding: 4px 8px;width: 100%;margin-top: 18px;" class="btn bg-olive btn-inline" onclick="searchShipmentReceipt('','','0')" value="<spring:message code="search" />" />
                                         <input type="button" style="padding: 4px 8px;width: 100%;margin-top: 18px;" class="btn bg-olive btn-inline" onclick="viewShipmentReceipts('all','outletgoodsReceipts','0','procurement','menu');" value="<spring:message code="clearbutton.label" />" />
                                         
                                     </div>
                                	</div>
                                		       <div class="row">
			                <div class="col-lg-11"></div>
			                <div class="col-lg-1 summaryBtn">
			                <a id="summaryTag"  data-toggle="modal" data-target="#items-modal">
			                	<img class="summaryImg" src="${pageContext.request.contextPath}/images/summary.png" onclick="getgoodsReceiptSummary()" style="cursor: pointer;" >
			                </a>
			                </div>
			          </div>
        			<%-- <c:if test="${flowUnder != 'management' }">
	        		  <div class="row">
	        		  <input type="hidden" id="operation" value="${operation}">
				      <div class="col-lg-1 col-xs-2" style="margin-top: 10px;">
			                <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="searchShipmentReceipt('','','0');">
			               		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
			               		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
			               		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
			              		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
			               	</select>
			           </div>
       					<div class="col-lg-11 col-xs-10">
		        	 		 <input type="text"  class="form-control searchItems"  value="" id="searchShipmentReceipt" placeholder="<spring:message code="search.shipment.receipts" />"style="margin-top: 10px;    width: ;margin-left:;height:30PX;text-align: center;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
								<div class="services">
					    			<div class="items">
					     				<ul class="matchedStringUl searchShipmentReceipt" style=""></ul>
					   				</div>
								</div>
								<input type="hidden" id="shipmentReceiptSearch" value="${searchName}">
		        	 	</div>
		        	 	</div>
		        	 </c:if> --%>
                                	
       <%--  <c:if test="${flowUnder == 'management' }">     --%>               	
		<div class="row">
	       	<input type="hidden" id="operation" value="${operation}">
	      <div class="col-lg-1 col-xs-2" style="margin-top: 10px;">
                <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="searchShipmentReceipt('','','0');">
               		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
               		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
               		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
              		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
               	</select>
           </div>
	        <div class="col-lg-9 col-xs-9">
       	 		 <input type="text"  class="form-control searchItems"  value="${searchName}" id="searchShipmentReceiptId" placeholder="<spring:message code="search.shipment.receipts" />"style="margin-top: 10px;    width: ;margin-left:;height:30PX;text-align: left;;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
					<div class="services">
		    			<div class="items">
		     				<ul class="matchedStringUl searchShipmentReceipt" style=""></ul>
		   				</div>
					</div>
					<input type="hidden" id="shipmentReceiptSearch" value="${searchName}">
       	 	</div>
       	 	
       	 
       	 	
       	 	
	       <div class="col-lg-1" style="margin-top: 10px;padding-left: 0px;height:20px">
			
	        	<c:if test="${sessionScope.role == 'super admin'}">
	        		<a onclick="return viewNewShipmentReceipt();" style="padding: 4px 8px;width: 100%;" class="btn bg-olive btn-inline"><spring:message code="addnew.label" /></a>&nbsp;&nbsp;&nbsp;
					<%-- <a onclick="viewShipmentReceipts('draft','','0');" class="button"><font size="2px"><spring:message code="drafts.label" /></font></a> --%>
                </c:if>
                <c:if test="${sessionScope.role != 'super admin'}">
        			<c:if test="${flowUnder == 'procurement'}">
	        			<c:forEach var="accessControl" items="${sessionScope.procurement}">
                           <c:if test="${accessControl.appDocument == 'ShipmentReceipts' && accessControl.write == true}">
								<a onclick="return viewNewShipmentReceipt();" style="padding: 4px 8px;width: 100%;" class="btn bg-olive btn-inline"><spring:message code="addnew.label" /></a>&nbsp;&nbsp;&nbsp;
								<%-- <a onclick="viewShipmentReceipts('draft','','0');" class="button"><font size="2px"><spring:message code="drafts.label" /></font></a> --%>
						  </c:if>
						</c:forEach>
        			</c:if>
        			<c:if test="${flowUnder == 'warehouse'}">
	        			<c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
                           <c:if test="${accessControl.appSubDocument == 'WarehouseGRN' && accessControl.write == true}">
								<a onclick="return viewNewShipmentReceipt();" style="padding: 4px 6px;width: 100%;font-size: 15px !important;" class="btnCls addBtn"><spring:message code="addnew.label" /></a>&nbsp;&nbsp;&nbsp;
								<%-- <a onclick="viewShipmentReceipts('draft','','0');" class="button"><font size="2px"><spring:message code="drafts.label" /></font></a> --%>
						  </c:if>
						</c:forEach>
        			</c:if>
        		</c:if>
	       
	        </div>
	        	<div class="col-lg-1 col-xs-1" style="margin-top: 10px;padding-left: 0px;height:20px">
       	 		 <input type="button" style="width: 100%;padding: 4px 8px;" class="btn bg-olive btn-inline" onclick="searchShipmentReceipt('','','0',true)" value="Save" />
       	 	
       	 	
       	 	</div>
	       </div>
	       <%-- </c:if> --%><div style="overflow: auto;white-space: nowrap;">
                                    <table id="productstocks" class="table table-bordered table-striped" style="margin-top: 0px !important;">
                                     	<thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                             <c:choose>
                                             <c:when test="${flowUnder=='warehouse'}">
                                             <th><div><spring:message code="sl.no.label" /></div></th>
                                             <th><spring:message code="procurement.receipt.ref.label" /></th>
                                            	<th><spring:message code="po.reference.label" /></th>
                                            	<th><spring:message code="warehouse.invoices.orderref.label" /></th>
                                            <th><spring:message code="inwared.label" /></th>
					               				<th><spring:message code="supplier.name.label" /></th>
					                 			<th><spring:message code="poqty.label" /></th>
					                 			<th><spring:message code="deliveredqty.label" /></th>
					                 			<th><spring:message code="procurement.status.label" /></th>
					                 			<th><div><spring:message code="EmployeeForm.action" /></div></th>
                                             </c:when>
                                             <c:otherwise>
                                             <th><div><spring:message code="sl.no.label" /></div></th>
                                            	<th><spring:message code="po.reference.label" /></th>
                                            	<th><spring:message code="procurement.receipt.ref.label" /></th>
                                            	<th><spring:message code="warehouse.invoices.orderref.label" /></th>
                                            	<th><spring:message code="location.label" /></th>
                                            	<th><spring:message code="inwared.label" /></th>
					               				<th><spring:message code="supplier.name.label" /></th>
					                 			<th><spring:message code="cost.label" /></th>
					                 			<th><spring:message code="procurement.status.label" /></th>
					                 			<th><div><spring:message code="EmployeeForm.action" /></div></th>
                                             </c:otherwise>
                                            	</c:choose>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
							               		<c:forEach var="procurement" items="${procurementReceiptList}" varStatus="theCount">
							             		 <tr>
							             		 	
							             		 	 <c:choose>
                                             <c:when test="${flowUnder=='warehouse'}">
 											<td>${procurement.slNo}</td>
 											<td>${procurement.receiptNoteId}</td>
							             	<td>${procurement.poRef}</td>
							             	<td>${procurement.invoiceRefNumber}</td>
                                            <td>${procurement.updatedDateStr}</td>
							              	<td>${procurement.supplierName}</td>
							                <td>${procurement.orderedQty}</td>
					                  		<td>${procurement.suppliedQty }</td>
							                 <td>${procurement.status}</td>
                                             </c:when>
                                             <c:otherwise>
                                             
                                            <td>${procurement.slNo}</td>
							             	<td>${procurement.poRef}</td>
							             	<td>${procurement.receiptNoteId}</td>
							             	<td>${procurement.invoiceRefNumber}</td>
							             	<td>${procurement.location}</td>
                                            <td>${procurement.updatedDateStr}</td>
							              	<td>${procurement.supplierName}</td>
					                  		<td><fmt:formatNumber value="${procurement.totalCost}" type="number"/></td>
					                  		
							                 <td>${procurement.status}</td>
                                             </c:otherwise>
                                             </c:choose>
							              			
							                  		<td>
							                 <c:choose>
                                             <c:when test="${flowUnder=='warehouse'}">
                                             <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewShipmentReceiptDetails('${procurement.receiptNoteId}')">View</a>
                                          
                                             </c:when>
                                             <c:when test="${flowUnder=='procurement'}">
                                             <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewShipmentReceiptDetails('${procurement.receiptNoteId}')">View</a>
          
          </c:when>                    
                                             <c:otherwise>
                                            
                                             <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewShipmentReceiptDetails('${procurement.receipt_ref_num}')">View</a>
          
                                         </c:otherwise>
                                             </c:choose>
							                  		
							                  		<%-- <c:if test="${procurement.status=='draft'}">
							                  			&nbsp;&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return editShipmentReceiptDetails('${procurement.receipt_ref_num}')">Edit</a>
                									</c:if> --%>
											        <c:if test="${sessionScope.role != 'super admin'}">
									        			<c:if test="${flowUnder == 'procurement'}">
									        			<input type="hidden" id="123456">
									        			<c:choose>
									        				<c:when test="${ not empty procurement.nextActivities}"> 
									        				<input type="hidden" id="1234567">
										        			<c:forEach var="accessControl" items="${sessionScope.procurement}">
										        			<input type="hidden" id="123456897">
									                           <c:if test="${accessControl.appDocument == 'ShipmentReceipts' && accessControl.write == true}">
																	&nbsp;&nbsp;&nbsp;
																	
																	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return editShipmentReceiptDetails('${procurement.receiptNoteId}','')">Edit</a>
															  </c:if>
															</c:forEach>
															</c:when>
															
															<c:when test="${procurement.status=='draft'}">
															 &nbsp;&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return editShipmentReceiptDetails('${procurement.receiptNoteId}','')">Edit</a>
															</c:when>
															
															</c:choose>
									        			</c:if>
									        			<c:if test="${flowUnder == 'warehouse'}">
									        			<c:choose>
                                                 	<c:when test="${ not empty procurement.nextWorkFlowStates}"> 
									        			<c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
                                                              <c:if test="${accessControl.appSubDocument == 'WarehouseGRN' && accessControl.write == true}">
						   		                           &nbsp;&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return editShipmentReceiptDetails('${procurement.receiptNoteId}','')">Edit</a>
															  </c:if>
															</c:forEach>
															</c:when>
															<c:when test="${procurement.status=='draft'}">
															 &nbsp;&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return editShipmentReceiptDetails('${procurement.receiptNoteId}','')">Edit</a>
															</c:when>
															</c:choose>
									        	<%--   <c:choose>
                                                 	<c:when test="${ not empty procurement.nextWorkFlowStates}"> 
										        			<c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
                                                              <c:if test="${accessControl.appSubDocument == 'WarehouseShipmentReceipt' && accessControl.write == true}">
						   		                           &nbsp;&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return editShipmentReceiptDetails('${procurement.receiptNoteId}')">Edit</a>
															  </c:if>
															</c:forEach></c:when>
															- <c:when test="${procurement.status=='draft'}">
															 &nbsp;&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return editShipmentReceiptDetails('${procurement.receiptNoteId}','')">Edit</a>
													</c:when> 
															</c:choose> --%>
															<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return printgrnDetails('${procurement.receiptNoteId}','edit')">&nbsp;&nbsp;&nbsp;Print</a>
									        			</c:if>
									        			<c:if test="${flowUnder == 'procurement'}">
									        			<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return printbusinessdocument('OutletGrn','${procurement.receiptNoteId}')">&nbsp;&nbsp;&nbsp;Print</a>
									        			</c:if>
									        		</c:if>
									        		<a  class="clickable" data-toggle="collapse" id="row${procurement.slNo}" data-target=".row${procurement.slNo}"> <span style="float:right" onclick="expand(${procurement.slNo})" id="categoryExpand${procurement.slNo}"><i class="fa fa1 fa-sort-desc"></i></span></a>
												</tr>
												   <tr  class="collapse rowone${procurement.slNo}">
                                          		<td></td><td></td>
                                            	<td style="padding:3px;"><div style="padding: 5px;background: #c1c1c1;"><spring:message code="sl.no.label" /></div></td>
                                            	<td style="padding:3px;"><div style="padding: 5px;background: #c1c1c1;"><spring:message code="itemneme.label" /></div></td>
                                            	<td style="padding:3px;"><div style="padding: 5px;background: #c1c1c1;"><spring:message code="order.qty.label" /></div></td>
                                              
                                                <td style="padding:3px;"><div style="padding: 5px;background: #c1c1c1;"><spring:message code="order.price.label" /></div></td>
                                               <td style="padding:3px;"><div style="padding: 5px;background: #c1c1c1;"><spring:message code="suppliedqty.label" /></div></td>
                                                <td style="padding:3px;"><div style="padding: 5px;background: #c1c1c1;"><spring:message code="suppliedprice.label" /></div></td>
                                                <td style="padding:3px;"><div style="padding: 5px;background: #c1c1c1;"> <spring:message code="EmployeeForm.action" /></div></td>
                                                
                                                <td></td></tr>
                                              <c:forEach var="itemDetails" items="${procurement.itemsList}" varStatus="theCount">
                                              <tr  class="collapse rowone${procurement.slNo}" >
                                            <td></td><td></td>
                                            	<td>${theCount.count}</td>
                                            	<td>${itemDetails.itemDesc}</td>
                                                <td id="">${itemDetails.orderQty}</td>
                                              	<input type="hidden" value="${itemDetails.skuId}" id="skuId${procurement.receiptNoteId}${theCount.count}"/>
                                                <td>${itemDetails.orderPrice}</td>
                                               
                                               <c:choose>
                  								<c:when test="${itemDetails.trackingRequired == true}">
                  								 <td style="padding: 0px;"> <input readonly type="number" style="border: none;    border: none;height: 100%;text-align: center;" class="${procurement.receiptNoteId}" id="approvedQty${procurement.receiptNoteId}${theCount.count}" value="${itemDetails.suppliedQty}"/></td>
                  							    </c:when>
                  							    <c:otherwise>
                  							  <td style="padding: 0px;"> <input type="number" style="border: none;    border: none;height: 100%;text-align: center;" class="${procurement.receiptNoteId}" id="approvedQty${procurement.receiptNoteId}${theCount.count}" value="${itemDetails.suppliedQty}"/></td>
                  							   </c:otherwise>
                  							   </c:choose>
                                               
                                               
                                                <td style="padding: 0px;"> <input type="number" style="border: none;    border: none;height: 100%;text-align: center;" id="supplyPrice${procurement.receiptNoteId}${theCount.count}" value="${itemDetails.supplyPrice}"/></td>
                                                <td style="padding: 0px;"><img src="${pageContext.request.contextPath}/images/save.png" style="width:25%;cursor:pointer;" id="update${theCount.count}" onclick="updateShippentReceipt('${procurement.receiptNoteId}')"/></td>
														<td></td>
        							</tr></c:forEach>
							             	   </c:forEach> 
                                        </tbody>
                                       
                                    </table>
             </div>
                                               <div class="panel-group" id="accordion">
             <div class="col-lg-12" style="">
              <div class="col-lg-6" style="">
               <a  data-toggle="modal" > <input type="button" style="    border-radius: 0px;      float: right;" class="btn bg-olive btn-inline" onclick="return createGrn(this)" value="<spring:message code="creategrn.label" />" /></a>
           </div>
            <div class="col-lg-6" style="">
                  
           </div>
              </div></div>
               <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-2" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewShipmentReceipts('${operation}','','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-2" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewShipmentReceipts('${operation}','','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		<div class="form-group col-lg-2" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              <c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-2" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewShipmentReceipts('${operation}','','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewShipmentReceipts('${operation}','','${totalValue}')">
              	</div> 
              	</c:if>
              	
              	
              	
              	<div class="col-lg-4" style=""></div>
              	
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
              		  <input type="button" onclick="viewShipmentReceipts('${operation}','',document.getElementById('pagination').value)" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
				</div>
              	
              	  <input type="hidden" id="stockdownloadurl" value="${downloadurl}">
              
              </div>         
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
  
</div>
</div>
 <div id="triggerEvent"></div>
   <div class="modal fade" id="myModalIos" role="dialog" tabindex="-1">
    <div class="modal-dialog iosmodeldialog">
    
      <!-- Modal content-->
      <div class="modal-content iospopup">
     <!--    <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div> -->
        <div class="modal-body">
          <p><div id="po"></div></p>
        </div>
        <div class="modal-footer" style="padding:0px;">
          <input type="button" class="iosclosebutton" onclick="return viewShipmentReceipts('all','','0',${flowUnder},'');" data-dismiss="modal" value="Close"/>
        </div>
      </div>
		</div>
		</div>
    <!-- COMPOSE MESSAGE MODAL -->
    
    <div class="col-sm-12 col-lg-12 col-xs-12" >
            
         <div class="modal fade popup-display" id="items-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
             <div class="col-sm-6 col-lg-6 col-xs-0">
    		</div>
           <div class="col-sm-6 col-lg-6 col-xs-12">
             <div class="modal-content billsPopUp" style="font-size:18px;">
          
                 <div class="modal-header">
                        <button type="button" class="close" style="font-size: 30px" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" style="text-align: center;"><spring:message code="grn.summary.label" /></h4>
                    </div>
             <form action="#" method="post">
                 <div class="modal-body">
                  <div class="box-body table-responsive" id="summary">
                   <div id="stockrequestSummary"></div> 	
                  
                 </div>
              </div>
             </form> 
             </div><!-- /.modal-content -->
         </div><!-- /.modal-dialog -->
     </div><!-- /.modal -->
 	</div>
  </div>
</section>
        <script type="text/javascript">
            $(function() {
              //  $("#productstocks").dataTable();
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
        <input type="hidden" id="status" value="${status}">
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/>
</body>
</html>