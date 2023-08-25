<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : forgotPassword.jsp
 * file type		        : JSP
 * description				: The forgot password form is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>

<meta charset="UTF-8">
	<title><spring:message code="forgot.password.page.title" /></title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.6.4.min.js"></script> --%>
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
	<!-- Theme style -->
    <link href="${pageContext.request.contextPath}/css/AdminLTE.css" rel="stylesheet" type="text/css" />

	<!-- Ionicons -->
        <link href="${pageContext.request.contextPath}/css/ionicons.min.css" rel="stylesheet" type="text/css" />
        
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    	<script src="${pageContext.request.contextPath}/js/html5shiv.js"></script>
    	<script src="${pageContext.request.contextPath}/js/respond.min.js"></script>
    <![endif]-->
    
    <script type="text/javascript">
	$(document).ready(function(){
 //   $("#emailError").html("");
    $("#userId").focus();
    $("#emailId").blur(function(){
 	  var emailId = $("#emailId").val();
 	  if(emailId==""){
 		  return false;
 	  }
 	  if(!emailValidation(emailId)){
 	   	$("#emailError").html("Invalid Email Id");
 	   	$("#emailId").focus();
 	   	return false;
 	  }
 	  else{
 		$("#emailError").html("");
	    return true;
 	  }
 	});  
    $("#emailId").keydown(function(){
		   $("#emailError").html("");
	 });
    $("#userId").keydown(function(){
		   $("#clientError").html("");
	 });
	});	   
	</script>   
	<style type="text/css">
	a {
		padding: 0px;
		margin: 0px;
	}
	</style>
</head>
<body>
<div class="login-box-body" id="login-box">
		<div class="header" ><spring:message code="recover.password.label" /></div>
		 <div id="Error" style="text-align:center;color:#3c8dbc !important;font-weight:bold; background-color: #eaeaec !important;"></div>
		 <div id="Errortext" style="text-align:center;color:red !important;font-weight:bold; background-color: #eaeaec !important;"></div>
		<form method="post">
			<div id="body" class="body bg-gray">
			<%-- <label><spring:message code="mail.address.label" /></label>
			<br/> --%>
			
			 <label><spring:message code="userid.label" /> <span class="requiredField">*</span></label>
                    <div class="input-group">
                      <span class="input-group-addon"><i class="fa fa-user"></i></span>
                      <input type="text" class="form-control" required value="" name="uid" id="userId" size="50" placeholder="<spring:message code="enter.userid.label" />" />
                    </div>
                   <font color="red" size="2"><b><span id="clientError" class="requiredField" style="text-align:right"></span></b></font>
                   <br/>
                   
				<label><spring:message code="username.label" /> <span class="requiredField">*</span></label>
			
                    	<div class="input-group">
                          <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                          <input type="text" class="form-control" name="eid" id="emailId" size="50" value="" placeholder="<spring:message code="enter.username.label" />">
                        </div>
                        <font color="red" size="2"><b><span id="emailError" class="requiredField" style="text-align:right"></span></b></font>
						<br/>
						
						<div class="row" style="text-align: center;">
						 	<input type="button" class="btn bg-olive btn-inline" onclick="return validateForgotPassword();" value="<spring:message code="send.label" />" />
							<input type="button" class="btn bg-olive btn-inline" style="margin-left:5%;" onclick="openHomePage();" value="<spring:message code="cancel.label" />" />
						</div>
						<br/>
						</div>
				</form>
				
                 <input type="hidden" id="contextPath" value="${pageContext.request.contextPath}">
			</div>



        
</body>
</html>