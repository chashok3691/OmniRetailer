<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah Y
 * file name		        : inventorymanager/warehouse/warehousedetails
 * file type		        : JSP
 * description				: New warehouse details
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
        <link href="${pageContext.request.contextPath}/css/warehouse_configuration.css" rel="stylesheet" type="text/css" />
          <script src="${pageContext.request.contextPath}/js/controller.js"></script>
          	<script type="text/javascript" src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
            <script src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
			<script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
			<script src="${pageContext.request.contextPath}/js/countries.js"></script>

<script>
$(document).ready(function(){
	print_country("country");
	$("#country").val("India");
	print_state('state',104);
	
	//$("#country").val($("#whcountry").val());
//	print_state('state',104);
	
	//$("#state").val($("#whstate").val());
});
$("#mobileNumber").keyup(function(){
	   $("#mobileNumErr").html("");
	   $("#Error").html("");
	   var $th = $(this);
     $th.val( $th.val().replace(/[^0-9]/g, function(str) 
     {  
         return ''; 
      } 
     ));
});
$("#fax").keyup(function(){
	   $("#faxErr").html("");
	   $("#Error").html("");
	   var $th = $(this);
  $th.val( $th.val().replace(/[^0-9]/g, function(str) 
  {  
      return ''; 
   } 
  ));
  /* if($("#fax").val().lenght>10){
	  $("#faxErr").html("");
  } */
});

$("#workLocation").val($("#whlocation").val());   // set warehouse location
//$("#country").val($("#whcountry").val());   // set warehouse location
//$("#state").val($("#whstate").val());   // set warehouse location
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
<style>
label {
 font-weight: normal; }
</style>    
</head>
<body>
 <!-- Content Header (Page header) -->
<!-- Main content -->

				<section class="content-header">
                    <h1>
                        <spring:message code="warehouse_configuration.label"/>
                    </h1>
                    <ol class="breadcrumb">
                    <li><a href="#" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
                       <li><a href="#" onclick="showWarehouseFlows('warehouse-details')"><spring:message code="warehouse.management.label"/></a></li>
                       <li><a href="#" onclick="getWareHouses('WarehouseConfigurations')"><spring:message code="warehouses.label"/></a></li>
                       <li> ${warehouse.warehouseId} - <spring:message code="warehouse_details.label"/></li>
                    </ol>
                </section>
                
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
                                <div class="box-header" >
                                    <h3 class="box-title">${warehouse.warehouseId} - <spring:message code="warehouse_details.label"/></h3>
                                </div><!-- /.box-header -->
                                 <form method="POST">
                                <div class="box-body">
                                	
				                     <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                      
									<div class="row">
									  <div class="form-group col-lg-4">
									     <input type="hidden" name="storeCode" value=""/>
									  </div>
									  <div class="form-group col-lg-4">
									     <label><spring:message code="location.label" /></label>
                                           <select class="form-control" name="location" id="workLocation" onchange="changeLocation()" disabled="disabled"> 
                                             <c:forEach var="location" items="${locationsList}"> 
												 <option value="${location}">${location}</option>
											 </c:forEach>
										 </select>
									  </div>
									   <div class="form-group col-lg-4">
                                          
                                        </div>
									</div>
									
									   <div class="row" style="">
									   <div class="form-group col-lg-4" style="margin-top:8px;">
<%-- 									  	<spring:message code="draw_warehouse_configuration.label" />
 --%>									  </div>
									   <div class="form-group col-lg-4"></div>
									    <div class="form-group col-lg-4" style="text-align: right;">
                                  	<input type="button" id="edit" style="position: relative;" class="btn bg-olive btn-inline" onclick="editWarehouse('details');" value="&nbsp;&nbsp;&nbsp;<spring:message code="save.label" />&nbsp;&nbsp;&nbsp;" />
<%-- 								  	<input type="button" id="edit"  class="btn bg-olive btn-inline" title="Cleare all storage systems" style="margin-left:1%;width: 68px;position: relative;" onclick="cleareStorageSystems('clear');" value="<spring:message code="storage_systems_clear.label" />" />
 --%>								  	<input type="button" class="btn bg-olive btn-inline" style="margin-left:1%; margin-right: 1%;width: 68px;position: relative;" onclick="getWareHouses('WarehouseConfigurations')" value="<spring:message code="cancel.label" />" />
									</div> 
								</div>
									
								<div class="row">
									    <div class="form-group col-lg-3">
                                            <label><spring:message code="new_warehouse_name.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" class="form-control" name="warehouseName" id="warehouseName" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_name.label" />" value="${warehouse.warehouse_name}"/>
                                            <span id="warehouseNameErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="new_warehouse_type.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" class="form-control" name="warehouseType" id="warehouseType" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_type.label" />" value="${warehouse.warehouse_type}"/>
                                            <span id="warehouseTypeErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="new_warehouse_phonenumber.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" class="form-control" name="mobileNumber" id="mobileNumber" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_phonenumber.label" />" value="${warehouse.phone_number}"/>
                                            <span id="mobileNumErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="new_warehouse_fax.label" /></label>
                                            <input type="text" class="form-control" name="fax" id="fax" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_fax.label" />" value="${warehouse.fax}"/>
                                            <span id="faxErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>                                        
                                    </div>
                                    
                                    <div class="row">
									    <div class="form-group col-lg-3">
                                            <label><spring:message code="new_warehouse_status.label" /> <span class="requiredField">*</span></label>
