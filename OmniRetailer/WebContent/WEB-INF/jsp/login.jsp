<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : login.jsp
 * file type		        : JSP
 * description				: The login form is displayed using this jsp
 * */ -->

<!DOCTYPE html>
<%@page errorPage="commonError.jsp"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%> 
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@page import="java.util.Locale"%>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 

	
	<title>Home | Omni Retailer</title>
	<link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/images/TechnoLabs-favicon.png"/>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	
	<!-- Theme style -->
    <link href="${pageContext.request.contextPath}/css/AdminLTE.css" rel="stylesheet" type="text/css" />

	<!-- Ionicons -->
        <link href="${pageContext.request.contextPath}/css/ionicons.min.css" rel="stylesheet" type="text/css" />
        
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    	<script src="./js/html5shiv.js"></script>
    	<script src="./js/respond.min.js"></script>
    <![endif]-->
    
     <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
     <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
	 <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.6.4.min.js"></script> --%>
	 <script src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
	 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
	<!--  <script type="text/javascript" src="${pageContext.request.contextPath}/js/commonscript.js"></script> -->
    
    <style type="text/css">
    p  {
    	text-align:center;
    }
    #footer{
    	margin-top:10px
    }
    #body{
    	padding-bottom:20px
    }
   #eye{
	float: right;
    position: absolute;
    z-index: 9999;
    margin-left: -20px;
    margin-top: 5px;
}
  
    
    </style>
    
    <script type="text/javascript">
	$(document).ready(function(){
		history.pushState(null, null, '');
		history.back(); 
		history.forward();
	    window.addEventListener('popstate', function(event) {
	    history.pushState(null, null, '');
	    createCaptcha()
	    });
	    
	   
		/* window.open ("http://viralpatel.net/blogs/",
				"mywindow","status=1,toolbar=0");
		window.history.forward(-1); */
		/* window.history.forward(); */
		 
    $("#emailError").html("");
    $("#passError").html("");
    var emailId = $("#emailId").val();
	  /* if(emailId==""){
		  $("#loginError").html("");
	  } */
    /* $("#loginError").html(""); */
    $("#userId").focus();
    $("#emailId").blur(function(){
 	  var emailId = $("#emailId").val();
 	  if(emailId==""){
 		  return false;
 	  }
 	  if(!emailValidation(emailId)){
 	   	$("#emailError").html("Invalid Email Id");
 	   	$("#passError").html("");
 	   	$("#emailId").focus();
 	   	return false;
 	  }
 	  else{
 		$("#emailError").html("");
	    $("#passError").html("");
	    return true;
 	  }
 	});  
 	   
 	$("#password").blur(function(){
 		var emailId = $("#emailId").val();
 	  	var password = $("#password").val();
 	  	if(emailId=="" || password==""){
	    	return false;
	    }
 	  	if(!passwordValidation(password)){
 	  		$("#emailError").html("");
 	  		$("#passError").html("Invalid Password");
 	  		// $("#password").focus();
 	  		return false;
 	  	}
 	  	else{
	    	$("#emailError").html("");
		    $("#passError").html("");
		    return true;
	    }
 	 }); 
 	
 	  $("#emailId").on('input',function(e){
 		   $("#emailError").html("");
		   $("#passError").html("");
		   $("#loginError").html("");
 	 });
 	 
 	 $("#password").on('input',function(e){
 		   $("#emailError").html("");
		   $("#passError").html("");
		   $("#loginError").html("");
 	 }); 
 	 
 	$("#captchaPassword").on('input',function(e){
		   $("#loginError").html("");
		   $("#captchaError").html("");
		   $("#captchaClientError").html("");
	 }); 
 	 
	
 	
 	
 	 $("#userId").on('input',function(e){
		   $("#emailError").html("");
		   $("#passError").html("");
		   $("#loginError").html("");
	 }); 
 	 
 	
 	// for eye icon for hide and unhide password 
  	
	    $('#eye').click(function () {
	        $('#password').attr('type', $('#password').is(':password') ? 'text' : 'password');
	        if ($('#password').attr('type') === 'password') {
	            $('#eye').removeClass('bi bi-eye').addClass('bi bi-eye-slash-fill');
	        } else {
	            $('#eye').removeClass('bi bi-eye-slash-fill').addClass('bi bi-eye');
	        }
	    });
	    
 	 
 	/* if(window.name == '' || window.name !='firstTimeLogin'){ 
 	invokeInvalidBrowserWindow(); 
 	} 
 	function invokeInvalidBrowserWindow(){ 
 	document.invalidwindow.submit(); 
 	}  */
 	

 	 
});

	
	
	</script>
	</head>
    <body >
	

	<div class="login-box-body" id="login-box">
		<div class="header"><spring:message code="enter.login.details.label" /></div>
		<form action="${pageContext.request.contextPath}/login/authenticateUser.do" method="post">
			<div id="body" class="body bg-gray">
			
                   <label><spring:message code="userid.label" /></label>
                    <div class="input-group">
                      <span class="input-group-addon"><i class="fa fa-user"></i></span>
                      <input type="text" class="form-control" required value="${customerId}" oninput="this.value = this.value.replace(/ /g,'');" name="customerId" id="userId" size="50" placeholder="<spring:message code="enter.userid.label" />" />
                    </div>
                    <font color="red" size="2"><b>
					<span id="clientError" style="text-align:right"></span>
					</b></font>
                   <br/>
                 
                    <label><spring:message code="username.label" /></label>
                    <div class="input-group">
                      <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                      <input type="email" class="form-control" required name="emailId" id="emailId" value="${emailId}" oninput="this.value = this.value.replace(/ /g,'');" size="50" placeholder="<spring:message code="enter.username.label" />" />
                    </div>
                    <font color="red" size="2"><b>
					<span id="emailError" style="text-align:right"></span>
					</b></font>
                      <input type="hidden" id="geoLocation" name="geoLocation" value="">
                    <br/>
                    <label><spring:message code="password.label" /></label>
                    <div class="input-group">
                          <span class="input-group-addon"><i class="fa fa-unlock-alt"></i></span>
                          <input type="password" class="form-control" required value="${password}" name="password" id="password" oninput="this.value = this.value.replace(/ /g,'');" size="50" placeholder="<spring:message code="enter.password.label" />" /><i class="bi bi-eye-slash-fill" id="eye"></i>  
                    </div>
                      <font color="red" size="2"><b>
						<span id="passError" style="text-align:right"></span>
					</b></font>
					 
					
                    <%-- <div class="row" >
    <div  class="" id="contactuscaptcha" style="padding-left:0px;">
   <%@include file="query.jsp" %></div>
     <div class="col-sm-4 col-lg-4 col-xs-5">
      <input type="button" id="submitBtn" value="<spring:message code="contactus.submit" />" class="contactSubmit" onclick="checkCaptcha(this)" />
     </div>  
   </div> --%>
   <br>
    <div class="row" >
   <div class="col-sm-12 col-lg-12 col-xs-12">
    <div  class="" id="contactuscaptcha" style="padding-left:0px;">
   <div class="col-sm-7 col-lg-7 col-xs-7" id="captcha" style="background-image: url(${pageContext.request.contextPath}/images/captcha_bg.jpg);border:1px solid gray;height:60px;"> </div>
   </div>
     <div class="col-sm-5 col-lg-5 col-xs-5"  style="padding-right:0px;">
     <label><b>Captcha*</b></label>
     <%-- <img alt="" src="${pageContext.request.contextPath}/images/outlet1.png"> --%>
      <input type="text" spellcheck="false" autocomplete="off" class="form-control" placeholder="CaptchaText" id="cpatchaTextBox"/>
  <!--  <font color="red" size="2">   <span id="captchaErr" ></span></font> -->
   <font color="red" size="2"><b>
					<span id="captchaErr" style="text-align:right"></span>
					</b></font>
      <input type="hidden" id="captchaStr" >
     </div>  
   </div>
   </div>
   <div class="row" >
    <div class="col-sm-12 col-lg-12 col-xs-12">
    <img alt="_blank" src="${pageContext.request.contextPath}/images/reload.png" width="4%" height="4%" onclick="createCaptcha()">
    </div>
    </div>
    <!-- <font color="red" size="2"><b>
						<span id="captchaError" style="text-align:right"></span>
					</b></font>
                    <br>
                     <input type="hidden" id="checkcaptcha" value=""> -->
                    
                  
					<font color="red" size="2"><b>
					<span id="loginError" style="text-align: center">${err}</span>
					</b></font>
               
                </div>
                <div id="footer" class="footer">
                    <button type="submit" class="btn bg-olive btn-block" onclick="return validateLoginForm();" ><spring:message code="login.label" /></button>
                    <p><a href="${pageContext.request.contextPath}/login/forgotPasswordForm.do"><spring:message code="forgot.password.label" /></a></p>
                </div>
            </form>
			</div>

	
	<input type="hidden" id="contextPath" value="${pageContext.request.contextPath}">
