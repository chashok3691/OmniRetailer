<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : editProfile.jsp
 * file type		        : JSP
 * description				: The edit profile form is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<%-- <script src="${pageContext.request.contextPath}/js/jquery-1.6.4.min.js"></script> --%>
	<script src="${pageContext.request.contextPath}/js/demo-compiled.js"></script>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/controller.js"></script>
 <!-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/form_plugin.js"></script> -->
 
	<script type="text/javascript">

$(document).ready(function(){
	 $.fn.serializeObject = function()
	{
	    var o = {};
	    var a = this.serializeArray();
	    $.each(a, function() {
	        if (o[this.name] !== undefined) {
	            if (!o[this.name].push) {
	                o[this.name] = [o[this.name]];
	            }
	            o[this.name].push(this.value || '');
	        } else {
	            o[this.name] = this.value || '';
	        }
	    });
	    return o;
	}; 
	
	var phoneNo = $("#contactOffice").val();
	phoneNo = phoneNo.split('-');
	if(phoneNo.length == 1)
		$("#phoneNumber").val(phoneNo[0]);
	else{
		$("#defaultCountry").val(phoneNo[0]);
		$("#phoneNumber").val(phoneNo[1]);
	}
	phoneNo = $("#contactPersonnel").val();
	phoneNo = phoneNo.split('-');
	if(phoneNo.length == 1)
		$("#phoneNumber1").val(phoneNo[0]);
	else{
		$("#defaultCountry1").val(phoneNo[0]);
		$("#phoneNumber1").val(phoneNo[1]);
	}
    $("#firstNameError").html("");
    $("#lastNameError").html("");
  	 $("#contactOffError").html("");
    $("#contactPersError").html("");
    $("#firstName").focus();
    
 
 	 $("#firstName").keydown(function(){
 		   $("#firstNameError").html("");
		   $("#Error").html("");
	 });
 	 $("#lastName").keydown(function(){
		   $("#lastNameError").html("");
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
<div class="box box-primary">
                            <div class="box-header" style="text-align: center">
    <br/>
    <h3><spring:message code="edit.employee.header" /></h3>
    </div><!-- /.box-header -->
    <!-- form start -->
    <form id="editProfile" method="post">
        <div class="box-body">
        <div id="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${err}</div>
        <div class="row">
        	 <div class="form-group col-lg-6">
                <label><spring:message code="EmployeeForm.firstName" /></label>
                <input type="text" class="form-control" name="firstName" id="firstName" required placeholder="<spring:message code="enter.EmployeeForm.firstName" />"  value="${userDetails.firstName}" />
            	<span id="firstNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
            </div>
            <div class="form-group col-lg-6">
                <label><spring:message code="EmployeeForm.lastName" /></label>
                <input type="text" class="form-control" name="lastName" id="lastName" required placeholder="<spring:message code="enter.EmployeeForm.lastName" />"  value="${userDetails.lastName}" />
           		<span id="lastNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
            </div>
          </div>
          <div class="row">
            <div class="form-group  col-lg-12">
                <label><spring:message code="EmployeeForm.email" /></label>
               <input type="email" class="form-control" name="email" id="email" readonly="readonly" required placeholder="<spring:message code="enter.EmployeeForm.email" />"  value="${userDetails.email}" />
            </div>
            </div>
            <div class="row">
        	 <div class="form-group col-lg-6">
                <label><spring:message code="EmployeeForm.contactOffice" /></label>
                <div class="row">
                       <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                       	<select style="padding: 6px 8px;" class="form-control" id="defaultCountry" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
                       		<option selected="selected">IN</option>
                       		<option>US</option>
                       		<option>GB</option>
                       		<option>AU</option>
                       	</select>
                       </div>
                       <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
                       	<input type="text" class="form-control" placeholder="<spring:message code="enter.EmployeeForm.contactOffice" />" id="phoneNumber" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                       </div>
                       <input type="hidden" class="form-control" name="contactOffice" id="contactOffice"  value="${userDetails.contactOffice}"/>
                        <input type="hidden" id="output" />
                  </div>
                 <span id="error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                
                <%--  <input type="text" class="form-control" name="contactOffice" id="contactOffice" required placeholder="<spring:message code="enter.EmployeeForm.contactOffice" />"  value="${userDetails.contactOffice}" />
            	<span id="contactOffError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> --%>
            </div>
           <div class="form-group col-lg-6">
                <label><spring:message code="EmployeeForm.contactPersonnel" /></label>
               <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                    	<select style="padding: 6px 8px;" class="form-control" id="defaultCountry1" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
                    		<option selected="selected">IN</option>
                    		<option>US</option>
                    		<option>GB</option>
                    		<option>AU</option>
                    	</select>
                    </div>
                    <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
                    	<input type="text" class="form-control" placeholder="<spring:message code="enter.EmployeeForm.contactPersonnel" />" id="phoneNumber1" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                    </div>
                    <input type="hidden" class="form-control" name="contactPersonnel" id="contactPersonnel"  value="${userDetails.contactPersonnel}"/>
                     <input type="hidden" id="output1" />
               </div>
              <span id="error1" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
               
                <%-- <input type="text" class="form-control" name="contactPersonnel" id="contactPersonnel" required placeholder="<spring:message code="enter.EmployeeForm.contactPersonnel" />"  value="${userDetails.contactPersonnel}" />
            	<span id="contactPersError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> --%>
            </div>
            </div>
          <div class="row">
            <div class="form-group col-lg-6">
                <label><spring:message code="EmployeeForm.workLocation" /></label>
                 <input type="text" readonly="readonly" class="form-control" id="workLocation" name="workLocation"  value="${userDetails.workLocation}" />
            </div>
            
            <div class="form-group col-lg-6">
                <label><spring:message code="EmployeeForm.role" /></label>
                <input type="text" readonly="readonly" class="form-control" id="role" name="role" placeholder="<spring:message code="enter.EmployeeForm.role" />" value="${userDetails.role}" />
            </div>
          </div>
        </div><!-- /.box-body -->
			
<div class="row" style="text-align: center;">
<input type="button" class="btn bg-olive btn-inline" onclick="updateProfile(this)" value="&nbsp;&nbsp;<spring:message code="save.label" />&nbsp;&nbsp;" />
 
<%-- <input type="button" class="btn bg-olive btn-inline" style="margin-left:5%;" onclick="" value="<spring:message code="cancel.label" />" /> --%>
</div>
			<br/>
                              <div class="box-footer">
                               <!--    <button type="submit" class="btn btn-primary">Submit</button> -->
        </div>
    </form>
</div>
					<input type="hidden" id="contextPath" value="${pageContext.request.contextPath}">
</body>
</html>