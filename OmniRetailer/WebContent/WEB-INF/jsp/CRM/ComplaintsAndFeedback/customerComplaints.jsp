<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Viswanath
 * file name		        : Inventory Manager/complaintsAndFeedback/CustomerComplaints.jsp
 * file type		        : JSP
 * description				: The CustomerComplaints form is displayed using this jsp
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
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/crm/customerComplaints.js"></script>
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

	border-radius: 5px;
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}

</style>     
<script type="text/javascript">
$(document).ready(function(){
	callCalender('from');
	callCalender('to');
	var sDate=$("#sd").val();
	var s=sDate.split(' ');
	$("#from").val(s[0]);

	var eDate=$("#ed").val();
	var e=eDate.split(' ');
	$("#to").val(e[0]);
	var err = $("#err").val();
	if(err != "")
	  alert(err);
	$("#searchComplaint").val($("#complaint").val());
	$("#searchComplaint").focus();
	$('#searchComplaint').on('input',function(e){
		if($(this).val().trim()==""){
			viewCustomerComplaints('','0');
		}
	});
});
</script>  
</head>
<body>
 <!-- Content Header (Page header) -->
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
  <div class="box box-primary">
       <div class="box-header">
           <h3 class="box-title"><spring:message code="customer.complaints.label" /></h3>
       </div><!-- /.box-header -->
       <input type="hidden" id="sd" value="${startDate}">
       <input type="hidden" id="ed" value="${endDate}">
       <div class="box-body table-responsive">
   					<div class="row">
				        <div class="col-lg-3">
			              
			                <%--  <div class="col-lg-4 col-xs-4 col-sm-2 col-md-2" style="text-align:left;top:5px;padding-right: 0px;">
			                   <label><spring:message code="location.label"/></label>
			                 </div> --%>
			            
			                  <label><spring:message code="location.label"/></label>
			                 <select class="form-control form-group" id="toLocation" onchange="searchCustomerComplaints('','','0')">
 		                           <option value=""><spring:message code="ALL.label"/></option> 
		                             <c:forEach var="location" items="${workLocationsList}">
<%-- 									<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}">${location}</option> --%>
								
							      <option value="${location}" ${location == selectedLocation ? 'selected' : ''}>${location}</option>
							     
								 </c:forEach>
                                        </select>
	
				        </div>
				        <div class="col-lg-4"></div>
				        <div class="col-lg-2">
			                	<%-- <div class="col-lg-4 col-xs-4 col-sm-2 col-md-2" style="text-align:right;top:5px;padding-right: 5px;">
			                 		<label><spring:message code="offer_start_date.label"/></label>
				                 </div> --%>
			                	
			                	 		<label><spring:message code="offer_start_date.label"/></label>
			                	 	<input class="form-control calendar_icon form-group" readonly="readonly" value="" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
			                	 
				              </div>
				            
				            <div class="col-lg-2">
				               
				                 <%-- <div class="col-lg-4 col-xs-4 col-sm-2 col-md-2" style="text-align:right;top:5px;padding-right: 5px;">
				                   <label><spring:message code="offer_end_date.label"/></label>
				                 </div> --%>
				               
				                 	  <label><spring:message code="offer_end_date.label"/></label>
				                 	<input class="form-control calendar_icon form-group" readonly="readonly" value="" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
			                	 
					          </div>
				           <div class="col-lg-1" style="margin-top:16px">
				                <input type="button" style="padding: 4px 8px;float: right;" class="btn bg-olive btn-inline" onclick="searchCustomerComplaints('','','0')" value="<spring:message code="search" />" />
				           </div>
				</div>
				<div class="row">
			      <div class="col-lg-1 col-xs-2" style="margin-top: 10px;">
		                <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="searchCustomerComplaints('','','0');">
		               		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
		               		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
		               		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
		              		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
		               	</select>
		           </div>
			        <div class="col-lg-10 col-xs-10" style="margin-top: 10px;">
		       	 		 <input type="text"  class="form-control searchItems" value="" id="searchComplaint" placeholder="<spring:message code="search.complaint.label" />" style="text-align: center;height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"  />
						<div class="services">
			    			<div class="items">
			     				<ul class="matchedStringUl customerComplaints" style=""></ul>
			   				</div>
						</div>
						<input type="hidden" id="complaint" value="${searchName}">
		       	 	</div>
			       <div class="col-lg-1" style="">
					  <div class="buttons" style="margin-top: 10px;">
			        	<c:if test="${sessionScope.role == 'super admin'}">
			        		<a onclick="return newCustomerComplaints();" class="btn bg-olive btn-inline  addBtn"><font size="2px"><spring:message code="addnew.label" /></font></a>
			      		</c:if>
				           <c:forEach var="accessControl" items="${sessionScope.crm}">
				                <c:if test="${accessControl.appDocument == 'CustomerComplaints' && accessControl.write == true}"> 
									<a onclick="return newCustomerComplaints();" class="btn bg-olive btn-inline  addBtn"><font size="2px"><spring:message code="addnew.label" /></font></a>
								</c:if>
						 </c:forEach>
				 	 </div>
		           </div>
		       </div>
                                    <table id="example1" class="table table-bordered table-striped" style="">
                                        <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                                <th><spring:message code="complaint.id.label" /></th>
                                                <th><spring:message code="customer.name.label" /></th>
                                                <th><spring:message code="complaint.date.label" /></th>
                                                <th><spring:message code="complaint.type.label" /></th>
                                                <th><spring:message code="complaint.status.label" /></th>
                                                <th><spring:message code="EmployeeForm.action" /></th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                           <c:forEach var="complaints" items="${customerComplaints}">
                                            <tr>
                                                <td>${complaints.complaintID}</td>
                                                <td>${complaints.customerName}</td>
                                                <td>${complaints.dateTimeStr}</td>
                                                <td>${complaints.complaintType}</td>
                                                <td>${complaints.complaintStatus}</td>
                                                <td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditCustomerComplaints('${complaints.complaintID}','view')">View</a>&nbsp;&nbsp;&nbsp;
                                                 <c:if test="${sessionScope.role == 'super admin'}"> 
                                                 	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditCustomerComplaints('${complaints.complaintID}','edit')">Edit</a>
                                                 </c:if>
                                                <c:forEach var="accessControl" items="${sessionScope.crm}">
    												<c:if test="${accessControl.appDocument == 'CustomerComplaints' && accessControl.write == true}"> 
                                                		<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditCustomerComplaints('${complaints.complaintID}','edit')">Edit</a>
                                                	</c:if>
                                                </c:forEach> 
                                                </td>
                							</tr>
                                            </c:forEach> 
                                        </tbody>
                                    </table>
                         
                           
                <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewCustomerComplaints('customerComplaints','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewCustomerComplaints('customerComplaints','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewCustomerComplaints('customerComplaints','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewCustomerComplaints('customerComplaints','${totalValue}')">
              	</div> 
              	</c:if>
              </div>
           </div>
           </div><!-- /.box-body -->
       </div><!-- /.box -->
  
</div>
</section><!-- /.content -->
		<script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
		<!-- DATA TABES SCRIPT -->
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
       
         <input type="hidden" id="err" value="${err}" />
         
</body>
</html>