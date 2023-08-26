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
        <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/productMaster.js"></script> --%>
         <script src="${pageContext.request.contextPath}/js/b2c/homePageBannerAndMiniBanner.js"></script>
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
</style>     
<script type="text/javascript">
$(document).ready(function(){
var err = $("#err").val();
if(err != "")
  alert(err);
$("#homePageBannerMaster").val($("#banner").val());
	$("#homePageBannerMaster").focus();
	$('#homePageBannerMaster').on('input',function(e){
		if($(this).val().trim()==""){
			viewHomePageBanners('homePageBanner','0');
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
               <div class="box-header">
                   <h3 class="box-title"><spring:message code="homepage.banner.label" /></h3>
               </div><!-- /.box-header -->
               <div class="box-body table-responsive">
                <div class="row">
                     <div class="col-lg-10">
	        	 		 <input type="text"  class="form-control searchItems" value=""  id="homePageBannerMaster" placeholder="<spring:message code="search.banners.label" />" style="margin-top: 5px;text-align: center;height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
							<div class="services">
				    			<div class="items">
				     				<ul class="matchedStringUl homePageBannerMaster" style=""></ul>
				   				</div>
							</div>
							<input type="hidden" id="banner" value="${searchName}">
	        	 	</div>
	        	 	<input type="hidden" id="type">
                                 <c:if test="${sessionScope.role == 'super admin'}"> 
                                 	<div class="col-lg-1" style="margin-top: 3px;padding-left: 0px;">
									 
			  				               <a onclick="return newBannerImage();" class="btn bg-olive btn-inline  addBtn"><font size="2px"><spring:message code="addnew.label" /></font></a>
			   			              </div>
			   			                <div class="col-lg-1" style="margin-top: 3px;padding-left: 0px;">
			   			                   &nbsp;&nbsp;&nbsp;<a onclick="return validate('banner');" class="button"><font size="2px"><spring:message code="delete.label" /></font></a>
										
									</div>
                                 </c:if>
                                 <c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
    								<c:if test="${accessControl.appDocument == 'HomePageBanner' && accessControl.write == true}"> 
	                                <div class="col-lg-1" style="margin-top: 3px;padding-left: 0px;">
			  				               <a onclick="return newBannerImage();" class="btn bg-olive btn-inline  addBtn"><font size="2px"><spring:message code="addnew.label" /></font></a>
			   			                 </div>
			   			                 <div class="col-lg-1" style="margin-top: -16px;padding-left: 0px;">
			   			                   &nbsp;&nbsp;&nbsp;<a onclick="return validate('banner');" class="btn bg-olive btn-inline  addBtn"><font size="2px"><spring:message code="delete.label" /></font></a>
									</div>
									 </c:if>
								</c:forEach>
                                    <table id="example1" class="table table-bordered table-striped" style="margin-left: 10px; width: 98.2%;">
                                        <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                             <c:if test="${sessionScope.role == 'super admin'}"> 
                                             	<th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                                             </c:if>
                                            <c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
    											<c:if test="${accessControl.appDocument == 'HomePageBanner' && accessControl.write == true}"> 
                                            		<th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                                            	</c:if>
                                            </c:forEach>
                                            	<th><div style=""><spring:message code="sl.no.label" /></div></th>
                                                <th><spring:message code="banner.id.label" /></th>
                                                <th><spring:message code="banner.name.label" /></th>
                                                <th><spring:message code="deal_id.label" /></th>
                                                <th><spring:message code="offer_id.label" /></th>
                                                <th><spring:message code="status.label" /></th>
                                                <th><spring:message code="EmployeeForm.action" /></th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                            <c:forEach var="banner" items="${bannerList}">
                                            <tr>
                                            <c:if test="${sessionScope.role == 'super admin'}"> 
                                             	<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${banner.bannerId}' /></td>
                                             </c:if>
                                            <c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
    											<c:if test="${accessControl.appDocument == 'HomePageBanner' && accessControl.write == true}"> 
                                            		<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${banner.bannerId}' /></td>
                                            	</c:if>
                                            </c:forEach>
                                            	<td>${banner.slNo}</td>
                                                <td>${banner.bannerId}</td>
                                                <td>${banner.bannerName}</td>
                                                <td>${banner.dealId}</td>
                                                <td>${banner.offerId}</td>
                                                <c:if test="${banner.status == '1'}">
	                                                <td>Active</td>
                                                </c:if>
                                                <c:if test="${banner.status == '0'}">
                                                	<td>Disabled</td>
                                                </c:if>
                                                <td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditBanner('${banner.bannerId}','view')">View</a>&nbsp;&nbsp;&nbsp;
                                                 <c:if test="${sessionScope.role == 'super admin'}"> 
                                                 	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditBanner('${banner.bannerId}','edit')">Edit</a>
                                                 </c:if>
                                                <c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
    												<c:if test="${accessControl.appDocument == 'HomePageBanner' && accessControl.write == true}"> 
                                                		<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditBanner('${banner.bannerId}','edit')">Edit</a>
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
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewHomePageBanners('','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewHomePageBanners('','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewHomePageBanners('','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewHomePageBanners('','${totalValue}')">
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