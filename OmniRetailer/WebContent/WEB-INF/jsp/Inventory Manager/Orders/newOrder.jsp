<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri.S
 * modified by              : koti bommineni
 * file name		        : inventorymanager/Orders/newOrder.jsp
 * file type		        : JSP
 * description				: dispaly specific order details
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

	 <!-- DATA TABLES -->
    <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/order.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
	<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
	<script src="${pageContext.request.contextPath}/js/demo-compiled.js"></script>
<!-- 	<script src='select2/dist/js/select2.min.js' type='text/javascript'></script> -->
<%-- 	<script type="text/javascript" src="${pageContext.request.contextPath}/js/searchIt.js"></script> --%>
<style type="text/css">

#overflowtext{

width : 200px;
overflow: hidden;
text-overflow: ellipsis;
 text-align: left;
white-space: nowrap;
}

label{
	white-space: nowrap;
}
.calendar_icon{
	background-color: white;
    color: #666;
    padding: 8px 0px 8px 27px!important;
    background: url(http://soe.syr.edu/images/cal_icon_mini.gif) no-repeat left center #fff;
    width: 100%;
    background-position: 5px 5px;
    border: 1px solid #DFDFDF;
    border-radius: 4px;
    -webkit-transition: all .2s ease-out;
    -moz-transition: all .2s ease-out;
    -ms-transition: all .2s ease-out;
    transition: all .2s ease-out;
    box-shadow: none;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
	.col-xs-12 {
	 padding: 2% 10%;
	 }
 @media (min-width: 768px){
  .seven-cols .col-md-1,
  .seven-cols .col-sm-1,
  .seven-cols .col-lg-1  {
    width: 100%;
    *width: 100%;
  }
  .uiv2-add-button {
    background-color: #6FC143;
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fee67c',endColorstr='#f2cb76',GradientType=0);
    color: #414042;
    float: left;
    padding: 10px 8px 5px 10px;
    border: 1px solid #f1e08e;
    border-radius: 5px;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    width: 97px;
    text-transform: uppercase;
    height: 35px;
    margin-left: 25%;
    margin-top: -7%;
    cursor: pointer;
}
#widgetpage{
/* margin: 1% 0%; */
    height: auto;
    overflow-y: auto;
    overflow-x: hidden;
    min-height: 230px;
    max-height: 500px;}
    .highlightaddress{
         background: gainsboro !important;
    /* color: white !important; */
    }
    
#menuItemsBar {
	border: none;
    background: none;
    outline: none;
}
   
.w3-btn-floating {
    width: 25px;
    height: 25px;
    line-height: 25px;
}

.w3-btn-floating, .w3-btn-floating-large {
    display: inline-block;
    text-align: center;
   
  
    position: relative;
    overflow: hidden;
    z-index: 1;
    padding: 0;
   
    cursor: pointer;
    font-size: 15px;
}
.w3-teal, .w3-hover-teal:hover {
 
    background-color: #FFFFFF;
    border: 1px solid #352504;
}
  
  .submitBtn
  {
  display: none;
  }

}


#copyAll{
	color: blue;
    text-decoration: underline;
    cursor: pointer;
    }
    
</style>
<script type="text/javascript">
 $(document).ready(function(){
	 
	 var d = new Date(),
	    h = (d.getHours()<10?'0':'') + d.getHours(),
	    m = (d.getMinutes()<10?'0':'') + d.getMinutes();
	 var start_time= h + ':' + m;
	 start_time=tConv24(start_time);
	 
	 debugger;
	 GetStoreSettings();
	 
	  var dateTime = getCurrentDate();
	  var date = dateTime.split(' ');
	  date = date[0].split('/');
	  var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
	  $('#orderDate').val(formatedDate);
	  $('#deliveryDate').val(formatedDate);
	  $('#confirmDate1').val(formatedDate);
	  callCalender('orderDate');
	  callCalenderOrder('deliveryDate','');
	  callCalenderOrder('confirmDate1','');
	  
	  var phoneNo = $("#mobile_num").val();
		phoneNo = phoneNo.split('-');
		if(phoneNo.length == 1)
			$("#phoneNumber").val(phoneNo[0]);
		else{
			$("#defaultCountry").val(phoneNo[0]);
			$("#phoneNumber").val(phoneNo[1]);
		}
		phoneNo = $("#shipmentContact").val();
		phoneNo = phoneNo.split('-');
		if(phoneNo.length == 1)
			$("#phoneNumber1").val(phoneNo[0]);
		else{
			$("#defaultCountry1").val(phoneNo[0]);
			$("#phoneNumber1").val(phoneNo[1]);
		}
		changeTotalQuantity();
		updateTotalCost();
		
	/*  $('#custDno').on('input',function(e){
			 if($(this).data("lastval") == undefined){
				 if($("#billDno").val() == "")
				 	$("#billDno").val($(this).val());
				 if($("#shipDno").val() == "")
				 	$("#shipDno").val($(this).val());
			 }
			 if($(this).data("lastval")== $("#billDno").val()){
				 $("#billDno").val($(this).val());
		 	 }
			 if($(this).data("lastval")== $("#shipDno").val()){
				 $("#shipDno").val($(this).val());
			 }
			 $(this).data("lastval",$(this).val());
     });
	 $('#billDno').on('input',function(e){
		 if($(this).data("lastval") == undefined){
			 if($("#custDno").val() == "")
			 	$("#custDno").val($(this).val());
			 if($("#shipDno").val() == "")
			 	$("#shipDno").val($(this).val());
		 }
		 if($(this).data("lastval")== $("#custDno").val()){
			 $("#custDno").val($(this).val());
	 	 }
		 if($(this).data("lastval")== $("#shipDno").val()){
			 $("#shipDno").val($(this).val());
		 }
		 $(this).data("lastval",$(this).val());
	 });
	 
	 $('#shipDno').on('input',function(e){
		 if($(this).data("lastval") == undefined){
			 if($("#custDno").val() == "")
			 	$("#custDno").val($(this).val());
			 if($("#billDno").val() == "")
			 	$("#billDno").val($(this).val());
		 }
		 if($(this).data("lastval")== $("#custDno").val()){
			 $("#custDno").val($(this).val());
	 	 }
		 if($(this).data("lastval")== $("#billDno").val()){
			 $("#billDno").val($(this).val());
		 }
		 $(this).data("lastval",$(this).val());
	 }); */
	 
	 if($("#orderDeliveryType").val() == "Pick Up"){
		 $("#shipmentCharges").attr("readonly","readonly");
	 }else{
		 $("#shipmentCharges").removeAttr("readonly");
	 }
	 debugger
	 
	  var workflow = $("#orderworkflow").val();
	 
// 	 $(".searchbox").val($("#listBox1 :selected").val())

	 /* if(workflow!=""){
	 if(workflow != 'Draft' || workflow != 'Ordered')
		 $('.forSubmitdisable').addClass('submitBtn'); 
	 else
		 $('.forSubmitdisable').removeClass('submitBtn'); 
	 } */
	  /* $('#custStreet').on('input',function(e){
			 if($(this).data("lastval") == undefined){
				 $("#billStreet").val($(this).val());
				 $("#shipStreet").val($(this).val());
			 }
			 if($(this).data("lastval")== $("#billStreet").val()){
				 $("#billStreet").val($(this).val());
		 	 }
			 if($(this).data("lastval")== $("#shipStreet").val()){
				 $("#shipStreet").val($(this).val());
			 }
			 $(this).data("lastval",$(this).val());
     }); */
	 /*  $('#custStreet').on('input',function(e){
			 if($(this).data("lastval") == undefined){
				 $("#billStreet").val($(this).val());
				 $("#shipStreet").val($(this).val());
			 }
			 if($(this).data("lastval")== $("#billStreet").val()){
				 $("#billStreet").val($(this).val());
		 	 }
			 if($(this).data("lastval")== $("#shipStreet").val()){
				 $("#shipStreet").val($(this).val());
			 }
			 $(this).data("lastval",$(this).val());
     }); 
	 $('#cusappartmentname').on('input',function(e){
			 if($(this).data("lastval") == undefined){
				 $("#billappartmentname").val($(this).val());
				 $("#shipappartmentname").val($(this).val());
			 }
			 if($(this).data("lastval")== $("#billappartmentname").val()){
				 $("#billappartmentname").val($(this).val());
		 	 }
			 if($(this).data("lastval")== $("#shipappartmentname").val()){
				 $("#shipappartmentname").val($(this).val());
			 }
			 $(this).data("lastval",$(this).val());
     }); 
	 
	 
	 $('#billappartmentname').on('input',function(e){
		 if($(this).data("lastval") == undefined){
			 $("#cusappartmentname").val($(this).val());
			 $("#shipappartmentname").val($(this).val());
		 }
		 if($(this).data("lastval")== $("#cusappartmentname").val()){
			 $("#cusappartmentname").val($(this).val());
	 	 }
		 if($(this).data("lastval")== $("#shipappartmentname").val()){
			 $("#shipappartmentname").val($(this).val());
		 }
		 $(this).data("lastval",$(this).val());
 }); 
	 
	 
	 $('#shipappartmentname').on('input',function(e){
		 if($(this).data("lastval") == undefined){
			 $("#billappartmentname").val($(this).val());
			 $("#cusappartmentname").val($(this).val());
		 }
		 if($(this).data("lastval")== $("#cusappartmentname").val()){
			 $("#cusappartmentname").val($(this).val());
	 	 }
		 if($(this).data("lastval")== $("#billappartmentname").val()){
			 $("#billappartmentname").val($(this).val());
		 }
		 $(this).data("lastval",$(this).val());
 }); 
	 
	 
			 
			 $('#custCity').on('input',function(e){
				 if($(this).data("lastval") == undefined){
					 $("#billCity").val($(this).val());
					 $("#shipCity").val($(this).val());
				 }
				 
			 
			 if($(this).data("lastval")== $("#billCity").val()){
				 $("#billCity").val($(this).val());
		 	 }
			 if($(this).data("lastval")== $("#shipCity").val()){
				 $("#shipCity").val($(this).val());
			 }
			 $(this).data("lastval",$(this).val());
     }); 
	 
	 
		  $('#billStreet').on('input',function(e){
			 if($(this).data("lastval") == undefined){
				 $("#custStreet").val($(this).val());
				 $("#shipStreet").val($(this).val());
			 }
			 if($(this).data("lastval")== $("#custStreet").val()){
				 $("#custStreet").val($(this).val());
		 	 }
			 if($(this).data("lastval")== $("#shipStreet").val()){
				 $("#shipStreet").val($(this).val());
			 }
			 $(this).data("lastval",$(this).val());
	 }); 
		 
		  $('#shipStreet').on('input',function(e){
			 debugger;
			 if($(this).data("lastval") == undefined){
				 $("#billStreet").val($(this).val());
				 $("#custStreet").val($(this).val());
			 }
			 if($(this).data("lastval")== $("#billStreet").val()){
				 $("#billStreet").val($(this).val());
		 	 }
			 if($(this).data("lastval")== $("#custStreet").val()){
				 $("#custStreet").val($(this).val());
			 }
			 $(this).data("lastval",$(this).val());
	 });  */
	 $(document).keypress(function (event) {
         //Check which key is pressed on the document or window
         if (event.keyCode === 13) {
		        event.preventDefault();
		    }
     });
	 
	 
	 /* $('#billCity').on('input',function(e){
			 if($(this).data("lastval") == undefined){
				 $("#custCity").val($(this).val());
				 $("#shipCity").val($(this).val());
			 }
			 if($(this).data("lastval")== $("#custCity").val()){
				 $("#custCity").val($(this).val());
		 	 }
			 if($(this).data("lastval")== $("#shipCity").val()){
				 $("#shipCity").val($(this).val());
			 }
			 $(this).data("lastval",$(this).val());
	 }); 
 $('#shipCity').on('input',function(e){
		 if($(this).data("lastval") == undefined){
			 $("#billCity").val($(this).val());
			 $("#custCity").val($(this).val());
		 }
		 if($(this).data("lastval")== $("#billCity").val()){
			 $("#billCity").val($(this).val());
	 	 }
		 if($(this).data("lastval")== $("#custCity").val()){
			 $("#custCity").val($(this).val());
		 }
		 $(this).data("lastval",$(this).val());
 }); 
	 
 $('#shipmentName').on('input',function(e){
	
	 if($(this).data("lastval") == undefined){
		 $("#billshipmentName").val($(this).val());
		 $("#CusshipmentName").val($(this).val());
		 
	 }
	 if($(this).data("lastval")== $("#billshipmentName").val()){
		 $("#billshipmentName").val($(this).val());
 	 }
	 if($(this).data("lastval")== $("#CusshipmentName").val()){
		 $("#CusshipmentName").val($(this).val());
	 }
	 $(this).data("lastval",$(this).val());
}); 	 
 $('#billshipmentName').on('input',function(e){
	 if($(this).data("lastval") == undefined){
		 $("#shipmentName").val($(this).val());
		 $("#CusshipmentName").val($(this).val());
	 }
	 if($(this).data("lastval")== $("#shipmentName").val()){
		 $("#shipmentName").val($(this).val());
 	 }
	 if($(this).data("lastval")== $("#CusshipmentName").val()){
		 $("#CusshipmentName").val($(this).val());
	 }
	 $(this).data("lastval",$(this).val());
}); 		 
 $('#CusshipmentName').on('input',function(e){
	 if($(this).data("lastval") == undefined){
		 $("#shipmentName").val($(this).val());
		 $("#billshipmentName").val($(this).val());
	 }
	 if($(this).data("lastval")== $("#shipmentName").val()){
		 $("#shipmentName").val($(this).val());
 	 }
	 if($(this).data("lastval")== $("#billshipmentName").val()){
		 $("#billshipmentName").val($(this).val());
	 }
	 $(this).data("lastval",$(this).val());
}); 	 

 
 $('#shipLandmark').on('input',function(e){
	 if($(this).data("lastval") == undefined){
		 $("#billLandmark").val($(this).val());
		 $("#cusLandmark").val($(this).val());
	 }
	 if($(this).data("lastval")== $("#billLandmark").val()){
		 $("#billLandmark").val($(this).val());
 	 }
	 if($(this).data("lastval")== $("#cusLandmark").val()){
		 $("#cusLandmark").val($(this).val());
	 }
	 $(this).data("lastval",$(this).val());
}); 	 
 $('#billLandmark').on('input',function(e){
	 if($(this).data("lastval") == undefined){
		 $("#shipLandmark").val($(this).val());
		 $("#cusLandmark").val($(this).val());
	 }
	 if($(this).data("lastval")== $("#shipLandmark").val()){
		 $("#shipLandmark").val($(this).val());
 	 }
	 if($(this).data("lastval")== $("#cusLandmark").val()){
		 $("#cusLandmark").val($(this).val());
	 }
	 $(this).data("lastval",$(this).val());
}); 		 
 $('#cusLandmark').on('input',function(e){
	 if($(this).data("lastval") == undefined){
		 $("#shipLandmark").val($(this).val());
		 $("#billLandmark").val($(this).val());
	 }
	 if($(this).data("lastval")== $("#shipLandmark").val()){
		 $("#shipLandmark").val($(this).val());
 	 }
	 if($(this).data("lastval")== $("#billLandmark").val()){
		 $("#billLandmark").val($(this).val());
	 }
	 $(this).data("lastval",$(this).val());
});

 $('#shipmentState').on('input',function(e){
	 debugger;
	 if($(this).data("lastval") == undefined || $(this).data("lastval") == ""){
		 $("#billState").val($(this).val());
		 $("#cusState").val($(this).val());
	 }
	 if($(this).data("lastval")== $("#billState").val()){
		 $("#billState").val($(this).val());
 	 }
	 if($(this).data("lastval")== $("#cusState").val()){
		 $("#cusState").val($(this).val());
	 }
	 $(this).data("lastval",$(this).val());
}); 	 
 $('#billState').on('input',function(e){
	 if($(this).data("lastval") == undefined || $(this).data("lastval") == ""){
		 $("#shipmentState").val($(this).val());
		 $("#cusState").val($(this).val());
	 }
	 if($(this).data("lastval")== $("#shipmentState").val()){
		 $("#shipmentState").val($(this).val());
 	 }
	 if($(this).data("lastval")== $("#cusState").val()){
		 $("#cusState").val($(this).val());
	 }
	 $(this).data("lastval",$(this).val());
}); 		 
 $('#cusState').on('input',function(e){
	 if($(this).data("lastval") == undefined){
		 $("#shipmentState").val($(this).val());
		 $("#billState").val($(this).val());
	 }
	 if($(this).data("lastval")== $("#shipmentState").val()){
		 $("#shipmentState").val($(this).val());
 	 }
	 if($(this).data("lastval")== $("#billState").val()){
		 $("#billState").val($(this).val());
	 }
	 $(this).data("lastval",$(this).val());
}); */
 
     $("#phoneNumber1").keydown(function(){
		   $("#phoneNumber1Error").html("");
		   $("#Error").html("");
	 });
	 $("#phoneNumber").keydown(function(){
		   $("#phoneNumberError").html("");
		   $("#Error").html("");
	 });
	 
	 $("#custpin").keydown(function(){
		   $("#custpinError").html("");
		   $("#Error").html("");
	 });
	 $("#billpinNum").keydown(function(){
		   $("#billpinNumError").html("");
		   $("#Error").html("");
	 });
	 
 });
 /* added by harsha on 3-6-2019 */
 function collapse(){
	 debugger;
	 $("#collapsible").toggle();
	 if($("#myfa").hasClass("fa-angle-down"))
		{
		 	$("#myfa").addClass("fa-angle-right");
		 	$("#myfa").removeClass("fa-angle-down");
		}
	 else
		{
		 	$("#myfa").addClass("fa-angle-down");
		 	$("#myfa").removeClass("fa-angle-right");		 
		}
	}