<%@ include file="trackLocation.jsp" %>
<script type="text/javascript">

function createCaptcha() {
	  //clear the contents of captcha div first 
	  document.getElementById('captcha').innerHTML = "";
	  var charsArray =
	  "023456789abcdefghijkmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@#!";
	  var lengthOtp = 6;
	  var captcha = [];
	  for (var i = 0; i < lengthOtp; i++) {
	    //below code will not allow Repetition of Characters
	    var index = Math.floor(Math.random() * charsArray.length + 1); //get the next character from the array
	    if (captcha.indexOf(charsArray[index]) == -1)
	      captcha.push(charsArray[index]);
	    else i--;
	  }
	  var captchaStr="";
	  for(var i=0;i<captcha.length;i++){
		  if(captcha[i] != undefined){
		  captchaStr+=captcha[i];
		  }
	  }
	  document.getElementById("captchaStr").value=captchaStr;
	  var canv = document.createElement("canvas");
	  canv.id = "captcha";
	  canv.width = 170;
	  canv.height = 65;
	  var ctx = canv.getContext("2d");
	 // ctx.font = "400 25px Arial";
	 ctx.font = 'normal 25pt Courier';
	  ctx.strokeText(captcha.join(""), 15, 40);
	  ctx.fillText(captcha.join(""), 100, 100);
	  ctx.background="black";
	  //storing captcha so that can validate you can save it somewhere else according to your specific requirements
	  code = captcha.join("");
	  document.getElementById("captcha").appendChild(canv); // adds the canvas to the body element
	}

</script>
</body>
</html>