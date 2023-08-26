<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri.S
 * Modified By		        : Manasa.P
 * file name		        : inventorymanager/Orders/editOrderDetails.jsp
 * file type		        : JSP
 * description				: dispaly specific order details
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

	 <!-- DATA TABLES -->
	 	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
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
.is-disabled {
    opacity: .9;
    pointer-events: none;
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
	 focusDiv("Error");
	  /* var dateTime = getCurrentDate();
	  var date = dateTime.split(' ');
	  date = date[0].split('/');
	  var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
	  $('#orderDate').val(formatedDate); */
	  callCalender('orderDate');
	  callCalender('deliveryDate');
	  callCalender('confirmDate');
	  GetStoreSettings();
	  var phoneNo = $("#mobile_num").val();
		phoneNo = phoneNo.split('-');
		if(phoneNo.length == 1)
			$("#phoneNumber").val(phoneNo[0]);
		else{
			/* $("#defaultCountry").val(phoneNo[0]); */
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
		
		
		phoneNo = $("#customerContactNum").val();
		phoneNo = phoneNo.split('-');
		if(phoneNo.length == 1)
			$("#phoneNumber3").val(phoneNo[0]);
		else{
			$("#defaultCountry3").val(phoneNo[0]);
			$("#phoneNumber3").val(phoneNo[1]);
		}
		
		phoneNo = $("#billingMobileNo").val();
		phoneNo = phoneNo.split('-');
		if(phoneNo.length == 1)
			$("#phoneNumber2").val(phoneNo[0]);
		else{
			$("#defaultCountry2").val(phoneNo[0]);
			$("#phoneNumber2").val(phoneNo[1]);
		}
		
		 /* var status = $("#orderStatus").val();
		 if(status.toUpperCase() == "DRAFT" || status.toUpperCase() == "ORDERED" || status.toUpperCase() == "CONFIRMED" || status.toUpperCase() == "CANCELLED" || status.toUpperCase() == "PENDING" || status.toUpperCase() == "PACKED"){
			$("#edit").css("visibility", "visible");
			$("#edit1").css("visibility", "visible");
		}  */
		
		 /* $('#cusappartmentname').on('input',function(e){
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
     });  */
	 
	 
	 /* $('#billappartmentname').on('input',function(e){
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
 });  */
	 
		
		
		updateTotalCostOnLoad();
	  /* $('#custDno').on('input',function(e){
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
     }); */
	 if($("#orderDeliveryType").val() == "Pick Up"){
		 $("#shipmentCharges").attr("readonly","readonly");
	 }else{
		 $("#shipmentCharges").removeAttr("readonly")
	 } 
	 debugger
	  var workflow = $("#orderworkflow").val();
	 if(workflow == 'Shipped' || workflow == 'Delivered'){
	 		// $("#forAllitemsDisabled").attr("readonly","readonly");
	 	 $('.forAllitemsDisabled').addClass('is-disabled');
	 	$('.forshipmentitemsDisabled').addClass('is-disabled');
	 }  
	 
	 /* if(workflow != "Draft")
		 $("#orderDate").attr("readonly","readonly"); */
	 
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
	 $('#custLoc').on('input',function(e){
			 if($(this).data("lastval") == undefined){
				 $("#billLoc").val($(this).val());
				 $("#shipLoc").val($(this).val());
			 }
			 if($(this).data("lastval")== $("#billLoc").val()){
				 $("#billLoc").val($(this).val());
		 	 }
			 if($(this).data("lastval")== $("#shipLoc").val()){
				 $("#shipLoc").val($(this).val());
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
     }); */
     debugger;
     var paidAmount = 0.0;
     paidAmount = $("#paidAmount").val();
     var totalCost = 0.0;
     totalCost =  $("#orderTotalCost").val();
     var otherDiscount = 0.0;
     otherDiscount =  $("#otherDiscount").val();
     if(otherDiscount == undefined ){
    	 otherDiscount = 0.0;
     }
     
    /*  if(paidAmount!="")
     $("#dueAmount").val(0); */
     //$("#dueAmount").val(parseFloat(totalCost)-parseFloat(paidAmount)-parseFloat(otherDiscount));
    	
     
     $(".active-menu").removeClass("active-menu");
     var status = $("#orderworkflow").val();
     status = status+"SalesOrderManagement";
     $("#"+status).addClass("active-menu");
     
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
	 
	 var ShipmentState=$('#shipmentState').val();
	 $("#billState").val(ShipmentState);
		 $("#cusState").val(ShipmentState);

     
 });
 /* added by harsha on 16-5-2019 */
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
 
 
 
 
 /* $('#shipmentState').on('input',function(e){
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
 
</script>
</head>
<body>
<section class="content">
<div class="row">
  <div class="col-lg-12">
				<div class="box box-primary">
                                <div class="box-header" style="">
                                <input type="hidden" id="orderworkflow" value="${orderDetails.orderStatus}"/>
                                <h3 align="center" style="font-size: 20px;"><spring:message code="order_id.label" /> - ${orderDetails.orderId}</h3>
                                <h3 align="center" style="font-size: 20px;margin-top: 5px;"><label><spring:message code="order_status.label" /></label> - ${orderDetails.orderStatus}</h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form>
                                <input type="hidden" id="orderId" name="orderId" value="${orderDetails.orderId}"/>
                                   <div class="box-body">
                                  <div class="row" style="text-align: right; margin-top: -27px;">
                                   <div id="ErrorForShipment" style="text-align:center;color:red;font-weight:bold;"></div>
                                  <div id="Error" class="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                  <div id="Success" class="Error" style="text-align:center;color:blue;font-weight:bold;">${success}</div>
                               
                                 <c:choose>
                                        <c:when test="${orderDetails.orderStatus == 'Draft' || orderDetails.orderStatus == 'draft'}">
                                 <c:forEach var="activity" items="${orderDetails.nextWorkFlowStates}">
									 	<input type="button" id="edit"   style="margin-left:1%;" class="btnCls" onclick="updateOrder('${activity}','edit','outlet');" value="${activity}" />
									 </c:forEach>
                                  	<%-- <input type="button" id="edit"  style="position: relative;" class="btnCls" onclick="updateOrder('Ordered','edit','outlet');" value="<spring:message code="submit.label" />" /> --%>
								 </c:when>
								 <c:otherwise>
								 	<input type="button" id="edit"  style="display: none;" style="position: relative;" class="btnCls" onclick="updateOrder('Ordered','edit','outlet');" value="<spring:message code="submit.label" />" />
								 </c:otherwise>
								 </c:choose>
                                <%--   	<input type="button" id="edit" style="position: relative;" class="btnCls" onclick="updateOrder('Ordered','edit','outlet');" value="<spring:message code="submit.label" />" /> --%>
								  <input type="hidden" id="type" value="${type}">
								  <input type="hidden" id="flowUnder" name="flowUnder" value= "${flowUnder}">
								  <input type="button" style="margin-left:1%;" class="btnCls" onclick="updateOrder('${orderDetails.orderStatus}','edit','outlet');" value="${orderDetails.orderStatus}" />
								 <c:if test="${sessionScope.role == 'super admin'}">
										<c:if test="${orderDetails.orderStatus != 'Draft' && orderDetails.orderStatus != 'draft'}">
											 <c:forEach var="activity" items="${orderDetails.nextWorkFlowStates}">
											 	<input type="button" style="margin-left:1%;" class="btnCls" onclick="updateOrder('${activity}','edit','outlet');" value="${activity}" />
											 </c:forEach>
										</c:if>
								  </c:if>
								  <c:if test="${sessionScope.role != 'super admin'}">
									<c:if test="${flowUnder == 'outlet'}">
							           <c:if test="${orderDetails.orderStatus != 'Draft' && orderDetails.orderStatus != 'draft'}">
											 <c:forEach var="activity" items="${orderDetails.nextWorkFlowStates}">
											 	<c:forEach var="accessControl" items="${sessionScope.outletCustomerOrderActivity}">
											 		<c:if test="${activity == accessControl.appDocumentActivity}">
													 	<input type="button" style="margin-left:1%;" class="btnCls" onclick="updateOrder('${activity}','edit','outlet');" value="${activity}" />
											 		</c:if>
							     				</c:forEach> 
											 </c:forEach>
										</c:if>
							        </c:if>
						           <c:if test="${flowUnder == 'warehouse'}">
			                			<c:if test="${orderDetails.orderStatus != 'Draft' && orderDetails.orderStatus != 'draft'}">
											 <c:forEach var="activity" items="${orderDetails.nextWorkFlowStates}">
											 	<c:forEach var="accessControl" items="${sessionScope.warehouseSalesOrderActivity}">
											 		<c:if test="${activity == accessControl.appDocumentActivity}">
													 	<input type="button" style="margin-left:1%;" class="btnCls" onclick="updateOrder('${activity}','edit','outlet');" value="${activity}" />
											 		</c:if>
							     				</c:forEach> 
											 </c:forEach>
										</c:if>
						           </c:if>
						           <c:if test="${flowUnder == 'management'}">
			                			<c:if test="${orderDetails.orderStatus != 'Draft' && orderDetails.orderStatus != 'draft'}">
											 <c:forEach var="activity" items="${orderDetails.nextWorkFlowStates}" varStatus="theCount">
<%-- 											 <input type="button"   style="margin-left:1%;" class="btnCls" onclick="updateOrder('${activity}','edit','outlet');" value="${activity}" /> --%>
											
											<c:choose>
											 	<c:when test="${theCount.count eq 1}">
											<input type="button"   style="margin-left:1%;" class="btnCls" onclick="updateOrder('${activity}','edit','outlet');" value="${activity}" />
											 	</c:when>
											 	<c:otherwise>
											 	<c:if test="${activity == 'Cancelled'}">
											 	<input type="button"  style="margin-left:1%;" class="btnCls" onclick="updateOrder('${activity}','edit','outlet');" value="${activity}" />
											 	</c:if>
											 	<c:if test="${activity != 'Cancelled'}">
											 	<%-- <input type="button"  disabled="disabled"   style="margin-left:1%;background-color: #cccccc;" class="btnCls" onclick="updateOrder('${activity}','edit','outlet');" value="${activity}" /> --%>
											 	<input type="button"  style="margin-left:1%;" class="btnCls" onclick="updateOrder('${activity}','edit','outlet');" value="${activity}" />
											 	</c:if>
											 	
											 	</c:otherwise>
											 	</c:choose>
											 <%-- 	<c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrderActivity}" >
											 		<c:if test="${activity == accessControl.appDocumentActivity}">
													
													<input type="button"   style="margin-left:1%;" class="btnCls" onclick="updateOrder('${activity}','edit','outlet');" value="${activity}" />
													 <c:choose>
											 	       <c:when test="${theCount.count eq 1}">
											 	          <input type="button"   style="margin-left:1%;" class="btnCls" onclick="updateOrder('${activity}','edit','outlet');" value="${activity}" />
											 	       </c:when>
											 	       <c:otherwise>
											 	          <input type="button" disabled="disabled"   style="margin-left:1%;background-color: #cccccc;" class="btnCls" onclick="updateOrder('${activity}','edit','outlet');" value="${activity}" />
											 	       </c:otherwise>
						                            </c:choose>	
													 	<input type="button" style="margin-left:1%;" class="btnCls" onclick="updateOrder('${activity}','edit','outlet');" value="${activity}" />
											 		</c:if>
							     				</c:forEach>  --%>
											 </c:forEach>
										</c:if> 
						           </c:if>
							      </c:if>
							      <input type="button" class="btnCls" style="margin-left:1%; margin-right: 15px;" onclick="viewOrders('${status}','','0','${type}');" value="<spring:message code="back.label" />" />
								  <hr style="margin-top: 4px;width: 99%;" />
									</div>
									 
								  <div class="forAllitemsDisabled">	
									<!-- added by harsha on 16-5-2019 -->
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
				                                  	<input style="width:110%;" type="text" class="form-control"  onblur="phoneNumberBlur()" placeholder="<spring:message code="enter.customer_contact_num.label" />" id="phoneNumber" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
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
                                            <c:choose>
                                        <c:when test="${orderDetails.orderStatus == 'Draft'}">
                                            <input class="form-control calendar_icon"  readonly="readonly" value="${orderDetails.orderDate}" style="background-color: white; padding-left: 5px !important;" name="orderDate" id="orderDate" size="20" type="text" onfocus="callCalender('orderDate')" onclick="callCalender('orderDate')" placeholder="DD/MM/YYYY"/>
                                          </c:when>
                                          <c:otherwise>
                                           <input class="form-control calendar_icon"  style=" opacity: .9;pointer-events: none;padding-left: 5px !important;" readonly="readonly" value="${orderDetails.orderDate}" style="background-color: white;" name="orderDate" id="orderDate" size="20" type="text" onfocus="callCalender('orderDate')" onclick="callCalender('orderDate')" placeholder="DD/MM/YYYY"/>
                                          </c:otherwise>
                                          </c:choose>
                                            <span id="orderDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div> 
                                     <div class="col-lg-6" style="padding-left: 10px;padding-right: 0px;width:40%;">
                                           <label>Fullfilment Location</label>
                                            <select class="form-control" id="outletLocation" onchange="GetStoreSettings()"> <!-- onchange="getTaxes();" -->
                                             <c:forEach var="location" items="${locationsList}">
                                              <c:if test="${location.locationId != 'B2C' }"> 
												<option value="${location.businessActivity}" ${location.locationId == orderDetails.saleLocation ? 'selected' : ''}>${location.locationId}</option>
											 </c:if> 
											 </c:forEach>
											 </select>
											 <input type="hidden" name="saleLocation" id="saleLocation" value="${orderDetails.saleLocation}">
											  <input type="hidden" id="location">
                                     </div>                                 
                                     </div> 
                                     

                                         </div>
                                     <div class="col-lg-1" style="width:15%;">
 										<label>Delivery Channel</label>
                                            <select class="form-control" id="DeiveryChannel">
                                             <option>Delivery Boy</option>
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
                                             <option value="Online" ${'Online' == orderDetails.orderChannel ? 'selected' : ''}>Online</option>
                                            <option value="Mobile" ${'Mobile' == orderDetails.orderChannel ? 'selected' : ''}>Mobile</option>
                                            <option value="Android Mobile" ${'Android Mobile' == orderDetails.orderChannel ? 'selected' : ''}>Android Mobile</option>
                                             <option value="Telephone" ${'Telephone' == orderDetails.orderChannel ? 'selected' : ''}>Telephone</option>
                                            <option value="Sales Executive" ${'Sales Executive' == orderDetails.orderChannel ? 'selected' : ''}>Sales Executive</option>
                                            <option value="Direct" ${'Direct' == orderDetails.orderChannel ? 'selected' : ''}>Direct</option>
                                            </select>                                        	                                                                            
                                     </div> 
                                     
                                   </div>
									<div class="row">
											<div class="col-lg-2" style="width:20%;margin-right: 20px;">
											<div class="row">
	                                      <div class="col-lg-6" style="padding-right: 0px;">  
 										<label>First Name</label>
                                            <input class="form-control" style="width:100px;" value="${orderDetails.shipmentName}" />	                                        	                                                                            
                                     </div> 
	                                      <div class="col-lg-6" style="padding-left: 5px;">  
 										<label>Last Name</label>
                                            <input class="form-control" style="width:100px;" />	                                        	                                                                            
                                     </div>                                      
										</div>
                                        </div>
                                        
                                        <div class="col-lg-4" style="padding-left: 0px;width: 33%;">
                                        <div class="row">                                      
                                     <div class="col-lg-6" style="width:40%;">
                                            <label>Delivery Date <span style="color:red; font-size:2">*</span></label>
										 <input class="form-control calendar_icon" style=" opacity: .9;pointer-events: none;  padding-left: 5px !important"  readonly="readonly" value="${orderDetails.deliveryDate}" style="background-color: white;" name="deliveryDate" id="deliveryDate" size="20" type="text" onfocus="callCalender('deliveryDate')" onclick="callCalender('deliveryDate')" placeholder="DD/MM/YYYY"/>
                                           <span id="deliveryDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div> 
										<div class="col-lg-6" style="padding-left: 10px;padding-right: 0px;">
                                            <div class="row" style="width:105%;">
				                                
				                                  <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
				                                   <label><spring:message code="starttime.label" /></label>
				                                   
				                                  	<input style="width:130%;" type="text" class="form-control" disabled="disabled" value="${orderDetails.deliverySlotStartTime}" name="deliverySlotStartTime"  placeholder="<spring:message code="starttime.label" />" id="del_starttime" size="15" maxlength="15" />


				                                  </div>
				                                 
				                                  <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" >
				                                   <label><spring:message code="endtime.label" /></label>
													<input style="width:130%;" type="text" class="form-control" disabled="disabled" value="${orderDetails.deliverySlotEndTime}" name="deliverySlotEndTime" placeholder="<spring:message code="endtime.label" />" id="del_endtime" size="15" maxlength="15" />

				                                  </div>
				                             </div>
                                     </div>                                
                                     </div> 
                                     

                                         </div>
                                         
                                     <div class="col-lg-1" style="width:15%;">
 										<label><spring:message code="order_delivery_type.label" /></label>
                                       <select class="form-control" id="orderDeliveryType" onchange="changeShipmentCharges();">
                                           <option value="Pick Up" ${'Pick Up' == orderDetails.orderDeliveryType ? 'selected' : ''}>Pick Up</option>
                                           <option value="Door Delivery" ${'Door Delivery' == orderDetails.orderDeliveryType ? 'selected' : ''}>Door Delivery</option>
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
                                   <input type="hidden" name="orderDeliveryType" id="deliveryType" value="${orderDetails.orderDeliveryType}"/>
                                          <%--  	<input type="hidden" name="orderStatus" id="orderStatus" value="${orderDetails.orderStatus}"/> --%>
                                            <input type="hidden" name="orderStatus" id="orderStatus" value="${orderDetails.orderStatus}"/>
                                             <input type="hidden" name="selectedStatus" id="selectedStatus"  value="${status}"/>
                                             <input type="hidden" name="viewOrEdit" value="edit"/>
									<div class="row">
                                    <div class=" col-lg-2" style="width: 20%;margin-right: 20px;">
                                            <label><spring:message code="customer_email.label" /></label>
                                            <input type="text" style="width:94%;" class="form-control" name="email_id" id="email_id" onblur="validateEmail();" value="${orderDetails.email_id}" placeholder="<spring:message code="order.enter.email" />"/>
                                            <span id="emailError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                        
                                        <div class=" col-lg-4" style="padding-left: 0px;width: 33%;">
                                        <div class="row">                                      
                                     <div class=" col-lg-6" style="width:40%;">
                                            <label>Confirm Date<span style="color:red; font-size:2">*</span></label>
                                             <c:if test="${orderDetails.confirmedDate != null && orderDetails.confirmedDate!='' && orderDetails.confirmedDate!=undefined }"> 
											<input class="form-control " value="${orderDetails.confirmedDate}" name="confirmedDate" id="confirmDate" size="20" type="text" onfocus="callCalender('confirmDate')" onclick="callCalender('confirmDate')" placeholder="DD/MM/YYYY"/>
											</c:if> 
											 <c:if test="${orderDetails.confirmedDate == null || orderDetails.confirmedDate=='' || orderDetails.confirmedDate==undefined }"> 
											<input class="form-control " value="${orderDetails.deliveryDate}" name="confirmedDate" id="confirmDate" size="20" type="text" onfocus="callCalender('confirmDate')" onclick="callCalender('confirmDate')" placeholder="DD/MM/YYYY"/>
											</c:if> 
										  <span id="confirmDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div> 
										<div class="col-lg-6" style="padding-left: 10px;padding-right: 0px;">
                                            <div class="row" style="width:105%;">
				                                
				                                  <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
				                                   <label><spring:message code="starttime.label" /></label>
				                                   
				                                   <select class="form-control" id="confirmedSlotStartTime" name="confirmedSlotStartTime" onchange="startTimeChange(this.options[this.selectedIndex].index,'confirmedSlotEndTime')" style="width: 130%;">
		                                             <c:forEach var="startTime1" items="${startTimeList}" >
														<option value="${startTime1}" ${startTime1 == orderDetails.confirmedSlotStartTime  ? 'selected' : ''} >${startTime1}</option>
													 </c:forEach>
													 </select>
                                           <span id="confirmStartTimeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>

				                                  </div>
				                                 
				                                  <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" >
				                                   <label><spring:message code="endtime.label" /></label>
													<select class="form-control" id="confirmedSlotEndTime" name="confirmedSlotEndTime" onchange="startTimeChange(this.options[this.selectedIndex].index,'confirmedSlotStartTime')" style="width: 130%;">
		                                             <c:forEach var="endTime" items="${endTimeList}">
														<option value="${endTime}" ${endTime == orderDetails.confirmedSlotEndTime  ? 'selected' : ''}  >${endTime}</option>
													 </c:forEach>
													 </select>
				                                  </div>
				                             </div>
                                     </div>                                
                                     </div> 
                                         </div>
                                         
                                     <div class=" col-lg-1" style="width:15%;">
 										<label><spring:message code="shipment.type.label" /></label>
                                            <select id="shipmentType" name="shipperId" class="form-control" onchange="getShipmentCost();">
												<option value="Normal" ${'Normal' == orderDetails.shipperId ? 'selected' : ''}>Normal</option>
												<option value="Express" ${'Express' == orderDetails.shipperId ? 'selected' : ''}>Express</option>
										    </select>
	                                                                             
                                     </div>  
                                        
                                      <div class=" col-lg-1" style="width:15%;">
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
	                                      
                                            <input type="hidden" class="form-control"  id="referredBy"  name="referredBy" value="${orderDetails.referredBy}"  />	                                        	                                                                            
	                                      <div class=" col-lg-1" style="width:15%;">  
 										<label>Customer Tax ID</label>
 								       <input type="text" class="form-control"  id="customertaxid" value="${orderDetails.customerGstin}"/>	                                        	                                                                            
 										
 										
                                     </div> 
                                     
                                   
                                   </div>   
                                   <!-- end harsha -->								   	
                                   <%-- <div class="row">
                                     <div class="form-group col-lg-2">
                                            <label><spring:message code="order_date.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input class="form-control calendar_icon" readonly="readonly" value="${orderDetails.orderDate}" style="background-color: white;" name="orderDate" id="orderDate" size="20" type="text" onfocus="callCalender('orderDate')" onclick="callCalender('orderDate')" placeholder="DD/MM/YYYY"/>
                                            <c:choose>
                                        <c:when test="${orderDetails.orderStatus == 'Draft'}">
                                            <input class="form-control calendar_icon"  readonly="readonly" value="${orderDetails.orderDate}" style="background-color: white;" name="orderDate" id="orderDate" size="20" type="text" onfocus="callCalender('orderDate')" onclick="callCalender('orderDate')" placeholder="DD/MM/YYYY"/>
                                          </c:when>
                                          <c:otherwise>
                                           <input class="form-control calendar_icon"  style=" opacity: .9;pointer-events: none;" readonly="readonly" value="${orderDetails.orderDate}" style="background-color: white;" name="orderDate" id="orderDate" size="20" type="text" onfocus="callCalender('orderDate')" onclick="callCalender('orderDate')" placeholder="DD/MM/YYYY"/>
                                          </c:otherwise>
                                          </c:choose>
                                            <span id="orderDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                     <div class="form-group col-lg-2">
                                            <label><spring:message code="delivery_date.label" /> <span style="color:red; font-size:2">*</span></label>
                                        <input class="form-control calendar_icon" style=" opacity: .9;pointer-events: none;"  readonly="readonly" value="${orderDetails.deliveryDate}" style="background-color: white;" name="deliveryDate" id="deliveryDate" size="20" type="text" onfocus="callCalender('deliveryDate')" onclick="callCalender('deliveryDate')" placeholder="DD/MM/YYYY"/>
                                           <span id="deliveryDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                      <div class="form-group col-lg-3" style="padding: 0px;">
                                            <label><spring:message code="confirm_date.label" /> <span style="color:red; font-size:2">*</span></label>
                                        <input class="form-control calendar_icon" readonly="readonly" value="${orderDetails.confirmedDate}" style="background-color: white;" name="confirmedDate" id="confirmDate" size="20" type="text" onfocus="callCalender('confirmDate')" onclick="callCalender('confirmDate')" placeholder="DD/MM/YYYY"/>
                                           <span id="confirmDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                     
                                       <div class="form-group col-lg-3">
                                            <label><spring:message code="customer_email.label" /></label>
                                            <input type="text" class="form-control" name="email_id" id="email_id" onblur="validateEmail();" value="${orderDetails.email_id}" placeholder="<spring:message code="order.enter.email" />"/>
                                            <span id="emailError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                     <div class="form-group col-lg-2">
                                            <label><spring:message code="payment.type.label" /></label>
                                            <select class="form-control" name="paymentType" id="paymentType">
	                                            <option value="On Delivery" ${'On Delivery' == orderDetails.paymentType ? 'selected' : ''}>On Delivery</option>
	                                            <option value="Prepaid" ${'Prepaid' == orderDetails.paymentType ? 'selected' : ''}>Prepaid</option>
                                            </select>
                                     </div>
                                    
                                   
                                        
                                   </div> --%>
                                    <%-- <div class="row">
                                     <div class="form-group col-lg-2">
                                       <div class="form-group col-lg-10" style="padding-left:0px">
                                      	<label><spring:message code="sales_location.label" /></label>
                                            <select class="form-control" id="outletLocation" onchange="getTaxes();">
                                             <c:forEach var="location" items="${locationsList}">
												<option value="${location.businessActivity}" ${location.locationId == orderDetails.saleLocation ? 'selected' : ''}>${location.locationId}</option>
											 </c:forEach>
											 </select>
											 <input type="hidden" name="saleLocation" id="saleLocation" value="${orderDetails.saleLocation}">
											  <input type="hidden" id="location">
                                     </div>
                                    </div>
                                   <div class=" col-lg-2"> 
                                  
                                            <div class="row">
				                                
				                                  <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" >
				                                   <label><spring:message code="starttime.label" /></label>
				                                   <input type="text" class="form-control" disabled="disabled" value="${orderDetails.deliverySlotStartTime}" name="deliverySlotStartTime"  placeholder="<spring:message code="starttime.label" />" id="del_starttime" size="15" maxlength="15" />

				                                  </div>
				                                 
				                                  <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" >
				                                   <label><spring:message code="endtime.label" /></label>
				                                  	<input type="text" class="form-control" disabled="disabled" value="${orderDetails.deliverySlotEndTime}" name="deliverySlotEndTime" placeholder="<spring:message code="endtime.label" />" id="del_endtime" size="15" maxlength="15" />
				                                  </div>
				                             </div>
                                     </div>
                                     <div class=" col-lg-3" style="padding: 0px;"> 
                                  
                                            <div class="row">
				                                
				                                  <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" >
				                                   <label><spring:message code="starttime.label" /></label>
				                                   
				                                   <select class="form-control" id="confirmedSlotStartTime" name="confirmedSlotStartTime" onchange="startTimeChange(this.options[this.selectedIndex].index,'confirmedSlotEndTime')">
		                                             <c:forEach var="startTime1" items="${startTimeList}" >
														<option value="${startTime1}" ${startTime1 == orderDetails.confirmedSlotStartTime  ? 'selected' : ''} >${startTime1}</option>
													 </c:forEach>
													 </select>
                                           <span id="confirmStartTimeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>

				                                  </div>
				                                 
				                                  <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" >
				                                   <label><spring:message code="endtime.label" /></label>
													<select class="form-control" id="confirmedSlotEndTime" name="confirmedSlotEndTime" onchange="startTimeChange(this.options[this.selectedIndex].index,'confirmedSlotStartTime')">
		                                             <c:forEach var="endTime" items="${endTimeList}">
														<option value="${endTime}" ${endTime == orderDetails.confirmedSlotEndTime  ? 'selected' : ''}  >${endTime}</option>
													 </c:forEach>
													 </select>
				                                  </div>
				                             </div>
                                     </div>
                                     <div class="form-group col-lg-3">
                                            <label><spring:message code="customer_contact_num.label" /> <span style="color:red; font-size:2">*</span></label>
                                             <div class="row">
				                                  <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
				                                  	<select class="form-control" style="padding: 4px 6px;" id="defaultCountry" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
				                                  	<option  value="${sessionScope.countryCode}" text="India" ${'India' == orderDetails.country ? 'selected' : ''}>${sessionScope.countryCode}</option>
				                                  	<option text="USA" ${'USA' == orderDetails.country ? 'selected' : ''}>US</option>
				                                  	<option text="United Kingdom" ${'United Kingdom' == orderDetails.country ? 'selected' : ''}>GB</option>
				                                  	<option text="Australia" ${'Australia' == orderDetails.country ? 'selected' : ''}>AU</option>
				                                  	</select>
				                                  </div>
				                                  <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" >
				                                  	<input type="text" class="form-control" onblur="validateMobileNumber();" placeholder="<spring:message code="enter.customer_contact_num.label" />" id="phoneNumber" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
				                                  </div>
				                                  <input type="hidden" class="form-control" name="country" id="mobile_num_code"  value="${orderDetails.country}"/>
				                                  <input type="hidden" class="form-control" name="mobile_num" id="mobile_num"  value="${orderDetails.mobile_num}"/>
				                                   <input type="hidden" id="output" />
				                             </div>
				                        	<span id="phoneNumberError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>  
                                     
                                     
                                    <div class="form-group col-lg-2">
                                            <label><spring:message code="payment.mode.label" /></label>
                                        
                              		<c:choose>
                                        <c:when test="${orderDetails.orderStatus == 'Draft'}">
                                            <select class="form-control"   name="paymentMode" id="paymentMode">
	                                            <option value="Debit Card" ${'Debit Card' == orderDetails.paymentMode ? 'selected' : ''}>Debit Card</option>
	                                            <option value="Credit Card" ${'Credit Card' == orderDetails.paymentMode ? 'selected' : ''}>Credit Card</option>
	                                            <option value="Net Banking" ${'Net Banking' == orderDetails.paymentMode ? 'selected' : ''}>Net Banking</option>
	                                            <option value="Pay Cash" ${'Pay Cash' == orderDetails.paymentMode ? 'selected' : ''}>Pay Cash</option>
                                            </select>
                                            </c:when>
                                            <c:otherwise>
                                            <select class="form-control" style=" opacity: .9;pointer-events: none;" name="paymentMode" id="paymentMode">
	                                          <option value="POD" ${'POD' == orderDetails.paymentMode ? 'selected' : ''}>POD</option>
	                                            <option value="Pay Online" ${'Pay Online' == orderDetails.paymentMode ? 'selected' : ''}>Pay Online</option>
	                                            <option value="Debit Card" ${'Debit Card' == orderDetails.paymentMode ? 'selected' : ''}>Debit Card</option>
	                                            <option value="Credit Card" ${'Credit Card' == orderDetails.paymentMode ? 'selected' : ''}>Credit Card</option>
	                                            <option value="Net Banking" ${'Net Banking' == orderDetails.paymentMode ? 'selected' : ''}>Net Banking</option>
	                                            <option value="Pay Cash" ${'Pay Cash' == orderDetails.paymentMode ? 'selected' : ''}>Pay Cash</option>
                                            </select>
                                            
                                            </c:otherwise>
                                            
                                            </c:choose>
                                            
                                            
                                     </div>
                                   </div> --%>
                                 
                                   
								<div class="form-group" onclick="collapse();" style="margin-bottom:30px;">
                               <label style="float: right;"><i id="myfa" style="font-size: 200%;" class="fa fa-angle-down pull-right"></i></label>
                               </div>                                   
                                   <div id="collapsible">
                                   <div style="background-color: #e6e6e6;padding-left: 5px;padding-right: 15px;">                                                                      
                                   <div class="row">
                                     <div class="form-group col-lg-1" style=" margin-top: 5px;">
                                    	<div style="background: gainsboro;padding: 10px;width: 149px;">
                                            <label style="font-size: 16px;font-weight:bold;"><spring:message code="shipmentAddress.label" /></label>
                                        </div>
                                     </div>
                                      <div class="col-lg-2" style="margin-left:61px;margin-top: 5px;">
	                                        <span><a id="address1" onclick="shipmentAddress('address1',true)" style="height: 35px; width: 21px;margin-right: 1px;padding: 0px 5px 25px 5px;; border:solid 1px gray" class="w3-btn-floating w3-teal highlightaddress"><font size="+1">1</font></a></span>     
											<span><a id="address2" onclick="shipmentAddress('address2',true)" style="height: 35px; width: 21px;margin-right: 1px;padding: 0px 5px 25px 5px;; border:solid 1px gray" class="w3-btn-floating w3-teal"><font size="+1">2</font></a></span>   
											<span><a id="address3" onclick="shipmentAddress('address3',true)" style="height: 35px; width: 21px;margin-right: 1px;padding: 0px 5px 25px 5px;; border:solid 1px gray" class="w3-btn-floating w3-teal"><font size="+1">3</font></a></span>    
											<span><a id="address4" onclick="shipmentAddress('address4',true)" style="height: 35px; width: 21px;margin-right: 1px;padding: 0px 5px 25px 5px;; border:solid 1px gray" class="w3-btn-floating w3-teal"><font size="+1">4</font></a></span>
											<c:forEach var="addr" items="${addressList}" varStatus="theCount">
												<input type="hidden" value="${addr.shipmentName}" id="shipmentNameaddress${theCount.count}">
												<input type="hidden" value="${addr.addressType}" id="addressType${theCount.count}">
 												<input type="hidden" value="${addr.house_type}" id="houseType${theCount.count}"> 
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
									</div>   
								
									<div class="col-lg-3" style="margin-left: -62px;">
                                            <label><spring:message code="shipment.contact.number.label" /> <span style="color:red; font-size:2">*</span></label>
                                             <div class="row">
				                                  <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
				                                  	<select class="form-control" style="padding: 4px 6px;" id="defaultCountry1" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
				                                  	<option value="${sessionScope.countryCode}"<%-- text="India" ${'India' == orderDetails.shipmentCountry ? 'selected' : ''} --%>>${sessionScope.countryCode}</option>
				                                  	<%-- <option text="USA" ${'USA' == orderDetails.shipmentCountry ? 'selected' : ''}>US</option>
				                                  	<option text="United Kingdom" ${'United Kingdom' == orderDetails.shipmentCountry ? 'selected' : ''}>GB</option>
				                                  	<option text="Australia" ${'Australia' == orderDetails.shipmentCountry ? 'selected' : ''}>AU</option> --%>
				                                  	</select>
				                                  </div>
				                                  <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
				                                  	<input type="text" class="form-control" onblur="validatePersonalMobileNumber()"  placeholder="<spring:message code="shipment.contact.number.label" />" id="phoneNumber1" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
				                                  </div>
<%-- 				                                  <input type="hidden" class="form-control" name="shipmentContactCode" id="shipmentContactCode"  value="${orderDetails.shipmentContactCode}"/> --%>
				                                  <input type="hidden" class="form-control" name="shipmentContact" id="shipmentContact"  value="${orderDetails.mobile_num}"/>
				                                 <!--   <input type="hidden" id="output1" /> -->
				                             </div>
				                        	<span id="phoneNumber1Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                     	  
                                     <div class="form-group col-lg-1" style="">
                                            <label>Door No.<span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="shipDno"  name="shipement_address_doorNo" value="${orderDetails.shipement_address_doorNo}" placeholder="<spring:message code="order.enter.door.no" />" />
                                            <span id="shipDnoError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                     	<div class=" col-lg-2" style="">
                                     	  <label>Building Name<span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="shipappartmentname"  name="shipmentApartmentName" value="${orderDetails.shipmentApartmentName}" placeholder="<spring:message code="order.enter.door.no" />" />
                                            <span id="shipappartmentnameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                   
                                     	
                                     	</div>
									 
									 	<div class="form-group col-lg-3" style="">
                                            <label><spring:message code="shipment_street.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="shipStreet" name="shipement_address_street" value="${orderDetails.shipement_address_street}" placeholder="<spring:message code="order.enter.street" />" />
                                            <span id="shipStreetError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     	</div>
									 
                                     </div>
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
                                            <input type="text" class="form-control" id="shipPin" name="shipmentPinNo" value="${orderDetails.shipmentPinNo}" placeholder="<spring:message code="order.enter.pin" />"/>
                                            
                                    	
										</div>
                                    	<div class="form-group col-lg-6" style="padding-right: 0px;padding-left: 5px;">
                                    	 <label><spring:message code="shipment.state.label" /><span style="color:red; font-size:2">*</span></label>
                                    	 
                                    	 
                                    	 
                                    	  
                                    	 <c:set var = "shipmentState" value = "${fn:toUpperCase(orderDetails.shipmentState)}" />
                                    	 <input type="hidden" value="${shipmentState}"/>
                                    	 <select class="form-control" name="shipmentState" id="shipmentState" style="width: 100%;">
	                                       <option value="" >Select state</option>
	                                        <c:forEach var="states" items="${states.stateMasters}">
	                                        <c:set var = "stateName" value = "${fn:toUpperCase(states.stateName)}" />
	                             			<option value="${states.stateName}" ${states.stateName == orderDetails.shipmentState ? 'selected' : ''}>${states.stateName}</option>
											</c:forEach>
	                                        </select>
                                    	 
                                    	 
                                    	 
                                    	 
                                    	 
                                    	 
<%--                                             <input type="text" class="form-control" id="shipmentState" name="shipmentState" value="${orderDetails.shipmentState}" placeholder="<spring:message code="order.enter.state" />" />
 --%>                                            <span id="shipmentStateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     	
                                    	</div>
                                    	
                                        </div>
                                    
                                      </div>
                                      
                                      <div class="row">
                                      <div class="col-lg-11" ></div>
                                       <div class="col-lg-1" style="margin-top: -25px;">
                                       <label id="copyAll" onclick='copyAllData();'>Copy All</label>
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
                                    
                                    
                                     <div class="form-group col-lg-3" style="">
                                        <label><spring:message code="shipment.contact.number.label" /> <span style="color:red; font-size:2">*</span></label>         
                                             <div class="row">
				                                  <div class="col-lg-4 col-md-1 col-sm-1 col-xs-1">
				                                  	<select class="form-control" style="padding: 4px 6px;" id="defaultCountry3" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
				                                  	<option text="India" ${'India' == orderDetails.country ? 'selected' : ''}>IN</option>
				                                  	<option text="USA" ${'USA' == orderDetails.country ? 'selected' : ''}>US</option>
				                                  	<option text="United Kingdom" ${'United Kingdom' == orderDetails.country ? 'selected' : ''}>GB</option>
				                                  	<option text="Australia" ${'Australia' == orderDetails.country ? 'selected' : ''}>AU</option>
				                                  	</select>
				                                  </div>
				                                  <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
				                                  	<input type="text" class="form-control" placeholder="<spring:message code="enter.customer_contact_num.label" />"  value="${orderDetails.mobile_num}" id="customerContactNum" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
				                                  </div>
				                                  <input type="hidden" class="form-control"  id="custphoneNumberCode"  value="${orderDetails.country}"/>
                                               <%--  <input type="hidden" class="form-control" name="customerContactNum" id="customerContactNum"  value="${orderDetails.customerContactNum}"/> --%>
				                                <input type="hidden" id="output5" />
				                             </div>                                          
                                           
                                     </div>
                                       <div class="form-group col-lg-1" style="">
                          				
										<label>Door No.<span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="custDno" name="customer_address_doorNo"  value="${orderDetails.customer_address_doorNo}" placeholder="<spring:message code="order.enter.door.no" />"/>
                                         <span id="custDnoError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                    
                                         </div>
                                         
                                         
                                         <div class=" col-lg-2" style="">
                                     	  <label>Building Name<span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="cusappartmentname"  name="customerApartmentName" value="${orderDetails.customerApartmentName}" placeholder="<spring:message code="order.enter.door.no" />" />
                                            <span id="cusappartmentnameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                   
                                     	
                                     	</div>
                                         
                                         
                                         <div class="form-group col-lg-3" style="">
                          				<label><spring:message code="customer_street.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="custStreet" name="customer_address_street"  value="${orderDetails.customer_address_street}" placeholder="<spring:message code="order.enter.street" />" />
                                            <span id="custStreetError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                         
                                      <div class="form-group col-lg-3" style="display:none">
                                       
                                        <label><spring:message code="googlemaplink.label" /> </label>
                                            <input type="text" class="form-control" id="custgogLink" name="customer_map_link"  value="${orderDetails.customer_map_link}" placeholder="<spring:message code="enter.googlemaplink.label" />"/>
                                  
                                       </div>
                                    
                                    
                                    </div>
                                     <div class="row">
                                     <div class="form-group col-lg-3" style="margin-top: -17px;">
                                     <label><spring:message code="shipment.name.label" /> <span style="color:red; font-size:2">*</span></label>
										<input type="text" class="form-control" id="CusshipmentName" value="${orderDetails.shipmentName}"/>
										</div>
                                     
                                     
                                      <div class="form-group col-lg-3" style="margin-top: -17px;">
                                           
                                       <label><spring:message code="customer_location.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="custLoc" name="customer_address_location"  value="${orderDetails.customer_address_location}" placeholder="<spring:message code="order.enter.landmark" />"  />
                                            <span id="custLocError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
  
                                      </div>
                                     
                                       <div class="form-group col-lg-3" style="margin-top: -17px;">
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
<%--                                  <input type="hidden" class="form-control"  id="custpin" name="customer_pinNo"  value="${orderDetails.customer_pinNo}" placeholder="<spring:message code="enter.pin.label" />"/>
 --%>                                      		
                                      
                                       
                                        <div class="form-group col-lg-3" style="margin-top: -17px;">
										
										
										<div class="form-group col-lg-6" style="padding-left: 0px;padding-right: 5px;">
										   <label><spring:message code="pin.label" /></label>
                                            <input type="text" class="form-control" id="custpin" name="customer_pinNo" value="${orderDetails.customer_pinNo}" placeholder="<spring:message code="order.enter.pin" />"/>
                                            
                                    	
										</div>
										<div class="form-group col-lg-6" style="padding-right: 0px;padding-left: 5px;">
										 <label><spring:message code="shipment.state.label" /><span style="color:red; font-size:2">*</span></label>
											
											
											 <select class="form-control"  id="cusState" style="width: 100%;">
	                                        <c:forEach var="states" items="${states.stateMasters}">
	                             <option value="${states.stateName}" ${states.stateName == orderDetails.shipmentState ? 'selected' : ''}>${states.stateName}</option>
	                            			 
	                                        
											</c:forEach>
	                                        
	                                            </select>
										
											
<%-- 											<input type="text" class="form-control" id="cusState" value="${orderDetails.shipmentState}" placeholder="<spring:message code="order.enter.state" />" />
 --%>											<span id="cusStateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										
										</div>
										
										</div>
                                   
                                    </div>
                                    </div>
                                    <br>
                                    <div style="background-color: #e6e6e6;padding-left: 5px;padding-right: 15px;">
                                    <div class="row">
                                      <div class="form-group col-lg-3">
                                    	<div style="background: gainsboro;padding: 11px;">
                                            <label style="font-size: 16px;font-weight:bold;"><spring:message code="billingAddress.label" /></label>
                                        </div>
                                      </div>
                                     
                                      <div class="form-group col-lg-3" style="">
                                            <label><spring:message code="shipment.contact.number.label" /> <span style="color:red; font-size:2">*</span></label>         
                                               <div class="row">
				                                  <div class="col-lg-4 col-md-1 col-sm-1 col-xs-1">
				                                  	<select class="form-control" style="padding: 4px 6px;" id="defaultCountry2" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
				                                  	<option text="India" ${'India' == orderDetails.country ? 'selected' : ''}>IN</option>
				                                  	<option text="USA" ${'USA' == orderDetails.country ? 'selected' : ''}>US</option>
				                                  	<option text="United Kingdom" ${'United Kingdom' == orderDetails.country ? 'selected' : ''}>GB</option>
				                                  	<option text="Australia" ${'Australia' == orderDetails.country ? 'selected' : ''}>AU</option>
				                                  	</select>
				                                  </div>
				                                  <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
				                                  	<input type="text" class="form-control" placeholder="<spring:message code="enter.customer_contact_num.label" />"  id="billingMobileNo" value="${orderDetails.mobile_num}" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
				                                  </div>
				                                  <input type="hidden" class="form-control"  id="billphoneNumberCode"  value="${orderDetails.country}"/>
                                                <%-- <input type="hidden" class="form-control" name="billingMobileNo" id="billingMobileNo"  value="${orderDetails.billingMobileNo}"/> --%>
				                              <input type="hidden" id="output4" />
				                               </div>
                                     </div>
                                       <div class="form-group col-lg-1" style="">
                                             <label>Door No. <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control"  id="billDno" name="billing_address_doorNo" value="${orderDetails.billing_address_doorNo}" placeholder="<spring:message code="order.enter.door.no" />" />
                                            <span id="billDnoError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> 
                                            
                                     </div>
                                     
                                      <div class=" col-lg-2" style="">
                                     	  <label>Building Name<span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="billappartmentname"  name="billingApartmentName" value="${orderDetails.billingApartmentName}" placeholder="<spring:message code="order.enter.door.no" />" />
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
                                      <div class="form-group col-lg-3" style="margin-top: -17px;">
                                           <label><spring:message code="shipment.name.label" /> <span style="color:red; font-size:2">*</span></label>
											<input type="text" class="form-control" id="BillName"  value="${orderDetails.shipmentName}"/>
											<span id="BillNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                           
                                       </div>
                                     
                                     <div class="form-group col-lg-3" style="margin-top: -17px;">   
                                       <label><spring:message code="billing_location.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control"  id="billLoc" name="billing_address_location" value="${orderDetails.billing_address_location}" placeholder="<spring:message code="order.enter.landmark" />"  />
                                            <span id="billLocError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>     

                                      </div>
                             
                                      <div class="form-group col-lg-3" style="margin-top: -17px;">
                                      <div class="form-group col-lg-6" style="padding-left: 0px;padding-right: 5px;">
                                      <label><spring:message code="landmark.label" /></label>
                                            <input type="text" class="form-control" id="billLandmark"  value="" placeholder="<spring:message code="landmark.label" />"/>
                                            <span id="BillLandmarkError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                             </div>
                                             
                                             <div class="form-group col-lg-6" style="padding-left: 0px;padding-right: 5px;">
										  <label><spring:message code="billing_city.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="billCity" name="billing_address_city" value="${orderDetails.billing_address_city}" placeholder="<spring:message code="order.enter.city" />"/>
                                            <span id="billCityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div>
                                             
                                             </div>
                                             
<%--                                              <input type="hidden" class="form-control" id="billpinNum" name="billing_pinNo"  value="${orderDetails.billing_pinNo}" placeholder="<spring:message code="enter.pin.label" />"/>
 --%>                                      
                                      
                                      <div class="form-group col-lg-3" style="margin-top: -17px;">
										
										<div class="form-group col-lg-6" style="padding-left: 0px;padding-right: 5px;">
										   <label><spring:message code="pin.label" /></label>
                                            <input type="text" class="form-control" id="billpinNum" name="billing_pinNo" value="${orderDetails.billing_pinNo}" placeholder="<spring:message code="order.enter.pin" />"/>
                                            
                                    	
										</div>
										
										<div class="form-group col-lg-6" style="padding-right: 0px;padding-left: 5px;">
										 <label><spring:message code="shipment.state.label" /><span style="color:red; font-size:2">*</span></label>
										 
										 
										 <select class="form-control"  id="billState" style="width: 100%;">
										 <option value="" >Select state</option>
										 
	                                        <c:forEach var="states" items="${states.stateMasters}">
	                             <option value="${states.stateName}" ${states.stateName == orderDetails.shipmentState ? 'selected' : ''}>${states.stateName}</option>
	                            			 
	                                        
											</c:forEach>
	                                        
	                                            </select>
										 
										 
										 
<%-- 											<input type="text" class="form-control" id="billState"  value="${orderDetails.shipmentState}" placeholder="<spring:message code="order.enter.state" />" />
 --%>											<span id="billStateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										
										</div>
										
										</div>
                                     
                                    </div>
                                    </div>
                                    </div>
                                    </div>
                                    <br>
                                     
                                      
                                     <input type="hidden" name="cartId" value="${orderDetails.cartId}">
                                       <input type="hidden" name="delivery_slot" value="${orderDetails.delivery_slot}">
                                       <input type="hidden" name="total_qty" value="${orderDetails.total_qty}" id="totalQty">
                                       <input type="hidden" name="no_of_items" value="${orderDetails.no_of_items}">
                                     <input type="hidden" id="addressList" name="address">
                                       <input type="hidden" id="discountItemsList" name="discountItems">
                                       <input type="hidden" id="taxationItemsList" name="taxationItems">
                                         <input type="hidden" id="transactionItemsList" name="transactionItems">
                                         
                                     <input type="hidden" value="${orderDetails.orderItemTaxesList}">
                                     
                                   <%--   <c:forEach var ="taxItems" items="${orderDetails.orderItemTaxesList}" varStatus="theCount">
                            			<input type="hidden" id="snoTax${theCount.count}" value="${taxItems.sno}">
                            			<input type="hidden" id="orderIdTax${theCount.count}" value="${taxItems.orderId}">
                            			<input type="hidden" id="skuIdTax${theCount.count}" value="${taxItems.sku_id}">
                            			<input type="hidden" id="pluCodeTax${theCount.count}" value="${taxItems.plu_code}">
                            			<input type="hidden" id="taxTaxcode${theCount.count}" value="${taxItems.tax_code}">
                            			<input type="hidden" id="taxTaxType${theCount.count}" value="${taxItems.tax_type}">
                            			<input type="hidden" id="taxTaxCategory${theCount.count}" value="${taxItems.tax_category}">
                            			<input type="hidden" id="taxTax${theCount.count}" value="${taxItems.tax_rate}">
                            			<input type="hidden" id="taxTaxAmt${theCount.count}" value="${taxItems.tax_value}">
                            			</c:forEach>
                                     --%>    
                                    
                                    <table  id="dicountlist" style="display:none">
                                    <tbody>
                                     <c:forEach var ="discItems" items="${orderDetails.orderDiscountsList}" varStatus="theCount">
                                    <tr id="discdynamicdiv${theCount.count}">
                                    
                                    <td id="">
                                    	<input type="hidden" id="serialNumDisc${theCount.count}" value="${discItems.serialNum}">
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
                                    
                                    
                                     <table  id="taxationlist" style="display:none">
                                    <tbody>
                                     <c:forEach var ="taxItems" items="${orderDetails.orderItemTaxesList}" varStatus="theCount">
                                    <tr id="taxdynamicdiv${theCount.count}">
                                    
                                    <td id="">
                                    	<input type="hidden" id="snoTax${theCount.count}" value="${taxItems.sno}">
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
                                    
                                    
                                    
                                    
                                    
                                    
<%--                                         <input type="hidden" id="sizeOfTaxes" value="${orderItemTaxesSize}"> --%>
                                     
                                        <c:forEach var="tranDetails" items="${orderDetails.orderTransactions}" varStatus="theCount">
                                        <input type="hidden" id="transactionID" value="${tranDetails.transactionId}">
                                         <input type="hidden" id="orderID" value="${tranDetails.orderId}">
                                          <input type="hidden" id="modeOfPayment" value="${tranDetails.modeOfPayment}">
                                          <input type="hidden" id="cardType" value="${tranDetails.cardType}">
                                          <input type="hidden" id="couponNumber" value="${tranDetails.couponNumber}">
                                          <input type="hidden" id="paidAmount" value="${tranDetails.paidAmount}">
                                          <input type="hidden" id="bankName" value="${tranDetails.bankName}">
                                          <input type="hidden" id="approvalCode" value="${tranDetails.approvalCode}">
                                          <c:choose>
                                          <c:when test="${tranDetails.receivedAmount !=''}">
                                             <input type="hidden" id="receivedAmount" value="${tranDetails.receivedAmount}">
                                          </c:when>
                                          <c:otherwise>
                                             <input type="hidden" id="receivedAmount" value="0.0">
                                        </c:otherwise>
                                          </c:choose>
                                       
                                          <input type="hidden" id="changeReturn" value="${tranDetails.changeReturn}">
                                          <input type="hidden" id="cardInfo" value="${tranDetails.cardInfo}">
                                          <input type="hidden" id="paymentStatus" value="${tranDetails.paymentStatus}">
                                           <input type="hidden" id="dateTime" value="${tranDetails.dateTime}">
                                        </c:forEach>
                                     
                                     
                                 <div class="forshipmentitemsDisabled">    
                                     
                                      
                                       <input type="hidden" id = "latitude" name="latitude"  value="${orderDetails.latitude}">
                                            <input type="hidden" id = "longitude" name="longitude" value="${orderDetails.longitude}">
                                       <input type="hidden" id="returnStatus" value="">
                                     
                                       <%-- 	<div class=" col-lg-3" style="">
                                            <label><spring:message code="shipment.country.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="shipmentCountry" name="shipmentCountry" value="${orderDetails.shipmentCountry}" placeholder="<spring:message code="order.enter.country" />" />
                                            <span id="shipmentCountryError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                           <!--  <input type="hidden" id = "cartId" name="cartId"> -->
                                           
                                            <input type="hidden" id = "cartId" name="cartId" value="${orderDetails.cartId}">
                                            
                                    	</div> --%>
                                   
                                  
                                     <%-- <div class="row">
                                     <div class="form-group col-lg-3">
                                    	<div style="background: gainsboro;">
                                            <label style="font-size: 16px;font-weight:bold;"><spring:message code="order.other.details.label" /></label>
                                        </div>
                                     </div>
                                     </div> --%>
                                     <%-- <div class="row" style="">
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
                                     	</div> 
                                    	
                                    	 
                                    	<div class="form-group col-lg-3">
                                            <label><spring:message code="sales_executive.name.label" /></label>
                                           <div class="row">
                                              <div class="form-group col-lg-5 col-md-5 col-sm-5 col-xs-5">
                                            <input type="text" class="form-control" id="salesexecutiveid" name="sales_executive_id" disabled value="${orderDetails.sales_executive_id}" placeholder="<spring:message code="enter.id.label" />" />
                                            </div>
                                             <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7" style="padding-left: 0px">
                                            <input type="text" class="form-control"  name="sales_executive_name" value="${orderDetails.sales_executive_name}" placeholder="<spring:message code="order.enter.sales.executive.name" />" />
                                    	  <select class="form-control" id="salesexecutivename" onchange="getemployeeIdByName();"  data-search="true">
                           		 <option value=""><spring:message code="ALL.label"/></option>
<!--                            		<option>  <input type="text" placeholder="Search.." id="myInput" onkeyup="filterFunction()"></option> -->
	                           
	                            <c:forEach var="employee" items="${employeeList}">
								
							        <option value="${employee.employeeCode}" ${employee.firstName == orderDetails.sales_executive_name ? 'selected' : ''}>${employee.firstName}</option>
							       
									</c:forEach>
	                        </select>
                                    	</div>
                                    </div>
                                    </div>
                                    	   <input type="hidden" name="salesmanName" id="salesmanName">
                                    	<div class="form-group col-lg-2">
                                            <label><spring:message code="referredBy.label" /></label>
                                            <input type="text" class="form-control"  id="referredBy"  name="referredBy" value="${orderDetails.referredBy}"  />
                                    	</div>
                                    	
                                    	 </div> --%>
                                    	
                                    	
                                    <%-- <div class="row" style=" margin-top: 5px;">
                                    	 <div class="form-group col-lg-2" style="width: 12%;">
                                     <label><spring:message code="order_delivery_type.label" /></label>
                                       <select class="form-control" id="orderDeliveryType" onchange="changeShipmentCharges();">
                                           <option value="Pick Up" ${'Pick Up' == orderDetails.orderDeliveryType ? 'selected' : ''}>Pick Up</option>
                                           <option value="Door Delivery" ${'Door Delivery' == orderDetails.orderDeliveryType ? 'selected' : ''}>Door Delivery</option>
                                       </select>
                                       		<input type="hidden" name="orderDeliveryType" id="deliveryType" value="${orderDetails.orderDeliveryType}"/>
                                           	<input type="hidden" name="orderStatus" id="orderStatus" value="${orderDetails.orderStatus}"/>
                                            <input type="hidden" name="orderStatus" id="orderStatus" value="${orderDetails.orderStatus}"/>
                                             <input type="hidden" name="selectedStatus" id="selectedStatus"  value="${status}"/>
                                             <input type="hidden" name="viewOrEdit" value="edit"/>
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
                                    	
                                    	<div class=" col-lg-2">
                                            <label><spring:message code="speacialDiscount.label" /></label>
                                            <input type="text" class="form-control"  id="special_Discount" name="specialDiscount" value="${orderDetails.specialDiscount}"  />
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
                                  <%--  <div class="row">
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
                                     </div>   
                                   </div>  --%>
                                     <div id="searchItemsErrorIDdiscounts" style="text-align:center;color:red;font-weight:bold;"></div>  
                                   <div class="row">
                                         <div class="col-lg-11" style="text-align:center;  margin-bottom: -2px;width: 94%;">
                                         	<input type="hidden" id="desc"/>
                         
                                         	<%-- <label><spring:message code="search.items.here.label" /></label> --%>
                                         	<input type="text"  class="form-control searchItems searchBar" id="searchItems"  placeholder="<spring:message code="search.items.here.label" />"  style=""  />
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl receipt" style=""></ul>
								   				</div>
											</div>
  										 </div>
  										 <div class="col-lg-1" style="width: 6%;">
											<button type="button" id="menuItemsBar" onclick="getOrdersMenuDetails('','','');"><b>&#9776;</b></button>
                                         </div>
                                         <div class="col-lg-3">
                                         <div id="triggerEvent"></div>
                                         </div>
                                        </div>
                                    <div class="table-responsive" style="overflow: auto;padding: 0px 0px;">
                                        <table id="productsList" class="table table-bordered table-hover">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	 <th><div style="width:45px;"><spring:message code="sl.no.label" /></div></th>
                                            	<th><spring:message code="item_id.label"/></th>
                                                <th><spring:message code="item_description.label"/></th>
<%--                                                 <th><spring:message code="make.label"/></th> --%>
                                                <th><spring:message code="model.label"/></th>
                                                <th><spring:message code="colour.label"/></th>
                                                <th><spring:message code="size.label"/></th>
                                                    <th>Discount ID</th>
                                                 <th><spring:message code="mrp.label"/></th>
                                                <th><spring:message code="sale.price.val.label"/></th>
                                                 <th>Discounted Sale Price</th>
                                                  <th><spring:message code="discount.label"/></th>
                                             <%--    <th><spring:message code="item_price.label"/></th> --%>
                                                <th><spring:message code="order_quantity.label"/></th>
                                                 <th><spring:message code="order_Confirmquantity.label"/></th>
                                                <th><spring:message code="item_cost.label"/></th>
                                                <th><spring:message code="taxrate.label"/></th>
                                                 <th><spring:message code="tax.label"/></th>
                                                <th><spring:message code="action.label"/></th>
                                           </tr>
                                          </thead>
                            			<tbody style="text-align: center;">
                            			<c:forEach var="item" items="${orderDetails.orderedItemsList}" varStatus="theCount">
                                        	 <tr id="dynamicdiv${theCount.count}" style='margin-top:5px;'>
                                        	 	<td class="slno">${theCount.count}</td>
                                            	<td id="itemId${theCount.count}">${item.skuId}</td>
                                            	<input type="hidden" id="orderItemId${theCount.count}" value="${item.order_item_id}" />
                                            	<input type="hidden" id="skuId${theCount.count}" value="${item.skuId}" />
                                            	<input type="hidden" id="pluCode${theCount.count}" value="${item.pluCode}"/>
                                            	<input type="hidden" id="alltaxCode${theCount.count}" value="${item.taxCode}"/>
                                            <%-- 	<input type='hidden' id="cgsttax${theCount.count}" value="${item.cgstRate}"/>
                                            	<input type='hidden' id="sgsttax${theCount.count}" value="${item.sgstRate}"/>
                                            	<input type='hidden' id="igsttax${theCount.count}" value="${item.isgstRate}"/>
                                            	<input type='hidden' id="cgsgstAmt${theCount.count}" value="${item.cgstValue}"/>
                                            	 <input type='hidden' id="sgsgstAmt${theCount.count}" value="${item.sgstValue}"/>
                                                 <input type='hidden' id="igstAmt${theCount.count}" value="${item.isgstValue}"/> --%>
<%--                                             	 <input type='hidden' id="discount${theCount.count}" value="${item.discount}"/> --%>
                                            	 <input type='hidden' id="manualDiscount${theCount.count}" value="${item.manualDiscount}"/>
                                            <%-- 	 <input type='hidden' id="othertaxRate${theCount.count}" value="${item.otherTaxRate}"/>
                                            	 <input type='hidden' id="otherTaxValue${theCount.count}" value="${item.otherTaxValue}"/> --%>
                                            	 
                                            	<input type='hidden' id="taxExclusive${theCount.count}" value="${item.itemTaxExclusive}"/>
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
	 		                                   <c:choose>
	 		                                   <c:when test="${item.item_price != ''}">
	 		                                     <input type='hidden' id="priceVale${theCount.count}" value="${item.item_price}"/>
	 		                                   </c:when>
	 		                                   <c:otherwise>
	 		                                     <input type='hidden' id="priceVale${theCount.count}" value="0.0"/>
	 		                                   </c:otherwise>
	 		                                   </c:choose>
<%-- 	 		                                     <input type='hidden' id="priceVale${theCount.count}" value="${item.item_price}"/> --%>
	 		                                    <input type='hidden' id="ean${theCount.count}" value="${item.ean}"/>
	 		                                    <input type='hidden' id="styleRange${theCount.count}" value="${item.style}"/>
	 		                                     <input type='hidden' id="brand${theCount.count}" value="${item.brand}"/>
	 		                                      <input type='hidden' id="uom${theCount.count}" value="${item.uOM}"/>
	 		                                    <input type='hidden' id="classProduct${theCount.count}" value="${item.productClass}"/>
	 		                                      <input type='hidden' id="subclassProduct${theCount.count}" value="${item.subClass}"/>
	 		          <td id="itemName${theCount.count}" ><div id="overflowtext"> <a href="#" data-toggle="tooltip"  title="${item.item_name}">${item.item_name}</a></div></td>    
	 		                                      
<%--                                                 <td id="itemName${theCount.count}">${item.item_name}</td>
 --%><%--                                                 <td id="make${theCount.count}">${item.make}</td> --%>
                                                <td id="model${theCount.count}">${item.model}</td>
                                                <td id="colour${theCount.count}">${item.colour}</td>
                                                <td id="size${theCount.count}">${item.measureRange}${item.uOM}</td>
                                                
                                                
                                                
                                                 <c:choose>
                  		
     <c:when test= "${item.discount>0}">
      <td id="discountIds${theCount.count}">
      <c:forTokens items="${item.offerId}" delims="," var="mySplit">
   	<a style="color: #0e1edc;cursor: pointer;text-decoration: underline;" onclick="getdealsandoffernames('${mySplit}','${mySplit}')"><blink><c:out value="${mySplit}"/></blink></a>
  	</c:forTokens>
      </td>
     </c:when> 
                  	
                  		
                  		
                  		<c:otherwise> 
                  		<td>No Discount</td>
                  	 	
                  	 </c:otherwise>
                  		</c:choose> 
                  		
                                                
                                            
                                                <td id="price${theCount.count}">${item.mrp}</td>
                                               
                                               
                                           <%--     <c:forEach var ="taxItems" items="${orderDetails.orderItemTaxesList}" varStatus="theCounttax">
                            			<input type="hidden" id="snoTax${theCounttax.count}" value="${taxItems.sno}">
                            			<input type="hidden" id="orderIdTax${theCounttax.count}" value="${taxItems.orderId}">
                            			<input type="hidden" id="skuIdTax${theCounttax.count}" value="${taxItems.sku_id}">
                            			<input type="hidden" id="pluCodeTax${theCounttax.count}" value="${taxItems.plu_code}">
                            			<input type="hidden" id="taxTaxcode${theCounttax.count}" value="${taxItems.tax_code}">
                            			<input type="hidden" id="taxTaxType${theCounttax.count}" value="${taxItems.tax_type}">
                            			<input type="hidden" id="taxTaxCategory${theCount.count}" value="${taxItems.tax_category}">
                            			<input type="hidden" id="taxTax${theCount.count}" value="${taxItems.tax_rate}">
                            			<input type="hidden" id="taxTaxAmt${theCount.count}" value="${taxItems.tax_value}">
                            			</c:forEach>
                                            --%>    
                                              <%--  <c:if test="${item.salePrice!=''}">
                                                 <td id="itemPrice${theCount.count}">${item.salePrice}</td>
                                               </c:if>
                                               
                                                <c:if test="${item.salePrice!=''}">
                                                 <td id="itemPrice${theCount.count}">${item.salePrice}</td>
                                               </c:if> --%>
                                               
                                               <c:choose>
                                                <c:when test="${item.salePrice!=''}">
                                                <td id="itemPrice${theCount.count}">${item.salePrice}</td>
                                               </c:when>
                                                <c:when test="${item.item_price!=''}">
                                                <td id="itemPrice${theCount.count}">${item.item_price}</td>
                                               </c:when>
                                                 <c:when test="${item.mrp!=''}">
                                                <td id="itemPrice${theCount.count}">${item.mrp}</td>
                                               </c:when>
                                               <%-- --%>
                                              
                                               <c:otherwise>
                                                <td id="itemPrice${theCount.count}">${item.item_price}</td>
                                               </c:otherwise>
                                               </c:choose>
                                                 <td  id="itemPricemod${theCount.count}">${item.item_price}</td>
                                                <td  id="itemDiscountPrice${theCount.count}">${item.discount}</td>
<%--                                                  <td id="itemPrice${theCount.count}">${item.salePrice}</td> --%>
                         
<%--                                                 <td id="itemPrice${theCount.count}">${item.salePrice}</td> --%>
                                                <td id="orderedQuantity${theCount.count}"  class='Pack' onBlur='changePack(this);' onkeypress='return (this.innerText.length < 10)'>${item.ordered_quantity}</td>
                                               <td id="confirmQuantity${theCount.count}"  class='Pack' onBlur='changePack(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>${item.confirmQuantity}</td>                                              
                                              	<td id="totalCost${theCount.count}" class='cost'>${item.total_cost}</td>
                                              	 <td id="tax${theCount.count}">${item.taxRate}</td>
                                              	  <td id="taxAmt${theCount.count}">${item.taxValue}</td>
<%--                                                 <td id="tax${theCount.count}">${item.taxRate}</td> --%>
                                               
<%--                                                 <td id="taxAmt${theCount.count}">${item.taxxValue}</td> --%>
                                                <td id="Del${theCount.count}"><img id="Img${theCount.count}"alt=""  style='width:15%;cursor:pointer;'  onclick='deleteItem(this);' src="${pageContext.request.contextPath}/images/itemdelete.png"/></td>
                                            </tr>
                                           </c:forEach>
                            			</tbody>
                                      </table>
                                      <br/>
                                    </div>
                                    </div>
                                    
                                   <br>
                                   
                    <%--                
                     <div class="col-lg-12 nopadding">
					<div class="col-lg-6"></div>
					<div class="col-lg-3 nopadding">
					<div class="form-group col-lg-7 " style="text-align: right;"><label><spring:message code="sub.total.label" /> </label></div>
					<div class="form-group col-lg-5 nopadding">
						<input type="text" class="form-control" name="subtotal" id="subtotal" value="${orderDetails.subtotal}"  readonly="readonly" />
					</div>
					
					
					</div>
					<div class="col-lg-3 nopadding">
					<div class="form-group col-lg-7 " style="text-align: right;"><label><spring:message code="total.tax.label" /></label></div>
						<div class="form-group col-lg-5 nopadding">
<!-- 						<input type="text" class="form-control" readonly id="cgstAmt" name=""  value=""  oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/> -->
					  <input  type="text" class="form-control"  disabled="disabled" name="orderTax" id="totalTax" value="${orderDetails.orderTax}">
						<span id="totalTaxError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
					
					</div>
					
					
					<div class="form-group col-lg-8 " style="text-align: right;white-space: nowrap;"><label><spring:message code="other.discounts.label" /></label></div>
					
						<span id="shipCostError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
				</div>
                                    --%>
                                   
                      
                  <%--       <div class="col-lg-12 nopadding">
						<div class="col-lg-6"></div>
					<div class="col-lg-3 nopadding">
						<div class="form-group col-lg-7 " style="text-align: right;white-space: nowrap;"><label>Other Discounts</label></div>
						
				
						<div class="form-group col-lg-5 nopadding">
						<c:if test="${storeDetailsList[0].manualDiscounts == true}">
						<input type="text" class="form-control"  name="otherDiscounts" style="margin-left: 3px;" id="otherDiscount" value="${orderDetails.otherDiscounts}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
						</c:if>
						
						<c:if test="${storeDetailsList[0].manualDiscounts == false}">
						<input type="text" class="form-control" readonly="readonly" name="otherDiscounts" style="margin-left: 3px;" id="otherDiscount" value="${orderDetails.otherDiscounts}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
						</c:if>
						<input type="hidden" class="form-control" id="editPrice"  value="${storeDetailsList[0].editPrice}" />
					 	</div>
						</div>
						<div class="col-lg-3 nopadding">
						<div class="form-group col-lg-7 " style="text-align: right;"><label><spring:message code="shipping.cost.label" /> </label></div>
						<div class="form-group col-lg-5 nopadding">
						<input type="text" class="form-control" readonly="readonly" name="shipmentCharges" id="shipmentCharges" value="${orderDetails.shipmentCharges}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
						</div>
						</div>
						<span id="shipCostError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
					
					
				 
					
					
					<div class="row">
						<div class="col-lg-8"></div>
					</div>
					</div>
					 --%>
					
					
					
					
					
					
					
					
					
				
				<div class="row" style="padding-right: 15px">
		        <div class="col-lg-5" >
		        </div>
		        <div class="col-lg-7" >
		        <label>Google Map Reference:</label>&nbsp&nbsp ${orderDetails.customer_map_link}
		        </div>
		        </div>
		        	
					
				<div class="row" style="padding-right: 15px">
		        <div class="col-lg-3" >
		            <label>Comments</label>
		            <textarea  class="form-control" style="resize:none;height: 105px;" id="remarks"  name="remarks" rows="5" placeholder="Enter your comments">${orderDetails.remarks}</textarea>
		        </div>   
		     
                      <div class="col-lg-9"  style="margin-top: 19px;border:1px solid #ccc">
                      
                      
                      	
					<div class="col-lg-3 nopadding" style="margin-top: 4px;">
						<div class=" col-lg-7 " style="text-align: right;white-space: nowrap;"><label>Other Discounts</label></div>
						
				
						<div class=" col-lg-5 nopadding">
						<c:if test="${storeDetailsList[0].manualDiscounts == true}">
						<input type="text" class="form-control"  name="otherDiscounts" style="margin-left: 3px;" id="otherDiscount" value="${orderDetails.otherDiscounts}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
						<input type="hidden" class="form-control"  id="otherDiscountbackup"  value="${orderDetails.otherDiscounts}" style="margin-top:2px"/>
						</c:if>
						
						<c:if test="${storeDetailsList[0].manualDiscounts == false}">
						<input type="text" class="form-control" readonly="readonly" name="otherDiscounts" style="margin-left: 3px;" id="otherDiscount" value="${orderDetails.otherDiscounts}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
						<input type="hidden" class="form-control"  id="otherDiscountbackup"  value="${orderDetails.otherDiscounts}" style="margin-top:2px"/>
						</c:if>
						<input type="hidden" class="form-control" id="editPrice"  value="${storeDetailsList[0].editPrice}" />
					 	</div>
						</div>
						
						
						<div class="col-lg-3 nopadding" style="margin-top: 4px;">
					<div class=" col-lg-7 " style="text-align: right;"><label><spring:message code="sub.total.label" /> </label></div>
					<div class=" col-lg-5 nopadding">
						<input type="text" class="form-control" name="subtotal" id="subtotal" value="${orderDetails.subtotal}"  readonly="readonly" />
					</div>
					
					
					</div>
					 <div class="col-lg-3 nopadding"  style="margin-top: 4px;">
					<div class=" col-lg-7 " style="text-align: right;"><label>Total Qty</label></div>
					<div class=" col-lg-5 nopadding">
						<input type="text" class="form-control" name="" id="totalQnty" value="0"  readonly="readonly" />
					</div></div>
                      
                      
                      	<div class="col-lg-3 nopadding" style="margin-top: 4px;">
					<div class=" col-lg-7 " style="text-align: right;"><label>Total Mrp Value</label></div>
						<div class=" col-lg-5 nopadding">
<!-- 						<input type="text" class="form-control" readonly id="cgstAmt" name=""  value=""  oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/> -->
					  		<input type="text" class="form-control"  id="orderTotalCost" name="orderTotalCost" readonly value="${orderDetails.orderTotalCost}" />
					
						</div>
					
					</div>
                      
                      
                         <div class="col-lg-3 nopadding"  style="margin-top: 4px;">
				
						<div class=" col-lg-7 " style="text-align: center;padding: 0px;"><label>Coupon Discount</label></div>
						<div class=" col-lg-5 nopadding">
						<input type="text" class="form-control"  id="couponDiscounts" name="couponDiscounts"  value="${orderDetails.couponDiscounts}" style="margin-top:2px"/>
						<input type="hidden" class="form-control"  id="couponDiscountsbackup"  value="${orderDetails.couponDiscounts}" style="margin-top:2px"/>
					</div></div>
                      
                      
                      
                      <div class="col-lg-3 nopadding" style="margin-top: 4px;">
					<div class=" col-lg-7 " style="text-align: right;"><label><spring:message code="total.tax.label" /></label></div>
						<div class=" col-lg-5 nopadding">
<!-- 						<input type="text" class="form-control" readonly id="cgstAmt" name=""  value=""  oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/> -->
					  <input  type="text" class="form-control"  readonly name="orderTax" id="totalTax" value="${orderDetails.orderTax}">
						<span id="totalTaxError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
					
					</div>
					   <div class="col-lg-3 nopadding"  style="margin-top: 4px;">
				
						<div class=" col-lg-7 " style="text-align: right;"><label>Txn Mode</label></div>
						<div class=" col-lg-5 nopadding">
						<input type="text" class="form-control"  id="paymentMode" name="" readonly value="${orderDetails.paymentMode}" style="margin-top:2px"/>
					</div></div>
					
                       
                      <div class="col-lg-3 nopadding" style="margin-top: 4px;">
						
						<div class=" col-lg-7 " style="text-align: right;"><label><spring:message code="amountpaid.label" /></label></div>
						<div class=" col-lg-5 nopadding">
						
						<input type="text"  style="margin-top:2px" class="form-control" id="paidAmount" name="paidAmount"  value="${orderDetails.paidAmount}"/>
					</div>
					</div>
					
                     	<div class="col-lg-3 nopadding" style="margin-bottom: 4px;margin-top: 4px;">
						<div class=" col-lg-7 " style="text-align: right;"><label><spring:message code="shipping.cost.label" /> </label></div>
						<div class=" col-lg-5 nopadding">
						<input type="text" class="form-control" readonly="readonly" name="shipmentCharges" id="shipmentCharges" value="${orderDetails.shipmentCharges}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
						</div>
						</div>
						<span id="shipCostError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
					 
                   	<div class="col-lg-3 nopadding"  style="margin-bottom: 4px;margin-top: 4px;">
				
						<div class=" col-lg-7 " style="text-align: right;"><label>Net Amount</label></div>
						<div class=" col-lg-5 nopadding">
						<input type="text" class="form-control"  id="totalOrderAmount" name="totalOrderAmount" readonly value="${orderDetails.totalOrderAmount}" />
					</div></div>
					
					
					<div class="col-lg-3 nopadding"  style="margin-bottom: 4px;margin-top: 4px;">
				
						<div class=" col-lg-7 " style="text-align: right;"><label>Txn Ref</label></div>
						<div class=" col-lg-5 nopadding">
						<c:if test="${empty orderDetails.paymentRef}">
						<input type="text" class="form-control"  id="paymentRef" name="paymentRef"  value="${orderDetails.paymentRef}" style="margin-top:2px"/>
				     	</c:if>
				     	<c:if test="${not empty orderDetails.paymentRef}">
						<input type="text" class="form-control"  id="paymentRef" name="paymentRef" readonly value="${orderDetails.paymentRef}" style="margin-top:2px"/>
				     	</c:if>
					</div></div>
					
						<div class="col-lg-3 nopadding"  style="margin-bottom: 4px;margin-top: 4px;">
				
						<div class=" col-lg-7 " style="text-align: right;"><label>Amount Due</label></div>
						<div class=" col-lg-5 nopadding">
						<input type="text" class="form-control"  id="dueAmount" name="dueAmount" readonly value="0" style="margin-top:2px"/>
					</div></div>
					
					
                      
                      
            <%--           <div class="col-lg-12 nopadding" >
						
						<div class=" col-lg-2" style="    font-size: 22px;    background-color: #f4f4f4;padding: 1px 0px; border-top: 1px solid #ccc;">&nbsp</div>
					    <div class=" col-lg-10 nopadding"style="    background-color: #f4f4f4;padding: 1px 0px; border-top: 1px solid #ccc;">
						<div class=" col-lg-6 nopadding" style="font-size: 22px;"><label><spring:message code="cost.label" /> </label></div>
						<div class=" col-lg-2"></div>
						<div class=" col-lg-4" style="padding-right: 0px;padding-left: 7px;">
						<input type="text" class="form-control"  id="orderTotalCost" name="orderTotalCost" readonly value="${orderDetails.totalOrderAmount}" style="margin-top:2px"/><!-- ${orderDetails.orderTotalCost} -->
					</div></div></div>
					
                                   
                     
                      <div class="col-lg-12 nopadding" >
						
						<div class=" col-lg-2" style="    font-size: 22px;    background-color: #f4f4f4;padding: 1px 0px; border-top: 1px solid #ccc;">&nbsp</div>
						<div class=" col-lg-10 nopadding"style="    background-color: #f4f4f4;padding: 1px 0px; border-top: 1px solid #ccc;">
						<div class=" col-lg-6 nopadding" style="font-size: 22px;white-space: nowrap;"><label><spring:message code="amountpaid.label" /> </label></div>
						<div class=" col-lg-2"></div>
						<div class=" col-lg-4" style="padding-right: 0px;padding-left: 7px;">
						<input type="text"  style="margin-top:2px" class="form-control" id="paidAmount" name="paidAmount"  value="${orderDetails.paidAmount}"/>
					</div>
					</div>
					</div>
                                   
                        <div class="col-lg-12 nopadding" >
					
						<div class=" col-lg-2" style="    font-size: 22px;    background-color: #f4f4f4;padding: 1px 0px; border-top: 1px solid #ccc;">&nbsp</div>
						<div class=" col-lg-10 nopadding"style="    background-color: #f4f4f4;padding: 1px 0px; border-top: 1px solid #ccc;">
						<div class=" col-lg-6 nopadding" style="font-size: 22px;white-space: nowrap;"><label><spring:message code="amountdue.label" /> </label></div>
						<div class=" col-lg-2"></div>
						<div class=" col-lg-4" style="padding-right: 0px;padding-left: 7px;">
						<input type="text"   style="margin-top:1px" class="form-control" id="dueAmount" name="dueAmount"  value="${orderDetails.dueAmount}"/>
					</div></div>
					</div> --%>
                              </div>
                              </div>
                      
            
                            
                  <%--   <input type="hidden" name="orderTax" id="totalTax" value="${orderDetails.orderTax}">    --%>            
                                
                     <div class="row">
						<div class="col-lg-8"></div>
					</div>
                                  
                                   
                         <input type="hidden" id="subtotal" value="${orderDetails.subtotal}">
							<input type="hidden" name="items" id="itemDetails">
							  <input type="hidden" value="${searchName}" id="searchName"/>
                           <input type="hidden" value="${orderChannelId}" id="orderChannelId"/>

							
						<br/>
       <!-- COMPOSE MESSAGE MODAL -->
         <div class="modal fade popup-display" id="items-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" style="text-align: center;"><spring:message code="select.products.label" /></h4>
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
			
			 <c:choose>
                                <c:when test="${orderDetails.orderStatus == 'Draft' || orderDetails.orderStatus == 'draft'}">
                                 <c:forEach var="activity" items="${orderDetails.nextWorkFlowStates}">
									 	<input type="button" id="edit"   style="margin-left:1%;" class="btnCls" onclick="updateOrder('${activity}','edit','outlet');" value="${activity}" />
									 </c:forEach>
                                  	<%-- <input type="button" id="edit"  style="position: relative;" class="btnCls" onclick="updateOrder('Ordered','edit','outlet');" value="<spring:message code="submit.label" />" /> --%>
								 </c:when>
								 <c:otherwise>
								 	<input type="button" id="edit"  style="display: none;" style="position: relative;" class="btnCls" onclick="updateOrder('Ordered','edit','outlet');" value="<spring:message code="submit.label" />" />
								 </c:otherwise>
								 </c:choose>
<!-- 			<input type="hidden" id="isgstAmt" name="" value="0.0"> -->
			<%-- <input type="button" id="edit"  class="btnCls" onclick="updateOrder('Ordered','edit','outlet');" value="<spring:message code="submit.label" />" /> --%>
			<c:if test="${sessionScope.role == 'super admin'}">
								<c:if test="${orderDetails.orderStatus != 'Draft' && orderDetails.orderStatus != 'draft'}">
									 <c:forEach var="activity" items="${orderDetails.nextActivities}">
									 	<input type="button" style="margin-left:1%;" class="btnCls" onclick="updateOrder('${activity}','edit','outlet');" value="${activity}" />
									 </c:forEach>
								</c:if>
						  </c:if>
						  <c:if test="${sessionScope.role != 'super admin'}">
							<c:if test="${flowUnder == 'outlet'}">
					           <c:if test="${orderDetails.orderStatus != 'Draft' && orderDetails.orderStatus != 'draft'}">
									 <c:forEach var="activity" items="${orderDetails.nextActivities}" >
									 	<c:forEach var="accessControl" items="${sessionScope.outletCustomerOrderActivity}">
									 		<c:if test="${activity == accessControl.appDocumentActivity}">
											
											 	<input type="button" style="margin-left:1%;" class="btnCls" onclick="updateOrder('${activity}','edit','outlet');" value="${activity}" />
									 
									 		</c:if>
					     				</c:forEach> 
									 </c:forEach>
								</c:if>
					        </c:if>
				           <c:if test="${flowUnder == 'warehouse'}">
	                			<c:if test="${orderDetails.orderStatus != 'Draft' && orderDetails.orderStatus != 'draft'}">
									 <c:forEach var="activity" items="${orderDetails.nextActivities}">
									 	<c:forEach var="accessControl" items="${sessionScope.warehouseSalesOrderActivity}">
									 		<c:if test="${activity == accessControl.appDocumentActivity}">
											 	<input type="button" style="margin-left:1%;" class="btnCls" onclick="updateOrder('${activity}','edit','outlet');" value="${activity}" />
									 		</c:if>
					     				</c:forEach> 
									 </c:forEach>
								</c:if>
				           </c:if>
				           <c:if test="${flowUnder == 'management'}">
	                			<c:if test="${orderDetails.orderStatus != 'Draft' && orderDetails.orderStatus != 'draft'}">
									 <c:forEach var="activity" items="${orderDetails.nextWorkFlowStates}"  varStatus="theCount">
									 	
									 	<c:choose>
											 	<c:when test="${theCount.count eq 1}">
													<input type="button"   style="margin-left:1%;" class="btnCls" onclick="updateOrder('${activity}','edit','outlet');" value="${activity}" />
											 	</c:when>
										<c:otherwise>
										 	<c:if test="${activity == 'Cancelled'}">
										 	<input type="button"  style="margin-left:1%;" class="btnCls" onclick="updateOrder('${activity}','edit','outlet');" value="${activity}" />
										 	</c:if>
										 	<c:if test="${activity != 'Cancelled'}">
										 	<%--<input type="button"  disabled="disabled"   style="margin-left:1%;background-color: #cccccc;" class="btnCls" onclick="updateOrder('${activity}','edit','outlet');" value="${activity}" /> --%>
										 	<input type="button"  style="margin-left:1%;" class="btnCls" onclick="updateOrder('${activity}','edit','outlet');" value="${activity}" />
										 	</c:if>
										</c:otherwise>
										</c:choose>
									 	
									 	
									 	<%-- <c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrderActivity}" >
									 		<c:if test="${activity == accessControl.appDocumentActivity}" >
											 		<c:out value="${theCount.count}"/>
											 	<input type="button"   style="margin-left:1%;" class="btnCls" onclick="updateOrder('${activity}','edit','outlet');" value="${activity}" />
											 	<c:choose>
											 	<c:when test="${theCount.count eq 1}">
											 	<input type="button"   style="margin-left:1%;" class="btnCls" onclick="updateOrder('${activity}','edit','outlet');" value="${activity}" />
											 	</c:when>
											 	<c:otherwise>
											 	<input type="button"  disabled="disabled"   style="margin-left:1%;background-color: #cccccc;" class="btnCls" onclick="updateOrder('${activity}','edit','outlet');" value="${activity}" />
											 	</c:otherwise>
						                     </c:choose>					 	
									 		</c:if>
					     				</c:forEach>  --%>
									 </c:forEach>
								</c:if> 
				           </c:if>
					      </c:if>
		      <input type="button" class="btnCls" style="margin-left: 1%;margin-right: 15px;" onclick="viewOrders('${status}','','0','${type}');" value="<spring:message code="back.label" />" />
		</div>
		<br/>
        <div class="box-footer">
        </div>
<!--          <input type="hidden" name="operation" value="orders">  -->
        </div>
<%--          <input type="hidden" name="maxRecords" value="${maxRecords}" id="maxRecords"/> --%>
      <input type="hidden" value="${searchName}" id="searchName"/>
      <input type="hidden" value="${maxRecords}" id="maxRecords"/>
       <input type="hidden" value="${orderChannelId}" id="orderChannelId"/>
       <input type="hidden" id="productsMenuFlag" value="false">
    </form>
   
    
</div>

<div id="menuItemsReplacediv">
<%@ include file="menuItemsPopup.jsp" %>
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
<div id="mapid" style="    display: none;"></div>
<div id="mapid1" style="    display: none;"></div>
<div id="mapid2" style="    display: none;"></div>
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
		    		 