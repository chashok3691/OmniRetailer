<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Vasudeva Reddy.G
 * file name		        : Inventory Manager/master/organizationdepartmentMaster.jsp
 * file type		        : JSP
 * description				: The organization department details table is displayed using this jsp.
 * Reviewed by				: Surya
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
         <script type="text/javascript" src="${pageContext.request.contextPath}/js/masterDataManagement/genericMasters/organizationdepartmentMaster.js"></script>
         <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
         <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
<style type="text/css">
.buttons {
	float: right;
	/js/masterDataManagement/genericMasters/organizationdepartmentMaster.js
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

.searchbutton
{
    margin-right: 15px;
}
</style> 
<script type="text/javascript">
$(document).ready(function(){
	$('#mySearch').click(function(){
	      var search = $('#searchOrganizationDepartment').val();
	      return searchOrganizationDepartmentMaster(search,'','0');
	  })
	   $('#searchDepartment').keyup(function(e){
	  	 
	      if(e.which == 13){//Enter key pressed
	          $('#mySearch').click();//Trigger search button click event
	      }
	       else if(e.which == 8){ //backspace key pressed
	      	 if($('#searchDepartment').val()=="")
	      	 $('#mySearch').click();//Trigger search 
	      }
	     });

	
	
	
	
});
</script>        
</head>
<body>
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
  <div class="box box-primary">
		<div class="box-header" align="center">
                <h3 class="box-title"><spring:message code="allorganizationdepartment.label" /></h3>
            </div><!-- /.box-header -->
                  <div class="box-body table-responsive">
                      <div class="row">
                        <div class="col-lg-1 col-xs-1">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewOrganizationDepartmentMaster('organizationdepartmentMaster','0')">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
                      
                       <div class="col-lg-10">
		        	 		 <%-- <input type="text"  class="form-control searchItems searchBar"  value="" id="searchDepartmentMaster" placeholder="<spring:message code="search.department.label" />" />
								<div class="services">
					    			<div class="items">
					     				<ul class="matchedStringUl departmentMaster" style=""></ul>
					   				</div>
								</div> --%>
								
								<input type="text"  class="form-control" value="${searchName}" id="searchOrganizationDepartment" placeholder="<spring:message code="search.orgdepartment.label" />" />
                     <button id="mySearch" class="searchbutton"></button>
							<input type="hidden" id="searchName" value="${searchName}">
							
							
								<input type="hidden" id="departmentSearch" value="${searchName}">
		        	 	</div>
		               <c:if test="${sessionScope.role == 'super admin'}"> 
		                <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return newOrganizationDepartmentMaster();" value="<spring:message code="addnew.label" />">
								           </div>
		               	
		               </c:if>
                     <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                          <c:if test="${accessControl.appDocument == 'Departments' && accessControl.write == true}"> 
							<div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return newOrganizationDepartmentMaster();" value="<spring:message code="addnew.label" />">
								           </div>
						 </c:if>
					</c:forEach>
					
					</div>
                          <table id="example1" class="table table-bordered table-striped" style="">
                              <thead style="background-color: red; color: gray">
                             <tr>
                             	<th><div style=""><spring:message code="sl.no.label" /></div></th>
                                    <th><spring:message code="organizationdepartment.id.label" /></th>
                                 <th><spring:message code="organizationdepartment.name.label" /></th>
                                 <th><spring:message code="organizationdepartment.description.label" /></th>
                                 <th><spring:message code="organizationdepartment.parentdepartment.label" /></th>
                                  <th><spring:message code="EmployeeForm.action" /></th>
                             </tr>
                         </thead>
                         <tbody style="text-align: center;">
                         
                          <c:forEach var="orgdept" items="${orgdepartmentList}">
                             <tr>
                           	<td>${orgdept.slNo}</td>
                                 <td>${orgdept.deptId}</td>
                                 <td>${orgdept.deptName}</td>
                                 <td>${orgdept.deptDescription}</td>
                                 <td>${ orgdept.parentDept}</td>
                                 
                                 <td>
                                 <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditOrganizationDepartment('${orgdept.deptId}','view')">View</a>&nbsp;&nbsp;&nbsp;
                                  <c:if test="${sessionScope.role == 'super admin'}"> 
                                  	
                                  </c:if>
                                   <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                         			 <c:if test="${accessControl.appDocument == 'Departments' && accessControl.write == true}"> 
                                 		<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditOrganizationDepartment('${orgdept.deptId}','edit')">Edit</a>
                                 	</c:if>
                                 </c:forEach>
                                 </td> 
 							</tr>
                             </c:forEach>
                         </tbody>
                     </table>             
                   <div class="row">
        
              	<c:if test="${index-1 == 0 && totalRecords > maxRecords}">
              		<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${index + maxRecords-1} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewOrganizationDepartmentMaster('organizationdepartmentMaster','${index+maxRecords-1}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick="viewOrganizationDepartmentMaster('organizationdepartmentMaster','${index - maxRecords-1}');"> ${index} - ${totalValue} of ${totalRecords}
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="viewOrganizationDepartmentMaster('organizationdepartmentMaster','${index - maxRecords-1}');"> ${index} - ${index+maxRecords-1} of ${totalRecords}
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewOrganizationDepartmentMaster('organizationdepartmentMaster','${index+maxRecords-1}')">
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
              		  <input type="button" onclick="viewOrganizationDepartmentMaster('organizationdepartmentMaster',document.getElementById('pagination').value)" class="btn bg-olive btn-inline  addBtn" value="GO">
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
        <input type="hidden" id="deleteActionLabel" value="<spring:message code = "sku.label" />"/>
           <input type="hidden" id="err" value="${err}" />
</body>
</html>