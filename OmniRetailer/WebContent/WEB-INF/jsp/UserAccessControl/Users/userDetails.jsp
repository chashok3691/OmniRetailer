<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : admin/userDetails.jsp
 * file type		        : JSP
 * description				: The user details table is displayed using this jsp
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
             <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
        <script type= "text/javascript" src = "${pageContext.request.contextPath}/js/userAccessControl/user.js"></script>
<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
	margin-right: 1%;
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
/* #table-wrapper {
  position:relative;
  overflow-x: auto;
   white-space: nowrap;
} */

</style>  
<script type="text/javascript">
$(document).ready(function(){
	var result = $("#right-side").height();
	//$("#main-menu").css("height",result+"px");
	var err = $("#err").val();
	
	$("#SkuMaster").val($("#sku").val());
	//if($("#searchSKU").val().trim()!="")
		$("#SkuMaster").focus();

	 var typeValue = $("#typeValue").val();
	 
	 
	 $('#SkuMaster').on('input',function(e){
		if($(this).val().trim()==""){
			viewUserDetails(typeValue,'0');
		}
	});
	
	
	 $('#mySearch').click(function(){
	        var search = $('#SkuMaster').val();
	        return viewUserDetails(typeValue,'0');
	    })
	    $('#SkuMaster').keypress(function(e){
	        if(e.which == 13){//Enter key pressed
	            $('#mySearch').click();//Trigger search button click event
	        }
	    });  
	
	if(err != "")
  		alert(err);
});
</script>      
</head>
<body>
 <!-- Content Header (Page header) -->
