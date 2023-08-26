<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : changePassword.jsp
 * file type		        : JSP
 * description				: The change password form is displayed using this jsp
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
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	        <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	        <!-- bootstrap wysihtml5 - text editor -->
	        <link href="${pageContext.request.contextPath}/css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" />
	        <!-- Theme style -->
	        <link href="${pageContext.request.contextPath}/css/AdminLTE.css" rel="stylesheet" type="text/css" />
	        <%-- <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script> --%>
			<script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonscript.js"></script>
	        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	        <!--[if lt IE 9]>
	          <script src="js/html5shiv.js"></script>
	          <script src="js/respond.min.js"></script>
	        <![endif]-->
	        <script type="text/javascript">
	        $(document).ready(function(){
	           
	            $("#passError").html("");
	            $("#newPassError").html("");
	            $("#confPassError").html("");
	            $("#password").focus();
	            
	         	$("#password").blur(function(){
	         		var password = $("#password").val();
	         		if(password == ""){
	         			$("#passError").html("Password is Required");
	         			$("#password").focus();
	         			return false;
	         		}
	         	  	if(!passwordValidation(password)){
	         	  		$("#passError").html("Invalid Password (Ex:Tech123@)");
	         	  		$("#password").focus();
	         	  		return false;
	         	  	}
	         	  	else{
	        		    $("#passError").html("");
	        		    $("#newPassError").html("");
	    	            $("#confPassError").html("");
	        		    return true;
	        	    }
	         	 }); 
	         	
	         	$("#newPassword").blur(function(){
	         		var newPassword = $("#newPassword").val();
	         		if(newPassword == ""){
	         			$("#newPassError").html("New Password is Required");
	         			return false;
	         		}
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
	         		var newPassword = $("#newPassword").val();
	         		if(confirmPassword == ""){
	         			$("#confPassError").html("Confirm Password is Required");
	         			return false;
	         		}
	         		else if(newPassword != confirmPassword){
	             			$("#confirmPassword").val("");
	             			$("#confirmPassword").focus();
	             			$("#confPassError").html("Password did not match");
	             			return false;
	             		}
	         	  	else{
	        		    $("#passError").html("");
	        		    $("#newPassError").html("");
	    	            $("#confPassError").html("");
	        		    return true;
	        	    }
	         	 });
	         	
	         	 $("#password").keydown(function(){
	        		   $("#passError").html("");
	        		   $("#newPassError").html("");
	    	           $("#confPassError").html("");
	    	           $("#error").html("");
	    	           $("#Msg").html("");
	         	 }); 
	         	$("#newPassword").keydown(function(){
	        		   $("#newPassError").html("");
	        		   $("#error").html("");
	        		   $("#Msg").html("");
	         	 });
	         	$("#confirmPassword").keydown(function(){
	        		  $("#confPassError").html("");
	        		  $("#error").html("");
	        		  $("#Msg").html("");
	         	 });
	        });
	       
	       
	        </script>
</head>
<body>
				<div class="box box-primary">
                                <div class="box-header" style="text-align: center">
                                <br/>
                                <h3><spring:message code="edit.password.header" /></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form>
                                    <div class="box-body">
                                        
                                        <div class="form-group">
                                            <label><spring:message code="EmployeeForm.password" /></label>
                                            <input type="password" class="form-control" id="password" placeholder="<spring:message code="enter.EmployeeForm.password" />" />
                                        </div>
                                        <font color="red" size="2"><b>
											<div id="passError" style="text-align:right"></div>
										</b></font>
                                        <div class="form-group">
                                            <label><spring:message code="EmployeeForm.newPassword" /></label>
                                            <input type="password" class="form-control" id="newPassword" placeholder="<spring:message code="enter.EmployeeForm.newPassword" />" />
                                        </div>
                                        <font color="red" size="2"><b>
											<div id="newPassError" style="text-align:right"></div>
										</b></font>
                                        <div class="form-group">
                                            <label><spring:message code="EmployeeForm.confirmPassword" /></label>
                                            <input type="password" class="form-control" id="confirmPassword" placeholder="<spring:message code="enter.EmployeeForm.confirmPassword" />" />
                                        </div>
                                        <font color="red" size="2"><b>
											<div id="confPassError" style="text-align:right"></div>
										</b></font>
										<font color="red" size="2"><b>
										<div id="error" style="text-align: center"></div>
									</b></font>
									<font color="blue" size="2"><b>
										<div id="Msg" style="text-align: center"></div>
									</b></font>
                                    </div><!-- /.box-body -->
									
						<div class="row" style="text-align: center;">
						 <input type="button" class="btn bg-olive btn-inline" onclick="return validateChangePasswordForm('notLink');" value="<spring:message code="save.label" />" />
						 <!-- <input type="submit" class="btn bg-olive btn-inline" style="margin-left:5%;" onclick="" value="Reset" /> -->
						<%-- <input type="button" class="btn bg-olive btn-inline" style="margin-left:5%;" onclick="return resetChangePasswordForm();" value="<spring:message code="cancel.label" />" /> --%>
						</div>
							<br/>
									
                                    <div class="box-footer">
                                     <!--    <button type="submit" class="btn btn-primary">Submit</button> -->
                                    </div>
                                </form>
                            </div>

</body>
</html>