<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Manasa
 * file name		        : Inventory Manager/DaysOpen/viewDaysOpen.jsp
 * file type		        : JSP
 * description				: The dayopen details table is displayed using this jsp
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
       <script type="text/javascript" src="${pageContext.request.contextPath}/js/dayopen.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        
       
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
  
  
$("#searchDepartmentMaster").val($("#departmentSearch").val());
$("#searchDepartmentMaster").focus();
$('#searchDepartmentMaster').on('input',function(e){
	if($(this).val().trim()==""){
		viewoutletdaysOpen('daysOpen','daysOpen','0','menu')
	}
});
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
		                			<label style="font-size: 20px;"><spring:message code="day.open.label" /></label>
		                     </div>
		              
		               
		               
		               
		               <div class="col-lg-11">
		        	 		 <input type="text"  class="form-control searchItems searchBar"  value="" id="searchDepartmentMaster" placeholder="<spring:message code="search.day.open" />" />
								<div class="services">
					    			<div class="items">
					     				<ul class="matchedStringUl departmentMaster" style=""></ul>
					   				</div>
								</div>
								<input type="hidden" id="departmentSearch" value="${searchName}">
		        	 	</div>
		               
		               
		               
		               <input type="hidden" id="type" value="${type}">
		               
                     <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
                          <c:if test="${accessControl.appDocument == 'DaysOpen' && accessControl.write == true}"> 
					
							 <div class="col-lg-1" style="padding-left: 0px;float: right;">
								                <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return newdaysOpen('daysOpen');" value="<spring:message code="addnew.label" />">
								           </div>
								           
								         
						 </c:if>
					</c:forEach>
					 <c:if test="${sessionScope.role == 'super admin'}"> 
		            <div class="col-lg-1" style="padding-left: 0px;float: right;">
								                <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return newdaysOpen('daysOpen');" value="<spring:message code="addnew.label" />">
								           </div>
		              
		               </c:if>
                          <table id="example1" class="table table-bordered table-striped" style="margin-left: 17px; width: 97.6%;">
                              <thead style="background-color: #3c8dbc; color: #ffffff">
                             <tr>
                            
                              <th><div><spring:message code="sl.no.label" /></div></th>
                                 <th><spring:message code="location.label" /></th>
                                 <th><spring:message code="business.counter.label" /></th>
                                 <th><spring:message code="created.date.label" /></th>
                                
                                 <th><spring:message code="updated.date.label" /></th>
                                  <th><spring:message code="action.label" /> </th>
                             </tr>
                         </thead>
                         <tbody style="text-align: center;">
                         
                          <c:forEach  var="itemList" items="${outletdayopenResponse}"  varStatus="theCount">
                            
                          
                            <tr id='dynamicdiv${theCount.count}' style='margin-top:5px;'>
                            
    	                    	<td class='slno'>${theCount.count}</td>
    	                    	<td id='location${theCount.count}'>${itemList.outletLocation}</td>
	  	 						<td id='businessCounter${theCount.count}'>${itemList.businessCounter}</td>
                               <td id='createdDateStr${theCount.count}'>${itemList.createdDateStr}</td>
                               <td id='updatedDateStr${theCount.count}'>${itemList.updatedDateStr}</td>
                                 <td>
                                 <%--  <c:forEach  var="composite" items="${outletdayopenRe"  varStatus="theCount"> --%>
                                 <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditDayOpen('${itemList.businessCounter}','${itemList.outletLocation}','','view')">View</a>&nbsp;&nbsp;&nbsp;
                                  <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditDayOpen('${itemList.businessCounter}','${itemList.outletLocation}','','edit')">Edit</a>&nbsp;&nbsp;&nbsp;
                                 <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return deleteDayOpen('${itemList.businessCounter}','${itemList.outletLocation}')">Delete</a>&nbsp;&nbsp;&nbsp;
                                  <%-- <c:if test="${sessionScope.role == 'super admin'}"> 
                                  	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditNotification('${message.messageId}','edit')">Edit</a>
                                  </c:if>
                                   <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
                         			 <c:if test="${accessControl.appDocument == 'CounterMaster' && accessControl.write == true}"> 
                                 		<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditNotification('${message.messageId}','edit')">Edit</a>
                                 	</c:if>
                                 </c:forEach> --%>
                                 
                                   <input type="hidden"  id="outletLocation" value="${itemList.outletLocation}" >
                            <input type="hidden"  id="businessCounter" value="${itemList.businessCounter}" >
                                 </td> 
 							</tr>
                             </c:forEach>
                         </tbody>
                     </table>
                     </div>
                       <br>
                <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="searchDaysOpen('','','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return searchDaysOpen('','','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return searchDaysOpen('','','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="searchDaysOpen('','','${totalValue}')">
              	</div> 
              	</c:if>
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