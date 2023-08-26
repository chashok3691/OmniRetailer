<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : Inventory Manager/master/shiftMaster.jsp
 * file type		        : JSP
 * description				: The shift details table is displayed using this jsp
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
        	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script> 
<style type="text/css">
@media only screen and (max-width:767px){
.table-responsive{
 overflow:hidden;
}
}
@media only screen and (max-width:1080px)  {

   .table.dataTable {
         width: 100%; 
       
        margin-bottom: 15px;
        overflow-x: auto;
        overflow-y: hidden;
        -webkit-overflow-scrolling: touch;
        -ms-overflow-style: -ms-autohiding-scrollbar;
        border: 1px solid #DDD;
       
    display: inline-block;
    white-space: nowrap;
    
  }

}
.buttons {
	float: right;
	padding-top: 0px;
	margin:0px 2px 0px;
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

	border-radius: 5px;
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}
.wrapper {
    /* border:1px solid #000;
    display:inline-block; */
    position:relative;
}
</style>     
<script type="text/javascript">
$(document).ready(function(){
var err = $("#err").val();
if(err != "")
  alert(err);
  
$("#shiftmaster").val($("#shift").val());
$("#shiftmaster").focus();
/* $('#shiftmaster').on('input',function(e){
	if($(this).val().trim()==""){
		//added by manasa
		 var location = $('#shiftLocation').val();
		var flowUnder = $("#flowUnder").val();
		viewShiftMaster(flowUnder+'shiftMaster','0',location,flowUnder);
	}
}); */

//added by manasa
$('#mySearch').click(function(){
	
	    var location = $('#shiftLocation').val();
		var flowUnder = $("#flowUnder").val();
		viewShiftMaster(flowUnder+'shiftMaster','0',location,flowUnder);
})
$('#shiftmaster').keypress(function(e){
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
   <h1><spring:message code="masters.label" />
     <small><spring:message code="shift.master.label" /></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><spring:message code="masters.label" /></li>
       </ol>
 </section> --%>

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
  <div class="box box-primary">
   <div class="box-header" >
     <h3 class="box-title">
		<spring:message code="allshifts.label" />
	 </h3>
    </div>
            <div class="box-body table-responsive">
<%--              <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 15px; margin-top: -25px">${err}</div> --%>
           <!--  <div class="row"> -->
                <div class="row">
                 <!-- <div class="col-lg-3"></div> -->
                    <div class="col-lg-6">
                     <div class="row">
                       <%-- <div class="col-lg-2 col-xs-2" style="text-align:right;top:5px;padding-right: 0px;t">
                         <label><spring:message code="location.label"/></label>
                       </div> --%>
                       <div class="form-group col-lg-5 col-xs-5">
                        <label><spring:message code="location.label"/></label>
                         <select class="form-control" id="shift_location" onchange="return viewShiftMaster('${flowunder}shiftMaster','0',this.options[this.selectedIndex].value,'${flowunder}');">
                         	<option value=""><spring:message code="ALL.label"/></option>
                            <c:forEach var="location" items="${workLocationsList}">
                                       <%-- <c:if test="${flowUnder == 'warehouse' || flowUnder eq 'warehouse'}"> --%>
                                      <c:if test="${location.businessActivity == 'Warehouse' }">
												
												 <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
										 	
											</c:if>
											<%-- </c:if> --%>
											  <c:if test="${flowUnder != 'warehouse' }">
											   <c:if test="${location.businessActivity != 'Warehouse' }">
												<option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
											</c:if>
											</c:if>	
											
										

					 		</c:forEach>
                        </select>
                         </div>
                    </div>
                    </div>
                    <div class="col-lg-3">
		             <%-- <c:if test="${sessionScope.role == 'super admin'}"> 
		               	 <div class="row">
		                	<div class="buttons">
							   		<a onclick="return viewNewShift();" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp;
							        <a onclick="return validate('shift');" class="button"><font size="2px"><spring:message code="delete.label" /></font></a>
							 </div>
					  	</div>
		               </c:if>
					<c:forEach var="accessControl" items="${sessionScope.outletManagement}">
		               <c:if test="${accessControl.appDocument == 'ShiftMaster' && accessControl.write == true}"> 	
		               <div class="row">
		                	<div class="buttons">
							   		<a onclick="return viewNewShift();" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp;
							        <a onclick="return validate('shift');" class="button"><font size="2px"><spring:message code="delete.label" /></font></a>
							 </div>
					  </div>
					  </c:if>
					</c:forEach> --%>
                    </div>
                  </div>
                  <div class="row">
			         
			            <!--modified by manasa  -->
				                       <div class="col-lg-10 col-xs-8" style="">
                      <div class="wrapper">	 
                      <input type="text"  class="form-control" style="${searchName}" value="" id="shiftmaster" placeholder="<spring:message code="searchBy.label" />" />
							<button id="mySearch" class="searchbutton"></button>
							<!-- <div class="services">
				    			<div class="items">
				     				<ul class="matchedStringUl searchStocks" style=""></ul>
				   				</div>
							</div> -->
							</div>
						<input type="hidden" id="shift" value="${searchName}">
                    </div>
			         
			         <%--  <div class="col-lg-10" style="">
			  	 		 <input type="text"  class="form-control searchItems searchBar" style="" value="" id="shiftmaster" placeholder="<spring:message code="search.shifts.label" />" />
						<div class="services">
			    			<div class="items">
			     				<ul class="matchedStringUl shiftMaster" style=""></ul>
			   				</div>
						</div>
						<input type="hidden" id="shift" value="${searchName}">
			     	 </div> --%>
			     	  <c:if test="${sessionScope.role == 'super admin'}">
			     	  <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return viewNewShift();" value="<spring:message code="addnew.label" />">
								           </div>
								           <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return validate('shift');" value="<spring:message code="delete.label" />">
								           </div>
                       		<%-- <div class="col-lg-2" style="padding-left: 0px;margin-top: 5px;">
								<div class="buttons" style="">
									<a onclick="return viewNewShift();" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp;
							        <a onclick="return validate('shift');" class="button"><font size="2px"><spring:message code="delete.label" /></font></a>
								</div>
							</div>
 --%>                       </c:if>
 
 
 <c:if test="${flowunder == 'outlet'}">
  <c:forEach var="accessControl" items="${sessionScope.shiftManagement}">
		               		<c:if test="${accessControl.appDocument == 'ShiftMaster' && accessControl.write == true}">  
								<div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return viewNewShift();" value="<spring:message code="addnew.label" />">
								           </div>
								           <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return validate('shift');" value="<spring:message code="delete.label" />">
								           </div>
							</c:if>
						</c:forEach>
						</c:if>
 
                       <c:if test="${flowunder == 'warehouse'}">
                       <c:forEach var="accessControl" items="${sessionScope.warehouseshiftManagement}">
		               		<c:if test="${accessControl.appDocument == 'WarehouseShiftMaster' && accessControl.write == true}">  
								<div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return viewNewShift();" value="<spring:message code="addnew.label" />">
								           </div>
								           <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return validate('shift');" value="<spring:message code="delete.label" />">
								           </div>
							</c:if>
						</c:forEach>
						</c:if>
			     	 </div>
				<table id="example1" class="table table-bordered table-striped">
                    <thead style="background-color: #3c8dbc; color: #ffffff">
                        <tr>
                        <c:if test="${sessionScope.role == 'super admin'}"> 
                        	<th align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                        </c:if>
                        
                        <c:if test="${flowunder == 'outlet'}">
                        <c:forEach var="accessControl" items="${sessionScope.shiftManagement}">
               				<c:if test="${accessControl.appDocument == 'ShiftMaster' && accessControl.write == true}">
                        		<th align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                        	</c:if>
                       </c:forEach>
                       </c:if>
                       
                       <c:if test="${flowunder == 'warehouse'}">
                        <c:forEach var="accessControl" items="${sessionScope.warehouseshiftManagement}">
               				<c:if test="${accessControl.appDocument == 'WarehouseShiftMaster' && accessControl.write == true}">
                        		<th align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                        	</c:if>
                       </c:forEach>
                       </c:if>
                       
                       
                       		<th><div ><spring:message code="sl.no.label" /></div></th>
                            <th><spring:message code="shift.id.label" /></th>
                            <th><spring:message code="location.label" /></th>
                            <th><spring:message code="shift.name.label" /></th>
                            <th><spring:message code="start.date.label" /></th>
                            <th><spring:message code="end.date.label" /></th>
                            <th><spring:message code="remarks.label" /></th>
                            <th><spring:message code="action.label" /></th>
                        </tr>
                    </thead>
                    <tbody style="text-align: center;">
                    	<c:forEach var="shift" items="${shiftsList.shifts}" varStatus="theCount" >
                         <tr>
                         <c:if test="${sessionScope.role == 'super admin'}"> 
                         	<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value="${shift.shiftId}" /></td>
                         </c:if>
                         
                         <c:if test="${flowunder == 'outlet'}">
                         <c:forEach var="accessControl" items="${sessionScope.shiftManagement}">
               				<c:if test="${accessControl.appDocument == 'ShiftMaster' && accessControl.write == true}">
                        		<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value="${shift.shiftId}" /></td>
                        	</c:if>
                        </c:forEach>
                        </c:if>
                        
                         <c:if test="${flowunder == 'warehouse'}">
                         <c:forEach var="accessControl" items="${sessionScope.warehouseshiftManagement}">
               				<c:if test="${accessControl.appDocument == 'WarehouseShiftMaster' && accessControl.write == true}">
                        		<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value="${shift.shiftId}" /></td>
                        	</c:if>
                        </c:forEach>
                        </c:if>
                        
                        
                        	<td>${shift.slNo}</td>
                            <td>${shift.shiftId}</td>
                            <td>${shift.storeLocation}</td>
                            <td>${shift.shiftName}</td>
                            <td>${shift.start_date}</td>
                            <td>${shift.end_date}</td>
                            <td>${shift.remarks}</td>
                            <td>
                            <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewSpecificShift('${shift.shiftId}','${shift.storeLocation}','view');"><spring:message code="view.label" /></a>&nbsp;&nbsp;&nbsp;
                          <c:if test="${sessionScope.role == 'super admin'}"> 
                          	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewSpecificShift('${shift.shiftId}','${shift.storeLocation}','edit');"><spring:message code="edit.label" /></a>
                          </c:if>
                      
                      <c:if test="${flowunder == 'outlet'}">
                            <c:forEach var="accessControl" items="${sessionScope.shiftManagement}">
               				<c:if test="${accessControl.appDocument == 'ShiftMaster' && accessControl.write == true}">
                            	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewSpecificShift('${shift.shiftId}','${shift.storeLocation}','edit');"><spring:message code="edit.label" /></a>
                          	</c:if>
                          </c:forEach>
                          </c:if>
                      
                       <c:if test="${flowunder == 'warehouse'}">
                          <c:forEach var="accessControl" items="${sessionScope.warehouseshiftManagement}">
               				<c:if test="${accessControl.appDocument == 'WarehouseShiftMaster' && accessControl.write == true}">
                            	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewSpecificShift('${shift.shiftId}','${shift.storeLocation}','edit');"><spring:message code="edit.label" /></a>
                          	</c:if>
                          </c:forEach>  
                          </c:if>
                            </td>
                         </tr>
                        </c:forEach> 
                      </tbody>
                </table>
               <!--  </div> -->
                 <!--added by manasa  -->
			     	 <input type="hidden" id="shiftLocation" value="${selectedLocation}">
                <input type="hidden" id="flowUnder" value="${flowunder}">
               <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="return viewShiftMaster('${flowunder}shiftMaster','${totalValue}','<c:out value="${selectedLocation}"/>','${flowunder}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewShiftMaster('${flowunder}shiftMaster','${index - 11}','<c:out value="${selectedLocation}"/>','${flowunder}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewShiftMaster('${flowunder}shiftMaster','${index - 11}','<c:out value="${selectedLocation}"/>','${flowunder}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="return viewShiftMaster('${flowunder}shiftMaster','${totalValue}','<c:out value="${selectedLocation}"/>','${flowunder}')">
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
              		  <input type="button" onclick="viewShiftMaster('${flowunder}shiftMaster',document.getElementById('pagination').value,'<c:out value="${selectedLocation}"/>','${flowunder}')" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
				</div>
              	
              	
              </div>
              </div>  
            </div><!-- /.box-body -->
        </div><!-- /.box -->
  
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
                    "bAutoWidth": true
                });
            });
        </script>
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="shift.label" />"/>
        <input type="hidden" id="err" value="${err}" />
</body>
</html>