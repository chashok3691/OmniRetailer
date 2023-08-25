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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/storeTaxation.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
<style type="text/css">
@media only screen and (max-width:767px){
.table-responsive{
 overflow:hidden;
}
}
@media only screen and (max-width:768px)  {

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
	padding-top: 2px;
	 margin-right: 3px;
	/*margin-top:1%; */
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
$("#searchWHTaxation").val($("#storeTax").val());
//if($("#searchTax").val().trim()!="")
	$("#searchWHTaxation").focus();
	
	$('#searchWHTaxation').on('input',function(e){
		if($(this).val().trim()==""){
			viewWarehouseTaxation('taxation','0','');
		}
	});
	
	
	//added by manasa
	$('#mySearch').click(function(){
	    var search = $('#searchWHTaxation').val();
	    return searchWHTaxationMaster(search,'','0');
	})
	$('#searchWHTaxation').keypress(function(e){
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
                  <div class="box-header" align="center">
                            <h3 class="box-title"><spring:message code="allTaxation.label" /></h3>
                        </div><!-- /.box-header -->
                  <div class="box-body table-responsive">
                  <div class="row">
                       	<!-- <div class="col-lg-3"></div> -->
                       		<div class="col-lg-6">
	                       <%--   <div class="col-lg-4 col-xs-4" style="text-align:right;top:5px;padding-right: 0px;">
	                           <label><spring:message code="EmployeeForm.location"/></label>
	                         </div> --%>
	                         <div class="col-lg-5 col-xs-5" style="padding-left: 0px">
	                          <label><spring:message code="EmployeeForm.location"/></label>
	                           <select class="form-control" id="location" onchange="return viewWarehouseTaxation('taxation','0',this.options[this.selectedIndex].value);">
	                           			<option value=""><spring:message code="ALL.label"/></option>
			                         <c:forEach var="location" items="${workLocationsList}">
									<c:choose>
						             <c:when test="${location.description == ''}">
							          <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
							         </c:when>
							         <c:otherwise>
							         <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}-${location.description}</option>
							         </c:otherwise>
							</c:choose>
									<%-- 	<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}">${location}</option> --%>
									 </c:forEach>
                                </select>
	                           </div>
	                          </div>
	                          <div class="col-lg-3"></div>
	                      </div>
	                      <br>
                	<div class="row">
	                    
	                    <input type="hidden" id="taxLocation" value="${selectedLocation}">
	                     <%-- <input type="hidden" id="searchWHTaxation" value="${searchName}"> --%>
	                       <!--modified by manasa  -->
	                       
	                        <div class="col-lg-1 col-xs-2" style="margin-top:-18px">
				                      <label>Show</label> 
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewWarehouseTaxation('taxation','0','');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
	                       
				                       <div class="col-lg-9 col-xs-8" style="">
                      <div class="wrapper">	 
                      <input type="text"  class="form-control" style="" value="" id="searchWHTaxation" placeholder="<spring:message code="search.taxation.label" />"/>
							<button id="mySearch" class="searchbutton"></button>
							<!-- <div class="services">
				    			<div class="items">
				     				<ul class="matchedStringUl searchStocks" style=""></ul>
				   				</div>
							</div> -->
							</div>
						<input type="hidden" id="storeTax" value="${searchName}">
                    </div>
	                    
	                    
	                    
	                     <%--   <div class="col-lg-11">
	                      	 <input type="text"  class="form-control searchItems searchBar"  value="" id="searchWHTaxation" placeholder="<spring:message code="search.taxation.label" />"style="" />
								<div class="services">
					    			<div class="items">
					     				<ul class="matchedStringUl storeTaxationMaster" style=""></ul>
					   				</div>
								</div>
							<input type="hidden" id="storeTax" value="${searchName}">
	                      </div> --%>
		                    
		                     <c:if test="${sessionScope.role == 'super admin'}"> 
		                    <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return newWarehouseTax();" value="<spring:message code="addnew.label" />">
								           </div>
		                    
		                    
		                    	<%-- <div class="col-lg-1" style="padding-left: 0px;">
									<div class="buttons" style="padding-left: 0px;">
		  				               <a onclick="return newStoreTax();" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>
									 </div>
								</div> --%>
		                    </c:if>
		                      <c:forEach var="accessControl" items="${sessionScope.warehouseManagement}">
                             	<c:if test="${accessControl.appDocument == 'WhTaxation' && accessControl.write == true && accessControl.read == true}">
                                 <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return newWarehouseTax();" value="<spring:message code="addnew.label" />">
								           </div>
								            <div class="col-lg-1" style="padding-left: 0px;">
		  				             <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return validateWarehouseTaxation('Whtaxation');" value="Delete">
								</div> 
		                    
								</c:if>
								</c:forEach>
							</div>
                                    <table id="example1" class="table table-bordered table-striped" style="">
                                        <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            <c:if test="${sessionScope.role == 'super admin'}"> 
                                             	<th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                                             </c:if>
                                            <c:forEach var="accessControl" items="${sessionScope.warehouseManagement}">
    											<c:if test="${accessControl.appDocument == 'WhTaxation' && accessControl.write == true}"> 
                                            		<th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                                            	</c:if>
                                            </c:forEach> 
                                            	<th><spring:message code="s.no.label" /></th>
                                                <th><spring:message code="tax.category.label" /></th>
                                                <th><spring:message code="taxname.label" /></th>
                                                <th><spring:message code="taxtype.label" /></th>
                                                <th><spring:message code="taxrate.label" /></th>
                                                <th><spring:message code="start.date.label" /></th>
                                                <th><spring:message code="status.label" /></th>
                                                <th><spring:message code="EmployeeForm.action" /></th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                           <c:forEach var="storeTax" items="${storeTaxationList}" varStatus="theCount">
                                            <tr>
                                              <c:if test="${sessionScope.role == 'super admin'}"> 
                                             	<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${storeTax.taxCode}' /></td>
                                             </c:if>
                                            <c:forEach var="accessControl" items="${sessionScope.warehouseManagement}">
    											<c:if test="${accessControl.appDocument == 'WhTaxation' && accessControl.write == true}"> 
                                            		<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${storeTax.taxCode}' /></td>
                                            	</c:if>
                                            </c:forEach> 
                                          	    <td>${storeTax.slNo}</td>
                                                <td>${storeTax.taxCategoryName}</td>
                                                <td>${storeTax.taxName}</td>
                                                <td>${storeTax.taxType}</td>
                                                <td>${storeTax.taxRate}</td>
                                                <td>${storeTax.effectiveFromStr}</td>
                                                <td>${storeTax.status}</td>
                                                <td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditWHTax('${storeTax.taxName}','${storeTax.location}','${storeTax.taxCategoryName}','view')">View</a>&nbsp;&nbsp;&nbsp;
                                                 <c:if test="${sessionScope.role == 'super admin'}"> 
                                                 	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditWHTax('${storeTax.taxName}','${storeTax.location}','${storeTax.taxCategoryName}','edit')">Edit</a>
                                                 </c:if>
                                                <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
    												<c:if test="${accessControl.appDocument == 'Taxation' && accessControl.write == true}"> 
                                                		<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditWHTax('${storeTax.taxName}','${storeTax.location}','${storeTax.taxCategoryName}','edit')">Edit</a>
                                                	</c:if>
                                                </c:forEach> 
                                                </td>
                							</tr>
                                            </c:forEach> 
                                        </tbody>
                                    </table>
                           
                <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="return viewWarehouseTaxation('taxation','${totalValue}','<c:out value="${selectedLocation}"/>')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewWarehouseTaxation('taxation','${index -(maxRecords + 1)}','<c:out value="${selectedLocation}"/>');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewWarehouseTaxation('taxation','${index - (maxRecords + 1)}','<c:out value="${selectedLocation}"/>');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="return viewWarehouseTaxation('taxation','${totalValue}','<c:out value="${selectedLocation}"/>')">
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
              		  <input type="button" onclick="viewWarehouseTaxation('taxation',document.getElementById('pagination').value,'')" class="btn bg-olive btn-inline  addBtn" value="GO">
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