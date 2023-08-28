<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah Y
 * file name		        : admin/genericData/Counters/counterMaster.jsp
 * file type		        : JSP
 * description				: The counters details table is displayed using this jsp
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
<style type="text/css">
@media only screen and (max-width:767px){
.table-responsive{
 overflow:hidden;
}
}
@media only screen and (max-width:1400px)  {

   .table.dataTable {
         width: 100%; 
       
        margin-bottom: 15px;
        overflow-x: auto;
        overflow-y: hidden;
        -webkit-overflow-scrolling: touch;
        -ms-overflow-style: -ms-autohiding-scrollbar;
        border: 1px solid #DDD;
       
   /*  display: inline-block; */
    white-space: nowrap;
    
  }
  }

.buttons {
	float: right;
	padding-top: 0px;
	margin-right: 2px;
	/* margin-top:1%; */ 
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

var err = $("#err").val();
if(err != "")
  alert(err);
$("#searchCounterMaster").val($("#counter").val());
	$("#searchCounterMaster").focus();
	$('#searchCounterMaster').on('input',function(e){
		if($(this).val().trim()==""){
			viewWhCounterMaster('WhcounterMaster','0');
		}
	});
	
	//added by manasa
	$('#mySearch').click(function(){
	    var search = $('#searchCounterMaster').val();
	    return searchWhCounterMaster(search,'','0');
	})
	$('#searchCounterMaster').keypress(function(e){
	    if(e.which == 13){//Enter key pressed
	        $('#mySearch').click();//Trigger search button click event
	    }
	});	
	
	
});
</script>
</head>
<body>
 <!-- Content Header (Page header) -->
<%-- <section class="content-header">
   <h1><spring:message code="generic.data.label" />
     <small><spring:message code="counter_master.label" /></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('admin');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><spring:message code="generic.data.label" /></li><li class="active"><spring:message code="counter_master.label" /></li>
       </ol>
 </section> --%>

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
  <div class="box box-primary">
       <div class="box-header">
           <h3 class="box-title"><spring:message code="counter_master.label" /></h3>
       </div><!-- /.box-header -->
                      <div class="box-body table-responsive">
                      <div class="row">
                        <!-- 	<div class="col-lg-3"></div> -->
                        		<div class="col-lg-6">
		                         <!-- <div class="col-lg-2 col-xs-2" style="text-align:right;top:5px;padding-right: 0px;margin-left: 0px;text-align: left;">
		                           
		                         </div> -->
		                         <div class="col-lg-5 col-xs-5" style="padding:0px">
		                         <label><spring:message code="EmployeeForm.location"/></label>
		                           <select class="form-control" id="counterLocation" onchange="return viewWhCounterMaster('WhcounterMaster','0');">
<%-- 		                           	<option value=""><spring:message code="ALL.label"/></option> --%>
			                         <c:forEach var="location" items="${workLocationsList}">
