<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sreedhar
 *Updated By 				: Soumya Vatte
 * file name		        : B2C/FeaturedProducts/Featuredproducts.jsp
 * file type		        : JSP
 * description				: The featured group details table is displayed using this jsp
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
         <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
         <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/b2c/feature.js"></script>
         <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
<style type="text/css">
@media only screen and (max-width:767px){
.table-responsive{
 overflow:hidden;
}
}
@media only screen and (max-width:1080px)  {

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
	margin-right: 2px;;
	/* margin-top:1%; */
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
	callCalender('featurefrom');
	callCalender('featureto');
	var sDate=$("#sd").val();
	var s=sDate.split(' ');
	$("#from").val(s[0]);

	var eDate=$("#ed").val();
	var e=eDate.split(' ');
	$("#to").val(e[0]);
	var err = $("#err").val();
	if(err != "")
	  alert(err);
	$("#searchProductGroup").val($("#FeaturedproductGroup").val());
		$("#searchProductGroup").focus();
		$('#searchProductGroup').on('input',function(e){
			if($(this).val().trim()==""){
				viewFeaturedProducts('featuredProducts','0')
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
                  <h3 class="box-title"><spring:message code="featuredProducts.label" /></h3>
              </div><!-- /.box-header -->
              <div class="box-body table-responsive">
                <input type="hidden" id="sd" value="${startDate}">
			<input type="hidden" id="ed" value="${endDate}">
                <div class="row">
	        <div class="col-lg-4 col-sm-12 form-group">
	         <div class="row">
                	<%-- <div class="col-lg-5 col-xs-4 col-sm-2 " style="text-align:left;top:3px;padding-right: 15px;">
                 		<label><spring:message code="featured.type.label"/></label>
	                 </div> --%>
                	 <div class="col-lg-6 col-xs-6 col-sm-2 " >
                	 <label><spring:message code="featured.type.label"/></label>
                	 	<select class="form-control" id="featuredType" style="padding: 3px 4px;" onchange="searchFeaturedproducts('','','0');">
                	 		<option value="" ${featuredType == '' ? 'selected' : ''}>All</option>
	               		<option value="homepage" ${featuredType == 'homepage' ? 'selected' : ''}>Home Page</option>
	               		<option value="category" ${featuredType == 'category' ? 'selected' : ''}>Category</option>
	               		<option value="brand" ${featuredType == 'brand' ? 'selected' : ''}>Brand</option>
	              		<option value="group" ${featuredType == 'group' ? 'selected' : ''}>Group</option>
	               	</select>
                	 </div>
	              </div>

	        </div>
	        <div class="col-lg-1 col-sm-0"></div>
	        <div class="col-lg-3 col-sm-5">
              <div class="row">
                	<%-- <div class="col-lg-4 col-xs-4 col-sm-5 col-md-5" style="text-align:left;top:5px;padding-right: 0px;">
                 		<label><spring:message code="offer_start_date.label"/></label>
	                 </div> --%>
                	 <div class="col-lg-8 col-xs-8 col-sm-7 col-md-7" >
                	 <label><spring:message code="offer_start_date.label"/></label>
                	 	<input class="form-control calendar_icon form-group" readonly="readonly" value="" style="background-color: white;" id="featurefrom" size="20" type="text" onfocus="callCalender('featurefrom')" onclick="callCalender('featurefrom')" placeholder="DD/MM/YYYY" />
                	 </div>
	              </div>
	            </div>
	            <div class="col-lg-3 col-sm-5">
	               <div class="row">
	                 <%-- <div class="col-lg-4 col-xs-4 col-sm-5 col-md-5" style="text-align:left;top:5px;padding-right: 0px;">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 </div> --%>
	                 <div class="col-lg-8 col-xs-8 col-sm-7 col-md-7" >
	                  <label><spring:message code="offer_end_date.label"/></label>
	                 	<input class="form-control calendar_icon form-group" readonly="readonly" value="" style="background-color: white;" id="featureto" size="20" type="text" onfocus="callCalender('featureto')" onclick="callCalender('featureto')" placeholder="DD/MM/YYYY" />
                	  </div>
		           </div>
		          </div>
	           <div class="col-lg-1 col-sm-2" style="margin-top: 15px">
	                <input type="button" style="padding: 4px 8px;float: right;" class="btn bg-olive btn-inline" onclick="searchFeaturedproducts('','','0')" value="<spring:message code="search" />" />
	           </div>
		      </div>
               <div class="row">
                <div class="col-lg-1 col-sm-2 col-xs-2" style="margin-top: 5px;">
	                <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="searchFeaturedproducts('','','0');">
	               		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
	               		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
	               		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
	              		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
	               	</select>
	           </div>
                     <div class="col-lg-9 col-sm-10 col-xs-10">
	        	 		 <input type="text"  class="form-control searchItems" style="margin-top: 5px;text-align: center;height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" value="" id="searchFeaturedGroup" placeholder="<spring:message code="search.featuredGroup.label" />" />
							<div class="services">
				    			<div class="items">
				     				<ul class="matchedStringUl searchFeaturedGroup" style=""></ul>
				   				</div>
							</div>
							<span id="brandNameError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
							<input type="hidden" id="FeaturedproductGroup" value="${searchName}">
	        	 		</div>
                               <c:if test="${sessionScope.role == 'super admin'}"> 
                                <div class="col-lg-2 col-sm-3" style="margin-top: 3px;padding-left: 0px;">
								 <div class="buttons" style="">
	  				               <a onclick="return newFeaturedProductGroupMaster();" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp;
	   			                   <a onclick="return validate('FeaturedproductGroup');" class="button"><font size="2px"><spring:message code="delete.label" /></font></a>
								 </div>
								 </div>
                               </c:if>
                            <c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
								<c:if test="${accessControl.appDocument == 'FeaturedProducts' && accessControl.write == true}">
                                    <div class="  col-lg-2" style="margin-top: 3px;padding-left: 0px;">
									 <div class="buttons" style="">
		  				               <a  onclick="return newFeaturedProductGroupMaster();" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp;
		   			               
		   			                   <a onclick="return validate('FeaturedproductGroup');" class="button"><font size="2px"><spring:message code="delete.label" /></font></a>
									 </div>
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
                                  <c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
									<c:if test="${accessControl.appDocument == 'FeaturedProducts' && accessControl.write == true}">
                                  		<th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                                  	 </c:if>
                                  </c:forEach> 
                                  	  <th><div style="width:45px;"><spring:message code="sno.label" /></div></th>
                                      <th><spring:message code="featured.product.id" /></th>
                                      <th><spring:message code="featured.product.title" /></th>
                                      <th><spring:message code="featured.product.startdate" /></th>
                                       <th><spring:message code="featured.product.enddate" /></th>
                                       <th><spring:message code="featured.product.status" /></th>
                                        <th><spring:message code="EmployeeForm.action" /></th>
                                  </tr>
                              </thead>
                              <tbody style="text-align: center;">
                          <c:forEach var="featuredProduct" items="${featuredList}">
                                            <tr>
                                            <c:if test="${sessionScope.role == 'super admin'}"> 
                                             	<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${featuredProduct.featureId}' /></td>
                                             </c:if>
                                            <c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
    											<c:if test="${accessControl.appDocument == 'FeaturedProducts' && accessControl.write == true}"> 
                                            		<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${featuredProduct.featureId}' /></td>
                                            	</c:if>
                                            </c:forEach>
                                            	
                                                <td style="float: left;padding-left: 25px;">${featuredProduct.slNo}</td>
                                                <td>${featuredProduct.featureId}</td>
                                                <td>${featuredProduct.featuredTitle}</td>
                                                <td>${featuredProduct.startDateStr}</td>
                                                <td>${featuredProduct.endDateStr}</td>
                                                <c:choose>
                                                <c:when test="${'1' == featuredProduct.status}">
                                                	 <td>Active</td>
                                                </c:when>
                                                <c:when test="${'0' == featuredProduct.status}">
                                                	 <td>Inactive</td>
                                                </c:when>
                                                <c:otherwise>
                                                  <td>${featuredProduct.status}</td>
                                                </c:otherwise>
                                                </c:choose>
                                                <td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditFeaturedGroup('${featuredProduct.featureId}','view')">View</a>&nbsp;&nbsp;&nbsp;
                                       <c:if test="${sessionScope.role == 'super admin'}"> 
                                       	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditFeaturedGroup('${featuredProduct.featureId}','edit')">Edit</a>
                                       </c:if>
                                      <c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
										<c:if test="${accessControl.appDocument == 'FeaturedProducts' && accessControl.write == true}"> 
                                      		<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditFeaturedGroup('${featuredProduct.featureId}','edit')">Edit</a>
                                      	</c:if>
                                      </c:forEach> 
                                      </td>
                							</tr>
                                            </c:forEach> 
                              
                              </tbody>
                          </table>
                <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewFeaturedProducts('featuredProducts','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewFeaturedProducts('featuredProducts','${index - (maxRecords+1)}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewFeaturedProducts('featuredProducts','${index - (maxRecords+1)}'); "> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewFeaturedProducts('featuredProducts','${totalValue}'); ">
              	</div> 
              	</c:if>
              </div>
           </div><!-- /.box-body -->
       </div><!-- /.box -->
  
</div>
</div>
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="featured.productGroup.label" />"/>
         <input type="hidden" id="err" value="${err}" />
</section><!-- /.content -->
 <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
 <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
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