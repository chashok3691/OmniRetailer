<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/master/editSupplier.jsp
 * file type		        : JSP
 * description				: The edit supplier form is displayed using this jsp
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
	<%--  <script src="${pageContext.request.contextPath}/js/jquery-1.6.4.min.js"></script> --%>
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
 <script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
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

<script type="text/javascript">
$(document).ready(function(){
	/* print_country("countryCode");
	var selectedCountry = $("#selectedCountry").val()
	$("#countryCode").val(selectedCountry); */
	var number=$("#userRating1").val(); 
	var n=number.split('.');
	var num= n[0];
if(num == "1"){	 
	 $(".star-1").trigger("click");
}else if(num == "2"){
	$(".star-2").trigger("click");
}else if(num == "3"){
	$(".star-3").trigger("click");
}else if(num == "4"){
	$(".star-4").trigger("click");
}else if(num == "5"){
	$(".star-5").trigger("click");
}
$("input:radio[name='star']").each(function(){
	$(this).attr("disabled","disabled");
});
	
	var phoneNo = $("#phone").val();
	phoneNo = phoneNo.split('-');
	if(phoneNo.length == 1)
		$("#phoneNumber").val(phoneNo[0]);
	else{
		$("#defaultCountry").val(phoneNo[0]);
		$("#phoneNumber").val(phoneNo[1]);
	}
	phoneNo = $("#mobile").val();
	phoneNo = phoneNo.split('-');
	if(phoneNo.length == 1)
		$("#phoneNumber1").val(phoneNo[0]);
	else{
		$("#defaultCountry1").val(phoneNo[0]);
		$("#phoneNumber1").val(phoneNo[1]);
	}
 	  $("#firmName").keyup(function(){
 		   $("#firmNameError").html("");
		   $("#Error").html("");
 	 });
 	 $("#plotNo").keydown(function(){
 		   $("#plotNoError").html("");
		   $("#Error").html("");
 	 }); 
 	 $("#streetName").keydown(function(){
		   $("#streetNameError").html("");
		   $("#Error").html("");
	 });
 	 $("#city").keydown(function(){
 		   $("#cityError").html("");
		   $("#Error").html("");
	 });
 	 $("#zipCode").keydown(function(){
 		   $("#zipCodeError").html("");
		   $("#Error").html("");
	 });
 	 
 	$("#countryCode").keydown(function(){
		   $("#countryCodeError").html("");
		   $("#Error").html("");
	 });
	 
	 $("#currencyCode").keydown(function(){
		   $("#currencyCodeError").html("");
		   $("#Error").html("");
	 }); 
	 $("#emailId").keydown(function(){
		   $("#emailIdError").html("");
		   $("#Error").html("");
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
	 
	 $("#shipmentMode").keydown(function(){
		   $("#shipmentModeError").html("");
		   $("#Error").html("");
	 });
	 
	 $("#minOrderCost").keyup(function(){
		   $("#minOrderCostError").html("");
		   $("#Error").html("");
	 });
	 
	 $("#minQuantity").keyup(function(){
		   $("#minQuantityError").html("");
		   $("#Error").html("");
	 }); 
	 $("#leadTime").keyup(function(){
		   $("#leadTimeError").html("");
		   $("#Error").html("");
	 });
	 $("#uom").keydown(function(){
		   $("#uomError").html("");
		   $("#Error").html("");
	 });
	
	 
 	 $("#websiteUrl").keydown(function(){
		   $("#Error").html("");
	 });
 	
 	 $("#fax").keyup(function(){
		   $("#Error").html("");
	 });
 	 $("#paymentTerms").keydown(function(){
		   $("#Error").html("");
	 });
 	 $("#shipmentTerms").keydown(function(){
		   $("#Error").html("");
	 });
 	$("#targetOrderValue").keydown(function(){
		   $("#Error").html("");
	 });
	 $("#rFactor").keyup(function(){
		   $("#Error").html("");
	 });
	 $("#maxFactor").keyup(function(){
		   $("#Error").html("");
	 });
	 $("#phoneNumber1").keydown(function(){
		 $("#error1").html("");
		 $("#Error").html("");
	 });
	 $("#defaultCountry1").keydown(function(){
		 $("#error1").html("");
		$("#Error").html("");
	 });
	$("#phoneNumber1").blur(function(){
		var phoneNumber = $("#phoneNumber1").val().trim();
		if(phoneNumber != ""){
			validatePhoneNumber1() ;
		}
	});
		$("#defaultCountry1").change(function(){
			$("#error1").html("");
			$("#Error").html("");
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
                              <br/>
                              <h3><spring:message code="view.supplier.header.label" /></h3>
                              </div><!-- /.box-header -->
                              <!-- form start -->
                             
                              <form id="viewSupplier" method="post">
                                  <div class="box-body" style="padding: 10px 31px;">
                                  <%-- <div id="Error" style="text-align:center; color: red;font-size: 2;font-weight: bold;">${err}</div> --%>
                                  
                              <div class="col-lg-12" style="padding-bottom: 4px; ; padding-left: 0px;border-bottom: 1px solid #ccc">
                                         <div class="col-lg-3" style="padding-left: 0px"><span class="labelheading"><spring:message code="supplierdetails.label" /></span></div>
                                          <div class="col-lg-10"></div>
                                        
                                        </div>
                     <div class="row">
	        			<div class="col-lg-3"></div>
                       	<div class="col-lg-6">
                       		<div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${err}</div>
	        				<div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
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
                                   <div class="row">
                                  	 <div class="form-group col-lg-3">
                                  	 <input type="hidden" id="userRating1" name="rating" value="${supplierBean.rating}" >
                                          <input type="hidden" class="form-control" name="supplierCode" id="supplierCode" value="${supplierBean.supplierCode}" />
                                          <label><spring:message code="supplier.firm.name.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <div class=" col-lg-11" style="padding-left: 0px">
                                          <input type="text" class="form-control" readonly="readonly" name="firmName" id="firmName" required placeholder="<spring:message code="supplier.enter.firm.name.label" />" value="${supplierBean.firmName}" />
                                       <span id="firmNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                       </div>
                                       </div>
									<div class="form-group col-lg-3">
                                          <label><spring:message code="supplier.plot.no.label" /> <span style="color:red; font-size:2">*</span></label>
                                         <div class=" col-lg-11" style="padding-left: 0px">
                                          <input type="text" class="form-control" readonly="readonly" name="plotNo" id="plotNo" required placeholder="<spring:message code="supplier.enter.plot.no.label" />" value="${supplierBean.plotNo}" />
                                      <span id="plotNoError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
									</div>
									</div>
                                      <div class="form-group col-lg-3">
                                          <label><spring:message code="supplier.street.name.label" /> <span style="color:red; font-size:2">*</span></label>
                                         <div class=" col-lg-11" style="padding-left: 0px">
                                          <input type="text" class="form-control" name="streetName" readonly="readonly" id="streetName" required placeholder="<spring:message code="supplier.enter.street.name.label" />" value="${supplierBean.streetName}" />
                                     <span id="streetNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                     </div>
                                       <div class="form-group col-lg-3">
                                          
                                         <div class=" col-lg-8" style="padding-left: 0px">
                                         <label><spring:message code="supplier.city.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" name="city" id="city" readonly="readonly" required placeholder="<spring:message code="supplier.enter.city.label" />" value="${supplierBean.city}" />
                                      <span id="cityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                      </div>
                                      </div>
                                      </div>
                                  	<div class="row">
                                  	
                                  	 <div class="form-group col-lg-3">
                                <div class=" col-lg-10" style="padding-left: 0px">
                                  <label><spring:message code="shipment.state.label" /><span style="color:red; font-size:2">*</span></label>
                                       <select class="form-control" name="state" id="state" style="width: 100%;" disabled="disabled">
	                                       <option value="" >Select state</option>
	                                        <c:forEach var="states" items="${states.stateMasters}">
	                            			 <option value="${states.stateName}" ${supplierBean.state == states.stateName ? 'selected' : ''}>${states.stateName}</option>
	                                        
											</c:forEach>
	                                        
	                                            </select>
										 
                                         <span id="shipmentStateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     
								</div>
								</div>
                                  	
                                  	
                                  	
                                       <div class="form-group col-lg-3">
                                          <label><spring:message code="supplier.zip.code.label" /> <span style="color:red; font-size:2">*</span></label>
                                         <div class=" col-lg-10" style="padding-left: 0px">
                                          <input type="text" class="form-control" name="zipCode" readonly="readonly" id="zipCode" required oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"  placeholder="<spring:message code="supplier.enter.zip.code.label" />" value="${supplierBean.zipCode}" />
                                      <span id="zipCodeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                      </div>
                                      </div>
                                      <a></a>
                                      <!--  <div class="form-group col-lg-1"></div> -->
                                       <div class="form-group col-lg-3">
                                        <div class=" col-lg-8" style="padding-left: 0px">
                                          <label><spring:message code="supplier.country.code.label" /> <span style="color:red; font-size:2">*</span></label>
                                           <select id="countryCode" name ="countryCode" disabled="disabled" class="form-control" ></select>
                                          <input type="hidden" class="form-control" id="selectedCountry" value="${supplierBean.countryCode}" />
                                     		<span id="countryCodeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                      </div>
                                      </div>
                                       <!-- <div class="form-group col-lg-1"></div> -->
                                       <div class="form-group col-lg-3">
                                       <div class=" col-lg-8" style="padding-left: 0px">
                                          <label><spring:message code="supplier.currency.code.label" /> <span style="color:red; font-size:2">*</span></label>
                                           <input type="text" readonly="readonly" class="form-control" id="currencyCode" value="${supplierBean.currencyCode}" />
                                           <%-- <select class="form-control" name="currencyCode" disabled="disabled" id="currencyCode">
                                           <c:forEach var="currency" items="${currencyList}">
										<option value="${currency}" ${currency == supplierBean.currencyCode ? 'selected' : ''} >${currency}</option>
									 </c:forEach>
									 </select> --%>
                                      <span id="currencyCodeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                      </div>
                                      </div>
                                         <!-- <div class="form-group col-lg-1"></div> -->
                                      
                                      </div>
                                      <div class="row">
                                       <div class="form-group col-lg-3">
                                          <label><spring:message code="supplier.website.url.label" /></label>
                                          <div class=" col-lg-10" style="padding-left: 0px">
                                          <input type="text" class="form-control" name="websiteUrl"  readonly="readonly" id="websiteUrl"  placeholder="<spring:message code="supplier.enter.website.url.label" />" value="${supplierBean.websiteUrl}" />
                                      </div>
                                      </div>
                                      
                                       <div class="form-group col-lg-3">
                                      <div class=" col-lg-10" style="padding-left: 0px">
                                          <label><spring:message code="supplier.emailId.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" name="emailId"  readonly="readonly" id="emailId" required placeholder="<spring:message code="supplier.enter.emailId.label" />" value="${supplierBean.emailId}" />
                                      <span id="emailIdError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                      </div>
                                      </div>
                                       <div class="form-group col-lg-3">
                                        <div class=" col-lg-10" style="padding-left: 0px;padding-right: 10px">
                                          <label><spring:message code="supplier.phone.label" /> <span style="color:red; font-size:2">*</span></label>
                                           <div class="row">
	                                  <div class="col-lg-5 col-md-4 col-sm-4 col-xs-4" style="padding-right:10px ">
	                                  	<select style="padding: 6px 8px;" class="form-control" disabled="disabled" id="defaultCountry" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
	                                  		<option selected="selected">IN</option>
	                                  		<option>US</option>
	                                  		<option>GB</option>
	                                  		<option>AU</option>
	                                  	</select>
	                                  </div>
	                                  <div class="col-lg-7 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
	                                  	<input type="text" class="form-control"  readonly="readonly" placeholder="<spring:message code="supplier.enter.phone.label" />" id="phoneNumber" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
	                                  </div>
	                                  <input type="hidden" class="form-control" name="phone" id="phone"  value="${supplierBean.phone}"/>
	                                   <input type="hidden" id="output" />
	                             </div>
	                            <span id="error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                          
                                         <%--  <input type="text" class="form-control" name="phone" id="phone" required placeholder="<spring:message code="supplier.enter.phone.label" />" value="${supplierBean.phone}" />
                                      <span id="phoneError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> --%>
                                      </div>
                                       </div>
                                       <div class="form-group col-lg-3">
                                        <div class=" col-lg-10" style="padding-left: 0px">
                                          <label><spring:message code="supplier.mobile.label" /></label>
                                           <div class="row">
	                                  <div class="col-lg-5 col-md-4 col-sm-4 col-xs-4"  style="padding-right:10px">
	                                  	<select style="padding: 6px 8px;" disabled="disabled" class="form-control" id="defaultCountry1" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
	                                  		<option selected="selected">IN</option>
	                                  		<option>US</option>
	                                  		<option>GB</option>
	                                  		<option>AU</option>
	                                  	</select>
	                                  </div>
	                                
	                                  <div class="col-lg-7 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
	                                  	<input type="text" class="form-control" readonly="readonly" placeholder="<spring:message code="supplier.enter.mobile.label" />" id="phoneNumber1" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
	                                  </div>
	                                  <input type="hidden" class="form-control" name="mobile" id="mobile"  value="${supplierBean.mobile}"/>
	                                   <input type="hidden" id="output1" />
	                             </div>
	                            <span id="error1" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                          
                                          
                                          <%-- <input type="text" class="form-control" name="mobile" id="mobile"  placeholder="<spring:message code="supplier.enter.mobile.label" />" value="${supplierBean.mobile}" /> --%>
                                      </div>
                                      </div>
                                      <%--  <div class="form-group col-lg-3">
                                        <div class=" col-lg-10" style="padding-left: 0px">
                                          <label><spring:message code="supplier.fax.label" /></label>
                                          <input type="text" class="form-control" readonly="readonly" name="fax" id="fax"  oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"  placeholder="<spring:message code="supplier.enter.fax.label" />" value="${supplierBean.fax}" />
                                      </div>
                                      </div> --%>
                                      </div>
                                       <div class="row">
                                       <div class="form-group col-lg-3">
                                        <div class=" col-lg-10" style="padding-left: 0px">
                                          <label><spring:message code="supplier.shipment.mode.label" /> <span style="color:red; font-size:2">*</span></label>
                                           <select class="form-control" name="shipmentMode" disabled="disabled" id="shipmentMode">
                                          <option value="Land-Goods Rail" ${'Land-Goods Rail' == supplierBean.shipmentMode ? 'selected' : ''}><spring:message code="shippment.mode.goods.rail.label" /></option>
                                          <option value="Land-Private Career" ${'Land-Private Career' == supplierBean.shipmentMode ? 'selected' : ''}><spring:message code="shippment.mode.private.career.label" /></option>
                                          <option value="Air Freight" ${'Air Freight' == supplierBean.shipmentMode ? 'selected' : ''}><spring:message code="shippment.mode.air.freight.label" /></option>
                                          <option value="Sea Transport" ${'Sea Transport' == supplierBean.shipmentMode ? 'selected' : ''}><spring:message code="shipment.mode.sea.transport.label" /></option>
                                          <option value="Others" ${'Others' == supplierBean.shipmentMode ? 'selected' : ''}><spring:message code="shipment.mode.others.label" /></option>
                                          </select>
                                     	<span id="shipmentModeError" style="text-align:right;color:red;font-size:2; font-weight: bold;"></span>
								</div>
								</div>
								 
                                      <div class="form-group col-lg-2">
                                          <label><spring:message code="supplier.min.order.cost.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <div class=" col-lg-8" style="padding-left: 0px;padding-right: 31px">
                                          <input type="text" class="form-control" readonly="readonly" name="minOrderCost" id="minOrderCost"  oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" required placeholder="<spring:message code="supplier.enter.min.order.cost.label" />" value="${supplierBean.minOrderCost}" />
                                     <span id="minOrderCostError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                      </div>
                                      </div>
                                       <div class="form-group col-lg-1"></div>
                                      <div class="form-group col-lg-2">
                                          <label><spring:message code="supplier.min.quantity.label" /> <span style="color:red; font-size:2">*</span></label>
                                        <div class=" col-lg-8" style="padding-left: 0px;padding-right: 31px">
                                          <input type="text" class="form-control" readonly="readonly" name="minQuantity" id="minQuantity" required oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"  placeholder="<spring:message code="supplier.enter.min.quantity.label" />" value="${supplierBean.minQuantity}" />
                                      <span id="minQuantityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                      </div></div>
                                       <div class="form-group col-lg-1"></div>
                                      <div class="form-group col-lg-1">
                                         <div class=" col-lg-12" style="padding-left: 0px;padding-right: 0px">
                                          <label style="white-space: nowrap;"><spring:message code="supplier.lead.time.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" readonly="readonly" name="leadTime" id="leadTime" required oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"  placeholder="<spring:message code="supplier.enter.lead.time.label" />" value="${supplierBean.leadTime}" />
                                      <span id="leadTimeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                      </div> 
                                      </div>
                                      
                                      <div class="form-group col-lg-2">
	 							<div class=" col-lg-12" style="padding-left: 0px;padding-right: 0px">
                               <label style="white-space: nowrap;">PAN Number</label>
                                   
                                   <input type="text" class="form-control" readonly="readonly" name="pan" id="pan" placeholder="Enter PAN" style="width: 88%;" value="${supplierBean.pan}" onclick="ValidatePAN();" />
                               		<span id="PANNumberError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	 							</div>
	 							</div>
                                      
                                     <!--  <div class="form-group col-lg-1"></div> -->
                                      </div>
                                      <div class="row">
                                      <div class="form-group col-lg-3">
                                         
                                          <div class=" col-lg-5" style="padding-left: 0px;">
                                          <label><spring:message code="supplier.uom.label" /></label>
                                          <select class="form-control" disabled="disabled" name="uom" id="uom">
                                          <option value="KG" ${'KG' == supplierBean.uom ? 'selected' : ''}>KG</option>
                                          <option value="Meters" ${'Meters' == supplierBean.uom ? 'selected' : ''}>Meters</option>
                                          <option value="Pieces" ${'Pieces' == supplierBean.uom ? 'selected' : ''}>Pieces</option>
                                          <option value="Cases" ${'Cases' == supplierBean.uom ? 'selected' : ''}>Cases</option>
                                          </select>
                                      <span id="uomError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                      </div>
                                      
                                       <div class="form-group col-lg-7 allignment"style="padding-left: 0px;padding-right: 0px;">
								 <div class="col-lg-12" >
                                            <label><spring:message code="gstin.lael" /></label>
                                            <input type="text" name="gstn_num" id="gstn_num" disabled="disabled" value="${supplierBean.gstn_num}"  class="form-control" placeholder="<spring:message code="enter.gstin.no.label"/>" />
                                        </div>
								</div>
                                      
                                      </div>
                                      
                                      <div class="form-group col-lg-3">
                                      <div class=" col-lg-8" style="padding-left: 0px;padding-right: 31px">
                                      <label><spring:message code="supplier.target.order.value.label" /></label>
                                          
                                          <input type="text" class="form-control" readonly="readonly" name="targetOrderValue" id="targetOrderValue"  placeholder="<spring:message code="supplier.enter.target.order.value.label" />" value="${supplierBean.targetOrderValue}" />
                                      </div>
                                      </div>
                                      <div class="form-group col-lg-3">
                                       
                                      <div class=" col-lg-4" style="padding-left: 0px;padding-right: 20px">
                                         <label><spring:message code="supplier.rfactor.label" /></label>
                                          <input type="text" class="form-control" readonly="readonly" name="rFactor" id="rFactor"  oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"  placeholder="<spring:message code="supplier.enter.rfactor.label" />" value="${supplierBean.rFactor}" />
                                      </div>
                                      
                                      <div class="col-lg-6">
									<label><spring:message code="status.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" name="status" id="status" readonly disabled>
											<option value="1" ${supplierBean.status==true?'selected':''}>Active</option>
											<option value="0"  ${supplierBean.status==false?'selected':''}>Disabled</option>
											
										</select>
									</div>
								</div>
                                      </div>
                                   <div class="form-group col-lg-3">
                                    <div class=" col-lg-6" style="padding-left: 0px;white-space:nowrap">
                                    <label><spring:message code="supplier.max.factor.label" /></label>                                                                          
                                          <input type="text" class="form-control" readonly="readonly" name="maxFactor" id="maxFactor"  oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"  placeholder="<spring:message code="supplier.enter.max.factor.label" />" value="${supplierBean.maxFactor}" />
                                      </div>
                                      
                                      <div class=" col-lg-6" style="padding-left: 0px;white-space:nowrap">
                                   <label><spring:message code="ProductRestrictions.label" /></label>
                                 
                                    <select class="form-control" name="productRestrictionsStr" id="productRestrictionsStr" readonly="readonly">                                 
                                   <option value="0"  ${productFlag==true?'selected':''}>Yes</option>
                                   <option value="1" ${productFlag==false?'selected':''}>No</option>
                                   </select>
                               </div>
                                      </div>
                                       <div class="form-group col-lg-1"></div>
                                    </div> 
                                     <%-- <div class="row">
                                       <div class="form-group col-lg-6">
                                       <div class="col-lg-12" style="padding-left: 0px;padding-right: 35px">
                                          <label><spring:message code="supplier.payment.terms.label" /></label>
                                          <textarea class="form-control" name="paymentTerms" readonly="readonly" id="paymentTerms" style="resize: none;" rows="2" placeholder="<spring:message code="supplier.enter.payment.terms.label" />" >${supplierBean.paymentTerms}</textarea>
                                      </div>
                                      </div>
                                      <div class="form-group col-lg-6">
                                       <div class="col-lg-11" style="padding-left: 0px">
                                          <label><spring:message code="supplier.shipment.terms.label" /></label>
                                          <textarea class="form-control" name="shipmentTerms" readonly="readonly" id="shipmentTerms" style="resize: none;" rows="2" placeholder="<spring:message code="supplier.enter.shipment.terms.label" />" >${supplierBean.shipmentTerms}</textarea>
                                      </div>
                                      </div>
                                      </div>  --%>
                                      
                                      <div class="row">
                                       <div class="form-group col-lg-3">
                                          <label><spring:message code="supplier.payment.terms.label" /></label>
                                          <textarea class="form-control" name="paymentTerms" readonly="readonly" id="paymentTerms" style="resize: none;" rows="2" placeholder="<spring:message code="supplier.enter.payment.terms.label" />" >${supplierBean.paymentTerms}</textarea>
                                      </div>
                                      <div class="form-group col-lg-3">
                                          <label><spring:message code="supplier.shipment.terms.label" /></label>
                                          <textarea class="form-control" name="shipmentTerms" readonly="readonly" id="shipmentTerms" style="resize: none;" rows="2" placeholder="<spring:message code="supplier.enter.shipment.terms.label" />" >${supplierBean.shipmentTerms}</textarea>
                                      </div>
                                      <div class="form-group col-lg-3">
                                   <label>Return Terms</label>
                                   <textarea class="form-control" onblur="criteria(this)" readonly="readonly" name="returnTerms" id="returnTerms" style="resize: none;" rows="2" placeholder="Enter Return Terms" >${supplierBean.returnTerms}</textarea>
                               </div>
                               <div class="form-group col-lg-3">
                                    <div class=" col-lg-6" style="padding-left: 0px;white-space:nowrap">
                                   <label>Return Days</label>
                                   <input type="text" class="form-control" name="returnDays" id="returnDays" readonly="readonly" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"  placeholder="Days" value="${supplierBean.returnDays}" />
                               </div>
                               <div class="col-lg-6" style="padding-left: 0px;white-space:nowrap">
                                   <label>Markdown(%)</label>
                                   <input type="text" class="form-control" name="markdown" id="markdown" readonly="readonly" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"  placeholder="Enter value" value="${supplierBean.markdown}" />
                               </div>
                               </div>
                                      </div> 
                                      <div class="row" style="padding: 10px;margin: 5px;background-color: #dedcdc;">
                                        <div class="col-lg-12" style="">
                                        <label style="font-weight: bold !important;text-decoration: underline;">Status:</label><br>
                                        </div>
                                         </div>
                                      
                                                <div class="row">
                             <%-- <div class="col-lg-2">
                                  
                                  <input type="hidden" value="${purchaseOrderBeanObj.status}" id="defaultstatus">
      								<c:choose>
      									<c:when test="${not empty nextWorkFlowStates}">
      									<label style="font-family: Calibri;color: gray;"><spring:message code="actionrecquired.label" /></label>
                                           
                                             <select class="form-control" name="shipped_from" id="statusissue">
                                             <option value="">Action Required</option>
                                               <c:forEach var="activity" items="${nextWorkFlowStates}">
                                              <option value="${activity}">${activity}</option>
                                             </c:forEach>
                                         
                                           </select>
      									</c:when>
      							
      								<c:otherwise>
      									 <input type="hidden" value="nostatus" id="nostatus">
      								</c:otherwise>
      							</c:choose>
      							</div> --%>
                                 <div class="col-lg-9">
                                  <div class="form-group col-lg-12">
			              			<c:forEach var="previousWorkFlowDate" items="${PreviousWorkFlowLogList}" varStatus="TheCount"> 
			              			   <%--  <fmt:formatDate value="${previousWorkFlowDate.orderPlacedDate}" var="startFormat" pattern="dd-MM-yyyy HH:mm:ss"/>  --%>
									   <%--  <input class="form-control" readonly="readonly" style="background-color: white;width: 14%;margin: 0px;display: inline-block;margin-right: 10px;" name="updated_due_date" id="updatedDate" size="20" type="text" value="${startFormat}"/> --%>
									   <div class="col-lg-2">
									    <input type="text" class="form-control"oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"  placeholder="Enter value" value="${previousWorkFlowDate}" disabled />
									   </div>
									  
			                        </c:forEach> 
                        		  </div>
                        		  <div class="form-group col-lg-12">
                                    <c:forEach var="previousWorkFlowList" items="${previousStates}">
      									   <div class="col-lg-3" style="padding-left: 0px;width: 162px;display:inline-block;">
                                             <span class=" border" style="padding-left: 0px;padding-top: 17px;font-size: 16px;"><img alt="" style="height:30px" src="${pageContext.request.contextPath}/images/workflow_arrow.png">${previousWorkFlowList}
      									
      										</span>
      									</div>
                                 	</c:forEach>
                                 	
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
                                           <c:forEach var="AddList" items="${supplierBean.supplierAddresses}" varStatus="theCount">
                                            <tr id="dynamicdiv${theCount.index+1}">
                                          	    <td class='slnoAdd'>${theCount.index+1}</td>
                                          	    <c:choose>
										
						          	 	<c:when test="${AddList.addressType == 'BA'}">
							        	<td id="addressTypeAdd${theCount.index+1}">Billing Address</td>
							        	</c:when>
							        	<c:otherwise >
							       	 	<td id="addressTypeAdd${theCount.index+1}">Shipping Address</td>
							        	</c:otherwise>
							    		</c:choose>
                                          	    <%-- <td id="addressTypeAdd${theCount.index+1}">${AddList.addressType}</td> --%>
                                          	    <td id="buildingNoAdd${theCount.index+1}">${AddList.plotNo}</td>
                                                <td id="streetNameAdd${theCount.index+1}">${AddList.streetName}</td>
                                                <td id="locationAdd${theCount.index+1}">${AddList.location}</td>
                                                <input type="hidden" id="phoneAdd${theCount.index+1}" value="${AddList.phone}"/>
                                                <input type="hidden" id="emailAdd${theCount.index+1}" value="${AddList.emailId}"/>
                                                <input type="hidden" id="countryCodeAdd${theCount.index+1}" value="${AddList.countryCode}"/>
                                                <input type="hidden" id="pincodeAdd${theCount.index+1}" value="${AddList.pincode}"/>
                                                <input type="hidden" id="supplierCodeAdd${theCount.index+1}" value="${AddList.supplierCode}"/>
                                                <td id="cityAdd${theCount.index+1}">${AddList.city}</td>
                                                <td id="stateAdd${theCount.index+1}">${AddList.stateCode}</td>
                                               <td id="Del${theCount.index+1}"><a id="Dele${theCount.index+1}" style="color: #3c8dbc;text-decoration: underline;margin-left:3px;pointer-events: none;" onclick="deleteItem(this);" title="Delete">Delete</a></td>
                                              
                							</tr>
                                            </c:forEach> 
                                        </tbody>
                                    </table>
                                    </div>
                                      
                                         <div class="col-lg-12" style="padding-left: 0px; padding-right:0px;padding-bottom: 4px; ">
                                         <div class="col-lg-2" style="padding-left: 0px; color: #fff;font-size:16px;height: 30px;background: #3c8dbc"><label style="padding: 2px 2px 2px 10px" ><spring:message code="supplyterms.label" /></label></div>
                                          <div class="col-lg-10" style=" color: #666;font-size: 16px;height: 30px;background: #F1F1F1;border: 1px solid silver;"><label style="padding: 2px 2px 2px 10px" ><spring:message code="suppleraddtext.label" /></label></div>
                                        
                                        </div>
                                      <br><br>
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
                </tr>
               </thead>
 			<tbody  style="text-align: center;">
 			<c:forEach var="productGroup" items="${supplierBean.supplierProducts}" varStatus="theCount">
				<tr class="update" id="dynamicdiv${theCount.count}" style='margin-top:5px;'>
					<td>${theCount.count}</td>
					<td id="skuId${theCount.count}">${productGroup.skuId}</td>
				    <td id="Desc${theCount.count}" style="text-align: left;">${productGroup.skuDescription}</td>
				    <td id="supplierCode${theCount.count}">${productGroup.supplierCode}</td>
				    <td id="supplierSkuId${theCount.count}" >${productGroup.supplierSkuId}</td>
				    
				    <td >${productGroup.uom}</td>
					<td>
					${productGroup.grade}
					</td>
					<td>${productGroup.productRange}</td>
					<td>${productGroup.price}</td>
					<td>${productGroup.colour}</td>
					<td>${productGroup.minQuantity}</td>
					<td>${productGroup.maxQuantity}</td>
					
				</tr>
           </c:forEach>    
 			</tbody>
           </table>
           <br/>
         </div>
                                  </div><!-- /.box-body -->
							
				<div class="row" style="text-align: center;">
				<%--  <input type=button class="btn bg-olive btn-inline" onclick="validateSupplierForm('edit')" value="<spring:message code="save.label" />" /> --%>
				 <!-- <input type="submit" class="btn bg-olive btn-inline" style="margin-left:5%;" onclick="" value="Reset" /> -->
				<input type="button" style="margin-left:5%;" class="btn bg-olive btn-inline btnCls" onclick="viewSupplierMaster('supplierMaster','0');" value="<spring:message code="cancel.label" />" />
				</div>
							<br/>
                                  <div class="box-footer">
                               </div>
                              </form>
                          </div>
		 <input type="hidden" value="${maxRecords}" id="maxRecords"/>
                           <input type="hidden" value="${searchName}" id="searchSupplier"/>
		
</div>
</div>
</section><!-- /.content -->
<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/currency_plugin.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//$("#currencyCode").focus();
	var count=con.length;
	var op = '<option value="-1" ></option>';
	for(var i=0;i<count;i++)
		op = op +"<option value="+i+">"+con[i]+"</option>";
	$("#countryCode").html(op);
	//print_country("countryName");
	/* var selectedCountry = $("#selectedCountry").val()
	$("#countryCode").val(selectedCountry); */
	/* var selectedCountry = $("#selectedCountry").val();
	if(selectedCountry == null || selectedCountry == ""){
		selectedCountry = "India";
	} */
	var selectedCountry = $("#selectedCountry").val();
	$("#countryCode option").each(function() {
	  if($(this).text() == selectedCountry) {
	    $(this).attr('selected', 'selected');            
	  }                        
	});
	var index = $("#countryCode").val();
	if(index != "-1")
		$("#currencyCode").val(cod[index] +" - "+ cur[index]);
});
</script>
</body>
</html>