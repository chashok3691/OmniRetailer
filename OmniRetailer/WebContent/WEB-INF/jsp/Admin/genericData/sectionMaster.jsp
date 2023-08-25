<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : admin/genericData/taxMaster.jsp
 * file type		        : JSP
 * description				: The tax details table is displayed using this jsp
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
     <%--    <script type="text/javascript" src="${pageContext.request.contextPath}/js/productMaster.js"></script> --%>
<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
	margin:3px 0px 2px;
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
table{
margin-left:1%;
}
</style>     
<script type="text/javascript">
$(document).ready(function(){
var err = $("#err").val();
if(err != "")
  alert(err);
$("#searchSection").val($("#section").val());
//if($("#searchTax").val().trim()!="")
	$("#searchSection").focus();
});
</script>  
</head>
<body>
 <!-- Content Header (Page header) -->
<%-- <section class="content-header">
   <h1>
     <spring:message code="generic.data.label" />
     <small><spring:message code="tax.master.label" /></small>
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
                  <div class="box-header">
                      <h3 class="box-title"><spring:message code="all.sections.label" /></h3>
                  </div><!-- /.box-header -->
                  <div class="box-body table-responsive">
                   <div class="row">
                	<%-- <div class="form-group col-lg-4">
                			<label style="font-size: 20px;"><spring:message code="all.section.label" /></label>
                     </div> --%>
                      	<div id="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${err}</div>
                     <div class="form-group col-lg-10" style="    margin-bottom: 2px;">
	        	 		 <input type="text"  class="form-control searchItems" style="margin-top: 0px;    width: 100%;height:30PX;text-align: center;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" value="" id="searchSection" placeholder="<spring:message code="search.section.label" />" />
							<div class="services">
				    			<div class="items">
				     				<ul class="matchedStringUl sectionMaster" style=""></ul>
				   				</div>
							</div>
							<input type="hidden" id="section" value="${searchName}">
	        	 	</div>
                                 <c:if test="${sessionScope.role == 'super admin'}"> 
                                 <div class="form-group col-lg-2" style="margin-bottom: -32px;;">   
										<div class="form-group col-lg-6"style="padding:0px;padding-right: 6px;">
			  				               <a onclick="return newSection();" class="btn bg-olive btn-inline addBtn"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp;
			   			                  </div> 
			   			                  <div class="form-group col-lg-6"style="padding:0px;padding-left: 6px;">
			   			                   <a onclick="return validate('section');" class="btn bg-olive btn-inline addBtn"><font size="2px"><spring:message code="delete.label" /></font></a>
										</div>
										</div>
                                 </c:if>
                               <div class="form-group col-lg-2" style="margin-bottom: -32px;;">   
                                 <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
    								<c:if test="${accessControl.appDocument == 'TaxMaster' && accessControl.write == true}"> 
	                                    
										
										  <div class="form-group col-lg-6"style="padding:0px;padding-right: 6px;">
			  				               <a onclick="return newSection();" class="btn bg-olive btn-inline addBtn"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp;
			   			                  </div> 
			   			                  <div class="form-group col-lg-6"style="padding:0px;padding-left: 6px;">
			   			                   <a onclick="return validate('section');" class="btn bg-olive btn-inline addBtn"><font size="2px"><spring:message code="delete.label" /></font></a>
										</div>
										
									 </c:if>
									 
								</c:forEach>
								
								
								</div>
                                    <table id="example1" class="table table-bordered table-striped" style=" width: 98%;">
                                        <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                             <c:if test="${sessionScope.role == 'super admin'}"> 
                                             	<th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                                             </c:if>
                                            <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
    											<c:if test="${accessControl.appDocument == 'TaxMaster' && accessControl.write == true}"> 
                                            		<th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                                            	</c:if>
                                            </c:forEach>
                                            	<th><spring:message code="sl.no.label" /></th>
                                                <th><spring:message code="section.id.label" /></th>
                                                <th><spring:message code="section.name.label" /></th>
                                                <th><spring:message code="meal.type.label" /></th>
                                                <th><spring:message code="course.type.label" /></th>
                                                <th><spring:message code="status.label" /></th>
                                                <th><spring:message code="EmployeeForm.action" /></th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                           <c:forEach var="section" items="${sectionDetailsList}">
                                            <tr>
                                             <c:if test="${sessionScope.role == 'super admin'}"> 
                                             	<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${section.sectionId}' /></td>
                                             </c:if>
                                            <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
    											<c:if test="${accessControl.appDocument == 'TaxMaster' && accessControl.write == true}"> 
                                            		<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${section.sectionId}' /></td>
                                            	</c:if>
                                            </c:forEach>
                                            	 <td>${section.slNo}</td>
                                                <td>${section.sectionId}</td>
                                                <td>${section.sectionName}</td>
                                                <td>${section.mealType}</td>
                                                <td>${section.courseType}</td>
                                                <td>${section.status}</td>
                                                <td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditSection('${section.sectionId}','view')">View</a>&nbsp;&nbsp;&nbsp;
                                                 <c:if test="${sessionScope.role == 'super admin'}"> 
                                                 	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditSection('${section.sectionId}','edit')">Edit</a>
                                                 </c:if>
                                                <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
    												<c:if test="${accessControl.appDocument == 'TaxMaster' && accessControl.write == true}"> 
                                                		<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditSection('${section.sectionId}','edit')">Edit</a>
                                                	</c:if>
                                                </c:forEach> 
                                                </td>
                							</tr>
                                            </c:forEach> 
                                        </tbody>
                                    </table>
                           </div>
                           
                <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewSectionMaster('sectionMaster','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewSectionMaster('sectionMaster','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewSectionMaster('sectionMaster','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewSectionMaster('sectionMaster','${totalValue}')">
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
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="tax.label" />"/>
         <input type="hidden" id="err" value="${err}" />
</body>
</html>