<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/retailoutlet/storedetails.jsp
 * file type		        : JSP
 * description				: The store details table is displayed using this jsp
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
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
          <script src="${pageContext.request.contextPath}/js/controller.js"></script>
                    <script src="${pageContext.request.contextPath}/js/validation.js"></script>
          
          <script src="${pageContext.request.contextPath}/js/warehouse_configuration.js" type="text/javascript"></script>
          <script type="text/javascript">
          $(document).ready(function(){
        	  
        	 $("#workLocation").val($("#locationHidden").val()); 
          });
          </script>
<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
	margin-right: 4%;
	margin-top:1%;
}
a.button, .list a.button {
position:relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 5px 15px 5px 15px;
	background: #3c8dbc;

	border-radius: 5px;
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}
</style>       
</head>
<body>
 <!-- Content Header (Page header) -->
<!-- Main content -->

				<section class="content-header">
                    <h1>
                        <spring:message code="warehouses.label"/>
                    </h1>
                    <ol class="breadcrumb">
                    <li><a href="#" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
                       <li><a href="#" onclick="showWarehouseFlows('WarehouseConfigurations')"><spring:message code="warehouse.management.label"/></a></li>
                       <li><a href="#" onclick="getWareHouses('WarehouseConfigurations')"><spring:message code="warehouses.label"/></a></li>
                    </ol>
                </section>
                
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
                                <div class="box-header" >
                                    <h3 class="box-title"><spring:message code="warehouses.label" /></h3>
                                </div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                	 <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                	<div class="row">
									  <div class="form-group col-lg-4">
									     <input type="hidden" name="storeCode" value=""/>
									  </div>
									  <div class="form-group col-lg-4">
									     <label><spring:message code="location.label" /></label>
                                           <select class="form-control" name="location" id="workLocation" onchange="gerWarehousesByLocation()">
                                             <c:forEach var="location" items="${locationsList}"> 
												 <option value="${location}">${location}</option>
											 </c:forEach>
										 </select>
									  </div>
									   <div class="form-group col-lg-4">
                                          
                                        </div>
									</div>
									
				                   <div class="row">
									  <div class="buttons" style="margin-bottom: 7px;">
		  				                <a onclick="return newWarehouse();" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp;
		   			                <a onclick="return validate('warehouse');" class="button"><font size="2px"><spring:message code="delete.label" /></font></a>&nbsp;&nbsp;&nbsp;
		   			                
		   			                  </div>
									</div>
                                    <table id="example1" class="table table-bordered table-striped">
                                   
                                        <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                                                <th><spring:message code="warehouse_code.label" /></th>
                                                <th><spring:message code="warehouse_name.label" /></th>
                                                <th><spring:message code="warehouse_location.label" /></th>
                                                <th><spring:message code="new_warehouse_type.label" /></th>
                                               <th><spring:message code="new_warehouse_city.label" /></th>
                                                <th><span style="margin-left:55px;"><spring:message code="action.label" /></span></th>
                                            </tr>
                                        </thead>
                               
                                        
                                          
                                        <tbody>
                                        	<c:forEach var="warehouse" items="${warehouses}">
                                        	
                                        	
                                            <tr>
                                            	<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value="${warehouse.warehouseId}"/></td>
                                                <td>${warehouse.warehouseId}</td>
                                                <td>${warehouse.warehouse_name}</td>
                                                <td>${warehouse.warehouseLocation}</td>
                                                 <td>${warehouse.warehouse_type}</td>
                                                <td>${warehouse.city}</td>
                                                <td><a style="color:#2e7ea7 !important;" href="#" onclick="return viewWarehouseData('${warehouse.warehouseId}','view')" title="View Warehouse Details"><spring:message code="warehouse_view_data.label"/> </a> &nbsp;&nbsp;&nbsp;<a style="color:#2e7ea7 !important;" href="#" onclick="return viewWarehouseStorageSystems('${warehouse.warehouseId}','view')" title="View Warehouse Storage Systems"><spring:message code="warehouse_view_layout.label"/></a></td>
                                                
                							</tr>
                                            </c:forEach> 




                                            
                                        </tbody>
                                        
                                        
                                    </table>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
  
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
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="store.label" />"/>
         <input type="hidden" id="locationHidden" value="${location }"/>
</body>
</html>