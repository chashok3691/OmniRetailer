<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : admin/genericData/newLocation.jsp
 * file type		        : JSP
 * description				: The new location form is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/controller.js"></script>
<style type="text/css">
	.col-xs-12 {
	 padding: 2% 10%;  
	 }
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#sectionName").keydown(function(){
	    $("#Error").html("");
	    $("#sectionNameError").html("");
	});
	$("#mealType").keydown(function(){
		    $("#Error").html("");
		    $("#mealTypeError").html("");
	});
	$("#courseType").keydown(function(){
	    $("#Error").html("");
	    $("#courseTypeError").html("");
	});
});
</script>
</head>
<body>
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">

				<div class="box box-primary" style="padding: ">
                   <div class="box-header" style="text-align: center">
                   <br/>
                   <h3><spring:message code="view.section.label" /></h3>
                   </div><!-- /.box-header -->
                   <!-- form start -->
                     <form id="newLocation" method="post">
                       <div class="box-body">
                      	<div id="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${err}</div>
                       <div class="row">
                          <div class="form-group col-lg-6">
                          	<input type="hidden" id="sectionId" value="${sectionDetails.sectionId}" >
                            <label><spring:message code="section.name.label" /> <span style="color:red; font-size:2">*</span></label>
                            <input type="text" class="form-control" readonly="readonly" id="sectionName" value="${sectionDetails.sectionName}" name="sectionName" placeholder="<spring:message code="enter.section.name.label" />" />
                        	<span id="sectionNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                         </div>
                          <div class="form-group col-lg-6">
                            <label><spring:message code="meal.type.label" /> <span style="color:red; font-size:2">*</span></label>
                            <input type="text" class="form-control" readonly="readonly" id="mealType" value="${sectionDetails.mealType}" name="mealType" placeholder="<spring:message code="enter.meal.type.label" />" />
                         	<span id="mealTypeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                         </div>
                      </div>
                       <div class="row">
                          <div class="form-group col-lg-6">
                            <label><spring:message code="course.type.label" /> <span style="color:red; font-size:2">*</span></label>
                            <input type="text" class="form-control" readonly="readonly" id="courseType" value="${sectionDetails.courseType}" name="courseType" placeholder="<spring:message code="enter.course.type.label" />" />
                        	<span id="courseTypeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                         </div>
                          <div class="form-group col-lg-6">
                            <label><spring:message code="status.label" /> <span style="color:red; font-size:2">*</span></label>
                            <select class="form-control" disabled="disabled" id="status" name="status">
                            	<option value="Active" ${sectionDetails.status == 'Active' ? 'selected' : ''}>Active</option>
                            	<option value="Disable"${sectionDetails.status == 'Disable' ? 'selected' : ''}>Disable</option>
                            </select>
                         	<span id="statusError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                         </div>
                        </div>
						 <div class="row">
                           <div class="form-group col-lg-12">
	                            <label><spring:message code="description.label" /></label>
	                            <textarea rows="2" id="description" name="description" readonly="readonly" style="resize: none;" class="form-control allField" placeholder="<spring:message code="enter.description.label" />" >${sectionDetails.sectionDescription}</textarea>
	                            <span id="descriptionError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                           </div>
                        </div>
                         
						 
                       </div><!-- /.box-body -->
                      
						<br>			
						<div class="row" style="text-align: center;">
						  <c:if test="${sessionScope.role == 'super admin'}"> 
						  	<input type="button" class="btn bg-olive btn-inline" onclick="return viewSectionMaster('sectionMaster','0');" value="<spring:message code="cancel.label" />" />
						  </c:if>
						<c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                            <c:if test="${accessControl.appDocument == 'LocationMaster' && accessControl.write == true && accessControl.read == true}">
						 		<input type="button" class="btn bg-olive btn-inline" onclick="return viewSectionMaster('sectionMaster','0');" value="<spring:message code="cancel.label" />" />
						 	</c:if>
						 </c:forEach>
						</div>
					<br/>
                    <div class="box-footer">
                                    <input type="hidden" value="${maxRecords}" id="maxRecords"/>
                           <input type="hidden" value="${searchName}" id="searchSection"/>
                    </div>
             </form>
      </div>

</div>
</div>
</section><!-- /.content -->
</body>
</html>