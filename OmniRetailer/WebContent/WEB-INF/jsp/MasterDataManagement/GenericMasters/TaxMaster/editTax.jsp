<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : admin/genericData/editTax.jsp
 * file type		        : JSP
 * description				: The new tax form is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/masterDataManagement/genericMasters/taxMaster.js"></script>
    <%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css"> --%>
 
<style type="text/css">
	.col-xs-12 {
	 padding: 2% 25%;
	 }
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#taxName").focus();
});
	/* 
	var slectedLocations = $("#selectedLocations").val().replace('[','').replace(']','').replace(/, /g,',');
	$("#taxLocation").val(slectedLocations.split(','));
	}); */
	

$("#taxName").keydown(function(){
	$("#taxNameError").html("");
	$(".Error").html("");
});
</script>

<!--  added by        :  koti bomminei
      description     :  to ristrict the user from entering special characters     -->
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

				<div class="box box-primary" style="padding: ">
                                <div class="box-header" style="text-align: center">
                                <br/>
                                <h3><spring:message code="edit.tax.label" /></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form>
                                    <div class="box-body">
                                    <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${err}</div>
	        						<div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
                                     
                                     <div class="col-lg-12">
                                     <div class="col-lg-12">
                                    <div class="form-group">
                                            <label><spring:message code="tax.id.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text"   class="form-control" id="taxId" readonly="readonly" value="${taxDetails.taxId}" />
                                        </div>
                                    	
                                         
                                      </div>  
                                      
                                      
                                      
                                       <div class="col-lg-12">
                                       <div class="form-group">
                                            <label><spring:message code="tax.category.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text"   class="form-control"id="taxName" readonly="readonly" placeholder="" value="${taxDetails.taxName}" />
                                             <span id="taxNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                        
                                        </div>
                                 <%--        <div class="col-lg-5">
                                        
                                        <div class="form-group ">
                                   	  	   <label><spring:message code="location.label" /></label>
		                                       <select class="form-control" style="height:100px;"  id="taxLocation" multiple="multiple">
		                                          <c:forEach var="location" items="${locationsList}"> 
												 <option value="${location}">${location}</option>
											   </c:forEach>
									 		</select>
                                   	  </div>
                                        </div>
                                        <input type="hidden" id="selectedLocations" value="${taxLocationList}"> --%>
                                        
                                        
                                         <div class="col-lg-12" >
                                        <div class="form-group">
                                            <label><spring:message code="tax.description.label" /></label>
                                            <textarea class="form-control" style="resize:none;"  id="taxDescription" placeholder="<spring:message code="enter.tax.description" />" >${taxDetails.taxDescription}</textarea>
                                        	<span id="taxdescError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                        
                                        </div>
                                        </div>
                                        
                                        
                                    </div><!-- /.box-body -->
                       <br>			
						<div class="row" style="text-align: center;">
						 <input type="button" style="" class="btnCls" onclick="updateTax();" value="<spring:message code="submit.label" />" />
						 <input type="button" class="btnCls buttonMargin"  onclick="return viewTaxMaster('taxMaster','0');" value="<spring:message code="cancel.label" />" />
						</div>
					<br/>
                    <div class="box-footer">
                                    
                    </div>
                    
                    <input type="hidden" value="${maxRecords}" id="maxRecords"/>
                           <input type="hidden" value="${searchName}" id="searchTax"/>
             </form>
      </div>

</div>
</div>
</section><!-- /.content -->
</body>
</html>