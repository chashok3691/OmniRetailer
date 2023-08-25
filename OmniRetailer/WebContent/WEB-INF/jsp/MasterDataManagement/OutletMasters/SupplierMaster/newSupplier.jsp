<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/master/newSupplier.jsp
 * file type		        : JSP
 * description				: The new supplier form is displayed using this jsp
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
	<%-- <script src="${pageContext.request.contextPath}/js/jquery-1.6.4.min.js"></script>
 --%>
 	<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
 	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
	<%-- <script type= "text/javascript" src = "${pageContext.request.contextPath}/js/countries.js"></script> --%>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/controller.js"></script>
	<script src="${pageContext.request.contextPath}/js/demo-compiled.js"></script>	
	<script src="${pageContext.request.contextPath}/js/masterDataManagement/outletMasters/supplierMaster.js"></script>
<style type="text/css">
		.labelheading{
	    background: #3c8dbc;
    color: #fff;
    padding: 5px 60px 5px 5px;
    font-size: 16px;
    }
	/*  .error{
	 border-color:red !important;
	 } */
	  .fa-star {
    font-size: 18px;
    display: block;
    color: #FFA500;
    padding: 2px 0px;
}
a:hover
{
	color:#45372D;
	text-decoration: none !important;
}
div.stars {
  width: 270px;
   display: inline-block; 
  display:table-row-group;
}

input.star { display: none; }

label.star {
  float: right;
  padding: 5px;
  font-size: 20px;
  color: #FFA500;
  transition: all .2s;
}

input.star:checked ~ label.star:before {
  content: '\f005';
  color: #FFA500;
  transition: all .25s;
}

input.star-5:checked ~ label.star:before {
  color: #FFA500;
  /* text-shadow: 0 0 20px #952; */
}