</script>
</head>
<body>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="nowTime" value="${now}" type = "time" pattern="hh:mm a" />
<fmt:formatDate var="nowDate" value="${now}" type = "date" pattern="dd/MM/yyyy" />
<input type="hidden" value="${nowTime}">
<input type="hidden" value="${nowDate}">
<input type="hidden" id="productsMenuFlag" value="false">
<!-- Content Header (Page header) -->
<%-- <section class="content-header">
				<h1><spring:message code="outlet.management.label" />
     				<small><spring:message code="customer.label" /> <spring:message code="orders.label" /></small>
    			</h1>
                 <ol class="breadcrumb">
                    <li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
                        <li class="active"><spring:message code="outlet.management.label"/></li>
                    </ol>
                </section> --%>
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
				<div class="box box-primary">
<%--                                 <div class="box-header" style="text-align: center">
                                <br/>
                                <h3><spring:message code="details.label" /></h3>
                                </div> --%><!-- /.box-header -->
                                <!-- form start -->
                                <form>
                                   <div class="box-body">
                                  <div class="row" style="text-align: right;margin-top: 10px;padding-right: 5px;">
                                  <div id="ErrorForShipment" style="text-align:center;color:red;font-weight:bold;"></div>
                                  <div id="Error" class="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                  <div id="Success" class="Error" style="text-align:center;color:blue;font-weight:bold;">${success}</div>
                                  
                                   <input type="hidden" id="orderworkflow" value="${orderDetails.orderStatus}"/>
                                  	<input type="button" id="edit" style="position: relative;" class="btnCls forSubmitdisable" onclick="createOrder('Ordered','new','outlet');" value="<spring:message code="submit.label" />" />
								  
								  	<input type="button" id="edit"  class="btnCls" style="margin-left:1%;margin-right:1%;position: relative;" onclick="createOrder('Draft','new','outlet');" value="<spring:message code="save.label" />" />
								 
								  
								  <input type="hidden" id="type" value="${type}">
								  <c:if test="${sessionScope.role == 'super admin'}">
								  	<input type="button" class="btn bg-olive btn-inline" style="margin-right: 1%;position: relative;" onclick="viewOrders('${status}','','0','${type}');" value="<spring:message code="back.label" />" />
								  </c:if>
								  <c:if test="${sessionScope.role != 'super admin'}">
									<c:if test="${flowUnder == 'outlet'}">
							           <c:forEach var="accessControl" items="${sessionScope.outletCustomerOrder}">
							                <c:if test="${accessControl.appDocument == 'outletCustomerOrders' && accessControl.write == true && accessControl.read == true}">
							                	<input type="button" class="btnCls" style="margin-right: 1%;;position: relative;" onclick="viewOrders('${status}','','0','${type}');" value="<spring:message code="back.label" />" /> 
							                </c:if>
							           </c:forEach>
							        </c:if>
						           <c:if test="${flowUnder == 'warehouse'}">
						           		<c:forEach var="accessControl" items="${sessionScope.warehouseSalesOrder}">
			                				<c:if test="${accessControl.appDocument == 'WarehouseShipmentOrders' && accessControl.write == true && accessControl.read == true}">
			                					<input type="button" class="btnCls" style="margin-right: 1%;position: relative;" onclick="viewOrders('${status}','','0','${type}');" value="<spring:message code="back.label" />" />
			                				</c:if>
			                			</c:forEach>
						           </c:if>
						           <c:if test="${flowUnder == 'management'}">
						           		<c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrder}">
			                				<c:if test="${accessControl.appDocument == 'OrderManagementSalesOrder' && accessControl.write == true && accessControl.read == true}">
			                					<input type="button" class="btnCls" style="margin-right: 1%;position: relative;" onclick="viewOrders('${status}','','0','management');" value="<spring:message code="back.label" />" />
			                				</c:if>
			                			</c:forEach>
						           </c:if>
							      </c:if>
									<hr style="margin-top: 4px;width: 99%;" />
									</div>
									 <input type="hidden" id="flowUnder" name="flowUnder" value= "${flowUnder}">
                                   <!-- added by harsha on 2-6-2019 -->
                                   <div class="row">
											<div class="col-lg-2" style="width:20%;margin-right: 20px;">
                                            <label><spring:message code="customer_contact_num.label" /> <span style="color:red; font-size:2">*</span></label>
                                             <div class="row">
				                                  <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4" style="width: 30%";>
				                                  	<select class="form-control" style="padding: 4px 6px;" id="defaultCountry" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
				                                  	<option text="India" ${'India' == orderDetails.country ? 'selected' : ''}>IN</option>
				                                  	<option text="USA" ${'USA' == orderDetails.country ? 'selected' : ''}>US</option>
				                                  	<option text="United Kingdom" ${'United Kingdom' == orderDetails.country ? 'selected' : ''}>GB</option>
				                                  	<option text="Australia" ${'Australia' == orderDetails.country ? 'selected' : ''}>AU</option>
				                                  	</select>
				                                  </div>
				                                  <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7" style="padding-left: 0px">
				                                  	<input style="width:110%;" type="text" class="form-control"  placeholder="<spring:message code="enter.customer_contact_num.label" />" id="phoneNumber" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
				                                  </div>
				                                  <input type="hidden" class="form-control" name="country" id="mobile_num_code"  value="${orderDetails.country}"/>
				                                  <input type="hidden" class="form-control" name="mobile_num" id="mobile_num"  value="${orderDetails.mobile_num}"/>
				                                   <input type="hidden" id="output" />
				                             </div>
