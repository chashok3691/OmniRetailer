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
        	  
        	// $("#workLocation").val($("#locationHidden").val()); 
          });
          </script>
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

/* 	border-radius: 5px; */
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
                        <spring:message code="warehouses.label"/>
                    </h1>
                    <ol class="breadcrumb">
                    <li><a href="#" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
                       <li><a href="#" onclick="showWarehouseFlows('WarehouseConfigurations')"><spring:message code="warehouse.management.label"/></a></li>
                       <li><a href="#" onclick="getWareHouses('WarehouseConfigurations')"><spring:message code="warehouses.label"/></a></li>
                    </ol>
                </section> --%>
                
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
                                <div class="box-header" Style="text-align:center;">
                                    <h3 class="box-title">Warehouses POS</h3>
                                </div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                	 <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                	 <div id="Success" style="text-align:center;color:blue;font-weight:bold;">${success}</div>
                                	 
                                	<%-- <div class="row">
									  <div class="form-group col-lg-4">
									  </div>
									  <div class="form-group col-lg-4">
									     <label><spring:message code="location.label" /></label>
                                           <select class="form-control" name="location" id="workLocation" onchange="gerWarehousesByLocation()">
                                             <c:forEach var="location" items="${locationsList}"> 
												 <option value="${location}">${location}</option>
											 </c:forEach>
										 </select>
									  </div>
									   <div class="form-group col-lg-4"></div>
									</div> --%>
									
									<%-- <div class="row">
				                      <div class="col-lg-3"></div>
				                      <div class="col-lg-6">
				                       <div class="row">
				                         <div class="col-lg-4" style="text-align:center;top:5px;">
				                           <label><spring:message code="warehouselocation.label"/></label>
				                         </div>
				                         <div class="col-lg-7">
				                         <input type="hidden" name="storeCode" value=""/>
				                           <select class="form-control" name="location" id="workLocation" onchange="gerWarehousesByLocation()">
 				                             <c:forEach var="location" items="${locationsList}">
												<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option>
												 <option value="${location}">${location}</option>
											 </c:forEach>
                                         </select>
				                         </div>
				                      </div>
				                      </div>
				                      <div class="col-lg-3"></div>
				                    </div> --%>
				                    <c:if test="${sessionScope.role == 'super admin'}">
				                    	<div class="row">
				                    		<div class="col-lg-10"></div>
				                    		<div class="col-lg-2" style="margin-top: 3px;">
											  <div class="buttons" style="">
											 
				  				                <a onclick="return newWarehouse('${id}');" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>
				   			               		
				   			               		 <%-- <a onclick="return validate('warehouse');" class="button"><font size="2px"><spring:message code="delete.label" /></font></a>&nbsp;&nbsp;&nbsp; --%>
				   			                  </div>
				   			                 </div>
										</div>
				                    </c:if>
				                 <c:forEach var="accessControl" items="${sessionScope.warehouseManagement}">
	                            	<c:if test="${accessControl.appDocument == 'WarehouseConfigurations' && accessControl.write == true}"> 
					                   <div class="row">
					                    <div class="col-lg-10"></div>
										  <div class="col-lg-2" style="margin-top: 3px;">
											  <div class="buttons" style="">
											  
				  				                <a onclick="return newWarehouse('${id}');" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>
				   			               		
				   			               		 <%-- <a onclick="return validate('warehouse');" class="button"><font size="2px"><spring:message code="delete.label" /></font></a>&nbsp;&nbsp;&nbsp; --%>
				   			                  </div>
				   			               </div>
										</div>
									</c:if>
								</c:forEach>
                                    <table id="example2" class="table table-bordered table-striped">
                                   
                                        <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                           <%--  <c:if test="${sessionScope.role == 'super admin'}">
                                            	<th align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                                            </c:if>
                                            <c:forEach var="accessControl" items="${sessionScope.warehouseManagement}">
	                            				<c:if test="${accessControl.appDocument == 'WarehouseConfigurations' && accessControl.write == true}">
                                            		<th align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                                            	</c:if>
                                            </c:forEach> --%>
                                             <th><spring:message code="sl.no.label" /></th>
                                            
                                                <th><spring:message code="warehouse_code.label" /></th>
                                                <th><spring:message code="created.date.label" /></th>
                                                <th><spring:message code="updated.date.label" /></th>
                                                
                                               
                                               <th>Location ID</th>
                                               <th>Status</th>
                                               <th><spring:message code="category.label" /></th>
                                               
                                                <th><span style="margin-left:55px;"><spring:message code="action.label" /></span></th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                        	<c:forEach var="warehouse" items="${warehouses}" varStatus="theCount">
                                            <tr>
<%--                                             <c:if test="${sessionScope.role == 'super admin'}"> --%>
<%--                                             	<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value="${warehouse.warehouseId}"/></td> --%>
<%--                                             </c:if> --%>
<%--                                              <c:forEach var="accessControl" items="${sessionScope.warehouseManagement}"> --%>
<%-- 	                            				<c:if test="${accessControl.appDocument == 'WarehouseConfigurations' && accessControl.write == true}"> --%>
<%--                                             		<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value="${warehouse.warehouseId}"/></td> --%>
<%--                                             	</c:if> --%>
<%--                                             </c:forEach> --%>
												<td>${theCount.count +index-1}</td>					

                                                <td>${warehouse.warehouseId}</td>
                                                <td>${warehouse.createdDateStr}</td>
                                                <td>${warehouse.updatedDateStr}</td>
                                               
                                               
                                                <td>${warehouse.location}</td>
                                                <c:if test="${warehouse.outletStatus == true}">
                                                <td>Active</td>
                                                </c:if>
                                                <c:if test="${warehouse.outletStatus == false}">
                                                <td>In Active</td>
                                                </c:if>
                                                
                                                <td>${warehouse.category}</td>
                                                <td><a style="color:#2e7ea7 !important;" href="#" onclick="return viewWarehouseposData('${warehouse.warehouseId}','${warehouse.location}','view','${id}')" title="View Warehouse Details"><spring:message code="warehouse_view_data.label"/>
                                               
</a>                                               
                                                 </td>
                							</tr>
                                            </c:forEach> 
                                        </tbody>
                                    </table>
               <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="getWareHouses('${id}','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return getWareHouses('${id}','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-10 <= 0}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return getWareHouses('${id}','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="getWareHouses('${id}','${totalValue}')">
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
              		  <input type="button" onclick="getWareHouses('${id}',document.getElementById('pagination').value)" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
				</div>
              	
              	
              </div>
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
                //$("#example1").dataTable();
                $('#example2').dataTable({
                    "bPaginate": false,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": false,
                    "bInfo": false,
                    "bAutoWidth": true
                });
            });
        </script>
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="store.label" />"/>
         <input type="hidden" id="locationHidden" value="${location }"/>
</body>
</html>