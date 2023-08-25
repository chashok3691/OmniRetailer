<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Harsha
 * file name		        : /OmniRetailer/WebContent/WEB-INF/jsp/FinantialManagement/showReports.jsp
 * file type		        : JSP
 * description				: This is showReports, which u get after clicking on Reports label of Financial Management.
 * */ -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
           <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script> 
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/procurement/purchaseOrderAndReceipts.js"></script>
        
<style type="text/css">
.fa1{
   /*    border: 1px solid grey;
    border-radius: 50%;
    width: 29px;
    text-align: center;
    height: 28px; */
        margin-top: -10px;
    font-size: 26px;
        cursor: pointer;
    color: grey;
}
.fa-sort-asc{
margin-top: 5px !important;
}
.buttons {
	float: right;
	padding-top: 0px;
	/* margin-right: 2%;
	margin-top:1%; */
}
a.button, .list a.button {
	position:relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 5px 10px 5px 10px;
	background: #3c8dbc;
	border-radius: 5px;
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}
.blinking{-webkit-animation: blink 1s infinite;-moz-animation: blink 1s infinite;animation: blink 1s infinite;color:#3c8dbc;}
@-webkit-keyframes blink{
 0%{ opacity:0;}
 100%{opacity:1;}
}
@-moz-keyframes blink{
    0%{ opacity:0;}
    100%{opacity:1;}
}
@keyframes blink{
    0%{ opacity:0;}
    100%{opacity:1;}
}
.iosclosebutton {
    width: 25%;
    border: 1px solid #3c8dbc;
    background: #3c8dbc;
    color: #fff;
    font-size: 15px!important;
    padding: 3px 0 4px 0;
    height: 30px!important;
    font-size: 18px;
    letter-spacing: 1px;
    float: right;
}
.iospopup {
    width: 22%!important;
    margin-left:45%;
    margin-top: 0%;
    border-radius: 0;
}
.modal-dialog {
    width: auto;
    margin: 30px auto;
}
.modal-dialog
{
 margin-top: 14.5%;
 }
.billsPopUp
{
	position: relative;
    border: 2px solid gray;
    border-radius: 10px;
    background: #eee;
    min-height: 400px;
    max-height: 500px;
  /*   margin-right:2%; */
}
.billsPopUpUpArrow
{
	float: right;
    margin-right: 1%;
    font-size: 35px;
    color: gray;
    position: relative;
    margin-top: -2.3%;
    border-bottom: 3px solid lightgrey;
    height: 25px;
    border-bottom-width: 2px;
}
@media (min-width:1400px) and (max-width:1600px)
{
.billsPopUp {
    	margin-left: -20px !important;
      /*   margin-right:2% !important; */
}
.modal-dialog
{
 margin-top: 13%;
 }
.billsPopUpUpArrow {
  margin-top: -2% !important;
  border-bottom-width: 3px !important;
 }
   
 }

@media only screen and (max-width:479px)
{
.billsPopUp {
    margin-right: -30px;
    margin-left: -30px;
}
.summaryImg{
		width: auto;
    float: left;
	}
}
@media (min-width: 1200px){
	.summaryBtn{
		margin-top: 3px;
	}
}
@media (min-width: 1200px){
	.summaryImg{
	     width: 50%;
    float: right;
	}
}
.billsPopUp::after {
    content: "";
    position: absolute;
    bottom: 100%;
    /* left: 50%; */
    right: 1.5%;
    /* margin-left: 9px; */
    border-width: 14px;
    border-style: solid;
    border-color: transparent transparent #eee transparent;
}
</style>  
<!-- <script type="text/javascript">
$(document).ready(function(){
	callCalender('from');
	callCalender('to');
var err = $("#err").val();
if(err != "")
  //alert(err);
$("#searchShipmentReceiptId").val($("#shipmentReceiptSearch").val());
	$("#searchShipmentReceiptId").focus();
	
	
	
	
	var operation = $("#operation").val();
	$('#searchShipmentReceiptId').on('input',function(e){
		if($(this).val().trim()==""){
			viewShipmentReceipts(operation,'','0');
		}
	});
	
	
	var sDate=$("#sd").val();
	var s=sDate.split(' ');
	$("#from").val(s[0]);
	var eDate=$("#ed").val();
	var e=eDate.split(' ');
	$("#to").val(e[0]);
	
});
</script> -->
</head>    
<body>
                            <br/>
                         
                          <div class="row">                   
	                          	<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="profitability();" title="<spring:message code="Reports.profitability" />">
	                          			<img src="${pageContext.request.contextPath}/images/Users.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="Reports.profitability" /></span>
	                          		</div>
                          		</div>
	                          	<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="taxation();" title="<spring:message code="Reports.taxation" />">
	                          			<img src="${pageContext.request.contextPath}/images/Users.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="Reports.taxation" /></span>
	                          		</div>
                          		</div>   
	                          	<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="receivable();" title="<spring:message code="Reports.receivable" />">
	                          			<img src="${pageContext.request.contextPath}/images/Users.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="Reports.receivable" /></span>
	                          		</div>
                          		</div>                            		
	                          	<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="payables();" title="<spring:message code="Reports.payables" />">
	                          			<img src="${pageContext.request.contextPath}/images/Users.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="Reports.payables" /></span>
	                          		</div>
                          		</div>
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="deep();" title="<spring:message code="Reports.deep" />">
	                          			<img src="${pageContext.request.contextPath}/images/Users.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="Reports.deep" /></span>
	                          		</div>
                          		</div>
                           </div>                                                    
</body>
</html>