input.star-1:checked ~ label.star:before { color: #FFA500; }

/* label.star:hover { transform: rotate(-15deg) scale(1.3); } */

label.star:before {
  content: '\f006';
  font-family: FontAwesome;
}
.close {
    float: right;
    font-size: 20px;
    font-weight: 700;
    line-height: 1;
    color: #45372D !important;
    text-shadow: 0 1px 0 #fff;
    filter: alpha(opacity=20);
    opacity: 1 !important;
}
.framestyle
{
	width: 90%;
    height: 250px;
    border: 1px solid #45372D;
    margin-left: 0%;
}
</style>

<!--  added by        :  koti bomminei
      description     :  to ristrict the user from entering special characters     -->

	
	
	 


<script type="text/javascript">

$(document).ready(function(){
	//print_country("countryCode");
	//$("#countryCode").val("India");
	//$("#firmName").focus();
 	  $("#firmName").keyup(function(){
	// $("#firmName").addClass("error");
 		   $("#firmNameError").html("");
		   $(".Error").html("");
 	 });
 	 
 	 $("#plotNo").keydown(function(){
 		   $("#plotNoError").html("");
		   $(".Error").html("");
 	 }); 
 	 $("#streetName").keydown(function(){
		   $("#streetNameError").html("");
		   $(".Error").html("");
	 });
 	 $("#city").keydown(function(){
 		   $("#cityError").html("");
		   $(".Error").html("");
	 });
 	 $("#zipCode").keydown(function(){
 		   $("#zipCodeError").html("");
		   $(".Error").html("");
	 });
 	 
 	$("#countryCode").keydown(function(){
		   $("#countryCodeError").html("");
		   $(".Error").html("");
	 });
	 
	 $("#currencyCode").keydown(function(){
		   $("#currencyCodeError").html("");
		   $(".Error").html("");
	 }); 
	 $("#emailId").keydown(function(){
		   $("#emailIdError").html("");
		   $(".Error").html("");
	 });
	 $("#emailId").blur(function(){
	   	  var email = $("#emailId").val();
	   	  if(email==""){
	   		 return false;
	   	  }
	 	  if(!emailValidation(email)){
	 	   	$("#emailIdError").html("Invalid EmailId (Ex:abc@gmail.com)");
	 	   	return false;
	 	  }
	 	  else{
	 		$("#emailIdError").html("");
		    return true;
	 	  }
	 	});  
	 $("#phone").keyup(function(){
		   $("#phoneError").html("");
		   $(".Error").html("");
	 });
	 $("#shipmentMode").keydown(function(){
		   $("#shipmentModeError").html("");
		   $(".Error").html("");
	 });
	
	 $("#minOrderCost").keyup(function(){
		   $("#minOrderCostError").html("");
		   $(".Error").html("");
	 });
	 
	 $("#minQuantity").keyup(function(){
		   $("#minQuantityError").html("");
		   $(".Error").html("");
	 }); 
	 $("#leadTime").keyup(function(){
		   $("#leadTimeError").html("");
		   $(".Error").html("");
	 });
	 $("#uom").keydown(function(){
		   $("#uomError").html("");
		   $(".Error").html("");
	 });
	 $("#pan").keydown(function(){
		   $("#PANNumberError").html("");
		   $(".Error").html("");
	 });
	 
 	 $("#websiteUrl").keydown(function(){
		   $(".Error").html("");
	 });
 	 $("#mobile").keyup(function(){
		   $(".Error").html("");
	 });
 	 $("#fax").keyup(function(){
		   $(".Error").html("");
	 });
 	 $("#paymentTerms").keydown(function(){
		   $(".Error").html("");
	 });
 	 $("#shipmentTerms").keydown(function(){
		   $(".Error").html("");
	 });
 	$("#targetOrderValue").keydown(function(){
		   $(".Error").html("");
	 });
	 $("#rFactor").keyup(function(){
		   $(".Error").html("");
	 });
	 $("#maxFactor").keyup(function(){
		   $(".Error").html("");
	 });
	 $("#phoneNumber1").keydown(function(){
		 $("#error1").html("");
		 $(".Error").html("");
	 });
	 $("#defaultCountry1").keydown(function(){
		 $("#error1").html("");
		$(".Error").html("");
	 });
	$("#phoneNumber1").blur(function(){
		var phoneNumber = $("#phoneNumber1").val().trim();
		if(phoneNumber != ""){
			validatePhoneNumber1() ;
		}
	});
		$("#defaultCountry1").change(function(){
			$("#error1").html("");
			$(".Error").html("");
			var phoneNumber = $("#phoneNumber1").val().trim();
			if(phoneNumber != ""){
				validatePhoneNumber1() ;
			}
		});
});
function validatePhoneNumber1(){
		
		 phoneNumberParser1();
		 var output = $("#output1").val();
		 if(output.indexOf(":")<0){
			 $("#error1").html(output);
			 return false;
		 }
		 var result = output.split(",");
		 for(var i=0;i<result.length; i++){
			 var val=result[i].split(":");
			 if(val[1] != "true"){
				 $("#error1").html("Invalid Phone Number");
				 return false;
			 }
		 }
	 }	
	</script>
</head>
<body>

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
				<div class="box box-primary">
                       <div class="box-header" style="text-align: center">
                       <h3><spring:message code="new.supplier.header.label" /></h3>
                       </div><!-- /.box-header -->
                       
                       <!-- form start -->
                       
                       <div class="row">
	        			<div class="col-lg-3"></div>
                       	<div class="col-lg-6">
                       		<div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${err}</div>
	        				<div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${succcess}</div>
                       	</div>
                       	<div class="col-lg-3">
                       		<div class="row">
                             <div class="col-sm-12">
                            <label><spring:message code="supplier.rating.label" /> <span style="color:red; font-size:2"></span></label> 
							<div class="stars">
							    <input class="star star-5" id="star-5" type="radio" name="star" onclick="userRating('5');"/>
							    <label class="star star-5" for="star-5"></label>
							    <input class="star star-4" id="star-4" type="radio" name="star" onclick="userRating('4');"/>
							    <label class="star star-4" for="star-4"></label>
							    <input class="star star-3" id="star-3" type="radio" name="star" onclick="userRating('3');"/>
							    <label class="star star-3" for="star-3"></label>
							    <input class="star star-2" id="star-2" type="radio" name="star" onclick="userRating('2');"/>
							    <label class="star star-2" for="star-2"></label>
							    <input class="star star-1" id="star-1" type="radio" name="star" onclick="userRating('1');"/>
							    <label class="star star-1" for="star-1"></label>
							</div>
                             </div>
                              </div>
                       	</div>
                       </div>
                       <form id="newSupplier" method="post">
                           <div class="box-body">
                          	<div class="row">
								 <div class="form-group col-lg-3">
								 <input type="hidden" id="userRating1" name="rating" value="" >
                                   <label><spring:message code="supplier.firm.name.label" /> <span style="color:red; font-size:2">*</span></label>
                                   <div class=" col-lg-11" style="padding-left: 0px">
                                   <input type="text" onblur="criteria(this)" class="form-control" name="firmName" id="firmName" required placeholder="<spring:message code="supplier.enter.firm.name.label" />" />
                                		<span id="firmNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
								</div>
								</div>
								<div class="form-group col-lg-3">
                                   <label><spring:message code="supplier.plot.no.label" /> <span style="color:red; font-size:2">*</span></label>
                                 <div class=" col-lg-11" style="padding-left: 0px">
                                   <input type="text" onblur="criteria(this)" class="form-control" name="plotNo" id="plotNo" required placeholder="<spring:message code="supplier.enter.plot.no.label" />" />
                               		<span id="plotNoError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
								</div>
								</div>
                             
                               <div class="form-group col-lg-3">
                                   <label><spring:message code="supplier.street.name.label" /> <span style="color:red; font-size:2">*</span></label>
                                  <div class=" col-lg-11" style="padding-left: 0px">
                                   <input type="text" class="form-control" onblur="criteria(this)" name="streetName" id="streetName" required placeholder="<spring:message code="supplier.enter.street.name.label" />" />
                               		<span id="streetNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	 						   </div>
	 						   </div>
                                <div class="form-group col-lg-3">
                                   
                                  <div class=" col-lg-8" style="padding-left: 0px">
                                  <label><spring:message code="supplier.city.label" /> <span style="color:red; font-size:2">*</span></label>
                                   <input type="text" onblur="criteria(this)" class="form-control" name="city" id="city" required placeholder="<spring:message code="supplier.enter.city.label" />" />
                               		<span id="cityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
								 </div>
								 </div>
								</div>
                            
                               <div class="row">
                               
                               
                               
                                 <div class="form-group col-lg-3">
                                <div class=" col-lg-10" style="padding-left: 0px">
                                  <label><spring:message code="shipment.state.label" /><span style="color:red; font-size:2">*</span></label>
                                       <select class="form-control" name="state" id="state" style="width: 100%;">
	                                       <option value="" >Select state</option>
	                                        <c:forEach var="states" items="${states.stateMasters}">
	                            			 <option value="${states.stateName}" >${states.stateName}</option>
	                                        
											</c:forEach>
	                                        
	                                            </select>
										 
                                         <span id="shipmentStateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     
								</div>
								</div>
                               
                               
                               
                               
                                <div class="form-group col-lg-3">
                                <div class=" col-lg-8" style="padding-left: 0px">
                                   <label><spring:message code="supplier.zip.code.label" /> <span style="color:red; font-size:2">*</span></label>
                                   <input type="text" class="form-control" name="zipCode" id="zipCode" required  oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="supplier.enter.zip.code.label" />" />
                               		<span id="zipCodeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
								</div>
								</div>
                                <div class="form-group col-lg-3">
                                <div class=" col-lg-8" style="padding-left: 0px">
                                   <label><spring:message code="supplier.country.code.label" /> <span style="color:red; font-size:2">*</span></label>
                                    <select id="countryCode" class="form-control" onChange="list(this.value)" >
									</select>
									<input type="hidden" name ="countryCode" id="selectedCountry" value="">
                                   <%-- <input type="text" class="form-control" name="countryCode" id="countryCode" required placeholder="<spring:message code="supplier.enter.country.code.label" />" /> --%>
                               		<span id="countryCodeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
								</div>
								</div>
                                <div class="form-group col-lg-3">
                                <div class=" col-lg-8" style="padding-left: 0px">
                                   <label><spring:message code="supplier.currency.code.label" /> <span style="color:red; font-size:2">*</span></label>
                                   <input type="text" class="form-control" readonly="readonly" id="currencyCode" value="" />
                                   <input type="hidden" name="currencyCode" id="selectedCurrency" value="">
                               		<span id="currencyCodeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
								</div>
								</div>
								<%-- <div class="form-group col-lg-3">
								<div class=" col-lg-10" style="padding-left: 0px">
                                   <label><spring:message code="supplier.website.url.label" /></label>
                                   <input type="text" class="form-control" name="websiteUrl" id="websiteUrl"  placeholder="<spring:message code="supplier.enter.website.url.label" />" />
                               </div>
                               </div> --%>
                               </div>
                               <div class="row">
                               
                               <div class="form-group col-lg-3">
								<div class=" col-lg-10" style="padding-left: 0px">
                                   <label><spring:message code="supplier.website.url.label" /></label>
                                   <input type="text" class="form-control" name="websiteUrl" id="websiteUrl"  placeholder="<spring:message code="supplier.enter.website.url.label" />" />
                               </div>
                               </div> 
                               
                                <div class="form-group col-lg-3">
                                <div class=" col-lg-10" style="padding-left: 0px">
                                   <label><spring:message code="supplier.emailId.label" /> <span style="color:red; font-size:2">*</span></label>
                                   <input type="text" class="form-control" name="emailId" id="emailId" required placeholder="<spring:message code="supplier.enter.emailId.label" />" />
                               		<span id="emailIdError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                               		</div>
                               		</div>
                                <div class="form-group col-lg-3">
                                <div class=" col-lg-10" style="padding-left: 0px">
                                   <label><spring:message code="supplier.phone.label" /> <span style="color:red; font-size:2">*</span></label>
                                      <div class="row">
                                  <div class="col-lg-5 col-md-5 col-sm-4 col-xs-4">
                                  	<select class="form-control" style="padding: 6px 8px;" id="defaultCountry" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
                                  		<option selected="selected">IN</option>
                                  		<option>US</option>
                                  		<option>GB</option>
                                  		<option>AU</option>
                                  	</select>
                                  </div>
                                  
                                  <div class="col-lg-7 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
                                  	<input type="text" class="form-control" placeholder="<spring:message code="supplier.enter.phone.label" />" id="phoneNumber" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                  </div>
                                  <input type="hidden" class="form-control" name="phone" id="phone"  value=""/>
                                   <input type="hidden" id="output" />
                             </div>
                             </div>
                            <span id="error" style="text-align:right;color: red;font-size: 2;font-weight: bold; white-space: break-spaces;"></span>
								</div>
                                <div class="form-group col-lg-3">
                                 <div class=" col-lg-10" style="padding-left: 0px">
                                   <label><spring:message code="supplier.mobile.label" /></label>
                                   <div class="row">
                                  <div class="col-lg-5 col-md-4 col-sm-4 col-xs-4">
                                  	<select style="padding: 6px 8px;" class="form-control" id="defaultCountry1" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
                                  		<option selected="selected">IN</option>
                                  		<option>US</option>
                                  		<option>GB</option>
                                  		<option>AU</option>
                                  	</select>
                                  </div>
                                  <div class="col-lg-7 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
                                  	<input type="text" class="form-control" placeholder="<spring:message code="supplier.enter.mobile.label" />" id="phoneNumber1" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                  </div>
                                  <input type="hidden" class="form-control" name="mobile" id="mobile"  value=""/>
                                   <input type="hidden" id="output1" />
                             </div>
                             </div>
                            <span id="error1" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                   
                                 <%--   <input type="text" class="form-control" name="mobile" id="mobile"  placeholder="<spring:message code="supplier.enter.mobile.label" />" / --%>
                               </div>
                               <%--  <div class="form-group col-lg-3">
                                 <div class=" col-lg-9" style="padding-left: 0px">
                                   <label><spring:message code="supplier.fax.label" /></label>
                                   <input type="text" class="form-control" name="fax" id="fax"  oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"  placeholder="<spring:message code="supplier.enter.fax.label" />" />
                               </div>
                               </div> --%>
                               </div>
                              
                               <div class="row">
                                <div class="form-group col-lg-3">
                                 <div class=" col-lg-10" style="padding-left: 0px">
                                   <label><spring:message code="supplier.shipment.mode.label" /> <span style="color:red; font-size:2">*</span></label>
                                    <select class="form-control" name="shipmentMode" id="shipmentMode">
                                   <option value="Land-Goods Rail"><spring:message code="shippment.mode.goods.rail.label" /></option>
                                   <option value="Land-Private Career"><spring:message code="shippment.mode.private.career.label" /></option>
                                   <option value="Air Freight"><spring:message code="shippment.mode.air.freight.label" /></option>
                                   <option value="Sea Transport"><spring:message code="shipment.mode.sea.transport.label" /></option>
                                   <option value="Others"><spring:message code="shipment.mode.others.label" /></option>
                                   </select>
                               		<span id="shipmentModeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
								</div>
                                </div>
                               <div class="form-group col-lg-2">
                               
                                   <label><spring:message code="supplier.min.order.cost.label" /><span style="color:red; font-size:2">*</span></label>
                                    <div class=" col-lg-8" style="padding-left: 0px;padding-right: 40px">
                                   <input type="text" class="form-control" name="minOrderCost" id="minOrderCost"  oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"  required placeholder="<spring:message code="supplier.enter.min.order.cost.label" />" />
                               		<span id="minOrderCostError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
								</div>
								</div>
								<div class="form-group col-lg-1"></div>
                               <div class="form-group col-lg-2">
                               <label><spring:message code="supplier.min.quantity.label" /> <span style="color:red; font-size:2">*</span></label>
                                <div class=" col-lg-8" style="padding-left: 0px;padding-right: 40px">
                                   
                                   <input type="text" class="form-control" name="minQuantity" id="minQuantity"  oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" required placeholder="<spring:message code="supplier.enter.min.quantity.label" />" />
                               		<span id="minQuantityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
								</div>
								</div>
								<div class="form-group col-lg-1"></div>
                               <div class="form-group col-lg-1">
                                 <div class=" col-lg-12" style="padding-left: 0px;padding-right: 0px">
                               <label style="white-space: nowrap;"><spring:message code="supplier.lead.time.label" /> <span style="color:red; font-size:2">*</span></label>
                                   
                                   <input type="text" class="form-control" name="leadTime" id="leadTime"  oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" required placeholder="<spring:message code="supplier.enter.lead.time.label" />" />
                               		<span id="leadTimeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	 							</div>
	 							</div>
	 							
	 							<div class="form-group col-lg-2">
	 							<div class=" col-lg-12" style="padding-left: 0px;padding-right: 0px">
                               <label style="white-space: nowrap;">PAN Number</label>
                                   
                                   <input type="text" class="form-control" name="pan" id="pan" placeholder="Enter PAN" style="width: 88%;" onclick="ValidatePAN();" />
                               		<span id="PANNumberError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	 							</div>
	 							</div>
                               </div>
                             
                               <div class="row">
                               <div class="form-group col-lg-3">
                               
                                 <div class=" col-lg-5" style="padding-left: 0px;">
                                   <label><spring:message code="supplier.uom.label" /></label>
                                   <select class="form-control" name="uom" id="uom">
                                   <option value="KG">KG</option>
                                   <option value="Meters">Meters</option>
                                   <option value="Pieces">Pieces</option>
                                   <option value="Cases">Cases</option>
                                   </select>
                                  
                               		<span id="uomError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
								</div>
								<div class="form-group col-lg-7 allignment"style="padding-left: 0px;padding-right: 0px;">
								 <div class="col-lg-12" >
                                            <label><spring:message code="gstin.lael" /></label>
                                            <input type="text" name="gstn_num"  id="gstIn" class="form-control" placeholder="<spring:message code="enter.gstin.no.label"/>" />
                                            <span id="gstInError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                  </div>
								</div>
								</div>
								
                               <div class="form-group col-lg-3">
                                
                               <div class=" col-lg-8" style="padding-left: 0px;padding-right: 40px">
                                   <label><spring:message code="supplier.target.order.value.label" /></label>
                                   <input type="text" class="form-control" name="targetOrderValue" id="targetOrderValue"  oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="supplier.enter.target.order.value.label" />" />
                                    <span id="targetOrderValueError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                               </div>
                               </div>
                               <div class="form-group col-lg-3">
                                
                                   
                                  <div class=" col-lg-4" style="padding-left: 0px;padding-right: 20px">
                                  <label><spring:message code="supplier.rfactor.label" /></label>
                                   <input type="text" class="form-control" name="rFactor" id="rFactor"  oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"  placeholder="<spring:message code="supplier.enter.rfactor.label" />" />
                               </div>
                               
                               <div class="col-lg-6">
									<label><spring:message code="status.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" name="statusStr" id="statusStr">
											<option value="1">Active</option>
											<option value="0">Disabled</option>
											
										</select>
									</div>
								</div>
								
                               </div>
                            <div class="form-group col-lg-3">
                            <div class=" col-lg-6" style="padding-left: 0px;white-space:nowrap">
                                   <label><spring:message code="supplier.max.factor.label" /></label>
                                  
                                   <input type="text" class="form-control" name="maxFactor" id="maxFactor"  oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"  placeholder="<spring:message code="supplier.enter.max.factor.label" />" />
                               </div>
                               
                               <div class=" col-lg-6" style="padding-left: 0px;white-space:nowrap">
                                   <label><spring:message code="ProductRestrictions.label" /></label>
                                    <select class="form-control" name="productRestrictionsStr" id="productRestrictionsStr">                                 
                                   <option value="0">Yes</option>
                                   <option value="1">No</option>
                                   </select>
                               </div>
                               </div>
                             </div>  
                              <%-- <div class="row">
                                <div class="form-group col-lg-6">
                                 <div class="col-lg-12" style="padding-left: 0px;padding-right: 35px">
                                   <label><spring:message code="supplier.payment.terms.label" /></label>
                                   <textarea class="form-control" onblur="criteria(this)"  name="paymentTerms" id="paymentTerms" style="resize: none;" rows="2" placeholder="<spring:message code="supplier.enter.payment.terms.label" />" ></textarea>
                               </div>
                               </div>
                               <div class="form-group col-lg-6">
                               <div class="col-lg-11" style="padding-left: 0px">
                                   <label><spring:message code="supplier.shipment.terms.label" /></label>
                                   <textarea class="form-control" onblur="criteria(this)" name="shipmentTerms" id="shipmentTerms" style="resize: none;" rows="2" placeholder="<spring:message code="supplier.enter.shipment.terms.label" />" ></textarea>
                               </div>
                               </div>
                               </div> --%>
                               
                               <div class="row">
                                <div class="form-group col-lg-3">
                                   <label><spring:message code="supplier.payment.terms.label" /></label>
                                   <textarea class="form-control" onblur="criteria(this)"  name="paymentTerms" id="paymentTerms" style="resize: none;" rows="2" placeholder="<spring:message code="supplier.enter.payment.terms.label" />" ></textarea>
                                    <span id="paymentTermsError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                               </div>
                               <div class="form-group col-lg-3">
                                   <label><spring:message code="supplier.shipment.terms.label" /></label>
                                   <textarea class="form-control" onblur="criteria(this)" name="shipmentTerms" id="shipmentTerms" style="resize: none;" rows="2" placeholder="<spring:message code="supplier.enter.shipment.terms.label" />" ></textarea>
                                   <span id="shipmentTermsError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                               </div>
                               <div class="form-group col-lg-3">
                                   <label>Return Terms</label>
                                   <textarea class="form-control" onblur="criteria(this)" name="returnTerms" id="returnTerms" style="resize: none;" rows="2" placeholder="Enter Return Terms" ></textarea>
                               <span id="returnTermsError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                               </div>
                               <div class="form-group col-lg-3">
                                    <div class=" col-lg-6" style="padding-left: 0px;white-space:nowrap">
                                   <label>Return Days</label>
                                   <input type="text" class="form-control" name="returnDays" id="returnDays"  oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"  placeholder="Days" />
                               </div>
                               <div class="col-lg-6" style="padding-left: 0px;white-space:nowrap">
                                   <label>Markdown(%)</label>
                                   <input type="text" class="form-control" name="markdown" id="markdown"  oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"  placeholder="Enter value" />
                               </div>
                               </div>
                               </div>
                               
                               
                               <div class="row">
                            <div class="col-lg-12">
                            <label style="font-weight: bold !important;text-decoration: underline;">Addresses :</label>
                            <br>
                            <span id="flagError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                            </div>
                           <div class="col-lg-12 nopadding">
                             <div class="form-group col-lg-2">
                           		<label></label>
                              <select class="form-control" name="addessType" id="addessType">                                 
                                   <option value="Billing Address">Billing Address</option>
                                   <option value="Shipping Address">Shipping Address</option>
                               </select>
                             </div>
                             
                             <div class="form-group col-lg-7">
                             <div class="row">
                              <div class="form-group col-lg-3">
                              <label>Plot No/Building<span style="color:red; font-size:2">*</span></label>
                              <input type="text" class="form-control" id="buildingNo" placeholder="Enter plot no"/>
                              <span id="buildingNoError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                              </div>
                                 <div class="form-group col-lg-6" >
                                 <label>Street Name<span style="color:red; font-size:2">*</span></label>
                                 <input type="text" class="form-control " id="streetNameforAddress" placeholder="Enter Street Name"/>
                                 <span id="streetNameforAddressError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                 </div>
                                 <div class="form-group col-lg-3" >
                                 <label>Phone<span style="color:red; font-size:2">*</span></label>
                                 <input type="number" class="form-control" id="phonenoforAddress" placeholder="Enter Phone"/>
                                 <span id="phonenoforAddressError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                 </div>
                                </div>
                                       
                               <div class="row">
                                       <div class="form-group col-lg-3" style="margin-top: -15px;">
                                       <label>Location<span style="color:red; font-size:2">*</span></label>
                              <input type="text" class="form-control" id="locationforAddress" placeholder="Enter Location"/>
                              <span id="locationforAddressError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                              
                              </div>
                                 <div class="form-group col-lg-6" style="margin-top: -15px;">
                                  <div class="form-group col-lg-5 nopadding">
                                  <label>City<span style="color:red; font-size:2">*</span></label>
                                   <input type="text" class="form-control" id="cityforAddress" placeholder="Enter City"/>
                                   <span id="cityforAddressError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                 </div>
                                 <div class="form-group col-lg-2"></div>
                                 <div class="form-group col-lg-5 nopadding">
                                 <label>State<span style="color:red; font-size:2">*</span></label>
                                   <select class="form-control" name="stateforAddress" id="stateforAddress" style="width: 100%;">
	                                       <option value="" >Select state</option>
	                                        <c:forEach var="states" items="${states.stateMasters}">
	                            			 <option value="${states.stateName}" >${states.stateName}</option>
											</c:forEach>
	                                </select>
	                                 <span id="stateforAddressError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                 </div>
                                 </div>
                                       <div class="form-group col-lg-3" style="margin-top: -15px;">
                                       <label>Email<span style="color:red; font-size:2">*</span></label>
                                       <input type="email" class="form-control" id="emailIDforAddress" placeholder="Enter Email ID"/>
                                       <span id="emailIDforAddressError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                       </div>
                                       </div>
                                       </div>
                                       
                                       <div class="form-group col-lg-2 nopadding" style="width: 12% !important;">
                                   <div class="form-group col-lg-12 nopadding">
                                   <label><spring:message code="supplier.country.code.label" /> <span style="color:red; font-size:2">*</span></label>
                                    <select id="countryCodeforAddress" class="form-control" onChange="list(this.value)" >
									</select>
									<input type="hidden" name ="countryCodeforAdd" id="selectedCountry" value="">
                               		<span id="countryCodeforAddresError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                       </div>
                                       <div class="form-group col-lg-12 nopadding" style="margin-top: -15px;">
                                       <label>Pin Code<span style="color:red; font-size:2">*</span></label>
                                       <input type="number" class="form-control" id="pincodeforAddress" placeholder="Enter Pin Number"/>
                                       <span id="pincodeforAddressError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                       </div>
                                       </div>
                                       
                                       <div class="col-lg-1" style="margin-top: 20px;">
                                  		<input type="button" class="btn btn2Add bg-olive btn-inline" onclick="addAddresses();" value="Add Address" />
                                       </div>
                                       
                                       </div>
                                      
                           </div>
                           
                                          <div class="table-responsive">
                                        <table id="supplierAddresses" class="table table-bordered table-striped" style="white-space: nowrap;overflow-x: auto;">
                                        <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><spring:message code="s.no.label" /></th>
                                                <th>Address Type</th>
                                                <th>Plot/Building Name</th>
                                                <th>Road/Street Name</th>
                                                <th>Location</th>
                                                <th>City</th>
                                                <th>State</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                           <c:forEach var="AddList" items="" varStatus="theCount">
                                            <tr id="dynamicdiv${theCount.index+1}">
                                          	    <td class='slnoAdd'>${theCount.index+1}</td>
                                          	    <%-- <td id="addressTypeAdd${theCount.index+1}">${AddList.addressType}</td> --%>
                                          	    <c:choose>
										
						          	 	<c:when test="${AddList.addressType == 'BA'}">
							        	<td id="addressTypeAdd${theCount.index+1}">Billing Address</td>
							        	</c:when>
							        	<c:otherwise >
							       	 	<td id="addressTypeAdd${theCount.index+1}">Shipping Address</td>
							        	</c:otherwise>
							    		</c:choose>
							    		
                                          	    <td id="buildingNoAdd${theCount.index+1}">${AddList.plotNo}</td>
                                                <td id="streetNameAdd${theCount.index+1}">${AddList.streetName}</td>
                                                <td id="locationAdd${theCount.index+1}">${AddList.location}</td>
                                                <input type="hidden" id="phoneAdd${theCount.index+1}" value="${AddList.phone}"/>
                                                <input type="hidden" id="emailAdd${theCount.index+1}" value="${AddList.autoNumber}"/>
                                                <input type="hidden" id="countryCodeAdd${theCount.index+1}" value="${AddList.countryCode}"/>
                                                <input type="hidden" id="pincodeAdd${theCount.index+1}" value="${AddList.pincode}"/>
                                                <td id="cityAdd${theCount.index+1}">${AddList.city}</td>
                                                <td id="stateAdd${theCount.index+1}">${AddList.stateCode}</td>
                                               <td id="Del${theCount.index+1}"><a id="Dele${theCount.index+1}" style="color: #3c8dbc; text-decoration: underline;margin-left:3px;" onclick="deleteItem(this);" title="Delete">Delete</a></td>
                                              
                							</tr>
                                            </c:forEach> 
                                        </tbody>
                                    </table>
                                    </div>
                                    
                                    
                                 <div class="col-lg-12" style="padding-left: 0px; padding-right:0px;padding-bottom: 4px; ">
                                         <div class="col-lg-2" style="padding-left: 0px; color: #fff;font-size:16px;height: 30px;background: #3c8dbc"><label style="padding: 2px 2px 2px 10px" ><spring:message code="supplyterms.label" /></label></div>
                                          <div class="col-lg-10" style=" color: #666;font-size: 16px;height: 30px;background: #F1F1F1;border: 1px solid silver;"><label style="padding: 2px 2px 2px 10px" ><spring:message code="suppleraddtext.label" /></label></div>
                                        
                                        </div>
                                                           <br>
                                          <div class="row"> 
  <br/> 
                                     <div class="col-lg-2 col-xs-2">
				                      <select class="form-control" id="wareHouseLocation" >
									 <c:forEach var="location" items="${locationsList}">						 		
						 			<c:choose>
						           <c:when test="${location.description == ''}">
							         <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
							        </c:when>
							        <c:otherwise>
							        <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}-${location.description}</option>
							        </c:otherwise>
							    </c:choose>
						 		</c:forEach>
							                   </select>
				                      </div>
  
  
  			<div class="form-group col-lg-10" style="text-align:center;  margin-bottom: 0.3%;">
                <input type="hidden" id="groupId"/>
              	<input type="text"  class="form-control searchItems" id="searchItems"  placeholder="<spring:message code="search.items.here.label" />"  style="text-align: left;height:30PX;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"  />
				<div class="services">
		 			<div class="items">
		  				<ul class="matchedStringUl request" style=""></ul>
					</div>
				</div>
                <span id="searchItemsError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
         	  </div>
  </div>
  	<div class="table-responsive">
             <table id="productsList" class="table table-bordered table-hover">
               <thead style="background-color: #3c8dbc; color: #ffffff">
                 <tr>
                 <th><spring:message code="sno.label" /></th>
                 	<th style="border-left: 4px solid #fff;"><spring:message code="skuid.label" /></th>
                     <th style="border-left: 4px solid #fff;"><spring:message code="product.description.label" /></th>
                     <th style="border-left: 4px solid #fff;">Supplier Code</th>
                     <th style="border-left: 4px solid #fff;">Supplier SKU ID</th>
                     
                     <th style="border-left: 4px solid #fff;"><spring:message code="uom.label"/></th>
                      <th style="border-left: 4px solid #fff;"><spring:message code="grade.label"/></th>
                      <th style="border-left: 4px solid #fff;"><spring:message code="range.label"/></th>
                       <th style="border-left: 4px solid #fff;"><spring:message code="price.label"/></th>
                       <th style="border-left: 4px solid #fff;"><spring:message code="colour.label"/></th>
                       <th style="border-left: 4px solid #fff;"><spring:message code="minqty.label"/></th>
                      <th style="border-left: 4px solid #fff;"><spring:message code="leadtime.label"/></th>
                     <th style="border-left: 4px solid #fff;"><spring:message code="action.label"/></th>
                </tr>
               </thead>
 			<tbody  style="text-align: center;">
 			<c:forEach var="productGroup" items="${supplierBean.supplierProducts}" varStatus="theCount">
				<tr class="update" id="dynamicdiv${theCount.count}" style='margin-top:5px;'>
					<%-- <td>${theCount.count}</td>
					<td id="skuId${theCount.count}">${productGroup.skuId}</td>
				    <td id="pluCode${theCount.count}">${productGroup.skuId}</td>
				    <td >${productGroup.uom}</td>
					<td>${productGroup.grade}</td>
					<td>${productGroup.productRange}</td>
					<td>${productGroup.price}</td>
					<td>${productGroup.colour}</td>
					<td>${productGroup.minQuantity}</td>
					<td>${productGroup.maxQuantity}</td>
					<td id="Del${theCount.count}"><img id="Img${theCount.count}"alt=""  style='width:30px;cursor:pointer;'  onclick='deleteItem(this);' src="${pageContext.request.contextPath}/images/itemdelete.png"/></td> --%>
					<td class="slno">${theCount.count}</td>
					<input type="hidden" id="skuId${theCount.count}" value="${productGroup.skuId}"/>
	 				<input type="hidden" id="pluCode${theCount.count}" value="${productGroup.skuId}"/>
					<td id="Name${theCount.count}">${productGroup.skuId}</td>
				    <td id="Desc${theCount.count}">${productGroup.skuDescription}</td>
				    <td id="supplierCode${theCount.count}">${productGroup.supplierCode}</td>
				    <td id="supplierSkuId${theCount.count}" onkeypress="return (this.innerText.length < 10)" contenteditable="true">${productGroup.supplierSkuId}</td>
				    
				    <td id="UOM${theCount.count}" >${productGroup.uom}</td>
					<td class='Price' id="Price${theCount.count}">${productGroup.grade}</td>
					<td id="size${theCount.count}">${productGroup.productRange}</td>
					<td id="Cost${theCount.count}">${productGroup.price}</td>
					<td id="colour${theCount.count}">${productGroup.colour}</td>
					<td id="Pack${theCount.count}" onkeypress="return (this.innerText.length < 10)" contenteditable="true">${productGroup.minQuantity}</td>
					<td id="lead${theCount.count}" onkeypress="return (this.innerText.length < 10)" contenteditable="true">${productGroup.maxQuantity}</td>
					<td id="Del${theCount.count}"><img id="Img${theCount.count}"alt=""  style=''  class="delImage" onclick='deleteItem(this);' src="${pageContext.request.contextPath}/images/itemdelete.png"/></td>
				</tr>
           </c:forEach>    
 			</tbody>
           </table>
           <br/>
         </div>
                           </div><!-- /.box-body -->

						<div class="row" style="text-align: center;">
						 <input type="button"  class="btn bg-olive btn-inline btnCls" onclick="validateSupplierForm('new')" value="<spring:message code="submit.label" />" />
					 <c:if test="${sessionScope.role == 'super admin'}"> 
					 	<input type="button"  class="btn bg-olive btn-inline btnCls" style="margin-left:5%" onclick="viewSupplierMaster('supplierMaster','0');" value="<spring:message code="cancel.label" />" />
					 </c:if>
					 <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                        <c:if test="${accessControl.appDocument == 'SupplierMaster' && accessControl.write == true && accessControl.read == true}">
							<input type="button" class="btn bg-olive btn-inline btnCls" style="margin-left:25%;" onclick="viewSupplierMaster('supplierMaster','0');" value="<spring:message code="cancel.label" />" />
						</c:if>
					</c:forEach>
						</div>
							<br/>
                           <div class="box-footer"></div>
                           
                           <input type="hidden" value="${maxRecords}" id="maxRecords"/>
                           <input type="hidden" value="${searchName}" id="searchSupplier"/>
                       </form>
                   </div>

