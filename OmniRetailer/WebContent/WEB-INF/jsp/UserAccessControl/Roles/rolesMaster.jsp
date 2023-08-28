<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : admin/genericData/currencyMaster.jsp
 * file type		        : JSP
 * description				: The currency details table is displayed using this jsp
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
   <%--      <script src="${pageContext.request.contextPath}/js/controller.js"></script> --%>
        <script src="${pageContext.request.contextPath}/js/userAccessControl/role.js"></script>
<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
	margin-right: 2%;
/* 	margin-top:1%; */
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
	var result = $("#right-side").height();
	//$("#main-menu").css("height",result+"px");
	var err = $("#err").val();
	
	$("#searchRoles").val($("#bill").val());
	$("#searchRoles").focus();  
	
	$('#searchRoles').on('input',function(e){
		if($(this).val().trim()==""){
			viewRolesMaster('role','0');
		}
	}); 
	
	
 $('#mySearch').click(function(){
	        var search = $('#searchRoles').val();
	        return viewRolesMaster('role','0');
	    })
	    $('#searchRoles').keypress(function(e){
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
   <h1><spring:message code="roles.label" />
     <small><spring:message code="new.role.header" /></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('admin');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><spring:message code="roles.label" /></li>
       </ol>
 </section> --%>

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
  <div class="box box-primary">
               <div class="box-header">
                   <h3 class="box-title"><spring:message code="allRoles.label" /></h3>
               </div><!-- /.box-header -->
                      <div class="box-body table-responsive">
                       <div class="row">
                         <div class="col-lg-1 col-xs-2">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewRolesMaster('role','0');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
                       
<!--                       <div class="col-lg-9" style=""></div> -->
                    <div class="col-lg-9 col-xs-10 " style="margin-left: -17px; margin-right: 14px;">
				                     <div class="wrapper">
				                      	 <input type="text"  class="form-control" style="" value="" id="searchRoles" placeholder="Search by Role Name,Role Description and Created By" />
											<button id="mySearch" class="searchbutton"></button>
											<!-- <div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl searchBills" style=""></ul>
								   				</div>
											</div> -->
										<input type="hidden" id="bill" value="${searchName}">
				                    </div></div>
                    
                    
                       <c:if test="${sessionScope.role == 'super admin'}"> 
                       		  <div class="col-lg-1" style="padding-left: 0px;margin-bottom: -25px;">
	      							<a onclick="return newRole('role');" class="btn bg-olive btn-inline  addBtn"><spring:message code="addnew.label" /></a>&nbsp;&nbsp;&nbsp;
	          						</div>
	          						 <div class="col-lg-1" style="padding-left: 0px;margin-bottom: -25px;">
	          						<a onclick="return validate('role');" class="btn bg-olive btn-inline  addBtn"><spring:message code="delete.label" /></a>
							</div>
                       </c:if>
                         <c:forEach var="accessControl" items="${sessionScope.userAccessControl}">
                            	<c:if test="${accessControl.appDocument == 'RolesManagement' && accessControl.write == true}"> 
		                            <div class="col-lg-1" style="padding-left: 0px;margin-bottom: -25px;">
		      							<a onclick="return newRole('role');" class="btn bg-olive btn-inline addBtn"><spring:message code="addnew.label" /></a>&nbsp;&nbsp;&nbsp;
		          						</div>
		          						 <div class="col-lg-1" style="padding-left: 0px;margin-bottom: -25px;">
		          						<a onclick="return validate('role');" class="btn bg-olive btn-inline addBtn"><spring:message code="delete.label" /></a>
									 </div>
								</c:if>
							</c:forEach>
							</div>
                      	 <table id="example1" class="table table-bordered table-striped">
                              <thead style="background-color: #3c8dbc; color: #ffffff">
                           <tr>
                            <c:if test="${sessionScope.role == 'super admin'}"> 
                            	<th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAllroles(this)'></th>
                            </c:if>
                           	<c:forEach var="accessControl" items="${sessionScope.userAccessControl}">
                            	<c:if test="${accessControl.appDocument == 'RolesManagement' && accessControl.write == true}"> 
                           			<th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAllroles(this)'></th>
                           		</c:if>
                           	</c:forEach>
                           	   <th><spring:message code="sl.no.label" /></th>
                               <th><spring:message code="created.date.label" /></th>
                               <th><spring:message code="role.name.label" /></th>
                               <th><spring:message code="created.by.label" /></th>
                               <th><div style="min-width: 100px;"><spring:message code="role.description" /></div></th>
                               <th><spring:message code="status.label" /></th>
                               <th><spring:message code="EmployeeForm.action" /></th>
                           </tr>
                       </thead>
                       <tbody style="text-align: center;">
                       	<c:forEach var="role" items="${roleList}" varStatus="theCount">
                           <tr>
                            <c:if test="${sessionScope.role == 'super admin'}">
                            	<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${role.roleName}' /></td> 
                            </c:if>
                           <c:forEach var="accessControl" items="${sessionScope.userAccessControl}">
                            	<c:if test="${accessControl.appDocument == 'RolesManagement' && accessControl.write == true}"> 
                           			<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${role.roleName}' /></td>
                           		</c:if>
                           	</c:forEach>
                           	  <td>${theCount.count + index -1}</td>
                           	    <td>${role.createdDateStr}</td>
                               <td>${role.roleName}</td>
                               <td>${role.createdBy}</td>
                               <td>${role.roleDescription}</td>
                               <td>${role.roleStatus}</td>
                               <td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewRole('${role.roleName}')">View</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                <c:if test="${sessionScope.role == 'super admin'}">
                                	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditRole('${role.roleName}')">Edit</a>
                                </c:if>
                               <c:forEach var="accessControl" items="${sessionScope.userAccessControl}">
                            	<c:if test="${accessControl.appDocument == 'RolesManagement' && accessControl.write == true}"> 
                               		<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditRole('${role.roleName}')">Edit</a>
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
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewRolesMaster('role','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-2" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewRolesMaster('role','${index - (maxRecords+1)}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewRolesMaster('role','${index - (maxRecords+1)}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewRolesMaster('role','${totalValue}')">
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
              		  <input type="button" onclick="viewRolesMaster('role',document.getElementById('pagination').value)" class="btn bg-olive btn-inline  addBtn" value="GO">
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
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="role.label" />"/>
        <input type="hidden" id="err" value="${err}" />
</body>
</html>