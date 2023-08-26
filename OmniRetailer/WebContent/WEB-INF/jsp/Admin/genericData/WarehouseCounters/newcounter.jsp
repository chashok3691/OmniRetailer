<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : admin/genericData/newCounter.jsp
 * file type		        : JSP
 * description				: The currency form is displayed using this jsp
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
<style type="text/css">
	.col-xs-12 {
	 padding: 2% 25%;
	 }
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#countryName").focus();
});
$("#countryName").keydown(function(){
	    $(".Error").html("");
});
$("#currencyCode").keydown(function(){
    $(".Error").html("");
});
</script>
</head>
<body>
<!-- Content Header (Page header) -->
<%-- <section class="content-header">
   <h1>
     <spring:message code="generic.data.label" />
     <small><spring:message code="counter_master.label" /></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('admin');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><spring:message code="generic.data.label" /></li> <li class="active"><spring:message code="counter_master.label" /></li>
       </ol>
 </section> --%>

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">

				<div class="box box-primary" style="padding:7px ">
                     <div class="box-header" style="text-align: center">
                     <br/>
                        <h3><spring:message code="new_counter.label" /></h3>
                         </div><!-- /.box-header -->
                         <!-- form start -->
                          <form method="post">
                           <div class="box-body">
                            <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${err}</div>
	        				<div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
                           	 <div class="row">
                           	 <div class="form-group col-lg-6">
                                <label><spring:message code="counter_name.label" /></label><span class="requiredField">*</span>
                                  <input type="text" class="form-control" name ="counterName" id="counterName" value = "${counterName }" placeholder="<spring:message code="enter_counter.label"/><spring:message code="counter_name.label" />" value="" />
                              </div>
                              <div class="form-group col-lg-6">
                                <label>Outlet User</label><span class="requiredField">*</span>
									<select class="form-control" name="counterUserId" id="counterUserId">
									<option value="ALL" >All</option>
                                             <c:forEach var="user" items="${empInfo}">
												<option value="${user.email}" >${user.email}</option>
											</c:forEach>
                                  	</select>                                
                                  	 </div>
                             </div>
                             <div class="row">
                              <div class="form-group col-lg-6">
                                <label><spring:message code="counter_location.label" /></label><span class="requiredField">*</span>
                                  <select class="form-control" name="location" id="location" onchange="searchMenusforCounter('location','menu')">
                                             <c:forEach var="location" items="${locationsList}">
												<option value="${location}" ${location == locationInfo ? 'selected' : ''}>${location}</option>
											</c:forEach>
                                  </select>  
                                  </div>
                                  
                                  
                                   <div class="form-group col-lg-6">
                                    <label>Select Menu(Only for F&B)</label><span class="requiredField">*</span>
                                  <select class="form-control" name="menu" id="menu">
                                             <c:forEach var="menus" items="${menuDetailsList}">
												<option value="${menus.menu_name}" >${menus.menu_name}</option>
											</c:forEach>
                                  </select>  
                                   </div>
                              
                                    
                            </div>
                            
                             <div class="form-group">
                                <label><spring:message code="counter_deviceId.label" /></label><span class="requiredField">*</span>
                                     <input list="brow" class="form-control" name="devices" id="counterDeviceId" placeholder="Search Device ID">
                                  <datalist id="brow">
 											<c:forEach var="devices" items="${devicesList}">
												<option value="${devices}" ${devices == deviceId ? 'selected' : ''}>${devices}</option>
											</c:forEach>
									</datalist> 
                            </div>
                              <div class="row">
                            <div class="form-group col-lg-6">
                                <label>Counter Category</label><span class="requiredField">*</span>
                                  <select class="form-control" name="type" id="counterCategory">
												<option value="B2C" ${counterCategory == false ? 'selected' : ''}>B2C</option>
												<option value="B2B"  ${counterCategory == true ? 'selected' : ''}>B2B</option>
										
								 </select>    
                            </div>
                            
                            
                            <div class="form-group col-lg-6">
                                <label><spring:message code="counter_type.label" /></label><span class="requiredField">*</span>
                                  <select class="form-control" name="type" id="counterType">
										<c:choose>
											<c:when test="${counterType == 'Fixed'}">
												<option value="Fixed"  selected="selected"><spring:message code="counter_type_fixed.label"/></option>
												<option value="Mobile"><spring:message code="counter_type_mobile.label" /></option>
											</c:when>
											<c:when test="${counterType == 'Mobile'}">
												<option value="Fixed"><spring:message code="counter_type_fixed.label" /></option>
												<option value="Mobile" selected="selected"><spring:message code="counter_type_mobile.label"/></option>
											</c:when>
											<c:otherwise>
												<option value="Fixed"><spring:message code="counter_type_fixed.label" /></option>
												<option value="Mobile"><spring:message code="counter_type_mobile.label"/></option>
											</c:otherwise>
										</c:choose>
								 </select>    
                            </div>
                            </div>
                            <div class="row">
                            
                            <div class="form-group col-lg-6">
                                <label><spring:message code="counter_device_type.label" /></label><span class="requiredField">*</span>
                                  <select class="form-control" name="type" id="counterDeviceType">
												<c:choose>
											<c:when test="${deviceType == 'Android'}">
												<option value="Android" selected = "selected"><spring:message code="counter_device_type.android_label" /></option>
												<option value="IOS"><spring:message code="counter_device_type.ios_label" /></option>
												<option value="Windows"><spring:message code="counter_device_type.wondows_label" /></option>
											</c:when>
											<c:when test="${deviceType == 'IOS'}">
												<option value="Android"><spring:message code="counter_device_type.android_label" /></option>
												<option value="IOS" selected = "selected"><spring:message code="counter_device_type.ios_label" /></option>
												<option value="Windows"><spring:message code="counter_device_type.wondows_label" /></option>
											</c:when>
											<c:when test="${deviceType == 'Windows'}">
												<option value="Android"><spring:message code="counter_device_type.android_label" /></option>
												<option value="IOS" ><spring:message code="counter_device_type.ios_label" /></option>
												<option value="Windows" selected = "selected"><spring:message code="counter_device_type.wondows_label" /></option>
											</c:when>
											<c:otherwise>
												<option value="Android"><spring:message code="counter_device_type.android_label" /></option>
												<option value="IOS"><spring:message code="counter_device_type.ios_label" /></option>
												<option value="Windows"><spring:message code="counter_device_type.wondows_label" /></option>
											</c:otherwise>
										</c:choose>
												
								 </select>    
                            </div>
                            <div class="form-group col-lg-6">
                                <label><spring:message code="counter_print_type.label" /></label><span class="requiredField">*</span>
                                  <select class="form-control" name="type" id="printingType">
												
											
										<option value="GENERAL" selected = "selected">GENERAL</option>
										<option value="MIXED">MIXED</option>
										<option value="THERMAL PDF">THERMAL PDF</option>
											
											
												
								 </select>    
                            </div>
                            </div>
                             
                            <input  type="hidden" id="counterLocation" value="${locationInfo}">
                            
                              <div class="row">
                            <div class="form-group col-lg-6">
                                <label>Quick Bill</label><span class="requiredField">*</span>
                                  <select class="form-control" name="type" id="quickBill" name="quickBill" >
												<option value="false" ${quickBillFlag == false ? 'selected' : ''}>No</option>
										 		<option value="true" ${quickBillFlag == true ? 'selected' : ''}>Yes</option>
										
								 </select>    
                            </div>
                            
                             <div class="form-group col-lg-6">
                               <label>Tax Code(Optional)</label><span class="requiredField"></span>
								 <select class="form-control" id="taxCodeQuick">
								 <option value="">Select tax code </option>
											<c:forEach var="tax" items="${taxDetails}">
												<%-- <option value="${tax.taxName}">
												${tax.taxName}</option> --%>
										<option value="${tax.taxName}" ${tax.taxName == countertax ? 'selected' : ''}>${tax.taxName}</option>
													
											</c:forEach>
										</select> 
                            </div>
                            </div>
                            
                             <div class="form-group">
                                <label><spring:message code="remarks.label" /></label>
                                  <textarea class="form-control"  onblur="criteria(this)" style="resize:none;" name = "counterRemarks" id="counterRemarks"> ${remarks }</textarea>
                              </div>
                              
                          </div><!-- /.box-body -->
                         <br>			
						<br>			
						<div class="row" style="text-align: center;">
						 <input type="button" class="btnCls" onclick="saveWhCounter();" value="&nbsp;&nbsp;&nbsp;<spring:message code="submit.label" />&nbsp;&nbsp;&nbsp;" />
						  <c:if test="${sessionScope.role == 'super admin'}"> 
						  	<input type="button" class="btnCls buttonMargin" onclick="return viewWhCounterMaster('counterMaster','0');" value="<spring:message code="cancel.label" />" />
						  </c:if>
						  <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
                             <c:if test="${accessControl.appDocument == 'CounterMaster' && accessControl.write == true && accessControl.read == true}">
						 		<input type="button" class="btnCls buttonMargin" onclick="return viewWhCounterMaster('counterMaster','0');" value="<spring:message code="cancel.label" />" />
						 	</c:if>
                              </c:forEach>
						</div>
					<br/>
                    <div class="box-footer">
                                    
                    </div>       
                    </div>
             </form>
      </div>

</div>
</div>
</section><!-- /.content -->
</body>
</html>