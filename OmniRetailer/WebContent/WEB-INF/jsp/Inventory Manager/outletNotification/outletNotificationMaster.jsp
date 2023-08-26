<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/master/departmentMaster.jsp
 * file type		        : JSP
 * description				: The department details table is displayed using this jsp
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
        	 <%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css"> --%>
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
         <script type="text/javascript" src="${pageContext.request.contextPath}/js/outletNotification.js"></script>
         <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
	/* margin-right: 1%; */
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

</style> 
<script type="text/javascript">
$(document).ready(function(){
var err = $("#err").val();
if(err != "")
  alert(err);
});
</script>        
</head>
<body>
 <!-- Content Header (Page header) -->
<%-- <section class="content-header">
   <h1>
     <spring:message code="masters.label" />
     <small><spring:message code="sku.master.label" /></small>
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
                      <div class="box-body table-responsive">
                          <div class="row">
	                          <div class="form-group col-lg-12" align="center">
		                			<label style="font-size: 20px;"><spring:message code="all.notifications.label" /></label>
		                     </div>
		                     
		                     
		                     
		                      <!--added by manasa  -->
		                     
		                       <div class="col-lg-1 col-xs-2" style="margin-top:-18px">
				                      <label>Show</label> 
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewOutletNotifications('outletNotifications','0')">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
                    
		                      <!--/..added by manasa  -->
		               <c:if test="${sessionScope.role == 'super admin'}"> 
		                <div class="col-lg-1" style="padding-left: 0px;float: right;">
								                <input type="button"  class="btn bg-olive btn-inline addBtn " onclick="return newOutletNotification('outletNotifications');" value="<spring:message code="addnew.label" />">
								           </div>
								           
								           
								           
								           
								           
								           
		               		<%-- <div class="buttons" style="margin-bottom: 7px;">
							        <a onclick="return newOutletNotification('outletNotifications');" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp;
							        <a onclick="return validate('sku');" class="button"><font size="2px"><spring:message code="delete.label" /></font></a>
							</div> --%>
		               </c:if>
                     <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
                          <c:if test="${accessControl.appDocument == 'OutletNotifications' && accessControl.write == true}"> 
							 <div class="col-lg-1" style="padding-left: 0px;float: right;">
								                <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return newOutletNotification('outletNotifications');" value="<spring:message code="addnew.label" />">
								           </div>
						 </c:if>
					</c:forEach>
                          <table id="example1" class="table table-bordered table-striped" style="margin-left: 7px; width: 98.2%;">
                              <thead style="background-color: #3c8dbc; color: #ffffff">
                             <tr>
                            <%--   <c:if test="${sessionScope.role == 'super admin'}"> 
                              	<th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                              </c:if>
                              <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
                          		<c:if test="${accessControl.appDocument == 'CounterMaster' && accessControl.write == true}"> 
                             		<th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                             	</c:if>
                             </c:forEach> --%>
                                 <th><spring:message code="notification.id.label" /></th>
                                 <th><spring:message code="date.and.time.label" /></th>
                                 <th><spring:message code="notification.type.label" /></th>
                                 <th><spring:message code="EmployeeForm.action" /></th>
                             </tr>
                         </thead>
                         <tbody style="text-align: center;">
                         
                          <c:forEach var="message" items="${messageBoardList}">
                             <tr>
                             <%--  <c:if test="${sessionScope.role == 'super admin'}"> 
                              	<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${sku.skuId}' /></td>
                              </c:if>
                            <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
                          		<c:if test="${accessControl.appDocument == 'CounterMaster' && accessControl.write == true}"> 
                             		<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${sku.skuId}' /></td>
                             	</c:if>
                            </c:forEach> --%>
                                 <td>${message.messageId}</td>
                                 <td>${message.strDate}</td>
                                 <td>${message.messageType}</td>
                                 <td>
                                 <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditNotification('${message.messageId}','view')">View</a>&nbsp;&nbsp;&nbsp;
                                  <%-- <c:if test="${sessionScope.role == 'super admin'}"> 
                                  	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditNotification('${message.messageId}','edit')">Edit</a>
                                  </c:if>
                                   <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
                         			 <c:if test="${accessControl.appDocument == 'CounterMaster' && accessControl.write == true}"> 
                                 		<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditNotification('${message.messageId}','edit')">Edit</a>
                                 	</c:if>
                                 </c:forEach> --%>
                                 </td> 
 							</tr>
                             </c:forEach>
                         </tbody>
                     </table>
                     </div>
                       <br>
                <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewOutletNotifications('outletNotifications','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewOutletNotifications('outletNotifications','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewOutletNotifications('outletNotifications','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewOutletNotifications('outletNotifications','${totalValue}')">
              	</div> 
              	</c:if>
              	
              	<div class="col-lg-6" style="float:right;">
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
              		  <input type="button" onclick="viewOutletNotifications('outletNotifications',document.getElementById('pagination').value)" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             
				</div>
              </div> 
 <!--/..modified by manasa  -->
              	
              	
              	
              	
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
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="sku.label" />"/>
           <input type="hidden" id="err" value="${err}" />
</body>
</html>