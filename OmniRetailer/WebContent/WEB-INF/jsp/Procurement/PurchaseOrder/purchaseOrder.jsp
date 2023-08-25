<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah Y
 * file name		        : Inventory Manager/Billing/po.jsp
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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
		
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/procurement/purchaseOrderAndReceipts.js"></script>
        
   
       
       
<style type="text/css">
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
/*var err = $("#err").val();
if(err != "")
  */
  //alert(err);
$("#searchPurchaseOrders").val($("#purchaseOrdersSearch").val());
	$("#searchPurchaseOrders").focus();
	
	var operation = $("#operation").val();
	$('#searchPurchaseOrders').on('input',function(e){
		if($(this).val().trim()==""){
			viewPurchaseOrder(operation,'','0');
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
	<%-- <section class="content-header">
		<h1><spring:message code="warehouse.management.label" />
		<small><spring:message code="procurement.label" /></small>
	</h1>
    <ol class="breadcrumb">
        <li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
		<li class="active"><spring:message code="warehouse.management.label" /></li>
    </ol>
   </section> --%>
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
           <div class="box-header" style="text-align:center;">
           <input type="hidden" value="${po.nextWorkFlowStates}">
           <input type="hidden" value="${operation}">
          
          
           
				<c:if test="${operation == 'all'}">
				      <h3 class="box-title" style="font-size: 22px;"><spring:message code="allPurchaseOrder.label" /></h3>
				  </c:if>
				  <c:if test="${operation == 'Draft'}">
				  	 <h3 class="box-title"><spring:message code="draftPurchaseOrder.label" /></h3>
				  </c:if>
				 
			</div><!-- /.box-header -->
                                <div class="box-body table-responsive" style="padding-top:0px">
                                <div class="col-lg-11" style=" background: #f4f4f4;    padding: 4px 20px;    width: 88%;">
								<div class="row">
                                	<%--  <div class="col-lg-2" style="padding-left: 15px;padding-right:5px">
                                	<label style="font-family: Calibri;color: gray;"><spring:message code="location.label"/></label>
				                     <div class="col-lg-12" style="padding-left: 0px;padding-right:0px">
				                         <div class="col-lg-12" style="padding-left: 0px;padding-right:15px">
				                           <select class="form-control form-group" id="warehouse_location" onchange="viewPurchaseOrder('${operation}','outletPurchaseOrder','0');">
						                		<option value="">ALL</option>
							                   <c:forEach var="location" items="${locationsList}">
													<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option>
												</c:forEach>
						                  </select>
				                         </div>
				                      </div>
				                      </div> --%>
				                      
				                       <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="    padding-left: 0px;padding-right: 0px;">
                        <label style="font-family: Calibri;color: gray;"><spring:message code="zone.label"/></label>
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation','')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
                         </div>
                      </div>
                      
                        <div class="col-lg-1"></div>
						               <div class="form-group col-lg-2" style="padding-left:0px;padding-right:5px;">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="category.label" /></label>
                                             <select class="form-control" name="category" id="category" style="width: 100%;">
                                             <option value=""><spring:message code="ALL.label"/></option>
	                                            <c:forEach var="category" items="${categoryDetails}">
							        <option value="${category.categoryName}" ${category.categoryName == selectedcategory ? 'selected' : ''} id="${category}">${category.categoryName}</option>
 							       
									</c:forEach>
	                        	</select>
                                            
										</div>
                      
				           <div class="col-lg-1"></div>         
				                       <div class="col-lg-2" style="padding-left: 0px;padding-right:5px">
                                         <label style="font-family: Calibri;color: gray;"><spring:message code="supplier.name.label" /></label>
                        
						                <div class="col-lg-12" style="padding-left: 0px;padding-right:0px">
						                  <div class="col-lg-12 col-xs-8 col-sm-10 col-md-10" style="padding-left: 0px;;padding-right:0px">
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
						                
						             
						                
						                <div class="col-lg-1"></div>
						                <input type="hidden" class="form-control" name="skuid" id="skuidpo" readonly="readonly" value="${itemwise}"/>
                                     <!-- <div class="col-lg-3" style="padding-left: 0px;padding-right:5px"> -->
                                   
						                <div class="col-lg-2" style="padding-left: 0px;padding-right:15px">
						                  <label style="font-family: Calibri;color: gray;"><spring:message code="offer_start_date.label"/></label>
						                  	 <input type="hidden" id="type" value="${type}">
							                 <input type="hidden" id="sd" value="${startDate}">
						                     <input type="hidden" id="ed" value="${endDate}">
						                    <input class="form-control calendar_icon" readonly="readonly" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
						               </div>
                                       
						               
						                
						               <!-- </div> -->
						              
                                    <%--  <div class="col-lg-1" style="    padding-left: 0px;">
                                         <input type="button" style="padding: 4px 8px;    margin-top: 17px; float: right;width: 100%;" class="btn bg-olive btn-inline" onclick="searchPurchaseOrders('','','0')" value="<spring:message code="search" />" />
                                     </div> --%>
                                	</div>
                                	
							<div class="row"> 
							<div class="col-lg-2" style="   padding-left: 15px;padding-right: 15px;">
								             <label style="font-family: Calibri;color: gray;"><spring:message code="feedback.location.label"/></label>
							               <div class="col-lg-12" style="    padding-left: 0px;padding-right: 0px;">
							              
								                 <select class="form-control" id="warehouseLocation" ><!-- searchStockRequests('','','0'); -->
								                      
									                   <c:forEach var="location" items="${locationsList}">
<%-- 															<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option> --%>
													  <c:if test="${operation != 'warehouse'}">
														<c:choose>
						                                      <c:when test="${location.description == ''}">
						                                      <c:if test="${location.businessActivity != 'Warehouse'}">
							                                   <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
							                                 </c:if>
							                                 </c:when>
							                                  <c:otherwise>
							                                   <c:if test="${location.businessActivity != 'Warehouse'}">
							                                  <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}-${location.description}</option>
							                                </c:if>
							                                </c:otherwise>
							                              </c:choose>
							                              
							                              </c:if>
							                              
							                                <c:if test="${operation == 'warehouse'}">
							                                
							                                <c:choose>
						                                      <c:when test="${location.description == ''}">
							                                   <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
							                                 </c:when>
							                                  <c:otherwise>
							                                  <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}-${location.description}</option>
							                                </c:otherwise>
							                              </c:choose>
							                                
							                                </c:if>
							                              
							                              
														</c:forEach>
							                   </select>
							                 
								        	</div>
								        </div>  
								      <div class="col-lg-1"></div>   
								        <div class="col-lg-2" style="padding-left: 0px;padding-right:5px">
                                     <label style="font-family: Calibri;color: gray;"><spring:message code="itemwise.label"/></label>
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
						               <div class="col-lg-1"></div>
						               <div class="form-group col-lg-2" style="padding-left:0px;padding-right:5px;">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="supplier.id.label" /></label>
                                             <%-- <select class="form-control" name="supplierid" id="supplierid" style="width: 100%;">
	                                          <c:forEach var="supplier" items="${supplierList}">
							        <option value="${supplier.supplierCode}" ${supplier.supplierCode == supplierid ? 'selected' : ''} id="${supplierid}">${supplier.supplierCode}</option>
 							       
									</c:forEach>  
                                            </select> --%>
                 <input class="form-control" name="supplierid" id="supplierid" style="width: 100%;"type="text" value=""/>                           
										</div> 
						               
						               <div class="col-lg-1"></div> 
						             <div class="col-lg-2" style="padding-left: 0px;padding-right:15px">
						                 <label style="font-family: Calibri;color: gray;"><spring:message code="offer_end_date.label"/></label>
						                    <input class="form-control calendar_icon" readonly="readonly" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
						               </div>  
						              
								 </div>   
								 </div> 
								 <div class="col-lg-1" style="    width: 12%;    background: #ccc;">
                    <div class="col-lg-12" style="    border-top: 5px solid #ccc; border-bottom: 5px solid #ccc;">
                    <%--  <div class="row">
                       <a onclick="searchPurchaseOrders('','','0')" class="btn bg-olive btn-inline" style="padding: 4px 8px;margin-bottom: 16px;width: 100%;margin-top: 16px;"><spring:message code="searchbutton.label"/></a>
                     </div> --%>
                     <div class="row">
                       <a  style="padding: 4px 8px;margin-bottom: 16px;width: 100%;margin-top: 16px;" class="btn bg-olive btn-inline" onclick="searchPurchaseOrders('','','0')"> <spring:message code="searchbutton.label"/></a>
                     </div>
                     <div class="row">
                       <a onclick="resetForm();" style="padding: 4px 8px;margin-bottom: 16px;width: 100%;margin-top: 16px;" class="btn bg-olive btn-inline"><spring:message code="clearbutton.label"/></a>
                     </div>
                   </div>
                 </div>   
					<div class="col-lg-12" style=""> 
					
					<div class="col-lg-11" style=""> </div>
					 <div class="col-lg-1 summaryBtn"  >
			                <a id="summaryTag"  data-toggle="modal" data-target="#items-modal">
			                	<img class="summaryImg" src="${pageContext.request.contextPath}/images/summary.png" onclick="getPoSummary()" style="cursor: pointer;" >
			                </a>
			                </div> 
                 <br>
                 </div>	
               		       
	       <div class="row">
	       	<input type="hidden" id="operation" value="${operation}">
	      <div class="col-lg-1 col-xs-2" style="margin-top: 10px;">
                <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="searchPurchaseOrders('','','0');">
               		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
               		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
               		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
              		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
               	</select>
           </div>
           
	        <div class="col-lg-10 col-xs-10">
       	 		 <input type="text"  class="form-control searchItems"  value="" id="searchPurchaseOrders" placeholder="<spring:message code="search.purchase.orders.label" />"style="margin-top: 10px;    width: ;margin-left:;height:30PX;text-align: left;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
					<div class="services">
		    			<div class="items">
		     				<ul class="matchedStringUl searchPurchaseOrders" style=""></ul>
		   				</div>
					</div>
					<input type="hidden" id="purchaseOrdersSearch" value="${searchName}">
       	 	</div>
	       <div class="col-lg-1" style="margin-top: 10px;padding-left: 0px;  height: 20px; ">
			
	        	<c:if test="${sessionScope.role == 'super admin'}">
	        			<a onclick="return vewNewPurchaseOrder();" style="padding: 4px 8px;     float: right;width: 100%;" class="btn bg-olive btn-inline"><spring:message code="addnew.label" /></a>&nbsp;&nbsp;&nbsp;
						<%-- <a onclick="viewPurchaseOrder('Draft','outletPurchaseOrder','0');" class="button"><font size="2px"><spring:message code="drafts.label" /></font></a> --%>
                </c:if>
                  <c:if test="${operation == 'all'}">
              <c:forEach var="accessControl" items="${sessionScope.procurement}">
                <c:if test="${accessControl.appDocument == 'PurchaseOrder' && accessControl.write == true}">      
							<a onclick="return vewNewPurchaseOrder();" style="padding: 4px 8px;      float: right;width: 100%;" class="btn bg-olive btn-inline"><spring:message code="addnew.label" /></a>&nbsp;&nbsp;&nbsp;
					<%-- 	<a onclick="viewPurchaseOrder('Draft','outletPurchaseOrder','0');" class="button"><font size="2px"><spring:message code="drafts.label" /></font></a> --%>
				</c:if>
				
		   </c:forEach></c:if>
		   <c:if test="${operation == 'warehouse'}">
		   	 <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
              <c:if test="${accessControl.appSubDocument == 'WarehousePurchaseOrders' && accessControl.write == true}">  
              	<a onclick="return vewNewPurchaseOrder();" style="padding: 4px 8px;      float: right;width: 100%;" class="btn bg-olive btn-inline"><spring:message code="addnew.label" /></a>&nbsp;&nbsp;&nbsp;
              </c:if>
              </c:forEach>
	 </c:if>
	        </div>
	        </div>
	        
	        <div id="example1_wrapper" class="table table-bordered table-striped" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;">
                                    <table id="productstocks" class="table table-bordered table-striped" style="margin-top: 0px !important;">
                                     	<thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                                 <c:if test="${operation == 'all'}">
              <c:forEach var="accessControl" items="${sessionScope.procurement}">
                <c:if test="${accessControl.appDocument == 'PurchaseOrder' && accessControl.write == true}">      
						<th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
				</c:if>
				
		   </c:forEach></c:if>
		   <c:if test="${operation == 'warehouse'}">
		   	 <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
              <c:if test="${accessControl.appSubDocument == 'WarehousePurchaseOrders' && accessControl.write == true}">  
              	<th style="" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
              </c:if>
              </c:forEach>
	 </c:if>
	<c:if test="${sessionScope.role == 'super admin'}">
              	<th style="" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
              </c:if>
                                            	<th><div style=""><spring:message code="sl.no.label" /></div></th>
                                            	<th><spring:message code="purchase.order.receipt.ref.label" /></th>
			               						<th><spring:message code="order.date.label" /></th>
			               						
			               						<th><spring:message code="orderdby.label" /></th>
			                 					<th><spring:message code="supplier.name.label" /></th>
			                 					<th><spring:message code="Reqqty.label" /></th>
			                 					<th><spring:message code="poqty.label" /></th>
			                 					<th><spring:message code="status.label" /></th>
			                 					<th><spring:message code="total.purchase.order.value.label" /></th>
			                 					
			                 					<th><div><spring:message code="EmployeeForm.action" /></div></th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
		               						<c:forEach var="po" items="${purchaseOrderBeansList}">
		             		 				<tr>
		             		 				     <c:if test="${operation == 'all'}">
              <c:forEach var="accessControl" items="${sessionScope.procurement}">
                <c:if test="${accessControl.appDocument == 'PurchaseOrder' && accessControl.write == true}">      
							<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${po.PO_Ref}' /></td>
					<%-- 	<a onclick="viewPurchaseOrder('Draft','outletPurchaseOrder','0');" class="button"><font size="2px"><spring:message code="drafts.label" /></font></a> --%>
				</c:if>
				
		   </c:forEach></c:if>
		   	   	<c:if test="${sessionScope.role == 'super admin'}">
		   	   	  	<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${po.PO_Ref}' /></td>
		   	   	</c:if>
		   <c:if test="${operation == 'warehouse'}">
		   	 <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
              <c:if test="${accessControl.appSubDocument == 'WarehousePurchaseOrders' && accessControl.write == true}">  
              	<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${po.PO_Ref}' /></td>
              </c:if>
              </c:forEach>
	 </c:if><%-- 
		             		 				  <c:forEach var="accessControl" items="${sessionScope.procurement}">
    										<c:if test="${accessControl.appDocument == 'PurchaseOrder' && accessControl.write == true}"> 
                   							<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${po.PO_Ref}' /></td>
                   							</c:if>
                 							  </c:forEach> --%>
		             		 					<td>${po.slNo}</td>
		                 						<td>${po.PO_Ref}</td>
		                  						<td>
		                  						<c:choose>
		                  						<c:when test="${not empty po.updatedDateStr}">
		                  						${po.updatedDateStr}
		                  						</c:when>
		                  						<c:otherwise>
		                  						${po.ordereDate}
		                  						</c:otherwise>
		                  						</c:choose>
		                  						
		                  						</td>
		                  						
		                  						<td>${po.order_submitted_by}</td>
						                 	 	<td>${po.supplier_name}</td>
						                 	 		<td>
 					<c:set var="qtyissued" value="0"  />
	              <c:forEach var="summaryList" items="${po.itemsList}" varStatus="thecount">
				<c:set var="qtyissued" value="${qtyissued+summaryList.requestedQty}" scope="page" />
				</c:forEach>${qtyissued}</td>
						                  		<td>
						                  		<c:set var="qty" value="0"  />
	              <c:forEach var="summaryList" items="${po.itemsList}" varStatus="thecount">
	               <c:if test="${po.status == summaryList.status}">    
				<c:set var="qty" value="${qty+summaryList.quantity}" scope="page" />
				</c:if>
				</c:forEach>
						                  		${qty}</td>
						                 	 	<td>${po.status}</td>
						                  	<td><fmt:formatNumber value="${po.total_po_value}" type="number"/></td>
						                  		<td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewPurchaseOrderDetails('${po.PO_Ref}','view','${po.status}')">View</a> &nbsp;&nbsp;&nbsp;
						               
						              <c:if test="${po.status == 'draft'}">
									        <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewPurchaseOrderDetails('${po.PO_Ref}','edit','${po.status}')">Edit</a>&nbsp;&nbsp;&nbsp;
                                                 	</c:if>
								                   <c:choose>
								                   
                                                 	<c:when test="${ not empty po.nextWorkFlowStates}">
                                                 	
                                                 	
                                                 	     <c:if test="${operation == 'all'}">
              <c:forEach var="accessControl" items="${sessionScope.procurement}">
                <c:if test="${accessControl.appDocument == 'PurchaseOrder' && accessControl.write == true}">      
							<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewPurchaseOrderDetails('${po.PO_Ref}','edit','${po.status}')">Edit</a>&nbsp;&nbsp;&nbsp;
					<%-- 	<a onclick="viewPurchaseOrder('Draft','outletPurchaseOrder','0');" class="button"><font size="2px"><spring:message code="drafts.label" /></font></a> --%>
				</c:if>
				
		   </c:forEach></c:if>
		   	<c:if test="${sessionScope.role == 'super admin'}">
	      <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewPurchaseOrderDetails('${po.PO_Ref}','edit','${po.status}')">Edit</a>&nbsp;&nbsp;&nbsp;
		                                          
								                </c:if> 
		   <c:if test="${operation == 'warehouse'}">
		   	 <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
              <c:if test="${accessControl.appSubDocument == 'WarehousePurchaseOrders' && accessControl.write == true}">  
              	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewPurchaseOrderDetails('${po.PO_Ref}','edit','${po.status}')">Edit</a>&nbsp;&nbsp;&nbsp;
              </c:if>
              </c:forEach>
	 </c:if>
						                  
                								
                								</c:when>
                								
                								
                								
                								</c:choose>
                								
                							
                									<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return printPurchaseOrderDetails('${po.PO_Ref}','edit')">Print</a>
                								 <a  class="clickable" data-toggle="collapse" id="row${po.slNo}" data-target=".row${po.slNo}"> <span style="float:right" onclick="expand(${po.slNo})" id="categoryExpand${po.slNo}"><i class="fa fa1 fa-sort-desc" ></i></span></a>
						                  		</td> 
											</tr>
											
                    			        <tr class="collapse rowone${po.slNo}">
                                             <td></td>
                                             <td></td>
                                            	<td style="padding:3px;"><div style="padding: 5px;background: #c1c1c1;"><spring:message code="sl.no.label" /></div></td>
                                               	<td style="padding:3px;"><div style="padding: 5px;background: #c1c1c1;"><spring:message code="purchase.order.receipt.ref.label" /></div></td>
                                            	<td style="padding:3px;"><div style="padding: 5px;background: #c1c1c1;"><spring:message code="order.date.label" /></div></td>
                                            	<td style="padding:3px;"><div style="padding: 5px;background: #c1c1c1;"><spring:message code="orderdby.label" /></div></td>
                                                <td style="padding:3px;"><div style="padding: 5px;background: #c1c1c1;white-space: nowrap;"><spring:message code="supplier.name.label" /></div></td>
                                                <td style="padding:3px;"><div style="padding: 5px;background: #c1c1c1;white-space: nowrap;"><spring:message code="total.purchase.order.value.label" /></div></td>
                                                <td style="padding:3px;"><div style="padding: 5px;background: #c1c1c1;"><spring:message code="status.label" /></div></td>
                                                <td style="padding:3px;"><div style="padding: 5px;background: #c1c1c1;"><spring:message code="EmployeeForm.action" /></div></td>
                                                 
                                                <td></td></tr>
                                              <c:forEach var="logList" items="${po.previousWorkFlowLogList}" varStatus="theCount">
                                              <tr  class="collapse rowone${po.slNo}" >
                                            	<td></td>
                                            	<td></td>
                                            	<td>${theCount.count}</td>
                                            	<td>${logList.PO_Ref}</td>
                                                <td>${logList.orderDatestr}</td>
                                                <td>${logList.order_submitted_by}</td>
                                                <td>${logList.supplier_name}</td>
                                                <td>${logList.total_po_value}</td>
                                                <td>${logList.status}</td>
                                                 <td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewPurchaseOrderDetails('${logList.PO_Ref}','view','${logList.status}')">View</a>
        							
        							<td></td>
        							</tr>
        							</c:forEach>
                                             
                                        
						             	   </c:forEach> 
                                        </tbody>
                                    </table>
                                    </div>
                                    
     <div class="panel-group" id="accordion">
     <div class="col-lg-12" style="padding-right: 0px;padding-left: 0px;">
      <!-- <div class="col-lg-3" >
       </div> -->
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <div class="col-lg-12" style="padding-right: 0px;">
        	<div class="col-lg-9" style="padding: 0px;">
               <c:forEach var="FlowList" items="${workflowsList}" varStatus="theCount">
               
               <c:if test="${theCount.count==2}">
               <div class="col-lg-6" style="margin-right: 0px;">
               	<a data-toggle="modal" data-target="#myModalIos"> <input type="button" style=" font-size:14px;margin-top: 34px;border-radius: 0px;    float: right;" class="btn bg-olive btn-inline" onclick="return dispatchPo(this,'false','${operation}')" value="${FlowList.statusName} &nbsp; PO'S" /></a>
           		</div>
               </c:if>
               <c:if test="${theCount.count==4}">
               <div class="col-lg-6" style="margin-right: 0px;">
               	<a data-toggle="modal" data-target="#myModalIos"> <input type="button" style=" font-size:14px;margin-top: 34px;border-radius: 0px;" class="btn bg-olive btn-inline" onclick="return dispatchPo(this,'true','${operation}')" value="${FlowList.statusName} &nbsp; PO'S" /></a>
           		</div>
               </c:if>
               
               </c:forEach>
             <%-- <div class="col-lg-3" style="">
               <a  data-toggle="modal" data-target="#myModalIos"> <input type="button" style=" font-size:16px;margin-top: 34px;   border-radius: 0px;      float: left;" class="btn bg-olive btn-inline" onclick="return dispatchPo(this,'false')" value="<spring:message code="dispatchpo.label" />" /></a>
           </div>
           <div class="col-lg-3" style="">
               <a  data-toggle="modal" data-target="#myModalIos"> <input type="button" style=" font-size:16px;   border-radius: 0px; margin-top: 34px;     float: left;" class="btn bg-olive btn-inline" onclick="return dispatchPo(this,'true')" value="<spring:message code="conform.po.label" />" /></a>
           </div> --%>
             </div>
               <div class="col-lg-3" style="padding-right: 0px;" >
               <div class="col-lg-12" style="border-top: 2px solid #ccc;padding-left: 0px;padding-right: 0px;    border-radius: 5px; background: #ccc;">
                 <div class="col-lg-8 col-sm-8" style="text-align: right;font-size: 16px;white-space: nowrap;"><spring:message code="total.indent.qty" /></div>
					<div class="col-lg-4 col-sm-4">: ${IndentQty} </div>
					 <div class="col-lg-12" style="border-top: 2px solid #eee;padding-left: 0px;padding-right: 0px;"></div>
					 <div class="col-lg-8 col-sm-8" style="text-align: right;font-size: 16px"><spring:message code="total.po.quantity" /></div>
					<div class="col-lg-4 col-sm-4">: ${PoQty} </div>
					 <div class="col-lg-12" style="border-top: 2px solid #eee;padding-left: 0px;padding-right: 0px;"></div>
             <div class="col-lg-8 col-sm-8" style="text-align: right;font-size: 16px"><spring:message code="total.purchase.order.value.label" /></div>
					<div class="col-lg-4 col-sm-4">: ${POValue} </div>
					</div>
              </div>
            
            <div class="col-lg-6" style="">
                  
           </div>
            </div></div>
                             <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-2" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewPurchaseOrder('${operation}','outletPurchaseOrder','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-2" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewPurchaseOrder('${operation}','outletPurchaseOrder','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewPurchaseOrder('${operation}','outletPurchaseOrder','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewPurchaseOrder('${operation}','outletPurchaseOrder','${totalValue}')">
              	</div> 
              	</c:if>
              	
              	<br>
              	<div class="col-lg-3" style=""></div>
              	 
              	<!-- <div class="col-lg-4" style=""></div> -->
              
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
              		  <input type="button" onclick="viewPurchaseOrder('${operation}','outletPurchaseOrder',document.getElementById('pagination').value)" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
				</div>
              	
              	
              </div>                 
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
  
</div>
</div>

  <div id="triggerEvent"></div>
    <!-- COMPOSE MESSAGE MODAL -->
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
          <input type="button" class="iosclosebutton" onclick="return viewPurchaseOrder('${operation}','outletPurchaseOrder','0','menu');" data-dismiss="modal" value="Close"/>
        </div>
      </div>
		</div>
		</div>
    <div class="col-sm-12 col-lg-12 col-xs-12" >
            
         <div class="modal fade popup-display" id="items-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
             <div class="col-sm-8 col-lg-8 col-xs-0">
    		</div>
           <div class="col-sm-4 col-lg-4 col-xs-12">
             <div class="modal-content billsPopUp" style="">
          
                 <div class="modal-header">
                        <button type="button" class="close" style="font-size: 30px" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" style="text-align: center;"><spring:message code="po.summary.label" /></h4>
                    </div>
             <form action="#" method="post">
                 <div class="modal-body">
                  <div class="box-body table-responsive" id="summary">
                   <div id="stockIssueSummary"></div> 	
                  
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
                        "bAutoWidth": false,
                        "scrollX": true
          			});
                 });
        </script>
        <input type="hidden" id="status" value="${status}">
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/>
</body>
</html>