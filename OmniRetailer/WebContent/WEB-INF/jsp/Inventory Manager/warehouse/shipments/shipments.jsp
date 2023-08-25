<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/shipments/shipments.jsp
 * file type		        : JSP
 * description				: The shipment details is displayed using this jsp
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
         <script type="text/javascript" src="${pageContext.request.contextPath}/js/shipment.js"></script> 
<style type="text/css">

.buttons {
	float: right;
	padding-top: 0px;
	margin-right: 2%;
	margin-top:1%;
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

</style>       
<script type="text/javascript">
$(document).ready(function(){
/* window.onload = function(){ document.getElementById("loading").style.display = "none" } */ 
var err = $("#err").val();
if(err != "")
  alert(err);
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
                                <div class="box-header">
                                    <h3 class="box-title"><spring:message code="allShipments.label" /></h3>
                                </div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                	   
                                	   
                                	    <div class="row">
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
				                    </div>
				                    <c:if test="${sessionScope.role == 'super admin'}">
				                    	<div class="row">
											 <div class="buttons" style="margin-bottom: 7px;">
				  				               <a onclick="return viewNewShipment();" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>
				   			                   <%-- <a onclick="return validate('supplier');" class="button"><font size="2px"><spring:message code="delete.label" /></font></a> --%>
											 </div>
											</div>
				                    </c:if>
				                    <c:forEach var="accessControl" items="${sessionScope.warehouseSales}">
	                            		<c:if test="${accessControl.appDocument == 'WarehouseShipments' && accessControl.write == true}"> 
		                                    <div class="row">
											 <div class="buttons" style="margin-bottom: 7px;">
				  				               <a onclick="return viewNewShipment();" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>
				   			                   <%-- <a onclick="return validate('supplier');" class="button"><font size="2px"><spring:message code="delete.label" /></font></a> --%>
											 </div>
											</div>
										</c:if>
								  </c:forEach>
				                <table id="example1" class="table table-bordered table-striped">
                                        <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><spring:message code="shipmentId.label" /></th>
                                                <th><spring:message code="shipmentAgency.label" /></th>
                                                <th><spring:message code="shipmentAgencyContact.label" /></th>
                                                <th><spring:message code="shipmentMode.label" /></th>
                                                <th><spring:message code="EmployeeForm.action" /></th>
                                            </tr>
                                        </thead>
                                        
                                        <tbody style="text-align: center;">
                                        	<c:forEach var="shipper" items="${shipmentBeanList}">
                                            <tr>
                                            	<td>${shipper.shipmentId}</td>
                                                <td>${shipper.shipmentAgency}</td>
                                                <td>${shipper.shipmentAgencyContact}</td>
                                                <td>${shipper.shipmentMode}</td>
                                                <td>
                                                <c:if test="${sessionScope.role == 'super admin'}">
                                                	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewShipmentDetails('${shipper.shipmentId}')">View</a>&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditShipmentDetails('${shipper.shipmentId}')">Edit</a>
                                                </c:if>
                                                <c:forEach var="accessControl" items="${sessionScope.warehouseSales}">
	                            					<c:if test="${accessControl.appDocument == 'WarehouseShipments' && accessControl.write == true}"> 
                                                		<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewShipmentDetails('${shipper.shipmentId}')">View</a>&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditShipmentDetails('${shipper.shipmentId}')">Edit</a>
                                                	</c:if>
                                                </c:forEach>
                                                </td>
                							</tr>
                                            </c:forEach>
                                            
                                        </tbody>
                                       
                                    </table>
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
                $("#example1").dataTable();
                $('#example2').dataTable({
                    "bPaginate": true,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": true,
                    "bInfo": true,
                    "bAutoWidth": false
                });
            });
        </script>
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="shipment.label" />"/>
</body>
</html>