<!-- 				                        	<span id="error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> -->
                                             <span id="phoneNumberError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                            </div>
                                        
                                        <div class="col-lg-4" style="padding-left: 0px;width: 33%;">
                                        <div class="row">                                      
                                     <div class="col-lg-6" style="width:40%;">
                                            <label><spring:message code="order_date.label" /> <span style="color:red; font-size:2">*</span></label>
											<input class="form-control calendar_icon" readonly="readonly" value="" style="background-color: white;" name="orderDate" id="orderDate" size="20" type="text" onfocus="callCalender('orderDate')" onclick="callCalender('orderDate')" placeholder="DD/MM/YYYY"/><span id="orderDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div> 
                                     <div class="col-lg-6" style="padding-left: 10px;padding-right: 0px;width: 40%;">
                                       <label>Fullfilment Location</label>
                                             <select class="form-control" id="outletLocation" onchange="GetStoreSettings()">
                                             <c:forEach var="location" items="${locationsList}">
                                               <c:if test="${location.locationId != 'B2C'}"> 
												<option value="${location.businessActivity}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
											  </c:if> 
											 </c:forEach>
											 </select>
											 <input type="hidden" name="saleLocation" id="saleLocation">
											  <input type="hidden" id="location">    
                                     </div>                                 
                                     </div> 
                                     

                                         </div>
                                     <div class="col-lg-1" style="width:15%;">
 										<label>Delivery Channel</label>
                                             <select class="form-control" id="">
                                             <option value="Delivery Boy">Delivery Boy</option>
                                              <option value="Logistics Provider">Logistics Provider</option>
                                             
                                            <%--  <c:forEach var="" items="${}">
												<option value="${location.businessActivity}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
											 </c:forEach> --%>
											 </select>                   
                                     </div>  
                                        
                                      <div class="col-lg-1" style="width:15%;">
 										<label>Customer Category</label>
                                            <select class="form-control" placeholder="Customer Category" >
	                                            <option disabled selected>Customer Category</option>
	                                        </select>
	                                        </div>
	                                      
	                                      <div class="col-lg-1" style="width:15%;">  
 										<label>Order Channel</label>
                                           <select class="form-control" name="orderChannel" id="orderChannel">
                                           <option value="Mobile" ${'Mobile' == orderDetails.orderChannel ? 'selected' : ''}>Mobile</option>
                                             <option value="Online" ${'Online' == orderDetails.orderChannel ? 'selected' : ''}>Online</option>
                                            <option value="Telephone" ${'Telephone' == orderDetails.orderChannel ? 'selected' : ''}>Telephone</option>
                                            <option value="Sales Executive" ${'Sales Executive' == orderDetails.orderChannel ? 'selected' : ''}>Sales Executive</option>
                                            <option value="Direct" ${'Direct' == orderDetails.orderChannel ? 'selected' : ''}>Direct</option>
                                            </select>                                        	                                                                            
                                     </div> 
                                     
                                   </div>
                                    <div class="form-group col-lg-2" style="display: none">
                                            <label><spring:message code="speacialDiscount.label" /></label>
                                            <input type="text" class="form-control" id="deliveryModel"  name="deliveryModel" value="Any Time"  />
                                    	</div>
                                    	 <input type="hidden" readonly="readonly" name="orderStatus" id="orderStatus"  value=""/> 
                                            <input type="hidden" readonly="readonly" name="selectedStatus" id="selectedStatus"  value="${status}"/>
                                   
									<div class="row">
											<div class="col-lg-2" style="width:20%;margin-right: 20px;">
											<div class="row">
	                                 <div class="col-lg-6" style="padding-right: 0px;">  
 										<label>First Name</label>
                                        <input class="form-control" style="" id="firstName" />
                                        <span id="firstNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>	                                        	                                                                            
                                     </div> 
	                                      <div class="col-lg-6" style="padding-left: 5px; width: 44%;">  
 										<label>Last Name</label>
                                            <input class="form-control" id="lastName" />	
                                            <span id="lastNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>                                        	                                                                            
                                     </div>                                      
										</div>
                                        </div>
                                        
                                        <div class="col-lg-4" style="padding-left: 0px;width: 33%;">
                                        <div class="row">                                      
                                     <div class="col-lg-6" style="width:40%;">
                                            <label>Delivery Date <span style="color:red; font-size:2">*</span></label>
 											<input class="form-control calendar_icon" readonly="readonly" value="${orderDetails.deliveryDate}" style="background-color: white;" name="deliveryDate" id="deliveryDate" size="20" type="text" onfocus="callCalenderOrder('deliveryDate','check')" onblur="callCalenderOrder('deliveryDate','check')" onclick="callCalenderOrder('deliveryDate','check')" placeholder="DD/MM/YYYY"/>                                        <span id="orderDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                    		<span id="deliveryDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div> 
										<div class="col-lg-6" style="padding-left: 10px;padding-right: 0px;">
                                            <div class="row" style="width:105%;">
				                                
				                                  <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
				                                   <label><spring:message code="starttime.label" /></label>
				                                   
				                                   <select style="width:130%;" class="form-control" id="deliverySlotStartTime" name="deliverySlotStartTime" onchange="startTimeChange(this.options[this.selectedIndex].index,'deliverySlotEndTime')">
		                                             <c:forEach var="startTime" items="${startTimeList}" >
		                                             <option value="${startTime}">${startTime}</option>
													 </c:forEach>
													 </select>
													<select style="width:130%;display:none;" disabled="disabled" class="form-control" id="deliverySlotStartTime2" name="deliverySlotStartTime" onchange="startTimeChange(this.options[this.selectedIndex].index,'deliverySlotEndTime2')">
		                                             <c:forEach var="startTime" items="${startTimeList2}">
		                                             <option value="${startTime}">${startTime}</option>
													 </c:forEach>
													 </select>
                                           			<span id="confirmStartTimeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>

				                                  </div>
				                                 
				                                  <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" >
				                                   <label><spring:message code="endtime.label" /></label>
													<select style="width:130%;" class="form-control" id="deliverySlotEndTime" name="deliverySlotEndTime" onchange="startTimeChange(this.options[this.selectedIndex].index,'deliverySlotStartTime')">
		                                             <c:forEach var="endTime" items="${endTimeList}">
														<option value="${endTime}">${endTime}</option>
													 </c:forEach>
													 </select>
													 <select style="width:130%;display:none;" disabled="disabled" class="form-control" id="deliverySlotEndTime2" name="deliverySlotEndTime" onchange="startTimeChange(this.options[this.selectedIndex].index,'deliverySlotStartTime2')">
		                                             <c:forEach var="endTime" items="${endTimeList2}">
														<option value="${endTime}">${endTime}</option>
													 </c:forEach>
													 </select>
				                                  </div>
				                             </div>
                                     </div>                                
                                     </div> 
                                     

                                         </div>
                                         
                                     <div class="col-lg-1" style="width:15%;">
 										<label>Delivery Type</label>
                                           <select class="form-control" name="orderDeliveryType" id="orderDeliveryType" onchange="changeShipmentCharges();">
                                            <option value="Door Delivery" ${'Door Delivery' == orderDetails.orderDeliveryType ? 'selected' : ''}>Door Delivery</option>
                                           <option value="Pick Up" ${'Pick Up' == orderDetails.orderDeliveryType ? 'selected' : ''}>Pick Up</option>
                                       </select>
	                                                                             
                                     </div>  
                                        
                                      <div class="col-lg-1" style="width:15%;">
 										<label>Payment Type</label>
                                            <select class="form-control" name="paymentType" id="paymentType">
	                                            <option value="On Delivery" ${'On Delivery' == orderDetails.paymentType ? 'selected' : ''}>On Delivery</option>
	                                            <option value="Prepaid" ${'Prepaid' == orderDetails.paymentType ? 'selected' : ''}>Prepaid</option>
                                            </select>
	                                        </div>
	                                      
	                                      <div class="col-lg-1" style="width:15%;">  
 										<label>Sales Person</label>
                                            <select class="form-control" id="salesexecutivename" name="sales_executive_name" onchange="getemployeeIdByName();"  data-search="true">	                           
	                            	<c:forEach var="employee" items="${employeeList}">
								
							        <option value="${employee.employeeCode}" ${employee.firstName == orderDetails.sales_executive_name ? 'selected' : ''}>${employee.firstName}</option>
							       
									</c:forEach>
	                        	</select>    	                                        	                                                                            
                                     </div> 
                                     
                                   
                                   </div>
									<div class="row">
                                    <div class="form-group col-lg-2" style="width: 20%;margin-right: 20px;">
                                            <label><spring:message code="customer_email.label" /></label>
                                            <input type="text" style="width:94%;" class="form-control" name="email_id" id="email_id" onblur="validateEmail();" value="${orderDetails.email_id}" placeholder="<spring:message code="order.enter.email" />"/>
                                            <span id="emailError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                        
                                        <div class="form-group col-lg-4" style="padding-left: 0px;width: 33%;">
                                        <div class="row" style="">                                      
                                     <div class="col-lg-6" style="width:40%;">
                                          <label>Confirm Date<span style="color:red; font-size:2">*</span></label>
										  <input class="form-control  calendar_icon" readonly="readonly"  style="background-color: white;width:130px;" id="confirmDate1" size="20" type="text" onfocus="callCalenderOrder('confirmDate1','check')"  onclick="callCalenderOrder('confirmDate1','check')" placeholder="DD/MM/YYYY" /> 
                                          <span id="confirmDate1Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>	
                                     </div> 
										<div class="col-lg-6" style="padding-left: 10px;padding-right: 0px;">
                                             <div class="row" style="width:105%;">
				                                
				                                  <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
				                                   <label><spring:message code="starttime.label" /></label>
				                                   
				                                   <select style="width:130%;" class="form-control" id="confirmedSlotStartTime"  onchange="startTimeChange(this.options[this.selectedIndex].index,'confirmedSlotEndTime')">
		                                             <c:forEach var="startTime" items="${startTimeList}" >
														<option value="${startTime}">${startTime}</option>
													 </c:forEach>
													 </select>
													 <select style="width:130%;display:none;" disabled="disabled" class="form-control" id="confirmedSlotStartTime2"  onchange="startTimeChange(this.options[this.selectedIndex].index,'confirmedSlotEndTime2')">
		                                             <c:forEach var="startTime" items="${startTimeList2}" >
														<option value="${startTime}">${startTime}</option>
													 </c:forEach>
													 </select>
                                           			<span id="confirmStartTimeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>

				                                  </div>
				                                 
				                                  <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" >
				                                   <label><spring:message code="endtime.label" /></label>
													<select style="width:130%;" class="form-control" id="confirmedSlotEndTime"  onchange="startTimeChange(this.options[this.selectedIndex].index,'confirmedSlotStartTime')">
		                                             <c:forEach var="endTime" items="${endTimeList}">
														<option value="${endTime}">${endTime}</option>
													 </c:forEach>
													 </select>
													 <select style="width:130%;display:none;" disabled="disabled" class="form-control" id="confirmedSlotEndTime2"  onchange="startTimeChange(this.options[this.selectedIndex].index,'confirmedSlotStartTime2')">
		                                             <c:forEach var="endTime" items="${endTimeList2}">
														<option value="${endTime}">${endTime}</option>
													 </c:forEach>
													 </select>
				                                  </div>
				                             </div> 
                                     </div>                                
                                     </div> 
                                     

                                         </div>
                                         
                                     <div class="form-group col-lg-1" style="width:15%;">
 										<label>Shipment Type</label>
                                             <select id="shipmentType" name="shipperId" class="form-control" onchange="getShipmentCost();">
												<option value="Normal" ${'Normal' == orderDetails.shipperId ? 'selected' : ''}>Normal</option>
												<option value="Express" ${'Express' == orderDetails.shipperId ? 'selected' : ''}>Express</option>
										    </select>
	                                                                             
                                     </div>  
                                        
                                      <div class="form-group col-lg-1" style="width:15%;">
 										<label>Payment Mode</label>
                                            <select class="form-control" name="paymentMode" id="paymentMode">
                                            	 <option value="Pay Cash" ${'Pay Cash' == orderDetails.paymentMode ? 'selected' : ''}>Pay Cash</option>
	                                            <option value="Debit Card" ${'Debit Card' == orderDetails.paymentMode ? 'selected' : ''}>Debit Card</option>
	                                            <option value="Credit Card" ${'Credit Card' == orderDetails.paymentMode ? 'selected' : ''}>Credit Card</option>
	                                            <option value="Net Banking" ${'Net Banking' == orderDetails.paymentMode ? 'selected' : ''}>Net Banking</option>
	                                            <option value="Wallets" ${'Wallets' == orderDetails.paymentMode ? 'selected' : ''}>Wallets</option>
	                                            <option value="Pay Online" ${'Pay Online' == orderDetails.paymentMode ? 'selected' : ''}>Pay Online</option>
	                                             <option value="POD" ${'POD' == orderDetails.paymentMode ? 'selected' : ''}>POD</option>
                                            </select>
	                                        </div>
	                                      
	                                    <!--   <div class="form-group col-lg-1" style="width:15%;">  
 										<label>Referred By</label> -->
                                            <input type="hidden" class="form-control" name="referredBy" id="referredBy"/>	                                        	                                                                            
                                   <!--   </div>  -->
                                      <div class="form-group col-lg-1" style="width:15%;">  
 										<label>Customer Tax ID</label>
                                            <input class="form-control"  id="customertaxid"/>	                                        	                                                                            
                                     </div> 
                                   
                                   </div>  
                               
                               <div class="form-group" onclick="collapse();" style="margin-bottom:5px;">
                               <label style="float: right;font-size: 16px;font-weight: bold;cursor: pointer;text-decoration: underline;">Addresses<i id="myfa" style="font-size: 25px;" class="fa fa-angle-down pull-right"></i></label>
                               </div>
                                   
                                    
                                   <br>
                                   <input type="hidden" id="ServiceAreaFlag" value="">
                                   <span id="ServiceAreaError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                   <div id="collapsible" >
                                    <div style="background-color: #e6e6e6;padding-left: 5px;padding-right: 15px;">
                                     <div class="row">
                                     <div class="form-group col-lg-1" style=" margin-top: 5px;">
                                    	<div style="background: gainsboro;padding: 10px;width: 149px;">
                                            <label style="font-size: 16px;width:140px;font-weight:bold;"><spring:message code="shipmentAddress.label" /></label>
                                        </div>
                                     </div>
                                     <div class="col-lg-2" style="margin-left:61px;margin-top: 5px;">
	                                        <span><a id="address1" onclick="shipmentAddress('address1',true)" style="height: 35px; width: 21px;margin-right: 1px;padding: 0px 5px 25px 5px;; border:solid 1px gray" class="w3-btn-floating w3-teal highlightaddress"><font size="+1">1</font></a></span>     
											<span><a id="address2" onclick="shipmentAddress('address2',true)" style="height: 35px; width: 21px;margin-right: 1px;padding: 0px 5px 25px 5px;; border:solid 1px gray" class="w3-btn-floating w3-teal"><font size="+1">2</font></a></span>   
											<span><a id="address3" onclick="shipmentAddress('address3',true)" style="height: 35px; width: 21px;margin-right: 1px;padding: 0px 5px 25px 5px;; border:solid 1px gray" class="w3-btn-floating w3-teal"><font size="+1">3</font></a></span>    
											<span><a id="address4" onclick="shipmentAddress('address4',true)" style="height: 35px; width: 21px;margin-right: 1px;padding: 0px 5px 25px 5px;; border:solid 1px gray" class="w3-btn-floating w3-teal"><font size="+1">4</font></a></span>
									</div>   
									<c:forEach var="addr" items="${addressList}" varStatus="theCount">
												<input type="hidden" value="${addr.shipmentName}" id="shipmentNameaddress${theCount.count}">
												<input type="hidden" value="${addr.shipmentContact}" id="shipmentContactaddress${theCount.count}">
