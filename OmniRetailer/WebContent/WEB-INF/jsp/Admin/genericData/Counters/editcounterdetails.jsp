<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : admin/genericData/newCurrency.jsp
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
		 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
<style type="text/css">
	.col-xs-12 {
	 padding: 2% 25%;
	 }
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#countryName").focus();
	$(this).scrollTop(0);
// 	$("#location").val($("#counterLoc").val());
	$("#counterDeviceId").val($("#counterDev").val());
	$("#counterType").val($("#counterTyp").val());
	
});
$("#countryName").keydown(function(){
	    $(".Error").html("");
});
$("#currencyCode").keydown(function(){
    $(".Error").html("");
    
 
    	searchMenusforCounter('location','menu');  
    
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

				<div class="box box-primary" style="padding: ">
				 <%--  <c:forEach var="counter" items="${counterDetails}"> --%>
                     <div class="box-header" style="text-align: center">
                     <br/>
                        <h3><span id = "counterIdSpan">${counterId}</span> - <spring:message code="po.details.label" /></h3>
                         </div><!-- /.box-header -->
                         <!-- form start -->
                          <form method="post">
                       
                           <div class="box-body">
                            <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${err}</div>
	        				<div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
                           	<div class="row">
                           	 <div class="form-group col-lg-6">
                                <label><spring:message code="counter_name.label" /></label><span class="requiredField">*</span>
                                  <input type="text" class="form-control" name ="counterName" id="counterName"  value="${counterName}"/>
                              </div>
                               <div class="form-group col-lg-6">
                                <label>Outlet User</label><span class="requiredField">*</span>
							<select class="form-control" name="counterUserId" id="counterUserId">
									<option value="ALL" >All</option>
                                             <c:forEach var="user" items="${empInfo}">
												<option value="${user.email}"  ${user.email == counterUserId ? 'selected' : ''}>${user.email}</option>
											</c:forEach>
                                  	</select>                                
                                  </div>
                              </div>
                             <div class="row">
                             <div class="form-group col-lg-6">
                                <label><spring:message code="counter_location.label" /></label><span class="requiredField">*</span>
                                  <select class="form-control" name="location" id="location" onchange="searchMenusforCounter('location','menu')" disabled="disabled">
                                             <c:forEach var="location" items="${locationsList}">
												<option value="${location}" ${location == storeLocation ? 'selected' : ''}>${location}</option>
											</c:forEach>
                                  </select>  
                                  </div>
                                  
                                   <div class="form-group col-lg-6">
                                    <label>Select Menu(Only for F&B)</label><span class="requiredField">*</span>
                                  <select class="form-control" name="menu" id="menu">
                                             <c:forEach var="menus" items="${menuDetailsList}">
												<option value="${menus.menu_name}" ${menus.menu_name == menu ? 'selected' : ''}>${menus.menu_name}</option>
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
										 		<option value="B2B" ${counterCategory == true ? 'selected' : ''}>B2B</option>
										
								 </select>    
                            </div>
                            
                             <div class="form-group col-lg-6">
                                <label><spring:message code="counter_type.label" /></label><span class="requiredField">*</span>
                                  <select class="form-control" name="type" id="counterType">
												<c:choose>
											<c:when test="${type == 'Fixed'}">
												<option value="Fixed"  selected="selected"><spring:message code="counter_type_fixed.label"/></option>
												<option value="Mobile"><spring:message code="counter_type_mobile.label" /></option>
											</c:when>
											<c:when test="${type == 'Mobile'}">
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
												<option value="Android"${deviceType == Android ? 'selected' : ''}><spring:message code="counter_device_type.android_label" /></option>
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
									<option value="GENERAL" ${'GENERAL' == printingType ? 'selected' : ''}>GENERAL</option>
									<option value="MIXED" ${'MIXED' == printingType ? 'selected' : ''}>MIXED</option>
									<option value="THERMAL PDF" ${'THERMAL PDF' == printingType ? 'selected' : ''}>THERMAL PDF</option>
								 </select>    
                            </div>
                            </div>
                            
                            
                             <div class="row">
                            <div class="form-group col-lg-6">
                                <label>Quick Bill</label><span class="requiredField">*</span>
                                  <select class="form-control" name="type" id="quickBill" name="quickBill">
												<option value="false" ${quickBillFlag == false ? 'selected' : ''}>No</option>
										 		<option value="true" ${quickBillFlag == true ? 'selected' : ''}>Yes</option>
										
								 </select>    
                            </div>
                            
                             <div class="form-group col-lg-6">
                              <label>Tax Code(Optional)</label><span class="requiredField"></span>
                                                                 <select class="form-control" id="taxCodeQuick1">
                                                                 <option value=" ">Select tax code </option>
                                                                                        <c:forEach var="tax" items="${taxDetails}">
                                                                                        <option value="${tax.taxName}" ${tax.taxName == countertax ? 'selected' : ''}>${tax.taxName}</option>
                                                                                                <%-- <option value="${tax.taxName}">
                                                                                                        ${tax.taxName}</option> --%>
                                                                                        </c:forEach>
                                                                                </select>
                            </div>
                            </div>
                             <div class="row">
                            <div class="form-group col-lg-6">
                                <label>Payment Device User Name</label>
                                   <input type="text" onblur="criteria(this)" class="form-control" name ="paymentDeviceUsername" id="paymentDeviceUsername" value = "${paymentDeviceUsername }" placeholder="Enter Payment Device User Name"  />   
                            </div>
                            
                             <div class="form-group col-lg-6">
                               <label>Payment Device Pin</label>
								  <input type="text" onblur="criteria(this)" class="form-control" name ="paymentDevicePin" id="paymentDevicePin" value = "${paymentDevicePin }" placeholder="Enter Payment Device Pin"/>
                            </div>
                            </div>
                            
                            <div class="row">
                            <div class="form-group col-lg-6">
                                <label>Payment Device Port</label>
                                   <input type="text" onblur="criteria(this)" class="form-control" name ="paymentDevicePort" id="paymentDevicePort" value = "${paymentDevicePort }" placeholder="Enter Payment Device Port"  />   
                            </div>
                            
                             
                            </div>
                             <div class="form-group">
                                <label><spring:message code="remarks.label" /></label>
                                  <textarea class="form-control" style="resize:none;"  onblur="criteria(this)" name = "counterRemarks" id="counterRemarks">${remarks}</textarea>
                            
                             <span id="counterRemarksError" style="text-align:right;color: red;font-size: 2;font-weight: bold;margin-left: 20px;white-space: nowrap;"></span>
                             </div>
                              
                          </div><!-- /.box-body -->
                         <br>			
						<br>			
						<div class="row" style="text-align: center;">
						 <input type="button" class="btnCls" onclick="updateCounter();" value="&nbsp;&nbsp;&nbsp;<spring:message code="submit.label" />&nbsp;&nbsp;&nbsp;" />
						 <input type="button" class="btnCls buttonMargin"  onclick="return viewCounterMaster('counterMaster','0');" value="<spring:message code="cancel.label" />" />
						</div>
					<br/>
					
					 <input type="hidden" id="createdOnStr" value ="${createdOnStr}">
					
                    <div class="box-footer">
                    </div>
                   
                    
                   
                     <!--added by manasa  -->
                   <input type="hidden" id="counterLocation" value ="${location}">
                  
                   <input type="hidden" id="searchCounterMaster" value ="${searchName}">
                   <input type="hidden" id="maxRecords" value ="${maxRecords}">
                      <input type="hidden" id="counterLoc" value ="${location }">
                                    <input type="hidden" id="counterDev" value ="${device }">
                                    <input type="hidden" id="counterTyp" value ="${type }">
             </form>
             <%--  </c:forEach> --%>
      </div>

</div>
</div>
</section><!-- /.content -->
</body>
</html>