
<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * modified By				: Vinay
 * file name		        : admin/genericData/newB2BPartner.jsp
 * file type		        : JSP
 * description				: The new b2b employee form is displayed using this jsp
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
	<!-- InputMask -->
	<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script> 
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/masterDataManagement/genericMasters/B2BPartner.js"></script>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/controller.js"></script>
	<script src="${pageContext.request.contextPath}/js/demo-compiled.js"></script>	
	
<style type="text/css">
	.col-xs-12 {
	 padding: 1% 4% 1% 4%;
	 }
	 .btnCls {
	 	width: 120px;
    	font-size: 18px;
	 }
	
</style>
<script type="text/javascript">
$(document).ready(function(){
	 debugger
	 var URL = $('#partnerURLlink').val();
	 if(URL != null && URL != ""){
		 downloadPartnerQRs();
	 }
	 
});

</script>

</head>
<body>


<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12" >
				<div class="box box-primary">
                                <div class="box-header" style="text-align: center">
                                <h3  class="box-title" style="border:1px solid #937c7c;padding:7px;font-weight: 600;">B2B Partner - New</h3>
                                </div><!-- /.box-header -->
                                 
                                <!-- form start -->
                                <form id="newB2BPartner" method="post">
                                    <div class="box-body">
                                    <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 20px; margin-top: -20px">${err}</div>
                                    <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 20px; margin-top: -20px">${success}</div>
                                   	<div class="row">
                                   	       <div class="form-group col-lg-3">
                                            <label>Partner ID <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" onblur="criteriaSlashes(this)" name="partnerId" value="" id="partnerId" required placeholder="Enter Partner ID" style=" width: 80%"/>
                                          <span id="partnerIDError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                        <div class="form-group col-lg-9"></div>
                                     </div>
                                     
                                     
                                   	<div class="row">
                                   		<div class="form-group col-lg-3">
                                            <label>Firm Name <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" onblur="criteria(this)" class="form-control" name="firmName" value="" id="firmName" required placeholder="Firm Name" style=" width: 80%" />
                                         <span id="firmNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                        
                                    	<div class="col-lg-3">
                                            <label>Address <span style="color:red; font-size:2">*</span></label>
	                                        <input type="text" onblur="criteria(this)" class="form-control" name="plotNumber" value="" id="plotNumber" required placeholder="Plot/Building" style="width: 60%" />
	                                        <span id="plotNumberError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
										<div class="form-group col-lg-3">
                                            <label>Business Type</label>
                                         	 <input type="text" onblur="criteria(this)" class="form-control" name="businessType" value="" id="businessType" required placeholder="Business Type" style=" width: 80%" />
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <label>GST Number </label>
                                             <input type="text" onblur="criteria(this)" class="form-control" name="gstNumber" value="" id="gstNumber" required placeholder="GST Number" style=" width: 80%" />
                                             <span id="gstNumberError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                        </div>
										<div class="row">
                                        <div class="form-group col-lg-3">
                                            <div class="col-lg-12 nopadding">
                                            <label>Person Name <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" onblur="criteria(this)" class="form-control" name="personName" value="" id="personName" required placeholder="Enter Person Name " style=" width: 80%" />
                                            <span id="personNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                            </div>
                                            <div class="col-lg-12 nopadding">
                                            <label>Bank A/C No</label>
                                            <input type="number" onblur="criteria(this)" class="form-control" name="bankAccountNo" value="" id="bankAccountNo" required placeholder="Account No" style=" width: 80%" />
                                            <span id="bankAccountNoError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                            </div>
                                            <div class="col-lg-12 nopadding">
                                            <label>Bank Name</label>
                                            <input type="text" onblur="criteria(this)" class="form-control" name="bankName" value="" id="bankName" placeholder="Enter Bank Name" style=" width: 80%"/>
                                        	</div>
                                        	<div class="col-lg-12 nopadding">
                                            <label>IFSC Code</label>
                                            <input type="text" onblur="criteria(this)" class="form-control" name="ifscCode" value="" id="ifscCode" placeholder="Enter IFSC Code" style=" width: 80%"/>
                                        	</div>
                                        </div>
                                        <div class="col-lg-3">
                                        	<div class="col-lg-12 nopadding">
                                        	<label> </label>
                                           <input type="text" onblur="criteria(this)" class="form-control" name="street" value="" id="street" required placeholder="Street/Road Name" style="margin-bottom: 5px;width: 80%" />
                                           <span id="streetError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                           </div>
                                           <div class="col-lg-12 nopadding">
                                           <input type="text" onblur="criteria(this)" class="form-control" name="location" value="" id="location" required placeholder="Location" style="margin-bottom: 5px; width: 80%;"/>
                                           <span id="locationError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                           </div>
                                           <div class="col-lg-12 nopadding">
                                           <input type="text" onblur="criteria(this)" class="form-control" name="city" id="city" value="" style="margin-bottom: 5px; width: 80%;" required placeholder="<spring:message code="EmployeeForm.address.city" />" />
                        		       	   <span id="cityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                        		       	 	</div>
                        		       	 	<div class="col-lg-12 nopadding">
	                        		       	<select class="form-control" name="state" id="state" style="width: 80%;">
		                                        <option value="" >Select State</option>
		                                        <c:forEach var="states" items="${states.stateMasters}">
		                            			 <option value="${states.stateName}" >${states.stateName}</option>
												</c:forEach>
		                                        </select>
		                                    <span id="stateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
		                                    </div>
                                         </div>
                                        
                                         
                                        <div class="form-group col-lg-3">
                                            <div class="col-lg-12 nopadding">
                                            <label>Phone <span style="color:red; font-size:2">*</span></label>
                                       		<input type="text" class="form-control" placeholder="<spring:message code="supplier.enter.mobile.label" />" style=" width: 80%;" id="b2bPhoneNumber"  size="10" maxlength="10" />
                                       		<span id="b2bPhoneNumberError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                              				</div>
                              				<div class="col-lg-12 nopadding">
                              				<label>Email ID <span style="color:red; font-size:2">*</span></label>
                                            <input type="email" class="form-control" name="email" value="" id="emailId"  style=" width: 80%" required placeholder="Enter Email ID" />
                                        	<span id="emailError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        	</div>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <label>PAN Number</label>
                                            <input type="text" onblur="criteria(this)" class="form-control" style="width:80%" name="panNumber" value="" placeholder="PAN Number" id="panNumber" />
                                            <span id="panNumberError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                            
                                            
                                        </div>
      
								</div>
                                         
                                <div class="row">
                                     	<div class="form-group col-lg-3">
                                            </div>
                                      	<div class="form-group col-lg-3">
                                        </div>
                                        
                                       	<div class="form-group col-lg-3">
                                        </div>
                                        <div class="form-group col-lg-3"></div>
                                                              
								</div>
                                <div class="row">
                                       <div class="col-lg-3"></div>
                                       <div class="form-group col-lg-3 formbordertopp">
                        		       		
                        		       </div>
                                       <div class="form-group col-lg-6"></div>
                                </div>
                                
                                 <div class="row">
                                       <div class="col-lg-3"></div>
                                       <div class="form-group col-lg-6"></div>
                                </div>
                                
                                <input type="hidden" name="partnerURLlink" id="partnerURLlink" value="${partnerURL}" />
                               
                          </div><!-- /.box-body -->
						<div class="row" style="text-align: center;">
						 <input type="button" style="" class="btnCls" onclick="validateB2BPartnerForm('new');" value="<spring:message code="submit.label" />" />
						  	<input type="button" class="btnCls buttonMargin"  onclick="viewb2bPartners('b2bPartners','0');" value="<spring:message code="cancel.label" />" />
						</div>
									<br/>
                                    <div class="box-footer"></div>
                                   
                       
                                </form>
                            </div>

</div>
</div>
</section>
</body>
</html>