<%-- 												<input type="hidden" value="${addr.shipmentContactCode}" id="shipmentContactCodeaddress${theCount.count}"> --%>
												<input type="hidden" value="${addr.country}" id="shipmentCountryNameaddress${theCount.count}">
												<input type="hidden" value="${addr.doorNumber}" id="shipDnoaddress${theCount.count}">  
												<input type="hidden" value="${addr.shipmentApartmentName}" id="shipmentApartmentName${theCount.count}">    
												<input type="hidden" value="${addr.streetName}" id="shipStreetaddress${theCount.count}">
												<input type="hidden" value="${addr.locality}" id="shipLocaddress${theCount.count}">
												<input type="hidden" value="${addr.city}" id="shipCityaddress${theCount.count}">
												<input type="hidden" value="${addr.state}" id="shipmentStateaddress${theCount.count}">
												<input type="hidden" value="${addr.country}" id="shipmentCountryaddress${theCount.count}">  
												<input type="hidden" value="${addr.longitude}" id="longitudeaddress${theCount.count}">   
												<input type="hidden" value="${addr.latitude}" id="latitudeaddress${theCount.count}"> 
												<input type="hidden" value="${addr.custAddressId}" id="custAddressIdaddress${theCount.count}"> 
												<input type="hidden" value="${addr.house_type}" id="houseTypeaddress${theCount.count}"> 
												<input type="hidden" value="${addr.addressType}" id="addressTypeddress${theCount.count}"> 
												
									</c:forEach>
									
									
									
									<div class="col-lg-3" style="margin-left: -62px;">
                                            <label><spring:message code="shipment.contact.number.label" /> <span style="color:red; font-size:2">*</span></label>
                                             <div class="row">
				                                  <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-4">
				                                  	<select class="form-control" style="padding: 4px 6px;" id="defaultCountry1" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
				                                  	<option text="India" ${'India' == orderDetails.shipmentCountry ? 'selected' : ''}>IN</option>
				                                  	<option text="USA" ${'USA' == orderDetails.shipmentCountry ? 'selected' : ''}>US</option>
				                                  	<option text="United Kingdom" ${'United Kingdom' == orderDetails.shipmentCountry ? 'selected' : ''}>GB</option>
				                                  	<option text="Australia" ${'Australia' == orderDetails.shipmentCountry ? 'selected' : ''}>AU</option>
				                                  	</select>
				                                  </div>
				                                  <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
				                                  	<input type="text" class="form-control"  onclick="validatePersonalMobileNumber()" placeholder="<spring:message code="shipment.contact.number.label" />" id="phoneNumber1" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
				                                  </div>
<%-- 				                                  <input type="hidden" class="form-control" name="shipmentContactCode" id="shipmentContactCode"  value="${orderDetails.shipmentContactCode}"/> --%>
				                                  <input type="hidden" class="form-control"  id="shipmentContact"  value="${orderDetails.mobile_num}"/>
				                                   <input type="hidden" id="output1" />
				                             </div>
				                        	<!-- <span id="error1" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> -->
				                        	<span id="phoneNumber1Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     	</div>
                                     	
                                     	
                                     	<div class="form-group col-lg-1" style="">
                                    	<label><spring:message code="doorNos.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="shipDno" name="shipement_address_doorNo" value="${orderDetails.shipement_address_doorNo}" placeholder="<spring:message code="order.enter.door.no" />" />
                                            <span id="shipDnoError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                    	</div>
                                    	<div class=" col-lg-2" style="">
                                     	  <label>Building Name<span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="shipappartmentname"  name="shipmentApartmentName" value="${orderDetails.shipmentApartmentName}" placeholder="Enter Building Name" />
                                            <span id="shipappartmentnameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                   
                                     	
                                     	</div>
                                     	
                                     	      <div class="form-group col-lg-3" style="margin-top: -5px;display: inline-block;">
                                     	
                                             <label><spring:message code="shipment_street.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="shipStreet" name="shipement_address_street" value="${orderDetails.shipement_address_street}" placeholder="<spring:message code="order.enter.street" />" />
                                            <span id="shipStreetError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                           </div>
                                    	<div class="form-group col-lg-3" style="margin-top: -5px;display: none;">
                                          <label><spring:message code="googlemaplink.label" /> </label>
                                            <input type="text" class="form-control" id="shipgogLink"  value="" placeholder="<spring:message code="enter.googlemaplink.label" />"/>
                                  
                                       </div>
										
									 
                                     </div>
                                     <input type="hidden" id="addressList" name="address">
                                      <input type="hidden" id="discountItemsList" name="discountItems">
                                       <input type="hidden" id="taxationItemsList" name="taxationItems">
                                         <input type="hidden" id="transactionItemsList" name="transactionItems">
                                     
                                     <div class="row">
                                      	<div class="form-group col-lg-3" style="margin-top: -17px;">
                                            <label><spring:message code="shipment.name.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="shipmentName" name="shipmentName" value="${orderDetails.shipmentName}"/>
                                            <span id="shipmentNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                    	</div>
                                    	
                                     
                                      
                                      	<div class="form-group col-lg-3" style="margin-top: -17px;">
                                            <label><spring:message code="shipment_location.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="shipLoc" name="shipement_address_location" value="${orderDetails.shipement_address_location}" placeholder="<spring:message code="order.enter.landmark" />"  />
                                            <span id="shipLocError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     	</div>
                                       	<div class="form-group col-lg-3" style="margin-top: -17px;">
                                       	<div class="form-group col-lg-6" style="padding-left: 0px;padding-right: 5px;">
                                       	
                                       	 <label><spring:message code="landmark.label" /></label>
                                            <input type="text" class="form-control" id="shipLandmark"  value="" placeholder="<spring:message code="landmark.label" />"/>
                                            <span id="shipLandmarkError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                        <div class="form-group col-lg-6" style="padding-left: 0px;padding-right: 5px;">
										   <label><spring:message code="shipment_city.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="shipCity" name="shipement_address_city" value="${orderDetails.shipement_address_city}" placeholder="<spring:message code="order.enter.city" />"/>
                                            <span id="shipCityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                    	
										</div>
                                    	</div>
                                    	 <div class="form-group col-lg-3" style="margin-top: -17px;">
										<div class="form-group col-lg-6" style="padding-left: 0px;padding-right: 5px;">
										   <label><spring:message code="pin.label" /></label>
                                           <input type="text" class="form-control" id="shipPin" name="shipmentPinNo" value="${orderDetails.shipmentPinNo}" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="order.enter.pin" />"/>
                                           <span id="shipPinError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> 
                                    	
										</div>
										
										
										<div class="form-group col-lg-6" style="padding-right: 0px;padding-left: 5px;">
										 <label><spring:message code="shipment.state.label" /><span style="color:red; font-size:2">*</span></label>
										 
										 
										 
										 <select class="form-control" name="shipmentState" id="shipmentState" style="width: 100%;">
	                                       <option value="" >Select state</option>
	                                        <c:forEach var="states" items="${states.stateMasters}">
	                            			 <option value="${states.stateName}" >${states.stateName}</option>
	                                        
											</c:forEach>
	                                        
	                                            </select>
										 
<%--                                             <input type="text" class="form-control" id="shipmentState" name="shipmentState" value="${orderDetails.shipmentState}" placeholder="<spring:message code="order.enter.state" />" />
 --%>                                          <span id="shipmentStateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     
										</div>
										
										</div>
                                     	 <input type="hidden" name="total_qty" value="${orderDetails.total_qty}" id="totalQty">
                                       <input type="hidden" name="no_of_items" value="${orderDetails.no_of_items}" id="noOfItems">
                                     	 <input type="hidden" id = "cartId" name="cartId">
                                            <input type="hidden" id = "latitude" name="latitude"  value="${orderDetails.latitude}">
                                            <input type="hidden" id = "longitude" name="longitude" value="${orderDetails.longitude}">
<%--                                              <input type="hidden" id = "custAddressId" value="${orderDetails.custAddressId}"> --%>
                                     	
                                       	<%-- <div class="form-group col-lg-3" style="">
                                            <label><spring:message code="shipment.country.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="shipmentCountry" name="shipmentCountry" value="${orderDetails.shipmentCountry}" placeholder="<spring:message code="order.enter.country" />" />
                                            <span id="shipmentCountryError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                            <input type="hidden" id = "cartId" name="cartId">
                                            <input type="hidden" id = "latitude" name="latitude"  value="${orderDetails.latitude}">
                                            <input type="hidden" id = "longitude" name="longitude" value="${orderDetails.longitude}">
                                             <input type="hidden" id = "custAddressId" value="${orderDetails.custAddressId}">
                                            
                                    	</div> --%>
                                      </div>
                                      
                                      <div class="row">
                                      <div class="col-lg-11" ></div>
                                       <div class="col-lg-1" style="margin-top: -25px;">
                                       <label id="copyAll" onclick='copyAllData();'>Copy All</label>
                                       </div>
                                      </div>
                                        <input type="hidden" id="returnStatus" > 
                                        </div>                                                                          
                                    <br>
                                    <div style="background-color: #e6e6e6;padding-left: 5px;padding-right: 15px;">
                                    <div class="row">
                                     <div class="form-group col-lg-3" style=" margin-top: 5px;">
                                    	<div style="background: gainsboro;padding: 11px;">
                                            <label style="font-size: 16px;font-weight:bold;"><spring:message code="billingAddress.label" /></label>
                                        </div>
                                     </div>
                                     
                                     
                                        <div class="form-group col-lg-3" style="">
                                        <label><spring:message code="shipment.contact.number.label" /> <span style="color:red; font-size:2">*</span></label>         
                                   <div class="row">
				                                  <div class="form-group col-lg-4 col-md-1 col-sm-1 col-xs-1">
				                                  	<select class="form-control" style="padding: 4px 6px;" id="defaultCountry2" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
				                                  	<option text="India" ${'India' == orderDetails.country ? 'selected' : ''}>IN</option>
				                                  	<option text="USA" ${'USA' == orderDetails.country ? 'selected' : ''}>US</option>
				                                  	<option text="United Kingdom" ${'United Kingdom' == orderDetails.country ? 'selected' : ''}>GB</option>
				                                  	<option text="Australia" ${'Australia' == orderDetails.country ? 'selected' : ''}>AU</option>
				                                  	</select>
				                                  </div>
				                                  <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
				                                  	<input type="text" class="form-control" placeholder="<spring:message code="enter.customer_contact_num.label" />"   value="${orderDetails.mobile_num}" id="billingMobileNo" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
				                                  </div>
				                                 
				                                  <input type="hidden" class="form-control"  id="billphoneNumberCode"  value="${orderDetails.country}"/>
                                               <%--  <input type="hidden" class="form-control" name="billingMobileNo" id="billingMobileNo"  value="${orderDetails.billingMobileNo}"/> --%>
				                              <input type="hidden" id="output4" />
				                             </div>
                                   <span id="error2" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                       <div class="form-group col-lg-1" style="">
										 <label><spring:message code="doorNos.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control"  id="billDno" name="billing_address_doorNo" value="${orderDetails.billing_address_doorNo}" placeholder="<spring:message code="order.enter.door.no" />" />
                                            <span id="billDnoError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                   
                                        </div>
                                        
                                        <div class=" col-lg-2" style="">
                                     	  <label>Building Name<span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="billappartmentname"  name="billingApartmentName" value="${orderDetails.billingApartmentName}" placeholder="Enter Building Name" />
                                            <span id="billappartmentnameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                   
                                     	
                                     	</div>
                                        
                                        
                                        
                                        <div class="form-group col-lg-3" style="">
										 <label><spring:message code="billing_street.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="billStreet" name="billing_address_street" value="${orderDetails.billing_address_street}" placeholder="<spring:message code="order.enter.street" />" />
                                            <span id="billStreetError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                        
                                        <div class="form-group col-lg-3" style="display:none">
                                       <label><spring:message code="googlemaplink.label" /> </label>
                                       <input type="text" class="form-control" id="billgogLink" name="billing_map_link"  value="${orderDetails.billing_map_link}" placeholder="<spring:message code="enter.googlemaplink.label" />"/>
                                        </div>
                                     
                                    </div>
                                    <div class="row">
                                      <div class="form-group col-lg-3" style="margin-top: -28px;">
                                      <label><spring:message code="shipment.name.label" /> <span style="color:red; font-size:2">*</span></label>
										<input type="text" class="form-control" id="billshipmentName" value="${orderDetails.shipmentName}"/>
                                         <span id="billshipmentNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> 
                                      </div>
                                   
                                    <div class="form-group col-lg-3" style="margin-top: -28px;">
                                     <label><spring:message code="billing_location.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control"  id="billLoc" name="billing_address_location" value="${orderDetails.billing_address_location}" placeholder="<spring:message code="order.enter.landmark" />"  />
                                            <span id="billLocError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>                
                                  		</div>
                             
                              			<div class="form-group col-lg-3" style="margin-top: -28px;">
                              			<div class="form-group col-lg-6" style="padding-left: 0px;padding-right: 5px;">
                              			 <label><spring:message code="landmark.label" /></label>
                                            <input type="text" class="form-control" id="billLandmark"  value="" placeholder="<spring:message code="landmark.label" />"/>
                                            <span id="billLandmarkError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                             			 </div>
                             			 <div class="form-group col-lg-6" style="padding-left: 0px;padding-right: 5px;">
								  <label><spring:message code="billing_city.label" /> <span style="color:red; font-size:2">*</span></label>
                                   <input type="text" class="form-control" id="billCity" name="billing_address_city" value="${orderDetails.billing_address_city}" placeholder="<spring:message code="order.enter.city" />"/>
                                  <span id="billCityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
								</div>
