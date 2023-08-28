<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah Y
 * file name		        : inventorymanager/warehouse/viewstoragesystems
 * file type		        : JSP
 * description				: view selected storage systems
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
          
            <%-- <script src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script> --%>
<script type="text/javascript">
$(document).ready(function(){
	 $("#workLocation").val($("#hideLocation").val());
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
	padding: 5px 10px 5px 10px;
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

				<%-- <section class="content-header">
                    <h1>
                        <spring:message code="warehouse_configuration.label"/>
                    </h1>
                    <ol class="breadcrumb">
                    <li><a href="#" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
                       <li><a href="#" onclick="showWarehouseFlows('warehouse-details')"><spring:message code="warehouse.management.label"/></a></li>
                        <li><a href="#" onclick="getWareHouses('WarehouseConfigurations')"><spring:message code="warehouses.label"/></a></li>
                      <li> ${warehouse.warehouseId} - <spring:message code="warehouse_storage_systems.label"/></li>
                    </ol>
                </section> --%>
                
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
                                <div class="box-header" >
                                    <h3 class="box-title">${warehouse.warehouseId} - <spring:message code="warehouse_storage_systems.label"/></h3>
                                </div><!-- /.box-header -->
                                <div class="box-body">
                                	
				                     <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                      
									<div class="row">
									  <div class="form-group col-lg-4">
									     <input type="hidden" name="storeCode" value=""/>
									  </div>
									  <div class="form-group col-lg-4">
									     <label><spring:message code="location.label" /></label>
									     <input type="text" class="form-control" name="location" id="workLocation" readonly="readonly">
                                           <%-- <select class="form-control" name="location" id="workLocation" disabled="disabled">
                                             <c:forEach var="location" items="${locationsList}"> 
												 <option value="${location}">${location}</option>
											 </c:forEach>
										 </select> --%>
									  </div>
									   <div class="form-group col-lg-4">
                                          
                                        </div>
									</div>
									
									   <div class="row" style="">
									   <div class="form-group col-lg-4" style="margin-top:8px;">
									  	<spring:message code="draw_warehouse_configuration.label" />
									  </div>
									   <div class="form-group col-lg-4"></div>
									    <div class="form-group col-lg-4" style="text-align: right;">
									    
								 <c:if test="${sessionScope.role == 'super admin'}">
								 	<input type="button" id="edit" style="position: relative;" class="btn bg-olive btn-inline" onclick="return viewWarehouseStorageSystems('${warehouse.warehouseId}','edit')" value="&nbsp;&nbsp;&nbsp;<spring:message code="edit.label" />&nbsp;&nbsp;&nbsp;" />
								 </c:if>	    
								<c:forEach var="accessControl" items="${sessionScope.warehouseManagement}">
	                            	<c:if test="${accessControl.appDocument == 'WarehouseConfigurations' && accessControl.write == true}">
                                  		<input type="button" id="edit" style="position: relative;" class="btn bg-olive btn-inline" onclick="return viewWarehouseStorageSystems('${warehouse.warehouseId}','edit')" value="&nbsp;&nbsp;&nbsp;<spring:message code="edit.label" />&nbsp;&nbsp;&nbsp;" />
                                  	</c:if>
                                </c:forEach>
								  <%-- 	<input type="button" id="edit"  class="btn bg-olive btn-inline" title="Cleare all storage systems" style="margin-left:1%;width: 68px;position: relative;" onclick="cleareStorageSystems('clear');" value="<spring:message code="storage_systems_clear.label" />" />
								  --%> 	<input type="button" class="btn bg-olive btn-inline" style="margin-left:1%; margin-right: 1%;width: 68px;position: relative;" onclick="getWareHouses('WarehouseConfigurations','0')" value="<spring:message code="cancel.label" />" />
									</div> 
									
									</div>
                                       <div id="sketch" style="height: 500px;border: 1px solid #cccccc;">
                                      <%-- <canvas id="paint"></canvas> --%>
											<div id="warehouse_innerview" style="margin-top:-10px;">
												<%--  <img src="${pageContext.request.contextPath}/images/directions.gif" style="height: 108px;float: right;"> --%>
												 <div id="droppable" style="height: 500px;">
												 	<!-- adding the storage systems  -->
												 	 <c:forEach var="storageSystems" items="${storages.storageSystems}">
												 	 <c:if test="${storageSystems.storageSystemType=='Palette'}">
             		   											<c:set var="msg" value="${storageSystems.storageLocation}"/>
             		   											<c:set var="heightwidth" value="${fn:split(msg,'#')}" />
             		   												<div style="left:${heightwidth[1]}px;top:${heightwidth[0]}px;width:64px;position: relative;visibility:${heightwidth[2]}" id="currentSelection" class="currentSelectionclass" title="Storage System Id :  ${storageSystems.storageSystemId } &#013; Storage System Name : ${storageSystems.storageSystemName } &#013; Storage System Notation : ${storageSystems.storageSystemNotation } &#013; Product : ${storageSystems.productId} &#013; No Of Rows : ${storageSystems.rows} &#013; No Of Columns : ${storageSystems.columns} ">
																		<img src="${pageContext.request.contextPath}/images/warehouse-shelves.png"  style="cursor:pointer;" id="currentSelectionimageid" class="currentSelectionimageclass">
																	</div>
             		   										</c:if>
             		   										<c:if test="${storageSystems.storageSystemType=='Racks'}">
             		   											<c:set var="msg" value="${storageSystems.storageLocation}"/>
             		   											<c:set var="heightwidth" value="${fn:split(msg,'#')}" />
             		   												<div style="left:${heightwidth[1]}px;top:${heightwidth[0]}px;width:64px;position: relative;visibility:${heightwidth[2]}" id="currentSelection" class="currentSelectionclass" title="Storage System Id :  ${storageSystems.storageSystemId } &#013; Storage System Name : ${storageSystems.storageSystemName } &#013; Storage System Notation : ${storageSystems.storageSystemNotation } &#013; Product : ${storageSystems.productId} &#013; No Of Rows : ${storageSystems.rows} &#013; No Of Columns : ${storageSystems.columns} ">
																		<img src="${pageContext.request.contextPath}/images/warehouse-racks.png"  style="cursor:pointer;" id="currentSelectionimageid" class="currentSelectionimageclass">
																	</div>
             		   										</c:if>
             		   										<c:if test="${storageSystems.storageSystemType=='Bin' || storageSystems.storageSystemType=='Bins'}">
             		   											<c:set var="msg" value="${storageSystems.storageLocation}"/>
             		   											<c:set var="heightwidth" value="${fn:split(msg,'#')}" />
             		   												<div style="left:${heightwidth[1]}px;top:${heightwidth[0]}px;width:64px;position: relative;visibility:${heightwidth[2]}" id="currentSelection" class="currentSelectionclass" title="Storage System Id :  ${storageSystems.storageSystemId } &#013; Storage System Name : ${storageSystems.storageSystemName } &#013; Storage System Notation : ${storageSystems.storageSystemNotation } &#013; Product : ${storageSystems.productId} &#013; No Of Rows : ${storageSystems.rows} &#013; No Of Columns : ${storageSystems.columns} ">
																		<img src="${pageContext.request.contextPath}/images/warehouse-bin.png"  style="cursor:pointer;" id="currentSelectionimageid" class="currentSelectionimageclass">
																	</div>
             		   										</c:if>
             		   										<c:if test="${storageSystems.storageSystemType=='Fridge'}">
             		   											<c:set var="msg" value="${storageSystems.storageLocation}"/>
             		   											<c:set var="heightwidth" value="${fn:split(msg,'#')}" />
             		   												<div style="left:${heightwidth[1]}px;top:${heightwidth[0]}px;width:64px;position: relative;visibility:${heightwidth[2]}" id="currentSelection" class="currentSelectionclass" title="Storage System Id :  ${storageSystems.storageSystemId } &#013; Storage System Name : ${storageSystems.storageSystemName } &#013; Storage System Notation : ${storageSystems.storageSystemNotation } &#013; Product : ${storageSystems.productId} &#013; No Of Rows : ${storageSystems.rows} &#013; No Of Columns : ${storageSystems.columns} ">
																		<img src="${pageContext.request.contextPath}/images/grocery_toolbar_fridge.png"  style="cursor:pointer;" id="currentSelectionimageid" class="currentSelectionimageclass">
																	</div>
             		   										</c:if>
             		   										
             		   										<c:if test="${storageSystems.storageSystemType=='Empty Area'}">
             		   											<c:set var="msg" value="${storageSystems.storageLocation}"/>
             		   											<c:set var="heightwidth" value="${fn:split(msg,'#')}" />
             		   												<div style="left:${heightwidth[1]}px;top:${heightwidth[0]}px;width:64px;position: relative;visibility:${heightwidth[2]}" id="currentSelection" class="currentSelectionclass" title="Storage System Id :  ${storageSystems.storageSystemId } &#013; Storage System Name : ${storageSystems.storageSystemName } &#013; Storage System Notation : ${storageSystems.storageSystemNotation } &#013; Product : ${storageSystems.productId} &#013; No Of Rows : ${storageSystems.rows} &#013; No Of Columns : ${storageSystems.columns} ">
																		<img src="${pageContext.request.contextPath}/images/warehouse-bayarea.png"  style="cursor:pointer;" id="currentSelectionimageid" class="currentSelectionimageclass">
																	</div>
             		   										</c:if>
              										</c:forEach> 
												 		<ul></ul>
												 </div>
												 
											</div>
										<%-- <div id="warehouse_toolbar">
											<label style="margin-left: 17%;margin-top:7px;color:#777;"><spring:message code="warehouse_toolbar.label" /></label>
											<hr style="margin-top:-1px;">
											<div style="margin-left: 24px;cursor: pointer;" title="<spring:message code="warehouse_racks_title.label" />">
											 <img src="${pageContext.request.contextPath}/images/warehouse-toolbar-racks.png" style="margin-top: -7px;" id="warehouse_racks">
											 <span style="margin-left: 7px;color: #666666;">	<spring:message code="warehouse_racks.label" /></span>
											</div>
											<div style="margin-left: 24px;margin-top:10px;cursor: pointer;" title="<spring:message code="warehouse_palette_title.label" />">
											 <img src="${pageContext.request.contextPath}/images/warehouse-toolbar-shelves.png" style="margin-top: -7px;"  id="warehouse_palettes" >
											 <span style="margin-left: 2px;color: #666666;"> <spring:message code="warehouse_shelves.label" /></span>
											</div>
											<div style="margin-left: 24px;margin-top:10px;cursor: pointer;" title="<spring:message code="warehouse_bay_area_title.label" />">
											 <img src="${pageContext.request.contextPath}/images/warehouse-toolbar-bayarea.png" style="margin-top: -7px;"  id="warehouse_bayarea" >
											 <span style="margin-left: -3px;color: #666666;">	<spring:message code="warehouse_bay_area.label" /></span>
											</div>
											<div style="margin-left: 24px;margin-top:10px;cursor: pointer;" title="<spring:message code="warehouse_bins_title.label" />">
											 <img src="${pageContext.request.contextPath}/images/warehouse-toolbar-bin.png" style="margin-top: -7px;"  id="warehouse_bins" >
											 <span style="margin-left: 13px;color: #666666;">	<spring:message code="warehouse_bins.label" /></span>
											</div>
												<!--  <div style="margin-left: 23%;margin-top: -7px;" id="warehouse_racks">Hi</div> -->
											</div>  --%>
										</div>
										<div class="row" style="margin-top:12px;">
									   <div class="form-group col-lg-4" style="margin-top:8px;">
									  </div>
									   <div class="form-group col-lg-4"></div>
									    <div class="form-group col-lg-4" style="text-align: right;">
								 <c:if test="${sessionScope.role == 'super admin'}">
								 	<input type="button" id="edit" style="position: relative;" class="btn bg-olive btn-inline" onclick="return viewWarehouseStorageSystems('${warehouse.warehouseId}','edit')" value="&nbsp;&nbsp;&nbsp;<spring:message code="edit.label" />&nbsp;&nbsp;&nbsp;" />
								 </c:if>
								<c:forEach var="accessControl" items="${sessionScope.warehouseManagement}">
	                            	<c:if test="${accessControl.appDocument == 'WarehouseConfigurations' && accessControl.write == true}">
                                    	<input type="button" id="edit" style="position: relative;" class="btn bg-olive btn-inline" onclick="return viewWarehouseStorageSystems('${warehouse.warehouseId}','edit')" value="&nbsp;&nbsp;&nbsp;<spring:message code="edit.label" />&nbsp;&nbsp;&nbsp;" />
                                    </c:if>
                                </c:forEach>
								  <%-- 	<input type="button" id="edit"  class="btn bg-olive btn-inline" style="margin-left:1%;width: 68px;position: relative;" onclick="cleareStorageSystems('clear');" value="<spring:message code="storage_systems_clear.label" />" />
								   --%>	<input type="button" class="btn bg-olive btn-inline" style="margin-left:1%; margin-right: 1%;width: 68px;position: relative;" onclick="getWareHouses('WarehouseConfigurations','0')" value="<spring:message code="cancel.label" />" />
									</div> 
									
									</div>
										<input type="hidden" value="${categories}" id="productCategories">
										<input type="hidden" value='${warehouse}' id="warehouseDetails">
                                
                                </div><!-- /.box-body -->
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
        <input type="hidden" id="hideLocation" value="${location}"/>
       
</body>
</html>