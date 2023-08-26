<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sreedhar
 * Updated By 				: Soumya Vatte
 * file name		        : B2C/featuredshopss/FeaturedShops.jsp
 * file type		        : JSP
 * description				: The featured group details table is displayed using this jsp
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome | Omni Retailer</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<!-- DATA TABLES -->
<link
	href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/validation.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/controller.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/b2c/featureRetailers.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
<style type="text/css">
@media only screen and (max-width:767px) {
	.table-responsive {
		overflow: hidden;
	}
}

@media only screen and (max-width:1080px) {
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
	margin-right: 2px;
	
	color:white;
	/* margin-top:1%; */
}

a.button, .list a.button {
	position: relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 5px 10px 5px 10px;
	background: #3c8dbc;
	border-radius: 5px;
	box-shadow: 1px 0px 2px #000;
	cursor: pointer;
	behavior: url(css/PIE.htc);
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	callCalender('featurefrom');
	callCalender('featureto');
	
	$('#searchFeaturedRetailer').on('input',function(e){
		if($(this).val().trim()==""){
			viewFeaturedShops('featuredShops','0');
		}
	});
	
	$('#mySearch').click(function(){
	   var search = $('#searchFeaturedRetailer').val();
	    return viewFeaturedShops('featuredShops','0');
	})
	$('#mySearchs').click(function(){
	   var search = $('#searchFeaturedRetailer').val();
	    return viewFeaturedShops('featuredShops','0');
	})
	$('#searchFeaturedRetailer').keypress(function(e){
	    if(e.which == 13){//Enter key pressed
	        $('#mySearch').click();//Trigger search button click event
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
						<h3 class="box-title">
							<spring:message code="featured.shops.label" />
						</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body table-responsive">
						<input type="hidden" id="sd" value="${startDate}"> <input
							type="hidden" id="ed" value="${endDate}">
						
						<div class="row">
						
						<div class="col-lg-4 col-sm-5" style=" margin-right:70px;"></div>
						<div class="col-lg-1 col-sm-5" style="padding-top:4px;padding-left: 17px;"><label><spring:message code="offer_start_date.label" /></label></div>
						<div class="col-lg-2 col-sm-5"style="padding-left: 0px;">
								<!-- <div class="row"> -->
									<!-- <div class="col-lg-4 col-xs-4 col-sm-5 col-md-5" style="text-align:left;top:5px;padding-right: 0px;">
	                 				</div> -->
									<div class="col-lg-12 col-xs-12 col-sm-12 col-md-12">
										
										<input class="form-control calendar_icon form-group"
											readonly="readonly" value="${startDateStr}" style="background-color: white;"
											id="featurefrom" size="20" type="text"
											onfocus="callCalender('featurefrom')"
											onclick="callCalender('featurefrom')"
											placeholder="DD/MM/YYYY" />
									</div>
						</div>
						<div class="col-lg-1 col-sm-5 " style="padding-top:4px;"><label><spring:message code="offer_end_date.label" /></label></div>
						<div class="col-lg-2 col-sm-5"style="padding-left: 0px;">
								<!-- <div class="row"> -->
									<!-- <div class="col-lg-4 col-xs-4 col-sm-5 col-md-5" style="text-align:left;top:5px;padding-right: 0px;">
	                 				</div> -->
									<div class="col-lg-12 col-xs-12 col-sm-12 col-md-12">
										
									<input class="form-control calendar_icon form-group"
											readonly="readonly" value="${endDateStr}" style="background-color: white;"
											id="featureto" size="20" type="text"
											onfocus="callCalender('featureto')"
											onclick="callCalender('featureto')" placeholder="DD/MM/YYYY" />
									</div>
									<!-- <button id="mySearch" class="searchbutton" style="margin-top:0px; height:28px; margin-right:-20px;"></button> -->
						</div>
							 <div class="col-lg-1 col-sm-5"style="padding-left: 30px;">
							    <div id="mySearch" class="btn btn-primary" style="height:28px;margin-top: 2px;line-height: 14px;">search</div>
							    </div>
							
							
							
						</div>
						
						
						
						
						<div class="row" >
							<div class="col-lg-1 col-sm-1 col-xs-1"
								style="margin-top: 7px; margin-left: 6px;padding-left: 10px;padding-right: 5.2px;">
								<select class="form-control" id="maxRecords"
									style="padding: 3px 4px;"
									onchange="viewFeaturedShops('featuredShops','0');">
									<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
									<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
									<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
									<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
								</select>
							</div>
							<div class="col-lg-9 col-sm-10 col-xs-10" style="padding-top: 7px;padding-left:0px;">
							<div class="wrapper">	 
                      		<input type="text"  class="form-control" style="" value="${searchName}" id="searchFeaturedRetailer" placeholder="Search retailers " />
							<button id="mySearchs" class="searchbutton" style="margin-top:6px; height:29px;"></button>
							
							</div>
							<input type="hidden" id="searchName" value="${searchName}">
								
							</div>
							
							 <%-- <c:if test="${sessionScope.role == 'super admin'}">  --%>
                                 	<div class="col-lg-1" style="margin-top: 6px;padding-left: 6.8px;">
			  				               <a onclick="return newFeaturedShopsGroupMaster();" class="btn bg-olive btn-inline  addBtn"><font size="2px"><spring:message code="addnew.label" /></font></a>
			   			               </div>
			   			                 <div class="col-lg-1" style="margin-top: 6px;margin-left: -6px;padding-left: 0px;">
			  				               <a onclick="return validate('featuredRetailer');" class="btn bg-olive btn-inline  addBtn"><font size="2px">Delete</font></a>
			   			               </div>
                                 <%-- </c:if> --%>
                                 <%-- <c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
    								<c:if test="${accessControl.appDocument == 'MiniBanner' && accessControl.write == true}"> --%> 
	                                <%-- <div class="col-lg-1" style="margin-top: 3px;padding-left: 3px;padding-top: 3px;">
			  				               <a onclick="return newFeaturedShopsGroupMaster();" class="btn bg-olive btn-inline  addBtn" style="height:29px;padding-top:3px;"><font size="2px"><spring:message code="addnew.label" /></font></a>
			   			               </div> --%>
			   			            <%--      
									 </c:if>
								</c:forEach> --%>
						</div>
						
						
						
						
						
						
						
						<table id="example1" class="table table-bordered table-striped"
							style="">
							<thead style="background-color: #3c8dbc; color: #ffffff">
								<tr>
									<%-- <c:if test="${sessionScope.role == 'super admin'}"> --%>
										<th style="width: 40px" align="center"><input
											type='checkbox' name='selectall' onClick='selectAll(this)'></th>
									<%-- </c:if> --%>
									<%-- <c:forEach var="accessControl"
										items="${sessionScope.b2cManagement}">
										<c:if test="${accessControl.appDocument == 'featuredshopss' && accessControl.write == true}">
											<th style="width: 40px" align="center"><input
												type='checkbox' name='selectall' onClick='selectAll(this)'></th>
										</c:if>
									</c:forEach> --%>
									<th><div style="width: 45px;"><spring:message code="sno.label" /></div></th>
									<th><spring:message code="featured.store.id" /></th>
									<th><spring:message code="featured.store.name" /></th>
									<th><spring:message code="featuredShops.package.label" /></th>
									<th><spring:message code="featured.store.createddate" /></th>
									<%-- <th><spring:message code="featured.store.city" /></th> --%>
									<th><spring:message code="featured.store.startdate" /></th>
									<th><spring:message code="featured.store.enddate" /></th>
									<th><spring:message code="featured.store.status" /></th>
									<th><spring:message code="EmployeeForm.action" /></th>
								</tr>
							</thead>
							<tbody style="text-align: center;">
								<c:forEach var="featuredshops" items="${featuredList}" varStatus="theCount">
									<tr>
										<%-- <c:if test="${sessionScope.role == 'super admin'}"> --%>
											<td><input type="checkbox" name="selectall"
												class="selectableCheckbox" id="selectall"
												value='${featuredshops.featuredRetailerId}' /></td>
										<%-- </c:if> --%>
										<%-- <c:forEach var="accessControl"
											items="${sessionScope.b2cManagement}">
											<c:if
												test="${accessControl.appDocument == 'featuredshopss' && accessControl.write == true}">
												<td><input type="checkbox" name="selectall"
													class="selectableCheckbox" id="selectall"
													value='${featuredshops.featureId}' /></td>
											</c:if>
										</c:forEach> --%>

										<td style="float: left; padding-left: 25px;">${theCount.count+index-1}</td>
										<td>${featuredshops.featuredRetailerId}</td>
										<td>${featuredshops.featureDescription}</td>
										<td>${featuredshops.packageName}</td>
										<td>${featuredshops.createdDateStr}</td>
										<!-- <td></td> -->
										<td>${featuredshops.startDateStr}</td>
										<td>${featuredshops.endDateStr}</td>
										<td>${featuredshops.status}</td>
										
										<%-- <c:choose>
											<c:when test="${'1' == featuredshops.status}">
												<td>Active</td>
											</c:when>
											<c:when test="${'0' == featuredshops.status}">
												<td>Inactive</td>
											</c:when>
											<c:otherwise>
												<td>${featuredshops.status}</td>
											</c:otherwise>
										</c:choose> --%>
										<td>
										    <a style="color: #2e7ea7 !important; cursor: pointer;" onclick="return viewEditFeaturedRetailer('${featuredshops.featuredRetailerId}','view')">View</a>&nbsp;&nbsp;&nbsp;
											<a style="color: #2e7ea7 !important; cursor: pointer;" onclick="return viewEditFeaturedRetailer('${featuredshops.featuredRetailerId}','edit')">Edit</a>
										</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
						
					
					  <div class="row">
        
              	<c:if test="${index-1 == 0 && totalRecords > maxRecords}">
              		<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords}
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewFeaturedShops('featuredShops','${index+maxRecords-1}');">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              		<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewFeaturedShops('featuredShops','${index - maxRecords-1}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewFeaturedShops('featuredShops','${index - maxRecords-1}');"> ${index} - ${index+maxRecords-1} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewFeaturedShops('featuredShops','${index+maxRecords-1}');">
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
              		  <input type="button" onclick="viewFeaturedShops('featuredShops',document.getElementById('pagination').value)" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
				</div>
              </div>   
					<!-- /.box-body -->
				</div>
				<!-- /.box -->

			</div>
		</div>
		<input type="hidden" id="deleteActionLabel"
			value="<spring:message code="featured.productGroup.label" />" /> <input
			type="hidden" id="err" value="${err}" />
			
			</div>
	</section>
	<!-- /.content -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js"
		type="text/javascript"></script>
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
</body>
</html>