<%--                                  <input type="hidden" class="form-control" id="billpinNum" name="billing_pinNo"  value="${orderDetails.billing_pinNo}" placeholder="<spring:message code="enter.pin.label" />"/>
 --%>                                       
                                 </div>
                                 <div class="form-group col-lg-3" style="margin-top: -28px;">
								
								
								<div class="form-group col-lg-6" style="padding-left: 0px;padding-right: 5px;">
										   <label><spring:message code="pin.label" /></label>
                                            <input type="text" class="form-control" id="billpinNum" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" name="billing_pinNo" value="${orderDetails.billing_pinNo}" placeholder="<spring:message code="order.enter.pin" />"/>
                                            <span id="billpinNumError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                    	
										</div>
								<div class="form-group col-lg-6" style="padding-right: 0px;padding-left: 5px;">
								 <label><spring:message code="shipment.state.label" /><span style="color:red; font-size:2">*</span></label>
								 
								 
								  <select class="form-control"  id="billState" style="width: 100%;">
								  	    <option value="" >Select state</option>
								  
	                                        <c:forEach var="states" items="${states.stateMasters}">
	                            			 <option value="${states.stateName}" >${states.stateName}</option>
	                                        
											</c:forEach>
	                                        
	                                            </select>
										 
								 
								 
								 
								 
								 
								 
<%-- 									<input type="text" class="form-control" id="billState" value="${orderDetails.shipmentState}" placeholder="<spring:message code="order.enter.state" />" />
 --%>									<span id="billStateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
								
								</div>
								
								</div>  
                                   
                                    </div>
                                    </div>
                                    <br>
                                    <div style="background-color: #e6e6e6;padding-left: 5px;padding-right: 15px;">
                                    <div class="row">
                                     <div class="form-group col-lg-3" style=" margin-top: 5px;">
                                    	<div style="background: gainsboro;padding: 11px;">
                                            <label style="font-size: 16px;font-weight:bold;"><spring:message code="customerAddress.label" /></label>
                                        </div>
                                    </div>
                                    
                                    
                                     <div class=" form-group col-lg-3" style="">
                                              <label><spring:message code="shipment.contact.number.label" /> <span style="color:red; font-size:2">*</span></label>         
                                   <div class="row">
				                                  <div class="form-group col-lg-4 col-md-1 col-sm-1 col-xs-1">
				                                  	<select class="form-control" style="padding: 4px 6px;" id="defaultCountry3" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
				                                  	<option text="India" ${'India' == orderDetails.country ? 'selected' : ''}>IN</option>
				                                  	<option text="USA" ${'USA' == orderDetails.country ? 'selected' : ''}>US</option>
				                                  	<option text="United Kingdom" ${'United Kingdom' == orderDetails.country ? 'selected' : ''}>GB</option>
				                                  	<option text="Australia" ${'Australia' == orderDetails.country ? 'selected' : ''}>AU</option>
				                                  	</select>
				                                  </div>
				                                  <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
				                                  	<input type="text" class="form-control"  placeholder="<spring:message code="enter.customer_contact_num.label" />" name="customerContactNum" id="customerContactNum" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
				                                  </div>
				                                 
<%-- 				                                <input type="hidden" class="form-control" name="custphoneNumberCode" id="custphoneNumberCode"  value="${orderDetails.country}"/> --%>
                                             <%--    <input type="hidden" class="form-control" name="customerContactNum" id="customerContactNum"  value="${orderDetails.customerContactNum}"/> --%>
				                                <input type="hidden" id="output5" />
				                             </div>
                                   <span id="error3" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                       </div>
                                       <div class="form-group col-lg-1" style="">
                                      <label><spring:message code="doorNos.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="custDno" name="customer_address_doorNo"  value="${orderDetails.customer_address_doorNo}" placeholder="<spring:message code="order.enter.door.no" />"/>
                                            <span id="custDnoError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                      </div>
                                      
                                      <div class=" col-lg-2" style="">
                                     	  <label>Building Name<span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="cusappartmentname"  name="customerApartmentName" value="${orderDetails.customerApartmentName}" placeholder="Enter Building Name" />
                                            <span id="cusappartmentnameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                   
                                     	
                                     	</div>
                                      
                                      
                                      
                                       <div class="form-group col-lg-3" style="">
                                       <label><spring:message code="customer_street.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="custStreet" name="customer_address_street"  value="${orderDetails.customer_address_street}" placeholder="<spring:message code="order.enter.street" />" />
                                            <span id="custStreetError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                      </div>
                                    
                                      <div class="form-group col-lg-3" style="display :none">
                                      <label><spring:message code="googlemaplink.label" /> </label>
                                            <input type="text" class="form-control" id="custgogLink" name="customer_map_link"  value="${orderDetails.customer_map_link}" placeholder="<spring:message code="enter.googlemaplink.label" />"/>
                                     </div>
                                    
                                    </div>
                                     <div class="row">
                                     <div class="form-group col-lg-3" style="margin-top: -28px;">
                                       <label><spring:message code="shipment.name.label" /> <span style="color:red; font-size:2">*</span></label>
										<input type="text" class="form-control" id="CusshipmentName" value="${orderDetails.shipmentName}"/>                        
                                       <span id="CusshipmentNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                      
                          <div class="col-lg-3" style="margin-top: -28px;">
                             <label><spring:message code="customer_location.label" /> <span style="color:red; font-size:2">*</span></label>
                               <input type="text" class="form-control" id="custLoc" name="customer_address_location"  value="${orderDetails.customer_address_location}" placeholder="<spring:message code="order.enter.landmark" />"  />
                              <span id="custLocError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>       
                            </div>
                             
                              <div class="form-group col-lg-3" style="margin-top: -28px;">
                              
                           <div class="form-group col-lg-6" style="padding-left: 0px;padding-right: 5px;">
                              <label><spring:message code="landmark.label" /></label>
                              <input type="text" class="form-control" id="cusLandmark"  value="" placeholder="<spring:message code="landmark.label" />"/>
                               <span id="cusLandmarkError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                           </div>
                                
                             <div class="form-group col-lg-6" style="padding-left: 0px;padding-right: 5px;">
								 <label><spring:message code="customer_city.label" /> <span style="color:red; font-size:2">*</span></label>
                                <input type="text" class="form-control" id="custCity" name="customer_address_city"  value="${orderDetails.customer_address_city}" placeholder="<spring:message code="order.enter.city" />" />
                                <span id="custCityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
								</div>
								
                              </div>
                             
<%--                               <input type="hidden" class="form-control" id="custpin" name="customer_pinNo"  value="${orderDetails.customer_pinNo}" placeholder="<spring:message code="enter.pin.label" />"/>
 --%>                                             
                                  
                              
                             <div class="form-group col-lg-3" style="margin-top: -28px;">
                             <div class="form-group col-lg-6" style="padding-left: 0px;padding-right: 5px;">
										   <label><spring:message code="pin.label" /></label>
                                            <input type="text" class="form-control" id="custpin" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" name="customer_pinNo" value="${orderDetails.customer_pinNo}" placeholder="<spring:message code="order.enter.pin" />"/>
                                            <span id="custpinError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
							</div>
								
								<div class="form-group col-lg-6" style="padding-right: 0px;padding-left: 5px;">
								 <label><spring:message code="shipment.state.label" /><span style="color:red; font-size:2">*</span></label>
								 
								 
								   <select class="form-control"  id="cusState" style="width: 100%;">
								   	         <option value="" >Select state</option>
								   
	                                        <c:forEach var="states" items="${states.stateMasters}">
	                            			 <option value="${states.stateName}" >${states.stateName}</option>
	                                        
											</c:forEach>
	                                        
	                                            </select>
										 
								 
								 
<%-- 								<input type="text" class="form-control" id="cusState" value="${orderDetails.shipmentState}" placeholder="<spring:message code="order.enter.state" />" />
 --%>								<span id="cusStateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
								
								</div>
								
								</div> 
                              
                                   
<!-- <input type="hidden" id="isgstAmt" name="isgstAmt" value="0.0"> -->
                                    </div>                                    
									</div>
									</div>
                                      <br>
                                     <!-- commented by harsha on 1-5-2019 --><%-- <div class="row">
                                     <div class="form-group col-lg-3" >
                                    	<div style="background: gainsboro;;padding: 5px;">
                                            <label style="font-size: 16px;font-weight:bold;"><spring:message code="order.other.details.label" /></label>
                                        </div>
                                     </div>
                                     </div>
                                     <div class="row" style="">
                                        <div class="form-group col-lg-2" style="width: 12%;">
                                            <label><spring:message code="order_channel" /></label>
                                            <input type="text" class="form-control" name="orderChannel"  value="${orderDetails.orderChannel}"/>
                                            <select class="form-control" name="orderChannel" id="orderChannel">
                                             <option value="Online" ${'Online' == orderDetails.orderChannel ? 'selected' : ''}>Online</option>
                                            <option value="Mobile" ${'Mobile' == orderDetails.orderChannel ? 'selected' : ''}>Mobile</option>
                                            <option value="Telephone" ${'Telephone' == orderDetails.orderChannel ? 'selected' : ''}>Telephone</option>
                                            <option value="Sales Executive" ${'Sales Executive' == orderDetails.orderChannel ? 'selected' : ''}>Sales Executive</option>
                                            <option value="Direct" ${'Direct' == orderDetails.orderChannel ? 'selected' : ''}>Direct</option>
                                            </select>
                                    	</div>
                                    	
                                    	   	<div class="form-group col-lg-2" style="width: 13%;">
                                            <label><spring:message code="shipment.type.label" /></label>
                                            <select id="shipmentType" name="shipperId" class="form-control" onchange="getShipmentCost();">
												<option value="Normal" ${'Normal' == orderDetails.shipperId ? 'selected' : ''}>Normal</option>
												<option value="Express" ${'Express' == orderDetails.shipperId ? 'selected' : ''}>Express</option>
										    </select>
                                            <!-- <input type="text" class="form-control"  name="shipperId" value=""/> -->
                                     	</div> 
                                    	   
                                    	 <div class="form-group col-lg-3">
                                            <label><spring:message code="sales_executive.name.label" /></label>
                                            <div class="row">
                                              <div class="form-group col-lg-5 col-md-4 col-sm-4 col-xs-4" >
                                            <input type="text" class="form-control" id="salesexecutiveid" name="sales_executive_id" disabled value="${employeeCode}" placeholder="<spring:message code="enter.id.label" />" />
                                            </div>
                                             <div class="col-lg-7 col-md-7 col-sm-8 col-xs-8" style="padding-left: 0px">
                                      <!--  <input type="textbox" id="__searchit2" class="searchbox">
<div id="__searchitWrapper2" style="display: none; vertical-align: top; overflow: hidden; border: 1px solid rgb(128, 128, 128); position: absolute;">
                                              -->
                                              <select class="form-control" id="salesexecutivename" onchange="getemployeeIdByName();" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
<!--                            		<option>  <input type="text" placeholder="Search.." id="myInput" onkeyup="filterFunction()"></option> -->
	                           
	                            <c:forEach var="employee" items="${employeeList}">
								
							        <option value="${employee.employeeCode}" ${employee.employeeCode == employeeCode ? 'selected' : ''}>${employee.firstName}</option>
							       
									</c:forEach>
	                        </select>