<%--                                             <input type="text" class="form-control" name="warehouseStatus" id="warehouseStatus" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_status.label" />" />
 --%>                                            <select class="form-control" name="warehouseStatus" id="warehouseStatus">
                                             <option value="Enable" ${warehouse.warehouse_status == "true" ? 'selected' : ''}>Enable</option>
                                            <option value="Disable" ${warehouse.warehouse_status  == "false" ? 'selected' : ''}>Disable</option>
                                            </select>
                                            <span id="statusErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="new_warehouse_no.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" class="form-control" name="houseNo" id="houseNo" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_no.label" />" value="${warehouse.address_1}"/>
                                            <span id="houseNoErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="new_warehouse_street.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" class="form-control" name="street" id="street" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_street.label" />" value="${warehouse.address_2}"/>
                                            <span id="streetErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="new_warehouse_city.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" class="form-control" name="city" id="city" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_city.label" />" value="${warehouse.city}"/>
                                            <span id="cityErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>                                        
                                    </div>
                                    
                                    <div class="row">
                                     <div class="form-group col-lg-4">
                                            <label><spring:message code="new_warehouse_country.label" /> <span class="requiredField">*</span></label>
                                            <%-- <input type="text" class="form-control" name="country" id="country" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_country.label" />" />
                                            --%> 
                                             <select onchange="print_state('state',this.selectedIndex);" id="country" name ="country" class="form-control" >
											</select>
											<span id="countryErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
									    <div class="form-group col-lg-4">
                                            <label><spring:message code="new_warehouse_state.label" /> <span class="requiredField">*</span></label>
                                            <%-- <input type="text" class="form-control" name="state" id="state" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_state.label" />" />
                                            --%>
                                            <select id ="state" class="form-control" name="state">
    										</select>
    										 <span id="stateErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="new_warehouse_zip.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" class="form-control" name="zip" id="zip" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_zip.label" />" value="${warehouse.zip}"/>
                                            <span id="zipErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                       
                                                                          
                                    </div>
                         			 <div class="row" style="margin-top:12px;">
									   <div class="form-group col-lg-4" style="margin-top:8px;">
									  </div>
									   <div class="form-group col-lg-4"></div>
									    <div class="form-group col-lg-4" style="text-align: right;">
                                  	<input type="button" id="edit" style="position: relative;" class="btn bg-olive btn-inline" onclick="editWarehouse('details');" value="&nbsp;&nbsp;&nbsp;<spring:message code="save.label" />&nbsp;&nbsp;&nbsp;" />
<%-- 								  	<input type="button" id="edit"  class="btn bg-olive btn-inline" style="margin-left:1%;width: 68px;position: relative;" onclick="cleareStorageSystems('clear');" value="<spring:message code="storage_systems_clear.label" />" />
 --%>								  	<input type="button" class="btn bg-olive btn-inline" style="margin-left:1%; margin-right: 1%;width: 68px;position: relative;" onclick="getWareHouses('WarehouseConfigurations')" value="<spring:message code="cancel.label" />" />
									</div> 
									</div>     
                                </div><!-- /.box-body -->
                                </form>
                            </div><!-- /.box -->
  
</div>
</div>
</section><!-- /.content -->
		<!-- DATA TABES SCRIPT -->
      <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script> 
        <script src="${pageContext.request.contextPath}/js/warehouse_configuration.js" type="text/javascript"></script>
         <!-- page script -->
        <script type="text/javascript">
           /*  $(function() {
                $("#example1").dataTable();
                $('#example2').dataTable({
                    "bPaginate": true,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": true,
                    "bInfo": true,
                    "bAutoWidth": false
                });
            }); */
            $('#resizable')
            .draggable()
            .resizable();
        </script> 
      
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="store.label" />"/>
         <input type="hidden" id="whlocation" value="${warehouse.warehouseLocation}" />
          <input type="hidden" id="whid" value="${warehouse.warehouseId}" />
           <input type="hidden" id="whcountry" value="${warehouse.country}" />
            <input type="hidden" id="whstate" value="${warehouse.state}" />
       
</body>
</html>