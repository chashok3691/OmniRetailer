<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Viswanath
 * file name		        : Inventory Manager/warehouse/shipments/invoices.jsp
 * file type		        : JSP
 * description				: The invoice details is displayed using this jsp
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
         <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script> 
         <script type="text/javascript" src="${pageContext.request.contextPath}/js/invoices/invoices.js"></script>
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

	border-radius: 5px;
	box-shadow:1px 0px 2px #000;
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
$("#outletShipments").val($("#shipment").val());
	$("#outletShipments").focus();
	$('#outletShipments').on('input',function(e){
		if($(this).val().trim()==""){
			/* viewOutletShipments('','','0'); */
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
  <div class="box box-primary" >
                                <div>
                                <h3 class="box-title" style="text-align:center;"><spring:message code="warehouse.invoices.label" /></h3>
                                <%-- <c:if test="${status == ''}"> 
                                    <h3 class="box-title"><spring:message code="allShipments.label" /></h3>
								</c:if> 
                                <c:if test="${status == 'Ready'}"> 
                                    <h3 class="box-title"><spring:message code="pending.shipments.label" /></h3>
								</c:if> 
								<c:if test="${status == 'Shipped'}"> 
                                    <h3 class="box-title"><spring:message code="shipped.shipments.label" /></h3>
								</c:if> 
								<c:if test="${status == 'Delivered'}"> 
                                    <h3 class="box-title"><spring:message code="delivered.shipments.label" /></h3>
								</c:if> --%> 
                                </div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                <div class="row">
	        <div class="col-lg-3">
               <div class="row">
                <%--  <div class="col-lg-4 col-xs-4 col-sm-2 col-md-2" style="text-align:left;top:5px;padding-right: 0px;">
                   <label><spring:message code="location.label"/></label>
                 </div> --%>
                 <div class="col-lg-9 col-xs-8 col-sm-10 col-md-10" >
                 <label><spring:message code="location.label"/></label>
	             <select class="form-control form-group" id="location" >
	             	<!-- <option value="">-- Select --</option> -->
	                <c:forEach var="location" items="${locations}">
						<option value="${location.locationId}:${location.businessActivity}" ${location.locationId == warehouseGatepassobj.locationId ? 'selected' : ''} id="${location.locationId}" >${location.locationId}</option>
					</c:forEach>
	            </select>
	           </div>
	        </div>
	        </div>
	        <div class="col-lg-5"></div>
	        
	        
	        <div class="col-lg-3" style="padding-left: 0px;padding-right:0px">
						                <div class="col-lg-6" style="padding-left: 0px;padding-right:15px">
						                  	 <input type="hidden" id="type" value="${type}">
							                 <input type="hidden" id="sd" value="${startDate}">
						                     <input type="hidden" id="ed" value="${endDate}">
						            <label><spring:message code="offer_start_date.label"/></label>
						                    <input class="form-control  calendar_icon" value="${startDate}" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
						               </div>
						                <div class="col-lg-6" style="padding-left: 0px;padding-right:15px">
						                <label><spring:message code="offer_end_date.label"/></label>
						                    <input class="form-control  calendar_icon" value="${endDate}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
						               </div>
						               </div>
	        
	       <%--  <div class="col-lg-2">
              <div class="row">
                	<!-- <div class="col-lg-4 col-xs-4 col-sm-2 col-md-2" style="text-align:right;top:5px;padding-right: 5px;"> -->
	                	<input type="hidden" id="type" value="${type}">
	                    <input type="hidden" id="sd" value="${startDate}">
                     	<input type="hidden" id="ed" value="${endDate}">
	                    
	                 <!-- </div> -->
	                
                	  <div class="col-lg-12 col-xs-8 col-sm-10 col-md-10" >
                	   <label><spring:message code="offer_start_date.label"/></label>
	                    <input class="form-control calendar_icon form-group" readonly="readonly" value="" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
	                  </div>
              </div>
            </div>
            <div class="col-lg-2">
               <div class="row">
                 <div class="col-lg-4 col-xs-4 col-sm-2 col-md-2" style="text-align:right;top:5px;padding-right: 5px;">
                   <label><spring:message code="offer_end_date.label"/></label>
                 </div>
                 <div class="col-lg-12 col-xs-8 col-sm-10 col-md-10">
                  <label><spring:message code="offer_end_date.label"/></label>
	                    <input class="form-control calendar_icon form-group" readonly="readonly" value="" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
	                </div>
	           </div>
	          </div> --%>
           <div class="col-lg-1" style="margin-top: 18px;padding-left: 0px">
            
                    <input type="hidden" id="type" value="${type}">
                        <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="searchinvoices('','','0');" value="<spring:message code="search" />" />
           </div>
	      </div>
	      <div class="row">
                <div class="col-lg-11"></div>
                <div class="col-lg-1 summaryBtn">
                	<%-- <img class="summaryImg" src="${pageContext.request.contextPath}/images/summary.png" style="cursor: pointer;" onclick="getOrderSummary();" > --%>
                </div>
          </div>
          <div class="row">
	      <div class="col-lg-1 col-xs-2" style="margin-top: 10px;">
                <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="searchinvoices('','','0');">
               		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
               		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
               		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
              		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
               	</select>
           </div>
	        <div class="col-lg-10 col-xs-10">
       	 		 <input type="text"  class="form-control searchItems"  value="" id="searchItems" placeholder="<spring:message code="search.items.here.label" />"style="margin-top: 10px;" />
					<div class="services">
		    			<div class="items">
		     				<ul class="matchedStringUl invoicesearch" style=""></ul>
		   				</div>
					</div>
					<input type="hidden" id="ordersSearch" value="${searchName}">
       	 	</div>
	        
				
	        	<c:if test="${sessionScope.role == 'super admin'}">
	        	<div class="col-lg-1" style="margin-top: 10px;padding-left: 0px;">
	        <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return viewInvoiceDetails();" value="<spring:message code="addnew.label" />" />
	         </div>
	         <%-- <div class="col-lg-1" style="margin-top: 10px;padding-left: 0px;">
	        <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return viewOrders('Draft','','0','');" value="<spring:message code="drafts.label" />" />
	        </div> --%>
	        	<%-- 	<a onclick="return viewNewOrder('','${status}');" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp;
					<a onclick="return viewOrders('Draft','','0','');" class="button"><font size="2px"><spring:message code="drafts.label" /></font></a> --%>
	      		</c:if>
				<c:if test="${sessionScope.role != 'super admin'}">
					 <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
								    <c:if test="${accessControl.appDocument == 'LocationMaster' && accessControl.write == true}">  
			                	<div class="col-lg-1" style="margin-top: 10px;padding-left: 0px;">
	        <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return viewInvoiceDetails();" value="<spring:message code="addnew.label" />" />
	         </div>
	        <%--  <div class="col-lg-1" style="margin-top: 10px;padding-left: 0px;">
	        <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return viewOrders('Draft','','0','');" value="<spring:message code="drafts.label" />" />
	        </div> --%>
			                	<%-- <a onclick="return viewNewOrder('','${status}');" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp;
								<a onclick="return viewOrders('Draft','','0','');" class="button"><font size="2px"><spring:message code="drafts.label" /></font></a> --%>
							</c:if>
						</c:forEach>
					
					<%-- <div class="col-lg-1" style="margin-top: 10px;padding-left: 0px;">
	        <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return viewNewShipmentGatePass('','${status}');" value="<spring:message code="addnew.label" />" />
	         </div> --%>
					
					
			</c:if>
		</div>
		                  	<%-- <div class="row">
								          <div class="col-lg-11">
								  	 		 <input type="text"  class="form-control searchItems" style="margin-top: 5px;text-align: center;height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" value="" id="outletShipments" placeholder="<spring:message code="search.invoices.label" />" />
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl " style=""></ul>
								   				</div>
											</div>
											<input type="hidden" id="shipment" value="${searchName}">
								     	 </div>
								  <c:if test="${sessionScope.role == 'super admin'}"> 
								  	 <div class="col-lg-1">
										<div class="buttons" style="margin-top: 3px;padding-left: 0px;">
											<a onclick="return viewInvoiceDetails();" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>
										</div>
									</div>
								  </c:if>
								 <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
								    <c:if test="${accessControl.appDocument == 'LocationMaster' && accessControl.write == true}"> 
									   <div class="col-lg-1">
											<div class="buttons" style="margin-top: 3px;padding-left: 0px;margin-left: -15%;">
											     <a onclick="return viewInvoiceDetails();" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>
											         <a onclick="return validate();" class="button"><font size="2px"><spring:message code="delete.label" /></font></a>
											</div>
										</div>
									</c:if>
								 </c:forEach>
								 </div>  --%>  
                                	   
                                <%-- <div class="row">
				                    <div class="col-lg-3"></div>
				                    <div class="col-lg-6">
				                      <div class="row">
				                         <div class="col-lg-5" style="text-align:center;top: 5px;">
				                           <label><spring:message code="warehouselocation.label"/></label>
				                         </div>
				                         <div class="col-lg-6">
				                           <select class="form-control" id="warehouse_location" onchange="viewShipmentsByLocation();">
 				                             <c:forEach var="location" items="${locationsList}">
												<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option>
											 </c:forEach>
                                         </select>
				                         </div>
				                      </div>
				                      </div>
				                      <div class="col-lg-3" style="text-align: left;">
				                        
				                      </div>
				                    </div> --%>
				                    <%-- <c:if test="${sessionScope.role == 'super admin'}">
				                    	<div class="row">
											 <div class="buttons" style="margin-bottom: 7px;">
				  				               <a onclick="return viewNewShipment();" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>
				   			                   <a onclick="return validate('supplier');" class="button"><font size="2px"><spring:message code="delete.label" /></font></a>
											 </div>
											</div>
				                    </c:if>
				                    <c:forEach var="accessControl" items="${sessionScope.warehouseSales}">
	                            		<c:if test="${accessControl.appDocument == 'WarehouseShipments' && accessControl.write == true}"> 
		                                    <div class="row">
											 <div class="buttons" style="margin-bottom: 7px;">
				  				               <a onclick="return viewNewShipment();" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>
				   			                   <a onclick="return validate('supplier');" class="button"><font size="2px"><spring:message code="delete.label" /></font></a>
											 </div>
											</div>
										</c:if>
								  </c:forEach> --%>
								  <input type="hidden" id="type" name="type" value="${type}">
								   <input type="hidden" id="flowUnder" name="flowUnder" value="${flowUnder}">
				                <table id="productstocks" class="table table-bordered table-striped" style="margin-top:0.2%;">
                                        <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><div style=""><spring:message code="sl.no.label" /></div></th>
                                            	<th><spring:message code="order.ref.label" /></th>
                                            	<th><spring:message code="invoice.date.label" /></th>
                                                <th><spring:message code="from.label" /></th>
                                                <th><spring:message code="bill.to.label" /></th>
                                                <th><spring:message code="total.invoice.label" /></th>
                                                <th><spring:message code="EmployeeForm.action" /></th>
                                            </tr>
                                        </thead>
                                        
                                        <tbody style="text-align: center;">
                                        	<c:forEach var="shipper" items="${shipmentBeanList}" varStatus="loop">
                                            <tr>
                                            	<td>${loop.count+index-1}</td>
                                            	<td>${shipper.orderId}</td>
                                            	<td>${shipper.invoice_Date}</td>
                                                <td>${shipper.warehouseLocation}</td>
                                                <td>${shipper.city}</td>
                                                <td>${shipper.totalItemCost}</td>
                                                <td>
                                                <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
	                            					<c:if test="${accessControl.appDocument == 'LocationMaster' && accessControl.read == true}"> 
                                                		<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return invoicedetailsviewedit('${shipper.invoiceId}','view');"><spring:message code="view.label"/></a>
                                                		<%-- &nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditShipmentDetails('${shipper.shipmentId}')">Edit</a> --%>
                                                	</c:if>																	<!-- viewShipmentDetails('${shipper.shipmentId}') -->
                                                </c:forEach>
                                                <c:if test="${sessionScope.role == 'super admin'}">
                   		                     &nbsp;&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return invoicedetailsviewedit('${shipper.invoiceId}','edit');"><spring:message code="edit.label"/></a>
                                             </c:if>
                                             <c:if test="${sessionScope.role != 'super admin'}">
                                                <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
	                            					<c:if test="${accessControl.appDocument == 'LocationMaster' && accessControl.write == true}"> 
                                                		&nbsp;&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return invoicedetailsviewedit('${shipper.invoiceId}','edit');"><spring:message code="edit.label"/></a>
                                                		<%-- &nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditShipmentDetails('${shipper.shipmentId}')">Edit</a> --%>
                                                	</c:if>																	<!-- viewShipmentDetails('${shipper.shipmentId}') -->
                                                </c:forEach>
                                                </c:if>
                                                </td>
                							</tr>
                                            </c:forEach>
                                            
                                        </tbody>
                                       
                                    </table>
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