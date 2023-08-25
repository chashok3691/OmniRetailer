<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Viswanath
 * file name		        : Inventory Manager/warehouse/ShipmentReturn.jsp
 * file type		        : JSP
 * description				: The warehouseStockReturn form is displayed using this jsp
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>  
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
         <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script> 
         <script type="text/javascript" src="${pageContext.request.contextPath}/js/procurement/shipmentReturn.js"></script> 
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
	padding: 5px 7px 5px 7px;
	background: #3c8dbc;

/* 	border-radius: 5px;
	box-shadow:1px 0px 2px #000; */
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}

</style>       
<script type="text/javascript">
$(document).ready(function(){
	callCalender('from');
	callCalender('to');
/* window.onload = function(){ document.getElementById("loading").style.display = "none" } */ 
var err = $("#err").val();
if(err != "")
  alert(err);
$("#searchShipmentReturnsId").val($("#shipmentReturns").val());
	$("#searchShipmentReturnsId").focus();
	$('#searchShipmentReturnsId').on('input',function(e){
		if($(this).val().trim()==""){
			viewShipmentReturn('','0'); 
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

 <!-- Content Header (Page header) -->
<%-- <section class="content-header">
   <h1><spring:message code="warehouse.management.label" />
     <small><p id="heading"><spring:message code="shipment.label" /></p></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><spring:message code="warehouse.management.label" /></li>
       </ol>
 </section>
 --%>
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
  <div class="box box-primary">
        <div class="box-header" style="text-align:center">
        	<h3 class="box-title" style="border: 1px solid;padding: 2px 10px 2px 10px;">Shipment Return</h3>
        </div><!-- /.box-header -->
        <div class="box-body table-responsive" style="padding-top: 0px">
           <div class="row" style="margin-left: 1px;margin-right: 1px;margin-bottom: 1%;">
           <div class="col-lg-11" style="background: #f4f4f4;width: 88%;padding: 10px 20px;">
	       <div class="col-lg-2" style="padding-right: 5px;">
	        <label style="font-family: Calibri;color: gray;"><spring:message code="location.label"/></label>
               <div class="col-lg-12" style="padding-left: 0px;padding-right: 0px;">
                 <div class="col-lg-12 col-xs-10 col-sm-10 col-md-10" style="padding-left: 0px;">
	             <select class="form-control " id="outletLocation" onchange="searchShipmentReturns('','','0','');">
                      <option value=""><spring:message code="ALL.label"/></option>
                     
					   <c:forEach var="location" items="${locationsList}">
									<option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
								 </c:forEach>
                  </select>
	           </div>
	        </div>
	        </div>
	        <div class="col-lg-2" style="padding-left: 0px;padding-right:0px">
	         <label style="font-family: Calibri;color: gray;"><spring:message code="supplier.name.label" /></label>
						                  <div class="col-lg-12 col-xs-8 col-sm-10 col-md-10" style="padding-left: 0px;;padding-right:15px">
						                   <input type="text" value="${supplier}"  class="form-control searchItems vendorid" placeholder="<spring:message code="search.supplier.label" />"  style="background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" name="supplier_name" id="searchSupplier" value="${purchaseOrderBeanObj.supplier_name}" />
										<div class="services">
				    					<div class="items">
				     					<ul class="matchedStringUl supplier" style="width: 89%!important;padding: 0px!important;"></ul>
				   						</div>
										</div>
						                  </div>
						      </div>
						       <div class="col-lg1-2 col-lg-2"   style=" padding-right: 0px;padding-left: 0px;">
                      			 <div class="col-lg-12" style="padding-left:0px;padding-right: 15px;">
                            <label style="font-family: Calibri;color: gray;"><spring:message code="category.label"/></label>
                           <select class="form-control" id="outletCategory" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="categoryList" items="${categoryList}">
									<option value="${categoryList.categoryName}" ${categoryList.categoryName == category ? 'selected' : ''} id="${categoryList.categoryName}" >${categoryList.categoryName}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
						      
						      
						      <div class="col-lg-4" ></div>
	        <div class="col-lg-2" style="    padding-right: 0px;">
		                  <input type="hidden" id="sd" value="${startDate}">
                      	  <input type="hidden" id="ed" value="${endDate}">
	                     <label style="font-family: Calibri;color: gray;"><spring:message code="offer_start_date.label"/></label>
	                <div class="col-lg-12" style="    padding-left: 0px;padding-right: 0px;">
	                <div class="col-lg-12 col-xs-8 col-sm-12 col-md-12" style="padding-left: 0px;">
	                    <input class="form-control calendar_icon " readonly="readonly" value="" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
	                  </div>
                     </div>
         
	          </div>
	          
	                 <div class="col-lg-2" style="padding-right: 5px;">
	        <label style="font-family: Calibri;color: gray;"><spring:message code="zone.label"/></label>
               <div class="col-lg-12" style="padding-left: 0px;padding-right: 0px;">
                 <div class="col-lg-12 col-xs-10 col-sm-10 col-md-10" style="padding-left: 0px;">
	             <select class="form-control " id="zone" >
                      <option value=""><spring:message code="ALL.label"/></option>
                     
					    <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
                  </select>
	           </div>
	        </div>
	        </div>
	         <div class=" col-lg-2" style="padding-left:0px;">
	         <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="supplier.id.label" /></label>
                                          
                 <input class="form-control" name="supplierid" id="supplier_Id" style="width: 100%;"type="text" value="${supplierid}"/>                           
										</div> 
										</div>
	         
	         <div class="col-lg-2" style="padding-left: 0px;">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                            <label style="font-family: Calibri;color: gray;"><spring:message code="subcategory.label"/></label>
                           <select class="form-control" id="outletSubcategory" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="subCategoryDetailsList" items="${subCategoryDetailsList}">
									<option value="${subCategoryDetailsList.subcategoryName}" ${subCategoryDetailsList.subcategoryName == subcategory ? 'selected' : ''} id="${subCategoryDetailsList.subcategoryName}" >${subCategoryDetailsList.subcategoryName}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
	         <div class="col-lg-4" ></div>
	         
	        <div class="col-lg-2" style="    padding-right: 0px;">
           
                    <label style="font-family: Calibri;color: gray;"><spring:message code="offer_end_date.label"/></label>
                 <div class="col-lg-12" style="padding-left: 0px;padding-right: 0px;">
			        <div class="col-lg-12 col-xs-8 col-sm-12 col-md-12" style="padding-left: 0px;">
	                    <input class="form-control calendar_icon " readonly="readonly" value="" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
	               
	                  <span id="EndDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	                </div>
	           </div>
	          </div>
	          
	          
	          
	          
	          </div>
	          
	           <div class="col-lg-1" style="height: 116px;width: 12%; background: #ccc;">
            <div class="col-lg-12" style="padding-left: 0px">
                    <input type="hidden" id="type" value="${type}">
                        <input type="button" style="margin-top: 18px" class="btn bg-olive btn-inline addBtn" onclick="searchShipmentReturns('','','0','')" value="<spring:message code="search" />" />
           </div>
             <div class="col-lg-12" style="padding-left: 0px">
                    <input type="hidden" id="type" value="${type}">
                        <input type="button" style="margin-top: 18px" class="btn bg-olive btn-inline addBtn" onclick="resetForm()" value="<spring:message code="clearbutton.label" />" />
           </div>
           </div>
	      </div>
	     
            <div class="row">
	      <div class="col-lg-1 col-xs-2" style="">
                <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="searchShipmentReturns('','','0','');">
               		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
               		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
               		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
              		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
               	</select>
           </div>
	        <div class="col-lg-10 col-xs-10" style="padding-left:0px;">
       	 		 <input type="text"  class="form-control searchItems searchBar"  value="${searchName}" id="searchShipmentReturnsId" placeholder="<spring:message code="search.shipments.label" />"  />
							<div class="services">
				    			<div class="items">
				     				<ul class="matchedStringUl searchShipmentReturns" style=""></ul>
				   				</div>
							</div>
							<input type="hidden" id="shipmentReturns" value="${searchName}">
       	 	</div>
	       
	        	<c:if test="${sessionScope.role == 'super admin'}">
	        		<div class="col-lg-1" style="padding-left:0px;">
					  <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return newShipmentReturn();" value="<spring:message code="addnew.label" />">
			        </div>
	      		</c:if>
	      <c:if test="${sessionScope.role != 'super admin'}">
       			<c:if test="${flowUnder == 'procurement'}">
        			<c:forEach var="accessControl" items="${sessionScope.procurement}">
                          <c:if test="${accessControl.appDocument == 'ShipmentReturn' && accessControl.write == true}">
							  <div class="col-lg-1" style="padding-left: 0px;">
					 <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return newShipmentReturn();"  value="<spring:message code="addnew.label" />">
					 
					 </div> </c:if>
					</c:forEach>
       			</c:if>
       			<c:if test="${flowUnder == 'warehouse'}">
        			<c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
                          <c:if test="${accessControl.appSubDocument == 'WarehouseShipmentReturn' && accessControl.write == true}">
							<div class="col-lg-1" style="padding-left:0px;">
							 <input type="button"  class="btn bg-olive btn-inline addBtn" onclick="return newShipmentReturn();"  value="<spring:message code="addnew.label" />">
					        </div>
					  </c:if>
					</c:forEach>
       			</c:if>
       		</c:if>
				
       </div>                    	
		<input type="hidden" id="type" name="type" value="${type}">
		<input type="hidden" id="flowUnder" name="flowUnder" value="${flowUnder}">
        <table id="example1" class="table table-bordered table-striped" style="margin-top:0px !important">
                            <thead style="background-color: #3c8dbc; color: #ffffff">
                                <tr>
                                	<th><div style="width:45px;"><spring:message code="sl.no.label" /></div></th>
                                	<th><spring:message code="shipment.return.ref.label" /></th>
                                	<th><spring:message code="return.date.label" /></th>
                                    <th><spring:message code="supplier.name.label" /></th>
                                    <th>No of Items</th>
                                    <th>Cost</th>
                                    <th>Status</th>
                                    <th><spring:message code="EmployeeForm.action" /></th>
                                </tr>
                            </thead>
                            <tbody style="text-align: center;">
                            
                             <c:set var = "noofitems"  value = "0"/>
                             <c:set var = "totalcost"  value = "0"/>
                            	<c:forEach var="shipmentReturn" items="${purchaseStockReturnList}" varStatus="TheCount">
                                <tr>
                                	 <td>${TheCount.count+index-1}</td>
                                	<td>${shipmentReturn.purchaseStockReturnRef}</td>
                                	<td>${shipmentReturn.returnDateStr}</td>
                                    <td>${shipmentReturn.supplierDescription}</td>
                                    <td>${shipmentReturn.noofItems}</td>
                                     <td>${shipmentReturn.cost}</td>
                                      <c:set var = "noofitems"  value = "${noofitems+shipmentReturn.noofItems}"/>
                                       <c:set var = "totalcost"  value = "${totalcost+shipmentReturn.cost}"/>
                                      <td>${shipmentReturn.status}</td>
                                    <td>
                                    	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewShipmentReturnDetails('${shipmentReturn.purchaseStockReturnRef}','view')">View</a>
                                   <c:if test="${sessionScope.role == 'super admin'}">
                                    	&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewShipmentReturnDetails('${shipmentReturn.purchaseStockReturnRef}','edit')">Edit</a>
                                    </c:if>
                                    <c:if test="${sessionScope.role != 'super admin'}">
						       			<c:if test="${flowUnder == 'procurement'}">
						        			<c:forEach var="accessControl" items="${sessionScope.procurement}">
						                          <c:if test="${accessControl.appDocument == 'ShipmentReturn' && accessControl.write == true}">
													&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewShipmentReturnDetails('${shipmentReturn.purchaseStockReturnRef}','edit')">Edit</a>
<%-- 													&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="printShipmentReturnDetails('${shipmentReturn.purchaseStockReturnRef}')">Print</a>
 --%>										
											  </c:if>
											</c:forEach>
						       			</c:if>
						       			<c:if test="${flowUnder == 'warehouse'}">
						        			<c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
						                          <c:if test="${accessControl.appSubDocument == 'WarehouseShipmentReturn' && accessControl.write == true}">
													&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewShipmentReturnDetails('${shipmentReturn.purchaseStockReturnRef}','edit')">Edit</a>
											 		&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="printShipmentReturnDetails('${shipmentReturn.purchaseStockReturnRef}')">Print</a>
											 
											  </c:if>
											</c:forEach>
						       			</c:if>
						       		</c:if>
                                    </td>
    							</tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <br>
                        <br>
                        
                  <div class="col-lg-12" style="padding-right: 0px;">
        	<div class="col-lg-9" style="padding: 0px;">
             </div>
               <div class="col-lg-3" style="padding-right: 0px;" >
               <div class="col-lg-12" style="border-top: 2px solid #ccc;padding-left: 0px;padding-right: 0px;    border-radius: 5px; background: #ccc;">
                 <div class="col-lg-8 col-sm-8" style="text-align: right;font-size: 16px;white-space: nowrap;">Total Items</div>
					<div class="col-lg-4 col-sm-4">: ${noofitems} </div>
					 <div class="col-lg-12" style="border-top: 2px solid #eee;padding-left: 0px;padding-right: 0px;"></div>
					 <div class="col-lg-8 col-sm-8" style="text-align: right;font-size: 16px">Total Cost</div>
					
					<div class="col-lg-4 col-sm-4">:<fmt:formatNumber type = "number" maxFractionDigits = "0" value = "${totalcost}" /> </div>
					 
					</div>
              </div>
            
           
            </div>     
               <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewOutletShipments('${status}','','${totalValue}')">
              	</div>									<!--viewOutletShipments('Ready','pendingOutletShipment','0')  -->
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewOutletShipments('${status}','','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewOutletShipments('${status}','','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewOutletShipments('${status}','','${totalValue}')">
              	</div> 
              	</c:if>
              </div>  
            
               
         </div><!-- /.box-body -->
         
     </div><!-- /.box -->
  <input type="hidden" id="err" value="${err}" />
  <!--added by manasa  -->
   <input type="hidden" id="gridLocation" value="${selectedLocation}" />
</div>
</div>
</section><!-- /.content -->
		<!-- DATA TABES SCRIPT -->
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
         <!-- page script -->
        <script type="text/javascript">
            $(function() {
               // $("#example1").dataTable();
                $('#example1').dataTable({
                	 "bPaginate": false,
                     "bLengthChange": false,
                     "bFilter": false,
                     "bSort": false,
                     "bInfo": false,
                     "bAutoWidth": false
                });
            });
        </script>
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="shipment.label" />"/>
</body>
</html>