<!-- 	                        <input type='button' value='Seleted option' id='but_read'> -->
<!--                       </div>                        -->
                                             
                                             <input type="text" class="form-control"  id="salesexecutivename" name="sales_executive_name" value="${orderDetails.sales_executive_name}" placeholder="<spring:message code="order.enter.sales.executive.name" />" />
                                    	     </div>
                                    	</div>
                                    	</div>
                                     	
                                      <input type="hidden" name="salesmanName" id="salesmanName">
                                      <div class="form-group col-lg-2">
                                            <label><spring:message code="referredBy.label" /></label>
                                            <input type="text" class="form-control" id="refer_redBy"  name="referredBy" value="${orderDetails.referredBy}" />
                                    	</div>
                                      
                                     </div>
                                     <div class="row" >
                                      <div class="form-group col-lg-2" style="width: 12%;">
                                     <label><spring:message code="order_delivery_type.label" /></label>
                                       <select class="form-control" name="orderDeliveryType" id="orderDeliveryType" onchange="changeShipmentCharges();">
                                           <option value="Pick Up" ${'Pick Up' == orderDetails.orderDeliveryType ? 'selected' : ''}>Pick Up</option>
                                           <option value="Door Delivery" ${'Door Delivery' == orderDetails.orderDeliveryType ? 'selected' : ''}>Door Delivery</option>
                                       </select>
                                            <label><spring:message code="order_status.label" /></label>
                                            <input type="hidden" readonly="readonly" name="orderStatus" id="orderStatus"  value=""/> 
                                            <input type="hidden" readonly="readonly" name="selectedStatus" id="selectedStatus"  value="${status}"/>
                                     </div>
                                     
                                     
                                     <div class="form-group col-lg-2" style="width: 13%;">
                                            <label><spring:message code="shipment_mode.label" /></label>
                                            <select class="form-control" name="shipmentMode" id="shipmentMode" onchange="getShipmentCost();">
												<option value="Road" ${'Road' == orderDetails.shipmentMode ? 'selected' : ''}>Road</option>
	                                            <option value="Rail" ${'Rail' == orderDetails.shipmentMode ? 'selected' : ''}>Rail</option>
												<option value="Courier" ${'Courier' == orderDetails.shipmentMode ? 'selected' : ''}>Courier</option>
												<option value="Direct Person" ${'Direct Person' == orderDetails.shipmentMode ? 'selected' : ''}>Direct Person</option>
                                            </select>
                                    	</div>
                                     
                                     
                                      <div class="form-group col-lg-2">
                                            <label><spring:message code="speacialDiscount.label" /></label>
                                            <input type="text" class="form-control" id="special_Discount"  name="specialDiscount" value="0"  />
                                    	</div>
                                     
                                     </div> --%>
                                      <div class="form-group col-lg-2" style="display: none">
                                            <label><spring:message code="speacialDiscount.label" /></label>
                                            <input type="text" class="form-control" id="special_Discount"  name="specialDiscount" value="0"  />
                                    	</div>
                                    	 <div class="form-group col-lg-2" style="width: 13%;display: none">
                                            <label><spring:message code="shipment_mode.label" /></label>
                                            <select class="form-control" name="shipmentMode" id="shipmentMode" onchange="getShipmentCost();">
												<option value="Road" ${'Road' == orderDetails.shipmentMode ? 'selected' : ''}>Road</option>
	                                            <option value="Rail" ${'Rail' == orderDetails.shipmentMode ? 'selected' : ''}>Rail</option>
												<option value="Courier" ${'Courier' == orderDetails.shipmentMode ? 'selected' : ''}>Courier</option>
												<option value="Direct Person" ${'Direct Person' == orderDetails.shipmentMode ? 'selected' : ''}>Direct Person</option>
                                            </select>
                                    	</div>
                                 <%--   <div class="row">
                                    <div class="form-group col-lg-12">
                                            <label><spring:message code="order.remarks.label" /></label>
                                             <textarea class="form-control"  name="remarks" rows="2" style="resize: none;" placeholder="<spring:message code="order.enter.remarks.label" />"  >${orderDetails.remarks}</textarea>
                                            <input type="text" class="form-control" readonly value="${orderDetails.remarks}"/>
                                     </div>
                                   </div>
                                   <div class="row">
                                     <div class="form-group col-lg-12">
                                            <label><spring:message code="customerFeedback.label" /></label>
                                            <textarea class="form-control"  name="customerFeedback" rows="2" style="resize: none;" placeholder="<spring:message code="order.enter.customer.feedback" />"  >${orderDetails.customerFeedback}</textarea>
                                            <input type="text" class="form-control" readonly value="${orderDetails.customerFeedback}"/>
                                     </div>   
                                   </div>  --%>    
                                   <span id="searchItemsErrorID" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>  
                                    <div id="searchItemsErrorIDdiscounts" style="text-align:center;color:red;font-weight:bold;"></div>  
                                   <div class="row">
                                         <!-- <div class="col-lg-3"></div> -->
                                         <div class="col-lg-11" style="text-align:center;margin-bottom: -2px;">
                                         	<input type="hidden" id="desc"/>
                                         	
                                         	<%-- <label><spring:message code="search.items.here.label" /></label> --%>
                                         	<input type="text"  class="form-control searchItemsNewOrder searchBar" id="searchItems"  placeholder="<spring:message code="search.items.here.label" />"  style=""  />
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl receipt" style=""></ul>
								   				</div>
											</div>
                                           <!--  <input type="text" list="skuList" class="form-control" id="searchCriteria" />
 												<datalist id="skuList"></datalist> -->
  										 </div>
  										 <div class="col-lg-1" style="padding: 0px;padding-top: 5px;">
											<input type="checkbox" style="vertical-align: -2px" id="searchScan" />
											 &nbsp;&nbsp;Scan  &nbsp;
											 <button type="button" id="menuItemsBar" onclick="getOrdersMenuDetails('','','');"><b>&#9776;</b></button>
										</div>
										<!-- <div class="form-group col-lg-1" style="padding: 0px;padding-top: 5px;">
											 <button type="button" id="menuItemsBar" onclick="getOrdersMenuDetails('','');"><b>&#9776;</b></button>
										</div> -->
                                         <div class="col-lg-3">
                                         <div id="triggerEvent"></div>
                                         </div>
                                        </div>
                                        
                                        
                                         <table  id="dicountlist" style="display:none">
                                    <tbody>
                                     <c:forEach var ="discItems" items="${orderDetails.orderDiscountsList}" varStatus="theCount">
                                    <tr id="discdynamicdiv${theCount.count}">
                                    
                                    <td id="">
<%--                                     	<input type="hidden" id="serialNumDisc${theCount.count}" value="${discItems.serialNum}"> --%>
                            			<input type="hidden" id="orderIdDisc${theCount.count}" value="${discItems.orderId}">
                            			<input type="hidden" id="skuIdDisc${theCount.count}" value="${discItems.skuId}">
                            			<input type="hidden" id="pluCodeDisc${theCount.count}" value="${discItems.pluCode}">
<%--                             			<input type="hidden" id="taxcodeDisc${theCount.count}" value="${discItems.discountType}"> --%>
                            			<input type="hidden" id="discountTypeDisc${theCount.count}" value="${discItems.discountType}">
                            			<input type="hidden" id="discountIdDisc${theCount.count}" value="${discItems.discountId}">
                            			<input type="hidden" id="discountPriceDisc${theCount.count}" value="${discItems.discountPrice}">
                            			<input type="hidden" id="itemPriceDisc${theCount.count}" value="${discItems.itemPrice}">
                                    
                                     </td>
                                     <td id="DelDisc${theCount.count}"><img id="Img${theCount.count}"alt=""  style='width:15%;cursor:pointer;'  onclick='deleteItem(this);' src="${pageContext.request.contextPath}/images/itemdelete.png"/></td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                    </table>
                                    
                                    
                                        
<%--                                          <c:forEach var="tranDetails" items="${orderDetails.orderTransactions}" varStatus="theCount"> --%>
                                        <input type="hidden" id="transactionID" value="${tranDetails.transactionId}">
                                         <input type="hidden" id="orderID" value="${tranDetails.orderId}">
                                          <input type="hidden" id="modeOfPayment" value="${tranDetails.modeOfPayment}">
                                          <input type="hidden" id="cardType" value="${tranDetails.cardType}">
                                          <input type="hidden" id="couponNumber" value="${tranDetails.couponNumber}">
<%--                                           <input type="hidden" id="paidAmount" value="${tranDetails.paidAmount}"> --%>
                                          <input type="hidden" id="bankName" value="${tranDetails.bankName}">
                                          <input type="hidden" id="approvalCode" value="${tranDetails.approvalCode}">
                                          <input type="hidden" id="receivedAmount" value="0.0">
                                          <input type="hidden" id="changeReturn" value="0.0">
                                          <input type="hidden" id="cardInfo" value="${tranDetails.cardInfo}">
                                          <input type="hidden" id="paymentStatus" value="${tranDetails.paymentStatus}">
                                           <input type="hidden" id="dateTime" value="${tranDetails.dateTime}">
<%--                                         </c:forEach> --%>
                                     
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                         <table  id="taxationlist" style="display:none">
                                    <tbody>
                                     <c:forEach var ="taxItems" items="${orderDetails.orderItemTaxesList}" varStatus="theCount">
                                    <tr id="taxdynamicdiv${theCount.count}">
                                    <td id="">
                                    	<%-- <input type="hidden" id="snoTax${theCount.count}" value="${taxItems.sno}"> --%>
                            			<input type="hidden" id="orderIdTax${theCount.count}" value="${taxItems.orderId}">
                            			<input type="hidden" id="skuIdTax${theCount.count}" value="${taxItems.sku_id}">
                            			<input type="hidden" id="pluCodeTax${theCount.count}" value="${taxItems.plu_code}">
                            			<input type="hidden" id="taxTaxcode${theCount.count}" value="${taxItems.tax_code}">
                            			<input type="hidden" id="taxTaxType${theCount.count}" value="${taxItems.tax_type}">
                            			<input type="hidden" id="taxTaxCategory${theCount.count}" value="${taxItems.tax_category}">
                            			<input type="hidden" id="taxTax${theCount.count}" value="${taxItems.tax_rate}">
                            			<input type="hidden" id="taxTaxAmt${theCount.count}" value="${taxItems.tax_value}">
                                    
                                     </td>
                                     <td id="DelTax${theCount.count}"><img id="Img${theCount.count}"alt=""  style='width:15%;cursor:pointer;'  onclick='deleteItem(this);' src="${pageContext.request.contextPath}/images/itemdelete.png"/></td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                    
                                    </table>
                                    
                                    
                                        
                                        
                                    <div class="table-responsive" style="overflow: auto;padding: 0px 0px;">
                                        <table id="productsList" class="table table-bordered table-hover">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                        <tr>
                                            	 <th><div style="width:45px;"><spring:message code="sl.no.label" /></div></th>
                                            	<th><spring:message code="item_id.label"/></th>
                                                <th><spring:message code="item_description.label"/></th>
											<%--  <th><spring:message code="make.label"/></th> --%>
                                                <th><spring:message code="model.label"/></th>
                                                <th><spring:message code="colour.label"/></th>
                                                <th><spring:message code="size.label"/></th>
                                                 <th>Discount ID</th>
                                                 <th><spring:message code="mrp.label"/></th>
                                                <th><spring:message code="sale.price.val.label"/></th>
                                                  <th>Discounted Sale Price</th>
                                                 <th><spring:message code="discount.label"/></th>
                                                <th><spring:message code="order_quantity.label"/></th>
                                                 <th><spring:message code="order_Confirmquantity.label"/></th>
                                                <th><spring:message code="item_cost.label"/></th>
                                                 <th><spring:message code="taxrate.label"/></th>
                                                  <th><spring:message code="tax.label"/></th>
                                               <%--  <th><spring:message code="cgst.rate.label"/></th>
                                                      <th><spring:message code="tax.label"/>%</th>
                                                 <th><spring:message code="cgstAmt.label"/></th>
                                                 <th><spring:message code="sgst.rate.label"/></th>
                                                 <th><spring:message code="sgstAmt.label"/></th> --%>
                                                <th><spring:message code="action.label"/></th>
                                           </tr>
                                          </thead>
                            			<tbody style="text-align: center;">
                            			<c:forEach var="item" items="${orderDetails.itemDetails}" varStatus="theCount">
                                        	 <tr id="dynamicdiv${theCount.count}" style='margin-top:5px;'>
                                        	 	<td class="slno">${theCount.count}</td>
                                            	<td id="itemId${theCount.count}">${item.skuId}</td>
                                            	<input type="hidden" id="orderItemId${theCount.count}" value="${item.order_item_id}" />
                                            	<input type="hidden" id="skuId${theCount.count}" value="${item.skuId}" />
                                            	<input type="hidden" id="pluCode${theCount.count}" value="${item.pluCode}"/>
                                            <%-- 	<input type='hidden' id="cgsttax${theCount.count}" value="${item.cgstRate}"/>
	 		                                    <input type='hidden' id="sgsttax${theCount.count}" value="${item.sgstRate}"/>
	 		                                    <input type='hidden' id="igsttax${theCount.count}" value="${item.isgstRate}"/>
	 		                                    <input type='hidden' id="cgsgstAmt${theCount.count}" value="${item.cgstValue}"/>
	 		                                    <input type='hidden' id="sgsgstAmt${theCount.count}" value="${item.sgstValue}"/>
	 		                                    <input type='hidden' id="igstAmt${theCount.count}" value="${item.isgstValue}"/> --%>
	 		                                    <input type='hidden' id="discount${theCount.count}" value="${item.discount}"/>
	 		                                    <input type='hidden' id="manualDiscount${theCount.count}" value="${item.manualDiscount}"/>
	 		                                   <%--  <input type='hidden' id="othertaxRate${theCount.count}" value="${item.otherTaxRate}"/>
	 		                                    <input type='hidden' id="otherTaxValue${theCount.count}" value="${item.otherTaxValue}"/> --%>
	 		                                   <input type='hidden' id="productRange${theCount.count}" value="${item.productRange}"/>
			                                   <input type='hidden' id="measureRange${theCount.count}" value="${item.measureRange}"/>
			                                   <input type='hidden' id="utility${theCount.count}" value="${item.utility}"/>
			                                   <input type='hidden' id="trackingRequired${theCount.count}" value="${item.trackingRequired}"/>
	 	                                 	   <input type='hidden' id="department${theCount.count}" value="${item.department}"/>
	 		                                   <input type='hidden' id="subDept${theCount.count}" value="${item.subDepartment}"/>
	 		                                   <input type='hidden' id="manufacturedItem${theCount.count}" value="${item.manufacturedItem}"/>
	 		                                   <input type='hidden' id="category${theCount.count}" value="${item.category}"/>
	 		                                   <input type='hidden' id="subCategory${theCount.count}" value="${item.subCategory}"/>
	 		                                  <input type='hidden' id="section${theCount.count}" value="${item.section}"/>
	 		                                  <input type='hidden' id="zeroStock${theCount.count}" value="${item.zeroStockFlag}"/>
	 		                                  <input type='hidden' id="packed${theCount.count}" value="${item.packed}"/>
	 		                                  <input type='hidden' id="editable${theCount.count}" value="${item.editableFlag}"/>
	 		                                  <input type='hidden' id="itemScancode${theCount.count}" value="${item.itemScanCode}"/>
	 		                                   <input type='hidden' id="itemtaxCode${theCount.count}" value="${item.taxCode}"/>
	 		                                    <input type='hidden' id="hsnCode${theCount.count}" value="${item.hsnCode}"/>
	 		                                     <input type='hidden' id="priceVale${theCount.count}" value="${item.item_price}"/>
	 		                                    <input type='hidden' id="ean${theCount.count}" value="${item.ean}"/>
	 		                                    <input type='hidden' id="styleRange${theCount.count}" value="${item.style}"/>
	 		                                     <input type='hidden' id="brand${theCount.count}" value="${item.brand}"/>
	 		                                      <input type='hidden' id="uom${theCount.count}" value="${item.uOM}"/>
	 		                                    <input type='hidden' id="classProduct${theCount.count}" value="${item.productClass}"/>
	 		                                      <input type='hidden' id="subclassProduct${theCount.count}" value="${item.subClass}"/>
                                               
                                               
                                                <td id="itemName${theCount.count}">${item.item_name}</td>