</div>
</div>
</section><!-- /.content -->
<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/currency_plugin.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var count=con.length;
	var op = '<option value="-1" >Select Country</option>';
	for(var i=0;i<count;i++)
		op = op +"<option value="+i+">"+con[i]+"</option>";
	$("#countryCode").html(op);
	//print_country("countryName");
//	var selectedCountry = $("#selectedCountry").val();
//	if(selectedCountry == null || selectedCountry == ""){
	var	selectedCountry = "India";
//	}
	$("#countryCode option").each(function() {
	  if($(this).text() == selectedCountry) {
	    $(this).attr('selected', 'selected');            
	  }                        
	});
	var index = $("#countryCode").val();
	$("#currencyCode").val(cod[index] +" - "+ cur[index]);
	
	
	// this for Addresses Country Code
	var count=con.length;
	var op = '<option value="-1" >Select Country</option>';
	for(var i=0;i<count;i++)
		op = op +"<option value="+i+">"+con[i]+"</option>";
	$("#countryCodeforAddress").html(op);
	//print_country("countryName");
//	var selectedCountry = $("#selectedCountry").val();
//	if(selectedCountry == null || selectedCountry == ""){
	var	selectedCountry = "India";
//	}
	$("#countryCodeforAddress option").each(function() {
	  if($(this).text() == selectedCountry) {
	    $(this).attr('selected', 'selected');            
	  }                        
	});
});
</script>
</body>
</html>