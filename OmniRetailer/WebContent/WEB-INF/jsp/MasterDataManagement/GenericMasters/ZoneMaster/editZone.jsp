<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : admin/genericData/editZone.jsp
 * file type		        : JSP
 * description				: The new employee form is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/controller.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/masterDataManagement/genericMasters/zoneMaster.js"></script>
<%-- 	<script src="${pageContext.request.contextPath}/js/demo-compiled.js"></script> --%>
	<%--  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css"> --%>
<style type="text/css">
.calendar_icon{
	background-color: white;
    color: #666;
    padding: 8px 0px 8px 27px!important;
    background: url(http://soe.syr.edu/images/cal_icon_mini.gif) no-repeat left center #fff;
    width: 100%;
    background-position: 5px 5px;
    border: 1px solid #DFDFDF;
    border-radius: 4px;
    -webkit-transition: all .2s ease-out;
    -moz-transition: all .2s ease-out;
    -ms-transition: all .2s ease-out;
    transition: all .2s ease-out;
    box-shadow: none;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
	.col-xs-12 {
	 padding: 2% 10%;
	 }
</style>
<script type="text/javascript">
$(document).ready(function(){
 var phoneNo = $("#phone").val();
	phoneNo = phoneNo.split('-');
	if(phoneNo.length == 1)
		$("#phoneNumber").val(phoneNo[0]);
	else{
	/* 	$("#defaultCountry").val(phoneNo[0]); */
		$("#phoneNumber").val(phoneNo[1]);
	} 
 	  $("#firstName").keydown(function(){
 		   $("#firstNameError").html("");
		   $("#Error").html("");
 	 });
 	  debugger
 	 var slectedLocations = $("#slectedLocations").val().replace('[','').replace(']','').replace(/, /g,',');
 	$("#location").val(slectedLocations.split(','));
 	
 	
 	$("#phoneNumber").keydown(function(){
		   $("#phoneNumberError").html("");
		   $("#Error").html("");
	 });
	
 	
});

	</script>
	
	
	<!--  added by        :  koti bomminei
      description     :  to ristrict the user from entering special characters     -->


</head>
<body>
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
				<div class="box box-primary">
                                <div class="box-header" style="text-align: center">
                                <br/>
                                <h3><spring:message code="edit.zone.header.label" /></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form id="newEmployee" method="post">
                                    <div class="box-body">
                                    <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${err}</div>
                        			<div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
                                   	<div class="row">
                                    	 <div class="form-group col-lg-6">
                                    	 	<div class="row">
                                    	 		<%-- <div class="col-lg-6">
		                                            <label><spring:message code="zone.name.label" /> <span style="color:red; font-size:2">*</span></label>
		                                            <input type="text" class="form-control"  name="zoneID" value="${zone.zoneID}" id="zoneID" required placeholder="<spring:message code="enter.zone.name.label" />" />
	  		                                        <span id="zoneIDError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                    	 		</div> --%>
                                    	 		<div class="form-group col-lg-12">
                                                   <label><spring:message code="zone.name.label" /><span style="color:red; font-size:2">*</span></label>
                                                     <select class="form-control" name="zoneID" id="zoneID">
                                                       <c:forEach var="locationStr" items="${locationStr}"> 
									                      <option value="${locationStr}"${locationStr == zone.zoneID ? 'selected' : ''} id="locationZone" >${locationStr}</option>
								                       </c:forEach>
							                          </select>
							                           <span id="workLocationZoneError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                                 </div>
                                    	 	</div>
                                    	 	
                                    	 	<div class="row">
                                    	 		<div class="form-group col-lg-12">
		                                            <label><spring:message code="selectAddress.label" /></label>
		                                            <input type="text" onblur="criteria(this)" class="form-control"  id="locality" placeholder="<spring:message code="enter.locality.label" />" />
                                    	 		</div>
                                    	 		
                                    	 		
                                    	 	</div>
                                    	 	
                                    	 	<div class="row">
                                    	 	
                                    	 	<div class=" col-lg-6 ">
                                            <label><spring:message code="longitude.label" /> </label>
                                            <input type="text" class="form-control" value="${zone.gpsLongitude}"  id="gpsLongitude"  placeholder="<spring:message code="enter.longitude.label" />" />
                                           
                                        </div>
                                        
                                        <div class="form-group col-lg-6">
                                            <label><spring:message code="lattitude.label" /></label>
                                             <input type="text" class="form-control"  value="${zone.gpsLatitude}" id="gpsLatitude" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.lattitude.label" />" />
				                         
                                        </div>
                                    	 	
                                    	 	</div>
                                    	 	
                                    	 	
                                    	 	<div class="row">
                                    	 		<div class="col-lg-12">
                                    	 			<label style="margin-top: 5px;"><spring:message code="zonal.office.label" /> <span style="color:red; font-size:2">*</span></label>
		                                            <textarea class="form-control" onblur="criteria(this)" style="resize:none;" name="addressOne" id="addressOne" required placeholder="<spring:message code="address1.label" />" >${zone.addressOne}</textarea>
	  		                                        <span id="addressOneError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	  		                                        <textarea class="form-control" onblur="criteria(this)" style="margin-top: 5px;resize:none;" name="addressTwo" id="addressTwo" required placeholder="<spring:message code="address2.label" />" >${zone.addressTwo}</textarea>
	  		                                        <span id="address2Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						                           	 <div class="row" style="margin-top: 5px;">
						                                  <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
						                                  	<select class="form-control"  id="defaultCountry" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
						                                  		<option selected="selected">${sessionScope.countryCode}</option>
						                                  	<!-- <option>US</option>
						                                  	<option>GB</option>
						                                  	<option>AU</option> -->
						                                  	</select>
						                                  	<!-- <input type="text" onfocus="displayToolTip();" class="form-control" id="defaultCountry" maxlength="2" oninput="this.value = this.value.replace(/[^A-Za-z]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/> -->
						                                  </div>
						                                  <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
						                                  	<input type="text" class="form-control" placeholder="<spring:message code="supplier.phone.label" />" id="phoneNumber" size="15" maxlength="15" onBlur="validateMobileNumber()" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
						                                  </div>
						                                  <input type="hidden" class="form-control" name="phone" id="phone"  value="${zone.phoneNum}"/>
						                                   <input type="hidden" id="output" />
						                             </div>
						                             <span id="phoneNumberError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
<!-- 						                        	<span id="error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> -->
                                    	 		</div>
                                    	 	</div>
                                    	 	
                                    	 	<div class="row">
                                         <div class="form-group col-lg-12">
                                            <label><spring:message code="description.label" /></label>
                                            <textarea class="form-control" onblur="criteria(this)" style="resize:none;" rows="2" name="zoneDescription" id="zoneDescription" required placeholder="<spring:message code="enter.description.label" />" >${zone.zoneDescription}</textarea>
                                            <span id="DescError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                     </div>
                                    	 	
                                        </div>
										<div class="form-group col-lg-6">
                                           <label><spring:message code="zonal.locations.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <select class="form-control" multiple="multiple" style="height: 387px;" name="location" id="location">
                                             <c:forEach var="locationDetails" items="${locationDetails}">
												<option value="${locationDetails.locationId}+${locationDetails.businessActivity}">${locationDetails.locationId}</option>
											</c:forEach>
                                           </select>
                                           <input type="hidden" id="slectedLocations" value="${zone.zones}">
                                        </div>
                                        </div>
                                        
						<div class="row" style="text-align: center;">
						 <input type="button" style="" class="btnCls" onclick="validateZone('edit')" value="<spring:message code="submit.label" />" />
						  <c:if test="${sessionScope.role == 'super admin'}"> 
						  	<input type="button" class="btnCls"  onclick="viewZoneMaster('zoneMaster','0','');" value="<spring:message code="cancel.label" />" />
						  </c:if>
						 <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                             <c:if test="${accessControl.appDocument == 'ZoneMaster' && accessControl.write == true && accessControl.read == true}">
								<input type="button" class="btnCls buttonMargin"  onclick="viewZoneMaster('zoneMaster','0','');" value="<spring:message code="cancel.label" />" />
							</c:if>
						</c:forEach>
						</div>
									<br/>
                                    <div class="box-footer"></div>
                                    </div>
                                    
                                     <input type="hidden" value="${maxRecords}" id="maxRecords"/>
                           <input type="hidden" value="${searchName}" id="searchZone"/>
                                </form>
                            </div>

</div>
</div>
</section><!-- /.content -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDHNN78JQSuDoLAZigF4cTbHgyeduFpVn8&libraries=places&callback=initAutocomplete"
         async defer></script>
</body>
</html>