<%--                                                  <td id="make${theCount.count}">${item.make}</td> --%>
                                                <td id="model${theCount.count}">${item.model}</td>
                                                <td id="colour${theCount.count}">${item.colour}</td>
                                                <td id="size${theCount.count}">${item.size}</td>
                                                <td>${item.offerId}</td>
                                                <td id="price${theCount.count}">${item.mrp}</td>
                                                <td id="itemPrice${theCount.count}">${item.item_price}</td>
                                                <td  id="itemPricemod${theCount.count}">${item.item_price}</td>
                                                <td>${item.discount}</td>
                                              
                                             <!--    modified by koti bomineni
                                                purpose to display minimum sal quantity and change on blur function -->
                                                

                                                <td id="orderedQuantity${theCount.count}"   onkeypress='return (this.innerText.length < 10)' contenteditable='true'>${item.minSaleQty}</td>
                                              	<td id="confirmQuantity${theCount.count}"  class='Pack' onBlur='changePack(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>${item.minSaleQty}</td>
                                              	
                                              	<td id="totalCost${theCount.count}" class='cost'>${item.total_cost}</td>
                                                <td id="tax${theCount.count}">${item.taxRate}</td>
                                                 <td id="taxAmt${theCount.count}">${item.taxValue}</td>
                                                <td id="Del${theCount.count}"><img id="Img${theCount.count}"alt=""  style='width:15%;cursor:pointer;'  onclick='deleteItem(this);' src="${pageContext.request.contextPath}/images/itemdelete.png"/></td>
                                            </tr>
                                           </c:forEach>
                            			</tbody>
                                      </table>
                                      <br/>
                                    </div>
                                   <br>
                                   
                                   
                                   
          <%--            <div class="col-lg-12 nopadding">
					<div class="col-lg-6"></div>
					<div class="col-lg-3 nopadding">
					<div class="form-group col-lg-7 " style="text-align: right;"><label><spring:message code="sub.total.label" /> </label></div>
					<div class="form-group col-lg-5 nopadding">
						<input type="text" class="form-control" name="subtotal" id="subtotal" value="${orderDetails.subtotal}"  readonly="readonly" />
					</div></div>
					<div class="col-lg-2 nopadding">
						<div class="form-group col-lg-8 " style="text-align: right;"><label><spring:message code="othertax.label" /></label></div>
						<div class="form-group col-lg-4 nopadding">
					 <input type="text" class="form-control" readonly="readonly" name="otherTaxAmt" id="otherTaxAmt" value="0.0" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
						</div></div>
						
						<div class="col-lg-3 nopadding">
						<div class="form-group col-lg-7 " style="text-align: right;"><label><spring:message code="total.tax.label" /></label></div>
						<div class="form-group col-lg-5 nopadding">
						<input type="text" class="form-control" readonly id="cgstAmt"   value="${orderDetails.cgstAmt}"  oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
						  <input  type="text" class="form-control"  disabled="disabled" name="orderTax" id="totalTax" value="${orderDetails.orderTax}">
						<span id="totalTaxError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						</div>
						
						
						
				
				</div>
                                   
                                   
                      
                        <div class="col-lg-12 nopadding">
						<div class="col-lg-6"></div>
					<div class="col-lg-3 nopadding">
				   <div class="form-group col-lg-7 " style="text-align: right;white-space: nowrap;"><label>Other Discounts</label></div>
					<!-- 	<div class="form-group col-lg-3 nopadding">
					 <input type="text" class="form-control" readonly="readonly" name="" id="totalDiscoiuntPrice" value="0.0" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
						</div> -->
						
						<div class="form-group col-lg-5 nopadding">
						
					 	  <c:if test="${storeDetailsList[0].manualDiscounts == true}">
						  <input type="text" class="form-control"  style="margin-left: 3px;" name="otherDiscounts" id="otherDiscount" placeholder="other Discounts" value="0.0" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
						</c:if>
						 <c:if test="${storeDetailsList[0].manualDiscounts == false}"> 
						  <input type="text" class="form-control"  style="margin-left: 3px;" name="otherDiscounts" disabled="disabled" id="otherDiscount" placeholder="other Discounts" value="0.0" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
						 </c:if> 
					 	</div>
						
						<input type="hidden" class="form-control"    id="editPrice"  value="${storeDetailsList[0].editPrice}" />
						</div>
						<span id="shipCostError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
				
				
						<div class="col-lg-3 nopadding">
						<div class="form-group col-lg-7" style="text-align: right;"><label><spring:message code="shipping.cost.label" /> </label></div>
						<div class="form-group col-lg-5 nopadding">
						<input type="text" class="form-control" readonly="readonly"  name="shipmentCharges" id="shipmentCharges" value="${orderDetails.shipmentCharges}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
						</div></div>
						<span id="shipCostError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
					
					
					onblur ="getShipmentCost();"<div class="col-lg-12 nopadding">
					<div class="col-lg-8"></div>
					<div class="col-lg-2 nopadding">
					<div class="form-group col-lg-8" style="text-align: right;"><label><spring:message code="sgst.label" /> </label></div>
					<div class="form-group col-lg-4 nopadding">
						<input type="text" class="form-control" id="sgstAmt"  readonly="readonly" value="${orderDetails.sgstAmt}"/>
					</div></div>
					<div class="col-lg-2 nopadding">
						<div class="form-group col-lg-8 " style="text-align: right;white-space: nowrap;"><label><spring:message code="other.discounts.label" /></label></div>
						<div class="form-group col-lg-4 nopadding">
					 <input type="text" class="form-control" readonly="readonly" name="otherDiscounts" id="otherDiscount" value="0.0" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
						</div></div>
						<span id="shipCostError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
				</div>
                             
					
					
					<div class="row">
						<div class="col-lg-8"></div>
							</div>
							
					</div> --%>
         				    <div class="row" style="padding-right: 15px">
		        <div class="col-lg-3" >
		            <label>Comments</label>
		            <textarea  class="form-control" style="resize:none;height: 105px;" id="remarks"  name="remarks" rows="5" placeholder="Enter your comments">${orderDetails.remarks}</textarea>
		        </div>  
		        
		     
                      <div class="col-lg-9"  style="margin-top: 19px;border:1px solid #ccc">
                      
                      
                      
                      
                      <div class="col-lg-3 nopadding"  style="margin-top: 4px;">
				   <div class=" col-lg-7 " style="text-align: right;white-space: nowrap;"><label>Other Discounts</label></div>
					<!-- 	<div class="form-group col-lg-3 nopadding">
					 <input type="text" class="form-control" readonly="readonly" name="" id="totalDiscoiuntPrice" value="0.0" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
						</div> -->
						
						<div class=" col-lg-5 nopadding">
						
					 	  <c:if test="${storeDetailsList[0].manualDiscounts == true}">
						  <input type="text" class="form-control"  style="margin-left: 3px;" name="otherDiscounts" id="otherDiscount" placeholder="other Discounts" value="0.0" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
						<input type="hidden" class="form-control"  id="otherDiscountbackup"  value="0.0" style="margin-top:2px"/>
						
						</c:if>
						 <c:if test="${storeDetailsList[0].manualDiscounts == false}"> 
						  <input type="text" class="form-control"   name="otherDiscounts" disabled="disabled" id="otherDiscount" placeholder="other Discounts" value="0.0" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
						 <input type="hidden" class="form-control"  id="otherDiscountbackup"  value="0.0" style="margin-top:2px"/>
						 
						  </c:if>  
					 	</div>
						
						<input type="hidden" class="form-control"    id="editPrice"  value="${storeDetailsList[0].editPrice}" />
						</div>
                      
                      <div class="col-lg-3 nopadding"  style="margin-top: 4px;">
					<div class=" col-lg-7 " style="text-align: right;"><label><spring:message code="sub.total.label" /> </label></div>
					<div class=" col-lg-5 nopadding">
						<input type="text" class="form-control" name="subtotal" id="subtotal" value="${orderDetails.subtotal}"  readonly="readonly" />
					</div></div>
					
					 <div class="col-lg-3 nopadding"  style="margin-top: 4px;">
					<div class=" col-lg-7 " style="text-align: right;"><label>Total Qty</label></div>
					<div class=" col-lg-5 nopadding">
						<input type="text" class="form-control" name="" id="totalQnty" value="0"  readonly="readonly" />
					</div></div>
					
                      
                       <div class="col-lg-3 nopadding"  style="margin-top: 4px;">
				
						<div class=" col-lg-7 " style="text-align: right;"><label>Total Mrp Value</label></div>
						<div class=" col-lg-5 nopadding">
						
						<input type="text" class="form-control"  id="orderTotalCost" name="orderTotalCost" readonly value="${orderDetails.orderTotalCost}" />
					</div></div>
					
					
					   <div class="col-lg-3 nopadding"  style="margin-top: 4px;">
				
						<div class=" col-lg-7 " style="text-align: center;padding: 0px;"><label>Coupon Discount</label></div>
						<div class=" col-lg-5 nopadding">
						<input type="text" class="form-control"  id="couponDiscounts" name="couponDiscounts"  value="0.0" style="margin-top:2px"/>
						<input type="hidden" class="form-control"  id="couponDiscountsbackup"  value="0.0" style="margin-top:2px"/>
					
					</div></div>
					
					<div class="col-lg-3 nopadding"  style="margin-top: 4px;">
						<div class=" col-lg-7 " style="text-align: right;"><label><spring:message code="total.tax.label" /></label></div>
						<div class=" col-lg-5 nopadding">
