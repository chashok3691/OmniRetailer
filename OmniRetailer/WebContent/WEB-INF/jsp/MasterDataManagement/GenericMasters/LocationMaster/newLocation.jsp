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
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/countries.js"></script>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/controller.js"></script>
	<script src="${pageContext.request.contextPath}/js/demo-compiled.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/masterDataManagement/genericMasters/locationMaster.js"></script>
	<%-- <script src="${pageContext.request.contextPath}/js/jquery.form-validator.min.js"></script> --%>
	
	<%--  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css"> --%>
<style type="text/css">
	.col-xs-12 {
	 padding: 2% 10%;  
	 }
</style>
<script type="text/javascript">
$(document).ready(function(){
		//$("#address").focus();
		
	//	$.validate();
	print_country("country");
	var selectedCountry = $("#selectedCountry").val();
	var selectedState = $("#selectedState").val();
	if(selectedCountry == ""){
		$("#country").val("India");
		print_state('state',104);
	}else{
		var id = getCountryIndex(selectedCountry);
		print_state('state',id);
		$("#country").val(selectedCountry);
		$("#state").val(selectedState);
	}
	/* var phoneNo = $("#officePhone").val();
	phoneNo = phoneNo.split('-');
	if(phoneNo.length == 1)
		$("#phoneNumber").val(phoneNo[0]);
	else{
		$("#defaultCountry").val(phoneNo[0]);
		$("#phoneNumber").val(phoneNo[1]);
	} */
$("#locationId").on('input',function(e){
    $(".Error").html("");
    $("#locationIdError").html("");
});
$("#address").on('input',function(){
	    $(".Error").html("");
	    $("#streetNameError").html("");
});
$("#area").on('input',function(){
    $(".Error").html("");
    $("#areaError").html("");
});
$("#city").on('input',function(){
    $(".Error").html("");
    $("#cityError").html("");
});
$("#pin").on('input',function(){
    $(".Error").html("");
    $("#pinError").html("");
});
$("#country").on('input',function(){
    $(".Error").html("");
});

$("#gpsLongitude").on('input',function(){
    $(".Error").html("");
    $("#gpsLongitudeError").html("");
});
$("#gpsLatitude").on('input',function(){
    $(".Error").html("");
    $("#gpsLatitudeError").html("");
});
$("#customergstin").on('input',function(){
    $(".Error").html("");
    $("#gstnNoError").html("");
});
$("#distance").on('input',function(){
    $(".Error").html("");
    $("#distanceError").html("");
});

$("#officeMailId").on('input',function(){
    $(".Error").html("");
    $("#officeMailIdError").html("");
});
$("#officeMailId").blur(function(){
 	  var email = $("#officeMailId").val().trim();
 	  if(email==""){
 		 return false;
 	  }
	  if(!emailValidation(email)){
	   	$("#officeMailIdError").html("Invalid EmailId (Ex:abc@gmail.com)");
	   	return false;
	  }
	  else{
		$("#officeMailIdError").html("");
	    return true;
	  }
	});  
$("#description").on('input',function(){
    $(".Error").html("");
});
});
</script>


<!--  added by        :  koti bomminei
      description     :  to ristrict the user from entering special characters     -->

<script type="text/javascript">

