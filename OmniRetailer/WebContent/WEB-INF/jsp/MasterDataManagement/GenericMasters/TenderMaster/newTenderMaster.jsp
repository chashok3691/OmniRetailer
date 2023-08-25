
<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Koti
 * file name		        : Inventory Manager/master/zoneMaster.jsp
 * file type		        : JSP
 * description				: The category details table is displayed using this jsp
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>


<html>
<head>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/countries.js"></script>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/controller.js"></script>
	<script src="${pageContext.request.contextPath}/js/demo-compiled.js"></script>


<script type="text/javascript">
$(document).ready(function(){
		//$("#address").focus();
		
	//	$.validate();
	/* print_country("country");
	var selectedCountry = $("#selectedCountry").val();
	if(selectedCountry == ""){
		$("#country").val("India");
	}else{
		var id = getCountryIndex(selectedCountry);
		$("#country").val(selectedCountry);
	} */
});
	

</script>



 <style type="text/css">
.form-control {
margin-bottom:10px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome | Omni Retailer</title>
</head>
<body>
<section class="content">
<div class="row">
  <div class="col-lg-12" style="padding: 2% 25%;">
<div class="box box-primary">
  
                                <div class="box-header">
                              <center> <h3 class="box-title" style="padding :5px;  border:1px solid  #808080;font-weight: bold;width: 20%;margin-bottom:40px;white-space: nowrap;">New Tender</h3></center>
                                </div><!-- /.box-header -->
                                <div id="ErrorDetail" class="Error"
									style="text-align: center; color: red; font-size: 2; font-weight: bold;">${err}</div>
								<div id="SuccessDetail" class="Error"
									style="text-align: center; color: blue; font-size: 2; font-weight: bold;">${success}</div>
                     <div class="box-body table-responsive" style="padding-left:50px">
                     
                     
                     <div class="row" style="margin-bottom:35px">
                     <div class="col-lg-12">
                     
                    
                     <div class="col-lg-6">
                     <label style="font-family: Calibri;color: gray;">Tender Code<span style="color:red; font-size:2">*</span></label>
	                <input class="form-control " style="width:65%" value=""  name="tendercode" onblur="criteria(this)" id="tendercode" size="20" type="text"   />
	                <span id="tendercodeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                     
                     </div>
                    
                     <div class="col-lg-6">
                     <label style="font-family: Calibri;color: gray;">Is Return Tender?<span style="color:red; font-size:2">*</span></label>
	                <select class="form-control " style="width:65%" name="returntender" id="returntender" >
                                            <option value="1" >Yes</option>
                                            <option value="0" >No</option>
                                            </select>
                                            <span id="returntenderError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                     
                     </div>
                    
                                        
                                        </div>
                                        
                                        <div class="col-lg-12">
                                        
                    
                     <div class="col-lg-6">
                     <label style="font-family: Calibri;color: gray;">Tender Name<span style="color:red; font-size:2">*</span></label>
	                <input class="form-control " style="width:85%" value=""  name="tenderName" onblur="criteria(this)" id="tenderName" size="20" type="text"   />
	                <span id="tenderNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                     
                     </div>
                    
                     <div class="col-lg-6">
                     <label style="font-family: Calibri;color: gray;">Allow  Return for other Tender?<span style="color:red; font-size:2">*</span></label>
	                <select class="form-control " style="width:85%" name="allowreturntender" id="allowreturntender" >
                                            <option value="1" >Yes</option>
                                            <option value="0" >No</option>
                                            </select>
                                            <span id="allowreturntenderError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                     
                     </div>
                    
                                       
                                        
                                        </div>
                                        
                <div class="col-lg-12">
                    <div class="col-lg-6">
                     <label style="font-family: Calibri;color: gray;">Tender Key<span style="color:red; font-size:2">*</span></label>
	                <input class="form-control " style="width:65%" value=""  name="tenderkey" onblur="criteria(this)" id="tenderkey" size="20" type="text" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"  />
	                <span id="tenderkeyError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                     
                     </div>
                                        
                     
                     <div class="col-lg-6">
                     <label style="font-family: Calibri;color: gray;">Country<span style="color:red; font-size:2">*</span></label>
	                
	                
	                
	              <select  style="width:65%" id="country" name ="country" class="form-control" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU" >
	              
	                                   <option value="IN" ${'IN' == tenderDetails.countryCode ? 'selected' : ''}>IN-India</option>
	                                  	<option value="US" ${'US' == tenderDetails.countryCode ? 'selected' : ''}>US-USA</option>
	                                  	<option value="GB" ${'GB' == tenderDetails.countryCode ? 'selected' : ''}>GB-United Kingdom</option>
	                                  	<option value="AU" ${'AU' == tenderDetails.countryCode ? 'selected' : ''}>AU-Australia</option>
	              </select>
	                <span id="tenderkeyError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                     
                     </div>
                                        
                                         
                                         </div>
                     <div class="col-lg-12">
                    <div class="col-lg-6">
                     <label style="font-family: Calibri;color: gray;">Mode of Payment<span style="color:red; font-size:2">*</span></label>
	                <input class="form-control " style="width:65%" value=""  name="modeOfPayment" onblur="criteria(this)" id="modeOfPayment"  type="text"   />
	                <span id="modeOfPaymentError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                     </div>
                                        
                     
                     <div class="col-lg-6">
                     <label style="font-family: Calibri;color: gray;">Back End Code</label>
					<input class="form-control " style="width:65%" value=""  name="backendCode" onblur="criteria(this)" id="backendCode"  type="text"   />
                     </div>
                     </div>                    
                                         
                                         
                                         
                                         
                                         
                                         <br>
                                        <br>
                                          <br>
                                         
                <div class="col-lg-12" style="margin-top: 20px;">
                     <div class="col-lg-6" style="margin-top: 32px;padding-left: 45px;">
                           <input type="button" style="width:55%;padding:8px" onclick="validateTender('tenderMaster','create')" class="btn bg-olive btn-inline addBtn"  value="Submit" />
                     </div>
                   
                     <div class="col-lg-6"  style="margin-top: 32px;padding-left: 45px;">
                   <input type="button" style="width:55%;padding:8px" onclick="return viewTenderMaster('tenderMaster','0');" class="btn bg-olive btn-inline addBtn"  value="Cancel" />
                       
                     </div>
                                        
                     
                     
                     
                     
                     </div>
                     </div>
                     
                     
                     
                     </div>
                     </div>
                     </div>
                     </div>
                     </section>



</body>
</html>