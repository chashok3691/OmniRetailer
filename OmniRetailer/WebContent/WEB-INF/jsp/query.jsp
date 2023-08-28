<%--
 % Example for using the Webservice http://captchas.net 
 % Replace the required parameters 'demo' and 'secret' with the
 % values you receive upon http://captchas.net/registration/ .
 % 
 % Optional Parameters and Defaults:
 % 
 % alphabet: abcdefghkmnopqrstuvwxyz (Used characters in captcha)
 % We recommend alphabet without mistakable ijl
 % 
 % letters: 6 (Number of characters in captcha)
 % 
 % width: 240 (image width)
 % height: 80 (image height)
 % 
 % Don't forget the same settings in check.jsp
 --%>



<%@ page language="java" import="captchas.CaptchasDotNet" %>

<html>
  <head>
    <title>Sample JSP CAPTCHA Query</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font-awesome.min.css" />
  

  </head>

<%
// Construct the captchas object (Default Values)
CaptchasDotNet captchas = new captchas.CaptchasDotNet(
  request.getSession(true),     // Ensure session
  "chaithu322",                       // client
  "mkE1Jg7gwl2xyoaX9AW2zF4H9znzppZbCbjEdmzI"                      // secret
  );
// Construct the captchas object (Extended example)
// CaptchasDotNet captchas = new captchas.CaptchasDotNet(
//  request.getSession(true),     // Ensure session
//  "demo",                       // client
//  "secret",                     // secret
//  "01",                         // alphabet
//  16,                           // letters
//  500,                          // width
//  80                            // height
//  );
%>
  <%-- 
   % encodeUrl produces jsessionid=xyz in case of disabled cookies
   % Please test your implementation also with disabled cookies
   --%>

 


   <div class="col-sm-12 col-lg-12 col-xs-12 " style="padding-top:15px;">
         <!--   <div class="captcharefresh" id="captchaclick"> </div> -->
         <div class="col-sm-8 col-lg-8 col-xs-8 captchaimage" style="padding-top: 4px;  padding-left: 0px;">     <%= captchas.image() %>
         </div>
        
        <div class="col-sm-4 col-lg-4 col-xs-4 captchatextbox" style="padding-right: 0px; padding-left: 0px;" >
            <label style="font-size: 16px;">Captcha*</label>
           <input class="form-control" Placeholder="" id="captchaPassword" autocomplete="off" name="captchaPassword" /> 
          <span id="captchaClientError" style="text-align:right;color: red;"></span>
          
           </div>
      
       </div>
  
  
  <!-- <div class="col-sm-12 col-lg-12 col-xs-12 " style="padding-left: 0px;">
         
          
          
           <div class="col-sm-12 col-lg-12 col-xs-12 captchatextbox" >
            <label>Captcha*</label>
           <input class="form-control" Placeholder="" autocomplete="off" name="captchaPassword" /> 
           </div>
      
      
      
       </div>
  -->
  
       
 <script>
 $("#captchaclick").click(function() {
	 $("#contactuscaptcha").load('leader.do');
 });</script>
 
</html>