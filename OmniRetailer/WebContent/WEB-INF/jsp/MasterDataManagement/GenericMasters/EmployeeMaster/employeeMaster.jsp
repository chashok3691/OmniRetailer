<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : admin/genericData/employeeMaster.jsp
 * file type		        : JSP
 * description				: The employee details table is displayed using this jsp
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
          <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
        
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/masterDataManagement/genericMasters/employeeMaster.js"></script>
        <%--  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css"> --%>
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

	border-radius: 5px;
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}
</style>       
<script type="text/javascript">
$(document).ready(function(){
/* var err = $("#err").val();
if(err != "")
  alert(err);
 $("#searchEmployeeMaster").val($("#employee").val());
//if($("#searchEmployeeMaster").val().trim()!="")
	$("#searchEmployeeMaster").focus();  */
	
	$('#mySearch').click(function(){
	      var search = $('#searchEmployeeMaster').val();
	      return viewEmployeeMaster('employeeMaster','0','');;
	  })
	   $('#searchEmployeeMaster').keyup(function(e){
	  	 
	      if(e.which == 13){//Enter key pressed
	          $('#mySearch').click();//Trigger search button click event
	      }
	       else if(e.which == 8){ //backspace key pressed
	      	 if($('#searchEmployeeMaster').val()=="")
	      	 $('#mySearch').click();//Trigger search 
	      }
	     });

	
});

</script>
</head>
<body>
 <!-- Content Header (Page header) -->