<%-- <section class="content-header">
   <h1><spring:message code="users.label" />
    <c:if test="${type == 'all'}">
        <small><spring:message code="allUsers.label" /></small>
    </c:if>
     <c:if test="${type == 'active'}">
        <small><spring:message code="enabled.users.label" /></small>
    </c:if>
    <c:if test="${type == 'suspend'}">
        <small><spring:message code="disabled.users.label" /></small>
    </c:if>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('admin');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><a style="cursor: pointer;" onclick="showUsersFlow();"><spring:message code="users.label" /></a></li>
       </ol>
 </section> --%>

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
		<div class="box box-primary">
			<div class="box-body table-responsive">
			<div class="box-header">
				<c:if test="${type == 'all'}">
					<h3 class="box-title">
						<spring:message code="allUsers.label" />
					</h3>
				</c:if>
				<c:if test="${type == 'active'}">
					<h3 class="box-title">
						<spring:message code="enabled.users.label" />
					</h3>
				</c:if>
				<c:if test="${type == 'suspend'}">
					<h3 class="box-title">
						<spring:message code="disabled.users.label" />
					</h3>
				</c:if>
			</div>
					<!-- /.box-header -->
		<input type="hidden" value="${type}" id="typeValue">
		
		
		
		
		  <%-- <div class="col-lg-11" style=" background: #f4f4f4;    padding: 4px 20px;    width: 88%;">
                  <div class="row">
                        <div class="form-group col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="location.label"/></label>
                           <select class="form-control" id="location">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="location" items="${workLocationsList}">
						 	   <c:choose>
							     <c:when test="${location.description == ''}">
							       <option value="${location.locationId}" ${location.locationId == userLocation ? 'selected' : ''}>${location.locationId}</option>
							     </c:when>
							    <c:otherwise>
							     <option value="${location.locationId}" ${location.locationId == userLocation ? 'selected' : ''}>${location.locationId}-${location.description}</option>
							    </c:otherwise>
							   </c:choose>
						 		
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                     <div class="col-lg1-2 col-lg-3 form-group">
                       
                      </div>
                    <div class="col-lg1-2 col-lg-2">
                     
                      </div>
                  
                       
                         <div class="col-lg1-2 col-lg-2">
             
	            </div>
	           
                    </div>
                     <div class="row">
                       	<div class="form-group col-lg-2">
                                 <label><spring:message code="EmployeeForm.role" /></label>
                                 <select class="form-control" id="roles">
                                  <option value=""><spring:message code="ALL.label"/></option>
                                 	<c:forEach var="role" items="${roleList}">
										<option value="${role.roleName}"${role.roleName == roleName ? 'selected' : ''}>${role.roleName}</option>
									</c:forEach>
                                 	
                                 </select>
                                 <span id="rolesError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                             </div>
                   
                       <div class="col-lg1-2 col-lg-2">
                 
                      </div>
                      
                       <div class="col-lg1-2 col-lg-3 form-group">
                     
                      </div>
                    
                     
                      <div class="col-lg1-2 col-lg-2">
	            
		          </div>
                    </div>
                  </div> --%>
                   <%-- <div class="col-lg-1" style="    width: 12%;   background: #ccc;">
                    <div class="col-lg-12" style=" padding: 8px 16px; border-top: 5px solid #ccc; border-bottom: 5px solid #ccc;">
                     <div class="row">
                       <a onclick="viewUserDetails('${type}','0')" style="padding: 4px 8px;margin-top: 16px;" class="btn bg-olive btn-inline"><spring:message code="searchbutton.label"/></a>
                     </div>
                     <div class="row">
                       <a onclick="resetForm();" style="padding: 4px 8px;margin-bottom: 16px;width: 100%;margin-top: 16px;" class="btn bg-olive btn-inline"><spring:message code="clearbutton.label"/></a>
                     </div>
                   </div>
                 </div> --%>
                <!--   
                  <div class="col-lg-12" style="">   
                 <br>
                 </div> -->
                  
		
		<div class="row">
		
		
		 <div class="form-group col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="location.label"/></label>
                           <select class="form-control" id="location">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="location" items="${workLocationsList}">
						 	   <c:choose>
							     <c:when test="${location.description == ''}">
							       <option value="${location.locationId}" ${location.locationId == userLocation ? 'selected' : ''}>${location.locationId}</option>
							     </c:when>
							    <c:otherwise>
							     <option value="${location.locationId}" ${location.locationId == userLocation ? 'selected' : ''}>${location.locationId}-${location.description}</option>
							    </c:otherwise>
							   </c:choose>
						 		
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                  
                  
                  	<div class="form-group col-lg-2">
                                 <label><spring:message code="EmployeeForm.role" /></label>
                                 <select class="form-control" id="rolesName">
                                  <option value=""><spring:message code="ALL.label"/></option>
                                 	<c:forEach var="role" items="${roleList}">
										<option value="${role.roleName}"${role.roleName == roleName ? 'selected' : ''}>${role.roleName}</option>
									</c:forEach>
                                 </select>
                                 <span id="rolesError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                             </div>
                      
                      
		
		
		
		<div class="col-lg-6"></div>
		
		
		 <div class="col-lg-1" style="padding-left: 0px;float:right;margin-top: 20px;">
							<input type="button" onclick="resetForm();" class="btn bg-olive btn-inline  addBtn" value="<spring:message code="clearbutton.label" />">
							</div>
		
		  <div class="col-lg-1" style="padding-left: 0px;float:right;margin-top: 20px;">
							<input type="button" onclick="viewUserDetails('${type}','0')" class="btn bg-olive btn-inline  addBtn" value="<spring:message code="searchbutton.label" />">
							</div>
		
			
			<div class="form-group col-lg-1">
			
			</div>	
		</div>
				<div class="row">
				
				  <div class="col-lg-1 col-xs-2">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewUserDetails('${type}','0')">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                     		<%-- <option value="-1" ${maxRecords == '-1' ? 'selected' : ''}>All</option> --%>
				                      	</select>
				                      </div>
				
				
				<!-- <div class="col-lg-10"></div> -->
				 <div class="col-lg-9" style="margin-left: -16px;">
		                <div class="wrapper">
	        	 		 <input type="text"  class="form-control"  value="${searchName}" id="SkuMaster" placeholder="<spring:message code="searchUsers.label" />" />
						<!-- 	<input type="button" value="Search" id="mySearch"> -->
						<button id="mySearch" class="searchbutton"></button>
						
							</div><input type="hidden" id="sku" value="${searchName}">
	        	 		</div>
				 <c:if test="${sessionScope.role == 'super admin'}"> 
				 		<div class="" style="margin-bottom: 7px;">
							 <div class="col-lg-1" style="padding-left: 0px;float:right">
							  <input type="button" onclick="return validate('user');" class="btn bg-olive btn-inline addBtn" value="<spring:message code="delete.label" />">
						</div>
						
					
					  <div class="col-lg-1" style="padding-left: 0px;float:right;">
							<input type="button" onclick="return viewNewUser();" class="btn bg-olive btn-inline  addBtn" value="<spring:message code="addnew.label" />">
							</div>
					
						</div>
				 </c:if>
				 <c:forEach var="accessControl" items="${sessionScope.userAccessControl}">
                    <c:if test="${accessControl.appDocument == 'UserManagement' && accessControl.write == true}"> 
					  <div class="col-lg-1" style="padding-left: 0px;float:right">
							  <input type="button" onclick="return validate('user');" class="btn bg-olive btn-inline addBtn" value="<spring:message code="delete.label" />">
						</div>
						
					
					  <div class="col-lg-1" style="padding-left: 0px;float:right;">
							<input type="button" onclick="return viewNewUser();" class="btn bg-olive btn-inline  addBtn" value="<spring:message code="addnew.label" />">
							</div>
					
					</c:if>
				</c:forEach>
				</div>
				
				
				
				
	<div  id="table-wrapper" style="overflow:auto">
	<table id="example1" class="table table-bordered table-striped" >
					<thead style="background-color: #3c8dbc; color: #ffffff">
						<tr>
						 <c:if test="${sessionScope.role == 'super admin'}"> 
						 	<th align="center"><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
						 </c:if>
						 <c:forEach var="accessControl" items="${sessionScope.userAccessControl}">
                         	<c:if test="${accessControl.appDocument == 'UserManagement' && accessControl.write == true}"> 
								<th align="center"><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
							</c:if>
						</c:forEach>
						<%-- <th><spring:message code="created.date.label" /></th> --%>
						 <th><div><spring:message code="EmployeeForm.code" /></div></th>
							<th><spring:message code="EmployeeForm.firstName" /></th>
							<%-- <th><spring:message code="EmployeeForm.lastName" /></th> --%>
							<th><spring:message code="EmployeeForm.email" /></th>
							<%-- <th><spring:message code="EmployeeForm.contactOffice" /></th> --%>
							<th style="width:130px;"><spring:message code="EmployeeForm.contactPersonnel" /></th>
							<th ><spring:message code="EmployeeForm.workLocation" /></th>
							<th><spring:message code="EmployeeForm.role" /></th>
							<%-- <th><spring:message code="EmployeeForm.memberStatus" /></th> --%>
							<th  style="width:85px"><spring:message code="EmployeeForm.action" /></th>
						</tr>
					</thead>
					<tbody style="text-align: center;">
						<c:forEach var="user" items="${userDetails}">
							<tr>
							 <c:if test="${sessionScope.role == 'super admin'}"> 
							 	 <c:if test="${user.role == 'super admin'}"> 
							 		<td><input type="checkbox" disabled="disabled" name="selectall" class="selectableCheckbox" id="selectall" value='${user.email}' /></td>
							 	</c:if>
							 	 <c:if test="${user.role != 'super admin'}"> 
							 	 	<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${user.email}' /></td>
							 	 </c:if>
							 </c:if>
							 <c:forEach var="accessControl" items="${sessionScope.userAccessControl}">
                         		<c:if test="${accessControl.appDocument == 'UserManagement' && accessControl.write == true}"> 
									<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${user.email}' /></td>
							    </c:if>
							 </c:forEach>
							<%--  <td>${user.employeeId}</td> --%>
							   <td>${user.employeeId}</td>
								<td>${user.firstName}</td>
								<%-- <td>${user.lastName}</td> --%>
								<td>${user.email}</td>
								<%-- <td>${user.contactOffice}</td> --%>
								<td>${user.contactPersonnel}</td>
								<td>${user.workLocation}</td>
								<td>${user.role}</td>
								<%-- <td>${user.accountStatus}</td> --%>
								<td>
								<a style="color: #2e7ea7 !important; cursor: pointer;" onclick="return viewEditUser('${user.email}','view')">View</a>&nbsp;&nbsp;&nbsp;
								 <c:if test="${sessionScope.role == 'super admin'}"> 
								 	<a style="color: #2e7ea7 !important; cursor: pointer;" onclick="return viewEditUser('${user.email}','edit')">Edit</a>
								 </c:if>
								 <c:forEach var="accessControl" items="${sessionScope.userAccessControl}">
                         			<c:if test="${accessControl.appDocument == 'UserManagement' && accessControl.write == true}"> 
										<a style="color: #2e7ea7 !important; cursor: pointer;" onclick="return viewEditUser('${user.email}','edit')">Edit</a>
									</c:if>
								</c:forEach>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			
</div>
 <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewUserDetails('${type}','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewUserDetails('${type}','${index - (maxRecords+1)}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewUserDetails('${type}','${index - (maxRecords+1)}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewUserDetails('${type}','${totalValue}')">
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
              		  <input type="button" onclick="viewUserDetails('${type}',document.getElementById('pagination').value)" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
				</div>
              	
              </div>

</div>
				</div>
				 
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
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
					"bPaginate" : false,
					"bLengthChange" : false,
					"bFilter" : false,
					"bSort" : false,
					"bInfo" : false,
					"bAutoWidth" : true
				});
			});
		</script>
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="user.label" />"/>
        <input type="hidden" id="err" value="${err}" />
        <input type="hidden" id="type" value="${type}" />
</body>
</html>