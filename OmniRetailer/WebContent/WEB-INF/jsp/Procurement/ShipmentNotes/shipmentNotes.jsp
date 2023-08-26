<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Viswanath
 * file name		        : Inventory Manager/retailoutlets/procurement/shipmentNotes.jsp
 * file type		        : JSP
 * description				: The shipmentNotes form is displayed using this jsp
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
         <script type="text/javascript" src="${pageContext.request.contextPath}/js/procurement/shipmentNotes.js"></script>  
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
var err = $("#err").val();
if(err != "")
  alert(err);
$("#searchShipmentNotes").val($("#shipmentNote").val());
	$("#searchShipmentNotes").focus();
	$('#searchShipmentNotes').on('input',function(e){
		if($(this).val().trim()==""){
			viewShipmentNotes('','0'); 
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

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
  <div class="box box-primary">
          <div class="box-header"><h3 class="box-title"><spring:message code="shipment.notes.label" /></h3></div><!-- /.box-header -->
          <div class="box-body table-responsive" style="padding-top: 0px;">
          	<input type="hidden" id="sd" value="${startDate}">
		    <input type="hidden" id="ed" value="${endDate}">
               <div class="row">
		        <div class="col-lg-3">
		         <label><spring:message code="location.label"/></label>
	               <div class="col-lg-12" style="padding-left: 0px;padding-right: 0px;">
	                 <div class="col-lg-9 col-xs-8 col-sm-10 col-md-10" style="padding-left: 0px;">
		                 <select class="form-control form-group" id="outletLocation" onchange="searchShipmentNotes('','','0');">
<%-- 		                       <option value=""><spring:message code="ALL.label"/></option> --%>
			                   <c:forEach var="location" items="${locationsList}">
									<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option>
								</c:forEach>
	                   </select>
	                 </div>
		        	</div>
		        </div>
		        <div class="col-lg-5"></div>
		         <div class="col-lg-3" style="padding-left: 0px;padding-right:0px">
		        <div class="col-lg-6" style="padding-left: 0px;padding-right: 15px;">
		        <label><spring:message code="offer_start_date.label"/></label>
	              <!-- <div class="col-lg-12" style="padding-left: 0px;padding-right: 0px;">
	                	 <div class="col-lg-10 col-xs-8 col-sm-12 col-md-12" style="padding-left: 0px;"> -->
	                	 	<input class="form-control calendar_icon form-group"  value="" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
	                	 <!-- </div>
		              </div> -->
		            </div>
		            <div class="col-lg-6" style="padding-left: 0px;padding-right: 15px;">
		              <label><spring:message code="offer_end_date.label"/></label>
		               <!-- <div class="col-lg-12" style="padding-left: 0px;padding-right: 0px;">
		                 <div class="col-lg-10 col-xs-8 col-sm-12 col-md-12" style="padding-left: 0px;"> -->
		                 	<input class="form-control calendar_icon form-group"  value="" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
	                	  <!-- </div>
			           </div> -->
			          </div>
			          </div>
		           <div class="col-lg-1" style="margin-top: 18px;padding-left: 0px">
		                <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="searchShipmentNotes('','','0')" value="<spring:message code="search" />" />
		           </div>
			      </div>
			      <br>
			      <br>
		   			 <div class="row">
				      <div class="col-lg-1 col-xs-2" style="margin-top: 10px;">
			                <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="searchShipmentNotes('','','0');">
			               		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
			               		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
			               		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
			              		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
			               	</select>
			           </div>
				        <div class="col-lg-10 col-xs-10" style="margin-top: 10px;">
			       	 		 <input type="text"  class="form-control searchItems" value="" id="searchShipmentNotes" placeholder="<spring:message code="search.shipment.note.label" />" style="text-align: left;height:30PX;!important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"  />
							<div class="services">
				    			<div class="items">
				     				<ul class="matchedStringUl searchShipmentNotes" style=""></ul>
				   				</div>
							</div>
							<input type="hidden" id="shipmentNote" value="${searchName}">
			       	 	</div>
			              <div class="col-lg-1" style="padding-left: 0px;margin-top:10px;">
								
								<c:if test="${sessionScope.role == 'super admin'}">
                                	<%-- <a onclick="return newShipmentNote();" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a> --%>
                                <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return newShipmentNote();" value="<spring:message code="addnew.label" />" />
                                </c:if>
                             <c:if test="${sessionScope.role != 'super admin'}">
			        			<c:if test="${flowUnder == 'procurement'}">
				        			<c:forEach var="accessControl" items="${sessionScope.procurement}">
			                           <c:if test="${accessControl.appDocument == 'ShipmentNotes' && accessControl.write == true}">
											<%-- <a onclick="return newShipmentNote();" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a> --%>
									  <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return newShipmentNote();" value="<spring:message code="addnew.label" />" />
									  </c:if>
									</c:forEach>
			        			</c:if>
			        			<c:if test="${flowUnder == 'warehouse'}">
				        			<c:forEach var="accessControl" items="${sessionScope.warehouseProcurement}">
			                           <c:if test="${accessControl.appDocument == 'WarehouseShipmentNotes' && accessControl.write == true}">
											<%-- <a onclick="return newShipmentNote();" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a> --%>
									   <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return newShipmentNote();" value="<spring:message code="addnew.label" />" />
									  </c:if>
									</c:forEach>
			        			</c:if>
			        		</c:if>
								
							</div>
				       </div>
						<input type="hidden" id="type" name="type" value="${type}">
						<input type="hidden" id="flowUnder" name="flowUnder" value="${flowUnder}">
               			<table id="example1" class="table table-bordered table-striped">
                                   <thead style="background-color: #3c8dbc; color: #ffffff">
                                       <tr>
                                       		<th><div style=""><spring:message code="sl.no.label" /></div></th>
                                       		<th><spring:message code="shipment.note.ref.label" /></th>
                                       		<th><spring:message code="shipment.ref.label" /></th>
                                       		<th><spring:message code="created.date.label" /></th>
                                           	<th><spring:message code="shipment.date.label" /></th>
                                          	<th><spring:message code="arrival.date.label" /></th>
                                          	<th><spring:message code="status.label" /></th>
                                           	<th><spring:message code="EmployeeForm.action" /></th>
                                       </tr>
                                   </thead>
                                   
                                   <tbody style="text-align: center;">
                                   	<c:forEach var="shipmentNote" items="${purchaseShipmentNoteList}">
                                       <tr>
	                                       <td>${shipmentNote.slNo}</td>
	                                       <td>${shipmentNote.shipmentNoteRef}</td>
	                                       <td>${shipmentNote.shipmentRef}</td>
	                                       <td>${shipmentNote.createdDateStr}</td>
	                                       <td>${shipmentNote.shippedDateStr}</td>
                                           <td>${shipmentNote.arrivalDateStr}</td>
                                           <td>${shipmentNote.status}</td>
                                           <td>
                                           	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewShipmentNoteDetails('${shipmentNote.shipmentNoteRef}','view')">View</a>
                                           <c:if test="${sessionScope.role == 'super admin'}">
                                           	&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewShipmentNoteDetails('${shipmentNote.shipmentNoteRef}','edit')">Edit</a>
                                           </c:if>
                                           <c:if test="${sessionScope.role != 'super admin'}">
							        			<c:if test="${flowUnder == 'procurement'}">
								        			<c:forEach var="accessControl" items="${sessionScope.procurement}">
							                           <c:if test="${accessControl.appDocument == 'ShipmentNotes' && accessControl.write == true}">
															&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewShipmentNoteDetails('${shipmentNote.shipmentNoteRef}','edit')">Edit</a>
													  </c:if>
													</c:forEach>
							        			</c:if>
							        			<c:if test="${flowUnder == 'warehouse'}">
								        			<c:forEach var="accessControl" items="${sessionScope.warehouseProcurement}">
							                           <c:if test="${accessControl.appDocument == 'WarehouseShipmentNotes' && accessControl.write == true}">
															&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewShipmentNoteDetails('${shipmentNote.shipmentNoteRef}','edit')">Edit</a>
													  </c:if>
													</c:forEach>
							        			</c:if>
							        		</c:if>
                                           </td>
           							</tr>
                                       </c:forEach>
                                       
                                   </tbody>
                               </table>
                                 <%--  <input type="hidden" id="flowUnder" value="${flowUnder}"> --%>
               <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewShipmentNotes('${status}','${totalValue}','')">
              	</div>									<!--viewOutletShipments('Ready','pendingOutletShipment','0')  -->
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="viewShipmentNotes('${status}','${index - (maxRecords + 1)}','');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="viewShipmentNotes('${status}','${index - (maxRecords + 1)}','');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewShipmentNotes('${status}','${totalValue}','')">
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