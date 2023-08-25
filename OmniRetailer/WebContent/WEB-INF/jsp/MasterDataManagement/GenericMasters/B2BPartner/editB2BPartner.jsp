
<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * modified By				: Vinay
 * file name		        : admin/genericData/newb2bPartnerList.jsp
 * file type		        : JSP
 * description				: The new b2bPartnerList form is displayed using this jsp
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
	 .downloadQRCode{
	 	color: #3c8dbc;
    	text-decoration: underline;
    	font-size: 16px;
	 }
</style>
<script type="text/javascript">
$(document).ready(function(){
	
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
                                <h3  class="box-title" style="border:1px solid #937c7c;padding:7px;font-weight: 600;">B2B Partner - Edit</h3>
                                </div><!-- /.box-header -->
                                 
              
           
                                <!-- form start -->
                                <form id="newB2BPartner" method="post">
                                    <div class="box-body">
                                    <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 20px; margin-top: -20px">${err}</div>
                                    <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 20px; margin-top: -20px">${success}</div>
                                   	<div class="row">
                                   	
                                   	<div class="col-lg-12">
                                   	<div class="col-lg-12">
                                   	<div class="row">
                                   	       <div class="form-group col-lg-3">
                                            <label>Partner ID <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" readonly disabled onblur="criteriaSlashes(this)" name="partnerId" value="${b2bPartnerList.partnerId}" id="partnerId" required placeholder="Enter Partner ID" style=" width: 50%"/>
                                          <span id="partnerIDError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                        <div class="form-group col-lg-9"></div>
                                     </div>
                                     </div>
                                     
                                    <div class="col-lg-9"> 
                                   	    <div class="row">
                                   		<div class="form-group col-lg-3">
                                            <label>Firm Name <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" onblur="criteria(this)" class="form-control" name="firmName" value="${b2bPartnerList.partnerName}" id="firmName" required placeholder="Firm Name" style="margin-bottom: 5px;width: 70%" />
                                         	<span id="firmNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                    	<div class="col-lg-3">
                                            <label>Address <span style="color:red; font-size:2">*</span></label>
	                                        <input type="text" onblur="criteria(this)" class="form-control" name="plotNumber" value="${b2bPartnerList.plotNo}" id="plotNumber" required placeholder="Plot/Building" style=" width: 70%" />
	                                        <span id="plotNumberError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
										<div class="form-group col-lg-3">
                                            <label>Business Type</label>
                                         	 <input type="text" onblur="criteria(this)" class="form-control" name="businessType" value="${b2bPartnerList.businessType}" id="businessType" required placeholder="Business Type" style=" width: 90%" />
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <label>GST Number </label>
                                            <input type="text" onblur="criteria(this)" class="form-control" name="gstNumber" value="${b2bPartnerList.gstNumber}" id="gstNumber" required placeholder="GST Number" style=" width: 90%" />
                                        	<span id="gstNumberError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                        </div>
										<div class="row">
                                        <div class="form-group col-lg-3">
                                         	<div class="col-lg-12 nopadding">
                                         	<label>Person Name <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" onblur="criteria(this)" class="form-control" name="personName" value="${b2bPartnerList.personName}" id="personName" required placeholder="Enter Person Name " style=" width: 90%" />
                                            <span id="personNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                            </div>
                                            <div class="col-lg-12 nopadding">
                                            <label>Bank A/C No</label>
                                            <input type="number" onblur="criteria(this)" class="form-control" name="bankAccountNo" value="${b2bPartnerList.bankAccountNumber}" id="bankAccountNo" required placeholder="Account No" style=" width: 90%" />
                                            <span id="bankAccountNoError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                            </div>
                                            <div class="col-lg-12 nopadding">
                                            <label>Bank Name</label>
                                            <input type="text" onblur="criteria(this)" class="form-control" name="bankName" value="${b2bPartnerList.bankName}" id="bankName" placeholder="Enter bank name" style=" width: 90%"/>
                                        	</div>
                                        	<div class="col-lg-12 nopadding">
                                            <label>IFSC Code</label>
                                            <input type="text" onblur="criteria(this)" class="form-control" name="ifscCode" value="${b2bPartnerList.ifscCode}" id="ifscCode" placeholder="Enter IFSC Code" style=" width: 90%"/>
                                        	</div>
                                        </div>
                                        <div class="form-group col-lg-3">
                                           <div class="col-lg-12 nopadding">
                                           <label> </label>
                                           <input type="text" onblur="criteria(this)" class="form-control" name="street" value="${b2bPartnerList.street}" id="street" required placeholder="Street/Road Name" style="margin-bottom: 5px;width: 90%" />
                                           <span id="streetError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                           </div>
                                           <div class="col-lg-12 nopadding">
                                           <input type="text" onblur="criteria(this)" class="form-control" name="location" value="${b2bPartnerList.address}" id="location" required placeholder="Location" style="margin-bottom: 5px;width: 90%;"/>
                                           <span id="locationError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                           </div>
                                           <div class="col-lg-12 nopadding">
                                           <input type="text" onblur="criteria(this)" class="form-control" name="city" id="city" value="${b2bPartnerList.city}" style="margin-bottom: 5px;width: 90%;" required placeholder="Enter City" />
           								   <span id="cityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>                             
                                           </div>
                                           <div class="col-lg-12 nopadding">
                                           <select class="form-control" name="state" id="state" style="margin-bottom: 5px;width: 90%;">
		                                        <option value="" >Select State</option>
		                                        <c:forEach var="states" items="${states.stateMasters}">
		                            			 <option value="${states.stateName}" ${states.stateName == b2bPartnerList.state ? 'selected' : ''}>${states.stateName}</option>
												</c:forEach>
		                                   </select>
		                                   <span id="stateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
		                                   </div>
                                         </div>
                                        
                                        <div class="form-group col-lg-3">
                                        	<div class="col-lg-12 nopadding">
                                            <label>Phone <span style="color:red; font-size:2">*</span></label>
                                       		<input type="text" class="form-control" placeholder="<spring:message code="supplier.enter.mobile.label" />" value="${b2bPartnerList.phone}" style=" width: 90%;" id="b2bPhoneNumber"  size="10" maxlength="10"/>
                              				<span id="b2bPhoneNumberError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        	</div>
                                        	<div class="col-lg-12 nopadding">
                                        	<label>Email ID <span style="color:red; font-size:2">*</span></label>
                                            <input type="email" onblur="" class="form-control" name="email" value="${b2bPartnerList.email}" id="emailId"  style=" width: 90%" required placeholder="Enter Email ID" />
                                        	<span id="emailError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        	</div>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <label>PAN Number </label>
                                            <input type="text" onblur="criteria(this)" class="form-control" style="width: 90%" name="panNumber" placeholder="PAN Number" value="${b2bPartnerList.pan}" id="panNumber" />
                                            <span id="panNumberError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
      
										</div>
                                         
	                                
                                </div>
                                <div class="form-group col-lg-3" style="text-align: center;">
                                <iframe onclick="downloadPartnerQRsEdit();" style="width: -webkit-fill-available; height: 180px;" src="${b2bPartnerList.qrCodePdfUrl}">
                                </iframe>
                                <a class="downloadQRCode" onclick="downloadPartnerQRsEdit();">download QR Code Here</a>
                                <input type="hidden" name="partnerqrCodePdfUrl" id="partnerqrCodePdfUrl" value="${b2bPartnerList.qrCodePdfUrl}"/>
                                <!-- <object data="http://101.53.158.27/Configurations/CID8995420/TEMP_PDF/partner2.pdf" type="application/pdf" width="230" height="180">
								</object>  -->
                                </div>
                                
                               	</div>
                               	</div>
                               	
                                    <input type="hidden" name="searchCriteria" value="${searchName}"/>
                                    <input type="hidden"  value="${maxRecords}" id="maxRecords" name="maxRecords"/>
                                    <input type="hidden" name="createdDateStr" id="createdDateStr" value="${b2bPartnerList.createdDateStr}" />
                                    <input type="hidden" name="updatedDateStr" id="updatedDateStr" value="${b2bPartnerList.updatedDateStr}" /> 
                                    
                                     
                                     </div><!-- /.box-body -->
                                     <br><br>
						<div class="row" style="text-align: center;">
						 <input type="button" style="" class="btnCls" onclick="validateB2BPartnerForm('edit');" value="<spring:message code="submit.label" />" />
						  	<input type="button" class="btnCls buttonMargin"  onclick="viewb2bPartners('b2bPartners','0');" value="<spring:message code="cancel.label" />" />
						</div>
									<br/>
                                    <div class="box-footer"></div>
                                   
                       
                                </form><!-- form end -->
                            </div>

</div>
</div>
</section>
</body>
</html>