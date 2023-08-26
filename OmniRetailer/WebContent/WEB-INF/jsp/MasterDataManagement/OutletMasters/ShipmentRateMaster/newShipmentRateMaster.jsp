<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Viswanath
 * file name		        : Inventory Manager/master/newShipmentRateMaster.jsp
 * file type		        : JSP
 * description				: The new Shipment Rate form is displayed using this jsp
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
	 <%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css"> --%>
	<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/countries.js"></script>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/controller.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/masterDataManagement/outletMasters/shipmentRateMaster.js"></script>
	<script src="${pageContext.request.contextPath}/js/demo-compiled.js"></script>
	<%-- <script src="${pageContext.request.contextPath}/js/jquery.form-validator.min.js"></script> --%>
<style type="text/css">
	/* .col-xs-12 {
	 padding: 2% 10%;  
	 } */
</style>
<script type="text/javascript">
$(document).ready(function(){
		//$("#address").focus();
		
	//	$.validate();
	print_country("country");
	$("#country").val("India");
	
	
	$("#locationId").change(function(){
		if($("#locationId").val().trim() == ""){
			$("#locationIdError").html("Select any Location");
			return;
		} 

	});
	 

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
     <small><spring:message code="location.master.label" /></small>
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
                   <h3><spring:message code="new.shipment.rate.label" /></h3>
                   </div><!-- /.box-header -->
                   <!-- form start -->
                     <form id="newLocation" method="post">
                       <div class="box-body">
                      	<div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 20px; margin-top: -20px">${err}</div>
                        <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 20px; margin-top: -20px">${success}</div>
                        <div class="row">
                       	 <div class="form-group col-lg-6">
                       	<div class="form-group col-lg-4"  style="text-align:right;">
                                   <label><spring:message code="fromlocation.label" /><span style="color:red; font-size:2">*</span></label>
                                   </div>
                                        <div class="form-group col-lg-6" style="margin-left: -4%;">
                                            <select class="form-control" id="locationId"  onchange="">
 				                             <option value="">-- Select --</option>
 				                             <c:forEach var="location" items="${locationsList}">
												<option value="${location.locationId}">${location.locationId}</option>
											 </c:forEach>
                                           </select>
                                            <span id="locationIdError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                        </div>
                                        </div>
                                         <div class="row">
                       	 <div class="form-group col-lg-6" style="margin-bottom:9px;">    
                                        <div class="form-group col-lg-4"  style="text-align:right;">
                                   <label><spring:message code="shipment.country.label" /></label>
                                   </div>
                                        <div class="form-group col-lg-6" style="margin-left: -4%;">
                                            <select id="country" name="country" class="form-control">
                                            <option value="">-- Select --</option>
                                            </select>
                                        </div> 
                                        <div class="form-group col-lg-4"  style="text-align:right;">
                                   <label><spring:message code="shipment.type.label" /><span style="color:red; font-size:2">*</span></label>
                                   </div>
                                        <div class="form-group col-lg-6" style="margin-left: -4%;">
                                            <select id="shipmentType" name="shipmentType" class="form-control">
				  	 	  	<option value="">-- Select --</option>
						<option value="Normal">Normal</option>
						<option value="Express">Express</option>
				    </select>
				    <span id="shipmentTypeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div> 
                                        <div class="form-group col-lg-4"  style="text-align:right;">
                                   <label><spring:message code="shipmentMode.label" /><span style="color:red; font-size:2">*</span></label>
                                   </div>
                                        <div class="form-group col-lg-6" style="margin-left: -4%;">
                                            <select id="shipmentMode" name="shipmentMode" class="form-control">
				  	 	  	<option value="">-- Select --</option>
						<option value="Rail">Rail</option>
						<option value="Road">Road</option>
						<option value="Courier">Courier</option>
						<option value="Direct Person">Direct Person</option>
				    </select>
				    <span id="shipmentModeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div> 
                                        <div class="form-group col-lg-4"  style="text-align:right;">
                                   <label><spring:message code="package.type.label" /></label>
                                   </div>
                                        <div class="form-group col-lg-6" style="margin-left: -4%;">
                                            <select id="packageType" name="packageType" class="form-control">
				  	 	  	<option value="">-- Select --</option>
						
				    </select>
                                        </div> 
                         </div>
                         <div class="form-group col-lg-6" style="margin-bottom:9px;">
                         <div class="form-group col-lg-5"  style="text-align:right;">
                             <label><spring:message code="distance.range.km.label" /><span style="color:red; font-size:2">*</span></label>
                         </div>
                         <div class="form-group col-lg-3" style="margin-left: -4%;">
                        	 <input type="text" class="form-control" id="distanceStartRange" name="distanceStartRange" placeholder="<spring:message code="start.value.label" />" value="" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                        	 <span id="distanceStartRangeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                         </div>
                         <div class="form-group col-lg-3">
                        	 <input type="text" class="form-control" id="distanceEndRange" name="distanceEndRange" placeholder="<spring:message code="end.value.label" />" value="" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                        	 <span id="distanceEndRangeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                         </div>
                         <!-- <div class="form-group col-lg-7">
                             <select class="form-control" id="distanceRange"  onchange="">
 				             <option value="">-- Select --</option>
	                         </select>
                         </div>  -->
                         <div class="form-group col-lg-5"  style="text-align:right;">
                             <label><spring:message code="order.value.range.label" /><span style="color:red; font-size:2">*</span></label>
                         </div>
                         <div class="form-group col-lg-3" style="margin-left: -4%;">
                        	 <input type="text" class="form-control" id="orderValueStartRange" name="orderValueStartRange" placeholder="<spring:message code="start.value.label" />" value="" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                        	 <span id="orderValueStartRangeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                         </div>
                         <div class="form-group col-lg-3">
                        	 <input type="text" class="form-control" id="orderValueEndRange" name="orderValueEndRange" placeholder="<spring:message code="end.value.label" />" value="" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                        	 <span id="orderValueEndRangeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                         </div>
                         <div class="form-group col-lg-5"  style="text-align:right;">
                             <label><spring:message code="order.quantity.range.label" /></label>
                         </div>
                          <div class="form-group col-lg-3" style="margin-left: -4%;">
                        	 <input type="text" class="form-control" id="orderQuantityStartRange" name="orderQuantityStartRange" placeholder="<spring:message code="start.value.label" />" value="" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                        	 <span id="orderQuantityStartRangeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                         </div>
                         <div class="form-group col-lg-3">
                        	 <input type="text" class="form-control" id="orderQuantityEndRange" name="orderQuantityEndRange" placeholder="<spring:message code="end.value.label" />" value="" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                        	 <span id="orderQuantityEndRangeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                         </div>
                          <div class="form-group col-lg-5"  style="text-align:right;">
                             <label><spring:message code="weight.range.label" /></label>
                         </div>
                          <div class="form-group col-lg-3" style="margin-left: -4%;">
                        	 <input type="text" class="form-control" id="weightStartRange" name="weightStartRange" placeholder="<spring:message code="start.value.label" />" value="" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                        	 <span id="weightStartRangeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                         </div>
                         <div class="form-group col-lg-3">
                        	 <input type="text" class="form-control" id="weightEndRange" name="weightEndRange" placeholder="<spring:message code="end.value.label" />" value="" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                        	 <span id="weightEndRangeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                         </div>
                         <div class="form-group col-lg-5"  style="text-align:right;">
                             <label><spring:message code="shipment.cost.label" /><span style="color:red; font-size:2">*</span></label>
                         </div>
                         <div class="form-group col-lg-6" style="margin-left: -4%;">
                             <input type="text" class="form-control" id="shipmentCost" name="shipmentCost" placeholder="<spring:message code="enter.shipment.cost" />" value="" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                        	<span id="shipmentCostError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                         </div> 
                        </div>
                       
                         </div>
						 <div class="row">
                           <div class="form-group col-lg-11" style="margin-left:6.0%;width: 86.5%;">
	                            <label><spring:message code="remarks.label" /></label>
	                            <textarea rows="3" onblur="criteria(this)" id="remarks" name="remarks" style="resize: none;" class="form-control allField" placeholder="<spring:message code="enter.remarks.label" />" ></textarea>
	                            <span id="remarksError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                           </div>
                        </div> 
                         
						 
                       </div><!-- /.box-body -->
                      
						<br>			
						<div class="row" style="text-align: center;">
						 <input type="button"  class="btnCls" onclick="return validateShipmentRateForm('new');" value="<spring:message code="submit.label" />" />
						 ${accessControl.appDocument}
						  <c:if test="${sessionScope.role == 'super admin'}"> 
						  	<input type="button" class="btnCls buttonMargin"  onclick="return viewShipmentRateMaster('shipmentRateMaster','0');" value="<spring:message code="cancel.label" />" />
						  </c:if>
						<c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                            <c:if test="${accessControl.appDocument == 'ShipmentRateMaster' && accessControl.write == true && accessControl.read == true}">
						 		<input type="button" class="btnCls buttonMargin"  onclick="return viewShipmentRateMaster('shipmentRateMaster','0');" value="<spring:message code="cancel.label" />" />
						 	</c:if>
						 </c:forEach>
						</div>
					<br/>
				
                    <div class="box-footer">
                                    
                    </div>
                    
                    
                     <input type="hidden" value="${maxRecords}" id="maxRecords"/>
                     <input type="hidden" value="${searchName}" id="searchShipmentRate"/>
             </form>
      </div>

</div>
</div>
</section><!-- /.content -->
</body>
</html>