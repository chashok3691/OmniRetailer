<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Viswanath
 * file name		        : Inventory Manager/warehouse/warehouseStockReturn.jsp
 * file type		        : JSP
 * description				: The warehouseStockReturn form is displayed using this jsp
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
  <div class="box box-primary">
                                <div class="box-header">
                                <h3 class="box-title"><spring:message code="allStockReturns.label" /></h3>
                                </div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                	<%-- <div class="row">
                                	<div class="col-lg-1">
						                <div class="row">
						                  <div class="col-lg-6" style="text-align:right;top:5px;">
						                    <label><spring:message code="max.records.label"/></label>
						                  </div>
						                  <div class="col-lg-6">
						                    <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="">
					                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
					                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
					                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
					                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
					                      	</select>
						                  <!-- </div>
						               </div> -->
						               </div>
						               <div class="col-lg-3">
						                <div class="row">
						                  <div class="col-lg-4" style="text-align:right;top:5px;">
						                    <label><spring:message code="location.label"/></label>
						                  </div>
						                  <div class="col-lg-8">
						                    <select class="form-control" id="outletLocation" onchange="">
						                       <option value="">-- Select --</option>
						                       <c:forEach var="location" items="${locationsList}">
												<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option>
											   </c:forEach>
						                   </select>
						                  </div>
						               </div>
						               </div>
                                		<div class="col-lg-3">
						                <div class="row">
						                  <div class="col-lg-5" style="text-align:right;top:5px;">
						                  <input type="hidden" id="status" value="${status}">
						                  <input type="hidden" id="sd" value="${startDate}">
				                      <input type="hidden" id="ed" value="${endDate}">
						                    <label><spring:message code="offer_start_date.label"/></label>
						                  </div>
						                  <div class="col-lg-7">
						                    <input class="form-control calendar_icon" readonly="readonly" value="" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="From Date" />
						                  </div>
						               </div>
						               </div>
						               <div class="col-lg-3">
						                <div class="row">
						                  <div class="col-lg-5" style="text-align:right;top:5px;">
						                    <label><spring:message code="offer_end_date.label"/></label>
						                  </div>
						                  <div class="col-lg-7">
						                    <input class="form-control calendar_icon" readonly="readonly" value="" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />
						                  </div>
						               </div>
						               </div>
	                                     <div class="form-group col-lg-2" style="padding-left: 0px; text-align: right;">
	                                         <input type="button" style="width:65px;padding: 4px 12px;" class="btn bg-olive btn-inline" onclick="" value="<spring:message code="search" />" />
	                                     </div>
                                	</div> --%>
           <div class="row">
	        <div class="col-lg-3">
               <div class="row">
                 <div class="col-lg-4 col-xs-4 col-sm-2 col-md-2" style="text-align:left;top:5px;padding-right: 0px;">
                   <label><spring:message code="location.label"/></label>
                 </div>
                 <div class="col-lg-8 col-xs-8 col-sm-10 col-md-10" style="padding-left: 0px;">
	             <select class="form-control" id="outletLocation" onchange="searchShipments('${status}','','0');">
                      <option value=""><spring:message code="ALL.label"/></option>
                      <c:forEach var="location" items="${locationsList}">
						<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option>
					   </c:forEach>
                  </select>
	           </div>
	        </div>
	        </div>
	        <div class="col-lg-2"></div>
	        <div class="col-lg-3">
              <div class="row">
                	<div class="col-lg-4 col-xs-4 col-sm-2 col-md-2" style="text-align:left;top:5px;padding-right: 0px;">
	                	 <input type="hidden" id="status" value="${status}">
		                  <input type="hidden" id="sd" value="${startDate}">
                      	  <input type="hidden" id="ed" value="${endDate}">
	                    <label><spring:message code="offer_start_date.label"/></label>
	                 </div>
                	  <div class="col-lg-8 col-xs-8 col-sm-10 col-md-10" style="padding-left: 0px;">
	                    <input class="form-control calendar_icon form-group" readonly="readonly" value="" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
	                  </div>
              </div>
            </div>
            <div class="col-lg-3">
               <div class="row">
                 <div class="col-lg-4 col-xs-4 col-sm-2 col-md-2" style="text-align:left;top:5px;padding-right: 0px;">
                   <label><spring:message code="offer_end_date.label"/></label>
                 </div>
                 <div class="col-lg-8 col-xs-8 col-sm-10 col-md-10" style="padding-left: 0px;">
	                    <input class="form-control calendar_icon form-group" readonly="readonly" value="" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
	                </div>
	           </div>
	          </div>
           <div class="col-lg-1" style="">
                    <input type="hidden" id="type" value="${type}">
                        <input type="button" style="padding: 4px 8px;" class="btn bg-olive btn-inline" onclick="searchShipments('','','0')" value="<spring:message code="search" />" />
           </div>
	      </div>
            <div class="row">
	      <div class="col-lg-1" style="margin-top: 10px;">
                <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="searchShipments('','0');">
               		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
               		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
               		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
              		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
               	</select>
           </div>
	        <div class="col-lg-10">
       	 		 <input type="text"  class="form-control searchItems"  value="" id="outletShipments" placeholder="<spring:message code="search.shipments.label" />"style="margin-top: 10px;    width: ;margin-left:;height:30PX;text-align: center;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
							<div class="services">
				    			<div class="items">
				     				<ul class="matchedStringUl outletShipments" style=""></ul>
				   				</div>
							</div>
							<input type="hidden" id="shipment" value="${searchName}">
       	 	</div>
	        <div class="col-lg-1" style="margin-top: 10px;padding-left: 0px;">
				<div class="buttons" style=""> 
	        	<c:if test="${sessionScope.role == 'super admin'}">
	        		<a onclick="return viewWarehouseShipment();" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp;
	      		</c:if>
           <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
                <c:if test="${accessControl.appDocument == 'CustomerOrders' && accessControl.write == true}"> 
                	<a onclick="return viewWarehouseStockReturnDetails();" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp;
				</c:if>
			</c:forEach>
				</div>
		</div> 
       </div>                    	
                                	<%-- <div class="row">
								          <div class="col-lg-11">
								  	 		 <input type="text"  class="form-control searchItems" style="margin-top: 5px;text-align: center;height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" value="" id="outletShipments" placeholder="<spring:message code="search.stock.return.label" />" />
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
											<a onclick="return viewWarehouseStockReturnDetails();" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>
										</div>
									</div>
								  </c:if>
								 <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
								    <c:if test="${accessControl.appDocument == 'LocationMaster' && accessControl.write == true}"> 
									   <div class="col-lg-1">
											<div class="buttons" style="margin-top: 3px;padding-left: 0px;margin-left: -15%;">
											     <a onclick="return viewWarehouseStockReturnDetails();" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>
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
				                <table id="example1" class="table table-bordered table-striped">
                                        <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><div style="width:45px;"><spring:message code="sl.no.label" /></div></th>
                                            	<th><spring:message code="shipment.ref.label" /></th>
                                            	<th><spring:message code="returned.by.label" /></th>
                                                <th><spring:message code="supplier.id.label" /></th>
                                                <th><spring:message code="transport.mode.label" /></th>
                                                <th><spring:message code="EmployeeForm.action" /></th>
                                            </tr>
                                        </thead>
                                        
                                        <tbody style="text-align: center;">
                                        	<c:forEach var="shipper" items="${shipmentBeanList}">
                                            <tr>
                                            	<td>${shipper.slNo}</td>
                                            	<td>${shipper.shipmentId}</td>
                                            	<td>${shipper.orderShippedDateStr}</td>
                                                <td>${shipper.shipmentAgency}</td>
                                                <td>${shipper.shipmentAgencyContact}</td>
                                                <td>
                                                <c:if test="${sessionScope.role == 'super admin'}">
                                                	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="">View</a>
                                                	<%-- &nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditShipmentDetails('${shipper.shipmentId}')">Edit</a> --%>
                                                </c:if>
                                                <c:forEach var="accessControl" items="${sessionScope.warehouseSales}">
	                            					<c:if test="${accessControl.appDocument == 'WarehouseShipments' && accessControl.write == true}"> 
                                                		<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="">View</a>
                                                		<%-- &nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditShipmentDetails('${shipper.shipmentId}')">Edit</a> --%>
                                                	</c:if>																	<!-- viewShipmentDetails('${shipper.shipmentId}') -->
                                                </c:forEach>
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