<%-- <section class="content-header">
   <h1><spring:message code="generic.data.label" />
     <small><spring:message code="employee.master.label" /></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('admin');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><spring:message code="generic.data.label" /></li>
       </ol>
 </section> --%>

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
  <div class="box box-primary">
                        <div class="box-header" style="text-align: center;">
                            <h3 class="box-title"><spring:message code="allEmployees.label" /></h3>
                        </div><!-- /.box-header -->
                        <div class="box-body table-responsive">
                   <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${err}</div>
                   <div id="Success" class="Success" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${Success}</div>
                        
                        	<div class="row">
                        	<!-- <div class="col-lg-3"></div> -->
                        		<div class="col-lg-6">
		                         <!-- <div class="col-lg-2 col-xs-2" style="text-align:right;top:5px;padding-right: 0px;">
		                          
		                         </div> -->
		                         <div class="col-lg-5 col-xs-5" style="padding-left: 0px">
		                          <label><spring:message code="EmployeeForm.location"/></label>
		                           <select class="form-control" id="employeelocation" onchange="return viewEmployeeMaster('employeeMaster','0',this.options[this.selectedIndex].value);">
		                           	<option value=""><spring:message code="ALL.label"/></option>
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
		                             <div class="col-lg-5 col-xs-5" style="padding-left: 0px;margin-bottom: 3px;">
		                            		                          <label><spring:message code="customer.newfeedback.emptyspace"/></label>
		                            
		                           
		                          <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="loadHRMS();" value="Load from HRMS">
		                         
		                         
		                           </div> 
		                            <div class="col-lg-2 col-xs-2" style="padding-left: 0px;margin-bottom: 3px;">
		                           	 <label><spring:message code="customer.newfeedback.emptyspace"/></label>
		                           
		                            <span style="visibility: hidden;" id="suppliersImgspan">
									<img style="width: 30px;margin-top:20px" id="suppliersImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						  	       </span>
						  	       </div>
		                           
		                          </div>
		                          <div class="col-lg-3"></div>
		                      </div>
		                     
                          <div class="row">
                           <div class="col-lg-1 col-xs-1">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewEmployeeMaster('employeeMaster','0','');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
		                      <div class="col-lg-9 nopadding">
		                      	<input type="text"  class="form-control" value="${searchName}" id="searchEmployeeMaster" placeholder="<spring:message code="search.employee.label" />" />
                   				  <button id="mySearch" class="searchbutton"></button>
							<input type="hidden" id="searchName" value="${searchName}">
							
							<input type="hidden" id="employee" value="${searchName}">
		                      </div>
		                    
		                    <c:if test="${sessionScope.role == 'super admin'}"> 
                               <!--    <div class="col-lg-2" style="padding-left: 0px;">
									 <div class="buttons" style=""> -->
		  				               <%-- <a onclick="return viewNewEmployee();" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp; --%>
		   			                  <div class="col-lg-1" style="padding-left: 8px;padding-right: 8px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return viewNewEmployee();" value="<spring:message code="addnew.label" />">
								           </div>
								           <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return  validate('employee');" value="<spring:message code="delete.label" />">
								           </div>
		   			                   <%-- <a onclick="return validate('employee');" class="button"><font size="2px"><spring:message code="delete.label" /></font></a> --%>
									<!--  </div>
								  </div> -->
		                    </c:if>
		                      <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                             	<c:if test="${accessControl.appDocument == 'EmployeeMaster' && accessControl.write == true && accessControl.read == true}">
                               <!--    <div class="col-lg-2" style="padding-left: 0px;">
									 <div class="buttons" style=""> -->
		  				               <%-- <a onclick="return viewNewEmployee();" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp; --%>
		   			                  <div class="col-lg-1" style="padding-left: 8px;padding-right: 8px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return viewNewEmployee();" value="<spring:message code="addnew.label" />">
								           </div>
								           <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return  validate('employee');" value="<spring:message code="delete.label" />">
								           </div>
		   			                   <%-- <a onclick="return validate('employee');" class="button"><font size="2px"><spring:message code="delete.label" /></font></a> --%>
									<!--  </div>
								  </div> -->
								</c:if>
								</c:forEach>
							</div>
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                         <c:if test="${sessionScope.role == 'super admin'}"> 
                                         	<th style="width: 40px"  align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                                         </c:if>
                                        <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                             				<c:if test="${accessControl.appDocument == 'EmployeeMaster' && accessControl.write == true && accessControl.read == true}">
                                            	<th style="width: 40px"  align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                                      		</c:if>
                                      	</c:forEach>
                                      			<th class="sorting_disabled" role="columnheader" rowspan="1" colspan="1" style="width: 98px;">
                                                <div style="">SL No.</div></th>
                                            	<th><div><spring:message code="EmployeeForm.code" /></div></th>
                                                <th><div><spring:message code="EmployeeForm.firstName" /></div></th>
                                                <th><div><spring:message code="EmployeeForm.designation" /></div></th>
                                                <th><div><spring:message code="EmployeeForm.location" /></div></th>
                                                <th><div><spring:message code="EmployeeForm.department" /></div></th>
                                                <th><div><spring:message code="EmployeeForm.reportingManager" /></div></th>
                                                <th><div><spring:message code="EmployeeForm.action" /></div></th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                        
                                            <c:forEach var="employee" items="${employeeList}">
                                            <tr>
                                              <c:if test="${sessionScope.role == 'super admin'}"> 
                                              	<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value="${employee.employeeCode}" /></td>
                                              </c:if>
                                            <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                             					<c:if test="${accessControl.appDocument == 'EmployeeMaster' && accessControl.write == true && accessControl.read == true}">
                                            		<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value="${employee.employeeCode}" /></td>
                                            	</c:if>
                                             </c:forEach>
                                             	<td>${employee.slNo}</td>
                                                <td>${employee.employeeCode}</td>
                                                <td>${employee.firstName}</td>
                                                <td>${employee.designation}</td>
                                                <td>${employee.location}</td>
                                                <td>${employee.department}</td>
                                                <td>${employee.reportingManager}</td>
                                                <td>
                                                <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditEmployee('${employee.employeeCode}','view')">View</a>&nbsp;&nbsp;&nbsp;
                                                <c:if test="${sessionScope.role == 'super admin'}"> 
                                                	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditEmployee('${employee.employeeCode}','edit')">Edit</a>
                                                </c:if>
                                               <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                             					<c:if test="${accessControl.appDocument == 'EmployeeMaster' && accessControl.write == true && accessControl.read == true}">
                                                	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditEmployee('${employee.employeeCode}','edit')">Edit</a>
                                                </c:if>
                                               </c:forEach>
                                                </td>
                							</tr>
                                            </c:forEach>
                                        </tbody>
                                       
                                    </table>
                                     <input type="hidden" id="location" value="${location}">
        <%--       <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="return viewEmployeeMaster('employeeMaster','${totalValue}','<c:out value="${selectedLocation}"/>')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewEmployeeMaster('employeeMaster','${index - 11}','<c:out value="${selectedLocation}"/>');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-10 <= 0}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewEmployeeMaster('employeeMaster','${index - 11}','<c:out value="${selectedLocation}"/>');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="return viewEmployeeMaster('employeeMaster','${totalValue}','<c:out value="${selectedLocation}"/>')">
              	</div> 
              	</c:if>
              </div>
                --%>
                
                                              
           <div class="row">
    
              	<c:if test="${index-1 == 0 && totalRecords > maxRecords}">
              		<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${index + maxRecords-1} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewEmployeeMaster('employeeMaster','${index+maxRecords-1}')">
              	</div>
              	</c:if>
              		
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewEmployeeMaster('employeeMaster','${index - maxRecords-1}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		<div class="form-group col-lg-2" >
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewEmployeeMaster('employeeMaster','${index - maxRecords-1}');"> ${index} - ${index+maxRecords-1} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewEmployeeMaster('employeeMaster','${index+maxRecords-1}')">
              	</div> 
              	</c:if>
              	<div class="form-group col-lg-4"></div>
              	<div class="col-lg-6" style="text-align: right;"> 
              	<div class="col-lg-8" style="text-align: right;padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
              	<div class="col-lg-2" style="padding-right: 0px;">
              		<select class="form-control" id="pagination">
              		<c:set var="totalRecords" value="${totalRecords+1}"></c:set>
              	<c:forEach var="i" begin="0" end="${totalRecords}">
              	<c:if test="${(totalRecords)>0}">
              		<option value="${(i*maxRecords)}" ${index-1 == i*maxRecords ? 'selected' : ''}> ${i+1}</option>
              		<c:set var="totalRecords" value="${totalRecords-maxRecords}"></c:set>
              	</c:if>
				</c:forEach>
					</select>
              		
              	</div>
              		<div class="col-lg-2" style="padding-right: 0px;">
              		  <input type="button" onclick="viewEmployeeMaster('employeeMaster',document.getElementById('pagination').value)" class="btn bg-olive btn-inline  addBtn" value="GO">
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
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="employee.label" />"/>
        <input type="hidden" id="err" value="${err}" />
</body>
</html>