</script>
	
	
	 


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
                   <h3><spring:message code="new.location.label" /></h3>
                   </div><!-- /.box-header -->
                   <!-- form start -->
                     <form id="newLocation" method="post">
                       <div class="box-body">
                      	<div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${err}</div>
                        <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
                        <div class="row">
                        <div class="form-group col-lg-4"></div>
                       	 <div class="form-group col-lg-4">
                            <label style="color:gray;"><spring:message code="location.id.label" /> <span style="color:red; font-size:2">*</span></label>
                            <input type="text" onblur="criteria(this)" class="form-control" id="locationId" name="locationId" value="${locationDetails.locationId}" oninput="this.value = this.value.replace(/[^a-zA-Z0-9 -]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                            <span id="locationIdError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                         </div>
                         <div class="form-group col-lg-4"></div>
                        </div>
                       <div class="row">
                          <div class="form-group col-lg-4">
                            <label style="color:gray;"><spring:message code="office.phone.label" /> <span style="color:red; font-size:2">*</span></label>
                           	 <div class="row">
                                  <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                  	<select class="form-control"  id="defaultCountry" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
                                  	<option value="${sessionScope.countryCode}">${sessionScope.countryCode}</option>
                                  	<!-- <option>US</option>
                                  	<option>GB</option>
                                  	<option>AU</option> -->
                                  	</select>
                                  	<!-- <input type="text" onfocus="displayToolTip();" class="form-control" id="defaultCountry" maxlength="2" oninput="this.value = this.value.replace(/[^A-Za-z]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/> -->
                                  </div>
                                  <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
                                  	<input type="text" class="form-control" placeholder="<spring:message code="enter.office.phone" />" id="phoneNumber" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                  </div>
                                  <input type="hidden" class="form-control" name="officePhone" id="officePhone"  value="${locationDetails.officePhone}"/>
                                   <input type="hidden" id="output" />
                             </div>
                        	<span id="error3" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                            <%-- <input type="text" class="form-control" id="officePhone" name="officePhone" placeholder="<spring:message code="enter.office.phone" />" />
                        	<span id="officePhoneError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> --%>
                         </div>
                          <div class="form-group col-lg-4">
                            <label style="color:gray;"><spring:message code="office.mailId.label" /> <span style="color:red; font-size:2">*</span></label>
                            <input type="text" class="form-control" id="officeMailId" name="officeMailId" placeholder="<spring:message code="enter.office.mailId" />" value="${locationDetails.officeMailId}" />
                         	<span id="officeMailIdError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                         </div>
                         <div class="form-group col-lg-4">
                            <label style="color:gray;"><spring:message code="business.activity.label" /></label>
                                 <select class="form-control" id="businessActivity" name="businessActivity" >
                                    <option value="Restaurant" ${'Restaurant' == locationDetails.businessActivity ? 'selected' : ''}>Restaurant</option>
                                    <option value="Retail Outlet" ${'Retail Outlet' == locationDetails.businessActivity ? 'selected' : ''}>Retail Outlet</option>
                                    <option value="Warehouse" ${'Warehouse' == locationDetails.businessActivity ? 'selected' : ''}>Warehouse</option>
                                    <option value="BackOffice" ${'BackOffice' == locationDetails.businessActivity ? 'selected' : ''}>BackOffice</option>
                                    <option value="Corporate Office" ${'Corporate Office' == locationDetails.businessActivity ? 'selected' : ''}>Corporate Office</option>
                                    <option value="Administration" ${'Administration' == locationDetails.businessActivity ? 'selected' : ''}>Administration</option>
                                    <option value="Zone" ${'Zone' == locationDetails.businessActivity ? 'selected' : ''}>Zone</option>
                                    <option value="Franchise " ${'franchise ' == locationDetails.businessActivity ? 'selected' : ''}>Franchise</option>
                                    <option value="Groceries" ${'Groceries' == locationDetails.businessActivity ? 'selected' : ''}>Groceries</option>
                                    <option value="F & V" ${'F & V' == locationDetails.businessActivity ? 'selected' : ''}>F & V</option>
                                    <option value="Meat Shops" ${'Meat Shops' == locationDetails.businessActivity ? 'selected' : ''}>Meat Shops</option>
                                </select>
                        </div>
                      </div>
                       <div class="row">
                          <div class="form-group col-lg-4">
                            <label style="color:gray;"><spring:message code="country.label" /></label>
                            <select onchange="print_state('state',this.selectedIndex);" id="country" name ="country" class="form-control" >
							</select>
                         <input type="hidden" id="selectedCountry" value="${locationDetails.country}"></input>
                         </div>
                         <div class="form-group col-lg-4">
                            <label style="color:gray;"><spring:message code="state.label" /></label>
                            <select id ="state" class="form-control" name="state">
								<!-- <option >Select State</option> -->
							</select>
                          <input type="hidden" id="selectedState" value="${locationDetails.state}"></input>
                         </div>
                         <div class="form-group col-lg-4">
                            <label style="color:gray;"><spring:message code="city.label" /> <span style="color:red; font-size:2">*</span></label>
                            <input type="text" onblur="criteriaSlashes(this)" class="form-control" id="city" name="city" placeholder="<spring:message code="enter.city" />" value="${locationDetails.city}" />
                        	<span id="cityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                         </div>
                         </div>
                       <div class="row">
                         <div class="form-group col-lg-4">
                            <label style="color:gray;"><spring:message code="street.name.label" /> <span style="color:red; font-size:2">*</span></label>
                            <input type="text" onblur="criteriaSlashes(this)" class="form-control" id="address" name="address" placeholder="<spring:message code="enter.street.name" />" value="${locationDetails.address}" />
                         	<span id="streetNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                         </div>
                         <div class="form-group col-lg-4">
                            <label style="color:gray;"><spring:message code="area.label" /> <span style="color:red; font-size:2">*</span></label>
                            <input type="text" onblur="criteriaSlashes(this)" class="form-control" id="area" name="area" placeholder="<spring:message code="enter.area" />" value="${locationDetails.area}" />
                        	<span id="areaError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                         </div>
                          <div class="form-group col-lg-4">
                            <label style="color:gray;"><spring:message code="pin.label" /> <span style="color:red; font-size:2">*</span></label>
                            <input type="text" class="form-control" id="pin" name="pin" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.pin" />" value="${locationDetails.pin}"  />
                            <span id="pinError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                         </div>
                         </div>
                         
                         
                         <div class="row">
                         <div class="form-group col-lg-4">
                            <label style="color:gray;"><spring:message code="zone.label"/></label>
                           <select class="form-control" id="outletZone" onchange="searchZonallocationsBasedOnZone('outletZone','outletLocation','')">
                           		 <%-- <option value=""><spring:message code="ALL.label"/></option> --%>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
                         </div>
                         <div class="form-group col-lg-4">
                            <label style="color:gray;">GpsLongitude<span style="color:red; font-size:2"></span></label>
                            <input type="text" onblur="criteriaSlashes(this)" class="form-control" id="gpsLongitude" name="gpsLongitude" placeholder="GpsLongitude" value="${locationDetails.gpsLongitude}" />
                        	<span id="gpsLongitudeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                         </div>
                          <div class="form-group col-lg-4">
                            <label style="color:gray;">GpsLatitude<span style="color:red; font-size:2"></span></label>
                            <input type="text" class="form-control" id="gpsLatitude" name="gpsLatitude" placeholder="GpsLatitude" value="${locationDetails.gpsLatitude}"  />
                            <span id="gpsLatitudeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                         </div>
                         </div>
                         
                         
                         <div class="row">
                         <div class="form-group col-lg-4">
                            <label style="color:gray;">Customer GSTIN <span style="color:red; font-size:2"></span></label>
                            <input type="text" onblur="criteriaSlashes(this)" class="form-control" id="customergstin" name="gstnNo" placeholder="GstnNo" value="${locationDetails.gstnNo}" />
                         	<span id="gstnNoError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                         </div>
                         <div class="form-group col-lg-4">
                            <label style="color:gray;">Distance<span style="color:red; font-size:2"></span></label>
                            <input type="text" onblur="criteriaSlashes(this)" class="form-control" id="distance" name="distance" placeholder="Distance" value="${locationDetails.distance}" />
                        	<span id="distanceError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                         </div>
                          <div class="form-group col-lg-4">
                           <label style="color:gray;">Franchise Code</label>
                           <input type="text" class="form-control" id="franchiseCode" name="franchiseCode" placeholder="franchise Code" value="${locationDetails.franchiseCode}" />
                          </div>

                         </div>
                         
                         
						 <div class="row">
                           <div class="form-group col-lg-12">
	                            <label><spring:message code="description.label" /></label>
	                            <textarea rows="2" onblur="criteriaSlashes(this)" id="description" name="description" style="resize: none;" class="form-control allField" placeholder="<spring:message code="enter.description.label" />" >${locationDetails.description}</textarea>
	                            <span id="descriptionError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                           </div>
                        </div>
                         
						 
                       </div><!-- /.box-body -->
                      
						<br>			
						<div class="row" style="text-align: center;">
						 <input type="button" style="" class="btnCls" onclick="validateLocationForm('new');" value="<spring:message code="submit.label" />" />
						  <c:if test="${sessionScope.role == 'super admin'}"> 
						  	<input type="button" class="btnCls buttonMargin" onclick="return viewLocationMaster('locationMaster','0');" value="<spring:message code="cancel.label" />" />
						  </c:if>
						<c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                            <c:if test="${accessControl.appDocument == 'LocationMaster' && accessControl.write == true && accessControl.read == true}">
						 		<input type="button" class="btnCls buttonMargin" style="" onclick="return viewLocationMaster('locationMaster','0');" value="<spring:message code="cancel.label" />" />
						 	</c:if>
						 </c:forEach>
						</div>
					<br/>
                    <div class="box-footer">
                                    
                    </div>
                    
                    
   					<input type="hidden" value="${maxRecords}" name="maxRecords" id="maxRecords"/>
                    <input type="hidden" value="${searchName}" id="searchLocation"/>
                    <input type="hidden" value="${searchName}" name="searchCriteria" id="searchCriteria"/>
                    
                    <input type="hidden" value="${sessionScope.multipleUserDB}" id="multipleUserDB"/>
                                        
                    
             </form>
      </div>

</div>
</div>
</section><!-- /.content -->
</body>
</html>