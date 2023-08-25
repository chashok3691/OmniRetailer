<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : resetpasswordLink.jsp
 * file type		        : JSP
 * description				: The change password form is displayed using this jsp
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	        <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	        <!-- bootstrap wysihtml5 - text editor -->
	        <link href="${pageContext.request.contextPath}/css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" />
	        <!-- Theme style -->
	        <link href="${pageContext.request.contextPath}/css/AdminLTE.css" rel="stylesheet" type="text/css" />
			<script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonscript.js"></script>
	        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	        <!--[if lt IE 9]>
	          <script src="js/html5shiv.js"></script>
	          <script src="js/respond.min.js"></script>
	        <![endif]-->
	        <style type="text/css">
	        .box{
	        margin: 10% 30%;
	        width: 40%
	        }
	        </style>
	        <script type="text/javascript">
	        $(document).ready(function(){
	           
	           $("#newPassError").html("");
	           $("#confPassError").html("");
	           
	         	
	         	$("#newPassword").blur(function(){
	         		var newPassword = $("#newPassword").val();
	         		if(!passwordValidation(newPassword)){
	         	  		$("#newPassError").html("Invalid Password (Ex:Tech123@)");
	         	  		$("#newPassword").focus();
	         	  		return false;
	         	  	}
	         	  	else{
	        		    $("#passError").html("");
	        		    $("#newPassError").html("");
	    	            $("#confPassError").html("");
	        		    return true;
	        	    }
	         	 });
	         	
	         	$("#confirmPassword").blur(function(){
	         		var confirmPassword = $("#confirmPassword").val();
	         		if(confirmPassword == ""){
	         			$("#confPassError").html("Confirm Password is Required");
	         			return false;
	         		}else{
	        		    $("#newPassError").html("");
	    	            $("#confPassError").html("");
	        		    return true;
	        	    }
	         	 });
	         	
	         
	         	$("#newPassword").keydown(function(){
	        		   $("#newPassError").html("");
	        		   $("#Error").html("");
	         	 });
	         	$("#confirmPassword").keydown(function(){
	        		  $("#confPassError").html("");
	        		  $("#Error").html("");
	         	 });
	        });
	       
	       
	        </script>
</head>
<body onload="return setValues();">
				<div class="box box-primary">
                 	<div class="box-header" style="text-align: center">
                                <br/>
                                <h3><spring:message code="resetpassword.label" /></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form method="post">
                                    <div class="box-body">
                                       
                                        <div class="form-group">
                                            <label><spring:message code="EmployeeForm.newPassword" /></label>
                                            <input type="password" class="form-control" name="newPassword" id="newPassword" placeholder="Enter New Password" />
                                        </div>
                                        <span id="newPassError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        <div class="form-group">
                                            <label><spring:message code="EmployeeForm.confirmPassword" /></label>
                                            <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" placeholder="Re-Enter Password" />
                                        </div>
                                        <span id="confPassError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        <input type="hidden" name="uid" id="uid" value="${uid}"/>
                                        <input type="hidden" name="eid" id="eid" value="${eid}"/>
                                        
										<span id="Error" style="text-align:center;color:#3c8dbc;font-weight:bold;">${err}</span>
									
                                    </div><!-- /.box-body -->
									<input type="hidden" id="contextPath" value="${pageContext.request.contextPath}">
						<div class="row" style="text-align: center;">
						 <input type="button" class="btn bg-olive btn-inline" onclick="return validateResetPassword();" value="Save" />
						 <!-- <input type="submit" class="btn bg-olive btn-inline" style="margin-left:5%;" onclick="" value="Reset" /> -->
						<input type="button" class="btn bg-olive btn-inline" style="margin-left:5%;" onclick="openHomePage();" value="Cancel" />
						</div>
							<br/>
									
                                    <div class="box-footer">
                                     <!--    <button type="submit" class="btn btn-primary">Submit</button> -->
                                    </div>
                                </form>
                            </div>

</body>
</html>