<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri.S
 * file name		        : Admin/genericData/shiftAllocation.jsp
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
        <script type= "text/javascript" src = "${pageContext.request.contextPath}/js/shiftAllocation.js"></script>
         <script type= "text/javascript" src = "${pageContext.request.contextPath}/js/controller.js"></script>
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
	margin-right: 6%;
	  margin-top:8%;  
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
  
$("#shiftAllocationmaster").val($("#shiftAllocation").val());
$("#shiftAllocationmaster").focus();
$('#shiftAllocationmaster').on('input',function(e){
	var flowUnder = $("#flowUnder").val();
	if($(this).val().trim()==""){
		viewShiftAllocationMaster(flowUnder+'shiftConfiguration','0',flowUnder);
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
		<spring:message code="allAllocatedShifts.label" />
	 </h3>
    </div>
          <div class="box-body table-responsive">
           <!--  <div class="row"> -->
             <div class="row">
              <!--  <div class="col-lg-3"></div> -->
                  <div class="col-lg-6">
                   <div class="row">
                    <%--  <div class="col-lg-4 col-xs-4" style="text-align:right;top:5px;padding-right: 0px;">
                       <label><spring:message code="location.label"/></label>
                     </div> --%>
                     <div class="col-lg-5 col-xs-5" >
                       <label><spring:message code="location.label"/></label>
                       <select class="form-control" id="shiftlocation"  onchange="return viewShiftAllocationMaster('${flowUnder}shiftConfiguration','0','${flowUnder}');">
                        	  <option value=""><spring:message code="ALL.label"/></option> 
                           <c:forEach var="location" items="${workLocationsList}">
							<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}">${location}</option>
<%-- 			 			     <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option> --%>
			 			  </c:forEach>
                       </select>
                       </div>
                       
                  </div>
                  </div>
                    <input type="hidden" id="flowUnder" value="${flowUnder}">
                  <div class="col-lg-2"></div>
                  <div class="col-lg-2"></div>
                  	<c:if test="${sessionScope.role == 'super admin'}"> 
		     	
                	
                	  <div class="col-lg-1" style="padding-left: 0px;margin-top: 18px">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return newShiftAllocation('shiftConfiguration');" value="<spring:message code="addnew.label" />">
								           </div>
								           <div class="col-lg-1" style="padding-left: 0px;margin-top: 18px">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return validate('shiftAllocation');" value="<spring:message code="delete.label" />">
								           </div>
                	
                	
				   		<%-- <a onclick="return newShiftAllocation('shiftConfiguration');" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp;
				        <a onclick="return validate('shiftAllocation');" class="button"><font size="2px"><spring:message code="delete.label" /></font></a> --%>
					
		     </c:if>
		      <c:if test="${flowUnder == 'outlet'}">
			<c:forEach var="accessControl" items="${sessionScope.shiftManagement}">
               <c:if test="${accessControl.appDocument == 'ShiftConfiguration' && accessControl.write == true}"> 	
               <div class="col-lg-1" style="padding-left: 0px;margin-top: 18px">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return newShiftAllocation('${flowUnder}shiftConfiguration');" value="<spring:message code="addnew.label" />">
								           </div>
								           <div class="col-lg-1" style="padding-left: 0px;margin-top: 18px">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return validate('shiftAllocation');" value="<spring:message code="delete.label" />">
								           </div>
			  </c:if>
			</c:forEach>
			</c:if>
                 
                 
                  <c:if test="${flowUnder == 'warehouse'}">
                 <c:forEach var="accessControl" items="${sessionScope.warehouseshiftManagement}">
               <c:if test="${accessControl.appDocument == 'WarehouseShiftConfiguration' && accessControl.write == true}"> 	
               <div class="col-lg-1" style="padding-left: 0px;margin-top: 18px">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return newShiftAllocation('${flowUnder}shiftConfiguration');" value="<spring:message code="addnew.label" />">
								           </div>
								           <div class="col-lg-1" style="padding-left: 0px;margin-top: 18px">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return validate('shiftAllocation');" value="<spring:message code="delete.label" />">
								           </div>
			  </c:if>
			</c:forEach>
             </c:if>    
                 
                </div>
 				<%-- <div class="row">
		          <div class="col-lg-12" style="margin-top:1%;">
		  	 		 <input type="text"  class="form-control searchItems searchBar" style="margin-top: 5px;text-align: center;height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" value="" id="shiftAllocationmaster" placeholder="<spring:message code="search.shifts.label" />" />
					<div class="services">
		    			<div class="items">
		     				<ul class="matchedStringUl shiftAllocationMaster" style=""></ul>
		   				</div>
					</div>
					<input type="hidden" id="shiftAllocation" value="${searchName}">
		     	 </div>
		     	 </div>	 --%>	     
				<table id="example1" class="table table-bordered table-striped">
                    <thead style="background-color: #3c8dbc; color: #ffffff">
                        <tr>
                         <c:if test="${sessionScope.role == 'super admin'}"> 
                         	<th align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                         </c:if>
                         
                           <c:if test="${flowUnder == 'outlet'}">
                        <c:forEach var="accessControl" items="${sessionScope.shiftManagement}">
               				<c:if test="${accessControl.appDocument == 'ShiftConfiguration' && accessControl.write == true}">
                        	<th align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                        	</c:if>
                       </c:forEach>
                       </c:if>
                       
                         <c:if test="${flowUnder == 'warehouse'}">
                        <c:forEach var="accessControl" items="${sessionScope.warehouseshiftManagement}">
               				<c:if test="${accessControl.appDocument == 'WarehouseShiftConfiguration' && accessControl.write == true}">
                        	<th align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                        	</c:if>
                       </c:forEach>
                       </c:if>
                       
                       		<th><div><spring:message code="sl.no.label" /></div></th>
                            <th><spring:message code="shift.id.label" /></th>
                            <th><spring:message code="shift.location.label" /></th>
                            <th><spring:message code="shift.department.label" /></th>
                            <th><spring:message code="action.label" /></th>
                        </tr>
                    </thead>
                    <tbody style="text-align: center;">
                    	<c:forEach var="shiftAllocation" items="${shiftAllocationList}" varStatus="theCount">
                         <tr>
                          <c:if test="${sessionScope.role == 'super admin'}"> 
                          	<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value="${shiftAllocation.shiftId}" /></td>
                          </c:if>
                          
                            <c:if test="${flowUnder == 'outlet'}">
                         <c:forEach var="accessControl" items="${sessionScope.shiftManagement}">
               				<c:if test="${accessControl.appDocument == 'ShiftConfiguration' && accessControl.write == true}">
                        		<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value="${shiftAllocation.shiftId}" /></td>
                        	</c:if>
                        </c:forEach>
                        </c:if>
                        
                        <c:if test="${flowUnder == 'warehouse'}">
                          <c:forEach var="accessControl" items="${sessionScope.warehouseshiftManagement}">
               				<c:if test="${accessControl.appDocument == 'WarehouseShiftConfiguration' && accessControl.write == true}">
                        		<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value="${shiftAllocation.shiftId}" /></td>
                        	</c:if>
                        </c:forEach>
                        </c:if>
                        
                      	    <td>${shiftAllocation.slNo}</td>
                            <td>${shiftAllocation.shiftId}</td>
                            <td>${shiftAllocation.shiftLocation}</td>
                            <td>${shiftAllocation.shiftDepartment}</td>
                            <td>
                            <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewSpecificShiftAllocation('${shiftAllocation.shiftId}','view');"><spring:message code="view.label" /></a>&nbsp;&nbsp;&nbsp;
                            <c:if test="${sessionScope.role == 'super admin'}"> 
                            	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewSpecificShiftAllocation('${shiftAllocation.shiftId}','edit');"><spring:message code="edit.label" /></a>
                            </c:if>
                              <c:if test="${flowUnder == 'outlet'}">
                          <c:forEach var="accessControl" items="${sessionScope.shiftManagement}">
               				<c:if test="${accessControl.appDocument == 'ShiftConfiguration' && accessControl.write == true}">
                            <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewSpecificShiftAllocation('${shiftAllocation.shiftId}','edit');"><spring:message code="edit.label" /></a>
                          	</c:if>
                          </c:forEach>  
                          </c:if>
                          
                           <c:if test="${flowUnder == 'warehouse'}">
                           <c:forEach var="accessControl" items="${sessionScope.warehouseshiftManagement}">
               				<c:if test="${accessControl.appDocument == 'WarehouseShiftConfiguration' && accessControl.write == true}">
                            <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewSpecificShiftAllocation('${shiftAllocation.shiftId}','edit');"><spring:message code="edit.label" /></a>
                          	</c:if>
                          </c:forEach>  
                          </c:if>
                          
                            </td>
                         </tr>
                        </c:forEach> 
                      </tbody>
                </table>
               <!--  </div> -->
                
               <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="return viewShiftAllocationMaster('${flowunder}shiftConfiguration','${totalValue}','${flowUnder}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewShiftAllocationMaster('${flowunder}shiftConfiguration','${index - 11}','${flowUnder}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewShiftAllocationMaster('${flowunder}shiftConfiguration','${index - 11}','${flowUnder}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="return viewShiftAllocationMaster('${flowunder}shiftConfiguration','${totalValue}','${flowUnder}')">
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
              		  <input type="button" onclick="viewShiftAllocationMaster('${flowUnder}shiftConfiguration',document.getElementById('pagination').value,'${flowUnder}')" class="btn bg-olive btn-inline  addBtn" value="GO">
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