<%-- 										<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}">${location}</option> --%>
									<c:choose>
						             <c:when test="${location.description == ''}">
							          <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
							         </c:when>
							         <c:otherwise>
							         <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}-${location.description}</option>
							         </c:otherwise>
							       </c:choose>
									 </c:forEach>
                                         </select>
		                           </div>
		                          </div>
		                          <div class="col-lg-3"></div>
		                      </div>
		                      <br>
                      <div class="row">
                      
                       <div class="col-lg-1 col-xs-2" style="margin-top:-18px">
				                      <label>Show</label> 
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewWhCounterMaster('WhcounterMaster','0')">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
                      
	                     <div class="col-lg-9" style="margin-top: 5px;">
		        	 		
		        	 		<div class="wrapper">	 
                      <input type="text"  class="form-control" style="" value="${searchName}" id="searchCounterMaster" placeholder="<spring:message code="search.counters.label" />" />
							<button id="mySearch" class="searchbutton"></button>
							
							</div>
		        	 		 
								<input type="hidden" id="counter" value="${searchName}">
		        	 	</div>
                       <c:if test="${sessionScope.role == 'super admin'}">
								       	 	 <div class="col-lg-1" style="margin-top: p4;padding-left: 0px; padding-right:5px;   height: 20px;">
									<!--  <div class="buttons" style=""> -->
								
									<a onclick="return viewNewWhCounter();" style="padding: 4px 8px;    width: 100%;"  class="btn bg-olive btn-inline" ><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp;
								</div>
					    										       	 	 <div class="col-lg-1" style="margin-top: 4px;padding-left: 0px;    height: 20px;">

								
									<a onclick="return validate('Whcounter');" style="padding: 4px 8px;    width: 100%;"  class="btn bg-olive btn-inline" ><font size="2px"><spring:message code="delete.label" /></font></a>
								<!-- </div> -->
							</div>
                       </c:if>
                       <c:forEach var="accessControl" items="${sessionScope.warehouseManagement}">
                            <c:if test="${accessControl.appDocument == 'WhCounterMaster' && accessControl.write == true}"> 
														       	 	 <div class="col-lg-1" style="margin-top: 4px;padding-left: 5px;padding-right:5px;    height: 20px;">


									<!--  <div class="buttons" style=""> -->
										<a onclick="return viewNewWhCounter();" style="padding: 4px 8px;    width: 100%;"  class="btn bg-olive btn-inline" ><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp;
									</div>
								       	 	 <div class="col-lg-1" style="margin-top: 4px;padding-left: 0px;    height: 20px;">
									
										<a onclick="return validate('Whcounter');"style="padding: 4px 8px;    width: 100%;"  class="btn bg-olive btn-inline" ><font size="2px"><spring:message code="delete.label" /></font></a>
									<!-- </div> -->
								</div>
							</c:if>
						</c:forEach>
						</div>
						<table id="example1" class="table table-bordered table-striped">
							<thead style="background-color: #3c8dbc; color: #ffffff">
								<tr>
								   <c:if test="${sessionScope.role == 'super admin'}">
								   		<th style="width: 40px" align="center"><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
								   </c:if>
								<c:forEach var="accessControl" items="${sessionScope.warehouseManagement}">
                            		<c:if test="${accessControl.appDocument == 'WhCounterMaster' && accessControl.write == true}"> 
										<th style="width: 40px" align="center"><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
									</c:if>
								</c:forEach>
									<th><div><spring:message code="sl.no.label" /></div></th>
									<th><spring:message code="counter_id.label" /></th>
									<th><spring:message code="counter_name.label" /></th>
									<th><spring:message code="counter_deviceId.label" /></th>
									<th><spring:message code="counter_type.label" /></th>
									<th><spring:message code="counter_location.label" /></th>
									<%-- <th><spring:message code="counter_date.label" /></th> --%>
									<th><spring:message code="EmployeeForm.action" /></th>
								</tr>
							</thead>
							<tbody style="text-align: center;">

								<c:forEach var="counter" items="${counterDetails}" varStatus="thecount">
									<tr>
									 <c:if test="${sessionScope.role == 'super admin'}">
									 	<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value="${counter.counterId }" /></td>
									 </c:if>
									<c:forEach var="accessControl" items="${sessionScope.warehouseManagement}">
                           				<c:if test="${accessControl.appDocument == 'WhCounterMaster' && accessControl.write == true}"> 
											<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value="${counter.counterId }" /></td>
										</c:if>
									</c:forEach>
										<td>${thecount.count}</td>
										<td>${counter.counterId}</td>
										<td>${counter.counterName}</td>
										<td>${counter.deviceId}</td>
										<td>${counter.counterType}</td>
										<td>${counter.warehouseLocation}</td>
										<%-- <td>${counter.createdOn}</td> --%>
										<td>
											<a style="color: #2e7ea7 !important; cursor: pointer;" onclick="return viewEditWhCounter('${counter.counterId}','${counter.warehouseLocation}','view')">View</a>&nbsp;&nbsp;&nbsp;
										<c:if test="${sessionScope.role == 'super admin'}">
											<a style="color: #2e7ea7 !important; cursor: pointer;" onclick="return viewEditWhCounter('${counter.counterId}','${counter.warehouseLocation}','edit')">Edit</a>
										</c:if>
										<c:forEach var="accessControl" items="${sessionScope.warehouseManagement}">
                            				<c:if test="${accessControl.appDocument == 'WhCounterMaster' && accessControl.write == true}"> 
												<a style="color: #2e7ea7 !important; cursor: pointer;" onclick="return viewEditWhCounter('${counter.counterId}','${counter.warehouseLocation}','edit')">Edit</a>
											</c:if>
										</c:forEach>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
			<div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-2" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewWhCounterMaster('WhcounterMaster','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-2" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewWhCounterMaster('WhcounterMaster','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewWhCounterMaster('WhcounterMaster','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewWhCounterMaster('WhcounterMaster','${totalValue}')">
              	</div> 
              	</c:if>
              	
              	
              	
              	<div class="form-group col-lg-4"></div>
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
              		  <input type="button" onclick="viewWhCounterMaster('WhcounterMaster',document.getElementById('pagination').value)" class="btn bg-olive btn-inline  addBtn" value="GO">
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
         <script src="${pageContext.request.contextPath}/js/counters.js" type="text/javascript"></script>
         <!-- page script -->
        <script type="text/javascript">
            $(function() {
                //$("#example1").dataTable();
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
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="counter.delete.label" />"/>
        <input type="hidden" id="err" value="${err}" />
        
</body>
</html>