<%-- 						<input type="text" class="form-control" readonly id="cgstAmt"   value="${orderDetails.cgstAmt}"  oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/> --%>
						  <input  type="text" class="form-control"  readonly name="orderTax" id="totalTax" value="${orderDetails.orderTax}" style="margin-top:2px">
						<span id="totalTaxError" style="text-align:right;color: red;font-size: 2;font-weight: bold;margin-top:4px"></span>
						</div>
						</div>
						
						<div class="col-lg-3 nopadding"  style="margin-top: 4px;">
				
						<div class=" col-lg-7 " style="text-align: right;"><label>Txn Mode</label></div>
						<div class=" col-lg-5 nopadding">
						<input type="text" class="form-control"  id="" name="" readonly value="" style="margin-top:2px"/>
					</div></div>
					
					  <div class="col-lg-3 nopadding"  style="margin-top: 4px;">
						
				
					<div class=" col-lg-7 " style="text-align: right;"><label><spring:message code="amountpaid.label" /></label></div>
						<div class=" col-lg-5 nopadding">
						<input type="text"  style="margin-top:2px" class="form-control" id="paidAmount" name="paidAmount"  value="0"/>
					</div></div>
					
					
					<div class="col-lg-3 nopadding"  style="margin-bottom: 4px;margin-top: 4px;">
						<div class=" col-lg-7" style="text-align: right;"><label><spring:message code="shipping.cost.label" /> </label></div>
						<div class=" col-lg-5 nopadding">
						<input type="text" class="form-control" readonly="readonly"  name="shipmentCharges" id="shipmentCharges" style="margin-top:2px" value="${orderDetails.shipmentCharges}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
						<span id="shipCostError" style="text-align:right;color: red;font-size: 2;font-weight: bold"></span>
						</div></div>
					
					
					<div class="col-lg-3 nopadding"  style="margin-bottom: 4px;margin-top: 4px;">
				
						<div class=" col-lg-7 " style="text-align: right;"><label>Net Amount</label></div>
						<div class=" col-lg-5 nopadding">
						<input type="text" class="form-control"  id="totalOrderAmount" name="totalOrderAmount" readonly value="${orderDetails.totalOrderAmount}" />
					</div></div>
					
					
					<div class="col-lg-3 nopadding"  style="margin-bottom: 4px;margin-top: 4px;">
				
						<div class=" col-lg-7 " style="text-align: right;"><label>Txn Ref</label></div>
						<div class=" col-lg-5 nopadding">
						<input type="text" class="form-control"  id="" name=""  value="" style="margin-top:2px"/>
					</div></div>
					
					<div class="col-lg-3 nopadding"  style="margin-bottom: 4px;margin-top: 4px;">
				
						<div class=" col-lg-7 " style="text-align: right;"><label>Amount Due</label></div>
						<div class=" col-lg-5 nopadding">
						<input type="text" class="form-control"  id="dueAmount" name="dueAmount" readonly value="0" style="margin-top:2px"/>
					</div></div>
					
					
					
					</div>
					
					
					
					
					
                     
                      </div>
                      
                      
                      
                   
                      
                      
                      
                <%--       
                      <div class="col-lg-12 nopadding" >
						
						<!--  <div class="col-lg-6 nopadding">
					<div class=" col-lg-2"></div> -->
						<div class=" col-lg-2" style="    font-size: 22px;    background-color: #f4f4f4;padding: 1px 0px; border-top: 1px solid #ccc;">&nbsp</div>
					    <div class=" col-lg-10 nopadding"style="    background-color: #f4f4f4;padding: 1px 0px; border-top: 1px solid #ccc;">
						<div class=" col-lg-6 nopadding" style="font-size: 22px;"><label><spring:message code="cost.label" /> </label></div>
						<div class=" col-lg-2"></div>
						<div class=" col-lg-4" style="padding-right: 0px;padding-left: 7px;">
						<input type="text" class="form-control"  id="orderTotalCost" name="orderTotalCost" readonly value="${orderDetails.orderTotalCost}" style="margin-top:2px"/>
					</div></div></div>
					
                                   
                     
                      <div class="col-lg-12 nopadding" >
						
						<!-- <div class="col-lg-6 nopadding">
						<div class=" col-lg-2"></div> -->
						<div class=" col-lg-2" style="    font-size: 22px;    background-color: #f4f4f4;padding: 1px 0px; border-top: 1px solid #ccc;">&nbsp</div>
						<div class=" col-lg-10 nopadding"style="    background-color: #f4f4f4;padding: 1px 0px; border-top: 1px solid #ccc;">
						<div class=" col-lg-6 nopadding" style="font-size: 22px;white-space: nowrap;"><label><spring:message code="amountpaid.label" /> </label></div>
						<div class=" col-lg-2"></div>
						<div class=" col-lg-4" style="padding-right: 0px;padding-left: 7px;">
						<input type="text"  style="margin-top:2px" class="form-control" id="paidAmount" name="paidAmount"  value="0"/>
					</div></div>
					</div>
                                   
                        <div class="col-lg-12 nopadding" >
						
					<!-- 	<div class="col-lg-6 nopadding">
						<div class=" col-lg-2"></div> -->
						<div class=" col-lg-2" style="    font-size: 22px;    background-color: #f4f4f4;padding: 1px 0px; border-top: 1px solid #ccc;">&nbsp</div>
						<div class=" col-lg-10 nopadding"style="    background-color: #f4f4f4;padding: 1px 0px; border-top: 1px solid #ccc;">
						<div class=" col-lg-6 nopadding" style="font-size: 22px;white-space: nowrap;"><label><spring:message code="amountdue.label" /> </label></div>
						<div class=" col-lg-2"></div>
						<div class=" col-lg-4" style="padding-right: 0px;padding-left: 7px;">
						<input type="text"   style="margin-top:1px" class="form-control" id="dueAmount" name="dueAmount"  value="${orderDetails.dueAmount}"/>
					</div></div>
					</div> --%>
                              </div>
                              
                            
                              
                               <input type="hidden" id="totalQty" >
                                <%--   <input type="hidden" id="subtotal" value="${orderDetails.subTotal}"> --%>
								  <input type="hidden" name="items" id="itemDetails">
                              
                              
                              
                                </form>
                              
                              </div>
					
<%--                              <input type="hidden" name="orderTax" id="totalTax" value="${orderDetails.orderTax}">          --%>
                              <div class="row">
						<div class="col-lg-8"></div>
							</div>
                                   <%-- <div id="tax">
                                   <c:forEach var="tax" items="${taxDetails}" varStatus="theCount">
                                    <div class="row">
                                    <div class="form-group col-lg-6"></div>
                                     <div class="form-group col-lg-3" style="text-align: right;"><label><span class="taxName">${tax.taxName}</span> - <span class="taxRate">${tax.taxRate}<c:if test="${tax.taxType == 'percentage'}">%</c:if></span></label></div>
                                     <div class="form-group col-lg-3">
                                            <input type="text" class="form-control" id="orderTax${theCount.count}" readonly value="" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                     </div>   
                                     </div>
                                     </c:forEach>
                                     
                                     </div>
                                   <div class="row">
                                     <input type="hidden" name="orderTax" id="totalTax" value="${orderDetails.orderTax}"> 
                                     <div class="form-group col-lg-6">
                                      </div>   
                                      <div class="form-group col-lg-3" style="text-align: right;"> <label><spring:message code="shipment_charges.label" /></label></div>
                                    <div class="form-group col-lg-3">
                                            <input type="text" class="form-control" readonly="readonly" name="shipmentCharges" id="shipmentCharges" value="${orderDetails.shipmentCharges}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                     </div>
                                     <div class="col-lg-12" style="text-align: right;margin-top: -15px;">
	                                     <span id="shipmentChargesError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                   </div>  --%>
                                 

<%-- 
							 <div class="row">
								<div class="col-lg-6"></div>
								<div class="col-lg-3" style="text-align: right;"><label><spring:message code="total.order.value.label" /> </label></div>
								<div class="col-lg-3">
								<input type="text" class="form-control" id="orderTotalCost" name="orderTotalCost" readonly value="${orderDetails.orderTotalCost}"/>
							</div>
 						</div> --%>
						<br/>
       <!-- COMPOSE MESSAGE MODAL -->
         <div class="modal fade popup-display" id="items-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" style="text-align: center;"><spring:message code="choose.a.price.label" /></h4>
                    </div>
             <form action="#" method="post">
                 <div class="modal-body">
                  <div class="box-body table-responsive">
                     <table id="itemsList" class="table table-bordered table-hover">
                       <thead style="background-color: #3c8dbc; color: #ffffff">
                         <tr>
                             <th><spring:message code="item.desc.label"/></th>
                             <th><spring:message code="price.label"/></th>
                         </tr>
                       </thead>
                       <tbody style="text-align: center;">
			 			</tbody>
                    </table>
                 </div>
              </div>
             </form> 
         </div><!-- /.modal-content -->
     </div><!-- /.modal-dialog -->
 </div><!-- /.modal -->
	

		<div class="row" style="text-align: right;">
			<input type="button" id="submitButton"  class="btnCls"  onclick="createOrder('Ordered','outlet');" value="<spring:message code="submit.label" />" />
			<input type="button" id="edit"  class="btnCls" style="margin-left:1%;margin-right:1%;" onclick="createOrder('Draft','outlet');" value="<spring:message code="save.label" />" />
			  <c:if test="${sessionScope.role == 'super admin'}">
			  		<input type="button" class="btn bg-olive btn-inline" style="margin-right: 1%;" onclick="viewOrders('${status}','','0','${type}');" value="<spring:message code="back.label" />" />
			  </c:if>
			  <c:if test="${sessionScope.role != 'super admin'}">
				<c:if test="${flowUnder == 'outlet'}">
		           <c:forEach var="accessControl" items="${sessionScope.outletCustomerOrder}">
		                <c:if test="${accessControl.appDocument == 'outletCustomerOrders' && accessControl.write == true && accessControl.read == true}">
		                	<input type="button" class="btnCls" style="margin-right: 1%;" onclick="viewOrders('${status}','','0','${type}');" value="<spring:message code="back.label" />" /> 
		                </c:if>
		           </c:forEach>
		        </c:if>
	           <c:if test="${flowUnder == 'warehouse'}">
	           		<c:forEach var="accessControl" items="${sessionScope.warehouseSalesOrder}">
           				<c:if test="${accessControl.appDocument == 'WarehouseShipmentOrders' && accessControl.write == true && accessControl.read == true}">
           					<input type="button" class="btnCls" style="margin-right: 1%;" onclick="viewOrders('${status}','','0','${type}');" value="<spring:message code="back.label" />" />
           				</c:if>
           			</c:forEach>
	           </c:if>
	           <c:if test="${flowUnder == 'management'}">
	           		<c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrder}">
           				<c:if test="${accessControl.appDocument == 'OrderManagementSalesOrder' && accessControl.write == true && accessControl.read == true}">
           					<input type="button" class="btnCls" style="margin-right: 1%;" onclick="viewOrders('${status}','','0','management');" value="<spring:message code="back.label" />" />
           				</c:if>
           			</c:forEach>
	           </c:if>
		      </c:if>
		 <%-- <c:if test="${sessionScope.role == 'super admin'}"> 
		 	<input type="button" class="btn bg-olive btn-inline" style="margin-right: 1%;" onclick="viewOrders('${status}','','0','${type}');" value="<spring:message code="back.label" />" />
		 </c:if>
		<c:forEach var="accessControl" items="${sessionScope.outletManagement}">
              	<c:if test="${accessControl.appDocument == 'CustomerOrders' && accessControl.write == true && accessControl.read == true}">	
			<input type="button" class="btn bg-olive btn-inline" style="margin-right: 1%;" onclick="viewOrders('${status}','','0','${type}');" value="<spring:message code="back.label" />" />
			</c:if>
		</c:forEach> --%>
		</div>
		<br/>
        <div class="box-footer">
        </div>
<!--         <input type="hidden" name="operation" value="orders">   -->
        </div>
        </div>
       
<div id="menuItemsReplacediv">
<%@ include file="menuItemsPopup.jsp" %>
</div>
 
</div>

</div>
</div>
</section><!-- /.content -->
		  <!-- InputMask -->
      <%--   <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script>
		<script type="text/javascript">
            $(function() {
                //Datemask dd/mm/yyyy
                 $("#orderDate").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"}); 
                $("#deliveryDate").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
            });
            </script> --%>

         <script src="https://maps.googleapis.com/maps/api/js?key=${sessionScope.googleAccessKey}&libraries=places&callback=initAutocomplete"
         async defer></script>
         <input type="hidden" value="${sessionScope.serviceAreaRequired}" id="GoogleKeyId"/>
         <input type="hidden" value="${sessionScope.b2cRequired}" id="b2cRequired"/>
       <!--   <input class="street-class" type="hidden" id="street_name">
         <input class="locality-class" type="hidden" id="landmark_name">
         <input class="city-class" type="hidden" id="city_name">
         <input class="state-class" type="hidden" id="state_name">
         <input class="zip-code-class" type="hidden" id="zip_code">
         <input class="country-class" type="hidden" id="country_name">
         <input class="latitude-class" type="hidden" id="latitude">
         <input class="longitude-class" type="hidden" id="longitude"> -->
<div id="mapid" style="display: none;"></div>
<div id="mapid1" style="display: none;"></div>
<div id="mapid2" style="display: none;"></div>
        <script type="text/javascript">
            $(function() {
            	
              /*  $('#productsList').dataTable({
                    "bPaginate": false,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": false,
                    "bInfo": false,
                    "bAutoWidth": false
                }); */
             });
        </script>
</body>
</html>
		    		 
				    		 